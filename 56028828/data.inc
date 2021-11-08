

TL_IDENT1:  fcb $01
            fcb $00
unk_8002:   fcb $56
            fcb $02
            fcb $88
byte_8005:  fcb $28
byte_8006:  fcb $A1
unk_8007:   fcb $56
            fcb $02
            fcb $88
            fcb $28
byte_800B:  fcb $A1
            fcb $8D
unk_800D:   fcb $4E
            fcb $18
byte_800F:  fcb $15
            fcb $88
byte_8011:  fcb $01
word_8012:  fdb $0102
byte_8014:  fcb $FF
;------------------------------------------------------------------------------
; bit 8: 0 = 6 cylinder, 1 = 4 cylinder
; bit 7: 1 = 6 cylinder, 0 = 4 cylinder
; bit 6: unknown
; bit 5: unknown
; bit 4: unknown
; bit 3: unknown
; bit 2: unknown
; bit 1: 1 = manual transmission, 0 = auto transmission ???
TL_CONF01:
byte_8015:  fcb %10000000+TransType
;------------------------------------------------------------------------------
TL_ConfigurationFlags2:
byte_8016:  fcb $22

TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly:
byte_8017:  fcb $03

byte_8018:  fcb $10
byte_8019:  fcb $02
byte_801A:  fcb $01

TL_ValueOf_MINTHR_WhenBatteryDisconnected:
byte_801B:  fcb $5C
byte_801C:  fcb $26
byte_801D:  fcb $4C
byte_801E:  fcb $04
byte_801F:  fcb $90
byte_8020:  fcb $D0
byte_8021:  fcb $00
word_8022:  fdb $0000

TL_TL_8024:
unk_8024:
            fcb $05
            fcb $1F, $00, $00, $42
            fcb $3E, $08, $00, $08
            fcb $5E, $09, $FF, $B6
            fcb $7D, $00, $00, $53
            fcb $9C, $0A

byte_8037:  fcb $90
byte_8038:  fcb $20

TL_RPMCellLookupTable:
            fcb $0F, $A0, $14, $50, $17, $70, $20, $D0, $23, $F0, $2E, $E0, $3E, $80, $4E, $20
            fcb $5D, $C0, $6D, $60, $7D, $00, $8C, $A0, $9C, $40

 ORG $8053
TL_RPM3DInputModifierFromRPM:
unk_8053:
            fcb $03
            fcb $13, $00, $05, $25
            fcb $2F, $90, $01, $05
            fcb $9C, $FF

 DCB.B $0C, $FF ; 12 bytes of 0xFF

 ORG $806A
TL_TL_806a:
            fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

word_8072:  fdb $0393
byte_8074:  fcb $87
            fcb $00
word_8076:  fdb $0003
byte_8078:  fcb $93
            fcb $87
word_807A:  fdb $53B5
word_807C:  fdb $7530
byte_807E:  fcb $00
byte_807F:  fcb $14
byte_8080:  fcb $02
byte_8081:  fcb $04
byte_8082:  fcb $05

 ORG $8083
TL_Spark1A_RPMMAP:
unk_8083:
            fcb $11
            fcb $09
            fcb $00
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $0E, $08, $08
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $0E, $0A, $0A
            fcb $1C, $1C, $1C, $1C, $20, $20, $14, $0C, $0A
            fcb $1C, $1C, $1E, $20, $25, $25, $16, $0D, $0B
            fcb $1C, $1C, $1F, $31, $2D, $27, $17, $0E, $10
            fcb $1C, $1C, $20, $3C, $2B, $29, $1A, $10, $12
            fcb $1C, $1C, $26, $3D, $32, $2C, $1E, $10, $10
            fcb $1C, $2C, $36, $36, $34, $2F, $20, $16, $13
            fcb $1C, $2C, $36, $3B, $38, $30, $21, $1B, $14
            fcb $1C, $2C, $36, $43, $39, $33, $22, $1B, $15
            fcb $1C, $2C, $36, $47, $45, $42, $2D, $24, $24
            fcb $1C, $2C, $3A, $55, $51, $49, $37, $23, $23
            fcb $1C, $2C, $3A, $56, $52, $4A, $3D, $23, $23
            fcb $1C, $2C, $3C, $58, $52, $4A, $3F, $31, $24
            fcb $1C, $2C, $40, $53, $55, $49, $46, $42, $3B
            fcb $1C, $2C, $3C, $4B, $47, $49, $48, $42, $3C
            fcb $1C, $2C, $3C, $58, $52, $4D, $48, $3F, $3A

 ORG $811F
TL_Spark1B_RPMMAP:
unk_811F:
            fcb $11
            fcb $09
            fcb $00
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $0E, $08, $08
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $0E, $0A, $0A
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $12, $0A, $0A
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $16, $0C, $0A
            fcb $1C, $1C, $1C, $1C, $1C, $24, $18, $0C, $0A
            fcb $1C, $1C, $1C, $1C, $1C, $2C, $1C, $12, $10
            fcb $1C, $1C, $1C, $1C, $2A, $28, $18, $12, $10
            fcb $1C, $4C, $4A, $40, $36, $2C, $1C, $12, $10
            fcb $1C, $4C, $48, $4D, $36, $34, $24, $12, $10
            fcb $1C, $4C, $48, $4A, $48, $44, $2B, $12, $12
            fcb $1C, $4C, $48, $4E, $4D, $48, $33, $1F, $17
            fcb $1C, $4C, $48, $50, $4B, $44, $42, $32, $21
            fcb $1C, $4C, $54, $54, $56, $54, $42, $2A, $21
            fcb $1C, $4C, $5B, $58, $58, $54, $47, $28, $21
            fcb $1C, $4C, $4D, $50, $4D, $47, $32, $26, $23
            fcb $1C, $4C, $4D, $50, $4B, $3E, $2E, $28, $25
            fcb $1C, $4C, $4D, $50, $4B, $3E, $2E, $28, $25

 ORG $81BB
byte_81BB:  fcb $03

 ORG $81BC
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

TL_TL_825d: fcb $FF, $FF, $98, $98, $98, $98, $98, $98, $98

TL_TL_8266:
unk_8266:   fcb $28, $26, $24, $20, $20, $20, $20, $20, $1A

TL_TL_826F:
unk_826F:   fcb $26, $24, $22, $20, $20, $1A, $14, $14, $14

byte_8278:  fcb $D0
byte_8279:  fcb $06
byte_827A:  fcb $14
byte_827B:  fcb $1C

TL_TL_827C:
unk_827C:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

TL_TL_8285:
unk_8285:   fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

word_828E:  fdb $01B3

            fcb $02, $00, $FF, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
            fcb $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
            fcb $00

word_82AF:  fdb $30D4
word_82B1:  fdb $7530

TL_ColdLoad3DTableOffIdle:
unk_82B3:
            fcb $11
            fcb $09
            fcb $00
            fcb $3E, $3E, $3E, $3E, $3E, $3E, $42, $52, $6C
            fcb $50, $50, $4A, $4A, $4A, $50, $50, $60, $80
            fcb $50, $50, $4A, $50, $57, $58, $5C, $69, $8D
            fcb $4A, $60, $5B, $64, $6A, $68, $68, $6B, $86
            fcb $7A, $7A, $8E, $7D, $73, $70, $70, $6D, $80
            fcb $8A, $8A, $95, $7E, $7B, $74, $72, $76, $7A
            fcb $90, $9A, $9D, $8C, $7F, $7A, $77, $77, $7A
            fcb $A0, $9A, $9D, $88, $7D, $7A, $79, $7A, $79
            fcb $A0, $A0, $9D, $91, $80, $7B, $7A, $7C, $78
            fcb $A0, $B0, $9D, $86, $7A, $7D, $7A, $7C, $7E
            fcb $A0, $B0, $9D, $88, $7C, $7F, $7B, $7C, $A0
            fcb $A0, $CC, $98, $84, $7D, $7F, $8A, $8A, $E4
            fcb $A0, $E7, $99, $88, $7E, $7E, $8A, $E3, $E3
            fcb $A0, $D5, $A2, $91, $86, $87, $8E, $F9, $AC
            fcb $A0, $DC, $B2, $A2, $97, $99, $95, $95, $8F
            fcb $A0, $90, $D5, $C3, $B4, $A9, $A5, $C9, $9B
            fcb $A0, $90, $E1, $D1, $C6, $BE, $B7, $DA, $AA

TL_HotLoad3DTableOffIdle:
unk_834F:
            fcb $11
            fcb $09
            fcb $00
            fcb $38, $38, $38, $38, $38, $38, $38, $38, $38
            fcb $38, $38, $38, $38, $38, $38, $3F, $3F, $3F
            fcb $40, $40, $40, $40, $40, $40, $43, $43, $43
            fcb $46, $46, $46, $46, $46, $46, $46, $46, $46
            fcb $44, $44, $44, $57, $43, $42, $47, $47, $47
            fcb $48, $48, $4B, $58, $45, $42, $4A, $4A, $4A
            fcb $5F, $5F, $5F, $58, $32, $36, $3E, $5C, $4E
            fcb $62, $64, $6D, $31, $32, $36, $43, $5C, $5C
            fcb $65, $68, $46, $3C, $3C, $3E, $45, $62, $62
            fcb $6B, $6B, $50, $3A, $35, $39, $45, $5E, $60
            fcb $6B, $6B, $49, $45, $42, $4A, $53, $6B, $6B
            fcb $50, $50, $4D, $43, $49, $50, $55, $6C, $6C
            fcb $48, $48, $46, $48, $4C, $54, $5A, $6E, $6E
            fcb $4A, $4A, $49, $49, $4E, $55, $59, $67, $67
            fcb $4C, $4C, $4C, $4B, $51, $57, $59, $59, $59
            fcb $4D, $4D, $4D, $55, $5D, $60, $70, $70, $70
            fcb $4A, $4A, $4A, $55, $5F, $5E, $5F, $5F, $5F

