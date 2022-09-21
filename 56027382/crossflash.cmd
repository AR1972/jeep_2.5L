@ECHO OFF
SETLOCAL
SET COMM=1
::
SET /P COMM=Set comm port number 1-9 ^> 
ECHO %COMM%|FINDSTR /R "[1-9]" >nul
IF ERRORLEVEL 1 GOTO ERROR
::
..\SBEC_utils\Release\SBEC_erase_st.exe /C:%COMM% /B
IF %ERRORLEVEL% NEQ 0 GOTO ERROR
::
..\SBEC_utils\Release\SBEC_flash_st.exe /C:%COMM% /F:"56027382_v8.bin" /B
IF %ERRORLEVEL% NEQ 0 GOTO ERROR
GOTO QUIT
::
:ERROR
ECHO Flash fail
PAUSE
EXIT 1
::
:QUIT
ECHO Flash success
PAUSE
EXIT 0