FILCHR TEXT $3F
 OPT NOW
 OPT H11
 ORG 0

Data_start equ $2000
Code_start equ $2A70
PiaAddr equ $0400
NOEMR equ 1
ECLOCK equ 2
; ASD on time above freezing stock
; value is 1, about 1/2 second
ASD1 equ 8
; ASD on time below freezing, stock
; value is 1, about 1 second
ASD2 equ 5
 include ..\common\defines.inc
 ORG Data_start
 include data.inc
 ORG Code_start
 include code.inc
