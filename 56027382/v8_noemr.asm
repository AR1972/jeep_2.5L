FILCHR TEXT $3F
 OPT NOW
 OPT H11
 ORG 0

Data_start equ $2000
Code_start equ $2A70
BaseAddr equ $0400
NOEMR equ 1
 include ..\common\defines.inc
 ORG Data_start
 include data.inc
 ORG Code_start
 include code.inc