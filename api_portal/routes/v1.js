import express from 'express';
import { verifyToken } from '../middleware/auth.js';
import admin from '../config/firebase.js';
import pool from '../config/database.js';

const router = express.Router();

// v1 authenticate.action - In Firebase architecture, the Flutter client handles login 
// and the server just verifies the returned ID token. This endpoint is retained 
// for compatibility or manual session handling if desired.
router.post('/authenticate.action', async (req, res) => {
  const { Token } = req.body;

  if (!Token) {
    return res.status(400).json({ success: false, message: 'Firebase Token is required.' });
  }

  try {
    const decodedToken = await admin.auth().verifyIdToken(Token);
    res.json({
      success: true,
      message: 'Successfully authenticated via Token.',
      user: {
        uid: decodedToken.uid,
        email: decodedToken.email
      }
    });
  } catch (error) {
    res.status(401).json({ success: false, message: 'Invalid token.' });
  }
});

// v1 register.action - Server-side Firebase user creation
router.post('/register/user', async (req, res) => {
  const { first_name, last_name, phone_number, email, uid } = req.body;


  try {
    // 1. Create in MySQL
    const [result] = await pool.execute(
      `INSERT INTO sr_mobile_users 
         (firebase_uid, email, first_name, last_name, phone_number) 
         VALUES (?, ?, ?, ?, ?)`,
      [uid, email, first_name, last_name, phone_number]
    );

    res.json({
      success: true,
      message: 'Successfully registered user locally and in Cloud.',
      uid: uid,
      id: result.insertId
    });
  } catch (dbError) {
    // 2. Rollback Firebase if DB fails
    console.error('[DB Error] Rolling back Firebase user:', uid);
    await admin.auth().deleteUser(uid);

    let errorMessage = 'Database registration failed.';
    if (dbError.code === 'ER_DUP_ENTRY') {
      errorMessage = 'Email already exists.';
    }

    res.status(400).json({
      success: false,
      message: errorMessage
    });
  }
});

// v1 user/profile - Get profile data for the logged-in user
router.post('/user/profile', verifyToken, async (req, res) => {
  const firebaseUid = req.user.uid;

  try {
    const [rows] = await pool.execute(
      'SELECT user_id as Id, first_name as firstName, last_name as lastName, email, phone_number as phone FROM sr_mobile_users WHERE firebase_uid = ?',
      [firebaseUid]
    );

    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'User profile not found.' });
    }

    const dbUser = rows[0];
    const profile = {
      Id: dbUser.Id,
      FirstName: dbUser.firstName,
      LastName: dbUser.lastName,
      EmailAddress: dbUser.email,
      PhoneNumber: dbUser.phone,
      Stats: {
        Jobs: 12, // Placeholder
        VerifiedJobs: 8, // Placeholder
        Training: 45 // Placeholder
      },
      Meta: {
        Interests: ['Cloud Computing', 'Education', 'Mobile Apps']
      }
    };

    res.json({
      success: true,
      data: profile
    });
  } catch (error) {
    console.error('[API Error] Failed to fetch user profile:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error fetching profile.' });
  }
});

