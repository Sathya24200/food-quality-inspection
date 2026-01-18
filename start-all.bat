@echo off
echo ============================================
echo Food Quality Inspection System
echo Starting All Services...
echo ============================================
echo.

REM Check if MongoDB service is running
sc query MongoDB | find "RUNNING" >nul
if %ERRORLEVEL% NEQ 0 (
    echo Starting MongoDB service...
    net start MongoDB
    if %ERRORLEVEL% NEQ 0 (
        echo [WARNING] Could not start MongoDB service
        echo Please start MongoDB manually or run 'mongod' in a separate terminal
        echo.
    )
) else (
    echo [OK] MongoDB is already running
)

echo.
echo Starting Backend Server (Port 5000)...
cd backend
start "Food Quality Backend" cmd /k "npm start"
timeout /t 3 /nobreak >nul

echo.
echo Starting Frontend Server (Port 3000)...
cd ..\frontend
start "Food Quality Frontend" cmd /k "npm run dev"

echo.
echo ============================================
echo All Services Started!
echo ============================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Opening application in browser...
timeout /t 5 /nobreak >nul
start http://localhost:3000
echo.
echo Press any key to close this window...
echo (Keep the Backend and Frontend windows open!)
pause >nul
