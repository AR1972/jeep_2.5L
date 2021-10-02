A repository of 91-95 Jeep and Dodge ECU EPROMS.

Currently used ECU's for 4 cylinder 91-95 Jeep are priced at $300-$500.
The pourpose of this repository is to collect 4 cylinder Jeep EEPROMS
to cross flash to the much cheaper and plentiful 6 and 8 cylinder ECU's

Any ECU of this vintage sould have it's capacitors replaced anyway, so 
pulling the EEPROM off the board and reading it's contents, for backup
purposes, should be a no brainer.

I am especally interested in 4 cylinder EEPROMS, for all years and models
of 91-95 Jeep and Dodge vehicles. Please submit a PR if you heppen to find
or aquire one.


Capacitors:

Replacment electrolytic capacitors for these ECU's can be purchased through
Mouser, Digikey, etc. I prefer the Nichicon HE series with part numbers.

UHE1V471MHD6, UHE1V221MPD for the 35 volt variant and UHE1E221MPD1TD, 
UHE1E471MPD6TD for the 25 volt versions. Early ECU's had one 470uF and
two 220uF capacitors, while later ECU's have three 220uF all versions
used 25 volt capacitors, 35 volt capacitors have the advantage of being
in stock and will have a longer service life due to operating well under
half thier rated voltage.


EEPROMS:

These ECU's were equipped with EEPROMS from various manufactures most are
supported by the TL866II programmer.

Some ECU's were equipped with Toshiba TC97208P and TC97209P EEPROMS,
these EEPROMS are explicitly supported by the vintage Needham EMP-20 with
01A module, but can be read with the TL866II programmer with the help of
a DIP28 socket, unchecking the 'Check ID' box. and reading the device as
an Intel 27C256 for the TC97208P and Intel 27C512 for the TC98209P.

