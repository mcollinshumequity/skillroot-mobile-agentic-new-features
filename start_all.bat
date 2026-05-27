@echo off
echo ==========================================
echo Starting Technicate Skillroot Projects
echo ==========================================

echo [1/2] Starting API Portal...
start "API Portal" cmd /k "cd api_portal && npm run serve"

echo.
echo [2/2] Starting Flutter App...
start "Flutter App" cmd /k "cd mobile && flutter run"

echo.
echo Both projects are starting in separate windows.
echo.
pause
