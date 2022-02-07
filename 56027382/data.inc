
TL_IDENT1:
byte_8000:      db $01
TL_IDENT2:
                db $00
TL_PARTNO1:
byte_8002:      db $56
TL_PARTNO2:
                db $02
TL_PARTNO3:
                db $73
TL_PARTNO4:
byte_8005:      db $82
TL_PARTNO5:
byte_8006:      db $B1
TL_PARTNO1A:
byte_8007:      db $56
TL_PARTNO2A:
                db $02
TL_PARTNO3A:
                db $74
TL_PARTNO4A:
                db $04
TL_PARTNO5A:
byte_800B:      db $B1
TL_BITSUM:
                db $2A
TL_CODE1
byte_800D:      db $2E
TL_CODE2:
                db $18
TL_CODE3:
                db $12
TL_CODE4:
                db $88
                db $FF
byte_8012:      db $01
                db $82
TL_CCDConfigConstant2:
byte_8014:      db $FF
TL_CONF01:
byte_8015:      db $81
TL_ConfigurationFlags2:
byte_8016:      db $20
TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly:
byte_8017:      db $03
TL_ProgramLoopsWithThrottleBelow_MINTHR_ToDecrement_MINTHR:
byte_8018:      db $10
TL_NumberOfBitsAbove_MINTHR_ToDetermineOnThrottleTransition:
byte_8019:      db $02
TL_NumberOfBitsAbove_MINTHR_ToDetermineOffThrottleTransition:
byte_801A:      db $01
TL_ValueOf_MINTHR_WhenBatteryDisconnected:
byte_801B:      db $5C
TL_ThrottleSelfCalibrationRpmThreshold:
byte_801C:      db $26
TL_ThrottleSelfCalibrationMapDeltaThreshold:
byte_801D:      db $4C
TL_SwitchPointForDecelIdleAisControl:
byte_801E:      db $04
TL_DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle:
byte_801F:      db $90
byte_8020:      db $D0
TL_ScaleMAPVoltsToPresMultiplyConst:
byte_8021:      db $00
TL_ScaleMAPVoltsToPresAddConst:
byte_8022:      db $00, $00

byte_8024:      db $05
                db $1F, $00, $00, $42
                db $3E, $08, $00, $08
                db $5E, $09, $FF, $B6
                db $7D, $00, $00, $53
                db $9C, $0A

TL_ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin:
byte_8037:      db $90
TL_ThrottleLevelMinAbove_MINTHR_ToMatureMapLimpin:
byte_8038:      db $20

TL_RPMCellLookupTable:
                db $0F, $A0, $14, $50, $17, $70, $20, $D0, $23, $F0, $2E, $E0, $3E, $80, $4E, $20
                db $5D, $C0, $6D, $60, $7D, $00, $8C, $A0, $9C, $40

TL_RPM3DInputModifierFromRPM:
byte_8053:      db $03
                db $13, $00, $05, $25
                db $2F, $90, $01, $05
                db $9C, $FF

 REPEAT 31-( * - TL_RPM3DInputModifierFromRPM )
    fcb $FF
 ENDR

byte_8072:      db $03, $93
byte_8074:      db $87, $00
byte_8076:      db $00, $03
byte_8078:      db $93, $87
byte_807A:      db $53, $B5
byte_807C:      db $75, $30
byte_807E:      db $00
byte_807F:      db $14
byte_8080:      db $02
byte_8081:      db $04
byte_8082:      db $05

TL_Spark1A_RPMMAP:
byte_8083:      db $11
                db $09
                db $00
                db $1C, $1C, $1C, $1C, $1C, $1C, $0E, $08, $08
                db $1C, $1C, $1C, $1C, $1C, $1C, $0E, $0A, $0A
                db $1C, $1C, $1C, $1C, $20, $20, $14, $0C, $0A
                db $1C, $1C, $1E, $20, $25, $25, $16, $0D, $0B
                db $1C, $1C, $1F, $31, $2D, $27, $17, $0E, $10
                db $1C, $1C, $20, $3C, $2B, $29, $1A, $10, $12
                db $1C, $1C, $26, $3D, $32, $2C, $1E, $10, $10
                db $1C, $2C, $36, $36, $34, $2F, $20, $16, $13
                db $1C, $2C, $36, $3B, $38, $30, $21, $1B, $14
                db $1C, $2C, $36, $43, $39, $33, $22, $1B, $15
                db $1C, $2C, $36, $47, $45, $42, $2D, $24, $24
                db $1C, $2C, $3A, $55, $51, $49, $37, $23, $23
                db $1C, $2C, $3A, $56, $52, $4A, $3D, $23, $23
                db $1C, $2C, $3C, $58, $52, $4A, $3F, $31, $24
                db $1C, $2C, $40, $53, $55, $49, $46, $42, $3B
                db $1C, $2C, $3C, $4B, $47, $49, $48, $42, $3C
                db $1C, $2C, $3C, $58, $52, $4D, $48, $3F, $3A

