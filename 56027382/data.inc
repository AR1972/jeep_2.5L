
TL_IDENT1:
byte_8000:      fcb $01
TL_IDENT2:
                fcb $00
TL_PARTNO1:
byte_8002:      fcb $56
TL_PARTNO2:
                fcb $02
TL_PARTNO3:
                fcb $73
TL_PARTNO4:
byte_8005:      fcb $82
TL_PARTNO5:
byte_8006:      fcb $B1
TL_PARTNO1A:
byte_8007:      fcb $56
TL_PARTNO2A:
                fcb $02
TL_PARTNO3A:
                fcb $74
TL_PARTNO4A:
                fcb $04
TL_PARTNO5A:
byte_800B:      fcb $B1
TL_BITSUM:
                fcb $2A
TL_CODE1
byte_800D:      fcb $2E
TL_CODE2:
                fcb $18
TL_CODE3:
                fcb $12
TL_CODE4:
                fcb $88
                fcb $FF
byte_8012:      fcb $01
                fcb $82
TL_CCDConfigConstant2:
byte_8014:      fcb $FF
TL_CONF01:
byte_8015:      fcb $81
TL_ConfigurationFlags2:
byte_8016:      fcb $20
TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly:
byte_8017:      fcb $03
TL_ProgramLoopsWithThrottleBelow_MINTHR_ToDecrement_MINTHR:
byte_8018:      fcb $10
TL_NumberOfBitsAbove_MINTHR_ToDetermineOnThrottleTransition:
byte_8019:      fcb $02
TL_NumberOfBitsAbove_MINTHR_ToDetermineOffThrottleTransition:
byte_801A:      fcb $01
TL_ValueOf_MINTHR_WhenBatteryDisconnected:
byte_801B:      fcb $5C
TL_ThrottleSelfCalibrationRpmThreshold:
byte_801C:      fcb $26
TL_ThrottleSelfCalibrationMapDeltaThreshold:
byte_801D:      fcb $4C
TL_SwitchPointForDecelIdleAisControl:
byte_801E:      fcb $04
TL_DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle:
byte_801F:      fcb $90
byte_8020:      fcb $D0
TL_ScaleMAPVoltsToPresMultiplyConst:
byte_8021:      fcb $00
TL_ScaleMAPVoltsToPresAddConst:
byte_8022:      fcb $00, $00

byte_8024:      fcb $05
                fcb $1F, $00, $00, $42
                fcb $3E, $08, $00, $08
                fcb $5E, $09, $FF, $B6
                fcb $7D, $00, $00, $53
                fcb $9C, $0A

TL_ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin:
byte_8037:      fcb $90
TL_ThrottleLevelMinAbove_MINTHR_ToMatureMapLimpin:
byte_8038:      fcb $20

TL_RPMCellLookupTable:
                fcb $0F, $A0, $14, $50, $17, $70, $20, $D0, $23, $F0, $2E, $E0, $3E, $80, $4E, $20
                fcb $5D, $C0, $6D, $60, $7D, $00, $8C, $A0, $9C, $40

TL_RPM3DInputModifierFromRPM:
byte_8053:      fcb $03
                fcb $13, $00, $05, $25
                fcb $2F, $90, $01, $05
                fcb $9C, $FF

 REPEAT 31-( * - TL_RPM3DInputModifierFromRPM )
    fcb $FF


byte_8072:      fcb $03, $93
byte_8074:      fcb $87, $00
byte_8076:      fcb $00, $03
byte_8078:      fcb $93, $87
byte_807A:      fcb $53, $B5
byte_807C:      fcb $75, $30
byte_807E:      fcb $00
byte_807F:      fcb $14
byte_8080:      fcb $02
byte_8081:      fcb $04
byte_8082:      fcb $05

TL_Spark1A_RPMMAP:
byte_8083:      fcb $11
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

TL_Spark1B_RPMMAP:
byte_811F:      fcb $11
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

byte_81BB:      fcb $03

TL_Spark2A_RPMMAP:
byte_81BC:      fcb $11
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

byte_8258:      fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $98, $98, $98, $98, $98, $98, $98
byte_8266:      fcb $28, $26, $24, $20, $20, $20, $20, $20, $1A
byte_826F:      fcb $26, $24, $22, $20, $20, $1A, $14, $14, $14
byte_8278:      fcb $D0
byte_8279:      fcb $06
byte_827A:      fcb $14
byte_827B:      fcb $1C
byte_827C:      fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
byte_8285:      fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

byte_828E:      fcb $01, $B3 , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF
                fcb $FF, $FF , $FF , $FF , $FF , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00
                fcb $00

byte_82AF:      fcb $53, $F0

byte_82B1:      fcb $75, $30

TL_ColdLoad3DTableOffIdle:
byte_82B3:      fcb $11
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
                fcb $A0, $E7, $99, $88, $7E, $7E, $E3, $E3, $E3
                fcb $A0, $D5, $A2, $91, $86, $87, $8E, $F9, $AC
                fcb $A0, $DC, $B2, $A2, $97, $99, $95, $95, $8F
                fcb $A0, $90, $D5, $C3, $B4, $A9, $A5, $C9, $9B
                fcb $A0, $90, $E1, $D1, $C6, $BE, $B7, $DA, $AA

TL_HotLoad3DTableOffIdle:
byte_834F:      fcb $11
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

byte_83EB:      fcb $D0, $A4, $74, $13, $0C, $0A, $04, $04, $04
byte_83F4:      fcb $14, $14, $14, $14, $10, $0A, $03, $03, $03
byte_83FD:      fcb $CA, $88, $58, $2A, $23, $0F, $05, $00, $00
byte_8406:      fcb $50, $48, $34, $1E, $10, $05, $00, $00, $00
byte_840F:      fcb $00, $00, $00, $00, $40, $80, $80, $80, $80
byte_8418:      fcb $00, $00, $00, $00, $00, $00, $00, $00, $00
byte_8421:      fcb $40, $40, $30, $30, $28, $20, $1A, $08, $08

byte_842A:      fcb $08
                fcb $61, $FF, $FE, $70
                fcb $71, $E6, $FA, $C0
                fcb $81, $92, $FC, $88
                fcb $92, $57, $FD, $80
                fcb $A2, $2F, $FE, $E0
                fcb $C2, $0B, $FF, $D9
                fcb $E3, $06, $FF, $C9
                fcb $FF, $00

byte_8449:      fcb $F8, $C0, $6A, $2D, $28, $25, $14, $14, $14
byte_8452:      fcb $CC, $CC, $CC, $CC, $CC, $CC, $E6, $FF, $FF

word_845B:      fdb $0BB8
byte_845D:      fcb $D0
byte_845E:      fcb $D0
byte_845F:      fcb $04
byte_8460:      fcb $10, $10, $10, $10, $12, $18, $1C, $1C, $1C
byte_8469:      fcb $10, $10, $10, $0B, $08, $08, $04, $04, $04
byte_8472:      fcb $20, $20, $20, $18, $18, $18, $18, $18, $18
byte_847B:      fcb $FA, $D0, $B0, $32, $32, $32, $32, $1C, $1C
byte_8484:      fcb $60, $50, $40, $40, $30, $30, $10, $10, $10
byte_848D:      fcb $20, $20, $20, $20, $20, $40, $40, $40, $40

byte_8496:      fcb $80, $80
byte_8498:      fcb $96
byte_8499:      fcb $60
byte_849A:      fcb $9F
byte_849B:      fcb $20, $20
byte_849D:      fcb $00, $01
byte_849F:      fcb $FF, $D6
byte_84A1:      fcb $02, $19
byte_84A3:      fcb $99
byte_84A4:      fcb $99
byte_84A5:      fcb $40, $40
byte_84A7:      fcb $F0
byte_84A8:      fcb $28, $28, $24, $20, $18, $18, $18, $18, $18
byte_84B1:      fcb $10
byte_84B2:      fcb $02, $4F

byte_84B4:      fcb $04
                fcb $13, $00, $0A, $AB
                fcb $1F, $80, $02, $11
                fcb $3E, $C0, $01, $57
                fcb $6D, $FF

 REPEAT 31-( * - byte_84B4 )
    fcb $FF
 

TL_O2LoLimitForInMiddleDetermination:
byte_84D3:      fcb $05
                fcb $09
                fcb $00
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                fcb $18, $18, $18, $18, $18, $18, $18, $18, $18
                fcb $18, $18, $18, $18, $18, $18, $18, $18, $18

 REPEAT 156-( * - TL_O2LoLimitForInMiddleDetermination )
    fcb $FF
 

TL_O2HiLimitForInMiddleDetermination:
byte_856F:      fcb $05
                fcb $09
                fcb $00
                fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
                fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
                fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
                fcb $20, $20, $20, $20, $20, $20, $20, $20, $20
                fcb $20, $20, $20, $20, $20, $20, $20, $20, $20

 REPEAT 156-( * - TL_O2HiLimitForInMiddleDetermination )
    fcb $FF
 

byte_860B:      fcb $0B
byte_860C:      fcb $10
byte_860D:      fcb $20
byte_860E:      fcb $20
byte_860F:      fcb $04
byte_8610:      fcb $02
byte_8611:      fcb $60
byte_8612:      fcb $01
byte_8613:      fcb $FE
byte_8614:      fcb $29
byte_8615:      fcb $40
byte_8616:      fcb $0B
byte_8617:      fcb $05
byte_8618:      fcb $8C
byte_8619:      fcb $C0
byte_861A:      fcb $0B
byte_861B:      fcb $15, $20
byte_861D:      fcb $26
byte_861E:      fcb $10
byte_861F:      fcb $A0
byte_8620:      fcb $C0, $C0
byte_8622:      fcb $D6
byte_8623:      fcb $08
byte_8624:      fcb $0B
byte_8625:      fcb $1D
byte_8626:      fcb $FF
byte_8627:      fcb $01
byte_8628:      fcb $38
byte_8629:      fcb $10, $07, $A0, $00, $C0
byte_862E:      fcb $08, $03, $90, $00, $E0
byte_8633:      fcb $A8
byte_8634:      fcb $68
byte_8635:      fcb $10
byte_8636:      fcb $04
byte_8637:      fcb $01
byte_8638:      fcb $17
byte_8639:      fcb $85
byte_863A:      fcb $32
byte_863B:      fcb $24
byte_863C:      fcb $56
byte_863D:      fcb $F1
byte_863E:      fcb $17
byte_863F:      fcb $00, $01
byte_8641:      fcb $6E
byte_8642:      fcb $A0
byte_8643:      fcb $03, $84
byte_8645:      fcb $02
byte_8646:      fcb $C0
byte_8647:      fcb $F0
byte_8648:      fcb $03
byte_8649:      fcb $01
byte_864A:      fcb $08
byte_864B:      fcb $0A
byte_864C:      fcb $9A
byte_864D:      fcb $00, $00
byte_864F:      fcb $03, $0A
byte_8651:      fcb $00
byte_8652:      fcb $02
byte_8653:      fcb $02, $F0
byte_8655:      fcb $9C, $40
byte_8657:      fcb $01, $90
byte_8659:      fcb $E0
byte_865A:      fcb $08
byte_865B:      fcb $B2, $20
byte_865D:      fcb $01, $90
byte_865F:      fcb $80
byte_8660:      fcb $01
byte_8661:      fcb $00, $B6
byte_8663:      fcb $0F
byte_8664:      fcb $1C
byte_8665:      fcb $1C

TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm:
byte_8666:      fcb $02
                fcb $05, $00, $01, $6E
                fcb $0C, $0A

 REPEAT 11-( * - TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm )
    fcb $FF
 
                
TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm:
byte_8671:      fcb $02
                fcb $05, $00, $FF, $9A
                fcb $0F, $FC

 REPEAT 11-( * - TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm )
    fcb $FF
 

TL_MinVoltageForAis
byte_867C:      fcb $71

TL_BrakeOverrideForAis_FromDeltaThrottle:
byte_867D:      fcb $03
                fcb $D0, $D0, $00, $00
                fcb $D0, $D0, $00, $00
                fcb $D0, $D0

TL_AisStartupPosition_FromTemp:
byte_8688:      fcb $05
                fcb $58, $E0, $FE, $66
                fcb $80, $A0, $FD, $CD
                fcb $A8, $48, $FF, $9A
                fcb $D0, $38, $00, $CD
                fcb $F8, $58

byte_869B:      fcb $03
                fcb $9A, $28, $FF, $7A
                fcb $C8, $10, $FF, $9A
                fcb $F0, $00

TL_ACPositionWhenTempToCold:
byte_86A6:      fcb $14
TL_Use_ACCTBL_WhenTempAboveThisElseUse_ACPOS:
byte_86A7:      fcb $A0
byte_86A8:      fcb $20
TL_AcClutchAisAdjustmentConstant:
byte_86A9:      fcb $D0
byte_86AA:      fcb $E8

TL_ACOffIdleDelta_FromSpeed:
byte_86AB:      fcb $04
                fcb $14, $14, $FF, $C0
                fcb $3C, $0A, $FF, $F3
                fcb $64, $08, $FF, $EF
                fcb $82, $06

TL_AISAddedFromTimeEngRunning:
byte_86BA:      fcb $00

TL_AisColdPosition_FromTemp:
byte_86BB:      fcb $04
                fcb $68, $50, $FF, $55
                fcb $80, $40, $FF, $33
                fcb $A8, $20, $FF, $33
                fcb $D0, $00

byte_86CA:      fcb $03
                fcb $00, $00, $00, $00
                fcb $10, $00, $00, $00
                fcb $21, $00

TL_AisPosition_FromThrottle:
byte_86D5:      fcb $04
                fcb $00, $00, $00, $00
                fcb $02, $00, $00, $00
                fcb $05, $00, $00, $00
                fcb $1E, $00

TL_AisPosition_FromRpm:
byte_86E4:      fcb $04
                fcb $1C, $05, $00, $72
                fcb $2E, $0D, $00, $00
                fcb $3F, $0D, $00, $00
                fcb $FF, $0D

byte_86F3:      fcb $03
                fcb $9A, $50, $FF, $DF
                fcb $C8, $4A, $FF, $C0
                fcb $F0, $40

TL_IdleSpeedParkNeutral_FromTemp:
byte_86FE:      fcb $05
                fcb $58, $96, $FF, $86
                fcb $A8, $70, $FF, $86
                fcb $D0, $5D, $00, $00
                fcb $E5, $5D, $04, $1C
                fcb $EE, $82

TL_IdleSpeedDrive_FromTemp:
byte_8711:      fcb $05
                fcb $58, $96, $FF, $86
                fcb $A8, $70, $FF, $86
                fcb $D0, $5D, $00, $00
                fcb $E5, $5D, $04, $1C
                fcb $EE, $82

TL_DecelAisBaseAirflowCurveOffset_FromTime2:
byte_8724:      fcb $03
                fcb $00, $00, $00, $00
                fcb $00, $00, $00, $00
                fcb $00, $00

byte_872F:      fcb $6A

TL_TargetIdleSpeed_HBDefault:
byte_8730:      fcb $64

TL_ForwardAisSteps_NoSlope:
byte_8731:      fcb $05
                fcb $32, $01, $00, $00
                fcb $4B, $02, $00, $00
                fcb $5A, $03, $00, $00
                fcb $78, $05, $00, $00
                fcb $96, $08

TL_ReverseAisSteps_NoSlope:
byte_8744:      fcb $05
                fcb $40, $FF, $00, $00
                fcb $A0, $FE, $00, $00
                fcb $C8, $FB, $00, $00
                fcb $E6, $FA, $00, $00
                fcb $FF, $F8

byte_8757:      fcb $11
byte_8758:      fcb $11
byte_8759:      fcb $EE
byte_875A:      fcb $1A, $1A, $1A, $1A, $1A, $1A, $16, $08, $08
byte_8763:      fcb $1F
byte_8764:      fcb $1A, $1A, $1A, $1A, $1A, $1A, $16, $08, $08
TL_AisPeriodForRpmFeedback11ms:
byte_876D:      fcb $38
TL_AisHighLimitMaxOpenSteps:
byte_876E:      fcb $DB
TL_AisDelayAfterThrottleClosesWhenMoving:
byte_876F:      fcb $40, $50
TL_UpdateRateOffIdleWhenAisClosing:
byte_8771:      fcb $7F
TL_PositionAisMotorIsAtIdle:
byte_8772:      fcb $10

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK:
byte_8773:      fcb $03
                fcb $58, $F0, $00, $00
                fcb $A8, $F0, $00, $00
                fcb $F8, $F0

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK2:
byte_877E:      fcb $03
                fcb $58, $10, $00, $00
                fcb $A8, $10, $00, $00
                fcb $F8, $10

TL_AISDecel_FromBaro:
byte_8789:      fcb $04
                fcb $9A, $98, $FF, $CA
                fcb $AD, $94, $00, $00
                fcb $C8, $94, $FF, $80
                fcb $F0, $80

 REPEAT 19-( * - TL_AISDecel_FromBaro )
    fcb $FF
 

TL_DecelAisBaseAirflowCurveOffset_FromTime:
byte_879C:      fcb $02
                fcb $0B, $00, $00, $00
                fcb $1B, $00

 REPEAT 11-( * - TL_DecelAisBaseAirflowCurveOffset_FromTime )
    fcb $FF
 

TL_AISDecel_FromTemp:
byte_87A7:      fcb $04
                fcb $58, $30, $FF, $B3
                fcb $80, $24, $FF, $80
                fcb $A8, $10, $FF, $9A
                fcb $D0, $00

 REPEAT 19-( * - TL_AISDecel_FromTemp )
    fcb $FF
 

TL_AdditionToControlMap:
byte_87BA:      fcb $04
                fcb $1F, $00, $00, $00
                fcb $46, $00, $00, $00
                fcb $6D, $00, $00, $00
                fcb $BC, $00

TL_OffsetCorrectionTo_MAPFLR_FromBaro:
byte_87C9:      fcb $03
                fcb $00, $00, $00, $00
                fcb $8F, $00, $00, $00
                fcb $FF, $00

TL_TempTermForMapOffset_FromTemp:
byte_87D4:      fcb $02
                fcb $90, $FF, $00, $00
                fcb $C7, $FF

 REPEAT 11-( * - TL_TempTermForMapOffset_FromTemp )
    fcb $FF
 

TL_DecelAisOpenStepsFromNeg_FromDeltaMap:
byte_87DF:      fcb $04
                fcb $08, $00, $00, $80
                fcb $0C, $02, $00, $40
                fcb $10, $03, $00, $40
                fcb $18, $05

