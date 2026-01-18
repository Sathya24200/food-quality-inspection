@echo off
echo ============================================
echo Food Quality Inspection System - Setup
echo ============================================
echo.

echo Checking prerequisites...
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js is NOT installed!
    echo.
    echo Please install Node.js first:
    echo 1. Visit: https://nodejs.org/
    echo 2. Download the LTS version
    echo 3. Run the installer
    echo 4. Restart this script
    echo.
    pause
    exit /b 1
)

REM Check if npm is installed
where npm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] npm is NOT installed!
    echo.
    echo npm should come with Node.js. Please reinstall Node.js.
    pause
    exit /b 1
)

echo [OK] Node.js is installed
node --version
echo [OK] npm is installed
npm --version
echo.

REM Check if MongoDB is installed
where mongod >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] MongoDB is NOT installed or not in PATH!
    echo.
    echo Please install MongoDB:
    echo 1. Visit: https://www.mongodb.com/try/download/community
    echo 2. Download and install
    echo 3. Make sure it's installed as a Windows Service
    echo.
    echo The application will still install, but won't run without MongoDB.
    echo.
) else (
    echo [OK] MongoDB is installed
    mongod --version
    echo.
)

echo ============================================
echo Installing Backend Dependencies...
echo ============================================
cd backend
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Backend installation failed!
    pause
    exit /b 1
)
echo [OK] Backend dependencies installed
cd ..
echo.

echo ============================================
echo Installing Frontend Dependencies...
echo ============================================
cd frontend
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Frontend installation failed!
    pause
    exit /b 1
)
echo [OK] Frontend dependencies installed
cd ..
echo.

echo ============================================
echo Installation Complete!
echo ============================================
echo.
echo Next steps:
echo 1. Make sure MongoDB is running
echo 2. Run: start-backend.bat
echo 3. Run: start-frontend.bat
echo 4. Open: http://localhost:3000
echo.
echo Or simply run: start-all.bat
echo.
pause