TL_Spark1B_RPMMAP:
byte_811F:      db $11
                db $09
                db $00
                db $1C, $1C, $1C, $1C, $1C, $1C, $0E, $08, $08
                db $1C, $1C, $1C, $1C, $1C, $1C, $0E, $0A, $0A
                db $1C, $1C, $1C, $1C, $1C, $1C, $12, $0A, $0A
                db $1C, $1C, $1C, $1C, $1C, $1C, $16, $0C, $0A
                db $1C, $1C, $1C, $1C, $1C, $24, $18, $0C, $0A
                db $1C, $1C, $1C, $1C, $1C, $2C, $1C, $12, $10
                db $1C, $1C, $1C, $1C, $2A, $28, $18, $12, $10
                db $1C, $4C, $4A, $40, $36, $2C, $1C, $12, $10
                db $1C, $4C, $48, $4D, $36, $34, $24, $12, $10
                db $1C, $4C, $48, $4A, $48, $44, $2B, $12, $12
                db $1C, $4C, $48, $4E, $4D, $48, $33, $1F, $17
                db $1C, $4C, $48, $50, $4B, $44, $42, $32, $21
                db $1C, $4C, $54, $54, $56, $54, $42, $2A, $21
                db $1C, $4C, $5B, $58, $58, $54, $47, $28, $21
                db $1C, $4C, $4D, $50, $4D, $47, $32, $26, $23
                db $1C, $4C, $4D, $50, $4B, $3E, $2E, $28, $25
                db $1C, $4C, $4D, $50, $4B, $3E, $2E, $28, $25

byte_81BB:      db $03

TL_Spark2A_RPMMAP:
byte_81BC:      db $11
                db $09
                db $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00
                db $00, $00, $00, $00, $00, $00, $00, $00, $00

byte_8258:      db $FF, $FF, $FF, $FF, $FF, $FF, $FF
                db $98, $98, $98, $98, $98, $98, $98
byte_8266:      db $28, $26, $24, $20, $20, $20, $20, $20, $1A
byte_826F:      db $26, $24, $22, $20, $20, $1A, $14, $14, $14
byte_8278:      db $D0
byte_8279:      db $06
byte_827A:      db $14
byte_827B:      db $1C
byte_827C:      db $00, $00, $00, $00, $00, $00, $00, $00, $00
byte_8285:      db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

byte_828E:      db $01, $B3 , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF , $FF
                db $FF, $FF , $FF , $FF , $FF , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00 , $00
                db $00

byte_82AF:      db $53, $F0

byte_82B1:      db $75, $30

TL_ColdLoad3DTableOffIdle:
byte_82B3:      db $11
                db $09
                db $00
                db $3E, $3E, $3E, $3E, $3E, $3E, $42, $52, $6C
                db $50, $50, $4A, $4A, $4A, $50, $50, $60, $80
                db $50, $50, $4A, $50, $57, $58, $5C, $69, $8D
                db $4A, $60, $5B, $64, $6A, $68, $68, $6B, $86
                db $7A, $7A, $8E, $7D, $73, $70, $70, $6D, $80
                db $8A, $8A, $95, $7E, $7B, $74, $72, $76, $7A
                db $90, $9A, $9D, $8C, $7F, $7A, $77, $77, $7A
                db $A0, $9A, $9D, $88, $7D, $7A, $79, $7A, $79
                db $A0, $A0, $9D, $91, $80, $7B, $7A, $7C, $78
                db $A0, $B0, $9D, $86, $7A, $7D, $7A, $7C, $7E
                db $A0, $B0, $9D, $88, $7C, $7F, $7B, $7C, $A0
                db $A0, $CC, $98, $84, $7D, $7F, $8A, $8A, $E4
                db $A0, $E7, $99, $88, $7E, $7E, $E3, $E3, $E3
                db $A0, $D5, $A2, $91, $86, $87, $8E, $F9, $AC
                db $A0, $DC, $B2, $A2, $97, $99, $95, $95, $8F
                db $A0, $90, $D5, $C3, $B4, $A9, $A5, $C9, $9B
                db $A0, $90, $E1, $D1, $C6, $BE, $B7, $DA, $AA

TL_HotLoad3DTableOffIdle:
byte_834F:      db $11
                db $09
                db $00
                db $38, $38, $38, $38, $38, $38, $38, $38, $38
                db $38, $38, $38, $38, $38, $38, $3F, $3F, $3F
                db $40, $40, $40, $40, $40, $40, $43, $43, $43
                db $46, $46, $46, $46, $46, $46, $46, $46, $46
                db $44, $44, $44, $57, $43, $42, $47, $47, $47
                db $48, $48, $4B, $58, $45, $42, $4A, $4A, $4A
                db $5F, $5F, $5F, $58, $32, $36, $3E, $5C, $4E
                db $62, $64, $6D, $31, $32, $36, $43, $5C, $5C
                db $65, $68, $46, $3C, $3C, $3E, $45, $62, $62
                db $6B, $6B, $50, $3A, $35, $39, $45, $5E, $60
                db $6B, $6B, $49, $45, $42, $4A, $53, $6B, $6B
                db $50, $50, $4D, $43, $49, $50, $55, $6C, $6C
                db $48, $48, $46, $48, $4C, $54, $5A, $6E, $6E
                db $4A, $4A, $49, $49, $4E, $55, $59, $67, $67
                db $4C, $4C, $4C, $4B, $51, $57, $59, $59, $59
                db $4D, $4D, $4D, $55, $5D, $60, $70, $70, $70
                db $4A, $4A, $4A, $55, $5F, $5E, $5F, $5F, $5F

byte_83EB:      db $D0, $A4, $74, $13, $0C, $0A, $04, $04, $04
byte_83F4:      db $14, $14, $14, $14, $10, $0A, $03, $03, $03
byte_83FD:      db $CA, $88, $58, $2A, $23, $0F, $05, $00, $00
byte_8406:      db $50, $48, $34, $1E, $10, $05, $00, $00, $00
byte_840F:      db $00, $00, $00, $00, $40, $80, $80, $80, $80
byte_8418:      db $00, $00, $00, $00, $00, $00, $00, $00, $00
byte_8421:      db $40, $40, $30, $30, $28, $20, $1A, $08, $08

byte_842A:      db $08
                db $61, $FF, $FE, $70
                db $71, $E6, $FA, $C0
                db $81, $92, $FC, $88
                db $92, $57, $FD, $80
                db $A2, $2F, $FE, $E0
                db $C2, $0B, $FF, $D9
                db $E3, $06, $FF, $C9
                db $FF, $00

byte_8449:      db $F8, $C0, $6A, $2D, $28, $25, $14, $14, $14
byte_8452:      db $CC, $CC, $CC, $CC, $CC, $CC, $E6, $FF, $FF

word_845B:      dw $0BB8
byte_845D:      db $D0
byte_845E:      db $D0
byte_845F:      db $04
byte_8460:      db $10, $10, $10, $10, $12, $18, $1C, $1C, $1C
byte_8469:      db $10, $10, $10, $0B, $08, $08, $04, $04, $04
byte_8472:      db $20, $20, $20, $18, $18, $18, $18, $18, $18
byte_847B:      db $FA, $D0, $B0, $32, $32, $32, $32, $1C, $1C
byte_8484:      db $60, $50, $40, $40, $30, $30, $10, $10, $10
byte_848D:      db $20, $20, $20, $20, $20, $40, $40, $40, $40

byte_8496:      db $80, $80
byte_8498:      db $96
byte_8499:      db $60
byte_849A:      db $9F
byte_849B:      db $20, $20
byte_849D:      db $00, $01
byte_849F:      db $FF, $D6
byte_84A1:      db $02, $19
byte_84A3:      db $99
byte_84A4:      db $99
byte_84A5:      db $40, $40
byte_84A7:      db $F0
byte_84A8:      db $28, $28, $24, $20, $18, $18, $18, $18, $18
byte_84B1:      db $10
byte_84B2:      db $02, $4F

byte_84B4:      db $04
                db $13, $00, $0A, $AB
                db $1F, $80, $02, $11
                db $3E, $C0, $01, $57
                db $6D, $FF

 REPEAT 31-( * - byte_84B4 )
    fcb $FF
 ENDR

TL_O2LoLimitForInMiddleDetermination:
byte_84D3:      db $05
                db $09
                db $00
                db $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                db $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                db $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                db $18, $18, $18, $18, $18, $18, $18, $18, $18
                db $18, $18, $18, $18, $18, $18, $18, $18, $18

 REPEAT 156-( * - TL_O2LoLimitForInMiddleDetermination )
    fcb $FF
 ENDR

TL_O2HiLimitForInMiddleDetermination:
byte_856F:      db $05
                db $09
                db $00
                db $22, $22, $22, $22, $22, $22, $22, $22, $22
                db $22, $22, $22, $22, $22, $22, $22, $22, $22
                db $22, $22, $22, $22, $22, $22, $22, $22, $22
                db $20, $20, $20, $20, $20, $20, $20, $20, $20
                db $20, $20, $20, $20, $20, $20, $20, $20, $20

 REPEAT 156-( * - TL_O2HiLimitForInMiddleDetermination )
    fcb $FF
 ENDR

