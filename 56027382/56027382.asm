

Data_start equ $8000
Code_start equ $9400
BaseAddr equ $6000

 DCB.B Data_start, $00

#include defines.inc
 ORG Data_start
#include data.inc
 ORG Code_start
;;
XIRQ:
                ldab    #$01
                bra     loc_9416
;;
NOCOP:
                ldab    #$02
                bra     loc_9416
;;
OPC:
                ldab    #$04
                bra     loc_9416
;;
SCISS:
                ldab    #$10
                bra     loc_9416
;;
SPIE:
                ldab    #$20
                bra     loc_9416
;;
SOFT:
                ldab    #$40
loc_9416:
                sei
                orab    #$80
                stab    Temp0
                ldd     #$02A9
                staa    TMSK2_TimerInterruptMask2
                stab    OPTION_SysConfigOptionReg
                ldaa    #$F8
                staa    BPROT_BlockProtReg
                tsx
                ldd     $07,x
                std     Ram_01
                std     Temp1
                lds     #TopOfStack
                clr     MinimumTimerCountBeforeMainloopCanContinue
                clr     Ram_04
                bra     loc_94A2
;;
CME:
                sei
                lds     #TopOfStack
                ldd     #$02A9
                staa    TMSK2_TimerInterruptMask2
                stab    OPTION_SysConfigOptionReg
                ldaa    #$F8
                staa    BPROT_BlockProtReg
                clra
                clrb
                staa    Temp0
                std     Temp1
                ldx     #$0000
loc_945A:
                ldaa    $00,x
                cmpa    #$00
                bne     loc_9468
                inx
                cpx     #$0020
                bcs     loc_945A
                bra     loc_94A2
loc_9468:
                ldd     Counter_SpeedSensorInterrupt_HB
                tba
                comb
                std     MinimumTimerCountBeforeMainloopCanContinue
                bra     loc_94A2
;;
__RESET:
                sei
                lds     #TopOfStack
                ldd     #$02A9
                staa    TMSK2_TimerInterruptMask2
                stab    OPTION_SysConfigOptionReg
                ldaa    #$F8
                staa    BPROT_BlockProtReg
                clra
                clrb
                staa    Temp0
                std     Temp1
                ldd     Counter_SpeedSensorInterrupt_HB
                tba
                comb
                xgdy
                jsr     sub_E648
                cpd     MinimumTimerCountBeforeMainloopCanContinue
                beq     loc_949C
                ldy     #$0000
loc_949C:
                sty     MinimumTimerCountBeforeMainloopCanContinue
                bset    Ram_05, %00001010
loc_94A2:
                jsr     sub_E4F3
                ldaa    #$90
                tap
                ldab    #$0F
                ldaa    byte_8015
                bita    #%00001000
                beq     loc_94B3
                ldab    #$06
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
                staa    PIA3_Buffer_t3
                stab    PORTD_PortD
                ldd     #$88F
                staa    SwitchPortAccessReg1
                stab    PIA_Ctrl_1
                ldab    PIA_Ctrl_1
                andb    #$F7
                stab    PIA_Ctrl_1
                jsr     sub_E4FD
                jsr     sub_E4FD
                ldd     #$3A55
                staa    DDRD_PortD_DataDirection
                ldaa    SPSR_SerialPeripheralStatus
                stab    SPCR_SerialPeripheralControl
                jsr     sub_E4FD
                ldd     #$F870
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
                ldd     #$0C22
                staa    SCCR2_SerialControlReg2
                stab    BAUD_SerialBaudRate
                ldd     SCSR_SerialStatus
                jsr     sub_E4FD
                clr     SCCR1_SerialControlReg1
                ldx     #IPL1
                ldd     MinimumTimerCountBeforeMainloopCanContinue
                coma
                cba
                beq     loc_956D
                ldab    #$08
                ldaa    Temp0
                bpl     loc_9547
                ldab    #$80
loc_9547:
                stab    Ram_05
                anda    #$7F
                staa    Ram_00
                ldd     Temp1
                std     Ram_01
                ldaa    #$5C
                staa    LowestSessionTpsVolts
                ldaa    #$80
                staa    Timer_DacalCountdown
                staa    Ram_0B
                staa    ValueFromAdaptiveMemory
                ldaa    byte_88BA
                staa    Ram_0C
                ldd     #$40DF
                staa    BitFlags36_t3
                stab    CurrentAisPosition
                ldx     #$0E
loc_956D:
                ldy     #$0594
loc_9571:
                dey
                bne     loc_9571
                dex
                clrb
loc_9577:
                inx
                stab    $00,x
                cpx     #$FF
                bcs     loc_9577
                ldaa    byte_8015
                staa    BitFlags27
                ldx     #CountdownTimerFromKeyOn
                dex
                clrb
loc_9589:
                inx
                stab    $00,x
                cpx     #UNe_64B9
                bcs     loc_9589
                ldaa    #$E5
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                jsr     sub_E4FD
                ldy     #$0594
loc_959F:
                dey
                bne     loc_959F
                ldaa    #$14
                staa    ADCTL_A2DControlReg
loc_95A8:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_95A8
                ldaa    ADR1_A2DResults1
                staa    CoolantVoltsTmp2
                ldaa    PIA3_Buffer_t3
                anda    #$7F
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                jsr     sub_E4FD
                ldy     #$0476
loc_95C3:
                dey
                bne     loc_95C3
                ldaa    #$14
                staa    ADCTL_A2DControlReg
loc_95CC:
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
                ldx     #byte_E2ED
                jsr     sub_E372
                bra     loc_9606
loc_9604:
                ldaa    #$C1
loc_9606:
                staa    AmbientAirTempVolts2
                jsr     sub_BCD5
                jsr     sub_BCB0
                ldaa    PIA3_Buffer_t3
                oraa    #$10
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                jsr     sub_E4FD
                ldy     #$0594
loc_961E:
                dey
                bne     loc_961E
                ldaa    #$14
                staa    ADCTL_A2DControlReg
loc_9627:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_9627
                ldaa    ADR1_A2DResults1
                cmpa    #$40
                bcc     loc_963C
                ldaa    PIA3_Buffer_t3
                anda    #$EF
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
loc_963C:
                jsr     sub_E4FD
                ldy     #$0594
loc_9643:
                dey
                bne     loc_9643
                ldaa    #$14
                staa    ADCTL_A2DControlReg
loc_964C:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_964C
                ldaa    ADR1_A2DResults1
                staa    LastCoolantTempVolts
loc_9656:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_9656
                ldaa    ADR2_A2DResults2
                cmpa    #$40
                bcc     loc_966B
                ldaa    PIA3_Buffer_t3
                anda    #$DF
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
loc_966B:
                jsr     sub_E4FD
                ldy     #$0594
loc_9672:
                dey
                bne     loc_9672
                ldaa    #$14
                staa    ADCTL_A2DControlReg
loc_967B:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_967B
                ldab    ADR2_A2DResults2
                stab    LastChargeTempVolts
                ldaa    #$10
                staa    ADCTL_A2DControlReg
                jsr     sub_E4FD
loc_968D:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_968D
                ldd     ADR1_A2DResults1
                stab    BatteryVolts
                ldab    ADR4_A2DResults4
                stab    LastTpsVolts
                jsr     sub_E3F8
                staa    MapValue
                clrb
                std     MapValue2
                staa    MapValue_t3
                brclr   Ram_05, %00001000, loc_96B6
                cmpa    #$80
                bcc     loc_96B1
                ldaa    #$80
loc_96B1:
                staa    BaroPressure
                bclr    Ram_05, %00001000
loc_96B6:
                ldaa    ADR1_A2DResults1
                staa    MapVolts_X
                staa    MapValue3
                brclr   Ram_05, %00000010, loc_96E7
                brclr   Ram_05, %00000100, loc_96E7
                cmpa    byte_8A09
                bcc     loc_96E7
                ldab    #$02
loc_96CC:
                ldaa    #$10
                staa    ADCTL_A2DControlReg
loc_96D1:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_96D1
                ldaa    ADR1_A2DResults1
                cmpa    byte_8A09
                bcc     loc_96E7
                decb
                bne     loc_96CC
                bset    b5C_IPL1_t3, %00001000
                bset    BitFlags2e, %10000000
loc_96E7:
                bclr    Ram_05, %00000010
                ldaa    Ram_05
                anda    #$C0
                cmpa    #$80
                bne     loc_9708
                ldd     #$0AFF
                std     DRBPointer1
                ldaa    #$F1
                staa    LastCamFallingEdgeTime2
                ldab    #$FF
                ldaa    BitFlags27
                bita    #%11000000
                beq     loc_9720
                ldab    #$FB
                bra     loc_9720
loc_9708:
                ldaa    Ram_05
                adda    #$40
                staa    Ram_05
                ldaa    PIA_Ctrl_1
                oraa    #$04
                staa    PIA_Ctrl_1
                ldab    #$EF
                ldaa    BitFlags27
                bita    #%11000000
                beq     loc_9720
                ldab    #$EB
loc_9720:
                stab    PIA2_Buffer_t3
                ldaa    PIA3_Buffer_t3
                anda    #$FB
                staa    PIA3_Buffer_2_t3
                staa    PIA3_Buffer_t3
                cmpb    SPSR_SerialPeripheralStatus
                stab    SPDR_SerialPeripheralDataIO
                mul
                mul
                nop
                ldaa    PIA3_Buffer_t3
                oraa    #$04
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldab    SPCR_SerialPeripheralControl
                andb    #$FC
                stab    SPCR_SerialPeripheralControl
                jsr     sub_E4FD
                ldx     #$0535
loc_974B:
                ldaa    SwitchPortAccessReg1
                bita    #%00010000
                bne     loc_9755
                dex
                bne     loc_974B
loc_9755:
                jsr     sub_E4FD
                ldaa    PIA_Ctrl_1
                anda    #$FB
                staa    PIA_Ctrl_1
                ldaa    Timer_DelayBeforeUpdating_MINTHR
                oraa    #$03
                staa    Timer_DelayBeforeUpdating_MINTHR
                bset    Ram_05, %00000001
                bset    BitFlags24, %00010000
                bset    ACClutchToggleVar, %11111111
                bset    BitFlags66_t3, %00010000
                bset    BitFlags68_t3, %01000100
                bset    BitFlags36_t3, %00100000
                bclr    BitFlags36_t3, %00010000
                bset    CruiseStatus_1, %10100000
                ldaa    #$80
                staa    Counter_Cruise_1
                ldd     #$FFFF
                std     DistributorFallingEdgePulsewidth_HB
                std     Counter_TimerPastHalfwayBetweenCamPulses
                std     Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                std     SpeedoSensorPulsewidth_HB
                staa    Ram_4C
                ldaa    MapValue
                clrb
                std     MapValueTemp1
                std     MapValueTemp2
                std     MapValueTemp3
                ldaa    LastTpsVolts
                std     TPSVoltsTemp_A
                std     TPSVoltsTemp_B
                ldx     #$B616
                ldaa    $00,x
                cmpa    #$4A
                bne     loc_97B1
                coma
                cmpa    $01,x
                bne     loc_97B1
                bset    BitFlags2d, %00000100
loc_97B1:
                ldaa    LastCoolantTempVolts
                ldx     #byte_E27A
                brclr   PIA3_Buffer_t3, $00000010, loc_97BD
                ldx     #byte_E25F
loc_97BD:
                jsr     sub_E372
                staa    CoolantTemp
                ldaa    LastCoolantTempVolts
                cmpa    byte_89E8
                bcc     loc_97D2
                cmpa    byte_89E7
                bcs     loc_97D2
                ldaa    CoolantTemp
                bra     loc_97D5
loc_97D2:
                ldaa    byte_89E9
loc_97D5:
                staa    CoolantTemp
                ldx     #byte_E289
                jsr     sub_E372
                staa    CoolantTemp_fromTable_Scaled
                staa    PreviousCoolantTemp_fromTable_Scaled
                ldaa    LastChargeTempVolts
                ldx     #byte_E27A
                brclr   PIA3_Buffer_t3, %00100000, loc_97ED
                ldx     #byte_E25F
loc_97ED:
                jsr     sub_E372
                staa    ChargeTempVolts
                ldaa    LastChargeTempVolts
                cmpa    byte_89EB
                bcc     loc_9802
                cmpa    byte_89EA
                bcs     loc_9802
                ldaa    ChargeTempVolts
                bra     loc_9805
loc_9802:
                ldaa    byte_89EC
loc_9805:
                staa    ChargeTempVolts
                ldx     #byte_E2CA
                jsr     sub_E372
                staa    IntakeTemp_fromTable_Scaled
                ldaa    LastTpsVolts
                staa    TpsVolts
                ldab    LowestSessionTpsVolts
                addb    byte_8017
                cmpb    byte_801B
                bcs     loc_9826
                adda    #$06
                ldab    byte_801B
                cba
                bcc     loc_9826
                tab
loc_9826:
                stab    LowestSessionTpsVolts
                ldaa    CoolantTemp
                cmpa    byte_89DF
                bcs     loc_9834
                cmpa    byte_89E0
                bcs     loc_9837
loc_9834:
                bset    BitFlags6d_t3, %00000010
loc_9837:
                jsr     sub_C25C
                jsr     sub_BF66
                ldd     TCNT_Counter_FreeRunning16bit
                addd    #$03E8
                std     TOC1_Counter_OC1
                jsr     sub_E9F9
                ldaa    PIA3_Buffer_t3
                oraa    #$01
                staa    PIA3_Buffer_2_t3
                anda    #$FE
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldx     #byte_E25B
                ldab    BitFlags_36_t3
                abx
                ldab    $00,x
                tba
                comb
                aslb
                aslb
                aslb
                aslb
                anda    #$0F
                aba
                ldx     #PORTD_PortD
                bclr    $00,x, %00100000
                cmpa    SPSR_SerialPeripheralStatus
                staa    SPDR_SerialPeripheralDataIO
                ldaa    PIA3_Buffer_t3
                oraa    #$01
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                mul
                bset    $00,x, %00100000
                ldaa    #$BF
                ldab    byte_8016
                bitb    #%00100000
                beq     loc_9893
                ldab    byte_8015
                bitb    #%00000001
                beq     loc_9893
                anda    #$DF
loc_9893:
                staa    PIA1_Buffer_t3
                ldaa    SwitchPortAccessReg1
                oraa    #$01
                staa    SwitchPortAccessReg1
                ldx     #$0238
loc_98A0:
                dex
                bne     loc_98A0
                jsr     sub_D303
                cli
                ldd     TCNT_Counter_FreeRunning16bit
                std     MinimumTimerCountBeforeMainloopCanContinue2
                bra     loc_98BF
;;
off_98AF:       
                dw loc_996F
                dw loc_9978
                dw loc_99DC
                dw loc_9991
                dw loc_99DC
                dw loc_99B0
                dw loc_99C9
                dw loc_99DC
;;
loc_98BF:
                jsr     sub_E4E9
                ldaa    byte_8015
                staa    BitFlags27
                sei
                ldd     TCNT_Counter_FreeRunning16bit
                std     Temp0
                inc     Counter_MainLoop
                bne     loc_98E0
                bclr    Ram_05, %11000000
                bset    BitFlags6a_t3, %00000100
                ldaa    KeyOnOrEngineRunningTime
                inca
                beq     loc_98E0
                staa    KeyOnOrEngineRunningTime
loc_98E0:
                ldaa    #$10
                staa    ADCTL_A2DControlReg
                ldd     Temp0
                ldx     #$34
                ldy     #Temp5
                jsr     sub_E420
                cmpa    #$10
                bcs     loc_9914
                brset   BitFlags2e, %00010000, loc_9917
                bset    BitFlags2e, %00010000
                ldab    #$AA
                stab    TCTL1_TimerControlReg1
                ldab    #$78
                stab    CFORC_TimerForceCompare
                ldaa    UNe_64B9
                anda    #$E0
                staa    UNe_64B9
                bclr    BitFlags2b, %11000000
                bra     loc_9917
loc_9914:
                bclr    BitFlags2e, %00010000
loc_9917:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_9917
                ldaa    Counter_MainLoop
                lsra
                bcs     loc_9929
                lsra
                bcs     loc_9929
                ldaa    ADR2_A2DResults2
                staa    BatteryVolts
loc_9929:
                ldd     ADR3_A2DResults3
                staa    O2SensorVolts
                stab    LastTpsVolts
                ldaa    ADR1_A2DResults1
                cli
                jsr     sub_D64A
                ldaa    #$14
                sei
                staa    ADCTL_A2DControlReg
                ldd     TCNT_Counter_FreeRunning16bit
                lsld
                ldx     #$3C
                ldy     #Temp5
                jsr     sub_E420
loc_994B:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_994B
                ldx     #off_98AF
                ldab    Counter_MainLoop
                andb    #$07
                beq     loc_996F
                ldab    Counter_MainLoop
                orab    #$80
                cmpb    #$F8
                bcs     loc_99DC
                ldab    Ram_E2
                bne     loc_99DC
                ldab    Counter_MainLoop
                andb    #$07
                aslb
                abx
                ldx     $00,x
                jmp     $00,x
loc_996F:
                ldd     ADR1_A2DResults1
                staa    LastCoolantTempVolts
                stab    LastChargeTempVolts
                bra     loc_99DC
loc_9978:
                ldaa    PIA3_Buffer_t3
                anda    #$7F
                brclr   PIA3_Buffer_t3, %00010000, loc_9985
                bset    BitFlags23, %00001000
                bra     loc_9988
loc_9985:
                bclr    BitFlags23, %00001000
loc_9988:
                anda    #$EF
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     loc_99DC
loc_9991:
                ldaa    ADR1_A2DResults1
                cli
                cmpa    CoolantVoltsTmp1
                bne     loc_999F
                bset    BitFlags23, %00100000
                bra     loc_99A2
loc_999F:
                bclr    BitFlags23, %00100000
loc_99A2:
                staa    CoolantVoltsTmp1
                ldaa    PIA3_Buffer_t3
                oraa    #$80
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     loc_99DC
loc_99B0:
                ldaa    ADR1_A2DResults1
                cli
                staa    CoolantVoltsTmp2
                brclr   BitFlags23, %00100000, loc_99DC
                ldab    BitFlags66_t3
                bitb    #%00000011
                bne     loc_99DC
                jsr     sub_BC48
                jsr     sub_BCB0
                bra     loc_99DC
loc_99C9:
                ldaa    PIA3_Buffer_t3
                anda    #$7F
                brclr   BitFlags23, %00001000, loc_99D5
                oraa    #$10
                bra     loc_99D7
loc_99D5:
                anda    #$EF
loc_99D7:
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
loc_99DC:
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
                jsr     sub_C25C
                jsr     sub_BF66
                jsr     sub_C079
                jsr     sub_BBF2
                jsr     sub_9BD1
                jsr     sub_9C70
                jsr     sub_A2B6
                jsr     sub_A5B7
                jsr     sub_A6E6
                jsr     sub_B9BA
                jsr     sub_B9E3
                jsr     sub_9F91
                jsr     sub_DEC8
                ldaa    Counter_MainLoop
                bne     loc_9A2C
                jsr     sub_EA37
                jsr     sub_D592
loc_9A2C:
                ldaa    Counter_MainLoop
                lsra
                bcc     loc_9A4D
                lsra
                bcc     loc_9A42
                jsr     sub_B976
                jsr     sub_D7D7
                jsr     sub_C211
                jsr     sub_BCD5
                bra     loc_9A5F
loc_9A42:
                jsr     sub_A227
                jsr     sub_A24C
                jsr     sub_D545
                bra     loc_9A5F
loc_9A4D:
                jsr     sub_9B69
                jsr     sub_9ADD
                jsr     sub_E679
                jsr     sub_A130
                jsr     sub_A25F
                jsr     sub_D9B9
loc_9A5F:
                jsr     sub_9CF3
                jsr     sub_BD17
                jsr     sub_BF80
                jsr     sub_C09F
                jsr     sub_C10C
                jsr     sub_C1FF
                jsr     sub_D4F9
                ldaa    EngineRpm_HB
                cmpa    #$7D
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
loc_9A95:
                jsr     EmmissionMaintenanceReminder1_MM
                jsr     sub_C8AF
                jsr     sub_CAFE
                jsr     sub_CCF6
                jsr     sub_D303
                jsr     sub_D260
                jsr     sub_D5BA
                brset   BitFlags6a_t3, %01000000, loc_9AC4
                sei
                ldaa    CountdownTimerFromKeyOn
                bne     loc_9AC4
                ldd     MinimumTimerCountBeforeMainloopCanContinue
                cli
                coma
                cba
                beq     loc_9AC4
                jsr     sub_E70E
                ldd     Counter_SpeedSensorInterrupt_HB
                tba
                comb
                std     MinimumTimerCountBeforeMainloopCanContinue
loc_9AC4:
                cli
                jsr     sub_E542
loc_9AC8:
                ldd     TCNT_Counter_FreeRunning16bit
                subd    MinimumTimerCountBeforeMainloopCanContinue2
                cpd     #$0ABE
                bcs     loc_9AC8
                ldd     TCNT_Counter_FreeRunning16bit
                std     MinimumTimerCountBeforeMainloopCanContinue2
                jmp     loc_98BF
;;
sub_9ADD:
                ldab    byte_8807
                ldaa    PIA2_Buffer_t3
                bita    #%00000001
                beq     loc_9AEC
                subb    #$03
                bcc     loc_9AEC
                ldab    #$00
loc_9AEC:
                cmpb    TpsVolts_Minus_LowestSessionTpsVolts
                bcc     loc_9B06
                ldab    UNe_64AD
                cmpb    byte_8808
                bcc     loc_9B09
                ldaa    Counter_MainLoop
                bita    #%00000111
                bne     loc_9B04
                incb
                beq     loc_9B04
                stab    UNe_64AD
loc_9B04:
                bra     loc_9B59
loc_9B06:
                clr     UNe_64AD
loc_9B09:
                brclr   IPL1, %01000000, loc_9B59
                ldab    KeyOnOrEngineRunningTime
                cmpb    byte_880E
                bcs     loc_9B59
                brclr   BitFlags2d, %00000100, loc_9B28
                ldaa    EngineRpm_HB
                cmpa    #$20
                bcc     loc_9B59
                brset   StartupSwitchMirror1, %10000000, loc_9B59
                brclr   StartupSwitchMirror1, %01000000, loc_9B59
                bra     loc_9B60
loc_9B28:
                brset   BitFlags68_t3, %00001000, loc_9B59
                ldab    CoolantTemp
                cmpb    byte_8809
                bhi     loc_9B59
                ldx     EngineRpm_HB
                cpx     word_880A
                bcc     loc_9B59
                cpx     word_880C
                bcc     loc_9B67
                cpx     word_8804
                bcc     loc_9B4A
                ldab    byte_8806
                stab    STe_64AE
loc_9B4A:
                ldab    STe_64AE
                beq     loc_9B60
                ldaa    Counter_MainLoop
                bita    #%00000111
                bne     loc_9B59
                decb
                stab    STe_64AE
loc_9B59:
                sei
                ldaa    PIA2_Buffer_t3
                oraa    #$01
                bra     loc_9B65
loc_9B60:
                sei
                ldaa    PIA2_Buffer_t3
                anda    #$FE
loc_9B65:
                staa    PIA2_Buffer_t3
loc_9B67:
                cli
                rts
;;
sub_9B69:
                brset   PIA2_Buffer_t3, %00000001, loc_9B82
                brclr   BitFlags2d, %00000100, loc_9B82
                ldaa    Counter_ACControl1
                inca
                beq     loc_9B7F
                staa    Counter_ACControl1
                cmpa    byte_880F
                bcs     loc_9B82
loc_9B7F:
                bset    BitFlags2d, %00000010
loc_9B82:
                ldab    ACClutchToggleVar
                ldaa    BitFlags68_t3
                lsra
                eora    BitFlags68_t3
                bita    #%00100000
                beq     loc_9BBB
                brclr   BitFlags68_t3, %00100000, loc_9BA6
                cmpb    #$30
                bcs     loc_9B9B
                bclr    ACClutchToggleVar, %00000111
                bset    BitFlags68_t3, %01000000
loc_9B9B:
                ldaa    Counter_MainLoop
                bita    #%00011111
                bne     locret_9BD0
                addb    #$08
                bcc     loc_9BCE
                rts
loc_9BA6:
                brclr   ACClutchToggleVar, %00000111, loc_9BB1
                tba
                anda    #$07
                cmpa    #$05
                bls     loc_9BB8
loc_9BB1:
                cmpb    #$B8
                bcs     loc_9B9B
                bclr    BitFlags68_t3, %01000000
loc_9BB8:
                clrb
                bra     loc_9BCE
loc_9BBB:
                brset   ACClutchToggleVar, %00000111, loc_9BC2
                incb
                stab    ACClutchToggleVar
loc_9BC2:
                brset   BitFlags68_t3, %01000000, loc_9B9B
                cmpb    #$60
                bcs     loc_9B9B
                andb    #$07
                orab    #$60
loc_9BCE:
                stab    ACClutchToggleVar
locret_9BD0:
                rts
;;
sub_9BD1:
                ldaa    DRBPointer1
                cmpa    #$0A
                bne     loc_9BDB
                bset    PIA2_Buffer_t3, %00010000
                rts
loc_9BDB:
                cmpa    #$18
                bne     loc_9C28
                ldaa    DRBSerialMode
                bita    #%00110000
                bne     loc_9C28
                ldaa    TimerOverflowsBetweenCamPulses
                cmpa    #$50
                bls     loc_9C1A
                ldaa    DRBPointer2
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
                bset    BitFlags2d, %00010000
                tst     Counter_MainLoop
                bne     loc_9C0E
                deca
                beq     loc_9C1A
                andb    #$F0
                addb    #$10
                aba
                staa    DRBPointer2
loc_9C0E:
                ldaa    #$E1
                jsr     sub_CBA8
                sei
                ldaa    PIA2_Buffer_t3
                anda    #$EF
                bra     loc_9C5F
loc_9C1A:
                clra
                staa    DRBPointer1
                staa    ATMOffset
                bclr    BitFlags2d, %00010000
                bclr    DRBSerialMode, %00110000
                jsr     sub_CBA8
loc_9C28:
                ldx     #$2D
                ldaa    CoolantTemp
                cmpa    #$8F
                bcc     loc_9C34
                ldx     #$5B
loc_9C34:
                ldab    #$04
                ldaa    BatteryVolts
                cmpa    #$B2
                brset   BitFlags23, %00000100, loc_9C49
                bcc     loc_9C4D
                cpx     #$5B
                bne     loc_9C4D
                ldab    #$0B
                bra     loc_9C4D
loc_9C49:
                bcs     loc_9C4D
                ldab    #$03
loc_9C4D:
                sei
                ldaa    PIA2_Buffer_t3
                anda    #$EF
                cmpb    Counter_TimerPastHalfwayBetweenCamPulses
                bhi     loc_9C5F
                cpx     KeyOnOrEngineRunningTime
                bhi     loc_9C5F
                oraa    #$10
                bclr    Ram_80, %11111111
loc_9C5F:
                staa    PIA2_Buffer_t3
                cli
                brclr   IPL1, %01000000, locret_9C6F
                ldab    KeyOnOrEngineRunningTime
                cmpb    #$04
                bcs     locret_9C6F
                bset    BitFlags23, %00000100
locret_9C6F:
                rts
;;
sub_9C70:
                brclr   IPL1, %01000000, loc_9CE6
                ldaa    byte_8016
                bita    #%00000010
                beq     locret_9CF2
                ldaa    InjectorPulsewidth_HB
                ldab    EngineRpm_HB
                mul
                std     Temp0
                ldaa    BatteryVolts
                ldab    byte_8825
                mul
                subd    word_8821
                bcc     loc_9C91
                ldd     #$0000
loc_9C91:
                brclr   BitFlags27, %00001000, loc_9C9B
                brclr   PIA1_Buffer_t3, %10000000, loc_9CD9
                bra     loc_9CA7
loc_9C9B:
                brclr   PIA2_Buffer_t3, %00001000, loc_9CD9
                subd    word_8823
                bcc     loc_9CA7
                ldd     #$0000
loc_9CA7:
                cpd     Temp0
                bls     locret_9CF2
                brset   BitFlags2d, %01000000, loc_9CBD
                ldaa    BatteryVolts
                cmpa    byte_8826
                bls     locret_9CF2
                bset    BitFlags2d, %01000000
                bra     loc_9CCB
loc_9CBD:
                ldaa    BatteryVolts
                ldab    byte_8826
                addb    #$03
                bcc     loc_9CC8
                ldab    #$FF
loc_9CC8:
                cba
                bls     locret_9CF2
loc_9CCB:
                brclr   BitFlags27, %00001000, loc_9CD4
                bclr    PIA1_Buffer_t3, %10000000
                bra     locret_9CF2
loc_9CD4:
                bclr    PIA2_Buffer_t3, %00001000
                bra     locret_9CF2
loc_9CD9:
                cpd     Temp0
                bls     loc_9CE6
                ldaa    BatteryVolts
                cmpa    byte_8826
                bhi     locret_9CF2
loc_9CE6:
                brclr   BitFlags27, %00001000, loc_9CEF
                bset    PIA1_Buffer_t3, %10000000
                bra     locret_9CF2
loc_9CEF:
                bset    PIA2_Buffer_t3, %00001000
locret_9CF2:
                rts
;;
sub_9CF3:
                ldaa    byte_89DD
                bita    #%00001000
                bne     loc_9CFD
                jmp     loc_9DD9
loc_9CFD:
                brset   IPL1, %01000000, loc_9D0D
                ldaa    CoolantTemp
                cmpa    byte_8A3F
                bcc     loc_9D1C
                bset    BitFlags6d_t3, %10000000
                bra     loc_9D1C
loc_9D0D:
                ldaa    KeyOnOrEngineRunningTime
                cmpa    byte_8A40
                bcs     loc_9D1C
                brset   BitFlags6d_t3, %10000000, loc_9D1C
                brset   BitFlags29, %01000000, loc_9D1F
loc_9D1C:
                jmp     loc_9D7E
loc_9D1F:
                ldaa    b5C_IPL1_t3
                bne     loc_9D7E
                ldaa    MapVolts
                cmpa    byte_8A41
                bcs     loc_9D7E
                ldx     EGRVar3_ErrorCodeBufferHB
                brset   BitFlags6d_t3, %01000000, loc_9D9C
                cpx     word_8A49
                bcc     loc_9D8D
                ldaa    MapValue
                cmpa    byte_8A45
                bcs     loc_9D7E
                cmpa    byte_8A44
                bcc     loc_9D7E
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                cmpa    byte_8A43
                bcs     loc_9D7E
                cmpa    byte_8A42
                bcc     loc_9D7E
                ldaa    EngineRpm_HB
                cmpa    byte_8A47
                bcs     loc_9D7E
                cmpa    byte_8A46
                bcc     loc_9D7E
                ldaa    Counter_O2SensorFeedbackCount_Signed
                cmpa    byte_8A48
                bcc     loc_9D7E
                inx
                stx     EGRVar3_ErrorCodeBufferHB
                bset    BitFlags6d_t3, %00010000
                ldab    byte_8A51
                suba    EGRVar5_EGR_Temp_1
                bcs     loc_9D72
                mul
                adca    #$00
                bra     loc_9D77
loc_9D72:
                nega
                mul
                adca    #$00
                nega
loc_9D77:
                adda    EGRVar5_EGR_Temp_1
                staa    EGRVar5_EGR_Temp_1
                jmp     loc_9E14
loc_9D7E:
                ldx     #$0000
                stx     EGRVar3_ErrorCodeBufferHB
                bclr    BitFlags6d_t3, %01010000
                ldaa    Counter_O2SensorFeedbackCount_Signed
                staa    EGRVar5_EGR_Temp_1
                jmp     loc_9E14
loc_9D8D:
                ldx     #$0000
                bset    BitFlags6d_t3, %01000000
                bclr    BitFlags6d_t3, %00010000
                ldaa    EGRVar5_EGR_Temp_1
                staa    EGRVar6
                bra     loc_9DA1
loc_9D9C:
                cpx     word_8A53
                bcc     loc_9DE4
loc_9DA1:
                inx
                stx     EGRVar3_ErrorCodeBufferHB
                ldaa    MapValue
                cmpa    byte_8A4F
                bcs     loc_9D7E
                cmpa    byte_8A50
                bcc     loc_9D7E
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                cmpa    byte_8A4D
                bcs     loc_9D7E
                cmpa    byte_8A4E
                bcc     loc_9D7E
                ldaa    EngineRpm_HB
                cmpa    byte_8A4B
                bcs     loc_9D7E
                cmpa    byte_8A4C
                bcc     loc_9D7E
                ldaa    Counter_O2SensorFeedbackCount_Signed
                cmpa    EGRVar6
                bcs     loc_9E14
                staa    EGRVar6
                suba    EGRVar5_EGR_Temp_1
                staa    EGRVar7
                cmpa    byte_8A52
                bcs     loc_9E14
loc_9DD9:
                clr     EGRVar1_ErrorCodeCounter
                bset    BitFlags6d_t3, %10000000
                bclr    BitFlags6d_t3, %01110000
                bra     loc_9E14
loc_9DE4:
                ldx     #$0000
                stx     EGRVar3_ErrorCodeBufferHB
                ldab    BitFlags6d_t3
                andb    #$AF
                ldaa    EGRVar1_ErrorCodeCounter
                inca
                staa    EGRVar1_ErrorCodeCounter
                cmpa    byte_8A55
                bcs     loc_9E06
                orab    #$20
                pshb
                ldd     #$2E81
                jsr     ThrowNonCriticalError
                bcc     loc_9E05
                bset    b5D_IPL2_t3, %00001000
loc_9E05:
                pulb
loc_9E06:
                ldaa    EGRVar8
                inca
                staa    EGRVar8
                cmpa    byte_8A3E
                bcs     loc_9E12
                orab    #$80
loc_9E12:
                stab    BitFlags6d_t3
loc_9E14:
                brset   BitFlags6d_t3, %01000000, loc_9E72
                ldaa    Ram_CC
                beq     loc_9E1F
                dec     Ram_CC
loc_9E1F:
                brclr   BitFlags66_t3, %10000000, loc_9E69
                brset   BitFlags66_t3, %01000000, loc_9E69
                ldaa    byte_8817
                brset   PIA2_Buffer_t3, %00000010, loc_9E35
                suba    byte_8818
                bcc     loc_9E35
                ldaa    #$00
loc_9E35:
                cmpa    EngineRpm_HB
                bcs     loc_9E69
                ldaa    CoolantTemp
                cmpa    byte_8813
                bcs     loc_9E69
                ldaa    MapValue
                brset   PIA2_Buffer_t3, %00000010, loc_9E4C
                suba    byte_8811
                bcc     loc_9E4C
                clra
loc_9E4C:
                cmpa    byte_8812
                bcs     loc_9E69
                ldaa    BaroPressure
                suba    byte_8814
                bcc     loc_9E59
                clra
loc_9E59:
                cmpa    MapValue
                bcc     loc_9E76
                ldaa    BaroPressure
                suba    byte_8816
                bcc     loc_9E65
                clra
loc_9E65:
                cmpa    MapValue
                bcc     locret_9E82
loc_9E69:
                brclr   PIA2_Buffer_t3, %00000010, loc_9E72
                ldaa    byte_8815
                staa    Ram_CC
loc_9E72:
                bclr    PIA2_Buffer_t3, %00000010
                rts
loc_9E76:
                brset   PIA2_Buffer_t3, %00000010, loc_9E7F
                ldaa    byte_8815
                staa    Ram_CC
loc_9E7F:
                bset    PIA2_Buffer_t3, %00000010
locret_9E82:
                rts
;;
EmmissionMaintenanceReminder1_MM:
                brset   IPL1, %01000000, loc_9E8D
                brset   BitFlags6a_t3, %00000100, loc_9E9A
                bra     loc_9E9F
loc_9E8D:
                brset   BitFlags6a_t3, %01000000, locret_9ED4
                ldd     $B610
                cpd     #$5AA5
                beq     loc_9E9F
loc_9E9A:
                bclr    PIA1_Buffer_t3, %00001000
                bra     loc_9EA2
loc_9E9F:
                bset    PIA1_Buffer_t3, %00001000
loc_9EA2:
                brset   IPL1, %10000000, loc_9EA9
                jmp     loc_9F56
loc_9EA9:
                brset   BitFlags6a_t3, %01000000, locret_9ED4
                brclr   BitFlags6a_t3, %00100000, loc_9ED5
                jsr     sub_9F79
                stab    DRBOffsetStored_LB
                inc     DRBOffsetStored_HB
                bset    BitFlags6a_t3, %01000000
                bclr    BitFlags6a_t3, %00100000
                sei
                bclr    IPL1, %10000000
                cli
                cpd     #$2757
                beq     loc_9ED1
                cpd     #$3938
                bne     locret_9ED4
loc_9ED1:
                bset    BitFlags6a_t3, %00010000
locret_9ED4:
                rts
loc_9ED5:
                ldx     #$1C
                ldaa    #$30
loc_9EDA:
                brclr   $00,x, %11111111, loc_9EE8
                cmpa    $00,x
                beq     loc_9F38
                dex
                cpx     #$15
                bcc     loc_9EDA
loc_9EE8:
                ldd     #$0000
                std     Temp4
                staa    DRBOffsetStored_HB
                ldx     #$B600
                ldy     #$B60E
loc_9EF8:
                ldd     $00,x
                subd    $00,y
                cpd     #$0001
                bne     loc_9F14
                ldd     $00,x
                cpd     Temp4
                bcs     loc_9F14
                std     Temp4
                pshx
                pula
                pula
                staa    DRBOffsetStored_HB
loc_9F14:
                cpx     #$B60E
                beq     loc_9F2B
                inx
                inx
                cpy     #$B60E
                bne     loc_9F25
                ldy     #$B5FE
loc_9F25:
                iny
                iny
                bra     loc_9EF8
loc_9F2B:
                ldd     Temp4
                bne     loc_9F3E
                ldd     #$3003
                jsr     ThrowNonCriticalError
                bcc     locret_9F3D
loc_9F38:
                sei
                bclr    IPL1, %10000000
                cli
locret_9F3D:
                rts
loc_9F3E:
                ldaa    DRBOffsetStored_HB
                adda    #$02
                cmpa    #$10
                bne     loc_9F49
                ldaa    #$00
loc_9F49:
                staa    DRBOffsetStored_HB
                jsr     sub_9F79
                staa    DRBOffsetStored_LB
                bset    BitFlags6a_t3, %01100000
locret_9F55:
                rts
loc_9F56:
                brclr   BitFlags6a_t3, %00010000, locret_9F55
                brset   BitFlags6a_t3, %01000000, locret_9F55
                ldd     #$105A
                brclr   BitFlags6a_t3, %00100000, loc_9F6F
                inca
                comb
                bclr    BitFlags6a_t3, %00110000
                bset    BitFlags6a_t3, %01000000
                bra     loc_9F72
loc_9F6F:
                bset    BitFlags6a_t3, %01100000
loc_9F72:
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB
                rts
;;
sub_9F79:
                ldx     #$B600
                ldab    DRBOffsetStored_HB
                subb    #$02
                bpl     loc_9F85
                ldab    #$0E
loc_9F85:
                abx
                ldd     $00,x
                addd    #$0001
                bcc     locret_9F90
                ldd     #$FFFF
locret_9F90:
                rts
;;
sub_9F91:
                ldaa    byte_8016
                bita    #%10000000
                bne     loc_9F9B
loc_9F98:
                jmp     loc_A03F
loc_9F9B:
                brset   StartupSwitchMirror1, %00000001, loc_A01C
                ldab    b5d_IPL2
                bitb    #%10000000
                beq     loc_9FAB
                bita    #%00100000
                bne     loc_A01C
                bra     loc_9F98
loc_9FAB:
                ldaa    byte_882A
                brset   BitFlags2a, %01000000, loc_9FB5
                adda    byte_882B
loc_9FB5:
                cmpa    VehicleSpeedx8_Scaled
                bcc     loc_A019
                bset    BitFlags2a, %01000000
                ldaa    CoolantTemp
                cmpa    byte_8827
                bcs     loc_A01C
                ldaa    byte_882D
                brset   PIA1_Buffer_t3, %00010000, loc_9FCC
                adda    #$04
loc_9FCC:
                cmpa    ScaledDistPWForCruiseControl
                bcs     loc_A01C
                brclr   BitFlags68_t3, %00010000, loc_A01C
                ldaa    EngineRpm_HB
                cmpa    byte_8829
                bcs     loc_9FEF
                brclr   Ram_D0, %11111111, loc_9FEF
                ldaa    Counter_MainLoop
                bita    #%00000111
                bne     loc_9FEA
                dec     Ram_D0
                beq     loc_9FEF
loc_9FEA:
                ldx     #byte_885C
                bra     loc_9FF5
loc_9FEF:
                ldx     #byte_8845
                clr     Ram_D0
loc_9FF5:
                ldaa    EngineRpm_HB
                jsr     sub_E372
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                cba
                bcs     loc_A02D
                ldx     #byte_882E
                ldaa    EngineRpm_HB
                jsr     sub_E372
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                cba
                bcc     loc_A012
                brclr   PIA1_Buffer_t3, %00010000, loc_A03F
                bra     loc_A01F
loc_A012:
                ldaa    byte_8828
                staa    Ram_D0
                bra     loc_A01F
loc_A019:
                bclr    BitFlags2a, %01000000
loc_A01C:
                clr     Ram_D0
loc_A01F:
                ldaa    byte_882C
                staa    Ram_D1
loc_A024:
                bset    PIA1_Buffer_t3, %00010000
                clr     Ram_D3
loc_A02A:
                jmp     loc_A11C
loc_A02D:
                ldaa    Ram_D1
                beq     loc_A03C
                ldab    Counter_MainLoop
                bitb    #%00000111
                bne     loc_A024
                deca
                staa    Ram_D1
                bne     loc_A024
loc_A03C:
                bclr    PIA1_Buffer_t3, %00010000
loc_A03F:
                ldaa    byte_8016
                bita    #%01000000
                bne     loc_A049
                jmp     locret_A0DA
loc_A049:
                ldaa    Counter_MainLoop
                bita    #$01
                bne     loc_A059
                ldaa    Ram_D3
                cmpa    byte_887C
                beq     loc_A059
                inca
                staa    Ram_D3
loc_A059:
                ldaa    PTU_MapTemp
                staa    Temp5
                ldaa    Counter_MainLoop
                anda    byte_8874
                bne     loc_A069
                ldaa    MapValue
                staa    PTU_MapTemp
loc_A069:
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                beq     loc_A02A
                staa    Temp3
                ldaa    CoolantTemp
                cmpa    byte_8873
                bcs     loc_A02A
                brclr   BitFlags68_t3, %00010000, loc_A02A
                brclr   BitFlags66_t3, %10000000, loc_A02A
                brset   StartupSwitchMirror1, %00100000, loc_A02A
                ldaa    VehicleSpeedx8_Scaled
                cmpa    byte_8875
                bcc     loc_A099
                ldaa    MapValue
                suba    Temp5
                bcs     loc_A099
                cmpa    byte_8876
                bcs     loc_A0C8
                jmp     loc_A11C
loc_A099:
                ldaa    Temp5
                suba    MapValue
                bcs     loc_A0C8
                staa    Temp5
                ldx     #word_8878
                brset   BitFlags2a, %00100000, loc_A0BF
                brset   BitFlags2a, %00010000, loc_A0BE
                ldaa    Temp3
                cmpa    byte_8877
                bcs     loc_A0BB
                bset    BitFlags2a, %00100000
                bra     loc_A0BF
loc_A0BB:
                bset    BitFlags2a, %00010000
loc_A0BE:
                inx
loc_A0BF:
                ldab    Temp5
                cmpb    $00,x
                bcc     loc_A11C
                bra     loc_A0CB
loc_A0C8:
                bclr    BitFlags2a, %00110000
loc_A0CB:
                ldaa    Counter_PartThrottleUnlock
                cmpa    #$01
                bls     loc_A0DB
                ldab    Counter_MainLoop
                bitb    #%00000111
                bne     locret_A0DA
                deca
                staa    Counter_PartThrottleUnlock
locret_A0DA:
                rts
loc_A0DB:
                ldx     #byte_889B
                brclr   PIA1_Buffer_t3, %00100000, loc_A0E5
                ldx     #byte_887D
loc_A0E5:
                stx     Temp4
                bsr     sub_A126
                bcc     loc_A11C
                ldx     Temp4
                ldab    #$0F
                abx
                bsr     sub_A126
                bcs     loc_A11C
                ldaa    Counter_PartThrottleUnlock
                beq     loc_A10C
                ldaa    byte_8016
                bita    #%10000000
                beq     loc_A108
                ldaa    Ram_D3
                cmpa    byte_887C
                bcs     locret_A0DA
loc_A108:
                bclr    PIA1_Buffer_t3, %00100000
                rts
loc_A10C:
                ldaa    VehicleSpeedx8_Scaled
                ldab    byte_887A
                cmpa    byte_8875
                bcc     loc_A119
                ldab    byte_887B
loc_A119:
                stab    Counter_PartThrottleUnlock
                rts
loc_A11C:
                clr     Counter_PartThrottleUnlock
                bset    PIA1_Buffer_t3, %00100000
                bclr    BitFlags2a, %00110000
                rts
;;
sub_A126:
                ldaa    VehicleSpeedx8_Scaled
                jsr     sub_E372
                ldaa    Temp3
                cba
                rts
;;
sub_A130:
                ldaa    byte_8016
                bita    #%00100000
                beq     locret_A142
                ldaa    byte_8015
                bita    #%00000001
                beq     locret_A142
                brclr   Counter_MainLoop, %00000010, loc_A143
locret_A142:
                rts
loc_A143:
                ldaa    VehicleSpeedx8_Scaled
                cmpa    #$82
                bcc     loc_A174
                cmpa    byte_88B9
                bcs     loc_A174
                brset   BitFlags2a, %00000100, loc_A174
                ldaa    ScaledDistPWForCruiseControl
                cmpa    byte_88BA
                bcc     loc_A174
                cmpa    byte_88BB
                bcs     loc_A174
                ldab    Counter_MainLoop
                bne     loc_A177
                ldab    Ram_D0
                incb
                beq     loc_A16E
                stab    Ram_D0
                cmpb    byte_88BC
                bcs     loc_A177
loc_A16E:
                cmpa    Ram_0C
                bcc     loc_A174
                staa    Ram_0C
loc_A174:
                clr     Ram_D0
loc_A177:
                ldaa    EngineRpm_HB
                cmpa    #$0F
                bcs     loc_A1A6
                ldab    ScaledDistPWForCruiseControl
                subb    PTU_MapTemp
                bcc     loc_A184
                negb
loc_A184:
                cmpb    byte_88BD
                bcs     loc_A191
                bset    BitFlags2a, %00000100
                clr     Ram_D1
                bra     loc_A1B5
loc_A191:
                brclr   BitFlags2a, %00000100, loc_A1A9
                cmpb    byte_88BE
                bcc     loc_A1A9
                ldaa    Ram_D1
                inca
                beq     loc_A1A6
                staa    Ram_D1
                cmpa    byte_88BF
                bcs     loc_A1AC
loc_A1A6:
                bclr    BitFlags2a, %00000100
loc_A1A9:
                clr     Ram_D1
loc_A1AC:
                ldaa    Counter_MainLoop
                lsra
                lsra
                bita    byte_88C0
                bne     loc_A1B9
loc_A1B5:
                ldaa    ScaledDistPWForCruiseControl
                staa    PTU_MapTemp
loc_A1B9:
                brset   IPL1, %01000000, loc_A1C3
                brset   BitFlags6a_t3, %00000100, loc_A1C3
                bra     loc_A220
loc_A1C3:
                brclr   BitFlags66_t3, %10000000, loc_A214
                brclr   BitFlags66_t3, %01000000, loc_A1D2
                ldaa    EngineRpm_HB
                cmpa    byte_88C1
                bcc     loc_A214
loc_A1D2:
                ldaa    ScaledDistPWForCruiseControl
                suba    Ram_0C
                bcs     loc_A214
                cmpa    byte_88C2
                bcs     loc_A214
                ldx     #byte_88C3
                ldaa    MapValue
                jsr     sub_E3AA
                ldaa    EngineRpm_HB
                cba
                bcc     loc_A1FA
                brset   PIA1_Buffer_t3, %00100000, loc_A214
                subb    byte_88CC
                bcc     loc_A1F5
                ldab    #$00
loc_A1F5:
                cba
                bcc     loc_A206
                bra     loc_A214
loc_A1FA:
                ldaa    Ram_D3
                inca
                beq     loc_A206
                staa    Ram_D3
                cmpa    byte_88CD
                bcs     loc_A21A
loc_A206:
                ldaa    Counter_PartThrottleUnlock
                inca
                beq     loc_A21A
                staa    Counter_PartThrottleUnlock
                cmpa    byte_88CE
                bhi     loc_A21A
                bra     loc_A220
loc_A214:
                clr     Ram_D3
                clr     Counter_PartThrottleUnlock
loc_A21A:
                ldab    PIA1_Buffer_t3
                orab    #$20
                bra     loc_A224
loc_A220:
                ldab    PIA1_Buffer_t3
                andb    #$DF
loc_A224:
                stab    PIA1_Buffer_t3
                rts
;;
sub_A227:
                ldaa    byte_8016
                bita    #%00001000
                beq     locret_A24B
                ldaa    CoolantTemp
                cmpa    byte_881A
                bcc     loc_A245
                cmpa    byte_8819
                bcs     loc_A23E
                brset   BitFlags2a, %10000000, loc_A245
loc_A23E:
                bclr    BitFlags2a, %10000000
                bclr    PIA2_Buffer_t3, %00100000
                rts
loc_A245:
                bset    BitFlags2a, %10000000
                bset    PIA2_Buffer_t3, %00100000
locret_A24B:
                rts
;;
sub_A24C:
                ldaa    byte_8016
                bita    #%00010000
                beq     locret_A25E
                brset   BitFlags29, %01000000, loc_A25B
                bclr    PIA2_Buffer_t3, %00000100
                rts
loc_A25B:
                bset    PIA2_Buffer_t3, %00000100
locret_A25E:
                rts
;;
sub_A25F:
                ldaa    byte_8015
                bita    #%00001000
                bne     locret_A2B5
                ldaa    byte_8016
                bita    #%00000100
                beq     locret_A2B5
                brclr   IPL1, %01000000, loc_A2B2
                ldaa    Counter_MainLoop
                anda    #$7F
                bne     locret_A2B5
                brset   b5C_IPL1_t3, %00000010, loc_A2AD
                ldaa    BitFlags27
                bita    #%11000000
                beq     loc_A285
                brclr   PIA2_Buffer_t3, %00000001, loc_A2AD
loc_A285:
                ldx     #word_881D
                ldaa    VehicleSpeedx8_Scaled
                cmpa    byte_881B
                bcc     loc_A29F
                cmpa    byte_881C
                bcs     loc_A298
                brset   BitFlags2a, %00001000, loc_A29F
loc_A298:
                inx
                inx
                bclr    BitFlags2a, %00001000
                bra     loc_A2A2
loc_A29F:
                bset    BitFlags2a, %00001000
loc_A2A2:
                brset   PIA1_Buffer_t3, %10000000, loc_A2A7
                inx
loc_A2A7:
                ldab    $00,x
                cmpb    CoolantTemp
                bcc     loc_A2B2
loc_A2AD:
                bclr    PIA1_Buffer_t3, %10000000
                bra     locret_A2B5
loc_A2B2:
                bset    PIA1_Buffer_t3, %10000000
locret_A2B5:
                rts
;;
sub_A2B6:
                brclr   IPL1, %01000000, loc_A2C3
                ldaa    Timer_AisChanges
                inca
                beq     loc_A2C6
                staa    Timer_AisChanges
                bra     loc_A2C6
loc_A2C3:
                clr     Timer_AisChanges
loc_A2C6:
                brset   BitFlags68_t3, %10000000, loc_A2D2
                brclr   BitFlags6d_t3, %00001000, loc_A2D5
                ldaa    #$30
                bra     loc_A34D
loc_A2D2:
                jmp     loc_A352
loc_A2D5:
                ldx     #byte_8711
                brset   BitFlags68_t3, %00010000, loc_A324
                ldaa    DRBPointer1
                cmpa    #$19
                beq     loc_A2F4
                brclr   BitFlags6d_t3, %00000001, loc_A304
                ldd     TargetIdleSpeedHB
                subd    #$0001
                bitb    #%00111111
                bne     loc_A350
                bclr    BitFlags6d_t3, %00000001
                bra     loc_A350
loc_A2F4:
                brset   DRBSerialMode, %00100000, loc_A352
                clr     DRBPointer1
                ldaa    DRBPointer2
                ldab    #$FF
                bset    BitFlags6d_t3, %00000001
                bra     loc_A34E
loc_A304:
                brclr   BitFlags2d, %00000100, loc_A316
                brclr   IPL1, %01000000, loc_A316
                ldaa    KeyOnOrEngineRunningTime
                cmpa    #$08
                bcs     loc_A316
                ldaa    #$70
                bra     loc_A34D
loc_A316:
                ldaa    byte_8730
                brset   BitFlags2a, %00000001, loc_A34D
                brset   b5C_IPL1_t3, %00000010, loc_A34D
                ldx     #byte_86FE
loc_A324:
                ldaa    CoolantTemp
                jsr     sub_E372
                brset   KeyOnOrEngineRunningTime, %11111111, loc_A33C
                psha
                ldaa    KeyOnOrEngineRunningTime
                ldx     #byte_8724
                jsr     sub_E372
                pulb
                aba
                bcc     loc_A33C
                ldaa    #$FF
loc_A33C:
                ldab    BitFlags27
                bitb    #%11000000
                beq     loc_A34D
                brclr   StartupSwitchMirror1, %01000000, loc_A34D
                ldab    byte_872F
                cba
                bcc     loc_A34D
                tba
loc_A34D:
                clrb
loc_A34E:
                lsrd
                lsrd
loc_A350:
                std     TargetIdleSpeedHB
loc_A352:
                ldaa    ATMOffset
                cmpa    #$07
                beq     locret_A39C
                cmpa    #$14
                beq     locret_A39C
                brset   BitFlags36_t3, %00100000, loc_A364
                brset   IPL1, %01000000, loc_A38C
loc_A364:
                ldaa    DesiredNewAisPosition
                cmpa    CurrentAisPosition
                bne     loc_A371
                brset   BitFlags36_t3, %01000000, loc_A371
                bclr    BitFlags36_t3, %00100000
loc_A371:
                ldaa    CoolantTemp
                ldx     #byte_8688
                jsr     sub_E372
                psha
                ldaa    BaroPressure
                ldx     #byte_869B
                jsr     sub_E372
                pulb
                aba
                bcc     loc_A389
                jmp     loc_A4F9
loc_A389:
                jmp     loc_A4EB
loc_A38C:
                brclr   b5C_IPL1_t3, %10001000, loc_A3A1
                ldaa    byte_8A3D
                staa    DesiredNewAisPosition
                brclr   BitFlags68_t3, %01000000, loc_A39D
                bset    BitFlags68_t3, %00001100
locret_A39C:
                rts
loc_A39D:
                bclr    BitFlags68_t3, %00001100
                rts
loc_A3A1:
                jsr     sub_A531
                dex
                bne     loc_A3A8
                rts
loc_A3A8:
                brclr   BitFlags68_t3, %00000010, loc_A3DE
                ldx     #byte_875A
                ldaa    BaroPressure
                brclr   StartupSwitchMirror1, %00000001, loc_A3B8
                ldx     #byte_8764
loc_A3B8:
                jsr     sub_E3AA
                tba
                brclr   StartupSwitchMirror1, %00000001, loc_A3CA
                nega
                brclr   BitFlags2d, %00100000, loc_A3DA
                bclr    BitFlags2d, %00100000
                bra     loc_A3D4
loc_A3CA:
                ldab    EngineRpm_HB
                cmpb    byte_8763
                bcc     loc_A3DA
                bset    BitFlags2d, %00100000
loc_A3D4:
                jsr     sub_A517
                clra
                staa    Timer_AisChanges
loc_A3DA:
                bclr    BitFlags68_t3, %00000010
                rts
loc_A3DE:
                brclr   BitFlags66_t3, %10000000, loc_A3F9
                brset   BitFlags27, %00000001, loc_A3E9
                bclr    BitFlags68_t3, %10000000
loc_A3E9:
                brclr   StartupSwitchMirror1, %00100000, loc_A3FD
                ldx     #byte_867D
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                jsr     sub_E372
                cmpa    EngineRpm_HB
                bcc     loc_A3FD
loc_A3F9:
                brclr   BitFlags66_t3, %00100000, loc_A400
loc_A3FD:
                jmp     loc_A465
loc_A400:
                brset   BitFlags66_t3, %00000100, locret_A39C
                ldab    Timer_CountdownFromStartRunForAisFeedback
                bne     locret_A39C
                ldaa    DesiredNewAisPosition
                cmpa    #$04
                bcs     loc_A411
                bclr    BitFlags36_t3, %00010000
loc_A411:
                brclr   BitFlags68_t3, %10000000, loc_A42D
                ldx     #byte_8773
                brclr   StartupSwitchMirror1, %00010000, loc_A41F
                ldx     #byte_877E
loc_A41F:
                ldaa    CoolantTemp
                jsr     sub_E372
                jsr     sub_A517
                clra
                staa    Timer_AisChanges
                bclr    BitFlags68_t3, %10000000
loc_A42D:
                ldab    byte_876D
                cmpb    Timer_AisChanges
                bcc     locret_A464
                ldx     #byte_8731
                ldd     TargetIdleSpeedHB
                subd    EngineRpm_HB
                bcc     loc_A444
                ldx     #byte_8744
                ldd     EngineRpm_HB
                subd    TargetIdleSpeedHB
loc_A444:
                lsrd
                lsrd
                brset   BitFlags27, %00000001, loc_A44E
                brset   BitFlags68_t3, %00010000, loc_A44F
loc_A44E:
                lsrd
loc_A44F:
                tsta
                beq     loc_A454
                ldab    #$FF
loc_A454:
                tba
                cmpa    $01,x
                bcs     locret_A464
                jsr     sub_E372
                beq     locret_A464
                jsr     sub_A517
                clra
                staa    Timer_AisChanges
locret_A464:
                rts
loc_A465:
                ldaa    CoolantTemp
                ldx     #byte_86BB
                jsr     sub_E372
                staa    Temp5
                ldaa    KeyOnOrEngineRunningTime
                ldx     #byte_86CA
                jsr     sub_E372
                adda    Temp5
                bcc     loc_A480
                jmp     loc_A4F9
loc_A480:
                staa    Temp5
                ldaa    BaroPressure
                ldx     #byte_86F3
                jsr     sub_E372
                ldaa    Temp5
                mul
                lsld
                bcs     loc_A4F9
                lsld
                bcs     loc_A4F9
                staa    Temp5
                ldx     #byte_86E4
                ldaa    EngineRpm_HB
                jsr     sub_E372
                cmpa    Temp5
                bcs     loc_A4A8
                staa    Temp5
loc_A4A8:
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                ldx     #byte_86D5
                jsr     sub_E372
                cmpa    Temp5
                bcc     loc_A4B8
                ldaa    Temp5
loc_A4B8:
                brset   BitFlags68_t3, %00000100, loc_A4E2
                ldab    byte_86A6
                brset   BitFlags66_t3, %00100000, loc_A4DF
                psha
                ldaa    CoolantTemp
                cmpa    byte_86A7
                bcs     loc_A4DE
                ldx     #byte_86AB
                ldaa    VehicleSpeedx8_Scaled
                jsr     sub_E372
                brclr   BitFlags68_t3, %00001000, loc_A4DE
                ldaa    byte_86A9
                mul
                adca    #$00
                tab
loc_A4DE:
                pula
loc_A4DF:
                aba
                bcs     loc_A4F9
loc_A4E2:
                brset   BitFlags68_t3, %00010000, loc_A4EB
                adda    byte_86BA
                bcs     loc_A4F9
loc_A4EB:
                brset   BitFlags36_t3, %00010000, loc_A4F4
                adda    byte_8772
                bcs     loc_A4F9
loc_A4F4:
                cmpa    byte_876E
                bcs     loc_A4FC
loc_A4F9:
                ldaa    byte_876E
loc_A4FC:
                brset   BitFlags66_t3, %00100000, loc_A511
                cmpa    DesiredNewAisPosition
                bcc     loc_A50E
                ldab    Counter_MainLoop
                bitb    byte_8771
                bne     locret_A510
                ldaa    DesiredNewAisPosition
                deca
loc_A50E:
                staa    DesiredNewAisPosition
locret_A510:
                rts
loc_A511:
                bclr    BitFlags66_t3, %00100000
                staa    DesiredNewAisPosition
                rts
;;
sub_A517:
                inx
                tsta
                bmi     loc_A529
                adda    DesiredNewAisPosition
                ldab    byte_876E
                bcs     loc_A525
                cba
                bcs     loc_A526
loc_A525:
                tba
loc_A526:
                staa    DesiredNewAisPosition
                rts
loc_A529:
                adda    DesiredNewAisPosition
                bcs     loc_A52E
                clra
loc_A52E:
                staa    DesiredNewAisPosition
                rts
;;
sub_A531:
                ldx     #$00
                ldab    BitFlags68_t3
                andb    #$04
                stab    Temp4
                ldab    BitFlags68_t3
                andb    #$40
                lsrb
                lsrb
                lsrb
                lsrb
                eorb    Temp4
                bne     loc_A565
                brset   BitFlags68_t3, %00000100, loc_A5B3
                ldaa    Timer_AisOrO2Sensor
                beq     loc_A561
                clrb
                stab    Timer_AisChanges
                deca
                staa    Timer_AisOrO2Sensor
                bne     loc_A5B3
                brset   BitFlags66_t3, %10000000, loc_A561
                ldaa    byte_8758
                bsr     sub_A517
loc_A561:
                bclr    BitFlags68_t3, %00001000
                rts
loc_A565:
                ldaa    KeyOnOrEngineRunningTime
                cmpa    byte_880E
                bcs     loc_A5B3
                eorb    BitFlags68_t3
                stab    BitFlags68_t3
                bitb    #$04
                bne     loc_A58C
                ldaa    byte_86A8
                staa    Timer_AisOrO2Sensor
                brset   BitFlags66_t3, %10000000, loc_A583
                ldaa    byte_8757
                jsr     sub_A517
loc_A583:
                ldaa    Timer_AisOrO2Sensor
                beq     loc_A5B0
                deca
                staa    Timer_AisOrO2Sensor
                bra     loc_A5B0
loc_A58C:
                brset   BitFlags66_t3, %10000000, loc_A598
                ldaa    byte_8759
                jsr     sub_A517
                bra     loc_A5AD
loc_A598:
                ldx     #byte_86AB
                ldaa    VehicleSpeedx8_Scaled
                jsr     sub_E372
                ldab    byte_86AA
                mul
                tab
                ldaa    DesiredNewAisPosition
                sba
                bcc     loc_A5AB
                clra
loc_A5AB:
                staa    DesiredNewAisPosition
loc_A5AD:
                clra
                staa    Timer_AisOrO2Sensor
loc_A5B0:
                clra
                staa    Timer_AisChanges
loc_A5B3:
                bset    BitFlags68_t3, %00001000
                rts
sub_A5B7:
                brclr   IPL1, %01000000, locret_A5CD
                brset   BitFlags36_t3, %00100000, locret_A5CD
                brset   BitFlags66_t3, %10000000, locret_A5CD
                ldaa    b5C_IPL1_t3
                bita    #%10001000
                bne     locret_A5CD
                ldaa    TimerOverflowsBetweenCamPulses
                beq     loc_A5CE
locret_A5CD:
                rts
loc_A5CE:
                ldaa    Timer_DacalCountdown
                lsra
                lsra
                adda    byte_8801
                bcs     loc_A617
                psha
                ldx     #byte_8789
                ldaa    BaroPressure
                jsr     sub_E372
                pula
                aslb
                bcc     loc_A5EC
                clc
                lsrb
                sba
                bcc     loc_A5F0
                clra
                bra     loc_A5F0
loc_A5EC:
                lsrb
                aba
                bcs     loc_A617
loc_A5F0:
                brclr   BitFlags66_t3, %00000100, loc_A619
                psha
                ldx     #byte_879C
                ldaa    KeyOnOrEngineRunningTime
                jsr     sub_E372
                pula
                aba
                bcs     loc_A617
                psha
                ldx     #byte_87A7
                ldaa    CoolantTemp
                jsr     sub_E372
                pulb
                aba
                bcs     loc_A617
                brset   PIA2_Buffer_t3, %00000001, loc_A619
                adda    byte_8800
                bcc     loc_A619
loc_A617:
                ldaa    #$FF
loc_A619:
                ldab    DistributorFallingEdgePulsewidth_HB
                aslb
                bcs     loc_A621
                aslb
                bcc     loc_A623
loc_A621:
                ldab    #$FF
loc_A623:
                mul
                lsld
                bcs     loc_A652
                staa    Temp5
                ldx     #byte_87BA
                ldaa    EngineRpm_HB
                jsr     sub_E372
                psha
                ldx     #byte_87D4
                ldaa    CoolantTemp
                jsr     sub_E372
                pulb
                mul
                adca    Temp5
                bcs     loc_A652
                staa    Temp5
                ldx     #byte_87C9
                ldaa    BaroPressure
                jsr     sub_E372
                adda    Temp5
                bcc     loc_A654
loc_A652:
                ldaa    #$FF
loc_A654:
                staa    MAPOffsetForCylTrim
                brset   BitFlags66_t3, %00000100, loc_A6C0
                brset   BitFlags27, %00000001, loc_A662
                brclr   StartupSwitchMirror1, %00010000, locret_A6BF
loc_A662:
                ldab    Counter_MainLoop
                bitb    byte_8803
                bne     locret_A6BF
                ldab    KeyOnOrEngineRunningTime
                cmpb    byte_8802
                bcs     locret_A6BF
                brclr   PIA2_Buffer_t3, %00000001, locret_A6BF
                ldab    Timer_CountdownFromStartRunForAisFeedback
                bne     locret_A6BF
                ldab    CoolantTemp
                cmpb    byte_87FE
                bcs     locret_A6BF
                ldab    TargetIdleSpeedHB
                subb    EngineRpm_HB
                bcc     loc_A686
                negb
loc_A686:
                cmpb    byte_87FF
                bhi     locret_A6BF
                ldab    Timer_DacalCountdown
                cmpa    MapValue
                bhi     loc_A694
                incb
                bne     loc_A698
loc_A694:
                tstb
                beq     loc_A69A
                decb
loc_A698:
                stab    Timer_DacalCountdown
loc_A69A:
                brset   BitFlags27, %00000001, loc_A6A2
                brclr   BitFlags68_t3, %00010000, locret_A6BF
loc_A6A2:
                ldaa    Timer_AisChanges
                cmpa    byte_876D
                bcs     locret_A6BF
                ldaa    CurrentAisPosition
                cmpa    DesiredNewAisPosition
                bne     locret_A6BF
                ldaa    DesiredNewAisPosition
                cmpa    byte_8772
                beq     locret_A6BF
                bhi     loc_A6BA
                inca
                inca
loc_A6BA:
                deca
                staa    DesiredNewAisPosition
                staa    CurrentAisPosition
locret_A6BF:
                rts
loc_A6C0:
                ldab    Timer_CountdownFromStartRunForAisFeedback
                bne     locret_A6BF
                ldab    Timer_AisChanges
                cmpb    byte_87FD
                bcs     locret_A6BF
                ldx     #byte_87DF
                suba    MapValue
                bcc     loc_A6D6
                nega
                ldx     #byte_87EE
loc_A6D6:
                jsr     sub_E372
                jsr     sub_A517
                staa    DesiredNewAisPosition
                cmpa    CurrentAisPosition
                beq     locret_A6BF
                clr     Timer_AisChanges
                rts
;;
sub_A6E6:
                brset   BitFlags66_t3, %00000100, locret_A705
                ldaa    b5C_IPL1_t3
                bita    #%10001000
                bne     locret_A705
                ldaa    DesiredNewAisPosition
                oraa    CurrentAisPosition
                bne     locret_A705
                ldab    Counter_MainLoop
                bitb    #%01111111
                bne     locret_A705
                adda    #$02
                staa    CurrentAisPosition
                staa    DesiredNewAisPosition
                bset    BitFlags36_t3, %00010000
locret_A705:
                rts
;;
sub_A706:
                bclr    Counter_Cruise_1, %00001111
                brset   StartupSwitchMirror1, %00000100, loc_A712
                clrb
                stab    CruiseSpeedSetpoint
                bra     loc_A770
loc_A712:
                inc     Counter_Cruise_1
                ldd     VehicleSpeed_HB
                lsld
                lsld
                lsld
                aslb
                adca    #$00
                staa    Temp0
                cmpa    byte_88DA
                bcs     loc_A767
                inc     Counter_Cruise_1
                ldaa    EngineRpm_HB
                cmpa    byte_88DB
                bcc     loc_A767
                inc     Counter_Cruise_1
                brset   StartupSwitchMirror1, %00100000, loc_A767
                inc     Counter_Cruise_1
                brset   BitFlags27, %00000001, loc_A749
                brclr   StartupSwitchMirror1, %00010000, loc_A767
                inc     Counter_Cruise_1
                inc     Counter_Cruise_1
                bra     loc_A799
loc_A749:
                inc     Counter_Cruise_1
                ldaa    TimerOverflowsBetweenCamPulses
                bne     loc_A75C
                ldab    ScaledDistPWForCruiseControl
                cmpb    byte_88D8
                bcc     loc_A767
                cmpb    byte_88D9
                bcs     loc_A767
loc_A75C:
                inc     Counter_Cruise_1
                brset   CruiseStatus_1, %10000000, loc_A799
                brclr   BitFlags24, %00001000, loc_A799
loc_A767:
                brclr   CruiseStatus_1, %00011000, loc_A770
                ldaa    Temp0
                staa    CruiseSpeedSetpoint
loc_A770:
                brset   CruiseStatus_1, %10000000, loc_A77D
                ldab    Counter_Cruise_1
                andb    #$0F
                ldaa    #$11
                mul
                stab    Counter_Cruise_1
loc_A77D:
                clrb
                stab    Timer_CruiseDecelerate
                stab    Counter_Cruise_4
                stab    CruiseControlVar0
                stab    Counter_Cruise_2
                stab    CruiseControlVar6
                stab    CruiseControlVar1
                bclr    CruiseStatus_1, %00011111
                bset    CruiseStatus_1, %10100000
                bclr    CruiseStatus_2, %00001111
                bset    Timer_CruiseDecelerate, %10000000
                jmp     loc_A951
loc_A799:
                inc     Counter_Cruise_1
                ldaa    Temp1_t3
                tab
                eora    PIA2_Buffer_t3_Temp
                anda    #$C0
                beq     loc_A7FE
                brset   BitFlags6a_t3, %00000001, loc_A7FE
                bita    #%01000000
                bne     loc_A7B0
                lsrb
loc_A7B0:
                ldaa    #$00
                bitb    #%01000000
                bne     loc_A7EC
                brset   CruiseStatus_1, %10000000, loc_A7E1
                ldaa    Temp0
                psha
                ldd     #$0F89
                jsr     ThrowNonCriticalError
                pula
                staa    Temp0
                ldd     #$F08
                ldx     #$DC
                cmpa    $00,x
                beq     loc_A7D7
                inx
                cmpa    $00,x
                bne     loc_A7FE
loc_A7D7:
                cmpb    $02,x
                bne     loc_A7FE
                clr     $00,x
                clr     $02,x
                bra     loc_A767
loc_A7E1:
                ldaa    #$07
                ldab    Temp1_t3
                bitb    #%11000000
                bne     loc_A7EC
                ldaa    #$7F
loc_A7EC:
                bita    Counter_MainLoop
                bne     loc_A7FE
                ldaa    Temp0
                psha
                ldd     #$0F10
                jsr     ThrowNonCriticalError
                pula
                staa    Temp0
loc_A7FE:
                inc     Counter_Cruise_1
                brset   StartupSwitchMirror1, %00000010, loc_A85B
                ldab    Timer_CruiseDecelerate
                incb
                bne     loc_A80B
                decb
loc_A80B:
                stab    Timer_CruiseDecelerate
                brset   CruiseStatus_1, %00000001, loc_A82C
                brset   Timer_CruiseDecelerate, %10000000, loc_A836
                cmpb    #$04
                bls     loc_A836
                bset    CruiseStatus_1, %00100001
                bclr    CruiseStatus_1, %00001010
                bset    CruiseStatus_2, %00000100
                clra
                staa    Counter_Cruise_4
                staa    CruiseControlVar0
                bclr    CruiseStatus_1, %00000100
                bra     loc_A836
loc_A82C:
                brset   CruiseStatus_1, %10000000, loc_A836
                brset   CruiseStatus_1, %00010000, loc_A849
                bra     loc_A839
loc_A836:
                jmp     loc_AA61
loc_A839:
                cmpb    byte_88D1
                bls     loc_A836
                bset    CruiseStatus_1, %00010000
                bclr    CruiseStatus_2, %00000011
                ldaa    Temp0
                staa    CruiseControlVar0
loc_A849:
                ldab    CruiseStatus_2
                cmpb    #$A0
                bcs     loc_A836
                ldab    CruiseControlVar0
                subb    byte_88E7
                bcc     loc_A857
                clrb
loc_A857:
                stab    CruiseControlVar0
                bra     loc_A836
loc_A85B:
                brclr   CruiseStatus_1, %00000001, loc_A8C2
                ldaa    #$7F
                brset   CruiseStatus_1, %10000000, loc_A895
                brset   CruiseStatus_2, %00001000, loc_A874
                ldab    CruiseSpeedSetpoint
                subb    Temp0
                bcc     loc_A874
                cmpb    #$FC
                bcs     loc_A895
loc_A874:
                brset   CruiseStatus_1, %00010000, loc_A87A
                bra     loc_A89B
loc_A87A:
                ldaa    Counter_Cruise_4
                ldab    byte_88E6
                addb    #$80
                bmi     loc_A88A
                mul
                adca    Counter_Cruise_4
                bcs     loc_A891
                bra     loc_A88D
loc_A88A:
                mul
                adca    #$00
loc_A88D:
                cmpa    #$7F
                bls     loc_A89B
loc_A891:
                ldaa    #$7F
                bra     loc_A89B
loc_A895:
                bset    CruiseStatus_2, %00000001
                clrb
                stab    CruiseControlVar6
loc_A89B:
                ldab    Temp0
                stab    CruiseSpeedSetpoint
                staa    Temp2
                jsr     sub_AA29
                ldab    Temp2
                cba
                bhi     loc_A8AD
                tab
loc_A8AD:
                bclr    CruiseStatus_1, %10010001
                bclr    CruiseStatus_2, %00001000
                bclr    BitFlags24, %00001000
                clra
                staa    Counter_Cruise_4
                staa    Timer_CruiseDecelerate
                staa    CruiseControlVar0
                staa    Counter_Cruise_2
                jmp     loc_A951
loc_A8C2:
                clrb
                stab    Timer_CruiseDecelerate
                brset   StartupSwitchMirror1, %00001000, loc_A8CC
                jmp     loc_A9C3
loc_A8CC:
                ldab    Counter_Cruise_4
                incb
                bne     loc_A8D2
                decb
loc_A8D2:
                stab    Counter_Cruise_4
                brclr   CruiseStatus_1, %00000010, loc_A8DB
                jmp     loc_A96D
loc_A8DB:
                brclr   CruiseStatus_1, %00100000, loc_A8E2
                jmp     loc_AA0A
loc_A8E2:
                cmpb    #$04
                bhi     loc_A8E9
                jmp     loc_AA61
loc_A8E9:
                bset    CruiseStatus_1, %00000110
                bset    CruiseStatus_2, %00000100
                clra
                staa    Counter_Cruise_2
                brclr   CruiseStatus_1, %10000000, loc_A92E
                bset    CruiseStatus_1, %00100000
                bclr    CruiseStatus_1, %10000000
                bclr    BitFlags24, %00001000
                jsr     sub_AA29
                staa    Temp2
                ldaa    CruiseSpeedSetpoint
                suba    Temp0
                bcc     loc_A90F
                tab
                eorb    #$80
loc_A90F:
                bpl     loc_A916
                asla
                ldaa    #$80
                sbca    #$00
loc_A916:
                adda    #$80
                ldx     #byte_8951
                jsr     sub_E372
                addb    #$80
                addb    Temp2
                bpl     loc_A968
                bvc     loc_A92B
                ldab    #$7F
                bra     loc_A968
loc_A92B:
                clrb
                bra     loc_A968
loc_A92E:
                bclr    CruiseStatus_2, %00000011
                ldaa    CruiseSpeedSetpoint
                adda    #$04
                staa    CruiseSpeedSetpoint
                ldab    CruiseControlVar2
                suba    #$03
                cmpa    byte_88D6
                bhi     loc_A951
                ldab    byte_88DC
                ldaa    CruiseControlVar2
                bmi     loc_A951
                aba
                bcs     loc_A94E
                cmpa    #$7F
                bls     loc_A950
loc_A94E:
                ldaa    #$7F
loc_A950:
                tab
loc_A951:
                ldaa    CruiseSpeedSetpoint
                cmpa    byte_88D6
                bls     loc_A960
                bclr    CruiseStatus_2, %00000011
                ldaa    byte_88D6
                bra     loc_A966
loc_A960:
                cmpa    byte_88D7
                bcc     loc_A968
                clra
loc_A966:
                staa    CruiseSpeedSetpoint
loc_A968:
                stab    CruiseControlVar2
loc_A96A:
                jmp     loc_AA61
loc_A96D:
                brset   CruiseStatus_1, %00100000, loc_A96A
                brset   CruiseStatus_1, %00001000, loc_A98C
                cmpb    byte_88D2
                bls     loc_A96A
                bset    CruiseStatus_1, %00001000
                bset    CruiseStatus_2, %00001000
                ldaa    Temp0
                adda    byte_88E9
                bcc     loc_A98A
                ldaa    #$FF
loc_A98A:
                staa    CruiseControlVar0
loc_A98C:
                ldaa    Temp0
                cmpa    byte_88D6
                bcs     loc_A99B
                bset    CruiseStatus_1, %00100000
                ldab    CruiseControlVar2
                bra     loc_A9F3
loc_A99B:
                ldab    CruiseStatus_2
                cmpb    #$A0
                bcs     loc_A96A
                ldab    CruiseControlVar0
                subb    byte_88E8
                bcc     loc_A9A9
                clrb
loc_A9A9:
                cmpb    byte_88D6
                bcc     loc_A9BF
                adda    byte_88EA
                bcs     loc_A9BC
                cba
                bls     loc_A9BF
                tab
                cmpb    byte_88D6
                bls     loc_A9BF
loc_A9BC:
                ldab    byte_88D6
loc_A9BF:
                stab    CruiseControlVar0
                bra     loc_A96A
loc_A9C3:
                bclr    CruiseStatus_1, %00000010
                ldaa    CruiseSpeedSetpoint
                beq     loc_A9CD
                bclr    CruiseStatus_1, %00100000
loc_A9CD:
                brclr   CruiseStatus_1, %00001000, loc_AA0A
                ldaa    Counter_Cruise_4
                cmpa    #$5D
                bhi     loc_A9E1
                bclr    CruiseStatus_1, %00001000
                bclr    CruiseStatus_2, %00001000
                stab    CruiseControlVar0
                bra     loc_AA0A
loc_A9E1:
                ldaa    Temp0
                adda    #$04
                suba    CruiseSpeedSetpoint
                bcc     loc_A9EB
                clra
loc_A9EB:
                ldx     #byte_898E
                jsr     sub_E372
                orab    #$80
loc_A9F3:
                ldaa    Temp0
                staa    CruiseSpeedSetpoint
                bclr    CruiseStatus_1, %000001100
                bclr    CruiseStatus_2, %000001000
                clra
                staa    CruiseControlVar0
                staa    Counter_Cruise_4
                tstb
                bmi     loc_AA07
                clrb
loc_AA07:
                jmp     loc_A951
loc_AA0A:
                clrb
                stab    Counter_Cruise_4
                ldaa    CruiseStatus_2
                eora    #$04
                bita    #%00000111
                bne     loc_AA61
                ldaa    Counter_MainLoop
                bne     loc_AA61
                ldab    Counter_Cruise_2
                incb
                cmpb    byte_88E1
                bcs     loc_AA25
                bclr    CruiseStatus_2, %00000100
                clrb
loc_AA25:
                stab    Counter_Cruise_2
                bra     loc_AA61
;;
sub_AA29:
                ldaa    CruiseSpeedSetpoint
                ldx     #byte_892B
                jsr     sub_E372
                bpl     loc_AA35
                ldab    #$7F
loc_AA35:
                stab    Temp1
                ldaa    MapVolts
                ldx     #byte_893A
                jsr     sub_E372
                ldab    Temp1
                aslb
                mul
                adca    #$00
                bpl     loc_AA4B
                ldaa    #$7F
loc_AA4B:
                ldx     #$12
                ldab    CruiseSpeedSetpoint
                cmpb    byte_88EB
                bls     loc_AA56
                dex
loc_AA56:
                adda    $00,x
                bpl     locret_AA5D
                bvs     loc_AA5E
                clra
locret_AA5D:
                rts
loc_AA5E:
                ldaa    #$7F
                rts
loc_AA61:
                brset   CruiseStatus_1, %10000000, loc_AA76
                inc     Counter_Cruise_1
                brclr   CruiseStatus_1, %00011000, loc_AA76
                inc     Counter_Cruise_1
                brset   CruiseStatus_1, %00001000, loc_AA76
                inc     Counter_Cruise_1
loc_AA76:
                ldaa    CruiseStatus_2
                adda    #$10
                cmpa    #$B0
                bcs     loc_AA80
                anda    #$0F
loc_AA80:
                staa    CruiseStatus_2
                anda    #$F0
                beq     loc_AA89
                jmp     loc_AD22
loc_AA89:
                clrb
                brclr   BitFlags24, %00010000, loc_AA91
                jmp     loc_AB6D
loc_AA91:
                ldy     #$3E
                ldx     #$D000
                ldd     #$6DD
                brclr   TimerOverflowsBetweenSpeedoPulses, %11111111, loc_AAAC
                clrb
                clra
                brset   TimerOverflowsBetweenSpeedoPulses, %01000000, loc_AAB1
                ldab    #$06
                dey
loc_AAA9:
                ldx     #$DDD0
loc_AAAC:
                sei
                jsr     loc_E3DD
                cli
loc_AAB1:
                ldx     VehicleSpeed_HB
                stx     Temp0
                std     VehicleSpeed_HB
                brclr   CruiseStatus_2, %00000010, loc_AB27
                ldaa    Counter_Cruise_2
                brclr   CruiseStatus_2, %00000001, loc_AAD2
                cmpa    byte_88F5
                bcc     loc_AACC
                inca
                staa    Counter_Cruise_2
                bra     loc_AB27
loc_AACC:
                bclr    CruiseStatus_2, %00000001
                clra
                staa    Counter_Cruise_2
loc_AAD2:
                cmpa    byte_88F4
                bcs     loc_AB29
                ldab    CruiseControlVar6
                tba
                bpl     loc_AADD
                negb
loc_AADD:
                cmpb    byte_88ED
                bcs     loc_AB21
                ldx     #$12
                ldab    CruiseSpeedSetpoint
                cmpb    byte_88EB
                bls     loc_AAED
                dex
loc_AAED:
                ldab    $00,x
                adda    $02,x
                bvc     loc_AAF8
                asla
                ldaa    #$80
                sbca    #$00
loc_AAF8:
                staa    $02,x
                cmpa    byte_88EE
                bgt     loc_AB11
                cmpa    byte_88EF
                bge     loc_AB21
                subb    byte_88F1
                cmpb    byte_88F3
                bge     loc_AB1C
                ldab    byte_88F3
                bra     loc_AB1C
loc_AB11:
                addb    byte_88F0
                cmpb    byte_88F2
                ble     loc_AB1C
                ldab    byte_88F2
loc_AB1C:
                stab    $00,x
                clra
                staa    $02,x
loc_AB21:
                bclr    CruiseStatus_2, %00000010
                clra
                staa    Counter_Cruise_2
loc_AB27:
                bra     loc_AB53
loc_AB29:
                inca
                staa    Counter_Cruise_2
                ldd     VehicleSpeed_HB
                lsrd
                lsrd
                lsrd
                ldaa    CruiseSpeedSetpoint
                asla
                asla
                sba
                adda    byte_88EC
                bmi     loc_AB48
                ldab    CruiseControlVar6
                bpl     loc_AB41
                comb
                incb
loc_AB41:
                cba
                ble     loc_AB53
                staa    CruiseControlVar6
                bra     loc_AB53
loc_AB48:
                ldab    CruiseControlVar6
                bmi     loc_AB4E
                comb
                incb
loc_AB4E:
                cba
                bge     loc_AB53
                staa    CruiseControlVar6
loc_AB53:
                ldd     Temp0
                subd    VehicleSpeed_HB
                bne     loc_AB5D
                clr     CruiseControlVar3
loc_AB5D:
                std     Temp0
                clra
                ldab    CruiseControlVar3
                bpl     loc_AB66
                deca
loc_AB66:
                addd    Temp0
                asra
                rorb
                bsr     sub_AB71
loc_AB6D:
                stab    CruiseControlVar3
                bra     loc_AB82
;;
sub_AB71:
                lsld
                bcs     loc_AB7A
                tsta
                beq     loc_AB80
                ldab    #$7F
                rts
loc_AB7A:
                cmpa    #$FF
                beq     loc_AB7F
                clrb
loc_AB7F:
                sec
loc_AB80:
                rorb
                rts
loc_AB82:
                brset   CruiseStatus_1, %10000000, loc_ABDC
                ldx     #byte_8905
                clrb
                ldaa    CruiseSpeedSetpoint
                brclr   CruiseStatus_1, %00011000, loc_AB92
                ldaa    CruiseControlVar0
loc_AB92:
                lsrd
                lsrd
                lsrd
                subd    VehicleSpeed_HB
                bcc     loc_ABDF
                bclr    CruiseStatus_1, %00000100
                ldx     #byte_88F6
                coma
                comb
                addd    #$0001
                stab    Temp0
                tsta
                beq     loc_ABB1
                psha
                ldaa    #$FF
                staa    Temp0
                pula
loc_ABB1:
                lsrd
                lsrd
                brclr   CruiseStatus_1, %00010000, loc_ABC1
                ldx     #byte_8999
                tsta
                beq     loc_ABF5
                ldaa    #$FF
                bra     loc_ABF6
loc_ABC1:
                tsta
                bne     loc_ABD6
                cmpb    byte_88CF
                bcc     loc_ABD6
                tba
                ldab    Temp0
                cmpa    byte_88D0
                bcs     loc_ABF5
                ldaa    #$05
                bra     loc_ABD8
loc_ABD6:
                ldaa    #$0F
loc_ABD8:
                oraa    #$80
                staa    CruiseControlVar2
loc_ABDC:
                jmp     loc_AD22
loc_ABDF:
                brclr   CruiseStatus_1, %00001100, loc_ABE8
                ldx     #byte_891C
                lsrd
                lsrd
loc_ABE8:
                tsta
                beq     loc_ABED
                ldab    #$FF
loc_ABED:
                cmpb    byte_88D3
                bcc     loc_ABF5
                bclr    CruiseStatus_1, %00000100
loc_ABF5:
                tba
loc_ABF6:
                jsr     sub_E372
                clra
                tstb
                bpl     loc_ABFE
                deca
loc_ABFE:
                std     Temp0
                ldx     #byte_897F
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                jsr     sub_E372
                staa    Temp3
                ldx     #byte_8970
                ldd     VehicleSpeed_HB
                lsld
                lsld
                lsld
                jsr     sub_E372
                adda    Temp3
                bcc     loc_AC1E
                ldaa    #$FF
loc_AC1E:
                staa    Temp3
                clra
                staa    Temp2
                ldab    CruiseControlVar3
                bpl     loc_AC2A
                deca
loc_AC2A:
                lsld
                lsld
                addd    Temp0
                std     Temp0
                brset   CruiseStatus_2, %00000100, loc_AC5E
                bpl     loc_AC3D
                coma
                comb
                addd    #$0001
loc_AC3D:
                tsta
                beq     loc_AC42
                ldab    #$FF
loc_AC42:
                cmpb    byte_88DF
                bhi     loc_AC5E
                clrb
                ldaa    CruiseSpeedSetpoint
                lsrd
                lsrd
                lsrd
                subd    VehicleSpeed_HB
                bpl     loc_AC56
                coma
                comb
                addd    #$0001
loc_AC56:
                tsta
                bne     loc_AC5E
                cmpb    byte_88E0
                bls     loc_AC7F
loc_AC5E:
                clra
                ldab    CruiseControlVar1
                bpl     loc_AC64
                deca
loc_AC64:
                addd    Temp0
                staa    Temp4
                bpl     loc_AC71
                coma
                comb
                addd    #$0001
loc_AC71:
                cpd     Temp2
                bcc     loc_AC82
                ldaa    Temp4
                bpl     loc_AC7D
                negb
loc_AC7D:
                stab    CruiseControlVar1
loc_AC7F:
                jmp     loc_AD22
loc_AC82:
                clra
                staa    CruiseControlVar1
                ldaa    Temp4
                anda    #$80
                ldab    CruiseControlVar2
                beq     loc_AC95
                bpl     loc_AC7F
                tab
                eorb    CruiseControlVar2
                bpl     loc_AC7F
loc_AC95:
                ldab    TpsVolts_Minus_LowestSessionTpsVolts
                tsta
                bpl     loc_ACC4
                oraa    byte_88E3
                brclr   CruiseStatus_1, %00010000, loc_ACA6
                adda    byte_88E5
                bra     loc_ACEE
loc_ACA6:
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
loc_ACC4:
                cmpb    byte_88D5
                bcc     loc_ACEE
                oraa    byte_88E2
                brclr   CruiseStatus_1, %00001000, loc_ACD5
                adda    byte_88E4
                bra     loc_ACEE
loc_ACD5:
                brset   CruiseStatus_1, %00000100, loc_ACEE
                staa    Temp4
                ldx     #byte_89A8
                stx     Temp2
                ldx     #byte_89B3
                bsr     sub_ACF2
                ldab    Temp4
                cba
                bcc     loc_ACEE
loc_ACED:
                tba
loc_ACEE:
                staa    CruiseControlVar2
                bra     loc_AD22
;;
sub_ACF2:
                clrb
                ldaa    CruiseSpeedSetpoint
                lsrd
                lsrd
                lsrd
                subd    VehicleSpeed_HB
                asra
                rorb
                asra
                rorb
                asra
                rorb
                jsr     sub_AB71
                tba
                adda    #$80
                jsr     sub_E372
                ldx     Temp2
                staa    Temp2
                ldd     Temp0
                jsr     sub_AB71
                tba
                adda    #$80
                jsr     sub_E372
                ldab    Temp2
                mul
                adca    #$00
                rts
loc_AD22:
                ldaa    PIA2_Buffer_t3
                anda    #$3F
                brset   CruiseStatus_1, %10000000, loc_AD3B
                ldab    CruiseControlVar2
                beq     loc_AD3D
                bpl     loc_AD3F
                brclr   CruiseStatus_1, %00010000, loc_AD3B
                ldab    Counter_Cruise_4
                incb
                beq     loc_AD3B
                stab    Counter_Cruise_4
loc_AD3B:
                oraa    #$C0
loc_AD3D:
                oraa    #$80
loc_AD3F:
                bclr    BitFlags6a_t3, %00000001
                tab
                eorb    PIA2_Buffer_t3
                andb    #$C0
                beq     loc_AD4C
                bset    BitFlags6a_t3, %00000001
loc_AD4C:
                staa    PIA2_Buffer_t3
                ldab    CruiseControlVar2
                beq     loc_AD5E
                lsld
                tstb
                beq     loc_AD5B
                subb    #$02
                beq     loc_AD5B
                lsrd
loc_AD5B:
                stab    CruiseControlVar2
                rts
loc_AD5E:
                brclr   CruiseStatus_2, %00000001, locret_AD65
                bset    CruiseStatus_2, %00000010
locret_AD65:
                rts
;;
 ORG $B600
 DCB.B $200, $FF
 ORG $B800
;;
sub_B800:
                ldab    Counter_MainLoop
                bitb    #$07
                beq     loc_B809
                jmp     loc_B87F
loc_B809:
                ldaa    LastCoolantTempVolts
                ldx     #byte_E27A
                brclr   PIA3_Buffer_t3, $00000010, loc_B833
                ldx     #byte_E25F
                cmpa    #$40
                bcc     loc_B837
loc_B819:
                brset   BitFlags66_t3, %00000011, loc_B824
                ldab    BitFlags66_t3
                addb    #$01
                stab    BitFlags66_t3
                rts
loc_B824:
                sei
                bclr    BitFlags66_t3, %00000011
                ldab    PIA3_Buffer_t3
                eorb    #$10
                stab    PIA3_Buffer_t3
                stab    PIA3_Buffer_2_t3
                cli
                rts
loc_B833:
                cmpa    #$DC
                bcc     loc_B819
loc_B837:
                bclr    BitFlags66_t3, %00000011
                cmpa    byte_89E8
                bhi     loc_B863
                cmpa    byte_89E7
                bcs     loc_B868
                brclr   b5C_IPL1_t3, %00000010, loc_B84F
                ldaa    #$02
                jsr     sub_D5F4
                bra     loc_B87F
loc_B84F:
                jsr     sub_E372
                ldab    CoolantTemp
                sba
                bcc     loc_B85A
                decb
                bra     loc_B85F
loc_B85A:
                cmpa    #$03
                bcs     loc_B87F
                incb
loc_B85F:
                stab    CoolantTemp
                bra     loc_B87F
loc_B863:
                ldd     #$1F9E
                bra     loc_B86B
loc_B868:
                ldd     #$1E9E
loc_B86B:
                brset   b5C_IPL1_t3, %00000010, loc_B87F
                jsr     ThrowNonCriticalError
                bcc     loc_B87F
                bset    b5C_IPL1_t3, %00000010
                ldaa    byte_89E9
                staa    CoolantTemp
                clr     Timer_ThermostatDiagnostics
loc_B87F:
                ldaa    CoolantTemp
                ldx     #byte_E289
                jsr     sub_E372
                staa    CoolantTemp_fromTable_Scaled
                rts
;;
sub_B88A:
                ldab    Counter_MainLoop
                bitb    #$07
                beq     loc_B893
                jmp     loc_B909
loc_B893:
                ldaa    LastChargeTempVolts
                ldx     #byte_E27A
                brclr   PIA3_Buffer_t3, %00100000, loc_B8C0
                ldx     #byte_E25F
                cmpa    #$40
                bcc     loc_B8C4
loc_B8A3:
                brset   BitFlags23, %00000011, loc_B8B1
                ldab    BitFlags23
                addb    #$01
                stab    BitFlags23
                ldaa    LastChargeTempVolts
                bra     loc_B8C7
loc_B8B1:
                sei
                bclr    BitFlags23, %00000011
                ldab    PIA3_Buffer_t3
                eorb    #$20
                stab    PIA3_Buffer_t3
                stab    PIA3_Buffer_2_t3
                cli
                rts
loc_B8C0:
                cmpa    #$DC
                bcc     loc_B8A3
loc_B8C4:
                bclr    BitFlags23, %00000011
loc_B8C7:
                cmpa    byte_89EB
                bhi     loc_B8F0
                cmpa    byte_89EA
                bcs     loc_B8F5
                brclr   b5C_IPL1_t3, %00000001, loc_B8DC
                ldaa    #$01
                jsr     sub_D5F4
                bra     loc_B909
loc_B8DC:
                jsr     sub_E372
                ldab    ChargeTempVolts
                sba
                bcc     loc_B8E7
                decb
                bra     loc_B8EC
loc_B8E7:
                cmpa    #$03
                bcs     loc_B909
                incb
loc_B8EC:
                stab    ChargeTempVolts
                bra     loc_B909
loc_B8F0:
                ldd     #$3A9E
                bra     loc_B8F8
loc_B8F5:
                ldd     #$399E
loc_B8F8:
                brset   b5C_IPL1_t3, %00000001, loc_B909
                jsr     ThrowNonCriticalError
                bcc     loc_B909
                bset    b5C_IPL1_t3, %00000001
                ldaa    byte_89EC
                staa    ChargeTempVolts
loc_B909:
                ldaa    ChargeTempVolts
                ldx     #byte_E2CA
                jsr     sub_E372
                staa    IntakeTemp_fromTable_Scaled
                rts
;;
sub_B914:
                brclr   BitFlags24, %00010000, loc_B92D
                sei
                ldd     VehicleSpeed_HB
                lsrd
                lsrd
                lsrd
                lsrd
                lsrd
                std     Temp4
                ldd     VehicleSpeed_HB
                subd    Temp4
                std     VehicleSpeed_HB
                cli
                bra     loc_B92D
loc_B92D:
                clra
                ldab    VehicleSpeedx8_Scaled
                cmpb    byte_801E
                bcc     loc_B93D
                ldx     EngineRpm_HB
                cpx     TargetIdleSpeedHB
                bls     loc_B948
                bra     loc_B943
loc_B93D:
                ldab    MapValue
                cmpb    MAPOffsetForCylTrim
                bls     loc_B948
loc_B943:
                ldaa    Timer_CountdownFromStartRunForAisFeedback
                beq     loc_B94A
                deca
loc_B948:
                staa    Timer_CountdownFromStartRunForAisFeedback
loc_B94A:
                brset   BitFlags66_t3, %10000000, loc_B967
                ldd     VehicleSpeed_HB
                lsld
                lsld
                lsld
                aslb
                adca    #$00
                ldab    byte_801E
                brset   BitFlags66_t3, %00000100, loc_B95F
                addb    #$03
loc_B95F:
                cba
                bcs     loc_B967
                bset    BitFlags66_t3, %00000100
                bra     loc_B96A
loc_B967:
                bclr    BitFlags66_t3, %00000100
loc_B96A:
                ldd     VehicleSpeed_HB
                lsld
                lsld
                lsld
                bcc     loc_B973
                ldaa    #$FF
loc_B973:
                staa    VehicleSpeedx8_Scaled
                rts
;;
sub_B976:
                brclr   IPL1, %01000000, locret_B9B9
                ldaa    MapValue2
                cmpa    #$80
                bcs     locret_B9B9
                ldaa    EngineRpm_HB
                ldx     #byte_8024
                jsr     sub_E372
                adda    MapValue2
                bcc     loc_B98E
                ldaa    #$FF
loc_B98E:
                cmpa    BaroPressure
                bls     loc_B998
                ldab    BaroPressure
                incb
                bne     loc_B9B1
                rts
loc_B998:
                ldab    TpsVolts_Minus_LowestSessionTpsVolts
                cmpb    byte_8037
                bcs     loc_B9B3
                ldab    TPSVoltsSessionDelta
                cmpb    byte_8038
                bcs     loc_B9B4
                cmpa    BaroPressure
                bcc     loc_B9B4
                ldab    BaroPressure
                decb
                cmpb    #$80
                bcs     loc_B9B3
loc_B9B1:
                stab    BaroPressure
loc_B9B3:
                clrb
loc_B9B4:
                incb
                bmi     locret_B9B9
                stab    TPSVoltsSessionDelta
locret_B9B9:
                rts
;;
sub_B9BA:
                brclr   StartupSwitchMirror1, %00010000, loc_B9C1
                bclr    BitFlags2a, %00000001
loc_B9C1:
                brset   BitFlags27, %00000001, loc_B9DF
                ldab    BitFlags68_t3
                andb    #$10
                stab    Temp5
                ldab    StartupSwitchMirror1
                andb    #$10
                eorb    Temp5
                beq     locret_B9E2
                eorb    BitFlags68_t3
                orab    #$80
                stab    BitFlags68_t3
                bclr    BitFlags66_t3, %00000100
                rts
loc_B9DF:
                bclr    BitFlags68_t3, %10010000
locret_B9E2:
                rts
;;
sub_B9E3:
                brclr   BitFlags27, %10000000, loc_BA07
                ldab    BitFlags68_t3
                andb    #$01
                stab    Temp5
                ldab    StartupSwitchMirror1
                andb    #$01
                eorb    Temp5
                beq     locret_BA0D
                eorb    BitFlags68_t3
                brset   BitFlags36_t3, %00100000, loc_BA03
                brclr   IPL1, %01000000, loc_BA03
                orab    #$02
loc_BA03:
                stab    BitFlags68_t3
                bra     locret_BA0D
loc_BA07:
                bclr    BitFlags68_t3, %00000010
                bset    BitFlags68_t3, %00000001
locret_BA0D:
                rts
;;
sub_BA0E:
                clr     Temp4
                clr     Temp3
                brset   Ram_30, %00000100, loc_BA25
                ldaa    LastTpsVolts
                cmpa    byte_8A02
                bcc     loc_BA25
                ldaa    Ram_30
                adda    #$01
                staa    Ram_30
loc_BA25:
                ldaa    b5C_IPL1_t3
                bita    #$88
                bne     loc_BA7A
                brset   Ram_30, %00001000, loc_BA49
                ldaa    EngineRpm_HB
                cmpa    byte_8A00
                bcs     loc_BA55
                ldaa    BaroPressure
                cmpa    byte_8A05
                bcc     loc_BA42
                ldaa    byte_8A04
                bra     loc_BA45
loc_BA42:
                ldaa    byte_8A03
loc_BA45:
                cmpa    MapVolts
                bcc     loc_BA55
loc_BA49:
                ldaa    LastTpsVolts
                cmpa    byte_8A02
                bcs     loc_BA55
                com     Temp4
                bra     loc_BA87
loc_BA55:
                brset   BitFlags2e, %00001000, loc_BA6E
                ldaa    VehicleSpeedx8_Scaled
                cmpa    byte_89FF
                bcs     loc_BA7A
                ldaa    EngineRpm_HB
                cmpa    byte_8A00
                bcs     loc_BA7A
                ldaa    MapVolts
                cmpa    byte_8A01
                bcc     loc_BA7A
loc_BA6E:
                ldaa    LastTpsVolts
                cmpa    byte_89FE
                bcc     loc_BA7A
                com     Temp3
                bra     loc_BA91
loc_BA7A:
                sei
                ldaa    LastTpsVolts
                cmpa    byte_89FB
                bcs     loc_BA91
                cmpa    byte_89FC
                bcs     loc_BACF
loc_BA87:
                cli
                brclr   Counter_MainLoop, %00000001, loc_BAED
                ldd     #$1BA0
                bra     loc_BA99
loc_BA91:
                cli
                brclr   Counter_MainLoop, %00000001, loc_BAED
                ldd     #$1AA0
loc_BA99:
                brset   b5C_IPL1_t3, %01000000, loc_BAB9
                jsr     ThrowNonCriticalError
                ldaa    TpsVolts
                bcc     loc_BAED
                bset    b5C_IPL1_t3, %01000000
                tst     Temp4
                beq     loc_BAB1
                bset    Ram_30, %00001000
                bra     loc_BAB9
loc_BAB1:
                tst     Temp3
                beq     loc_BAB9
                bset    BitFlags2e, %00001000
loc_BAB9:
                ldaa    #$40
                staa    LowestSessionTpsVolts
                brclr   IPL1, %01000000, loc_BACB
                ldab    MapValue
                cmpb    byte_89FD
                bcs     loc_BACB
                adda    byte_801F
loc_BACB:
                staa    TpsVolts
                bra     loc_BAED
loc_BACF:
                brclr   b5C_IPL1_t3, %01000000, loc_BAEB
                cli
                ldaa    Counter_MainLoop
                bita    #$07
                bne     loc_BAB9
                ldaa    #$07
                jsr     sub_D5F4
                brset   b5C_IPL1_t3, %01000000, loc_BAB9
                bclr    BitFlags2e, %00001000
                bclr    Ram_30, %00001000
                bra     loc_BAB9
loc_BAEB:
                staa    TpsVolts
loc_BAED:
                cli
                brset   BitFlags66_t3, %10000000, loc_BB17
                ldab    Timer_CountdownFromStartRunForAisFeedback
                bne     loc_BB17
                brclr   IPL1, %01000000, loc_BB17
                ldab    KeyOnOrEngineRunningTime
                beq     loc_BB17
                cmpa    LowestSessionTpsVolts
                bcc     loc_BB17
                ldaa    Timer_DelayBeforeUpdating_MINTHR
                deca
                bne     loc_BB1A
                ldab    LowestSessionTpsVolts
                cmpb    #$01
                bcc     loc_BB11
                ldab    byte_801B
loc_BB11:
                decb
                stab    LowestSessionTpsVolts
                bclr    BitFlags66_t3, %00010000
loc_BB17:
                ldaa    byte_8018
loc_BB1A:
                staa    Timer_DelayBeforeUpdating_MINTHR
                ldaa    byte_8019
                ldab    BitFlags66_t3
                bpl     loc_BB27
                ldaa    byte_801A
loc_BB27:
                adda    LowestSessionTpsVolts
                cmpa    TpsVolts
                bcc     loc_BB46
                tstb
                bmi     loc_BB3F
                bitb    #$10
                bne     loc_BB3F
                ldaa    LowestSessionTpsVolts
                inca
                cmpa    TpsVolts
                bcc     loc_BB3F
                staa    LowestSessionTpsVolts
                orab    #$10
loc_BB3F:
                orab    #$80
                bclr    BitFlags2a, %00000001
                bra     loc_BB60
loc_BB46:
                tstb
                bpl     loc_BB5E
                brset   BitFlags68_t3, %00000100, loc_BB4F
                orab    #$20
loc_BB4F:
                ldx     #byte_876F
                ldaa    VehicleSpeedx8_Scaled
                cmpa    byte_801E
                bcc     loc_BB5A
                inx
loc_BB5A:
                ldaa    $00,x
                staa    Timer_CountdownFromStartRunForAisFeedback
loc_BB5E:
                andb    #$7F
loc_BB60:
                bitb    #$08
                bne     loc_BB85
                brclr   StartupSwitchMirror1, %00100000, loc_BB85
                ldaa    EngineRpm_HB
                cmpa    byte_801C
                bcs     loc_BB85
                ldaa    MapValue
                cmpa    byte_801D
                bcc     loc_BB85
                ldaa    LowestSessionTpsVolts
                inca
                cmpa    byte_801B
                bcs     loc_BB81
                ldaa    byte_801B
loc_BB81:
                staa    LowestSessionTpsVolts
                orab    #$08
loc_BB85:
                ldaa    LowestSessionTpsVolts
                adda    #$30
                cmpa    TpsVolts
                bcc     loc_BB8F
                andb    #$F7
loc_BB8F:
                stab    BitFlags66_t3
                ldaa    TpsVolts
                suba    LowestSessionTpsVolts
                bcc     loc_BB98
                clra
loc_BB98:
                staa    TpsVolts_Minus_LowestSessionTpsVolts
                rts
;;
sub_BB9B:
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
                std     EngineRpm_HB
                clra
                ldab    VehicleSpeedx8_Scaled
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
loc_BBC9:
                lsra
                lsra
                staa    Temp4
                ldaa    ScaledDistPWForCruiseControl
                tab
                lsrb
                lsrb
                sba
                adda    Temp4
                bcc     loc_BBDB
                ldaa    #$FF
loc_BBDB:
                staa    ScaledDistPWForCruiseControl
                rts
;;
sub_BBDE:
                ldab    #$1C
loc_BBE0:
                subb    #$02
                bls     loc_BBEF
                ldx     #byte_8037
                abx
                ldx     $00,x
                cpx     EngineRpm_HB
                bcc     loc_BBE0
                lsrb
loc_BBEF:
                stab    RPMTableOffset
                rts
;;
sub_BBF2:
                clr     Temp0
                ldab    byte_8499
                ldaa    MapValueTemp3
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
                ldaa    RPMTableOffset
                ldab    byte_849A
                mul
                lsrd
                lsrd
                addd    Temp0
                lsrd
                lsrd
                oraa    #$00
                beq     loc_BC24
                ldab    #$FF
loc_BC24:
                stab    RPM_Scaled_maybe
                rts
;;
sub_BC27:
                ldab    byte_801F
                addb    LowestSessionTpsVolts
                bcs     loc_BC33
                cmpb    byte_8020
                bcs     loc_BC36
loc_BC33:
                ldab    byte_8020
loc_BC36:
                brclr   BitFlags66_t3, %01000000, loc_BC3C
                subb    #$03
loc_BC3C:
                cmpb    TpsVolts
                bcc     loc_BC44
                bset    BitFlags66_t3, %01000000
                rts
loc_BC44:
                bclr    BitFlags66_t3, %01000000
                rts
;;
sub_BC48:
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
                adca    #$00
                tab
                abx
                ldd     Temp1
                idiv
                xgdx
                tsta
                bne     loc_BC9B
                stab    Temp0
                ldaa    Temp0
                ldx     #byte_E2ED
                jsr     sub_E372
                tab
                suba    AmbientAirTempVolts2
                bcc     loc_BC8B
                cmpa    #$F0
                bhi     loc_BC97
                ldab    AmbientAirTempVolts2
                subb    #$10
                bcc     loc_BC97
                ldab    #$00
                bra     loc_BC97
loc_BC8B:
                cmpa    #$10
                bls     loc_BC97
                ldab    AmbientAirTempVolts2
                addb    #$10
                bcc     loc_BC97
                ldab    #$FF
loc_BC97:
                stab    AmbientAirTempVolts2
                bra     locret_BCAF
loc_BC9B:
                brset   b5C_IPL1_t3, %00000010, locret_BCAF
                ldaa    CoolantTemp
                cmpa    #$C1
                bcc     locret_BCAF
                ldd     #$4708
                jsr     ThrowNonCriticalError
                ldaa    #$C1
                staa    AmbientAirTempVolts2
locret_BCAF:
                rts
;;
sub_BCB0:
                ldaa    AmbientAirTempVolts2
                ldx     #byte_E304
                jsr     sub_E372
                staa    Temp5
                ldab    BodyComputerBatteryVoltsOutput
                addb    #$F8
                bcs     loc_BCC6
                mul
                adca    #$00
                bra     loc_BCD2
loc_BCC6:
                cmpb    #$08
                bhi     loc_BCD2
                mul
                adca    Temp5
                bcc     loc_BCD2
                ldaa    #$FF
loc_BCD2:
                staa    TargetBatteryVolts
                rts

;;
sub_BCD5:
                brset   BitFlags6a_t3, %1000000, locret_BD16
                ldaa    PPROG_EEPROMControlReg
                bita    #$02
                bne     locret_BD16
                ldaa    $B7E1
                coma
                cmpa    $B7E0
                beq     loc_BCEB
                ldaa    #$08
loc_BCEB:
                staa    BodyComputerBatteryVoltsOutput
                ldaa    $B615
                coma
                cmpa    $B614
                beq     loc_BCF9
                clra
                bra     loc_BD05
loc_BCF9:
                cmpa    #$0C
                ble     loc_BCFF
                ldaa    #$0C
loc_BCFF:
                cmpa    #$F4
                bge     loc_BD05
                ldaa    #$F4
loc_BD05:
                staa    Ram_4B
                ldaa    $B7EF
                cmpa    #$55
                bne     loc_BD13
                bset    BitFlags6a_t3, %00000010
                bra     locret_BD16
loc_BD13:
                bclr    BitFlags6a_t3, %00000010
locret_BD16:
                rts
;;
sub_BD17:
                clr     Temp4
                ldx     #byte_8083
                ldaa    BitFlags6d_t3
                bita    #$50
                bne     loc_BD34
                ldaa    Ram_CC
                beq     loc_BD2D
                brset   PIA2_Buffer_t3, %00000010, loc_BD34
                bra     loc_BD31
loc_BD2D:
                brclr   PIA2_Buffer_t3, %00000010, loc_BD34
loc_BD31:
                ldx     #byte_811F
loc_BD34:
                ldaa    EngineRPM_3D
                ldab    MapValue2
                jsr     sub_E44C
                bpl     loc_BD3F
                ldaa    #$7F
loc_BD3F:
                staa    Temp5
                brclr   IPL1, %00010000, loc_BD5E
                ldx     #byte_81BC
                ldaa    EngineRPM_3D
                ldab    MapValue2
                jsr     sub_E44C
                bpl     loc_BD54
                ldaa    #$7F
loc_BD54:
                adda    Temp5
                bpl     loc_BD5B
                ldaa    #$7F
loc_BD5B:
                staa    Temp5
loc_BD5E:
                ldx     #byte_8258
                ldab    RPMTableOffset
                abx
                ldaa    $00,x
                cmpa    MapValue2
                bcc     loc_BDAF
                bset    BitFlags23, %01000000
                ldx     #byte_8266
                ldaa    CoolantTemp_fromTable_Scaled
                jsr     sub_E3AA
                subb    #$20
                stab    Temp4
                ldaa    IntakeTemp_fromTable_Scaled
                ldx     #byte_826F
                jsr     sub_E3AA
                subb    #$20
                addb    Temp4
                bvc     loc_BD92
                ldab    #$80
                tst     Temp4
                bmi     loc_BD92
                ldab    #$7F
