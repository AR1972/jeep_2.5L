TL_IDENT1:	fcb 1			; DATA XREF: __RESET+73r sub_EDC9+9Cr
		fcb   0
		fcb $56
		fcb   2
		fcb $88
byte_8005:	fcb $42			; DATA XREF: sub_D185+2Br
byte_8006:	fcb $A2			; DATA XREF: RESERVED:CDC6r
		fcb $56
		fcb   2
		fcb $88
		fcb $42
byte_800B:	fcb $A2			; DATA XREF: RESERVED:CDCDr
		fcb $5D
		fcb $4E
		fcb $18
byte_800F:	fcb $15			; DATA XREF: UpdatePIA1AndCheckOutputs2_MM+120r
		fcb $88
byte_8011:	fcb 2			; DATA XREF: DetermineTargetBatteryVoltage+2r
					; ActuatorTestMode_MM+27Cr ...
word_8012:	fdb $182		; DATA XREF: ROM:E30Fr
byte_8014:	fcb $FF			; DATA XREF: sub_E191+62r
TL_CONF01:	fcb $81			; DATA XREF: __RESET+3Ar __RESET+11Er	...
TL_ConfigurationFlags2:fcb $22		; DATA XREF: __RESET+456r sub_9CC9+4r	...
TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly:fcb 3 ;	DATA XREF: __RESET+3E8r
byte_8018:	fcb $10			; DATA XREF: sub_BA1C:loc_BB26r
byte_8019:	fcb 2			; DATA XREF: sub_BA1C+110r
byte_801A:	fcb 1			; DATA XREF: sub_BA1C+117r
TL_ValueOf_MINTHR_WhenBatteryDisconnected:fcb $5C ; DATA XREF: __RESET+3EBr
					; __RESET+3F2r	...
byte_801C:	fcb $26			; DATA XREF: sub_BA1C+15Dr
byte_801D:	fcb $4C			; DATA XREF: sub_BA1C+164r
byte_801E:	fcb 4			; DATA XREF: sub_B914+1Cr sub_B914+42r ...
byte_801F:	fcb $90			; DATA XREF: sub_BA1C+BAr sub_BC36r
byte_8020:	fcb $D0			; DATA XREF: sub_BC36+7r
					; sub_BC36:loc_BC42r
byte_8021:	fcb 0			; DATA XREF: ConvertMAPVoltsToValuer
word_8022:	fdb 0			; DATA XREF: ConvertMAPVoltsToValue:loc_E6E1r
		fcb   5
		fcb $1F
		fcb   0
		fcb   0
		fcb $32
		fcb $3E
		fcb   6
		fcb   0
		fcb $42
		fcb $5D
		fcb  $E
		fcb $FF
		fcb $90
		fcb $7D
		fcb   0
		fcb   0
		fcb $29
		fcb $9C
		fcb   5
byte_8037:	fcb $90			; DATA XREF: sub_B976+24r
byte_8038:	fcb $20			; DATA XREF: sub_B976+2Br
		fcb  $F
		fcb $A0
		fcb $14
		fcb $50
		fcb $17
		fcb $70
		fcb $20
		fcb $D0
		fcb $23
		fcb $F0
		fcb $2E
		fcb $E0
		fcb $3E
		fcb $80
		fcb $4E
		fcb $20
		fcb $5D
		fcb $C0
		fcb $6D
		fcb $60
		fcb $7D
		fcb   0
		fcb $8C
		fcb $A0
		fcb $9C
		fcb $40
		fcb   3
		fcb $13
		fcb   0
		fcb   5
		fcb $25
		fcb $2F
		fcb $90
		fcb   1
		fcb   5
		fcb $9C
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
word_8072:	fdb $393		; DATA XREF: sub_E6AA+4r
byte_8074:	fcb $87			; DATA XREF: sub_E6AA+7r
		fcb   0
word_8076:	fdb 3			; DATA XREF: sub_E6AA+10r
byte_8078:	fcb $93			; DATA XREF: sub_E6AA+13r
		fcb $87
word_807A:	fdb $53B5		; DATA XREF: IC1I:loc_F0BBr
word_807C:	fdb $7530		; DATA XREF: sub_BF92+4r IC1I+170r
byte_807E:	fcb 0			; DATA XREF: sub_BF92+27r
byte_807F:	fcb $14			; DATA XREF: IC1I+1D1r
byte_8080:	fcb 2			; DATA XREF: sub_BD34+1B8r
byte_8081:	fcb 4			; DATA XREF: sub_BD34+1B0r
byte_8082:	fcb 5			; DATA XREF: sub_BD34+1A7r
		fcb $11
		fcb   9
		fcb   0
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb  $E
		fcb   8
		fcb   8
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb  $E
		fcb  $A
		fcb  $A
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $20
		fcb $20
		fcb $14
		fcb  $C
		fcb  $A
		fcb $1C
		fcb $1C
		fcb $1E
		fcb $20
		fcb $25
		fcb $25
		fcb $16
		fcb  $D
		fcb  $B
		fcb $1C
		fcb $1C
		fcb $1F
		fcb $31
		fcb $2D
		fcb $27
		fcb $17
		fcb  $E
		fcb $10
		fcb $1C
		fcb $1C
		fcb $20
		fcb $3C
		fcb $2B
		fcb $29
		fcb $1A
		fcb $10
		fcb $12
		fcb $1C
		fcb $1C
		fcb $26
		fcb $3D
		fcb $32
		fcb $2C
		fcb $1E
		fcb $10
		fcb $10
		fcb $1C
		fcb $2C
		fcb $36
		fcb $36
		fcb $34
		fcb $2F
		fcb $20
		fcb $19
		fcb $13
		fcb $1C
		fcb $2C
		fcb $36
		fcb $3B
		fcb $38
		fcb $30
		fcb $21
		fcb $1B
		fcb $16
		fcb $1C
		fcb $2C
		fcb $36
		fcb $43
		fcb $39
		fcb $33
		fcb $22
		fcb $1B
		fcb $16
		fcb $1C
		fcb $2C
		fcb $36
		fcb $47
		fcb $45
		fcb $42
		fcb $33
		fcb $22
		fcb $28
		fcb $1C
		fcb $2C
		fcb $3A
		fcb $55
		fcb $51
		fcb $49
		fcb $3F
		fcb $29
		fcb $29
		fcb $1C
		fcb $2C
		fcb $3A
		fcb $56
		fcb $52
		fcb $4A
		fcb $40
		fcb $23
		fcb $23
		fcb $1C
		fcb $2C
		fcb $3C
		fcb $58
		fcb $52
		fcb $4A
		fcb $3F
		fcb $31
		fcb $24
		fcb $1C
		fcb $2C
		fcb $40
		fcb $53
		fcb $55
		fcb $49
		fcb $46
		fcb $42
		fcb $3B
		fcb $1C
		fcb $2C
		fcb $3C
		fcb $4B
		fcb $47
		fcb $49
		fcb $48
		fcb $42
		fcb $3C
		fcb $1C
		fcb $2C
		fcb $3C
		fcb $58
		fcb $52
		fcb $4D
		fcb $48
		fcb $3F
		fcb $3A
		fcb $11
		fcb   9
		fcb   0
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb  $E
		fcb   8
		fcb   8
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb  $E
		fcb  $A
		fcb  $A
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $12
		fcb  $A
		fcb  $A
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $16
		fcb  $C
		fcb  $A
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $24
		fcb $18
		fcb  $C
		fcb  $A
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $2C
		fcb $1C
		fcb $12
		fcb $10
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $2A
		fcb $28
		fcb $18
		fcb $12
		fcb $10
		fcb $1C
		fcb $4C
		fcb $4A
		fcb $40
		fcb $36
		fcb $2C
		fcb $1C
		fcb $12
		fcb $10
		fcb $1C
		fcb $4C
		fcb $48
		fcb $4D
		fcb $36
		fcb $34
		fcb $24
		fcb $12
		fcb $10
		fcb $1C
		fcb $4C
		fcb $48
		fcb $4A
		fcb $48
		fcb $44
		fcb $2B
		fcb $12
		fcb $12
		fcb $1C
		fcb $4C
		fcb $48
		fcb $4E
		fcb $4D
		fcb $48
		fcb $33
		fcb $1F
		fcb $17
		fcb $1C
		fcb $4C
		fcb $48
		fcb $50
		fcb $4B
		fcb $44
		fcb $42
		fcb $32
		fcb $21
		fcb $1C
		fcb $4C
		fcb $54
		fcb $54
		fcb $56
		fcb $54
		fcb $42
		fcb $2A
		fcb $21
		fcb $1C
		fcb $4C
		fcb $5B
		fcb $58
		fcb $58
		fcb $54
		fcb $47
		fcb $28
		fcb $21
		fcb $1C
		fcb $4C
		fcb $4D
		fcb $50
		fcb $4D
		fcb $47
		fcb $32
		fcb $26
		fcb $23
		fcb $1C
		fcb $4C
		fcb $4D
		fcb $50
		fcb $4B
		fcb $3E
		fcb $2E
		fcb $28
		fcb $25
		fcb $1C
		fcb $4C
		fcb $4D
		fcb $50
		fcb $4B
		fcb $3E
		fcb $2E
		fcb $28
		fcb $25
