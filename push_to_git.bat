@echo off
echo ========================================================
echo Git Setup and Push Script
echo ========================================================
echo.
echo NOTE: You must have Git installed for this to work.
echo If you haven't installed it yet, download it from:
echo https://git-scm.com/downloads
echo.
pause

echo.
echo 1. Initializing repository...
call git init

echo.
echo 2. Adding files...
call git add .

echo.
echo 3. Committing changes...
call git commit -m "Initial launch: Food Quality Inspection System"

echo.
echo 4. Setting branch to main...
call git branch -M main

echo.
echo 5. Configuring remote repository...
REM Remove origin if it exists to avoid errors on re-run
call git remote remove origin 2>nul
call git remote add origin https://github.com/Sathya24200/food-quality-inspection.git

echo.
echo 6. Pushing to GitHub...
call git push -u origin main

echo.
echo ========================================================
echo Done! If you saw errors above, please check if Git is installed.
echo ========================================================
pause