byte_860B:      db $0B
byte_860C:      db $10
byte_860D:      db $20
byte_860E:      db $20
byte_860F:      db $04
byte_8610:      db $02
byte_8611:      db $60
byte_8612:      db $01
byte_8613:      db $FE
byte_8614:      db $29
byte_8615:      db $40
byte_8616:      db $0B
byte_8617:      db $05
byte_8618:      db $8C
byte_8619:      db $C0
byte_861A:      db $0B
byte_861B:      db $15, $20
byte_861D:      db $26
byte_861E:      db $10
byte_861F:      db $A0
byte_8620:      db $C0, $C0
byte_8622:      db $D6
byte_8623:      db $08
byte_8624:      db $0B
byte_8625:      db $1D
byte_8626:      db $FF
byte_8627:      db $01
byte_8628:      db $38
byte_8629:      db $10, $07, $A0, $00, $C0
byte_862E:      db $08, $03, $90, $00, $E0
byte_8633:      db $A8
byte_8634:      db $68
byte_8635:      db $10
byte_8636:      db $04
byte_8637:      db $01
byte_8638:      db $17
byte_8639:      db $85
byte_863A:      db $32
byte_863B:      db $24
byte_863C:      db $56
byte_863D:      db $F1
byte_863E:      db $17
byte_863F:      db $00, $01
byte_8641:      db $6E
byte_8642:      db $A0
byte_8643:      db $03, $84
byte_8645:      db $02
byte_8646:      db $C0
byte_8647:      db $F0
byte_8648:      db $03
byte_8649:      db $01
byte_864A:      db $08
byte_864B:      db $0A
byte_864C:      db $9A
byte_864D:      db $00, $00
byte_864F:      db $03, $0A
byte_8651:      db $00
byte_8652:      db $02
byte_8653:      db $02, $F0
byte_8655:      db $9C, $40
byte_8657:      db $01, $90
byte_8659:      db $E0
byte_865A:      db $08
byte_865B:      db $B2, $20
byte_865D:      db $01, $90
byte_865F:      db $80
byte_8660:      db $01
byte_8661:      db $00, $B6
byte_8663:      db $0F
byte_8664:      db $1C
byte_8665:      db $1C

TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm:
byte_8666:      db $02
                db $05, $00, $01, $6E
                db $0C, $0A

 REPEAT 11-( * - TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm )
    fcb $FF
 ENDR
                
TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm:
byte_8671:      db $02
                db $05, $00, $FF, $9A
                db $0F, $FC

 REPEAT 11-( * - TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm )
    fcb $FF
 ENDR

TL_MinVoltageForAis
byte_867C:      db $71

TL_BrakeOverrideForAis_FromDeltaThrottle:
byte_867D:      db $03
                db $D0, $D0, $00, $00
                db $D0, $D0, $00, $00
                db $D0, $D0

TL_AisStartupPosition_FromTemp:
byte_8688:      db $05
                db $58, $E0, $FE, $66
                db $80, $A0, $FD, $CD
                db $A8, $48, $FF, $9A
                db $D0, $38, $00, $CD
                db $F8, $58

byte_869B:      db $03
                db $9A, $28, $FF, $7A
                db $C8, $10, $FF, $9A
                db $F0, $00

TL_ACPositionWhenTempToCold:
byte_86A6:      db $14
TL_Use_ACCTBL_WhenTempAboveThisElseUse_ACPOS:
byte_86A7:      db $A0
byte_86A8:      db $20
TL_AcClutchAisAdjustmentConstant:
byte_86A9:      db $D0
byte_86AA:      db $E8

TL_ACOffIdleDelta_FromSpeed:
byte_86AB:      db $04
                db $14, $14, $FF, $C0
                db $3C, $0A, $FF, $F3
                db $64, $08, $FF, $EF
                db $82, $06

TL_AISAddedFromTimeEngRunning:
byte_86BA:      db $00

TL_AisColdPosition_FromTemp:
byte_86BB:      db $04
                db $68, $50, $FF, $55
                db $80, $40, $FF, $33
                db $A8, $20, $FF, $33
                db $D0, $00

byte_86CA:      db $03
                db $00, $00, $00, $00
                db $10, $00, $00, $00
                db $21, $00

TL_AisPosition_FromThrottle:
byte_86D5:      db $04
                db $00, $00, $00, $00
                db $02, $00, $00, $00
                db $05, $00, $00, $00
                db $1E, $00

TL_AisPosition_FromRpm:
byte_86E4:      db $04
                db $1C, $05, $00, $72
                db $2E, $0D, $00, $00
                db $3F, $0D, $00, $00
                db $FF, $0D

byte_86F3:      db $03
                db $9A, $50, $FF, $DF
                db $C8, $4A, $FF, $C0
                db $F0, $40

TL_IdleSpeedParkNeutral_FromTemp:
byte_86FE:      db $05
                db $58, $96, $FF, $86
                db $A8, $70, $FF, $86
                db $D0, $5D, $00, $00
                db $E5, $5D, $04, $1C
                db $EE, $82

TL_IdleSpeedDrive_FromTemp:
byte_8711:      db $05
                db $58, $96, $FF, $86
                db $A8, $70, $FF, $86
                db $D0, $5D, $00, $00
                db $E5, $5D, $04, $1C
                db $EE, $82

TL_DecelAisBaseAirflowCurveOffset_FromTime2:
byte_8724:      db $03
                db $00, $00, $00, $00
                db $00, $00, $00, $00
                db $00, $00

byte_872F:      db $6A

TL_TargetIdleSpeed_HBDefault:
byte_8730:      db $64

TL_ForwardAisSteps_NoSlope:
byte_8731:      db $05
                db $32, $01, $00, $00
                db $4B, $02, $00, $00
                db $5A, $03, $00, $00
                db $78, $05, $00, $00
                db $96, $08

TL_ReverseAisSteps_NoSlope:
byte_8744:      db $05
                db $40, $FF, $00, $00
                db $A0, $FE, $00, $00
                db $C8, $FB, $00, $00
                db $E6, $FA, $00, $00
                db $FF, $F8

