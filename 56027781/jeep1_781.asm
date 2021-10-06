.title Enter title here
.area ROM (ABS)
 
;************************************************************
;*                                                          *
;* MPDisassemble - Copyright 2009-2017 by Morris Terveen    *
;*                                                          *
;* Use at your own risk.  Author accepts no liability for   *
;* any damage that may result from the use of this program. *
;*                                                          *
;************************************************************
 
version == 16
DataOrg == 0x8000
CodeOrg == 0x9400
.define CalDataFile /C:\Users\Morris\Desktop\jeep781\jeep1_781.tpl/
 
Ram_00                                             == 0x0000
Ram_01                                             == 0x0001
Ram_02                                             == 0x0002
MinimumTimerCountBeforeMainloopCanContinue         == 0x0003
Ram_04                                             == 0x0004
Ram_05                                             == 0x0005
LowestSessionTpsVolts                              == 0x0006
BitFlags36_t3                                      == 0x0007
    b7_7_bt7 = $%10000000
    b6_7_UseAIS = $%01000000
    b5_7_bt5 = $%00100000
    b4_7_bt4 = $%00010000
    b3_7_bt3 = $%00001000
    b2_7_bt2 = $%00000100
    b1_7_bt1 = $%00000010
    b0_7_bt0 = $%00000001
CurrentAisPosition                                 == 0x0008
Timer_DacalCountdown                               == 0x0009
ValueFromAdaptiveMemory                            == 0x000A
Ram_0B                                             == 0x000B
Ram_0C                                             == 0x000C
BaroPressure                                       == 0x000D
Counter_SpeedSensorInterrupt_HB                    == 0x000E
Counter_SpeedSensorInterrupt_LB                    == 0x000F
BitFlags_36_t3                                     == 0x0010
    b7_10_bt7 = $%10000000
    b6_10_UseAis = $%01000000
    b5_10_a10b8 = $%00100000
    b4_10_AsdOn = $%00010000
    b3_10_bt3 = $%00001000
    b2_10_bt2 = $%00000100
    b1_10_AIS1 = $%00000010
    b0_10_AIS0 = $%00000001
Ram_11                                             == 0x0011
L002F_t3                                           == 0x0012
Ram_13                                             == 0x0013
CruiseControlVarT1                                 == 0x0014
ErrorBitRegister0                                  == 0x0015
ErrorBitRegister1                                  == 0x0016
ErrorBitRegister2                                  == 0x0017
ErrorBitRegister3                                  == 0x0018
ErrorBitRegisterStored0                            == 0x0019
ErrorBitRegisterStored1                            == 0x001A
ErrorBitRegisterStored2                            == 0x001B
ErrorBitRegisterStored3                            == 0x001C
ErrorCodeUpdateKeyOnCount                          == 0x001D
ErrorCodeUpdateKeyOnCount2                         == 0x001E
ErrorCodeUpdateKeyOnCount3                         == 0x001F
IPL1                                               == 0x0020
    b7_20_bt7 = $%10000000
    b6_20_FuelEngineNotRunning = $%01000000
    b5_20_bt5 = $%00100000
    b4_20_bt4 = $%00010000
    b3_20_bt3 = $%00001000
    b2_20_bt2 = $%00000100
    b1_20_bt1 = $%00000010
    b0_20_SearchBladeEndRef_INSYNC = $%00000001
BitFlags21                                         == 0x0021
    b7_21_DistSync = $%10000000
    b6_21_a70b0 = $%01000000
    b5_21_a70b2 = $%00100000
    b4_21_a70b3 = $%00010000
    b3_21_bt3 = $%00001000
    b2_21_bt2 = $%00000100
    b1_21_bt1 = $%00000010
    b0_21_bt0 = $%00000001
BitFlags66_t3                                      == 0x0022
    b7_22_Offidle = $%10000000
    b6_22_bt6 = $%01000000
    b5_22_AtIdle = $%00100000
    b4_22_bt4 = $%00010000
    b3_22_a69b2 = $%00001000
    b2_22_FallToIdle = $%00000100
    b1_22_bt1 = $%00000010
    b0_22_bt0 = $%00000001
BitFlags23                                         == 0x0023
    b7_23_bt7 = $%10000000
    b6_23_bt6 = $%01000000
    b5_23_bt5 = $%00100000
    b4_23_bt4 = $%00010000
    b3_23_bt3 = $%00001000
    b2_23_Past12SecRunning = $%00000100
    b1_23_a6bb7 = $%00000010
    b0_23_a6bb6 = $%00000001
BitFlags24                                         == 0x0024
    b7_24_a6f = $%10000000
    b6_24_bt6 = $%01000000
    b5_24_bt5 = $%00100000
    b4_24_BadSpeedo1 = $%00010000
    b3_24_BadSpeedo2 = $%00001000
    b2_24_BadASD = $%00000100
    b1_24_AlternatorField = $%00000010
    b0_24_AltBit1 = $%00000001
BitFlags68_t3                                      == 0x0025
    b7_25_ATXChgGear = $%10000000
    b6_25_AcClutch = $%01000000
    b5_25_bt5 = $%00100000
    b4_25_ATXInGear = $%00010000
    b3_25_bt3 = $%00001000
    b2_25_AIS = $%00000100
    b1_25_bt1 = $%00000010
    b0_25_bt0 = $%00000001
BitFlags6a_t3                                      == 0x0026
    b7_26_bt7 = $%10000000
    b6_26_drbToggle1 = $%01000000
    b5_26_drbToggle2 = $%00100000
    b4_26_bt4 = $%00010000
    b3_26_bt3 = $%00001000
    b2_26_bt2 = $%00000100
    b1_26_bt1 = $%00000010
    b0_26_bt0 = $%00000001
BitFlags27                                         == 0x0027
    b7_27_FuelEngNotRunning = $%10000000
    b6_27_bt6 = $%01000000
    b5_27_bt5 = $%00100000
    b4_27_bt4 = $%00010000
    b3_27_bt3 = $%00001000
    b2_27_bt2 = $%00000100
    b1_27_ATXInGear = $%00000010
    b0_27_cfg_ATX = $%00000001
BitFlags6d_t3                                      == 0x0028
    b7_28_bt7 = $%10000000
    b6_28_bt6 = $%01000000
    b5_28_bt5 = $%00100000
    b4_28_bt4 = $%00010000
    b3_28_bt3 = $%00001000
    b2_28_NeedSetup = $%00000100
    b1_28_bt1 = $%00000010
    b0_28_InMotion = $%00000001
BitFlags29                                         == 0x0029
BitFlags2a                                         == 0x002A
    b7_2A_bt7 = $%10000000
    b6_2A_bt6 = $%01000000
    b5_2A_PTU_A = $%00100000
    b4_2A_PTU_B = $%00010000
    b3_2A_SpeedUnder40 = $%00001000
    b2_2A_bt2 = $%00000100
    b1_2A_bt1 = $%00000010
    b0_2A_bt0 = $%00000001
BitFlags2b                                         == 0x002B
BitFlags2c                                         == 0x002C
BitFlags2d                                         == 0x002D
    b7_2D_bt7 = $%10000000
    b6_2D_bt6 = $%01000000
    b5_2D_bt5 = $%00100000
    b4_2D_a71b5 = $%00010000
    b3_2D_EMR_1 = $%00001000
    b2_2D_a6cb1 = $%00000100
    b1_2D_a6cb3 = $%00000010
    b0_2D_a6cb2 = $%00000001
BitFlags2e                                         == 0x002E
    b7_2E_MapMaybe = $%10000000
    b6_2E_bt6 = $%01000000
    b5_2E_bt5 = $%00100000
    b4_2E_bt4 = $%00010000
    b3_2E_bt3 = $%00001000
    b2_2E_EGRFault = $%00000100
    b1_2E_bt1 = $%00000010
    b0_2E_a70b1 = $%00000001
BitFlags2f                                         == 0x002F
Ram_30                                             == 0x0030
CruiseStatus_1                                     == 0x0031
CruiseStatus_2                                     == 0x0032
Counter_Cruise_1                                   == 0x0033
Counter_TimerPastHalfwayBetweenCamPulses           == 0x0034
TimerOverflowsBetweenCamPulses                     == 0x0035
DistributorFallingEdgePulsewidth_HB                == 0x0036
DistributorFallingEdgePulsewidth_LB                == 0x0037
LastCamFallingEdgeTime                             == 0x0038
Ram_39                                             == 0x0039
BitFlags_BF_t3                                     == 0x003A
CylinderPointer                                    == 0x003B
Counter_TimerRegHalfOverflowBetweenSpeedoPulses    == 0x003C
TimerOverflowsBetweenSpeedoPulses                  == 0x003D
SpeedoSensorPulsewidth_HB                          == 0x003E
SpeedoSensorPulsewidth_LB                          == 0x003F
PreviousVehicleSpeed_HB                            == 0x0040
PreviousVehicleSpeed_LB                            == 0x0041
CounterUp_42                                       == 0x0042
CounterUp_43                                       == 0x0043
KeyOnOrEngineRunningTime                           == 0x0044
Counter_MainLoop                                   == 0x0045
EngineRpm_HB                                       == 0x0046
EngineRpm_LB                                       == 0x0047
EngineRPM_3D                                       == 0x0048
RPMTableOffset                                     == 0x0049
AdvanceTemporary                                   == 0x004A
Ram_4B                                             == 0x004B
Ram_4C                                             == 0x004C
Ram_4D                                             == 0x004D
CalculatedSparkAdvance                             == 0x004E
MapVolts                                           == 0x004F
MapValue                                           == 0x0050
TpsVolts                                           == 0x0051
ChargeTempVolts                                    == 0x0052
O2SensorVolts                                      == 0x0053
CoolantTemp                                        == 0x0054
CoolantTemp_fromTable_Scaled                       == 0x0055
PreviousCoolantTemp_fromTable_Scaled               == 0x0056
IntakeTemp_fromTable_Scaled                        == 0x0057
LastChargeTempVolts                                == 0x0058
LastCoolantTempVolts                               == 0x0059
LastTpsVolts                                       == 0x005A
BatteryVolts                                       == 0x005B
TpsVolts_Minus_LowestSessionTpsVolts               == 0x005C
VehicleSpeed_HB                                    == 0x005D
VehicleSpeed_LB                                    == 0x005E
VehicleSpeedx8_Scaled                              == 0x005F
RPM_Scaled_maybe                                   == 0x0060
StartupSwitchMirror1                               == 0x0061
    b7_61_bt7 = $%10000000
    b6_61_IdleSpeedMode = $%01000000
    b5_61_Brake = $%00100000
    b4_61_PNswitch = $%00010000
    b3_61_bt3 = $%00001000
    b2_61_CruiseResume = $%00000100
    b1_61_CruiseSet = $%00000010
    b0_61_bt0 = $%00000001
ACClutchToggleVar                                  == 0x0062
ScaledDistPWForCruiseControl                       == 0x0063
TargetBatteryVolts                                 == 0x0064
BodyComputerBatteryVoltsOutput                     == 0x0065
TPSVoltsSessionDelta                               == 0x0066
AmbientAirTempVolts2                               == 0x0067
Timer_AisChanges                                   == 0x0068
DesiredNewAisPosition                              == 0x0069
Timer_CountdownFromStartRunForAisFeedback          == 0x006A
MAPOffsetForCylTrim                                == 0x006B
Timer_AisOrO2Sensor                                == 0x006C
TargetIdleSpeedHB                                  == 0x006D
TargetIdleSpeedLB                                  == 0x006E
InjectorPulsewidth_HB                              == 0x006F
InjectorPulsewidth_LB                              == 0x0070
Ram_71                                             == 0x0071
Ram_72                                             == 0x0072
Ram_73                                             == 0x0073
AmbientAirTempVolts                                == 0x0074
PWMULT_Adaptive_fuel_pulsewidth_multiplier         == 0x0075
Ram_76                                             == 0x0076
Counter_A_HB                                       == 0x0077
Counter_A_LB                                       == 0x0078
Counter_B                                          == 0x0079
Counter_C                                          == 0x007A
Counter_D                                          == 0x007B
Counter_E                                          == 0x007C
Counter_F_HB                                       == 0x007D
Counter_F_LB                                       == 0x007E
Ram_7F                                             == 0x007F
Ram_80                                             == 0x0080
Ram_81                                             == 0x0081
Ram_82                                             == 0x0082
Counter_O2SensorFeedbackCount_Signed               == 0x0083
Ram_84                                             == 0x0084
Ram_85                                             == 0x0085
Ram_86                                             == 0x0086
RpmRelated0087                                     == 0x0087
EngineRpmTemp                                      == 0x0088
Ram_89                                             == 0x0089
MapValueTemp1                                      == 0x008A
Ram_8B                                             == 0x008B
MapValueTemp2                                      == 0x008C
Ram_8D                                             == 0x008D
MapValueTemp3                                      == 0x008E
Ram_8F                                             == 0x008F
MapValue2                                          == 0x0090
MapAverageFactorRAM_HB                             == 0x0091
MapAverageFactorRAM_LB                             == 0x0092
TPSAverageFactorRAM_HB                             == 0x0093
TPSAverageFactorRAM_LB                             == 0x0094
TPSVoltsTemp_A                                     == 0x0095
Ram_96                                             == 0x0096
TPSVoltsTemp_B                                     == 0x0097
Ram_98                                             == 0x0098
Ram_99                                             == 0x0099
Ram_9A                                             == 0x009A
Ram_9B                                             == 0x009B
Ram_9C                                             == 0x009C
Ram_9D                                             == 0x009D
Ram_9E                                             == 0x009E
Ram_9F                                             == 0x009F
Ram_A0                                             == 0x00A0
Ram_A1                                             == 0x00A1
Ram_A2                                             == 0x00A2
Ram_A3                                             == 0x00A3
Ram_A4                                             == 0x00A4
Ram_A5                                             == 0x00A5
Ram_A6                                             == 0x00A6
Ram_A7                                             == 0x00A7
Ram_A8                                             == 0x00A8
Ram_A9                                             == 0x00A9
Ram_AA                                             == 0x00AA
Ram_AB                                             == 0x00AB
Ram_AC                                             == 0x00AC
Ram_AD                                             == 0x00AD
Ram_AE                                             == 0x00AE
MAPLoadFactor                                      == 0x00AF
Ram_B0                                             == 0x00B0
Ram_B1                                             == 0x00B1
o2LowLimitForInMiddleDetermination                 == 0x00B2
o2HighLimitForInMiddleDetermination                == 0x00B3
Ram_B4                                             == 0x00B4
Ram_B5                                             == 0x00B5
CounterUp_b6_o2                                    == 0x00B6
CounterDn_b7_o2                                    == 0x00B7
Ram_B8                                             == 0x00B8
CounterDn_b9_o2                                    == 0x00B9
CounterDn_ba_o2                                    == 0x00BA
CounterDn_bb_o2                                    == 0x00BB
CounterDn_bc_o2                                    == 0x00BC
Ram_BD                                             == 0x00BD
Ram_BE                                             == 0x00BE
Counter_X                                          == 0x00BF
Ram_C0                                             == 0x00C0
Ram_C1                                             == 0x00C1
Ram_C2                                             == 0x00C2
Counter_Cruise_2                                   == 0x00C3
CruiseSpeedSetpoint                                == 0x00C4
Timer_CruiseDecelerate                             == 0x00C5
CruiseControlVar1                                  == 0x00C6
CruiseControlVar2                                  == 0x00C7
CruiseControlVar3                                  == 0x00C8
CruiseControlVar6                                  == 0x00C9
Counter_Cruise_4                                   == 0x00CA
CruiseControlVar0                                  == 0x00CB
Ram_CC                                             == 0x00CC
PIA1_Buffer_t3                                     == 0x00CD
    b7_CD_FanRelay = $%10000000
    b6_CD_CELight = $%01000000
    b5_CD_PTU = $%00100000
    b4_CD_bt4 = $%00010000
    b3_CD_bt3 = $%00001000
    b2_CD_bt2 = $%00000100
    b1_CD_bt1 = $%00000010
    b0_CD_bt0 = $%00000001
PIA2_Buffer_t3                                     == 0x00CE
    b7_CE_CruiseVacuum = $%10000000
    b6_CE_CruiseVent = $%01000000
    b5_CE_bt5 = $%00100000
    b4_CE_ASD = $%00010000
    b3_CE_bt3 = $%00001000
    b2_CE_bt2 = $%00000100
    b1_CE_EGR = $%00000010
    b0_CE_bt0 = $%00000001
PIA3_Buffer_t3                                     == 0x00CF
    b7_CF_bt7 = $%10000000
    b6_CF_bt6 = $%01000000
    b5_CF_ChargeTemp = $%00100000
    b4_CF_CoolantTemp = $%00010000
    b3_CF_FuelMon = $%00001000
    b2_CF_bt2 = $%00000100
    b1_CF_bt1 = $%00000010
    b0_CF_bt0 = $%00000001
Ram_D0                                             == 0x00D0
Ram_D1                                             == 0x00D1
PTU_MapTemp                                        == 0x00D2
Ram_D3                                             == 0x00D3
Counter_PartThrottleUnlock                         == 0x00D4
b5C_IPL1_t3                                        == 0x00D5
    b7_D5_MapStuck = $%10000000
    b6_D5_TpsBadSignal = $%01000000
    b5_D5_BattNotCharging = $%00100000
    b4_D5_bt4 = $%00010000
    b3_D5_MapBadSignal = $%00001000
    b2_D5_bt2 = $%00000100
    b1_D5_BadCoolantTemp = $%00000010
    b0_D5_bt0 = $%00000001
b5D_IPL2_t3                                        == 0x00D6
    b7_D6_bt7 = $%10000000
    b6_D6_EMRLight = $%01000000
    b5_D6_bt5 = $%00100000
    b4_D6_MajorFault = $%00010000
    b3_D6_bt4 = $%00001000
    b2_D6_bt3 = $%00000100
    b1_D6_bt2 = $%00000010
    b0_D6_bt1 = $%00000001
b5d_IPL2                                           == 0x00D7
    b7_D7_bt7 = $%10000000
    b6_D7_bt6 = $%01000000
    b5_D7_InjFault = $%00100000
    b4_D7_BadBattVolts = $%00010000
    b3_D7_bt3 = $%00001000
    b2_D7_BadO2 = $%00000100
    b1_D7_bt1 = $%00000010
    b0_D7_bt0 = $%00000001
DRBPointer1                                        == 0x00D8
DRBPointer2                                        == 0x00D9
DRBPointer3                                        == 0x00DA
DRBSerialMode                                      == 0x00DB
    b7_DB_FastSerial = $%10000000
    b6_DB_ByteMode = $%01000000
    b5_DB_TestType3 = $%00100000
    b4_DB_TestType2 = $%00010000
    b3_DB_bit3 = $%00001000
    b2_DB_bit2 = $%00000100
    b1_DB_bit1 = $%00000010
    b0_DB_bit0 = $%00000001
ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB         == 0x00DC
ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB         == 0x00DD
ClearTheErrorTimer_0                               == 0x00DE
ClearTheErrorTimer_1                               == 0x00DF
ATMOffset                                          == 0x00E0
CCDFlags5                                          == 0x00E1
    b7_E1_e1b7 = $%10000000
    b6_E1_e1b6 = $%01000000
    b5_E1_AlarmDisable = $%00100000
    b4_E1_e1b4 = $%00010000
    b3_E1_bt3 = $%00001000
    b2_E1_bt2 = $%00000100
    b1_E1_bt1 = $%00000010
    b0_E1_bt0 = $%00000001
Ram_E2                                             == 0x00E2
EGRVar5_EGR_Temp_1                                 == 0x00E3
EGRVar3_ErrorCodeBufferHB                          == 0x00E4
Ram_E5                                             == 0x00E5
EGRVar6                                            == 0x00E6
EGRVar1_ErrorCodeCounter                           == 0x00E7
EGRVar7                                            == 0x00E8
EGRVar8                                            == 0x00E9
MapVolts_X                                         == 0x00EA
MapValue3                                          == 0x00EB
Ram_EC                                             == 0x00EC
BitFlags608D                                       == 0x00ED
BatteryVoltsRaw                                    == 0x00EE
A2DResults2Temp                                    == 0x00EF
BatVoltsDiagCounter                                == 0x00F0
Counter_O2Diagnostics                              == 0x00F1
Timer_O2MiddleDiagnostics                          == 0x00F2
Ram_F3                                             == 0x00F3
Ram_F4                                             == 0x00F4
CCDFlags4_BodyCompFlags4_X                         == 0x00F5
CCDFlags6                                          == 0x00F6
    b7_F6_ae2b7 = $%10000000
    b6_F6_ae2b6 = $%01000000
    b5_F6_ae2b5 = $%00100000
    b4_F6_ae2b4 = $%00010000
    b3_F6_ae2b3 = $%00001000
    b2_F6_ae2b2 = $%00000100
    b1_F6_ae2b1 = $%00000010
    b0_F6_ae2b0 = $%00000001
CCDTemp_HB                                         == 0x00F7
CCDFuelOutput_HB                                   == 0x00F8
CCDFuelOutput_LB                                   == 0x00F9
Counter_SpeedSensorInterrupt_HB_X                  == 0x00FA
CCDFlags4_tsbec                                    == 0x00FB
    b7_FB_bt7 = $%10000000
    b6_FB_bt6 = $%01000000
    b5_FB_adeb7 = $%00100000
    b4_FB_bt4 = $%00010000
    b3_FB_addb2 = $%00001000
    b2_FB_bt2 = $%00000100
    b1_FB_bt1 = $%00000010
    b0_FB_bt0 = $%00000001
Counter_InjectorCalc                               == 0x00FC
CounterUp_UsedInCalcFuel                           == 0x00FD
Ram_FE                                             == 0x00FE
Timer_MinimumFanRun                                == 0x00FF
SwitchPortAccessReg1                               == 0x6400
    b7_6400_bt7 = $%10000000
    b6_6400_sp1_B1Volt = $%01000000
    b5_6400_bt5 = $%00100000
    b4_6400_bt4 = $%00010000
    b3_6400_bt3 = $%00001000
    b2_6400_AlternatorField = $%00000100
    b1_6400_bt1 = $%00000010
    b0_6400_bt0 = $%00000001
SwitchPortAccessReg2                               == 0x6401
PIA_Ctrl_1                                         == 0x6402
PIA_Ctrl_2                                         == 0x6403
PIA_Ctrl_3                                         == 0x6404
PIA_Ctrl_4                                         == 0x6405
PIA_Ctrl_5                                         == 0x6406
InjectorPulsewidth_HB_Cyl1                         == 0x6408
InjectorPulsewidth_LB_Cyl1                         == 0x6409
InjectorPulsewidth_HB_Cyl2                         == 0x640A
InjectorPulsewidth_LB_Cyl2                         == 0x640B
InjectorPulsewidth_HB_Cyl3                         == 0x640C
InjectorPulsewidth_LB_Cyl3                         == 0x640D
InjectorPulsewidth_HB_Cyl4                         == 0x640E
InjectorPulsewidth_LB_Cyl4                         == 0x640F
PIA3_Buffer_2_t3                                   == 0x6440
CountdownTimerFromKeyOn                            == 0x6480
UNe_6481                                           == 0x6481
UNe_6482                                           == 0x6482
UNe_6483                                           == 0x6483
UNe_6484                                           == 0x6484
LDXi_6485                                          == 0x6485
FDRVar0                                            == 0x6486
FDRVar1                                            == 0x6487
FDRVar2                                            == 0x6488
FDRVar3                                            == 0x6489
STe_648A                                           == 0x648A
Temp5_t3                                           == 0x648B
DoubleTempB                                        == 0x648D
DoubleTempC                                        == 0x648F
LDXi_6490                                          == 0x6490
L00F5_t3                                           == 0x6491
Counter_IC1_Temp                                   == 0x6493
AntiDwellTime_HB                                   == 0x6495
AntiDwellTime_LB                                   == 0x6496
Counter_SomethingWithDistributor                   == 0x6497
CruiseControlVar4                                  == 0x6498
Temp0                                              == 0x6499
Temp1                                              == 0x649A
Temp2                                              == 0x649B
Temp3                                              == 0x649C
Temp4                                              == 0x649D
Temp5                                              == 0x649E
Temp6                                              == 0x649F
Temp7                                              == 0x64A0
MinimumTimerCountBeforeMainloopCanContinue2        == 0x64A1
UNe_64A3                                           == 0x64A3
CalculatedDwellTime                                == 0x64A5
Timer_AlternatorDutyCycle                          == 0x64A6
Timer_DelayBeforeUpdating_MINTHR                   == 0x64A7
CoolantVoltsTmp1                                   == 0x64A8
MapValue_t3                                        == 0x64A9
CoolantVoltsTmp2                                   == 0x64AA
SparkScatterIncrement                              == 0x64AB
SparkScatter                                       == 0x64AC
UNe_64AD                                           == 0x64AD
STe_64AE                                           == 0x64AE
Counter_ACControl1                                 == 0x64AF
DRBOffsetStored_HB                                 == 0x64B0
DRBOffsetStored_LB                                 == 0x64B1
LastCamFallingEdgeTime2                            == 0x64B2
BitFlags65_t3                                      == 0x64B3
Timer_ThermostatDiagnostics                        == 0x64B4
ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR        == 0x64B5
Temp1_t3                                           == 0x64B6
PIA2_Buffer_t3_Temp                                == 0x64B7
UNe_64B8                                           == 0x64B8
UNe_64B9                                           == 0x64B9
STe_64BA                                           == 0x64BA
STe_64BC                                           == 0x64BC
STe_64BD                                           == 0x64BD
STe_64BE                                           == 0x64BE
STe_64C0                                           == 0x64C0
UNe_64C1                                           == 0x64C1
Ram64c3                                            == 0x64C3
Ram64c4                                            == 0x64C4
STe_64C6                                           == 0x64C6
STe_64C7                                           == 0x64C7
STe_64C8                                           == 0x64C8
DRB_ProgramModeFlag                                == 0x64C9
DRB_SpecialProgramRoutine                          == 0x64CB
TopOfStack                                         == 0x64FF
M99_AAAA                                           == 0xAAAA
M99_D555                                           == 0xD555
 
PORTA_PortA                                        == 0x1000
;   PortA_bit7      = $%10000000
;   PortA_bit6      = $%01000000
;   PortA_InjectorB      = $%00100000
;   PortA_InjectorA      = $%00010000
;   PortA_IgnCoil      = $%00001000
;   PortA_DistRef         = $%00000100
;   PortA_Speedo      = $%00000010
;   PortA_bit0      = $%00000001
CPU_L1001_Reserved                                 == 0x1001
PIOC_Parallel_IO_Ctrl                              == 0x1002
PORTC_PortC                                        == 0x1003
PORTB_PortB                                        == 0x1004
PORTCL_PortCL                                      == 0x1005
CPU_L1006Reserved                                  == 0x1006
DDRC_PortC_DataDirection                           == 0x1007
PORTD_PortD                                        == 0x1008
DDRD_PortD_DataDirection                           == 0x1009
PORTE_PortE                                        == 0x100A
CFORC_TimerForceCompare                            == 0x100B
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
OC1M_OutputCompare1Mask                            == 0x100C
;   Bit 7 - OC1M7:
;   Bit 6 - OC1M6:
;   Bit 5 - OC1M5:
;   Bit 4 - OC1M4:
;   Bit 3 - OC1M3:
;   Bit 2 - 0
;   Bit 1 - 0
;   Bit 0 - 0
OC1D_OutputCompare1D                               == 0x100D
;   Bit 7 - OC1D7: references PA7/PA1
;   Bit 6 - OC1D6: references PA6/OC2
;   Bit 5 - OC1D5: references PA5/OC3
;   Bit 4 - OC1D4: references PA4/OC4
;   Bit 3 - OC1D3: references PA3/PC5
;   Bit 2 - 0
;   Bit 1 - 0
;   Bit 0 - 0
TCNT_Counter_FreeRunning16bit                      == 0x100E
TIC1_Counter_IC1_CamSensor                         == 0x1010
TIC2_Counter_IC2_Speedometer                       == 0x1012
TIC3_Counter_IC3_CrankSensor                       == 0x1014
TOC1_Counter_OC1                                   == 0x1016
TOC2_Counter_OC2                                   == 0x1018
TOC3_Counter_OC3                                   == 0x101A
TOC4_Counter_OC4                                   == 0x101C
TOC5_Counter_OC5_Dwell                             == 0x101E
TCTL1_TimerControlReg1                             == 0x1020
;   Bit 7 - OM2:     M0 L0 = OCx does not affect pin (OC1 still may)
;   Bit 6 - OL2:     M0 L1 = Toggle OCx pin on successful compare
;   Bit 5 - OM3:     M1 L0 = Clear OCx pin on successful compare
;   Bit 4 - OL3:     M1 L1 = Set OCx pin on successful compare
;   Bit 3 - OM4:
;   Bit 2 - OL4:
;   Bit 1 - OM5:
;   Bit 0 - OL5:
TCTL2_TimerControlReg2                             == 0x1021
;   determines which edge to detect - 2 bits determine mode
;   00=no capture 01=rising edge 10=falling edge 11=both edges
;   bits 7/6 not used
;   bits 5/4 IC1
;   bits 3/2 IC2
;   bits 1/0 IC3
TMSK1_TimerInterruptMask1                          == 0x1022
;   when bit is set generates hardware interrupt when corresponding 0x1023 bit is by edge
;   when bit is clr program must read 0x1023 bit to determine if edge has been detected
;   OC1               = $%10000000
;   OC2               = $%01000000
;   OC3               = $%00100000
;   OC4               = $%00010000
;   OC5Dwell          = $%00001000
;   IC1Distributor    = $%00000100
;   IC2SDSSignal      = $%00000010
;   InputCompare3     = $%00000001
TFLG1_TimerInterruptFlag1                          == 0x1023
;   bit is set whenever edge is detected on an IC pin
;   can also manually set these pins if you want to trigger interrupts
;   OC1               = $%10000000
;   OC2               = $%01000000
;   OC3               = $%00100000
;   OC4               = $%00010000
;   OC5Dwell          = $%00001000
;   IC1Distributor    = $%00000100
;   IC2SDSSignal      = $%00000010
;   IC3               = $%00000001
;   ********************************************************************************
;   * when an edge (as set 0x1021) is detected on an ICx pin the 16bit value of the*
;   * free running counter is captured in latch locations 0x1010-(IC1) 0x1012-(IC2)*
;   * or 0x1014-(IC3).  The corresponding status flag bit(s) are then set in reg   *
;   * 0x1023.  if the interrupt mask 0x1022 is set for that IC pin then a hardware *
;   * interrupt is generated and the related subroutine is run.  If the mask is not*
;   * set then the program must read the status flag bit to determine if an edge   *
;   * has been detected.                                                           *
;   ********************************************************************************
TMSK2_TimerInterruptMask2                          == 0x1024
;   Bit 7 - TOI:  Timer Overflow Interrupt Enable
;   Bit 6 - RTII:  Real Time Interrupt Enable
;   Bit 5 - PAOVI: Pulse accumulator overflow interrupt enable
;   Bit 4 - PAII:  Pulse accumulator input edge interrupt enable
;   Bit 3 - 0
;   Bit 2 - 0
;   Bit 1 - PR1:  Timer Prescaler 00=1 (500nS) 01=4 (2uS) 10=8 (4uS) 11=16 (8uS)
;   Bit 0 - PR0:
;   TCNT count value =  is 1/(2000000 / prescaler)
TFLG2_TimerInterruptFlag2                          == 0x1025
PACTL_PulseAccumulatorControl                      == 0x1026
;   Bit 7 - TOI:  Timer Overflow Interrupt Enable
;   Bit 6 - RTII:  Real Time Interrupt Enable
;   Bit 5 - PAOVI: Pulse accumulator overflow interrupt enable
;   Bit 4 - PAII:  Pulse accumulator input edge interrupt enable
;   Bit 3 - 0
;   Bit 2 - 0
;   Bit 1 - PR1:  Timer Prescaler 00=1 (4.096mS) 01=2 (8.192mS) 10=4 (16.384mS) 11=8 (32.768mS)
;   Bit 0 - PR0:
;   rti timer value = 1 /(2Mhtz / 2^13 / prescaler)
PACNT_PulseAccumulatorCounter                      == 0x1027
SPCR_SerialPeripheralControl                       == 0x1028
SPSR_SerialPeripheralStatus                        == 0x1029
;   Bit 7 - SPIF - SPI Transfer complete flag
;   Bit 6 - WCOL - Write collision error flag
;   Bit 5 - 0
;   Bit 4 - MODF - Mode fault error flag
;   Bit 3 - 0
;   Bit 2 - 0
;   Bit 1 - 0
;   Bit 0 - 0
SPDR_SerialPeripheralDataIO                        == 0x102A
BAUD_SerialBaudRate                                == 0x102B
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
SCCR1_SerialControlReg1                            == 0x102C
SCCR2_SerialControlReg2                            == 0x102D
SCSR_SerialStatus                                  == 0x102E
SCDR_SerialData                                    == 0x102F
ADCTL_A2DControlReg                                == 0x1030
;   determines what sensor group to read into a2dresults channels
;   Bit 7 - CCF: Conversions Complete Flag
;   Bit 6 - 0
;   Bit 5 - SCAN: 0=perform 4 conversions. 1=continuous conversions
;   Bit 4 - MULT: 0=single channel
;   Bit 3 - CD: These bits select which channel(s) to convert
;   Bit 2 - CC:
;   Bit 1 - CB:
;   Bit 0 - CA:
ADR1_A2DResults1                                   == 0x1031
ADR2_A2DResults2                                   == 0x1032
ADR3_A2DResults3                                   == 0x1033
ADR4_A2DResults4                                   == 0x1034
BPROT_BlockProtReg                                 == 0x1035
OPTION_SysConfigOptionReg                          == 0x1039
;   Bit 7 - ADPU:
;   Bit 6 - CSEL: 1=use alternate charge pump for EEPROM and A/D
;   Bit 5 - IRQE: 1=configure IRQ for edge sensitive operation only
;   Bit 4 - DLY: 1=enable oscillator startup delat (designed to allow crystal to stabilize)
;   Bit 3 - CME:
;   Bit 2 - 0
;   Bit 1 - CR1: Watchdog Timer Rate Select
;   Bit 0 - CR0: at 8MHz 00=1 (16.384ms) 01=4 (65.536ms) 10=16 (262.14ms) 11=64 (1.049s)
;   COP count value = 1 / (2000000 / 2^15 / prescaler)
COPRST_ArmOCToggleAndResetCopTimerReg              == 0x103A
PPROG_EEPROMControlReg                             == 0x103B
;   Bit 7 - ODD
;   Bit 6 - EVEN
;   Bit 5 - 0
;   Bit 4 - BYTE
;   Bit 3 - ROW
;   Bit 2 - ERASE
;   Bit 1 - EELAT
;   Bit 0 - EEPGM
HPRIO_HighPriorityInterruptMask                    == 0x103C
;   Bit 7 - RBOOT: Read Bootstrap ROM (can be written only while SMOD=1) 1=bootstrap ROM at $bf40-$bfff
;   Bit 6 - SMOD:  Special Mode (can be written to zero but not back to one) 1=special mode in effect
;   Bit 5 - MDA:  Mode A Select (can be written only while SMOD=1) 1=normal expanded
;   Bit 4 - IRV:  Internal Read Visibility (can be written only while SMOD=1) 0=data from internal reads not visible on bus
;   Bit 3 - PSEL3: for selecting which interrupt is highest priority
;   Bit 2 - PSEL2:
;   Bit 1 - PSEL1:
;   Bit 0 - PSEL0:
INIT_SysInit                                       == 0x103D
;   Bit 7 - RAM3: Ram3:0 specify the upper hex digit of the RAM address
;   Bit 6 - RAM2:        the position of the RAM in the memory map. This allows RAM
;   Bit 5 - RAM1:        to be moved for example to F000-F0FF (default is 0000)
;   Bit 4 - RAM0:
;   Bit 3 - REG3: Reg3:0 specify the upper hex digit of the Registers address just
;   Bit 2 - REG2:        like the RAM. (default is 0001)
;   Bit 1 - REG1:
;   Bit 0 - REG0:
TEST1_Test                                         == 0x103E
;   Bit 7 - TILOP:
;   Bit 6 - 0
;   Bit 5 - OCCR:
;   Bit 4 - CBYP:
;   Bit 3 - DISR:
;   Bit 2 - FCM:
;   Bit 1 - FCOP:
;   Bit 0 - TCON:
CONFIG_SystemConfigReg                             == 0x103F
 
;beginning of data starts here
.include /CalDataFile/
 
.org CodeOrg
.msg "Assembling Code..."
 
V_XIRQ_hardware_Interrupt_vector:
          ldab    #0x01 ;(00000001)                        ;Load Accumulator B
          bra     Lbl_9416                                 ;Branch Always
V_COP_Watchdog_Timeout_vector:
          ldab    #0x02 ;(00000010)                        ;Load Accumulator B
          bra     Lbl_9416                                 ;Branch Always
V_Illegal_Opcode_vector:
          ldab    #0x04 ;(00000100)                        ;Load Accumulator B
          bra     Lbl_9416                                 ;Branch Always
V_SCI_Interrupt_vector:
          ldab    #0x10 ;(00010000)                        ;Load Accumulator B
          bra     Lbl_9416                                 ;Branch Always
V_SPIE_Flag_Interrupt_vector:
          ldab    #0x20 ;(00100000)                        ;Load Accumulator B
          bra     Lbl_9416                                 ;Branch Always
V_SWI_Software_Interrupt_vector:
          ldab    #0x40 ;(01000000)                        ;Load Accumulator B
Lbl_9416: sei                                              ;Set Mask Disable Int
          orab    #0x80 ;(10000000)                        ;OR Accumulator B (Inclusive)
          stab    Temp0                                    ;Store Accumulator B
          ldd     #0x02A9                                  ;Load Double Accumulator D
          staa    TMSK2_TimerInterruptMask2                ;Store Accumulator A
;   0000 0010 sets prescaler for main counter to 8
          stab    OPTION_SysConfigOptionReg                ;Store Accumulator B
          ldaa    #0xF8 ;(11111000)                        ;Load Accumulator A
          staa    BPROT_BlockProtReg                       ;Store Accumulator A
          tsx                                              ;Transfer Stack Pointer to X
          ldd     0x07, X                                  ;Load Double Accumulator D
          std     Ram_01                                   ;Store Accumulator D
          std     Temp1                                    ;Store Accumulator D
          lds     #0x64FF                                  ;Load Stack Pointer
          clr     MinimumTimerCountBeforeMainloopCanContinue ;Clear Memory Byte
          clr     Ram_04                                   ;Clear Memory Byte
          bra     Lbl_94A2                                 ;Branch Always
Interrupt_ClockMonFail:
          sei                                              ;Set Mask Disable Int
          lds     #0x64FF                                  ;Load Stack Pointer
          ldd     #0x02A9                                  ;Load Double Accumulator D
          staa    TMSK2_TimerInterruptMask2                ;Store Accumulator A
          stab    OPTION_SysConfigOptionReg                ;Store Accumulator B
          ldaa    #0xF8 ;(11111000)                        ;Load Accumulator A
          staa    BPROT_BlockProtReg                       ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          staa    Temp0                                    ;Store Accumulator A
          std     Temp1                                    ;Store Accumulator D
          ldx     #Ram_00                                  ;Load Index Register X
Lbl_945A: ldaa    0x00, X                                  ;Load Accumulator A
          cmpa    #0x00 ;(00000000)                        ;Compare A to Memory
          bne     Lbl_9468                                 ;Branch if Not = Zero
          inx                                              ;Increment Index Register X
          cpx     #0x0020                                  ;Compare X to Memory 16-Bit
          bcs     Lbl_945A                                 ;Branch if Lower
          bra     Lbl_94A2                                 ;Branch Always
Lbl_9468: ldd     Counter_SpeedSensorInterrupt_HB          ;Load Double Accumulator D
          tba                                              ;Transfer B to A
          comb                                             ;1's Complement B
          std     MinimumTimerCountBeforeMainloopCanContinue ;Store Accumulator D
          bra     Lbl_94A2                                 ;Branch Always
V_ResetVector:
          sei                                              ;Set Mask Disable Int
          lds     #0x64FF                                  ;Load Stack Pointer
          ldd     #0x02A9                                  ;Load Double Accumulator D
          staa    TMSK2_TimerInterruptMask2                ;Store Accumulator A
          stab    OPTION_SysConfigOptionReg                ;Store Accumulator B
          ldaa    #0xF8 ;(11111000)                        ;Load Accumulator A
          staa    BPROT_BlockProtReg                       ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          staa    Temp0                                    ;Store Accumulator A
          std     Temp1                                    ;Store Accumulator D
          ldd     Counter_SpeedSensorInterrupt_HB          ;Load Double Accumulator D
          tba                                              ;Transfer B to A
          comb                                             ;1's Complement B
          xgdy                                             ;Exchange D with Y
          jsr     CountRamValuesFrom05to20                 ;Jump to Subroutine
          cmpd    MinimumTimerCountBeforeMainloopCanContinue ;Compare D to Memory 16-Bit
          beq     Lbl_949C                                 ;Branch if = Zero
          ldy     #Ram_00                                  ;Load Index Register Y
Lbl_949C: sty     MinimumTimerCountBeforeMainloopCanContinue ;Store Index Register Y
          bset    *Ram_05, #$%00001010                     ;Set Bit(s)
Lbl_94A2: jsr     Lbl_E6D7                                 ;Jump to Subroutine
          ldaa    #0x90 ;(10010000)                        ;Load Accumulator A
          tap                                              ;Transfer A to CC Register
          ldab    #0x0F ;(00001111)                        ;Load Accumulator B
          ldaa    TL_CONF01 ;(0x41/65.00 Y units)          ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_94B3                                 ;Branch if = Zero
          ldab    #0x06 ;(00000110)                        ;Load Accumulator B
Lbl_94B3: stab    HPRIO_HighPriorityInterruptMask          ;Store Accumulator B
          clr     OC1M_OutputCompare1Mask                  ;Clear Memory Byte
          clr     OC1D_OutputCompare1D                     ;Clear Memory Byte
          ldd     #0x00FF                                  ;Load Double Accumulator D
          staa    TMSK1_TimerInterruptMask1                ;Store Accumulator A
;   set IF1 to require polling
          stab    TFLG1_TimerInterruptFlag1                ;Store Accumulator B
;   set all IF1 bits
          ldaa    #0x1A ;(00011010)                        ;Load Accumulator A
          staa    TCTL2_TimerControlReg2                   ;Store Accumulator A
          ldd     #0xAA78                                  ;Load Double Accumulator D
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   ign oc2 toggle oc3 clr oc4 oc5
;   or capture 1 rising edge 2 and 3 falling edge
          stab    CFORC_TimerForceCompare                  ;Store Accumulator B
;   clr oc2 oc3 oc4 oc5
          ldd     #0x7520                                  ;Load Double Accumulator D
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          stab    PORTD_PortD                              ;Store Accumulator B
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
          ldab    TL_IDENT1 ;(0x11/17.00 Y units)          ;Load Accumulator B
          cmpb    #0x11 ;(00010001)                        ;Compare B to Memory
          beq     Lbl_94F1                                 ;Branch if = Zero
          ldab    #0x8F ;(10001111)                        ;Load Accumulator B
          stab    PIA_Ctrl_1                               ;Store Accumulator B
          bra     Lbl_94F6                                 ;Branch Always
Lbl_94F1: ldab    #0x0F ;(00001111)                        ;Load Accumulator B
          stab    PIA_Ctrl_1                               ;Store Accumulator B
Lbl_94F6: ldab    PIA_Ctrl_1                               ;Load Accumulator B
          andb    #0xF7 ;(11110111)                        ;AND B with Memory
          stab    PIA_Ctrl_1                               ;Store Accumulator B
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldd     #0x3A55                                  ;Load Double Accumulator D
          staa    DDRD_PortD_DataDirection                 ;Store Accumulator A
          ldaa    SPSR_SerialPeripheralStatus              ;Load Accumulator A
          stab    SPCR_SerialPeripheralControl             ;Store Accumulator B
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldd     #0xF870                                  ;Load Double Accumulator D
          staa    PIA_Ctrl_5                               ;Store Accumulator A
          stab    PACTL_PulseAccumulatorControl            ;Store Accumulator B
          clra                                             ;Clear Accumulator A
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          staa    PIA_Ctrl_2                               ;Store Accumulator A
          ldd     #0x0008                                  ;Load Double Accumulator D
          std     InjectorPulsewidth_HB_Cyl1               ;Store Accumulator D
          std     InjectorPulsewidth_HB_Cyl2               ;Store Accumulator D
          std     InjectorPulsewidth_HB_Cyl3               ;Store Accumulator D
          std     InjectorPulsewidth_HB_Cyl4               ;Store Accumulator D
          ldd     #0x0C22                                  ;Load Double Accumulator D
          staa    SCCR2_SerialControlReg2                  ;Store Accumulator A
          stab    BAUD_SerialBaudRate                      ;Store Accumulator B
          ldd     SCSR_SerialStatus                        ;Load Double Accumulator D
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          clr     SCCR1_SerialControlReg1                  ;Clear Memory Byte
          ldx     #IPL1                                    ;Load Index Register X
          ldd     MinimumTimerCountBeforeMainloopCanContinue ;Load Double Accumulator D
          coma                                             ;1's Complement A
          cba                                              ;Compare A to B
          beq     Lbl_957C                                 ;Branch if = Zero
          ldab    #0x08 ;(00001000)                        ;Load Accumulator B
          ldaa    Temp0                                    ;Load Accumulator A
          bpl     Lbl_9556                                 ;Branch if Plus
          ldab    #0x80 ;(10000000)                        ;Load Accumulator B
Lbl_9556: stab    Ram_05                                   ;Store Accumulator B
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          staa    Ram_00                                   ;Store Accumulator A
          ldd     Temp1                                    ;Load Double Accumulator D
          std     Ram_01                                   ;Store Accumulator D
          ldaa    #0x5C ;(01011100)                        ;Load Accumulator A
          staa    LowestSessionTpsVolts                    ;Store Accumulator A
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          staa    Timer_DacalCountdown                     ;Store Accumulator A
          staa    Ram_0B                                   ;Store Accumulator A
          staa    ValueFromAdaptiveMemory                  ;Store Accumulator A
          ldaa    TL_TL_88E4 ;(0x20/32.00 Y units)         ;Load Accumulator A
          staa    Ram_0C                                   ;Store Accumulator A
          ldd     #0x40DF                                  ;Load Double Accumulator D
          staa    BitFlags36_t3                            ;Store Accumulator A
          stab    CurrentAisPosition                       ;Store Accumulator B
          ldx     #Counter_SpeedSensorInterrupt_HB         ;Load Index Register X
Lbl_957C: ldy     #0x0594                                  ;Load Index Register Y
;   wait for 1428 x 7 cycles * .0000005 per cycle = 5mS
Lbl_9580: dey                                              ;Decrement Index Register Y
          bne     Lbl_9580                                 ;Branch if Not = Zero
          dex                                              ;Decrement Index Register X
          clrb                                             ;Clear Accumulator B
ClearRam20toFF:
          inx                                              ;Increment Index Register X
          stab    0x00, X                                  ;Store Accumulator B
          cpx     #0x00FF                                  ;Compare X to Memory 16-Bit
          bcs     ClearRam20toFF                           ;Branch if Lower
          ldaa    TL_CONF01 ;(0x41/65.00 Y units)          ;Load Accumulator A
          staa    BitFlags27                               ;Store Accumulator A
;   store 01000001 to bit flags 27
          ldx     #CountdownTimerFromKeyOn                 ;Load Index Register X
          dex                                              ;Decrement Index Register X
          clrb                                             ;Clear Accumulator B
ClearRam6480to64c8:
          inx                                              ;Increment Index Register X
          stab    0x00, X                                  ;Store Accumulator B
          cpx     #0x64C8                                  ;Compare X to Memory 16-Bit
          bcs     ClearRam6480to64c8                       ;Branch if Lower
          ldaa    #0xE5 ;(11100101)                        ;Load Accumulator A
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldy     #0x0594                                  ;Load Index Register Y
;   wait for 1428 x 7 cycles * .0000005 per cycle = 5mS
Lbl_95AE: dey                                              ;Decrement Index Register Y
          bne     Lbl_95AE                                 ;Branch if Not = Zero
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_95B7: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_95B7                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          staa    CoolantVoltsTmp2                         ;Store Accumulator A
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldy     #0x0476                                  ;Load Index Register Y
;   wait for 1142 x 7 cycles * .0000005 per cycle = 4mS
Lbl_95D2: dey                                              ;Decrement Index Register Y
          bne     Lbl_95D2                                 ;Branch if Not = Zero
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_95DB: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_95DB                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          staa    CoolantVoltsTmp1                         ;Store Accumulator A
          ldaa    CoolantVoltsTmp1                         ;Load Accumulator A
          ldab    CoolantVoltsTmp2                         ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          std     Temp1                                    ;Store Accumulator D
          ldab    CoolantVoltsTmp1                         ;Load Accumulator B
          subb    CoolantVoltsTmp2                         ;Subtract Memory from B
          bls     Lbl_9613                                 ;Branch if Lower or Same
          clra                                             ;Clear Accumulator A
          xgdx                                             ;Exchange D with X
          ldd     Temp1                                    ;Load Double Accumulator D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
          abx                                              ;Add B to X
          ldd     Temp1                                    ;Load Double Accumulator D
          idiv                                             ;Int Div D/X X=q D=R
          xgdx                                             ;Exchange D with X
          tsta                                             ;Test for Zero or Minus
          bne     Lbl_9613                                 ;Branch if Not = Zero
          tba                                              ;Transfer B to A
          ldx     #TL_TempForScaleAmbientA2D               ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          bra     Lbl_9615                                 ;Branch Always
Lbl_9613: ldaa    #0xC1 ;(11000001)                        ;Load Accumulator A
Lbl_9615: staa    AmbientAirTempVolts2                     ;Store Accumulator A
          jsr     bcf2_MM                                  ;Jump to Subroutine
          jsr     DetermineTargetBatteryVoltage            ;Jump to Subroutine
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldy     #0x0594                                  ;Load Index Register Y
;   wait for 1428 x 7 cycles * .0000005 per cycle = 5mS
Lbl_962D: dey                                              ;Decrement Index Register Y
          bne     Lbl_962D                                 ;Branch if Not = Zero
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_9636: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_9636                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cmpa    #0x40 ;(01000000)                        ;Compare A to Memory
;   compare coolant volts with 0x40 (-85 deg)
          bcc     Lbl_964B                                 ;Branch if Higher or Same
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
Lbl_964B: jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldy     #0x0594                                  ;Load Index Register Y
;   wait for 1428 x 7 cycles * .0000005 per cycle = 5mS
Lbl_9652: dey                                              ;Decrement Index Register Y
          bne     Lbl_9652                                 ;Branch if Not = Zero
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_965B: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_965B                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          staa    LastCoolantTempVolts                     ;Store Accumulator A
Lbl_9665: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_9665                                 ;Branch if Plus
          ldaa    ADR2_A2DResults2                         ;Load Accumulator A
          cmpa    #0x40 ;(01000000)                        ;Compare A to Memory
;   1.2 volts
          bcc     Lbl_967A                                 ;Branch if Higher or Same
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0xDF ;(11011111)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
Lbl_967A: jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldy     #0x0594                                  ;Load Index Register Y
;   wait for 1428 x 7 cycles * .0000005 per cycle = 5mS
Lbl_9681: dey                                              ;Decrement Index Register Y
          bne     Lbl_9681                                 ;Branch if Not = Zero
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_968A: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_968A                                 ;Branch if Plus
          ldab    ADR2_A2DResults2                         ;Load Accumulator B
          stab    LastChargeTempVolts                      ;Store Accumulator B
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
Lbl_969C: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_969C                                 ;Branch if Plus
          jsr     ReadA2DBattVolts                         ;Jump to Subroutine
          staa    BatteryVolts                             ;Store Accumulator A
          ldab    ADR4_A2DResults4                         ;Load Accumulator B
          stab    LastTpsVolts                             ;Store Accumulator B
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          jsr     ConvertMAPVoltsToValue                   ;Jump to Subroutine
          staa    MapValue                                 ;Store Accumulator A
          clrb                                             ;Clear Accumulator B
          std     MapValue2                                ;Store Accumulator D
          staa    MapValue_t3                              ;Store Accumulator A
          brclr   *Ram_05, #$%00001000, Lbl_96C8           ;Branch if Bit(s) Clear
          cmpa    #0x80 ;(10000000)                        ;Compare A to Memory
          bcc     Lbl_96C3                                 ;Branch if Higher or Same
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
Lbl_96C3: staa    BaroPressure                             ;Store Accumulator A
          bclr    *Ram_05, #$%00001000                     ;Clear Bits(s)
Lbl_96C8: ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          staa    MapVolts_X                               ;Store Accumulator A
          staa    MapValue3                                ;Store Accumulator A
          brclr   *Ram_05, #$%00000010, Lbl_96F9           ;Branch if Bit(s) Clear
          brclr   *Ram_05, #$%00000100, Lbl_96F9           ;Branch if Bit(s) Clear
          cmpa    TL_MapSensorMiddleLimit ;(0x66/2.00 volts)  ;Compare A to Memory
          bcc     Lbl_96F9                                 ;Branch if Higher or Same
          ldab    #0x02 ;(00000010)                        ;Load Accumulator B
Lbl_96DE: ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_96E3: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_96E3                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cmpa    TL_MapSensorMiddleLimit ;(0x66/2.00 volts)  ;Compare A to Memory
          bcc     Lbl_96F9                                 ;Branch if Higher or Same
          decb                                             ;Decrement Accumulator B
          bne     Lbl_96DE                                 ;Branch if Not = Zero
          bset    *b5C_IPL1_t3, #b3_D5_MapBadSignal ;(00001000)  ;Set Bit(s)
          bset    *BitFlags2e, #b7_2E_MapMaybe ;(10000000)  ;Set Bit(s)
Lbl_96F9: bclr    *Ram_05, #$%00000010                     ;Clear Bits(s)
          ldaa    Ram_05                                   ;Load Accumulator A
          anda    #0xC0 ;(11000000)                        ;AND A with Memory
          cmpa    #0x80 ;(10000000)                        ;Compare A to Memory
          bne     Lbl_971A                                 ;Branch if Not = Zero
          ldd     #0x0AFF                                  ;Load Double Accumulator D
          std     DRBPointer1                              ;Store Accumulator D
          ldaa    #0xF1 ;(11110001)                        ;Load Accumulator A
          staa    LastCamFallingEdgeTime2                  ;Store Accumulator A
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
          ldaa    BitFlags27                               ;Load Accumulator A
          bita    #0xC0 ;(11000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_9732                                 ;Branch if = Zero
          ldab    #0xFB ;(11111011)                        ;Load Accumulator B
          bra     Lbl_9732                                 ;Branch Always
Lbl_971A: ldaa    Ram_05                                   ;Load Accumulator A
          adda    #0x40 ;(01000000)                        ;Add Memory to A
          staa    Ram_05                                   ;Store Accumulator A
          ldaa    PIA_Ctrl_1                               ;Load Accumulator A
          oraa    #0x04 ;(00000100)                        ;OR Accumulator A (Inclusive)
          staa    PIA_Ctrl_1                               ;Store Accumulator A
          ldab    #0xEF ;(11101111)                        ;Load Accumulator B
          ldaa    BitFlags27                               ;Load Accumulator A
          bita    #0xC0 ;(11000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_9732                                 ;Branch if = Zero
          ldab    #0xEB ;(11101011)                        ;Load Accumulator B
Lbl_9732: stab    PIA2_Buffer_t3                           ;Store Accumulator B
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0xFB ;(11111011)                        ;AND A with Memory
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          cmpb    SPSR_SerialPeripheralStatus              ;Compare B to Memory
          stab    SPDR_SerialPeripheralDataIO              ;Store Accumulator B
          mul                                              ;Multiply A x B = D
          mul                                              ;Multiply A x B = D
          nop                                              ;No Operation
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x04 ;(00000100)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          ldab    SPCR_SerialPeripheralControl             ;Load Accumulator B
          andb    #0xFC ;(11111100)                        ;AND B with Memory
          stab    SPCR_SerialPeripheralControl             ;Store Accumulator B
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldx     #0x0535                                  ;Load Index Register X
Lbl_975D: ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          bne     Lbl_9767                                 ;Branch if Not = Zero
          dex                                              ;Decrement Index Register X
          bne     Lbl_975D                                 ;Branch if Not = Zero
Lbl_9767: jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldaa    PIA_Ctrl_1                               ;Load Accumulator A
          anda    #0xFB ;(11111011)                        ;AND A with Memory
          staa    PIA_Ctrl_1                               ;Store Accumulator A
          ldaa    Timer_DelayBeforeUpdating_MINTHR         ;Load Accumulator A
          oraa    #0x03 ;(00000011)                        ;OR Accumulator A (Inclusive)
          staa    Timer_DelayBeforeUpdating_MINTHR         ;Store Accumulator A
          bset    *Ram_05, #$%00000001                     ;Set Bit(s)
          bset    *BitFlags24, #b4_24_BadSpeedo1 ;(00010000)  ;Set Bit(s)
          bset    *ACClutchToggleVar, #$%11111111          ;Set Bit(s)
          bset    *BitFlags66_t3, #b4_22_bt4 ;(00010000)   ;Set Bit(s)
          bset    *BitFlags68_t3, #b6_25_AcClutch| b2_25_AIS ;(01000100)  ;Set Bit(s)
          bset    *BitFlags36_t3, #b5_7_bt5 ;(00100000)    ;Set Bit(s)
          bclr    *BitFlags36_t3, #b4_7_bt4 ;(00010000)    ;Clear Bits(s)
          bset    *CruiseStatus_1, #$%10100000             ;Set Bit(s)
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          staa    Counter_Cruise_1                         ;Store Accumulator A
          ldd     #0xFFFF                                  ;Load Double Accumulator D
          std     DistributorFallingEdgePulsewidth_HB      ;Store Accumulator D
          std     Counter_TimerPastHalfwayBetweenCamPulses ;Store Accumulator D
          std     Counter_TimerRegHalfOverflowBetweenSpeedoPulses ;Store Accumulator D
          std     SpeedoSensorPulsewidth_HB                ;Store Accumulator D
          staa    Ram_4C                                   ;Store Accumulator A
          ldaa    MapValue                                 ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          std     MapValueTemp1                            ;Store Accumulator D
          std     MapValueTemp2                            ;Store Accumulator D
          std     MapValueTemp3                            ;Store Accumulator D
          ldaa    LastTpsVolts                             ;Load Accumulator A
          std     TPSVoltsTemp_A                           ;Store Accumulator D
          std     TPSVoltsTemp_B                           ;Store Accumulator D
          ldx     #0xB616                                  ;Load Index Register X
          ldaa    0x00, X                                  ;Load Accumulator A
          cmpa    #0x4A ;(01001010)                        ;Compare A to Memory
          bne     Lbl_97C3                                 ;Branch if Not = Zero
          coma                                             ;1's Complement A
          cmpa    0x01, X                                  ;Compare A to Memory
          bne     Lbl_97C3                                 ;Branch if Not = Zero
          bset    *BitFlags2d, #b2_2D_a6cb1 ;(00000100)    ;Set Bit(s)
Lbl_97C3: ldx     #0xB6E1                                  ;Load Index Register X
          ldaa    0x00, X                                  ;Load Accumulator A
          cmpa    #0x4A ;(01001010)                        ;Compare A to Memory
          bne     Lbl_97D4                                 ;Branch if Not = Zero
          coma                                             ;1's Complement A
          cmpa    0x01, X                                  ;Compare A to Memory
          bne     Lbl_97D4                                 ;Branch if Not = Zero
          bset    *BitFlags21, #b1_21_bt1 ;(00000010)      ;Set Bit(s)
Lbl_97D4: ldaa    LastCoolantTempVolts                     ;Load Accumulator A
          ldx     #TL_TempForHotScaleA2D                   ;Load Index Register X
          brclr   *PIA3_Buffer_t3, #b4_CF_CoolantTemp, FilterAndStoreCoolantTemp ;(00010000)  ;Branch if Bit(s) Clear
          ldx     #TL_TempForColdScaleFromA2D              ;Load Index Register X
FilterAndStoreCoolantTemp:
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    CoolantTemp                              ;Store Accumulator A
          ldaa    LastCoolantTempVolts                     ;Load Accumulator A
          cmpa    TL_CoolantTempOutOfRangeHigh ;(0xFD/256.39 deg)  ;Compare A to Memory
          bcc     UseDefaultCoolantTemp                    ;Branch if Higher or Same
          cmpa    TL_CoolantTempOutOfRangeLow ;(0x1A/-153.10 deg)  ;Compare A to Memory
          bcs     UseDefaultCoolantTemp                    ;Branch if Lower
          ldaa    CoolantTemp                              ;Load Accumulator A
          bra     SubstituteCoolantForChargeTemp           ;Branch Always
UseDefaultCoolantTemp:
          ldaa    TL_DefaultCoolantTempRaw ;(0xA8/103.06 deg)  ;Load Accumulator A
SubstituteCoolantForChargeTemp:
          staa    CoolantTemp                              ;Store Accumulator A
          ldx     #TL_ScaleCoolantTemp                     ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    CoolantTemp_fromTable_Scaled             ;Store Accumulator A
          staa    PreviousCoolantTemp_fromTable_Scaled     ;Store Accumulator A
          ldaa    LastChargeTempVolts                      ;Load Accumulator A
          ldx     #TL_TempForHotScaleA2D                   ;Load Index Register X
          brclr   *PIA3_Buffer_t3, #b5_CF_ChargeTemp, FilterAndStoreChargeTemp ;(00100000)  ;Branch if Bit(s) Clear
          ldx     #TL_TempForColdScaleFromA2D              ;Load Index Register X
FilterAndStoreChargeTemp:
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    ChargeTempVolts                          ;Store Accumulator A
          ldaa    LastChargeTempVolts                      ;Load Accumulator A
          cmpa    TL_ChargeTempOutOfRangeHigh ;(0xFD/256.39 deg)  ;Compare A to Memory
          bcc     UseDefaultChargeTemp                     ;Branch if Higher or Same
          cmpa    TL_ChargeTempOutOfRangeLow ;(0x1A/-153.10 deg)  ;Compare A to Memory
          bcs     UseDefaultChargeTemp                     ;Branch if Lower
          ldaa    ChargeTempVolts                          ;Load Accumulator A
          bra     StoreChargeTempValue2                    ;Branch Always
UseDefaultChargeTemp:
          ldaa    TL_DefaultChargeTemp_Limpin ;(0xA8/103.06 deg)  ;Load Accumulator A
StoreChargeTempValue2:
          staa    ChargeTempVolts                          ;Store Accumulator A
          ldx     #TL_ScaleChargeTemp                      ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    IntakeTemp_fromTable_Scaled              ;Store Accumulator A
          ldaa    LastTpsVolts                             ;Load Accumulator A
          staa    TpsVolts                                 ;Store Accumulator A
          ldab    LowestSessionTpsVolts                    ;Load Accumulator B
          addb    TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly ;(0x03/.06 volts)  ;Add Memory to B
          cmpb    TL_ValueOf_MINTHR_WhenBatteryDisconnected ;(0x39/1.12 volts)  ;Compare B to Memory
          bcs     Lbl_9849                                 ;Branch if Lower
          adda    #0x06 ;(00000110)                        ;Add Memory to A
          ldab    TL_ValueOf_MINTHR_WhenBatteryDisconnected ;(0x39/1.12 volts)  ;Load Accumulator B
          cba                                              ;Compare A to B
          bcc     Lbl_9849                                 ;Branch if Higher or Same
          tab                                              ;Transfer A to B
Lbl_9849: stab    LowestSessionTpsVolts                    ;Store Accumulator B
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup ;(0x63/-21.41 deg)  ;Compare A to Memory
          bcs     Lbl_9857                                 ;Branch if Lower
          cmpa    TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup ;(0xE4/211.29 deg)  ;Compare A to Memory
          bcs     CalculateVariousFactors3                 ;Branch if Lower
Lbl_9857: bset    *BitFlags6d_t3, #b1_28_bt1 ;(00000010)   ;Set Bit(s)
CalculateVariousFactors3:
          jsr     CalculateVariousFactors2                 ;Jump to Subroutine
          jsr     calc_fuel_MM                             ;Jump to Subroutine
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    #0x03E8                                  ;Add 16-Bit to D
          std     TOC1_Counter_OC1                         ;Store Accumulator D
          jsr     Lbl_EC8C                                 ;Jump to Subroutine
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          anda    #0xFE ;(11111110)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          ldx     #gb_AISTEP_BitPatternForAisControl       ;Load Index Register X
          ldab    BitFlags_36_t3                           ;Load Accumulator B
          abx                                              ;Add B to X
          ldab    0x00, X                                  ;Load Accumulator B
          tba                                              ;Transfer B to A
          comb                                             ;1's Complement B
          lslb                                             ;Logical Shift Left B
          lslb                                             ;Logical Shift Left B
          lslb                                             ;Logical Shift Left B
          lslb                                             ;Logical Shift Left B
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          aba                                              ;Add Accumulators
;   similar to routine setPIAOutputbits
          ldx     #PORTD_PortD                             ;Load Index Register X
          bclr    0x00, X, #$%00100000                     ;Clear Bits(s)
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          mul                                              ;Multiply A x B = D
          bset    0x00, X, #$%00100000                     ;Set Bit(s)
          ldaa    #0xBF ;(10111111)                        ;Load Accumulator A
          ldab    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator B
          bitb    #0x20 ;(00100000)                        ;Bit(s) Test B with Memory
          beq     Lbl_98B6                                 ;Branch if = Zero
          ldab    TL_CONF01 ;(0x41/65.00 Y units)          ;Load Accumulator B
          bitb    #0x01 ;(00000001)                        ;Bit(s) Test B with Memory
          beq     Lbl_98B6                                 ;Branch if = Zero
          anda    #0xDF ;(11011111)                        ;AND A with Memory
Lbl_98B6: staa    PIA1_Buffer_t3                           ;Store Accumulator A
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
          ldx     #0x0238                                  ;Load Index Register X
Lbl_98C3: dex                                              ;Decrement Index Register X
          bne     Lbl_98C3                                 ;Branch if Not = Zero
          jsr     UpdatePIA1AndCheckOutputs2_MM            ;Jump to Subroutine
          cli                                              ;Clear Mask Enable Int
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          std     MinimumTimerCountBeforeMainloopCanContinue2 ;Store Accumulator D
          bra     MainProgramLoop                          ;Branch Always
Wrd_98D2: .word ReadA2DCoolantChargeTempSensors
          .word L9996
          .word MainSubLoop
          .word ReadA2DNotSureWhat_X
          .word MainSubLoop
          .word ReadA2DNotSureWhat_Y
          .word L99e7
          .word MainSubLoop
MainProgramLoop:
          jsr     ResetCopTimer2                           ;Jump to Subroutine
          ldaa    TL_CONF01 ;(0x41/65.00 Y units)          ;Load Accumulator A
          staa    BitFlags27                               ;Store Accumulator A
          inc     Ram_FE                                   ;Increment Memory Byte
          sei                                              ;Set Mask Disable Int
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          std     Temp0                                    ;Store Accumulator D
          inc     Counter_MainLoop                         ;Increment Memory Byte
          bne     Lbl_9906                                 ;Branch if Not = Zero
          bclr    *Ram_05, #$%11000000                     ;Clear Bits(s)
          bset    *BitFlags6a_t3, #b2_26_bt2 ;(00000100)   ;Set Bit(s)
          ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
;   each bit = 2.816 sec    max=720 sec
          inca                                             ;Increment Accumulator A
          beq     Lbl_9906                                 ;Branch if = Zero
          staa    KeyOnOrEngineRunningTime                 ;Store Accumulator A
Lbl_9906: ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
          ldd     Temp0                                    ;Load Double Accumulator D
          ldx     #Counter_TimerPastHalfwayBetweenCamPulses ;Load Index Register X
          ldy     #Temp5                                   ;Load Index Register Y
          jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM ;Jump to Subroutine
          cmpa    #0x10 ;(00010000)                        ;Compare A to Memory
          bcs     Lbl_993A                                 ;Branch if Lower
          brset   *BitFlags2e, #b4_2E_bt4, Lbl_993D ;(00010000)  ;Branch if Bit(s) Set
          bset    *BitFlags2e, #b4_2E_bt4 ;(00010000)      ;Set Bit(s)
          ldab    #0xAA ;(10101010)                        ;Load Accumulator B
          stab    TCTL1_TimerControlReg1                   ;Store Accumulator B
;   clr oc2 oc3 oc4 oc5
          ldab    #0x78 ;(01111000)                        ;Load Accumulator B
          stab    CFORC_TimerForceCompare                  ;Store Accumulator B
          ldaa    UNe_64B9                                 ;Load Accumulator A
          anda    #0xE0 ;(11100000)                        ;AND A with Memory
          staa    UNe_64B9                                 ;Store Accumulator A
          bclr    *BitFlags2b, #$%11000000                 ;Clear Bits(s)
          bra     Lbl_993D                                 ;Branch Always
Lbl_993A: bclr    *BitFlags2e, #b4_2E_bt4 ;(00010000)      ;Clear Bits(s)
Lbl_993D: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_993D                                 ;Branch if Plus
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          bcs     Lbl_994F                                 ;Branch if Lower
          lsra                                             ;Logical Shift Right A
          bcs     Lbl_994F                                 ;Branch if Lower
          jsr     ReadA2DBattVolts                         ;Jump to Subroutine
          staa    BatteryVolts                             ;Store Accumulator A
Lbl_994F: ldd     ADR3_A2DResults3                         ;Load Double Accumulator D
          staa    O2SensorVolts                            ;Store Accumulator A
          stab    LastTpsVolts                             ;Store Accumulator B
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cli                                              ;Clear Mask Enable Int
          jsr     Lbl_D776                                 ;Jump to Subroutine
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
          sei                                              ;Set Mask Disable Int
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          ldx     #Counter_TimerRegHalfOverflowBetweenSpeedoPulses ;Load Index Register X
          ldy     #Temp5                                   ;Load Index Register Y
          jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM ;Jump to Subroutine
Lbl_9971: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_9971                                 ;Branch if Plus
          ldx     #Wrd_98D2                                ;Load Index Register X
          ldab    Ram_FE                                   ;Load Accumulator B
          bitb    #0x07 ;(00000111)                        ;Bit(s) Test B with Memory
          beq     ReadA2DCoolantChargeTempSensors          ;Branch if = Zero
          orab    #0x80 ;(10000000)                        ;OR Accumulator B (Inclusive)
          cmpb    #0xF8 ;(11111000)                        ;Compare B to Memory
          bcs     MainSubLoop                              ;Branch if Lower
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          lslb                                             ;Logical Shift Left B
          abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          jmp     0x00, X                                  ;Jump
ReadA2DCoolantChargeTempSensors:
          ldd     ADR1_A2DResults1                         ;Load Double Accumulator D
          staa    LastCoolantTempVolts                     ;Store Accumulator A
          stab    LastChargeTempVolts                      ;Store Accumulator B
          bra     MainSubLoop                              ;Branch Always
L9996:    ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          brclr   *PIA3_Buffer_t3, #b4_CF_CoolantTemp, Lbl_99A3 ;(00010000)  ;Branch if Bit(s) Clear
          bset    *BitFlags23, #b3_23_bt3 ;(00001000)      ;Set Bit(s)
          bra     Lbl_99A6                                 ;Branch Always
Lbl_99A3: bclr    *BitFlags23, #b3_23_bt3 ;(00001000)      ;Clear Bits(s)
Lbl_99A6: anda    #0xEF ;(11101111)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          bra     MainSubLoop                              ;Branch Always
ReadA2DNotSureWhat_X:
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cli                                              ;Clear Mask Enable Int
          cmpa    CoolantVoltsTmp1                         ;Compare A to Memory
          bne     Lbl_99BD                                 ;Branch if Not = Zero
          bset    *BitFlags23, #b5_23_bt5 ;(00100000)      ;Set Bit(s)
          bra     Lbl_99C0                                 ;Branch Always
Lbl_99BD: bclr    *BitFlags23, #b5_23_bt5 ;(00100000)      ;Clear Bits(s)
Lbl_99C0: staa    CoolantVoltsTmp1                         ;Store Accumulator A
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          bra     MainSubLoop                              ;Branch Always
ReadA2DNotSureWhat_Y:
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cli                                              ;Clear Mask Enable Int
          staa    CoolantVoltsTmp2                         ;Store Accumulator A
          brclr   *BitFlags23, #b5_23_bt5, MainSubLoop ;(00100000)  ;Branch if Bit(s) Clear
          ldab    BitFlags66_t3                            ;Load Accumulator B
          bitb    #0x03 ;(00000011)                        ;Bit(s) Test B with Memory
          bne     MainSubLoop                              ;Branch if Not = Zero
          jsr     Lbc57                                    ;Jump to Subroutine
          jsr     DetermineTargetBatteryVoltage            ;Jump to Subroutine
          bra     MainSubLoop                              ;Branch Always
L99e7:    ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          brclr   *BitFlags23, #b3_23_bt3, Lbl_99F3 ;(00001000)  ;Branch if Bit(s) Clear
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          bra     Lbl_99F5                                 ;Branch Always
Lbl_99F3: anda    #0xEF ;(11101111)                        ;AND A with Memory
Lbl_99F5: staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
MainSubLoop:
          ldab    #0x10 ;(00010000)                        ;Load Accumulator B
          stab    ADCTL_A2DControlReg                      ;Store Accumulator B
          cli                                              ;Clear Mask Enable Int
          jsr     ba1c_MM                                  ;Jump to Subroutine
          jsr     CheckForWOTAndSetFlag_MM                 ;Jump to Subroutine
          jsr     CalculateL0063LoadFactor                 ;Jump to Subroutine
          jsr     RescaleRPMFor3D_MM                       ;Jump to Subroutine
          jsr     ControlCruiseServo1_MM                   ;Jump to Subroutine
          jsr     ae4a_mm                                  ;Jump to Subroutine
          jsr     ControlCruiseServo0_MM                   ;Jump to Subroutine
          jsr     LookupEngineRPMCell_MM                   ;Jump to Subroutine
          jsr     bf3e_MM                                  ;Jump to Subroutine
          jsr     CheckAndFilterChargeTempSensor_MM        ;Jump to Subroutine
          jsr     CheckAndFilterCoolantTempSensor_MM       ;Jump to Subroutine
          jsr     CalculateVariousFactors2                 ;Jump to Subroutine
          jsr     calc_fuel_MM                             ;Jump to Subroutine
          jsr     CalcO2Limit_MM                           ;Jump to Subroutine
          jsr     CalculateValueFor0060_MM                 ;Jump to Subroutine
          jsr     ControlAsdRelay_MM                       ;Jump to Subroutine
          jsr     L9ca3_MM                                 ;Jump to Subroutine
          jsr     CalculateTargetIdleSpeedAndAisPosition_MM ;Jump to Subroutine
          jsr     c64a_MM                                  ;Jump to Subroutine
          jsr     CalculateAisPosition_MM                  ;Jump to Subroutine
          jsr     KickUpAisBy2DuringDecel_MM               ;Jump to Subroutine
          jsr     b9ba_MM                                  ;Jump to Subroutine
          jsr     c682_MM                                  ;Jump to Subroutine
          jsr     b9f1_MM                                  ;Jump to Subroutine
          jsr     ControlPTU_MM                            ;Jump to Subroutine
          jsr     PrepareCCDDataForXmit_MM                 ;Jump to Subroutine
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bne     L9a58_MM                                 ;Branch if Not = Zero
          jsr     DealWithConfigurationAndPulseAccumulator_MM ;Jump to Subroutine
          jsr     UpdateErrorTimersAndPossiblyClearErrors_MM ;Jump to Subroutine
L9a58_MM: ldaa    Counter_MainLoop                         ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          bcc     Lbl_9A79                                 ;Branch if Higher or Same
          lsra                                             ;Logical Shift Right A
          bcc     Lbl_9A6E                                 ;Branch if Higher or Same
          jsr     b976_MM                                  ;Jump to Subroutine
          jsr     VerifyOperationOfASDRelayAndO2Sensor_MM  ;Jump to Subroutine
          jsr     IncrementCounters_MM                     ;Jump to Subroutine
          jsr     bcf2_MM                                  ;Jump to Subroutine
          bra     L988e_MM                                 ;Branch Always
Lbl_9A6E: jsr     a254_MM                                  ;Jump to Subroutine
          jsr     a279_MM                                  ;Jump to Subroutine
          jsr     d671_MM                                  ;Jump to Subroutine
          bra     L988e_MM                                 ;Branch Always
Lbl_9A79: jsr     CycleACClutch_MM                         ;Jump to Subroutine
          jsr     L9b0c_MM                                 ;Jump to Subroutine
          jsr     EmissionMaintenanceReminder2_MM          ;Jump to Subroutine
          jsr     a15d_MM                                  ;Jump to Subroutine
          jsr     ControlFan_MM                            ;Jump to Subroutine
          jsr     DRB_SomethingLikeEMR_MM                  ;Jump to Subroutine
          jsr     DRB_SomethingLikeEMR2_MM                 ;Jump to Subroutine
L988e_MM: jsr     ExhGasRecirc_MM                          ;Jump to Subroutine
          jsr     CalculateSparkAdvance_MM                 ;Jump to Subroutine
          jsr     bffa_MM                                  ;Jump to Subroutine
          jsr     c119_MM                                  ;Jump to Subroutine
          jsr     c186_MM                                  ;Jump to Subroutine
          jsr     CalculateMAPLoadFactor_MM                ;Jump to Subroutine
          jsr     CheckIfCheckEngineLightShouldBeOn_MM     ;Jump to Subroutine
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x7D ;(01111101)                        ;Compare A to Memory
;   4015 rpm
          bcc     Lbl_9AC4                                 ;Branch if Higher or Same
          jsr     d60d_MM                                  ;Jump to Subroutine
          jsr     DetectAlternatorFault_MM                 ;Jump to Subroutine
          jsr     ld8c7_MM                                 ;Jump to Subroutine
          jsr     VerifyOperationOfBatteryVoltage_MM       ;Jump to Subroutine
          jsr     CheckForErrorsAndSetCodes_MM             ;Jump to Subroutine
          jsr     VerifyOperationOfThermostat_MM           ;Jump to Subroutine
          jsr     ThrowMajorErrorIfRequired_MM             ;Jump to Subroutine
          jsr     VerifyOperationOfFuelInjectorDrivers_MM  ;Jump to Subroutine
          jsr     VerifyOperationOfMapSensor_MM            ;Jump to Subroutine
Lbl_9AC4: jsr     EmmissionMaintenanceReminder1_MM         ;Jump to Subroutine
          jsr     DRBIISerialCommunications_MM             ;Jump to Subroutine
          jsr     DRBIIOuput_MM                            ;Jump to Subroutine
          jsr     ActuatorTestMode_MM                      ;Jump to Subroutine
          jsr     UpdatePIA1AndCheckOutputs2_MM            ;Jump to Subroutine
          jsr     UpdatePIA1AndCheckOutputs_MM             ;Jump to Subroutine
          jsr     UpdateErrorTimersAndPossiblyClearErrors2_MM ;Jump to Subroutine
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_9AF3 ;(01000000)  ;Branch if Bit(s) Set
          sei                                              ;Set Mask Disable Int
          ldaa    CountdownTimerFromKeyOn                  ;Load Accumulator A
          bne     Lbl_9AF3                                 ;Branch if Not = Zero
          ldd     MinimumTimerCountBeforeMainloopCanContinue ;Load Double Accumulator D
          cli                                              ;Clear Mask Enable Int
          coma                                             ;1's Complement A
          cba                                              ;Compare A to B
          beq     Lbl_9AF3                                 ;Branch if = Zero
          jsr     ErrorCodeResetEeprom                     ;Jump to Subroutine
          ldd     Counter_SpeedSensorInterrupt_HB          ;Load Double Accumulator D
          tba                                              ;Transfer B to A
          comb                                             ;1's Complement B
          std     MinimumTimerCountBeforeMainloopCanContinue ;Store Accumulator D
Lbl_9AF3: cli                                              ;Clear Mask Enable Int
          jsr     GetControlFeedback_DetermineIfShutdownRequired_MM ;Jump to Subroutine
Lbl_9AF7: ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          subd    MinimumTimerCountBeforeMainloopCanContinue2 ;Subtract Memory from D
          cmpd    #0x0ABE                                  ;Compare D to Memory 16-Bit
          bcs     Lbl_9AF7                                 ;Branch if Lower
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          std     MinimumTimerCountBeforeMainloopCanContinue2 ;Store Accumulator D
          jmp     MainProgramLoop                          ;Jump
L9b0c_MM: ldab    TL_TL_8831 ;(0x90/144.00 Y units)        ;Load Accumulator B
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_9B1B                                 ;Branch if = Zero
          subb    #0x03 ;(00000011)                        ;Subtract Memory from B
          bcc     Lbl_9B1B                                 ;Branch if Higher or Same
          ldab    #0x00 ;(00000000)                        ;Load Accumulator B
Lbl_9B1B: cmpb    TpsVolts_Minus_LowestSessionTpsVolts     ;Compare B to Memory
          bcc     Lbl_9B35                                 ;Branch if Higher or Same
          ldab    UNe_64AD                                 ;Load Accumulator B
          cmpb    TL_TL_8832 ;(0x88/136.00 Y units)        ;Compare B to Memory
          bcc     Lbl_9B38                                 ;Branch if Higher or Same
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x07 ;(00000111)                        ;Bit(s) Test A with Memory
          bne     Lbl_9B33                                 ;Branch if Not = Zero
          incb                                             ;Increment Accumulator B
          beq     Lbl_9B33                                 ;Branch if = Zero
          stab    UNe_64AD                                 ;Store Accumulator B
Lbl_9B33: bra     Lbl_9B88                                 ;Branch Always
Lbl_9B35: clr     UNe_64AD                                 ;Clear Memory Byte
Lbl_9B38: brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_9B88 ;(01000000)  ;Branch if Bit(s) Clear
          ldab    KeyOnOrEngineRunningTime                 ;Load Accumulator B
          cmpb    TL_TL_8838 ;(0x02/5.65 sec)              ;Compare B to Memory
          bcs     Lbl_9B88                                 ;Branch if Lower
          brclr   *BitFlags2d, #b2_2D_a6cb1, Lbl_9B57 ;(00000100)  ;Branch if Bit(s) Clear
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x20 ;(00100000)                        ;Compare A to Memory
;   1028 rpm
          bcc     Lbl_9B88                                 ;Branch if Higher or Same
          brset   *StartupSwitchMirror1, #b7_61_bt7, Lbl_9B88 ;(10000000)  ;Branch if Bit(s) Set
          brclr   *StartupSwitchMirror1, #b6_61_IdleSpeedMode, Lbl_9B88 ;(01000000)  ;Branch if Bit(s) Clear
          bra     Lbl_9B8F                                 ;Branch Always
Lbl_9B57: brset   *BitFlags68_t3, #b3_25_bt3, Lbl_9B88 ;(00001000)  ;Branch if Bit(s) Set
          ldab    CoolantTemp                              ;Load Accumulator B
          cmpb    TL_TL_8833 ;(0xFD/256.39 deg)            ;Compare B to Memory
          bhi     Lbl_9B88                                 ;Branch if Higher
          ldx     EngineRpm_HB                             ;Load Index Register X
          cpx     TL_TL_8834 ;(0xFFA0/8180.12 rpm)         ;Compare X to Memory 16-Bit
          bcc     Lbl_9B88                                 ;Branch if Higher or Same
          cpx     TL_TL_8836 ;(0xFF00/8160.12 rpm)         ;Compare X to Memory 16-Bit
          bcc     Lbl_9B96                                 ;Branch if Higher or Same
          cpx     TL_TL_882E ;(0x11F8/575.01 rpm)          ;Compare X to Memory 16-Bit
          bcc     Lbl_9B79                                 ;Branch if Higher or Same
          ldab    TL_TL_8830 ;(0x2D/45.00 Y units)         ;Load Accumulator B
          stab    STe_64AE                                 ;Store Accumulator B
Lbl_9B79: ldab    STe_64AE                                 ;Load Accumulator B
          beq     Lbl_9B8F                                 ;Branch if = Zero
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x07 ;(00000111)                        ;Bit(s) Test A with Memory
          bne     Lbl_9B88                                 ;Branch if Not = Zero
          decb                                             ;Decrement Accumulator B
          stab    STe_64AE                                 ;Store Accumulator B
Lbl_9B88: sei                                              ;Set Mask Disable Int
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          bra     Lbl_9B94                                 ;Branch Always
Lbl_9B8F: sei                                              ;Set Mask Disable Int
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          anda    #0xFE ;(11111110)                        ;AND A with Memory
Lbl_9B94: staa    PIA2_Buffer_t3                           ;Store Accumulator A
Lbl_9B96: cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
CycleACClutch_MM:
          brset   *PIA2_Buffer_t3, #b0_CE_bt0, Lbl_9BB5 ;(00000001)  ;Branch if Bit(s) Set
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_9BB5 ;(01000000)  ;Branch if Bit(s) Clear
          brclr   *BitFlags2d, #b2_2D_a6cb1, Lbl_9BB5 ;(00000100)  ;Branch if Bit(s) Clear
          ldaa    Counter_ACControl1                       ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_9BB2                                 ;Branch if = Zero
          staa    Counter_ACControl1                       ;Store Accumulator A
          cmpa    TL_TL_8839 ;(0x00/.00 Y units)           ;Compare A to Memory
          bcs     Lbl_9BB5                                 ;Branch if Lower
Lbl_9BB2: bset    *BitFlags2d, #b1_2D_a6cb3 ;(00000010)    ;Set Bit(s)
Lbl_9BB5: ldab    ACClutchToggleVar                        ;Load Accumulator B
          ldaa    BitFlags68_t3                            ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          eora    BitFlags68_t3                            ;Exclusive OR A with Memory
          bita    #0x20 ;(00100000)                        ;Bit(s) Test A with Memory
          beq     Lbl_9BEE                                 ;Branch if = Zero
          brclr   *BitFlags68_t3, #b5_25_bt5, Lbl_9BD9 ;(00100000)  ;Branch if Bit(s) Clear
          cmpb    #0x30 ;(00110000)                        ;Compare B to Memory
          bcs     Lbl_9BCE                                 ;Branch if Lower
          bclr    *ACClutchToggleVar, #$%00000111          ;Clear Bits(s)
          bset    *BitFlags68_t3, #b6_25_AcClutch ;(01000000)  ;Set Bit(s)
Lbl_9BCE: ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x1F ;(00011111)                        ;Bit(s) Test A with Memory
          bne     Lbl_9C03                                 ;Branch if Not = Zero
          addb    #0x08 ;(00001000)                        ;Add Memory to B
          bcc     Lbl_9C01                                 ;Branch if Higher or Same
          rts                                              ;Return from Subroutine
Lbl_9BD9: brclr   *ACClutchToggleVar, #$%00000111, Lbl_9BE4 ;Branch if Bit(s) Clear
          tba                                              ;Transfer B to A
          anda    #0x07 ;(00000111)                        ;AND A with Memory
          cmpa    #0x05 ;(00000101)                        ;Compare A to Memory
          bls     Lbl_9BEB                                 ;Branch if Lower or Same
Lbl_9BE4: cmpb    #0xB8 ;(10111000)                        ;Compare B to Memory
          bcs     Lbl_9BCE                                 ;Branch if Lower
          bclr    *BitFlags68_t3, #b6_25_AcClutch ;(01000000)  ;Clear Bits(s)
Lbl_9BEB: clrb                                             ;Clear Accumulator B
          bra     Lbl_9C01                                 ;Branch Always
Lbl_9BEE: brset   *ACClutchToggleVar, #$%00000111, Lbl_9BF5 ;Branch if Bit(s) Set
          incb                                             ;Increment Accumulator B
          stab    ACClutchToggleVar                        ;Store Accumulator B
Lbl_9BF5: brset   *BitFlags68_t3, #b6_25_AcClutch, Lbl_9BCE ;(01000000)  ;Branch if Bit(s) Set
          cmpb    #0x60 ;(01100000)                        ;Compare B to Memory
          bcs     Lbl_9BCE                                 ;Branch if Lower
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          orab    #0x60 ;(01100000)                        ;OR Accumulator B (Inclusive)
Lbl_9C01: stab    ACClutchToggleVar                        ;Store Accumulator B
Lbl_9C03: rts                                              ;Return from Subroutine
ControlAsdRelay_MM:
          ldaa    DRBPointer1                              ;Load Accumulator A
          cmpa    #0x0A ;(00001010)                        ;Compare A to Memory
          bne     Lbl_9C0E                                 ;Branch if Not = Zero
          bset    *PIA2_Buffer_t3, #b4_CE_ASD ;(00010000)  ;Set Bit(s)
          rts                                              ;Return from Subroutine
Lbl_9C0E: cmpa    #0x18 ;(00011000)                        ;Compare A to Memory
          bne     CONTROL_AUTOSHUTDOWN_RELAY_ROUTINE1      ;Branch if Not = Zero
          ldaa    DRBSerialMode                            ;Load Accumulator A
          bita    #0x30 ;(00110000)                        ;Bit(s) Test A with Memory
          bne     CONTROL_AUTOSHUTDOWN_RELAY_ROUTINE1      ;Branch if Not = Zero
          ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          cmpa    #0x50 ;(01010000)                        ;Compare A to Memory
          bls     Lbl_9C4D                                 ;Branch if Lower or Same
          ldaa    DRBPointer2                              ;Load Accumulator A
          tab                                              ;Transfer A to B
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          pshb                                             ;Push B onto Stack
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          comb                                             ;1's Complement B
          andb    #0x0F ;(00001111)                        ;AND B with Memory
          cba                                              ;Compare A to B
          pulb                                             ;Pull B from Stack
          bne     Lbl_9C4D                                 ;Branch if Not = Zero
          bset    *BitFlags2d, #b4_2D_a71b5 ;(00010000)    ;Set Bit(s)
          tst     Counter_MainLoop                         ;Test for Zero or Minus
          bne     Lbl_9C41                                 ;Branch if Not = Zero
          deca                                             ;Decrement Accumulator A
          beq     Lbl_9C4D                                 ;Branch if = Zero
          andb    #0xF0 ;(11110000)                        ;AND B with Memory
          addb    #0x10 ;(00010000)                        ;Add Memory to B
          aba                                              ;Add Accumulators
          staa    DRBPointer2                              ;Store Accumulator A
Lbl_9C41: ldaa    #0xE1 ;(11100001)                        ;Load Accumulator A
          jsr     SerialOutput1a                           ;Jump to Subroutine
          sei                                              ;Set Mask Disable Int
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          bra     ASD_StoreStateToBuffer                   ;Branch Always
Lbl_9C4D: clra                                             ;Clear Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          staa    ATMOffset                                ;Store Accumulator A
          bclr    *BitFlags2d, #b4_2D_a71b5 ;(00010000)    ;Clear Bits(s)
          bclr    *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2 ;(00110000)  ;Clear Bits(s)
          jsr     SerialOutput1a                           ;Jump to Subroutine
CONTROL_AUTOSHUTDOWN_RELAY_ROUTINE1:
          ldx     #BitFlags2d                              ;Load Index Register X
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    #0x8F ;(10001111)                        ;Compare A to Memory
;   27 deg
          bcc     ControlAsdRelay_Over27Ftemp              ;Branch if Higher or Same
          ldx     #BatteryVolts                            ;Load Index Register X
ControlAsdRelay_Over27Ftemp:
          ldab    #0x04 ;(00000100)                        ;Load Accumulator B
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    #0xB2 ;(10110010)                        ;Compare A to Memory
;   11.1 volts
          brset   *BitFlags23, #b2_23_Past12SecRunning, ASD_EngRunningCheckBatVolts ;(00000100)  ;Branch if Bit(s) Set
          bcc     ASD_ToggleOnOff                          ;Branch if Higher or Same
          cpx     #0x005B                                  ;Compare X to Memory 16-Bit
;   5.7 volts
          bne     ASD_ToggleOnOff                          ;Branch if Not = Zero
          ldab    #0x0B ;(00001011)                        ;Load Accumulator B
          bra     ASD_ToggleOnOff                          ;Branch Always
ASD_EngRunningCheckBatVolts:
          bcs     ASD_ToggleOnOff                          ;Branch if Lower
          ldab    #0x03 ;(00000011)                        ;Load Accumulator B
ASD_ToggleOnOff:
          sei                                              ;Set Mask Disable Int
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          cmpb    Counter_TimerPastHalfwayBetweenCamPulses ;Compare B to Memory
          bhi     ASD_StoreStateToBuffer                   ;Branch if Higher
          cpx     KeyOnOrEngineRunningTime                 ;Compare X to Memory 16-Bit
          bhi     ASD_StoreStateToBuffer                   ;Branch if Higher
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          bclr    *Ram_80, #$%11111111                     ;Clear Bits(s)
ASD_StoreStateToBuffer:
          staa    PIA2_Buffer_t3                           ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_9CA2 ;(01000000)  ;Branch if Bit(s) Clear
          ldab    KeyOnOrEngineRunningTime                 ;Load Accumulator B
          cmpb    #0x04 ;(00000100)                        ;Compare B to Memory
;   11.26 sec
          bcs     Lbl_9CA2                                 ;Branch if Lower
          bset    *BitFlags23, #b2_23_Past12SecRunning ;(00000100)  ;Set Bit(s)
Lbl_9CA2: rts                                              ;Return from Subroutine
L9ca3_MM: brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_9D19 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          beq     Lbl_9D25                                 ;Branch if = Zero
          ldaa    InjectorPulsewidth_HB                    ;Load Accumulator A
          ldab    EngineRpm_HB                             ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          std     Temp0                                    ;Store Accumulator D
          ldaa    BatteryVolts                             ;Load Accumulator A
          ldab    TL_TL_884F ;(0x15/21.00 Y units)         ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          subd    TL_TL_884B ;(0x0B9B/11.56 Y units)       ;Subtract Memory from D
          bcc     Lbl_9CC4                                 ;Branch if Higher or Same
          ldd     #0x0000                                  ;Load Double Accumulator D
Lbl_9CC4: brclr   *BitFlags27, #b3_27_bt3, Lbl_9CCE ;(00001000)  ;Branch if Bit(s) Clear
          brclr   *PIA1_Buffer_t3, #b7_CD_FanRelay, Lbl_9D0C ;(10000000)  ;Branch if Bit(s) Clear
          bra     Lbl_9CDA                                 ;Branch Always
Lbl_9CCE: brclr   *PIA2_Buffer_t3, #b3_CE_bt3, Lbl_9D0C ;(00001000)  ;Branch if Bit(s) Clear
          subd    TL_TL_884D ;(0x00C0/.75 Y units)         ;Subtract Memory from D
          bcc     Lbl_9CDA                                 ;Branch if Higher or Same
          ldd     #0x0000                                  ;Load Double Accumulator D
Lbl_9CDA: cmpd    Temp0                                    ;Compare D to Memory 16-Bit
          bls     Lbl_9D25                                 ;Branch if Lower or Same
          brset   *BitFlags2d, #b6_2D_bt6, Lbl_9CF0 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    TL_TL_8850 ;(0xC0/12.05 volts)           ;Compare A to Memory
          bls     Lbl_9D25                                 ;Branch if Lower or Same
          bset    *BitFlags2d, #b6_2D_bt6 ;(01000000)      ;Set Bit(s)
          bra     Lbl_9CFE                                 ;Branch Always
Lbl_9CF0: ldaa    BatteryVolts                             ;Load Accumulator A
          ldab    TL_TL_8850 ;(0xC0/12.05 volts)           ;Load Accumulator B
          addb    #0x03 ;(00000011)                        ;Add Memory to B
          bcc     Lbl_9CFB                                 ;Branch if Higher or Same
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_9CFB: cba                                              ;Compare A to B
          bls     Lbl_9D25                                 ;Branch if Lower or Same
Lbl_9CFE: brclr   *BitFlags27, #b3_27_bt3, Lbl_9D07 ;(00001000)  ;Branch if Bit(s) Clear
          bclr    *PIA1_Buffer_t3, #b7_CD_FanRelay ;(10000000)  ;Clear Bits(s)
          bra     Lbl_9D25                                 ;Branch Always
Lbl_9D07: bclr    *PIA2_Buffer_t3, #b3_CE_bt3 ;(00001000)  ;Clear Bits(s)
          bra     Lbl_9D25                                 ;Branch Always
Lbl_9D0C: cmpd    Temp0                                    ;Compare D to Memory 16-Bit
          bls     Lbl_9D19                                 ;Branch if Lower or Same
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    TL_TL_8850 ;(0xC0/12.05 volts)           ;Compare A to Memory
          bhi     Lbl_9D25                                 ;Branch if Higher
Lbl_9D19: brclr   *BitFlags27, #b3_27_bt3, Lbl_9D22 ;(00001000)  ;Branch if Bit(s) Clear
          bset    *PIA1_Buffer_t3, #b7_CD_FanRelay ;(10000000)  ;Set Bit(s)
          bra     Lbl_9D25                                 ;Branch Always
Lbl_9D22: bset    *PIA2_Buffer_t3, #b3_CE_bt3 ;(00001000)  ;Set Bit(s)
Lbl_9D25: rts                                              ;Return from Subroutine
ExhGasRecirc_MM:
          ldaa    TL_PowerLossLightMask2 ;(0x00/.00 out)   ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          bne     Lbl_9D30                                 ;Branch if Not = Zero
          jmp     Lbl_9E0C                                 ;Jump
Lbl_9D30: brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_9D40 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstFromCoolantTemp ;(0xE1/205.88 deg)  ;Compare A to Memory
          bcc     Lbl_9D4F                                 ;Branch if Higher or Same
          bset    *BitFlags6d_t3, #b7_28_bt7 ;(10000000)   ;Set Bit(s)
          bra     Lbl_9D4F                                 ;Branch Always
Lbl_9D40: ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstFromTimeEngRunning9 ;(0x80/361.41 Sec)  ;Compare A to Memory
          bcs     Lbl_9D4F                                 ;Branch if Lower
          brset   *BitFlags6d_t3, #b7_28_bt7, Lbl_9D4F ;(10000000)  ;Branch if Bit(s) Set
          brset   *BitFlags29, #$%01000000, Lbl_9D52       ;Branch if Bit(s) Set
Lbl_9D4F: jmp     EGR_ResetEGRVars                         ;Jump
Lbl_9D52: ldaa    b5C_IPL1_t3                              ;Load Accumulator A
          bne     EGR_ResetEGRVars                         ;Branch if Not = Zero
          ldaa    MapVolts                                 ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstFromMAPBelowBaro ;(0x1F/.61 volts)  ;Compare A to Memory
          bcs     EGR_ResetEGRVars                         ;Branch if Lower
          ldx     EGRVar3_ErrorCodeBufferHB                ;Load Index Register X
          brset   *BitFlags6d_t3, #b6_28_bt6, Lbl_9DCF ;(01000000)  ;Branch if Bit(s) Set
          cpx     TL_ExhGasRecircConst1 ;(0x01C7/1.77 Y units)  ;Compare X to Memory 16-Bit
          bcc     Lbl_9DC0                                 ;Branch if Higher or Same
          ldaa    MapValue                                 ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstLoLimit18 ;(0x5A/-9.51 PSI)  ;Compare A to Memory
          bcs     EGR_ResetEGRVars                         ;Branch if Lower
          cmpa    TL_ExhGasRecircConstLoLimit18a ;(0xC7/-3.23 PSI)  ;Compare A to Memory
          bcc     EGR_ResetEGRVars                         ;Branch if Higher or Same
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstFromTPSVoltsLoLimit14 ;(0x07/.14 volts)  ;Compare A to Memory
          bcs     EGR_ResetEGRVars                         ;Branch if Lower
          cmpa    TL_ExhGasRecircConstFromTPSVoltsLoLimit14a ;(0x29/.80 volts)  ;Compare A to Memory
          bcc     EGR_ResetEGRVars                         ;Branch if Higher or Same
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstFromRPMLoLimit15 ;(0x1F/995.89 rpm)  ;Compare A to Memory
          bcs     EGR_ResetEGRVars                         ;Branch if Lower
          cmpa    TL_ExhGasRecircConstFromRPMLoLimit15a ;(0x5E/3019.80 rpm)  ;Compare A to Memory
          bcc     EGR_ResetEGRVars                         ;Branch if Higher or Same
          ldaa    Counter_O2SensorFeedbackCount_Signed     ;Load Accumulator A
          cmpa    TL_ExhGasRecircConst3 ;(0x80/128.00 Y units)  ;Compare A to Memory
          bcc     EGR_ResetEGRVars                         ;Branch if Higher or Same
          inx                                              ;Increment Index Register X
          stx     EGRVar3_ErrorCodeBufferHB                ;Store Index Register X
          bset    *BitFlags6d_t3, #b4_28_bt4 ;(00010000)   ;Set Bit(s)
          ldab    TL_ExhGasRecircConst8 ;(0x80/128.00 Y units)  ;Load Accumulator B
          suba    EGRVar5_EGR_Temp_1                       ;Subtract Memory from A
          bcs     Lbl_9DA5                                 ;Branch if Lower
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          bra     Lbl_9DAA                                 ;Branch Always
Lbl_9DA5: nega                                             ;2's Complement A
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          nega                                             ;2's Complement A
Lbl_9DAA: adda    EGRVar5_EGR_Temp_1                       ;Add Memory to A
          staa    EGRVar5_EGR_Temp_1                       ;Store Accumulator A
          jmp     Lbl_9E47                                 ;Jump
EGR_ResetEGRVars:
          ldx     #Ram_00                                  ;Load Index Register X
          stx     EGRVar3_ErrorCodeBufferHB                ;Store Index Register X
          bclr    *BitFlags6d_t3, #b6_28_bt6| b4_28_bt4 ;(01010000)  ;Clear Bits(s)
          ldaa    Counter_O2SensorFeedbackCount_Signed     ;Load Accumulator A
          staa    EGRVar5_EGR_Temp_1                       ;Store Accumulator A
          jmp     Lbl_9E47                                 ;Jump
Lbl_9DC0: ldx     #Ram_00                                  ;Load Index Register X
          bset    *BitFlags6d_t3, #b6_28_bt6 ;(01000000)   ;Set Bit(s)
          bclr    *BitFlags6d_t3, #b4_28_bt4 ;(00010000)   ;Clear Bits(s)
          ldaa    EGRVar5_EGR_Temp_1                       ;Load Accumulator A
          staa    EGRVar6                                  ;Store Accumulator A
          bra     Lbl_9DD4                                 ;Branch Always
Lbl_9DCF: cpx     TL_ExhGasRecircConst6 ;(0x016C/1.42 Y units)  ;Compare X to Memory 16-Bit
          bcc     Lbl_9E17                                 ;Branch if Higher or Same
Lbl_9DD4: inx                                              ;Increment Index Register X
          stx     EGRVar3_ErrorCodeBufferHB                ;Store Index Register X
          ldaa    MapValue                                 ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstLoLimit16 ;(0x6E/-8.36 PSI)  ;Compare A to Memory
          bcs     EGR_ResetEGRVars                         ;Branch if Lower
          cmpa    TL_ExhGasRecircConstHiLimit16A ;(0xAD/-4.73 PSI)  ;Compare A to Memory
          bcc     EGR_ResetEGRVars                         ;Branch if Higher or Same
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstLoLimit19 ;(0x08/.16 volts)  ;Compare A to Memory
          bcs     EGR_ResetEGRVars                         ;Branch if Lower
          cmpa    TL_ExhGasRecircConstHiLimit19A ;(0x21/33.00 Y units)  ;Compare A to Memory
          bcc     EGR_ResetEGRVars                         ;Branch if Higher or Same
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_ExhGasRecircConstLoLimit17 ;(0x2B/1381.40 rpm)  ;Compare A to Memory
          bcs     EGR_ResetEGRVars                         ;Branch if Lower
          cmpa    TL_ExhGasRecircConstLoLimit17A ;(0x58/2827.04 rpm)  ;Compare A to Memory
          bcc     EGR_ResetEGRVars                         ;Branch if Higher or Same
          ldaa    Counter_O2SensorFeedbackCount_Signed     ;Load Accumulator A
          cmpa    EGRVar6                                  ;Compare A to Memory
          bcs     Lbl_9E47                                 ;Branch if Lower
          staa    EGRVar6                                  ;Store Accumulator A
          suba    EGRVar5_EGR_Temp_1                       ;Subtract Memory from A
          staa    EGRVar7                                  ;Store Accumulator A
          cmpa    TL_ExhGasRecircConst7 ;(0x07/7.00 Y units)  ;Compare A to Memory
          bcs     Lbl_9E47                                 ;Branch if Lower
Lbl_9E0C: clr     EGRVar1_ErrorCodeCounter                 ;Clear Memory Byte
          bset    *BitFlags6d_t3, #b7_28_bt7 ;(10000000)   ;Set Bit(s)
          bclr    *BitFlags6d_t3, #b6_28_bt6| b5_28_bt5| b4_28_bt4 ;(01110000)  ;Clear Bits(s)
          bra     Lbl_9E47                                 ;Branch Always
Lbl_9E17: ldx     #Ram_00                                  ;Load Index Register X
          stx     EGRVar3_ErrorCodeBufferHB                ;Store Index Register X
          ldab    BitFlags6d_t3                            ;Load Accumulator B
          andb    #0xAF ;(10101111)                        ;AND B with Memory
          ldaa    EGRVar1_ErrorCodeCounter                 ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          staa    EGRVar1_ErrorCodeCounter                 ;Store Accumulator A
          cmpa    TL_ExhGasRecircConst4 ;(0x08/8.00 Y units)  ;Compare A to Memory
          bcs     Lbl_9E39                                 ;Branch if Lower
          orab    #0x20 ;(00100000)                        ;OR Accumulator B (Inclusive)
          pshb                                             ;Push B onto Stack
          ldd     #0x2E81                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_9E38                                 ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b3_D6_bt4 ;(00001000)     ;Set Bit(s)
Lbl_9E38: pulb                                             ;Pull B from Stack
Lbl_9E39: ldaa    EGRVar8                                  ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          staa    EGRVar8                                  ;Store Accumulator A
          cmpa    TL_ExhGasRecircConst5 ;(0x08/8.00 Y units)  ;Compare A to Memory
          bcs     Lbl_9E45                                 ;Branch if Lower
          orab    #0x80 ;(10000000)                        ;OR Accumulator B (Inclusive)
Lbl_9E45: stab    BitFlags6d_t3                            ;Store Accumulator B
Lbl_9E47: brset   *BitFlags6d_t3, #b6_28_bt6, EGR_SetEGRtoOff ;(01000000)  ;Branch if Bit(s) Set
          ldaa    Ram_CC                                   ;Load Accumulator A
          beq     Lbl_9E52                                 ;Branch if = Zero
          dec     Ram_CC                                   ;Decrement Memory Byte
Lbl_9E52: brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_9E9C ;(10000000)  ;Branch if Bit(s) Clear
          brset   *BitFlags66_t3, #b6_22_bt6, Lbl_9E9C ;(01000000)  ;Branch if Bit(s) Set
          ldaa    TL_TL_8841 ;(0x70/112.00 Y units)        ;Load Accumulator A
          brset   *PIA2_Buffer_t3, #b1_CE_EGR, Lbl_9E68 ;(00000010)  ;Branch if Bit(s) Set
          suba    TL_TL_8842 ;(0x03/3.00 Y units)          ;Subtract Memory from A
          bcc     Lbl_9E68                                 ;Branch if Higher or Same
          ldaa    #0x00 ;(00000000)                        ;Load Accumulator A
Lbl_9E68: cmpa    EngineRpm_HB                             ;Compare A to Memory
          bcs     Lbl_9E9C                                 ;Branch if Lower
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_883D ;(0xFF/260.00 deg)            ;Compare A to Memory
          bcs     Lbl_9E9C                                 ;Branch if Lower
          ldaa    MapValue                                 ;Load Accumulator A
          brset   *PIA2_Buffer_t3, #b1_CE_EGR, Lbl_9E7F ;(00000010)  ;Branch if Bit(s) Set
          suba    TL_TL_883B ;(0x04/-14.47 psi)            ;Subtract Memory from A
          bcc     Lbl_9E7F                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_9E7F: cmpa    TL_TL_883C ;(0xFF/.00 psi)               ;Compare A to Memory
          bcs     Lbl_9E9C                                 ;Branch if Lower
          ldaa    BaroPressure                             ;Load Accumulator A
          suba    TL_ExhGasRecircConstFromBaro1 ;(0x1B/-13.14 psi)  ;Subtract Memory from A
          bcc     Lbl_9E8C                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_9E8C: cmpa    MapValue                                 ;Compare A to Memory
          bcc     Lbl_9EA9                                 ;Branch if Higher or Same
          ldaa    BaroPressure                             ;Load Accumulator A
          suba    TL_ExhGasRecircConstFromBaro2 ;(0x04/-14.47 psi)  ;Subtract Memory from A
          bcc     Lbl_9E98                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_9E98: cmpa    MapValue                                 ;Compare A to Memory
          bcc     Lbl_9EB5                                 ;Branch if Higher or Same
Lbl_9E9C: brclr   *PIA2_Buffer_t3, #b1_CE_EGR, EGR_SetEGRtoOff ;(00000010)  ;Branch if Bit(s) Clear
          ldaa    TL_TL_883F ;(0x0A/10.00 Y units)         ;Load Accumulator A
          staa    Ram_CC                                   ;Store Accumulator A
EGR_SetEGRtoOff:
          bclr    *PIA2_Buffer_t3, #b1_CE_EGR ;(00000010)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbl_9EA9: brset   *PIA2_Buffer_t3, #b1_CE_EGR, EGR_SetEGRtoOn ;(00000010)  ;Branch if Bit(s) Set
          ldaa    TL_TL_883F ;(0x0A/10.00 Y units)         ;Load Accumulator A
          staa    Ram_CC                                   ;Store Accumulator A
EGR_SetEGRtoOn:
          bset    *PIA2_Buffer_t3, #b1_CE_EGR ;(00000010)  ;Set Bit(s)
Lbl_9EB5: rts                                              ;Return from Subroutine
EmmissionMaintenanceReminder1_MM:
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_9EC0 ;(01000000)  ;Branch if Bit(s) Set
          brset   *BitFlags6a_t3, #b2_26_bt2, Lbl_9ECD ;(00000100)  ;Branch if Bit(s) Set
          bra     Lbl_9ED2                                 ;Branch Always
Lbl_9EC0: brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_9F01 ;(01000000)  ;Branch if Bit(s) Set
          ldd     TL_TL_b610                               ;Load Double Accumulator D
          cmpd    #0x5AA5                                  ;Compare D to Memory 16-Bit
;   0x5aa5=23205
          beq     Lbl_9ED2                                 ;Branch if = Zero
Lbl_9ECD: bclr    *PIA1_Buffer_t3, #b3_CD_bt3 ;(00001000)  ;Clear Bits(s)
          bra     Lbl_9ED5                                 ;Branch Always
Lbl_9ED2: bset    *PIA1_Buffer_t3, #b3_CD_bt3 ;(00001000)  ;Set Bit(s)
Lbl_9ED5: brset   *IPL1, #b7_20_bt7, Lbl_9EDC ;(10000000)  ;Branch if Bit(s) Set
          jmp     Lbl_9F83                                 ;Jump
Lbl_9EDC: brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_9F01 ;(01000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_9F02 ;(00100000)  ;Branch if Bit(s) Clear
          jsr     Lbl_9FA6                                 ;Jump to Subroutine
          stab    DRBOffsetStored_LB                       ;Store Accumulator B
          inc     DRBOffsetStored_HB                       ;Increment Memory Byte
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          bclr    *BitFlags6a_t3, #b5_26_drbToggle2 ;(00100000)  ;Clear Bits(s)
          sei                                              ;Set Mask Disable Int
          bclr    *IPL1, #b7_20_bt7 ;(10000000)            ;Clear Bits(s)
          cli                                              ;Clear Mask Enable Int
          cmpd    TL_TL_8AA0 ;(0x2757/39.19 Y units)       ;Compare D to Memory 16-Bit
          bne     Lbl_9F01                                 ;Branch if Not = Zero
          bset    *BitFlags6a_t3, #b4_26_bt4 ;(00010000)   ;Set Bit(s)
Lbl_9F01: rts                                              ;Return from Subroutine
Lbl_9F02: ldx     #ErrorBitRegisterStored3                 ;Load Index Register X
          ldaa    #0x30 ;(00110000)                        ;Load Accumulator A
Lbl_9F07: brclr   0x00, X, #$%11111111, Lbl_9F15           ;Branch if Bit(s) Clear
          cmpa    0x00, X                                  ;Compare A to Memory
          beq     Lbl_9F65                                 ;Branch if = Zero
          dex                                              ;Decrement Index Register X
          cpx     #0x0015                                  ;Compare X to Memory 16-Bit
          bcc     Lbl_9F07                                 ;Branch if Higher or Same
Lbl_9F15: ldd     #0x0000                                  ;Load Double Accumulator D
          std     Temp4                                    ;Store Accumulator D
          staa    DRBOffsetStored_HB                       ;Store Accumulator A
          ldx     #TL_TL_b600                              ;Load Index Register X
          ldy     #0xB60E                                  ;Load Index Register Y
Lbl_9F25: ldd     0x00, X                                  ;Load Double Accumulator D
          subd    0x00, Y                                  ;Subtract Memory from D
          cmpd    #0x0001                                  ;Compare D to Memory 16-Bit
          bne     Lbl_9F41                                 ;Branch if Not = Zero
          ldd     0x00, X                                  ;Load Double Accumulator D
          cmpd    Temp4                                    ;Compare D to Memory 16-Bit
          bcs     Lbl_9F41                                 ;Branch if Lower
          std     Temp4                                    ;Store Accumulator D
          pshx                                             ;Push X onto Stack (Lo First)
          pula                                             ;Pull A from Stack
          pula                                             ;Pull A from Stack
          staa    DRBOffsetStored_HB                       ;Store Accumulator A
Lbl_9F41: cpx     #0xB60E                                  ;Compare X to Memory 16-Bit
          beq     Lbl_9F58                                 ;Branch if = Zero
          inx                                              ;Increment Index Register X
          inx                                              ;Increment Index Register X
          cpy     #0xB60E                                  ;Compare Y to Memory 16-Bit
          bne     Lbl_9F52                                 ;Branch if Not = Zero
          ldy     #0xB5FE                                  ;Load Index Register Y
Lbl_9F52: iny                                              ;Increment Index Register Y
          iny                                              ;Increment Index Register Y
          bra     Lbl_9F25                                 ;Branch Always
Lbl_9F58: ldd     Temp4                                    ;Load Double Accumulator D
          bne     Lbl_9F6B                                 ;Branch if Not = Zero
          ldd     #0x3003                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_9F6A                                 ;Branch if Higher or Same
Lbl_9F65: sei                                              ;Set Mask Disable Int
          bclr    *IPL1, #b7_20_bt7 ;(10000000)            ;Clear Bits(s)
          cli                                              ;Clear Mask Enable Int
Lbl_9F6A: rts                                              ;Return from Subroutine
Lbl_9F6B: ldaa    DRBOffsetStored_HB                       ;Load Accumulator A
          adda    #0x02 ;(00000010)                        ;Add Memory to A
          cmpa    #0x10 ;(00010000)                        ;Compare A to Memory
          bne     Lbl_9F76                                 ;Branch if Not = Zero
          ldaa    #0x00 ;(00000000)                        ;Load Accumulator A
Lbl_9F76: staa    DRBOffsetStored_HB                       ;Store Accumulator A
          jsr     Lbl_9FA6                                 ;Jump to Subroutine
          staa    DRBOffsetStored_LB                       ;Store Accumulator A
          bset    *BitFlags6a_t3, #b6_26_drbToggle1| b5_26_drbToggle2 ;(01100000)  ;Set Bit(s)
Lbl_9F82: rts                                              ;Return from Subroutine
Lbl_9F83: brclr   *BitFlags6a_t3, #b4_26_bt4, Lbl_9F82 ;(00010000)  ;Branch if Bit(s) Clear
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_9F82 ;(01000000)  ;Branch if Bit(s) Set
          ldd     #0x105A                                  ;Load Double Accumulator D
          brclr   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_9F9C ;(00100000)  ;Branch if Bit(s) Clear
          inca                                             ;Increment Accumulator A
          comb                                             ;1's Complement B
          bclr    *BitFlags6a_t3, #b5_26_drbToggle2| b4_26_bt4 ;(00110000)  ;Clear Bits(s)
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          bra     Lbl_9F9F                                 ;Branch Always
Lbl_9F9C: bset    *BitFlags6a_t3, #b6_26_drbToggle1| b5_26_drbToggle2 ;(01100000)  ;Set Bit(s)
Lbl_9F9F: staa    DRBOffsetStored_HB                       ;Store Accumulator A
          stab    DRBOffsetStored_LB                       ;Store Accumulator B
          rts                                              ;Return from Subroutine
Lbl_9FA6: ldx     #TL_TL_b600                              ;Load Index Register X
          ldab    DRBOffsetStored_HB                       ;Load Accumulator B
          subb    #0x02 ;(00000010)                        ;Subtract Memory from B
          bpl     Lbl_9FB2                                 ;Branch if Plus
          ldab    #0x0E ;(00001110)                        ;Load Accumulator B
Lbl_9FB2: abx                                              ;Add B to X
L9fb3:    ldd     0x00, X                                  ;Load Double Accumulator D
          addd    #0x0001                                  ;Add 16-Bit to D
          bcc     Lbl_9FBD                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_9FBD: rts                                              ;Return from Subroutine
ControlPTU_MM:
          ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
          bita    #0x80 ;(10000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_9FC8                                 ;Branch if Not = Zero
Lbl_9FC5: jmp     Lbl_A06C                                 ;Jump
Lbl_9FC8: brset   *StartupSwitchMirror1, #b0_61_bt0, Lbl_A049 ;(00000001)  ;Branch if Bit(s) Set
          ldab    b5d_IPL2                                 ;Load Accumulator B
          bitb    #0x80 ;(10000000)                        ;Bit(s) Test B with Memory
          beq     Lbl_9FD8                                 ;Branch if = Zero
          bita    #0x20 ;(00100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_A049                                 ;Branch if Not = Zero
          bra     Lbl_9FC5                                 ;Branch Always
Lbl_9FD8: ldaa    TL_TL_8854 ;(0x32/25.10 mph)             ;Load Accumulator A
          brset   *BitFlags2a, #b6_2A_bt6, Lbl_9FE2 ;(01000000)  ;Branch if Bit(s) Set
          adda    TL_TL_8855 ;(0x00/.00 mph)               ;Add Memory to A
Lbl_9FE2: cmpa    VehicleSpeedx8_Scaled                    ;Compare A to Memory
          bcc     Lbl_A046                                 ;Branch if Higher or Same
          bset    *BitFlags2a, #b6_2A_bt6 ;(01000000)      ;Set Bit(s)
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_8851 ;(0x92/63.37 deg)             ;Compare A to Memory
          bcs     Lbl_A049                                 ;Branch if Lower
          ldaa    TL_TL_8857 ;(0x40/64.00 Y units)         ;Load Accumulator A
          brset   *PIA1_Buffer_t3, #b4_CD_bt4, Lbl_9FF9 ;(00010000)  ;Branch if Bit(s) Set
          adda    #0x04 ;(00000100)                        ;Add Memory to A
Lbl_9FF9: cmpa    ScaledDistPWForCruiseControl             ;Compare A to Memory
          bcs     Lbl_A049                                 ;Branch if Lower
          brclr   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_A049 ;(00010000)  ;Branch if Bit(s) Clear
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_TL_8853 ;(0x20/1028.02 rpm)           ;Compare A to Memory
          bcs     Lbl_A01C                                 ;Branch if Lower
          brclr   *Ram_D0, #$%11111111, Lbl_A01C           ;Branch if Bit(s) Clear
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x07 ;(00000111)                        ;Bit(s) Test A with Memory
          bne     Lbl_A017                                 ;Branch if Not = Zero
          dec     Ram_D0                                   ;Decrement Memory Byte
          beq     Lbl_A01C                                 ;Branch if = Zero
Lbl_A017: ldx     #TL_TL_8886                              ;Load Index Register X
          bra     Lbl_A022                                 ;Branch Always
Lbl_A01C: ldx     #TL_TL_886F                              ;Load Index Register X
          clr     Ram_D0                                   ;Clear Memory Byte
Lbl_A022: ldaa    EngineRpm_HB                             ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          cba                                              ;Compare A to B
          bcs     Lbl_A05A                                 ;Branch if Lower
          ldx     #TL_TL_8858                              ;Load Index Register X
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          cba                                              ;Compare A to B
          bcc     Lbl_A03F                                 ;Branch if Higher or Same
          brclr   *PIA1_Buffer_t3, #b4_CD_bt4, Lbl_A06C ;(00010000)  ;Branch if Bit(s) Clear
          bra     Lbl_A04C                                 ;Branch Always
Lbl_A03F: ldaa    TL_TL_8852 ;(0x00/.00 Y units)           ;Load Accumulator A
          staa    Ram_D0                                   ;Store Accumulator A
          bra     Lbl_A04C                                 ;Branch Always
Lbl_A046: bclr    *BitFlags2a, #b6_2A_bt6 ;(01000000)      ;Clear Bits(s)
Lbl_A049: clr     Ram_D0                                   ;Clear Memory Byte
Lbl_A04C: ldaa    TL_TL_8856 ;(0x06/6.00 Y units)          ;Load Accumulator A
          staa    Ram_D1                                   ;Store Accumulator A
Lbl_A051: bset    *PIA1_Buffer_t3, #b4_CD_bt4 ;(00010000)  ;Set Bit(s)
          clr     Ram_D3                                   ;Clear Memory Byte
jmp_PTU_SetPTUBits:
          jmp     PTU_SetPTUBits                           ;Jump
Lbl_A05A: ldaa    Ram_D1                                   ;Load Accumulator A
          beq     Lbl_A069                                 ;Branch if = Zero
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x07 ;(00000111)                        ;Bit(s) Test B with Memory
          bne     Lbl_A051                                 ;Branch if Not = Zero
          deca                                             ;Decrement Accumulator A
          staa    Ram_D1                                   ;Store Accumulator A
          bne     Lbl_A051                                 ;Branch if Not = Zero
Lbl_A069: bclr    *PIA1_Buffer_t3, #b4_CD_bt4 ;(00010000)  ;Clear Bits(s)
Lbl_A06C: ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_A076                                 ;Branch if Not = Zero
          jmp     Lbl_A107                                 ;Jump
Lbl_A076: ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          bne     PTU_Main                                 ;Branch if Not = Zero
          ldaa    Ram_D3                                   ;Load Accumulator A
          cmpa    TL_TL_88A6 ;(0x00/.00 Y units)           ;Compare A to Memory
          beq     PTU_Main                                 ;Branch if = Zero
          inca                                             ;Increment Accumulator A
          staa    Ram_D3                                   ;Store Accumulator A
PTU_Main: ldaa    PTU_MapTemp                              ;Load Accumulator A
          staa    Temp5                                    ;Store Accumulator A
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          anda    TL_PTUCounterTimerIntervalForLoop ;(0x07/00000111)  ;AND A with Memory
          bne     PTU_CheckThrottleForLock                 ;Branch if Not = Zero
          ldaa    MapValue                                 ;Load Accumulator A
          staa    PTU_MapTemp                              ;Store Accumulator A
PTU_CheckThrottleForLock:
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          beq     jmp_PTU_SetPTUBits                       ;Branch if = Zero
          staa    Temp3                                    ;Store Accumulator A
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_PTUMinLockTemperature ;(0xB8/131.92 deg)  ;Compare A to Memory
          bcs     jmp_PTU_SetPTUBits                       ;Branch if Lower
          brclr   *BitFlags68_t3, #b4_25_ATXInGear, jmp_PTU_SetPTUBits ;(00010000)  ;Branch if Bit(s) Clear
          brclr   *BitFlags66_t3, #b7_22_Offidle, jmp_PTU_SetPTUBits ;(10000000)  ;Branch if Bit(s) Clear
          brset   *StartupSwitchMirror1, #b5_61_Brake, jmp_PTU_SetPTUBits ;(00100000)  ;Branch if Bit(s) Set
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    TL_PTUMinLockSpeed ;(0x7C/62.24 mph)     ;Compare A to Memory
          bcc     PTU_CheckMAPThresholdsForLock            ;Branch if Higher or Same
          ldaa    MapValue                                 ;Load Accumulator A
          suba    Temp5                                    ;Subtract Memory from A
          bcs     PTU_CheckMAPThresholdsForLock            ;Branch if Lower
          cmpa    TL_PTUMAPThresholdForLock3 ;(0x14/1.15 PSI)  ;Compare A to Memory
          bcs     PTU_ClearPtuA_PtuB                       ;Branch if Lower
          jmp     PTU_SetPTUBits                           ;Jump
PTU_CheckMAPThresholdsForLock:
          ldaa    Temp5                                    ;Load Accumulator A
          suba    MapValue                                 ;Subtract Memory from A
          bcs     PTU_ClearPtuA_PtuB                       ;Branch if Lower
          staa    Temp5                                    ;Store Accumulator A
          ldx     #TL_PTUMAPThresholdForLock1 ;(0x8118/7.41 PSI)  ;Load Index Register X
          brset   *BitFlags2a, #b5_2A_PTU_A, Lbl_A0EC ;(00100000)  ;Branch if Bit(s) Set
          brset   *BitFlags2a, #b4_2A_PTU_B, Lbl_A0EB ;(00010000)  ;Branch if Bit(s) Set
          ldaa    Temp3                                    ;Load Accumulator A
          cmpa    TL_PTUDeltaTPSForUnlock ;(0x66/2.00 Volts)  ;Compare A to Memory
          bcs     Lbl_A0E8                                 ;Branch if Lower
          bset    *BitFlags2a, #b5_2A_PTU_A ;(00100000)    ;Set Bit(s)
          bra     Lbl_A0EC                                 ;Branch Always
Lbl_A0E8: bset    *BitFlags2a, #b4_2A_PTU_B ;(00010000)    ;Set Bit(s)
Lbl_A0EB: inx                                              ;Increment Index Register X
Lbl_A0EC: ldab    Temp5                                    ;Load Accumulator B
          cmpb    0x00, X                                  ;Compare B to Memory
          bcc     PTU_SetPTUBits                           ;Branch if Higher or Same
          bra     PTU_CheckCounter                         ;Branch Always
PTU_ClearPtuA_PtuB:
          bclr    *BitFlags2a, #b5_2A_PTU_A| b4_2A_PTU_B ;(00110000)  ;Clear Bits(s)
PTU_CheckCounter:
          ldaa    Counter_PartThrottleUnlock               ;Load Accumulator A
          cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          bls     PTU_CheckThresholdsForUnlock             ;Branch if Lower or Same
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x07 ;(00000111)                        ;Bit(s) Test B with Memory
          bne     Lbl_A107                                 ;Branch if Not = Zero
          deca                                             ;Decrement Accumulator A
          staa    Counter_PartThrottleUnlock               ;Store Accumulator A
Lbl_A107: rts                                              ;Return from Subroutine
PTU_CheckThresholdsForUnlock:
          ldx     #TL_UpperLimitForPTUUnlock               ;Load Index Register X
          brclr   *PIA1_Buffer_t3, #b5_CD_PTU, Lbl_A112 ;(00100000)  ;Branch if Bit(s) Clear
          ldx     #TL_UpperLimitForPTULock                 ;Load Index Register X
Lbl_A112: stx     Temp4                                    ;Store Index Register X
          bsr     PTU_LookupPTUParam                       ;Branch to Subroutine
          bcc     PTU_SetPTUBits                           ;Branch if Higher or Same
          ldx     Temp4                                    ;Load Index Register X
          ldab    #0x0F ;(00001111)                        ;Load Accumulator B
          abx                                              ;Add B to X
          bsr     PTU_LookupPTUParam                       ;Branch to Subroutine
          bcs     PTU_SetPTUBits                           ;Branch if Lower
          ldaa    Counter_PartThrottleUnlock               ;Load Accumulator A
          beq     PTU_CheckVehicleSpeed                    ;Branch if = Zero
          ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
;   00100010
          bita    #0x80 ;(10000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_A135                                 ;Branch if = Zero
          ldaa    Ram_D3                                   ;Load Accumulator A
          cmpa    TL_TL_88A6 ;(0x00/.00 Y units)           ;Compare A to Memory
          bcs     Lbl_A107                                 ;Branch if Lower
Lbl_A135: bclr    *PIA1_Buffer_t3, #b5_CD_PTU ;(00100000)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
PTU_CheckVehicleSpeed:
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          ldab    TL_PTUCounterHiSpeed ;(0x20/32.00 Y units)  ;Load Accumulator B
          cmpa    TL_PTUMinLockSpeed ;(0x7C/62.24 mph)     ;Compare A to Memory
          bcc     PTU_SaveCounterValue                     ;Branch if Higher or Same
          ldab    TL_PTUCounterLoSpeed ;(0x11/17.00 Y units)  ;Load Accumulator B
PTU_SaveCounterValue:
          stab    Counter_PartThrottleUnlock               ;Store Accumulator B
          rts                                              ;Return from Subroutine
PTU_SetPTUBits:
          clr     Counter_PartThrottleUnlock               ;Clear Memory Byte
          bset    *PIA1_Buffer_t3, #b5_CD_PTU ;(00100000)  ;Set Bit(s)
          bclr    *BitFlags2a, #b5_2A_PTU_A| b4_2A_PTU_B ;(00110000)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
PTU_LookupPTUParam:
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldaa    Temp3                                    ;Load Accumulator A
          cba                                              ;Compare A to B
          rts                                              ;Return from Subroutine
a15d_MM:  ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
          bita    #0x20 ;(00100000)                        ;Bit(s) Test A with Memory
          beq     Lbl_A16F                                 ;Branch if = Zero
          ldaa    TL_CONF01 ;(0x41/65.00 Y units)          ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_A16F                                 ;Branch if = Zero
          brclr   *Counter_MainLoop, #$%00000010, Lbl_A170 ;Branch if Bit(s) Clear
Lbl_A16F: rts                                              ;Return from Subroutine
Lbl_A170: ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    #0x82 ;(10000010)                        ;Compare A to Memory
;   65 mph
          bcc     Lbl_A1A1                                 ;Branch if Higher or Same
          cmpa    TL_TL_88E3 ;(0x50/40.16 mph)             ;Compare A to Memory
          bcs     Lbl_A1A1                                 ;Branch if Lower
          brset   *BitFlags2a, #b2_2A_bt2, Lbl_A1A1 ;(00000100)  ;Branch if Bit(s) Set
          ldaa    ScaledDistPWForCruiseControl             ;Load Accumulator A
          cmpa    TL_TL_88E4 ;(0x20/32.00 Y units)         ;Compare A to Memory
          bcc     Lbl_A1A1                                 ;Branch if Higher or Same
          cmpa    TL_TL_88E5 ;(0x1A/26.00 Y units)         ;Compare A to Memory
          bcs     Lbl_A1A1                                 ;Branch if Lower
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bne     Lbl_A1A4                                 ;Branch if Not = Zero
          ldab    Ram_D0                                   ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          beq     Lbl_A19B                                 ;Branch if = Zero
          stab    Ram_D0                                   ;Store Accumulator B
          cmpb    TL_TL_88E6 ;(0x10/16.00 Y units)         ;Compare B to Memory
          bcs     Lbl_A1A4                                 ;Branch if Lower
Lbl_A19B: cmpa    Ram_0C                                   ;Compare A to Memory
          bcc     Lbl_A1A1                                 ;Branch if Higher or Same
          staa    Ram_0C                                   ;Store Accumulator A
Lbl_A1A1: clr     Ram_D0                                   ;Clear Memory Byte
Lbl_A1A4: ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x0F ;(00001111)                        ;Compare A to Memory
;   482 rpm
          bcs     Lbl_A1D3                                 ;Branch if Lower
          ldab    ScaledDistPWForCruiseControl             ;Load Accumulator B
          subb    PTU_MapTemp                              ;Subtract Memory from B
          bcc     Lbl_A1B1                                 ;Branch if Higher or Same
          negb                                             ;2's Complement B
Lbl_A1B1: cmpb    TL_TL_88E7 ;(0x0A/10.00 Y units)         ;Compare B to Memory
          bcs     Lbl_A1BE                                 ;Branch if Lower
          bset    *BitFlags2a, #b2_2A_bt2 ;(00000100)      ;Set Bit(s)
          clr     Ram_D1                                   ;Clear Memory Byte
          bra     Lbl_A1E2                                 ;Branch Always
Lbl_A1BE: brclr   *BitFlags2a, #b2_2A_bt2, Lbl_A1D6 ;(00000100)  ;Branch if Bit(s) Clear
          cmpb    TL_TL_88E8 ;(0x05/5.00 Y units)          ;Compare B to Memory
          bcc     Lbl_A1D6                                 ;Branch if Higher or Same
          ldaa    Ram_D1                                   ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_A1D3                                 ;Branch if = Zero
          staa    Ram_D1                                   ;Store Accumulator A
          cmpa    TL_TL_88E9 ;(0x10/16.00 Y units)         ;Compare A to Memory
          bcs     Lbl_A1D9                                 ;Branch if Lower
Lbl_A1D3: bclr    *BitFlags2a, #b2_2A_bt2 ;(00000100)      ;Clear Bits(s)
Lbl_A1D6: clr     Ram_D1                                   ;Clear Memory Byte
Lbl_A1D9: ldaa    Counter_MainLoop                         ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          lsra                                             ;Logical Shift Right A
          bita    TL_TL_88EA ;(0x0F/00001111)              ;Bit(s) Test A with Memory
          bne     Lbl_A1E6                                 ;Branch if Not = Zero
Lbl_A1E2: ldaa    ScaledDistPWForCruiseControl             ;Load Accumulator A
          staa    PTU_MapTemp                              ;Store Accumulator A
Lbl_A1E6: brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_A1F0 ;(01000000)  ;Branch if Bit(s) Set
          brset   *BitFlags6a_t3, #b2_26_bt2, Lbl_A1F0 ;(00000100)  ;Branch if Bit(s) Set
          bra     Lbl_A24D                                 ;Branch Always
Lbl_A1F0: brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_A241 ;(10000000)  ;Branch if Bit(s) Clear
          brclr   *BitFlags66_t3, #b6_22_bt6, Lbl_A1FF ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_TL_88EB ;(0x49/2345.16 rpm)           ;Compare A to Memory
          bcc     Lbl_A241                                 ;Branch if Higher or Same
Lbl_A1FF: ldaa    ScaledDistPWForCruiseControl             ;Load Accumulator A
          suba    Ram_0C                                   ;Subtract Memory from A
          bcs     Lbl_A241                                 ;Branch if Lower
          cmpa    TL_TL_88EC ;(0x07/7.00 Y units)          ;Compare A to Memory
          bcs     Lbl_A241                                 ;Branch if Lower
          ldx     #TL_TL_88ED                              ;Load Index Register X
          ldaa    MapValue                                 ;Load Accumulator A
          jsr     OddBallLookup                            ;Jump to Subroutine
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cba                                              ;Compare A to B
          bcc     Lbl_A227                                 ;Branch if Higher or Same
          brset   *PIA1_Buffer_t3, #b5_CD_PTU, Lbl_A241 ;(00100000)  ;Branch if Bit(s) Set
          subb    TL_TL_88F6 ;(0x08/8.00 Y units)          ;Subtract Memory from B
          bcc     Lbl_A222                                 ;Branch if Higher or Same
          ldab    #0x00 ;(00000000)                        ;Load Accumulator B
Lbl_A222: cba                                              ;Compare A to B
          bcc     Lbl_A233                                 ;Branch if Higher or Same
          bra     Lbl_A241                                 ;Branch Always
Lbl_A227: ldaa    Ram_D3                                   ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_A233                                 ;Branch if = Zero
          staa    Ram_D3                                   ;Store Accumulator A
          cmpa    TL_TL_88F7 ;(0x14/20.00 Y units)         ;Compare A to Memory
          bcs     Lbl_A247                                 ;Branch if Lower
Lbl_A233: ldaa    Counter_PartThrottleUnlock               ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_A247                                 ;Branch if = Zero
          staa    Counter_PartThrottleUnlock               ;Store Accumulator A
          cmpa    TL_TL_88F8 ;(0x71/113.00 Y units)        ;Compare A to Memory
          bhi     Lbl_A247                                 ;Branch if Higher
          bra     Lbl_A24D                                 ;Branch Always
Lbl_A241: clr     Ram_D3                                   ;Clear Memory Byte
          clr     Counter_PartThrottleUnlock               ;Clear Memory Byte
Lbl_A247: ldab    PIA1_Buffer_t3                           ;Load Accumulator B
          orab    #0x20 ;(00100000)                        ;OR Accumulator B (Inclusive)
          bra     Lbl_A251                                 ;Branch Always
Lbl_A24D: ldab    PIA1_Buffer_t3                           ;Load Accumulator B
          andb    #0xDF ;(11011111)                        ;AND B with Memory
Lbl_A251: stab    PIA1_Buffer_t3                           ;Store Accumulator B
          rts                                              ;Return from Subroutine
a254_MM:  ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_A278                                 ;Branch if = Zero
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_8844 ;(0xA0/88.63 deg)             ;Compare A to Memory
          bcc     Lbl_A272                                 ;Branch if Higher or Same
          cmpa    TL_TL_8843 ;(0x9B/79.61 deg)             ;Compare A to Memory
          bcs     Lbl_A26B                                 ;Branch if Lower
          brset   *BitFlags2a, #b7_2A_bt7, Lbl_A272 ;(10000000)  ;Branch if Bit(s) Set
Lbl_A26B: bclr    *BitFlags2a, #b7_2A_bt7 ;(10000000)      ;Clear Bits(s)
          bclr    *PIA2_Buffer_t3, #b5_CE_bt5 ;(00100000)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbl_A272: bset    *BitFlags2a, #b7_2A_bt7 ;(10000000)      ;Set Bit(s)
          bset    *PIA2_Buffer_t3, #b5_CE_bt5 ;(00100000)  ;Set Bit(s)
Lbl_A278: rts                                              ;Return from Subroutine
a279_MM:  ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_A28B                                 ;Branch if = Zero
          brset   *BitFlags29, #$%01000000, Lbl_A288       ;Branch if Bit(s) Set
          bclr    *PIA2_Buffer_t3, #b2_CE_bt2 ;(00000100)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbl_A288: bset    *PIA2_Buffer_t3, #b2_CE_bt2 ;(00000100)  ;Set Bit(s)
Lbl_A28B: rts                                              ;Return from Subroutine
ControlFan_MM:
          ldaa    TL_CONF01 ;(0x41/65.00 Y units)          ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          bne     TurnFanOff                               ;Branch if Not = Zero
          ldaa    TL_ConfigurationFlags2 ;(0x22/34.00 out)  ;Load Accumulator A
          bita    #0x04 ;(00000100)                        ;Bit(s) Test A with Memory
          beq     TurnFanOff                               ;Branch if = Zero
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_A2E7 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          bne     TurnFanOff                               ;Branch if Not = Zero
          brset   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, TurnFanOn ;(00000010)  ;Branch if Bit(s) Set
          ldaa    BitFlags27                               ;Load Accumulator A
          bita    #0xC0 ;(11000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_A2B2                                 ;Branch if = Zero
          brclr   *PIA2_Buffer_t3, #b0_CE_bt0, TurnFanOn ;(00000001)  ;Branch if Bit(s) Clear
Lbl_A2B2: ldx     #TL_FanTurnOnTempAbove45Mph ;(0xE7/216.71 deg)  ;Load Index Register X
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    TL_FanControlSpeedHi ;(0xFF/128.00 mph)  ;Compare A to Memory
          bcc     Below44MPH                               ;Branch if Higher or Same
          cmpa    TL_FanControlSpeedLo ;(0xFE/127.50 mph)  ;Compare A to Memory
          bcs     Above36MPH                               ;Branch if Lower
          brset   *BitFlags2a, #b3_2A_SpeedUnder40, Below44MPH ;(00001000)  ;Branch if Bit(s) Set
Above36MPH:
          inx                                              ;Increment Index Register X
          inx                                              ;Increment Index Register X
          bclr    *BitFlags2a, #b3_2A_SpeedUnder40 ;(00001000)  ;Clear Bits(s)
          bra     Lbl_A2CF                                 ;Branch Always
Below44MPH:
          bset    *BitFlags2a, #b3_2A_SpeedUnder40 ;(00001000)  ;Set Bit(s)
Lbl_A2CF: brset   *PIA1_Buffer_t3, #b7_CD_FanRelay, Lbl_A2D4 ;(10000000)  ;Branch if Bit(s) Set
          inx                                              ;Increment Index Register X
Lbl_A2D4: ldab    0x00, X                                  ;Load Accumulator B
          cmpb    CoolantTemp                              ;Compare B to Memory
          bcc     Lbl_A2E7                                 ;Branch if Higher or Same
TurnFanOn:brclr   *PIA1_Buffer_t3, #b7_CD_FanRelay, TurnFanOffByTimer ;(10000000)  ;Branch if Bit(s) Clear
          ldaa    #0x07 ;(00000111)                        ;Load Accumulator A
          staa    Timer_MinimumFanRun                      ;Store Accumulator A
          bclr    *PIA1_Buffer_t3, #b7_CD_FanRelay ;(10000000)  ;Clear Bits(s)
          bra     TurnFanOff                               ;Branch Always
Lbl_A2E7: ldaa    Timer_MinimumFanRun                      ;Load Accumulator A
          bne     TurnFanOffByTimer                        ;Branch if Not = Zero
          bset    *PIA1_Buffer_t3, #b7_CD_FanRelay ;(10000000)  ;Set Bit(s)
          bra     TurnFanOff                               ;Branch Always
TurnFanOffByTimer:
          ldaa    Timer_MinimumFanRun                      ;Load Accumulator A
          beq     TurnFanOff                               ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Timer_MinimumFanRun                      ;Store Accumulator A
TurnFanOff:
          rts                                              ;Return from Subroutine
CalculateTargetIdleSpeedAndAisPosition_MM:
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_A305 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    Timer_AisChanges                         ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_A308                                 ;Branch if = Zero
          staa    Timer_AisChanges                         ;Store Accumulator A
          bra     Lbl_A308                                 ;Branch Always
Lbl_A305: clr     Timer_AisChanges                         ;Clear Memory Byte
Lbl_A308: brclr   *BitFlags27, #b1_27_ATXInGear, Lbl_A313 ;(00000010)  ;Branch if Bit(s) Clear
          brset   *StartupSwitchMirror1, #b0_61_bt0, Lbl_A313 ;(00000001)  ;Branch if Bit(s) Set
          bclr    *BitFlags68_t3, #b7_25_ATXChgGear ;(10000000)  ;Clear Bits(s)
Lbl_A313: brset   *BitFlags68_t3, #b7_25_ATXChgGear, Lbl_A320 ;(10000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags6d_t3, #b3_28_bt3, Lbl_A323 ;(00001000)  ;Branch if Bit(s) Clear
LoadDiagIdleSpeed:
          ldaa    #0x30 ;(00110000)                        ;Load Accumulator A
          jmp     Lbl_A3B0                                 ;Jump
Lbl_A320: jmp     Lbl_A3B5                                 ;Jump
Lbl_A323: ldx     #TL_IdleSpeedDrive_FromTemp              ;Load Index Register X
          brset   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_A387 ;(00010000)  ;Branch if Bit(s) Set
          ldaa    DRBPointer1                              ;Load Accumulator A
          cmpa    #0x19 ;(00011001)                        ;Compare A to Memory
          beq     Lbl_A342                                 ;Branch if = Zero
          brclr   *BitFlags6d_t3, #b0_28_InMotion, Lbl_A352 ;(00000001)  ;Branch if Bit(s) Clear
          ldd     TargetIdleSpeedHB                        ;Load Double Accumulator D
          subd    #0x0001                                  ;Subtract Memory from D
          bitb    #0x3F ;(00111111)                        ;Bit(s) Test B with Memory
          bne     Lbl_A3B3                                 ;Branch if Not = Zero
          bclr    *BitFlags6d_t3, #b0_28_InMotion ;(00000001)  ;Clear Bits(s)
          bra     Lbl_A3B3                                 ;Branch Always
Lbl_A342: brset   *DRBSerialMode, #b5_DB_TestType3, Lbl_A3B5 ;(00100000)  ;Branch if Bit(s) Set
          clr     DRBPointer1                              ;Clear Memory Byte
          ldaa    DRBPointer2                              ;Load Accumulator A
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
          bset    *BitFlags6d_t3, #b0_28_InMotion ;(00000001)  ;Set Bit(s)
          bra     Lbl_A3B1                                 ;Branch Always
Lbl_A352: brclr   *BitFlags2d, #b2_2D_a6cb1, Lbl_A364 ;(00000100)  ;Branch if Bit(s) Clear
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_A364 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    #0x08 ;(00001000)                        ;Compare A to Memory
;   22.5 sec
          bcs     Lbl_A364                                 ;Branch if Lower
          ldaa    #0x70 ;(01110000)                        ;Load Accumulator A
          bra     Lbl_A3B0                                 ;Branch Always
Lbl_A364: ldaa    TL_TargetIdleSpeed_HBDefault ;(0x64/3212.55 rpm)  ;Load Accumulator A
          brset   *BitFlags2a, #b0_2A_bt0, Lbl_A3B0 ;(00000001)  ;Branch if Bit(s) Set
          brset   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, Lbl_A3B0 ;(00000010)  ;Branch if Bit(s) Set
          brclr   *BitFlags27, #b1_27_ATXInGear, Lbl_A384 ;(00000010)  ;Branch if Bit(s) Clear
          brset   *StartupSwitchMirror1, #b0_61_bt0, Lbl_A384 ;(00000001)  ;Branch if Bit(s) Set
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    TL_TL_882D ;(0x05/2.51 mph)              ;Compare A to Memory
          bcc     Lbl_A384                                 ;Branch if Higher or Same
          ldaa    TL_TL_882C ;(0x80/64.25 mph)             ;Load Accumulator A
          jmp     Lbl_A3B0                                 ;Jump
Lbl_A384: ldx     #TL_IdleSpeedParkNeutral_FromTemp        ;Load Index Register X
Lbl_A387: ldaa    CoolantTemp                              ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          brset   *KeyOnOrEngineRunningTime, #$%11111111, Lbl_A39F ;Branch if Bit(s) Set
;   branch if engine running > 720 sec
          psha                                             ;Push A onto Stack
          ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          ldx     #TL_DecelAisBaseAirflowCurveOffset_FromTime2 ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          pulb                                             ;Pull B from Stack
          aba                                              ;Add Accumulators
          bcc     Lbl_A39F                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_A39F: ldab    BitFlags27                               ;Load Accumulator B
          bitb    #0xC0 ;(11000000)                        ;Bit(s) Test B with Memory
          beq     Lbl_A3B0                                 ;Branch if = Zero
          brclr   *StartupSwitchMirror1, #b6_61_IdleSpeedMode, Lbl_A3B0 ;(01000000)  ;Branch if Bit(s) Clear
          ldab    TL_TL_8755 ;(0x5A/722.82 rpm)            ;Load Accumulator B
          cba                                              ;Compare A to B
          bcc     Lbl_A3B0                                 ;Branch if Higher or Same
          tba                                              ;Transfer B to A
Lbl_A3B0: clrb                                             ;Clear Accumulator B
Lbl_A3B1: lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
Lbl_A3B3: std     TargetIdleSpeedHB                        ;Store Accumulator D
Lbl_A3B5: ldaa    ATMOffset                                ;Load Accumulator A
          cmpa    #0x07 ;(00000111)                        ;Compare A to Memory
          beq     Lbl_A3FF                                 ;Branch if = Zero
          cmpa    #0x14 ;(00010100)                        ;Compare A to Memory
          beq     Lbl_A3FF                                 ;Branch if = Zero
DecelFuelCut:
          brset   *BitFlags36_t3, #b5_7_bt5, Lbl_A3C7 ;(00100000)  ;Branch if Bit(s) Set
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_A3EF ;(01000000)  ;Branch if Bit(s) Set
Lbl_A3C7: ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          cmpa    CurrentAisPosition                       ;Compare A to Memory
          bne     Lbl_A3D4                                 ;Branch if Not = Zero
          brset   *BitFlags36_t3, #b6_7_UseAIS, Lbl_A3D4 ;(01000000)  ;Branch if Bit(s) Set
          bclr    *BitFlags36_t3, #b5_7_bt5 ;(00100000)    ;Clear Bits(s)
Lbl_A3D4: ldaa    CoolantTemp                              ;Load Accumulator A
          ldx     #TL_AisStartupPosition_FromTemp          ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          psha                                             ;Push A onto Stack
          ldaa    BaroPressure                             ;Load Accumulator A
          ldx     #TL_TL_86C1                              ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          pulb                                             ;Pull B from Stack
          aba                                              ;Add Accumulators
          bcc     Lbl_A3EC                                 ;Branch if Higher or Same
          jmp     Lbl_A56D                                 ;Jump
Lbl_A3EC: jmp     Lbl_A55F                                 ;Jump
Lbl_A3EF: brclr   *b5C_IPL1_t3, #b7_D5_MapStuck| b3_D5_MapBadSignal, HandleAcCutout ;(10001000)  ;Branch if Bit(s) Clear
          ldaa    TL_AIS_Constant_0x20 ;(0x20/32.00 Y units)  ;Load Accumulator A
          staa    DesiredNewAisPosition                    ;Store Accumulator A
          brclr   *BitFlags68_t3, #b6_25_AcClutch, Lbl_A400 ;(01000000)  ;Branch if Bit(s) Clear
          bset    *BitFlags68_t3, #b3_25_bt3| b2_25_AIS ;(00001100)  ;Set Bit(s)
Lbl_A3FF: rts                                              ;Return from Subroutine
Lbl_A400: bclr    *BitFlags68_t3, #b3_25_bt3| b2_25_AIS ;(00001100)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
HandleAcCutout:
          jsr     Lbl_A5A5                                 ;Jump to Subroutine
          dex                                              ;Decrement Index Register X
          bne     Lbl_A40B                                 ;Branch if Not = Zero
          rts                                              ;Return from Subroutine
Lbl_A40B: brclr   *BitFlags68_t3, #b1_25_bt1, Lbl_A441 ;(00000010)  ;Branch if Bit(s) Clear
          ldx     #TL_TL_8780                              ;Load Index Register X
          ldaa    BaroPressure                             ;Load Accumulator A
          brclr   *StartupSwitchMirror1, #b0_61_bt0, Lbl_A41B ;(00000001)  ;Branch if Bit(s) Clear
          ldx     #TL_TL_878A                              ;Load Index Register X
Lbl_A41B: jsr     OddBallLookup                            ;Jump to Subroutine
          tba                                              ;Transfer B to A
          brclr   *StartupSwitchMirror1, #b0_61_bt0, Lbl_A42D ;(00000001)  ;Branch if Bit(s) Clear
          nega                                             ;2's Complement A
          brclr   *BitFlags2d, #b5_2D_bt5, Lbl_A43D ;(00100000)  ;Branch if Bit(s) Clear
          bclr    *BitFlags2d, #b5_2D_bt5 ;(00100000)      ;Clear Bits(s)
          bra     Lbl_A437                                 ;Branch Always
Lbl_A42D: ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    TL_TL_8789 ;(0x2F/1509.90 rpm)           ;Compare B to Memory
          bcc     Lbl_A43D                                 ;Branch if Higher or Same
          bset    *BitFlags2d, #b5_2D_bt5 ;(00100000)      ;Set Bit(s)
Lbl_A437: jsr     StoreAndLimitDesiredAisPosition          ;Jump to Subroutine
          clra                                             ;Clear Accumulator A
          staa    Timer_AisChanges                         ;Store Accumulator A
Lbl_A43D: bclr    *BitFlags68_t3, #b1_25_bt1 ;(00000010)   ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbl_A441: brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_A45C ;(10000000)  ;Branch if Bit(s) Clear
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_A44C ;(00000001)  ;Branch if Bit(s) Set
          bclr    *BitFlags68_t3, #b7_25_ATXChgGear ;(10000000)  ;Clear Bits(s)
Lbl_A44C: brclr   *StartupSwitchMirror1, #b5_61_Brake, Lbl_A460 ;(00100000)  ;Branch if Bit(s) Clear
          ldx     #TL_BrakeOverrideForAis_FromDeltaThrottle ;Load Index Register X
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          cmpa    EngineRpm_HB                             ;Compare A to Memory
          bcc     Lbl_A460                                 ;Branch if Higher or Same
Lbl_A45C: brclr   *BitFlags66_t3, #b5_22_AtIdle, Lbl_A463 ;(00100000)  ;Branch if Bit(s) Clear
Lbl_A460: jmp     Lbl_A4D0                                 ;Jump
Lbl_A463: brset   *BitFlags66_t3, #b2_22_FallToIdle, Lbl_A3FF ;(00000100)  ;Branch if Bit(s) Set
          ldab    Timer_CountdownFromStartRunForAisFeedback ;Load Accumulator B
          bne     Lbl_A3FF                                 ;Branch if Not = Zero
          ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          cmpa    #0x04 ;(00000100)                        ;Compare A to Memory
          bcs     Lbl_A474                                 ;Branch if Lower
          bclr    *BitFlags36_t3, #b4_7_bt4 ;(00010000)    ;Clear Bits(s)
Lbl_A474: brclr   *BitFlags27, #b1_27_ATXInGear, Lbl_A47C ;(00000010)  ;Branch if Bit(s) Clear
          brclr   *StartupSwitchMirror1, #b0_61_bt0, Lbl_A498 ;(00000001)  ;Branch if Bit(s) Clear
Lbl_A47C: brclr   *BitFlags68_t3, #b7_25_ATXChgGear, Lbl_A498 ;(10000000)  ;Branch if Bit(s) Clear
          ldx     #TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK   ;Load Index Register X
          brclr   *StartupSwitchMirror1, #b4_61_PNswitch, Lbl_A48A ;(00010000)  ;Branch if Bit(s) Clear
          ldx     #TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK2  ;Load Index Register X
Lbl_A48A: ldaa    CoolantTemp                              ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          jsr     StoreAndLimitDesiredAisPosition          ;Jump to Subroutine
          clra                                             ;Clear Accumulator A
          staa    Timer_AisChanges                         ;Store Accumulator A
          bclr    *BitFlags68_t3, #b7_25_ATXChgGear ;(10000000)  ;Clear Bits(s)
Lbl_A498: ldab    TL_AisPeriodForRpmFeedback11ms ;(0x38/56.00 out)  ;Load Accumulator B
          cmpb    Timer_AisChanges                         ;Compare B to Memory
          bcc     Lbl_A4CF                                 ;Branch if Higher or Same
          ldx     #TL_ForwardAisSteps_NoSlope              ;Load Index Register X
          ldd     TargetIdleSpeedHB                        ;Load Double Accumulator D
          subd    EngineRpm_HB                             ;Subtract Memory from D
          bcc     Lbl_A4AF                                 ;Branch if Higher or Same
          ldx     #TL_ReverseAisSteps_NoSlope              ;Load Index Register X
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          subd    TargetIdleSpeedHB                        ;Subtract Memory from D
Lbl_A4AF: lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_A4B9 ;(00000001)  ;Branch if Bit(s) Set
          brset   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_A4BA ;(00010000)  ;Branch if Bit(s) Set
Lbl_A4B9: lsrd                                             ;Logical Shift Right D
Lbl_A4BA: tsta                                             ;Test for Zero or Minus
          beq     Lbl_A4BF                                 ;Branch if = Zero
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_A4BF: tba                                              ;Transfer B to A
          cmpa    0x01, X                                  ;Compare A to Memory
          bcs     Lbl_A4CF                                 ;Branch if Lower
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          beq     Lbl_A4CF                                 ;Branch if = Zero
          jsr     StoreAndLimitDesiredAisPosition          ;Jump to Subroutine
          clra                                             ;Clear Accumulator A
          staa    Timer_AisChanges                         ;Store Accumulator A
Lbl_A4CF: rts                                              ;Return from Subroutine
Lbl_A4D0: ldaa    CoolantTemp                              ;Load Accumulator A
          ldx     #TL_AisColdPosition_FromTemp             ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    Temp5                                    ;Store Accumulator A
          ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          ldx     #TL_TL_86F0                              ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          adda    Temp5                                    ;Add Memory to A
          bcc     Lbl_A4EB                                 ;Branch if Higher or Same
          jmp     Lbl_A56D                                 ;Jump
Lbl_A4EB: staa    Temp5                                    ;Store Accumulator A
          ldaa    BaroPressure                             ;Load Accumulator A
          ldx     #TL_TL_8719                              ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldaa    Temp5                                    ;Load Accumulator A
          mul                                              ;Multiply A x B = D
          asld                                             ;Arithmetic Shift Left D
          bcs     Lbl_A56D                                 ;Branch if Lower
          asld                                             ;Arithmetic Shift Left D
          bcs     Lbl_A56D                                 ;Branch if Lower
          staa    Temp5                                    ;Store Accumulator A
          ldx     #TL_AisPosition_FromRpm                  ;Load Index Register X
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          cmpa    Temp5                                    ;Compare A to Memory
          bcs     Lbl_A513                                 ;Branch if Lower
          staa    Temp5                                    ;Store Accumulator A
Lbl_A513: ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          ldx     #TL_AisPosition_FromThrottle             ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          cmpa    Temp5                                    ;Compare A to Memory
          bcc     Lbl_A523                                 ;Branch if Higher or Same
          ldaa    Temp5                                    ;Load Accumulator A
Lbl_A523: brset   *BitFlags68_t3, #b2_25_AIS, Lbl_A54D ;(00000100)  ;Branch if Bit(s) Set
          ldab    TL_ACPositionWhenTempToCold ;(0x10/16.00 Y units)  ;Load Accumulator B
          brset   *BitFlags66_t3, #b5_22_AtIdle, Lbl_A54A ;(00100000)  ;Branch if Bit(s) Set
          psha                                             ;Push A onto Stack
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_Use_ACCTBL_WhenTempAboveThisElseUse_ACPOS ;(0x94/66.98 deg)  ;Compare A to Memory
          bcs     Lbl_A549                                 ;Branch if Lower
          ldx     #TL_ACOffIdleDelta_FromSpeed             ;Load Index Register X
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          brclr   *BitFlags68_t3, #b3_25_bt3, Lbl_A549 ;(00001000)  ;Branch if Bit(s) Clear
          ldaa    TL_AcClutchAisAdjustmentConstant ;(0xFF/255.00 out)  ;Load Accumulator A
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
Lbl_A549: pula                                             ;Pull A from Stack
Lbl_A54A: aba                                              ;Add Accumulators
          bcs     Lbl_A56D                                 ;Branch if Lower
Lbl_A54D: brset   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_A556 ;(00010000)  ;Branch if Bit(s) Set
          adda    TL_AISAddedFromTimeEngRunning ;(0x00/.00 scale)  ;Add Memory to A
          bcs     Lbl_A56D                                 ;Branch if Lower
Lbl_A556: brclr   *StartupSwitchMirror1, #b6_61_IdleSpeedMode, Lbl_A55F ;(01000000)  ;Branch if Bit(s) Clear
          adda    TL_AISAddedFromTimeEngRunning2 ;(0x00/.00 scale)  ;Add Memory to A
          bcs     Lbl_A56D                                 ;Branch if Lower
Lbl_A55F: brset   *BitFlags36_t3, #b4_7_bt4, Lbl_A568 ;(00010000)  ;Branch if Bit(s) Set
          adda    TL_PositionAisMotorIsAtIdle ;(0x10/16.00 out)  ;Add Memory to A
          bcs     Lbl_A56D                                 ;Branch if Lower
Lbl_A568: cmpa    TL_AisHighLimitMaxOpenSteps ;(0xD8/216.00 out)  ;Compare A to Memory
          bcs     Lbl_A570                                 ;Branch if Lower
Lbl_A56D: ldaa    TL_AisHighLimitMaxOpenSteps ;(0xD8/216.00 out)  ;Load Accumulator A
Lbl_A570: brset   *BitFlags66_t3, #b5_22_AtIdle, Lbl_A585 ;(00100000)  ;Branch if Bit(s) Set
          cmpa    DesiredNewAisPosition                    ;Compare A to Memory
          bcc     Lbl_A582                                 ;Branch if Higher or Same
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    TL_UpdateRateOffIdleWhenAisClosing ;(0xFF/11111111)  ;Bit(s) Test B with Memory
          bne     Lbl_A584                                 ;Branch if Not = Zero
          ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          deca                                             ;Decrement Accumulator A
Lbl_A582: staa    DesiredNewAisPosition                    ;Store Accumulator A
Lbl_A584: rts                                              ;Return from Subroutine
Lbl_A585: bclr    *BitFlags66_t3, #b5_22_AtIdle ;(00100000)  ;Clear Bits(s)
          staa    DesiredNewAisPosition                    ;Store Accumulator A
          rts                                              ;Return from Subroutine
StoreAndLimitDesiredAisPosition:
          inx                                              ;Increment Index Register X
          tsta                                             ;Test for Zero or Minus
          bmi     Lbl_A59D                                 ;Branch if Minus
          adda    DesiredNewAisPosition                    ;Add Memory to A
          ldab    TL_AisHighLimitMaxOpenSteps ;(0xD8/216.00 out)  ;Load Accumulator B
          bcs     Lbl_A599                                 ;Branch if Lower
          cba                                              ;Compare A to B
          bcs     Lbl_A59A                                 ;Branch if Lower
Lbl_A599: tba                                              ;Transfer B to A
Lbl_A59A: staa    DesiredNewAisPosition                    ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_A59D: adda    DesiredNewAisPosition                    ;Add Memory to A
          bcs     Lbl_A5A2                                 ;Branch if Lower
          clra                                             ;Clear Accumulator A
Lbl_A5A2: staa    DesiredNewAisPosition                    ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_A5A5: ldx     #Ram_00                                  ;Load Index Register X
          ldab    BitFlags68_t3                            ;Load Accumulator B
          andb    #0x04 ;(00000100)                        ;AND B with Memory
          stab    Temp4                                    ;Store Accumulator B
          ldab    BitFlags68_t3                            ;Load Accumulator B
          andb    #0x40 ;(01000000)                        ;AND B with Memory
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          eorb    Temp4                                    ;Exclusive OR B with Memory
          bne     Lbl_A5D9                                 ;Branch if Not = Zero
          brset   *BitFlags68_t3, #b2_25_AIS, Lbl_A62A ;(00000100)  ;Branch if Bit(s) Set
          ldaa    Timer_AisOrO2Sensor                      ;Load Accumulator A
          beq     Lbl_A5D5                                 ;Branch if = Zero
          clrb                                             ;Clear Accumulator B
          stab    Timer_AisChanges                         ;Store Accumulator B
          deca                                             ;Decrement Accumulator A
          staa    Timer_AisOrO2Sensor                      ;Store Accumulator A
          bne     Lbl_A62A                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_A5D5 ;(10000000)  ;Branch if Bit(s) Set
          ldaa    TL_AcClutchKickOpenAfterAcEnabled ;(0x04/4.00 out)  ;Load Accumulator A
          bsr     StoreAndLimitDesiredAisPosition          ;Branch to Subroutine
Lbl_A5D5: bclr    *BitFlags68_t3, #b3_25_bt3 ;(00001000)   ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbl_A5D9: ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    TL_TL_8838 ;(0x02/5.65 sec)              ;Compare A to Memory
          bcs     Lbl_A62A                                 ;Branch if Lower
          eorb    BitFlags68_t3                            ;Exclusive OR B with Memory
          stab    BitFlags68_t3                            ;Store Accumulator B
          bitb    #0x04 ;(00000100)                        ;Bit(s) Test B with Memory
          bne     Lbl_A603                                 ;Branch if Not = Zero
          ldaa    TL_TL_86CE ;(0x28/40.00 Y units)         ;Load Accumulator A
          staa    Timer_AisOrO2Sensor                      ;Store Accumulator A
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_A5FA ;(10000000)  ;Branch if Bit(s) Set
          ldaa    TL_TL_877D ;(0x0C/12.00 Y units)         ;Load Accumulator A
          jsr     StoreAndLimitDesiredAisPosition          ;Jump to Subroutine
          bset    *BitFlags2f, #$%00001000                 ;Set Bit(s)
Lbl_A5FA: ldaa    Timer_AisOrO2Sensor                      ;Load Accumulator A
          beq     Lbl_A627                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Timer_AisOrO2Sensor                      ;Store Accumulator A
          bra     Lbl_A627                                 ;Branch Always
Lbl_A603: brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_A60F ;(10000000)  ;Branch if Bit(s) Set
          ldaa    TL_TL_877F ;(0xF4/244.00 Y units)        ;Load Accumulator A
          jsr     StoreAndLimitDesiredAisPosition          ;Jump to Subroutine
          bra     Lbl_A624                                 ;Branch Always
Lbl_A60F: ldx     #TL_ACOffIdleDelta_FromSpeed             ;Load Index Register X
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldab    TL_TL_86D0 ;(0xE0/224.00 Y units)        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          tab                                              ;Transfer A to B
          ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          sba                                              ;Subtract B from A
          bcc     Lbl_A622                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_A622: staa    DesiredNewAisPosition                    ;Store Accumulator A
Lbl_A624: clra                                             ;Clear Accumulator A
          staa    Timer_AisOrO2Sensor                      ;Store Accumulator A
Lbl_A627: clra                                             ;Clear Accumulator A
          staa    Timer_AisChanges                         ;Store Accumulator A
Lbl_A62A: bset    *BitFlags68_t3, #b3_25_bt3 ;(00001000)   ;Set Bit(s)
          rts                                              ;Return from Subroutine
CalculateAisPosition_MM:
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_A644 ;(01000000)  ;Branch if Bit(s) Clear
          brset   *BitFlags36_t3, #b5_7_bt5, Lbl_A644 ;(00100000)  ;Branch if Bit(s) Set
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_A644 ;(10000000)  ;Branch if Bit(s) Set
          ldaa    b5C_IPL1_t3                              ;Load Accumulator A
          bita    #0x88 ;(10001000)                        ;Bit(s) Test A with Memory
          bne     Lbl_A644                                 ;Branch if Not = Zero
          ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          beq     Lbl_A645                                 ;Branch if = Zero
Lbl_A644: rts                                              ;Return from Subroutine
Lbl_A645: ldaa    Timer_DacalCountdown                     ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          lsra                                             ;Logical Shift Right A
          brclr   *StartupSwitchMirror1, #b6_61_IdleSpeedMode, Lbl_A65F ;(01000000)  ;Branch if Bit(s) Clear
          tst     TL_Base_nominalCal ;(0x00/.00 out)       ;Test for Zero or Minus
          bmi     Lbl_A659                                 ;Branch if Minus
          adda    TL_Base_nominalCal ;(0x00/.00 out)       ;Add Memory to A
          bcs     Lbl_A69A                                 ;Branch if Lower
          bra     Lbl_A65F                                 ;Branch Always
Lbl_A659: adda    TL_Base_nominalCal ;(0x00/.00 out)       ;Add Memory to A
          bcs     Lbl_A65F                                 ;Branch if Lower
          clra                                             ;Clear Accumulator A
Lbl_A65F: adda    TL_TL_8828 ;(0x3D/61.00 Y units)         ;Add Memory to A
          bcs     Lbl_A69A                                 ;Branch if Lower
          psha                                             ;Push A onto Stack
          ldx     #TL_AISDecel_FromBaro                    ;Load Index Register X
          ldaa    BaroPressure                             ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          pula                                             ;Pull A from Stack
          negb                                             ;2's Complement B
          sba                                              ;Subtract B from A
          bcc     Lbl_A673                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_A673: brclr   *BitFlags66_t3, #b2_22_FallToIdle, Lbl_A69C ;(00000100)  ;Branch if Bit(s) Clear
          psha                                             ;Push A onto Stack
          ldx     #TL_DecelAisBaseAirflowCurveOffset_FromTime ;Load Index Register X
          ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          pula                                             ;Pull A from Stack
          aba                                              ;Add Accumulators
          bcs     Lbl_A69A                                 ;Branch if Lower
          psha                                             ;Push A onto Stack
          ldx     #TL_AISDecel_FromTemp                    ;Load Index Register X
          ldaa    CoolantTemp                              ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          pulb                                             ;Pull B from Stack
          aba                                              ;Add Accumulators
          bcs     Lbl_A69A                                 ;Branch if Lower
          brset   *PIA2_Buffer_t3, #b0_CE_bt0, Lbl_A69C ;(00000001)  ;Branch if Bit(s) Set
          adda    TL_ACFactorDeltaFromBase ;(0x10/16.00 out)  ;Add Memory to A
          bcc     Lbl_A69C                                 ;Branch if Higher or Same
Lbl_A69A: ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_A69C: ldab    DistributorFallingEdgePulsewidth_HB      ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          bcs     Lbl_A6A4                                 ;Branch if Lower
          lslb                                             ;Logical Shift Left B
          bcc     Lbl_A6A6                                 ;Branch if Higher or Same
Lbl_A6A4: ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_A6A6: mul                                              ;Multiply A x B = D
          asld                                             ;Arithmetic Shift Left D
          bcs     Lbl_A6D5                                 ;Branch if Lower
          staa    Temp5                                    ;Store Accumulator A
          ldx     #TL_AdditionToControlMap                 ;Load Index Register X
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          psha                                             ;Push A onto Stack
          ldx     #TL_TempTermForMapOffset_FromTemp        ;Load Index Register X
          ldaa    CoolantTemp                              ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          pulb                                             ;Pull B from Stack
          mul                                              ;Multiply A x B = D
          adca    Temp5                                    ;Add with Carry to A
          bcs     Lbl_A6D5                                 ;Branch if Lower
          staa    Temp5                                    ;Store Accumulator A
          ldx     #TL_OffsetCorrectionTo_MAPFLR_FromBaro   ;Load Index Register X
          ldaa    BaroPressure                             ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          adda    Temp5                                    ;Add Memory to A
          bcc     Lbl_A6D7                                 ;Branch if Higher or Same
Lbl_A6D5: ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_A6D7: staa    MAPOffsetForCylTrim                      ;Store Accumulator A
          brset   *BitFlags66_t3, #b2_22_FallToIdle, Lbl_A721 ;(00000100)  ;Branch if Bit(s) Set
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_A6E5 ;(00000001)  ;Branch if Bit(s) Set
          brclr   *StartupSwitchMirror1, #b4_61_PNswitch, Lbl_A71F ;(00010000)  ;Branch if Bit(s) Clear
Lbl_A6E5: ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    TL_DacalUpdateRate01_03_07_0f_1f_3f_7f_ff ;(0x7F/01111111)  ;Bit(s) Test B with Memory
          bne     Lbl_A71F                                 ;Branch if Not = Zero
          ldab    KeyOnOrEngineRunningTime                 ;Load Accumulator B
          cmpb    TL_DacalInhibitTimeAfterStartup ;(0x10/45.18 sec)  ;Compare B to Memory
          bcs     Lbl_A71F                                 ;Branch if Lower
          brclr   *PIA2_Buffer_t3, #b0_CE_bt0, Lbl_A71F ;(00000001)  ;Branch if Bit(s) Clear
          ldab    Timer_CountdownFromStartRunForAisFeedback ;Load Accumulator B
          bne     Lbl_A71F                                 ;Branch if Not = Zero
          ldab    CoolantTemp                              ;Load Accumulator B
          cmpb    TL_EngineTempToStartCalibratingDacal ;(0xD6/186.04 Deg)  ;Compare B to Memory
          bcs     Lbl_A71F                                 ;Branch if Lower
          ldab    TargetIdleSpeedHB                        ;Load Accumulator B
          subb    EngineRpm_HB                             ;Subtract Memory from B
          bcc     Lbl_A709                                 ;Branch if Higher or Same
          negb                                             ;2's Complement B
Lbl_A709: cmpb    TL_DeltaRpmFromIdleSpeedForDacalUpdate ;(0x02/2.00 rpm)  ;Compare B to Memory
          bhi     Lbl_A71F                                 ;Branch if Higher
          ldab    Timer_DacalCountdown                     ;Load Accumulator B
          cmpa    MapValue                                 ;Compare A to Memory
          bhi     Lbl_A717                                 ;Branch if Higher
          incb                                             ;Increment Accumulator B
          bne     Lbl_A71B                                 ;Branch if Not = Zero
Lbl_A717: tstb                                             ;Test for Zero or Minus
          beq     Lbl_A723                                 ;Branch if = Zero
          decb                                             ;Decrement Accumulator B
Lbl_A71B: stab    Timer_DacalCountdown                     ;Store Accumulator B
          bra     Lbl_A723                                 ;Branch Always
Lbl_A71F: bra     Lbl_A78C                                 ;Branch Always
Lbl_A721: bra     Lbl_A78D                                 ;Branch Always
Lbl_A723: brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_A72B ;(00000001)  ;Branch if Bit(s) Set
          brclr   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_A78C ;(00010000)  ;Branch if Bit(s) Clear
Lbl_A72B: ldaa    Timer_AisChanges                         ;Load Accumulator A
          cmpa    TL_AisPeriodForRpmFeedback11ms ;(0x38/56.00 out)  ;Compare A to Memory
          bcs     Lbl_A78C                                 ;Branch if Lower
          brset   *StartupSwitchMirror1, #b6_61_IdleSpeedMode, Lbl_A757 ;(01000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags2f, #$%00100000, Lbl_A746       ;Branch if Bit(s) Clear
          ldaa    TL_PositionAisMotorIsAtIdle ;(0x10/16.00 out)  ;Load Accumulator A
          staa    CurrentAisPosition                       ;Store Accumulator A
          staa    DesiredNewAisPosition                    ;Store Accumulator A
          bclr    *BitFlags2f, #$%00100000                 ;Clear Bits(s)
          bra     Lbl_A78C                                 ;Branch Always
Lbl_A746: ldaa    CurrentAisPosition                       ;Load Accumulator A
          cmpa    DesiredNewAisPosition                    ;Compare A to Memory
          bne     Lbl_A78C                                 ;Branch if Not = Zero
          ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          cmpa    TL_PositionAisMotorIsAtIdle ;(0x10/16.00 out)  ;Compare A to Memory
          beq     Lbl_A78C                                 ;Branch if = Zero
          bhi     Lbl_A787                                 ;Branch if Higher
          bra     Lbl_A785                                 ;Branch Always
Lbl_A757: brclr   *BitFlags2f, #$%00100000, Lbl_A76E       ;Branch if Bit(s) Clear
          ldaa    TL_PositionAisMotorIsAtIdle ;(0x10/16.00 out)  ;Load Accumulator A
          adda    TL_AISAddedFromTimeEngRunning2 ;(0x00/.00 scale)  ;Add Memory to A
          bcc     Lbl_A765                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_A765: staa    CurrentAisPosition                       ;Store Accumulator A
          staa    DesiredNewAisPosition                    ;Store Accumulator A
          bclr    *BitFlags2f, #$%00100000                 ;Clear Bits(s)
          bra     Lbl_A78C                                 ;Branch Always
Lbl_A76E: ldaa    CurrentAisPosition                       ;Load Accumulator A
          cmpa    DesiredNewAisPosition                    ;Compare A to Memory
          bne     Lbl_A78C                                 ;Branch if Not = Zero
          ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          ldab    TL_PositionAisMotorIsAtIdle ;(0x10/16.00 out)  ;Load Accumulator B
          addb    TL_AISAddedFromTimeEngRunning2 ;(0x00/.00 scale)  ;Add Memory to B
          bcc     Lbl_A780                                 ;Branch if Higher or Same
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_A780: cba                                              ;Compare A to B
          beq     Lbl_A78C                                 ;Branch if = Zero
          bhi     Lbl_A787                                 ;Branch if Higher
Lbl_A785: inca                                             ;Increment Accumulator A
          inca                                             ;Increment Accumulator A
Lbl_A787: deca                                             ;Decrement Accumulator A
          staa    DesiredNewAisPosition                    ;Store Accumulator A
          staa    CurrentAisPosition                       ;Store Accumulator A
Lbl_A78C: rts                                              ;Return from Subroutine
Lbl_A78D: ldab    Timer_CountdownFromStartRunForAisFeedback ;Load Accumulator B
          bne     Lbl_A78C                                 ;Branch if Not = Zero
          ldab    Timer_AisChanges                         ;Load Accumulator B
          cmpb    TL_TimeBetweenAisPulsesForDecelAis ;(0x20/.35 Sec)  ;Compare B to Memory
          bcs     Lbl_A78C                                 ;Branch if Lower
          ldx     #TL_DecelAisOpenStepsFromNeg_FromDeltaMap ;Load Index Register X
          suba    MapValue                                 ;Subtract Memory from A
          bcc     Lbl_A7A3                                 ;Branch if Higher or Same
          nega                                             ;2's Complement A
          ldx     #TL_DecelAisOpenStepsFromPos_FromDeltaMap ;Load Index Register X
Lbl_A7A3: jsr     Lookup4ByteTable                         ;Jump to Subroutine
          jsr     StoreAndLimitDesiredAisPosition          ;Jump to Subroutine
          staa    DesiredNewAisPosition                    ;Store Accumulator A
          cmpa    CurrentAisPosition                       ;Compare A to Memory
          beq     Lbl_A78C                                 ;Branch if = Zero
          clr     Timer_AisChanges                         ;Clear Memory Byte
          rts                                              ;Return from Subroutine
KickUpAisBy2DuringDecel_MM:
          brset   *BitFlags66_t3, #b2_22_FallToIdle, Lbl_A7D2 ;(00000100)  ;Branch if Bit(s) Set
          ldaa    b5C_IPL1_t3                              ;Load Accumulator A
          bita    #0x88 ;(10001000)                        ;Bit(s) Test A with Memory
          bne     Lbl_A7D2                                 ;Branch if Not = Zero
          ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          oraa    CurrentAisPosition                       ;OR Accumulator A (Inclusive)
          bne     Lbl_A7D2                                 ;Branch if Not = Zero
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x7F ;(01111111)                        ;Bit(s) Test B with Memory
          bne     Lbl_A7D2                                 ;Branch if Not = Zero
          adda    #0x02 ;(00000010)                        ;Add Memory to A
          staa    CurrentAisPosition                       ;Store Accumulator A
          staa    DesiredNewAisPosition                    ;Store Accumulator A
          bset    *BitFlags36_t3, #b4_7_bt4 ;(00010000)    ;Set Bit(s)
Lbl_A7D2: rts                                              ;Return from Subroutine
ControlCruiseServo0_MM:
          brclr   *b5C_IPL1_t3, #b6_D5_TpsBadSignal, CruiseIsSwitchedOn ;(01000000)  ;Branch if Bit(s) Clear
          bclr    *Counter_Cruise_1, #$%00001111           ;Clear Bits(s)
          bset    *Counter_Cruise_1, #$%00001110           ;Set Bit(s)
          bra     DropOutOfCruise                          ;Branch Always
CruiseIsSwitchedOn:
          bclr    *Counter_Cruise_1, #$%00001111           ;Clear Bits(s)
          brset   *StartupSwitchMirror1, #b2_61_CruiseResume, CruiseResumeSwitchPressed ;(00000100)  ;Branch if Bit(s) Set
          clrb                                             ;Clear Accumulator B
          stab    CruiseSpeedSetpoint                      ;Store Accumulator B
          bra     Lbl_A856                                 ;Branch Always
CruiseResumeSwitchPressed:
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          staa    Temp0                                    ;Store Accumulator A
          cmpa    TL_UnknownConstForCruiseControl21 ;(0x3C/30.00 MPH)  ;Compare A to Memory
          bcs     DropOutOfCruise                          ;Branch if Lower
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_UnknownConstForCruiseControl22 ;(0x9A/4947.33 rpm)  ;Compare A to Memory
          bcc     DropOutOfCruise                          ;Branch if Higher or Same
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          brset   *StartupSwitchMirror1, #b5_61_Brake, DropOutOfCruise ;(00100000)  ;Branch if Bit(s) Set
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          brset   *BitFlags27, #b0_27_cfg_ATX, Cruise_SkipPNCheck ;(00000001)  ;Branch if Bit(s) Set
          brclr   *StartupSwitchMirror1, #b4_61_PNswitch, DropOutOfCruise ;(00010000)  ;Branch if Bit(s) Clear
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          bra     Lbl_A87F                                 ;Branch Always
Cruise_SkipPNCheck:
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          bne     Lbl_A842                                 ;Branch if Not = Zero
          brclr   *BitFlags2f, #$%00000010, Lbl_A836       ;Branch if Bit(s) Clear
          brset   *CruiseStatus_1, #$%10000000, DropOutOfCruise ;Branch if Bit(s) Set
          bset    *BitFlags2f, #$%00000100                 ;Set Bit(s)
          bra     DropOutOfCruise                          ;Branch Always
Lbl_A836: ldab    ScaledDistPWForCruiseControl             ;Load Accumulator B
          cmpb    TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableHi ;(0x40/64.00 out)  ;Compare B to Memory
          bcc     DropOutOfCruise                          ;Branch if Higher or Same
          cmpb    TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableLo ;(0x00/.00 out)  ;Compare B to Memory
          bcs     DropOutOfCruise                          ;Branch if Lower
Lbl_A842: inc     Counter_Cruise_1                         ;Increment Memory Byte
          brset   *CruiseStatus_1, #$%10000000, Lbl_A87F   ;Branch if Bit(s) Set
          brclr   *BitFlags24, #b3_24_BadSpeedo2, Lbl_A87F ;(00001000)  ;Branch if Bit(s) Clear
DropOutOfCruise:
          brclr   *CruiseStatus_1, #$%00011000, Lbl_A856   ;Branch if Bit(s) Clear
          ldaa    Temp0                                    ;Load Accumulator A
          staa    CruiseSpeedSetpoint                      ;Store Accumulator A
Lbl_A856: brset   *CruiseStatus_1, #$%10000000, Lbl_A863   ;Branch if Bit(s) Set
          ldab    Counter_Cruise_1                         ;Load Accumulator B
          andb    #0x0F ;(00001111)                        ;AND B with Memory
          ldaa    #0x11 ;(00010001)                        ;Load Accumulator A
          mul                                              ;Multiply A x B = D
          stab    Counter_Cruise_1                         ;Store Accumulator B
Lbl_A863: clrb                                             ;Clear Accumulator B
          stab    Timer_CruiseDecelerate                   ;Store Accumulator B
          stab    Counter_Cruise_4                         ;Store Accumulator B
          stab    CruiseControlVar0                        ;Store Accumulator B
          stab    Counter_Cruise_2                         ;Store Accumulator B
          stab    CruiseControlVar6                        ;Store Accumulator B
          stab    CruiseControlVar1                        ;Store Accumulator B
          bclr    *CruiseStatus_1, #$%00011111             ;Clear Bits(s)
          bset    *CruiseStatus_1, #$%10100000             ;Set Bit(s)
          bclr    *CruiseStatus_2, #$%00001111             ;Clear Bits(s)
          bset    *Timer_CruiseDecelerate, #$%10000000     ;Set Bit(s)
          jmp     Lbl_AA35                                 ;Jump
Lbl_A87F: inc     Counter_Cruise_1                         ;Increment Memory Byte
          ldaa    Temp1_t3                                 ;Load Accumulator A
          tab                                              ;Transfer A to B
          eora    PIA2_Buffer_t3_Temp                      ;Exclusive OR A with Memory
          anda    #0xC0 ;(11000000)                        ;AND A with Memory
          beq     Lbl_A8E4                                 ;Branch if = Zero
          brset   *BitFlags6a_t3, #b0_26_bt0, Lbl_A8E4 ;(00000001)  ;Branch if Bit(s) Set
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_A896                                 ;Branch if Not = Zero
          lsrb                                             ;Logical Shift Right B
Lbl_A896: ldaa    #0x00 ;(00000000)                        ;Load Accumulator A
          bitb    #0x40 ;(01000000)                        ;Bit(s) Test B with Memory
          bne     Lbl_A8D2                                 ;Branch if Not = Zero
          brset   *CruiseStatus_1, #$%10000000, ContinueCruise ;Branch if Bit(s) Set
          ldaa    Temp0                                    ;Load Accumulator A
          psha                                             ;Push A onto Stack
          ldd     #0x0F89                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          pula                                             ;Pull A from Stack
          staa    Temp0                                    ;Store Accumulator A
          ldd     #0x0F08                                  ;Load Double Accumulator D
          ldx     #ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB ;Load Index Register X
          cmpa    0x00, X                                  ;Compare A to Memory
          beq     Lbl_A8BD                                 ;Branch if = Zero
          inx                                              ;Increment Index Register X
          cmpa    0x00, X                                  ;Compare A to Memory
          bne     Lbl_A8E4                                 ;Branch if Not = Zero
Lbl_A8BD: cmpb    0x02, X                                  ;Compare B to Memory
          bne     Lbl_A8E4                                 ;Branch if Not = Zero
          clr     0x00, X                                  ;Clear Memory Byte
          clr     0x02, X                                  ;Clear Memory Byte
          bra     DropOutOfCruise                          ;Branch Always
ContinueCruise:
          ldaa    #0x07 ;(00000111)                        ;Load Accumulator A
          ldab    Temp1_t3                                 ;Load Accumulator B
          bitb    #0xC0 ;(11000000)                        ;Bit(s) Test B with Memory
          bne     Lbl_A8D2                                 ;Branch if Not = Zero
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_A8D2: bita    Counter_MainLoop                         ;Bit(s) Test A with Memory
          bne     Lbl_A8E4                                 ;Branch if Not = Zero
          ldaa    Temp0                                    ;Load Accumulator A
          psha                                             ;Push A onto Stack
          ldd     #0x0F10                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          pula                                             ;Pull A from Stack
          staa    Temp0                                    ;Store Accumulator A
Lbl_A8E4: inc     Counter_Cruise_1                         ;Increment Memory Byte
          brset   *StartupSwitchMirror1, #b1_61_CruiseSet, Lbl_A93F ;(00000010)  ;Branch if Bit(s) Set
          ldab    Timer_CruiseDecelerate                   ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          bne     Lbl_A8F1                                 ;Branch if Not = Zero
          decb                                             ;Decrement Accumulator B
Lbl_A8F1: stab    Timer_CruiseDecelerate                   ;Store Accumulator B
          brset   *CruiseStatus_1, #$%00000001, Lbl_A910   ;Branch if Bit(s) Set
          brset   *Timer_CruiseDecelerate, #$%10000000, Lbl_A91A ;Branch if Bit(s) Set
          cmpb    #0x04 ;(00000100)                        ;Compare B to Memory
          bls     Lbl_A91A                                 ;Branch if Lower or Same
          bset    *CruiseStatus_1, #$%00100001             ;Set Bit(s)
          bclr    *CruiseStatus_1, #$%00001010             ;Clear Bits(s)
          bset    *CruiseStatus_2, #$%00000100             ;Set Bit(s)
          clra                                             ;Clear Accumulator A
          staa    Counter_Cruise_4                         ;Store Accumulator A
          staa    CruiseControlVar0                        ;Store Accumulator A
          bclr    *CruiseStatus_1, #$%00000100             ;Clear Bits(s)
Lbl_A910: brset   *CruiseStatus_1, #$%10000000, Lbl_A91A   ;Branch if Bit(s) Set
          brset   *CruiseStatus_1, #$%00010000, Lbl_A92D   ;Branch if Bit(s) Set
          bra     Lbl_A91D                                 ;Branch Always
Lbl_A91A: jmp     Lbl_AB45                                 ;Jump
Lbl_A91D: cmpb    TL_UnknownConstForCruiseControl46 ;(0x02/1.00 MPH)  ;Compare B to Memory
          bls     Lbl_A91A                                 ;Branch if Lower or Same
          bset    *CruiseStatus_1, #$%00010000             ;Set Bit(s)
          bclr    *CruiseStatus_2, #$%00000011             ;Clear Bits(s)
          ldaa    Temp0                                    ;Load Accumulator A
          staa    CruiseControlVar0                        ;Store Accumulator A
Lbl_A92D: ldab    CruiseStatus_2                           ;Load Accumulator B
          cmpb    #0xA0 ;(10100000)                        ;Compare B to Memory
          bcs     Lbl_A91A                                 ;Branch if Lower
          ldab    CruiseControlVar0                        ;Load Accumulator B
          subb    TL_UnknownConstForCruiseControl32 ;(0x20/16.00 MPH)  ;Subtract Memory from B
          bcc     Lbl_A93B                                 ;Branch if Higher or Same
          clrb                                             ;Clear Accumulator B
Lbl_A93B: stab    CruiseControlVar0                        ;Store Accumulator B
          bra     Lbl_A91A                                 ;Branch Always
Lbl_A93F: brclr   *CruiseStatus_1, #$%00000001, Lbl_A9A6   ;Branch if Bit(s) Clear
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
          brset   *CruiseStatus_1, #$%10000000, Lbl_A979   ;Branch if Bit(s) Set
          brset   *CruiseStatus_2, #$%00001000, Lbl_A958   ;Branch if Bit(s) Set
          ldab    CruiseSpeedSetpoint                      ;Load Accumulator B
          subb    Temp0                                    ;Subtract Memory from B
          bcc     Lbl_A958                                 ;Branch if Higher or Same
          cmpb    #0xFC ;(11111100)                        ;Compare B to Memory
          bcs     Lbl_A979                                 ;Branch if Lower
Lbl_A958: brset   *CruiseStatus_1, #$%00010000, Lbl_A95E   ;Branch if Bit(s) Set
          bra     Lbl_A97F                                 ;Branch Always
Lbl_A95E: ldaa    Counter_Cruise_4                         ;Load Accumulator A
          ldab    TL_UnknownConstForCruiseControl31 ;(0x40/32.00 MPH)  ;Load Accumulator B
          addb    #0x80 ;(10000000)                        ;Add Memory to B
          bmi     Lbl_A96E                                 ;Branch if Minus
          mul                                              ;Multiply A x B = D
          adca    Counter_Cruise_4                         ;Add with Carry to A
          bcs     Lbl_A975                                 ;Branch if Lower
          bra     Lbl_A971                                 ;Branch Always
Lbl_A96E: mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
Lbl_A971: cmpa    #0x7F ;(01111111)                        ;Compare A to Memory
          bls     Lbl_A97F                                 ;Branch if Lower or Same
Lbl_A975: ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
          bra     Lbl_A97F                                 ;Branch Always
Lbl_A979: bset    *CruiseStatus_2, #$%00000001             ;Set Bit(s)
          clrb                                             ;Clear Accumulator B
          stab    CruiseControlVar6                        ;Store Accumulator B
Lbl_A97F: ldab    Temp0                                    ;Load Accumulator B
          stab    CruiseSpeedSetpoint                      ;Store Accumulator B
          staa    Temp2                                    ;Store Accumulator A
          jsr     Lbl_AB0D                                 ;Jump to Subroutine
          ldab    Temp2                                    ;Load Accumulator B
          cba                                              ;Compare A to B
          bhi     Lbl_A991                                 ;Branch if Higher
          tab                                              ;Transfer A to B
Lbl_A991: bclr    *CruiseStatus_1, #$%10010001             ;Clear Bits(s)
          bclr    *CruiseStatus_2, #$%00001000             ;Clear Bits(s)
          bclr    *BitFlags24, #b3_24_BadSpeedo2 ;(00001000)  ;Clear Bits(s)
          clra                                             ;Clear Accumulator A
          staa    Counter_Cruise_4                         ;Store Accumulator A
          staa    Timer_CruiseDecelerate                   ;Store Accumulator A
          staa    CruiseControlVar0                        ;Store Accumulator A
          staa    Counter_Cruise_2                         ;Store Accumulator A
          jmp     Lbl_AA35                                 ;Jump
Lbl_A9A6: clrb                                             ;Clear Accumulator B
          stab    Timer_CruiseDecelerate                   ;Store Accumulator B
          brset   *StartupSwitchMirror1, #b3_61_bt3, Lbl_A9B0 ;(00001000)  ;Branch if Bit(s) Set
          jmp     Lbl_AAA7                                 ;Jump
Lbl_A9B0: ldab    Counter_Cruise_4                         ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          bne     Lbl_A9B6                                 ;Branch if Not = Zero
          decb                                             ;Decrement Accumulator B
Lbl_A9B6: stab    Counter_Cruise_4                         ;Store Accumulator B
          brclr   *CruiseStatus_1, #$%00000010, Lbl_A9BF   ;Branch if Bit(s) Clear
          jmp     Lbl_AA51                                 ;Jump
Lbl_A9BF: brclr   *CruiseStatus_1, #$%00100000, Lbl_A9C6   ;Branch if Bit(s) Clear
          jmp     Lbl_AAEE                                 ;Jump
Lbl_A9C6: cmpb    #0x04 ;(00000100)                        ;Compare B to Memory
          bhi     Lbl_A9CD                                 ;Branch if Higher
          jmp     Lbl_AB45                                 ;Jump
Lbl_A9CD: bset    *CruiseStatus_1, #$%00000110             ;Set Bit(s)
          bset    *CruiseStatus_2, #$%00000100             ;Set Bit(s)
          clra                                             ;Clear Accumulator A
          staa    Counter_Cruise_2                         ;Store Accumulator A
          brclr   *CruiseStatus_1, #$%10000000, CruiseBumpUpSpeedBy2Mph ;Branch if Bit(s) Clear
          bset    *CruiseStatus_1, #$%00100000             ;Set Bit(s)
          bclr    *CruiseStatus_1, #$%10000000             ;Clear Bits(s)
          bclr    *BitFlags24, #b3_24_BadSpeedo2 ;(00001000)  ;Clear Bits(s)
          jsr     Lbl_AB0D                                 ;Jump to Subroutine
          staa    Temp2                                    ;Store Accumulator A
          ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          suba    Temp0                                    ;Subtract Memory from A
          bcc     Lbl_A9F3                                 ;Branch if Higher or Same
          tab                                              ;Transfer A to B
          eorb    #0x80 ;(10000000)                        ;Exclusive OR B with Memory
Lbl_A9F3: bpl     Lbl_A9FA                                 ;Branch if Plus
          lsla                                             ;Logical Shift Left A
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          sbca    #0x00 ;(00000000)                        ;Subtract with Carry from A
Lbl_A9FA: adda    #0x80 ;(10000000)                        ;Add Memory to A
          ldx     #TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2 ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          addb    #0x80 ;(10000000)                        ;Add Memory to B
          addb    Temp2                                    ;Add Memory to B
          bpl     Lbl_AA4C                                 ;Branch if Plus
          bvc     Lbl_AA0F                                 ;Branch if Overflow Clear
          ldab    #0x7F ;(01111111)                        ;Load Accumulator B
          bra     Lbl_AA4C                                 ;Branch Always
Lbl_AA0F: clrb                                             ;Clear Accumulator B
          bra     Lbl_AA4C                                 ;Branch Always
CruiseBumpUpSpeedBy2Mph:
          bclr    *CruiseStatus_2, #$%00000011             ;Clear Bits(s)
          ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          adda    #0x04 ;(00000100)                        ;Add Memory to A
          staa    CruiseSpeedSetpoint                      ;Store Accumulator A
          ldab    CruiseControlVar2                        ;Load Accumulator B
          suba    #0x03 ;(00000011)                        ;Subtract Memory from A
          cmpa    TL_CruiseControlMaxSetSpeedTimesTwo ;(0xAA/85.00 MPH)  ;Compare A to Memory
          bhi     Lbl_AA35                                 ;Branch if Higher
          ldab    TL_UnknownConstForCruiseControl23 ;(0x05/2.50 MPH)  ;Load Accumulator B
          ldaa    CruiseControlVar2                        ;Load Accumulator A
          bmi     Lbl_AA35                                 ;Branch if Minus
          aba                                              ;Add Accumulators
          bcs     Lbl_AA32                                 ;Branch if Lower
          cmpa    #0x7F ;(01111111)                        ;Compare A to Memory
          bls     Lbl_AA34                                 ;Branch if Lower or Same
Lbl_AA32: ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_AA34: tab                                              ;Transfer A to B
Lbl_AA35: ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          cmpa    TL_CruiseControlMaxSetSpeedTimesTwo ;(0xAA/85.00 MPH)  ;Compare A to Memory
          bls     Lbl_AA44                                 ;Branch if Lower or Same
          bclr    *CruiseStatus_2, #$%00000011             ;Clear Bits(s)
          ldaa    TL_CruiseControlMaxSetSpeedTimesTwo ;(0xAA/85.00 MPH)  ;Load Accumulator A
          bra     Lbl_AA4A                                 ;Branch Always
Lbl_AA44: cmpa    TL_CruiseControlMinSetSpeedTimesTwo ;(0x46/35.00 MPH)  ;Compare A to Memory
          bcc     Lbl_AA4C                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_AA4A: staa    CruiseSpeedSetpoint                      ;Store Accumulator A
Lbl_AA4C: stab    CruiseControlVar2                        ;Store Accumulator B
Lbl_AA4E: jmp     Lbl_AB45                                 ;Jump
Lbl_AA51: brset   *CruiseStatus_1, #$%00100000, Lbl_AA4E   ;Branch if Bit(s) Set
          brset   *CruiseStatus_1, #$%00001000, Lbl_AA70   ;Branch if Bit(s) Set
          cmpb    TL_UnknownConstForCruiseControl47 ;(0x52/41.00 MPH)  ;Compare B to Memory
          bls     Lbl_AA4E                                 ;Branch if Lower or Same
          bset    *CruiseStatus_1, #$%00001000             ;Set Bit(s)
          bset    *CruiseStatus_2, #$%00001000             ;Set Bit(s)
          ldaa    Temp0                                    ;Load Accumulator A
          adda    TL_UnknownConstForCruiseControl34 ;(0x18/12.00 MPH)  ;Add Memory to A
          bcc     Lbl_AA6E                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_AA6E: staa    CruiseControlVar0                        ;Store Accumulator A
Lbl_AA70: ldaa    Temp0                                    ;Load Accumulator A
          cmpa    TL_CruiseControlMaxSetSpeedTimesTwo ;(0xAA/85.00 MPH)  ;Compare A to Memory
          bcs     Lbl_AA7F                                 ;Branch if Lower
          bset    *CruiseStatus_1, #$%00100000             ;Set Bit(s)
          ldab    CruiseControlVar2                        ;Load Accumulator B
          bra     Lbl_AAD7                                 ;Branch Always
Lbl_AA7F: ldab    CruiseStatus_2                           ;Load Accumulator B
          cmpb    #0xA0 ;(10100000)                        ;Compare B to Memory
          bcs     Lbl_AA4E                                 ;Branch if Lower
          ldab    CruiseControlVar0                        ;Load Accumulator B
          subb    TL_UnknownConstForCruiseControl33 ;(0x04/2.00 MPH)  ;Subtract Memory from B
          bcc     Lbl_AA8D                                 ;Branch if Higher or Same
          clrb                                             ;Clear Accumulator B
Lbl_AA8D: cmpb    TL_CruiseControlMaxSetSpeedTimesTwo ;(0xAA/85.00 MPH)  ;Compare B to Memory
          bcc     Lbl_AAA3                                 ;Branch if Higher or Same
          adda    TL_UnknownConstForCruiseControl35 ;(0x06/3.00 MPH)  ;Add Memory to A
          bcs     Lbl_AAA0                                 ;Branch if Lower
          cba                                              ;Compare A to B
          bls     Lbl_AAA3                                 ;Branch if Lower or Same
          tab                                              ;Transfer A to B
          cmpb    TL_CruiseControlMaxSetSpeedTimesTwo ;(0xAA/85.00 MPH)  ;Compare B to Memory
          bls     Lbl_AAA3                                 ;Branch if Lower or Same
Lbl_AAA0: ldab    TL_CruiseControlMaxSetSpeedTimesTwo ;(0xAA/85.00 MPH)  ;Load Accumulator B
Lbl_AAA3: stab    CruiseControlVar0                        ;Store Accumulator B
          bra     Lbl_AA4E                                 ;Branch Always
Lbl_AAA7: bclr    *CruiseStatus_1, #$%00000010             ;Clear Bits(s)
          ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          beq     Lbl_AAB1                                 ;Branch if = Zero
          bclr    *CruiseStatus_1, #$%00100000             ;Clear Bits(s)
Lbl_AAB1: brclr   *CruiseStatus_1, #$%00001000, Lbl_AAEE   ;Branch if Bit(s) Clear
          ldaa    Counter_Cruise_4                         ;Load Accumulator A
          cmpa    #0x5D ;(01011101)                        ;Compare A to Memory
          bhi     Lbl_AAC5                                 ;Branch if Higher
          bclr    *CruiseStatus_1, #$%00001000             ;Clear Bits(s)
          bclr    *CruiseStatus_2, #$%00001000             ;Clear Bits(s)
          stab    CruiseControlVar0                        ;Store Accumulator B
          bra     Lbl_AAEE                                 ;Branch Always
Lbl_AAC5: ldaa    Temp0                                    ;Load Accumulator A
          adda    #0x04 ;(00000100)                        ;Add Memory to A
          suba    CruiseSpeedSetpoint                      ;Subtract Memory from A
          bcc     Lbl_AACF                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_AACF: ldx     #TL_UnknownTableForCruiseControl6        ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          orab    #0x80 ;(10000000)                        ;OR Accumulator B (Inclusive)
Lbl_AAD7: ldaa    Temp0                                    ;Load Accumulator A
          staa    CruiseSpeedSetpoint                      ;Store Accumulator A
          bclr    *CruiseStatus_1, #$%00001100             ;Clear Bits(s)
          bclr    *CruiseStatus_2, #$%00001000             ;Clear Bits(s)
          clra                                             ;Clear Accumulator A
          staa    CruiseControlVar0                        ;Store Accumulator A
          staa    Counter_Cruise_4                         ;Store Accumulator A
          tstb                                             ;Test for Zero or Minus
          bmi     Lbl_AAEB                                 ;Branch if Minus
          clrb                                             ;Clear Accumulator B
Lbl_AAEB: jmp     Lbl_AA35                                 ;Jump
Lbl_AAEE: clrb                                             ;Clear Accumulator B
          stab    Counter_Cruise_4                         ;Store Accumulator B
          ldaa    CruiseStatus_2                           ;Load Accumulator A
          eora    #0x04 ;(00000100)                        ;Exclusive OR A with Memory
          bita    #0x07 ;(00000111)                        ;Bit(s) Test A with Memory
          bne     Lbl_AB45                                 ;Branch if Not = Zero
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bne     Lbl_AB45                                 ;Branch if Not = Zero
          ldab    Counter_Cruise_2                         ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          cmpb    TL_UnknownConstForCruiseControl26 ;(0x02/1.00 MPH)  ;Compare B to Memory
          bcs     Lbl_AB09                                 ;Branch if Lower
          bclr    *CruiseStatus_2, #$%00000100             ;Clear Bits(s)
          clrb                                             ;Clear Accumulator B
Lbl_AB09: stab    Counter_Cruise_2                         ;Store Accumulator B
          bra     Lbl_AB45                                 ;Branch Always
Lbl_AB0D: ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          ldx     #TL_CruiseControlSetupPulseForSet_FromSpeed ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          bpl     Lbl_AB19                                 ;Branch if Plus
          ldab    #0x7F ;(01111111)                        ;Load Accumulator B
Lbl_AB19: stab    Temp1                                    ;Store Accumulator B
          ldaa    MapVolts                                 ;Load Accumulator A
          ldx     #TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldab    Temp1                                    ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          bpl     Lbl_AB2F                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_AB2F: ldx     #L002F_t3                                ;Load Index Register X
          ldab    CruiseSpeedSetpoint                      ;Load Accumulator B
          cmpb    TL_UnknownConstForCruiseControl36 ;(0x74/58.00 MPH)  ;Compare B to Memory
          bls     Lbl_AB3A                                 ;Branch if Lower or Same
          dex                                              ;Decrement Index Register X
Lbl_AB3A: adda    0x00, X                                  ;Add Memory to A
          bpl     Lbl_AB41                                 ;Branch if Plus
          bvs     Lbl_AB42                                 ;Branch if Overflow Set
          clra                                             ;Clear Accumulator A
Lbl_AB41: rts                                              ;Return from Subroutine
Lbl_AB42: ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
          rts                                              ;Return from Subroutine
Lbl_AB45: brset   *CruiseStatus_1, #$%10000000, Lbl_AB5A   ;Branch if Bit(s) Set
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          brclr   *CruiseStatus_1, #$%00011000, Lbl_AB5A   ;Branch if Bit(s) Clear
          inc     Counter_Cruise_1                         ;Increment Memory Byte
          brset   *CruiseStatus_1, #$%00001000, Lbl_AB5A   ;Branch if Bit(s) Set
          inc     Counter_Cruise_1                         ;Increment Memory Byte
Lbl_AB5A: ldaa    CruiseStatus_2                           ;Load Accumulator A
          adda    #0x10 ;(00010000)                        ;Add Memory to A
          cmpa    #0xB0 ;(10110000)                        ;Compare A to Memory
          bcs     Lbl_AB64                                 ;Branch if Lower
          anda    #0x0F ;(00001111)                        ;AND A with Memory
Lbl_AB64: staa    CruiseStatus_2                           ;Store Accumulator A
          anda    #0xF0 ;(11110000)                        ;AND A with Memory
          beq     Lbl_AB6D                                 ;Branch if = Zero
          jmp     Lbl_AE06                                 ;Jump
Lbl_AB6D: clrb                                             ;Clear Accumulator B
          brclr   *BitFlags24, #b4_24_BadSpeedo1, CalculateVehicleSpeed ;(00010000)  ;Branch if Bit(s) Clear
          jmp     Lbl_AC51                                 ;Jump
CalculateVehicleSpeed:
          ldy     #SpeedoSensorPulsewidth_HB               ;Load Index Register Y
          ldx     #0xD000                                  ;Load Index Register X
          ldd     #0x06DD                                  ;Load Double Accumulator D
          brclr   *TimerOverflowsBetweenSpeedoPulses, #$%11111111, Lbl_AB90 ;Branch if Bit(s) Clear
          clrb                                             ;Clear Accumulator B
          clra                                             ;Clear Accumulator A
          brset   *TimerOverflowsBetweenSpeedoPulses, #$%01000000, Lbl_AB95 ;Branch if Bit(s) Set
          ldab    #0x06 ;(00000110)                        ;Load Accumulator B
          dey                                              ;Decrement Index Register Y
          ldx     #0xDDD0                                  ;Load Index Register X
Lbl_AB90: sei                                              ;Set Mask Disable Int
          jsr     CalculateVehicleSpeedOrEngineRpms        ;Jump to Subroutine
          cli                                              ;Clear Mask Enable Int
Lbl_AB95: ldx     VehicleSpeed_HB                          ;Load Index Register X
          stx     Temp0                                    ;Store Index Register X
          std     VehicleSpeed_HB                          ;Store Accumulator D
          brclr   *CruiseStatus_2, #$%00000010, Lbl_AC0B   ;Branch if Bit(s) Clear
          ldaa    Counter_Cruise_2                         ;Load Accumulator A
          brclr   *CruiseStatus_2, #$%00000001, Lbl_ABB6   ;Branch if Bit(s) Clear
          cmpa    TL_CruiseMask ;(0x08/8.00 out)           ;Compare A to Memory
          bcc     Lbl_ABB0                                 ;Branch if Higher or Same
          inca                                             ;Increment Accumulator A
          staa    Counter_Cruise_2                         ;Store Accumulator A
          bra     Lbl_AC0B                                 ;Branch Always
Lbl_ABB0: bclr    *CruiseStatus_2, #$%00000001             ;Clear Bits(s)
          clra                                             ;Clear Accumulator A
          staa    Counter_Cruise_2                         ;Store Accumulator A
Lbl_ABB6: cmpa    TL_CruiseCompareConstant1 ;(0x0B/5.50 MPH)  ;Compare A to Memory
          bcs     Lbl_AC0D                                 ;Branch if Lower
          ldab    CruiseControlVar6                        ;Load Accumulator B
          tba                                              ;Transfer B to A
          bpl     Lbl_ABC1                                 ;Branch if Plus
          negb                                             ;2's Complement B
Lbl_ABC1: cmpb    TL_CruiseCompareConstant2 ;(0x04/2.00 MPH)  ;Compare B to Memory
          bcs     Lbl_AC05                                 ;Branch if Lower
          ldx     #L002F_t3                                ;Load Index Register X
          ldab    CruiseSpeedSetpoint                      ;Load Accumulator B
          cmpb    TL_UnknownConstForCruiseControl36 ;(0x74/58.00 MPH)  ;Compare B to Memory
          bls     Lbl_ABD1                                 ;Branch if Lower or Same
          dex                                              ;Decrement Index Register X
Lbl_ABD1: ldab    0x00, X                                  ;Load Accumulator B
          adda    0x02, X                                  ;Add Memory to A
          bvc     Lbl_ABDC                                 ;Branch if Overflow Clear
          lsla                                             ;Logical Shift Left A
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          sbca    #0x00 ;(00000000)                        ;Subtract with Carry from A
Lbl_ABDC: staa    0x02, X                                  ;Store Accumulator A
          cmpa    TL_CruiseMask2 ;(0x10/16.00 out)         ;Compare A to Memory
          bgt     Lbl_ABF5                                 ;Branch if > Zero
          cmpa    TL_CruiseMask3 ;(0xF0/240.00 out)        ;Compare A to Memory
          bge     Lbl_AC05                                 ;Branch if >= Zero
          subb    TL_CruiseMask4 ;(0x04/4.00 out)          ;Subtract Memory from B
          cmpb    TL_CruiseMask5 ;(0xD8/216.00 out)        ;Compare B to Memory
          bge     Lbl_AC00                                 ;Branch if >= Zero
          ldab    TL_CruiseMask5 ;(0xD8/216.00 out)        ;Load Accumulator B
          bra     Lbl_AC00                                 ;Branch Always
Lbl_ABF5: addb    TL_CruiseMask7 ;(0x04/4.00 out)          ;Add Memory to B
          cmpb    TL_CruiseMask6 ;(0x28/40.00 out)         ;Compare B to Memory
          ble     Lbl_AC00                                 ;Branch if <= Zero
          ldab    TL_CruiseMask6 ;(0x28/40.00 out)         ;Load Accumulator B
Lbl_AC00: stab    0x00, X                                  ;Store Accumulator B
          clra                                             ;Clear Accumulator A
          staa    0x02, X                                  ;Store Accumulator A
Lbl_AC05: bclr    *CruiseStatus_2, #$%00000010             ;Clear Bits(s)
          clra                                             ;Clear Accumulator A
          staa    Counter_Cruise_2                         ;Store Accumulator A
Lbl_AC0B: bra     Lbl_AC37                                 ;Branch Always
Lbl_AC0D: inca                                             ;Increment Accumulator A
          staa    Counter_Cruise_2                         ;Store Accumulator A
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          lsla                                             ;Logical Shift Left A
          lsla                                             ;Logical Shift Left A
          sba                                              ;Subtract B from A
          adda    TL_CruiseControlSetDeltaControlPointForCableAdaptive ;(0x00/.00 MPH)  ;Add Memory to A
          bmi     Lbl_AC2C                                 ;Branch if Minus
          ldab    CruiseControlVar6                        ;Load Accumulator B
          bpl     Lbl_AC25                                 ;Branch if Plus
          comb                                             ;1's Complement B
          incb                                             ;Increment Accumulator B
Lbl_AC25: cba                                              ;Compare A to B
          ble     Lbl_AC37                                 ;Branch if <= Zero
          staa    CruiseControlVar6                        ;Store Accumulator A
          bra     Lbl_AC37                                 ;Branch Always
Lbl_AC2C: ldab    CruiseControlVar6                        ;Load Accumulator B
          bmi     Lbl_AC32                                 ;Branch if Minus
          comb                                             ;1's Complement B
          incb                                             ;Increment Accumulator B
Lbl_AC32: cba                                              ;Compare A to B
          bge     Lbl_AC37                                 ;Branch if >= Zero
          staa    CruiseControlVar6                        ;Store Accumulator A
Lbl_AC37: ldd     Temp0                                    ;Load Double Accumulator D
          subd    VehicleSpeed_HB                          ;Subtract Memory from D
          bne     Lbl_AC41                                 ;Branch if Not = Zero
          clr     CruiseControlVar3                        ;Clear Memory Byte
Lbl_AC41: std     Temp0                                    ;Store Accumulator D
          clra                                             ;Clear Accumulator A
          ldab    CruiseControlVar3                        ;Load Accumulator B
          bpl     Lbl_AC4A                                 ;Branch if Plus
          deca                                             ;Decrement Accumulator A
Lbl_AC4A: addd    Temp0                                    ;Add 16-Bit to D
          asra                                             ;Arithmetic Shift Right A
          rorb                                             ;Rotate Right
          bsr     Lbl_AC55                                 ;Branch to Subroutine
Lbl_AC51: stab    CruiseControlVar3                        ;Store Accumulator B
          bra     Lbl_AC66                                 ;Branch Always
Lbl_AC55: asld                                             ;Arithmetic Shift Left D
          bcs     Lbl_AC5E                                 ;Branch if Lower
          tsta                                             ;Test for Zero or Minus
          beq     Lbl_AC64                                 ;Branch if = Zero
          ldab    #0x7F ;(01111111)                        ;Load Accumulator B
          rts                                              ;Return from Subroutine
Lbl_AC5E: cmpa    #0xFF ;(11111111)                        ;Compare A to Memory
          beq     Lbl_AC63                                 ;Branch if = Zero
          clrb                                             ;Clear Accumulator B
Lbl_AC63: sec                                              ;Set Carry
Lbl_AC64: rorb                                             ;Rotate Right
          rts                                              ;Return from Subroutine
Lbl_AC66: brset   *CruiseStatus_1, #$%10000000, Lbl_ACC0   ;Branch if Bit(s) Set
          ldx     #TL_CruiseControlVacRegularGainCurve_FromDeltaSpeed ;Load Index Register X
          clrb                                             ;Clear Accumulator B
          ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          brclr   *CruiseStatus_1, #$%00011000, Lbl_AC76   ;Branch if Bit(s) Clear
          ldaa    CruiseControlVar0                        ;Load Accumulator A
Lbl_AC76: lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          subd    VehicleSpeed_HB                          ;Subtract Memory from D
          bcc     Lbl_ACC3                                 ;Branch if Higher or Same
          bclr    *CruiseStatus_1, #$%00000100             ;Clear Bits(s)
          ldx     #TL_CruiseControlVentRegularGainCurve_FromDeltaSpeed ;Load Index Register X
          coma                                             ;1's Complement A
          comb                                             ;1's Complement B
          addd    #0x0001                                  ;Add 16-Bit to D
          stab    Temp0                                    ;Store Accumulator B
          tsta                                             ;Test for Zero or Minus
          beq     Lbl_AC95                                 ;Branch if = Zero
          psha                                             ;Push A onto Stack
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          pula                                             ;Pull A from Stack
Lbl_AC95: lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          brclr   *CruiseStatus_1, #$%00010000, Lbl_ACA5   ;Branch if Bit(s) Clear
          ldx     #TL_UnknownTableForCruiseControl1        ;Load Index Register X
          tsta                                             ;Test for Zero or Minus
          beq     Lbl_ACD9                                 ;Branch if = Zero
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
          bra     Lbl_ACDA                                 ;Branch Always
Lbl_ACA5: tsta                                             ;Test for Zero or Minus
          bne     Lbl_ACBA                                 ;Branch if Not = Zero
          cmpb    TL_CruiseControlLimitToAMaxVent ;(0xFE/254.00 out)  ;Compare B to Memory
          bcc     Lbl_ACBA                                 ;Branch if Higher or Same
          tba                                              ;Transfer B to A
          ldab    Temp0                                    ;Load Accumulator B
          cmpa    TL_CruiseControlLimitToHalfMaxVent ;(0xF0/240.00 out)  ;Compare A to Memory
          bcs     Lbl_ACD9                                 ;Branch if Lower
          ldaa    #0x05 ;(00000101)                        ;Load Accumulator A
          bra     Lbl_ACBC                                 ;Branch Always
Lbl_ACBA: ldaa    #0x0F ;(00001111)                        ;Load Accumulator A
Lbl_ACBC: oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          staa    CruiseControlVar2                        ;Store Accumulator A
Lbl_ACC0: jmp     Lbl_AE06                                 ;Jump
Lbl_ACC3: brclr   *CruiseStatus_1, #$%00001100, Lbl_ACCC   ;Branch if Bit(s) Clear
          ldx     #TL_CruiseControlVacAcceleratedGainCurve_FromDeltaSpeed ;Load Index Register X
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
Lbl_ACCC: tsta                                             ;Test for Zero or Minus
          beq     Lbl_ACD1                                 ;Branch if = Zero
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_ACD1: cmpb    TL_CruiseControlDeltaSpeedToResetAccFlag ;(0x3A/28.89 mph)  ;Compare B to Memory
          bcc     Lbl_ACD9                                 ;Branch if Higher or Same
          bclr    *CruiseStatus_1, #$%00000100             ;Clear Bits(s)
Lbl_ACD9: tba                                              ;Transfer B to A
Lbl_ACDA: jsr     Lookup4ByteTable                         ;Jump to Subroutine
          clra                                             ;Clear Accumulator A
          tstb                                             ;Test for Zero or Minus
          bpl     Lbl_ACE2                                 ;Branch if Plus
          deca                                             ;Decrement Accumulator A
Lbl_ACE2: std     Temp0                                    ;Store Accumulator D
          ldx     #TL_CruiseControlThrottleGainFactor_FromThrottle ;Load Index Register X
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    Temp3                                    ;Store Accumulator A
          ldx     #TL_CruiseControlSpeedGainFactor_FromSpeed ;Load Index Register X
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          adda    Temp3                                    ;Add Memory to A
          bcc     Lbl_AD02                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_AD02: staa    Temp3                                    ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          staa    Temp2                                    ;Store Accumulator A
          ldab    CruiseControlVar3                        ;Load Accumulator B
          bpl     Lbl_AD0E                                 ;Branch if Plus
          deca                                             ;Decrement Accumulator A
Lbl_AD0E: asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          addd    Temp0                                    ;Add 16-Bit to D
          std     Temp0                                    ;Store Accumulator D
          brset   *CruiseStatus_2, #$%00000100, Lbl_AD42   ;Branch if Bit(s) Set
          bpl     Lbl_AD21                                 ;Branch if Plus
          coma                                             ;1's Complement A
          comb                                             ;1's Complement B
          addd    #0x0001                                  ;Add 16-Bit to D
Lbl_AD21: tsta                                             ;Test for Zero or Minus
          beq     Lbl_AD26                                 ;Branch if = Zero
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_AD26: cmpb    TL_UnknownConstForCruiseControl24 ;(0x00/.00 MPH)  ;Compare B to Memory
          bhi     Lbl_AD42                                 ;Branch if Higher
          clrb                                             ;Clear Accumulator B
          ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          subd    VehicleSpeed_HB                          ;Subtract Memory from D
          bpl     Lbl_AD3A                                 ;Branch if Plus
          coma                                             ;1's Complement A
          comb                                             ;1's Complement B
          addd    #0x0001                                  ;Add 16-Bit to D
Lbl_AD3A: tsta                                             ;Test for Zero or Minus
          bne     Lbl_AD42                                 ;Branch if Not = Zero
          cmpb    TL_UnknownConstForCruiseControl25 ;(0x00/.00 MPH)  ;Compare B to Memory
          bls     Lbl_AD63                                 ;Branch if Lower or Same
Lbl_AD42: clra                                             ;Clear Accumulator A
          ldab    CruiseControlVar1                        ;Load Accumulator B
          bpl     Lbl_AD48                                 ;Branch if Plus
          deca                                             ;Decrement Accumulator A
Lbl_AD48: addd    Temp0                                    ;Add 16-Bit to D
          staa    Temp4                                    ;Store Accumulator A
          bpl     Lbl_AD55                                 ;Branch if Plus
          coma                                             ;1's Complement A
          comb                                             ;1's Complement B
          addd    #0x0001                                  ;Add 16-Bit to D
Lbl_AD55: cmpd    Temp2                                    ;Compare D to Memory 16-Bit
          bcc     Lbl_AD66                                 ;Branch if Higher or Same
          ldaa    Temp4                                    ;Load Accumulator A
          bpl     Lbl_AD61                                 ;Branch if Plus
          negb                                             ;2's Complement B
Lbl_AD61: stab    CruiseControlVar1                        ;Store Accumulator B
Lbl_AD63: jmp     Lbl_AE06                                 ;Jump
Lbl_AD66: clra                                             ;Clear Accumulator A
          staa    CruiseControlVar1                        ;Store Accumulator A
          ldaa    Temp4                                    ;Load Accumulator A
          anda    #0x80 ;(10000000)                        ;AND A with Memory
          ldab    CruiseControlVar2                        ;Load Accumulator B
          beq     Lbl_AD79                                 ;Branch if = Zero
          bpl     Lbl_AD63                                 ;Branch if Plus
          tab                                              ;Transfer A to B
          eorb    CruiseControlVar2                        ;Exclusive OR B with Memory
          bpl     Lbl_AD63                                 ;Branch if Plus
Lbl_AD79: ldab    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator B
          tsta                                             ;Test for Zero or Minus
          bpl     Lbl_ADA8                                 ;Branch if Plus
          oraa    TL_UnknownConstForCruiseControl28 ;(0x01/00000001)  ;OR Accumulator A (Inclusive)
          brclr   *CruiseStatus_1, #$%00010000, Lbl_AD8A   ;Branch if Bit(s) Clear
          adda    TL_UnknownConstForCruiseControl30 ;(0x03/1.50 MPH)  ;Add Memory to A
          bra     Lbl_ADD2                                 ;Branch Always
Lbl_AD8A: staa    Temp4                                    ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          cmpb    TL_CruiseControlDontVentIfThrottleBelowThis ;(0x04/.08 volts)  ;Compare B to Memory
          bcs     Lbl_ADD2                                 ;Branch if Lower
          ldx     #TL_UnknownTableForCruiseControl4        ;Load Index Register X
          stx     Temp2                                    ;Store Index Register X
          ldx     #TL_UnknownTableForCruiseControl5        ;Load Index Register X
          bsr     Lbl_ADD6                                 ;Branch to Subroutine
          oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          ldab    Temp4                                    ;Load Accumulator B
          cba                                              ;Compare A to B
          bcc     Lbl_ADD2                                 ;Branch if Higher or Same
          bra     Lbl_ADD1                                 ;Branch Always
Lbl_ADA8: cmpb    TL_CruiseControlDontVacIfThrottleAboveThis ;(0xA0/3.14 volts)  ;Compare B to Memory
          bcc     Lbl_ADD2                                 ;Branch if Higher or Same
          oraa    TL_UnknownConstForCruiseControl27 ;(0x01/00000001)  ;OR Accumulator A (Inclusive)
          brclr   *CruiseStatus_1, #$%00001000, Lbl_ADB9   ;Branch if Bit(s) Clear
          adda    TL_UnknownConstForCruiseControl29 ;(0x03/1.50 MPH)  ;Add Memory to A
          bra     Lbl_ADD2                                 ;Branch Always
Lbl_ADB9: brset   *CruiseStatus_1, #$%00000100, Lbl_ADD2   ;Branch if Bit(s) Set
          staa    Temp4                                    ;Store Accumulator A
          ldx     #TL_UnknownTableForCruiseControl2        ;Load Index Register X
          stx     Temp2                                    ;Store Index Register X
          ldx     #TL_UnknownTableForCruiseControl3        ;Load Index Register X
          bsr     Lbl_ADD6                                 ;Branch to Subroutine
          ldab    Temp4                                    ;Load Accumulator B
          cba                                              ;Compare A to B
          bcc     Lbl_ADD2                                 ;Branch if Higher or Same
Lbl_ADD1: tba                                              ;Transfer B to A
Lbl_ADD2: staa    CruiseControlVar2                        ;Store Accumulator A
          bra     Lbl_AE06                                 ;Branch Always
Lbl_ADD6: clrb                                             ;Clear Accumulator B
          ldaa    CruiseSpeedSetpoint                      ;Load Accumulator A
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          subd    VehicleSpeed_HB                          ;Subtract Memory from D
          asra                                             ;Arithmetic Shift Right A
          rorb                                             ;Rotate Right
          asra                                             ;Arithmetic Shift Right A
          rorb                                             ;Rotate Right
          asra                                             ;Arithmetic Shift Right A
          rorb                                             ;Rotate Right
          jsr     Lbl_AC55                                 ;Jump to Subroutine
          tba                                              ;Transfer B to A
          adda    #0x80 ;(10000000)                        ;Add Memory to A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldx     Temp2                                    ;Load Index Register X
          staa    Temp2                                    ;Store Accumulator A
          ldd     Temp0                                    ;Load Double Accumulator D
          jsr     Lbl_AC55                                 ;Jump to Subroutine
          tba                                              ;Transfer B to A
          adda    #0x80 ;(10000000)                        ;Add Memory to A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldab    Temp2                                    ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          rts                                              ;Return from Subroutine
Lbl_AE06: ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          anda    #0x3F ;(00111111)                        ;AND A with Memory
          brset   *CruiseStatus_1, #$%10000000, Lbl_AE1F   ;Branch if Bit(s) Set
          ldab    CruiseControlVar2                        ;Load Accumulator B
          beq     Lbl_AE21                                 ;Branch if = Zero
          bpl     Lbl_AE23                                 ;Branch if Plus
          brclr   *CruiseStatus_1, #$%00010000, Lbl_AE1F   ;Branch if Bit(s) Clear
          ldab    Counter_Cruise_4                         ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          beq     Lbl_AE1F                                 ;Branch if = Zero
          stab    Counter_Cruise_4                         ;Store Accumulator B
Lbl_AE1F: oraa    #0xC0 ;(11000000)                        ;OR Accumulator A (Inclusive)
Lbl_AE21: oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
Lbl_AE23: bclr    *BitFlags6a_t3, #b0_26_bt0 ;(00000001)   ;Clear Bits(s)
          tab                                              ;Transfer A to B
          eorb    PIA2_Buffer_t3                           ;Exclusive OR B with Memory
          andb    #0xC0 ;(11000000)                        ;AND B with Memory
          beq     Lbl_AE30                                 ;Branch if = Zero
          bset    *BitFlags6a_t3, #b0_26_bt0 ;(00000001)   ;Set Bit(s)
Lbl_AE30: staa    PIA2_Buffer_t3                           ;Store Accumulator A
          ldab    CruiseControlVar2                        ;Load Accumulator B
          beq     Lbl_AE42                                 ;Branch if = Zero
          asld                                             ;Arithmetic Shift Left D
          tstb                                             ;Test for Zero or Minus
          beq     Lbl_AE3F                                 ;Branch if = Zero
          subb    #0x02 ;(00000010)                        ;Subtract Memory from B
          beq     Lbl_AE3F                                 ;Branch if = Zero
          lsrd                                             ;Logical Shift Right D
Lbl_AE3F: stab    CruiseControlVar2                        ;Store Accumulator B
          rts                                              ;Return from Subroutine
Lbl_AE42: brclr   *CruiseStatus_2, #$%00000001, Lbl_AE49   ;Branch if Bit(s) Clear
          bset    *CruiseStatus_2, #$%00000010             ;Set Bit(s)
Lbl_AE49: rts                                              ;Return from Subroutine
ae4a_mm:  dec     Ram64c3                                  ;Decrement Memory Byte
          beq     Lbl_AE51                                 ;Branch if = Zero
          bra     Lbl_AE99                                 ;Branch Always
Lbl_AE51: ldaa    TL_TL_89FE ;(0x04/4.00 Y units)          ;Load Accumulator A
          staa    Ram64c3                                  ;Store Accumulator A
          ldx     #TL_TL_89FF ;(0x1C0C/27.94 Y units)      ;Load Index Register X
          ldy     #Ram64c4                                 ;Load Index Register Y
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          subd    UNe_64C1                                 ;Subtract Memory from D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          addd    #0x8000                                  ;Add 16-Bit to D
          jsr     Lbl_AECB                                 ;Jump to Subroutine
          subd    #0x8000                                  ;Subtract Memory from D
          ldx     #LowestSessionTpsVolts                   ;Load Index Register X
Lbl_AE72: asra                                             ;Arithmetic Shift Right A
          rorb                                             ;Rotate Right
          dex                                              ;Decrement Index Register X
          bne     Lbl_AE72                                 ;Branch if Not = Zero
          bclr    *BitFlags2f, #$%00000010                 ;Clear Bits(s)
          cmpd    TL_TL_8A01 ;(0x000C/.05 Y units)         ;Compare D to Memory 16-Bit
          blt     Lbl_AE94                                 ;Branch if < Zero
          bset    *BitFlags2f, #$%00000010                 ;Set Bit(s)
          ldab    TL_TL_8A05 ;(0x04/4.00 Y units)          ;Load Accumulator B
          stab    STe_64C6                                 ;Store Accumulator B
          ldab    TpsVolts                                 ;Load Accumulator B
          stab    STe_64C7                                 ;Store Accumulator B
          ldab    TL_TL_8A07 ;(0x80/128.00 Y units)        ;Load Accumulator B
          stab    STe_64C8                                 ;Store Accumulator B
Lbl_AE94: ldd     EngineRpm_HB                             ;Load Double Accumulator D
          std     UNe_64C1                                 ;Store Accumulator D
Lbl_AE99: brclr   *BitFlags2f, #$%00000100, Lbl_AECA       ;Branch if Bit(s) Clear
          dec     STe_64C8                                 ;Decrement Memory Byte
          beq     Lbl_AEC7                                 ;Branch if = Zero
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          cmpd    TL_TL_8A03 ;(0x2000/1024.02 rpm)         ;Compare D to Memory 16-Bit
          bmi     Lbl_AEC7                                 ;Branch if Minus
          dec     STe_64C6                                 ;Decrement Memory Byte
          bne     Lbl_AECA                                 ;Branch if Not = Zero
          ldab    TL_TL_8A05 ;(0x04/4.00 Y units)          ;Load Accumulator B
          stab    STe_64C6                                 ;Store Accumulator B
          ldaa    TpsVolts                                 ;Load Accumulator A
          ldab    STe_64C7                                 ;Load Accumulator B
          staa    STe_64C7                                 ;Store Accumulator A
          sba                                              ;Subtract B from A
          bmi     Lbl_AECA                                 ;Branch if Minus
          cmpa    TL_TL_8A06 ;(0x03/.06 volts)             ;Compare A to Memory
          bpl     Lbl_AEC7                                 ;Branch if Plus
          bra     Lbl_AECA                                 ;Branch Always
Lbl_AEC7: bclr    *BitFlags2f, #$%00000100                 ;Clear Bits(s)
Lbl_AECA: rts                                              ;Return from Subroutine
Lbl_AECB: subd    0x00, Y                                  ;Subtract Memory from D
          pshy                                             ;Push Y onto Stack (Lo First)
          bcs     Lbl_AEDD                                 ;Branch if Lower
          xgdy                                             ;Exchange D with Y
          ldaa    0x01, X                                  ;Load Accumulator A
          jsr     ScaleYbyA                                ;Jump to Subroutine
          xgdy                                             ;Exchange D with Y
          bra     Lbl_AEEE                                 ;Branch Always
Lbl_AEDD: nega                                             ;2's Complement A
          negb                                             ;2's Complement B
          sbca    #0x00 ;(00000000)                        ;Subtract with Carry from A
          xgdy                                             ;Exchange D with Y
          ldaa    0x00, X                                  ;Load Accumulator A
          jsr     ScaleYbyA                                ;Jump to Subroutine
          xgdy                                             ;Exchange D with Y
          nega                                             ;2's Complement A
          negb                                             ;2's Complement B
          sbca    #0x00 ;(00000000)                        ;Subtract with Carry from A
Lbl_AEEE: puly                                             ;Pull Y from Stack (Hi First)
          addd    0x00, Y                                  ;Add 16-Bit to D
          std     0x00, Y                                  ;Store Accumulator D
          rts                                              ;Return from Subroutine
Mis_AEF7: .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1-16
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;17-32
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;33-48
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;49-64
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;65-80
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;81-96
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;97-112
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;113-128
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;129-144
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;145-160
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;161-176
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;177-192
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;193-208
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;209-224
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;225-240
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;241-256
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;257-272
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;273-288
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;289-304
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;305-320
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;321-336
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;337-352
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;353-368
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;369-384
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;385-400
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;401-416
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;417-432
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;433-448
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;449-464
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;465-480
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;481-496
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;497-512
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;513-528
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;529-544
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;545-560
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;561-576
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;577-592
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;593-608
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;609-624
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;625-640
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;641-656
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;657-672
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;673-688
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;689-704
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;705-720
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;721-736
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;737-752
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;753-768
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;769-784
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;785-800
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;801-816
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;817-832
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;833-848
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;849-864
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;865-880
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;881-896
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;897-912
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;913-928
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;929-944
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;945-960
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;961-976
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;977-992
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;993-1008
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1009-1024
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1025-1040
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1041-1056
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1057-1072
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1073-1088
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1089-1104
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1105-1120
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1121-1136
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1137-1152
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1153-1168
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1169-1184
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1185-1200
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1201-1216
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1217-1232
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1233-1248
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1249-1264
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1265-1280
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1281-1296
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1297-1312
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1313-1328
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1329-1344
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1345-1360
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1361-1376
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1377-1392
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1393-1408
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1409-1424
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1425-1440
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1441-1456
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1457-1472
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1473-1488
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1489-1504
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1505-1520
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1521-1536
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1537-1552
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1553-1568
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1569-1584
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1585-1600
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1601-1616
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1617-1632
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1633-1648
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1649-1664
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1665-1680
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1681-1696
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1697-1712
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1713-1728
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1729-1744
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1745-1760
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1761-1776
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1777-1792
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1793-1799
Imm_B5FE: .byte 0x3F, 0x3F ;1-2
.org 0xB600
TL_TL_b600:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB600
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b600
    ;mptblcname B600
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b600
          .byte 0xFF                       ;Point 1
Mis_B601: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-13
Imm_B60E: .byte 0xFF, 0xFF ;1-2
.org 0xB610
TL_TL_b610:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB610
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b610
    ;mptblcname B610
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b610
          .byte 0xFF                       ;Point 1
Mis_B611: .byte 0xFF ;1-1
.org 0xB612
TL_TL_b612:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB612
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b612
    ;mptblcname B612
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b612
          .byte 0xFF                       ;Point 1
Imm_B613: .byte 0xFF ;1-1
.org 0xB614
TL_TL_b614:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB614
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b614
    ;mptblcname B614
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b614
          .byte 0xFF                       ;Point 1
.org 0xB615
TL_TL_b615:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB615
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b615
    ;mptblcname B615
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b615
          .byte 0xFF                       ;Point 1
Imm_B616: .byte 0xFF, 0xFF ;1-2
Imm_B618: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-7
Imm_B61F: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-16
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;17-32
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;33-48
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;49-64
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;65-80
          .byte 0xFF, 0xFF, 0xFF ;81-83
Imm_B672: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-16
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;17-32
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;33-48
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;49-64
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;65-80
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;81-96
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;97-110
Imm_B6E0: .byte 0xFF ;1-1
Imm_B6E1: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-16
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;17-32
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;33-48
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;49-64
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;65-80
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;81-96
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;97-112
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;113-128
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;129-144
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;145-160
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;161-176
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;177-192
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;193-208
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;209-224
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;225-240
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;241-255
.org 0xB7E0
TL_TL_b7e0:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB7E0
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b7e0
    ;mptblcname B7E0
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b7e0
          .byte 0xFF                       ;Point 1
.org 0xB7E1
TL_TL_b7e1:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB7E1
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b7e1
    ;mptblcname B7E1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b7e1
          .byte 0xFF                       ;Point 1
;   table is used to set bodycomputerbatteryvoltsoutput
Mis_B7E2: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-13
.org 0xB7EF
TL_TL_b7ef:
    ;mpgrp Unassigned\
    ;mptbladdr 0xB7EF
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_b7ef
    ;mptblcname B7EF
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_b7ef
          .byte 0xFF                       ;Point 1
Mis_B7F0: .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-16
CheckAndFilterCoolantTempSensor_MM:
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x07 ;(00000111)                        ;Bit(s) Test B with Memory
          beq     Lbl_B809                                 ;Branch if = Zero
          jmp     Lbl_B87F                                 ;Jump
Lbl_B809: ldaa    LastCoolantTempVolts                     ;Load Accumulator A
          ldx     #TL_TempForHotScaleA2D                   ;Load Index Register X
          brclr   *PIA3_Buffer_t3, #b4_CF_CoolantTemp, Lbl_B833 ;(00010000)  ;Branch if Bit(s) Clear
          ldx     #TL_TempForColdScaleFromA2D              ;Load Index Register X
          cmpa    #0x40 ;(01000000)                        ;Compare A to Memory
;   1.2 volts
          bcc     Lbl_B837                                 ;Branch if Higher or Same
Lbl_B819: brset   *BitFlags66_t3, #b1_22_bt1| b0_22_bt0, Lbl_B824 ;(00000011)  ;Branch if Bit(s) Set
          ldab    BitFlags66_t3                            ;Load Accumulator B
          addb    #0x01 ;(00000001)                        ;Add Memory to B
          stab    BitFlags66_t3                            ;Store Accumulator B
          rts                                              ;Return from Subroutine
Lbl_B824: sei                                              ;Set Mask Disable Int
          bclr    *BitFlags66_t3, #b1_22_bt1| b0_22_bt0 ;(00000011)  ;Clear Bits(s)
          ldab    PIA3_Buffer_t3                           ;Load Accumulator B
          eorb    #0x10 ;(00010000)                        ;Exclusive OR B with Memory
          stab    PIA3_Buffer_t3                           ;Store Accumulator B
          stab    PIA3_Buffer_2_t3                         ;Store Accumulator B
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
Lbl_B833: cmpa    #0xDC ;(11011100)                        ;Compare A to Memory
;   4.3 volts
          bcc     Lbl_B819                                 ;Branch if Higher or Same
Lbl_B837: bclr    *BitFlags66_t3, #b1_22_bt1| b0_22_bt0 ;(00000011)  ;Clear Bits(s)
          cmpa    TL_CoolantTempOutOfRangeHigh ;(0xFD/256.39 deg)  ;Compare A to Memory
          bhi     SetCoolantTempErrorHi                    ;Branch if Higher
          cmpa    TL_CoolantTempOutOfRangeLow ;(0x1A/-153.10 deg)  ;Compare A to Memory
          bcs     SetCoolantTempErrorLow                   ;Branch if Lower
          brclr   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, Lbl_B84F ;(00000010)  ;Branch if Bit(s) Clear
          ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
          jsr     ResetErrorCodeIfTimerExpired             ;Jump to Subroutine
          bra     Lbl_B87F                                 ;Branch Always
Lbl_B84F: jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldab    CoolantTemp                              ;Load Accumulator B
          sba                                              ;Subtract B from A
          bcc     Lbl_B85A                                 ;Branch if Higher or Same
          decb                                             ;Decrement Accumulator B
          bra     StoreCoolantTemp                         ;Branch Always
Lbl_B85A: cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
;   5 deg?
          bcs     Lbl_B87F                                 ;Branch if Lower
          incb                                             ;Increment Accumulator B
StoreCoolantTemp:
          stab    CoolantTemp                              ;Store Accumulator B
          bra     Lbl_B87F                                 ;Branch Always
SetCoolantTempErrorHi:
          ldd     #0x1F9E                                  ;Load Double Accumulator D
          bra     Lbl_B86B                                 ;Branch Always
SetCoolantTempErrorLow:
          ldd     #0x1E9E                                  ;Load Double Accumulator D
Lbl_B86B: brset   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, Lbl_B87F ;(00000010)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_B87F                                 ;Branch if Higher or Same
          bset    *b5C_IPL1_t3, #b1_D5_BadCoolantTemp ;(00000010)  ;Set Bit(s)
          ldaa    TL_DefaultCoolantTempRaw ;(0xA8/103.06 deg)  ;Load Accumulator A
          staa    CoolantTemp                              ;Store Accumulator A
          clr     Timer_ThermostatDiagnostics              ;Clear Memory Byte
Lbl_B87F: ldaa    CoolantTemp                              ;Load Accumulator A
          ldx     #TL_ScaleCoolantTemp                     ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    CoolantTemp_fromTable_Scaled             ;Store Accumulator A
          rts                                              ;Return from Subroutine
CheckAndFilterChargeTempSensor_MM:
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x07 ;(00000111)                        ;Bit(s) Test B with Memory
          beq     Lbl_B893                                 ;Branch if = Zero
          jmp     ChargeTempReturn                         ;Jump
Lbl_B893: ldaa    LastChargeTempVolts                      ;Load Accumulator A
          ldx     #TL_TempForHotScaleA2D                   ;Load Index Register X
          brclr   *PIA3_Buffer_t3, #b5_CF_ChargeTemp, Lbl_B8C0 ;(00100000)  ;Branch if Bit(s) Clear
          ldx     #TL_TempForColdScaleFromA2D              ;Load Index Register X
          cmpa    #0x40 ;(01000000)                        ;Compare A to Memory
          bcc     Lbl_B8C4                                 ;Branch if Higher or Same
Lbl_B8A3: brset   *BitFlags23, #b1_23_a6bb7| b0_23_a6bb6, Lbl_B8B1 ;(00000011)  ;Branch if Bit(s) Set
          ldab    BitFlags23                               ;Load Accumulator B
          addb    #0x01 ;(00000001)                        ;Add Memory to B
          stab    BitFlags23                               ;Store Accumulator B
          ldaa    LastChargeTempVolts                      ;Load Accumulator A
          bra     Lbl_B8C7                                 ;Branch Always
Lbl_B8B1: sei                                              ;Set Mask Disable Int
          bclr    *BitFlags23, #b1_23_a6bb7| b0_23_a6bb6 ;(00000011)  ;Clear Bits(s)
          ldab    PIA3_Buffer_t3                           ;Load Accumulator B
          eorb    #0x20 ;(00100000)                        ;Exclusive OR B with Memory
          stab    PIA3_Buffer_t3                           ;Store Accumulator B
          stab    PIA3_Buffer_2_t3                         ;Store Accumulator B
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
Lbl_B8C0: cmpa    #0xDC ;(11011100)                        ;Compare A to Memory
          bcc     Lbl_B8A3                                 ;Branch if Higher or Same
Lbl_B8C4: bclr    *BitFlags23, #b1_23_a6bb7| b0_23_a6bb6 ;(00000011)  ;Clear Bits(s)
Lbl_B8C7: cmpa    TL_ChargeTempOutOfRangeHigh ;(0xFD/256.39 deg)  ;Compare A to Memory
          bhi     Lbl_B8F0                                 ;Branch if Higher
          cmpa    TL_ChargeTempOutOfRangeLow ;(0x1A/-153.10 deg)  ;Compare A to Memory
          bcs     Lbl_B8F5                                 ;Branch if Lower
          brclr   *b5C_IPL1_t3, #b0_D5_bt0, LookupChargeTempValue ;(00000001)  ;Branch if Bit(s) Clear
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          jsr     ResetErrorCodeIfTimerExpired             ;Jump to Subroutine
          bra     ChargeTempReturn                         ;Branch Always
LookupChargeTempValue:
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldab    ChargeTempVolts                          ;Load Accumulator B
          sba                                              ;Subtract B from A
          bcc     Lbl_B8E7                                 ;Branch if Higher or Same
          decb                                             ;Decrement Accumulator B
          bra     StoreChargeTempValue                     ;Branch Always
Lbl_B8E7: cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
          bcs     ChargeTempReturn                         ;Branch if Lower
          incb                                             ;Increment Accumulator B
StoreChargeTempValue:
          stab    ChargeTempVolts                          ;Store Accumulator B
          bra     ChargeTempReturn                         ;Branch Always
Lbl_B8F0: ldd     #0x3A9E                                  ;Load Double Accumulator D
          bra     ChargeTempOutOfRange                     ;Branch Always
Lbl_B8F5: ldd     #0x399E                                  ;Load Double Accumulator D
ChargeTempOutOfRange:
          brset   *b5C_IPL1_t3, #b0_D5_bt0, ChargeTempReturn ;(00000001)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     ChargeTempReturn                         ;Branch if Higher or Same
          bset    *b5C_IPL1_t3, #b0_D5_bt0 ;(00000001)     ;Set Bit(s)
          ldaa    TL_DefaultChargeTemp_Limpin ;(0xA8/103.06 deg)  ;Load Accumulator A
          staa    ChargeTempVolts                          ;Store Accumulator A
ChargeTempReturn:
          ldaa    ChargeTempVolts                          ;Load Accumulator A
          ldx     #TL_ScaleChargeTemp                      ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    IntakeTemp_fromTable_Scaled              ;Store Accumulator A
          rts                                              ;Return from Subroutine
ControlCruiseServo1_MM:
          brclr   *BitFlags24, #b4_24_BadSpeedo1, Lbl_B92D ;(00010000)  ;Branch if Bit(s) Clear
          sei                                              ;Set Mask Disable Int
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          std     Temp4                                    ;Store Accumulator D
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          subd    Temp4                                    ;Subtract Memory from D
          std     VehicleSpeed_HB                          ;Store Accumulator D
          cli                                              ;Clear Mask Enable Int
          bra     Lbl_B92D                                 ;Branch Always
Lbl_B92D: clra                                             ;Clear Accumulator A
          ldab    VehicleSpeedx8_Scaled                    ;Load Accumulator B
          cmpb    TL_SwitchPointForDecelIdleAisControl ;(0x05/2.50 mph)  ;Compare B to Memory
          bcc     Lbl_B93D                                 ;Branch if Higher or Same
          ldx     EngineRpm_HB                             ;Load Index Register X
          cpx     TargetIdleSpeedHB                        ;Compare X to Memory 16-Bit
          bls     Lbl_B948                                 ;Branch if Lower or Same
          bra     Lbl_B943                                 ;Branch Always
Lbl_B93D: ldab    MapValue                                 ;Load Accumulator B
          cmpb    MAPOffsetForCylTrim                      ;Compare B to Memory
          bls     Lbl_B948                                 ;Branch if Lower or Same
Lbl_B943: ldaa    Timer_CountdownFromStartRunForAisFeedback ;Load Accumulator A
          beq     Lbl_B94A                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
Lbl_B948: staa    Timer_CountdownFromStartRunForAisFeedback ;Store Accumulator A
Lbl_B94A: brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_B967 ;(10000000)  ;Branch if Bit(s) Set
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          ldab    TL_SwitchPointForDecelIdleAisControl ;(0x05/2.50 mph)  ;Load Accumulator B
          brset   *BitFlags66_t3, #b2_22_FallToIdle, Lbl_B95F ;(00000100)  ;Branch if Bit(s) Set
          addb    #0x03 ;(00000011)                        ;Add Memory to B
Lbl_B95F: cba                                              ;Compare A to B
          bcs     Lbl_B967                                 ;Branch if Lower
          bset    *BitFlags66_t3, #b2_22_FallToIdle ;(00000100)  ;Set Bit(s)
          bra     Lbl_B96A                                 ;Branch Always
Lbl_B967: bclr    *BitFlags66_t3, #b2_22_FallToIdle ;(00000100)  ;Clear Bits(s)
Lbl_B96A: ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          bcc     Lbl_B973                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_B973: staa    VehicleSpeedx8_Scaled                    ;Store Accumulator A
          rts                                              ;Return from Subroutine
b976_MM:  brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_B9B9 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    MapValue2                                ;Load Accumulator A
          cmpa    #0x80 ;(10000000)                        ;Compare A to Memory
          bcs     Lbl_B9B9                                 ;Branch if Lower
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          ldx     #TL_TL_8024                              ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          adda    MapValue2                                ;Add Memory to A
          bcc     Lbl_B98E                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_B98E: cmpa    BaroPressure                             ;Compare A to Memory
          bls     Lbl_B998                                 ;Branch if Lower or Same
          ldab    BaroPressure                             ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          bne     Lbl_B9B1                                 ;Branch if Not = Zero
          rts                                              ;Return from Subroutine
Lbl_B998: ldab    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator B
          cmpb    TL_ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin ;(0x90/2.82 volts)  ;Compare B to Memory
          bcs     Lbl_B9B3                                 ;Branch if Lower
          ldab    TPSVoltsSessionDelta                     ;Load Accumulator B
          cmpb    TL_ThrottleLevelMinAbove_MINTHR_ToMatureMapLimpin ;(0x05/.10 volts)  ;Compare B to Memory
          bcs     Lbl_B9B4                                 ;Branch if Lower
          cmpa    BaroPressure                             ;Compare A to Memory
          bcc     Lbl_B9B4                                 ;Branch if Higher or Same
          ldab    BaroPressure                             ;Load Accumulator B
          decb                                             ;Decrement Accumulator B
          cmpb    #0x80 ;(10000000)                        ;Compare B to Memory
          bcs     Lbl_B9B3                                 ;Branch if Lower
Lbl_B9B1: stab    BaroPressure                             ;Store Accumulator B
Lbl_B9B3: clrb                                             ;Clear Accumulator B
Lbl_B9B4: incb                                             ;Increment Accumulator B
          bmi     Lbl_B9B9                                 ;Branch if Minus
          stab    TPSVoltsSessionDelta                     ;Store Accumulator B
Lbl_B9B9: rts                                              ;Return from Subroutine
b9ba_MM:  brclr   *StartupSwitchMirror1, #b4_61_PNswitch, Lbl_B9C1 ;(00010000)  ;Branch if Bit(s) Clear
          bclr    *BitFlags2a, #b0_2A_bt0 ;(00000001)      ;Clear Bits(s)
Lbl_B9C1: brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_B9ED ;(00000001)  ;Branch if Bit(s) Set
          ldab    BitFlags68_t3                            ;Load Accumulator B
          andb    #0x10 ;(00010000)                        ;AND B with Memory
          stab    Temp5                                    ;Store Accumulator B
          ldab    StartupSwitchMirror1                     ;Load Accumulator B
          andb    #0x10 ;(00010000)                        ;AND B with Memory
          eorb    Temp5                                    ;Exclusive OR B with Memory
          beq     Lbl_B9F0                                 ;Branch if = Zero
          eorb    BitFlags68_t3                            ;Exclusive OR B with Memory
          orab    #0x80 ;(10000000)                        ;OR Accumulator B (Inclusive)
          stab    BitFlags68_t3                            ;Store Accumulator B
          bclr    *BitFlags66_t3, #b2_22_FallToIdle ;(00000100)  ;Clear Bits(s)
          brclr   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_B9F0 ;(00010000)  ;Branch if Bit(s) Clear
          bset    *BitFlags2f, #$%00010000                 ;Set Bit(s)
          ldaa    TL_TL_8A13 ;(0x10/16.00 Y units)         ;Load Accumulator A
          staa    STe_64C0                                 ;Store Accumulator A
          bra     Lbl_B9F0                                 ;Branch Always
Lbl_B9ED: bclr    *BitFlags68_t3, #b7_25_ATXChgGear| b4_25_ATXInGear ;(10010000)  ;Clear Bits(s)
Lbl_B9F0: rts                                              ;Return from Subroutine
b9f1_MM:  brclr   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_BA15 ;(10000000)  ;Branch if Bit(s) Clear
          ldab    BitFlags68_t3                            ;Load Accumulator B
          andb    #0x01 ;(00000001)                        ;AND B with Memory
          stab    Temp5                                    ;Store Accumulator B
          ldab    StartupSwitchMirror1                     ;Load Accumulator B
          andb    #0x01 ;(00000001)                        ;AND B with Memory
          eorb    Temp5                                    ;Exclusive OR B with Memory
          beq     Lbl_BA1B                                 ;Branch if = Zero
          eorb    BitFlags68_t3                            ;Exclusive OR B with Memory
          brset   *BitFlags36_t3, #b5_7_bt5, Lbl_BA11 ;(00100000)  ;Branch if Bit(s) Set
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_BA11 ;(01000000)  ;Branch if Bit(s) Clear
          orab    #0x02 ;(00000010)                        ;OR Accumulator B (Inclusive)
Lbl_BA11: stab    BitFlags68_t3                            ;Store Accumulator B
          bra     Lbl_BA1B                                 ;Branch Always
Lbl_BA15: bclr    *BitFlags68_t3, #b1_25_bt1 ;(00000010)   ;Clear Bits(s)
          bset    *BitFlags68_t3, #b0_25_bt0 ;(00000001)   ;Set Bit(s)
Lbl_BA1B: rts                                              ;Return from Subroutine
ba1c_MM:  clr     Temp4                                    ;Clear Memory Byte
          clr     Temp3                                    ;Clear Memory Byte
          brset   *Ram_30, #$%00000100, Lbl_BA33           ;Branch if Bit(s) Set
          ldaa    LastTpsVolts                             ;Load Accumulator A
          cmpa    TL_TL_8A4C ;(0xDC/4.31 volts)            ;Compare A to Memory
          bcc     Lbl_BA33                                 ;Branch if Higher or Same
          ldaa    Ram_30                                   ;Load Accumulator A
          adda    #0x01 ;(00000001)                        ;Add Memory to A
          staa    Ram_30                                   ;Store Accumulator A
Lbl_BA33: ldaa    b5C_IPL1_t3                              ;Load Accumulator A
          bita    #0x88 ;(10001000)                        ;Bit(s) Test A with Memory
          bne     CheckThrottleRoutine_MM                  ;Branch if Not = Zero
          brset   *Ram_30, #$%00001000, Lbl_BA57           ;Branch if Bit(s) Set
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_TL_8A4A ;(0x2F/1509.90 rpm)           ;Compare A to Memory
          bcs     Lbl_BA63                                 ;Branch if Lower
          ldaa    BaroPressure                             ;Load Accumulator A
          cmpa    TL_TL_8A4F ;(0xCE/-2.82 psi)             ;Compare A to Memory
          bcc     Lbl_BA50                                 ;Branch if Higher or Same
          ldaa    TL_TL_8A4E ;(0x64/1.96 volts)            ;Load Accumulator A
          bra     Lbl_BA53                                 ;Branch Always
Lbl_BA50: ldaa    TL_TL_8A4D ;(0x8C/2.75 volts)            ;Load Accumulator A
Lbl_BA53: cmpa    MapVolts                                 ;Compare A to Memory
          bcc     Lbl_BA63                                 ;Branch if Higher or Same
Lbl_BA57: ldaa    LastTpsVolts                             ;Load Accumulator A
          cmpa    TL_TL_8A4C ;(0xDC/4.31 volts)            ;Compare A to Memory
          bcs     Lbl_BA63                                 ;Branch if Lower
          com     Temp4                                    ;1's Complement Memory Byte
          bra     Lbl_BA95                                 ;Branch Always
Lbl_BA63: brset   *BitFlags2e, #b3_2E_bt3, Lbl_BA7C ;(00001000)  ;Branch if Bit(s) Set
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    TL_TL_8A49 ;(0x28/20.08 mph)             ;Compare A to Memory
          bcs     CheckThrottleRoutine_MM                  ;Branch if Lower
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_TL_8A4A ;(0x2F/1509.90 rpm)           ;Compare A to Memory
          bcs     CheckThrottleRoutine_MM                  ;Branch if Lower
          ldaa    MapVolts                                 ;Load Accumulator A
          cmpa    TL_TL_8A4B ;(0x28/.78 volts)             ;Compare A to Memory
          bcc     CheckThrottleRoutine_MM                  ;Branch if Higher or Same
Lbl_BA7C: ldaa    LastTpsVolts                             ;Load Accumulator A
          cmpa    TL_TL_8A48 ;(0x20/.63 volts)             ;Compare A to Memory
          bcc     CheckThrottleRoutine_MM                  ;Branch if Higher or Same
          com     Temp3                                    ;1's Complement Memory Byte
          bra     CheckThrottle_BadTpsSignal               ;Branch Always
CheckThrottleRoutine_MM:
          sei                                              ;Set Mask Disable Int
          ldaa    LastTpsVolts                             ;Load Accumulator A
          cmpa    TL_ThrottleLowerLimit ;(0x08/.16 volts)  ;Compare A to Memory
          bcs     CheckThrottle_BadTpsSignal               ;Branch if Lower
          cmpa    TL_ThrottleUpperLimit ;(0xF0/4.71 volts)  ;Compare A to Memory
          bcs     Lbl_BADE                                 ;Branch if Lower
Lbl_BA95: cli                                              ;Clear Mask Enable Int
          brclr   *Counter_MainLoop, #$%00000001, CheckThrottle_AtFullThrottle ;Branch if Bit(s) Clear
          ldd     #0x1BA0                                  ;Load Double Accumulator D
          bra     Lbl_BAA7                                 ;Branch Always
CheckThrottle_BadTpsSignal:
          cli                                              ;Clear Mask Enable Int
          brclr   *Counter_MainLoop, #$%00000001, CheckThrottle_AtFullThrottle ;Branch if Bit(s) Clear
          ldd     #0x1AA0                                  ;Load Double Accumulator D
Lbl_BAA7: brset   *b5C_IPL1_t3, #b6_D5_TpsBadSignal, CheckThrottle_ErrorAlreadyFlagged ;(01000000)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          ldaa    TpsVolts                                 ;Load Accumulator A
          bcc     CheckThrottle_AtFullThrottle             ;Branch if Higher or Same
          bset    *b5C_IPL1_t3, #b6_D5_TpsBadSignal ;(01000000)  ;Set Bit(s)
          tst     Temp4                                    ;Test for Zero or Minus
          beq     Lbl_BABF                                 ;Branch if = Zero
          bset    *Ram_30, #$%00001000                     ;Set Bit(s)
          bra     CheckThrottle_ErrorAlreadyFlagged        ;Branch Always
Lbl_BABF: tst     Temp3                                    ;Test for Zero or Minus
          beq     CheckThrottle_ErrorAlreadyFlagged        ;Branch if = Zero
          bset    *BitFlags2e, #b3_2E_bt3 ;(00001000)      ;Set Bit(s)
CheckThrottle_ErrorAlreadyFlagged:
          ldaa    #0x40 ;(01000000)                        ;Load Accumulator A
          staa    LowestSessionTpsVolts                    ;Store Accumulator A
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, CheckThrottle_GotTpsValue ;(01000000)  ;Branch if Bit(s) Clear
          ldab    MapValue                                 ;Load Accumulator B
          cmpb    TL_MapSwitchPointForFullThrottleOrIdle ;(0xD1/-2.65 psi)  ;Compare B to Memory
          bcs     CheckThrottle_GotTpsValue                ;Branch if Lower
          adda    TL_DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle ;(0x84/2.59 volts)  ;Add Memory to A
          inca                                             ;Increment Accumulator A
CheckThrottle_GotTpsValue:
          staa    TpsVolts                                 ;Store Accumulator A
          bra     CheckThrottle_AtFullThrottle             ;Branch Always
Lbl_BADE: brclr   *b5C_IPL1_t3, #b6_D5_TpsBadSignal, Lbl_BAFA ;(01000000)  ;Branch if Bit(s) Clear
          cli                                              ;Clear Mask Enable Int
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x07 ;(00000111)                        ;Bit(s) Test A with Memory
          bne     CheckThrottle_ErrorAlreadyFlagged        ;Branch if Not = Zero
          ldaa    #0x07 ;(00000111)                        ;Load Accumulator A
          jsr     ResetErrorCodeIfTimerExpired             ;Jump to Subroutine
          brset   *b5C_IPL1_t3, #b6_D5_TpsBadSignal, CheckThrottle_ErrorAlreadyFlagged ;(01000000)  ;Branch if Bit(s) Set
          bclr    *BitFlags2e, #b3_2E_bt3 ;(00001000)      ;Clear Bits(s)
          bclr    *Ram_30, #$%00001000                     ;Clear Bits(s)
          bra     CheckThrottle_ErrorAlreadyFlagged        ;Branch Always
Lbl_BAFA: staa    TpsVolts                                 ;Store Accumulator A
CheckThrottle_AtFullThrottle:
          cli                                              ;Clear Mask Enable Int
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_BB26 ;(10000000)  ;Branch if Bit(s) Set
          ldab    Timer_CountdownFromStartRunForAisFeedback ;Load Accumulator B
          bne     Lbl_BB26                                 ;Branch if Not = Zero
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_BB26 ;(01000000)  ;Branch if Bit(s) Clear
          ldab    KeyOnOrEngineRunningTime                 ;Load Accumulator B
          beq     Lbl_BB26                                 ;Branch if = Zero
          cmpa    LowestSessionTpsVolts                    ;Compare A to Memory
          bcc     Lbl_BB26                                 ;Branch if Higher or Same
          ldaa    Timer_DelayBeforeUpdating_MINTHR         ;Load Accumulator A
          deca                                             ;Decrement Accumulator A
          bne     Lbl_BB29                                 ;Branch if Not = Zero
          ldab    LowestSessionTpsVolts                    ;Load Accumulator B
          cmpb    #0x01 ;(00000001)                        ;Compare B to Memory
          bcc     Lbl_BB20                                 ;Branch if Higher or Same
          ldab    TL_ValueOf_MINTHR_WhenBatteryDisconnected ;(0x39/1.12 volts)  ;Load Accumulator B
Lbl_BB20: decb                                             ;Decrement Accumulator B
          stab    LowestSessionTpsVolts                    ;Store Accumulator B
          bclr    *BitFlags66_t3, #b4_22_bt4 ;(00010000)   ;Clear Bits(s)
Lbl_BB26: ldaa    TL_ProgramLoopsWithThrottleBelow_MINTHR_ToDecrement_MINTHR ;(0x10/16.00 Y units)  ;Load Accumulator A
Lbl_BB29: staa    Timer_DelayBeforeUpdating_MINTHR         ;Store Accumulator A
          ldaa    TL_NumberOfBitsAbove_MINTHR_ToDetermineOnThrottleTransition ;(0x02/2.00 Y units)  ;Load Accumulator A
          ldab    BitFlags66_t3                            ;Load Accumulator B
          bpl     Lbl_BB36                                 ;Branch if Plus
          ldaa    TL_NumberOfBitsAbove_MINTHR_ToDetermineOffThrottleTransition ;(0x01/1.00 Y units)  ;Load Accumulator A
Lbl_BB36: adda    LowestSessionTpsVolts                    ;Add Memory to A
          cmpa    TpsVolts                                 ;Compare A to Memory
          bcc     CheckThrottle_AtIdle                     ;Branch if Higher or Same
          tstb                                             ;Test for Zero or Minus
          bmi     Lbl_BB4E                                 ;Branch if Minus
          bitb    #0x10 ;(00010000)                        ;Bit(s) Test B with Memory
          bne     Lbl_BB4E                                 ;Branch if Not = Zero
          ldaa    LowestSessionTpsVolts                    ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          cmpa    TpsVolts                                 ;Compare A to Memory
          bcc     Lbl_BB4E                                 ;Branch if Higher or Same
          staa    LowestSessionTpsVolts                    ;Store Accumulator A
          orab    #0x10 ;(00010000)                        ;OR Accumulator B (Inclusive)
Lbl_BB4E: orab    #0x80 ;(10000000)                        ;OR Accumulator B (Inclusive)
          bclr    *BitFlags2a, #b0_2A_bt0 ;(00000001)      ;Clear Bits(s)
          bra     Lbl_BB6F                                 ;Branch Always
CheckThrottle_AtIdle:
          tstb                                             ;Test for Zero or Minus
          bpl     Lbl_BB6D                                 ;Branch if Plus
          brset   *BitFlags68_t3, #b2_25_AIS, Lbl_BB5E ;(00000100)  ;Branch if Bit(s) Set
          orab    #0x20 ;(00100000)                        ;OR Accumulator B (Inclusive)
Lbl_BB5E: ldx     #TL_AisDelayAfterThrottleClosesWhenMoving ;(0x8B8B/1.53 sec)  ;Load Index Register X
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    TL_SwitchPointForDecelIdleAisControl ;(0x05/2.50 mph)  ;Compare A to Memory
          bcc     CheckThrottle_VehicleSpeedStillAboveDecelIdle ;Branch if Higher or Same
          inx                                              ;Increment Index Register X
CheckThrottle_VehicleSpeedStillAboveDecelIdle:
          ldaa    0x00, X                                  ;Load Accumulator A
          staa    Timer_CountdownFromStartRunForAisFeedback ;Store Accumulator A
Lbl_BB6D: andb    #0x7F ;(01111111)                        ;AND B with Memory
Lbl_BB6F: bitb    #0x08 ;(00001000)                        ;Bit(s) Test B with Memory
          bne     Lbl_BB94                                 ;Branch if Not = Zero
          brclr   *StartupSwitchMirror1, #b5_61_Brake, Lbl_BB94 ;(00100000)  ;Branch if Bit(s) Clear
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_ThrottleSelfCalibrationRpmThreshold ;(0x26/1220.77 rpm)  ;Compare A to Memory
          bcs     Lbl_BB94                                 ;Branch if Lower
          ldaa    MapValue                                 ;Load Accumulator A
          cmpa    TL_ThrottleSelfCalibrationMapDeltaThreshold ;(0x4C/-10.32 psi)  ;Compare A to Memory
          bcc     Lbl_BB94                                 ;Branch if Higher or Same
          ldaa    LowestSessionTpsVolts                    ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          cmpa    TL_ValueOf_MINTHR_WhenBatteryDisconnected ;(0x39/1.12 volts)  ;Compare A to Memory
          bcs     Lbl_BB90                                 ;Branch if Lower
          ldaa    TL_ValueOf_MINTHR_WhenBatteryDisconnected ;(0x39/1.12 volts)  ;Load Accumulator A
Lbl_BB90: staa    LowestSessionTpsVolts                    ;Store Accumulator A
          orab    #0x08 ;(00001000)                        ;OR Accumulator B (Inclusive)
Lbl_BB94: ldaa    LowestSessionTpsVolts                    ;Load Accumulator A
          adda    #0x30 ;(00110000)                        ;Add Memory to A
          cmpa    TpsVolts                                 ;Compare A to Memory
          bcc     Lbl_BB9E                                 ;Branch if Higher or Same
          andb    #0xF7 ;(11110111)                        ;AND B with Memory
Lbl_BB9E: stab    BitFlags66_t3                            ;Store Accumulator B
          ldaa    TpsVolts                                 ;Load Accumulator A
          suba    LowestSessionTpsVolts                    ;Subtract Memory from A
          bcc     Lbl_BBA7                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_BBA7: staa    TpsVolts_Minus_LowestSessionTpsVolts     ;Store Accumulator A
          rts                                              ;Return from Subroutine
CalculateL0063LoadFactor:
          sei                                              ;Set Mask Disable Int
          jsr     CalculateEngineRpm                       ;Jump to Subroutine
          cli                                              ;Clear Mask Enable Int
          std     Temp0                                    ;Store Accumulator D
          addd    UNe_64A3                                 ;Add 16-Bit to D
          rora                                             ;Rotate Right
          rorb                                             ;Rotate Right
          std     Temp2                                    ;Store Accumulator D
          ldd     Temp0                                    ;Load Double Accumulator D
          std     UNe_64A3                                 ;Store Accumulator D
          std     EngineRpm_HB                             ;Store Accumulator D
          clra                                             ;Clear Accumulator A
          ldab    VehicleSpeedx8_Scaled                    ;Load Accumulator B
          std     Temp4                                    ;Store Accumulator D
          ldab    Temp2                                    ;Load Accumulator B
          lsrb                                             ;Logical Shift Right B
          aba                                              ;Add Accumulators
          lsrb                                             ;Logical Shift Right B
          clra                                             ;Clear Accumulator A
          ldx     Temp4                                    ;Load Index Register X
          fdiv                                             ;Frac Div D/X X=q*65536 D=R
          xgdx                                             ;Exchange D with X
          bcc     Lbl_BBD8                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_BBD8: lsra                                             ;Logical Shift Right A
          lsra                                             ;Logical Shift Right A
          staa    Temp4                                    ;Store Accumulator A
          ldaa    ScaledDistPWForCruiseControl             ;Load Accumulator A
          tab                                              ;Transfer A to B
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          sba                                              ;Subtract B from A
          adda    Temp4                                    ;Add Memory to A
          bcc     Lbl_BBEA                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_BBEA: staa    ScaledDistPWForCruiseControl             ;Store Accumulator A
          rts                                              ;Return from Subroutine
LookupEngineRPMCell_MM:
          ldab    #0x1C ;(00011100)                        ;Load Accumulator B
Lbl_BBEF: subb    #0x02 ;(00000010)                        ;Subtract Memory from B
          bls     Lbl_BBFE                                 ;Branch if Lower or Same
          ldx     #TL_ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin ;(0x90/2.82 volts)  ;Load Index Register X
          abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          cpx     EngineRpm_HB                             ;Compare X to Memory 16-Bit
          bcc     Lbl_BBEF                                 ;Branch if Higher or Same
          lsrb                                             ;Logical Shift Right B
Lbl_BBFE: stab    RPMTableOffset                           ;Store Accumulator B
          rts                                              ;Return from Subroutine
CalculateValueFor0060_MM:
          clr     Temp0                                    ;Clear Memory Byte
          ldab    TL_TL_84BF ;(0x50/80.00 Y units)         ;Load Accumulator B
          ldaa    MapValueTemp3                            ;Load Accumulator A
          mul                                              ;Multiply A x B = D
          asld                                             ;Arithmetic Shift Left D
          rol     Temp0                                    ;Rotate Left
          asld                                             ;Arithmetic Shift Left D
          rol     Temp0                                    ;Rotate Left
          staa    Temp1                                    ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          ldab    TL_TL_84BE ;(0x7B/123.00 Y units)        ;Load Accumulator B
          asld                                             ;Arithmetic Shift Left D
          addd    Temp0                                    ;Add 16-Bit to D
          std     Temp0                                    ;Store Accumulator D
          ldaa    RPMTableOffset                           ;Load Accumulator A
          ldab    TL_TL_84C0 ;(0xD6/214.00 Y units)        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          addd    Temp0                                    ;Add 16-Bit to D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          oraa    #0x00 ;(00000000)                        ;OR Accumulator A (Inclusive)
          beq     Lbl_BC33                                 ;Branch if = Zero
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_BC33: stab    RPM_Scaled_maybe                         ;Store Accumulator B
          rts                                              ;Return from Subroutine
CheckForWOTAndSetFlag_MM:
          ldab    TL_DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle ;(0x84/2.59 volts)  ;Load Accumulator B
          addb    LowestSessionTpsVolts                    ;Add Memory to B
          bcs     Lbl_BC42                                 ;Branch if Lower
          cmpb    TL_TL_8020 ;(0xFF/5.00 volts)            ;Compare B to Memory
          bcs     Lbl_BC45                                 ;Branch if Lower
Lbl_BC42: ldab    TL_TL_8020 ;(0xFF/5.00 volts)            ;Load Accumulator B
Lbl_BC45: brclr   *BitFlags66_t3, #b6_22_bt6, Lbl_BC4B ;(01000000)  ;Branch if Bit(s) Clear
          subb    #0x03 ;(00000011)                        ;Subtract Memory from B
Lbl_BC4B: cmpb    TpsVolts                                 ;Compare B to Memory
          bcc     Lbl_BC53                                 ;Branch if Higher or Same
          bset    *BitFlags66_t3, #b6_22_bt6 ;(01000000)   ;Set Bit(s)
          rts                                              ;Return from Subroutine
Lbl_BC53: bclr    *BitFlags66_t3, #b6_22_bt6 ;(01000000)   ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbc57:    ldaa    CoolantVoltsTmp1                         ;Load Accumulator A
          ldab    CoolantVoltsTmp2                         ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          std     Temp1                                    ;Store Accumulator D
          ldab    CoolantVoltsTmp1                         ;Load Accumulator B
          subb    CoolantVoltsTmp2                         ;Subtract Memory from B
          bls     Lbl_BCAA                                 ;Branch if Lower or Same
          clra                                             ;Clear Accumulator A
          xgdx                                             ;Exchange D with X
          ldd     Temp1                                    ;Load Double Accumulator D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
          abx                                              ;Add B to X
          ldd     Temp1                                    ;Load Double Accumulator D
          idiv                                             ;Int Div D/X X=q D=R
          xgdx                                             ;Exchange D with X
          tsta                                             ;Test for Zero or Minus
          bne     Lbl_BCAA                                 ;Branch if Not = Zero
          stab    Temp0                                    ;Store Accumulator B
          ldaa    Temp0                                    ;Load Accumulator A
          ldx     #TL_TempForScaleAmbientA2D               ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          tab                                              ;Transfer A to B
          suba    AmbientAirTempVolts2                     ;Subtract Memory from A
          bcc     Lbl_BC9A                                 ;Branch if Higher or Same
          cmpa    #0xF0 ;(11110000)                        ;Compare A to Memory
          bhi     Lbl_BCA6                                 ;Branch if Higher
          ldab    AmbientAirTempVolts2                     ;Load Accumulator B
          subb    #0x10 ;(00010000)                        ;Subtract Memory from B
          bcc     Lbl_BCA6                                 ;Branch if Higher or Same
          ldab    #0x00 ;(00000000)                        ;Load Accumulator B
          bra     Lbl_BCA6                                 ;Branch Always
Lbl_BC9A: cmpa    #0x10 ;(00010000)                        ;Compare A to Memory
          bls     Lbl_BCA6                                 ;Branch if Lower or Same
          ldab    AmbientAirTempVolts2                     ;Load Accumulator B
          addb    #0x10 ;(00010000)                        ;Add Memory to B
          bcc     Lbl_BCA6                                 ;Branch if Higher or Same
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_BCA6: stab    AmbientAirTempVolts2                     ;Store Accumulator B
          bra     Lbl_BCBE                                 ;Branch Always
Lbl_BCAA: brset   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, Lbl_BCBE ;(00000010)  ;Branch if Bit(s) Set
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    #0xC1 ;(11000001)                        ;Compare A to Memory
;   148 deg
          bcc     Lbl_BCBE                                 ;Branch if Higher or Same
          ldd     #0x4708                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          ldaa    #0xC1 ;(11000001)                        ;Load Accumulator A
;   148 deg
          staa    AmbientAirTempVolts2                     ;Store Accumulator A
Lbl_BCBE: rts                                              ;Return from Subroutine
DetermineTargetBatteryVoltage:
          ldaa    AmbientAirTempVolts2                     ;Load Accumulator A
;   sets target battery volts using table BatteryVoltsTable1
;   and the ambientairtempvolts2 value using 4byte lookup
          ldab    TL_BatteryVoltsTablePtr ;(0x01/1.00 Y units)  ;Load Accumulator B
          cmpb    #0x02 ;(00000010)                        ;Compare B to Memory
          beq     Lbl_BCD1                                 ;Branch if = Zero
          cmpb    #0x01 ;(00000001)                        ;Compare B to Memory
          beq     Lbl_BCD6                                 ;Branch if = Zero
          ldx     #TL_BatteryVoltsTable3                   ;Load Index Register X
          bra     Lbl_BCD9                                 ;Branch Always
Lbl_BCD1: ldx     #TL_BatteryVoltsTable2                   ;Load Index Register X
          bra     Lbl_BCD9                                 ;Branch Always
Lbl_BCD6: ldx     #TL_BatteryVoltsTable1                   ;Load Index Register X
Lbl_BCD9: jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    TargetBatteryVolts                       ;Store Accumulator A
          rts                                              ;Return from Subroutine
ReadA2DBattVolts:
          ldaa    ADR2_A2DResults2                         ;Load Accumulator A
          ldab    BodyComputerBatteryVoltsOutput           ;Load Accumulator B
          addb    #0xF8 ;(11111000)                        ;Add Memory to B
          bcs     Lbl_BCF0                                 ;Branch if Lower
          comb                                             ;1's Complement B
          aba                                              ;Add Accumulators
          bcc     Lbl_BCF1                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
          bra     Lbl_BCF1                                 ;Branch Always
Lbl_BCF0: sba                                              ;Subtract B from A
Lbl_BCF1: rts                                              ;Return from Subroutine
bcf2_MM:  brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_BD33 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    PPROG_EEPROMControlReg                   ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
;   check if eeprom is in write or erase mode
          bne     Lbl_BD33                                 ;Branch if Not = Zero
          ldaa    TL_TL_b7e1                               ;Load Accumulator A
          coma                                             ;1's Complement A
          cmpa    TL_TL_b7e0                               ;Compare A to Memory
          beq     Lbl_BD08                                 ;Branch if = Zero
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
Lbl_BD08: staa    BodyComputerBatteryVoltsOutput           ;Store Accumulator A
;   store table b7e1 1's complement to body computer bat volts (0 to 8?)
          ldaa    TL_TL_b615                               ;Load Accumulator A
          coma                                             ;1's Complement A
          cmpa    TL_TL_b614                               ;Compare A to Memory
          beq     Lbl_BD16                                 ;Branch if = Zero
          clra                                             ;Clear Accumulator A
          bra     Lbl_BD22                                 ;Branch Always
Lbl_BD16: cmpa    #0x0C ;(00001100)                        ;Compare A to Memory
          ble     Lbl_BD1C                                 ;Branch if <= Zero
          ldaa    #0x0C ;(00001100)                        ;Load Accumulator A
Lbl_BD1C: cmpa    #0xF4 ;(11110100)                        ;Compare A to Memory
          bge     Lbl_BD22                                 ;Branch if >= Zero
          ldaa    #0xF4 ;(11110100)                        ;Load Accumulator A
Lbl_BD22: staa    Ram_4B                                   ;Store Accumulator A
;   store table b615 1's complement to ram_4b or (0 or f4?)
          ldaa    TL_TL_b7ef                               ;Load Accumulator A
          cmpa    #0x55 ;(01010101)                        ;Compare A to Memory
          bne     Lbl_BD30                                 ;Branch if Not = Zero
          bset    *BitFlags6a_t3, #b1_26_bt1 ;(00000010)   ;Set Bit(s)
          bra     Lbl_BD33                                 ;Branch Always
Lbl_BD30: bclr    *BitFlags6a_t3, #b1_26_bt1 ;(00000010)   ;Clear Bits(s)
Lbl_BD33: rts                                              ;Return from Subroutine
CalculateSparkAdvance_MM:
          clr     Temp4                                    ;Clear Memory Byte
          ldx     #TL_Spark1A_RPMMAP                       ;Load Index Register X
          ldaa    BitFlags6d_t3                            ;Load Accumulator A
          bita    #0x50 ;(01010000)                        ;Bit(s) Test A with Memory
          bne     Lbl_BD51                                 ;Branch if Not = Zero
          ldaa    Ram_CC                                   ;Load Accumulator A
          beq     Lbl_BD4A                                 ;Branch if = Zero
          brset   *PIA2_Buffer_t3, #b1_CE_EGR, Lbl_BD51 ;(00000010)  ;Branch if Bit(s) Set
          bra     Lbl_BD4E                                 ;Branch Always
Lbl_BD4A: brclr   *PIA2_Buffer_t3, #b1_CE_EGR, Lbl_BD51 ;(00000010)  ;Branch if Bit(s) Clear
Lbl_BD4E: ldx     #TL_Spark1B_RPMMAP                       ;Load Index Register X
Lbl_BD51: ldaa    EngineRPM_3D                             ;Load Accumulator A
          ldab    MapValue2                                ;Load Accumulator B
          jsr     Lookup3DTableRoutine                     ;Jump to Subroutine
          bpl     Lbl_BD5C                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_BD5C: staa    Temp5                                    ;Store Accumulator A
          brclr   *IPL1, #b4_20_bt4, CalcSpark ;(00010000)  ;Branch if Bit(s) Clear
          ldx     #TL_Spark2A_RPMMAP                       ;Load Index Register X
          ldaa    EngineRPM_3D                             ;Load Accumulator A
          ldab    MapValue2                                ;Load Accumulator B
          jsr     Lookup3DTableRoutine                     ;Jump to Subroutine
          bpl     Lbl_BD71                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_BD71: adda    Temp5                                    ;Add Memory to A
          bpl     Lbl_BD78                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_BD78: staa    Temp5                                    ;Store Accumulator A
CalcSpark:ldx     #TL_MapValFromRPMPtr                     ;Load Index Register X
          ldab    RPMTableOffset                           ;Load Accumulator B
          abx                                              ;Add B to X
          ldaa    0x00, X                                  ;Load Accumulator A
          cmpa    MapValue2                                ;Compare A to Memory
          bcc     Lbl_BDCC                                 ;Branch if Higher or Same
          bset    *BitFlags23, #b6_23_bt6 ;(01000000)      ;Set Bit(s)
          ldx     #TL_TL_8266                              ;Load Index Register X
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          jsr     OddBallLookup                            ;Jump to Subroutine
          subb    #0x20 ;(00100000)                        ;Subtract Memory from B
          stab    Temp4                                    ;Store Accumulator B
          ldaa    IntakeTemp_fromTable_Scaled              ;Load Accumulator A
          ldx     #TL_TL_826F                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          subb    #0x20 ;(00100000)                        ;Subtract Memory from B
          addb    Temp4                                    ;Add Memory to B
          bvc     Lbl_BDAF                                 ;Branch if Overflow Clear
          ldab    #0x80 ;(10000000)                        ;Load Accumulator B
          tst     Temp4                                    ;Test for Zero or Minus
          bmi     Lbl_BDAF                                 ;Branch if Minus
          ldab    #0x7F ;(01111111)                        ;Load Accumulator B
Lbl_BDAF: stab    Temp4                                    ;Store Accumulator B
          ldaa    BaroPressure                             ;Load Accumulator A
          cmpa    TL_TL_8278 ;(0xD0/-2.71 psi)             ;Compare A to Memory
          bcc     Lbl_BDCF                                 ;Branch if Higher or Same
          subb    TL_TL_8279 ;(0x02/-14.58 psi)            ;Subtract Memory from B
          bvc     Lbl_BDC7                                 ;Branch if Overflow Clear
          ldab    #0x80 ;(10000000)                        ;Load Accumulator B
          tst     Temp4                                    ;Test for Zero or Minus
          bmi     Lbl_BDC7                                 ;Branch if Minus
          ldab    #0x7F ;(01111111)                        ;Load Accumulator B
Lbl_BDC7: stab    Temp4                                    ;Store Accumulator B
          bra     Lbl_BDCF                                 ;Branch Always
Lbl_BDCC: bclr    *BitFlags23, #b6_23_bt6 ;(01000000)      ;Clear Bits(s)
Lbl_BDCF: jsr     Lbl_BF20                                 ;Jump to Subroutine
          ldaa    TL_TL_827A ;(0x00/.00 Y units)           ;Load Accumulator A
          beq     Lbl_BDEA                                 ;Branch if = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_BDEA ;(10000000)  ;Branch if Bit(s) Set
          ldab    VehicleSpeedx8_Scaled                    ;Load Accumulator B
          brclr   *BitFlags23, #b4_23_bt4, Lbl_BDE7 ;(00010000)  ;Branch if Bit(s) Clear
          adda    #0x03 ;(00000011)                        ;Add Memory to A
          bcc     Lbl_BDE7                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_BDE7: cba                                              ;Compare A to B
          bcc     Lbl_BDEF                                 ;Branch if Higher or Same
Lbl_BDEA: bclr    *BitFlags23, #b4_23_bt4 ;(00010000)      ;Clear Bits(s)
          bra     Lbl_BDF2                                 ;Branch Always
Lbl_BDEF: bset    *BitFlags23, #b4_23_bt4 ;(00010000)      ;Set Bit(s)
Lbl_BDF2: ldaa    TL_TL_827A ;(0x00/.00 Y units)           ;Load Accumulator A
          beq     Lbl_BE2B                                 ;Branch if = Zero
          ldx     #TL_TL_827C                              ;Load Index Register X
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          jsr     OddBallLookup                            ;Jump to Subroutine
          brclr   *BitFlags23, #b4_23_bt4, Lbl_BE0F ;(00010000)  ;Branch if Bit(s) Clear
          addb    TL_TL_827B ;(0x00/.00 Y units)           ;Add Memory to B
          bpl     Lbl_BE0A                                 ;Branch if Plus
          ldab    #0x7F ;(01111111)                        ;Load Accumulator B
Lbl_BE0A: stab    Temp5                                    ;Store Accumulator B
          bra     Lbl_BE2B                                 ;Branch Always
Lbl_BE0F: stab    Temp4                                    ;Store Accumulator B
          ldaa    MapValue                                 ;Load Accumulator A
          ldx     #TL_TL_8285                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          ldaa    Temp4                                    ;Load Accumulator A
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          staa    Temp4                                    ;Store Accumulator A
          jsr     Lbl_BF20                                 ;Jump to Subroutine
          staa    Temp0                                    ;Store Accumulator A
          bra     Lbl_BE8E                                 ;Branch Always
Lbl_BE2B: ldaa    Temp5                                    ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_BE8E ;(01000000)  ;Branch if Bit(s) Clear
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_BE8E ;(10000000)  ;Branch if Bit(s) Set
          brset   *BitFlags66_t3, #b2_22_FallToIdle, Lbl_BE8E ;(00000100)  ;Branch if Bit(s) Set
          ldab    Timer_CountdownFromStartRunForAisFeedback ;Load Accumulator B
          bne     DontUseSparkScatter                      ;Branch if Not = Zero
          ldab    TimerOverflowsBetweenCamPulses           ;Load Accumulator B
          bne     DontUseSparkScatter                      ;Branch if Not = Zero
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    TL_TL_8689 ;(0x0A/321.25 rpm)            ;Compare B to Memory
;   321 rpm
          bcs     DontUseSparkScatter                      ;Branch if Lower
          ldab    b5C_IPL1_t3                              ;Load Accumulator B
          bitb    #0x88 ;(10001000)                        ;Bit(s) Test B with Memory
          bne     DontUseSparkScatter                      ;Branch if Not = Zero
          ldab    CoolantTemp                              ;Load Accumulator B
          cmpb    TL_TempAboveWhichSparkScatterIsActive ;(0x58/-41.25 Degrees)  ;Compare B to Memory
          bcs     DontUseSparkScatter                      ;Branch if Lower
          ldx     KeyOnOrEngineRunningTime                 ;Load Index Register X
          cpx     TL_ScatterInhibitTime ;(0x038D/9.99 Sec)  ;Compare X to Memory 16-Bit
          bcs     DontUseSparkScatter                      ;Branch if Lower
          ldx     #TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm ;Load Index Register X
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          subd    TargetIdleSpeedHB                        ;Subtract Memory from D
          bcc     Lbl_BE6E                                 ;Branch if Higher or Same
          ldx     #TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm ;Load Index Register X
          coma                                             ;1's Complement A
          comb                                             ;1's Complement B
Lbl_BE6E: lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          bcc     Lbl_BE77                                 ;Branch if Higher or Same
          addd    #0x0001                                  ;Add 16-Bit to D
Lbl_BE77: tsta                                             ;Test for Zero or Minus
          beq     Lbl_BE7C                                 ;Branch if = Zero
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_BE7C: tba                                              ;Transfer B to A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    SparkScatter                             ;Store Accumulator A
          staa    Temp4                                    ;Store Accumulator A
          jsr     Lbl_BF20                                 ;Jump to Subroutine
          staa    Temp0                                    ;Store Accumulator A
          bra     Lbl_BE9C                                 ;Branch Always
Lbl_BE8E: clr     SparkScatter                             ;Clear Memory Byte
          clr     SparkScatterIncrement                    ;Clear Memory Byte
          bra     Lbl_BEB3                                 ;Branch Always
DontUseSparkScatter:
          clr     SparkScatter                             ;Clear Memory Byte
          clr     SparkScatterIncrement                    ;Clear Memory Byte
Lbl_BE9C: ldaa    TL_TL_868B ;(0x1C/28.00 Y units)         ;Load Accumulator A
          brset   *BitFlags6d_t3, #b3_28_bt3, Lbl_BEAE ;(00001000)  ;Branch if Bit(s) Set
          brset   *BitFlags2a, #b0_2A_bt0, Lbl_BEAB ;(00000001)  ;Branch if Bit(s) Set
          brclr   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, Lbl_BEB3 ;(00000010)  ;Branch if Bit(s) Clear
Lbl_BEAB: ldaa    TL_TL_868A ;(0x1C/28.00 Y units)         ;Load Accumulator A
Lbl_BEAE: staa    Temp0                                    ;Store Accumulator A
          bra     Lbl_BEF9                                 ;Branch Always
Lbl_BEB3: ldd     #0x0000                                  ;Load Double Accumulator D
          brclr   *BitFlags2c, #$%00001000, Lbl_BEC1       ;Branch if Bit(s) Clear
          sei                                              ;Set Mask Disable Int
          bclr    *BitFlags2c, #$%00001000                 ;Clear Bits(s)
          cli                                              ;Clear Mask Enable Int
          bra     Lbl_BF01                                 ;Branch Always
Lbl_BEC1: ldaa    Temp0                                    ;Load Accumulator A
          decb                                             ;Decrement Accumulator B
          cmpb    Ram_4C                                   ;Compare B to Memory
          beq     Lbl_BEFE                                 ;Branch if = Zero
          brclr   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_BEFE ;(00000001)  ;Branch if Bit(s) Clear
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_BEFE ;(10000000)  ;Branch if Bit(s) Set
          cmpa    Ram_4C                                   ;Compare A to Memory
          bls     Lbl_BEFE                                 ;Branch if Lower or Same
          ldaa    EngineRpmTemp                            ;Load Accumulator A
          suba    EngineRpm_HB                             ;Subtract Memory from A
          bcs     Lbl_BEE0                                 ;Branch if Lower
          cmpa    TL_TL_8082 ;(0x04/128.50 rpm)            ;Compare A to Memory
          bcc     Lbl_BEF9                                 ;Branch if Higher or Same
Lbl_BEE0: ldaa    Ram_4C                                   ;Load Accumulator A
          ldab    CounterUp_43                             ;Load Accumulator B
          cmpb    TL_TL_8081 ;(0x0C/12.00 Y units)         ;Compare B to Memory
          tab                                              ;Transfer A to B
          bcs     Lbl_BF01                                 ;Branch if Lower
          ldaa    Ram_4C                                   ;Load Accumulator A
          adda    TL_TL_8080 ;(0x02/2.00 Y units)          ;Add Memory to A
          bpl     Lbl_BEF3                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_BEF3: tab                                              ;Transfer A to B
          cmpa    Temp0                                    ;Compare A to Memory
          bcs     Lbl_BEFE                                 ;Branch if Lower
Lbl_BEF9: ldaa    Temp0                                    ;Load Accumulator A
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_BEFE: clr     CounterUp_43                             ;Clear Memory Byte
Lbl_BF01: staa    Temp0                                    ;Store Accumulator A
          stab    Ram_4C                                   ;Store Accumulator B
          adda    Ram_4B                                   ;Add Memory to A
          bvc     Lbl_BF10                                 ;Branch if Overflow Clear
          bpl     Lbl_BF12                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
          bra     Lbl_BF13                                 ;Branch Always
Lbl_BF10: bpl     Lbl_BF13                                 ;Branch if Plus
Lbl_BF12: clra                                             ;Clear Accumulator A
Lbl_BF13: ldab    UNe_6481                                 ;Load Accumulator B
          bitb    #0x02 ;(00000010)                        ;Bit(s) Test B with Memory
          beq     Lbl_BF1D                                 ;Branch if = Zero
          ldaa    UNe_6482                                 ;Load Accumulator A
Lbl_BF1D: staa    AdvanceTemporary                         ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_BF20: tst     Temp4                                    ;Test for Zero or Minus
          bpl     Lbl_BF30                                 ;Branch if Plus
          ldaa    Temp4                                    ;Load Accumulator A
          adda    Temp5                                    ;Add Memory to A
          bpl     Lbl_BF3A                                 ;Branch if Plus
          clra                                             ;Clear Accumulator A
          bra     Lbl_BF3A                                 ;Branch Always
Lbl_BF30: ldaa    Temp4                                    ;Load Accumulator A
          adda    Temp5                                    ;Add Memory to A
          bpl     Lbl_BF3A                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_BF3A: staa    Temp5                                    ;Store Accumulator A
          rts                                              ;Return from Subroutine
bf3e_MM:  ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          bne     Lbl_BF79                                 ;Branch if Not = Zero
          ldd     TL_TL_807C ;(0x4E20/77.82 Y units)       ;Load Double Accumulator D
          cmpd    TL_TL_82B1 ;(0x4E20/77.82 Y units)       ;Compare D to Memory 16-Bit
          bcc     Lbl_BF4E                                 ;Branch if Higher or Same
          ldd     TL_TL_82B1 ;(0x4E20/77.82 Y units)       ;Load Double Accumulator D
Lbl_BF4E: cmpd    DistributorFallingEdgePulsewidth_HB      ;Compare D to Memory 16-Bit
          bcs     Lbl_BF79                                 ;Branch if Lower
          ldx     #SwitchPortAccessReg1                    ;Load Index Register X
          brset   *IPL1, #b6_20_FuelEngineNotRunning| b0_20_SearchBladeEndRef_INSYNC, Lbl_BF7F ;(01000001)  ;Branch if Bit(s) Set
          brset   *BitFlags23, #b7_23_bt7, Lbl_BF6C ;(10000000)  ;Branch if Bit(s) Set
          brclr   0x00, X, #$%00100000, Lbl_BF7F           ;Branch if Bit(s) Clear
          bset    *BitFlags23, #b7_23_bt7 ;(10000000)      ;Set Bit(s)
          ldaa    TL_TL_807E ;(0x00/.00 Y units)           ;Load Accumulator A
          staa    Ram_7F                                   ;Store Accumulator A
          bra     Lbl_BF82                                 ;Branch Always
Lbl_BF6C: brset   0x00, X, #$%00100000, Lbl_BF82           ;Branch if Bit(s) Set
          ldaa    Ram_7F                                   ;Load Accumulator A
          beq     Lbl_BF82                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Ram_7F                                   ;Store Accumulator A
          bra     Lbl_BF82                                 ;Branch Always
Lbl_BF79: bclr    *IPL1, #b6_20_FuelEngineNotRunning| b0_20_SearchBladeEndRef_INSYNC ;(01000001)  ;Clear Bits(s)
          bclr    *BitFlags23, #b7_23_bt7 ;(10000000)      ;Clear Bits(s)
Lbl_BF7F: clr     Ram_7F                                   ;Clear Memory Byte
Lbl_BF82: rts                                              ;Return from Subroutine
calc_fuel_MM:
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_BFF9 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          ldx     #TL_TL_8449                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          pshb                                             ;Push B onto Stack
          ldaa    BaroPressure                             ;Load Accumulator A
          ldx     #TL_TL_8452                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          pula                                             ;Pull A from Stack
          mul                                              ;Multiply A x B = D
          std     Temp2                                    ;Store Accumulator D
          ldaa    CounterUp_UsedInCalcFuel                 ;Load Accumulator A
          ldx     #TL_TL_845B                              ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldy     Temp2                                    ;Load Index Register Y
          jsr     ScaleYbyA                                ;Jump to Subroutine
          sty     Temp4                                    ;Store Index Register Y
          ldd     Temp2                                    ;Load Double Accumulator D
          subd    Temp4                                    ;Subtract Memory from D
          std     Temp2                                    ;Store Accumulator D
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          ldx     #TL_TL_846E                              ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          ldy     Temp2                                    ;Load Index Register Y
          jsr     ScaleYbyA                                ;Jump to Subroutine
          sty     Temp4                                    ;Store Index Register Y
          ldd     Temp2                                    ;Load Double Accumulator D
          subd    Temp4                                    ;Subtract Memory from D
          std     Temp2                                    ;Store Accumulator D
          clra                                             ;Clear Accumulator A
          ldab    Ram_B1                                   ;Load Accumulator B
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          addd    Temp2                                    ;Add 16-Bit to D
          bcc     Lbl_BFE2                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_BFE2: brclr   *BitFlags21, #b1_21_bt1, Lbl_BFF7 ;(00000010)  ;Branch if Bit(s) Clear
          xgdy                                             ;Exchange D with Y
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_8AA3 ;(0xFF/260.00 deg)            ;Compare A to Memory
          bcc     Lbl_BFF5                                 ;Branch if Higher or Same
          ldaa    TL_TL_8AA4 ;(0xC0/192.00 Y units)        ;Load Accumulator A
          jsr     ScaleYbyA                                ;Jump to Subroutine
Lbl_BFF5: xgdy                                             ;Exchange D with Y
Lbl_BFF7: std     Ram_71                                   ;Store Accumulator D
Lbl_BFF9: rts                                              ;Return from Subroutine
bffa_MM:  ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    TL_TL_8670 ;(0x03/8.47 Sec)              ;Compare A to Memory
          bcs     Lbl_C05C                                 ;Branch if Lower
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    TL_TL_8671 ;(0x14/10.04 mph)             ;Compare A to Memory
          bcs     Lbl_C05C                                 ;Branch if Lower
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_8672 ;(0x94/66.98 deg)             ;Compare A to Memory
          bcs     Lbl_C05C                                 ;Branch if Lower
          ldaa    BaroPressure                             ;Load Accumulator A
          cmpa    TL_TL_8677 ;(0x00/.00 psi)               ;Compare A to Memory
          bcs     Lbl_C05C                                 ;Branch if Lower
          ldaa    TL_TL_866D ;(0xDB/219.00 Y units)        ;Load Accumulator A
          ldab    TargetIdleSpeedHB                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          addd    TargetIdleSpeedHB                        ;Add 16-Bit to D
          bcc     Lbl_C023                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_C023: cmpd    EngineRpm_HB                             ;Compare D to Memory 16-Bit
          bcc     Lbl_C05C                                 ;Branch if Higher or Same
          brclr   *BitFlags2c, #$%01000000, Lbl_C033       ;Branch if Bit(s) Clear
          jsr     Lbl_C0B5                                 ;Jump to Subroutine
          brset   *BitFlags2c, #$%01000000, Lbl_C05C       ;Branch if Bit(s) Set
Lbl_C033: ldaa    TL_TL_8678 ;(0x02/2.00 Y units)          ;Load Accumulator A
          bne     Lbl_C03E                                 ;Branch if Not = Zero
          brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_C063 ;(10000000)  ;Branch if Bit(s) Clear
          bra     Lbl_C05C                                 ;Branch Always
Lbl_C03E: cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          bne     Lbl_C04C                                 ;Branch if Not = Zero
          ldd     Ram_73                                   ;Load Double Accumulator D
          cmpd    TL_TL_8679 ;(0x0320/3.11 Y units)        ;Compare D to Memory 16-Bit
          bcs     Lbl_C063                                 ;Branch if Lower
          bra     Lbl_C05C                                 ;Branch Always
Lbl_C04C: cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          bne     Lbl_C05C                                 ;Branch if Not = Zero
          ldd     Ram_73                                   ;Load Double Accumulator D
          cmpd    TL_TL_8679 ;(0x0320/3.11 Y units)        ;Compare D to Memory 16-Bit
          bcc     Lbl_C05C                                 ;Branch if Higher or Same
          brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_C063 ;(10000000)  ;Branch if Bit(s) Clear
Lbl_C05C: ldaa    TL_TL_866E ;(0x80/128.00 Y units)        ;Load Accumulator A
          staa    Counter_E                                ;Store Accumulator A
          bra     Lbl_C06A                                 ;Branch Always
Lbl_C063: ldaa    Counter_E                                ;Load Accumulator A
          bne     Lbl_C06A                                 ;Branch if Not = Zero
          bset    *BitFlags2c, #$%11000000                 ;Set Bit(s)
Lbl_C06A: ldd     TL_TL_867B ;(0x5DC0/93.39 Y units)       ;Load Double Accumulator D
          brclr   *BitFlags2c, #$%00000010, Lbl_C079       ;Branch if Bit(s) Clear
          subd    TL_TL_867D ;(0x0640/6.23 Y units)        ;Subtract Memory from D
          bcc     Lbl_C079                                 ;Branch if Higher or Same
          ldd     #0x0000                                  ;Load Double Accumulator D
Lbl_C079: cmpd    EngineRpm_HB                             ;Compare D to Memory 16-Bit
          bcc     Lbl_C095                                 ;Branch if Higher or Same
          ldaa    TL_TL_867F ;(0xE0/112.44 mph)            ;Load Accumulator A
          brclr   *BitFlags2c, #$%00000010, Lbl_C08C       ;Branch if Bit(s) Clear
          suba    TL_TL_8680 ;(0x06/6.00 Y units)          ;Subtract Memory from A
          bcc     Lbl_C08C                                 ;Branch if Higher or Same
          ldaa    #0x00 ;(00000000)                        ;Load Accumulator A
Lbl_C08C: cmpa    VehicleSpeedx8_Scaled                    ;Compare A to Memory
          bcc     Lbl_C095                                 ;Branch if Higher or Same
          bset    *BitFlags2c, #$%00000010                 ;Set Bit(s)
          bra     Lbl_C098                                 ;Branch Always
Lbl_C095: bclr    *BitFlags2c, #$%00000010                 ;Clear Bits(s)
Lbl_C098: ldd     TL_TL_8681 ;(0xA600/165.35 Y units)      ;Load Double Accumulator D
          brclr   *BitFlags2c, #$%00000001, Lbl_C0A7       ;Branch if Bit(s) Clear
          subd    TL_TL_8683 ;(0x0190/1.56 Y units)        ;Subtract Memory from D
          bcc     Lbl_C0A7                                 ;Branch if Higher or Same
          ldd     #0x0000                                  ;Load Double Accumulator D
Lbl_C0A7: cmpd    EngineRpm_HB                             ;Compare D to Memory 16-Bit
          bcc     Lbl_C0B1                                 ;Branch if Higher or Same
          bset    *BitFlags2c, #$%00000001                 ;Set Bit(s)
          bra     Lbl_C0B4                                 ;Branch Always
Lbl_C0B1: bclr    *BitFlags2c, #$%00000001                 ;Clear Bits(s)
Lbl_C0B4: rts                                              ;Return from Subroutine
Lbl_C0B5: tst     CounterDn_b7_o2                          ;Test for Zero or Minus
          bne     Lbl_C0F2                                 ;Branch if Not = Zero
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    RpmRelated0087                           ;Compare A to Memory
          bcs     Lbl_C0F2                                 ;Branch if Lower
          ldd     Ram_73                                   ;Load Double Accumulator D
          cmpd    TL_TL_8673 ;(0x0000/.00 Y units)         ;Compare D to Memory 16-Bit
          bcc     Lbl_C0CA                                 ;Branch if Higher or Same
          bra     Lbl_C0EF                                 ;Branch Always
Lbl_C0CA: ldx     Ram_73                                   ;Load Index Register X
          ldaa    TL_TL_866F ;(0x01/1.00 Y units)          ;Load Accumulator A
          bne     Lbl_C0D7                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_C0EF ;(10000000)  ;Branch if Bit(s) Set
          bra     Lbl_C0F2                                 ;Branch Always
Lbl_C0D7: cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          bne     Lbl_C0E2                                 ;Branch if Not = Zero
          cpx     TL_TL_8675 ;(0x0000/.00 Y units)         ;Compare X to Memory 16-Bit
          bcc     Lbl_C0EF                                 ;Branch if Higher or Same
          bra     Lbl_C0F2                                 ;Branch Always
Lbl_C0E2: cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          bne     Lbl_C0EF                                 ;Branch if Not = Zero
          brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_C0F2 ;(10000000)  ;Branch if Bit(s) Clear
          cpx     TL_TL_8675 ;(0x0000/.00 Y units)         ;Compare X to Memory 16-Bit
          bcs     Lbl_C0F2                                 ;Branch if Lower
Lbl_C0EF: bclr    *BitFlags2c, #$%01000000                 ;Clear Bits(s)
Lbl_C0F2: rts                                              ;Return from Subroutine
CalcO2Limit_MM:
          ldx     #TL_RPM3DInputModifierFromRPM2           ;Load Index Register X
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    Temp0                                    ;Store Accumulator A
          ldab    MapValue                                 ;Load Accumulator B
          ldx     #TL_O2LoLimitForInMiddleDetermination    ;Load Index Register X
          jsr     Lookup3DTableRoutine                     ;Jump to Subroutine
          staa    o2LowLimitForInMiddleDetermination       ;Store Accumulator A
          ldaa    Temp0                                    ;Load Accumulator A
          ldab    MapValue                                 ;Load Accumulator B
          ldx     #TL_O2HiLimitForInMiddleDetermination    ;Load Index Register X
          jsr     Lookup3DTableRoutine                     ;Jump to Subroutine
          staa    o2HighLimitForInMiddleDetermination      ;Store Accumulator A
          rts                                              ;Return from Subroutine
c119_MM:  ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_865D ;(0x5B/-35.84 deg)            ;Compare A to Memory
          bcc     Lbl_C129                                 ;Branch if Higher or Same
          ldd     #0x0000                                  ;Load Double Accumulator D
          staa    Ram_82                                   ;Store Accumulator A
          std     Counter_F_HB                             ;Store Accumulator D
          bra     Lbl_C185                                 ;Branch Always
Lbl_C129: ldab    EngineRpmTemp                            ;Load Accumulator B
          cmpb    TL_TL_865E ;(0x0A/10.00 Y units)         ;Compare B to Memory
          bcs     Lbl_C134                                 ;Branch if Lower
          brset   *BitFlags66_t3, #b6_22_bt6, Lbl_C153 ;(01000000)  ;Branch if Bit(s) Set
Lbl_C134: ldaa    EngineRpmTemp                            ;Load Accumulator A
          ldab    RPM_Scaled_maybe                         ;Load Accumulator B
          cmpa    TL_TL_8662 ;(0x5A/90.00 Y units)         ;Compare A to Memory
          bls     Lbl_C142                                 ;Branch if Lower or Same
          cmpb    TL_TL_8663 ;(0xF2/242.00 Y units)        ;Compare B to Memory
          bhi     Lbl_C147                                 ;Branch if Higher
Lbl_C142: clr     Ram_82                                   ;Clear Memory Byte
          bra     Lbl_C14C                                 ;Branch Always
Lbl_C147: ldaa    TL_TL_8664 ;(0x36/54.00 Y units)         ;Load Accumulator A
          staa    Ram_82                                   ;Store Accumulator A
Lbl_C14C: ldd     #0x0000                                  ;Load Double Accumulator D
          std     Counter_F_HB                             ;Store Accumulator D
          bra     Lbl_C185                                 ;Branch Always
Lbl_C153: ldaa    EngineRpmTemp                            ;Load Accumulator A
          cmpa    TL_TL_865F ;(0x6D/109.00 Y units)        ;Compare A to Memory
          bhi     Lbl_C172                                 ;Branch if Higher
          ldab    Ram_82                                   ;Load Accumulator B
          cmpa    TL_TL_8667 ;(0x6A/106.00 Y units)        ;Compare A to Memory
          bcs     Lbl_C166                                 ;Branch if Lower
          cmpb    TL_TL_8660 ;(0x36/54.00 Y units)         ;Compare B to Memory
          beq     Lbl_C170                                 ;Branch if = Zero
Lbl_C166: ldaa    TL_TL_8661 ;(0x22/34.00 Y units)         ;Load Accumulator A
          staa    Ram_82                                   ;Store Accumulator A
          ldd     #0x0000                                  ;Load Double Accumulator D
          std     Counter_F_HB                             ;Store Accumulator D
Lbl_C170: bra     Lbl_C185                                 ;Branch Always
Lbl_C172: ldx     Counter_F_HB                             ;Load Index Register X
          cpx     TL_TL_8665 ;(0x00/.00 Y units)           ;Compare X to Memory 16-Bit
          bcc     Lbl_C180                                 ;Branch if Higher or Same
          ldaa    TL_TL_8661 ;(0x22/34.00 Y units)         ;Load Accumulator A
          staa    Ram_82                                   ;Store Accumulator A
          bra     Lbl_C185                                 ;Branch Always
Lbl_C180: ldaa    TL_TL_8660 ;(0x36/54.00 Y units)         ;Load Accumulator A
          staa    Ram_82                                   ;Store Accumulator A
Lbl_C185: rts                                              ;Return from Subroutine
c186_MM:  sei                                              ;Set Mask Disable Int
          ldaa    MapValueTemp2                            ;Load Accumulator A
          staa    Ram_9D                                   ;Store Accumulator A
          ldaa    MapValue                                 ;Load Accumulator A
          staa    Ram_9E                                   ;Store Accumulator A
          ldd     DistributorFallingEdgePulsewidth_HB      ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          std     Ram_9F                                   ;Store Accumulator D
          ldaa    Counter_O2SensorFeedbackCount_Signed     ;Load Accumulator A
          staa    Ram_A2                                   ;Store Accumulator A
          ldaa    BitFlags29                               ;Load Accumulator A
          eora    Ram_A1                                   ;Exclusive OR A with Memory
          anda    #0x80 ;(10000000)                        ;AND A with Memory
          beq     Lbl_C1A6                                 ;Branch if = Zero
          bset    *BitFlags29, #$%00000001                 ;Set Bit(s)
          bra     Lbl_C1A9                                 ;Branch Always
Lbl_C1A6: bclr    *BitFlags29, #$%00000001                 ;Clear Bits(s)
Lbl_C1A9: ldaa    BitFlags29                               ;Load Accumulator A
          staa    Ram_A1                                   ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          ldab    Ram_0B                                   ;Load Accumulator B
          cmpb    TL_TL_865A ;(0x6C/108.00 Y units)        ;Compare B to Memory
          bcs     Lbl_C1BA                                 ;Branch if Lower
          cmpb    TL_TL_8659 ;(0xA8/168.00 Y units)        ;Compare B to Memory
          bls     Lbl_C1C0                                 ;Branch if Lower or Same
Lbl_C1BA: ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          staa    Ram_0B                                   ;Store Accumulator A
          staa    ValueFromAdaptiveMemory                  ;Store Accumulator A
Lbl_C1C0: brclr   *Ram_A1, #$%01000000, Lbl_C219           ;Branch if Bit(s) Clear
          ldaa    Ram_9D                                   ;Load Accumulator A
          suba    Ram_9E                                   ;Subtract Memory from A
          bcc     Lbl_C1CB                                 ;Branch if Higher or Same
          nega                                             ;2's Complement A
Lbl_C1CB: cmpa    TL_TL_8649 ;(0x08/8.00 Y units)          ;Compare A to Memory
          bcc     Lbl_C219                                 ;Branch if Higher or Same
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_8648 ;(0xD6/186.04 deg)            ;Compare A to Memory
          bcs     Lbl_C219                                 ;Branch if Lower
          ldaa    Ram_9F                                   ;Load Accumulator A
          cmpa    TL_TL_864C ;(0xFF/255.00 Y units)        ;Compare A to Memory
          bcc     Lbl_C203                                 ;Branch if Higher or Same
          cmpa    TL_TL_864B ;(0x55/85.00 Y units)         ;Compare A to Memory
          bcc     Lbl_C219                                 ;Branch if Higher or Same
          cmpa    TL_TL_864A ;(0x18/24.00 Y units)         ;Compare A to Memory
          bcs     Lbl_C219                                 ;Branch if Lower
          ldaa    Ram_9E                                   ;Load Accumulator A
          cmpa    TL_TL_864E ;(0x38/56.00 Y units)         ;Compare A to Memory
          bcs     Lbl_C1FE                                 ;Branch if Lower
          ldx     #TL_TL_864F ;(0x10/16.00 Y units)        ;Load Index Register X
          brset   *BitFlags2c, #$%00100000, Lbl_C21B       ;Branch if Bit(s) Set
          bset    *BitFlags2c, #$%00100000                 ;Set Bit(s)
          bclr    *BitFlags2c, #$%00010000                 ;Clear Bits(s)
          bra     Lbl_C210                                 ;Branch Always
Lbl_C1FE: cmpa    TL_TL_864D ;(0x01/1.00 Y units)          ;Compare A to Memory
          bcc     Lbl_C219                                 ;Branch if Higher or Same
Lbl_C203: ldx     #TL_TL_8654 ;(0x08/8.00 Y units)         ;Load Index Register X
          brset   *BitFlags2c, #$%00010000, Lbl_C21B       ;Branch if Bit(s) Set
          bset    *BitFlags2c, #$%00010000                 ;Set Bit(s)
          bclr    *BitFlags2c, #$%00100000                 ;Clear Bits(s)
Lbl_C210: clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          std     Ram_9B                                   ;Store Accumulator D
          ldaa    0x00, X                                  ;Load Accumulator A
          staa    Ram_99                                   ;Store Accumulator A
Lbl_C218: rts                                              ;Return from Subroutine
Lbl_C219: bra     Lbl_C277                                 ;Branch Always
Lbl_C21B: brclr   *Ram_A1, #$%00000001, Lbl_C218           ;Branch if Bit(s) Clear
          clra                                             ;Clear Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldab    Ram_A2                                   ;Load Accumulator B
          addd    Ram_9B                                   ;Add 16-Bit to D
          std     Ram_9B                                   ;Store Accumulator D
          dec     Ram_99                                   ;Decrement Memory Byte
          bne     Lbl_C218                                 ;Branch if Not = Zero
          subd    0x01, X                                  ;Subtract Memory from D
          bcs     Lbl_C239                                 ;Branch if Lower
          subd    0x03, X                                  ;Subtract Memory from D
          bcs     Lbl_C277                                 ;Branch if Lower
          inc     Temp0                                    ;Increment Memory Byte
Lbl_C239: brset   *BitFlags2c, #$%00100000, Lbl_C259       ;Branch if Bit(s) Set
          ldaa    Ram_9A                                   ;Load Accumulator A
          beq     Lbl_C277                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Ram_9A                                   ;Store Accumulator A
          ldaa    ValueFromAdaptiveMemory                  ;Load Accumulator A
          ldab    Temp0                                    ;Load Accumulator B
          beq     Lbl_C250                                 ;Branch if = Zero
          adda    TL_TL_865B ;(0x10/16.00 Y units)         ;Add Memory to A
          bra     Lbl_C253                                 ;Branch Always
Lbl_C250: suba    TL_TL_865B ;(0x10/16.00 Y units)         ;Subtract Memory from A
Lbl_C253: bcs     Lbl_C277                                 ;Branch if Lower
          staa    ValueFromAdaptiveMemory                  ;Store Accumulator A
          bra     Lbl_C277                                 ;Branch Always
Lbl_C259: ldaa    Ram_0B                                   ;Load Accumulator A
          ldab    Temp0                                    ;Load Accumulator B
          beq     Lbl_C262                                 ;Branch if = Zero
          inca                                             ;Increment Accumulator A
          inca                                             ;Increment Accumulator A
Lbl_C262: deca                                             ;Decrement Accumulator A
          ldab    TL_TL_8659 ;(0xA8/168.00 Y units)        ;Load Accumulator B
          cba                                              ;Compare A to B
          bcc     Lbl_C270                                 ;Branch if Higher or Same
          ldab    TL_TL_865A ;(0x6C/108.00 Y units)        ;Load Accumulator B
          cba                                              ;Compare A to B
          bcs     Lbl_C270                                 ;Branch if Lower
          tab                                              ;Transfer A to B
Lbl_C270: stab    Ram_0B                                   ;Store Accumulator B
          ldaa    TL_TL_865C ;(0x04/4.00 Y units)          ;Load Accumulator A
          staa    Ram_9A                                   ;Store Accumulator A
Lbl_C277: bclr    *BitFlags2c, #$%00110000                 ;Clear Bits(s)
          rts                                              ;Return from Subroutine
CalculateMAPLoadFactor_MM:
          ldaa    MapValue                                 ;Load Accumulator A
          ldab    TL_TL_863A ;(0x57/87.00 Y units)         ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
          subb    BaroPressure                             ;Subtract Memory from B
          mul                                              ;Multiply A x B = D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          std     MAPLoadFactor                            ;Store Accumulator D
          rts                                              ;Return from Subroutine
IncrementCounters_MM:
          ldx     Counter_A_HB                             ;Load Index Register X
          beq     Lbl_C294                                 ;Branch if = Zero
          dex                                              ;Decrement Index Register X
          stx     Counter_A_HB                             ;Store Index Register X
Lbl_C294: ldaa    Counter_B                                ;Load Accumulator A
          beq     Lbl_C29B                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Counter_B                                ;Store Accumulator A
Lbl_C29B: ldaa    Counter_C                                ;Load Accumulator A
          beq     Lbl_C2A2                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Counter_C                                ;Store Accumulator A
Lbl_C2A2: brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_C2C2 ;(01000000)  ;Branch if Bit(s) Clear
          brset   *BitFlags2c, #$%00000100, Lbl_C2B8       ;Branch if Bit(s) Set
          ldaa    Counter_X                                ;Load Accumulator A
          beq     Lbl_C2B3                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Counter_X                                ;Store Accumulator A
          bne     Lbl_C2C2                                 ;Branch if Not = Zero
Lbl_C2B3: sei                                              ;Set Mask Disable Int
          bset    *BitFlags2c, #$%00000100                 ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
Lbl_C2B8: ldaa    PreviousCoolantTemp_fromTable_Scaled     ;Load Accumulator A
          ldx     #TL_TL_84CE                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Counter_X                                ;Store Accumulator B
Lbl_C2C2: ldaa    Counter_D                                ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_C2C9                                 ;Branch if = Zero
          staa    Counter_D                                ;Store Accumulator A
Lbl_C2C9: ldaa    Counter_E                                ;Load Accumulator A
          beq     Lbl_C2D0                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    Counter_E                                ;Store Accumulator A
Lbl_C2D0: ldx     Counter_F_HB                             ;Load Index Register X
          inx                                              ;Increment Index Register X
          beq     Lbl_C2D7                                 ;Branch if = Zero
          stx     Counter_F_HB                             ;Store Index Register X
Lbl_C2D7: rts                                              ;Return from Subroutine
CalculateVariousFactors2:
          ldaa    IntakeTemp_fromTable_Scaled              ;Load Accumulator A
          ldx     #TL_TL_8421                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Ram_81                                   ;Store Accumulator B
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_C320 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    PreviousCoolantTemp_fromTable_Scaled     ;Load Accumulator A
          ldx     #TL_TL_84CE                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Counter_X                                ;Store Accumulator B
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          ldx     #TL_TL_83FD                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          tba                                              ;Transfer B to A
          brclr   *BitFlags21, #b1_21_bt1, Lbl_C30C ;(00000010)  ;Branch if Bit(s) Clear
          ldab    CoolantTemp                              ;Load Accumulator B
          cmpb    TL_TL_8AA3 ;(0xFF/260.00 deg)            ;Compare B to Memory
          bcc     Lbl_C30C                                 ;Branch if Higher or Same
          ldab    TL_TL_8AA5 ;(0xDA/218.00 Y units)        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
Lbl_C30C: staa    Ram_BD                                   ;Store Accumulator A
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          ldx     #TL_TL_84A1                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          tba                                              ;Transfer B to A
          clrb                                             ;Clear Accumulator B
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          std     Counter_A_HB                             ;Store Accumulator D
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
Lbl_C320: ldx     #TL_TL_8406                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Ram_BE                                   ;Store Accumulator B
          ldx     #TL_TL_83EB                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Ram_A3                                   ;Store Accumulator B
          ldx     #TL_TL_84AA                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Ram_A6                                   ;Store Accumulator B
          ldx     #TL_TL_83F4                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Ram_A9                                   ;Store Accumulator B
          ldx     #TL_TL_848F                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    MapAverageFactorRAM_LB                   ;Store Accumulator B
          ldx     #TL_TL_8486                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    TPSAverageFactorRAM_HB                   ;Store Accumulator B
          ldx     #TL_TL_8498                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    TPSAverageFactorRAM_LB                   ;Store Accumulator B
          ldx     #TL_TL_84B3                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Ram_AC                                   ;Store Accumulator B
          ldaa    BatteryVolts                             ;Load Accumulator A
          ldx     #TL_TL_842A                              ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          stab    Ram_B1                                   ;Store Accumulator B
          ldaa    BatteryVolts                             ;Load Accumulator A
          ldx     #TL_DwellTimeFromBatteryVoltsComp        ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          stab    CalculatedDwellTime                      ;Store Accumulator B
          rts                                              ;Return from Subroutine
CalculateAverageValues:
          ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          bne     Lbl_C382                                 ;Branch if Not = Zero
          ldd     TL_TL_82af ;(0x208D/32.42 Y units)       ;Load Double Accumulator D
          cmpd    DistributorFallingEdgePulsewidth_HB      ;Compare D to Memory 16-Bit
          bcc     Lbl_C387                                 ;Branch if Higher or Same
Lbl_C382: bset    *BitFlags29, #$%00000010                 ;Set Bit(s)
          bra     Lbl_C391                                 ;Branch Always
Lbl_C387: ldd     EngineRpm_HB                             ;Load Double Accumulator D
          cmpd    TargetIdleSpeedHB                        ;Compare D to Memory 16-Bit
          bcs     Lbl_C391                                 ;Branch if Lower
          bclr    *BitFlags29, #$%00000010                 ;Clear Bits(s)
Lbl_C391: brclr   *BitFlags29, #$%00000010, AVG_CalculateAverages ;Branch if Bit(s) Clear
          clrb                                             ;Clear Accumulator B
          ldaa    MapValue                                 ;Load Accumulator A
          std     MapValueTemp2                            ;Store Accumulator D
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          std     EngineRpmTemp                            ;Store Accumulator D
          ldaa    TpsVolts                                 ;Load Accumulator A
          std     TPSVoltsTemp_B                           ;Store Accumulator D
          bra     Lbl_C3D1                                 ;Branch Always
AVG_CalculateAverages:
          ldx     #TPSAverageFactorRAM_HB                  ;Load Index Register X
          ldaa    MapValueTemp2                            ;Load Accumulator A
          suba    MapValue                                 ;Subtract Memory from A
          bcc     Lbl_C3B0                                 ;Branch if Higher or Same
          ldx     #TL_MapAverageFactors1 ;(0x0E04/13.96 Y units)  ;Load Index Register X
Lbl_C3B0: ldy     #MapValueTemp2                           ;Load Index Register Y
          ldaa    MapValue                                 ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
          ldx     #TL_RPMAverageFactors1 ;(0x2020/32.00 Y units)  ;Load Index Register X
          ldy     #EngineRpmTemp                           ;Load Index Register Y
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
          ldx     #TL_TPSAverageFactors1 ;(0x18C0/24.65 Y units)  ;Load Index Register X
          ldy     #TPSVoltsTemp_B                          ;Load Index Register Y
          ldaa    TpsVolts                                 ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
Lbl_C3D1: ldx     #TL_MapVoltsAverageFactors1 ;(0x8080/128.00 Y units)  ;Load Index Register X
          ldy     #MapValueTemp3                           ;Load Index Register Y
          ldaa    MapValue                                 ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
          rts                                              ;Return from Subroutine
AVG2_CalculateAverages2:
          ldx     #TL_MapVoltsAverageFactors2 ;(0x0A/10.00 Y units)  ;Load Index Register X
          ldaa    MapValueTemp1                            ;Load Accumulator A
          cmpa    MapValue                                 ;Compare A to Memory
          bcc     Lbl_C3EA                                 ;Branch if Higher or Same
          ldx     #MapAverageFactorRAM_HB                  ;Load Index Register X
Lbl_C3EA: ldy     #MapValueTemp1                           ;Load Index Register Y
          ldaa    MapValue                                 ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
          ldx     #TL_TPSVoltsAverageFactors1 ;(0x20/32.00 Y units)  ;Load Index Register X
          ldaa    TPSVoltsTemp_A                           ;Load Accumulator A
          cmpa    TpsVolts                                 ;Compare A to Memory
          bcc     Lbl_C3FF                                 ;Branch if Higher or Same
          ldx     #TPSAverageFactorRAM_HB                  ;Load Index Register X
Lbl_C3FF: ldy     #TPSVoltsTemp_A                          ;Load Index Register Y
          ldaa    TpsVolts                                 ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
          rts                                              ;Return from Subroutine
Lbl_C409: brset   *BitFlags6d_t3, #b6_28_bt6, Lbl_C415 ;(01000000)  ;Branch if Bit(s) Set
          brclr   *PIA2_Buffer_t3, #b1_CE_EGR, Lbl_C41D ;(00000010)  ;Branch if Bit(s) Clear
          ldaa    Ram_CC                                   ;Load Accumulator A
          bne     Lbl_C41D                                 ;Branch if Not = Zero
Lbl_C415: ldaa    TL_TL_84c9 ;(0x76/118.00 Y units)        ;Load Accumulator A
          ldx     #TL_HotLoad3DTableOffIdle                ;Load Index Register X
          bra     Lbl_C423                                 ;Branch Always
Lbl_C41D: ldaa    TL_MapAverageFactors2 ;(0x7E/126.00 Y units)  ;Load Accumulator A
          ldx     #TL_ColdLoad3DTableOffIdle               ;Load Index Register X
Lbl_C423: staa    Ram_85                                   ;Store Accumulator A
          ldaa    EngineRPM_3D                             ;Load Accumulator A
          ldab    MapValue2                                ;Load Accumulator B
          jsr     Lookup3DTableRoutine                     ;Jump to Subroutine
          staa    Ram_86                                   ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_C42F: ldaa    MapValue                                 ;Load Accumulator A
          ldx     #TL_TL_840f                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          ldaa    Ram_BE                                   ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          mul                                              ;Multiply A x B = D
          ldab    Ram_BE                                   ;Load Accumulator B
          lsrb                                             ;Logical Shift Right B
          lsrb                                             ;Logical Shift Right B
          aba                                              ;Add Accumulators
          bcs     Lbl_C45E                                 ;Branch if Lower
          staa    LDXi_6490                                ;Store Accumulator A
          brclr   *BitFlags2c, #$%00000100, Lbl_C456       ;Branch if Bit(s) Clear
          ldaa    Ram_BD                                   ;Load Accumulator A
          beq     Lbl_C453                                 ;Branch if = Zero
          ldab    TL_TL_84cd ;(0xF0/240.00 Y units)        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          staa    Ram_BD                                   ;Store Accumulator A
Lbl_C453: bclr    *BitFlags2c, #$%00000100                 ;Clear Bits(s)
Lbl_C456: ldaa    LDXi_6490                                ;Load Accumulator A
          ldab    Ram_BD                                   ;Load Accumulator B
          aba                                              ;Add Accumulators
          bcc     Lbl_C460                                 ;Branch if Higher or Same
Lbl_C45E: ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_C460: staa    Ram_84                                   ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_C463: ldd     Ram_73                                   ;Load Double Accumulator D
          cmpd    TL_TL_84d8 ;(0x024E/2.30 Y units)        ;Compare D to Memory 16-Bit
          bcc     Lbl_C470                                 ;Branch if Higher or Same
          bset    *BitFlags29, #$%00100000                 ;Set Bit(s)
          bra     Lbl_C47C                                 ;Branch Always
Lbl_C470: bclr    *BitFlags29, #$%00100000                 ;Clear Bits(s)
          brset   *BitFlags2c, #$%10000000, Lbl_C47C       ;Branch if Bit(s) Set
          tst     Ram_82                                   ;Test for Zero or Minus
          beq     Lbl_C481                                 ;Branch if = Zero
Lbl_C47C: ldaa    TL_TL_84d7 ;(0x06/6.00 Y units)          ;Load Accumulator A
          staa    CounterDn_b9_o2                          ;Store Accumulator A
Lbl_C481: ldaa    Ram_B4                                   ;Load Accumulator A
          cmpa    TL_TL_8a41 ;(0x0A/10.00 Y units)         ;Compare A to Memory
          bcs     Lbl_C4AE                                 ;Branch if Lower
          brclr   *BitFlags29, #$%10000000, Lbl_C49D       ;Branch if Bit(s) Clear
          brset   *b5D_IPL2_t3, #b0_D6_bt1, O2_InvalidSignal_InMiddleRange ;(00000001)  ;Branch if Bit(s) Set
          ldd     #0x0381                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_C4AE                                 ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b0_D6_bt1 ;(00000001)     ;Set Bit(s)
          bra     O2_InvalidSignal_InMiddleRange           ;Branch Always
Lbl_C49D: brset   *b5D_IPL2_t3, #b1_D6_bt2, O2_InvalidSignal_InMiddleRange ;(00000010)  ;Branch if Bit(s) Set
          ldd     #0x0481                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_C4AE                                 ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b1_D6_bt2 ;(00000010)     ;Set Bit(s)
          bra     O2_InvalidSignal_InMiddleRange           ;Branch Always
Lbl_C4AE: tst     CounterDn_b9_o2                          ;Test for Zero or Minus
          bne     O2_InvalidSignal_InMiddleRange           ;Branch if Not = Zero
          ldd     Counter_A_HB                             ;Load Double Accumulator D
          bne     O2_InvalidSignal_InMiddleRange           ;Branch if Not = Zero
          brset   *BitFlags29, #$%01000000, O2_ValidSignal_OutsideMiddleRange ;Branch if Bit(s) Set
          ldaa    O2SensorVolts                            ;Load Accumulator A
          cmpa    TL_HighLimitForImmediateSwitchToClosedLoop ;(0x22/.67 volts)  ;Compare A to Memory
          bcc     O2_ValidSignal_OutsideMiddleRange        ;Branch if Higher or Same
          cmpa    TL_LowLimitForImmediateSwitchToClosedLoop ;(0x14/.39 volts)  ;Compare A to Memory
          bcc     O2_InvalidSignal_InMiddleRange           ;Branch if Higher or Same
O2_ValidSignal_OutsideMiddleRange:
          ldaa    O2SensorVolts                            ;Load Accumulator A
          cmpa    #0x3E ;(00111110)                        ;Compare A to Memory
;   0x3e=1.2 volts
          bcs     Lbl_C4E0                                 ;Branch if Lower
O2_InvalidSignal_InMiddleRange:
          bclr    *BitFlags29, #$%01010100                 ;Clear Bits(s)
          ldaa    TL_TL_8635 ;(0x04/4.00 Y units)          ;Load Accumulator A
          staa    CounterDn_ba_o2                          ;Store Accumulator A
          ldaa    TL_TL_8637 ;(0x60/96.00 Y units)         ;Load Accumulator A
          staa    CounterDn_bc_o2                          ;Store Accumulator A
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          staa    Counter_O2SensorFeedbackCount_Signed     ;Store Accumulator A
          bra     Lbl_C50C                                 ;Branch Always
Lbl_C4E0: jsr     O2_UsingFeedback                         ;Jump to Subroutine
          ldaa    BitFlags29                               ;Load Accumulator A
          bita    #0x04 ;(00000100)                        ;Bit(s) Test A with Memory
          beq     Lbl_C4F1                                 ;Branch if = Zero
          clr     Ram_B4                                   ;Clear Memory Byte
          jsr     Lbl_C538                                 ;Jump to Subroutine
          bra     Lbl_C4F4                                 ;Branch Always
Lbl_C4F1: jsr     Lbl_C574                                 ;Jump to Subroutine
Lbl_C4F4: brset   *BitFlags29, #$%10000000, Lbl_C500       ;Branch if Bit(s) Set
          adda    Counter_O2SensorFeedbackCount_Signed     ;Add Memory to A
          bcc     Lbl_C507                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
          bra     Lbl_C507                                 ;Branch Always
Lbl_C500: tab                                              ;Transfer A to B
          ldaa    Counter_O2SensorFeedbackCount_Signed     ;Load Accumulator A
          sba                                              ;Subtract B from A
          bcc     Lbl_C507                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_C507: staa    Counter_O2SensorFeedbackCount_Signed     ;Store Accumulator A
          bset    *BitFlags29, #$%01000000                 ;Set Bit(s)
Lbl_C50C: rts                                              ;Return from Subroutine
O2_UsingFeedback:
          ldab    O2SensorVolts                            ;Load Accumulator B
          ldaa    BitFlags29                               ;Load Accumulator A
          cmpb    o2HighLimitForInMiddleDetermination      ;Compare B to Memory
          bcs     Lbl_C521                                 ;Branch if Lower
          cmpb    o2LowLimitForInMiddleDetermination       ;Compare B to Memory
          bcc     Lbl_C51D                                 ;Branch if Higher or Same
          brclr   *BitFlags29, #$%10000000, Lbl_C521       ;Branch if Bit(s) Clear
Lbl_C51D: ldab    #0x80 ;(10000000)                        ;Load Accumulator B
          bra     Lbl_C522                                 ;Branch Always
Lbl_C521: clrb                                             ;Clear Accumulator B
Lbl_C522: pshb                                             ;Push B onto Stack
          eorb    BitFlags29                               ;Exclusive OR B with Memory
          lslb                                             ;Logical Shift Left B
          bcc     Lbl_C52F                                 ;Branch if Higher or Same
          oraa    #0x04 ;(00000100)                        ;OR Accumulator A (Inclusive)
          clr     Ram_B4                                   ;Clear Memory Byte
          bra     Lbl_C531                                 ;Branch Always
Lbl_C52F: anda    #0xFB ;(11111011)                        ;AND A with Memory
Lbl_C531: anda    #0x7F ;(01111111)                        ;AND A with Memory
          pulb                                             ;Pull B from Stack
          aba                                              ;Add Accumulators
          staa    BitFlags29                               ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_C538: brclr   *BitFlags29, #$%00010000, Lbl_C54A       ;Branch if Bit(s) Clear
          ldaa    CounterUp_b6_o2                          ;Load Accumulator A
          ldab    TL_TL_8634 ;(0x20/32.00 Y units)         ;Load Accumulator B
          cba                                              ;Compare A to B
          bcs     Lbl_C548                                 ;Branch if Lower
          stab    Ram_B5                                   ;Store Accumulator B
          bra     Lbl_C54A                                 ;Branch Always
Lbl_C548: staa    Ram_B5                                   ;Store Accumulator A
Lbl_C54A: bclr    *BitFlags29, #$%00010000                 ;Clear Bits(s)
          clr     CounterUp_b6_o2                          ;Clear Memory Byte
          ldaa    TL_TL_8635 ;(0x04/4.00 Y units)          ;Load Accumulator A
          staa    CounterDn_ba_o2                          ;Store Accumulator A
          ldaa    TL_TL_8637 ;(0x60/96.00 Y units)         ;Load Accumulator A
          staa    CounterDn_bc_o2                          ;Store Accumulator A
          ldab    Ram_B5                                   ;Load Accumulator B
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_TL_8633 ;(0x20/1028.02 rpm)           ;Compare A to Memory
;   1028 rpm
          bcc     Lbl_C568                                 ;Branch if Higher or Same
          addb    TL_TL_8631 ;(0x0A/10.00 Y units)         ;Add Memory to B
          bra     Lbl_C56B                                 ;Branch Always
Lbl_C568: addb    TL_TL_8632 ;(0x0C/12.00 Y units)         ;Add Memory to B
Lbl_C56B: bcc     Lbl_C56F                                 ;Branch if Higher or Same
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_C56F: tba                                              ;Transfer B to A
          lsr     Ram_B5                                   ;Logical Shift Right
          rts                                              ;Return from Subroutine
Lbl_C574: clra                                             ;Clear Accumulator A
          ldab    CounterDn_bc_o2                          ;Load Accumulator B
          bne     Lbl_C5C1                                 ;Branch if Not = Zero
          ldab    BitFlags29                               ;Load Accumulator B
          bitb    #0x10 ;(00010000)                        ;Bit(s) Test B with Memory
          bne     Lbl_C58E                                 ;Branch if Not = Zero
          clr     CounterUp_b6_o2                          ;Clear Memory Byte
          bset    *BitFlags29, #$%00010000                 ;Set Bit(s)
          ldab    TL_TL_8636 ;(0x02/2.00 Y units)          ;Load Accumulator B
          stab    CounterDn_bb_o2                          ;Store Accumulator B
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          bra     Lbl_C5CC                                 ;Branch Always
Lbl_C58E: ldab    CounterUp_b6_o2                          ;Load Accumulator B
          cmpb    TL_TL_8639 ;(0xFE/254.00 Y units)        ;Compare B to Memory
          bcs     Lbl_C5B4                                 ;Branch if Lower
          brset   *BitFlags2c, #$%10000000, Lbl_C5A7       ;Branch if Bit(s) Set
          ldab    VehicleSpeedx8_Scaled                    ;Load Accumulator B
          beq     Lbl_C5A7                                 ;Branch if = Zero
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    TL_TL_8A3e ;(0x2E/1477.77 rpm)           ;Compare B to Memory
;   1478 rpm
          bcs     Lbl_C5A7                                 ;Branch if Lower
          inc     Ram_B4                                   ;Increment Memory Byte
Lbl_C5A7: ldaa    TL_TL_8638 ;(0x0C/12.00 Y units)         ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          std     Counter_A_HB                             ;Store Accumulator D
          clra                                             ;Clear Accumulator A
          bra     Lbl_C5CC                                 ;Branch Always
Lbl_C5B4: ldab    CounterDn_bb_o2                          ;Load Accumulator B
          bne     Lbl_C5BF                                 ;Branch if Not = Zero
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          ldab    TL_TL_8636 ;(0x02/2.00 Y units)          ;Load Accumulator B
          stab    CounterDn_bb_o2                          ;Store Accumulator B
Lbl_C5BF: bra     Lbl_C5CC                                 ;Branch Always
Lbl_C5C1: ldab    CounterDn_ba_o2                          ;Load Accumulator B
          bne     Lbl_C5CC                                 ;Branch if Not = Zero
          ldab    TL_TL_8635 ;(0x04/4.00 Y units)          ;Load Accumulator B
          stab    CounterDn_ba_o2                          ;Store Accumulator B
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
Lbl_C5CC: rts                                              ;Return from Subroutine
Lbl_C5CD: brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_C5E1 ;(10000000)  ;Branch if Bit(s) Clear
          ldab    MapValue                                 ;Load Accumulator B
          subb    MapValueTemp1                            ;Subtract Memory from B
          bcs     Lbl_C5E1                                 ;Branch if Lower
          ldaa    Ram_A4                                   ;Load Accumulator A
          bne     Lbl_C5E4                                 ;Branch if Not = Zero
          ldaa    TL_TL_863c ;(0x08/8.00 Y units)          ;Load Accumulator A
          cba                                              ;Compare A to B
          bcs     Lbl_C5E4                                 ;Branch if Lower
Lbl_C5E1: clrb                                             ;Clear Accumulator B
          bra     Lbl_C5E6                                 ;Branch Always
Lbl_C5E4: ldaa    Ram_A3                                   ;Load Accumulator A
Lbl_C5E6: mul                                              ;Multiply A x B = D
          std     Ram_A4                                   ;Store Accumulator D
          ldaa    TPSVoltsTemp_A                           ;Load Accumulator A
          ldab    TL_TL_863e ;(0x60/1.88 volts)            ;Load Accumulator B
          addb    LowestSessionTpsVolts                    ;Add Memory to B
          bcc     Lbl_C5F4                                 ;Branch if Higher or Same
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_C5F4: cba                                              ;Compare A to B
          bcc     Lbl_C602                                 ;Branch if Higher or Same
          ldaa    TpsVolts                                 ;Load Accumulator A
          suba    TPSVoltsTemp_A                           ;Subtract Memory from A
          bcs     Lbl_C602                                 ;Branch if Lower
          cmpa    TL_TL_863D ;(0x0A/.20 volts)             ;Compare A to Memory
          bcc     Lbl_C603                                 ;Branch if Higher or Same
Lbl_C602: clra                                             ;Clear Accumulator A
Lbl_C603: ldab    Ram_A6                                   ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          std     Ram_A7                                   ;Store Accumulator D
          rts                                              ;Return from Subroutine
Lbl_C609: clra                                             ;Clear Accumulator A
          ldab    Counter_C                                ;Load Accumulator B
          beq     Lbl_C611                                 ;Branch if = Zero
          jmp     Lbl_C649                                 ;Jump
Lbl_C611: ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    TL_TL_8643 ;(0x1F/995.89 rpm)            ;Compare B to Memory
          bcs     Lbl_C625                                 ;Branch if Lower
          ldab    MapValueTemp2                            ;Load Accumulator B
          subb    MapValue                                 ;Subtract Memory from B
          bcs     Lbl_C625                                 ;Branch if Lower
          cmpb    TL_MapAverageFactors1 ;(0x0E04/13.96 Y units)  ;Compare B to Memory
          bcs     Lbl_C625                                 ;Branch if Lower
          ldaa    Ram_A9                                   ;Load Accumulator A
Lbl_C625: mul                                              ;Multiply A x B = D
          std     Ram_AA                                   ;Store Accumulator D
          ldab    TpsVolts                                 ;Load Accumulator B
          ldaa    LowestSessionTpsVolts                    ;Load Accumulator A
          adda    TL_TL_8645 ;(0x80/2.51 volts)            ;Add Memory to A
          bcc     Lbl_C633                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_C633: cba                                              ;Compare A to B
          bcs     Lbl_C640                                 ;Branch if Lower
          ldaa    TPSVoltsTemp_B                           ;Load Accumulator A
          sba                                              ;Subtract B from A
          bcs     Lbl_C640                                 ;Branch if Lower
          cmpa    TL_TL_8644 ;(0x0A/10.00 Y units)         ;Compare A to Memory
          bcc     Lbl_C644                                 ;Branch if Higher or Same
Lbl_C640: clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          bra     Lbl_C647                                 ;Branch Always
Lbl_C644: ldab    Ram_AC                                   ;Load Accumulator B
          mul                                              ;Multiply A x B = D
Lbl_C647: std     Ram_AD                                   ;Store Accumulator D
Lbl_C649: rts                                              ;Return from Subroutine
c64a_MM:  ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_TL_8A08 ;(0x1E/963.76 rpm)            ;Compare A to Memory
          bcc     Lbl_C67C                                 ;Branch if Higher or Same
          brclr   *BitFlags2f, #$%00001000, Lbl_C670       ;Branch if Bit(s) Clear
          bclr    *BitFlags2f, #$%00001000                 ;Clear Bits(s)
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          ldx     #TL_TL_8A0A                              ;Load Index Register X
          jsr     OddBallLookup                            ;Jump to Subroutine
          clra                                             ;Clear Accumulator A
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          std     STe_64BA                                 ;Store Accumulator D
          ldaa    TL_TL_8A09 ;(0x38/56.00 Y units)         ;Load Accumulator A
          staa    STe_64BC                                 ;Store Accumulator A
          bra     Lbl_C681                                 ;Branch Always
Lbl_C670: ldaa    STe_64BC                                 ;Load Accumulator A
          cmpa    #0x00 ;(00000000)                        ;Compare A to Memory
          beq     Lbl_C67C                                 ;Branch if = Zero
          dec     STe_64BC                                 ;Decrement Memory Byte
          bra     Lbl_C681                                 ;Branch Always
Lbl_C67C: clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          std     STe_64BA                                 ;Store Accumulator D
Lbl_C681: rts                                              ;Return from Subroutine
c682_MM:  ldaa    STe_64C0                                 ;Load Accumulator A
          beq     Lbl_C68C                                 ;Branch if = Zero
          dec     STe_64C0                                 ;Decrement Memory Byte
          bra     Lbl_C6BA                                 ;Branch Always
Lbl_C68C: brclr   *BitFlags2f, #$%00010000, Lbl_C6AB       ;Branch if Bit(s) Clear
          bclr    *BitFlags2f, #$%00010000                 ;Clear Bits(s)
          ldx     #TL_TL_8A15                              ;Load Index Register X
          ldaa    CoolantTemp_fromTable_Scaled             ;Load Accumulator A
          jsr     OddBallLookup                            ;Jump to Subroutine
          clra                                             ;Clear Accumulator A
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          std     STe_64BE                                 ;Store Accumulator D
          ldaa    TL_TL_8A14 ;(0x40/64.00 Y units)         ;Load Accumulator A
          staa    STe_64BD                                 ;Store Accumulator A
          bra     Lbl_C6BA                                 ;Branch Always
Lbl_C6AB: ldaa    STe_64BD                                 ;Load Accumulator A
          beq     Lbl_C6B5                                 ;Branch if = Zero
          dec     STe_64BD                                 ;Decrement Memory Byte
          bra     Lbl_C6BA                                 ;Branch Always
Lbl_C6B5: clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          std     STe_64BE                                 ;Store Accumulator D
Lbl_C6BA: rts                                              ;Return from Subroutine
LC6BB:    ldx     #DoubleTempC                             ;Load Index Register X
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          ldab    Ram_81                                   ;Load Accumulator B
          std     DoubleTempC                              ;Store Accumulator D
          ldab    Ram_82                                   ;Load Accumulator B
          jsr     ScaleXbyB_addingA_intoD                  ;Jump to Subroutine
          std     DoubleTempC                              ;Store Accumulator D
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          ldab    Ram_0B                                   ;Load Accumulator B
          jsr     ScaleXbyB_addingA_intoD                  ;Jump to Subroutine
          std     DoubleTempC                              ;Store Accumulator D
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          ldab    Counter_O2SensorFeedbackCount_Signed     ;Load Accumulator B
          jsr     ScaleXbyB_addingA_intoD                  ;Jump to Subroutine
          std     DoubleTempC                              ;Store Accumulator D
          xgdy                                             ;Exchange D with Y
          ldaa    Ram_84                                   ;Load Accumulator A
          jsr     ScaleYbyA                                ;Jump to Subroutine
          xgdy                                             ;Exchange D with Y
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          addd    DoubleTempC                              ;Add 16-Bit to D
          std     PWMULT_Adaptive_fuel_pulsewidth_multiplier ;Store Accumulator D
          rts                                              ;Return from Subroutine
Lbl_C6F2: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_C6F2                                 ;Branch if Plus
          ldab    ADR4_A2DResults4                         ;Load Accumulator B
          stab    LastTpsVolts                             ;Store Accumulator B
          cmpb    TL_ThrottleLowerLimit ;(0x08/.16 volts)  ;Compare B to Memory
          bcs     Lbl_C70C                                 ;Branch if Lower
          cmpb    TL_ThrottleUpperLimit ;(0xF0/4.71 volts)  ;Compare B to Memory
          bcc     Lbl_C70C                                 ;Branch if Higher or Same
          brset   *b5C_IPL1_t3, #b6_D5_TpsBadSignal, Lbl_C70C ;(01000000)  ;Branch if Bit(s) Set
          stab    TpsVolts                                 ;Store Accumulator B
Lbl_C70C: ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x2F ;(00101111)                        ;Compare B to Memory
;   1509 rpm
          bcc     GREATER_THAN_1472RPM                     ;Branch if Higher or Same
          cmpb    #0x0D ;(00001101)                        ;Compare B to Memory
;   417 rpm
          bcs     GREATER_THAN_1472RPM                     ;Branch if Lower
          cmpa    TL_MapSensorUpperLimit ;(0xFD/4.96 volts)  ;Compare A to Memory
          bcc     Lbl_C727                                 ;Branch if Higher or Same
          cmpa    TL_MapSensorLowerLimit ;(0x02/.04 volts)  ;Compare A to Memory
          bcs     Lbl_C727                                 ;Branch if Lower
GREATER_THAN_1472RPM:
          brclr   *b5C_IPL1_t3, #b7_D5_MapStuck| b3_D5_MapBadSignal, GET_AVERAGE_MAP_READING ;(10001000)  ;Branch if Bit(s) Clear
Lbl_C727: jsr     SimulateMapReadingFromTps                ;Jump to Subroutine
GET_AVERAGE_MAP_READING:
          jsr     ConvertMAPVoltsToValue                   ;Jump to Subroutine
          tab                                              ;Transfer A to B
          addb    MapValue_t3                              ;Add Memory to B
          rorb                                             ;Rotate Right
          stab    MapValue                                 ;Store Accumulator B
Lbl_C734: brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_C73B ;(01000000)  ;Branch if Bit(s) Set
          jmp     Lbl_C867                                 ;Jump
Lbl_C73B: brset   *BitFlags27, #b3_27_bt3, Lbl_C749 ;(00001000)  ;Branch if Bit(s) Set
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C749                                 ;Branch if = Zero
          jsr     Interrupt_DwellTimer                     ;Jump to Subroutine
Lbl_C749: jsr     Lbl_C5CD                                 ;Jump to Subroutine
          ldx     #TL_TL_84Cb ;(0x40/64.00 Y units)        ;Load Index Register X
          ldaa    MapValue2                                ;Load Accumulator A
          cmpa    MapValue                                 ;Compare A to Memory
          bcc     Lbl_C758                                 ;Branch if Higher or Same
          ldx     #TL_MapAverageFactors2 ;(0x7E/126.00 Y units)  ;Load Index Register X
Lbl_C758: ldy     #MapValue2                               ;Load Index Register Y
          ldaa    MapValue                                 ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
          jsr     Lbl_C409                                 ;Jump to Subroutine
          brclr   *BitFlags27, #b6_27_bt6, Lbl_C772 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C772                                 ;Branch if = Zero
          jsr     DwellTimerOC4Interrupt                   ;Jump to Subroutine
Lbl_C772: brclr   *BitFlags27, #b3_27_bt3, Lbl_C780 ;(00001000)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C780                                 ;Branch if = Zero
          jsr     NullRoutine                              ;Jump to Subroutine
Lbl_C780: clra                                             ;Clear Accumulator A
          ldab    MapValue                                 ;Load Accumulator B
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          tst     TL_TL_84C3 ;(0x00/.00 Y units)           ;Test for Zero or Minus
          bmi     Lbl_C78F                                 ;Branch if Minus
          addd    TL_TL_84C3 ;(0x00/.00 Y units)           ;Add 16-Bit to D
          bra     Lbl_C797                                 ;Branch Always
Lbl_C78F: addd    TL_TL_84C3 ;(0x00/.00 Y units)           ;Add 16-Bit to D
          bgt     Lbl_C797                                 ;Branch if > Zero
          ldd     #0x0000                                  ;Load Double Accumulator D
Lbl_C797: xgdy                                             ;Exchange D with Y
          ldaa    Ram_85                                   ;Load Accumulator A
          jsr     ScaleYbyA                                ;Jump to Subroutine
          xgdy                                             ;Exchange D with Y
          asld                                             ;Arithmetic Shift Left D
          bcc     Lbl_C7A6                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_C7A6: std     DoubleTempC                              ;Store Accumulator D
          brset   *BitFlags27, #b3_27_bt3, Lbl_C7B7 ;(00001000)  ;Branch if Bit(s) Set
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C7B7                                 ;Branch if = Zero
          jsr     Interrupt_DwellTimer                     ;Jump to Subroutine
Lbl_C7B7: ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          ldab    Ram_86                                   ;Load Accumulator B
          ldx     #DoubleTempC                             ;Load Index Register X
          jsr     ScaleXbyB_addingA_intoD                  ;Jump to Subroutine
          ldx     #PWMULT_Adaptive_fuel_pulsewidth_multiplier ;Load Index Register X
          jsr     ScaleXbyB_somethingelse                  ;Jump to Subroutine
          std     DoubleTempB                              ;Store Accumulator D
          brclr   *BitFlags27, #b3_27_bt3, Lbl_C7D8 ;(00001000)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C7D8                                 ;Branch if = Zero
          jsr     NullRoutine                              ;Jump to Subroutine
Lbl_C7D8: clra                                             ;Clear Accumulator A
          ldab    Ram_B1                                   ;Load Accumulator B
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          addb    ValueFromAdaptiveMemory                  ;Add Memory to B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tst     TL_TL_84c5 ;(0xFFEB/254.92 Y units)      ;Test for Zero or Minus
          bmi     Lbl_C7F0                                 ;Branch if Minus
          addd    TL_TL_84c5 ;(0xFFEB/254.92 Y units)      ;Add 16-Bit to D
          bvc     Lbl_C7F3                                 ;Branch if Overflow Clear
          ldd     #0x7FFF                                  ;Load Double Accumulator D
          bra     Lbl_C7F3                                 ;Branch Always
Lbl_C7F0: addd    TL_TL_84c5 ;(0xFFEB/254.92 Y units)      ;Add 16-Bit to D
Lbl_C7F3: std     Ram_C0                                   ;Store Accumulator D
          ldx     #TL_TL_8418                              ;Load Index Register X
          ldaa    MapVolts                                 ;Load Accumulator A
          jsr     OddBallLookup                            ;Jump to Subroutine
          stab    Ram_C2                                   ;Store Accumulator B
          ldd     DoubleTempB                              ;Load Double Accumulator D
          addd    MAPLoadFactor                            ;Add 16-Bit to D
          bcs     Lbl_C818                                 ;Branch if Lower
          addd    Ram_A7                                   ;Add 16-Bit to D
          bcs     Lbl_C818                                 ;Branch if Lower
          addd    Ram_A4                                   ;Add 16-Bit to D
          bcs     Lbl_C818                                 ;Branch if Lower
          addd    STe_64BA                                 ;Add 16-Bit to D
          bcs     Lbl_C818                                 ;Branch if Lower
          addd    STe_64BE                                 ;Add 16-Bit to D
          bcc     Lbl_C81B                                 ;Branch if Higher or Same
Lbl_C818: ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_C81B: subd    Ram_AD                                   ;Subtract Memory from D
          bcs     Lbl_C823                                 ;Branch if Lower
          subd    Ram_AA                                   ;Subtract Memory from D
          bcc     Lbl_C826                                 ;Branch if Higher or Same
Lbl_C823: ldd     #0x0000                                  ;Load Double Accumulator D
Lbl_C826: std     DoubleTempB                              ;Store Accumulator D
          ldy     DoubleTempB                              ;Load Index Register Y
          ldaa    Ram_C2                                   ;Load Accumulator A
          jsr     ScaleYbyA                                ;Jump to Subroutine
          xgdy                                             ;Exchange D with Y
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          std     DoubleTempC                              ;Store Accumulator D
          ldd     DoubleTempB                              ;Load Double Accumulator D
          subd    DoubleTempC                              ;Subtract Memory from D
          std     DoubleTempB                              ;Store Accumulator D
          tst     Ram_C0                                   ;Test for Zero or Minus
          bpl     Lbl_C85E                                 ;Branch if Plus
          ldd     #0x0000                                  ;Load Double Accumulator D
          subd    Ram_C0                                   ;Subtract Memory from D
          cmpd    DoubleTempB                              ;Compare D to Memory 16-Bit
          bpl     Lbl_C859                                 ;Branch if Plus
          ldd     DoubleTempB                              ;Load Double Accumulator D
          addd    Ram_C0                                   ;Add 16-Bit to D
          bra     Lbl_C865                                 ;Branch Always
Lbl_C859: ldd     #0x0000                                  ;Load Double Accumulator D
          bra     Lbl_C865                                 ;Branch Always
Lbl_C85E: addd    Ram_C0                                   ;Add 16-Bit to D
          bcc     Lbl_C865                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_C865: std     Ram_73                                   ;Store Accumulator D
Lbl_C867: brset   *BitFlags27, #b3_27_bt3, Lbl_C875 ;(00001000)  ;Branch if Bit(s) Set
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C875                                 ;Branch if = Zero
          jsr     Interrupt_DwellTimer                     ;Jump to Subroutine
Lbl_C875: brclr   *BitFlags27, #b6_27_bt6, Lbl_C883 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C883                                 ;Branch if = Zero
          jsr     DwellTimerOC4Interrupt                   ;Jump to Subroutine
Lbl_C883: brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_C8D3 ;(01000000)  ;Branch if Bit(s) Set
          ldx     #TL_TL_84Cb ;(0x40/64.00 Y units)        ;Load Index Register X
          ldaa    MapValue2                                ;Load Accumulator A
          cmpa    MapValue                                 ;Compare A to Memory
          bcc     Lbl_C893                                 ;Branch if Higher or Same
          ldx     #TL_MapAverageFactors2 ;(0x7E/126.00 Y units)  ;Load Index Register X
Lbl_C893: ldy     #MapValue2                               ;Load Index Register Y
          ldaa    MapValue                                 ;Load Accumulator A
          jsr     ProcessMapOrTpsBlockData                 ;Jump to Subroutine
          brclr   *BitFlags66_t3, #b6_22_bt6, Lbl_C8AA ;(01000000)  ;Branch if Bit(s) Clear
          brclr   *Ram_30, #$%00000100, Lbl_C8AA           ;Branch if Bit(s) Clear
          clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          std     InjectorPulsewidth_HB                    ;Store Accumulator D
          bra     Lbl_C8E7                                 ;Branch Always
Lbl_C8AA: ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TL_8483 ;(0xE8/218.51 deg)            ;Compare A to Memory
          bcs     Lbl_C8CD                                 ;Branch if Lower
          ldaa    ChargeTempVolts                          ;Load Accumulator A
          cmpa    TL_TL_8484 ;(0xD0/4.08 volts)            ;Compare A to Memory
          bcs     Lbl_C8CD                                 ;Branch if Lower
          ldaa    Ram_80                                   ;Load Accumulator A
          cmpa    #0xFF ;(11111111)                        ;Compare A to Memory
          beq     Lbl_C8CD                                 ;Branch if = Zero
          inca                                             ;Increment Accumulator A
          staa    Ram_80                                   ;Store Accumulator A
          cmpa    TL_TL_8485 ;(0x00/.00 Y units)           ;Compare A to Memory
          bhi     Lbl_C8CD                                 ;Branch if Higher
          ldd     #0x0000                                  ;Load Double Accumulator D
          std     InjectorPulsewidth_HB                    ;Store Accumulator D
          bra     Lbl_C8E7                                 ;Branch Always
Lbl_C8CD: ldd     Ram_71                                   ;Load Double Accumulator D
          std     InjectorPulsewidth_HB                    ;Store Accumulator D
          bra     Lbl_C8E7                                 ;Branch Always
Lbl_C8D3: ldd     Ram_71                                   ;Load Double Accumulator D
          beq     Lbl_C8E4                                 ;Branch if = Zero
          subd    TL_TL_8481 ;(0x7D00/124.51 Y units)      ;Subtract Memory from D
          bcs     Lbl_C8E0                                 ;Branch if Lower
          std     Ram_71                                   ;Store Accumulator D
          bra     Lbl_C8E4                                 ;Branch Always
Lbl_C8E0: clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          std     Ram_71                                   ;Store Accumulator D
Lbl_C8E4: jsr     Lbl_C90A                                 ;Jump to Subroutine
Lbl_C8E7: jsr     CalculateAverageValues                   ;Jump to Subroutine
          brclr   *BitFlags27, #b6_27_bt6, Lbl_C8F8 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C8F8                                 ;Branch if = Zero
          jsr     DwellTimerOC4Interrupt                   ;Jump to Subroutine
Lbl_C8F8: brclr   *BitFlags27, #b3_27_bt3, Lbl_C906 ;(00001000)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_C906                                 ;Branch if = Zero
          jsr     NullRoutine                              ;Jump to Subroutine
Lbl_C906: jsr     AVG2_CalculateAverages2                  ;Jump to Subroutine
          rts                                              ;Return from Subroutine
Lbl_C90A: ldx     #CCDFlags5                               ;Load Index Register X
          brclr   0x00, X, #$%00100000, Lbl_C917           ;Branch if Bit(s) Clear
          ldd     #0x0000                                  ;Load Double Accumulator D
          jmp     Lbl_C9A7                                 ;Jump
Lbl_C917: brset   *BitFlags2c, #$%10000000, Lbl_C91E       ;Branch if Bit(s) Set
          jmp     Lbl_C975                                 ;Jump
Lbl_C91E: ldaa    TL_TL_866c ;(0xBF/191.00 Y units)        ;Load Accumulator A
          ldab    TargetIdleSpeedHB                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          addd    TargetIdleSpeedHB                        ;Add 16-Bit to D
          bcc     Lbl_C92B                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_C92B: staa    RpmRelated0087                           ;Store Accumulator A
          cmpd    EngineRpm_HB                             ;Compare D to Memory 16-Bit
          bcs     Lbl_C934                                 ;Branch if Lower
          bra     Lbl_C96A                                 ;Branch Always
Lbl_C934: ldx     Ram_73                                   ;Load Index Register X
          ldaa    TL_TL_866b ;(0x02/2.00 Y units)          ;Load Accumulator A
          bne     Lbl_C942                                 ;Branch if Not = Zero
          cpx     TL_TL_8669 ;(0x0400/3.98 Y units)        ;Compare X to Memory 16-Bit
          bhi     Lbl_C96A                                 ;Branch if Higher
          bra     Lbl_C975                                 ;Branch Always
Lbl_C942: cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          bne     Lbl_C951                                 ;Branch if Not = Zero
          brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_C975 ;(10000000)  ;Branch if Bit(s) Clear
          cpx     TL_TL_8669 ;(0x0400/3.98 Y units)        ;Compare X to Memory 16-Bit
          bhi     Lbl_C96A                                 ;Branch if Higher
          bra     Lbl_C975                                 ;Branch Always
Lbl_C951: cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          bne     Lbl_C960                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_C96A ;(10000000)  ;Branch if Bit(s) Set
          cpx     TL_TL_8669 ;(0x0400/3.98 Y units)        ;Compare X to Memory 16-Bit
          bhi     Lbl_C96A                                 ;Branch if Higher
          bra     Lbl_C975                                 ;Branch Always
Lbl_C960: cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
          bne     Lbl_C96A                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_C96A ;(10000000)  ;Branch if Bit(s) Set
          bra     Lbl_C975                                 ;Branch Always
Lbl_C96A: bclr    *BitFlags2c, #$%10000000                 ;Clear Bits(s)
          bset    *BitFlags2c, #$%00001000                 ;Set Bit(s)
          ldaa    TL_TL_8668 ;(0x80/128.00 Y units)        ;Load Accumulator A
          staa    CounterDn_b7_o2                          ;Store Accumulator A
Lbl_C975: ldy     TL_TL_84c7 ;(0x0180/1.49 Y units)        ;Load Index Register Y
          brclr   *BitFlags2c, #$%10000000, Lbl_C981       ;Branch if Bit(s) Clear
          clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          bra     Lbl_C992                                 ;Branch Always
Lbl_C981: ldd     Ram_73                                   ;Load Double Accumulator D
          cmpd    Ram_71                                   ;Compare D to Memory 16-Bit
          bcc     Lbl_C98A                                 ;Branch if Higher or Same
          ldd     Ram_71                                   ;Load Double Accumulator D
Lbl_C98A: cmpd    TL_TL_84c7 ;(0x0180/1.49 Y units)        ;Compare D to Memory 16-Bit
          bcc     Lbl_C992                                 ;Branch if Higher or Same
          xgdy                                             ;Exchange D with Y
Lbl_C992: ldx     #UNe_6481                                ;Load Index Register X
          brclr   0x00, X, #$%00000100, Lbl_C9A7           ;Branch if Bit(s) Clear
          ldaa    UNe_6483                                 ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          brset   0x00, X, #$%00001000, Lbl_C9A4           ;Branch if Bit(s) Set
          ldab    UNe_6484                                 ;Load Accumulator B
Lbl_C9A4: lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
Lbl_C9A7: std     InjectorPulsewidth_HB                    ;Store Accumulator D
          rts                                              ;Return from Subroutine
DRBSerialToggles:
          .byte 0x00, 0x00, 0x00, 0x20, 0x20, 0x30, 0x20, 0x00, 0x20, 0x20, 0x20, 0x00, 0x30, 0x30, 0x30, 0x30 ;1-16
          .byte 0x30, 0x20, 0x20, 0x20 ;17-20
DRBIISerialCommunications_MM:
          jsr     NULL_ROUTINE                             ;Jump to Subroutine
          jsr     BYTE_MODE_SERIAL_CODE_DOWNLOAD_ROUTINE   ;Jump to Subroutine
          ldab    DRBSerialMode                            ;Load Accumulator B
          bitb    #0xC0 ;(11000000)                        ;Bit(s) Test B with Memory
          bne     Lbl_CA29                                 ;Branch if Not = Zero
          ldaa    BAUD_SerialBaudRate                      ;Load Accumulator A
          anda    #0x37 ;(00110111)                        ;AND A with Memory
          cmpa    #0x22 ;(00100010)                        ;Compare A to Memory
          beq     Lbl_C9D9                                 ;Branch if = Zero
          ldaa    #0x22 ;(00100010)                        ;Load Accumulator A
          staa    BAUD_SerialBaudRate                      ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_C9D9: ldaa    SCSR_SerialStatus                        ;Load Accumulator A
          bita    #0x0E ;(00001110)                        ;Bit(s) Test A with Memory
          beq     DRB_NoRxError                            ;Branch if = Zero
          ldaa    SCDR_SerialData                          ;Load Accumulator A
          rts                                              ;Return from Subroutine
DRB_NoRxError:
          bita    #0x20 ;(00100000)                        ;Bit(s) Test A with Memory
          bne     DRB_ChrRxd                               ;Branch if Not = Zero
          brset   *DRBSerialMode, #b3_DB_bit3| b2_DB_bit2| b1_DB_bit1| b0_DB_bit0, DRB_Timeout ;(00001111)  ;Branch if Bit(s) Set
          incb                                             ;Increment Accumulator B
          stab    DRBSerialMode                            ;Store Accumulator B
          rts                                              ;Return from Subroutine
DRB_Timeout:
          brclr   *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2, Lbl_C9FA ;(00110000)  ;Branch if Bit(s) Clear
          bclr    *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2 ;(00110000)  ;Clear Bits(s)
          clr     DRBPointer1                              ;Clear Memory Byte
Lbl_C9FA: rts                                              ;Return from Subroutine
DRB_ChrRxd:
          ldaa    SCDR_SerialData                          ;Load Accumulator A
          staa    SCDR_SerialData                          ;Store Accumulator A
          andb    #0xF0 ;(11110000)                        ;AND B with Memory
          stab    DRBSerialMode                            ;Store Accumulator B
          bitb    #0x30 ;(00110000)                        ;Bit(s) Test B with Memory
          bne     DRB_StorePointer                         ;Branch if Not = Zero
          staa    DRBPointer1                              ;Store Accumulator A
          cmpa    #0x14 ;(00010100)                        ;Compare A to Memory
          beq     DRB_SetModeVar                           ;Branch if = Zero
          bclr    *BitFlags6d_t3, #b3_28_bt3 ;(00001000)   ;Clear Bits(s)
DRB_SetModeVar:
          clr     DRBPointer2                              ;Clear Memory Byte
          clr     DRBPointer3                              ;Clear Memory Byte
          tab                                              ;Transfer A to B
          subb    #0x10 ;(00010000)                        ;Subtract Memory from B
          cmpb    #0x14 ;(00010100)                        ;Compare B to Memory
          bcc     Lbl_CA29                                 ;Branch if Higher or Same
          ldx     #DRBSerialToggles                        ;Load Index Register X
          abx                                              ;Add B to X
          ldab    0x00, X                                  ;Load Accumulator B
          orab    DRBSerialMode                            ;OR Accumulator B (Inclusive)
          stab    DRBSerialMode                            ;Store Accumulator B
Lbl_CA29: rts                                              ;Return from Subroutine
DRB_StorePointer:
          bitb    #0x20 ;(00100000)                        ;Bit(s) Test B with Memory
          beq     DRB_SendMemLocToSCI                      ;Branch if = Zero
          jmp     Lbl_CA4C                                 ;Jump
DRB_SendMemLocToSCI:
          bitb    #0x10 ;(00010000)                        ;Bit(s) Test B with Memory
          bne     Lbl_CA38                                 ;Branch if Not = Zero
          jmp     Lbl_CA69                                 ;Jump
Lbl_CA38: staa    DRBPointer3                              ;Store Accumulator A
          andb    #0xCF ;(11001111)                        ;AND B with Memory
          stab    DRBSerialMode                            ;Store Accumulator B
          rts                                              ;Return from Subroutine
SendECUIDToSCI:
          clr     DRBPointer1                              ;Clear Memory Byte
          ldab    DRBPointer3                              ;Load Accumulator B
          ldaa    DRBPointer2                              ;Load Accumulator A
          xgdx                                             ;Exchange D with X
          ldaa    0x00, X                                  ;Load Accumulator A
Lbl_CA49: jmp     SerialOutput1a                           ;Jump
Lbl_CA4C: staa    DRBPointer2                              ;Store Accumulator A
          andb    #0xDF ;(11011111)                        ;AND B with Memory
          stab    DRBSerialMode                            ;Store Accumulator B
          ldab    DRBPointer1                              ;Load Accumulator B
          cmpd    #0x1014                                  ;Compare D to Memory 16-Bit
          bne     Lbl_CA72                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_CA69 ;(10000000)  ;Branch if Bit(s) Set
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_CA77 ;(00000001)  ;Branch if Bit(s) Set
          brclr   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_CA77 ;(00010000)  ;Branch if Bit(s) Clear
          bclr    *BitFlags68_t3, #b7_25_ATXChgGear ;(10000000)  ;Clear Bits(s)
Lbl_CA69: clr     DRBPointer1                              ;Clear Memory Byte
          clr     DRBPointer2                              ;Clear Memory Byte
          clr     DRBPointer3                              ;Clear Memory Byte
Lbl_CA72: bclr    *BitFlags6d_t3, #b3_28_bt3 ;(00001000)   ;Clear Bits(s)
          bra     Lbl_CA7A                                 ;Branch Always
Lbl_CA77: bset    *BitFlags6d_t3, #b3_28_bt3 ;(00001000)   ;Set Bit(s)
Lbl_CA7A: rts                                              ;Return from Subroutine
DRB_ResetEMR:
          clr     DRBPointer1                              ;Clear Memory Byte
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_CA97 ;(01000000)  ;Branch if Bit(s) Set
          brset   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_CA97 ;(00100000)  ;Branch if Bit(s) Set
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          ldaa    DRBPointer3                              ;Load Accumulator A
          staa    DRBOffsetStored_LB                       ;Store Accumulator A
          ldab    DRBPointer2                              ;Load Accumulator B
          stab    DRBOffsetStored_HB                       ;Store Accumulator B
          ldaa    #0xE2 ;(11100010)                        ;Load Accumulator A
          bra     Lbl_CA49                                 ;Branch Always
Lbl_CA97: clra                                             ;Clear Accumulator A
          bra     Lbl_CA49                                 ;Branch Always
DRB_UseRAMForSpecialProgramRoutine:
          ldx     #Ram_00                                  ;Load Index Register X
          bra     Lbl_CAC2                                 ;Branch Always
DRB_UseRAM2ForSpecialProgramRoutine:
          ldx     #CountdownTimerFromKeyOn                 ;Load Index Register X
          bra     Lbl_CAC2                                 ;Branch Always
DRB_CheckSpecialProgramSize:
          ldx     #DRB_ProgramModeFlag                     ;Load Index Register X
          ldaa    DRBPointer2                              ;Load Accumulator A
          bne     Lbl_CABF                                 ;Branch if Not = Zero
          ldab    DRBPointer3                              ;Load Accumulator B
          abx                                              ;Add B to X
          cpx     #0x64D0                                  ;Compare X to Memory 16-Bit
          bcs     Lbl_CABF                                 ;Branch if Lower
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
          staa    DRB_ProgramModeFlag                      ;Store Accumulator A
Lbl_CAB8: clr     DRBPointer1                              ;Clear Memory Byte
          clra                                             ;Clear Accumulator A
          jmp     SerialOutput1a                           ;Jump
Lbl_CABF: ldx     #DRB_ProgramModeFlag                     ;Load Index Register X
Lbl_CAC2: clr     DRBPointer1                              ;Clear Memory Byte
          ldab    DRBPointer2                              ;Load Accumulator B
          ldaa    DRBPointer3                              ;Load Accumulator A
          abx                                              ;Add B to X
          staa    0x00, X                                  ;Store Accumulator A
          ldaa    #0xE5 ;(11100101)                        ;Load Accumulator A
          jmp     SerialOutput1a                           ;Jump
DRB_SpecialProgramMode:
          ldx     #DRB_ProgramModeFlag                     ;Load Index Register X
          ldab    DRBPointer3                              ;Load Accumulator B
          cmpb    0x01, X                                  ;Compare B to Memory
          beq     Lbl_CADF                                 ;Branch if = Zero
          comb                                             ;1's Complement B
          cmpb    0x01, X                                  ;Compare B to Memory
          bne     DRB_OutputSpecialCodes                   ;Branch if Not = Zero
Lbl_CADF: ldab    DRBPointer2                              ;Load Accumulator B
          cmpb    0x00, X                                  ;Compare B to Memory
          bne     Lbl_CB0E                                 ;Branch if Not = Zero
          abx                                              ;Add B to X
          ldaa    0x01, X                                  ;Load Accumulator A
          cmpa    #0x39 ;(00111001)                        ;Compare A to Memory
          bne     Lbl_CAB8                                 ;Branch if Not = Zero
          ldx     #DRB_ProgramModeFlag                     ;Load Index Register X
          clra                                             ;Clear Accumulator A
Lbl_CAF0: inx                                              ;Increment Index Register X
          adda    0x01, X                                  ;Add Memory to A
          decb                                             ;Decrement Accumulator B
          bne     Lbl_CAF0                                 ;Branch if Not = Zero
          cmpa    DRBPointer3                              ;Compare A to Memory
          beq     Lbl_CB03                                 ;Branch if = Zero
          ldab    DRBPointer3                              ;Load Accumulator B
          comb                                             ;1's Complement B
          cba                                              ;Compare A to B
          bne     DRB_OutputSpecialCodes                   ;Branch if Not = Zero
          jmp     DRB_SpecialProgramRoutine                ;Jump
Lbl_CB03: com     DRBPointer3                              ;1's Complement Memory Byte
          ldaa    #0xE4 ;(11100100)                        ;Load Accumulator A
          bra     Lbl_CB3A                                 ;Branch Always
DRB_OutputSpecialCodes:
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          bra     Lbl_CB14                                 ;Branch Always
Lbl_CB0E: ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
          bra     Lbl_CB14                                 ;Branch Always
Lbl_CB12: ldaa    #0x03 ;(00000011)                        ;Load Accumulator A
Lbl_CB14: clr     DRBPointer1                              ;Clear Memory Byte
          bra     Lbl_CB3A                                 ;Branch Always
DRB_Special1:
          ldaa    DRBPointer2                              ;Load Accumulator A
          bne     Lbl_CB22                                 ;Branch if Not = Zero
          bclr    *BitFlags2a, #b0_2A_bt0 ;(00000001)      ;Clear Bits(s)
          bra     Lbl_CAB8                                 ;Branch Always
Lbl_CB22: ldaa    DRBPointer3                              ;Load Accumulator A
          bne     Lbl_CB3D                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_CB0E ;(10000000)  ;Branch if Bit(s) Set
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_CB32 ;(00000001)  ;Branch if Bit(s) Set
          brset   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_CB12 ;(00010000)  ;Branch if Bit(s) Set
Lbl_CB32: coma                                             ;1's Complement A
          staa    DRBPointer3                              ;Store Accumulator A
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          bset    *BitFlags2a, #b0_2A_bt0 ;(00000001)      ;Set Bit(s)
Lbl_CB3A: jmp     SerialOutput1a                           ;Jump
Lbl_CB3D: brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_CB49 ;(10000000)  ;Branch if Bit(s) Set
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_CB4C ;(00000001)  ;Branch if Bit(s) Set
          brclr   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_CB4C ;(00010000)  ;Branch if Bit(s) Clear
Lbl_CB49: clr     DRBPointer1                              ;Clear Memory Byte
Lbl_CB4C: rts                                              ;Return from Subroutine
DRB_Special2:
          ldaa    DRBPointer3                              ;Load Accumulator A
          beq     Lbl_CB76                                 ;Branch if = Zero
          ldaa    DRBPointer2                              ;Load Accumulator A
          cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          beq     Lbl_CB61                                 ;Branch if = Zero
          cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          beq     Lbl_CB65                                 ;Branch if = Zero
          cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
          beq     Lbl_CB69                                 ;Branch if = Zero
          bra     Lbl_CB49                                 ;Branch Always
Lbl_CB61: ldd     EngineRpm_HB                             ;Load Double Accumulator D
          bra     Lbl_CB6B                                 ;Branch Always
Lbl_CB65: ldd     InjectorPulsewidth_HB                    ;Load Double Accumulator D
          bra     Lbl_CB6B                                 ;Branch Always
Lbl_CB69: ldd     TargetIdleSpeedHB                        ;Load Double Accumulator D
Lbl_CB6B: stab    Temp0                                    ;Store Accumulator B
          jsr     SerialOutput1a                           ;Jump to Subroutine
          ldaa    Temp0                                    ;Load Accumulator A
          bra     Lbl_CB3A                                 ;Branch Always
Lbl_CB76: coma                                             ;1's Complement A
          staa    DRBPointer3                              ;Store Accumulator A
          rts                                              ;Return from Subroutine
DRB_ClearAdaptiveMemory:
          clr     DRBPointer1                              ;Clear Memory Byte
          ldab    TimerOverflowsBetweenCamPulses           ;Load Accumulator B
          cmpb    #0x50 ;(01010000)                        ;Compare B to Memory
          bls     Lbl_CB85                                 ;Branch if Lower or Same
          bra     Lbl_CB89                                 ;Branch Always
Lbl_CB85: clra                                             ;Clear Accumulator A
          jmp     SerialOutput1a                           ;Jump
Lbl_CB89: ldaa    DRBPointer2                              ;Load Accumulator A
          cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          beq     Lbl_CBA0                                 ;Branch if = Zero
          cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          beq     DRB_ClearAdaptives                       ;Branch if = Zero
          cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
          beq     Lbl_CBB9                                 ;Branch if = Zero
          cmpa    #0x04 ;(00000100)                        ;Compare A to Memory
          beq     Lbl_CBC5                                 ;Branch if = Zero
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          jmp     SerialOutput1a                           ;Jump
Lbl_CBA0: brclr   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_CBA9 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
          jmp     SerialOutput1a                           ;Jump
Lbl_CBA9: jsr     DRB_ClearErrorCodes                      ;Jump to Subroutine
Lbl_CBAC: ldaa    #0xF0 ;(11110000)                        ;Load Accumulator A
          jmp     SerialOutput1a                           ;Jump
DRB_ClearAdaptives:
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          staa    ValueFromAdaptiveMemory                  ;Store Accumulator A
          staa    Ram_0B                                   ;Store Accumulator A
          bra     Lbl_CBAC                                 ;Branch Always
Lbl_CBB9: sei                                              ;Set Mask Disable Int
          bset    *BitFlags36_t3, #b6_7_UseAIS ;(01000000)  ;Set Bit(s)
          ldaa    #0xDF ;(11011111)                        ;Load Accumulator A
          staa    CurrentAisPosition                       ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          jmp     Lbl_CBAC                                 ;Jump
Lbl_CBC5: ldaa    TL_ValueOf_MINTHR_WhenBatteryDisconnected ;(0x39/1.12 volts)  ;Load Accumulator A
          staa    LowestSessionTpsVolts                    ;Store Accumulator A
          bra     Lbl_CBAC                                 ;Branch Always
DRB_ClearErrorCodes:
          clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          std     ErrorBitRegister0                        ;Store Accumulator D
          std     ErrorBitRegister2                        ;Store Accumulator D
          std     ErrorBitRegisterStored0                  ;Store Accumulator D
          std     ErrorBitRegisterStored2                  ;Store Accumulator D
          std     ErrorCodeUpdateKeyOnCount                ;Store Accumulator D
          staa    ErrorCodeUpdateKeyOnCount3               ;Store Accumulator A
          std     b5C_IPL1_t3                              ;Store Accumulator D
          staa    b5d_IPL2                                 ;Store Accumulator A
          staa    UNe_64B9                                 ;Store Accumulator A
          jsr     ErrorCodeResetEeprom                     ;Jump to Subroutine
          rts                                              ;Return from Subroutine
DRBFunctionTable:
          .word OutputErrorCodes
          .word OutputErrorBits
          .word SetupHiSpeedDataTransfer
          .word SetupATM
          .word DRB_Return
          .word SendECUIDToSCI
          .word SendConstValues
          .word ClearErrorCodes
          .word DRB_Return
          .word DRB_Return
          .word DRB_Return
          .word InitByteModeDownload
          .word DRB_ResetEMR
          .word DRB_UseRAMForSpecialProgramRoutine
          .word DRB_UseRAM2ForSpecialProgramRoutine
          .word DRB_CheckSpecialProgramSize
DRBTable: .word DRB_SpecialProgramMode
          .word DRB_Special1
          .word DRB_Special2
          .word DRB_ClearAdaptiveMemory
DRBIIOuput_MM:
          ldaa    DRBSerialMode                            ;Load Accumulator A
          bita    #0x30 ;(00110000)                        ;Bit(s) Test A with Memory
          beq     Lbl_CC14                                 ;Branch if = Zero
          rts                                              ;Return from Subroutine
Lbl_CC14: ldaa    DRBPointer1                              ;Load Accumulator A
          beq     Lbl_CC37                                 ;Branch if = Zero
          cmpa    #0x0A ;(00001010)                        ;Compare A to Memory
          beq     Lbl_CC37                                 ;Branch if = Zero
          tab                                              ;Transfer A to B
          ldx     #DRBFunctionTable                        ;Load Index Register X
          subb    #0x10 ;(00010000)                        ;Subtract Memory from B
          bcs     ClearTestTypesAndPtr1                    ;Branch if Lower
          lslb                                             ;Logical Shift Left B
          cmpb    #0x28 ;(00101000)                        ;Compare B to Memory
          bcc     ClearTestTypesAndPtr1                    ;Branch if Higher or Same
          abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          jmp     0x00, X                                  ;Jump
ClearTestTypesAndPtr1:
          bclr    *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2 ;(00110000)  ;Clear Bits(s)
          clra                                             ;Clear Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          jmp     SerialOutput1a                           ;Jump
Lbl_CC37: rts                                              ;Return from Subroutine
ClearErrorCodes:
          clra                                             ;Clear Accumulator A
          ldab    TimerOverflowsBetweenCamPulses           ;Load Accumulator B
          cmpb    #0x50 ;(01010000)                        ;Compare B to Memory
          bhi     Lbl_CC47                                 ;Branch if Higher
          staa    DRBPointer1                              ;Store Accumulator A
          bclr    *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2 ;(00110000)  ;Clear Bits(s)
          jmp     SerialOutput1a                           ;Jump
Lbl_CC47: ldab    DRBSerialMode                            ;Load Accumulator B
          andb    #0x0F ;(00001111)                        ;AND B with Memory
          cmpb    #0x03 ;(00000011)                        ;Compare B to Memory
          bls     Lbl_CC52                                 ;Branch if Lower or Same
          clr     BitFlags65_t3                            ;Clear Memory Byte
Lbl_CC52: ldaa    BitFlags65_t3                            ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          cmpa    #0x18 ;(00011000)                        ;Compare A to Memory
          bls     Lbl_CC6C                                 ;Branch if Lower or Same
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_CC6F ;(01000000)  ;Branch if Bit(s) Set
          clra                                             ;Clear Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          staa    BitFlags65_t3                            ;Store Accumulator A
          jsr     DRB_ClearErrorCodes                      ;Jump to Subroutine
          ldaa    #0xE0 ;(11100000)                        ;Load Accumulator A
          jmp     SerialOutput1a                           ;Jump
Lbl_CC6C: staa    BitFlags65_t3                            ;Store Accumulator A
Lbl_CC6F: ldd     #0xFF00                                  ;Load Double Accumulator D
          stab    DRBPointer1                              ;Store Accumulator B
          bra     SerialOutput1a                           ;Branch Always
SetupATM: ldab    TimerOverflowsBetweenCamPulses           ;Load Accumulator B
          cmpb    #0x50 ;(01010000)                        ;Compare B to Memory
          bls     Lbl_CCA8                                 ;Branch if Lower or Same
          ldaa    DRBPointer2                              ;Load Accumulator A
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_CCA8                                 ;Branch if Lower
          cmpa    #0x4E ;(01001110)                        ;Compare A to Memory
          bhi     Lbl_CCA8                                 ;Branch if Higher
          ldx     #ATMFunctionTable                        ;Load Index Register X
          ldab    DRBPointer2                              ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          abx                                              ;Add B to X
          ldd     0x00, X                                  ;Load Double Accumulator D
          cmpd    #0xD031                                  ;Compare D to Memory 16-Bit
          beq     Lbl_CCA8                                 ;Branch if = Zero
          ldaa    DRBPointer2                              ;Load Accumulator A
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_CCA0 ;(00000001)  ;Branch if Bit(s) Set
          cmpa    #0x17 ;(00010111)                        ;Compare A to Memory
          beq     Lbl_CCA8                                 ;Branch if = Zero
          bra     Lbl_CCAD                                 ;Branch Always
Lbl_CCA0: cmpa    #0x0F ;(00001111)                        ;Compare A to Memory
          beq     Lbl_CCA8                                 ;Branch if = Zero
          cmpa    #0x16 ;(00010110)                        ;Compare A to Memory
          bne     Lbl_CCAD                                 ;Branch if Not = Zero
Lbl_CCA8: clra                                             ;Clear Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          staa    DRBPointer2                              ;Store Accumulator A
Lbl_CCAD: cmpa    ATMOffset                                ;Compare A to Memory
          beq     SerialOutput1a                           ;Branch if = Zero
          staa    ATMOffset                                ;Store Accumulator A
          ldab    #0x02 ;(00000010)                        ;Load Accumulator B
          stab    KeyOnOrEngineRunningTime                 ;Store Accumulator B
;   set eng run time to 5.6 sec
SerialOutput1a:
          ldab    SCSR_SerialStatus                        ;Load Accumulator B
          bpl     SerialOutput1a                           ;Branch if Plus
          staa    SCDR_SerialData                          ;Store Accumulator A
          rts                                              ;Return from Subroutine
OutputErrorCodes:
          ldx     #ErrorBitRegister0                       ;Load Index Register X
          ldab    DRBPointer2                              ;Load Accumulator B
          cmpb    #0x07 ;(00000111)                        ;Compare B to Memory
          bhi     Lbl_CCD6                                 ;Branch if Higher
          negb                                             ;2's Complement B
          addb    #0x07 ;(00000111)                        ;Add Memory to B
          abx                                              ;Add B to X
          inc     DRBPointer2                              ;Increment Memory Byte
          ldaa    0x00, X                                  ;Load Accumulator A
          beq     Lbl_CCD6                                 ;Branch if = Zero
          bra     SerialOutput1a                           ;Branch Always
Lbl_CCD6: clr     DRBPointer1                              ;Clear Memory Byte
          ldaa    #0xFE ;(11111110)                        ;Load Accumulator A
          bsr     SerialOutput1a                           ;Branch to Subroutine
          adda    #0x10 ;(00010000)                        ;Add Memory to A
          ldx     #CruiseControlVarT1                      ;Load Index Register X
Lbl_CCE2: inx                                              ;Increment Index Register X
          cpx     #0x001D                                  ;Compare X to Memory 16-Bit
          bcc     SerialOutput1a                           ;Branch if Higher or Same
          adda    0x00, X                                  ;Add Memory to A
          bra     Lbl_CCE2                                 ;Branch Always
OutputErrorBits:
          ldaa    ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB ;Load Accumulator A
          brclr   *DRBPointer2, #$%11111111, Lbl_CCF7      ;Branch if Bit(s) Clear
          ldaa    ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB ;Load Accumulator A
          clr     DRBPointer1                              ;Clear Memory Byte
Lbl_CCF7: inc     DRBPointer2                              ;Increment Memory Byte
          bra     SerialOutput1a                           ;Branch Always
SetupHiSpeedDataTransfer:
          bset    *DRBSerialMode, #b7_DB_FastSerial ;(10000000)  ;Set Bit(s)
          clr     DRBPointer1                              ;Clear Memory Byte
Lbl_CD02: ldaa    SCSR_SerialStatus                        ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_CD02                                 ;Branch if = Zero
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          staa    BAUD_SerialBaudRate                      ;Store Accumulator A
DRB_Return:
          rts                                              ;Return from Subroutine
InitByteModeDownload:
          bset    *DRBSerialMode, #b6_DB_ByteMode ;(01000000)  ;Set Bit(s)
          clr     DRBPointer1                              ;Clear Memory Byte
          rts                                              ;Return from Subroutine
SendConstValues:
          ldaa    DRBPointer2                              ;Load Accumulator A
          cmpa    #0x80 ;(10000000)                        ;Compare A to Memory
          beq     Lbl_CD28                                 ;Branch if = Zero
          cmpa    #0x81 ;(10000001)                        ;Compare A to Memory
          beq     Lbl_CD53                                 ;Branch if = Zero
          cmpa    #0x82 ;(10000010)                        ;Compare A to Memory
          beq     Lbl_CD58                                 ;Branch if = Zero
          clr     DRBPointer1                              ;Clear Memory Byte
          rts                                              ;Return from Subroutine
;   load either the beginning of the first or second cal id
;   if drbpointer3 = 0x04 then a = 8002-8005 +0x16 +drbpointer2(0x80)
;   or a = 8007-800a +0x16 +drbpointer2(0x80)
;   or a = 800d-8010 +0x16 +drbpointer2(0x81)
;   if drbpointer3 <> 0x04 then inc drbpointer3 and
;   a = 8002/8007/800d +drbpointer3
;   other locations 8006/800b
;   and then send a to sci_out
Lbl_CD28: ldx     #TL_PARTNO1 ;(0x56/86.00 Y units)        ;Load Index Register X
          brclr   *BitFlags6a_t3, #b1_26_bt1, Lbl_CD32 ;(00000010)  ;Branch if Bit(s) Clear
          ldx     #TL_PARTNO1A ;(0x56/86.00 Y units)       ;Load Index Register X
Lbl_CD32: ldab    DRBPointer3                              ;Load Accumulator B
          cmpb    #0x04 ;(00000100)                        ;Compare B to Memory
          beq     Lbl_CD41                                 ;Branch if = Zero
          inc     DRBPointer3                              ;Increment Memory Byte
          abx                                              ;Add B to X
          ldaa    0x00, X                                  ;Load Accumulator A
          jmp     SerialOutput1a                           ;Jump
Lbl_CD41: ldaa    0x00, X                                  ;Load Accumulator A
          adda    0x01, X                                  ;Add Memory to A
          adda    0x02, X                                  ;Add Memory to A
          adda    0x03, X                                  ;Add Memory to A
Lbl_CD49: adda    #0x16 ;(00010110)                        ;Add Memory to A
          adda    DRBPointer2                              ;Add Memory to A
          clr     DRBPointer1                              ;Clear Memory Byte
Lbl_CD50: jmp     SerialOutput1a                           ;Jump
Lbl_CD53: ldx     #TL_CODE1 ;(0x8E/142.00 Y units)         ;Load Index Register X
          bra     Lbl_CD32                                 ;Branch Always
Lbl_CD58: inc     DRBPointer3                              ;Increment Memory Byte
          ldaa    TL_PARTNO5 ;(0xA1/161.00 Y units)        ;Load Accumulator A
          brclr   *BitFlags6a_t3, #b1_26_bt1, Lbl_CD65 ;(00000010)  ;Branch if Bit(s) Clear
          ldaa    TL_PARTNO5A ;(0xA1/161.00 Y units)       ;Load Accumulator A
Lbl_CD65: ldab    DRBPointer3                              ;Load Accumulator B
          cmpb    #0x01 ;(00000001)                        ;Compare B to Memory
          beq     Lbl_CD50                                 ;Branch if = Zero
          cmpb    #0x05 ;(00000101)                        ;Compare B to Memory
          bcc     Lbl_CD49                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
ATMFunctionTable:
          bra     Lbl_CD50                                 ;Branch Always
Wrd_CD72: .word ATM_IgnitionCoil1
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_InjBank4
          .word ATM_InjBank3
          .word ATM_InjBank2
          .word ATM_AISMotorOpenClose
          .word ATM_FanRelay
          .word ATM_ACClutchRelay
          .word ATM_ASDRelay
          .word ATM_PurgeSolenoid
          .word ATM_SCServoSolenoid
          .word ATM_Tachometer
          .word ATM_PTUIndicator
          .word ATM_EGRSolenoid
          .word Lce9f
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_AllSolenoidsRelays
          .word Lce93
          .word Lced4
          .word ATM_EGRSolenoid
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_BaroReadSolenoid
          .word ATM_InjBank1
          .word Lcfb2
          .word Lcfa2
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
          .word ATM_SerialOut
Mis_CDBE: .byte 0xCE ;1-1
Byt_DRBMemoryTable:
          .byte 0x74 ;(AmbientAirTempVolts)     1-1
          .byte 0xFF ;(Timer_MinimumFanRun)     2-2
          .byte 0x53 ;(O2SensorVolts)     3-3
          .byte 0xFF ;(Timer_MinimumFanRun)     4-4
          .byte 0xFF ;(Timer_MinimumFanRun)     5-5
          .byte 0x54 ;(CoolantTemp)     6-6
          .byte 0x59 ;(LastCoolantTempVolts)     7-7
          .byte 0x5A ;(LastTpsVolts)     8-8
          .byte 0x06 ;(LowestSessionTpsVolts)     9-9
          .byte 0xFF ;(Timer_MinimumFanRun)     10-10
          .byte 0x5B ;(BatteryVolts)     11-11
          .byte 0x50 ;(MapValue)     12-12
          .byte 0x08 ;(CurrentAisPosition)     13-13
          .byte 0x0A ;(ValueFromAdaptiveMemory)     14-14
          .byte 0x0B ;(Ram_0B)     15-15
          .byte 0x0D ;(BaroPressure)     16-16
          .byte 0x46 ;(EngineRpm_HB)     17-17
          .byte 0x46 ;(EngineRpm_HB)     18-18
          .byte 0xFF ;(Timer_MinimumFanRun)     19-19
          .byte 0x1D ;(ErrorCodeUpdateKeyOnCount)     20-20
          .byte 0xFF ;(Timer_MinimumFanRun)     21-21
          .byte 0x4E ;(CalculatedSparkAdvance)     22-22
          .byte 0xFF ;(Timer_MinimumFanRun)     23-23
          .byte 0xFF ;(Timer_MinimumFanRun)     24-24
          .byte 0xFF ;(Timer_MinimumFanRun)     25-25
          .byte 0xFF ;(Timer_MinimumFanRun)     26-26
          .byte 0xFF ;(Timer_MinimumFanRun)     27-27
          .byte 0x52 ;(ChargeTempVolts)     28-28
          .byte 0x58 ;(LastChargeTempVolts)     29-29
          .byte 0xC4 ;(CruiseSpeedSetpoint)     30-30
          .byte 0x1E ;(ErrorCodeUpdateKeyOnCount2)     31-31
          .byte 0x1F ;(ErrorCodeUpdateKeyOnCount3)     32-32
          .byte 0x33 ;(Counter_Cruise_1)     33-33
          .byte 0xFF ;(Timer_MinimumFanRun)     34-34
          .byte 0x4B ;(Ram_4B)     35-35
          .byte 0x65 ;(BodyComputerBatteryVoltsOutput)     36-36
          .byte 0x64 ;(TargetBatteryVolts)     37-37
          .byte 0xFF ;(Timer_MinimumFanRun)     38-38
          .byte 0xFF ;(Timer_MinimumFanRun)     39-39
          .byte 0xE1 ;(CCDFlags5)     40-40
          .byte 0xFF ;(Timer_MinimumFanRun)     41-41
          .byte 0xFF ;(Timer_MinimumFanRun)     42-42
          .byte 0xFF ;(Timer_MinimumFanRun)     43-43
          .byte 0xFF ;(Timer_MinimumFanRun)     44-44
          .byte 0xFF ;(Timer_MinimumFanRun)     45-45
          .byte 0x67 ;(AmbientAirTempVolts2)     46-46
RealTimeDataTable:
          .word SCI_MAPVolts
          .word SCI_Speed
          .word SCI_O2Volts
          .word SCI_Ld0c7
          .word SCI_Ld0ca
          .word SendBaro
          .word SendTPS
Imm_CDFB: .word SCI_Ld0ef
          .word SCI_LD07B
          .word SCI_Ld08c
          .word SCI_Ld090
          .word SCI_Ld096
ActuatorTestMode_MM:
          ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          cmpa    #0x50 ;(01010000)                        ;Compare A to Memory
          bhi     Lbl_CE0E                                 ;Branch if Higher
          clr     ATMOffset                                ;Clear Memory Byte
Lbl_CE0E: ldab    ATMOffset                                ;Load Accumulator B
          bne     Lbl_CE15                                 ;Branch if Not = Zero
          jmp     ATM_SerialOut                            ;Jump
Lbl_CE15: ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    #0x96 ;(10010110)                        ;Compare A to Memory
;   423.5 sec
          bcs     Lbl_CE2C                                 ;Branch if Lower
          clrb                                             ;Clear Accumulator B
          ldaa    DRBPointer1                              ;Load Accumulator A
          cmpa    #0x13 ;(00010011)                        ;Compare A to Memory
          bne     Lbl_CE26                                 ;Branch if Not = Zero
          stab    DRBPointer1                              ;Store Accumulator B
          stab    DRBPointer2                              ;Store Accumulator B
Lbl_CE26: clr     ATMOffset                                ;Clear Memory Byte
          jmp     ATM_SerialOut                            ;Jump
Lbl_CE2C: ldx     #ATMFunctionTable                        ;Load Index Register X
          lslb                                             ;Logical Shift Left B
          abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          jmp     0x00, X                                  ;Jump
ATM_SCServoSolenoid:
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0xC0 ;(11000000)                        ;OR Accumulator A (Inclusive)
          ldab    Counter_MainLoop                         ;Load Accumulator B
          cmpb    #0x55 ;(01010101)                        ;Compare B to Memory
          bcs     ATM_SetOutputBits                        ;Branch if Lower
          anda    #0x3F ;(00111111)                        ;AND A with Memory
          cmpb    #0xAA ;(10101010)                        ;Compare B to Memory
          bcs     ATM_SetOutputBits                        ;Branch if Lower
          oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          bra     ATM_SetOutputBits                        ;Branch Always
ATM_PurgeSolenoid:
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0x20 ;(00100000)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, ATM_SetOutputBits ;Branch if Bit(s) Set
          anda    #0xDF ;(11011111)                        ;AND A with Memory
          bra     ATM_SetOutputBits                        ;Branch Always
ATM_ASDRelay:
          ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          anda    #0xFE ;(11111110)                        ;AND A with Memory
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   set oc2 oc3 oc4 clr oc5
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, ATM_SetOutputBits ;Branch if Bit(s) Set
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          bra     ATM_SetOutputBits                        ;Branch Always
ATM_BaroReadSolenoid:
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          bra     ATM_SetOutputBits                        ;Branch Always
Lce74:    brset   *BitFlags27, #b3_27_bt3, Lce84 ;(00001000)  ;Branch if Bit(s) Set
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0x08 ;(00001000)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, ATM_SetOutputBits ;Branch if Bit(s) Set
          anda    #0xF7 ;(11110111)                        ;AND A with Memory
          bra     ATM_SetOutputBits                        ;Branch Always
Lce84:    ldaa    PIA1_Buffer_t3                           ;Load Accumulator A
          oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, Lbl_CE8E ;Branch if Bit(s) Set
          anda    #0x7F ;(01111111)                        ;AND A with Memory
Lbl_CE8E: staa    PIA1_Buffer_t3                           ;Store Accumulator A
          jmp     ATM_SerialOut                            ;Jump
Lce93:    ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0x04 ;(00000100)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, ATM_SetOutputBits ;Branch if Bit(s) Set
          anda    #0xFB ;(11111011)                        ;AND A with Memory
          bra     ATM_SetOutputBits                        ;Branch Always
Lce9f:    ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0x02 ;(00000010)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, ATM_SetOutputBits ;Branch if Bit(s) Set
          anda    #0xFD ;(11111101)                        ;AND A with Memory
          bra     ATM_SetOutputBits                        ;Branch Always
ATM_ACClutchRelay:
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, ATM_SetOutputBits ;Branch if Bit(s) Set
          anda    #0xFE ;(11111110)                        ;AND A with Memory
ATM_SetOutputBits:
          staa    PIA2_Buffer_t3                           ;Store Accumulator A
          jmp     ATM_SerialOut                            ;Jump
ATM_FanRelay:
          ldaa    PIA1_Buffer_t3                           ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          ldab    Counter_MainLoop                         ;Load Accumulator B
          andb    #0x78 ;(01111000)                        ;AND B with Memory
          beq     Lbl_CEDE                                 ;Branch if = Zero
          oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          bra     Lbl_CEDE                                 ;Branch Always
ATM_EGRSolenoid:
          ldaa    PIA1_Buffer_t3                           ;Load Accumulator A
          oraa    #0x20 ;(00100000)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, Lbl_CEDE ;Branch if Bit(s) Set
          anda    #0xDF ;(11011111)                        ;AND A with Memory
          bra     Lbl_CEDE                                 ;Branch Always
Lced4:    ldaa    PIA1_Buffer_t3                           ;Load Accumulator A
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          brset   *Counter_MainLoop, #$%10000000, Lbl_CEDE ;Branch if Bit(s) Set
          anda    #0xEF ;(11101111)                        ;AND A with Memory
Lbl_CEDE: staa    PIA1_Buffer_t3                           ;Store Accumulator A
          jmp     ATM_SerialOut                            ;Jump
ATM_AISMotorOpenClose:
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          brset   *Counter_MainLoop, #$%10000000, Lbl_CEEB ;Branch if Bit(s) Set
          ldaa    #0x70 ;(01110000)                        ;Load Accumulator A
Lbl_CEEB: staa    DesiredNewAisPosition                    ;Store Accumulator A
          jmp     ATM_SerialOut                            ;Jump
ATM_AllSolenoidsRelays:
          ldd     PIA1_Buffer_t3                           ;Load Double Accumulator D
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_CEFA ;(00000001)  ;Branch if Bit(s) Set
          oraa    #0x20 ;(00100000)                        ;OR Accumulator A (Inclusive)
Lbl_CEFA: brset   *BitFlags27, #b3_27_bt3, Lbl_CF02 ;(00001000)  ;Branch if Bit(s) Set
          orab    #0xEB ;(11101011)                        ;OR Accumulator B (Inclusive)
          bra     Lbl_CF06                                 ;Branch Always
Lbl_CF02: oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          orab    #0xE3 ;(11100011)                        ;OR Accumulator B (Inclusive)
Lbl_CF06: brset   *BitFlags2d, #b4_2D_a71b5, Lbl_CF0C ;(00010000)  ;Branch if Bit(s) Set
          orab    #0x10 ;(00010000)                        ;OR Accumulator B (Inclusive)
Lbl_CF0C: brset   *Counter_MainLoop, #$%10000000, Lbl_CF2A ;Branch if Bit(s) Set
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_CF18 ;(00000001)  ;Branch if Bit(s) Set
          anda    #0xDF ;(11011111)                        ;AND A with Memory
Lbl_CF18: brset   *BitFlags27, #b3_27_bt3, Lbl_CF20 ;(00001000)  ;Branch if Bit(s) Set
          andb    #0x14 ;(00010100)                        ;AND B with Memory
          bra     Lbl_CF24                                 ;Branch Always
Lbl_CF20: anda    #0x7F ;(01111111)                        ;AND A with Memory
          andb    #0x1C ;(00011100)                        ;AND B with Memory
Lbl_CF24: brset   *BitFlags2d, #b4_2D_a71b5, Lbl_CF2A ;(00010000)  ;Branch if Bit(s) Set
          andb    #0xEF ;(11101111)                        ;AND B with Memory
Lbl_CF2A: std     PIA1_Buffer_t3                           ;Store Accumulator D
          bra     ATM_AISMotorOpenClose                    ;Branch Always
ATM_Tachometer:
          bclr    *PIA2_Buffer_t3, #b4_CE_ASD ;(00010000)  ;Clear Bits(s)
          ldx     #SwitchPortAccessReg1                    ;Load Index Register X
          sei                                              ;Set Mask Disable Int
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          anda    #0xFB ;(11111011)                        ;AND A with Memory
          brset   *Counter_MainLoop, #$%10000000, Lbl_CF40 ;Branch if Bit(s) Set
          oraa    #0x04 ;(00000100)                        ;OR Accumulator A (Inclusive)
Lbl_CF40: staa    SwitchPortAccessReg1                     ;Store Accumulator A
          bset    0x02, X, #$%00000100                     ;Set Bit(s)
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
Lbl_CF48: deca                                             ;Decrement Accumulator A
          bne     Lbl_CF48                                 ;Branch if Not = Zero
          bclr    0x02, X, #$%00000100                     ;Clear Bits(s)
          cli                                              ;Clear Mask Enable Int
          jmp     ATM_SerialOut                            ;Jump
ATM_IgnitionCoil1:
          bclr    *PIA2_Buffer_t3, #b4_CE_ASD ;(00010000)  ;Clear Bits(s)
          ldab    Counter_MainLoop                         ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          beq     Lbl_CF5D                                 ;Branch if = Zero
          jmp     ATM_SerialOut                            ;Jump
Lbl_CF5D: sei                                              ;Set Mask Disable Int
          ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          oraa    #0x03 ;(00000011)                        ;OR Accumulator A (Inclusive)
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   set oc5
          ldab    #0x08 ;(00001000)                        ;Load Accumulator B
          stab    CFORC_TimerForceCompare                  ;Store Accumulator B
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    #0x06D6                                  ;Add 16-Bit to D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          anda    #0xFE ;(11111110)                        ;AND A with Memory
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   set oc2 oc3 oc4 clr oc5
          cli                                              ;Clear Mask Enable Int
          jmp     ATM_SerialOut                            ;Jump
AtmToggleOC2:
          .byte 0x40 ;1-1
AtmToggleOC2_ForceCompare:
          .byte 0x40 ;1-1
AtmClrOC2SetOC3SetOC4SetOC5:
          .byte 0xBF ;1-1
AtmToggleOC3:
          .byte 0x10 ;1-1
AtmToggleOC3_ForceCompare:
          .byte 0x20 ;1-1
AtmSetOC2ClrOC3SetOC4SetOC5:
          .byte 0xEF ;1-1
AtmToggleOC4:
          .byte 0x04 ;1-1
AtmToggleOC4_ForceCompare:
          .byte 0x10 ;1-1
AtmSetOC2SetOC3ClrOC4SetOC5:
          .byte 0xFB, 0x12, 0x27, 0x10, 0x03, 0x7E, 0xD0, 0x31 ;1-8
Lcf90:    ldx     #TOC4_Counter_OC4                        ;Load Index Register X
          ldy     #AtmToggleOC4                            ;Load Index Register Y
          bra     ATM_IgnitionCoil2                        ;Branch Always
Lcf99:    brset   *BitFlags27, #b4_27_bt4, Lbl_CFA0 ;(00010000)  ;Branch if Bit(s) Set
          jmp     ATM_SerialOut                            ;Jump
Lbl_CFA0: bra     Lbl_CFA9                                 ;Branch Always
Lcfa2:    brset   *BitFlags27, #b6_27_bt6, Lbl_CFA9 ;(01000000)  ;Branch if Bit(s) Set
          jmp     ATM_SerialOut                            ;Jump
Lbl_CFA9: ldx     #TOC3_Counter_OC3                        ;Load Index Register X
          ldy     #AtmToggleOC3                            ;Load Index Register Y
          bra     ATM_IgnitionCoil2                        ;Branch Always
Lcfb2:    brset   *BitFlags27, #b6_27_bt6, Lbl_CFB9 ;(01000000)  ;Branch if Bit(s) Set
          jmp     ATM_SerialOut                            ;Jump
Lbl_CFB9: ldx     #TOC2_Counter_OC2                        ;Load Index Register X
          ldy     #AtmToggleOC2                            ;Load Index Register Y
ATM_IgnitionCoil2:
          bclr    *PIA2_Buffer_t3, #b4_CE_ASD ;(00010000)  ;Clear Bits(s)
          ldab    Counter_MainLoop                         ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          beq     Lbl_CFCB                                 ;Branch if = Zero
          jmp     ATM_SerialOut                            ;Jump
Lbl_CFCB: sei                                              ;Set Mask Disable Int
          ldd     0x00, Y                                  ;Load Double Accumulator D
          oraa    TCTL1_TimerControlReg1                   ;OR Accumulator A (Inclusive)
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   add OC info
          stab    CFORC_TimerForceCompare                  ;Store Accumulator B
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    #0x01A9                                  ;Add 16-Bit to D
          std     0x00, X                                  ;Store Accumulator D
          ldaa    0x02, Y                                  ;Load Accumulator A
          anda    TCTL1_TimerControlReg1                   ;AND A with Memory
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   add OC info
          cli                                              ;Clear Mask Enable Int
          jmp     ATM_SerialOut                            ;Jump
ATM_InjBank1:
          ldx     #InjectorPulsewidth_HB_Cyl1              ;Load Index Register X
          bra     Lbl_CFFF                                 ;Branch Always
ATM_InjBank2:
          ldx     #InjectorPulsewidth_HB_Cyl2              ;Load Index Register X
          bra     Lbl_CFFF                                 ;Branch Always
ATM_InjBank3:
          ldx     #InjectorPulsewidth_HB_Cyl3              ;Load Index Register X
          bra     Lbl_CFFF                                 ;Branch Always
ATM_InjBank4:
          ldx     #InjectorPulsewidth_HB_Cyl4              ;Load Index Register X
Lbl_CFFF: bclr    *PIA2_Buffer_t3, #b4_CE_ASD ;(00010000)  ;Clear Bits(s)
          ldab    Counter_MainLoop                         ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          bne     ATM_SerialOut                            ;Branch if Not = Zero
          sei                                              ;Set Mask Disable Int
          ldaa    PIA_Ctrl_2                               ;Load Accumulator A
          bita    #0xF0 ;(11110000)                        ;Bit(s) Test A with Memory
          beq     Lbl_D014                                 ;Branch if = Zero
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          staa    PIA_Ctrl_2                               ;Store Accumulator A
Lbl_D014: ldaa    #0xF8 ;(11111000)                        ;Load Accumulator A
          cmpa    PIA_Ctrl_5                               ;Compare A to Memory
          beq     Lbl_D01E                                 ;Branch if = Zero
          staa    PIA_Ctrl_5                               ;Store Accumulator A
Lbl_D01E: ldd     #0x01A9                                  ;Load Double Accumulator D
          std     0x00, X                                  ;Store Accumulator D
          cli                                              ;Clear Mask Enable Int
          bra     ATM_SerialOut                            ;Branch Always
ATM_PTUIndicator:
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          eora    #0x02 ;(00000010)                        ;Exclusive OR A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          bra     ATM_SerialOut                            ;Branch Always
ATM_SerialOut:
          ldaa    DRBPointer1                              ;Load Accumulator A
          cmpa    #0x14 ;(00010100)                        ;Compare A to Memory
          beq     Lbl_D03C                                 ;Branch if = Zero
          cmpa    #0x1A ;(00011010)                        ;Compare A to Memory
          beq     Lbl_D06B                                 ;Branch if = Zero
Sci_return:
          rts                                              ;Return from Subroutine
Lbl_D03C: ldab    DRBPointer2                              ;Load Accumulator B
          cmpb    #0x40 ;(01000000)                        ;Compare B to Memory
          bcc     Lbl_D05A                                 ;Branch if Higher or Same
          cmpb    #0x00 ;(00000000)                        ;Compare B to Memory
          beq     Sci_return                               ;Branch if = Zero
          cmpb    #0x2D ;(00101101)                        ;Compare B to Memory
          bhi     Sci_return                               ;Branch if Higher
          ldx     #Byt_DRBMemoryTable                      ;Load Index Register X
          clra                                             ;Clear Accumulator A
          abx                                              ;Add B to X
          ldab    0x00, X                                  ;Load Accumulator B
          cmpb    #0xFF ;(11111111)                        ;Compare B to Memory
          beq     Sci_return                               ;Branch if = Zero
          xgdx                                             ;Exchange D with X
          ldaa    0x00, X                                  ;Load Accumulator A
          bra     SerialOutput1a_jmp1                      ;Branch Always
Lbl_D05A: subb    #0x40 ;(01000000)                        ;Subtract Memory from B
          lslb                                             ;Logical Shift Left B
          bcs     Sci_return                               ;Branch if Lower
          cmpb    #0x10 ;(00010000)                        ;Compare B to Memory
          bcc     Sci_return                               ;Branch if Higher or Same
          ldx     #RealTimeDataTable                       ;Load Index Register X
Lbl_D066: abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          jmp     0x00, X                                  ;Jump
Lbl_D06B: ldx     #0xCDFB                                  ;Load Index Register X
          ldab    DRBPointer2                              ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          cmpb    #0x00 ;(00000000)                        ;Compare B to Memory
          beq     Sci_return                               ;Branch if = Zero
          cmpb    #0x08 ;(00001000)                        ;Compare B to Memory
          bls     Lbl_D066                                 ;Branch if Lower or Same
          bra     Sci_return                               ;Branch Always
SCI_LD07B:ldaa    StartupSwitchMirror1                     ;Load Accumulator A
          brclr   *BitFlags27, #b7_27_FuelEngNotRunning| b6_27_bt6, SerialOutput1a_jmp1 ;(11000000)  ;Branch if Bit(s) Clear
          ldab    TL_BatteryVoltsTablePtr ;(0x01/1.00 Y units)  ;Load Accumulator B
          beq     Lbl_D088                                 ;Branch if = Zero
          eora    #0x02 ;(00000010)                        ;Exclusive OR A with Memory
Lbl_D088: eora    #0x80 ;(10000000)                        ;Exclusive OR A with Memory
          bra     SerialOutput1a_jmp1                      ;Branch Always
SCI_Ld08c:ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          bra     SerialOutput1a_jmp1                      ;Branch Always
SCI_Ld090:ldaa    PIA1_Buffer_t3                           ;Load Accumulator A
          eora    #0x08 ;(00001000)                        ;Exclusive OR A with Memory
          bra     SerialOutput1a_jmp1                      ;Branch Always
SCI_Ld096:ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          anda    #0x70 ;(01110000)                        ;AND A with Memory
          bra     SerialOutput1a_jmp1                      ;Branch Always
SCI_MAPVolts:
          sei                                              ;Set Mask Disable Int
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_D0A3: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_D0A3                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cli                                              ;Clear Mask Enable Int
          bra     SerialOutput1a_jmp1                      ;Branch Always
SCI_Speed:ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          bra     SerialOutput1a_jmp1                      ;Branch Always
SCI_O2Volts:
          ldab    O2SensorVolts                            ;Load Accumulator B
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
          cmpb    TL_HighLimitForImmediateSwitchToClosedLoop ;(0x22/.67 volts)  ;Compare B to Memory
          bhi     Lbl_D0C2                                 ;Branch if Higher
          cmpb    TL_LowLimitForImmediateSwitchToClosedLoop ;(0x14/.39 volts)  ;Compare B to Memory
          bhi     SerialOutput1a_jmp1                      ;Branch if Higher
          anda    #0xA0 ;(10100000)                        ;AND A with Memory
Lbl_D0C2: anda    #0xB1 ;(10110001)                        ;AND A with Memory
SerialOutput1a_jmp1:
          jmp     SerialOutput1a                           ;Jump
SCI_Ld0c7:jmp     Sci_return                               ;Jump
SCI_Ld0ca:jmp     Sci_return                               ;Jump
SendBaro: ldaa    BaroPressure                             ;Load Accumulator A
          suba    MapValue                                 ;Subtract Memory from A
;   BP - MV = vacuum  e.g. 14.7 - 5.4 (map reading) = 9.3 (calculated vacuum)
          bcc     SerialOutput1a_jmp2                      ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
SerialOutput1a_jmp2:
          jmp     SerialOutput1a_jmp1                      ;Jump
SendTPS:  ldaa    TpsVolts                                 ;Load Accumulator A
          suba    LowestSessionTpsVolts                    ;Subtract Memory from A
          bcc     Lbl_D0DE                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_D0DE: ldab    TL_t3_0xfd ;(0xAB/171.00 Y units)        ;Load Accumulator B
          staa    Temp0                                    ;Store Accumulator A
          mul                                              ;Multiply A x B = D
          adca    Temp0                                    ;Add with Carry to A
          bcc     SerialOutput1a_jmp3                      ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
SerialOutput1a_jmp3:
          jmp     SerialOutput1a_jmp1                      ;Jump
SCI_Ld0ef:ldaa    CalculatedSparkAdvance                   ;Load Accumulator A
          jmp     SerialOutput1a_jmp1                      ;Jump
CalculateChecksum:
          ldx     #TL_IDENT1 ;(0x11/17.00 Y units)         ;Load Index Register X
          ldd     #0x9200                                  ;Load Double Accumulator D
          std     Temp0                                    ;Store Accumulator D
          clra                                             ;Clear Accumulator A
          ldab    #0x08 ;(00001000)                        ;Load Accumulator B
Lbl_D100: bsr     Lbl_D11A                                 ;Branch to Subroutine
          psha                                             ;Push A onto Stack
          pshb                                             ;Push B onto Stack
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldaa    #0x12 ;(00010010)                        ;Load Accumulator A
          adda    Temp0                                    ;Add Memory to A
          staa    Temp0                                    ;Store Accumulator A
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          pulb                                             ;Pull B from Stack
          pula                                             ;Pull A from Stack
          beq     Lbl_D143                                 ;Branch if = Zero
          bra     Lbl_D100                                 ;Branch Always
Lbl_D11A: cpx     #0xB600                                  ;Compare X to Memory 16-Bit
          bne     Lbl_D128                                 ;Branch if Not = Zero
          inc     Temp0                                    ;Increment Memory Byte
          inc     Temp0                                    ;Increment Memory Byte
          ldx     #CheckAndFilterCoolantTempSensor_MM      ;Load Index Register X
Lbl_D128: adda    0x00, X                                  ;Add Memory to A
          adda    0x01, X                                  ;Add Memory to A
          adda    0x02, X                                  ;Add Memory to A
          adda    0x03, X                                  ;Add Memory to A
          adda    0x04, X                                  ;Add Memory to A
          adda    0x05, X                                  ;Add Memory to A
          adda    0x06, X                                  ;Add Memory to A
          adda    0x07, X                                  ;Add Memory to A
          abx                                              ;Add B to X
          cpx     Temp0                                    ;Compare X to Memory 16-Bit
          bne     Lbl_D128                                 ;Branch if Not = Zero
          tst     Temp0                                    ;Test for Zero or Minus
          beq     Lbl_D144                                 ;Branch if = Zero
Lbl_D143: rts                                              ;Return from Subroutine
Lbl_D144: pulx                                             ;Pull X from Stack (Hi First)
          suba    TL_PARTNO4 ;(0x81/129.00 Y units)        ;Subtract Memory from A
          beq     Lbl_D143                                 ;Branch if = Zero
          ldd     #0x0201                                  ;Load Double Accumulator D
          jmp     ThrowNonCriticalError                    ;Jump
FlashCodesOutOnCEL:
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          lsla                                             ;Logical Shift Left A
          lsla                                             ;Logical Shift Left A
          bne     Lbl_D166                                 ;Branch if Not = Zero
          ldaa    LastCamFallingEdgeTime2                  ;Load Accumulator A
          bita    #0x70 ;(01110000)                        ;Bit(s) Test A with Memory
          beq     Lbl_D167                                 ;Branch if = Zero
          suba    #0x10 ;(00010000)                        ;Subtract Memory from A
          bita    #0x70 ;(01110000)                        ;Bit(s) Test A with Memory
          beq     Lbl_D167                                 ;Branch if = Zero
          staa    LastCamFallingEdgeTime2                  ;Store Accumulator A
Lbl_D166: rts                                              ;Return from Subroutine
Lbl_D167: ldab    PIA1_Buffer_t3                           ;Load Accumulator B
          eorb    #0x40 ;(01000000)                        ;Exclusive OR B with Memory
          stab    PIA1_Buffer_t3                           ;Store Accumulator B
          bita    #0x0F ;(00001111)                        ;Bit(s) Test A with Memory
          beq     Lbl_D17A                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          bita    #0x0F ;(00001111)                        ;Bit(s) Test A with Memory
          beq     Lbl_D17A                                 ;Branch if = Zero
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          bra     Lbl_D1AF                                 ;Branch Always
Lbl_D17A: tsta                                             ;Test for Zero or Minus
          bmi     Lbl_D1B3                                 ;Branch if Minus
          ldaa    #0xAA ;(10101010)                        ;Load Accumulator A
          ldab    DRBPointer2                              ;Load Accumulator B
          cmpb    #0xFE ;(11111110)                        ;Compare B to Memory
          beq     Lbl_D1A3                                 ;Branch if = Zero
          tstb                                             ;Test for Zero or Minus
          bmi     Lbl_D1AF                                 ;Branch if Minus
          cmpb    #0x08 ;(00001000)                        ;Compare B to Memory
          bcs     Lbl_D196                                 ;Branch if Lower
          ldx     #0xB618                                  ;Load Index Register X
          abx                                              ;Add B to X
          brset   0x00, X, #$%11111111, Lbl_D1FB           ;Branch if Bit(s) Set
          bra     Lbl_D19D                                 ;Branch Always
Lbl_D196: negb                                             ;2's Complement B
          addb    #0x07 ;(00000111)                        ;Add Memory to B
          ldx     #ErrorBitRegister0                       ;Load Index Register X
          abx                                              ;Add B to X
Lbl_D19D: ldab    0x00, X                                  ;Load Accumulator B
          beq     Lbl_D1AF                                 ;Branch if = Zero
          bra     Lbl_D1A4                                 ;Branch Always
Lbl_D1A3: clrb                                             ;Clear Accumulator B
Lbl_D1A4: ldx     #gb_ErrorCodesToDash_Table               ;Load Index Register X
          abx                                              ;Add B to X
          ldaa    0x00, X                                  ;Load Accumulator A
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          lsla                                             ;Logical Shift Left A
          oraa    #0xA0 ;(10100000)                        ;OR Accumulator A (Inclusive)
Lbl_D1AF: staa    LastCamFallingEdgeTime2                  ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_D1B3: ldab    DRBPointer2                              ;Load Accumulator B
          cmpb    #0xFF ;(11111111)                        ;Compare B to Memory
          bne     Lbl_D1C5                                 ;Branch if Not = Zero
          ldaa    ErrorCodeUpdateKeyOnCount                ;Load Accumulator A
          cmpa    #0x32 ;(00110010)                        ;Compare A to Memory
          bhi     Lbl_D1C5                                 ;Branch if Higher
          decb                                             ;Decrement Accumulator B
          stab    DRBPointer2                              ;Store Accumulator B
          clrb                                             ;Clear Accumulator B
          bra     Lbl_D1EA                                 ;Branch Always
Lbl_D1C5: cmpb    #0xFE ;(11111110)                        ;Compare B to Memory
          bne     Lbl_D1CA                                 ;Branch if Not = Zero
          incb                                             ;Increment Accumulator B
Lbl_D1CA: incb                                             ;Increment Accumulator B
          stab    DRBPointer2                              ;Store Accumulator B
          cmpb    #0x08 ;(00001000)                        ;Compare B to Memory
          bcs     Lbl_D1DF                                 ;Branch if Lower
          brset   *DRBPointer2, #$%10000000, Lbl_D204      ;Branch if Bit(s) Set
          ldx     #0xB618                                  ;Load Index Register X
          abx                                              ;Add B to X
          brset   0x00, X, #$%11111111, Lbl_D1FB           ;Branch if Bit(s) Set
          bra     Lbl_D1E6                                 ;Branch Always
Lbl_D1DF: negb                                             ;2's Complement B
          addb    #0x07 ;(00000111)                        ;Add Memory to B
          ldx     #ErrorBitRegister0                       ;Load Index Register X
          abx                                              ;Add B to X
Lbl_D1E6: ldab    0x00, X                                  ;Load Accumulator B
          beq     Lbl_D1FB                                 ;Branch if = Zero
Lbl_D1EA: ldx     #gb_ErrorCodesToDash_Table               ;Load Index Register X
          abx                                              ;Add B to X
          ldaa    0x00, X                                  ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          lsra                                             ;Logical Shift Right A
          lsra                                             ;Logical Shift Right A
          lsra                                             ;Logical Shift Right A
          lsla                                             ;Logical Shift Left A
          oraa    #0x40 ;(01000000)                        ;OR Accumulator A (Inclusive)
          staa    LastCamFallingEdgeTime2                  ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_D1FB: ldaa    #0x4A ;(01001010)                        ;Load Accumulator A
          staa    LastCamFallingEdgeTime2                  ;Store Accumulator A
          bset    *DRBPointer2, #$%10000000                ;Set Bit(s)
          rts                                              ;Return from Subroutine
Lbl_D204: clra                                             ;Clear Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          staa    DRBSerialMode                            ;Store Accumulator A
          staa    DRBPointer2                              ;Store Accumulator A
          rts                                              ;Return from Subroutine
gb_ErrorCodesToDash_Table:
          .byte 0x12 ;1-1
          .byte 0x54 ;2-2
          .byte 0x53 ;3-3
          .byte 0x52 ;4-4
          .byte 0x51 ;5-5
          .byte 0x47 ;6-6
          .byte 0x46 ;7-7
          .byte 0x45 ;8-8
          .byte 0x44 ;9-9
          .byte 0x43 ;10-10
          .byte 0x42 ;11-11
          .byte 0x41 ;12-12
          .byte 0x37 ;13-13
          .byte 0x36 ;14-14
          .byte 0x35 ;15-15
          .byte 0x34 ;16-16
          .byte 0x33 ;17-17
          .byte 0x32 ;18-18
          .byte 0x31 ;19-19
          .byte 0x27 ;20-20
          .byte 0x27 ;21-21
          .byte 0x27 ;22-22
          .byte 0x26 ;23-23
          .byte 0x26 ;24-24
          .byte 0x26 ;25-25
          .byte 0x25 ;26-26
          .byte 0x24 ;27-27
          .byte 0x24 ;28-28
          .byte 0x23 ;29-29
          .byte 0x23 ;30-30
          .byte 0x22 ;31-31
          .byte 0x22 ;32-32
          .byte 0x21 ;33-33
          .byte 0x17 ;34-34
          .byte 0x16 ;35-35
          .byte 0x15 ;36-36
          .byte 0x14 ;37-37
          .byte 0x14 ;38-38
          .byte 0x13 ;39-39
          .byte 0x13 ;40-40
          .byte 0x11 ;41-41
          .byte 0x43 ;42-42
          .byte 0x43 ;43-43
          .byte 0x43 ;44-44
          .byte 0x42 ;45-45
          .byte 0x52 ;46-46
          .byte 0x32 ;47-47
          .byte 0x61 ;48-48
          .byte 0x62 ;49-49
          .byte 0x63 ;50-50
          .byte 0x45 ;51-51
          .byte 0x36 ;52-52
          .byte 0x35 ;53-53
          .byte 0x35 ;54-54
          .byte 0x32 ;55-55
          .byte 0x64 ;56-56
          .byte 0x65 ;57-57
          .byte 0x23 ;58-58
          .byte 0x23 ;59-59
          .byte 0x21 ;60-60
          .byte 0x51 ;61-61
          .byte 0x27 ;62-62
          .byte 0x21 ;63-63
          .byte 0x67 ;64-64
          .byte 0x52 ;65-65
          .byte 0x66 ;66-66
          .byte 0x66 ;67-67
          .byte 0x36 ;68-68
          .byte 0x53 ;69-69
          .byte 0x27 ;70-70
          .byte 0x27 ;71-71
          .byte 0x44 ;72-72
          .byte 0x16 ;73-73
          .byte 0x71 ;74-74
          .byte 0x72 ;75-75
          .byte 0x73 ;76-76
          .byte 0x74 ;77-77
          .byte 0x75 ;78-78
          .byte 0x51 ;79-79
          .byte 0x27 ;80-80
          .byte 0x27 ;81-81
          .byte 0x76 ;82-82
ThrowNonCriticalError:
          ldx     #TL_ErrorBitsMask1 ;(0x20/32.00 out)     ;Load Index Register X
Lbl_D261: brclr   0x00, X, #$%11111111, Lbl_D26C           ;Branch if Bit(s) Clear
          cmpa    0x00, X                                  ;Compare A to Memory
          beq     Lbl_D2B8                                 ;Branch if = Zero
          inx                                              ;Increment Index Register X
          bra     Lbl_D261                                 ;Branch Always
Lbl_D26C: tstb                                             ;Test for Zero or Minus
          bmi     Lbl_D277                                 ;Branch if Minus
          cmpa    ErrorBitRegisterStored3                  ;Compare A to Memory
          beq     Lbl_D2B5                                 ;Branch if = Zero
          cmpa    ErrorBitRegisterStored2                  ;Compare A to Memory
          beq     Lbl_D2AB                                 ;Branch if = Zero
Lbl_D277: andb    #0x7F ;(01111111)                        ;AND B with Memory
          stab    Temp0                                    ;Store Accumulator B
          ldy     #ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB ;Load Index Register Y
          cmpa    0x00, Y                                  ;Compare A to Memory
          beq     Lbl_D298                                 ;Branch if = Zero
          iny                                              ;Increment Index Register Y
          cmpa    0x00, Y                                  ;Compare A to Memory
          beq     Lbl_D298                                 ;Branch if = Zero
          tst     0x00, Y                                  ;Test for Zero or Minus
          beq     Lbl_D298                                 ;Branch if = Zero
          dey                                              ;Decrement Index Register Y
          tst     0x00, Y                                  ;Test for Zero or Minus
          bne     Lbl_D2B8                                 ;Branch if Not = Zero
Lbl_D298: staa    0x00, Y                                  ;Store Accumulator A
          ldab    0x02, Y                                  ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          beq     Lbl_D2BB                                 ;Branch if = Zero
          cmpb    Temp0                                    ;Compare B to Memory
          bcc     Lbl_D2BB                                 ;Branch if Higher or Same
          stab    0x02, Y                                  ;Store Accumulator B
          clc                                              ;Clear Carry Bit
          rts                                              ;Return from Subroutine
Lbl_D2AB: ldd     ErrorBitRegisterStored2                  ;Load Double Accumulator D
          staa    ErrorBitRegisterStored3                  ;Store Accumulator A
          stab    ErrorBitRegisterStored2                  ;Store Accumulator B
          ldaa    ErrorCodeUpdateKeyOnCount                ;Load Accumulator A
          staa    ErrorCodeUpdateKeyOnCount2               ;Store Accumulator A
Lbl_D2B5: clr     ErrorCodeUpdateKeyOnCount                ;Clear Memory Byte
Lbl_D2B8: clra                                             ;Clear Accumulator A
          clc                                              ;Clear Carry Bit
          rts                                              ;Return from Subroutine
Lbl_D2BB: tst     ErrorBitRegister0                        ;Test for Zero or Minus
          beq     Lbl_D2CB                                 ;Branch if = Zero
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_D2C8 ;(01000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_D2CB ;(00100000)  ;Branch if Bit(s) Clear
Lbl_D2C8: jmp     Lbl_D353                                 ;Jump
Lbl_D2CB: clr     0x00, Y                                  ;Clear Memory Byte
          clr     0x02, Y                                  ;Clear Memory Byte
          ldx     #ErrorBitRegister0                       ;Load Index Register X
Lbl_D2D4: cmpa    0x00, X                                  ;Compare A to Memory
          bne     Lbl_D2DD                                 ;Branch if Not = Zero
          clrb                                             ;Clear Accumulator B
          stab    0x00, X                                  ;Store Accumulator B
          bra     Lbl_D2E5                                 ;Branch Always
Lbl_D2DD: inx                                              ;Increment Index Register X
          cpx     #0x001C                                  ;Compare X to Memory 16-Bit
          bls     Lbl_D2D4                                 ;Branch if Lower or Same
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
Lbl_D2E5: ldx     #ErrorBitRegisterStored3                 ;Load Index Register X
          ldy     #ErrorCodeUpdateKeyOnCount               ;Load Index Register Y
          stab    Temp0                                    ;Store Accumulator B
Lbl_D2EF: cpx     #0x001A                                  ;Compare X to Memory 16-Bit
          bcs     Lbl_D304                                 ;Branch if Lower
          psha                                             ;Push A onto Stack
          ldab    0x00, Y                                  ;Load Accumulator B
          ldaa    Temp0                                    ;Load Accumulator A
          staa    0x00, Y                                  ;Store Accumulator A
          iny                                              ;Increment Index Register Y
          stab    Temp0                                    ;Store Accumulator B
          pula                                             ;Pull A from Stack
Lbl_D304: ldab    0x00, X                                  ;Load Accumulator B
          staa    0x00, X                                  ;Store Accumulator A
          tba                                              ;Transfer B to A
          beq     Lbl_D33E                                 ;Branch if = Zero
          dex                                              ;Decrement Index Register X
          cpx     #0x0015                                  ;Compare X to Memory 16-Bit
          bcc     Lbl_D2EF                                 ;Branch if Higher or Same
          clr     ErrorCodeUpdateKeyOnCount                ;Clear Memory Byte
          sei                                              ;Set Mask Disable Int
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_D353 ;(01000000)  ;Branch if Bit(s) Set
          brset   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_D353 ;(00100000)  ;Branch if Bit(s) Set
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
          staa    DRBOffsetStored_LB                       ;Store Accumulator A
          ldx     #0xB61F                                  ;Load Index Register X
Lbl_D327: inx                                              ;Increment Index Register X
          ldab    0x00, X                                  ;Load Accumulator B
          cba                                              ;Compare A to B
          beq     Lbl_D339                                 ;Branch if = Zero
          incb                                             ;Increment Accumulator B
          bne     Lbl_D327                                 ;Branch if Not = Zero
          xgdx                                             ;Exchange D with X
          subd    #0xB600                                  ;Subtract Memory from D
          stab    DRBOffsetStored_HB                       ;Store Accumulator B
          sec                                              ;Set Carry
          rts                                              ;Return from Subroutine
Lbl_D339: bclr    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Clear Bits(s)
;   clear drbtoggle1 bit
          sec                                              ;Set Carry
          rts                                              ;Return from Subroutine
Lbl_D33E: cpy     #0x001F                                  ;Compare Y to Memory 16-Bit
          bhi     Lbl_D34E                                 ;Branch if Higher
          ldab    ErrorCodeUpdateKeyOnCount                ;Load Accumulator B
          beq     Lbl_D351                                 ;Branch if = Zero
          ldab    Temp0                                    ;Load Accumulator B
          stab    0x00, Y                                  ;Store Accumulator B
Lbl_D34E: clrb                                             ;Clear Accumulator B
          stab    ErrorCodeUpdateKeyOnCount                ;Store Accumulator B
Lbl_D351: sec                                              ;Set Carry
          rts                                              ;Return from Subroutine
Lbl_D353: clc                                              ;Clear Carry Bit
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
gw_PIA1AManipulation_Table2:
          .byte 0x00, 0x00 ;1-2
          .byte 0x04, 0x00 ;3-4
          .byte 0x10, 0x20 ;5-6
          .byte 0x00, 0x80 ;7-8
          .byte 0x00, 0x00 ;9-10
          .byte 0x19, 0x00 ;11-12
          .byte 0x32, 0x0C ;13-14
          .byte 0x00, 0x0E ;15-16
gw_PIA1AManipulation_Table:
          .byte 0x01, 0x02 ;1-2
          .byte 0x04, 0x08 ;3-4
          .byte 0x10, 0x20 ;5-6
          .byte 0x00, 0x00 ;7-8
          .byte 0x10, 0x11 ;9-10
          .byte 0x33, 0x51 ;11-12
          .byte 0x0A, 0x12 ;13-14
          .byte 0x00, 0x00 ;15-16
UpdatePIA1AndCheckOutputs_MM:
          sei                                              ;Set Mask Disable Int
          ldab    SPCR_SerialPeripheralControl             ;Load Accumulator B
          orab    #0x01 ;(00000001)                        ;OR Accumulator B (Inclusive)
          stab    SPCR_SerialPeripheralControl             ;Store Accumulator B
          bclr    *PIA3_Buffer_t3, #b2_CF_bt2 ;(00000100)  ;Clear Bits(s)
          ldab    PIA3_Buffer_t3                           ;Load Accumulator B
          stab    PIA3_Buffer_2_t3                         ;Store Accumulator B
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          mul                                              ;Multiply A x B = D
          mul                                              ;Multiply A x B = D
          nop                                              ;No Operation
          bset    *PIA3_Buffer_t3, #b2_CF_bt2 ;(00000100)  ;Set Bit(s)
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          ldab    SPCR_SerialPeripheralControl             ;Load Accumulator B
          andb    #0xFC ;(11111100)                        ;AND B with Memory
          stab    SPCR_SerialPeripheralControl             ;Store Accumulator B
          staa    Temp1_t3                                 ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          brclr   *BitFlags2e, #b6_2E_bt6, PIA_CheckErrors_Return ;(01000000)  ;Branch if Bit(s) Clear
          eora    PIA2_Buffer_t3_Temp                      ;Exclusive OR A with Memory
          anda    TL_TL_8A25 ;(0x11/00010001)              ;AND A with Memory
          ldx     #gw_PIA1AManipulation_Table              ;Load Index Register X
          ldab    Counter_MainLoop                         ;Load Accumulator B
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          abx                                              ;Add B to X
          bita    0x00, X                                  ;Bit(s) Test A with Memory
          beq     PIA_CheckErrors_Return                   ;Branch if = Zero
          ldaa    CountdownTimerFromKeyOn                  ;Load Accumulator A
          bne     PIA_CheckErrors_Return                   ;Branch if Not = Zero
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     PIA_CheckErrors_Return                   ;Branch if Not = Zero
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    #0xA0 ;(10100000)                        ;Compare A to Memory
;   10.0 volts
          bcs     PIA_CheckErrors_Return                   ;Branch if Lower
          ldaa    0x08, X                                  ;Load Accumulator A
          ldab    #0xA0 ;(10100000)                        ;Load Accumulator B
          cmpa    #0x11 ;(00010001)                        ;Compare A to Memory
          beq     Lbl_D3E8                                 ;Branch if = Zero
          cmpa    #0x12 ;(00010010)                        ;Compare A to Memory
          beq     Lbl_D3F6                                 ;Branch if = Zero
          cmpa    #0x33 ;(00110011)                        ;Compare A to Memory
          beq     Lbl_D404                                 ;Branch if = Zero
          ldab    #0x20 ;(00100000)                        ;Load Accumulator B
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bra     PIA_CheckErrors_Return                   ;Branch Always
Lbl_D3E8: brset   *b5D_IPL2_t3, #b3_D6_bt4, PIA_CheckErrors_Return ;(00001000)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     PIA_CheckErrors_Return                   ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b3_D6_bt4 ;(00001000)     ;Set Bit(s)
          bra     PIA_CheckErrors_Return                   ;Branch Always
Lbl_D3F6: brset   *b5D_IPL2_t3, #b5_D6_bt5, PIA_CheckErrors_Return ;(00100000)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     PIA_CheckErrors_Return                   ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b5_D6_bt5 ;(00100000)     ;Set Bit(s)
          bra     PIA_CheckErrors_Return                   ;Branch Always
Lbl_D404: brset   *b5D_IPL2_t3, #b2_D6_bt3, PIA_CheckErrors_Return ;(00000100)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     PIA_CheckErrors_Return                   ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b2_D6_bt3 ;(00000100)     ;Set Bit(s)
PIA_CheckErrors_Return:
          ldaa    PIA2_Buffer_t3                           ;Load Accumulator A
          staa    PIA2_Buffer_t3_Temp                      ;Store Accumulator A
          bset    *BitFlags2e, #b6_2E_bt6 ;(01000000)      ;Set Bit(s)
          rts                                              ;Return from Subroutine
UpdatePIA1AndCheckOutputs2_MM:
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x3F ;(00111111)                        ;Compare A to Memory
;   2023 rpm
          bcs     Lbl_D43A                                 ;Branch if Lower
          brclr   *BitFlags27, #b5_27_bt5, Lbl_D43A ;(00100000)  ;Branch if Bit(s) Clear
          ldaa    BitFlags_BF_t3                           ;Load Accumulator A
          cmpa    #0x83 ;(10000011)                        ;Compare A to Memory
          beq     Lbl_D43A                                 ;Branch if = Zero
          cmpa    #0x81 ;(10000001)                        ;Compare A to Memory
          beq     Lbl_D43A                                 ;Branch if = Zero
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          subd    TIC1_Counter_IC1_CamSensor               ;Subtract Memory from D
          cmpd    #0x00FA                                  ;Compare D to Memory 16-Bit
          bcs     Lbl_D43A                                 ;Branch if Lower
          rts                                              ;Return from Subroutine
Lbl_D43A: ldaa    PIA1_Buffer_t3                           ;Load Accumulator A
          adda    #0xC3 ;(11000011)                        ;Add Memory to A
          staa    Temp0                                    ;Store Accumulator A
          ldab    #0x40 ;(01000000)                        ;Load Accumulator B
          ldaa    #0x61 ;(01100001)                        ;Load Accumulator A
          ldy     #PORTA_PortA                             ;Load Index Register Y
          ldx     #SwitchPortAccessReg1                    ;Load Index Register X
          sei                                              ;Set Mask Disable Int
          bset    0x00, X, #$%00001000                     ;Set Bit(s)
          bclr    0x08, Y, #$%00100000                     ;Clear Bits(s)
          cmpb    SPSR_SerialPeripheralStatus              ;Compare B to Memory
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    #0x62 ;(01100010)                        ;Load Accumulator A
Lbl_D469: brclr   0x00, X, #$%00001000, Lbl_D473           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_D469                                 ;Branch if Not = Zero
          jmp     Lbl_D5CB                                 ;Jump
Lbl_D473: ldab    #0x0B ;(00001011)                        ;Load Accumulator B
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          staa    Temp1                                    ;Store Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    #0x00 ;(00000000)                        ;Load Accumulator A
Lbl_D48A: brclr   0x00, X, #$%00001000, Lbl_D494           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_D48A                                 ;Branch if Not = Zero
          jmp     Lbl_D5CB                                 ;Jump
Lbl_D494: ldab    #0x0B ;(00001011)                        ;Load Accumulator B
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          staa    Temp2                                    ;Store Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    PIA1_Buffer_t3                           ;Load Accumulator A
Lbl_D4AB: brclr   0x00, X, #$%00001000, Lbl_D4B5           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_D4AB                                 ;Branch if Not = Zero
          jmp     Lbl_D5CB                                 ;Jump
Lbl_D4B5: ldab    #0x0B ;(00001011)                        ;Load Accumulator B
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          staa    Temp3                                    ;Store Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    #0x00 ;(00000000)                        ;Load Accumulator A
Lbl_D4CC: brclr   0x00, X, #$%00001000, Lbl_D4D6           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_D4CC                                 ;Branch if Not = Zero
          jmp     Lbl_D5CB                                 ;Jump
Lbl_D4D6: ldab    #0x0B ;(00001011)                        ;Load Accumulator B
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          staa    Temp4                                    ;Store Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    Temp0                                    ;Load Accumulator A
Lbl_D4EE: brclr   0x00, X, #$%00001000, Lbl_D4F8           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_D4EE                                 ;Branch if Not = Zero
          jmp     Lbl_D5CB                                 ;Jump
Lbl_D4F8: ldab    #0x0B ;(00001011)                        ;Load Accumulator B
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
Lbl_D504: brset   0x29, Y, #$%10000000, Lbl_D50F           ;Branch if Bit(s) Set
          decb                                             ;Decrement Accumulator B
          bne     Lbl_D504                                 ;Branch if Not = Zero
          jmp     Lbl_D5CB                                 ;Jump
Lbl_D50F: ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          bset    0x08, Y, #$%00100000                     ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
          ldab    Temp1                                    ;Load Accumulator B
          addb    Temp2                                    ;Add Memory to B
          addb    Temp3                                    ;Add Memory to B
          addb    Temp4                                    ;Add Memory to B
          cba                                              ;Compare A to B
          beq     Lbl_D529                                 ;Branch if = Zero
          jmp     Lbl_D5C6                                 ;Jump
Lbl_D529: ldaa    Temp2                                    ;Load Accumulator A
          brclr   *BitFlags27, #b7_27_FuelEngNotRunning| b6_27_bt6, Lbl_D563 ;(11000000)  ;Branch if Bit(s) Clear
          ldab    TL_BatteryVoltsTablePtr ;(0x01/1.00 Y units)  ;Load Accumulator B
          beq     Lbl_D537                                 ;Branch if = Zero
          eora    #0x02 ;(00000010)                        ;Exclusive OR A with Memory
Lbl_D537: eora    #0x80 ;(10000000)                        ;Exclusive OR A with Memory
          ldab    StartupSwitchMirror1                     ;Load Accumulator B
          andb    #0x40 ;(01000000)                        ;AND B with Memory
          stab    Temp0                                    ;Store Accumulator B
          staa    StartupSwitchMirror1                     ;Store Accumulator A
          anda    #0x40 ;(01000000)                        ;AND A with Memory
          eora    Temp0                                    ;Exclusive OR A with Memory
          beq     Lbl_D54C                                 ;Branch if = Zero
          bset    *BitFlags2f, #$%00100000                 ;Set Bit(s)
Lbl_D54C: brclr   *StartupSwitchMirror1, #b6_61_IdleSpeedMode, Lbl_D55E ;(01000000)  ;Branch if Bit(s) Clear
          brclr   *StartupSwitchMirror1, #b7_61_bt7, Lbl_D559 ;(10000000)  ;Branch if Bit(s) Clear
          bset    *BitFlags68_t3, #b5_25_bt5 ;(00100000)   ;Set Bit(s)
          bra     Lbl_D571                                 ;Branch Always
Lbl_D559: bclr    *BitFlags68_t3, #b5_25_bt5 ;(00100000)   ;Clear Bits(s)
          bra     Lbl_D571                                 ;Branch Always
Lbl_D55E: bset    *BitFlags68_t3, #b5_25_bt5 ;(00100000)   ;Set Bit(s)
          bra     Lbl_D571                                 ;Branch Always
Lbl_D563: staa    StartupSwitchMirror1                     ;Store Accumulator A
          brclr   *StartupSwitchMirror1, #b7_61_bt7, Lbl_D56E ;(10000000)  ;Branch if Bit(s) Clear
          bset    *BitFlags68_t3, #b5_25_bt5 ;(00100000)   ;Set Bit(s)
          bra     Lbl_D571                                 ;Branch Always
Lbl_D56E: bclr    *BitFlags68_t3, #b5_25_bt5 ;(00100000)   ;Clear Bits(s)
Lbl_D571: brclr   *Ram_30, #$%10000000, Lbl_D5C7           ;Branch if Bit(s) Clear
          ldaa    Temp4                                    ;Load Accumulator A
          anda    TL_TL_8A24 ;(0x04/00000100)              ;AND A with Memory
          ldx     #gw_PIA1AManipulation_Table2             ;Load Index Register X
          ldab    Counter_MainLoop                         ;Load Accumulator B
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          abx                                              ;Add B to X
          bita    0x00, X                                  ;Bit(s) Test A with Memory
          beq     Lbl_D5C6                                 ;Branch if = Zero
          ldaa    CountdownTimerFromKeyOn                  ;Load Accumulator A
          bne     Lbl_D5C6                                 ;Branch if Not = Zero
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_D5C6                                 ;Branch if Not = Zero
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    #0xA0 ;(10100000)                        ;Compare A to Memory
;   10.0 volts
          bcs     Lbl_D5C6                                 ;Branch if Lower
          ldaa    0x08, X                                  ;Load Accumulator A
          ldab    #0xA0 ;(10100000)                        ;Load Accumulator B
          cmpa    #0x0C ;(00001100)                        ;Compare A to Memory
          beq     Lbl_D5B3                                 ;Branch if = Zero
          cmpa    #0x19 ;(00011001)                        ;Compare A to Memory
          bne     Lbl_D5C1                                 ;Branch if Not = Zero
          brset   *b5D_IPL2_t3, #b7_D6_bt7, Lbl_D5C6 ;(10000000)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D5C6                                 ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b7_D6_bt7 ;(10000000)     ;Set Bit(s)
          bra     Lbl_D5C6                                 ;Branch Always
Lbl_D5B3: brset   *b5d_IPL2, #b7_D7_bt7, Lbl_D5C6 ;(10000000)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D5C6                                 ;Branch if Higher or Same
          bset    *b5d_IPL2, #b7_D7_bt7 ;(10000000)        ;Set Bit(s)
          bra     Lbl_D5C6                                 ;Branch Always
Lbl_D5C1: ldab    #0x20 ;(00100000)                        ;Load Accumulator B
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
Lbl_D5C6: rts                                              ;Return from Subroutine
Lbl_D5C7: bset    *Ram_30, #$%10000000                     ;Set Bit(s)
          rts                                              ;Return from Subroutine
Lbl_D5CB: bset    0x08, Y, #$%00100000                     ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
          ldaa    BitFlags6a_t3                            ;Load Accumulator A
          bita    #0x60 ;(01100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_D5F0                                 ;Branch if Not = Zero
          ldaa    PPROG_EEPROMControlReg                   ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          bne     Lbl_D5F0                                 ;Branch if Not = Zero
          ldd     #0xB618                                  ;Load Double Accumulator D
          tba                                              ;Transfer B to A
          ldab    Imm_B618                                 ;Load Accumulator B
          beq     Lbl_D5F0                                 ;Branch if = Zero
          decb                                             ;Decrement Accumulator B
          staa    DRBOffsetStored_HB                       ;Store Accumulator A
          stab    DRBOffsetStored_LB                       ;Store Accumulator B
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
Lbl_D5F0: ldd     #0x4488                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D60B                                 ;Branch if Higher or Same
          sei                                              ;Set Mask Disable Int
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          anda    #0xFE ;(11111110)                        ;AND A with Memory
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
          ldab    #0x03 ;(00000011)                        ;Load Accumulator B
Lbl_D603: decb                                             ;Decrement Accumulator B
          bne     Lbl_D603                                 ;Branch if Not = Zero
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
Lbl_D60B: cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
d60d_MM:  ldaa    Ram_F3                                   ;Load Accumulator A
          bpl     Lbl_D624                                 ;Branch if Plus
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          staa    Ram_F3                                   ;Store Accumulator A
          ldd     #0x26A8                                  ;Load Double Accumulator D
          brset   *b5C_IPL1_t3, #b7_D5_MapStuck, Lbl_D624 ;(10000000)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D624                                 ;Branch if Higher or Same
          bset    *b5C_IPL1_t3, #b7_D5_MapStuck ;(10000000)  ;Set Bit(s)
Lbl_D624: rts                                              ;Return from Subroutine
CheckIfCheckEngineLightShouldBeOn_MM:
          ldab    #0x40 ;(01000000)                        ;Load Accumulator B
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_D645 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    DRBPointer1                              ;Load Accumulator A
          cmpa    #0x0A ;(00001010)                        ;Compare A to Memory
          bne     Lbl_D634                                 ;Branch if Not = Zero
          jmp     FlashCodesOutOnCEL                       ;Jump
Lbl_D634: cmpa    #0x18 ;(00011000)                        ;Compare A to Memory
          bne     Lbl_D63F                                 ;Branch if Not = Zero
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          lsla                                             ;Logical Shift Left A
          bmi     TurnCheckEngineLightOnAndOff             ;Branch if Minus
          bra     Lbl_D668                                 ;Branch Always
Lbl_D63F: brset   *BitFlags6a_t3, #b2_26_bt2, TurnCheckEngineLightOnAndOff ;(00000100)  ;Branch if Bit(s) Set
          bra     Lbl_D668                                 ;Branch Always
Lbl_D645: ldx     KeyOnOrEngineRunningTime                 ;Load Index Register X
          cpx     #0x0003                                  ;Compare X to Memory 16-Bit
;   8.45 sec
          bls     TurnCheckEngineLightOnAndOff             ;Branch if Lower or Same
          bclr    *Ram_05, #$%11000000                     ;Clear Bits(s)
          brclr   *PIA1_Buffer_t3, #b6_CD_CELight, Lbl_D668 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    b5C_IPL1_t3                              ;Load Accumulator A
          bita    TL_PowerLossLightMask ;(0xEB/11101011)   ;Bit(s) Test A with Memory
          bne     Lbl_D668                                 ;Branch if Not = Zero
          ldaa    b5D_IPL2_t3                              ;Load Accumulator A
          bita    TL_PowerLossLightMask2 ;(0x00/00000000)  ;Bit(s) Test A with Memory
          bne     Lbl_D668                                 ;Branch if Not = Zero
          ldaa    b5d_IPL2                                 ;Load Accumulator A
          bita    TL_PowerLossLightMask3 ;(0x78/01111000)  ;Bit(s) Test A with Memory
          beq     TurnCheckEngineLightOnAndOff             ;Branch if = Zero
Lbl_D668: clrb                                             ;Clear Accumulator B
TurnCheckEngineLightOnAndOff:
          ldaa    #0xBF ;(10111111)                        ;Load Accumulator A
          anda    PIA1_Buffer_t3                           ;AND A with Memory
          aba                                              ;Add Accumulators
          staa    PIA1_Buffer_t3                           ;Store Accumulator A
          rts                                              ;Return from Subroutine
d671_MM:  ldaa    BitFlags27                               ;Load Accumulator A
          bita    #0xC0 ;(11000000)                        ;Bit(s) Test A with Memory
          beq     Lbl_D6BD                                 ;Branch if = Zero
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_D681 ;(01000000)  ;Branch if Bit(s) Set
          brset   *BitFlags6a_t3, #b2_26_bt2, Lbl_D6B5 ;(00000100)  ;Branch if Bit(s) Set
          bra     Lbl_D6BA                                 ;Branch Always
Lbl_D681: brset   *b5C_IPL1_t3, #b5_D5_BattNotCharging, Lbl_D6BA ;(00100000)  ;Branch if Bit(s) Set
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x3C ;(00111100)                        ;Bit(s) Test A with Memory
          bne     Lbl_D6B1                                 ;Branch if Not = Zero
          ldaa    TargetBatteryVolts                       ;Load Accumulator A
          suba    BatteryVolts                             ;Subtract Memory from A
          bcs     Lbl_D6AA                                 ;Branch if Lower
          cmpa    #0x11 ;(00010001)                        ;Compare A to Memory
          bcs     Lbl_D6AA                                 ;Branch if Lower
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          cmpd    #0x2EE0                                  ;Compare D to Memory 16-Bit
;   1500 rpm
          bcs     Lbl_D6AD                                 ;Branch if Lower
          ldaa    UNe_64B8                                 ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          cmpa    #0x56 ;(01010110)                        ;Compare A to Memory
          bcs     Lbl_D6AE                                 ;Branch if Lower
          bset    *Ram_30, #$%00100000                     ;Set Bit(s)
          bra     Lbl_D6BA                                 ;Branch Always
Lbl_D6AA: bclr    *Ram_30, #$%00100000                     ;Clear Bits(s)
Lbl_D6AD: clra                                             ;Clear Accumulator A
Lbl_D6AE: staa    UNe_64B8                                 ;Store Accumulator A
Lbl_D6B1: brset   *Ram_30, #$%00100000, Lbl_D6BA           ;Branch if Bit(s) Set
Lbl_D6B5: bset    *PIA2_Buffer_t3, #b2_CE_bt2 ;(00000100)  ;Set Bit(s)
          bra     Lbl_D6BD                                 ;Branch Always
Lbl_D6BA: bclr    *PIA2_Buffer_t3, #b2_CE_bt2 ;(00000100)  ;Clear Bits(s)
Lbl_D6BD: rts                                              ;Return from Subroutine
UpdateErrorTimersAndPossiblyClearErrors_MM:
          ldd     ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB ;Load Double Accumulator D
          tsta                                             ;Test for Zero or Minus
          beq     Lbl_D6CB                                 ;Branch if = Zero
          dec     ClearTheErrorTimer_0                     ;Decrement Memory Byte
          bne     Lbl_D6CB                                 ;Branch if Not = Zero
          clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB ;Clear Memory Byte
Lbl_D6CB: tstb                                             ;Test for Zero or Minus
          beq     Lbl_D6D6                                 ;Branch if = Zero
          dec     ClearTheErrorTimer_1                     ;Decrement Memory Byte
          bne     Lbl_D6D6                                 ;Branch if Not = Zero
          clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB ;Clear Memory Byte
Lbl_D6D6: ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR ;Load Accumulator A
          beq     Lbl_D6E5                                 ;Branch if = Zero
          suba    #0x10 ;(00010000)                        ;Subtract Memory from A
          bita    #0xF0 ;(11110000)                        ;Bit(s) Test A with Memory
          bne     Lbl_D6E2                                 ;Branch if Not = Zero
          clra                                             ;Clear Accumulator A
Lbl_D6E2: staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR ;Store Accumulator A
Lbl_D6E5: rts                                              ;Return from Subroutine
UpdateErrorTimersAndPossiblyClearErrors2_MM:
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_D71F ;(01000000)  ;Branch if Bit(s) Clear
          brset   *BitFlags6d_t3, #b2_28_NeedSetup, Lbl_D71F ;(00000100)  ;Branch if Bit(s) Set
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_D71F ;(01000000)  ;Branch if Bit(s) Set
          bset    *BitFlags6d_t3, #b2_28_NeedSetup ;(00000100)  ;Set Bit(s)
          brclr   *ErrorBitRegisterStored3, #$%11111111, Lbl_D718 ;Branch if Bit(s) Clear
          ldaa    ErrorCodeUpdateKeyOnCount                ;Load Accumulator A
          cmpa    #0x32 ;(00110010)                        ;Compare A to Memory
          bcs     Lbl_D702                                 ;Branch if Lower
          jmp     DRB_ClearErrorCodes                      ;Jump
Lbl_D702: ldaa    ErrorBitRegisterStored1                  ;Load Accumulator A
          beq     Lbl_D70D                                 ;Branch if = Zero
          ldaa    ErrorCodeUpdateKeyOnCount3               ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_D70D                                 ;Branch if = Zero
          staa    ErrorCodeUpdateKeyOnCount3               ;Store Accumulator A
Lbl_D70D: ldaa    ErrorBitRegisterStored2                  ;Load Accumulator A
          beq     Lbl_D718                                 ;Branch if = Zero
          ldaa    ErrorCodeUpdateKeyOnCount2               ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_D718                                 ;Branch if = Zero
          staa    ErrorCodeUpdateKeyOnCount2               ;Store Accumulator A
Lbl_D718: ldaa    ErrorCodeUpdateKeyOnCount                ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_D71F                                 ;Branch if = Zero
          staa    ErrorCodeUpdateKeyOnCount                ;Store Accumulator A
Lbl_D71F: rts                                              ;Return from Subroutine
ResetErrorCodeIfTimerExpired:
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          ldab    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR ;Load Accumulator B
          beq     Lbl_D72F                                 ;Branch if = Zero
          andb    #0x0F ;(00001111)                        ;AND B with Memory
          cba                                              ;Compare A to B
          bne     Lbl_D736                                 ;Branch if Not = Zero
          ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR ;Load Accumulator A
Lbl_D72F: adda    #0x10 ;(00010000)                        ;Add Memory to A
          bcs     SELECT_ERROR_BIT_POSITION_ROUT           ;Branch if Lower
          staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR ;Store Accumulator A
Lbl_D736: rts                                              ;Return from Subroutine
SELECT_ERROR_BIT_POSITION_ROUT:
          ldab    #0x01 ;(00000001)                        ;Load Accumulator B
Lbl_D739: deca                                             ;Decrement Accumulator A
          beq     Lbl_D73F                                 ;Branch if = Zero
          lslb                                             ;Logical Shift Left B
          bra     Lbl_D739                                 ;Branch Always
Lbl_D73F: clr     ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR ;Clear Memory Byte
          comb                                             ;1's Complement B
          sei                                              ;Set Mask Disable Int
          andb    b5C_IPL1_t3                              ;AND B with Memory
          stab    b5C_IPL1_t3                              ;Store Accumulator B
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
SimulateMapReadingFromTps:
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x7D ;(01111101)                        ;Compare B to Memory
;   4015 rpm
          ldaa    #0x00 ;(00000000)                        ;Load Accumulator A
          bcc     Lbl_D768                                 ;Branch if Higher or Same
          subb    #0x10 ;(00010000)                        ;Subtract Memory from B
          bcc     Lbl_D757                                 ;Branch if Higher or Same
          clrb                                             ;Clear Accumulator B
Lbl_D757: ldaa    #0x29 ;(00101001)                        ;Load Accumulator A
          mul                                              ;Multiply A x B = D
          asld                                             ;Arithmetic Shift Left D
          lslb                                             ;Logical Shift Left B
          adca    LowestSessionTpsVolts                    ;Add with Carry to A
          tab                                              ;Transfer A to B
          ldaa    TpsVolts                                 ;Load Accumulator A
          adda    TL_OffsetAddedToCalcThrottle ;(0x0F/15.00 out)  ;Add Memory to A
          sba                                              ;Subtract B from A
          bcc     Lbl_D768                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_D768: ldx     #TL_LimpinTableForMapFromThrottle        ;Load Index Register X
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          adda    TL_OffsetForCalcMapInMapLimpin ;(0x14/-13.55 psi)  ;Add Memory to A
          bcc     Lbl_D775                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_D775: rts                                              ;Return from Subroutine
Lbl_D776: brclr   *Ram_05, #$%00000001, Lbl_D7B0           ;Branch if Bit(s) Clear
          ldab    BatteryVolts                             ;Load Accumulator B
          cmpb    TL_TL_8A30 ;(0x79/2.37 volts)            ;Compare B to Memory
          bcs     Lbl_D7A1                                 ;Branch if Lower
          cmpb    TL_TL_8A2F ;(0xBD/3.71 volts)            ;Compare B to Memory
          bcc     Lbl_D7A1                                 ;Branch if Higher or Same
          ldaa    MapVolts_X                               ;Load Accumulator A
          suba    MapValue3                                ;Subtract Memory from A
          bls     Lbl_D7A1                                 ;Branch if Lower or Same
          cmpa    TL_TL_8A2E ;(0x04/4.00 Y units)          ;Compare A to Memory
          bcs     Lbl_D7A1                                 ;Branch if Lower
          sei                                              ;Set Mask Disable Int
Lbl_D792: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_D792                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          staa    MapVolts_X                               ;Store Accumulator A
          staa    MapValue3                                ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          bra     Lbl_D7AA                                 ;Branch Always
Lbl_D7A1: ldaa    UNe_64B9                                 ;Load Accumulator A
          anda    #0xE0 ;(11100000)                        ;AND A with Memory
          cmpa    #0xE0 ;(11100000)                        ;Compare A to Memory
          bne     Lbl_D7B0                                 ;Branch if Not = Zero
Lbl_D7AA: ldd     #0x2828                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
Lbl_D7B0: brset   *BitFlags_BF_t3, #$%10000000, Lbl_D7CC   ;Branch if Bit(s) Set
          ldaa    UNe_64B9                                 ;Load Accumulator A
          anda    #0x1F ;(00011111)                        ;AND A with Memory
          cmpa    #0x1F ;(00011111)                        ;Compare A to Memory
          bne     Lbl_D7CC                                 ;Branch if Not = Zero
          brset   *b5d_IPL2, #b6_D7_bt6, Lbl_D7CC ;(01000000)  ;Branch if Bit(s) Set
          ldd     #0x0181                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D7CC                                 ;Branch if Higher or Same
          bset    *b5d_IPL2, #b6_D7_bt6 ;(01000000)        ;Set Bit(s)
Lbl_D7CC: rts                                              ;Return from Subroutine
CheckForErrorsAndSetCodes_MM:
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_D815 ;(01000000)  ;Branch if Bit(s) Clear
          ldd     KeyOnOrEngineRunningTime                 ;Load Double Accumulator D
          cmpa    #0x0B ;(00001011)                        ;Compare A to Memory
;   31 sec
          bcs     Lbl_D815                                 ;Branch if Lower
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_CoolantTempLimitforErrorCodeSetting ;(0xB0/117.49 deg)  ;Compare A to Memory
          bcs     Lbl_D815                                 ;Branch if Lower
          bitb    #0x1F ;(00011111)                        ;Bit(s) Test B with Memory
          bne     Lbl_D815                                 ;Branch if Not = Zero
          brset   *BitFlags27, #b0_27_cfg_ATX, Lbl_D7EA ;(00000001)  ;Branch if Bit(s) Set
          brclr   *BitFlags68_t3, #b4_25_ATXInGear, Lbl_D815 ;(00010000)  ;Branch if Bit(s) Clear
Lbl_D7EA: brset   *StartupSwitchMirror1, #b5_61_Brake, Lbl_D815 ;(00100000)  ;Branch if Bit(s) Set
          brclr   *BitFlags66_t3, #b7_22_Offidle, Lbl_D815 ;(10000000)  ;Branch if Bit(s) Clear
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    TL_RPMLimitforErrorCodeSetting ;(0x38/1799.03 rpm)  ;Compare A to Memory
          bcs     Lbl_D815                                 ;Branch if Lower
          ldaa    MapVolts                                 ;Load Accumulator A
          cmpa    TL_MAPLimitforErrorCodeSetting ;(0x70/-8.24 psi)  ;Compare A to Memory
          bcc     Lbl_D815                                 ;Branch if Higher or Same
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
;   1 mph
          bcc     Lbl_D815                                 ;Branch if Higher or Same
          brset   *b5D_IPL2_t3, #b4_D6_MajorFault, Lbl_D815 ;(00010000)  ;Branch if Bit(s) Set
          ldd     #0x23A0                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D815                                 ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b4_D6_MajorFault ;(00010000)  ;Set Bit(s)
Lbl_D815: rts                                              ;Return from Subroutine
ThrowMajorErrorIfRequired_MM:
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          beq     Lb15f_tsbec                              ;Branch if = Zero
          rts                                              ;Return from Subroutine
Lb15f_tsbec:
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Ld825 ;(01000000)  ;Branch if Bit(s) Set
          jmp     Lbl_D868                                 ;Jump
Ld825:    ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    #0x2C ;(00101100)                        ;Compare A to Memory
;   12.4 sec
          bcs     Lbl_D868                                 ;Branch if Lower
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    #0xCD ;(11001101)                        ;Compare A to Memory
;   169 deg  sbec tbl CTLRPM_LowBatteryVoltageAtThisCoolantTemp
          bcs     Lbl_D868                                 ;Branch if Lower
          brclr   *BitFlags2e, #b2_2E_EGRFault, Lbl_D86D ;(00000100)  ;Branch if Bit(s) Clear
          ldaa    Counter_O2Diagnostics                    ;Load Accumulator A
          cmpa    #0x13 ;(00010011)                        ;Compare A to Memory
;   sbec tbl O2DIAG_CounterLimitForO2SensorDiag
          bcs     Lbl_D863                                 ;Branch if Lower
          ldaa    O2SensorVolts                            ;Load Accumulator A
          cmpa    #0x4D ;(01001101)                        ;Compare A to Memory
;   1.5 volts  sbec tbl O2MID_LimitForO2SensorBatteryDiag
          bcs     Lbl_D868                                 ;Branch if Lower
          ldaa    Timer_O2MiddleDiagnostics                ;Load Accumulator A
          cmpa    #0x2A ;(00101010)                        ;Compare A to Memory
          bcs     Lbl_D858                                 ;Branch if Lower
          brset   *b5d_IPL2, #b1_D7_bt1, Lbl_D856 ;(00000010)  ;Branch if Bit(s) Set
          ldd     #0x2081                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D8C6                                 ;Branch if Higher or Same
          bset    *b5d_IPL2, #b1_D7_bt1 ;(00000010)        ;Set Bit(s)
Lbl_D856: bra     Lbl_D8C6                                 ;Branch Always
Lbl_D858: ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x7F ;(01111111)                        ;Bit(s) Test B with Memory
          bne     Lbl_D8C6                                 ;Branch if Not = Zero
          inca                                             ;Increment Accumulator A
          staa    Timer_O2MiddleDiagnostics                ;Store Accumulator A
          bra     Lbl_D8C6                                 ;Branch Always
Lbl_D863: inca                                             ;Increment Accumulator A
          staa    Counter_O2Diagnostics                    ;Store Accumulator A
          bra     Lbl_D8C6                                 ;Branch Always
Lbl_D868: bclr    *BitFlags2e, #b2_2E_EGRFault ;(00000100)  ;Clear Bits(s)
          bra     Lbl_D89D                                 ;Branch Always
Lbl_D86D: ldaa    O2SensorVolts                            ;Load Accumulator A
          cmpa    TL_HighLimitForImmediateSwitchToClosedLoop ;(0x22/.67 volts)  ;Compare A to Memory
          bhi     Lbl_D89D                                 ;Branch if Higher
          cmpa    TL_LowLimitForImmediateSwitchToClosedLoop ;(0x14/.39 volts)  ;Compare A to Memory
          bcs     Lbl_D89D                                 ;Branch if Lower
          ldaa    Timer_O2MiddleDiagnostics                ;Load Accumulator A
          cmpa    #0x15 ;(00010101)                        ;Compare A to Memory
          bcs     Lbl_D894                                 ;Branch if Lower
          bset    *BitFlags2e, #b2_2E_EGRFault ;(00000100)  ;Set Bit(s)
          clra                                             ;Clear Accumulator A
          staa    Timer_O2MiddleDiagnostics                ;Store Accumulator A
          staa    Counter_O2Diagnostics                    ;Store Accumulator A
          sei                                              ;Set Mask Disable Int
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x08 ;(00001000)                        ;OR Accumulator A (Inclusive)
;   set fuelmon bit
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          bra     Lbl_D8C6                                 ;Branch Always
Lbl_D894: ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x7F ;(01111111)                        ;Bit(s) Test B with Memory
          bne     Lbl_D8A0                                 ;Branch if Not = Zero
          inca                                             ;Increment Accumulator A
          bra     Lbl_D89E                                 ;Branch Always
Lbl_D89D: clra                                             ;Clear Accumulator A
Lbl_D89E: staa    Timer_O2MiddleDiagnostics                ;Store Accumulator A
Lbl_D8A0: sei                                              ;Set Mask Disable Int
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0xF7 ;(11110111)                        ;AND A with Memory
;   clear fuelmon bit
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x0F ;(00001111)                        ;Bit(s) Test A with Memory
          bne     Lbl_D8C6                                 ;Branch if Not = Zero
          brset   *b5d_IPL2, #b2_D7_BadO2, Lbl_D8C6 ;(00000100)  ;Branch if Bit(s) Set
          ldaa    O2SensorVolts                            ;Load Accumulator A
          cmpa    #0x3E ;(00111110)                        ;Compare A to Memory
;   1.2 volts  sbec tbl O2MIDX_HighLimitForInMiddleDeterminationX
          bls     Lbl_D8C6                                 ;Branch if Lower or Same
          ldd     #0x3E8F                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D8C6                                 ;Branch if Higher or Same
          bset    *b5d_IPL2, #b2_D7_BadO2 ;(00000100)      ;Set Bit(s)
Lbl_D8C6: rts                                              ;Return from Subroutine
ld8c7_MM: ldaa    ATMOffset                                ;Load Accumulator A
          cmpa    #0x0D ;(00001101)                        ;Compare A to Memory
          beq     Lbl_D8FE                                 ;Branch if = Zero
          brset   *b5d_IPL2, #b4_D7_BadBattVolts, Lbl_D8FE ;(00010000)  ;Branch if Bit(s) Set
          sei                                              ;Set Mask Disable Int
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_D8FE                                 ;Branch if = Zero
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_D8FE                                 ;Branch if Not = Zero
          brset   *PIA2_Buffer_t3, #b4_CE_ASD, Lbl_D8FE ;(00010000)  ;Branch if Bit(s) Set
          brclr   *BitFlags2e, #b5_2E_bt5, Lbl_D8F8 ;(00100000)  ;Branch if Bit(s) Clear
          lsra                                             ;Logical Shift Right A
          eora    BitFlags24                               ;Exclusive OR A with Memory
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          cli                                              ;Clear Mask Enable Int
          beq     Lbl_D8F8                                 ;Branch if = Zero
          ldd     #0x0BA0                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D8F8                                 ;Branch if Higher or Same
          bset    *b5d_IPL2, #b4_D7_BadBattVolts ;(00010000)  ;Set Bit(s)
Lbl_D8F8: cli                                              ;Clear Mask Enable Int
          bset    *BitFlags2e, #b5_2E_bt5 ;(00100000)      ;Set Bit(s)
          bra     Lbl_D902                                 ;Branch Always
Lbl_D8FE: cli                                              ;Clear Mask Enable Int
          bclr    *BitFlags2e, #b5_2E_bt5 ;(00100000)      ;Clear Bits(s)
Lbl_D902: rts                                              ;Return from Subroutine
VerifyOperationOfASDRelayAndO2Sensor_MM:
          brclr   *BitFlags2e, #b1_2E_bt1, Lbl_D929 ;(00000010)  ;Branch if Bit(s) Clear
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    #0x82 ;(10000010)                        ;Compare A to Memory
;   8.1 volts
          bcs     Lbl_D928                                 ;Branch if Lower
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x04 ;(00000100)                        ;Bit(s) Test A with Memory
          bne     Lbl_D928                                 ;Branch if Not = Zero
          ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          bne     Lbl_D928                                 ;Branch if Not = Zero
          brset   *DistributorFallingEdgePulsewidth_HB, #$%10000000, Lbl_D928 ;Branch if Bit(s) Set
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x50 ;(01010000)                        ;Bit(s) Test A with Memory
          bne     Lbl_D928                                 ;Branch if Not = Zero
          ldd     #0x2C14                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
Lbl_D928: rts                                              ;Return from Subroutine
Lbl_D929: bset    *BitFlags2e, #b1_2E_bt1 ;(00000010)      ;Set Bit(s)
          rts                                              ;Return from Subroutine
LD92D_Subroutine:
          ldaa    BitFlags608D                             ;Load Accumulator A
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          inca                                             ;Increment Accumulator A
          cmpa    TL_DeltaMapThatChecksGoodX ;(0x05/-14.41 psi)  ;Compare A to Memory
          bcc     Lbl_D93D                                 ;Branch if Higher or Same
          inc     BitFlags608D                             ;Increment Memory Byte
          jmp     Return_d9bb                              ;Jump
Lbl_D93D: ldaa    BitFlags608D                             ;Load Accumulator A
          anda    #0xF0 ;(11110000)                        ;AND A with Memory
          staa    BitFlags608D                             ;Store Accumulator A
          ldaa    MapVolts_X                               ;Load Accumulator A
          suba    MapValue3                                ;Subtract Memory from A
          ldab    ADR1_A2DResults1                         ;Load Accumulator B
          stab    MapVolts_X                               ;Store Accumulator B
          stab    MapValue3                                ;Store Accumulator B
          brset   *b5C_IPL1_t3, #b7_D5_MapStuck, Lbl_D979 ;(10000000)  ;Branch if Bit(s) Set
          cmpa    TL_DeltaMapThatChecksGood ;(0x01/-14.64 psi)  ;Compare A to Memory
          bcc     Return_d9bb                              ;Branch if Higher or Same
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          cmpd    TL_DisableMapCheckUnderThisRpm_600 ;(0x12C0/600.01 RPM)  ;Compare D to Memory 16-Bit
          bcs     Return_d9bb                              ;Branch if Lower
          cmpd    TL_DisableMapCheckAboveThisRpm_1500 ;(0x2EE0/1500.02 RPM)  ;Compare D to Memory 16-Bit
          bcc     Return_d9bb                              ;Branch if Higher or Same
          ldaa    MapVolts_X                               ;Load Accumulator A
          cmpa    TL_DisableMapCheckBelowThisMap ;(0x12/-13.66 psi)  ;Compare A to Memory
          bcs     Return_d9bb                              ;Branch if Lower
          cmpa    TL_DisableMapCheckAboveThisMap ;(0xF7/-.46 psi)  ;Compare A to Memory
          bcc     Return_d9bb                              ;Branch if Higher or Same
          ldaa    Ram_F3                                   ;Load Accumulator A
          oraa    #0x80 ;(10000000)                        ;OR Accumulator A (Inclusive)
          staa    Ram_F3                                   ;Store Accumulator A
          bra     Return_d9bb                              ;Branch Always
Lbl_D979: ldab    BitFlags608D                             ;Load Accumulator B
          addb    #0x10 ;(00010000)                        ;Add Memory to B
          bcc     Lbl_D981                                 ;Branch if Higher or Same
          orab    #0xF0 ;(11110000)                        ;OR Accumulator B (Inclusive)
Lbl_D981: stab    BitFlags608D                             ;Store Accumulator B
          suba    TL_DeltaMapThatChecksGood ;(0x01/-14.64 psi)  ;Subtract Memory from A
          bcs     Return_d9bb                              ;Branch if Lower
          cmpa    TL_MatureMapLimpinWhenDeltaAbove_MPDELT_plus_MPDELA ;(0x02/-14.58 psi)  ;Compare A to Memory
          bcs     Return_d9bb                              ;Branch if Lower
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          bne     Lbl_D9A3                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_D9A3 ;(10000000)  ;Branch if Bit(s) Set
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          subd    TargetIdleSpeedHB                        ;Subtract Memory from D
          bcc     Lbl_D99D                                 ;Branch if Higher or Same
          coma                                             ;1's Complement A
          comb                                             ;1's Complement B
Lbl_D99D: cmpd    TL_CheckMapAtZeroSpeedAndThisDeltaRpm ;(0x0200/1.99 out)  ;Compare D to Memory 16-Bit
          bcs     Return_d9bb                              ;Branch if Lower
Lbl_D9A3: ldab    TL_DeltaMapThatChecksGoodX ;(0x05/-14.41 psi)  ;Load Accumulator B
          ldx     #TL_NotSure2                             ;Load Index Register X
          abx                                              ;Add B to X
          ldaa    0x00, X                                  ;Load Accumulator A
          cmpa    BitFlags608D                             ;Compare A to Memory
          bhi     Return_d9bb                              ;Branch if Higher
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          jsr     ResetErrorCodeIfTimerExpired             ;Jump to Subroutine
          ldaa    BitFlags608D                             ;Load Accumulator A
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          staa    BitFlags608D                             ;Store Accumulator A
Return_d9bb:
          rts                                              ;Return from Subroutine
VerifyOperationOfMapSensor_MM:
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x07 ;(00000111)                        ;Bit(s) Test A with Memory
          bne     Lbl_DA15                                 ;Branch if Not = Zero
          brset   *b5C_IPL1_t3, #b7_D5_MapStuck, Lbl_D9FD ;(10000000)  ;Branch if Bit(s) Set
          tst     VehicleSpeedx8_Scaled                    ;Test for Zero or Minus
          bne     Lbl_D9FD                                 ;Branch if Not = Zero
          brset   *BitFlags66_t3, #b7_22_Offidle, Lbl_D9FD ;(10000000)  ;Branch if Bit(s) Set
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          subd    TargetIdleSpeedHB                        ;Subtract Memory from D
          bcc     Lbl_D9D7                                 ;Branch if Higher or Same
          coma                                             ;1's Complement A
          comb                                             ;1's Complement B
Lbl_D9D7: cmpd    TL_CheckMapAtZeroSpeedAndThisDeltaRpm ;(0x0200/1.99 out)  ;Compare D to Memory 16-Bit
          bcc     Lbl_D9FD                                 ;Branch if Higher or Same
          ldaa    BaroPressure                             ;Load Accumulator A
          suba    MapValue                                 ;Subtract Memory from A
;   BP - MV = vacuum  e.g. 14.7 - 5.4 (map reading) = 9.3 (calculated vacuum)
          bcs     Lbl_D9F2                                 ;Branch if Lower
          ldab    BaroPressure                             ;Load Accumulator B
          ldx     #TL_AllowMapToTestGoodThisNearBaro ;(0x21/-12.80 psi)  ;Load Index Register X
          cmpb    TL_CheckMapAtZeroSpeedAndThisBaroSwitch ;(0xCE/-2.82 psi)  ;Compare B to Memory
          bcc     Lbl_D9EE                                 ;Branch if Higher or Same
          inx                                              ;Increment Index Register X
Lbl_D9EE: cmpa    0x00, X                                  ;Compare A to Memory
          bcc     Lbl_D9FD                                 ;Branch if Higher or Same
Lbl_D9F2: ldd     #0x2794                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_D9FD                                 ;Branch if Higher or Same
          bset    *b5C_IPL1_t3, #b7_D5_MapStuck ;(10000000)  ;Set Bit(s)
Lbl_D9FD: brclr   *BitFlags2e, #b7_2E_MapMaybe, Lbl_DA17 ;(10000000)  ;Branch if Bit(s) Clear
          sei                                              ;Set Mask Disable Int
Lbl_DA02: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_DA02                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cli                                              ;Clear Mask Enable Int
          cmpa    TL_MapSensorMiddleLimit ;(0x66/2.00 volts)  ;Compare A to Memory
          bcs     Lbl_DA51                                 ;Branch if Lower
          cmpa    TL_MapSensorUpperLimit ;(0xFD/4.96 volts)  ;Compare A to Memory
          bcs     Lbl_DA56                                 ;Branch if Lower
Lbl_DA15: bra     Lbl_DA51                                 ;Branch Always
Lbl_DA17: ldx     EngineRpm_HB                             ;Load Index Register X
          cpx     #0x0C80                                  ;Compare X to Memory 16-Bit
;   400 rpm
          bcs     Lbl_DA51                                 ;Branch if Lower
          cpx     #0x2EE0                                  ;Compare X to Memory 16-Bit
;   1500 rpm
          bcc     Lbl_DA51                                 ;Branch if Higher or Same
          ldaa    TpsVolts_Minus_LowestSessionTpsVolts     ;Load Accumulator A
          cmpa    #0x32 ;(00110010)                        ;Compare A to Memory
          bcc     Lbl_DA51                                 ;Branch if Higher or Same
          sei                                              ;Set Mask Disable Int
Lbl_DA2A: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_DA2A                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cli                                              ;Clear Mask Enable Int
          cmpa    TL_MapSensorUpperLimit ;(0xFD/4.96 volts)  ;Compare A to Memory
          bcc     Lbl_DA42                                 ;Branch if Higher or Same
          cmpa    TL_MapSensorLowerLimit ;(0x02/.04 volts)  ;Compare A to Memory
          bcc     Lbl_DA52                                 ;Branch if Higher or Same
          ldd     #0x2494                                  ;Load Double Accumulator D
          bra     Lbl_DA45                                 ;Branch Always
Lbl_DA42: ldd     #0x2594                                  ;Load Double Accumulator D
Lbl_DA45: brset   *b5C_IPL1_t3, #b3_D5_MapBadSignal, Lbl_DA51 ;(00001000)  ;Branch if Bit(s) Set
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_DA51                                 ;Branch if Higher or Same
          bset    *b5C_IPL1_t3, #b3_D5_MapBadSignal ;(00001000)  ;Set Bit(s)
Lbl_DA51: rts                                              ;Return from Subroutine
Lbl_DA52: brclr   *b5C_IPL1_t3, #b3_D5_MapBadSignal, Lbl_DA51 ;(00001000)  ;Branch if Bit(s) Clear
Lbl_DA56: ldaa    #0x04 ;(00000100)                        ;Load Accumulator A
          jsr     ResetErrorCodeIfTimerExpired             ;Jump to Subroutine
          brset   *b5C_IPL1_t3, #b3_D5_MapBadSignal, Lbl_DA51 ;(00001000)  ;Branch if Bit(s) Set
          bclr    *BitFlags2e, #b7_2E_MapMaybe ;(10000000)  ;Clear Bits(s)
          bra     Lbl_DA51                                 ;Branch Always
DetectAlternatorFault_MM:
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x1F ;(00011111)                        ;Bit(s) Test A with Memory
          bne     Lbl_DA8B                                 ;Branch if Not = Zero
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_DA8B ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    BatteryVolts                             ;Load Accumulator A
          suba    TargetBatteryVolts                       ;Subtract Memory from A
          bcs     Lbl_DA88                                 ;Branch if Lower
          cmpa    #0x10 ;(00010000)                        ;Compare A to Memory
          bcs     Lbl_DA88                                 ;Branch if Lower
          brset   *b5C_IPL1_t3, #b5_D5_BattNotCharging, Lbl_DA8B ;(00100000)  ;Branch if Bit(s) Set
          ldd     #0x06A0                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_DA8B                                 ;Branch if Higher or Same
          bset    *b5C_IPL1_t3, #b5_D5_BattNotCharging ;(00100000)  ;Set Bit(s)
          rts                                              ;Return from Subroutine
Lbl_DA88: bclr    *b5C_IPL1_t3, #b5_D5_BattNotCharging ;(00100000)  ;Clear Bits(s)
Lbl_DA8B: rts                                              ;Return from Subroutine
VerifyOperationOfThermostat_MM:
          brset   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, Lbl_DAC1 ;(00000010)  ;Branch if Bit(s) Set
          ldaa    CoolantTemp                              ;Load Accumulator A
          cmpa    TL_TstatDiagnosticsTemperatureGoalWithin_HOTIME ;(0xCF/173.41 deg)  ;Compare A to Memory
          bcs     Lbl_DA9C                                 ;Branch if Lower
          bset    *BitFlags6d_t3, #b1_28_bt1 ;(00000010)   ;Set Bit(s)
          bra     Lbl_DAC1                                 ;Branch Always
Lbl_DA9C: brset   *BitFlags6d_t3, #b1_28_bt1, Lbl_DAC1 ;(00000010)  ;Branch if Bit(s) Set
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_DAC1 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    #0xFF ;(11111111)                        ;Compare A to Memory
;   720 sec
          bne     Lbl_DAC1                                 ;Branch if Not = Zero
          ldaa    VehicleSpeedx8_Scaled                    ;Load Accumulator A
          cmpa    TL_TstatVehicleSpeedCompare ;(0x32/25.10 mph)  ;Compare A to Memory
          bcs     Lbl_DAC1                                 ;Branch if Lower
          ldab    Timer_ThermostatDiagnostics              ;Load Accumulator B
          cmpb    TL_TstatDiagnosticsTimeToAchieveTemperatureGoal ;(0xAA/170.00 out)  ;Compare B to Memory
          beq     Lbl_DAC2                                 ;Branch if = Zero
          ldaa    Counter_MainLoop                         ;Load Accumulator A
          bne     Lbl_DAC1                                 ;Branch if Not = Zero
          incb                                             ;Increment Accumulator B
          stab    Timer_ThermostatDiagnostics              ;Store Accumulator B
Lbl_DAC1: rts                                              ;Return from Subroutine
Lbl_DAC2: ldd     #0x2101                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_DACD                                 ;Branch if Higher or Same
          bset    *BitFlags6d_t3, #b1_28_bt1 ;(00000010)   ;Set Bit(s)
Lbl_DACD: rts                                              ;Return from Subroutine
DRB_SomethingLikeEMR_MM:
          brset   *BitFlags2d, #b3_2D_EMR_1, Lbl_DB01 ;(00001000)  ;Branch if Bit(s) Set
          brclr   *BitFlags2d, #b2_2D_a6cb1, Lbl_DB01 ;(00000100)  ;Branch if Bit(s) Clear
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_DB01 ;(01000000)  ;Branch if Bit(s) Clear
          sei                                              ;Set Mask Disable Int
          ldaa    BitFlags6a_t3                            ;Load Accumulator A
          bita    #0x60 ;(01100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_DAFF                                 ;Branch if Not = Zero
          bset    *BitFlags2d, #b3_2D_EMR_1 ;(00001000)    ;Set Bit(s)
          ldx     #0xB613                                  ;Load Index Register X
          ldaa    0x00, X                                  ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_DAFF                                 ;Branch if = Zero
          cmpa    TL_TL_883A ;(0x07/7.00 Y units)          ;Compare A to Memory
          bcs     Lbl_DAF4                                 ;Branch if Lower
          bset    *BitFlags2d, #b1_2D_a6cb3 ;(00000010)    ;Set Bit(s)
Lbl_DAF4: staa    DRBOffsetStored_LB                       ;Store Accumulator A
          ldaa    #0x13 ;(00010011)                        ;Load Accumulator A
          staa    DRBOffsetStored_HB                       ;Store Accumulator A
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
Lbl_DAFF: cli                                              ;Clear Mask Enable Int
          nop                                              ;No Operation
Lbl_DB01: sei                                              ;Set Mask Disable Int
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_DB84 ;(01000000)  ;Branch if Bit(s) Set
          ldx     #0xB616                                  ;Load Index Register X
          brclr   *BitFlags2d, #b4_2D_a71b5, Lbl_DB45 ;(00010000)  ;Branch if Bit(s) Clear
          brset   *BitFlags2d, #b0_2D_a6cb2, Lbl_DB45 ;(00000001)  ;Branch if Bit(s) Set
          ldaa    #0x16 ;(00010110)                        ;Load Accumulator A
          ldab    #0x4A ;(01001010)                        ;Load Accumulator B
          brclr   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_DB3C ;(00100000)  ;Branch if Bit(s) Clear
          cmpa    DRBOffsetStored_HB                       ;Compare A to Memory
          beq     Lbl_DB35                                 ;Branch if = Zero
          inca                                             ;Increment Accumulator A
          cmpa    DRBOffsetStored_HB                       ;Compare A to Memory
          bne     Lbl_DB45                                 ;Branch if Not = Zero
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          bclr    *BitFlags6a_t3, #b5_26_drbToggle2 ;(00100000)  ;Clear Bits(s)
          bset    *BitFlags2d, #b0_2D_a6cb2 ;(00000001)    ;Set Bit(s)
          ldaa    #0x13 ;(00010011)                        ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          stab    Counter_ACControl1                       ;Store Accumulator B
          bra     Lbl_DB3F                                 ;Branch Always
Lbl_DB35: bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          inca                                             ;Increment Accumulator A
          comb                                             ;1's Complement B
          bra     Lbl_DB3F                                 ;Branch Always
Lbl_DB3C: bset    *BitFlags6a_t3, #b6_26_drbToggle1| b5_26_drbToggle2 ;(01100000)  ;Set Bit(s)
Lbl_DB3F: staa    DRBOffsetStored_HB                       ;Store Accumulator A
          stab    DRBOffsetStored_LB                       ;Store Accumulator B
Lbl_DB45: ldaa    0x01, X                                  ;Load Accumulator A
          coma                                             ;1's Complement A
          cmpa    0x00, X                                  ;Compare A to Memory
          bne     Lbl_DB55                                 ;Branch if Not = Zero
          cmpa    #0x4A ;(01001010)                        ;Compare A to Memory
          bne     Lbl_DB55                                 ;Branch if Not = Zero
          bset    *BitFlags2d, #b2_2D_a6cb1 ;(00000100)    ;Set Bit(s)
          bra     Lbl_DB58                                 ;Branch Always
Lbl_DB55: bclr    *BitFlags2d, #b2_2D_a6cb1 ;(00000100)    ;Clear Bits(s)
Lbl_DB58: cli                                              ;Clear Mask Enable Int
          brclr   *BitFlags2d, #b1_2D_a6cb3, Lbl_DB85 ;(00000010)  ;Branch if Bit(s) Clear
          sei                                              ;Set Mask Disable Int
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_DB84 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    #0x16 ;(00010110)                        ;Load Accumulator A
          ldab    #0xEE ;(11101110)                        ;Load Accumulator B
          brclr   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_DB7B ;(00100000)  ;Branch if Bit(s) Clear
          cmpa    DRBOffsetStored_HB                       ;Compare A to Memory
          bne     Lbl_DB84                                 ;Branch if Not = Zero
          inca                                             ;Increment Accumulator A
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          bclr    *BitFlags6a_t3, #b5_26_drbToggle2 ;(00100000)  ;Clear Bits(s)
          bclr    *BitFlags2d, #b1_2D_a6cb3 ;(00000010)    ;Clear Bits(s)
          bra     Lbl_DB7E                                 ;Branch Always
Lbl_DB7B: bset    *BitFlags6a_t3, #b6_26_drbToggle1| b5_26_drbToggle2 ;(01100000)  ;Set Bit(s)
Lbl_DB7E: staa    DRBOffsetStored_HB                       ;Store Accumulator A
          stab    DRBOffsetStored_LB                       ;Store Accumulator B
Lbl_DB84: cli                                              ;Clear Mask Enable Int
Lbl_DB85: rts                                              ;Return from Subroutine
DRB_SomethingLikeEMR2_MM:
          brset   *BitFlags21, #b2_21_bt2, Lbl_DBB9 ;(00000100)  ;Branch if Bit(s) Set
          brclr   *BitFlags21, #b1_21_bt1, Lbl_DBB9 ;(00000010)  ;Branch if Bit(s) Clear
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_DBB9 ;(01000000)  ;Branch if Bit(s) Clear
          sei                                              ;Set Mask Disable Int
          ldaa    BitFlags6a_t3                            ;Load Accumulator A
          bita    #0x60 ;(01100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_DBB7                                 ;Branch if Not = Zero
          bset    *BitFlags21, #b2_21_bt2 ;(00000100)      ;Set Bit(s)
          ldx     #0xB6E0                                  ;Load Index Register X
          ldaa    0x00, X                                  ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_DBB7                                 ;Branch if = Zero
          cmpa    TL_TL_8AA2 ;(0x14/20.00 Y units)         ;Compare A to Memory
          bcs     Lbl_DBAC                                 ;Branch if Lower
          bset    *IPL1, #b3_20_bt3 ;(00001000)            ;Set Bit(s)
Lbl_DBAC: staa    DRBOffsetStored_LB                       ;Store Accumulator A
          ldaa    #0xE0 ;(11100000)                        ;Load Accumulator A
          staa    DRBOffsetStored_HB                       ;Store Accumulator A
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
Lbl_DBB7: cli                                              ;Clear Mask Enable Int
          nop                                              ;No Operation
Lbl_DBB9: sei                                              ;Set Mask Disable Int
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_DC39 ;(01000000)  ;Branch if Bit(s) Set
          ldx     #0xB6E1                                  ;Load Index Register X
          brclr   *BitFlags2d, #b4_2D_a71b5, Lbl_DBFA ;(00010000)  ;Branch if Bit(s) Clear
          brset   *BitFlags21, #b0_21_bt0, Lbl_DBFA ;(00000001)  ;Branch if Bit(s) Set
          ldaa    #0xE1 ;(11100001)                        ;Load Accumulator A
          ldab    #0x4A ;(01001010)                        ;Load Accumulator B
          brclr   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_DBF1 ;(00100000)  ;Branch if Bit(s) Clear
          cmpa    DRBOffsetStored_HB                       ;Compare A to Memory
          beq     Lbl_DBEA                                 ;Branch if = Zero
          inca                                             ;Increment Accumulator A
          cmpa    DRBOffsetStored_HB                       ;Compare A to Memory
          bne     Lbl_DBFA                                 ;Branch if Not = Zero
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          bclr    *BitFlags6a_t3, #b5_26_drbToggle2 ;(00100000)  ;Clear Bits(s)
          bset    *BitFlags21, #b0_21_bt0 ;(00000001)      ;Set Bit(s)
          ldaa    #0xE0 ;(11100000)                        ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          bra     Lbl_DBF4                                 ;Branch Always
Lbl_DBEA: bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          inca                                             ;Increment Accumulator A
          comb                                             ;1's Complement B
          bra     Lbl_DBF4                                 ;Branch Always
Lbl_DBF1: bset    *BitFlags6a_t3, #b6_26_drbToggle1| b5_26_drbToggle2 ;(01100000)  ;Set Bit(s)
Lbl_DBF4: staa    DRBOffsetStored_HB                       ;Store Accumulator A
          stab    DRBOffsetStored_LB                       ;Store Accumulator B
Lbl_DBFA: ldaa    0x01, X                                  ;Load Accumulator A
          coma                                             ;1's Complement A
          cmpa    0x00, X                                  ;Compare A to Memory
          bne     Lbl_DC0A                                 ;Branch if Not = Zero
          cmpa    #0x4A ;(01001010)                        ;Compare A to Memory
          bne     Lbl_DC0A                                 ;Branch if Not = Zero
          bset    *BitFlags21, #b1_21_bt1 ;(00000010)      ;Set Bit(s)
          bra     Lbl_DC0D                                 ;Branch Always
Lbl_DC0A: bclr    *BitFlags21, #b1_21_bt1 ;(00000010)      ;Clear Bits(s)
Lbl_DC0D: cli                                              ;Clear Mask Enable Int
          brclr   *IPL1, #b3_20_bt3, Lbl_DC3A ;(00001000)  ;Branch if Bit(s) Clear
          sei                                              ;Set Mask Disable Int
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_DC39 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    #0xE1 ;(11100001)                        ;Load Accumulator A
          ldab    #0xEE ;(11101110)                        ;Load Accumulator B
          brclr   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_DC30 ;(00100000)  ;Branch if Bit(s) Clear
          cmpa    DRBOffsetStored_HB                       ;Compare A to Memory
          bne     Lbl_DC39                                 ;Branch if Not = Zero
          inca                                             ;Increment Accumulator A
          bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          bclr    *BitFlags6a_t3, #b5_26_drbToggle2 ;(00100000)  ;Clear Bits(s)
          bclr    *IPL1, #b3_20_bt3 ;(00001000)            ;Clear Bits(s)
          bra     Lbl_DC33                                 ;Branch Always
Lbl_DC30: bset    *BitFlags6a_t3, #b6_26_drbToggle1| b5_26_drbToggle2 ;(01100000)  ;Set Bit(s)
Lbl_DC33: staa    DRBOffsetStored_HB                       ;Store Accumulator A
          stab    DRBOffsetStored_LB                       ;Store Accumulator B
Lbl_DC39: cli                                              ;Clear Mask Enable Int
Lbl_DC3A: rts                                              ;Return from Subroutine
VerifyOperationOfBatteryVoltage_MM:
          brset   *BitFlags21, #b5_21_a70b2, Lbl_DCAF ;(00100000)  ;Branch if Bit(s) Set
          ldaa    b5d_IPL2                                 ;Load Accumulator A
          bita    #0x18 ;(00011000)                        ;Bit(s) Test A with Memory
          bne     Lbl_DCAF                                 ;Branch if Not = Zero
          ldaa    TargetBatteryVolts                       ;Load Accumulator A
          sei                                              ;Set Mask Disable Int
Lbl_DC48: ldab    ADCTL_A2DControlReg                      ;Load Accumulator B
          bpl     Lbl_DC48                                 ;Branch if Plus
          suba    ADR2_A2DResults2                         ;Subtract Memory from A
          cli                                              ;Clear Mask Enable Int
          bcs     Lbl_DCAF                                 ;Branch if Lower
          cmpa    TL_BatteryVoltsDiagLimitOverTarget ;(0x10/.31 volts)  ;Compare A to Memory
          bcs     Lbl_DCAF                                 ;Branch if Lower
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          cmpd    TL_LowBatteryVoltageAtThisRpm ;(0x2E/1477.77 RPM)  ;Compare D to Memory 16-Bit
          bcs     Lbl_DCAF                                 ;Branch if Lower
          ldaa    #0x0F ;(00001111)                        ;Load Accumulator A
          brclr   *BitFlags2e, #b0_2E_a70b1, Lbl_DC67 ;(00000001)  ;Branch if Bit(s) Clear
          clra                                             ;Clear Accumulator A
Lbl_DC67: anda    Counter_MainLoop                         ;AND A with Memory
          bne     Lbl_DC81                                 ;Branch if Not = Zero
          ldaa    BatVoltsDiagCounter                      ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_DC72                                 ;Branch if = Zero
          staa    BatVoltsDiagCounter                      ;Store Accumulator A
Lbl_DC72: brset   *BitFlags2e, #b0_2E_a70b1, Lbl_DC82 ;(00000001)  ;Branch if Bit(s) Set
          cmpa    TL_BatteryVoltsDiagCounterMax ;(0x8E/142.00 out)  ;Compare A to Memory
          bcs     Lbl_DC81                                 ;Branch if Lower
          clra                                             ;Clear Accumulator A
          staa    BatVoltsDiagCounter                      ;Store Accumulator A
          bset    *BitFlags2e, #b0_2E_a70b1 ;(00000001)    ;Set Bit(s)
Lbl_DC81: rts                                              ;Return from Subroutine
Lbl_DC82: brset   *BitFlags21, #b4_21_a70b3, Lbl_DC92 ;(00010000)  ;Branch if Bit(s) Set
          cmpa    TL_BatteryVoltsDiagCounterMax2 ;(0x7F/127.00 out)  ;Compare A to Memory
          bcs     Lbl_DC81                                 ;Branch if Lower
          clra                                             ;Clear Accumulator A
          staa    BatVoltsDiagCounter                      ;Store Accumulator A
          bset    *BitFlags21, #b4_21_a70b3 ;(00010000)    ;Set Bit(s)
          rts                                              ;Return from Subroutine
Lbl_DC92: cmpa    TL_BatteryVoltsDiagCounterMin ;(0x06/6.00 Y units)  ;Compare A to Memory
          bcs     Lbl_DC81                                 ;Branch if Lower
          clra                                             ;Clear Accumulator A
          staa    BatVoltsDiagCounter                      ;Store Accumulator A
          bclr    *BitFlags21, #b4_21_a70b3 ;(00010000)    ;Clear Bits(s)
          ldd     #0x058A                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_DC81                                 ;Branch if Higher or Same
          bset    *b5d_IPL2, #b3_D7_bt3 ;(00001000)        ;Set Bit(s)
          bclr    *BitFlags2e, #b0_2E_a70b1 ;(00000001)    ;Clear Bits(s)
          bclr    *BitFlags21, #b5_21_a70b2| b4_21_a70b3 ;(00110000)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbl_DCAF: clra                                             ;Clear Accumulator A
          staa    BatVoltsDiagCounter                      ;Store Accumulator A
          bclr    *BitFlags2e, #b0_2E_a70b1 ;(00000001)    ;Clear Bits(s)
          bclr    *BitFlags21, #b5_21_a70b2| b4_21_a70b3 ;(00110000)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
NULL_ROUTINE:
          ldy     #LDXi_6485                               ;Load Index Register Y
          brset   *DRBSerialMode, #b7_DB_FastSerial, Lbl_DD2A ;(10000000)  ;Branch if Bit(s) Set
          brclr   *DRBSerialMode, #b6_DB_ByteMode, Lbl_DD2A ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    BAUD_SerialBaudRate                      ;Load Accumulator A
          cmpa    #0x25 ;(00100101)                        ;Compare A to Memory
          bne     Lbl_DD29                                 ;Branch if Not = Zero
          ldab    SCDR_SerialData                          ;Load Accumulator B
          ldaa    SCSR_SerialStatus                        ;Load Accumulator A
          bita    #0x20 ;(00100000)                        ;Bit(s) Test A with Memory
          beq     Lbl_DD2E                                 ;Branch if = Zero
          bita    #0x0E ;(00001110)                        ;Bit(s) Test A with Memory
          bne     Lbl_DD25                                 ;Branch if Not = Zero
          brset   0x00, Y, #$%11100000, Lbl_DD4A           ;Branch if Bit(s) Set
          ldaa    #0xF8 ;(11111000)                        ;Load Accumulator A
          brset   0x00, Y, #$%10000000, Lbl_DCFC           ;Branch if Bit(s) Set
Ldce6_MM: deca                                             ;Decrement Accumulator A
          brset   0x00, Y, #$%01100000, Lbl_DCFC           ;Branch if Bit(s) Set
          ldaa    #0xF5 ;(11110101)                        ;Load Accumulator A
          brset   0x00, Y, #$%01000000, Lbl_DCFC           ;Branch if Bit(s) Set
          ldaa    #0xF3 ;(11110011)                        ;Load Accumulator A
          brset   0x00, Y, #$%00100000, Lbl_DCFC           ;Branch if Bit(s) Set
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
Lbl_DCFC: cba                                              ;Compare A to B
          bne     Lbl_DD2A                                 ;Branch if Not = Zero
          ldaa    LDXi_6485                                ;Load Accumulator A
          adda    #0x20 ;(00100000)                        ;Add Memory to A
          staa    LDXi_6485                                ;Store Accumulator A
          anda    #0xE0 ;(11100000)                        ;AND A with Memory
          cmpa    #0xA0 ;(10100000)                        ;Compare A to Memory
          bne     Lbl_DD25                                 ;Branch if Not = Zero
          ldaa    #0xE0 ;(11100000)                        ;Load Accumulator A
          staa    LDXi_6485                                ;Store Accumulator A
          ldaa    #0x52 ;(01010010)                        ;Load Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          ldd     SCSR_SerialStatus                        ;Load Double Accumulator D
          ldaa    #0xF8 ;(11111000)                        ;Load Accumulator A
          ldab    SCSR_SerialStatus                        ;Load Accumulator B
          staa    SCDR_SerialData                          ;Store Accumulator A
          bra     Lbl_DD25                                 ;Branch Always
Lbl_DD23: staa    DRBPointer1                              ;Store Accumulator A
Lbl_DD25: ldd     SCSR_SerialStatus                        ;Load Double Accumulator D
          pulx                                             ;Pull X from Stack (Hi First)
Lbl_DD29: rts                                              ;Return from Subroutine
Lbl_DD2A: clr     LDXi_6485                                ;Clear Memory Byte
          rts                                              ;Return from Subroutine
Lbl_DD2E: brset   0x00, Y, #$%11100000, Lbl_DD3A           ;Branch if Bit(s) Set
          brclr   0x00, Y, #$%11100000, Lbl_DD2A           ;Branch if Bit(s) Clear
          bra     Lbl_DD25                                 ;Branch Always
Lbl_DD3A: ldaa    DRBPointer1                              ;Load Accumulator A
          deca                                             ;Decrement Accumulator A
          cmpa    #0x20 ;(00100000)                        ;Compare A to Memory
          bne     Lbl_DD23                                 ;Branch if Not = Zero
          clra                                             ;Clear Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          staa    DRBPointer2                              ;Store Accumulator A
          staa    DRBSerialMode                            ;Store Accumulator A
          bra     Lbl_DD25                                 ;Branch Always
Lbl_DD4A: ldaa    #0x28 ;(00101000)                        ;Load Accumulator A
          staa    DRBPointer1                              ;Store Accumulator A
          brset   0x00, Y, #$%00001000, Lbl_DD98           ;Branch if Bit(s) Set
          brset   0x00, Y, #$%00010000, Lbl_DD60           ;Branch if Bit(s) Set
          bset    0x00, Y, #$%00010000                     ;Set Bit(s)
          stab    DRBPointer2                              ;Store Accumulator B
          bra     Lbl_DD25                                 ;Branch Always
Lbl_DD60: cmpb    DRBPointer2                              ;Compare B to Memory
          bne     Lbl_DD89                                 ;Branch if Not = Zero
          bclr    0x00, Y, #$%00010000                     ;Clear Bits(s)
          tba                                              ;Transfer B to A
          ldab    LDXi_6485                                ;Load Accumulator B
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          cmpb    #0x04 ;(00000100)                        ;Compare B to Memory
          beq     Lbl_DD7E                                 ;Branch if = Zero
          ldx     #UNe_6481                                ;Load Index Register X
          abx                                              ;Add B to X
          staa    0x00, X                                  ;Store Accumulator A
          inc     LDXi_6485                                ;Increment Memory Byte
          jmp     Lbl_DD25                                 ;Jump
Lbl_DD7E: cmpa    #0x12 ;(00010010)                        ;Compare A to Memory
          bne     Lbl_DD86                                 ;Branch if Not = Zero
          bclr    0x00, Y, #$%00000111                     ;Clear Bits(s)
Lbl_DD86: jmp     Lbl_DD25                                 ;Jump
Lbl_DD89: bset    0x00, Y, #$%00001000                     ;Set Bit(s)
          cmpb    #0x12 ;(00010010)                        ;Compare B to Memory
          bne     Lbl_DD9C                                 ;Branch if Not = Zero
Lbl_DD91: bset    0x00, Y, #$%00010000                     ;Set Bit(s)
          jmp     Lbl_DD25                                 ;Jump
Lbl_DD98: cmpb    #0x12 ;(00010010)                        ;Compare B to Memory
          beq     Lbl_DDA3                                 ;Branch if = Zero
Lbl_DD9C: bclr    0x00, Y, #$%00010000                     ;Clear Bits(s)
          jmp     Lbl_DD25                                 ;Jump
Lbl_DDA3: brclr   0x00, Y, #$%00010000, Lbl_DD91           ;Branch if Bit(s) Clear
          bclr    0x00, Y, #$%00011111                     ;Clear Bits(s)
          bra     Lbl_DD86                                 ;Branch Always
BYTE_MODE_SERIAL_CODE_DOWNLOAD_ROUTINE:
          brset   *DRBSerialMode, #b6_DB_ByteMode, Lbl_DDB6 ;(01000000)  ;Branch if Bit(s) Set
          rts                                              ;Return from Subroutine
Lbl_DDB3: jmp     Lbl_DF66                                 ;Jump
Lbl_DDB6: brset   *DRBSerialMode, #b6_DB_ByteMode| b5_DB_TestType3| b4_DB_TestType2, Lbl_DDB3 ;(01110000)  ;Branch if Bit(s) Set
          ldab    SCDR_SerialData                          ;Load Accumulator B
          ldaa    SCSR_SerialStatus                        ;Load Accumulator A
          bita    #0x20 ;(00100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_DDC5                                 ;Branch if Not = Zero
          rts                                              ;Return from Subroutine
Lbl_DDC5: ldx     #FDRVar0                                 ;Load Index Register X
          ldaa    0x00, X                                  ;Load Accumulator A
          bita    #0x03 ;(00000011)                        ;Bit(s) Test A with Memory
          beq     Lbl_DDD1                                 ;Branch if = Zero
          jmp     Lbl_DE33                                 ;Jump
Lbl_DDD1: cmpb    #0xF8 ;(11111000)                        ;Compare B to Memory
          bcc     Lbl_DDDC                                 ;Branch if Higher or Same
Lbl_DDD5: jsr     Lbl_DF94                                 ;Jump to Subroutine
          jsr     Lbl_DF6B                                 ;Jump to Subroutine
          rts                                              ;Return from Subroutine
Lbl_DDDC: tsta                                             ;Test for Zero or Minus
          bne     Lbl_DDE8                                 ;Branch if Not = Zero
          cmpb    #0xF8 ;(11111000)                        ;Compare B to Memory
          bne     Lbl_DDD5                                 ;Branch if Not = Zero
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          jmp     Lbl_DF64                                 ;Jump
Lbl_DDE8: cmpa    #0x80 ;(10000000)                        ;Compare A to Memory
          bne     Lbl_DDF5                                 ;Branch if Not = Zero
          cmpb    #0xF9 ;(11111001)                        ;Compare B to Memory
          bne     Lbl_DDD5                                 ;Branch if Not = Zero
          ldaa    #0xC0 ;(11000000)                        ;Load Accumulator A
          jmp     Lbl_DF64                                 ;Jump
Lbl_DDF5: cmpa    #0xC0 ;(11000000)                        ;Compare A to Memory
          bne     Lbl_DE02                                 ;Branch if Not = Zero
          cmpb    #0xFB ;(11111011)                        ;Compare B to Memory
          bne     Lbl_DDD5                                 ;Branch if Not = Zero
          ldaa    #0xE0 ;(11100000)                        ;Load Accumulator A
          jmp     Lbl_DF64                                 ;Jump
Lbl_DE02: cmpa    #0xE0 ;(11100000)                        ;Compare A to Memory
          bne     Lbl_DDD5                                 ;Branch if Not = Zero
          cmpb    #0xF8 ;(11111000)                        ;Compare B to Memory
          bne     Lbl_DE0F                                 ;Branch if Not = Zero
          ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
          jmp     Lbl_DF64                                 ;Jump
Lbl_DE0F: cmpb    #0xF9 ;(11111001)                        ;Compare B to Memory
          bne     Lbl_DE18                                 ;Branch if Not = Zero
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          jmp     Lbl_DF64                                 ;Jump
Lbl_DE18: cmpb    #0xFB ;(11111011)                        ;Compare B to Memory
          bne     Lbl_DDD5                                 ;Branch if Not = Zero
          ldy     EngineRpm_HB                             ;Load Index Register Y
          cpy     #0x0100                                  ;Compare Y to Memory 16-Bit
;   32 rpm
          bhi     Lbl_DE2A                                 ;Branch if Higher
          ldaa    #0x05 ;(00000101)                        ;Load Accumulator A
          jmp     Lbl_DF64                                 ;Jump
Lbl_DE2A: ldd     #0x0017                                  ;Load Double Accumulator D
          jsr     Lbl_DF6B                                 ;Jump to Subroutine
          jmp     Lbl_DF64                                 ;Jump
Lbl_DE33: bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_DE3A                                 ;Branch if = Zero
          jmp     Lbl_DE47                                 ;Jump
Lbl_DE3A: jmp     Lbl_DEF6                                 ;Jump
Lbl_DE3D: ldaa    SCSR_SerialStatus                        ;Load Accumulator A
          ldaa    SCDR_SerialData                          ;Load Accumulator A
          stab    SCDR_SerialData                          ;Store Accumulator B
          rts                                              ;Return from Subroutine
Lbl_DE47: lsla                                             ;Logical Shift Left A
          bcs     Lbl_DE9E                                 ;Branch if Lower
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_DE6F                                 ;Branch if Lower
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_DE64                                 ;Branch if Lower
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_DE5A                                 ;Branch if Lower
          stab    STe_648A                                 ;Store Accumulator B
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          bra     Lbl_DE99                                 ;Branch Always
Lbl_DE5A: stab    FDRVar3                                  ;Store Accumulator B
          jsr     Lbl_DF71                                 ;Jump to Subroutine
          ldaa    #0x20 ;(00100000)                        ;Load Accumulator A
          bra     Lbl_DE99                                 ;Branch Always
Lbl_DE64: ldy     FDRVar3                                  ;Load Index Register Y
          ldab    0x00, Y                                  ;Load Accumulator B
          ldaa    #0x40 ;(01000000)                        ;Load Accumulator A
          bra     Lbl_DE99                                 ;Branch Always
Lbl_DE6F: cmpb    #0xFE ;(11111110)                        ;Compare B to Memory
          beq     Lbl_DE80                                 ;Branch if = Zero
Lbl_DE73: jsr     Lbl_DF6B                                 ;Jump to Subroutine
          cmpb    #0x1B ;(00011011)                        ;Compare B to Memory
          bne     Lbl_DE7D                                 ;Branch if Not = Zero
          bset    *DRBSerialMode, #b6_DB_ByteMode ;(01000000)  ;Set Bit(s)
Lbl_DE7D: jmp     Lbl_DF66                                 ;Jump
Lbl_DE80: ldaa    0x00, X                                  ;Load Accumulator A
          bita    #0x04 ;(00000100)                        ;Bit(s) Test A with Memory
          beq     Lbl_DE97                                 ;Branch if = Zero
          ldy     EngineRpm_HB                             ;Load Index Register Y
          cpy     #0x0100                                  ;Compare Y to Memory 16-Bit
;   32 rpm
          bcs     Lbl_DE97                                 ;Branch if Lower
          ldab    #0x17 ;(00010111)                        ;Load Accumulator B
          jsr     Lbl_DF6B                                 ;Jump to Subroutine
          jmp     Lbl_DF66                                 ;Jump
Lbl_DE97: ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
Lbl_DE99: oraa    0x00, X                                  ;OR Accumulator A (Inclusive)
          jmp     Lbl_DF64                                 ;Jump
Lbl_DE9E: sei                                              ;Set Mask Disable Int
          ldy     FDRVar3                                  ;Load Index Register Y
          cpy     #0x9400                                  ;Compare Y to Memory 16-Bit
          bcc     Lbl_DEB6                                 ;Branch if Higher or Same
          stab    0x00, Y                                  ;Store Accumulator B
Lbl_DEAC: ldab    0x00, Y                                  ;Load Accumulator B
          jsr     Lbl_DF6B                                 ;Jump to Subroutine
          cli                                              ;Clear Mask Enable Int
          jmp     Lbl_DF66                                 ;Jump
Lbl_DEB6: ldx     #0x64D0                                  ;Load Index Register X
          ldy     #LDED9                                   ;Load Index Register Y
Lbl_DEBD: ldaa    0x00, Y                                  ;Load Accumulator A
          staa    0x00, X                                  ;Store Accumulator A
          inx                                              ;Increment Index Register X
          iny                                              ;Increment Index Register Y
          cpy     #0xDEF6                                  ;Compare Y to Memory 16-Bit
          bne     Lbl_DEBD                                 ;Branch if Not = Zero
          ldx     #0x64D0                                  ;Load Index Register X
          ldy     FDRVar3                                  ;Load Index Register Y
          jsr     0x00, X                                  ;Jump to Subroutine
          ldx     #FDRVar0                                 ;Load Index Register X
          bra     Lbl_DEAC                                 ;Branch Always
LDED9:    ldaa    #0xAA ;(10101010)                        ;Load Accumulator A
          staa    M99_D555                                 ;Store Accumulator A
          lsra                                             ;Logical Shift Right A
          staa    M99_AAAA                                 ;Store Accumulator A
          ldaa    #0xA0 ;(10100000)                        ;Load Accumulator A
          staa    M99_D555                                 ;Store Accumulator A
          stab    0x00, Y                                  ;Store Accumulator B
          ldx     #Ram_00                                  ;Load Index Register X
Lbl_DEED: cmpb    0x00, Y                                  ;Compare B to Memory
          beq     Lbl_DEF5                                 ;Branch if = Zero
          dex                                              ;Decrement Index Register X
          bne     Lbl_DEED                                 ;Branch if Not = Zero
Lbl_DEF5: rts                                              ;Return from Subroutine
Lbl_DEF6: lsla                                             ;Logical Shift Left A
          bcs     Lbl_DF32                                 ;Branch if Lower
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_DF24                                 ;Branch if Lower
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_DF1A                                 ;Branch if Lower
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_DF13                                 ;Branch if Lower
          lsla                                             ;Logical Shift Left A
          bcs     Lbl_DF0C                                 ;Branch if Lower
          stab    FDRVar2                                  ;Store Accumulator B
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          bra     Lbl_DF2D                                 ;Branch Always
Lbl_DF0C: stab    FDRVar1                                  ;Store Accumulator B
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          bra     Lbl_DF2D                                 ;Branch Always
Lbl_DF13: stab    STe_648A                                 ;Store Accumulator B
          ldaa    #0x20 ;(00100000)                        ;Load Accumulator A
          bra     Lbl_DF2D                                 ;Branch Always
Lbl_DF1A: stab    FDRVar3                                  ;Store Accumulator B
          jsr     Lbl_DF71                                 ;Jump to Subroutine
          ldaa    #0xC0 ;(11000000)                        ;Load Accumulator A
          bra     Lbl_DF2D                                 ;Branch Always
Lbl_DF24: cmpb    #0xFD ;(11111101)                        ;Compare B to Memory
          beq     Lbl_DF2B                                 ;Branch if = Zero
          jmp     Lbl_DE73                                 ;Jump
Lbl_DF2B: ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
Lbl_DF2D: oraa    0x00, X                                  ;OR Accumulator A (Inclusive)
          jmp     Lbl_DF64                                 ;Jump
Lbl_DF32: ldx     FDRVar3                                  ;Load Index Register X
          ldy     FDRVar1                                  ;Load Index Register Y
          ldab    SCDR_SerialData                          ;Load Accumulator B
          ldaa    0x00, X                                  ;Load Accumulator A
          staa    SCDR_SerialData                          ;Store Accumulator A
          inx                                              ;Increment Index Register X
          dey                                              ;Decrement Index Register Y
          bne     Lbl_DF4E                                 ;Branch if Not = Zero
          ldx     #FDRVar0                                 ;Load Index Register X
          jsr     Lbl_DF6B                                 ;Jump to Subroutine
          pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
Lbl_DF4E: stx     FDRVar3                                  ;Store Index Register X
          sty     FDRVar1                                  ;Store Index Register Y
          cba                                              ;Compare A to B
          bne     Lbl_DF5A                                 ;Branch if Not = Zero
          pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
Lbl_DF5A: ldaa    FDRVar0                                  ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          staa    FDRVar0                                  ;Store Accumulator A
          pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
Lbl_DF64: staa    0x00, X                                  ;Store Accumulator A
Lbl_DF66: jsr     Lbl_DE3D                                 ;Jump to Subroutine
          pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
Lbl_DF6B: clr     0x00, X                                  ;Clear Memory Byte
          bclr    *DRBSerialMode, #b6_DB_ByteMode ;(01000000)  ;Clear Bits(s)
          rts                                              ;Return from Subroutine
Lbl_DF71: pshx                                             ;Push X onto Stack (Lo First)
          ldx     FDRVar3                                  ;Load Index Register X
          cpx     #0x8000                                  ;Compare X to Memory 16-Bit
          bcs     Lbl_DF89                                 ;Branch if Lower
          cpx     #0xFFFF                                  ;Compare X to Memory 16-Bit
          bhi     Lbl_DF89                                 ;Branch if Higher
          cpx     #0xB600                                  ;Compare X to Memory 16-Bit
          bcs     Lbl_DF92                                 ;Branch if Lower
          cpx     #0xB800                                  ;Compare X to Memory 16-Bit
          bcc     Lbl_DF92                                 ;Branch if Higher or Same
Lbl_DF89: pulx                                             ;Pull X from Stack (Hi First)
          ldx     #FDRVar0                                 ;Load Index Register X
          jsr     Lbl_DF6B                                 ;Jump to Subroutine
          pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
Lbl_DF92: pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
Lbl_DF94: cmpb    #0x14 ;(00010100)                        ;Compare B to Memory
          beq     Lbl_DF99                                 ;Branch if = Zero
          rts                                              ;Return from Subroutine
Lbl_DF99: clr     FDRVar0                                  ;Clear Memory Byte
          ldab    #0x25 ;(00100101)                        ;Load Accumulator B
          stab    BAUD_SerialBaudRate                      ;Store Accumulator B
          ldab    LDXi_6485                                ;Load Accumulator B
          addb    #0x20 ;(00100000)                        ;Add Memory to B
          stab    LDXi_6485                                ;Store Accumulator B
          bset    *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2 ;(00110000)  ;Set Bit(s)
          ldd     SCSR_SerialStatus                        ;Load Double Accumulator D
          pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
CCDBusComs:
          ldab    #0x93 ;(10010011)                        ;Load Accumulator B
          ldaa    Temp0                                    ;Load Accumulator A
          bne     Lbl_DFBA                                 ;Branch if Not = Zero
          ldab    #0x80 ;(10000000)                        ;Load Accumulator B
Lbl_DFBA: aba                                              ;Add Accumulators
          adda    Temp1                                    ;Add Memory to A
          adda    Temp2                                    ;Add Memory to A
          staa    Temp3                                    ;Store Accumulator A
          tba                                              ;Transfer B to A
          ldab    #0x40 ;(01000000)                        ;Load Accumulator B
          ldy     #PORTA_PortA                             ;Load Index Register Y
          ldx     #SwitchPortAccessReg1                    ;Load Index Register X
          sei                                              ;Set Mask Disable Int
          bset    0x00, X, #$%00001000                     ;Set Bit(s)
          bclr    0x08, Y, #$%00100000                     ;Clear Bits(s)
          cmpb    SPSR_SerialPeripheralStatus              ;Compare B to Memory
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    Temp0                                    ;Load Accumulator A
Lbl_DFEC: brclr   0x00, X, #$%00001000, Lbl_DFF6           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_DFEC                                 ;Branch if Not = Zero
          jmp     Lbl_E08F                                 ;Jump
Lbl_DFF6: staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    Temp1                                    ;Load Accumulator A
Lbl_E00C: brclr   0x00, X, #$%00001000, Lbl_E016           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_E00C                                 ;Branch if Not = Zero
          jmp     Lbl_E08F                                 ;Jump
Lbl_E016: staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          staa    Temp1                                    ;Store Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    Temp2                                    ;Load Accumulator A
Lbl_E02C: brclr   0x00, X, #$%00001000, Lbl_E036           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_E02C                                 ;Branch if Not = Zero
          jmp     Lbl_E08F                                 ;Jump
Lbl_E036: staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
          ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          staa    Temp2                                    ;Store Accumulator A
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          ldaa    Temp3                                    ;Load Accumulator A
Lbl_E04C: brclr   0x00, X, #$%00001000, Lbl_E055           ;Branch if Bit(s) Clear
          decb                                             ;Decrement Accumulator B
          bne     Lbl_E04C                                 ;Branch if Not = Zero
          bra     Lbl_E08F                                 ;Branch Always
Lbl_E055: staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          bset    0x02, X, #$%00001000                     ;Set Bit(s)
          bclr    0x02, X, #$%00001000                     ;Clear Bits(s)
          nop                                              ;No Operation
Lbl_E05F: brset   0x29, Y, #$%10000000, Lbl_E069           ;Branch if Bit(s) Set
          decb                                             ;Decrement Accumulator B
          bne     Lbl_E05F                                 ;Branch if Not = Zero
          bra     Lbl_E08F                                 ;Branch Always
Lbl_E069: ldaa    SPDR_SerialPeripheralDataIO              ;Load Accumulator A
          bset    0x08, Y, #$%00100000                     ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
          suba    Temp0                                    ;Subtract Memory from A
          suba    Temp1                                    ;Subtract Memory from A
          suba    Temp2                                    ;Subtract Memory from A
          bne     Lbl_E091                                 ;Branch if Not = Zero
          ldaa    Temp0                                    ;Load Accumulator A
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          bne     Lbl_E091                                 ;Branch if Not = Zero
          bset    *CCDFlags5, #b6_E1_e1b6 ;(01000000)      ;Set Bit(s)
          brset   *CCDFlags6, #b7_F6_ae2b7, Lbl_E091 ;(10000000)  ;Branch if Bit(s) Set
          bset    *CCDFlags4_tsbec, #b4_FB_bt4 ;(00010000)  ;Set Bit(s)
Lbl_E08F: nop                                              ;No Operation
          cli                                              ;Clear Mask Enable Int
Lbl_E091: rts                                              ;Return from Subroutine
PrepareCCDDataForXmit_MM:
          ldab    Counter_MainLoop                         ;Load Accumulator B
          andb    #0x0F ;(00001111)                        ;AND B with Memory
          bne     Lbl_E0D5                                 ;Branch if Not = Zero
          brset   *CCDFlags4_tsbec, #b3_FB_addb2, Lbl_E0BC ;(00001000)  ;Branch if Bit(s) Set
          ldaa    KeyOnOrEngineRunningTime                 ;Load Accumulator A
          cmpa    #0x83 ;(10000011)                        ;Compare A to Memory
;   370 sec
          bcs     Lbl_E0D2                                 ;Branch if Lower
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x2F ;(00101111)                        ;Compare A to Memory
;   1509 rpm
          bcs     Lbl_E0D2                                 ;Branch if Lower
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    #0xBD ;(10111101)                        ;Compare A to Memory
;   11 volts
          bcc     Lbl_E0D2                                 ;Branch if Higher or Same
          ldab    CCDFlags4_BodyCompFlags4_X               ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          stab    CCDFlags4_BodyCompFlags4_X               ;Store Accumulator B
          cmpb    #0x71 ;(01110001)                        ;Compare B to Memory
          bcs     Lbl_E0D5                                 ;Branch if Lower
          bset    *CCDFlags4_tsbec, #b3_FB_addb2 ;(00001000)  ;Set Bit(s)
          bra     Lbl_E0D2                                 ;Branch Always
Lbl_E0BC: ldaa    TargetBatteryVolts                       ;Load Accumulator A
          suba    BatteryVolts                             ;Subtract Memory from A
          bcs     Lbl_E0C6                                 ;Branch if Lower
          cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          bhi     Lbl_E0D2                                 ;Branch if Higher
Lbl_E0C6: ldab    CCDFlags4_BodyCompFlags4_X               ;Load Accumulator B
          incb                                             ;Increment Accumulator B
          stab    CCDFlags4_BodyCompFlags4_X               ;Store Accumulator B
          cmpb    #0x22 ;(00100010)                        ;Compare B to Memory
          bcs     Lbl_E0D5                                 ;Branch if Lower
          bclr    *CCDFlags4_tsbec, #b3_FB_addb2 ;(00001000)  ;Clear Bits(s)
Lbl_E0D2: clra                                             ;Clear Accumulator A
          staa    CCDFlags4_BodyCompFlags4_X               ;Store Accumulator A
Lbl_E0D5: brset   *Counter_MainLoop, #$%00000001, Lbl_E0EF ;Branch if Bit(s) Set
          ldx     #CCDDataStream                           ;Load Index Register X
          ldab    CCDTemp_HB                               ;Load Accumulator B
          asld                                             ;Arithmetic Shift Left D
          addb    #0x02 ;(00000010)                        ;Add Memory to B
          abx                                              ;Add B to X
          lsrd                                             ;Logical Shift Right D
          stab    CCDTemp_HB                               ;Store Accumulator B
          ldx     0x00, X                                  ;Load Index Register X
          jsr     0x00, X                                  ;Jump to Subroutine
          std     Temp1                                    ;Store Accumulator D
          jsr     CCDBusComs                               ;Jump to Subroutine
Lbl_E0EF: ldaa    CountdownTimerFromKeyOn                  ;Load Accumulator A
          bne     Lbl_E0FC                                 ;Branch if Not = Zero
          ldaa    TL_CCDConfigConstant2 ;(0xFF/255.00 Y)   ;Load Accumulator A
          beq     CCD_HandleAlarm                          ;Branch if = Zero
          bclr    *CCDFlags5, #b5_E1_AlarmDisable ;(00100000)  ;Clear Bits(s)
Lbl_E0FC: rts                                              ;Return from Subroutine
CCD_HandleAlarm:
          ldaa    PPROG_EEPROMControlReg                   ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          bne     Lbl_E111                                 ;Branch if Not = Zero
          bclr    *CCDFlags4_tsbec, #b5_FB_adeb7 ;(00100000)  ;Clear Bits(s)
          ldaa    TL_TL_b612                               ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_E111                                 ;Branch if = Zero
          bset    *CCDFlags4_tsbec, #b5_FB_adeb7 ;(00100000)  ;Set Bit(s)
Lbl_E111: ldaa    Counter_MainLoop                         ;Load Accumulator A
          bita    #0x03 ;(00000011)                        ;Bit(s) Test A with Memory
          bne     Lbl_E176                                 ;Branch if Not = Zero
          brclr   *CCDFlags5, #b6_E1_e1b6, Lbl_E139 ;(01000000)  ;Branch if Bit(s) Clear
          bset    *CCDFlags5, #b7_E1_e1b7 ;(10000000)      ;Set Bit(s)
          bclr    *CCDFlags5, #b6_E1_e1b6| b5_E1_AlarmDisable ;(01100000)  ;Clear Bits(s)
          bclr    *CCDFlags6, #b6_F6_ae2b6| b5_F6_ae2b5| b4_F6_ae2b4| b3_F6_ae2b3| b2_F6_ae2b2| b1_F6_ae2b1| b0_F6_ae2b0 ;(01111111)  ;Clear Bits(s)
          brset   *CCDFlags6, #b7_F6_ae2b7, Lbl_E176 ;(10000000)  ;Branch if Bit(s) Set
          ldaa    BitFlags6a_t3                            ;Load Accumulator A
          bita    #0x60 ;(01100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_E176                                 ;Branch if Not = Zero
          ldaa    TL_TL_b612                               ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          beq     Lbl_E176                                 ;Branch if = Zero
          anda    #0xFD ;(11111101)                        ;AND A with Memory
          bra     Lbl_E162                                 ;Branch Always
Lbl_E139: ldaa    CCDFlags6                                ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          brclr   *CCDFlags5, #b7_E1_e1b7, Lbl_E147 ;(10000000)  ;Branch if Bit(s) Clear
          cmpa    #0x71 ;(01110001)                        ;Compare A to Memory
          bcc     Lbl_E150                                 ;Branch if Higher or Same
          bra     Lbl_E14B                                 ;Branch Always
Lbl_E147: cmpa    #0x2D ;(00101101)                        ;Compare A to Memory
          bcc     Lbl_E176                                 ;Branch if Higher or Same
Lbl_E14B: inc     CCDFlags6                                ;Increment Memory Byte
          bra     Lbl_E176                                 ;Branch Always
Lbl_E150: ldaa    BitFlags6a_t3                            ;Load Accumulator A
          bita    #0x60 ;(01100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_E176                                 ;Branch if Not = Zero
          ldaa    TL_TL_b612                               ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          bne     Lbl_E176                                 ;Branch if Not = Zero
          bset    *CCDFlags6, #b7_F6_ae2b7 ;(10000000)     ;Set Bit(s)
          oraa    #0x02 ;(00000010)                        ;OR Accumulator A (Inclusive)
Lbl_E162: sei                                              ;Set Mask Disable Int
          brclr   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_E16A ;(01000000)  ;Branch if Bit(s) Clear
          cli                                              ;Clear Mask Enable Int
          bra     Lbl_E176                                 ;Branch Always
Lbl_E16A: bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
          staa    DRBOffsetStored_LB                       ;Store Accumulator A
          ldaa    #0x12 ;(00010010)                        ;Load Accumulator A
          staa    DRBOffsetStored_HB                       ;Store Accumulator A
Lbl_E176: brclr   *CCDFlags5, #b4_E1_e1b4, Lbl_E18A ;(00010000)  ;Branch if Bit(s) Clear
          brset   *CCDFlags5, #b7_E1_e1b7, Lbl_E189 ;(10000000)  ;Branch if Bit(s) Set
          ldaa    CCDFlags6                                ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          cmpa    #0x2D ;(00101101)                        ;Compare A to Memory
          bcs     Lbl_E189                                 ;Branch if Lower
          bset    *CCDFlags5, #b5_E1_AlarmDisable ;(00100000)  ;Set Bit(s)
Lbl_E189: rts                                              ;Return from Subroutine
Lbl_E18A: brset   *CCDFlags5, #b4_E1_e1b4, Lbl_E1DA ;(00010000)  ;Branch if Bit(s) Set
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_E1DA ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    BitFlags6a_t3                            ;Load Accumulator A
          bita    #0x60 ;(01100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_E1DA                                 ;Branch if Not = Zero
          ldaa    TL_TL_b612                               ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          bne     Lbl_E1A5                                 ;Branch if Not = Zero
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          bne     Lbl_E1D4                                 ;Branch if Not = Zero
          bra     Lbl_E1D7                                 ;Branch Always
Lbl_E1A5: brset   *CCDFlags5, #b7_E1_e1b7, Lbl_E1B3 ;(10000000)  ;Branch if Bit(s) Set
          ldaa    CCDFlags6                                ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          cmpa    #0x2D ;(00101101)                        ;Compare A to Memory
          bcs     Lbl_E1DA                                 ;Branch if Lower
          bra     Lbl_E1D1                                 ;Branch Always
Lbl_E1B3: sei                                              ;Set Mask Disable Int
          brclr   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_E1BB ;(01000000)  ;Branch if Bit(s) Clear
          cli                                              ;Clear Mask Enable Int
          bra     Lbl_E1DA                                 ;Branch Always
Lbl_E1BB: bset    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
          adda    #0x04 ;(00000100)                        ;Add Memory to A
          cmpa    #0x4C ;(01001100)                        ;Compare A to Memory
          bcs     Lbl_E1C7                                 ;Branch if Lower
          anda    #0xFE ;(11111110)                        ;AND A with Memory
Lbl_E1C7: anda    #0xFD ;(11111101)                        ;AND A with Memory
          staa    DRBOffsetStored_LB                       ;Store Accumulator A
          ldaa    #0x12 ;(00010010)                        ;Load Accumulator A
          staa    DRBOffsetStored_HB                       ;Store Accumulator A
Lbl_E1D1: bset    *CCDFlags4_tsbec, #b5_FB_adeb7 ;(00100000)  ;Set Bit(s)
Lbl_E1D4: bset    *CCDFlags5, #b7_E1_e1b7 ;(10000000)      ;Set Bit(s)
Lbl_E1D7: bset    *CCDFlags5, #b4_E1_e1b4 ;(00010000)      ;Set Bit(s)
Lbl_E1DA: rts                                              ;Return from Subroutine
CCD_CCDBusOutputStatus:
          clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          staa    Temp0                                    ;Store Accumulator A
          rts                                              ;Return from Subroutine
CCD_EngineRPM:
          ldaa    #0xE4 ;(11100100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          ldab    MapValue                                 ;Load Accumulator B
          rts                                              ;Return from Subroutine
CCD_FuelOutput:
          ldaa    #0x84 ;(10000100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          sei                                              ;Set Mask Disable Int
          ldaa    CCDFuelOutput_HB                         ;Load Accumulator A
          ldab    Counter_SpeedSensorInterrupt_HB_X        ;Load Accumulator B
          clr     CCDFuelOutput_HB                         ;Clear Memory Byte
          clr     Counter_SpeedSensorInterrupt_HB_X        ;Clear Memory Byte
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
CCD_SpeedSensorCounter:
          ldaa    #0x44 ;(01000100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          sei                                              ;Set Mask Disable Int
          ldaa    Counter_InjectorCalc                     ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          clr     Counter_InjectorCalc                     ;Clear Memory Byte
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
CCD_ConfigConst1:
          ldaa    #0xAC ;(10101100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldd     TL_CCDConfigConstant ;(0x05/5.00 out)    ;Load Double Accumulator D
          rts                                              ;Return from Subroutine
CCD_CoolantTemp:
          ldaa    #0x8C ;(10001100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldaa    CoolantTemp                              ;Load Accumulator A
          ldab    AmbientAirTempVolts2                     ;Load Accumulator B
          rts                                              ;Return from Subroutine
CCD_BatVoltsEtc:
          ldaa    #0xD4 ;(11010100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldaa    BatteryVolts                             ;Load Accumulator A
          ldab    TargetBatteryVolts                       ;Load Accumulator B
          rts                                              ;Return from Subroutine
CCD_ThrottlePos:
          ldaa    #0x42 ;(01000010)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldaa    TpsVolts                                 ;Load Accumulator A
          suba    LowestSessionTpsVolts                    ;Subtract Memory from A
          bcc     LE234                                    ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
LE234:    clrb                                             ;Clear Accumulator B
          rts                                              ;Return from Subroutine
CCD_TargetIdleSPeed:
          ldaa    #0xCC ;(11001100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldaa    PPROG_EEPROMControlReg                   ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          beq     CCD_B600                                 ;Branch if = Zero
          jmp     CCD_CCDBusOutputStatus                   ;Jump
CCD_B600: ldd     TL_TL_b600                               ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          staa    Temp3                                    ;Store Accumulator A
          ldd     TargetIdleSpeedHB                        ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          tab                                              ;Transfer A to B
          ldaa    Temp3                                    ;Load Accumulator A
          rts                                              ;Return from Subroutine
CCD_Baro: ldaa    #0x54 ;(01010100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldaa    BaroPressure                             ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          rts                                              ;Return from Subroutine
CCD_VehicleSpeed:
          ldaa    #0x24 ;(00100100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          staa    Temp3                                    ;Store Accumulator A
          asld                                             ;Arithmetic Shift Left D
          bcc     LE270                                    ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
LE270:    ldab    #0x34 ;(00110100)                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
          ldaa    Temp3                                    ;Load Accumulator A
          rts                                              ;Return from Subroutine
CCD_AlarmStatus:
          ldaa    PPROG_EEPROMControlReg                   ;Load Accumulator A
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          bne     Le2ae                                    ;Branch if Not = Zero
          ldx     #0xB672                                  ;Load Index Register X
          ldab    CCDFlags4_tsbec                          ;Load Accumulator B
          tba                                              ;Transfer B to A
          incb                                             ;Increment Accumulator B
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          anda    #0xF8 ;(11111000)                        ;AND A with Memory
          cmpb    #0x06 ;(00000110)                        ;Compare B to Memory
          bne     Lbl_E294                                 ;Branch if Not = Zero
          clrb                                             ;Clear Accumulator B
Lbl_E294: aba                                              ;Add Accumulators
          staa    CCDFlags4_tsbec                          ;Store Accumulator A
          lslb                                             ;Logical Shift Left B
          lslb                                             ;Logical Shift Left B
          abx                                              ;Add B to X
          brset   0x00, X, #$%11111111, Le2ae              ;Branch if Bit(s) Set
          ldaa    0x00, X                                  ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          adda    0x01, X                                  ;Add Memory to A
          adda    0x02, X                                  ;Add Memory to A
          cmpa    0x03, X                                  ;Compare A to Memory
          bne     Le2ae                                    ;Branch if Not = Zero
          ldd     0x01, X                                  ;Load Double Accumulator D
          rts                                              ;Return from Subroutine
Le2ae:    jmp     CCD_CCDBusOutputStatus                   ;Jump
CCD_ToggleBCFlags:
          ldaa    #0xEC ;(11101100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          brclr   *b5C_IPL1_t3, #b1_D5_BadCoolantTemp, Lbl_E2BD ;(00000010)  ;Branch if Bit(s) Clear
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
Lbl_E2BD: brclr   *b5C_IPL1_t3, #b6_D5_TpsBadSignal, LE2C3 ;(01000000)  ;Branch if Bit(s) Clear
          oraa    #0x02 ;(00000010)                        ;OR Accumulator A (Inclusive)
LE2C3:    brclr   *CCDFlags4_tsbec, #b3_FB_addb2, LE2C9 ;(00001000)  ;Branch if Bit(s) Clear
          oraa    #0x04 ;(00000100)                        ;OR Accumulator A (Inclusive)
LE2C9:    brclr   *b5C_IPL1_t3, #b5_D5_BattNotCharging, LE2CF ;(00100000)  ;Branch if Bit(s) Clear
          oraa    #0x08 ;(00001000)                        ;OR Accumulator A (Inclusive)
LE2CF:    clrb                                             ;Clear Accumulator B
          brclr   *CCDFlags4_tsbec, #b4_FB_bt4, LE2D9 ;(00010000)  ;Branch if Bit(s) Clear
          bclr    *CCDFlags4_tsbec, #b4_FB_bt4 ;(00010000)  ;Clear Bits(s)
          orab    #0x01 ;(00000001)                        ;OR Accumulator B (Inclusive)
LE2D9:    brclr   *CCDFlags4_tsbec, #b5_FB_adeb7, LE2DF ;(00100000)  ;Branch if Bit(s) Clear
          orab    #0x02 ;(00000010)                        ;OR Accumulator B (Inclusive)
LE2DF:    rts                                              ;Return from Subroutine
CCD_SwitchState:
          ldaa    #0xA4 ;(10100100)                        ;Load Accumulator A
          staa    Temp0                                    ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          brset   *CruiseStatus_1, #$%10000000, LE2EC      ;Branch if Bit(s) Set
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
LE2EC:    ldab    TpsVolts                                 ;Load Accumulator B
          subb    LowestSessionTpsVolts                    ;Subtract Memory from B
          bcs     LE2F8                                    ;Branch if Lower
          cmpb    #0x05 ;(00000101)                        ;Compare B to Memory
          bcs     LE2F8                                    ;Branch if Lower
          oraa    #0x02 ;(00000010)                        ;OR Accumulator A (Inclusive)
LE2F8:    brclr   *StartupSwitchMirror1, #b5_61_Brake, LE2FE ;(00100000)  ;Branch if Bit(s) Clear
          oraa    #0x04 ;(00000100)                        ;OR Accumulator A (Inclusive)
LE2FE:    brclr   *PIA2_Buffer_t3, #b0_CE_bt0, LE304 ;(00000001)  ;Branch if Bit(s) Clear
          oraa    #0x08 ;(00001000)                        ;OR Accumulator A (Inclusive)
LE304:    brset   *PIA1_Buffer_t3, #b6_CD_CELight, LE30A ;(01000000)  ;Branch if Bit(s) Set
          oraa    #0x20 ;(00100000)                        ;OR Accumulator A (Inclusive)
LE30A:    ldab    StartupSwitchMirror1                     ;Load Accumulator B
          lsrb                                             ;Logical Shift Right B
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          psha                                             ;Push A onto Stack
          ldaa    TL_BatteryVoltsTablePtr ;(0x01/1.00 Y units)  ;Load Accumulator A
          beq     LE317                                    ;Branch if = Zero
          eorb    #0x01 ;(00000001)                        ;Exclusive OR B with Memory
LE317:    pula                                             ;Pull A from Stack
          rts                                              ;Return from Subroutine
CCDDataStream:
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_BatVoltsEtc
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_Baro
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_CoolantTemp
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_TargetIdleSPeed
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_ToggleBCFlags
          .word CCD_EngineRPM
          .word CCD_BatVoltsEtc
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_AlarmStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_CoolantTemp
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_FuelOutput
          .word CCD_SpeedSensorCounter
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ConfigConst1
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_VehicleSpeed
          .word CCD_SwitchState
          .word CCD_CCDBusOutputStatus
          .word CCD_EngineRPM
          .word CCD_ThrottlePos
          .word CCD_CCDBusOutputStatus
          .word CCD_CCDBusOutputStatus
gb_AISTEP_BitPatternForAisControl:
          .byte 0x06 ;1-1
          .byte 0x05 ;2-2
          .byte 0x09 ;3-3
          .byte 0x0A ;4-4
.org 0xE41D
;TL_TempForColdScaleFromA2D:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0xE41D
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TempForColdScaleFromA2D
    ;mptblcname TMPTL1
    ;mpxaxis raw 0 255 scale
    ;mpyaxis Coolant_Temperature -200 260 F
    ;mptbldesc Detailed_Description
          .byte 0x07                       ;Number of points in table
          .byte 0x00, 0xD3, 0xFF, 0x85     ;Point 1
          .byte 0x53, 0xAB, 0xFF, 0x9D     ;Point 2
          .byte 0xD7, 0x78, 0xFF, 0x55     ;Point 3
          .byte 0xE6, 0x6E, 0xFF, 0x17     ;Point 4
          .byte 0xF1, 0x64, 0xFE, 0xCD     ;Point 5
          .byte 0xF6, 0x5E, 0xFD, 0xAB     ;Point 6
          .byte 0xFF, 0x49                 ;Point 7
.org 0xE438
;TL_TempForHotScaleA2D:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0xE438
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TempForHotScaleA2D
    ;mptblcname TMPTL2
    ;mpxaxis raw 0 255 scale
    ;mpyaxis Coolant_Temperature -200 260 F
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Number of points in table
          .byte 0x42, 0xFF, 0xFF, 0x55     ;Point 1
          .byte 0x57, 0xF1, 0xFF, 0x75     ;Point 2
          .byte 0xC5, 0xB5, 0xFF, 0x4F     ;Point 3
          .byte 0xFF, 0x8D                 ;Point 4
.org 0xE447
;TL_ScaleCoolantTemp:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE447
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname ScaleCoolantTemp
    ;mptblcname CTSSCL
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_SCALECOOLANTTEMP
          .byte 0x09                       ;Number of points in table
          .byte 0x58, 0x00, 0x01, 0x86     ;Point 1
          .byte 0x6D, 0x20, 0x01, 0x86     ;Point 2
          .byte 0x82, 0x40, 0x01, 0x86     ;Point 3
          .byte 0x97, 0x60, 0x01, 0x86     ;Point 4
          .byte 0xAC, 0x80, 0x01, 0x86     ;Point 5
          .byte 0xC1, 0xA0, 0x01, 0x86     ;Point 6
          .byte 0xD6, 0xC0, 0x01, 0x86     ;Point 7
          .byte 0xEB, 0xE0, 0x01, 0x8C     ;Point 8
          .byte 0xFF, 0xFF                 ;Point 9
.org 0xE46A
;TL_Tl_e468:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE46A
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname Tl_e468
    ;mptblcname TL_E46A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_E46a
          .byte 0x03                       ;Number of points in table
          .byte 0x2F, 0x99, 0xFF, 0xAF     ;Point 1
          .byte 0xCC, 0x67, 0xFF, 0x7C     ;Point 2
          .byte 0xE9, 0x58                 ;Point 3
.org 0xE475
;TL_Tl_e475:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE475
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname Tl_e475
    ;mptblcname TL_E475
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_E475
          .byte 0x05                       ;Number of points in table
          .byte 0x15, 0xFF, 0xFE, 0x00     ;Point 1
          .byte 0x1B, 0xF3, 0xFE, 0xF3     ;Point 2
          .byte 0x2E, 0xDF, 0xFF, 0x4A     ;Point 3
          .byte 0x4A, 0xCB, 0xFF, 0x91     ;Point 4
          .byte 0xC8, 0x94                 ;Point 5
.org 0xE488
;TL_ScaleChargeTemp:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE488
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname ScaleChargeTemp
    ;mptblcname CHGSCL
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_SCALECHARGETEMP
          .byte 0x09                       ;Number of points in table
          .byte 0x58, 0x00, 0x01, 0x99     ;Point 1
          .byte 0x6C, 0x20, 0x01, 0x99     ;Point 2
          .byte 0x80, 0x40, 0x01, 0x99     ;Point 3
          .byte 0x94, 0x60, 0x01, 0x99     ;Point 4
          .byte 0xA8, 0x80, 0x01, 0x99     ;Point 5
          .byte 0xBC, 0xA0, 0x01, 0x99     ;Point 6
          .byte 0xD0, 0xC0, 0x01, 0x99     ;Point 7
          .byte 0xE4, 0xE0, 0x01, 0x8C     ;Point 8
          .byte 0xF8, 0xFF                 ;Point 9
.org 0xE4AB
;TL_TempForScaleAmbientA2D:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE4AB
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TempForScaleAmbientA2D
    ;mptblcname TMPAMB
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TEMPFORSCALEAMBIENTA2D
          .byte 0x06                       ;Number of points in table
          .byte 0x05, 0xFF, 0xFC, 0xC0     ;Point 1
          .byte 0x15, 0xCB, 0xFE, 0xF8     ;Point 2
          .byte 0x32, 0xAD, 0xFF, 0x83     ;Point 3
          .byte 0x6F, 0x8F, 0xFF, 0x96     ;Point 4
          .byte 0xC8, 0x6C, 0xFF, 0x56     ;Point 5
          .byte 0xE7, 0x58                 ;Point 6
.org 0xE4C2
;TL_BatteryVoltsTable3:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE4C2
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname BatteryVoltsTable3
    ;mptblcname BATVLT3
    ;mpxaxis ambient_air_volts 0 5 volts
    ;mpyaxis out_desc 0 16 volts
    ;mptbldesc Desc_TL_E4C2
          .byte 0x05                       ;Number of points in table
          .byte 0x79, 0xEC, 0xFF, 0xE4     ;Point 1
          .byte 0x82, 0xEB, 0xFF, 0xA2     ;Point 2
          .byte 0x95, 0xE4, 0xFF, 0x9A     ;Point 3
          .byte 0xAE, 0xDA, 0xFF, 0xC8     ;Point 4
          .byte 0xB7, 0xD8                 ;Point 5
.org 0xE4D5
;TL_BatteryVoltsTable2:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE4D5
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname BatteryVoltsTable2
    ;mptblcname BATVLT2
    ;mpxaxis ambient_air_volts 0 5 volts
    ;mpyaxis out_desc 0 16 volts
    ;mptbldesc Desc_TL_E4D5
          .byte 0x05                       ;Number of points in table
          .byte 0x79, 0xED, 0xFF, 0xE4     ;Point 1
          .byte 0x82, 0xEC, 0xFF, 0x95     ;Point 2
          .byte 0x95, 0xE4, 0xFF, 0xA4     ;Point 3
          .byte 0xAE, 0xDB, 0xFF, 0x8F     ;Point 4
          .byte 0xB7, 0xD7                 ;Point 5
.org 0xE4E8
;TL_BatteryVoltsTable1:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE4E8
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname BatteryVoltsTable1
    ;mptblcname BATVLT
    ;mpxaxis ambient_air_volts 0 5 volts
    ;mpyaxis Yout_desc 0 16 volts
    ;mptbldesc Desc_TL_E4E8
          .byte 0x05                       ;Number of points in table
          .byte 0x79, 0xEE, 0xFF, 0xC8     ;Point 1
          .byte 0x82, 0xEC, 0xFF, 0xA2     ;Point 2
          .byte 0x95, 0xE5, 0xFF, 0x9A     ;Point 3
          .byte 0xAE, 0xDB, 0xFF, 0xAB     ;Point 4
          .byte 0xB7, 0xD8                 ;Point 5
.org 0xE4FB
;TL_DwellTimeFromBatteryVoltsComp:
    ;mpgrp Unassigned\
    ;mptbladdr 0xE4FB
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname DwellTimeFromBatteryVoltsComp
    ;mptblcname DWELL
    ;mpxaxis Xinput 0 5 volts
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_DWELLTIMEFROMBATTERYVOLTSCOMP
          .byte 0x05                       ;Number of points in table
          .byte 0x96, 0x9C, 0xFA, 0x00     ;Point 1
          .byte 0xA2, 0x54, 0xFF, 0x00     ;Point 2
          .byte 0xC2, 0x34, 0xFF, 0x9C     ;Point 3
          .byte 0xE3, 0x27, 0xFF, 0xB7     ;Point 4
          .byte 0xFF, 0x1F                 ;Point 5
ScaleYbyA:psha                                             ;Push A onto Stack
          pshy                                             ;Push Y onto Stack (Lo First)
          pulb                                             ;Pull B from Stack
          mul                                              ;Multiply A x B = D
          xgdy                                             ;Exchange D with Y
          pulb                                             ;Pull B from Stack
          pula                                             ;Pull A from Stack
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
          aby                                              ;Add B to Y
          pshy                                             ;Push Y onto Stack (Lo First)
          puly                                             ;Pull Y from Stack (Hi First)
          rts                                              ;Return from Subroutine
ScaleXbyB_somethingelse:
          psha                                             ;Push A onto Stack
          tba                                              ;Transfer B to A
          ldy     0x00, X                                  ;Load Index Register Y
          bsr     ScaleYbyA                                ;Branch to Subroutine
          sty     Temp6                                    ;Store Index Register Y
          pula                                             ;Pull A from Stack
          psha                                             ;Push A onto Stack
          ldab    0x01, X                                  ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          addd    Temp6                                    ;Add 16-Bit to D
          bcs     Lbl_E548                                 ;Branch if Lower
          std     Temp6                                    ;Store Accumulator D
          ldab    0x00, X                                  ;Load Accumulator B
          pula                                             ;Pull A from Stack
          mul                                              ;Multiply A x B = D
          tsta                                             ;Test for Zero or Minus
          bne     Lbl_E549                                 ;Branch if Not = Zero
          addb    Temp6                                    ;Add Memory to B
          bcc     Lbl_E54E                                 ;Branch if Higher or Same
          bra     Lbl_E549                                 ;Branch Always
Lbl_E548: pula                                             ;Pull A from Stack
Lbl_E549: ldab    #0xFF ;(11111111)                        ;Load Accumulator B
          stab    Temp7                                    ;Store Accumulator B
Lbl_E54E: tba                                              ;Transfer B to A
          ldab    Temp7                                    ;Load Accumulator B
          std     Temp6                                    ;Store Accumulator D
          rts                                              ;Return from Subroutine
Lookup4ByteTable:
          ldy     #Ram_00                                  ;Load Index Register Y
          ldab    0x00, X                                  ;Load Accumulator B
          aby                                              ;Add B to Y
          inx                                              ;Increment Index Register X
          ldab    #0x04 ;(00000100)                        ;Load Accumulator B
          cmpa    0x00, X                                  ;Compare A to Memory
          bhi     Lbl_E56A                                 ;Branch if Higher
Lbl_E565: ldaa    0x01, X                                  ;Load Accumulator A
          tab                                              ;Transfer A to B
          bra     Lbl_E58B                                 ;Branch Always
Lbl_E56A: dey                                              ;Decrement Index Register Y
          beq     Lbl_E565                                 ;Branch if = Zero
          cmpa    0x04, X                                  ;Compare A to Memory
          bcs     Lbl_E575                                 ;Branch if Lower
          abx                                              ;Add B to X
          bra     Lbl_E56A                                 ;Branch Always
Lbl_E575: suba    0x00, X                                  ;Subtract Memory from A
          psha                                             ;Push A onto Stack
          ldab    0x02, X                                  ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          xgdy                                             ;Exchange D with Y
          pula                                             ;Pull A from Stack
          ldab    0x03, X                                  ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
          aby                                              ;Add B to Y
          xgdy                                             ;Exchange D with Y
          addb    0x01, X                                  ;Add Memory to B
          tba                                              ;Transfer B to A
Lbl_E58B: psha                                             ;Push A onto Stack
          pula                                             ;Pull A from Stack
          rts                                              ;Return from Subroutine
OddBallLookup:
          psha                                             ;Push A onto Stack
          clrb                                             ;Clear Accumulator B
          rola                                             ;Rotate Left
          rolb                                             ;Rotate Left
          rola                                             ;Rotate Left
          rolb                                             ;Rotate Left
          rola                                             ;Rotate Left
          rolb                                             ;Rotate Left
          abx                                              ;Add B to X
          ldab    0x00, X                                  ;Load Accumulator B
          subb    0x01, X                                  ;Subtract Memory from B
          bcs     Lbl_E5A1                                 ;Branch if Lower
          mul                                              ;Multiply A x B = D
          nega                                             ;2's Complement A
          bra     Lbl_E5A3                                 ;Branch Always
Lbl_E5A1: negb                                             ;2's Complement B
          mul                                              ;Multiply A x B = D
Lbl_E5A3: adda    0x00, X                                  ;Add Memory to A
          tab                                              ;Transfer A to B
          pshb                                             ;Push B onto Stack
          pulb                                             ;Pull B from Stack
          pula                                             ;Pull A from Stack
          rts                                              ;Return from Subroutine
e5aaRTN:  rts                                              ;Return from Subroutine
CalculateEngineRpm:
          ldy     #DistributorFallingEdgePulsewidth_HB     ;Load Index Register Y
          ldd     TL_TL_8072 ;(0x0262/2.37 Y units)        ;Load Double Accumulator D
          ldx     TL_TL_8074 ;(0x5A00/89.65 Y units)       ;Load Index Register X
          brclr   *TimerOverflowsBetweenCamPulses, #$%11111111, CalculateVehicleSpeedOrEngineRpms ;Branch if Bit(s) Clear
          dey                                              ;Decrement Index Register Y
          ldd     TL_AdaptiveWastegateCellBelow3psi ;(0x0002/.01 Y units)  ;Load Double Accumulator D
          ldx     TL_TL_8078 ;(0x625A/97.97 Y units)       ;Load Index Register X
CalculateVehicleSpeedOrEngineRpms:
          pshx                                             ;Push X onto Stack (Lo First)
          ldx     0x00, Y                                  ;Load Index Register X
          fdiv                                             ;Frac Div D/X X=q*65536 D=R
          stx     Temp6                                    ;Store Index Register X
          pula                                             ;Pull A from Stack
          pulb                                             ;Pull B from Stack
          ldx     0x00, Y                                  ;Load Index Register X
          idiv                                             ;Int Div D/X X=q D=R
          xgdx                                             ;Exchange D with X
          addd    Temp6                                    ;Add 16-Bit to D
          bcc     Lbl_E5D8                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_E5D8: std     Temp6                                    ;Store Accumulator D
          rts                                              ;Return from Subroutine
ConvertMAPVoltsToValue:
          ldab    TL_ScaleMAPVoltsToPresMultiplyConst      ;Load Accumulator B
          beq     Lbl_E5E2                                 ;Branch if = Zero
          mul                                              ;Multiply A x B = D
Lbl_E5E2: addd    TL_ScaleMAPVoltsToPresAddConst           ;Add 16-Bit to D
          bcc     Lbl_E5E9                                 ;Branch if Higher or Same
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
Lbl_E5E9: rts                                              ;Return from Subroutine
ScaleXbyB_addingA_intoD:
          psha                                             ;Push A onto Stack
          tba                                              ;Transfer B to A
          ldy     0x00, X                                  ;Load Index Register Y
          jsr     ScaleYbyA                                ;Jump to Subroutine
          pula                                             ;Pull A from Stack
          tsta                                             ;Test for Zero or Minus
          xgdy                                             ;Exchange D with Y
          beq     Lbl_E5FF                                 ;Branch if = Zero
          addd    0x00, X                                  ;Add 16-Bit to D
          bcc     Lbl_E5FF                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_E5FF: psha                                             ;Push A onto Stack
          pshb                                             ;Push B onto Stack
          pulb                                             ;Pull B from Stack
          pula                                             ;Pull A from Stack
          rts                                              ;Return from Subroutine
DetermineNumberOfOverflowsBetweenSensorPulses_MM:
          subd    0x04, X                                  ;Subtract Memory from D
          staa    0x00, Y                                  ;Store Accumulator A
          ldaa    0x00, X                                  ;Load Accumulator A
          lsrd                                             ;Logical Shift Right D
          eorb    0x00, Y                                  ;Exclusive OR B with Memory
          bpl     Lbl_E618                                 ;Branch if Plus
          ldaa    0x00, X                                  ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_E618                                 ;Branch if = Zero
          staa    0x00, X                                  ;Store Accumulator A
Lbl_E618: ldaa    0x00, X                                  ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          cmpa    0x01, X                                  ;Compare A to Memory
          bcs     Lbl_E621                                 ;Branch if Lower
          staa    0x01, X                                  ;Store Accumulator A
Lbl_E621: rts                                              ;Return from Subroutine
RescaleRPMFor3D_MM:
          ldx     #TL_RPM3DInputModifierFromRPM            ;Load Index Register X
          ldd     EngineRpm_HB                             ;Load Double Accumulator D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          jsr     Lookup4ByteTable                         ;Jump to Subroutine
          staa    EngineRPM_3D                             ;Store Accumulator A
          rts                                              ;Return from Subroutine
;   ************explanation of 3d table lookup routine**************
;   Input (example): regA = 70 (rpm) regB = 200 (mapvalue)
;   regX is table location = 0x8083 (table is unsigned 17 rows x 9 cols)
;   1st byte is row cnt / 2nd byte is col cnt / 3rd byte is unsigned if 0 and signed <> 0
;   Calculation of cell in table:
;   Column offset = regB * (col - 1) / scale = 200 * 8 / 256 = 6.25
;           (only the integer part is used initially -6- and the fraction is used for interpolation)
;           (also you can see that the value in regB should be the column headings i.e. the X axis labels)
;   Row offset = regA * (row -1) / scale = 70 * 16 / 256 = 4.375
;           (only the integer part is used initially -4- and the fraction is used for interpolation)
;           (also you can see that the value in regA should be the row headings i.e. the Y axis labels)
;   Now calculate cell offset into table:
;           Row offset * cols per row + col offset = 4 * 9 + 6 = 42 (0x2a) cells deeper into table.
;   Beginning table data = 0x814b + 3 (for row col signed bytes) = 0x814e
;   Actual cell location = 0x814e + 0x2a (42dec) = 0x8178
;   Value at 0x8178 = 38
;   Now interpolate using fractional parts of offsets with the next column/next row respectively.
;   Next column value is 16 so interpolation = (16-38) * .25 = -5.5 rounded to -6
;   Next row value is 46 so interpolation = (46-38) * .375 = 3
;   Add the interpolated values to the cell value = 38 + (-6) + 3 = 35.
;   So 35 will be the returned value in reg a.
;   The maximum table size is 257 rows by 256 columns.
;   col = 255 * 255 / 256 = 254.0
;   row = 255 * 256 / 256 = 255.0
;   offset = 255 * 256 + 254 = 65534
;   *****************************************************************
Lookup3DTableRoutine:
          ldy     #InterpUnsigned                          ;Load Index Register Y
          brclr   0x02, X, #$%11111111, Lbl_E63C           ;Branch if Bit(s) Clear
          ldy     #InterpSigned                            ;Load Index Register Y
Lbl_E63C: pshy                                             ;Push Y onto Stack (Lo First)
          psha                                             ;Push A onto Stack
          psha                                             ;Push A onto Stack
          ldaa    0x01, X                                  ;Load Accumulator A
          deca                                             ;Decrement Accumulator A
          mul                                              ;Multiply A x B = D
          psha                                             ;Push A onto Stack
          pshb                                             ;Push B onto Stack
          tsy                                              ;Transfer Stack Pointer to Y
          ldaa    0x02, Y                                  ;Load Accumulator A
          ldab    0x00, X                                  ;Load Accumulator B
          decb                                             ;Decrement Accumulator B
          mul                                              ;Multiply A x B = D
          stab    0x03, Y                                  ;Store Accumulator B
          ldab    0x01, X                                  ;Load Accumulator B
          stab    0x02, Y                                  ;Store Accumulator B
          mul                                              ;Multiply A x B = D
          inx                                              ;Increment Index Register X
          inx                                              ;Increment Index Register X
          inx                                              ;Increment Index Register X
          abx                                              ;Add B to X
          tsta                                             ;Test for Zero or Minus
          beq     Lbl_E663                                 ;Branch if = Zero
          inx                                              ;Increment Index Register X
          ldab    #0xFF ;(11111111)                        ;Load Accumulator B
          abx                                              ;Add B to X
Lbl_E663: ldab    0x01, Y                                  ;Load Accumulator B
          abx                                              ;Add B to X
          ldab    0x00, Y                                  ;Load Accumulator B
          pshy                                             ;Push Y onto Stack (Lo First)
          ldy     0x04, Y                                  ;Load Index Register Y
          ldaa    0x00, X                                  ;Load Accumulator A
          suba    0x01, X                                  ;Subtract Memory from A
          jsr     0x00, Y                                  ;Jump to Subroutine
          puly                                             ;Pull Y from Stack (Hi First)
          staa    0x01, Y                                  ;Store Accumulator A
          ldab    0x02, Y                                  ;Load Accumulator B
          abx                                              ;Add B to X
          pulb                                             ;Pull B from Stack
          pshy                                             ;Push Y onto Stack (Lo First)
          ldy     0x04, Y                                  ;Load Index Register Y
          ldaa    0x00, X                                  ;Load Accumulator A
          suba    0x01, X                                  ;Subtract Memory from A
          jsr     0x00, Y                                  ;Jump to Subroutine
          puly                                             ;Pull Y from Stack (Hi First)
          tsx                                              ;Transfer Stack Pointer to X
          staa    0x01, X                                  ;Store Accumulator A
          ldab    0x02, X                                  ;Load Accumulator B
          ldy     0x03, X                                  ;Load Index Register Y
          ldaa    0x00, X                                  ;Load Accumulator A
          suba    0x01, X                                  ;Subtract Memory from A
          jsr     0x00, Y                                  ;Jump to Subroutine
          pulb                                             ;Pull B from Stack
          pulx                                             ;Pull X from Stack (Hi First)
          pulx                                             ;Pull X from Stack (Hi First)
          rts                                              ;Return from Subroutine
InterpSigned:
          blt     Lbl_E6AD                                 ;Branch if < Zero
          bra     Lbl_E6A7                                 ;Branch Always
InterpUnsigned:
          bcs     Lbl_E6AD                                 ;Branch if Lower
Lbl_E6A7: mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          nega                                             ;2's Complement A
          bra     Lbl_E6B1                                 ;Branch Always
Lbl_E6AD: nega                                             ;2's Complement A
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
Lbl_E6B1: adda    0x00, X                                  ;Add Memory to A
          rts                                              ;Return from Subroutine
ProcessMapOrTpsBlockData:
          suba    0x00, Y                                  ;Subtract Memory from A
          bcs     Lbl_E6BE                                 ;Branch if Lower
          ldab    0x01, X                                  ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          bra     Lbl_E6C6                                 ;Branch Always
Lbl_E6BE: nega                                             ;2's Complement A
          ldab    0x00, X                                  ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          nega                                             ;2's Complement A
          negb                                             ;2's Complement B
          sbca    #0x00 ;(00000000)                        ;Subtract with Carry from A
Lbl_E6C6: addd    0x00, Y                                  ;Add 16-Bit to D
          std     0x00, Y                                  ;Store Accumulator D
          rts                                              ;Return from Subroutine
ResetCopTimer2:
          sei                                              ;Set Mask Disable Int
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          eora    #0x02 ;(00000010)                        ;Exclusive OR A with Memory
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
Lbl_E6D7: ldd     #0x55AA                                  ;Load Double Accumulator D
          staa    COPRST_ArmOCToggleAndResetCopTimerReg    ;Store Accumulator A
          stab    COPRST_ArmOCToggleAndResetCopTimerReg    ;Store Accumulator B
          rts                                              ;Return from Subroutine
OCToggleAndResetCopTimer:
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          anda    #0xFD ;(11111101)                        ;AND A with Memory
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
          ldab    #0x10 ;(00010000)                        ;Load Accumulator B
Lbl_E6EB: decb                                             ;Decrement Accumulator B
          bne     Lbl_E6EB                                 ;Branch if Not = Zero
          oraa    #0x02 ;(00000010)                        ;OR Accumulator A (Inclusive)
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
          ldd     #0x55AA                                  ;Load Double Accumulator D
          staa    COPRST_ArmOCToggleAndResetCopTimerReg    ;Store Accumulator A
          stab    COPRST_ArmOCToggleAndResetCopTimerReg    ;Store Accumulator B
          rts                                              ;Return from Subroutine
Le6fd:    ldx     #ErrorBitRegisterStored0                 ;Load Index Register X
          bra     Lbl_E70A                                 ;Branch Always
Le702:    ldx     #Ram_05                                  ;Load Index Register X
          bra     Lbl_E70A                                 ;Branch Always
Lbl_E707: ldx     #Ram_01                                  ;Load Index Register X
Lbl_E70A: ldy     #0x0242                                  ;Load Index Register Y
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
Lbl_E711: ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_E71A                                 ;Branch if Not = Zero
          sec                                              ;Set Carry
          rts                                              ;Return from Subroutine
Lbl_E71A: jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          clc                                              ;Clear Carry Bit
          dey                                              ;Decrement Index Register Y
          bne     Lbl_E711                                 ;Branch if Not = Zero
          dex                                              ;Decrement Index Register X
          bne     Lbl_E70A                                 ;Branch if Not = Zero
          rts                                              ;Return from Subroutine
GetControlFeedback_DetermineIfShutdownRequired_MM:
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_E742                                 ;Branch if Not = Zero
          brset   *Ram_30, #$%01000000, Lbl_E73D           ;Branch if Bit(s) Set
          bset    *Ram_30, #$%01000000                     ;Set Bit(s)
          bclr    *BitFlags21, #b7_21_DistSync ;(10000000)  ;Clear Bits(s)
          bclr    *BitFlags2e, #b6_2E_bt6| b1_2E_bt1 ;(01000010)  ;Clear Bits(s)
          bclr    *Ram_30, #$%10000000                     ;Clear Bits(s)
Lbl_E73D: clr     CountdownTimerFromKeyOn                  ;Clear Memory Byte
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
Lbl_E742: bclr    *BitFlags21, #b7_21_DistSync ;(10000000)  ;Clear Bits(s)
          bclr    *BitFlags2e, #b6_2E_bt6| b1_2E_bt1 ;(01000010)  ;Clear Bits(s)
          bclr    *Ram_30, #$%11000000                     ;Clear Bits(s)
          ldaa    CountdownTimerFromKeyOn                  ;Load Accumulator A
          bne     Lbl_E75A                                 ;Branch if Not = Zero
          ldaa    #0x17 ;(00010111)                        ;Load Accumulator A
          ldab    TimerOverflowsBetweenCamPulses           ;Load Accumulator B
          cmpb    #0x04 ;(00000100)                        ;Compare B to Memory
          bcs     Lbl_E75A                                 ;Branch if Lower
          ldaa    #0x09 ;(00001001)                        ;Load Accumulator A
Lbl_E75A: deca                                             ;Decrement Accumulator A
          beq     Lbl_E761                                 ;Branch if = Zero
          staa    CountdownTimerFromKeyOn                  ;Store Accumulator A
          rts                                              ;Return from Subroutine
Lbl_E761: sei                                              ;Set Mask Disable Int
          clra                                             ;Clear Accumulator A
          staa    ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB ;Store Accumulator A
          staa    ClearTheErrorTimer_0                     ;Store Accumulator A
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          jsr     CalculateChecksum                        ;Jump to Subroutine
          ldaa    #0x20 ;(00100000)                        ;Load Accumulator A
Lbl_E76F: ldab    SwitchPortAccessReg1                     ;Load Accumulator B
          bitb    #0x40 ;(01000000)                        ;Bit(s) Test B with Memory
          beq     Lbl_E73D                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          bne     Lbl_E76F                                 ;Branch if Not = Zero
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldaa    #0x32 ;(00110010)                        ;Load Accumulator A
          staa    Temp3                                    ;Store Accumulator A
Lbl_E781: jsr     Lbl_E707                                 ;Jump to Subroutine
          bcs     Lbl_E7CD                                 ;Branch if Lower
          dec     Temp3                                    ;Decrement Memory Byte
          bne     Lbl_E781                                 ;Branch if Not = Zero
          ldaa    #0xFF ;(11111111)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          ldaa    #0x32 ;(00110010)                        ;Load Accumulator A
          staa    Temp3                                    ;Store Accumulator A
Lbl_E795: jsr     Lbl_E707                                 ;Jump to Subroutine
          bcs     Lbl_E7CD                                 ;Branch if Lower
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x06 ;(00000110)                        ;Bit(s) Test A with Memory
          bne     Lbl_E7CD                                 ;Branch if Not = Zero
          dec     Temp3                                    ;Decrement Memory Byte
          bne     Lbl_E795                                 ;Branch if Not = Zero
          ldab    #0x03 ;(00000011)                        ;Load Accumulator B
Lbl_E7A8: ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
Lbl_E7AD: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_E7AD                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cmpa    TL_MapSensorMiddleLimit ;(0x66/2.00 volts)  ;Compare A to Memory
          bcc     Lbl_E7CA                                 ;Branch if Higher or Same
          decb                                             ;Decrement Accumulator B
          bne     Lbl_E7A8                                 ;Branch if Not = Zero
          ldd     #0x2481                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_E7CA                                 ;Branch if Higher or Same
          bset    *Ram_05, #$%00000100                     ;Set Bit(s)
          bra     Lbl_E7CD                                 ;Branch Always
Lbl_E7CA: bclr    *Ram_05, #$%00000100                     ;Clear Bits(s)
Lbl_E7CD: jsr     CountRamValuesFrom05to20                 ;Jump to Subroutine
          std     MinimumTimerCountBeforeMainloopCanContinue ;Store Accumulator D
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          ldd     #0x0000                                  ;Load Double Accumulator D
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          stab    PIA_Ctrl_1                               ;Store Accumulator B
          staa    SwitchPortAccessReg1                     ;Store Accumulator A
          ldab    #0x07 ;(00000111)                        ;Load Accumulator B
          stab    PIA3_Buffer_2_t3                         ;Store Accumulator B
          staa    PIA_Ctrl_5                               ;Store Accumulator A
          staa    PIA_Ctrl_2                               ;Store Accumulator A
          ldd     #0x0000                                  ;Load Double Accumulator D
          std     OC1M_OutputCompare1Mask                  ;Store Accumulator D
          clr     SCCR2_SerialControlReg2                  ;Clear Memory Byte
          ldd     #0xFFFE                                  ;Load Double Accumulator D
          std     PORTD_PortD                              ;Store Accumulator D
          ldd     #0xAAF8                                  ;Load Double Accumulator D
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   clr 0c2 oc3 oc4 oc5
          stab    CFORC_TimerForceCompare                  ;Store Accumulator B
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
Lbl_E807: ldab    SwitchPortAccessReg1                     ;Load Accumulator B
          bitb    #0x40 ;(01000000)                        ;Bit(s) Test B with Memory
          beq     Lbl_E817                                 ;Branch if = Zero
          jsr     Lbl_E6D7                                 ;Jump to Subroutine
          jmp     Lbl_E807                                 ;Jump
Le814:    jmp     Lbl_E807                                 ;Jump
Lbl_E817: jsr     Lbl_E6D7                                 ;Jump to Subroutine
          ldaa    #0x40 ;(01000000)                        ;Load Accumulator A
Lbl_E81C: ldab    SwitchPortAccessReg1                     ;Load Accumulator B
          bitb    #0x40 ;(01000000)                        ;Bit(s) Test B with Memory
          bne     Lbl_E807                                 ;Branch if Not = Zero
          deca                                             ;Decrement Accumulator A
          bne     Lbl_E81C                                 ;Branch if Not = Zero
          jsr     Lbl_E6D7                                 ;Jump to Subroutine
          jmp     V_ResetVector                            ;Jump
CountRamValuesFrom05to20:
          clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          ldx     #Ram_05                                  ;Load Index Register X
Lbl_E831: addb    0x00, X                                  ;Add Memory to B
          bcc     Lbl_E836                                 ;Branch if Higher or Same
          inca                                             ;Increment Accumulator A
Lbl_E836: inx                                              ;Increment Index Register X
          cpx     #0x0020                                  ;Compare X to Memory 16-Bit
          bcs     Lbl_E831                                 ;Branch if Lower
          rts                                              ;Return from Subroutine
Le83d:    ldaa    #0x16 ;(00010110)                        ;Load Accumulator A
;   sending 00010110 to 0x103b erases eeprom byte
          bsr     Lbl_E843                                 ;Branch to Subroutine
;   this code erases the eeprom byte at address in X
          ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
;   sending 00000010 to 0x103b starts eeprom programming mode
Lbl_E843: staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          stab    0x00, X                                  ;Store Accumulator B
          inca                                             ;Increment Accumulator A
;   sending 00000011 to 0x103b stops eeprom programming mode
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          ldy     #0x1658                                  ;Load Index Register Y
;   0x1658=5720   5720 loops x 7 cycles per loop * .0000005 per cycle = 20 mSecs
Lbl_E850: dey                                              ;Decrement Index Register Y
          bne     Lbl_E850                                 ;Branch if Not = Zero
          deca                                             ;Decrement Accumulator A
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          rts                                              ;Return from Subroutine
EmissionMaintenanceReminder2_MM:
          brset   *BitFlags6a_t3, #b6_26_drbToggle1, Lbl_E864 ;(01000000)  ;Branch if Bit(s) Set
          jmp     Lbl_E8ED                                 ;Jump
Lbl_E864: ldaa    PPROG_EEPROMControlReg                   ;Load Accumulator A
          beq     Lbl_E87A                                 ;Branch if = Zero
          bclr    *BitFlags6a_t3, #b7_26_bt7 ;(10000000)   ;Clear Bits(s)
          cmpa    #0x17 ;(00010111)                        ;Compare A to Memory
          bne     Lbl_E875                                 ;Branch if Not = Zero
          bset    *BitFlags6a_t3, #b3_26_bt3 ;(00001000)   ;Set Bit(s)
          bra     Lbl_E880                                 ;Branch Always
Lbl_E875: bclr    *BitFlags6a_t3, #b3_26_bt3 ;(00001000)   ;Clear Bits(s)
          bra     Lbl_E880                                 ;Branch Always
Lbl_E87A: bset    *BitFlags6a_t3, #b7_26_bt7 ;(10000000)   ;Set Bit(s)
          bclr    *BitFlags6a_t3, #b3_26_bt3 ;(00001000)   ;Clear Bits(s)
Lbl_E880: clra                                             ;Clear Accumulator A
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          ldaa    CountdownTimerFromKeyOn                  ;Load Accumulator A
          beq     Lbl_E892                                 ;Branch if = Zero
          ldab    #0x03 ;(00000011)                        ;Load Accumulator B
          cba                                              ;Compare A to B
          bcc     Lbl_E892                                 ;Branch if Higher or Same
          tba                                              ;Transfer B to A
          staa    CountdownTimerFromKeyOn                  ;Store Accumulator A
Lbl_E892: ldx     #TL_TL_b600                              ;Load Index Register X
          ldab    DRBOffsetStored_HB                       ;Load Accumulator B
          abx                                              ;Add B to X
          ldab    DRBOffsetStored_LB                       ;Load Accumulator B
          ldaa    0x00, X                                  ;Load Accumulator A
          cba                                              ;Compare A to B
          beq     Lbl_E8DA                                 ;Branch if = Zero
          brset   *BitFlags6a_t3, #b7_26_bt7, Lbl_E8C4 ;(10000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags6a_t3, #b3_26_bt3, Lbl_E8AD ;(00001000)  ;Branch if Bit(s) Clear
          cmpa    #0xFF ;(11111111)                        ;Compare A to Memory
          beq     Lbl_E8C4                                 ;Branch if = Zero
Lbl_E8AD: brset   *b5D_IPL2_t3, #b6_D6_EMRLight, Lbl_E8DA ;(01000000)  ;Branch if Bit(s) Set
          pshx                                             ;Push X onto Stack (Lo First)
          psha                                             ;Push A onto Stack
          pshb                                             ;Push B onto Stack
          ldd     #0x318A                                  ;Load Double Accumulator D
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          pulb                                             ;Pull B from Stack
          pula                                             ;Pull A from Stack
          pulx                                             ;Pull X from Stack (Hi First)
          bcc     Lbl_E8C4                                 ;Branch if Higher or Same
          bset    *b5D_IPL2_t3, #b6_D6_EMRLight ;(01000000)  ;Set Bit(s)
          bra     Lbl_E8DA                                 ;Branch Always
Lbl_E8C4: anda    DRBOffsetStored_LB                       ;AND A with Memory
          cmpa    DRBOffsetStored_LB                       ;Compare A to Memory
          beq     Lbl_E8D0                                 ;Branch if = Zero
          ldaa    #0x16 ;(00010110)                        ;Load Accumulator A
          bra     Lbl_E8D2                                 ;Branch Always
Lbl_E8D0: ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
;   sending 00000010 to 0x103b starts eeprom programming mode
Lbl_E8D2: staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          stab    0x00, X                                  ;Store Accumulator B
          inca                                             ;Increment Accumulator A
;   sending 00000011 to 0x103b stops eeprom programming mode
          bra     Lbl_E8EE                                 ;Branch Always
Lbl_E8DA: bclr    *BitFlags6a_t3, #b6_26_drbToggle1 ;(01000000)  ;Clear Bits(s)
          brset   *BitFlags6a_t3, #b5_26_drbToggle2, Lbl_E8ED ;(00100000)  ;Branch if Bit(s) Set
          ldaa    #0x03 ;(00000011)                        ;Load Accumulator A
          cmpa    CountdownTimerFromKeyOn                  ;Compare A to Memory
          bne     Lbl_E8ED                                 ;Branch if Not = Zero
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          staa    CountdownTimerFromKeyOn                  ;Store Accumulator A
Lbl_E8ED: clra                                             ;Clear Accumulator A
Lbl_E8EE: staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          rts                                              ;Return from Subroutine
ErrorCodeResetEeprom:
          ldx     #TL_TL_b610                              ;Load Index Register X
Lbl_E8F5: ldab    #0x10 ;(00010000)                        ;Load Accumulator B
          abx                                              ;Add B to X
          cpx     #0xB650                                  ;Compare X to Memory 16-Bit
          bhi     Lbl_E906                                 ;Branch if Higher
          ldaa    0x00, X                                  ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_E906                                 ;Branch if = Zero
          bsr     Lbl_E907                                 ;Branch to Subroutine
          bra     Lbl_E8F5                                 ;Branch Always
Lbl_E906: rts                                              ;Return from Subroutine
Lbl_E907: ldaa    #0x0E ;(00001110)                        ;Load Accumulator A
;   sending 00000010 to 0x103b starts eeprom programming mode
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          stab    0x00, X                                  ;Store Accumulator B
          inca                                             ;Increment Accumulator A
;   sending 00000011 to 0x103b stops eeprom programming mode
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          ldy     #0x1652                                  ;Load Index Register Y
;   0x1652=5714   5714 loops x 7 cycles per loop * .0000005 per cycle = 20 mSecs
Lbl_E916: dey                                              ;Decrement Index Register Y
          bne     Lbl_E916                                 ;Branch if Not = Zero
          deca                                             ;Decrement Accumulator A
          staa    PPROG_EEPROMControlReg                   ;Store Accumulator A
          clr     PPROG_EEPROMControlReg                   ;Clear Memory Byte
          sei                                              ;Set Mask Disable Int
          jsr     OCToggleAndResetCopTimer                 ;Jump to Subroutine
          cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
V_IC2_Interrupt_SpeedometerSignal:
          ldd     TIC2_Counter_IC2_Speedometer             ;Load Double Accumulator D
          asld                                             ;Arithmetic Shift Left D
          std     Temp5_t3                                 ;Store Accumulator D
          jsr     DetermineIfSpeedoSensorOnOrOff           ;Jump to Subroutine
          beq     Lbl_E942                                 ;Branch if = Zero
          fdiv                                             ;Frac Div D/X X=q*65536 D=R
          jsr     DetermineIfSpeedoSensorOnOrOff           ;Jump to Subroutine
          beq     Lbl_E942                                 ;Branch if = Zero
          fdiv                                             ;Frac Div D/X X=q*65536 D=R
          jsr     DetermineIfSpeedoSensorOnOrOff           ;Jump to Subroutine
          beq     Lbl_E942                                 ;Branch if = Zero
          jmp     JumpTo_ResetSpeedometerInterruptFlag     ;Jump
Lbl_E942: ldd     Counter_SpeedSensorInterrupt_HB          ;Load Double Accumulator D
          addd    #0x0001                                  ;Add 16-Bit to D
          std     Counter_SpeedSensorInterrupt_HB          ;Store Accumulator D
          bne     Lbl_E94E                                 ;Branch if Not = Zero
          bset    *IPL1, #b7_20_bt7 ;(10000000)            ;Set Bit(s)
Lbl_E94E: ldaa    Counter_SpeedSensorInterrupt_HB_X        ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_E955                                 ;Branch if = Zero
          staa    Counter_SpeedSensorInterrupt_HB_X        ;Store Accumulator A
Lbl_E955: ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          subd    #0x0500                                  ;Subtract Memory from D
          ldaa    BitFlags24                               ;Load Accumulator A
          bcc     Lbl_E97F                                 ;Branch if Higher or Same
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          bne     Lbl_E966                                 ;Branch if Not = Zero
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          bra     Lbl_E986                                 ;Branch Always
Lbl_E966: anda    #0x1F ;(00011111)                        ;AND A with Memory
          oraa    #0x08 ;(00001000)                        ;OR Accumulator A (Inclusive)
          staa    BitFlags24                               ;Store Accumulator A
          clra                                             ;Clear Accumulator A
          staa    CruiseControlVar4                        ;Store Accumulator A
          staa    Counter_SomethingWithDistributor         ;Store Accumulator A
          staa    Counter_TimerRegHalfOverflowBetweenSpeedoPulses ;Store Accumulator A
          ldd     VehicleSpeed_HB                          ;Load Double Accumulator D
          addd    #0x0053                                  ;Add 16-Bit to D
          std     VehicleSpeed_HB                          ;Store Accumulator D
          jmp     JumpTo_ResetSpeedometerInterruptFlag     ;Jump
Lbl_E97F: bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_E986                                 ;Branch if = Zero
          jmp     Lbl_EA03                                 ;Jump
Lbl_E986: adda    #0x20 ;(00100000)                        ;Add Memory to A
          bcs     Lbl_E990                                 ;Branch if Lower
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          staa    BitFlags24                               ;Store Accumulator A
          bra     JumpTo_ResetSpeedometerInterruptFlag     ;Branch Always
Lbl_E990: staa    BitFlags24                               ;Store Accumulator A
          ldab    CruiseControlVar4                        ;Load Accumulator B
          beq     Lbl_E9B6                                 ;Branch if = Zero
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          bne     Lbl_E9B6                                 ;Branch if Not = Zero
          ldaa    #0x3A ;(00111010)                        ;Load Accumulator A
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
          bcc     Lbl_E9A6                                 ;Branch if Higher or Same
          ldaa    #0x03 ;(00000011)                        ;Load Accumulator A
Lbl_E9A6: tab                                              ;Transfer A to B
          ldaa    Counter_SomethingWithDistributor         ;Load Accumulator A
          suba    CruiseControlVar4                        ;Subtract Memory from A
          bcc     Lbl_E9B0                                 ;Branch if Higher or Same
          nega                                             ;2's Complement A
Lbl_E9B0: sba                                              ;Subtract B from A
          bcs     Lbl_E9BC                                 ;Branch if Lower
          bset    *BitFlags24, #b3_24_BadSpeedo2 ;(00001000)  ;Set Bit(s)
Lbl_E9B6: ldab    Counter_SomethingWithDistributor         ;Load Accumulator B
          stab    CruiseControlVar4                        ;Store Accumulator B
Lbl_E9BC: clra                                             ;Clear Accumulator A
          staa    Counter_SomethingWithDistributor         ;Store Accumulator A
          ldd     Temp5_t3                                 ;Load Double Accumulator D
          ldx     #Counter_TimerRegHalfOverflowBetweenSpeedoPulses ;Load Index Register X
          ldy     #LDXi_6490                               ;Load Index Register Y
          jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM ;Jump to Subroutine
          ldaa    Counter_TimerRegHalfOverflowBetweenSpeedoPulses ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          tab                                              ;Transfer A to B
          oraa    TimerOverflowsBetweenSpeedoPulses        ;OR Accumulator A (Inclusive)
          beq     Lbl_E9DE                                 ;Branch if = Zero
          stab    TimerOverflowsBetweenSpeedoPulses        ;Store Accumulator B
          ldd     Temp5_t3                                 ;Load Double Accumulator D
          subd    PreviousVehicleSpeed_HB                  ;Subtract Memory from D
          bra     Lbl_E9F3                                 ;Branch Always
Lbl_E9DE: ldd     Temp5_t3                                 ;Load Double Accumulator D
          subd    PreviousVehicleSpeed_HB                  ;Subtract Memory from D
          subd    SpeedoSensorPulsewidth_HB                ;Subtract Memory from D
          beq     Lbl_E9F5                                 ;Branch if = Zero
          asra                                             ;Arithmetic Shift Right A
          rorb                                             ;Rotate Right
          asra                                             ;Arithmetic Shift Right A
          rorb                                             ;Rotate Right
          subd    #0x0000                                  ;Subtract Memory from D
          bne     Lbl_E9F1                                 ;Branch if Not = Zero
          incb                                             ;Increment Accumulator B
Lbl_E9F1: addd    SpeedoSensorPulsewidth_HB                ;Add 16-Bit to D
Lbl_E9F3: std     SpeedoSensorPulsewidth_HB                ;Store Accumulator D
Lbl_E9F5: ldd     Temp5_t3                                 ;Load Double Accumulator D
          std     PreviousVehicleSpeed_HB                  ;Store Accumulator D
          clra                                             ;Clear Accumulator A
          staa    Counter_TimerRegHalfOverflowBetweenSpeedoPulses ;Store Accumulator A
JumpTo_ResetSpeedometerInterruptFlag:
          ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          rti                                              ;Return from Interrupt
Lbl_EA03: anda    #0xEF ;(11101111)                        ;AND A with Memory
          staa    BitFlags24                               ;Store Accumulator A
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          staa    TimerOverflowsBetweenSpeedoPulses        ;Store Accumulator A
          ldd     #0x5F90                                  ;Load Double Accumulator D
          bra     Lbl_E9F3                                 ;Branch Always
DetermineIfSpeedoSensorOnOrOff:
          ldaa    TCTL2_TimerControlReg2                   ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          eora    PORTA_PortA                              ;Exclusive OR A with Memory
          bita    #0x02 ;(00000010)                        ;Bit(s) Test A with Memory
          rts                                              ;Return from Subroutine
V_OC1_Interrupt_vector:
          bsr     Interrupt_TimerOutputCapture1            ;Branch to Subroutine
          rti                                              ;Return from Interrupt
Interrupt_TimerOutputCapture1:
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    ADCTL_A2DControlReg                      ;Store Accumulator A
          ldd     TOC1_Counter_OC1                         ;Load Double Accumulator D
          addd    #0x01E0                                  ;Add 16-Bit to D
          cmpd    TCNT_Counter_FreeRunning16bit            ;Compare D to Memory 16-Bit
          bmi     Lbl_EA44                                 ;Branch if Minus
          subd    #0x0089                                  ;Subtract Memory from D
          cmpd    TCNT_Counter_FreeRunning16bit            ;Compare D to Memory 16-Bit
          bpl     Lbl_EA3F                                 ;Branch if Plus
          addd    #0x0089                                  ;Add 16-Bit to D
Lbl_EA3F: addd    #0x0089                                  ;Add 16-Bit to D
          bra     Lbl_EA4A                                 ;Branch Always
Lbl_EA44: ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    #0x01E0                                  ;Add 16-Bit to D
Lbl_EA4A: std     TOC1_Counter_OC1                         ;Store Accumulator D
          ldaa    TMSK1_TimerInterruptMask1                ;Load Accumulator A
          anda    #0x7F ;(01111111)                        ;AND A with Memory
          staa    TMSK1_TimerInterruptMask1                ;Store Accumulator A
          inc     Timer_AlternatorDutyCycle                ;Increment Memory Byte
          ldx     #SwitchPortAccessReg1                    ;Load Index Register X
ControlAlternator:
          ldaa    ATMOffset                                ;Load Accumulator A
          cmpa    #0x0D ;(00001101)                        ;Compare A to Memory
          bne     Lbl_EA64                                 ;Branch if Not = Zero
          jmp     Lbl_EAF2                                 ;Jump
Lbl_EA64: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_EA64                                 ;Branch if Plus
          jsr     ReadA2DBattVolts                         ;Jump to Subroutine
          staa    BatteryVoltsRaw                          ;Store Accumulator A
          cli                                              ;Clear Mask Enable Int
          cmpa    BatteryVolts                             ;Compare A to Memory
          bcc     Lbl_EA75                                 ;Branch if Higher or Same
          staa    BatteryVolts                             ;Store Accumulator A
Lbl_EA75: ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x0C ;(00001100)                        ;Compare A to Memory
;   385 rpm
          bcs     Lbl_EA83                                 ;Branch if Lower
          cmpa    #0x10 ;(00010000)                        ;Compare A to Memory
;   514 rpm
          bcc     Lbl_EA88                                 ;Branch if Higher or Same
          brset   *BitFlags24, #b0_24_AltBit1, Lbl_EA88 ;(00000001)  ;Branch if Bit(s) Set
Lbl_EA83: bclr    *BitFlags24, #b0_24_AltBit1 ;(00000001)  ;Clear Bits(s)
          bra     TurnAlternatorOff                        ;Branch Always
Lbl_EA88: bset    *BitFlags24, #b0_24_AltBit1 ;(00000001)  ;Set Bit(s)
          ldaa    BatteryVoltsRaw                          ;Load Accumulator A
          cmpa    #0x41 ;(01000001)                        ;Compare A to Memory
;   0x41 = 4.08 volts?
          bcc     Lbl_EA97                                 ;Branch if Higher or Same
          ldab    Counter_MainLoop                         ;Load Accumulator B
          bitb    #0x06 ;(00000110)                        ;Bit(s) Test B with Memory
          bne     TurnAlternatorOff                        ;Branch if Not = Zero
Lbl_EA97: brclr   *BitFlags21, #b4_21_a70b3, Lbl_EAB2 ;(00010000)  ;Branch if Bit(s) Clear
          ldaa    A2DResults2Temp                          ;Load Accumulator A
          bne     Lbl_EAA3                                 ;Branch if Not = Zero
          ldaa    BatteryVoltsRaw                          ;Load Accumulator A
          staa    A2DResults2Temp                          ;Store Accumulator A
Lbl_EAA3: suba    BatteryVoltsRaw                          ;Subtract Memory from A
          bls     TurnAlternatorOff                        ;Branch if Lower or Same
          cmpa    TL_BatteryVoltsHysteresisForAlternatorControl ;(0x04/4.00 out)  ;Compare A to Memory
          bls     TurnAlternatorOff                        ;Branch if Lower or Same
          bset    *BitFlags21, #b5_21_a70b2 ;(00100000)    ;Set Bit(s)
          bclr    *BitFlags21, #b4_21_a70b3 ;(00010000)    ;Clear Bits(s)
Lbl_EAB2: clr     A2DResults2Temp                          ;Clear Memory Byte
          ldaa    BatteryVoltsRaw                          ;Load Accumulator A
          suba    TargetBatteryVolts                       ;Subtract Memory from A
          bne     Lbl_EAC1                                 ;Branch if Not = Zero
          brclr   0x00, X, #$%00000100, TurnAlternatorOn   ;Branch if Bit(s) Clear
          bra     TurnAlternatorOff                        ;Branch Always
Lbl_EAC1: ldab    #0x07 ;(00000111)                        ;Load Accumulator B
          bcc     Lbl_EAD5                                 ;Branch if Higher or Same
          nega                                             ;2's Complement A
          cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          beq     Lbl_EACE                                 ;Branch if = Zero
          bcc     TurnAlternatorOn                         ;Branch if Higher or Same
          ldab    #0x03 ;(00000011)                        ;Load Accumulator B
Lbl_EACE: andb    Timer_AlternatorDutyCycle                ;AND B with Memory
          beq     TurnAlternatorOff                        ;Branch if = Zero
          bra     TurnAlternatorOn                         ;Branch Always
Lbl_EAD5: cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          beq     Lbl_EADD                                 ;Branch if = Zero
          bcc     TurnAlternatorOff                        ;Branch if Higher or Same
          ldab    #0x03 ;(00000011)                        ;Load Accumulator B
Lbl_EADD: andb    Timer_AlternatorDutyCycle                ;AND B with Memory
          bne     TurnAlternatorOff                        ;Branch if Not = Zero
TurnAlternatorOn:
          sei                                              ;Set Mask Disable Int
          bset    0x00, X, #$%00000100                     ;Set Bit(s)
          bset    *BitFlags24, #b1_24_AlternatorField ;(00000010)  ;Set Bit(s)
          bra     Lbl_EAF2                                 ;Branch Always
TurnAlternatorOff:
          sei                                              ;Set Mask Disable Int
          bclr    0x00, X, #$%00000100                     ;Clear Bits(s)
          bclr    *BitFlags24, #b1_24_AlternatorField ;(00000010)  ;Clear Bits(s)
Lbl_EAF2: bset    0x02, X, #$%00000100                     ;Set Bit(s)
          ldaa    #0x14 ;(00010100)                        ;Load Accumulator A
Lbl_EAF7: deca                                             ;Decrement Accumulator A
          bne     Lbl_EAF7                                 ;Branch if Not = Zero
          bclr    0x02, X, #$%00000100                     ;Clear Bits(s)
          cli                                              ;Clear Mask Enable Int
          ldaa    Timer_AlternatorDutyCycle                ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          bcs     XmitRequestedRamLocation                 ;Branch if Lower
          ldab    BitFlags36_t3                            ;Load Accumulator B
          bitb    #0x40 ;(01000000)                        ;Bit(s) Test B with Memory
          bne     AisDriveRoutine                          ;Branch if Not = Zero
          lsra                                             ;Logical Shift Right A
          bcs     XmitRequestedRamLocation                 ;Branch if Lower
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x5E ;(01011110)                        ;Compare A to Memory
;   3019 rpm
          bcs     AisDriveRoutine                          ;Branch if Lower
          ldaa    CurrentAisPosition                       ;Load Accumulator A
          cmpa    DesiredNewAisPosition                    ;Compare A to Memory
          beq     XmitRequestedRamLocation                 ;Branch if = Zero
AisDriveRoutine:
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    TL_MinVoltageForAis ;(0x71/7.09 volts)   ;Compare A to Memory
          bcs     XmitRequestedRamLocation                 ;Branch if Lower
          sei                                              ;Set Mask Disable Int
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          anda    #0xFE ;(11111110)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          ldab    CurrentAisPosition                       ;Load Accumulator B
          brclr   *BitFlags36_t3, #b6_7_UseAIS, Lbl_EB3F ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          tstb                                             ;Test for Zero or Minus
          bne     Lbl_EB47                                 ;Branch if Not = Zero
          bclr    *BitFlags36_t3, #b6_7_UseAIS ;(01000000)  ;Clear Bits(s)
          bra     Lbl_EB4F                                 ;Branch Always
Lbl_EB3F: ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          cmpb    DesiredNewAisPosition                    ;Compare B to Memory
          beq     Lbl_EB4F                                 ;Branch if = Zero
          bcs     Lbl_EB48                                 ;Branch if Lower
Lbl_EB47: nega                                             ;2's Complement A
Lbl_EB48: tab                                              ;Transfer A to B
          adda    CurrentAisPosition                       ;Add Memory to A
          staa    CurrentAisPosition                       ;Store Accumulator A
          bra     Lbl_EB50                                 ;Branch Always
Lbl_EB4F: clrb                                             ;Clear Accumulator B
Lbl_EB50: ldx     #gb_AISTEP_BitPatternForAisControl       ;Load Index Register X
          addb    BitFlags_36_t3                           ;Add Memory to B
          andb    #0x03 ;(00000011)                        ;AND B with Memory
          stab    BitFlags_36_t3                           ;Store Accumulator B
          abx                                              ;Add B to X
          ldab    0x00, X                                  ;Load Accumulator B
          tba                                              ;Transfer B to A
          comb                                             ;1's Complement B
          lslb                                             ;Logical Shift Left B
          lslb                                             ;Logical Shift Left B
          lslb                                             ;Logical Shift Left B
          lslb                                             ;Logical Shift Left B
          anda    #0x0F ;(00001111)                        ;AND A with Memory
          aba                                              ;Add Accumulators
          ldx     #PORTD_PortD                             ;Load Index Register X
          sei                                              ;Set Mask Disable Int
          bclr    0x00, X, #$%00100000                     ;Clear Bits(s)
          cmpa    SPSR_SerialPeripheralStatus              ;Compare A to Memory
          staa    SPDR_SerialPeripheralDataIO              ;Store Accumulator A
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x01 ;(00000001)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          mul                                              ;Multiply A x B = D
          bset    0x00, X, #$%00100000                     ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
XmitRequestedRamLocation:
          brclr   *DRBSerialMode, #b7_DB_FastSerial, Lbl_EBEA ;(10000000)  ;Branch if Bit(s) Clear
          ldaa    SCSR_SerialStatus                        ;Load Accumulator A
          bita    #0x0E ;(00001110)                        ;Bit(s) Test A with Memory
          psha                                             ;Push A onto Stack
          pula                                             ;Pull A from Stack
          beq     Lbl_EB92                                 ;Branch if = Zero
          ldab    SCDR_SerialData                          ;Load Accumulator B
          bra     Lbl_EBEA                                 ;Branch Always
Lbl_EB92: bita    #0x20 ;(00100000)                        ;Bit(s) Test A with Memory
          beq     Lbl_EBEA                                 ;Branch if = Zero
          ldab    SCDR_SerialData                          ;Load Accumulator B
          cmpb    #0xF2 ;(11110010)                        ;Compare B to Memory
          bne     Lbl_EBA5                                 ;Branch if Not = Zero
Lbl_EB9D: bclr    *BitFlags21, #b6_21_a70b0 ;(01000000)    ;Clear Bits(s)
          bclr    *BitFlags2f, #$%10000000                 ;Clear Bits(s)
          bra     Lbl_EBE7                                 ;Branch Always
Lbl_EBA5: cmpb    #0xF4 ;(11110100)                        ;Compare B to Memory
          bne     Lbl_EBB1                                 ;Branch if Not = Zero
          bset    *BitFlags2f, #$%10000000                 ;Set Bit(s)
          bclr    *BitFlags21, #b6_21_a70b0 ;(01000000)    ;Clear Bits(s)
          bra     Lbl_EBE7                                 ;Branch Always
Lbl_EBB1: cmpb    #0xF6 ;(11110110)                        ;Compare B to Memory
          bne     Lbl_EBBD                                 ;Branch if Not = Zero
          bset    *BitFlags21, #b6_21_a70b0 ;(01000000)    ;Set Bit(s)
          bclr    *BitFlags2f, #$%10000000                 ;Clear Bits(s)
          bra     Lbl_EBE7                                 ;Branch Always
Lbl_EBBD: cmpb    #0xFE ;(11111110)                        ;Compare B to Memory
;   no special sci routine so get value at 0x00 + sciIn
          bne     Lbl_EBC6                                 ;Branch if Not = Zero
          bclr    *DRBSerialMode, #b7_DB_FastSerial| b5_DB_TestType3| b4_DB_TestType2 ;(10110000)  ;Clear Bits(s)
          bra     Lbl_EB9D                                 ;Branch Always
Lbl_EBC6: brset   *BitFlags21, #b6_21_a70b0, Lbl_EBD6 ;(01000000)  ;Branch if Bit(s) Set
          brset   *BitFlags2f, #$%10000000, Lbl_EBDE       ;Branch if Bit(s) Set
          ldx     #Ram_00                                  ;Load Index Register X
          abx                                              ;Add B to X
          ldab    0x00, X                                  ;Load Accumulator B
          bra     Lbl_EBE7                                 ;Branch Always
Lbl_EBD6: ldx     #CountdownTimerFromKeyOn                 ;Load Index Register X
          abx                                              ;Add B to X
          ldab    0x00, X                                  ;Load Accumulator B
ConvertMAPVoltsToValue1:
          bra     Lbl_EBE7                                 ;Branch Always
Lbl_EBDE: ldx     #0xEC06                                  ;Load Index Register X
          lslb                                             ;Logical Shift Left B
          abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          ldab    0x00, X                                  ;Load Accumulator B
Lbl_EBE7: stab    SCDR_SerialData                          ;Store Accumulator B
Lbl_EBEA: sei                                              ;Set Mask Disable Int
Lbl_EBEB: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_EBEB                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          cmpa    MapVolts_X                               ;Compare A to Memory
          bcs     Lbl_EBF9                                 ;Branch if Lower
          staa    MapVolts_X                               ;Store Accumulator A
Lbl_EBF9: cmpa    MapValue3                                ;Compare A to Memory
          bcc     Lbl_EBFF                                 ;Branch if Higher or Same
          staa    MapValue3                                ;Store Accumulator A
Lbl_EBFF: ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          oraa    TMSK1_TimerInterruptMask1                ;OR Accumulator A (Inclusive)
          staa    TMSK1_TimerInterruptMask1                ;Store Accumulator A
          rts                                              ;Return from Subroutine
FastDataOutputAddressTable:
          .word ErrorBitRegisterStored3
          .word ErrorBitRegister0
          .word ErrorCodeUpdateKeyOnCount
          .word ErrorCodeUpdateKeyOnCount2
          .word ErrorCodeUpdateKeyOnCount3
          .word ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
          .word ClearTheErrorTimer_0
          .word ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB
          .word ClearTheErrorTimer_1
          .word EngineRpm_HB
          .word EngineRpm_LB
          .word VehicleSpeed_HB
          .word VehicleSpeed_LB
          .word StartupSwitchMirror1
          .word BatteryVolts
          .word CoolantVoltsTmp2
          .word AmbientAirTempVolts2
          .word LastTpsVolts
          .word LowestSessionTpsVolts
          .word TpsVolts
          .word LastCoolantTempVolts
          .word CoolantTemp
          .word MapValue_t3
          .word MapValue
          .word BaroPressure
          .word MapVolts
          .word O2SensorVolts
gw_EC3E:  .byte 0xFF, 0xFF ;1-2
Wrd_EC40: .word LastChargeTempVolts
          .word ChargeTempVolts
gw_EC44:  .byte 0xFF, 0xFF ;1-2
          .byte 0xFF, 0xFF ;3-4
          .byte 0xFF, 0xFF ;5-6
          .byte 0xFF, 0xFF ;7-8
          .byte 0xFF, 0xFF ;9-10
          .byte 0xFF, 0xFF ;11-12
          .byte 0xFF, 0xFF ;13-14
          .byte 0xFF, 0xFF ;15-16
Wrd_EC54: .word InjectorPulsewidth_HB
          .word InjectorPulsewidth_LB
          .word InjectorPulsewidth_HB
          .word InjectorPulsewidth_LB
          .word Ram_0B
gw_EC5E:  .byte 0xFF, 0xFF ;1-2
Lec60:    .word ValueFromAdaptiveMemory
gw_EC62:  .byte 0xFF, 0xFF ;1-2
Lec64:    .word AdvanceTemporary
gw_EC66:  .byte 0xFF, 0xFF ;1-2
          .byte 0xFF, 0xFF ;3-4
          .byte 0xFF, 0xFF ;5-6
          .byte 0xFF, 0xFF ;7-8
          .byte 0xFF, 0xFF ;9-10
Wrd_EC70: .word TargetIdleSpeedHB
          .word TargetIdleSpeedLB
          .word DesiredNewAisPosition
gw_EC76:  .byte 0xFF, 0xFF ;1-2
          .byte 0xFF, 0xFF ;3-4
Wrd_EC7A: .word TargetBatteryVolts
          .word CruiseSpeedSetpoint
          .word PIA1_Buffer_t3
          .word PIA2_Buffer_t3
          .word CurrentAisPosition
          .word Counter_Cruise_1
          .word CCDFlags5
          .word BitFlags_BF_t3
          .word BitFlags29
Lbl_EC8C: ldd     #0x8EFF                                  ;Load Double Accumulator D
          stab    TFLG1_TimerInterruptFlag1                ;Store Accumulator B
          staa    TMSK1_TimerInterruptMask1                ;Store Accumulator A
          stab    TFLG2_TimerInterruptFlag2                ;Store Accumulator B
          clr     PACNT_PulseAccumulatorCounter            ;Clear Memory Byte
Lbl_EC9B: ldab    #0x01 ;(00000001)                        ;Load Accumulator B
          ldaa    SwitchPortAccessReg2                     ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_ECA6                                 ;Branch if = Zero
          ldab    #0x00 ;(00000000)                        ;Load Accumulator B
Lbl_ECA6: stab    PIA_Ctrl_2                               ;Store Accumulator B
          anda    #0x01 ;(00000001)                        ;AND A with Memory
          eora    SwitchPortAccessReg2                     ;Exclusive OR A with Memory
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_ECC0                                 ;Branch if = Zero
          ldaa    SwitchPortAccessReg2                     ;Load Accumulator A
          ldab    #0x01 ;(00000001)                        ;Load Accumulator B
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_ECBD                                 ;Branch if = Zero
          ldab    #0x00 ;(00000000)                        ;Load Accumulator B
Lbl_ECBD: stab    PIA_Ctrl_2                               ;Store Accumulator B
Lbl_ECC0: ldd     #0x01FB                                  ;Load Double Accumulator D
          stab    PIA_Ctrl_4                               ;Store Accumulator B
          staa    PIA_Ctrl_3                               ;Store Accumulator A
          rts                                              ;Return from Subroutine
DealWithConfigurationAndPulseAccumulator_MM:
          ldx     #PORTA_PortA                             ;Load Index Register X
          brset   0x09, X, #$%00111010, Lbl_ECD4           ;Branch if Bit(s) Set
          bset    0x09, X, #$%00111010                     ;Set Bit(s)
Lbl_ECD4: brclr   0x09, X, #$%00000101, Lbl_ECDB           ;Branch if Bit(s) Clear
          bclr    0x09, X, #$%00000101                     ;Clear Bits(s)
Lbl_ECDB: brclr   0x0C, X, #$%11111000, Lbl_ECE2           ;Branch if Bit(s) Clear
          bclr    0x0C, X, #$%11111111                     ;Clear Bits(s)
Lbl_ECE2: brclr   0x0D, X, #$%11111000, Lbl_ECE9           ;Branch if Bit(s) Clear
          bclr    0x0D, X, #$%11111111                     ;Clear Bits(s)
Lbl_ECE9: brset   0x20, X, #$%10100010, Lbl_ECF0           ;Branch if Bit(s) Set
          bset    0x20, X, #$%10100010                     ;Set Bit(s)
Lbl_ECF0: brclr   0x20, X, #$%00001100, Lbl_ECF7           ;Branch if Bit(s) Clear
          bclr    0x20, X, #$%00001100                     ;Clear Bits(s)
Lbl_ECF7: brset   0x21, X, #$%00011010, Lbl_ECFE           ;Branch if Bit(s) Set
          bset    0x21, X, #$%00011010                     ;Set Bit(s)
Lbl_ECFE: brclr   0x21, X, #$%00100101, Lbl_ED05           ;Branch if Bit(s) Clear
          bclr    0x21, X, #$%00100101                     ;Clear Bits(s)
Lbl_ED05: brset   0x22, X, #$%10001110, Lbl_ED0C           ;Branch if Bit(s) Set
          bset    0x22, X, #$%10001110                     ;Set Bit(s)
Lbl_ED0C: brclr   0x22, X, #$%01100001, Lbl_ED13           ;Branch if Bit(s) Clear
          bclr    0x22, X, #$%01100001                     ;Clear Bits(s)
Lbl_ED13: brclr   0x24, X, #$%11110000, Lbl_ED1A           ;Branch if Bit(s) Clear
          bclr    0x24, X, #$%11110000                     ;Clear Bits(s)
Lbl_ED1A: brset   0x26, X, #$%01110000, Lbl_ED21           ;Branch if Bit(s) Set
          bset    0x26, X, #$%01110000                     ;Set Bit(s)
Lbl_ED21: brclr   0x26, X, #$%10000000, Lbl_ED28           ;Branch if Bit(s) Clear
          bclr    0x26, X, #$%10000000                     ;Clear Bits(s)
Lbl_ED28: brset   0x28, X, #$%01010100, Lbl_ED2F           ;Branch if Bit(s) Set
          bset    0x28, X, #$%01010100                     ;Set Bit(s)
Lbl_ED2F: brclr   0x28, X, #$%10101011, Lbl_ED36           ;Branch if Bit(s) Clear
          bclr    0x28, X, #$%10101011                     ;Clear Bits(s)
Lbl_ED36: brclr   0x2C, X, #$%00011000, Lbl_ED3D           ;Branch if Bit(s) Clear
          bclr    0x2C, X, #$%00011000                     ;Clear Bits(s)
Lbl_ED3D: brset   0x2D, X, #$%00001100, Lbl_ED44           ;Branch if Bit(s) Set
          bset    0x2D, X, #$%00001100                     ;Set Bit(s)
Lbl_ED44: brclr   0x2D, X, #$%11110011, Lbl_ED4B           ;Branch if Bit(s) Clear
          bclr    0x2D, X, #$%11110011                     ;Clear Bits(s)
Lbl_ED4B: brset   0x39, X, #$%10001000, Lbl_ED52           ;Branch if Bit(s) Set
          bset    0x39, X, #$%10001000                     ;Set Bit(s)
Lbl_ED52: brclr   0x39, X, #$%01000000, Lbl_ED59           ;Branch if Bit(s) Clear
          bclr    0x39, X, #$%01000000                     ;Clear Bits(s)
Lbl_ED59: brset   0x3C, X, #$%00001111, Lbl_ED62           ;Branch if Bit(s) Set
          sei                                              ;Set Mask Disable Int
          bset    0x3C, X, #$%00001111                     ;Set Bit(s)
          cli                                              ;Clear Mask Enable Int
Lbl_ED62: ldx     #SwitchPortAccessReg1                    ;Load Index Register X
          sei                                              ;Set Mask Disable Int
          ldaa    TL_IDENT1 ;(0x11/17.00 Y units)          ;Load Accumulator A
          cmpa    #0x11 ;(00010001)                        ;Compare A to Memory
          beq     Lbl_ED7D                                 ;Branch if = Zero
          brclr   0x02, X, #$%01110000, Lbl_ED74           ;Branch if Bit(s) Clear
          bclr    0x02, X, #$%01110000                     ;Clear Bits(s)
Lbl_ED74: brset   0x02, X, #$%10000011, Lbl_ED8B           ;Branch if Bit(s) Set
          bset    0x02, X, #$%10000011                     ;Set Bit(s)
          bra     Lbl_ED8B                                 ;Branch Always
Lbl_ED7D: brclr   0x02, X, #$%11110000, Lbl_ED84           ;Branch if Bit(s) Clear
          bclr    0x02, X, #$%11110000                     ;Clear Bits(s)
Lbl_ED84: brset   0x02, X, #$%00000011, Lbl_ED8B           ;Branch if Bit(s) Set
          bset    0x02, X, #$%00000011                     ;Set Bit(s)
Lbl_ED8B: cli                                              ;Clear Mask Enable Int
          brclr   0x03, X, #$%11111110, Lbl_ED93           ;Branch if Bit(s) Clear
          bclr    0x03, X, #$%11111110                     ;Clear Bits(s)
Lbl_ED93: brclr   0x04, X, #$%11111110, Lbl_ED9A           ;Branch if Bit(s) Clear
          bclr    0x04, X, #$%11111110                     ;Clear Bits(s)
Lbl_ED9A: brset   0x06, X, #$%11111000, Lbl_EDA1           ;Branch if Bit(s) Set
          bset    0x06, X, #$%11111000                     ;Set Bit(s)
Lbl_EDA1: brclr   0x06, X, #$%00000110, Lbl_EDA8           ;Branch if Bit(s) Clear
          bclr    0x06, X, #$%00000110                     ;Clear Bits(s)
Lbl_EDA8: rts                                              ;Return from Subroutine
gw_EDA9:  .byte 0x46, 0x14 ;1-2
          .byte 0x3D, 0x15 ;3-4
          .byte 0x45, 0x13 ;5-6
lb800_t3: .byte 0x3D, 0x14 ;1-2
gw_EDB1:  .byte 0x15, 0x13 ;1-2
VerifyOperationOfFuelInjectorDrivers_MM:
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x5E ;(01011110)                        ;Compare A to Memory
;   3019 rpm
          bcc     Lbl_EE27                                 ;Branch if Higher or Same
          ldaa    BatteryVolts                             ;Load Accumulator A
          cmpa    #0xC3 ;(11000011)                        ;Compare A to Memory
;   12.2 volt
          bcs     Lbl_EE27                                 ;Branch if Lower
          ldaa    SwitchPortAccessReg1                     ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_EE27                                 ;Branch if = Zero
          brset   *PIA2_Buffer_t3, #b4_CE_ASD, Lbl_EE27 ;(00010000)  ;Branch if Bit(s) Set
          bita    #0x40 ;(01000000)                        ;Bit(s) Test A with Memory
          bne     Lbl_EE27                                 ;Branch if Not = Zero
          brset   *b5d_IPL2, #b5_D7_InjFault, Lbl_EE27 ;(00100000)  ;Branch if Bit(s) Set
          sei                                              ;Set Mask Disable Int
          ldaa    SwitchPortAccessReg2                     ;Load Accumulator A
          anda    #0xF0 ;(11110000)                        ;AND A with Memory
          bne     Lbl_EE2A                                 ;Branch if Not = Zero
          brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_EDE5 ;(10000000)  ;Branch if Bit(s) Set
          ldaa    PORTA_PortA                              ;Load Accumulator A
          bita    #0x60 ;(01100000)                        ;Bit(s) Test A with Memory
          bne     Lbl_EE2A                                 ;Branch if Not = Zero
Lbl_EDE5: brclr   *BitFlags21, #b7_21_DistSync, Lbl_EE2A ;(10000000)  ;Branch if Bit(s) Clear
          ldab    #0x07 ;(00000111)                        ;Load Accumulator B
Lbl_EDEB: decb                                             ;Decrement Accumulator B
          bne     Lbl_EDEB                                 ;Branch if Not = Zero
          ldaa    PIA_Ctrl_4                               ;Load Accumulator A
          bita    #0x04 ;(00000100)                        ;Bit(s) Test A with Memory
          bne     Lbl_EE22                                 ;Branch if Not = Zero
          ldaa    BitFlags_BF_t3                           ;Load Accumulator A
          ldab    CylinderPointer                          ;Load Accumulator B
          cli                                              ;Clear Mask Enable Int
          ldx     #lb800_t3                                ;Load Index Register X
          brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_EE04 ;(10000000)  ;Branch if Bit(s) Set
          ldx     #gw_EDA9                                 ;Load Index Register X
Lbl_EE04: cmpa    #0x84 ;(10000100)                        ;Compare A to Memory
          bne     Lbl_EE13                                 ;Branch if Not = Zero
          decb                                             ;Decrement Accumulator B
          bpl     Lbl_EE13                                 ;Branch if Plus
          ldab    #0x03 ;(00000011)                        ;Load Accumulator B
          brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_EE13 ;(10000000)  ;Branch if Bit(s) Set
          ldab    #0x05 ;(00000101)                        ;Load Accumulator B
Lbl_EE13: andb    #0x07 ;(00000111)                        ;AND B with Memory
          abx                                              ;Add B to X
          ldaa    0x00, X                                  ;Load Accumulator A
          ldab    #0x90 ;(10010000)                        ;Load Accumulator B
          jsr     ThrowNonCriticalError                    ;Jump to Subroutine
          bcc     Lbl_EE22                                 ;Branch if Higher or Same
          bset    *b5d_IPL2, #b5_D7_InjFault ;(00100000)   ;Set Bit(s)
Lbl_EE22: ldab    #0x04 ;(00000100)                        ;Load Accumulator B
          stab    PIA_Ctrl_4                               ;Store Accumulator B
Lbl_EE27: bclr    *BitFlags21, #b7_21_DistSync ;(10000000)  ;Clear Bits(s)
Lbl_EE2A: cli                                              ;Clear Mask Enable Int
          rts                                              ;Return from Subroutine
CrankPickupIntrAddressTable:
          .word CrankInterrupt_FallingEdge
          .word CrankInterrupt_HandleCamSensorRisingEdgeA
          .word CrankInterrupt_HandleCamSensorRisingEdgeB
          .word CrankInterrupt_CalculateFuel
V_IC1_Interrupt_vector:
          ldd     #0x0510                                  ;Load Double Accumulator D
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
;   00000101 sets distributor bit flag
          stab    ADCTL_A2DControlReg                      ;Store Accumulator B
;   set control register to group 0x10
          ldx     EngineRpm_HB                             ;Load Index Register X
          cpx     #0xBB80                                  ;Compare X to Memory 16-Bit
;   compare engine rpm to 6000 rpm
          bcc     Lbl_EE64                                 ;Branch if Higher or Same
          ldx     TIC1_Counter_IC1_CamSensor               ;Load Index Register X
          ldab    #0x0C ;(00001100)                        ;Load Accumulator B
          abx                                              ;Add B to X
          ldaa    #0x04 ;(00000100)                        ;Load Accumulator A
Lbl_EE4C: bita    PORTA_PortA                              ;Bit(s) Test A with Memory
          beq     Lbl_EE61                                 ;Branch if = Zero
          cpx     TCNT_Counter_FreeRunning16bit            ;Compare X to Memory 16-Bit
          bpl     Lbl_EE4C                                 ;Branch if Plus
          ldd     #0x0510                                  ;Load Double Accumulator D
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          stab    ADCTL_A2DControlReg                      ;Store Accumulator B
          bra     Lbl_EE64                                 ;Branch Always
Lbl_EE61: jmp     Lbl_F5FB                                 ;Jump
Lbl_EE64: ldab    CountdownTimerFromKeyOn                  ;Load Accumulator B
          bne     Lbl_EE6C                                 ;Branch if Not = Zero
          bclr    *Ram_05, #$%00000001                     ;Clear Bits(s)
Lbl_EE6C: clr     ATMOffset                                ;Clear Memory Byte
          ldaa    DRBPointer1                              ;Load Accumulator A
          cmpa    #0x0A ;(00001010)                        ;Compare A to Memory
          bne     Lbl_EE7B                                 ;Branch if Not = Zero
          clr     DRBPointer1                              ;Clear Memory Byte
          bclr    *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2 ;(00110000)  ;Clear Bits(s)
Lbl_EE7B: ldab    BitFlags_BF_t3                           ;Load Accumulator B
          bpl     Lbl_EEA6                                 ;Branch if Plus
          ldaa    Ram_F4                                   ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_EE8F                                 ;Branch if = Zero
          cmpa    #0xFF ;(11111111)                        ;Compare A to Memory
          bne     Lbl_EE8D                                 ;Branch if Not = Zero
          ldab    #0x01 ;(00000001)                        ;Load Accumulator B
          stab    PIA_Ctrl_4                               ;Store Accumulator B
Lbl_EE8D: staa    Ram_F4                                   ;Store Accumulator A
Lbl_EE8F: ldab    BitFlags_BF_t3                           ;Load Accumulator B
          bitb    #0x04 ;(00000100)                        ;Bit(s) Test B with Memory
          beq     Lbl_EE97                                 ;Branch if = Zero
          andb    #0xF8 ;(11111000)                        ;AND B with Memory
Lbl_EE97: incb                                             ;Increment Accumulator B
          stab    BitFlags_BF_t3                           ;Store Accumulator B
          andb    #0x07 ;(00000111)                        ;AND B with Memory
          decb                                             ;Decrement Accumulator B
          lslb                                             ;Logical Shift Left B
          ldx     #CrankPickupIntrAddressTable             ;Load Index Register X
          abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          jmp     0x00, X                                  ;Jump
Lbl_EEA6: ldaa    UNe_64B9                                 ;Load Accumulator A
          tab                                              ;Transfer A to B
          anda    #0xE0 ;(11100000)                        ;AND A with Memory
          andb    #0x1F ;(00011111)                        ;AND B with Memory
          cmpb    #0x1F ;(00011111)                        ;Compare B to Memory
          beq     Lbl_EEB3                                 ;Branch if = Zero
          incb                                             ;Increment Accumulator B
Lbl_EEB3: aba                                              ;Add Accumulators
          staa    UNe_64B9                                 ;Store Accumulator A
          jsr     Lbl_EC9B                                 ;Jump to Subroutine
          jmp     Lbl_F5FB                                 ;Jump
CrankInterrupt_FallingEdge:
          brset   *PIA3_Buffer_t3, #b6_CF_bt6, Lbl_EED2 ;(01000000)  ;Branch if Bit(s) Set
          jsr     DwellTimerOC4Interrupt                   ;Jump to Subroutine
          ldd     #0xFFFF                                  ;Load Double Accumulator D
          addd    TCNT_Counter_FreeRunning16bit            ;Add 16-Bit to D
          std     TOC4_Counter_OC4                         ;Store Accumulator D
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
Lbl_EED2: brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_EEEA ;(10000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags27, #b6_27_bt6, DetermineNumberOfOverflowsBetweenCamSensorPulses ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    CylinderPointer                          ;Load Accumulator A
          beq     DetermineNumberOfOverflowsBetweenCamSensorPulses ;Branch if = Zero
          cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
          beq     DetermineNumberOfOverflowsBetweenCamSensorPulses ;Branch if = Zero
          cmpa    #0x01 ;(00000001)                        ;Compare A to Memory
          beq     Lbl_EEF5                                 ;Branch if = Zero
          cmpa    #0x04 ;(00000100)                        ;Compare A to Memory
          beq     Lbl_EEF5                                 ;Branch if = Zero
Lbl_EEEA: ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0xFD ;(11111101)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          bra     DetermineNumberOfOverflowsBetweenCamSensorPulses ;Branch Always
Lbl_EEF5: ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x02 ;(00000010)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
DetermineNumberOfOverflowsBetweenCamSensorPulses:
          ldd     TIC1_Counter_IC1_CamSensor               ;Load Double Accumulator D
          ldx     #Counter_TimerPastHalfwayBetweenCamPulses ;Load Index Register X
          ldy     #LDXi_6490                               ;Load Index Register Y
          jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM ;Jump to Subroutine
          ldaa    Counter_TimerPastHalfwayBetweenCamPulses ;Load Accumulator A
          lsra                                             ;Logical Shift Right A
          staa    TimerOverflowsBetweenCamPulses           ;Store Accumulator A
          ldd     TIC1_Counter_IC1_CamSensor               ;Load Double Accumulator D
          subd    LastCamFallingEdgeTime                   ;Subtract Memory from D
          std     DistributorFallingEdgePulsewidth_HB      ;Store Accumulator D
          ldd     TIC1_Counter_IC1_CamSensor               ;Load Double Accumulator D
          std     LastCamFallingEdgeTime                   ;Store Accumulator D
          clr     Counter_TimerPastHalfwayBetweenCamPulses ;Clear Memory Byte
          ldaa    CalculatedDwellTime                      ;Load Accumulator A
          clrb                                             ;Clear Accumulator B
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          std     AntiDwellTime_HB                         ;Store Accumulator D
          ldd     DistributorFallingEdgePulsewidth_HB      ;Load Double Accumulator D
          subd    #0x00C8                                  ;Subtract Memory from D
          cmpd    AntiDwellTime_HB                         ;Compare D to Memory 16-Bit
          bcs     Lbl_EF37                                 ;Branch if Lower
          ldd     AntiDwellTime_HB                         ;Load Double Accumulator D
Lbl_EF37: std     AntiDwellTime_HB                         ;Store Accumulator D
          ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          bne     Lbl_EF7C                                 ;Branch if Not = Zero
          ldx     #SwitchPortAccessReg1                    ;Load Index Register X
          ldd     TL_TL_82B1 ;(0x4E20/77.82 Y units)       ;Load Double Accumulator D
          cmpd    DistributorFallingEdgePulsewidth_HB      ;Compare D to Memory 16-Bit
          bcs     Lbl_EF7C                                 ;Branch if Lower
          brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_EF8B ;(01000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags23, #b7_23_bt7, Lbl_EF59 ;(10000000)  ;Branch if Bit(s) Clear
          brset   0x00, X, #$%00100000, Lbl_EF59           ;Branch if Bit(s) Set
          ldaa    Ram_7F                                   ;Load Accumulator A
          beq     Lbl_EF61                                 ;Branch if = Zero
Lbl_EF59: ldd     TL_TL_82af ;(0x208D/32.42 Y units)       ;Load Double Accumulator D
          cmpd    DistributorFallingEdgePulsewidth_HB      ;Compare D to Memory 16-Bit
          bcs     Lbl_EF7C                                 ;Branch if Lower
Lbl_EF61: bset    *IPL1, #b6_20_FuelEngineNotRunning ;(01000000)  ;Set Bit(s)
          ldd     #0x0000                                  ;Load Double Accumulator D
          std     KeyOnOrEngineRunningTime                 ;Store Accumulator D
          staa    ATMOffset                                ;Store Accumulator A
          bset    *Ram_80, #$%11111111                     ;Set Bit(s)
          jsr     Lbl_C42F                                 ;Jump to Subroutine
          jsr     Lbl_C463                                 ;Jump to Subroutine
          jsr     Lbl_C609                                 ;Jump to Subroutine
          jsr     LC6BB                                    ;Jump to Subroutine
          bra     Lbl_EF8B                                 ;Branch Always
Lbl_EF7C: brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_EF83 ;(01000000)  ;Branch if Bit(s) Clear
          clr     CounterUp_UsedInCalcFuel                 ;Clear Memory Byte
Lbl_EF83: bclr    *IPL1, #b6_20_FuelEngineNotRunning ;(01000000)  ;Clear Bits(s)
          ldaa    TL_TL_8640 ;(0xFF/255.00 Y units)        ;Load Accumulator A
          staa    Counter_C                                ;Store Accumulator A
Lbl_EF8B: ldaa    TimerOverflowsBetweenCamPulses           ;Load Accumulator A
          bne     Lbl_EFCA                                 ;Branch if Not = Zero
          ldx     #SwitchPortAccessReg1                    ;Load Index Register X
          ldd     TL_TL_807C ;(0x4E20/77.82 Y units)       ;Load Double Accumulator D
          cmpd    DistributorFallingEdgePulsewidth_HB      ;Compare D to Memory 16-Bit
          bcs     Lbl_EFCA                                 ;Branch if Lower
          brset   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_EFED ;(00000001)  ;Branch if Bit(s) Set
          brclr   *BitFlags23, #b7_23_bt7, Lbl_EFAA ;(10000000)  ;Branch if Bit(s) Clear
          brset   0x00, X, #$%00100000, Lbl_EFAA           ;Branch if Bit(s) Set
          ldaa    Ram_7F                                   ;Load Accumulator A
          beq     Lbl_EFB2                                 ;Branch if = Zero
Lbl_EFAA: ldd     TL_TL_807a ;(0x37CD/55.58 Y units)       ;Load Double Accumulator D
          cmpd    DistributorFallingEdgePulsewidth_HB      ;Compare D to Memory 16-Bit
          bcs     Lbl_EFCA                                 ;Branch if Lower
Lbl_EFB2: ldaa    TMSK1_TimerInterruptMask1                ;Load Accumulator A
          oraa    #0x10 ;(00010000)                        ;OR Accumulator A (Inclusive)
          staa    TMSK1_TimerInterruptMask1                ;Store Accumulator A
          ldd     #0xFFFF                                  ;Load Double Accumulator D
          addd    TCNT_Counter_FreeRunning16bit            ;Add 16-Bit to D
          std     TOC4_Counter_OC4                         ;Store Accumulator D
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          bra     Lbl_EFED                                 ;Branch Always
Lbl_EFCA: bclr    *IPL1, #b0_20_SearchBladeEndRef_INSYNC ;(00000001)  ;Clear Bits(s)
          bset    *BitFlags2d, #b7_2D_bt7 ;(10000000)      ;Set Bit(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    Ram_4D                                   ;Store Accumulator A
          staa    CalculatedSparkAdvance                   ;Store Accumulator A
          ldaa    TMSK1_TimerInterruptMask1                ;Load Accumulator A
          anda    #0xEF ;(11101111)                        ;AND A with Memory
          staa    TMSK1_TimerInterruptMask1                ;Store Accumulator A
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x40 ;(01000000)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          bset    *IPL1, #b1_20_bt1 ;(00000010)            ;Set Bit(s)
          jmp     Lbl_F0CF                                 ;Jump
Lbl_EFED: brclr   *BitFlags2d, #b7_2D_bt7, Lbl_EFFC ;(10000000)  ;Branch if Bit(s) Clear
          ldaa    Ram_4D                                   ;Load Accumulator A
          adda    TL_TL_807f ;(0x14/20.00 Y units)         ;Add Memory to A
          bpl     Lbl_EFFA                                 ;Branch if Plus
          ldaa    #0x7F ;(01111111)                        ;Load Accumulator A
Lbl_EFFA: staa    Ram_4D                                   ;Store Accumulator A
Lbl_EFFC: brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_F037 ;(10000000)  ;Branch if Bit(s) Set
          brclr   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_F013 ;(00000001)  ;Branch if Bit(s) Clear
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x1F ;(00011111)                        ;Compare B to Memory
;   995 rpm
          bcs     Lbl_F013                                 ;Branch if Lower
          ldaa    CalculatedSparkAdvance                   ;Load Accumulator A
          cmpa    #0x50 ;(01010000)                        ;Compare A to Memory
          bcs     Lbl_F013                                 ;Branch if Lower
          jmp     Lbl_F0CF                                 ;Jump
Lbl_F013: ldaa    AdvanceTemporary                         ;Load Accumulator A
          brclr   *BitFlags2d, #b7_2D_bt7, Lbl_F024 ;(10000000)  ;Branch if Bit(s) Clear
          cmpa    Ram_4D                                   ;Compare A to Memory
          bls     Lbl_F021                                 ;Branch if Lower or Same
          ldaa    Ram_4D                                   ;Load Accumulator A
          bra     Lbl_F024                                 ;Branch Always
Lbl_F021: bclr    *BitFlags2d, #b7_2D_bt7 ;(10000000)      ;Clear Bits(s)
Lbl_F024: staa    CalculatedSparkAdvance                   ;Store Accumulator A
          bset    *IPL1, #b0_20_SearchBladeEndRef_INSYNC ;(00000001)  ;Set Bit(s)
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          suba    CalculatedSparkAdvance                   ;Subtract Memory from A
          psha                                             ;Push A onto Stack
          ldab    #0x11 ;(00010001)                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          pulb                                             ;Pull B from Stack
          aba                                              ;Add Accumulators
          bra     Lbl_F069                                 ;Branch Always
Lbl_F037: brclr   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_F04A ;(00000001)  ;Branch if Bit(s) Clear
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x1F ;(00011111)                        ;Compare B to Memory
;   995 rpm
          bcs     Lbl_F04A                                 ;Branch if Lower
          ldaa    CalculatedSparkAdvance                   ;Load Accumulator A
          cmpa    #0x50 ;(01010000)                        ;Compare A to Memory
          bcs     Lbl_F04A                                 ;Branch if Lower
          jmp     Lbl_F0CF                                 ;Jump
Lbl_F04A: ldaa    AdvanceTemporary                         ;Load Accumulator A
          brclr   *BitFlags2d, #b7_2D_bt7, Lbl_F05B ;(10000000)  ;Branch if Bit(s) Clear
          cmpa    Ram_4D                                   ;Compare A to Memory
          bls     Lbl_F058                                 ;Branch if Lower or Same
          ldaa    Ram_4D                                   ;Load Accumulator A
          bra     Lbl_F05B                                 ;Branch Always
Lbl_F058: bclr    *BitFlags2d, #b7_2D_bt7 ;(10000000)      ;Clear Bits(s)
Lbl_F05B: staa    CalculatedSparkAdvance                   ;Store Accumulator A
          bset    *IPL1, #b0_20_SearchBladeEndRef_INSYNC ;(00000001)  ;Set Bit(s)
          ldaa    #0x80 ;(10000000)                        ;Load Accumulator A
          suba    CalculatedSparkAdvance                   ;Subtract Memory from A
          ldab    #0xB6 ;(10110110)                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
Lbl_F069: psha                                             ;Push A onto Stack
          ldab    DistributorFallingEdgePulsewidth_HB      ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          std     Temp5_t3                                 ;Store Accumulator D
          pula                                             ;Pull A from Stack
          ldab    DistributorFallingEdgePulsewidth_LB      ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
          clra                                             ;Clear Accumulator A
          addd    Temp5_t3                                 ;Add 16-Bit to D
          addd    LastCamFallingEdgeTime                   ;Add 16-Bit to D
          subd    #0x000A                                  ;Subtract Memory from D
          std     Temp5_t3                                 ;Store Accumulator D
          bset    *IPL1, #b1_20_bt1 ;(00000010)            ;Set Bit(s)
          ldx     #TCTL1_TimerControlReg1                  ;Load Index Register X
          subd    AntiDwellTime_HB                         ;Subtract Memory from D
          std     DoubleTempB                              ;Store Accumulator D
          subd    TCNT_Counter_FreeRunning16bit            ;Subtract Memory from D
          bmi     Lbl_F0A1                                 ;Branch if Minus
          cmpd    #0x0020                                  ;Compare D to Memory 16-Bit
          bmi     Lbl_F0A1                                 ;Branch if Minus
          ldaa    PORTA_PortA                              ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F0B9                                 ;Branch if = Zero
Lbl_F0A1: bset    0x00, X, #$%00000011                     ;Set Bit(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     Temp5_t3                                 ;Load Double Accumulator D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          bclr    0x00, X, #$%00000001                     ;Clear Bits(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          bra     Lbl_F0CF                                 ;Branch Always
Lbl_F0B9: bclr    0x00, X, #$%00000001                     ;Clear Bits(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     DoubleTempB                              ;Load Double Accumulator D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          bset    0x00, X, #$%00000011                     ;Set Bit(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
Lbl_F0CF: ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F0D9                                 ;Branch if = Zero
          jsr     Interrupt_DwellTimer                     ;Jump to Subroutine
Lbl_F0D9: brset   *IPL1, #b2_20_bt2, Lbl_F0E2 ;(00000100)  ;Branch if Bit(s) Set
          jsr     Lbl_C6F2                                 ;Jump to Subroutine
          bra     Lbl_F128                                 ;Branch Always
Lbl_F0E2: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_F0E2                                 ;Branch if Plus
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x2F ;(00101111)                        ;Compare B to Memory
;   1509 rpm
          bcc     GREATER_THAN_1472RPM2                    ;Branch if Higher or Same
          cmpb    #0x0D ;(00001101)                        ;Compare B to Memory
;   417 rpm
          bcs     GREATER_THAN_1472RPM2                    ;Branch if Lower
          cmpa    TL_MapSensorUpperLimit ;(0xFD/4.96 volts)  ;Compare A to Memory
          bcc     Lbl_F102                                 ;Branch if Higher or Same
          cmpa    TL_MapSensorLowerLimit ;(0x02/.04 volts)  ;Compare A to Memory
          bcs     Lbl_F102                                 ;Branch if Lower
GREATER_THAN_1472RPM2:
          brclr   *b5C_IPL1_t3, #b7_D5_MapStuck| b3_D5_MapBadSignal, GET_AVERAGE_MAP_READING2 ;(10001000)  ;Branch if Bit(s) Clear
Lbl_F102: jsr     SimulateMapReadingFromTps                ;Jump to Subroutine
GET_AVERAGE_MAP_READING2:
          jsr     ConvertMAPVoltsToValue                   ;Jump to Subroutine
          tab                                              ;Transfer A to B
          stab    MapValue_t3                              ;Store Accumulator B
          bra     Lbl_F128                                 ;Branch Always
Wrd_F10E: .word InjectorPulsewidth_HB_Cyl1
          .word InjectorPulsewidth_HB_Cyl3
          .word InjectorPulsewidth_HB_Cyl4
          .word InjectorPulsewidth_HB_Cyl2
Wrd_F116: .word TOC3_Counter_OC3
          .word InjectorPulsewidth_HB_Cyl3
          .word InjectorPulsewidth_HB_Cyl1
          .word InjectorPulsewidth_HB_Cyl4
          .word TOC2_Counter_OC2
          .word InjectorPulsewidth_HB_Cyl2
ToggleOC3:.byte 0x10 ;1-1
ToggleOC3_ForceCompare:
          .byte 0x20 ;1-1
SetOC2ClrOC3SetOC4SetOC5:
          .byte 0xEF ;1-1
ToggleOC2:.byte 0x40 ;1-1
ToggleOC2_ForceCompare:
          .byte 0x40 ;1-1
ClrOC2SetOC3SetOC4SetOC5:
          .byte 0xBF ;1-1
Lbl_F128: ldd     InjectorPulsewidth_HB                    ;Load Double Accumulator D
          beq     Lbl_F1A0                                 ;Branch if = Zero
          brset   *BitFlags2f, #$%00000100, Lbl_F1A0       ;Branch if Bit(s) Set
          brclr   *BitFlags2c, #$%00000011, Lbl_F136       ;Branch if Bit(s) Clear
          bra     Lbl_F1A0                                 ;Branch Always
Lbl_F136: ldx     #Wrd_F10E                                ;Load Index Register X
          brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_F140 ;(10000000)  ;Branch if Bit(s) Set
          ldx     #Wrd_F116                                ;Load Index Register X
Lbl_F140: ldab    CylinderPointer                          ;Load Accumulator B
          lslb                                             ;Logical Shift Left B
          abx                                              ;Add B to X
          ldx     0x00, X                                  ;Load Index Register X
          ldy     #ToggleOC3                               ;Load Index Register Y
          cpx     #0x101A                                  ;Compare X to Memory 16-Bit
          beq     Lbl_F167                                 ;Branch if = Zero
          ldy     #ToggleOC2                               ;Load Index Register Y
          cpx     #0x1018                                  ;Compare X to Memory 16-Bit
          beq     Lbl_F167                                 ;Branch if = Zero
          ldd     InjectorPulsewidth_HB                    ;Load Double Accumulator D
          std     0x00, X                                  ;Store Accumulator D
          cmpd    #0x007F                                  ;Compare D to Memory 16-Bit
          bcs     Lbl_F165                                 ;Branch if Lower
          bset    *BitFlags21, #b7_21_DistSync ;(10000000)  ;Set Bit(s)
Lbl_F165: bra     Lbl_F18C                                 ;Branch Always
Lbl_F167: ldd     0x00, Y                                  ;Load Double Accumulator D
          oraa    TCTL1_TimerControlReg1                   ;OR Accumulator A (Inclusive)
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   if OC3 then
          stab    CFORC_TimerForceCompare                  ;Store Accumulator B
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    InjectorPulsewidth_HB                    ;Add 16-Bit to D
          std     0x00, X                                  ;Store Accumulator D
          cmpd    #0x007F                                  ;Compare D to Memory 16-Bit
          bcs     Lbl_F183                                 ;Branch if Lower
          bset    *BitFlags21, #b7_21_DistSync ;(10000000)  ;Set Bit(s)
Lbl_F183: ldaa    0x02, Y                                  ;Load Accumulator A
          anda    TCTL1_TimerControlReg1                   ;AND A with Memory
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   add OC info
Lbl_F18C: ldd     InjectorPulsewidth_HB                    ;Load Double Accumulator D
          lsrd                                             ;Logical Shift Right D
          lsrd                                             ;Logical Shift Right D
          addd    CCDFuelOutput_HB                         ;Add 16-Bit to D
          bcc     Lbl_F197                                 ;Branch if Higher or Same
          ldd     #0xFFFF                                  ;Load Double Accumulator D
Lbl_F197: std     CCDFuelOutput_HB                         ;Store Accumulator D
          ldaa    Counter_InjectorCalc                     ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_F1A0                                 ;Branch if = Zero
          staa    Counter_InjectorCalc                     ;Store Accumulator A
Lbl_F1A0: rti                                              ;Return from Interrupt
LF1A1:    jmp     Lbl_F290                                 ;Jump
CrankInterrupt_HandleCamSensorRisingEdgeA:
          ldd     TIC1_Counter_IC1_CamSensor               ;Load Double Accumulator D
          std     L00F5_t3                                 ;Store Accumulator D
          brclr   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_F1DE ;(00000001)  ;Branch if Bit(s) Clear
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x5E ;(01011110)                        ;Compare A to Memory
;   3019 rpm
          bcc     LF1A1                                    ;Branch if Higher or Same
          ldd     L00F5_t3                                 ;Load Double Accumulator D
          brclr   *IPL1, #b1_20_bt1, LF1A1 ;(00000010)     ;Branch if Bit(s) Clear
          subd    LastCamFallingEdgeTime                   ;Subtract Memory from D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          xgdy                                             ;Exchange D with Y
          ldaa    #0x58 ;(01011000)                        ;Load Accumulator A
          suba    CalculatedSparkAdvance                   ;Subtract Memory from A
          ble     LF1A1                                    ;Branch if <= Zero
          ldab    #0xCD ;(11001101)                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          asld                                             ;Arithmetic Shift Left D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          jsr     ScaleYbyA                                ;Jump to Subroutine
          xgdy                                             ;Exchange D with Y
          addd    TIC1_Counter_IC1_CamSensor               ;Add 16-Bit to D
          subd    #0x000A                                  ;Subtract Memory from D
          std     Temp5_t3                                 ;Store Accumulator D
          bra     Lbl_F1ED                                 ;Branch Always
Lbl_F1DE: ldd     #0x0308                                  ;Load Double Accumulator D
          oraa    TCTL1_TimerControlReg1                   ;OR Accumulator A (Inclusive)
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   ign oc2 oc3 oc4
          stab    TFLG1_TimerInterruptFlag1                ;Store Accumulator B
          jmp     Lbl_F282                                 ;Jump
Lbl_F1ED: ldaa    PORTA_PortA                              ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          bne     Lbl_F228                                 ;Branch if Not = Zero
          ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          bne     Lbl_F1FE                                 ;Branch if Not = Zero
          jmp     Lbl_F290                                 ;Jump
Lbl_F1FE: ldd     Temp5_t3                                 ;Load Double Accumulator D
          subd    AntiDwellTime_HB                         ;Subtract Memory from D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          ldab    TCTL1_TimerControlReg1                   ;Load Accumulator B
          orab    #0x03 ;(00000011)                        ;OR Accumulator B (Inclusive)
          stab    TCTL1_TimerControlReg1                   ;Store Accumulator B
;   set oc5 for sure
          ldd     TOC5_Counter_OC5_Dwell                   ;Load Double Accumulator D
          subd    #0x0040                                  ;Subtract Memory from D
          subd    TCNT_Counter_FreeRunning16bit            ;Subtract Memory from D
          bpl     Lbl_F290                                 ;Branch if Plus
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    AntiDwellTime_HB                         ;Add 16-Bit to D
          std     Temp5_t3                                 ;Store Accumulator D
Lbl_F228: ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_F24A                                 ;Branch if = Zero
          ldaa    CalculatedSparkAdvance                   ;Load Accumulator A
          cmpa    #0x28 ;(00101000)                        ;Compare A to Memory
          bcs     Lbl_F290                                 ;Branch if Lower
          ldd     TOC5_Counter_OC5_Dwell                   ;Load Double Accumulator D
          addd    AntiDwellTime_HB                         ;Add 16-Bit to D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          ldd     #0xFE08                                  ;Load Double Accumulator D
          anda    TCTL1_TimerControlReg1                   ;AND A with Memory
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   set oc2 oc3
          stab    TFLG1_TimerInterruptFlag1                ;Store Accumulator B
Lbl_F24A: ldaa    CalculatedSparkAdvance                   ;Load Accumulator A
          cmpa    #0x28 ;(00101000)                        ;Compare A to Memory
          bcc     Lbl_F265                                 ;Branch if Higher or Same
          ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          oraa    #0x03 ;(00000011)                        ;OR Accumulator A (Inclusive)
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   ign oc2 oc3 oc4 set oc5
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          bra     Lbl_F290                                 ;Branch Always
Lbl_F265: ldd     Temp5_t3                                 ;Load Double Accumulator D
          subd    TOC5_Counter_OC5_Dwell                   ;Subtract Memory from D
          cmpd    #0x0010                                  ;Compare D to Memory 16-Bit
          bcs     Lbl_F277                                 ;Branch if Lower
          ldd     Temp5_t3                                 ;Load Double Accumulator D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
Lbl_F277: ldd     TOC5_Counter_OC5_Dwell                   ;Load Double Accumulator D
          subd    TCNT_Counter_FreeRunning16bit            ;Subtract Memory from D
          bpl     Lbl_F290                                 ;Branch if Plus
          bclr    *IPL1, #b1_20_bt1 ;(00000010)            ;Clear Bits(s)
Lbl_F282: ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    #0x0004                                  ;Add 16-Bit to D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
Lbl_F290: ldaa    SparkScatter                             ;Load Accumulator A
          adda    SparkScatterIncrement                    ;Add Memory to A
          bvc     DoUseSparkScatter2                       ;Branch if Overflow Clear
          brclr   *BitFlags68_t3, #b2_25_AIS, DontUseSparkScatter2 ;(00000100)  ;Branch if Bit(s) Clear
          ldab    DesiredNewAisPosition                    ;Load Accumulator B
          cmpb    CurrentAisPosition                       ;Compare B to Memory
          bne     DontUseSparkScatter2                     ;Branch if Not = Zero
          ldab    TL_FineTuneStepForAis ;(0x01/1.00 out)   ;Load Accumulator B
          beq     DontUseSparkScatter2                     ;Branch if = Zero
          tsta                                             ;Test for Zero or Minus
          bmi     Lbl_F2B2                                 ;Branch if Minus
          ldaa    DesiredNewAisPosition                    ;Load Accumulator A
          sba                                              ;Subtract B from A
          bcc     SaveDesiredAisPosition                   ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
          bra     SaveDesiredAisPosition                   ;Branch Always
Lbl_F2B2: ldaa    TL_AisHighLimitMaxOpenSteps ;(0xD8/216.00 out)  ;Load Accumulator A
          addb    DesiredNewAisPosition                    ;Add Memory to B
          bcs     SaveDesiredAisPosition                   ;Branch if Lower
          cba                                              ;Compare A to B
          bls     SaveDesiredAisPosition                   ;Branch if Lower or Same
          tba                                              ;Transfer B to A
SaveDesiredAisPosition:
          staa    DesiredNewAisPosition                    ;Store Accumulator A
DontUseSparkScatter2:
          clra                                             ;Clear Accumulator A
DoUseSparkScatter2:
          staa    SparkScatterIncrement                    ;Store Accumulator A
          rti                                              ;Return from Interrupt
Lbl_F2C4: jmp     Lbl_F385                                 ;Jump
CrankInterrupt_HandleCamSensorRisingEdgeB:
          ldd     TIC1_Counter_IC1_CamSensor               ;Load Double Accumulator D
          std     Counter_IC1_Temp                         ;Store Accumulator D
          ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x5E ;(01011110)                        ;Compare A to Memory
;   3019 rpm
          bcc     Lbl_F2C4                                 ;Branch if Higher or Same
;   if engine rpm > 3008 rpm then branch
          brclr   *IPL1, #b1_20_bt1, Lbl_F2C4 ;(00000010)  ;Branch if Bit(s) Clear
          ldd     TIC1_Counter_IC1_CamSensor               ;Load Double Accumulator D
          subd    L00F5_t3                                 ;Subtract Memory from D
          asld                                             ;Arithmetic Shift Left D
          asld                                             ;Arithmetic Shift Left D
          xgdy                                             ;Exchange D with Y
          ldaa    #0x30 ;(00110000)                        ;Load Accumulator A
          suba    CalculatedSparkAdvance                   ;Subtract Memory from A
          bcc     Lbl_F2E8                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_F2E8: ldab    #0xCD ;(11001101)                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          asld                                             ;Arithmetic Shift Left D
          lslb                                             ;Logical Shift Left B
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          jsr     ScaleYbyA                                ;Jump to Subroutine
          xgdy                                             ;Exchange D with Y
          addd    TIC1_Counter_IC1_CamSensor               ;Add 16-Bit to D
          subd    #0x000A                                  ;Subtract Memory from D
          std     Temp5_t3                                 ;Store Accumulator D
          brclr   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_F2C4 ;(00000001)  ;Branch if Bit(s) Clear
          ldaa    PORTA_PortA                              ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          bne     Lbl_F33E                                 ;Branch if Not = Zero
          ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_F385                                 ;Branch if = Zero
          ldd     Temp5_t3                                 ;Load Double Accumulator D
          subd    AntiDwellTime_HB                         ;Subtract Memory from D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          ldab    TCTL1_TimerControlReg1                   ;Load Accumulator B
          orab    #0x03 ;(00000011)                        ;OR Accumulator B (Inclusive)
          stab    TCTL1_TimerControlReg1                   ;Store Accumulator B
;   set oc5 for sure
          ldab    #0x08 ;(00001000)                        ;Load Accumulator B
          stab    TFLG1_TimerInterruptFlag1                ;Store Accumulator B
          ldd     TOC5_Counter_OC5_Dwell                   ;Load Double Accumulator D
          subd    #0x0040                                  ;Subtract Memory from D
          subd    TCNT_Counter_FreeRunning16bit            ;Subtract Memory from D
          bpl     Lbl_F385                                 ;Branch if Plus
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    AntiDwellTime_HB                         ;Add 16-Bit to D
          std     Temp5_t3                                 ;Store Accumulator D
Lbl_F33E: ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          bita    #0x01 ;(00000001)                        ;Bit(s) Test A with Memory
          beq     Lbl_F35A                                 ;Branch if = Zero
          ldd     TOC5_Counter_OC5_Dwell                   ;Load Double Accumulator D
          addd    AntiDwellTime_HB                         ;Add 16-Bit to D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          ldd     #0xFE08                                  ;Load Double Accumulator D
          anda    TCTL1_TimerControlReg1                   ;AND A with Memory
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   set oc2 oc3 oc4 clr oc5
          stab    TFLG1_TimerInterruptFlag1                ;Store Accumulator B
Lbl_F35A: ldd     Temp5_t3                                 ;Load Double Accumulator D
          subd    TOC5_Counter_OC5_Dwell                   ;Subtract Memory from D
          cmpd    #0x0010                                  ;Compare D to Memory 16-Bit
          bcs     Lbl_F36C                                 ;Branch if Lower
          ldd     Temp5_t3                                 ;Load Double Accumulator D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
Lbl_F36C: ldd     TOC5_Counter_OC5_Dwell                   ;Load Double Accumulator D
          subd    TCNT_Counter_FreeRunning16bit            ;Subtract Memory from D
          bpl     Lbl_F385                                 ;Branch if Plus
          bclr    *IPL1, #b1_20_bt1 ;(00000010)            ;Clear Bits(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     TCNT_Counter_FreeRunning16bit            ;Load Double Accumulator D
          addd    #0x0004                                  ;Add 16-Bit to D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
Lbl_F385: ldaa    EngineRpm_HB                             ;Load Accumulator A
          cmpa    #0x6D ;(01101101)                        ;Compare A to Memory
;   if engine rpm > 3488 rpm then branch
          bcc     Lbl_F39C                                 ;Branch if Higher or Same
          cmpa    #0x6A ;(01101010)                        ;Compare A to Memory
;   if engine rpm > 3392 rpm then branch
          bcc     CALCULATE_RPM_SPEED_AND                  ;Branch if Higher or Same
          bclr    *IPL1, #b2_20_bt2 ;(00000100)            ;Clear Bits(s)
CALCULATE_RPM_SPEED_AND:
          jsr     CalculateEngineRpm                       ;Jump to Subroutine
          std     EngineRpm_HB                             ;Store Accumulator D
          jsr     RescaleRPMFor3D_MM                       ;Jump to Subroutine
          bra     Lbl_F39F                                 ;Branch Always
Lbl_F39C: bset    *IPL1, #b2_20_bt2 ;(00000100)            ;Set Bit(s)
Lbl_F39F: clra                                             ;Clear Accumulator A
          brclr   *BitFlags66_t3, #b6_22_bt6, Lbl_F3A9 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    CounterUp_42                             ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_F3AB                                 ;Branch if = Zero
Lbl_F3A9: staa    CounterUp_42                             ;Store Accumulator A
Lbl_F3AB: ldaa    CounterUp_42                             ;Load Accumulator A
          cmpa    TL_TL_81BB ;(0x03/3.00 Y units)          ;Compare A to Memory
          bcs     Lbl_F3B7                                 ;Branch if Lower
          bset    *IPL1, #b4_20_bt4 ;(00010000)            ;Set Bit(s)
          bra     Lbl_F3BA                                 ;Branch Always
Lbl_F3B7: bclr    *IPL1, #b4_20_bt4 ;(00010000)            ;Clear Bits(s)
Lbl_F3BA: ldaa    CounterDn_ba_o2                          ;Load Accumulator A
          beq     Lbl_F3C1                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    CounterDn_ba_o2                          ;Store Accumulator A
Lbl_F3C1: ldaa    CounterDn_bb_o2                          ;Load Accumulator A
          beq     Lbl_F3C8                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    CounterDn_bb_o2                          ;Store Accumulator A
Lbl_F3C8: brset   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_F3D3 ;(01000000)  ;Branch if Bit(s) Set
          ldaa    CounterUp_UsedInCalcFuel                 ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_F3D3                                 ;Branch if = Zero
          staa    CounterUp_UsedInCalcFuel                 ;Store Accumulator A
Lbl_F3D3: ldaa    CounterDn_bc_o2                          ;Load Accumulator A
          beq     Lbl_F3DA                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    CounterDn_bc_o2                          ;Store Accumulator A
Lbl_F3DA: ldaa    CounterDn_b9_o2                          ;Load Accumulator A
          beq     Lbl_F3E1                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    CounterDn_b9_o2                          ;Store Accumulator A
Lbl_F3E1: ldaa    CounterUp_b6_o2                          ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_F3E8                                 ;Branch if = Zero
          staa    CounterUp_b6_o2                          ;Store Accumulator A
Lbl_F3E8: clra                                             ;Clear Accumulator A
          brclr   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_F3F2 ;(00000001)  ;Branch if Bit(s) Clear
          ldaa    CounterUp_43                             ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_F3F4                                 ;Branch if = Zero
Lbl_F3F2: staa    CounterUp_43                             ;Store Accumulator A
Lbl_F3F4: ldaa    CounterDn_b7_o2                          ;Load Accumulator A
          beq     Lbl_F3FB                                 ;Branch if = Zero
          deca                                             ;Decrement Accumulator A
          staa    CounterDn_b7_o2                          ;Store Accumulator A
Lbl_F3FB: ldaa    Counter_SomethingWithDistributor         ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          beq     Lbl_F404                                 ;Branch if = Zero
          staa    Counter_SomethingWithDistributor         ;Store Accumulator A
Lbl_F404: jmp     Lbl_F407                                 ;Jump
Lbl_F407: rti                                              ;Return from Interrupt
CrankInterrupt_CalculateFuel:
          brset   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lf41e ;(00000001)  ;Branch if Bit(s) Set
          ldaa    TCTL1_TimerControlReg1                   ;Load Accumulator A
          anda    #0xFE ;(11111110)                        ;AND A with Memory
          staa    TCTL1_TimerControlReg1                   ;Store Accumulator A
;   set oc2 oc3 oc4 clr oc5
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          bclr    *IPL1, #b1_20_bt1 ;(00000010)            ;Clear Bits(s)
          bra     Lbl_F44A                                 ;Branch Always
Lf41e:    bra     Lbl_F420                                 ;Branch Always
Lbl_F420: clra                                             ;Clear Accumulator A
          clrb                                             ;Clear Accumulator B
          bra     Lbl_F43F                                 ;Branch Always
Lf424:    ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0xBF ;(10111111)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          ldd     TIC1_Counter_IC1_CamSensor               ;Load Double Accumulator D
          subd    Counter_IC1_Temp                         ;Subtract Memory from D
          std     DoubleTempC                              ;Store Accumulator D
          ldx     #DoubleTempC                             ;Load Index Register X
          ldd     TL_TL_828e                               ;Load Double Accumulator D
          jsr     ScaleXbyB_somethingelse                  ;Jump to Subroutine
Lbl_F43F: addd    TIC1_Counter_IC1_CamSensor               ;Add 16-Bit to D
          std     TOC4_Counter_OC4                         ;Store Accumulator D
          ldaa    #0x10 ;(00010000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
Lbl_F44A: ldaa    CylinderPointer                          ;Load Accumulator A
          inca                                             ;Increment Accumulator A
          brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_F455 ;(10000000)  ;Branch if Bit(s) Set
          cmpa    #0x06 ;(00000110)                        ;Compare A to Memory
          bra     Lbl_F457                                 ;Branch Always
Lbl_F455: cmpa    #0x04 ;(00000100)                        ;Compare A to Memory
Lbl_F457: bcs     Lbl_F45A                                 ;Branch if Lower
          clra                                             ;Clear Accumulator A
Lbl_F45A: staa    CylinderPointer                          ;Store Accumulator A
          brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_F47F ;(10000000)  ;Branch if Bit(s) Set
          brclr   *BitFlags27, #b6_27_bt6, Lbl_F488 ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    CylinderPointer                          ;Load Accumulator A
          beq     Lbl_F47F                                 ;Branch if = Zero
          cmpa    #0x03 ;(00000011)                        ;Compare A to Memory
          beq     Lbl_F47F                                 ;Branch if = Zero
          cmpa    #0x02 ;(00000010)                        ;Compare A to Memory
          beq     Lbl_F488                                 ;Branch if = Zero
          cmpa    #0x05 ;(00000101)                        ;Compare A to Memory
          beq     Lbl_F488                                 ;Branch if = Zero
          ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          anda    #0xFD ;(11111101)                        ;AND A with Memory
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
          bra     Lbl_F488                                 ;Branch Always
Lbl_F47F: ldaa    PIA3_Buffer_t3                           ;Load Accumulator A
          oraa    #0x02 ;(00000010)                        ;OR Accumulator A (Inclusive)
          staa    PIA3_Buffer_t3                           ;Store Accumulator A
          staa    PIA3_Buffer_2_t3                         ;Store Accumulator A
Lbl_F488: brset   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Lbl_F48F ;(00000001)  ;Branch if Bit(s) Set
          jmp     Lbl_F558                                 ;Jump
Lbl_F48F: brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_F4C4 ;(10000000)  ;Branch if Bit(s) Set
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x1F ;(00011111)                        ;Compare B to Memory
;   995 rpm
          bcc     Lbl_F49C                                 ;Branch if Higher or Same
          jmp     Lbl_F558                                 ;Jump
Lbl_F49C: ldaa    AdvanceTemporary                         ;Load Accumulator A
          brclr   *BitFlags2d, #b7_2D_bt7, Lbl_F4AD ;(10000000)  ;Branch if Bit(s) Clear
          cmpa    Ram_4D                                   ;Compare A to Memory
          bcs     Lbl_F4AA                                 ;Branch if Lower
          ldaa    Ram_4D                                   ;Load Accumulator A
          bra     Lbl_F4AD                                 ;Branch Always
Lbl_F4AA: bclr    *BitFlags2d, #b7_2D_bt7 ;(10000000)      ;Clear Bits(s)
Lbl_F4AD: staa    CalculatedSparkAdvance                   ;Store Accumulator A
          cmpa    #0x50 ;(01010000)                        ;Compare A to Memory
          bcc     Lbl_F4B6                                 ;Branch if Higher or Same
          jmp     Lbl_F558                                 ;Jump
Lbl_F4B6: ldaa    #0xF8 ;(11111000)                        ;Load Accumulator A
          suba    CalculatedSparkAdvance                   ;Subtract Memory from A
          psha                                             ;Push A onto Stack
          ldab    #0x11 ;(00010001)                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          pulb                                             ;Pull B from Stack
          aba                                              ;Add Accumulators
          bra     Lbl_F4F1                                 ;Branch Always
Lbl_F4C4: ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x1F ;(00011111)                        ;Compare B to Memory
;   995 rpm
          bcs     Lbl_F4E1                                 ;Branch if Lower
          ldaa    AdvanceTemporary                         ;Load Accumulator A
          brclr   *BitFlags2d, #b7_2D_bt7, Lbl_F4DB ;(10000000)  ;Branch if Bit(s) Clear
          cmpa    Ram_4D                                   ;Compare A to Memory
          bcs     Lbl_F4D8                                 ;Branch if Lower
          ldaa    Ram_4D                                   ;Load Accumulator A
          bra     Lbl_F4DB                                 ;Branch Always
Lbl_F4D8: bclr    *BitFlags2d, #b7_2D_bt7 ;(10000000)      ;Clear Bits(s)
Lbl_F4DB: staa    CalculatedSparkAdvance                   ;Store Accumulator A
          cmpa    #0x50 ;(01010000)                        ;Compare A to Memory
          bcc     Lbl_F4E4                                 ;Branch if Higher or Same
Lbl_F4E1: jmp     Lbl_F558                                 ;Jump
Lbl_F4E4: lsra                                             ;Logical Shift Right A
          tab                                              ;Transfer A to B
          ldaa    #0xB8 ;(10111000)                        ;Load Accumulator A
          sba                                              ;Subtract B from A
          psha                                             ;Push A onto Stack
          ldab    #0x6C ;(01101100)                        ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          pulb                                             ;Pull B from Stack
          aba                                              ;Add Accumulators
Lbl_F4F1: psha                                             ;Push A onto Stack
          ldab    DistributorFallingEdgePulsewidth_HB      ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          std     Temp5_t3                                 ;Store Accumulator D
          pula                                             ;Pull A from Stack
          ldab    DistributorFallingEdgePulsewidth_LB      ;Load Accumulator B
          mul                                              ;Multiply A x B = D
          adca    #0x00 ;(00000000)                        ;Add with Carry to A
          tab                                              ;Transfer A to B
          clra                                             ;Clear Accumulator A
          addd    Temp5_t3                                 ;Add 16-Bit to D
          addd    TIC1_Counter_IC1_CamSensor               ;Add 16-Bit to D
          subd    #0x000A                                  ;Subtract Memory from D
          std     Temp5_t3                                 ;Store Accumulator D
          bset    *IPL1, #b1_20_bt1 ;(00000010)            ;Set Bit(s)
          ldx     #TCTL1_TimerControlReg1                  ;Load Index Register X
          subd    AntiDwellTime_HB                         ;Subtract Memory from D
          std     DoubleTempB                              ;Store Accumulator D
          subd    TCNT_Counter_FreeRunning16bit            ;Subtract Memory from D
          bmi     Lbl_F52A                                 ;Branch if Minus
          cmpd    #0x0020                                  ;Compare D to Memory 16-Bit
          bmi     Lbl_F52A                                 ;Branch if Minus
          ldaa    PORTA_PortA                              ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F542                                 ;Branch if = Zero
Lbl_F52A: bset    0x00, X, #$%00000011                     ;Set Bit(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     Temp5_t3                                 ;Load Double Accumulator D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          bclr    0x00, X, #$%00000001                     ;Clear Bits(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          bra     Lbl_F558                                 ;Branch Always
Lbl_F542: bclr    0x00, X, #$%00000001                     ;Clear Bits(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    CFORC_TimerForceCompare                  ;Store Accumulator A
          ldd     DoubleTempB                              ;Load Double Accumulator D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
          bset    0x00, X, #$%00000011                     ;Set Bit(s)
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
Lbl_F558: ldaa    ADCTL_A2DControlReg                      ;Load Accumulator A
          bpl     Lbl_F558                                 ;Branch if Plus
          ldd     ADR3_A2DResults3                         ;Load Double Accumulator D
          staa    O2SensorVolts                            ;Store Accumulator A
          stab    LastTpsVolts                             ;Store Accumulator B
          cmpb    TL_ThrottleLowerLimit ;(0x08/.16 volts)  ;Compare B to Memory
          bcs     CheckThrottle_BadTpsSignal2              ;Branch if Lower
          cmpb    TL_ThrottleUpperLimit ;(0xF0/4.71 volts)  ;Compare B to Memory
          bcc     CheckThrottle_BadTpsSignal2              ;Branch if Higher or Same
          brset   *b5C_IPL1_t3, #b6_D5_TpsBadSignal, CheckThrottle_BadTpsSignal2 ;(01000000)  ;Branch if Bit(s) Set
          stab    TpsVolts                                 ;Store Accumulator B
CheckThrottle_BadTpsSignal2:
          ldaa    ADR1_A2DResults1                         ;Load Accumulator A
          ldab    EngineRpm_HB                             ;Load Accumulator B
          cmpb    #0x2F ;(00101111)                        ;Compare B to Memory
;   1509 rpm
          bcc     GREATER_THAN_1500RPM3                    ;Branch if Higher or Same
          cmpb    #0x0D ;(00001101)                        ;Compare B to Memory
;   417 rpm
          bcs     GREATER_THAN_1500RPM3                    ;Branch if Lower
          cmpa    TL_MapSensorUpperLimit ;(0xFD/4.96 volts)  ;Compare A to Memory
          bcc     Lbl_F58F                                 ;Branch if Higher or Same
          cmpa    TL_MapSensorLowerLimit ;(0x02/.04 volts)  ;Compare A to Memory
          bcs     Lbl_F58F                                 ;Branch if Lower
GREATER_THAN_1500RPM3:
          brclr   *b5C_IPL1_t3, #b7_D5_MapStuck| b3_D5_MapBadSignal, GET_AVERAGE_MAP_READING3 ;(10001000)  ;Branch if Bit(s) Clear
Lbl_F58F: jsr     SimulateMapReadingFromTps                ;Jump to Subroutine
GET_AVERAGE_MAP_READING3:
          jsr     ConvertMAPVoltsToValue                   ;Jump to Subroutine
          tab                                              ;Transfer A to B
          brclr   *IPL1, #b2_20_bt2, Lbl_F5A2 ;(00000100)  ;Branch if Bit(s) Clear
          addb    MapValue_t3                              ;Add Memory to B
          rorb                                             ;Rotate Right
          stab    MapValue                                 ;Store Accumulator B
          bra     Lbl_F5A7                                 ;Branch Always
Lbl_F5A2: stab    MapValue_t3                              ;Store Accumulator B
          ldab    MapValue                                 ;Load Accumulator B
Lbl_F5A7: ldaa    BaroPressure                             ;Load Accumulator A
;   BP - MV = vacuum  e.g. 14.7 - 5.4 (map reading) = 9.3 (calculated vacuum)
          sba                                              ;Subtract B from A
          bcc     Lbl_F5AD                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
Lbl_F5AD: staa    MapVolts                                 ;Store Accumulator A
          jsr     LD92D_Subroutine                         ;Jump to Subroutine
          brclr   *IPL1, #b6_20_FuelEngineNotRunning, Lbl_F5FB ;(01000000)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F5C0                                 ;Branch if = Zero
          jsr     Interrupt_DwellTimer                     ;Jump to Subroutine
Lbl_F5C0: ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F5CA                                 ;Branch if = Zero
          jsr     DwellTimerOC4Interrupt                   ;Jump to Subroutine
Lbl_F5CA: jsr     Lbl_C42F                                 ;Jump to Subroutine
          jsr     Lbl_C463                                 ;Jump to Subroutine
          jsr     Lbl_C609                                 ;Jump to Subroutine
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x08 ;(00001000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F5DD                                 ;Branch if = Zero
          jsr     Interrupt_DwellTimer                     ;Jump to Subroutine
Lbl_F5DD: ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F5E7                                 ;Branch if = Zero
          jsr     DwellTimerOC4Interrupt                   ;Jump to Subroutine
Lbl_F5E7: jsr     LC6BB                                    ;Jump to Subroutine
          brclr   *IPL1, #b2_20_bt2, Lbl_F5FB ;(00000100)  ;Branch if Bit(s) Clear
          ldaa    TFLG1_TimerInterruptFlag1                ;Load Accumulator A
          bita    #0x10 ;(00010000)                        ;Bit(s) Test A with Memory
          beq     Lbl_F5F8                                 ;Branch if = Zero
          jsr     DwellTimerOC4Interrupt                   ;Jump to Subroutine
Lbl_F5F8: jsr     Lbl_C734                                 ;Jump to Subroutine
Lbl_F5FB: clr     ATMOffset                                ;Clear Memory Byte
          ldaa    DRBPointer1                              ;Load Accumulator A
          cmpa    #0x0A ;(00001010)                        ;Compare A to Memory
          bne     Lbl_F60A                                 ;Branch if Not = Zero
          clr     DRBPointer1                              ;Clear Memory Byte
          bclr    *DRBSerialMode, #b5_DB_TestType3| b4_DB_TestType2 ;(00110000)  ;Clear Bits(s)
Lbl_F60A: rti                                              ;Return from Interrupt
V_Realtime_Interrupt_vector:
          ldd     #0x9E61                                  ;Load Double Accumulator D
;   compare 10011110 to mask and set interrupt bits to hardware
;   01100001 set interrupt flags for oc2 oc3 ic3
          anda    TMSK1_TimerInterruptMask1                ;AND A with Memory
          staa    TMSK1_TimerInterruptMask1                ;Store Accumulator A
          stab    TFLG1_TimerInterruptFlag1                ;Store Accumulator B
          ldd     #0x0FF0                                  ;Load Double Accumulator D
;   compare 00001111 to mask - set timer prescaler - disable
;   timer overflow interrupts
;   11110000 clears tof realtime pulse interrupt status flags to 0
          anda    TMSK2_TimerInterruptMask2                ;AND A with Memory
          staa    TMSK2_TimerInterruptMask2                ;Store Accumulator A
          stab    TFLG2_TimerInterruptFlag2                ;Store Accumulator B
          rti                                              ;Return from Interrupt
NullRoutine:
          rts                                              ;Return from Subroutine
V_OC4_Interrupt_Dwell:
          bsr     DwellTimerOC4Interrupt                   ;Branch to Subroutine
          rti                                              ;Return from Interrupt
DwellTimerOC4Interrupt:
          ldd     #0x1014                                  ;Load Double Accumulator D
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
;   00010000 set oc4 interrupt flag
          rts                                              ;Return from Subroutine
V_OC5_IgnitionCoilDrive:
          bsr     Interrupt_DwellTimer                     ;Branch to Subroutine
          rti                                              ;Return from Interrupt
Interrupt_DwellTimer:
          ldaa    #0x08 ;(00001000)                        ;Load Accumulator A
          staa    TFLG1_TimerInterruptFlag1                ;Store Accumulator A
          brclr   *BitFlags_BF_t3, #$%10000000, Dwell_rts  ;Branch if Bit(s) Clear
          ldab    TimerOverflowsBetweenCamPulses           ;Load Accumulator B
          bne     Dwell_rts                                ;Branch if Not = Zero
          brclr   *IPL1, #b0_20_SearchBladeEndRef_INSYNC, Dwell_rts ;(00000001)  ;Branch if Bit(s) Clear
NormalDwell:
          ldab    TCTL1_TimerControlReg1                   ;Load Accumulator B
          eorb    #0x01 ;(00000001)                        ;Exclusive OR B with Memory
          bitb    #0x01 ;(00000001)                        ;Bit(s) Test B with Memory
          bne     Lbl_F650                                 ;Branch if Not = Zero
          brclr   *IPL1, #b1_20_bt1, Dwell_rts ;(00000010)  ;Branch if Bit(s) Clear
Lbl_F650: stab    TCTL1_TimerControlReg1                   ;Store Accumulator B
;   toggle oc5
          lsrb                                             ;Logical Shift Right B
          bcs     IgnitionCoil_OffTimeLoad                 ;Branch if Lower
          ldab    #0x01 ;(00000001)                        ;Load Accumulator B
          ldaa    CalculatedSparkAdvance                   ;Load Accumulator A
          cmpa    #0x58 ;(01011000)                        ;Compare A to Memory
          bcc     IgnitionCoil_OnTimeLoad                  ;Branch if Higher or Same
          incb                                             ;Increment Accumulator B
          cmpa    #0x30 ;(00110000)                        ;Compare A to Memory
          bcc     IgnitionCoil_OnTimeLoad                  ;Branch if Higher or Same
          incb                                             ;Increment Accumulator B
IgnitionCoil_OnTimeLoad:
          ldaa    BitFlags_BF_t3                           ;Load Accumulator A
          anda    #0x07 ;(00000111)                        ;AND A with Memory
          cba                                              ;Compare A to B
          bcs     Lbl_F67F                                 ;Branch if Lower
          ldd     AntiDwellTime_HB                         ;Load Double Accumulator D
Lbl_F66E: addd    TOC5_Counter_OC5_Dwell                   ;Add 16-Bit to D
          std     TOC5_Counter_OC5_Dwell                   ;Store Accumulator D
Dwell_rts:rts                                              ;Return from Subroutine
IgnitionCoil_OffTimeLoad:
          bclr    *IPL1, #b1_20_bt1 ;(00000010)            ;Clear Bits(s)
          ldd     DistributorFallingEdgePulsewidth_HB      ;Load Double Accumulator D
          subd    AntiDwellTime_HB                         ;Subtract Memory from D
          bra     Lbl_F66E                                 ;Branch Always
Lbl_F67F: ldab    TCTL1_TimerControlReg1                   ;Load Accumulator B
          orab    #0x03 ;(00000011)                        ;OR Accumulator B (Inclusive)
          stab    TCTL1_TimerControlReg1                   ;Store Accumulator B
;   ign oc2 oc3 oc4 set oc5
          rts                                              ;Return from Subroutine
V_IRQ_hardware_Interrupt_vector:
          ldx     #TFLG1_TimerInterruptFlag1               ;Load Index Register X
          brset   0x00, X, #$%00000100, Lbl_F6E8           ;Branch if Bit(s) Set
;   branch if ic1 distrib int flag is set
          ldx     TCNT_Counter_FreeRunning16bit            ;Load Index Register X
          ldab    #0x0C ;(00001100)                        ;Load Accumulator B
;   add 12 to the free running counter value
          abx                                              ;Add B to X
Lbl_F695: ldaa    SwitchPortAccessReg2                     ;Load Accumulator A
          eora    PIA_Ctrl_2                               ;Exclusive OR A with Memory
          lsra                                             ;Logical Shift Right A
          bcs     Lbl_F6F3                                 ;Branch if Lower
          cpx     TCNT_Counter_FreeRunning16bit            ;Compare X to Memory 16-Bit
          bpl     Lbl_F695                                 ;Branch if Plus
          ldaa    #0x02 ;(00000010)                        ;Load Accumulator A
          ldab    SwitchPortAccessReg2                     ;Load Accumulator B
          lsrb                                             ;Logical Shift Right B
          bcc     Lbl_F6B2                                 ;Branch if Higher or Same
          clra                                             ;Clear Accumulator A
          brset   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_F6B2 ;(10000000)  ;Branch if Bit(s) Set
          ldaa    #0x05 ;(00000101)                        ;Load Accumulator A
Lbl_F6B2: brclr   *BitFlags_BF_t3, #$%10000000, Lbl_F6C2   ;Branch if Bit(s) Clear
          ldab    #0x0C ;(00001100)                        ;Load Accumulator B
          brclr   *BitFlags27, #b7_27_FuelEngNotRunning, Lbl_F6BE ;(10000000)  ;Branch if Bit(s) Clear
          ldab    #0x08 ;(00001000)                        ;Load Accumulator B
Lbl_F6BE: cmpb    Ram_F4                                   ;Compare B to Memory
          bne     Lbl_F6D7                                 ;Branch if Not = Zero
Lbl_F6C2: ldab    #0x84 ;(10000100)                        ;Load Accumulator B
          staa    CylinderPointer                          ;Store Accumulator A
          brset   *BitFlags_BF_t3, #$%10000000, Lbl_F6D0   ;Branch if Bit(s) Set
          clr     KeyOnOrEngineRunningTime                 ;Clear Memory Byte
          clr     Counter_MainLoop                         ;Clear Memory Byte
Lbl_F6D0: stab    BitFlags_BF_t3                           ;Store Accumulator B
          bset    *BitFlags2b, #$%10000000                 ;Set Bit(s)
          bra     Lbl_F6DA                                 ;Branch Always
Lbl_F6D7: bclr    *BitFlags2b, #$%10000000                 ;Clear Bits(s)
Lbl_F6DA: brclr   *Ram_05, #$%00000001, Lbl_F6E8           ;Branch if Bit(s) Clear
          ldab    UNe_64B9                                 ;Load Accumulator B
          addb    #0x20 ;(00100000)                        ;Add Memory to B
          bcs     Lbl_F6E8                                 ;Branch if Lower
          stab    UNe_64B9                                 ;Store Accumulator B
Lbl_F6E8: ldaa    PIA_Ctrl_2                               ;Load Accumulator A
          eora    #0x01 ;(00000001)                        ;Exclusive OR A with Memory
          staa    PIA_Ctrl_2                               ;Store Accumulator A
          clr     Ram_F4                                   ;Clear Memory Byte
Lbl_F6F3: ldaa    #0x01 ;(00000001)                        ;Load Accumulator A
          staa    PIA_Ctrl_4                               ;Store Accumulator A
          rti                                              ;Return from Interrupt
Mis_F6F9: .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1-16
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;17-32
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;33-48
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;49-64
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;65-80
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;81-96
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;97-112
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;113-128
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;129-144
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;145-160
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;161-176
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;177-192
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;193-208
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;209-224
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;225-240
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;241-256
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;257-272
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;273-288
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;289-304
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;305-320
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;321-336
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;337-352
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;353-368
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;369-384
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;385-400
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;401-416
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;417-432
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;433-448
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;449-464
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;465-480
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;481-496
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;497-512
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;513-528
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;529-544
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;545-560
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;561-576
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;577-592
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;593-608
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;609-624
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;625-640
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;641-656
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;657-672
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;673-688
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;689-704
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;705-720
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;721-736
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;737-752
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;753-768
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;769-784
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;785-800
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;801-816
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;817-832
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;833-848
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;849-864
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;865-880
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;881-896
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;897-912
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;913-928
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;929-944
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;945-960
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;961-976
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;977-992
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;993-1008
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1009-1024
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1025-1040
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1041-1056
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1057-1072
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1073-1088
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1089-1104
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1105-1120
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1121-1136
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1137-1152
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1153-1168
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1169-1184
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1185-1200
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1201-1216
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1217-1232
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1233-1248
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1249-1264
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1265-1280
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1281-1296
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1297-1312
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1313-1328
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1329-1344
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1345-1360
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1361-1376
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1377-1392
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1393-1408
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1409-1424
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1425-1440
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1441-1456
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1457-1472
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1473-1488
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1489-1504
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1505-1520
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1521-1536
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1537-1552
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1553-1568
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1569-1584
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1585-1600
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1601-1616
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1617-1632
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1633-1648
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1649-1664
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1665-1680
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1681-1696
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1697-1712
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1713-1728
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1729-1744
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1745-1760
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1761-1776
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1777-1792
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1793-1808
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1809-1824
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1825-1840
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1841-1856
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1857-1872
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1873-1888
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1889-1904
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1905-1920
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1921-1936
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1937-1952
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1953-1968
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1969-1984
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;1985-2000
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2001-2016
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2017-2032
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2033-2048
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2049-2064
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2065-2080
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2081-2096
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2097-2112
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2113-2128
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2129-2144
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2145-2160
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2161-2176
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2177-2192
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2193-2208
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ;2209-2220
Str_024_FFA5:
          .str /1994 COPYRIGHT CHRYSLER /
Mis_FFBD: .byte 0x2E, 0x80, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;1-16
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;17-25
SCI_Interrupt_vector:
          .word V_SCI_Interrupt_vector
SPIE_Flag_Interrupt_vector:
          .word V_SPIE_Flag_Interrupt_vector
PAII_Flag_Interrupt_vector:
          .word V_Realtime_Interrupt_vector
PAOVI_Flag_Interrupt_vector:
          .word V_Realtime_Interrupt_vector
TOI_Flag_Interrupt_vector:
          .word V_Realtime_Interrupt_vector
OC5_IgnitionCoilDrive:
          .word V_OC5_IgnitionCoilDrive
OC4_Interrupt_Dwell:
          .word V_OC4_Interrupt_Dwell
OC3_Interrupt_vector:
          .word V_Realtime_Interrupt_vector
OC2_Interrupt_vector:
          .word V_Realtime_Interrupt_vector
OC1_Interrupt_vector:
          .word V_OC1_Interrupt_vector
IC3_Interrupt_vector:
          .word V_Realtime_Interrupt_vector
IC2_Interrupt_SpeedometerSignal:
          .word V_IC2_Interrupt_SpeedometerSignal
IC1_Interrupt_vector:
          .word V_IC1_Interrupt_vector
Realtime_Interrupt_vector:
          .word V_Realtime_Interrupt_vector
IRQ_hardware_Interrupt_vector:
          .word V_IRQ_hardware_Interrupt_vector
XIRQ_hardware_Interrupt_vector:
          .word V_XIRQ_hardware_Interrupt_vector
SWI_Software_Interrupt_vector:
          .word V_SWI_Software_Interrupt_vector
Illegal_Opcode_vector:
          .word V_Illegal_Opcode_vector
COP_Watchdog_Timeout_vector:
          .word V_COP_Watchdog_Timeout_vector
Clock_Monitor_Fail_vector:
          .word Interrupt_ClockMonFail
ResetVector:
          .word V_ResetVector
.msg "Complete."