byte_81BB:	fcb 3			; DATA XREF: IC1I+5A2r
		fcb $11
		fcb   9
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $98
		fcb $98
		fcb $98
		fcb $98
		fcb $98
		fcb $98
		fcb $98
		fcb $28
		fcb $26
		fcb $24
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $1A
		fcb $26
		fcb $24
		fcb $22
		fcb $20
		fcb $20
		fcb $1A
		fcb $14
		fcb $14
		fcb $14
byte_8278:	fcb $D0			; DATA XREF: sub_BD34+80r
byte_8279:	fcb 6			; DATA XREF: sub_BD34+85r
byte_827A:	fcb $14			; DATA XREF: sub_BD34+9Er
					; sub_BD34:loc_BDF2r
byte_827B:	fcb $1C			; DATA XREF: sub_BD34+CFr
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
word_828E:	fdb $1B3		; DATA XREF: IC1I+62Er
		fcb   2
		fcb   0
		fcb $FF
		fcb   0
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
word_82AF:	fdb $30D4		; DATA XREF: CalculateAverageValues+4r
					; IC1I:loc_F06Ar
word_82B1:	fdb $7530		; DATA XREF: sub_BF92+7r sub_BF92+Dr ...
		fcb $11
		fcb   9
		fcb   0
		fcb $3E
		fcb $3E
		fcb $3E
		fcb $3E
		fcb $3E
		fcb $3E
		fcb $42
		fcb $52
		fcb $6C
		fcb $50
		fcb $50
		fcb $40
		fcb $40
		fcb $48
		fcb $50
		fcb $50
		fcb $60
		fcb $80
		fcb $50
		fcb $50
		fcb $40
		fcb $40
		fcb $50
		fcb $58
		fcb $5C
		fcb $69
		fcb $8D
		fcb $4A
		fcb $60
		fcb $5B
		fcb $64
		fcb $6A
		fcb $68
		fcb $68
		fcb $6B
		fcb $86
		fcb $7A
		fcb $7A
		fcb $8E
		fcb $7D
		fcb $73
		fcb $70
		fcb $70
		fcb $6D
		fcb $80
		fcb $8A
		fcb $8A
		fcb $95
		fcb $7E
		fcb $7B
		fcb $74
		fcb $72
		fcb $76
		fcb $7A
		fcb $90
		fcb $9A
		fcb $9D
		fcb $8C
		fcb $7F
		fcb $7A
		fcb $77
		fcb $77
		fcb $7A
		fcb $A0
		fcb $9A
		fcb $9D
		fcb $88
		fcb $7D
		fcb $7A
		fcb $79
		fcb $7A
		fcb $79
		fcb $A0
		fcb $A0
		fcb $9D
		fcb $91
		fcb $80
		fcb $7B
		fcb $7A
		fcb $7C
		fcb $78
		fcb $A0
		fcb $B0
		fcb $9D
		fcb $86
		fcb $7A
		fcb $7D
		fcb $7A
		fcb $7C
		fcb $7E
		fcb $A0
		fcb $B0
		fcb $9D
		fcb $88
		fcb $7C
		fcb $7F
		fcb $7B
		fcb $7C
		fcb $A0
		fcb $A0
		fcb $CC
		fcb $98
		fcb $84
		fcb $7D
		fcb $7F
		fcb $80
		fcb $8A
		fcb $E4
		fcb $A0
		fcb $E7
		fcb $99
		fcb $88
		fcb $7E
		fcb $7E
		fcb $A0
		fcb $E3
		fcb $E3
		fcb $A0
		fcb $D5
		fcb $A2
		fcb $91
		fcb $86
		fcb $87
		fcb $8E
		fcb $F9
		fcb $AC
		fcb $A0
		fcb $DC
		fcb $B2
		fcb $A2
		fcb $97
		fcb $99
		fcb $95
		fcb $95
		fcb $8F
		fcb $A0
		fcb $90
		fcb $D5
		fcb $C3
		fcb $B4
		fcb $A9
		fcb $A5
		fcb $C9
		fcb $9B
		fcb $A0
		fcb $90
		fcb $E1
		fcb $D1
		fcb $C6
		fcb $BE
		fcb $B7
		fcb $DA
		fcb $AA
		fcb $11
		fcb   9
		fcb   0
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $38
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $40
		fcb $40
		fcb $40
		fcb $40
		fcb $40
		fcb $40
		fcb $43
		fcb $43
		fcb $43
		fcb $46
		fcb $46
		fcb $46
		fcb $46
		fcb $46
		fcb $46
		fcb $46
		fcb $46
		fcb $46
		fcb $44
		fcb $44
		fcb $44
		fcb $57
		fcb $43
		fcb $42
		fcb $47
		fcb $47
		fcb $47
		fcb $48
		fcb $48
		fcb $4B
		fcb $58
		fcb $45
		fcb $42
		fcb $4A
		fcb $4A
		fcb $4A
		fcb $5F
		fcb $5F
		fcb $5F
		fcb $58
		fcb $32
		fcb $36
		fcb $3E
		fcb $5C
		fcb $4E
		fcb $62
		fcb $64
		fcb $6D
		fcb $31
		fcb $32
		fcb $36
		fcb $43
		fcb $5C
		fcb $5C
		fcb $65
		fcb $68
		fcb $46
		fcb $3C
		fcb $3C
		fcb $3E
		fcb $45
		fcb $62
		fcb $62
		fcb $6B
		fcb $6B
		fcb $50
		fcb $3A
		fcb $35
		fcb $39
		fcb $45
		fcb $5E
		fcb $60
		fcb $6B
		fcb $6B
		fcb $49
		fcb $45
		fcb $42
		fcb $4A
		fcb $53
		fcb $6B
		fcb $6B
		fcb $50
		fcb $50
		fcb $4D
		fcb $43
		fcb $49
		fcb $50
		fcb $55
		fcb $6C
		fcb $6C
		fcb $48
		fcb $48
		fcb $46
		fcb $48
		fcb $4C
		fcb $54
		fcb $5A
		fcb $6E
		fcb $6E
		fcb $4A
		fcb $4A
		fcb $49
		fcb $49
		fcb $4E
		fcb $55
		fcb $59
		fcb $67
		fcb $67
		fcb $4C
		fcb $4C
		fcb $4C
		fcb $4B
		fcb $51
		fcb $57
		fcb $59
		fcb $59
		fcb $59
		fcb $4D
		fcb $4D
		fcb $4D
		fcb $55
		fcb $5D
		fcb $60
		fcb $70
		fcb $70
		fcb $70
		fcb $4A
		fcb $4A
		fcb $4A
		fcb $55
		fcb $5F
		fcb $5E
		fcb $5F
		fcb $5F
		fcb $5F
		fcb $D0
		fcb $A4
		fcb $74
		fcb $13
		fcb  $C
		fcb  $A
		fcb   4
		fcb   4
		fcb   4
		fcb $14
		fcb $14
		fcb $14
		fcb $14
		fcb $10
		fcb  $A
		fcb   3
		fcb   3
		fcb   3
		fcb $CA
		fcb $88
		fcb $58
		fcb $2A
		fcb $23
		fcb  $F
		fcb   5
		fcb   0
		fcb   0
		fcb $50
		fcb $48
		fcb $34
		fcb $1E
		fcb $10
		fcb   8
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $40
		fcb $60
		fcb $60
		fcb $80
		fcb $80
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $40
		fcb $40
		fcb $30
		fcb $30
		fcb $28
		fcb $20
		fcb $1A
		fcb   8
		fcb   8
