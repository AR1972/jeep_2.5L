bin2h: turns a binary file into a C header file,
modified to make 68HC11 bootstraps, prepends 0xFF
to the byte array needed by the MCU for auto baud
detection.