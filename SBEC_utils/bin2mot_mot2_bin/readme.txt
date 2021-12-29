short docu for project BIN2MOT / MOT2BIN                            03-jun-2012
========================================

Author: Klaus Toscher, germany;
mail: klaus.toscher@web.de 

These good old programs are very useful to convert Motorola S-records to binary
files and vice versa. A lot of options help to modify/change the input file
before writing to the selected output.
Mostly these programs are used to prepare images for software loading. Some 
additional data has to be extended before the files can be flashed in a
system 
It was necessary to write this code new, because the existing executables 
under MSFT Windows are linked under 16bit DOS. The source code isn't available
in the internet. Due to this i decide to make a new impl. and set it under the
GPL2 license.
The code can run under Windows or Linux. Feel free to chose your build 
environment.

REMARK: the behavior has a little bit change in comparision to old DOS impl.
This version append the suffix to the complete original filename and 
doesn't change the extension of a file. 

directory structure
/bin
contains the binaries for debug/release version

/doc
contains this docu text and other info, if available

/make
contains Makefile (Linux) and .sln/.vcproj (Microsoft Visual Studio solution)

/src
contains source code and header files


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Usage: mot2bin -Lnnn -Pnnn -Onnn -M -Q <motfile> [binfile]\n
default values: []
-> all numbers only in hexadecimal notation
 -Ln  Binary file length [0x0000]
 -Pn  Pad byte for binary file [0xFF]
 -On  Address offset [0x0000] (to add to Motorola records)
 -M   Merge data into existing binary file
 -Q   Quiet mode (no statistics are displayed)
 -?   This help text
 <inputfile> of input data stream
 if no [binfile] is given, <motfile>.bin\" is used for binary outputfile 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Usage: bin2mot -Lnnn -Innn -Onnn -M -2 -3 -H -T -A -Q <binfile> [motfile]
 default values: []
 -Ln  Bytes to read from binary file [0x0000]
 -In  Binary file starting offset    [0x0000]
 -On  Output file address offset     [0x0000] (where S-Record data starts)
 -M   Merge data into existing Motorola file\n (not supp.)
 -2   Generate S2/S8 records
 -3   Generate S3/S7 records
 -H   Exclude S0 header record
 -T   Exclude S7/S8/S9 trailer record
 -A   Append new data to end of existing Motorola file
 -Q   Quiet mode (no statistics are displayed)
 -?   This help text
 <binfile> of input data stream
 if no [motfile] is given, <binfile>.mot is used for motorola outputfile
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
