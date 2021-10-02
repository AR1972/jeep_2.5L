;mpver 2.00
;mpassmfile 
 
;************************************************************
;*                                                          *
;* Template created by:                                     *
;* MPDisassemble - Copyright 2009-2017 by Morris Terveen    *
;*                                                          *
;* Use at your own risk.  Author accepts no liability for   *
;* any damage that may result from the use of this program. *
;*                                                          *
;************************************************************
 
.org DataOrg
 
;mpinjsize 19.0
;mpbar 1.0
 
.msg "Assembling Data Structures..." ; these are just messages to display during assemble to let you know what's going on...
RomBegin:
 
.org 0x8000
TL_IDENT1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8000
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname IDENT1
    ;mptblcname TL_IDENT1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Program__requires_this_byte_to_be_0x11
          .byte 0x11                       ;Point 1
.org 0x8001
TL_IDENT2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8001
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname IDENT2
    ;mptblcname TL_IDENT2
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Program_requires_this_byte_to_be_0x00
          .byte 0x00                       ;Point 1
.org 0x8002
TL_PARTNO1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8002
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO1
    ;mptblcname TL_PARTNO1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc ecu_byte_1.__ecu_id_is_56_02_77_81_a1_and_is_repeated_at_0x8007
          .byte 0x56                       ;Point 1
.org 0x8003
TL_PARTNO2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8003
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO2
    ;mptblcname TL_PARTNO2
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc ecu_byte_2
          .byte 0x02                       ;Point 1
.org 0x8004
TL_PARTNO3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8004
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO3
    ;mptblcname TL_PARTNO3
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc first_byte_of_cal_id_in_low_bits=7
          .byte 0x77                       ;Point 1
.org 0x8005
TL_PARTNO4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8005
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO4
    ;mptblcname TL_PARTNO4
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc second_byte_of_cal_id=81
          .byte 0x81                       ;Point 1
.org 0x8006
TL_PARTNO5:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8006
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO5
    ;mptblcname TL_PARTNO5
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_PARTREV_
          .byte 0xA1                       ;Point 1
.org 0x8007
TL_PARTNO1A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8007
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO1A
    ;mptblcname TL_PARTNO1A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc ecu_byte_1.__ecu_id_is_56_02_77_81_a1_and_is_repeated_at_0x8002
          .byte 0x56                       ;Point 1
.org 0x8008
TL_PARTNO2A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8008
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO2A
    ;mptblcname TL_PARTNO2A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_RFINO2_
          .byte 0x02                       ;Point 1
.org 0x8009
TL_PARTNO3A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8009
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO3A
    ;mptblcname TL_PARTNO3A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_RFINO1_
          .byte 0x77                       ;Point 1
.org 0x800A
TL_PARTNO4A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x800A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO4A
    ;mptblcname TL_PARTNO4A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_RFINO0_
          .byte 0x81                       ;Point 1
.org 0x800B
TL_PARTNO5A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x800B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PARTNO5A
    ;mptblcname TL_PARTNO5A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_RFIREV_
          .byte 0xA1                       ;Point 1
.org 0x800C
TL_BITSUM:
    ;mpgrp Unassigned\
    ;mptbladdr 0x800C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BITSUM
    ;mptblcname TL_BITSUM
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_BITSUM_
          .byte 0xE8                       ;Point 1
.org 0x800D
TL_CODE1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x800D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CODE1
    ;mptblcname TL_CODE1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_CODE13_
          .byte 0x8E                       ;Point 1
.org 0x800E
TL_CODE2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x800E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CODE2
    ;mptblcname TL_CODE2
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_CODE12_
          .byte 0x1C                       ;Point 1
.org 0x800F
TL_CODE3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x800F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CODE3
    ;mptblcname TL_CODE3
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_CODE11_
          .byte 0x84                       ;Point 1
.org 0x8010
TL_CODE4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8010
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CODE4
    ;mptblcname TL_CODE4
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_CODE10_
          .byte 0x88                       ;Point 1
.org 0x8011
TL_BatteryVoltsTablePtr:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8011
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BatteryVoltsTablePtr
    ;mptblcname BTVLTP
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Determines_which_battery_volt_table_to_use_for_target_battery_volts._Default_is_table_1.
          .byte 0x01                       ;Point 1
.org 0x8012
TL_CCDConfigConstant:
    ;mpgrp Setup\Cal_Configuration\
    ;mptbladdr 0x8012
    ;mptbltype 5
    ;mpsubtype n
    ;mptbllname CCDConfigConstant
    ;mptblcname CCDCFG
    ;mpxaxis X 0 255 in
    ;mpyaxis Y 0 255 out
    ;mptbldesc CCD_Bus_configuration_constant._Not_sure_of_usage.
    ;mpchoices Bit0  Bit1  Bit2  Bit3  Bit4  Bit5  Bit6  Bit7
          .byte 0x05                       ;Point 1
.org 0x8013
TL_BDYSTL:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8013
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BDYSTL
    ;mptblcname TL_BDYSTL
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_BDYSTL_
          .byte 0x02                       ;Point 1
.org 0x8014
TL_CCDConfigConstant2:
    ;mpgrp Setup\Cal_Configuration\
    ;mptbladdr 0x8014
    ;mptbltype 5
    ;mpsubtype n
    ;mptbllname CCDConfigConstant2
    ;mptblcname CCDCF2
    ;mpxaxis IN 0 255 X
    ;mpyaxis OUT 0 255 Y
    ;mptbldesc These_are_the_factory_configuration_options.
    ;mpchoices Bit0  Bit1  CCD  AC  Bit3  Bit4  ATX  EGR
          .byte 0xFF                       ;Point 1
.org 0x8015
TL_CONF01:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8015
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CONF01
    ;mptblcname CONF01
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_CONF01_
          .byte 0x41                       ;Point 1
.org 0x8016
TL_ConfigurationFlags2:
    ;mpgrp Setup\Cal_Configuration\
    ;mptbladdr 0x8016
    ;mptbltype 5
    ;mpsubtype n
    ;mptbllname ConfigurationFlags2
    ;mptblcname CONFIG2
    ;mpxaxis X 0 255 in
    ;mpyaxis Y 0 255 out
    ;mptbldesc Not_sure_of_usage.
    ;mpchoices Bit0  Bit1  Bit2  Bit3  Bit4  Bit5  Bit6  ATX
          .byte 0x22                       ;Point 1
.org 0x8017
TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8017
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname Amount_MINTHR_IsIncreasedAtKeyOnOnly
    ;mptblcname MININC
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis out 0 5 volts
    ;mptbldesc Desc_TL_CONF03_
          .byte 0x03                       ;Point 1
.org 0x8018
TL_ProgramLoopsWithThrottleBelow_MINTHR_ToDecrement_MINTHR:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8018
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ProgramLoopsWithThrottleBelow_MINTHR_ToDecrement_MINTHR
    ;mptblcname MAXCNT
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8018
          .byte 0x10                       ;Point 1
.org 0x8019
TL_NumberOfBitsAbove_MINTHR_ToDetermineOnThrottleTransition:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8019
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname NumberOfBitsAbove_MINTHR_ToDetermineOnThrottleTransition
    ;mptblcname MTHRCL
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8019
          .byte 0x02                       ;Point 1
.org 0x801A
TL_NumberOfBitsAbove_MINTHR_ToDetermineOffThrottleTransition:
    ;mpgrp Unassigned\
    ;mptbladdr 0x801A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname NumberOfBitsAbove_MINTHR_ToDetermineOffThrottleTransition
    ;mptblcname MTHROP
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_801A
          .byte 0x01                       ;Point 1
.org 0x801B
TL_ValueOf_MINTHR_WhenBatteryDisconnected:
    ;mpgrp Unassigned\
    ;mptbladdr 0x801B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ValueOf_MINTHR_WhenBatteryDisconnected
    ;mptblcname MTHRMX
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_801B
          .byte 0x39                       ;Point 1
.org 0x801C
TL_ThrottleSelfCalibrationRpmThreshold:
    ;mpgrp Unassigned\
    ;mptbladdr 0x801C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ThrottleSelfCalibrationRpmThreshold
    ;mptblcname RPMTHR
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_801C
          .byte 0x26                       ;Point 1
.org 0x801D
TL_ThrottleSelfCalibrationMapDeltaThreshold:
    ;mpgrp Unassigned\
    ;mptbladdr 0x801D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ThrottleSelfCalibrationMapDeltaThreshold
    ;mptblcname MAPTHR
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Desc_TL_801D
          .byte 0x4C                       ;Point 1
.org 0x801E
TL_SwitchPointForDecelIdleAisControl:
    ;mpgrp Unassigned\
    ;mptbladdr 0x801E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname SwitchPointForDecelIdleAisControl
    ;mptblcname MPHREF
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Speed 0 127.5 mph
    ;mptbldesc Switch_point_between_Decel_or_Idle_AIS_control._Note_there_is_also_a_1.5_mph_hysteresis
          .byte 0x05                       ;Point 1
.org 0x801F
TL_DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle:
    ;mpgrp Setup\Throttle_Calibration\
    ;mptbladdr 0x801F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle
    ;mptblcname WOTDLT
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0x84                       ;Point 1
.org 0x8020
TL_TL_8020:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8020
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8020
    ;mptblcname TL_8020
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8020
          .byte 0xFF                       ;Point 1
.org 0x8021
TL_ScaleMAPVoltsToPresMultiplyConst:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0x8021
    ;mptbltype 8
    ;mpsubtype 1
    ;mptbllname ScaleMAPVoltsToPresMultiplyConst
    ;mptblcname MAPMULT
    ;mpxaxis IN 0 255 X(byte)
    ;mpyaxis OUT 0 255 Y
    ;mptbldesc Map_Scale_multiplier._This_is_the_slope_constant_for_the_MAP_sensor_transfer_function._#07_is_the_original_Mopar_2-bar_constant._#09_for_the_S60_3-bar_sensor._The_GM_or_MSD_3-Bar_sensors_may_need_these_values_changed_for
    ;mpchoices 1.0_Bar 0 1.5_Bar 0 2.0_Bar 0 2.5_Bar 0 3.0_Bar 0 3.5_Bar 0 4.0_Bar 0 4.5_Bar 0
    ;mpmapaxis b
          .byte 0x00                       ;Point 1
.org 0x8022
TL_ScaleMAPVoltsToPresAddConst:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0x8022
    ;mptbltype 8
    ;mpsubtype 1
    ;mptbllname ScaleMAPVoltsToPresAddConst
    ;mptblcname MAPADD
    ;mpxaxis IN 0 255 X(word)
    ;mpyaxis OUT 0 255 Y
    ;mptbldesc Scale_MAP_Volts_to_MAP_add_constant:_This_is_the_offset_constant_for_the_MAP_sensor_transfer_function._#0361_is_the_original_Mopar_2-bar_constant._#0700_for_the_S60_3-bar_sensor._The_GM_or_MSD_3-Bar_sensors_may_need_thes
    ;mpchoices 1.0_Bar 0000 1.5_Bar 0000 2.0_Bar 0 2.5_Bar 0000 3.0_Bar 0000 3.5_Bar 0000 4.0_Bar 0000 4.5_Bar 0000
    ;mpmapaxis w
          .word 0x0000                     ;Point 1
.org 0x8024
TL_TL_8024:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8024
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_8024
    ;mptblcname TL_8024
    ;mpxaxis rpm 0 8192 rpm
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Lookup_table_returns_a_map_value_that_is_compared_to_baropressure
          .byte 0x05                       ;Number of points in table
          .byte 0x00, 0x00, 0x00, 0x19     ;Point 1
          .byte 0x1F, 0x03, 0x00, 0x08     ;Point 2
          .byte 0x3E, 0x04, 0x00, 0x20     ;Point 3
          .byte 0x5E, 0x08, 0x00, 0x32     ;Point 4
          .byte 0x9C, 0x14                 ;Point 5
.org 0x8037
TL_ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8037
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin
    ;mptblcname MPLTHR1
    ;mpxaxis Xinput 1 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_IMM_8037
          .byte 0x90                       ;Point 1
.org 0x8038
TL_ThrottleLevelMinAbove_MINTHR_ToMatureMapLimpin:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8038
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ThrottleLevelMinAbove_MINTHR_ToMatureMapLimpin
    ;mptblcname MPLTHR2
    ;mpxaxis Xinput 27 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8038
          .byte 0x05                       ;Point 1
.org 0x8039
TL_RPMCellLookupTable:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8039
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname RPMCellLookupTable
    ;mptblcname TL_8039
    ;mpxaxis Xinput 26 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T804B
          .byte 0x0F, 0xA0, 0x14, 0x50, 0x17, 0x70, 0x20, 0xD0, 0x23, 0xF0, 0x2E, 0xE0, 0x3E, 0x80, 0x4E, 0x20 ; 1 - 16
          .byte 0x5D, 0xC0, 0x6D, 0x60, 0x7D, 0x00, 0x8C, 0xA0, 0x9C, 0x40 ; 17 - 26
.org 0x8053
TL_RPM3DInputModifierFromRPM:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0x8053
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname RPM3DInputModifierFromRPM
    ;mptblcname RPMSCL
    ;mpxaxis rpm 0 8192 rpm
    ;mpyaxis Youtput 0 255 yfactor
    ;mptbldesc Output_is_used_as_the_input_to_the_3D_tables
          .byte 0x06                       ;Number of points in table
          .byte 0x10, 0x00, 0x02, 0xAB     ;Point 1
          .byte 0x16, 0x10, 0x04, 0xEC     ;Point 2
          .byte 0x23, 0x50, 0x04, 0x00     ;Point 3
          .byte 0x27, 0x60, 0x02, 0x0D     ;Point 4
          .byte 0x4E, 0xB0, 0x01, 0x03     ;Point 5
          .byte 0x9C, 0xFF                 ;Point 6
.org 0x806A
TL_TL_806a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x806A
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_806a
    ;mptblcname TL_806A
    ;mpxaxis Xinput 8 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T806A
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 8
.org 0x8072
TL_TL_8072:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8072
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8072
    ;mptblcname TL_8072
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8072
          .word 0x0262                     ;Point 1
.org 0x8074
TL_TL_8074:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8074
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8074
    ;mptblcname TL_8074
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8074
          .word 0x5A00                     ;Point 1
.org 0x8076
TL_AdaptiveWastegateCellBelow3psi:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8076
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname AdaptiveWastegateCellBelow3psi
    ;mptblcname DCCOR1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8076
          .word 0x0002                     ;Point 1
.org 0x8078
TL_TL_8078:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8078
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8078
    ;mptblcname TL_8078
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8078
          .word 0x625A                     ;Point 1
.org 0x807A
TL_TL_807a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x807A
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_807a
    ;mptblcname TL_807A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T807A
          .word 0x37CD                     ;Point 1
.org 0x807C
TL_TL_807C:
    ;mpgrp Unassigned\
    ;mptbladdr 0x807C
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_807C
    ;mptblcname TL_807C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_807C
          .word 0x4E20                     ;Point 1
.org 0x807E
TL_TL_807E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x807E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_807E
    ;mptblcname TL_807E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_807E
          .byte 0x00                       ;Point 1
.org 0x807F
TL_TL_807f:
    ;mpgrp Unassigned\
    ;mptbladdr 0x807F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_807f
    ;mptblcname TL_807F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T807F
          .byte 0x14                       ;Point 1
.org 0x8080
TL_TL_8080:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8080
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8080
    ;mptblcname TL_8080
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8080
          .byte 0x02                       ;Point 1
.org 0x8081
TL_TL_8081:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8081
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8081
    ;mptblcname TL_8081
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8081
          .byte 0x0C                       ;Point 1
.org 0x8082
TL_TL_8082:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8082
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8082
    ;mptblcname TL_8082
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8082
          .byte 0x04                       ;Point 1
.org 0x8083
TL_Spark1A_RPMMAP:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8083
    ;mptbltype 7
    ;mpsubtype n
    ;mptbllname Spark1A_RPMMAP
    ;mptblcname TL_L8083
    ;mpxaxis MAPVALD 0 255 xout
    ;mpyaxis RPMSCL 0 128 deg
    ;mptbldesc Desc_TL_L8083
    ;mp3dxtable MAPVALD 
    ;mp3dytable RPMSCL 
          .byte 0x11                       ;Number of rows in table
          .byte 0x09                       ;Number of cols in table
          .byte 0x00                       ;00 = unsigned, 80/FF = signed
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x14, 0x14, 0x14, 0x14 ;Row 1
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1A, 0x1E, 0x18, 0x14 ;Row 2
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1B, 0x1E, 0x18, 0x14 ;Row 3
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x2D, 0x20, 0x18, 0x14 ;Row 4
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x38, 0x2C, 0x1A, 0x0C ;Row 5
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x35, 0x39, 0x2C, 0x1C, 0x0C ;Row 6
          .byte 0x1C, 0x1F, 0x20, 0x38, 0x38, 0x3B, 0x2D, 0x1E, 0x0D ;Row 7
          .byte 0x1C, 0x28, 0x30, 0x3A, 0x3D, 0x3C, 0x30, 0x24, 0x16 ;Row 8
          .byte 0x1C, 0x2E, 0x38, 0x3F, 0x3F, 0x41, 0x38, 0x29, 0x1C ;Row 9
          .byte 0x1C, 0x34, 0x50, 0x4C, 0x40, 0x46, 0x40, 0x2E, 0x23 ;Row 10
          .byte 0x1C, 0x36, 0x5E, 0x55, 0x47, 0x46, 0x40, 0x31, 0x25 ;Row 11
          .byte 0x1C, 0x38, 0x60, 0x58, 0x53, 0x46, 0x40, 0x33, 0x26 ;Row 12
          .byte 0x1C, 0x38, 0x63, 0x5F, 0x4E, 0x48, 0x41, 0x36, 0x26 ;Row 13
          .byte 0x1C, 0x38, 0x5F, 0x52, 0x52, 0x45, 0x3A, 0x2E, 0x2B ;Row 14
          .byte 0x1C, 0x38, 0x5B, 0x4E, 0x4C, 0x44, 0x35, 0x2E, 0x28 ;Row 15
          .byte 0x1C, 0x38, 0x5D, 0x5A, 0x54, 0x3F, 0x3C, 0x31, 0x25 ;Row 16
          .byte 0x1C, 0x38, 0x60, 0x5C, 0x50, 0x3E, 0x42, 0x40, 0x2A ;Row 17
