@echo off
echo Starting Frontend Server...
cd frontend
start "Food Quality Frontend" cmd /k "npm run dev"
echo Frontend server starting on http://localhost:3000
echo.
echo Keep this window open!
