@ECHO OFF

IF EXIST 56027382.BIN DEL 56027382.BIN
IF EXIST 56027382.LST DEL 56027382.LST
IF EXIST 56027382.S19 DEL 56027382.S19
IF EXIST 64k_56027382.BIN DEL 64k_56027382.BIN

..\bin\asm11.exe 56027382.asm -nologo
..\bin\mot2bin.exe -P03F 56027382.s19 64k_56027382.BIN
..\bin\32k.exe 64k_56027382.BIN 56027382.BIN
::DEL 64k_56027382.BIN
IF EXIST 56027382.LST DEL 56027382.LST
IF EXIST 56027382.S19 DEL 56027382.S19
FC /B ORIG.BIN 56027382.BIN
PAUSE
