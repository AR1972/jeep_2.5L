@ECHO OFF

IF EXIST 56028828.BIN DEL 56028828.BIN
IF EXIST 56028828.LST DEL 56028828.LST
IF EXIST 56028828.S19 DEL 56028828.S19
IF EXIST 64k_56028828.BIN DEL 64k_56028828.BIN

asm11.exe 56028828.asm -l
mot2bin.exe -P03F 56028828.s19 64k_56028828.BIN
32k.exe 64k_56028828.BIN 56028828.BIN
::DEL 64k_56028828.BIN
FC /B ORIG.BIN 56028828.BIN
PAUSE