.org 0x811F
TL_Spark1B_RPMMAP:
    ;mpgrp Unassigned\
    ;mptbladdr 0x811F
    ;mptbltype 7
    ;mpsubtype n
    ;mptbllname Spark1B_RPMMAP
    ;mptblcname TL_L811F
    ;mpxaxis MAPVALD 0 255 xout
    ;mpyaxis RPMSCL 0 128 deg
    ;mptbldesc Desc_TL_L811F
    ;mp3dxtable MAPVALD 
    ;mp3dytable RPMSCL 
          .byte 0x11                       ;Number of rows in table
          .byte 0x09                       ;Number of cols in table
          .byte 0x00                       ;00 = unsigned, 80/FF = signed
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x14, 0x14, 0x14, 0x14 ;Row 1
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1A, 0x1E, 0x18, 0x14 ;Row 2
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1D, 0x1E, 0x18, 0x14 ;Row 3
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x30, 0x25, 0x1F, 0x18, 0x18 ;Row 4
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x38, 0x36, 0x30, 0x1D, 0x14 ;Row 5
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x43, 0x42, 0x33, 0x24, 0x15 ;Row 6
          .byte 0x1C, 0x29, 0x31, 0x31, 0x46, 0x42, 0x37, 0x26, 0x16 ;Row 7
          .byte 0x1C, 0x2B, 0x3B, 0x3C, 0x49, 0x43, 0x3B, 0x2C, 0x18 ;Row 8
          .byte 0x1C, 0x2D, 0x45, 0x4C, 0x4C, 0x44, 0x3F, 0x2F, 0x1B ;Row 9
          .byte 0x1C, 0x30, 0x50, 0x5C, 0x4F, 0x44, 0x41, 0x2E, 0x1F ;Row 10
          .byte 0x1C, 0x38, 0x50, 0x5C, 0x58, 0x54, 0x50, 0x3C, 0x30 ;Row 11
          .byte 0x1C, 0x38, 0x4E, 0x66, 0x60, 0x5E, 0x56, 0x3C, 0x2E ;Row 12
          .byte 0x1C, 0x38, 0x4C, 0x6E, 0x66, 0x60, 0x4A, 0x3C, 0x2D ;Row 13
          .byte 0x1C, 0x38, 0x4A, 0x6C, 0x64, 0x4E, 0x44, 0x40, 0x2A ;Row 14
          .byte 0x1C, 0x38, 0x4A, 0x5C, 0x4A, 0x44, 0x3E, 0x34, 0x22 ;Row 15
          .byte 0x1C, 0x38, 0x40, 0x5C, 0x48, 0x42, 0x3E, 0x34, 0x20 ;Row 16
          .byte 0x1C, 0x38, 0x40, 0x56, 0x4C, 0x44, 0x3C, 0x34, 0x28 ;Row 17
.org 0x81BB
TL_TL_81BB:
    ;mpgrp Unassigned\
    ;mptbladdr 0x81BB
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_81BB
    ;mptblcname TL_81BB
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_81BB
          .byte 0x03                       ;Point 1
.org 0x81BC
TL_Spark2A_RPMMAP:
    ;mpgrp Unassigned\
    ;mptbladdr 0x81BC
    ;mptbltype 7
    ;mpsubtype n
    ;mptbllname Spark2A_RPMMAP
    ;mptblcname TL_L81BC
    ;mpxaxis MAPVALD 0 255 xout
    ;mpyaxis RPMSCL 0 128 deg
    ;mptbldesc Desc_TL_L81BC
    ;mp3dxtable MAPVALD 
    ;mp3dytable RPMSCL 
          .byte 0x11                       ;Number of rows in table
          .byte 0x09                       ;Number of cols in table
          .byte 0x00                       ;00 = unsigned, 80/FF = signed
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 1
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 2
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 3
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 4
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 5
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 6
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 7
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 8
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 9
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 10
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 11
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 12
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 13
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 14
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 15
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 16
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Row 17
.org 0x8258
TL_MapValFromRPMPtr:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8258
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname MapValFromRPMPtr
    ;mptblcname TL_8258
    ;mpxaxis Xinput 5 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8258
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 5
.org 0x825D
TL_TL_825d:
    ;mpgrp Unassigned\
    ;mptbladdr 0x825D
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_825d
    ;mptblcname TL_825D
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_825d
          .byte 0xA4, 0xA4, 0xA4, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80 ;Fixed X 9 byte table
.org 0x8266
TL_TL_8266:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8266
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8266
    ;mptblcname TL_8266
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8266
          .byte 0x2A, 0x2A, 0x2A, 0x2A, 0x28, 0x26, 0x20, 0x1E, 0x1A ;Fixed X 9 byte table
.org 0x826F
TL_TL_826F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x826F
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_826F
    ;mptblcname TL_826F
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_826F
          .byte 0x28, 0x24, 0x24, 0x20, 0x20, 0x1A, 0x1A, 0x1A, 0x1A ;Fixed X 9 byte table
.org 0x8278
TL_TL_8278:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8278
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8278
    ;mptblcname TL_8278
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y -14.7 0 psi
    ;mptbldesc Desc_TL_8278
          .byte 0xD0                       ;Point 1
.org 0x8279
TL_TL_8279:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8279
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8279
    ;mptblcname TL_8279
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y -14.7 0 psi
    ;mptbldesc Desc_TL_8279
          .byte 0x02                       ;Point 1
.org 0x827A
TL_TL_827A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x827A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_827A
    ;mptblcname TL_827A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_827A
          .byte 0x00                       ;Point 1
.org 0x827B
TL_TL_827B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x827B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_827B
    ;mptblcname TL_827B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_827B
          .byte 0x00                       ;Point 1
.org 0x827C
TL_TL_827C:
    ;mpgrp Unassigned\
    ;mptbladdr 0x827C
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_827C
    ;mptblcname TL_827C
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_827C
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Fixed X 9 byte table
.org 0x8285
TL_TL_8285:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8285
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8285
    ;mptblcname TL_8285
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8285
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ;Fixed X 9 byte table
.org 0x828E
TL_TL_828e:
    ;mpgrp Unassigned\
    ;mptbladdr 0x828E
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_828e
    ;mptblcname TL_8283
    ;mpxaxis Xinput 33 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T828E
          .byte 0x02, 0xB3, 0x05, 0x4E, 0x04, 0x00, 0xBD, 0x65, 0x15, 0x02, 0x66, 0x79, 0x45, 0x00, 0xC0, 0x7D ; 1 - 16
          .byte 0x48, 0x01, 0xCE, 0x9C, 0x80, 0x08, 0x06, 0x00, 0xD0, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00 ; 17 - 32
          .byte 0x00 ; 33 - 33
.org 0x82AF
TL_TL_82af:
    ;mpgrp Unassigned\
    ;mptbladdr 0x82AF
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_82af
    ;mptblcname TL_82AF
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T82AF
          .word 0x208D                     ;Point 1
.org 0x82B1
TL_TL_82B1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x82B1
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_82B1
    ;mptblcname TL_82B1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_82B1
          .word 0x4E20                     ;Point 1
.org 0x82B3
TL_ColdLoad3DTableOffIdle:
    ;mpgrp Unassigned\
    ;mptbladdr 0x82B3
    ;mptbltype 7
    ;mpsubtype n
    ;mptbllname ColdLoad3DTableOffIdle
    ;mptblcname CLDLDP
    ;mpxaxis MAPVALD 0 255 xout
    ;mpyaxis RPMSCL -64 64 deg
    ;mptbldesc Desc_TL_L82B3
    ;mp3dxtable MAPVALD 
    ;mp3dytable RPMSCL 
          .byte 0x11                       ;Number of rows in table
          .byte 0x09                       ;Number of cols in table
          .byte 0x00                       ;00 = unsigned, 80/FF = signed
          .byte 0x46, 0x30, 0x30, 0x2D, 0x30, 0x34, 0x3B, 0x40, 0x53 ;Row 1
          .byte 0x46, 0x30, 0x23, 0x23, 0x30, 0x34, 0x3B, 0x40, 0x53 ;Row 2
          .byte 0x52, 0x42, 0x33, 0x33, 0x37, 0x3D, 0x3E, 0x45, 0x59 ;Row 3
          .byte 0x59, 0x4B, 0x44, 0x44, 0x42, 0x44, 0x48, 0x4F, 0x68 ;Row 4
          .byte 0x6F, 0x50, 0x4B, 0x52, 0x52, 0x55, 0x5B, 0x65, 0x73 ;Row 5
          .byte 0x78, 0x62, 0x50, 0x52, 0x58, 0x59, 0x5E, 0x69, 0x79 ;Row 6
          .byte 0x81, 0x62, 0x4F, 0x4F, 0x5C, 0x64, 0x71, 0x78, 0x8A ;Row 7
          .byte 0x8A, 0x5C, 0x4C, 0x4F, 0x5D, 0x67, 0x74, 0x7E, 0x88 ;Row 8
          .byte 0x93, 0x60, 0x4F, 0x4C, 0x60, 0x6A, 0x74, 0x84, 0x90 ;Row 9
          .byte 0xD0, 0x78, 0x6E, 0x69, 0x80, 0x82, 0x84, 0x88, 0x88 ;Row 10
          .byte 0xF0, 0xCA, 0xA7, 0x9A, 0x92, 0x92, 0x92, 0x8E, 0x8E ;Row 11
          .byte 0xFF, 0xEF, 0xBD, 0xA6, 0xA0, 0xA0, 0xA0, 0x9E, 0x9E ;Row 12
          .byte 0xFF, 0xEF, 0xB8, 0xB1, 0xA6, 0xA0, 0x9C, 0x97, 0x97 ;Row 13
          .byte 0xFF, 0xFF, 0xE2, 0xC1, 0xA2, 0x98, 0x90, 0xA0, 0xC0 ;Row 14
          .byte 0xFF, 0xFF, 0xF4, 0xCB, 0xA0, 0xAA, 0xAC, 0xCE, 0xF0 ;Row 15
          .byte 0xFF, 0xFF, 0x80, 0x90, 0xA4, 0xBC, 0xC8, 0xE8, 0xFF ;Row 16
          .byte 0xC0, 0xC0, 0xA0, 0x94, 0x9E, 0xB0, 0xC3, 0xCC, 0xFF ;Row 17
.org 0x834F
TL_HotLoad3DTableOffIdle:
    ;mpgrp Unassigned\
    ;mptbladdr 0x834F
    ;mptbltype 7
    ;mpsubtype n
    ;mptbllname HotLoad3DTableOffIdle
    ;mptblcname HTLDP
    ;mpxaxis MAPVALD 0 255 xout
    ;mpyaxis RPMSCL -64 64 deg
    ;mptbldesc Desc_MIS_834F
    ;mp3dxtable MAPVALD 
    ;mp3dytable RPMSCL 
          .byte 0x11                       ;Number of rows in table
          .byte 0x09                       ;Number of cols in table
          .byte 0x00                       ;00 = unsigned, 80/FF = signed
          .byte 0x38, 0x32, 0x2F, 0x2F, 0x2F, 0x3E, 0x43, 0x65, 0x6E ;Row 1
          .byte 0x4C, 0x4D, 0x3C, 0x39, 0x38, 0x47, 0x4E, 0x6E, 0x79 ;Row 2
          .byte 0x61, 0x69, 0x49, 0x43, 0x40, 0x50, 0x59, 0x76, 0x85 ;Row 3
          .byte 0x77, 0x6E, 0x51, 0x4C, 0x4A, 0x60, 0x66, 0x7D, 0x84 ;Row 4
          .byte 0x8E, 0x74, 0x5A, 0x56, 0x54, 0x70, 0x73, 0x84, 0x83 ;Row 5
          .byte 0xA2, 0x85, 0x65, 0x65, 0x62, 0x71, 0x74, 0x87, 0x88 ;Row 6
          .byte 0xB6, 0x96, 0x70, 0x73, 0x70, 0x71, 0x74, 0x89, 0x8D ;Row 7
          .byte 0xBE, 0x99, 0x78, 0x76, 0x74, 0x72, 0x78, 0x8C, 0x8B ;Row 8
          .byte 0xB6, 0x90, 0x74, 0x6D, 0x72, 0x73, 0x77, 0x8E, 0x92 ;Row 9
          .byte 0xB1, 0x8D, 0x67, 0x65, 0x6B, 0x70, 0x77, 0x91, 0x90 ;Row 10
          .byte 0xFF, 0xCB, 0x80, 0x7E, 0x7E, 0x7F, 0x80, 0x95, 0x89 ;Row 11
          .byte 0xFF, 0xF9, 0xA7, 0x96, 0x8C, 0x8C, 0x84, 0x91, 0x99 ;Row 12
          .byte 0xFF, 0xFF, 0xCD, 0xB2, 0xA5, 0x97, 0x94, 0xA5, 0xA4 ;Row 13
          .byte 0xFF, 0xFF, 0xC2, 0xAC, 0xA2, 0x9F, 0x95, 0xAE, 0xAB ;Row 14
          .byte 0xFF, 0xFF, 0xC3, 0xAF, 0xA4, 0xA4, 0xA6, 0xBD, 0xB0 ;Row 15
          .byte 0xFF, 0xFF, 0xC7, 0xB3, 0xA3, 0xA5, 0xA2, 0xBB, 0xB2 ;Row 16
          .byte 0xFF, 0xFF, 0xD4, 0xB8, 0xA4, 0xAC, 0xAC, 0xC9, 0xBF ;Row 17
.org 0x83EB
TL_TL_83EB:
    ;mpgrp Unassigned\
    ;mptbladdr 0x83EB
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_83EB
    ;mptblcname TL_83EB
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_83EB
          .byte 0xD0, 0xA4, 0x5E, 0x18, 0x0B, 0x09, 0x04, 0x04, 0x04 ;Fixed X 9 byte table
.org 0x83F4
TL_TL_83F4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x83F4
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_83F4
    ;mptblcname TL_83F4
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_83F4
          .byte 0x40, 0x38, 0x30, 0x22, 0x12, 0x0C, 0x08, 0x08, 0x04 ;Fixed X 9 byte table
.org 0x83FD
TL_TL_83FD:
    ;mpgrp Unassigned\
    ;mptbladdr 0x83FD
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_83FD
    ;mptblcname TL_83FD
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_83FD
          .byte 0xC8, 0x90, 0x50, 0x2A, 0x28, 0x18, 0x0E, 0x10, 0x10 ;Fixed X 9 byte table
.org 0x8406
TL_TL_8406:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8406
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8406
    ;mptblcname TL_8406
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8406
          .byte 0x2C, 0x28, 0x24, 0x18, 0x0C, 0x08, 0x00, 0x00, 0x00 ;Fixed X 9 byte table
.org 0x840F
TL_TL_840f:
    ;mpgrp Unassigned\
    ;mptbladdr 0x840F
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_840f
    ;mptblcname TL_840F
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_840F
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0xB0, 0xC0, 0xC0 ;Fixed X 9 byte table
.org 0x8418
TL_TL_8418:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8418
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8418
    ;mptblcname TL_8418
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8418
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Fixed X 9 byte table
.org 0x8421
TL_TL_8421:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8421
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8421
    ;mptblcname TL_8421
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8421
          .byte 0x40, 0x37, 0x2B, 0x20, 0x1C, 0x14, 0x10, 0x10, 0x10 ;Fixed X 9 byte table
.org 0x842A
TL_TL_842A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x842A
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_842A
    ;mptblcname TL_842A
    ;mpxaxis Battery 0 16 volts
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_842A
          .byte 0x08                       ;Number of points in table
          .byte 0x61, 0xFF, 0xFC, 0xC0     ;Point 1
          .byte 0x71, 0xCB, 0xFB, 0x20     ;Point 2
          .byte 0x81, 0x7D, 0xFD, 0xD3     ;Point 3
          .byte 0x92, 0x58, 0xFE, 0x40     ;Point 4
          .byte 0xA2, 0x3C, 0xFF, 0x38     ;Point 5
          .byte 0xC2, 0x23, 0xFF, 0x6D     ;Point 6
          .byte 0xE3, 0x10, 0xFF, 0x6E     ;Point 7
          .byte 0xFF, 0x00                 ;Point 8
.org 0x8449
TL_TL_8449:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8449
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8449
    ;mptblcname TL_8449
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8449
          .byte 0xF4, 0xC8, 0x90, 0x40, 0x20, 0x14, 0x10, 0x0F, 0x0B ;Fixed X 9 byte table
.org 0x8452
TL_TL_8452:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8452
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8452
    ;mptblcname TL_8452
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8452
          .byte 0xCC, 0xCC, 0xCC, 0xCC, 0xCC, 0xCC, 0xE6, 0xFF, 0xFF ;Fixed X 9 byte table
.org 0x845B
TL_TL_845B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x845B
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_845B
    ;mptblcname TL_845B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_845B
          .byte 0x04                       ;Number of points in table
          .byte 0x0C, 0x00, 0x02, 0x80     ;Point 1
          .byte 0x18, 0x1E, 0x01, 0xD5     ;Point 2
          .byte 0x24, 0x34, 0x0C, 0xAB     ;Point 3
          .byte 0x2A, 0x80                 ;Point 4
.org 0x846A
TL_TL_846a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x846A
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_846a
    ;mptblcname TL_846A
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T846A
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x846E
TL_TL_846E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x846E
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_846E
    ;mptblcname TL_846E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_IMM_846E
          .byte 0x02                       ;Number of points in table
          .byte 0x00, 0x00, 0x00, 0x00     ;Point 1
          .byte 0xFF, 0x00                 ;Point 2
.org 0x8475
TL_TL_8475:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8475
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8475
    ;mptblcname TL_8475
    ;mpxaxis Xinput 12 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8475
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 12
.org 0x8481
TL_TL_8481:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8481
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8481
    ;mptblcname TL_8481
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8481
          .word 0x7D00                     ;Point 1
.org 0x8483
TL_TL_8483:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8483
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8483
    ;mptblcname TL_8483
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_temp -200 260 deg
    ;mptbldesc Desc_T8483
          .byte 0xE8                       ;Point 1
.org 0x8484
TL_TL_8484:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8484
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8484
    ;mptblcname TL_8484
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_T8484
          .byte 0xD0                       ;Point 1
.org 0x8485
TL_TL_8485:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8485
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8485
    ;mptblcname TL_8485
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8485
          .byte 0x00                       ;Point 1
.org 0x8486
TL_TL_8486:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8486
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8486
    ;mptblcname TL_8486
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8486
          .byte 0x08, 0x08, 0x08, 0x0A, 0x0A, 0x0B, 0x09, 0x08, 0x08 ;Fixed X 9 byte table
.org 0x848F
TL_TL_848F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x848F
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_848F
    ;mptblcname TL_848F
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_848F
          .byte 0x1C, 0x1C, 0x1C, 0x09, 0x09, 0x0B, 0x0C, 0x0C, 0x0C ;Fixed X 9 byte table
