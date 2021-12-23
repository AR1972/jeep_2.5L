

TL_IDENT1:
byte_8000:  fcb $01
            fcb $00
unk_8002:   fcb $56
            fcb $02
            fcb $88
byte_8005:  fcb $51
byte_8006:  fcb $A2
unk_8007:   fcb $56
            fcb $02
            fcb $88
            fcb $51
byte_800B:  fcb $A2
            fcb $43
unk_800D:   fcb $4E
            fcb $18
byte_800F:  fcb $85
            fcb $89
byte_8011:  fcb $02
word_8012:  fdb $0582
byte_8014:  fcb $00
;------------------------------------------------------------------------------
; bit 8: 0 = 6 cylinder, 1 = 4 cylinder
; bit 7: 1 = 6 cylinder, 0 = 4 cylinder
; bit 6: unknown
; bit 5: unknown
; bit 4: unknown
; bit 3: unknown
; bit 2: unknown
; bit 1: 1 = manual transmission, 0 = auto transmission

TL_CONF01:
byte_8015:  fcb %01000000+TransType
;------------------------------------------------------------------------------
; bit 8: unknown
; bit 7: unknown
; bit 6: 1 = manual transmission, 0 = auto transmission
; bit 5: unknown
; bit 4: unknown
; bit 3: unknown
; bit 2: unknown
; bit 1: unknown

TL_ConfigurationFlags2:
byte_8016:  fcb %00100000+%00000110
;------------------------------------------------------------------------------

TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly:
byte_8017:  fcb $03
byte_8018:  fcb $10
byte_8019:  fcb $02
byte_801A:  fcb $01

TL_ValueOf_MINTHR_WhenBatteryDisconnected:
byte_801B:  fcb $39
byte_801C:  fcb $26
byte_801D:  fcb $4C
byte_801E:  fcb $05
byte_801F:  fcb $84
byte_8020:  fcb $FF
byte_8021:  fcb $00
word_8022:  fdb $0000

TL_TL_8024:
unk_8024:
        fcb $05
        fcb $2F, $00, $00, $21
        fcb $5E, $06, $00, $33
        fcb $6D, $09, $00, $20
        fcb $7D, $0B, $00, $20
        fcb $8D, $0D

byte_8037:  fcb $90
byte_8038:  fcb $05

TL_RPMCellLookupTable:
        fcb $0F, $A0, $14, $50, $17, $70, $20, $D0, $23, $F0, $2E, $E0, $3E, $80, $4E, $20
        fcb $5D, $C0, $6D, $60, $7D, $00, $8C, $A0, $9C, $40

TL_RPM3DInputModifierFromRPM:
unk_8053:
        fcb $06
        fcb $10, $00, $02, $AB
        fcb $16, $10, $04, $EC
        fcb $23, $50, $04, $00
        fcb $27, $60, $02, $0D
        fcb $4E, $B0, $01, $03
        fcb $9C, $FF

TL_TL_806a: fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

word_8072:  fdb $0262
byte_8074:  fcb $5A
            fcb $00
word_8076:  fdb $0002
byte_8078:  fcb $62
            fcb $5A
word_807A:  fdb $37CD
word_807C:  fdb $4E20
byte_807E:  fcb $00
byte_807F:  fcb $14 ;North America
;byte_807F:  fcb $02 ;Europe
byte_8080:  fcb $02
byte_8081:  fcb $0C
byte_8082:  fcb $04

; North America
TL_Spark1A_RPMMAP:
unk_8083:
        fcb $11
        fcb $09
        fcb $00
        fcb $1C, $1C, $1C, $1C, $1C, $14, $14, $14, $14
        fcb $1C, $1C, $1C, $1C, $1C, $1A, $1E, $18, $14
        fcb $1C, $1C, $1C, $1C, $1C, $1B, $1E, $18, $14
        fcb $1C, $1C, $1C, $1C, $1C, $2D, $20, $18, $14
        fcb $1C, $1C, $1C, $1C, $1C, $38, $2C, $1A, $0C
        fcb $1C, $1C, $1C, $1C, $35, $39, $2C, $1C, $0C
        fcb $1C, $1F, $24, $40, $38, $3B, $2D, $1E, $0D
        fcb $1C, $28, $38, $42, $3D, $3C, $30, $24, $16
        fcb $1C, $2E, $40, $47, $3F, $41, $38, $29, $1C
        fcb $1C, $34, $50, $4C, $40, $46, $40, $2E, $23
        fcb $1C, $36, $5E, $55, $47, $46, $40, $31, $25
        fcb $1C, $38, $60, $58, $53, $46, $40, $33, $26
        fcb $1C, $38, $63, $5F, $4E, $48, $41, $36, $26
        fcb $1C, $38, $5F, $52, $52, $45, $3A, $2E, $2B
        fcb $1C, $38, $5B, $4E, $4C, $44, $35, $2E, $28
        fcb $1C, $38, $5D, $5A, $54, $3F, $3C, $31, $25
        fcb $1C, $38, $60, $5C, $50, $3E, $42, $40, $2A

; Europe
;unk_8083:
;       fcb $11
;       fcb $09
;       fcb $00
;       fcb $1C, $1C, $1C, $1C, $1C, $14, $14, $14, $14
;       fcb $1C, $1C, $1C, $1C, $1C, $1A, $1E, $18, $14
;       fcb $1C, $1C, $1C, $1C, $1C, $1B, $1E, $18, $14
;       fcb $1C, $1C, $1C, $1C, $1C, $2A, $20, $18, $14
;       fcb $1C, $1C, $1C, $1C, $1C, $38, $2C, $1A, $0C
;       fcb $1C, $1C, $1C, $1C, $1C, $39, $2C, $1C, $0C
;       fcb $1C, $1E, $21, $27, $28, $3A, $2C, $1D, $0C
;       fcb $1C, $20, $26, $33, $38, $3B, $2D, $1E, $0E
;       fcb $1C, $24, $2C, $3F, $38, $3C, $2D, $20, $14
;       fcb $1C, $28, $32, $42, $38, $3C, $30, $24, $16
;       fcb $1C, $34, $40, $4C, $40, $46, $40, $2E, $23
;       fcb $1C, $38, $50, $50, $4E, $42, $40, $33, $26
;       fcb $1C, $38, $54, $52, $4E, $48, $45, $3F, $26
;       fcb $1C, $38, $54, $52, $52, $45, $40, $36, $34
;       fcb $1C, $38, $56, $4E, $4C, $44, $3B, $36, $28
;       fcb $1C, $38, $56, $5A, $54, $3F, $40, $36, $30
;       fcb $1C, $38, $56, $5C, $50, $3E, $42, $40, $2A

TL_Spark1B_RPMMAP:
unk_811F:
        fcb $11
        fcb $09
        fcb $00
        fcb $1C, $1C, $1C, $1C, $1C, $14, $14, $14, $14
        fcb $1C, $1C, $1C, $1C, $1C, $1A, $1E, $18, $14
        fcb $1C, $1C, $1C, $1C, $1C, $1D, $1E, $18, $14
        fcb $1C, $1C, $1C, $1C, $30, $25, $1F, $18, $18
        fcb $1C, $1C, $1C, $1C, $38, $36, $30, $1D, $14
        fcb $1C, $1C, $1C, $1C, $43, $42, $33, $24, $15
        fcb $1C, $29, $31, $31, $46, $42, $37, $26, $16
        fcb $1C, $2B, $3B, $3C, $49, $43, $3B, $2C, $18
        fcb $1C, $2D, $45, $4C, $4C, $44, $3F, $2F, $1B
        fcb $1C, $30, $50, $5C, $4F, $44, $41, $2E, $1F
        fcb $1C, $38, $50, $5C, $58, $54, $50, $3C, $30
        fcb $1C, $38, $4E, $66, $60, $5E, $56, $3C, $2E
        fcb $1C, $38, $4C, $6E, $66, $60, $4A, $3C, $2D
        fcb $1C, $38, $4A, $6C, $64, $4E, $44, $40, $2A
        fcb $1C, $38, $4A, $5C, $4A, $44, $3E, $34, $22
        fcb $1C, $38, $40, $5C, $48, $42, $3E, $34, $20
        fcb $1C, $38, $40, $56, $4C, $44, $3C, $34, $28

byte_81BB:  fcb $03

TL_Spark2A_RPMMAP:
unk_81BC:
        fcb $11
        fcb $09
        fcb $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
        fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

TL_MapValFromRPMPtr:
unk_8258:   fcb $FF, $FF, $FF, $FF, $FF

TL_TL_825d: fcb $A4, $A4, $A4, $80, $80, $80, $80, $80, $80

TL_TL_8266:
unk_8266:   fcb $2A, $2A, $2A, $2A, $28, $26, $20, $1E, $1A

TL_TL_826F:
unk_826F:   fcb $28, $24, $24, $20, $20, $1A, $1A, $1A, $1A

byte_8278:  fcb $D0
byte_8279:  fcb $02
byte_827A:  fcb $00
byte_827B:  fcb $00

TL_TL_827C:
unk_827C:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

TL_TL_8285:
unk_8285:   fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

word_828E:  fdb $02B3

        fcb $05, $4E, $04, $00, $BD, $65, $15, $02, $66, $79, $45, $00, $C0, $7D
        fcb $48, $01, $CE, $9C, $80, $08, $06, $00, $D0, $00, $01, $00, $00, $00, $00, $00
        fcb $00

word_82AF:  fdb $208D
word_82B1:  fdb $4E20

TL_ColdLoad3DTableOffIdle:
;North America
unk_82B3:
        fcb $11
        fcb $09
        fcb $00
        fcb $46, $3F, $34, $30, $36, $39, $3B, $40, $53
        fcb $46, $3E, $34, $30, $36, $39, $3B, $40, $53
        fcb $52, $50, $37, $33, $37, $3D, $3E, $45, $59
        fcb $69, $58, $4B, $44, $42, $44, $48, $4F, $68
        fcb $7F, $60, $50, $52, $59, $55, $5B, $65, $73
        fcb $88, $62, $62, $64, $69, $59, $5E, $69, $79
        fcb $91, $70, $71, $6B, $6A, $68, $71, $78, $8A
        fcb $9A, $7A, $6A, $69, $70, $70, $74, $7E, $88
        fcb $A3, $83, $6C, $64, $6A, $6A, $74, $84, $90
        fcb $D0, $90, $8A, $80, $80, $82, $84, $88, $88
        fcb $F0, $CA, $A7, $9A, $92, $92, $92, $8E, $8E
        fcb $FF, $EF, $BD, $A6, $A0, $A0, $A0, $9E, $9E
        fcb $FF, $EF, $B8, $B1, $A6, $A0, $9C, $97, $97
        fcb $FF, $FF, $E2, $C1, $A2, $98, $90, $A0, $C0
        fcb $FF, $FF, $F4, $CB, $A0, $AA, $AC, $CE, $F0
        fcb $FF, $FF, $80, $90, $A4, $BC, $C8, $E8, $FF
        fcb $C0, $C0, $A0, $94, $9E, $B0, $C3, $CC, $FF

