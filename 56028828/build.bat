@ECHO OFF

IF EXIST 56028828.BIN DEL 56028828.BIN
IF EXIST 56028828.LST DEL 56028828.LST
IF EXIST 64k_56028828.BIN DEL 64k_56028828.BIN

..\bin\a09.exe -b64k_56028828.BIN -l56028828.lst 56028828.asm
..\bin\32k.exe 64k_56028828.BIN 56028828.BIN
IF EXIST 56028828.LST DEL 56028828.LST
FC /B ORIG.BIN 56028828.BIN
PAUSE