.org 0x8498
TL_TL_8498:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8498
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8498
    ;mptblcname TL_8498
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8498
          .byte 0x10, 0x10, 0x10, 0x20, 0x24, 0x28, 0x30, 0x30, 0x30 ;Fixed X 9 byte table
.org 0x84A1
TL_TL_84A1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84A1
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_84A1
    ;mptblcname TL_84A1
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_84A1
          .byte 0xCF, 0x8E, 0x63, 0x2A, 0x2A, 0x28, 0x1C, 0x16, 0x16 ;Fixed X 9 byte table
.org 0x84AA
TL_TL_84AA:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84AA
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_84AA
    ;mptblcname TL_84AA
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_84AA
          .byte 0x60, 0x50, 0x40, 0x32, 0x2A, 0x26, 0x20, 0x20, 0x20 ;Fixed X 9 byte table
.org 0x84B3
TL_TL_84B3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84B3
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_84B3
    ;mptblcname TL_84B3
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_84B3
          .byte 0x50, 0x40, 0x38, 0x30, 0x14, 0x10, 0x08, 0x08, 0x08 ;Fixed X 9 byte table
.org 0x84BC
TL_MapVoltsAverageFactors1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84BC
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname MapVoltsAverageFactors1
    ;mptblcname TL_84BC
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_MAPVOLTSAVERAGEFACTORS1
          .word 0x8080                     ;Point 1
.org 0x84BE
TL_TL_84BE:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84BE
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84BE
    ;mptblcname TL_84BE
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_84BE
          .byte 0x7B                       ;Point 1
.org 0x84BF
TL_TL_84BF:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84BF
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84BF
    ;mptblcname TL_84BF
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_84BF
          .byte 0x50                       ;Point 1
.org 0x84C0
TL_TL_84C0:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84C0
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84C0
    ;mptblcname TL_84C0
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_84C0
          .byte 0xD6                       ;Point 1
.org 0x84C1
TL_RPMAverageFactors1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84C1
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname RPMAverageFactors1
    ;mptblcname TL_84C1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_RPMAVERAGEFACTORS1
          .word 0x2020                     ;Point 1
.org 0x84C3
TL_TL_84C3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84C3
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84C3
    ;mptblcname TL_84C3
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_84C3
          .byte 0x00                       ;Point 1
.org 0x84C4
TL_TL_84c4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84C4
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84c4
    ;mptblcname TL_84C4
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84C4
          .byte 0x0A                       ;Point 1
.org 0x84C5
TL_TL_84c5:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84C5
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_84c5
    ;mptblcname TL_84C5
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84C5
          .word 0xFFEB                     ;Point 1
.org 0x84C7
TL_TL_84c7:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84C7
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_84c7
    ;mptblcname TL_84C7
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84C7
          .word 0x0180                     ;Point 1
.org 0x84C9
TL_TL_84c9:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84C9
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84c9
    ;mptblcname TL_84C9
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84C9
          .byte 0x76                       ;Point 1
.org 0x84CA
TL_MapAverageFactors2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84CA
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MapAverageFactors2
    ;mptblcname TL_84CA
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_MAPAVERAGEFACTORS2
          .byte 0x7E                       ;Point 1
.org 0x84CB
TL_TL_84Cb:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84CB
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84Cb
    ;mptblcname TL_84CB
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_84CB
          .byte 0x40                       ;Point 1
.org 0x84CC
TL_TL_84CC:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84CC
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84CC
    ;mptblcname TL_84CC
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_84CC
          .byte 0x40                       ;Point 1
.org 0x84CD
TL_TL_84cd:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84CD
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84cd
    ;mptblcname TL_84CD
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84CD
          .byte 0xF0                       ;Point 1
.org 0x84CE
TL_TL_84CE:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84CE
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_84CE
    ;mptblcname TL_84CE
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_84CE
          .byte 0x44, 0x33, 0x2C, 0x19, 0x1A, 0x20, 0x20, 0x17, 0x17 ;Fixed X 9 byte table
.org 0x84D7
TL_TL_84d7:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84D7
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_84d7
    ;mptblcname TL_84D7
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84D7
          .byte 0x06                       ;Point 1
.org 0x84D8
TL_TL_84d8:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84D8
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_84d8
    ;mptblcname TL_84D8
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84D8
          .word 0x024E                     ;Point 1
.org 0x84DA
TL_RPM3DInputModifierFromRPM2:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0x84DA
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname RPM3DInputModifierFromRPM2
    ;mptblcname RPMSCL2
    ;mpxaxis rpm 0 8192 rpm
    ;mpyaxis Youtput 0 255 yfactor
    ;mptbldesc Output_is_used_as_the_input_to_the_3D_tables_for_o2_volts
          .byte 0x05                       ;Number of points in table
          .byte 0x16, 0x00, 0x04, 0x92     ;Point 1
          .byte 0x24, 0x40, 0x05, 0xD1     ;Point 2
          .byte 0x2F, 0x80, 0x04, 0x00     ;Point 3
          .byte 0x3F, 0xC0, 0x04, 0x33     ;Point 4
          .byte 0x4E, 0xFF                 ;Point 5
.org 0x84ED
TL_TL_84ed:
    ;mpgrp Unassigned\
    ;mptbladdr 0x84ED
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_84ed
    ;mptblcname TL_84ED
    ;mpxaxis Xinput 12 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T84ED
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 12
.org 0x84F9
TL_O2LoLimitForInMiddleDetermination:
    ;mpgrp Fuel\O2_Sensor\
    ;mptbladdr 0x84F9
    ;mptbltype 7
    ;mpsubtype n
    ;mptbllname O2LoLimitForInMiddleDetermination
    ;mptblcname TL_L84F9
    ;mpxaxis MAPVOLD 0 255 rpm
    ;mpyaxis RPMSCL2 0 5 O2Volts
    ;mptbldesc O2_Sensor_low_volt
    ;mp3dxtable MAPVOLD 
    ;mp3dytable RPMSCL2 
          .byte 0x05                       ;Number of rows in table
          .byte 0x09                       ;Number of cols in table
          .byte 0x00                       ;00 = unsigned, 80/FF = signed
          .byte 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16 ;Row 1
          .byte 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16 ;Row 2
          .byte 0x16, 0x16, 0x17, 0x17, 0x17, 0x16, 0x16, 0x16, 0x16 ;Row 3
          .byte 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16 ;Row 4
          .byte 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16 ;Row 5
.org 0x8529
TL_TL_8529:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8529
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8529
    ;mptblcname TL_8529
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_8529
          .byte 0xFF                       ;Point 1
.org 0x852A
TL_TL_852a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x852A
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_852a
    ;mptblcname TL_852A
    ;mpxaxis Xinput 107 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T852A
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 16
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 17 - 32
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 33 - 48
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 49 - 64
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 65 - 80
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 81 - 96
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 97 - 107
.org 0x8595
TL_O2HiLimitForInMiddleDetermination:
    ;mpgrp Fuel\O2_Sensor\
    ;mptbladdr 0x8595
    ;mptbltype 7
    ;mpsubtype n
    ;mptbllname O2HiLimitForInMiddleDetermination
    ;mptblcname TL_L8595
    ;mpxaxis MAPVOLD 0 255 rpm
    ;mpyaxis RPMSCL2 0 5 O2Volts
    ;mptbldesc O2_Sensor_high_volt
    ;mp3dxtable MAPVOLD 
    ;mp3dytable RPMSCL2 
          .byte 0x05                       ;Number of rows in table
          .byte 0x09                       ;Number of cols in table
          .byte 0x00                       ;00 = unsigned, 80/FF = signed
          .byte 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1E, 0x1E ;Row 1
          .byte 0x1C, 0x1C, 0x1E, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F ;Row 2
          .byte 0x1E, 0x1E, 0x1F, 0x1F, 0x1F, 0x1F, 0x20, 0x21, 0x21 ;Row 3
          .byte 0x1E, 0x1E, 0x20, 0x20, 0x20, 0x20, 0x21, 0x22, 0x22 ;Row 4
          .byte 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22 ;Row 5
.org 0x85C5
TL_TL_85C5:
    ;mpgrp Unassigned\
    ;mptbladdr 0x85C5
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_85C5
    ;mptblcname TL_85C5
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_85C5
          .byte 0xFF                       ;Point 1
.org 0x85C6
TL_TL_85c6:
    ;mpgrp Unassigned\
    ;mptbladdr 0x85C6
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_85c6
    ;mptblcname TL_85C6
    ;mpxaxis Xinput 107 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T85C6
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 16
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 17 - 32
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 33 - 48
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 49 - 64
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 65 - 80
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 81 - 96
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 97 - 107
.org 0x8631
TL_TL_8631:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8631
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8631
    ;mptblcname TL_8631
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8631
          .byte 0x0A                       ;Point 1
.org 0x8632
TL_TL_8632:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8632
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8632
    ;mptblcname TL_8632
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8632
          .byte 0x0C                       ;Point 1
.org 0x8633
TL_TL_8633:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8633
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8633
    ;mptblcname TL_8633
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_T8633
          .byte 0x20                       ;Point 1
.org 0x8634
TL_TL_8634:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8634
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8634
    ;mptblcname TL_8634
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8634
          .byte 0x20                       ;Point 1
.org 0x8635
TL_TL_8635:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8635
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8635
    ;mptblcname TL_8635
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8635
          .byte 0x04                       ;Point 1
.org 0x8636
TL_TL_8636:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8636
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8636
    ;mptblcname TL_8636
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8636
          .byte 0x02                       ;Point 1
.org 0x8637
TL_TL_8637:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8637
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8637
    ;mptblcname TL_8637
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8637
          .byte 0x60                       ;Point 1
.org 0x8638
TL_TL_8638:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8638
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8638
    ;mptblcname TL_8638
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8638
          .byte 0x0C                       ;Point 1
.org 0x8639
TL_TL_8639:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8639
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8639
    ;mptblcname TL_8639
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8639
          .byte 0xFE                       ;Point 1
.org 0x863A
TL_TL_863A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x863A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_863A
    ;mptblcname TL_863A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_863A
          .byte 0x57                       ;Point 1
.org 0x863B
TL_MapVoltsAverageFactors2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x863B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MapVoltsAverageFactors2
    ;mptblcname TL_863B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_MAPVOLTSAVERAGEFACTORS2
          .byte 0x0A                       ;Point 1
.org 0x863C
TL_TL_863c:
    ;mpgrp Unassigned\
    ;mptbladdr 0x863C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_863c
    ;mptblcname TL_863C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_863C
          .byte 0x08                       ;Point 1
.org 0x863D
TL_TL_863D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x863D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_863D
    ;mptblcname TL_863D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_MIS_863D
          .byte 0x0A                       ;Point 1
.org 0x863E
TL_TL_863e:
    ;mpgrp Unassigned\
    ;mptbladdr 0x863E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_863e
    ;mptblcname TL_863E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_MIS_863E
          .byte 0x60                       ;Point 1
.org 0x863F
TL_TPSVoltsAverageFactors1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x863F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TPSVoltsAverageFactors1
    ;mptblcname TL_863F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_TPSVOLTSAVERAGEFACTORS1
          .byte 0x20                       ;Point 1
.org 0x8640
TL_TL_8640:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8640
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8640
    ;mptblcname TL_8640
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8640
          .byte 0xFF                       ;Point 1
.org 0x8641
TL_MapAverageFactors1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8641
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname MapAverageFactors1
    ;mptblcname TL_8641
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_MAPAVERAGEFACTORS1
          .word 0x0E04                     ;Point 1
.org 0x8643
TL_TL_8643:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8643
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8643
    ;mptblcname TL_8643
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_MIS_8643
          .byte 0x1F                       ;Point 1
.org 0x8644
TL_TL_8644:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8644
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8644
    ;mptblcname TL_8644
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8644
          .byte 0x0A                       ;Point 1
.org 0x8645
TL_TL_8645:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8645
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8645
    ;mptblcname TL_8645
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_T8645
          .byte 0x80                       ;Point 1
.org 0x8646
TL_TPSAverageFactors1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8646
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TPSAverageFactors1
    ;mptblcname TL_8646
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_TPSAVERAGEFACTORS1
          .word 0x18C0                     ;Point 1
.org 0x8648
TL_TL_8648:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8648
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8648
    ;mptblcname TL_8648
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8648
          .byte 0xD6                       ;Point 1
.org 0x8649
TL_TL_8649:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8649
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8649
    ;mptblcname TL_8649
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8649
          .byte 0x08                       ;Point 1
.org 0x864A
TL_TL_864A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x864A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_864A
    ;mptblcname TL_864A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_864A
          .byte 0x18                       ;Point 1
.org 0x864B
TL_TL_864B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x864B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_864B
    ;mptblcname TL_864B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_864B
          .byte 0x55                       ;Point 1
.org 0x864C
TL_TL_864C:
    ;mpgrp Unassigned\
    ;mptbladdr 0x864C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_864C
    ;mptblcname TL_864C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_864C
          .byte 0xFF                       ;Point 1
.org 0x864D
TL_TL_864D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x864D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_864D
    ;mptblcname TL_864D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_864D
          .byte 0x01                       ;Point 1
.org 0x864E
TL_TL_864E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x864E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_864E
    ;mptblcname TL_864E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_864E
          .byte 0x38                       ;Point 1
.org 0x864F
TL_TL_864F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x864F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_864F
    ;mptblcname TL_864F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_864F
          .byte 0x10                       ;Point 1
.org 0x8650
TL_TL_8650:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8650
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8650
    ;mptblcname TL_8650
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8650
          .byte 0x07, 0xA0, 0x00, 0xC0 ; 1 - 4
.org 0x8654
TL_TL_8654:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8654
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8654
    ;mptblcname TL_8654
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8654
          .byte 0x08                       ;Point 1
.org 0x8655
TL_TL_8655:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8655
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8655
    ;mptblcname TL_8655
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8655
          .byte 0x03, 0x90, 0x00, 0xE0 ; 1 - 4
.org 0x8659
TL_TL_8659:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8659
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8659
    ;mptblcname TL_8659
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8659
          .byte 0xA8                       ;Point 1
.org 0x865A
TL_TL_865A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x865A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_865A
    ;mptblcname TL_865A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_865A
          .byte 0x6C                       ;Point 1
.org 0x865B
TL_TL_865B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x865B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_865B
    ;mptblcname TL_865B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_865B
          .byte 0x10                       ;Point 1
.org 0x865C
TL_TL_865C:
    ;mpgrp Unassigned\
    ;mptbladdr 0x865C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_865C
    ;mptblcname TL_865C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_865C
          .byte 0x04                       ;Point 1
.org 0x865D
TL_TL_865D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x865D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_865D
    ;mptblcname TL_865D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_865D
          .byte 0x5B                       ;Point 1
.org 0x865E
TL_TL_865E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x865E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_865E
    ;mptblcname TL_865E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_865E
          .byte 0x0A                       ;Point 1
.org 0x865F
TL_TL_865F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x865F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_865F
    ;mptblcname TL_865F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_865F
          .byte 0x6D                       ;Point 1
.org 0x8660
TL_TL_8660:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8660
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8660
    ;mptblcname TL_8660
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8660
          .byte 0x36                       ;Point 1
.org 0x8661
TL_TL_8661:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8661
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8661
    ;mptblcname TL_8661
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8661
          .byte 0x22                       ;Point 1
.org 0x8662
TL_TL_8662:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8662
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8662
    ;mptblcname TL_8662
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8662
          .byte 0x5A                       ;Point 1
.org 0x8663
TL_TL_8663:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8663
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8663
    ;mptblcname TL_8663
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8663
          .byte 0xF2                       ;Point 1
.org 0x8664
TL_TL_8664:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8664
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8664
    ;mptblcname TL_8664
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8664
          .byte 0x36                       ;Point 1
.org 0x8665
TL_TL_8665:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8665
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8665
    ;mptblcname TL_8665
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8665
          .byte 0x00                       ;Point 1
.org 0x8666
TL_TL_8666:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8666
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8666
    ;mptblcname TL_8666
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8666
          .byte 0x01                       ;Point 1
.org 0x8667
TL_TL_8667:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8667
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8667
    ;mptblcname TL_8667
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8667
          .byte 0x6A                       ;Point 1
.org 0x8668
TL_TL_8668:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8668
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8668
    ;mptblcname TL_8668
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8668
          .byte 0x80                       ;Point 1
.org 0x8669
TL_TL_8669:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8669
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8669
    ;mptblcname TL_8669
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8669
          .word 0x0400                     ;Point 1
.org 0x866B
TL_TL_866b:
    ;mpgrp Unassigned\
    ;mptbladdr 0x866B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_866b
    ;mptblcname TL_866B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T866B
          .byte 0x02                       ;Point 1
.org 0x866C
TL_TL_866c:
    ;mpgrp Unassigned\
    ;mptbladdr 0x866C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_866c
    ;mptblcname TL_866C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T866C
          .byte 0xBF                       ;Point 1
.org 0x866D
TL_TL_866D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x866D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_866D
    ;mptblcname TL_866D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_866D
          .byte 0xDB                       ;Point 1
.org 0x866E
TL_TL_866E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x866E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_866E
    ;mptblcname TL_866E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_866E
          .byte 0x80                       ;Point 1
.org 0x866F
TL_TL_866F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x866F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_866F
    ;mptblcname TL_866F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_866F
          .byte 0x01                       ;Point 1
.org 0x8670
TL_TL_8670:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8670
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8670
    ;mptblcname TL_8670
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 720 Sec
    ;mptbldesc Desc_TL_8670
          .byte 0x03                       ;Point 1
.org 0x8671
TL_TL_8671:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8671
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8671
    ;mptblcname TL_8671
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_8671
          .byte 0x14                       ;Point 1
.org 0x8672
TL_TL_8672:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8672
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8672
    ;mptblcname TL_8672
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8672
          .byte 0x94                       ;Point 1
.org 0x8673
TL_TL_8673:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8673
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8673
    ;mptblcname TL_8673
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8673
          .word 0x0000                     ;Point 1
.org 0x8675
TL_TL_8675:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8675
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8675
    ;mptblcname TL_8675
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8675
          .word 0x0000                     ;Point 1
.org 0x8677
TL_TL_8677:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8677
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8677
    ;mptblcname TL_8677
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 14.7 psi
    ;mptbldesc Desc_TL_8677
          .byte 0x00                       ;Point 1
.org 0x8678
TL_TL_8678:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8678
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8678
    ;mptblcname TL_8678
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8678
          .byte 0x02                       ;Point 1
.org 0x8679
TL_TL_8679:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8679
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8679
    ;mptblcname TL_8679
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8679
          .word 0x0320                     ;Point 1
.org 0x867B
TL_TL_867B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x867B
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_867B
    ;mptblcname TL_867B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_867B
          .word 0x5DC0                     ;Point 1
.org 0x867D
TL_TL_867D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x867D
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_867D
    ;mptblcname TL_867D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_867D
          .word 0x0640                     ;Point 1
.org 0x867F
TL_TL_867F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x867F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_867F
    ;mptblcname TL_867F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc compared_with_vehiclespeedscaled
          .byte 0xE0                       ;Point 1
.org 0x8680
TL_TL_8680:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8680
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8680
    ;mptblcname TL_8680
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8680
          .byte 0x06                       ;Point 1
.org 0x8681
TL_TL_8681:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8681
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8681
    ;mptblcname TL_8681
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8681
          .word 0xA600                     ;Point 1
.org 0x8683
TL_TL_8683:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8683
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8683
    ;mptblcname TL_8683
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8683
          .word 0x0190                     ;Point 1
.org 0x8685
TL_TempAboveWhichSparkScatterIsActive:
    ;mpgrp Spark\Scatter_Control\
    ;mptbladdr 0x8685
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TempAboveWhichSparkScatterIsActive
    ;mptblcname SSTEMP
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Coolant_Temp -200 260 Degrees
    ;mptbldesc Temperature_above_which_spark_scatter_is_active._For_road_racing____the_MP_cal_has_this_set_to_0xfe._This_keeps_the_revs_higher_during_shifts.
          .byte 0x58                       ;Point 1
.org 0x8686
TL_FineTuneStepForAis:
    ;mpgrp Spark\Scatter_Control\
    ;mptbladdr 0x8686
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname FineTuneStepForAis
    ;mptblcname FTUNPW
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Fine_Tune_Step_for_AIS_for_spark_scatter
          .byte 0x01                       ;Point 1
.org 0x8687
TL_ScatterInhibitTime:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8687
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname ScatterInhibitTime
    ;mptblcname SSITIM
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Time 0 720 Sec
    ;mptbldesc Desc_TL_8687
          .word 0x038D                     ;Point 1
.org 0x8689
TL_TL_8689:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8689
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8689
    ;mptblcname TL_8689
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8689
          .byte 0x0A                       ;Point 1
.org 0x868A
TL_TL_868A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x868A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_868A
    ;mptblcname TL_868A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_868A
          .byte 0x1C                       ;Point 1
.org 0x868B
TL_TL_868B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x868B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_868B
    ;mptblcname TL_868B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_868B
          .byte 0x1C                       ;Point 1
.org 0x868C
TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm:
    ;mpgrp Spark\Scatter_Control\
    ;mptbladdr 0x868C
    ;mptbltype 2
    ;mpsubtype n
    ;mptbllname SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm
    ;mptblcname SPKADD
    ;mpxaxis DeltaRPM 0 512 RPM
    ;mpyaxis Advance 0 127.5 degrees
    ;mptbldesc This_is_how_much_advance_is_added_to_increase_engine_speed.
          .byte 0x02                       ;Number of points in table
          .byte 0x05, 0x00, 0x02, 0x00     ;Point 1
          .byte 0x0C, 0x0E                 ;Point 2
.org 0x8693
TL_TL_8693:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8693
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8693
    ;mptblcname TL_8693
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8693
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x8697
TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8697
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm
    ;mptblcname SPKRET
    ;mpxaxis DeltaRPM 0 512 RPM
    ;mpyaxis Advance 0 127.5 degrees
    ;mptbldesc Desc_IMM_8697
          .byte 0x02                       ;Number of points in table
          .byte 0x05, 0x00, 0xFF, 0x9A     ;Point 1
          .byte 0x0F, 0xFC                 ;Point 2
.org 0x869E
TL_TL_869e:
    ;mpgrp Unassigned\
    ;mptbladdr 0x869E
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_869e
    ;mptblcname TL_869E
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T869E
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x86A2
TL_MinVoltageForAis:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x86A2
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MinVoltageForAis
    ;mptblcname BTVAIS
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 16 volts
    ;mptbldesc Detailed_Description
          .byte 0x71                       ;Point 1
.org 0x86A3
TL_BrakeOverrideForAis_FromDeltaThrottle:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86A3
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname BrakeOverrideForAis_FromDeltaThrottle
    ;mptblcname BRKRPM
    ;mpxaxis Xinput 11 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_86A3
          .byte 0x03, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF ; 1 - 11
.org 0x86AE
TL_AisStartupPosition_FromTemp:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x86AE
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname AisStartupPosition_FromTemp
    ;mptblcname AISTRT
    ;mpxaxis Temp -200 260 degrees
    ;mpyaxis AIS_Open 0 255 steps
    ;mptbldesc AIS_motor_startup_position_from_engine_temp
          .byte 0x05                       ;Number of points in table
          .byte 0x6A, 0xC8, 0xFC, 0xE9     ;Point 1
          .byte 0x80, 0x84, 0xFD, 0x80     ;Point 2
          .byte 0x94, 0x52, 0xFF, 0x80     ;Point 3
          .byte 0xC0, 0x3C, 0x00, 0x00     ;Point 4
          .byte 0xF8, 0x3C                 ;Point 5
.org 0x86C1
TL_TL_86C1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86C1
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_86C1
    ;mptblcname TL_86C1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_86C1
          .byte 0x03                       ;Number of points in table
          .byte 0x9A, 0x10, 0xFF, 0xD3     ;Point 1
          .byte 0xC8, 0x08, 0xFF, 0xCD     ;Point 2
          .byte 0xF0, 0x00                 ;Point 3
.org 0x86CC
TL_ACPositionWhenTempToCold:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86CC
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ACPositionWhenTempToCold
    ;mptblcname ACPOS_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_86CC
          .byte 0x10                       ;Point 1
.org 0x86CD
TL_Use_ACCTBL_WhenTempAboveThisElseUse_ACPOS:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x86CD
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname Use_ACCTBL_WhenTempAboveThisElseUse_ACPOS
    ;mptblcname ACTMP
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Temp -200 260 deg
    ;mptbldesc Detailed_Description
          .byte 0x94                       ;Point 1
.org 0x86CE
TL_TL_86CE:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86CE
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_86CE
    ;mptblcname TL_86CE
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_86CE
          .byte 0x28                       ;Point 1
.org 0x86CF
TL_AcClutchAisAdjustmentConstant:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x86CF
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname AcClutchAisAdjustmentConstant
    ;mptblcname PERKCK
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xFF                       ;Point 1
.org 0x86D0
TL_TL_86D0:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86D0
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_86D0
    ;mptblcname TL_86D0
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_86D0
          .byte 0xE0                       ;Point 1
.org 0x86D1
TL_ACOffIdleDelta_FromSpeed:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x86D1
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname ACOffIdleDelta_FromSpeed
    ;mptblcname ACCTBL
    ;mpxaxis Speed 0 127 mph
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Number of points in table
          .byte 0x28, 0x10, 0x00, 0x00     ;Point 1
          .byte 0x3C, 0x10, 0x00, 0x00     ;Point 2
          .byte 0x50, 0x10, 0x00, 0x66     ;Point 3
          .byte 0x78, 0x20                 ;Point 4
.org 0x86E0
TL_AISAddedFromTimeEngRunning:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86E0
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname AISAddedFromTimeEngRunning
    ;mptblcname ADDAIS
    ;mpxaxis TimeEngRun 0 2.8 sec
    ;mpyaxis Factor 0 1 scale
    ;mptbldesc Desc_TL_86E0
          .byte 0x00                       ;Point 1
.org 0x86E1
TL_AisColdPosition_FromTemp:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86E1
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname AisColdPosition_FromTemp
    ;mptblcname CLDPOS
    ;mpxaxis Temp -200 260 degrees
    ;mpyaxis AIS_Open 0 2048 steps
    ;mptbldesc Desc_IMM_86E1
          .byte 0x04                       ;Number of points in table
          .byte 0x68, 0x58, 0xFE, 0x80     ;Point 1
          .byte 0x80, 0x34, 0xFF, 0x80     ;Point 2
          .byte 0xA8, 0x20, 0xFF, 0x33     ;Point 3
          .byte 0xD0, 0x00                 ;Point 4
.org 0x86F0
TL_TL_86F0:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86F0
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_86F0
    ;mptblcname TL_86F0
    ;mpxaxis Time 0 720 sec
    ;mpyaxis y 0 255 units
    ;mptbldesc Desc_IMM_86F0
          .byte 0x03                       ;Number of points in table
          .byte 0x00, 0x00, 0x00, 0x00     ;Point 1
          .byte 0x10, 0x00, 0x00, 0x00     ;Point 2
          .byte 0x1A, 0x00                 ;Point 3
.org 0x86FB
TL_AisPosition_FromThrottle:
    ;mpgrp Unassigned\
    ;mptbladdr 0x86FB
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname AisPosition_FromThrottle
    ;mptblcname THRPOS
    ;mpxaxis TPS 0 5 volts
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_86FB
          .byte 0x04                       ;Number of points in table
          .byte 0x00, 0x00, 0x02, 0x00     ;Point 1
          .byte 0x02, 0x04, 0x01, 0x55     ;Point 2
          .byte 0x05, 0x08, 0x00, 0x00     ;Point 3
          .byte 0x1E, 0x08                 ;Point 4
.org 0x870A
TL_AisPosition_FromRpm:
    ;mpgrp Unassigned\
    ;mptbladdr 0x870A
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname AisPosition_FromRpm
    ;mptblcname RPMPOS
    ;mpxaxis RPM 0 8192 rpm
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_870A
          .byte 0x04                       ;Number of points in table
          .byte 0x20, 0x00, 0x00, 0x92     ;Point 1
          .byte 0x2E, 0x08, 0x00, 0x00     ;Point 2
          .byte 0x3F, 0x08, 0x00, 0x00     ;Point 3
          .byte 0x5E, 0x08                 ;Point 4
.org 0x8719
TL_TL_8719:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8719
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_8719
    ;mptblcname TL_8719
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8719
          .byte 0x03                       ;Number of points in table
          .byte 0x9A, 0x4C, 0xFF, 0xDF     ;Point 1
          .byte 0xC8, 0x46, 0xFF, 0xDA     ;Point 2
          .byte 0xF0, 0x40                 ;Point 3
.org 0x8724
TL_IdleSpeedParkNeutral_FromTemp:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x8724
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname IdleSpeedParkNeutral_FromTemp
    ;mptblcname AISPN
    ;mpxaxis Temp -200 260 degrees
    ;mpyaxis RPM 0 2048 rpm
    ;mptbldesc Idle_Speed_From_Temp_in_park/neutral_or_manual_trans
          .byte 0x05                       ;Number of points in table
          .byte 0x68, 0x80, 0xFF, 0xA3     ;Point 1
          .byte 0x94, 0x70, 0xFF, 0x8D     ;Point 2
          .byte 0xA8, 0x67, 0xFF, 0xAD     ;Point 3
          .byte 0xD0, 0x5A, 0x00, 0x00     ;Point 4
          .byte 0xF8, 0x5A                 ;Point 5
.org 0x8737
TL_IdleSpeedDrive_FromTemp:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x8737
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname IdleSpeedDrive_FromTemp
    ;mptblcname AISCLD
    ;mpxaxis Temp -200 260 degrees
    ;mpyaxis RPM 0 2048 rpm
    ;mptbldesc Idle_Speed_From_temp_in_Drive____auto_trans_only
          .byte 0x05                       ;Number of points in table
          .byte 0x68, 0x80, 0xFF, 0xA3     ;Point 1
          .byte 0x94, 0x70, 0xFF, 0x8D     ;Point 2
          .byte 0xA8, 0x67, 0xFF, 0xAD     ;Point 3
          .byte 0xD0, 0x5A, 0x00, 0x00     ;Point 4
          .byte 0xF8, 0x5A                 ;Point 5
.org 0x874A
TL_DecelAisBaseAirflowCurveOffset_FromTime2:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x874A
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname DecelAisBaseAirflowCurveOffset_FromTime2
    ;mptblcname TIMED2
    ;mpxaxis Time 0 720 sec
    ;mpyaxis y 0 255 units
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Number of points in table
          .byte 0x00, 0x00, 0x00, 0x00     ;Point 1
          .byte 0x00, 0x00                 ;Point 2
.org 0x8751
TL_TL_8751:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8751
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8751
    ;mptblcname TL_8751
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8751
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x8755
TL_TL_8755:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8755
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8755
    ;mptblcname TL_8755
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis RPM 0 2048 rpm
    ;mptbldesc Desc_TL_8755
          .byte 0x5A                       ;Point 1
.org 0x8756
TL_TargetIdleSpeed_HBDefault:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8756
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TargetIdleSpeed_HBDefault
    ;mptblcname IDLDEF
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8756
          .byte 0x64                       ;Point 1
.org 0x8757
TL_ForwardAisSteps_NoSlope:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x8757
    ;mptbltype 2
    ;mpsubtype n
    ;mptbllname ForwardAisSteps_NoSlope
    ;mptblcname FWDAIS
    ;mpxaxis DeltaRPM 0 2048 rpm
    ;mpyaxis AISSteps 0 255 step
    ;mptbldesc Detailed_Description
          .byte 0x05                       ;Number of points in table
          .byte 0x28, 0x01                 ;Point 1
          .byte 0x00, 0x00                 ;Point 2
          .byte 0x4B, 0x02                 ;Point 3
          .byte 0x00, 0x00                 ;Point 4
          .byte 0x5A, 0x02                 ;Point 5
          .byte 0x00, 0x00, 0x78, 0x02, 0x00, 0x00, 0xFF, 0x03 ; 1 - 8
.org 0x876A
TL_ReverseAisSteps_NoSlope:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x876A
    ;mptbltype 2
    ;mpsubtype n
    ;mptbllname ReverseAisSteps_NoSlope
    ;mptblcname REVAIS
    ;mpxaxis DeltaRPM 0 2048 rpm
    ;mpyaxis AISSteps 0 255 step
    ;mptbldesc Detailed_Description
          .byte 0x05                       ;Number of points in table
          .byte 0x32, 0xFF                 ;Point 1
          .byte 0x00, 0x00                 ;Point 2
          .byte 0x64, 0xFE                 ;Point 3
          .byte 0x00, 0x00                 ;Point 4
          .byte 0xA6, 0xFD                 ;Point 5
          .byte 0x00, 0x00, 0xC8, 0xFC, 0x00, 0x00, 0xFF, 0xF7 ; 1 - 8
.org 0x877D
TL_TL_877D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x877D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_877D
    ;mptblcname TL_877D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_877D
          .byte 0x0C                       ;Point 1
.org 0x877E
TL_AcClutchKickOpenAfterAcEnabled:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x877E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname AcClutchKickOpenAfterAcEnabled
    ;mptblcname AC2KCK
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Point 1
.org 0x877F
TL_TL_877F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x877F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_877F
    ;mptblcname TL_877F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_877F
          .byte 0xF4                       ;Point 1
.org 0x8780
TL_TL_8780:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8780
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8780
    ;mptblcname TL_8780
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8780
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Fixed X 9 byte table
.org 0x8789
TL_TL_8789:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8789
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8789
    ;mptblcname TL_8789
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8789
          .byte 0x2F                       ;Point 1
.org 0x878A
TL_TL_878A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x878A
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_878A
    ;mptblcname TL_878A
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_878A
          .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ;Fixed X 9 byte table
.org 0x8793
TL_AisPeriodForRpmFeedback11ms:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8793
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname AisPeriodForRpmFeedback11ms
    ;mptblcname AISFRQ
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x38                       ;Point 1
.org 0x8794
TL_AisHighLimitMaxOpenSteps:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8794
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname AisHighLimitMaxOpenSteps
    ;mptblcname AISHLM
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xD8                       ;Point 1
.org 0x8795
TL_AisDelayAfterThrottleClosesWhenMoving:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8795
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname AisDelayAfterThrottleClosesWhenMoving
    ;mptblcname DLYTIM
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Time 0 2.8 sec
    ;mptbldesc Desc_IMM_8795
          .word 0x8B8B                     ;Point 1
.org 0x8797
TL_UpdateRateOffIdleWhenAisClosing:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x8797
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UpdateRateOffIdleWhenAisClosing
    ;mptblcname DLYOF1
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xFF                       ;Point 1
.org 0x8798
TL_PositionAisMotorIsAtIdle:
    ;mpgrp Idle\AIS_Control\
    ;mptbladdr 0x8798
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PositionAisMotorIsAtIdle
    ;mptblcname CALPOS
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc AIS:_Position_electronics_thinks_motor_is_(at_idle)
          .byte 0x10                       ;Point 1
.org 0x8799
TL_AISAddedFromTimeEngRunning2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8799
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname AISAddedFromTimeEngRunning2
    ;mptblcname ADDAIS2
    ;mpxaxis TimeEngRun 0 2.8 sec
    ;mpyaxis Factor 0 1 scale
    ;mptbldesc Desc_TL_8799
          .byte 0x00                       ;Point 1
.org 0x879A
TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK:
    ;mpgrp Unassigned\
    ;mptbladdr 0x879A
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname DeltaRpmChangeToUse_DRPNK_or_PNDRK
    ;mptblcname PNDLTP
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_IMM_879A
          .byte 0x03                       ;Number of points in table
          .byte 0x80, 0xF0, 0xFF, 0x66     ;Point 1
          .byte 0x94, 0xE4, 0x00, 0x32     ;Point 2
          .byte 0xD2, 0xF0                 ;Point 3
.org 0x87A5
TL_DeltaRpmChangeToUse_DRPNK_or_PNDRK2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x87A5
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname DeltaRpmChangeToUse_DRPNK_or_PNDRK2
    ;mptblcname PNDLTN_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_IMM_87A5
          .byte 0x03                       ;Number of points in table
          .byte 0x80, 0x10, 0x00, 0x66     ;Point 1
          .byte 0x94, 0x18, 0xFF, 0xDF     ;Point 2
          .byte 0xD2, 0x10                 ;Point 3
.org 0x87B0
TL_AISDecel_FromBaro:
    ;mpgrp Unassigned\
    ;mptbladdr 0x87B0
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname AISDecel_FromBaro
    ;mptblcname BARODC
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_BARODC_AISDECEL_FROMBARO
          .byte 0x03                       ;Number of points in table
          .byte 0x9A, 0xDC, 0x00, 0x6F     ;Point 1
          .byte 0xC8, 0xF0, 0x00, 0x66     ;Point 2
          .byte 0xF0, 0x00                 ;Point 3
.org 0x87BB
TL_TL_87BB:
    ;mpgrp Unassigned\
    ;mptbladdr 0x87BB
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_87BB
    ;mptblcname TL_87BB
    ;mpxaxis Xinput 8 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_87BB
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 8
.org 0x87C3
TL_DecelAisBaseAirflowCurveOffset_FromTime:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x87C3
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname DecelAisBaseAirflowCurveOffset_FromTime
    ;mptblcname TIMEDC
    ;mpxaxis Time 0 720 sec
    ;mpyaxis y 0 255 units
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Number of points in table
          .byte 0x0B, 0x00, 0x00, 0x00     ;Point 1
          .byte 0x1B, 0x00                 ;Point 2