byte_842A:	fcb 0			; DATA XREF: __RESET+349r sub_BF3E+Ar
		fcb   2
		fcb $58
		fcb   0
		fcb   0
		fcb   0
		fcb $FF
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   8
		fcb $61
		fcb $80
		fcb $FF
		fcb $30
		fcb $71
		fcb $73
		fcb $FD
		fcb $60
		fcb $81
		fcb $49
		fcb $FE
		fcb $4B
		fcb $92
		fcb $2C
		fcb $FE
		fcb $C0
		fcb $A2
		fcb $18
		fcb $FF
		fcb $70
		fcb $C2
		fcb   6
		fcb $FF
		fcb $E9
		fcb $E3
		fcb   3
		fcb $FF
		fcb $E5
		fcb $FF
		fcb   0
		fcb $F8
		fcb $C0
		fcb $70
		fcb $2D
		fcb $28
		fcb $25
		fcb $14
		fcb $14
		fcb $14
		fcb $CC
		fcb $CC
		fcb $CC
		fcb $CC
		fcb $CC
		fcb $CC
		fcb $E6
		fcb $FF
		fcb $FF
		fcb   4
		fcb  $C
		fcb   0
		fcb   0
		fcb $AB
		fcb $30
		fcb $18
		fcb   0
		fcb $D5
		fcb $60
		fcb $40
		fcb   2
		fcb   0
		fcb $80
		fcb $80
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   2
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $FF
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
TL_TL_8481:	fdb $8000		; DATA XREF: sub_C75D+1E5r
TL_TL_8483:	fcb $D0			; DATA XREF: sub_C75D+1BAr
TL_TL_8484:	fcb $D0			; DATA XREF: sub_C75D+1C1r
TL_TL_8485:	fcb 4			; DATA XREF: sub_C75D+1CFr
		fcb $10
		fcb $10
		fcb $10
		fcb $10
		fcb $12
		fcb $18
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $10
		fcb $10
		fcb $10
		fcb  $B
		fcb   8
		fcb   8
		fcb   4
		fcb   4
		fcb   4
		fcb $20
		fcb $20
		fcb $20
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $CF
		fcb $A0
		fcb $7D
		fcb $32
		fcb $2A
		fcb $2A
		fcb $1C
		fcb $1C
		fcb $16
		fcb $60
		fcb $50
		fcb $40
		fcb $40
		fcb $30
		fcb $30
		fcb $10
		fcb $10
		fcb $10
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $40
		fcb $40
		fcb $40
		fcb $40
		fcb $80
		fcb $80
byte_84D2:	fcb $96			; DATA XREF: sub_BC01+15r
byte_84D3:	fcb $60			; DATA XREF: sub_BC01+3r
byte_84D4:	fcb $9F			; DATA XREF: sub_BC01+21r
		fcb $20
		fcb $20
word_84D7:	fdb 1			; DATA XREF: sub_C75D+93r sub_C75D+98r ...
word_84D9:	fdb $FFD6		; DATA XREF: sub_C75D+EFr sub_C75D+F4r ...
word_84DB:	fdb $219		; DATA XREF: sub_C975:loc_C9E0r
					; sub_C975:loc_C9F5r
byte_84DD:	fcb $99			; DATA XREF: sub_C474:loc_C480r
byte_84DE:	fcb $99			; DATA XREF: sub_C474:loc_C488r
		fcb $40
		fcb $40
byte_84E1:	fcb $F0			; DATA XREF: sub_C49A+1Er
		fcb $28
		fcb $28
		fcb $24
		fcb $1D
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
byte_84EB:	fcb $10			; DATA XREF: sub_C4CE:loc_C4E7r
word_84EC:	fdb $24F		; DATA XREF: sub_C4CE+2r
		fcb   5
		fcb $13
		fcb   0
		fcb  $A
		fcb $AB
		fcb $19
		fcb $40
		fcb  $A
		fcb $AB
		fcb $1F
		fcb $80
		fcb   2
		fcb $11
		fcb $3E
		fcb $C0
		fcb   1
		fcb $57
		fcb $6D
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   5
		fcb   9
		fcb   0
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $1C
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $18
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   5
		fcb   9
		fcb   0
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $22
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $20
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
byte_8645:	fcb $B			; DATA XREF: sub_C5A3+2Br
byte_8646:	fcb $10			; DATA XREF: sub_C5A3:loc_C5D3r
byte_8647:	fcb $20			; DATA XREF: sub_C5A3+26r
byte_8648:	fcb $20			; DATA XREF: sub_C5A3+6r
byte_8649:	fcb 4			; DATA XREF: sub_C4CE+6Dr sub_C5A3+18r ...
byte_864A:	fcb 2			; DATA XREF: sub_C5DF+11r sub_C5DF+46r
byte_864B:	fcb $60			; DATA XREF: sub_C4CE+72r sub_C5A3+1Dr
byte_864C:	fcb 1			; DATA XREF: sub_C5DF:loc_C612r
byte_864D:	fcb $FE			; DATA XREF: sub_C5DF+1Cr
byte_864E:	fcb $29			; DATA XREF: sub_C2E6+2r
		fcb $40
