@ECHO OFF

IF EXIST 56026948.BIN DEL 56026948.BIN
IF EXIST 56026948.LST DEL 56026948.LST
..\bin\a09.exe -b56026948.BIN -l56026948.lst 56026948.asm
IF EXIST 56026948.LST DEL 56026948.LST
FC /B ORIG.BIN 56026948.BIN
PAUSE