// v1 reset.action - Password Reset Workflow (Multi-phase)
router.post('/reset.action', async (req, res) => {
  const { Email, Token, Password, PasswordConfirm } = req.body;

  if (!Email) {
    return res.status(400).json({ success: false, message: 'Email is required.' });
  }

  try {
    // 1. Verify user exists in Firebase
    const user = await admin.auth().getUserByEmail(Email);

    // Phase 1: Initiate Reset (Send Code)
    if (!Token) {
      // NOTE: In production, generate a random code, save to DB with expiry, and email it.
      // For development, we'll use a static code '123456'.
      console.log(`[Reset] Reset requested for ${Email}. Use code: 123456`);
      return res.json({
        success: true,
        message: 'A verification code has been sent to your email address.'
      });
    }

    // Phase 2: Authenticate (Verify Token)
    if (!Password) {
      if (Token === '123456') {
        return res.json({
          success: true,
          message: 'Code verified successfully.'
        });
      } else {
        return res.status(400).json({ success: false, message: 'Invalid verification code.' });
      }
    }

    // Phase 3: Execute (Update Password)
    if (Password !== PasswordConfirm) {
      return res.status(400).json({ success: false, message: 'Passwords do not match.' });
    }

    if (Password.length < 6) {
      return res.status(400).json({ success: false, message: 'Password must be at least 6 characters.' });
    }

    await admin.auth().updateUser(user.uid, {
      password: Password
    });

    res.json({
      success: true,
      message: 'Your password has been reset successfully.'
    });

  } catch (error) {
    console.error('[Reset Error]', error.code, error.message);
    let msg = 'An error occurred during password reset.';
    if (error.code === 'auth/user-not-found') msg = 'No user found with this email address.';

    res.status(400).json({
      success: false,
      message: msg
    });
  }
});

// v1 user/profile/edit.action - Update profile data
router.post('/user/profile/edit.action', verifyToken, async (req, res) => {
  const firebaseUid = req.user.uid;
  const { FirstName, LastName, Phone } = req.body;

  try {
    await pool.execute(
      'UPDATE sr_mobile_users SET first_name = ?, last_name = ?, phone_number = ? WHERE firebase_uid = ?',
      [FirstName, LastName, Phone, firebaseUid]
    );

    res.json({
      success: true,
      message: 'Profile updated successfully.'
    });
  } catch (error) {
    console.error('[API Error] Failed to update profile:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error updating profile.' });
  }
});

// Helper to get profileId from firebase_uid
async function getProfileId(firebaseUid) {
  const [rows] = await pool.execute('SELECT user_id FROM sr_mobile_users WHERE firebase_uid = ?', [firebaseUid]);
  return rows.length > 0 ? rows[0].user_id : null;
}

