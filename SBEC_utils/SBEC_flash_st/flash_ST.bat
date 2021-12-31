@ECHO OFF

SBEC_erase_st.exe /c:1
SBEC_flash_st.exe /c:1 /f:..\..\56028828\56028828.bin
SBEC_download.exe /c:1
FC /B ..\..\56028828\56028828.bin 56028828.bin
DEL 56028828.bin
PAUSE