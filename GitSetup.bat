:: =========================================================================================================

:: นี่ไม่ใช่ส่วนโค้ด ห้ามคัดลอกส่วนนี้แล้วนำไปวางในโค้ด ::
:: This part is not the main code DONT COPY ::

:: GitSetup.bat
:: ระบบจะทำการลงทะเบียน safe.directory เพื่อป้องกันปัญหาเรื่องสิทธิ์การเข้าถึง (Dubious Ownership)
:: เริ่มต้นระบบติดตามไฟล์ (git init) และตั้งชื่อ Branch หลักเป็น main
:: ระบบจะถามหา GitHub / GitLab Repository URL เพื่อผูกเข้ากับโปรเจกต์ให้อัตโนมัติ

:: =========================================================================================================

@echo off
echo ===================================
echo   First Time Git Setup
echo ===================================
echo.

:: Add current directory as Safe Directory
git config --global --add safe.directory "%CD%"

:: Initialize Git repository
git init
git branch -M main

:: Prompt for Remote Repository URL
set /p repo="Enter Remote Repository URL (GitHub/GitLab): "
if not "%repo%"=="" (
    git remote add origin %repo%
    echo.
    echo Remote repository added successfully!
)

echo.
echo Setup completed! You can now use Push.bat or Pull.bat
pause
