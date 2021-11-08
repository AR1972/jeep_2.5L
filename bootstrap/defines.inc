
; generic bits:
bit_bit7                                    equ %10000000 ;
bit_bit6                                    equ %01000000 ;
bit_bit5                                    equ %00100000 ;
bit_bit4                                    equ %00010000 ;
bit_bit3                                    equ %00001000 ;
bit_bit2                                    equ %00000100 ;
bit_bit1                                    equ %00000010 ;
bit_bit0                                    equ %00000001 ;
bit_tophalf                                 equ %11110000 ; top 4 bits
bit_bothalf                                 equ %00001111 ; bottom 4 bits
bit_toptwo                                  equ %11000000 ; top 2 bits
bit_bottwo                                  equ %00000011 ; bottom 2 bits
bit_all                                     equ %11111111 ; all bits
bit_none                                    equ %00000000 ; not bits

; CPU (selected) (register bits)
CPU_PortA                                   equ $1000
CPU_PortIOControl                           equ $1002
CPU_PortD                                   equ $1008
CPU_PortD_DataDirection                     equ $1009
CPU_HardwareTimerForceCompare               equ $100B
CPU_OutputCompare1Mask                      equ $100C
CPU_TimerControlReg1                        equ $1020
CPU_TimerControlReg2                        equ $1021
CPU_PortA_Control                           equ $1026
CPU_SerialPeripheralControl                 equ $1028
CPU_SerialPeripheralStatus                  equ $1029
CPU_SerialPeripheralDataIO                  equ $102A
CPU_SerialBaudRate                          equ $102B
; To achieve 977 baud, byte=$25
; To achieve 1200 baud, byte $33
; To achieve 9600 baud, byte equ 30
; To achieve 62500 baud, byte equ 01
CPU_SerialControl1                          equ $102C
CPU_SerialControl2                          equ $102D
CPU_SerialStatus                            equ $102E
CPU_SerialData                              equ $102F
CPU_SysConfigOptionReg                      equ $1039
CPU_EEPROMControlReg                        equ $103B
eep_ODD                                     equ %10000000
eep_EVEN                                    equ %01000000
eep_ELAT                                    equ %00100000
eep_BYTE_ERASE                              equ %00010000 ;0 = row or bulk erase, 1 = byte erase
eep_ROW_ERASE                               equ %00001000 ;0 = bulk, 1 = row
eep_ERASE                                   equ %00000100 ;0 = read, 1 = erase
eep_EELAT                                   equ %00000010
eep_EEPGM                                   equ %00000001
CPU_HighPriorityInterruptMask               equ $103C
;   Bit 7 - RBOOT: Read Bootstrap ROM (can be written only while SMOD=1) 1=bootstrap ROM at $bf40-$bfff
;   Bit 6 - SMOD:  Special Mode (can be written to zero but not back to one) 1=special mode in effect
;   Bit 5 - MDA:  Mode A Select (can be written only while SMOD=1) 1=normal expanded, 0=normal singlechip
;   Bit 4 - IRV:  Internal Read Visibility (can be written only while SMOD=1) 0=data from internal reads not visible on bus
;   Bit 3 - PSEL3: for selecting which interrupt is highest priority
;   Bit 2 - PSEL2:
;   Bit 1 - PSEL1:
;   Bit 0 - PSEL0:
CPU_TestingFunctionsRegister                equ $103E
CPU_SystemConfigReg                         equ $103F

; Program RAM definitions
;
; Bootloader Memory MAP
;
; 0x0000 - 0x003F : Command Loader
; 0x0040 - 0x007F : 64bytes of temp RAM for uploading
; 0x0080 - 0x00EF : 112bytes for command code
; 0x00F0 - 0x00FF : Reserved for stack
;
; Of course, FCC and SBECII ECU's have more RAM available. It can be used as needed.
; The command code must manage the extra RAM itself; and it must not overwrite the
; Booatloader code or temp storage in lower RAM.

; Main bootloader RAM, for reference - DO NOT OVERWRITE!
Begin                                       equ $0000

; Command Code RAM
MfgID                                       equ $00E0 ;use temp RAM for the chipID
ChipID                                      equ $00E1 ;use temp RAM for the chipID

L8000                                       equ $8000
LD555                                       equ $D555
MfgCodeAddr                                 equ $A000
LAAAA                                       equ $AAAA

CommandRAMStart                             equ $00EE ;RAM storage for starting point of command code - 2 bytes
TopOfStackSTD                               equ $00FF ;top of known RAM - works for all processors
BottomOfStack                               equ $00F0 ;just for reference
RetryCounter                                equ $64ff
EEPROMStart                                 equ $8000
Ram_Storage                                 equ $0040
LA000                                       equ $A000