byte_8757:      db $11
byte_8758:      db $11
byte_8759:      db $EE
byte_875A:      db $1A, $1A, $1A, $1A, $1A, $1A, $16, $08, $08
byte_8763:      db $1F
byte_8764:      db $1A, $1A, $1A, $1A, $1A, $1A, $16, $08, $08
TL_AisPeriodForRpmFeedback11ms:
byte_876D:      db $38
TL_AisHighLimitMaxOpenSteps:
byte_876E:      db $DB
TL_AisDelayAfterThrottleClosesWhenMoving:
byte_876F:      db $40, $50
TL_UpdateRateOffIdleWhenAisClosing:
byte_8771:      db $7F
TL_PositionAisMotorIsAtIdle:
byte_8772:      db $10

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK:
byte_8773:      db $03
                db $58, $F0, $00, $00
                db $A8, $F0, $00, $00
                db $F8, $F0

TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK2:
byte_877E:      db $03
                db $58, $10, $00, $00
                db $A8, $10, $00, $00
                db $F8, $10

TL_AISDecel_FromBaro:
byte_8789:      db $04
                db $9A, $98, $FF, $CA
                db $AD, $94, $00, $00
                db $C8, $94, $FF, $80
                db $F0, $80

 REPEAT 19-( * - TL_AISDecel_FromBaro )
    fcb $FF
 ENDR

TL_DecelAisBaseAirflowCurveOffset_FromTime:
byte_879C:      db $02
                db $0B, $00, $00, $00
                db $1B, $00

 REPEAT 11-( * - TL_DecelAisBaseAirflowCurveOffset_FromTime )
    fcb $FF
 ENDR

TL_AISDecel_FromTemp:
byte_87A7:      db $04
                db $58, $30, $FF, $B3
                db $80, $24, $FF, $80
                db $A8, $10, $FF, $9A
                db $D0, $00

 REPEAT 19-( * - TL_AISDecel_FromTemp )
    fcb $FF
 ENDR

TL_AdditionToControlMap:
byte_87BA:      db $04
                db $1F, $00, $00, $00
                db $46, $00, $00, $00
                db $6D, $00, $00, $00
                db $BC, $00

TL_OffsetCorrectionTo_MAPFLR_FromBaro:
byte_87C9:      db $03
                db $00, $00, $00, $00
                db $8F, $00, $00, $00
                db $FF, $00

TL_TempTermForMapOffset_FromTemp:
byte_87D4:      db $02
                db $90, $FF, $00, $00
                db $C7, $FF

 REPEAT 11-( * - TL_TempTermForMapOffset_FromTemp )
    fcb $FF
 ENDR

TL_DecelAisOpenStepsFromNeg_FromDeltaMap:
byte_87DF:      db $04
                db $08, $00, $00, $80
                db $0C, $02, $00, $40
                db $10, $03, $00, $40
                db $18, $05

TL_DecelAisOpenStepsFromPos_FromDeltaMap
byte_87EE:      db $04
                db $08, $00, $FF, $C0
                db $0C, $FF, $FF, $C0
                db $10, $FE, $FF, $E0
                db $18, $FD

TL_TimeBetweenAisPulsesForDecelAis:
byte_87FD:      db $3F
TL_EngineTempToStartCalibratingDacal:
byte_87FE:      db $D4
TL_DeltaRpmFromIdleSpeedForDacalUpdate:
byte_87FF:      db $02
TL_ACFactorDeltaFromBase:
byte_8800:      db $12
byte_8801:      db $1F
TL_Base_nominalCal:
byte_8802:      db $0B
byte_8803:      db $7F
word_8804:      dw $0FAD
byte_8806:      db $70
byte_8807:      db $8C
byte_8808:      db $70
byte_8809:      db $FF
word_880A:      dw $7D00
word_880C:      dw $7D00
byte_880E:      db $04
byte_880F:      db $B6
byte_8810:      db $07
byte_8811:      db $10
byte_8812:      db $FE
byte_8813:      db $FE
byte_8814:      db $10
byte_8815:      db $0A
byte_8816:      db $04
byte_8817:      db $70
byte_8818:      db $03
byte_8819:      db $58
byte_881A:      db $FF
byte_881B:      db $5A
byte_881C:      db $46
word_881D:      dw $E8E3
                dw $E8E3
word_8821:      dw $0000
word_8823:      dw $0000
byte_8825:      db $00
byte_8826:      db $00
byte_8827:      db $92
byte_8828:      db $00
byte_8829:      db $20
byte_882A:      db $32
byte_882B:      db $00
byte_882C:      db $06
byte_882D:      db $40

byte_882E:      db $06
                db $1C, $24, $00, $E7
                db $3B, $40, $05, $C0
                db $3F, $57, $06, $AB
                db $42, $6B, $00, $00
                db $54, $6B, $00, $00
                db $54, $A8

byte_8845:      db $04
                db $1F, $0F, $00, $F7
                db $74, $61, $00, $00
                db $8A, $61, $00, $00
                db $8A, $A8

 REPEAT 23-( * - byte_8845 )
    fcb $FF
 ENDR

