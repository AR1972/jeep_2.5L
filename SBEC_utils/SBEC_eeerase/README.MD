Utility to erase the EEPROM located inside
the 68HC11A8 MCU found in Jeep SBEC's. Some
vehicles have the VIN number stored at 
0xB6B2 -> 0xB6C2, it is unknown what issue
will result on these vehicles if the VIN
is erased.

Utility will backup the EEPROM to file then 
erase the EEPROM and verify EEPROM is erased.