byte_8650:	fcb $B			; DATA XREF: sub_C638+Er
byte_8651:	fcb 5			; DATA XREF: sub_C638+30r
byte_8652:	fcb $8C			; DATA XREF: sub_C638+1Er
		fcb $C0
byte_8654:	fcb $B			; DATA XREF: IC1I+164r
byte_8655:	fcb $15			; DATA XREF: sub_C674+15r
		fcb $20
byte_8657:	fcb $26			; DATA XREF: sub_C674+Ar
byte_8658:	fcb $10			; DATA XREF: sub_C674+32r
byte_8659:	fcb $A0			; DATA XREF: sub_C674+23r
		fcb $C0
		fcb $C0
byte_865C:	fcb $D6			; DATA XREF: sub_C1F1+4Cr
byte_865D:	fcb 8			; DATA XREF: sub_C1F1:loc_C236r
byte_865E:	fcb $2C			; DATA XREF: sub_C1F1+5Dr
byte_865F:	fcb $74			; DATA XREF: sub_C1F1+58r
byte_8660:	fcb $FF			; DATA XREF: sub_C1F1+53r
byte_8661:	fcb 1			; DATA XREF: sub_C1F1:loc_C269r
byte_8662:	fcb $38			; DATA XREF: sub_C1F1+64r
		fcb $10
		fcb   7
		fcb $A0
		fcb   0
		fcb $C0
		fcb   8
		fcb   3
		fcb $90
		fcb   0
		fcb $E0
byte_866D:	fcb $A8			; DATA XREF: sub_C1F1+2Fr sub_C1F1+DDr
byte_866E:	fcb $68			; DATA XREF: sub_C1F1+2Ar sub_C1F1+E3r
byte_866F:	fcb $10			; DATA XREF: sub_C1F1+C5r
					; sub_C1F1:loc_C2BBr
byte_8670:	fcb 4			; DATA XREF: sub_C1F1+ECr
byte_8671:	fcb $58			; DATA XREF: sub_C184+2r
byte_8672:	fcb $17			; DATA XREF: sub_C184+12r
byte_8673:	fcb $85			; DATA XREF: sub_C184+3Cr
byte_8674:	fcb $32			; DATA XREF: sub_C184+48r
					; sub_C184:loc_C1EBr
byte_8675:	fcb $24			; DATA XREF: sub_C184:loc_C1D1r
					; sub_C184+60r
byte_8676:	fcb $56			; DATA XREF: sub_C184+1Fr
byte_8677:	fcb $F1			; DATA XREF: sub_C184+24r
byte_8678:	fcb $17			; DATA XREF: sub_C184:loc_C1B2r
word_8679:	fdb 1			; DATA XREF: sub_C184+5Br
byte_867B:	fcb $6E			; DATA XREF: sub_C184+43r
byte_867C:	fcb $A0			; DATA XREF: sub_C975+66r
word_867D:	fdb $384		; DATA XREF: sub_C975+31r sub_C975+40r ...
byte_867F:	fcb 2			; DATA XREF: sub_C975+2Cr
byte_8680:	fcb $C0			; DATA XREF: sub_C975:loc_C989r
byte_8681:	fcb $F0			; DATA XREF: sub_C04E+1Cr
byte_8682:	fcb 3			; DATA XREF: sub_C04E:loc_C0B0r
byte_8683:	fcb 1			; DATA XREF: sub_C109+17r
byte_8684:	fcb 8			; DATA XREF: sub_C04E+2r
byte_8685:	fcb $A			; DATA XREF: sub_C04E+9r
byte_8686:	fcb $9A			; DATA XREF: sub_C04E+10r
word_8687:	fdb 0			; DATA XREF: sub_C109+Dr
word_8689:	fdb $30A		; DATA XREF: sub_C109+26r sub_C109+35r
byte_868B:	fcb 0			; DATA XREF: sub_C04E+17r
byte_868C:	fcb 2			; DATA XREF: sub_C04E:loc_C087r
word_868D:	fdb $2F0		; DATA XREF: sub_C04E+4Ar sub_C04E+58r
word_868F:	fdb $9C40		; DATA XREF: sub_C04E:loc_C0BEr
word_8691:	fdb $190		; DATA XREF: sub_C04E+77r
byte_8693:	fcb $E0			; DATA XREF: sub_C04E+84r
byte_8694:	fcb 6			; DATA XREF: sub_C04E+8Br
word_8695:	fdb $B220		; DATA XREF: sub_C04E:loc_C0ECr
word_8697:	fdb $190		; DATA XREF: sub_C04E+A5r
byte_8699:	fcb $80			; DATA XREF: sub_BD34+120r
byte_869A:	fcb 1			; DATA XREF: IC1I+497r
word_869B:	fdb $B6			; DATA XREF: sub_BD34+127r
byte_869D:	fcb $F			; DATA XREF: sub_BD34+113r
byte_869E:	fcb $1C			; DATA XREF: sub_BD34:loc_BEABr
byte_869F:	fcb $1C			; DATA XREF: sub_BD34:loc_BE9Cr
		fcb   2
		fcb   5
		fcb   0
		fcb   1
		fcb $6E
		fcb  $C
		fcb  $A
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   2
		fcb   5
		fcb   0
		fcb $FF
		fcb $9A
		fcb  $F
		fcb $FC
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
byte_86B6:	fcb $71			; DATA XREF: sub_EB1C+FEr
		fcb   3
		fcb $D0
		fcb $D0
		fcb   0
		fcb   0
		fcb $D0
		fcb $D0
		fcb   0
		fcb   0
		fcb $D0
		fcb $D0
		fcb   5
		fcb $58
		fcb $E0
		fcb $FE
		fcb $66
		fcb $80
		fcb $A0
		fcb $FD
		fcb $CD
		fcb $A8
		fcb $48
		fcb $FF
		fcb $9A
		fcb $D0
		fcb $38
		fcb   0
		fcb $CD
		fcb $F8
		fcb $58
		fcb   3
		fcb $9A
		fcb $28
		fcb $FF
		fcb $7A
		fcb $C8
		fcb $10
		fcb $FF
		fcb $9A
		fcb $F0
		fcb   0
byte_86E0:	fcb $11			; DATA XREF: sub_A327+22Fr
byte_86E1:	fcb $A0			; DATA XREF: sub_A327+239r
byte_86E2:	fcb $20			; DATA XREF: sub_A5D4+43r
byte_86E3:	fcb $D0			; DATA XREF: sub_A327+24Ar
byte_86E4:	fcb $EE			; DATA XREF: sub_A5D4+72r
		fcb   4
		fcb $14
		fcb $11
		fcb   0
		fcb   0
		fcb $3C
		fcb $11
		fcb   0
		fcb   0
		fcb $64
		fcb $11
		fcb   0
		fcb $3C
		fcb $82
		fcb $18
