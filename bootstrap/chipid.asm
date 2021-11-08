; .title Modular BootLoader for MP Tune - ChipID
; .area ROM (ABS)
;*********************************************************************
;*  ChipID.asm                                                       *
;*                                                                   *
;*  Interface program for flash/read m68hc11a8 ecu.                  *
;*  Based on Motorola M68HC11A8 bootloader listing in the reference  *
;*  manual.                                                          *
;*                                                                   *
;*  This is command code to return the MfgID and ChipID.             *
;*                                                                   *
;*                                                                   *
;*                                                                   *
;*                                                                   *
;*  Copyright 2013 Robert Lloyd                                      *
;*  BoostButton, LLC                                                 *
;*                                                                   *
;*********************************************************************

DataOrg equ $003d
CodeOrg equ $040
;version == 01
;.define CalDataFile /NotAvail.v1/

#include defines.inc

; Assembler directives
        ORG    DataOrg ; these 3 bytes are sent, but stored in the correct location by BootMainAll

CommandRAMAddress:
        fdb    CodeOrg ; can define any valid RAM, so long as it doesn't overwrite the stack or temp RAM
CommandByteCount:
        fcb    $43

        ORG    CodeOrg

ID_MfgAndChip:
; Read the chip ID code to determine which erase/flash routines to use and
; save the code for future use
; confirmed this should work with the Atmel 29C256, ST M28C256, and Toshiba chips

;enter ChipID Mode

           ldX   #$1f40                     ;24msec
           jsr   LongDelayLoop

           ldD   #$aa90                     ;load d (a&b) with value
           staA  LD555
           lsrA
           staA  LAAAA
           staB  LD555                      ;store b into memory

           ldX   #$014d                     ;1msec
           jsr   LongDelayLoop

;read the MfgID and ChipID
           ldD   MfgCodeAddr                ;load b with ChipID
;store the MfgID and ChipID
           stD   MfgID                      ;store MFgID and ChipId to RAM

;ibox code - what does this do?
           ldaa  LAAAA                      ;load a with memory contents
           ldaa  LD555                      ;load a with memory contents
           ldaa  #$00                       ;load a with value -00000000-
           staa  L8000

           ldaa  MfgID
           jsr   SendByteLoop
           ldaa  ChipID
           jsr   SendByteLoop

;exit ChipID Mode
;            ldX   #$014d                   ;load index with value
;            jsr   LongDelayLoop
;            ldD   #$aaf0                   ;load d (a&b) with value
;            staA  LD555
;            lsrA
;            staA  LAAAA
;            staB  LD555                    ;store b into memory

           jmp    Begin                     ;when finished, jump back to bootloader

;--------------------------------------------------------------------------------
SendByteLoop:
           ldaB  CPU_SerialStatus           ;load sci status into a
           bpl   SendByteLoop               ;if any bits set loop
           staA  CPU_SerialData             ;put a into sci register and send
           rts                              ;return to calling program

;--------------------------------------------------------------------------------
LongDelayLoop:
           dex                              ;reduce counter
           bne   LongDelayLoop
           rts

;--------------------------------------------------------------------------------

; Data section that will contain the EEPROM and RAM start for each ECU
; to be determined by the ChipID (each ChipID is unique for a ECU type).
;         .org   0x00C0
; MemAddrTable:
;
; ;SBECII_Memory
;         .word    0x8000 ;start of EEPROM
;         .word    0x6480 ;start of temp RAM <-- maybe need to change?
; ;FCC_Memory
;         .word    0x1200 ;start of EEPROM
;         .word    0x0100 ;start of temp RAM <-- maybe need to change?
; ;EATX_Memory
;         .word    0x2000 ;start of EEPROM
;         .word    0x0100 ;start of temp RAM <-- maybe need to change?

        
        
; Device ID's
; 87C257  - 0x80 ; Factory SBECI and SBECII - hardware method only
; 29C256  - 0xDC ; Replacement chip - hardware method only
; 27SF512 - 0xA4 ; Replacement chip - hardware method only
; 27C256  - 0x8C ; Factory SMEC - hardware method only

; M28F256 - 0xA8 ; Factory SBECII (ST Chip algorithm)
; M28F512 - 0x02 ; Factory FCC (ST Chip algorithm)
; ST Mfg Code = 0x20

; TC97208 - 0x?? ; Factory SBECII (Toshiba Chip algorithm)
; TC97209 - 0x70 ; Factory FCC (Toshiba Chip algorithm)
; Toshiba Mfg Code = 0x98


; 28C256  - 0x?? ; BB SMEC and SBEC Flash Module (MPT Algorithm) - maybe need to set ID?