.org 0x87CA
TL_TL_87CA:
    ;mpgrp Unassigned\
    ;mptbladdr 0x87CA
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_87CA
    ;mptblcname TL_87CA
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_87CA
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x87CE
TL_AISDecel_FromTemp:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x87CE
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname AISDecel_FromTemp
    ;mptblcname TEMPDC
    ;mpxaxis Temp -200 260 degrees
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc Detailed_Description
          .byte 0x05                       ;Number of points in table
          .byte 0x68, 0x36, 0xFF, 0xAB     ;Point 1
          .byte 0x80, 0x2E, 0xFF, 0x8B     ;Point 2
          .byte 0xB0, 0x18, 0xFF, 0x8E     ;Point 3
          .byte 0xD4, 0x08, 0xFE, 0x00     ;Point 4
          .byte 0xD8, 0x00                 ;Point 5
.org 0x87E1
TL_AdditionToControlMap:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x87E1
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname AdditionToControlMap
    ;mptblcname MAPFLR
    ;mpxaxis RPM 0 8192 rpm
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc AIS_Decel_Addition_to_control_MAP_vs._RPM
          .byte 0x04                       ;Number of points in table
          .byte 0x19, 0x00, 0x00, 0x00     ;Point 1
          .byte 0x1F, 0x00, 0x00, 0x00     ;Point 2
          .byte 0x26, 0x00, 0x00, 0x00     ;Point 3
          .byte 0x70, 0x00                 ;Point 4
.org 0x87F0
TL_OffsetCorrectionTo_MAPFLR_FromBaro:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x87F0
    ;mptbltype 0
    ;mpsubtype 1
    ;mptbllname OffsetCorrectionTo_MAPFLR_FromBaro
    ;mptblcname BARFLR
    ;mpxaxis Baro -14.7 0 psi
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc AIS_Decel_Offset_correction_due_to_baro_effect
          .byte 0x03                       ;Number of points in table
          .byte 0x9A, 0x00, 0x00, 0x00     ;Point 1
          .byte 0xC8, 0x00, 0x00, 0x00     ;Point 2
          .byte 0xF0, 0x00                 ;Point 3
.org 0x87FB
TL_TempTermForMapOffset_FromTemp:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x87FB
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TempTermForMapOffset_FromTemp
    ;mptblcname MPTEMP
    ;mpxaxis Temp -200 260 degrees
    ;mpyaxis Factor 0 1 Factor
    ;mptbldesc AIS_Decel_Temperature_Term
          .byte 0x02                       ;Number of points in table
          .byte 0x90, 0xFF, 0x00, 0x00     ;Point 1
          .byte 0xC7, 0xFF                 ;Point 2
.org 0x8802
TL_TL_8802:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8802
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8802
    ;mptblcname TL_8802
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_MIS_8802
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x8806
TL_DecelAisOpenStepsFromNeg_FromDeltaMap:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8806
    ;mptbltype 2
    ;mpsubtype 1
    ;mptbllname DecelAisOpenStepsFromNeg_FromDeltaMap
    ;mptblcname DAISOP
    ;mpxaxis DeltaMAP 0 14.7 psi
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc Decel_AIS_open_steps_from_-Delta_MAP
          .byte 0x04                       ;Number of points in table
          .byte 0x0F, 0x00, 0x01, 0x00     ;Point 1
          .byte 0x11, 0x02, 0x00, 0x80     ;Point 2
          .byte 0x13, 0x03, 0x00, 0xAB     ;Point 3
          .byte 0x16, 0x05                 ;Point 4
.org 0x8815
TL_DecelAisOpenStepsFromPos_FromDeltaMap:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8815
    ;mptbltype 2
    ;mpsubtype 1
    ;mptbllname DecelAisOpenStepsFromPos_FromDeltaMap
    ;mptblcname DAISCL
    ;mpxaxis DeltaMAP 0 14.7 psi
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc Decel_AIS_open_steps_from_+Delta_MAP
          .byte 0x04                       ;Number of points in table
          .byte 0x05, 0x00, 0xFF, 0xCD     ;Point 1
          .byte 0x0A, 0xFF, 0xFF, 0xCD     ;Point 2
          .byte 0x0F, 0xFE, 0x00, 0x00     ;Point 3
          .byte 0x14, 0xFE                 ;Point 4
.org 0x8824
TL_TimeBetweenAisPulsesForDecelAis:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8824
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TimeBetweenAisPulsesForDecelAis
    ;mptblcname DCLRFQ
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Time 0 2.8 Sec
    ;mptbldesc Detailed_Description
          .byte 0x20                       ;Point 1
.org 0x8825
TL_EngineTempToStartCalibratingDacal:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8825
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname EngineTempToStartCalibratingDacal
    ;mptblcname DATHOT
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Coolant_Temp -200 260 Deg
    ;mptbldesc Detailed_Description
          .byte 0xD6                       ;Point 1
.org 0x8826
TL_DeltaRpmFromIdleSpeedForDacalUpdate:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8826
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DeltaRpmFromIdleSpeedForDacalUpdate
    ;mptblcname DADRPM
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis rpm 0 255 rpm
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Point 1
.org 0x8827
TL_ACFactorDeltaFromBase:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8827
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ACFactorDeltaFromBase
    ;mptblcname DAACF
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x10                       ;Point 1
.org 0x8828
TL_TL_8828:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8828
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8828
    ;mptblcname TL_8828
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8828
          .byte 0x3D                       ;Point 1
.org 0x8829
TL_Base_nominalCal:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x8829
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname Base_nominalCal
    ;mptblcname DANOM
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x00                       ;Point 1
.org 0x882A
TL_DacalInhibitTimeAfterStartup:
    ;mpgrp Idle\AIS_Decel\
    ;mptbladdr 0x882A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DacalInhibitTimeAfterStartup
    ;mptblcname DCALTM
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Time 0 720 sec
    ;mptbldesc Detailed_Description
          .byte 0x10                       ;Point 1
.org 0x882B
TL_DacalUpdateRate01_03_07_0f_1f_3f_7f_ff:
    ;mpgrp Unassigned\
    ;mptbladdr 0x882B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DacalUpdateRate01_03_07_0f_1f_3f_7f_ff
    ;mptblcname DCALRT
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_882B
          .byte 0x7F                       ;Point 1
.org 0x882C
TL_TL_882C:
    ;mpgrp Unassigned\
    ;mptbladdr 0x882C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_882C
    ;mptblcname TL_882C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_882C
          .byte 0x80                       ;Point 1
.org 0x882D
TL_TL_882D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x882D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_882D
    ;mptblcname TL_882D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_882D
          .byte 0x05                       ;Point 1
.org 0x882E
TL_TL_882E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x882E
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_882E
    ;mptblcname TL_882E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_882E
          .word 0x11F8                     ;Point 1
.org 0x8830
TL_TL_8830:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8830
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8830
    ;mptblcname TL_8830
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8830
          .byte 0x2D                       ;Point 1
.org 0x8831
TL_TL_8831:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8831
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8831
    ;mptblcname TL_8831
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8831
          .byte 0x90                       ;Point 1
.org 0x8832
TL_TL_8832:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8832
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8832
    ;mptblcname TL_8832
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8832
          .byte 0x88                       ;Point 1
.org 0x8833
TL_TL_8833:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8833
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8833
    ;mptblcname TL_8833
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8833
          .byte 0xFD                       ;Point 1
.org 0x8834
TL_TL_8834:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8834
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8834
    ;mptblcname TL_8834
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8834
          .word 0xFFA0                     ;Point 1
.org 0x8836
TL_TL_8836:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8836
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8836
    ;mptblcname TL_8836
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8836
          .word 0xFF00                     ;Point 1
.org 0x8838
TL_TL_8838:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8838
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8838
    ;mptblcname TL_8838
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis y 0 720 sec
    ;mptbldesc Desc_TL_8838
          .byte 0x02                       ;Point 1
.org 0x8839
TL_TL_8839:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8839
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8839
    ;mptblcname TL_8839
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8839
          .byte 0x00                       ;Point 1
.org 0x883A
TL_TL_883A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x883A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_883A
    ;mptblcname TL_883A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_883A
          .byte 0x07                       ;Point 1
.org 0x883B
TL_TL_883B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x883B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_883B
    ;mptblcname TL_883B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis map -14.7 0 psi
    ;mptbldesc Desc_TL_883B
          .byte 0x04                       ;Point 1
.org 0x883C
TL_TL_883C:
    ;mpgrp Unassigned\
    ;mptbladdr 0x883C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_883C
    ;mptblcname TL_883C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis map -14.7 0 psi
    ;mptbldesc Desc_TL_883C
          .byte 0xFF                       ;Point 1
.org 0x883D
TL_TL_883D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x883D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_883D
    ;mptblcname TL_883D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_883D
          .byte 0xFF                       ;Point 1
.org 0x883E
TL_ExhGasRecircConstFromBaro1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x883E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromBaro1
    ;mptblcname EGR25
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Baro -14.7 0 psi
    ;mptbldesc Desc_TL_883E
          .byte 0x1B                       ;Point 1
.org 0x883F
TL_TL_883F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x883F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_883F
    ;mptblcname TL_883F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_883F
          .byte 0x0A                       ;Point 1
.org 0x8840
TL_ExhGasRecircConstFromBaro2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8840
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromBaro2
    ;mptblcname EGR26
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Baro -14.7 0 psi
    ;mptbldesc Desc_TL_8840
          .byte 0x04                       ;Point 1
.org 0x8841
TL_TL_8841:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8841
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8841
    ;mptblcname TL_8841
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8841
          .byte 0x70                       ;Point 1
.org 0x8842
TL_TL_8842:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8842
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8842
    ;mptblcname TL_8842
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8842
          .byte 0x03                       ;Point 1
.org 0x8843
TL_TL_8843:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8843
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8843
    ;mptblcname TL_8843
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8843
          .byte 0x9B                       ;Point 1
.org 0x8844
TL_TL_8844:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8844
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8844
    ;mptblcname TL_8844
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8844
          .byte 0xA0                       ;Point 1
.org 0x8845
TL_FanControlSpeedHi:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8845
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname FanControlSpeedHi
    ;mptblcname FNSPHI
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_8845
          .byte 0xFF                       ;Point 1
.org 0x8846
TL_FanControlSpeedLo:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8846
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname FanControlSpeedLo
    ;mptblcname FNSPLO
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_8846
          .byte 0xFE                       ;Point 1
.org 0x8847
TL_FanTurnOnTempAbove45Mph:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8847
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname FanTurnOnTempAbove45Mph
    ;mptblcname FANTMP
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_IMM_8847
          .byte 0xE7                       ;Point 1
.org 0x8848
TL_FanTurnOnTempAbove45Mph2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8848
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname FanTurnOnTempAbove45Mph2
    ;mptblcname FANTMP2
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_IMM_8847
          .byte 0xE2                       ;Point 1
.org 0x8849
TL_FanTurnOnTempAbove45Mph3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8849
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname FanTurnOnTempAbove45Mph3
    ;mptblcname FANTMP3
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_IMM_8847
          .byte 0xE7                       ;Point 1
.org 0x884A
TL_FanTurnOnTempAbove45Mph4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x884A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname FanTurnOnTempAbove45Mph4
    ;mptblcname FANTMP4
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_IMM_8847
          .byte 0xE2                       ;Point 1
.org 0x884B
TL_TL_884B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x884B
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_884B
    ;mptblcname TL_884B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_884B
          .word 0x0B9B                     ;Point 1
.org 0x884D
TL_TL_884D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x884D
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_884D
    ;mptblcname TL_884D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_884D
          .word 0x00C0                     ;Point 1
.org 0x884F
TL_TL_884F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x884F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_884F
    ;mptblcname TL_884F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_884F
          .byte 0x15                       ;Point 1
.org 0x8850
TL_TL_8850:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8850
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8850
    ;mptblcname TL_8850
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Battery 0 16 volts
    ;mptbldesc Desc_TL_8850
          .byte 0xC0                       ;Point 1
.org 0x8851
TL_TL_8851:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8851
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8851
    ;mptblcname TL_8851
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8851
          .byte 0x92                       ;Point 1
.org 0x8852
TL_TL_8852:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8852
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8852
    ;mptblcname TL_8852
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8852
          .byte 0x00                       ;Point 1
.org 0x8853
TL_TL_8853:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8853
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8853
    ;mptblcname TL_8853
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8853
          .byte 0x20                       ;Point 1
.org 0x8854
TL_TL_8854:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8854
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8854
    ;mptblcname TL_8854
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_8854
          .byte 0x32                       ;Point 1
.org 0x8855
TL_TL_8855:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8855
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8855
    ;mptblcname TL_8855
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_8855
          .byte 0x00                       ;Point 1
.org 0x8856
TL_TL_8856:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8856
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8856
    ;mptblcname TL_8856
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8856
          .byte 0x06                       ;Point 1
.org 0x8857
TL_TL_8857:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8857
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8857
    ;mptblcname TL_8857
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8857
          .byte 0x40                       ;Point 1
.org 0x8858
TL_TL_8858:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8858
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_8858
    ;mptblcname TL_8858
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8858
          .byte 0x06                       ;Number of points in table
          .byte 0x1C, 0x24, 0x00, 0xE7     ;Point 1
          .byte 0x3B, 0x40, 0x05, 0xC0     ;Point 2
          .byte 0x3F, 0x57, 0x06, 0xAB     ;Point 3
          .byte 0x42, 0x6B, 0x00, 0x00     ;Point 4
          .byte 0x54, 0x6B, 0x00, 0x00     ;Point 5
          .byte 0x54, 0xA8                 ;Point 6
.org 0x886F
TL_TL_886F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x886F
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_886F
    ;mptblcname TL_886F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_886F
          .byte 0x04                       ;Number of points in table
          .byte 0x1F, 0x0F, 0x00, 0xF7     ;Point 1
          .byte 0x74, 0x61, 0x00, 0x00     ;Point 2
          .byte 0x8A, 0x61, 0x00, 0x00     ;Point 3
          .byte 0x8A, 0xA8                 ;Point 4
.org 0x887E
TL_TL_887e:
    ;mpgrp Unassigned\
    ;mptbladdr 0x887E
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_887e
    ;mptblcname TL_887E
    ;mpxaxis Xinput 8 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T887E
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 8
.org 0x8886
TL_TL_8886:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8886
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname TL_8886
    ;mptblcname TL_8886
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8886
          .byte 0x04                       ;Number of points in table
          .byte 0x1F, 0x0F, 0x00, 0xF7     ;Point 1
          .byte 0x74, 0x61, 0x00, 0x00     ;Point 2
          .byte 0x8A, 0x61, 0x00, 0x00     ;Point 3
          .byte 0x8A, 0xA8                 ;Point 4
.org 0x8895
TL_TL_8895:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8895
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8895
    ;mptblcname TL_8895
    ;mpxaxis Xinput 8 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8895
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 8
.org 0x889D
TL_PTUMinLockTemperature:
    ;mpgrp Aux_Functions\PTU_Control\Entry_Conditions\
    ;mptbladdr 0x889D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PTUMinLockTemperature
    ;mptblcname PTUMTP
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Min_temp_for_PTU_lock
          .byte 0xB8                       ;Point 1
.org 0x889E
TL_PTUCounterTimerIntervalForLoop:
    ;mpgrp Aux_Functions\PTU_Control\Entry_Conditions\
    ;mptbladdr 0x889E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PTUCounterTimerIntervalForLoop
    ;mptblcname PTUCNI
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_889E
          .byte 0x07                       ;Point 1
.org 0x889F
TL_PTUMinLockSpeed:
    ;mpgrp Aux_Functions\PTU_Control\Entry_Conditions\
    ;mptbladdr 0x889F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PTUMinLockSpeed
    ;mptblcname PTUMSP
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Min_Speed_for_PTU_lock
          .byte 0x7C                       ;Point 1
.org 0x88A0
TL_PTUMAPThresholdForLock3:
    ;mpgrp Aux_Functions\PTU_Control\Entry_Conditions\
    ;mptbladdr 0x88A0
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PTUMAPThresholdForLock3
    ;mptblcname PTUMP3
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Delta_MAP 0 14.7 PSI
    ;mptbldesc Delta_MAP_for_PTU_unlock
          .byte 0x14                       ;Point 1
.org 0x88A1
TL_PTUDeltaTPSForUnlock:
    ;mpgrp Aux_Functions\PTU_Control\Hysteresis\
    ;mptbladdr 0x88A1
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PTUDeltaTPSForUnlock
    ;mptblcname PTUDTP_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Delta_TPS 0 5 Volts
    ;mptbldesc Min_TPS_for_PTU_unlock
          .byte 0x66                       ;Point 1
.org 0x88A2
TL_PTUMAPThresholdForLock1:
    ;mpgrp Aux_Functions\PTU_Control\Entry_Conditions\
    ;mptbladdr 0x88A2
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname PTUMAPThresholdForLock1
    ;mptblcname PTUMP1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Delta_MAP 0 14.7 PSI
    ;mptbldesc Delta_MAP_for_PTU_unlock
          .word 0x8118                     ;Point 1
.org 0x88A4
TL_PTUCounterHiSpeed:
    ;mpgrp Aux_Functions\PTU_Control\Hysteresis\
    ;mptbladdr 0x88A4
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PTUCounterHiSpeed
    ;mptblcname PTUCNH
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88A4
          .byte 0x20                       ;Point 1
.org 0x88A5
TL_PTUCounterLoSpeed:
    ;mpgrp Aux_Functions\PTU_Control\Hysteresis\
    ;mptbladdr 0x88A5
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PTUCounterLoSpeed
    ;mptblcname PTUCNL
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88A5
          .byte 0x11                       ;Point 1
.org 0x88A6
TL_TL_88A6:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88A6
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88A6
    ;mptblcname TL_88A6
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88A6
          .byte 0x00                       ;Point 1
.org 0x88A7
TL_UpperLimitForPTULock:
    ;mpgrp Aux_Functions\PTU_Control\TPS_Limits_for_Lockup\
    ;mptbladdr 0x88A7
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UpperLimitForPTULock
    ;mptblcname PTULUL
    ;mpxaxis Speed 0 128 Speed
    ;mpyaxis Delta_TPS 0 5 Volts
    ;mptbldesc Secondary_engagnement_point_for_PTU
          .byte 0x04                       ;Number of points in table
          .byte 0x64, 0x0F, 0x00, 0x00     ;Point 1
          .byte 0x64, 0x2E, 0x00, 0xAB     ;Point 2
          .byte 0x82, 0x42, 0x00, 0x00     ;Point 3
          .byte 0x82, 0xA8                 ;Point 4
.org 0x88B6
TL_LowerLimitForPTULock:
    ;mpgrp Aux_Functions\PTU_Control\TPS_Limits_for_Lockup\
    ;mptbladdr 0x88B6
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname LowerLimitForPTULock
    ;mptblcname PTULLL
    ;mpxaxis Speed 0 128 Speed
    ;mpyaxis Delta_TPS 0 5 Volts
    ;mptbldesc Secondary_disengagnement_point_for_PTU
          .byte 0x02                       ;Number of points in table
          .byte 0x64, 0x0F, 0x00, 0x00     ;Point 1
          .byte 0x96, 0x0F                 ;Point 2
.org 0x88BD
TL_TL_88bd:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88BD
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_88bd
    ;mptblcname TL_88BD
    ;mpxaxis Xinput 8 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T88D4
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 8
.org 0x88C5
TL_UpperLimitForPTUUnlock:
    ;mpgrp Aux_Functions\PTU_Control\TPS_Limits_for_Lockup\
    ;mptbladdr 0x88C5
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UpperLimitForPTUUnlock
    ;mptblcname PTUUUL
    ;mpxaxis Speed 0 128 Speed
    ;mpyaxis Delta_TPS 0 5 Volts
    ;mptbldesc Primary_engagement_point_for_PTU
          .byte 0x04                       ;Number of points in table
          .byte 0x5E, 0x05, 0x00, 0x00     ;Point 1
          .byte 0x5E, 0x33, 0x00, 0xAB     ;Point 2
          .byte 0x7C, 0x47, 0x00, 0x00     ;Point 3
          .byte 0x7C, 0xA8                 ;Point 4
.org 0x88D4
TL_LowerLimitForPTUUnlock:
    ;mpgrp Aux_Functions\PTU_Control\TPS_Limits_for_Lockup\
    ;mptbladdr 0x88D4
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname LowerLimitForPTUUnlock
    ;mptblcname PTUULL
    ;mpxaxis Speed 0 128 Speed
    ;mpyaxis Delta_TPS 0 5 Volts
    ;mptbldesc Primary_disengagnement_point_for_PTU
          .byte 0x02                       ;Number of points in table
          .byte 0x5E, 0x05, 0x00, 0x00     ;Point 1
          .byte 0x96, 0x05                 ;Point 2
.org 0x88DB
TL_TL_88db:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88DB
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_88db
    ;mptblcname TL_88DB
    ;mpxaxis Xinput 8 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T88D4
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 8
.org 0x88E3
TL_TL_88E3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88E3
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88E3
    ;mptblcname TL_88E3
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_88E3
          .byte 0x50                       ;Point 1
.org 0x88E4
TL_TL_88E4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88E4
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88E4
    ;mptblcname TL_88E4
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88E4
          .byte 0x20                       ;Point 1
.org 0x88E5
TL_TL_88E5:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88E5
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88E5
    ;mptblcname TL_88E5
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88E5
          .byte 0x1A                       ;Point 1
.org 0x88E6
TL_TL_88E6:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88E6
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88E6
    ;mptblcname TL_88E6
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88E6
          .byte 0x10                       ;Point 1
.org 0x88E7
TL_TL_88E7:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88E7
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88E7
    ;mptblcname TL_88E7
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88E7
          .byte 0x0A                       ;Point 1
.org 0x88E8
TL_TL_88E8:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88E8
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88E8
    ;mptblcname TL_88E8
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88E8
          .byte 0x05                       ;Point 1
.org 0x88E9
TL_TL_88E9:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88E9
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88E9
    ;mptblcname TL_88E9
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88E9
          .byte 0x10                       ;Point 1
.org 0x88EA
TL_TL_88EA:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88EA
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88EA
    ;mptblcname TL_88EA
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88EA
          .byte 0x0F                       ;Point 1
.org 0x88EB
TL_TL_88EB:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88EB
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88EB
    ;mptblcname TL_88EB
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_88EB
          .byte 0x49                       ;Point 1
.org 0x88EC
TL_TL_88EC:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88EC
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88EC
    ;mptblcname TL_88EC
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88EC
          .byte 0x07                       ;Point 1
.org 0x88ED
TL_TL_88ED:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88ED
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_88ED
    ;mptblcname TL_88ED
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_88ED
          .byte 0xFF, 0xFF, 0x41, 0x41, 0x41, 0x35, 0x38, 0x3B, 0x3B ;Fixed X 9 byte table
.org 0x88F6
TL_TL_88F6:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88F6
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88F6
    ;mptblcname TL_88F6
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88F6
          .byte 0x08                       ;Point 1
.org 0x88F7
TL_TL_88F7:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88F7
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88F7
    ;mptblcname TL_88F7
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88F7
          .byte 0x14                       ;Point 1
.org 0x88F8
TL_TL_88F8:
    ;mpgrp Unassigned\
    ;mptbladdr 0x88F8
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_88F8
    ;mptblcname TL_88F8
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_88F8
          .byte 0x71                       ;Point 1
.org 0x88F9
TL_CruiseControlLimitToAMaxVent:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x88F9
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlLimitToAMaxVent
    ;mptblcname VNTAB1
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xFE                       ;Point 1
.org 0x88FA
TL_CruiseControlLimitToHalfMaxVent:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x88FA
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlLimitToHalfMaxVent
    ;mptblcname VNTAB2
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xF0                       ;Point 1
.org 0x88FB
TL_UnknownConstForCruiseControl46:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x88FB
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl46
    ;mptblcname CRUZ46
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Point 1
.org 0x88FC
TL_UnknownConstForCruiseControl47:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x88FC
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl47
    ;mptblcname CRUZ47
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x52                       ;Point 1
.org 0x88FD
TL_CruiseControlDeltaSpeedToResetAccFlag:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x88FD
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlDeltaSpeedToResetAccFlag
    ;mptblcname ACLRST
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis DeltaSpeed 0 127 mph
    ;mptbldesc Detailed_Description
          .byte 0x3A                       ;Point 1
.org 0x88FE
TL_CruiseControlDontVentIfThrottleBelowThis:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x88FE
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlDontVentIfThrottleBelowThis
    ;mptblcname CLOTHR
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Point 1
.org 0x88FF
TL_CruiseControlDontVacIfThrottleAboveThis:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x88FF
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlDontVacIfThrottleAboveThis
    ;mptblcname MAXTHR
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0xA0                       ;Point 1
.org 0x8900
TL_CruiseControlMaxSetSpeedTimesTwo:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8900
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlMaxSetSpeedTimesTwo
    ;mptblcname MAXSET
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0xAA                       ;Point 1
.org 0x8901
TL_CruiseControlMinSetSpeedTimesTwo:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8901
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlMinSetSpeedTimesTwo
    ;mptblcname MINSET
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x46                       ;Point 1
.org 0x8902
TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableHi:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8902
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlForBrakeFlagManualTransmissionClutchDisableHi
    ;mptblcname SCNVHI
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x40                       ;Point 1
.org 0x8903
TL_CruiseControlForBrakeFlagManualTransmissionClutchDisableLo:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8903
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlForBrakeFlagManualTransmissionClutchDisableLo
    ;mptblcname SCNVLO
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x00                       ;Point 1
.org 0x8904
TL_UnknownConstForCruiseControl21:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8904
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl21
    ;mptblcname CRUZ21
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x3C                       ;Point 1
.org 0x8905
TL_UnknownConstForCruiseControl22:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8905
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl22
    ;mptblcname CRUZ22
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Detailed_Description
          .byte 0x9A                       ;Point 1
.org 0x8906
TL_UnknownConstForCruiseControl23:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8906
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl23
    ;mptblcname CRUZ23
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x05                       ;Point 1
.org 0x8907
TL_TL_8907:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8907
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8907
    ;mptblcname TL_8907
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8907
          .word 0x002D                     ;Point 1
.org 0x8909
TL_UnknownConstForCruiseControl24:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8909
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl24
    ;mptblcname CRUZ24
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x00                       ;Point 1
.org 0x890A
TL_UnknownConstForCruiseControl25:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x890A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl25
    ;mptblcname CRUZ25
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x00                       ;Point 1
.org 0x890B
TL_UnknownConstForCruiseControl26:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x890B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl26
    ;mptblcname CRUZ26
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Point 1
.org 0x890C
TL_UnknownConstForCruiseControl27:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x890C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl27
    ;mptblcname CRUZ27
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x01                       ;Point 1
.org 0x890D
TL_UnknownConstForCruiseControl28:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x890D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl28
    ;mptblcname CRUZ28
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x01                       ;Point 1
.org 0x890E
TL_UnknownConstForCruiseControl29:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x890E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl29
    ;mptblcname CRUZ29
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x03                       ;Point 1
.org 0x890F
TL_UnknownConstForCruiseControl30:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x890F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl30
    ;mptblcname CRUZ30
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x03                       ;Point 1
.org 0x8910
TL_UnknownConstForCruiseControl31:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8910
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl31
    ;mptblcname CRUZ31
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x40                       ;Point 1
.org 0x8911
TL_UnknownConstForCruiseControl32:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8911
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl32
    ;mptblcname CRUZ32
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x20                       ;Point 1
.org 0x8912
TL_UnknownConstForCruiseControl33:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8912
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl33
    ;mptblcname CRUZ33
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Point 1
.org 0x8913
TL_UnknownConstForCruiseControl34:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8913
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl34
    ;mptblcname CRUZ34
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x18                       ;Point 1
.org 0x8914
TL_UnknownConstForCruiseControl35:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8914
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl35
    ;mptblcname CRUZ35
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x06                       ;Point 1
.org 0x8915
TL_UnknownConstForCruiseControl36:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8915
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname UnknownConstForCruiseControl36
    ;mptblcname CRUZ36
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x74                       ;Point 1
.org 0x8916
TL_CruiseControlSetDeltaControlPointForCableAdaptive:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8916
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseControlSetDeltaControlPointForCableAdaptive
    ;mptblcname SETDLT
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x00                       ;Point 1
.org 0x8917
TL_CruiseCompareConstant2:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8917
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseCompareConstant2
    ;mptblcname CRSCN2
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Point 1
.org 0x8918
TL_CruiseMask2:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8918
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseMask2
    ;mptblcname CRMSK2
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x10                       ;Point 1
.org 0x8919
TL_CruiseMask3:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8919
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseMask3
    ;mptblcname CRMSK3
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xF0                       ;Point 1
.org 0x891A
TL_CruiseMask7:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x891A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseMask7
    ;mptblcname CRMSK7
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Point 1
.org 0x891B
TL_CruiseMask4:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x891B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseMask4
    ;mptblcname CRMSK4
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Point 1
.org 0x891C
TL_CruiseMask6:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x891C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseMask6
    ;mptblcname CRMSK6
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x28                       ;Point 1
.org 0x891D
TL_CruiseMask5:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x891D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseMask5
    ;mptblcname CRMSK5
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xD8                       ;Point 1
.org 0x891E
TL_CruiseCompareConstant1:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x891E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseCompareConstant1
    ;mptblcname CRSCN1
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x0B                       ;Point 1
.org 0x891F
TL_CruiseMask:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x891F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CruiseMask
    ;mptblcname CRMASK
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x08                       ;Point 1
.org 0x8920
TL_CruiseControlVentRegularGainCurve_FromDeltaSpeed:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8920
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname CruiseControlVentRegularGainCurve_FromDeltaSpeed
    ;mptblcname VENTRG
    ;mpxaxis Delta_Speed 0 127 mph
    ;mpyaxis AccRate 0 5 mph/sec
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Number of points in table
          .byte 0x00, 0x00, 0xFF, 0xF4     ;Point 1
          .byte 0x40, 0xFD, 0xFF, 0xD4     ;Point 2
          .byte 0x80, 0xF2, 0xFF, 0xF0     ;Point 3
          .byte 0xC0, 0xEE                 ;Point 4
.org 0x892F
TL_CruiseControlVacRegularGainCurve_FromDeltaSpeed:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x892F
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname CruiseControlVacRegularGainCurve_FromDeltaSpeed
    ;mptblcname VACREG
    ;mpxaxis Delta_Speed 0 127 mph
    ;mpyaxis AccRate 0 5 mph/sec
    ;mptbldesc Detailed_Description
          .byte 0x05                       ;Number of points in table
          .byte 0x00, 0x00, 0x00, 0x30     ;Point 1
          .byte 0x10, 0x03, 0x00, 0x1B     ;Point 2
          .byte 0x40, 0x08, 0x00, 0x18     ;Point 3
          .byte 0x80, 0x0E, 0x00, 0x0C     ;Point 4
          .byte 0xFF, 0x14                 ;Point 5
.org 0x8942
TL_TL_8942:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8942
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8942
    ;mptblcname TL_8942
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8942
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x8946
TL_CruiseControlVacAcceleratedGainCurve_FromDeltaSpeed:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8946
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname CruiseControlVacAcceleratedGainCurve_FromDeltaSpeed
    ;mptblcname VACACC
    ;mpxaxis Delta_Speed 0 127 mph
    ;mpyaxis AccRate 0 5 mph/sec
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Number of points in table
          .byte 0x00, 0x00, 0x01, 0x00     ;Point 1
          .byte 0x10, 0x10, 0x00, 0xF0     ;Point 2
          .byte 0x20, 0x1F, 0x00, 0x88     ;Point 3
          .byte 0x40, 0x30                 ;Point 4
.org 0x8955
TL_CruiseControlSetupPulseForSet_FromSpeed:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8955
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname CruiseControlSetupPulseForSet_FromSpeed
    ;mptblcname SETPW
    ;mpxaxis Speed 0 127 mph
    ;mpyaxis Vacuum 0 2.8 Pulsewidth
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Number of points in table
          .byte 0x46, 0x1F, 0x00, 0x1A     ;Point 1
          .byte 0x64, 0x22, 0x00, 0x33     ;Point 2
          .byte 0x78, 0x26, 0x00, 0x1A     ;Point 3
          .byte 0x8C, 0x28                 ;Point 4
.org 0x8964
TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x8964
    ;mptbltype 0
    ;mpsubtype 1
    ;mptbllname CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference
    ;mptblcname RESTBL
    ;mpxaxis Speed 0 127 mph
    ;mpyaxis Vacuum 0 2.8 Pulsewidth
    ;mptbldesc Detailed_Description
          .byte 0x06                       ;Number of points in table
          .byte 0x30, 0x9B, 0xFF, 0xA8     ;Point 1
          .byte 0x50, 0x90, 0xFF, 0x70     ;Point 2
          .byte 0x60, 0x87, 0xFF, 0xC8     ;Point 3
          .byte 0x80, 0x80, 0x00, 0x00     ;Point 4
          .byte 0x90, 0x80, 0xFF, 0x30     ;Point 5
          .byte 0xB0, 0x66                 ;Point 6
.org 0x897B
TL_CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x897B
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname CruiseControlAdditionalSetupPulseForResume_FromSpeedDifference2
    ;mptblcname RESTBL2
    ;mpxaxis Speed 0 127 mph
    ;mpyaxis Vacuum 0 2.8 Pulsewidth
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Number of points in table
          .byte 0x80, 0x80, 0x00, 0x33     ;Point 1
          .byte 0x8A, 0x82, 0x00, 0x1A     ;Point 2
          .byte 0xA8, 0x85, 0x00, 0x1A     ;Point 3
          .byte 0xC6, 0x88                 ;Point 4
.org 0x898A
TL_TL_898a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x898A
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_898a
    ;mptblcname TL_898A
    ;mpxaxis Xinput 16 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T898A
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 16
.org 0x899A
TL_CruiseControlSpeedGainFactor_FromSpeed:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x899A
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname CruiseControlSpeedGainFactor_FromSpeed
    ;mptblcname SPGAIN
    ;mpxaxis Speed 0 127 mph
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Number of points in table
          .byte 0x3C, 0x16, 0xFF, 0x73     ;Point 1
          .byte 0x50, 0x0B, 0xFF, 0xA6     ;Point 2
          .byte 0x64, 0x04, 0xFF, 0xE6     ;Point 3
          .byte 0x82, 0x01                 ;Point 4
.org 0x89A9
TL_CruiseControlThrottleGainFactor_FromThrottle:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x89A9
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname CruiseControlThrottleGainFactor_FromThrottle
    ;mptblcname THGAIN
    ;mpxaxis TPS 0 255 tps
    ;mpyaxis out_desc 0 255 scale
    ;mptbldesc Detailed_Description
          .byte 0x03                       ;Number of points in table
          .byte 0x00, 0x10, 0x00, 0x5D     ;Point 1
          .byte 0x16, 0x18, 0xFF, 0xA3     ;Point 2
          .byte 0x2C, 0x10                 ;Point 3
.org 0x89B4
TL_TL_89b4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x89B4
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_89b4
    ;mptblcname TL_89B4
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T89B4
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x89B8
TL_UnknownTableForCruiseControl6:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x89B8
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UnknownTableForCruiseControl6
    ;mptblcname CRUZ6
    ;mpxaxis in 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Number of points in table
          .byte 0x02, 0x14, 0x07, 0x00     ;Point 1
          .byte 0x04, 0x22                 ;Point 2
.org 0x89BF
TL_TL_89bf:
    ;mpgrp Unassigned\
    ;mptbladdr 0x89BF
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_89bf
    ;mptblcname TL_89BF
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T89BF
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x89C3
TL_UnknownTableForCruiseControl1:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x89C3
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UnknownTableForCruiseControl1
    ;mptblcname CRUZ1
    ;mpxaxis in 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Number of points in table
          .byte 0x20, 0xE0, 0xFF, 0x00     ;Point 1
          .byte 0x30, 0xD0                 ;Point 2
.org 0x89CA
TL_TL_89ca:
    ;mpgrp Unassigned\
    ;mptbladdr 0x89CA
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_89ca
    ;mptblcname TL_89CA
    ;mpxaxis Xinput 8 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T89CA
          .byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 8
.org 0x89D2
TL_UnknownTableForCruiseControl2:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x89D2
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UnknownTableForCruiseControl2
    ;mptblcname CRUZ2
    ;mpxaxis in 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Number of points in table
          .byte 0x90, 0x00, 0x00, 0x60     ;Point 1
          .byte 0x98, 0x03                 ;Point 2
.org 0x89D9
TL_TL_89d9:
    ;mpgrp Unassigned\
    ;mptbladdr 0x89D9
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_89d9
    ;mptblcname TL_89D9
    ;mpxaxis Xinput 4 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T89D9
          .byte 0xFF, 0xFF, 0xFF, 0xFF ; 1 - 4
.org 0x89DD
TL_UnknownTableForCruiseControl3:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x89DD
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UnknownTableForCruiseControl3
    ;mptblcname CRUZ3
    ;mpxaxis in 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x03                       ;Number of points in table
          .byte 0x90, 0xFF, 0xFA, 0xB5     ;Point 1
          .byte 0xA8, 0x80, 0xFC, 0xCD     ;Point 2
          .byte 0xD0, 0x00                 ;Point 3
.org 0x89E8
TL_UnknownTableForCruiseControl4:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x89E8
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UnknownTableForCruiseControl4
    ;mptblcname CRUZ4
    ;mpxaxis in 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x03                       ;Number of points in table
          .byte 0x60, 0x00, 0x00, 0x00     ;Point 1
          .byte 0x78, 0x00, 0x00, 0x00     ;Point 2
          .byte 0x80, 0x00                 ;Point 3
.org 0x89F3
TL_UnknownTableForCruiseControl5:
    ;mpgrp Utility\Cruise_Control\
    ;mptbladdr 0x89F3
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname UnknownTableForCruiseControl5
    ;mptblcname CRUZ5
    ;mpxaxis in 0 255 in
    ;mpyaxis Speed 0 127.5 MPH
    ;mptbldesc Detailed_Description
          .byte 0x03                       ;Number of points in table
          .byte 0x80, 0x00, 0x00, 0x00     ;Point 1
          .byte 0x94, 0x00, 0x00, 0x00     ;Point 2
          .byte 0xA8, 0x00                 ;Point 3
.org 0x89FE
TL_TL_89FE:
    ;mpgrp Unassigned\
    ;mptbladdr 0x89FE
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_89FE
    ;mptblcname TL_89FE
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_89FE
          .byte 0x04                       ;Point 1
.org 0x89FF
TL_TL_89FF:
    ;mpgrp Unassigned\
    ;mptbladdr 0x89FF
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_89FF
    ;mptblcname TL_89FF
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_89FF
          .word 0x1C0C                     ;Point 1
.org 0x8A01
TL_TL_8A01:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A01
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8A01
    ;mptblcname TL_8A01
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A01
          .word 0x000C                     ;Point 1
.org 0x8A03
TL_TL_8A03:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A03
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8A03
    ;mptblcname TL_8A03
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A03
          .word 0x2000                     ;Point 1
.org 0x8A05
TL_TL_8A05:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A05
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A05
    ;mptblcname TL_8A05
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A05
          .byte 0x04                       ;Point 1
.org 0x8A06
TL_TL_8A06:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A06
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A06
    ;mptblcname TL_8A06
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis tps 0 5 volts
    ;mptbldesc Desc_TL_8A06
          .byte 0x03                       ;Point 1
.org 0x8A07
TL_TL_8A07:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A07
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A07
    ;mptblcname TL_8A07
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A07
          .byte 0x80                       ;Point 1
.org 0x8A08
TL_TL_8A08:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A08
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A08
    ;mptblcname TL_8A08
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A08
          .byte 0x1E                       ;Point 1
.org 0x8A09
TL_TL_8A09:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A09
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A09
    ;mptblcname TL_8A09
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A09
          .byte 0x38                       ;Point 1
.org 0x8A0A
TL_TL_8A0A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A0A
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8A0A
    ;mptblcname TL_8A0A
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8A0A
          .byte 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00 ;Fixed X 9 byte table
.org 0x8A13
TL_TL_8A13:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A13
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A13
    ;mptblcname TL_8A13
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A13
          .byte 0x10                       ;Point 1
.org 0x8A14
TL_TL_8A14:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A14
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A14
    ;mptblcname TL_8A14
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A14
          .byte 0x40                       ;Point 1
.org 0x8A15
TL_TL_8A15:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A15
    ;mptbltype 20
    ;mpsubtype n
    ;mptbllname TL_8A15
    ;mptblcname TL_8A15
    ;mpxaxis Xinput 9 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_IMM_8A15
          .byte 0x00, 0x00, 0x00, 0x0C, 0x08, 0x00, 0x00, 0x00, 0x00 ;Fixed X 9 byte table
.org 0x8A1E
TL_ErrorBitsMask1:
    ;mpgrp Setup\Cal_Configuration\
    ;mptbladdr 0x8A1E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ErrorBitsMask1
    ;mptblcname FLTMSK1
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Used_to_disable_error_code_storage.
          .byte 0x20                       ;Point 1
.org 0x8A1F
TL_TL_8a1f:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A1F
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8a1f
    ;mptblcname TL_8A1F
    ;mpxaxis Xinput 5 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8A1F
          .byte 0x26, 0x3E, 0x00, 0x00, 0x00 ; 1 - 5
.org 0x8A24
TL_TL_8A24:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A24
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A24
    ;mptblcname TL_8A24
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A24
          .byte 0x04                       ;Point 1
.org 0x8A25
TL_TL_8A25:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A25
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A25
    ;mptblcname TL_8A25
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A25
          .byte 0x11                       ;Point 1
.org 0x8A26
TL_PowerLossLightMask:
    ;mpgrp Setup\Cal_Configuration\
    ;mptbladdr 0x8A26
    ;mptbltype 5
    ;mpsubtype n
    ;mptbllname PowerLossLightMask
    ;mptblcname IPLMSK
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Illuminate_PowerLoss_Light_Mask1._These_errors_alert_the_driver.
    ;mpchoices ChargeTemp_Sensor  CoolantTemp_Sensor  Charging  bit3  BatVolts  Map_Signal  Tps_Signal  Map_Pneumatic
          .byte 0xEB                       ;Point 1
.org 0x8A27
TL_PowerLossLightMask2:
    ;mpgrp Setup\Cal_Configuration\
    ;mptbladdr 0x8A27
    ;mptbltype 5
    ;mpsubtype n
    ;mptbllname PowerLossLightMask2
    ;mptblcname IPLMSK2
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Illuminate_PowerLoss_Light_Mask2._These_errors_alert_the_driver.
    ;mpchoices bit0  bit1  bit2  Wastegate  InjectorFault  bit5  MajorFault  bit7
          .byte 0x00                       ;Point 1
.org 0x8A28
TL_PowerLossLightMask3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A28
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname PowerLossLightMask3
    ;mptblcname IPLMSK3
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A28
          .byte 0x78                       ;Point 1
.org 0x8A29
TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A29
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TstatDiagnosticsMinTempToArmDiagnosticsAtStartup
    ;mptblcname TTEMPL
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8A29
          .byte 0x63                       ;Point 1
.org 0x8A2A
TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A2A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup
    ;mptblcname TTEMPHA
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8A2A
          .byte 0xE4                       ;Point 1
.org 0x8A2B
TL_TstatDiagnosticsTemperatureGoalWithin_HOTIME:
    ;mpgrp Utility\On-Board_Diagnostics\T-Stat_Diagnostics\
    ;mptbladdr 0x8A2B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TstatDiagnosticsTemperatureGoalWithin_HOTIME
    ;mptblcname TDAGTP
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Detailed_Description
          .byte 0xCF                       ;Point 1
.org 0x8A2C
TL_TstatVehicleSpeedCompare:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A2C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TstatVehicleSpeedCompare
    ;mptblcname TL_8A2C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_8A2C
          .byte 0x32                       ;Point 1
.org 0x8A2D
TL_TstatDiagnosticsTimeToAchieveTemperatureGoal:
    ;mpgrp Utility\On-Board_Diagnostics\T-Stat_Diagnostics\
    ;mptbladdr 0x8A2D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TstatDiagnosticsTimeToAchieveTemperatureGoal
    ;mptblcname HOTIME
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0xAA                       ;Point 1
.org 0x8A2E
TL_TL_8A2E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A2E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A2E
    ;mptblcname TL_8A2E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A2E
          .byte 0x04                       ;Point 1
.org 0x8A2F
TL_TL_8A2F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A2F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A2F
    ;mptblcname TL_8A2F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8A2F
          .byte 0xBD                       ;Point 1
.org 0x8A30
TL_TL_8A30:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A30
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A30
    ;mptblcname TL_8A30
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8A30
          .byte 0x79                       ;Point 1
.org 0x8A31
TL_CoolantTempOutOfRangeLow:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A31
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CoolantTempOutOfRangeLow
    ;mptblcname CTSLOW
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_CTSHIG_COOLANTTEMPOUTOFRANGEHIGH
          .byte 0x1A                       ;Point 1
.org 0x8A32
TL_CoolantTempOutOfRangeHigh:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A32
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CoolantTempOutOfRangeHigh
    ;mptblcname CTSHIG
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_CTSLOW_COOLANTTEMPOUTOFRANGELOW
          .byte 0xFD                       ;Point 1
.org 0x8A33
TL_DefaultCoolantTempRaw:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A33
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DefaultCoolantTempRaw
    ;mptblcname DEFCTS
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_DEFCTS_DEFAULTCOOLANTTEMPRAW
          .byte 0xA8                       ;Point 1
.org 0x8A34
TL_ChargeTempOutOfRangeLow:
    ;mpgrp Utility\On-Board_Diagnostics\Charge_TempSensor\
    ;mptbladdr 0x8A34
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ChargeTempOutOfRangeLow
    ;mptblcname CHGLOW
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Charge_Temp -200 260 deg
    ;mptbldesc Detailed_Description
          .byte 0x1A                       ;Point 1
.org 0x8A35
TL_ChargeTempOutOfRangeHigh:
    ;mpgrp Utility\On-Board_Diagnostics\Charge_TempSensor\
    ;mptbladdr 0x8A35
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ChargeTempOutOfRangeHigh
    ;mptblcname CHGHIG
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Charge_Temp -200 260 deg
    ;mptbldesc Detailed_Description
          .byte 0xFD                       ;Point 1
.org 0x8A36
TL_DefaultChargeTemp_Limpin:
    ;mpgrp Utility\On-Board_Diagnostics\Charge_TempSensor\
    ;mptbladdr 0x8A36
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DefaultChargeTemp_Limpin
    ;mptblcname DEFCHG
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Charge_Temp -200 260 deg
    ;mptbldesc Detailed_Description
          .byte 0xA8                       ;Point 1
.org 0x8A37
TL_BatteryVoltsDiagLimitOverTarget:
    ;mpgrp Utility\On-Board_Diagnostics\Alternator_Diagnostics\
    ;mptbladdr 0x8A37
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BatteryVoltsDiagLimitOverTarget
    ;mptblcname BTVLMT
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0x10                       ;Point 1
.org 0x8A38
TL_LowBatteryVoltageAtThisRpm:
    ;mpgrp Utility\On-Board_Diagnostics\Battery_Volts\
    ;mptbladdr 0x8A38
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname LowBatteryVoltageAtThisRpm
    ;mptblcname BTLRPM
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis rpm 0 8192 RPM
    ;mptbldesc Detailed_Description
          .byte 0x2E                       ;Point 1
.org 0x8A39
TL_TL_8a39:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A39
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8a39
    ;mptblcname TL_8A39
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8A39
          .byte 0xE0                       ;Point 1
.org 0x8A3A
TL_BatteryVoltsDiagCounterMax:
    ;mpgrp Utility\On-Board_Diagnostics\Alternator_Diagnostics\
    ;mptbladdr 0x8A3A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BatteryVoltsDiagCounterMax
    ;mptblcname BTVCNT
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Y 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x8E                       ;Point 1
.org 0x8A3B
TL_BatteryVoltsDiagCounterMax2:
    ;mpgrp Utility\On-Board_Diagnostics\Alternator_Diagnostics\
    ;mptbladdr 0x8A3B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BatteryVoltsDiagCounterMax2
    ;mptblcname BTVCN2
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Y 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x7F                       ;Point 1
.org 0x8A3C
TL_BatteryVoltsHysteresisForAlternatorControl:
    ;mpgrp Utility\On-Board_Diagnostics\Alternator_Diagnostics\
    ;mptbladdr 0x8A3C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BatteryVoltsHysteresisForAlternatorControl
    ;mptblcname BTVHYS
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Y 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x04                       ;Point 1
.org 0x8A3D
TL_BatteryVoltsDiagCounterMin:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A3D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname BatteryVoltsDiagCounterMin
    ;mptblcname TL_8A3D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A3D
          .byte 0x06                       ;Point 1
.org 0x8A3E
TL_TL_8A3e:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A3E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A3e
    ;mptblcname TL_8A3E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A3E
          .byte 0x2E                       ;Point 1
.org 0x8A3F
TL_HighLimitForImmediateSwitchToClosedLoop:
    ;mpgrp Fuel\O2_Feedback_Control\O2_Controller\
    ;mptbladdr 0x8A3F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname HighLimitForImmediateSwitchToClosedLoop
    ;mptblcname O2HIGH
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 5 volts
    ;mptbldesc HighLimitForImmediateSwitchToClosedLoop_$26_=_0.73v
          .byte 0x22                       ;Point 1
.org 0x8A40
TL_LowLimitForImmediateSwitchToClosedLoop:
    ;mpgrp Fuel\O2_Feedback_Control\O2_Controller\
    ;mptbladdr 0x8A40
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname LowLimitForImmediateSwitchToClosedLoop
    ;mptblcname O2LOW
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 5 volts
    ;mptbldesc LowLimitForImmediateSwitchToClosedLoop
          .byte 0x14                       ;Point 1
.org 0x8A41
TL_TL_8a41:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A41
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8a41
    ;mptblcname TL_8A41
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8A41
          .byte 0x0A                       ;Point 1
.org 0x8A42
TL_RPMLimitforErrorCodeSetting:
    ;mpgrp Utility\On-Board_Diagnostics\Error_Code\
    ;mptbladdr 0x8A42
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname RPMLimitforErrorCodeSetting
    ;mptblcname ERRRPM
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Detailed_Description
          .byte 0x38                       ;Point 1
.org 0x8A43
TL_MAPLimitforErrorCodeSetting:
    ;mpgrp Utility\On-Board_Diagnostics\Error_Code\
    ;mptbladdr 0x8A43
    ;mptbltype 3
    ;mpsubtype 1
    ;mptbllname MAPLimitforErrorCodeSetting
    ;mptblcname ERRMAP
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Detailed_Description
          .byte 0x70                       ;Point 1
.org 0x8A44
TL_CoolantTempLimitforErrorCodeSetting:
    ;mpgrp Utility\On-Board_Diagnostics\Error_Code\
    ;mptbladdr 0x8A44
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname CoolantTempLimitforErrorCodeSetting
    ;mptblcname ERRTMP
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Detailed_Description
          .byte 0xB0                       ;Point 1
.org 0x8A45
TL_ThrottleLowerLimit:
    ;mpgrp Utility\On-Board_Diagnostics\TPS_Sensor\
    ;mptbladdr 0x8A45
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ThrottleLowerLimit
    ;mptblcname THRLOW
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0x08                       ;Point 1
.org 0x8A46
TL_ThrottleUpperLimit:
    ;mpgrp Utility\On-Board_Diagnostics\TPS_Sensor\
    ;mptbladdr 0x8A46
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ThrottleUpperLimit
    ;mptblcname THRHIG
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0xF0                       ;Point 1
.org 0x8A47
TL_MapSwitchPointForFullThrottleOrIdle:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A47
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MapSwitchPointForFullThrottleOrIdle
    ;mptblcname MPTHR
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Desc_TL_8A47
          .byte 0xD1                       ;Point 1
.org 0x8A48
TL_TL_8A48:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A48
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A48
    ;mptblcname TL_8A48
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8A48
          .byte 0x20                       ;Point 1
.org 0x8A49
TL_TL_8A49:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A49
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A49
    ;mptblcname TL_8A49
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis speed 0 128 mph
    ;mptbldesc Desc_TL_8A49
          .byte 0x28                       ;Point 1
.org 0x8A4A
TL_TL_8A4A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A4A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A4A
    ;mptblcname TL_8A4A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A4A
          .byte 0x2F                       ;Point 1
.org 0x8A4B
TL_TL_8A4B:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A4B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A4B
    ;mptblcname TL_8A4B
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8A4B
          .byte 0x28                       ;Point 1
.org 0x8A4C
TL_TL_8A4C:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A4C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A4C
    ;mptblcname TL_8A4C
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8A4C
          .byte 0xDC                       ;Point 1
.org 0x8A4D
TL_TL_8A4D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A4D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A4D
    ;mptblcname TL_8A4D
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8A4D
          .byte 0x8C                       ;Point 1
.org 0x8A4E
TL_TL_8A4E:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A4E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A4E
    ;mptblcname TL_8A4E
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 5 volts
    ;mptbldesc Desc_TL_8A4E
          .byte 0x64                       ;Point 1
.org 0x8A4F
TL_TL_8A4F:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A4F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8A4F
    ;mptblcname TL_8A4F
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Baro -14.7 0 psi
    ;mptbldesc Desc_TL_8A4F
          .byte 0xCE                       ;Point 1
.org 0x8A50
TL_t3_0xfd:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A50
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname t3_0xfd
    ;mptblcname T3_0XFD
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A50
          .byte 0xAB                       ;Point 1
.org 0x8A51
TL_MapSensorLowerLimit:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A51
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MapSensorLowerLimit
    ;mptblcname MAPLOW
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0x02                       ;Point 1
.org 0x8A52
TL_MapSensorUpperLimit:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A52
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MapSensorUpperLimit
    ;mptblcname MAPHIG
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 5 volts
    ;mptbldesc Detailed_Description
          .byte 0xFD                       ;Point 1
.org 0x8A53
TL_MapSensorMiddleLimit:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A53
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MapSensorMiddleLimit
    ;mptblcname MAPMID
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis out_desc 0 5 volts
    ;mptbldesc Desc_TL_8A53
          .byte 0x66                       ;Point 1
.org 0x8A54
TL_DeltaMapThatChecksGood:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A54
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DeltaMapThatChecksGood
    ;mptblcname MPDELT
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Desc_T8A54
          .byte 0x01                       ;Point 1
.org 0x8A55
TL_MatureMapLimpinWhenDeltaAbove_MPDELT_plus_MPDELA:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A55
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname MatureMapLimpinWhenDeltaAbove_MPDELT_plus_MPDELA
    ;mptblcname MPDELA_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Desc_T8A55
          .byte 0x02                       ;Point 1
.org 0x8A56
TL_DeltaMapThatChecksGoodX:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A56
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DeltaMapThatChecksGoodX
    ;mptblcname MPDELX
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Desc_T8A56
          .byte 0x05                       ;Point 1
.org 0x8A57
TL_NotSure2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A57
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname NotSure2
    ;mptblcname NOTSURE2
    ;mpxaxis Xinput 16 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8A57
          .byte 0xF0, 0x80, 0x50, 0x40, 0x30, 0x30, 0x20, 0x20, 0x20, 0x10, 0x10, 0x10, 0x10, 0x00, 0x00, 0x00 ; 1 - 16