byte_86F4:	fcb 0			; DATA XREF: sub_A327+259r
		fcb   4
		fcb $68
		fcb $50
		fcb $FF
		fcb $55
		fcb $80
		fcb $40
		fcb $FF
		fcb $6B
		fcb $B0
		fcb $24
		fcb $FF
		fcb   7
		fcb $D5
		fcb   0
		fcb   3
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $10
		fcb   0
		fcb   0
		fcb   0
		fcb $21
		fcb   0
		fcb   4
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   2
		fcb   0
		fcb   0
		fcb   0
		fcb   5
		fcb   0
		fcb   0
		fcb   0
		fcb $1E
		fcb   0
		fcb   4
		fcb $1C
		fcb   8
		fcb   0
		fcb   0
		fcb $2E
		fcb   8
		fcb   0
		fcb   0
		fcb $3F
		fcb   8
		fcb   0
		fcb   0
		fcb $FF
		fcb   8
		fcb   3
		fcb $9A
		fcb $50
		fcb $FF
		fcb $DF
		fcb $C8
		fcb $4A
		fcb $FF
		fcb $C0
		fcb $F0
		fcb $40
		fcb   5
		fcb $58
		fcb $96
		fcb $FF
		fcb $86
		fcb $A8
		fcb $70
		fcb $FF
		fcb $86
		fcb $D0
		fcb $5D
		fcb   0
		fcb   0
		fcb $E5
		fcb $5D
		fcb   4
		fcb $1C
		fcb $EE
		fcb $82
		fcb   5
		fcb $58
		fcb $96
		fcb $FF
		fcb $86
		fcb $A8
		fcb $70
		fcb $FF
		fcb $86
		fcb $D0
		fcb $5D
		fcb   0
		fcb   0
		fcb $E5
		fcb $5D
		fcb   4
		fcb $1C
		fcb $EE
		fcb $82
		fcb   3
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
byte_8769:	fcb $67			; DATA XREF: sub_A327+B1r
byte_876A:	fcb $5D			; DATA XREF: sub_A327:loc_A393r
		fcb   5
		fcb $32
		fcb   1
		fcb   0
		fcb   0
		fcb $4B
		fcb   2
		fcb   0
		fcb   0
		fcb $5A
		fcb   3
		fcb   0
		fcb   0
		fcb $78
		fcb   5
		fcb   0
		fcb   0
		fcb $96
		fcb   8
		fcb   5
		fcb $40
		fcb $FF
		fcb   0
		fcb   0
		fcb $A0
		fcb $FF
		fcb   0
		fcb   0
		fcb $C8
		fcb $FF
		fcb   0
		fcb   0
		fcb $E6
		fcb $FF
		fcb   0
		fcb   0
		fcb $FF
		fcb $FF
byte_8791:	fcb $A			; DATA XREF: sub_A5D4+4Cr
byte_8792:	fcb $A			; DATA XREF: sub_A5D4+2Br
byte_8793:	fcb $EB			; DATA XREF: sub_A5D4+62r
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $16
		fcb $14
		fcb $14
byte_879D:	fcb $25			; DATA XREF: sub_A327+137r
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $1A
		fcb $16
		fcb $14
		fcb $14
byte_87A7:	fcb $38			; DATA XREF: sub_A327:loc_A4C7r
					; sub_A65D+FFr
byte_87A8:	fcb $DB			; DATA XREF: sub_A327:loc_A597r
					; sub_A327:loc_A59Cr ...
		fcb $40
		fcb $50
byte_87AB:	fcb $7F			; DATA XREF: sub_A327+282r
byte_87AC:	fcb $10			; DATA XREF: sub_A327+26Br
					; sub_A65D+10Cr ...
byte_87AD:	fcb 8			; DATA XREF: sub_A327+262r
					; sub_A65D+130r ...
		fcb   3
		fcb $58
		fcb $F0
		fcb   0
		fcb   0
		fcb $A8
		fcb $F0
		fcb   0
		fcb   0
		fcb $F8
		fcb $F0
		fcb   3
		fcb $58
		fcb $10
		fcb   0
		fcb   0
		fcb $A8
		fcb $10
		fcb   0
		fcb   0
		fcb $F8
		fcb $10
		fcb   4
		fcb $9A
		fcb $E8
		fcb   0
		fcb $36
		fcb $AD
		fcb $EC
		fcb   0
		fcb   0
		fcb $C8
		fcb $EC
		fcb   0
		fcb $80
		fcb $F0
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   2
		fcb  $B
		fcb   0
		fcb   0
		fcb   0
		fcb $1B
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb $58
		fcb $30
		fcb $FF
		fcb $B3
		fcb $80
		fcb $24
		fcb $FF
		fcb $80
		fcb $A8
		fcb $10
		fcb $FF
		fcb $9A
		fcb $D0
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb $1F
		fcb   0
		fcb   0
		fcb   0
		fcb $46
		fcb   0
		fcb   0
		fcb   0
		fcb $6D
		fcb   0
		fcb   0
		fcb   0
		fcb $BC
		fcb   0
		fcb   3
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $8F
		fcb   0
		fcb   0
		fcb   0
		fcb $FF
		fcb   0
		fcb   2
		fcb $90
		fcb $FF
		fcb   0
		fcb   0
		fcb $C7
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb   8
		fcb   0
		fcb   0
		fcb $80
		fcb  $C
		fcb   2
		fcb   0
		fcb $40
		fcb $10
		fcb   3
		fcb   0
		fcb $40
		fcb $18
		fcb   5
		fcb   4
		fcb   8
		fcb   0
		fcb $FF
		fcb $C0
		fcb  $C
		fcb $FF
		fcb $FF
		fcb $C0
		fcb $10
		fcb $FE
		fcb $FF
		fcb $E0
		fcb $18
		fcb $FD
byte_8838:	fcb $3F			; DATA XREF: sub_A65D+165r
byte_8839:	fcb $D6			; DATA XREF: sub_A65D+CFr
byte_883A:	fcb 2			; DATA XREF: sub_A65D:loc_A738r
byte_883B:	fcb $12			; DATA XREF: sub_A65D+67r
byte_883C:	fcb $1E			; DATA XREF: sub_A65D:loc_A68Er
byte_883D:	fcb 3			; DATA XREF: sub_A65D+1Fr sub_A65D+24r ...
byte_883E:	fcb $B			; DATA XREF: sub_A65D+C0r
byte_883F:	fcb $7F			; DATA XREF: sub_A65D+B9r
byte_8840:	fcb 0			; DATA XREF: sub_A327+86r
byte_8841:	fcb 0			; DATA XREF: sub_A327+81r
word_8842:	fdb $FAD		; DATA XREF: sub_9B32+62r
byte_8844:	fcb $70			; DATA XREF: sub_9B32+67r
byte_8845:	fcb $8C			; DATA XREF: sub_9B32r
byte_8846:	fcb $70			; DATA XREF: sub_9B32+16r
byte_8847:	fcb $FF			; DATA XREF: sub_9B32+51r
word_8848:	fdb $FF00		; DATA XREF: sub_9B32+58r
word_884A:	fdb $FF00		; DATA XREF: sub_9B32+5Dr
byte_884C:	fcb 0			; DATA XREF: sub_9B32+32r sub_A5D4+36r
byte_884D:	fcb $B6			; DATA XREF: sub_9BBE+15r
byte_884E:	fcb 7			; DATA XREF: sub_DB43+1Er
byte_884F:	fcb $10			; DATA XREF: sub_9D4C+153r
byte_8850:	fcb $FE			; DATA XREF: sub_9D4C:loc_9EA5r
byte_8851:	fcb $FE			; DATA XREF: sub_9D4C+148r
byte_8852:	fcb $10			; DATA XREF: sub_9D4C+160r
byte_8853:	fcb $A			; DATA XREF: sub_9D4C+17Ar
					; sub_9D4C+187r
byte_8854:	fcb 4			; DATA XREF: sub_9D4C+16Cr
byte_8855:	fcb $70			; DATA XREF: sub_9D4C+134r
byte_8856:	fcb 3			; DATA XREF: sub_9D4C+13Br
byte_8857:	fcb $58			; DATA XREF: sub_A283+Er
byte_8858:	fcb $FF			; DATA XREF: sub_A283+9r
byte_8859:	fcb $5A			; DATA XREF: sub_A2BB+2Br
byte_885A:	fcb $46			; DATA XREF: sub_A2BB+30r
		fcb $E8
		fcb $E3
		fcb $E8
		fcb $E3
word_885F:	fdb $13E2		; DATA XREF: sub_9CC9+19r
word_8861:	fdb $100		; DATA XREF: sub_9CC9+2Fr
byte_8863:	fcb $25			; DATA XREF: sub_9CC9+15r
byte_8864:	fcb $C0			; DATA XREF: sub_9CC9+43r sub_9CC9+4Fr ...
byte_8865:	fcb $92			; DATA XREF: sub_9FED+2Dr
byte_8866:	fcb 0			; DATA XREF: sub_9FED:loc_A06Er
byte_8867:	fcb $20			; DATA XREF: sub_9FED+45r
byte_8868:	fcb $32			; DATA XREF: sub_9FED:loc_A007r
byte_8869:	fcb 0			; DATA XREF: sub_9FED+21r
byte_886A:	fcb 6			; DATA XREF: sub_9FED:loc_A07Br
byte_886B:	fcb $40			; DATA XREF: sub_9FED+32r
		fcb   6
		fcb $1C
		fcb $24
		fcb   0
		fcb $E7
		fcb $3B
		fcb $40
		fcb   5
		fcb $C0
		fcb $3F
		fcb $57
		fcb   6
		fcb $AB
		fcb $42
		fcb $6B
		fcb   0
		fcb   0
		fcb $54
		fcb $6B
		fcb   0
		fcb   0
		fcb $54
		fcb $A8
		fcb   4
		fcb $1F
		fcb  $F
		fcb   0
		fcb $F7
		fcb $74
		fcb $61
		fcb   0
		fcb   0
		fcb $8A
		fcb $61
		fcb   0
		fcb   0
		fcb $8A
		fcb $A8
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb $1F
		fcb  $F
		fcb   0
		fcb $F7
		fcb $74
		fcb $61
		fcb   0
		fcb   0
		fcb $8A
		fcb $61
		fcb   0
		fcb   0
		fcb $8A
		fcb $A8
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
byte_88B1:	fcb $B8			; DATA XREF: sub_9FED+E1r
byte_88B2:	fcb 7			; DATA XREF: sub_9FED+CFr
byte_88B3:	fcb $7C			; DATA XREF: sub_9FED+F4r
					; sub_9FED+180r
byte_88B4:	fcb $14			; DATA XREF: sub_9FED+100r
byte_88B5:	fcb $66			; DATA XREF: sub_9FED+120r
		fcb $81
		fcb $18
byte_88B8:	fcb $20			; DATA XREF: sub_9FED+17Dr
byte_88B9:	fcb $11			; DATA XREF: sub_9FED+185r
byte_88BA:	fcb 0			; DATA XREF: sub_9FED+C0r
					; sub_9FED+172r
		fcb   4
		fcb $64
		fcb  $F
		fcb   0
		fcb   0
		fcb $64
		fcb $2E
		fcb   0
		fcb $AB
		fcb $82
		fcb $42
		fcb   0
		fcb   0
		fcb $82
		fcb $A8
		fcb   2
		fcb $64
		fcb  $F
		fcb   0
		fcb   0
		fcb $96
		fcb  $F
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb $5E
		fcb   5
		fcb   0
		fcb   0
		fcb $5E
		fcb $33
		fcb   0
		fcb $AB
		fcb $7C
		fcb $47
		fcb   0
		fcb   0
		fcb $7C
		fcb $A8
		fcb   2
		fcb $5E
		fcb   5
		fcb   0
		fcb   0
		fcb $96
		fcb   5
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
byte_88F7:	fcb $50			; DATA XREF: sub_A18C+19r
TL_TL_88E4:	fcb $2D			; DATA XREF: __RESET+FDr sub_A18C+24r
byte_88F9:	fcb $28			; DATA XREF: sub_A18C+29r
byte_88FA:	fcb $A			; DATA XREF: sub_A18C+39r
byte_88FB:	fcb 6			; DATA XREF: sub_A18C:loc_A1E0r
byte_88FC:	fcb 5			; DATA XREF: sub_A18C+65r
byte_88FD:	fcb $10			; DATA XREF: sub_A18C+71r
byte_88FE:	fcb $F			; DATA XREF: sub_A18C+80r
byte_88FF:	fcb $50			; DATA XREF: sub_A18C+9Dr
byte_8900:	fcb 8			; DATA XREF: sub_A18C+A8r
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $41
		fcb $41
		fcb $3F
		fcb $3C
		fcb $40
		fcb $40
byte_890A:	fcb 8			; DATA XREF: sub_A18C+BEr
byte_890B:	fcb $D			; DATA XREF: sub_A18C+D1r
byte_890C:	fcb $80			; DATA XREF: sub_A18C+DDr
byte_890D:	fcb $FE			; DATA XREF: sub_A802+4D5r
byte_890E:	fcb $F0			; DATA XREF: sub_A802+4DEr
byte_890F:	fcb 0			; DATA XREF: sub_A802:loc_A94Cr
byte_8910:	fcb $40			; DATA XREF: sub_A802+286r
byte_8911:	fcb $30			; DATA XREF: sub_A802:loc_AD00r
byte_8912:	fcb 0			; DATA XREF: sub_A802+5BBr
byte_8913:	fcb $94			; DATA XREF: sub_A802:loc_ADD7r
byte_8914:	fcb $AA			; DATA XREF: sub_A802+24Cr
					; sub_A802+264r ...
byte_8915:	fcb $46			; DATA XREF: sub_A802:loc_AA73r
byte_8916:	fcb $4F			; DATA XREF: sub_A802+65r
byte_8917:	fcb 0			; DATA XREF: sub_A802+6Ar
byte_8918:	fcb $3C			; DATA XREF: sub_A802+26r
byte_8919:	fcb $9A			; DATA XREF: sub_A802+30r
byte_891A:	fcb 8			; DATA XREF: sub_A802+251r
		fcb   4
		fcb $2D
byte_891D:	fcb $20			; DATA XREF: sub_A802:loc_AD55r
byte_891E:	fcb $20			; DATA XREF: sub_A802+56Ar
byte_891F:	fcb 2			; DATA XREF: sub_A802+32Dr
byte_8920:	fcb 1			; DATA XREF: sub_A802+5DAr
byte_8921:	fcb 1			; DATA XREF: sub_A802+5ABr
byte_8922:	fcb 5			; DATA XREF: sub_A802+5E1r
byte_8923:	fcb 5			; DATA XREF: sub_A802+5B2r
byte_8924:	fcb $80			; DATA XREF: sub_A802+18Dr
byte_8925:	fcb 6			; DATA XREF: sub_A802+162r
byte_8926:	fcb 4			; DATA XREF: sub_A802+2B4r
byte_8927:	fcb $18			; DATA XREF: sub_A802+294r
byte_8928:	fcb 6			; DATA XREF: sub_A802+2BFr
byte_8929:	fcb $74			; DATA XREF: sub_AB3C+27r
					; sub_A802+3F8r