TL_TL_83EB:
unk_83EB:   fcb $D0, $A4, $74, $13, $0C, $0A, $04, $04, $04

TL_TL_83F4:
unk_83F4:   fcb $14, $14, $14, $14, $10, $0A, $03, $03, $03

TL_TL_83FD:
unk_83FD:   fcb $CA, $88, $58, $2A, $23, $0F, $05, $00, $00

TL_TL_8406:
unk_8406:   fcb $50, $48, $34, $1E, $10, $08, $00, $00, $00

TL_TL_840f:
unk_840F:   fcb $00, $00, $00, $00, $00, $40, $80, $80, $80

TL_TL_8418:
unk_8418:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

TL_TL_8421:
unk_8421:   fcb $40, $40, $30, $2E, $28, $20, $1A, $08, $08

byte_842A:  fcb $00

unk_842B:
            fcb $02
            fcb $58, $00, $00, $00
            fcb $FF, $00

 DCB.B $0C, $FF ; 12 bytes of 0xFF

 ORG $843E
tl_tl_843e:
unk_843E:
            fcb $08
            fcb $61, $80, $FF, $30
            fcb $71, $73, $FD, $60
            fcb $81, $49, $FE, $4B
            fcb $92, $2C, $FE, $C0
            fcb $A2, $18, $FF, $70
            fcb $C2, $06, $FF, $E9
            fcb $E3, $03, $FF, $E5
            fcb $FF, $00

unk_845D:   fcb $F8, $C0, $6A, $2D, $28, $25, $14, $14, $14

unk_8466:   fcb $CC, $CC, $CC, $CC, $CC, $CC, $E6, $FF, $FF

unk_846F:
            fcb $04
            fcb $0C, $00, $00, $AB
            fcb $30, $18, $00, $D5
            fcb $60, $40, $02, $00
            fcb $80, $80

 DCB.B $04, $FF ; 4 bytes of 0xFF

unk_8482:
            fcb $02
            fcb $00, $00, $00, $00
            fcb $FF, $00

 DCB.B $0C, $FF ; 12 bytes of 0xFF

word_8495:
TL_TL_8481: fdb $8000
byte_8497:
TL_TL_8483: fcb $D0
byte_8498:
TL_TL_8484: fcb $D0
byte_8499:
TL_TL_8485: fcb $04

unk_849A:   fcb $10, $10, $10, $10, $12, $18, $1C, $1C, $1C

unk_84A3:   fcb $10, $10, $10, $0B, $08, $08, $04, $04, $04

unk_84AC:   fcb $20, $20, $20, $18, $18, $18, $18, $18, $18

unk_84B5:   fcb $CF, $A0, $7D, $32, $2A, $28, $1C, $1C, $16

unk_84BE:   fcb $60, $50, $40, $32, $2C, $28, $10, $10, $10

unk_84C7:   fcb $20, $20, $20, $20, $20, $40, $40, $40, $40

TL_MapVoltsAverageFactors1:
unk_84D0:   fcb $80, $80
byte_84D2:  fcb $96
byte_84D3:  fcb $60
byte_84D4:  fcb $9F

TL_RPMAverageFactors1:
unk_84D5:   fcb $20, $20
word_84D7:  fdb $0001
word_84D9:  fdb $FFD6
word_84DB:  fdb $0219
byte_84DD:  fcb $99
byte_84DE:  fcb $99
unk_84DF:   fcb $40
            fcb $40
byte_84E1:  fcb $F0

unk_84E2:   fcb $28, $28, $24, $1D, $1B, $18, $18, $18, $18

byte_84EB:  fcb $10
word_84EC:  fdb $024F

TL_RPM3DInputModifierFromRPM2:
unk_84EE:
            fcb $04
            fcb $13, $00, $0A, $AB
            fcb $1F, $80, $02, $11
            fcb $3E, $C0, $01, $57
            fcb $6D, $FF


 DCB.B $10, $FF ; 16 bytes of 0xFF

TL_O2LoLimitForInMiddleDetermination:
unk_850D:
            fcb $05
            fcb $09
            fcb $00
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
            fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
            fcb $18, $18, $18, $18, $18, $18, $18, $18, $18
            fcb $18, $18, $18, $18, $18, $18, $18, $18, $18

 DCB.B $6C, $FF ; 108 bytes of 0xFF

