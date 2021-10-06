
dissambly of the 4 cyl 56028842 ECU EEPROM, assembling with asm11.exe
and conversion with mot2bin.exe will produce an exact duplicate of the
contents of the 56028842 EEPROM, with 0x8000 leading null bytes, write 
to a 28F512 EEPROM or trim off the leading bytes with a hex editor.