byte_892A:	fcb 2			; DATA XREF: sub_A802+447r
byte_892B:	fcb 4			; DATA XREF: sub_A802:loc_ABF0r
byte_892C:	fcb $10			; DATA XREF: sub_A802+40Br
byte_892D:	fcb $F0			; DATA XREF: sub_A802+410r
byte_892E:	fcb 4			; DATA XREF: sub_A802:loc_AC24r
byte_892F:	fcb 4			; DATA XREF: sub_A802+415r
byte_8930:	fcb $28			; DATA XREF: sub_A802+425r
					; sub_A802+42Ar
byte_8931:	fcb $D8			; DATA XREF: sub_A802+418r
					; sub_A802+41Dr
byte_8932:	fcb $B			; DATA XREF: sub_A802:loc_ABE5r
byte_8933:	fcb 8			; DATA XREF: sub_A802+3D3r
		fcb   4
		fcb   0
		fcb   0
		fcb $FF
		fcb $FB
		fcb $30
		fcb $FF
		fcb $FF
		fcb $F6
		fcb $80
		fcb $FC
		fcb $FF
		fcb $EC
		fcb $FF
		fcb $F2
		fcb   5
		fcb   0
		fcb   0
		fcb   0
		fcb $30
		fcb $10
		fcb   3
		fcb   0
		fcb $1B
		fcb $40
		fcb   8
		fcb   0
		fcb $20
		fcb $80
		fcb $10
		fcb   0
		fcb  $C
		fcb $FF
		fcb $16
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb   0
		fcb   0
		fcb   1
		fcb   0
		fcb $10
		fcb $10
		fcb   0
		fcb $C0
		fcb $30
		fcb $28
		fcb   0
		fcb $20
		fcb $70
		fcb $30
		fcb   4
		fcb   0
		fcb   0
		fcb   0
		fcb $B3
		fcb $3C
		fcb $2A
		fcb   0
		fcb $1A
		fcb $5A
		fcb $2D
		fcb   0
		fcb $26
		fcb $6E
		fcb $30
		fcb   5
		fcb   0
		fcb $C0
		fcb $FF
		fcb $55
		fcb $30
		fcb $A0
		fcb $FF
		fcb $9A
		fcb $80
		fcb $80
		fcb $FF
		fcb $55
		fcb $B0
		fcb $60
		fcb $FF
		fcb   0
		fcb $D0
		fcb $40
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb $80
		fcb $80
		fcb   1
		fcb   0
		fcb $84
		fcb $84
		fcb   0
		fcb $20
		fcb $94
		fcb $86
		fcb   0
		fcb $14
		fcb $C6
		fcb $8A
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   4
		fcb $46
		fcb   4
		fcb $FF
		fcb $F3
		fcb $5A
		fcb   3
		fcb $FF
		fcb $F3
		fcb $6E
		fcb   2
		fcb $FF
		fcb $E6
		fcb $82
		fcb   0
		fcb   4
		fcb   0
		fcb   6
		fcb   0
		fcb $E0
		fcb $10
		fcb $14
		fcb   0
		fcb $90
		fcb $20
		fcb $1D
		fcb   0
		fcb $30
		fcb $30
		fcb $20
		fcb   3
		fcb   2
		fcb $18
		fcb $10
		fcb   0
		fcb   4
		fcb $38
		fcb   8
		fcb   0
		fcb   6
		fcb $48
		fcb   2
		fcb $20
		fcb $E8
		fcb $FE
		fcb $80
		fcb $30
		fcb $D0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   2
		fcb $A0
		fcb   3
		fcb   0
		fcb $18
		fcb $C0
		fcb   6
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   2
		fcb $A8
		fcb $80
		fcb $FE
		fcb $ED
		fcb $D0
		fcb $55
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   2
		fcb $60
		fcb   0
		fcb   0
		fcb   0
		fcb $40
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb   2
		fcb $A8
		fcb   0
		fcb   0
		fcb   0
		fcb $D0
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
byte_8A12:	fcb 2			; DATA XREF: sub_AE79:loc_AE80r
		fcb $20
		fcb  $D
word_8A15:	fdb $C			; DATA XREF: sub_AE79+30r
word_8A17:	fdb $2000		; DATA XREF: sub_AE79+5Ar
byte_8A19:	fcb 2			; DATA XREF: sub_AE79+39r sub_AE79+65r
byte_8A1A:	fcb 2			; DATA XREF: sub_AE79+76r
byte_8A1B:	fcb $80			; DATA XREF: sub_AE79+44r
byte_8A1C:	fcb 0			; DATA XREF: sub_C6B5+2r
byte_8A1D:	fcb 0			; DATA XREF: sub_C6B5+1Er
		fcb $10
		fcb $10
		fcb $10
		fcb $10
		fcb $10
		fcb $10
		fcb $10
		fcb $10
		fcb $10
byte_8A27:	fcb 0			; DATA XREF: sub_B9BA+2Br
byte_8A28:	fcb 0			; DATA XREF: sub_C6ED+21r
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $26
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
byte_8A38:	fcb 4			; DATA XREF: UpdatePIA1AndCheckOutputs2_MM+169r
byte_8A39:	fcb $11			; DATA XREF: sub_D3E1+3Ar
byte_8A3A:	fcb $EB			; DATA XREF: sub_D69A+30r
byte_8A3B:	fcb $93			; DATA XREF: sub_9D4Cr	sub_D69A+37r
byte_8A3C:	fcb $7E			; DATA XREF: sub_D69A+3Er
TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup:fcb	$63 ; DATA XREF: __RESET+3FDr
TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup:fcb	$E4 ; DATA XREF: __RESET+402r
byte_8A3F:	fcb $CF			; DATA XREF: sub_DB01+6r
byte_8A40:	fcb $32			; DATA XREF: sub_DB01+20r
byte_8A41:	fcb $AA			; DATA XREF: sub_DB01+28r
byte_8A42:	fcb 4			; DATA XREF: sub_D7EB+16r
byte_8A43:	fcb $BD			; DATA XREF: sub_D7EB+Br
byte_8A44:	fcb $79			; DATA XREF: sub_D7EB+6r
TL_CoolantTempOutOfRangeLow:fcb	$1A	; DATA XREF: __RESET+39Cr sub_B800+3Fr
TL_CoolantTempOutOfRangeHigh:fcb $FD	; DATA XREF: __RESET+397r sub_B800+3Ar
TL_DefaultCoolantTempRaw:fcb $B1	; DATA XREF: __RESET:UseDefaultCoolantTempr
					; sub_B800+77r
TL_ChargeTempOutOfRangeLow:fcb $1A	; DATA XREF: __RESET+3CCr sub_B88A+42r
TL_ChargeTempOutOfRangeHigh:fcb	$FD	; DATA XREF: __RESET+3C7r
					; sub_B88A:loc_B8C7r
TL_DefaultChargeTemp_Limpin:fcb	$B1	; DATA XREF: __RESET:UseDefaultChargeTempr
					; sub_B88A+7Ar
