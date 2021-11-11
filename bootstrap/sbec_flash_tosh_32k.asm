; .title Modular BootLoader for MP Tune
; .area ROM (ABS)
;*********************************************************************
;*  SBECII_Flash_Tosh.asm                                            *
;*                                                                   *
;*  Interface program for flash/read m68hc11a8 ecu.                  *
;*  Based on Motorola M68HC11A8 bootloader listing in the reference  *
;*  manual.                                                          *
;*                                                                   *
;*  This is command code to flash the Toshiba Chip used in the       *
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
        fcb   SBEC_Flash_ToshibaEnd-SBEC_Flash_Toshiba

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

SBEC_Flash_Toshiba:
           ldx   #EEPROMStart               ; load index with value
Next64ByteBlock:
           ldy   #Ram_Storage               ; load index with value
LoopToFillRAM:
           ldd   CPU_SerialStatus
           bita  #$20                       ;  -00100000-
           beq   LoopToFillRAM              ; branch if equal (zero)
           stab  $00, Y                    ;  -00000000-
           iny                              ; increment index (x=x+1)
           cpy   #Ram_Storage + 64
           bne   LoopToFillRAM              ; branch if not equal (not zero)
           ldab  #$c8                      ; load b with value -11001000-
           jsr   ShortDelayLoop
           ldy   #Ram_Storage               ; load index with value
InitRetryCounter:
           ldab  #$19                       ; load b with value -00011001-
           stab  RetryCounter               ; store b into memory
ProgramBytes:
           ldd   #$aaa0                    ; load d (a&b) with value
           staa  LD555
           lsra
           staa  LAAAA
           stab  LD555                      ; store b into memory
           clrb                             ; b = 0
           stab  LA000                      ; store b into memory
           ldab  $00, Y                    ; load b with memory at index + value -00000000-
           stab  $00, X                    ;  -00000000-
           ldab  #$50                      ; load b with value -01010000-
           bra   ShortDelayLoop             ; branch
; not sure what all this is about, but it's different from the FCC version. Needed?
;           ldab  0x00, Y                   ; load b with memory at index + value -00000000-
;           stab  0x00, X                   ;  -00000000-
;           nop                             ; no operation
;           nop                             ; no operation
VerifyByte:
           ldaa  $00, X                    ; load b with memory at index + value -00000000-
;           ldaa  LAAAA                     ; load a with memory contents
;           ldaa  LD555                     ; load a with memory contents
;           ldaa  CPU_SerialStatus          ; load a with memory contents
;           ldaa  CPU_SerialData            ; load a with memory contents
           cmpa  $00, Y                    ;  -00000000-
           beq   ByteVerified               ; branch if equal (zero)
VerifyFailed:
           dec   RetryCounter               ; decrement memory contents
           bne   ProgramBytes               ; branch if not equal (not zero)
Finished:
           ldab  CPU_SerialStatus
           ldab  CPU_SerialData
           staa  CPU_SerialData             ; this should send back the 'bad' byte if it did NOT match or the last byte if all is OK.
           jmp   Begin

ByteVerified:
           inx                              ; increment index (x=x+1)
           iny                              ; increment index (x=x+1)
           cpy   #Ram_Storage + 64
           bne   InitRetryCounter           ; branch if not equal (not zero)
SkipEEPROM:
           cpx   #$b600
           bne   Skip                       ; branch if not equal (not zero)
           ldx   #$b800                    ; load index with value
   Skip:   cpx   #$0000
           bne   Next64ByteBlock
           bra   Finished                   ; branch if not equal (not zero)

ShortDelayLoop:
           decb
           bne   ShortDelayLoop             ; branch if not equal (not zero)
           rts                              ; return from subroutine
SBEC_Flash_ToshibaEnd:
