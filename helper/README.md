# SkillROOT Helper Scripts 🛠️

This directory contains utility scripts for maintaining the SkillROOT ecosystem. These scripts are designed for administrative use and handle cleanup tasks across both the MySQL database and GCP Identity Platform (Firebase).

## 🚀 Getting Started

### Prerequisites
- Node.js installed
- The `.env` file and Firebase service account JSON must be present in the `api_portal` directory.

### Installation
From this directory, run:
```bash
npm install
```

---

## 🔑 Extracting SHA Fingerprints (Android)

If you are seeing Firebase check errors (like reCAPTCHA or Google Sign-in issues), you need to add your local machine's SHA fingerprints to the Firebase Console.

### How to use:
1. Double-click `get-sha-keys.bat` in this folder.
2. It will output your local **SHA-1** and **SHA-256** keys.
3. Copy the keys and add them to your **Firebase Project Settings** under your Android app.

---

## 👤 User Deletion Script (`delete-user.js`)

This script performs a **hard delete** of a user from the entire SkillROOT system. It ensures data integrity by removing records from both the database and the authentication provider.

### What it does:
1.  **Firebase Auth:** Deletes the user from GCP Identity Platform.
2.  **MySQL Database:** Removes the corresponding record from the `sr_user_profiles` table using the `firebase_uid`.

### Usage

You can delete a user by their **Email address** or their **Firebase UID**.

#### Delete by Email:
```bash
node delete-user.js user@example.com
```

#### Delete by UID:
```bash
node delete-user.js jY8zXl2vWp9L0mN3rQ5t1S6u
```

### Safety Features
- **Validation:** Confirms the user exists in Firebase before attempting any deletion.
- **SSL Support:** Uses the secure connection settings required for Cloud SQL.
- **Environment Linking:** Automatically uses the configuration from `../api_portal/.env`.

---

> [!CAUTION]
> **This action is irreversible.** Deleting a user will permanently remove their profile data and authentication credentials.
