@echo off
setlocal enabledelayedexpansion

set KEYTOOL_CMD=keytool
set KEYSTORE_PATH=%USERPROFILE%\.android\debug.keystore

echo ========================================================
echo   Android Debug SHA Fingerprint Tool
echo ========================================================
echo.

:: Check if keytool is in PATH
where %KEYTOOL_CMD% >nul 2>&1
if %errorlevel% neq 0 (
    set FOUND=0
    :: Check Java Home
    if defined JAVA_HOME if exist "%JAVA_HOME%\bin\keytool.exe" (
        set "KEYTOOL_CMD=%JAVA_HOME%\bin\keytool.exe"
        set FOUND=1
    )
    
    :: Check Android Studio JBR (Modern)
    if !FOUND! equ 0 if exist "C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe" (
        set "KEYTOOL_CMD=C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe"
        set FOUND=1
    )
    
    :: Check Android Studio JRE (Old)
    if !FOUND! equ 0 if exist "C:\Program Files\Android\Android Studio\jre\bin\keytool.exe" (
        set "KEYTOOL_CMD=C:\Program Files\Android\Android Studio\jre\bin\keytool.exe"
        set FOUND=1
    )
    
    :: Check Default Java Path
    if !FOUND! equ 0 (
        for /d %%i in ("C:\Program Files\Java\jdk*") do (
            if exist "%%i\bin\keytool.exe" (
                set "KEYTOOL_CMD=%%i\bin\keytool.exe"
                set FOUND=1
            )
        )
    )

    if !FOUND! equ 0 (
        echo [ERROR] keytool.exe could not be found. 
        echo Please ensure Android Studio or JDK is installed.
        echo.
        echo You can also try running this command in your project's android folder:
        echo   ./gradlew signingReport
        echo.
        pause
        exit /b 1
    )
)

:found_keytool
if not exist "%KEYSTORE_PATH%" (
    echo [ERROR] Debug keystore not found at: %KEYSTORE_PATH%
    echo Please make sure you have run the Flutter app at least once 
    echo or installed Android Studio.
    echo.
    pause
    exit /b 1
)

echo [INFO] Extracting fingerprints using: !KEYTOOL_CMD!
echo.

"!KEYTOOL_CMD!" -list -v -keystore "%KEYSTORE_PATH%" -alias androiddebugkey -storepass android -keypass android

echo.
echo ========================================================
echo   NEXT STEPS:
echo   1. Copy the SHA-1 or SHA-256 string from above.
echo   2. Go to Firebase Console ^> Project Settings.
echo   3. Select your Android App.
echo   4. Click "Add Fingerprint" and paste the key.
echo   5. Download the new google-services.json if necessary.
echo ========================================================
echo.

pause