TL_O2HiLimitForInMiddleDetermination:
unk_85A9:
            fcb $05
            fcb $09
            fcb $00
            fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
            fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
            fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
            fcb $20, $20, $20, $20, $20, $20, $20, $20, $20
            fcb $20, $20, $20, $20, $20, $20, $20, $20, $20

 DCB.B $6C, $FF ; 108 bytes of 0xFF

byte_8645:  fcb $0B
byte_8646:  fcb $10
byte_8647:  fcb $20
byte_8648:  fcb $20
byte_8649:  fcb $04
byte_864A:  fcb $02
byte_864B:  fcb $60
byte_864C:  fcb $01
byte_864D:  fcb $FE
byte_864E:  fcb $29
unk_864F:   fcb $40
byte_8650:  fcb $0B
byte_8651:  fcb $05
byte_8652:  fcb $8C
unk_8653:   fcb $C0
byte_8654:  fcb $0B
byte_8655:  fcb $15
            fcb $20
byte_8657:  fcb $26
byte_8658:  fcb $10
byte_8659:  fcb $A0
unk_865A:   fcb $C0
            fcb $C0
byte_865C:  fcb $D6
byte_865D:  fcb $08
byte_865E:  fcb $2C
byte_865F:  fcb $74
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
byte_866E:  fcb $68
byte_866F:  fcb $10
byte_8670:  fcb $04
byte_8671:  fcb $58
byte_8672:  fcb $17
byte_8673:  fcb $85
byte_8674:  fcb $32
byte_8675:  fcb $24
byte_8676:  fcb $56
byte_8677:  fcb $F1
byte_8678:  fcb $17
word_8679:  fdb $0001
byte_867B:  fcb $6E
byte_867C:  fcb $A0
word_867D:  fdb $0384
byte_867F:  fcb $02
byte_8680:  fcb $C0
byte_8681:  fcb $F0
byte_8682:  fcb $03
byte_8683:  fcb $01
byte_8684:  fcb $08
byte_8685:  fcb $0A
byte_8686:  fcb $9A
word_8687:  fdb $0000
word_8689:  fdb $030A
byte_868B:  fcb $00
byte_868C:  fcb $02
word_868D:  fdb $02F0
word_868F:  fdb $9C40
word_8691:  fdb $0190
byte_8693:  fcb $E0
byte_8694:  fcb $06
word_8695:  fdb $B220
word_8697:  fdb $0190
byte_8699:  fcb $80
byte_869A:  fcb $01
word_869B:  fdb $00B6
byte_869D:  fcb $0F
byte_869E:  fcb $1C
byte_869F:  fcb $1C

TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm:
unk_86A0:
            fcb $02
            fcb $05, $00, $01, $6E
            fcb $0C, $0A

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
unk_86B7:   fcb $03, $D0, $D0, $00, $00, $D0, $D0, $00, $00, $D0, $D0

TL_AisStartupPosition_FromTemp:
unk_86C2:
            fcb $05
            fcb $58, $E0, $FE, $66
            fcb $80, $A0, $FD, $CD
            fcb $A8, $48, $FF, $9A
            fcb $D0, $38, $00, $CD
            fcb $F8, $58

unk_86D5:
            fcb $03
            fcb $9A, $28, $FF, $7A
            fcb $C8, $10, $FF, $9A
            fcb $F0, $00

byte_86E0:  fcb $11
byte_86E1:  fcb $A0
byte_86E2:  fcb $20
byte_86E3:  fcb $D0
byte_86E4:  fcb $EE

TL_ACOffIdleDelta_FromSpeed:
unk_86E5:
            fcb $04
            fcb $14, $14, $FF, $C0
            fcb $3C, $0A, $FF, $F3
            fcb $64, $08, $FF, $EF
            fcb $82, $06

TL_AISAddedFromTimeEngRunning:
byte_86F4:  fcb $00

TL_AisColdPosition_FromTemp:
unk_86F5:
            fcb $04
            fcb $68, $50, $FF, $55
            fcb $80, $40, $FF, $33
            fcb $A8, $20, $FF, $33
            fcb $D0, $00

unk_8704:
            fcb $03
            fcb $00, $00, $00, $00
            fcb $10, $00, $00, $00
            fcb $21, $00

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
            fcb $1C, $08, $00, $00
            fcb $2E, $08, $00, $00
            fcb $3F, $08, $00, $00
            fcb $FF, $08

unk_872D:
            fcb $03
            fcb $9A, $50, $FF, $DF
            fcb $C8, $4A, $FF, $C0
            fcb $F0, $40

TL_IdleSpeedParkNeutral_FromTemp:
unk_8738:
            fcb $05
            fcb $58, $96, $FF, $86
            fcb $A8, $70, $FF, $86
            fcb $D0, $5D, $00, $00
            fcb $E5, $5D, $04, $1C
            fcb $EE, $82

