:: =========================================================================================================

:: นี่ไม่ใช่ส่วนโค้ด ห้ามคัดลอกส่วนนี้แล้วนำไปวางในโค้ด ::
:: This part is not the main code DONT COPY ::

:: GitTerminal.bat
:: ใช้เป็น Terminal ส่วนตัวสำหรับรัน Git โดยเฉพาะ
:: จะแสดงหน้าต่าง Command Line ที่พาเข้าสู่โฟลเดอร์งาน พร้อมสลับไปใช้ Git ได้ทันที
:: title Git Terminal - %CD%: ตั้งชื่อหัวหน้าต่าง Command Prompt ให้แสดง Path ปัจจุบันที่อยู่
:: git config --global --add safe.directory "%CD%": ลงทะเบียนโฟลเดอร์ปัจจุบันให้เป็นโฟลเดอร์ปลอดภัยอัตโนมัติ (ป้องกันปัญหา dubious ownership บน Windows)
:: git status: รันคำสั่งเช็กสถานะ Git ทันทีที่เปิดขึ้นมา เพื่อให้คุณเห็นว่ามีไฟล์ไหนแก้ไข หรือยังไม่ได้ Commit บ้าง
:: cmd /k: คำสั่งสำคัญที่สุดที่สั่งให้หน้าต่าง Command Line ค้างหน้าจอไว้ เพื่อให้คุณพิมพ์คำสั่ง Git

:: =========================================================================================================

@echo off
title Git Terminal - %CD%
echo ===================================================
echo             WELCOME TO GIT TERMINAL
echo ===================================================
echo Directory: %CD%
echo.

:: Add current directory as Safe Directory to prevent permission errors
git config --global --add safe.directory "%CD%"

:: Show current Git status automatically on open
git status
echo ===================================================
echo.

:: Keep the CMD terminal window open for typing any Git commands
cmd /k
