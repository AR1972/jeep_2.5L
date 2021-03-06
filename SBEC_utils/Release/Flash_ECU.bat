@ECHO OFF
SETLOCAL
SET COMM=4
SET ATX=56028832
SET MTX=56028828
SET TUNE=56028828

SET /P COMM=Set comm port number 1-9 ^> 
ECHO %COMM%|FINDSTR /R "[1-9]" >nul
IF ERRORLEVEL 1 GOTO QUIT
ECHO.
ECHO 1. Manual transmission
ECHO 2. Automatic transmission 
ECHO.
SET /P TUNE=Select transmission type ^> 
IF %TUNE%==1 SET TUNE=%MTX% & GOTO START
IF %TUNE%==2 SET TUNE=%ATX% & GOTO START
GOTO QUIT

:START
CLS
SET TUNE=%TUNE: =%
SBEC_chipid.exe /C:%COMM%
:: ST
IF %ERRORLEVEL% EQU 8360 GOTO FLASH_ST
IF %ERRORLEVEL% EQU 8194 GOTO FLASH_ST
:: AMD
IF %ERRORLEVEL% EQU 417 GOTO FLASH_ST
IF %ERRORLEVEL% EQU 293 GOTO FLASH_ST
:: Intel
IF %ERRORLEVEL% EQU 35257 GOTO FLASH_ST
IF %ERRORLEVEL% EQU 35256 GOTO FLASH_ST
:: Toshiba
IF %ERRORLEVEL% EQU 38976 GOTO FLASH_TOSH
IF %ERRORLEVEL% EQU 39024 GOTO FLASH_TOSH
GOTO QUIT

:FLASH_ST
SBEC_erase_st.exe /C:%COMM%
IF %ERRORLEVEL% NEQ 0 GOTO QUIT
SBEC_flash_st.exe /C:%COMM% /F:"..\..\%TUNE%\%TUNE%.bin"
IF %ERRORLEVEL% NEQ 0 GOTO QUIT
GOTO FLASH_MCU

:FLASH_TOSH
SBEC_erase_tosh.exe /C:%COMM%
IF %ERRORLEVEL% NEQ 0 GOTO QUIT
SBEC_flash_tosh.exe /C:%COMM% /F:"..\..\%TUNE%\%TUNE%.bin"
IF %ERRORLEVEL% NEQ 0 GOTO QUIT
GOTO FLASH_MCU

:FLASH_MCU
SBEC_eeflash.exe /C:%COMM% /F:"..\..\MCU_eeprom\%TUNE%_eeprom.bin" /e

:QUIT
PAUSE