TL_IdleSpeedDrive_FromTemp:
unk_874B:
            fcb $05
            fcb $58, $96, $FF, $86
            fcb $A8, $70, $FF, $86
            fcb $D0, $5D, $00, $00
            fcb $E5, $5D, $04, $1C
            fcb $EE, $82

TL_DecelAisBaseAirflowCurveOffset_FromTime2:
unk_875E:
            fcb $03
            fcb $00, $00, $00, $00
            fcb $00, $00, $00, $00
            fcb $00, $00

byte_8769:  fcb $67
byte_876A:  fcb $5D

TL_ForwardAisSteps_NoSlope:
unk_876B:
            fcb $05
            fcb $32, $01, $00, $00
            fcb $4B, $02, $00, $00
            fcb $5A, $03, $00, $00
            fcb $78, $05, $00, $00
            fcb $96, $08

TL_ReverseAisSteps_NoSlope:
unk_877E:
            fcb $05
            fcb $40, $FF, $00, $00
            fcb $A0, $FF, $00, $00
            fcb $C8, $FF, $00, $00
            fcb $E6, $FF, $00, $00
            fcb $FF, $FF

byte_8791:  fcb $11
byte_8792:  fcb $11
byte_8793:  fcb $EE

unk_8794:   fcb $1A, $1A, $1A, $1A, $1A, $1A, $16, $14, $14

byte_879D:  fcb $1F

unk_879E:   fcb $1A, $1A, $1A, $1A, $1A, $1A, $16, $14, $14

TL_AisPeriodForRpmFeedback11ms:
byte_87A7:  fcb $38

TL_AisHighLimitMaxOpenSteps:
byte_87A8:  fcb $DB

TL_AisDelayAfterThrottleClosesWhenMoving:
unk_87A9:   fcb $40, $50

TL_UpdateRateOffIdleWhenAisClosing:
byte_87AB:  fcb $7F

TL_PositionAisMotorIsAtIdle:
byte_87AC:  fcb $10

TL_AISAddedFromTimeEngRunning2:
byte_87AD:  fcb $08

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK:
unk_87AE:
            fcb $03
            fcb $58, $F0, $00, $00
            fcb $A8, $F0, $00, $00
            fcb $F8, $F0

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK2
unk_87B9:
            fcb $03
            fcb $58, $10, $00, $00
            fcb $A8, $10, $00, $00
            fcb $F8, $10

TL_AISDecel_FromBaro:
unk_87C4:
            fcb $04
            fcb $9A, $E8, $00, $36
            fcb $AD, $EC, $00, $00
            fcb $C8, $EC, $00, $80
            fcb $F0, $00

 DCB.B $04, $FF ; 4 bytes of 0xFF

unk_87D7:
            fcb $02
            fcb $0B, $00, $00, $00
            fcb $1B, $00

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_AISDecel_FromTemp:
unk_87E2:
            fcb $04
            fcb $58, $30, $FF, $B3
            fcb $80, $24, $FF, $80
            fcb $A8, $10, $FF, $9A
            fcb $D0, $00

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_AdditionToControlMap:
unk_87F5:
            fcb $04
            fcb $1F, $00, $00, $00
            fcb $46, $00, $00, $00
            fcb $6D, $00, $00, $00
            fcb $BC, $00

TL_OffsetCorrectionTo_MAPFLR_FromBaro:
unk_8804:
            fcb $03
            fcb $00, $00, $00, $00
            fcb $8F, $00, $00, $00
            fcb $FF, $00

TL_TempTermForMapOffset_FromTemp:
unk_880F:
            fcb $02
            fcb $90, $FF, $00, $00
            fcb $C7, $FF

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_DecelAisOpenStepsFromNeg_FromDeltaMap:
unk_881A:
            fcb $04
            fcb $08, $00, $00, $80
            fcb $0C, $02, $00, $40
            fcb $10, $03, $00, $40
            fcb $18, $05

TL_DecelAisOpenStepsFromPos_FromDeltaMap:
unk_8829:
            fcb $04
            fcb $08, $00, $FF, $C0
            fcb $0C, $FF, $FF, $C0
            fcb $10, $FE, $FF, $E0
            fcb $18, $FD

TL_TimeBetweenAisPulsesForDecelAis:
byte_8838:  fcb $3F

TL_EngineTempToStartCalibratingDacal:
byte_8839:  fcb $D6

TL_DeltaRpmFromIdleSpeedForDacalUpdate:
byte_883A:  fcb $02

TL_ACFactorDeltaFromBase:
byte_883B:  fcb $12
byte_883C:  fcb $1F

TL_Base_nominalCal:
byte_883D:  fcb $00

TL_DacalInhibitTimeAfterStartup:
byte_883E:  fcb $0B

