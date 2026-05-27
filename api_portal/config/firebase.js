import admin from 'firebase-admin';
import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';

dotenv.config();

/**
 * Firebase Admin Initialization
 * Supports:
 * 1. Local Development (using specific service account file)
 * 2. GCP Cloud Environments (using applicationDefault)
 */

const serviceAccountPath = process.env.FIREBASE_SERVICE_ACCOUNT || './humequity-idp-34d21aedb5e5.json';
const fullPath = path.resolve(serviceAccountPath);

let credential;

if (fs.existsSync(fullPath)) {
  console.log('[Firebase] Initializing with service account file:', serviceAccountPath);
  credential = admin.credential.cert(fullPath);
} else {
  // In GCP Cloud (App Engine, Cloud Run, etc.), this will automatically find the environment credentials
  console.log('[Firebase] Service account file not found. Falling back to applicationDefault (GCP Cloud environment)');
  credential = admin.credential.applicationDefault();
}

try {
  admin.initializeApp({ credential });
  console.log('[Firebase] Admin SDK Initialized successfully');
} catch (error) {
  console.error('[Firebase Error] Failed to initialize Admin SDK:', error.message);
}

export default admin;
