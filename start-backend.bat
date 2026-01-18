@echo off
echo Starting Backend Server...
cd backend
start "Food Quality Backend" cmd /k "npm start"
echo Backend server starting on http://localhost:5000
echo.
echo Keep this window open!
