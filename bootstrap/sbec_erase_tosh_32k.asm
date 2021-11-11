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
        fcb   SBEC_Erase_ToshibaEnd-SBEC_Erase_Toshiba

        .org    CodeOrg

SBEC_Erase_Toshiba:
           ldx   #$014d                     ; load index with value
LongDelayLoop:  
           dex                              ; decrement index (x=x-1)
           bne   LongDelayLoop              ; branch if not equal (not zero)
           ldd   #$aac0                     ; load d (a&b) with value
           staa  LD555     
           lsra            
           staa  LAAAA     
           stab  LD555                      ; store b into memory
           ldd   #$ff0c                     ; load d (a&b) with value
           staa  LAAAA     
Delay2sec:  
           ldx   #$d903                     ; load index with value
LongDelayLoop2:  
           dex                              ; decrement index (x=x-1)
           bne   LongDelayLoop2             ; branch if not equal (not zero)
           decb            
           bne   Delay2sec                  ; branch if not equal (not zero)
           ldab  LAAAA                      ; load b with memory contents
           ldab  LD555                      ; load b with memory contents
           ldab  #$c8                       ; load b with value -11001000-
ShortDelayLoop:  
           decb
           bne   ShortDelayLoop             ; branch if not equal (not zero)
           ldx   #EEPROMStart               ; load index with value
VerifyByteErased:  
           ldab  $00, X                     ; load b with memory at index + value -00000000-
           cmpa  $00, X                     ; compare a with memory at index + value -00000000-
           bne   SendBToSCI                 ; branch if not equal (not zero)
           inx                              ; increment index (x=x+1)
           cpx   #$b600   
           bne   Skip_1                     ; branch if not equal (not zero)
           ldx   #$b800                     ; load index with value
Skip_1:    cpx   #$0000
           bne   VerifyByteErased           ; branch if not equal (not zero)
           ldab  #$ff                       ; load b with value -11111111-
SendBToSCI:
           ldaa  CPU_SerialStatus           ; load a with memory contents
           ldaa  CPU_SerialData             ; load a with memory contents
           stab  CPU_SerialData             ; store b into memory
           jmp   Begin
SBEC_Erase_ToshibaEnd: