@echo off
set counter=0
:loop
if %counter% equ 100 goto :EOF
set /a counter+=1
SBEC_download.exe 1
echo .
ping -n 2 127.0.0.1 >nul
goto loop