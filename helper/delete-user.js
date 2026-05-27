import admin from 'firebase-admin';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Load environment from api_portal
const envPath = path.resolve(__dirname, '../api_portal/.env');
dotenv.config({ path: envPath });

const identifier = process.argv[2];

if (!identifier) {
    console.error('Usage: node delete-user.js <email_or_uid>');
    process.exit(1);
}

// Firebase Initialization
const serviceAccountPath = process.env.FIREBASE_SERVICE_ACCOUNT || path.resolve(__dirname, '../api_portal/humequity-idp-34d21aedb5e5.json');

if (!fs.existsSync(serviceAccountPath)) {
    console.error(`Firebase service account file not found at: ${serviceAccountPath}`);
    process.exit(1);
}

admin.initializeApp({
    credential: admin.credential.cert(serviceAccountPath)
});

async function run() {
    let connection;
    try {
        console.log(`[Helper] Attempting to delete user: ${identifier}`);

        // 1. Find user in Firebase
        let userRecord;
        try {
            if (identifier.includes('@')) {
                userRecord = await admin.auth().getUserByEmail(identifier);
            } else {
                userRecord = await admin.auth().getUser(identifier);
            }
        } catch (error) {
            console.error(`[Firebase] User not found: ${error.message}`);
            process.exit(1);
        }

        const uid = userRecord.uid;
        console.log(`[Firebase] Found User: ${uid} (${userRecord.email})`);

        // 2. Delete from MySQL
        connection = await mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_DATABASE,
            port: process.env.DB_PORT || 3306,
            ssl: { rejectUnauthorized: false }
        });

        console.log('[MySQL] Connected to database');
        const [result] = await connection.execute(
            'DELETE FROM sr_user_profiles WHERE firebase_uid = ?',
            [uid]
        );

        console.log(`[MySQL] Deleted ${result.affectedRows} record(s) from sr_user_profiles`);

        // 3. Delete from Firebase
        await admin.auth().deleteUser(uid);
        console.log('[Firebase] User account deleted successfully');

        console.log('\n[SUCCESS] User totally removed from SkillROOT system.');

    } catch (error) {
        console.error('\n[ERROR] Operation failed:', error.message);
    } finally {
        if (connection) await connection.end();
        process.exit(0);
    }
}

run();