TL_DacalUpdateRate01_03_07_0f_1f_3f_7f_ff:
byte_883F:  fcb $7F
byte_8840:  fcb $00
byte_8841:  fcb $00
word_8842:  fdb $0FAD
byte_8844:  fcb $70
byte_8845:  fcb $8C
byte_8846:  fcb $70
byte_8847:  fcb $FF
word_8848:  fdb $FF00
word_884A:  fdb $FF00
byte_884C:  fcb $04
byte_884D:  fcb $B6
byte_884E:  fcb $07
byte_884F:  fcb $10
byte_8850:  fcb $FE
byte_8851:  fcb $FE
byte_8852:  fcb $10
byte_8853:  fcb $0A
byte_8854:  fcb $04
byte_8855:  fcb $70
byte_8856:  fcb $03
byte_8857:  fcb $58
byte_8858:  fcb $FF
byte_8859:  fcb $5A
byte_885A:  fcb $46

TL_FanTurnOnTempAbove45Mph:
unk_885B:   fcb $E8

TL_FanTurnOnTempAbove45Mph2:
            fcb $E3

TL_FanTurnOnTempAbove45Mph3:
            fcb $E8

TL_FanTurnOnTempAbove45Mph4:
            fcb $E3
word_885F:  fdb $13E2
word_8861:  fdb $0100
byte_8863:  fcb $25
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
byte_88F8:
TL_TL_88E4: fcb $2D
byte_88F9:  fcb $28
byte_88FA:  fcb $0A
byte_88FB:  fcb $06
byte_88FC:  fcb $05
byte_88FD:  fcb $10
byte_88FE:  fcb $0F
byte_88FF:  fcb $50
byte_8900:  fcb $08

unk_8901:   fcb $FF, $FF, $FF, $41, $41, $3F, $3C, $40, $40

byte_890A:  fcb $08
byte_890B:  fcb $0D
byte_890C:  fcb $80
byte_890D:  fcb $FE
byte_890E:  fcb $F0
byte_890F:  fcb $00
byte_8910:  fcb $40
byte_8911:  fcb $30
byte_8912:  fcb $00
byte_8913:  fcb $94
byte_8914:  fcb $AA
byte_8915:  fcb $46
byte_8916:  fcb $4F
byte_8917:  fcb $00
byte_8918:  fcb $3C
byte_8919:  fcb $9A
byte_891A:  fcb $08
            fcb $04
            fcb $2D
byte_891D:  fcb $20
byte_891E:  fcb $20
byte_891F:  fcb $02
byte_8920:  fcb $01
byte_8921:  fcb $01
byte_8922:  fcb $05
byte_8923:  fcb $05
byte_8924:  fcb $80
byte_8925:  fcb $06

TL_UnknownConstForCruiseControl33:
byte_8926:  fcb $04

TL_UnknownConstForCruiseControl34:
byte_8927:  fcb $18

TL_UnknownConstForCruiseControl35:
byte_8928:  fcb $06

TL_UnknownConstForCruiseControl36:
byte_8929:  fcb $5A

TL_CruiseControlSetDeltaControlPointForCableAdaptive:
byte_892A:  fcb $04

TL_CruiseCompareConstant2:
byte_892B:  fcb $20

TL_CruiseMask2:
byte_892C:  fcb $10

TL_CruiseMask3:
byte_892D:  fcb $FC

TL_CruiseMask7:
byte_892E:  fcb $04

TL_CruiseMask4:
byte_892F:  fcb $08

TL_CruiseMask6:
byte_8930:  fcb $42

TL_CruiseMask5:
byte_8931:  fcb $CE

TL_CruiseCompareConstant1:
byte_8932:  fcb $0B

TL_CruiseMask:
byte_8933:  fcb $08

TL_CruiseControlVentRegularGainCurve_FromDeltaSpeed:
unk_8934:
            fcb $04
            fcb $00, $00, $FF, $FB
            fcb $30, $FF, $FF, $F6
            fcb $80, $FC, $FF, $EC
            fcb $FF, $F2

TL_CruiseControlVacRegularGainCurve_FromDeltaSpeed:
unk_8943:
            fcb $05
            fcb $00, $00, $00, $30
            fcb $10, $03, $00, $1B
            fcb $40, $08, $00, $20
            fcb $80, $10, $00, $0C
            fcb $FF, $16

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_CruiseControlVacAcceleratedGainCurve_FromDeltaSpeed:
unk_895A:
            fcb $04
            fcb $00, $00, $01, $00
            fcb $10, $10, $00, $C0
            fcb $30, $28, $00, $20
            fcb $70, $30

TL_CruiseControlSetupPulseForSet_FromSpeed:
unk_8969:
            fcb $04
            fcb $00, $00, $00, $B3
            fcb $3C, $2A, $00, $1A
            fcb $5A, $2D, $00, $26
            fcb $6E, $30

TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference:
unk_8978:
            fcb $05
            fcb $00, $C0, $FF, $55
            fcb $30, $A0, $FF, $9A
            fcb $80, $80, $FF, $55
            fcb $B0, $60, $FF, $00
            fcb $D0, $40

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2:
unk_898F:
            fcb $04
            fcb $80, $80, $01, $00
            fcb $84, $84, $00, $20
            fcb $94, $86, $00, $14
            fcb $C6, $8A

 DCB.B $10, $FF ; 16 bytes of 0xFF

TL_CruiseControlSpeedGainFactor_FromSpeed:
unk_89AE:
            fcb $04
            fcb $46, $04, $FF, $F3
            fcb $5A, $03, $FF, $F3
            fcb $6E, $02, $FF, $E6
            fcb $82, $00

TL_CruiseControlThrottleGainFactor_FromThrottle:
unk_89BD:
            fcb $04
            fcb $00, $06, $00, $E0
            fcb $10, $14, $00, $90
            fcb $20, $1D, $00, $30
            fcb $30, $20

TL_UnknownTableForCruiseControl6:
unk_89CC:
            fcb $03
            fcb $02, $18, $10, $00
            fcb $04, $38, $08, $00
            fcb $06, $48

TL_UnknownTableForCruiseControl1:
unk_89D7:
            fcb $02
            fcb $20, $E8, $FE, $80
            fcb $30, $D0

 DCB.B $08, $FF ; 8 bytes of 0xFF

TL_UnknownTableForCruiseControl2:
unk_89E6:
            fcb $02
            fcb $A0, $03, $00, $18
            fcb $C0, $06

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_UnknownTableForCruiseControl3:
unk_89F1:
            fcb $02
            fcb $A8, $80, $FE, $ED
            fcb $D0, $55

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_UnknownTableForCruiseControl4:
unk_89FC:
            fcb $02
            fcb $60, $00, $00, $00
            fcb $40, $00

 DCB.B $04, $FF ; 4 bytes of 0xFF

TL_UnknownTableForCruiseControl5:
unk_8A07:
            fcb $02
            fcb $A8, $00, $00, $00
            fcb $D0, $00

 DCB.B $04, $FF ; 4 bytes of 0xFF

byte_8A12:  fcb $02
unk_8A13:   fcb $20, $0D
word_8A15:  fdb $00FF
word_8A17:  fdb $2000
byte_8A19:  fcb $02
byte_8A1A:  fcb $02
byte_8A1B:  fcb $80
byte_8A1C:  fcb $00
byte_8A1D:  fcb $00

unk_8A1E:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

byte_8A27:  fcb $00
byte_8A28:  fcb $00

unk_8A29:   fcb $00, $00, $00, $00, $00, $00, $00, $00, $00

TL_ErrorBitsMask1:
unk_8A32:   fcb $26
            fcb $00, $00, $00, $00, $00
byte_8A38:  fcb $04
byte_8A39:  fcb $11

TL_PowerLossLightMask:
;Illuminate_PowerLoss_Light_Mask1._These_errors_alert_the_driver.
;ChargeTemp_Sensor  CoolantTemp_Sensor  Charging  bit3  BatVolts  Map_Signal  Tps_Signal  Map_Pneumatic
byte_8A3A:  fcb $EB

TL_PowerLossLightMask2:
;Illuminate_PowerLoss_Light_Mask2._These_errors_alert_the_driver.
;bit0  bit1  bit2  Wastegate  InjectorFault  bit5  MajorFault  bit7
byte_8A3B:  fcb $93

TL_PowerLossLightMask3:
byte_8A3C:  fcb $7E

TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup:
byte_8A3D:  fcb $63

TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup:
byte_8A3E:  fcb $E4

TL_TstatDiagnosticsTemperatureGoalWithin_HOTIME:
byte_8A3F:  fcb $CF

TL_TstatVehicleSpeedCompare:
byte_8A40:  fcb $32

TL_TstatDiagnosticsTimeToAchieveTemperatureGoal:
byte_8A41:  fcb $AA
byte_8A42:  fcb $04
byte_8A43:  fcb $BD
byte_8A44:  fcb $79

TL_CoolantTempOutOfRangeLow:
byte_8A45:  fcb $1A

TL_CoolantTempOutOfRangeHigh:
byte_8A46:  fcb $FD

TL_DefaultCoolantTempRaw:
byte_8A47:  fcb $B1

TL_ChargeTempOutOfRangeLow:
byte_8A48:  fcb $1A

TL_ChargeTempOutOfRangeHigh:
byte_8A49:  fcb $FD

TL_DefaultChargeTemp_Limpin:
byte_8A4A:  fcb $A8

TL_BatteryVoltsDiagLimitOverTarget:
byte_8A4B:  fcb $10