TL_DecelAisOpenStepsFromPos_FromDeltaMap
byte_87EE:      fcb $04
                fcb $08, $00, $FF, $C0
                fcb $0C, $FF, $FF, $C0
                fcb $10, $FE, $FF, $E0
                fcb $18, $FD

TL_TimeBetweenAisPulsesForDecelAis:
byte_87FD:      fcb $3F
TL_EngineTempToStartCalibratingDacal:
byte_87FE:      fcb $D4
TL_DeltaRpmFromIdleSpeedForDacalUpdate:
byte_87FF:      fcb $02
TL_ACFactorDeltaFromBase:
byte_8800:      fcb $12
byte_8801:      fcb $1F
TL_Base_nominalCal:
byte_8802:      fcb $0B
byte_8803:      fcb $7F
word_8804:      fdb $0FAD
byte_8806:      fcb $70
byte_8807:      fcb $8C
byte_8808:      fcb $70
byte_8809:      fcb $FF
word_880A:      fdb $7D00
word_880C:      fdb $7D00
byte_880E:      fcb $04
byte_880F:      fcb $B6
byte_8810:      fcb $07
byte_8811:      fcb $10
byte_8812:      fcb $FE
byte_8813:      fcb $FE
byte_8814:      fcb $10
byte_8815:      fcb $0A
byte_8816:      fcb $04
byte_8817:      fcb $70
byte_8818:      fcb $03
byte_8819:      fcb $58
byte_881A:      fcb $FF
byte_881B:      fcb $5A
byte_881C:      fcb $46
word_881D:      fdb $E8E3
                fdb $E8E3
word_8821:      fdb $0000
word_8823:      fdb $0000
byte_8825:      fcb $00
byte_8826:      fcb $00
byte_8827:      fcb $92
byte_8828:      fcb $00
byte_8829:      fcb $20
byte_882A:      fcb $32
byte_882B:      fcb $00
byte_882C:      fcb $06
byte_882D:      fcb $40

byte_882E:      fcb $06
                fcb $1C, $24, $00, $E7
                fcb $3B, $40, $05, $C0
                fcb $3F, $57, $06, $AB
                fcb $42, $6B, $00, $00
                fcb $54, $6B, $00, $00
                fcb $54, $A8

byte_8845:      fcb $04
                fcb $1F, $0F, $00, $F7
                fcb $74, $61, $00, $00
                fcb $8A, $61, $00, $00
                fcb $8A, $A8

 REPEAT 23-( * - byte_8845 )
    fcb $FF
 

byte_885C:      fcb $04
                fcb $1F, $0F, $00, $F7
                fcb $74, $61, $00, $00
                fcb $8A, $61, $00, $00
                fcb $8A, $A8

 REPEAT 23-( * - byte_885C )
    fcb $FF
 

TL_PTUMinLockTemperature:
byte_8873:      fcb $B8
TL_PTUCounterTimerIntervalForLoop:
byte_8874:      fcb $07
TL_PTUMinLockSpeed:
byte_8875:      fcb $7C
TL_PTUMAPThresholdForLock3:
byte_8876:      fcb $14
TL_PTUDeltaTPSForUnlock:
byte_8877:      fcb $66
TL_PTUMAPThresholdForLock1:
word_8878:      fdb $8118
TL_PTUCounterHiSpeed:
byte_887A:      fcb $20
TL_PTUCounterLoSpeed:
byte_887B:      fcb $11
byte_887C:      fcb $00

TL_UpperLimitForPTULock:
byte_887D:      fcb $04
                fcb $64, $0F, $00, $00
                fcb $64, $2E, $00, $AB
                fcb $82, $42, $00, $00
                fcb $82, $A8

TL_LowerLimitForPTULock:
                fcb $02
                fcb $64, $0F, $00, $00
                fcb $96, $0F

 REPEAT 15-( * - TL_LowerLimitForPTULock )
    fcb $FF
 

TL_UpperLimitForPTUUnlock:
byte_889B:      fcb $04
                fcb $5E, $05, $00, $00
                fcb $5E, $33, $00, $AB
                fcb $7C, $47, $00, $00
                fcb $7C, $A8

                fcb $05
                fcb $5E
                fcb $05
                fcb $00
                fcb $00
                fcb $96
                fcb $05
                fcb $02
                fcb $62
                fcb $FF
                fcb $FF
                fcb $00
                fcb $00
                fcb $FF
                fcb $FF