.org 0x8A67
TL_DisableMapCheckUnderThisRpm_600:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A67
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname DisableMapCheckUnderThisRpm_600
    ;mptblcname MPRPML
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis RPM 0 8192 RPM
    ;mptbldesc Desc_T8A67
          .word 0x12C0                     ;Point 1
.org 0x8A69
TL_DisableMapCheckAboveThisRpm_1500:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A69
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname DisableMapCheckAboveThisRpm_1500
    ;mptblcname MPRPMH
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis RPM 0 8192 RPM
    ;mptbldesc Desc_T8A69
          .word 0x2EE0                     ;Point 1
.org 0x8A6B
TL_DisableMapCheckBelowThisMap:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A6B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DisableMapCheckBelowThisMap
    ;mptblcname MPDAGL
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Desc_T8A6B
          .byte 0x12                       ;Point 1
.org 0x8A6C
TL_DisableMapCheckAboveThisMap:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A6C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname DisableMapCheckAboveThisMap
    ;mptblcname MPDAGH
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Desc_T8A6C
          .byte 0xF7                       ;Point 1
.org 0x8A6D
TL_CheckMapAtZeroSpeedAndThisDeltaRpm:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A6D
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname CheckMapAtZeroSpeedAndThisDeltaRpm
    ;mptblcname MPRMPD
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .word 0x0200                     ;Point 1
.org 0x8A6F
TL_CheckMapAtZeroSpeedAndThisBaroSwitch:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A6F
    ;mptbltype 3
    ;mpsubtype 1
    ;mptbllname CheckMapAtZeroSpeedAndThisBaroSwitch
    ;mptblcname BAROSW
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Detailed_Description
          .byte 0xCE                       ;Point 1
.org 0x8A70
TL_AllowMapToTestGoodThisNearBaro:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A70
    ;mptbltype 3
    ;mpsubtype 1
    ;mptbllname AllowMapToTestGoodThisNearBaro
    ;mptblcname MPVACD
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Detailed_Description
          .byte 0x21                       ;Point 1
.org 0x8A71
TL_AllowMapToTestGoodThisNearBaro2:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A71
    ;mptbltype 3
    ;mpsubtype 1
    ;mptbllname AllowMapToTestGoodThisNearBaro2
    ;mptblcname MPVAC2
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Detailed_Description
          .byte 0x10                       ;Point 1
.org 0x8A72
TL_LimpinTableForMapFromThrottle:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A72
    ;mptbltype 0
    ;mpsubtype 1
    ;mptbllname LimpinTableForMapFromThrottle
    ;mptblcname LMPINN
    ;mpxaxis TPS 0 255 tps
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Detailed_Description
          .byte 0x05                       ;Number of points in table
          .byte 0x00, 0x00, 0x07, 0x11     ;Point 1
          .byte 0x0F, 0x6A, 0x07, 0x6E     ;Point 2
          .byte 0x16, 0x9E, 0x00, 0xA0     ;Point 3
          .byte 0x36, 0xB2, 0x01, 0xE0     ;Point 4
          .byte 0x46, 0xD0                 ;Point 5
.org 0x8A85
TL_OffsetForCalcMapInMapLimpin:
    ;mpgrp Utility\On-Board_Diagnostics\MAP_Sensor\
    ;mptbladdr 0x8A85
    ;mptbltype 3
    ;mpsubtype 1
    ;mptbllname OffsetForCalcMapInMapLimpin
    ;mptblcname MPLMOF
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis MAP -14.7 0 psi
    ;mptbldesc Detailed_Description
          .byte 0x14                       ;Point 1
.org 0x8A86
TL_OffsetAddedToCalcThrottle:
    ;mpgrp Utility\On-Board_Diagnostics\
    ;mptbladdr 0x8A86
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname OffsetAddedToCalcThrottle
    ;mptblcname THROFF
    ;mpxaxis in_desc 0 255 in
    ;mpyaxis out_desc 0 255 out
    ;mptbldesc Detailed_Description
          .byte 0x0F                       ;Point 1
.org 0x8A87
TL_AIS_Constant_0x20:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A87
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname AIS_Constant_0x20
    ;mptblcname AIS_CONSTANT_0X20
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A87
          .byte 0x20                       ;Point 1
.org 0x8A88
TL_ExhGasRecircConst5:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A88
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConst5
    ;mptblcname EGR5
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A88
          .byte 0x08                       ;Point 1
.org 0x8A89
TL_ExhGasRecircConstFromCoolantTemp:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A89
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromCoolantTemp
    ;mptblcname EGR27
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8A89
          .byte 0xE1                       ;Point 1
.org 0x8A8A
TL_ExhGasRecircConstFromTimeEngRunning9:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A8A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromTimeEngRunning9
    ;mptblcname EGR9
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Y 0 720 Sec
    ;mptbldesc Desc_TL_8A8A
          .byte 0x80                       ;Point 1
.org 0x8A8B
TL_ExhGasRecircConstFromMAPBelowBaro:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A8B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromMAPBelowBaro
    ;mptblcname EGR33
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 5 volts
    ;mptbldesc Desc_TL_8A8B
          .byte 0x1F                       ;Point 1
.org 0x8A8C
TL_ExhGasRecircConstFromTPSVoltsLoLimit14a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A8C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromTPSVoltsLoLimit14a
    ;mptblcname EGR14A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 5 volts
    ;mptbldesc Desc_TL_8A8C
          .byte 0x29                       ;Point 1
.org 0x8A8D
TL_ExhGasRecircConstFromTPSVoltsLoLimit14:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A8D
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromTPSVoltsLoLimit14
    ;mptblcname EGR14
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 5 volts
    ;mptbldesc Desc_TL_8A8D
          .byte 0x07                       ;Point 1
.org 0x8A8E
TL_ExhGasRecircConstLoLimit18a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A8E
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstLoLimit18a
    ;mptblcname EGR18A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis map -14.7 0 PSI
    ;mptbldesc Desc_TL_8A8E
          .byte 0xC7                       ;Point 1
.org 0x8A8F
TL_ExhGasRecircConstLoLimit18:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A8F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstLoLimit18
    ;mptblcname EGR18
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis map -14.7 0 PSI
    ;mptbldesc Desc_TL_8A8F
          .byte 0x5A                       ;Point 1
.org 0x8A90
TL_ExhGasRecircConstFromRPMLoLimit15a:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A90
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromRPMLoLimit15a
    ;mptblcname EGR15A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A90
          .byte 0x5E                       ;Point 1
.org 0x8A91
TL_ExhGasRecircConstFromRPMLoLimit15:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A91
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstFromRPMLoLimit15
    ;mptblcname EGR15
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A91
          .byte 0x1F                       ;Point 1
.org 0x8A92
TL_ExhGasRecircConst3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A92
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConst3
    ;mptblcname EGR3_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A92
          .byte 0x80                       ;Point 1
.org 0x8A93
TL_ExhGasRecircConst1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A93
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname ExhGasRecircConst1
    ;mptblcname EGR1
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A93
          .word 0x01C7                     ;Point 1
.org 0x8A95
TL_ExhGasRecircConstLoLimit17:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A95
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstLoLimit17
    ;mptblcname EGR17
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A95
          .byte 0x2B                       ;Point 1
.org 0x8A96
TL_ExhGasRecircConstLoLimit17A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A96
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstLoLimit17A
    ;mptblcname EGR17A
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis rpm 0 8192 rpm
    ;mptbldesc Desc_TL_8A96
          .byte 0x58                       ;Point 1
.org 0x8A97
TL_ExhGasRecircConstLoLimit19:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A97
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstLoLimit19
    ;mptblcname EGR19
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 5 volts
    ;mptbldesc Desc_TL_8A97
          .byte 0x08                       ;Point 1
.org 0x8A98
TL_ExhGasRecircConstHiLimit19A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A98
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstHiLimit19A
    ;mptblcname EGR19A_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A98
          .byte 0x21                       ;Point 1
.org 0x8A99
TL_ExhGasRecircConstLoLimit16:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A99
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstLoLimit16
    ;mptblcname EGR16_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis map -14.7 0 PSI
    ;mptbldesc Desc_TL_8A99
          .byte 0x6E                       ;Point 1
.org 0x8A9A
TL_ExhGasRecircConstHiLimit16A:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A9A
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConstHiLimit16A
    ;mptblcname EGR16A_
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis map -14.7 0 PSI
    ;mptbldesc Desc_TL_8A9A
          .byte 0xAD                       ;Point 1
.org 0x8A9B
TL_ExhGasRecircConst8:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A9B
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConst8
    ;mptblcname EGR8
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A9B
          .byte 0x80                       ;Point 1
.org 0x8A9C
TL_ExhGasRecircConst7:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A9C
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConst7
    ;mptblcname EGR7
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A9C
          .byte 0x07                       ;Point 1
.org 0x8A9D
TL_ExhGasRecircConst6:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A9D
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname ExhGasRecircConst6
    ;mptblcname EGR6
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A9D
          .word 0x016C                     ;Point 1
.org 0x8A9F
TL_ExhGasRecircConst4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8A9F
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname ExhGasRecircConst4
    ;mptblcname EGR4
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8A9F
          .byte 0x08                       ;Point 1
.org 0x8AA0
TL_TL_8AA0:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AA0
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname TL_8AA0
    ;mptblcname TL_8AA0
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8AA0
          .word 0x2757                     ;Point 1
.org 0x8AA2
TL_TL_8AA2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AA2
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8AA2
    ;mptblcname TL_8AA2
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8AA2
          .byte 0x14                       ;Point 1
.org 0x8AA3
TL_TL_8AA3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AA3
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8AA3
    ;mptblcname TL_8AA3
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Coolant_Temp -200 260 deg
    ;mptbldesc Desc_TL_8AA3
          .byte 0xFF                       ;Point 1
.org 0x8AA4
TL_TL_8AA4:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AA4
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8AA4
    ;mptblcname TL_8AA4
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8AA4
          .byte 0xC0                       ;Point 1
.org 0x8AA5
TL_TL_8AA5:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AA5
    ;mptbltype 3
    ;mpsubtype n
    ;mptbllname TL_8AA5
    ;mptblcname TL_8AA5
    ;mpxaxis Xinput 0 255 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_TL_8AA5
          .byte 0xDA                       ;Point 1
.org 0x8AA6
TL_ModelTypeCode:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AA6
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname ModelTypeCode
    ;mptblcname MDLCDE
    ;mpxaxis X 0 255 in
    ;mpyaxis Y 0 255 out
    ;mptbldesc The_1st_2_digits_are_the_model_year_2nd_2_digits_are_the_engine_and_trans_type.
          .word 0x0417                     ;Point 1
    ;mp******************************
    ;mpmodelyr 96 1986
    ;mpmodelyr 97 1987
    ;mpmodelyr 98 1988
    ;mpmodelyr 99 1989
    ;mpmodelyr 00 1990
    ;mpmodelyr 01 1991
    ;mpmodelyr 02 1992
    ;mpmodelyr 03 1993
    ;mpmodelyr 04 1994
    ;mpmodelyr 05 1995
    ;mpmodelyr 11 1991_MP
    ;mpmodelyr 12 1992
    ;mpmodelyr 13 1993_Mex
    ;mpmodelyr 50 1990_Shadow
    ;mpmodelyr 40 1989_Daytona_VNT
    ;mpmodelyr 79 1989_3.0_Van
    ;mpmodelyr 70 1990_3.0_Van
    ;mpmodelyr 21 1991_3.0_Van
    ;mpmodelyr FF 1995_Neon
    ;mpengtran 44 2.2_T2_Auto
    ;mpengtran 10 2.2_TIV
    ;mpengtran 40 2.2_VNT_Manual
    ;mpengtran 01 2.5_T1
    ;mpengtran 02 2.5_T1_Canada
    ;mpengtran 11 2.5_Turbo
    ;mpengtran 21 2.5_T1_Van_Auto
    ;mpengtran 41 2.5_T1/T3_Manual
    ;mpengtran 12 3.0_MFI
    ;mpengtran 22 3.0_Auto
    ;mpengtran 51 3.0_Van_A604
    ;mpengtran 13 3.3_MFI
    ;mpengtran 14 3.9_Truck
    ;mpengtran 17 4.0_Jeep_Manual
    ;mpengtran 15 5.2/5.9_TBI_VIN_Y
    ;mpengtran 16 5.2/5.9_TBI_VIN_X
    ;mpengtran C1 2.5_T2_Manual_Mex
    ;mpengtran FF Neon_Tran
    ;mp******************************
.org 0x8AA8
TL_SourceCodeVersionID:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AA8
    ;mptbltype 4
    ;mpsubtype n
    ;mptbllname SourceCodeVersionID
    ;mptblcname SRCID
    ;mpxaxis X 0 255 in
    ;mpyaxis Y 0 255 out
    ;mptbldesc The_1st_2_digits_are_the_codebase_type_2nd_2_digits_are_the_version.
          .word 0x1210                     ;Point 1
    ;mp******************************
    ;mpcodebase 0A T-LM
    ;mpcodebase 0B T-SMECt1
    ;mpcodebase 0C T-SBEC1
    ;mpcodebase 0D T-TIII_(91)
    ;mpcodebase 0E T-TIII_(92-93)
    ;mpcodebase 0F T-GLHS
    ;mpcodebase 10 FCC
    ;mpcodebase 11 T-SMECt2
    ;mpcodebase 12 T-SBEC2
    ;mp******************************
.org 0x8AAA
TL_Map_Value_Dummy:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AAA
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname Map_Value_Dummy
    ;mptblcname MAPVALD
    ;mpxaxis Xinput -14.7 0 psi
    ;mpyaxis Youtput 0 255 yfactor
    ;mptbldesc Dummy_table_used_for_3d_display_to_represent_the_map_scaling
          .byte 0x02                       ;Number of points in table
          .byte 0x00, 0x00, 0x01, 0x00     ;Point 1
          .byte 0xFF, 0xFF                 ;Point 2
.org 0x8AB1
TL_Map_Volts_Dummy:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AB1
    ;mptbltype 0
    ;mpsubtype n
    ;mptbllname Map_Volts_Dummy
    ;mptblcname MAPVOLD
    ;mpxaxis Xinput 0 5 volts
    ;mpyaxis Youtput 0 255 yfactor
    ;mptbldesc Dummy_table_used_for_3d_display_to_represent_the_map_scaling
          .byte 0x02                       ;Number of points in table
          .byte 0x00, 0x00, 0x01, 0x00     ;Point 1
          .byte 0xFF, 0xFF                 ;Point 2
.org 0x8AB8
TL_TempForColdScaleFromA2D:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0x8AB8
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
.org 0x8AD3
TL_TempForHotScaleA2D:
    ;mpgrp Setup\Transfer_Functions\
    ;mptbladdr 0x8AD3
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
.org 0x8AE2
TL_ScaleCoolantTemp:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8AE2
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
.org 0x8B05
TL_Tl_e468:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B05
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
.org 0x8B10
TL_Tl_e475:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B10
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
.org 0x8B23
TL_ScaleChargeTemp:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B23
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
.org 0x8B46
TL_TempForScaleAmbientA2D:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B46
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
.org 0x8B5D
TL_BatteryVoltsTable3:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B5D
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
.org 0x8B70
TL_BatteryVoltsTable2:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B70
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
.org 0x8B83
TL_BatteryVoltsTable1:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B83
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
.org 0x8B96
TL_DwellTimeFromBatteryVoltsComp:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8B96
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
.org 0x8BA9
TL_TL_8ba9:
    ;mpgrp Unassigned\
    ;mptbladdr 0x8BA9
    ;mptbltype 9
    ;mpsubtype n
    ;mptbllname TL_8ba9
    ;mptblcname TL_8BA9
    ;mpxaxis Xinput 2135 2136 x_units
    ;mpyaxis Youtput 0 255 Y_units
    ;mptbldesc Desc_T8ba9
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1 - 16
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 17 - 32
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 33 - 48
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 49 - 64
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 65 - 80
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 81 - 96
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 97 - 112
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 113 - 128
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 129 - 144
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 145 - 160
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 161 - 176
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 177 - 192
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 193 - 208
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 209 - 224
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 225 - 240
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 241 - 256
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 257 - 272
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 273 - 288
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 289 - 304
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 305 - 320
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 321 - 336
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 337 - 352
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 353 - 368
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 369 - 384
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 385 - 400
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 401 - 416
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 417 - 432
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 433 - 448
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 449 - 464
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 465 - 480
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 481 - 496
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 497 - 512
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 513 - 528
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 529 - 544
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 545 - 560
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 561 - 576
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 577 - 592
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 593 - 608
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 609 - 624
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 625 - 640
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 641 - 656
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 657 - 672
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 673 - 688
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 689 - 704
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 705 - 720
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 721 - 736
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 737 - 752
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 753 - 768
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 769 - 784
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 785 - 800
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 801 - 816
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 817 - 832
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 833 - 848
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 849 - 864
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 865 - 880
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 881 - 896
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 897 - 912
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 913 - 928
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 929 - 944
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 945 - 960
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 961 - 976
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 977 - 992
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 993 - 1008
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1009 - 1024
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1025 - 1040
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1041 - 1056
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1057 - 1072
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1073 - 1088
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1089 - 1104
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1105 - 1120
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1121 - 1136
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1137 - 1152
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1153 - 1168
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1169 - 1184
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1185 - 1200
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1201 - 1216
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1217 - 1232
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1233 - 1248
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1249 - 1264
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1265 - 1280
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1281 - 1296
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1297 - 1312
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1313 - 1328
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1329 - 1344
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1345 - 1360
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1361 - 1376
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1377 - 1392
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1393 - 1408
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1409 - 1424
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1425 - 1440
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1441 - 1456
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1457 - 1472
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1473 - 1488
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1489 - 1504
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1505 - 1520
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1521 - 1536
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1537 - 1552
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1553 - 1568
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1569 - 1584
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1585 - 1600
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1601 - 1616
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1617 - 1632
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1633 - 1648
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1649 - 1664
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1665 - 1680
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1681 - 1696
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1697 - 1712
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1713 - 1728
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1729 - 1744
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1745 - 1760
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1761 - 1776
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1777 - 1792
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1793 - 1808
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1809 - 1824
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1825 - 1840
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1841 - 1856
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1857 - 1872
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1873 - 1888
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1889 - 1904
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1905 - 1920
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1921 - 1936
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1937 - 1952
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1953 - 1968
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1969 - 1984
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 1985 - 2000
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2001 - 2016
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2017 - 2032
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2033 - 2048
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2049 - 2064
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2065 - 2080
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2081 - 2096
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2097 - 2112
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2113 - 2128
          .byte 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F ; 2129 - 2135