byte_885C:      db $04
                db $1F, $0F, $00, $F7
                db $74, $61, $00, $00
                db $8A, $61, $00, $00
                db $8A, $A8

 REPEAT 23-( * - byte_885C )
    fcb $FF
 ENDR

TL_PTUMinLockTemperature:
byte_8873:      db $B8
TL_PTUCounterTimerIntervalForLoop:
byte_8874:      db $07
TL_PTUMinLockSpeed:
byte_8875:      db $7C
TL_PTUMAPThresholdForLock3:
byte_8876:      db $14
TL_PTUDeltaTPSForUnlock:
byte_8877:      db $66
TL_PTUMAPThresholdForLock1:
word_8878:      dw $8118
TL_PTUCounterHiSpeed:
byte_887A:      db $20
TL_PTUCounterLoSpeed:
byte_887B:      db $11
byte_887C:      db $00

TL_UpperLimitForPTULock:
byte_887D:      db $04
                db $64, $0F, $00, $00
                db $64, $2E, $00, $AB
                db $82, $42, $00, $00
                db $82, $A8

TL_LowerLimitForPTULock:
                db $02
                db $64, $0F, $00, $00
                db $96, $0F

 REPEAT 15-( * - TL_LowerLimitForPTULock )
    fcb $FF
 ENDR

TL_UpperLimitForPTUUnlock:
byte_889B:      db $04
                db $5E, $05, $00, $00
                db $5E, $33, $00, $AB
                db $7C, $47, $00, $00
                db $7C, $A8

                db $05
                db $5E
                db $05
                db $00
                db $00
                db $96
                db $05
                db $02
                db $62
                db $FF
                db $FF
                db $00
                db $00
                db $FF
                db $FF

byte_88B9:      db $50
byte_88BA:      db $2D
byte_88BB:      db $24
byte_88BC:      db $02
byte_88BD:      db $08
byte_88BE:      db $05
byte_88BF:      db $10
byte_88C0:      db $0F
byte_88C1:      db $50
byte_88C2:      db $08
byte_88C3:      db $FF, $FF, $FF, $41, $41, $3F, $3C, $40, $40
byte_88CC:      db $08
byte_88CD:      db $0D
byte_88CE:      db $80
TL_CruiseControlLimitToAMaxVent:
byte_88CF:      db $FE
TL_CruiseControlLimitToHalfMaxVent:
byte_88D0:      db $F0
TL_UnknownConstForCruiseControl46:
byte_88D1:      db $00
TL_UnknownConstForCruiseControl47:
byte_88D2:      db $40
TL_CruiseControlDeltaSpeedToResetAccFlag:
byte_88D3:      db $30
TL_CruiseControlDontVentIfThrottleBelowThis:
byte_88D4:      db $00
TL_CruiseControlDontVacIfThrottleAboveThis:
byte_88D5:      db $94
TL_CruiseControlMaxSetSpeedTimesTwo:
byte_88D6:      db $AA
TL_CruiseControlMinSetSpeedTimesTwo:
byte_88D7:      db $46
TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableHi:
byte_88D8:      db $4F
TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableLo:
byte_88D9:      db $00
TL_UnknownConstForCruiseControl21:
byte_88DA:      db $3C
TL_UnknownConstForCruiseControl22:
byte_88DB:      db $7D
TL_UnknownConstForCruiseControl23:
byte_88DC:      db $08

                db $04, $2D

TL_UnknownConstForCruiseControl24:
byte_88DF:      db $20

TL_UnknownConstForCruiseControl25:
byte_88E0:      db $20

TL_UnknownConstForCruiseControl26:
byte_88E1:      db $02

TL_UnknownConstForCruiseControl27:
byte_88E2:      db $01

TL_UnknownConstForCruiseControl28:
byte_88E3:      db $01

TL_UnknownConstForCruiseControl29:
byte_88E4:      db $05

TL_UnknownConstForCruiseControl30:
byte_88E5:      db $05

TL_UnknownConstForCruiseControl31:
byte_88E6:      db $80

TL_UnknownConstForCruiseControl32:
byte_88E7:      db $06

TL_UnknownConstForCruiseControl33:
byte_88E8:      db $04

TL_UnknownConstForCruiseControl34:
byte_88E9:      db $18

TL_UnknownConstForCruiseControl35:
byte_88EA:      db $06

TL_UnknownConstForCruiseControl36:
byte_88EB:      db $5A

TL_CruiseControlSetDeltaControlPointForCableAdaptive:
byte_88EC:      db $04

TL_CruiseCompareConstant2:
byte_88ED:      db $20

TL_CruiseMask2:
byte_88EE:      db $10

TL_CruiseMask3:
byte_88EF:      db $FC

TL_CruiseMask7:
byte_88F0:      db $04

TL_CruiseMask4:
byte_88F1:      db $08

TL_CruiseMask6:
byte_88F2:      db $42

TL_CruiseMask5:
byte_88F3:      db $CE

TL_CruiseCompareConstant1:
byte_88F4:      db $0B

TL_CruiseMask:
byte_88F5:      db $08

TL_CruiseControlVentRegularGainCurve_FromDeltaSpeed:
byte_88F6:      db $04
                db $00, $00, $FF, $FB
                db $30, $FF, $FF, $F6
                db $80, $FC, $FF, $EC
                db $FF, $F2