byte_88B9:      fcb $50
byte_88BA:      fcb $2D
byte_88BB:      fcb $24
byte_88BC:      fcb $02
byte_88BD:      fcb $08
byte_88BE:      fcb $05
byte_88BF:      fcb $10
byte_88C0:      fcb $0F
byte_88C1:      fcb $50
byte_88C2:      fcb $08
byte_88C3:      fcb $FF, $FF, $FF, $41, $41, $3F, $3C, $40, $40
byte_88CC:      fcb $08
byte_88CD:      fcb $0D
byte_88CE:      fcb $80
TL_CruiseControlLimitToAMaxVent:
byte_88CF:      fcb $FE
TL_CruiseControlLimitToHalfMaxVent:
byte_88D0:      fcb $F0
TL_UnknownConstForCruiseControl46:
byte_88D1:      fcb $00
TL_UnknownConstForCruiseControl47:
byte_88D2:      fcb $40
TL_CruiseControlDeltaSpeedToResetAccFlag:
byte_88D3:      fcb $30
TL_CruiseControlDontVentIfThrottleBelowThis:
byte_88D4:      fcb $00
TL_CruiseControlDontVacIfThrottleAboveThis:
byte_88D5:      fcb $94
TL_CruiseControlMaxSetSpeedTimesTwo:
byte_88D6:      fcb $AA
TL_CruiseControlMinSetSpeedTimesTwo:
byte_88D7:      fcb $46
TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableHi:
byte_88D8:      fcb $4F
TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableLo:
byte_88D9:      fcb $00
TL_UnknownConstForCruiseControl21:
byte_88DA:      fcb $3C
TL_UnknownConstForCruiseControl22:
byte_88DB:      fcb $7D
TL_UnknownConstForCruiseControl23:
byte_88DC:      fcb $08

                fcb $04, $2D

TL_UnknownConstForCruiseControl24:
byte_88DF:      fcb $20

TL_UnknownConstForCruiseControl25:
byte_88E0:      fcb $20

TL_UnknownConstForCruiseControl26:
byte_88E1:      fcb $02

TL_UnknownConstForCruiseControl27:
byte_88E2:      fcb $01

TL_UnknownConstForCruiseControl28:
byte_88E3:      fcb $01

TL_UnknownConstForCruiseControl29:
byte_88E4:      fcb $05

TL_UnknownConstForCruiseControl30:
byte_88E5:      fcb $05

TL_UnknownConstForCruiseControl31:
byte_88E6:      fcb $80

TL_UnknownConstForCruiseControl32:
byte_88E7:      fcb $06

TL_UnknownConstForCruiseControl33:
byte_88E8:      fcb $04

TL_UnknownConstForCruiseControl34:
byte_88E9:      fcb $18

TL_UnknownConstForCruiseControl35:
byte_88EA:      fcb $06

TL_UnknownConstForCruiseControl36:
byte_88EB:      fcb $5A

TL_CruiseControlSetDeltaControlPointForCableAdaptive:
byte_88EC:      fcb $04

TL_CruiseCompareConstant2:
byte_88ED:      fcb $20

TL_CruiseMask2:
byte_88EE:      fcb $10

TL_CruiseMask3:
byte_88EF:      fcb $FC

TL_CruiseMask7:
byte_88F0:      fcb $04

TL_CruiseMask4:
byte_88F1:      fcb $08

TL_CruiseMask6:
byte_88F2:      fcb $42

TL_CruiseMask5:
byte_88F3:      fcb $CE

TL_CruiseCompareConstant1:
byte_88F4:      fcb $0B

TL_CruiseMask:
byte_88F5:      fcb $08

TL_CruiseControlVentRegularGainCurve_FromDeltaSpeed:
byte_88F6:      fcb $04
                fcb $00, $00, $FF, $FB
                fcb $30, $FF, $FF, $F6
                fcb $80, $FC, $FF, $EC
                fcb $FF, $F2

TL_CruiseControlVacRegularGainCurve_FromDeltaSpeed:
byte_8905:      fcb $05
                fcb $00, $00, $00, $30
                fcb $10, $03, $00, $1B
                fcb $40, $08, $00, $20
                fcb $80, $10, $00, $0C
                fcb $FF, $16

 REPEAT 23-( * - TL_CruiseControlVacRegularGainCurve_FromDeltaSpeed )
    fcb $FF
 

TL_CruiseControlVacAcceleratedGainCurve_FromDeltaSpeed:
byte_891C:      fcb $04
                fcb $00, $00, $01, $00
                fcb $10, $10, $00, $C0
                fcb $30, $28, $00, $20
                fcb $70, $30

TL_CruiseControlSetupPulseForSet_FromSpeed:
byte_892B:      fcb $04
                fcb $00, $00, $00, $B3
                fcb $3C, $2A, $00, $1A
                fcb $5A, $2D, $00, $26
                fcb $6E, $30

TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference:
byte_893A:      fcb $05
                fcb $00, $C0, $FF, $55
                fcb $30, $A0, $FF, $9A
                fcb $80, $80, $FF, $55
                fcb $B0, $60, $FF, $00
                fcb $D0, $40

 REPEAT 23-( * - TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference )
    fcb $FF
 

TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2:
byte_8951:      fcb $04
                fcb $80, $80, $01, $00
                fcb $84, $84, $00, $20
                fcb $94, $86, $00, $14
                fcb $C6, $8A

 REPEAT 31-( * - TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2 )
    fcb $FF
 

TL_CruiseControlSpeedGainFactor_FromSpeed:
byte_8970:      fcb $04
                fcb $46, $04, $FF, $F3
                fcb $5A, $03, $FF, $F3
                fcb $6E, $02, $FF, $E6
                fcb $82, $00

TL_CruiseControlThrottleGainFactor_FromThrottle:
byte_897F:      fcb $04
                fcb $00, $06, $00, $E0
                fcb $10, $14, $00, $90
                fcb $20, $1D, $00, $30
                fcb $30, $20

TL_UnknownTableForCruiseControl6:
byte_898E:      fcb $03
                fcb $02, $18, $10, $00
                fcb $04, $38, $08, $00
                fcb $06, $48

TL_UnknownTableForCruiseControl1:
byte_8999:      fcb $02
                fcb $20, $E8, $FE, $80
                fcb $30, $D0

 REPEAT 15-( * - TL_UnknownTableForCruiseControl1 )
    fcb $FF
 

TL_UnknownTableForCruiseControl2:
byte_89A8:      fcb $02
                fcb $A0, $03, $00, $18
                fcb $C0, $06

 REPEAT 11-( * - TL_UnknownTableForCruiseControl2 )
    fcb $FF
 

TL_UnknownTableForCruiseControl3:
byte_89B3:      fcb $02
                fcb $A8, $80, $FE, $ED
                fcb $D0, $55

 REPEAT 11-( * - TL_UnknownTableForCruiseControl3 )
    fcb $FF
 

TL_UnknownTableForCruiseControl4:
byte_89BE:      fcb $02
                fcb $A0, $03, $00, $18
                fcb $C0, $06

 REPEAT 11-( * - TL_UnknownTableForCruiseControl4 )
    fcb $FF
 

TL_UnknownTableForCruiseControl5:
byte_89C9:      fcb $02
                fcb $A8, $80, $FE, $ED
                fcb $D0, $55

 REPEAT 11-( * - TL_UnknownTableForCruiseControl5 )
    fcb $FF
 

TL_ErrorBitsMask1:
                fcb $00
                fcb $00
                fcb $00
                fcb $00
                fcb $00
                fcb $00
byte_89DA:      fcb $04
byte_89DB:      fcb $11
TL_PowerLossLightMask:
byte_89DC:      fcb $EB
TL_PowerLossLightMask2:
byte_89DD:      fcb $93
TL_PowerLossLightMask3:
byte_89DE:      fcb $3E
TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup:
byte_89DF:      fcb $63
TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup:
byte_89E0:      fcb $E4
TL_TstatDiagnosticsTemperatureGoalWithin_HOTIME:
byte_89E1:      fcb $CF
TL_TstatVehicleSpeedCompare:
byte_89E2:      fcb $32
TL_TstatDiagnosticsTimeToAchieveTemperatureGoal:
byte_89E3:      fcb $AA
byte_89E4:      fcb $04
byte_89E5:      fcb $BD
byte_89E6:      fcb $79
TL_CoolantTempOutOfRangeLow:
byte_89E7:      fcb $1A
TL_CoolantTempOutOfRangeHigh:
byte_89E8:      fcb $FD
TL_DefaultCoolantTempRaw:
byte_89E9:      fcb $B1
TL_ChargeTempOutOfRangeLow:
byte_89EA:      fcb $1A
TL_ChargeTempOutOfRangeHigh:
byte_89EB:      fcb $FD
TL_DefaultChargeTemp_Limpin:
byte_89EC:      fcb $A8
TL_BatteryVoltsDiagLimitOverTarget:
byte_89ED:      fcb $10
TL_LowBatteryVoltageAtThisRpm:
byte_89EE:      fcb $2E
                fcb $E0
