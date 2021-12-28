@echo off
set counter=0
:loop
if %counter% equ 101 goto :EOF
set /a counter+=1
SBEC_download.exe 5
echo .
ping -n 2 127.0.0.1 >nul
goto loop