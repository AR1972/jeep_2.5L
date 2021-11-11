; .title Modular BootLoader for MP Tune
; .area ROM (ABS)
;*********************************************************************
;*  EraseEEPROM.asm                                                  *
;*                                                                   *
;*  Interface program for flash/read m68hc11a8 ecu.                  *
;*  Based on Motorola M68HC11A8 bootloader listing in the reference  *
;*  manual.                                                          *
;*                                                                   *
;*  This is command code to erase the EEPROM on-board the MCU.       *
;*  Used to erase the security and mileage bytes stored in EEPROM.   *
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
          fcb   EraseEEPROMEnd-EraseEEPROM

          fcb   CodeOrg

EraseEEPROM:
           ldX   #$b600
           ldaA  #eep_ERASE | eep_EELAT     ;load a with erase commands
           staA  CPU_EEPROMControlReg       ;set control reg to allow erase
           staB  0, X                       ;write any byte to the eeprom address
           inc   CPU_EEPROMControlReg       ;turn on programming bit eep_EEPGM

;need to pause 10mSecs -  delay loop is 6 cycles long so at 2 mhtz e-clock rate,
;value = 10mSec / (6 * (1 sec/2000000 cycles)) = 3334 or 0d06

           ldX   #$0d06                     ;delay value to wait until erase cycle is complete
Delay_Loop:
           dex                              ;reduce counter
           bne   Delay_Loop
           dec   CPU_EEPROMControlReg       ;turn off programming bit eep_EEPGM
           clr   CPU_EEPROMControlReg       ;set all control reg bits to 0

;loop thru eeprom and make sure that all bytes are set to $ff.  echo either last byte
;sent or byte value if it fails
           ldx   #$b600
EraseConfirm:
           ldaB  0, X
           cmpB  #$ff
           bne   SendLastByte
           inx
           cpx   #$b800
           bne   EraseConfirm

SendLastByte:                               ;send the last byte (should be $FF) to confirm erase
           ldaB  CPU_SerialStatus           ;load sci status into a
           bpl   SendLastByte               ;if any bits set loop
           staA  CPU_SerialData             ;put a into sci register and send
           jmp   Begin                      ;when finished, jump back to bootloader
EraseEEPROMEnd:
