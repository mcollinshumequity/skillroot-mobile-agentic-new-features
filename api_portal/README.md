# SkillROOT API Portal

A lightweight backend for the `tech_port` Flutter application.

## Prerequisites
- Node.js installed

## Quick Start
1. `cd api_portal`
2. `npm install` (if not already done)
3. `node index.js`

## Security
- All endpoints are protected by an `x-sr-api-key` header.
- User authentication is handled via **Firebase Authentication**.

## Endpoints (v1)
- `POST /v1/register.action`: Register a new user in Firebase.
- `POST /v1/authenticate.action`: Verify a Firebase ID Token.
- `GET /v1/job/history`: Protected route (requires `Authorization: Bearer <firebase_token>`).

## Testing with Flutter
- **Host**: `http://10.0.2.2:8080/v1` (Android Emulator) or `http://localhost:8080/v1` (iOS/Web).
- **Required Header**: `x-sr-api-key: [Your Portal API Key from .env]`
- **Required Header for Protected Routes**: `Authorization: Bearer [Firebase ID Token]`
