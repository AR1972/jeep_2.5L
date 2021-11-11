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
        fcb   SBEC_Erase_STEnd-SBEC_Erase_ST

        ORG    CodeOrg

; this will erase all the memory in the St 32k chip used in the SBECII

SBEC_Erase_ST:
AllBytesClear_StartErase:
           ldy   #$0bb8                     ; load index with value
           ldx   #EEPROMStart               ; load index with value
SendEraseCommand:
           ldaa  #$20                       ; load a with value -00100000-
           staa  $00, X                     ;  -00000000-
           staa  $00, X                     ;  -00000000-
           pshx                             ; pull index from stack
Delay120ms:
           ldx   #$0fa0                     ; load index with value
LongDelayLoop:
           dex                              ; decrement index (x=x-1)
           bne   LongDelayLoop              ; branch if not equal (not zero)
           pulx                             ; pull index from stack
           ldaa  #$ff                       ; load a with value -11111111-
EraseConfirmLoop:
           ldab  #$a0                       ; load b with value -10100000-
           stab  $00, X                     ;  -00000000-
           ldab  #$02                       ; load b with value -00000010-
           bsr   ShortDelayLoop             ; call subroutine
           cmpa  $00, X                     ; compare a with memory at index + value -00000000-
           bne   CheckEraseRetryCounter     ; branch if not equal (not zero)
           inx                              ; increment index (x=x+1)
SkipEEPROM:
           cpx   #$b600
           bne   Skip3                      ; branch if not equal (not zero)
           ldx   #$b800                     ; load index with value
   Skip3:  cpx   #$0000
           bne   EraseConfirmLoop           ; branch if not equal (not zero)
           clr   EEPROMStart                ; zero byte at memory location
           tab                              ; b = a
           ldaa  CPU_SerialStatus           ; load a with memory contents
           ldaa  CPU_SerialData             ; load a with memory contents
           bsr   SendBToSCI                 ; call subroutine
           bra   JumpToStart                ; branch

CheckEraseRetryCounter:
           dey                              ; decrement index (x=x-1)
           bne   SendEraseCommand           ; branch if not equal (not zero)
           bsr   SendBToSCI                 ; call subroutine
JumpToStart:
           jmp   Begin

SendBToSCI:
           ldaa  CPU_SerialStatus           ; load a with memory contents
           stab  CPU_SerialData             ; store b into memory
           rts                              ; return from subroutine

ShortDelayLoop:
           decb
           bne   ShortDelayLoop             ; branch if not equal (not zero)
           rts                              ; return from subroutine
SBEC_Erase_STEnd:
