#include defines.inc
 ORG $8000
#include data.inc
 ORG $9400

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

XIRQ:
        ldab    #1
        bra     loc_9416

NOCOP:
        ldab    #2
        bra     loc_9416

OPC:
        ldab    #4
        bra     loc_9416

SCISS:
        ldab    #$10
        bra     loc_9416

SPIE:
        ldab    #$20
        bra     loc_9416

SOFT:
        ldab    #$40

loc_9416:
        sei
        orab    #$80
        stab    Temp0
        ldd     #$2A9
        staa    TMSK2_TimerInterruptMask2
        stab    OPTION_SysConfigOptionReg
        ldaa    #$F8
        staa    BPROT_BlockProtReg
        tsx
        ldd     7,x
        std     <Ram_01
        std     Temp1
        lds     #$64FF
        clr     MinimumTimerCountBeforeMainloopCanContinue
        clr     Ram_04
        bra     loc_94A2

CME:
        sei
        lds     #$64FF
        ldd     #$2A9
        staa    TMSK2_TimerInterruptMask2
        stab    OPTION_SysConfigOptionReg
        ldaa    #$F8
        staa    BPROT_BlockProtReg
        clra
        clrb
        staa    Temp0
        std     Temp1
        ldx     #0

loc_945A:
        ldaa    0,x
        cmpa    #0
        bne     loc_9468
        inx
        cpx     #$20
        bcs     loc_945A
        bra     loc_94A2

loc_9468:
        ldd     <Counter_SpeedSensorInterrupt_HB
        tba
        comb
        std     <MinimumTimerCountBeforeMainloopCanContinue
        bra     loc_94A2

__RESET:
        sei
        lds     #$64FF
        ldd     #$2A9
        staa    TMSK2_TimerInterruptMask2
        stab    OPTION_SysConfigOptionReg
        ldaa    #$F8
        staa    BPROT_BlockProtReg
        clra
        clrb
        staa    Temp0
        std     Temp1
        ldd     <Counter_SpeedSensorInterrupt_HB
        tba
        comb
        xgdy
        jsr     CountRamValuesFrom05to20
        cpd     <MinimumTimerCountBeforeMainloopCanContinue
        beq     loc_949C
        ldy     #Ram_00

loc_949C:
        sty     <MinimumTimerCountBeforeMainloopCanContinue
        bset    <Ram_05 $A

loc_94A2:
        jsr     sub_E7D6
        ldaa    #$90
        tap
        ldab    #$F
        ldaa    TL_CONF01
        bita    #8
        beq     loc_94B3
        ldab    #6

loc_94B3:
        stab    HPRIO_HighPriorityInterruptMask
        clr     OC1M_OutputCompare1Mask
        clr     OC1D_OutputCompare1D
        ldd     #$FF
        staa    TMSK1_TimerInterruptMask1
        stab    TFLG1_TimerInterruptFlag1
        ldaa    #$1A
        staa    TCTL2_TimerControlReg2
        ldd     #$AA78
        staa    TCTL1_TimerControlReg1
        stab    CFORC_TimerForceCompare
        ldd     #$7520
        staa    PIA3_Buffer_2_t3
        staa    <PIA3_Buffer_t3
        stab    PORTD_PortD
        ldaa    #8
        staa    SwitchPortAccessReg1
        ldab    TL_IDENT1
        cmpb    #$11
        beq     loc_94F1
        ldab    #$8F
        stab    PIA_Ctrl_1
        bra     loc_94F6

loc_94F1:
        ldab    #$F
        stab    PIA_Ctrl_1

loc_94F6:
        ldab    PIA_Ctrl_1
        andb    #$F7
        stab    PIA_Ctrl_1
        jsr     OCToggleAndResetCopTimer
        jsr     OCToggleAndResetCopTimer
        ldd     #$3A55
        staa    DDRD_PortD_DataDirection
        ldaa    SPSR_SerialPeripheralStatus
        stab    SPCR_SerialPeripheralControl
        jsr     OCToggleAndResetCopTimer
        ldd     #$F870
        staa    PIA_Ctrl_5
        stab    PACTL_PulseAccumulatorControl
        clra
        staa    PPROG_EEPROMControlReg
        staa    PIA_Ctrl_2
        ldd     #8
        std     InjectorPulsewidth_HB_Cyl1
        std     InjectorPulsewidth_HB_Cyl2
        std     InjectorPulsewidth_HB_Cyl3
        std     InjectorPulsewidth_HB_Cyl4
        ldd     #$C22
        staa    SCCR2_SerialControlReg2
        stab    BAUD_SerialBaudRate
        ldd     SCSR_SerialStatus
        jsr     OCToggleAndResetCopTimer
        clr     SCCR1_SerialControlReg1
        ldx     #IPL1
        ldd     <MinimumTimerCountBeforeMainloopCanContinue
        coma
        cba
        beq     loc_957C
        ldab    #8
        ldaa    Temp0
        bpl     loc_9556
        ldab    #$80

loc_9556:
        stab    <Ram_05
        anda    #$7F
        staa    <Ram_00
        ldd     Temp1
        std     <Ram_01
        ldaa    #$5C
        staa    <LowestSessionTpsVolts
        ldaa    #$80
        staa    <Timer_DacalCountdown
        staa    <Ram_0B
        staa    <ValueFromAdaptiveMemory
        ldaa    TL_TL_88E4
        staa    <Ram_0C
        ldd     #$40DF
        staa    <BitFlags36_t3
        stab    <CurrentAisPosition
        ldx     #Counter_SpeedSensorInterrupt_HB

loc_957C:
        ldy     #$594

loc_9580:
        dey
        bne     loc_9580
        dex
        clrb

ClearRam20toFF:
        inx
        stab    0,x
        cpx     #$FF
        bcs     ClearRam20toFF
        ldaa    TL_CONF01
        staa    <BitFlags27
        ldx     #CountdownTimerFromKeyOn
        dex
        clrb

ClearRam6480to64c8:
        inx
        stab    0,x
        cpx     #$64C8
        bcs     ClearRam6480to64c8
        ldaa    #$E5
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        jsr     OCToggleAndResetCopTimer
        ldy     #$594

loc_95AE:
        dey
        bne     loc_95AE
        ldaa    #$14
        staa    ADCTL_A2DControlReg

loc_95B7:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_95B7
        ldaa    ADR1_A2DResults1
        staa    CoolantVoltsTmp2
        ldaa    <PIA3_Buffer_t3
        anda    #$7F
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        jsr     OCToggleAndResetCopTimer
        ldy     #$476

loc_95D2:
        dey
        bne     loc_95D2
        ldaa    #$14
        staa    ADCTL_A2DControlReg

loc_95DB:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_95DB
        ldaa    ADR1_A2DResults1
        staa    CoolantVoltsTmp1
        ldaa    CoolantVoltsTmp1
        ldab    CoolantVoltsTmp2
        mul
        std     Temp1
        ldab    CoolantVoltsTmp1
        subb    CoolantVoltsTmp2
        bls     loc_9613
        clra
        xgdx
        ldd     Temp1
        aslb
        adca    #0
        tab
        abx
        ldd     Temp1
        idiv
        xgdx
        tsta
        bne     loc_9613
        tba
        ldx     #TL_TempForScaleAmbientA2D
        jsr     Lookup4ByteTable
        bra     loc_9615

loc_9613:
        ldaa    #$C1

loc_9615:
        staa    <AmbientAirTempVolts2
        jsr     bcf2_MM
        jsr     DetermineTargetBatteryVoltage
        ldaa    <PIA3_Buffer_t3
        oraa    #$10
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        jsr     OCToggleAndResetCopTimer
        ldy     #$594

loc_962D:
        dey
        bne     loc_962D
        ldaa    #$14
        staa    ADCTL_A2DControlReg

loc_9636:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_9636
        ldaa    ADR1_A2DResults1
        cmpa    #$40
        bcc     loc_964B
        ldaa    <PIA3_Buffer_t3
        anda    #$EF
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3

loc_964B:
        jsr     OCToggleAndResetCopTimer
        ldy     #$594

loc_9652:
        dey
        bne     loc_9652
        ldaa    #$14
        staa    ADCTL_A2DControlReg

loc_965B:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_965B
        ldaa    ADR1_A2DResults1
        staa    <LastCoolantTempVolts

loc_9665:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_9665
        ldaa    ADR2_A2DResults2
        cmpa    #$40
        bcc     loc_967A
        ldaa    <PIA3_Buffer_t3
        anda    #$DF
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3

loc_967A:
        jsr     OCToggleAndResetCopTimer
        ldy     #$594

loc_9681:
        dey
        bne     loc_9681
        ldaa    #$14
        staa    ADCTL_A2DControlReg

loc_968A:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_968A
        ldab    ADR2_A2DResults2
        stab    <LastChargeTempVolts
        ldaa    #$10
        staa    ADCTL_A2DControlReg
        jsr     OCToggleAndResetCopTimer

loc_969C:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_969C
        jsr     ReadA2DBattVolts
        staa    <BatteryVolts
        ldab    ADR4_A2DResults4
        stab    <LastTpsVolts
        ldaa    ADR1_A2DResults1
        jsr     ConvertMAPVoltsToValue
        staa    <MapValue
        clrb
        std     <MapValue2
        staa    MapValue_t3
        brclr   <Ram_05 8 loc_96C8
        cmpa    #$80
        bcc     loc_96C3
        ldaa    #$80

loc_96C3:
        staa    <BaroPressure
        bclr    <Ram_05 8

loc_96C8:
        ldaa    ADR1_A2DResults1
        staa    <MapVolts_X
        staa    <MapValue3
        brclr   <Ram_05 2 loc_96F9
        brclr   <Ram_05 4 loc_96F9
        cmpa    TL_MapSensorMiddleLimit
        bcc     loc_96F9
        ldab    #2

loc_96DE:
        ldaa    #$10
        staa    ADCTL_A2DControlReg

loc_96E3:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_96E3
        ldaa    ADR1_A2DResults1
        cmpa    TL_MapSensorMiddleLimit
        bcc     loc_96F9
        decb
        bne     loc_96DE
        bset    <b5C_IPL1_t3 #b3_D5_MapBadSignal
        bset    <BitFlags2e #b7_2E_MapMaybe

loc_96F9:
        bclr    <Ram_05 2
        ldaa    <Ram_05
        anda    #$C0
        cmpa    #$80
        bne     loc_971A
        ldd     #$AFF
        std     <DRBPointer1
        ldaa    #$F1
        staa    LastCamFallingEdgeTime2
        ldab    #$FF
        ldaa    <BitFlags27
        bita    #$C0
        beq     loc_9732
        ldab    #$FB
        bra     loc_9732

loc_971A:
        ldaa    <Ram_05
        adda    #$40
        staa    <Ram_05
        ldaa    PIA_Ctrl_1
        oraa    #4
        staa    PIA_Ctrl_1
        ldab    #$EF
        ldaa    <BitFlags27
        bita    #$C0
        beq     loc_9732
        ldab    #$EB

loc_9732:
        stab    <PIA2_Buffer_t3
        ldaa    <PIA3_Buffer_t3
        anda    #$FB
        staa    PIA3_Buffer_2_t3
        staa    <PIA3_Buffer_t3
        cmpb    SPSR_SerialPeripheralStatus
        stab    SPDR_SerialPeripheralDataIO
        mul
        mul
        nop
        ldaa    <PIA3_Buffer_t3
        oraa    #4
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        ldab    SPCR_SerialPeripheralControl
        andb    #$FC
        stab    SPCR_SerialPeripheralControl
        jsr     OCToggleAndResetCopTimer
        ldx     #$535

loc_975D:
        ldaa    SwitchPortAccessReg1
        bita    #$10
        bne     loc_9767
        dex
        bne     loc_975D

loc_9767:
        jsr     OCToggleAndResetCopTimer
        ldaa    PIA_Ctrl_1
        anda    #$FB
        staa    PIA_Ctrl_1
        ldaa    Timer_DelayBeforeUpdating_MINTHR
        oraa    #3
        staa    Timer_DelayBeforeUpdating_MINTHR
        nop
        nop
        nop
        bset    <BitFlags24 $10
        bset    <ACClutchToggleVar $FF
        bset    <BitFlags66_t3 $10
        bset    <BitFlags68_t3 $44
        bset    <BitFlags36_t3 $20
        bclr    <BitFlags36_t3 $10
        bset    <CruiseStatus_1 $A0
        ldaa    #$80
        staa    <Counter_Cruise_1
        ldd     #$FFFF
        std     <DistributorFallingEdgePulsewidth_HB
        std     <Counter_TimerPastHalfwayBetweenCamPulses
        std     <Counter_TimerRegHalfOverflowBetweenSpeedoPulses
        std     <SpeedoSensorPulsewidth_HB
        staa    <Ram_4C
        ldaa    <MapValue
        clrb
        std     <MapValueTemp1
        std     <MapValueTemp2
        std     <MapValueTemp3
        ldaa    <LastTpsVolts
        std     <TPSVoltsTemp_A
        std     <TPSVoltsTemp_B
        brset   <Ram_05 1 loc_97C1
        bset    <Ram_05 1
        ldaa    byte_842A
        beq     loc_97C1
        bset    <Ram_EC $A0

loc_97C1:
        ldx     #$B616
        ldaa    0,x
        cmpa    #$4A
        bne     loc_97D2
        coma
        cmpa    1,x
        bne     loc_97D2
        bset    <BitFlags2D 4

loc_97D2:
        ldx     #$B6E1
        ldaa    0,x
        cmpa    #$4A
        bne     loc_97E3
        coma
        cmpa    1,x
        bne     loc_97E3
        bset    <BitFlags21 2

loc_97E3:
        ldx     #$B6E3
        ldaa    0,x
        cmpa    #$4A
        bne     loc_97F4
        coma
        cmpa    1,x
        bne     loc_97F4
        bset    <BitFlags29 8

loc_97F4:
        ldaa    <LastCoolantTempVolts
        ldx     #TL_TempForHotScaleA2D
        brclr   <PIA3_Buffer_t3 $10 FilterAndStoreCoolantTemp
        ldx     #TL_TempForColdScaleFromA2D

FilterAndStoreCoolantTemp:
        jsr     Lookup4ByteTable
        staa    <CoolantTemp
        ldaa    <LastCoolantTempVolts
        cmpa    TL_CoolantTempOutOfRangeHigh
        bcc     UseDefaultCoolantTemp
        cmpa    TL_CoolantTempOutOfRangeLow
        bcs     UseDefaultCoolantTemp
        ldaa    <CoolantTemp
        bra     SubstituteCoolantForChargeTemp

UseDefaultCoolantTemp:
        ldaa    TL_DefaultCoolantTempRaw

SubstituteCoolantForChargeTemp:
        staa    <CoolantTemp
        ldx     #TL_ScaleCoolantTemp
        jsr     Lookup4ByteTable
        staa    <CoolantTemp_fromTable_Scaled
        staa    <PreviousCoolantTemp_fromTable_Scaled
        ldaa    <LastChargeTempVolts
        ldx     #TL_TempForHotScaleA2D
        brclr   <PIA3_Buffer_t3 #b5_CF_ChargeTemp FilterAndStoreChargeTemp
        ldx     #TL_TempForColdScaleFromA2D

FilterAndStoreChargeTemp:
        jsr     Lookup4ByteTable
        staa    <ChargeTempVolts
        ldaa    <LastChargeTempVolts
        cmpa    TL_ChargeTempOutOfRangeHigh
        bcc     UseDefaultChargeTemp
        cmpa    TL_ChargeTempOutOfRangeLow
        bcs     UseDefaultChargeTemp
        ldaa    <ChargeTempVolts
        bra     StoreChargeTempValue2

UseDefaultChargeTemp:
        ldaa    TL_DefaultChargeTemp_Limpin

StoreChargeTempValue2:
        staa    <ChargeTempVolts
        ldx     #TL_ScaleChargeTemp
        jsr     Lookup4ByteTable
        staa    <IntakeTemp_fromTable_Scaled
        ldaa    <LastTpsVolts
        staa    <TpsVolts
        ldab    <LowestSessionTpsVolts
        addb    TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly
        cmpb    TL_ValueOf_MINTHR_WhenBatteryDisconnected
        bcs     loc_9869
        adda    #6
        ldab    TL_ValueOf_MINTHR_WhenBatteryDisconnected
        cba
        bcc     loc_9869
        tab

loc_9869:
        stab    <LowestSessionTpsVolts
        ldaa    <CoolantTemp
        cmpa    TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup
        bcs     loc_9877
        cmpa    TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup
        bcs     CalculateVariousFactors3

loc_9877:
        bset    <BitFlags6d_t3 2

CalculateVariousFactors3:
        jsr     CalculateVariousFactors2
        jsr     calc_fuel_MM
        ldd     TCNT_Counter_FreeRunning16bit
        addd    #$3E8
        std     TOC1_Counter_OC1
        jsr     sub_ED8B
        ldaa    <PIA3_Buffer_t3
        oraa    #1
        staa    PIA3_Buffer_2_t3
        anda    #$FE
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        ldx     #gb_AISTEP_BitPatternForAisControl
        ldab    <BitFlags_36_t3
        abx
        ldab    0,x
        tba
        comb
        aslb
        aslb
        aslb
        aslb
        anda    #$F
        aba
        ldx     #PORTD_PortD
        bclr    0,x %100000
        cmpa    SPSR_SerialPeripheralStatus
        staa    SPDR_SerialPeripheralDataIO
        ldaa    <PIA3_Buffer_t3
        oraa    #1
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        mul
        bset    0,x %100000
        ldaa    #$BF
        ldab    TL_ConfigurationFlags2
        bitb    #$20
        beq     loc_98D6
        ldab    TL_CONF01
        bitb    #1
        beq     loc_98D6
        anda    #$DF

loc_98D6:
        staa    <PIA1_Buffer_t3
        ldaa    SwitchPortAccessReg1
        oraa    #1
        staa    SwitchPortAccessReg1
        ldx     #$238

loc_98E3:
        dex
        bne     loc_98E3
        jsr     UpdatePIA1AndCheckOutputs2_MM
        cli
        ldd     TCNT_Counter_FreeRunning16bit
        std     MinimumTimerCountBeforeMainloopCanContinue2
        bra     MainProgramLoop

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fdb     ReadA2DCoolantChargeTempSensors
        fdb     L99B6
        fdb     MainSubLoop
        fdb     ReadA2DNotSureWhat_X
        fdb     MainSubLoop
        fdb     ReadA2DNotSureWhat_Y
        fdb     L9A07
        fdb     MainSubLoop

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

MainProgramLoop:
        jsr     ResetCopTimer2
        ldaa    TL_CONF01
        staa    <BitFlags27
        inc     Ram_FE
        sei
        ldd     TCNT_Counter_FreeRunning16bit
        std     Temp0
        inc     Counter_MainLoop
        bne     loc_9926
        bclr    <Ram_05, %11000000
        bset    <BitFlags6a_t3, %00000100
        ldaa    <KeyOnOrEngineRunningTime
        inca
        beq     loc_9926
        staa    <KeyOnOrEngineRunningTime

loc_9926:
        ldaa    #$10
        staa    ADCTL_A2DControlReg
        ldd     Temp0
        ldx     #Counter_TimerPastHalfwayBetweenCamPulses
        ldy     #Temp5
        jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM
        cmpa    #$10
        bcs     loc_995A
        brset   <BitFlags2e $10 loc_995D
        bset    <BitFlags2e $10
        ldab    #$AA
        stab    TCTL1_TimerControlReg1
        ldab    #$78
        stab    CFORC_TimerForceCompare
        ldaa    UNe_64B9
        anda    #$E0
        staa    UNe_64B9
        bclr    <BitFlags2b, %11000000
        bra     loc_995D

loc_995A:
        bclr    <BitFlags2e, %00010000

loc_995D:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_995D
        ldaa    <Counter_MainLoop
        lsra
        bcs     loc_996F
        lsra
        bcs     loc_996F
        jsr     ReadA2DBattVolts
        staa    <BatteryVolts

loc_996F:
        ldd     ADR3_A2DResults3
        staa    <O2SensorVolts
        stab    <LastTpsVolts
        ldaa    ADR1_A2DResults1
        cli
        jsr     sub_D7EB
        ldaa    #$14
        sei
        staa    ADCTL_A2DControlReg
        ldd     TCNT_Counter_FreeRunning16bit
        lsld
        ldx     #Counter_TimerRegHalfOverflowBetweenSpeedoPulses
        ldy     #Temp5
        jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM

loc_9991:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_9991
        ldx     #$98F2
        ldab    <Ram_FE
        bitb    #7
        beq     ReadA2DCoolantChargeTempSensors
        orab    #$80
        cmpb    #$F8
        bcs     MainSubLoop
        andb    #7
        aslb
        abx
        ldx     0,x
        jmp     0,x

ReadA2DCoolantChargeTempSensors:
        ldd     ADR1_A2DResults1
        staa    <LastCoolantTempVolts
        stab    <LastChargeTempVolts
        bra     MainSubLoop

L99B6:
        ldaa    <PIA3_Buffer_t3
        anda    #$7F
        brclr   <PIA3_Buffer_t3 #b4_CF_CoolantTemp loc_99C3
        bset    <BitFlags23 #b3_23_bt3
        bra     loc_99C6

loc_99C3:
        bclr    <BitFlags23 #b3_23_bt3

loc_99C6:
        anda    #$EF
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        bra     MainSubLoop

ReadA2DNotSureWhat_X:
        ldaa    ADR1_A2DResults1
        cli
        cmpa    CoolantVoltsTmp1
        bne     loc_99DD
        bset    <BitFlags23 #b5_23_bt5
        bra     loc_99E0

loc_99DD:
        bclr    <BitFlags23 #b5_23_bt5

loc_99E0:
        staa    CoolantVoltsTmp1
        ldaa    <PIA3_Buffer_t3
        oraa    #$80
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        bra     MainSubLoop

ReadA2DNotSureWhat_Y:
        ldaa    ADR1_A2DResults1
        cli
        staa    CoolantVoltsTmp2
        brclr   <BitFlags23 #b5_23_bt5 MainSubLoop
        ldab    <BitFlags66_t3
        bitb    #3
        bne     MainSubLoop
        jsr     sub_BC57
        jsr     DetermineTargetBatteryVoltage
        bra     MainSubLoop

L9A07:
        ldaa    <PIA3_Buffer_t3
        anda    #$7F
        brclr   <BitFlags23 #b3_23_bt3 loc_9A13
        oraa    #$10
        bra     loc_9A15

loc_9A13:
        anda    #$EF

loc_9A15:
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3

MainSubLoop:
        ldab    #$10
        stab    ADCTL_A2DControlReg
        cli
        jsr     sub_BA1C
        jsr     sub_BC36
        jsr     sub_BBAA
        jsr     sub_E721
        jsr     sub_B914
        jsr     sub_AE79
        jsr     sub_A802
        jsr     sub_BBED
        jsr     sub_BF92
        jsr     sub_B88A
        jsr     sub_B800
        jsr     CalculateVariousFactors2
        jsr     calc_fuel_MM
        jsr     sub_C147
        jsr     sub_BC01
        jsr     sub_9C2A
        jsr     sub_9CC9
        jsr     sub_A327
        jsr     sub_C6B5
        jsr     sub_A65D
        jsr     sub_A7E2
        jsr     sub_B9BA
        jsr     sub_C6ED
        jsr     sub_B9F1
        jsr     sub_9FED
        jsr     sub_E191
        ldaa    <Counter_MainLoop
        bne     loc_9A78
        jsr     sub_EDC9
        jsr     sub_D733

loc_9A78:
        ldaa    <Counter_MainLoop
        lsra
        bcc     loc_9A99
        lsra
        bcc     loc_9A8E
        jsr     sub_B976
        jsr     sub_D978
        jsr     sub_C2F8
        jsr     bcf2_MM
        bra     loc_9AB1

loc_9A8E:
        jsr     sub_A283
        jsr     sub_A2A8
        jsr     sub_D6E6
        bra     loc_9AB1

loc_9A99:
        jsr     sub_9BBE
        jsr     sub_9B32
        jsr     EmissionMaintenanceReminder2_MM
        jsr     sub_A18C
        jsr     sub_A2BB
        jsr     sub_DB43
        jsr     sub_DBFB
        jsr     sub_DCB0

loc_9AB1:
        jsr     sub_9D4C
        jsr     sub_BD34
        jsr     sub_C04E
        jsr     sub_C184
        jsr     sub_C1F1
        jsr     sub_C2E6
        jsr     sub_D69A
        ldaa    <EngineRpm_HB
        cmpa    #$7D
        bcc     loc_9AE7
        jsr     sub_D682
        jsr     sub_DAD9
        jsr     sub_D93C
        jsr     sub_DD3A
        jsr     sub_D842
        jsr     sub_DB01
        jsr     sub_D88B
        jsr     VerifyOperationOfFuelInjectorDrivers_MM
        jsr     sub_DA31

loc_9AE7:
        jsr     sub_9EDC
        jsr     sub_CA29
        jsr     DRBIIOutput
        jsr     ActuatorTestMode_MM
        jsr     UpdatePIA1AndCheckOutputs2_MM
        jsr     sub_D3E1
        jsr     sub_BF3E
        jsr     sub_D75B
        brset   <BitFlags6a_t3 $40 loc_9B19
        sei
        ldaa    CountdownTimerFromKeyOn
        bne     loc_9B19
        ldd     <MinimumTimerCountBeforeMainloopCanContinue
        cli
        coma
        cba
        beq     loc_9B19
        jsr     ErrorCodeResetEeprom
        ldd     <Counter_SpeedSensorInterrupt_HB
        tba
        comb
        std     <MinimumTimerCountBeforeMainloopCanContinue

loc_9B19:
        cli
        jsr     sub_E825

loc_9B1D:
        ldd     TCNT_Counter_FreeRunning16bit
        subd    MinimumTimerCountBeforeMainloopCanContinue2
        cpd     #$ABE
        bcs     loc_9B1D
        ldd     TCNT_Counter_FreeRunning16bit
        std     MinimumTimerCountBeforeMainloopCanContinue2
        jmp     MainProgramLoop

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9B32:
        ldab    byte_8845
        ldaa    <PIA2_Buffer_t3
        bita    #1
        beq     loc_9B41
        subb    #3
        bcc     loc_9B41
        ldab    #0

loc_9B41:
        cmpb    <TpsVolts_Minus_LowestSessionTpsVolts
        bcc     loc_9B5B
        ldab    UNe_64AD
        cmpb    byte_8846
        bcc     loc_9B5E
        ldaa    <Counter_MainLoop
        bita    #7
        bne     loc_9B59
        incb
        beq     loc_9B59
        stab    UNe_64AD

loc_9B59:
        bra     loc_9BAE

loc_9B5B:
        clr     UNe_64AD

loc_9B5E:
        brclr   <IPL1 $40 loc_9BAE
        ldab    <KeyOnOrEngineRunningTime
        cmpb    byte_884C
        bcs     loc_9BAE
        brclr   <BitFlags2D 4 loc_9B7D
        ldaa    <EngineRpm_HB
        cmpa    #$20
        bcc     loc_9BAE
        brset   <StartupSwitchMirror1 $80 loc_9BAE
        brclr   <StartupSwitchMirror1 $40 loc_9BAE
        bra     loc_9BB5

loc_9B7D:
        brset   <BitFlags68_t3 8 loc_9BAE
        ldab    <CoolantTemp
        cmpb    byte_8847
        bhi     loc_9BAE
        ldx     <EngineRpm_HB
        cpx     word_8848
        bcc     loc_9BAE
        cpx     word_884A
        bcc     loc_9BBC
        cpx     word_8842
        bcc     loc_9B9F
        ldab    byte_8844
        stab    STe_64AE

loc_9B9F:
        ldab    STe_64AE
        beq     loc_9BB5
        ldaa    <Counter_MainLoop
        bita    #7
        bne     loc_9BAE
        decb
        stab    STe_64AE

loc_9BAE:
        sei
        ldaa    <PIA2_Buffer_t3
        oraa    #1
        bra     loc_9BBA

loc_9BB5:
        sei
        ldaa    <PIA2_Buffer_t3
        anda    #$FE

loc_9BBA:
        staa    <PIA2_Buffer_t3

loc_9BBC:
        cli
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9BBE:
        brset   <PIA2_Buffer_t3 1 loc_9BDB
        brclr   <IPL1 $40 loc_9BDB
        brclr   <BitFlags2D 4 loc_9BDB
        ldaa    Counter_ACControl1
        inca
        beq     loc_9BD8
        staa    Counter_ACControl1
        cmpa    byte_884D
        bcs     loc_9BDB

loc_9BD8:
        bset    <BitFlags2D 2

loc_9BDB:
        ldab    <ACClutchToggleVar
        ldaa    <BitFlags68_t3
        lsra
        eora    <BitFlags68_t3
        bita    #$20
        beq     loc_9C14
        brclr   <BitFlags68_t3 $20 loc_9BFF
        cmpb    #$30
        bcs     loc_9BF4
        bclr    <ACClutchToggleVar 7
        bset    <BitFlags68_t3 $40

loc_9BF4:
        ldaa    <Counter_MainLoop
        bita    #$1F
        bne     locret_9C29
        addb    #8
        bcc     loc_9C27
        rts

loc_9BFF:
        brclr   <ACClutchToggleVar 7 loc_9C0A
        tba
        anda    #7
        cmpa    #5
        bls     loc_9C11

loc_9C0A:
        cmpb    #$B8
        bcs     loc_9BF4
        bclr    <BitFlags68_t3 $40

loc_9C11:
        clrb
        bra     loc_9C27

loc_9C14:
        brset   <ACClutchToggleVar 7 loc_9C1B
        incb
        stab    <ACClutchToggleVar

loc_9C1B:
        brset   <BitFlags68_t3 $40 loc_9BF4
        cmpb    #$60
        bcs     loc_9BF4
        andb    #7
        orab    #$60

loc_9C27:
        stab    <ACClutchToggleVar

locret_9C29:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9C2A:
        ldaa    <DRBPointer1
        cmpa    #$A
        bne     loc_9C34
        bset    <PIA2_Buffer_t3 $10
        rts

loc_9C34:
        cmpa    #$18
        bne     loc_9C81
        ldaa    <DRBSerialMode
        bita    #$30
        bne     loc_9C81
        ldaa    <TimerOverflowsBetweenCamPulses
        cmpa    #$50
        bls     loc_9C73
        ldaa    <DRBPointer2
        tab
        anda    #$F
        pshb
        lsrb
        lsrb
        lsrb
        lsrb
        comb
        andb    #$F
        cba
        pulb
        bne     loc_9C73
        bset    <BitFlags2D $10
        tst     Counter_MainLoop
        bne     loc_9C67
        deca
        beq     loc_9C73
        andb    #$F0
        addb    #$10
        aba
        staa    <DRBPointer2

loc_9C67:
        ldaa    #$E1
        jsr     SerialOutput1a
        sei
        ldaa    <PIA2_Buffer_t3
        anda    #$EF
        bra     loc_9CB8

loc_9C73:
        clra
        staa    <DRBPointer1
        staa    <ATMOffset
        bclr    <BitFlags2D $10
        bclr    <DRBSerialMode $30
        jsr     SerialOutput1a

loc_9C81:
        ldx     #$5B
        ldaa    <CoolantTemp
        cmpa    #$8F
        bcc     loc_9C8D
        ldx     #$5B

loc_9C8D:
        ldab    #4
        ldaa    <BatteryVolts
        cmpa    #$B2
        brset   <BitFlags23 4 loc_9CA2
        bcc     loc_9CA6
        cpx     #$5B
        bne     loc_9CA6
        ldab    #$B
        bra     loc_9CA6

loc_9CA2:
        bcs     loc_9CA6
        ldab    #3

loc_9CA6:
        sei
        ldaa    <PIA2_Buffer_t3
        anda    #$EF
        cmpb    <Counter_TimerPastHalfwayBetweenCamPulses
        bhi     loc_9CB8
        cpx     <KeyOnOrEngineRunningTime
        bhi     loc_9CB8
        oraa    #$10
        bclr    <Ram_80 $FF

loc_9CB8:
        staa    <PIA2_Buffer_t3
        cli
        brclr   <IPL1 $40 locret_9CC8
        ldab    <KeyOnOrEngineRunningTime
        cmpb    #4
        bcs     locret_9CC8
        bset    <BitFlags23 4

locret_9CC8:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9CC9:
        brclr   <IPL1 $40 loc_9D3F
        ldaa    TL_ConfigurationFlags2
        bita    #2
        beq     locret_9D4B
        ldaa    <InjectorPulsewidth_HB
        ldab    <EngineRpm_HB
        mul
        std     Temp0
        ldaa    <BatteryVolts
        ldab    byte_8863
        mul
        subd    word_885F
        bcc     loc_9CEA
        ldd     #0

loc_9CEA:
        brclr   <BitFlags27 8 loc_9CF4
        brclr   <PIA1_Buffer_t3 $80 loc_9D32
        bra     loc_9D00

loc_9CF4:
        brclr   <PIA2_Buffer_t3 8 loc_9D32
        subd    word_8861
        bcc     loc_9D00
        ldd     #0

loc_9D00:
        cpd     Temp0
        bls     locret_9D4B
        brset   <BitFlags2D $40 loc_9D16
        ldaa    <BatteryVolts
        cmpa    byte_8864
        bls     locret_9D4B
        bset    <BitFlags2D $40
        bra     loc_9D24

loc_9D16:
        ldaa    <BatteryVolts
        ldab    byte_8864
        addb    #3
        bcc     loc_9D21
        ldab    #$FF

loc_9D21:
        cba
        bls     locret_9D4B

loc_9D24:
        brclr   <BitFlags27 8 loc_9D2D
        bclr    <PIA1_Buffer_t3 $80
        bra     locret_9D4B

loc_9D2D:
        bclr    <PIA2_Buffer_t3 8
        bra     locret_9D4B

loc_9D32:
        cpd     Temp0
        bls     loc_9D3F
        ldaa    <BatteryVolts
        cmpa    byte_8864
        bhi     locret_9D4B

loc_9D3F:
        brclr   <BitFlags27 8 loc_9D48
        bset    <PIA1_Buffer_t3 $80
        bra     locret_9D4B

loc_9D48:
        bset    <PIA2_Buffer_t3 8

locret_9D4B:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9D4C:
        ldaa    byte_8A3B
        bita    #8
        bne     loc_9D56
        jmp     loc_9E32

loc_9D56:
        brset   <IPL1 $40 loc_9D66
        ldaa    <CoolantTemp
        cmpa    byte_8A9D
        bcc     loc_9D75
        bset    <BitFlags6d_t3 $80
        bra     loc_9D75

loc_9D66:
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    byte_8A9E
        bcs     loc_9D75
        brset   <BitFlags6d_t3 $80 loc_9D75
        brset   <BitFlags29 $40 loc_9D78

loc_9D75:
        jmp loc_9DD7

loc_9D78:
        ldaa    <b5C_IPL1_t3
        bne loc_9DD7
        ldaa    <MapVolts
        cmpa    byte_8A9F
        bcs     loc_9DD7
        ldx     <EGRVar3_ErrorCodeBufferHB
        brset   <BitFlags6d_t3 $40 loc_9DF5
        cpx     word_8AA7
        bcc     loc_9DE6
        ldaa    <MapValue
        cmpa    byte_8AA3
        bcs     loc_9DD7
        cmpa    byte_8AA2
        bcc     loc_9DD7
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        cmpa    byte_8AA1
        bcs     loc_9DD7
        cmpa    byte_8AA0
        bcc     loc_9DD7
        ldaa    <EngineRpm_HB
        cmpa    byte_8AA5
        bcs     loc_9DD7
        cmpa    byte_8AA4
        bcc     loc_9DD7
        ldaa    <Counter_O2SensorFeedbackCount_Signed
        cmpa    byte_8AA6
        bcc     loc_9DD7
        inx
        stx     <EGRVar3_ErrorCodeBufferHB
        bset    <BitFlags6d_t3 $10
        ldab    byte_8AAF
        suba    <EGRVar5_EGR_Temp_1
        bcs     loc_9DCB
        mul
        adca    #0
        bra     loc_9DD0

loc_9DCB:
        nega
        mul
        adca    #0
        nega

loc_9DD0:
        adda    <EGRVar5_EGR_Temp_1
        staa    <EGRVar5_EGR_Temp_1
        jmp     loc_9E6D

loc_9DD7:
        ldx     #0
        stx     <EGRVar3_ErrorCodeBufferHB
        bclr    <BitFlags6d_t3 $50
        ldaa    <Counter_O2SensorFeedbackCount_Signed
        staa    <EGRVar5_EGR_Temp_1
        jmp     loc_9E6D

loc_9DE6:
        ldx     #0
        bset    <BitFlags6d_t3 $40
        bclr    <BitFlags6d_t3 $10
        ldaa    <EGRVar5_EGR_Temp_1
        staa    <EGRVar6
        bra     loc_9DFA

loc_9DF5:
        cpx     word_8AB1
        bcc     loc_9E3D

loc_9DFA:
        inx
        stx     <EGRVar3_ErrorCodeBufferHB
        ldaa    <MapValue
        cmpa    byte_8AAD
        bcs     loc_9DD7
        cmpa    byte_8AAE
        bcc     loc_9DD7
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        cmpa    byte_8AAB
        bcs     loc_9DD7
        cmpa    byte_8AAC
        bcc     loc_9DD7
        ldaa    <EngineRpm_HB
        cmpa    byte_8AA9
        bcs     loc_9DD7
        cmpa    byte_8AAA
        bcc     loc_9DD7
        ldaa    <Counter_O2SensorFeedbackCount_Signed
        cmpa    <EGRVar6
        bcs     loc_9E6D
        staa    <EGRVar6
        suba    <EGRVar5_EGR_Temp_1
        staa    <EGRVar7
        cmpa    byte_8AB0
        bcs     loc_9E6D

loc_9E32:
        clr     EGRVar1_ErrorCodeCounter
        bset    <BitFlags6d_t3 $80
        bclr    <BitFlags6d_t3 $70
        bra     loc_9E6D

loc_9E3D:
        ldx     #0
        stx     <EGRVar3_ErrorCodeBufferHB
        ldab    <BitFlags6d_t3
        andb    #$AF
        ldaa    <EGRVar1_ErrorCodeCounter
        inca
        staa    <EGRVar1_ErrorCodeCounter
        cmpa    byte_8AB3
        bcs     loc_9E5F
        orab    #$20
        pshb
        ldd     #$2E81
        jsr     ThrowNonCriticalError_
        bcc     loc_9E5E
        bset    <b5D_IPL2_t3 8

loc_9E5E:
        pulb

loc_9E5F:
        ldaa    <EGRVar8
        inca
        staa    <EGRVar8
        cmpa    byte_8A9C
        bcs     loc_9E6B
        orab    #$80

loc_9E6B:
        stab    <BitFlags6d_t3

loc_9E6D: 
        brset   <BitFlags6d_t3 $40 loc_9ECB
        ldaa    <Ram_CC
        beq     loc_9E78
        dec     Ram_CC

loc_9E78:
        brclr   <BitFlags66_t3 $80 loc_9EC2
        brset   <BitFlags66_t3 $40 loc_9EC2
        ldaa    byte_8855
        brset   <PIA2_Buffer_t3 2 loc_9E8E
        suba    byte_8856
        bcc     loc_9E8E
        ldaa    #0

loc_9E8E:
        cmpa    <EngineRpm_HB
        bcs     loc_9EC2
        ldaa    <CoolantTemp
        cmpa    byte_8851
        bcs     loc_9EC2
        ldaa    <MapValue
        brset   <PIA2_Buffer_t3 2 loc_9EA5
        suba    byte_884F
        bcc     loc_9EA5
        clra

loc_9EA5:
        cmpa    byte_8850
        bcs     loc_9EC2
        ldaa    <BaroPressure
        suba    byte_8852
        bcc     loc_9EB2
        clra

loc_9EB2:
        cmpa    <MapValue
        bcc     loc_9ECF
        ldaa    <BaroPressure
        suba    byte_8854
        bcc     loc_9EBE
        clra

loc_9EBE:
        cmpa    <MapValue
        bcc     locret_9EDB

loc_9EC2:
        brclr   <PIA2_Buffer_t3 2 loc_9ECB
        ldaa    byte_8853
        staa    <Ram_CC

loc_9ECB:
        bclr    <PIA2_Buffer_t3 2
        rts

loc_9ECF:
        brset   <PIA2_Buffer_t3 2 loc_9ED8
        ldaa    byte_8853
        staa    <Ram_CC

loc_9ED8:
        bset    <PIA2_Buffer_t3 2

locret_9EDB:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9EDC:
        brset   <IPL1 $40 loc_9EE6
        brset   <BitFlags6a_t3 4 loc_9EF3
        bra     loc_9EF8

loc_9EE6:
        brset   <BitFlags6a_t3 $40 locret_9F30
        ldd     word_B610
        cpd     #$5AA5
        beq     loc_9EF8

loc_9EF3:
        bclr    <PIA1_Buffer_t3 8
        bra     loc_9EFB

loc_9EF8:
        bset    <PIA1_Buffer_t3 8

loc_9EFB:
        brset   <IPL1 $80 loc_9F02
        jmp     loc_9FB2

loc_9F02:
        brset   <BitFlags6a_t3 $40 locret_9F30
        brclr   <BitFlags6a_t3 $20 loc_9F31
        jsr     sub_9FD5
        stab    DRBOffsetStored_LB
        inc     DRBOffsetStored_HB
        bset    <BitFlags6a_t3 $40
        bclr    <BitFlags6a_t3 $20
        sei
        bclr    <IPL1 $80
        cli
        cpd     word_8B56
        bcs     loc_9F27
        bset    <BitFlags2f $40

loc_9F27:
        cpd     word_8AB4
        bne     locret_9F30
        bset    <BitFlags6a_t3 $10

locret_9F30:
        rts

loc_9F31:
        ldx     #$1C
        ldaa    #$30

loc_9F36:
        brclr   0,x $FF loc_9F44
        cmpa    0,x
        beq     loc_9F94
        dex
        cpx     #$15
        bcc     loc_9F36

loc_9F44:
        ldd     #0
        std     Temp4
        staa    DRBOffsetStored_HB
        ldx     #$B600
        ldy     #$B60E

loc_9F54:
        ldd     0,x
        subd    0,y
        cpd     #1
        bne     loc_9F70
        ldd     0,x
        cpd     Temp4
        bcs     loc_9F70
        std     Temp4
        pshx
        pula
        pula
        staa    DRBOffsetStored_HB

loc_9F70:
        cpx     #$B60E
        beq     loc_9F87
        inx
        inx
        cpy     #$B60E
        bne     loc_9F81
        ldy     #$B5FE

loc_9F81:
        iny
        iny
        bra     loc_9F54

loc_9F87:
        ldd     Temp4
        bne     loc_9F9A
        ldd     #$3003
        jsr     ThrowNonCriticalError_
        bcc     locret_9F99

loc_9F94:
        sei
        bclr    <IPL1 $80
        cli

locret_9F99:
        rts

loc_9F9A:
        ldaa    DRBOffsetStored_HB
        adda    #2
        cmpa    #$10
        bne     loc_9FA5
        ldaa    #0

loc_9FA5:
        staa    DRBOffsetStored_HB
        jsr     sub_9FD5
        staa    DRBOffsetStored_LB
        bset    <BitFlags6a_t3 $60

locret_9FB1:
        rts

loc_9FB2:
        brclr   <BitFlags6a_t3 $10 locret_9FB1
        brset   <BitFlags6a_t3 $40 locret_9FB1
        ldd     #$105A
        brclr   <BitFlags6a_t3 $20 loc_9FCB
        inca
        comb
        bclr    <BitFlags6a_t3 $30
        bset    <BitFlags6a_t3 $40
        bra     loc_9FCE

loc_9FCB:
        bset    <BitFlags6a_t3 $60

loc_9FCE:
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9FD5:
        ldx     #$B600
        ldab    DRBOffsetStored_HB
        subb    #2
        bpl     loc_9FE1
        ldab    #$E

loc_9FE1:
        abx
        ldd     0,x
        addd    #1
        bcc     locret_9FEC
        ldd     #$FFFF

locret_9FEC:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_9FED:
        ldaa    TL_ConfigurationFlags2
        bita    #$80
        bne loc_9FF7

loc_9FF4:
        jmp loc_A09B

loc_9FF7:
        brset   <StartupSwitchMirror1 1 loc_A078
        ldab    <b5d_IPL2
        bitb    #$80
        beq     loc_A007
        bita    #$20
        bne     loc_A078
        bra     loc_9FF4

loc_A007:
        ldaa    byte_8868
        brset   <BitFlags2a $40 loc_A011
        adda    byte_8869

loc_A011:
        cmpa    <VehicleSpeedx8_Scaled
        bcc     loc_A075
        bset    <BitFlags2a $40
        ldaa    <CoolantTemp
        cmpa    byte_8865
        bcs     loc_A078
        ldaa    byte_886B
        brset   <PIA1_Buffer_t3 $10 loc_A028
        adda    #4

loc_A028:
        cmpa    <ScaledDistPWForCruiseControl
        bcs     loc_A078
        brclr   <BitFlags68_t3 $10 loc_A078
        ldaa    <EngineRpm_HB
        cmpa    byte_8867
        bcs     loc_A04B
        brclr   <Ram_D0 $FF loc_A04B
        ldaa    <Counter_MainLoop
        bita    #7
        bne     loc_A046
        dec     Ram_D0
        beq     loc_A04B

loc_A046:
        ldx     #$889A
        bra     loc_A051

loc_A04B:
        ldx     #$8883
        clr     Ram_D0

loc_A051:
        ldaa    <EngineRpm_HB
        jsr     Lookup4ByteTable
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        cba
        bcs     loc_A089
        ldx     #$886C
        ldaa    <EngineRpm_HB
        jsr     Lookup4ByteTable
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        cba
        bcc     loc_A06E
        brclr   <PIA1_Buffer_t3 $10 loc_A09B
        bra     loc_A07B

loc_A06E:
        ldaa    byte_8866
        staa    <Ram_D0
        bra     loc_A07B

loc_A075:
        bclr    <BitFlags2a $40

loc_A078:
        clr     Ram_D0

loc_A07B:
        ldaa    byte_886A
        staa    <Ram_D1

loc_A080:
        bset    <PIA1_Buffer_t3 $10
        clr     Ram_D3

loc_A086:
        jmp     loc_A178

loc_A089:
        ldaa    <Ram_D1
        beq     loc_A098
        ldab    <Counter_MainLoop
        bitb    #7
        bne     loc_A080
        deca
        staa    <Ram_D1
        bne     loc_A080

loc_A098:
        bclr    <PIA1_Buffer_t3 $10

loc_A09B:
        ldaa    TL_ConfigurationFlags2
        bita    #$40
        bne     loc_A0A5
        jmp     locret_A136

loc_A0A5:
        ldaa    <Counter_MainLoop
        bita    #1
        bne     loc_A0B5
        ldaa    <Ram_D3
        cmpa    byte_88BA
        beq     loc_A0B5
        inca
        staa    <Ram_D3

loc_A0B5:
        ldaa    <PTU_MapTemp
        staa    Temp5
        ldaa    <Counter_MainLoop
        anda    byte_88B2
        bne     loc_A0C5
        ldaa    <MapValue
        staa    <PTU_MapTemp

loc_A0C5:
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        beq     loc_A086
        staa    Temp3
        ldaa    <CoolantTemp
        cmpa    byte_88B1
        bcs     loc_A086
        brclr   <BitFlags68_t3 $10 loc_A086
        brclr   <BitFlags66_t3 $80 loc_A086
        brset   <StartupSwitchMirror1 $20 loc_A086
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    byte_88B3
        bcc     loc_A0F5
        ldaa    <MapValue
        suba    Temp5
        bcs     loc_A0F5
        cmpa    byte_88B4
        bcs     loc_A124
        jmp     loc_A178

loc_A0F5:
        ldaa    Temp5
        suba    <MapValue
        bcs     loc_A124
        staa    Temp5
        ldx     #$88B6
        brset   <BitFlags2a $20 loc_A11B
        brset   <BitFlags2a $10 loc_A11A
        ldaa    Temp3
        cmpa    byte_88B5
        bcs     loc_A117
        bset    <BitFlags2a $20
        bra     loc_A11B

loc_A117:
        bset    <BitFlags2a $10

loc_A11A:
        inx

loc_A11B:
        ldab    Temp5
        cmpb    0,x
        bcc     loc_A178
        bra     loc_A127

loc_A124:
        bclr    <BitFlags2a $30

loc_A127:
        ldaa    <Counter_PartThrottleUnlock
        cmpa    #1
        bls     loc_A137
        ldab    <Counter_MainLoop
        bitb    #7
        bne     locret_A136
        deca
        staa    <Counter_PartThrottleUnlock

locret_A136:
        rts

loc_A137:
        ldx     #$88D9
        brclr   <PIA1_Buffer_t3 $20 loc_A141
        ldx     #$88BB

loc_A141:
        stx     Temp4
        bsr     sub_A182
        bcc     loc_A178
        ldx     Temp4
        ldab    #$F
        abx
        bsr     sub_A182
        bcs     loc_A178
        ldaa    <Counter_PartThrottleUnlock
        beq     loc_A168
        ldaa    TL_ConfigurationFlags2
        bita    #$80
        beq     loc_A164
        ldaa    <Ram_D3
        cmpa    byte_88BA
        bcs     locret_A136

loc_A164:
        bclr    <PIA1_Buffer_t3 $20
        rts

loc_A168:
        ldaa    <VehicleSpeedx8_Scaled
        ldab    byte_88B8
        cmpa    byte_88B3
        bcc     loc_A175
        ldab    byte_88B9

loc_A175:
        stab    <Counter_PartThrottleUnlock
        rts

loc_A178:
        clr     Counter_PartThrottleUnlock
        bset    <PIA1_Buffer_t3 $20
        bclr    <BitFlags2a $30
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A182:
        ldaa    <VehicleSpeedx8_Scaled
        jsr     Lookup4ByteTable
        ldaa    Temp3
        cba
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A18C:
        ldaa    TL_ConfigurationFlags2
        bita    #$20
        beq     locret_A19E
        ldaa    TL_CONF01
        bita    #1
        beq     locret_A19E
        brclr   <Counter_MainLoop 2 loc_A19F

locret_A19E:
        rts

loc_A19F:
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    #$82
        bcc     loc_A1D0
        cmpa    byte_88F7
        bcs     loc_A1D0
        brset   <BitFlags2a 4 loc_A1D0
        ldaa    <ScaledDistPWForCruiseControl
        cmpa    TL_TL_88E4
        bcc     loc_A1D0
        cmpa    byte_88F9
        bcs     loc_A1D0
        ldab    <Counter_MainLoop
        bne     loc_A1D3
        ldab    <Ram_D0
        incb
        beq     loc_A1CA
        stab    <Ram_D0
        cmpb    byte_88FA
        bcs     loc_A1D3

loc_A1CA:
        cmpa    <Ram_0C
        bcc     loc_A1D0
        staa    <Ram_0C

loc_A1D0:
        clr     Ram_D0

loc_A1D3:
        ldaa    <EngineRpm_HB
        cmpa    #$F
        bcs     loc_A202
        ldab    <ScaledDistPWForCruiseControl
        subb    <PTU_MapTemp
        bcc     loc_A1E0
        negb

loc_A1E0:
        cmpb    byte_88FB
        bcs     loc_A1ED
        bset    <BitFlags2a 4
        clr     Ram_D1
        bra     loc_A211

loc_A1ED:
        brclr   <BitFlags2a 4 loc_A205
        cmpb    byte_88FC
        bcc     loc_A205
        ldaa    <Ram_D1
        inca
        beq     loc_A202
        staa    <Ram_D1
        cmpa    byte_88FD
        bcs     loc_A208

loc_A202:
        bclr    <BitFlags2a 4

loc_A205:
        clr     Ram_D1

loc_A208:
        ldaa    <Counter_MainLoop
        lsra
        lsra
        bita    byte_88FE
        bne     loc_A215

loc_A211:
        ldaa    <ScaledDistPWForCruiseControl
        staa    <PTU_MapTemp

loc_A215:
        brset   <IPL1 $40 loc_A21F
        brset   <BitFlags6a_t3 4 loc_A21F
        bra     loc_A27C

loc_A21F:
        brclr   <BitFlags66_t3 $80 loc_A270
        brclr   <BitFlags66_t3 $40 loc_A22E
        ldaa    <EngineRpm_HB
        cmpa    byte_88FF
        bcc     loc_A270

loc_A22E:
        ldaa    <ScaledDistPWForCruiseControl
        suba    <Ram_0C
        bcs     loc_A270
        cmpa    byte_8900
        bcs     loc_A270
        ldx     #$8901
        ldaa    <MapValue
        jsr     sub_E68D
        ldaa    <EngineRpm_HB
        cba
        bcc     loc_A256
        brset   <PIA1_Buffer_t3 $20 loc_A270
        subb    byte_890A
        bcc     loc_A251
        ldab    #0

loc_A251:
        cba
        bcc     loc_A262
        bra     loc_A270

loc_A256:
        ldaa    <Ram_D3
        inca
        beq     loc_A262
        staa    <Ram_D3
        cmpa    byte_890B
        bcs     loc_A276

loc_A262:
        ldaa    <Counter_PartThrottleUnlock
        inca
        beq     loc_A276
        staa    <Counter_PartThrottleUnlock
        cmpa    byte_890C
        bhi     loc_A276
        bra     loc_A27C

loc_A270:
        clr     Ram_D3
        clr     Counter_PartThrottleUnlock

loc_A276:
        ldab    <PIA1_Buffer_t3
        orab    #$20
        bra     loc_A280

loc_A27C:
        ldab    <PIA1_Buffer_t3
        andb    #$DF

loc_A280:
        stab    <PIA1_Buffer_t3
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A283:
        ldaa    TL_ConfigurationFlags2
        bita    #8
        beq     locret_A2A7
        ldaa    <CoolantTemp
        cmpa    byte_8858
        bcc     loc_A2A1
        cmpa    byte_8857
        bcs     loc_A29A
        brset   <BitFlags2a $80 loc_A2A1

loc_A29A:
        bclr    <BitFlags2a $80
        bclr    <PIA2_Buffer_t3 $20
        rts

loc_A2A1:
        bset    <BitFlags2a $80
        bset    <PIA2_Buffer_t3 $20

locret_A2A7:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A2A8:
        ldaa    TL_ConfigurationFlags2
        bita    #$10
        beq     locret_A2BA
        brset   <BitFlags29 $40 loc_A2B7
        bclr    <PIA2_Buffer_t3 4
        rts
loc_A2B7:
        bset    <PIA2_Buffer_t3 4
locret_A2BA:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A2BB:
        ldaa    TL_CONF01
        bita    #8
        bne     locret_A326
        ldaa    TL_ConfigurationFlags2
        bita    #4
        beq     locret_A326
        brclr   <IPL1 $40 loc_A316
        ldaa    <Counter_MainLoop
        anda    #$7F
        bne     locret_A326
        brset   <b5C_IPL1_t3 2 loc_A309
        ldaa    <BitFlags27
        bita    #$C0
        beq     loc_A2E1
        brclr   <PIA2_Buffer_t3 1 loc_A309

loc_A2E1:
        ldx     #$885B
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    byte_8859
        bcc     loc_A2FB
        cmpa    byte_885A
        bcs     loc_A2F4
        brset   <BitFlags2a 8 loc_A2FB

loc_A2F4:
        inx
        inx
        bclr    <BitFlags2a 8
        bra     loc_A2FE

loc_A2FB:
        bset    <BitFlags2a 8

loc_A2FE:
        brset   <PIA1_Buffer_t3 $80 loc_A303
        inx

loc_A303:
        ldab    0,x
        cmpb    <CoolantTemp
        bcc     loc_A316

loc_A309:
        brclr   <PIA1_Buffer_t3 $80 loc_A31F
        ldaa    #7
        staa    <Timer_MinimumFanRun
        bclr    <PIA1_Buffer_t3 $80
        bra     locret_A326

loc_A316:
        ldaa    <Timer_MinimumFanRun
        bne     loc_A31F
        bset    <PIA1_Buffer_t3 $80
        bra     locret_A326

loc_A31F:
        ldaa    <Timer_MinimumFanRun
        beq     locret_A326
        deca
        staa    <Timer_MinimumFanRun

locret_A326:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A327:
        brclr   <IPL1 $40 loc_A334
        ldaa    <Timer_AisChanges
        inca
        beq     loc_A337
        staa    <Timer_AisChanges
        bra     loc_A337

loc_A334:
        clr     Timer_AisChanges

loc_A337:
        brclr   <BitFlags27 2 loc_A342
        brset   <StartupSwitchMirror1 1 loc_A342
        bclr    <BitFlags68_t3 $80

loc_A342:
        brset   <BitFlags68_t3 $80 loc_A34F
        brclr   <BitFlags6d_t3 8 loc_A352
        ldaa    #$30
        jmp     loc_A3DF

loc_A34F:
        jmp     loc_A3E4

loc_A352:
        ldx     #$874B
        brset   <BitFlags68_t3 $10 loc_A3B6
        ldaa    <DRBPointer1
        cmpa    #$19
        beq     loc_A371
        brclr   <BitFlags6d_t3 1 loc_A381
        ldd     <TargetIdleSpeedHB
        subd    #1
        bitb    #$3F
        bne     loc_A3E2
        bclr    <BitFlags6d_t3 1
        bra     loc_A3E2

loc_A371:
        brset   <DRBSerialMode $20 loc_A3E4
        clr     DRBPointer1
        ldaa    <DRBPointer2
        ldab    #$FF
        bset    <BitFlags6d_t3 1
        bra     loc_A3E0

loc_A381:
        brclr   <BitFlags2D 4 loc_A393
        brclr   <IPL1 $40 loc_A393
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    #8
        bcs     loc_A393
        ldaa    #$70
        bra     loc_A3DF

loc_A393:
        ldaa    byte_876A
        brset   <BitFlags2a 1 loc_A3DF
        brset   <b5C_IPL1_t3 2 loc_A3DF
        brclr   <BitFlags27 2 loc_A3B3
        brset   <StartupSwitchMirror1 1 loc_A3B3
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    byte_8841
        bcc     loc_A3B3
        ldaa    byte_8840
        jmp     loc_A3DF

loc_A3B3:
        ldx     #$8738

loc_A3B6:
        ldaa    <CoolantTemp
        jsr     Lookup4ByteTable
        brset   <KeyOnOrEngineRunningTime $FF loc_A3CE
        psha
        ldaa    <KeyOnOrEngineRunningTime
        ldx     #$875E
        jsr     Lookup4ByteTable
        pulb
        aba
        bcc     loc_A3CE
        ldaa    #$FF

loc_A3CE:
        ldab    <BitFlags27
        bitb    #$C0
        beq     loc_A3DF
        brclr   <StartupSwitchMirror1 $40 loc_A3DF
        ldab    byte_8769
        cba
        bcc     loc_A3DF
        tba

loc_A3DF:
        clrb

loc_A3E0:
        lsrd
        lsrd

loc_A3E2:
        std     <TargetIdleSpeedHB

loc_A3E4:
        ldaa    <ATMOffset
        cmpa    #7
        beq     locret_A42E
        cmpa    #$14
        beq     locret_A42E
        brset   <BitFlags36_t3 $20 loc_A3F6
        brset   <IPL1 $40 loc_A41E

loc_A3F6:
        ldaa    <DesiredNewAisPosition
        cmpa    <CurrentAisPosition
        bne     loc_A403
        brset   <BitFlags36_t3 $40 loc_A403
        bclr    <BitFlags36_t3 $20

loc_A403:
        ldaa    <CoolantTemp
        ldx     #$86C2
        jsr     Lookup4ByteTable
        psha
        ldaa    <BaroPressure
        ldx     #$86D5
        jsr     Lookup4ByteTable
        pulb
        aba
        bcc     loc_A41B
        jmp     loc_A59C

loc_A41B:
        jmp loc_A58E

loc_A41E:
        brclr   <b5C_IPL1_t3 $88 loc_A433
        ldaa    byte_8A9B
        staa    <DesiredNewAisPosition
        brclr   <BitFlags68_t3 $40 loc_A42F
        bset    <BitFlags68_t3 $C

locret_A42E:
        rts

loc_A42F:
        bclr    <BitFlags68_t3 $C
        rts

loc_A433:
        jsr sub_A5D4
        dex
        bne loc_A43A
        rts

loc_A43A:
        brclr   <BitFlags68_t3 2 loc_A470
        ldx     #$8794
        ldaa    <BaroPressure
        brclr   <StartupSwitchMirror1 1 loc_A44A
        ldx     #$879E

loc_A44A:
        jsr     sub_E68D
        tba
        brclr   <StartupSwitchMirror1 1 loc_A45C
        nega
        brclr   <BitFlags2D $20 loc_A46C
        bclr    <BitFlags2D $20
        bra     loc_A466

loc_A45C:
        ldab    <EngineRpm_HB
        cmpb    byte_879D
        bcc     loc_A46C
        bset    <BitFlags2D $20

loc_A466:
        jsr     sub_A5BA
        clra
        staa    <Timer_AisChanges

loc_A46C:
        bclr    <BitFlags68_t3 2
        rts

loc_A470:
        brclr   <BitFlags66_t3 $80 loc_A48B
        brset   <BitFlags27 1 loc_A47B
        bclr    <BitFlags68_t3 $80

loc_A47B:
        brclr   <StartupSwitchMirror1 $20 loc_A48F
        ldx     #$86B7
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        jsr     Lookup4ByteTable
        cmpa    <EngineRpm_HB
        bcc     loc_A48F

loc_A48B:
        brclr   <BitFlags66_t3 $20 loc_A492

loc_A48F:
        jmp     loc_A4FF

loc_A492:
        brset   <BitFlags66_t3 4 locret_A42E
        ldab    <Timer_CountdownFromStartRunForAisFeedback
        bne     locret_A42E
        ldaa    <DesiredNewAisPosition
        cmpa    #4
        bcs     loc_A4A3
        bclr    <BitFlags36_t3 $10

loc_A4A3:
        brclr   <BitFlags27 2 loc_A4AB
        brclr   <StartupSwitchMirror1 1 loc_A4C7

loc_A4AB:
        brclr   <BitFlags68_t3 $80 loc_A4C7
        ldx     #$87AE
        brclr   <StartupSwitchMirror1 $10 loc_A4B9
        ldx     #$87B9

loc_A4B9:
        ldaa    <CoolantTemp
        jsr     Lookup4ByteTable
        jsr     sub_A5BA
        clra
        staa    <Timer_AisChanges
        bclr    <BitFlags68_t3 $80

loc_A4C7:
        ldab    byte_87A7
        cmpb    <Timer_AisChanges
        bcc     locret_A4FE
        ldx     #$876B
        ldd     <TargetIdleSpeedHB
        subd    <EngineRpm_HB
        bcc     loc_A4DE
        ldx     #$877E
        ldd     <EngineRpm_HB
        subd    <TargetIdleSpeedHB

loc_A4DE:
        lsrd
        lsrd
        brset   <BitFlags27 1 loc_A4E8
        brset   <BitFlags68_t3 $10 loc_A4E9

loc_A4E8:
        lsrd

loc_A4E9:
        tsta
        beq     loc_A4EE
        ldab    #$FF

loc_A4EE:
        tba
        cmpa    1,x
        bcs     locret_A4FE
        jsr     Lookup4ByteTable
        beq     locret_A4FE
        jsr     sub_A5BA
        clra
        staa    <Timer_AisChanges

locret_A4FE:
        rts

loc_A4FF:
        ldaa    <CoolantTemp
        ldx     #$86F5
        jsr     Lookup4ByteTable
        staa    Temp5
        ldaa    <KeyOnOrEngineRunningTime
        ldx     #$8704
        jsr     Lookup4ByteTable
        adda    Temp5
        bcc     loc_A51A
        jmp     loc_A59C

loc_A51A:
        staa    Temp5
        ldaa    <BaroPressure
        ldx     #$872D
        jsr     Lookup4ByteTable
        ldaa    Temp5
        mul
        lsld
        bcs     loc_A59C
        lsld
        bcs     loc_A59C
        staa    Temp5
        ldx     #$871E
        ldaa    <EngineRpm_HB
        jsr     Lookup4ByteTable
        cmpa    Temp5
        bcs     loc_A542
        staa    Temp5

loc_A542:
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        ldx     #$870F
        jsr     Lookup4ByteTable
        cmpa    Temp5
        bcc     loc_A552
        ldaa    Temp5

loc_A552:
        brset   <BitFlags68_t3 4 loc_A57C
        ldab    byte_86E0
        brset   <BitFlags66_t3 $20 loc_A579
        psha
        ldaa    <CoolantTemp
        cmpa    byte_86E1
        bcs     loc_A578
        ldx     #$86E5
        ldaa    <VehicleSpeedx8_Scaled
        jsr     Lookup4ByteTable
        brclr   <BitFlags68_t3 8 loc_A578
        ldaa    byte_86E3
        mul
        adca    #0
        tab

loc_A578:
        pula

loc_A579:
        aba
        bcs     loc_A59C

loc_A57C:
        brset   <BitFlags68_t3 $10 loc_A585
        adda    byte_86F4
        bcs     loc_A59C

loc_A585:
        brclr   <StartupSwitchMirror1 $40 loc_A58E
        adda    byte_87AD
        bcs     loc_A59C

loc_A58E:
        brset   <BitFlags36_t3 $10 loc_A597
        adda    byte_87AC
        bcs     loc_A59C

loc_A597:
        cmpa    byte_87A8
        bcs     loc_A59F

loc_A59C:
        ldaa    byte_87A8

loc_A59F:
        brset   <BitFlags66_t3 $20 loc_A5B4
        cmpa    <DesiredNewAisPosition
        bcc     loc_A5B1
        ldab    <Counter_MainLoop
        bitb    byte_87AB
        bne     locret_A5B3
        ldaa    <DesiredNewAisPosition
        deca

loc_A5B1:
        staa    <DesiredNewAisPosition

locret_A5B3:
        rts

loc_A5B4:
        bclr    <BitFlags66_t3 $20
        staa    <DesiredNewAisPosition
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A5BA:
        inx
        tsta
        bmi     loc_A5CC
        adda    <DesiredNewAisPosition
        ldab    byte_87A8
        bcs     loc_A5C8
        cba
        bcs     loc_A5C9

loc_A5C8:
        tba

loc_A5C9:
        staa    <DesiredNewAisPosition
        rts

loc_A5CC:
        adda    <DesiredNewAisPosition
        bcs     loc_A5D1
        clra

loc_A5D1:
        staa    <DesiredNewAisPosition
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A5D4:
        ldx     #0
        ldab    <BitFlags68_t3
        andb    #4
        stab    Temp4
        ldab    <BitFlags68_t3
        andb    #$40
        lsrb
        lsrb
        lsrb
        lsrb
        eorb    Temp4
        bne     loc_A608
        brset   <BitFlags68_t3 4 loc_A659
        ldaa    <Timer_AisOrO2Sensor
        beq     loc_A604
        clrb
        stab    <Timer_AisChanges
        deca
        staa    <Timer_AisOrO2Sensor
        bne     loc_A659
        brset   <BitFlags66_t3 $80 loc_A604
        ldaa    byte_8792
        bsr     sub_A5BA

loc_A604:
        bclr    <BitFlags68_t3 8
        rts

loc_A608:
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    byte_884C
        bcs     loc_A659
        eorb    <BitFlags68_t3
        stab    <BitFlags68_t3
        bitb    #4
        bne     loc_A632
        ldaa    byte_86E2
        staa    <Timer_AisOrO2Sensor
        brset   <BitFlags66_t3 $80 loc_A629
        ldaa    byte_8791
        jsr     sub_A5BA
        bset    <BitFlags2f 8

loc_A629:
        ldaa    <Timer_AisOrO2Sensor
        beq     loc_A656
        deca
        staa    <Timer_AisOrO2Sensor
        bra     loc_A656

loc_A632:
        brset   <BitFlags66_t3 $80 loc_A63E
        ldaa    byte_8793
        jsr     sub_A5BA
        bra     loc_A653

loc_A63E:
        ldx     #$86E5
        ldaa    <VehicleSpeedx8_Scaled
        jsr     Lookup4ByteTable
        ldab    byte_86E4
        mul
        tab
        ldaa    <DesiredNewAisPosition
        sba
        bcc     loc_A651
        clra

loc_A651:
        staa    <DesiredNewAisPosition

loc_A653:
        clra
        staa    <Timer_AisOrO2Sensor

loc_A656:
        clra
        staa    <Timer_AisChanges

loc_A659:
        bset    <BitFlags68_t3 8
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A65D:
        brclr   <IPL1 $40 locret_A673
        brset   <BitFlags36_t3 $20 locret_A673
        brset   <BitFlags66_t3 $80 locret_A673
        ldaa    <b5C_IPL1_t3
        bita    #$88
        bne     locret_A673
        ldaa    <TimerOverflowsBetweenCamPulses
        beq     loc_A674

locret_A673:
        rts

loc_A674:
        ldaa    <Timer_DacalCountdown
        lsra
        lsra
        brclr   <StartupSwitchMirror1 $40 loc_A68E
        tst     byte_883D
        bmi     loc_A688
        adda    byte_883D
        bcs     loc_A6C9
        bra     loc_A68E

loc_A688:
        adda    byte_883D
        bcs     loc_A68E
        clra

loc_A68E:
        adda    byte_883C
        bcs     loc_A6C9
        psha
        ldx     #$87C4
        ldaa    <BaroPressure
        jsr     Lookup4ByteTable
        pula
        negb
        sba
        bcc     loc_A6A2
        clra

loc_A6A2:
        brclr   <BitFlags66_t3 4 loc_A6CB
        psha
        ldx     #$87D7
        ldaa    <KeyOnOrEngineRunningTime
        jsr     Lookup4ByteTable
        pula
        aba
        bcs     loc_A6C9
        psha
        ldx     #$87E2
        ldaa    <CoolantTemp
        jsr     Lookup4ByteTable
        pulb
        aba
        bcs     loc_A6C9
        brset   <PIA2_Buffer_t3 1 loc_A6CB
        adda    byte_883B
        bcc     loc_A6CB

loc_A6C9:
        ldaa    #$FF

loc_A6CB:
        ldab    <DistributorFallingEdgePulsewidth_HB
        aslb
        bcs     loc_A6D3
        aslb
        bcc     loc_A6D5

loc_A6D3:
        ldab    #$FF

loc_A6D5:
        mul
        lsld
        bcs     loc_A704
        staa    Temp5
        ldx     #$87F5
        ldaa    <EngineRpm_HB
        jsr     Lookup4ByteTable
        psha
        ldx     #$880F
        ldaa    <CoolantTemp
        jsr     Lookup4ByteTable
        pulb
        mul
        adca    Temp5
        bcs     loc_A704
        staa    Temp5
        ldx     #$8804
        ldaa    <BaroPressure
        jsr     Lookup4ByteTable
        adda    Temp5
        bcc     loc_A706

loc_A704:
        ldaa    #$FF

loc_A706:
        staa    <MAPOffsetForCylTrim
        brset   <BitFlags66_t3 4 loc_A750
        brset   <BitFlags27 1 loc_A714
        brclr   <StartupSwitchMirror1 $10 loc_A74E

loc_A714:
        ldab    <Counter_MainLoop
        bitb    byte_883F
        bne     loc_A74E
        ldab    <KeyOnOrEngineRunningTime
        cmpb    byte_883E
        bcs     loc_A74E
        brclr   <PIA2_Buffer_t3 1 loc_A74E
        ldab    <Timer_CountdownFromStartRunForAisFeedback
        bne     loc_A74E
        ldab    <CoolantTemp
        cmpb    byte_8839
        bcs     loc_A74E
        ldab    <TargetIdleSpeedHB
        subb    <EngineRpm_HB
        bcc     loc_A738
        negb

loc_A738:
        cmpb    byte_883A
        bhi     loc_A74E
        ldab    <Timer_DacalCountdown
        cmpa    <MapValue
        bhi     loc_A746
        incb
        bne     loc_A74A

loc_A746:
        tstb
        beq     loc_A752
        decb

loc_A74A:
        stab    <Timer_DacalCountdown
        bra     loc_A752

loc_A74E:
        bra     locret_A7BB

loc_A750:
        bra     loc_A7BC

loc_A752:
        brset   <BitFlags27 1 loc_A75A
        brclr   <BitFlags68_t3 $10 locret_A7BB

loc_A75A:
        ldaa    <Timer_AisChanges
        cmpa    byte_87A7
        bcs     locret_A7BB
        brset   <StartupSwitchMirror1 $40 loc_A786
        brclr   <BitFlags2f $20 loc_A775
        ldaa    byte_87AC
        staa    <CurrentAisPosition
        staa    <DesiredNewAisPosition
        bclr    <BitFlags2f $20
        bra     locret_A7BB

loc_A775:
        ldaa    <CurrentAisPosition
        cmpa    <DesiredNewAisPosition
        bne     locret_A7BB
        ldaa    <DesiredNewAisPosition
        cmpa    byte_87AC
        beq     locret_A7BB
        bhi     loc_A7B6
        bra     loc_A7B4

loc_A786:
        brclr   <BitFlags2f $20 loc_A79D
        ldaa    byte_87AC
        adda    byte_87AD
        bcc     loc_A794
        ldaa    #$FF

loc_A794:
        staa    <CurrentAisPosition
        staa    <DesiredNewAisPosition
        bclr    <BitFlags2f $20
        bra     locret_A7BB

loc_A79D:
        ldaa    <CurrentAisPosition
        cmpa    <DesiredNewAisPosition
        bne     locret_A7BB
        ldaa    <DesiredNewAisPosition
        ldab    byte_87AC
        addb    byte_87AD
        bcc     loc_A7AF
        ldab    #$FF

loc_A7AF:
        cba
        beq     locret_A7BB
        bhi     loc_A7B6

loc_A7B4:
        inca
        inca

loc_A7B6:
        deca
        staa    <DesiredNewAisPosition
        staa    <CurrentAisPosition

locret_A7BB:
        rts

loc_A7BC:
        ldab    <Timer_CountdownFromStartRunForAisFeedback
        bne     locret_A7BB
        ldab    <Timer_AisChanges
        cmpb    byte_8838
        bcs     locret_A7BB
        ldx     #$881A
        suba    <MapValue
        bcc     loc_A7D2
        nega
        ldx     #$8829

loc_A7D2:
        jsr     Lookup4ByteTable
        jsr     sub_A5BA
        staa    <DesiredNewAisPosition
        cmpa    <CurrentAisPosition
        beq     locret_A7BB
        clr     Timer_AisChanges
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A7E2:
        brset   <BitFlags66_t3 4 locret_A801
        ldaa    <b5C_IPL1_t3
        bita    #$88
        bne     locret_A801
        ldaa    <DesiredNewAisPosition
        oraa    <CurrentAisPosition
        bne     locret_A801
        ldab    <Counter_MainLoop
        bitb    #$7F
        bne     locret_A801
        adda    #2
        staa    <CurrentAisPosition
        staa    <DesiredNewAisPosition
        bset    <BitFlags36_t3 $10
locret_A801:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_A802:
        brclr   <b5C_IPL1_t3 $40 loc_A80E
        bclr    <Counter_Cruise_1 $F
        bset    <Counter_Cruise_1 $E
        bra     loc_A87C

loc_A80E:
        bclr    <Counter_Cruise_1 $F
        brset   <StartupSwitchMirror1 4 loc_A81A
        clrb
        stab    <CruiseSpeedSetpoint
        bra     loc_A885

loc_A81A:
        inc Counter_Cruise_1
        ldd <VehicleSpeed_HB
        lsld
        lsld
        lsld
        aslb
        adca    #0
        staa    Temp0
        cmpa    byte_8918
        bcs     loc_A87C
        inc     Counter_Cruise_1
        ldaa    <EngineRpm_HB
        cmpa    byte_8919
        bcc     loc_A87C
        inc     Counter_Cruise_1
        brset   <StartupSwitchMirror1 $20 loc_A87C
        inc     Counter_Cruise_1
        brset   <BitFlags27 1 loc_A851
        brclr   <StartupSwitchMirror1 $10 loc_A87C
        inc     Counter_Cruise_1
        inc     Counter_Cruise_1
        bra     loc_A8AE

loc_A851:
        inc     Counter_Cruise_1
        ldaa    <TimerOverflowsBetweenCamPulses
        bne     loc_A871
        brclr   <BitFlags2f 2 loc_A865
        brset   <CruiseStatus_1 $80 loc_A87C
        bset    <BitFlags2f 4
        bra     loc_A87C

loc_A865:
        ldab    <ScaledDistPWForCruiseControl
        cmpb    byte_8916
        bcc     loc_A87C
        cmpb    byte_8917
        bcs     loc_A87C

loc_A871:
        inc     Counter_Cruise_1
        brset   <CruiseStatus_1 $80 loc_A8AE
        brclr   <BitFlags24 8 loc_A8AE

loc_A87C:
        brclr   <CruiseStatus_1 $18 loc_A885
        ldaa    Temp0
        staa    <CruiseSpeedSetpoint

loc_A885:
        brset   <CruiseStatus_1 $80 loc_A892
        ldab    <Counter_Cruise_1
        andb    #$F
        ldaa    #$11
        mul
        stab    <Counter_Cruise_1

loc_A892:
        clrb
        stab    <Timer_CruiseDecelerate
        stab    <Counter_Cruise_4
        stab    <CruiseControlVar0
        stab    <Counter_Cruise_2
        stab    <CruiseControlVar6
        stab    <CruiseControlVar1
        bclr    <CruiseStatus_1 $1F
        bset    <CruiseStatus_1 $A0
        bclr    <CruiseStatus_2 $F
        bset    <Timer_CruiseDecelerate $80
        jmp     loc_AA64

loc_A8AE:
        inc Counter_Cruise_1
        ldaa    Temp1_t3
        tab
        eora    PIA2_Buffer_t3_Temp
        anda    #$C0
        beq loc_A913
        brset   <BitFlags6a_t3 1 loc_A913
        bita    #$40
        bne loc_A8C5
        lsrb

loc_A8C5:
        ldaa    #0
        bitb    #$40
        bne     loc_A901
        brset   <CruiseStatus_1 $80 loc_A8F6
        ldaa    Temp0
        psha
        ldd     #$F89
        jsr     ThrowNonCriticalError_
        pula
        staa    Temp0
        ldd     #$F08
        ldx     #$DC
        cmpa    0,x
        beq     loc_A8EC
        inx
        cmpa    0,x
        bne     loc_A913

loc_A8EC:
        cmpb    2,x
        bne     loc_A913
        clr     0,x
        clr     2,x
        bra     loc_A87C

loc_A8F6:
        ldaa    #7
        ldab    Temp1_t3
        bitb    #$C0
        bne     loc_A901
        ldaa    #$7F

loc_A901:
        bita    <Counter_MainLoop
        bne     loc_A913
        ldaa    Temp0
        psha
        ldd     #$F10
        jsr     ThrowNonCriticalError_
        pula
        staa    Temp0

loc_A913:
        inc     Counter_Cruise_1
        brset   <StartupSwitchMirror1 2 loc_A96E
        ldab    <Timer_CruiseDecelerate
        incb
        bne     loc_A920
        decb

loc_A920:
        stab    <Timer_CruiseDecelerate
        brset   <CruiseStatus_1 1 loc_A93F
        brset   <Timer_CruiseDecelerate $80 loc_A949
        cmpb    #4
        bls     loc_A949
        bset    <CruiseStatus_1 $21
        bclr    <CruiseStatus_1 $A
        bset    <CruiseStatus_2 4
        clra
        staa    <Counter_Cruise_4
        staa    <CruiseControlVar0
        bclr    <CruiseStatus_1 4

loc_A93F:
        brset   <CruiseStatus_1 $80 loc_A949
        brset   <CruiseStatus_1 $10 loc_A95C
        bra     loc_A94C

loc_A949:
        jmp     loc_AB74

loc_A94C:
        cmpb    byte_890F
        bls     loc_A949
        bset    <CruiseStatus_1 $10
        bclr    <CruiseStatus_2 3
        ldaa    Temp0
        staa    <CruiseControlVar0

loc_A95C:
        ldab    <CruiseStatus_2
        cmpb    #$A0
        bcs     loc_A949
        ldab    <CruiseControlVar0
        subb    byte_8925
        bcc     loc_A96A
        clrb

loc_A96A:
        stab    <CruiseControlVar0
        bra     loc_A949

loc_A96E:
        brclr   <CruiseStatus_1 1 loc_A9D5
        ldaa    #$7F
        brset   <CruiseStatus_1 $80 loc_A9A8
        brset   <CruiseStatus_2 8 loc_A987
        ldab    <CruiseSpeedSetpoint
        subb    Temp0
        bcc     loc_A987
        cmpb    #$FC
        bcs     loc_A9A8

loc_A987:
        brset   <CruiseStatus_1 $10 loc_A98D
        bra     loc_A9AE

loc_A98D:
        ldaa    <Counter_Cruise_4
        ldab    byte_8924
        addb    #$80
        bmi     loc_A99D
        mul
        adca    <Counter_Cruise_4
        bcs     loc_A9A4
        bra     loc_A9A0

loc_A99D:
        mul
        adca    #0

loc_A9A0:
        cmpa    #$7F
        bls     loc_A9AE

loc_A9A4:
        ldaa    #$7F
        bra loc_A9AE

loc_A9A8:
        bset    <CruiseStatus_2 1
        clrb
        stab    <CruiseControlVar6

loc_A9AE:
        ldab    Temp0
        stab    <CruiseSpeedSetpoint
        staa    Temp2
        jsr     sub_AB3C
        ldab    Temp2
        cba
        bhi     loc_A9C0
        tab

loc_A9C0:
        bclr    <CruiseStatus_1 $91
        bclr    <CruiseStatus_2 8
        bclr    <BitFlags24 8
        clra
        staa    <Counter_Cruise_4
        staa    <Timer_CruiseDecelerate
        staa    <CruiseControlVar0
        staa    <Counter_Cruise_2
        jmp     loc_AA64

loc_A9D5:
        clrb
        stab    <Timer_CruiseDecelerate
        brset   <StartupSwitchMirror1 8 loc_A9DF
        jmp     loc_AAD6

loc_A9DF:
        ldab    <Counter_Cruise_4
        incb
        bne     loc_A9E5
        decb

loc_A9E5:
        stab    <Counter_Cruise_4
        brclr   <CruiseStatus_1 2 loc_A9EE
        jmp     loc_AA80

loc_A9EE:
        brclr   <CruiseStatus_1 $20 loc_A9F5
        jmp     loc_AB1D

loc_A9F5:
        cmpb    #4
        bhi     loc_A9FC
        jmp     loc_AB74

loc_A9FC:
        bset    <CruiseStatus_1 6
        bset    <CruiseStatus_2 4
        clra
        staa    <Counter_Cruise_2
        brclr   <CruiseStatus_1 $80 loc_AA41
        bset    <CruiseStatus_1 $20
        bclr    <CruiseStatus_1 $80
        bclr    <BitFlags24 8
        jsr     sub_AB3C
        staa    Temp2
        ldaa    <CruiseSpeedSetpoint
        suba    Temp0
        bcc     loc_AA22
        tab
        eorb    #$80

loc_AA22:
        bpl     loc_AA29
        asla
        ldaa    #$80
        sbca    #0

loc_AA29:
        adda    #$80
        ldx     #$898F
        jsr     Lookup4ByteTable
        addb    #$80
        addb    Temp2
        bpl     loc_AA7B
        bvc     loc_AA3E
        ldab    #$7F
        bra     loc_AA7B

loc_AA3E:
        clrb
        bra     loc_AA7B

loc_AA41:
        bclr    <CruiseStatus_2 3
        ldaa    <CruiseSpeedSetpoint
        adda    #4
        staa    <CruiseSpeedSetpoint
        ldab    <CruiseControlVar2
        suba    #3
        cmpa    byte_8914
        bhi     loc_AA64
        ldab    byte_891A
        ldaa    <CruiseControlVar2
        bmi     loc_AA64
        aba
        bcs     loc_AA61
        cmpa    #$7F
        bls     loc_AA63

loc_AA61:
        ldaa    #$7F

loc_AA63:
        tab

loc_AA64:
        ldaa    <CruiseSpeedSetpoint
        cmpa    byte_8914
        bls     loc_AA73
        bclr    <CruiseStatus_2 3
        ldaa    byte_8914
        bra     loc_AA79

loc_AA73:
        cmpa    byte_8915
        bcc     loc_AA7B
        clra

loc_AA79:
        staa    <CruiseSpeedSetpoint

loc_AA7B:
        stab    <CruiseControlVar2

loc_AA7D:
        jmp     loc_AB74

loc_AA80:
        brset   <CruiseStatus_1 $20 loc_AA7D
        brset   <CruiseStatus_1 8 loc_AA9F
        cmpb    byte_8910
        bls     loc_AA7D
        bset    <CruiseStatus_1 8
        bset    <CruiseStatus_2 8
        ldaa    Temp0
        adda    byte_8927
        bcc     loc_AA9D
        ldaa    #$FF

loc_AA9D:
        staa    <CruiseControlVar0

loc_AA9F:
        ldaa    Temp0
        cmpa    byte_8914
        bcs     loc_AAAE
        bset    <CruiseStatus_1 $20

loc_AAAA:
        ldab    <CruiseControlVar2
        bra     loc_AB06

loc_AAAE:
        ldab    <CruiseStatus_2
        cmpb    #$A0
        bcs     loc_AA7D
        ldab    <CruiseControlVar0
        subb    byte_8926
        bcc loc_AABC
        clrb

loc_AABC:
        cmpb    byte_8914
        bcc     loc_AAD2
        adda    byte_8928
        bcs     loc_AACF
        cba
        bls     loc_AAD2
        tab
        cmpb    byte_8914
        bls     loc_AAD2

loc_AACF:
        ldab    byte_8914

loc_AAD2:
        stab    <CruiseControlVar0
        bra     loc_AA7D

loc_AAD6:
        bclr    <CruiseStatus_1 2
        ldaa    <CruiseSpeedSetpoint
        beq     loc_AAE0
        bclr    <CruiseStatus_1 $20

loc_AAE0:
        brclr   <CruiseStatus_1 8 loc_AB1D
        ldaa    <Counter_Cruise_4
        cmpa    #$5D
        bhi     loc_AAF4
        bclr    <CruiseStatus_1 8
        bclr    <CruiseStatus_2 8
        stab    <CruiseControlVar0
        bra     loc_AB1D

loc_AAF4:
        ldaa    Temp0
        adda    #4
        suba    <CruiseSpeedSetpoint
        bcc     loc_AAFE
        clra

loc_AAFE:
        ldx     #$89CC
        jsr     Lookup4ByteTable
        orab    #$80

loc_AB06:
        ldaa    Temp0
        staa    <CruiseSpeedSetpoint
        bclr    <CruiseStatus_1 $C
        bclr    <CruiseStatus_2 8
        clra
        staa    <CruiseControlVar0
        staa    <Counter_Cruise_4
        tstb
        bmi     loc_AB1A
        clrb

loc_AB1A:
        jmp     loc_AA64

loc_AB1D:
        clrb
        stab    <Counter_Cruise_4
        ldaa    <CruiseStatus_2
        eora    #4
        bita    #7
        bne     loc_AB74
        ldaa    <Counter_MainLoop
        bne     loc_AB74
        ldab    <Counter_Cruise_2
        incb
        cmpb    byte_891F
        bcs     loc_AB38
        bclr    <CruiseStatus_2 4
        clrb

loc_AB38:
        stab    <Counter_Cruise_2
        bra     loc_AB74

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_AB3C:
        ldaa    <CruiseSpeedSetpoint
        ldx     #$8969
        jsr     Lookup4ByteTable
        bpl     loc_AB48
        ldab    #$7F

loc_AB48:
        stab    Temp1
        ldaa    <MapVolts
        ldx     #$8978
        jsr     Lookup4ByteTable
        ldab    Temp1
        aslb
        mul
        adca    #0
        bpl     loc_AB5E
        ldaa    #$7F

loc_AB5E:
        ldx     #$12
        ldab    <CruiseSpeedSetpoint
        cmpb    byte_8929
        bls     loc_AB69
        dex

loc_AB69:
        adda    0,x
        bpl     locret_AB70
        bvs     loc_AB71
        clra

locret_AB70:
        rts

loc_AB71:
        ldaa    #$7F
        rts

loc_AB74:
        brset   <CruiseStatus_1 $80 loc_AB89
        inc     Counter_Cruise_1
        brclr   <CruiseStatus_1 $18 loc_AB89
        inc     Counter_Cruise_1
        brset   <CruiseStatus_1 8 loc_AB89
        inc     Counter_Cruise_1

loc_AB89:
        ldaa    <CruiseStatus_2
        adda    #$10
        cmpa    #$B0
        bcs     loc_AB93
        anda    #$F

loc_AB93:
        staa    <CruiseStatus_2
        anda    #$F0
        beq     loc_AB9C
        jmp     loc_AE35

loc_AB9C:
        clrb
        brclr   <BitFlags24 $10 loc_ABA4
        jmp     loc_AC80

loc_ABA4:
        ldy     #$3E
        ldx     #$D000
        ldd     #$6DD
        brclr   <TimerOverflowsBetweenSpeedoPulses $FF loc_ABBF
        clrb
        clra
        brset   <TimerOverflowsBetweenSpeedoPulses $40 loc_ABC4
        ldab    #6
        dey
        ldx     #$DDD0

loc_ABBF:
        sei
        jsr     sub_E6C0
        cli

loc_ABC4:
        ldx     <VehicleSpeed_HB
        stx     Temp0
        std     <VehicleSpeed_HB
        brclr   <CruiseStatus_2 2 loc_AC3A
        ldaa    <Counter_Cruise_2
        brclr   <CruiseStatus_2 1 loc_ABE5
        cmpa    byte_8933
        bcc     loc_ABDF
        inca
        staa    <Counter_Cruise_2
        bra     loc_AC3A

loc_ABDF:
        bclr    <CruiseStatus_2 1
        clra
        staa    <Counter_Cruise_2

loc_ABE5:
        cmpa    byte_8932
        bcs     loc_AC3C
        ldab    <CruiseControlVar6
        tba
        bpl     loc_ABF0
        negb

loc_ABF0:
        cmpb    byte_892B
        bcs     loc_AC34
        ldx     #$12
        ldab    <CruiseSpeedSetpoint
        cmpb    byte_8929
        bls     loc_AC00
        dex

loc_AC00:
        ldab    0,x
        adda    2,x
        bvc     loc_AC0B
        asla
        ldaa    #$80
        sbca    #0

loc_AC0B:
        staa    2,x
        cmpa    byte_892C
        bgt     loc_AC24
        cmpa    byte_892D
        bge     loc_AC34
        subb    byte_892F
        cmpb    byte_8931
        bge     loc_AC2F
        ldab    byte_8931
        bra     loc_AC2F

loc_AC24:
        addb    byte_892E
        cmpb    byte_8930
        ble     loc_AC2F
        ldab    byte_8930

loc_AC2F:
        stab    0,x
        clra
        staa    2,x

loc_AC34:
        bclr    <CruiseStatus_2 2
        clra
        staa    <Counter_Cruise_2

loc_AC3A:
        bra     loc_AC66

loc_AC3C:
        inca
        staa    <Counter_Cruise_2
        ldd     <VehicleSpeed_HB
        lsrd
        lsrd
        lsrd
        ldaa    <CruiseSpeedSetpoint
        asla
        asla
        sba
        adda    byte_892A
        bmi     loc_AC5B
        ldab    <CruiseControlVar6
        bpl     loc_AC54
        comb
        incb

loc_AC54:
        cba
        ble     loc_AC66
        staa    <CruiseControlVar6
        bra     loc_AC66

loc_AC5B:
        ldab    <CruiseControlVar6
        bmi     loc_AC61
        comb
        incb

loc_AC61:
        cba
        bge     loc_AC66
        staa    <CruiseControlVar6

loc_AC66:
        ldd     Temp0
        subd    <VehicleSpeed_HB
        bne     loc_AC70
        clr     CruiseControlVar3

loc_AC70:
        std     Temp0
        clra
        ldab    <CruiseControlVar3
        bpl     loc_AC79
        deca

loc_AC79:
        addd    Temp0
        asra
        rorb
        bsr     sub_AC84

loc_AC80:
        stab    <CruiseControlVar3
        bra     loc_AC95

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_AC84:
        lsld
        bcs     loc_AC8D
        tsta
        beq     loc_AC93
        ldab    #$7F
        rts

loc_AC8D:
        cmpa    #$FF
        beq     loc_AC92
        clrb

loc_AC92:
        sec

loc_AC93:
        rorb
        rts

loc_AC95:
        brset   <CruiseStatus_1 $80 loc_ACEF
        ldx     #$8943
        clrb
        ldaa    <CruiseSpeedSetpoint
        brclr   <CruiseStatus_1 $18 loc_ACA5
        ldaa    <CruiseControlVar0

loc_ACA5:
        lsrd
        lsrd
        lsrd
        subd    <VehicleSpeed_HB
        bcc     loc_ACF2
        bclr    <CruiseStatus_1 4
        ldx     #$8934
        coma
        comb
        addd    #1
        stab    Temp0
        tsta
        beq     loc_ACC4
        psha
        ldaa    #$FF
        staa    Temp0
        pula

loc_ACC4:
        lsrd
        lsrd
        brclr   <CruiseStatus_1 $10 loc_ACD4
        ldx     #$89D7
        tsta
        beq     loc_AD08
        ldaa    #$FF
        bra     loc_AD09

loc_ACD4:
        tsta
        bne     loc_ACE9
        cmpb    byte_890D
        bcc     loc_ACE9
        tba
        ldab    Temp0
        cmpa    byte_890E
        bcs     loc_AD08
        ldaa    #5
        bra     loc_ACEB

loc_ACE9:
        ldaa    #$F

loc_ACEB:
        oraa    #$80
        staa    <CruiseControlVar2

loc_ACEF:
        jmp     loc_AE35

loc_ACF2:
        brclr   <CruiseStatus_1 $C loc_ACFB
        ldx     #$895A
        lsrd
        lsrd

loc_ACFB:
        tsta
        beq     loc_AD00
        ldab    #$FF

loc_AD00:
        cmpb    byte_8911
        bcc     loc_AD08
        bclr    <CruiseStatus_1 4

loc_AD08:
        tba

loc_AD09:
        jsr     Lookup4ByteTable
        clra
        tstb
        bpl     loc_AD11
        deca

loc_AD11:
        std     Temp0
        ldx     #$89BD
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        jsr     Lookup4ByteTable
        staa    Temp3
        ldx     #$89AE
        ldd     <VehicleSpeed_HB
        lsld
        lsld
        lsld
        jsr     Lookup4ByteTable
        adda    Temp3
        bcc     loc_AD31
        ldaa    #$FF

loc_AD31:
        staa    Temp3
        clra
        staa    Temp2
        ldab    <CruiseControlVar3
        bpl     loc_AD3D
        deca

loc_AD3D:
        lsld
        lsld
        addd    Temp0
        std     Temp0
        brset   <CruiseStatus_2 4 loc_AD71
        bpl     loc_AD50
        coma
        comb
        addd    #1

loc_AD50:
        tsta
        beq     loc_AD55
        ldab    #$FF

loc_AD55:
        cmpb    byte_891D
        bhi     loc_AD71
        clrb
        ldaa    <CruiseSpeedSetpoint
        lsrd
        lsrd
        lsrd
        subd    <VehicleSpeed_HB
        bpl     loc_AD69
        coma
        comb
        addd    #1

loc_AD69:
        tsta
        bne     loc_AD71
        cmpb    byte_891E
        bls     loc_AD92

loc_AD71:
        clra
        ldab    <CruiseControlVar1
        bpl     loc_AD77
        deca

loc_AD77:
        addd    Temp0
        staa    Temp4
        bpl     loc_AD84
        coma
        comb
        addd    #1

loc_AD84:
        cpd     Temp2
        bcc     loc_AD95
        ldaa    Temp4
        bpl     loc_AD90
        negb

loc_AD90:
        stab    <CruiseControlVar1

loc_AD92:
        jmp loc_AE35

loc_AD95:
        clra
        staa    <CruiseControlVar1
        ldaa    Temp4
        anda    #$80
        ldab    <CruiseControlVar2
        beq     loc_ADA8
        bpl     loc_AD92
        tab
        eorb    <CruiseControlVar2
        bpl     loc_AD92

loc_ADA8:
        ldab    <TpsVolts_Minus_LowestSessionTpsVolts
        tsta
        bpl     loc_ADD7
        oraa    byte_8921
        brclr   <CruiseStatus_1 $10 loc_ADB9
        adda    byte_8923
        bra     loc_AE01

loc_ADB9:
        staa    Temp4
        clra
        cmpb    byte_8912
        bcs     loc_AE01
        ldx     #$89FC
        stx     Temp2
        ldx     #$8A07
        bsr     sub_AE05
        oraa    #$80
        ldab    Temp4
        cba
        bcc     loc_AE01
        bra     loc_AE00

loc_ADD7:
        cmpb    byte_8913
        bcc     loc_AE01
        oraa    byte_8920
        brclr   <CruiseStatus_1 8 loc_ADE8
        adda    byte_8922
        bra     loc_AE01

loc_ADE8:
        brset   <CruiseStatus_1 4 loc_AE01
        staa    Temp4
        ldx     #$89E6
        stx     Temp2
        ldx     #$89F1
        bsr     sub_AE05
        ldab    Temp4
        cba
        bcc     loc_AE01

loc_AE00:
        tba

loc_AE01:
        staa    <CruiseControlVar2
        bra     loc_AE35

sub_AE05:
        clrb
        ldaa    <CruiseSpeedSetpoint
        lsrd
        lsrd
        lsrd
        subd    <VehicleSpeed_HB
        asra
        rorb
        asra
        rorb
        asra
        rorb
        jsr     sub_AC84
        tba
        adda    #$80
        jsr     Lookup4ByteTable
        ldx     Temp2
        staa    Temp2
        ldd     Temp0
        jsr     sub_AC84
        tba
        adda    #$80
        jsr     Lookup4ByteTable
        ldab    Temp2
        mul
        adca    #0
        rts

loc_AE35:
        ldaa    <PIA2_Buffer_t3
        anda    #$3F
        brset   <CruiseStatus_1 $80 loc_AE4E
        ldab    <CruiseControlVar2
        beq     loc_AE50
        bpl     loc_AE52
        brclr   <CruiseStatus_1 $10 loc_AE4E
        ldab    <Counter_Cruise_4
        incb
        beq     loc_AE4E
        stab    <Counter_Cruise_4

loc_AE4E:
        oraa    #$C0

loc_AE50:
        oraa    #$80

loc_AE52:
        bclr    <BitFlags6a_t3 1
        tab
        eorb    <PIA2_Buffer_t3
        andb    #$C0
        beq     loc_AE5F
        bset    <BitFlags6a_t3 1

loc_AE5F:
        staa    <PIA2_Buffer_t3
        ldab    <CruiseControlVar2
        beq     loc_AE71
        lsld
        tstb
        beq     loc_AE6E
        subb    #2
        beq     loc_AE6E
        lsrd

loc_AE6E:
        stab    <CruiseControlVar2
        rts

loc_AE71:
        brclr   <CruiseStatus_2 1 locret_AE78
        bset    <CruiseStatus_2 2

locret_AE78:
        rts

sub_AE79:
        dec     Ram64c3
        beq     loc_AE80
        bra     loc_AEC8

loc_AE80:
        ldaa    byte_8A12
        staa    Ram64c3
        ldx     #$8A13
        ldy     #$64C4
        ldd     <EngineRpm_HB
        subd    UNe_64C1
        lsld
        lsld
        lsld
        addd    #$8000
        jsr     sub_AEFA
        subd    #$8000
        ldx #6

loc_AEA1:
        asra
        rorb
        dex
        bne     loc_AEA1
        bclr    <BitFlags2f 2
        cpd     word_8A15
        blt     loc_AEC3
        bset    <BitFlags2f 2
        ldab    byte_8A19
        stab    STe_64C6
        ldab    <TpsVolts
        stab    STe_64C7
        ldab    byte_8A1B
        stab    STe_64C8

loc_AEC3:
        ldd     <EngineRpm_HB
        std     UNe_64C1

loc_AEC8:
        brclr   <BitFlags2f 4 locret_AEF9
        dec     STe_64C8
        beq     loc_AEF6
        ldd     <EngineRpm_HB
        cpd     word_8A17
        bmi     loc_AEF6
        dec     STe_64C6
        bne     locret_AEF9
        ldab    byte_8A19
        stab    STe_64C6
        ldaa    <TpsVolts
        ldab    STe_64C7
        staa    STe_64C7
        sba
        bmi     locret_AEF9
        cmpa    byte_8A1A
        bpl     loc_AEF6
        bra     locret_AEF9

loc_AEF6:
        bclr    <BitFlags2f 4

locret_AEF9:
        rts

sub_AEFA:
        subd    0,y
        pshy
        bcs     loc_AF0C
        xgdy
        ldaa    1,x
        jsr     ScaleYbyA
        xgdy
        bra     loc_AF1D

loc_AF0C:
        nega
        negb
        sbca    #0
        xgdy
        ldaa    0,x
        jsr     ScaleYbyA
        xgdy
        nega
        negb
        sbca    #0

loc_AF1D:
        puly
        addd    0,y
        std     0,y
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        ; segment EEPROM
        org $B600
word_B600:  fdb $FFFF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
word_B610:  fdb $FFFF
byte_B612:  fcb $FF
        fcb $FF
byte_B614:  fcb $FF
byte_B615:  fcb $FF
        fcb $FF
        fcb $FF
byte_B618:  fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
byte_B7E0:  fcb $FF
byte_B7E1:  fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
byte_B7EF:  fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
; end of 'EEPROM'

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

 ORG $B800
sub_B800:
        ldab    <Counter_MainLoop
        bitb    #7
        beq     loc_B809
        jmp     loc_B87F

loc_B809:
        ldaa    <LastCoolantTempVolts
        ldx     #$E537
        brclr   <PIA3_Buffer_t3 $10 loc_B833
        ldx     #$E51C
        cmpa    #$40
        bcc     loc_B837

loc_B819:
        brset   <BitFlags66_t3 3 loc_B824
        ldab    <BitFlags66_t3
        addb    #1
        stab    <BitFlags66_t3
        rts

loc_B824:
        sei
        bclr    <BitFlags66_t3 3
        ldab    <PIA3_Buffer_t3
        eorb    #$10
        stab    <PIA3_Buffer_t3
        stab    PIA3_Buffer_2_t3
        cli
        rts

loc_B833:
        cmpa    #$DC
        bcc     loc_B819

loc_B837:
        bclr    <BitFlags66_t3 3
        cmpa    TL_CoolantTempOutOfRangeHigh
        bhi     loc_B863
        cmpa    TL_CoolantTempOutOfRangeLow
        bcs     loc_B868
        brclr   <b5C_IPL1_t3 2 loc_B84F
        ldaa    #2
        jsr     sub_D795
        bra     loc_B87F

loc_B84F:
        jsr     Lookup4ByteTable
        ldab    <CoolantTemp
        sba
        bcc     loc_B85A
        decb
        bra     loc_B85F

loc_B85A:
        cmpa    #3
        bcs     loc_B87F
        incb

loc_B85F:
        stab    <CoolantTemp
        bra     loc_B87F

loc_B863:
        ldd     #$1F9E
        bra     loc_B86B

loc_B868:
        ldd     #$1E9E

loc_B86B:
        brset   <b5C_IPL1_t3 2 loc_B87F
        jsr     ThrowNonCriticalError_
        bcc     loc_B87F
        bset    <b5C_IPL1_t3 2
        ldaa    TL_DefaultCoolantTempRaw
        staa    <CoolantTemp
        clr     Timer_ThermostatDiagnostics

loc_B87F:
        ldaa    <CoolantTemp
        ldx     #$E546
        jsr     Lookup4ByteTable
        staa    <CoolantTemp_fromTable_Scaled
        rts

sub_B88A:
        ldab    <Counter_MainLoop
        bitb    #7
        beq     loc_B893
        jmp     loc_B909

loc_B893:
        ldaa    <LastChargeTempVolts
        ldx     #$E537
        brclr   <PIA3_Buffer_t3 $20 loc_B8C0
        ldx     #$E51C
        cmpa    #$40
        bcc     loc_B8C4

loc_B8A3:
        brset   <BitFlags23 3 loc_B8B1
        ldab    <BitFlags23
        addb    #1
        stab    <BitFlags23
        ldaa    <LastChargeTempVolts
        bra     loc_B8C7

loc_B8B1:
        sei
        bclr    <BitFlags23 3
        ldab    <PIA3_Buffer_t3
        eorb    #$20
        stab    <PIA3_Buffer_t3
        stab    PIA3_Buffer_2_t3
        cli
        rts

loc_B8C0:
        cmpa    #$DC
        bcc     loc_B8A3

loc_B8C4:
        bclr    <BitFlags23 3

loc_B8C7:
        cmpa    TL_ChargeTempOutOfRangeHigh
        bhi     loc_B8F0
        cmpa    TL_ChargeTempOutOfRangeLow
        bcs     loc_B8F5
        brclr   <b5C_IPL1_t3 1 loc_B8DC
        ldaa    #1
        jsr     sub_D795
        bra     loc_B909

loc_B8DC:
        jsr     Lookup4ByteTable
        ldab    <ChargeTempVolts
        sba
        bcc     loc_B8E7
        decb
        bra     loc_B8EC

loc_B8E7:
        cmpa    #3
        bcs     loc_B909
        incb

loc_B8EC:
        stab    <ChargeTempVolts
        bra     loc_B909

loc_B8F0:
        ldd     #$3A9E
        bra     loc_B8F8

loc_B8F5:
        ldd     #$399E

loc_B8F8:
        brset   <b5C_IPL1_t3 1 loc_B909
        jsr     ThrowNonCriticalError_
        bcc     loc_B909
        bset    <b5C_IPL1_t3 1
        ldaa    TL_DefaultChargeTemp_Limpin
        staa    <ChargeTempVolts

loc_B909:
        ldaa    <ChargeTempVolts
        ldx     #$E587
        jsr     Lookup4ByteTable
        staa    <IntakeTemp_fromTable_Scaled
        rts

sub_B914:
        brclr   <BitFlags24 $10 loc_B92D
        sei
        ldd     <VehicleSpeed_HB
        lsrd
        lsrd
        lsrd
        lsrd
        lsrd
        std     Temp4
        ldd     <VehicleSpeed_HB
        subd    Temp4
        std     <VehicleSpeed_HB
        cli
        bra     *+2

loc_B92D:
        clra
        ldab    <VehicleSpeedx8_Scaled
        cmpb    byte_801E
        bcc     loc_B93D
        ldx     <EngineRpm_HB
        cpx     <TargetIdleSpeedHB
        bls     loc_B948
        bra     loc_B943

loc_B93D:
        ldab    <MapValue
        cmpb    <MAPOffsetForCylTrim
        bls     loc_B948

loc_B943:
        ldaa    <Timer_CountdownFromStartRunForAisFeedback
        beq     loc_B94A
        deca

loc_B948:
        staa    <Timer_CountdownFromStartRunForAisFeedback

loc_B94A:
        brset   <BitFlags66_t3 $80 loc_B967
        ldd     <VehicleSpeed_HB
        lsld
        lsld
        lsld
        aslb
        adca    #0
        ldab    byte_801E
        brset   <BitFlags66_t3 4 loc_B95F
        addb    #3

loc_B95F:
        cba
        bcs     loc_B967
        bset    <BitFlags66_t3 4
        bra     loc_B96A

loc_B967:
        bclr    <BitFlags66_t3 4

loc_B96A:
        ldd     <VehicleSpeed_HB
        lsld
        lsld
        lsld
        bcc     loc_B973
        ldaa    #$FF

loc_B973:
        staa    <VehicleSpeedx8_Scaled
        rts

sub_B976:
        brclr   <IPL1 $40 locret_B9B9
        ldaa    <MapValue2
        cmpa    #$80
        bcs     locret_B9B9
        ldaa    <EngineRpm_HB
        ldx     #$8024
        jsr     Lookup4ByteTable
        adda    <MapValue2
        bcc     loc_B98E
        ldaa    #$FF

loc_B98E:
        cmpa    <BaroPressure
        bls     loc_B998
        ldab    <BaroPressure
        incb
        bne     loc_B9B1
        rts

loc_B998:
        ldab    <TpsVolts_Minus_LowestSessionTpsVolts
        cmpb    byte_8037
        bcs     loc_B9B3
        ldab    <TPSVoltsSessionDelta
        cmpb    byte_8038
        bcs     loc_B9B4
        cmpa    <BaroPressure
        bcc     loc_B9B4
        ldab    <BaroPressure
        decb
        cmpb    #$80
        bcs     loc_B9B3

loc_B9B1:
        stab    <BaroPressure

loc_B9B3:
        clrb

loc_B9B4:
        incb
        bmi     locret_B9B9
        stab    <TPSVoltsSessionDelta

locret_B9B9:
        rts

sub_B9BA:
        brclr   <StartupSwitchMirror1 $10 loc_B9C1
        bclr    <BitFlags2a 1

loc_B9C1:
        brset   <BitFlags27 1 loc_B9ED
        ldab    <BitFlags68_t3
        andb    #$10
        stab    Temp5
        ldab    <StartupSwitchMirror1
        andb    #$10
        eorb    Temp5
        beq     locret_B9F0
        eorb    <BitFlags68_t3
        orab    #$80
        stab    <BitFlags68_t3
        bclr    <BitFlags66_t3 4
        brclr   <BitFlags68_t3 $10 locret_B9F0
        bset    <BitFlags2f $10
        ldaa    byte_8A27
        staa    STe_64C0
        bra     locret_B9F0

loc_B9ED:
        bclr    <BitFlags68_t3 $90

locret_B9F0:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_B9F1:
        brclr   <BitFlags27 $80 loc_BA15
        ldab    <BitFlags68_t3
        andb    #1
        stab    Temp5
        ldab    <StartupSwitchMirror1
        andb    #1
        eorb    Temp5
        beq     locret_BA1B
        eorb    <BitFlags68_t3
        brset   <BitFlags36_t3 $20 loc_BA11
        brclr   <IPL1 $40 loc_BA11
        orab    #2

loc_BA11:
        stab    <BitFlags68_t3
        bra     locret_BA1B

loc_BA15:
        bclr    <BitFlags68_t3 2
        bset    <BitFlags68_t3 1

locret_BA1B:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BA1C:
        clr     Temp4
        clr     Temp3
        brset   <Ram_30 4 loc_BA33
        ldaa    <LastTpsVolts
        cmpa    byte_8A60
        bcc     loc_BA33
        ldaa    <Ram_30
        adda    #1
        staa    <Ram_30

loc_BA33:
        ldaa    <b5C_IPL1_t3
        bita    #$88
        bne     loc_BA88
        brset   <Ram_30 8 loc_BA57
        ldaa    <EngineRpm_HB
        cmpa    byte_8A5E
        bcs     loc_BA63
        ldaa    <BaroPressure
        cmpa    byte_8A63
        bcc     loc_BA50
        ldaa    byte_8A62
        bra     loc_BA53

loc_BA50:
        ldaa    byte_8A61

loc_BA53:
        cmpa    <MapVolts
        bcc     loc_BA63

loc_BA57:
        ldaa    <LastTpsVolts
        cmpa    byte_8A60
        bcs     loc_BA63
        com     Temp4
        bra     loc_BA95

loc_BA63:
        brset   <BitFlags2e 8 loc_BA7C
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    byte_8A5D
        bcs     loc_BA88
        ldaa    <EngineRpm_HB
        cmpa    byte_8A5E
        bcs     loc_BA88
        ldaa    <MapVolts
        cmpa    byte_8A5F
        bcc     loc_BA88

loc_BA7C:
        ldaa    <LastTpsVolts
        cmpa    byte_8A5C
        bcc     loc_BA88
        com     Temp3
        bra     loc_BA9F

loc_BA88:
        sei
        ldaa    <LastTpsVolts
        cmpa    byte_8A59
        bcs     loc_BA9F
        cmpa    byte_8A5A
        bcs     loc_BADE

loc_BA95:
        cli
        brclr   <Counter_MainLoop 1 loc_BAFC
        ldd     #$1BA0
        bra     loc_BAA7

loc_BA9F:
        cli
        brclr   <Counter_MainLoop 1 loc_BAFC
        ldd     #$1AA0

loc_BAA7:
        brset   <b5C_IPL1_t3 $40 loc_BAC7
        jsr     ThrowNonCriticalError_
        ldaa    <TpsVolts
        bcc     loc_BAFC
        bset    <b5C_IPL1_t3 $40
        tst     Temp4
        beq     loc_BABF
        bset    <Ram_30 8
        bra     loc_BAC7

loc_BABF:
        tst     Temp3
        beq     loc_BAC7
        bset    <BitFlags2e 8

loc_BAC7:
        ldaa    #$40
        staa    <LowestSessionTpsVolts
        brclr   <IPL1 $40 loc_BADA
        ldab    <MapValue
        cmpb    byte_8A5B
        bcs     loc_BADA
        adda    byte_801F
        inca

loc_BADA:
        staa    <TpsVolts
        bra     loc_BAFC

loc_BADE:
        brclr   <b5C_IPL1_t3 $40 loc_BAFA
        cli
        ldaa    <Counter_MainLoop
        bita    #7
        bne     loc_BAC7
        ldaa    #7
        jsr     sub_D795
        brset   <b5C_IPL1_t3 $40 loc_BAC7
        bclr    <BitFlags2e 8
        bclr    <Ram_30 8
        bra     loc_BAC7

loc_BAFA:
        staa    <TpsVolts

loc_BAFC:
        cli
        brset   <BitFlags66_t3 $80 loc_BB26
        ldab    <Timer_CountdownFromStartRunForAisFeedback
        bne     loc_BB26
        brclr   <IPL1 $40 loc_BB26
        ldab    <KeyOnOrEngineRunningTime
        beq     loc_BB26
        cmpa    <LowestSessionTpsVolts
        bcc     loc_BB26
        ldaa    Timer_DelayBeforeUpdating_MINTHR
        deca
        bne     loc_BB29
        ldab    <LowestSessionTpsVolts
        cmpb    #1
        bcc     loc_BB20
        ldab    TL_ValueOf_MINTHR_WhenBatteryDisconnected

loc_BB20:
        decb
        stab    <LowestSessionTpsVolts
        bclr    <BitFlags66_t3 $10

loc_BB26:
        ldaa    byte_8018

loc_BB29:
        staa    Timer_DelayBeforeUpdating_MINTHR
        ldaa    byte_8019
        ldab    <BitFlags66_t3
        bpl     loc_BB36
        ldaa    byte_801A

loc_BB36:
        adda    <LowestSessionTpsVolts
        cmpa    <TpsVolts
        bcc     loc_BB55
        tstb
        bmi     loc_BB4E
        bitb    #$10
        bne     loc_BB4E
        ldaa    <LowestSessionTpsVolts
        inca
        cmpa    <TpsVolts
        bcc     loc_BB4E
        staa    <LowestSessionTpsVolts
        orab    #$10

loc_BB4E:
        orab    #$80
        bclr    <BitFlags2a 1
        bra     loc_BB6F

loc_BB55:
        tstb
        bpl     loc_BB6D
        brset   <BitFlags68_t3 4 loc_BB5E
        orab    #$20

loc_BB5E:
        ldx     #$87A9
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    byte_801E
        bcc     loc_BB69
        inx

loc_BB69:
        ldaa    0,x
        staa    <Timer_CountdownFromStartRunForAisFeedback

loc_BB6D:
        andb    #$7F

loc_BB6F:
        bitb    #8
        bne     loc_BB94
        brclr   <StartupSwitchMirror1 $20 loc_BB94
        ldaa    <EngineRpm_HB
        cmpa    byte_801C
        bcs     loc_BB94
        ldaa    <MapValue
        cmpa    byte_801D
        bcc     loc_BB94
        ldaa    <LowestSessionTpsVolts
        inca
        cmpa    TL_ValueOf_MINTHR_WhenBatteryDisconnected
        bcs     loc_BB90
        ldaa    TL_ValueOf_MINTHR_WhenBatteryDisconnected

loc_BB90:
        staa    <LowestSessionTpsVolts
        orab    #8

loc_BB94:
        ldaa    <LowestSessionTpsVolts
        adda    #$30
        cmpa    <TpsVolts
        bcc     loc_BB9E
        andb    #$F7

loc_BB9E:
        stab    <BitFlags66_t3
        ldaa    <TpsVolts
        suba    <LowestSessionTpsVolts
        bcc     loc_BBA7
        clra

loc_BBA7:
        staa    <TpsVolts_Minus_LowestSessionTpsVolts
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BBAA:
        sei
        jsr     sub_E6AA
        cli
        std     Temp0
        addd    UNe_64A3
        rora
        rorb
        std     Temp2
        ldd     Temp0
        std     UNe_64A3
        std     <EngineRpm_HB
        clra
        ldab    <VehicleSpeedx8_Scaled
        std     Temp4
        ldab    Temp2
        lsrb
        aba
        lsrb
        clra
        ldx     Temp4
        fdiv
        xgdx
        bcc     loc_BBD8
        ldaa    #$FF

loc_BBD8:
        lsra
        lsra
        staa    Temp4
        ldaa    <ScaledDistPWForCruiseControl
        tab
        lsrb
        lsrb
        sba
        adda    Temp4
        bcc     loc_BBEA
        ldaa    #$FF

loc_BBEA:
        staa    <ScaledDistPWForCruiseControl
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BBED:
        ldab    #$1C

loc_BBEF:
        subb    #2
        bls     loc_BBFE
        ldx     #$8037
        abx
        ldx     0,x
        cpx     <EngineRpm_HB
        bcc     loc_BBEF
        lsrb
loc_BBFE:
        stab    <RPMTableOffset
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BC01:
        clr     Temp0
        ldab    byte_84D3
        ldaa    <MapValueTemp3
        mul
        lsld
        rol     Temp0
        lsld
        rol     Temp0
        staa    Temp1
        clra
        ldab    byte_84D2
        lsld
        addd    Temp0
        std     Temp0
        ldaa    <RPMTableOffset
        ldab    byte_84D4
        mul
        lsrd
        lsrd
        addd    Temp0
        lsrd
        lsrd
        oraa    #0
        beq     loc_BC33
        ldab    #$FF

loc_BC33:
        stab    <RPM_Scaled_maybe
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BC36:
        ldab    byte_801F
        addb    <LowestSessionTpsVolts
        bcs     loc_BC42
        cmpb    byte_8020
        bcs     loc_BC45

loc_BC42:
        ldab    byte_8020

loc_BC45:
        brclr   <BitFlags66_t3 $40 loc_BC4B
        subb    #3

loc_BC4B:
        cmpb    <TpsVolts
        bcc     loc_BC53
        bset    <BitFlags66_t3 $40
        rts

loc_BC53:
        bclr    <BitFlags66_t3 $40
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BC57:
        ldaa    CoolantVoltsTmp1
        ldab    CoolantVoltsTmp2
        mul
        std     Temp1
        ldab    CoolantVoltsTmp1
        subb    CoolantVoltsTmp2
        bls     loc_BCAA
        clra
        xgdx
        ldd     Temp1
        aslb
        adca    #0
        tab
        abx
        ldd     Temp1
        idiv
        xgdx
        tsta
        bne     loc_BCAA
        stab    Temp0
        ldaa    Temp0
        ldx     #$E5AA
        jsr     Lookup4ByteTable
        tab
        suba    <AmbientAirTempVolts2
        bcc     loc_BC9A
        cmpa    #$F0
        bhi     loc_BCA6
        ldab    <AmbientAirTempVolts2
        subb    #$10
        bcc     loc_BCA6
        ldab    #0
        bra     loc_BCA6

loc_BC9A:
        cmpa    #$10
        bls     loc_BCA6
        ldab    <AmbientAirTempVolts2
        addb    #$10
        bcc     loc_BCA6
        ldab    #$FF

loc_BCA6:
        stab    <AmbientAirTempVolts2
        bra     locret_BCBE

loc_BCAA:
        brset   <b5C_IPL1_t3 2 locret_BCBE
        ldaa    <CoolantTemp
        cmpa    #$C1
        bcc     locret_BCBE
        ldd     #$4708
        jsr     ThrowNonCriticalError_
        ldaa    #$C1
        staa    <AmbientAirTempVolts2

locret_BCBE:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DetermineTargetBatteryVoltage:
        ldaa    <AmbientAirTempVolts2
        ldab    byte_8011
        cmpb    #2
        beq     loc_BCD1
        cmpb    #1
        beq     loc_BCD6
        ldx     #$E5C1
        bra     loc_BCD9

loc_BCD1:
        ldx     #$E5D4
        bra     loc_BCD9

loc_BCD6:
        ldx     #$E5E7

loc_BCD9:
        jsr     Lookup4ByteTable
        staa    <TargetBatteryVolts
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ReadA2DBattVolts:
        ldaa    ADR2_A2DResults2
        ldab    <BodyComputerBatteryVoltsOutput
        addb    #$F8
        bcs     loc_BCF0
        comb
        aba
        bcc     locret_BCF1
        ldaa    #$FF
        bra     locret_BCF1

loc_BCF0:
        sba

locret_BCF1:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

bcf2_MM:
        brset   <BitFlags6a_t3 $40 locret_BD33
        ldaa    PPROG_EEPROMControlReg
        bita    #2
        bne     locret_BD33
        ldaa    byte_B7E1
        coma
        cmpa    byte_B7E0
        beq     loc_BD08
        ldaa    #8

loc_BD08:
        staa    <BodyComputerBatteryVoltsOutput
        ldaa    byte_B615
        coma
        cmpa    byte_B614
        beq     loc_BD16
        clra
        bra     loc_BD22

loc_BD16:
        cmpa    #$C
        ble     loc_BD1C
        ldaa    #$C

loc_BD1C:
        cmpa    #$F4
        bge     loc_BD22
        ldaa    #$F4

loc_BD22:
        staa    <Ram_4B
        ldaa    byte_B7EF
        cmpa    #$55
        bne     loc_BD30
        bset    <BitFlags6a_t3 2
        bra     locret_BD33

loc_BD30:
        bclr    <BitFlags6a_t3 2

locret_BD33:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BD34:
        clr     Temp4
        ldx     #$8083
        ldaa    <BitFlags6d_t3
        bita    #$50
        bne     loc_BD51
        ldaa    <Ram_CC
        beq     loc_BD4A
        brset   <PIA2_Buffer_t3 2 loc_BD51
        bra     loc_BD4E

loc_BD4A:
        brclr   <PIA2_Buffer_t3 2 loc_BD51

loc_BD4E:
        ldx #$811F

loc_BD51:
        ldaa    <EngineRPM_3D
        ldab    <MapValue2
        jsr     sub_E72F
        bpl     loc_BD5C
        ldaa    #$7F

loc_BD5C:
        staa    Temp5
        brclr   <IPL1 $10 loc_BD7B
        ldx     #$81BC
        ldaa    <EngineRPM_3D
        ldab    <MapValue2
        jsr     sub_E72F
        bpl     loc_BD71
        ldaa    #$7F

loc_BD71:
        adda    Temp5
        bpl     loc_BD78
        ldaa    #$7F

loc_BD78:
        staa    Temp5

loc_BD7B:
        ldx     #$8258
        ldab    <RPMTableOffset
        abx
        ldaa    0,x
        cmpa    <MapValue2
        bcc     loc_BDCC
        bset    <BitFlags23 $40
        ldx     #$8266
        ldaa    <CoolantTemp_fromTable_Scaled
        jsr     sub_E68D
        subb    #$20
        stab    Temp4
        ldaa    <IntakeTemp_fromTable_Scaled
        ldx     #$826F
        jsr     sub_E68D
        subb    #$20
        addb    Temp4
        bvc     loc_BDAF
        ldab    #$80
        tst     Temp4
        bmi     loc_BDAF
        ldab    #$7F

loc_BDAF:
        stab    Temp4
        ldaa    <BaroPressure
        cmpa    byte_8278
        bcc     loc_BDCF
        subb    byte_8279
        bvc     loc_BDC7
        ldab    #$80
        tst     Temp4
        bmi     loc_BDC7
        ldab    #$7F

loc_BDC7:
        stab    Temp4
        bra     loc_BDCF

loc_BDCC:
        bclr    <BitFlags23 $40

loc_BDCF:
        jsr     sub_BF20
        ldaa    byte_827A
        beq     loc_BDEA
        brset   <BitFlags66_t3 $80 loc_BDEA
        ldab    <VehicleSpeedx8_Scaled
        brclr   <BitFlags23 $10 loc_BDE7
        adda    #3
        bcc     loc_BDE7
        ldaa    #$FF

loc_BDE7:
        cba
        bcc     loc_BDEF

loc_BDEA:
        bclr    <BitFlags23 $10
        bra     loc_BDF2

loc_BDEF:
        bset    <BitFlags23 $10

loc_BDF2:
        ldaa    byte_827A
        beq     loc_BE2B
        ldx     #$827C
        ldaa    <CoolantTemp_fromTable_Scaled
        jsr     sub_E68D
        brclr   <BitFlags23 $10 loc_BE0F
        addb    byte_827B
        bpl     loc_BE0A
        ldab    #$7F

loc_BE0A:
        stab    Temp5
        bra     loc_BE2B

loc_BE0F:
        stab    Temp4
        ldaa    <MapValue
        ldx     #$8285
        jsr     sub_E68D
        ldaa    Temp4
        mul
        adca    #0
        staa    Temp4
        jsr     sub_BF20
        staa    Temp0
        bra     loc_BE8E

loc_BE2B:
        ldaa    Temp5
        staa    Temp0
        brclr   <IPL1 $40 loc_BE8E
        brset   <BitFlags66_t3 $80 loc_BE8E
        brset   <BitFlags66_t3 4 loc_BE8E
        ldab    <Timer_CountdownFromStartRunForAisFeedback
        bne     loc_BE96
        ldab    <TimerOverflowsBetweenCamPulses
        bne     loc_BE96
        ldab    <EngineRpm_HB
        cmpb    byte_869D
        bcs     loc_BE96
        ldab    <b5C_IPL1_t3
        bitb    #$88
        bne     loc_BE96
        ldab    <CoolantTemp
        cmpb    byte_8699
        bcs     loc_BE96
        ldx     <KeyOnOrEngineRunningTime
        cpx     word_869B
        bcs     loc_BE96
        ldx     #$86AB
        ldd     <EngineRpm_HB
        subd    <TargetIdleSpeedHB
        bcc     loc_BE6E
        ldx     #$86A0
        coma
        comb

loc_BE6E:
        lsrd
        lsrd
        lsrd
        lsrd
        bcc     loc_BE77
        addd    #1

loc_BE77:
        tsta
        beq     loc_BE7C
        ldab    #$FF

loc_BE7C:
        tba
        jsr     Lookup4ByteTable
        staa    SparkScatter
        staa    Temp4
        jsr     sub_BF20
        staa    Temp0
        bra     loc_BE9C

loc_BE8E:
        clr     SparkScatter
        clr     SparkScatterIncrement
        bra     loc_BEB3

loc_BE96:
        clr     SparkScatter
        clr     SparkScatterIncrement

loc_BE9C:
        ldaa    byte_869F
        brset   <BitFlags6d_t3 8 loc_BEAE
        brset   <BitFlags2a 1 loc_BEAB
        brclr   <b5C_IPL1_t3 2 loc_BEB3

loc_BEAB:
        ldaa    byte_869E

loc_BEAE:
        staa    Temp0
        bra     loc_BEF9

loc_BEB3:
        ldd     #0
        brclr   <BitFlags2c 8 loc_BEC1
        sei
        bclr    <BitFlags2c 8
        cli
        bra     loc_BF01

loc_BEC1:
        ldaa    Temp0
        decb
        cmpb    <Ram_4C
        beq     loc_BEFE
        brclr   <IPL1 1 loc_BEFE
        brset   <BitFlags66_t3 $80 loc_BEFE
        cmpa    <Ram_4C
        bls     loc_BEFE
        ldaa    <EngineRpmTemp
        suba    <EngineRpm_HB
        bcs     loc_BEE0
        cmpa    byte_8082
        bcc     loc_BEF9

loc_BEE0:
        ldaa    <Ram_4C
        ldab    <CounterUp_43
        cmpb    byte_8081
        tab
        bcs     loc_BF01
        ldaa    <Ram_4C
        adda    byte_8080
        bpl     loc_BEF3
        ldaa    #$7F

loc_BEF3:
        tab
        cmpa    Temp0
        bcs     loc_BEFE

loc_BEF9:
        ldaa    Temp0
        ldab    #$FF

loc_BEFE:
        clr     CounterUp_43

loc_BF01:
        staa    Temp0
        stab    <Ram_4C
        adda    <Ram_4B
        bvc     loc_BF10
        bpl     loc_BF12
        ldaa    #$7F
        bra     loc_BF13

loc_BF10:
        bpl     loc_BF13

loc_BF12:
        clra

loc_BF13:
        ldab    UNe_6481
        bitb    #2
        beq     loc_BF1D
        ldaa    UNe_6482

loc_BF1D:
        staa    <AdvanceTemporary
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BF20:
        tst     Temp4
        bpl     loc_BF30
        ldaa    Temp4
        adda    Temp5
        bpl     loc_BF3A
        clra
        bra     loc_BF3A

loc_BF30:
        ldaa    Temp4
        adda    Temp5
        bpl     loc_BF3A
        ldaa    #$7F

loc_BF3A:
        staa    Temp5
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BF3E:
        brclr   <Ram_EC $20 locret_BF91
        brclr   <Ram_05 1 loc_BF4D
        ldaa    <Ram_FE
        cmpa    byte_842A
        bcs     locret_BF91

loc_BF4D:
        bclr    <Ram_EC $20
        ldx     #$842B
        ldaa    <CoolantTemp
        jsr     Lookup4ByteTable
        clrb
        std     Temp0
        sei
        std     InjectorPulsewidth_HB_Cyl4
        std     InjectorPulsewidth_HB_Cyl3
        std     InjectorPulsewidth_HB_Cyl2
        std     InjectorPulsewidth_HB_Cyl1
        brset   <BitFlags27 $80 loc_BF8D
        ldd     #$F060
        oraa    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1
        stab    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    Temp0
        std     TOC2_Counter_OC2
        std     TOC3_Counter_OC3
        ldaa    TCTL1_TimerControlReg1
        anda    #$AF
        staa    TCTL1_TimerControlReg1

loc_BF8D:
        bset    <Ram_EC $40
        cli

locret_BF91:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_BF92:
        ldaa    <TimerOverflowsBetweenCamPulses
        bne     loc_BFCD
        ldd     word_807C
        cpd     word_82B1
        bcc     loc_BFA2
        ldd     word_82B1

loc_BFA2:
        cpd     <DistributorFallingEdgePulsewidth_HB
        bcs     loc_BFCD
        ldx     #$6400
        brset   <IPL1 $41 loc_BFD3
        brset   <BitFlags23 $80 loc_BFC0
        brclr   0,x $20 loc_BFD3
        bset    <BitFlags23 $80
        ldaa    byte_807E
        staa    <Ram_7F
        bra     locret_BFD6

loc_BFC0:
        brset   0,x $20 locret_BFD6
        ldaa    <Ram_7F
        beq     locret_BFD6
        deca
        staa    <Ram_7F
        bra     locret_BFD6

loc_BFCD:
        bclr    <IPL1 $41
        bclr    <BitFlags23 $80

loc_BFD3:
        clr     Ram_7F

locret_BFD6:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

calc_fuel_MM:
        brset   <IPL1 $40 locret_C04D
        ldaa    <CoolantTemp_fromTable_Scaled
        ldx     #$845D
        jsr     sub_E68D
        pshb
        ldaa    <BaroPressure
        ldx     #$8466
        jsr     sub_E68D
        pula
        mul
        std     Temp2
        ldaa    <CounterUp_UsedInCalcFuel
        ldx     #$846F
        jsr     Lookup4ByteTable
        ldy     Temp2
        jsr     ScaleYbyA
        sty     Temp4
        ldd     Temp2
        subd    Temp4
        std     Temp2
        ldaa    <EngineRpm_HB
        ldx     #$8482
        jsr     Lookup4ByteTable
        ldy     Temp2
        jsr     ScaleYbyA
        sty     Temp4
        ldd     Temp2
        subd    Temp4
        std     Temp2
        clra
        ldab    <Ram_B1
        lsld
        lsld
        addd    Temp2
        bcc     loc_C036
        ldd     #$FFFF

loc_C036:
        brclr   <BitFlags21 2 loc_C04B
        xgdy
        ldaa    <CoolantTemp
        cmpa    byte_8AB7
        bcc     loc_C049
        ldaa    byte_8AB8
        jsr     ScaleYbyA

loc_C049:
        xgdy

loc_C04B:
        std     <Ram_71

locret_C04D:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C04E:
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    byte_8684
        bcs     loc_C0B0
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    byte_8685
        bcs     loc_C0B0
        ldaa    <CoolantTemp
        cmpa    byte_8686
        bcs     loc_C0B0
        ldaa    <BaroPressure
        cmpa    byte_868B
        bcs     loc_C0B0
        ldaa    byte_8681
        ldab    <TargetIdleSpeedHB
        mul
        addd    <TargetIdleSpeedHB
        bcc     loc_C077
        ldd     #$FFFF

loc_C077:
        cpd     <EngineRpm_HB
        bcc     loc_C0B0
        brclr   <BitFlags2c $40 loc_C087
        jsr     sub_C109
        brset   <BitFlags2c $40 loc_C0B0

loc_C087:
        ldaa    byte_868C
        bne     loc_C092
        brclr   <BitFlags66_t3 $80 loc_C0B7
        bra     loc_C0B0

loc_C092:
        cmpa    #1
        bne     loc_C0A0
        ldd     <Ram_73
        cpd     word_868D
        bcs     loc_C0B7
        bra     loc_C0B0

loc_C0A0:
        cmpa    #2
        bne     loc_C0B0
        ldd     <Ram_73
        cpd     word_868D
        bcc     loc_C0B0
        brclr   <BitFlags66_t3 $80 loc_C0B7

loc_C0B0:
        ldaa    byte_8682
        staa    <Counter_E
        bra     loc_C0BE

loc_C0B7:
        ldaa    <Counter_E
        bne     loc_C0BE
        bset    <BitFlags2c $C0

loc_C0BE:
        ldd     word_868F
        brclr   <BitFlags2c 2 loc_C0CD
        subd    word_8691
        bcc     loc_C0CD
        ldd     #0

loc_C0CD:
        cpd     <EngineRpm_HB
        bcc     loc_C0E9
        ldaa    byte_8693
        brclr   <BitFlags2c 2 loc_C0E0
        suba    byte_8694
        bcc     loc_C0E0
        ldaa    #0

loc_C0E0:
        cmpa    <VehicleSpeedx8_Scaled
        bcc     loc_C0E9
        bset    <BitFlags2c 2
        bra     loc_C0EC

loc_C0E9:
        bclr    <BitFlags2c 2

loc_C0EC:
        ldd     word_8695
        brclr   <BitFlags2c 1 loc_C0FB
        subd    word_8697
        bcc     loc_C0FB
        ldd     #0

loc_C0FB:
        cpd     <EngineRpm_HB
        bcc     loc_C105
        bset    <BitFlags2c 1
        bra     locret_C108

loc_C105:
        bclr    <BitFlags2c 1

locret_C108:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C109:
        tst     CounterDn_b7_o2
        bne     locret_C146
        ldaa    <EngineRpm_HB
        cmpa    <RpmRelated0087
        bcs     locret_C146
        ldd     <Ram_73
        cpd     word_8687
        bcc     loc_C11E
        bra     loc_C143

loc_C11E:
        ldx     <Ram_73
        ldaa    byte_8683
        bne     loc_C12B
        brset   <BitFlags66_t3 $80 loc_C143
        bra     locret_C146

loc_C12B:
        cmpa    #1
        bne     loc_C136
        cpx     word_8689
        bcc     loc_C143
        bra     locret_C146

loc_C136:
        cmpa    #2
        bne     loc_C143
        brclr   <BitFlags66_t3 $80 locret_C146
        cpx     word_8689
        bcs     locret_C146

loc_C143:
        bclr    <BitFlags2c $40

locret_C146:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C147:
        ldx     #$84EE
        ldd     <EngineRpm_HB
        aslb
        adca    #0
        jsr     Lookup4ByteTable
        staa    Temp0
        ldab    <MapValue
        ldx     #$850D
        jsr     sub_E72F
        staa    <o2LowLimitForInMiddleDetermination
        ldaa    Temp0
        ldab    <MapValue
        ldx     #$85A9
        jsr     sub_E72F
        staa    Temp1
        brclr   <BitFlags29 8 loc_C181
        ldaa    Temp0
        ldab    <MapValue
        ldx     #$8ABA
        jsr     sub_E72F
        tab
        ldaa    Temp1
        sba

loc_C181:
        staa    <o2HighLimitForInMiddleDetermination
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C184:
        ldaa    <CoolantTemp
        cmpa    byte_8671
        bcc     loc_C194
        ldd     #0
        staa    <Ram_82
        std     <Counter_F_HB
        bra     locret_C1F0

loc_C194:
        ldab    <EngineRpmTemp
        cmpb    byte_8672
        bcs     loc_C19F
        brset   <BitFlags66_t3 $40 loc_C1BE

loc_C19F:
        ldaa    <EngineRpmTemp
        ldab    <RPM_Scaled_maybe
        cmpa    byte_8676
        bls     loc_C1AD
        cmpb    byte_8677
        bhi     loc_C1B2

loc_C1AD:
        clr     Ram_82
        bra     loc_C1B7

loc_C1B2:
        ldaa    byte_8678
        staa    <Ram_82

loc_C1B7:
        ldd     #0
        std     <Counter_F_HB
        bra     locret_C1F0

loc_C1BE:
        ldaa    <EngineRpmTemp
        cmpa    byte_8673
        bhi     loc_C1DD
        ldab    <Ram_82
        cmpa    byte_867B
        bcs     loc_C1D1
        cmpb    byte_8674
        beq     loc_C1DB

loc_C1D1:
        ldaa    byte_8675
        staa    <Ram_82
        ldd     #0
        std     <Counter_F_HB

loc_C1DB:
        bra     locret_C1F0

loc_C1DD:
        ldx     <Counter_F_HB
        cpx     word_8679
        bcc     loc_C1EB
        ldaa    byte_8675
        staa    <Ram_82
        bra     locret_C1F0

loc_C1EB:
        ldaa    byte_8674
        staa    <Ram_82

locret_C1F0:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C1F1:
        sei
        ldaa    <MapValueTemp2
        staa    <Ram_9D
        ldaa    <MapValue
        staa    <Ram_9E
        ldd     <DistributorFallingEdgePulsewidth_HB
        lsld
        lsld
        std     <Ram_9F
        ldaa    <Counter_O2SensorFeedbackCount_Signed
        staa    <Ram_A2
        ldaa    <BitFlags29
        eora    <Ram_A1
        anda    #$80
        beq     loc_C211
        bset    <BitFlags29 1
        bra     loc_C214

loc_C211:
        bclr    <BitFlags29 1

loc_C214:
        ldaa    <BitFlags29
        staa    <Ram_A1
        cli
        ldab    <Ram_0B
        cmpb    byte_866E
        bcs     loc_C225
        cmpb    byte_866D
        bls     loc_C22B

loc_C225:
        ldaa    #$80
        staa    <Ram_0B
        staa    <ValueFromAdaptiveMemory

loc_C22B:
        brclr   <Ram_A1 $40 loc_C284
        ldaa    <Ram_9D
        suba    <Ram_9E
        bcc     loc_C236
        nega

loc_C236:
        cmpa    byte_865D
        bcc     loc_C284
        ldaa    <CoolantTemp
        cmpa    byte_865C
        bcs     loc_C284
        ldaa    <Ram_9F
        cmpa    byte_8660
        bcc     loc_C26E
        cmpa    byte_865F
        bcc     loc_C284
        cmpa    byte_865E
        bcs     loc_C284
        ldaa    <Ram_9E
        cmpa    byte_8662
        bcs     loc_C269
        ldx     #$8663
        brset   <BitFlags2c $20 loc_C286
        bset    <BitFlags2c $20
        bclr    <BitFlags2c $10
        bra     loc_C27B

loc_C269:
        cmpa    byte_8661
        bcc     loc_C284

loc_C26E:
        ldx     #$8668
        brset   <BitFlags2c $10 loc_C286
        bset    <BitFlags2c $10
        bclr    <BitFlags2c $20

loc_C27B:
        clra
        clrb
        std     <Ram_9B
        ldaa    0,x
        staa    <Ram_99

locret_C283:
        rts

loc_C284:
        bra     loc_C2E2

loc_C286:
        brclr   <Ram_A1 1 locret_C283
        clra
        staa    Temp0
        ldab    <Ram_A2
        addd    <Ram_9B
        std     <Ram_9B
        dec     Ram_99
        bne     locret_C283
        subd    1,x
        bcs     loc_C2A4
        subd    3,x
        bcs     loc_C2E2
        inc     Temp0

loc_C2A4:
        brset   <BitFlags2c $20 loc_C2C4
        ldaa    <Ram_9A
        beq     loc_C2E2
        deca
        staa    <Ram_9A
        ldaa    <ValueFromAdaptiveMemory
        ldab    Temp0
        beq     loc_C2BB
        adda    byte_866F
        bra     loc_C2BE

loc_C2BB:
        suba    byte_866F

loc_C2BE:
        bcs     loc_C2E2
        staa    <ValueFromAdaptiveMemory
        bra     loc_C2E2

loc_C2C4:
        ldaa    <Ram_0B
        ldab    Temp0
        beq     loc_C2CD
        inca
        inca

loc_C2CD:
        deca
        ldab    byte_866D
        cba
        bcc     loc_C2DB
        ldab    byte_866E
        cba
        bcs     loc_C2DB
        tab

loc_C2DB:
        stab    <Ram_0B
        ldaa    byte_8670
        staa    <Ram_9A

loc_C2E2:
        bclr    <BitFlags2c $30
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C2E6:
        ldaa    <MapValue
        ldab    byte_864E
        mul
        ldab    #$FF
        subb    <BaroPressure
        mul
        lsrd
        lsrd
        lsrd
        lsrd
        std     <MAPLoadFactor
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C2F8:
        ldx     <Counter_A_HB
        beq     loc_C2FF
        dex
        stx     <Counter_A_HB

loc_C2FF:
        ldaa    <Counter_B
        beq     loc_C306
        deca
        staa    <Counter_B

loc_C306:
        ldaa    <Counter_C
        beq     loc_C30D
        deca
        staa    <Counter_C

loc_C30D:
        brclr   <IPL1 $40 loc_C32D
        brset   <BitFlags2c 4 loc_C323
        ldaa    <Counter_X
        beq     loc_C31E
        deca
        staa    <Counter_X
        bne     loc_C32D

loc_C31E:
        sei
        bset    <BitFlags2c 4
        cli

loc_C323:
        ldaa    <PreviousCoolantTemp_fromTable_Scaled
        ldx     #$84E2
        jsr     sub_E68D
        stab    <Counter_X

loc_C32D:
        ldaa    <Counter_D
        inca
        beq     loc_C334
        staa    <Counter_D

loc_C334:
        ldaa    <Counter_E
        beq     loc_C33B
        deca
        staa    <Counter_E

loc_C33B:
        ldx     <Counter_F_HB
        inx
        beq     locret_C342
        stx     <Counter_F_HB

locret_C342:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CalculateVariousFactors2:
        ldaa    <IntakeTemp_fromTable_Scaled
        ldx     #$8421
        jsr     sub_E68D
        stab    <Ram_81
        ldaa    <CoolantTemp_fromTable_Scaled
        brset   <IPL1 $40 loc_C38B
        ldaa    <PreviousCoolantTemp_fromTable_Scaled
        ldx     #$84E2
        jsr     sub_E68D
        stab    <Counter_X
        ldaa    <CoolantTemp_fromTable_Scaled
        ldx     #$83FD
        jsr     sub_E68D
        tba
        brclr   <BitFlags21 2 loc_C377
        ldab    <CoolantTemp
        cmpb    byte_8AB7
        bcc     loc_C377
        ldab    byte_8AB9
        mul
        adca    #0

loc_C377:
        staa    <Ram_BD
        ldaa    <CoolantTemp_fromTable_Scaled
        ldx     #$84B5
        jsr     sub_E68D
        tba
        clrb
        lsrd
        lsrd
        lsrd
        lsrd
        std     <Counter_A_HB
        ldaa    <CoolantTemp_fromTable_Scaled

loc_C38B:
        ldx     #$8406
        jsr     sub_E68D
        stab    <Ram_BE
        ldx     #$83EB
        jsr     sub_E68D
        stab    <Ram_A3
        ldx     #$84BE
        jsr     sub_E68D
        stab    <Ram_A6
        ldx     #$83F4
        jsr     sub_E68D
        stab    <Ram_A9
        ldx     #$84A3
        jsr     sub_E68D
        stab    <MapAverageFactorRAM_LB
        ldx     #$849A
        jsr     sub_E68D
        stab    <TPSAverageFactorRAM_HB
        ldx     #$84AC
        jsr     sub_E68D
        stab    <TPSAverageFactorRAM_LB
        ldx     #$84C7
        jsr     sub_E68D
        stab    <Ram_AC
        ldaa    <BatteryVolts
        ldx     #$843E
        jsr     Lookup4ByteTable
        stab    <Ram_B1
        ldaa    <BatteryVolts
        ldx     #$E5FA
        jsr     Lookup4ByteTable
        stab    CalculatedDwellTime
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CalculateAverageValues:
        ldaa    <TimerOverflowsBetweenCamPulses
        bne     loc_C3ED
        ldd     word_82AF
        cpd     <DistributorFallingEdgePulsewidth_HB
        bcc     loc_C3F2

loc_C3ED:
        bset    <BitFlags29 2
        bra     loc_C3FC

loc_C3F2:
        ldd     <EngineRpm_HB
        cpd     <TargetIdleSpeedHB
        bcs     loc_C3FC
        bclr    <BitFlags29 2

loc_C3FC:
        brclr   <BitFlags29 2 loc_C40F
        clrb
        ldaa    <MapValue
        std     <MapValueTemp2
        ldaa    <EngineRpm_HB
        std     <EngineRpmTemp
        ldaa    <TpsVolts
        std     <TPSVoltsTemp_B
        bra     loc_C43C

loc_C40F:
        ldx     #$93
        ldaa    <MapValueTemp2
        suba    <MapValue
        bcc     loc_C41B
        ldx     #$8655

loc_C41B:
        ldy     #$8C
        ldaa    <MapValue
        jsr     ProcessMapOrTpsBlockData
        ldx     #$84D5
        ldy     #$88
        ldaa    <EngineRpm_HB
        jsr     ProcessMapOrTpsBlockData
        ldx     #$865A
        ldy     #$97
        ldaa    <TpsVolts
        jsr     ProcessMapOrTpsBlockData

loc_C43C:
        ldx     #$84D0
        ldy     #$8E
        ldaa    <MapValue
        jsr     ProcessMapOrTpsBlockData
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

AVG2_CalculateAverages2:
        ldx #$864F
        ldaa    <MapValueTemp1
        cmpa    <MapValue
        bcc loc_C455
        ldx #$91

loc_C455:
        ldy     #$8A
        ldaa    <MapValue
        jsr     ProcessMapOrTpsBlockData
        ldx     #$8653
        ldaa    <TPSVoltsTemp_A
        cmpa    <TpsVolts
        bcc     loc_C46A
        ldx     #$93

loc_C46A:
        ldy     #$95
        ldaa    <TpsVolts
        jsr     ProcessMapOrTpsBlockData
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C474:
        brset   <BitFlags6d_t3 $40 loc_C480
        brclr   <PIA2_Buffer_t3 2 loc_C488
        ldaa    <Ram_CC
        bne     loc_C488

loc_C480:
        ldaa    byte_84DD
        ldx     #$834F
        bra     loc_C48E

loc_C488:
        ldaa    byte_84DE
        ldx     #$82B3

loc_C48E:
        staa    <Ram_85
        ldaa    <EngineRPM_3D
        ldab    <MapValue2
        jsr     sub_E72F
        staa    <Ram_86
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C49A:
        ldaa    <MapValue
        ldx     #$840F
        jsr     sub_E68D
        ldaa    <Ram_BE
        lsra
        mul
        ldab    <Ram_BE
        lsrb
        lsrb
        aba
        bcs     loc_C4C9
        staa    LDXi_6490
        brclr   <BitFlags2c 4 loc_C4C1
        ldaa    <Ram_BD
        beq     loc_C4BE
        ldab    byte_84E1
        mul
        staa    <Ram_BD

loc_C4BE:
        bclr    <BitFlags2c 4

loc_C4C1:
        ldaa    LDXi_6490
        ldab    <Ram_BD
        aba
        bcc     loc_C4CB

loc_C4C9:
        ldaa    #$FF

loc_C4CB:
        staa    <Ram_84
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C4CE:
        ldd     <Ram_73
        cpd     word_84EC
        bcc     loc_C4DB
        bset    <BitFlags29 $20
        bra     loc_C4E7

loc_C4DB:
        bclr    <BitFlags29 $20
        brset   <BitFlags2c $80 loc_C4E7
        tst     Ram_82
        beq     loc_C4EC

loc_C4E7:
        ldaa    byte_84EB
        staa    <CounterDn_b9_o2

loc_C4EC:
        ldaa    <Ram_B4
        cmpa    byte_8A55
        bcs     loc_C519
        brclr   <BitFlags29 $80 loc_C508
        brset   <b5D_IPL2_t3 1 loc_C538
        ldd     #$381
        jsr     ThrowNonCriticalError_
        bcc     loc_C519
        bset    <b5D_IPL2_t3 1
        bra     loc_C538

loc_C508:
        brset   <b5D_IPL2_t3 2 loc_C538
        ldd     #$481
        jsr     ThrowNonCriticalError_
        bcc     loc_C519
        bset    <b5D_IPL2_t3 2
        bra     loc_C538

loc_C519:
        tst     CounterDn_b9_o2
        bne     loc_C538
        ldd     <Counter_A_HB
        bne     loc_C538
        brset   <BitFlags29 $40 loc_C532
        ldaa    <O2SensorVolts
        cmpa    byte_8A53
        bcc     loc_C532
        cmpa    byte_8A54
        bcc     loc_C538

loc_C532:
        ldaa    <O2SensorVolts
        cmpa    #$3E
        bcs     loc_C54B

loc_C538:
        bclr    <BitFlags29 $54
        ldaa    byte_8649
        staa    <CounterDn_ba_o2
        ldaa    byte_864B
        staa    <CounterDn_bc_o2
        ldaa    #$80
        staa    <Counter_O2SensorFeedbackCount_Signed
        bra     locret_C577

loc_C54B:
        jsr     sub_C578
        ldaa    <BitFlags29
        bita    #4
        beq     loc_C55C
        clr     Ram_B4
        jsr     sub_C5A3
        bra     loc_C55F

loc_C55C:
        jsr     sub_C5DF

loc_C55F:
        brset   <BitFlags29 $80 loc_C56B
        adda    <Counter_O2SensorFeedbackCount_Signed
        bcc     loc_C572
        ldaa    #$FF
        bra     loc_C572

loc_C56B:
        tab
        ldaa    <Counter_O2SensorFeedbackCount_Signed
        sba
        bcc     loc_C572
        clra

loc_C572:
        staa    <Counter_O2SensorFeedbackCount_Signed
        bset    <BitFlags29 $40

locret_C577:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C578:
        ldab    <O2SensorVolts
        ldaa    <BitFlags29
        cmpb    <o2HighLimitForInMiddleDetermination
        bcs     loc_C58C
        cmpb    <o2LowLimitForInMiddleDetermination
        bcc     loc_C588
        brclr   <BitFlags29 $80 loc_C58C

loc_C588:
        ldab    #$80
        bra     loc_C58D

loc_C58C:
        clrb

loc_C58D:
        pshb
        eorb    <BitFlags29
        aslb
        bcc     loc_C59A
        oraa    #4
        clr     Ram_B4
        bra     loc_C59C

loc_C59A:
        anda    #$FB

loc_C59C:
        anda    #$7F
        pulb
        aba
        staa    <BitFlags29
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C5A3:
        brclr   <BitFlags29 $10 loc_C5B5
        ldaa    <CounterUp_b6_o2
        ldab    byte_8648
        cba
        bcs     loc_C5B3
        stab    <Ram_B5
        bra     loc_C5B5

loc_C5B3:
        staa    <Ram_B5

loc_C5B5:
        bclr    <BitFlags29 $10
        clr     CounterUp_b6_o2
        ldaa    byte_8649
        staa    <CounterDn_ba_o2
        ldaa    byte_864B
        staa    <CounterDn_bc_o2
        ldab    <Ram_B5
        ldaa    <EngineRpm_HB
        cmpa    byte_8647
        bcc     loc_C5D3
        addb    byte_8645
        bra     loc_C5D6

loc_C5D3:
        addb    byte_8646

loc_C5D6:
        bcc     loc_C5DA
        ldab    #$FF

loc_C5DA:
        tba
        lsr     Ram_B5
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C5DF:
        clra
        ldab    <CounterDn_bc_o2
        bne     loc_C62C
        ldab    <BitFlags29
        bitb    #$10
        bne     loc_C5F9
        clr     CounterUp_b6_o2
        bset    <BitFlags29 $10
        ldab    byte_864A
        stab    <CounterDn_bb_o2
        ldaa    #1
        bra     locret_C637

loc_C5F9:
        ldab    <CounterUp_b6_o2
        cmpb    byte_864D
        bcs     loc_C61F
        brset   <BitFlags2c $80 loc_C612
        ldab    <VehicleSpeedx8_Scaled
        beq     loc_C612
        ldab    <EngineRpm_HB
        cmpb    byte_8A52
        bcs     loc_C612
        inc     Ram_B4

loc_C612:
        ldaa    byte_864C
        clrb
        lsrd
        lsrd
        lsrd
        lsrd
        std     <Counter_A_HB
        clra
        bra     locret_C637

loc_C61F:
        ldab    <CounterDn_bb_o2
        bne     loc_C62A
        ldaa    #1
        ldab    byte_864A
        stab    <CounterDn_bb_o2

loc_C62A:
        bra locret_C637

loc_C62C:
        ldab    <CounterDn_ba_o2
        bne     locret_C637
        ldab    byte_8649
        stab    <CounterDn_ba_o2
        ldaa    #1

locret_C637:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C638:
        brclr   <BitFlags66_t3 $80 loc_C64C
        ldab    <MapValue
        subb    <MapValueTemp1
        bcs     loc_C64C
        ldaa    <Ram_A4
        bne     loc_C64F
        ldaa    byte_8650
        cba
        bcs     loc_C64F

loc_C64C:
        clrb
        bra     loc_C651

loc_C64F:
        ldaa    <Ram_A3

loc_C651:
        mul
        std     <Ram_A4
        ldaa    <TPSVoltsTemp_A
        ldab    byte_8652
        addb    <LowestSessionTpsVolts
        bcc     loc_C65F
        ldab    #$FF

loc_C65F:
        cba
        bcc     loc_C66D
        ldaa    <TpsVolts
        suba    <TPSVoltsTemp_A
        bcs     loc_C66D
        cmpa    byte_8651
        bcc     loc_C66E

loc_C66D:
        clra

loc_C66E:
        ldab    <Ram_A6
        mul
        std     <Ram_A7
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C674:
        clra
        ldab    <Counter_C
        beq     loc_C67C
        jmp     locret_C6B4

loc_C67C:
        ldab    <EngineRpm_HB
        cmpb    byte_8657
        bcs     loc_C690
        ldab    <MapValueTemp2
        subb    <MapValue
        bcs     loc_C690
        cmpb    byte_8655
        bcs     loc_C690
        ldaa    <Ram_A9

loc_C690:
        mul
        std     <Ram_AA
        ldab    <TpsVolts
        ldaa    <LowestSessionTpsVolts
        adda    byte_8659
        bcc     loc_C69E
        ldaa    #$FF

loc_C69E:
        cba
        bcs     loc_C6AB
        ldaa    <TPSVoltsTemp_B
        sba
        bcs     loc_C6AB
        cmpa    byte_8658
        bcc     loc_C6AF

loc_C6AB:
        clra
        clrb
        bra     loc_C6B2

loc_C6AF:
        ldab    <Ram_AC
        mul

loc_C6B2:
        std     <Ram_AD

locret_C6B4:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C6B5:
        ldaa    <EngineRpm_HB
        cmpa    byte_8A1C
        bcc     loc_C6E7
        brclr   <BitFlags2f 8 loc_C6DB
        bclr    <BitFlags2f 8
        ldaa    <CoolantTemp_fromTable_Scaled
        ldx     #$8A1E
        jsr     sub_E68D
        clra
        lsld
        lsld
        lsld
        lsld
        std     STe_64BA
        ldaa    byte_8A1D
        staa    STe_64BC
        bra     locret_C6EC

loc_C6DB:
        ldaa    STe_64BC
        cmpa    #0
        beq     loc_C6E7
        dec     STe_64BC
        bra     locret_C6EC

loc_C6E7:
        clra
        clrb
        std     STe_64BA

locret_C6EC:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C6ED:
        ldaa    STe_64C0
        beq     loc_C6F7
        dec     STe_64C0
        bra     locret_C725

loc_C6F7:
        brclr   <BitFlags2f $10 loc_C716
        bclr    <BitFlags2f $10
        ldx     #$8A29
        ldaa    <CoolantTemp_fromTable_Scaled
        jsr     sub_E68D
        clra
        lsld
        lsld
        lsld
        lsld
        std     STe_64BE
        ldaa    byte_8A28
        staa    STe_64BD
        bra     locret_C725

loc_C716:
        ldaa    STe_64BD
        beq     loc_C720
        dec     STe_64BD
        bra     locret_C725

loc_C720:
        clra
        clrb
        std     STe_64BE

locret_C725:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C726:
        ldx     #$648F
        ldaa    #1
        ldab    <Ram_81
        std     DoubleTempC
        ldab    <Ram_82
        jsr     sub_E6E9
        std     DoubleTempC
        ldaa    #1
        ldab    <Ram_0B
        jsr     sub_E6E9
        std     DoubleTempC
        ldaa    #1
        ldab    <Counter_O2SensorFeedbackCount_Signed
        jsr     sub_E6E9
        std     DoubleTempC
        xgdy
        ldaa    <Ram_84
        jsr     ScaleYbyA
        xgdy
        lsld
        lsld
        addd    DoubleTempC
        std     <PWMULT_Adaptive_fuel_pulsewidth_multiplier
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C75D:
        ldaa    ADCTL_A2DControlReg
        bpl     sub_C75D
        ldab    ADR4_A2DResults4
        stab    <LastTpsVolts
        cmpb    byte_8A59
        bcs     loc_C777
        cmpb    byte_8A5A
        bcc     loc_C777
        brset   <b5C_IPL1_t3 $40 loc_C777
        stab    <TpsVolts

loc_C777:
        ldaa    ADR1_A2DResults1
        ldab    <EngineRpm_HB
        cmpb    #$2F
        bcc     loc_C78E
        cmpb    #$D
        bcs     loc_C78E
        cmpa    byte_8A66
        bcc     loc_C792
        cmpa    byte_8A65
        bcs     loc_C792

loc_C78E:
        brclr   <b5C_IPL1_t3 $88 loc_C795

loc_C792:
        jsr     loc_D7BF

loc_C795:
        jsr     ConvertMAPVoltsToValue
        tab
        addb    MapValue_t3
        rorb
        stab    <MapValue

loc_C79F:
        brset   <IPL1 $40 loc_C7A6
        jmp     loc_C8D2

loc_C7A6:
        brset   <BitFlags27 8 loc_C7B4
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #8
        beq     loc_C7B4
        jsr     Interrupt_DwellTimer

loc_C7B4:
        jsr     sub_C638
        ldx     #$84DF
        ldaa    <MapValue2
        cmpa    <MapValue
        bcc     loc_C7C3
        ldx     #$84DE

loc_C7C3:
        ldy     #$90
        ldaa    <MapValue
        jsr     ProcessMapOrTpsBlockData
        jsr     sub_C474
        brclr   <BitFlags27 $40 loc_C7DD
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$10
        beq     loc_C7DD
        jsr     DwellTimerOC4Interrupt

loc_C7DD:
        brclr   <BitFlags27 8 loc_C7EB
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$40
        beq     loc_C7EB
        jsr     nullsub_1

loc_C7EB:
        clra
        ldab    <MapValue
        lsld
        lsld
        tst     word_84D7
        bmi     loc_C7FA
        addd    word_84D7
        bra     loc_C802

loc_C7FA:
        addd    word_84D7
        bgt     loc_C802
        ldd     #0

loc_C802:
        xgdy
        ldaa    <Ram_85
        jsr     ScaleYbyA
        xgdy
        lsld
        bcc     loc_C811
        ldd     #$FFFF

loc_C811:
        std     DoubleTempC
        brset   <BitFlags27 8 loc_C822
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #8
        beq     loc_C822
        jsr     Interrupt_DwellTimer

loc_C822:
        ldaa    #1
        ldab    <Ram_86
        ldx     #$648F
        jsr     sub_E6E9
        ldx     #$75
        jsr     ScaleXbyB_somethingelse
        std     DoubleTempB
        brclr   <BitFlags27 8 loc_C843
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$40
        beq     loc_C843
        jsr     nullsub_1

loc_C843:
        clra
        ldab    <Ram_B1
        lsld
        lsld
        addb    <ValueFromAdaptiveMemory
        adca    #0
        tst     word_84D9
        bmi     loc_C85B
        addd    word_84D9
        bvc     loc_C85E
        ldd     #$7FFF
        bra     loc_C85E

loc_C85B:
        addd    word_84D9

loc_C85E:
        std     <Ram_C0
        ldx     #$8418
        ldaa    <MapVolts
        jsr     sub_E68D
        stab    <Ram_C2
        ldd     DoubleTempB
        addd    <MAPLoadFactor
        bcs     loc_C883
        addd    <Ram_A7
        bcs     loc_C883
        addd    <Ram_A4
        bcs     loc_C883
        addd    STe_64BA
        bcs     loc_C883
        addd    STe_64BE
        bcc     loc_C886

loc_C883:
        ldd     #$FFFF

loc_C886:
        subd    <Ram_AD
        bcs     loc_C88E
        subd    <Ram_AA
        bcc     loc_C891

loc_C88E:
        ldd     #0

loc_C891:
        std     DoubleTempB
        ldy     DoubleTempB
        ldaa    <Ram_C2
        jsr     ScaleYbyA
        xgdy
        lsrd
        lsrd
        std     DoubleTempC
        ldd     DoubleTempB
        subd    DoubleTempC
        std     DoubleTempB
        tst     Ram_C0
        bpl     loc_C8C9
        ldd     #0
        subd    <Ram_C0
        cpd     DoubleTempB
        bpl     loc_C8C4
        ldd     DoubleTempB
        addd    <Ram_C0
        bra     loc_C8D0

loc_C8C4:
        ldd     #0
        bra     loc_C8D0

loc_C8C9:
        addd    <Ram_C0
        bcc     loc_C8D0
        ldd     #$FFFF

loc_C8D0:
        std     <Ram_73

loc_C8D2:
        brset   <BitFlags27 8 loc_C8E0
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #8
        beq     loc_C8E0
        jsr     Interrupt_DwellTimer

loc_C8E0:
        brclr   <BitFlags27 $40 loc_C8EE
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$10
        beq     loc_C8EE
        jsr     DwellTimerOC4Interrupt

loc_C8EE:
        brset   <IPL1 $40 loc_C93E
        ldx     #$84DF
        ldaa    <MapValue2
        cmpa    <MapValue
        bcc     loc_C8FE
        ldx     #$84DE

loc_C8FE:
        ldy     #$90
        ldaa    <MapValue
        jsr     ProcessMapOrTpsBlockData
        brclr   <BitFlags66_t3 $40 loc_C915
        brclr   <Ram_30 4 loc_C915
        clra
        clrb
        std     <InjectorPulsewidth_HB
        bra     loc_C952

loc_C915:
        ldaa    <CoolantTemp
        cmpa    TL_TL_8483
        bcs     loc_C938
        ldaa    <ChargeTempVolts
        cmpa    TL_TL_8484
        bcs     loc_C938
        ldaa    <Ram_80
        cmpa    #$FF
        beq     loc_C938
        inca
        staa    <Ram_80
        cmpa    TL_TL_8485
        bhi     loc_C938
        ldd     #0
        std     <InjectorPulsewidth_HB
        bra     loc_C952

loc_C938:
        ldd     <Ram_71
        std     <InjectorPulsewidth_HB
        bra     loc_C952

loc_C93E:
        ldd     <Ram_71
        beq     loc_C94F
        subd    TL_TL_8481
        bcs     loc_C94B
        std     <Ram_71
        bra     loc_C94F

loc_C94B:
        clra
        clrb
        std     <Ram_71

loc_C94F:
        jsr     sub_C975

loc_C952:
        jsr     CalculateAverageValues
        brclr   <BitFlags27 $40 loc_C963
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$10
        beq     loc_C963
        jsr     DwellTimerOC4Interrupt

loc_C963:
        brclr   <BitFlags27 8 loc_C971
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$40
        beq     loc_C971
        jsr     nullsub_1

loc_C971:
        jsr     AVG2_CalculateAverages2
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_C975:
        ldx     #$E1
        brclr   0,x $20 loc_C982
        ldd     #0
        jmp     loc_CA12

loc_C982:
        brset   <BitFlags2c $80 loc_C989
        jmp     loc_C9E0

loc_C989:
        ldaa    byte_8680
        ldab    <TargetIdleSpeedHB
        mul
        addd    <TargetIdleSpeedHB
        bcc     loc_C996
        ldd     #$FFFF

loc_C996:
        staa    <RpmRelated0087
        cpd     <EngineRpm_HB
        bcs     loc_C99F
        bra     loc_C9D5

loc_C99F:
        ldx     <Ram_73
        ldaa    byte_867F
        bne     loc_C9AD
        cpx     word_867D
        bhi     loc_C9D5
        bra     loc_C9E0

loc_C9AD:
        cmpa    #1
        bne     loc_C9BC
        brclr   <BitFlags66_t3 $80 loc_C9E0
        cpx     word_867D
        bhi     loc_C9D5
        bra     loc_C9E0

loc_C9BC:
        cmpa    #2
        bne     loc_C9CB
        brset   <BitFlags66_t3 $80 loc_C9D5
        cpx     word_867D
        bhi     loc_C9D5
        bra     loc_C9E0

loc_C9CB:
        cmpa    #3
        bne     loc_C9D5
        brset   <BitFlags66_t3 $80 loc_C9D5
        bra     loc_C9E0

loc_C9D5:
        bclr    <BitFlags2c $80
        bset    <BitFlags2c 8
        ldaa    byte_867C
        staa    <CounterDn_b7_o2

loc_C9E0:
        ldy     word_84DB
        brclr   <BitFlags2c $80 loc_C9EC
        clra
        clrb
        bra     loc_C9FD

loc_C9EC:
        ldd     <Ram_73
        cpd     <Ram_71
        bcc     loc_C9F5
        ldd     <Ram_71

loc_C9F5:
        cpd     word_84DB
        bcc     loc_C9FD
        xgdy

loc_C9FD:
        ldx     #$6481
        brclr   0,x 4 loc_CA12
        ldaa    UNe_6483
        clrb
        brset   0,x 8 loc_CA0F
        ldab    UNe_6484

loc_CA0F:
        lsrd
        lsrd
        lsrd

loc_CA12:
        std     <InjectorPulsewidth_HB
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRBSerialToggles:
        fcb   0
        fcb   0
        fcb   0
        fcb $20
        fcb $20
        fcb $30
        fcb $20
        fcb   0
        fcb $20
        fcb $20
        fcb $20
        fcb   0
        fcb $30
        fcb $30
        fcb $30
        fcb $30
        fcb $30
        fcb $20
        fcb $20
        fcb $20

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_CA29:
        jsr     sub_DDB8
        jsr     sub_DEAD
        ldab    <DRBSerialMode
        bitb    #$C0
        bne     locret_CA94
        ldaa    BAUD_SerialBaudRate
        anda    #$37
        cmpa    #$22
        beq     loc_CA44
        ldaa    #$22
        staa    BAUD_SerialBaudRate
        rts

loc_CA44:
        ldaa    SCSR_SerialStatus
        bita    #$E
        beq     loc_CA4F
        ldaa    SCDR_SerialData
        rts

loc_CA4F:
        bita    #$20
        bne     DRB_ChrRxd
        brset   <DRBSerialMode $F loc_CA5B
        incb
        stab    <DRBSerialMode
        rts

loc_CA5B:
        brclr   <DRBSerialMode $30 locret_CA65
        bclr    <DRBSerialMode $30
        clr     DRBPointer1

locret_CA65:
        rts

DRB_ChrRxd:
        ldaa    SCDR_SerialData
        staa    SCDR_SerialData
        andb    #$F0
        stab    <DRBSerialMode
        bitb    #$30
        bne     DRB_StorePointer
        staa    <DRBPointer1
        cmpa    #$14
        beq     DRB_SetModeVar
        bclr    <BitFlags6d_t3 8

DRB_SetModeVar:
        clr     DRBPointer2
        clr     DRBPointer3
        tab
        subb    #$10
        cmpb    #$14
        bcc     locret_CA94
        ldx     #$CA15
        abx
        ldab    0,x
        orab    <DRBSerialMode
        stab    <DRBSerialMode

locret_CA94:
        rts

DRB_StorePointer:
        bitb    #$20
        beq     DRB_SendMemLocToSCI
        jmp     loc_CAB7

DRB_SendMemLocToSCI:
        bitb    #$10
        bne     loc_CAA3
        jmp     loc_CAD4

loc_CAA3:
        staa    <DRBPointer3
        andb    #$CF
        stab    <DRBSerialMode
        rts

SendECUIDToSCI:
        clr     DRBPointer1
        ldab    <DRBPointer3
        ldaa    <DRBPointer2
        xgdx
        ldaa    0,x

loc_CAB4:
        jmp     SerialOutput1a

loc_CAB7:
        staa    <DRBPointer2
        andb    #$DF
        stab    <DRBSerialMode
        ldab    <DRBPointer1
        cpd     #$1014
        bne     loc_CADD
        brset   <BitFlags66_t3 $80 loc_CAD4
        brset   <BitFlags27 1 loc_CAE2
        brclr   <BitFlags68_t3 $10 loc_CAE2
        bclr    <BitFlags68_t3 $80

loc_CAD4:
        clr     DRBPointer1
        clr     DRBPointer2
        clr     DRBPointer3

loc_CADD:
        bclr    <BitFlags6d_t3 8
        bra     locret_CAE5

loc_CAE2:
        bset    <BitFlags6d_t3 8

locret_CAE5:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRB_ResetEMR:
        clr     DRBPointer1
        brset   <BitFlags6a_t3 $40 loc_CB02
        brset   <BitFlags6a_t3 $20 loc_CB02
        bset    <BitFlags6a_t3 $40
        ldaa    <DRBPointer3
        staa    DRBOffsetStored_LB
        ldab    <DRBPointer2
        stab    DRBOffsetStored_HB
        ldaa    #$E2
        bra     loc_CAB4

loc_CB02:
        clra
        bra     loc_CAB4

DRB_UseRAMForSpecialProgramRoutine:
        ldx     #0
        bra     loc_CB2D

DRB_UseRAM2ForSpecialProgramRoutine:
        ldx     #$6480
        bra     loc_CB2D

DRB_CheckSpecialProgramSize:
        ldx     #$64C9
        ldaa    <DRBPointer2
        bne     loc_CB2A
        ldab    <DRBPointer3
        abx
        cpx     #$64D0
        bcs     loc_CB2A
        ldaa    #$FF
        staa    DRB_ProgramModeFlag

loc_CB23:
        clr     DRBPointer1
        clra
        jmp     SerialOutput1a

loc_CB2A:
        ldx     #$64C9

loc_CB2D:
        clr     DRBPointer1
        ldab    <DRBPointer2
        ldaa    <DRBPointer3
        abx
        staa    0,x
        ldaa    #$E5
        jmp     SerialOutput1a

DRB_SpecialProgramMode:
        ldx     #$64C9
        ldab    <DRBPointer3
        cmpb    1,x
        beq     loc_CB4A
        comb
        cmpb    1,x
        bne     DRB_OutputSpecialCodes

loc_CB4A:
        ldab    <DRBPointer2
        cmpb    0,x
        bne     loc_CB79
        abx
        ldaa    1,x
        cmpa    #$39
        bne     loc_CB23
        ldx     #$64C9
        clra

loc_CB5B:
        inx
        adda    1,x
        decb
        bne     loc_CB5B
        cmpa    <DRBPointer3
        beq     loc_CB6E
        ldab    <DRBPointer3
        comb
        cba
        bne     DRB_OutputSpecialCodes
        jmp     DRB_SpecialProgramRoutine

loc_CB6E:
        com     DRBPointer3
        ldaa    #$E4
        bra     loc_CBA5

DRB_OutputSpecialCodes:
        ldaa    #1
        bra     loc_CB7F

loc_CB79:
        ldaa    #2
        bra     loc_CB7F

loc_CB7D:
        ldaa    #3

loc_CB7F:
        clr     DRBPointer1
        bra     loc_CBA5

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRB_Special1:
        ldaa    <DRBPointer2
        bne     loc_CB8D
        bclr    <BitFlags2a 1
        bra     loc_CB23

loc_CB8D:
        ldaa    <DRBPointer3
        bne     loc_CBA8
        brset   <BitFlags66_t3 $80 loc_CB79
        brset   <BitFlags27 1 loc_CB9D
        brset   <BitFlags68_t3 $10 loc_CB7D

loc_CB9D:
        coma
        staa    <DRBPointer3
        ldaa    #1
        bset    <BitFlags2a 1

loc_CBA5:
        jmp     SerialOutput1a

loc_CBA8:
        brset   <BitFlags66_t3 $80 loc_CBB4
        brset   <BitFlags27 1 locret_CBB7
        brclr   <BitFlags68_t3 $10 locret_CBB7

loc_CBB4:
        clr     DRBPointer1

locret_CBB7:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRB_Special2:
        ldaa    <DRBPointer3
        beq     loc_CBE1
        ldaa    <DRBPointer2
        cmpa    #1
        beq     loc_CBCC
        cmpa    #2
        beq     loc_CBD0
        cmpa    #3
        beq     loc_CBD4
        bra     loc_CBB4

loc_CBCC:
        ldd     <EngineRpm_HB
        bra     loc_CBD6

loc_CBD0:
        ldd     <InjectorPulsewidth_HB
        bra     loc_CBD6

loc_CBD4:
        ldd     <TargetIdleSpeedHB

loc_CBD6:
        stab    Temp0
        jsr     SerialOutput1a
        ldaa    Temp0
        bra     loc_CBA5

loc_CBE1:
        coma
        staa    <DRBPointer3
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRB_ClearAdaptiveMemory:
        clr     DRBPointer1
        ldab    <TimerOverflowsBetweenCamPulses
        cmpb    #$50
        bls     loc_CBF0
        bra     loc_CBF4

loc_CBF0:
        clra
        jmp     SerialOutput1a

loc_CBF4:
        ldaa    <DRBPointer2
        cmpa    #1
        beq     loc_CC0B
        cmpa    #2
        beq     loc_CC1C
        cmpa    #3
        beq     loc_CC24
        cmpa    #4
        beq     loc_CC30
        ldaa    #1
        jmp     SerialOutput1a

loc_CC0B:
        brclr   <BitFlags6a_t3 $40 loc_CC14
        ldaa    #2
        jmp     SerialOutput1a

loc_CC14:
        jsr     DRB_ClearErrorCodes

loc_CC17:
        ldaa    #$F0
        jmp     SerialOutput1a

loc_CC1C:
        ldaa    #$80
        staa    <ValueFromAdaptiveMemory
        staa    <Ram_0B
        bra     loc_CC17

loc_CC24:
        sei
        bset    <BitFlags36_t3 $40
        ldaa    #$DF
        staa    <CurrentAisPosition
        cli
        jmp     loc_CC17

loc_CC30:
        ldaa    TL_ValueOf_MINTHR_WhenBatteryDisconnected
        staa    <LowestSessionTpsVolts
        bra     loc_CC17

DRB_ClearErrorCodes:
        clra
        clrb
        std     <ErrorBitRegister0
        std     <ErrorBitRegister2
        std     <ErrorBitRegisterStored0
        std     <ErrorBitRegisterStored2
        std     <ErrorCodeUpdateKeyOnCount
        staa    <ErrorCodeUpdateKeyOnCount3
        std     <b5C_IPL1_t3
        staa    <b5d_IPL2
        staa    UNe_64B9
        jsr     ErrorCodeResetEeprom
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRBFunctTable:
        fdb OutputErrorCodes
        fdb OutputErrorBits
        fdb SetupHiSpeedDataTransfer
        fdb SetupATM
        fdb DRB_Return
        fdb SendECUIDToSCI
        fdb SendConstValues
        fdb ClearErrorCodes
        fdb DRB_Return
        fdb DRB_Return
        fdb DRB_Return
        fdb InitByteModeDownload
        fdb DRB_ResetEMR
        fdb DRB_UseRAMForSpecialProgramRoutine
        fdb DRB_UseRAM2ForSpecialProgramRoutine
        fdb DRB_CheckSpecialProgramSize

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRBTable:
        fdb DRB_SpecialProgramMode
        fdb DRB_Special1
        fdb DRB_Special2
        fdb DRB_ClearAdaptiveMemory

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DRBIIOutput:
        ldaa    <DRBSerialMode
        bita    #$30
        beq     loc_CC7F
        rts

loc_CC7F:
        ldaa    <DRBPointer1
        beq     locret_CCA2
        cmpa    #$A
        beq     locret_CCA2
        tab
        ldx     #$CC50
        subb    #$10
        bcs     loc_CC99
        aslb
        cmpb    #$28
        bcc     loc_CC99
        abx
        ldx 0,x
        jmp 0,x

loc_CC99:
        bclr    <DRBSerialMode $30
        clra
        staa    <DRBPointer1
        jmp     SerialOutput1a

locret_CCA2:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ClearErrorCodes:
        clra
        ldab    <TimerOverflowsBetweenCamPulses
        cmpb    #$50
        bhi     loc_CCB2
        staa    <DRBPointer1
        bclr    <DRBSerialMode $30
        jmp     SerialOutput1a

loc_CCB2:
        ldab    <DRBSerialMode
        andb    #$F
        cmpb    #3
        bls     loc_CCBD
        clr     BitFlags65_t3

loc_CCBD:
        ldaa    BitFlags65_t3
        inca
        cmpa    #$18
        bls     loc_CCD7
        brset   <BitFlags6a_t3 $40 loc_CCDA
        clra
        staa    <DRBPointer1
        staa    BitFlags65_t3
        jsr     DRB_ClearErrorCodes
        ldaa    #$E0
        jmp     SerialOutput1a

loc_CCD7:
        staa    BitFlags65_t3

loc_CCDA:
        ldd #$FF00
        stab    <DRBPointer1
        bra     SerialOutput1a

SetupATM:
        ldab    <TimerOverflowsBetweenCamPulses
        cmpb    #$50
        bls     loc_CD13
        ldaa    <DRBPointer2
        asla
        bcs     loc_CD13
        cmpa    #$4E
        bhi     loc_CD13
        ldx     #$CDDB
        ldab    <DRBPointer2
        aslb
        abx
        ldd     0,x
        cpd     #$D09C
        beq     loc_CD13
        ldaa    <DRBPointer2
        brset   <BitFlags27 1 loc_CD0B
        cmpa    #$17
        beq     loc_CD13
        bra     loc_CD18

loc_CD0B:
        cmpa    #$F
        beq     loc_CD13
        cmpa    #$16
        bne     loc_CD18

loc_CD13:
        clra
        staa    <DRBPointer1
        staa    <DRBPointer2

loc_CD18:
        cmpa    <ATMOffset
        beq     SerialOutput1a
        staa    <ATMOffset
        ldab    #2
        stab    <KeyOnOrEngineRunningTime

SerialOutput1a:
        ldab    SCSR_SerialStatus
        bpl     SerialOutput1a
        staa    SCDR_SerialData
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

OutputErrorCodes:
        ldx     #$15
        ldab    <DRBPointer2
        cmpb    #7
        bhi     loc_CD41
        negb
        addb    #7
        abx
        inc     DRBPointer2
        ldaa    0,x
        beq     loc_CD41
        bra     SerialOutput1a

loc_CD41:
        clr     DRBPointer1
        ldaa    #$FE
        bsr     SerialOutput1a
        adda    #$10
        ldx     #$14

loc_CD4D:
        inx
        cpx     #$1D
        bcc     SerialOutput1a
        adda    0,x
        bra     loc_CD4D

OutputErrorBits:
        ldaa    <ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
        brclr   <DRBPointer2 $FF loc_CD62
        ldaa    <ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB
        clr     DRBPointer1

loc_CD62:
        inc     DRBPointer2
        bra     SerialOutput1a

SetupHiSpeedDataTransfer:
        bset    <DRBSerialMode $80
        clr     DRBPointer1

loc_CD6D:
        ldaa    SCSR_SerialStatus
        bita    #$40
        beq     loc_CD6D
        ldaa    #1
        staa    BAUD_SerialBaudRate

DRB_Return:
        rts

InitByteModeDownload:
        bset    <DRBSerialMode $40
        clr     DRBPointer1
        rts

SendConstValues:
        ldaa    <DRBPointer2
        cmpa    #$80
        beq     loc_CD93
        cmpa    #$81
        beq     loc_CDBE
        cmpa    #$82
        beq     loc_CDC3
        clr     DRBPointer1
        rts

loc_CD93:
        ldx     #$8002
        brclr   <BitFlags6a_t3 2 loc_CD9D
        ldx     #$8007

loc_CD9D:
        ldab    <DRBPointer3
        cmpb    #4
        beq     loc_CDAC
        inc     DRBPointer3
        abx
        ldaa    0,x
        jmp     SerialOutput1a

loc_CDAC:
        ldaa    0,x
        adda    1,x
        adda    2,x
        adda    3,x

loc_CDB4:
        adda    #$16
        adda    <DRBPointer2
        clr     DRBPointer1

loc_CDBB:
        jmp     SerialOutput1a

loc_CDBE:
        ldx     #$800D
        bra     loc_CD9D

loc_CDC3:
        inc     DRBPointer3
        ldaa    byte_8006
        brclr   <BitFlags6a_t3 2 loc_CDD0
        ldaa    byte_800B

loc_CDD0:
        ldab    <DRBPointer3
        cmpb    #1
        beq     loc_CDBB
        cmpb    #5
        bcc     loc_CDB4
        clra
        bra     loc_CDBB

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fdb ATM_IgnitionCoil1
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_InjBank4
        fdb ATM_InjBank3
        fdb ATM_InjBank2
        fdb ATM_AISMotorOpenClose
        fdb ATM_FanRelay
        fdb ATM_ACClutchRelay
        fdb ATM_ASDRelay
        fdb ATM_PurgeSolenoid
        fdb ATM_SCServoSolenoid
        fdb ATM_Tachometer
        fdb ATM_PTUIndicator
        fdb ATM_EGRSolenoid
        fdb Lce9f
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_AllSolenoidsRelays
        fdb Lce93
        fdb Lced4
        fdb ATM_EGRSolenoid
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_BaroReadSolenoid
        fdb ATM_InjBank1
        fdb Lcfb2
        fdb Lcfa2
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fdb ATM_SerialOut
        fcb $CE
        fcb $DF
        fcb $FF
        fcb $53
        fcb $FF
        fcb $FF
        fcb $54
        fcb $59
        fcb $5A
        fcb   6
        fcb $FF
        fcb $5B
        fcb $50
        fcb   8
        fcb  $A
        fcb  $B
        fcb  $D
        fcb $46
        fcb $46
        fcb $FF
        fcb $1D
        fcb $FF
        fcb $4E
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $52
        fcb $58
        fcb $C4
        fcb $1E
        fcb $1F
        fcb $33
        fcb $FF
        fcb $4B
        fcb $65
        fcb $64
        fcb $FF
        fcb $FF
        fcb $E1
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $67

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

RTDataTbl_:
        fdb SCI_MAPVolts
        fdb SCI_Speed
        fdb SCI_O2Volts
        fdb SCI_Ld0c7
        fdb SCI_Ld0ca
        fdb SendBaro
        fdb SendTPS
        fdb SCI_Ld0ef
        fdb SCI_LD07B
        fdb SCI_Ld08c
        fdb SCI_Ld090
        fdb SCI_Ld096

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ActuatorTestMode_MM:
        ldaa    <TimerOverflowsBetweenCamPulses
        cmpa    #$50
        bhi     loc_CE79
        clr     ATMOffset

loc_CE79:
        ldab    <ATMOffset
        bne     loc_CE80
        jmp     ATM_SerialOut

loc_CE80:
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    #$96
        bcs     loc_CE97
        clrb
        ldaa    <DRBPointer1
        cmpa    #$13
        bne     loc_CE91
        stab    <DRBPointer1
        stab    <DRBPointer2

loc_CE91:
        clr     ATMOffset
        jmp     ATM_SerialOut

loc_CE97:
        ldx     #$CDDB
        aslb
        abx
        ldx     0,x
        jmp     0,x

ATM_SCServoSolenoid:
        ldaa    <PIA2_Buffer_t3
        oraa    #$C0
        ldab    <Counter_MainLoop
        cmpb    #$55
        bcs     loc_CF20
        anda    #$3F
        cmpb    #$AA
        bcs     loc_CF20
        oraa    #$80
        bra     loc_CF20

ATM_PurgeSolenoid:
        ldaa    <PIA2_Buffer_t3
        oraa    #$20
        brset   <Counter_MainLoop $80 loc_CF20
        anda    #$DF
        bra     loc_CF20

ATM_ASDRelay:
        ldaa    TCTL1_TimerControlReg1
        anda    #$FE
        staa    TCTL1_TimerControlReg1
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldaa    <PIA2_Buffer_t3
        oraa    #$10
        brset   <Counter_MainLoop $80 loc_CF20
        anda    #$EF
        bra     loc_CF20

ATM_BaroReadSolenoid:
        ldaa    <PIA2_Buffer_t3
        anda    #$EF
        bra     loc_CF20
        brset   <BitFlags27 8 loc_CEEF
        ldaa    <PIA2_Buffer_t3
        oraa    #8
        brset   <Counter_MainLoop $80 loc_CF20
        anda    #$F7
        bra     loc_CF20

loc_CEEF:
        ldaa    <PIA1_Buffer_t3
        oraa    #$80
        brset   <Counter_MainLoop $80 loc_CEF9
        anda    #$7F

loc_CEF9:
        staa    <PIA1_Buffer_t3
        jmp     ATM_SerialOut

Lce93:
        ldaa    <PIA2_Buffer_t3
        oraa    #4
        brset   <Counter_MainLoop $80 loc_CF20
        anda    #$FB
        bra     loc_CF20

Lce9f:
        ldaa    <PIA2_Buffer_t3
        oraa    #2
        brset   <Counter_MainLoop $80 loc_CF20
        anda    #$FD
        bra     loc_CF20

ATM_ACClutchRelay:
        ldaa    <PIA2_Buffer_t3
        oraa    #1
        brset   <Counter_MainLoop $80 loc_CF20
        anda    #$FE

loc_CF20:
        staa    <PIA2_Buffer_t3
        jmp     ATM_SerialOut

ATM_FanRelay:
        ldaa    <PIA1_Buffer_t3
        anda    #$7F
        ldab    <Counter_MainLoop
        andb    #$78
        beq     loc_CF49
        oraa    #$80
        bra     loc_CF49

ATM_EGRSolenoid:
        ldaa    <PIA1_Buffer_t3
        oraa    #$20
        brset   <Counter_MainLoop $80 loc_CF49
        anda    #$DF
        bra     loc_CF49

Lced4:
        ldaa    <PIA1_Buffer_t3
        oraa    #$10
        brset   <Counter_MainLoop $80 loc_CF49
        anda    #$EF

loc_CF49:
        staa    <PIA1_Buffer_t3
        jmp     ATM_SerialOut

ATM_AISMotorOpenClose:
        ldaa    #$10
        brset   <Counter_MainLoop $80 loc_CF56
        ldaa    #$70

loc_CF56:
        staa    <DesiredNewAisPosition
        jmp     ATM_SerialOut

ATM_AllSolenoidsRelays:
        ldd     <PIA1_Buffer_t3
        oraa    #$10
        brset   <BitFlags27 1 loc_CF65
        oraa    #$20

loc_CF65:
        brset   <BitFlags27 8 loc_CF6D
        orab    #$EB
        bra     loc_CF71

loc_CF6D:
        oraa    #$80
        orab    #$E3

loc_CF71:
        brset   <BitFlags2D $10 loc_CF77
        orab    #$10

loc_CF77:
        brset   <Counter_MainLoop $80 loc_CF95
        anda    #$EF
        brset   <BitFlags27 1 loc_CF83
        anda    #$DF

loc_CF83:
        brset   <BitFlags27 8 loc_CF8B
        andb    #$14
        bra     loc_CF8F

loc_CF8B:
        anda    #$7F
        andb    #$1C

loc_CF8F:
        brset   <BitFlags2D $10 loc_CF95
        andb    #$EF

loc_CF95:
        std     <PIA1_Buffer_t3
        bra     ATM_AISMotorOpenClose

ATM_Tachometer:
        bclr    <PIA2_Buffer_t3 $10
        ldx     #$6400
        sei
        ldaa    SwitchPortAccessReg1
        anda    #$FB
        brset   <Counter_MainLoop $80 loc_CFAB
        oraa    #4

loc_CFAB:
        staa    SwitchPortAccessReg1
        bset    2,x 4
        ldaa    #$14

loc_CFB3:
        deca
        bne     loc_CFB3
        bclr    2,x 4
        cli
        jmp     ATM_SerialOut

ATM_IgnitionCoil1:
        bclr    <PIA2_Buffer_t3 $10
        ldab    <Counter_MainLoop
        aslb
        beq     loc_CFC8
        jmp     ATM_SerialOut

loc_CFC8:
        sei
        ldaa    TCTL1_TimerControlReg1
        oraa    #3
        staa    TCTL1_TimerControlReg1
        ldab    #8
        stab    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    #$6D6
        std     TOC5_Counter_OC5_Dwell
        ldaa    TCTL1_TimerControlReg1
        anda    #$FE
        staa    TCTL1_TimerControlReg1
        cli
        jmp     ATM_SerialOut

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

AtmToggleOC2:                   fcb $40
AtmToggleOC2_ForceCompare:      fcb $40
AtmClrOC2SetOC3SetOC4SetOC5:    fcb $BF
AtmToggleOC3:                   fcb $10
AtmToggleOC3_ForceCompare:      fcb $20
AtmSetOC2ClrOC3SetOC4SetOC5:    fcb $EF
AtmToggleOC4:                   fcb   4
AtmToggleOC4_ForceCompare:      fcb $10
AtmSetOC2SetOC3ClrOC4SetOC5:    fcb $FB
        fcb $12
        fcb $27
        fcb $10
        fcb   3
        fcb $7E
        fcb $D0
        fcb $9C

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        ldx     #$101C
        ldy     #$CFF1
        bra     ATM_IgnitionCoil2
        brset   <BitFlags27 $10 loc_D00B
        jmp     ATM_SerialOut

loc_D00B:
        bra     loc_D014

Lcfa2:
        brset   <BitFlags27 $40 loc_D014
        jmp     ATM_SerialOut

loc_D014:
        ldx     #$101A
        ldy     #$CFEE
        bra     ATM_IgnitionCoil2

Lcfb2:
        brset   <BitFlags27 $40 loc_D024
        jmp     ATM_SerialOut

loc_D024:
        ldx     #$1018
        ldy     #$CFEB

ATM_IgnitionCoil2:
        bclr    <PIA2_Buffer_t3 $10
        ldab    <Counter_MainLoop
        aslb
        beq     loc_D036
        jmp     ATM_SerialOut

loc_D036:
        sei
        ldd     0,y
        oraa    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1
        stab    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    #$1A9
        std     0,x
        ldaa    2,y
        anda    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1
        cli
        jmp     ATM_SerialOut

ATM_InjBank1:
        ldx     #$6408
        bra     loc_D06A

ATM_InjBank2:
        ldx     #$640A
        bra     loc_D06A

ATM_InjBank3:
        ldx     #$640C
        bra     loc_D06A

ATM_InjBank4:
        ldx     #$640E

loc_D06A:
        bclr    <PIA2_Buffer_t3 $10
        ldab    <Counter_MainLoop
        aslb
        bne     ATM_SerialOut
        sei
        ldaa    PIA_Ctrl_2
        bita    #$F0
        beq     loc_D07F
        anda    #$F
        staa    PIA_Ctrl_2

loc_D07F:
        ldaa    #$F8
        cmpa    PIA_Ctrl_5
        beq     loc_D089
        staa    PIA_Ctrl_5

loc_D089:
        ldd     #$1A9
        std     0,x
        cli
        bra     ATM_SerialOut

ATM_PTUIndicator:
        ldaa    <PIA3_Buffer_t3
        eora    #2
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        bra     *+2

ATM_SerialOut:
        ldaa    <DRBPointer1
        cmpa    #$14
        beq     loc_D0A7
        cmpa    #$1A
        beq     loc_D0D6

locret_D0A6:
        rts

loc_D0A7:
        ldab    <DRBPointer2
        cmpb    #$40
        bcc     loc_D0C5
        cmpb    #0
        beq     locret_D0A6
        cmpb    #$2D
        bhi     locret_D0A6
        ldx     #$CE2A
        clra
        abx
        ldab    0,x
        cmpb    #$FF
        beq     locret_D0A6
        xgdx
        ldaa    0,x
        bra     SerialOutput1a_jmp1

loc_D0C5:
        subb    #$40
        aslb
        bcs     locret_D0A6
        cmpb    #$10
        bcc     locret_D0A6
        ldx     #$CE58

loc_D0D1:
        abx
        ldx     0,x
        jmp     0,x

loc_D0D6:
        ldx     #$CE66
        ldab    <DRBPointer2
        aslb
        cmpb    #0
        beq     locret_D0A6
        cmpb    #8
        bls     loc_D0D1
        bra     locret_D0A6

SCI_LD07B:
        ldaa    <StartupSwitchMirror1
        brclr   <BitFlags27 $C0 SerialOutput1a_jmp1
        ldab    byte_8011
        beq     loc_D0F3
        eora    #2

loc_D0F3:
        eora    #$80
        bra     SerialOutput1a_jmp1

SCI_Ld08c:
        ldaa    <PIA2_Buffer_t3
        bra     SerialOutput1a_jmp1

SCI_Ld090:
        ldaa    <PIA1_Buffer_t3
        eora    #8
        bra     SerialOutput1a_jmp1

SCI_Ld096:
        ldaa    SwitchPortAccessReg1
        anda    #$70
        bra     SerialOutput1a_jmp1

SCI_MAPVolts:
        sei
        ldaa    #$10
        staa    ADCTL_A2DControlReg

loc_D10E:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_D10E
        ldaa    ADR1_A2DResults1
        cli
        bra     SerialOutput1a_jmp1

SCI_Speed:
        ldaa    <VehicleSpeedx8_Scaled
        bra     SerialOutput1a_jmp1

SCI_O2Volts:
        ldab    <O2SensorVolts
        ldaa    #$FF
        cmpb    byte_8A53
        bhi     loc_D12D
        cmpb    byte_8A54
        bhi     SerialOutput1a_jmp1
        anda    #$A0

loc_D12D:
        anda    #$B1

SerialOutput1a_jmp1:
        jmp     SerialOutput1a

SCI_Ld0c7:
        jmp     locret_D0A6

SCI_Ld0ca:
        jmp     locret_D0A6

SendBaro:
        ldaa    <BaroPressure
        suba    <MapValue
        bcc     SerialOutput1a_jmp2
        clra

SerialOutput1a_jmp2:
        jmp     SerialOutput1a_jmp1

SendTPS:
        ldaa    <TpsVolts
        suba    <LowestSessionTpsVolts
        bcc     loc_D149
        clra

loc_D149:
        ldab    TL_t3_0xfd
        staa    Temp0
        mul
        adca    Temp0
        bcc     loc_D157
        ldaa    #$FF

loc_D157:
        jmp     SerialOutput1a_jmp1

SCI_Ld0ef:
        ldaa    <CalculatedSparkAdvance
        jmp     SerialOutput1a_jmp1

sub_D15F:
        ldx     #$8000
        ldd     #$9200
        std     Temp0
        clra
        ldab    #8

loc_D16B:
        bsr     sub_D185
        psha
        pshb
        jsr     OCToggleAndResetCopTimer
        ldaa    #$12
        adda    Temp0
        staa    Temp0
        ldaa    SwitchPortAccessReg1
        bita    #$40
        pulb
        pula
        beq     locret_D1AE
        bra     loc_D16B

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D185:
        cpx     #$B600
        bne     loc_D193
        inc     Temp0
        inc     Temp0
        ldx     #$B800

loc_D193:
        adda    0,x
        adda    1,x
        adda    2,x
        adda    3,x
        adda    4,x
        adda    5,x
        adda    6,x
        adda    7,x
        abx
        cpx     Temp0
        bne     loc_D193
        tst     Temp0
        beq     loc_D1AF

locret_D1AE:
        rts

loc_D1AF:
        pulx
        suba    byte_8005
        beq     locret_D1AE
        ldd     #$201
        jmp     ThrowNonCriticalError_

loc_D1BB:
        ldaa    <Counter_MainLoop
        asla
        asla
        bne     locret_D1D1
        ldaa    LastCamFallingEdgeTime2
        bita    #$70
        beq     loc_D1D2
        suba    #$10
        bita    #$70
        beq     loc_D1D2
        staa    LastCamFallingEdgeTime2

locret_D1D1:
        rts

loc_D1D2:
        ldab    <PIA1_Buffer_t3
        eorb    #$40
        stab    <PIA1_Buffer_t3
        bita    #$F
        beq     loc_D1E5
        deca
        bita    #$F
        beq     loc_D1E5
        oraa    #$10
        bra     loc_D21A

loc_D1E5:
        tsta
        bmi     loc_D21E
        ldaa    #$AA
        ldab    <DRBPointer2
        cmpb    #$FE
        beq     loc_D20E
        tstb
        bmi     loc_D21A
        cmpb    #8
        bcs     loc_D201
        ldx     #$B618
        abx
        brset   0,x $FF loc_D266
        bra     loc_D208

loc_D201:
        negb
        addb    #7
        ldx     #$15
        abx

loc_D208:
        ldab    0,x
        beq     loc_D21A
        bra     loc_D20F

loc_D20E:
        clrb

loc_D20F:
        ldx     #$D277
        abx
        ldaa    0,x
        anda    #$F
        asla
        oraa    #$A0

loc_D21A:
        staa    LastCamFallingEdgeTime2
        rts

loc_D21E:
        ldab    <DRBPointer2
        cmpb    #$FF
        bne     loc_D230
        ldaa    <ErrorCodeUpdateKeyOnCount
        cmpa    #$32
        bhi     loc_D230
        decb
        stab    <DRBPointer2
        clrb
        bra     loc_D255

loc_D230:
        cmpb    #$FE
        bne     loc_D235
        incb

loc_D235:
        incb
        stab    <DRBPointer2
        cmpb    #8
        bcs     loc_D24A
        brset   <DRBPointer2 $80 loc_D26F
        ldx     #$B618
        abx
        brset   0,x $FF loc_D266
        bra     loc_D251

loc_D24A:
        negb
        addb    #7
        ldx     #$15
        abx

loc_D251:
        ldab    0,x
        beq     loc_D266

loc_D255:
        ldx     #$D277
        abx
        ldaa    0,x
        lsra
        lsra
        lsra
        lsra
        asla
        oraa    #$40
        staa    LastCamFallingEdgeTime2
        rts

loc_D266:
        ldaa    #$4A
        staa    LastCamFallingEdgeTime2
        bset    <DRBPointer2 $80
        rts

loc_D26F:
        clra
        staa    <DRBPointer1
        staa    <DRBSerialMode
        staa    <DRBPointer2
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ErrorCodesToDash_Table_:
        fcb $12
        fcb $54
        fcb $53
        fcb $52
        fcb $51
        fcb $47
        fcb $46
        fcb $45
        fcb $44
        fcb $43
        fcb $42
        fcb $41
        fcb $37
        fcb $36
        fcb $35
        fcb $34
        fcb $33
        fcb $32
        fcb $31
        fcb $27
        fcb $27
        fcb $27
        fcb $26
        fcb $26
        fcb $26
        fcb $25
        fcb $24
        fcb $24
        fcb $23
        fcb $23
        fcb $22
        fcb $22
        fcb $21
        fcb $17
        fcb $16
        fcb $15
        fcb $14
        fcb $14
        fcb $13
        fcb $13
        fcb $11
        fcb $43
        fcb $43
        fcb $43
        fcb $42
        fcb $52
        fcb $32
        fcb $61
        fcb $62
        fcb $63
        fcb $45
        fcb $36
        fcb $35
        fcb $35
        fcb $32
        fcb $64
        fcb $65
        fcb $23
        fcb $23
        fcb $21
        fcb $51
        fcb $27
        fcb $21
        fcb $67
        fcb $52
        fcb $66
        fcb $66
        fcb $36
        fcb $53
        fcb $27
        fcb $27
        fcb $44
        fcb $16
        fcb $71
        fcb $72
        fcb $73
        fcb $74
        fcb $75
        fcb $51
        fcb $27
        fcb $27
        fcb $76

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ThrowNonCriticalError_:
        ldx     #$8A32

loc_D2CC:
        brclr   0,x $FF loc_D2D7
        cmpa    0,x
        beq     loc_D323
        inx
        bra     loc_D2CC

loc_D2D7:
        tstb
        bmi     loc_D2E2
        cmpa    <ErrorBitRegisterStored3
        beq     loc_D320
        cmpa    <ErrorBitRegisterStored2
        beq     loc_D316

loc_D2E2:
        andb    #$7F
        stab    Temp0
        ldy     #$DC
        cmpa    0,y
        beq     loc_D303
        iny
        cmpa    0,y
        beq     loc_D303
        tst     0,y
        beq     loc_D303
        dey
        tst     0,y
        bne     loc_D323

loc_D303:
        staa    0,y
        ldab    2,y
        incb
        beq     loc_D326
        cmpb    Temp0
        bcc     loc_D326
        stab    2,y
        clc
        rts

loc_D316:
        ldd     <ErrorBitRegisterStored2
        staa    <ErrorBitRegisterStored3
        stab    <ErrorBitRegisterStored2
        ldaa    <ErrorCodeUpdateKeyOnCount
        staa    <ErrorCodeUpdateKeyOnCount2

loc_D320:
        clr ErrorCodeUpdateKeyOnCount

loc_D323:
        clra
        clc
        rts

loc_D326:
        tst     ErrorBitRegister0
        beq     loc_D336
        brset   <BitFlags6a_t3 $40 loc_D333
        brclr   <BitFlags6a_t3 $20 loc_D336

loc_D333:
        jmp     loc_D3BE

loc_D336:
        clr     0,y
        clr     2,y
        ldx     #$15

loc_D33F:
        cmpa    0,x
        bne     loc_D348
        clrb
        stab    0,x
        bra     loc_D350

loc_D348:
        inx
        cpx     #$1C
        bls     loc_D33F
        ldab    #$FF

loc_D350:
        ldx     #$1C
        ldy     #$1D
        stab    Temp0

loc_D35A:
        cpx     #$1A
        bcs     loc_D36F
        psha
        ldab    0,y
        ldaa    Temp0
        staa    0,y
        iny
        stab    Temp0
        pula

loc_D36F:
        ldab    0,x
        staa    0,x
        tba
        beq     loc_D3A9
        dex
        cpx     #$15
        bcc     loc_D35A
        clr     ErrorCodeUpdateKeyOnCount
        sei
        brset   <BitFlags6a_t3 $40 loc_D3BE
        brset   <BitFlags6a_t3 $20 loc_D3BE
        bset    <BitFlags6a_t3 $40
        cli
        staa    DRBOffsetStored_LB
        ldx     #$B61F

loc_D392:
        inx
        ldab    0,x
        cba
        beq     loc_D3A4
        incb
        bne     loc_D392
        xgdx
        subd    #$B600
        stab    DRBOffsetStored_HB
        sec
        rts

loc_D3A4:
        bclr    <BitFlags6a_t3 $40
        sec
        rts

loc_D3A9:
        cpy     #$1F
        bhi     loc_D3B9
        ldab    <ErrorCodeUpdateKeyOnCount
        beq     loc_D3BC
        ldab    Temp0
        stab    0,y

loc_D3B9:
        clrb
        stab    <ErrorCodeUpdateKeyOnCount

loc_D3BC:
        sec
        rts

loc_D3BE:
        clc
        cli
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

gw_PIA1AManipulation_Table2:
        fcb 0
        fcb   0
        fcb 4
        fcb   0
        fcb $10
        fcb $20
        fcb 0
        fcb $80
        fcb 0
        fcb   0
        fcb $19
        fcb   0
        fcb $32
        fcb  $C
        fcb 0
        fcb  $E

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

gw_PIA1AManipulation_Table:
        fcb 1
        fcb   2
        fcb 4
        fcb   8
        fcb $10
        fcb $20
        fcb 0
        fcb   0
        fcb $10
        fcb $11
        fcb $33
        fcb $51
        fcb $A
        fcb $12
        fcb 0
        fcb   0

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D3E1:
        sei
        ldab    SPCR_SerialPeripheralControl
        orab    #1
        stab    SPCR_SerialPeripheralControl
        bclr    <PIA3_Buffer_t3 4
        ldab    <PIA3_Buffer_t3
        stab    PIA3_Buffer_2_t3
        ldaa    <PIA2_Buffer_t3
        cmpa    SPSR_SerialPeripheralStatus
        staa    SPDR_SerialPeripheralDataIO
        mul
        mul
        nop
        bset    <PIA3_Buffer_t3 4
        ldaa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        ldaa    SPDR_SerialPeripheralDataIO
        ldab    SPCR_SerialPeripheralControl
        andb    #$FC
        stab    SPCR_SerialPeripheralControl
        staa    Temp1_t3
        cli
        brclr   <BitFlags2e $40 loc_D47B
        eora    PIA2_Buffer_t3_Temp
        anda    byte_8A39
        ldx     #$D3D1
        ldab    <Counter_MainLoop
        andb    #7
        abx
        bita    0,x
        beq     loc_D47B
        ldaa    CountdownTimerFromKeyOn
        bne     loc_D47B
        ldaa    SwitchPortAccessReg1
        bita    #$40
        bne     loc_D47B
        ldaa    <BatteryVolts
        cmpa    #$A0
        bcs     loc_D47B
        ldaa    8,x
        ldab    #$A0
        cmpa    #$11
        beq     loc_D453
        cmpa    #$12
        beq     loc_D461
        cmpa    #$33
        beq     loc_D46F
        ldab    #$20
        jsr     ThrowNonCriticalError_
        bra     loc_D47B

loc_D453:
        brset   <b5D_IPL2_t3 8 loc_D47B
        jsr     ThrowNonCriticalError_
        bcc     loc_D47B
        bset    <b5D_IPL2_t3 8
        bra     loc_D47B

loc_D461:
        brset   <b5D_IPL2_t3 $20 loc_D47B
        jsr     ThrowNonCriticalError_
        bcc     loc_D47B
        bset    <b5D_IPL2_t3 $20
        bra     loc_D47B

loc_D46F:
        brset   <b5D_IPL2_t3 4 loc_D47B
        jsr     ThrowNonCriticalError_
        bcc     loc_D47B
        bset    <b5D_IPL2_t3 4

loc_D47B:
        ldaa    <PIA2_Buffer_t3
        staa    PIA2_Buffer_t3_Temp
        bset    <BitFlags2e $40
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

UpdatePIA1AndCheckOutputs2_MM:
        ldaa    <EngineRpm_HB
        cmpa    #$3F
        bcs     loc_D4A5
        brclr   <BitFlags27 $20 loc_D4A5
        ldaa    <BitFlags_BF_t3
        cmpa    #$83
        beq     loc_D4A5
        cmpa    #$81
        beq     loc_D4A5
        ldd     TCNT_Counter_FreeRunning16bit
        subd    TIC1_Counter_IC1_CamSensor
        cpd     #$FA
        bcs     loc_D4A5
        rts

loc_D4A5:
        ldaa    <PIA1_Buffer_t3
        adda    #$C3
        staa    Temp0
        ldab    #$40
        ldaa    #$61
        ldy     #$1000
        ldx     #$6400
        sei
        bset    0,x 8
        bclr    8,y $20
        cmpb    SPSR_SerialPeripheralStatus
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    #$62

loc_D4D4:
        brclr   0,x 8 loc_D4DE
        decb
        bne     loc_D4D4
        jmp     loc_D640

loc_D4DE:
        ldab    #$B
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        staa    Temp1
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    #0

loc_D4F5:
        brclr   0,x 8 loc_D4FF
        decb
        bne     loc_D4F5
        jmp     loc_D640

loc_D4FF:
        ldab    #$B
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        staa    Temp2
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    <PIA1_Buffer_t3

loc_D516:
        brclr   0,x 8 loc_D520
        decb
        bne     loc_D516
        jmp     loc_D640

loc_D520:
        ldab    #$B
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        staa    Temp3
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    #0

loc_D537:
        brclr   0,x 8 loc_D541
        decb
        bne     loc_D537
        jmp     loc_D640

loc_D541:
        ldab    #$B
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        staa    Temp4

loc_D553:
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    Temp0

loc_D559:
        brclr   0,x 8 loc_D563
        decb
        bne     loc_D559
        jmp     loc_D640

loc_D563:
        ldab    #$B
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop

loc_D56F:
        brset   $29,y $80 loc_D57A
        decb
        bne     loc_D56F
        jmp     loc_D640

loc_D57A:
        ldaa    SPDR_SerialPeripheralDataIO
        bset    8,y $20
        cli
        ldab    Temp1
        addb    Temp2
        addb    Temp3
        addb    Temp4
        cba
        beq     loc_D594
        jmp     locret_D63B

loc_D594:
        ldaa    Temp2
        brclr   <BitFlags27 $C0 loc_D5D8
        ldab    byte_8011
        beq     loc_D5AC
        cmpb    #2
        bne     loc_D5AA
        ldab    byte_800F
        lsrb
        bcs     loc_D5AC

loc_D5AA:
        eora    #2

loc_D5AC:
        eora    #$80
        ldab    <StartupSwitchMirror1
        andb    #$40
        stab    Temp0
        staa    <StartupSwitchMirror1
        anda    #$40
        eora    Temp0
        beq     loc_D5C1
        bset    <BitFlags2f $20

loc_D5C1:
        brclr   <StartupSwitchMirror1 $40 loc_D5D3
        brclr   <StartupSwitchMirror1 $80 loc_D5CE
        bset    <BitFlags68_t3 $20
        bra     loc_D5E6

loc_D5CE:
        bclr    <BitFlags68_t3 $20
        bra     loc_D5E6

loc_D5D3:
        bset    <BitFlags68_t3 $20
        bra     loc_D5E6

loc_D5D8:
        staa    <StartupSwitchMirror1
        brclr   <StartupSwitchMirror1 $80 loc_D5E3
        bset    <BitFlags68_t3 $20
        bra     loc_D5E6

loc_D5E3:
        bclr    <BitFlags68_t3 $20

loc_D5E6:
        brclr   <Ram_30 $80 loc_D63C
        ldaa    Temp4
        anda    byte_8A38
        ldx     #$D3C1
        ldab    <Counter_MainLoop
        andb    #7
        abx
        bita    0,x
        beq     locret_D63B
        ldaa    CountdownTimerFromKeyOn
        bne     locret_D63B
        ldaa    SwitchPortAccessReg1
        bita    #$40
        bne     locret_D63B
        ldaa    <BatteryVolts
        cmpa    #$A0
        bcs     locret_D63B
        ldaa    8,x
        ldab    #$A0
        cmpa    #$C
        beq     loc_D628
        cmpa    #$19
        bne     loc_D636
        brset   <b5D_IPL2_t3 $80 locret_D63B
        jsr     ThrowNonCriticalError_
        bcc     locret_D63B
        bset    <b5D_IPL2_t3 $80
        bra     locret_D63B

loc_D628:
        brset   <b5d_IPL2 $80 locret_D63B
        jsr     ThrowNonCriticalError_
        bcc     locret_D63B
        bset    <b5d_IPL2 $80
        bra     locret_D63B

loc_D636:
        ldab    #$20
        jsr     ThrowNonCriticalError_

locret_D63B:
        rts

loc_D63C:
        bset    <Ram_30 $80
        rts

loc_D640:
        bset    8,y $20
        cli
        ldaa    <BitFlags6a_t3
        bita    #$60
        bne     loc_D665
        ldaa    PPROG_EEPROMControlReg
        bita    #2
        bne     loc_D665
        ldd     #$B618
        tba
        ldab    byte_B618
        beq     loc_D665
        decb
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB
        bset    <BitFlags6a_t3 $40

loc_D665:
        ldd     #$4488
        jsr     ThrowNonCriticalError_
        bcc     loc_D680
        sei
        ldaa    SwitchPortAccessReg1
        anda    #$FE
        staa    SwitchPortAccessReg1
        ldab    #3

loc_D678:
        decb
        bne     loc_D678
        oraa    #1
        staa    SwitchPortAccessReg1

loc_D680:
        cli
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D682:
        ldaa    <Ram_F3
        bpl     locret_D699
        anda    #$7F
        staa    <Ram_F3
        ldd     #$26A8
        brset   <b5C_IPL1_t3 $80 locret_D699
        jsr     ThrowNonCriticalError_
        bcc     locret_D699
        bset    <b5C_IPL1_t3 $80

locret_D699:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D69A:
        ldab    #$40
        brset   <IPL1 $40 loc_D6BA
        ldaa    <DRBPointer1
        cmpa    #$A
        bne     loc_D6A9
        jmp     loc_D1BB

loc_D6A9:
        cmpa    #$18
        bne     loc_D6B4
        ldaa    <Counter_MainLoop
        asla
        bmi     loc_D6DE
        bra     loc_D6DD

loc_D6B4:
        brset   <BitFlags6a_t3 4 loc_D6DE
        bra     loc_D6DD

loc_D6BA:
        ldx     <KeyOnOrEngineRunningTime
        cpx #3
        bls     loc_D6DE
        bclr    <Ram_05 $C0
        brclr   <PIA1_Buffer_t3 $40 loc_D6DD
        ldaa    <b5C_IPL1_t3
        bita    byte_8A3A
        bne     loc_D6DD
        ldaa    <b5D_IPL2_t3
        bita    byte_8A3B
        bne     loc_D6DD
        ldaa    <b5d_IPL2
        bita    byte_8A3C
        beq     loc_D6DE

loc_D6DD:
        clrb

loc_D6DE:
        ldaa    #$BF
        anda    <PIA1_Buffer_t3
        aba
        staa    <PIA1_Buffer_t3
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D6E6:
        ldaa    <BitFlags27
        bita    #$C0
        beq     locret_D732
        brset   <IPL1 $40 loc_D6F6
        brset   <BitFlags6a_t3 4 loc_D72A
        bra     loc_D72F

loc_D6F6:
        brset   <b5C_IPL1_t3 $20 loc_D72F
        ldaa    <Counter_MainLoop
        bita    #$3C
        bne     loc_D726
        ldaa    <TargetBatteryVolts
        suba    <BatteryVolts
        bcs     loc_D71F
        cmpa    #$11
        bcs     loc_D71F
        ldd     <EngineRpm_HB
        cpd     #$2EE0
        bcs     loc_D722
        ldaa    UNe_64B8
        inca
        cmpa    #$56
        bcs     loc_D723
        bset    <Ram_30 $20
        bra     loc_D72F

loc_D71F:
        bclr    <Ram_30 $20

loc_D722:
        clra

loc_D723:
        staa    UNe_64B8

loc_D726:
        brset   <Ram_30 $20 loc_D72F

loc_D72A:
        bset    <PIA2_Buffer_t3 4
        bra     locret_D732

loc_D72F:
        bclr    <PIA2_Buffer_t3 4

locret_D732:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D733:
        ldd     <ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
        tsta
        beq     loc_D740
        dec     ClearTheErrorTimer_0
        bne     loc_D740
        clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB

loc_D740:
        tstb
        beq     loc_D74B
        dec     ClearTheErrorTimer_1
        bne     loc_D74B
        clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB

loc_D74B:
        ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
        beq     locret_D75A
        suba    #$10
        bita    #$F0
        bne     loc_D757
        clra

loc_D757:
        staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

locret_D75A:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D75B:
        brclr   <IPL1 $40 locret_D794
        brset   <BitFlags6d_t3 4 locret_D794
        brset   <BitFlags6a_t3 $40 locret_D794
        bset    <BitFlags6d_t3 4
        brclr   <ErrorBitRegisterStored3 $FF loc_D78D
        ldaa    <ErrorCodeUpdateKeyOnCount
        cmpa    #$32
        bcs     loc_D777
        jmp     DRB_ClearErrorCodes

loc_D777:
        ldaa    <ErrorBitRegisterStored1
        beq     loc_D782
        ldaa    <ErrorCodeUpdateKeyOnCount3
        inca
        beq     loc_D782
        staa    <ErrorCodeUpdateKeyOnCount3

loc_D782:
        ldaa    <ErrorBitRegisterStored2
        beq     loc_D78D
        ldaa    <ErrorCodeUpdateKeyOnCount2
        inca
        beq     loc_D78D
        staa    <ErrorCodeUpdateKeyOnCount2

loc_D78D:
        ldaa    <ErrorCodeUpdateKeyOnCount
        inca
        beq     locret_D794
        staa    <ErrorCodeUpdateKeyOnCount

locret_D794:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D795:
        anda    #$F
        ldab    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
        beq loc_D7A4
        andb    #$F
        cba
        bne locret_D7AB
        ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

loc_D7A4:
        adda    #$10
        bcs     loc_D7AC
        staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

locret_D7AB:
        rts

loc_D7AC:
        ldab    #1

loc_D7AE:
        deca
        beq loc_D7B4
        aslb
        bra loc_D7AE

loc_D7B4:
        clr ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
        comb
        sei
        andb    <b5C_IPL1_t3
        stab    <b5C_IPL1_t3
        cli
        rts

loc_D7BF:
        ldab    <EngineRpm_HB
        cmpb    #$7D
        ldaa    #0
        bcc     loc_D7DD
        subb    #$10
        bcc     loc_D7CC
        clrb

loc_D7CC:
        ldaa    #$29
        mul
        lsld
        aslb
        adca    <LowestSessionTpsVolts
        tab
        ldaa    <TpsVolts
        adda    byte_8A9A
        sba
        bcc     loc_D7DD
        clra

loc_D7DD:
        ldx     #$8A86
        jsr     Lookup4ByteTable
        adda    byte_8A99
        bcc     locret_D7EA
        ldaa    #$FF

locret_D7EA:
        rts

sub_D7EB:
        brclr   <Ram_05 1 loc_D825
        ldab    <BatteryVolts
        cmpb    byte_8A44
        bcs     loc_D816
        cmpb    byte_8A43
        bcc     loc_D816
        ldaa    <MapVolts_X
        suba    <MapValue3
        bls     loc_D816
        cmpa    byte_8A42
        bcs     loc_D816
        sei

loc_D807:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_D807
        ldaa    ADR1_A2DResults1
        staa    <MapVolts_X
        staa    <MapValue3
        cli
        bra     loc_D81F

loc_D816:
        ldaa    UNe_64B9
        anda    #$E0
        cmpa    #$E0
        bne     loc_D825

loc_D81F:
        ldd     #$2828
        jsr     ThrowNonCriticalError_

loc_D825:
        brset   <BitFlags_BF_t3 $80 locret_D841
        ldaa    UNe_64B9
        anda    #$1F
        cmpa    #$1F
        bne     locret_D841
        brset   <b5d_IPL2 $40 locret_D841
        ldd     #$181
        jsr     ThrowNonCriticalError_
        bcc     locret_D841
        bset    <b5d_IPL2 $40

locret_D841:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D842:
        brclr   <IPL1 $40 locret_D88A
        ldd     <KeyOnOrEngineRunningTime
        cmpa    #$B
        bcs     locret_D88A
        ldaa    <CoolantTemp
        cmpa    byte_8A58
        bcs     locret_D88A
        bitb    #$1F
        bne     locret_D88A
        brset   <BitFlags27 1 loc_D85F
        brclr   <BitFlags68_t3 $10 locret_D88A

loc_D85F:
        brset   <StartupSwitchMirror1 $20 locret_D88A
        brclr   <BitFlags66_t3 $80 locret_D88A
        ldaa    <EngineRpm_HB
        cmpa    byte_8A56
        bcs     locret_D88A
        ldaa    <MapVolts
        cmpa    byte_8A57
        bcc     locret_D88A
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    #2
        bcc     locret_D88A
        brset   <b5D_IPL2_t3 $10 locret_D88A
        ldd     #$23A0
        jsr     ThrowNonCriticalError_
        bcc     locret_D88A
        bset    <b5D_IPL2_t3 $10

locret_D88A:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D88B:
        ldaa    SwitchPortAccessReg1
        bita    #$40
        beq     loc_D893
        rts

loc_D893:
        brset   <IPL1 $40 loc_D89A
        jmp     loc_D8DD


loc_D89A:
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    #$2C
        bcs     loc_D8DD
        ldaa    <CoolantTemp
        cmpa    #$CD
        bcs     loc_D8DD
        brclr   <BitFlags2e 4 loc_D8E2
        ldaa    <Counter_O2Diagnostics
        cmpa    #$13
        bcs     loc_D8D8
        ldaa    <O2SensorVolts
        cmpa    #$4D
        bcs     loc_D8DD
        ldaa    <Timer_O2MiddleDiagnostics
        cmpa    #$2A
        bcs     loc_D8CD
        brset   <b5d_IPL2 2 loc_D8CB
        ldd     #$2081
        jsr     ThrowNonCriticalError_
        bcc     locret_D93B
        bset    <b5d_IPL2 2

loc_D8CB:
        bra     locret_D93B

loc_D8CD:
        ldab    <Counter_MainLoop
        bitb    #$7F
        bne     locret_D93B
        inca
        staa    <Timer_O2MiddleDiagnostics
        bra     locret_D93B

loc_D8D8:
        inca
        staa    <Counter_O2Diagnostics
        bra     locret_D93B

loc_D8DD:
        bclr    <BitFlags2e 4
        bra     loc_D912

loc_D8E2:
        ldaa    <O2SensorVolts
        cmpa    byte_8A53
        bhi     loc_D912
        cmpa    byte_8A54
        bcs     loc_D912
        ldaa    <Timer_O2MiddleDiagnostics
        cmpa    #$15
        bcs     loc_D909
        bset    <BitFlags2e 4
        clra
        staa    <Timer_O2MiddleDiagnostics
        staa    <Counter_O2Diagnostics
        sei
        ldaa    <PIA3_Buffer_t3
        oraa    #8
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        cli
        bra     locret_D93B

loc_D909:
        ldab    <Counter_MainLoop
        bitb    #$7F
        bne     loc_D915
        inca
        bra     loc_D913

loc_D912:
        clra

loc_D913:
        staa    <Timer_O2MiddleDiagnostics

loc_D915:
        sei
        ldaa    <PIA3_Buffer_t3
        anda    #$F7
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        cli
        ldaa    <Counter_MainLoop
        bita    #$F
        bne     locret_D93B
        brset   <b5d_IPL2 4 locret_D93B
        ldaa    <O2SensorVolts
        cmpa    #$3E
        bls     locret_D93B
        ldd     #$3E8F
        jsr     ThrowNonCriticalError_
        bcc     locret_D93B
        bset    <b5d_IPL2 4

locret_D93B:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D93C:
        ldaa    <ATMOffset
        cmpa    #$D
        beq     loc_D973
        brset   <b5d_IPL2 $10 loc_D973
        sei
        ldaa    SwitchPortAccessReg1
        bita    #$10
        beq     loc_D973
        bita    #$40
        bne     loc_D973
        brset   <PIA2_Buffer_t3 $10 loc_D973
        brclr   <BitFlags2e $20 loc_D96D
        lsra
        eora    <BitFlags24
        bita    #2
        cli
        beq     loc_D96D
        ldd     #$BA0
        jsr     ThrowNonCriticalError_
        bcc     loc_D96D
        bset    <b5d_IPL2 $10

loc_D96D:
        cli
        bset    <BitFlags2e $20
        bra     locret_D977

loc_D973:
        cli
        bclr    <BitFlags2e $20

locret_D977:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D978:
        brclr   <BitFlags2e 2 loc_D99E
        ldaa    <BatteryVolts
        cmpa    #$82
        bcs     locret_D99D
        ldaa    <Counter_MainLoop
        bita    #4
        bne     locret_D99D
        ldaa    <TimerOverflowsBetweenCamPulses
        bne     locret_D99D
        brset   <DistributorFallingEdgePulsewidth_HB $80 locret_D99D
        ldaa    SwitchPortAccessReg1
        bita    #$50
        bne     locret_D99D
        ldd     #$2C14
        jsr     ThrowNonCriticalError_

locret_D99D:
        rts

loc_D99E:
        bset    <BitFlags2e 2
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_D9A2:
        ldaa    <BitFlags608D
        anda    #$F
        inca
        cmpa    byte_8A6A
        bcc     loc_D9B2
        inc     BitFlags608D
        jmp     locret_DA30

loc_D9B2:
        ldaa    <BitFlags608D
        anda    #$F0
        staa    <BitFlags608D
        ldaa    <MapVolts_X
        suba    <MapValue3
        ldab    ADR1_A2DResults1
        stab    <MapVolts_X
        stab    <MapValue3
        brset   <b5C_IPL1_t3 $80 loc_D9EE
        cmpa    byte_8A68
        bcc     locret_DA30
        ldd     <EngineRpm_HB
        cpd     word_8A7B
        bcs     locret_DA30
        cpd     word_8A7D
        bcc     locret_DA30
        ldaa    <MapVolts_X
        cmpa    byte_8A7F
        bcs     locret_DA30
        cmpa    byte_8A80
        bcc     locret_DA30
        ldaa    <Ram_F3
        oraa    #$80
        staa    <Ram_F3
        bra     locret_DA30

loc_D9EE:
        ldab    <BitFlags608D
        addb    #$10
        bcc     loc_D9F6
        orab    #$F0

loc_D9F6:
        stab    <BitFlags608D
        suba    byte_8A68
        bcs     locret_DA30
        cmpa    byte_8A69
        bcs     locret_DA30
        ldaa    <VehicleSpeedx8_Scaled
        bne     loc_DA18
        brset   <BitFlags66_t3 $80 loc_DA18
        ldd     <EngineRpm_HB
        subd    <TargetIdleSpeedHB
        bcc     loc_DA12
        coma
        comb

loc_DA12:
        cpd     word_8A81
        bcs     locret_DA30

loc_DA18:
        ldab    byte_8A6A
        ldx     #$8A6B
        abx
        ldaa    0,x
        cmpa    <BitFlags608D
        bhi     locret_DA30
        ldaa    #8
        jsr     sub_D795
        ldaa    <BitFlags608D
        anda    #$F
        staa    <BitFlags608D

locret_DA30:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DA31:
        ldaa    <Counter_MainLoop
        bita    #7
        bne     loc_DA8A
        brset   <b5C_IPL1_t3 $80 loc_DA72
        tst     VehicleSpeedx8_Scaled
        bne     loc_DA72
        brset   <BitFlags66_t3 $80 loc_DA72
        ldd     <EngineRpm_HB
        subd    <TargetIdleSpeedHB
        bcc     loc_DA4C
        coma
        comb

loc_DA4C:
        cpd     word_8A81
        bcc     loc_DA72
        ldaa    <BaroPressure
        suba    <MapValue
        bcs     loc_DA67
        ldab    <BaroPressure
        ldx     #$8A84
        cmpb    byte_8A83
        bcc     loc_DA63
        inx

loc_DA63:
        cmpa    0,x
        bcc     loc_DA72

loc_DA67:
        ldd     #$2794
        jsr     ThrowNonCriticalError_
        bcc     loc_DA72
        bset    <b5C_IPL1_t3 $80

loc_DA72:
        brclr   <BitFlags2e $80 loc_DA8C
        sei

loc_DA77:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_DA77
        ldaa    ADR1_A2DResults1
        cli
        cmpa    TL_MapSensorMiddleLimit
        bcs     locret_DAC6
        cmpa    byte_8A66
        bcs     loc_DACB

loc_DA8A:
        bra     locret_DAC6

loc_DA8C:
        ldx     <EngineRpm_HB
        cpx     #$C80
        bcs     locret_DAC6
        cpx     #$2EE0
        bcc     locret_DAC6
        ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
        cmpa    #$32
        bcc     locret_DAC6
        sei

loc_DA9F:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_DA9F
        ldaa    ADR1_A2DResults1
        cli
        cmpa    byte_8A66
        bcc     loc_DAB7
        cmpa    byte_8A65
        bcc     loc_DAC7
        ldd     #$2494
        bra     loc_DABA

loc_DAB7:
        ldd     #$2594

loc_DABA:
        brset   <b5C_IPL1_t3 8 locret_DAC6
        jsr     ThrowNonCriticalError_
        bcc     locret_DAC6
        bset    <b5C_IPL1_t3 8

locret_DAC6:
        rts

loc_DAC7:
        brclr   <b5C_IPL1_t3 8 locret_DAC6

loc_DACB:
        ldaa    #4
        jsr     sub_D795
        brset   <b5C_IPL1_t3 8 locret_DAC6
        bclr    <BitFlags2e $80
        bra     locret_DAC6

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DAD9:
        ldaa    <Counter_MainLoop
        bita    #$1F
        bne     locret_DB00
        brclr   <IPL1 $40 locret_DB00
        ldaa    <BatteryVolts
        suba    <TargetBatteryVolts
        bcs     loc_DAFD
        cmpa    #$10
        bcs     loc_DAFD
        brset   <b5C_IPL1_t3 $20 locret_DB00
        ldd     #$6A0
        jsr     ThrowNonCriticalError_
        bcc     locret_DB00
        bset    <b5C_IPL1_t3 $20
        rts

loc_DAFD:
        bclr    <b5C_IPL1_t3 $20

locret_DB00:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DB01:
        brset   <b5C_IPL1_t3 2 locret_DB36
        ldaa    <CoolantTemp
        cmpa    byte_8A3F
        bcs     loc_DB11
        bset    <BitFlags6d_t3 2
        bra     locret_DB36

loc_DB11:
        brset   <BitFlags6d_t3 2 locret_DB36
        brclr   <IPL1 $40 locret_DB36
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    #$FF
        bne     locret_DB36
        ldaa    <VehicleSpeedx8_Scaled
        cmpa    byte_8A40
        bcs     locret_DB36
        ldab    Timer_ThermostatDiagnostics
        cmpb    byte_8A41
        beq     loc_DB37
        ldaa    <Counter_MainLoop
        bne     locret_DB36
        incb
        stab    Timer_ThermostatDiagnostics

locret_DB36:
        rts

loc_DB37:
        ldd     #$2101
        jsr     ThrowNonCriticalError_
        bcc     locret_DB42
        bset    <BitFlags6d_t3 2

locret_DB42:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DB43:
        brset   <BitFlags2D 8 loc_DB76
        brclr   <BitFlags2D 4 loc_DB76
        brclr   <IPL1 $40 loc_DB76
        sei
        ldaa    <BitFlags6a_t3
        bita    #$60
        bne     loc_DB74
        bset    <BitFlags2D 8
        ldx     #$B613
        ldaa    0,x
        inca
        beq     loc_DB74
        cmpa    byte_884E
        bcs     loc_DB69
        bset    <BitFlags2D 2

loc_DB69:
        staa    DRBOffsetStored_LB
        ldaa    #$13
        staa    DRBOffsetStored_HB
        bset    <BitFlags6a_t3 $40

loc_DB74:
        cli
        nop

loc_DB76:
        sei
        brset   <BitFlags6a_t3 $40 loc_DBF9
        ldx     #$B616
        brclr   <BitFlags2D $10 loc_DBBA
        brset   <BitFlags2D 1 loc_DBBA
        ldaa    #$16
        ldab    #$4A
        brclr   <BitFlags6a_t3 $20 loc_DBB1
        cmpa    DRBOffsetStored_HB
        beq     loc_DBAA
        inca
        cmpa    DRBOffsetStored_HB
        bne     loc_DBBA
        bset    <BitFlags6a_t3 $40
        bclr    <BitFlags6a_t3 $20
        bset    <BitFlags2D 1
        ldaa    #$13
        clrb
        stab    Counter_ACControl1
        bra     loc_DBB4

loc_DBAA:
        bset    <BitFlags6a_t3 $40
        inca
        comb
        bra     loc_DBB4

loc_DBB1:
        bset    <BitFlags6a_t3 $60

loc_DBB4:
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB

loc_DBBA:
        ldaa    1,x
        coma
        cmpa    0,x
        bne     loc_DBCA
        cmpa    #$4A
        bne     loc_DBCA
        bset    <BitFlags2D 4
        bra     loc_DBCD

loc_DBCA:
        bclr    <BitFlags2D 4

loc_DBCD:
        cli
        brclr   <BitFlags2D 2 locret_DBFA
        sei
        brset   <BitFlags6a_t3 $40 loc_DBF9
        ldaa    #$16
        ldab    #$EE
        brclr   <BitFlags6a_t3 $20 loc_DBF0
        cmpa    DRBOffsetStored_HB
        bne     loc_DBF9
        inca
        bset    <BitFlags6a_t3 $40
        bclr    <BitFlags6a_t3 $20
        bclr    <BitFlags2D 2
        bra     loc_DBF3

loc_DBF0:
        bset    <BitFlags6a_t3 $60

loc_DBF3:
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB

loc_DBF9:
        cli

locret_DBFA:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DBFB:
        brset   <BitFlags21 4 loc_DC2E
        brclr   <BitFlags21 2 loc_DC2E
        brclr   <IPL1 $40 loc_DC2E
        sei
        ldaa    <BitFlags6a_t3
        bita    #$60
        bne     loc_DC2C
        bset    <BitFlags21 4
        ldx     #$B6E0
        ldaa    0,x
        inca
        beq     loc_DC2C
        cmpa    byte_8AB6
        bcs     loc_DC21
        bset    <IPL1 8

loc_DC21:
        staa    DRBOffsetStored_LB
        ldaa    #$E0
        staa    DRBOffsetStored_HB
        bset    <BitFlags6a_t3 $40

loc_DC2C:
        cli
        nop

loc_DC2E:
        sei
        brset   <BitFlags6a_t3 $40 loc_DCAE
        ldx     #$B6E1
        brclr   <BitFlags2D $10 loc_DC6F
        brset   <BitFlags21 1 loc_DC6F
        ldaa    #$E1
        ldab    #$4A
        brclr   <BitFlags6a_t3 $20 loc_DC66
        cmpa    DRBOffsetStored_HB
        beq     loc_DC5F
        inca
        cmpa    DRBOffsetStored_HB
        bne     loc_DC6F
        bset    <BitFlags6a_t3 $40
        bclr    <BitFlags6a_t3 $20
        bset    <BitFlags21 1
        ldaa    #$E0
        clrb
        bra     loc_DC69

loc_DC5F:
        bset    <BitFlags6a_t3 $40
        inca
        comb
        bra     loc_DC69

loc_DC66:
        bset    <BitFlags6a_t3 $60

loc_DC69:
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB

loc_DC6F:
        ldaa    1,x
        coma
        cmpa    0,x
        bne     loc_DC7F
        cmpa    #$4A
        bne     loc_DC7F
        bset    <BitFlags21 2
        bra     loc_DC82

loc_DC7F:
        bclr    <BitFlags21 2

loc_DC82:
        cli
        brclr   <IPL1 8 locret_DCAF
        sei
        brset   <BitFlags6a_t3 $40 loc_DCAE
        ldaa    #$E1
        ldab    #$EE
        brclr   <BitFlags6a_t3 $20 loc_DCA5
        cmpa    DRBOffsetStored_HB
        bne     loc_DCAE
        inca
        bset    <BitFlags6a_t3 $40
        bclr    <BitFlags6a_t3 $20
        bclr    <IPL1 8
        bra     loc_DCA8

loc_DCA5:
        bset    <BitFlags6a_t3 $60

loc_DCA8:
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB

loc_DCAE:
        cli

locret_DCAF:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DCB0:
        brclr   <BitFlags29 8 loc_DCBB
        brclr   <BitFlags2f $40 loc_DCBB
        bset    <Ram_30 $10

loc_DCBB:
        sei
        brset   <BitFlags6a_t3 $40 loc_DD38
        ldx     #$B6E3
        brclr   <BitFlags2D $10 loc_DCF9
        brset   <BitFlags24 4 loc_DCF9
        ldaa    #$E3
        ldab    #$4A
        brclr   <BitFlags6a_t3 $20 loc_DCF0
        cmpa    DRBOffsetStored_HB
        beq     loc_DCE9
        inca
        cmpa    DRBOffsetStored_HB
        bne     loc_DCF9
        bset    <BitFlags6a_t3 $40
        bclr    <BitFlags6a_t3 $20
        bset    <BitFlags24 4
        bra     loc_DCF9

loc_DCE9:
        bset    <BitFlags6a_t3 $40
        inca
        comb
        bra     loc_DCF3

loc_DCF0:
        bset    <BitFlags6a_t3 $60

loc_DCF3:
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB

loc_DCF9:
        ldaa    1,x
        coma
        cmpa    0,x
        bne     loc_DD09
        cmpa    #$4A
        bne     loc_DD09
        bset    <BitFlags29 8
        bra     loc_DD0C

loc_DD09:
        bclr    <BitFlags29 8

loc_DD0C:
        cli
        brclr   <Ram_30 $10 locret_DD39
        sei
        brset   <BitFlags6a_t3 $40 loc_DD38
        ldaa    #$E3
        ldab    #$EE
        brclr   <BitFlags6a_t3 $20 loc_DD2F
        cmpa    DRBOffsetStored_HB
        bne     loc_DD38
        inca
        bset    <BitFlags6a_t3 $40
        bclr    <BitFlags6a_t3 $20
        bclr    <Ram_30 $10
        bra     loc_DD32

loc_DD2F:
        bset    <BitFlags6a_t3 $60

loc_DD32:
        staa    DRBOffsetStored_HB
        stab    DRBOffsetStored_LB

loc_DD38:
        cli

locret_DD39:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DD3A:
        brset   <BitFlags21 $20 loc_DDAE
        ldaa    <b5d_IPL2
        bita    #$18
        bne     loc_DDAE
        ldaa    <TargetBatteryVolts
        sei

loc_DD47:
        ldab    ADCTL_A2DControlReg
        bpl     loc_DD47
        suba    ADR2_A2DResults2
        cli
        bcs     loc_DDAE
        cmpa    byte_8A4B
        bcs     loc_DDAE
        ldd     <EngineRpm_HB
        cpd     word_8A4C
        bcs     loc_DDAE
        ldaa    #$F
        brclr   <BitFlags2e 1 loc_DD66
        clra

loc_DD66:
        anda    <Counter_MainLoop
        bne     locret_DD80
        ldaa    <BatVoltsDiagCounter
        inca
        beq     loc_DD71
        staa    <BatVoltsDiagCounter

loc_DD71:
        brset   <BitFlags2e 1 loc_DD81
        cmpa    byte_8A4E
        bcs     locret_DD80
        clra
        staa    <BatVoltsDiagCounter
        bset    <BitFlags2e 1

locret_DD80:
        rts

loc_DD81:
        brset   <BitFlags21 $10 loc_DD91
        cmpa    byte_8A4F
        bcs     locret_DD80
        clra
        staa    <BatVoltsDiagCounter
        bset    <BitFlags21 $10
        rts

loc_DD91:
        cmpa    byte_8A51
        bcs     locret_DD80
        clra
        staa    <BatVoltsDiagCounter
        bclr    <BitFlags21 $10
        ldd     #$58A
        jsr     ThrowNonCriticalError_
        bcc     locret_DD80
        bset    <b5d_IPL2 8
        bclr    <BitFlags2e 1
        bclr    <BitFlags21 $30
        rts

loc_DDAE:
        clra
        staa    <BatVoltsDiagCounter
        bclr    <BitFlags2e 1
        bclr    <BitFlags21 $30
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_DDB8:
        ldy     #$6485
        brset   <DRBSerialMode $80 loc_DE29
        brclr   <DRBSerialMode $40 loc_DE29
        ldaa    BAUD_SerialBaudRate
        cmpa    #$25
        bne     locret_DE28
        ldab    SCDR_SerialData
        ldaa    SCSR_SerialStatus
        bita    #$20
        beq     loc_DE2D
        bita    #$E
        bne     loc_DE24
        brset   0,y $E0 loc_DE49
        ldaa    #$F8
        brset   0,y $80 loc_DDFB
        deca
        brset   0,y $60 loc_DDFB
        ldaa    #$F5
        brset   0,y $40 loc_DDFB
        ldaa    #$F3
        brset   0,y $20 loc_DDFB
        ldaa    #$14

loc_DDFB:
        cba
        bne     loc_DE29
        ldaa    LDXi_6485
        adda    #$20
        staa    LDXi_6485
        anda    #$E0
        cmpa    #$A0
        bne     loc_DE24
        ldaa    #$E0
        staa    LDXi_6485
        ldaa    #$52
        staa    <DRBPointer1
        ldd     SCSR_SerialStatus
        ldaa    #$F8
        ldab    SCSR_SerialStatus
        staa    SCDR_SerialData
        bra     loc_DE24

loc_DE22:
        staa    <DRBPointer1

loc_DE24:
        ldd     SCSR_SerialStatus
        pulx

locret_DE28:
        rts

loc_DE29:
        clr     LDXi_6485
        rts

loc_DE2D:
        brset   0,y $E0 loc_DE39
        brclr   0,y $E0 loc_DE29
        bra     loc_DE24

loc_DE39:
        ldaa    <DRBPointer1
        deca
        cmpa    #$20
        bne     loc_DE22
        clra
        staa    <DRBPointer1
        staa    <DRBPointer2
        staa    <DRBSerialMode
        bra     loc_DE24

loc_DE49:
        ldaa    #$28
        staa    <DRBPointer1
        brset   0,y 8 loc_DE97
        brset   0,y $10 loc_DE5F
        bset    0,y $10
        stab    <DRBPointer2
        bra     loc_DE24

loc_DE5F:
        cmpb    <DRBPointer2
        bne     loc_DE88
        bclr    0,y $10
        tba
        ldab    LDXi_6485
        andb    #7
        cmpb    #4
        beq     loc_DE7D
        ldx     #$6481
        abx
        staa    0,x
        inc     LDXi_6485
        jmp     loc_DE24

loc_DE7D:
        cmpa    #$12
        bne     loc_DE85
        bclr    0,y 7

loc_DE85:
        jmp     loc_DE24

loc_DE88:
        bset    0,y 8
        cmpb    #$12
        bne     loc_DE9B

loc_DE90:
        bset    0,y $10
        jmp     loc_DE24

loc_DE97:
        cmpb    #$12
        beq     loc_DEA2

loc_DE9B:
        bclr    0,y $10
        jmp     loc_DE24

loc_DEA2:
        brclr   0,y $10 loc_DE90
        bclr    0,y $1F
        bra     loc_DE85

sub_DEAD:
        brset   <DRBSerialMode $40 loc_DEB5
        rts

loc_DEB2:
        jmp     loc_E065

loc_DEB5:
        brset   <DRBSerialMode $70 loc_DEB2
        ldab    SCDR_SerialData
        ldaa    SCSR_SerialStatus
        bita    #$20
        bne     loc_DEC4
        rts

loc_DEC4:
        ldx     #$6486
        ldaa    0,x
        bita    #3
        beq     loc_DED0
        jmp     loc_DF32

loc_DED0:
        cmpb    #$F8
        bcc     loc_DEDB

loc_DED4:
        jsr     sub_E093
        jsr     sub_E06A
        rts

loc_DEDB:
        tsta
        bne     loc_DEE7
        cmpb    #$F8
        bne     loc_DED4
        ldaa    #$80
        jmp     loc_E063

loc_DEE7:
        cmpa    #$80
        bne     loc_DEF4
        cmpb    #$F9
        bne     loc_DED4
        ldaa    #$C0
        jmp     loc_E063

loc_DEF4:
        cmpa    #$C0
        bne     loc_DF01
        cmpb    #$FB
        bne     loc_DED4
        ldaa    #$E0
        jmp     loc_E063

loc_DF01:
        cmpa    #$E0
        bne     loc_DED4
        cmpb    #$F8
        bne     loc_DF0E
        ldaa    #2
        jmp     loc_E063

loc_DF0E:
        cmpb    #$F9
        bne     loc_DF17
        ldaa    #1
        jmp     loc_E063

loc_DF17:
        cmpb    #$FB
        bne     loc_DED4
        ldy     <EngineRpm_HB
        cpy     #$100
        bhi     loc_DF29
        ldaa    #5
        jmp     loc_E063

loc_DF29:
        ldd     #$17
        jsr     sub_E06A
        jmp     loc_E063

loc_DF32:
        bita    #1
        beq     loc_DF39
        jmp     loc_DF46

loc_DF39:
        jmp     loc_DFF5

sub_DF3C:
        ldaa    SCSR_SerialStatus
        ldaa    SCDR_SerialData
        stab    SCDR_SerialData
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

loc_DF46:
        asla
        bcs     loc_DF9D
        asla
        bcs     loc_DF6E
        asla
        bcs     loc_DF63
        asla
        bcs     loc_DF59
        stab    STe_648A
        ldaa    #$10
        bra     loc_DF98

loc_DF59:
        stab    FDRVar3
        jsr     sub_E070
        ldaa    #$20
        bra     loc_DF98

loc_DF63:
        ldy     FDRVar3
        ldab    0,y
        ldaa    #$40
        bra     loc_DF98

loc_DF6E:
        cmpb    #$FE
        beq     loc_DF7F

loc_DF72:
        jsr     sub_E06A
        cmpb    #$1B
        bne     loc_DF7C
        bset    <DRBSerialMode $40

loc_DF7C:
        jmp loc_E065

loc_DF7F:
        ldaa    0,x
        bita    #4
        beq     loc_DF96
        ldy     <EngineRpm_HB
        cpy     #$100
        bcs     loc_DF96
        ldab    #$17
        jsr     sub_E06A
        jmp     loc_E065

loc_DF96:
        ldaa    #$80

loc_DF98:
        oraa    0,x
        jmp     loc_E063

loc_DF9D:
        sei
        ldy     FDRVar3
        cpy     #$9400
        bcc     loc_DFB5
        stab    0,y

loc_DFAB:
        ldab    0,y
        jsr     sub_E06A
        cli
        jmp     loc_E065

loc_DFB5:
        ldx     #$64D0
        ldy     #$DFD8

loc_DFBC:
        ldaa    0,y
        staa    0,x
        inx
        iny
        cpy     #$DFF5
        bne     loc_DFBC
        ldx     #$64D0
        ldy     FDRVar3
        jsr     0,x
        ldx     #FDRVar0
        bra     loc_DFAB
        ldaa    #$AA
        staa    loc_D553+2
        lsra
        staa    M99_AAAA
        ldaa    #$A0
        staa    loc_D553+2
        stab    0,y
        ldx     #Ram_00

loc_DFEC:
        cmpb    0,y
        beq     locret_DFF4
        dex
        bne     loc_DFEC

locret_DFF4:
        rts

loc_DFF5:
        asla
        bcs     loc_E031
        asla
        bcs     loc_E023
        asla
        bcs     loc_E019
        asla
        bcs     loc_E00E
        asla
        bcs     loc_E00B
        stab    FDRVar2
        ldaa    #8
        bra     loc_E02C
loc_E00B:
        stab    FDRVar1
        ldaa    #$10
        bra     loc_E02C
loc_E00E:
        stab    STe_648A
        ldaa    #$20
        bra     loc_E02C

loc_E019:
        stab    FDRVar3
        jsr     sub_E070
        ldaa    #$C0
        bra     loc_E02C

loc_E023:
        cmpb    #$FD
        beq     loc_E02A
        jmp     loc_DF72

loc_E02A:
        ldaa    #$80

loc_E02C:
        oraa    0,x
        jmp     loc_E063

loc_E031:
        ldx     FDRVar3
        ldy     FDRVar1
        ldab    SCDR_SerialData
        ldaa    0,x
        staa    SCDR_SerialData
        inx
        dey
        bne     loc_E04D
        ldx     #$6486
        jsr     sub_E06A
        pulx
        rts

loc_E04D:
        stx     FDRVar3
        sty     FDRVar1
        cba
        bne     loc_E059
        pulx
        rts

loc_E059:
        ldaa    FDRVar0
        anda    #$7F
        staa    FDRVar0
        pulx
        rts

loc_E063:
        staa    0,x

loc_E065:
        jsr     sub_DF3C
        pulx
        rts

sub_E06A:
        clr     0,x
        bclr    <DRBSerialMode $40
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E070:
        pshx
        ldx     FDRVar3
        cpx     #$8000
        bcs     loc_E088
        cpx     #$FFFF
        bhi     loc_E088
        cpx     #$B600
        bcs     loc_E091
        cpx     #$B800
        bcc     loc_E091

loc_E088:
        pulx
        ldx     #$6486
        jsr     sub_E06A
        pulx
        rts

loc_E091:
        pulx
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E093:
        cmpb    #$14
        beq     loc_E098
        rts

loc_E098:
        clr     FDRVar0
        ldab    #$25
        stab    BAUD_SerialBaudRate
        ldab    LDXi_6485
        addb    #$20
        stab    LDXi_6485
        bset    <DRBSerialMode $30
        ldd     SCSR_SerialStatus
        pulx
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E0B0:
        ldab    #$93
        ldaa    Temp0
        bne     loc_E0B9
        ldab    #$80

loc_E0B9:
        aba
        adda    Temp1
        adda    Temp2
        staa    Temp3
        tba
        ldab    #$40
        ldy     #$1000
        ldx     #$6400
        sei
        bset    0,x 8
        bclr    8,y $20
        cmpb    SPSR_SerialPeripheralStatus
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    Temp0

loc_E0EB:
        brclr   0,x 8 loc_E0F5
        decb
        bne     loc_E0EB
        jmp     loc_E18E

loc_E0F5:
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        staa    Temp0
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    Temp1

loc_E10B:
        brclr   0,x 8 loc_E115
        decb
        bne     loc_E10B
        jmp     loc_E18E

loc_E115:
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        staa    Temp1
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    Temp2

loc_E12B:
        brclr   0,x 8 loc_E135
        decb
        bne     loc_E12B
        jmp     loc_E18E

loc_E135:
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop
        ldaa    SPDR_SerialPeripheralDataIO
        staa    Temp2
        cmpa    SPSR_SerialPeripheralStatus
        ldaa    Temp3

loc_E14B:
        brclr   0,x 8 loc_E154
        decb
        bne     loc_E14B
        bra     loc_E18E

loc_E154:
        staa    SPDR_SerialPeripheralDataIO
        bset    2,x 8
        bclr    2,x 8
        nop

loc_E15E:
        brset   $29,y $80 loc_E168
        decb
        bne     loc_E15E
        bra     loc_E18E

loc_E168:
        ldaa    SPDR_SerialPeripheralDataIO
        bset    8,y $20
        cli
        suba    Temp0
        suba    Temp1
        suba    Temp2
        bne     locret_E190
        ldaa    Temp0
        anda    #$F
        cmpa    #1
        bne     locret_E190
        bset    <CCDFlags5 $40
        brset   <CCDFlags6 $80 locret_E190
        bset    <CCDFlags4_tsbec $10

loc_E18E:
        nop
        cli

locret_E190:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E191:
        ldab    <Counter_MainLoop
        andb    #$F
        bne     loc_E1D4
        brset   <CCDFlags4_tsbec 8 loc_E1BB
        ldaa    <KeyOnOrEngineRunningTime
        cmpa    #$83
        bcs     loc_E1D1
        ldaa    <EngineRpm_HB
        cmpa    #$2F
        bcs     loc_E1D1
        ldaa    <BatteryVolts
        cmpa    #$BD
        bcc     loc_E1D1
        ldab    <CCDFlags4_BodyCompFlags4_X
        incb
        stab    <CCDFlags4_BodyCompFlags4_X
        cmpb    #$71
        bcs     loc_E1D4
        bset    <CCDFlags4_tsbec 8
        bra     loc_E1D1

loc_E1BB:
        ldaa    <TargetBatteryVolts
        suba    <BatteryVolts
        bcs     loc_E1C5
        cmpa    #1
        bhi     loc_E1D1

loc_E1C5:
        ldab    <CCDFlags4_BodyCompFlags4_X
        incb
        stab    <CCDFlags4_BodyCompFlags4_X
        cmpb    #$22
        bcs     loc_E1D4
        bclr    <CCDFlags4_tsbec 8

loc_E1D1:
        clra
        staa    <CCDFlags4_BodyCompFlags4_X

loc_E1D4:
        brset   <Counter_MainLoop 1 loc_E1EE
        ldx     #$E418
        ldab    <CCDTemp_HB
        lsld
        addb    #2
        abx
        lsrd
        stab    <CCDTemp_HB
        ldx     0,x
        jsr     0,x
        std     Temp1
        jsr     sub_E0B0

loc_E1EE:
        ldaa    CountdownTimerFromKeyOn
        bne     locret_E1FB
        ldaa    byte_8014
        beq     loc_E1FC
        bclr    <CCDFlags5 $20

locret_E1FB:
        rts

loc_E1FC:
        ldaa    PPROG_EEPROMControlReg
        bita    #2
        bne     loc_E210
        bclr    <CCDFlags4_tsbec $20
        ldaa    byte_B612
        bita    #1
        beq     loc_E210
        bset    <CCDFlags4_tsbec $20

loc_E210:
        ldaa    <Counter_MainLoop
        bita    #3
        bne     loc_E275
        brclr   <CCDFlags5 $40 loc_E238
        bset    <CCDFlags5 $80
        bclr    <CCDFlags5 $60
        bclr    <CCDFlags6 $7F
        brset   <CCDFlags6 $80 loc_E275
        ldaa    <BitFlags6a_t3
        bita    #$60
        bne     loc_E275
        ldaa    byte_B612
        bita    #2
        beq     loc_E275
        anda    #$FD
        bra     loc_E261

loc_E238:
        ldaa    <CCDFlags6
        anda    #$7F
        brclr   <CCDFlags5 $80 loc_E246
        cmpa    #$71
        bcc     loc_E24F
        bra     loc_E24A

loc_E246:
        cmpa    #$2D
        bcc     loc_E275

loc_E24A:
        inc     CCDFlags6
        bra     loc_E275

loc_E24F:
        ldaa    <BitFlags6a_t3
        bita    #$60
        bne     loc_E275
        ldaa    byte_B612
        bita    #2
        bne     loc_E275
        bset    <CCDFlags6 $80
        oraa    #2

loc_E261:
        sei
        brclr   <BitFlags6a_t3 $40 loc_E269
        cli
        bra     loc_E275

loc_E269:
        bset    <BitFlags6a_t3 $40
        cli
        staa    DRBOffsetStored_LB
        ldaa    #$12
        staa    DRBOffsetStored_HB

loc_E275:
        brclr   <CCDFlags5 $10 loc_E289
        brset   <CCDFlags5 $80 locret_E288
        ldaa    <CCDFlags6
        anda    #$7F
        cmpa    #$2D
        bcs     locret_E288
        bset    <CCDFlags5 $20

locret_E288:
        rts

loc_E289:
        brset   <CCDFlags5 $10 locret_E2D9
        brclr   <IPL1 $40 locret_E2D9
        ldaa    <BitFlags6a_t3
        bita    #$60
        bne     locret_E2D9
        ldaa    byte_B612
        bita    #1
        bne     loc_E2A4
        bita    #2
        bne     loc_E2D3
        bra     loc_E2D6

loc_E2A4:
        brset   <CCDFlags5 $80 loc_E2B2
        ldaa    <CCDFlags6
        anda    #$7F
        cmpa    #$2D
        bcs     locret_E2D9
        bra     loc_E2D0

loc_E2B2:
        sei
        brclr   <BitFlags6a_t3 $40 loc_E2BA
        cli
        bra     locret_E2D9

loc_E2BA:
        bset    <BitFlags6a_t3 $40
        cli
        adda    #4
        cmpa    #$4C
        bcs     loc_E2C6
        anda    #$FE

loc_E2C6:
        anda    #$FD
        staa    DRBOffsetStored_LB
        ldaa    #$12
        staa    DRBOffsetStored_HB

loc_E2D0:
        bset    <CCDFlags4_tsbec $20

loc_E2D3:
        bset    <CCDFlags5 $80

loc_E2D6:
        bset    <CCDFlags5 $10

locret_E2D9:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_CCDBusOutputStatus:
        clra
        clrb
        staa    Temp0
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_EngineRPM:
        ldaa    #$E4
        staa    Temp0
        ldaa    <EngineRpm_HB
        ldab    <MapValue
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_FuelOutput:
        ldaa    #$84
        staa    Temp0
        sei
        ldaa    <CCDFuelOutput_HB
        ldab    <Counter_SpeedSensorInterrupt_HB_X
        clr     CCDFuelOutput_HB
        clr     Counter_SpeedSensorInterrupt_HB_X
        cli
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_SpeedSensorCounter:
        ldaa    #$44
        staa    Temp0
        sei
        ldaa    <Counter_InjectorCalc
        clrb
        clr     Counter_InjectorCalc
        cli
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_ConfigConst1:
        ldaa    #$AC
        staa    Temp0
        ldd     word_8012
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_CoolantTemp:
        ldaa    #$8C
        staa    Temp0
        ldaa    <CoolantTemp
        ldab    <AmbientAirTempVolts2
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_BatVoltsEtc:
        ldaa    #$D4
        staa    Temp0
        ldaa    <BatteryVolts
        ldab    <TargetBatteryVolts
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_ThrottlePos:
        ldaa    #$42
        staa    Temp0
        ldaa    <TpsVolts
        suba    <LowestSessionTpsVolts
        bcc     loc_E333
        clra

loc_E333:
        clrb
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_TargetIdleSPeed:
        ldaa    #$CC
        staa    Temp0
        ldaa    PPROG_EEPROMControlReg
        bita    #2
        beq     loc_E344
        jmp     CCD_CCDBusOutputStatus

loc_E344:
        ldd     word_B600
        lsld
        lsld
        staa    Temp3
        ldd     <TargetIdleSpeedHB
        lsld
        lsld
        tab
        ldaa    Temp3
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_Baro:
        ldaa    #$54
        staa    Temp0
        ldaa    <BaroPressure
        clrb
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_VehicleSpeed:
        ldaa    #$24
        staa    Temp0
        ldd     <VehicleSpeed_HB
        lsld
        lsld
        staa    Temp3
        lsld
        bcc     loc_E36F
        ldaa    #$FF

loc_E36F:
        ldab    #$34
        mul
        lsld
        lsld
        aslb
        adca    #0
        tab
        ldaa    Temp3
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_AlarmStatus:
        ldaa    PPROG_EEPROMControlReg
        bita    #2
        bne     loc_E3AD
        ldx     #$B672
        ldab    <CCDFlags4_tsbec
        tba
        incb
        andb    #7
        anda    #$F8
        cmpb    #6
        bne     loc_E393
        clrb
loc_E393:
        aba
        staa    <CCDFlags4_tsbec
        aslb
        aslb
        abx
        brset   0,x $FF loc_E3AD
        ldaa    0,x
        staa    Temp0
        adda    1,x
        adda    2,x
        cmpa    3,x
        bne     loc_E3AD
        ldd     1,x
        rts

loc_E3AD:
        jmp     CCD_CCDBusOutputStatus

CCD_ToggleBCFlags:
        ldaa    #$EC
        staa    Temp0
        clra
        brclr   <b5C_IPL1_t3 2 loc_E3BC
        oraa    #1

loc_E3BC:
        brclr   <b5C_IPL1_t3 $40 loc_E3C2
        oraa    #2

loc_E3C2:
        brclr   <CCDFlags4_tsbec 8 loc_E3C8
        oraa    #4

loc_E3C8:
        brclr   <b5C_IPL1_t3 $20 loc_E3CE
        oraa    #8

loc_E3CE:
        clrb
        brclr   <CCDFlags4_tsbec $10 loc_E3D8
        bclr    <CCDFlags4_tsbec $10
        orab    #1

loc_E3D8:
        brclr   <CCDFlags4_tsbec $20 locret_E3DE
        orab    #2

locret_E3DE:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CCD_SwitchState:
        ldaa    #$A4
        staa    Temp0
        clra
        brset   <CruiseStatus_1 $80 loc_E3EB
        oraa    #1

loc_E3EB:
        ldab    <TpsVolts
        subb    <LowestSessionTpsVolts
        bcs     loc_E3F7
        cmpb    #5
        bcs     loc_E3F7
        oraa    #2

loc_E3F7:
        brclr   <StartupSwitchMirror1 $20 loc_E3FD
        oraa    #4

loc_E3FD:
        brclr   <PIA2_Buffer_t3 1 loc_E403
        oraa    #8

loc_E403:
        brset   <PIA1_Buffer_t3 $40 loc_E409
        oraa    #$20

loc_E409:
        ldab    <StartupSwitchMirror1
        lsrb
        andb    #7
        psha
        ldaa    byte_8011
        beq     loc_E416
        eorb    #1

loc_E416:
        pula
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_BatVoltsEtc
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_Baro
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_CoolantTemp
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_TargetIdleSPeed
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_ToggleBCFlags
        fdb CCD_EngineRPM
        fdb CCD_BatVoltsEtc
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_AlarmStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_CoolantTemp
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_FuelOutput
        fdb CCD_SpeedSensorCounter
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ConfigConst1
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_VehicleSpeed
        fdb CCD_SwitchState
        fdb CCD_CCDBusOutputStatus
        fdb CCD_EngineRPM
        fdb CCD_ThrottlePos
        fdb CCD_CCDBusOutputStatus
        fdb CCD_CCDBusOutputStatus

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

gb_AISTEP_BitPatternForAisControl:
        fcb   6
        fcb   5
        fcb   9
        fcb  $A

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

TL_TempForColdScaleFromA2D:
        fcb   7
        fcb   0
        fcb $D3
        fcb $FF
        fcb $85
        fcb $53
        fcb $AB
        fcb $FF
        fcb $9D
        fcb $D7
        fcb $78
        fcb $FF
        fcb $55
        fcb $E6
        fcb $6E
        fcb $FF
        fcb $17
        fcb $F1
        fcb $64
        fcb $FE
        fcb $CD
        fcb $F6
        fcb $5E
        fcb $FD
        fcb $AB
        fcb $FF
        fcb $49

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

TL_TempForHotScaleA2D:
        fcb   4
        fcb $42
        fcb $FF
        fcb $FF
        fcb $55
        fcb $57
        fcb $F1
        fcb $FF
        fcb $75
        fcb $C5
        fcb $B5
        fcb $FF
        fcb $4F
        fcb $FF
        fcb $8D

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

TL_ScaleCoolantTemp:
        fcb   9
        fcb $58
        fcb   0
        fcb   1
        fcb $86
        fcb $6D
        fcb $20
        fcb   1
        fcb $86
        fcb $82
        fcb $40
        fcb   1
        fcb $86
        fcb $97
        fcb $60
        fcb   1
        fcb $86
        fcb $AC
        fcb $80
        fcb   1
        fcb $86
        fcb $C1
        fcb $A0
        fcb   1
        fcb $86
        fcb $D6
        fcb $C0
        fcb   1
        fcb $86
        fcb $EB
        fcb $E0
        fcb   1
        fcb $8C
        fcb $FF
        fcb $FF
        fcb   3
        fcb $2F
        fcb $99
        fcb $FF
        fcb $AF
        fcb $CC
        fcb $67
        fcb $FF
        fcb $7C
        fcb $E9
        fcb $58
        fcb   5
        fcb $15
        fcb $FF
        fcb $FE
        fcb   0
        fcb $1B
        fcb $F3
        fcb $FE
        fcb $F3
        fcb $2E
        fcb $DF
        fcb $FF
        fcb $4A
        fcb $4A
        fcb $CB
        fcb $FF
        fcb $91
        fcb $C8
        fcb $94

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

TL_ScaleChargeTemp: 
        fcb   9
        fcb $58
        fcb   0
        fcb   1
        fcb $99
        fcb $6C
        fcb $20
        fcb   1
        fcb $99
        fcb $80
        fcb $40
        fcb   1
        fcb $99
        fcb $94
        fcb $60
        fcb   1
        fcb $99
        fcb $A8
        fcb $80
        fcb   1
        fcb $99
        fcb $BC
        fcb $A0
        fcb   1
        fcb $99
        fcb $D0
        fcb $C0
        fcb   1
        fcb $99
        fcb $E4
        fcb $E0
        fcb   1
        fcb $8C
        fcb $F8
        fcb $FF

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

TL_TempForScaleAmbientA2D:
        fcb   6
        fcb   5
        fcb $FF
        fcb $FC
        fcb $C0
        fcb $15
        fcb $CB
        fcb $FE
        fcb $F8
        fcb $32
        fcb $AD
        fcb $FF
        fcb $83
        fcb $6F
        fcb $8F
        fcb $FF
        fcb $96
        fcb $C8
        fcb $6C
        fcb $FF
        fcb $56
        fcb $E7
        fcb $58
        fcb   5
        fcb $79
        fcb $EC
        fcb $FF
        fcb $E4
        fcb $82
        fcb $EB
        fcb $FF
        fcb $A2
        fcb $95
        fcb $E4
        fcb $FF
        fcb $9A
        fcb $AE
        fcb $DA
        fcb $FF
        fcb $C8
        fcb $B7
        fcb $D8
        fcb   5
        fcb $79
        fcb $ED
        fcb $FF
        fcb $E4
        fcb $82
        fcb $EC
        fcb $FF
        fcb $95
        fcb $95
        fcb $E4
        fcb $FF
        fcb $A4
        fcb $AE
        fcb $DB
        fcb $FF
        fcb $8F
        fcb $B7
        fcb $D7
        fcb   5
        fcb $79
        fcb $EE
        fcb $FF
        fcb $C8
        fcb $82
        fcb $EC
        fcb $FF
        fcb $A2
        fcb $95
        fcb $E5
        fcb $FF
        fcb $9A
        fcb $AE
        fcb $DB
        fcb $FF
        fcb $AB
        fcb $B7
        fcb $D8
        fcb   5
        fcb $96
        fcb $9C
        fcb $FA
        fcb   0
        fcb $A2
        fcb $54
        fcb $FF
        fcb   0
        fcb $C2
        fcb $34
        fcb $FF
        fcb $9C
        fcb $E3
        fcb $27
        fcb $FF
        fcb $B7
        fcb $FF
        fcb $1F

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ScaleYbyA:
        psha
        pshy
        pulb
        mul
        xgdy
        pulb
        pula
        mul
        adca    #0
        tab
        aby
        pshy
        puly
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ScaleXbyB_somethingelse:
        psha
        tba
        ldy     0,x
        bsr     ScaleYbyA
        sty     Temp6
        pula
        psha
        ldab    1,x
        mul
        addd    Temp6
        bcs     loc_E647
        std     Temp6
        ldab    0,x
        pula
        mul
        tsta
        bne     loc_E648
        addb    Temp6
        bcc     loc_E64D
        bra     loc_E648

loc_E647:
        pula

loc_E648:
        ldab    #$FF
        stab    Temp7

loc_E64D:
        tba
        ldab    Temp7
        std     Temp6
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

Lookup4ByteTable:
        ldy     #0
        ldab    0,x
        aby
        inx
        ldab    #4
        cmpa    0,x
        bhi     loc_E669

loc_E664:
        ldaa    1,x
        tab
        bra     loc_E68A

loc_E669:
        dey
        beq     loc_E664
        cmpa    4,x
        bcs     loc_E674
        abx
        bra     loc_E669

loc_E674:
        suba    0,x
        psha
        ldab    2,x
        mul
        xgdy
        pula
        ldab    3,x
        mul
        adca    #0
        tab
        aby
        xgdy
        addb    1,x
        tba

loc_E68A:
        psha
        pula
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E68D:
        psha
        clrb
        rola
        rolb
        rola
        rolb
        rola
        rolb
        abx
        ldab    0,x
        subb    1,x
        bcs     loc_E6A0
        mul
        nega
        bra     loc_E6A2

loc_E6A0:
        negb
        mul

loc_E6A2:
        adda    0,x
        tab
        pshb
        pulb
        pula
        rts
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E6AA:
        ldy     #$36
        ldd     word_8072
        ldx     byte_8074
        brclr   <TimerOverflowsBetweenCamPulses $FF sub_E6C0
        dey
        ldd     word_8076
        ldx     byte_8078

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E6C0:
        pshx
        ldx     0,y
        fdiv
        stx     Temp6
        pula
        pulb
        ldx     0,y
        idiv
        xgdx
        addd    Temp6
        bcc     loc_E6D7
        ldd     #$FFFF

loc_E6D7:
        std     Temp6
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ConvertMAPVoltsToValue:
        ldab    byte_8021
        beq     loc_E6E1
        mul

loc_E6E1:
        addd    word_8022
        bcc     locret_E6E8
        ldaa    #$FF

locret_E6E8:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E6E9:
        psha
        tba
        ldy     0,x
        jsr     ScaleYbyA
        pula
        tsta
        xgdy
        beq     loc_E6FE
        addd    0,x
        bcc     loc_E6FE
        ldd     #$FFFF
loc_E6FE:
        psha
        pshb
        pulb
        pula
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DetermineNumberOfOverflowsBetweenSensorPulses_MM:
        subd    4,x
        staa    0,y
        ldaa    0,x
        lsrd
        eorb    0,y
        bpl     loc_E717
        ldaa    0,x
        inca
        beq loc_E717
        staa    0,x

loc_E717:
        ldaa    0,x
        lsra
        cmpa    1,x
        bcs     locret_E720
        staa    1,x

locret_E720:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E721:
        ldx     #$8053
        ldd     <EngineRpm_HB
        aslb
        adca    #0
        jsr     Lookup4ByteTable
        staa    <EngineRPM_3D
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E72F:
        ldy     #$E7A4
        brclr   2,x $FF loc_E73B
        ldy     #$E7A0

loc_E73B:
        pshy
        psha
        psha
        ldaa    1,x
        deca
        mul
        psha
        pshb
        tsy
        ldaa    2,y
        ldab    0,x
        decb
        mul
        stab    3,y
        ldab    1,x
        stab    2,y
        mul
        inx
        inx
        inx
        abx
        tsta
        beq     loc_E762
        inx
        ldab    #$FF
        abx

loc_E762:
        ldab    1,y
        abx
        ldab    0,y
        pshy
        ldy     4,y
        ldaa    0,x
        suba    1,x
        jsr     0,y
        puly
        staa    1,y
        ldab    2,y
        abx
        pulb
        pshy
        ldy     4,y
        ldaa    0,x
        suba    1,x
        jsr     0,y
        puly
        tsx
        staa    1,x
        ldab    2,x
        ldy     3,x
        ldaa    0,x
        suba    1,x
        jsr     0,y
        pulb
        pulx
        pulx
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

InterpSigned:
        blt     loc_E7AC
        bra     loc_E7A6

InterpUnsigned:
        bcs     loc_E7AC

loc_E7A6:
        mul
        adca    #0
        nega
        bra     loc_E7B0

loc_E7AC:
        nega
        mul
        adca    #0

loc_E7B0:
        adda    0,x
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ProcessMapOrTpsBlockData:
        suba    0,y
        bcs     loc_E7BD
        ldab    1,x
        mul
        bra     loc_E7C5

loc_E7BD:
        nega
        ldab    0,x
        mul
        nega
        negb
        sbca    #0

loc_E7C5:
        addd    0,y
        std     0,y
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ResetCopTimer2:
        sei
        ldaa    SwitchPortAccessReg1
        eora    #2
        staa    SwitchPortAccessReg1
        cli

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_E7D6:
        ldd     #$55AA
        staa    COPRST_ArmOCToggleAndResetCopTimerReg
        stab    COPRST_ArmOCToggleAndResetCopTimerReg
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

OCToggleAndResetCopTimer:
        ldaa    SwitchPortAccessReg1
        anda    #$FD
        staa    SwitchPortAccessReg1
        ldab    #$10

loc_E7EA:
        decb
        bne     loc_E7EA
        oraa    #2
        staa    SwitchPortAccessReg1
        ldd     #$55AA
        staa    COPRST_ArmOCToggleAndResetCopTimerReg
        stab    COPRST_ArmOCToggleAndResetCopTimerReg
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        ldx     #ErrorBitRegisterStored0
        bra     loc_E809
        ldx     #Ram_05
        bra     loc_E809

sub_E806:
        ldx     #Ram_01

loc_E809:
        ldy     #$242
        jsr     OCToggleAndResetCopTimer

loc_E810:
        ldaa    SwitchPortAccessReg1
        bita    #$40
        bne     loc_E819
        sec
        rts

loc_E819:
        jsr     OCToggleAndResetCopTimer
        clc
        dey
        bne     loc_E810
        dex
        bne     loc_E809
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
sub_E825:
        ldaa    SwitchPortAccessReg1
        bita    #$40
        bne     loc_E841
        brset   <Ram_30 $40 loc_E83C
        bset    <Ram_30 $40
        bclr    <BitFlags21 $80
        bclr    <BitFlags2e $42
        bclr    <Ram_30 $80

loc_E83C:
        clr CountdownTimerFromKeyOn
        cli
        rts

loc_E841:
        bclr    <BitFlags21 $80
        bclr    <BitFlags2e $42
        bclr    <Ram_30 $C0
        ldaa    CountdownTimerFromKeyOn
        bne     loc_E859
        ldaa    #$17
        ldab    <TimerOverflowsBetweenCamPulses
        cmpb    #4
        bcs     loc_E859
        ldaa    #9

loc_E859:
        deca
        beq     loc_E860
        staa    CountdownTimerFromKeyOn
        rts

loc_E860:
        sei
        clra
        staa    <ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
        staa    <ClearTheErrorTimer_0
        jsr     OCToggleAndResetCopTimer
        jsr     sub_D15F
        ldaa    #$20

loc_E86E:
        ldab    SwitchPortAccessReg1
        bitb    #$40
        beq     loc_E83C
        deca
        bne     loc_E86E
        jsr     OCToggleAndResetCopTimer
        ldaa    #$32
        staa    Temp3

loc_E880:
        jsr     sub_E806
        bcs     loc_E8CC
        dec     Temp3
        bne     loc_E880
        ldaa    #$FF
        staa    TFLG1_TimerInterruptFlag1
        ldaa    #$32
        staa    Temp3

loc_E894:
        jsr     sub_E806
        bcs     loc_E8CC
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #6
        bne     loc_E8CC
        dec     Temp3
        bne     loc_E894
        ldab    #3

loc_E8A7:
        ldaa    #$10
        staa    ADCTL_A2DControlReg

loc_E8AC:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_E8AC
        ldaa    ADR1_A2DResults1
        cmpa    TL_MapSensorMiddleLimit
        bcc     loc_E8C9
        decb
        bne     loc_E8A7
        ldd     #$2481
        jsr     ThrowNonCriticalError_
        bcc     loc_E8C9
        bset    <Ram_05 4
        bra     loc_E8CC

loc_E8C9:
        bclr    <Ram_05 4

loc_E8CC:
        jsr     CountRamValuesFrom05to20
        std     <MinimumTimerCountBeforeMainloopCanContinue
        jsr     OCToggleAndResetCopTimer
        ldd     #0
        staa    PPROG_EEPROMControlReg
        stab    PIA_Ctrl_1
        staa    SwitchPortAccessReg1
        ldab    #7
        stab    PIA3_Buffer_2_t3
        staa    PIA_Ctrl_5
        staa    PIA_Ctrl_2
        ldd     #0
        std     OC1M_OutputCompare1Mask
        clr     SCCR2_SerialControlReg2
        ldd     #$FFFE
        std     PORTD_PortD
        ldd     #$AAF8
        staa    TCTL1_TimerControlReg1
        stab    CFORC_TimerForceCompare
        jsr     OCToggleAndResetCopTimer

loc_E906:
        ldab    SwitchPortAccessReg1
        bitb    #$40
        beq     loc_E916
        jsr     sub_E7D6
        jmp     loc_E906
        jmp     loc_E906

loc_E916:
        jsr     sub_E7D6
        ldaa    #$40

loc_E91B:
        ldab    SwitchPortAccessReg1
        bitb    #$40
        bne     loc_E906
        deca
        bne     loc_E91B
        jsr     sub_E7D6
        jmp     __RESET

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CountRamValuesFrom05to20:
        clra
        clrb
        ldx     #Ram_05

loc_E930:
        addb    0,x
        bcc     loc_E935
        inca

loc_E935:
        inx
        cpx     #$20
        bcs     loc_E930
        rts

        ldaa    #$16
        bsr     sub_E942
        ldaa    #2

sub_E942:
        staa    PPROG_EEPROMControlReg
        stab    0,x
        inca
        staa    PPROG_EEPROMControlReg
        ldy     #$1658

loc_E94F:
        dey
        bne     loc_E94F
        deca
        staa    PPROG_EEPROMControlReg
        clra
        staa    PPROG_EEPROMControlReg
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

EmissionMaintenanceReminder2_MM:
        brset   <BitFlags6a_t3 $40 loc_E963
        jmp     loc_E9EC

loc_E963:
        ldaa    PPROG_EEPROMControlReg
        beq     loc_E979
        bclr    <BitFlags6a_t3 $80
        cmpa    #$17
        bne     loc_E974
        bset    <BitFlags6a_t3 8
        bra     loc_E97F

loc_E974:
        bclr    <BitFlags6a_t3 8
        bra     loc_E97F

loc_E979:
        bset    <BitFlags6a_t3 $80
        bclr    <BitFlags6a_t3 8

loc_E97F:
        clra
        staa    PPROG_EEPROMControlReg
        ldaa    CountdownTimerFromKeyOn
        beq     loc_E991
        ldab    #3
        cba
        bcc     loc_E991
        tba
        staa    CountdownTimerFromKeyOn

loc_E991:
        ldx     #$B600
        ldab    DRBOffsetStored_HB
        abx
        ldab    DRBOffsetStored_LB
        ldaa    0,x
        cba
        beq     loc_E9D9
        brset   <BitFlags6a_t3 $80 loc_E9C3
        brclr   <BitFlags6a_t3 8 loc_E9AC
        cmpa    #$FF
        beq     loc_E9C3

loc_E9AC:
        brset   <b5D_IPL2_t3 $40 loc_E9D9
        pshx
        psha
        pshb
        ldd     #$318A
        jsr     ThrowNonCriticalError_
        pulb
        pula
        pulx
        bcc     loc_E9C3
        bset    <b5D_IPL2_t3 $40
        bra     loc_E9D9

loc_E9C3:
        anda    DRBOffsetStored_LB
        cmpa    DRBOffsetStored_LB
        beq     loc_E9CF
        ldaa    #$16
        bra     loc_E9D1

loc_E9CF:
        ldaa    #2

loc_E9D1:
        staa    PPROG_EEPROMControlReg
        stab    0,x
        inca
        bra     loc_E9ED

loc_E9D9:
        bclr    <BitFlags6a_t3 $40
        brset   <BitFlags6a_t3 $20 loc_E9EC
        ldaa    #3
        cmpa    CountdownTimerFromKeyOn
        bne     loc_E9EC
        ldaa    #1
        staa    CountdownTimerFromKeyOn

loc_E9EC:
        clra

loc_E9ED:
        staa    PPROG_EEPROMControlReg
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ErrorCodeResetEeprom:
        ldx     #$B610

loc_E9F4:
        ldab    #$10
        abx
        cpx     #$B650
        bhi     locret_EA05
        ldaa    0,x
        inca
        beq     locret_EA05
        bsr     sub_EA06
        bra     loc_E9F4

locret_EA05:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_EA06:
        ldaa    #$E
        staa    PPROG_EEPROMControlReg
        stab    0,x
        inca
        staa    PPROG_EEPROMControlReg
        ldy #$1652

loc_EA15:
        dey
        bne     loc_EA15
        deca
        staa    PPROG_EEPROMControlReg
        clr     PPROG_EEPROMControlReg
        sei
        jsr     OCToggleAndResetCopTimer
        cli
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

IC2I:
        ldd     TIC2_Counter_IC2_Speedometer
        lsld
        std     Temp5_t3
        jsr     sub_EB0F
        beq     loc_EA41
        fdiv
        jsr     sub_EB0F
        beq     loc_EA41
        fdiv
        jsr     sub_EB0F
        beq     loc_EA41
        jmp     loc_EAFC

loc_EA41:
        ldd     <Counter_SpeedSensorInterrupt_HB
        addd    #1
        std     <Counter_SpeedSensorInterrupt_HB
        bne     loc_EA4D
        bset    <IPL1 $80

loc_EA4D:
        ldaa    <Counter_SpeedSensorInterrupt_HB_X
        inca
        beq     loc_EA54
        staa    <Counter_SpeedSensorInterrupt_HB_X

loc_EA54:
        ldd     <VehicleSpeed_HB
        subd    #$500
        ldaa    <BitFlags24
        bcc     loc_EA7E
        bita    #$10
        bne     loc_EA65
        oraa    #$10
        bra     loc_EA85

loc_EA65:
        anda    #$1F
        oraa    #8
        staa    <BitFlags24
        clra
        staa    CruiseControlVar4
        staa    Counter_SomethingWithDistributor
        staa    <Counter_TimerRegHalfOverflowBetweenSpeedoPulses
        ldd     <VehicleSpeed_HB
        addd    #$53
        std     <VehicleSpeed_HB
        jmp     loc_EAFC

loc_EA7E:
        bita    #$10
        beq     loc_EA85
        jmp     loc_EB02

loc_EA85:
        adda    #$20
        bcs     loc_EA8F
        anda    #$EF
        staa    <BitFlags24
        bra     loc_EAFC

loc_EA8F:
        staa    <BitFlags24
        ldab    CruiseControlVar4
        beq     loc_EAB5
        bita    #8
        bne     loc_EAB5
        ldaa    #$3A
        mul
        adca    #0
        cmpa    #3
        bcc     loc_EAA5
        ldaa    #3

loc_EAA5:
        tab
        ldaa    Counter_SomethingWithDistributor
        suba    CruiseControlVar4
        bcc     loc_EAAF
        nega

loc_EAAF:
        sba
        bcs     loc_EABB
        bset    <BitFlags24 8

loc_EAB5:
        ldab    Counter_SomethingWithDistributor
        stab    CruiseControlVar4

loc_EABB:
        clra
        staa    Counter_SomethingWithDistributor
        ldd     Temp5_t3
        ldx     #$3C
        ldy     #$6490
        jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM
        ldaa    <Counter_TimerRegHalfOverflowBetweenSpeedoPulses
        lsra
        tab
        oraa    <TimerOverflowsBetweenSpeedoPulses
        beq     loc_EADD
        stab    <TimerOverflowsBetweenSpeedoPulses
        ldd     Temp5_t3
        subd    <PreviousVehicleSpeed_HB
        bra     loc_EAF2

loc_EADD:
        ldd     Temp5_t3
        subd    <PreviousVehicleSpeed_HB
        subd    <SpeedoSensorPulsewidth_HB
        beq     loc_EAF4
        asra
        rorb
        asra
        rorb
        subd    #0
        bne     loc_EAF0
        incb

loc_EAF0:
        addd    <SpeedoSensorPulsewidth_HB

loc_EAF2:
        std     <SpeedoSensorPulsewidth_HB

loc_EAF4:
        ldd     Temp5_t3
        std     <PreviousVehicleSpeed_HB
        clra
        staa    <Counter_TimerRegHalfOverflowBetweenSpeedoPulses

loc_EAFC:
        ldaa    #2
        staa    TFLG1_TimerInterruptFlag1
        rti

loc_EB02:
        anda    #$EF
        staa    <BitFlags24
        ldaa    #1
        staa    <TimerOverflowsBetweenSpeedoPulses
        ldd     #$5F90
        bra     loc_EAF2

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_EB0F:
        ldaa    TCTL2_TimerControlReg2
        lsra
        eora    PORTA_PortA
        bita    #2
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

OC1I:
        bsr     sub_EB1C
        rti

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_EB1C:
        ldaa    #$80
        staa    TFLG1_TimerInterruptFlag1
        ldaa    #$10
        staa    ADCTL_A2DControlReg
        ldd     TOC1_Counter_OC1
        addd    #$1E0
        cpd     TCNT_Counter_FreeRunning16bit
        bmi     loc_EB43
        subd    #$89
        cpd     TCNT_Counter_FreeRunning16bit
        bpl     loc_EB3E
        addd    #$89

loc_EB3E:
        addd    #$89
        bra     loc_EB49

loc_EB43:
        ldd     TCNT_Counter_FreeRunning16bit
        addd    #$1E0

loc_EB49:
        std     TOC1_Counter_OC1
        ldaa    TMSK1_TimerInterruptMask1
        anda    #$7F
        staa    TMSK1_TimerInterruptMask1
        inc     Timer_AlternatorDutyCycle
        ldx     #$6400
        ldaa    <ATMOffset
        cmpa    #$D
        bne     loc_EB63
        jmp     loc_EBF1

loc_EB63:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_EB63
        jsr     ReadA2DBattVolts
        staa    <BatteryVoltsRaw
        cli
        cmpa    <BatteryVolts
        bcc     loc_EB74
        staa    <BatteryVolts

loc_EB74:
        ldaa    <EngineRpm_HB
        cmpa    #$C
        bcs     loc_EB82
        cmpa    #$10
        bcc     loc_EB87
        brset   <BitFlags24 1 loc_EB87

loc_EB82:
        bclr    <BitFlags24 1
        bra     loc_EBEA

loc_EB87:
        bset    <BitFlags24 1
        ldaa    <BatteryVoltsRaw
        cmpa    #$41
        bcc     loc_EB96
        ldab    <Counter_MainLoop
        bitb    #6
        bne     loc_EBEA

loc_EB96:
        brclr   <BitFlags21 $10 loc_EBB1
        ldaa    <A2DResults2Temp
        bne     loc_EBA2
        ldaa    <BatteryVoltsRaw
        staa    <A2DResults2Temp

loc_EBA2:
        suba    <BatteryVoltsRaw
        bls     loc_EBEA
        cmpa    byte_8A50
        bls     loc_EBEA
        bset    <BitFlags21 $20
        bclr    <BitFlags21 $10

loc_EBB1:
        clr     A2DResults2Temp
        ldaa    <BatteryVoltsRaw
        suba    <TargetBatteryVolts
        bne     loc_EBC0
        brclr   0,x 4 loc_EBE1
        bra     loc_EBEA

loc_EBC0:
        ldab    #7
        bcc     loc_EBD4
        nega
        cmpa    #2
        beq     loc_EBCD
        bcc     loc_EBE1
        ldab    #3

loc_EBCD:
        andb    Timer_AlternatorDutyCycle
        beq     loc_EBEA
        bra     loc_EBE1

loc_EBD4:
        cmpa    #2
        beq     loc_EBDC
        bcc     loc_EBEA
        ldab    #3

loc_EBDC:
        andb    Timer_AlternatorDutyCycle
        bne     loc_EBEA

loc_EBE1:
        sei
        bset    0,x 4
        bset    <BitFlags24 2
        bra     loc_EBF1

loc_EBEA:
        sei
        bclr    0,x 4
        bclr    <BitFlags24 2

loc_EBF1:
        bset    2,x 4
        ldaa    #$14

loc_EBF6:
        deca
        bne     loc_EBF6
        bclr    2,x 4
        cli
        ldaa    Timer_AlternatorDutyCycle
        lsra
        bcs     loc_EC7F
        ldab    <BitFlags36_t3
        bitb    #$40
        bne     loc_EC18
        lsra
        bcs     loc_EC7F
        ldaa    <EngineRpm_HB
        cmpa    #$5E
        bcs     loc_EC18
        ldaa    <CurrentAisPosition
        cmpa    <DesiredNewAisPosition
        beq     loc_EC7F

loc_EC18:
        ldaa    <BatteryVolts
        cmpa    byte_86B6
        bcs     loc_EC7F
        sei
        ldaa    <PIA3_Buffer_t3
        oraa    #1
        staa    PIA3_Buffer_2_t3
        anda    #$FE
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        ldab    <CurrentAisPosition
        brclr   <BitFlags36_t3 $40 loc_EC3E
        ldaa    #1
        tstb
        bne     loc_EC46
        bclr    <BitFlags36_t3 $40
        bra     loc_EC4E

loc_EC3E:
        ldaa    #1
        cmpb    <DesiredNewAisPosition
        beq     loc_EC4E
        bcs     loc_EC47

loc_EC46:
        nega

loc_EC47:
        tab
        adda    <CurrentAisPosition
        staa    <CurrentAisPosition
        bra     loc_EC4F

loc_EC4E:
        clrb

loc_EC4F:
        ldx     #$E518
        addb    <BitFlags_36_t3
        andb    #3
        stab    <BitFlags_36_t3
        abx
        ldab    0,x
        tba
        comb
        aslb
        aslb
        aslb
        aslb
        anda    #$F
        aba
        ldx     #$1008
        sei
        bclr    0,x $20
        cmpa    SPSR_SerialPeripheralStatus
        staa    SPDR_SerialPeripheralDataIO
        ldaa    <PIA3_Buffer_t3
        oraa    #1
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        mul
        bset    0,x $20
        cli

loc_EC7F:
        brclr   <DRBSerialMode $80 loc_ECE9
        ldaa    SCSR_SerialStatus
        bita    #$E
        psha
        pula
        beq     loc_EC91
        ldab    SCDR_SerialData
        bra     loc_ECE9

loc_EC91:
        bita    #$20
        beq     loc_ECE9
        ldab    SCDR_SerialData
        cmpb    #$F2
        bne     loc_ECA4

loc_EC9C:
        bclr    <BitFlags21 $40
        bclr    <BitFlags2f $80
        bra     loc_ECE6

loc_ECA4:
        cmpb    #$F4
        bne     loc_ECB0
        bset    <BitFlags2f $80
        bclr    <BitFlags21 $40
        bra     loc_ECE6

loc_ECB0:
        cmpb    #$F6
        bne     loc_ECBC
        bset    <BitFlags21 $40
        bclr    <BitFlags2f $80
        bra     loc_ECE6

loc_ECBC:
        cmpb    #$FE
        bne     loc_ECC5
        bclr    <DRBSerialMode $B0
        bra     loc_EC9C

loc_ECC5:
        brset   <BitFlags21 $40 loc_ECD5
        brset   <BitFlags2f $80 loc_ECDD
        ldx     #0
        abx
        ldab    0,x
        bra     loc_ECE6

loc_ECD5:
        ldx     #$6480
        abx
        ldab    0,x
        bra     loc_ECE6

loc_ECDD:
        ldx     #$ED05
        aslb
        abx
        ldx     0,x
        ldab    0,x

loc_ECE6:
        stab    SCDR_SerialData

loc_ECE9:
        sei

loc_ECEA:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_ECEA
        ldaa    ADR1_A2DResults1
        cmpa    <MapVolts_X
        bcs     loc_ECF8
        staa    <MapVolts_X

loc_ECF8:
        cmpa    <MapValue3
        bcc     loc_ECFE
        staa    <MapValue3

loc_ECFE:
        ldaa    #$80
        oraa    TMSK1_TimerInterruptMask1
        staa    TMSK1_TimerInterruptMask1
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fdb ErrorBitRegisterStored3
        fdb ErrorBitRegister0
        fdb ErrorCodeUpdateKeyOnCount
        fdb ErrorCodeUpdateKeyOnCount2
        fdb ErrorCodeUpdateKeyOnCount3
        fdb ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
        fdb ClearTheErrorTimer_0
        fdb ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB
        fdb ClearTheErrorTimer_1
        fdb EngineRpm_HB
        fdb EngineRpm_LB
        fdb VehicleSpeed_HB
        fdb VehicleSpeed_LB
        fdb StartupSwitchMirror1
        fdb BatteryVolts
        fdb CoolantVoltsTmp2
        fdb AmbientAirTempVolts2
        fdb LastTpsVolts
        fdb LowestSessionTpsVolts
        fdb TpsVolts
        fdb LastCoolantTempVolts
        fdb CoolantTemp
        fdb MapValue_t3
        fdb MapValue
        fdb BaroPressure
        fdb MapVolts
        fdb O2SensorVolts
        fcb $FF
        fcb $FF
        fdb LastChargeTempVolts
        fdb ChargeTempVolts
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fdb InjectorPulsewidth_HB
        fdb InjectorPulsewidth_LB
        fdb InjectorPulsewidth_HB
        fdb InjectorPulsewidth_LB
        fdb Ram_0B
        fcb $FF
        fcb $FF
        fdb ValueFromAdaptiveMemory
        fcb $FF
        fcb $FF
        fdb AdvanceTemporary
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fdb TargetIdleSpeedHB
        fdb TargetIdleSpeedLB
        fdb DesiredNewAisPosition
        fcb $FF
        fcb $FF
        fcb $FF
        fcb $FF
        fdb TargetBatteryVolts
        fdb CruiseSpeedSetpoint
        fdb PIA1_Buffer_t3
        fdb PIA2_Buffer_t3
        fdb CurrentAisPosition
        fdb Counter_Cruise_1
        fdb CCDFlags5
        fdb BitFlags_BF_t3
        fdb BitFlags29

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_ED8B:
        ldd     #$8EFF
        stab    TFLG1_TimerInterruptFlag1
        staa    TMSK1_TimerInterruptMask1
        stab    TFLG2_TimerInterruptFlag2
        clr     PACNT_PulseAccumulatorCounter

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_ED9A:
        ldab    #1
        ldaa    SwitchPortAccessReg2
        bita    #1
        beq     loc_EDA5
        ldab    #0

loc_EDA5:
        stab    PIA_Ctrl_2
        anda    #1
        eora    SwitchPortAccessReg2
        bita    #1
        beq     loc_EDBF
        ldaa    SwitchPortAccessReg2
        ldab    #1
        bita    #1
        beq     loc_EDBC
        ldab    #0

loc_EDBC:
        stab    PIA_Ctrl_2

loc_EDBF:
        ldd     #$1FB
        stab    PIA_Ctrl_4
        staa    PIA_Ctrl_3
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

sub_EDC9:
        ldx     #$1000
        brset   9,x $3A loc_EDD3
        bset    9,x $3A

loc_EDD3:
        brclr   9,x 5 loc_EDDA
        bclr    9,x 5

loc_EDDA:
        brclr   $C,x $F8 loc_EDE1
        bclr    $C,x $FF

loc_EDE1:
        brclr   $D,x $F8 loc_EDE8
        bclr    $D,x $FF

loc_EDE8:
        brset   $20,x $A2 loc_EDEF
        bset    $20,x $A2

loc_EDEF:
        brclr   $20,x $C loc_EDF6
        bclr    $20,x $C

loc_EDF6:
        brset   $21,x $1A loc_EDFD
        bset    $21,x $1A

loc_EDFD:
        brclr   $21,x $25 loc_EE04
        bclr    $21,x $25

loc_EE04:
        brset   $22,x $8E loc_EE0B
        bset    $22,x $8E

loc_EE0B:
        brclr   $22,x $61 loc_EE12
        bclr    $22,x $61

loc_EE12:
        brclr   $24,x $F0 loc_EE19
        bclr    $24,x $F0

loc_EE19:
        brset   $26,x $70 loc_EE20
        bset    $26,x $70

loc_EE20:
        brclr   $26,x $80 loc_EE27
        bclr    $26,x $80

loc_EE27:
        brset   $28,x $54 loc_EE2E
        bset    $28,x $54

loc_EE2E:
        brclr   $28,x $AB loc_EE35
        bclr    $28,x $AB

loc_EE35:
        brclr   $2C,x $18 loc_EE3C
        bclr    $2C,x $18

loc_EE3C:
        brset   $2D,x $C loc_EE43
        bset    $2D,x $C

loc_EE43:
        brclr   $2D,x $F3 loc_EE4A
        bclr    $2D,x $F3

loc_EE4A:
        brset   $39,x $88 loc_EE51
        bset    $39,x $88

loc_EE51:
        brclr   $39,x $40 loc_EE58
        bclr    $39,x $40

loc_EE58:
        brset   $3C,x $F loc_EE61
        sei
        bset    $3C,x $F
        cli


loc_EE61:
        ldx     #$6400
        sei
        ldaa    TL_IDENT1
        cmpa    #$11
        beq     loc_EE7C
        brclr   2,x $70 loc_EE73
        bclr    2,x $70

loc_EE73:
        brset   2,x $83 loc_EE8A
        bset    2,x $83
        bra     loc_EE8A

loc_EE7C:
        brclr   2,x $F0 loc_EE83
        bclr    2,x $F0

loc_EE83:
        brset   2,x 3 loc_EE8A
        bset    2,x 3

loc_EE8A:
        cli
        brclr   3,x $FE loc_EE92
        bclr    3,x $FE

loc_EE92:
        brclr   4,x $FE loc_EE99
        bclr    4,x $FE

loc_EE99:
        brset   6,x $F8 loc_EEA0
        bset    6,x $F8

loc_EEA0:
        brclr   6,x 6 locret_EEA7
        bclr    6,x 6

locret_EEA7:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

gw_EDA9:    fdb $4614
            fdb $3D15
            fdb $4513
lb800_t3:   fdb $3D14
            fdb $1513

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

VerifyOperationOfFuelInjectorDrivers_MM:
        ldaa    <EngineRpm_HB
        cmpa    #$5E
        bcc     loc_EF26
        ldaa    <BatteryVolts
        cmpa    #$C3
        bcs     loc_EF26
        ldaa    SwitchPortAccessReg1
        bita    #$10
        beq     loc_EF26
        brset   <PIA2_Buffer_t3 $10 loc_EF26
        bita    #$40
        bne     loc_EF26
        brset   <b5d_IPL2 $20 loc_EF26
        sei
        ldaa    SwitchPortAccessReg2
        anda    #$F0
        bne     loc_EF29
        brset   <BitFlags27 $80 loc_EEE4
        ldaa    PORTA_PortA
        bita    #$60
        bne     loc_EF29

loc_EEE4:
        brclr   <BitFlags21 $80 loc_EF29
        ldab    #7

loc_EEEA:
        decb
        bne     loc_EEEA
        ldaa    PIA_Ctrl_4
        bita    #4
        bne     loc_EF21
        ldaa    <BitFlags_BF_t3
        ldab    <CylinderPointer
        cli
        ldx     #lb800_t3
        brset   <BitFlags27 $80 loc_EF03
        ldx     #gw_EDA9

loc_EF03:
        cmpa    #$84
        bne     loc_EF12
        decb
        bpl     loc_EF12
        ldab    #3
        brset   <BitFlags27 $80 loc_EF12
        ldab    #5

loc_EF12:
        andb    #7
        abx
        ldaa    0,x
        ldab    #$90
        jsr     ThrowNonCriticalError_
        bcc     loc_EF21
        bset    <b5d_IPL2 $20
loc_EF21:
        ldab    #4
        stab    PIA_Ctrl_4

loc_EF26:
        bclr    <BitFlags21 $80

loc_EF29:
        cli
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

CrankPickupIntrAddressTable:
        fdb CrankInterrupt_FallingEdge
        fdb CrankInterrupt_HandleCamSensorRisingEdgeA
        fdb CrankInterrupt_HandleCamSensorRisingEdgeB
        fdb CrankInterrupt_CalculateFuel

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

IC1I:
        ldd     #$510
        staa    TFLG1_TimerInterruptFlag1
        stab    ADCTL_A2DControlReg
        ldx     <EngineRpm_HB
        cpx     #$BB80
        bcc     loc_EF63
        ldx     TIC1_Counter_IC1_CamSensor
        ldab    #$C
        abx
        ldaa    #4

loc_EF4B:
        bita    PORTA_PortA
        beq     loc_EF60
        cpx     TCNT_Counter_FreeRunning16bit
        bpl     loc_EF4B
        ldd     #$510
        staa    TFLG1_TimerInterruptFlag1
        stab    ADCTL_A2DControlReg
        bra     loc_EF63

loc_EF60:
        jmp     loc_F723

loc_EF63:
        brclr   <Ram_EC $40 loc_EF75
        ldaa    SwitchPortAccessReg2
        bita    #$80
        bne     loc_EF75
        brset   <Ram_EC $F loc_EF75
        inc     Ram_EC

loc_EF75:
        ldab    CountdownTimerFromKeyOn
        bne     loc_EF7D
        bclr    <Ram_05 1

loc_EF7D:
        clr     ATMOffset
        ldaa    <DRBPointer1
        cmpa    #$A
        bne     loc_EF8C
        clr     DRBPointer1
        bclr    <DRBSerialMode $30

loc_EF8C:
        ldab    <BitFlags_BF_t3
        bpl     loc_EFB7
        ldaa    <Ram_F4
        inca
        beq     loc_EFA0
        cmpa    #$FF
        bne     loc_EF9E
        ldab    #1
        stab    PIA_Ctrl_4

loc_EF9E:
        staa    <Ram_F4

loc_EFA0:
        ldab    <BitFlags_BF_t3
        bitb    #4
        beq     loc_EFA8
        andb    #$F8

loc_EFA8:
        incb
        stab    <BitFlags_BF_t3
        andb    #7
        decb
        aslb
        ldx     #$EF2B
        abx
        ldx     0,x
        jmp     0,x

loc_EFB7:
        ldaa    UNe_64B9
        tab
        anda    #$E0
        andb    #$1F
        cmpb    #$1F
        beq     loc_EFC4
        incb

loc_EFC4:
        aba
        staa    UNe_64B9
        jsr     sub_ED9A
        jmp     loc_F723

CrankInterrupt_FallingEdge:
        brset   <PIA3_Buffer_t3 $40 loc_EFE3
        jsr     DwellTimerOC4Interrupt
        ldd     #$FFFF
        addd    TCNT_Counter_FreeRunning16bit
        std     TOC4_Counter_OC4
        ldaa    #$10
        staa    TFLG1_TimerInterruptFlag1

loc_EFE3:
        brset   <BitFlags27 $80 loc_EFFB
        brclr   <BitFlags27 $40 loc_F00F
        ldaa    <CylinderPointer
        beq     loc_F00F
        cmpa    #3
        beq     loc_F00F
        cmpa    #1
        beq     loc_F006
        cmpa    #4
        beq     loc_F006

loc_EFFB:
        ldaa    <PIA3_Buffer_t3
        anda    #$FD
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        bra     loc_F00F

loc_F006:
        ldaa    <PIA3_Buffer_t3
        oraa    #2
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3

loc_F00F:
        ldd     TIC1_Counter_IC1_CamSensor
        ldx     #$34
        ldy     #$6490
        jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM
        ldaa    <Counter_TimerPastHalfwayBetweenCamPulses
        lsra
        staa    <TimerOverflowsBetweenCamPulses
        ldd     TIC1_Counter_IC1_CamSensor
        subd    <LastCamFallingEdgeTime
        std     <DistributorFallingEdgePulsewidth_HB
        ldd     TIC1_Counter_IC1_CamSensor
        std     <LastCamFallingEdgeTime
        clr     Counter_TimerPastHalfwayBetweenCamPulses
        ldaa    CalculatedDwellTime
        clrb
        lsrd
        lsrd
        lsrd
        std     AntiDwellTime_HB
        ldd     <DistributorFallingEdgePulsewidth_HB
        subd    #$C8
        cpd     AntiDwellTime_HB
        bcs     loc_F048
        ldd     AntiDwellTime_HB

loc_F048:
        std     AntiDwellTime_HB
        ldaa    <TimerOverflowsBetweenCamPulses
        bne     loc_F08D
        ldx     #$6400
        ldd     word_82B1
        cpd     <DistributorFallingEdgePulsewidth_HB
        bcs     loc_F08D
        brset   <IPL1 $40 loc_F09C
        brclr   <BitFlags23 $80 loc_F06A
        brset   0,x $20 loc_F06A
        ldaa    <Ram_7F
        beq     loc_F072

loc_F06A:
        ldd     word_82AF
        cpd     <DistributorFallingEdgePulsewidth_HB
        bcs     loc_F08D

loc_F072:
        bset    <IPL1 $40
        ldd     #0
        std     <KeyOnOrEngineRunningTime
        staa    <ATMOffset
        bset    <Ram_80 $FF
        jsr     sub_C49A
        jsr     sub_C4CE
        jsr     sub_C674
        jsr     sub_C726
        bra     loc_F09C

loc_F08D:
        brclr   <IPL1 $40 loc_F094
        clr     CounterUp_UsedInCalcFuel

loc_F094:
        bclr    <IPL1 $40
        ldaa    byte_8654
        staa    <Counter_C

loc_F09C:
        ldaa    <TimerOverflowsBetweenCamPulses
        bne     loc_F0DB
        ldx     #$6400
        ldd     word_807C
        cpd     <DistributorFallingEdgePulsewidth_HB
        bcs     loc_F0DB
        brset   <IPL1 1 loc_F0FE
        brclr   <BitFlags23 $80 loc_F0BB
        brset   0,x $20 loc_F0BB
        ldaa    <Ram_7F
        beq     loc_F0C3

loc_F0BB:
        ldd     word_807A
        cpd     <DistributorFallingEdgePulsewidth_HB
        bcs     loc_F0DB

loc_F0C3:
        ldaa    TMSK1_TimerInterruptMask1
        oraa    #$10
        staa    TMSK1_TimerInterruptMask1
        ldd     #$FFFF
        addd    TCNT_Counter_FreeRunning16bit
        std     TOC4_Counter_OC4
        ldaa    #$10
        staa    TFLG1_TimerInterruptFlag1
        bra     loc_F0FE

loc_F0DB:
        bclr    <IPL1 1
        bset    <BitFlags2D $80
        ldaa    #8
        staa    <Ram_4D
        staa    <CalculatedSparkAdvance
        ldaa    TMSK1_TimerInterruptMask1
        anda    #$EF
        staa    TMSK1_TimerInterruptMask1
        ldaa    <PIA3_Buffer_t3
        oraa    #$40
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        bset    <IPL1 2
        jmp     loc_F1E0

loc_F0FE:
        brclr   <BitFlags2D $80 loc_F10D
        ldaa    <Ram_4D
        adda    byte_807F
        bpl loc_F10B
        ldaa    #$7F

loc_F10B:
        staa    <Ram_4D

loc_F10D:
        brset   <BitFlags27 $80 loc_F148
        brclr   <IPL1 1 loc_F124
        ldab    <EngineRpm_HB
        cmpb    #$1F
        bcs     loc_F124
        ldaa    <CalculatedSparkAdvance
        cmpa    #$50
        bcs     loc_F124
        jmp     loc_F1E0

loc_F124:
        ldaa    <AdvanceTemporary
        brclr   <BitFlags2D $80 loc_F135
        cmpa    <Ram_4D
        bls     loc_F132
        ldaa    <Ram_4D
        bra     loc_F135

loc_F132:
        bclr    <BitFlags2D $80

loc_F135:
        staa    <CalculatedSparkAdvance
        bset    <IPL1 1
        ldaa    #$80
        suba    <CalculatedSparkAdvance
        psha
        ldab    #$11
        mul
        adca    #0
        pulb
        aba
        bra     loc_F17A

loc_F148:
        brclr   <IPL1 1 loc_F15B
        ldab    <EngineRpm_HB
        cmpb    #$1F
        bcs     loc_F15B
        ldaa    <CalculatedSparkAdvance
        cmpa    #$50
        bcs     loc_F15B
        jmp     loc_F1E0

loc_F15B:
        ldaa    <AdvanceTemporary
        brclr   <BitFlags2D $80 loc_F16C
        cmpa    <Ram_4D
        bls     loc_F169
        ldaa    <Ram_4D
        bra     loc_F16C

loc_F169:
        bclr    <BitFlags2D $80

loc_F16C:
        staa    <CalculatedSparkAdvance
        bset    <IPL1 1
        ldaa    #$80
        suba    <CalculatedSparkAdvance
        ldab    #$B6
        mul
        adca    #0

loc_F17A:
        psha
        ldab    <DistributorFallingEdgePulsewidth_HB
        mul
        std     Temp5_t3
        pula
        ldab    <DistributorFallingEdgePulsewidth_LB
        mul
        adca    #0
        tab
        clra
        addd    Temp5_t3
        addd    <LastCamFallingEdgeTime
        subd    #$A
        std     Temp5_t3
        bset    <IPL1 2
        ldx     #$1020
        subd    AntiDwellTime_HB
        std     DoubleTempB
        subd    TCNT_Counter_FreeRunning16bit
        bmi     loc_F1B2
        cpd     #$20
        bmi     loc_F1B2
        ldaa    PORTA_PortA
        bita    #8
        beq     loc_F1CA

loc_F1B2:
        bset    0,x 3
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     Temp5_t3
        std     TOC5_Counter_OC5_Dwell
        bclr    0,x 1
        ldaa    #8
        staa    TFLG1_TimerInterruptFlag1
        bra     loc_F1E0

loc_F1CA:
        bclr    0,x 1
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     DoubleTempB
        std     TOC5_Counter_OC5_Dwell
        bset    0,x 3
        ldaa    #8
        staa    TFLG1_TimerInterruptFlag1

loc_F1E0:
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #8
        beq     loc_F1EA
        jsr     Interrupt_DwellTimer

loc_F1EA:
        brset   <IPL1 4 loc_F1F3
        jsr     sub_C75D
        bra     loc_F239

loc_F1F3:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_F1F3
        ldaa    ADR1_A2DResults1
        ldab    <EngineRpm_HB
        cmpb    #$2F
        bcc     loc_F20F
        cmpb    #$D
        bcs     loc_F20F
        cmpa    byte_8A66
        bcc     loc_F213
        cmpa    byte_8A65
        bcs     loc_F213

loc_F20F:
        brclr   <b5C_IPL1_t3 $88 loc_F216

loc_F213:
        jsr     loc_D7BF

loc_F216:
        jsr     ConvertMAPVoltsToValue
        tab
        stab    MapValue_t3
        bra     loc_F239

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fdb InjectorPulsewidth_HB_Cyl1
        fdb InjectorPulsewidth_HB_Cyl3
        fdb InjectorPulsewidth_HB_Cyl4
        fdb InjectorPulsewidth_HB_Cyl2
        fdb TOC3_Counter_OC3
        fdb InjectorPulsewidth_HB_Cyl3
        fdb InjectorPulsewidth_HB_Cyl1
        fdb InjectorPulsewidth_HB_Cyl4
        fdb TOC2_Counter_OC2
        fdb InjectorPulsewidth_HB_Cyl2

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

ToggleOC3:                      fcb $10
ToggleOC3_ForceCompare:         fcb $20
SetOC2ClrOC3SetOC4SetOC5:       fcb $EF
ToggleOC2:                      fcb $40
ToggleOC2_ForceCompare:         fcb $40
ClrOC2SetOC3SetOC4SetOC5:       fcb $BF

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

loc_F239:
        brclr   <Ram_EC $80 loc_F250
        brclr   <Ram_EC $10 loc_F24A
        ldaa    <Ram_EC
        bita    #$F
        beq     loc_F24D
        deca
        staa    <Ram_EC

loc_F24A:
        jmp locret_F2C8

loc_F24D:
        bclr    <Ram_EC $80

loc_F250:
        ldd     <InjectorPulsewidth_HB
        beq     locret_F2C8
        brset   <BitFlags2f 4 locret_F2C8
        brclr   <BitFlags2c 3 loc_F25E
        bra     locret_F2C8

loc_F25E:
        ldx     #$F21F
        brset   <BitFlags27 $80 loc_F268
        ldx     #$F227

loc_F268:
        ldab    <CylinderPointer
        aslb
        abx
        ldx     0,x
        ldy     #$F233
        cpx     #$101A
        beq     loc_F28F
        ldy     #$F236
        cpx     #$1018
        beq     loc_F28F
        ldd     <InjectorPulsewidth_HB
        std     0,x
        cpd     #$7F
        bcs     loc_F28D
        bset    <BitFlags21 $80

loc_F28D:
        bra     loc_F2B4

loc_F28F:
        ldd     0,y
        oraa    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1
        stab    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    <InjectorPulsewidth_HB
        std     0,x
        cpd     #$7F
        bcs     loc_F2AB
        bset    <BitFlags21 $80

loc_F2AB:
        ldaa    2,y
        anda    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1

loc_F2B4:
        ldd     <InjectorPulsewidth_HB
        lsrd
        lsrd
        addd    <CCDFuelOutput_HB
        bcc     loc_F2BF
        ldd     #$FFFF

loc_F2BF:
        std     <CCDFuelOutput_HB
        ldaa    <Counter_InjectorCalc
        inca
        beq     locret_F2C8
        staa    <Counter_InjectorCalc

locret_F2C8:
        rti

loc_F2C9:
        jmp     loc_F3B8

CrankInterrupt_HandleCamSensorRisingEdgeA:
        ldd     TIC1_Counter_IC1_CamSensor
        std     L00F5_t3
        brclr   <IPL1 1 loc_F306
        ldaa    <EngineRpm_HB
        cmpa    #$5E
        bcc     loc_F2C9
        ldd     L00F5_t3
        brclr   <IPL1 2 loc_F2C9
        subd    <LastCamFallingEdgeTime
        lsld
        lsld
        xgdy
        ldaa    #$58
        suba    <CalculatedSparkAdvance
        ble     loc_F2C9
        ldab    #$CD
        mul
        lsld
        aslb
        adca    #0
        jsr     ScaleYbyA
        xgdy
        addd    TIC1_Counter_IC1_CamSensor
        subd    #$A
        std     Temp5_t3
        bra     loc_F315

loc_F306:
        ldd     #$308
        oraa    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1
        stab    TFLG1_TimerInterruptFlag1
        jmp     loc_F3AA

loc_F315:
        ldaa    PORTA_PortA
        bita    #8
        bne     loc_F350
        ldaa    TCTL1_TimerControlReg1
        bita    #1
        bne     loc_F326
        jmp     loc_F3B8

loc_F326:
        ldd     Temp5_t3
        subd    AntiDwellTime_HB
        std     TOC5_Counter_OC5_Dwell
        ldab    TCTL1_TimerControlReg1
        orab    #3
        stab    TCTL1_TimerControlReg1
        ldd     TOC5_Counter_OC5_Dwell
        subd    #$40
        subd    TCNT_Counter_FreeRunning16bit
        bpl     loc_F3B8
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    AntiDwellTime_HB
        std     Temp5_t3

loc_F350:
        ldaa    TCTL1_TimerControlReg1
        bita    #1
        beq     loc_F372
        ldaa    <CalculatedSparkAdvance
        cmpa    #$28
        bcs     loc_F3B8
        ldd     TOC5_Counter_OC5_Dwell
        addd    AntiDwellTime_HB
        std     TOC5_Counter_OC5_Dwell
        ldd     #$FE08
        anda    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1
        stab    TFLG1_TimerInterruptFlag1

loc_F372:
        ldaa    <CalculatedSparkAdvance
        cmpa    #$28
        bcc     loc_F38D
        ldaa    TCTL1_TimerControlReg1
        oraa    #3
        staa    TCTL1_TimerControlReg1
        ldd     TCNT_Counter_FreeRunning16bit
        std     TOC5_Counter_OC5_Dwell
        ldaa    #8
        staa    TFLG1_TimerInterruptFlag1
        bra     loc_F3B8

loc_F38D:
        ldd     Temp5_t3
        subd    TOC5_Counter_OC5_Dwell
        cpd     #$10
        bcs     loc_F39F
        ldd     Temp5_t3
        std     TOC5_Counter_OC5_Dwell

loc_F39F:
        ldd     TOC5_Counter_OC5_Dwell
        subd    TCNT_Counter_FreeRunning16bit
        bpl     loc_F3B8
        bclr    <IPL1 2

loc_F3AA:
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    #4
        std     TOC5_Counter_OC5_Dwell

loc_F3B8:
        ldaa    SparkScatter
        adda    SparkScatterIncrement
        bvc     loc_F3E8
        brclr   <BitFlags68_t3 4 loc_F3E7
        ldab    <DesiredNewAisPosition
        cmpb    <CurrentAisPosition
        bne     loc_F3E7
        ldab    byte_869A
        beq     loc_F3E7
        tsta
        bmi     loc_F3DA
        ldaa    <DesiredNewAisPosition
        sba
        bcc     loc_F3E5
        clra
        bra     loc_F3E5

loc_F3DA:
        ldaa    byte_87A8
        addb    <DesiredNewAisPosition
        bcs     loc_F3E5
        cba
        bls     loc_F3E5
        tba

loc_F3E5:
        staa    <DesiredNewAisPosition

loc_F3E7:
        clra

loc_F3E8:
        staa    SparkScatterIncrement
        rti

loc_F3EC:
        jmp loc_F4AD

CrankInterrupt_HandleCamSensorRisingEdgeB:
        ldd     TIC1_Counter_IC1_CamSensor
        std     Counter_IC1_Temp
        ldaa    <EngineRpm_HB
        cmpa    #$5E
        bcc     loc_F3EC
        brclr   <IPL1 2 loc_F3EC
        ldd     TIC1_Counter_IC1_CamSensor
        subd    L00F5_t3
        lsld
        lsld
        xgdy
        ldaa    #$30
        suba    <CalculatedSparkAdvance
        bcc     loc_F410
        clra

loc_F410:
        ldab    #$CD
        mul
        lsld
        aslb
        adca    #0
        jsr     ScaleYbyA
        xgdy
        addd    TIC1_Counter_IC1_CamSensor
        subd    #$A
        std     Temp5_t3
        brclr   <IPL1 1 loc_F3EC
        ldaa    PORTA_PortA
        bita    #8
        bne     loc_F466
        ldaa    TCTL1_TimerControlReg1
        bita    #1
        beq     loc_F4AD
        ldd     Temp5_t3
        subd    AntiDwellTime_HB
        std     TOC5_Counter_OC5_Dwell
        ldab    TCTL1_TimerControlReg1
        orab    #3
        stab    TCTL1_TimerControlReg1
        ldab    #8
        stab    TFLG1_TimerInterruptFlag1
        ldd     TOC5_Counter_OC5_Dwell
        subd    #$40
        subd    TCNT_Counter_FreeRunning16bit
        bpl     loc_F4AD
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    AntiDwellTime_HB
        std     Temp5_t3

loc_F466:
        ldaa    TCTL1_TimerControlReg1
        bita    #1
        beq     loc_F482
        ldd     TOC5_Counter_OC5_Dwell
        addd    AntiDwellTime_HB
        std     TOC5_Counter_OC5_Dwell
        ldd     #$FE08
        anda    TCTL1_TimerControlReg1
        staa    TCTL1_TimerControlReg1
        stab    TFLG1_TimerInterruptFlag1

loc_F482:
        ldd     Temp5_t3
        subd    TOC5_Counter_OC5_Dwell
        cpd     #$10
        bcs     loc_F494
        ldd     Temp5_t3
        std     TOC5_Counter_OC5_Dwell

loc_F494:
        ldd     TOC5_Counter_OC5_Dwell
        subd    TCNT_Counter_FreeRunning16bit
        bpl     loc_F4AD
        bclr    <IPL1 2
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     TCNT_Counter_FreeRunning16bit
        addd    #4
        std     TOC5_Counter_OC5_Dwell

loc_F4AD:
        ldaa    <EngineRpm_HB
        cmpa    #$6D
        bcc     loc_F4C4
        cmpa    #$6A
        bcc     loc_F4BA
        bclr    <IPL1 4

loc_F4BA:
        jsr     sub_E6AA
        std     <EngineRpm_HB
        jsr     sub_E721
        bra     loc_F4C7

loc_F4C4:
        bset    <IPL1 4

loc_F4C7:
        clra
        brclr   <BitFlags66_t3 $40 loc_F4D1
        ldaa    <CounterUp_42
        inca
        beq     loc_F4D3

loc_F4D1:
        staa    <CounterUp_42

loc_F4D3:
        ldaa    <CounterUp_42
        cmpa    byte_81BB
        bcs     loc_F4DF
        bset    <IPL1 $10
        bra     loc_F4E2

loc_F4DF:
        bclr    <IPL1 $10

loc_F4E2:
        ldaa    <CounterDn_ba_o2
        beq     loc_F4E9
        deca
        staa    <CounterDn_ba_o2

loc_F4E9:
        ldaa    <CounterDn_bb_o2
        beq     loc_F4F0
        deca
        staa    <CounterDn_bb_o2

loc_F4F0:
        brset   <IPL1 $40 loc_F4FB
        ldaa    <CounterUp_UsedInCalcFuel
        inca
        beq     loc_F4FB
        staa    <CounterUp_UsedInCalcFuel

loc_F4FB:
        ldaa    <CounterDn_bc_o2
        beq     loc_F502
        deca
        staa    <CounterDn_bc_o2

loc_F502:
        ldaa    <CounterDn_b9_o2
        beq     loc_F509
        deca
        staa    <CounterDn_b9_o2

loc_F509:
        ldaa    <CounterUp_b6_o2
        inca
        beq     loc_F510
        staa    <CounterUp_b6_o2

loc_F510:
        clra
        brclr   <IPL1 1 loc_F51A
        ldaa    <CounterUp_43
        inca
        beq     loc_F51C

loc_F51A:
        staa    <CounterUp_43

loc_F51C:
        ldaa    <CounterDn_b7_o2
        beq     loc_F523
        deca
        staa    <CounterDn_b7_o2

loc_F523:
        ldaa    Counter_SomethingWithDistributor
        inca
        beq     loc_F52C
        staa    Counter_SomethingWithDistributor

loc_F52C:
        jmp *+3

locret_F52F:
        rti

CrankInterrupt_CalculateFuel:
        brset   <IPL1 1 loc_F546
        ldaa    TCTL1_TimerControlReg1
        anda    #$FE
        staa    TCTL1_TimerControlReg1
        ldaa    #8
        staa    CFORC_TimerForceCompare
        bclr    <IPL1 2
        bra     loc_F572

loc_F546:
        bra *+2

loc_F548:
        clra
        clrb
        bra     loc_F567
        ldaa    <PIA3_Buffer_t3
        anda    #$BF
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        ldd     TIC1_Counter_IC1_CamSensor
        subd    Counter_IC1_Temp
        std     DoubleTempC
        ldx     #$648F
        ldd     word_828E
        jsr     ScaleXbyB_somethingelse

loc_F567:
        addd    TIC1_Counter_IC1_CamSensor
        std     TOC4_Counter_OC4
        ldaa    #$10
        staa    TFLG1_TimerInterruptFlag1

loc_F572:
        ldaa    <CylinderPointer
        inca
        brset   <BitFlags27 $80 loc_F57D
        cmpa    #6
        bra     loc_F57F

loc_F57D:
        cmpa    #4

loc_F57F:
        bcs loc_F582
        clra

loc_F582:
        staa    <CylinderPointer
        brset   <BitFlags27 $80 loc_F5A7
        brclr   <BitFlags27 $40 loc_F5B0
        ldaa    <CylinderPointer
        beq     loc_F5A7
        cmpa    #3
        beq     loc_F5A7
        cmpa    #2
        beq     loc_F5B0
        cmpa    #5
        beq     loc_F5B0
        ldaa    <PIA3_Buffer_t3
        anda    #$FD
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3
        bra     loc_F5B0

loc_F5A7:
        ldaa    <PIA3_Buffer_t3
        oraa    #2
        staa    <PIA3_Buffer_t3
        staa    PIA3_Buffer_2_t3

loc_F5B0:
        brset   <IPL1 1 loc_F5B7
        jmp     loc_F680

loc_F5B7:
        brset   <BitFlags27 $80 loc_F5EC
        ldab    <EngineRpm_HB
        cmpb    #$1F
        bcc     loc_F5C4
        jmp     loc_F680

loc_F5C4:
        ldaa    <AdvanceTemporary
        brclr   <BitFlags2D $80 loc_F5D5
        cmpa    <Ram_4D
        bcs     loc_F5D2
        ldaa    <Ram_4D
        bra     loc_F5D5

loc_F5D2:
        bclr    <BitFlags2D $80

loc_F5D5:
        staa    <CalculatedSparkAdvance
        cmpa    #$50
        bcc     loc_F5DE
        jmp     loc_F680

loc_F5DE:
        ldaa    #$F8
        suba    <CalculatedSparkAdvance
        psha
        ldab    #$11
        mul
        adca    #0
        pulb
        aba
        bra     loc_F619

loc_F5EC:
        ldab    <EngineRpm_HB
        cmpb    #$1F
        bcs     loc_F609
        ldaa    <AdvanceTemporary
        brclr   <BitFlags2D $80 loc_F603
        cmpa    <Ram_4D
        bcs     loc_F600
        ldaa    <Ram_4D
        bra     loc_F603

loc_F600:
        bclr    <BitFlags2D $80

loc_F603:
        staa    <CalculatedSparkAdvance
        cmpa    #$50
        bcc     loc_F60C

loc_F609:
        jmp     loc_F680

loc_F60C:
        lsra
        tab
        ldaa    #$B8
        sba
        psha
        ldab    #$6C
        mul
        adca    #0
        pulb
        aba

loc_F619:
        psha
        ldab    <DistributorFallingEdgePulsewidth_HB
        mul
        std     Temp5_t3
        pula
        ldab    <DistributorFallingEdgePulsewidth_LB
        mul
        adca    #0
        tab
        clra
        addd    Temp5_t3
        addd    TIC1_Counter_IC1_CamSensor
        subd    #$A
        std     Temp5_t3
        bset    <IPL1 2
        ldx     #$1020
        subd    AntiDwellTime_HB
        std     DoubleTempB
        subd    TCNT_Counter_FreeRunning16bit
        bmi     loc_F652
        cpd     #$20
        bmi     loc_F652
        ldaa    PORTA_PortA
        bita    #8
        beq     loc_F66A

loc_F652:
        bset    0,x 3
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     Temp5_t3
        std     TOC5_Counter_OC5_Dwell
        bclr    0,x 1
        ldaa    #8
        staa    TFLG1_TimerInterruptFlag1
        bra loc_F680

loc_F66A:
        bclr    0,x 1
        ldaa    #8
        staa    CFORC_TimerForceCompare
        ldd     DoubleTempB
        std     TOC5_Counter_OC5_Dwell
        bset    0,x 3
        ldaa    #8
        staa    TFLG1_TimerInterruptFlag1

loc_F680:
        ldaa    ADCTL_A2DControlReg
        bpl     loc_F680
        ldd     ADR3_A2DResults3
        staa    <O2SensorVolts
        stab    <LastTpsVolts
        cmpb    byte_8A59
        bcs     loc_F69C
        cmpb    byte_8A5A
        bcc     loc_F69C
        brset   <b5C_IPL1_t3 $40 loc_F69C
        stab    <TpsVolts

loc_F69C:
        ldaa    ADR1_A2DResults1
        ldab    <EngineRpm_HB
        cmpb    #$2F
        bcc     loc_F6B3
        cmpb    #$D
        bcs     loc_F6B3
        cmpa    byte_8A66
        bcc     loc_F6B7
        cmpa    byte_8A65
        bcs     loc_F6B7

loc_F6B3:
        brclr   <b5C_IPL1_t3 $88 loc_F6BA

loc_F6B7:
        jsr     loc_D7BF

loc_F6BA:
        jsr     ConvertMAPVoltsToValue
        tab
        brclr   <IPL1 4 loc_F6CA
        addb    MapValue_t3
        rorb
        stab    <MapValue
        bra     loc_F6CF

loc_F6CA:
        stab    MapValue_t3
        ldab    <MapValue

loc_F6CF:
        ldaa    <BaroPressure
        sba
        bcc     loc_F6D5
        clra

loc_F6D5:
        staa    <MapVolts
        jsr     sub_D9A2
        brclr   <IPL1 $40 loc_F723
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #8
        beq     loc_F6E8
        jsr     Interrupt_DwellTimer

loc_F6E8:
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$10
        beq     loc_F6F2
        jsr     DwellTimerOC4Interrupt

loc_F6F2:
        jsr     sub_C49A
        jsr     sub_C4CE
        jsr     sub_C674
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #8
        beq     loc_F705
        jsr     Interrupt_DwellTimer

loc_F705:
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$10
        beq     loc_F70F
        jsr     DwellTimerOC4Interrupt

loc_F70F:
        jsr     sub_C726
        brclr   <IPL1 4 loc_F723
        ldaa    TFLG1_TimerInterruptFlag1
        bita    #$10
        beq     loc_F720
        jsr     DwellTimerOC4Interrupt

loc_F720:
        jsr     loc_C79F

loc_F723:
        clr     ATMOffset
        ldaa    <DRBPointer1
        cmpa    #$A
        bne     locret_F732
        clr     DRBPointer1
        bclr    <DRBSerialMode $30

locret_F732:
        rti

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

PAII:
        ldd     #$9E61
        anda    TMSK1_TimerInterruptMask1
        staa    TMSK1_TimerInterruptMask1
        stab    TFLG1_TimerInterruptFlag1
        ldd     #$FF0
        anda    TMSK2_TimerInterruptMask2
        staa    TMSK2_TimerInterruptMask2
        stab    TFLG2_TimerInterruptFlag2
        rti

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

nullsub_1:
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

OC4I:
        bsr DwellTimerOC4Interrupt
        rti

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

DwellTimerOC4Interrupt:
        ldd     #$1014
        staa    TFLG1_TimerInterruptFlag1
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

I4_I5:
        bsr     Interrupt_DwellTimer
        rti

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

Interrupt_DwellTimer:
        ldaa    #8
        staa    TFLG1_TimerInterruptFlag1
        brclr   <BitFlags_BF_t3 $80 locret_F79C
        ldab    <TimerOverflowsBetweenCamPulses
        bne     locret_F79C
        brclr   <IPL1 1 locret_F79C
        ldab    TCTL1_TimerControlReg1
        eorb    #1
        bitb    #1
        bne     loc_F778
        brclr   <IPL1 2 locret_F79C

loc_F778:
        stab    TCTL1_TimerControlReg1
        lsrb
        bcs     loc_F79D
        ldab    #1
        ldaa    <CalculatedSparkAdvance
        cmpa    #$58
        bcc     loc_F78C
        incb
        cmpa    #$30
        bcc     loc_F78C
        incb

loc_F78C:
        ldaa    <BitFlags_BF_t3
        anda    #7
        cba
        bcs     loc_F7A7
        ldd     AntiDwellTime_HB

loc_F796:
        addd    TOC5_Counter_OC5_Dwell
        std     TOC5_Counter_OC5_Dwell

locret_F79C:
        rts

loc_F79D:
        bclr    <IPL1 2
        ldd     <DistributorFallingEdgePulsewidth_HB
        subd    AntiDwellTime_HB
        bra     loc_F796

loc_F7A7:
        ldab    TCTL1_TimerControlReg1
        orab    #3
        stab    TCTL1_TimerControlReg1
        rts

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fcb   4
        fcb   4
        fcb   4
        fcb   4
        fcb   3
        fcb   3
        fcb   3
        fcb   3
        fcb   2
        fcb   2
        fcb   2
        fcb   2
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   3
        fcb   2
        fcb   2
        fcb   2
        fcb   2
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   1
        fcb   1

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

IRQ:
        ldx     #$1023
        brclr   0,x 4 loc_F7DA
        jmp     loc_F85A

loc_F7DA:
        ldx     TCNT_Counter_FreeRunning16bit
        ldab    #$C
        abx

loc_F7E0:
        ldaa    SwitchPortAccessReg2
        eora    PIA_Ctrl_2
        lsra
        bcs     loc_F865
        cpx     TCNT_Counter_FreeRunning16bit
        bpl     loc_F7E0
        brclr   <Ram_EC $40 loc_F815
        ldaa    SwitchPortAccessReg2
        bita    #$80
        bne     loc_F815
        bclr    <Ram_EC $40
        ldx     #$F7B0
        brset   <BitFlags27 $40 loc_F806
        ldx     #$F7C0

loc_F806:
        ldab    <Ram_EC
        tba
        andb    #$F
        abx
        ldab    0,x
        anda    #$F0
        aba
        oraa    #$10
        staa    <Ram_EC

loc_F815:
        ldaa    #2
        ldab    SwitchPortAccessReg2
        lsrb
        bcc     loc_F824
        clra
        brset   <BitFlags27 $80 loc_F824
        ldaa    #5

loc_F824:
        brclr   <BitFlags_BF_t3 $80 loc_F834
        ldab    #$C
        brclr   <BitFlags27 $80 loc_F830
        ldab    #8

loc_F830:
        cmpb    <Ram_F4
        bne     loc_F849

loc_F834:
        ldab    #$84
        staa    <CylinderPointer
        brset   <BitFlags_BF_t3 $80 loc_F842
        clr     KeyOnOrEngineRunningTime
        clr     Counter_MainLoop

loc_F842:
        stab    <BitFlags_BF_t3
        bset    <BitFlags2b $80
        bra     loc_F84C

loc_F849:
        bclr    <BitFlags2b $80

loc_F84C:
        brclr   <Ram_05 1 loc_F85A
        ldab    UNe_64B9
        addb    #$20
        bcs     loc_F85A
        stab    UNe_64B9

loc_F85A:
        ldaa    PIA_Ctrl_2
        eora    #1
        staa    PIA_Ctrl_2
        clr     Ram_F4

loc_F865:
        ldaa    #1
        staa    PIA_Ctrl_4
        rti

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $3F
        fcb $FF
        fcb $FF
        fcb $3F
        fcb $3F
        fcb $31
        fcb $39
        fcb $39
        fcb $34
        fcb $20
        fcb $43
        fcb $4F
        fcb $50
        fcb $59
        fcb $52
        fcb $49
        fcb $47
        fcb $48
        fcb $54
        fcb $20
        fcb $43
        fcb $48
        fcb $52
        fcb $59
        fcb $53
        fcb $4C
        fcb $45
        fcb $52
        fcb $20
        fcb $2E
        fcb $80
        fcb   2
; end of 'ROM'
; ===========================================================================
; Segment type: Pure data
        ; segment USER_VEC
        org $FFC0
RESERVFFC0: fcb $FF
RESERVFFC1: fcb $FF
RESERVFFC2: fcb $FF
RESERVFFC3: fcb $FF
RESERVFFC4: fcb $FF
RESERVFFC5: fcb $FF
RESERVFFC6: fcb $FF
RESERVFFC7: fcb $FF
RESERVFFC8: fcb $FF
RESERVFFC9: fcb $FF
RESERVFFCA: fcb $FF
RESERVFFCB: fcb $FF
RESERVFFCC: fcb $FF
RESERVFFCD: fcb $FF
RESERVFFCE: fcb $FF
RESERVFFCF: fcb $FF
RESERVFFD0: fcb $FF
RESERVFFD1: fcb $FF
RESERVFFD2: fcb $FF
RESERVFFD3: fcb $FF
RESERVFFD4: fcb $FF
RESERVFFD5: fcb $FF
        fdb SCISS
        fdb SPIE
        fdb PAII
        fdb PAII
        fdb PAII
off_FFE0:   fdb I4_I5
        fdb OC4I
        fdb PAII
        fdb PAII
        fdb OC1I
        fdb PAII
        fdb IC2I
        fdb IC1I
        fdb PAII
        fdb IRQ
        fdb XIRQ
        fdb SOFT
        fdb OPC
        fdb NOCOP
        fdb CME
off_FFFE:   fdb __RESET
; end of 'USER_VEC'
        end