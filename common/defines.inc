ATX                     equ %00000000
MTX                     equ %00000001
HC11Ram                                            equ $0000
Ram_00                                             equ HC11Ram+$00
Ram_01                                             equ HC11Ram+$01
Ram_02                                             equ HC11Ram+$02
MinimumTimerCountBeforeMainloopCanContinue         equ HC11Ram+$03
Ram_04                                             equ HC11Ram+$04
Ram_05                                             equ HC11Ram+$05
LowestSessionTpsVolts                              equ HC11Ram+$06
BitFlags36_t3                                      equ HC11Ram+$07
b7_7_bt7                equ %10000000
b6_7_UseAIS             equ %01000000
b5_7_bt5                equ %00100000
b4_7_bt4                equ %00010000
b3_7_bt3                equ %00001000
b2_7_bt2                equ %00000100
b1_7_bt1                equ %00000010
b0_7_bt0                equ %00000001
CurrentAisPosition                                 equ HC11Ram+$08
Timer_DacalCountdown                               equ HC11Ram+$09
ValueFromAdaptiveMemory                            equ HC11Ram+$0A
Ram_0B                                             equ HC11Ram+$0B
Ram_0C                                             equ HC11Ram+$0C
BaroPressure                                       equ HC11Ram+$0D
Counter_SpeedSensorInterrupt_HB                    equ HC11Ram+$0E
Counter_SpeedSensorInterrupt_LB                    equ HC11Ram+$0F
BitFlags_36_t3                                     equ HC11Ram+$10
b7_10_bt7               equ %10000000
b6_10_UseAis            equ %01000000
b5_10_a10b8             equ %00100000
b4_10_AsdOn             equ %00010000
b3_10_bt3               equ %00001000
b2_10_bt2               equ %00000100
b1_10_AIS1              equ %00000010
b0_10_AIS0              equ %00000001
Ram_11                                             equ HC11Ram+$11
L002F_t3                                           equ HC11Ram+$12
Ram_13                                             equ HC11Ram+$13
CruiseControlVarT1                                 equ HC11Ram+$14
ErrorBitRegister0                                  equ HC11Ram+$15
ErrorBitRegister1                                  equ HC11Ram+$16
ErrorBitRegister2                                  equ HC11Ram+$17
ErrorBitRegister3                                  equ HC11Ram+$18
ErrorBitRegisterStored0                            equ HC11Ram+$19
ErrorBitRegisterStored1                            equ HC11Ram+$1A
ErrorBitRegisterStored2                            equ HC11Ram+$1B
ErrorBitRegisterStored3                            equ HC11Ram+$1C
ErrorCodeUpdateKeyOnCount                          equ HC11Ram+$1D
ErrorCodeUpdateKeyOnCount2                         equ HC11Ram+$1E
ErrorCodeUpdateKeyOnCount3                         equ HC11Ram+$1F
IPL1                                               equ HC11Ram+$20
b7_20_bt7                       equ %10000000
b6_20_FuelEngineNotRunning      equ %01000000
b5_20_bt5                       equ %00100000
b4_20_bt4                       equ %00010000
b3_20_bt3                       equ %00001000
b2_20_bt2                       equ %00000100
b1_20_bt1                       equ %00000010
b0_20_SearchBladeEndRef_INSYNC  equ %00000001
BitFlags21                                         equ HC11Ram+$21
b7_21_DistSync          equ %10000000
b6_21_a70b0             equ %01000000
b5_21_a70b2             equ %00100000
b4_21_a70b3             equ %00010000
b3_21_bt3               equ %00001000
b2_21_bt2               equ %00000100
b1_21_bt1               equ %00000010
b0_21_bt0               equ %00000001
BitFlags66_t3                                      equ HC11Ram+$22
b7_22_Offidle           equ %10000000
b6_22_bt6               equ %01000000
b5_22_AtIdle            equ %00100000
b4_22_bt4               equ %00010000
b3_22_a69b2             equ %00001000
b2_22_FallToIdle        equ %00000100
b1_22_bt1               equ %00000010
b0_22_bt0               equ %00000001
BitFlags23                                         equ HC11Ram+$23
b7_23_bt7               equ %10000000
b6_23_bt6               equ %01000000
b5_23_bt5               equ %00100000
b4_23_bt4               equ %00010000
b3_23_bt3               equ %00001000
b2_23_Past12SecRunning  equ %00000100
b1_23_a6bb7             equ %00000010
b0_23_a6bb6             equ %00000001
BitFlags24                                         equ HC11Ram+$24
b7_24_a6f               equ %10000000
b6_24_bt6               equ %01000000
b5_24_bt5               equ %00100000
b4_24_BadSpeedo1        equ %00010000
b3_24_BadSpeedo2        equ %00001000
b2_24_BadASD            equ %00000100
b1_24_AlternatorField   equ %00000010
b0_24_AltBit1           equ %00000001
BitFlags68_t3                                      equ HC11Ram+$25
b7_25_ATXChgGear        equ %10000000
b6_25_AcClutch          equ %01000000
b5_25_bt5               equ %00100000
b4_25_ATXInGear         equ %00010000
b3_25_bt3               equ %00001000
b2_25_AIS               equ %00000100
b1_25_bt1               equ %00000010
b0_25_bt0               equ %00000001
BitFlags6a_t3                                      equ HC11Ram+$26
b7_26_bt7               equ %10000000
b6_26_drbToggle1        equ %01000000
b5_26_drbToggle2        equ %00100000
b4_26_bt4               equ %00010000
b3_26_bt3               equ %00001000
b2_26_bt2               equ %00000100
b1_26_bt1               equ %00000010
b0_26_bt0               equ %00000001
BitFlags27                                         equ HC11Ram+$27
b7_27_FuelEngNotRunning equ %10000000
b6_27_bt6               equ %01000000
b5_27_bt5               equ %00100000
b4_27_bt4               equ %00010000
b3_27_bt3               equ %00001000
b2_27_bt2               equ %00000100
b1_27_ATXInGear         equ %00000010
b0_27_cfg_ATX           equ %00000001
BitFlags6d_t3                                      equ HC11Ram+$28
b7_28_bt7               equ %10000000
b6_28_bt6               equ %01000000
b5_28_bt5               equ %00100000
b4_28_bt4               equ %00010000
b3_28_bt3               equ %00001000
b2_28_NeedSetup         equ %00000100
b1_28_bt1               equ %00000010
b0_28_InMotion          equ %00000001
BitFlags29                                         equ HC11Ram+$29
BitFlags2a                                         equ HC11Ram+$2A
b7_2A_bt7               equ %10000000
b6_2A_bt6               equ %01000000
b5_2A_PTU_A             equ %00100000
b4_2A_PTU_B             equ %00010000
b3_2A_SpeedUnder40      equ %00001000
b2_2A_bt2               equ %00000100
b1_2A_bt1               equ %00000010
b0_2A_bt0               equ %00000001
BitFlags2b                                         equ HC11Ram+$2B
BitFlags2c                                         equ HC11Ram+$2C
BitFlags2d                                         equ HC11Ram+$2D
b7_2D_bt7               equ %10000000
b6_2D_bt6               equ %01000000
b5_2D_bt5               equ %00100000
b4_2D_a71b5             equ %00010000
b3_2D_EMR_1             equ %00001000
b2_2D_a6cb1             equ %00000100
b1_2D_a6cb3             equ %00000010
b0_2D_a6cb2             equ %00000001
BitFlags2e                                         equ HC11Ram+$2E
b7_2E_MapMaybe          equ %10000000
b6_2E_bt6               equ %01000000
b5_2E_bt5               equ %00100000
b4_2E_bt4               equ %00010000
b3_2E_bt3               equ %00001000
b2_2E_EGRFault          equ %00000100
b1_2E_bt1               equ %00000010
b0_2E_a70b1             equ %00000001
BitFlags2f                                         equ HC11Ram+$2F
Ram_30                                             equ HC11Ram+$30
CruiseStatus_1                                     equ HC11Ram+$31
CruiseStatus_2                                     equ HC11Ram+$32
Counter_Cruise_1                                   equ HC11Ram+$33
Counter_TimerPastHalfwayBetweenCamPulses           equ HC11Ram+$34
TimerOverflowsBetweenCamPulses                     equ HC11Ram+$35
DistributorFallingEdgePulsewidth_HB                equ HC11Ram+$36
DistributorFallingEdgePulsewidth_LB                equ HC11Ram+$37
LastCamFallingEdgeTime                             equ HC11Ram+$38
Ram_39                                             equ HC11Ram+$39
BitFlags_BF_t3                                     equ HC11Ram+$3A
CylinderPointer                                    equ HC11Ram+$3B
Counter_TimerRegHalfOverflowBetweenSpeedoPulses    equ HC11Ram+$3C
TimerOverflowsBetweenSpeedoPulses                  equ HC11Ram+$3D
SpeedoSensorPulsewidth_HB                          equ HC11Ram+$3E
SpeedoSensorPulsewidth_LB                          equ HC11Ram+$3F
PreviousVehicleSpeed_HB                            equ HC11Ram+$40
PreviousVehicleSpeed_LB                            equ HC11Ram+$41
CounterUp_42                                       equ HC11Ram+$42
CounterUp_43                                       equ HC11Ram+$43
KeyOnOrEngineRunningTime                           equ HC11Ram+$44
Counter_MainLoop                                   equ HC11Ram+$45
EngineRpm_HB                                       equ HC11Ram+$46
EngineRpm_LB                                       equ HC11Ram+$47
EngineRPM_3D                                       equ HC11Ram+$48
RPMTableOffset                                     equ HC11Ram+$49
AdvanceTemporary                                   equ HC11Ram+$4A
Ram_4B                                             equ HC11Ram+$4B
Ram_4C                                             equ HC11Ram+$4C
Ram_4D                                             equ HC11Ram+$4D
CalculatedSparkAdvance                             equ HC11Ram+$4E
MapVolts                                           equ HC11Ram+$4F
MapValue                                           equ HC11Ram+$50
TpsVolts                                           equ HC11Ram+$51
ChargeTempVolts                                    equ HC11Ram+$52
O2SensorVolts                                      equ HC11Ram+$53
CoolantTemp                                        equ HC11Ram+$54
CoolantTemp_fromTable_Scaled                       equ HC11Ram+$55
PreviousCoolantTemp_fromTable_Scaled               equ HC11Ram+$56
IntakeTemp_fromTable_Scaled                        equ HC11Ram+$57
LastChargeTempVolts                                equ HC11Ram+$58
LastCoolantTempVolts                               equ HC11Ram+$59
LastTpsVolts                                       equ HC11Ram+$5A
BatteryVolts                                       equ HC11Ram+$5B
TpsVolts_Minus_LowestSessionTpsVolts               equ HC11Ram+$5C
VehicleSpeed_HB                                    equ HC11Ram+$5D
VehicleSpeed_LB                                    equ HC11Ram+$5E
VehicleSpeedx8_Scaled                              equ HC11Ram+$5F
RPM_Scaled_maybe                                   equ HC11Ram+$60
StartupSwitchMirror1                               equ HC11Ram+$61
b7_61_bt7               equ %10000000
b6_61_IdleSpeedMode     equ %01000000
b5_61_Brake             equ %00100000
b4_61_PNswitch          equ %00010000
b3_61_bt3               equ %00001000
b2_61_CruiseResume      equ %00000100
b1_61_CruiseSet         equ %00000010
b0_61_bt0               equ %00000001
ACClutchToggleVar                                  equ HC11Ram+$62
ScaledDistPWForCruiseControl                       equ HC11Ram+$63
TargetBatteryVolts                                 equ HC11Ram+$64
BodyComputerBatteryVoltsOutput                     equ HC11Ram+$65
TPSVoltsSessionDelta                               equ HC11Ram+$66
AmbientAirTempVolts2                               equ HC11Ram+$67
Timer_AisChanges                                   equ HC11Ram+$68
DesiredNewAisPosition                              equ HC11Ram+$69
Timer_CountdownFromStartRunForAisFeedback          equ HC11Ram+$6A
MAPOffsetForCylTrim                                equ HC11Ram+$6B
Timer_AisOrO2Sensor                                equ HC11Ram+$6C
TargetIdleSpeedHB                                  equ HC11Ram+$6D
TargetIdleSpeedLB                                  equ HC11Ram+$6E
InjectorPulsewidth_HB                              equ HC11Ram+$6F
InjectorPulsewidth_LB                              equ HC11Ram+$70
Ram_71                                             equ HC11Ram+$71
Ram_72                                             equ HC11Ram+$72
Ram_73                                             equ HC11Ram+$73
AmbientAirTempVolts                                equ HC11Ram+$74
PWMULT_Adaptive_fuel_pulsewidth_multiplier         equ HC11Ram+$75
Ram_76                                             equ HC11Ram+$76
Counter_A_HB                                       equ HC11Ram+$77
Counter_A_LB                                       equ HC11Ram+$78
Counter_B                                          equ HC11Ram+$79
Counter_C                                          equ HC11Ram+$7A
Counter_D                                          equ HC11Ram+$7B
Counter_E                                          equ HC11Ram+$7C
Counter_F_HB                                       equ HC11Ram+$7D
Counter_F_LB                                       equ HC11Ram+$7E
Ram_7F                                             equ HC11Ram+$7F
Ram_80                                             equ HC11Ram+$80
Ram_81                                             equ HC11Ram+$81
Ram_82                                             equ HC11Ram+$82
Counter_O2SensorFeedbackCount_Signed               equ HC11Ram+$83
Ram_84                                             equ HC11Ram+$84
Ram_85                                             equ HC11Ram+$85
Ram_86                                             equ HC11Ram+$86
RpmRelated0087                                     equ HC11Ram+$87
EngineRpmTemp                                      equ HC11Ram+$88
Ram_89                                             equ HC11Ram+$89
MapValueTemp1                                      equ HC11Ram+$8A
Ram_8B                                             equ HC11Ram+$8B
MapValueTemp2                                      equ HC11Ram+$8C
Ram_8D                                             equ HC11Ram+$8D
MapValueTemp3                                      equ HC11Ram+$8E
Ram_8F                                             equ HC11Ram+$8F
MapValue2                                          equ HC11Ram+$90
MapAverageFactorRAM_HB                             equ HC11Ram+$91
MapAverageFactorRAM_LB                             equ HC11Ram+$92
TPSAverageFactorRAM_HB                             equ HC11Ram+$93
TPSAverageFactorRAM_LB                             equ HC11Ram+$94
TPSVoltsTemp_A                                     equ HC11Ram+$95
Ram_96                                             equ HC11Ram+$96
TPSVoltsTemp_B                                     equ HC11Ram+$97
Ram_98                                             equ HC11Ram+$98
Ram_99                                             equ HC11Ram+$99
Ram_9A                                             equ HC11Ram+$9A
Ram_9B                                             equ HC11Ram+$9B
Ram_9C                                             equ HC11Ram+$9C
Ram_9D                                             equ HC11Ram+$9D
Ram_9E                                             equ HC11Ram+$9E
Ram_9F                                             equ HC11Ram+$9F
Ram_A0                                             equ HC11Ram+$A0
Ram_A1                                             equ HC11Ram+$A1
Ram_A2                                             equ HC11Ram+$A2
Ram_A3                                             equ HC11Ram+$A3
Ram_A4                                             equ HC11Ram+$A4
Ram_A5                                             equ HC11Ram+$A5
Ram_A6                                             equ HC11Ram+$A6
Ram_A7                                             equ HC11Ram+$A7
Ram_A8                                             equ HC11Ram+$A8
Ram_A9                                             equ HC11Ram+$A9
Ram_AA                                             equ HC11Ram+$AA
Ram_AB                                             equ HC11Ram+$AB
Ram_AC                                             equ HC11Ram+$AC
Ram_AD                                             equ HC11Ram+$AD
Ram_AE                                             equ HC11Ram+$AE
MAPLoadFactor                                      equ HC11Ram+$AF
Ram_B0                                             equ HC11Ram+$B0
Ram_B1                                             equ HC11Ram+$B1
o2LowLimitForInMiddleDetermination                 equ HC11Ram+$B2
o2HighLimitForInMiddleDetermination                equ HC11Ram+$B3
Ram_B4                                             equ HC11Ram+$B4
Ram_B5                                             equ HC11Ram+$B5
CounterUp_b6_o2                                    equ HC11Ram+$B6
CounterDn_b7_o2                                    equ HC11Ram+$B7
Ram_B8                                             equ HC11Ram+$B8
CounterDn_b9_o2                                    equ HC11Ram+$B9
CounterDn_ba_o2                                    equ HC11Ram+$BA
CounterDn_bb_o2                                    equ HC11Ram+$BB
CounterDn_bc_o2                                    equ HC11Ram+$BC
Ram_BD                                             equ HC11Ram+$BD
Ram_BE                                             equ HC11Ram+$BE
Counter_X                                          equ HC11Ram+$BF
Ram_C0                                             equ HC11Ram+$C0
Ram_C1                                             equ HC11Ram+$C1
Ram_C2                                             equ HC11Ram+$C2
Counter_Cruise_2                                   equ HC11Ram+$C3
CruiseSpeedSetpoint                                equ HC11Ram+$C4
Timer_CruiseDecelerate                             equ HC11Ram+$C5
CruiseControlVar1                                  equ HC11Ram+$C6
CruiseControlVar2                                  equ HC11Ram+$C7
CruiseControlVar3                                  equ HC11Ram+$C8
CruiseControlVar6                                  equ HC11Ram+$C9
Counter_Cruise_4                                   equ HC11Ram+$CA
CruiseControlVar0                                  equ HC11Ram+$CB
Ram_CC                                             equ HC11Ram+$CC
PIA1_Buffer_t3                                     equ HC11Ram+$CD
b7_CD_FanRelay          equ %10000000
b6_CD_CELight           equ %01000000
b5_CD_PTU               equ %00100000
b4_CD_bt4               equ %00010000
b3_CD_bt3               equ %00001000
b2_CD_bt2               equ %00000100
b1_CD_bt1               equ %00000010
b0_CD_bt0               equ %00000001
PIA2_Buffer_t3                                     equ HC11Ram+$CE
b7_CE_CruiseVacuum      equ %10000000
b6_CE_CruiseVent        equ %01000000
b5_CE_bt5               equ %00100000
b4_CE_ASD               equ %00010000
b3_CE_bt3               equ %00001000
b2_CE_bt2               equ %00000100
b1_CE_EGR               equ %00000010
b0_CE_bt0               equ %00000001
PIA3_Buffer_t3                                     equ HC11Ram+$CF
b7_CF_bt7               equ %10000000
b6_CF_bt6               equ %01000000
b5_CF_ChargeTemp        equ %00100000
b4_CF_CoolantTemp       equ %00010000
b3_CF_FuelMon           equ %00001000
b2_CF_bt2               equ %00000100
b1_CF_bt1               equ %00000010
b0_CF_bt0               equ %00000001
Ram_D0                                             equ HC11Ram+$D0
Ram_D1                                             equ HC11Ram+$D1
PTU_MapTemp                                        equ HC11Ram+$D2
Ram_D3                                             equ HC11Ram+$D3
Counter_PartThrottleUnlock                         equ HC11Ram+$D4
b5C_IPL1_t3                                        equ HC11Ram+$D5
b7_D5_MapStuck          equ %10000000
b6_D5_TpsBadSignal      equ %01000000
b5_D5_BattNotCharging   equ %00100000
b4_D5_bt4               equ %00010000
b3_D5_MapBadSignal      equ %00001000
b2_D5_bt2               equ %00000100
b1_D5_BadCoolantTemp    equ %00000010
b0_D5_bt0               equ %00000001
b5D_IPL2_t3                                        equ HC11Ram+$D6
b7_D6_bt7               equ %10000000
b6_D6_EMRLight          equ %01000000
b5_D6_bt5               equ %00100000
b4_D6_MajorFault        equ %00010000
b3_D6_bt4               equ %00001000
b2_D6_bt3               equ %00000100
b1_D6_bt2               equ %00000010
b0_D6_bt1               equ %00000001
b5d_IPL2                                           equ HC11Ram+$D7
b7_D7_bt7               equ %10000000
b6_D7_bt6               equ %01000000
b5_D7_InjFault          equ %00100000
b4_D7_BadBattVolts      equ %00010000
b3_D7_bt3               equ %00001000
b2_D7_BadO2             equ %00000100
b1_D7_bt1               equ %00000010
b0_D7_bt0               equ %00000001
DRBPointer1                                        equ HC11Ram+$D8
DRBPointer2                                        equ HC11Ram+$D9
DRBPointer3                                        equ HC11Ram+$DA
DRBSerialMode                                      equ HC11Ram+$DB
b7_DB_FastSerial        equ %10000000
b6_DB_ByteMode          equ %01000000
b5_DB_TestType3         equ %00100000
b4_DB_TestType2         equ %00010000
b3_DB_bit3              equ %00001000
b2_DB_bit2              equ %00000100
b1_DB_bit1              equ %00000010
b0_DB_bit0              equ %00000001
ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB         equ HC11Ram+$DC
ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB         equ HC11Ram+$DD
ClearTheErrorTimer_0                               equ HC11Ram+$DE
ClearTheErrorTimer_1                               equ HC11Ram+$DF
ATMOffset                                          equ HC11Ram+$E0
CCDFlags5                                          equ HC11Ram+$E1
b7_E1_e1b7              equ %10000000
b6_E1_e1b6              equ %01000000
b5_E1_AlarmDisable      equ %00100000
b4_E1_e1b4              equ %00010000
b3_E1_bt3               equ %00001000
b2_E1_bt2               equ %00000100
b1_E1_bt1               equ %00000010
b0_E1_bt0               equ %00000001
Ram_E2                                             equ HC11Ram+$E2
EGRVar5_EGR_Temp_1                                 equ HC11Ram+$E3
EGRVar3_ErrorCodeBufferHB                          equ HC11Ram+$E4
Ram_E5                                             equ HC11Ram+$E5
EGRVar6                                            equ HC11Ram+$E6
EGRVar1_ErrorCodeCounter                           equ HC11Ram+$E7
EGRVar7                                            equ HC11Ram+$E8
EGRVar8                                            equ HC11Ram+$E9
MapVolts_X                                         equ HC11Ram+$EA
MapValue3                                          equ HC11Ram+$EB
Ram_EC                                             equ HC11Ram+$EC
BitFlags608D                                       equ HC11Ram+$ED
BatteryVoltsRaw                                    equ HC11Ram+$EE
A2DResults2Temp                                    equ HC11Ram+$EF
BatVoltsDiagCounter                                equ HC11Ram+$F0
Counter_O2Diagnostics                              equ HC11Ram+$F1
Timer_O2MiddleDiagnostics                          equ HC11Ram+$F2
Ram_F3                                             equ HC11Ram+$F3
Ram_F4                                             equ HC11Ram+$F4
CCDFlags4_BodyCompFlags4_X                         equ HC11Ram+$F5
CCDFlags6                                          equ HC11Ram+$F6
b7_F6_ae2b7             equ %10000000
b6_F6_ae2b6             equ %01000000
b5_F6_ae2b5             equ %00100000
b4_F6_ae2b4             equ %00010000
b3_F6_ae2b3             equ %00001000
b2_F6_ae2b2             equ %00000100
b1_F6_ae2b1             equ %00000010
b0_F6_ae2b0             equ %00000001
CCDTemp_HB                                         equ HC11Ram+$F7
CCDFuelOutput_HB                                   equ HC11Ram+$F8
CCDFuelOutput_LB                                   equ HC11Ram+$F9
Counter_SpeedSensorInterrupt_HB_X                  equ HC11Ram+$FA
CCDFlags4_tsbec                                    equ HC11Ram+$FB
b7_FB_bt7               equ %10000000
b6_FB_bt6               equ %01000000
b5_FB_adeb7             equ %00100000
b4_FB_bt4               equ %00010000
b3_FB_addb2             equ %00001000
b2_FB_bt2               equ %00000100
b1_FB_bt1               equ %00000010
b0_FB_bt0               equ %00000001
Counter_InjectorCalc                               equ HC11Ram+$FC
CounterUp_UsedInCalcFuel                           equ HC11Ram+$FD
Ram_FE                                             equ HC11Ram+$FE
Timer_MinimumFanRun                                equ HC11Ram+$FF
SwitchPortAccessReg1                               equ PiaAddr+$00
b7_6400_bt7             equ %10000000
b6_6400_sp1_B1Volt      equ %01000000
b5_6400_bt5             equ %00100000
b4_6400_bt4             equ %00010000
b3_6400_bt3             equ %00001000
b2_6400_AlternatorField equ %00000100
b1_6400_bt1             equ %00000010
b0_6400_bt0             equ %00000001
SwitchPortAccessReg2                               equ PiaAddr+$01
PIA_Ctrl_1                                         equ PiaAddr+$02
PIA_Ctrl_2                                         equ PiaAddr+$03
PIA_Ctrl_3                                         equ PiaAddr+$04
PIA_Ctrl_4                                         equ PiaAddr+$05
PIA_Ctrl_5                                         equ PiaAddr+$06
InjectorPulsewidth_HB_Cyl1                         equ PiaAddr+$08
InjectorPulsewidth_LB_Cyl1                         equ PiaAddr+$09
InjectorPulsewidth_HB_Cyl2                         equ PiaAddr+$0A
InjectorPulsewidth_LB_Cyl2                         equ PiaAddr+$0B
InjectorPulsewidth_HB_Cyl3                         equ PiaAddr+$0C
InjectorPulsewidth_LB_Cyl3                         equ PiaAddr+$0D
InjectorPulsewidth_HB_Cyl4                         equ PiaAddr+$0E
InjectorPulsewidth_LB_Cyl4                         equ PiaAddr+$0F
PIA3_Buffer_2_t3                                   equ PiaAddr+$40
CountdownTimerFromKeyOn                            equ PiaAddr+$80
UNe_6481                                           equ PiaAddr+$81
UNe_6482                                           equ PiaAddr+$82
UNe_6483                                           equ PiaAddr+$83
UNe_6484                                           equ PiaAddr+$84
LDXi_6485                                          equ PiaAddr+$85
FDRVar0                                            equ PiaAddr+$86
FDRVar1                                            equ PiaAddr+$87
FDRVar2                                            equ PiaAddr+$88
FDRVar3                                            equ PiaAddr+$89
STe_648A                                           equ PiaAddr+$8A
Temp5_t3                                           equ PiaAddr+$8B
DoubleTempB                                        equ PiaAddr+$8D
DoubleTempC                                        equ PiaAddr+$8F
LDXi_6490                                          equ PiaAddr+$90
L00F5_t3                                           equ PiaAddr+$91
Counter_IC1_Temp                                   equ PiaAddr+$93
AntiDwellTime_HB                                   equ PiaAddr+$95
AntiDwellTime_LB                                   equ PiaAddr+$96
Counter_SomethingWithDistributor                   equ PiaAddr+$97
CruiseControlVar4                                  equ PiaAddr+$98
Temp0                                              equ PiaAddr+$99
Temp1                                              equ PiaAddr+$9A
Temp2                                              equ PiaAddr+$9B
Temp3                                              equ PiaAddr+$9C
Temp4                                              equ PiaAddr+$9D
Temp5                                              equ PiaAddr+$9E
Temp6                                              equ PiaAddr+$9F
Temp7                                              equ PiaAddr+$A0
MinimumTimerCountBeforeMainloopCanContinue2        equ PiaAddr+$A1
UNe_64A3                                           equ PiaAddr+$A3
CalculatedDwellTime                                equ PiaAddr+$A5
Timer_AlternatorDutyCycle                          equ PiaAddr+$A6
Timer_DelayBeforeUpdating_MINTHR                   equ PiaAddr+$A7
CoolantVoltsTmp1                                   equ PiaAddr+$A8
MapValue_t3                                        equ PiaAddr+$A9
CoolantVoltsTmp2                                   equ PiaAddr+$AA
SparkScatterIncrement                              equ PiaAddr+$AB
SparkScatter                                       equ PiaAddr+$AC
UNe_64AD                                           equ PiaAddr+$AD
STe_64AE                                           equ PiaAddr+$AE
Counter_ACControl1                                 equ PiaAddr+$AF
DRBOffsetStored_HB                                 equ PiaAddr+$B0
DRBOffsetStored_LB                                 equ PiaAddr+$B1
LastCamFallingEdgeTime2                            equ PiaAddr+$B2
BitFlags65_t3                                      equ PiaAddr+$B3
Timer_ThermostatDiagnostics                        equ PiaAddr+$B4
ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR        equ PiaAddr+$B5
Temp1_t3                                           equ PiaAddr+$B6
PIA2_Buffer_t3_Temp                                equ PiaAddr+$B7
UNe_64B8                                           equ PiaAddr+$B8
UNe_64B9                                           equ PiaAddr+$B9
STe_64BA                                           equ PiaAddr+$BA
STe_64BC                                           equ PiaAddr+$BC
STe_64BD                                           equ PiaAddr+$BD
STe_64BE                                           equ PiaAddr+$BE
STe_64C0                                           equ PiaAddr+$C0
UNe_64C1                                           equ PiaAddr+$C1
Ram64c3                                            equ PiaAddr+$C3
Ram64c4                                            equ PiaAddr+$C4
STe_64C6                                           equ PiaAddr+$C6
STe_64C7                                           equ PiaAddr+$C7
STe_64C8                                           equ PiaAddr+$C8
DRB_ProgramModeFlag                                equ PiaAddr+$C9
DRB_SpecialProgramRoutine                          equ PiaAddr+$CB
UNk_64D0                                           equ PiaAddr+$D0
TopOfStack                                         equ PiaAddr+$FF
M99_AAAA                                           equ $AAAA
M99_D555                                           equ $D555

HC11Registers                                      equ $1000
PORTA_PortA                                        equ HC11Registers+$00
;   PortA_bit7          equ %10000000
;   PortA_bit6          equ %01000000
;   PortA_InjectorB     equ %00100000
;   PortA_InjectorA     equ %00010000
;   PortA_IgnCoil       equ %00001000
;   PortA_DistRef       equ %00000100
;   PortA_Speedo        equ %00000010
;   PortA_bit0          equ %00000001
CPU_L1001_Reserved                                 equ HC11Registers+$01
PIOC_Parallel_IO_Ctrl                              equ HC11Registers+$02
PORTC_PortC                                        equ HC11Registers+$03
PORTB_PortB                                        equ HC11Registers+$04
PORTCL_PortCL                                      equ HC11Registers+$05
CPU_L1006Reserved                                  equ HC11Registers+$06
DDRC_PortC_DataDirection                           equ HC11Registers+$07
PORTD_PortD                                        equ HC11Registers+$08
DDRD_PortD_DataDirection                           equ HC11Registers+$09
PORTE_PortE                                        equ HC11Registers+$0A
CFORC_TimerForceCompare                            equ HC11Registers+$0B
;   allows user to force the OCx pins to change states asap and not have to wait for
;   the timer to actually expire.  does not affect the OCxF bits or trigger interrupts.
;   Bit 7 - OC1:
;   Bit 6 - OC2:
;   Bit 5 - OC3:
;   Bit 4 - OC4:
;   Bit 3 - OC5:
;   Bit 2 - 0
;   Bit 1 - 0
;   Bit 0 - 0
OC1M_OutputCompare1Mask                            equ HC11Registers+$0C
;   Bit 7 - OC1M7:
;   Bit 6 - OC1M6:
;   Bit 5 - OC1M5:
;   Bit 4 - OC1M4:
;   Bit 3 - OC1M3:
;   Bit 2 - 0
;   Bit 1 - 0
;   Bit 0 - 0
OC1D_OutputCompare1D                               equ HC11Registers+$0D
;   Bit 7 - OC1D7: references PA7/PA1
;   Bit 6 - OC1D6: references PA6/OC2
;   Bit 5 - OC1D5: references PA5/OC3
;   Bit 4 - OC1D4: references PA4/OC4
;   Bit 3 - OC1D3: references PA3/PC5
;   Bit 2 - 0
;   Bit 1 - 0
;   Bit 0 - 0
TCNT_Counter_FreeRunning16bit                      equ HC11Registers+$0E
TIC1_Counter_IC1_CamSensor                         equ HC11Registers+$10
TIC2_Counter_IC2_Speedometer                       equ HC11Registers+$12
TIC3_Counter_IC3_CrankSensor                       equ HC11Registers+$14
TOC1_Counter_OC1                                   equ HC11Registers+$16
TOC2_Counter_OC2                                   equ HC11Registers+$18
TOC3_Counter_OC3                                   equ HC11Registers+$1A
TOC4_Counter_OC4                                   equ HC11Registers+$1C
TOC5_Counter_OC5_Dwell                             equ HC11Registers+$1E
TCTL1_TimerControlReg1                             equ HC11Registers+$20
;   Bit 7 - OM2:     M0 L0 = OCx does not affect pin (OC1 still may)
;   Bit 6 - OL2:     M0 L1 = Toggle OCx pin on successful compare
;   Bit 5 - OM3:     M1 L0 = Clear OCx pin on successful compare
;   Bit 4 - OL3:     M1 L1 = Set OCx pin on successful compare
;   Bit 3 - OM4:
;   Bit 2 - OL4:
;   Bit 1 - OM5:
;   Bit 0 - OL5:
TCTL2_TimerControlReg2                             equ HC11Registers+$21
;   determines which edge to detect - 2 bits determine mode
;   00=no capture 01=rising edge 10=falling edge 11=both edges
;   bits 7/6 not used
;   bits 5/4 IC1
;   bits 3/2 IC2
;   bits 1/0 IC3
TMSK1_TimerInterruptMask1                          equ HC11Registers+$22
;   when bit is set generates hardware interrupt when corresponding 0x1023 bit is by edge
;   when bit is clr program must read 0x1023 bit to determine if edge has been detected
;   OC1               equ %10000000
;   OC2               equ %01000000
;   OC3               equ %00100000
;   OC4               equ %00010000
;   OC5Dwell          equ %00001000
;   IC1Distributor    equ %00000100
;   IC2SDSSignal      equ %00000010
;   InputCompare3     equ %00000001
TFLG1_TimerInterruptFlag1                          equ HC11Registers+$23
;   bit is set whenever edge is detected on an IC pin
;   can also manually set these pins if you want to trigger interrupts
;   OC1               equ %10000000
;   OC2               equ %01000000
;   OC3               equ %00100000
;   OC4               equ %00010000
;   OC5Dwell          equ %00001000
;   IC1Distributor    equ %00000100
;   IC2SDSSignal      equ %00000010
;   IC3               equ %00000001
;   ********************************************************************************
;   * when an edge (as set 0x1021) is detected on an ICx pin the 16bit value of the*
;   * free running counter is captured in latch locations 0x1010-(IC1) 0x1012-(IC2)*
;   * or 0x1014-(IC3).  The corresponding status flag bit(s) are then set in reg   *
;   * 0x1023.  if the interrupt mask 0x1022 is set for that IC pin then a hardware *
;   * interrupt is generated and the related subroutine is run.  If the mask is not*
;   * set then the program must read the status flag bit to determine if an edge   *
;   * has been detected.                                                           *
;   ********************************************************************************
TMSK2_TimerInterruptMask2                          equ HC11Registers+$24
;   Bit 7 - TOI:  Timer Overflow Interrupt Enable
;   Bit 6 - RTII:  Real Time Interrupt Enable
;   Bit 5 - PAOVI: Pulse accumulator overflow interrupt enable
;   Bit 4 - PAII:  Pulse accumulator input edge interrupt enable
;   Bit 3 - 0
;   Bit 2 - 0
;   Bit 1 - PR1:  Timer Prescaler 00=1 (500nS) 01=4 (2uS) 10=8 (4uS) 11=16 (8uS)
;   Bit 0 - PR0:
;   TCNT count value =  is 1/(2000000 / prescaler)
TFLG2_TimerInterruptFlag2                          equ HC11Registers+$25
PACTL_PulseAccumulatorControl                      equ HC11Registers+$26
;   Bit 7 - TOI:  Timer Overflow Interrupt Enable
;   Bit 6 - RTII:  Real Time Interrupt Enable
;   Bit 5 - PAOVI: Pulse accumulator overflow interrupt enable
;   Bit 4 - PAII:  Pulse accumulator input edge interrupt enable
;   Bit 3 - 0
;   Bit 2 - 0
;   Bit 1 - PR1:  Timer Prescaler 00=1 (4.096mS) 01=2 (8.192mS) 10=4 (16.384mS) 11=8 (32.768mS)
;   Bit 0 - PR0:
;   rti timer value = 1 /(2Mhtz / 2^13 / prescaler)
PACNT_PulseAccumulatorCounter                      equ HC11Registers+$27
SPCR_SerialPeripheralControl                       equ HC11Registers+$28
SPSR_SerialPeripheralStatus                        equ HC11Registers+$29
;   Bit 7 - SPIF - SPI Transfer complete flag
;   Bit 6 - WCOL - Write collision error flag
;   Bit 5 - 0
;   Bit 4 - MODF - Mode fault error flag
;   Bit 3 - 0
;   Bit 2 - 0
;   Bit 1 - 0
;   Bit 0 - 0
SPDR_SerialPeripheralDataIO                        equ HC11Registers+$2A
BAUD_SerialBaudRate                                equ HC11Registers+$2B
;   Bit 7 - TCLR: (test bit)
;   Bit 6 - 0
;   Bit 5 - SCP1: SCI Baud rate prescale selects
;   Bit 4 - SCP0: 00=/1 (max125k) 01=/3 (max42k) 10=/4 (max32k) 11=/13 (max9600baud)
;   Bit 3 - RCKB: (test bit)
;   Bit 2 - SCR2:
;   Bit 1 - SCR1:
;   Bit 0 - SCR0:
;      To achieve 977   baud byte=$25
;      To achieve 1200  baud byte $33
;      To achieve 9600  baud byte = $30
;      To achieve 62500 baud byte = $01
SCCR1_SerialControlReg1                            equ HC11Registers+$2C
SCCR2_SerialControlReg2                            equ HC11Registers+$2D
SCSR_SerialStatus                                  equ HC11Registers+$2E
SCDR_SerialData                                    equ HC11Registers+$2F
ADCTL_A2DControlReg                                equ HC11Registers+$30
;   determines what sensor group to read into a2dresults channels
;   Bit 7 - CCF: Conversions Complete Flag
;   Bit 6 - 0
;   Bit 5 - SCAN: 0=perform 4 conversions. 1=continuous conversions
;   Bit 4 - MULT: 0=single channel
;   Bit 3 - CD: These bits select which channel(s) to convert
;   Bit 2 - CC:
;   Bit 1 - CB:
;   Bit 0 - CA:
ADR1_A2DResults1                                   equ HC11Registers+$31
ADR2_A2DResults2                                   equ HC11Registers+$32
ADR3_A2DResults3                                   equ HC11Registers+$33
ADR4_A2DResults4                                   equ HC11Registers+$34
BPROT_BlockProtReg                                 equ HC11Registers+$35
OPTION_SysConfigOptionReg                          equ HC11Registers+$39
;   Bit 7 - ADPU:
;   Bit 6 - CSEL: 1=use alternate charge pump for EEPROM and A/D
;   Bit 5 - IRQE: 1=configure IRQ for edge sensitive operation only
;   Bit 4 - DLY: 1=enable oscillator startup delat (designed to allow crystal to stabilize)
;   Bit 3 - CME:
;   Bit 2 - 0
;   Bit 1 - CR1: Watchdog Timer Rate Select
;   Bit 0 - CR0: at 8MHz 00=1 (16.384ms) 01=4 (65.536ms) 10=16 (262.14ms) 11=64 (1.049s)
;   COP count value = 1 / (2000000 / 2^15 / prescaler)
COPRST_ArmOCToggleAndResetCopTimerReg              equ HC11Registers+$3A
PPROG_EEPROMControlReg                             equ HC11Registers+$3B
;   Bit 7 - ODD
;   Bit 6 - EVEN
;   Bit 5 - 0
;   Bit 4 - BYTE
;   Bit 3 - ROW
;   Bit 2 - ERASE
;   Bit 1 - EELAT
;   Bit 0 - EEPGM
HPRIO_HighPriorityInterruptMask                    equ HC11Registers+$3C
;   Bit 7 - RBOOT: Read Bootstrap ROM (can be written only while SMOD=1) 1=bootstrap ROM at $bf40-$bfff
;   Bit 6 - SMOD:  Special Mode (can be written to zero but not back to one) 1=special mode in effect
;   Bit 5 - MDA:  Mode A Select (can be written only while SMOD=1) 1=normal expanded
;   Bit 4 - IRV:  Internal Read Visibility (can be written only while SMOD=1) 0=data from internal reads not visible on bus
;   Bit 3 - PSEL3: for selecting which interrupt is highest priority
;   Bit 2 - PSEL2:
;   Bit 1 - PSEL1:
;   Bit 0 - PSEL0:
INIT_SysInit                                       equ HC11Registers+$3D
;   Bit 7 - RAM3: Ram3:0 specify the upper hex digit of the RAM address
;   Bit 6 - RAM2:        the position of the RAM in the memory map. This allows RAM
;   Bit 5 - RAM1:        to be moved for example to F000-F0FF (default is 0000)
;   Bit 4 - RAM0:
;   Bit 3 - REG3: Reg3:0 specify the upper hex digit of the Registers address just
;   Bit 2 - REG2:        like the RAM. (default is 0001)
;   Bit 1 - REG1:
;   Bit 0 - REG0:
TEST1_Test                                         equ HC11Registers+$3E
;   Bit 7 - TILOP:
;   Bit 6 - 0
;   Bit 5 - OCCR:
;   Bit 4 - CBYP:
;   Bit 3 - DISR:
;   Bit 2 - FCM:
;   Bit 1 - FCOP:
;   Bit 0 - TCON:
CONFIG_SystemConfigReg                             equ HC11Registers+$3F
