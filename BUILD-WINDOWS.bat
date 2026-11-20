@echo off
setlocal
cd /d "%~dp0"
echo ==============================================
echo VICORA Attendance Sync - Windows EXE Builder
echo ==============================================
where node >nul 2>&1 || (echo Node.js is not installed. Install Node.js LTS first.& pause & exit /b 1)
where npm >nul 2>&1 || (echo npm is missing.& pause & exit /b 1)
echo Installing dependencies...
npm install
if errorlevel 1 (echo Dependency installation failed.& pause & exit /b 1)
echo Building Windows installer...
npm run build:win
if errorlevel 1 (echo Build failed.& pause & exit /b 1)
echo.
echo Build completed. Check the dist folder for the installer.
pause
