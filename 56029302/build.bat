@ECHO OFF

IF EXIST 56029302.BIN DEL 56029302.BIN
IF EXIST 56029302.LST DEL 56029302.LST
IF EXIST 56029302.S19 DEL 56029302.S19
IF EXIST 64k_56029302.BIN DEL 64k_56029302.BIN

..\bin\asm11.exe 56029302.asm -nologo
..\bin\mot2bin.exe -P03F 56029302.s19 64k_56029302.BIN
..\bin\32k.exe 64k_56029302.BIN 56029302.BIN
::DEL 64k_56029302.BIN
::IF EXIST 56029302.LST DEL 56029302.LST
IF EXIST 56029302.S19 DEL 56029302.S19
FC /B ORIG.BIN 56029302.BIN
PAUSE
