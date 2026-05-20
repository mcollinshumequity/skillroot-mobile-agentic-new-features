# SkillROOT Mobile Agentic Platform

Welcome to the root workspace for the **SkillROOT Mobile** platform by Humequity. This repository contains the core services and applications that power the workforce intelligence and skills tracking ecosystem.

## Project Architecture

The SkillROOT ecosystem is built on a modern, decoupled architecture designed for scalability, consisting of a mobile front-end, a robust Node.js API, and AI-driven intelligence services.

### 1. Mobile Application (`/mobile`)
The primary user-facing application built with **Flutter**. 
- **Features**: Job History tracking, Skills Bank Explorer, Badges Module, and Profile Management.
- **State & Routing**: Utilizes `Provider` for state management and `GetX` for routing.
- **UI/UX**: Strictly adheres to the design tokens outlined in the `helper/DESIGN.md` (or `mobile/DESIGN.md`), utilizing the *Urbanist* font and a consistent Light/Dark mode brand palette.
- **Auth**: Uses a hybrid authentication flow, authenticating locally via Firebase Auth and passing ID Tokens to the backend for verified API access.

### 2. API Portal (`/api_portal`)
The core backend service providing RESTful APIs for the platform.
- **Tech Stack**: Node.js & Express.
- **Features**: User registration sync, token validation (`/v1/validate-token`), metadata lookups (industries, roles, tasks), and secure database connections.
- **Database**: Integrates with Google Cloud SQL (MySQL).
- **Security**: All protected routes enforce authentication via a `verifyToken` middleware that validates Firebase Bearer tokens.

### 3. AI & Data Intelligence (Rooty RAG)
The platform integrates an advanced RAG (Retrieval-Augmented Generation) pipeline known as **Rooty**.
- Includes an AI-powered Admin Dashboard with ECharts visualizations.
- Leverages an Open WebUI API gateway for secure workforce intelligence data querying.

### 4. Helper Scripts & Configuration (`/helper`)
This directory acts as a central repository for utility scripts, administrative tools, and global project documentation.
- **Documentation**: Houses global reference materials like the `DESIGN.md` file, which dictates UI/UX guidelines and design tokens (colors, typography) for use across the platform.
- **Utility Scripts**: Contains scripts for routine or administrative tasks, such as obtaining Android SHA keys (`get-sha-keys.bat`) and performing direct user deletion tasks (`delete-user.js`).

## New Developer Setup

Follow these steps to configure your local environment and get the project up and running.

### 1. Prerequisites
Ensure you have the following installed on your machine:
- **Node.js** (v18+ recommended)
- **Flutter SDK** & Dart
- **Android Studio** (for Android emulation) or **Xcode** (for iOS simulator)
- **Firebase CLI** (`npm install -g firebase-tools`)

### 2. External Configuration Files (Required)
Since sensitive files are ignored by source control, you will need to manually obtain or generate the following:
- **`api_portal/.env`**: The backend environment variables. You must obtain this file from a team member. It contains your Cloud SQL MySQL database connection strings, JWT secrets, and Rooty API keys.
- **`mobile/android/app/src/main/google-services.json`** & **`mobile/ios/Runner/GoogleService-Info.plist`**: Firebase configuration files for native builds. You can generate these by running `flutterfire configure` if you have Firebase access, or request them from the lead developer.
- **`mobile/android/key.properties`**: Required only if you intend to build and sign Android release APKs/AABs.

### 3. Install Dependencies
Run the package managers for each respective project module:
```bash
# Install backend dependencies
cd api_portal
npm install

# Install helper dependencies
cd ../helper
npm install

# Install mobile dependencies
cd ../mobile
flutter pub get
```

### 4. Firebase Authentication
Authenticate your local CLI with Firebase using an authorized team account (e.g., `xxxxx@humequity.com`).
```bash
firebase login
```
If you are missing `lib/firebase_options.dart` in the mobile app, regenerate it via:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
*(Select the `humequity-idp` project when prompted).*

### 5. Running the Application
To streamline the development process, a batch script is provided to spin up the local development environments simultaneously. From the root directory, run:

```bash
start_all.bat
```

This script will automatically:
1. Open a terminal and start the **API Portal** (`npm run serve`).
2. Open a second terminal and launch the **Flutter Mobile App** (`flutter run`).

## AI Agent & MCP Integrations

This project is actively developed and maintained utilizing AI agents connected via the **Model Context Protocol (MCP)**. To leverage the full suite of AI-assisted capabilities, ensure the following MCP servers are configured in your agent's environment:

1. **Dart MCP Server (`dart-mcp-server`)**
   - **Purpose**: Connects to the Dart Tooling Daemon and running applications. It allows the AI agent to perform hot reloads, run tests, format code, and retrieve widget trees natively.
   
2. **Firebase MCP Server (`firebase-mcp-server`)**
   - **Purpose**: Grants the AI agent the ability to manage the Firebase project, execute deployments, retrieve environments and configurations, and query developer knowledge regarding Firebase integrations.
   
3. **Stitch MCP Server (`StitchMCP`)**
   - **Purpose**: Ensures UI/UX consistency and facilitates design generation. It allows the agent to create, list, and apply design systems (referencing `DESIGN.md`), as well as generate and edit screen variants directly.

4. **Cloud SQL for MySQL MCP Server (`cloud-sql-mysql`)**
   - **Purpose**: Enables the AI agent to interact directly with the Google Cloud SQL MySQL database. This allows for automated querying, schema management, system metric fetching, and test data mocking during backend development.

## Directory Structure

```text
c:\Projects\technicate\
├── api_portal/       # Express.js backend API and route definitions
├── helper/           # Helper scripts and global documentation (e.g., DESIGN.md)
├── mobile/           # Flutter source code for the SkillROOT app
├── .vscode/          # VS Code workspace settings and launch configurations
├── start_all.bat     # Windows batch script to launch the dev servers
└── README.md         # This file
```

## Security & Authentication

- The application uses Firebase as its Identity Provider (IDP).
- **Registration**: Users created via the mobile app trigger a sync with the `api_portal` to keep the MySQL database updated.
- **API Access**: The mobile app intercepts all requests to append the Firebase ID token as a Bearer token in the `Authorization` header.

*For specific mobile design implementations, please refer to the `DESIGN.md` documentation.*
# skillroot-mobile-agentic-new-features
