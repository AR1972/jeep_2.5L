FILCHR TEXT $3F
 OPT NOW
 OPT H11
 ORG 0

Data_start equ $8000
Code_start equ $9400
PiaAddr equ $6000
NOEMR equ 0
ECLOCK equ 2
ASDTIMEOUT equ 0
 include ..\common\defines.inc
 ORG Data_start
 include data.inc
 ORG Code_start
 include code.inc
