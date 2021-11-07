; .title Modular BootLoader for MP Tune - SBEC_Flash_ST
; .area ROM (ABS)
;*********************************************************************
;*  SBECII_Flash_ST.asm                                              *
;*                                                                   *
;*  Interface program for flash/read m68hc11a8 ecu.                  *
;*  Based on Motorola M68HC11A8 bootloader listing in the reference  *
;*  manual.                                                          *
;*                                                                   *
;*  This is command code to flash the ST Micro Chip used in the      *
;*  SBECII.                                                          *
;*                                                                   *
;*                                                                   *
;*                                                                   *
;*  Copyright 2013 Robert Lloyd                                      *
;*  BoostButton, LLC                                                 *
;*                                                                   *
;*********************************************************************

DataOrg equ $647d
CodeOrg equ $6480
;version == 01
;.define CalDataFile /NotAvail.v1/

#include defines.inc

; Assembler directives
        ORG    DataOrg

CommandRAMAddress:
        fdb   CodeOrg ; can define any valid RAM, so long as it doesn't overwrite the stack or temp RAM
CommandByteCount:
        fcb   $75

        ORG    CodeOrg

; This code as it is right now, will not verify any bytes back to the PC during the flash.
; I had to remove the verify code to make it fit into the space available.
; A full verify of the entire code will be necessary after flashing.
;
; This will write 64 bytes at a time, when completely finished, it will return either:
; 1) the last byte indicating a sucessful write
; 2) the byte which failed to write/verify
;
; Of course, these COULD be the same byte. So, a complete verification of the entire
; array needs to be performed when finished.

SBECII_Flash_ST:
           ldx   #EEPROMStart               ; load index with value
Next64ByteBlock:
           ldy   #Ram_Storage               ; load index with value
LoopToFillRAM:
           ldd   CPU_SerialStatus
           bita  #$20                       ;  -00100000-
           beq   LoopToFillRAM              ; branch if equal (zero)
           stab  $00, Y                     ;  -00000000-
           iny                              ; increment index (x=x+1)
           cpy   #Ram_Storage + 64
           bne   LoopToFillRAM              ; branch if not equal (not zero)
           ldab  #$c8                       ; load b with value -11001000-
           bsr   ShortDelayLoop             ; call subroutine
           ldy   #Ram_Storage               ; load index with value
InitRetryCounter:
           ldaa  #$19                       ; load a with value -00011001-
           staa  RetryCounter
ProgramBytes:
           ldaa  #$40                       ; load a with value -01000000-
           staa  $00, X                     ;  -00000000-
           ldaa  $00, Y                     ; load a with memory at index + value -00000000-
           staa  $00, X                     ;  -00000000-
           ldab  #$28                       ; load b with value -00101000-
           bsr   ShortDelayLoop             ; call subroutine
           ldab  #$c0                       ; load b with value -11000000-
           stab  $00, X                     ;  -00000000-
           ldab  #$02                       ; load b with value -00000010-
           bsr   ShortDelayLoop             ; call subroutine
           cmpa  $00, X                     ; compare a with memory at index + value -00000000-
           beq   ByteVerified               ; branch if equal (zero)
           dec   RetryCounter               ; decrement memory contents
           bne   ProgramBytes               ; branch if not equal (not zero)
Finished:
           ldab  CPU_SerialStatus
           ldab  CPU_SerialData
           staa  CPU_SerialData             ; this should send back the 'bad' byte if it did NOT match or the last byte if all is OK.
           jmp   Begin

ByteVerified:
ResetEEPROM:
           ldab  #$ff                       ; load b with value -11111111-
           stab  $00, X                     ;  -00000000-
           stab  $00, X                     ;  -00000000-
           ldab  #$64                       ; load b with value -01100100-
           bsr   ShortDelayLoop             ; call subroutine
           inx                              ; increment index (x=x+1)
           iny                              ; increment index (x=x+1)
           cpy   #Ram_Storage + 64
           bne   InitRetryCounter           ; branch if not equal (not zero)

; is it necessary to skip the EEPROM? We don't bother in the SMEC, SBEC flash module code...
SkipEEPROM:
           cpx   #$b600
           bne   Skip                       ; branch if not equal (not zero)
           ldx   #$b800                     ; load index with value
   Skip:   cpx   #$0000
           bne   Next64ByteBlock
           bra   Finished                   ; branch if not equal (not zero)

ShortDelayLoop:
           decb
           bne   ShortDelayLoop             ; branch if not equal (not zero)
           rts                              ; return from subroutine

