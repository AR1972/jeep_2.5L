@ECHO OFF

IF EXIST 56028842.BIN DEL 56028842.BIN
IF EXIST 56028842.LST DEL 56028842.LST
IF EXIST 56028842.S19 DEL 56028842.S19
IF EXIST 64k_56028842.BIN DEL 64k_56028842.BIN

asm11.exe 56028842.asm -l
mot2bin.exe -P03F 56028842.s19 64k_56028842.BIN
32k.exe 64k_56028842.BIN 56028842.BIN
::DEL 64k_56028842.BIN
FC /B ORIG.BIN 56028842.BIN
PAUSE
