@ECHO OFF

IF EXIST 56028851.BIN DEL 56028851.BIN
IF EXIST 56028851.LST DEL 56028851.LST
IF EXIST 56028851.S19 DEL 56028851.S19
IF EXIST 64k_56028851.BIN DEL 64k_56028851.BIN

..\bin\asm11.exe 56028851.asm -nologo
..\bin\mot2bin.exe -P03F 56028851.s19 64k_56028851.BIN
..\bin\32k.exe 64k_56028851.BIN 56028851.BIN
::DEL 64k_56028851.BIN
IF EXIST 56028851.LST DEL 56028851.LST
IF EXIST 56028851.S19 DEL 56028851.S19
FC /B ORIG.BIN 56028851.BIN
PAUSE