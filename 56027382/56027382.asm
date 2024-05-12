FILCHR TEXT $3F
 OPT NOW
 OPT H11
 ORG 0

Data_start equ $8000
Code_start equ $9400
PiaAddr equ $6000
;PiaAddr equ $0400
NOEMR equ 0
; 2 is stock clock
ECLOCK equ 2
; ASD on time above freezing stock
; value is 1, about 1/2 second
ASD1 equ 1
; ASD on time below freezing, stock
; value is 1, about 1 second
ASD2 equ 1
 include ..\common\defines.inc
 ORG Data_start
 include data.inc
 ORG Code_start
 include code.inc
