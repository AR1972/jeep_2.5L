@ECHO OFF

IF EXIST 56028832.BIN DEL 56028832.BIN
IF EXIST 56028832.LST DEL 56028832.LST
IF EXIST 56028832.S19 DEL 56028832.S19
IF EXIST 64k_56028832.BIN DEL 64k_56028832.BIN

..\bin\asm11.exe 56028832.asm -nologo
..\bin\mot2bin.exe -P03F 56028832.s19 64k_56028832.BIN
..\bin\32k.exe 64k_56028832.BIN 56028832.BIN
::DEL 64k_56028832.BIN
IF EXIST 56028832.LST DEL 56028832.LST
IF EXIST 56028832.S19 DEL 56028832.S19
FC /B ORIG.BIN 56028832.BIN
PAUSE