loc_BD92:
                stab    Temp4
                ldaa    BaroPressure
                cmpa    byte_8278
                bcc     loc_BDB2
                subb    byte_8279
                bvc     loc_BDAA
                ldab    #$80
                tst     Temp4
                bmi     loc_BDAA
                ldab    #$7F
loc_BDAA:
                stab    Temp4
                bra     loc_BDB2
loc_BDAF:
                bclr    BitFlags23, %01000000
loc_BDB2:
                jsr     sub_BF03
                ldaa    byte_827A
                beq     loc_BDCD
                brset   BitFlags66_t3, %10000000, loc_BDCD
                ldab    VehicleSpeedx8_Scaled
                brclr   BitFlags23, %00010000, loc_BDCA
                adda    #$03
                bcc     loc_BDCA
                ldaa    #$FF
loc_BDCA:
                cba
                bcc     loc_BDD2
loc_BDCD:
                bclr    BitFlags23, %00010000
                bra     loc_BDD5
loc_BDD2:
                bset    BitFlags23, %00010000
loc_BDD5:
                ldaa    byte_827A
                beq     loc_BE0E
                ldx     #byte_827C
                ldaa    CoolantTemp_fromTable_Scaled
                jsr     sub_E3AA
                brclr   BitFlags23, %00010000, loc_BDF2
                addb    byte_827B
                bpl     loc_BDED
                ldab    #$7F
loc_BDED:
                stab    Temp5
                bra     loc_BE0E
loc_BDF2:
                stab    Temp4
                ldaa    MapValue
                ldx     #byte_8285
                jsr     sub_E3AA
                ldaa    Temp4
                mul
                adca    #$00
                staa    Temp4
                jsr     sub_BF03
                staa    Temp0
                bra     loc_BE71
loc_BE0E:
                ldaa    Temp5
                staa    Temp0
                brclr   IPL1, %01000000, loc_BE71
                brset   BitFlags66_t3, %10000000, loc_BE71
                brset   BitFlags66_t3, %00000100, loc_BE71
                ldab    Timer_CountdownFromStartRunForAisFeedback
                bne     loc_BE79
                ldab    TimerOverflowsBetweenCamPulses
                bne     loc_BE79
                ldab    EngineRpm_HB
                cmpb    byte_8663
                bcs     loc_BE79
                ldab    b5C_IPL1_t3
                bitb    #$88
                bne     loc_BE79
                ldab    CoolantTemp
                cmpb    byte_865F
                bcs     loc_BE79
                ldx     KeyOnOrEngineRunningTime
                cpx     byte_8661
                bcs     loc_BE79
                ldx     #byte_8671
                ldd     EngineRpm_HB
                subd    TargetIdleSpeedHB
                bcc     loc_BE51
                ldx     #byte_8666
                coma
                comb
loc_BE51:
                lsrd
                lsrd
                lsrd
                lsrd
                bcc     loc_BE5A
                addd    #$0001
loc_BE5A:
                tsta
                beq     loc_BE5F
                ldab    #$FF
loc_BE5F:
                tba
                jsr     sub_E372
                staa    SparkScatter
                staa    Temp4
                jsr     sub_BF03
                staa    Temp0
                bra     loc_BE7F
loc_BE71:
                clr     SparkScatter
                clr     SparkScatterIncrement
                bra     loc_BE96
loc_BE79:
                clr     SparkScatter
                clr     SparkScatterIncrement
loc_BE7F:
                ldaa    byte_8665
                brset   BitFlags6d_t3, %00001000, loc_BE91
                brset   BitFlags2a, %00000001, loc_BE8E
                brclr   b5C_IPL1_t3, %00000010, loc_BE96
loc_BE8E:
                ldaa    byte_8664
loc_BE91:
                staa    Temp0
                bra     loc_BEDC
loc_BE96:
                ldd     #$00
                brclr   BitFlags2c, %00001000, loc_BEA4
                sei
                bclr    BitFlags2c, %00001000
                cli
                bra     loc_BEE4
loc_BEA4:
                ldaa    Temp0
                decb
                cmpb    Ram_4C
                beq     loc_BEE1
                brclr   IPL1, %00000001, loc_BEE1
                brset   BitFlags66_t3, %10000000, loc_BEE1
                cmpa    Ram_4C
                bls     loc_BEE1
                ldaa    EngineRpmTemp
                suba    EngineRpm_HB
                bcs     loc_BEC3
                cmpa    byte_8082
                bcc     loc_BEDC
loc_BEC3:
                ldaa    Ram_4C
                ldab    CounterUp_43
                cmpb    byte_8081
                tab
                bcs     loc_BEE4
                ldaa    Ram_4C
                adda    byte_8080
                bpl     loc_BED6
                ldaa    #$7F
loc_BED6:
                tab
                cmpa    Temp0
                bcs     loc_BEE1
loc_BEDC:
                ldaa    Temp0
                ldab    #$FF
loc_BEE1:
                clr     CounterUp_43
loc_BEE4:
                staa    Temp0
                stab    Ram_4C
                adda    Ram_4B
                bvc     loc_BEF3
                bpl     loc_BEF5
                ldaa    #$7F
                bra     loc_BEF6
loc_BEF3:
                bpl     loc_BEF6
loc_BEF5:
                clra
loc_BEF6:
                ldab    UNe_6481
                bitb    #$02
                beq     loc_BF00
                ldaa    UNe_6482
loc_BF00:
                staa    AdvanceTemporary
                rts
;;
sub_BF03:
                tst     Temp4
                bpl     loc_BF13
                ldaa    Temp4
                adda    Temp5
                bpl     loc_BF1D
                clra
                bra     loc_BF1D
loc_BF13:
                ldaa    Temp4
                adda    Temp5
                bpl     loc_BF1D
                ldaa    #$7F
loc_BF1D:
                staa    Temp5
                rts
;;
sub_BF21:
                ldaa    TimerOverflowsBetweenCamPulses
                bne     loc_BF5C
                ldd     byte_807C
                cpd     byte_82B1
                bcc     loc_BF31
                ldd     byte_82B1
loc_BF31:
                cpd     DistributorFallingEdgePulsewidth_HB
                bcs     loc_BF5C
                ldx     #SwitchPortAccessReg1
                brset   IPL1, %01000001, loc_BF62
                brset   BitFlags23, %10000000, loc_BF4F
                brclr   $00,x, %00100000, loc_BF62
                bset    BitFlags23, %10000000
                ldaa    byte_807E
                staa    Ram_7F
                bra     locret_BF65
loc_BF4F:
                brset   $00,x, %00100000, locret_BF65
                ldaa    Ram_7F
                beq     locret_BF65
                deca
                staa    Ram_7F
                bra     locret_BF65
loc_BF5C:
                bclr    IPL1, %01000001
                bclr    BitFlags23, %10000000
loc_BF62:
                clr     Ram_7F
locret_BF65:
                rts
;;
sub_BF66:
                brset   IPL1, %01000000, locret_BF7F
                ldaa    CoolantTemp_fromTable_Scaled
                ldx     #byte_8449
                jsr     sub_E3AA
                pshb
                ldaa    BaroPressure
                ldx     #byte_8452
                jsr     sub_E3AA
                pula
                mul
                std     Ram_71
locret_BF7F:
                rts
;;
sub_BF80:
                ldaa    KeyOnOrEngineRunningTime
                cmpa    byte_864A
                bcs     loc_BFE2
                ldaa    VehicleSpeedx8_Scaled
                cmpa    byte_864B
                bcs     loc_BFE2
                ldaa    CoolantTemp
                cmpa    byte_864C
                bcs     loc_BFE2
                ldaa    BaroPressure
                cmpa    byte_8651
                bcs     loc_BFE2
                ldaa    byte_8647
                ldab    TargetIdleSpeedHB
                mul
                addd    TargetIdleSpeedHB
                bcc     loc_BFA9
                ldd     #$FFFF
loc_BFA9:
                cpd     EngineRpm_HB
                bcc     loc_BFE2
                brclr   BitFlags2c, %01000000, loc_BFB9
                jsr     sub_C03B
                brset   BitFlags2c, %01000000, loc_BFE2
loc_BFB9:
                ldaa    byte_8652
                bne     loc_BFC4
                brclr   BitFlags66_t3, %10000000, loc_BFE9
                bra     loc_BFE2
loc_BFC4:
                cmpa    #$01
                bne     loc_BFD2
                ldd     Ram_73
                cpd     byte_8653
                bcs     loc_BFE9
                bra     loc_BFE2
loc_BFD2:
                cmpa    #$02
                bne     loc_BFE2
                ldd     Ram_73
                cpd     byte_8653
                bcc     loc_BFE2
                brclr   BitFlags66_t3, %10000000, loc_BFE9
loc_BFE2:
                ldaa    byte_8648
                staa    Counter_E
                bra     loc_BFF0
loc_BFE9:
                ldaa    Counter_E
                bne     loc_BFF0
                bset    BitFlags2c, %11000000
loc_BFF0:
                ldd     byte_8655
                brclr   BitFlags2c, %00000010, loc_BFFF
                subd    byte_8657
                bcc     loc_BFFF
                ldd     #$00
loc_BFFF:
                cpd     EngineRpm_HB
                bcc     loc_C01B
                ldaa    byte_8659
                brclr   BitFlags2c, %00000010, loc_C012
                suba    byte_865A
                bcc     loc_C012
                ldaa    #$00
loc_C012:
                cmpa    VehicleSpeedx8_Scaled
                bcc     loc_C01B
                bset    BitFlags2c, %00000010
                bra     loc_C01E
loc_C01B:
                bclr    BitFlags2c, %00000010
loc_C01E:
                ldd     byte_865B
                brclr   BitFlags2c, %00000001, loc_C02D
                subd    byte_865D
                bcc     loc_C02D
                ldd     #$00
loc_C02D:
                cpd     EngineRpm_HB
                bcc     loc_C037
                bset    BitFlags2c, %00000001
                bra     locret_C03A
loc_C037:
                bclr    BitFlags2c, %00000001
locret_C03A:
                rts
;;
sub_C03B:
                tst     CounterDn_b7_o2
                bne     locret_C078
                ldaa    EngineRpm_HB
                cmpa    RpmRelated0087
                bcs     locret_C078
                ldd     Ram_73
                cpd     byte_864D
                bcc     loc_C050
                bra     loc_C075
loc_C050:
                ldx     Ram_73
                ldaa    byte_8649
                bne     loc_C05D
                brset   BitFlags66_t3, %10000000, loc_C075
                bra     locret_C078
loc_C05D:
                cmpa    #$01
                bne     loc_C068
                cpx     byte_864F
                bcc     loc_C075
                bra     locret_C078
loc_C068:
                cmpa    #$02
                bne     loc_C075
                brclr   BitFlags66_t3, %10000000, locret_C078
                cpx     byte_864F
                bcs     locret_C078
loc_C075:
                bclr    BitFlags2c, %01000000
locret_C078:
                rts
;;
sub_C079:
                ldx     #byte_84B4
                ldd     EngineRpm_HB
                aslb
                adca    #$00
                jsr     sub_E372
                staa    Temp0
                ldab    MapValue
                ldx     #byte_84D3
                jsr     sub_E44C
                staa    o2LowLimitForInMiddleDetermination
                ldaa    Temp0
                ldab    MapValue
                ldx     #byte_856F
                jsr     sub_E44C
                staa    o2HighLimitForInMiddleDetermination
                rts
;;
sub_C09F:
                ldaa    CoolantTemp
                cmpa    byte_8637
                bcc     loc_C0AF
                ldd     #$00
                staa    Ram_82
                std     Counter_F_HB
                bra     locret_C10B
loc_C0AF:
                ldab    EngineRpmTemp
                cmpb    byte_8638
                bcs     loc_C0BA
                brset   BitFlags66_t3, %01000000, loc_C0D9
loc_C0BA:
                ldaa    EngineRpmTemp
                ldab    RPM_Scaled_maybe
                cmpa    byte_863C
                bls     loc_C0C8
                cmpb    byte_863D
                bhi     loc_C0CD
loc_C0C8:
                clr     Ram_82
                bra     loc_C0D2
loc_C0CD:
                ldaa    byte_863E
                staa    Ram_82
loc_C0D2:
                ldd     #$00
                std     Counter_F_HB
                bra     locret_C10B
loc_C0D9:
                ldaa    EngineRpmTemp
                cmpa    byte_8639
                bhi     loc_C0F8
                ldab    Ram_82
                cmpa    byte_8641
                bcs     loc_C0EC
                cmpb    byte_863A
                beq     loc_C0F6
loc_C0EC:
                ldaa    byte_863B
                staa    Ram_82
                ldd     #$00
                std     Counter_F_HB
loc_C0F6:
                bra     locret_C10B
loc_C0F8:
                ldx     Counter_F_HB
                cpx     byte_863F
                bcc     loc_C106
                ldaa    byte_863B
                staa    Ram_82
                bra     locret_C10B
loc_C106:
                ldaa    byte_863A
                staa    Ram_82
locret_C10B:
                rts
;;
sub_C10C:
                sei
                ldaa    MapValueTemp2
                staa    Ram_9D
                ldaa    MapValue
                staa    Ram_9E
                ldd     DistributorFallingEdgePulsewidth_HB
                std     Ram_9F
                ldaa    Counter_O2SensorFeedbackCount_Signed
                staa    Ram_A2
                ldaa    BitFlags29
                eora    Ram_A1
                anda    #$80
                beq     loc_C12A
                bset    BitFlags29, %00000001
                bra     loc_C12D
loc_C12A:
                bclr    BitFlags29, %00000001
loc_C12D:
                ldaa    BitFlags29
                staa    Ram_A1
                cli
                ldab    Ram_0B
                cmpb    byte_8634
                bcs     loc_C13E
                cmpb    byte_8633
                bls     loc_C144
loc_C13E:
                ldaa    #$80
                staa    Ram_0B
                staa    ValueFromAdaptiveMemory
loc_C144:
                brclr   Ram_A1, %01000000, loc_C19D
                ldaa    Ram_9D
                suba    Ram_9E
                bcc     loc_C14F
                nega
loc_C14F:
                cmpa    byte_8623
                bcc     loc_C19D
                ldaa    CoolantTemp
                cmpa    byte_8622
                bcs     loc_C19D
                ldaa    Ram_9F
                cmpa    byte_8626
                bcc     loc_C187
                cmpa    byte_8625
                bcc     loc_C19D
                cmpa    byte_8624
                bcs     loc_C19D
                ldaa    Ram_9E
                cmpa    byte_8628
                bcs     loc_C182
                ldx     #byte_8629
                brset   BitFlags2c, %00100000, loc_C19F
                bset    BitFlags2c, %00100000
                bclr    BitFlags2c, %00010000
                bra     loc_C194
loc_C182:
                cmpa    byte_8627
                bcc     loc_C19D
loc_C187:
                ldx     #byte_862E
                brset   BitFlags2c, %00010000, loc_C19F
                bset    BitFlags2c, %00010000
                bclr    BitFlags2c, %00100000
loc_C194:
                clra
                clrb
                std     Ram_9B
                ldaa    $00,x
                staa    Ram_99
locret_C19C:
                rts
loc_C19D:
                bra     loc_C1FB
loc_C19F:
                brclr   Ram_A1, %00000001, locret_C19C
                clra
                staa    Temp0
                ldab    Ram_A2
                addd    Ram_9B
                std     Ram_9B
                dec     Ram_99
                bne     locret_C19C
                subd    $01,x
                bcs     loc_C1BD
                subd    $03,x
                bcs     loc_C1FB
                inc     Temp0
loc_C1BD:
                brset   BitFlags2c, %00100000, loc_C1DD
                ldaa    Ram_9A
                beq     loc_C1FB
                deca
                staa    Ram_9A
                ldaa    ValueFromAdaptiveMemory
                ldab    Temp0
                beq     loc_C1D4
                adda    byte_8635
                bra     loc_C1D7
loc_C1D4:
                suba    byte_8635
loc_C1D7:
                bcs     loc_C1FB
                staa    ValueFromAdaptiveMemory
                bra     loc_C1FB
loc_C1DD:
                ldaa    Ram_0B
                ldab    Temp0
                beq     loc_C1E6
                inca
                inca
loc_C1E6:
                deca
                ldab    byte_8633
                cba
                bcc     loc_C1F4
                ldab    byte_8634
                cba
                bcs     loc_C1F4
                tab
loc_C1F4:
                stab    Ram_0B
                ldaa    byte_8636
                staa    Ram_9A
loc_C1FB:
                bclr    BitFlags2c, %00110000
                rts
;;
sub_C1FF:
                ldaa    MapValue
                ldab    byte_8614
                mul
                ldab    #$FF
                subb    BaroPressure
                mul
                lsrd
                lsrd
                lsrd
                lsrd
                std     MAPLoadFactor
                rts
;;
sub_C211:
                ldx     Counter_A_HB
                beq     loc_C218
                dex
                stx     Counter_A_HB
loc_C218:
                ldaa    Counter_B
                beq     loc_C21F
                deca
                staa    Counter_B
loc_C21F:
                ldaa    Counter_C
                beq     loc_C226
                deca
                staa    Counter_C
loc_C226:
                brclr   IPL1, %01000000, loc_C246
                brset   BitFlags2c, %00000100, loc_C23C
                ldaa    Counter_X
                beq     loc_C237
                deca
                staa    Counter_X
                bne     loc_C246
loc_C237:
                sei
                bset    BitFlags2c, %00000100
                cli
loc_C23C:
                ldaa    PreviousCoolantTemp_fromTable_Scaled
                ldx     #byte_84A8
                jsr     sub_E3AA
                stab    Counter_X
loc_C246:
                ldaa    Counter_D
                inca
                beq     loc_C24D
                staa    Counter_D
loc_C24D:
                ldaa    Counter_E
                beq     loc_C254
                deca
                staa    Counter_E
loc_C254:
                ldx     Counter_F_HB
                inx
                beq     locret_C25B
                stx     Counter_F_HB
locret_C25B:
                rts
;;
sub_C25C:
                ldaa    IntakeTemp_fromTable_Scaled
                ldx     #byte_8421
                jsr     sub_E3AA
                stab    Ram_81
                ldaa    CoolantTemp_fromTable_Scaled
                brset   IPL1, %01000000, loc_C290
                ldaa    PreviousCoolantTemp_fromTable_Scaled
                ldx     #byte_84A8
                jsr     sub_E3AA
                stab    Counter_X
                ldaa    CoolantTemp_fromTable_Scaled
                ldx     #byte_83FD
                jsr     sub_E3AA
                stab    Ram_BD
                ldx     #byte_847B
                jsr     sub_E3AA
                tba
                clrb
                lsrd
                lsrd
                lsrd
                lsrd
                std     Counter_A_HB
                ldaa    CoolantTemp_fromTable_Scaled
loc_C290:
                ldx     #byte_8406
                jsr     sub_E3AA
                stab    Ram_BE
                ldx     #byte_83EB
                jsr     sub_E3AA
                stab    Ram_A3
                ldx     #byte_8484
                jsr     sub_E3AA
                stab    Ram_A6
                ldx     #byte_83F4
                jsr     sub_E3AA
                stab    Ram_A9
                ldx     #byte_8469
                jsr     sub_E3AA
                stab    MapAverageFactorRAM_LB
                ldx     #byte_8460
                jsr     sub_E3AA
                stab    TPSAverageFactorRAM_HB
                ldx     #byte_8472
                jsr     sub_E3AA
                stab    TPSAverageFactorRAM_LB
                ldx     #byte_848D
                jsr     sub_E3AA
                stab    Ram_AC
                ldaa    BatteryVolts
                ldx     #byte_842A
                jsr     sub_E372
                stab    Ram_B1
                ldaa    BatteryVolts
                ldx     #byte_E317
                jsr     sub_E372
                stab    CalculatedDwellTime
                rts
;;
sub_C2E6:
                ldaa    TimerOverflowsBetweenCamPulses
                bne     loc_C2F2
                ldd     byte_82AF
                cpd     DistributorFallingEdgePulsewidth_HB
                bcc     loc_C2F7
loc_C2F2:
                bset    BitFlags29, %00000010
                bra     loc_C301
loc_C2F7:
                ldd     EngineRpm_HB
                cpd     TargetIdleSpeedHB
                bcs     loc_C301
                bclr    BitFlags29, %00000010
loc_C301:
                brclr   BitFlags29, %00000010, loc_C314
                clrb
                ldaa    MapValue
                std     MapValueTemp2
                ldaa    EngineRpm_HB
                std     EngineRpmTemp
                ldaa    TpsVolts
                std     TPSVoltsTemp_B
                bra     loc_C341
loc_C314:
                ldx     #$93
                ldaa    MapValueTemp2
                suba    MapValue
                bcc     loc_C320
                ldx     #byte_861B
loc_C320:
                ldy     #$8C
                ldaa    MapValue
                jsr     sub_E4D0
                ldx     #byte_849B
                ldy     #$88
                ldaa    EngineRpm_HB
                jsr     sub_E4D0
                ldx     #byte_8620
                ldy     #$97
                ldaa    TpsVolts
                jsr     sub_E4D0
loc_C341:
                ldx     #byte_8496
                ldy     #$8E
                ldaa    MapValue
                jsr     sub_E4D0
                rts
;;
sub_C34E:
                ldx     #byte_8615
                ldaa    MapValueTemp1
                cmpa    MapValue
                bcc     loc_C35A
                ldx     #$91
loc_C35A:
                ldy     #$8A
                ldaa    MapValue
                jsr     sub_E4D0
                ldx     #byte_8619
                ldaa    TPSVoltsTemp_A
                cmpa    TpsVolts
                bcc     loc_C36F
                ldx     #$93
loc_C36F:
                ldy     #$95
                ldaa    TpsVolts
                jsr     sub_E4D0
                rts
sub_C379:
                brset   BitFlags6d_t3, %01000000, loc_C385
                brclr   PIA2_Buffer_t3, %00000010, loc_C38D
                ldaa    Ram_CC
                bne     loc_C38D
loc_C385:
                ldaa    byte_84A3
                ldx     #byte_834F
                bra     loc_C393
loc_C38D:
                ldaa    byte_84A4
                ldx     #byte_82B3
loc_C393:
                staa    Ram_85
                ldaa    EngineRPM_3D
                ldab    MapValue2
                jsr     sub_E44C
                staa    Ram_86
                rts
;;
sub_C39F:
                ldaa    MapValue
                ldx     #byte_840F
                jsr     sub_E3AA
                ldaa    Ram_BE
                lsra
                mul
                ldab    Ram_BE
                lsrb
                lsrb
                aba
                bcs     loc_C3CE
                staa    LDXi_6490
                brclr   BitFlags2c, %00000100, loc_C3C6
                ldaa    Ram_BD
                beq     loc_C3C3
                ldab    byte_84A7
                mul
                staa    Ram_BD
loc_C3C3:
                bclr    BitFlags2c, %00000100
loc_C3C6:
                ldaa    LDXi_6490
                ldab    Ram_BD
                aba
                bcc     loc_C3D0
loc_C3CE:
                ldaa    #$FF
loc_C3D0:
                staa    Ram_84
                rts
;;
sub_C3D3:
                ldd     Ram_73
                cpd     byte_84B2
                bcc     loc_C3E0
                bset    BitFlags29, %00100000
                bra     loc_C3EC
loc_C3E0:
                bclr    BitFlags29, %00100000
                brset   BitFlags2c, %10000000, loc_C3EC
                tst     Ram_82
                beq     loc_C3F1
loc_C3EC:
                ldaa    byte_84B1
                staa    CounterDn_b9_o2
loc_C3F1:
                ldaa    Ram_B4
                cmpa    byte_89F7
                bcs     loc_C41E
                brclr   BitFlags29, %10000000, loc_C40D
                brset   b5D_IPL2_t3, %00000001, loc_C43D
                ldd     #$0381
                jsr     ThrowNonCriticalError
                bcc     loc_C41E
                bset    b5D_IPL2_t3, %00000001
                bra     loc_C43D
loc_C40D:
                brset   b5D_IPL2_t3, %00000010, loc_C43D
                ldd     #$0481
                jsr     ThrowNonCriticalError
                bcc     loc_C41E
                bset    b5D_IPL2_t3, %00000010
                bra     loc_C43D
loc_C41E:
                tst     CounterDn_b9_o2
                bne     loc_C43D
                ldd     Counter_A_HB
                bne     loc_C43D
                brset   BitFlags29, %01000000, loc_C437
                ldaa    O2SensorVolts
                cmpa    byte_89F5
                bcc     loc_C437
                cmpa    byte_89F6
                bcc     loc_C43D
loc_C437:
                ldaa    O2SensorVolts
                cmpa    #$3E
                bcs     loc_C450
loc_C43D:
                bclr    BitFlags29, %01010100
                ldaa    byte_860F
                staa    CounterDn_ba_o2
                ldaa    byte_8611
                staa    CounterDn_bc_o2
                ldaa    #$80
                staa    Counter_O2SensorFeedbackCount_Signed
                bra     locret_C47C
loc_C450:
                jsr     sub_C47D
                ldaa    BitFlags29
                bita    #$04
                beq     loc_C461
                clr     Ram_B4
                jsr     sub_C4A8
                bra     loc_C464
loc_C461:
                jsr     sub_C4E4
loc_C464:
                brset   BitFlags29, %10000000, loc_C470
                adda    Counter_O2SensorFeedbackCount_Signed
                bcc     loc_C477
                ldaa    #$FF
                bra     loc_C477
loc_C470:
                tab
                ldaa    Counter_O2SensorFeedbackCount_Signed
                sba
                bcc     loc_C477
                clra
loc_C477:
                staa    Counter_O2SensorFeedbackCount_Signed
                bset    BitFlags29, %01000000
locret_C47C:
                rts
;;
sub_C47D:
                ldab    O2SensorVolts
                ldaa    BitFlags29
                cmpb    o2HighLimitForInMiddleDetermination
                bcs     loc_C491
                cmpb    o2LowLimitForInMiddleDetermination
                bcc     loc_C48D
                brclr   BitFlags29, %10000000, loc_C491
loc_C48D:
                ldab    #$80
                bra     loc_C492
loc_C491:
                clrb
loc_C492:
                pshb
                eorb    BitFlags29
                aslb
                bcc     loc_C49F
                oraa    #$04
                clr     Ram_B4
                bra     loc_C4A1
loc_C49F:
                anda    #$FB
loc_C4A1:
                anda    #$7F
                pulb
                aba
                staa    BitFlags29
                rts
;;
sub_C4A8:
                brclr   BitFlags29, %00010000, loc_C4BA
                ldaa    CounterUp_b6_o2
                ldab    byte_860E
                cba
                bcs     loc_C4B8
                stab    Ram_B5
                bra     loc_C4BA
loc_C4B8:
                staa    Ram_B5
loc_C4BA:
                bclr    BitFlags29, %00010000
                clr     CounterUp_b6_o2
                ldaa    byte_860F
                staa    CounterDn_ba_o2
                ldaa    byte_8611
                staa    CounterDn_bc_o2
                ldab    Ram_B5
                ldaa    EngineRpm_HB
                cmpa    byte_860D
                bcc     loc_C4D8
                addb    byte_860B
                bra     loc_C4DB
loc_C4D8:
                addb    byte_860C
loc_C4DB:
                bcc     loc_C4DF
                ldab    #$FF
loc_C4DF:
                tba
                lsr     Ram_B5
                rts
;;
sub_C4E4:
                clra
                ldab    CounterDn_bc_o2
                bne     loc_C531
                ldab    BitFlags29
                bitb    #%00010000
                bne     loc_C4FE
                clr     CounterUp_b6_o2
                bset    BitFlags29, %00010000
                ldab    byte_8610
                stab    CounterDn_bb_o2
                ldaa    #$01
                bra     locret_C53C
loc_C4FE:
                ldab    CounterUp_b6_o2
                cmpb    byte_8613
                bcs     loc_C524
                brset   BitFlags2c, %10000000, loc_C517
                ldab    VehicleSpeedx8_Scaled
                beq     loc_C517
                ldab    EngineRpm_HB
                cmpb    byte_89F4
                bcs     loc_C517
                inc     Ram_B4
loc_C517:
                ldaa    byte_8612
                clrb
                lsrd
                lsrd
                lsrd
                lsrd
                std     Counter_A_HB
                clra
                bra     locret_C53C
loc_C524:
                ldab    CounterDn_bb_o2
                bne     loc_C52F
                ldaa    #$01
                ldab    byte_8610
                stab    CounterDn_bb_o2
loc_C52F:
                bra     locret_C53C
loc_C531:
                ldab    CounterDn_ba_o2
                bne     locret_C53C
                ldab    byte_860F
                stab    CounterDn_ba_o2
                ldaa    #$01
locret_C53C:
                rts
;;
sub_C53D:
                brclr   BitFlags66_t3, %10000000, loc_C551
                ldab    MapValue
                subb    MapValueTemp1
                bcs     loc_C551
                ldaa    Ram_A4
                bne     loc_C554
                ldaa    byte_8616
                cba
                bcs     loc_C554
loc_C551:
                clrb
                bra     loc_C556
loc_C554:
                ldaa    Ram_A3
loc_C556:
                mul
                std     Ram_A4
                ldaa    TPSVoltsTemp_A
                ldab    byte_8618
                addb    LowestSessionTpsVolts
                bcc     loc_C564
                ldab    #$FF
loc_C564:
                cba
                bcc     loc_C572
                ldaa    TpsVolts
                suba    TPSVoltsTemp_A
                bcs     loc_C572
                cmpa    byte_8617
                bcc     loc_C573
loc_C572:
                clra
loc_C573:
                ldab    Ram_A6
                mul
                std     Ram_A7
                rts
;;
sub_C579:
                clra
                ldab    Counter_C
                beq     loc_C581
                jmp     locret_C5B9
loc_C581:
                ldab    EngineRpm_HB
                cmpb    byte_861D
                bcs     loc_C595
                ldab    MapValueTemp2
                subb    MapValue
                bcs     loc_C595
                cmpb    byte_861B
                bcs     loc_C595
                ldaa    Ram_A9
loc_C595:
                mul
                std     Ram_AA
                ldab    TpsVolts
                ldaa    LowestSessionTpsVolts
                adda    byte_861F
                bcc     loc_C5A3
                ldaa    #$FF
loc_C5A3:
                cba
                bcs     loc_C5B0
                ldaa    TPSVoltsTemp_B
                sba
                bcs     loc_C5B0
                cmpa    byte_861E
                bcc     loc_C5B4
loc_C5B0:
                clra
                clrb
                bra     loc_C5B7
loc_C5B4:
                ldab    Ram_AC
                mul
loc_C5B7:
                std     Ram_AD
locret_C5B9:
                rts
;;
sub_C5BA:
                ldx     #DoubleTempC
                ldaa    #$01
                ldab    Ram_81
                std     DoubleTempC
                ldab    Ram_82
                jsr     sub_E406
                std     DoubleTempC
                ldaa    #$01
                ldab    Ram_0B
                jsr     sub_E406
                std     DoubleTempC
                ldaa    #$01
                ldab    Counter_O2SensorFeedbackCount_Signed
                jsr     sub_E406
                std     DoubleTempC
                xgdy
                ldaa    Ram_84
                jsr     ScaleYbyA
                xgdy
                lsld
                lsld
                addd    DoubleTempC
                std     PWMULT_Adaptive_fuel_pulsewidth_multiplier
                rts
;;
sub_C5F1:
                ldaa    ADCTL_A2DControlReg
                bpl     sub_C5F1
                ldab    ADR4_A2DResults4
                stab    LastTpsVolts
                cmpb    byte_89FB
                bcs     loc_C60B
                cmpb    byte_89FC
                bcc     loc_C60B
                brset   b5C_IPL1_t3, %01000000, loc_C60B
                stab    TpsVolts
loc_C60B:
                ldaa    ADR1_A2DResults1
                ldab    EngineRpm_HB
                cmpb    #$2F
                bcc     loc_C622
                cmpb    #$0D
                bcs     loc_C622
                cmpa    byte_8A08
                bcc     loc_C626
                cmpa    byte_8A07
                bcs     loc_C626
loc_C622:
                brclr   b5C_IPL1_t3, %10001000, loc_C629
loc_C626:
                jsr     sub_D61E
loc_C629:
                jsr     sub_E3F8
                tab
                addb    MapValue_t3
                rorb
                stab    MapValue
loc_C633:
                brset   IPL1, %01000000, loc_C63A
                jmp     loc_C758
loc_C63A:
                brset   BitFlags27, %00001000, loc_C648
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$08
                beq     loc_C648
                jsr     sub_F36D
loc_C648:
                jsr     sub_C53D
                ldx     #byte_84A5
                ldaa    MapValue2
                cmpa    MapValue
                bcc     loc_C657
                ldx     #byte_84A4
loc_C657:
                ldy     #$90
                ldaa    MapValue
                jsr     sub_E4D0
                jsr     sub_C379
                brclr   BitFlags27, %01000000, loc_C671
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_C671
                jsr     sub_F363
loc_C671:
                brclr   BitFlags27, %00001000, loc_C67F
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$40
                beq     loc_C67F
                jsr     nullsub_2
loc_C67F:
                clra
                ldab    MapValue
                lsld
                lsld
                tst     byte_849D
                bmi     loc_C68E
                addd    byte_849D
                bra     loc_C696
loc_C68E:
                addd    byte_849D
                bgt     loc_C696
                ldd     #$00
loc_C696:
                xgdy
                ldaa    Ram_85
                jsr     ScaleYbyA
                xgdy
                lsld
                bcc     loc_C6A5
                ldd     #$FFFF
loc_C6A5:
                std     DoubleTempC
                brset   BitFlags27, %00001000, loc_C6B6
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$08
                beq     loc_C6B6
                jsr     sub_F36D
loc_C6B6:
                ldaa    #$01
                ldab    Ram_86
                ldx     #DoubleTempC
                jsr     sub_E406
                ldx     #$75
                jsr     ScaleXbyB_somethingelse
                std     DoubleTempB
                brclr   BitFlags27, %00001000, loc_C6D7
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$40
                beq     loc_C6D7
                jsr     nullsub_2
loc_C6D7:
                clra
                ldab    Ram_B1
                lsld
                addb    ValueFromAdaptiveMemory
                adca    #$00
                tst     byte_849F
                bmi     loc_C6EE
                addd    byte_849F
                bvc     loc_C6F1
                ldd     #$7FFF
                bra     loc_C6F1
loc_C6EE:
                addd    byte_849F
loc_C6F1:
                std     Ram_C0
                ldx     #byte_8418
                ldaa    MapValue
                jsr     sub_E3AA
                stab    Ram_C2
                ldd     DoubleTempB
                addd    MAPLoadFactor
                bcs     loc_C70C
                addd    Ram_A7
                bcs     loc_C70C
                addd    Ram_A4
                bcc     loc_C70F
loc_C70C:
                ldd     #$FFFF
loc_C70F:
                subd    Ram_AD
                bcs     loc_C717
                subd    Ram_AA
                bcc     loc_C71A
loc_C717:
                ldd     #$00
loc_C71A:
                std     DoubleTempB
                ldy     DoubleTempB
                ldaa    Ram_C2
                jsr     ScaleYbyA
                sty     DoubleTempC
                ldd     DoubleTempB
                subd    DoubleTempC
                std     DoubleTempB
                tst     Ram_C0
                bpl     loc_C74F
                ldd     #$00
                subd    Ram_C0
                cpd     DoubleTempB
                bpl     loc_C74A
                ldd     DoubleTempB
                addd    Ram_C0
                bra     loc_C756
loc_C74A:
                ldd     #$00
                bra     loc_C756
loc_C74F:
                addd    Ram_C0
                bcc     loc_C756
                ldd     #$FFFF
loc_C756:
                std     Ram_73
loc_C758:
                brset   BitFlags27, %00001000, loc_C766
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$08
                beq     loc_C766
                jsr     sub_F36D
loc_C766:
                brclr   BitFlags27, %01000000, loc_C774
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_C774
                jsr     sub_F363
loc_C774:
                brset   IPL1, %01000000, loc_C7C4
                ldx     #byte_84A5
                ldaa    MapValue2
                cmpa    MapValue
                bcc     loc_C784
                ldx     #byte_84A4
loc_C784:
                ldy     #$90
                ldaa    MapValue
                jsr     sub_E4D0
                brclr   BitFlags66_t3, %01000000, loc_C79B
                brclr   Ram_30, %00000100, loc_C79B
                clra
                clrb
                std     InjectorPulsewidth_HB
                bra     loc_C7D8
loc_C79B:
                ldaa    CoolantTemp
                cmpa    byte_845D
                bcs     loc_C7BE
                ldaa    ChargeTempVolts
                cmpa    byte_845E
                bcs     loc_C7BE
                ldaa    Ram_80
                cmpa    #$FF
                beq     loc_C7BE
                inca
                staa    Ram_80
                cmpa    byte_845F
                bhi     loc_C7BE
                ldd     #$00
                std     InjectorPulsewidth_HB
                bra     loc_C7D8
loc_C7BE:
                ldd     Ram_71
                std     InjectorPulsewidth_HB
                bra     loc_C7D8
loc_C7C4:
                ldd     Ram_71
                beq     loc_C7D5
                subd    word_845B
                bcs     loc_C7D1
                std     Ram_71
                bra     loc_C7D5
loc_C7D1:
                clra
                clrb
                std     Ram_71
loc_C7D5:
                jsr     sub_C7FB
loc_C7D8:
                jsr     sub_C2E6
                brclr   BitFlags27, %01000000, loc_C7E9
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$10
                beq     loc_C7E9
                jsr     sub_F363
loc_C7E9:
                brclr   BitFlags27, %00001000, loc_C7F7
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #$40
                beq     loc_C7F7
                jsr     nullsub_2
loc_C7F7:
                jsr     sub_C34E
                rts
;;
sub_C7FB:
                ldx     #CCDFlags5
                brclr   $00,x, %00100000, loc_C808
                ldd     #$00
                jmp     loc_C898
loc_C808:
                brset   BitFlags2c, %10000000, loc_C80F
                jmp     loc_C866
loc_C80F:
                ldaa    byte_8646
                ldab    TargetIdleSpeedHB
                mul
                addd    TargetIdleSpeedHB
                bcc     loc_C81C
                ldd     #$FFFF
loc_C81C:
                staa    RpmRelated0087
                cpd     EngineRpm_HB
                bcs     loc_C825
                bra     loc_C85B
loc_C825:
                ldx     Ram_73
                ldaa    byte_8645
                bne     loc_C833
                cpx     byte_8643
                bhi     loc_C85B
                bra     loc_C866
loc_C833:
                cmpa    #$01
                bne     loc_C842
                brclr   BitFlags66_t3, %10000000, loc_C866
                cpx     byte_8643
                bhi     loc_C85B
                bra     loc_C866
loc_C842:
                cmpa    #$02
                bne     loc_C851
                brset   BitFlags66_t3, %10000000, loc_C85B
                cpx     byte_8643
                bhi     loc_C85B
                bra     loc_C866
loc_C851:
                cmpa    #$03
                bne     loc_C85B
                brset   BitFlags66_t3, %10000000, loc_C85B
                bra     loc_C866
loc_C85B:
                bclr    BitFlags2c, %10000000
                bset    BitFlags2c, %00001000
                ldaa    byte_8642
                staa    CounterDn_b7_o2
loc_C866:
                ldy     byte_84A1
                brclr   BitFlags2c, %10000000, loc_C872
                clra
                clrb
                bra     loc_C883
loc_C872:
                ldd     Ram_73
                cpd     Ram_71
                bcc     loc_C87B
                ldd     Ram_71
loc_C87B:
                cpd     byte_84A1
                bcc     loc_C883
                xgdy
loc_C883:
                ldx     #UNe_6481
                brclr   $00,x, %00000100, loc_C898
                ldaa    UNe_6483
                clrb
                brset   $00,x, %00001000, loc_C895
                ldab    UNe_6484
loc_C895:
                lsrd
                lsrd
                lsrd
loc_C898:
                std     InjectorPulsewidth_HB
                rts
;;
byte_C89B:      db $00
                db $00
                db $00
                db $20
                db $20
                db $30
                db $20
                db $00
                db $20
                db $20
                db $20
                db $00
                db $30
                db $30
                db $30
                db $30
                db $30
                db $20
                db $20
                db $20
;;
sub_C8AF:
                jsr     sub_DAEF
                jsr     sub_DBE4
                ldab    DRBSerialMode
                bitb    #%11000000
                bne     locret_C91A
                ldaa    BAUD_SerialBaudRate
                anda    #$37
                cmpa    #$22
                beq     loc_C8CA
                ldaa    #$22
                staa    BAUD_SerialBaudRate
                rts
loc_C8CA:
                ldaa    SCSR_SerialStatus
                bita    #%00001110
                beq     loc_C8D5
                ldaa    SCDR_SerialData
                rts
loc_C8D5:
                bita    #%00100000
                bne     loc_C8EC
                brset   DRBSerialMode, %00001111, loc_C8E1
                incb
                stab    DRBSerialMode
                rts
loc_C8E1:
                brclr   DRBSerialMode, %00110000, locret_C8EB
                bclr    DRBSerialMode, %00110000
                clr     DRBPointer1
locret_C8EB:
                rts
loc_C8EC:
                ldaa    SCDR_SerialData
                staa    SCDR_SerialData
                andb    #$F0
                stab    DRBSerialMode
                bitb    #%00110000
                bne     loc_C91B
                staa    DRBPointer1
                cmpa    #$14
                beq     loc_C903
                bclr    BitFlags6d_t3, %00001000
loc_C903:
                clr     DRBPointer2
                clr     DRBPointer3
                tab
                subb    #$10
                cmpb    #$14
                bcc     locret_C91A
                ldx     #byte_C89B
                abx
                ldab    $00,x
                orab    DRBSerialMode
                stab    DRBSerialMode
locret_C91A:
                rts
loc_C91B:
                bitb    #%00100000
                beq     loc_C922
                jmp     loc_C93D
loc_C922:
                bitb    #%00010000
                bne     loc_C929
                jmp     loc_C95A
loc_C929:
                staa    DRBPointer3
                andb    #$CF
                stab    DRBSerialMode
                rts
loc_C930:
                clr     DRBPointer1
                ldab    DRBPointer3
                ldaa    DRBPointer2
                xgdx
                ldaa    $00,x
loc_C93A:
                jmp     sub_CBA8
loc_C93D:
                staa    DRBPointer2
                andb    #$DF
                stab    DRBSerialMode
                ldab    DRBPointer1
                cpd     #TIC3_Counter_IC3_CrankSensor
                bne     loc_C963
                brset   BitFlags66_t3, %10000000, loc_C95A
                brset   BitFlags27, %00000001, loc_C968
                brclr   BitFlags68_t3, %00010000, loc_C968
                bclr    BitFlags68_t3, %10000000
loc_C95A:
                clr     DRBPointer1
                clr     DRBPointer2
                clr     DRBPointer3
loc_C963:
                bclr    BitFlags6d_t3, %00001000
                bra     locret_C96B
loc_C968:
                bset    BitFlags6d_t3, %00001000
locret_C96B:
                rts
loc_C96C:
                clr     DRBPointer1
                brset   BitFlags6a_t3, %01000000, loc_C988
                brset   BitFlags6a_t3, %00100000, loc_C988
                bset    BitFlags6a_t3, %01000000
                ldaa    DRBPointer3
                staa    DRBOffsetStored_LB
                ldab    DRBPointer2
                stab    DRBOffsetStored_HB
                ldaa    #$E2
                bra     loc_C93A
loc_C988:
                clra
                bra     loc_C93A
loc_C98B:
                ldx     #$00
                bra     loc_C9B3
loc_C990:
                ldx     #CountdownTimerFromKeyOn
                bra     loc_C9B3
loc_C995:
                ldx     #STe_64BA
                ldaa    DRBPointer2
                bne     loc_C9B0
                ldab    DRBPointer3
                abx
                cpx     #UNk_64D0
                bcs     loc_C9B0
                ldaa    #$FF
                staa    STe_64BA
loc_C9A9:
                clr     DRBPointer1
                clra
                jmp     sub_CBA8
loc_C9B0:
                ldx     #STe_64BA
loc_C9B3:
                clr     DRBPointer1
                ldab    DRBPointer2
                ldaa    DRBPointer3
                abx
                staa    $00,x
                ldaa    #$E5
                jmp     sub_CBA8
loc_C9C2:
                ldx     #STe_64BA
                ldab    DRBPointer3
                cmpb    $01,x
                beq     loc_C9D0
                comb
                cmpb    $01,x
                bne     loc_C9FB
loc_C9D0:
                ldab    DRBPointer2
                cmpb    $00,x
                bne     loc_C9FF
                abx
                ldaa    $01,x
                cmpa    #$39
                bne     loc_C9A9
                ldx     #STe_64BA
                clra
loc_C9E1:
                inx
                adda    $01,x
                decb
                bne     loc_C9E1
                cmpa    DRBPointer3
                beq     loc_C9F4
                ldab    DRBPointer3
                comb
                cba
                bne     loc_C9FB
                jmp     STe_64BC
loc_C9F4:
                com     DRBPointer3
                ldaa    #$E4
                bra     loc_CA2B
loc_C9FB:
                ldaa    #$01
                bra     loc_CA05
loc_C9FF:
                ldaa    #$02
                bra     loc_CA05
loc_CA03:
                ldaa    #$03
loc_CA05:
                clr     DRBPointer1
                bra     loc_CA2B
loc_CA0A:
                ldaa    DRBPointer2
                bne     loc_CA13
                bclr    BitFlags2a, %00000001
                bra     loc_C9A9
loc_CA13:
                ldaa    DRBPointer3
                bne     loc_CA2E
                brset   BitFlags66_t3, %10000000, loc_C9FF
                brset   BitFlags27, %00000001, loc_CA23
                brset   BitFlags68_t3, %00010000, loc_CA03
loc_CA23:
                coma
                staa    DRBPointer3
                ldaa    #$01
                bset    BitFlags2a, %00000001
loc_CA2B:
                jmp     sub_CBA8
loc_CA2E:
                brset   BitFlags66_t3, %10000000, loc_CA3A
                brset   BitFlags27, %00000001, locret_CA3D
                brclr   BitFlags68_t3, %00010000, locret_CA3D
loc_CA3A:
                clr     DRBPointer1
locret_CA3D:
                rts
loc_CA3E:
                ldaa    DRBPointer3
                beq     loc_CA67
                ldaa    DRBPointer2
                cmpa    #$01
                beq     loc_CA52
                cmpa    #$02
                beq     loc_CA56
                cmpa    #$03
                beq     loc_CA5A
                bra     loc_CA3A
loc_CA52:
                ldd     EngineRpm_HB
                bra     loc_CA5C
loc_CA56:
                ldd     InjectorPulsewidth_HB
                bra     loc_CA5C
loc_CA5A:
                ldd     TargetIdleSpeedHB
loc_CA5C:
                stab    Temp0
                jsr     sub_CBA8
                ldaa    Temp0
                bra     loc_CA2B
loc_CA67:
                coma
                staa    DRBPointer3
                rts
loc_CA6B:
                clr     DRBPointer1
                ldab    TimerOverflowsBetweenCamPulses
                cmpb    #$50
                bls     loc_CA76
                bra     loc_CA7A
loc_CA76:
                clra
                jmp     sub_CBA8
loc_CA7A:
                ldaa    DRBPointer2
                cmpa    #$01
                beq     loc_CA91
                cmpa    #$02
                beq     loc_CAA2
                cmpa    #$03
                beq     loc_CAAA
                cmpa    #$04
                beq     loc_CAB6
                ldaa    #$01
                jmp     sub_CBA8
loc_CA91:
                brclr   BitFlags6a_t3, %01000000, loc_CA9A
                ldaa    #$02
                jmp     sub_CBA8
loc_CA9A:
                jsr     sub_CABD
loc_CA9D:
                ldaa    #$F0
                jmp     sub_CBA8
loc_CAA2:
                ldaa    #$80
                staa    ValueFromAdaptiveMemory
                staa    Ram_0B
                bra     loc_CA9D
loc_CAAA:
                sei
                bset    BitFlags36_t3, %01000000
                ldaa    #$DF
                staa    CurrentAisPosition
                cli
                jmp     loc_CA9D
loc_CAB6:
                ldaa    byte_801B
                staa    LowestSessionTpsVolts
                bra     loc_CA9D
;;
sub_CABD:
                clra
                clrb
                std     ErrorBitRegister0
                std     ErrorBitRegister2
                std     ErrorBitRegisterStored0
                std     ErrorBitRegisterStored2
                std     ErrorCodeUpdateKeyOnCount
                staa    ErrorCodeUpdateKeyOnCount3
                std     b5C_IPL1_t3
                staa    b5d_IPL2
                staa    UNe_64B9
                jsr     sub_E70E
                rts
;;
off_CAD6:       dw loc_CBB1
                dw loc_CBDD
                dw loc_CBED
                dw loc_CB67
                dw locret_CBFF
                dw loc_C930
                dw loc_CC07
                dw loc_CB29
                dw locret_CBFF
                dw locret_CBFF
                dw locret_CBFF
                dw loc_CC00
                dw loc_C96C
                dw loc_C98B
                dw loc_C990
                dw loc_C995
                dw loc_C9C2
                dw loc_CA0A
                dw loc_CA3E
                dw loc_CA6B
;;
sub_CAFE:
                ldaa    DRBSerialMode
                bita    #$30
                beq     loc_CB05
                rts
loc_CB05:
                ldaa    DRBPointer1
                beq     locret_CB28
                cmpa    #$0A
                beq     locret_CB28
                tab
                ldx     #off_CAD6
                subb    #$10
                bcs     loc_CB1F
                aslb
                cmpb    #$28
                bcc     loc_CB1F
                abx
                ldx     $00,x
                jmp     $00,x
loc_CB1F:
                bclr    DRBSerialMode, %00110000
                clra
                staa    DRBPointer1
                jmp     sub_CBA8
locret_CB28:
                rts
loc_CB29:
                clra
                ldab    TimerOverflowsBetweenCamPulses
                cmpb    #$50
                bhi     loc_CB38
                staa    DRBPointer1
                bclr    DRBSerialMode, %00110000
                jmp     sub_CBA8
loc_CB38:
                ldab    DRBSerialMode
                andb    #$0F
                cmpb    #$03
                bls     loc_CB43
                clr     BitFlags65_t3
loc_CB43:
                ldaa    BitFlags65_t3
                inca
                cmpa    #$18
                bls     loc_CB5D
                brset   BitFlags6a_t3, %01000000, loc_CB60
                clra
                staa    DRBPointer1
                staa    BitFlags65_t3
                jsr     sub_CABD
                ldaa    #$E0
                jmp     sub_CBA8
loc_CB5D:
                staa    BitFlags65_t3
loc_CB60:
                ldd     #$FF00
                stab    DRBPointer1
                bra     sub_CBA8
loc_CB67:
                ldab    TimerOverflowsBetweenCamPulses
                cmpb    #$50
                bls     loc_CB99
                ldaa    DRBPointer2
                asla
                bcs     loc_CB99
                cmpa    #$4E
                bhi     loc_CB99
                ldx     #AtmFuunctionTable-2
                ldab    DRBPointer2
                aslb
                abx
                ldd     $00,x
                cpd     #ATM_SerialOut_0
                beq     loc_CB99
                ldaa    DRBPointer2
                brset   BitFlags27, %00000001, loc_CB91
                cmpa    #$17
                beq     loc_CB99
                bra     loc_CB9E
loc_CB91:
                cmpa    #$0F
                beq     loc_CB99
                cmpa    #$16
                bne     loc_CB9E
loc_CB99:
                clra
                staa    DRBPointer1
                staa    DRBPointer2
loc_CB9E:
                cmpa    ATMOffset
                beq     sub_CBA8
                staa    ATMOffset
                ldab    #$02
                stab    KeyOnOrEngineRunningTime
;;
sub_CBA8:
                ldab    SCSR_SerialStatus
                bpl     sub_CBA8
                staa    SCDR_SerialData
                rts
loc_CBB1:
                ldx     #$15
                ldab    DRBPointer2
                cmpb    #$07
                bhi     loc_CBC7
                negb
                addb    #$07
                abx
                inc     DRBPointer2
                ldaa    $00,x
                beq     loc_CBC7
                bra     sub_CBA8
loc_CBC7:
                clr     DRBPointer1
                ldaa    #$FE
                bsr     sub_CBA8
                adda    #$10
                ldx     #$14
loc_CBD3:
                inx
                cpx     #$1D
                bcc     sub_CBA8
                adda    $00,x
                bra     loc_CBD3
loc_CBDD:
                ldaa    ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
                brclr   DRBPointer2, %11111111, loc_CBE8
                ldaa    ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB
                clr     DRBPointer1
loc_CBE8:
                inc     DRBPointer2
                bra     sub_CBA8
loc_CBED:
                bset    DRBSerialMode, %10000000
                clr     DRBPointer1
loc_CBF3:
                ldaa    SCSR_SerialStatus
                bita    #%01000000
                beq     loc_CBF3
                ldaa    #$01
                staa    BAUD_SerialBaudRate
locret_CBFF:
                rts
loc_CC00:
                bset    DRBSerialMode, %01000000
                clr     DRBPointer1
                rts
loc_CC07:
                ldaa    DRBPointer2
                cmpa    #$80
                beq     loc_CC19
                cmpa    #$81
                beq     loc_CC44
                cmpa    #$82
                beq     loc_CC49
                clr     DRBPointer1
                rts
loc_CC19:
                ldx     #byte_8002
                brclr   BitFlags6a_t3, %00000010, loc_CC23
                ldx     #byte_8007
loc_CC23:
                ldab    DRBPointer3
                cmpb    #$04
                beq     loc_CC32
                inc     DRBPointer3
                abx
                ldaa    $00,x
                jmp     sub_CBA8
loc_CC32:
                ldaa    $00,x
                adda    $01,x
                adda    $02,x
                adda    $03,x
loc_CC3A:
                adda    #$16
                adda    DRBPointer2
                clr     DRBPointer1
loc_CC41:
                jmp     sub_CBA8
loc_CC44:
                ldx     #byte_800D
                bra     loc_CC23
loc_CC49:
                inc     DRBPointer3
                ldaa    byte_8006
                brclr   BitFlags6a_t3, %00000010, loc_CC56
                ldaa    byte_800B
loc_CC56:
                ldab    DRBPointer3
                cmpb    #$01
                beq     loc_CC41
                cmpb    #$05
                bcc     loc_CC3A
                clra
                bra     loc_CC41
;;
AtmFuunctionTable:
                dw loc_CE43
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw loc_CEED
                dw loc_CEE8
                dw loc_CEE3
                dw loc_CDD4
                dw loc_CDAB
                dw loc_CD9C
                dw loc_CD46
                dw loc_CD3A
                dw loc_CD26
                dw loc_CE1F
                dw loc_CF17
                dw loc_CDB9
                dw loc_CD90
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw loc_CDE1
                dw loc_CD84
                dw loc_CDC5
                dw loc_CDB9
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw loc_CD5F
                dw loc_CEDE
                dw loc_CEA3
                dw loc_CE93
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
                dw ATM_SerialOut_0
; used in the V8 code
;                dw loc_CE8A
;                dw loc_CE7A
                db $CD
;;
Byt_DRBMemoryTable:
                db $65
                db $FF
                db $53
                db $FF
                db $FF
                db $54
                db $59
                db $5A
                db $06
                db $FF
                db $5B
                db $50
                db $08
                db $0A
                db $0B
                db $0D
                db $46
                db $46
                db $FF
                db $1D
                db $FF
                db $4E
                db $FF
                db $FF
                db $FF
                db $FF
                db $FF
                db $52
                db $58
                db $C4
                db $1E
                db $1F
                db $33
                db $FF
                db $4B
                db $65
                db $64
                db $FF
                db $FF
                db $E1
                db $FF
                db $FF
                db $FF
                db $FF
                db $FF
                db $67

off_CCDE:       
                dw loc_CF87
                dw loc_CF98
                dw loc_CF9C
                dw loc_CFB1
                dw loc_CFB4
                dw loc_CFB7
                dw loc_CFC1
off_CCEC:       
                dw loc_CFD9
                dw loc_CF6C
                dw loc_CF76
                dw loc_CF7A
                dw loc_CF80
;;
sub_CCF6:
                ldaa    TimerOverflowsBetweenCamPulses
                cmpa    #$50
                bhi     loc_CCFF
                clr     ATMOffset
loc_CCFF:
                ldab    ATMOffset
                bne     loc_CD06
                jmp     ATM_SerialOut_0
loc_CD06:
                ldaa    KeyOnOrEngineRunningTime
                cmpa    #$96
                bcs     loc_CD1D
                clrb
                ldaa    DRBPointer1
                cmpa    #$13
                bne     loc_CD17
                stab    DRBPointer1
                stab    DRBPointer2
loc_CD17:
                clr     ATMOffset
                jmp     ATM_SerialOut_0
loc_CD1D:
                ldx     #AtmFuunctionTable-2
                aslb
                abx
                ldx     $00,x
                jmp     $00,x
loc_CD26:
                ldaa    PIA2_Buffer_t3
                oraa    #$C0
                ldab    Counter_MainLoop
                cmpb    #$55
                bcs     loc_CDA6
                anda    #$3F
                cmpb    #$AA
                bcs     loc_CDA6
                oraa    #$80
                bra     loc_CDA6
loc_CD3A:
                ldaa    PIA2_Buffer_t3
                oraa    #$20
                brset   Counter_MainLoop, %10000000, loc_CDA6
                anda    #$DF
                bra     loc_CDA6
loc_CD46:
                ldaa    TCTL1_TimerControlReg1
                anda    #$FE
                staa    TCTL1_TimerControlReg1
                ldaa    #$08
                staa    CFORC_TimerForceCompare
                ldaa    PIA2_Buffer_t3
                oraa    #$10
                brset   Counter_MainLoop, %10000000, loc_CDA6
                anda    #$EF
                bra     loc_CDA6
loc_CD5F:
                ldaa    PIA2_Buffer_t3
                anda    #$EF
                bra     loc_CDA6
                brset   BitFlags27, %00001000, loc_CD75
                ldaa    PIA2_Buffer_t3
                oraa    #$08
                brset   Counter_MainLoop, %10000000, loc_CDA6
                anda    #$F7
                bra     loc_CDA6
loc_CD75:
                ldaa    PIA1_Buffer_t3
                oraa    #$80
                brset   Counter_MainLoop, %10000000, loc_CD7F
                anda    #$7F
loc_CD7F:
                staa    PIA1_Buffer_t3
                jmp     ATM_SerialOut_0
loc_CD84:
                ldaa    PIA2_Buffer_t3
                oraa    #$04
                brset   Counter_MainLoop, %10000000, loc_CDA6
                anda    #$FB
                bra     loc_CDA6
loc_CD90:
                ldaa    PIA2_Buffer_t3
                oraa    #$02
                brset   Counter_MainLoop, %10000000, loc_CDA6
                anda    #$FD
                bra     loc_CDA6
loc_CD9C:
                ldaa    PIA2_Buffer_t3
                oraa    #$01
                brset   Counter_MainLoop, %10000000, loc_CDA6
                anda    #$FE
loc_CDA6:
                staa    PIA2_Buffer_t3
                jmp     ATM_SerialOut_0
loc_CDAB:
                ldaa    PIA1_Buffer_t3
                anda    #$7F
                ldab    Counter_MainLoop
                andb    #$78
                beq     loc_CDCF
                oraa    #$80
                bra     loc_CDCF
loc_CDB9:
                ldaa    PIA1_Buffer_t3
                oraa    #$20
                brset   Counter_MainLoop, %10000000, loc_CDCF
                anda    #$DF
                bra     loc_CDCF
loc_CDC5:
                ldaa    PIA1_Buffer_t3
                oraa    #$10
                brset   Counter_MainLoop, %10000000, loc_CDCF
                anda    #$EF
loc_CDCF:
                staa    PIA1_Buffer_t3
                jmp     ATM_SerialOut_0
loc_CDD4:
                ldaa    #$10
                brset   Counter_MainLoop, %10000000, loc_CDDC
                ldaa    #$70
loc_CDDC:
                staa    DesiredNewAisPosition
                jmp     ATM_SerialOut_0
loc_CDE1:
                ldd     PIA1_Buffer_t3
                oraa    #$10
                brset   BitFlags27, %00000001, loc_CDEB
                oraa    #$20
loc_CDEB:
                brset   BitFlags27, %00001000, loc_CDF3
                orab    #$EB
                bra     loc_CDF7
loc_CDF3:
                oraa    #$80
                orab    #$E3
loc_CDF7:
                brset   BitFlags2d, %00010000, loc_CDFD
                orab    #$10
loc_CDFD:
                brset   Counter_MainLoop, %10000000, loc_CE1B
                anda    #$EF
                brset   BitFlags27, %00000001, loc_CE09
                anda    #$DF
loc_CE09:
                brset   BitFlags27, %00001000, loc_CE11
                andb    #$14
                bra     loc_CE15
loc_CE11:
                anda    #$7F
                andb    #$1C
loc_CE15:
                brset   BitFlags2d, %00010000, loc_CE1B
                andb    #$EF
loc_CE1B:
                std     PIA1_Buffer_t3
                bra     loc_CDD4
loc_CE1F:
                bclr    PIA2_Buffer_t3, %00010000
                ldx     #SwitchPortAccessReg1
                sei
                ldaa    SwitchPortAccessReg1
                anda    #$FB
                brset   Counter_MainLoop, %10000000, loc_CE31
                oraa    #$04
loc_CE31:
                staa    SwitchPortAccessReg1
                bset    $02,x, %00000100
                ldaa    #$14
loc_CE39:
                deca
                bne     loc_CE39
                bclr    $02,x, %00000100
                cli
                jmp     ATM_SerialOut_0
loc_CE43:
                bclr    PIA2_Buffer_t3, %00010000
                ldab    Counter_MainLoop
                aslb
                beq     loc_CE4E
                jmp     ATM_SerialOut_0
loc_CE4E:
                sei
                ldaa    TCTL1_TimerControlReg1
                oraa    #$03
                staa    TCTL1_TimerControlReg1
                ldab    #$08
                stab    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    #$06D6
                std     TOC5_Counter_OC5_Dwell
                ldaa    TCTL1_TimerControlReg1
                anda    #$FE
                staa    TCTL1_TimerControlReg1
                cli
                jmp     ATM_SerialOut_0

byte_CE71:      
                db $40
                db $40
                db $BF
byte_CE74:      
                db $10
                db $20
                db $EF
byte_CE77:      
                db $04
                db $10
                db $FB

loc_CE7A:
                brset   BitFlags27, %00010000, loc_CE81
                jmp     ATM_SerialOut_0
loc_CE81:
                ldx     #TOC4_Counter_OC4
                ldy     #byte_CE77
                bra     loc_CEB1
loc_CE8A:
                brset   BitFlags27, %00010000, loc_CE91
                jmp     ATM_SerialOut_0
loc_CE91:
                bra     loc_CE9A
loc_CE93:
                brset   BitFlags27, %01000000, loc_CE9A
                jmp     ATM_SerialOut_0
loc_CE9A:
                ldx     #TOC3_Counter_OC3
                ldy     #byte_CE74
                bra     loc_CEB1
loc_CEA3:
                brset   BitFlags27, %01000000, loc_CEAA
                jmp     ATM_SerialOut_0
loc_CEAA:
                ldx     #TOC2_Counter_OC2
                ldy     #byte_CE71
loc_CEB1:
                bclr    PIA2_Buffer_t3, %00010000
                ldab    Counter_MainLoop
                aslb
                beq     loc_CEBC
                jmp     ATM_SerialOut_0
loc_CEBC:
                sei
                ldd     $00,y
                oraa    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    #$01A9
                std     $00,x
                ldaa    $02,y
                anda    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                cli
                jmp     ATM_SerialOut_0
loc_CEDE:
                ldx     #InjectorPulsewidth_HB_Cyl1
                bra     loc_CEF0
loc_CEE3:
                ldx     #InjectorPulsewidth_HB_Cyl2
                bra     loc_CEF0
loc_CEE8:
                ldx     #InjectorPulsewidth_HB_Cyl3
                bra     loc_CEF0
loc_CEED:
                ldx     #InjectorPulsewidth_HB_Cyl4
loc_CEF0:
                bclr    PIA2_Buffer_t3, %00010000
                ldab    Counter_MainLoop
                aslb
                bne     ATM_SerialOut_0
                sei
                ldaa    PIA_Ctrl_2
                bita    #$F0
                beq     loc_CF05
                anda    #$0F
                staa    PIA_Ctrl_2
loc_CF05:
                ldaa    #$F8
                cmpa    PIA_Ctrl_5
                beq     loc_CF0F
                staa    PIA_Ctrl_5
loc_CF0F:
                ldd     #$01A9
                std     $00,x
                cli
                bra     ATM_SerialOut_0
loc_CF17:
                ldaa    PIA3_Buffer_t3
                eora    #$02
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     ATM_SerialOut_0
ATM_SerialOut_0:
                ldaa    DRBPointer1
                cmpa    #$14
                beq     loc_CF2D
                cmpa    #$1A
                beq     loc_CF5C
locret_CF2C:
                rts
loc_CF2D:
                ldab    DRBPointer2
                cmpb    #$40
                bcc     loc_CF4B
                cmpb    #$00
                beq     locret_CF2C
                cmpb    #$2D
                bhi     locret_CF2C
                ldx     #Byt_DRBMemoryTable
                clra
                abx
                ldab    $00,x
                cmpb    #$FF
                beq     locret_CF2C
                xgdx
                ldaa    $00,x
                bra     loc_CFAE
loc_CF4B:
                subb    #$40
                aslb
                bcs     locret_CF2C
                cmpb    #$10
                bcc     locret_CF2C
                ldx     #off_CCDE
loc_CF57:
                abx
                ldx     $00,x
                jmp     $00,x
loc_CF5C:
                ldx     #off_CCEC
                ldab    DRBPointer2
                aslb
                cmpb    #$00
                beq     locret_CF2C
                cmpb    #$08
                bls     loc_CF57
                bra     locret_CF2C
loc_CF6C:
                ldaa    StartupSwitchMirror1
                brclr   BitFlags27, %11000000, loc_CFAE
                eora    #$82
                bra     loc_CFAE
loc_CF76:
                ldaa    PIA2_Buffer_t3
                bra     loc_CFAE
loc_CF7A:
                ldaa    PIA1_Buffer_t3
                eora    #$08
                bra     loc_CFAE
loc_CF80:
                ldaa    SwitchPortAccessReg1
                anda    #$70
                bra     loc_CFAE
loc_CF87:
                sei
                ldaa    #$10
                staa    ADCTL_A2DControlReg
loc_CF8D:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_CF8D
                ldaa    ADR1_A2DResults1
                cli
                bra     loc_CFAE
loc_CF98:
                ldaa    VehicleSpeedx8_Scaled
                bra     loc_CFAE
loc_CF9C:
                ldab    O2SensorVolts
                ldaa    #$FF
                cmpb    byte_89F5
                bhi     loc_CFAC
                cmpb    byte_89F6
                bhi     loc_CFAE
                anda    #$A0
loc_CFAC:
                anda    #$B1
loc_CFAE:
                jmp     sub_CBA8
loc_CFB1:
                jmp     locret_CF2C
loc_CFB4:
                jmp     locret_CF2C
loc_CFB7:
                ldaa    BaroPressure
                suba    MapValue
                bcc     loc_CFBE
                clra
loc_CFBE:
                jmp     loc_CFAE
loc_CFC1:
                ldaa    TpsVolts
                suba    LowestSessionTpsVolts
                bcc     loc_CFC8
                clra
loc_CFC8:
                ldab    byte_8A06
                staa    Temp0
                mul
                adca    Temp0
                bcc     loc_CFD6
                ldaa    #$FF
loc_CFD6:
                jmp     loc_CFAE
loc_CFD9:
                ldaa    CalculatedSparkAdvance
                jmp     loc_CFAE
;;
sub_CFDE:
                ldx     #$8000
                ldd     #$9200
                std     Temp0
                clra
                ldab    #$08
loc_CFEA:
                bsr     sub_D004
                psha
                pshb
                jsr     sub_E4FD
                ldaa    #$12
                adda    Temp0
                staa    Temp0
                ldaa    SwitchPortAccessReg1
                bita    #%01000000
                pulb
                pula
                beq     locret_D02D
                bra     loc_CFEA
;;
sub_D004:
                cpx     #$B600
                bne     loc_D012
                inc     Temp0
                inc     Temp0
                ldx     #$B800
loc_D012:
                adda    $00,x
                adda    $01,x
                adda    $02,x
                adda    $03,x
                adda    $04,x
                adda    $05,x
                adda    $06,x
                adda    $07,x
                abx
                cpx     Temp0
                bne     loc_D012
                tst     Temp0
                beq     loc_D02E
locret_D02D:
                rts
loc_D02E:
                pulx
                suba    byte_8005
                beq     locret_D02D
                ldd     #$0201
                jmp     ThrowNonCriticalError
loc_D03A:
                ldaa    Counter_MainLoop
                asla
                asla
                bne     locret_D050
                ldaa    LastCamFallingEdgeTime2
                bita    #%01110000
                beq     loc_D051
                suba    #$10
                bita    #%01110000
                beq     loc_D051
                staa    LastCamFallingEdgeTime2
locret_D050:
                rts
loc_D051:
                ldab    PIA1_Buffer_t3
                eorb    #$40
                stab    PIA1_Buffer_t3
                bita    #%00001111
                beq     loc_D064
                deca
                bita    #$0F
                beq     loc_D064
                oraa    #$10
                bra     loc_D099
loc_D064:
                tsta
                bmi     loc_D09D
                ldaa    #$AA
                ldab    DRBPointer2
                cmpb    #$FE
                beq     loc_D08D
                tstb
                bmi     loc_D099
                cmpb    #$08
                bcs     loc_D080
                ldx     #$B618
                abx
                brset   $00,x, %11111111, loc_D0E5
                bra     loc_D087
loc_D080:
                negb
                addb    #$07
                ldx     #ErrorBitRegister0
                abx
loc_D087:
                ldab    $00,x
                beq     loc_D099
                bra     loc_D08E
loc_D08D:
                clrb
loc_D08E:
                ldx     #ErrorCodesToDash_Table
                abx
                ldaa    $00,x
                anda    #$0F
                asla
                oraa    #$A0
loc_D099:
                staa    LastCamFallingEdgeTime2
                rts
loc_D09D:
                ldab    DRBPointer2
                cmpb    #$FF
                bne     loc_D0AF
                ldaa    ErrorCodeUpdateKeyOnCount
                cmpa    #$32
                bhi     loc_D0AF
                decb
                stab    DRBPointer2
                clrb
                bra     loc_D0D4
loc_D0AF:
                cmpb    #$FE
                bne     loc_D0B4
                incb
loc_D0B4:
                incb
                stab    DRBPointer2
                cmpb    #$08
                bcs     loc_D0C9
                brset   DRBPointer2, %10000000, loc_D0EE
                ldx     #$B618
                abx
                brset   $00,x, %11111111, loc_D0E5
                bra     loc_D0D0
loc_D0C9:
                negb
                addb    #$07
                ldx     #ErrorBitRegister0
                abx
loc_D0D0:
                ldab    $00,x
                beq     loc_D0E5
loc_D0D4:
                ldx     #ErrorCodesToDash_Table
                abx
                ldaa    $00,x
                lsra
                lsra
                lsra
                lsra
                asla
                oraa    #$40
                staa    LastCamFallingEdgeTime2
                rts
loc_D0E5:
                ldaa    #$4A
                staa    LastCamFallingEdgeTime2
                bset    DRBPointer2, $80
                rts
loc_D0EE:
                clra
                staa    DRBPointer1
                staa    DRBSerialMode
                staa    DRBPointer2
                rts
;;
ErrorCodesToDash_Table:
                db $12
                db $54
                db $53
                db $52
                db $51
                db $47
                db $46
                db $45
                db $44
                db $43
                db $42
                db $41
                db $37
                db $36
                db $35
                db $34
                db $33
                db $32
                db $31
                db $27
                db $27
                db $27
                db $26
                db $26
                db $26
                db $25
                db $24
                db $24
                db $23
                db $23
                db $22
                db $22
                db $21
                db $17
                db $16
                db $15
                db $14
                db $14
                db $13
                db $13
                db $11
                db $43
                db $43
                db $43
                db $42
                db $52
                db $32
                db $61
                db $62
                db $63
                db $45
                db $36
                db $35
                db $35
                db $32
                db $64
                db $65
                db $23
                db $23
                db $21
                db $51
                db $27
                db $21
                db $67
                db $52
                db $66
                db $66
                db $36
                db $53
                db $27
                db $27
                db $44
                db $16
                db $71
                db $72
                db $73
                db $74
                db $75
                db $51
                db $27
                db $27
                db $76

ThrowNonCriticalError:
                ldx     #TL_ErrorBitsMask1
loc_D14B:
                brclr   $00,x, %11111111, loc_D156
                cmpa    $00,x
                beq     loc_D1A2
                inx
                bra     loc_D14B
loc_D156:
                tstb
                bmi     loc_D161
                cmpa    ErrorBitRegisterStored3
                beq     loc_D19F
                cmpa    ErrorBitRegisterStored2
                beq     loc_D195
loc_D161:
                andb    #$7F
                stab    Temp0
                ldy     #$DC
                cmpa    $00,y
                beq     loc_D182
                iny
                cmpa    $00,y
                beq     loc_D182
                tst     $00,y
                beq     loc_D182
                dey
                tst     $00,y
                bne     loc_D1A2
loc_D182:
                staa    $00,y
                ldab    $02,y
                incb
                beq     loc_D1A5
                cmpb    Temp0
                bcc     loc_D1A5
                stab    $02,y
                clc
                rts
loc_D195:
                ldd     ErrorBitRegisterStored2
                staa    ErrorBitRegisterStored3
                stab    ErrorBitRegisterStored2
                ldaa    ErrorCodeUpdateKeyOnCount
                staa    ErrorCodeUpdateKeyOnCount2
loc_D19F:
                clr     ErrorCodeUpdateKeyOnCount
loc_D1A2:
                clra
                clc
                rts
loc_D1A5:
                tst     ErrorBitRegister0
                beq     loc_D1B5
                brset   BitFlags6a_t3, %01000000, loc_D1B2
                brclr   BitFlags6a_t3, %00100000, loc_D1B5
loc_D1B2:
                jmp     loc_D23D
loc_D1B5:
                clr     $00,y
                clr     $02,y
                ldx     #ErrorBitRegister0
loc_D1BE:
                cmpa    $00,x
                bne     loc_D1C7
                clrb
                stab    $00,x
                bra     loc_D1CF
loc_D1C7:
                inx
                cpx     #ErrorBitRegisterStored3
                bls     loc_D1BE
                ldab    #$FF
loc_D1CF:
                ldx     #ErrorBitRegisterStored3
                ldy     #$1D
                stab    Temp0
loc_D1D9:
                cpx     #ErrorBitRegisterStored1
                bcs     loc_D1EE
                psha
                ldab    $00,y
                ldaa    Temp0
                staa    $00,y
                iny
                stab    Temp0
                pula
loc_D1EE:
                ldab    $00,x
                staa    $00,x
                tba
                beq     loc_D228
                dex
                cpx     #ErrorBitRegister0
                bcc     loc_D1D9
                clr     ErrorCodeUpdateKeyOnCount
                sei
                brset   BitFlags6a_t3, %01000000, loc_D23D
                brset   BitFlags6a_t3, %00100000, loc_D23D
                bset    BitFlags6a_t3, %01000000
                cli
                staa    DRBOffsetStored_LB
                ldx     #$B61F
loc_D211:
                inx
                ldab    $00,x
                cba
                beq     loc_D223
                incb
                bne     loc_D211
                xgdx
                subd    #$B600
                stab    DRBOffsetStored_HB
                sec
                rts
loc_D223:
                bclr    BitFlags6a_t3, %01000000
                sec
                rts
loc_D228:
                cpy     #$1F
                bhi     loc_D238
                ldab    ErrorCodeUpdateKeyOnCount
                beq     loc_D23B
                ldab    Temp0
                stab    $00,y
loc_D238:
                clrb
                stab    ErrorCodeUpdateKeyOnCount
loc_D23B:
                sec
                rts
loc_D23D:
                clc
                cli
                rts
;;
gw_PIA1AManipulation_Table2:
                db $00, $00, $04, $00, $10, $20, $00, $80, $00, $00, $19, $00, $32, $0C, $00, $0E
;;
gw_PIA1AManipulation_Table:
                db $01, $02, $04, $08, $10, $20, $00, $00, $10, $11, $33, $51, $0A, $12, $00, $00
;;
sub_D260:
                sei
                ldab    SPCR_SerialPeripheralControl
                orab    #$01
                stab    SPCR_SerialPeripheralControl
                bclr    PIA3_Buffer_t3, %00000100
                ldab    PIA3_Buffer_t3
                stab    PIA3_Buffer_2_t3
                ldaa    PIA2_Buffer_t3
                cmpa    SPSR_SerialPeripheralStatus
                staa    SPDR_SerialPeripheralDataIO
                mul
                mul
                nop
                bset    PIA3_Buffer_t3, %00000100
                ldaa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldaa    SPDR_SerialPeripheralDataIO
                ldab    SPCR_SerialPeripheralControl
                andb    #$FC
                stab    SPCR_SerialPeripheralControl
                staa    Temp1_t3
                cli
                brclr   BitFlags2e, %01000000, loc_D2FA
                eora    PIA2_Buffer_t3_Temp
                anda    byte_89DB
                ldx     #gw_PIA1AManipulation_Table
                ldab    Counter_MainLoop
                andb    #$07
                abx
                bita    $00,x
                beq     loc_D2FA
                ldaa    CountdownTimerFromKeyOn
                bne     loc_D2FA
                ldaa    SwitchPortAccessReg1
                bita    #$40
                bne     loc_D2FA
                ldaa    BatteryVolts
                cmpa    #$A0
                bcs     loc_D2FA
                ldaa    $08,x
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
loc_D2D2:
                brset   b5D_IPL2_t3, %00001000, loc_D2FA
                jsr     ThrowNonCriticalError
                bcc     loc_D2FA
                bset    b5D_IPL2_t3, %00001000
                bra     loc_D2FA
loc_D2E0:
                brset   b5D_IPL2_t3, %00100000, loc_D2FA
                jsr     ThrowNonCriticalError
                bcc     loc_D2FA
                bset    b5D_IPL2_t3, %00100000
                bra     loc_D2FA
loc_D2EE:
                brset   b5D_IPL2_t3, %00000100, loc_D2FA
                jsr     ThrowNonCriticalError
                bcc     loc_D2FA
                bset    b5D_IPL2_t3, %00000100
loc_D2FA:
                ldaa    PIA2_Buffer_t3
                staa    PIA2_Buffer_t3_Temp
                bset    BitFlags2e, %01000000
                rts
;;
sub_D303:
                ldaa    EngineRpm_HB
                cmpa    #$3F
                bcs     loc_D324
                brclr   BitFlags27, %00100000, loc_D324
                ldaa    BitFlags_BF_t3
                cmpa    #$83
                beq     loc_D324
                cmpa    #$81
                beq     loc_D324
                ldd     TCNT_Counter_FreeRunning16bit
                subd    TIC1_Counter_IC1_CamSensor
                cpd     #$FA
                bcs     loc_D324
                rts
loc_D324:
                ldaa    PIA1_Buffer_t3
                adda    #$C3
                staa    Temp0
                ldab    #$40
                ldaa    #$61
                ldy     #PORTA_PortA
                ldx     #SwitchPortAccessReg1
                sei
                bset    $00,x, %00001000
                bclr    $08,y, %00100000
                cmpb    SPSR_SerialPeripheralStatus
                staa    SPDR_SerialPeripheralDataIO
                bset    $02,x, %00001000
                bclr    $02,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    #$62
loc_D353:
                brclr   $00,x, %00001000, loc_D35D
                decb
                bne     loc_D353
                jmp     loc_D49F
loc_D35D:
                ldab    #$0B
                staa    SPDR_SerialPeripheralDataIO
                bset    $02,x, %00001000
                bclr    $02,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp1
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    #$00
loc_D374:
                brclr   $00,x, %00001000, loc_D37E
                decb
                bne     loc_D374
                jmp     loc_D49F
loc_D37E:
                ldab    #$0B
                staa    SPDR_SerialPeripheralDataIO
                bset    $02,x, %00001000
                bclr    $02,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp2
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    PIA1_Buffer_t3
loc_D395:
                brclr   $00,x, %00001000, loc_D39F
                decb
                bne     loc_D395
                jmp     loc_D49F
loc_D39F:
                ldab    #$0B
                staa    SPDR_SerialPeripheralDataIO
                bset    $02,x, %00001000
                bclr    $02,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp3
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    #$00
loc_D3B6:
                brclr   $00,x, %00001000, loc_D3C0
                decb
                bne     loc_D3B6
                jmp     loc_D49F
loc_D3C0:
                ldab    #$0B
                staa    SPDR_SerialPeripheralDataIO
                bset    $02,x, %00001000
                bclr    $02,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp4
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp0
loc_D3D8:
                brclr   $00,x, %00001000, loc_D3E2
                decb
                bne     loc_D3D8
                jmp     loc_D49F
loc_D3E2:
                ldab    #$0B
                staa    SPDR_SerialPeripheralDataIO
                bset    $02,x, %00001000
                bclr    $02,x, %00001000
                nop
loc_D3EE:
                brset   $29,y, %10000000, loc_D3F9
                decb
                bne     loc_D3EE
                jmp     loc_D49F
loc_D3F9:
                ldaa    SPDR_SerialPeripheralDataIO
                bset    $08,y, %00100000
                cli
                ldab    Temp1
                addb    Temp2
                addb    Temp3
                addb    Temp4
                cba
                beq     loc_D413
                jmp     locret_D49A
loc_D413:
                ldaa    Temp2
                ldab    BitFlags27
                bitb    #$C0
                beq     loc_D437
                eora    #$82
                staa    StartupSwitchMirror1
                brclr   StartupSwitchMirror1, %01000000, loc_D432
                brclr   StartupSwitchMirror1, %10000000, loc_D42D
                bset    BitFlags68_t3, %00100000
                bra     loc_D445
loc_D42D:
                bclr    BitFlags68_t3, %00100000
                bra     loc_D445
loc_D432:
                bset    BitFlags68_t3, %00100000
                bra     loc_D445
loc_D437:
                staa    StartupSwitchMirror1
                brclr   StartupSwitchMirror1, %10000000, loc_D442
                bset    BitFlags68_t3, %00100000
                bra     loc_D445
loc_D442:
                bclr    BitFlags68_t3, %00100000
loc_D445:
                brclr   Ram_30, %10000000, loc_D49B
                ldaa    Temp4
                anda    byte_89DA
                ldx     #gw_PIA1AManipulation_Table2
                ldab    Counter_MainLoop
                andb    #$07
                abx
                bita    $00,x
                beq     locret_D49A
                ldaa    CountdownTimerFromKeyOn
                bne     locret_D49A
                ldaa    SwitchPortAccessReg1
                bita    #%01000000
                bne     locret_D49A
                ldaa    BatteryVolts
                cmpa    #$A0
                bcs     locret_D49A
                ldaa    $08,x
                ldab    #$A0
                cmpa    #$0C
                beq     loc_D487
                cmpa    #$19
                bne     loc_D495
                brset   b5D_IPL2_t3, %10000000, locret_D49A
                jsr     ThrowNonCriticalError
                bcc     locret_D49A
                bset    b5D_IPL2_t3, %10000000
                bra     locret_D49A
loc_D487:
                brset   b5d_IPL2, %10000000, locret_D49A
                jsr     ThrowNonCriticalError
                bcc     locret_D49A
                bset    b5d_IPL2, %10000000
                bra     locret_D49A
loc_D495:
                ldab    #$20
                jsr     ThrowNonCriticalError
locret_D49A:
                rts
loc_D49B:
                bset    Ram_30, %10000000
                rts
loc_D49F:
                bset    8,y, %00100000
                cli
                ldaa    BitFlags6a_t3
                bita    #$60
                bne     loc_D4C4
                ldaa    PPROG_EEPROMControlReg
                bita    #$02
                bne     loc_D4C4
                ldd     #$B618
                tba
                ldab    $B618
                beq     loc_D4C4
                decb
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB
                bset    BitFlags6a_t3, %01000000
loc_D4C4:
                ldd     #$4488
                jsr     ThrowNonCriticalError
                bcc     loc_D4DF
                sei
                ldaa    SwitchPortAccessReg1
                anda    #$FE
                staa    SwitchPortAccessReg1
                ldab    #$03
loc_D4D7:
                decb
                bne     loc_D4D7
                oraa    #$01
                staa    SwitchPortAccessReg1
loc_D4DF:
                cli
                rts
;;
sub_D4E1:
                ldaa    Ram_F3
                bpl     locret_D4F8
                anda    #$7F
                staa    Ram_F3
                ldd     #$26A8
                brset   b5C_IPL1_t3, %10000000, locret_D4F8
                jsr     ThrowNonCriticalError
                bcc     locret_D4F8
                bset    b5C_IPL1_t3, %10000000
locret_D4F8:
                rts
;;
sub_D4F9:
                ldab    #$40
                brset   IPL1, %01000000, loc_D519
                ldaa    DRBPointer1
                cmpa    #$0A
                bne     loc_D508
                jmp     loc_D03A
loc_D508:
                cmpa    #$18
                bne     loc_D513
                ldaa    Counter_MainLoop
                asla
                bmi     loc_D53D
                bra     loc_D53C
loc_D513:
                brset   BitFlags6a_t3, %00000100, loc_D53D
                bra     loc_D53C
loc_D519:
                ldx     KeyOnOrEngineRunningTime
                cpx     #$03
                bls     loc_D53D
                bclr    Ram_05, %11000000
                brclr   PIA1_Buffer_t3, %01000000, loc_D53C
                ldaa    b5C_IPL1_t3
                bita    byte_89DC
                bne     loc_D53C
                ldaa    b5D_IPL2_t3
                bita    byte_89DD
                bne     loc_D53C
                ldaa    b5d_IPL2
                bita    byte_89DE
                beq     loc_D53D
loc_D53C:
                clrb
loc_D53D:
                ldaa    #$BF
                anda    PIA1_Buffer_t3
                aba
                staa    PIA1_Buffer_t3
                rts
;;
sub_D545:
                ldaa    BitFlags27
                bita    #%11000000
                beq     locret_D591
                brset   IPL1, %01000000, loc_D555
                brset   BitFlags6a_t3, %00000100, loc_D589
                bra     loc_D58E
loc_D555:
                brset   b5C_IPL1_t3, %00100000, loc_D58E
                ldaa    Counter_MainLoop
                bita    #%00111100
                bne     loc_D585
                ldaa    TargetBatteryVolts
                suba    BatteryVolts
                bcs     loc_D57E
                cmpa    #$11
                bcs     loc_D57E
                ldd     EngineRpm_HB
                cpd     #$2EE0
                bcs     loc_D581
                ldaa    UNe_64B8
                inca
                cmpa    #$56
                bcs     loc_D582
                bset    Ram_30, %00100000
                bra     loc_D58E
loc_D57E:
                bclr    Ram_30, %00100000
loc_D581:
                clra
loc_D582:
                staa    UNe_64B8
loc_D585:
                brset   Ram_30, %00100000, loc_D58E
loc_D589:
                bset    PIA2_Buffer_t3, %00000100
                bra     locret_D591
loc_D58E:
                bclr    PIA2_Buffer_t3, %00000100
locret_D591:
                rts
;;
sub_D592:
                ldd     ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
                tsta
                beq     loc_D59F
                dec     ClearTheErrorTimer_0
                bne     loc_D59F
                clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
loc_D59F:
                tstb
                beq     loc_D5AA
                dec     ClearTheErrorTimer_1
                bne     loc_D5AA
                clr     ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB
loc_D5AA:
                ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
                beq     locret_D5B9
                suba    #$10
                bita    #%11110000
                bne     loc_D5B6
                clra
loc_D5B6:
                staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
locret_D5B9:
                rts
;;
sub_D5BA:
                brclr   IPL1, %01000000, locret_D5F3
                brset   BitFlags6d_t3, %00000100, locret_D5F3
                brset   BitFlags6a_t3, %01000000, locret_D5F3
                bset    BitFlags6d_t3, %00000100
                brclr   ErrorBitRegisterStored3, %11111111, loc_D5EC
                ldaa    ErrorCodeUpdateKeyOnCount
                cmpa    #$32
                bcs     loc_D5D6
                jmp     sub_CABD
loc_D5D6:
                ldaa    ErrorBitRegisterStored1
                beq     loc_D5E1
                ldaa    ErrorCodeUpdateKeyOnCount3
                inca
                beq     loc_D5E1
                staa    ErrorCodeUpdateKeyOnCount3
loc_D5E1:
                ldaa    ErrorBitRegisterStored2
                beq     loc_D5EC
                ldaa    ErrorCodeUpdateKeyOnCount2
                inca
                beq     loc_D5EC
                staa    ErrorCodeUpdateKeyOnCount2
loc_D5EC:
                ldaa    ErrorCodeUpdateKeyOnCount
                inca
                beq     locret_D5F3
                staa    ErrorCodeUpdateKeyOnCount
locret_D5F3:
                rts
;;
sub_D5F4:
                anda    #$0F
                ldab    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
                beq     loc_D603
                andb    #$0F
                cba
                bne     locret_D60A
                ldaa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
loc_D603:
                adda    #$10
                bcs     loc_D60B
                staa    ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
locret_D60A:
                rts
loc_D60B:
                ldab    #$01
loc_D60D:
                deca
                beq     loc_D613
                aslb
                bra     loc_D60D
loc_D613:
                clr     ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
                comb
                sei
                andb    b5C_IPL1_t3
                stab    b5C_IPL1_t3
                cli
                rts
;;
sub_D61E:
                ldab    EngineRpm_HB
                cmpb    #$7D
                ldaa    #$00
                bcc     loc_D63C
                subb    #$10
                bcc     loc_D62B
                clrb
loc_D62B:
                ldaa    #$29
                mul
                lsld
                aslb
                adca    LowestSessionTpsVolts
                tab
                ldaa    TpsVolts
                adda    byte_8A3C
                sba
                bcc     loc_D63C
                clra
loc_D63C:
                ldx     #byte_8A28
                jsr     sub_E372
                adda    byte_8A3B
                bcc     locret_D649
                ldaa    #$FF
locret_D649:
                rts
;;
sub_D64A:
                brclr   Ram_05, %00000001, loc_D684
                ldab    BatteryVolts
                cmpb    byte_89E6
                bcs     loc_D675
                cmpb    byte_89E5
                bcc     loc_D675
                ldaa    MapVolts_X
                suba    MapValue3
                bls     loc_D675
                cmpa    byte_89E4
                bcs     loc_D675
                sei
loc_D666:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_D666
                ldaa    ADR1_A2DResults1
                staa    MapVolts_X
                staa    MapValue3
                cli
                bra     loc_D67E
loc_D675:
                ldaa    UNe_64B9
                anda    #$E0
                cmpa    #$E0
                bne     loc_D684
loc_D67E:
                ldd     #$2828
                jsr     ThrowNonCriticalError
loc_D684:
                brset   BitFlags2b, %01000000, locret_D6A0
                ldaa    UNe_64B9
                anda    #$1F
                cmpa    #$1F
                bne     locret_D6A0
                brset   b5d_IPL2, %01000000, locret_D6A0
                ldd     #$0181
                jsr     ThrowNonCriticalError
                bcc     locret_D6A0
                bset    b5d_IPL2, %01000000
locret_D6A0:
                rts
;;
sub_D6A1:
                brclr   IPL1, %01000000, locret_D6E9
                ldd     KeyOnOrEngineRunningTime
                cmpa    #$0B
                bcs     locret_D6E9
                ldaa    CoolantTemp
                cmpa    byte_89FA
                bcs     locret_D6E9
                bitb    #$1F
                bne     locret_D6E9
                brset   BitFlags27, %00000001, loc_D6BE
                brclr   BitFlags68_t3, %00010000, locret_D6E9
loc_D6BE:
                brset   StartupSwitchMirror1, %00100000, locret_D6E9
                brclr   BitFlags66_t3, %10000000, locret_D6E9
                ldaa    EngineRpm_HB
                cmpa    byte_89F8
                bcs     locret_D6E9
                ldaa    MapVolts
                cmpa    byte_89F9
                bcc     locret_D6E9
                ldaa    VehicleSpeedx8_Scaled
                cmpa    #$02
                bcc     locret_D6E9
                brset   b5D_IPL2_t3, %00010000, locret_D6E9
                ldd     #$23A0
                jsr     ThrowNonCriticalError
                bcc     locret_D6E9
                bset    b5D_IPL2_t3, %00010000
locret_D6E9:
                rts
;;
sub_D6EA:
                ldaa    SwitchPortAccessReg1
                bita    #$40
                beq     loc_D6F2
                rts
loc_D6F2:
                brset   IPL1, %01000000, loc_D6F9
                jmp     loc_D73C
loc_D6F9:
                ldaa    KeyOnOrEngineRunningTime
                cmpa    #$2C
                bcs     loc_D73C
                ldaa    CoolantTemp
                cmpa    #$CD
                bcs     loc_D73C
                brclr   BitFlags2e, %00000100, loc_D741
                ldaa    Counter_O2Diagnostics
                cmpa    #$13
                bcs     loc_D737
                ldaa    O2SensorVolts
                cmpa    #$4D
                bcs     loc_D73C
                ldaa    Timer_O2MiddleDiagnostics
                cmpa    #$2A
                bcs     loc_D72C
                brset   b5d_IPL2, %00000010, loc_D72A
                ldd     #$2081
                jsr     ThrowNonCriticalError
                bcc     locret_D79A
                bset    b5d_IPL2, %00000010
loc_D72A:
                bra     locret_D79A
loc_D72C:
                ldab    Counter_MainLoop
                bitb    #%01111111
                bne     locret_D79A
                inca
                staa    Timer_O2MiddleDiagnostics
                bra     locret_D79A
loc_D737:
                inca
                staa    Counter_O2Diagnostics
                bra     locret_D79A
loc_D73C:
                bclr    BitFlags2e, %00000100
                bra     loc_D771
loc_D741:
                ldaa    O2SensorVolts
                cmpa    byte_89F5
                bhi     loc_D771
                cmpa    byte_89F6
                bcs     loc_D771
                ldaa    Timer_O2MiddleDiagnostics
                cmpa    #$15
                bcs     loc_D768
                bset    BitFlags2e, %00000100
                clra
                staa    Timer_O2MiddleDiagnostics
                staa    Counter_O2Diagnostics
                sei
                ldaa    PIA3_Buffer_t3
                oraa    #$08
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                cli
                bra     locret_D79A
loc_D768:
                ldab    Counter_MainLoop
                bitb    #%01111111
                bne     loc_D774
                inca
                bra     loc_D772
loc_D771:
                clra
loc_D772:
                staa    Timer_O2MiddleDiagnostics
loc_D774:
                sei
                ldaa    PIA3_Buffer_t3
                anda    #$F7
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                cli
                ldaa    Counter_MainLoop
                bita    #%1111
                bne     locret_D79A
                brset   b5d_IPL2, 4, locret_D79A
                ldaa    O2SensorVolts
                cmpa    #$3E
                bls     locret_D79A
                ldd     #$3E8F
                jsr     ThrowNonCriticalError
                bcc     locret_D79A
                bset    b5d_IPL2, %100
locret_D79A:
                rts
;;
sub_D79B:
                ldaa    ATMOffset
                cmpa    #$D
                beq     loc_D7D2
                brset   b5d_IPL2, %10000, loc_D7D2
                sei
                ldaa    SwitchPortAccessReg1
                bita    #%10000
                beq     loc_D7D2
                bita    #%1000000
                bne     loc_D7D2
                brset   PIA2_Buffer_t3, %10000, loc_D7D2
                brclr   BitFlags2e, %100000, loc_D7CC
                lsra
                eora    BitFlags24
                bita    #%10
                cli
                beq     loc_D7CC
                ldd     #$BA0
                jsr     ThrowNonCriticalError
                bcc     loc_D7CC
                bset    b5d_IPL2, %10000
loc_D7CC:
                cli
                bset    BitFlags2e, %100000
                bra     locret_D7D6
loc_D7D2:
                cli
                bclr    BitFlags2e, %100000
locret_D7D6:
                rts
;;
sub_D7D7:
                brclr   BitFlags2e, %10, loc_D7FD
                ldaa    BatteryVolts
                cmpa    #$82
                bcs     locret_D7FC
                ldaa    Counter_MainLoop
                bita    #%100
                bne     locret_D7FC
                ldaa    TimerOverflowsBetweenCamPulses
                bne     locret_D7FC
                brset   DistributorFallingEdgePulsewidth_HB, %10000000, locret_D7FC
                ldaa    SwitchPortAccessReg1
                bita    #%1010000
                bne     locret_D7FC
                ldd     #$2C14
                jsr     ThrowNonCriticalError
locret_D7FC:
                rts
loc_D7FD:
                bset    BitFlags2e, %10
                rts
;;
sub_D801:
                sei
loc_D802:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_D802
                ldaa    ADR1_A2DResults1
                cmpa    MapVolts_X
                bcs     loc_D810
                staa    MapVolts_X
loc_D810:
                cmpa    MapValue3
                bcc     loc_D816
                staa    MapValue3
loc_D816:
                cli
                rts
;;
sub_D818:
                ldaa    BitFlags608D
                anda    #$F
                inca
                cmpa    byte_8A0C
                bcc     loc_D828
                inc     BitFlags608D
                jmp     locret_D8A6
loc_D828:
                ldaa    BitFlags608D
                anda    #$F0
                staa    BitFlags608D
                ldaa    MapVolts_X
                suba    MapValue3
                ldab    ADR1_A2DResults1
                stab    MapVolts_X
                stab    MapValue3
                brset   b5C_IPL1_t3, %10000000, loc_D864
                cmpa    byte_8A0A
                bcc     locret_D8A6
                ldd     EngineRpm_HB
                cpd     byte_8A1D
                bcs     locret_D8A6
                cpd     byte_8A1F
                bcc     locret_D8A6
                ldaa    MapVolts_X
                cmpa    byte_8A21
                bcs     locret_D8A6
                cmpa    byte_8A22
                bcc     locret_D8A6
                ldaa    Ram_F3
                oraa    #$80
                staa    Ram_F3
                bra     locret_D8A6
loc_D864:
                ldab    BitFlags608D
                addb    #$10
                bcc     loc_D86C
                orab    #$F0
loc_D86C:
                stab    BitFlags608D
                suba    byte_8A0A
                bcs     locret_D8A6
                cmpa    byte_8A0B
                bcs     locret_D8A6
                ldaa    VehicleSpeedx8_Scaled
                bne     loc_D88E
                brset   BitFlags66_t3, %10000000, loc_D88E
                ldd     EngineRpm_HB
                subd    TargetIdleSpeedHB
                bcc     loc_D888
                coma
                comb
loc_D888:
                cpd     byte_8A23
                bcs     locret_D8A6
loc_D88E:
                ldab    byte_8A0C
                ldx     #byte_8A0D
                abx
                ldaa    0,x
                cmpa    BitFlags608D
                bhi     locret_D8A6
                ldaa    #8
                jsr     sub_D5F4
                ldaa    BitFlags608D
                anda    #$F
                staa    BitFlags608D
locret_D8A6:
                rts
;;
sub_D8A7:
                ldaa    Counter_MainLoop
                bita    #%111
                bne     loc_D900
                brset   b5C_IPL1_t3, %10000000, loc_D8E8
                tst     VehicleSpeedx8_Scaled
                bne     loc_D8E8
                brset   BitFlags66_t3, %10000000, loc_D8E8
                ldd     EngineRpm_HB
                subd    TargetIdleSpeedHB
                bcc     loc_D8C2
                coma
                comb
loc_D8C2:
                cpd     byte_8A23
                bcc     loc_D8E8
                ldaa    BaroPressure
                suba    MapValue
                bcs     loc_D8DD
                ldab    BaroPressure
                ldx     #byte_8A26
                cmpb    byte_8A25
                bcc     loc_D8D9
                inx
loc_D8D9:
                cmpa    0,x
                bcc     loc_D8E8
loc_D8DD:
                ldd     #$2794
                jsr     ThrowNonCriticalError
                bcc     loc_D8E8
                bset    b5C_IPL1_t3, %10000000
loc_D8E8:
                brclr   BitFlags2e, %10000000, loc_D902
                sei
loc_D8ED:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_D8ED
                ldaa    ADR1_A2DResults1
                cli
                cmpa    byte_8A09
                bcs     locret_D93C
                cmpa    byte_8A08
                bcs     loc_D941
loc_D900:
                bra     locret_D93C
loc_D902:
                ldx     EngineRpm_HB
                cpx     #$C80
                bcs     locret_D93C
                cpx     #$2EE0
                bcc     locret_D93C
                ldaa    TpsVolts_Minus_LowestSessionTpsVolts
                cmpa    #$32
                bcc     locret_D93C
                sei
loc_D915:
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
loc_D92D:
                ldd     #$2594
loc_D930:
                brset   b5C_IPL1_t3, %1000, locret_D93C
                jsr     ThrowNonCriticalError
                bcc     locret_D93C
                bset    b5C_IPL1_t3, %1000
locret_D93C:
                rts
loc_D93D:
                brclr   b5C_IPL1_t3, %1000, locret_D93C
loc_D941:
                ldaa    #4
                jsr     sub_D5F4
                brset   b5C_IPL1_t3, %1000, locret_D93C
                bclr    BitFlags2e, %10000000
                bra     locret_D93C
;;
sub_D94F:
                ldaa    Counter_MainLoop
                bita    #$1F
                bne     locret_D976
                brclr   IPL1, %1000000, locret_D976
                ldaa    BatteryVolts
                suba    TargetBatteryVolts
                bcs     loc_D973
                cmpa    #$10
                bcs     loc_D973
                brset   b5C_IPL1_t3, %100000, locret_D976
                ldd     #$6A0
                jsr     ThrowNonCriticalError
                bcc     locret_D976
                bset    b5C_IPL1_t3, %100000
                rts
loc_D973:
                bclr    b5C_IPL1_t3, %100000
locret_D976:
                rts
;;
sub_D977:
                brset   b5C_IPL1_t3, %10, locret_D9AC
                ldaa    CoolantTemp
                cmpa    byte_89E1
                bcs     loc_D987
                bset    BitFlags6d_t3, %00000010
                bra     locret_D9AC
loc_D987:
                brset   BitFlags6d_t3, %00000010, locret_D9AC
                brclr   IPL1, %01000000, locret_D9AC
                ldaa    KeyOnOrEngineRunningTime
                cmpa    #$FF
                bne     locret_D9AC
                ldaa    VehicleSpeedx8_Scaled
                cmpa    byte_89E2
                bcs     locret_D9AC
                ldab    Timer_ThermostatDiagnostics
                cmpb    byte_89E3
                beq     loc_D9AD
                ldaa    Counter_MainLoop
                bne     locret_D9AC
                incb
                stab    Timer_ThermostatDiagnostics
locret_D9AC:
                rts
loc_D9AD:
                ldd     #$2101
                jsr     ThrowNonCriticalError
                bcc     locret_D9B8
                bset    BitFlags6d_t3, %00000010
locret_D9B8:
                rts
;;
sub_D9B9:
                brset   BitFlags2d, %00001000, loc_D9EC
                brclr   BitFlags2d, %00000100, loc_D9EC
                brclr   IPL1, %01000000, loc_D9EC
                sei
                ldaa    BitFlags6a_t3
                bita    #%01100000
                bne     loc_D9EA
                bset    BitFlags2d, %00001000
                ldx     #$B613
                ldaa    $00,x
                inca
                beq     loc_D9EA
                cmpa    byte_8810
                bcs     loc_D9DF
                bset    BitFlags2d, %00000010
loc_D9DF:
                staa    DRBOffsetStored_LB
                ldaa    #$13
                staa    DRBOffsetStored_HB
                bset    BitFlags6a_t3, %01000000
loc_D9EA:
                cli
                nop
loc_D9EC:
                sei
                brset   BitFlags6a_t3, %01000000, loc_DA6F
                ldx     #$B616
                brclr   BitFlags2d, %00010000, loc_DA30
                brset   BitFlags2d, %00000001, loc_DA30
                ldaa    #$16
                ldab    #$4A
                brclr   BitFlags6a_t3, %00100000, loc_DA27
                cmpa    DRBOffsetStored_HB
                beq     loc_DA20
                inca
                cmpa    DRBOffsetStored_HB
                bne     loc_DA30
                bset    BitFlags6a_t3, %01000000
                bclr    BitFlags6a_t3, %00100000
                bset    BitFlags2d, %00000001
                ldaa    #$13
                clrb
                stab    Counter_ACControl1
                bra     loc_DA2A
loc_DA20:
                bset    BitFlags6a_t3, %01000000
                inca
                comb
                bra     loc_DA2A
loc_DA27:
                bset    BitFlags6a_t3, %01100000
loc_DA2A:
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB
loc_DA30:
                ldaa    $01,x
                coma
                cmpa    $00,x
                bne     loc_DA40
                cmpa    #$4A
                bne     loc_DA40
                bset    BitFlags2d, %00000100
                bra     loc_DA43
loc_DA40:
                bclr    BitFlags2d, %00000100
loc_DA43:
                cli
                brclr   BitFlags2d, %00000010, locret_DA70
                sei
                brset   BitFlags6a_t3, %01000000, loc_DA6F
                ldaa    #$16
                ldab    #$EE
                brclr   BitFlags6a_t3, %00100000, loc_DA66
                cmpa    DRBOffsetStored_HB
                bne     loc_DA6F
                inca
                bset    BitFlags6a_t3, %01000000
                bclr    BitFlags6a_t3, %00100000
                bclr    BitFlags2d, %10
                bra     loc_DA69
loc_DA66:
                bset    BitFlags6a_t3, %01100000
loc_DA69:
                staa    DRBOffsetStored_HB
                stab    DRBOffsetStored_LB
loc_DA6F:
                cli
locret_DA70:
                rts
;;
sub_DA71:
                brset   BitFlags21, %00100000, loc_DAE5
                ldaa    b5d_IPL2
                bita    #%00011000
                bne     loc_DAE5
                ldaa    TargetBatteryVolts
                sei
loc_DA7E:
                ldab    ADCTL_A2DControlReg
                bpl     loc_DA7E
                suba    ADR2_A2DResults2
                cli
                bcs     loc_DAE5
                cmpa    byte_89ED
                bcs     loc_DAE5
                ldd     EngineRpm_HB
                cpd     byte_89EE
                bcs     loc_DAE5
                ldaa    #$0F
                brclr   BitFlags2e, %00000001, loc_DA9D
                clra
loc_DA9D:
                anda    Counter_MainLoop
                bne     locret_DAB7
                ldaa    BatVoltsDiagCounter
                inca
                beq     loc_DAA8
                staa    BatVoltsDiagCounter
loc_DAA8:
                brset   BitFlags2e, %00000001, loc_DAB8
                cmpa    byte_89F0
                bcs     locret_DAB7
                clra
                staa    BatVoltsDiagCounter
                bset    BitFlags2e, %00000001
locret_DAB7:
                rts
loc_DAB8:
                brset   BitFlags21, %00010000, loc_DAC8
                cmpa    byte_89F1
                bcs     locret_DAB7
                clra
                staa    BatVoltsDiagCounter
                bset    BitFlags21, %00010000
                rts
loc_DAC8:
                cmpa    byte_89F3
                bcs     locret_DAB7
                clra
                staa    BatVoltsDiagCounter
                bclr    BitFlags21, %00010000
                ldd     #$058A
                jsr     ThrowNonCriticalError
                bcc     locret_DAB7
                bset    b5d_IPL2, %00001000
                bclr    BitFlags2e, %00000001
                bclr    BitFlags21, %00110000
                rts
loc_DAE5:
                clra
                staa    BatVoltsDiagCounter
                bclr    BitFlags2e, %00000001
                bclr    BitFlags21, %00110000
                rts
;;
sub_DAEF:
                ldy     #LDXi_6485
                brset   DRBSerialMode, %10000000, loc_DB60
                brclr   DRBSerialMode, %01000000, loc_DB60
                ldaa    BAUD_SerialBaudRate
                cmpa    #$25
                bne     locret_DB5F
                ldab    SCDR_SerialData
                ldaa    SCSR_SerialStatus
                bita    #%00100000
                beq     loc_DB64
                bita    #%00001110
                bne     loc_DB5B
                brset   $00,y, %11100000, loc_DB80
                ldaa    #$F8
                brset   $00,y, %10000000, loc_DB32
                deca
                brset   $00,y, %01100000, loc_DB32
                ldaa    #$F5
                brset   $00,y, %01000000, loc_DB32
                ldaa    #$F3
                brset   $00,y, %00100000, loc_DB32
                ldaa    #$14
loc_DB32:
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
                staa    DRBPointer1
                ldd     SCSR_SerialStatus
                ldaa    #$F8
                ldab    SCSR_SerialStatus
                staa    SCDR_SerialData
                bra     loc_DB5B
loc_DB59:
                staa    DRBPointer1
loc_DB5B:
                ldd     SCSR_SerialStatus
                pulx
locret_DB5F:
                rts
loc_DB60:
                clr     LDXi_6485
                rts
loc_DB64:
                brset   $00,y, %11100000, loc_DB70
                brclr   $00,y, %11100000, loc_DB60
                bra     loc_DB5B
loc_DB70:
                ldaa    DRBPointer1
                deca
                cmpa    #$20
                bne     loc_DB59
                clra
                staa    DRBPointer1
                staa    DRBPointer2
                staa    DRBSerialMode
                bra     loc_DB5B
loc_DB80:
                ldaa    #$28
                staa    DRBPointer1
                brset   $00,y, %00001000, loc_DBCE
                brset   $00,y, %00010000, loc_DB96
                bset    $00,y, %00010000
                stab    DRBPointer2
                bra     loc_DB5B
loc_DB96:
                cmpb    DRBPointer2
                bne     loc_DBBF
                bclr    $00,y, %00010000
                tba
                ldab    LDXi_6485
                andb    #$07
                cmpb    #$04
                beq     loc_DBB4
                ldx     #UNe_6481
                abx
                staa    $00,x
                inc     LDXi_6485
                jmp     loc_DB5B
loc_DBB4:
                cmpa    #$12
                bne     loc_DBBC
                bclr    $00,y, %00000111
loc_DBBC:
                jmp     loc_DB5B
loc_DBBF:
                bset    $00,y, %00001000
                cmpb    #$12
                bne     loc_DBD2
loc_DBC7:
                bset    $00,y, %00010000
                jmp     loc_DB5B
loc_DBCE:
                cmpb    #$12
                beq     loc_DBD9
loc_DBD2:
                bclr    $00,y, %00010000
                jmp     loc_DB5B
loc_DBD9:
                brclr   $00,y, %00010000, loc_DBC7
                bclr    $00,y, %00011111
                bra     loc_DBBC
sub_DBE4:
                brset   DRBSerialMode, %01000000, loc_DBEC
                rts
loc_DBE9:
                jmp     loc_DD9C
loc_DBEC:
                brset   DRBSerialMode, %01110000, loc_DBE9
                ldab    SCDR_SerialData
                ldaa    SCSR_SerialStatus
                bita    #%00100000
                bne     loc_DBFB
                rts
loc_DBFB:
                ldx     #FDRVar0
                ldaa    $00,x
                bita    #%00000011
                beq     loc_DC07
                jmp     loc_DC69
loc_DC07:
                cmpb    #$F8
                bcc     loc_DC12
loc_DC0B:
                jsr     sub_DDCA
                jsr     sub_DDA1
                rts
loc_DC12:
                tsta
                bne     loc_DC1E
                cmpb    #$F8
                bne     loc_DC0B
                ldaa    #$80
                jmp     loc_DD9A
loc_DC1E:
                cmpa    #$80
                bne     loc_DC2B
                cmpb    #$F9
                bne     loc_DC0B
                ldaa    #$C0
                jmp     loc_DD9A
loc_DC2B:
                cmpa    #$C0
                bne     loc_DC38
                cmpb    #$FB
                bne     loc_DC0B
                ldaa    #$E0
                jmp     loc_DD9A
loc_DC38:
                cmpa    #$E0
                bne     loc_DC0B
                cmpb    #$F8
                bne     loc_DC45
                ldaa    #$02
                jmp     loc_DD9A
loc_DC45:
                cmpb    #$F9
                bne     loc_DC4E
                ldaa    #$01
                jmp     loc_DD9A
loc_DC4E:
                cmpb    #$FB
                bne     loc_DC0B
                ldy     EngineRpm_HB
                cpy     #$0100
                bhi     loc_DC60
                ldaa    #$05
                jmp     loc_DD9A
loc_DC60:
                ldd     #$17
                jsr     sub_DDA1
                jmp     loc_DD9A
loc_DC69:
                bita    #%00000001
                beq     loc_DC70
                jmp     loc_DC7D
loc_DC70:
                jmp     loc_DD2C
;;
sub_DC73:
                ldaa    SCSR_SerialStatus
                ldaa    SCDR_SerialData
                stab    SCDR_SerialData
                rts
loc_DC7D:
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
loc_DC90:
                stab    FDRVar3
                jsr     sub_DDA7
                ldaa    #$20
                bra     loc_DCCF
loc_DC9A:
                ldy     FDRVar3
                ldab    $00,y
                ldaa    #$40
                bra     loc_DCCF
loc_DCA5:
                cmpb    #$FE
                beq     loc_DCB6
loc_DCA9:
                jsr     sub_DDA1
                cmpb    #$1B
                bne     loc_DCB3
                bset    DRBSerialMode, %01000000
loc_DCB3:
                jmp     loc_DD9C
loc_DCB6:
                ldaa    $00,x
                bita    #%00000100
                beq     loc_DCCD
                ldy     EngineRpm_HB
                cpy     #$0100
                bcs     loc_DCCD
                ldab    #$17
                jsr     sub_DDA1
                jmp     loc_DD9C
loc_DCCD:
                ldaa    #$80
loc_DCCF:
                oraa    $00,x
                jmp     loc_DD9A
loc_DCD4:
                sei
                ldy     FDRVar3
                cpy     #XIRQ
                bcc     loc_DCEC
                stab    $00,y
loc_DCE2:
                ldab    $00,y
                jsr     sub_DDA1
                cli
                jmp     loc_DD9C
loc_DCEC:
                ldx     #UNk_64D0
                ldy     #loc_DD0F
loc_DCF3:
                ldaa    $00,y
                staa    $00,x
                inx
                iny
                cpy     #loc_DD2C
                bne     loc_DCF3
                ldx     #UNk_64D0
                ldy     FDRVar3
                jsr     $00,x
                ldx     #FDRVar0
                bra     loc_DCE2
loc_DD0F:
                ldaa    #$AA
                staa    $D555
                lsra
                staa    $AAAA
                ldaa    #$A0
                staa    $D555
                stab    $00,y
                ldx     #$00
loc_DD23:
                cmpb    $00,y
                beq     locret_DD2B
                dex
                bne     loc_DD23
locret_DD2B:
                rts
loc_DD2C:
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
                ldaa    #$08
                bra     loc_DD63
loc_DD42:
                stab    FDRVar1
                ldaa    #$10
                bra     loc_DD63
loc_DD49:
                stab    STe_648A
                ldaa    #$20
                bra     loc_DD63
loc_DD50:
                stab    FDRVar3
                jsr     sub_DDA7
                ldaa    #$C0
                bra     loc_DD63
loc_DD5A:
                cmpb    #$FD
                beq     loc_DD61
                jmp     loc_DCA9
loc_DD61:
                ldaa    #$80
loc_DD63:
                oraa    $00,x
                jmp     loc_DD9A
loc_DD68:
                ldx     FDRVar3
                ldy     FDRVar1
                ldab    SCDR_SerialData
                ldaa    $00,x
                staa    SCDR_SerialData
                inx
                dey
                bne     loc_DD84
                ldx     #FDRVar0
                jsr     sub_DDA1
                pulx
                rts
loc_DD84:
                stx     FDRVar3
                sty     FDRVar1
                cba
                bne     loc_DD90
                pulx
                rts
loc_DD90:
                ldaa    FDRVar0
                anda    #$7F
                staa    FDRVar0
                pulx
                rts
loc_DD9A:
                staa    0,x
loc_DD9C:
                jsr     sub_DC73
                pulx
                rts
;;
sub_DDA1:
                clr     0,x
                bclr    DRBSerialMode, %1000000
                rts
;;
sub_DDA7:
                pshx
                ldx     FDRVar3
                cpx     #byte_8000
                bcs     loc_DDBF
                cpx     #$FFFF
                bhi     loc_DDBF
                cpx     #$B600
                bcs     loc_DDC8
                cpx     #$B800
                bcc     loc_DDC8
loc_DDBF:
                pulx
                ldx     #FDRVar0
                jsr     sub_DDA1
                pulx
                rts
loc_DDC8:
                pulx
                rts
;;
sub_DDCA:
                cmpb    #$14
                beq     loc_DDCF
                rts
loc_DDCF:
                clr     FDRVar0
                ldab    #$25
                stab    BAUD_SerialBaudRate
                ldab    LDXi_6485
                addb    #$20
                stab    LDXi_6485
                bset    DRBSerialMode, %00110000
                ldd     SCSR_SerialStatus
                pulx
                rts
;;
sub_DDE7:
                ldab    #$93
                ldaa    Temp0
                bne     loc_DDF0
                ldab    #$80
loc_DDF0:
                aba
                adda    Temp1
                adda    Temp2
                staa    Temp3
                tba
                ldab    #$40
                ldy     #$00001000
                ldx     #SwitchPortAccessReg1
                sei
                bset    0,x, %00001000
                bclr    8,y, %00100000
                cmpb    SPSR_SerialPeripheralStatus
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x, %00001000
                bclr    2,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp0
loc_DE22:
                brclr   0,x, %00001000, loc_DE2C
                decb
                bne     loc_DE22
                jmp     loc_DEC5
loc_DE2C:
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x, %00001000
                bclr    2,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp0
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp1
loc_DE42:
                brclr   0,x, %00001000, loc_DE4C
                decb
                bne     loc_DE42
                jmp     loc_DEC5
loc_DE4C:
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x, %00001000
                bclr    2,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp1
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp2
loc_DE62:
                brclr   0,x, %00001000, loc_DE6C
                decb
                bne     loc_DE62
                jmp     loc_DEC5
loc_DE6C:
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x, %00001000
                bclr    2,x, %00001000
                nop
                ldaa    SPDR_SerialPeripheralDataIO
                staa    Temp2
                cmpa    SPSR_SerialPeripheralStatus
                ldaa    Temp3
loc_DE82:
                brclr   0,x, %00001000, loc_DE8B
                decb
                bne     loc_DE82
                bra     loc_DEC5
loc_DE8B:
                staa    SPDR_SerialPeripheralDataIO
                bset    2,x, %00001000
                bclr    2,x, %00001000
                nop
loc_DE95:
                brset   $29,y, %10000000, loc_DE9F
                decb
                bne     loc_DE95
                bra     loc_DEC5
loc_DE9F:
                ldaa    SPDR_SerialPeripheralDataIO
                bset    8,y, %00100000
                cli
                suba    Temp0
                suba    Temp1
                suba    Temp2
                bne     locret_DEC7
                ldaa    Temp0
                anda    #$F
                cmpa    #1
                bne     locret_DEC7
                bset    CCDFlags5, %01000000
                brset   CCDFlags6, %10000000, locret_DEC7
                bset    Counter_SpeedSensorInterrupt_HB_X, %00010000
loc_DEC5:
                cli
                nop
locret_DEC7:
                rts
;;
sub_DEC8:
                ldab    Counter_MainLoop
                andb    #$F
                bne     loc_DF0B
                brset   Counter_SpeedSensorInterrupt_HB_X, %00001000, loc_DEF2
                ldaa    KeyOnOrEngineRunningTime
                cmpa    #$83
                bcs     loc_DF08
                ldaa    EngineRpm_HB
                cmpa    #$2F
                bcs     loc_DF08
                ldaa    BatteryVolts
                cmpa    #$BD
                bcc     loc_DF08
                ldab    CCDFlags4_BodyCompFlags4_X
                incb
                stab    CCDFlags4_BodyCompFlags4_X
                cmpb    #$71
                bcs     loc_DF0B
                bset    Counter_SpeedSensorInterrupt_HB_X, %00001000
                bra     loc_DF08
loc_DEF2:
                ldaa    TargetBatteryVolts
                suba    BatteryVolts
                bcs     loc_DEFC
                cmpa    #1
                bhi     loc_DF08
loc_DEFC:
                ldab    CCDFlags4_BodyCompFlags4_X
                incb
                stab    CCDFlags4_BodyCompFlags4_X
                cmpb    #$22
                bcs     loc_DF0B
                bclr    Counter_SpeedSensorInterrupt_HB_X, %1000
loc_DF08:
                clra
                staa    CCDFlags4_BodyCompFlags4_X
loc_DF0B:
                brset   Counter_MainLoop, 1, loc_DF25
                ldx     #off_E15B
                ldab    CCDTemp_HB
                lsld
                addb    #2
                abx
                lsrd
                stab    CCDTemp_HB
                ldx     0,x
                jsr     0,x
                std     Temp1
                jsr     sub_DDE7
loc_DF25:
                ldaa    CountdownTimerFromKeyOn
                bne     locret_DF32
                ldaa    byte_8014
                beq     loc_DF33
                bclr    CCDFlags5, %00100000
locret_DF32:
                rts
loc_DF33:
                ldaa    PPROG_EEPROMControlReg
                bita    #%00000010
                bne     loc_DF47
                bclr    Counter_SpeedSensorInterrupt_HB_X, %00100000
                ldaa    $B612
                bita    #1
                beq     loc_DF47
                bset    Counter_SpeedSensorInterrupt_HB_X, %00100000
loc_DF47:
                ldaa    Counter_MainLoop
                bita    #%00000011
                bne     loc_DFAC
                brclr   CCDFlags5, %01000000, loc_DF6F
                bset    CCDFlags5, %10000000
                bclr    CCDFlags5, %01100000
                bclr    CCDFlags6, %01111111
                brset   CCDFlags6, %10000000, loc_DFAC
                ldaa    BitFlags6a_t3
                bita    #%01100000
                bne     loc_DFAC
                ldaa    $B612
                bita    #%00000010
                beq     loc_DFAC
                anda    #$FD
                bra     loc_DF98
loc_DF6F:
                ldaa    CCDFlags6
                anda    #$7F
                brclr   CCDFlags5, $80, loc_DF7D
                cmpa    #$71
                bcc     loc_DF86
                bra     loc_DF81
loc_DF7D:
                cmpa    #$2D
                bcc     loc_DFAC
loc_DF81:
                inc     CCDFlags6
                bra     loc_DFAC
loc_DF86:
                ldaa    BitFlags6a_t3
                bita    #%01100000
                bne     loc_DFAC
                ldaa    $B612
                bita    #%00000010
                bne     loc_DFAC
                bset    CCDFlags6, %10000000
                oraa    #2
loc_DF98:
                sei
                brclr   BitFlags6a_t3, %01000000, loc_DFA0
                cli
                bra     loc_DFAC
loc_DFA0:
                bset    BitFlags6a_t3, %01000000
                cli
                staa    DRBOffsetStored_LB
                ldaa    #$12
                staa    DRBOffsetStored_HB
loc_DFAC:
                brclr   CCDFlags5, %00010000, loc_DFC0
                brset   CCDFlags5, %10000000, locret_DFBF
                ldaa    CCDFlags6
                anda    #$7F
                cmpa    #$2D
                bcs     locret_DFBF
                bset    CCDFlags5, %00100000
locret_DFBF:
                rts
loc_DFC0:
                brset   CCDFlags5, %10000, locret_E010
                brclr   IPL1, %1000000, locret_E010
                ldaa    BitFlags6a_t3
                bita    #%1100000
                bne     locret_E010
                ldaa    $B612
                bita    #%00000001
                bne     loc_DFDB
                bita    #%00000010
                bne     loc_E00A
                bra     loc_E00D
loc_DFDB:
                brset   CCDFlags5, %10000000, loc_DFE9
                ldaa    CCDFlags6
                anda    #$7F
                cmpa    #$2D
                bcs     locret_E010
                bra     loc_E007
loc_DFE9:
                sei
                brclr   BitFlags6a_t3, %01000000, loc_DFF1
                cli
                bra     locret_E010
loc_DFF1:
                bset    BitFlags6a_t3, %01000000
                cli
                adda    #4
                cmpa    #$4C
                bcs     loc_DFFD
                anda    #$FE
loc_DFFD:
                anda    #$FD
                staa    DRBOffsetStored_LB
                ldaa    #$12
                staa    DRBOffsetStored_HB
loc_E007:
                bset    Counter_SpeedSensorInterrupt_HB_X, %100000
loc_E00A:
                bset    CCDFlags5, %10000000
loc_E00D:
                bset    CCDFlags5, %10000
locret_E010:
                rts
loc_E011:
                clra
                clrb
                staa    Temp0
                rts
loc_E017:
                ldaa    #$E4
                staa    Temp0
                ldaa    EngineRpm_HB
                ldab    MapValue
                rts
loc_E021:
                ldaa    #$84
                staa    Temp0
                sei
                ldaa    CCDFuelOutput_HB
                ldab    CCDFuelOutput_LB
                clr     CCDFuelOutput_HB
                clr     CCDFuelOutput_LB
                cli
                rts
loc_E033:
                ldaa    #$AC
                staa    Temp0
                ldd     byte_8012
                rts
loc_E03C:
                ldaa    #$8C
                staa    Temp0
                ldaa    CoolantTemp
                ldab    AmbientAirTempVolts2
                rts
loc_E046:
                ldaa    #$D4
                staa    Temp0
                ldaa    BatteryVolts
                bsr     sub_E05A
                stab    Temp3
                ldaa    TargetBatteryVolts
                bsr     sub_E05A
                ldaa    Temp3
                rts
sub_E05A:
                ldab    BodyComputerBatteryVoltsOutput
                cmpb    #$10
                bhi     loc_E075
                comb
                addb    #9
                bcs     loc_E06A
                mul
                adca    #0
                bra     loc_E075
loc_E06A:
                staa    Temp4
                mul
                adca    Temp4
                bcc     loc_E075
                ldaa    #$FF
loc_E075:
                tab
                rts
loc_E077:
                ldaa    #$42
                staa    Temp0
                ldaa    TpsVolts
                suba    LowestSessionTpsVolts
                bcc     loc_E083
                clra
loc_E083:
                clrb
                rts
loc_E085:
                ldaa    #$CC
                staa    Temp0
                ldaa    PPROG_EEPROMControlReg
                bita    #%10
                beq     loc_E094
                jmp     loc_E011
loc_E094:
                ldd     $B600
                lsld
                lsld
                staa    Temp3
                ldd     TargetIdleSpeedHB
                lsld
                lsld
                tab
                ldaa    Temp3
                rts
loc_E0A5:
                ldaa    #$54
                staa    Temp0
                ldaa    BaroPressure
                clrb
                rts
loc_E0AE:
                ldaa    #$24
                staa    Temp0
                ldd     VehicleSpeed_HB
                lsld
                lsld
                staa    Temp3
                lsld
                bcc     loc_E0BF
                ldaa    #$FF
loc_E0BF:
                ldab    #$34
                mul
                lsld
                lsld
                aslb
                adca    #0
                tab
                ldaa    Temp3
                rts
loc_E0CC:
                ldaa    PPROG_EEPROMControlReg
                bita    #%10
                bne     loc_E0FD
                ldx     #$B672
                ldab    Counter_SpeedSensorInterrupt_HB_X
                tba
                incb
                andb    #7
                anda    #$F8
                cmpb    #6
                bne     loc_E0E3
                clrb
loc_E0E3:
                aba
                staa    Counter_SpeedSensorInterrupt_HB_X
                aslb
                aslb
                abx
                brset   0,x, %11111111, loc_E0FD
                ldaa    0,x
                staa    Temp0
                adda    1,x
                adda    2,x
                cmpa    3,x
                bne     loc_E0FD
                ldd     1,x
                rts
loc_E0FD:
                jmp     loc_E011
loc_E100:
                ldaa    #$EC
                staa    Temp0
                clra
                brclr   b5C_IPL1_t3, %10, loc_E10C
                oraa    #1
loc_E10C:
                brclr   b5C_IPL1_t3, %1000000, loc_E112
                oraa    #2
loc_E112:
                brclr   Counter_SpeedSensorInterrupt_HB_X, %1000, loc_E118
                oraa    #4
loc_E118:
                brclr   b5C_IPL1_t3, %100000, loc_E11E
                oraa    #8
loc_E11E:
                clrb
                brclr   Counter_SpeedSensorInterrupt_HB_X, %10000, loc_E128
                bclr    Counter_SpeedSensorInterrupt_HB_X, %10000
                orab    #1
loc_E128:
                brclr   Counter_SpeedSensorInterrupt_HB_X, %100000, locret_E12E
                orab    #2
locret_E12E:
                rts
loc_E12F:
                ldaa    #$A4
                staa    Temp0
                clra
                brset   CruiseStatus_1, %10000000, loc_E13B
                oraa    #1
loc_E13B:
                ldab    TpsVolts
                subb    LowestSessionTpsVolts
                bcs     loc_E147
                cmpb    #5
                bcs     loc_E147
                oraa    #2
loc_E147:
                brclr   StartupSwitchMirror1, %100000, loc_E14D
                oraa    #4
loc_E14D:
                brclr   PIA2_Buffer_t3, 1, loc_E153
                oraa    #8
loc_E153:
                brset   PIA1_Buffer_t3, %1000000, loc_E159
                oraa    #$20
loc_E159:
                clrb
                rts
;;
off_E15B:       
                dw loc_E017
                dw loc_E021
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E046
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E021
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0A5
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E021
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E03C
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E021
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E085
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E021
                dw loc_E100
                dw loc_E011
                dw loc_E017
                dw loc_E046
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E021
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0CC
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E021
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E03C
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E021
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E033
                dw loc_E011
                dw loc_E011
                dw loc_E017
                dw loc_E0AE
                dw loc_E12F
                dw loc_E011
                dw loc_E017
                dw loc_E077
                dw loc_E011
                dw loc_E011
;;
byte_E25B:      db 6
                db 5
                db 9
                db $A
;;
byte_E25F:      db 7
                db 0, $D3, $FF, $85
                db $53, $AB, $FF, $9D
                db $D7, $78, $FF, $55
                db $E6, $6E, $FF, $17
                db $F1, $64, $FE, $CD
                db $F6, $5E, $FD, $AB
                db $FF, $49
;;
byte_E27A:      db 4
                db $42, $FF, $FF, $55
                db $57, $F1, $FF, $75
                db $C5, $B5, $FF, $4F
                db $FF, $8D
;;
byte_E289:      db 9
                db $58, 0, 1, $86
                db $6D, $20, 1, $86
                db $82, $40, 1, $86
                db $97, $60, 1, $86
                db $AC, $80, 1, $86
                db $C1, $A0, 1, $86
                db $D6, $C0, 1, $86
                db $EB, $E0, 1, $8C
                db $FF, $FF
;;
                db 3
                db $2F, $99, $FF, $AF
                db $CC, $67, $FF, $7C
                db $E9, $58
;;
                db 5
                db $15, $FF, $FE, 0
                db $1B, $F3, $FE, $F3
                db $2E, $DF, $FF, $4A
                db $4A, $CB, $FF, $91
                db $C8, $94
;;
byte_E2CA:      db 9
                db $58, 0, 1, $99
                db $6C, $20, 1, $99
                db $80, $40, 1, $99
                db $94, $60, 1, $99
                db $A8, $80, 1, $99
                db $BC, $A0, 1, $99
                db $D0, $C0, 1, $99
                db $E4, $E0, 1, $8C
                db $F8, $FF
;;
byte_E2ED:      db 6
                db 5, $FF, $FC, $C0
                db $15, $CB, $FE, $F8
                db $32, $AD, $FF, $83
                db $6F, $8F, $FF, $96
                db $C8, $6C, $FF, $56
                db $E7, $58
;;
byte_E304:      db 5
                db $79, $ED, $FF, $E4
                db $82, $EC, $FF, $95
                db $95, $E4, $FF, $A4
                db $AE, $DB, $FF, $8F
                db $B7, $D7
;;
byte_E317:      db 5
                db $51, $2E, $FF, $97
                db $82, $1A, $FF, $C0
                db $A2, $12, $FF, $CD
                db $CA, $A, $FF, $F1
                db $FF, 7
;;
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
;;
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
loc_E364:
                pula
loc_E365:
                ldab    #$FF
                stab    Temp7
loc_E36A:
                tba
                ldab    Temp7
                std     Temp6
                rts
;;
sub_E372:
                ldy     #0
                ldab    0,x
                aby
                inx
                ldab    #4
                cmpa    0,x
                bhi     loc_E386
loc_E381:
                ldaa    1,x
                tab
                bra     loc_E3A7
loc_E386:
                dey
                beq     loc_E381
                cmpa    4,x
                bcs     loc_E391
                abx
                bra     loc_E386
loc_E391:
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
loc_E3A7:
                psha
                pula
                rts
;;
sub_E3AA:
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
loc_E3BD:
                negb
                mul
loc_E3BF:
                adda    0,x
                tab
                pshb
                pulb
                pula
                rts
                rts
;;
sub_E3C7:
                ldy     #$36
                ldd     byte_8072
                ldx     byte_8074
                brclr   TimerOverflowsBetweenCamPulses, %11111111, loc_E3DD
                dey
                ldd     byte_8076
                ldx     byte_8078
loc_E3DD:
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
loc_E3F4:
                std     Temp6
                rts
;;
sub_E3F8:
                ldab    byte_8021
                beq     loc_E3FE
                mul
loc_E3FE:
                addd    byte_8022
                bcc     locret_E405
                ldaa    #$FF
locret_E405:
                rts
;;
sub_E406:
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
loc_E41B:
                psha
                pshb
                pulb
                pula
                rts
;;
sub_E420:
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
loc_E434:
                ldaa    0,x
                lsra
                cmpa    1,x
                bcs     locret_E43D
                staa    1,x
locret_E43D:
                rts
;;
sub_E43E:
                ldx     #byte_8053
                ldd     EngineRpm_HB
                aslb
                adca    #0
                jsr     sub_E372
                staa    EngineRPM_3D
                rts
;;
sub_E44C:
                ldy     #loc_E4C1
                brclr   2,x, %11111111, loc_E458
                ldy     #loc_E4BD
loc_E458:
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
loc_E47F:
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
loc_E4BD:
                blt     loc_E4C9
                bra     loc_E4C3
loc_E4C1:
                bcs     loc_E4C9
loc_E4C3:
                mul
                adca    #0
                nega
                bra     loc_E4CD
loc_E4C9:
                nega
                mul
                adca    #0
loc_E4CD:
                adda    0,x
                rts
;;
sub_E4D0:
                suba    0,y
                bcs     loc_E4DA
                ldab    1,x
                mul
                bra     loc_E4E2
loc_E4DA:
                nega
                ldab    0,x
                mul
                nega
                negb
                sbca    #0
loc_E4E2:
                addd    0,y
                std     0,y
                rts
;;
sub_E4E9:
                sei
                ldaa    SwitchPortAccessReg1
                eora    #2
                staa    SwitchPortAccessReg1
                cli
;;
sub_E4F3:
                ldd     #$55AA
                staa    COPRST_ArmOCToggleAndResetCopTimerReg
                stab    COPRST_ArmOCToggleAndResetCopTimerReg
                rts
sub_E4FD:
                ldaa    SwitchPortAccessReg1
                anda    #$FD
                staa    SwitchPortAccessReg1
                ldab    #$10
loc_E507:
                decb
                bne     loc_E507
                oraa    #2
                staa    SwitchPortAccessReg1
                ldd     #$55AA
                staa    COPRST_ArmOCToggleAndResetCopTimerReg
                stab    COPRST_ArmOCToggleAndResetCopTimerReg
                rts
                ldx     #ErrorBitRegisterStored0
                bra     loc_E526
                ldx     #Ram_05
                bra     loc_E526
;;
sub_E523:
                ldx     #1
loc_E526:
                ldy     #$242
                jsr     sub_E4FD
loc_E52D:
                ldaa    SwitchPortAccessReg1
                bita    #%1000000
                bne     loc_E536
                sec
                rts
loc_E536:
                jsr     sub_E4FD
                clc
                dey
                bne     loc_E52D
                dex
                bne     loc_E526
                rts
;;
sub_E542:
                ldaa    SwitchPortAccessReg1
                bita    #%1000000
                bne     loc_E55E
                brset   Ram_30, %1000000, loc_E559
                bset    Ram_30, %1000000
                bclr    BitFlags21, %10000000
                bclr    BitFlags2e, %1000010
                bclr    Ram_30, %10000000
loc_E559:
                clr     CountdownTimerFromKeyOn
                cli
                rts
loc_E55E:
                bclr    BitFlags21, %10000000
                bclr    BitFlags2e, %1000010
                bclr    Ram_30, %11000000
                ldaa    CountdownTimerFromKeyOn
                bne     loc_E576
                ldaa    #$17
                ldab    TimerOverflowsBetweenCamPulses
                cmpb    #4
                bcs     loc_E576
                ldaa    #9
loc_E576:
                deca
                beq     loc_E57D
                staa    CountdownTimerFromKeyOn
                rts
loc_E57D:
                sei
                clra
                staa    ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
                staa    ClearTheErrorTimer_0
                jsr     sub_E4FD
                jsr     sub_CFDE
                ldaa    #$20
loc_E58B:
                ldab    SwitchPortAccessReg1
                bitb    #%1000000
                beq     loc_E559
                deca
                bne     loc_E58B
                jsr     sub_E4FD
                ldaa    #$32
                staa    Temp3
loc_E59D:
                jsr     sub_E523
                bcs     loc_E5E9
                dec     Temp3
                bne     loc_E59D
                ldaa    #$FF
                staa    TFLG1_TimerInterruptFlag1
                ldaa    #$32
                staa    Temp3
loc_E5B1:
                jsr     sub_E523
                bcs     loc_E5E9
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #%110
                bne     loc_E5E9
                dec     Temp3
                bne     loc_E5B1
                ldab    #3
loc_E5C4:
                ldaa    #$10
                staa    ADCTL_A2DControlReg
loc_E5C9:
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
                bset    Ram_05, %100
                bra     loc_E5E9
loc_E5E6:
                bclr    Ram_05, %100
loc_E5E9:
                jsr     sub_E648
                std     MinimumTimerCountBeforeMainloopCanContinue
                jsr     sub_E4FD
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
                jsr     sub_E4FD
loc_E623:
                ldab    SwitchPortAccessReg1
                bitb    #%1000000
                beq     loc_E633
                jsr     sub_E4F3
                jmp     loc_E623
                jmp     loc_E623
loc_E633:
                jsr     sub_E4F3
                ldaa    #$40
loc_E638:
                ldab    SwitchPortAccessReg1
                bitb    #%1000000
                bne     loc_E623
                deca
                bne     loc_E638
                jsr     sub_E4F3
                jmp     __RESET
;;
sub_E648:
                clra
                clrb
                ldx     #Ram_05
loc_E64D:
                addb    0,x
                bcc     loc_E652
                inca
loc_E652:
                inx
                cpx     #$20
                bcs     loc_E64D
                rts
                ldaa    #$16
                bsr     sub_E65F
                ldaa    #2
;;
sub_E65F:
                staa    PPROG_EEPROMControlReg
                stab    0,x
                inca
                staa    PPROG_EEPROMControlReg
                ldy     #$1658
loc_E66C:
                dey
                bne     loc_E66C
                deca
                staa    PPROG_EEPROMControlReg
                clra
                staa    PPROG_EEPROMControlReg
                rts
;;
sub_E679:
                brset   BitFlags6a_t3, %1000000, loc_E680
                jmp     loc_E709
loc_E680:
                ldaa    PPROG_EEPROMControlReg
                beq     loc_E696
                bclr    BitFlags6a_t3, %10000000
                cmpa    #$17
                bne     loc_E691
                bset    BitFlags6a_t3, %1000
                bra     loc_E69C
loc_E691:
                bclr    BitFlags6a_t3, %1000
                bra     loc_E69C
loc_E696:
                bset    BitFlags6a_t3, %10000000
                bclr    BitFlags6a_t3, %1000
loc_E69C:
                clra
                staa    PPROG_EEPROMControlReg
                ldaa    CountdownTimerFromKeyOn
                beq     loc_E6AE
                ldab    #3
                cba
                bcc     loc_E6AE
                tba
                staa    CountdownTimerFromKeyOn
loc_E6AE:
                ldx     #$B600
                ldab    DRBOffsetStored_HB
                abx
                ldab    DRBOffsetStored_LB
                ldaa    0,x
                cba
                beq     loc_E6F6
                brset   BitFlags6a_t3, %10000000, loc_E6E0
                brclr   BitFlags6a_t3, %1000, loc_E6C9
                cmpa    #$FF
                beq     loc_E6E0
loc_E6C9:
                brset   b5D_IPL2_t3, %1000000, loc_E6F6
                pshx
                psha
                pshb
                ldd     #$318A
                jsr     ThrowNonCriticalError
                pulb
                pula
                pulx
                bcc     loc_E6E0
                bset    b5D_IPL2_t3, %1000000
                bra     loc_E6F6
loc_E6E0:
                anda    DRBOffsetStored_LB
                cmpa    DRBOffsetStored_LB
                beq     loc_E6EC
                ldaa    #$16
                bra     loc_E6EE
loc_E6EC:
                ldaa    #2
loc_E6EE:
                staa    PPROG_EEPROMControlReg
                stab    0,x
                inca
                bra     loc_E70A
loc_E6F6:
                bclr    BitFlags6a_t3, %1000000
                brset   BitFlags6a_t3, %100000, loc_E709
                ldaa    #3
                cmpa    CountdownTimerFromKeyOn
                bne     loc_E709
                ldaa    #1
                staa    CountdownTimerFromKeyOn
loc_E709:
                clra
loc_E70A:
                staa    PPROG_EEPROMControlReg
                rts
;;
sub_E70E:
                ldx     #$B610
loc_E711:
                ldab    #$10
                abx
                cpx     #$B650
                bhi     locret_E722
                ldaa    0,x
                inca
                beq     locret_E722
                bsr     sub_E723
                bra     loc_E711
locret_E722:
                rts
;;
sub_E723:
                ldaa    #$E
                staa    PPROG_EEPROMControlReg
                stab    0,x
                inca
                staa    PPROG_EEPROMControlReg
                ldy     #$1652
loc_E732:
                dey
                bne     loc_E732
                deca
                staa    PPROG_EEPROMControlReg
                clr     PPROG_EEPROMControlReg
                sei
                jsr     sub_E4FD
                cli
                rts
;;
IC2I:
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
loc_E75E:
                ldd     Counter_SpeedSensorInterrupt_HB
                addd    #1
                std     Counter_SpeedSensorInterrupt_HB
                bne     loc_E76A
                bset    IPL1, %10000000
loc_E76A:
                ldd     VehicleSpeed_HB
                subd    #$500
                ldaa    BitFlags24
                bcc     loc_E794
                bita    #%10000
                bne     loc_E77B
                oraa    #$10
                bra     loc_E79B
loc_E77B:
                anda    #$1F
                oraa    #8
                staa    BitFlags24
                clra
                staa    CruiseControlVar4
                staa    Counter_SomethingWithDistributor
                staa    Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                ldd     VehicleSpeed_HB
                addd    #$53
                std     VehicleSpeed_HB
                jmp     loc_E812
loc_E794:
                bita    #%10000
                beq     loc_E79B
                jmp     loc_E818
loc_E79B:
                adda    #$20
                bcs     loc_E7A5
                anda    #$EF
                staa    BitFlags24
                bra     loc_E812
loc_E7A5:
                staa    BitFlags24
                ldab    CruiseControlVar4
                beq     loc_E7CB
                bita    #%1000
                bne     loc_E7CB
                ldaa    #$3A
                mul
                adca    #0
                cmpa    #3
                bcc     loc_E7BB
                ldaa    #3
loc_E7BB:
                tab
                ldaa    Counter_SomethingWithDistributor
                suba    CruiseControlVar4
                bcc     loc_E7C5
                nega
loc_E7C5:
                sba
                bcs     loc_E7D1
                bset    BitFlags24, %1000
loc_E7CB:
                ldab    Counter_SomethingWithDistributor
                stab    CruiseControlVar4
loc_E7D1:
                clra
                staa    Counter_SomethingWithDistributor
                ldd     Temp5_t3
                ldx     #Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                ldy     #LDXi_6490
                jsr     sub_E420
                ldaa    Counter_TimerRegHalfOverflowBetweenSpeedoPulses
                lsra
                tab
                oraa    TimerOverflowsBetweenSpeedoPulses
                beq     loc_E7F3
                stab    TimerOverflowsBetweenSpeedoPulses
                ldd     Temp5_t3
                subd    PreviousVehicleSpeed_HB
                bra     loc_E808
loc_E7F3:
                ldd     Temp5_t3
                subd    PreviousVehicleSpeed_HB
                subd    SpeedoSensorPulsewidth_HB
                beq     loc_E80A
                asra
                rorb
                asra
                rorb
                subd    #0
                bne     loc_E806
                incb
loc_E806:
                addd    SpeedoSensorPulsewidth_HB
loc_E808:
                std     SpeedoSensorPulsewidth_HB
loc_E80A:
                ldd     Temp5_t3
                std     PreviousVehicleSpeed_HB
                clra
                staa    Counter_TimerRegHalfOverflowBetweenSpeedoPulses
loc_E812:
                ldaa    #2
                staa    TFLG1_TimerInterruptFlag1
                rti
loc_E818:
                anda    #$EF
                staa    BitFlags24
                ldaa    #1
                staa    TimerOverflowsBetweenSpeedoPulses
                ldd     #$5F90
                bra     loc_E808
;;
sub_E825:
                ldaa    TCTL2_TimerControlReg2
                lsra
                eora    PORTA_PortA
                bita    #2
                rts
;;
OC1I:
                bsr     sub_E832
                rti
;;
sub_E832:
                ldaa    #$80
                staa    TFLG1_TimerInterruptFlag1
                ldaa    #$10
                staa    ADCTL_A2DControlReg
                ldd     TOC1_Counter_OC1
                addd    #$1E0
                cpd     TCNT_Counter_FreeRunning16bit
                bmi     loc_E859
                subd    #$89
                cpd     TCNT_Counter_FreeRunning16bit
                bpl     loc_E854
                addd    #$89
loc_E854:
                addd    #$89
                bra     loc_E85F
loc_E859:
                ldd     TCNT_Counter_FreeRunning16bit
                addd    #$1E0
loc_E85F:
                std     TOC1_Counter_OC1
                ldaa    TMSK1_TimerInterruptMask1
                anda    #$7F
                staa    TMSK1_TimerInterruptMask1
                inc     Timer_AlternatorDutyCycle
                ldx     #SwitchPortAccessReg1
                ldaa    ATMOffset
                cmpa    #$D
                bne     loc_E879
                jmp     loc_E907
loc_E879:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_E879
                ldaa    ADR2_A2DResults2
                staa    BatteryVoltsRaw
                cli
                cmpa    BatteryVolts
                bcc     loc_E88A
                staa    BatteryVolts
loc_E88A:
                ldaa    EngineRpm_HB
                cmpa    #$C
                bcs     loc_E898
                cmpa    #$10
                bcc     loc_E89D
                brset   BitFlags24, 1, loc_E89D
loc_E898:
                bclr    BitFlags24, 1
                bra     loc_E900
loc_E89D:
                bset    BitFlags24, 1
                ldaa    BatteryVoltsRaw
                cmpa    #$41
                bcc     loc_E8AC
                ldab    Counter_MainLoop
                bitb    #%110
                bne     loc_E900
loc_E8AC:
                brclr   BitFlags21, %10000, loc_E8C7
                ldaa    A2DResults2Temp
                bne     loc_E8B8
                ldaa    BatteryVoltsRaw
                staa    A2DResults2Temp
loc_E8B8:
                suba    BatteryVoltsRaw
                bls     loc_E900
                cmpa    byte_89F2
                bls     loc_E900
                bset    BitFlags21, %100000
                bclr    BitFlags21, %10000
loc_E8C7:
                clr     A2DResults2Temp
                ldaa    BatteryVoltsRaw
                suba    TargetBatteryVolts
                bne     loc_E8D6
                brclr   0,x, %100, loc_E8F7
                bra     loc_E900
loc_E8D6:
                ldab    #7
                bcc     loc_E8EA
                nega
                cmpa    #2
                beq     loc_E8E3
                bcc     loc_E8F7
                ldab    #3
loc_E8E3:
                andb    Timer_AlternatorDutyCycle
                beq     loc_E900
                bra     loc_E8F7
loc_E8EA:
                cmpa    #2
                beq     loc_E8F2
                bcc     loc_E900
                ldab    #3
loc_E8F2:
                andb    Timer_AlternatorDutyCycle
                bne     loc_E900
loc_E8F7:
                sei
                bset    0,x, %100
                bset    BitFlags24, %10
                bra     loc_E907
loc_E900:
                sei
                bclr    0,x, %100
                bclr    BitFlags24, %10
loc_E907:
                bset    2,x, %100
                ldaa    #$14
loc_E90C:
                deca
                bne     loc_E90C
                bclr    2,x, %100
                cli
                ldaa    Timer_AlternatorDutyCycle
                lsra
                bcs     loc_E995
                ldab    BitFlags36_t3
                bitb    #%1000000
                bne     loc_E92E
                lsra
                bcs     loc_E995
                ldaa    EngineRpm_HB
                cmpa    #$5E
                bcs     loc_E92E
                ldaa    CurrentAisPosition
                cmpa    DesiredNewAisPosition
                beq     loc_E995
loc_E92E:
                ldaa    BatteryVolts
                cmpa    byte_867C
                bcs     loc_E995
                sei
                ldaa    PIA3_Buffer_t3
                oraa    #1
                staa    PIA3_Buffer_2_t3
                anda    #$FE
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldab    CurrentAisPosition
                brclr   BitFlags36_t3, %1000000, loc_E954
                ldaa    #1
                tstb
                bne     loc_E95C
                bclr    BitFlags36_t3, %1000000
                bra     loc_E964
loc_E954:
                ldaa    #1
                cmpb    DesiredNewAisPosition
                beq     loc_E964
                bcs     loc_E95D
loc_E95C:
                nega
loc_E95D:
                tab
                adda    CurrentAisPosition
                staa    CurrentAisPosition
                bra     loc_E965
loc_E964:
                clrb
loc_E965:
                ldx     #byte_E25B
                addb    BitFlags_36_t3
                andb    #3
                stab    BitFlags_36_t3
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
                bclr    0,x, %100000
                cmpa    SPSR_SerialPeripheralStatus
                staa    SPDR_SerialPeripheralDataIO
                ldaa    PIA3_Buffer_t3
                oraa    #1
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                mul
                bset    0,x, %100000
                cli
loc_E995:
                brclr   DRBSerialMode, %10000000, loc_E9EC
                ldaa    SCSR_SerialStatus
                bita    #%1110
                psha
                pula
                beq     loc_E9A7
                ldab    SCDR_SerialData
                bra     loc_E9EC
loc_E9A7:
                bita    #%100000
                beq     loc_E9EC
                ldab    SCDR_SerialData
                cmpb    #$F2
                bne     loc_E9B7
                bclr    BitFlags21, %1000000
                bra     loc_E9E9
loc_E9B7:
                cmpb    #$F6
                bne     loc_E9C0
                bset    BitFlags21, %1000000
                bra     loc_E9E9
loc_E9C0:
                cmpb    #$FE
                bne     loc_E9CA
                bclr    DRBSerialMode, %10110000
                bclr    BitFlags21, %1000000
loc_E9CA:
                brset   BitFlags21, %1000000, loc_E9D6
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
;;
sub_E9F9:
                ldd     #$8EFF
                stab    TFLG1_TimerInterruptFlag1
                staa    TMSK1_TimerInterruptMask1
                stab    TFLG2_TimerInterruptFlag2
                clr     PACNT_PulseAccumulatorCounter
;;
sub_EA08:
                ldab    #1
                ldaa    SwitchPortAccessReg2
                bita    #1
                beq     loc_EA13
                ldab    #0
loc_EA13:
                stab    PIA_Ctrl_2
                anda    #1
                eora    SwitchPortAccessReg2
                bita    #1
                beq     loc_EA2D
                ldaa    SwitchPortAccessReg2
                ldab    #1
                bita    #1
                beq     loc_EA2A
                ldab    #0
loc_EA2A:
                stab    PIA_Ctrl_2
loc_EA2D:
                ldd     #$1FB
                stab    PIA_Ctrl_4
                staa    PIA_Ctrl_3
                rts
;;
sub_EA37:
                ldx     #PORTA_PortA
                brset   9,x, %111010, loc_EA41
                bset    9,x, %111010
loc_EA41:
                brclr   9,x, %101, loc_EA48
                bclr    9,x, %101
loc_EA48:
                brclr   $C,x, %11111000, loc_EA4F
                bclr    $C,x, %11111111
loc_EA4F:
                brclr   $D,x, %11111000, loc_EA56
                bclr    $D,x, %11111111
loc_EA56:
                brset   $20,x, %10100010, loc_EA5D
                bset    $20,x, %10100010
loc_EA5D:
                brclr   $20,x, %1100, loc_EA64
                bclr    $20,x, %1100
loc_EA64:
                brset   $21,x, %11010, loc_EA6B
                bset    $21,x, %11010
loc_EA6B:
                brclr   $21,x, %100101, loc_EA72
                bclr    $21,x, %100101
loc_EA72:
                brset   $22,x, %10001110, loc_EA79
                bset    $22,x, %10001110
loc_EA79:
                brclr   $22,x, %1100001, loc_EA80
                bclr    $22,x, %1100001
loc_EA80:
                brclr   $24,x, %11110000, loc_EA87
                bclr    $24,x, %11110000
loc_EA87:
                brset   $26,x, %1110000, loc_EA8E
                bset    $26,x, %1110000
loc_EA8E:
                brclr   $26,x, %10000000, loc_EA95
                bclr    $26,x, %10000000
loc_EA95:
                brset   $28,x, %1010100, loc_EA9C
                bset    $28,x, %1010100
loc_EA9C:
                brclr   $28,x, %10101011, loc_EAA3
                bclr    $28,x, %10101011
loc_EAA3:
                brclr   $2C,x, %11000, loc_EAAA
                bclr    $2C,x, %11000
loc_EAAA:
                brset   $2D,x, %1100, loc_EAB1
                bset    $2D,x, %1100
loc_EAB1:
                brclr   $2D,x, %11110011, loc_EAB8
                bclr    $2D,x, %11110011
loc_EAB8:
                brset   $39,x, %10001000, loc_EABF
                bset    $39,x, %10001000
loc_EABF:
                brclr   $39,x, %1000000, loc_EAC6
                bclr    $39,x, %1000000
loc_EAC6:
                brset   $3C,x, %1111, loc_EACF
                sei
                bset    $3C,x, %1111
                cli
loc_EACF:
                ldx     #SwitchPortAccessReg1
                sei
                brclr   2,x, %1110000, loc_EADA
                bclr    2,x, %1110000
loc_EADA:
                brset   2,x, %10000011, loc_EAE1
                bset    2,x, %10000011
loc_EAE1:
                cli
                brclr   3,x, %11111110, loc_EAE9
                bclr    3,x, %11111110
loc_EAE9:
                brclr   4,x, %11111110, loc_EAF0
                bclr    4,x, %11111110
loc_EAF0:
                brset   6,x, %11111000, loc_EAF7
                bset    6,x, %11111000
loc_EAF7:
                brclr   6,x, %110, locret_EAFE
                bclr    6,x, %110
locret_EAFE:
                rts

word_EAFF:      
                dw $4614
                dw $3D15
                dw $4513

word_EB05:      
                dw $3D14
                dw $1513
;;
sub_EB09:
                ldaa    EngineRpm_HB
                cmpa    #$5E
                bcc     loc_EB7D
                ldaa    BatteryVolts
                cmpa    #$C3
                bcs     loc_EB7D
                ldaa    SwitchPortAccessReg1
                bita    #%10000
                beq     loc_EB7D
                brset   PIA2_Buffer_t3, %10000, loc_EB7D
                bita    #%1000000
                bne     loc_EB7D
                brset   b5d_IPL2, %100000, loc_EB7D
                sei
                ldaa    SwitchPortAccessReg2
                anda    #$F0
                bne     loc_EB80
                brset   BitFlags27, %10000000, loc_EB3B
                ldaa    PORTA_PortA
                bita    #%1100000
                bne     loc_EB80
loc_EB3B:
                brclr   BitFlags21, %10000000, loc_EB80
                ldab    #7
loc_EB41:
                decb
                bne     loc_EB41
                ldaa    PIA_Ctrl_4
                bita    #%100
                bne     loc_EB78
                ldaa    BitFlags_BF_t3
                ldab    CylinderPointer
                cli
                ldx     #word_EB05
                brset   BitFlags27, %10000000, loc_EB5A
                ldx     #word_EAFF
loc_EB5A:
                cmpa    #$84
                bne     loc_EB69
                decb
                bpl     loc_EB69
                ldab    #3
                brset   BitFlags27, %10000000, loc_EB69
                ldab    #5
loc_EB69:
                andb    #7
                abx
                ldaa    0,x
                ldab    #$90
                jsr     ThrowNonCriticalError
                bcc     loc_EB78
                bset    b5d_IPL2, %100000
loc_EB78:
                ldab    #4
                stab    PIA_Ctrl_4
loc_EB7D:
                bclr    BitFlags21, %10000000
loc_EB80:
                cli
                rts
;;                
off_EB82:       
                dw loc_EC37
                dw loc_EEFC
                dw loc_F016
                dw loc_F143
;;
IC1I:
                ldx     EngineRpm_HB
                cpx     #$BB80
                bcc     loc_EBBC
                ldd     TIC1_Counter_IC1_CamSensor
                subd    TIC3_Counter_IC3_CrankSensor
                cpd     #5
                bcc     loc_EBA5
loc_EB9D:
                ldaa    #5
                staa    TFLG1_TimerInterruptFlag1
                jmp     locret_F345
loc_EBA5:
                cpx     #$5DC0
                bcc     loc_EBBC
                ldx     TIC1_Counter_IC1_CamSensor
                ldab    #$C
                abx
                ldaa    #4
loc_EBB2:
                bita    PORTA_PortA
                beq     loc_EB9D
                cpx     TCNT_Counter_FreeRunning16bit
                bpl     loc_EBB2
loc_EBBC:
                ldd     #$510
                staa    TFLG1_TimerInterruptFlag1
                stab    ADCTL_A2DControlReg
                ldab    CountdownTimerFromKeyOn
                bne     loc_EBCD
                bclr    Ram_05, 1
loc_EBCD:
                ldab    BitFlags_BF_t3
                bpl     loc_EC16
                bitb    #%100
                beq     loc_EBD7
                andb    #$F8
loc_EBD7:
                incb
                stab    BitFlags_BF_t3
                andb    #7
                decb
                aslb
                ldx     #off_EB82
                abx
                ldx     0,x
                ldaa    #1
                ldab    CylinderPointer
                cmpb    #5
                beq     loc_EBF1
                cmpb    #2
                bcs     loc_EBF1
                deca
loc_EBF1:
                eora    SwitchPortAccessReg2
                lsra
                bcs     loc_EC16
                ldaa    EngineRpm_HB
                ldab    #1
                cmpa    #$5E
                bcc     loc_EC0A
                stab    PIA_Ctrl_4
                orab    PIA_Ctrl_3
                stab    PIA_Ctrl_3
                jmp     0,x
loc_EC0A:
                stab    PIA_Ctrl_4
                comb
                andb    PIA_Ctrl_3
                stab    PIA_Ctrl_3
                jmp     0,x
loc_EC16:
                bclr    BitFlags_BF_t3, %10000000
                bclr    BitFlags2b, %10000000
                brset   BitFlags2b, %1000000, loc_EC31
                ldaa    UNe_64B9
                tab
                anda    #$E0
                andb    #$1F
                cmpb    #$1F
                beq     loc_EC2D
                incb
loc_EC2D:
                aba
                staa    UNe_64B9
loc_EC31:
                jsr     sub_EA08
                jmp     loc_F336
loc_EC37:
                brset   PIA3_Buffer_t3, %1000000, loc_EC4C
                jsr     sub_F363
                ldd     #$FFFF
                addd    TCNT_Counter_FreeRunning16bit
                std     TOC4_Counter_OC4
                ldaa    #$10
                staa    TFLG1_TimerInterruptFlag1
loc_EC4C:
                brset   BitFlags27, %10000000, loc_EC64
                brclr   BitFlags27, %1000000, loc_EC78
                ldaa    CylinderPointer
                beq     loc_EC78
                cmpa    #3
                beq     loc_EC78
                cmpa    #1
                beq     loc_EC6F
                cmpa    #4
                beq     loc_EC6F
loc_EC64:
                ldaa    PIA3_Buffer_t3
                anda    #$FD
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     loc_EC78
loc_EC6F:
                ldaa    PIA3_Buffer_t3
                oraa    #2
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
loc_EC78:
                ldd     TIC1_Counter_IC1_CamSensor
                ldx     #Counter_TimerPastHalfwayBetweenCamPulses
                ldy     #LDXi_6490
                jsr     sub_E420
                ldaa    Counter_TimerPastHalfwayBetweenCamPulses
                lsra
                staa    TimerOverflowsBetweenCamPulses
                ldd     TIC1_Counter_IC1_CamSensor
                subd    LastCamFallingEdgeTime
                std     DistributorFallingEdgePulsewidth_HB
                ldd     TIC1_Counter_IC1_CamSensor
                std     LastCamFallingEdgeTime
                clr     Counter_TimerPastHalfwayBetweenCamPulses
                ldaa    CalculatedDwellTime
                clrb
                lsrd
                std     AntiDwellTime_HB
                ldd     DistributorFallingEdgePulsewidth_HB
                subd    #$C8
                cpd     AntiDwellTime_HB
                bcs     loc_ECAF
                ldd     AntiDwellTime_HB
loc_ECAF:
                std     AntiDwellTime_HB
                ldaa    TimerOverflowsBetweenCamPulses
                bne     loc_ECF4
                ldx     #SwitchPortAccessReg1
                ldd     byte_82B1
                cpd     DistributorFallingEdgePulsewidth_HB
                bcs     loc_ECF4
                brset   IPL1, %1000000, loc_ECFC
                brclr   BitFlags23, %10000000, loc_ECD1
                brset   0,x, %100000, loc_ECD1
                ldaa    Ram_7F
                beq     loc_ECD9
loc_ECD1:
                ldd     byte_82AF
                cpd     DistributorFallingEdgePulsewidth_HB
                bcs     loc_ECF4
loc_ECD9:
                bset    IPL1, %1000000
                ldd     #0
                std     KeyOnOrEngineRunningTime
                staa    ATMOffset
                bset    Ram_80, %11111111
                jsr     sub_C39F
                jsr     sub_C3D3
                jsr     sub_C579
                jsr     sub_C5BA
                bra     loc_ECFC
loc_ECF4:
                bclr    IPL1, %1000000
                ldaa    byte_861A
                staa    Counter_C
loc_ECFC:
                ldaa    TimerOverflowsBetweenCamPulses
                bne     loc_ED3B
                ldx     #SwitchPortAccessReg1
                ldd     byte_807C
                cpd     DistributorFallingEdgePulsewidth_HB
                bcs     loc_ED3B
                brset   IPL1, 1, loc_ED5E
                brclr   BitFlags23, %10000000, loc_ED1B
                brset   0,x, %100000, loc_ED1B
                ldaa    Ram_7F
                beq     loc_ED23
loc_ED1B:
                ldd     byte_807A
                cpd     DistributorFallingEdgePulsewidth_HB
                bcs     loc_ED3B
loc_ED23:
                ldaa    TMSK1_TimerInterruptMask1
                oraa    #$10
                staa    TMSK1_TimerInterruptMask1
                ldd     #$FFFF
                addd    TCNT_Counter_FreeRunning16bit
                std     TOC4_Counter_OC4
                ldaa    #$10
                staa    TFLG1_TimerInterruptFlag1
                bra     loc_ED5E
loc_ED3B:
                bclr    IPL1, 1
                bset    BitFlags2d, %10000000
                ldaa    #8
                staa    Ram_4D
                staa    CalculatedSparkAdvance
                ldaa    TMSK1_TimerInterruptMask1
                anda    #$EF
                staa    TMSK1_TimerInterruptMask1
                ldaa    PIA3_Buffer_t3
                oraa    #$40
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bset    IPL1, %10
                jmp     loc_EE40
loc_ED5E:
                brclr   BitFlags2d, %10000000, loc_ED6D
                ldaa    Ram_4D
                adda    byte_807F
                bpl     loc_ED6B
                ldaa    #$7F
loc_ED6B:
                staa    Ram_4D
loc_ED6D:
                brset   BitFlags27, %10000000, loc_EDA8
                brclr   IPL1, 1, loc_ED84
                ldab    EngineRpm_HB
                cmpb    #$1F
                bcs     loc_ED84
                ldaa    CalculatedSparkAdvance
                cmpa    #$50
                bcs     loc_ED84
                jmp     loc_EE40
loc_ED84:
                ldaa    AdvanceTemporary
                brclr   BitFlags2d, %10000000, loc_ED95
                cmpa    Ram_4D
                bls     loc_ED92
                ldaa    Ram_4D
                bra     loc_ED95
loc_ED92:
                bclr    BitFlags2d, %10000000
loc_ED95:
                staa    CalculatedSparkAdvance
                bset    IPL1, 1
                ldaa    #$80
                suba    CalculatedSparkAdvance
                psha
                ldab    #$11
                mul
                adca    #0
                pulb
                aba
                bra     loc_EDDA
loc_EDA8:
                brclr   IPL1, 1, loc_EDBB
                ldab    EngineRpm_HB
                cmpb    #$1F
                bcs     loc_EDBB
                ldaa    CalculatedSparkAdvance
                cmpa    #$50
                bcs     loc_EDBB
                jmp     loc_EE40
loc_EDBB:
                ldaa    AdvanceTemporary
                brclr   BitFlags2d, %10000000, loc_EDCC
                cmpa    Ram_4D
                bls     loc_EDC9
                ldaa    Ram_4D
                bra     loc_EDCC
loc_EDC9:
                bclr    BitFlags2d, %10000000
loc_EDCC:
                staa    CalculatedSparkAdvance
                bset    IPL1, 1
                ldaa    #$80
                suba    CalculatedSparkAdvance
                ldab    #$B6
                mul
                adca    #0
loc_EDDA:
                psha
                ldab    DistributorFallingEdgePulsewidth_HB
                mul
                std     Temp5_t3
                pula
                ldab    DistributorFallingEdgePulsewidth_LB
                mul
                adca    #0
                tab
                clra
                addd    Temp5_t3
                addd    LastCamFallingEdgeTime
                subd    #$A
                std     Temp5_t3
                bset    IPL1, %10
                ldx     #TCTL1_TimerControlReg1
                subd    AntiDwellTime_HB
                std     DoubleTempB
                subd    TCNT_Counter_FreeRunning16bit
                bmi     loc_EE12
                cpd     #$20
                bmi     loc_EE12
                ldaa    PORTA_PortA
                bita    #%1000
                beq     loc_EE2A
loc_EE12:
                bset    0,x, %11
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell
                bclr    0,x, 1
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
                bra     loc_EE40
loc_EE2A:
                bclr    0,x, 1
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     DoubleTempB
                std     TOC5_Counter_OC5_Dwell
                bset    0,x, %11
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
loc_EE40:
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #%1000
                beq     loc_EE4A
                jsr     sub_F36D
loc_EE4A:
                brset   IPL1, %100, loc_EE53
                jsr     sub_C5F1
                bra     loc_EE99
loc_EE53:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_EE53
                ldaa    ADR1_A2DResults1
                ldab    EngineRpm_HB
                cmpb    #$2F
                bcc     loc_EE6F
                cmpb    #$D
                bcs     loc_EE6F
                cmpa    byte_8A08
                bcc     loc_EE73
                cmpa    byte_8A07
                bcs     loc_EE73
loc_EE6F:
                brclr   b5C_IPL1_t3, %10001000, loc_EE76
loc_EE73:
                jsr     sub_D61E
loc_EE76:
                jsr     sub_E3F8
                tab
                stab    MapValue_t3
                bra     loc_EE99
;;
off_EE7F:       
                dw InjectorPulsewidth_HB_Cyl1
                dw InjectorPulsewidth_HB_Cyl3
                dw InjectorPulsewidth_HB_Cyl4
                dw InjectorPulsewidth_HB_Cyl2
;;
off_EE87:       
                dw TOC3_Counter_OC3
                dw InjectorPulsewidth_HB_Cyl3
                dw InjectorPulsewidth_HB_Cyl1
                dw InjectorPulsewidth_HB_Cyl4
                dw TOC2_Counter_OC2
                dw InjectorPulsewidth_HB_Cyl2
;;
byte_EE93:      
                db $10
                db $20
                db $EF
;;
byte_EE96:      
                db $40
                db $40
                db $BF
;;
loc_EE99:
                ldd     InjectorPulsewidth_HB
                beq     locret_EEF8
                brclr   BitFlags2c, %11, loc_EEA3
                bra     locret_EEF8
loc_EEA3:
                ldx     #off_EE7F
                brset   BitFlags27, %10000000, loc_EEAD
                ldx     #off_EE87
loc_EEAD:
                ldab    CylinderPointer
                aslb
                abx
                ldx     0,x
                ldy     #byte_EE93
                cpx     #TOC3_Counter_OC3
                beq     loc_EED3
                ldy     #byte_EE96
                cpx     #TOC2_Counter_OC2
                beq     loc_EED3
                ldd     InjectorPulsewidth_HB
                std     0,x
                cpd     #$7F
                bcs     locret_EED2
                bset    BitFlags21, %10000000
locret_EED2:
                rti
loc_EED3:
                ldd     0,y
                oraa    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    InjectorPulsewidth_HB
                std     0,x
                cpd     #$7F
                bcs     loc_EEEF
                bset    BitFlags21, %10000000
loc_EEEF:
                ldaa    2,y
                anda    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
locret_EEF8:
                rti
loc_EEF9:
                jmp     loc_EFDF
loc_EEFC:
                ldd     TIC1_Counter_IC1_CamSensor
                std     L00F5_t3
                brclr   IPL1, 1, loc_EF36
                ldaa    EngineRpm_HB
                cmpa    #$5E
                bcc     loc_EEF9
                ldd     L00F5_t3
                brclr   IPL1, %10, loc_EEF9
                subd    LastCamFallingEdgeTime
                lsld
                lsld
                xgdy
                ldaa    #$58
                suba    CalculatedSparkAdvance
                ble     loc_EEF9
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
                bra     loc_EF45
loc_EF36:
                ldd     #$308
                oraa    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    TFLG1_TimerInterruptFlag1
                jmp     loc_EFDA
loc_EF45:
                ldaa    PORTA_PortA
                bita    #%1000
                bne     loc_EF80
                ldaa    TCTL1_TimerControlReg1
                bita    #1
                bne     loc_EF56
                jmp     loc_EFDF
loc_EF56:
                ldd     Temp5_t3
                subd    AntiDwellTime_HB
                std     TOC5_Counter_OC5_Dwell
                ldab    TCTL1_TimerControlReg1
                orab    #3
                stab    TCTL1_TimerControlReg1
                ldd     TOC5_Counter_OC5_Dwell
                subd    #$40
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_EFDF
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    AntiDwellTime_HB
                std     Temp5_t3
loc_EF80:
                ldaa    TCTL1_TimerControlReg1
                bita    #1
                beq     loc_EFA2
                ldaa    CalculatedSparkAdvance
                cmpa    #$28
                bcs     loc_EFDF
                ldd     TOC5_Counter_OC5_Dwell
                addd    AntiDwellTime_HB
                std     TOC5_Counter_OC5_Dwell
                ldd     #$FE08
                anda    TCTL1_TimerControlReg1
                staa    TCTL1_TimerControlReg1
                stab    TFLG1_TimerInterruptFlag1
loc_EFA2:
                ldaa    CalculatedSparkAdvance
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
loc_EFBD:
                ldd     Temp5_t3
                subd    TOC5_Counter_OC5_Dwell
                cpd     #$10
                bcs     loc_EFCF
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell
loc_EFCF:
                ldd     TOC5_Counter_OC5_Dwell
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_EFDF
                bclr    IPL1, %10
loc_EFDA:
                ldaa    #8
                staa    CFORC_TimerForceCompare
loc_EFDF:
                ldaa    SparkScatter
                adda    SparkScatterIncrement
                bvc     loc_F00F
                brclr   BitFlags68_t3, %100, loc_F00E
                ldab    DesiredNewAisPosition
                cmpb    CurrentAisPosition
                bne     loc_F00E
                ldab    byte_8660
                beq     loc_F00E
                tsta
                bmi     loc_F001
                ldaa    DesiredNewAisPosition
                sba
                bcc     loc_F00C
                clra
                bra     loc_F00C
loc_F001:
                ldaa    byte_876E
                addb    DesiredNewAisPosition
                bcs     loc_F00C
                cba
                bls     loc_F00C
                tba
loc_F00C:
                staa    DesiredNewAisPosition
loc_F00E:
                clra
loc_F00F:
                staa    SparkScatterIncrement
                rti
loc_F013:
                jmp     loc_F0CB
loc_F016:
                ldd     TIC1_Counter_IC1_CamSensor
                std     Counter_IC1_Temp
                ldaa    EngineRpm_HB
                cmpa    #$5E
                bcc     loc_F013
                brclr   IPL1, %10, loc_F013
                ldd     TIC1_Counter_IC1_CamSensor
                subd    L00F5_t3
                lsld
                lsld
                xgdy
                ldaa    #$30
                suba    CalculatedSparkAdvance
                bcc     loc_F037
                clra
loc_F037:
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
                brclr   IPL1, 1, loc_F013
                ldaa    PORTA_PortA
                bita    #%1000
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
                subd    #$40
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_F0CB
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     TCNT_Counter_FreeRunning16bit
                addd    AntiDwellTime_HB
                std     Temp5_t3
loc_F08D:
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
loc_F0A9:
                ldd     Temp5_t3
                subd    TOC5_Counter_OC5_Dwell
                cpd     #$10
                bcs     loc_F0BB
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell
loc_F0BB:
                ldd     TOC5_Counter_OC5_Dwell
                subd    TCNT_Counter_FreeRunning16bit
                bpl     loc_F0CB
                bclr    IPL1, %10
                ldaa    #8
                staa    CFORC_TimerForceCompare
loc_F0CB:
                ldaa    EngineRpm_HB
                cmpa    #$6D
                bcc     loc_F0E2
                cmpa    #$6A
                bcc     loc_F0D8
                bclr    IPL1, %100
loc_F0D8:
                jsr     sub_E3C7
                std     EngineRpm_HB
                jsr     sub_E43E
                bra     loc_F0E5
loc_F0E2:
                bset    IPL1, %100
loc_F0E5:
                clra
                brclr   BitFlags66_t3, %1000000, loc_F0EF
                ldaa    CounterUp_42
                inca
                beq     loc_F0F1
loc_F0EF:
                staa    CounterUp_42
loc_F0F1:
                ldaa    CounterUp_42
                cmpa    byte_81BB
                bcs     loc_F0FD
                bset    IPL1, %10000
                bra     loc_F100
loc_F0FD:
                bclr    IPL1, %10000
loc_F100:
                ldaa    CounterDn_ba_o2
                beq     loc_F107
                deca
                staa    CounterDn_ba_o2
loc_F107:
                ldaa    CounterDn_bb_o2
                beq     loc_F10E
                deca
                staa    CounterDn_bb_o2
loc_F10E:
                ldaa    CounterDn_bc_o2
                beq     loc_F115
                deca
                staa    CounterDn_bc_o2
loc_F115:
                ldaa    CounterDn_b9_o2
                beq     loc_F11C
                deca
                staa    CounterDn_b9_o2
loc_F11C:
                ldaa    CounterUp_b6_o2
                inca
                beq     loc_F123
                staa    CounterUp_b6_o2
loc_F123:
                clra
                brclr   IPL1, 1, loc_F12D
                ldaa    CounterUp_43
                inca
                beq     loc_F12F
loc_F12D:
                staa    CounterUp_43
loc_F12F:
                ldaa    CounterDn_b7_o2
                beq     loc_F136
                deca
                staa    CounterDn_b7_o2
loc_F136:
                ldaa    Counter_SomethingWithDistributor
                inca
                beq     loc_F13F
                staa    Counter_SomethingWithDistributor
loc_F13F:
                jmp     locret_F142
locret_F142:
                rti
loc_F143:
                brset   IPL1, 1, loc_F159
                ldaa    TCTL1_TimerControlReg1
                anda    #$FE
                staa    TCTL1_TimerControlReg1
                ldaa    #8
                staa    CFORC_TimerForceCompare
                bclr    IPL1, %10
                bra     loc_F185
loc_F159:
                bra     loc_F15B
loc_F15B:
                clra
                clrb
                bra     loc_F17A
                ldaa    PIA3_Buffer_t3
                anda    #$BF
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                ldd     TIC1_Counter_IC1_CamSensor
                subd    Counter_IC1_Temp
                std     DoubleTempC
                ldx     #DoubleTempC
                ldd     byte_828E
                jsr     ScaleXbyB_somethingelse
loc_F17A:
                addd    TIC1_Counter_IC1_CamSensor
                std     TOC4_Counter_OC4
                ldaa    #$10
                staa    TFLG1_TimerInterruptFlag1
loc_F185:
                ldaa    CylinderPointer
                inca
                brset   BitFlags27, %10000000, loc_F190
                cmpa    #6
                bra     loc_F192
loc_F190:
                cmpa    #4
loc_F192:
                bcs     loc_F195
                clra
loc_F195:
                staa    CylinderPointer
                brset   BitFlags27, %10000000, loc_F1BA
                brclr   BitFlags27, %1000000, loc_F1C3
                ldaa    CylinderPointer
                beq     loc_F1BA
                cmpa    #3
                beq     loc_F1BA
                cmpa    #2
                beq     loc_F1C3
                cmpa    #5
                beq     loc_F1C3
                ldaa    PIA3_Buffer_t3
                anda    #$FD
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
                bra     loc_F1C3
loc_F1BA:
                ldaa    PIA3_Buffer_t3
                oraa    #2
                staa    PIA3_Buffer_t3
                staa    PIA3_Buffer_2_t3
loc_F1C3:
                brset   IPL1, 1, loc_F1CA
                jmp     loc_F293
loc_F1CA:
                brset   BitFlags27, %10000000, loc_F1FF
                ldab    EngineRpm_HB
                cmpb    #$1F
                bcc     loc_F1D7
                jmp     loc_F293
loc_F1D7:
                ldaa    AdvanceTemporary
                brclr   BitFlags2d, %10000000, loc_F1E8
                cmpa    Ram_4D
                bcs     loc_F1E5
                ldaa    Ram_4D
                bra     loc_F1E8
loc_F1E5:
                bclr    BitFlags2d, %10000000
loc_F1E8:
                staa    CalculatedSparkAdvance
                cmpa    #$50
                bcc     loc_F1F1
                jmp     loc_F293
loc_F1F1:
                ldaa    #$F8
                suba    CalculatedSparkAdvance
                psha
                ldab    #$11
                mul
                adca    #0
                pulb
                aba
                bra     loc_F22C
loc_F1FF:
                ldab    EngineRpm_HB
                cmpb    #$1F
                bcs     loc_F21C
                ldaa    AdvanceTemporary
                brclr   BitFlags2d, %10000000, loc_F216
                cmpa    Ram_4D
                bcs     loc_F213
                ldaa    Ram_4D
                bra     loc_F216
loc_F213:
                bclr    BitFlags2d, %10000000
loc_F216:
                staa    CalculatedSparkAdvance
                cmpa    #$50
                bcc     loc_F21F
loc_F21C:
                jmp     loc_F293
loc_F21F:
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
loc_F22C:
                psha
                ldab    DistributorFallingEdgePulsewidth_HB
                mul
                std     Temp5_t3
                pula
                ldab    DistributorFallingEdgePulsewidth_LB
                mul
                adca    #0
                tab
                clra
                addd    Temp5_t3
                addd    TIC1_Counter_IC1_CamSensor
                subd    #$A
                std     Temp5_t3
                bset    IPL1, %10
                ldx     #TCTL1_TimerControlReg1
                subd    AntiDwellTime_HB
                std     DoubleTempB
                subd    TCNT_Counter_FreeRunning16bit
                bmi     loc_F265
                cpd     #$20
                bmi     loc_F265
                ldaa    PORTA_PortA
                bita    #%1000
                beq     loc_F27D
loc_F265:
                bset    0,x, %11
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     Temp5_t3
                std     TOC5_Counter_OC5_Dwell
                bclr    0,x, 1
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
                bra     loc_F293
loc_F27D:
                bclr    0,x, 1
                ldaa    #8
                staa    CFORC_TimerForceCompare
                ldd     DoubleTempB
                std     TOC5_Counter_OC5_Dwell
                bset    0,x, %11
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
loc_F293:
                ldaa    ADCTL_A2DControlReg
                bpl     loc_F293
                ldd     ADR3_A2DResults3
                staa    O2SensorVolts
                stab    LastTpsVolts
                cmpb    byte_89FB
                bcs     loc_F2AF
                cmpb    byte_89FC
                bcc     loc_F2AF
                brset   b5C_IPL1_t3, %1000000, loc_F2AF
                stab    TpsVolts
loc_F2AF:
                ldaa    ADR1_A2DResults1
                ldab    EngineRpm_HB
                cmpb    #$2F
                bcc     loc_F2C6
                cmpb    #$D
                bcs     loc_F2C6
                cmpa    byte_8A08
                bcc     loc_F2CA
                cmpa    byte_8A07
                bcs     loc_F2CA
loc_F2C6:
                brclr   b5C_IPL1_t3, %10001000, loc_F2CD
loc_F2CA:
                jsr     sub_D61E
loc_F2CD:
                jsr     sub_E3F8
                tab
                brclr   IPL1, %100, loc_F2DD
                addb    MapValue_t3
                rorb
                stab    MapValue
                bra     loc_F2E2
loc_F2DD:
                stab    MapValue_t3
                ldab    MapValue
loc_F2E2:
                ldaa    BaroPressure
                sba
                bcc     loc_F2E8
                clra
loc_F2E8:
                staa    MapVolts
                jsr     sub_D818
                brclr   IPL1, %1000000, loc_F336
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #%1000
                beq     loc_F2FB
                jsr     sub_F36D
loc_F2FB:
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #%10000
                beq     loc_F305
                jsr     sub_F363
loc_F305:
                jsr     sub_C39F
                jsr     sub_C3D3
                jsr     sub_C579
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #%1000
                beq     loc_F318
                jsr     sub_F36D
loc_F318:
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #%10000
                beq     loc_F322
                jsr     sub_F363
loc_F322:
                jsr     sub_C5BA
                brclr   IPL1, %100, loc_F336
                ldaa    TFLG1_TimerInterruptFlag1
                bita    #%10000
                beq     loc_F333
                jsr     sub_F363
loc_F333:
                jsr     loc_C633
loc_F336:
                clr     ATMOffset
                ldaa    DRBPointer1
                cmpa    #$A
                bne     locret_F345
                clr     DRBPointer1
                bclr    DRBSerialMode, %110000
locret_F345:
                rti
;;
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
nullsub_2:
                rts
;;
OC4I:
                bsr     sub_F363
                rti
;;
sub_F363:
                ldd     #TIC3_Counter_IC3_CrankSensor
                staa    TFLG1_TimerInterruptFlag1
                rts
;;
I4_I5:
                bsr     sub_F36D
                rti
;;
sub_F36D:
                ldaa    #8
                staa    TFLG1_TimerInterruptFlag1
                brclr   BitFlags_BF_t3, %10000000, locret_F3AF
                ldab    TimerOverflowsBetweenCamPulses
                bne     locret_F3AF
                brclr   IPL1, %00000001, locret_F3AF
                ldab    TCTL1_TimerControlReg1
                eorb    #1
                bitb    #1
                bne     loc_F38B
                brclr   IPL1, %10, locret_F3AF
loc_F38B:
                stab    TCTL1_TimerControlReg1
                lsrb
                bcs     loc_F3B0
                ldab    #1
                ldaa    CalculatedSparkAdvance
                cmpa    #$58
                bcc     loc_F39F
                incb
                cmpa    #$30
                bcc     loc_F39F
                incb
loc_F39F:
                ldaa    BitFlags_BF_t3
                anda    #7
                cba
                bcs     loc_F3BA
                ldd     AntiDwellTime_HB
loc_F3A9:
                addd    TOC5_Counter_OC5_Dwell
                std     TOC5_Counter_OC5_Dwell
locret_F3AF:
                rts
loc_F3B0:
                bclr    IPL1, %10
                ldd     DistributorFallingEdgePulsewidth_HB
                subd    AntiDwellTime_HB
                bra     loc_F3A9
loc_F3BA:
                ldab    TCTL1_TimerControlReg1
                orab    #3
                stab    TCTL1_TimerControlReg1
                rts
;;
IRQ:
                ldx     TCNT_Counter_FreeRunning16bit
                ldab    #$C
                abx
loc_F3C9:
                ldaa    SwitchPortAccessReg2
                eora    PIA_Ctrl_2
                lsra
                bcs     loc_F421
                cpx     TCNT_Counter_FreeRunning16bit
                bpl     loc_F3C9
                ldaa    #2
                ldab    SwitchPortAccessReg2
                lsrb
                bcc     loc_F3E6
                clra
                brset   BitFlags27, %10000000, loc_F3E6
                ldaa    #5
loc_F3E6:
                brclr   BitFlags_BF_t3, %10000000, loc_F3EE
                cmpa    CylinderPointer
                bne     loc_F41B
loc_F3EE:
                ldab    #$84
                stab    BitFlags_BF_t3
                brset   BitFlags2b, %1000000, loc_F3FC
                clr     KeyOnOrEngineRunningTime
                clr     Counter_MainLoop
loc_F3FC:
                bset    BitFlags2b, %11000000
                staa    CylinderPointer
                brclr   Ram_05, 1, loc_F40F
                ldab    UNe_64B9
                addb    #$20
                bcs     loc_F40F
                stab    UNe_64B9
loc_F40F:
                ldab    #1
                cmpa    #2
                beq     loc_F416
                clrb
loc_F416:
                stab    PIA_Ctrl_2
                bra     loc_F421
loc_F41B:
                bclr    BitFlags_BF_t3, %10000000
                bclr    BitFlags2b, %10000000
loc_F421:
                ldaa    #1
                staa    PIA_Ctrl_4
                rti
;;
 ORG $FF9B
Copyright:      db "1993 COPYRIGHT CHRYSLER CORP."
                db $3F, $3F, $3F, $3F, $3F, $3F
                db $80
                db $02
;;
 ORG $FFC0
RESERVFFC0:     db $3F
RESERVFFC1:     db $3F
RESERVFFC2:     db $3F
RESERVFFC3:     db $3F
RESERVFFC4:     db $3F
RESERVFFC5:     db $3F
RESERVFFC6:     db $3F
RESERVFFC7:     db $3F
RESERVFFC8:     db $3F
RESERVFFC9:     db $3F
RESERVFFCA:     db $3F
RESERVFFCB:     db $3F
RESERVFFCC:     db $3F
RESERVFFCD:     db $3F
RESERVFFCE:     db $3F
RESERVFFCF:     db $3F
RESERVFFD0:     db $3F
RESERVFFD1:     db $3F
RESERVFFD2:     db $3F
RESERVFFD3:     db $3F
RESERVFFD4:     db $3F
RESERVFFD5:     db $3F
                dw SCISS
                dw SPIE
                dw PAII
                dw PAII
                dw PAII
                dw I4_I5
                dw OC4I
                dw PAII
                dw PAII
                dw OC1I
                dw PAII
                dw IC2I
                dw IC1I
                dw PAII
                dw IRQ
                dw XIRQ
                dw SOFT
                dw OPC
                dw NOCOP
                dw CME
                dw __RESET
                
                