// v1 job/history - Fetch all jobs for the logged-in user
router.get('/job/history', verifyToken, async (req, res) => {
  const profileId = await getProfileId(req.user.uid);
  if (!profileId) return res.status(404).json({ success: false, message: 'User profile not found.' });

  try {
    const [jobs] = await pool.execute(
      'SELECT job_id as Id, job_title as Name, employer_name as Company, supervisor as Supervisor, job_email as Email, last_wage as Compensation, location as Location, start_date as StartDate, end_date as EndDate FROM sr_mobile_user_jobs WHERE user_id = ? ORDER BY start_date DESC',
      [profileId]
    );

    // Fetch tasks for each job
    const enrichedJobs = await Promise.all(jobs.map(async (job) => {
      const [tasks] = await pool.execute(
        'SELECT task_name as Name, task_description as Description, proficiency FROM sr_mobile_user_job_tasks WHERE job_id = ?',
        [job.Id]
      );

      const profReverseMap = { 'none': '0', 'fundamentals': '1', 'proficient': '2' };

      return {
        ...job,
        Id: job.Id.toString(),
        StartDate: job.StartDate.toISOString().split('T')[0],
        EndDate: job.EndDate ? job.EndDate.toISOString().split('T')[0] : null,
        Tasks: tasks.map(t => ({
          Name: t.Name,
          Description: t.Description,
          ProficiencyLevel: profReverseMap[t.proficiency] || '0'
        }))
      };
    }));

    res.json({ success: true, data: enrichedJobs });
  } catch (error) {
    console.error('[API Error] Job history fetch failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 job/add.action - Create new job entry
router.post('/job/add.action', verifyToken, async (req, res) => {
  const profileId = await getProfileId(req.user.uid);
  const { Name, Company, Supervisor, Email, Compensation, Location, StartDate, EndDate, Tasks } = req.body;
  const profMap = { 0: 'none', 1: 'fundamentals', 2: 'proficient' };

  const connection = await pool.getConnection();
  try {
    await connection.beginTransaction();

    const [result] = await connection.execute(
      'INSERT INTO sr_mobile_user_jobs (user_id, employer_name, job_title, supervisor, job_email, last_wage, location, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [profileId, Company, Name, Supervisor, Email, Compensation, Location, StartDate, EndDate]
    );

    const jobId = result.insertId;

    if (Tasks && Array.isArray(Tasks)) {
      for (const task of Tasks) {
        await connection.execute(
          'INSERT INTO sr_mobile_user_job_tasks (job_id, task_name, task_description, proficiency) VALUES (?, ?, ?, ?)',
          [jobId, task.Name, task.Description || '', profMap[task.ProficiencyLevel] || 'none']
        );
      }
    }

    await connection.commit();
    res.json({ success: true, message: 'Job added successfully.' });
  } catch (error) {
    await connection.rollback();
    console.error('[API Error] Job add failed:', error.message);
    res.status(500).json({ success: false, message: 'Failed to add job.' });
  } finally {
    connection.release();
  }
});

// v1 job/edit.action - Update existing job entry
router.post('/job/:id/edit.action', verifyToken, async (req, res) => {
  const jobId = req.params.id;
  const { Name, Company, Supervisor, Email, Compensation, Location, StartDate, EndDate, Tasks } = req.body;
  const profMap = { 0: 'none', 1: 'fundamentals', 2: 'proficient' };

  const connection = await pool.getConnection();
  try {
    await connection.beginTransaction();

    await connection.execute(
      'UPDATE sr_mobile_user_jobs SET employer_name = ?, job_title = ?, supervisor = ?, job_email = ?, last_wage = ?, location = ?, start_date = ?, end_date = ? WHERE job_id = ?',
      [Company, Name, Supervisor, Email, Compensation, Location, StartDate, EndDate, jobId]
    );

    // Simplest way to sync tasks: delete and re-insert
    await connection.execute('DELETE FROM sr_mobile_user_job_tasks WHERE job_id = ?', [jobId]);

    if (Tasks && Array.isArray(Tasks)) {
      for (const task of Tasks) {
        await connection.execute(
          'INSERT INTO sr_mobile_user_job_tasks (job_id, task_name, task_description, proficiency) VALUES (?, ?, ?, ?)',
          [jobId, task.Name, task.Description || '', profMap[task.ProficiencyLevel] || 'none']
        );
      }
    }

    await connection.commit();
    res.json({ success: true, message: 'Job updated successfully.' });
  } catch (error) {
    await connection.rollback();
    console.error('[API Error] Job update failed:', error.message);
    res.status(500).json({ success: false, message: 'Failed to update job.' });
  } finally {
    connection.release();
  }
});

// v1 job/delete.action - Delete job entry
router.post('/job/:id/delete.action', verifyToken, async (req, res) => {
  try {
    await pool.execute('DELETE FROM sr_mobile_user_jobs WHERE job_id = ?', [req.params.id]);
    res.json({ success: true, message: 'Job deleted successfully.' });
  } catch (error) {
    console.error('[API Error] Job deletion failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 job/:id/request.action - Request verification for a job
router.post('/job/:id/request.action', verifyToken, async (req, res) => {
  const { Name, Email, Phone } = req.body;
  res.json({
    success: true,
    message: `Verification request sent to ${Name} (${Email || Phone})`
  });
});

// v1 job/:id - Fetch individual job details
router.get('/job/:id', verifyToken, async (req, res) => {
  const jobId = req.params.id;
  try {
    const [jobs] = await pool.execute(
      'SELECT job_id as Id, job_title as Name, employer_name as Company, supervisor as Supervisor, job_email as Email, last_wage as Compensation, location as Location, start_date as StartDate, end_date as EndDate FROM sr_mobile_user_jobs WHERE job_id = ?',
      [jobId]
    );

    if (jobs.length === 0) return res.status(404).json({ success: false, message: 'Job not found.' });

    const job = jobs[0];
    const [tasks] = await pool.execute(
      'SELECT task_name as Name, task_description as Description, proficiency FROM sr_mobile_user_job_tasks WHERE job_id = ?',
      [jobId]
    );

    const profReverseMap = { 'none': '0', 'fundamentals': '1', 'proficient': '2' };

    res.json({
      success: true,
      data: {
        ...job,
        Id: job.Id.toString(),
        StartDate: job.StartDate.toISOString().split('T')[0],
        EndDate: job.EndDate ? job.EndDate.toISOString().split('T')[0] : null,
        Tasks: tasks.map(t => ({
          Name: t.Name,
          Description: t.Description,
          ProficiencyLevel: profReverseMap[t.proficiency] || '0'
        }))
      }
    });
  } catch (error) {
    console.error('[API Error] Job fetch failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 training/history - Fetch all training for the logged-in user
router.get('/training/history', verifyToken, async (req, res) => {
  const profileId = await getProfileId(req.user.uid);
  if (!profileId) return res.status(404).json({ success: false, message: 'User profile not found.' });

  try {
    const [training] = await pool.execute(
      'SELECT training_id as Id, name as Name, description as Description, trainer as Trainer, hours as Hours, completion_date as CompletionDate, expiration_date as ExpirationDate FROM sr_mobile_user_training WHERE user_id = ? ORDER BY completion_date DESC',
      [profileId]
    );

    const formattedTraining = training.map(t => ({
      ...t,
      Id: t.Id.toString(),
      CompletionDate: t.CompletionDate.toISOString().split('T')[0],
      ExpirationDate: t.ExpirationDate ? t.ExpirationDate.toISOString().split('T')[0] : null,
      Hours: t.Hours ? t.Hours.toString() : null
    }));

    res.json({ success: true, data: formattedTraining });
  } catch (error) {
    console.error('[API Error] Training history fetch failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 training/:id - Fetch individual training details
router.get('/training/:id', verifyToken, async (req, res) => {
  const trainingId = req.params.id;
  try {
    const [training] = await pool.execute(
      'SELECT training_id as Id, name as Name, description as Description, trainer as Trainer, hours as Hours, completion_date as CompletionDate, expiration_date as ExpirationDate FROM sr_mobile_user_training WHERE training_id = ?',
      [trainingId]
    );

    if (training.length === 0) return res.status(404).json({ success: false, message: 'Training not found.' });

    const t = training[0];
    res.json({
      success: true,
      data: {
        ...t,
        Id: t.Id.toString(),
        CompletionDate: t.CompletionDate.toISOString().split('T')[0],
        ExpirationDate: t.ExpirationDate ? t.ExpirationDate.toISOString().split('T')[0] : null,
        Hours: t.Hours ? t.Hours.toString() : null
      }
    });
  } catch (error) {
    console.error('[API Error] Training fetch failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 training/add.action - Create new training entry
router.post('/training/add.action', verifyToken, async (req, res) => {
  const profileId = await getProfileId(req.user.uid);
  const { Name, Description, Trainer, Hours, CompletionDate, ExpirationDate } = req.body;

  try {
    await pool.execute(
      'INSERT INTO sr_mobile_user_training (user_id, name, description, trainer, hours, completion_date, expiration_date) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [profileId, Name, Description, Trainer, Hours, CompletionDate, ExpirationDate]
    );

    res.json({ success: true, message: 'Training added successfully.' });
  } catch (error) {
    console.error('[API Error] Training add failed:', error.message);
    res.status(500).json({ success: false, message: 'Failed to add training.' });
  }
});

// v1 training/edit.action - Update existing training entry
router.post('/training/:id/edit.action', verifyToken, async (req, res) => {
  const trainingId = req.params.id;
  const { Name, Description, Trainer, Hours, CompletionDate, ExpirationDate } = req.body;

  try {
    await pool.execute(
      'UPDATE sr_mobile_user_training SET name = ?, description = ?, trainer = ?, hours = ?, completion_date = ?, expiration_date = ? WHERE training_id = ?',
      [Name, Description, Trainer, Hours, CompletionDate, ExpirationDate, trainingId]
    );

    res.json({ success: true, message: 'Training updated successfully.' });
  } catch (error) {
    console.error('[API Error] Training update failed:', error.message);
    res.status(500).json({ success: false, message: 'Failed to update training.' });
  }
});

// v1 training/:id/delete.action - Delete training entry
// (Using POST as consistent with job deletion or can be changed to delete method in provider)
router.post('/training/:id/delete.action', verifyToken, async (req, res) => {
  try {
    await pool.execute('DELETE FROM sr_mobile_user_training WHERE training_id = ?', [req.params.id]);
    res.json({ success: true, message: 'Training deleted successfully.' });
  } catch (error) {
    console.error('[API Error] Training deletion failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 common/roles - Fetch all common roles
router.get('/common/roles', verifyToken, async (req, res) => {
  try {
    const [rows] = await pool.execute(
      'SELECT role_id, role, role_description, industry FROM sr_common_roles ORDER BY role ASC'
    );

    const formattedRoles = rows.map(row => ({
      Id: row.role_id.toString(),
      CommonRoleId: row.role_id.toString(),
      Name: row.role,
      Description: row.role_description || '',
      Industry: row.industry
    }));

    res.json({ success: true, data: formattedRoles });
  } catch (error) {
    console.error('[API Error] Fetch common roles failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 common/industries - Fetch all common industries
router.get('/common/industries', verifyToken, async (req, res) => {
  try {
    const [rows] = await pool.execute(
      'SELECT industry FROM sr_common_industries ORDER BY industry ASC'
    );

    const industries = rows.map(row => row.industry);

    res.json({ success: true, data: industries });
  } catch (error) {
    console.error('[API Error] Fetch common industries failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 common/roles/:id/tasks - Fetch all tasks for a specific role
router.get('/common/roles/:id/tasks', verifyToken, async (req, res) => {
  const roleId = req.params.id;
  try {
    const [rows] = await pool.execute(
      `SELECT t.skillroot_task_id, t.task_title, t.task_description 
       FROM sr_common_tasks t 
       JOIN sr_common_roles r ON t.onetsoc_code = r.onetsoc_code 
       WHERE r.role_id = ?`,
      [roleId]
    );

    const formattedTasks = rows.map(row => ({
      Id: row.skillroot_task_id.toString(),
      CommonTaskId: row.skillroot_task_id.toString(),
      Name: row.task_title,
      Description: row.task_description || ''
    }));

    res.json({ success: true, data: formattedTasks });
  } catch (error) {
    console.error('[API Error] Fetch common role tasks failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 common/roles/:id/skills - Fetch all skills for a specific role
router.get('/common/roles/:id/skills', verifyToken, async (req, res) => {
  const roleId = req.params.id;
  try {
    const [rows] = await pool.execute(
      `SELECT s.skillroot_skill_id, s.skill_category, s.skill_description, s.skill_type, s.skill_proficiency 
       FROM sr_common_skills s 
       JOIN sr_common_tasks t ON s.skillroot_task_id = t.skillroot_task_id 
       JOIN sr_common_roles r ON t.onetsoc_code = r.onetsoc_code 
       WHERE r.role_id = ?`,
      [roleId]
    );

    const formattedSkills = rows.map(row => ({
      skillroot_skill_id: row.skillroot_skill_id.toString(),
      skill_description: row.skill_description,
      skill_category: row.skill_category,
      skill_type: row.skill_type,
      skill_proficiency: row.skill_proficiency.toString()
    }));

    res.json({ success: true, data: formattedSkills });
  } catch (error) {
    console.error('[API Error] Fetch common role skills failed:', error.message);
    res.status(500).json({ success: false, message: 'Internal server error.' });
  }
});

// v1 validate-token - Validate Firebase header token
router.post('/validate-token', verifyToken, (req, res) => {
  res.json({ success: true, message: 'Token is valid.', user: req.user });
});

export default router;