TL_BatteryVoltsDiagCounterMax:
byte_89F0:      fcb $8E
TL_BatteryVoltsDiagCounterMax2:
byte_89F1:      fcb $7F
TL_BatteryVoltsHysteresisForAlternatorControl:
byte_89F2:      fcb $04
TL_BatteryVoltsDiagCounterMin:
byte_89F3:      fcb $06
byte_89F4:      fcb $2E
TL_HighLimitForImmediateSwitchToClosedLoop:
byte_89F5:      fcb $22
TL_LowLimitForImmediateSwitchToClosedLoop:
byte_89F6:      fcb $14
byte_89F7:      fcb $0A
TL_RPMLimitforErrorCodeSetting:
byte_89F8:      fcb $38
TL_MAPLimitforErrorCodeSetting:
byte_89F9:      fcb $70
TL_CoolantTempLimitforErrorCodeSetting:
byte_89FA:      fcb $B0
TL_ThrottleLowerLimit:
byte_89FB:      fcb $08
TL_ThrottleUpperLimit:
byte_89FC:      fcb $F0
TL_MapSwitchPointForFullThrottleOrIdle:
byte_89FD:      fcb $D1
byte_89FE:      fcb $20
byte_89FF:      fcb $28
byte_8A00:      fcb $2F
byte_8A01:      fcb $28
byte_8A02:      fcb $DC
byte_8A03:      fcb $8C
byte_8A04:      fcb $64
byte_8A05:      fcb $CE
byte_8A06:      fcb $AB
TL_MapSensorLowerLimit:
byte_8A07:      fcb $02
TL_MapSensorUpperLimit:
byte_8A08:      fcb $FD
TL_MapSensorMiddleLimit:
byte_8A09:      fcb $66
TL_DeltaMapThatChecksGood:
byte_8A0A:      fcb $01
TL_MatureMapLimpinWhenDeltaAbove_MPDELT_plus_MPDELA:
byte_8A0B:      fcb $02
TL_DeltaMapThatChecksGoodX:
byte_8A0C:      fcb $05
TL_NotSure2:
byte_8A0D:      fcb $F0, $80, $50, $40, $30, $30, $20, $20, $20, $10, $10, $10, $10, $00, $00, $00
TL_DisableMapCheckUnderThisRpm_600:
byte_8A1D:      fcb $12, $C0
TL_DisableMapCheckAboveThisRpm_1500:
byte_8A1F:      fcb $2E, $E0
TL_DisableMapCheckBelowThisMap:
byte_8A21:      fcb $12
TL_DisableMapCheckAboveThisMap
byte_8A22:      fcb $F7
TL_CheckMapAtZeroSpeedAndThisDeltaRpm:
byte_8A23:      fcb $02, $00
TL_CheckMapAtZeroSpeedAndThisBaroSwitch:
byte_8A25:      fcb $CE
TL_AllowMapToTestGoodThisNearBaro:
byte_8A26:      fcb $21
TL_AllowMapToTestGoodThisNearBaro2:
                fcb $10

TL_LimpinTableForMapFromThrottle:
byte_8A28:      fcb $05
                fcb $00, $00, $07, $92
                fcb $07, $35, $04, $64
                fcb $19, $84, $01, $66
                fcb $28, $99, $00, $95
                fcb $34, $A0

TL_OffsetForCalcMapInMapLimpin:
byte_8A3B:      fcb $2E
TL_OffsetAddedToCalcThrottle:
byte_8A3C:      fcb $0B
TL_AIS_Constant_0x20:
byte_8A3D:      fcb $20
TL_ExhGasRecircConst5:
byte_8A3E:      fcb $03
TL_ExhGasRecircConstFromCoolantTemp:
byte_8A3F:      fcb $D2
TL_ExhGasRecircConstFromTimeEngRunning9:
byte_8A40:      fcb $05
TL_ExhGasRecircConstFromMAPBelowBaro
byte_8A41:      fcb $20
TL_ExhGasRecircConstFromTPSVoltsLoLimit14a
byte_8A42:      fcb $40
TL_ExhGasRecircConstFromTPSVoltsLoLimit14:
byte_8A43:      fcb $10
TL_ExhGasRecircConstLoLimit18a:
byte_8A44:      fcb $D0
TL_ExhGasRecircConstLoLimit18:
byte_8A45:      fcb $70
TL_ExhGasRecircConstFromRPMLoLimit15a:
byte_8A46:      fcb $60
TL_ExhGasRecircConstFromRPMLoLimit15:
byte_8A47:      fcb $30
TL_ExhGasRecircConst3:
byte_8A48:      fcb $C0
TL_ExhGasRecircConst1:
word_8A49:      fdb $01B0
TL_ExhGasRecircConstLoLimit17:
byte_8A4B:      fcb $44
TL_ExhGasRecircConstLoLimit17A:
byte_8A4C:      fcb $51
TL_ExhGasRecircConstLoLimit19:
byte_8A4D:      fcb $22
TL_ExhGasRecircConstHiLimit19A
byte_8A4E:      fcb $2E
TL_ExhGasRecircConstLoLimit16:
byte_8A4F:      fcb $71
TL_ExhGasRecircConstHiLimit16A:
byte_8A50:      fcb $B0
TL_ExhGasRecircConst8:
byte_8A51:      fcb $80
TL_ExhGasRecircConst7:
byte_8A52:      fcb $20
TL_ExhGasRecircConst6:
word_8A53:      fdb $016C
byte_8A55:      fcb $03
byte_8A56:      fcb $08
byte_8A57:      fcb $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

