Downloads EPROM from SBEC

This is a quick and dirty method of getting
an EPROM image off an SBEC with minimal parts
and little to no soldering

This program will relentlessly place an SBEC
into bootstrap mode and attempt to download
bootstrap code that will upload the EPROM to
the PC. Once upload is complete EPROM image
is saved as the ECU part number with bin 
file extension.

a serial port breakout board and relay board
are suggested, but not required as you can 
switch the 12 volts and serial port wire manually
but stubborn ECU's can take 12-15 tries to establish
a connection and begin downloading.

