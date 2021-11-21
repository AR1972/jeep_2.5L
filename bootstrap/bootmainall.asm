; .title Modular BootLoader for MP Tune - BootMainAll
; .area ROM (ABS)
;*********************************************************************
;*  MPBootAll.asm                                                    *
;*                                                                   *
;*  Interface program for flash/read m68hc11a8 ecu.                  *
;*  Based on Motorola M68HC11A8 bootloader listing in the reference  *
;*  manual.                                                          *
;*                                                                   *
;*  This is a very simple bootloader that will setup the MCU then    *
;*  wait for command code to be downloaded; it will then execute it. *
;*                                                                   *
;*                                                                   *
;*                                                                   *
;*  Copyright 2013 Robert Lloyd                                      *
;*  BoostButton, LLC                                                 *
;*                                                                   *
;*********************************************************************

DataOrg equ $0000
CodeOrg equ $0000
;version == 01
;.define CalDataFile /NotAvail.v1/

#include defines.inc

; Assembler directives
         ORG    DataOrg
         ORG    CodeOrg

THE_BEGIN:
           fcb 0xFF ;68HC11 uses first byte to auto detect BAUD

;-------------------------------------------------------------------------------
Start:     lds      #TopOfStackSTD          ;set stack pointer
           ldX      #$1000                  ;load register start index
           ldD      #$300C                  ;setup baud to 62500 and enable receive/transmit
           staA     $2b,X                   ;set baud to 62500
           staB     $2d,X                   ;enable receive/transmit
           sei                              ;disable interrupts
           ldD      #$6001                  ;setup for registers
           staA     $3c,X                   ;disable bootstrap ROM
           staB     $3f,X                   ;
           
LoadCommandRAMStartAddress:
           bsr      ReadByteIntoB           ;read the high byte of the command RAM address
           tBA                              ;copy the HB to A
           bsr      ReadByteIntoB           ;read the low byte of the command RAM address
           std      CommandRAMStart         ;save the CommandRAMStart address

CommandLoader:
; Upload a new command and begin execution of the command.
           xgdx                             ;move the load address to X
           bsr      ReadByteIntoB           ;read the number of bytes to upload
           tBA                              ;copy the # of bytes to A

LoadCommandByte:
           bsr      ReadByteIntoB           ;read and store the command bytes
           staB     0, X

VerifyLoop:
           ldaB     CPU_SerialStatus
           bpl      VerifyLoop
           ldaB     0, X
           staB     CPU_SerialData          ;echo back the data just loaded
           inX                              ;move to the next byte
           decA                             ;decrement the byte count
           bne      LoadCommandByte         ;get the next byte of code
ExecuteCommand:
           ldx      CommandRAMStart         ;load X with the command address
           jmp      0, X                    ;jump to the new command

;----------------------------------------------------------------------------
ReadByteIntoB:
;waits for byte to be read and stores that byte into accB
;uses accA to store/check the port status
           pshA                             ;temporarily push whatever was in A onto the stack for safe keeping
LoopForByte:
           ldD   CPU_SerialStatus           ;serial status goes into A; data into B
           bitA  #$20                       ; -00100000-
           beq   LoopForByte                ;branch if equal (zero)
           pulA                             ;all done now, so restore A from the stack
           rts                              ;return to calling program
;-------------------------------------------------------------------------------
; Command code rules:
;
; 1. Each command must start at the first byte (executable code) because the parser
; will jump to that address to start running the loaded command. (IE, no data)
;
; 2. When finished, the command code must go back to the begining of the program
; and start over (jump to Begin)
;
; 3. Each command will have to allocate it's own RAM at the end of it's code space.
;    - each command will have available memory from $0090 to $00f0, unless other RAM is also available
;    - each command will have RAM available from $0050 - $008F for temp storage.
;
;------------------------------------------------------------------------------
THE_END:

;pad bootstrap to 257 total bytes

 REPEAT 257-(THE_END-THE_BEGIN)
 fcb 0x00
 ENDR