;Europe
;unk_82B3:
;       fcb $11
;       fcb $09
;       fcb $00
;       fcb $56, $3E, $38, $30, $35, $42, $4C, $51, $5E
;       fcb $56, $3E, $38, $30, $35, $42, $4C, $51, $5E
;       fcb $62, $50, $40, $3A, $41, $4C, $55, $59, $67
;       fcb $79, $62, $50, $4B, $54, $54, $5F, $61, $6F
;       fcb $8F, $80, $59, $58, $60, $60, $69, $69, $78
;       fcb $98, $88, $5E, $5A, $62, $63, $66, $6C, $7B
;       fcb $A1, $90, $63, $63, $68, $66, $68, $6F, $7E
;       fcb $AA, $98, $70, $67, $68, $69, $6A, $72, $81
;       fcb $B3, $9C, $75, $6A, $6D, $6C, $6C, $75, $84
;       fcb $BC, $A0, $72, $69, $70, $6F, $6F, $78, $86
;       fcb $E0, $C0, $90, $88, $80, $89, $87, $86, $86
;       fcb $FF, $FF, $D0, $B1, $A3, $98, $93, $8E, $8E
;       fcb $FF, $FF, $D0, $B1, $A6, $A0, $9C, $97, $97
;       fcb $FF, $FF, $E2, $C1, $A2, $78, $80, $A0, $C0
;       fcb $FF, $FF, $F4, $CB, $A0, $AA, $9E, $BE, $F0
;       fcb $FF, $FF, $80, $90, $A4, $BC, $C8, $D0, $F4
;       fcb $C0, $C0, $A0, $94, $9E, $B0, $C0, $C8, $F8

TL_HotLoad3DTableOffIdle:
unk_834F:
        fcb $11
        fcb $09
        fcb $00
        fcb $38, $32, $2F, $2F, $2F, $3E, $43, $65, $6E
        fcb $4C, $4D, $3C, $39, $38, $47, $4E, $6E, $79
        fcb $61, $69, $49, $43, $40, $50, $59, $76, $85
        fcb $77, $6E, $51, $4C, $4A, $60, $66, $7D, $84
        fcb $8E, $74, $5A, $56, $54, $70, $73, $84, $83
        fcb $A2, $85, $65, $65, $62, $71, $74, $87, $88
        fcb $B6, $96, $70, $73, $70, $71, $74, $89, $8D
        fcb $BE, $99, $78, $76, $74, $72, $78, $8C, $8B
        fcb $B6, $90, $74, $6D, $72, $73, $77, $8E, $92
        fcb $B1, $8D, $67, $65, $6B, $70, $77, $91, $90
        fcb $FF, $CB, $80, $7E, $7E, $7F, $80, $95, $89
        fcb $FF, $F9, $A7, $96, $8C, $8C, $84, $91, $99
        fcb $FF, $FF, $CD, $B2, $A5, $97, $94, $A5, $A4
        fcb $FF, $FF, $C2, $AC, $A2, $9F, $95, $AE, $AB
        fcb $FF, $FF, $C3, $AF, $A4, $A4, $A6, $BD, $B0
        fcb $FF, $FF, $C7, $B3, $A3, $A5, $A2, $BB, $B2
        fcb $FF, $FF, $D4, $B8, $A4, $AC, $AC, $C9, $BF

TL_TL_83EB:
unk_83EB:   fcb $D0, $A4, $5E, $18, $0E, $0C, $06, $06, $06

TL_TL_83F4:
unk_83F4:   fcb $40, $38, $30, $22, $12, $0C, $08, $08, $04

TL_TL_83FD:
unk_83FD:   fcb $C8, $90, $50, $2A, $28, $18, $0E, $10, $10

TL_TL_8406:
unk_8406:   fcb $2C, $28, $24, $18, $0C, $08, $00, $00, $00

TL_TL_840f:
unk_840F:   fcb $00, $00, $00, $00, $00, $50, $B0, $C0, $C0

TL_TL_8418:
unk_8418:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

TL_TL_8421:
unk_8421:   fcb $40, $37, $2B, $20, $1C, $14, $10, $10, $10

byte_842A:  fcb $44

unk_842B:
        fcb $05
        fcb $58, $F4, $FD, $8D
        fcb $80, $92, $FC, $26
        fcb $94, $45, $FF, $00
        fcb $C6, $13, $FF, $D8
        fcb $FF, $0A

tl_tl_843e:
unk_843E:
        fcb $08
        fcb $61, $FF, $FC, $C0
        fcb $71, $CB, $FB, $20
        fcb $81, $7D, $FD, $D3
        fcb $92, $58, $FE, $40
        fcb $A2, $3C, $FF, $38
        fcb $C2, $23, $FF, $6D
        fcb $E3, $10, $FF, $6E
        fcb $FF, $00

unk_845D:   fcb $F4, $C8, $90, $40, $20, $14, $10, $0F, $0B

unk_8466:   fcb $CC, $CC, $CC, $CC, $CC, $CC, $E6, $FF, $FF

unk_846F:
        fcb $04
        fcb $0C, $00, $02, $80
        fcb $18, $1E, $01, $D5
        fcb $24, $34, $0C, $AB
        fcb $2A, $80

 DCB.B $04, $FF ; 4 bytes of 0xFF

unk_8482:
        fcb $02
        fcb $00, $00, $00, $00
        fcb $FF, $00

 DCB.B $0C, $FF ; 12 bytes of 0xFF

TL_TL_8481:
word_8495:  fdb $7D00

TL_TL_8483:
byte_8497:  fcb $E8

TL_TL_8484:
byte_8498:  fcb $D0

TL_TL_8485:
byte_8499:  fcb $00 ;North America
;byte_8499:  fcb $06 ;Europe

unk_849A:   fcb $08, $08, $08, $0A, $0C, $0E, $14, $1C, $1C

unk_84A3:   fcb $1C, $1C, $1C, $09, $09, $09, $09, $09, $09

unk_84AC:   fcb $10, $10, $10, $20, $20, $20, $20, $20, $20

unk_84B5:   fcb $CF, $8E, $63, $2A, $2A, $28, $1C, $16, $16

unk_84BE:   fcb $60, $50, $40, $32, $2C, $28, $20, $20, $20

unk_84C7:   fcb $50, $40, $38, $30, $28, $20, $10, $10, $10

TL_MapVoltsAverageFactors1:
unk_84D0:   fcb $80, $80

byte_84D2:  fcb $7B
byte_84D3:  fcb $50
byte_84D4:  fcb $D6

TL_RPMAverageFactors1:
unk_84D5:   fcb $20, $20
word_84D7:  fdb $000A
word_84D9:  fdb $FFEB
word_84DB:  fdb $0219
byte_84DD:  fcb $76
byte_84DE:  fcb $7E
unk_84DF:   fcb $40
            fcb $40
byte_84E1:  fcb $F0

unk_84E2:   fcb $44, $33, $2C, $19, $1A, $20, $20, $17, $17

byte_84EB:  fcb $06
word_84EC:  fdb $024E

TL_RPM3DInputModifierFromRPM2:
unk_84EE:
        fcb $05
        fcb $16, $00, $04, $92
        fcb $24, $40, $05, $D1
        fcb $2F, $80, $04, $00
        fcb $3F, $C0, $04, $33
        fcb $4E, $FF

 DCB.B $0C, $FF ; 12 bytes of 0xFF

TL_O2LoLimitForInMiddleDetermination:
unk_850D:
        fcb $05
        fcb $09
        fcb $00
        fcb $16, $16, $16, $16, $16, $16, $16, $16, $16
        fcb $16, $16, $16, $16, $16, $16, $16, $16, $16
        fcb $16, $16, $17, $17, $17, $16, $16, $16, $16
        fcb $16, $16, $16, $16, $16, $16, $16, $16, $16
        fcb $16, $16, $16, $16, $16, $16, $16, $16, $16

 DCB.B $6C, $FF ; 108 bytes of 0xFF

TL_O2HiLimitForInMiddleDetermination:
unk_85A9:
        fcb $05
        fcb $09
        fcb $00
        fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1E, $1E
        fcb $1C, $1C, $1E, $1F, $1F, $1F, $1F, $1F, $1F
        fcb $1E, $1E, $1F, $1F, $1F, $1F, $20, $21, $21
        fcb $1E, $1E, $20, $20, $20, $20, $21, $22, $22
        fcb $22, $22, $22, $22, $22, $22, $22, $22, $22

 DCB.B $6C, $FF ; 108 bytes of 0xFF

byte_8645:  fcb $0A
byte_8646:  fcb $0C
byte_8647:  fcb $20
byte_8648:  fcb $20
byte_8649:  fcb $04
byte_864A:  fcb $02
byte_864B:  fcb $60
byte_864C:  fcb $0C
byte_864D:  fcb $FE
byte_864E:  fcb $57
unk_864F:   fcb $0A
byte_8650:  fcb $08
byte_8651:  fcb $05
byte_8652:  fcb $60
unk_8653:   fcb $20
byte_8654:  fcb $FF ;North America
;byte_8654:  fcb $06 ;Europe
byte_8655:  fcb $0E
            fcb $04
byte_8657:  fcb $1F
byte_8658:  fcb $05
byte_8659:  fcb $80
unk_865A:   fcb $18
            fcb $C0
byte_865C:  fcb $D6
byte_865D:  fcb $08
byte_865E:  fcb $18
byte_865F:  fcb $55
byte_8660:  fcb $FF
byte_8661:  fcb $01
byte_8662:  fcb $38

unk_8663:   fcb $10
            fcb $07
            fcb $A0
            fcb $00
            fcb $C0

unk_8668:   fcb $08
            fcb $03
            fcb $90
            fcb $00
            fcb $E0

byte_866D:  fcb $A8
byte_866E:  fcb $6C
byte_866F:  fcb $10
byte_8670:  fcb $04
byte_8671:  fcb $00
byte_8672:  fcb $0A
byte_8673:  fcb $6D
byte_8674:  fcb $36
byte_8675:  fcb $22
byte_8676:  fcb $5A
byte_8677:  fcb $F2
byte_8678:  fcb $36
word_8679:  fdb $0001
byte_867B:  fcb $6A
byte_867C:  fcb $80
word_867D:  fdb $0384
byte_867F:  fcb $02
byte_8680:  fcb $BF
byte_8681:  fcb $DB
byte_8682:  fcb $03
byte_8683:  fcb $01
byte_8684:  fcb $03
byte_8685:  fcb $14
byte_8686:  fcb $94
word_8687:  fdb $0000
word_8689:  fdb $0000
byte_868B:  fcb $00
byte_868C:  fcb $02
word_868D:  fdb $0320
word_868F:  fdb $5DC0
word_8691:  fdb $0640
byte_8693:  fcb $E0
byte_8694:  fcb $06
word_8695:  fdb $A600
word_8697:  fdb $0190
byte_8699:  fcb $58
byte_869A:  fcb $01
word_869B:  fdb $038D
byte_869D:  fcb $0A
byte_869E:  fcb $1C
byte_869F:  fcb $1C

TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm:
unk_86A0:
        fcb $02
        fcb $05, $00, $02, $00
        fcb $0C, $0E

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm:
unk_86AB:
        fcb $02
        fcb $05, $00, $FF, $9A
        fcb $0F, $FC

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_MinVoltageForAis:
byte_86B6:  fcb $71

TL_BrakeOverrideForAis_FromDeltaThrottle:
unk_86B7:
        fcb $03
        fcb $FF, $FF, $00, $00
        fcb $FF, $FF, $00, $00
        fcb $FF, $FF

TL_AisStartupPosition_FromTemp:
unk_86C2:
        fcb $05
        fcb $6A, $C8, $FC, $E9
        fcb $80, $84, $FD, $80
        fcb $94, $52, $FF, $80
        fcb $C0, $3C, $00, $00
        fcb $F8, $3C

unk_86D5:
        fcb $03
        fcb $9A, $10, $FF, $D3
        fcb $C8, $08, $FF, $CD
        fcb $F0, $00

byte_86E0:  fcb $10
byte_86E1:  fcb $94
byte_86E2:  fcb $28
byte_86E3:  fcb $FF
byte_86E4:  fcb $E0

TL_ACOffIdleDelta_FromSpeed:
unk_86E5:
        fcb $04
        fcb $28, $10, $00, $00
        fcb $3C, $10, $00, $00
        fcb $50, $10, $00, $66
        fcb $78, $20

TL_AISAddedFromTimeEngRunning:
byte_86F4:  fcb $00

TL_AisColdPosition_FromTemp:
unk_86F5:
        fcb $04
        fcb $68, $58, $FE, $80
        fcb $80, $34, $FF, $80
        fcb $A8, $20, $FF, $33
        fcb $D0, $00

unk_8704:
        fcb $03
        fcb $00, $00, $00, $00
        fcb $10, $00, $00, $00
        fcb $1A, $00


TL_AisPosition_FromThrottle:
unk_870F:
        fcb $04
        fcb $00, $00, $00, $00
        fcb $02, $00, $00, $00
        fcb $05, $00, $00, $00
        fcb $1E, $00

TL_AisPosition_FromRpm:
unk_871E:
        fcb $04
        fcb $20, $00, $00, $92
        fcb $2E, $08, $00, $00
        fcb $3F, $08, $00, $00
        fcb $5E, $08

unk_872D:
        fcb $03
        fcb $9A, $4C, $FF, $DF
        fcb $C8, $46, $FF, $DA
        fcb $F0, $40

TL_IdleSpeedParkNeutral_FromTemp:
unk_8738:
        fcb $05
        fcb $68, $80, $FF, $A3
        fcb $94, $70, $FF, $8D
        fcb $A8, $67, $FF, $AD
        fcb $D0, $5A, $00, $00
        fcb $F8, $5A

TL_IdleSpeedDrive_FromTemp:
unk_874B:
        fcb $05
        fcb $68, $80, $FF, $A3
        fcb $94, $70, $FF, $8D
        fcb $A8, $67, $FF, $AD
        fcb $D0, $5A, $00, $00
        fcb $F8, $5A

TL_DecelAisBaseAirflowCurveOffset_FromTime2:
unk_875E:
        fcb $02
        fcb $00, $00, $00, $00
        fcb $00, $00

 DCB.B $04, $FF ; 4 bytes of 0xFF

byte_8769:  fcb $5A
byte_876A:  fcb $64

TL_ForwardAisSteps_NoSlope:
unk_876B:
        fcb $05
        fcb $28, $01, $00, $00
        fcb $4B, $02, $00, $00
        fcb $5A, $02, $00, $00
        fcb $78, $02, $00, $00
        fcb $96, $03

TL_ReverseAisSteps_NoSlope:
unk_877E:
        fcb $05
        fcb $32, $FF, $00, $00
        fcb $64, $FE, $00, $00
        fcb $A6, $FD, $00, $00
        fcb $C8, $FC, $00, $00
        fcb $FF, $F7

byte_8791:  fcb $0C
byte_8792:  fcb $04
byte_8793:  fcb $F4

unk_8794:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

byte_879D:  fcb $2F

unk_879E:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

TL_AisPeriodForRpmFeedback11ms:
byte_87A7:  fcb $38

TL_AisHighLimitMaxOpenSteps:
byte_87A8:  fcb $D8

TL_AisDelayAfterThrottleClosesWhenMoving:
unk_87A9:   fcb $8B, $8B

TL_UpdateRateOffIdleWhenAisClosing:
byte_87AB:  fcb $FF

TL_PositionAisMotorIsAtIdle:
byte_87AC:  fcb $10

TL_AISAddedFromTimeEngRunning2:
byte_87AD:  fcb $00

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK:
unk_87AE:
        fcb $03
        fcb $80, $F0, $FF, $66
        fcb $94, $E4, $00, $32
        fcb $D2, $F0

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK2
unk_87B9:
        fcb $03
        fcb $80, $10, $00, $66
        fcb $94, $18, $FF, $DF
        fcb $D2, $10

TL_AISDecel_FromBaro:
unk_87C4:
        fcb $03
        fcb $9A, $DC, $00, $6F
        fcb $C8, $F0, $00, $66
        fcb $F0, $00

 DCB.B $08, $FF ; 8 bytes of 0xFF

unk_87D7:
        fcb $02
        fcb $0B, $00, $00, $00
        fcb $1B, $00

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_AISDecel_FromTemp:
unk_87E2:
        fcb $05
        fcb $68, $36, $FF, $AB
        fcb $80, $2E, $FF, $8B
        fcb $B0, $18, $FF, $8E
        fcb $D4, $08, $FE, $00
        fcb $D8, $00

TL_AdditionToControlMap:
unk_87F5:
        fcb $04
        fcb $19, $00, $00, $00
        fcb $1F, $00, $00, $00
        fcb $26, $00, $00, $00
        fcb $70, $00

TL_OffsetCorrectionTo_MAPFLR_FromBaro:
unk_8804:
        fcb $03
        fcb $9A, $00, $00, $00
        fcb $C8, $00, $00, $00
        fcb $F0, $00

TL_TempTermForMapOffset_FromTemp:
unk_880F:
        fcb $02
        fcb $90, $FF, $00, $00
        fcb $C7, $FF

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_DecelAisOpenStepsFromNeg_FromDeltaMap:
unk_881A:
        fcb $04
        fcb $0F, $00, $01, $00
        fcb $11, $02, $00, $80
        fcb $13, $03, $00, $AB
        fcb $16, $05

TL_DecelAisOpenStepsFromPos_FromDeltaMap:
unk_8829:
        fcb $04
        fcb $05, $00, $FF, $CD
        fcb $0A, $FF, $FF, $CD
        fcb $0F, $FE, $00, $00
        fcb $14, $FE

TL_TimeBetweenAisPulsesForDecelAis:
byte_8838:  fcb $20

TL_EngineTempToStartCalibratingDacal:
byte_8839:  fcb $D6

TL_DeltaRpmFromIdleSpeedForDacalUpdate:
byte_883A:  fcb $02

TL_ACFactorDeltaFromBase:
byte_883B:  fcb $10

byte_883C:  fcb $3D

TL_Base_nominalCal:
byte_883D:  fcb $00

TL_DacalInhibitTimeAfterStartup:
byte_883E:  fcb $10

TL_DacalUpdateRate01_03_07_0f_1f_3f_7f_ff:
byte_883F:  fcb $7F

byte_8840:  fcb $80
byte_8841:  fcb $05
word_8842:  fdb $11F8
byte_8844:  fcb $2D
byte_8845:  fcb $90
byte_8846:  fcb $88
byte_8847:  fcb $FD
word_8848:  fdb $FFA0
word_884A:  fdb $FF00
byte_884C:  fcb $02
byte_884D:  fcb $00
byte_884E:  fcb $07
byte_884F:  fcb $04
byte_8850:  fcb $FF
byte_8851:  fcb $FF
byte_8852:  fcb $1B
byte_8853:  fcb $0A
byte_8854:  fcb $04
byte_8855:  fcb $70
byte_8856:  fcb $03
byte_8857:  fcb $9B
byte_8858:  fcb $A0
byte_8859:  fcb $FF
byte_885A:  fcb $FE

TL_FanTurnOnTempAbove45Mph:
unk_885B:   fcb $E7

TL_FanTurnOnTempAbove45Mph2:
            fcb $E2

TL_FanTurnOnTempAbove45Mph3:
            fcb $E7

TL_FanTurnOnTempAbove45Mph4:
            fcb $E2

word_885F:  fdb $0B9B
word_8861:  fdb $00C0
byte_8863:  fcb $15
byte_8864:  fcb $C0
byte_8865:  fcb $92
byte_8866:  fcb $00
byte_8867:  fcb $20
byte_8868:  fcb $32
byte_8869:  fcb $00
byte_886A:  fcb $06
byte_886B:  fcb $40

unk_886C:
        fcb $06
        fcb $1C, $24, $00, $E7
        fcb $3B, $40, $05, $C0
        fcb $3F, $57, $06, $AB
        fcb $42, $6B, $00, $00
        fcb $54, $6B, $00, $00
        fcb $54, $A8

unk_8883:
        fcb $04
        fcb $1F, $0F, $00, $F7
        fcb $74, $61, $00, $00
        fcb $8A, $61, $00, $00
        fcb $8A, $A8

 DCB.B $08, $FF ; 8 bytes of 0xFF

unk_889A:
        fcb $04
        fcb $1F, $0F, $00, $F7
        fcb $74, $61, $00, $00
        fcb $8A, $61, $00, $00
        fcb $8A, $A8

 DCB.B $08, $FF ; 8 bytes of 0xFF

TL_PTUMinLockTemperature:
byte_88B1:  fcb $B8

TL_PTUCounterTimerIntervalForLoop:
byte_88B2:  fcb $07

TL_PTUMinLockSpeed:
byte_88B3:  fcb $7C

TL_PTUMAPThresholdForLock3:
byte_88B4:  fcb $14

TL_PTUDeltaTPSForUnlock:
byte_88B5:  fcb $66

TL_PTUMAPThresholdForLock1:
unk_88B6:   fcb $81, $18

TL_PTUCounterHiSpeed:
byte_88B8:  fcb $20

TL_PTUCounterLoSpeed:
byte_88B9:  fcb $11

byte_88BA:  fcb $00

TL_UpperLimitForPTULock:
unk_88BB:
        fcb $04
        fcb $64, $0F, $00, $00
        fcb $64, $2E, $00, $AB
        fcb $82, $42, $00, $00
        fcb $82, $A8

TL_LowerLimitForPTULock:
        fcb $02
        fcb $64, $0F, $00, $00
        fcb $96, $0F

 DCB.B $08, $FF ; 8 bytes of 0xFF

TL_UpperLimitForPTUUnlock:
unk_88D9:
        fcb $04
        fcb $5E, $05, $00, $00
        fcb $5E, $33, $00, $AB
        fcb $7C, $47, $00, $00
        fcb $7C, $A8

TL_LowerLimitForPTUUnlock:
        fcb $02
        fcb $5E, $05, $00, $00
        fcb $96, $05

 DCB.B $08, $FF ; 8 bytes of 0xFF

byte_88F7:  fcb $50
byte_88F8:  fcb $20
byte_88F9:  fcb $1A
byte_88FA:  fcb $10
byte_88FB:  fcb $0A
byte_88FC:  fcb $05
byte_88FD:  fcb $10
byte_88FE:  fcb $0F
byte_88FF:  fcb $49
byte_8900:  fcb $07

unk_8901:   fcb $FF, $FF, $41, $41, $41, $35, $38, $3B, $3B

byte_890A:  fcb $08
byte_890B:  fcb $14
byte_890C:  fcb $71
byte_890D:  fcb $FE
byte_890E:  fcb $F0
byte_890F:  fcb $02
byte_8910:  fcb $52
byte_8911:  fcb $3A
byte_8912:  fcb $04
byte_8913:  fcb $A0
byte_8914:  fcb $AA
byte_8915:  fcb $46
byte_8916:  fcb $40
byte_8917:  fcb $00
byte_8918:  fcb $3C
byte_8919:  fcb $9A
byte_891A:  fcb $05
            fcb $00
            fcb $2D
byte_891D:  fcb $00
byte_891E:  fcb $00
byte_891F:  fcb $02
byte_8920:  fcb $01
byte_8921:  fcb $01
byte_8922:  fcb $03
byte_8923:  fcb $03
byte_8924:  fcb $40
byte_8925:  fcb $20
byte_8926:  fcb $04
byte_8927:  fcb $18
byte_8928:  fcb $06
byte_8929:  fcb $74
byte_892A:  fcb $00
byte_892B:  fcb $04
byte_892C:  fcb $10
byte_892D:  fcb $F0
byte_892E:  fcb $04
byte_892F:  fcb $04
byte_8930:  fcb $28
byte_8931:  fcb $D8
byte_8932:  fcb $0B
byte_8933:  fcb $08

unk_8934:
        fcb $04
        fcb $00, $00, $FF, $F4
        fcb $40, $FD, $FF, $D4
        fcb $80, $F2, $FF, $F0
        fcb $C0, $EE

unk_8943:
        fcb $05
        fcb $00, $00, $00, $30
        fcb $10, $03, $00, $1B
        fcb $40, $08, $00, $18
        fcb $80, $0E, $00, $0C
        fcb $FF, $14

 DCB.B $04, $FF ; 4 bytes of 0xFF

unk_895A:
        fcb $04
        fcb $00, $00, $01, $00
        fcb $10, $10, $00, $F0
        fcb $20, $1F, $00, $88
        fcb $40, $30

unk_8969:
        fcb $04
        fcb $46, $22, $00, $22
        fcb $64, $26, $00, $33
        fcb $82, $2C, $00, $33
        fcb $A0, $32

unk_8978:
        fcb $06
        fcb $30, $9B, $FF, $50
        fcb $40, $90, $FF, $70
        fcb $50, $87, $FF, $90
        fcb $60, $80, $00, $00
        fcb $90, $80, $FF, $30
        fcb $B0, $66

unk_898F:
        fcb $04
        fcb $80, $80, $00, $33
        fcb $8A, $82, $00, $1A
        fcb $A8, $85, $00, $1A
        fcb $C6, $88

 DCB.B $10, $FF ; 16 bytes of 0xFF

unk_89AE:
        fcb $04
        fcb $3C, $16, $FF, $73
        fcb $50, $0B, $FF, $A6
        fcb $64, $04, $FF, $E6
        fcb $82, $01

unk_89BD:
        fcb $03
        fcb $00, $10, $00, $5D
        fcb $16, $18, $FF, $A3
        fcb $2C, $10

 DCB.B $04, $FF ; 4 bytes of 0xFF

unk_89CC:
        fcb $02
        fcb $02, $14, $07, $00
        fcb $04, $22

 DCB.B $04, $FF ; 4 bytes of 0xFF

unk_89D7:
        fcb $02
        fcb $20, $E0, $FF, $00
        fcb $30, $D0

 DCB.B $08, $FF ; 8 bytes of 0xFF

unk_89E6:
        fcb $02
        fcb $90, $00, $00, $60
        fcb $98, $03

 DCB.B $04, $FF ; 4 bytes of 0xFF

unk_89F1:
        fcb $03
        fcb $90, $FF, $FA, $B5
        fcb $A8, $80, $FC, $CD
        fcb $D0, $00

unk_89FC:
        fcb $03
        fcb $60, $00, $00, $00
        fcb $78, $00, $00, $00
        fcb $80, $00

unk_8A07:
        fcb $03
        fcb $80, $00, $00, $00
        fcb $94, $00, $00, $00
        fcb $A8, $00

byte_8A12:  fcb $04
unk_8A13:   fcb $1C, $0C
word_8A15:  fdb $000C
word_8A17:  fdb $2000
byte_8A19:  fcb $04
byte_8A1A:  fcb $03
byte_8A1B:  fcb $80
byte_8A1C:  fcb $1E
byte_8A1D:  fcb $38

unk_8A1E:   fcb $00, $00, $00, $08, $08, $00, $00, $00, $00

byte_8A27:  fcb $10
byte_8A28:  fcb $40

unk_8A29:   fcb $00, $00, $00, $0C, $08, $00, $00, $00, $00

TL_ErrorBitsMask1:
unk_8A32:
            fcb $26
            fcb $00, $00, $00, $00, $00

byte_8A38:  fcb $84
byte_8A39:  fcb $11
byte_8A3A:  fcb $EB
byte_8A3B:  fcb $93
byte_8A3C:  fcb $7E
byte_8A3D:  fcb $63
byte_8A3E:  fcb $E4
byte_8A3F:  fcb $CF
byte_8A40:  fcb $32
byte_8A41:  fcb $AA
byte_8A42:  fcb $04
byte_8A43:  fcb $BD
byte_8A44:  fcb $79
byte_8A45:  fcb $1A
byte_8A46:  fcb $FD
byte_8A47:  fcb $A8
byte_8A48:  fcb $1A
byte_8A49:  fcb $FD
byte_8A4A:  fcb $A8
byte_8A4B:  fcb $10
word_8A4C:  fdb $2EE0
byte_8A4E:  fcb $8E
byte_8A4F:  fcb $7F
byte_8A50:  fcb $04
byte_8A51:  fcb $06
byte_8A52:  fcb $2E
byte_8A53:  fcb $22
byte_8A54:  fcb $14
byte_8A55:  fcb $0A
byte_8A56:  fcb $38
byte_8A57:  fcb $70
byte_8A58:  fcb $B0
byte_8A59:  fcb $08
byte_8A5A:  fcb $F0
byte_8A5B:  fcb $D1
byte_8A5C:  fcb $20
byte_8A5D:  fcb $28
byte_8A5E:  fcb $2F
byte_8A5F:  fcb $28
byte_8A60:  fcb $DC
byte_8A61:  fcb $8C
byte_8A62:  fcb $64
byte_8A63:  fcb $CE
byte_8A64:  fcb $AB
byte_8A65:  fcb $02
byte_8A66:  fcb $FD
byte_8A67:  fcb $66
byte_8A68:  fcb $01
byte_8A69:  fcb $02
byte_8A6A:  fcb $05

unk_8A6B:   fcb $F0, $80, $50, $40, $30, $30, $20, $20, $20, $10, $10, $10, $10, $00, $00, $00

word_8A7B:  fdb $12C0
word_8A7D:  fdb $2EE0
byte_8A7F:  fcb $12
byte_8A80:  fcb $F7
word_8A81:  fdb $0200
byte_8A83:  fcb $CE
unk_8A84:   fcb $21
unk_8A85:   fcb $10

unk_8A86:
        fcb $05
        fcb $00, $00, $07, $11
        fcb $0F, $6A, $07, $6E
        fcb $16, $9E, $00, $A0
        fcb $36, $B2, $01, $E0
        fcb $46, $D0

byte_8A99:  fcb $14
byte_8A9A:  fcb $0F
byte_8A9B:  fcb $20
byte_8A9C:  fcb $08
byte_8A9D:  fcb $E1

byte_8A9E:  fcb $80
byte_8A9F:  fcb $1F
byte_8AA0:  fcb $29
byte_8AA1:  fcb $07
byte_8AA2:  fcb $C7
byte_8AA3:  fcb $5A
byte_8AA4:  fcb $5E
byte_8AA5:  fcb $1F
byte_8AA6:  fcb $80
word_8AA7:  fdb $01C7
byte_8AA9:  fcb $2B
byte_8AAA:  fcb $58
byte_8AAB:  fcb $08
byte_8AAC:  fcb $21
byte_8AAD:  fcb $6E
byte_8AAE:  fcb $AD
byte_8AAF:  fcb $80
byte_8AB0:  fcb $07
word_8AB1:  fdb $016C
byte_8AB3:  fcb $08
word_8AB4:  fdb $FFFF
byte_8AB6:  fcb $23
byte_8AB7:  fcb $FF
byte_8AB8:  fcb $C0
byte_8AB9:  fcb $DA

unk_8ABA:
            fcb $05
            fcb $09
            fcb $00
            fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
            fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
            fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
            fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
            fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

 DCB.B $6C, $FF

word_8B56:
        fcb $00, $02