TL_LowBatteryVoltageAtThisRpm:
word_8A4C:  fcb $2E
            fcb $E0

TL_BatteryVoltsDiagCounterMax:
byte_8A4E:  fcb $8E

TL_BatteryVoltsDiagCounterMax2:
byte_8A4F:  fcb $7F

TL_BatteryVoltsHysteresisForAlternatorControl:
byte_8A50:  fcb $04

TL_BatteryVoltsDiagCounterMin:
byte_8A51:  fcb $06

byte_8A52:  fcb $2E

TL_HighLimitForImmediateSwitchToClosedLoop:
byte_8A53:  fcb $22

TL_LowLimitForImmediateSwitchToClosedLoop:
byte_8A54:  fcb $14

byte_8A55:  fcb $0A

TL_RPMLimitforErrorCodeSetting:
byte_8A56:  fcb $38

TL_MAPLimitforErrorCodeSetting:
byte_8A57:  fcb $70

TL_CoolantTempLimitforErrorCodeSetting:
byte_8A58:  fcb $B0

TL_ThrottleLowerLimit:
byte_8A59:  fcb $08

TL_ThrottleUpperLimit:
byte_8A5A:  fcb $F0

TL_MapSwitchPointForFullThrottleOrIdle:
byte_8A5B:  fcb $D1
byte_8A5C:  fcb $20
byte_8A5D:  fcb $28
byte_8A5E:  fcb $2F
byte_8A5F:  fcb $28
byte_8A60:  fcb $DC
byte_8A61:  fcb $8C
byte_8A62:  fcb $64
byte_8A63:  fcb $CE
byte_8A64:
TL_t3_0xfd: fcb $AB

TL_MapSensorLowerLimit:
byte_8A65:  fcb $02

TL_MapSensorUpperLimit:
byte_8A66:  fcb $FD

TL_MapSensorMiddleLimit:
byte_8A67:  fcb $66

TL_DeltaMapThatChecksGood:
byte_8A68:  fcb $01

TL_MatureMapLimpinWhenDeltaAbove_MPDELT_plus_MPDELA:
byte_8A69:  fcb $02

TL_DeltaMapThatChecksGoodX:
byte_8A6A:  fcb $05

TL_NotSure2:
unk_8A6B:   fcb $F0, $80, $50, $40, $30, $30, $20, $20, $20, $10, $10, $10, $10, $00, $00, $00

TL_DisableMapCheckUnderThisRpm_600:
word_8A7B:  fdb $12C0

TL_DisableMapCheckAboveThisRpm_1500:
word_8A7D:  fdb $2EE0

TL_DisableMapCheckBelowThisMap:
byte_8A7F:  fcb $12

TL_DisableMapCheckAboveThisMap:
byte_8A80:  fcb $F7

TL_CheckMapAtZeroSpeedAndThisDeltaRpm:
word_8A81:  fdb $0200

TL_CheckMapAtZeroSpeedAndThisBaroSwitch:
byte_8A83:  fcb $CE

TL_AllowMapToTestGoodThisNearBaro:
unk_8A84:   fcb $21

TL_AllowMapToTestGoodThisNearBaro2:
unk_8A85:   fcb $10

TL_LimpinTableForMapFromThrottle:
unk_8A86:
            fcb $05
            fcb $00, $00, $07, $92
            fcb $07, $35, $04, $64
            fcb $19, $84, $01, $66
            fcb $28, $99, $00, $95
            fcb $34, $A0

TL_OffsetForCalcMapInMapLimpin:
byte_8A99:  fcb $2E

TL_OffsetAddedToCalcThrottle:
byte_8A9A:  fcb $0B

TL_AIS_Constant_0x20:
byte_8A9B:  fcb $20

TL_ExhGasRecircConst5:
byte_8A9C:  fcb $03

TL_ExhGasRecircConstFromCoolantTemp:
byte_8A9D:  fcb $D2

TL_ExhGasRecircConstFromTimeEngRunning9:
byte_8A9E:  fcb $05
byte_8A9F:  fcb $20
byte_8AA0:  fcb $40
byte_8AA1:  fcb $10
byte_8AA2:  fcb $D0
byte_8AA3:  fcb $70
byte_8AA4:  fcb $60
byte_8AA5:  fcb $30
byte_8AA6:  fcb $C0
word_8AA7:  fdb $01B0
byte_8AA9:  fcb $44
byte_8AAA:  fcb $51
byte_8AAB:  fcb $22
byte_8AAC:  fcb $2E
byte_8AAD:  fcb $71
byte_8AAE:  fcb $B0
byte_8AAF:  fcb $80
byte_8AB0:  fcb $20
word_8AB1:  fdb $016C
byte_8AB3:  fcb $03
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

 DCB.B $6C, $FF ; 108 bytes of 0xFF

word_8B56:  fdb $0002