TL_CruiseControlVacRegularGainCurve_FromDeltaSpeed:
byte_8905:      db $05
                db $00, $00, $00, $30
                db $10, $03, $00, $1B
                db $40, $08, $00, $20
                db $80, $10, $00, $0C
                db $FF, $16

 REPEAT 23-( * - TL_CruiseControlVacRegularGainCurve_FromDeltaSpeed )
    fcb $FF
 ENDR

TL_CruiseControlVacAcceleratedGainCurve_FromDeltaSpeed:
byte_891C:      db $04
                db $00, $00, $01, $00
                db $10, $10, $00, $C0
                db $30, $28, $00, $20
                db $70, $30

TL_CruiseControlSetupPulseForSet_FromSpeed:
byte_892B:      db $04
                db $00, $00, $00, $B3
                db $3C, $2A, $00, $1A
                db $5A, $2D, $00, $26
                db $6E, $30

TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference:
byte_893A:      db $05
                db $00, $C0, $FF, $55
                db $30, $A0, $FF, $9A
                db $80, $80, $FF, $55
                db $B0, $60, $FF, $00
                db $D0, $40

 REPEAT 23-( * - TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference )
    fcb $FF
 ENDR

TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2:
byte_8951:      db $04
                db $80, $80, $01, $00
                db $84, $84, $00, $20
                db $94, $86, $00, $14
                db $C6, $8A

 REPEAT 31-( * - TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2 )
    fcb $FF
 ENDR

TL_CruiseControlSpeedGainFactor_FromSpeed:
byte_8970:      db $04
                db $46, $04, $FF, $F3
                db $5A, $03, $FF, $F3
                db $6E, $02, $FF, $E6
                db $82, $00

TL_CruiseControlThrottleGainFactor_FromThrottle:
byte_897F:      db $04
                db $00, $06, $00, $E0
                db $10, $14, $00, $90
                db $20, $1D, $00, $30
                db $30, $20

TL_UnknownTableForCruiseControl6:
byte_898E:      db $03
                db $02, $18, $10, $00
                db $04, $38, $08, $00
                db $06, $48

TL_UnknownTableForCruiseControl1:
byte_8999:      db $02
                db $20, $E8, $FE, $80
                db $30, $D0

 REPEAT 15-( * - TL_UnknownTableForCruiseControl1 )
    fcb $FF
 ENDR

TL_UnknownTableForCruiseControl2:
byte_89A8:      db $02
                db $A0, $03, $00, $18
                db $C0, $06

 REPEAT 11-( * - TL_UnknownTableForCruiseControl2 )
    fcb $FF
 ENDR

TL_UnknownTableForCruiseControl3:
byte_89B3:      db $02
                db $A8, $80, $FE, $ED
                db $D0, $55

 REPEAT 11-( * - TL_UnknownTableForCruiseControl3 )
    fcb $FF
 ENDR

TL_UnknownTableForCruiseControl4:
byte_89BE:      db $02
                db $A0, $03, $00, $18
                db $C0, $06

 REPEAT 11-( * - TL_UnknownTableForCruiseControl4 )
    fcb $FF
 ENDR

TL_UnknownTableForCruiseControl5:
byte_89C9:      db $02
                db $A8, $80, $FE, $ED
                db $D0, $55

 REPEAT 11-( * - TL_UnknownTableForCruiseControl5 )
    fcb $FF
 ENDR

TL_ErrorBitsMask1:
                db $00
                db $00
                db $00
                db $00
                db $00
                db $00
byte_89DA:      db $04
byte_89DB:      db $11
TL_PowerLossLightMask:
byte_89DC:      db $EB
TL_PowerLossLightMask2:
byte_89DD:      db $93
TL_PowerLossLightMask3:
byte_89DE:      db $3E
TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup:
byte_89DF:      db $63
TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup:
byte_89E0:      db $E4
TL_TstatDiagnosticsTemperatureGoalWithin_HOTIME:
byte_89E1:      db $CF
TL_TstatVehicleSpeedCompare:
byte_89E2:      db $32
TL_TstatDiagnosticsTimeToAchieveTemperatureGoal:
byte_89E3:      db $AA
byte_89E4:      db $04
byte_89E5:      db $BD
byte_89E6:      db $79
TL_CoolantTempOutOfRangeLow:
byte_89E7:      db $1A
TL_CoolantTempOutOfRangeHigh:
byte_89E8:      db $FD
TL_DefaultCoolantTempRaw:
byte_89E9:      db $B1
TL_ChargeTempOutOfRangeLow:
byte_89EA:      db $1A
TL_ChargeTempOutOfRangeHigh:
byte_89EB:      db $FD
TL_DefaultChargeTemp_Limpin:
byte_89EC:      db $A8
TL_BatteryVoltsDiagLimitOverTarget:
byte_89ED:      db $10
TL_LowBatteryVoltageAtThisRpm:
byte_89EE:      db $2E
                db $E0
