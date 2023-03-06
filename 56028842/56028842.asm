FILCHR TEXT $3F
 OPT NOW
 OPT H11
 ORG 0
;
; Data_start: address defines where the EPROM begins, in the
; memory map, 4 and 6 cylinder ECU's this should be set to
; $8000, for 8 cylinder ECU's this should be set to $2000.
;
Data_start equ $8000
;
; Code_start: address defines where the executable code begins,
; 4 and 6 cylinder ECU's this is set to $9400, 8 cylinder ECU's
; this is set to $4000.
;
 IF Data_start <= $2000
Code_start equ $4000
 ENDIF
 IF Data_start == $8000
Code_start equ $9400
 ENDIF
;
; this setting defines where the 68HC11 internal EEPROM
; is located in the memory map, this setting should remain
; at $B600, unless you have changed the memory map.
;
MCU_eeprom equ $B600
;
; null bytes for 64k EEPROM
;
; OPT NOL
; REPEAT Data_start-*
; fcb 0
; OPT LIS
;
;
; base address for TI chip, correct values are $0400 for 94
; and later 8 cylinder ECU's, $6400 for 94 and later 4,6
; cylinder ECU's and $6000 for 93 and earlier ECU's.
;
 IF Data_start <= $2000
PiaAddr equ $0400
 ENDIF
 IF Data_start == $8000
PiaAddr equ $6400
 ENDIF
;
; 1 to remove emissions maintenance reminder code
;
NOEMR equ 0
;
 include ..\common\defines.inc
;
 ORG Data_start
 include data.inc
;
 ORG Code_start
 include ..\common\code.inc
;
