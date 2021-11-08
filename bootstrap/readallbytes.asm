 ;.title Modular BootLoader for MP Tune
; .area ROM (ABS)
;*********************************************************************
;*  ChipID.asm                                                       *
;*                                                                   *
;*  Interface program for flash/read m68hc11a8 ecu.                  *
;*  Based on Motorola M68HC11A8 bootloader listing in the reference  *
;*  manual.                                                          *
;*                                                                   *
;*  This is command code to read all bytes in memory from a          *
;*  starting address provided by the host PC.                        *
;*                                                                   *
;*                                                                   *
;*                                                                   *
;*  Copyright 2013 Robert Lloyd                                      *
;*  BoostButton, LLC                                                 *
;*                                                                   *
;*********************************************************************

DataOrg equ $003d
CodeOrg equ $0040
;version == 01
;.define CalDataFile /NotAvail.v1/

#include defines.inc

; Command Code RAM

; Assembler directives
        ORG    DataOrg

CommandRAMAddress:
        fdb   CodeOrg ; can define any valid RAM, so long as it doesn't overwrite the stack or temp RAM
CommandByteCount:
        fcb   $20

        ORG    CodeOrg

ReadAllBytes:
; Read all bytes from starting address
; up through 0xFFFF.
;
; reads the starting address (high byte + low byte)

       bsr      ReadByteIntoB                     ;read bin loc high byte
       tBA                                        ;transfer b to a
       bsr      ReadByteIntoB                     ;read bin loc low byte
       xgDX                                       ;switch d and x - address in X, # of bytes in A and B
;X now contains the starting address
;sends all bytes until the addr rolls over to 0x0000
SendAllLoop:
       ldaB     0, X                              ;load byte at bin address X+0
SendLoop2:
       ldaA     CPU_SerialStatus
       bpl      SendLoop2                         ;wait until the port is ready to send
       staB     CPU_SerialData                    ;save the byte ot the port
       inX                                        ;point to next bin address
       bne  SendAllLoop                           ;keep looping until addr=0x0000
       jmp      Begin

;----------------------------------------------------------------------------
ReadByteIntoB:
;waits for byte to be read and stores that byte into accB
       pshA
LoopForByte:
       ldD      CPU_SerialStatus                  ;read serial status into b
       bitA     #$20                              ;wait for byte
       beq      LoopForByte                       ;if true(<>0) start completely over
       pulA
       rts

;-------------------------------------------------------------------------------

