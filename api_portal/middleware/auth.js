import admin from '../config/firebase.js';

export const verifyToken = async (req, res, next) => {
  const authHeader = req.headers['authorization'];
  
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({
      success: false,
      message: 'Unauthorized: Missing or invalid Authorization Token.'
    });
  }

  const token = authHeader.split('Bearer ')[1];

  try {
    const decodedToken = await admin.auth().verifyIdToken(token);
    req.user = decodedToken;
    next();
  } catch (error) {
    console.error('[Auth Error] Invalid Firebase Token');
    return res.status(401).json({
      success: false,
      message: 'Unauthorized: Access token is invalid or expired.'
    });
  }
};
