; .title Modular BootLoader for MP Tune - SBEC_Clear_ST
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

DataOrg equ $003d
CodeOrg equ $0040
;version == 01
;.define CalDataFile /NotAvail.v1/

#include defines.inc

; Assembler directives
        ORG    DataOrg

CommandRAMAddress:
        fdb   CodeOrg ; can define any valid RAM, so long as it doesn't overwrite the stack or temp RAM
CommandByteCount:
        fcb   SBEC_Clear_STEnd-SBEC_Clear_ST

        ORG    CodeOrg

; this will clear all the memory in the St 32k chip used in the SBECII

SBEC_Clear_ST:
           ldx   #EEPROMStart               ; load index with value
LoadRetryCounterA:
           ldaa  #$19                       ; load a with value -00011001-
           staa  RetryCounter
ClearBytes:
           ldaA  #$40                       ; load a with value -01000000-
           staa  $00, X                     ;  -00000000-
           clr   $00, X                     ;  -00000000-
           ldab  #$28                       ; load b with value -00101000-
           bsr   ShortDelayLoop             ; call subroutine
           ldaa  #$c0                       ; load a with value -11000000-
           staa  $00, X                     ;  -00000000-
           ldab  #$02                       ; load b with value -00000010-
           bsr   ShortDelayLoop             ; call subroutine
           tst   $00, X                     ;  -00000000-
           beq   ByteCleared_GoToNext       ; branch if equal (zero)
           dec   RetryCounter               ; decrement memory contents
           bne   ClearBytes                 ; branch if not equal (not zero)
           cpx   #$b600
           bcs   Skip2                      ; branch if lower
           cpx   #$b7ff   
           bhi   Skip2                      ; branch if higher
           bra   ByteCleared_GoToNext       ; branch

   Skip2:  bsr   SendBToSCI                 ; call subroutine
           jmp   Begin                      ; branch

ByteCleared_GoToNext:
           inx                              ; increment index (x=x+1)
           beq   AllBytesClear_StartErase   ; branch if equal (zero)
           bra   LoadRetryCounterA          ; branch

AllBytesClear_StartErase:
           ldaB  #$00                       ; send back 0x00 to indicate all bytes are cleared
           bsr   SendBToSCI
           jmp   Begin                      ; branch

SendBToSCI:
           ldaa  CPU_SerialStatus           ; load a with memory contents
           stab  CPU_SerialData             ; store b into memory
           rts                              ; return from subroutine

ShortDelayLoop:
           decb
           bne   ShortDelayLoop             ; branch if not equal (not zero)
           rts                              ; return from subroutine
SBEC_Clear_STEnd:
