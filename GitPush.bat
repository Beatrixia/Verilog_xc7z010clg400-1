@echo off
echo ===================================
echo   Auto Git Push for Vivado Project
echo ===================================
echo.

:: ให้ผู้ใช้พิมพ์ข้อความ Commit Message
set /p msg="Enter Commit Message: "

:: หากไม่ได้พิมพ์ข้อความ จะตั้งค่าเริ่มต้นให้อัตโนมัติ
if "%msg%"=="" set msg=Update Vivado project

echo.
echo Adding files...
git add .

echo Committing changes...
git commit -m "%msg%"

echo Pushing to remote...
git push origin main

echo.
echo ===================================
echo   Push Completed!
echo ===================================
pause