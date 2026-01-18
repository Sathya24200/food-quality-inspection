@echo off
echo ============================================
echo Installation Diagnostic Tool
echo ============================================
echo.

echo Checking Node.js installation...
echo.

REM Check common Node.js installation paths
if exist "C:\Program Files\nodejs\node.exe" (
    echo [FOUND] Node.js at: C:\Program Files\nodejs\
    "C:\Program Files\nodejs\node.exe" --version
    echo.
) else if exist "C:\Program Files (x86)\nodejs\node.exe" (
    echo [FOUND] Node.js at: C:\Program Files ^(x86^)\nodejs\
    "C:\Program Files (x86)\nodejs\node.exe" --version
    echo.
) else (
    echo [NOT FOUND] Node.js is not installed in standard locations
    echo.
    echo Please install Node.js from: https://nodejs.org/
    echo Download the LTS version and run the installer
    echo.
)

echo Checking npm installation...
echo.

if exist "C:\Program Files\nodejs\npm.cmd" (
    echo [FOUND] npm at: C:\Program Files\nodejs\
    "C:\Program Files\nodejs\npm.cmd" --version
    echo.
) else if exist "C:\Program Files (x86)\nodejs\npm.cmd" (
    echo [FOUND] npm at: C:\Program Files ^(x86^)\nodejs\
    "C:\Program Files (x86)\nodejs\npm.cmd" --version
    echo.
) else (
    echo [NOT FOUND] npm is not installed
    echo.
)

echo Checking MongoDB installation...
echo.

if exist "C:\Program Files\MongoDB\Server\7.0\bin\mongod.exe" (
    echo [FOUND] MongoDB 7.0 at: C:\Program Files\MongoDB\Server\7.0\
    "C:\Program Files\MongoDB\Server\7.0\bin\mongod.exe" --version
    echo.
) else if exist "C:\Program Files\MongoDB\Server\6.0\bin\mongod.exe" (
    echo [FOUND] MongoDB 6.0 at: C:\Program Files\MongoDB\Server\6.0\
    "C:\Program Files\MongoDB\Server\6.0\bin\mongod.exe" --version
    echo.
) else if exist "C:\Program Files\MongoDB\Server\5.0\bin\mongod.exe" (
    echo [FOUND] MongoDB 5.0 at: C:\Program Files\MongoDB\Server\5.0\
    "C:\Program Files\MongoDB\Server\5.0\bin\mongod.exe" --version
    echo.
) else (
    echo [NOT FOUND] MongoDB is not installed in standard locations
    echo.
    echo Please install MongoDB from: https://www.mongodb.com/try/download/community
    echo.
)

echo ============================================
echo Checking PATH Environment Variable...
echo ============================================
echo.
echo Current PATH includes:
echo %PATH%
echo.

echo ============================================
echo Diagnostic Complete
echo ============================================
echo.
echo If Node.js and MongoDB were found above but commands don't work:
echo 1. Close ALL terminal/PowerShell windows
echo 2. Close VS Code completely
echo 3. Restart VS Code
echo 4. Open a new terminal
echo 5. Try again
echo.
echo If they were NOT found:
echo 1. Install Node.js from: https://nodejs.org/
echo 2. Install MongoDB from: https://www.mongodb.com/try/download/community
echo 3. Restart your computer (to update PATH)
echo 4. Try again
echo.
pause