byte_8A4B:	fcb $10			; DATA XREF: sub_DD3A+18r
word_8A4C:	fdb $2EE0		; DATA XREF: sub_DD3A+1Fr
byte_8A4E:	fcb $8E			; DATA XREF: sub_DD3A+3Br
byte_8A4F:	fcb $7F			; DATA XREF: sub_DD3A+4Br
byte_8A50:	fcb 4			; DATA XREF: sub_EB1C+8Ar
byte_8A51:	fcb 6			; DATA XREF: sub_DD3A:loc_DD91r
byte_8A52:	fcb $2E			; DATA XREF: sub_C5DF+2Br
byte_8A53:	fcb $22			; DATA XREF: sub_C4CE+5Ar
					; ActuatorTestMode_MM+2B1r ...
byte_8A54:	fcb $14			; DATA XREF: sub_C4CE+5Fr
					; ActuatorTestMode_MM+2B6r ...
byte_8A55:	fcb $A			; DATA XREF: sub_C4CE+20r
byte_8A56:	fcb $38			; DATA XREF: sub_D842+27r
byte_8A57:	fcb $70			; DATA XREF: sub_D842+2Er
byte_8A58:	fcb $B0			; DATA XREF: sub_D842+Cr
byte_8A59:	fcb 8			; DATA XREF: sub_BA1C+6Fr sub_C75D+Ar	...
byte_8A5A:	fcb $F0			; DATA XREF: sub_BA1C+74r sub_C75D+Fr	...
byte_8A5B:	fcb $D1			; DATA XREF: sub_BA1C+B5r
byte_8A5C:	fcb $20			; DATA XREF: sub_BA1C+62r
byte_8A5D:	fcb $28			; DATA XREF: sub_BA1C+4Dr
byte_8A5E:	fcb $2F			; DATA XREF: sub_BA1C+23r sub_BA1C+54r
byte_8A5F:	fcb $28			; DATA XREF: sub_BA1C+5Br
byte_8A60:	fcb $DC			; DATA XREF: sub_BA1C+Cr sub_BA1C+3Dr
byte_8A61:	fcb $8C			; DATA XREF: sub_BA1C:loc_BA50r
byte_8A62:	fcb $64			; DATA XREF: sub_BA1C+2Fr
byte_8A63:	fcb $CE			; DATA XREF: sub_BA1C+2Ar
TL_t3_0xfd:	fcb $AB			; DATA XREF: RESERVED:loc_D149r
byte_8A65:	fcb 2			; DATA XREF: sub_C75D+2Cr sub_DA31+7Cr ...
byte_8A66:	fcb $FD			; DATA XREF: sub_C75D+27r sub_DA31+54r ...
TL_MapSensorMiddleLimit:fcb $66		; DATA XREF: __RESET+267r __RESET+27Br ...
byte_8A68:	fcb 1			; DATA XREF: sub_D9A2+25r sub_D9A2+56r
byte_8A69:	fcb 2			; DATA XREF: sub_D9A2+5Br
byte_8A6A:	fcb 5			; DATA XREF: sub_D9A2+5r
					; sub_D9A2:loc_DA18r
		fcb $F0
		fcb $80
		fcb $50
		fcb $40
		fcb $30
		fcb $30
		fcb $20
		fcb $20
		fcb $20
		fcb $10
		fcb $10
		fcb $10
		fcb $10
		fcb   0
		fcb   0
		fcb   0
word_8A7B:	fdb $12C0		; DATA XREF: sub_D9A2+2Cr
word_8A7D:	fdb $2EE0		; DATA XREF: sub_D9A2+32r
byte_8A7F:	fcb $12			; DATA XREF: sub_D9A2+3Ar
byte_8A80:	fcb $F7			; DATA XREF: sub_D9A2+3Fr
word_8A81:	fdb $200		; DATA XREF: sub_D9A2:loc_DA12r
					; sub_DA31:loc_DA4Cr
byte_8A83:	fcb $CE			; DATA XREF: sub_DA31+2Cr
		fcb $21
		fcb $10
		fcb   5
		fcb   0
		fcb   0
		fcb   7
		fcb $92
		fcb   7
		fcb $35
		fcb   4
		fcb $64
		fcb $19
		fcb $84
		fcb   1
		fcb $66
		fcb $28
		fcb $99
		fcb   0
		fcb $95
		fcb $34
		fcb $A0
byte_8A99:	fcb $2E			; DATA XREF: RESERVED:D7E3r
byte_8A9A:	fcb $B			; DATA XREF: RESERVED:D7D6r
byte_8A9B:	fcb $20			; DATA XREF: sub_A327+FBr
byte_8A9C:	fcb 3			; DATA XREF: sub_9D4C+118r
byte_8A9D:	fcb $D2			; DATA XREF: sub_9D4C+10r
byte_8A9E:	fcb 5			; DATA XREF: sub_9D4C+1Cr
byte_8A9F:	fcb $20			; DATA XREF: sub_9D4C+32r
byte_8AA0:	fcb $40			; DATA XREF: sub_9D4C+55r
byte_8AA1:	fcb $10			; DATA XREF: sub_9D4C+50r
byte_8AA2:	fcb $D0			; DATA XREF: sub_9D4C+49r
byte_8AA3:	fcb $70			; DATA XREF: sub_9D4C+44r
byte_8AA4:	fcb $60			; DATA XREF: sub_9D4C+61r
byte_8AA5:	fcb $30			; DATA XREF: sub_9D4C+5Cr
byte_8AA6:	fcb $C0			; DATA XREF: sub_9D4C+68r
word_8AA7:	fdb $1B0		; DATA XREF: sub_9D4C+3Dr
byte_8AA9:	fcb $44			; DATA XREF: sub_9D4C+CBr
byte_8AAA:	fcb $51			; DATA XREF: sub_9D4C+D0r
byte_8AAB:	fcb $22			; DATA XREF: sub_9D4C+BFr
byte_8AAC:	fcb $2E			; DATA XREF: sub_9D4C+C4r
byte_8AAD:	fcb $71			; DATA XREF: sub_9D4C+B3r
byte_8AAE:	fcb $B0			; DATA XREF: sub_9D4C+B8r
byte_8AAF:	fcb $80			; DATA XREF: sub_9D4C+73r
byte_8AB0:	fcb $20			; DATA XREF: sub_9D4C+E1r
word_8AB1:	fdb $16C		; DATA XREF: sub_9D4C:loc_9DF5r
byte_8AB3:	fcb 3			; DATA XREF: sub_9D4C+FFr
word_8AB4:	fdb $FFFF		; DATA XREF: sub_9EDC:loc_9F27r
byte_8AB6:	fcb $23			; DATA XREF: sub_DBFB+1Er
byte_8AB7:	fcb $FF			; DATA XREF: calc_fuel_MM+67r
					; CalculateVariousFactors2+29r
byte_8AB8:	fcb $C0			; DATA XREF: calc_fuel_MM+6Cr
byte_8AB9:	fcb $DA			; DATA XREF: CalculateVariousFactors2+2Er
		fcb   5
		fcb   9
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb   0
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
word_8B56:	fdb 2			; DATA XREF: sub_9EDC+42r

;------------------------------------------------------------------------------
;---0x8A8 bytes of padding removed---------------------------------------------
;------------------------------------------------------------------------------