TL_BatteryVoltsDiagCounterMax:
byte_89F0:      db $8E
TL_BatteryVoltsDiagCounterMax2:
byte_89F1:      db $7F
TL_BatteryVoltsHysteresisForAlternatorControl:
byte_89F2:      db $04
TL_BatteryVoltsDiagCounterMin:
byte_89F3:      db $06
byte_89F4:      db $2E
TL_HighLimitForImmediateSwitchToClosedLoop:
byte_89F5:      db $22
TL_LowLimitForImmediateSwitchToClosedLoop:
byte_89F6:      db $14
byte_89F7:      db $0A
TL_RPMLimitforErrorCodeSetting:
byte_89F8:      db $38
TL_MAPLimitforErrorCodeSetting:
byte_89F9:      db $70
TL_CoolantTempLimitforErrorCodeSetting:
byte_89FA:      db $B0
TL_ThrottleLowerLimit:
byte_89FB:      db $08
TL_ThrottleUpperLimit:
byte_89FC:      db $F0
TL_MapSwitchPointForFullThrottleOrIdle:
byte_89FD:      db $D1
byte_89FE:      db $20
byte_89FF:      db $28
byte_8A00:      db $2F
byte_8A01:      db $28
byte_8A02:      db $DC
byte_8A03:      db $8C
byte_8A04:      db $64
byte_8A05:      db $CE
byte_8A06:      db $AB
TL_MapSensorLowerLimit:
byte_8A07:      db $02
TL_MapSensorUpperLimit:
byte_8A08:      db $FD
TL_MapSensorMiddleLimit:
byte_8A09:      db $66
TL_DeltaMapThatChecksGood:
byte_8A0A:      db $01
TL_MatureMapLimpinWhenDeltaAbove_MPDELT_plus_MPDELA:
byte_8A0B:      db $02
TL_DeltaMapThatChecksGoodX:
byte_8A0C:      db $05
TL_NotSure2:
byte_8A0D:      db $F0, $80, $50, $40, $30, $30, $20, $20, $20, $10, $10, $10, $10, $00, $00, $00
TL_DisableMapCheckUnderThisRpm_600:
byte_8A1D:      db $12, $C0
TL_DisableMapCheckAboveThisRpm_1500:
byte_8A1F:      db $2E, $E0
TL_DisableMapCheckBelowThisMap:
byte_8A21:      db $12
TL_DisableMapCheckAboveThisMap
byte_8A22:      db $F7
TL_CheckMapAtZeroSpeedAndThisDeltaRpm:
byte_8A23:      db $02, $00
TL_CheckMapAtZeroSpeedAndThisBaroSwitch:
byte_8A25:      db $CE
TL_AllowMapToTestGoodThisNearBaro:
byte_8A26:      db $21
TL_AllowMapToTestGoodThisNearBaro2:
                db $10

TL_LimpinTableForMapFromThrottle:
byte_8A28:      db $05
                db $00, $00, $07, $92
                db $07, $35, $04, $64
                db $19, $84, $01, $66
                db $28, $99, $00, $95
                db $34, $A0

TL_OffsetForCalcMapInMapLimpin:
byte_8A3B:      db $2E
TL_OffsetAddedToCalcThrottle:
byte_8A3C:      db $0B
TL_AIS_Constant_0x20:
byte_8A3D:      db $20
TL_ExhGasRecircConst5:
byte_8A3E:      db $03
TL_ExhGasRecircConstFromCoolantTemp:
byte_8A3F:      db $D2
TL_ExhGasRecircConstFromTimeEngRunning9:
byte_8A40:      db $05
TL_ExhGasRecircConstFromMAPBelowBaro
byte_8A41:      db $20
TL_ExhGasRecircConstFromTPSVoltsLoLimit14a
byte_8A42:      db $40
TL_ExhGasRecircConstFromTPSVoltsLoLimit14:
byte_8A43:      db $10
TL_ExhGasRecircConstLoLimit18a:
byte_8A44:      db $D0
TL_ExhGasRecircConstLoLimit18:
byte_8A45:      db $70
TL_ExhGasRecircConstFromRPMLoLimit15a:
byte_8A46:      db $60
TL_ExhGasRecircConstFromRPMLoLimit15:
byte_8A47:      db $30
TL_ExhGasRecircConst3:
byte_8A48:      db $C0
TL_ExhGasRecircConst1:
word_8A49:      dw $01B0
TL_ExhGasRecircConstLoLimit17:
byte_8A4B:      db $44
TL_ExhGasRecircConstLoLimit17A:
byte_8A4C:      db $51
TL_ExhGasRecircConstLoLimit19:
byte_8A4D:      db $22
TL_ExhGasRecircConstHiLimit19A
byte_8A4E:      db $2E
TL_ExhGasRecircConstLoLimit16:
byte_8A4F:      db $71
TL_ExhGasRecircConstHiLimit16A:
byte_8A50:      db $B0
TL_ExhGasRecircConst8:
byte_8A51:      db $80
TL_ExhGasRecircConst7:
byte_8A52:      db $20
TL_ExhGasRecircConst6:
word_8A53:      dw $016C
byte_8A55:      db $03
byte_8A56:      db $08
byte_8A57:      db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

