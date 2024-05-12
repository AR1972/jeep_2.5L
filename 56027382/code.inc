
XIRQ:
                ldab    #$01
                bra     loc_9416

NOCOP:
                ldab    #$02
                bra     loc_9416

OPC:
                ldab    #$04
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
 IF ECLOCK == 3
                ldd     #$03A9
 ELSE IF ECLOCK == 2
                ldd     #$02A9
 ENDIF
                staa    TMSK2_TimerInterruptMask2
                stab    OPTION_SysConfigOptionReg
                ldaa    #$F8
                staa    BPROT_BlockProtReg
                tsx
                ldd     7,x
                std     <Ram_01
                std     Temp1
                lds     #TopOfStack
                clr     MinimumTimerCountBeforeMainloopCanContinue
                clr     Ram_04
                bra     loc_94A2

CME:
                sei
                lds     #TopOfStack
 IF ECLOCK == 3
                ldd     #$03A9
 ELSE IF ECLOCK == 2
                ldd     #$02A9
 ENDIF
                staa    TMSK2_TimerInterruptMask2
                stab    OPTION_SysConfigOptionReg
                ldaa    #$F8
                staa    BPROT_BlockProtReg
                clra
                clrb
                staa    Temp0
                std     Temp1
                ldx     #Ram_00

loc_945A:
                ldaa    0,x
                cmpa    #$00
                bne     loc_9468
                inx
                cpx     #$0020
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
                lds     #TopOfStack
 IF ECLOCK == 3
                ldd     #$03A9
 ELSE IF ECLOCK == 2
                ldd     #$02A9
 ENDIF
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

loc_949C:                               ; __RESET+26↑j
                sty     <MinimumTimerCountBeforeMainloopCanContinue
                bset    <Ram_05 $0A

loc_94A2:                               ; SOFT+27↑j CME+29↑j ...
                jsr     sub_E4F3
                ldaa    #$90
                tap
                ldab    #$0F
                ldaa    TL_CONF01
                bita    #$08
                beq     loc_94B3
                ldab    #$06

loc_94B3:                               ; __RESET+3F↑j
                stab    HPRIO_HighPriorityInterruptMask
                clr     OC1M_OutputCompare1Mask
                clr     OC1D_OutputCompare1D
                ldd     #$00FF
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
                ldd     #$088F
                staa    SwitchPortAccessReg1
                stab    PIA_Ctrl_1
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
 IF ECLOCK == 3
                ldd     #$F871
 ELSE IF ECLOCK == 2
                ldd     #$F870
 ENDIF
                staa    PIA_Ctrl_5
                stab    PACTL_PulseAccumulatorControl
                clra
                staa    PPROG_EEPROMControlReg
                staa    PIA_Ctrl_2
                ldd     #$0008
                std     InjectorPulsewidth_HB_Cyl1
                std     InjectorPulsewidth_HB_Cyl2
                std     InjectorPulsewidth_HB_Cyl3
                std     InjectorPulsewidth_HB_Cyl4
 IF ECLOCK == 4
                ldd     #$0C23
 ENDIF
 IF ECLOCK == 3
                ldd     #$0C13
 ENDIF
 IF ECLOCK == 2
                ldd     #$0C22
 ENDIF
                staa    SCCR2_SerialControlReg2
                stab    BAUD_SerialBaudRate  ; %0010 0010/$22 8mhz crystal 7812 BAUD
                                             ; %0001 0011/$13 12mhz crystal 7812 BAUD
                                             ; %0010 0011/$23 16mhz crystal 7812 BAUD
                ldd     SCSR_SerialStatus
                jsr     OCToggleAndResetCopTimer
                clr     SCCR1_SerialControlReg1
                ldx     #IPL1
                ldd     <MinimumTimerCountBeforeMainloopCanContinue
                coma
                cba
                beq     loc_956D
                ldab    #$08
                ldaa    Temp0
                bpl     loc_9547
                ldab    #$80

loc_9547:                               ; __RESET+D3↑j
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
                ldaa    byte_88BA
                staa    <Ram_0C
                ldd     #$40DF
                staa    <BitFlags36_t3
                stab    <CurrentAisPosition
                ldx     #Counter_SpeedSensorInterrupt_HB

loc_956D:                               ; __RESET+CC↑j
                ldy     #$02CA*ECLOCK

loc_9571:                               ; __RESET+103↓j
                dey
                bne     loc_9571
                dex
                clrb

loc_9577:                               ; __RESET+10D↓j
                inx
                stab    0,x
                cpx     #$FF
                bcs     loc_9577
                ldaa    TL_CONF01
                staa    <BitFlags27
                ldx     #CountdownTimerFromKeyOn
                dex
                clrb

loc_9589:                               ; __RESET+11F↓j
                inx
                stab    0,x
                cpx     #UNe_64B9
                bcs     loc_9589
                ldaa    #$E5
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                jsr     OCToggleAndResetCopTimer
                ldy     #$02CA*ECLOCK

loc_959F:                               ; __RESET+131↓j
                dey
                bne     loc_959F
                ldaa    #$14
                staa    ADCTL_A2DControlReg

loc_95A8:                               ; __RESET+13B↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_95A8
                ldaa    ADR1_A2DResults1
                staa    CoolantVoltsTmp2
                ldaa    <PIA3_Buffer_t3
                anda    #$7F
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                jsr     OCToggleAndResetCopTimer
                ldy     #$023B*ECLOCK

loc_95C3:                               ; __RESET+155↓j
                dey
                bne     loc_95C3
                ldaa    #$14
                staa    ADCTL_A2DControlReg

loc_95CC:                               ; __RESET+15F↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_95CC
                ldaa    ADR1_A2DResults1
                staa    CoolantVoltsTmp1
                ldaa    CoolantVoltsTmp1
                ldab    CoolantVoltsTmp2
                mul
                std     Temp1
                ldab    CoolantVoltsTmp1
                subb    CoolantVoltsTmp2
                bls     loc_9604
                clra
                xgdx
                ldd     Temp1
                aslb
                adca    #$00
                tab
                abx
                ldd     Temp1
                idiv
                xgdx
                tsta
                bne     loc_9604
                tba
                ldx     #TL_TempForScaleAmbientA2D
                jsr     Lookup4ByteTable
                bra     loc_9606
; ---------------------------------------------------------------------------

loc_9604:                               ; __RESET+177↑j __RESET+189↑j
                ldaa    #$C1

loc_9606:                               ; __RESET+192↑j
                staa    <AmbientAirTempVolts2
                jsr     bcf2_MM
                jsr     DetermineTargetBatteryVoltage
                ldaa    <PIA3_Buffer_t3
                oraa    #$10
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                jsr     OCToggleAndResetCopTimer
                ldy     #$02CA*ECLOCK

loc_961E:                               ; __RESET+1B0↓j
                dey
                bne     loc_961E
                ldaa    #$14
                staa    ADCTL_A2DControlReg

loc_9627:                               ; __RESET+1BA↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_9627
                ldaa    ADR1_A2DResults1
                cmpa    #$40
                bcc     loc_963C
                ldaa    <PIA3_Buffer_t3
                anda    #$EF
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3

loc_963C:                               ; __RESET+1C1↑j
                jsr     OCToggleAndResetCopTimer
                ldy     #$02CA*ECLOCK

loc_9643:                               ; __RESET+1D5↓j
                dey
                bne     loc_9643
                ldaa    #$14
                staa    ADCTL_A2DControlReg

loc_964C:                               ; __RESET+1DF↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_964C
                ldaa    ADR1_A2DResults1
                staa    <LastCoolantTempVolts

loc_9656:                               ; __RESET+1E9↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_9656
                ldaa    ADR2_A2DResults2
                cmpa    #$40
                bcc     loc_966B
                ldaa    <PIA3_Buffer_t3
                anda    #$DF
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3

loc_966B:                               ; __RESET+1F0↑j
                jsr     OCToggleAndResetCopTimer
                ldy     #$02CA*ECLOCK

loc_9672:                               ; __RESET+204↓j
                dey
                bne     loc_9672
                ldaa    #$14
                staa    ADCTL_A2DControlReg

loc_967B:                               ; __RESET+20E↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_967B
                ldab    ADR2_A2DResults2
                stab    <LastChargeTempVolts
                ldaa    #$10
                staa    ADCTL_A2DControlReg
                jsr     OCToggleAndResetCopTimer

loc_968D:                               ; __RESET+220↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_968D
                ldd     ADR1_A2DResults1
                stab    <BatteryVolts
                ldab    ADR4_A2DResults4
                stab    <LastTpsVolts
                jsr     sub_E3F8
                staa    <MapValue
                clrb
                std     <MapValue2
                staa    MapValue_t3
                brclr   <Ram_05 8 loc_96B6
                cmpa    #$80
                bcc     loc_96B1
                ldaa    #$80

loc_96B1:                               ; __RESET+23D↑j
                staa    <BaroPressure
                bclr    <Ram_05 8

loc_96B6:                               ; __RESET+237↑j
                ldaa    ADR1_A2DResults1
                staa    <MapVolts_X
                staa    <MapValue3
                brclr   <Ram_05 2 loc_96E7
                brclr   <Ram_05 4 loc_96E7
                cmpa    byte_8A09
                bcc     loc_96E7
                ldab    #$02

loc_96CC:                               ; __RESET+26F↓j
                ldaa    #$10
                staa    ADCTL_A2DControlReg

loc_96D1:                               ; __RESET+264↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_96D1
                ldaa    ADR1_A2DResults1
                cmpa    byte_8A09
                bcc     loc_96E7
                decb
                bne     loc_96CC
                bset    <b5C_IPL1_t3 8
                bset    <BitFlags2e $80

loc_96E7:                               ; __RESET+24D↑j __RESET+251↑j ...
                bclr    <Ram_05 2
                ldaa    <Ram_05
                anda    #$C0
                cmpa    #$80
                bne     loc_9708
                ldd     #$0AFF
                std     <DRBPointer1
                ldaa    #$F1
                staa    LastCamFallingEdgeTime2
                ldab    #$FF
                ldaa    <BitFlags27
                bita    #$C0
                beq     loc_9720
                ldab    #$FB
                bra     loc_9720
; ---------------------------------------------------------------------------

loc_9708:                               ; __RESET+280↑j
                ldaa    <Ram_05
                adda    #$40
                staa    <Ram_05
                ldaa    PIA_Ctrl_1
                oraa    #$04
                staa    PIA_Ctrl_1
                ldab    #$EF
                ldaa    <BitFlags27
                bita    #$C0
                beq     loc_9720
                ldab    #$EB

loc_9720:                               ; __RESET+292↑j __RESET+296↑j ...
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
                oraa    #$04
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldab    SPCR_SerialPeripheralControl
                andb    #$FC
                stab    SPCR_SerialPeripheralControl
                jsr     OCToggleAndResetCopTimer
                ldx     #$29A*ECLOCK+1 ; not evenly divisable by 2

loc_974B:                               ; __RESET+2E3↓j
                ldaa    SwitchPortAccessReg1
                bita    #$10
                bne     loc_9755
                dex
                bne     loc_974B

loc_9755:                               ; __RESET+2E0↑j
                jsr     OCToggleAndResetCopTimer
                ldaa    PIA_Ctrl_1
                anda    #$FB
                staa    PIA_Ctrl_1
                ldaa    Timer_DelayBeforeUpdating_MINTHR
                oraa    #$03
                staa    Timer_DelayBeforeUpdating_MINTHR
                bset    <Ram_05 1
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
                ldx     #$B616
                ldaa    0,x
                cmpa    #$4A
                bne     loc_97B1
                coma
                cmpa    1,x
                bne     loc_97B1
                bset    <BitFlags2d 4

loc_97B1:                               ; __RESET+337↑j __RESET+33C↑j
                ldaa    <LastCoolantTempVolts
                ldx     #TL_TempForHotScaleA2D
                brclr   <PIA3_Buffer_t3 $10 FilterAndStoreCoolantTemp
                ldx     #TL_TempForColdScaleFromA2D

FilterAndStoreCoolantTemp:              ; __RESET+346↑j
                jsr     Lookup4ByteTable
                staa    <CoolantTemp
                ldaa    <LastCoolantTempVolts
                cmpa    TL_CoolantTempOutOfRangeHigh
                bcc     UseDefaultCoolantTemp
                cmpa    TL_CoolantTempOutOfRangeLow
                bcs     UseDefaultCoolantTemp
                ldaa    <CoolantTemp
                bra     SubstituteCoolantForChargeTemp
; ---------------------------------------------------------------------------

UseDefaultCoolantTemp:                  ; __RESET+357↑j __RESET+35C↑j
                ldaa    TL_DefaultCoolantTempRaw

SubstituteCoolantForChargeTemp:         ; __RESET+360↑j
                staa    <CoolantTemp
                ldx     #TL_ScaleCoolantTemp
                jsr     Lookup4ByteTable
                staa    <CoolantTemp_fromTable_Scaled
                staa    <PreviousCoolantTemp_fromTable_Scaled
                ldaa    <LastChargeTempVolts
                ldx     #TL_TempForHotScaleA2D
                brclr   <PIA3_Buffer_t3 $20 FilterAndStoreChargeTemp
                ldx     #TL_TempForColdScaleFromA2D

FilterAndStoreChargeTemp:               ; __RESET+376↑j
                jsr     Lookup4ByteTable
                staa    <ChargeTempVolts
                ldaa    <LastChargeTempVolts
                cmpa    TL_ChargeTempOutOfRangeHigh
                bcc     UseDefaultChargeTemp
                cmpa    TL_ChargeTempOutOfRangeLow
                bcs     UseDefaultChargeTemp
                ldaa    <ChargeTempVolts
                bra     StoreChargeTempValue2
; ---------------------------------------------------------------------------

UseDefaultChargeTemp:                   ; __RESET+387↑j __RESET+38C↑j
                ldaa    TL_DefaultChargeTemp_Limpin

StoreChargeTempValue2:                  ; __RESET+390↑j
                staa    <ChargeTempVolts
                ldx     #TL_ScaleChargeTemp
                jsr     Lookup4ByteTable
                staa    <IntakeTemp_fromTable_Scaled
                ldaa    <LastTpsVolts
                staa    <TpsVolts
                ldab    <LowestSessionTpsVolts
                addb    TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly
                cmpb    TL_ValueOf_MINTHR_WhenBatteryDisconnected
                bcs     loc_9826
                adda    #$06
                ldab    TL_ValueOf_MINTHR_WhenBatteryDisconnected
                cba
                bcc     loc_9826
                tab

loc_9826:                               ; __RESET+3AB↑j __RESET+3B3↑j
                stab    <LowestSessionTpsVolts
                ldaa    <CoolantTemp
                cmpa    TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup
                bcs     loc_9834
                cmpa    TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup
                bcs     CalculateVariousFactors3

loc_9834:                               ; __RESET+3BD↑j
                bset    <BitFlags6d_t3 2

CalculateVariousFactors3:               ; __RESET+3C2↑j
                jsr     CalculateVariousFactors2
                jsr     calc_fuel_MM
                ldd     TCNT_Counter_FreeRunning16bit
                addd    #$01F4*ECLOCK
                std     TOC1_Counter_OC1
                jsr     sub_E9F9
                ldaa    <PIA3_Buffer_t3
                oraa    #$01
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
                anda    #$0F
                aba
                ldx     #PORTD_PortD
                bclr    0,x $20
                cmpa    SPSR_SerialPeripheralStatus
                staa    SPDR_SerialPeripheralDataIO
                ldaa    <PIA3_Buffer_t3
                oraa    #$01
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                mul
                bset    0,x $20
                ldaa    #$BF
                ldab    TL_ConfigurationFlags2
                bitb    #$20
                beq     loc_9893
                ldab    TL_CONF01
                bitb    #$01
                beq     loc_9893
                anda    #$DF

loc_9893:                               ; __RESET+418↑j __RESET+41F↑j
                staa    <PIA1_Buffer_t3
                ldaa    SwitchPortAccessReg1
                oraa    #$01
                staa    SwitchPortAccessReg1
                ldx     #$011C*ECLOCK

loc_98A0:                               ; __RESET+431↓j
                dex
                bne     loc_98A0
                jsr     UpdatePIA1AndCheckOutputs2_MM
                cli
                ldd     TCNT_Counter_FreeRunning16bit
                std     MinimumTimerCountBeforeMainloopCanContinue2
                bra     MainProgramLoop
; ---------------------------------------------------------------------------
off_98AF:       fdb ReadA2DCoolantChargeTempSensors ; __RESET+4E0↓o
                fdb loc_9978
                fdb MainSubLoop
                fdb ReadA2DNotSureWhat_X
                fdb MainSubLoop
                fdb ReadA2DNotSureWhat_Y
                fdb loc_99C9
                fdb MainSubLoop
; ---------------------------------------------------------------------------

MainProgramLoop:                        ; __RESET+43D↑j __RESET+66A↓J
                jsr     ResetCopTimer2
                ldaa    TL_CONF01
                staa    <BitFlags27
                sei
                ldd     TCNT_Counter_FreeRunning16bit
                std     Temp0
                inc     Counter_MainLoop
                bne     loc_98E0
                bclr    <Ram_05 $C0
                bset    <BitFlags6a_t3 4
                ldaa    <KeyOnOrEngineRunningTime
                inca
                beq     loc_98E0
                staa    <KeyOnOrEngineRunningTime

loc_98E0:                               ; __RESET+461↑j __RESET+46C↑j
                ldaa    #$10
                staa    ADCTL_A2DControlReg
                ldd     Temp0
                ldx     #Counter_TimerPastHalfwayBetweenCamPulses
                ldy     #Temp5
                jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM
                cmpa    #$10
                bcs     loc_9914
                brset   <BitFlags2e $10 loc_9917
                bset    <BitFlags2e $10
                ldab    #$AA
                stab    TCTL1_TimerControlReg1
                ldab    #$78
                stab    CFORC_TimerForceCompare
                ldaa    UNe_64B9
                anda    #$E0
                staa    UNe_64B9
                bclr    <BitFlags2b $C0
                bra     loc_9917
; ---------------------------------------------------------------------------

loc_9914:                               ; __RESET+484↑j
                bclr    <BitFlags2e $10

loc_9917:                               ; __RESET+486↑j __RESET+4A2↑j ...
                ldaa    ADCTL_A2DControlReg
                bpl     loc_9917
                ldaa    <Counter_MainLoop
                lsra
                bcs     loc_9929
                lsra
                bcs     loc_9929
                ldaa    ADR2_A2DResults2
                staa    <BatteryVolts

loc_9929:                               ; __RESET+4AF↑j __RESET+4B2↑j
                ldd     ADR3_A2DResults3
                staa    <O2SensorVolts
                stab    <LastTpsVolts
                ldaa    ADR1_A2DResults1
                cli
                jsr     sub_D64A
                ldaa    #$14
                sei
                staa    ADCTL_A2DControlReg
                ldd     TCNT_Counter_FreeRunning16bit
                lsld
                ldx     #Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                ldy     #Temp5
                jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM

loc_994B:                               ; __RESET+4DE↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_994B
                ldx     #off_98AF
                ldab    <Counter_MainLoop
                andb    #$07
                beq     ReadA2DCoolantChargeTempSensors
                ldab    <Counter_MainLoop
                orab    #$80
                cmpb    #$F8
                bcs     MainSubLoop
                ldab    <Ram_E2
                bne     MainSubLoop
                ldab    <Counter_MainLoop
                andb    #$07
                aslb
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

ReadA2DCoolantChargeTempSensors:        ; __RESET+4E7↑j
                                        ; __RESET:off_98AF↑o
                ldd     ADR1_A2DResults1
                staa    <LastCoolantTempVolts
                stab    <LastChargeTempVolts
                bra     MainSubLoop
; ---------------------------------------------------------------------------

loc_9978:                               ; __RESET+441↑o
                ldaa    <PIA3_Buffer_t3
                anda    #$7F
                brclr   <PIA3_Buffer_t3 $10 loc_9985
                bset    <BitFlags23 8
                bra     loc_9988
; ---------------------------------------------------------------------------

loc_9985:                               ; __RESET+50C↑j
                bclr    <BitFlags23 8

loc_9988:                               ; __RESET+513↑j
                anda    #$EF
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     MainSubLoop
; ---------------------------------------------------------------------------

ReadA2DNotSureWhat_X:                   ; __RESET+445↑o
                ldaa    ADR1_A2DResults1
                cli
                cmpa    CoolantVoltsTmp1
                bne     loc_999F
                bset    <BitFlags23 $20
                bra     loc_99A2
; ---------------------------------------------------------------------------

loc_999F:                               ; __RESET+528↑j
                bclr    <BitFlags23 $20

loc_99A2:                               ; __RESET+52D↑j
                staa    CoolantVoltsTmp1
                ldaa    <PIA3_Buffer_t3
                oraa    #$80
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     MainSubLoop
; ---------------------------------------------------------------------------

ReadA2DNotSureWhat_Y:                   ; __RESET+449↑o
                ldaa    ADR1_A2DResults1
                cli
                staa    CoolantVoltsTmp2
                brclr   <BitFlags23 $20 MainSubLoop
                ldab    <BitFlags66_t3
                bitb    #$03
                bne     MainSubLoop
                jsr     sub_BC48
                jsr     DetermineTargetBatteryVoltage
                bra     MainSubLoop
; ---------------------------------------------------------------------------

loc_99C9:                               ; __RESET+44B↑o
                ldaa    <PIA3_Buffer_t3
                anda    #$7F
                brclr   <BitFlags23 8 loc_99D5
                oraa    #$10
                bra     loc_99D7
; ---------------------------------------------------------------------------

loc_99D5:                               ; __RESET+55D↑j
                anda    #$EF

loc_99D7:                               ; __RESET+563↑j
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3

MainSubLoop:                            ; __RESET+4EF↑j __RESET+4F3↑j ...
                cli
                jsr     sub_BA0E
                jsr     sub_BC27
                jsr     sub_BB9B
                jsr     sub_E43E
                jsr     sub_B914
                jsr     sub_A706
                jsr     sub_BBDE
                jsr     sub_BF21
                jsr     sub_B88A
                jsr     sub_B800
                jsr     CalculateVariousFactors2
                jsr     calc_fuel_MM
                jsr     sub_C079
                jsr     sub_BBF2
                jsr     ControlAsdRelay_MM
                jsr     L9ca3_MM
                jsr     sub_A2B6
                jsr     sub_A5B7
                jsr     sub_A6E6
                jsr     sub_B9BA
                jsr     sub_B9E3
                jsr     sub_9F91
                jsr     sub_DEC8
                ldaa    <Counter_MainLoop
                bne     loc_9A2C
                jsr     sub_EA37
                jsr     sub_D592

loc_9A2C:                               ; __RESET+5B4↑j
                ldaa    <Counter_MainLoop
                lsra
                bcc     loc_9A4D
                lsra
                bcc     loc_9A42
                jsr     sub_B976
                jsr     sub_D7D7
                jsr     sub_C211
                jsr     bcf2_MM
                bra     loc_9A5F
; ---------------------------------------------------------------------------

loc_9A42:                               ; __RESET+5C2↑j
                jsr     sub_A227
                jsr     sub_A24C
                jsr     sub_D545
                bra     loc_9A5F
; ---------------------------------------------------------------------------

loc_9A4D:                               ; __RESET+5BF↑j
                jsr     CycleACClutch_MM
                jsr     L9b0c_MM
                jsr     sub_E679
                jsr     sub_A130
                jsr     sub_A25F
                jsr     sub_D9B9

loc_9A5F:                               ; __RESET+5D0↑j __RESET+5DB↑j
                jsr     sub_9CF3
                jsr     sub_BD17
                jsr     sub_BF80
                jsr     sub_C09F
                jsr     sub_C10C
                jsr     sub_C1FF
                jsr     sub_D4F9
                ldaa    <EngineRpm_HB
                cmpa    #$7D         ; RPM calculation $7D*$20=$FA0 (4000 RPM)
                bcc     loc_9A95
                jsr     sub_D4E1
                jsr     sub_D94F
                jsr     sub_D79B
                jsr     sub_DA71
                jsr     sub_D6A1
                jsr     sub_D977
                jsr     sub_D6EA
                jsr     sub_EB09
                jsr     sub_D8A7

loc_9A95:                               ; __RESET+608↑j
                jsr     EmmissionMaintenanceReminder1_MM
                jsr     sub_C8AF
                jsr     sub_CAFE
                jsr     sub_CCF6
                jsr     UpdatePIA1AndCheckOutputs2_MM
                jsr     sub_D260
                jsr     sub_D5BA
                brset   <BitFlags6a_t3 $40 loc_9AC4
                sei
                ldaa    CountdownTimerFromKeyOn
                bne     loc_9AC4
                ldd     <MinimumTimerCountBeforeMainloopCanContinue
                cli
                coma
                cba
                beq     loc_9AC4
                jsr     sub_E70E
                ldd     <Counter_SpeedSensorInterrupt_HB
                tba
                comb
                std     <MinimumTimerCountBeforeMainloopCanContinue

loc_9AC4:                               ; __RESET+63A↑j __RESET+642↑j ...
                cli
                jsr     sub_E542

loc_9AC8:                               ; __RESET+662↓j
                ldd     TCNT_Counter_FreeRunning16bit
                subd    MinimumTimerCountBeforeMainloopCanContinue2
                cpd     #$055F*ECLOCK
                bcs     loc_9AC8
                ldd     TCNT_Counter_FreeRunning16bit
                std     MinimumTimerCountBeforeMainloopCanContinue2
                jmp     MainProgramLoop
; End of function __RESET


; =============== S U B R O U T I N E =======================================


L9b0c_MM:                               ; __RESET+5E0↑P
                ldab    byte_8807
                ldaa    <PIA2_Buffer_t3
                bita    #1
                beq     loc_9AEC
                subb    #3
                bcc     loc_9AEC
                ldab    #0

loc_9AEC:                               ; L9b0c_MM+7↑j L9b0c_MM+B↑j
                cmpb    <TpsVolts_Minus_LowestSessionTpsVolts
                bcc     loc_9B06
                ldab    UNe_64AD
                cmpb    byte_8808
                bcc     loc_9B09
                ldaa    <Counter_MainLoop
                bita    #7
                bne     loc_9B04
                incb
                beq     loc_9B04
                stab    UNe_64AD

loc_9B04:                               ; L9b0c_MM+1F↑j L9b0c_MM+22↑j
                bra     loc_9B59
; ---------------------------------------------------------------------------

loc_9B06:                               ; L9b0c_MM+11↑j
                clr     UNe_64AD

loc_9B09:                               ; L9b0c_MM+19↑j
                brclr   <IPL1 $40 loc_9B59
                ldab    <KeyOnOrEngineRunningTime
                cmpb    byte_880E
                bcs     loc_9B59
                brclr   <BitFlags2d 4 loc_9B28
                ldaa    <EngineRpm_HB
                cmpa    #$20
                bcc     loc_9B59
                brset   <StartupSwitchMirror1 $80 loc_9B59
                brclr   <StartupSwitchMirror1 $40 loc_9B59
                bra     loc_9B60
; ---------------------------------------------------------------------------

loc_9B28:                               ; L9b0c_MM+37↑j
                brset   <BitFlags68_t3 8 loc_9B59
                ldab    <CoolantTemp
                cmpb    byte_8809
                bhi     loc_9B59
                ldx     <EngineRpm_HB
                cpx     word_880A
                bcc     loc_9B59
                cpx     word_880C
                bcc     loc_9B67
                cpx     word_8804
                bcc     loc_9B4A
                ldab    byte_8806
                stab    STe_64AE

loc_9B4A:                               ; L9b0c_MM+65↑j
                ldab    STe_64AE
                beq     loc_9B60
                ldaa    <Counter_MainLoop
                bita    #7
                bne     loc_9B59
                decb
                stab    STe_64AE

loc_9B59:                               ; L9b0c_MM:loc_9B04↑j
                                        ; L9b0c_MM:loc_9B09↑j ...
                sei
                ldaa    <PIA2_Buffer_t3
                oraa    #1
                bra     loc_9B65
; ---------------------------------------------------------------------------

loc_9B60:                               ; L9b0c_MM+49↑j L9b0c_MM+70↑j
                sei
                ldaa    <PIA2_Buffer_t3
                anda    #$FE

loc_9B65:                               ; L9b0c_MM+81↑j
                staa    <PIA2_Buffer_t3

loc_9B67:                               ; L9b0c_MM+60↑j
                cli
                rts
; End of function L9b0c_MM


; =============== S U B R O U T I N E =======================================


CycleACClutch_MM:                       ; __RESET:loc_9A4D↑P
                brset   <PIA2_Buffer_t3 1 loc_9B82
                brclr   <BitFlags2d 4 loc_9B82
                ldaa    Counter_ACControl1
                inca
                beq     loc_9B7F
                staa    Counter_ACControl1
                cmpa    byte_880F
                bcs     loc_9B82

loc_9B7F:                               ; CycleACClutch_MM+C↑j
                bset    <BitFlags2d 2

loc_9B82:                               ; CycleACClutch_MM↑j
                                        ; CycleACClutch_MM+4↑j ...
                ldab    <ACClutchToggleVar
                ldaa    <BitFlags68_t3
                lsra
                eora    <BitFlags68_t3
                bita    #$20
                beq     loc_9BBB
                brclr   <BitFlags68_t3 $20 loc_9BA6
                cmpb    #$30
                bcs     loc_9B9B
                bclr    <ACClutchToggleVar 7
                bset    <BitFlags68_t3 $40

loc_9B9B:                               ; CycleACClutch_MM+2A↑j
                                        ; CycleACClutch_MM+4A↓j ...
                ldaa    <Counter_MainLoop
                bita    #$1F
                bne     locret_9BD0
                addb    #8
                bcc     loc_9BCE
                rts
; ---------------------------------------------------------------------------

loc_9BA6:                               ; CycleACClutch_MM+24↑j
                brclr   <ACClutchToggleVar 7 loc_9BB1
                tba
                anda    #7
                cmpa    #5
                bls     loc_9BB8

loc_9BB1:                               ; CycleACClutch_MM:loc_9BA6↑j
                cmpb    #$B8
                bcs     loc_9B9B
                bclr    <BitFlags68_t3 $40

loc_9BB8:                               ; CycleACClutch_MM+46↑j
                clrb
                bra     loc_9BCE
; ---------------------------------------------------------------------------

loc_9BBB:                               ; CycleACClutch_MM+22↑j
                brset   <ACClutchToggleVar 7 loc_9BC2
                incb
                stab    <ACClutchToggleVar

loc_9BC2:                               ; CycleACClutch_MM:loc_9BBB↑j
                brset   <BitFlags68_t3 $40 loc_9B9B
                cmpb    #$60
                bcs     loc_9B9B
                andb    #7
                orab    #$60

loc_9BCE:                               ; CycleACClutch_MM+3A↑j
                                        ; CycleACClutch_MM+50↑j
                stab    <ACClutchToggleVar

locret_9BD0:                            ; CycleACClutch_MM+36↑j
                rts
; End of function CycleACClutch_MM


; =============== S U B R O U T I N E =======================================


ControlAsdRelay_MM:
                ldaa    <DRBPointer1
                cmpa    #$0A
                bne     loc_9BDB
                bset    <PIA2_Buffer_t3 $10  ; ASD relay off
                rts

loc_9BDB:
                cmpa    #$18
                bne     CONTROL_AUTOSHUTDOWN_RELAY_ROUTINE1
                ldaa    <DRBSerialMode
                bita    #$30
                bne     CONTROL_AUTOSHUTDOWN_RELAY_ROUTINE1
                ldaa    <TimerOverflowsBetweenCamPulses
                cmpa    #$50
                bls     loc_9C1A
                ldaa    <DRBPointer2
                tab
                anda    #$0F
                pshb
                lsrb
                lsrb
                lsrb
                lsrb
                comb
                andb    #$0F
                cba
                pulb
                bne     loc_9C1A
                bset    <BitFlags2d $10
                tst     Counter_MainLoop
                bne     loc_9C0E
                deca
                beq     loc_9C1A
                andb    #$F0
                addb    #$10
                aba
                staa    <DRBPointer2

loc_9C0E:
                ldaa    #$E1
                jsr     SerialOutput1a
                sei
                ldaa    <PIA2_Buffer_t3
                anda    #$EF
                bra     ASD_StoreStateToBuffer

loc_9C1A:
                clra
                staa    <DRBPointer1
                staa    <ATMOffset
                bclr    <BitFlags2d $10
                bclr    <DRBSerialMode $30
                jsr     SerialOutput1a

CONTROL_AUTOSHUTDOWN_RELAY_ROUTINE1:
                ldx     #$2D*ASD1
                ldaa    <CoolantTemp
                cmpa    #$8F
                bcc     ControlAsdRelay_Over27Ftemp
                ldx     #$5B*ASD2

ControlAsdRelay_Over27Ftemp:
                ldab    #04
                ldaa    <BatteryVolts
                cmpa    #$B2
                brset   <BitFlags23 4 ASD_EngRunningCheckBatVolts
                bcc     ASD_ToggleOnOff
                cpx     #$5B*ASD2
                bne     ASD_ToggleOnOff
                ldab    #$0B
                bra     ASD_ToggleOnOff

ASD_EngRunningCheckBatVolts:
                bcs     ASD_ToggleOnOff
                ldab    #03

ASD_ToggleOnOff:
                sei
                ldaa    <PIA2_Buffer_t3
                anda    #$EF                 ; ASD relay ON
                cmpb    <Counter_TimerPastHalfwayBetweenCamPulses
                bhi     ASD_StoreStateToBuffer
                cpx     <KeyOnOrEngineRunningTime
                bhi     ASD_StoreStateToBuffer
                oraa    #$10                 ; ASD relay OFF
                bclr    <Ram_80 $FF

ASD_StoreStateToBuffer:
                staa    <PIA2_Buffer_t3
                cli
                brclr   <IPL1 $40 locret_9C6F
                ldab    <KeyOnOrEngineRunningTime
                cmpb    #04
                bcs     locret_9C6F
                bset    <BitFlags23 4

locret_9C6F:
                rts

; ---------------------------------------------------------------------------

L9ca3_MM:                               ; __RESET+59A↑P
                brclr   <IPL1 $40 loc_9CE6
                ldaa    TL_ConfigurationFlags2
                bita    #2
                beq     locret_9CF2
                ldaa    <InjectorPulsewidth_HB
                ldab    <EngineRpm_HB
                mul
                std     Temp0
                ldaa    <BatteryVolts
                ldab    byte_8825
                mul
                subd    word_8821
                bcc     loc_9C91
                ldd     #0000

loc_9C91:                               ; RESERVED:9C8C↑j
                brclr   <BitFlags27 8 loc_9C9B
                brclr   <PIA1_Buffer_t3 $80 loc_9CD9
                bra     loc_9CA7
; ---------------------------------------------------------------------------

loc_9C9B:                               ; RESERVED:loc_9C91↑j
                brclr   <PIA2_Buffer_t3 8 loc_9CD9
                subd    word_8823
                bcc     loc_9CA7
                ldd     #0000

loc_9CA7:                               ; RESERVED:9C99↑j
                                        ; RESERVED:9CA2↑j
                cpd     Temp0
                bls     locret_9CF2
                brset   <BitFlags2d $40 loc_9CBD
                ldaa    <BatteryVolts
                cmpa    byte_8826
                bls     locret_9CF2
                bset    <BitFlags2d $40
                bra     loc_9CCB
; ---------------------------------------------------------------------------

loc_9CBD:                               ; RESERVED:9CAD↑j
                ldaa    <BatteryVolts
                ldab    byte_8826
                addb    #3
                bcc     loc_9CC8
                ldab    #$FF

loc_9CC8:                               ; RESERVED:9CC4↑j
                cba
                bls     locret_9CF2

loc_9CCB:                               ; RESERVED:9CBB↑j
                brclr   <BitFlags27 8 loc_9CD4
                bclr    <PIA1_Buffer_t3 $80
                bra     locret_9CF2
; ---------------------------------------------------------------------------

loc_9CD4:                               ; RESERVED:loc_9CCB↑j
                bclr    <PIA2_Buffer_t3 8
                bra     locret_9CF2
; ---------------------------------------------------------------------------

loc_9CD9:                               ; RESERVED:9C95↑j
                                        ; RESERVED:loc_9C9B↑j
                cpd     Temp0
                bls     loc_9CE6
                ldaa    <BatteryVolts
                cmpa    byte_8826
                bhi     locret_9CF2

loc_9CE6:                               ; RESERVED:L9ca3_MM↑j
                                        ; RESERVED:9CDD↑j
                brclr   <BitFlags27 8 loc_9CEF
                bset    <PIA1_Buffer_t3 $80
                bra     locret_9CF2
; ---------------------------------------------------------------------------

loc_9CEF:                               ; RESERVED:loc_9CE6↑j
                bset    <PIA2_Buffer_t3 8

locret_9CF2:                            ; RESERVED:9C79↑j
                                        ; RESERVED:9CAB↑j ...
                rts

; =============== S U B R O U T I N E =======================================


sub_9CF3:                               ; __RESET:loc_9A5F↑P
                ldaa    byte_89DD
                bita    #8
                bne     loc_9CFD
                jmp     loc_9DD9
; ---------------------------------------------------------------------------

loc_9CFD:                               ; sub_9CF3+5↑j
                brset   <IPL1 $40 loc_9D0D
                ldaa    <CoolantTemp
                cmpa    byte_8A3F
                bcc     loc_9D1C
                bset    <BitFlags6d_t3 $80
                bra     loc_9D1C
; ---------------------------------------------------------------------------

loc_9D0D:                               ; sub_9CF3:loc_9CFD↑j
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    byte_8A40
                bcs     loc_9D1C
                brset   <BitFlags6d_t3 $80 loc_9D1C
                brset   <BitFlags29 $40 loc_9D1F

loc_9D1C:                               ; sub_9CF3+13↑j sub_9CF3+18↑j ...
                jmp     loc_9D7E
; ---------------------------------------------------------------------------

loc_9D1F:                               ; sub_9CF3+25↑j
                ldaa    <b5C_IPL1_t3
                bne     loc_9D7E
                ldaa    <MapVolts
                cmpa    byte_8A41
                bcs     loc_9D7E
                ldx     <EGRVar3_ErrorCodeBufferHB
                brset   <BitFlags6d_t3 $40 loc_9D9C
                cpx     word_8A49
                bcc     loc_9D8D
                ldaa    <MapValue
                cmpa    byte_8A45
                bcs     loc_9D7E
                cmpa    byte_8A44
                bcc     loc_9D7E
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                cmpa    byte_8A43
                bcs     loc_9D7E
                cmpa    byte_8A42
                bcc     loc_9D7E
                ldaa    <EngineRpm_HB
                cmpa    byte_8A47
                bcs     loc_9D7E
                cmpa    byte_8A46
                bcc     loc_9D7E
                ldaa    <Counter_O2SensorFeedbackCount_Signed
                cmpa    byte_8A48
                bcc     loc_9D7E
                inx
                stx     <EGRVar3_ErrorCodeBufferHB
                bset    <BitFlags6d_t3 $10
                ldab    byte_8A51
                suba    <EGRVar5_EGR_Temp_1
                bcs     loc_9D72
                mul
                adca    #0
                bra     loc_9D77
; ---------------------------------------------------------------------------

loc_9D72:                               ; sub_9CF3+78↑j
                nega
                mul
                adca    #0
                nega

loc_9D77:                               ; sub_9CF3+7D↑j
                adda    <EGRVar5_EGR_Temp_1
                staa    <EGRVar5_EGR_Temp_1
                jmp     loc_9E14
; ---------------------------------------------------------------------------

loc_9D7E:                               ; sub_9CF3:loc_9D1C↑J
                                        ; sub_9CF3+2E↑j ...
                ldx     #Ram_00
                stx     <EGRVar3_ErrorCodeBufferHB
                bclr    <BitFlags6d_t3 $50
                ldaa    <Counter_O2SensorFeedbackCount_Signed
                staa    <EGRVar5_EGR_Temp_1
                jmp     loc_9E14
; ---------------------------------------------------------------------------

loc_9D8D:                               ; sub_9CF3+40↑j
                ldx     #Ram_00
                bset    <BitFlags6d_t3 $40
                bclr    <BitFlags6d_t3 $10
                ldaa    <EGRVar5_EGR_Temp_1
                staa    <EGRVar6
                bra     loc_9DA1
; ---------------------------------------------------------------------------

loc_9D9C:                               ; sub_9CF3+39↑j
                cpx     word_8A53
                bcc     loc_9DE4

loc_9DA1:                               ; sub_9CF3+A7↑j
                inx
                stx     <EGRVar3_ErrorCodeBufferHB
                ldaa    <MapValue
                cmpa    byte_8A4F
                bcs     loc_9D7E
                cmpa    byte_8A50
                bcc     loc_9D7E
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                cmpa    byte_8A4D
                bcs     loc_9D7E
                cmpa    byte_8A4E
                bcc     loc_9D7E
                ldaa    <EngineRpm_HB
                cmpa    byte_8A4B
                bcs     loc_9D7E
                cmpa    byte_8A4C
                bcc     loc_9D7E
                ldaa    <Counter_O2SensorFeedbackCount_Signed
                cmpa    <EGRVar6
                bcs     loc_9E14
                staa    <EGRVar6
                suba    <EGRVar5_EGR_Temp_1
                staa    <EGRVar7
                cmpa    byte_8A52
                bcs     loc_9E14

loc_9DD9:                               ; sub_9CF3+7↑J
                clr     EGRVar1_ErrorCodeCounter
                bset    <BitFlags6d_t3 $80
                bclr    <BitFlags6d_t3 $70
                bra     loc_9E14
; ---------------------------------------------------------------------------

loc_9DE4:                               ; sub_9CF3+AC↑j
                ldx     #Ram_00
                stx     <EGRVar3_ErrorCodeBufferHB
                ldab    <BitFlags6d_t3
                andb    #$AF
                ldaa    <EGRVar1_ErrorCodeCounter
                inca
                staa    <EGRVar1_ErrorCodeCounter
                cmpa    byte_8A55
                bcs     loc_9E06
                orab    #$20
                pshb
                ldd     #$2E81
                jsr     ThrowNonCriticalError
                bcc     loc_9E05
                bset    <b5D_IPL2_t3 8

loc_9E05:                               ; sub_9CF3+10D↑j
                pulb

loc_9E06:                               ; sub_9CF3+102↑j
                ldaa    <EGRVar8
                inca
                staa    <EGRVar8
                cmpa    byte_8A3E
                bcs     loc_9E12
                orab    #$80

loc_9E12:                               ; sub_9CF3+11B↑j
                stab    <BitFlags6d_t3

loc_9E14:                               ; sub_9CF3+88↑J sub_9CF3+97↑J ...
                brset   <BitFlags6d_t3 $40 loc_9E72
                ldaa    <Ram_CC
                beq     loc_9E1F
                dec     Ram_CC

loc_9E1F:                               ; sub_9CF3+127↑j
                brclr   <BitFlags66_t3 $80 loc_9E69
                brset   <BitFlags66_t3 $40 loc_9E69
                ldaa    byte_8817
                brset   <PIA2_Buffer_t3 2 loc_9E35
                suba    byte_8818
                bcc     loc_9E35
                ldaa    #0

loc_9E35:                               ; sub_9CF3+137↑j
                                        ; sub_9CF3+13E↑j
                cmpa    <EngineRpm_HB
                bcs     loc_9E69
                ldaa    <CoolantTemp
                cmpa    byte_8813
                bcs     loc_9E69
                ldaa    <MapValue
                brset   <PIA2_Buffer_t3 2 loc_9E4C
                suba    byte_8811
                bcc     loc_9E4C
                clra

loc_9E4C:                               ; sub_9CF3+14F↑j
                                        ; sub_9CF3+156↑j
                cmpa    byte_8812
                bcs     loc_9E69
                ldaa    <BaroPressure
                suba    byte_8814
                bcc     loc_9E59
                clra

loc_9E59:                               ; sub_9CF3+163↑j
                cmpa    <MapValue
                bcc     loc_9E76
                ldaa    <BaroPressure
                suba    byte_8816
                bcc     loc_9E65
                clra

loc_9E65:                               ; sub_9CF3+16F↑j
                cmpa    <MapValue
                bcc     locret_9E82

loc_9E69:                               ; sub_9CF3:loc_9E1F↑j
                                        ; sub_9CF3+130↑j ...
                brclr   <PIA2_Buffer_t3 2 loc_9E72
                ldaa    byte_8815
                staa    <Ram_CC

loc_9E72:                               ; sub_9CF3:loc_9E14↑j
                                        ; sub_9CF3:loc_9E69↑j
                bclr    <PIA2_Buffer_t3 2
                rts
; ---------------------------------------------------------------------------

loc_9E76:                               ; sub_9CF3+168↑j
                brset   <PIA2_Buffer_t3 2 loc_9E7F
                ldaa    byte_8815
                staa    <Ram_CC

loc_9E7F:                               ; sub_9CF3:loc_9E76↑j
                bset    <PIA2_Buffer_t3 2

locret_9E82:                            ; sub_9CF3+174↑j
                rts
; End of function sub_9CF3


; =============== S U B R O U T I N E =======================================


EmmissionMaintenanceReminder1_MM:       ; __RESET:loc_9A95↑P
                brset   <IPL1 $40 loc_9E8D
                brset   <BitFlags6a_t3 4 loc_9E9A
                bra     loc_9E9F
; ---------------------------------------------------------------------------

loc_9E8D:                               ; EmmissionMaintenanceReminder1_MM↑j
                brset   <BitFlags6a_t3 $40 locret_9ED4
                ldd     $B610
                cpd     #$5AA5
                beq     loc_9E9F

loc_9E9A:                               ; EmmissionMaintenanceReminder1_MM+4↑j
                bclr    <PIA1_Buffer_t3 8
                bra     loc_9EA2
; ---------------------------------------------------------------------------

loc_9E9F:                               ; EmmissionMaintenanceReminder1_MM+8↑j
 IF NOEMR == 0                          ; EmmissionMaintenanceReminder1_MM+15↑j
                bset    <PIA1_Buffer_t3 8
 ELSE
                bclr    <PIA1_Buffer_t3 8
 ENDIF
loc_9EA2:                               ; EmmissionMaintenanceReminder1_MM+1A↑j
                brset   <IPL1 $80 loc_9EA9
                jmp     loc_9F56
; ---------------------------------------------------------------------------

loc_9EA9:                               ; EmmissionMaintenanceReminder1_MM:loc_9EA2↑j
                brset   <BitFlags6a_t3 $40 locret_9ED4
                brclr   <BitFlags6a_t3 $20 loc_9ED5
                jsr     sub_9F79
                stab    DRBOffsetStored_LB
                inc     DRBOffsetStored_HB
                bset    <BitFlags6a_t3 $40
                bclr    <BitFlags6a_t3 $20
                sei
                bclr    <IPL1 $80
                cli
                cpd     #$2757
                beq     loc_9ED1
                cpd     #$3938
                bne     locret_9ED4

loc_9ED1:                               ; EmmissionMaintenanceReminder1_MM+46↑j
                bset    <BitFlags6a_t3 $10

locret_9ED4:                            ; EmmissionMaintenanceReminder1_MM:loc_9E8D↑j
                                        ; EmmissionMaintenanceReminder1_MM:loc_9EA9↑j ...
                rts
; ---------------------------------------------------------------------------

loc_9ED5:                               ; EmmissionMaintenanceReminder1_MM+2A↑j
                ldx     #ErrorBitRegisterStored3
                ldaa    #$30

loc_9EDA:                               ; EmmissionMaintenanceReminder1_MM+63↓j
                brclr   0,x $FF loc_9EE8
                cmpa    0,x
                beq     loc_9F38
                dex
                cpx     #$15
                bcc     loc_9EDA

loc_9EE8:                               ; EmmissionMaintenanceReminder1_MM:loc_9EDA↑j
                ldd     #0000
                std     Temp4
                staa    DRBOffsetStored_HB
                ldx     #$B600
                ldy     #$B60E

loc_9EF8:                               ; EmmissionMaintenanceReminder1_MM+A6↓j
                ldd     0,x
                subd    0,y
                cpd     #1
                bne     loc_9F14
                ldd     0,x
                cpd     Temp4
                bcs     loc_9F14
                std     Temp4
                pshx
                pula
                pula
                staa    DRBOffsetStored_HB

loc_9F14:                               ; EmmissionMaintenanceReminder1_MM+7E↑j
                                        ; EmmissionMaintenanceReminder1_MM+86↑j
                cpx     #$B60E
                beq     loc_9F2B
                inx
                inx
                cpy     #$B60E
                bne     loc_9F25
                ldy     #$B5FE

loc_9F25:                               ; EmmissionMaintenanceReminder1_MM+9C↑j
                iny
                iny
                bra     loc_9EF8
; ---------------------------------------------------------------------------

loc_9F2B:                               ; EmmissionMaintenanceReminder1_MM+94↑j
                ldd     Temp4
                bne     loc_9F3E
                ldd     #$3003
                jsr     ThrowNonCriticalError
                bcc     locret_9F3D

loc_9F38:                               ; EmmissionMaintenanceReminder1_MM+5D↑j
                sei
                bclr    <IPL1 $80
                cli

locret_9F3D:                            ; EmmissionMaintenanceReminder1_MM+B3↑j
                rts
; ---------------------------------------------------------------------------

loc_9F3E:                               ; EmmissionMaintenanceReminder1_MM+AB↑j
                ldaa    DRBOffsetStored_HB
                adda    #$02
                cmpa    #$10
                bne     loc_9F49
                ldaa    #$00

loc_9F49:                               ; EmmissionMaintenanceReminder1_MM+C2↑j
                staa    DRBOffsetStored_HB
                jsr     sub_9F79
                staa    DRBOffsetStored_LB
                bset    <BitFlags6a_t3 $60

locret_9F55:                            ; EmmissionMaintenanceReminder1_MM:loc_9F56↓j
                                        ; EmmissionMaintenanceReminder1_MM+D7↓j
                rts
; ---------------------------------------------------------------------------

loc_9F56:                               ; EmmissionMaintenanceReminder1_MM+23↑J
                brclr   <BitFlags6a_t3 $10 locret_9F55
                brset   <BitFlags6a_t3 $40 locret_9F55
                ldd     #$105A
                brclr   <BitFlags6a_t3 $20 loc_9F6F
                inca
                comb
                bclr    <BitFlags6a_t3 $30
                bset    <BitFlags6a_t3 $40
                bra     loc_9F72
; ---------------------------------------------------------------------------

loc_9F6F:                               ; EmmissionMaintenanceReminder1_MM+DE↑j
                bset    <BitFlags6a_t3 $60

loc_9F72:                               ; EmmissionMaintenanceReminder1_MM+EA↑j
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB
                rts
; End of function EmmissionMaintenanceReminder1_MM


; =============== S U B R O U T I N E =======================================


sub_9F79:                               ; EmmissionMaintenanceReminder1_MM+2E↑P
                                        ; EmmissionMaintenanceReminder1_MM+C9↑P
                ldx     #$B600
                ldab    DRBOffsetStored_HB
                subb    #02
                bpl     loc_9F85
                ldab    #$0E

loc_9F85:                               ; sub_9F79+8↑j
                abx
                ldd     0,x
                addd    #$01
                bcc     locret_9F90
                ldd     #$FFFF

locret_9F90:                            ; sub_9F79+12↑j
                rts
; End of function sub_9F79


; =============== S U B R O U T I N E =======================================


sub_9F91:                               ; __RESET+5AC↑P
                ldaa    TL_ConfigurationFlags2
                bita    #$80
                bne     loc_9F9B

loc_9F98:                               ; sub_9F91+18↓j
                jmp     loc_A03F
; ---------------------------------------------------------------------------

loc_9F9B:                               ; sub_9F91+5↑j
                brset   <StartupSwitchMirror1 1 loc_A01C
                ldab    <b5d_IPL2
                bitb    #$80
                beq     loc_9FAB
                bita    #$20
                bne     loc_A01C
                bra     loc_9F98
; ---------------------------------------------------------------------------

loc_9FAB:                               ; sub_9F91+12↑j
                ldaa    byte_882A
                brset   <BitFlags2a $40 loc_9FB5
                adda    byte_882B

loc_9FB5:                               ; sub_9F91+1D↑j
                cmpa    <VehicleSpeedx8_Scaled
                bcc     loc_A019
                bset    <BitFlags2a $40
                ldaa    <CoolantTemp
                cmpa    byte_8827
                bcs     loc_A01C
                ldaa    byte_882D
                brset   <PIA1_Buffer_t3 $10 loc_9FCC
                adda    #4

loc_9FCC:                               ; sub_9F91+35↑j
                cmpa    <ScaledDistPWForCruiseControl
                bcs     loc_A01C
                brclr   <BitFlags68_t3 $10 loc_A01C
                ldaa    <EngineRpm_HB
                cmpa    byte_8829
                bcs     loc_9FEF
                brclr   <Ram_D0 $FF loc_9FEF
                ldaa    <Counter_MainLoop
                bita    #7
                bne     loc_9FEA
                dec     Ram_D0
                beq     loc_9FEF

loc_9FEA:                               ; sub_9F91+52↑j
                ldx     #byte_885C
                bra     loc_9FF5
; ---------------------------------------------------------------------------

loc_9FEF:                               ; sub_9F91+48↑j sub_9F91+4A↑j ...
                ldx     #byte_8845
                clr     Ram_D0

loc_9FF5:                               ; sub_9F91+5C↑j
                ldaa    <EngineRpm_HB
                jsr     Lookup4ByteTable
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                cba
                bcs     loc_A02D
                ldx     #byte_882E
                ldaa    <EngineRpm_HB
                jsr     Lookup4ByteTable
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                cba
                bcc     loc_A012
                brclr   <PIA1_Buffer_t3 $10 loc_A03F
                bra     loc_A01F
; ---------------------------------------------------------------------------

loc_A012:                               ; sub_9F91+79↑j
                ldaa    byte_8828
                staa    <Ram_D0
                bra     loc_A01F
; ---------------------------------------------------------------------------

loc_A019:                               ; sub_9F91+26↑j
                bclr    <BitFlags2a $40

loc_A01C:                               ; sub_9F91:loc_9F9B↑j
                                        ; sub_9F91+16↑j ...
                clr     Ram_D0

loc_A01F:                               ; sub_9F91+7F↑j sub_9F91+86↑j
                ldaa    byte_882C
                staa    <Ram_D1

loc_A024:                               ; sub_9F91+A4↓j sub_9F91+A9↓j
                bset    <PIA1_Buffer_t3 $10
                clr     Ram_D3

loc_A02A:                               ; sub_9F91+DA↓j sub_9F91+E4↓j ...
                jmp     loc_A11C
; ---------------------------------------------------------------------------

loc_A02D:                               ; sub_9F91+6C↑j
                ldaa    <Ram_D1
                beq     loc_A03C
                ldab    <Counter_MainLoop
                bitb    #7
                bne     loc_A024
                deca
                staa    <Ram_D1
                bne     loc_A024

loc_A03C:                               ; sub_9F91+9E↑j
                bclr    <PIA1_Buffer_t3 $10

loc_A03F:                               ; sub_9F91:loc_9F98↑J
                                        ; sub_9F91+7B↑j
                ldaa    TL_ConfigurationFlags2
                bita    #$40
                bne     loc_A049
                jmp     locret_A0DA
; ---------------------------------------------------------------------------

loc_A049:                               ; sub_9F91+B3↑j
                ldaa    <Counter_MainLoop
                bita    #1
                bne     loc_A059
                ldaa    <Ram_D3
                cmpa    byte_887C
                beq     loc_A059
                inca
                staa    <Ram_D3

loc_A059:                               ; sub_9F91+BC↑j sub_9F91+C3↑j
                ldaa    <PTU_MapTemp
                staa    Temp5
                ldaa    <Counter_MainLoop
                anda    byte_8874
                bne     loc_A069
                ldaa    <MapValue
                staa    <PTU_MapTemp

loc_A069:                               ; sub_9F91+D2↑j
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                beq     loc_A02A
                staa    Temp3
                ldaa    <CoolantTemp
                cmpa    byte_8873
                bcs     loc_A02A
                brclr   <BitFlags68_t3 $10 loc_A02A
                brclr   <BitFlags66_t3 $80 loc_A02A
                brset   <StartupSwitchMirror1 $20 loc_A02A
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    byte_8875
                bcc     loc_A099
                ldaa    <MapValue
                suba    Temp5
                bcs     loc_A099
                cmpa    byte_8876
                bcs     loc_A0C8
                jmp     loc_A11C
; ---------------------------------------------------------------------------

loc_A099:                               ; sub_9F91+F7↑j sub_9F91+FE↑j
                ldaa    Temp5
                suba    <MapValue
                bcs     loc_A0C8
                staa    Temp5
                ldx     #word_8878
                brset   <BitFlags2a $20 loc_A0BF
                brset   <BitFlags2a $10 loc_A0BE
                ldaa    Temp3
                cmpa    byte_8877
                bcs     loc_A0BB
                bset    <BitFlags2a $20
                bra     loc_A0BF
; ---------------------------------------------------------------------------

loc_A0BB:                               ; sub_9F91+123↑j
                bset    <BitFlags2a $10

loc_A0BE:                               ; sub_9F91+119↑j
                inx

loc_A0BF:                               ; sub_9F91+115↑j
                                        ; sub_9F91+128↑j
                ldab    Temp5
                cmpb    0,x
                bcc     loc_A11C
                bra     loc_A0CB
; ---------------------------------------------------------------------------

loc_A0C8:                               ; sub_9F91+103↑j
                                        ; sub_9F91+10D↑j
                bclr    <BitFlags2a $30

loc_A0CB:                               ; sub_9F91+135↑j
                ldaa    <Counter_PartThrottleUnlock
                cmpa    #1
                bls     loc_A0DB
                ldab    <Counter_MainLoop
                bitb    #7
                bne     locret_A0DA
                deca
                staa    <Counter_PartThrottleUnlock

locret_A0DA:                            ; sub_9F91+B5↑J sub_9F91+144↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A0DB:                               ; sub_9F91+13E↑j
                ldx     #byte_889B
                brclr   <PIA1_Buffer_t3 $20 loc_A0E5
                ldx     #byte_887D

loc_A0E5:                               ; sub_9F91+14D↑j
                stx     Temp4
                bsr     sub_A126
                bcc     loc_A11C
                ldx     Temp4
                ldab    #$F
                abx
                bsr     sub_A126
                bcs     loc_A11C
                ldaa    <Counter_PartThrottleUnlock
                beq     loc_A10C
                ldaa    TL_ConfigurationFlags2
                bita    #$80
                beq     loc_A108
                ldaa    <Ram_D3
                cmpa    byte_887C
                bcs     locret_A0DA

loc_A108:                               ; sub_9F91+16E↑j
                bclr    <PIA1_Buffer_t3 $20
                rts
; ---------------------------------------------------------------------------

loc_A10C:                               ; sub_9F91+167↑j
                ldaa    <VehicleSpeedx8_Scaled
                ldab    byte_887A
                cmpa    byte_8875
                bcc     loc_A119
                ldab    byte_887B

loc_A119:                               ; sub_9F91+183↑j
                stab    <Counter_PartThrottleUnlock
                rts
; ---------------------------------------------------------------------------

loc_A11C:                               ; sub_9F91:loc_A02A↑J
                                        ; sub_9F91+105↑J ...
                clr     Counter_PartThrottleUnlock
                bset    <PIA1_Buffer_t3 $20
                bclr    <BitFlags2a $30
                rts
; End of function sub_9F91


; =============== S U B R O U T I N E =======================================


sub_A126:                               ; sub_9F91+157↑p
                                        ; sub_9F91+161↑p
                ldaa    <VehicleSpeedx8_Scaled
                jsr     Lookup4ByteTable
                ldaa    Temp3
                cba
                rts
; End of function sub_A126


; =============== S U B R O U T I N E =======================================


sub_A130:                               ; __RESET+5E6↑P
                ldaa    TL_ConfigurationFlags2
                bita    #$20
                beq     locret_A142
                ldaa    TL_CONF01
                bita    #1
                beq     locret_A142
                brclr   <Counter_MainLoop 2 loc_A143

locret_A142:                            ; sub_A130+5↑j sub_A130+C↑j
                rts
; ---------------------------------------------------------------------------

loc_A143:                               ; sub_A130+E↑j
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    #$82
                bcc     loc_A174
                cmpa    byte_88B9
                bcs     loc_A174
                brset   <BitFlags2a 4 loc_A174
                ldaa    <ScaledDistPWForCruiseControl
                cmpa    byte_88BA
                bcc     loc_A174
                cmpa    byte_88BB
                bcs     loc_A174
                ldab    <Counter_MainLoop
                bne     loc_A177
                ldab    <Ram_D0
                incb
                beq     loc_A16E
                stab    <Ram_D0
                cmpb    byte_88BC
                bcs     loc_A177

loc_A16E:                               ; sub_A130+35↑j
                cmpa    <Ram_0C
                bcc     loc_A174
                staa    <Ram_0C

loc_A174:                               ; sub_A130+17↑j sub_A130+1C↑j ...
                clr     Ram_D0

loc_A177:                               ; sub_A130+30↑j sub_A130+3C↑j
                ldaa    <EngineRpm_HB
                cmpa    #$F
                bcs     loc_A1A6
                ldab    <ScaledDistPWForCruiseControl
                subb    <PTU_MapTemp
                bcc     loc_A184
                negb

loc_A184:                               ; sub_A130+51↑j
                cmpb    byte_88BD
                bcs     loc_A191
                bset    <BitFlags2a 4
                clr     Ram_D1
                bra     loc_A1B5
; ---------------------------------------------------------------------------

loc_A191:                               ; sub_A130+57↑j
                brclr   <BitFlags2a 4 loc_A1A9
                cmpb    byte_88BE
                bcc     loc_A1A9
                ldaa    <Ram_D1
                inca
                beq     loc_A1A6
                staa    <Ram_D1
                cmpa    byte_88BF
                bcs     loc_A1AC

loc_A1A6:                               ; sub_A130+4B↑j sub_A130+6D↑j
                bclr    <BitFlags2a 4

loc_A1A9:                               ; sub_A130:loc_A191↑j
                                        ; sub_A130+68↑j
                clr     Ram_D1

loc_A1AC:                               ; sub_A130+74↑j
                ldaa    <Counter_MainLoop
                lsra
                lsra
                bita    byte_88C0
                bne     loc_A1B9

loc_A1B5:                               ; sub_A130+5F↑j
                ldaa    <ScaledDistPWForCruiseControl
                staa    <PTU_MapTemp

loc_A1B9:                               ; sub_A130+83↑j
                brset   <IPL1 $40 loc_A1C3
                brset   <BitFlags6a_t3 4 loc_A1C3
                bra     loc_A220
; ---------------------------------------------------------------------------

loc_A1C3:                               ; sub_A130:loc_A1B9↑j
                                        ; sub_A130+8D↑j
                brclr   <BitFlags66_t3 $80 loc_A214
                brclr   <BitFlags66_t3 $40 loc_A1D2
                ldaa    <EngineRpm_HB
                cmpa    byte_88C1
                bcc     loc_A214

loc_A1D2:                               ; sub_A130+97↑j
                ldaa    <ScaledDistPWForCruiseControl
                suba    <Ram_0C
                bcs     loc_A214
                cmpa    byte_88C2
                bcs     loc_A214
                ldx     #byte_88C3
                ldaa    <MapValue
                jsr     sub_E3AA
                ldaa    <EngineRpm_HB
                cba
                bcc     loc_A1FA
                brset   <PIA1_Buffer_t3 $20 loc_A214
                subb    byte_88CC
                bcc     loc_A1F5
                ldab    #0

loc_A1F5:                               ; sub_A130+C1↑j
                cba
                bcc     loc_A206
                bra     loc_A214
; ---------------------------------------------------------------------------

loc_A1FA:                               ; sub_A130+B8↑j
                ldaa    <Ram_D3
                inca
                beq     loc_A206
                staa    <Ram_D3
                cmpa    byte_88CD
                bcs     loc_A21A

loc_A206:                               ; sub_A130+C6↑j sub_A130+CD↑j
                ldaa    <Counter_PartThrottleUnlock
                inca
                beq     loc_A21A
                staa    <Counter_PartThrottleUnlock
                cmpa    byte_88CE
                bhi     loc_A21A
                bra     loc_A220
; ---------------------------------------------------------------------------

loc_A214:                               ; sub_A130:loc_A1C3↑j
                                        ; sub_A130+A0↑j ...
                clr     Ram_D3
                clr     Counter_PartThrottleUnlock

loc_A21A:                               ; sub_A130+D4↑j sub_A130+D9↑j ...
                ldab    <PIA1_Buffer_t3
                orab    #$20
                bra     loc_A224
; ---------------------------------------------------------------------------

loc_A220:                               ; sub_A130+91↑j sub_A130+E2↑j
                ldab    <PIA1_Buffer_t3
                andb    #$DF

loc_A224:                               ; sub_A130+EE↑j
                stab    <PIA1_Buffer_t3
                rts
; End of function sub_A130


; =============== S U B R O U T I N E =======================================


sub_A227:                               ; __RESET:loc_9A42↑P
                ldaa    TL_ConfigurationFlags2
                bita    #8
                beq     locret_A24B
                ldaa    <CoolantTemp
                cmpa    byte_881A
                bcc     loc_A245
                cmpa    byte_8819
                bcs     loc_A23E
                brset   <BitFlags2a $80 loc_A245

loc_A23E:                               ; sub_A227+11↑j
                bclr    <BitFlags2a $80
                bclr    <PIA2_Buffer_t3 $20
                rts
; ---------------------------------------------------------------------------

loc_A245:                               ; sub_A227+C↑j sub_A227+13↑j
                bset    <BitFlags2a $80
                bset    <PIA2_Buffer_t3 $20

locret_A24B:                            ; sub_A227+5↑j
                rts
; End of function sub_A227


; =============== S U B R O U T I N E =======================================


sub_A24C:                               ; __RESET+5D5↑P
                ldaa    TL_ConfigurationFlags2
                bita    #$10
                beq     locret_A25E
                brset   <BitFlags29 $40 loc_A25B
                bclr    <PIA2_Buffer_t3 4
                rts
; ---------------------------------------------------------------------------

loc_A25B:                               ; sub_A24C+7↑j
                bset    <PIA2_Buffer_t3 4

locret_A25E:                            ; sub_A24C+5↑j
                rts
; End of function sub_A24C


; =============== S U B R O U T I N E =======================================


sub_A25F:                               ; __RESET+5E9↑P
                ldaa    TL_CONF01
                bita    #8
                bne     locret_A2B5
                ldaa    TL_ConfigurationFlags2
                bita    #4
                beq     locret_A2B5
                brclr   <IPL1 $40 loc_A2B2
                ldaa    <Counter_MainLoop
                anda    #$7F
                bne     locret_A2B5
                brset   <b5C_IPL1_t3 2 loc_A2AD
                ldaa    <BitFlags27
                bita    #$C0
                beq     loc_A285
                brclr   <PIA2_Buffer_t3 1 loc_A2AD

loc_A285:                               ; sub_A25F+20↑j
                ldx     #word_881D
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    byte_881B
                bcc     loc_A29F
                cmpa    byte_881C
                bcs     loc_A298
                brset   <BitFlags2a 8 loc_A29F

loc_A298:                               ; sub_A25F+33↑j
                inx
                inx
                bclr    <BitFlags2a 8
                bra     loc_A2A2
; ---------------------------------------------------------------------------

loc_A29F:                               ; sub_A25F+2E↑j sub_A25F+35↑j
                bset    <BitFlags2a 8

loc_A2A2:                               ; sub_A25F+3E↑j
                brset   <PIA1_Buffer_t3 $80 loc_A2A7
                inx

loc_A2A7:                               ; sub_A25F:loc_A2A2↑j
                ldab    0,x
                cmpb    <CoolantTemp
                bcc     loc_A2B2

loc_A2AD:                               ; sub_A25F+18↑j sub_A25F+22↑j
                bclr    <PIA1_Buffer_t3 $80
                bra     locret_A2B5
; ---------------------------------------------------------------------------

loc_A2B2:                               ; sub_A25F+E↑j sub_A25F+4C↑j
                bset    <PIA1_Buffer_t3 $80

locret_A2B5:                            ; sub_A25F+5↑j sub_A25F+C↑j ...
                rts
; End of function sub_A25F


; =============== S U B R O U T I N E =======================================


sub_A2B6:                               ; __RESET+59D↑P
                brclr   <IPL1 $40 loc_A2C3
                ldaa    <Timer_AisChanges
                inca
                beq     loc_A2C6
                staa    <Timer_AisChanges
                bra     loc_A2C6
; ---------------------------------------------------------------------------

loc_A2C3:                               ; sub_A2B6↑j
                clr     Timer_AisChanges

loc_A2C6:                               ; sub_A2B6+7↑j sub_A2B6+B↑j
                brset   <BitFlags68_t3 $80 loc_A2D2
                brclr   <BitFlags6d_t3 8 loc_A2D5
                ldaa    #$30
                bra     loc_A34D
; ---------------------------------------------------------------------------

loc_A2D2:                               ; sub_A2B6:loc_A2C6↑j
                jmp     loc_A352
; ---------------------------------------------------------------------------

loc_A2D5:                               ; sub_A2B6+14↑j
                ldx     #byte_8711
                brset   <BitFlags68_t3 $10 loc_A324
                ldaa    <DRBPointer1
                cmpa    #$19
                beq     loc_A2F4
                brclr   <BitFlags6d_t3 1 loc_A304
                ldd     <TargetIdleSpeedHB
                subd    #1
                bitb    #$3F
                bne     loc_A350
                bclr    <BitFlags6d_t3 1
                bra     loc_A350
; ---------------------------------------------------------------------------

loc_A2F4:                               ; sub_A2B6+2A↑j
                brset   <DRBSerialMode $20 loc_A352
                clr     DRBPointer1
                ldaa    <DRBPointer2
                ldab    #$FF
                bset    <BitFlags6d_t3 1
                bra     loc_A34E
; ---------------------------------------------------------------------------

loc_A304:                               ; sub_A2B6+2C↑j
                brclr   <BitFlags2d 4 loc_A316
                brclr   <IPL1 $40 loc_A316
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    #8
                bcs     loc_A316
                ldaa    #$70
                bra     loc_A34D
; ---------------------------------------------------------------------------

loc_A316:                               ; sub_A2B6:loc_A304↑j
                                        ; sub_A2B6+52↑j ...
                ldaa    byte_8730
                brset   <BitFlags2a 1 loc_A34D
                brset   <b5C_IPL1_t3 2 loc_A34D
                ldx     #byte_86FE

loc_A324:                               ; sub_A2B6+22↑j
                ldaa    <CoolantTemp
                jsr     Lookup4ByteTable
                brset   <KeyOnOrEngineRunningTime $FF loc_A33C
                psha
                ldaa    <KeyOnOrEngineRunningTime
                ldx     #byte_8724
                jsr     Lookup4ByteTable
                pulb
                aba
                bcc     loc_A33C
                ldaa    #$FF

loc_A33C:                               ; sub_A2B6+73↑j sub_A2B6+82↑j
                ldab    <BitFlags27
                bitb    #$C0
                beq     loc_A34D
                brclr   <StartupSwitchMirror1 $40 loc_A34D
                ldab    byte_872F
                cba
                bcc     loc_A34D
                tba

loc_A34D:                               ; sub_A2B6+1A↑j sub_A2B6+5E↑j ...
                clrb

loc_A34E:                               ; sub_A2B6+4C↑j
                lsrd
                lsrd

loc_A350:                               ; sub_A2B6+37↑j sub_A2B6+3C↑j
                std     <TargetIdleSpeedHB

loc_A352:                               ; sub_A2B6:loc_A2D2↑J
                                        ; sub_A2B6:loc_A2F4↑j
                ldaa    <ATMOffset
                cmpa    #7
                beq     locret_A39C
                cmpa    #$14
                beq     locret_A39C
                brset   <BitFlags36_t3 $20 loc_A364
                brset   <IPL1 $40 loc_A38C

loc_A364:                               ; sub_A2B6+A6↑j
                ldaa    <DesiredNewAisPosition
                cmpa    <CurrentAisPosition
                bne     loc_A371
                brset   <BitFlags36_t3 $40 loc_A371
                bclr    <BitFlags36_t3 $20

loc_A371:                               ; sub_A2B6+B2↑j sub_A2B6+B4↑j
                ldaa    <CoolantTemp
                ldx     #TL_AisStartupPosition_FromTemp
                jsr     Lookup4ByteTable
                psha
                ldaa    <BaroPressure
                ldx     #byte_869B
                jsr     Lookup4ByteTable
                pulb
                aba
                bcc     loc_A389
                jmp     loc_A4F9
; ---------------------------------------------------------------------------

loc_A389:                               ; sub_A2B6+CE↑j
                jmp     loc_A4EB
; ---------------------------------------------------------------------------

loc_A38C:                               ; sub_A2B6+AA↑j
                brclr   <b5C_IPL1_t3 $88 loc_A3A1
                ldaa    byte_8A3D
                staa    <DesiredNewAisPosition
                brclr   <BitFlags68_t3 $40 loc_A39D
                bset    <BitFlags68_t3 $C

locret_A39C:                            ; sub_A2B6+A0↑j sub_A2B6+A4↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A39D:                               ; sub_A2B6+DF↑j
                bclr    <BitFlags68_t3 $C
                rts
; ---------------------------------------------------------------------------

loc_A3A1:                               ; sub_A2B6:loc_A38C↑j
                jsr     sub_A531
                dex
                bne     loc_A3A8
                rts
; ---------------------------------------------------------------------------

loc_A3A8:                               ; sub_A2B6+EF↑j
                brclr   <BitFlags68_t3 2 loc_A3DE
                ldx     #byte_875A
                ldaa    <BaroPressure
                brclr   <StartupSwitchMirror1 1 loc_A3B8
                ldx     #byte_8764

loc_A3B8:                               ; sub_A2B6+FB↑j
                jsr     sub_E3AA
                tba
                brclr   <StartupSwitchMirror1 1 loc_A3CA
                nega
                brclr   <BitFlags2d $20 loc_A3DA
                bclr    <BitFlags2d $20
                bra     loc_A3D4
; ---------------------------------------------------------------------------

loc_A3CA:                               ; sub_A2B6+106↑j
                ldab    <EngineRpm_HB
                cmpb    byte_8763
                bcc     loc_A3DA
                bset    <BitFlags2d $20

loc_A3D4:                               ; sub_A2B6+112↑j
                jsr     sub_A517
                clra
                staa    <Timer_AisChanges

loc_A3DA:                               ; sub_A2B6+10B↑j
                                        ; sub_A2B6+119↑j
                bclr    <BitFlags68_t3 2
                rts
; ---------------------------------------------------------------------------

loc_A3DE:                               ; sub_A2B6:loc_A3A8↑j
                brclr   <BitFlags66_t3 $80 loc_A3F9
                brset   <BitFlags27 1 loc_A3E9
                bclr    <BitFlags68_t3 $80

loc_A3E9:                               ; sub_A2B6+12C↑j
                brclr   <StartupSwitchMirror1 $20 loc_A3FD
                ldx     #TL_BrakeOverrideForAis_FromDeltaThrottle
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                jsr     Lookup4ByteTable
                cmpa    <EngineRpm_HB
                bcc     loc_A3FD

loc_A3F9:                               ; sub_A2B6:loc_A3DE↑j
                brclr   <BitFlags66_t3 $20 loc_A400

loc_A3FD:                               ; sub_A2B6:loc_A3E9↑j
                                        ; sub_A2B6+141↑j
                jmp     loc_A465
; ---------------------------------------------------------------------------

loc_A400:                               ; sub_A2B6:loc_A3F9↑j
                brset   <BitFlags66_t3 4 locret_A39C
                ldab    <Timer_CountdownFromStartRunForAisFeedback
                bne     locret_A39C
                ldaa    <DesiredNewAisPosition
                cmpa    #4
                bcs     loc_A411
                bclr    <BitFlags36_t3 $10

loc_A411:                               ; sub_A2B6+156↑j
                brclr   <BitFlags68_t3 $80 loc_A42D
                ldx     #byte_8773
                brclr   <StartupSwitchMirror1 $10 loc_A41F
                ldx     #byte_877E

loc_A41F:                               ; sub_A2B6+162↑j
                ldaa    <CoolantTemp
                jsr     Lookup4ByteTable
                jsr     sub_A517
                clra
                staa    <Timer_AisChanges
                bclr    <BitFlags68_t3 $80

loc_A42D:                               ; sub_A2B6:loc_A411↑j
                ldab    byte_876D
                cmpb    <Timer_AisChanges
                bcc     locret_A464
                ldx     #byte_8731
                ldd     <TargetIdleSpeedHB
                subd    <EngineRpm_HB
                bcc     loc_A444
                ldx     #byte_8744
                ldd     <EngineRpm_HB
                subd    <TargetIdleSpeedHB

loc_A444:                               ; sub_A2B6+185↑j
                lsrd
                lsrd
                brset   <BitFlags27 1 loc_A44E
                brset   <BitFlags68_t3 $10 loc_A44F

loc_A44E:                               ; sub_A2B6+190↑j
                lsrd

loc_A44F:                               ; sub_A2B6+194↑j
                tsta
                beq     loc_A454
                ldab    #$FF

loc_A454:                               ; sub_A2B6+19A↑j
                tba
                cmpa    1,x
                bcs     locret_A464
                jsr     Lookup4ByteTable
                beq     locret_A464
                jsr     sub_A517
                clra
                staa    <Timer_AisChanges

locret_A464:                            ; sub_A2B6+17C↑j
                                        ; sub_A2B6+1A1↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A465:                               ; sub_A2B6:loc_A3FD↑J
                ldaa    <CoolantTemp
                ldx     #TL_AisColdPosition_FromTemp
                jsr     Lookup4ByteTable
                staa    Temp5
                ldaa    <KeyOnOrEngineRunningTime
                ldx     #byte_86CA
                jsr     Lookup4ByteTable
                adda    Temp5
                bcc     loc_A480
                jmp     loc_A4F9
; ---------------------------------------------------------------------------

loc_A480:                               ; sub_A2B6+1C5↑j
                staa    Temp5
                ldaa    <BaroPressure
                ldx     #byte_86F3
                jsr     Lookup4ByteTable
                ldaa    Temp5
                mul
                lsld
                bcs     loc_A4F9
                lsld
                bcs     loc_A4F9
                staa    Temp5
                ldx     #TL_AisPosition_FromRpm
                ldaa    <EngineRpm_HB
                jsr     Lookup4ByteTable
                cmpa    Temp5
                bcs     loc_A4A8
                staa    Temp5

loc_A4A8:                               ; sub_A2B6+1ED↑j
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                ldx     #TL_AisPosition_FromThrottle
                jsr     Lookup4ByteTable
                cmpa    Temp5
                bcc     loc_A4B8
                ldaa    Temp5

loc_A4B8:                               ; sub_A2B6+1FD↑j
                brset   <BitFlags68_t3 4 loc_A4E2
                ldab    TL_ACPositionWhenTempToCold
                brset   <BitFlags66_t3 $20 loc_A4DF
                psha
                ldaa    <CoolantTemp
                cmpa    TL_Use_ACCTBL_WhenTempAboveThisElseUse_ACPOS
                bcs     loc_A4DE
                ldx     #TL_ACOffIdleDelta_FromSpeed
                ldaa    <VehicleSpeedx8_Scaled
                jsr     Lookup4ByteTable
                brclr   <BitFlags68_t3 8 loc_A4DE
                ldaa    TL_AcClutchAisAdjustmentConstant
                mul
                adca    #0
                tab

loc_A4DE:                               ; sub_A2B6+213↑j
                                        ; sub_A2B6+21D↑j
                pula

loc_A4DF:                               ; sub_A2B6+209↑j
                aba
                bcs     loc_A4F9

loc_A4E2:                               ; sub_A2B6:loc_A4B8↑j
                brset   <BitFlags68_t3 $10 loc_A4EB
                adda    TL_AISAddedFromTimeEngRunning
                bcs     loc_A4F9

loc_A4EB:                               ; sub_A2B6:loc_A389↑J
                                        ; sub_A2B6:loc_A4E2↑j
                brset   <BitFlags36_t3 $10 loc_A4F4
                adda    byte_8772
                bcs     loc_A4F9

loc_A4F4:                               ; sub_A2B6:loc_A4EB↑j
                cmpa    byte_876E
                bcs     loc_A4FC

loc_A4F9:                               ; sub_A2B6+D0↑J sub_A2B6+1C7↑J ...
                ldaa    byte_876E

loc_A4FC:                               ; sub_A2B6+241↑j
                brset   <BitFlags66_t3 $20 loc_A511
                cmpa    <DesiredNewAisPosition
                bcc     loc_A50E
                ldab    <Counter_MainLoop
                bitb    byte_8771
                bne     locret_A510
                ldaa    <DesiredNewAisPosition
                deca

loc_A50E:                               ; sub_A2B6+24C↑j
                staa    <DesiredNewAisPosition

locret_A510:                            ; sub_A2B6+253↑j
                rts
; ---------------------------------------------------------------------------

loc_A511:                               ; sub_A2B6:loc_A4FC↑j
                bclr    <BitFlags66_t3 $20
                staa    <DesiredNewAisPosition
                rts
; End of function sub_A2B6


; =============== S U B R O U T I N E =======================================


sub_A517:                               ; sub_A2B6:loc_A3D4↑P
                                        ; sub_A2B6+16E↑P ...
                inx
                tsta
                bmi     loc_A529
                adda    <DesiredNewAisPosition
                ldab    byte_876E
                bcs     loc_A525
                cba
                bcs     loc_A526

loc_A525:                               ; sub_A517+9↑j
                tba

loc_A526:                               ; sub_A517+C↑j
                staa    <DesiredNewAisPosition
                rts
; ---------------------------------------------------------------------------

loc_A529:                               ; sub_A517+2↑j
                adda    <DesiredNewAisPosition
                bcs     loc_A52E
                clra

loc_A52E:                               ; sub_A517+14↑j
                staa    <DesiredNewAisPosition
                rts
; End of function sub_A517


; =============== S U B R O U T I N E =======================================


sub_A531:                               ; sub_A2B6:loc_A3A1↑P
                ldx     #Ram_00
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
                bne     loc_A565
                brset   <BitFlags68_t3 4 loc_A5B3
                ldaa    <Timer_AisOrO2Sensor
                beq     loc_A561
                clrb
                stab    <Timer_AisChanges
                deca
                staa    <Timer_AisOrO2Sensor
                bne     loc_A5B3
                brset   <BitFlags66_t3 $80 loc_A561
                ldaa    byte_8758
                bsr     sub_A517

loc_A561:                               ; sub_A531+1D↑j sub_A531+27↑j
                bclr    <BitFlags68_t3 8
                rts
; ---------------------------------------------------------------------------

loc_A565:                               ; sub_A531+15↑j
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    byte_880E
                bcs     loc_A5B3
                eorb    <BitFlags68_t3
                stab    <BitFlags68_t3
                bitb    #4
                bne     loc_A58C
                ldaa    byte_86A8
                staa    <Timer_AisOrO2Sensor
                brset   <BitFlags66_t3 $80 loc_A583
                ldaa    byte_8757
                jsr     sub_A517

loc_A583:                               ; sub_A531+48↑j
                ldaa    <Timer_AisOrO2Sensor
                beq     loc_A5B0
                deca
                staa    <Timer_AisOrO2Sensor
                bra     loc_A5B0
; ---------------------------------------------------------------------------

loc_A58C:                               ; sub_A531+41↑j
                brset   <BitFlags66_t3 $80 loc_A598
                ldaa    byte_8759
                jsr     sub_A517
                bra     loc_A5AD
; ---------------------------------------------------------------------------

loc_A598:                               ; sub_A531:loc_A58C↑j
                ldx     #TL_ACOffIdleDelta_FromSpeed
                ldaa    <VehicleSpeedx8_Scaled
                jsr     Lookup4ByteTable
                ldab    byte_86AA
                mul
                tab
                ldaa    <DesiredNewAisPosition
                sba
                bcc     loc_A5AB
                clra

loc_A5AB:                               ; sub_A531+77↑j
                staa    <DesiredNewAisPosition

loc_A5AD:                               ; sub_A531+65↑j
                clra
                staa    <Timer_AisOrO2Sensor

loc_A5B0:                               ; sub_A531+54↑j sub_A531+59↑j
                clra
                staa    <Timer_AisChanges

loc_A5B3:                               ; sub_A531+17↑j sub_A531+25↑j ...
                bset    <BitFlags68_t3 8
                rts
; End of function sub_A531


; =============== S U B R O U T I N E =======================================


sub_A5B7:                               ; __RESET+5A0↑P
                brclr   <IPL1 $40 locret_A5CD
                brset   <BitFlags36_t3 $20 locret_A5CD
                brset   <BitFlags66_t3 $80 locret_A5CD
                ldaa    <b5C_IPL1_t3
                bita    #$88
                bne     locret_A5CD
                ldaa    <TimerOverflowsBetweenCamPulses
                beq     loc_A5CE

locret_A5CD:                            ; sub_A5B7↑j sub_A5B7+4↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A5CE:                               ; sub_A5B7+14↑j
                ldaa    <Timer_DacalCountdown
                lsra
                lsra
                adda    byte_8801
                bcs     loc_A617
                psha
                ldx     #byte_8789
                ldaa    <BaroPressure
                jsr     Lookup4ByteTable
                pula
                aslb
                bcc     loc_A5EC
                clc
                lsrb
                sba
                bcc     loc_A5F0
                clra
                bra     loc_A5F0
; ---------------------------------------------------------------------------

loc_A5EC:                               ; sub_A5B7+2B↑j
                lsrb
                aba
                bcs     loc_A617

loc_A5F0:                               ; sub_A5B7+30↑j sub_A5B7+33↑j
                brclr   <BitFlags66_t3 4 loc_A619
                psha
                ldx     #byte_879C
                ldaa    <KeyOnOrEngineRunningTime
                jsr     Lookup4ByteTable
                pula
                aba
                bcs     loc_A617
                psha
                ldx     #byte_87A7
                ldaa    <CoolantTemp
                jsr     Lookup4ByteTable
                pulb
                aba
                bcs     loc_A617
                brset   <PIA2_Buffer_t3 1 loc_A619
                adda    byte_8800
                bcc     loc_A619

loc_A617:                               ; sub_A5B7+1E↑j sub_A5B7+37↑j ...
                ldaa    #$FF

loc_A619:                               ; sub_A5B7:loc_A5F0↑j
                                        ; sub_A5B7+57↑j ...
                ldab    <DistributorFallingEdgePulsewidth_HB
                aslb
                bcs     loc_A621
                aslb
                bcc     loc_A623

loc_A621:                               ; sub_A5B7+65↑j
                ldab    #$FF

loc_A623:                               ; sub_A5B7+68↑j
                mul
                lsld
                bcs     loc_A652
                staa    Temp5
                ldx     #byte_87BA
                ldaa    <EngineRpm_HB
                jsr     Lookup4ByteTable
                psha
                ldx     #byte_87D4
                ldaa    <CoolantTemp
                jsr     Lookup4ByteTable
                pulb
                mul
                adca    Temp5
                bcs     loc_A652
                staa    Temp5
                ldx     #byte_87C9
                ldaa    <BaroPressure
                jsr     Lookup4ByteTable
                adda    Temp5
                bcc     loc_A654

loc_A652:                               ; sub_A5B7+6E↑j sub_A5B7+89↑j
                ldaa    #$FF

loc_A654:                               ; sub_A5B7+99↑j
                staa    <MAPOffsetForCylTrim
                brset   <BitFlags66_t3 4 loc_A6C0
                brset   <BitFlags27 1 loc_A662
                brclr   <StartupSwitchMirror1 $10 locret_A6BF

loc_A662:                               ; sub_A5B7+A3↑j
                ldab    <Counter_MainLoop
                bitb    byte_8803
                bne     locret_A6BF
                ldab    <KeyOnOrEngineRunningTime
                cmpb    byte_8802
                bcs     locret_A6BF
                brclr   <PIA2_Buffer_t3 1 locret_A6BF
                ldab    <Timer_CountdownFromStartRunForAisFeedback
                bne     locret_A6BF
                ldab    <CoolantTemp
                cmpb    byte_87FE
                bcs     locret_A6BF
                ldab    <TargetIdleSpeedHB
                subb    <EngineRpm_HB
                bcc     loc_A686
                negb

loc_A686:                               ; sub_A5B7+CC↑j
                cmpb    byte_87FF
                bhi     locret_A6BF
                ldab    <Timer_DacalCountdown
                cmpa    <MapValue
                bhi     loc_A694
                incb
                bne     loc_A698

loc_A694:                               ; sub_A5B7+D8↑j
                tstb
                beq     loc_A69A
                decb

loc_A698:                               ; sub_A5B7+DB↑j
                stab    <Timer_DacalCountdown

loc_A69A:                               ; sub_A5B7+DE↑j
                brset   <BitFlags27 1 loc_A6A2
                brclr   <BitFlags68_t3 $10 locret_A6BF

loc_A6A2:                               ; sub_A5B7:loc_A69A↑j
                ldaa    <Timer_AisChanges
                cmpa    byte_876D
                bcs     locret_A6BF
                ldaa    <CurrentAisPosition
                cmpa    <DesiredNewAisPosition
                bne     locret_A6BF
                ldaa    <DesiredNewAisPosition
                cmpa    byte_8772
                beq     locret_A6BF
                bhi     loc_A6BA
                inca
                inca

loc_A6BA:                               ; sub_A5B7+FF↑j
                deca
                staa    <DesiredNewAisPosition
                staa    <CurrentAisPosition

locret_A6BF:                            ; sub_A5B7+A7↑j sub_A5B7+B0↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A6C0:                               ; sub_A5B7+9F↑j
                ldab    <Timer_CountdownFromStartRunForAisFeedback
                bne     locret_A6BF
                ldab    <Timer_AisChanges
                cmpb    byte_87FD
                bcs     locret_A6BF
                ldx     #byte_87DF
                suba    <MapValue
                bcc     loc_A6D6
                nega
                ldx     #byte_87EE

loc_A6D6:                               ; sub_A5B7+119↑j
                jsr     Lookup4ByteTable
                jsr     sub_A517
                staa    <DesiredNewAisPosition
                cmpa    <CurrentAisPosition
                beq     locret_A6BF
                clr     Timer_AisChanges
                rts
; End of function sub_A5B7


; =============== S U B R O U T I N E =======================================


sub_A6E6:                               ; __RESET+5A3↑P
                brset   <BitFlags66_t3 4 locret_A705
                ldaa    <b5C_IPL1_t3
                bita    #$88
                bne     locret_A705
                ldaa    <DesiredNewAisPosition
                oraa    <CurrentAisPosition
                bne     locret_A705
                ldab    <Counter_MainLoop
                bitb    #$7F
                bne     locret_A705
                adda    #2
                staa    <CurrentAisPosition
                staa    <DesiredNewAisPosition
                bset    <BitFlags36_t3 $10

locret_A705:                            ; sub_A6E6↑j sub_A6E6+8↑j ...
                rts
; End of function sub_A6E6


; =============== S U B R O U T I N E =======================================


sub_A706:                               ; __RESET+57C↑P

; FUNCTION CHUNK AT AA61 SIZE 00000110 BYTES
; FUNCTION CHUNK AT AB82 SIZE 00000170 BYTES
; FUNCTION CHUNK AT AD22 SIZE 00000044 BYTES

                bclr    <Counter_Cruise_1 $F
                brset   <StartupSwitchMirror1 4 loc_A712
                clrb
                stab    <CruiseSpeedSetpoint
                bra     loc_A770
; ---------------------------------------------------------------------------

loc_A712:                               ; sub_A706+3↑j
                inc     Counter_Cruise_1
                ldd     <VehicleSpeed_HB
                lsld
                lsld
                lsld
                aslb
                adca    #0
                staa    Temp0
                cmpa    byte_88DA
                bcs     loc_A767
                inc     Counter_Cruise_1
                ldaa    <EngineRpm_HB
                cmpa    byte_88DB
                bcc     loc_A767
                inc     Counter_Cruise_1
                brset   <StartupSwitchMirror1 $20 loc_A767
                inc     Counter_Cruise_1
                brset   <BitFlags27 1 loc_A749
                brclr   <StartupSwitchMirror1 $10 loc_A767
                inc     Counter_Cruise_1
                inc     Counter_Cruise_1
                bra     loc_A799
; ---------------------------------------------------------------------------

loc_A749:                               ; sub_A706+33↑j
                inc     Counter_Cruise_1
                ldaa    <TimerOverflowsBetweenCamPulses
                bne     loc_A75C
                ldab    <ScaledDistPWForCruiseControl
                cmpb    byte_88D8
                bcc     loc_A767
                cmpb    byte_88D9
                bcs     loc_A767

loc_A75C:                               ; sub_A706+48↑j
                inc     Counter_Cruise_1
                brset   <CruiseStatus_1 $80 loc_A799
                brclr   <BitFlags24 8 loc_A799

loc_A767:                               ; sub_A706+1D↑j sub_A706+27↑j ...
                brclr   <CruiseStatus_1 $18 loc_A770
                ldaa    Temp0
                staa    <CruiseSpeedSetpoint

loc_A770:                               ; sub_A706+A↑j
                                        ; sub_A706:loc_A767↑j
                brset   <CruiseStatus_1 $80 loc_A77D
                ldab    <Counter_Cruise_1
                andb    #$F
                ldaa    #$11
                mul
                stab    <Counter_Cruise_1

loc_A77D:                               ; sub_A706:loc_A770↑j
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
                jmp     loc_A951
; ---------------------------------------------------------------------------

loc_A799:                               ; sub_A706+41↑j sub_A706+59↑j ...
                inc     Counter_Cruise_1
                ldaa    Temp1_t3
                tab
                eora    PIA2_Buffer_t3_Temp
                anda    #$C0
                beq     loc_A7FE
                brset   <BitFlags6a_t3 1 loc_A7FE
                bita    #$40
                bne     loc_A7B0
                lsrb

loc_A7B0:                               ; sub_A706+A7↑j
                ldaa    #00
                bitb    #$40
                bne     loc_A7EC
                brset   <CruiseStatus_1 $80 loc_A7E1
                ldaa    Temp0
                psha
                ldd     #$0F89
                jsr     ThrowNonCriticalError
                pula
                staa    Temp0
                ldd     #$0F08
                ldx     #ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
                cmpa    0,x
                beq     loc_A7D7
                inx
                cmpa    0,x
                bne     loc_A7FE

loc_A7D7:                               ; sub_A706+CA↑j
                cmpb    2,x
                bne     loc_A7FE
                clr     0,x
                clr     2,x
                bra     loc_A767
; ---------------------------------------------------------------------------

loc_A7E1:                               ; sub_A706+B0↑j
                ldaa    #7
                ldab    Temp1_t3
                bitb    #$C0
                bne     loc_A7EC
                ldaa    #$7F

loc_A7EC:                               ; sub_A706+AE↑j sub_A706+E2↑j
                bita    <Counter_MainLoop
                bne     loc_A7FE
                ldaa    Temp0
                psha
                ldd     #$0F10
                jsr     ThrowNonCriticalError
                pula
                staa    Temp0

loc_A7FE:                               ; sub_A706+9F↑j sub_A706+A1↑j ...
                inc     Counter_Cruise_1
                brset   <StartupSwitchMirror1 2 loc_A85B
                ldab    <Timer_CruiseDecelerate
                incb
                bne     loc_A80B
                decb

loc_A80B:                               ; sub_A706+102↑j
                stab    <Timer_CruiseDecelerate
                brset   <CruiseStatus_1 1 loc_A82C
                brset   <Timer_CruiseDecelerate $80 loc_A836
                cmpb    #4
                bls     loc_A836
                bset    <CruiseStatus_1 $21
                bclr    <CruiseStatus_1 $A
                bset    <CruiseStatus_2 4
                clra
                staa    <Counter_Cruise_4
                staa    <CruiseControlVar0
                bclr    <CruiseStatus_1 4
                bra     loc_A836
; ---------------------------------------------------------------------------

loc_A82C:                               ; sub_A706+107↑j
                brset   <CruiseStatus_1 $80 loc_A836
                brset   <CruiseStatus_1 $10 loc_A849
                bra     loc_A839
; ---------------------------------------------------------------------------

loc_A836:                               ; sub_A706+10B↑j
                                        ; sub_A706+111↑j ...
                jmp     loc_AA61
; ---------------------------------------------------------------------------

loc_A839:                               ; sub_A706+12E↑j
                cmpb    byte_88D1
                bls     loc_A836
                bset    <CruiseStatus_1 $10
                bclr    <CruiseStatus_2 3
                ldaa    Temp0
                staa    <CruiseControlVar0

loc_A849:                               ; sub_A706+12A↑j
                ldab    <CruiseStatus_2
                cmpb    #$A0
                bcs     loc_A836
                ldab    <CruiseControlVar0
                subb    byte_88E7
                bcc     loc_A857
                clrb

loc_A857:                               ; sub_A706+14E↑j
                stab    <CruiseControlVar0
                bra     loc_A836
; ---------------------------------------------------------------------------

loc_A85B:                               ; sub_A706+FB↑j
                brclr   <CruiseStatus_1 1 loc_A8C2
                ldaa    #$7F
                brset   <CruiseStatus_1 $80 loc_A895
                brset   <CruiseStatus_2 8 loc_A874
                ldab    <CruiseSpeedSetpoint
                subb    Temp0
                bcc     loc_A874
                cmpb    #$FC
                bcs     loc_A895

loc_A874:                               ; sub_A706+15F↑j
                                        ; sub_A706+168↑j
                brset   <CruiseStatus_1 $10 loc_A87A
                bra     loc_A89B
; ---------------------------------------------------------------------------

loc_A87A:                               ; sub_A706:loc_A874↑j
                ldaa    <Counter_Cruise_4
                ldab    byte_88E6
                addb    #$80
                bmi     loc_A88A
                mul
                adca    <Counter_Cruise_4
                bcs     loc_A891
                bra     loc_A88D
; ---------------------------------------------------------------------------

loc_A88A:                               ; sub_A706+17B↑j
                mul
                adca    #0

loc_A88D:                               ; sub_A706+182↑j
                cmpa    #$7F
                bls     loc_A89B

loc_A891:                               ; sub_A706+180↑j
                ldaa    #$7F
                bra     loc_A89B
; ---------------------------------------------------------------------------

loc_A895:                               ; sub_A706+15B↑j
                                        ; sub_A706+16C↑j
                bset    <CruiseStatus_2 1
                clrb
                stab    <CruiseControlVar6

loc_A89B:                               ; sub_A706+172↑j
                                        ; sub_A706+189↑j ...
                ldab    Temp0
                stab    <CruiseSpeedSetpoint
                staa    Temp2
                jsr     sub_AA29
                ldab    Temp2
                cba
                bhi     loc_A8AD
                tab

loc_A8AD:                               ; sub_A706+1A4↑j
                bclr    <CruiseStatus_1 $91
                bclr    <CruiseStatus_2 8
                bclr    <BitFlags24 8
                clra
                staa    <Counter_Cruise_4
                staa    <Timer_CruiseDecelerate
                staa    <CruiseControlVar0
                staa    <Counter_Cruise_2
                jmp     loc_A951
; ---------------------------------------------------------------------------

loc_A8C2:                               ; sub_A706:loc_A85B↑j
                clrb
                stab    <Timer_CruiseDecelerate
                brset   <StartupSwitchMirror1 8 loc_A8CC
                jmp     loc_A9C3
; ---------------------------------------------------------------------------

loc_A8CC:                               ; sub_A706+1BF↑j
                ldab    <Counter_Cruise_4
                incb
                bne     loc_A8D2
                decb

loc_A8D2:                               ; sub_A706+1C9↑j
                stab    <Counter_Cruise_4
                brclr   <CruiseStatus_1 2 loc_A8DB
                jmp     loc_A96D
; ---------------------------------------------------------------------------

loc_A8DB:                               ; sub_A706+1CE↑j
                brclr   <CruiseStatus_1 $20 loc_A8E2
                jmp     loc_AA0A
; ---------------------------------------------------------------------------

loc_A8E2:                               ; sub_A706:loc_A8DB↑j
                cmpb    #4
                bhi     loc_A8E9
                jmp     loc_AA61
; ---------------------------------------------------------------------------

loc_A8E9:                               ; sub_A706+1DE↑j
                bset    <CruiseStatus_1 6
                bset    <CruiseStatus_2 4
                clra
                staa    <Counter_Cruise_2
                brclr   <CruiseStatus_1 $80 loc_A92E
                bset    <CruiseStatus_1 $20
                bclr    <CruiseStatus_1 $80
                bclr    <BitFlags24 8
                jsr     sub_AA29
                staa    Temp2
                ldaa    <CruiseSpeedSetpoint
                suba    Temp0
                bcc     loc_A90F
                tab
                eorb    #$80

loc_A90F:                               ; sub_A706+204↑j
                bpl     loc_A916
                asla
                ldaa    #$80
                sbca    #0

loc_A916:                               ; sub_A706:loc_A90F↑j
                adda    #$80
                ldx     #byte_8951
                jsr     Lookup4ByteTable
                addb    #$80
                addb    Temp2
                bpl     loc_A968
                bvc     loc_A92B
                ldab    #$7F
                bra     loc_A968
; ---------------------------------------------------------------------------

loc_A92B:                               ; sub_A706+21F↑j
                clrb
                bra     loc_A968
; ---------------------------------------------------------------------------

loc_A92E:                               ; sub_A706+1EC↑j
                bclr    <CruiseStatus_2 3
                ldaa    <CruiseSpeedSetpoint
                adda    #4
                staa    <CruiseSpeedSetpoint
                ldab    <CruiseControlVar2
                suba    #3
                cmpa    byte_88D6
                bhi     loc_A951
                ldab    byte_88DC
                ldaa    <CruiseControlVar2
                bmi     loc_A951
                aba
                bcs     loc_A94E
                cmpa    #$7F
                bls     loc_A950

loc_A94E:                               ; sub_A706+242↑j
                ldaa    #$7F

loc_A950:                               ; sub_A706+246↑j
                tab

loc_A951:                               ; sub_A706+90↑J sub_A706+1B9↑J ...
                ldaa    <CruiseSpeedSetpoint
                cmpa    byte_88D6
                bls     loc_A960
                bclr    <CruiseStatus_2 3
                ldaa    byte_88D6
                bra     loc_A966
; ---------------------------------------------------------------------------

loc_A960:                               ; sub_A706+250↑j
                cmpa    byte_88D7
                bcc     loc_A968
                clra

loc_A966:                               ; sub_A706+258↑j
                staa    <CruiseSpeedSetpoint

loc_A968:                               ; sub_A706+21D↑j
                                        ; sub_A706+223↑j ...
                stab    <CruiseControlVar2

loc_A96A:                               ; sub_A706:loc_A96D↓j
                                        ; sub_A706+272↓j ...
                jmp     loc_AA61
; ---------------------------------------------------------------------------

loc_A96D:                               ; sub_A706+1D2↑J
                brset   <CruiseStatus_1 $20 loc_A96A
                brset   <CruiseStatus_1 8 loc_A98C
                cmpb    byte_88D2
                bls     loc_A96A
                bset    <CruiseStatus_1 8
                bset    <CruiseStatus_2 8
                ldaa    Temp0
                adda    byte_88E9
                bcc     loc_A98A
                ldaa    #$FF

loc_A98A:                               ; sub_A706+280↑j
                staa    <CruiseControlVar0

loc_A98C:                               ; sub_A706+26B↑j
                ldaa    Temp0
                cmpa    byte_88D6
                bcs     loc_A99B
                bset    <CruiseStatus_1 $20
                ldab    <CruiseControlVar2
                bra     loc_A9F3
; ---------------------------------------------------------------------------

loc_A99B:                               ; sub_A706+28C↑j
                ldab    <CruiseStatus_2
                cmpb    #$A0
                bcs     loc_A96A
                ldab    <CruiseControlVar0
                subb    byte_88E8
                bcc     loc_A9A9
                clrb

loc_A9A9:                               ; sub_A706+2A0↑j
                cmpb    byte_88D6
                bcc     loc_A9BF
                adda    byte_88EA
                bcs     loc_A9BC
                cba
                bls     loc_A9BF
                tab
                cmpb    byte_88D6
                bls     loc_A9BF

loc_A9BC:                               ; sub_A706+2AB↑j
                ldab    byte_88D6

loc_A9BF:                               ; sub_A706+2A6↑j
                                        ; sub_A706+2AE↑j ...
                stab    <CruiseControlVar0
                bra     loc_A96A
; ---------------------------------------------------------------------------

loc_A9C3:                               ; sub_A706+1C3↑J
                bclr    <CruiseStatus_1 2
                ldaa    <CruiseSpeedSetpoint
                beq     loc_A9CD
                bclr    <CruiseStatus_1 $20

loc_A9CD:                               ; sub_A706+2C2↑j
                brclr   <CruiseStatus_1 8 loc_AA0A
                ldaa    <Counter_Cruise_4
                cmpa    #$5D
                bhi     loc_A9E1
                bclr    <CruiseStatus_1 8
                bclr    <CruiseStatus_2 8
                stab    <CruiseControlVar0
                bra     loc_AA0A
; ---------------------------------------------------------------------------

loc_A9E1:                               ; sub_A706+2CF↑j
                ldaa    Temp0
                adda    #4
                suba    <CruiseSpeedSetpoint
                bcc     loc_A9EB
                clra

loc_A9EB:                               ; sub_A706+2E2↑j
                ldx     #byte_898E
                jsr     Lookup4ByteTable
                orab    #$80

loc_A9F3:                               ; sub_A706+293↑j
                ldaa    Temp0
                staa    <CruiseSpeedSetpoint
                bclr    <CruiseStatus_1 $C
                bclr    <CruiseStatus_2 8
                clra
                staa    <CruiseControlVar0
                staa    <Counter_Cruise_4
                tstb
                bmi     loc_AA07
                clrb

loc_AA07:                               ; sub_A706+2FE↑j
                jmp     loc_A951
; ---------------------------------------------------------------------------

loc_AA0A:                               ; sub_A706+1D9↑J
                                        ; sub_A706:loc_A9CD↑j ...
                clrb
                stab    <Counter_Cruise_4
                ldaa    <CruiseStatus_2
                eora    #4
                bita    #7
                bne     loc_AA61
                ldaa    <Counter_MainLoop
                bne     loc_AA61
                ldab    <Counter_Cruise_2
                incb
                cmpb    byte_88E1
                bcs     loc_AA25
                bclr    <CruiseStatus_2 4
                clrb

loc_AA25:                               ; sub_A706+319↑j
                stab    <Counter_Cruise_2
                bra     loc_AA61
; End of function sub_A706


; =============== S U B R O U T I N E =======================================


sub_AA29:                               ; sub_A706+19D↑P
                                        ; sub_A706+1F9↑P
                ldaa    <CruiseSpeedSetpoint
                ldx     #byte_892B
                jsr     Lookup4ByteTable
                bpl     loc_AA35
                ldab    #$7F

loc_AA35:                               ; sub_AA29+8↑j
                stab    Temp1
                ldaa    <MapVolts
                ldx     #byte_893A
                jsr     Lookup4ByteTable
                ldab    Temp1
                aslb
                mul
                adca    #0
                bpl     loc_AA4B
                ldaa    #$7F

loc_AA4B:                               ; sub_AA29+1E↑j
                ldx     #L002F_t3
                ldab    <CruiseSpeedSetpoint
                cmpb    byte_88EB
                bls     loc_AA56
                dex

loc_AA56:                               ; sub_AA29+2A↑j
                adda    0,x
                bpl     locret_AA5D
                bvs     loc_AA5E
                clra

locret_AA5D:                            ; sub_AA29+2F↑j
                rts
; ---------------------------------------------------------------------------

loc_AA5E:                               ; sub_AA29+31↑j
                ldaa    #$7F
                rts
; End of function sub_AA29

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_A706

loc_AA61:                               ; sub_A706:loc_A836↑J
                                        ; sub_A706+1E0↑J ...
                brset   <CruiseStatus_1 $80 loc_AA76
                inc     Counter_Cruise_1
                brclr   <CruiseStatus_1 $18 loc_AA76
                inc     Counter_Cruise_1
                brset   <CruiseStatus_1 8 loc_AA76
                inc     Counter_Cruise_1

loc_AA76:                               ; sub_A706:loc_AA61↑j
                                        ; sub_A706+362↑j ...
                ldaa    <CruiseStatus_2
                adda    #$10
                cmpa    #$B0
                bcs     loc_AA80
                anda    #$F

loc_AA80:                               ; sub_A706+376↑j
                staa    <CruiseStatus_2
                anda    #$F0
                beq     loc_AA89
                jmp     loc_AD22
; ---------------------------------------------------------------------------

loc_AA89:                               ; sub_A706+37E↑j
                clrb
                brclr   <BitFlags24 $10 loc_AA91
                jmp     loc_AB6D
; ---------------------------------------------------------------------------

loc_AA91:                               ; sub_A706+384↑j
                ldy     #$003E
                ldx     #$D000
                ldd     #$06DD
                brclr   <TimerOverflowsBetweenSpeedoPulses $FF loc_AAAC
                clrb
                clra
                brset   <TimerOverflowsBetweenSpeedoPulses $40 loc_AAB1
                ldab    #$06
                dey

loc_AAA9:                               ; RESERVED:DD15↓w
                ldx     #$DDD0

loc_AAAC:                               ; sub_A706+395↑j
                sei
                jsr     loc_E3DD
                cli

loc_AAB1:                               ; sub_A706+39B↑j
                ldx     <VehicleSpeed_HB
                stx     Temp0
                std     <VehicleSpeed_HB
                brclr   <CruiseStatus_2 2 loc_AB27
                ldaa    <Counter_Cruise_2
                brclr   <CruiseStatus_2 1 loc_AAD2
                cmpa    byte_88F5
                bcc     loc_AACC
                inca
                staa    <Counter_Cruise_2
                bra     loc_AB27
; ---------------------------------------------------------------------------

loc_AACC:                               ; sub_A706+3BF↑j
                bclr    <CruiseStatus_2 1
                clra
                staa    <Counter_Cruise_2

loc_AAD2:                               ; sub_A706+3B8↑j
                cmpa    byte_88F4
                bcs     loc_AB29
                ldab    <CruiseControlVar6
                tba
                bpl     loc_AADD
                negb

loc_AADD:                               ; sub_A706+3D4↑j
                cmpb    byte_88ED
                bcs     loc_AB21
                ldx     #L002F_t3
                ldab    <CruiseSpeedSetpoint
                cmpb    byte_88EB
                bls     loc_AAED
                dex

loc_AAED:                               ; sub_A706+3E4↑j
                ldab    0,x
                adda    2,x
                bvc     loc_AAF8
                asla
                ldaa    #$80
                sbca    #0

loc_AAF8:                               ; sub_A706+3EB↑j
                staa    2,x
                cmpa    byte_88EE
                bgt     loc_AB11
                cmpa    byte_88EF
                bge     loc_AB21
                subb    byte_88F1
                cmpb    byte_88F3
                bge     loc_AB1C
                ldab    byte_88F3
                bra     loc_AB1C
; ---------------------------------------------------------------------------

loc_AB11:                               ; sub_A706+3F7↑j
                addb    byte_88F0
                cmpb    byte_88F2
                ble     loc_AB1C
                ldab    byte_88F2

loc_AB1C:                               ; sub_A706+404↑j
                                        ; sub_A706+409↑j ...
                stab    0,x
                clra
                staa    2,x

loc_AB21:                               ; sub_A706+3DA↑j
                                        ; sub_A706+3FC↑j
                bclr    <CruiseStatus_2 2
                clra
                staa    <Counter_Cruise_2

loc_AB27:                               ; sub_A706+3B2↑j
                                        ; sub_A706+3C4↑j
                bra     loc_AB53
; ---------------------------------------------------------------------------

loc_AB29:                               ; sub_A706+3CF↑j
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
                adda    byte_88EC
                bmi     loc_AB48
                ldab    <CruiseControlVar6
                bpl     loc_AB41
                comb
                incb

loc_AB41:                               ; sub_A706+437↑j
                cba
                ble     loc_AB53
                staa    <CruiseControlVar6
                bra     loc_AB53
; ---------------------------------------------------------------------------

loc_AB48:                               ; sub_A706+433↑j
                ldab    <CruiseControlVar6
                bmi     loc_AB4E
                comb
                incb

loc_AB4E:                               ; sub_A706+444↑j
                cba
                bge     loc_AB53
                staa    <CruiseControlVar6

loc_AB53:                               ; sub_A706:loc_AB27↑j
                                        ; sub_A706+43C↑j ...
                ldd     Temp0
                subd    <VehicleSpeed_HB
                bne     loc_AB5D
                clr     CruiseControlVar3

loc_AB5D:                               ; sub_A706+452↑j
                std     Temp0
                clra
                ldab    <CruiseControlVar3
                bpl     loc_AB66
                deca

loc_AB66:                               ; sub_A706+45D↑j
                addd    Temp0
                asra
                rorb
                bsr     sub_AB71

loc_AB6D:                               ; sub_A706+388↑J
                stab    <CruiseControlVar3
                bra     loc_AB82
; END OF FUNCTION CHUNK FOR sub_A706

; =============== S U B R O U T I N E =======================================


sub_AB71:                               ; sub_A706+465↑p sub_ACF2+E↓P ...
                lsld
                bcs     loc_AB7A
                tsta
                beq     loc_AB80
                ldab    #$7F
                rts
; ---------------------------------------------------------------------------

loc_AB7A:                               ; sub_AB71+1↑j
                cmpa    #$FF
                beq     loc_AB7F
                clrb

loc_AB7F:                               ; sub_AB71+B↑j
                sec

loc_AB80:                               ; sub_AB71+4↑j
                rorb
                rts
; End of function sub_AB71

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_A706

loc_AB82:                               ; sub_A706+469↑j
                brset   <CruiseStatus_1 $80 loc_ABDC
                ldx     #byte_8905
                clrb
                ldaa    <CruiseSpeedSetpoint
                brclr   <CruiseStatus_1 $18 loc_AB92
                ldaa    <CruiseControlVar0

loc_AB92:                               ; sub_A706+486↑j
                lsrd
                lsrd
                lsrd
                subd    <VehicleSpeed_HB
                bcc     loc_ABDF
                bclr    <CruiseStatus_1 4
                ldx     #byte_88F6
                coma
                comb
                addd    #1
                stab    Temp0
                tsta
                beq     loc_ABB1
                psha
                ldaa    #$FF
                staa    Temp0
                pula

loc_ABB1:                               ; sub_A706+4A2↑j
                lsrd
                lsrd
                brclr   <CruiseStatus_1 $10 loc_ABC1
                ldx     #byte_8999
                tsta
                beq     loc_ABF5
                ldaa    #$FF
                bra     loc_ABF6
; ---------------------------------------------------------------------------

loc_ABC1:                               ; sub_A706+4AD↑j
                tsta
                bne     loc_ABD6
                cmpb    byte_88CF
                bcc     loc_ABD6
                tba
                ldab    Temp0
                cmpa    byte_88D0
                bcs     loc_ABF5
                ldaa    #5
                bra     loc_ABD8
; ---------------------------------------------------------------------------

loc_ABD6:                               ; sub_A706+4BC↑j
                                        ; sub_A706+4C1↑j
                ldaa    #$F

loc_ABD8:                               ; sub_A706+4CE↑j
                oraa    #$80
                staa    <CruiseControlVar2

loc_ABDC:                               ; sub_A706:loc_AB82↑j
                jmp     loc_AD22
; ---------------------------------------------------------------------------

loc_ABDF:                               ; sub_A706+491↑j
                brclr   <CruiseStatus_1 $C loc_ABE8
                ldx     #byte_891C
                lsrd
                lsrd

loc_ABE8:                               ; sub_A706:loc_ABDF↑j
                tsta
                beq     loc_ABED
                ldab    #$FF

loc_ABED:                               ; sub_A706+4E3↑j
                cmpb    byte_88D3
                bcc     loc_ABF5
                bclr    <CruiseStatus_1 4

loc_ABF5:                               ; sub_A706+4B5↑j
                                        ; sub_A706+4CA↑j ...
                tba

loc_ABF6:                               ; sub_A706+4B9↑j
                jsr     Lookup4ByteTable
                clra
                tstb
                bpl     loc_ABFE
                deca

loc_ABFE:                               ; sub_A706+4F5↑j
                std     Temp0
                ldx     #byte_897F
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                jsr     Lookup4ByteTable
                staa    Temp3
                ldx     #byte_8970
                ldd     <VehicleSpeed_HB
                lsld
                lsld
                lsld
                jsr     Lookup4ByteTable
                adda    Temp3
                bcc     loc_AC1E
                ldaa    #$FF

loc_AC1E:                               ; sub_A706+514↑j
                staa    Temp3
                clra
                staa    Temp2
                ldab    <CruiseControlVar3
                bpl     loc_AC2A
                deca

loc_AC2A:                               ; sub_A706+521↑j
                lsld
                lsld
                addd    Temp0
                std     Temp0
                brset   <CruiseStatus_2 4 loc_AC5E
                bpl     loc_AC3D
                coma
                comb
                addd    #1

loc_AC3D:                               ; sub_A706+530↑j
                tsta
                beq     loc_AC42
                ldab    #$FF

loc_AC42:                               ; sub_A706+538↑j
                cmpb    byte_88DF
                bhi     loc_AC5E
                clrb
                ldaa    <CruiseSpeedSetpoint
                lsrd
                lsrd
                lsrd
                subd    <VehicleSpeed_HB
                bpl     loc_AC56
                coma
                comb
                addd    #1

loc_AC56:                               ; sub_A706+549↑j
                tsta
                bne     loc_AC5E
                cmpb    byte_88E0
                bls     loc_AC7F

loc_AC5E:                               ; sub_A706+52C↑j
                                        ; sub_A706+53F↑j ...
                clra
                ldab    <CruiseControlVar1
                bpl     loc_AC64
                deca

loc_AC64:                               ; sub_A706+55B↑j
                addd    Temp0
                staa    Temp4
                bpl     loc_AC71
                coma
                comb
                addd    #1

loc_AC71:                               ; sub_A706+564↑j
                cpd     Temp2
                bcc     loc_AC82
                ldaa    Temp4
                bpl     loc_AC7D
                negb

loc_AC7D:                               ; sub_A706+574↑j
                stab    <CruiseControlVar1

loc_AC7F:                               ; sub_A706+556↑j
                                        ; sub_A706+588↓j ...
                jmp     loc_AD22
; ---------------------------------------------------------------------------

loc_AC82:                               ; sub_A706+56F↑j
                clra
                staa    <CruiseControlVar1
                ldaa    Temp4
                anda    #$80
                ldab    <CruiseControlVar2
                beq     loc_AC95
                bpl     loc_AC7F
                tab
                eorb    <CruiseControlVar2
                bpl     loc_AC7F

loc_AC95:                               ; sub_A706+586↑j
                ldab    <TpsVolts_Minus_LowestSessionTpsVolts
                tsta
                bpl     loc_ACC4
                oraa    byte_88E3
                brclr   <CruiseStatus_1 $10 loc_ACA6
                adda    byte_88E5
                bra     loc_ACEE
; ---------------------------------------------------------------------------

loc_ACA6:                               ; sub_A706+597↑j
                staa    Temp4
                clra
                cmpb    byte_88D4
                bcs     loc_ACEE
                ldx     #byte_89BE
                stx     Temp2
                ldx     #byte_89C9
                bsr     sub_ACF2
                oraa    #$80
                ldab    Temp4
                cba
                bcc     loc_ACEE
                bra     loc_ACED
; ---------------------------------------------------------------------------

loc_ACC4:                               ; sub_A706+592↑j
                cmpb    byte_88D5
                bcc     loc_ACEE
                oraa    byte_88E2
                brclr   <CruiseStatus_1 8 loc_ACD5
                adda    byte_88E4
                bra     loc_ACEE
; ---------------------------------------------------------------------------

loc_ACD5:                               ; sub_A706+5C6↑j
                brset   <CruiseStatus_1 4 loc_ACEE
                staa    Temp4
                ldx     #byte_89A8
                stx     Temp2
                ldx     #byte_89B3
                bsr     sub_ACF2
                ldab    Temp4
                cba
                bcc     loc_ACEE

loc_ACED:                               ; sub_A706+5BC↑j
                tba

loc_ACEE:                               ; sub_A706+59E↑j
                                        ; sub_A706+5A7↑j ...
                staa    <CruiseControlVar2
                bra     loc_AD22
; END OF FUNCTION CHUNK FOR sub_A706

; =============== S U B R O U T I N E =======================================


sub_ACF2:                               ; sub_A706+5B2↑p
                                        ; sub_A706+5DF↑p
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
                jsr     sub_AB71
                tba
                adda    #$80
                jsr     Lookup4ByteTable
                ldx     Temp2
                staa    Temp2
                ldd     Temp0
                jsr     sub_AB71
                tba
                adda    #$80
                jsr     Lookup4ByteTable
                ldab    Temp2
                mul
                adca    #0
                rts
; End of function sub_ACF2

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_A706

loc_AD22:                               ; sub_A706+380↑J
                                        ; sub_A706:loc_ABDC↑J ...
                ldaa    <PIA2_Buffer_t3
                anda    #$3F
                brset   <CruiseStatus_1 $80 loc_AD3B
                ldab    <CruiseControlVar2
                beq     loc_AD3D
                bpl     loc_AD3F
                brclr   <CruiseStatus_1 $10 loc_AD3B
                ldab    <Counter_Cruise_4
                incb
                beq     loc_AD3B
                stab    <Counter_Cruise_4

loc_AD3B:                               ; sub_A706+620↑j
                                        ; sub_A706+62A↑j ...
                oraa    #$C0

loc_AD3D:                               ; sub_A706+626↑j
                oraa    #$80

loc_AD3F:                               ; sub_A706+628↑j
                bclr    <BitFlags6a_t3 1
                tab
                eorb    <PIA2_Buffer_t3
                andb    #$C0
                beq     loc_AD4C
                bset    <BitFlags6a_t3 1

loc_AD4C:                               ; sub_A706+641↑j
                staa    <PIA2_Buffer_t3
                ldab    <CruiseControlVar2
                beq     loc_AD5E
                lsld
                tstb
                beq     loc_AD5B
                subb    #2
                beq     loc_AD5B
                lsrd

loc_AD5B:                               ; sub_A706+64E↑j
                                        ; sub_A706+652↑j
                stab    <CruiseControlVar2
                rts
; ---------------------------------------------------------------------------

loc_AD5E:                               ; sub_A706+64A↑j
                brclr   <CruiseStatus_2 1 locret_AD65
                bset    <CruiseStatus_2 2

locret_AD65:                            ; sub_A706:loc_AD5E↑j
                rts

; ===========================================================================

; Segment type: Pure data
                ; segment EEPROM
 IF Code_start == $9400
 OPT NOL
 ORG $B600
 REPEAT $200
 fcb $FF
 OPT LIS
; end of 'EEPROM'

 ORG $B800
 ENDIF
; =============== S U B R O U T I N E =======================================


sub_B800:                               ; __RESET+588↑P
                ldab    <Counter_MainLoop
                bitb    #7
                beq     loc_B809
                jmp     loc_B87F
; ---------------------------------------------------------------------------

loc_B809:                               ; sub_B800+4↑j
                ldaa    <LastCoolantTempVolts
                ldx     #TL_TempForHotScaleA2D
                brclr   <PIA3_Buffer_t3 $10 loc_B833
                ldx     #TL_TempForColdScaleFromA2D
                cmpa    #$40
                bcc     loc_B837

loc_B819:                               ; sub_B800+35↓j
                brset   <BitFlags66_t3 3 loc_B824
                ldab    <BitFlags66_t3
                addb    #1
                stab    <BitFlags66_t3
                rts
; ---------------------------------------------------------------------------

loc_B824:                               ; sub_B800:loc_B819↑j
                sei
                bclr    <BitFlags66_t3 3
                ldab    <PIA3_Buffer_t3
                eorb    #$10
                stab    <PIA3_Buffer_t3
                stab    PIA3_Buffer_2_t3
                cli
                rts
; ---------------------------------------------------------------------------

loc_B833:                               ; sub_B800+E↑j
                cmpa    #$DC
                bcc     loc_B819

loc_B837:                               ; sub_B800+17↑j
                bclr    <BitFlags66_t3 3
                cmpa    TL_CoolantTempOutOfRangeHigh
                bhi     loc_B863
                cmpa    TL_CoolantTempOutOfRangeLow
                bcs     loc_B868
                brclr   <b5C_IPL1_t3 2 loc_B84F
                ldaa    #2
                jsr     sub_D5F4
                bra     loc_B87F
; ---------------------------------------------------------------------------

loc_B84F:                               ; sub_B800+44↑j
                jsr     Lookup4ByteTable
                ldab    <CoolantTemp
                sba
                bcc     loc_B85A
                decb
                bra     loc_B85F
; ---------------------------------------------------------------------------

loc_B85A:                               ; sub_B800+55↑j
                cmpa    #3
                bcs     loc_B87F
                incb

loc_B85F:                               ; sub_B800+58↑j
                stab    <CoolantTemp
                bra     loc_B87F
; ---------------------------------------------------------------------------

loc_B863:                               ; sub_B800+3D↑j
                ldd     #$1F9E
                bra     loc_B86B
; ---------------------------------------------------------------------------

loc_B868:                               ; sub_B800+42↑j
                ldd     #$1E9E

loc_B86B:                               ; sub_B800+66↑j
                brset   <b5C_IPL1_t3 2 loc_B87F
                jsr     ThrowNonCriticalError
                bcc     loc_B87F
                bset    <b5C_IPL1_t3 2
                ldaa    TL_DefaultCoolantTempRaw
                staa    <CoolantTemp
                clr     Timer_ThermostatDiagnostics

loc_B87F:                               ; sub_B800+6↑J sub_B800+4D↑j ...
                ldaa    <CoolantTemp
                ldx     #TL_ScaleCoolantTemp
                jsr     Lookup4ByteTable
                staa    <CoolantTemp_fromTable_Scaled
                rts
; End of function sub_B800


; =============== S U B R O U T I N E =======================================


sub_B88A:                               ; __RESET+585↑P
                ldab    <Counter_MainLoop
                bitb    #7
                beq     loc_B893
                jmp     loc_B909
; ---------------------------------------------------------------------------

loc_B893:                               ; sub_B88A+4↑j
                ldaa    <LastChargeTempVolts
                ldx     #TL_TempForHotScaleA2D
                brclr   <PIA3_Buffer_t3 $20 loc_B8C0
                ldx     #TL_TempForColdScaleFromA2D
                cmpa    #$40
                bcc     loc_B8C4

loc_B8A3:                               ; sub_B88A+38↓j
                brset   <BitFlags23 3 loc_B8B1
                ldab    <BitFlags23
                addb    #1
                stab    <BitFlags23
                ldaa    <LastChargeTempVolts
                bra     loc_B8C7
; ---------------------------------------------------------------------------

loc_B8B1:                               ; sub_B88A:loc_B8A3↑j
                sei
                bclr    <BitFlags23 3
                ldab    <PIA3_Buffer_t3
                eorb    #$20
                stab    <PIA3_Buffer_t3
                stab    PIA3_Buffer_2_t3
                cli
                rts
; ---------------------------------------------------------------------------

loc_B8C0:                               ; sub_B88A+E↑j
                cmpa    #$DC
                bcc     loc_B8A3

loc_B8C4:                               ; sub_B88A+17↑j
                bclr    <BitFlags23 3

loc_B8C7:                               ; sub_B88A+25↑j
                cmpa    TL_ChargeTempOutOfRangeHigh
                bhi     loc_B8F0
                cmpa    TL_ChargeTempOutOfRangeLow
                bcs     loc_B8F5
                brclr   <b5C_IPL1_t3 1 loc_B8DC
                ldaa    #1
                jsr     sub_D5F4
                bra     loc_B909
; ---------------------------------------------------------------------------

loc_B8DC:                               ; sub_B88A+47↑j
                jsr     Lookup4ByteTable
                ldab    <ChargeTempVolts
                sba
                bcc     loc_B8E7
                decb
                bra     loc_B8EC
; ---------------------------------------------------------------------------

loc_B8E7:                               ; sub_B88A+58↑j
                cmpa    #3
                bcs     loc_B909
                incb

loc_B8EC:                               ; sub_B88A+5B↑j
                stab    <ChargeTempVolts
                bra     loc_B909
; ---------------------------------------------------------------------------

loc_B8F0:                               ; sub_B88A+40↑j
                ldd     #$3A9E
                bra     loc_B8F8
; ---------------------------------------------------------------------------

loc_B8F5:                               ; sub_B88A+45↑j
                ldd     #$399E

loc_B8F8:                               ; sub_B88A+69↑j
                brset   <b5C_IPL1_t3 1 loc_B909
                jsr     ThrowNonCriticalError
                bcc     loc_B909
                bset    <b5C_IPL1_t3 1
                ldaa    TL_DefaultChargeTemp_Limpin
                staa    <ChargeTempVolts

loc_B909:                               ; sub_B88A+6↑J sub_B88A+50↑j ...
                ldaa    <ChargeTempVolts
                ldx     #TL_ScaleChargeTemp
                jsr     Lookup4ByteTable
                staa    <IntakeTemp_fromTable_Scaled
                rts
; End of function sub_B88A


; =============== S U B R O U T I N E =======================================


sub_B914:                               ; __RESET+579↑P
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
                bra     loc_B92D
; ---------------------------------------------------------------------------

loc_B92D:                               ; sub_B914↑j sub_B914+17↑j
                                        ; ...
                clra
                ldab    <VehicleSpeedx8_Scaled
                cmpb    TL_SwitchPointForDecelIdleAisControl
                bcc     loc_B93D
                ldx     <EngineRpm_HB
                cpx     <TargetIdleSpeedHB
                bls     loc_B948
                bra     loc_B943
; ---------------------------------------------------------------------------

loc_B93D:                               ; sub_B914+1F↑j
                ldab    <MapValue
                cmpb    <MAPOffsetForCylTrim
                bls     loc_B948

loc_B943:                               ; sub_B914+27↑j
                ldaa    <Timer_CountdownFromStartRunForAisFeedback
                beq     loc_B94A
                deca

loc_B948:                               ; sub_B914+25↑j sub_B914+2D↑j
                staa    <Timer_CountdownFromStartRunForAisFeedback

loc_B94A:                               ; sub_B914+31↑j
                brset   <BitFlags66_t3 $80 loc_B967
                ldd     <VehicleSpeed_HB
                lsld
                lsld
                lsld
                aslb
                adca    #0
                ldab    TL_SwitchPointForDecelIdleAisControl
                brset   <BitFlags66_t3 4 loc_B95F
                addb    #3

loc_B95F:                               ; sub_B914+45↑j
                cba
                bcs     loc_B967
                bset    <BitFlags66_t3 4
                bra     loc_B96A
; ---------------------------------------------------------------------------

loc_B967:                               ; sub_B914:loc_B94A↑j
                                        ; sub_B914+4C↑j
                bclr    <BitFlags66_t3 4

loc_B96A:                               ; sub_B914+51↑j
                ldd     <VehicleSpeed_HB
                lsld
                lsld
                lsld
                bcc     loc_B973
                ldaa    #$FF

loc_B973:                               ; sub_B914+5B↑j
                staa    <VehicleSpeedx8_Scaled
                rts
; End of function sub_B914


; =============== S U B R O U T I N E =======================================


sub_B976:                               ; __RESET+5C4↑P
                brclr   <IPL1 $40 locret_B9B9
                ldaa    <MapValue2
                cmpa    #$80
                bcs     locret_B9B9
                ldaa    <EngineRpm_HB
                ldx     #byte_8024
                jsr     Lookup4ByteTable
                adda    <MapValue2
                bcc     loc_B98E
                ldaa    #$FF

loc_B98E:                               ; sub_B976+14↑j
                cmpa    <BaroPressure
                bls     loc_B998
                ldab    <BaroPressure
                incb
                bne     loc_B9B1
                rts
; ---------------------------------------------------------------------------

loc_B998:                               ; sub_B976+1A↑j
                ldab    <TpsVolts_Minus_LowestSessionTpsVolts
                cmpb    TL_ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin
                bcs     loc_B9B3
                ldab    <TPSVoltsSessionDelta
                cmpb    TL_ThrottleLevelMinAbove_MINTHR_ToMatureMapLimpin
                bcs     loc_B9B4
                cmpa    <BaroPressure
                bcc     loc_B9B4
                ldab    <BaroPressure
                decb
                cmpb    #$80
                bcs     loc_B9B3

loc_B9B1:                               ; sub_B976+1F↑j
                stab    <BaroPressure

loc_B9B3:                               ; sub_B976+27↑j sub_B976+39↑j
                clrb

loc_B9B4:                               ; sub_B976+2E↑j sub_B976+32↑j
                incb
                bmi     locret_B9B9
                stab    <TPSVoltsSessionDelta

locret_B9B9:                            ; sub_B976↑j sub_B976+8↑j ...
                rts
; End of function sub_B976


; =============== S U B R O U T I N E =======================================


sub_B9BA:                               ; __RESET+5A6↑P
                brclr   <StartupSwitchMirror1 $10 loc_B9C1
                bclr    <BitFlags2a 1

loc_B9C1:                               ; sub_B9BA↑j
                brset   <BitFlags27 1 loc_B9DF
                ldab    <BitFlags68_t3
                andb    #$10
                stab    Temp5
                ldab    <StartupSwitchMirror1
                andb    #$10
                eorb    Temp5
                beq     locret_B9E2
                eorb    <BitFlags68_t3
                orab    #$80
                stab    <BitFlags68_t3
                bclr    <BitFlags66_t3 4
                rts
; ---------------------------------------------------------------------------

loc_B9DF:                               ; sub_B9BA:loc_B9C1↑j
                bclr    <BitFlags68_t3 $90

locret_B9E2:                            ; sub_B9BA+19↑j
                rts
; End of function sub_B9BA


; =============== S U B R O U T I N E =======================================


sub_B9E3:                               ; __RESET+5A9↑P
                brclr   <BitFlags27 $80 loc_BA07
                ldab    <BitFlags68_t3
                andb    #1
                stab    Temp5
                ldab    <StartupSwitchMirror1
                andb    #1
                eorb    Temp5
                beq     locret_BA0D
                eorb    <BitFlags68_t3
                brset   <BitFlags36_t3 $20 loc_BA03
                brclr   <IPL1 $40 loc_BA03
                orab    #2

loc_BA03:                               ; sub_B9E3+16↑j sub_B9E3+1A↑j
                stab    <BitFlags68_t3
                bra     locret_BA0D
; ---------------------------------------------------------------------------

loc_BA07:                               ; sub_B9E3↑j
                bclr    <BitFlags68_t3 2
                bset    <BitFlags68_t3 1

locret_BA0D:                            ; sub_B9E3+12↑j sub_B9E3+22↑j
                rts
; End of function sub_B9E3


; =============== S U B R O U T I N E =======================================


sub_BA0E:                               ; __RESET+56D↑P
                clr     Temp4
                clr     Temp3
                brset   <Ram_30 4 loc_BA25
                ldaa    <LastTpsVolts
                cmpa    byte_8A02
                bcc     loc_BA25
                ldaa    <Ram_30
                adda    #1
                staa    <Ram_30

loc_BA25:                               ; sub_BA0E+6↑j sub_BA0E+F↑j
                ldaa    <b5C_IPL1_t3
                bita    #$88
                bne     loc_BA7A
                brset   <Ram_30 8 loc_BA49
                ldaa    <EngineRpm_HB
                cmpa    byte_8A00
                bcs     loc_BA55
                ldaa    <BaroPressure
                cmpa    byte_8A05
                bcc     loc_BA42
                ldaa    byte_8A04
                bra     loc_BA45
; ---------------------------------------------------------------------------

loc_BA42:                               ; sub_BA0E+2D↑j
                ldaa    byte_8A03

loc_BA45:                               ; sub_BA0E+32↑j
                cmpa    <MapVolts
                bcc     loc_BA55

loc_BA49:                               ; sub_BA0E+1D↑j
                ldaa    <LastTpsVolts
                cmpa    byte_8A02
                bcs     loc_BA55
                com     Temp4
                bra     loc_BA87
; ---------------------------------------------------------------------------

loc_BA55:                               ; sub_BA0E+26↑j sub_BA0E+39↑j ...
                brset   <BitFlags2e 8 loc_BA6E
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    byte_89FF
                bcs     loc_BA7A
                ldaa    <EngineRpm_HB
                cmpa    byte_8A00
                bcs     loc_BA7A
                ldaa    <MapVolts
                cmpa    byte_8A01
                bcc     loc_BA7A

loc_BA6E:                               ; sub_BA0E:loc_BA55↑j
                ldaa    <LastTpsVolts
                cmpa    byte_89FE
                bcc     loc_BA7A
                com     Temp3
                bra     loc_BA91
; ---------------------------------------------------------------------------

loc_BA7A:                               ; sub_BA0E+1B↑j sub_BA0E+50↑j ...
                sei
                ldaa    <LastTpsVolts
                cmpa    byte_89FB
                bcs     loc_BA91
                cmpa    byte_89FC
                bcs     loc_BACF

loc_BA87:                               ; sub_BA0E+45↑j
                cli
                brclr   <Counter_MainLoop 1 loc_BAED
                ldd     #$1BA0
                bra     loc_BA99
; ---------------------------------------------------------------------------

loc_BA91:                               ; sub_BA0E+6A↑j sub_BA0E+72↑j
                cli
                brclr   <Counter_MainLoop 1 loc_BAED
                ldd     #$1AA0

loc_BA99:                               ; sub_BA0E+81↑j
                brset   <b5C_IPL1_t3 $40 loc_BAB9
                jsr     ThrowNonCriticalError
                ldaa    <TpsVolts
                bcc     loc_BAED
                bset    <b5C_IPL1_t3 $40
                tst     Temp4
                beq     loc_BAB1
                bset    <Ram_30 8
                bra     loc_BAB9
; ---------------------------------------------------------------------------

loc_BAB1:                               ; sub_BA0E+9C↑j
                tst     Temp3
                beq     loc_BAB9
                bset    <BitFlags2e 8

loc_BAB9:                               ; sub_BA0E:loc_BA99↑j
                                        ; sub_BA0E+A1↑j ...
                ldaa    #$40
                staa    <LowestSessionTpsVolts
                brclr   <IPL1 $40 loc_BACB
                ldab    <MapValue
                cmpb    byte_89FD
                bcs     loc_BACB
                adda    TL_DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle

loc_BACB:                               ; sub_BA0E+AF↑j sub_BA0E+B8↑j
                staa    <TpsVolts
                bra     loc_BAED
; ---------------------------------------------------------------------------

loc_BACF:                               ; sub_BA0E+77↑j
                brclr   <b5C_IPL1_t3 $40 loc_BAEB
                cli
                ldaa    <Counter_MainLoop
                bita    #7
                bne     loc_BAB9
                ldaa    #7
                jsr     sub_D5F4
                brset   <b5C_IPL1_t3 $40 loc_BAB9
                bclr    <BitFlags2e 8
                bclr    <Ram_30 8
                bra     loc_BAB9
; ---------------------------------------------------------------------------

loc_BAEB:                               ; sub_BA0E:loc_BACF↑j
                staa    <TpsVolts

loc_BAED:                               ; sub_BA0E+7A↑j sub_BA0E+84↑j ...
                cli
                brset   <BitFlags66_t3 $80 loc_BB17
                ldab    <Timer_CountdownFromStartRunForAisFeedback
                bne     loc_BB17
                brclr   <IPL1 $40 loc_BB17
                ldab    <KeyOnOrEngineRunningTime
                beq     loc_BB17
                cmpa    <LowestSessionTpsVolts
                bcc     loc_BB17
                ldaa    Timer_DelayBeforeUpdating_MINTHR
                deca
                bne     loc_BB1A
                ldab    <LowestSessionTpsVolts
                cmpb    #1
                bcc     loc_BB11
                ldab    TL_ValueOf_MINTHR_WhenBatteryDisconnected

loc_BB11:                               ; sub_BA0E+FE↑j
                decb
                stab    <LowestSessionTpsVolts
                bclr    <BitFlags66_t3 $10

loc_BB17:                               ; sub_BA0E+E0↑j sub_BA0E+E6↑j ...
                ldaa    TL_ProgramLoopsWithThrottleBelow_MINTHR_ToDecrement_MINTHR

loc_BB1A:                               ; sub_BA0E+F8↑j
                staa    Timer_DelayBeforeUpdating_MINTHR
                ldaa    TL_NumberOfBitsAbove_MINTHR_ToDetermineOnThrottleTransition
                ldab    <BitFlags66_t3
                bpl     loc_BB27
                ldaa    TL_NumberOfBitsAbove_MINTHR_ToDetermineOffThrottleTransition

loc_BB27:                               ; sub_BA0E+114↑j
                adda    <LowestSessionTpsVolts
                cmpa    <TpsVolts
                bcc     loc_BB46
                tstb
                bmi     loc_BB3F
                bitb    #$10
                bne     loc_BB3F
                ldaa    <LowestSessionTpsVolts
                inca
                cmpa    <TpsVolts
                bcc     loc_BB3F
                staa    <LowestSessionTpsVolts
                orab    #$10

loc_BB3F:                               ; sub_BA0E+120↑j
                                        ; sub_BA0E+124↑j ...
                orab    #$80
                bclr    <BitFlags2a 1
                bra     loc_BB60
; ---------------------------------------------------------------------------

loc_BB46:                               ; sub_BA0E+11D↑j
                tstb
                bpl     loc_BB5E
                brset   <BitFlags68_t3 4 loc_BB4F
                orab    #$20

loc_BB4F:                               ; sub_BA0E+13B↑j
                ldx     #byte_876F
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    TL_SwitchPointForDecelIdleAisControl
                bcc     loc_BB5A
                inx

loc_BB5A:                               ; sub_BA0E+149↑j
                ldaa    0,x
                staa    <Timer_CountdownFromStartRunForAisFeedback

loc_BB5E:                               ; sub_BA0E+139↑j
                andb    #$7F

loc_BB60:                               ; sub_BA0E+136↑j
                bitb    #8
                bne     loc_BB85
                brclr   <StartupSwitchMirror1 $20 loc_BB85
                ldaa    <EngineRpm_HB
                cmpa    TL_ThrottleSelfCalibrationRpmThreshold
                bcs     loc_BB85
                ldaa    <MapValue
                cmpa    TL_ThrottleSelfCalibrationMapDeltaThreshold
                bcc     loc_BB85
                ldaa    <LowestSessionTpsVolts
                inca
                cmpa    TL_ValueOf_MINTHR_WhenBatteryDisconnected
                bcs     loc_BB81
                ldaa    TL_ValueOf_MINTHR_WhenBatteryDisconnected

loc_BB81:                               ; sub_BA0E+16E↑j
                staa    <LowestSessionTpsVolts
                orab    #8

loc_BB85:                               ; sub_BA0E+154↑j
                                        ; sub_BA0E+156↑j ...
                ldaa    <LowestSessionTpsVolts
                adda    #$30
                cmpa    <TpsVolts
                bcc     loc_BB8F
                andb    #$F7

loc_BB8F:                               ; sub_BA0E+17D↑j
                stab    <BitFlags66_t3
                ldaa    <TpsVolts
                suba    <LowestSessionTpsVolts
                bcc     loc_BB98
                clra

loc_BB98:                               ; sub_BA0E+187↑j
                staa    <TpsVolts_Minus_LowestSessionTpsVolts
                rts
; End of function sub_BA0E


; =============== S U B R O U T I N E =======================================


sub_BB9B:                               ; __RESET+573↑P
                sei
                jsr     sub_E3C7
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
                bcc     loc_BBC9
                ldaa    #$FF

loc_BBC9:                               ; sub_BB9B+2A↑j
                lsra
                lsra
                staa    Temp4
                ldaa    <ScaledDistPWForCruiseControl
                tab
                lsrb
                lsrb
                sba
                adda    Temp4
                bcc     loc_BBDB
                ldaa    #$FF

loc_BBDB:                               ; sub_BB9B+3C↑j
                staa    <ScaledDistPWForCruiseControl
                rts
; End of function sub_BB9B


; =============== S U B R O U T I N E =======================================


sub_BBDE:                               ; __RESET+57F↑P
                ldab    #$1C

loc_BBE0:                               ; sub_BBDE+E↓j
                subb    #2
                bls     loc_BBEF
                ldx     #TL_ThrottleLevelMaxAbove_MINTHR_ToMatureMapLimpin
                abx
                ldx     0,x
                cpx     <EngineRpm_HB
                bcc     loc_BBE0
                lsrb

loc_BBEF:                               ; sub_BBDE+4↑j
                stab    <RPMTableOffset
                rts
; End of function sub_BBDE


; =============== S U B R O U T I N E =======================================


sub_BBF2:                               ; __RESET+594↑P
                clr     Temp0
                ldab    byte_8499
                ldaa    <MapValueTemp3
                mul
                lsld
                rol     Temp0
                lsld
                rol     Temp0
                staa    Temp1
                clra
                ldab    byte_8498
                lsld
                addd    Temp0
                std     Temp0
                ldaa    <RPMTableOffset
                ldab    byte_849A
                mul
                lsrd
                lsrd
                addd    Temp0
                lsrd
                lsrd
                oraa    #0
                beq     loc_BC24
                ldab    #$FF

loc_BC24:                               ; sub_BBF2+2E↑j
                stab    <RPM_Scaled_maybe
                rts
; End of function sub_BBF2


; =============== S U B R O U T I N E =======================================


sub_BC27:                               ; __RESET+570↑P
                ldab    TL_DeltaThrottleFrom_MINTHR_ToDetermineFullThrottle
                addb    <LowestSessionTpsVolts
                bcs     loc_BC33
                cmpb    byte_8020
                bcs     loc_BC36

loc_BC33:                               ; sub_BC27+5↑j
                ldab    byte_8020

loc_BC36:                               ; sub_BC27+A↑j
                brclr   <BitFlags66_t3 $40 loc_BC3C
                subb    #3

loc_BC3C:                               ; sub_BC27:loc_BC36↑j
                cmpb    <TpsVolts
                bcc     loc_BC44
                bset    <BitFlags66_t3 $40
                rts
; ---------------------------------------------------------------------------

loc_BC44:                               ; sub_BC27+17↑j
                bclr    <BitFlags66_t3 $40
                rts
; End of function sub_BC27


; =============== S U B R O U T I N E =======================================


sub_BC48:                               ; __RESET+551↑P
                ldaa    CoolantVoltsTmp1
                ldab    CoolantVoltsTmp2
                mul
                std     Temp1
                ldab    CoolantVoltsTmp1
                subb    CoolantVoltsTmp2
                bls     loc_BC9B
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
                bne     loc_BC9B
                stab    Temp0
                ldaa    Temp0
                ldx     #TL_TempForScaleAmbientA2D
                jsr     Lookup4ByteTable
                tab
                suba    <AmbientAirTempVolts2
                bcc     loc_BC8B
                cmpa    #$F0
                bhi     loc_BC97
                ldab    <AmbientAirTempVolts2
                subb    #$10
                bcc     loc_BC97
                ldab    #0
                bra     loc_BC97
; ---------------------------------------------------------------------------

loc_BC8B:                               ; sub_BC48+33↑j
                cmpa    #$10
                bls     loc_BC97
                ldab    <AmbientAirTempVolts2
                addb    #$10
                bcc     loc_BC97
                ldab    #$FF

loc_BC97:                               ; sub_BC48+37↑j sub_BC48+3D↑j ...
                stab    <AmbientAirTempVolts2
                bra     locret_BCAF
; ---------------------------------------------------------------------------

loc_BC9B:                               ; sub_BC48+10↑j sub_BC48+22↑j
                brset   <b5C_IPL1_t3 2 locret_BCAF
                ldaa    <CoolantTemp
                cmpa    #$C1
                bcc     locret_BCAF
                ldd     #$4708
                jsr     ThrowNonCriticalError
                ldaa    #$C1
                staa    <AmbientAirTempVolts2

locret_BCAF:                            ; sub_BC48+51↑j
                                        ; sub_BC48:loc_BC9B↑j ...
                rts
; End of function sub_BC48


; =============== S U B R O U T I N E =======================================


DetermineTargetBatteryVoltage:          ; __RESET+19B↑P __RESET+554↑P
                ldaa    <AmbientAirTempVolts2
                ldx     #byte_E304
                jsr     Lookup4ByteTable
                staa    Temp5
                ldab    <BodyComputerBatteryVoltsOutput
                addb    #$F8
                bcs     loc_BCC6
                mul
                adca    #0
                bra     loc_BCD2
; ---------------------------------------------------------------------------

loc_BCC6:                               ; DetermineTargetBatteryVoltage+F↑j
                cmpb    #8
                bhi     loc_BCD2
                mul
                adca    Temp5
                bcc     loc_BCD2
                ldaa    #$FF

loc_BCD2:                               ; DetermineTargetBatteryVoltage+14↑j
                                        ; DetermineTargetBatteryVoltage+18↑j ...
                staa    <TargetBatteryVolts
                rts
; End of function DetermineTargetBatteryVoltage


; =============== S U B R O U T I N E =======================================


bcf2_MM:                                ; __RESET+198↑P __RESET+5CD↑P
                brset   <BitFlags6a_t3 $40 locret_BD16
                ldaa    PPROG_EEPROMControlReg
                bita    #2
                bne     locret_BD16
                ldaa    $B7E1
                coma
                cmpa    $B7E0
                beq     loc_BCEB
                ldaa    #8

loc_BCEB:                               ; bcf2_MM+12↑j
                staa    <BodyComputerBatteryVoltsOutput
                ldaa    $B615
                coma
                cmpa    $B614
                beq     loc_BCF9
                clra
                bra     loc_BD05
; ---------------------------------------------------------------------------

loc_BCF9:                               ; bcf2_MM+1F↑j
                cmpa    #$C
                ble     loc_BCFF
                ldaa    #$C

loc_BCFF:                               ; bcf2_MM+26↑j
                cmpa    #$F4
                bge     loc_BD05
                ldaa    #$F4

loc_BD05:                               ; bcf2_MM+22↑j bcf2_MM+2C↑j
                staa    <Ram_4B
                ldaa    $B7EF
                cmpa    #$55
                bne     loc_BD13
                bset    <BitFlags6a_t3 2
                bra     locret_BD16
; ---------------------------------------------------------------------------

loc_BD13:                               ; bcf2_MM+37↑j
                bclr    <BitFlags6a_t3 2

locret_BD16:                            ; bcf2_MM↑j bcf2_MM+9↑j ...
                rts
; End of function bcf2_MM


; =============== S U B R O U T I N E =======================================


sub_BD17:                               ; __RESET+5F2↑P
                clr     Temp4
                ldx     #TL_Spark1A_RPMMAP
                ldaa    <BitFlags6d_t3
                bita    #$50
                bne     loc_BD34
                ldaa    <Ram_CC
                beq     loc_BD2D
                brset   <PIA2_Buffer_t3 2 loc_BD34
                bra     loc_BD31
; ---------------------------------------------------------------------------

loc_BD2D:                               ; sub_BD17+E↑j
                brclr   <PIA2_Buffer_t3 2 loc_BD34

loc_BD31:                               ; sub_BD17+14↑j
                ldx     #TL_Spark1B_RPMMAP

loc_BD34:                               ; sub_BD17+A↑j sub_BD17+10↑j ...
                ldaa    <EngineRPM_3D
                ldab    <MapValue2
                jsr     sub_E44C
                bpl     loc_BD3F
                ldaa    #$7F

loc_BD3F:                               ; sub_BD17+24↑j
                staa    Temp5
                brclr   <IPL1 $10 loc_BD5E
                ldx     #TL_Spark2A_RPMMAP
                ldaa    <EngineRPM_3D
                ldab    <MapValue2
                jsr     sub_E44C
                bpl     loc_BD54
                ldaa    #$7F

loc_BD54:                               ; sub_BD17+39↑j
                adda    Temp5
                bpl     loc_BD5B
                ldaa    #$7F

loc_BD5B:                               ; sub_BD17+40↑j
                staa    Temp5

loc_BD5E:                               ; sub_BD17+2B↑j
                ldx     #byte_8258
                ldab    <RPMTableOffset
                abx
                ldaa    0,x
                cmpa    <MapValue2
                bcc     loc_BDAF
                bset    <BitFlags23 $40
                ldx     #byte_8266
                ldaa    <CoolantTemp_fromTable_Scaled
                jsr     sub_E3AA
                subb    #$20
                stab    Temp4
                ldaa    <IntakeTemp_fromTable_Scaled
                ldx     #byte_826F
                jsr     sub_E3AA
                subb    #$20
                addb    Temp4
                bvc     loc_BD92
                ldab    #$80
                tst     Temp4
                bmi     loc_BD92
                ldab    #$7F

loc_BD92:                               ; sub_BD17+70↑j sub_BD17+77↑j
                stab    Temp4
                ldaa    <BaroPressure
                cmpa    byte_8278
                bcc     loc_BDB2
                subb    byte_8279
                bvc     loc_BDAA
                ldab    #$80
                tst     Temp4
                bmi     loc_BDAA
                ldab    #$7F

loc_BDAA:                               ; sub_BD17+88↑j sub_BD17+8F↑j
                stab    Temp4
                bra     loc_BDB2
; ---------------------------------------------------------------------------

loc_BDAF:                               ; sub_BD17+51↑j
                bclr    <BitFlags23 $40

loc_BDB2:                               ; sub_BD17+83↑j sub_BD17+96↑j
                jsr     sub_BF03
                ldaa    byte_827A
                beq     loc_BDCD
                brset   <BitFlags66_t3 $80 loc_BDCD
                ldab    <VehicleSpeedx8_Scaled
                brclr   <BitFlags23 $10 loc_BDCA
                adda    #3
                bcc     loc_BDCA
                ldaa    #$FF

loc_BDCA:                               ; sub_BD17+A9↑j sub_BD17+AF↑j
                cba
                bcc     loc_BDD2

loc_BDCD:                               ; sub_BD17+A1↑j sub_BD17+A3↑j
                bclr    <BitFlags23 $10
                bra     loc_BDD5
; ---------------------------------------------------------------------------

loc_BDD2:                               ; sub_BD17+B4↑j
                bset    <BitFlags23 $10

loc_BDD5:                               ; sub_BD17+B9↑j
                ldaa    byte_827A
                beq     loc_BE0E
                ldx     #byte_827C
                ldaa    <CoolantTemp_fromTable_Scaled
                jsr     sub_E3AA
                brclr   <BitFlags23 $10 loc_BDF2
                addb    byte_827B
                bpl     loc_BDED
                ldab    #$7F

loc_BDED:                               ; sub_BD17+D2↑j
                stab    Temp5
                bra     loc_BE0E
; ---------------------------------------------------------------------------

loc_BDF2:                               ; sub_BD17+CB↑j
                stab    Temp4
                ldaa    <MapValue
                ldx     #byte_8285
                jsr     sub_E3AA
                ldaa    Temp4
                mul
                adca    #0
                staa    Temp4
                jsr     sub_BF03
                staa    Temp0
                bra     loc_BE71
; ---------------------------------------------------------------------------

loc_BE0E:                               ; sub_BD17+C1↑j sub_BD17+D9↑j
                ldaa    Temp5
                staa    Temp0
                brclr   <IPL1 $40 loc_BE71
                brset   <BitFlags66_t3 $80 loc_BE71
                brset   <BitFlags66_t3 4 loc_BE71
                ldab    <Timer_CountdownFromStartRunForAisFeedback
                bne     loc_BE79
                ldab    <TimerOverflowsBetweenCamPulses
                bne     loc_BE79
                ldab    <EngineRpm_HB
                cmpb    byte_8663
                bcs     loc_BE79
                ldab    <b5C_IPL1_t3
                bitb    #$88
                bne     loc_BE79
                ldab    <CoolantTemp
                cmpb    byte_865F
                bcs     loc_BE79
                ldx     <KeyOnOrEngineRunningTime
                cpx     byte_8661
                bcs     loc_BE79
                ldx     #TL_SparkAdvanceRetardedWhenRpmAboveControl_FromDeltaRpm
                ldd     <EngineRpm_HB
                subd    <TargetIdleSpeedHB
                bcc     loc_BE51
                ldx     #TL_SparkAdvanceAddedWhenRpmBelowControl_FromDeltaRpm
                coma
                comb

loc_BE51:                               ; sub_BD17+133↑j
                lsrd
                lsrd
                lsrd
                lsrd
                bcc     loc_BE5A
                addd    #1

loc_BE5A:                               ; sub_BD17+13E↑j
                tsta
                beq     loc_BE5F
                ldab    #$FF

loc_BE5F:                               ; sub_BD17+144↑j
                tba
                jsr     Lookup4ByteTable
                staa    SparkScatter
                staa    Temp4
                jsr     sub_BF03
                staa    Temp0
                bra     loc_BE7F
; ---------------------------------------------------------------------------

loc_BE71:                               ; sub_BD17+F5↑j sub_BD17+FD↑j ...
                clr     SparkScatter
                clr     SparkScatterIncrement
                bra     loc_BE96
; ---------------------------------------------------------------------------

loc_BE79:                               ; sub_BD17+10B↑j
                                        ; sub_BD17+10F↑j ...
                clr     SparkScatter
                clr     SparkScatterIncrement

loc_BE7F:                               ; sub_BD17+158↑j
                ldaa    byte_8665
                brset   <BitFlags6d_t3 8 loc_BE91
                brset   <BitFlags2a 1 loc_BE8E
                brclr   <b5C_IPL1_t3 2 loc_BE96

loc_BE8E:                               ; sub_BD17+16F↑j
                ldaa    byte_8664

loc_BE91:                               ; sub_BD17+16B↑j
                staa    Temp0
                bra     loc_BEDC
; ---------------------------------------------------------------------------

loc_BE96:                               ; sub_BD17+160↑j
                                        ; sub_BD17+173↑j
                ldd     #$0000
                brclr   <BitFlags2c 8 loc_BEA4
                sei
                bclr    <BitFlags2c 8
                cli
                bra     loc_BEE4
; ---------------------------------------------------------------------------

loc_BEA4:                               ; sub_BD17+182↑j
                ldaa    Temp0
                decb
                cmpb    <Ram_4C
                beq     loc_BEE1
                brclr   <IPL1 1 loc_BEE1
                brset   <BitFlags66_t3 $80 loc_BEE1
                cmpa    <Ram_4C
                bls     loc_BEE1
                ldaa    <EngineRpmTemp
                suba    <EngineRpm_HB
                bcs     loc_BEC3
                cmpa    byte_8082
                bcc     loc_BEDC

loc_BEC3:                               ; sub_BD17+1A5↑j
                ldaa    <Ram_4C
                ldab    <CounterUp_43
                cmpb    byte_8081
                tab
                bcs     loc_BEE4
                ldaa    <Ram_4C
                adda    byte_8080
                bpl     loc_BED6
                ldaa    #$7F

loc_BED6:                               ; sub_BD17+1BB↑j
                tab
                cmpa    Temp0
                bcs     loc_BEE1

loc_BEDC:                               ; sub_BD17+17D↑j
                                        ; sub_BD17+1AA↑j
                ldaa    Temp0
                ldab    #$FF

loc_BEE1:                               ; sub_BD17+193↑j
                                        ; sub_BD17+195↑j ...
                clr     CounterUp_43

loc_BEE4:                               ; sub_BD17+18B↑j
                                        ; sub_BD17+1B4↑j
                staa    Temp0
                stab    <Ram_4C
                adda    <Ram_4B
                bvc     loc_BEF3
                bpl     loc_BEF5
                ldaa    #$7F
                bra     loc_BEF6
; ---------------------------------------------------------------------------

loc_BEF3:                               ; sub_BD17+1D4↑j
                bpl     loc_BEF6

loc_BEF5:                               ; sub_BD17+1D6↑j
                clra

loc_BEF6:                               ; sub_BD17+1DA↑j
                                        ; sub_BD17:loc_BEF3↑j
                ldab    UNe_6481
                bitb    #2
                beq     loc_BF00
                ldaa    UNe_6482

loc_BF00:                               ; sub_BD17+1E4↑j
                staa    <AdvanceTemporary
                rts
; End of function sub_BD17


; =============== S U B R O U T I N E =======================================


sub_BF03:                               ; sub_BD17:loc_BDB2↑P
                                        ; sub_BD17+EF↑P ...
                tst     Temp4
                bpl     loc_BF13
                ldaa    Temp4
                adda    Temp5
                bpl     loc_BF1D
                clra
                bra     loc_BF1D
; ---------------------------------------------------------------------------

loc_BF13:                               ; sub_BF03+3↑j
                ldaa    Temp4
                adda    Temp5
                bpl     loc_BF1D
                ldaa    #$7F

loc_BF1D:                               ; sub_BF03+B↑j sub_BF03+E↑j ...
                staa    Temp5
                rts
; End of function sub_BF03


; =============== S U B R O U T I N E =======================================


sub_BF21:                               ; __RESET+582↑P
                ldaa    <TimerOverflowsBetweenCamPulses
                bne     loc_BF5C
                ldd     byte_807C
                cpd     byte_82B1
                bcc     loc_BF31
                ldd     byte_82B1

loc_BF31:                               ; sub_BF21+B↑j
                cpd     <DistributorFallingEdgePulsewidth_HB
                bcs     loc_BF5C
                ldx     #SwitchPortAccessReg1
                brset   <IPL1 $41 loc_BF62
                brset   <BitFlags23 $80 loc_BF4F
                brclr   0,x $20 loc_BF62
                bset    <BitFlags23 $80
                ldaa    byte_807E
                staa    <Ram_7F
                bra     locret_BF65
; ---------------------------------------------------------------------------

loc_BF4F:                               ; sub_BF21+1C↑j
                brset   0,x $20 locret_BF65
                ldaa    <Ram_7F
                beq     locret_BF65
                deca
                staa    <Ram_7F
                bra     locret_BF65
; ---------------------------------------------------------------------------

loc_BF5C:                               ; sub_BF21+2↑j sub_BF21+13↑j
                bclr    <IPL1 $41
                bclr    <BitFlags23 $80

loc_BF62:                               ; sub_BF21+18↑j sub_BF21+20↑j
                clr     Ram_7F

locret_BF65:                            ; sub_BF21+2C↑j
                                        ; sub_BF21:loc_BF4F↑j ...
                rts
; End of function sub_BF21


; =============== S U B R O U T I N E =======================================


calc_fuel_MM:                           ; __RESET+3CA↑P __RESET+58E↑P
                brset   <IPL1 $40 locret_BF7F
                ldaa    <CoolantTemp_fromTable_Scaled
                ldx     #byte_8449
                jsr     sub_E3AA
                pshb
                ldaa    <BaroPressure
                ldx     #byte_8452
                jsr     sub_E3AA
                pula
                mul
                std     <Ram_71

locret_BF7F:                            ; calc_fuel_MM↑j
                rts
; End of function calc_fuel_MM


; =============== S U B R O U T I N E =======================================


sub_BF80:                               ; __RESET+5F5↑P
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    byte_864A
                bcs     loc_BFE2
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    byte_864B
                bcs     loc_BFE2
                ldaa    <CoolantTemp
                cmpa    byte_864C
                bcs     loc_BFE2
                ldaa    <BaroPressure
                cmpa    byte_8651
                bcs     loc_BFE2
                ldaa    byte_8647
                ldab    <TargetIdleSpeedHB
                mul
                addd    <TargetIdleSpeedHB
                bcc     loc_BFA9
                ldd     #$FFFF

loc_BFA9:                               ; sub_BF80+24↑j
                cpd     <EngineRpm_HB
                bcc     loc_BFE2
                brclr   <BitFlags2c $40 loc_BFB9
                jsr     sub_C03B
                brset   <BitFlags2c $40 loc_BFE2

loc_BFB9:                               ; sub_BF80+2E↑j
                ldaa    byte_8652
                bne     loc_BFC4
                brclr   <BitFlags66_t3 $80 loc_BFE9
                bra     loc_BFE2
; ---------------------------------------------------------------------------

loc_BFC4:                               ; sub_BF80+3C↑j
                cmpa    #1
                bne     loc_BFD2
                ldd     <Ram_73
                cpd     byte_8653
                bcs     loc_BFE9
                bra     loc_BFE2
; ---------------------------------------------------------------------------

loc_BFD2:                               ; sub_BF80+46↑j
                cmpa    #2
                bne     loc_BFE2
                ldd     <Ram_73
                cpd     byte_8653
                bcc     loc_BFE2
                brclr   <BitFlags66_t3 $80 loc_BFE9

loc_BFE2:                               ; sub_BF80+5↑j sub_BF80+C↑j ...
                ldaa    byte_8648
                staa    <Counter_E
                bra     loc_BFF0
; ---------------------------------------------------------------------------

loc_BFE9:                               ; sub_BF80+3E↑j sub_BF80+4E↑j ...
                ldaa    <Counter_E
                bne     loc_BFF0
                bset    <BitFlags2c $C0

loc_BFF0:                               ; sub_BF80+67↑j sub_BF80+6B↑j
                ldd     byte_8655
                brclr   <BitFlags2c 2 loc_BFFF
                subd    byte_8657
                bcc     loc_BFFF
                ldd     #$0000

loc_BFFF:                               ; sub_BF80+73↑j sub_BF80+7A↑j
                cpd     <EngineRpm_HB
                bcc     loc_C01B
                ldaa    byte_8659
                brclr   <BitFlags2c 2 loc_C012
                suba    byte_865A
                bcc     loc_C012
                ldaa    #$00

loc_C012:                               ; sub_BF80+87↑j sub_BF80+8E↑j
                cmpa    <VehicleSpeedx8_Scaled
                bcc     loc_C01B
                bset    <BitFlags2c 2
                bra     loc_C01E
; ---------------------------------------------------------------------------

loc_C01B:                               ; sub_BF80+82↑j sub_BF80+94↑j
                bclr    <BitFlags2c 2

loc_C01E:                               ; sub_BF80+99↑j
                ldd     byte_865B
                brclr   <BitFlags2c 1 loc_C02D
                subd    byte_865D
                bcc     loc_C02D
                ldd     #$0000

loc_C02D:                               ; sub_BF80+A1↑j sub_BF80+A8↑j
                cpd     <EngineRpm_HB
                bcc     loc_C037
                bset    <BitFlags2c 1
                bra     locret_C03A
; ---------------------------------------------------------------------------

loc_C037:                               ; sub_BF80+B0↑j
                bclr    <BitFlags2c 1

locret_C03A:                            ; sub_BF80+B5↑j
                rts
; End of function sub_BF80


; =============== S U B R O U T I N E =======================================


sub_C03B:                               ; sub_BF80+32↑P
                tst     CounterDn_b7_o2
                bne     locret_C078
                ldaa    <EngineRpm_HB
                cmpa    <RpmRelated0087
                bcs     locret_C078
                ldd     <Ram_73
                cpd     byte_864D
                bcc     loc_C050
                bra     loc_C075
; ---------------------------------------------------------------------------

loc_C050:                               ; sub_C03B+11↑j
                ldx     <Ram_73
                ldaa    byte_8649
                bne     loc_C05D
                brset   <BitFlags66_t3 $80 loc_C075
                bra     locret_C078
; ---------------------------------------------------------------------------

loc_C05D:                               ; sub_C03B+1A↑j
                cmpa    #1
                bne     loc_C068
                cpx     byte_864F
                bcc     loc_C075
                bra     locret_C078
; ---------------------------------------------------------------------------

loc_C068:                               ; sub_C03B+24↑j
                cmpa    #2
                bne     loc_C075
                brclr   <BitFlags66_t3 $80 locret_C078
                cpx     byte_864F
                bcs     locret_C078

loc_C075:                               ; sub_C03B+13↑j sub_C03B+1C↑j ...
                bclr    <BitFlags2c $40

locret_C078:                            ; sub_C03B+3↑j sub_C03B+9↑j ...
                rts
; End of function sub_C03B


; =============== S U B R O U T I N E =======================================


sub_C079:                               ; __RESET+591↑P
                ldx     #byte_84B4
                ldd     <EngineRpm_HB
                aslb
                adca    #0
                jsr     Lookup4ByteTable
                staa    Temp0
                ldab    <MapValue
                ldx     #TL_O2LoLimitForInMiddleDetermination
                jsr     sub_E44C
                staa    <o2LowLimitForInMiddleDetermination
                ldaa    Temp0
                ldab    <MapValue
                ldx     #TL_O2HiLimitForInMiddleDetermination
                jsr     sub_E44C
                staa    <o2HighLimitForInMiddleDetermination
                rts
; End of function sub_C079


; =============== S U B R O U T I N E =======================================


sub_C09F:                               ; __RESET+5F8↑P
                ldaa    <CoolantTemp
                cmpa    byte_8637
                bcc     loc_C0AF
                ldd     #$0000
                staa    <Ram_82
                std     <Counter_F_HB
                bra     locret_C10B
; ---------------------------------------------------------------------------

loc_C0AF:                               ; sub_C09F+5↑j
                ldab    <EngineRpmTemp
                cmpb    byte_8638
                bcs     loc_C0BA
                brset   <BitFlags66_t3 $40 loc_C0D9

loc_C0BA:                               ; sub_C09F+15↑j
                ldaa    <EngineRpmTemp
                ldab    <RPM_Scaled_maybe
                cmpa    byte_863C
                bls     loc_C0C8
                cmpb    byte_863D
                bhi     loc_C0CD

loc_C0C8:                               ; sub_C09F+22↑j
                clr     Ram_82
                bra     loc_C0D2
; ---------------------------------------------------------------------------

loc_C0CD:                               ; sub_C09F+27↑j
                ldaa    byte_863E
                staa    <Ram_82

loc_C0D2:                               ; sub_C09F+2C↑j
                ldd     #$0000
                std     <Counter_F_HB
                bra     locret_C10B
; ---------------------------------------------------------------------------

loc_C0D9:                               ; sub_C09F+17↑j
                ldaa    <EngineRpmTemp
                cmpa    byte_8639
                bhi     loc_C0F8
                ldab    <Ram_82
                cmpa    byte_8641
                bcs     loc_C0EC
                cmpb    byte_863A
                beq     loc_C0F6

loc_C0EC:                               ; sub_C09F+46↑j
                ldaa    byte_863B
                staa    <Ram_82
                ldd     #$0000
                std     <Counter_F_HB

loc_C0F6:                               ; sub_C09F+4B↑j
                bra     locret_C10B
; ---------------------------------------------------------------------------

loc_C0F8:                               ; sub_C09F+3F↑j
                ldx     <Counter_F_HB
                cpx     byte_863F
                bcc     loc_C106
                ldaa    byte_863B
                staa    <Ram_82
                bra     locret_C10B
; ---------------------------------------------------------------------------

loc_C106:                               ; sub_C09F+5E↑j
                ldaa    byte_863A
                staa    <Ram_82

locret_C10B:                            ; sub_C09F+E↑j sub_C09F+38↑j ...
                rts
; End of function sub_C09F


; =============== S U B R O U T I N E =======================================


sub_C10C:                               ; __RESET+5FB↑P
                sei
                ldaa    <MapValueTemp2
                staa    <Ram_9D
                ldaa    <MapValue
                staa    <Ram_9E
                ldd     <DistributorFallingEdgePulsewidth_HB
                std     <Ram_9F
                ldaa    <Counter_O2SensorFeedbackCount_Signed
                staa    <Ram_A2
                ldaa    <BitFlags29
                eora    <Ram_A1
                anda    #$80
                beq     loc_C12A
                bset    <BitFlags29 1
                bra     loc_C12D
; ---------------------------------------------------------------------------

loc_C12A:                               ; sub_C10C+17↑j
                bclr    <BitFlags29 1

loc_C12D:                               ; sub_C10C+1C↑j
                ldaa    <BitFlags29
                staa    <Ram_A1
                cli
                ldab    <Ram_0B
                cmpb    byte_8634
                bcs     loc_C13E
                cmpb    byte_8633
                bls     loc_C144

loc_C13E:                               ; sub_C10C+2B↑j
                ldaa    #$80
                staa    <Ram_0B
                staa    <ValueFromAdaptiveMemory

loc_C144:                               ; sub_C10C+30↑j
                brclr   <Ram_A1 $40 loc_C19D
                ldaa    <Ram_9D
                suba    <Ram_9E
                bcc     loc_C14F
                nega

loc_C14F:                               ; sub_C10C+40↑j
                cmpa    byte_8623
                bcc     loc_C19D
                ldaa    <CoolantTemp
                cmpa    byte_8622
                bcs     loc_C19D
                ldaa    <Ram_9F
                cmpa    byte_8626
                bcc     loc_C187
                cmpa    byte_8625
                bcc     loc_C19D
                cmpa    byte_8624
                bcs     loc_C19D
                ldaa    <Ram_9E
                cmpa    byte_8628
                bcs     loc_C182
                ldx     #byte_8629
                brset   <BitFlags2c $20 loc_C19F
                bset    <BitFlags2c $20
                bclr    <BitFlags2c $10
                bra     loc_C194
; ---------------------------------------------------------------------------

loc_C182:                               ; sub_C10C+65↑j
                cmpa    byte_8627
                bcc     loc_C19D

loc_C187:                               ; sub_C10C+54↑j
                ldx     #byte_862E
                brset   <BitFlags2c $10 loc_C19F
                bset    <BitFlags2c $10
                bclr    <BitFlags2c $20

loc_C194:                               ; sub_C10C+74↑j
                clra
                clrb
                std     <Ram_9B
                ldaa    0,x
                staa    <Ram_99

locret_C19C:                            ; sub_C10C:loc_C19F↓j
                                        ; sub_C10C+A4↓j
                rts
; ---------------------------------------------------------------------------

loc_C19D:                               ; sub_C10C:loc_C144↑j
                                        ; sub_C10C+46↑j ...
                bra     loc_C1FB
; ---------------------------------------------------------------------------

loc_C19F:                               ; sub_C10C+6A↑j sub_C10C+7E↑j
                brclr   <Ram_A1 1 locret_C19C
                clra
                staa    Temp0
                ldab    <Ram_A2
                addd    <Ram_9B
                std     <Ram_9B
                dec     Ram_99
                bne     locret_C19C
                subd    1,x
                bcs     loc_C1BD
                subd    3,x
                bcs     loc_C1FB
                inc     Temp0

loc_C1BD:                               ; sub_C10C+A8↑j
                brset   <BitFlags2c $20 loc_C1DD
                ldaa    <Ram_9A
                beq     loc_C1FB
                deca
                staa    <Ram_9A
                ldaa    <ValueFromAdaptiveMemory
                ldab    Temp0
                beq     loc_C1D4
                adda    byte_8635
                bra     loc_C1D7
; ---------------------------------------------------------------------------

loc_C1D4:                               ; sub_C10C+C1↑j
                suba    byte_8635

loc_C1D7:                               ; sub_C10C+C6↑j
                bcs     loc_C1FB
                staa    <ValueFromAdaptiveMemory
                bra     loc_C1FB
; ---------------------------------------------------------------------------

loc_C1DD:                               ; sub_C10C:loc_C1BD↑j
                ldaa    <Ram_0B
                ldab    Temp0
                beq     loc_C1E6
                inca
                inca

loc_C1E6:                               ; sub_C10C+D6↑j
                deca
                ldab    byte_8633
                cba
                bcc     loc_C1F4
                ldab    byte_8634
                cba
                bcs     loc_C1F4
                tab

loc_C1F4:                               ; sub_C10C+DF↑j sub_C10C+E5↑j
                stab    <Ram_0B
                ldaa    byte_8636
                staa    <Ram_9A

loc_C1FB:                               ; sub_C10C:loc_C19D↑j
                                        ; sub_C10C+AC↑j ...
                bclr    <BitFlags2c $30
                rts
; End of function sub_C10C


; =============== S U B R O U T I N E =======================================


sub_C1FF:                               ; __RESET+5FE↑P
                ldaa    <MapValue
                ldab    byte_8614
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
; End of function sub_C1FF


; =============== S U B R O U T I N E =======================================


sub_C211:                               ; __RESET+5CA↑P
                ldx     <Counter_A_HB
                beq     loc_C218
                dex
                stx     <Counter_A_HB

loc_C218:                               ; sub_C211+2↑j
                ldaa    <Counter_B
                beq     loc_C21F
                deca
                staa    <Counter_B

loc_C21F:                               ; sub_C211+9↑j
                ldaa    <Counter_C
                beq     loc_C226
                deca
                staa    <Counter_C

loc_C226:                               ; sub_C211+10↑j
                brclr   <IPL1 $40 loc_C246
                brset   <BitFlags2c 4 loc_C23C
                ldaa    <Counter_X
                beq     loc_C237
                deca
                staa    <Counter_X
                bne     loc_C246

loc_C237:                               ; sub_C211+1F↑j
                sei
                bset    <BitFlags2c 4
                cli

loc_C23C:                               ; sub_C211+19↑j
                ldaa    <PreviousCoolantTemp_fromTable_Scaled
                ldx     #byte_84A8
                jsr     sub_E3AA
                stab    <Counter_X

loc_C246:                               ; sub_C211:loc_C226↑j
                                        ; sub_C211+24↑j
                ldaa    <Counter_D
                inca
                beq     loc_C24D
                staa    <Counter_D

loc_C24D:                               ; sub_C211+38↑j
                ldaa    <Counter_E
                beq     loc_C254
                deca
                staa    <Counter_E

loc_C254:                               ; sub_C211+3E↑j
                ldx     <Counter_F_HB
                inx
                beq     locret_C25B
                stx     <Counter_F_HB

locret_C25B:                            ; sub_C211+46↑j
                rts
; End of function sub_C211


; =============== S U B R O U T I N E =======================================


CalculateVariousFactors2:               ; __RESET:CalculateVariousFactors3↑P
                                        ; __RESET+58B↑P
                ldaa    <IntakeTemp_fromTable_Scaled
                ldx     #byte_8421
                jsr     sub_E3AA
                stab    <Ram_81
                ldaa    <CoolantTemp_fromTable_Scaled
                brset   <IPL1 $40 loc_C290
                ldaa    <PreviousCoolantTemp_fromTable_Scaled
                ldx     #byte_84A8
                jsr     sub_E3AA
                stab    <Counter_X
                ldaa    <CoolantTemp_fromTable_Scaled
                ldx     #byte_83FD
                jsr     sub_E3AA
                stab    <Ram_BD
                ldx     #byte_847B
                jsr     sub_E3AA
                tba
                clrb
                lsrd
                lsrd
                lsrd
                lsrd
                std     <Counter_A_HB
                ldaa    <CoolantTemp_fromTable_Scaled

loc_C290:                               ; CalculateVariousFactors2+C↑j
                ldx     #byte_8406
                jsr     sub_E3AA
                stab    <Ram_BE
                ldx     #byte_83EB
                jsr     sub_E3AA
                stab    <Ram_A3
                ldx     #byte_8484
                jsr     sub_E3AA
                stab    <Ram_A6
                ldx     #byte_83F4
                jsr     sub_E3AA
                stab    <Ram_A9
                ldx     #byte_8469
                jsr     sub_E3AA
                stab    <MapAverageFactorRAM_LB
                ldx     #byte_8460
                jsr     sub_E3AA
                stab    <TPSAverageFactorRAM_HB
                ldx     #byte_8472
                jsr     sub_E3AA
                stab    <TPSAverageFactorRAM_LB
                ldx     #byte_848D
                jsr     sub_E3AA
                stab    <Ram_AC
                ldaa    <BatteryVolts
                ldx     #byte_842A
                jsr     Lookup4ByteTable
                stab    <Ram_B1
                ldaa    <BatteryVolts
                ldx     #byte_E317
                jsr     Lookup4ByteTable
                stab    CalculatedDwellTime
                rts
; End of function CalculateVariousFactors2


; =============== S U B R O U T I N E =======================================


sub_C2E6:                               ; sub_C5F1:loc_C7D8↓P
                ldaa    <TimerOverflowsBetweenCamPulses
                bne     loc_C2F2
                ldd     byte_82AF
                cpd     <DistributorFallingEdgePulsewidth_HB
                bcc     loc_C2F7

loc_C2F2:                               ; sub_C2E6+2↑j
                bset    <BitFlags29 2
                bra     loc_C301
; ---------------------------------------------------------------------------

loc_C2F7:                               ; sub_C2E6+A↑j
                ldd     <EngineRpm_HB
                cpd     <TargetIdleSpeedHB
                bcs     loc_C301
                bclr    <BitFlags29 2

loc_C301:                               ; sub_C2E6+F↑j sub_C2E6+16↑j
                brclr   <BitFlags29 2 loc_C314
                clrb
                ldaa    <MapValue
                std     <MapValueTemp2
                ldaa    <EngineRpm_HB
                std     <EngineRpmTemp
                ldaa    <TpsVolts
                std     <TPSVoltsTemp_B
                bra     loc_C341
; ---------------------------------------------------------------------------

loc_C314:                               ; sub_C2E6:loc_C301↑j
                ldx     #TPSAverageFactorRAM_HB
                ldaa    <MapValueTemp2
                suba    <MapValue
                bcc     loc_C320
                ldx     #byte_861B

loc_C320:                               ; sub_C2E6+35↑j
                ldy     #$008C
                ldaa    <MapValue
                jsr     sub_E4D0
                ldx     #byte_849B
                ldy     #$0088
                ldaa    <EngineRpm_HB
                jsr     sub_E4D0
                ldx     #byte_8620
                ldy     #$0097
                ldaa    <TpsVolts
                jsr     sub_E4D0

loc_C341:                               ; sub_C2E6+2C↑j
                ldx     #byte_8496
                ldy     #$008E
                ldaa    <MapValue
                jsr     sub_E4D0
                rts
; End of function sub_C2E6


; =============== S U B R O U T I N E =======================================


sub_C34E:                               ; sub_C5F1:loc_C7F7↓P
                ldx     #byte_8615
                ldaa    <MapValueTemp1
                cmpa    <MapValue
                bcc     loc_C35A
                ldx     #MapAverageFactorRAM_HB

loc_C35A:                               ; sub_C34E+7↑j
                ldy     #$008A
                ldaa    <MapValue
                jsr     sub_E4D0
                ldx     #byte_8619
                ldaa    <TPSVoltsTemp_A
                cmpa    <TpsVolts
                bcc     loc_C36F
                ldx     #TPSAverageFactorRAM_HB

loc_C36F:                               ; sub_C34E+1C↑j
                ldy     #$0095
                ldaa    <TpsVolts
                jsr     sub_E4D0
                rts
; End of function sub_C34E


; =============== S U B R O U T I N E =======================================


sub_C379:                               ; sub_C5F1+6F↓P
                brset   <BitFlags6d_t3 $40 loc_C385
                brclr   <PIA2_Buffer_t3 2 loc_C38D
                ldaa    <Ram_CC
                bne     loc_C38D

loc_C385:                               ; sub_C379↑j
                ldaa    byte_84A3
                ldx     #TL_HotLoad3DTableOffIdle
                bra     loc_C393
; ---------------------------------------------------------------------------

loc_C38D:                               ; sub_C379+4↑j sub_C379+A↑j
                ldaa    byte_84A4
                ldx     #TL_ColdLoad3DTableOffIdle

loc_C393:                               ; sub_C379+12↑j
                staa    <Ram_85
                ldaa    <EngineRPM_3D
                ldab    <MapValue2
                jsr     sub_E44C
                staa    <Ram_86
                rts
; End of function sub_C379


; =============== S U B R O U T I N E =======================================


sub_C39F:                               ; ROM:ECE6↓P ROM:loc_F305↓P
                ldaa    <MapValue
                ldx     #byte_840F
                jsr     sub_E3AA
                ldaa    <Ram_BE
                lsra
                mul
                ldab    <Ram_BE
                lsrb
                lsrb
                aba
                bcs     loc_C3CE
                staa    LDXi_6490
                brclr   <BitFlags2c 4 loc_C3C6
                ldaa    <Ram_BD
                beq     loc_C3C3
                ldab    byte_84A7
                mul
                staa    <Ram_BD

loc_C3C3:                               ; sub_C39F+1C↑j
                bclr    <BitFlags2c 4

loc_C3C6:                               ; sub_C39F+16↑j
                ldaa    LDXi_6490
                ldab    <Ram_BD
                aba
                bcc     loc_C3D0

loc_C3CE:                               ; sub_C39F+11↑j
                ldaa    #$FF

loc_C3D0:                               ; sub_C39F+2D↑j
                staa    <Ram_84
                rts
; End of function sub_C39F


; =============== S U B R O U T I N E =======================================


sub_C3D3:                               ; ROM:ECE9↓P ROM:F308↓P
                ldd     <Ram_73
                cpd     byte_84B2
                bcc     loc_C3E0
                bset    <BitFlags29 $20
                bra     loc_C3EC
; ---------------------------------------------------------------------------

loc_C3E0:                               ; sub_C3D3+6↑j
                bclr    <BitFlags29 $20
                brset   <BitFlags2c $80 loc_C3EC
                tst     Ram_82
                beq     loc_C3F1

loc_C3EC:                               ; sub_C3D3+B↑j sub_C3D3+10↑j
                ldaa    byte_84B1
                staa    <CounterDn_b9_o2

loc_C3F1:                               ; sub_C3D3+17↑j
                ldaa    <Ram_B4
                cmpa    byte_89F7
                bcs     loc_C41E
                brclr   <BitFlags29 $80 loc_C40D
                brset   <b5D_IPL2_t3 1 loc_C43D
                ldd     #$0381
                jsr     ThrowNonCriticalError
                bcc     loc_C41E
                bset    <b5D_IPL2_t3 1
                bra     loc_C43D
; ---------------------------------------------------------------------------

loc_C40D:                               ; sub_C3D3+25↑j
                brset   <b5D_IPL2_t3 2 loc_C43D
                ldd     #$0481
                jsr     ThrowNonCriticalError
                bcc     loc_C41E
                bset    <b5D_IPL2_t3 2
                bra     loc_C43D
; ---------------------------------------------------------------------------

loc_C41E:                               ; sub_C3D3+23↑j sub_C3D3+33↑j ...
                tst     CounterDn_b9_o2
                bne     loc_C43D
                ldd     <Counter_A_HB
                bne     loc_C43D
                brset   <BitFlags29 $40 loc_C437
                ldaa    <O2SensorVolts
                cmpa    byte_89F5
                bcc     loc_C437
                cmpa    byte_89F6
                bcc     loc_C43D

loc_C437:                               ; sub_C3D3+54↑j sub_C3D3+5D↑j
                ldaa    <O2SensorVolts
                cmpa    #$3E
                bcs     loc_C450

loc_C43D:                               ; sub_C3D3+29↑j sub_C3D3+38↑j ...
                bclr    <BitFlags29 $54
                ldaa    byte_860F
                staa    <CounterDn_ba_o2
                ldaa    byte_8611
                staa    <CounterDn_bc_o2
                ldaa    #$80
                staa    <Counter_O2SensorFeedbackCount_Signed
                bra     locret_C47C
; ---------------------------------------------------------------------------

loc_C450:                               ; sub_C3D3+68↑j
                jsr     sub_C47D
                ldaa    <BitFlags29
                bita    #4
                beq     loc_C461
                clr     Ram_B4
                jsr     sub_C4A8
                bra     loc_C464
; ---------------------------------------------------------------------------

loc_C461:                               ; sub_C3D3+84↑j
                jsr     sub_C4E4

loc_C464:                               ; sub_C3D3+8C↑j
                brset   <BitFlags29 $80 loc_C470
                adda    <Counter_O2SensorFeedbackCount_Signed
                bcc     loc_C477
                ldaa    #$FF
                bra     loc_C477
; ---------------------------------------------------------------------------

loc_C470:                               ; sub_C3D3:loc_C464↑j
                tab
                ldaa    <Counter_O2SensorFeedbackCount_Signed
                sba
                bcc     loc_C477
                clra

loc_C477:                               ; sub_C3D3+97↑j sub_C3D3+9B↑j ...
                staa    <Counter_O2SensorFeedbackCount_Signed
                bset    <BitFlags29 $40

locret_C47C:                            ; sub_C3D3+7B↑j
                rts
; End of function sub_C3D3


; =============== S U B R O U T I N E =======================================


sub_C47D:                               ; sub_C3D3:loc_C450↑P
                ldab    <O2SensorVolts
                ldaa    <BitFlags29
                cmpb    <o2HighLimitForInMiddleDetermination
                bcs     loc_C491
                cmpb    <o2LowLimitForInMiddleDetermination
                bcc     loc_C48D
                brclr   <BitFlags29 $80 loc_C491

loc_C48D:                               ; sub_C47D+A↑j
                ldab    #$80
                bra     loc_C492
; ---------------------------------------------------------------------------

loc_C491:                               ; sub_C47D+6↑j sub_C47D+C↑j
                clrb

loc_C492:                               ; sub_C47D+12↑j
                pshb
                eorb    <BitFlags29
                aslb
                bcc     loc_C49F
                oraa    #4
                clr     Ram_B4
                bra     loc_C4A1
; ---------------------------------------------------------------------------

loc_C49F:                               ; sub_C47D+19↑j
                anda    #$FB

loc_C4A1:                               ; sub_C47D+20↑j
                anda    #$7F
                pulb
                aba
                staa    <BitFlags29
                rts
; End of function sub_C47D


; =============== S U B R O U T I N E =======================================


sub_C4A8:                               ; sub_C3D3+89↑P
                brclr   <BitFlags29 $10 loc_C4BA
                ldaa    <CounterUp_b6_o2
                ldab    byte_860E
                cba
                bcs     loc_C4B8
                stab    <Ram_B5
                bra     loc_C4BA
; ---------------------------------------------------------------------------

loc_C4B8:                               ; sub_C4A8+A↑j
                staa    <Ram_B5

loc_C4BA:                               ; sub_C4A8↑j sub_C4A8+E↑j
                bclr    <BitFlags29 $10
                clr     CounterUp_b6_o2
                ldaa    byte_860F
                staa    <CounterDn_ba_o2
                ldaa    byte_8611
                staa    <CounterDn_bc_o2
                ldab    <Ram_B5
                ldaa    <EngineRpm_HB
                cmpa    byte_860D
                bcc     loc_C4D8
                addb    byte_860B
                bra     loc_C4DB
; ---------------------------------------------------------------------------

loc_C4D8:                               ; sub_C4A8+29↑j
                addb    byte_860C

loc_C4DB:                               ; sub_C4A8+2E↑j
                bcc     loc_C4DF
                ldab    #$FF

loc_C4DF:                               ; sub_C4A8:loc_C4DB↑j
                tba
                lsr     Ram_B5
                rts
; End of function sub_C4A8


; =============== S U B R O U T I N E =======================================


sub_C4E4:                               ; sub_C3D3:loc_C461↑P
                clra
                ldab    <CounterDn_bc_o2
                bne     loc_C531
                ldab    <BitFlags29
                bitb    #$10
                bne     loc_C4FE
                clr     CounterUp_b6_o2
                bset    <BitFlags29 $10
                ldab    byte_8610
                stab    <CounterDn_bb_o2
                ldaa    #1
                bra     locret_C53C
; ---------------------------------------------------------------------------

loc_C4FE:                               ; sub_C4E4+9↑j
                ldab    <CounterUp_b6_o2
                cmpb    byte_8613
                bcs     loc_C524
                brset   <BitFlags2c $80 loc_C517
                ldab    <VehicleSpeedx8_Scaled
                beq     loc_C517
                ldab    <EngineRpm_HB
                cmpb    byte_89F4
                bcs     loc_C517
                inc     Ram_B4

loc_C517:                               ; sub_C4E4+21↑j sub_C4E4+27↑j ...
                ldaa    byte_8612
                clrb
                lsrd
                lsrd
                lsrd
                lsrd
                std     <Counter_A_HB
                clra
                bra     locret_C53C
; ---------------------------------------------------------------------------

loc_C524:                               ; sub_C4E4+1F↑j
                ldab    <CounterDn_bb_o2
                bne     loc_C52F
                ldaa    #1
                ldab    byte_8610
                stab    <CounterDn_bb_o2

loc_C52F:                               ; sub_C4E4+42↑j
                bra     locret_C53C
; ---------------------------------------------------------------------------

loc_C531:                               ; sub_C4E4+3↑j
                ldab    <CounterDn_ba_o2
                bne     locret_C53C
                ldab    byte_860F
                stab    <CounterDn_ba_o2
                ldaa    #1

locret_C53C:                            ; sub_C4E4+18↑j sub_C4E4+3E↑j ...
                rts
; End of function sub_C4E4


; =============== S U B R O U T I N E =======================================


sub_C53D:                               ; sub_C5F1:loc_C648↓P
                brclr   <BitFlags66_t3 $80 loc_C551
                ldab    <MapValue
                subb    <MapValueTemp1
                bcs     loc_C551
                ldaa    <Ram_A4
                bne     loc_C554
                ldaa    byte_8616
                cba
                bcs     loc_C554

loc_C551:                               ; sub_C53D↑j sub_C53D+8↑j
                clrb
                bra     loc_C556
; ---------------------------------------------------------------------------

loc_C554:                               ; sub_C53D+C↑j sub_C53D+12↑j
                ldaa    <Ram_A3

loc_C556:                               ; sub_C53D+15↑j
                mul
                std     <Ram_A4
                ldaa    <TPSVoltsTemp_A
                ldab    byte_8618
                addb    <LowestSessionTpsVolts
                bcc     loc_C564
                ldab    #$FF

loc_C564:                               ; sub_C53D+23↑j
                cba
                bcc     loc_C572
                ldaa    <TpsVolts
                suba    <TPSVoltsTemp_A
                bcs     loc_C572
                cmpa    byte_8617
                bcc     loc_C573

loc_C572:                               ; sub_C53D+28↑j sub_C53D+2E↑j
                clra

loc_C573:                               ; sub_C53D+33↑j
                ldab    <Ram_A6
                mul
                std     <Ram_A7
                rts
; End of function sub_C53D


; =============== S U B R O U T I N E =======================================


sub_C579:                               ; ROM:ECEC↓P ROM:F30B↓P
                clra
                ldab    <Counter_C
                beq     loc_C581
                jmp     locret_C5B9
; ---------------------------------------------------------------------------

loc_C581:                               ; sub_C579+3↑j
                ldab    <EngineRpm_HB
                cmpb    byte_861D
                bcs     loc_C595
                ldab    <MapValueTemp2
                subb    <MapValue
                bcs     loc_C595
                cmpb    byte_861B
                bcs     loc_C595
                ldaa    <Ram_A9

loc_C595:                               ; sub_C579+D↑j sub_C579+13↑j ...
                mul
                std     <Ram_AA
                ldab    <TpsVolts
                ldaa    <LowestSessionTpsVolts
                adda    byte_861F
                bcc     loc_C5A3
                ldaa    #$FF

loc_C5A3:                               ; sub_C579+26↑j
                cba
                bcs     loc_C5B0
                ldaa    <TPSVoltsTemp_B
                sba
                bcs     loc_C5B0
                cmpa    byte_861E
                bcc     loc_C5B4

loc_C5B0:                               ; sub_C579+2B↑j sub_C579+30↑j
                clra
                clrb
                bra     loc_C5B7
; ---------------------------------------------------------------------------

loc_C5B4:                               ; sub_C579+35↑j
                ldab    <Ram_AC
                mul

loc_C5B7:                               ; sub_C579+39↑j
                std     <Ram_AD

locret_C5B9:                            ; sub_C579+5↑J
                rts
; End of function sub_C579


; =============== S U B R O U T I N E =======================================


sub_C5BA:                               ; ROM:ECEF↓P ROM:loc_F322↓P
                ldx     #DoubleTempC
                ldaa    #1
                ldab    <Ram_81
                std     DoubleTempC
                ldab    <Ram_82
                jsr     sub_E406
                std     DoubleTempC
                ldaa    #1
                ldab    <Ram_0B
                jsr     sub_E406
                std     DoubleTempC
                ldaa    #1
                ldab    <Counter_O2SensorFeedbackCount_Signed
                jsr     sub_E406
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
; End of function sub_C5BA


; =============== S U B R O U T I N E =======================================


sub_C5F1:                               ; sub_C5F1+3↓j ROM:EE4E↓P
                ldaa    ADCTL_A2DControlReg
                bpl     sub_C5F1
                ldab    ADR4_A2DResults4
                stab    <LastTpsVolts
                cmpb    byte_89FB
                bcs     loc_C60B
                cmpb    byte_89FC
                bcc     loc_C60B
                brset   <b5C_IPL1_t3 $40 loc_C60B
                stab    <TpsVolts

loc_C60B:                               ; sub_C5F1+D↑j sub_C5F1+12↑j ...
                ldaa    ADR1_A2DResults1
                ldab    <EngineRpm_HB
                cmpb    #$2F
                bcc     loc_C622
                cmpb    #$D
                bcs     loc_C622
                cmpa    byte_8A08
                bcc     loc_C626
                cmpa    byte_8A07
                bcs     loc_C626

loc_C622:                               ; sub_C5F1+21↑j sub_C5F1+25↑j
                brclr   <b5C_IPL1_t3 $88 loc_C629

loc_C626:                               ; sub_C5F1+2A↑j sub_C5F1+2F↑j
                jsr     sub_D61E

loc_C629:                               ; sub_C5F1:loc_C622↑j
                jsr     sub_E3F8
                tab
                addb    MapValue_t3
                rorb
                stab    <MapValue

loc_C633:                               ; ROM:loc_F333↓P
                brset   <IPL1 $40 loc_C63A
                jmp     loc_C758
; ---------------------------------------------------------------------------

loc_C63A:                               ; sub_C5F1:loc_C633↑j
                brset   <BitFlags27 8 loc_C648
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #8
                beq     loc_C648
                jsr     sub_F36D

loc_C648:                               ; sub_C5F1:loc_C63A↑j
                                        ; sub_C5F1+52↑j
                jsr     sub_C53D
                ldx     #byte_84A5
                ldaa    <MapValue2
                cmpa    <MapValue
                bcc     loc_C657
                ldx     #byte_84A4

loc_C657:                               ; sub_C5F1+61↑j
                ldy     #MapValue2
                ldaa    <MapValue
                jsr     sub_E4D0
                jsr     sub_C379
                brclr   <BitFlags27 $40 loc_C671
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_C671
                jsr     sub_F363

loc_C671:                               ; sub_C5F1+72↑j sub_C5F1+7B↑j
                brclr   <BitFlags27 8 loc_C67F
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$40
                beq     loc_C67F
                jsr     nullsub_2

loc_C67F:                               ; sub_C5F1:loc_C671↑j
                                        ; sub_C5F1+89↑j
                clra
                ldab    <MapValue
                lsld
                lsld
                tst     byte_849D
                bmi     loc_C68E
                addd    byte_849D
                bra     loc_C696
; ---------------------------------------------------------------------------

loc_C68E:                               ; sub_C5F1+96↑j
                addd    byte_849D
                bgt     loc_C696
                ldd     #$0000

loc_C696:                               ; sub_C5F1+9B↑j sub_C5F1+A0↑j
                xgdy
                ldaa    <Ram_85
                jsr     ScaleYbyA
                xgdy
                lsld
                bcc     loc_C6A5
                ldd     #$FFFF

loc_C6A5:                               ; sub_C5F1+AF↑j
                std     DoubleTempC
                brset   <BitFlags27 8 loc_C6B6
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #8
                beq     loc_C6B6
                jsr     sub_F36D

loc_C6B6:                               ; sub_C5F1+B7↑j sub_C5F1+C0↑j
                ldaa    #1
                ldab    <Ram_86
                ldx     #DoubleTempC
                jsr     sub_E406
                ldx     #PWMULT_Adaptive_fuel_pulsewidth_multiplier
                jsr     ScaleXbyB_somethingelse
                std     DoubleTempB
                brclr   <BitFlags27 8 loc_C6D7
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$40
                beq     loc_C6D7
                jsr     nullsub_2

loc_C6D7:                               ; sub_C5F1+D8↑j sub_C5F1+E1↑j
                clra
                ldab    <Ram_B1
                lsld
                addb    <ValueFromAdaptiveMemory
                adca    #0
                tst     byte_849F
                bmi     loc_C6EE
                addd    byte_849F
                bvc     loc_C6F1
                ldd     #$7FFF
                bra     loc_C6F1
; ---------------------------------------------------------------------------

loc_C6EE:                               ; sub_C5F1+F1↑j
                addd    byte_849F

loc_C6F1:                               ; sub_C5F1+F6↑j sub_C5F1+FB↑j
                std     <Ram_C0
                ldx     #byte_8418
                ldaa    <MapValue
                jsr     sub_E3AA
                stab    <Ram_C2
                ldd     DoubleTempB
                addd    <MAPLoadFactor
                bcs     loc_C70C
                addd    <Ram_A7
                bcs     loc_C70C
                addd    <Ram_A4
                bcc     loc_C70F

loc_C70C:                               ; sub_C5F1+111↑j
                                        ; sub_C5F1+115↑j
                ldd     #$FFFF

loc_C70F:                               ; sub_C5F1+119↑j
                subd    <Ram_AD
                bcs     loc_C717
                subd    <Ram_AA
                bcc     loc_C71A

loc_C717:                               ; sub_C5F1+120↑j
                ldd     #0000

loc_C71A:                               ; sub_C5F1+124↑j
                std     DoubleTempB
                ldy     DoubleTempB
                ldaa    <Ram_C2
                jsr     ScaleYbyA
                sty     DoubleTempC
                ldd     DoubleTempB
                subd    DoubleTempC
                std     DoubleTempB
                tst     Ram_C0
                bpl     loc_C74F
                ldd     #0000
                subd    <Ram_C0
                cpd     DoubleTempB
                bpl     loc_C74A
                ldd     DoubleTempB
                addd    <Ram_C0
                bra     loc_C756
; ---------------------------------------------------------------------------

loc_C74A:                               ; sub_C5F1+150↑j
                ldd     #0000
                bra     loc_C756
; ---------------------------------------------------------------------------

loc_C74F:                               ; sub_C5F1+145↑j
                addd    <Ram_C0
                bcc     loc_C756
                ldd     #$FFFF

loc_C756:                               ; sub_C5F1+157↑j
                                        ; sub_C5F1+15C↑j ...
                std     <Ram_73

loc_C758:                               ; sub_C5F1+46↑J
                brset   <BitFlags27 8 loc_C766
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #8
                beq     loc_C766
                jsr     sub_F36D

loc_C766:                               ; sub_C5F1:loc_C758↑j
                                        ; sub_C5F1+170↑j
                brclr   <BitFlags27 $40 loc_C774
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_C774
                jsr     sub_F363

loc_C774:                               ; sub_C5F1:loc_C766↑j
                                        ; sub_C5F1+17E↑j
                brset   <IPL1 $40 loc_C7C4
                ldx     #byte_84A5
                ldaa    <MapValue2
                cmpa    <MapValue
                bcc     loc_C784
                ldx     #byte_84A4

loc_C784:                               ; sub_C5F1+18E↑j
                ldy     #$0090
                ldaa    <MapValue
                jsr     sub_E4D0
                brclr   <BitFlags66_t3 $40 loc_C79B
                brclr   <Ram_30 4 loc_C79B
                clra
                clrb
                std     <InjectorPulsewidth_HB
                bra     loc_C7D8
; ---------------------------------------------------------------------------

loc_C79B:                               ; sub_C5F1+19C↑j
                                        ; sub_C5F1+1A0↑j
                ldaa    <CoolantTemp
                cmpa    byte_845D
                bcs     loc_C7BE
                ldaa    <ChargeTempVolts
                cmpa    byte_845E
                bcs     loc_C7BE
                ldaa    <Ram_80
                cmpa    #$FF
                beq     loc_C7BE
                inca
                staa    <Ram_80
                cmpa    byte_845F
                bhi     loc_C7BE
                ldd     #0000
                std     <InjectorPulsewidth_HB
                bra     loc_C7D8
; ---------------------------------------------------------------------------

loc_C7BE:                               ; sub_C5F1+1AF↑j
                                        ; sub_C5F1+1B6↑j ...
                ldd     <Ram_71
                std     <InjectorPulsewidth_HB
                bra     loc_C7D8
; ---------------------------------------------------------------------------

loc_C7C4:                               ; sub_C5F1:loc_C774↑j
                ldd     <Ram_71
                beq     loc_C7D5
                subd    word_845B
                bcs     loc_C7D1
                std     <Ram_71
                bra     loc_C7D5
; ---------------------------------------------------------------------------

loc_C7D1:                               ; sub_C5F1+1DA↑j
                clra
                clrb
                std     <Ram_71

loc_C7D5:                               ; sub_C5F1+1D5↑j
                                        ; sub_C5F1+1DE↑j
                jsr     sub_C7FB

loc_C7D8:                               ; sub_C5F1+1A8↑j
                                        ; sub_C5F1+1CB↑j ...
                jsr     sub_C2E6
                brclr   <BitFlags27 $40 loc_C7E9
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_C7E9
                jsr     sub_F363

loc_C7E9:                               ; sub_C5F1+1EA↑j
                                        ; sub_C5F1+1F3↑j
                brclr   <BitFlags27 8 loc_C7F7
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$40
                beq     loc_C7F7
                jsr     nullsub_2

loc_C7F7:                               ; sub_C5F1:loc_C7E9↑j
                                        ; sub_C5F1+201↑j
                jsr     sub_C34E
                rts
; End of function sub_C5F1


; =============== S U B R O U T I N E =======================================


sub_C7FB:                               ; sub_C5F1:loc_C7D5↑P
                ldx     #CCDFlags5
                brclr   0,x $20 loc_C808
                ldd     #0000
                jmp     loc_C898
; ---------------------------------------------------------------------------

loc_C808:                               ; sub_C7FB+3↑j
                brset   <BitFlags2c $80 loc_C80F
                jmp     loc_C866
; ---------------------------------------------------------------------------

loc_C80F:                               ; sub_C7FB:loc_C808↑j
                ldaa    byte_8646
                ldab    <TargetIdleSpeedHB
                mul
                addd    <TargetIdleSpeedHB
                bcc     loc_C81C
                ldd     #$FFFF

loc_C81C:                               ; sub_C7FB+1C↑j
                staa    <RpmRelated0087
                cpd     <EngineRpm_HB
                bcs     loc_C825
                bra     loc_C85B
; ---------------------------------------------------------------------------

loc_C825:                               ; sub_C7FB+26↑j
                ldx     <Ram_73
                ldaa    byte_8645
                bne     loc_C833
                cpx     byte_8643
                bhi     loc_C85B
                bra     loc_C866
; ---------------------------------------------------------------------------

loc_C833:                               ; sub_C7FB+2F↑j
                cmpa    #1
                bne     loc_C842
                brclr   <BitFlags66_t3 $80 loc_C866
                cpx     byte_8643
                bhi     loc_C85B
                bra     loc_C866
; ---------------------------------------------------------------------------

loc_C842:                               ; sub_C7FB+3A↑j
                cmpa    #2
                bne     loc_C851
                brset   <BitFlags66_t3 $80 loc_C85B
                cpx     byte_8643
                bhi     loc_C85B
                bra     loc_C866
; ---------------------------------------------------------------------------

loc_C851:                               ; sub_C7FB+49↑j
                cmpa    #3
                bne     loc_C85B
                brset   <BitFlags66_t3 $80 loc_C85B
                bra     loc_C866
; ---------------------------------------------------------------------------

loc_C85B:                               ; sub_C7FB+28↑j sub_C7FB+34↑j ...
                bclr    <BitFlags2c $80
                bset    <BitFlags2c 8
                ldaa    byte_8642
                staa    <CounterDn_b7_o2

loc_C866:                               ; sub_C7FB+11↑J sub_C7FB+36↑j ...
                ldy     byte_84A1
                brclr   <BitFlags2c $80 loc_C872
                clra
                clrb
                bra     loc_C883
; ---------------------------------------------------------------------------

loc_C872:                               ; sub_C7FB+6F↑j
                ldd     <Ram_73
                cpd     <Ram_71
                bcc     loc_C87B
                ldd     <Ram_71

loc_C87B:                               ; sub_C7FB+7C↑j
                cpd     byte_84A1
                bcc     loc_C883
                xgdy

loc_C883:                               ; sub_C7FB+75↑j sub_C7FB+84↑j
                ldx     #UNe_6481
                brclr   0,x 4 loc_C898
                ldaa    UNe_6483
                clrb
                brset   0,x 8 loc_C895
                ldab    UNe_6484

loc_C895:                               ; sub_C7FB+93↑j
                lsrd
                lsrd
                lsrd

loc_C898:                               ; sub_C7FB+A↑J sub_C7FB+8B↑j
                std     <InjectorPulsewidth_HB
                rts
; End of function sub_C7FB

; ---------------------------------------------------------------------------
byte_C89B:      fcb 0                   ; sub_C8AF+61↓o
                fcb 0
                fcb 0
                fcb $20
                fcb $20
                fcb $30
                fcb $20
                fcb 0
                fcb $20
                fcb $20
                fcb $20
                fcb 0
                fcb $30
                fcb $30
                fcb $30
                fcb $30
                fcb $30
                fcb $20
                fcb $20
                fcb $20

; =============== S U B R O U T I N E =======================================


sub_C8AF:                               ; __RESET+628↑P
                jsr     sub_DAEF
                jsr     sub_DBE4
                ldab    <DRBSerialMode
                bitb    #$C0
                bne     locret_C91A
                ldaa    BAUD_SerialBaudRate
                anda    #$37
 IF ECLOCK == 4
                cmpa    #$23                 ; %0010 0011/$23 16mhz crystal 7812 BAUD
                beq     loc_C8CA
                ldaa    #$23                 ; %0010 0011/$23 16mhz crystal 7812 BAUD
 ENDIF
 IF ECLOCK == 3
                cmpa    #$13                 ; %00010011/$13 12mhz crystal 7812 BAUD
                beq     loc_C8CA
                ldaa    #$13                 ; %00010011/$13 12mhz crystal 7812 BAUD
 ENDIF
 IF ECLOCK == 2
                cmpa    #$22                 ; %00100010/$22 8mhz crystal 7812 BAUD
                beq     loc_C8CA
                ldaa    #$22                 ; %00100010/$22 8mhz crystal 7812 BAUD
 ENDIF
                staa    BAUD_SerialBaudRate
                rts
; ---------------------------------------------------------------------------

loc_C8CA:                               ; sub_C8AF+13↑j
                ldaa    SCSR_SerialStatus
                bita    #$E
                beq     loc_C8D5
                ldaa    SCDR_SerialData
                rts
; ---------------------------------------------------------------------------

loc_C8D5:                               ; sub_C8AF+20↑j
                bita    #$20
                bne     loc_C8EC
                brset   <DRBSerialMode $F loc_C8E1
                incb
                stab    <DRBSerialMode
                rts
; ---------------------------------------------------------------------------

loc_C8E1:                               ; sub_C8AF+2A↑j
                brclr   <DRBSerialMode $30 locret_C8EB
                bclr    <DRBSerialMode $30
                clr     DRBPointer1

locret_C8EB:                            ; sub_C8AF:loc_C8E1↑j
                rts
; ---------------------------------------------------------------------------

loc_C8EC:                               ; sub_C8AF+28↑j
                ldaa    SCDR_SerialData
                staa    SCDR_SerialData
                andb    #$F0
                stab    <DRBSerialMode
                bitb    #$30
                bne     loc_C91B
                staa    <DRBPointer1
                cmpa    #$14
                beq     loc_C903
                bclr    <BitFlags6d_t3 8

loc_C903:                               ; sub_C8AF+4F↑j
                clr     DRBPointer2
                clr     DRBPointer3
                tab
                subb    #$10
                cmpb    #$14
                bcc     locret_C91A
                ldx     #byte_C89B
                abx
                ldab    0,x
                orab    <DRBSerialMode
                stab    <DRBSerialMode

locret_C91A:                            ; sub_C8AF+A↑j sub_C8AF+5F↑j
                rts
; ---------------------------------------------------------------------------

loc_C91B:                               ; sub_C8AF+49↑j
                bitb    #$20
                beq     loc_C922
                jmp     loc_C93D
; ---------------------------------------------------------------------------

loc_C922:                               ; sub_C8AF+6E↑j
                bitb    #$10
                bne     loc_C929
                jmp     loc_C95A
; ---------------------------------------------------------------------------

loc_C929:                               ; sub_C8AF+75↑j
                staa    <DRBPointer3
                andb    #$CF
                stab    <DRBSerialMode
                rts
; ---------------------------------------------------------------------------

loc_C930:                               ; RESERVED:CAE0↓o
                clr     DRBPointer1
                ldab    <DRBPointer3
                ldaa    <DRBPointer2
                xgdx
                ldaa    0,x

loc_C93A:                               ; RESERVED:C986↓j
                                        ; RESERVED:C989↓j
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_C93D:                               ; sub_C8AF+70↑J
                staa    <DRBPointer2
                andb    #$DF
                stab    <DRBSerialMode
                ldab    <DRBPointer1
                cpd     #TIC3_Counter_IC3_CrankSensor
                bne     loc_C963
                brset   <BitFlags66_t3 $80 loc_C95A
                brset   <BitFlags27 1 loc_C968
                brclr   <BitFlags68_t3 $10 loc_C968
                bclr    <BitFlags68_t3 $80

loc_C95A:                               ; sub_C8AF+77↑J sub_C8AF+9C↑j
                clr     DRBPointer1
                clr     DRBPointer2
                clr     DRBPointer3

loc_C963:                               ; sub_C8AF+9A↑j
                bclr    <BitFlags6d_t3 8
                bra     locret_C96B
; ---------------------------------------------------------------------------

loc_C968:                               ; sub_C8AF+A0↑j sub_C8AF+A4↑j
                bset    <BitFlags6d_t3 8

locret_C96B:                            ; sub_C8AF+B7↑j
                rts
; End of function sub_C8AF

; ---------------------------------------------------------------------------

loc_C96C:                               ; RESERVED:CAEE↓o
                clr     DRBPointer1
                brset   <BitFlags6a_t3 $40 loc_C988
                brset   <BitFlags6a_t3 $20 loc_C988
                bset    <BitFlags6a_t3 $40
                ldaa    <DRBPointer3
                staa    DRBOffsetStored_LB
                ldab    <DRBPointer2
                stab    DRBOffsetStored_HB
                ldaa    #$E2
                bra     loc_C93A
; ---------------------------------------------------------------------------

loc_C988:                               ; RESERVED:C96F↑j
                                        ; RESERVED:C973↑j
                clra
                bra     loc_C93A
; ---------------------------------------------------------------------------

loc_C98B:                               ; RESERVED:CAF0↓o
                ldx     #Ram_00
                bra     loc_C9B3
; ---------------------------------------------------------------------------

loc_C990:                               ; RESERVED:CAF2↓o
                ldx     #CountdownTimerFromKeyOn
                bra     loc_C9B3
; ---------------------------------------------------------------------------

loc_C995:                               ; RESERVED:CAF4↓o
                ldx     #STe_64BA
                ldaa    <DRBPointer2
                bne     loc_C9B0
                ldab    <DRBPointer3
                abx
                cpx     #UNk_64D0
                bcs     loc_C9B0
                ldaa    #$FF
                staa    STe_64BA

loc_C9A9:                               ; RESERVED:C9DB↓j
                                        ; RESERVED:CA11↓j
                clr     DRBPointer1
                clra
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_C9B0:                               ; RESERVED:C99A↑j
                                        ; RESERVED:C9A2↑j
                ldx     #STe_64BA

loc_C9B3:                               ; RESERVED:C98E↑j
                                        ; RESERVED:C993↑j
                clr     DRBPointer1
                ldab    <DRBPointer2
                ldaa    <DRBPointer3
                abx
                staa    0,x
                ldaa    #$E5
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_C9C2:                               ; RESERVED:CAF6↓o
                ldx     #STe_64BA
                ldab    <DRBPointer3
                cmpb    1,x
                beq     loc_C9D0
                comb
                cmpb    1,x
                bne     loc_C9FB

loc_C9D0:                               ; RESERVED:C9C9↑j
                ldab    <DRBPointer2
                cmpb    0,x
                bne     loc_C9FF
                abx
                ldaa    1,x
                cmpa    #$39
                bne     loc_C9A9
                ldx     #STe_64BA
                clra

loc_C9E1:                               ; RESERVED:C9E5↓j
                inx
                adda    1,x
                decb
                bne     loc_C9E1
                cmpa    <DRBPointer3
                beq     loc_C9F4
                ldab    <DRBPointer3
                comb
                cba
                bne     loc_C9FB
                jmp     STe_64BC
; ---------------------------------------------------------------------------

loc_C9F4:                               ; RESERVED:C9E9↑j
                com     DRBPointer3
                ldaa    #$E4
                bra     loc_CA2B
; ---------------------------------------------------------------------------

loc_C9FB:                               ; RESERVED:C9CE↑j
                                        ; RESERVED:C9EF↑j
                ldaa    #1
                bra     loc_CA05
; ---------------------------------------------------------------------------

loc_C9FF:                               ; RESERVED:C9D4↑j
                                        ; RESERVED:CA17↓j
                ldaa    #2
                bra     loc_CA05
; ---------------------------------------------------------------------------

loc_CA03:                               ; RESERVED:CA1F↓j
                ldaa    #3

loc_CA05:                               ; RESERVED:C9FD↑j
                                        ; RESERVED:CA01↑j
                clr     DRBPointer1
                bra     loc_CA2B
; ---------------------------------------------------------------------------

loc_CA0A:                               ; RESERVED:CAF8↓o
                ldaa    <DRBPointer2
                bne     loc_CA13
                bclr    <BitFlags2a 1
                bra     loc_C9A9
; ---------------------------------------------------------------------------

loc_CA13:                               ; RESERVED:CA0C↑j
                ldaa    <DRBPointer3
                bne     loc_CA2E
                brset   <BitFlags66_t3 $80 loc_C9FF
                brset   <BitFlags27 1 loc_CA23
                brset   <BitFlags68_t3 $10 loc_CA03

loc_CA23:                               ; RESERVED:CA1B↑j
                coma
                staa    <DRBPointer3
                ldaa    #1
                bset    <BitFlags2a 1

loc_CA2B:                               ; RESERVED:C9F9↑j
                                        ; RESERVED:CA08↑j ...
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CA2E:                               ; RESERVED:CA15↑j
                brset   <BitFlags66_t3 $80 loc_CA3A
                brset   <BitFlags27 1 locret_CA3D
                brclr   <BitFlags68_t3 $10 locret_CA3D

loc_CA3A:                               ; RESERVED:loc_CA2E↑j
                                        ; RESERVED:CA50↓j
                clr     DRBPointer1

locret_CA3D:                            ; RESERVED:CA32↑j
                                        ; RESERVED:CA36↑j
                rts
; ---------------------------------------------------------------------------

loc_CA3E:                               ; RESERVED:CAFA↓o
                ldaa    <DRBPointer3
                beq     loc_CA67
                ldaa    <DRBPointer2
                cmpa    #1
                beq     loc_CA52
                cmpa    #2
                beq     loc_CA56
                cmpa    #3
                beq     loc_CA5A
                bra     loc_CA3A
; ---------------------------------------------------------------------------

loc_CA52:                               ; RESERVED:CA46↑j
                ldd     <EngineRpm_HB
                bra     loc_CA5C
; ---------------------------------------------------------------------------

loc_CA56:                               ; RESERVED:CA4A↑j
                ldd     <InjectorPulsewidth_HB
                bra     loc_CA5C
; ---------------------------------------------------------------------------

loc_CA5A:                               ; RESERVED:CA4E↑j
                ldd     <TargetIdleSpeedHB

loc_CA5C:                               ; RESERVED:CA54↑j
                                        ; RESERVED:CA58↑j
                stab    Temp0
                jsr     SerialOutput1a
                ldaa    Temp0
                bra     loc_CA2B
; ---------------------------------------------------------------------------

loc_CA67:                               ; RESERVED:CA40↑j
                coma
                staa    <DRBPointer3
                rts
; ---------------------------------------------------------------------------

loc_CA6B:                               ; RESERVED:CAFC↓o
                clr     DRBPointer1
                ldab    <TimerOverflowsBetweenCamPulses
                cmpb    #$50
                bls     loc_CA76
                bra     loc_CA7A
; ---------------------------------------------------------------------------

loc_CA76:                               ; RESERVED:CA72↑j
                clra
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CA7A:                               ; RESERVED:CA74↑j
                ldaa    <DRBPointer2
                cmpa    #1
                beq     loc_CA91
                cmpa    #2
                beq     loc_CAA2
                cmpa    #3
                beq     loc_CAAA
                cmpa    #4
                beq     loc_CAB6
                ldaa    #1
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CA91:                               ; RESERVED:CA7E↑j
                brclr   <BitFlags6a_t3 $40 loc_CA9A
                ldaa    #2
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CA9A:                               ; RESERVED:loc_CA91↑j
                jsr     sub_CABD

loc_CA9D:                               ; RESERVED:CAA8↓j
                                        ; RESERVED:CAB3↓J ...
                ldaa    #$F0
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CAA2:                               ; RESERVED:CA82↑j
                ldaa    #$80
                staa    <ValueFromAdaptiveMemory
                staa    <Ram_0B
                bra     loc_CA9D
; ---------------------------------------------------------------------------

loc_CAAA:                               ; RESERVED:CA86↑j
                sei
                bset    <BitFlags36_t3 $40
                ldaa    #$DF
                staa    <CurrentAisPosition
                cli
                jmp     loc_CA9D
; ---------------------------------------------------------------------------

loc_CAB6:                               ; RESERVED:CA8A↑j
                ldaa    TL_ValueOf_MINTHR_WhenBatteryDisconnected
                staa    <LowestSessionTpsVolts
                bra     loc_CA9D

; =============== S U B R O U T I N E =======================================


sub_CABD:                               ; RESERVED:loc_CA9A↑P
                                        ; RESERVED:CB55↓P ...
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
                jsr     sub_E70E
                rts
; End of function sub_CABD

; ---------------------------------------------------------------------------
off_CAD6:       fdb loc_CBB1            ; sub_CAFE+10↓o
                fdb loc_CBDD
                fdb loc_CBED
                fdb loc_CB67
                fdb locret_CBFF
                fdb loc_C930
                fdb loc_CC07
                fdb loc_CB29
                fdb locret_CBFF
                fdb locret_CBFF
                fdb locret_CBFF
                fdb loc_CC00
                fdb loc_C96C
                fdb loc_C98B
                fdb loc_C990
                fdb loc_C995
                fdb loc_C9C2
                fdb loc_CA0A
                fdb loc_CA3E
                fdb loc_CA6B

; =============== S U B R O U T I N E =======================================


sub_CAFE:                               ; __RESET+62B↑P
                ldaa    <DRBSerialMode
                bita    #$30
                beq     loc_CB05
                rts
; ---------------------------------------------------------------------------

loc_CB05:                               ; sub_CAFE+4↑j
                ldaa    <DRBPointer1
                beq     locret_CB28
                cmpa    #$A
                beq     locret_CB28
                tab
                ldx     #off_CAD6
                subb    #$10
                bcs     loc_CB1F
                aslb
                cmpb    #$28
                bcc     loc_CB1F
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_CB1F:                               ; sub_CAFE+15↑j sub_CAFE+1A↑j
                bclr    <DRBSerialMode $30
                clra
                staa    <DRBPointer1
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

locret_CB28:                            ; sub_CAFE+9↑j sub_CAFE+D↑j
                rts
; End of function sub_CAFE

; ---------------------------------------------------------------------------

loc_CB29:                               ; RESERVED:CAE4↑o
                clra
                ldab    <TimerOverflowsBetweenCamPulses
                cmpb    #$50
                bhi     loc_CB38
                staa    <DRBPointer1
                bclr    <DRBSerialMode $30
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CB38:                               ; RESERVED:CB2E↑j
                ldab    <DRBSerialMode
                andb    #$F
                cmpb    #3
                bls     loc_CB43
                clr     BitFlags65_t3

loc_CB43:                               ; RESERVED:CB3E↑j
                ldaa    BitFlags65_t3
                inca
                cmpa    #$18
                bls     loc_CB5D
                brset   <BitFlags6a_t3 $40 loc_CB60
                clra
                staa    <DRBPointer1
                staa    BitFlags65_t3
                jsr     sub_CABD
                ldaa    #$E0
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CB5D:                               ; RESERVED:CB49↑j
                staa    BitFlags65_t3

loc_CB60:                               ; RESERVED:CB4B↑j
                ldd     #$FF00
                stab    <DRBPointer1
                bra     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CB67:                               ; RESERVED:CADC↑o
                ldab    <TimerOverflowsBetweenCamPulses
                cmpb    #$50
                bls     loc_CB99
                ldaa    <DRBPointer2
                asla
                bcs     loc_CB99
                cmpa    #$4E
                bhi     loc_CB99
                ldx     #ATMFunctionTable-2
                ldab    <DRBPointer2
                aslb
                abx
                ldd     0,x
                cpd     #ATM_SerialOut_0
                beq     loc_CB99
                ldaa    <DRBPointer2
                brset   <BitFlags27 1 loc_CB91
                cmpa    #$17
                beq     loc_CB99
                bra     loc_CB9E
; ---------------------------------------------------------------------------

loc_CB91:                               ; RESERVED:CB87↑j
                cmpa    #$F
                beq     loc_CB99
                cmpa    #$16
                bne     loc_CB9E

loc_CB99:                               ; RESERVED:CB6B↑j
                                        ; RESERVED:CB70↑j ...
                clra
                staa    <DRBPointer1
                staa    <DRBPointer2

loc_CB9E:                               ; RESERVED:CB8F↑j
                                        ; RESERVED:CB97↑j
                cmpa    <ATMOffset
                beq     SerialOutput1a
                staa    <ATMOffset
                ldab    #2
                stab    <KeyOnOrEngineRunningTime

; =============== S U B R O U T I N E =======================================


SerialOutput1a:                         ; ControlAsdRelay_MM+3F↑P
                                        ; ControlAsdRelay_MM+54↑P ...
                ldab    SCSR_SerialStatus
                bpl     SerialOutput1a
                staa    SCDR_SerialData
                rts
; End of function SerialOutput1a

; ---------------------------------------------------------------------------

loc_CBB1:                               ; RESERVED:off_CAD6↑o
                ldx     #ErrorBitRegister0
                ldab    <DRBPointer2
                cmpb    #7
                bhi     loc_CBC7
                negb
                addb    #7
                abx
                inc     DRBPointer2
                ldaa    0,x
                beq     loc_CBC7
                bra     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CBC7:                               ; RESERVED:CBB8↑j
                                        ; RESERVED:CBC3↑j
                clr     DRBPointer1
                ldaa    #$FE
                bsr     SerialOutput1a
                adda    #$10
                ldx     #CruiseControlVarT1

loc_CBD3:                               ; RESERVED:CBDB↓j
                inx
                cpx     #$1D
                bcc     SerialOutput1a
                adda    0,x
                bra     loc_CBD3
; ---------------------------------------------------------------------------

loc_CBDD:                               ; RESERVED:CAD8↑o
                ldaa    <ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
                brclr   <DRBPointer2 $FF loc_CBE8
                ldaa    <ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB
                clr     DRBPointer1

loc_CBE8:                               ; RESERVED:CBDF↑j
                inc     DRBPointer2
                bra     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CBED:                               ; RESERVED:CADA↑o
                bset    <DRBSerialMode $80
                clr     DRBPointer1

loc_CBF3:                               ; RESERVED:CBF8↓j
                ldaa    SCSR_SerialStatus
                bita    #$40
                beq     loc_CBF3
 IF ECLOCK == 4
                lda     #$02
 ENDIF
 IF ECLOCK == 3
                ldaa    #$10
 ENDIF
 IF ECLOCK == 2
                ldaa    #$01
 ENDIF
                staa    BAUD_SerialBaudRate  ; %00000001/$01 8mhz crystal 62.5 BAUD
                                             ; %00010000/$10 12mhz crystal 62.5 BAUD
                                             ; %00000010/$02 16mhz crystal 62.5 BAUD

locret_CBFF:                            ; RESERVED:CADE↑o
                                        ; RESERVED:CAE6↑o ...
                rts
; ---------------------------------------------------------------------------

loc_CC00:                               ; RESERVED:CAEC↑o
                bset    <DRBSerialMode $40
                clr     DRBPointer1
                rts
; ---------------------------------------------------------------------------

loc_CC07:                               ; RESERVED:CAE2↑o
                ldaa    <DRBPointer2
                cmpa    #$80
                beq     loc_CC19
                cmpa    #$81
                beq     loc_CC44
                cmpa    #$82
                beq     loc_CC49
                clr     DRBPointer1
                rts
; ---------------------------------------------------------------------------

loc_CC19:                               ; RESERVED:CC0B↑j
                ldx     #TL_PARTNO1
                brclr   <BitFlags6a_t3 2 loc_CC23
                ldx     #TL_PARTNO1A

loc_CC23:                               ; RESERVED:CC1C↑j
                                        ; RESERVED:CC47↓j
                ldab    <DRBPointer3
                cmpb    #4
                beq     loc_CC32
                inc     DRBPointer3
                abx
                ldaa    0,x
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CC32:                               ; RESERVED:CC27↑j
                ldaa    0,x
                adda    1,x
                adda    2,x
                adda    3,x

loc_CC3A:                               ; RESERVED:CC5E↓j
                adda    #$16
                adda    <DRBPointer2
                clr     DRBPointer1

loc_CC41:                               ; RESERVED:CC5A↓j
                                        ; RESERVED:CC61↓j
                jmp     SerialOutput1a
; ---------------------------------------------------------------------------

loc_CC44:                               ; RESERVED:CC0F↑j
                ldx     #TL_CODE1
                bra     loc_CC23
; ---------------------------------------------------------------------------

loc_CC49:                               ; RESERVED:CC13↑j
                inc     DRBPointer3
                ldaa    TL_PARTNO5
                brclr   <BitFlags6a_t3 2 loc_CC56
                ldaa    TL_PARTNO5A

loc_CC56:                               ; RESERVED:CC4F↑j
                ldab    <DRBPointer3
                cmpb    #1
                beq     loc_CC41
                cmpb    #5
                bcc     loc_CC3A
                clra
                bra     loc_CC41
; ---------------------------------------------------------------------------
ATMFunctionTable:fdb loc_CE43           ; RESERVED:CB76↑t
                                        ; sub_CCF6:loc_CD1D↓t
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb loc_CEED
                fdb loc_CEE8
                fdb loc_CEE3
                fdb loc_CDD4
                fdb loc_CDAB
                fdb loc_CD9C
                fdb loc_CD46
                fdb loc_CD3A
                fdb loc_CD26
                fdb loc_CE1F
                fdb loc_CF17
                fdb loc_CDB9
                fdb loc_CD90
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb loc_CDE1
                fdb loc_CD84
                fdb loc_CDC5
                fdb loc_CDB9
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb loc_CD5F
                fdb loc_CEDE
                fdb loc_CEA3
                fdb loc_CE93
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fdb ATM_SerialOut_0
                fcb $CD
Byt_DRBMemoryTable:fcb $65              ; sub_CCF6+245↓o
                fcb $FF
                fcb $53
                fcb $FF
                fcb $FF
                fcb $54
                fcb $59
                fcb $5A
                fcb 6
                fcb $FF
                fcb $5B
                fcb $50
                fcb 8
                fcb $A
                fcb $B
                fcb $D
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
off_CCDE:       fdb loc_CF87            ; sub_CCF6+25E↓o
                fdb loc_CF98
                fdb loc_CF9C
                fdb loc_CFB1
                fdb loc_CFB4
                fdb loc_CFB7
                fdb loc_CFC1
off_CCEC:       fdb loc_CFD9            ; sub_CCF6:loc_CF5C↓o
                fdb loc_CF6C
                fdb loc_CF76
                fdb loc_CF7A
                fdb loc_CF80

; =============== S U B R O U T I N E =======================================


sub_CCF6:                               ; __RESET+62E↑P
                ldaa    <TimerOverflowsBetweenCamPulses
                cmpa    #$50
                bhi     loc_CCFF
                clr     ATMOffset

loc_CCFF:                               ; sub_CCF6+4↑j
                ldab    <ATMOffset
                bne     loc_CD06
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CD06:                               ; sub_CCF6+B↑j
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    #$96
                bcs     loc_CD1D
                clrb
                ldaa    <DRBPointer1
                cmpa    #$13
                bne     loc_CD17
                stab    <DRBPointer1
                stab    <DRBPointer2

loc_CD17:                               ; sub_CCF6+1B↑j
                clr     ATMOffset
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CD1D:                               ; sub_CCF6+14↑j
                ldx     #ATMFunctionTable-2
                aslb
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_CD26:                               ; RESERVED:CC79↑o
                ldaa    <PIA2_Buffer_t3
                oraa    #$C0
                ldab    <Counter_MainLoop
                cmpb    #$55
                bcs     loc_CDA6
                anda    #$3F
                cmpb    #$AA
                bcs     loc_CDA6
                oraa    #$80
                bra     loc_CDA6
; ---------------------------------------------------------------------------

loc_CD3A:                               ; RESERVED:CC77↑o
                ldaa    <PIA2_Buffer_t3
                oraa    #$20
                brset   <Counter_MainLoop $80 loc_CDA6
                anda    #$DF
                bra     loc_CDA6
; ---------------------------------------------------------------------------

loc_CD46:                               ; RESERVED:CC75↑o
                ldaa    TCTL1_TimerControlReg1
                anda    #$FE
                staa    TCTL1_TimerControlReg1
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldaa    <PIA2_Buffer_t3
                oraa    #$10
                brset   <Counter_MainLoop $80 loc_CDA6
                anda    #$EF
                bra     loc_CDA6
; ---------------------------------------------------------------------------

loc_CD5F:                               ; RESERVED:CC99↑o
                ldaa    <PIA2_Buffer_t3
                anda    #$EF
                bra     loc_CDA6
; ---------------------------------------------------------------------------
                brset   <BitFlags27 8 loc_CD75
                ldaa    <PIA2_Buffer_t3
                oraa    #8
                brset   <Counter_MainLoop $80 loc_CDA6
                anda    #$F7
                bra     loc_CDA6
; ---------------------------------------------------------------------------

loc_CD75:                               ; sub_CCF6+6F↑j
                ldaa    <PIA1_Buffer_t3
                oraa    #$80
                brset   <Counter_MainLoop $80 loc_CD7F
                anda    #$7F

loc_CD7F:                               ; sub_CCF6+83↑j
                staa    <PIA1_Buffer_t3
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CD84:                               ; RESERVED:CC8B↑o
                ldaa    <PIA2_Buffer_t3
                oraa    #4
                brset   <Counter_MainLoop $80 loc_CDA6
                anda    #$FB
                bra     loc_CDA6
; ---------------------------------------------------------------------------

loc_CD90:                               ; RESERVED:CC81↑o
                ldaa    <PIA2_Buffer_t3
                oraa    #2
                brset   <Counter_MainLoop $80 loc_CDA6
                anda    #$FD
                bra     loc_CDA6
; ---------------------------------------------------------------------------

loc_CD9C:                               ; RESERVED:CC73↑o
                ldaa    <PIA2_Buffer_t3
                oraa    #1
                brset   <Counter_MainLoop $80 loc_CDA6
                anda    #$FE

loc_CDA6:                               ; sub_CCF6+38↑j sub_CCF6+3E↑j ...
                staa    <PIA2_Buffer_t3
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CDAB:                               ; RESERVED:CC71↑o
                ldaa    <PIA1_Buffer_t3
                anda    #$7F
                ldab    <Counter_MainLoop
                andb    #$78
                beq     loc_CDCF
                oraa    #$80
                bra     loc_CDCF
; ---------------------------------------------------------------------------

loc_CDB9:                               ; RESERVED:CC7F↑o
                                        ; RESERVED:CC8F↑o
                ldaa    <PIA1_Buffer_t3
                oraa    #$20
                brset   <Counter_MainLoop $80 loc_CDCF
                anda    #$DF
                bra     loc_CDCF
; ---------------------------------------------------------------------------

loc_CDC5:                               ; RESERVED:CC8D↑o
                ldaa    <PIA1_Buffer_t3
                oraa    #$10
                brset   <Counter_MainLoop $80 loc_CDCF
                anda    #$EF

loc_CDCF:                               ; sub_CCF6+BD↑j sub_CCF6+C1↑j ...
                staa    <PIA1_Buffer_t3
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CDD4:                               ; sub_CCF6+127↓j
                                        ; RESERVED:CC6F↑o
                ldaa    #$10
                brset   <Counter_MainLoop $80 loc_CDDC
                ldaa    #$70

loc_CDDC:                               ; sub_CCF6+E0↑j
                staa    <DesiredNewAisPosition
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CDE1:                               ; RESERVED:CC89↑o
                ldd     <PIA1_Buffer_t3
                oraa    #$10
                brset   <BitFlags27 1 loc_CDEB
                oraa    #$20

loc_CDEB:                               ; sub_CCF6+EF↑j
                brset   <BitFlags27 8 loc_CDF3
                orab    #$EB
                bra     loc_CDF7
; ---------------------------------------------------------------------------

loc_CDF3:                               ; sub_CCF6:loc_CDEB↑j
                oraa    #$80
                orab    #$E3

loc_CDF7:                               ; sub_CCF6+FB↑j
                brset   <BitFlags2d $10 loc_CDFD
                orab    #$10

loc_CDFD:                               ; sub_CCF6:loc_CDF7↑j
                brset   <Counter_MainLoop $80 loc_CE1B
                anda    #$EF
                brset   <BitFlags27 1 loc_CE09
                anda    #$DF

loc_CE09:                               ; sub_CCF6+10D↑j
                brset   <BitFlags27 8 loc_CE11
                andb    #$14
                bra     loc_CE15
; ---------------------------------------------------------------------------

loc_CE11:                               ; sub_CCF6:loc_CE09↑j
                anda    #$7F
                andb    #$1C

loc_CE15:                               ; sub_CCF6+119↑j
                brset   <BitFlags2d $10 loc_CE1B
                andb    #$EF

loc_CE1B:                               ; sub_CCF6:loc_CDFD↑j
                                        ; sub_CCF6:loc_CE15↑j
                std     <PIA1_Buffer_t3
                bra     loc_CDD4
; ---------------------------------------------------------------------------

loc_CE1F:                               ; RESERVED:CC7B↑o
                bclr    <PIA2_Buffer_t3 $10
                ldx     #SwitchPortAccessReg1
                sei
                ldaa    SwitchPortAccessReg1
                anda    #$FB
                brset   <Counter_MainLoop $80 loc_CE31
                oraa    #4

loc_CE31:                               ; sub_CCF6+135↑j
                staa    SwitchPortAccessReg1
                bset    2,x 4
                ldaa    #$14

loc_CE39:                               ; sub_CCF6+144↓j
                deca
                bne     loc_CE39
                bclr    2,x 4
                cli
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CE43:                               ; RESERVED:ATMFunctionTable↑o
                bclr    <PIA2_Buffer_t3 $10
                ldab    <Counter_MainLoop
                aslb
                beq     loc_CE4E
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CE4E:                               ; sub_CCF6+153↑j
                sei
                ldaa    TCTL1_TimerControlReg1
                oraa    #3
                staa    TCTL1_TimerControlReg1
                ldab    #8
                stab    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    #$036B*ECLOCK
                std     TOC5_Counter_OC5_Dwell
                ldaa    TCTL1_TimerControlReg1
                anda    #$FE
                staa    TCTL1_TimerControlReg1
                cli
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------
byte_CE71:      fcb $40                 ; sub_CCF6+1B7↓o
                fcb $40
                fcb $BF
byte_CE74:      fcb $10                 ; sub_CCF6+1A7↓o
                fcb $20
                fcb $EF
byte_CE77:      fcb 4                   ; sub_CCF6+18E↓o
                fcb $10
                fcb $FB
; ---------------------------------------------------------------------------
                brset   <BitFlags27 $10 loc_CE81
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CE81:                               ; sub_CCF6+184↑j
                ldx     #TOC4_Counter_OC4
                ldy     #byte_CE77
                bra     loc_CEB1
; ---------------------------------------------------------------------------
                brset   <BitFlags27 $10 loc_CE91
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CE91:                               ; sub_CCF6+194↑j
                bra     loc_CE9A
; ---------------------------------------------------------------------------

loc_CE93:                               ; RESERVED:CC9F↑o
                brset   <BitFlags27 $40 loc_CE9A
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CE9A:                               ; sub_CCF6:loc_CE91↑j
                                        ; sub_CCF6:loc_CE93↑j
                ldx     #TOC3_Counter_OC3
                ldy     #byte_CE74
                bra     loc_CEB1
; ---------------------------------------------------------------------------

loc_CEA3:                               ; RESERVED:CC9D↑o
                brset   <BitFlags27 $40 loc_CEAA
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CEAA:                               ; sub_CCF6:loc_CEA3↑j
                ldx     #TOC2_Counter_OC2
                ldy     #byte_CE71

loc_CEB1:                               ; sub_CCF6+192↑j
                                        ; sub_CCF6+1AB↑j
                bclr    <PIA2_Buffer_t3 $10
                ldab    <Counter_MainLoop
                aslb
                beq     loc_CEBC
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CEBC:                               ; sub_CCF6+1C1↑j
                sei
                ldd     0,y
                oraa    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    #$00D4*ECLOCK+1
                std     0,x
                ldaa    2,y
                anda    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                cli
                jmp     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CEDE:                               ; RESERVED:CC9B↑o
                ldx     #InjectorPulsewidth_HB_Cyl1
                bra     loc_CEF0
; ---------------------------------------------------------------------------

loc_CEE3:                               ; RESERVED:CC6D↑o
                ldx     #InjectorPulsewidth_HB_Cyl2
                bra     loc_CEF0
; ---------------------------------------------------------------------------

loc_CEE8:                               ; RESERVED:CC6B↑o
                ldx     #InjectorPulsewidth_HB_Cyl3
                bra     loc_CEF0
; ---------------------------------------------------------------------------

loc_CEED:                               ; RESERVED:CC69↑o
                ldx     #InjectorPulsewidth_HB_Cyl4

loc_CEF0:                               ; sub_CCF6+1EB↑j
                                        ; sub_CCF6+1F0↑j ...
                bclr    <PIA2_Buffer_t3 $10
                ldab    <Counter_MainLoop
                aslb
                bne     ATM_SerialOut_0
                sei
                ldaa    PIA_Ctrl_2
                bita    #$F0
                beq     loc_CF05
                anda    #$F
                staa    PIA_Ctrl_2

loc_CF05:                               ; sub_CCF6+208↑j
                ldaa    #$F8
                cmpa    PIA_Ctrl_5
                beq     loc_CF0F
                staa    PIA_Ctrl_5

loc_CF0F:                               ; sub_CCF6+214↑j
                ldd     #$01A9
                std     0,x
                cli
                bra     ATM_SerialOut_0
; ---------------------------------------------------------------------------

loc_CF17:                               ; RESERVED:CC7D↑o
                ldaa    <PIA3_Buffer_t3
                eora    #2
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     *+2
; ---------------------------------------------------------------------------

ATM_SerialOut_0:                        ; sub_CCF6+D↑J sub_CCF6+24↑J ...
                ldaa    <DRBPointer1
                cmpa    #$14
                beq     loc_CF2D
                cmpa    #$1A
                beq     loc_CF5C

locret_CF2C:                            ; sub_CCF6+23F↓j
                                        ; sub_CCF6+243↓j ...
                rts
; ---------------------------------------------------------------------------

loc_CF2D:                               ; sub_CCF6+230↑j
                ldab    <DRBPointer2
                cmpb    #$40
                bcc     loc_CF4B
                cmpb    #0
                beq     locret_CF2C
                cmpb    #$2D
                bhi     locret_CF2C
                ldx     #Byt_DRBMemoryTable
                clra
                abx
                ldab    0,x
                cmpb    #$FF
                beq     locret_CF2C
                xgdx
                ldaa    0,x
                bra     loc_CFAE
; ---------------------------------------------------------------------------

loc_CF4B:                               ; sub_CCF6+23B↑j
                subb    #$40
                aslb
                bcs     locret_CF2C
                cmpb    #$10
                bcc     locret_CF2C
                ldx     #off_CCDE

loc_CF57:                               ; sub_CCF6+272↓j
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_CF5C:                               ; sub_CCF6+234↑j
                ldx     #off_CCEC
                ldab    <DRBPointer2
                aslb
                cmpb    #0
                beq     locret_CF2C
                cmpb    #8
                bls     loc_CF57
                bra     locret_CF2C
; ---------------------------------------------------------------------------

loc_CF6C:                               ; RESERVED:CCEE↑o
                ldaa    <StartupSwitchMirror1
                brclr   <BitFlags27 $C0 loc_CFAE
                eora    #$82
                bra     loc_CFAE
; ---------------------------------------------------------------------------

loc_CF76:                               ; RESERVED:CCF0↑o
                ldaa    <PIA2_Buffer_t3
                bra     loc_CFAE
; ---------------------------------------------------------------------------

loc_CF7A:                               ; RESERVED:CCF2↑o
                ldaa    <PIA1_Buffer_t3
                eora    #8
                bra     loc_CFAE
; ---------------------------------------------------------------------------

loc_CF80:                               ; RESERVED:CCF4↑o
                ldaa    SwitchPortAccessReg1
                anda    #$70
                bra     loc_CFAE
; ---------------------------------------------------------------------------

loc_CF87:                               ; RESERVED:off_CCDE↑o
                sei
                ldaa    #$10
                staa    ADCTL_A2DControlReg

loc_CF8D:                               ; sub_CCF6+29A↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_CF8D
                ldaa    ADR1_A2DResults1
                cli
                bra     loc_CFAE
; ---------------------------------------------------------------------------

loc_CF98:                               ; RESERVED:CCE0↑o
                ldaa    <VehicleSpeedx8_Scaled
                bra     loc_CFAE
; ---------------------------------------------------------------------------

loc_CF9C:                               ; RESERVED:CCE2↑o
                ldab    <O2SensorVolts
                ldaa    #$FF
                cmpb    byte_89F5
                bhi     loc_CFAC
                cmpb    byte_89F6
                bhi     loc_CFAE
                anda    #$A0

loc_CFAC:                               ; sub_CCF6+2AD↑j
                anda    #$B1

loc_CFAE:                               ; sub_CCF6+253↑j
                                        ; sub_CCF6+278↑j ...
                jmp     SerialOutput1a
; End of function sub_CCF6

; ---------------------------------------------------------------------------

loc_CFB1:                               ; RESERVED:CCE4↑o
                jmp     locret_CF2C
; ---------------------------------------------------------------------------

loc_CFB4:                               ; RESERVED:CCE6↑o
                jmp     locret_CF2C
; ---------------------------------------------------------------------------

loc_CFB7:                               ; RESERVED:CCE8↑o
                ldaa    <BaroPressure
                suba    <MapValue
                bcc     loc_CFBE
                clra

loc_CFBE:                               ; RESERVED:CFBB↑j
                jmp     loc_CFAE
; ---------------------------------------------------------------------------

loc_CFC1:                               ; RESERVED:CCEA↑o
                ldaa    <TpsVolts
                suba    <LowestSessionTpsVolts
                bcc     loc_CFC8
                clra

loc_CFC8:                               ; RESERVED:CFC5↑j
                ldab    byte_8A06
                staa    Temp0
                mul
                adca    Temp0
                bcc     loc_CFD6
                ldaa    #$FF

loc_CFD6:                               ; RESERVED:CFD2↑j
                jmp     loc_CFAE
; ---------------------------------------------------------------------------

loc_CFD9:                               ; RESERVED:off_CCEC↑o
                ldaa    <CalculatedSparkAdvance
                jmp     loc_CFAE

; =============== S U B R O U T I N E =======================================


sub_CFDE:                               ; sub_E542+44↓P
                ldx     #Data_start
 IF Data_start == $8000
                ldd     #$9200
 ELSE IF Data_start == $2000
                ldd     #$2200
 ENDIF
                std     Temp0
                clra
                ldab    #8

loc_CFEA:                               ; sub_CFDE+24↓j
                bsr     sub_D004
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
                beq     locret_D02D
                bra     loc_CFEA
; End of function sub_CFDE


; =============== S U B R O U T I N E =======================================


sub_D004:                               ; sub_CFDE:loc_CFEA↑p
                cpx     #$B600
                bne     loc_D012
                inc     Temp0
                inc     Temp0
                ldx     #$B800

loc_D012:                               ; sub_D004+3↑j sub_D004+22↓j
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
                bne     loc_D012
                tst     Temp0
                beq     loc_D02E

locret_D02D:                            ; sub_CFDE+22↑j sub_D004+2E↓j
                rts
; ---------------------------------------------------------------------------

loc_D02E:                               ; sub_D004+27↑j
                pulx
                suba    TL_PARTNO4
                beq     locret_D02D
                ldd     #$0201
                jmp     ThrowNonCriticalError
; End of function sub_D004

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_D4F9

loc_D03A:                               ; sub_D4F9+C↓J
                ldaa    <Counter_MainLoop
                asla
                asla
                bne     locret_D050
                ldaa    LastCamFallingEdgeTime2
                bita    #$70
                beq     loc_D051
                suba    #$10
                bita    #$70
                beq     loc_D051
                staa    LastCamFallingEdgeTime2

locret_D050:                            ; sub_D4F9-4BB↑j
                rts
; ---------------------------------------------------------------------------

loc_D051:                               ; sub_D4F9-4B4↑j
                                        ; sub_D4F9-4AE↑j
                ldab    <PIA1_Buffer_t3
                eorb    #$40
                stab    <PIA1_Buffer_t3
                bita    #$F
                beq     loc_D064
                deca
                bita    #$F
                beq     loc_D064
                oraa    #$10
                bra     loc_D099
; ---------------------------------------------------------------------------

loc_D064:                               ; sub_D4F9-4A0↑j
                                        ; sub_D4F9-49B↑j
                tsta
                bmi     loc_D09D
                ldaa    #$AA
                ldab    <DRBPointer2
                cmpb    #$FE
                beq     loc_D08D
                tstb
                bmi     loc_D099
                cmpb    #8
                bcs     loc_D080
                ldx     #$B618
                abx
                brset   0,x $FF loc_D0E5
                bra     loc_D087
; ---------------------------------------------------------------------------

loc_D080:                               ; sub_D4F9-485↑j
                negb
                addb    #7
                ldx     #ErrorBitRegister0
                abx

loc_D087:                               ; sub_D4F9-47B↑j
                ldab    0,x
                beq     loc_D099
                bra     loc_D08E
; ---------------------------------------------------------------------------

loc_D08D:                               ; sub_D4F9-48C↑j
                clrb

loc_D08E:                               ; sub_D4F9-46E↑j
                ldx     #ErrorCodesToDash_Table
                abx
                ldaa    0,x
                anda    #$F
                asla
                oraa    #$A0

loc_D099:                               ; sub_D4F9-497↑j
                                        ; sub_D4F9-489↑j ...
                staa    LastCamFallingEdgeTime2
                rts
; ---------------------------------------------------------------------------

loc_D09D:                               ; sub_D4F9-494↑j
                ldab    <DRBPointer2
                cmpb    #$FF
                bne     loc_D0AF
                ldaa    <ErrorCodeUpdateKeyOnCount
                cmpa    #$32
                bhi     loc_D0AF
                decb
                stab    <DRBPointer2
                clrb
                bra     loc_D0D4
; ---------------------------------------------------------------------------

loc_D0AF:                               ; sub_D4F9-458↑j
                                        ; sub_D4F9-452↑j
                cmpb    #$FE
                bne     loc_D0B4
                incb

loc_D0B4:                               ; sub_D4F9-448↑j
                incb
                stab    <DRBPointer2
                cmpb    #8
                bcs     loc_D0C9
                brset   <DRBPointer2 $80 loc_D0EE
                ldx     #$B618
                abx
                brset   0,x $FF loc_D0E5
                bra     loc_D0D0
; ---------------------------------------------------------------------------

loc_D0C9:                               ; sub_D4F9-440↑j
                negb
                addb    #7
                ldx     #ErrorBitRegister0
                abx

loc_D0D0:                               ; sub_D4F9-432↑j
                ldab    0,x
                beq     loc_D0E5

loc_D0D4:                               ; sub_D4F9-44C↑j
                ldx     #ErrorCodesToDash_Table
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
; ---------------------------------------------------------------------------

loc_D0E5:                               ; sub_D4F9-47F↑j
                                        ; sub_D4F9-436↑j ...
                ldaa    #$4A
                staa    LastCamFallingEdgeTime2
                bset    <DRBPointer2 $80
                rts
; ---------------------------------------------------------------------------

loc_D0EE:                               ; sub_D4F9-43E↑j
                clra
                staa    <DRBPointer1
                staa    <DRBSerialMode
                staa    <DRBPointer2
                rts
; END OF FUNCTION CHUNK FOR sub_D4F9
; ---------------------------------------------------------------------------
ErrorCodesToDash_Table:fcb $12          ; sub_D4F9:loc_D08E↑o
                                        ; sub_D4F9:loc_D0D4↑o
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

; =============== S U B R O U T I N E =======================================


ThrowNonCriticalError:                  ; sub_9CF3+10A↑P
                                        ; EmmissionMaintenanceReminder1_MM+B0↑P ...
                ldx     #TL_ErrorBitsMask1

loc_D14B:                               ; ThrowNonCriticalError+C↓j
                brclr   0,x $FF loc_D156
                cmpa    0,x
                beq     loc_D1A2
                inx
                bra     loc_D14B
; ---------------------------------------------------------------------------

loc_D156:                               ; ThrowNonCriticalError:loc_D14B↑j
                tstb
                bmi     loc_D161
                cmpa    <ErrorBitRegisterStored3
                beq     loc_D19F
                cmpa    <ErrorBitRegisterStored2
                beq     loc_D195

loc_D161:                               ; ThrowNonCriticalError+F↑j
                andb    #$7F
                stab    Temp0
                ldy     #$00DC
                cmpa    0,y
                beq     loc_D182
                iny
                cmpa    0,y
                beq     loc_D182
                tst     0,y
                beq     loc_D182
                dey
                tst     0,y
                bne     loc_D1A2

loc_D182:                               ; ThrowNonCriticalError+25↑j
                                        ; ThrowNonCriticalError+2C↑j ...
                staa    0,y
                ldab    2,y
                incb
                beq     loc_D1A5
                cmpb    Temp0
                bcc     loc_D1A5
                stab    2,y
                clc
                rts
; ---------------------------------------------------------------------------

loc_D195:                               ; ThrowNonCriticalError+17↑j
                ldd     <ErrorBitRegisterStored2
                staa    <ErrorBitRegisterStored3
                stab    <ErrorBitRegisterStored2
                ldaa    <ErrorCodeUpdateKeyOnCount
                staa    <ErrorCodeUpdateKeyOnCount2

loc_D19F:                               ; ThrowNonCriticalError+13↑j
                clr     ErrorCodeUpdateKeyOnCount

loc_D1A2:                               ; ThrowNonCriticalError+9↑j
                                        ; ThrowNonCriticalError+38↑j
                clra
                clc
                rts
; ---------------------------------------------------------------------------

loc_D1A5:                               ; ThrowNonCriticalError+41↑j
                                        ; ThrowNonCriticalError+46↑j
                tst     ErrorBitRegister0
                beq     loc_D1B5
                brset   <BitFlags6a_t3 $40 loc_D1B2
                brclr   <BitFlags6a_t3 $20 loc_D1B5

loc_D1B2:                               ; ThrowNonCriticalError+62↑j
                jmp     loc_D23D
; ---------------------------------------------------------------------------

loc_D1B5:                               ; ThrowNonCriticalError+60↑j
                                        ; ThrowNonCriticalError+66↑j
                clr     0,y
                clr     2,y
                ldx     #ErrorBitRegister0

loc_D1BE:                               ; ThrowNonCriticalError+83↓j
                cmpa    0,x
                bne     loc_D1C7
                clrb
                stab    0,x
                bra     loc_D1CF
; ---------------------------------------------------------------------------

loc_D1C7:                               ; ThrowNonCriticalError+78↑j
                inx
                cpx     #ErrorBitRegisterStored3
                bls     loc_D1BE
                ldab    #$FF

loc_D1CF:                               ; ThrowNonCriticalError+7D↑j
                ldx     #ErrorBitRegisterStored3
                ldy     #$001D
                stab    Temp0

loc_D1D9:                               ; ThrowNonCriticalError+B1↓j
                cpx     #ErrorBitRegisterStored1
                bcs     loc_D1EE
                psha
                ldab    0,y
                ldaa    Temp0
                staa    0,y
                iny
                stab    Temp0
                pula

loc_D1EE:                               ; ThrowNonCriticalError+94↑j
                ldab    0,x
                staa    0,x
                tba
                beq     loc_D228
                dex
                cpx     #ErrorBitRegister0
                bcc     loc_D1D9
                clr     ErrorCodeUpdateKeyOnCount
                sei
                brset   <BitFlags6a_t3 $40 loc_D23D
                brset   <BitFlags6a_t3 $20 loc_D23D
                bset    <BitFlags6a_t3 $40
                cli
                staa    DRBOffsetStored_LB
                ldx     #$B61F

loc_D211:                               ; ThrowNonCriticalError+D0↓j
                inx
                ldab    0,x
                cba
                beq     loc_D223
                incb
                bne     loc_D211
                xgdx
                subd    #$B600
                stab    DRBOffsetStored_HB
                sec
                rts
; ---------------------------------------------------------------------------

loc_D223:                               ; ThrowNonCriticalError+CD↑j
                bclr    <BitFlags6a_t3 $40
                sec
                rts
; ---------------------------------------------------------------------------

loc_D228:                               ; ThrowNonCriticalError+AB↑j
                cpy     #$1F
                bhi     loc_D238
                ldab    <ErrorCodeUpdateKeyOnCount
                beq     loc_D23B
                ldab    Temp0
                stab    0,y

loc_D238:                               ; ThrowNonCriticalError+E4↑j
                clrb
                stab    <ErrorCodeUpdateKeyOnCount

loc_D23B:                               ; ThrowNonCriticalError+E8↑j
                sec
                rts
; ---------------------------------------------------------------------------

loc_D23D:                               ; ThrowNonCriticalError:loc_D1B2↑J
                                        ; ThrowNonCriticalError+B7↑j ...
                clc
                cli
                rts
; End of function ThrowNonCriticalError

; ---------------------------------------------------------------------------
gw_PIA1AManipulation_Table2:fcb 0, 0, 4, 0, $10, $20, 0, $80, 0, 0, $19, 0, $32, $C, 0, $E
                                        ; UpdatePIA1AndCheckOutputs2_MM+14C↓o
gw_PIA1AManipulation_Table:fcb 1, 2, 4, 8, $10, $20, 0, 0, $10, $11, $33, $51, $A, $12, 0, 0
                                        ; sub_D260+3D↓o

; =============== S U B R O U T I N E =======================================


sub_D260:                               ; __RESET+634↑P
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
                brclr   <BitFlags2e $40 loc_D2FA
                eora    PIA2_Buffer_t3_Temp
                anda    byte_89DB
                ldx     #gw_PIA1AManipulation_Table
                ldab    <Counter_MainLoop
                andb    #7
                abx
                bita    0,x
                beq     loc_D2FA
                ldaa    CountdownTimerFromKeyOn
                bne     loc_D2FA
                ldaa    SwitchPortAccessReg1
                bita    #$40
                bne     loc_D2FA
                ldaa    <BatteryVolts
                cmpa    #$A0
                bcs     loc_D2FA
                ldaa    8,x
                ldab    #$A0
                cmpa    #$11
                beq     loc_D2D2
                cmpa    #$12
                beq     loc_D2E0
                cmpa    #$33
                beq     loc_D2EE
                ldab    #$20
                jsr     ThrowNonCriticalError
                bra     loc_D2FA
; ---------------------------------------------------------------------------

loc_D2D2:                               ; sub_D260+61↑j
                brset   <b5D_IPL2_t3 8 loc_D2FA
                jsr     ThrowNonCriticalError
                bcc     loc_D2FA
                bset    <b5D_IPL2_t3 8
                bra     loc_D2FA
; ---------------------------------------------------------------------------

loc_D2E0:                               ; sub_D260+65↑j
                brset   <b5D_IPL2_t3 $20 loc_D2FA
                jsr     ThrowNonCriticalError
                bcc     loc_D2FA
                bset    <b5D_IPL2_t3 $20
                bra     loc_D2FA
; ---------------------------------------------------------------------------

loc_D2EE:                               ; sub_D260+69↑j
                brset   <b5D_IPL2_t3 4 loc_D2FA
                jsr     ThrowNonCriticalError
                bcc     loc_D2FA
                bset    <b5D_IPL2_t3 4

loc_D2FA:                               ; sub_D260+33↑j sub_D260+47↑j ...
                ldaa    <PIA2_Buffer_t3
                staa    PIA2_Buffer_t3_Temp
                bset    <BitFlags2e $40
                rts
; End of function sub_D260


; =============== S U B R O U T I N E =======================================


UpdatePIA1AndCheckOutputs2_MM:          ; __RESET+433↑P __RESET+631↑P
                ldaa    <EngineRpm_HB
                cmpa    #$3F
                bcs     loc_D324
                brclr   <BitFlags27 $20 loc_D324
                ldaa    <BitFlags_BF_t3
                cmpa    #$83
                beq     loc_D324
                cmpa    #$81
                beq     loc_D324
                ldd     TCNT_Counter_FreeRunning16bit
                subd    TIC1_Counter_IC1_CamSensor
                cpd     #$007D*ECLOCK
                bcs     loc_D324
                rts
; ---------------------------------------------------------------------------

loc_D324:                               ; UpdatePIA1AndCheckOutputs2_MM+4↑j
                                        ; UpdatePIA1AndCheckOutputs2_MM+6↑j ...
                ldaa    <PIA1_Buffer_t3
                adda    #$C3
                staa    Temp0
                ldab    #$40
                ldaa    #$61
                ldy     #HC11Reg
                ldx     #PiaAddr
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
 IF ECLOCK == 3
                ldab    #$20*ECLOCK
 ENDIF

loc_D353:                               ; UpdatePIA1AndCheckOutputs2_MM+55↓j
                brclr   0,x 8 loc_D35D
                decb
                bne     loc_D353
                jmp     loc_D49F
; ---------------------------------------------------------------------------

loc_D35D:                               ; UpdatePIA1AndCheckOutputs2_MM:loc_D353↑j
                ldab    #$05*ECLOCK+1
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp1
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    #$00

loc_D374:                               ; UpdatePIA1AndCheckOutputs2_MM+76↓j
                brclr   0,x 8 loc_D37E
                decb
                bne     loc_D374
                jmp     loc_D49F
; ---------------------------------------------------------------------------

loc_D37E:                               ; UpdatePIA1AndCheckOutputs2_MM:loc_D374↑j
                ldab    #$05*ECLOCK+1
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp2
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    <PIA1_Buffer_t3

loc_D395:                               ; UpdatePIA1AndCheckOutputs2_MM+97↓j
                brclr   0,x 8 loc_D39F
                decb
                bne     loc_D395
                jmp     loc_D49F
; ---------------------------------------------------------------------------

loc_D39F:                               ; UpdatePIA1AndCheckOutputs2_MM:loc_D395↑j
                ldab    #$05*ECLOCK+1
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp3
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    #0

loc_D3B6:                               ; UpdatePIA1AndCheckOutputs2_MM+B8↓j
                brclr   0,x 8 loc_D3C0
                decb
                bne     loc_D3B6
                jmp     loc_D49F
; ---------------------------------------------------------------------------

loc_D3C0:                               ; UpdatePIA1AndCheckOutputs2_MM:loc_D3B6↑j
                ldab    #$05*ECLOCK+1
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp4
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp0

loc_D3D8:                               ; UpdatePIA1AndCheckOutputs2_MM+DA↓j
                brclr   0,x 8 loc_D3E2
                decb
                bne     loc_D3D8
                jmp     loc_D49F
; ---------------------------------------------------------------------------

loc_D3E2:                               ; UpdatePIA1AndCheckOutputs2_MM:loc_D3D8↑j
                ldab    #$05*ECLOCK+1
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop

loc_D3EE:                               ; UpdatePIA1AndCheckOutputs2_MM+F1↓j
                brset   $29,y $80 loc_D3F9
                decb
                bne     loc_D3EE
                jmp     loc_D49F
; ---------------------------------------------------------------------------

loc_D3F9:                               ; UpdatePIA1AndCheckOutputs2_MM:loc_D3EE↑j
                ldaa    SPDR_SerialPeripheralDataIO
                bset    8,y $20
                cli
                ldab    Temp1
                addb    Temp2
                addb    Temp3
                addb    Temp4
                cba
                beq     loc_D413
                jmp     locret_D49A
; ---------------------------------------------------------------------------

loc_D413:                               ; UpdatePIA1AndCheckOutputs2_MM+10B↑j
                ldaa    Temp2
                ldab    <BitFlags27
                bitb    #$C0
                beq     loc_D437
                eora    #$82
                staa    <StartupSwitchMirror1
                brclr   <StartupSwitchMirror1 $40 loc_D432
                brclr   <StartupSwitchMirror1 $80 loc_D42D
                bset    <BitFlags68_t3 $20
                bra     loc_D445
; ---------------------------------------------------------------------------

loc_D42D:                               ; UpdatePIA1AndCheckOutputs2_MM+121↑j
                bclr    <BitFlags68_t3 $20
                bra     loc_D445
; ---------------------------------------------------------------------------

loc_D432:                               ; UpdatePIA1AndCheckOutputs2_MM+11D↑j
                bset    <BitFlags68_t3 $20
                bra     loc_D445
; ---------------------------------------------------------------------------

loc_D437:                               ; UpdatePIA1AndCheckOutputs2_MM+117↑j
                staa    <StartupSwitchMirror1
                brclr   <StartupSwitchMirror1 $80 loc_D442
                bset    <BitFlags68_t3 $20
                bra     loc_D445
; ---------------------------------------------------------------------------

loc_D442:                               ; UpdatePIA1AndCheckOutputs2_MM+136↑j
                bclr    <BitFlags68_t3 $20

loc_D445:                               ; UpdatePIA1AndCheckOutputs2_MM+128↑j
                                        ; UpdatePIA1AndCheckOutputs2_MM+12D↑j ...
                brclr   <Ram_30 $80 loc_D49B
                ldaa    Temp4
                anda    byte_89DA
                ldx     #gw_PIA1AManipulation_Table2
                ldab    <Counter_MainLoop
                andb    #7
                abx
                bita    0,x
                beq     locret_D49A
                ldaa    CountdownTimerFromKeyOn
                bne     locret_D49A
                ldaa    SwitchPortAccessReg1
                bita    #$40
                bne     locret_D49A
                ldaa    <BatteryVolts
                cmpa    #$A0
                bcs     locret_D49A
                ldaa    8,x
                ldab    #$A0
                cmpa    #$C
                beq     loc_D487
                cmpa    #$19
                bne     loc_D495
                brset   <b5D_IPL2_t3 $80 locret_D49A
                jsr     ThrowNonCriticalError
                bcc     locret_D49A
                bset    <b5D_IPL2_t3 $80
                bra     locret_D49A
; ---------------------------------------------------------------------------

loc_D487:                               ; UpdatePIA1AndCheckOutputs2_MM+170↑j
                brset   <b5d_IPL2 $80 locret_D49A
                jsr     ThrowNonCriticalError
                bcc     locret_D49A
                bset    <b5d_IPL2 $80
                bra     locret_D49A
; ---------------------------------------------------------------------------

loc_D495:                               ; UpdatePIA1AndCheckOutputs2_MM+174↑j
                ldab    #$20
                jsr     ThrowNonCriticalError

locret_D49A:                            ; UpdatePIA1AndCheckOutputs2_MM+10D↑J
                                        ; UpdatePIA1AndCheckOutputs2_MM+156↑j ...
                rts
; ---------------------------------------------------------------------------

loc_D49B:                               ; UpdatePIA1AndCheckOutputs2_MM:loc_D445↑j
                bset    <Ram_30 $80
                rts
; ---------------------------------------------------------------------------

loc_D49F:                               ; UpdatePIA1AndCheckOutputs2_MM+57↑J
                                        ; UpdatePIA1AndCheckOutputs2_MM+78↑J ...
                bset    8,y $20
                cli
                ldaa    <BitFlags6a_t3
                bita    #$60
                bne     loc_D4C4
                ldaa    PPROG_EEPROMControlReg
                bita    #2
                bne     loc_D4C4
                ldd     #$B618
                tba
                ldab    $B618
                beq     loc_D4C4
                decb
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB
                bset    <BitFlags6a_t3 $40

loc_D4C4:                               ; UpdatePIA1AndCheckOutputs2_MM+1A5↑j
                                        ; UpdatePIA1AndCheckOutputs2_MM+1AC↑j ...
                ldd     #$4488
                jsr     ThrowNonCriticalError
                bcc     loc_D4DF
                sei
                ldaa    SwitchPortAccessReg1
                anda    #$FE
                staa    SwitchPortAccessReg1
                ldab    #$01*ECLOCK+1

loc_D4D7:                               ; UpdatePIA1AndCheckOutputs2_MM+1D5↓j
                decb
                bne     loc_D4D7
                oraa    #$01
                staa    SwitchPortAccessReg1

loc_D4DF:                               ; UpdatePIA1AndCheckOutputs2_MM+1C7↑j
                cli
                rts
; End of function UpdatePIA1AndCheckOutputs2_MM


; =============== S U B R O U T I N E =======================================


sub_D4E1:                               ; __RESET+60A↑P
                ldaa    <Ram_F3
                bpl     locret_D4F8
                anda    #$7F
                staa    <Ram_F3
                ldd     #$26A8
                brset   <b5C_IPL1_t3 $80 locret_D4F8
                jsr     ThrowNonCriticalError
                bcc     locret_D4F8
                bset    <b5C_IPL1_t3 $80

locret_D4F8:                            ; sub_D4E1+2↑j sub_D4E1+B↑j ...
                rts
; End of function sub_D4E1


; =============== S U B R O U T I N E =======================================


sub_D4F9:                               ; __RESET+601↑P

                ldab    #$40
                brset   <IPL1 $40 loc_D519
                ldaa    <DRBPointer1
                cmpa    #$0A
                bne     loc_D508
                jmp     loc_D03A
; ---------------------------------------------------------------------------

loc_D508:                               ; sub_D4F9+A↑j
                cmpa    #$18
                bne     loc_D513
                ldaa    <Counter_MainLoop
                asla
                bmi     loc_D53D
                bra     loc_D53C
; ---------------------------------------------------------------------------

loc_D513:                               ; sub_D4F9+11↑j
                brset   <BitFlags6a_t3 4 loc_D53D
                bra     loc_D53C
; ---------------------------------------------------------------------------

loc_D519:                               ; sub_D4F9+2↑j
                ldx     <KeyOnOrEngineRunningTime
                cpx     #$03
                bls     loc_D53D
                bclr    <Ram_05 $C0
                brclr   <PIA1_Buffer_t3 $40 loc_D53C
                ldaa    <b5C_IPL1_t3
                bita    byte_89DC
                bne     loc_D53C
                ldaa    <b5D_IPL2_t3
                bita    byte_89DD
                bne     loc_D53C
                ldaa    <b5d_IPL2
                bita    byte_89DE
                beq     loc_D53D

loc_D53C:                               ; sub_D4F9+18↑j sub_D4F9+1E↑j ...
                clrb

loc_D53D:                               ; sub_D4F9+16↑j
                                        ; sub_D4F9:loc_D513↑j ...
                ldaa    #$BF
                anda    <PIA1_Buffer_t3
                aba
                staa    <PIA1_Buffer_t3
                rts
; End of function sub_D4F9


; =============== S U B R O U T I N E =======================================


sub_D545:                               ; __RESET+5D8↑P
                ldaa    <BitFlags27
                bita    #$C0
                beq     locret_D591
                brset   <IPL1 $40 loc_D555
                brset   <BitFlags6a_t3 4 loc_D589
                bra     loc_D58E
; ---------------------------------------------------------------------------

loc_D555:                               ; sub_D545+6↑j
                                        ; RESERVED:DD11↓w ...
                brset   <b5C_IPL1_t3 $20 loc_D58E
                ldaa    <Counter_MainLoop
                bita    #$3C
                bne     loc_D585
                ldaa    <TargetBatteryVolts
                suba    <BatteryVolts
                bcs     loc_D57E
                cmpa    #$11
                bcs     loc_D57E
                ldd     <EngineRpm_HB
                cpd     #$2EE0
                bcs     loc_D581
                ldaa    UNe_64B8
                inca
                cmpa    #$56
                bcs     loc_D582
                bset    <Ram_30 $20
                bra     loc_D58E
; ---------------------------------------------------------------------------

loc_D57E:                               ; sub_D545+1E↑j sub_D545+22↑j
                bclr    <Ram_30 $20

loc_D581:                               ; sub_D545+2A↑j
                clra

loc_D582:                               ; sub_D545+32↑j
                staa    UNe_64B8

loc_D585:                               ; sub_D545+18↑j
                brset   <Ram_30 $20 loc_D58E

loc_D589:                               ; sub_D545+A↑j
                bset    <PIA2_Buffer_t3 4
                bra     locret_D591
; ---------------------------------------------------------------------------

loc_D58E:                               ; sub_D545+E↑j
                                        ; sub_D545:loc_D555↑j ...
                bclr    <PIA2_Buffer_t3 4

locret_D591:                            ; sub_D545+4↑j sub_D545+47↑j
                rts
; End of function sub_D545


; =============== S U B R O U T I N E =======================================


sub_D592:                               ; __RESET+5B9↑P
                ldd     <ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
                tsta
                beq     loc_D59F
                dec     ClearTheErrorTimer_0
                bne     loc_D59F
                clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB

loc_D59F:                               ; sub_D592+3↑j sub_D592+8↑j
                tstb
                beq     loc_D5AA
                dec     ClearTheErrorTimer_1
                bne     loc_D5AA
                clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB

loc_D5AA:                               ; sub_D592+E↑j sub_D592+13↑j
                ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
                beq     locret_D5B9
                suba    #$10
                bita    #$F0
                bne     loc_D5B6
                clra

loc_D5B6:                               ; sub_D592+21↑j
                staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

locret_D5B9:                            ; sub_D592+1B↑j
                rts
; End of function sub_D592


; =============== S U B R O U T I N E =======================================


sub_D5BA:                               ; __RESET+637↑P
                brclr   <IPL1 $40 locret_D5F3
                brset   <BitFlags6d_t3 4 locret_D5F3
                brset   <BitFlags6a_t3 $40 locret_D5F3
                bset    <BitFlags6d_t3 4
                brclr   <ErrorBitRegisterStored3 $FF loc_D5EC
                ldaa    <ErrorCodeUpdateKeyOnCount
                cmpa    #$32
                bcs     loc_D5D6
                jmp     sub_CABD
; ---------------------------------------------------------------------------

loc_D5D6:                               ; sub_D5BA+17↑j
                ldaa    <ErrorBitRegisterStored1
                beq     loc_D5E1
                ldaa    <ErrorCodeUpdateKeyOnCount3
                inca
                beq     loc_D5E1
                staa    <ErrorCodeUpdateKeyOnCount3

loc_D5E1:                               ; sub_D5BA+1E↑j sub_D5BA+23↑j
                ldaa    <ErrorBitRegisterStored2
                beq     loc_D5EC
                ldaa    <ErrorCodeUpdateKeyOnCount2
                inca
                beq     loc_D5EC
                staa    <ErrorCodeUpdateKeyOnCount2

loc_D5EC:                               ; sub_D5BA+F↑j sub_D5BA+29↑j ...
                ldaa    <ErrorCodeUpdateKeyOnCount
                inca
                beq     locret_D5F3
                staa    <ErrorCodeUpdateKeyOnCount

locret_D5F3:                            ; sub_D5BA↑j sub_D5BA+4↑j ...
                rts
; End of function sub_D5BA


; =============== S U B R O U T I N E =======================================


sub_D5F4:                               ; sub_B800+4A↑P sub_B88A+4D↑P ...
                anda    #$F
                ldab    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
                beq     loc_D603
                andb    #$F
                cba
                bne     locret_D60A
                ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

loc_D603:                               ; sub_D5F4+5↑j
                adda    #$10
                bcs     loc_D60B
                staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

locret_D60A:                            ; sub_D5F4+A↑j
                rts
; ---------------------------------------------------------------------------

loc_D60B:                               ; sub_D5F4+11↑j
                ldab    #1

loc_D60D:                               ; sub_D5F4+1D↓j
                deca
                beq     loc_D613
                aslb
                bra     loc_D60D
; ---------------------------------------------------------------------------

loc_D613:                               ; sub_D5F4+1A↑j
                clr     ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
                comb
                sei
                andb    <b5C_IPL1_t3
                stab    <b5C_IPL1_t3
                cli
                rts
; End of function sub_D5F4


; =============== S U B R O U T I N E =======================================


sub_D61E:                               ; sub_C5F1:loc_C626↑P
                                        ; ROM:loc_EE73↓P ...
                ldab    <EngineRpm_HB
                cmpb    #$7D
                ldaa    #0
                bcc     loc_D63C
                subb    #$10
                bcc     loc_D62B
                clrb

loc_D62B:                               ; sub_D61E+A↑j
                ldaa    #$29
                mul
                lsld
                aslb
                adca    <LowestSessionTpsVolts
                tab
                ldaa    <TpsVolts
                adda    byte_8A3C
                sba
                bcc     loc_D63C
                clra

loc_D63C:                               ; sub_D61E+6↑j sub_D61E+1B↑j
                ldx     #byte_8A28
                jsr     Lookup4ByteTable
                adda    byte_8A3B
                bcc     locret_D649
                ldaa    #$FF

locret_D649:                            ; sub_D61E+27↑j
                rts
; End of function sub_D61E


; =============== S U B R O U T I N E =======================================


sub_D64A:                               ; __RESET+4C4↑P
                brclr   <Ram_05 1 loc_D684
                ldab    <BatteryVolts
                cmpb    byte_89E6
                bcs     loc_D675
                cmpb    byte_89E5
                bcc     loc_D675
                ldaa    <MapVolts_X
                suba    <MapValue3
                bls     loc_D675
                cmpa    byte_89E4
                bcs     loc_D675
                sei

loc_D666:                               ; sub_D64A+1F↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_D666
                ldaa    ADR1_A2DResults1
                staa    <MapVolts_X
                staa    <MapValue3
                cli
                bra     loc_D67E
; ---------------------------------------------------------------------------

loc_D675:                               ; sub_D64A+9↑j sub_D64A+E↑j ...
                ldaa    UNe_64B9
                anda    #$E0
                cmpa    #$E0
                bne     loc_D684

loc_D67E:                               ; sub_D64A+29↑j
                ldd     #$2828
                jsr     ThrowNonCriticalError

loc_D684:                               ; sub_D64A↑j sub_D64A+32↑j
                brset   <BitFlags2b $40 locret_D6A0
                ldaa    UNe_64B9
                anda    #$1F
                cmpa    #$1F
                bne     locret_D6A0
                brset   <b5d_IPL2 $40 locret_D6A0
                ldd     #$0181
                jsr     ThrowNonCriticalError
                bcc     locret_D6A0
                bset    <b5d_IPL2 $40

locret_D6A0:                            ; sub_D64A:loc_D684↑j
                                        ; sub_D64A+45↑j ...
                rts
; End of function sub_D64A


; =============== S U B R O U T I N E =======================================


sub_D6A1:                               ; __RESET+616↑P
                brclr   <IPL1 $40 locret_D6E9
                ldd     <KeyOnOrEngineRunningTime
                cmpa    #$B
                bcs     locret_D6E9
                ldaa    <CoolantTemp
                cmpa    byte_89FA
                bcs     locret_D6E9
                bitb    #$1F
                bne     locret_D6E9
                brset   <BitFlags27 1 loc_D6BE
                brclr   <BitFlags68_t3 $10 locret_D6E9

loc_D6BE:                               ; sub_D6A1+15↑j
                brset   <StartupSwitchMirror1 $20 locret_D6E9
                brclr   <BitFlags66_t3 $80 locret_D6E9
                ldaa    <EngineRpm_HB
                cmpa    byte_89F8
                bcs     locret_D6E9
                ldaa    <MapVolts
                cmpa    byte_89F9
                bcc     locret_D6E9
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    #2
                bcc     locret_D6E9
                brset   <b5D_IPL2_t3 $10 locret_D6E9
                ldd     #$23A0
                jsr     ThrowNonCriticalError
                bcc     locret_D6E9
                bset    <b5D_IPL2_t3 $10

locret_D6E9:                            ; sub_D6A1↑j sub_D6A1+8↑j ...
                rts
; End of function sub_D6A1


; =============== S U B R O U T I N E =======================================


sub_D6EA:                               ; __RESET+61C↑P
                ldaa    SwitchPortAccessReg1
                bita    #$40
                beq     loc_D6F2
                rts
; ---------------------------------------------------------------------------

loc_D6F2:                               ; sub_D6EA+5↑j
                brset   <IPL1 $40 loc_D6F9
                jmp     loc_D73C
; ---------------------------------------------------------------------------

loc_D6F9:                               ; sub_D6EA:loc_D6F2↑j
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    #$2C
                bcs     loc_D73C
                ldaa    <CoolantTemp
                cmpa    #$CD
                bcs     loc_D73C
                brclr   <BitFlags2e 4 loc_D741
                ldaa    <Counter_O2Diagnostics
                cmpa    #$13
                bcs     loc_D737
                ldaa    <O2SensorVolts
                cmpa    #$4D
                bcs     loc_D73C
                ldaa    <Timer_O2MiddleDiagnostics
                cmpa    #$2A
                bcs     loc_D72C
                brset   <b5d_IPL2 2 loc_D72A
                ldd     #$2081
                jsr     ThrowNonCriticalError
                bcc     locret_D79A
                bset    <b5d_IPL2 2

loc_D72A:                               ; sub_D6EA+31↑j
                bra     locret_D79A
; ---------------------------------------------------------------------------

loc_D72C:                               ; sub_D6EA+2F↑j
                ldab    <Counter_MainLoop
                bitb    #$7F
                bne     locret_D79A
                inca
                staa    <Timer_O2MiddleDiagnostics
                bra     locret_D79A
; ---------------------------------------------------------------------------

loc_D737:                               ; sub_D6EA+23↑j
                inca
                staa    <Counter_O2Diagnostics
                bra     locret_D79A
; ---------------------------------------------------------------------------

loc_D73C:                               ; sub_D6EA+C↑J sub_D6EA+13↑j ...
                bclr    <BitFlags2e 4
                bra     loc_D771
; ---------------------------------------------------------------------------

loc_D741:                               ; sub_D6EA+1B↑j
                ldaa    <O2SensorVolts
                cmpa    byte_89F5
                bhi     loc_D771
                cmpa    byte_89F6
                bcs     loc_D771
                ldaa    <Timer_O2MiddleDiagnostics
                cmpa    #$15
                bcs     loc_D768
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
                bra     locret_D79A
; ---------------------------------------------------------------------------

loc_D768:                               ; sub_D6EA+67↑j
                ldab    <Counter_MainLoop
                bitb    #$7F
                bne     loc_D774
                inca
                bra     loc_D772
; ---------------------------------------------------------------------------

loc_D771:                               ; sub_D6EA+55↑j sub_D6EA+5C↑j ...
                clra

loc_D772:                               ; sub_D6EA+85↑j
                staa    <Timer_O2MiddleDiagnostics

loc_D774:                               ; sub_D6EA+82↑j
                sei
                ldaa    <PIA3_Buffer_t3
                anda    #$F7
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                cli
                ldaa    <Counter_MainLoop
                bita    #$F
                bne     locret_D79A
                brset   <b5d_IPL2 4 locret_D79A
                ldaa    <O2SensorVolts
                cmpa    #$3E
                bls     locret_D79A
                ldd     #$3E8F
                jsr     ThrowNonCriticalError
                bcc     locret_D79A
                bset    <b5d_IPL2 4

locret_D79A:                            ; sub_D6EA+3B↑j
                                        ; sub_D6EA:loc_D72A↑j ...
                rts
; End of function sub_D6EA


; =============== S U B R O U T I N E =======================================


sub_D79B:                               ; __RESET+610↑P
                ldaa    <ATMOffset
                cmpa    #$D
                beq     loc_D7D2
                brset   <b5d_IPL2 $10 loc_D7D2
                sei
                ldaa    SwitchPortAccessReg1
                bita    #$10
                beq     loc_D7D2
                bita    #$40
                bne     loc_D7D2
                brset   <PIA2_Buffer_t3 $10 loc_D7D2
                brclr   <BitFlags2e $20 loc_D7CC
                lsra
                eora    <BitFlags24
                bita    #$02
                cli
                beq     loc_D7CC
                ldd     #$0BA0
                jsr     ThrowNonCriticalError
                bcc     loc_D7CC
                bset    <b5d_IPL2 $10

loc_D7CC:                               ; sub_D79B+1A↑j sub_D79B+24↑j ...
                cli
                bset    <BitFlags2e $20
                bra     locret_D7D6
; ---------------------------------------------------------------------------

loc_D7D2:                               ; sub_D79B+4↑j sub_D79B+6↑j ...
                cli
                bclr    <BitFlags2e $20

locret_D7D6:                            ; sub_D79B+35↑j
                rts
; End of function sub_D79B


; =============== S U B R O U T I N E =======================================


sub_D7D7:                               ; __RESET+5C7↑P
                brclr   <BitFlags2e 2 loc_D7FD
                ldaa    <BatteryVolts
                cmpa    #$82
                bcs     locret_D7FC
                ldaa    <Counter_MainLoop
                bita    #$04
                bne     locret_D7FC
                ldaa    <TimerOverflowsBetweenCamPulses
                bne     locret_D7FC
                brset   <DistributorFallingEdgePulsewidth_HB $80 locret_D7FC
                ldaa    SwitchPortAccessReg1
                bita    #$50
                bne     locret_D7FC
                ldd     #$2C14
                jsr     ThrowNonCriticalError

locret_D7FC:                            ; sub_D7D7+8↑j sub_D7D7+E↑j ...
                rts
; ---------------------------------------------------------------------------

loc_D7FD:                               ; sub_D7D7↑j
                bset    <BitFlags2e 2
                rts
; End of function sub_D7D7


; =============== S U B R O U T I N E =======================================


sub_D801:                               ; sub_E832:loc_E9EC↓P
                sei

loc_D802:                               ; sub_D801+4↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_D802
                ldaa    ADR1_A2DResults1
                cmpa    <MapVolts_X
                bcs     loc_D810
                staa    <MapVolts_X

loc_D810:                               ; sub_D801+B↑j
                cmpa    <MapValue3
                bcc     loc_D816
                staa    <MapValue3

loc_D816:                               ; sub_D801+11↑j
                cli
                rts
; End of function sub_D801


; =============== S U B R O U T I N E =======================================


sub_D818:                               ; ROM:F2EA↓P
                ldaa    <BitFlags608D
                anda    #$F
                inca
                cmpa    byte_8A0C
                bcc     loc_D828
                inc     BitFlags608D
                jmp     locret_D8A6
; ---------------------------------------------------------------------------

loc_D828:                               ; sub_D818+8↑j
                ldaa    <BitFlags608D
                anda    #$F0
                staa    <BitFlags608D
                ldaa    <MapVolts_X
                suba    <MapValue3
                ldab    ADR1_A2DResults1
                stab    <MapVolts_X
                stab    <MapValue3
                brset   <b5C_IPL1_t3 $80 loc_D864
                cmpa    byte_8A0A
                bcc     locret_D8A6
                ldd     <EngineRpm_HB
                cpd     byte_8A1D
                bcs     locret_D8A6
                cpd     byte_8A1F
                bcc     locret_D8A6
                ldaa    <MapVolts_X
                cmpa    byte_8A21
                bcs     locret_D8A6
                cmpa    byte_8A22
                bcc     locret_D8A6
                ldaa    <Ram_F3
                oraa    #$80
                staa    <Ram_F3
                bra     locret_D8A6
; ---------------------------------------------------------------------------

loc_D864:                               ; sub_D818+21↑j
                ldab    <BitFlags608D
                addb    #$10
                bcc     loc_D86C
                orab    #$F0

loc_D86C:                               ; sub_D818+50↑j
                stab    <BitFlags608D
                suba    byte_8A0A
                bcs     locret_D8A6
                cmpa    byte_8A0B
                bcs     locret_D8A6
                ldaa    <VehicleSpeedx8_Scaled
                bne     loc_D88E
                brset   <BitFlags66_t3 $80 loc_D88E
                ldd     <EngineRpm_HB
                subd    <TargetIdleSpeedHB
                bcc     loc_D888
                coma
                comb

loc_D888:                               ; sub_D818+6C↑j
                cpd     byte_8A23
                bcs     locret_D8A6

loc_D88E:                               ; sub_D818+62↑j sub_D818+64↑j
                ldab    byte_8A0C
                ldx     #byte_8A0D
                abx
                ldaa    0,x
                cmpa    <BitFlags608D
                bhi     locret_D8A6
                ldaa    #8
                jsr     sub_D5F4
                ldaa    <BitFlags608D
                anda    #$F
                staa    <BitFlags608D

locret_D8A6:                            ; sub_D818+D↑J sub_D818+28↑j ...
                rts
; End of function sub_D818


; =============== S U B R O U T I N E =======================================


sub_D8A7:                               ; __RESET+622↑P
                ldaa    <Counter_MainLoop
                bita    #7
                bne     loc_D900
                brset   <b5C_IPL1_t3 $80 loc_D8E8
                tst     VehicleSpeedx8_Scaled
                bne     loc_D8E8
                brset   <BitFlags66_t3 $80 loc_D8E8
                ldd     <EngineRpm_HB
                subd    <TargetIdleSpeedHB
                bcc     loc_D8C2
                coma
                comb

loc_D8C2:                               ; sub_D8A7+17↑j
                cpd     byte_8A23
                bcc     loc_D8E8
                ldaa    <BaroPressure
                suba    <MapValue
                bcs     loc_D8DD
                ldab    <BaroPressure
                ldx     #byte_8A26
                cmpb    byte_8A25
                bcc     loc_D8D9
                inx

loc_D8D9:                               ; sub_D8A7+2F↑j
                cmpa    0,x
                bcc     loc_D8E8

loc_D8DD:                               ; sub_D8A7+25↑j
                ldd     #$2794
                jsr     ThrowNonCriticalError
                bcc     loc_D8E8
                bset    <b5C_IPL1_t3 $80

loc_D8E8:                               ; sub_D8A7+6↑j sub_D8A7+D↑j ...
                brclr   <BitFlags2e $80 loc_D902
                sei

loc_D8ED:                               ; sub_D8A7+49↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_D8ED
                ldaa    ADR1_A2DResults1
                cli
                cmpa    byte_8A09
                bcs     locret_D93C
                cmpa    byte_8A08
                bcs     loc_D941

loc_D900:                               ; sub_D8A7+4↑j
                bra     locret_D93C
; ---------------------------------------------------------------------------

loc_D902:                               ; sub_D8A7:loc_D8E8↑j
                ldx     <EngineRpm_HB
                cpx     #$C80
                bcs     locret_D93C
                cpx     #$2EE0
                bcc     locret_D93C
                ldaa    <TpsVolts_Minus_LowestSessionTpsVolts
                cmpa    #$32
                bcc     locret_D93C
                sei

loc_D915:                               ; sub_D8A7+71↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_D915
                ldaa    ADR1_A2DResults1
                cli
                cmpa    byte_8A08
                bcc     loc_D92D
                cmpa    byte_8A07
                bcc     loc_D93D
                ldd     #$2494
                bra     loc_D930
; ---------------------------------------------------------------------------

loc_D92D:                               ; sub_D8A7+7A↑j
                ldd     #$2594

loc_D930:                               ; sub_D8A7+84↑j
                brset   <b5C_IPL1_t3 8 locret_D93C
                jsr     ThrowNonCriticalError
                bcc     locret_D93C
                bset    <b5C_IPL1_t3 8

locret_D93C:                            ; sub_D8A7+52↑j
                                        ; sub_D8A7:loc_D900↑j ...
                rts
; ---------------------------------------------------------------------------

loc_D93D:                               ; sub_D8A7+7F↑j
                brclr   <b5C_IPL1_t3 8 locret_D93C

loc_D941:                               ; sub_D8A7+57↑j
                ldaa    #4
                jsr     sub_D5F4
                brset   <b5C_IPL1_t3 8 locret_D93C
                bclr    <BitFlags2e $80
                bra     locret_D93C
; End of function sub_D8A7


; =============== S U B R O U T I N E =======================================


sub_D94F:                               ; __RESET+60D↑P
                ldaa    <Counter_MainLoop
                bita    #$1F
                bne     locret_D976
                brclr   <IPL1 $40 locret_D976
                ldaa    <BatteryVolts
                suba    <TargetBatteryVolts
                bcs     loc_D973
                cmpa    #$10
                bcs     loc_D973
                brset   <b5C_IPL1_t3 $20 locret_D976
                ldd     #$06A0
                jsr     ThrowNonCriticalError
                bcc     locret_D976
                bset    <b5C_IPL1_t3 $20
                rts
; ---------------------------------------------------------------------------

loc_D973:                               ; sub_D94F+E↑j sub_D94F+12↑j
                bclr    <b5C_IPL1_t3 $20

locret_D976:                            ; sub_D94F+4↑j sub_D94F+6↑j ...
                rts
; End of function sub_D94F


; =============== S U B R O U T I N E =======================================


sub_D977:                               ; __RESET+619↑P
                brset   <b5C_IPL1_t3 2 locret_D9AC
                ldaa    <CoolantTemp
                cmpa    byte_89E1
                bcs     loc_D987
                bset    <BitFlags6d_t3 2
                bra     locret_D9AC
; ---------------------------------------------------------------------------

loc_D987:                               ; sub_D977+9↑j
                brset   <BitFlags6d_t3 2 locret_D9AC
                brclr   <IPL1 $40 locret_D9AC
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    #$FF
                bne     locret_D9AC
                ldaa    <VehicleSpeedx8_Scaled
                cmpa    byte_89E2
                bcs     locret_D9AC
                ldab    Timer_ThermostatDiagnostics
                cmpb    byte_89E3
                beq     loc_D9AD
                ldaa    <Counter_MainLoop
                bne     locret_D9AC
                incb
                stab    Timer_ThermostatDiagnostics

locret_D9AC:                            ; sub_D977↑j sub_D977+E↑j ...
                rts
; ---------------------------------------------------------------------------

loc_D9AD:                               ; sub_D977+2B↑j
                ldd     #$2101
                jsr     ThrowNonCriticalError
                bcc     locret_D9B8
                bset    <BitFlags6d_t3 2

locret_D9B8:                            ; sub_D977+3C↑j
                rts
; End of function sub_D977


; =============== S U B R O U T I N E =======================================


sub_D9B9:                               ; __RESET+5EC↑P
                brset   <BitFlags2d 8 loc_D9EC
                brclr   <BitFlags2d 4 loc_D9EC
                brclr   <IPL1 $40 loc_D9EC
                sei
                ldaa    <BitFlags6a_t3
                bita    #$60
                bne     loc_D9EA
                bset    <BitFlags2d 8
                ldx     #$B613
                ldaa    0,x
                inca
                beq     loc_D9EA
                cmpa    byte_8810
                bcs     loc_D9DF
                bset    <BitFlags2d 2

loc_D9DF:                               ; sub_D9B9+21↑j
                staa    DRBOffsetStored_LB
                ldaa    #$13
                staa    DRBOffsetStored_HB
                bset    <BitFlags6a_t3 $40

loc_D9EA:                               ; sub_D9B9+11↑j sub_D9B9+1C↑j
                cli
                nop

loc_D9EC:                               ; sub_D9B9↑j sub_D9B9+4↑j ...
                sei
                brset   <BitFlags6a_t3 $40 loc_DA6F
                ldx     #$B616
                brclr   <BitFlags2d $10 loc_DA30
                brset   <BitFlags2d 1 loc_DA30
                ldaa    #$16
                ldab    #$4A
                brclr   <BitFlags6a_t3 $20 loc_DA27
                cmpa    DRBOffsetStored_HB
                beq     loc_DA20
                inca
                cmpa    DRBOffsetStored_HB
                bne     loc_DA30
                bset    <BitFlags6a_t3 $40
                bclr    <BitFlags6a_t3 $20
                bset    <BitFlags2d 1
                ldaa    #$13
                clrb
                stab    Counter_ACControl1
                bra     loc_DA2A
; ---------------------------------------------------------------------------

loc_DA20:                               ; sub_D9B9+4E↑j
                bset    <BitFlags6a_t3 $40
                inca
                comb
                bra     loc_DA2A
; ---------------------------------------------------------------------------

loc_DA27:                               ; sub_D9B9+47↑j
                bset    <BitFlags6a_t3 $60

loc_DA2A:                               ; sub_D9B9+65↑j sub_D9B9+6C↑j
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB

loc_DA30:                               ; sub_D9B9+3B↑j sub_D9B9+3F↑j ...
                ldaa    1,x
                coma
                cmpa    0,x
                bne     loc_DA40
                cmpa    #$4A
                bne     loc_DA40
                bset    <BitFlags2d 4
                bra     loc_DA43
; ---------------------------------------------------------------------------

loc_DA40:                               ; sub_D9B9+7C↑j sub_D9B9+80↑j
                bclr    <BitFlags2d 4

loc_DA43:                               ; sub_D9B9+85↑j
                cli
                brclr   <BitFlags2d 2 locret_DA70
                sei
                brset   <BitFlags6a_t3 $40 loc_DA6F
                ldaa    #$16
                ldab    #$EE
                brclr   <BitFlags6a_t3 $20 loc_DA66
                cmpa    DRBOffsetStored_HB
                bne     loc_DA6F
                inca
                bset    <BitFlags6a_t3 $40
                bclr    <BitFlags6a_t3 $20
                bclr    <BitFlags2d 2
                bra     loc_DA69
; ---------------------------------------------------------------------------

loc_DA66:                               ; sub_D9B9+98↑j
                bset    <BitFlags6a_t3 $60

loc_DA69:                               ; sub_D9B9+AB↑j
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB

loc_DA6F:                               ; sub_D9B9+34↑j sub_D9B9+90↑j ...
                cli

locret_DA70:                            ; sub_D9B9+8B↑j
                rts
; End of function sub_D9B9


; =============== S U B R O U T I N E =======================================


sub_DA71:                               ; __RESET+613↑P
                brset   <BitFlags21 $20 loc_DAE5
                ldaa    <b5d_IPL2
                bita    #$18
                bne     loc_DAE5
                ldaa    <TargetBatteryVolts
                sei

loc_DA7E:                               ; sub_DA71+10↓j
                ldab    ADCTL_A2DControlReg
                bpl     loc_DA7E
                suba    ADR2_A2DResults2
                cli
                bcs     loc_DAE5
                cmpa    byte_89ED
                bcs     loc_DAE5
                ldd     <EngineRpm_HB
                cpd     byte_89EE
                bcs     loc_DAE5
                ldaa    #$F
                brclr   <BitFlags2e 1 loc_DA9D
                clra

loc_DA9D:                               ; sub_DA71+27↑j
                anda    <Counter_MainLoop
                bne     locret_DAB7
                ldaa    <BatVoltsDiagCounter
                inca
                beq     loc_DAA8
                staa    <BatVoltsDiagCounter

loc_DAA8:                               ; sub_DA71+33↑j
                brset   <BitFlags2e 1 loc_DAB8
                cmpa    byte_89F0
                bcs     locret_DAB7
                clra
                staa    <BatVoltsDiagCounter
                bset    <BitFlags2e 1

locret_DAB7:                            ; sub_DA71+2E↑j sub_DA71+3E↑j ...
                rts
; ---------------------------------------------------------------------------

loc_DAB8:                               ; sub_DA71:loc_DAA8↑j
                brset   <BitFlags21 $10 loc_DAC8
                cmpa    byte_89F1
                bcs     locret_DAB7
                clra
                staa    <BatVoltsDiagCounter
                bset    <BitFlags21 $10
                rts
; ---------------------------------------------------------------------------

loc_DAC8:                               ; sub_DA71:loc_DAB8↑j
                cmpa    byte_89F3
                bcs     locret_DAB7
                clra
                staa    <BatVoltsDiagCounter
                bclr    <BitFlags21 $10
                ldd     #$058A
                jsr     ThrowNonCriticalError
                bcc     locret_DAB7
                bset    <b5d_IPL2 8
                bclr    <BitFlags2e 1
                bclr    <BitFlags21 $30
                rts
; ---------------------------------------------------------------------------

loc_DAE5:                               ; sub_DA71↑j sub_DA71+8↑j ...
                clra
                staa    <BatVoltsDiagCounter
                bclr    <BitFlags2e 1
                bclr    <BitFlags21 $30
                rts
; End of function sub_DA71


; =============== S U B R O U T I N E =======================================


sub_DAEF:                               ; sub_C8AF↑P
                ldy     #LDXi_6485
                brset   <DRBSerialMode $80 loc_DB60
                brclr   <DRBSerialMode $40 loc_DB60
                ldaa    BAUD_SerialBaudRate
 IF ECLOCK == 4
                cmpa    #$26
 ENDIF
 IF ECLOCK == 3
                cmpa    #$16
 ENDIF
 IF ECLOCK == 2
                cmpa    #$25                 ; %00100101/$25 976 BAUD 8mhz crystal
                                             ; %00010110/$16 976 BAUD 12mhz crystal
                                             ; %00100110/$26 976 BAUD 16mhz crystal
 ENDIF
                bne     locret_DB5F
                ldab    SCDR_SerialData
                ldaa    SCSR_SerialStatus
                bita    #$20
                beq     loc_DB64
                bita    #$E
                bne     loc_DB5B
                brset   0,y $E0 loc_DB80
                ldaa    #$F8
                brset   0,y $80 loc_DB32
                deca
                brset   0,y $60 loc_DB32
                ldaa    #$F5
                brset   0,y $40 loc_DB32
                ldaa    #$F3
                brset   0,y $20 loc_DB32
                ldaa    #$14

loc_DB32:                               ; sub_DAEF+28↑j sub_DAEF+2E↑j ...
                cba
                bne     loc_DB60
                ldaa    LDXi_6485
                adda    #$20
                staa    LDXi_6485
                anda    #$E0
                cmpa    #$A0
                bne     loc_DB5B
                ldaa    #$E0
                staa    LDXi_6485
                ldaa    #$52
                staa    <DRBPointer1
                ldd     SCSR_SerialStatus
                ldaa    #$F8
                ldab    SCSR_SerialStatus
                staa    SCDR_SerialData
                bra     loc_DB5B
; ---------------------------------------------------------------------------

loc_DB59:                               ; sub_DAEF+86↓j
                staa    <DRBPointer1

loc_DB5B:                               ; sub_DAEF+1F↑j sub_DAEF+52↑j ...
                ldd     SCSR_SerialStatus
                pulx

locret_DB5F:                            ; sub_DAEF+11↑j
                rts
; ---------------------------------------------------------------------------

loc_DB60:                               ; sub_DAEF+4↑j sub_DAEF+8↑j ...
                clr     LDXi_6485
                rts
; ---------------------------------------------------------------------------

loc_DB64:                               ; sub_DAEF+1B↑j
                brset   0,y $E0 loc_DB70
                brclr   0,y $E0 loc_DB60
                bra     loc_DB5B
; ---------------------------------------------------------------------------

loc_DB70:                               ; sub_DAEF:loc_DB64↑j
                ldaa    <DRBPointer1
                deca
                cmpa    #$20
                bne     loc_DB59
                clra
                staa    <DRBPointer1
                staa    <DRBPointer2
                staa    <DRBSerialMode
                bra     loc_DB5B
; ---------------------------------------------------------------------------

loc_DB80:                               ; sub_DAEF+21↑j
                ldaa    #$28
                staa    <DRBPointer1
                brset   0,y 8 loc_DBCE
                brset   0,y $10 loc_DB96
                bset    0,y $10
                stab    <DRBPointer2
                bra     loc_DB5B
; ---------------------------------------------------------------------------

loc_DB96:                               ; sub_DAEF+9A↑j
                cmpb    <DRBPointer2
                bne     loc_DBBF
                bclr    0,y $10
                tba
                ldab    LDXi_6485
                andb    #7
                cmpb    #4
                beq     loc_DBB4
                ldx     #UNe_6481
                abx
                staa    0,x
                inc     LDXi_6485
                jmp     loc_DB5B
; ---------------------------------------------------------------------------

loc_DBB4:                               ; sub_DAEF+B7↑j
                cmpa    #$12
                bne     loc_DBBC
                bclr    0,y 7

loc_DBBC:                               ; sub_DAEF+C7↑j sub_DAEF+F3↓j
                jmp     loc_DB5B
; ---------------------------------------------------------------------------

loc_DBBF:                               ; sub_DAEF+A9↑j
                bset    0,y 8
                cmpb    #$12
                bne     loc_DBD2

loc_DBC7:                               ; sub_DAEF:loc_DBD9↓j
                bset    0,y $10
                jmp     loc_DB5B
; ---------------------------------------------------------------------------

loc_DBCE:                               ; sub_DAEF+95↑j
                cmpb    #$12
                beq     loc_DBD9

loc_DBD2:                               ; sub_DAEF+D6↑j
                bclr    0,y $10
                jmp     loc_DB5B
; ---------------------------------------------------------------------------

loc_DBD9:                               ; sub_DAEF+E1↑j
                brclr   0,y $10 loc_DBC7
                bclr    0,y $1F
                bra     loc_DBBC
; End of function sub_DAEF


; =============== S U B R O U T I N E =======================================


sub_DBE4:                               ; sub_C8AF+3↑P

; FUNCTION CHUNK AT DC7D SIZE 00000092 BYTES
; FUNCTION CHUNK AT DD2C SIZE 00000075 BYTES

                brset   <DRBSerialMode $40 loc_DBEC
                rts
; ---------------------------------------------------------------------------

loc_DBE9:                               ; sub_DBE4:loc_DBEC↓j
                jmp     loc_DD9C
; ---------------------------------------------------------------------------

loc_DBEC:                               ; sub_DBE4↑j
                brset   <DRBSerialMode $70 loc_DBE9
                ldab    SCDR_SerialData
                ldaa    SCSR_SerialStatus
                bita    #$20
                bne     loc_DBFB
                rts
; ---------------------------------------------------------------------------

loc_DBFB:                               ; sub_DBE4+14↑j
                ldx     #FDRVar0
                ldaa    0,x
                bita    #3
                beq     loc_DC07
                jmp     loc_DC69
; ---------------------------------------------------------------------------

loc_DC07:                               ; sub_DBE4+1E↑j
                cmpb    #$F8
                bcc     loc_DC12

loc_DC0B:                               ; sub_DBE4+33↓j sub_DBE4+40↓j ...
                jsr     sub_DDCA
                jsr     sub_DDA1
                rts
; ---------------------------------------------------------------------------

loc_DC12:                               ; sub_DBE4+25↑j
                tsta
                bne     loc_DC1E
                cmpb    #$F8
                bne     loc_DC0B
                ldaa    #$80
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DC1E:                               ; sub_DBE4+2F↑j
                cmpa    #$80
                bne     loc_DC2B
                cmpb    #$F9
                bne     loc_DC0B
                ldaa    #$C0
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DC2B:                               ; sub_DBE4+3C↑j
                cmpa    #$C0
                bne     loc_DC38
                cmpb    #$FB
                bne     loc_DC0B
                ldaa    #$E0
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DC38:                               ; sub_DBE4+49↑j
                cmpa    #$E0
                bne     loc_DC0B
                cmpb    #$F8
                bne     loc_DC45
                ldaa    #2
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DC45:                               ; sub_DBE4+5A↑j
                cmpb    #$F9
                bne     loc_DC4E
                ldaa    #1
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DC4E:                               ; sub_DBE4+63↑j
                cmpb    #$FB
                bne     loc_DC0B
                ldy     <EngineRpm_HB
                cpy     #$100
                bhi     loc_DC60
                ldaa    #$05
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DC60:                               ; sub_DBE4+75↑j
                ldd     #$0017
                jsr     sub_DDA1
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DC69:                               ; sub_DBE4+20↑J
                bita    #$01
                beq     loc_DC70
                jmp     loc_DC7D
; ---------------------------------------------------------------------------

loc_DC70:                               ; sub_DBE4+87↑j
                jmp     loc_DD2C
; End of function sub_DBE4


; =============== S U B R O U T I N E =======================================


sub_DC73:                               ; sub_DBE4:loc_DD9C↓P
                ldaa    SCSR_SerialStatus
                ldaa    SCDR_SerialData
                stab    SCDR_SerialData
                rts
; End of function sub_DC73

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_DBE4

loc_DC7D:                               ; sub_DBE4+89↑J
                asla
                bcs     loc_DCD4
                asla
                bcs     loc_DCA5
                asla
                bcs     loc_DC9A
                asla
                bcs     loc_DC90
                stab    STe_648A
                ldaa    #$10
                bra     loc_DCCF
; ---------------------------------------------------------------------------

loc_DC90:                               ; sub_DBE4+A3↑j
                stab    FDRVar3
                jsr     sub_DDA7
                ldaa    #$20
                bra     loc_DCCF
; ---------------------------------------------------------------------------

loc_DC9A:                               ; sub_DBE4+A0↑j
                ldy     FDRVar3
                ldab    0,y
                ldaa    #$40
                bra     loc_DCCF
; ---------------------------------------------------------------------------

loc_DCA5:                               ; sub_DBE4+9D↑j
                cmpb    #$FE
                beq     loc_DCB6

loc_DCA9:                               ; sub_DBE4+17A↓J
                jsr     sub_DDA1
                cmpb    #$1B
                bne     loc_DCB3
                bset    <DRBSerialMode $40

loc_DCB3:                               ; sub_DBE4+CA↑j
                jmp     loc_DD9C
; ---------------------------------------------------------------------------

loc_DCB6:                               ; sub_DBE4+C3↑j
                ldaa    0,x
                bita    #4
                beq     loc_DCCD
                ldy     <EngineRpm_HB
                cpy     #$100
                bcs     loc_DCCD
                ldab    #$17
                jsr     sub_DDA1
                jmp     loc_DD9C
; ---------------------------------------------------------------------------

loc_DCCD:                               ; sub_DBE4+D6↑j sub_DBE4+DF↑j
                ldaa    #$80

loc_DCCF:                               ; sub_DBE4+AA↑j sub_DBE4+B4↑j ...
                oraa    0,x
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DCD4:                               ; sub_DBE4+9A↑j
                sei
                ldy     FDRVar3
                cpy     #XIRQ
                bcc     loc_DCEC
                stab    0,y

loc_DCE2:                               ; sub_DBE4+129↓j
                ldab    0,y
                jsr     sub_DDA1
                cli
                jmp     loc_DD9C
; ---------------------------------------------------------------------------

loc_DCEC:                               ; sub_DBE4+F9↑j
                ldx     #UNk_64D0
                ldy     #loc_DD0F

loc_DCF3:                               ; sub_DBE4+11B↓j
                ldaa    0,y
                staa    0,x
                inx
                iny
                cpy     #loc_DD2C
                bne     loc_DCF3
                ldx     #UNk_64D0
                ldy     FDRVar3
                jsr     0,x
                ldx     #FDRVar0
                bra     loc_DCE2
; END OF FUNCTION CHUNK FOR sub_DBE4
; ---------------------------------------------------------------------------

loc_DD0F:                               ; sub_DBE4+10B↑o
                ldaa    #$AA
                staa    loc_D555
                lsra
                staa    loc_AAA9+1
                ldaa    #$A0
                staa    loc_D555
                stab    0,y
                ldx     #Ram_00

loc_DD23:                               ; RESERVED:DD29↓j
                cmpb    0,y
                beq     locret_DD2B
                dex
                bne     loc_DD23

locret_DD2B:                            ; RESERVED:DD26↑j
                rts
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_DBE4

loc_DD2C:                               ; sub_DBE4:loc_DC70↑J
                                        ; sub_DBE4+117↑o
                asla
                bcs     loc_DD68
                asla
                bcs     loc_DD5A
                asla
                bcs     loc_DD50
                asla
                bcs     loc_DD49
                asla
                bcs     loc_DD42
                stab    FDRVar2
                ldaa    #8
                bra     loc_DD63
; ---------------------------------------------------------------------------

loc_DD42:                               ; sub_DBE4+155↑j
                stab    FDRVar1
                ldaa    #$10
                bra     loc_DD63
; ---------------------------------------------------------------------------

loc_DD49:                               ; sub_DBE4+152↑j
                stab    STe_648A
                ldaa    #$20
                bra     loc_DD63
; ---------------------------------------------------------------------------

loc_DD50:                               ; sub_DBE4+14F↑j
                stab    FDRVar3
                jsr     sub_DDA7
                ldaa    #$C0
                bra     loc_DD63
; ---------------------------------------------------------------------------

loc_DD5A:                               ; sub_DBE4+14C↑j
                cmpb    #$FD
                beq     loc_DD61
                jmp     loc_DCA9
; ---------------------------------------------------------------------------

loc_DD61:                               ; sub_DBE4+178↑j
                ldaa    #$80

loc_DD63:                               ; sub_DBE4+15C↑j
                                        ; sub_DBE4+163↑j ...
                oraa    0,x
                jmp     loc_DD9A
; ---------------------------------------------------------------------------

loc_DD68:                               ; sub_DBE4+149↑j
                ldx     FDRVar3
                ldy     FDRVar1
                ldab    SCDR_SerialData
                ldaa    0,x
                staa    SCDR_SerialData
                inx
                dey
                bne     loc_DD84
                ldx     #FDRVar0
                jsr     sub_DDA1
                pulx
                rts
; ---------------------------------------------------------------------------

loc_DD84:                               ; sub_DBE4+196↑j
                stx     FDRVar3
                sty     FDRVar1
                cba
                bne     loc_DD90
                pulx
                rts
; ---------------------------------------------------------------------------

loc_DD90:                               ; sub_DBE4+1A8↑j
                ldaa    FDRVar0
                anda    #$7F
                staa    FDRVar0
                pulx
                rts
; ---------------------------------------------------------------------------

loc_DD9A:                               ; sub_DBE4+37↑J sub_DBE4+44↑J ...
                staa    0,x

loc_DD9C:                               ; sub_DBE4:loc_DBE9↑J
                                        ; sub_DBE4:loc_DCB3↑J ...
                jsr     sub_DC73
                pulx
                rts
; END OF FUNCTION CHUNK FOR sub_DBE4

; =============== S U B R O U T I N E =======================================


sub_DDA1:                               ; sub_DBE4+2A↑P sub_DBE4+7F↑P ...
                clr     0,x
                bclr    <DRBSerialMode $40
                rts
; End of function sub_DDA1


; =============== S U B R O U T I N E =======================================


sub_DDA7:                               ; sub_DBE4+AF↑P sub_DBE4+16F↑P
                pshx
                ldx     FDRVar3
                cpx     #TL_IDENT1
                bcs     loc_DDBF
                cpx     #$FFFF
                bhi     loc_DDBF
                cpx     #$B600
                bcs     loc_DDC8
                cpx     #$B800
                bcc     loc_DDC8

loc_DDBF:                               ; sub_DDA7+7↑j sub_DDA7+C↑j
                pulx
                ldx     #FDRVar0
                jsr     sub_DDA1
                pulx
                rts
; ---------------------------------------------------------------------------

loc_DDC8:                               ; sub_DDA7+11↑j sub_DDA7+16↑j
                pulx
                rts
; End of function sub_DDA7


; =============== S U B R O U T I N E =======================================


sub_DDCA:                               ; sub_DBE4:loc_DC0B↑P
                cmpb    #$14
                beq     loc_DDCF
                rts
; ---------------------------------------------------------------------------

loc_DDCF:                               ; sub_DDCA+2↑j
                clr     FDRVar0
 IF ECLOCK == 4
                ldab    #$26
 ENDIF
 IF ECLOCK == 3
                ldab    #$16
 ENDIF
 IF ECLOCK == 2
                ldab    #$25                 ; %00100101/$25 976 BAUD 8mhz crystal
                                             ; %00010110/$16 976 BAUD 12mhz crystal
                                             ; %00100110/$26 976 BAUD 16mhz crystal
 ENDIF
                stab    BAUD_SerialBaudRate
                ldab    LDXi_6485
                addb    #$20
                stab    LDXi_6485
                bset    <DRBSerialMode $30
                ldd     SCSR_SerialStatus
                pulx
                rts
; End of function sub_DDCA


; =============== S U B R O U T I N E =======================================


sub_DDE7:                               ; sub_DEC8+5A↓P
                ldab    #$93
                ldaa    Temp0
                bne     loc_DDF0
                ldab    #$80

loc_DDF0:                               ; sub_DDE7+5↑j
                aba
                adda    Temp1
                adda    Temp2
                staa    Temp3
                tba
                ldab    #$40
                ldy     #HC11Reg
                ldx     #PiaAddr
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
 IF ECLOCK == 3
                ldab    #$20*ECLOCK
 ENDIF
loc_DE22:                               ; sub_DDE7+40↓j
                brclr   0,x 8 loc_DE2C
                decb
                bne     loc_DE22
                jmp     loc_DEC5
; ---------------------------------------------------------------------------

loc_DE2C:                               ; sub_DDE7:loc_DE22↑j
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp0
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp1

loc_DE42:                               ; sub_DDE7+60↓j
                brclr   0,x 8 loc_DE4C
                decb
                bne     loc_DE42
                jmp     loc_DEC5
; ---------------------------------------------------------------------------

loc_DE4C:                               ; sub_DDE7:loc_DE42↑j
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp1
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp2

loc_DE62:                               ; sub_DDE7+80↓j
                brclr   0,x 8 loc_DE6C
                decb
                bne     loc_DE62
                jmp     loc_DEC5
; ---------------------------------------------------------------------------

loc_DE6C:                               ; sub_DDE7:loc_DE62↑j
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp2
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp3

loc_DE82:                               ; sub_DDE7+A0↓j
                brclr   0,x 8 loc_DE8B
                decb
                bne     loc_DE82
                bra     loc_DEC5
; ---------------------------------------------------------------------------

loc_DE8B:                               ; sub_DDE7:loc_DE82↑j
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x 8
                bclr    2,x 8
                nop

loc_DE95:                               ; sub_DDE7+B4↓j
                brset   $29,y $80 loc_DE9F
                decb
                bne     loc_DE95
                bra     loc_DEC5
; ---------------------------------------------------------------------------

loc_DE9F:                               ; sub_DDE7:loc_DE95↑j
                ldaa    SPDR_SerialPeripheralDataIO
                bset    8,y $20
                cli
                suba    Temp0
                suba    Temp1
                suba    Temp2
                bne     locret_DEC7
                ldaa    Temp0
                anda    #$F
                cmpa    #1
                bne     locret_DEC7
                bset    <CCDFlags5 $40
                brset   <CCDFlags6 $80 locret_DEC7
                bset    <Counter_SpeedSensorInterrupt_HB_X $10

loc_DEC5:                               ; sub_DDE7+42↑J sub_DDE7+62↑J ...
                cli
                nop

locret_DEC7:                            ; sub_DDE7+C9↑j sub_DDE7+D2↑j ...
                rts
; End of function sub_DDE7


; =============== S U B R O U T I N E =======================================


sub_DEC8:                               ; __RESET+5AF↑P

; FUNCTION CHUNK AT DFFD SIZE 00000014 BYTES

                ldab    <Counter_MainLoop
                andb    #$F
                bne     loc_DF0B
                brset   <Counter_SpeedSensorInterrupt_HB_X 8 loc_DEF2
                ldaa    <KeyOnOrEngineRunningTime
                cmpa    #$83
                bcs     loc_DF08
                ldaa    <EngineRpm_HB
                cmpa    #$2F
                bcs     loc_DF08
                ldaa    <BatteryVolts
                cmpa    #$BD
                bcc     loc_DF08
                ldab    <CCDFlags4_BodyCompFlags4_X
                incb
                stab    <CCDFlags4_BodyCompFlags4_X
                cmpb    #$71
                bcs     loc_DF0B
                bset    <Counter_SpeedSensorInterrupt_HB_X 8
                bra     loc_DF08
; ---------------------------------------------------------------------------

loc_DEF2:                               ; sub_DEC8+6↑j
                ldaa    <TargetBatteryVolts
                suba    <BatteryVolts
                bcs     loc_DEFC
                cmpa    #1
                bhi     loc_DF08

loc_DEFC:                               ; sub_DEC8+2E↑j
                ldab    <CCDFlags4_BodyCompFlags4_X
                incb
                stab    <CCDFlags4_BodyCompFlags4_X
                cmpb    #$22
                bcs     loc_DF0B
                bclr    <Counter_SpeedSensorInterrupt_HB_X 8

loc_DF08:                               ; sub_DEC8+E↑j sub_DEC8+14↑j ...
                clra
                staa    <CCDFlags4_BodyCompFlags4_X

loc_DF0B:                               ; sub_DEC8+4↑j sub_DEC8+23↑j ...
                brset   <Counter_MainLoop 1 loc_DF25
                ldx     #off_E15B
                ldab    <CCDTemp_HB
                lsld
                addb    #2
                abx
                lsrd
                stab    <CCDTemp_HB
                ldx     0,x
                jsr     0,x
                std     Temp1
                jsr     sub_DDE7

loc_DF25:                               ; sub_DEC8:loc_DF0B↑j
                ldaa    CountdownTimerFromKeyOn
                bne     locret_DF32
                ldaa    TL_CCDConfigConstant2
                beq     loc_DF33
                bclr    <CCDFlags5 $20

locret_DF32:                            ; sub_DEC8+60↑j
                rts
; ---------------------------------------------------------------------------

loc_DF33:                               ; sub_DEC8+65↑j
                ldaa    PPROG_EEPROMControlReg
                bita    #2
                bne     loc_DF47
                bclr    <Counter_SpeedSensorInterrupt_HB_X $20
                ldaa    $B612
                bita    #1
                beq     loc_DF47
                bset    <Counter_SpeedSensorInterrupt_HB_X $20

loc_DF47:                               ; sub_DEC8+70↑j sub_DEC8+7A↑j
                ldaa    <Counter_MainLoop
                bita    #3
                bne     loc_DFAC
                brclr   <CCDFlags5 $40 loc_DF6F
                bset    <CCDFlags5 $80
                bclr    <CCDFlags5 $60
                bclr    <CCDFlags6 $7F
                brset   <CCDFlags6 $80 loc_DFAC
                ldaa    <BitFlags6a_t3
                bita    #$60
                bne     loc_DFAC
                ldaa    $B612
                bita    #2
                beq     loc_DFAC
                anda    #$FD
                bra     loc_DF98
; ---------------------------------------------------------------------------

loc_DF6F:                               ; sub_DEC8+85↑j
                ldaa    <CCDFlags6
                anda    #$7F
                brclr   <CCDFlags5 $80 loc_DF7D
                cmpa    #$71
                bcc     loc_DF86
                bra     loc_DF81
; ---------------------------------------------------------------------------

loc_DF7D:                               ; sub_DEC8+AB↑j
                cmpa    #$2D
                bcc     loc_DFAC

loc_DF81:                               ; sub_DEC8+B3↑j
                inc     CCDFlags6
                bra     loc_DFAC
; ---------------------------------------------------------------------------

loc_DF86:                               ; sub_DEC8+B1↑j
                ldaa    <BitFlags6a_t3
                bita    #$60
                bne     loc_DFAC
                ldaa    $B612
                bita    #2
                bne     loc_DFAC
                bset    <CCDFlags6 $80
                oraa    #2

loc_DF98:                               ; sub_DEC8+A5↑j
                sei
                brclr   <BitFlags6a_t3 $40 loc_DFA0
                cli
                bra     loc_DFAC
; ---------------------------------------------------------------------------

loc_DFA0:                               ; sub_DEC8+D1↑j
                bset    <BitFlags6a_t3 $40
                cli
                staa    DRBOffsetStored_LB
                ldaa    #$12
                staa    DRBOffsetStored_HB

loc_DFAC:                               ; sub_DEC8+83↑j sub_DEC8+92↑j ...
                brclr   <CCDFlags5 $10 loc_DFC0
                brset   <CCDFlags5 $80 locret_DFBF
                ldaa    <CCDFlags6
                anda    #$7F
                cmpa    #$2D
                bcs     locret_DFBF
                bset    <CCDFlags5 $20

locret_DFBF:                            ; sub_DEC8+E8↑j sub_DEC8+F2↑j
                rts
; ---------------------------------------------------------------------------

loc_DFC0:                               ; sub_DEC8:loc_DFAC↑j
                brset   <CCDFlags5 $10 locret_E010
                brclr   <IPL1 $40 locret_E010
                ldaa    <BitFlags6a_t3
                bita    #$60
                bne     locret_E010
                ldaa    $B612
                bita    #1
                bne     loc_DFDB
                bita    #2
                bne     loc_E00A
                bra     loc_E00D
; ---------------------------------------------------------------------------

loc_DFDB:                               ; sub_DEC8+10B↑j
                brset   <CCDFlags5 $80 loc_DFE9
                ldaa    <CCDFlags6
                anda    #$7F
                cmpa    #$2D
                bcs     locret_E010
                bra     loc_E007
; ---------------------------------------------------------------------------

loc_DFE9:                               ; sub_DEC8:loc_DFDB↑j
                sei
                brclr   <BitFlags6a_t3 $40 loc_DFF1
                cli
                bra     locret_E010
; ---------------------------------------------------------------------------

loc_DFF1:                               ; sub_DEC8+122↑j
                bset    <BitFlags6a_t3 $40
                cli
                adda    #4
                cmpa    #$4C
                bcs     loc_DFFD
                anda    #$FE
loc_DFFD:                               ; sub_DEC8+131↑j
                anda    #$FD
                staa    DRBOffsetStored_LB
                ldaa    #$12
                staa    DRBOffsetStored_HB

loc_E007:                               ; sub_DEC8+11F↑j
                bset    <Counter_SpeedSensorInterrupt_HB_X $20

loc_E00A:                               ; sub_DEC8+10F↑j
                bset    <CCDFlags5 $80

loc_E00D:                               ; sub_DEC8+111↑j
                bset    <CCDFlags5 $10

locret_E010:                            ; sub_DEC8:loc_DFC0↑j
                                        ; sub_DEC8+FC↑j ...
                rts

loc_E011:                               ; ROM:E091↓J ROM:loc_E0FD↓J
                                        ; ...
                clra
                clrb
                staa    Temp0
                rts
; ---------------------------------------------------------------------------

loc_E017:                               ; ROM:off_E15B↓o ROM:E163↓o ...
                ldaa    #$E4
                staa    Temp0
                ldaa    <EngineRpm_HB
                ldab    <MapValue
                rts
; ---------------------------------------------------------------------------

loc_E021:                               ; ROM:E15D↓o ROM:E17D↓o ...
                ldaa    #$84
                staa    Temp0
                sei
                ldaa    <CCDFuelOutput_HB
                ldab    <CCDFuelOutput_LB
                clr     CCDFuelOutput_HB
                clr     CCDFuelOutput_LB
                cli
                rts
; ---------------------------------------------------------------------------

loc_E033:                               ; ROM:E245↓o
                ldaa    #$AC
                staa    Temp0
                ldd     byte_8012
                rts
; ---------------------------------------------------------------------------

loc_E03C:                               ; ROM:E1A5↓o ROM:E225↓o
                ldaa    #$8C
                staa    Temp0
                ldaa    <CoolantTemp
                ldab    <AmbientAirTempVolts2
                rts
; ---------------------------------------------------------------------------

loc_E046:                               ; ROM:E165↓o ROM:E1E5↓o
                ldaa    #$D4
                staa    Temp0
                ldaa    <BatteryVolts
                bsr     sub_E05A
                stab    Temp3
                ldaa    <TargetBatteryVolts
                bsr     sub_E05A
                ldaa    Temp3
                rts

; =============== S U B R O U T I N E =======================================


sub_E05A:                               ; ROM:E04D↑p ROM:E054↑p
                ldab    <BodyComputerBatteryVoltsOutput
                cmpb    #$10
                bhi     loc_E075
                comb
                addb    #9
                bcs     loc_E06A
                mul
                adca    #0
                bra     loc_E075
; ---------------------------------------------------------------------------

loc_E06A:                               ; sub_E05A+9↑j
                staa    Temp4
                mul
                adca    Temp4
                bcc     loc_E075
                ldaa    #$FF

loc_E075:                               ; sub_E05A+4↑j sub_E05A+E↑j ...
                tab
                rts
; End of function sub_E05A

; ---------------------------------------------------------------------------

loc_E077:                               ; ROM:E175↓o ROM:E195↓o ...
                ldaa    #$42
                staa    Temp0
                ldaa    <TpsVolts
                suba    <LowestSessionTpsVolts
                bcc     loc_E083
                clra

loc_E083:                               ; ROM:E080↑j
                clrb
                rts
; ---------------------------------------------------------------------------

loc_E085:                               ; ROM:E1C5↓o
                ldaa    #$CC
                staa    Temp0
                ldaa    PPROG_EEPROMControlReg
                bita    #2
                beq     loc_E094
                jmp     loc_E011
; ---------------------------------------------------------------------------

loc_E094:                               ; ROM:E08F↑j
                ldd     $B600
                lsld
                lsld
                staa    Temp3
                ldd     <TargetIdleSpeedHB
                lsld
                lsld
                tab
                ldaa    Temp3
                rts
; ---------------------------------------------------------------------------

loc_E0A5:                               ; ROM:E185↓o
                ldaa    #$54
                staa    Temp0
                ldaa    <BaroPressure
                clrb
                rts
; ---------------------------------------------------------------------------

loc_E0AE:                               ; ROM:E16D↓o ROM:E18D↓o ...
                ldaa    #$24
                staa    Temp0
                ldd     <VehicleSpeed_HB
                lsld
                lsld
                staa    Temp3
                lsld
                bcc     loc_E0BF
                ldaa    #$FF

loc_E0BF:                               ; ROM:E0BB↑j
                ldab    #$34
                mul
                lsld
                lsld
                aslb
                adca    #0
                tab
                ldaa    Temp3
                rts
; ---------------------------------------------------------------------------

loc_E0CC:                               ; ROM:E205↓o
                ldaa    PPROG_EEPROMControlReg
                bita    #2
                bne     loc_E0FD
                ldx     #$B672
                ldab    <Counter_SpeedSensorInterrupt_HB_X
                tba
                incb
                andb    #7
                anda    #$F8
                cmpb    #6
                bne     loc_E0E3
                clrb

loc_E0E3:                               ; ROM:E0E0↑j
                aba
                staa    <Counter_SpeedSensorInterrupt_HB_X
                aslb
                aslb
                abx
                brset   0,x $FF loc_E0FD
                ldaa    0,x
                staa    Temp0
                adda    1,x
                adda    2,x
                cmpa    3,x
                bne     loc_E0FD
                ldd     1,x
                rts
; ---------------------------------------------------------------------------

loc_E0FD:                               ; ROM:E0D1↑j ROM:E0E9↑j ...
                jmp     loc_E011
; ---------------------------------------------------------------------------

loc_E100:                               ; ROM:E1DF↓o
                ldaa    #$EC
                staa    Temp0
                clra
                brclr   <b5C_IPL1_t3 2 loc_E10C
                oraa    #1

loc_E10C:                               ; ROM:E106↑j
                brclr   <b5C_IPL1_t3 $40 loc_E112
                oraa    #2

loc_E112:                               ; ROM:loc_E10C↑j
                brclr   <Counter_SpeedSensorInterrupt_HB_X 8 loc_E118
                oraa    #4

loc_E118:                               ; ROM:loc_E112↑j
                brclr   <b5C_IPL1_t3 $20 loc_E11E
                oraa    #8

loc_E11E:                               ; ROM:loc_E118↑j
                clrb
                brclr   <Counter_SpeedSensorInterrupt_HB_X $10 loc_E128
                bclr    <Counter_SpeedSensorInterrupt_HB_X $10
                orab    #1

loc_E128:                               ; ROM:E11F↑j
                brclr   <Counter_SpeedSensorInterrupt_HB_X $20 locret_E12E
                orab    #2

locret_E12E:                            ; ROM:loc_E128↑j
                rts
; ---------------------------------------------------------------------------

loc_E12F:                               ; ROM:E16F↓o ROM:E18F↓o ...
                ldaa    #$A4
                staa    Temp0
                clra
                brset   <CruiseStatus_1 $80 loc_E13B
                oraa    #1

loc_E13B:                               ; ROM:E135↑j
                ldab    <TpsVolts
                subb    <LowestSessionTpsVolts
                bcs     loc_E147
                cmpb    #5
                bcs     loc_E147
                oraa    #2

loc_E147:                               ; ROM:E13F↑j ROM:E143↑j
                brclr   <StartupSwitchMirror1 $20 loc_E14D
                oraa    #4

loc_E14D:                               ; ROM:loc_E147↑j
                brclr   <PIA2_Buffer_t3 1 loc_E153
                oraa    #8

loc_E153:                               ; ROM:loc_E14D↑j
                brset   <PIA1_Buffer_t3 $40 loc_E159
                oraa    #$20

loc_E159:                               ; ROM:loc_E153↑j
                clrb
                rts
; ---------------------------------------------------------------------------
off_E15B:       fdb loc_E017            ; sub_DEC8+47↑o
                fdb loc_E021
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E046
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E021
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0A5
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E021
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E03C
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E021
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E085
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E021
                fdb loc_E100
                fdb loc_E011
                fdb loc_E017
                fdb loc_E046
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E021
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0CC
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E021
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E03C
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E021
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E033
                fdb loc_E011
                fdb loc_E011
                fdb loc_E017
                fdb loc_E0AE
                fdb loc_E12F
                fdb loc_E011
                fdb loc_E017
                fdb loc_E077
                fdb loc_E011
                fdb loc_E011
gb_AISTEP_BitPatternForAisControl:fcb 6 ; __RESET+3E7↑o
                                        ; sub_E832:loc_E965↓o
                fcb 5
                fcb 9
                fcb $A
TL_TempForColdScaleFromA2D:fcb 7        ; __RESET+34A↑o __RESET+37A↑o ...
                fcb 0, $D3, $FF, $85
                fcb $53, $AB, $FF, $9D
                fcb $D7, $78, $FF, $55
                fcb $E6, $6E, $FF, $17
                fcb $F1, $64, $FE, $CD
                fcb $F6, $5E, $FD, $AB
                fcb $FF, $49
TL_TempForHotScaleA2D:fcb 4             ; __RESET+343↑o __RESET+373↑o ...
                fcb $42, $FF, $FF, $55
                fcb $57, $F1, $FF, $75
                fcb $C5, $B5, $FF, $4F
                fcb $FF, $8D
TL_ScaleCoolantTemp:fcb 9               ; __RESET+367↑o sub_B800+81↑o
                fcb $58, 0, 1, $86
                fcb $6D, $20, 1, $86
                fcb $82, $40, 1, $86
                fcb $97, $60, 1, $86
                fcb $AC, $80, 1, $86
                fcb $C1, $A0, 1, $86
                fcb $D6, $C0, 1, $86
                fcb $EB, $E0, 1, $8C
                fcb $FF, $FF
                fcb 3
                fcb $2F, $99, $FF, $AF
                fcb $CC, $67, $FF, $7C
                fcb $E9, $58
                fcb 5
                fcb $15, $FF, $FE, 0
                fcb $1B, $F3, $FE, $F3
                fcb $2E, $DF, $FF, $4A
                fcb $4A, $CB, $FF, $91
                fcb $C8, $94
TL_ScaleChargeTemp:fcb 9                ; __RESET+397↑o sub_B88A+81↑o
                fcb $58, 0, 1, $99
                fcb $6C, $20, 1, $99
                fcb $80, $40, 1, $99
                fcb $94, $60, 1, $99
                fcb $A8, $80, 1, $99
                fcb $BC, $A0, 1, $99
                fcb $D0, $C0, 1, $99
                fcb $E4, $E0, 1, $8C
                fcb $F8, $FF
TL_TempForScaleAmbientA2D:fcb 6         ; __RESET+18C↑o sub_BC48+2A↑o
                fcb 5, $FF, $FC, $C0
                fcb $15, $CB, $FE, $F8
                fcb $32, $AD, $FF, $83
                fcb $6F, $8F, $FF, $96
                fcb $C8, $6C, $FF, $56
                fcb $E7, $58
byte_E304:      fcb 5                   ; DetermineTargetBatteryVoltage+2↑o
                fcb $79, $ED, $FF, $E4
                fcb $82, $EC, $FF, $95
                fcb $95, $E4, $FF, $A4
                fcb $AE, $DB, $FF, $8F
                fcb $B7, $D7
byte_E317:      fcb 5                   ; CalculateVariousFactors2+80↑o
                fcb $51, $2E, $FF, $97
                fcb $82, $1A, $FF, $C0
                fcb $A2, $12, $FF, $CD
                fcb $CA, $A, $FF, $F1
                fcb $FF, 7
; ---------------------------------------------------------------------------

ScaleYbyA:                              ; sub_C5BA+2A↑P sub_C5F1+A9↑P ...
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

; =============== S U B R O U T I N E =======================================


ScaleXbyB_somethingelse:                ; sub_C5F1+D2↑P ROM:F177↓P
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
                bcs     loc_E364
                std     Temp6
                ldab    0,x
                pula
                mul
                tsta
                bne     loc_E365
                addb    Temp6
                bcc     loc_E36A
                bra     loc_E365
; ---------------------------------------------------------------------------

loc_E364:                               ; ScaleXbyB_somethingelse+13↑j
                pula

loc_E365:                               ; ScaleXbyB_somethingelse+1D↑j
                                        ; ScaleXbyB_somethingelse+24↑j
                ldab    #$FF
                stab    Temp7

loc_E36A:                               ; ScaleXbyB_somethingelse+22↑j
                tba
                ldab    Temp7
                std     Temp6
                rts
; End of function ScaleXbyB_somethingelse


; =============== S U B R O U T I N E =======================================


Lookup4ByteTable:                       ; __RESET+18F↑P
                                        ; __RESET:FilterAndStoreCoolantTemp↑P ...
                ldy     #0000
                ldab    0,x
                aby
                inx
                ldab    #$04
                cmpa    0,x
                bhi     loc_E386

loc_E381:                               ; Lookup4ByteTable+16↓j
                ldaa    1,x
                tab
                bra     loc_E3A7
; ---------------------------------------------------------------------------

loc_E386:                               ; Lookup4ByteTable+D↑j
                                        ; Lookup4ByteTable+1D↓j
                dey
                beq     loc_E381
                cmpa    4,x
                bcs     loc_E391
                abx
                bra     loc_E386
; ---------------------------------------------------------------------------

loc_E391:                               ; Lookup4ByteTable+1A↑j
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

loc_E3A7:                               ; Lookup4ByteTable+12↑j
                psha
                pula
                rts
; End of function Lookup4ByteTable


; =============== S U B R O U T I N E =======================================


sub_E3AA:                               ; sub_A130+B2↑P
                                        ; sub_A2B6:loc_A3B8↑P ...
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
                bcs     loc_E3BD
                mul
                nega
                bra     loc_E3BF
; ---------------------------------------------------------------------------

loc_E3BD:                               ; sub_E3AA+D↑j
                negb
                mul

loc_E3BF:                               ; sub_E3AA+11↑j
                adda    0,x
                tab
                pshb
                pulb
                pula
                rts
                rts

; =============== S U B R O U T I N E =======================================


sub_E3C7:                               ; sub_BB9B+1↑P ROM:loc_F0D8↓P
                ldy     #$0036
                ldd     byte_8072
                ldx     byte_8074
                brclr   <TimerOverflowsBetweenCamPulses $FF loc_E3DD
                dey
                ldd     byte_8076
                ldx     byte_8078

loc_E3DD:                               ; sub_A706+3A7↑P sub_E3C7+A↑j
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
                bcc     loc_E3F4
                ldd     #$FFFF

loc_E3F4:                               ; sub_E3C7+28↑j
                std     Temp6
                rts
; End of function sub_E3C7


; =============== S U B R O U T I N E =======================================


sub_E3F8:                               ; __RESET+22C↑P
                                        ; sub_C5F1:loc_C629↑P ...
                ldab    TL_ScaleMAPVoltsToPresMultiplyConst
                beq     loc_E3FE
                mul

loc_E3FE:                               ; sub_E3F8+3↑j
                addd    TL_ScaleMAPVoltsToPresAddConst
                bcc     locret_E405
                ldaa    #$FF

locret_E405:                            ; sub_E3F8+9↑j
                rts
; End of function sub_E3F8


; =============== S U B R O U T I N E =======================================


sub_E406:                               ; sub_C5BA+C↑P sub_C5BA+16↑P ...
                psha
                tba
                ldy     0,x
                jsr     ScaleYbyA
                pula
                tsta
                xgdy
                beq     loc_E41B
                addd    0,x
                bcc     loc_E41B
                ldd     #$FFFF

loc_E41B:                               ; sub_E406+C↑j sub_E406+10↑j
                psha
                pshb
                pulb
                pula
                rts
; End of function sub_E406


; =============== S U B R O U T I N E =======================================


DetermineNumberOfOverflowsBetweenSensorPulses_MM: ; __RESET+47F↑P
                                        ; __RESET+4D8↑P ...
                subd    4,x
                staa    0,y
                ldaa    0,x
                lsrd
                eorb    0,y
                bpl     loc_E434
                ldaa    0,x
                inca
                beq     loc_E434
                staa    0,x

loc_E434:                               ; DetermineNumberOfOverflowsBetweenSensorPulses_MM+B↑j
                                        ; DetermineNumberOfOverflowsBetweenSensorPulses_MM+10↑j
                ldaa    0,x
                lsra
                cmpa    1,x
                bcs     locret_E43D
                staa    1,x

locret_E43D:                            ; DetermineNumberOfOverflowsBetweenSensorPulses_MM+19↑j
                rts
; End of function DetermineNumberOfOverflowsBetweenSensorPulses_MM


; =============== S U B R O U T I N E =======================================


sub_E43E:                               ; __RESET+576↑P ROM:F0DD↓P
                ldx     #TL_RPM3DInputModifierFromRPM
                ldd     <EngineRpm_HB
                aslb
                adca    #0
                jsr     Lookup4ByteTable
                staa    <EngineRPM_3D
                rts
; End of function sub_E43E


; =============== S U B R O U T I N E =======================================


sub_E44C:                               ; sub_BD17+21↑P sub_BD17+36↑P ...
                ldy     #loc_E4C1
                brclr   2,x $FF loc_E458
                ldy     #loc_E4BD

loc_E458:                               ; sub_E44C+4↑j
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
                beq     loc_E47F
                inx
                ldab    #$FF
                abx

loc_E47F:                               ; sub_E44C+2D↑j
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
; End of function sub_E44C

; ---------------------------------------------------------------------------

loc_E4BD:                               ; sub_E44C+8↑o
                blt     loc_E4C9
                bra     loc_E4C3
; ---------------------------------------------------------------------------

loc_E4C1:                               ; sub_E44C↑o
                bcs     loc_E4C9

loc_E4C3:                               ; ROM:E4BF↑j
                mul
                adca    #0
                nega
                bra     loc_E4CD
; ---------------------------------------------------------------------------

loc_E4C9:                               ; ROM:loc_E4BD↑j
                                        ; ROM:loc_E4C1↑j
                nega
                mul
                adca    #0

loc_E4CD:                               ; ROM:E4C7↑j
                adda    0,x
                rts

; =============== S U B R O U T I N E =======================================


sub_E4D0:                               ; sub_C2E6+40↑P sub_C2E6+4C↑P ...
                suba    0,y
                bcs     loc_E4DA
                ldab    1,x
                mul
                bra     loc_E4E2
; ---------------------------------------------------------------------------

loc_E4DA:                               ; sub_E4D0+3↑j
                nega
                ldab    0,x
                mul
                nega
                negb
                sbca    #0

loc_E4E2:                               ; sub_E4D0+8↑j
                addd    0,y
                std     0,y
                rts
; End of function sub_E4D0


; =============== S U B R O U T I N E =======================================


ResetCopTimer2:                         ; __RESET:MainProgramLoop↑P
                sei
                ldaa    SwitchPortAccessReg1
                eora    #2
                staa    SwitchPortAccessReg1
                cli
; End of function ResetCopTimer2


; =============== S U B R O U T I N E =======================================


sub_E4F3:                               ; __RESET:loc_94A2↑P
                                        ; sub_E542+E8↓P ...
                ldd     #$55AA
                staa    COPRST_ArmOCToggleAndResetCopTimerReg
                stab    COPRST_ArmOCToggleAndResetCopTimerReg
                rts
; End of function sub_E4F3


; =============== S U B R O U T I N E =======================================


OCToggleAndResetCopTimer:               ; __RESET+7F↑P __RESET+82↑P ...
                ldaa    SwitchPortAccessReg1
                anda    #$FD
                staa    SwitchPortAccessReg1
                ldab    #$08*ECLOCK

loc_E507:                               ; OCToggleAndResetCopTimer+B↓j
                decb
                bne     loc_E507
                oraa    #2
                staa    SwitchPortAccessReg1
                ldd     #$55AA
                staa    COPRST_ArmOCToggleAndResetCopTimerReg
                stab    COPRST_ArmOCToggleAndResetCopTimerReg
                rts
; End of function OCToggleAndResetCopTimer

; ---------------------------------------------------------------------------
                ldx     #ErrorBitRegisterStored0
                bra     loc_E526
; ---------------------------------------------------------------------------
                ldx     #Ram_05
                bra     loc_E526

; =============== S U B R O U T I N E =======================================


sub_E523:                               ; sub_E542:loc_E59D↓P
                                        ; sub_E542:loc_E5B1↓P
                ldx     #Ram_01

loc_E526:                               ; ROM:E51C↑j ROM:E521↑j ...
                ldy     #$0242
                jsr     OCToggleAndResetCopTimer

loc_E52D:                               ; sub_E523+19↓j
                ldaa    SwitchPortAccessReg1
                bita    #$40
                bne     loc_E536
                sec
                rts
; ---------------------------------------------------------------------------

loc_E536:                               ; sub_E523+F↑j
                jsr     OCToggleAndResetCopTimer
                clc
                dey
                bne     loc_E52D
                dex
                bne     loc_E526
                rts
; End of function sub_E523


; =============== S U B R O U T I N E =======================================


sub_E542:                               ; __RESET+655↑P
                ldaa    SwitchPortAccessReg1
                bita    #$40
                bne     loc_E55E
                brset   <Ram_30 $40 loc_E559
                bset    <Ram_30 $40
                bclr    <BitFlags21 $80
                bclr    <BitFlags2e $42
                bclr    <Ram_30 $80

loc_E559:                               ; sub_E542+7↑j sub_E542+4E↓j
                clr     CountdownTimerFromKeyOn
                cli
                rts
; ---------------------------------------------------------------------------

loc_E55E:                               ; sub_E542+5↑j
                bclr    <BitFlags21 $80
                bclr    <BitFlags2e $42
                bclr    <Ram_30 $C0
                ldaa    CountdownTimerFromKeyOn
                bne     loc_E576
                ldaa    #$17
                ldab    <TimerOverflowsBetweenCamPulses
                cmpb    #4
                bcs     loc_E576
                ldaa    #9

loc_E576:                               ; sub_E542+28↑j sub_E542+30↑j
                deca
                beq     loc_E57D
                staa    CountdownTimerFromKeyOn
                rts
; ---------------------------------------------------------------------------

loc_E57D:                               ; sub_E542+35↑j
                sei
                clra
                staa    <ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
                staa    <ClearTheErrorTimer_0
                jsr     OCToggleAndResetCopTimer
                jsr     sub_CFDE
                ldaa    #$20

loc_E58B:                               ; sub_E542+51↓j
                ldab    SwitchPortAccessReg1
                bitb    #$40
                beq     loc_E559
                deca
                bne     loc_E58B
                jsr     OCToggleAndResetCopTimer
                ldaa    #$32
                staa    Temp3

loc_E59D:                               ; sub_E542+63↓j
                jsr     sub_E523
                bcs     loc_E5E9
                dec     Temp3
                bne     loc_E59D
                ldaa    #$FF
                staa    TFLG1_TimerInterruptFlag1
                ldaa    #$32
                staa    Temp3

loc_E5B1:                               ; sub_E542+7E↓j
                jsr     sub_E523
                bcs     loc_E5E9
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #6
                bne     loc_E5E9
                dec     Temp3
                bne     loc_E5B1
                ldab    #$03

loc_E5C4:                               ; sub_E542+95↓j
                ldaa    #$10
                staa    ADCTL_A2DControlReg

loc_E5C9:                               ; sub_E542+8A↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_E5C9
                ldaa    ADR1_A2DResults1
                cmpa    byte_8A09
                bcc     loc_E5E6
                decb
                bne     loc_E5C4
                ldd     #$2481
                jsr     ThrowNonCriticalError
                bcc     loc_E5E6
                bset    <Ram_05 4
                bra     loc_E5E9
; ---------------------------------------------------------------------------

loc_E5E6:                               ; sub_E542+92↑j sub_E542+9D↑j
                bclr    <Ram_05 4

loc_E5E9:                               ; sub_E542+5E↑j sub_E542+72↑j ...
                jsr     CountRamValuesFrom05to20
                std     <MinimumTimerCountBeforeMainloopCanContinue
                jsr     OCToggleAndResetCopTimer
                ldd     #0000
                staa    PPROG_EEPROMControlReg
                stab    PIA_Ctrl_1
                staa    SwitchPortAccessReg1
                ldab    #$07
                stab    PIA3_Buffer_2_t3
                staa    PIA_Ctrl_5
                staa    PIA_Ctrl_2
                ldd     #0000
                std     OC1M_OutputCompare1Mask
                clr     SCCR2_SerialControlReg2
                ldd     #$FFFE
                std     PORTD_PortD
                ldd     #$AAF8
                staa    TCTL1_TimerControlReg1
                stab    CFORC_TimerForceCompare
                jsr     OCToggleAndResetCopTimer

loc_E623:                               ; sub_E542+EB↓J sub_E542+EE↓J ...
                ldab    SwitchPortAccessReg1
                bitb    #$40
                beq     loc_E633
                jsr     sub_E4F3
                jmp     loc_E623
; ---------------------------------------------------------------------------
                jmp     loc_E623
; ---------------------------------------------------------------------------

loc_E633:                               ; sub_E542+E6↑j
                jsr     sub_E4F3
                ldaa    #$40

loc_E638:                               ; sub_E542+FE↓j
                ldab    SwitchPortAccessReg1
                bitb    #$40
                bne     loc_E623
                deca
                bne     loc_E638
                jsr     sub_E4F3
                jmp     __RESET
; End of function sub_E542


; =============== S U B R O U T I N E =======================================


CountRamValuesFrom05to20:               ; __RESET+20↑P
                                        ; sub_E542:loc_E5E9↑P
                clra
                clrb
                ldx     #Ram_05

loc_E64D:                               ; CountRamValuesFrom05to20+E↓j
                addb    0,x
                bcc     loc_E652
                inca

loc_E652:                               ; CountRamValuesFrom05to20+7↑j
                inx
                cpx     #$20
                bcs     loc_E64D
                rts
; End of function CountRamValuesFrom05to20

; ---------------------------------------------------------------------------
                ldaa    #$16
                bsr     sub_E65F
                ldaa    #2

; =============== S U B R O U T I N E =======================================


sub_E65F:                               ; ROM:E65B↑p
                staa    PPROG_EEPROMControlReg
                stab    0,x
                inca
                staa    PPROG_EEPROMControlReg
                ldy     #$B2C*ECLOCK

loc_E66C:                               ; sub_E65F+F↓j
                dey
                bne     loc_E66C
                deca
                staa    PPROG_EEPROMControlReg
                clra
                staa    PPROG_EEPROMControlReg
                rts
; End of function sub_E65F


; =============== S U B R O U T I N E =======================================


sub_E679:                               ; __RESET+5E3↑P
                brset   <BitFlags6a_t3 $40 loc_E680
                jmp     loc_E709
; ---------------------------------------------------------------------------

loc_E680:                               ; sub_E679↑j
                ldaa    PPROG_EEPROMControlReg
                beq     loc_E696
                bclr    <BitFlags6a_t3 $80
                cmpa    #$17
                bne     loc_E691
                bset    <BitFlags6a_t3 8
                bra     loc_E69C
; ---------------------------------------------------------------------------

loc_E691:                               ; sub_E679+11↑j
                bclr    <BitFlags6a_t3 8
                bra     loc_E69C
; ---------------------------------------------------------------------------

loc_E696:                               ; sub_E679+A↑j
                bset    <BitFlags6a_t3 $80
                bclr    <BitFlags6a_t3 8

loc_E69C:                               ; sub_E679+16↑j sub_E679+1B↑j
                clra
                staa    PPROG_EEPROMControlReg
                ldaa    CountdownTimerFromKeyOn
                beq     loc_E6AE
                ldab    #3
                cba
                bcc     loc_E6AE
                tba
                staa    CountdownTimerFromKeyOn

loc_E6AE:                               ; sub_E679+2A↑j sub_E679+2F↑j
                ldx     #$B600
                ldab    DRBOffsetStored_HB
                abx
                ldab    DRBOffsetStored_LB
                ldaa    0,x
                cba
                beq     loc_E6F6
                brset   <BitFlags6a_t3 $80 loc_E6E0
                brclr   <BitFlags6a_t3 8 loc_E6C9
                cmpa    #$FF
                beq     loc_E6E0

loc_E6C9:                               ; sub_E679+48↑j
                brset   <b5D_IPL2_t3 $40 loc_E6F6
                pshx
                psha
                pshb
                ldd     #$318A
                jsr     ThrowNonCriticalError
                pulb
                pula
                pulx
                bcc     loc_E6E0
                bset    <b5D_IPL2_t3 $40
                bra     loc_E6F6
; ---------------------------------------------------------------------------

loc_E6E0:                               ; sub_E679+44↑j sub_E679+4E↑j ...
                anda    DRBOffsetStored_LB
                cmpa    DRBOffsetStored_LB
                beq     loc_E6EC
                ldaa    #$16
                bra     loc_E6EE
; ---------------------------------------------------------------------------

loc_E6EC:                               ; sub_E679+6D↑j
                ldaa    #2

loc_E6EE:                               ; sub_E679+71↑j
                staa    PPROG_EEPROMControlReg
                stab    0,x
                inca
                bra     loc_E70A
; ---------------------------------------------------------------------------

loc_E6F6:                               ; sub_E679+42↑j
                                        ; sub_E679:loc_E6C9↑j ...
                bclr    <BitFlags6a_t3 $40
                brset   <BitFlags6a_t3 $20 loc_E709
                ldaa    #3
                cmpa    CountdownTimerFromKeyOn
                bne     loc_E709
                ldaa    #1
                staa    CountdownTimerFromKeyOn

loc_E709:                               ; sub_E679+4↑J sub_E679+80↑j ...
                clra

loc_E70A:                               ; sub_E679+7B↑j
                staa    PPROG_EEPROMControlReg
                rts
; End of function sub_E679


; =============== S U B R O U T I N E =======================================


sub_E70E:                               ; __RESET+64B↑P sub_CABD+15↑P
                ldx     #$B610

loc_E711:                               ; sub_E70E+12↓j
                ldab    #$10
                abx
                cpx     #$B650
                bhi     locret_E722
                ldaa    0,x
                inca
                beq     locret_E722
                bsr     sub_E723
                bra     loc_E711
; ---------------------------------------------------------------------------

locret_E722:                            ; sub_E70E+9↑j sub_E70E+E↑j
                rts
; End of function sub_E70E


; =============== S U B R O U T I N E =======================================


sub_E723:
                ldaa    #$0E
                staa    PPROG_EEPROMControlReg
                stab    0,x
                inca
                staa    PPROG_EEPROMControlReg
                ldy     #$B29*ECLOCK

loc_E732:
                dey
                bne     loc_E732
                deca
                staa    PPROG_EEPROMControlReg
                clr     PPROG_EEPROMControlReg
                sei
                jsr     OCToggleAndResetCopTimer
                cli
                rts

; ---------------------------------------------------------------------------

IC2I:                                   ; USER_VEC:FFEC↓o
                ldd     TIC2_Counter_IC2_Speedometer
                lsld
                std     Temp5_t3
                jsr     sub_E825
                beq     loc_E75E
                fdiv
                jsr     sub_E825
                beq     loc_E75E
                fdiv
                jsr     sub_E825
                beq     loc_E75E
                jmp     loc_E812
; ---------------------------------------------------------------------------

loc_E75E:                               ; ROM:E74D↑j ROM:E753↑j ...
                ldd     <Counter_SpeedSensorInterrupt_HB
                addd    #$01
                std     <Counter_SpeedSensorInterrupt_HB
                bne     loc_E76A
                bset    <IPL1 $80

loc_E76A:                               ; ROM:E765↑j
                ldd     <VehicleSpeed_HB
                subd    #$500
                ldaa    <BitFlags24
                bcc     loc_E794
                bita    #$10
                bne     loc_E77B
                oraa    #$10
                bra     loc_E79B
; ---------------------------------------------------------------------------

loc_E77B:                               ; ROM:E775↑j
                anda    #$1F
                oraa    #$08
                staa    <BitFlags24
                clra
                staa    CruiseControlVar4
                staa    Counter_SomethingWithDistributor
                staa    <Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                ldd     <VehicleSpeed_HB
                addd    #$53
                std     <VehicleSpeed_HB
                jmp     loc_E812
; ---------------------------------------------------------------------------

loc_E794:                               ; ROM:E771↑j
                bita    #$10
                beq     loc_E79B
                jmp     loc_E818
; ---------------------------------------------------------------------------

loc_E79B:                               ; ROM:E779↑j ROM:E796↑j
                adda    #$20
                bcs     loc_E7A5
                anda    #$EF
                staa    <BitFlags24
                bra     loc_E812
; ---------------------------------------------------------------------------

loc_E7A5:                               ; ROM:E79D↑j
                staa    <BitFlags24
                ldab    CruiseControlVar4
                beq     loc_E7CB
                bita    #8
                bne     loc_E7CB
                ldaa    #$3A
                mul
                adca    #0
                cmpa    #3
                bcc     loc_E7BB
                ldaa    #3

loc_E7BB:                               ; ROM:E7B7↑j
                tab
                ldaa    Counter_SomethingWithDistributor
                suba    CruiseControlVar4
                bcc     loc_E7C5
                nega

loc_E7C5:                               ; ROM:E7C2↑j
                sba
                bcs     loc_E7D1
                bset    <BitFlags24 8

loc_E7CB:                               ; ROM:E7AA↑j ROM:E7AE↑j
                ldab    Counter_SomethingWithDistributor
                stab    CruiseControlVar4

loc_E7D1:                               ; ROM:E7C6↑j
                clra
                staa    Counter_SomethingWithDistributor
                ldd     Temp5_t3
                ldx     #Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                ldy     #LDXi_6490
                jsr     DetermineNumberOfOverflowsBetweenSensorPulses_MM
                ldaa    <Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                lsra
                tab
                oraa    <TimerOverflowsBetweenSpeedoPulses
                beq     loc_E7F3
                stab    <TimerOverflowsBetweenSpeedoPulses
                ldd     Temp5_t3
                subd    <PreviousVehicleSpeed_HB
                bra     loc_E808
; ---------------------------------------------------------------------------

loc_E7F3:                               ; ROM:E7E8↑j
                ldd     Temp5_t3
                subd    <PreviousVehicleSpeed_HB
                subd    <SpeedoSensorPulsewidth_HB
                beq     loc_E80A
                asra
                rorb
                asra
                rorb
                subd    #0
                bne     loc_E806
                incb

loc_E806:                               ; ROM:E803↑j
                addd    <SpeedoSensorPulsewidth_HB

loc_E808:                               ; ROM:E7F1↑j ROM:E823↓j
                std     <SpeedoSensorPulsewidth_HB

loc_E80A:                               ; ROM:E7FA↑j
                ldd     Temp5_t3
                std     <PreviousVehicleSpeed_HB
                clra
                staa    <Counter_TimerRegHalfOverflowBetweenSpeedoPulses

loc_E812:                               ; ROM:E75B↑J ROM:E791↑J ...
                ldaa    #2
                staa    TFLG1_TimerInterruptFlag1
                rti
; ---------------------------------------------------------------------------

loc_E818:                               ; ROM:E798↑J
                anda    #$EF
                staa    <BitFlags24
                ldaa    #1
                staa    <TimerOverflowsBetweenSpeedoPulses
                ldd     #$5F90
                bra     loc_E808

; =============== S U B R O U T I N E =======================================


sub_E825:                               ; ROM:E74A↑P ROM:E750↑P ...
                ldaa    TCTL2_TimerControlReg2
                lsra
                eora    PORTA_PortA
                bita    #2
                rts
; End of function sub_E825

; ---------------------------------------------------------------------------

OC1I:
                bsr     sub_E832
                rti

; =============== S U B R O U T I N E =======================================

sub_E832:
                ldaa    #$80
                staa    TFLG1_TimerInterruptFlag1
                ldaa    #$10
                staa    ADCTL_A2DControlReg
                ldd     TOC1_Counter_OC1
                addd    #$F0*ECLOCK
                cpd     TCNT_Counter_FreeRunning16bit
                bmi     loc_E859
                subd    #$44*ECLOCK+1
                cpd     TCNT_Counter_FreeRunning16bit
                bpl     loc_E854
                addd    #$44*ECLOCK+1

loc_E854:
                addd    #$44*ECLOCK+1
                bra     loc_E85F

loc_E859:
                ldd     TCNT_Counter_FreeRunning16bit
                addd     #$F0*ECLOCK

loc_E85F:
                std     TOC1_Counter_OC1
                ldaa    TMSK1_TimerInterruptMask1
                anda    #$7F
                staa    TMSK1_TimerInterruptMask1
                inc     Timer_AlternatorDutyCycle
                ldx     #SwitchPortAccessReg1

ControlAlternator:
                ldaa    <ATMOffset
                cmpa    #$0D
                bne     loc_E879
                jmp     loc_E907

loc_E879:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_E879
                ldaa    ADR2_A2DResults2
                staa    <BatteryVoltsRaw
                cli
                cmpa    <BatteryVolts
                bcc     loc_E88A
                staa    <BatteryVolts

loc_E88A:
                ldaa    <EngineRpm_HB
                cmpa    #$0C
                bcs     loc_E898
                cmpa    #$10
                bcc     loc_E89D
                brset   <BitFlags24 1 loc_E89D

loc_E898:
                bclr    <BitFlags24 1
                bra     AlternatorOff

loc_E89D:
                bset    <BitFlags24 1
                ldaa    <BatteryVoltsRaw
                cmpa    #$41
                bcc     loc_E8AC
                ldab    <Counter_MainLoop
                bitb    #$06
                bne     AlternatorOff

loc_E8AC:
                brclr   <BitFlags21 $10 loc_E8C7
                ldaa    <A2DResults2Temp
                bne     loc_E8B8
                ldaa    <BatteryVoltsRaw
                staa    <A2DResults2Temp

loc_E8B8:
                suba    <BatteryVoltsRaw
                bls     AlternatorOff
                cmpa    byte_89F2
                bls     AlternatorOff
                bset    <BitFlags21 $20
                bclr    <BitFlags21 $10

loc_E8C7:
                clr     A2DResults2Temp
                ldaa    <BatteryVoltsRaw
                suba    <TargetBatteryVolts
                bne     loc_E8D6
                brclr   0,x 4 AlternatorOn
                bra     AlternatorOff

loc_E8D6:
                ldab    #$07
                bcc     loc_E8EA
                nega
                cmpa    #$02
                beq     loc_E8E3
                bcc     AlternatorOn
                ldab    #$03

loc_E8E3:
                andb    Timer_AlternatorDutyCycle
                beq     AlternatorOff
                bra     AlternatorOn

loc_E8EA:
                cmpa    #$02
                beq     loc_E8F2
                bcc     AlternatorOff
                ldab    #$03

loc_E8F2:
                andb    Timer_AlternatorDutyCycle
                bne     AlternatorOff

AlternatorOn:
                sei
                bset    0,x 4
                bset    <BitFlags24 2
                bra     loc_E907

AlternatorOff:
                sei
                bclr    0,x 4
                bclr    <BitFlags24 2

loc_E907:
                bset    2,x 4
                ldaa    #$0A*ECLOCK

loc_E90C:
                deca
                bne     loc_E90C
                bclr    2,x 4
                cli
                ldaa    Timer_AlternatorDutyCycle
                lsra
                bcs     loc_E995
                ldab    <BitFlags36_t3
                bitb    #$40
                bne     loc_E92E
                lsra
                bcs     loc_E995
                ldaa    <EngineRpm_HB
                cmpa    #$5E
                bcs     loc_E92E
                ldaa    <CurrentAisPosition
                cmpa    <DesiredNewAisPosition
                beq     loc_E995

loc_E92E:
                ldaa    <BatteryVolts
                cmpa    TL_MinVoltageForAis
                bcs     loc_E995
                sei
                ldaa    <PIA3_Buffer_t3
                oraa    #$01
                staa    PIA3_Buffer_2_t3
                anda    #$FE
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldab    <CurrentAisPosition
                brclr   <BitFlags36_t3 $40 loc_E954
                ldaa    #$01
                tstb
                bne     loc_E95C
                bclr    <BitFlags36_t3 $40
                bra     loc_E964

loc_E954:
                ldaa    #$01
                cmpb    <DesiredNewAisPosition
                beq     loc_E964
                bcs     loc_E95D

loc_E95C:
                nega

loc_E95D:
                tab
                adda    <CurrentAisPosition
                staa    <CurrentAisPosition
                bra     loc_E965

loc_E964:
                clrb

loc_E965:
                ldx     #gb_AISTEP_BitPatternForAisControl
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
                ldx     #PORTD_PortD
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

loc_E995:
                brclr   <DRBSerialMode $80 loc_E9EC
                ldaa    SCSR_SerialStatus
                bita    #$0E
                psha
                pula
                beq     loc_E9A7
                ldab    SCDR_SerialData
                bra     loc_E9EC

loc_E9A7:
                bita    #$20
                beq     loc_E9EC
                ldab    SCDR_SerialData
                cmpb    #$F2
                bne     loc_E9B7
                bclr    <BitFlags21 $40
                bra     loc_E9E9

loc_E9B7:
                cmpb    #$F6
                bne     loc_E9C0
                bset    <BitFlags21 $40
                bra     loc_E9E9

loc_E9C0:
                cmpb    #$FE
                bne     loc_E9CA
                bclr    <DRBSerialMode $B0
                bclr    <BitFlags21 $40

loc_E9CA:
                brset   <BitFlags21 $40 loc_E9D6
                ldx     #Ram_00
                abx
                ldab    0,x
                bra     loc_E9E9

loc_E9D6:
                ldaa    byte_8A56
                cba
                bhi     loc_E9E0
                ldab    #$FF
                bra     loc_E9E9

loc_E9E0:
                ldx     #byte_8A57
                aslb
                abx
                ldx     0,x
                ldab    0,x

loc_E9E9:
                stab    SCDR_SerialData

loc_E9EC:
                jsr     sub_D801
                sei
                ldaa    #$80
                oraa    TMSK1_TimerInterruptMask1
                staa    TMSK1_TimerInterruptMask1
                rts

; =============== S U B R O U T I N E =======================================


sub_E9F9:                               ; __RESET+3D6↑P
                ldd     #$8EFF
                stab    TFLG1_TimerInterruptFlag1
                staa    TMSK1_TimerInterruptMask1
                stab    TFLG2_TimerInterruptFlag2
                clr     PACNT_PulseAccumulatorCounter
; End of function sub_E9F9


; =============== S U B R O U T I N E =======================================


sub_EA08:                               ; ROM:loc_EC31↓P
                ldab    #1
                ldaa    SwitchPortAccessReg2
                bita    #1
                beq     loc_EA13
                ldab    #0

loc_EA13:                               ; sub_EA08+7↑j
                stab    PIA_Ctrl_2
                anda    #1
                eora    SwitchPortAccessReg2
                bita    #$01
                beq     loc_EA2D
                ldaa    SwitchPortAccessReg2
                ldab    #$01
                bita    #$01
                beq     loc_EA2A
                ldab    #$00

loc_EA2A:                               ; sub_EA08+1E↑j
                stab    PIA_Ctrl_2

loc_EA2D:                               ; sub_EA08+15↑j
                ldd     #$01FB
                stab    PIA_Ctrl_4
                staa    PIA_Ctrl_3
                rts
; End of function sub_EA08


; =============== S U B R O U T I N E =======================================


sub_EA37:                               ; __RESET+5B6↑P
                ldx     #PORTA_PortA
                brset   9,x $3A loc_EA41
                bset    9,x $3A

loc_EA41:                               ; sub_EA37+3↑j
                brclr   9,x 5 loc_EA48
                bclr    9,x 5

loc_EA48:                               ; sub_EA37:loc_EA41↑j
                brclr   $C,x $F8 loc_EA4F
                bclr    $C,x $FF

loc_EA4F:                               ; sub_EA37:loc_EA48↑j
                brclr   $D,x $F8 loc_EA56
                bclr    $D,x $FF

loc_EA56:                               ; sub_EA37:loc_EA4F↑j
                brset   $20,x $A2 loc_EA5D
                bset    $20,x $A2

loc_EA5D:                               ; sub_EA37:loc_EA56↑j
                brclr   $20,x $C loc_EA64
                bclr    $20,x $C

loc_EA64:                               ; sub_EA37:loc_EA5D↑j
                brset   $21,x $1A loc_EA6B
                bset    $21,x $1A

loc_EA6B:                               ; sub_EA37:loc_EA64↑j
                brclr   $21,x $25 loc_EA72
                bclr    $21,x $25

loc_EA72:                               ; sub_EA37:loc_EA6B↑j
                brset   $22,x $8E loc_EA79
                bset    $22,x $8E

loc_EA79:                               ; sub_EA37:loc_EA72↑j
                brclr   $22,x $61 loc_EA80
                bclr    $22,x $61

loc_EA80:                               ; sub_EA37:loc_EA79↑j
                brclr   $24,x $F0 loc_EA87
                bclr    $24,x $F0

loc_EA87:                               ; sub_EA37:loc_EA80↑j
                brset   $26,x $70 loc_EA8E
                bset    $26,x $70

loc_EA8E:                               ; sub_EA37:loc_EA87↑j
                brclr   $26,x $80 loc_EA95
                bclr    $26,x $80

loc_EA95:                               ; sub_EA37:loc_EA8E↑j
                brset   $28,x $54 loc_EA9C
                bset    $28,x $54

loc_EA9C:                               ; sub_EA37:loc_EA95↑j
                brclr   $28,x $AB loc_EAA3
                bclr    $28,x $AB

loc_EAA3:                               ; sub_EA37:loc_EA9C↑j
                brclr   $2C,x $18 loc_EAAA
                bclr    $2C,x $18

loc_EAAA:                               ; sub_EA37:loc_EAA3↑j
                brset   $2D,x $C loc_EAB1
                bset    $2D,x $C

loc_EAB1:                               ; sub_EA37:loc_EAAA↑j
                brclr   $2D,x $F3 loc_EAB8
                bclr    $2D,x $F3

loc_EAB8:                               ; sub_EA37:loc_EAB1↑j
                brset   $39,x $88 loc_EABF
                bset    $39,x $88

loc_EABF:                               ; sub_EA37:loc_EAB8↑j
                brclr   $39,x $40 loc_EAC6
                bclr    $39,x $40

loc_EAC6:                               ; sub_EA37:loc_EABF↑j
                brset   $3C,x $F loc_EACF
                sei
                bset    $3C,x $F
                cli

loc_EACF:                               ; sub_EA37:loc_EAC6↑j
                ldx     #SwitchPortAccessReg1
                sei
                brclr   2,x $70 loc_EADA
                bclr    2,x $70

loc_EADA:                               ; sub_EA37+9C↑j
                brset   2,x $83 loc_EAE1
                bset    2,x $83

loc_EAE1:                               ; sub_EA37:loc_EADA↑j
                cli
                brclr   3,x $FE loc_EAE9
                bclr    3,x $FE

loc_EAE9:                               ; sub_EA37+AB↑j
                brclr   4,x $FE loc_EAF0
                bclr    4,x $FE

loc_EAF0:                               ; sub_EA37:loc_EAE9↑j
                brset   6,x $F8 loc_EAF7
                bset    6,x $F8

loc_EAF7:                               ; sub_EA37:loc_EAF0↑j
                brclr   6,x 6 locret_EAFE
                bclr    6,x 6

locret_EAFE:                            ; sub_EA37:loc_EAF7↑j
                rts
; End of function sub_EA37

; ---------------------------------------------------------------------------
word_EAFF:      fdb $4614               ; sub_EB09+4E↓o
                fdb $3D15
                fdb $4513
word_EB05:      fdb $3D14               ; sub_EB09+47↓o
                fdb $1513

; =============== S U B R O U T I N E =======================================


sub_EB09:                               ; __RESET+61F↑P
                ldaa    <EngineRpm_HB
                cmpa    #$5E
                bcc     loc_EB7D
                ldaa    <BatteryVolts
                cmpa    #$C3
                bcs     loc_EB7D
                ldaa    SwitchPortAccessReg1
                bita    #$10
                beq     loc_EB7D
                brset   <PIA2_Buffer_t3 $10 loc_EB7D
                bita    #$40
                bne     loc_EB7D
                brset   <b5d_IPL2 $20 loc_EB7D
                sei
                ldaa    SwitchPortAccessReg2
                anda    #$F0
                bne     loc_EB80
                brset   <BitFlags27 $80 loc_EB3B
                ldaa    PORTA_PortA
                bita    #$60
                bne     loc_EB80

loc_EB3B:                               ; sub_EB09+27↑j
                brclr   <BitFlags21 $80 loc_EB80
                ldab    #$03*ECLOCK+1

loc_EB41:                               ; sub_EB09+39↓j
                decb
                bne     loc_EB41
                ldaa    PIA_Ctrl_4
                bita    #4
                bne     loc_EB78
                ldaa    <BitFlags_BF_t3
                ldab    <CylinderPointer
                cli
                ldx     #word_EB05
                brset   <BitFlags27 $80 loc_EB5A
                ldx     #word_EAFF

loc_EB5A:                               ; sub_EB09+4A↑j
                cmpa    #$84
                bne     loc_EB69
                decb
                bpl     loc_EB69
                ldab    #3
                brset   <BitFlags27 $80 loc_EB69
                ldab    #5

loc_EB69:                               ; sub_EB09+53↑j sub_EB09+56↑j ...
                andb    #7
                abx
                ldaa    0,x
                ldab    #$90
                jsr     ThrowNonCriticalError
                bcc     loc_EB78
                bset    <b5d_IPL2 $20

loc_EB78:                               ; sub_EB09+40↑j sub_EB09+6A↑j
                ldab    #4
                stab    PIA_Ctrl_4

loc_EB7D:                               ; sub_EB09+4↑j sub_EB09+A↑j ...
                bclr    <BitFlags21 $80

loc_EB80:                               ; sub_EB09+25↑j sub_EB09+30↑j ...
                cli
                rts
; End of function sub_EB09

; ---------------------------------------------------------------------------
off_EB82:       fdb loc_EC37            ; ROM:EBDE↓o
                fdb loc_EEFC
                fdb loc_F016
                fdb loc_F143
; ---------------------------------------------------------------------------

IC1I:                                   ; USER_VEC:FFEE↓o
                ldx     <EngineRpm_HB
                cpx     #$BB80
                bcc     loc_EBBC
                ldd     TIC1_Counter_IC1_CamSensor
                subd    TIC3_Counter_IC3_CrankSensor
                cpd     #5
                bcc     loc_EBA5

loc_EB9D:                               ; ROM:EBB5↓j
                ldaa    #5
                staa    TFLG1_TimerInterruptFlag1
                jmp     locret_F345
; ---------------------------------------------------------------------------

loc_EBA5:                               ; ROM:EB9B↑j
                cpx     #$5DC0
                bcc     loc_EBBC
                ldx     TIC1_Counter_IC1_CamSensor
                ldab    #$0C
                abx
                ldaa    #$04

loc_EBB2:                               ; ROM:EBBA↓j
                bita    PORTA_PortA
                beq     loc_EB9D
                cpx     TCNT_Counter_FreeRunning16bit
                bpl     loc_EBB2

loc_EBBC:                               ; ROM:EB8F↑j ROM:EBA8↑j
                ldd     #$0510
                staa    TFLG1_TimerInterruptFlag1
                stab    ADCTL_A2DControlReg
                ldab    CountdownTimerFromKeyOn
                bne     loc_EBCD
                bclr    <Ram_05 1

loc_EBCD:                               ; ROM:EBC8↑j
                ldab    <BitFlags_BF_t3
                bpl     loc_EC16
                bitb    #$04
                beq     loc_EBD7
                andb    #$F8

loc_EBD7:                               ; ROM:EBD3↑j
                incb
                stab    <BitFlags_BF_t3
                andb    #$07
                decb
                aslb
                ldx     #off_EB82
                abx
                ldx     0,x
                ldaa    #$01
                ldab    <CylinderPointer
                cmpb    #$05
                beq     loc_EBF1
                cmpb    #$02
                bcs     loc_EBF1
                deca

loc_EBF1:                               ; ROM:EBEA↑j ROM:EBEE↑j
                eora    SwitchPortAccessReg2
                lsra
                bcs     loc_EC16
                ldaa    <EngineRpm_HB
                ldab    #$01
                cmpa    #$5E
                bcc     loc_EC0A
                stab    PIA_Ctrl_4
                orab    PIA_Ctrl_3
                stab    PIA_Ctrl_3
                jmp     0,x
; ---------------------------------------------------------------------------

loc_EC0A:                               ; ROM:EBFD↑j
                stab    PIA_Ctrl_4
                comb
                andb    PIA_Ctrl_3
                stab    PIA_Ctrl_3
                jmp     0,x
; ---------------------------------------------------------------------------

loc_EC16:                               ; ROM:EBCF↑j ROM:EBF5↑j
                bclr    <BitFlags_BF_t3 $80
                bclr    <BitFlags2b $80
                brset   <BitFlags2b $40 loc_EC31
                ldaa    UNe_64B9
                tab
                anda    #$E0
                andb    #$1F
                cmpb    #$1F
                beq     loc_EC2D
                incb

loc_EC2D:                               ; ROM:EC2A↑j
                aba
                staa    UNe_64B9

loc_EC31:                               ; ROM:EC1C↑j
                jsr     sub_EA08
                jmp     loc_F336
; ---------------------------------------------------------------------------

loc_EC37:                               ; ROM:off_EB82↑o
                brset   <PIA3_Buffer_t3 $40 loc_EC4C
                jsr     sub_F363
                ldd     #$FFFF
                addd    TCNT_Counter_FreeRunning16bit
                std     TOC4_Counter_OC4
                ldaa    #$10
                staa    TFLG1_TimerInterruptFlag1

loc_EC4C:                               ; ROM:loc_EC37↑j
                brset   <BitFlags27 $80 loc_EC64
                brclr   <BitFlags27 $40 loc_EC78
                ldaa    <CylinderPointer
                beq     loc_EC78
                cmpa    #3
                beq     loc_EC78
                cmpa    #1
                beq     loc_EC6F
                cmpa    #4
                beq     loc_EC6F

loc_EC64:                               ; ROM:loc_EC4C↑j
                ldaa    <PIA3_Buffer_t3
                anda    #$FD
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     loc_EC78
; ---------------------------------------------------------------------------

loc_EC6F:                               ; ROM:EC5E↑j ROM:EC62↑j
                ldaa    <PIA3_Buffer_t3
                oraa    #2
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3

loc_EC78:                               ; ROM:EC50↑j ROM:EC56↑j ...
                ldd     TIC1_Counter_IC1_CamSensor
                ldx     #Counter_TimerPastHalfwayBetweenCamPulses
                ldy     #LDXi_6490
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
                std     AntiDwellTime_HB
                ldd     <DistributorFallingEdgePulsewidth_HB
                subd    #$C8
                cpd     AntiDwellTime_HB
                bcs     loc_ECAF
                ldd     AntiDwellTime_HB

loc_ECAF:                               ; ROM:ECAA↑j
                std     AntiDwellTime_HB
                ldaa    <TimerOverflowsBetweenCamPulses
                bne     loc_ECF4
                ldx     #SwitchPortAccessReg1
                ldd     byte_82B1
                cpd     <DistributorFallingEdgePulsewidth_HB
                bcs     loc_ECF4
                brset   <IPL1 $40 loc_ECFC
                brclr   <BitFlags23 $80 loc_ECD1
                brset   0,x $20 loc_ECD1
                ldaa    <Ram_7F
                beq     loc_ECD9

loc_ECD1:                               ; ROM:ECC5↑j ROM:ECC9↑j
                ldd     byte_82AF
                cpd     <DistributorFallingEdgePulsewidth_HB
                bcs     loc_ECF4

loc_ECD9:                               ; ROM:ECCF↑j
                bset    <IPL1 $40
                ldd     #0000
                std     <KeyOnOrEngineRunningTime
                staa    <ATMOffset
                bset    <Ram_80 $FF
                jsr     sub_C39F
                jsr     sub_C3D3
                jsr     sub_C579
                jsr     sub_C5BA
                bra     loc_ECFC
; ---------------------------------------------------------------------------

loc_ECF4:                               ; ROM:ECB4↑j ROM:ECBF↑j ...
                bclr    <IPL1 $40
                ldaa    byte_861A
                staa    <Counter_C

loc_ECFC:                               ; ROM:ECC1↑j ROM:ECF2↑j
                ldaa    <TimerOverflowsBetweenCamPulses
                bne     loc_ED3B
                ldx     #SwitchPortAccessReg1
                ldd     byte_807C
                cpd     <DistributorFallingEdgePulsewidth_HB
                bcs     loc_ED3B
                brset   <IPL1 1 loc_ED5E
                brclr   <BitFlags23 $80 loc_ED1B
                brset   0,x $20 loc_ED1B
                ldaa    <Ram_7F
                beq     loc_ED23

loc_ED1B:                               ; ROM:ED0F↑j ROM:ED13↑j
                ldd     byte_807A
                cpd     <DistributorFallingEdgePulsewidth_HB
                bcs     loc_ED3B

loc_ED23:                               ; ROM:ED19↑j
                ldaa    TMSK1_TimerInterruptMask1
                oraa    #$10
                staa    TMSK1_TimerInterruptMask1
                ldd     #$FFFF
                addd    TCNT_Counter_FreeRunning16bit
                std     TOC4_Counter_OC4
                ldaa    #$10
                staa    TFLG1_TimerInterruptFlag1
                bra     loc_ED5E
; ---------------------------------------------------------------------------

loc_ED3B:                               ; ROM:ECFE↑j ROM:ED09↑j ...
                bclr    <IPL1 1
                bset    <BitFlags2d $80
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
                jmp     loc_EE40
; ---------------------------------------------------------------------------

loc_ED5E:                               ; ROM:ED0B↑j ROM:ED39↑j
                brclr   <BitFlags2d $80 loc_ED6D
                ldaa    <Ram_4D
                adda    byte_807F
                bpl     loc_ED6B
                ldaa    #$7F

loc_ED6B:                               ; ROM:ED67↑j
                staa    <Ram_4D

loc_ED6D:                               ; ROM:loc_ED5E↑j
                brset   <BitFlags27 $80 loc_EDA8
                brclr   <IPL1 1 loc_ED84
                ldab    <EngineRpm_HB
                cmpb    #$1F
                bcs     loc_ED84
                ldaa    <CalculatedSparkAdvance
                cmpa    #$50
                bcs     loc_ED84
                jmp     loc_EE40
; ---------------------------------------------------------------------------

loc_ED84:                               ; ROM:ED71↑j ROM:ED79↑j ...
                ldaa    <AdvanceTemporary
                brclr   <BitFlags2d $80 loc_ED95
                cmpa    <Ram_4D
                bls     loc_ED92
                ldaa    <Ram_4D
                bra     loc_ED95
; ---------------------------------------------------------------------------

loc_ED92:                               ; ROM:ED8C↑j
                bclr    <BitFlags2d $80

loc_ED95:                               ; ROM:ED86↑j ROM:ED90↑j
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
                bra     loc_EDDA
; ---------------------------------------------------------------------------

loc_EDA8:                               ; ROM:loc_ED6D↑j
                brclr   <IPL1 1 loc_EDBB
                ldab    <EngineRpm_HB
                cmpb    #$1F
                bcs     loc_EDBB
                ldaa    <CalculatedSparkAdvance
                cmpa    #$50
                bcs     loc_EDBB
                jmp     loc_EE40
; ---------------------------------------------------------------------------

loc_EDBB:                               ; ROM:loc_EDA8↑j ROM:EDB0↑j ...
                ldaa    <AdvanceTemporary
                brclr   <BitFlags2d $80 loc_EDCC
                cmpa    <Ram_4D
                bls     loc_EDC9
                ldaa    <Ram_4D
                bra     loc_EDCC
; ---------------------------------------------------------------------------

loc_EDC9:                               ; ROM:EDC3↑j
                bclr    <BitFlags2d $80

loc_EDCC:                               ; ROM:EDBD↑j ROM:EDC7↑j
                staa    <CalculatedSparkAdvance
                bset    <IPL1 1
                ldaa    #$80
                suba    <CalculatedSparkAdvance
                ldab    #$B6
                mul
                adca    #0

loc_EDDA:                               ; ROM:EDA6↑j
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
                ldx     #TCTL1_TimerControlReg1
                subd    AntiDwellTime_HB
                std     DoubleTempB
                subd    TCNT_Counter_FreeRunning16bit
                bmi     loc_EE12
                cpd     #$20
                bmi     loc_EE12
                ldaa    PORTA_PortA
                bita    #8
                beq     loc_EE2A

loc_EE12:                               ; ROM:EE03↑j ROM:EE09↑j
                bset    0,x 3
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell
                bclr    0,x 1
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
                bra     loc_EE40
; ---------------------------------------------------------------------------

loc_EE2A:                               ; ROM:EE10↑j
                bclr    0,x 1
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     DoubleTempB
                std     TOC5_Counter_OC5_Dwell
                bset    0,x 3
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1

loc_EE40:                               ; ROM:ED5B↑J ROM:ED81↑J ...
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #8
                beq     loc_EE4A
                jsr     sub_F36D

loc_EE4A:                               ; ROM:EE45↑j
                brset   <IPL1 4 loc_EE53
                jsr     sub_C5F1
                bra     loc_EE99
; ---------------------------------------------------------------------------

loc_EE53:                               ; ROM:loc_EE4A↑j ROM:EE56↓j
                ldaa    ADCTL_A2DControlReg
                bpl     loc_EE53
                ldaa    ADR1_A2DResults1
                ldab    <EngineRpm_HB
                cmpb    #$2F
                bcc     loc_EE6F
                cmpb    #$D
                bcs     loc_EE6F
                cmpa    byte_8A08
                bcc     loc_EE73
                cmpa    byte_8A07
                bcs     loc_EE73

loc_EE6F:                               ; ROM:EE5F↑j ROM:EE63↑j
                brclr   <b5C_IPL1_t3 $88 loc_EE76

loc_EE73:                               ; ROM:EE68↑j ROM:EE6D↑j
                jsr     sub_D61E

loc_EE76:                               ; ROM:loc_EE6F↑j
                jsr     sub_E3F8
                tab
                stab    MapValue_t3
                bra     loc_EE99
; ---------------------------------------------------------------------------
off_EE7F:       fdb InjectorPulsewidth_HB_Cyl1 ; ROM:loc_EEA3↓o
                fdb InjectorPulsewidth_HB_Cyl3
                fdb InjectorPulsewidth_HB_Cyl4
                fdb InjectorPulsewidth_HB_Cyl2
off_EE87:       fdb TOC3_Counter_OC3    ; ROM:EEAA↓o
                fdb InjectorPulsewidth_HB_Cyl3
                fdb InjectorPulsewidth_HB_Cyl1
                fdb InjectorPulsewidth_HB_Cyl4
                fdb TOC2_Counter_OC2
                fdb InjectorPulsewidth_HB_Cyl2
byte_EE93:      fcb $10                 ; ROM:EEB3↓o
                fcb $20
                fcb $EF
byte_EE96:      fcb $40                 ; ROM:EEBC↓o
                fcb $40
                fcb $BF
; ---------------------------------------------------------------------------

loc_EE99:                               ; ROM:EE51↑j ROM:EE7D↑j
                ldd     <InjectorPulsewidth_HB
                beq     locret_EEF8
                brclr   <BitFlags2c 3 loc_EEA3
                bra     locret_EEF8
; ---------------------------------------------------------------------------

loc_EEA3:                               ; ROM:EE9D↑j
                ldx     #off_EE7F
                brset   <BitFlags27 $80 loc_EEAD
                ldx     #off_EE87

loc_EEAD:                               ; ROM:EEA6↑j
                ldab    <CylinderPointer
                aslb
                abx
                ldx     0,x
                ldy     #byte_EE93
                cpx     #TOC3_Counter_OC3
                beq     loc_EED3
                ldy     #byte_EE96
                cpx     #TOC2_Counter_OC2
                beq     loc_EED3
                ldd     <InjectorPulsewidth_HB
                std     0,x
                cpd     #$7F
                bcs     locret_EED2
                bset    <BitFlags21 $80

locret_EED2:                            ; ROM:EECD↑j
                rti
; ---------------------------------------------------------------------------

loc_EED3:                               ; ROM:EEBA↑j ROM:EEC3↑j
                ldd     0,y
                oraa    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    <InjectorPulsewidth_HB
                std     0,x
                cpd     #$3F*ECLOCK+1
                bcs     loc_EEEF
                bset    <BitFlags21 $80

loc_EEEF:                               ; ROM:EEEA↑j
                ldaa    2,y
                anda    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1

locret_EEF8:                            ; ROM:EE9B↑j ROM:EEA1↑j
                rti
; ---------------------------------------------------------------------------

loc_EEF9:                               ; ROM:EF0A↓j ROM:EF0F↓j ...
                jmp     loc_EFDF
; ---------------------------------------------------------------------------

loc_EEFC:                               ; ROM:EB84↑o
                ldd     TIC1_Counter_IC1_CamSensor
                std     L00F5_t3
                brclr   <IPL1 1 loc_EF36
                ldaa    <EngineRpm_HB
                cmpa    #$5E
                bcc     loc_EEF9
                ldd     L00F5_t3
                brclr   <IPL1 2 loc_EEF9
                subd    <LastCamFallingEdgeTime
                lsld
                lsld
                xgdy
                ldaa    #$58
                suba    <CalculatedSparkAdvance
                ble     loc_EEF9
                ldab    #$CD
                mul
                lsld
                aslb
                adca    #$00
                jsr     ScaleYbyA
                xgdy
                addd    TIC1_Counter_IC1_CamSensor
                subd    #$0A
                std     Temp5_t3
                bra     loc_EF45
; ---------------------------------------------------------------------------

loc_EF36:                               ; ROM:EF02↑j
                ldd     #$0308
                oraa    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    TFLG1_TimerInterruptFlag1
                jmp     loc_EFDA
; ---------------------------------------------------------------------------

loc_EF45:                               ; ROM:EF34↑j
                ldaa    PORTA_PortA
                bita    #$08
                bne     loc_EF80
                ldaa    TCTL1_TimerControlReg1
                bita    #$01
                bne     loc_EF56
                jmp     loc_EFDF
; ---------------------------------------------------------------------------

loc_EF56:                               ; ROM:EF51↑j
                ldd     Temp5_t3
                subd    AntiDwellTime_HB
                std     TOC5_Counter_OC5_Dwell
                ldab    TCTL1_TimerControlReg1
                orab    #3
                stab    TCTL1_TimerControlReg1
                ldd     TOC5_Counter_OC5_Dwell
                subd    #$20*ECLOCK
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_EFDF
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    AntiDwellTime_HB
                std     Temp5_t3

loc_EF80:                               ; ROM:EF4A↑j
                ldaa    TCTL1_TimerControlReg1
                bita    #1
                beq     loc_EFA2
                ldaa    <CalculatedSparkAdvance
                cmpa    #$28
                bcs     loc_EFDF
                ldd     TOC5_Counter_OC5_Dwell
                addd    AntiDwellTime_HB
                std     TOC5_Counter_OC5_Dwell
                ldd     #$FE08
                anda    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    TFLG1_TimerInterruptFlag1

loc_EFA2:                               ; ROM:EF85↑j
                ldaa    <CalculatedSparkAdvance
                cmpa    #$28
                bcc     loc_EFBD
                ldaa    TCTL1_TimerControlReg1
                oraa    #3
                staa    TCTL1_TimerControlReg1
                ldd     TCNT_Counter_FreeRunning16bit
                std     TOC5_Counter_OC5_Dwell
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
                bra     loc_EFDF
; ---------------------------------------------------------------------------

loc_EFBD:                               ; ROM:EFA6↑j
                ldd     Temp5_t3
                subd    TOC5_Counter_OC5_Dwell
                cpd     #$10
                bcs     loc_EFCF
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell

loc_EFCF:                               ; ROM:EFC7↑j
                ldd     TOC5_Counter_OC5_Dwell
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_EFDF
                bclr    <IPL1 2

loc_EFDA:                               ; ROM:EF42↑J
                ldaa    #8
                staa    CFORC_TimerForceCompare

loc_EFDF:                               ; ROM:loc_EEF9↑J ROM:EF53↑J ...
                ldaa    SparkScatter
                adda    SparkScatterIncrement
                bvc     loc_F00F
                brclr   <BitFlags68_t3 4 loc_F00E
                ldab    <DesiredNewAisPosition
                cmpb    <CurrentAisPosition
                bne     loc_F00E
                ldab    byte_8660
                beq     loc_F00E
                tsta
                bmi     loc_F001
                ldaa    <DesiredNewAisPosition
                sba
                bcc     loc_F00C
                clra
                bra     loc_F00C
; ---------------------------------------------------------------------------

loc_F001:                               ; ROM:EFF7↑j
                ldaa    byte_876E
                addb    <DesiredNewAisPosition
                bcs     loc_F00C
                cba
                bls     loc_F00C
                tba

loc_F00C:                               ; ROM:EFFC↑j ROM:EFFF↑j ...
                staa    <DesiredNewAisPosition

loc_F00E:                               ; ROM:EFE7↑j ROM:EFEF↑j ...
                clra

loc_F00F:                               ; ROM:EFE5↑j
                staa    SparkScatterIncrement
                rti
; ---------------------------------------------------------------------------

loc_F013:                               ; ROM:F020↓j ROM:F022↓j ...
                jmp     loc_F0CB
; ---------------------------------------------------------------------------

loc_F016:                               ; ROM:EB86↑o
                ldd     TIC1_Counter_IC1_CamSensor
                std     Counter_IC1_Temp
                ldaa    <EngineRpm_HB
                cmpa    #$5E
                bcc     loc_F013
                brclr   <IPL1 2 loc_F013
                ldd     TIC1_Counter_IC1_CamSensor
                subd    L00F5_t3
                lsld
                lsld
                xgdy
                ldaa    #$30
                suba    <CalculatedSparkAdvance
                bcc     loc_F037
                clra

loc_F037:                               ; ROM:F034↑j
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
                brclr   <IPL1 1 loc_F013
                ldaa    PORTA_PortA
                bita    #8
                bne     loc_F08D
                ldaa    TCTL1_TimerControlReg1
                bita    #1
                beq     loc_F0CB
                ldd     Temp5_t3
                subd    AntiDwellTime_HB
                std     TOC5_Counter_OC5_Dwell
                ldab    TCTL1_TimerControlReg1
                orab    #3
                stab    TCTL1_TimerControlReg1
                ldab    #8
                stab    TFLG1_TimerInterruptFlag1
                ldd     TOC5_Counter_OC5_Dwell
                subd    #$20*ECLOCK
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_F0CB
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    AntiDwellTime_HB
                std     Temp5_t3

loc_F08D:                               ; ROM:F055↑j
                ldaa    TCTL1_TimerControlReg1
                bita    #1
                beq     loc_F0A9
                ldd     TOC5_Counter_OC5_Dwell
                addd    AntiDwellTime_HB
                std     TOC5_Counter_OC5_Dwell
                ldd     #$FE08
                anda    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    TFLG1_TimerInterruptFlag1

loc_F0A9:                               ; ROM:F092↑j
                ldd     Temp5_t3
                subd    TOC5_Counter_OC5_Dwell
                cpd     #$10
                bcs     loc_F0BB
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell

loc_F0BB:                               ; ROM:F0B3↑j
                ldd     TOC5_Counter_OC5_Dwell
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_F0CB
                bclr    <IPL1 2
                ldaa    #8
                staa    CFORC_TimerForceCompare

loc_F0CB:                               ; ROM:loc_F013↑J ROM:F05C↑j ...
                ldaa    <EngineRpm_HB
                cmpa    #$6D
                bcc     loc_F0E2
                cmpa    #$6A
                bcc     loc_F0D8
                bclr    <IPL1 4

loc_F0D8:                               ; ROM:F0D3↑j
                jsr     sub_E3C7
                std     <EngineRpm_HB
                jsr     sub_E43E
                bra     loc_F0E5
; ---------------------------------------------------------------------------

loc_F0E2:                               ; ROM:F0CF↑j
                bset    <IPL1 4

loc_F0E5:                               ; ROM:F0E0↑j
                clra
                brclr   <BitFlags66_t3 $40 loc_F0EF
                ldaa    <CounterUp_42
                inca
                beq     loc_F0F1

loc_F0EF:                               ; ROM:F0E6↑j
                staa    <CounterUp_42

loc_F0F1:                               ; ROM:F0ED↑j
                ldaa    <CounterUp_42
                cmpa    byte_81BB
                bcs     loc_F0FD
                bset    <IPL1 $10
                bra     loc_F100
; ---------------------------------------------------------------------------

loc_F0FD:                               ; ROM:F0F6↑j
                bclr    <IPL1 $10

loc_F100:                               ; ROM:F0FB↑j
                ldaa    <CounterDn_ba_o2
                beq     loc_F107
                deca
                staa    <CounterDn_ba_o2

loc_F107:                               ; ROM:F102↑j
                ldaa    <CounterDn_bb_o2
                beq     loc_F10E
                deca
                staa    <CounterDn_bb_o2

loc_F10E:                               ; ROM:F109↑j
                ldaa    <CounterDn_bc_o2
                beq     loc_F115
                deca
                staa    <CounterDn_bc_o2

loc_F115:                               ; ROM:F110↑j
                ldaa    <CounterDn_b9_o2
                beq     loc_F11C
                deca
                staa    <CounterDn_b9_o2

loc_F11C:                               ; ROM:F117↑j
                ldaa    <CounterUp_b6_o2
                inca
                beq     loc_F123
                staa    <CounterUp_b6_o2

loc_F123:                               ; ROM:F11F↑j
                clra
                brclr   <IPL1 1 loc_F12D
                ldaa    <CounterUp_43
                inca
                beq     loc_F12F

loc_F12D:                               ; ROM:F124↑j
                staa    <CounterUp_43

loc_F12F:                               ; ROM:F12B↑j
                ldaa    <CounterDn_b7_o2
                beq     loc_F136
                deca
                staa    <CounterDn_b7_o2

loc_F136:                               ; ROM:F131↑j
                ldaa    Counter_SomethingWithDistributor
                inca
                beq     loc_F13F
                staa    Counter_SomethingWithDistributor

loc_F13F:                               ; ROM:F13A↑j
                jmp     locret_F142
; ---------------------------------------------------------------------------

locret_F142:                            ; ROM:loc_F13F↑J
                                        ; ROM:loc_F13F↑t
                rti
; ---------------------------------------------------------------------------

loc_F143:                               ; ROM:EB88↑o
                brset   <IPL1 1 loc_F159
                ldaa    TCTL1_TimerControlReg1
                anda    #$FE
                staa    TCTL1_TimerControlReg1
                ldaa    #8
                staa    CFORC_TimerForceCompare
                bclr    <IPL1 2
                bra     loc_F185
; ---------------------------------------------------------------------------

loc_F159:                               ; ROM:loc_F143↑j
                bra     loc_F15B
; ---------------------------------------------------------------------------

loc_F15B:                               ; ROM:loc_F159↑j
                                        ; ROM:loc_F159↑t
                clra
                clrb
                bra     loc_F17A
; ---------------------------------------------------------------------------
                ldaa    <PIA3_Buffer_t3
                anda    #$BF
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldd     TIC1_Counter_IC1_CamSensor
                subd    Counter_IC1_Temp
                std     DoubleTempC
                ldx     #DoubleTempC
                ldd     byte_828E
                jsr     ScaleXbyB_somethingelse

loc_F17A:                               ; ROM:F15D↑j
                addd    TIC1_Counter_IC1_CamSensor
                std     TOC4_Counter_OC4
                ldaa    #$10
                staa    TFLG1_TimerInterruptFlag1

loc_F185:                               ; ROM:F157↑j
                ldaa    <CylinderPointer
                inca
                brset   <BitFlags27 $80 loc_F190
                cmpa    #6
                bra     loc_F192
; ---------------------------------------------------------------------------

loc_F190:                               ; ROM:F188↑j
                cmpa    #4

loc_F192:                               ; ROM:F18E↑j
                bcs     loc_F195
                clra

loc_F195:                               ; ROM:loc_F192↑j
                staa    <CylinderPointer
                brset   <BitFlags27 $80 loc_F1BA
                brclr   <BitFlags27 $40 loc_F1C3
                ldaa    <CylinderPointer
                beq     loc_F1BA
                cmpa    #3
                beq     loc_F1BA
                cmpa    #2
                beq     loc_F1C3
                cmpa    #5
                beq     loc_F1C3
                ldaa    <PIA3_Buffer_t3
                anda    #$FD
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     loc_F1C3
; ---------------------------------------------------------------------------

loc_F1BA:                               ; ROM:F197↑j ROM:F1A1↑j ...
                ldaa    <PIA3_Buffer_t3
                oraa    #2
                staa    <PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3

loc_F1C3:                               ; ROM:F19B↑j ROM:F1A9↑j ...
                brset   <IPL1 1 loc_F1CA
                jmp     loc_F293
; ---------------------------------------------------------------------------

loc_F1CA:                               ; ROM:loc_F1C3↑j
                brset   <BitFlags27 $80 loc_F1FF
                ldab    <EngineRpm_HB
                cmpb    #$1F
                bcc     loc_F1D7
                jmp     loc_F293
; ---------------------------------------------------------------------------

loc_F1D7:                               ; ROM:F1D2↑j
                ldaa    <AdvanceTemporary
                brclr   <BitFlags2d $80 loc_F1E8
                cmpa    <Ram_4D
                bcs     loc_F1E5
                ldaa    <Ram_4D
                bra     loc_F1E8
; ---------------------------------------------------------------------------

loc_F1E5:                               ; ROM:F1DF↑j
                bclr    <BitFlags2d $80

loc_F1E8:                               ; ROM:F1D9↑j ROM:F1E3↑j
                staa    <CalculatedSparkAdvance
                cmpa    #$50
                bcc     loc_F1F1
                jmp     loc_F293
; ---------------------------------------------------------------------------

loc_F1F1:                               ; ROM:F1EC↑j
                ldaa    #$F8
                suba    <CalculatedSparkAdvance
                psha
                ldab    #$11
                mul
                adca    #0
                pulb
                aba
                bra     loc_F22C
; ---------------------------------------------------------------------------

loc_F1FF:                               ; ROM:loc_F1CA↑j
                ldab    <EngineRpm_HB
                cmpb    #$1F
                bcs     loc_F21C
                ldaa    <AdvanceTemporary
                brclr   <BitFlags2d $80 loc_F216
                cmpa    <Ram_4D
                bcs     loc_F213
                ldaa    <Ram_4D
                bra     loc_F216
; ---------------------------------------------------------------------------

loc_F213:                               ; ROM:F20D↑j
                bclr    <BitFlags2d $80

loc_F216:                               ; ROM:F207↑j ROM:F211↑j
                staa    <CalculatedSparkAdvance
                cmpa    #$50
                bcc     loc_F21F

loc_F21C:                               ; ROM:F203↑j
                jmp     loc_F293
; ---------------------------------------------------------------------------

loc_F21F:                               ; ROM:F21A↑j
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

loc_F22C:                               ; ROM:F1FD↑j
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
                subd    #$0A
                std     Temp5_t3
                bset    <IPL1 2
                ldx     #TCTL1_TimerControlReg1
                subd    AntiDwellTime_HB
                std     DoubleTempB
                subd    TCNT_Counter_FreeRunning16bit
                bmi     loc_F265
                cpd     #$10*ECLOCK
                bmi     loc_F265
                ldaa    PORTA_PortA
                bita    #8
                beq     loc_F27D

loc_F265:                               ; ROM:F256↑j ROM:F25C↑j
                bset    0,x 3
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell
                bclr    0,x 1
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
                bra     loc_F293
; ---------------------------------------------------------------------------

loc_F27D:                               ; ROM:F263↑j
                bclr    0,x 1
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     DoubleTempB
                std     TOC5_Counter_OC5_Dwell
                bset    0,x 3
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1

loc_F293:                               ; ROM:F1C7↑J ROM:F1D4↑J ...
                ldaa    ADCTL_A2DControlReg
                bpl     loc_F293
                ldd     ADR3_A2DResults3
                staa    <O2SensorVolts
                stab    <LastTpsVolts
                cmpb    byte_89FB
                bcs     loc_F2AF
                cmpb    byte_89FC
                bcc     loc_F2AF
                brset   <b5C_IPL1_t3 $40 loc_F2AF
                stab    <TpsVolts

loc_F2AF:                               ; ROM:F2A2↑j ROM:F2A7↑j ...
                ldaa    ADR1_A2DResults1
                ldab    <EngineRpm_HB
                cmpb    #$2F
                bcc     loc_F2C6
                cmpb    #$D
                bcs     loc_F2C6
                cmpa    byte_8A08
                bcc     loc_F2CA
                cmpa    byte_8A07
                bcs     loc_F2CA

loc_F2C6:                               ; ROM:F2B6↑j ROM:F2BA↑j
                brclr   <b5C_IPL1_t3 $88 loc_F2CD

loc_F2CA:                               ; ROM:F2BF↑j ROM:F2C4↑j
                jsr     sub_D61E

loc_F2CD:                               ; ROM:loc_F2C6↑j
                jsr     sub_E3F8
                tab
                brclr   <IPL1 4 loc_F2DD
                addb    MapValue_t3
                rorb
                stab    <MapValue
                bra     loc_F2E2
; ---------------------------------------------------------------------------

loc_F2DD:                               ; ROM:F2D1↑j
                stab    MapValue_t3
                ldab    <MapValue

loc_F2E2:                               ; ROM:F2DB↑j
                ldaa    <BaroPressure
                sba
                bcc     loc_F2E8
                clra

loc_F2E8:                               ; ROM:F2E5↑j
                staa    <MapVolts
                jsr     sub_D818
                brclr   <IPL1 $40 loc_F336
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #8
                beq     loc_F2FB
                jsr     sub_F36D

loc_F2FB:                               ; ROM:F2F6↑j
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_F305
                jsr     sub_F363

loc_F305:                               ; ROM:F300↑j
                jsr     sub_C39F
                jsr     sub_C3D3
                jsr     sub_C579
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #8
                beq     loc_F318
                jsr     sub_F36D

loc_F318:                               ; ROM:F313↑j
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_F322
                jsr     sub_F363

loc_F322:                               ; ROM:F31D↑j
                jsr     sub_C5BA
                brclr   <IPL1 4 loc_F336
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_F333
                jsr     sub_F363

loc_F333:                               ; ROM:F32E↑j
                jsr     loc_C633

loc_F336:                               ; ROM:EC34↑J ROM:F2ED↑j ...
                clr     ATMOffset
                ldaa    <DRBPointer1
                cmpa    #$A
                bne     locret_F345
                clr     DRBPointer1
                bclr    <DRBSerialMode $30

locret_F345:                            ; ROM:EBA2↑J ROM:F33D↑j
                rti
; ---------------------------------------------------------------------------

PAII:                                   ; USER_VEC:FFDA↓o
                                        ; USER_VEC:FFDC↓o ...
                ldd     #$9E61
                anda    TMSK1_TimerInterruptMask1
                staa    TMSK1_TimerInterruptMask1
                stab    TFLG1_TimerInterruptFlag1
                ldd     #$0FF0
                anda    TMSK2_TimerInterruptMask2
                staa    TMSK2_TimerInterruptMask2
                stab    TFLG2_TimerInterruptFlag2
                rti

; =============== S U B R O U T I N E =======================================


nullsub_2:                              ; sub_C5F1+8B↑P sub_C5F1+E3↑P ...
                rts
; End of function nullsub_2

; ---------------------------------------------------------------------------

OC4I:                                   ; USER_VEC:FFE2↓o
                bsr     sub_F363
                rti

; =============== S U B R O U T I N E =======================================


sub_F363:                               ; sub_C5F1+7D↑P sub_C5F1+180↑P ...
                ldd     #TIC3_Counter_IC3_CrankSensor
                staa    TFLG1_TimerInterruptFlag1
                rts
; End of function sub_F363

; ---------------------------------------------------------------------------

I4_I5:                                  ; USER_VEC:FFE0↓o
                bsr     sub_F36D
                rti

; =============== S U B R O U T I N E =======================================


sub_F36D:                               ; sub_C5F1+54↑P sub_C5F1+C2↑P ...
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
                brclr   <BitFlags_BF_t3 $80 locret_F3AF
                ldab    <TimerOverflowsBetweenCamPulses
                bne     locret_F3AF
                brclr   <IPL1 1 locret_F3AF
                ldab    TCTL1_TimerControlReg1
                eorb    #1
                bitb    #1
                bne     loc_F38B
                brclr   <IPL1 2 locret_F3AF

loc_F38B:                               ; sub_F36D+18↑j
                stab    TCTL1_TimerControlReg1
                lsrb
                bcs     loc_F3B0
                ldab    #1
                ldaa    <CalculatedSparkAdvance
                cmpa    #$58
                bcc     loc_F39F
                incb
                cmpa    #$30
                bcc     loc_F39F
                incb

loc_F39F:                               ; sub_F36D+2A↑j sub_F36D+2F↑j
                ldaa    <BitFlags_BF_t3
                anda    #7
                cba
                bcs     loc_F3BA
                ldd     AntiDwellTime_HB

loc_F3A9:                               ; sub_F36D+4B↓j
                addd    TOC5_Counter_OC5_Dwell
                std     TOC5_Counter_OC5_Dwell

locret_F3AF:                            ; sub_F36D+5↑j sub_F36D+B↑j ...
                rts
; ---------------------------------------------------------------------------

loc_F3B0:                               ; sub_F36D+22↑j
                bclr    <IPL1 2
                ldd     <DistributorFallingEdgePulsewidth_HB
                subd    AntiDwellTime_HB
                bra     loc_F3A9
; ---------------------------------------------------------------------------

loc_F3BA:                               ; sub_F36D+37↑j
                ldab    TCTL1_TimerControlReg1
                orab    #3
                stab    TCTL1_TimerControlReg1
                rts
; End of function sub_F36D

; ---------------------------------------------------------------------------

IRQ:                                    ; USER_VEC:FFF2↓o
                ldx     TCNT_Counter_FreeRunning16bit
                ldab    #$06*ECLOCK
                abx

loc_F3C9:                               ; ROM:F3D5↓j
                ldaa    SwitchPortAccessReg2
                eora    PIA_Ctrl_2
                lsra
                bcs     loc_F421
                cpx     TCNT_Counter_FreeRunning16bit
                bpl     loc_F3C9
                ldaa    #$02
                ldab    SwitchPortAccessReg2
                lsrb
                bcc     loc_F3E6
                clra
                brset   <BitFlags27 $80 loc_F3E6
                ldaa    #5

loc_F3E6:                               ; ROM:F3DD↑j ROM:F3E0↑j
                brclr   <BitFlags_BF_t3 $80 loc_F3EE
                cmpa    <CylinderPointer
                bne     loc_F41B

loc_F3EE:                               ; ROM:loc_F3E6↑j
                ldab    #$84
                stab    <BitFlags_BF_t3
                brset   <BitFlags2b $40 loc_F3FC
                clr     KeyOnOrEngineRunningTime
                clr     Counter_MainLoop

loc_F3FC:                               ; ROM:F3F2↑j
                bset    <BitFlags2b $C0
                staa    <CylinderPointer
                brclr   <Ram_05 1 loc_F40F
                ldab    UNe_64B9
                addb    #$20
                bcs     loc_F40F
                stab    UNe_64B9

loc_F40F:                               ; ROM:F401↑j ROM:F40A↑j
                ldab    #1
                cmpa    #2
                beq     loc_F416
                clrb

loc_F416:                               ; ROM:F413↑j
                stab    PIA_Ctrl_2
                bra     loc_F421
; ---------------------------------------------------------------------------

loc_F41B:                               ; ROM:F3EC↑j
                bclr    <BitFlags_BF_t3 $80
                bclr    <BitFlags2b $80

loc_F421:                               ; ROM:F3D0↑j ROM:F419↑j
                ldaa    #1
                staa    PIA_Ctrl_4
                rti

 IF Code_start == $2A70
 OPT NOL
 ORG $B600
 REPEAT $200
 fcb $FF
 OPT LIS
 ENDIF
; ---------------------------------------------------------------------------
  ORG $FF9B
Copyright:      fcc "1993 COPYRIGHT CHRYSLER CORP."
                fcb $3F, $3F, $3F, $3F, $3F, $3F
                fcb $80
                fcb   2
; end of 'ROM'

; ===========================================================================

; Segment type: Pure data
                ; segment USER_VEC
                org $FFC0
RESERVFFC0:     fcb $3F
RESERVFFC1:     fcb $3F
RESERVFFC2:     fcb $3F
RESERVFFC3:     fcb $3F
RESERVFFC4:     fcb $3F
RESERVFFC5:     fcb $3F
RESERVFFC6:     fcb $3F
RESERVFFC7:     fcb $3F
RESERVFFC8:     fcb $3F
RESERVFFC9:     fcb $3F
RESERVFFCA:     fcb $3F
RESERVFFCB:     fcb $3F
RESERVFFCC:     fcb $3F
RESERVFFCD:     fcb $3F
RESERVFFCE:     fcb $3F
RESERVFFCF:     fcb $3F
RESERVFFD0:     fcb $3F
RESERVFFD1:     fcb $3F
RESERVFFD2:     fcb $3F
RESERVFFD3:     fcb $3F
RESERVFFD4:     fcb $3F
RESERVFFD5:     fcb $3F
                fdb SCISS
                fdb SPIE
                fdb PAII
                fdb PAII
                fdb PAII
                fdb I4_I5
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
                fdb __RESET

