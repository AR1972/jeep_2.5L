#include defines.inc
 ORG $8000
#include data.inc
 ORG $9400

		; public XIRQ
XIRQ:					; DATA XREF: USER_VEC:FFF4o
		ldab	#1
		bra	loc_9416
; End of function XIRQ


; =============== S U B	R O U T	I N E =======================================


		; public NOCOP
NOCOP:					; DATA XREF: USER_VEC:FFFAo
		ldab	#2
		bra	loc_9416
; End of function NOCOP


; =============== S U B	R O U T	I N E =======================================


		; public OPC
OPC:					; DATA XREF: USER_VEC:FFF8o
		ldab	#4
		bra	loc_9416
; End of function OPC


; =============== S U B	R O U T	I N E =======================================


		; public SCISS
SCISS:					; DATA XREF: USER_VEC:FFD6o
		ldab	#$10
		bra	loc_9416
; End of function SCISS


; =============== S U B	R O U T	I N E =======================================


		; public SPIE
SPIE:					; DATA XREF: USER_VEC:FFD8o
		ldab	#$20
		bra	loc_9416
; End of function SPIE


; =============== S U B	R O U T	I N E =======================================


		; public SOFT
SOFT:					; DATA XREF: USER_VEC:FFF6o
		ldab	#$40

loc_9416:				; CODE XREF: XIRQ+2j NOCOP+2j	...
		sei
		orab	#$80
		stab	Temp0
		ldd	#$2A9
		staa	TMSK2_TimerInterruptMask2
		stab	OPTION_SysConfigOptionReg
		ldaa	#$F8
		staa	BPROT_BlockProtReg
		tsx
		ldd	7,x
		std	<Ram_01
		std	Temp1
		lds	#$64FF
		clr	MinimumTimerCountBeforeMainloopCanContinue
		clr	Ram_04
		bra	loc_94A2
; End of function SOFT


; =============== S U B	R O U T	I N E =======================================


		; public CME
CME:					; DATA XREF: USER_VEC:FFFCo
		sei
		lds	#$64FF
		ldd	#$2A9
		staa	TMSK2_TimerInterruptMask2
		stab	OPTION_SysConfigOptionReg
		ldaa	#$F8
		staa	BPROT_BlockProtReg
		clra
		clrb
		staa	Temp0
		std	Temp1
		ldx	#0

loc_945A:				; CODE XREF: CME+27j
		ldaa	0,x
		cmpa	#0
		bne	loc_9468
		inx
		cpx	#$20
		bcs	loc_945A
		bra	loc_94A2
; ---------------------------------------------------------------------------

loc_9468:				; CODE XREF: CME+21j
		ldd	<Counter_SpeedSensorInterrupt_HB
		tba
		comb
		std	<MinimumTimerCountBeforeMainloopCanContinue
		bra	loc_94A2
; End of function CME


; =============== S U B	R O U T	I N E =======================================


		; public __RESET
__RESET:				; CODE XREF: sub_E825+103J
					; DATA XREF: USER_VEC:off_FFFEo
		sei
		lds	#$64FF
		ldd	#$2A9
		staa	TMSK2_TimerInterruptMask2
		stab	OPTION_SysConfigOptionReg
		ldaa	#$F8
		staa	BPROT_BlockProtReg
		clra
		clrb
		staa	Temp0
		std	Temp1
		ldd	<Counter_SpeedSensorInterrupt_HB
		tba
		comb
		xgdy
		jsr	CountRamValuesFrom05to20
		cpd	<MinimumTimerCountBeforeMainloopCanContinue
		beq	loc_949C
		ldy	#Ram_00

loc_949C:				; CODE XREF: __RESET+26j
		sty	<MinimumTimerCountBeforeMainloopCanContinue
		bset	<Ram_05	$A

loc_94A2:				; CODE XREF: SOFT+27j CME+29j	...
		jsr	sub_E7D6
		ldaa	#$90
		tap
		ldab	#$F
		ldaa	TL_CONF01
		bita	#8
		beq	loc_94B3
		ldab	#6

loc_94B3:				; CODE XREF: __RESET+3Fj
		stab	HPRIO_HighPriorityInterruptMask
		clr	OC1M_OutputCompare1Mask
		clr	OC1D_OutputCompare1D
		ldd	#$FF
		staa	TMSK1_TimerInterruptMask1
		stab	TFLG1_TimerInterruptFlag1
		ldaa	#$1A
		staa	TCTL2_TimerControlReg2
		ldd	#$AA78
		staa	TCTL1_TimerControlReg1
		stab	CFORC_TimerForceCompare
		ldd	#$7520
		staa	PIA3_Buffer_2_t3
		staa	<PIA3_Buffer_t3
		stab	PORTD_PortD
		ldaa	#8
		staa	SwitchPortAccessReg1
		ldab	TL_IDENT1
		cmpb	#$11
		beq	loc_94F1
		ldab	#$8F
		stab	PIA_Ctrl_1
		bra	loc_94F6
; ---------------------------------------------------------------------------

loc_94F1:				; CODE XREF: __RESET+78j
		ldab	#$F
		stab	PIA_Ctrl_1

loc_94F6:				; CODE XREF: __RESET+7Fj
		ldab	PIA_Ctrl_1
		andb	#$F7
		stab	PIA_Ctrl_1
		jsr	OCToggleAndResetCopTimer
		jsr	OCToggleAndResetCopTimer
		ldd	#$3A55
		staa	DDRD_PortD_DataDirection
		ldaa	SPSR_SerialPeripheralStatus
		stab	SPCR_SerialPeripheralControl
		jsr	OCToggleAndResetCopTimer
		ldd	#$F870
		staa	PIA_Ctrl_5
		stab	PACTL_PulseAccumulatorControl
		clra
		staa	PPROG_EEPROMControlReg
		staa	PIA_Ctrl_2
		ldd	#8
		std	InjectorPulsewidth_HB_Cyl1
		std	InjectorPulsewidth_HB_Cyl2
		std	InjectorPulsewidth_HB_Cyl3
		std	InjectorPulsewidth_HB_Cyl4
		ldd	#$C22
		staa	SCCR2_SerialControlReg2
		stab	BAUD_SerialBaudRate
		ldd	SCSR_SerialStatus
		jsr	OCToggleAndResetCopTimer
		clr	SCCR1_SerialControlReg1
		ldx	#IPL1
		ldd	<MinimumTimerCountBeforeMainloopCanContinue
		coma
		cba
		beq	loc_957C
		ldab	#8
		ldaa	Temp0
		bpl	loc_9556
		ldab	#$80

loc_9556:				; CODE XREF: __RESET+E2j
		stab	<Ram_05
		anda	#$7F
		staa	<Ram_00
		ldd	Temp1
		std	<Ram_01
		ldaa	#$5C
		staa	<LowestSessionTpsVolts
		ldaa	#$80
		staa	<Timer_DacalCountdown
		staa	<Ram_0B
		staa	<ValueFromAdaptiveMemory
		ldaa	TL_TL_88E4
		staa	<Ram_0C
		ldd	#$40DF
		staa	<BitFlags36_t3
		stab	<CurrentAisPosition
		ldx	#Counter_SpeedSensorInterrupt_HB

loc_957C:				; CODE XREF: __RESET+DBj
		ldy	#$594

loc_9580:				; CODE XREF: __RESET+112j
		dey
		bne	loc_9580
		dex
		clrb

ClearRam20toFF:				; CODE XREF: __RESET+11Cj
		inx
		stab	0,x
		cpx	#$FF
		bcs	ClearRam20toFF
		ldaa	TL_CONF01
		staa	<BitFlags27
		ldx	#CountdownTimerFromKeyOn
		dex
		clrb

ClearRam6480to64c8:			; CODE XREF: __RESET+12Ej
		inx
		stab	0,x
		cpx	#$64C8
		bcs	ClearRam6480to64c8
		ldaa	#$E5
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		jsr	OCToggleAndResetCopTimer
		ldy	#$594

loc_95AE:				; CODE XREF: __RESET+140j
		dey
		bne	loc_95AE
		ldaa	#$14
		staa	ADCTL_A2DControlReg

loc_95B7:				; CODE XREF: __RESET+14Aj
		ldaa	ADCTL_A2DControlReg
		bpl	loc_95B7
		ldaa	ADR1_A2DResults1
		staa	CoolantVoltsTmp2
		ldaa	<PIA3_Buffer_t3
		anda	#$7F
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		jsr	OCToggleAndResetCopTimer
		ldy	#$476

loc_95D2:				; CODE XREF: __RESET+164j
		dey
		bne	loc_95D2
		ldaa	#$14
		staa	ADCTL_A2DControlReg

loc_95DB:				; CODE XREF: __RESET+16Ej
		ldaa	ADCTL_A2DControlReg
		bpl	loc_95DB
		ldaa	ADR1_A2DResults1
		staa	CoolantVoltsTmp1
		ldaa	CoolantVoltsTmp1
		ldab	CoolantVoltsTmp2
		mul
		std	Temp1
		ldab	CoolantVoltsTmp1
		subb	CoolantVoltsTmp2
		bls	loc_9613
		clra
		xgdx
		ldd	Temp1
		aslb
		adca	#0
		tab
		abx
		ldd	Temp1
		idiv
		xgdx
		tsta
		bne	loc_9613
		tba
		ldx	#TL_TempForScaleAmbientA2D
		jsr	Lookup4ByteTable
		bra	loc_9615
; ---------------------------------------------------------------------------

loc_9613:				; CODE XREF: __RESET+186j __RESET+198j
		ldaa	#$C1

loc_9615:				; CODE XREF: __RESET+1A1j
		staa	<AmbientAirTempVolts2
		jsr	bcf2_MM
		jsr	DetermineTargetBatteryVoltage
		ldaa	<PIA3_Buffer_t3
		oraa	#$10
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		jsr	OCToggleAndResetCopTimer
		ldy	#$594

loc_962D:				; CODE XREF: __RESET+1BFj
		dey
		bne	loc_962D
		ldaa	#$14
		staa	ADCTL_A2DControlReg

loc_9636:				; CODE XREF: __RESET+1C9j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_9636
		ldaa	ADR1_A2DResults1
		cmpa	#$40
		bcc	loc_964B
		ldaa	<PIA3_Buffer_t3
		anda	#$EF
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3

loc_964B:				; CODE XREF: __RESET+1D0j
		jsr	OCToggleAndResetCopTimer
		ldy	#$594

loc_9652:				; CODE XREF: __RESET+1E4j
		dey
		bne	loc_9652
		ldaa	#$14
		staa	ADCTL_A2DControlReg

loc_965B:				; CODE XREF: __RESET+1EEj
		ldaa	ADCTL_A2DControlReg
		bpl	loc_965B
		ldaa	ADR1_A2DResults1
		staa	<LastCoolantTempVolts

loc_9665:				; CODE XREF: __RESET+1F8j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_9665
		ldaa	ADR2_A2DResults2
		cmpa	#$40
		bcc	loc_967A
		ldaa	<PIA3_Buffer_t3
		anda	#$DF
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3

loc_967A:				; CODE XREF: __RESET+1FFj
		jsr	OCToggleAndResetCopTimer
		ldy	#$594

loc_9681:				; CODE XREF: __RESET+213j
		dey
		bne	loc_9681
		ldaa	#$14
		staa	ADCTL_A2DControlReg

loc_968A:				; CODE XREF: __RESET+21Dj
		ldaa	ADCTL_A2DControlReg
		bpl	loc_968A
		ldab	ADR2_A2DResults2
		stab	<LastChargeTempVolts
		ldaa	#$10
		staa	ADCTL_A2DControlReg
		jsr	OCToggleAndResetCopTimer

loc_969C:				; CODE XREF: __RESET+22Fj
		ldaa	ADCTL_A2DControlReg
		bpl	loc_969C
		jsr	ReadA2DBattVolts
		staa	<BatteryVolts
		ldab	ADR4_A2DResults4
		stab	<LastTpsVolts
		ldaa	ADR1_A2DResults1
		jsr	ConvertMAPVoltsToValue
		staa	<MapValue
		clrb
		std	<MapValue2
		staa	MapValue_t3
		brclr	<Ram_05	8 loc_96C8
		cmpa	#$80
		bcc	loc_96C3
		ldaa	#$80

loc_96C3:				; CODE XREF: __RESET+24Fj
		staa	<BaroPressure
		bclr	<Ram_05	8

loc_96C8:				; CODE XREF: __RESET+249j
		ldaa	ADR1_A2DResults1
		staa	<MapVolts_X
		staa	<MapValue3
		brclr	<Ram_05	2 loc_96F9
		brclr	<Ram_05	4 loc_96F9
		cmpa	TL_MapSensorMiddleLimit
		bcc	loc_96F9
		ldab	#2

loc_96DE:				; CODE XREF: __RESET+281j
		ldaa	#$10
		staa	ADCTL_A2DControlReg

loc_96E3:				; CODE XREF: __RESET+276j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_96E3
		ldaa	ADR1_A2DResults1
		cmpa	TL_MapSensorMiddleLimit
		bcc	loc_96F9
		decb
		bne	loc_96DE
		bset	<b5C_IPL1_t3 #b3_D5_MapBadSignal
		bset	<BitFlags2e #b7_2E_MapMaybe

loc_96F9:				; CODE XREF: __RESET+25Fj __RESET+263j ...
		bclr	<Ram_05	2
		ldaa	<Ram_05
		anda	#$C0
		cmpa	#$80
		bne	loc_971A
		ldd	#$AFF
		std	<DRBPointer1
		ldaa	#$F1
		staa	LastCamFallingEdgeTime2
		ldab	#$FF
		ldaa	<BitFlags27
		bita	#$C0
		beq	loc_9732
		ldab	#$FB
		bra	loc_9732
; ---------------------------------------------------------------------------

loc_971A:				; CODE XREF: __RESET+292j
		ldaa	<Ram_05
		adda	#$40
		staa	<Ram_05
		ldaa	PIA_Ctrl_1
		oraa	#4
		staa	PIA_Ctrl_1
		ldab	#$EF
		ldaa	<BitFlags27
		bita	#$C0
		beq	loc_9732
		ldab	#$EB

loc_9732:				; CODE XREF: __RESET+2A4j __RESET+2A8j ...
		stab	<PIA2_Buffer_t3
		ldaa	<PIA3_Buffer_t3
		anda	#$FB
		staa	PIA3_Buffer_2_t3
		staa	<PIA3_Buffer_t3
		cmpb	SPSR_SerialPeripheralStatus
		stab	SPDR_SerialPeripheralDataIO
		mul
		mul
		nop
		ldaa	<PIA3_Buffer_t3
		oraa	#4
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		ldab	SPCR_SerialPeripheralControl
		andb	#$FC
		stab	SPCR_SerialPeripheralControl
		jsr	OCToggleAndResetCopTimer
		ldx	#$535

loc_975D:				; CODE XREF: __RESET+2F5j
		ldaa	SwitchPortAccessReg1
		bita	#$10
		bne	loc_9767
		dex
		bne	loc_975D

loc_9767:				; CODE XREF: __RESET+2F2j
		jsr	OCToggleAndResetCopTimer
		ldaa	PIA_Ctrl_1
		anda	#$FB
		staa	PIA_Ctrl_1
		ldaa	Timer_DelayBeforeUpdating_MINTHR
		oraa	#3
		staa	Timer_DelayBeforeUpdating_MINTHR
		nop
		nop
		nop
		bset	<BitFlags24 $10
		bset	<ACClutchToggleVar $FF
		bset	<BitFlags66_t3 $10
		bset	<BitFlags68_t3 $44
		bset	<BitFlags36_t3 $20
		bclr	<BitFlags36_t3 $10
		bset	<CruiseStatus_1	$A0
		ldaa	#$80
		staa	<Counter_Cruise_1
		ldd	#$FFFF
		std	<DistributorFallingEdgePulsewidth_HB
		std	<Counter_TimerPastHalfwayBetweenCamPulses
		std	<Counter_TimerRegHalfOverflowBetweenSpeedoPulses
		std	<SpeedoSensorPulsewidth_HB
		staa	<Ram_4C
		ldaa	<MapValue
		clrb
		std	<MapValueTemp1
		std	<MapValueTemp2
		std	<MapValueTemp3
		ldaa	<LastTpsVolts
		std	<TPSVoltsTemp_A
		std	<TPSVoltsTemp_B
		brset	<Ram_05	1 loc_97C1
		bset	<Ram_05	1
		ldaa	byte_842A
		beq	loc_97C1
		bset	<Ram_EC	$A0

loc_97C1:				; CODE XREF: __RESET+342j __RESET+34Cj
		ldx	#$B616
		ldaa	0,x
		cmpa	#$4A
		bne	loc_97D2
		coma
		cmpa	1,x
		bne	loc_97D2
		bset	<BitFlags2D 4

loc_97D2:				; CODE XREF: __RESET+358j __RESET+35Dj
		ldx	#$B6E1
		ldaa	0,x
		cmpa	#$4A
		bne	loc_97E3
		coma
		cmpa	1,x
		bne	loc_97E3
		bset	<BitFlags21 2

loc_97E3:				; CODE XREF: __RESET+369j __RESET+36Ej
		ldx	#$B6E3
		ldaa	0,x
		cmpa	#$4A
		bne	loc_97F4
		coma
		cmpa	1,x
		bne	loc_97F4
		bset	<BitFlags29 8

loc_97F4:				; CODE XREF: __RESET+37Aj __RESET+37Fj
		ldaa	<LastCoolantTempVolts
		ldx	#TL_TempForHotScaleA2D
		brclr	<PIA3_Buffer_t3	$10 FilterAndStoreCoolantTemp
		ldx	#TL_TempForColdScaleFromA2D

FilterAndStoreCoolantTemp:		; CODE XREF: __RESET+389j
		jsr	Lookup4ByteTable
		staa	<CoolantTemp
		ldaa	<LastCoolantTempVolts
		cmpa	TL_CoolantTempOutOfRangeHigh
		bcc	UseDefaultCoolantTemp
		cmpa	TL_CoolantTempOutOfRangeLow
		bcs	UseDefaultCoolantTemp
		ldaa	<CoolantTemp
		bra	SubstituteCoolantForChargeTemp
; ---------------------------------------------------------------------------

UseDefaultCoolantTemp:			; CODE XREF: __RESET+39Aj __RESET+39Fj
		ldaa	TL_DefaultCoolantTempRaw

SubstituteCoolantForChargeTemp:		; CODE XREF: __RESET+3A3j
		staa	<CoolantTemp
		ldx	#TL_ScaleCoolantTemp
		jsr	Lookup4ByteTable
		staa	<CoolantTemp_fromTable_Scaled
		staa	<PreviousCoolantTemp_fromTable_Scaled
		ldaa	<LastChargeTempVolts
		ldx	#TL_TempForHotScaleA2D
		brclr	<PIA3_Buffer_t3	#b5_CF_ChargeTemp FilterAndStoreChargeTemp
		ldx	#TL_TempForColdScaleFromA2D

FilterAndStoreChargeTemp:		; CODE XREF: __RESET+3B9j
		jsr	Lookup4ByteTable
		staa	<ChargeTempVolts
		ldaa	<LastChargeTempVolts
		cmpa	TL_ChargeTempOutOfRangeHigh
		bcc	UseDefaultChargeTemp
		cmpa	TL_ChargeTempOutOfRangeLow
		bcs	UseDefaultChargeTemp
		ldaa	<ChargeTempVolts
		bra	StoreChargeTempValue2
; ---------------------------------------------------------------------------

UseDefaultChargeTemp:			; CODE XREF: __RESET+3CAj __RESET+3CFj
		ldaa	TL_DefaultChargeTemp_Limpin

StoreChargeTempValue2:			; CODE XREF: __RESET+3D3j
		staa	<ChargeTempVolts
		ldx	#TL_ScaleChargeTemp
		jsr	Lookup4ByteTable
		staa	<IntakeTemp_fromTable_Scaled
		ldaa	<LastTpsVolts
		staa	<TpsVolts
		ldab	<LowestSessionTpsVolts
		addb	TL_Amount_MINTHR_IsIncreasedAtKeyOnOnly
		cmpb	TL_ValueOf_MINTHR_WhenBatteryDisconnected
		bcs	loc_9869
		adda	#6
		ldab	TL_ValueOf_MINTHR_WhenBatteryDisconnected
		cba
		bcc	loc_9869
		tab

loc_9869:				; CODE XREF: __RESET+3EEj __RESET+3F6j
		stab	<LowestSessionTpsVolts
		ldaa	<CoolantTemp
		cmpa	TL_TstatDiagnosticsMinTempToArmDiagnosticsAtStartup
		bcs	loc_9877
		cmpa	TL_TstatDiagnosticsMaxTempToArmDiagnosticsAtStartup
		bcs	CalculateVariousFactors3

loc_9877:				; CODE XREF: __RESET+400j
		bset	<BitFlags6d_t3 2

CalculateVariousFactors3:		; CODE XREF: __RESET+405j
		jsr	CalculateVariousFactors2
		jsr	calc_fuel_MM
		ldd	TCNT_Counter_FreeRunning16bit
		addd	#$3E8
		std	TOC1_Counter_OC1
		jsr	sub_ED8B
		ldaa	<PIA3_Buffer_t3
		oraa	#1
		staa	PIA3_Buffer_2_t3
		anda	#$FE
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		ldx	#gb_AISTEP_BitPatternForAisControl
		ldab	<BitFlags_36_t3
		abx
		ldab	0,x
		tba
		comb
		aslb
		aslb
		aslb
		aslb
		anda	#$F
		aba
		ldx	#PORTD_PortD
		bclr	0,x %100000
		cmpa	SPSR_SerialPeripheralStatus
		staa	SPDR_SerialPeripheralDataIO
		ldaa	<PIA3_Buffer_t3
		oraa	#1
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		mul
		bset	0,x %100000
		ldaa	#$BF
		ldab	TL_ConfigurationFlags2
		bitb	#$20
		beq	loc_98D6
		ldab	TL_CONF01
		bitb	#1
		beq	loc_98D6
		anda	#$DF

loc_98D6:				; CODE XREF: __RESET+45Bj __RESET+462j
		staa	<PIA1_Buffer_t3
		ldaa	SwitchPortAccessReg1
		oraa	#1
		staa	SwitchPortAccessReg1
		ldx	#$238

loc_98E3:				; CODE XREF: __RESET+474j
		dex
		bne	loc_98E3
		jsr	UpdatePIA1AndCheckOutputs2_MM
		cli
		ldd	TCNT_Counter_FreeRunning16bit
		std	MinimumTimerCountBeforeMainloopCanContinue2
		bra	MainProgramLoop
; ---------------------------------------------------------------------------
		fdb ReadA2DCoolantChargeTempSensors
		fdb L99B6
		fdb MainSubLoop
		fdb ReadA2DNotSureWhat_X
		fdb MainSubLoop
		fdb ReadA2DNotSureWhat_Y
		fdb L9A07
		fdb MainSubLoop
; ---------------------------------------------------------------------------

MainProgramLoop:			; CODE XREF: __RESET+480j __RESET+6BFJ
		jsr	ResetCopTimer2
		ldaa	TL_CONF01
		staa	<BitFlags27
		inc	Ram_FE
		sei
		ldd	TCNT_Counter_FreeRunning16bit
		std	Temp0
		inc	Counter_MainLoop
		bne	loc_9926
		bclr	<Ram_05,	%11000000
		bset	<BitFlags6a_t3, %100
		ldaa	<KeyOnOrEngineRunningTime
		inca
		beq	loc_9926
		staa	<KeyOnOrEngineRunningTime

loc_9926:				; CODE XREF: __RESET+4A7j __RESET+4B2j
		ldaa	#$10
		staa	ADCTL_A2DControlReg
		ldd	Temp0
		ldx	#Counter_TimerPastHalfwayBetweenCamPulses
		ldy	#Temp5
		jsr	DetermineNumberOfOverflowsBetweenSensorPulses_MM
		cmpa	#$10
		bcs	loc_995A
		brset	<BitFlags2e $10	loc_995D
		bset	<BitFlags2e $10
		ldab	#$AA
		stab	TCTL1_TimerControlReg1
		ldab	#$78
		stab	CFORC_TimerForceCompare
		ldaa	UNe_64B9
		anda	#$E0
		staa	UNe_64B9
		bclr	<BitFlags2b, %11000000
		bra	loc_995D
; ---------------------------------------------------------------------------

loc_995A:				; CODE XREF: __RESET+4CAj
		bclr	<BitFlags2e, %10000

loc_995D:				; CODE XREF: __RESET+4CCj __RESET+4E8j ...
		ldaa	ADCTL_A2DControlReg
		bpl	loc_995D
		ldaa	<Counter_MainLoop
		lsra
		bcs	loc_996F
		lsra
		bcs	loc_996F
		jsr	ReadA2DBattVolts
		staa	<BatteryVolts

loc_996F:				; CODE XREF: __RESET+4F5j __RESET+4F8j
		ldd	ADR3_A2DResults3
		staa	<O2SensorVolts
		stab	<LastTpsVolts
		ldaa	ADR1_A2DResults1
		cli
		jsr	sub_D7EB
		ldaa	#$14
		sei
		staa	ADCTL_A2DControlReg
		ldd	TCNT_Counter_FreeRunning16bit
		lsld
		ldx	#Counter_TimerRegHalfOverflowBetweenSpeedoPulses
		ldy	#Temp5
		jsr	DetermineNumberOfOverflowsBetweenSensorPulses_MM

loc_9991:				; CODE XREF: __RESET+524j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_9991
		ldx	#$98F2
		ldab	<Ram_FE
		bitb	#7
		beq	ReadA2DCoolantChargeTempSensors
		orab	#$80
		cmpb	#$F8
		bcs	MainSubLoop
		andb	#7
		aslb
		abx
		ldx	0,x
		jmp	0,x
; ---------------------------------------------------------------------------

ReadA2DCoolantChargeTempSensors:	; CODE XREF: __RESET+52Dj
					; DATA XREF: __RESET+482o
		ldd	ADR1_A2DResults1
		staa	<LastCoolantTempVolts
		stab	<LastChargeTempVolts
		bra	MainSubLoop
; ---------------------------------------------------------------------------

L99B6:					; DATA XREF: __RESET+484o
		ldaa	<PIA3_Buffer_t3
		anda	#$7F
		brclr	<PIA3_Buffer_t3	#b4_CF_CoolantTemp loc_99C3
		bset	<BitFlags23 #b3_23_bt3
		bra	loc_99C6
; ---------------------------------------------------------------------------

loc_99C3:				; CODE XREF: __RESET+54Aj
		bclr	<BitFlags23 #b3_23_bt3

loc_99C6:				; CODE XREF: __RESET+551j
		anda	#$EF
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		bra	MainSubLoop
; ---------------------------------------------------------------------------

ReadA2DNotSureWhat_X:			; DATA XREF: __RESET+488o
		ldaa	ADR1_A2DResults1
		cli
		cmpa	CoolantVoltsTmp1
		bne	loc_99DD
		bset	<BitFlags23 #b5_23_bt5
		bra	loc_99E0
; ---------------------------------------------------------------------------

loc_99DD:				; CODE XREF: __RESET+566j
		bclr	<BitFlags23 #b5_23_bt5

loc_99E0:				; CODE XREF: __RESET+56Bj
		staa	CoolantVoltsTmp1
		ldaa	<PIA3_Buffer_t3
		oraa	#$80
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		bra	MainSubLoop
; ---------------------------------------------------------------------------

ReadA2DNotSureWhat_Y:			; DATA XREF: __RESET+48Co
		ldaa	ADR1_A2DResults1
		cli
		staa	CoolantVoltsTmp2
		brclr	<BitFlags23 #b5_23_bt5 MainSubLoop
		ldab	<BitFlags66_t3
		bitb	#3
		bne	MainSubLoop
		jsr	sub_BC57
		jsr	DetermineTargetBatteryVoltage
		bra	MainSubLoop
; ---------------------------------------------------------------------------

L9A07:					; DATA XREF: __RESET+48Eo
		ldaa	<PIA3_Buffer_t3
		anda	#$7F
		brclr	<BitFlags23 #b3_23_bt3 loc_9A13
		oraa	#$10
		bra	loc_9A15
; ---------------------------------------------------------------------------

loc_9A13:				; CODE XREF: __RESET+59Bj
		anda	#$EF

loc_9A15:				; CODE XREF: __RESET+5A1j
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3

MainSubLoop:				; CODE XREF: __RESET+533j __RESET+544j ...
		ldab	#$10
		stab	ADCTL_A2DControlReg
		cli
		jsr	sub_BA1C
		jsr	sub_BC36
		jsr	sub_BBAA
		jsr	sub_E721
		jsr	sub_B914
		jsr	sub_AE79
		jsr	sub_A802
		jsr	sub_BBED
		jsr	sub_BF92
		jsr	sub_B88A
		jsr	sub_B800
		jsr	CalculateVariousFactors2
		jsr	calc_fuel_MM
		jsr	sub_C147
		jsr	sub_BC01
		jsr	sub_9C2A
		jsr	sub_9CC9
		jsr	sub_A327
		jsr	sub_C6B5
		jsr	sub_A65D
		jsr	sub_A7E2
		jsr	sub_B9BA
		jsr	sub_C6ED
		jsr	sub_B9F1
		jsr	sub_9FED
		jsr	sub_E191
		ldaa	<Counter_MainLoop
		bne	loc_9A78
		jsr	sub_EDC9
		jsr	sub_D733

loc_9A78:				; CODE XREF: __RESET+600j
		ldaa	<Counter_MainLoop
		lsra
		bcc	loc_9A99
		lsra
		bcc	loc_9A8E
		jsr	sub_B976
		jsr	sub_D978
		jsr	sub_C2F8
		jsr	bcf2_MM
		bra	loc_9AB1
; ---------------------------------------------------------------------------

loc_9A8E:				; CODE XREF: __RESET+60Ej
		jsr	sub_A283
		jsr	sub_A2A8
		jsr	sub_D6E6
		bra	loc_9AB1
; ---------------------------------------------------------------------------

loc_9A99:				; CODE XREF: __RESET+60Bj
		jsr	sub_9BBE
		jsr	sub_9B32
		jsr	EmissionMaintenanceReminder2_MM
		jsr	sub_A18C
		jsr	sub_A2BB
		jsr	sub_DB43
		jsr	sub_DBFB
		jsr	sub_DCB0

loc_9AB1:				; CODE XREF: __RESET+61Cj __RESET+627j
		jsr	sub_9D4C
		jsr	sub_BD34
		jsr	sub_C04E
		jsr	sub_C184
		jsr	sub_C1F1
		jsr	sub_C2E6
		jsr	sub_D69A
		ldaa	<EngineRpm_HB
		cmpa	#$7D
		bcc	loc_9AE7
		jsr	sub_D682
		jsr	sub_DAD9
		jsr	sub_D93C
		jsr	sub_DD3A
		jsr	sub_D842
		jsr	sub_DB01
		jsr	sub_D88B
		jsr	VerifyOperationOfFuelInjectorDrivers_MM
		jsr	sub_DA31

loc_9AE7:				; CODE XREF: __RESET+65Aj
		jsr	sub_9EDC
		jsr	sub_CA29
		jsr	DRBIIOutput
		jsr	ActuatorTestMode_MM
		jsr	UpdatePIA1AndCheckOutputs2_MM
		jsr	sub_D3E1
		jsr	sub_BF3E
		jsr	sub_D75B
		brset	<BitFlags6a_t3 $40 loc_9B19
		sei
		ldaa	CountdownTimerFromKeyOn
		bne	loc_9B19
		ldd	<MinimumTimerCountBeforeMainloopCanContinue
		cli
		coma
		cba
		beq	loc_9B19
		jsr	ErrorCodeResetEeprom
		ldd	<Counter_SpeedSensorInterrupt_HB
		tba
		comb
		std	<MinimumTimerCountBeforeMainloopCanContinue

loc_9B19:				; CODE XREF: __RESET+68Fj __RESET+697j ...
		cli
		jsr	sub_E825

loc_9B1D:				; CODE XREF: __RESET+6B7j
		ldd	TCNT_Counter_FreeRunning16bit
		subd	MinimumTimerCountBeforeMainloopCanContinue2
		cpd	#$ABE
		bcs	loc_9B1D
		ldd	TCNT_Counter_FreeRunning16bit
		std	MinimumTimerCountBeforeMainloopCanContinue2
		jmp	MainProgramLoop
; End of function __RESET


; =============== S U B	R O U T	I N E =======================================


sub_9B32:				; CODE XREF: __RESET+62CP
		ldab	byte_8845
		ldaa	<PIA2_Buffer_t3
		bita	#1
		beq	loc_9B41
		subb	#3
		bcc	loc_9B41
		ldab	#0

loc_9B41:				; CODE XREF: sub_9B32+7j sub_9B32+Bj
		cmpb	<TpsVolts_Minus_LowestSessionTpsVolts
		bcc	loc_9B5B
		ldab	UNe_64AD
		cmpb	byte_8846
		bcc	loc_9B5E
		ldaa	<Counter_MainLoop
		bita	#7
		bne	loc_9B59
		incb
		beq	loc_9B59
		stab	UNe_64AD

loc_9B59:				; CODE XREF: sub_9B32+1Fj sub_9B32+22j
		bra	loc_9BAE
; ---------------------------------------------------------------------------

loc_9B5B:				; CODE XREF: sub_9B32+11j
		clr	UNe_64AD

loc_9B5E:				; CODE XREF: sub_9B32+19j
		brclr	<IPL1 $40 loc_9BAE
		ldab	<KeyOnOrEngineRunningTime
		cmpb	byte_884C
		bcs	loc_9BAE
		brclr	<BitFlags2D 4 loc_9B7D
		ldaa	<EngineRpm_HB
		cmpa	#$20
		bcc	loc_9BAE
		brset	<StartupSwitchMirror1 $80 loc_9BAE
		brclr	<StartupSwitchMirror1 $40 loc_9BAE
		bra	loc_9BB5
; ---------------------------------------------------------------------------

loc_9B7D:				; CODE XREF: sub_9B32+37j
		brset	<BitFlags68_t3 8 loc_9BAE
		ldab	<CoolantTemp
		cmpb	byte_8847
		bhi	loc_9BAE
		ldx	<EngineRpm_HB
		cpx	word_8848
		bcc	loc_9BAE
		cpx	word_884A
		bcc	loc_9BBC
		cpx	word_8842
		bcc	loc_9B9F
		ldab	byte_8844
		stab	STe_64AE

loc_9B9F:				; CODE XREF: sub_9B32+65j
		ldab	STe_64AE
		beq	loc_9BB5
		ldaa	<Counter_MainLoop
		bita	#7
		bne	loc_9BAE
		decb
		stab	STe_64AE

loc_9BAE:				; CODE XREF: sub_9B32:loc_9B59j
					; sub_9B32:loc_9B5Ej ...
		sei
		ldaa	<PIA2_Buffer_t3
		oraa	#1
		bra	loc_9BBA
; ---------------------------------------------------------------------------

loc_9BB5:				; CODE XREF: sub_9B32+49j sub_9B32+70j
		sei
		ldaa	<PIA2_Buffer_t3
		anda	#$FE

loc_9BBA:				; CODE XREF: sub_9B32+81j
		staa	<PIA2_Buffer_t3

loc_9BBC:				; CODE XREF: sub_9B32+60j
		cli
		rts
; End of function sub_9B32


; =============== S U B	R O U T	I N E =======================================


sub_9BBE:				; CODE XREF: __RESET:loc_9A99P
		brset	<PIA2_Buffer_t3	1 loc_9BDB
		brclr	<IPL1 $40 loc_9BDB
		brclr	<BitFlags2D 4 loc_9BDB
		ldaa	Counter_ACControl1
		inca
		beq	loc_9BD8
		staa	Counter_ACControl1
		cmpa	byte_884D
		bcs	loc_9BDB

loc_9BD8:				; CODE XREF: sub_9BBE+10j
		bset	<BitFlags2D 2

loc_9BDB:				; CODE XREF: sub_9BBEj	sub_9BBE+4j ...
		ldab	<ACClutchToggleVar
		ldaa	<BitFlags68_t3
		lsra
		eora	<BitFlags68_t3
		bita	#$20
		beq	loc_9C14
		brclr	<BitFlags68_t3 $20 loc_9BFF
		cmpb	#$30
		bcs	loc_9BF4
		bclr	<ACClutchToggleVar 7
		bset	<BitFlags68_t3 $40

loc_9BF4:				; CODE XREF: sub_9BBE+2Ej sub_9BBE+4Ej ...
		ldaa	<Counter_MainLoop
		bita	#$1F
		bne	locret_9C29
		addb	#8
		bcc	loc_9C27
		rts
; ---------------------------------------------------------------------------

loc_9BFF:				; CODE XREF: sub_9BBE+28j
		brclr	<ACClutchToggleVar 7 loc_9C0A
		tba
		anda	#7
		cmpa	#5
		bls	loc_9C11

loc_9C0A:				; CODE XREF: sub_9BBE:loc_9BFFj
		cmpb	#$B8
		bcs	loc_9BF4
		bclr	<BitFlags68_t3 $40

loc_9C11:				; CODE XREF: sub_9BBE+4Aj
		clrb
		bra	loc_9C27
; ---------------------------------------------------------------------------

loc_9C14:				; CODE XREF: sub_9BBE+26j
		brset	<ACClutchToggleVar 7 loc_9C1B
		incb
		stab	<ACClutchToggleVar

loc_9C1B:				; CODE XREF: sub_9BBE:loc_9C14j
		brset	<BitFlags68_t3 $40 loc_9BF4
		cmpb	#$60
		bcs	loc_9BF4
		andb	#7
		orab	#$60

loc_9C27:				; CODE XREF: sub_9BBE+3Ej sub_9BBE+54j
		stab	<ACClutchToggleVar

locret_9C29:				; CODE XREF: sub_9BBE+3Aj
		rts
; End of function sub_9BBE


; =============== S U B	R O U T	I N E =======================================


sub_9C2A:				; CODE XREF: __RESET+5DDP
		ldaa	<DRBPointer1
		cmpa	#$A
		bne	loc_9C34
		bset	<PIA2_Buffer_t3	$10
		rts
; ---------------------------------------------------------------------------

loc_9C34:				; CODE XREF: sub_9C2A+4j
		cmpa	#$18
		bne	loc_9C81
		ldaa	<DRBSerialMode
		bita	#$30
		bne	loc_9C81
		ldaa	<TimerOverflowsBetweenCamPulses
		cmpa	#$50
		bls	loc_9C73
		ldaa	<DRBPointer2
		tab
		anda	#$F
		pshb
		lsrb
		lsrb
		lsrb
		lsrb
		comb
		andb	#$F
		cba
		pulb
		bne	loc_9C73
		bset	<BitFlags2D $10
		tst	Counter_MainLoop
		bne	loc_9C67
		deca
		beq	loc_9C73
		andb	#$F0
		addb	#$10
		aba
		staa	<DRBPointer2

loc_9C67:				; CODE XREF: sub_9C2A+31j
		ldaa	#$E1
		jsr	SerialOutput1a
		sei
		ldaa	<PIA2_Buffer_t3
		anda	#$EF
		bra	loc_9CB8
; ---------------------------------------------------------------------------

loc_9C73:				; CODE XREF: sub_9C2A+18j sub_9C2A+29j ...
		clra
		staa	<DRBPointer1
		staa	<ATMOffset
		bclr	<BitFlags2D $10
		bclr	<DRBSerialMode $30
		jsr	SerialOutput1a

loc_9C81:				; CODE XREF: sub_9C2A+Cj sub_9C2A+12j
		ldx	#$5B
		ldaa	<CoolantTemp
		cmpa	#$8F
		bcc	loc_9C8D
		ldx	#$5B

loc_9C8D:				; CODE XREF: sub_9C2A+5Ej
		ldab	#4
		ldaa	<BatteryVolts
		cmpa	#$B2
		brset	<BitFlags23 4 loc_9CA2
		bcc	loc_9CA6
		cpx	#$5B
		bne	loc_9CA6
		ldab	#$B
		bra	loc_9CA6
; ---------------------------------------------------------------------------

loc_9CA2:				; CODE XREF: sub_9C2A+69j
		bcs	loc_9CA6
		ldab	#3

loc_9CA6:				; CODE XREF: sub_9C2A+6Dj sub_9C2A+72j ...
		sei
		ldaa	<PIA2_Buffer_t3
		anda	#$EF
		cmpb	<Counter_TimerPastHalfwayBetweenCamPulses
		bhi	loc_9CB8
		cpx	<KeyOnOrEngineRunningTime
		bhi	loc_9CB8
		oraa	#$10
		bclr	<Ram_80	$FF

loc_9CB8:				; CODE XREF: sub_9C2A+47j sub_9C2A+83j ...
		staa	<PIA2_Buffer_t3
		cli
		brclr	<IPL1 $40 locret_9CC8
		ldab	<KeyOnOrEngineRunningTime
		cmpb	#4
		bcs	locret_9CC8
		bset	<BitFlags23 4

locret_9CC8:				; CODE XREF: sub_9C2A+91j sub_9C2A+99j
		rts
; End of function sub_9C2A


; =============== S U B	R O U T	I N E =======================================


sub_9CC9:				; CODE XREF: __RESET+5E0P
		brclr	<IPL1 $40 loc_9D3F
		ldaa	TL_ConfigurationFlags2
		bita	#2
		beq	locret_9D4B
		ldaa	<InjectorPulsewidth_HB
		ldab	<EngineRpm_HB
		mul
		std	Temp0
		ldaa	<BatteryVolts
		ldab	byte_8863
		mul
		subd	word_885F
		bcc	loc_9CEA
		ldd	#0

loc_9CEA:				; CODE XREF: sub_9CC9+1Cj
		brclr	<BitFlags27 8 loc_9CF4
		brclr	<PIA1_Buffer_t3	$80 loc_9D32
		bra	loc_9D00
; ---------------------------------------------------------------------------

loc_9CF4:				; CODE XREF: sub_9CC9:loc_9CEAj
		brclr	<PIA2_Buffer_t3	8 loc_9D32
		subd	word_8861
		bcc	loc_9D00
		ldd	#0

loc_9D00:				; CODE XREF: sub_9CC9+29j sub_9CC9+32j
		cpd	Temp0
		bls	locret_9D4B
		brset	<BitFlags2D $40	loc_9D16
		ldaa	<BatteryVolts
		cmpa	byte_8864
		bls	locret_9D4B
		bset	<BitFlags2D $40
		bra	loc_9D24
; ---------------------------------------------------------------------------

loc_9D16:				; CODE XREF: sub_9CC9+3Dj
		ldaa	<BatteryVolts
		ldab	byte_8864
		addb	#3
		bcc	loc_9D21
		ldab	#$FF

loc_9D21:				; CODE XREF: sub_9CC9+54j
		cba
		bls	locret_9D4B

loc_9D24:				; CODE XREF: sub_9CC9+4Bj
		brclr	<BitFlags27 8 loc_9D2D
		bclr	<PIA1_Buffer_t3	$80
		bra	locret_9D4B
; ---------------------------------------------------------------------------

loc_9D2D:				; CODE XREF: sub_9CC9:loc_9D24j
		bclr	<PIA2_Buffer_t3	8
		bra	locret_9D4B
; ---------------------------------------------------------------------------

loc_9D32:				; CODE XREF: sub_9CC9+25j
					; sub_9CC9:loc_9CF4j
		cpd	Temp0
		bls	loc_9D3F
		ldaa	<BatteryVolts
		cmpa	byte_8864
		bhi	locret_9D4B

loc_9D3F:				; CODE XREF: sub_9CC9j	sub_9CC9+6Dj
		brclr	<BitFlags27 8 loc_9D48
		bset	<PIA1_Buffer_t3	$80
		bra	locret_9D4B
; ---------------------------------------------------------------------------

loc_9D48:				; CODE XREF: sub_9CC9:loc_9D3Fj
		bset	<PIA2_Buffer_t3	8

locret_9D4B:				; CODE XREF: sub_9CC9+9j sub_9CC9+3Bj	...
		rts
; End of function sub_9CC9


; =============== S U B	R O U T	I N E =======================================


sub_9D4C:				; CODE XREF: __RESET:loc_9AB1P
		ldaa	byte_8A3B
		bita	#8
		bne	loc_9D56
		jmp	loc_9E32
; ---------------------------------------------------------------------------

loc_9D56:				; CODE XREF: sub_9D4C+5j
		brset	<IPL1 $40 loc_9D66
		ldaa	<CoolantTemp
		cmpa	byte_8A9D
		bcc	loc_9D75
		bset	<BitFlags6d_t3 $80
		bra	loc_9D75
; ---------------------------------------------------------------------------

loc_9D66:				; CODE XREF: sub_9D4C:loc_9D56j
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	byte_8A9E
		bcs	loc_9D75
		brset	<BitFlags6d_t3 $80 loc_9D75
		brset	<BitFlags29 $40	loc_9D78

loc_9D75:				; CODE XREF: sub_9D4C+13j sub_9D4C+18j ...
		jmp	loc_9DD7
; ---------------------------------------------------------------------------

loc_9D78:				; CODE XREF: sub_9D4C+25j
		ldaa	<b5C_IPL1_t3
		bne	loc_9DD7
		ldaa	<MapVolts
		cmpa	byte_8A9F
		bcs	loc_9DD7
		ldx	<EGRVar3_ErrorCodeBufferHB
		brset	<BitFlags6d_t3 $40 loc_9DF5
		cpx	word_8AA7
		bcc	loc_9DE6
		ldaa	<MapValue
		cmpa	byte_8AA3
		bcs	loc_9DD7
		cmpa	byte_8AA2
		bcc	loc_9DD7
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		cmpa	byte_8AA1
		bcs	loc_9DD7
		cmpa	byte_8AA0
		bcc	loc_9DD7
		ldaa	<EngineRpm_HB
		cmpa	byte_8AA5
		bcs	loc_9DD7
		cmpa	byte_8AA4
		bcc	loc_9DD7
		ldaa	<Counter_O2SensorFeedbackCount_Signed
		cmpa	byte_8AA6
		bcc	loc_9DD7
		inx
		stx	<EGRVar3_ErrorCodeBufferHB
		bset	<BitFlags6d_t3 $10
		ldab	byte_8AAF
		suba	<EGRVar5_EGR_Temp_1
		bcs	loc_9DCB
		mul
		adca	#0
		bra	loc_9DD0
; ---------------------------------------------------------------------------

loc_9DCB:				; CODE XREF: sub_9D4C+78j
		nega
		mul
		adca	#0
		nega

loc_9DD0:				; CODE XREF: sub_9D4C+7Dj
		adda	<EGRVar5_EGR_Temp_1
		staa	<EGRVar5_EGR_Temp_1
		jmp	loc_9E6D
; ---------------------------------------------------------------------------

loc_9DD7:				; CODE XREF: sub_9D4C:loc_9D75J
					; sub_9D4C+2Ej	...
		ldx	#0
		stx	<EGRVar3_ErrorCodeBufferHB
		bclr	<BitFlags6d_t3 $50
		ldaa	<Counter_O2SensorFeedbackCount_Signed
		staa	<EGRVar5_EGR_Temp_1
		jmp	loc_9E6D
; ---------------------------------------------------------------------------

loc_9DE6:				; CODE XREF: sub_9D4C+40j
		ldx	#0
		bset	<BitFlags6d_t3 $40
		bclr	<BitFlags6d_t3 $10
		ldaa	<EGRVar5_EGR_Temp_1
		staa	<EGRVar6
		bra	loc_9DFA
; ---------------------------------------------------------------------------

loc_9DF5:				; CODE XREF: sub_9D4C+39j
		cpx	word_8AB1
		bcc	loc_9E3D

loc_9DFA:				; CODE XREF: sub_9D4C+A7j
		inx
		stx	<EGRVar3_ErrorCodeBufferHB
		ldaa	<MapValue
		cmpa	byte_8AAD
		bcs	loc_9DD7
		cmpa	byte_8AAE
		bcc	loc_9DD7
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		cmpa	byte_8AAB
		bcs	loc_9DD7
		cmpa	byte_8AAC
		bcc	loc_9DD7
		ldaa	<EngineRpm_HB
		cmpa	byte_8AA9
		bcs	loc_9DD7
		cmpa	byte_8AAA
		bcc	loc_9DD7
		ldaa	<Counter_O2SensorFeedbackCount_Signed
		cmpa	<EGRVar6
		bcs	loc_9E6D
		staa	<EGRVar6
		suba	<EGRVar5_EGR_Temp_1
		staa	<EGRVar7
		cmpa	byte_8AB0
		bcs	loc_9E6D

loc_9E32:				; CODE XREF: sub_9D4C+7J
		clr	EGRVar1_ErrorCodeCounter
		bset	<BitFlags6d_t3 $80
		bclr	<BitFlags6d_t3 $70
		bra	loc_9E6D
; ---------------------------------------------------------------------------

loc_9E3D:				; CODE XREF: sub_9D4C+ACj
		ldx	#0
		stx	<EGRVar3_ErrorCodeBufferHB
		ldab	<BitFlags6d_t3
		andb	#$AF
		ldaa	<EGRVar1_ErrorCodeCounter
		inca
		staa	<EGRVar1_ErrorCodeCounter
		cmpa	byte_8AB3
		bcs	loc_9E5F
		orab	#$20
		pshb
		ldd	#$2E81
		jsr	ThrowNonCriticalError_
		bcc	loc_9E5E
		bset	<b5D_IPL2_t3 8

loc_9E5E:				; CODE XREF: sub_9D4C+10Dj
		pulb

loc_9E5F:				; CODE XREF: sub_9D4C+102j
		ldaa	<EGRVar8
		inca
		staa	<EGRVar8
		cmpa	byte_8A9C
		bcs	loc_9E6B
		orab	#$80

loc_9E6B:				; CODE XREF: sub_9D4C+11Bj
		stab	<BitFlags6d_t3

loc_9E6D:				; CODE XREF: sub_9D4C+88J sub_9D4C+97J ...
		brset	<BitFlags6d_t3 $40 loc_9ECB
		ldaa	<Ram_CC
		beq	loc_9E78
		dec	Ram_CC

loc_9E78:				; CODE XREF: sub_9D4C+127j
		brclr	<BitFlags66_t3 $80 loc_9EC2
		brset	<BitFlags66_t3 $40 loc_9EC2
		ldaa	byte_8855
		brset	<PIA2_Buffer_t3	2 loc_9E8E
		suba	byte_8856
		bcc	loc_9E8E
		ldaa	#0

loc_9E8E:				; CODE XREF: sub_9D4C+137j
					; sub_9D4C+13Ej
		cmpa	<EngineRpm_HB
		bcs	loc_9EC2
		ldaa	<CoolantTemp
		cmpa	byte_8851
		bcs	loc_9EC2
		ldaa	<MapValue
		brset	<PIA2_Buffer_t3	2 loc_9EA5
		suba	byte_884F
		bcc	loc_9EA5
		clra

loc_9EA5:				; CODE XREF: sub_9D4C+14Fj
					; sub_9D4C+156j
		cmpa	byte_8850
		bcs	loc_9EC2
		ldaa	<BaroPressure
		suba	byte_8852
		bcc	loc_9EB2
		clra

loc_9EB2:				; CODE XREF: sub_9D4C+163j
		cmpa	<MapValue
		bcc	loc_9ECF
		ldaa	<BaroPressure
		suba	byte_8854
		bcc	loc_9EBE
		clra

loc_9EBE:				; CODE XREF: sub_9D4C+16Fj
		cmpa	<MapValue
		bcc	locret_9EDB

loc_9EC2:				; CODE XREF: sub_9D4C:loc_9E78j
					; sub_9D4C+130j ...
		brclr	<PIA2_Buffer_t3	2 loc_9ECB
		ldaa	byte_8853
		staa	<Ram_CC

loc_9ECB:				; CODE XREF: sub_9D4C:loc_9E6Dj
					; sub_9D4C:loc_9EC2j
		bclr	<PIA2_Buffer_t3	2
		rts
; ---------------------------------------------------------------------------

loc_9ECF:				; CODE XREF: sub_9D4C+168j
		brset	<PIA2_Buffer_t3	2 loc_9ED8
		ldaa	byte_8853
		staa	<Ram_CC

loc_9ED8:				; CODE XREF: sub_9D4C:loc_9ECFj
		bset	<PIA2_Buffer_t3	2

locret_9EDB:				; CODE XREF: sub_9D4C+174j
		rts
; End of function sub_9D4C


; =============== S U B	R O U T	I N E =======================================


sub_9EDC:				; CODE XREF: __RESET:loc_9AE7P
		brset	<IPL1 $40 loc_9EE6
		brset	<BitFlags6a_t3 4 loc_9EF3
		bra	loc_9EF8
; ---------------------------------------------------------------------------

loc_9EE6:				; CODE XREF: sub_9EDCj
		brset	<BitFlags6a_t3 $40 locret_9F30
		ldd	word_B610
		cpd	#$5AA5
		beq	loc_9EF8

loc_9EF3:				; CODE XREF: sub_9EDC+4j
		bclr	<PIA1_Buffer_t3	8
		bra	loc_9EFB
; ---------------------------------------------------------------------------

loc_9EF8:				; CODE XREF: sub_9EDC+8j sub_9EDC+15j
		bset	<PIA1_Buffer_t3	8

loc_9EFB:				; CODE XREF: sub_9EDC+1Aj
		brset	<IPL1 $80 loc_9F02
		jmp	loc_9FB2
; ---------------------------------------------------------------------------

loc_9F02:				; CODE XREF: sub_9EDC:loc_9EFBj
		brset	<BitFlags6a_t3 $40 locret_9F30
		brclr	<BitFlags6a_t3 $20 loc_9F31
		jsr	sub_9FD5
		stab	DRBOffsetStored_LB
		inc	DRBOffsetStored_HB
		bset	<BitFlags6a_t3 $40
		bclr	<BitFlags6a_t3 $20
		sei
		bclr	<IPL1 $80
		cli
		cpd	word_8B56
		bcs	loc_9F27
		bset	<BitFlags2f $40

loc_9F27:				; CODE XREF: sub_9EDC+46j
		cpd	word_8AB4
		bne	locret_9F30
		bset	<BitFlags6a_t3 $10

locret_9F30:				; CODE XREF: sub_9EDC:loc_9EE6j
					; sub_9EDC:loc_9F02j ...
		rts
; ---------------------------------------------------------------------------

loc_9F31:				; CODE XREF: sub_9EDC+2Aj
		ldx	#$1C
		ldaa	#$30

loc_9F36:				; CODE XREF: sub_9EDC+66j
		brclr	0,x $FF	loc_9F44
		cmpa	0,x
		beq	loc_9F94
		dex
		cpx	#$15
		bcc	loc_9F36

loc_9F44:				; CODE XREF: sub_9EDC:loc_9F36j
		ldd	#0
		std	Temp4
		staa	DRBOffsetStored_HB
		ldx	#$B600
		ldy	#$B60E

loc_9F54:				; CODE XREF: sub_9EDC+A9j
		ldd	0,x
		subd	0,y
		cpd	#1
		bne	loc_9F70
		ldd	0,x
		cpd	Temp4
		bcs	loc_9F70
		std	Temp4
		pshx
		pula
		pula
		staa	DRBOffsetStored_HB

loc_9F70:				; CODE XREF: sub_9EDC+81j sub_9EDC+89j
		cpx	#$B60E
		beq	loc_9F87
		inx
		inx
		cpy	#$B60E
		bne	loc_9F81
		ldy	#$B5FE

loc_9F81:				; CODE XREF: sub_9EDC+9Fj
		iny
		iny
		bra	loc_9F54
; ---------------------------------------------------------------------------

loc_9F87:				; CODE XREF: sub_9EDC+97j
		ldd	Temp4
		bne	loc_9F9A
		ldd	#$3003
		jsr	ThrowNonCriticalError_
		bcc	locret_9F99

loc_9F94:				; CODE XREF: sub_9EDC+60j
		sei
		bclr	<IPL1 $80
		cli

locret_9F99:				; CODE XREF: sub_9EDC+B6j
		rts
; ---------------------------------------------------------------------------

loc_9F9A:				; CODE XREF: sub_9EDC+AEj
		ldaa	DRBOffsetStored_HB
		adda	#2
		cmpa	#$10
		bne	loc_9FA5
		ldaa	#0

loc_9FA5:				; CODE XREF: sub_9EDC+C5j
		staa	DRBOffsetStored_HB
		jsr	sub_9FD5
		staa	DRBOffsetStored_LB
		bset	<BitFlags6a_t3 $60

locret_9FB1:				; CODE XREF: sub_9EDC:loc_9FB2j
					; sub_9EDC+DAj
		rts
; ---------------------------------------------------------------------------

loc_9FB2:				; CODE XREF: sub_9EDC+23J
		brclr	<BitFlags6a_t3 $10 locret_9FB1
		brset	<BitFlags6a_t3 $40 locret_9FB1
		ldd	#$105A
		brclr	<BitFlags6a_t3 $20 loc_9FCB
		inca
		comb
		bclr	<BitFlags6a_t3 $30
		bset	<BitFlags6a_t3 $40
		bra	loc_9FCE
; ---------------------------------------------------------------------------

loc_9FCB:				; CODE XREF: sub_9EDC+E1j
		bset	<BitFlags6a_t3 $60

loc_9FCE:				; CODE XREF: sub_9EDC+EDj
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB
		rts
; End of function sub_9EDC


; =============== S U B	R O U T	I N E =======================================


sub_9FD5:				; CODE XREF: sub_9EDC+2EP sub_9EDC+CCP
		ldx	#$B600
		ldab	DRBOffsetStored_HB
		subb	#2
		bpl	loc_9FE1
		ldab	#$E

loc_9FE1:				; CODE XREF: sub_9FD5+8j
		abx
		ldd	0,x
		addd	#1
		bcc	locret_9FEC
		ldd	#$FFFF

locret_9FEC:				; CODE XREF: sub_9FD5+12j
		rts
; End of function sub_9FD5


; =============== S U B	R O U T	I N E =======================================


sub_9FED:				; CODE XREF: __RESET+5F8P
		ldaa	TL_ConfigurationFlags2
		bita	#$80
		bne	loc_9FF7

loc_9FF4:				; CODE XREF: sub_9FED+18j
		jmp	loc_A09B
; ---------------------------------------------------------------------------

loc_9FF7:				; CODE XREF: sub_9FED+5j
		brset	<StartupSwitchMirror1 1	loc_A078
		ldab	<b5d_IPL2
		bitb	#$80
		beq	loc_A007
		bita	#$20
		bne	loc_A078
		bra	loc_9FF4
; ---------------------------------------------------------------------------

loc_A007:				; CODE XREF: sub_9FED+12j
		ldaa	byte_8868
		brset	<BitFlags2a $40	loc_A011
		adda	byte_8869

loc_A011:				; CODE XREF: sub_9FED+1Dj
		cmpa	<VehicleSpeedx8_Scaled
		bcc	loc_A075
		bset	<BitFlags2a $40
		ldaa	<CoolantTemp
		cmpa	byte_8865
		bcs	loc_A078
		ldaa	byte_886B
		brset	<PIA1_Buffer_t3	$10 loc_A028
		adda	#4

loc_A028:				; CODE XREF: sub_9FED+35j
		cmpa	<ScaledDistPWForCruiseControl
		bcs	loc_A078
		brclr	<BitFlags68_t3 $10 loc_A078
		ldaa	<EngineRpm_HB
		cmpa	byte_8867
		bcs	loc_A04B
		brclr	<Ram_D0	$FF loc_A04B
		ldaa	<Counter_MainLoop
		bita	#7
		bne	loc_A046
		dec	Ram_D0
		beq	loc_A04B

loc_A046:				; CODE XREF: sub_9FED+52j
		ldx	#$889A
		bra	loc_A051
; ---------------------------------------------------------------------------

loc_A04B:				; CODE XREF: sub_9FED+48j sub_9FED+4Aj ...
		ldx	#$8883
		clr	Ram_D0

loc_A051:				; CODE XREF: sub_9FED+5Cj
		ldaa	<EngineRpm_HB
		jsr	Lookup4ByteTable
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		cba
		bcs	loc_A089
		ldx	#$886C
		ldaa	<EngineRpm_HB
		jsr	Lookup4ByteTable
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		cba
		bcc	loc_A06E
		brclr	<PIA1_Buffer_t3	$10 loc_A09B
		bra	loc_A07B
; ---------------------------------------------------------------------------

loc_A06E:				; CODE XREF: sub_9FED+79j
		ldaa	byte_8866
		staa	<Ram_D0
		bra	loc_A07B
; ---------------------------------------------------------------------------

loc_A075:				; CODE XREF: sub_9FED+26j
		bclr	<BitFlags2a $40

loc_A078:				; CODE XREF: sub_9FED:loc_9FF7j
					; sub_9FED+16j	...
		clr	Ram_D0

loc_A07B:				; CODE XREF: sub_9FED+7Fj sub_9FED+86j
		ldaa	byte_886A
		staa	<Ram_D1

loc_A080:				; CODE XREF: sub_9FED+A4j sub_9FED+A9j
		bset	<PIA1_Buffer_t3	$10
		clr	Ram_D3

loc_A086:				; CODE XREF: sub_9FED+DAj sub_9FED+E4j ...
		jmp	loc_A178
; ---------------------------------------------------------------------------

loc_A089:				; CODE XREF: sub_9FED+6Cj
		ldaa	<Ram_D1
		beq	loc_A098
		ldab	<Counter_MainLoop
		bitb	#7
		bne	loc_A080
		deca
		staa	<Ram_D1
		bne	loc_A080

loc_A098:				; CODE XREF: sub_9FED+9Ej
		bclr	<PIA1_Buffer_t3	$10

loc_A09B:				; CODE XREF: sub_9FED:loc_9FF4J
					; sub_9FED+7Bj
		ldaa	TL_ConfigurationFlags2
		bita	#$40
		bne	loc_A0A5
		jmp	locret_A136
; ---------------------------------------------------------------------------

loc_A0A5:				; CODE XREF: sub_9FED+B3j
		ldaa	<Counter_MainLoop
		bita	#1
		bne	loc_A0B5
		ldaa	<Ram_D3
		cmpa	byte_88BA
		beq	loc_A0B5
		inca
		staa	<Ram_D3

loc_A0B5:				; CODE XREF: sub_9FED+BCj sub_9FED+C3j
		ldaa	<PTU_MapTemp
		staa	Temp5
		ldaa	<Counter_MainLoop
		anda	byte_88B2
		bne	loc_A0C5
		ldaa	<MapValue
		staa	<PTU_MapTemp

loc_A0C5:				; CODE XREF: sub_9FED+D2j
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		beq	loc_A086
		staa	Temp3
		ldaa	<CoolantTemp
		cmpa	byte_88B1
		bcs	loc_A086
		brclr	<BitFlags68_t3 $10 loc_A086
		brclr	<BitFlags66_t3 $80 loc_A086
		brset	<StartupSwitchMirror1 $20 loc_A086
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	byte_88B3
		bcc	loc_A0F5
		ldaa	<MapValue
		suba	Temp5
		bcs	loc_A0F5
		cmpa	byte_88B4
		bcs	loc_A124
		jmp	loc_A178
; ---------------------------------------------------------------------------

loc_A0F5:				; CODE XREF: sub_9FED+F7j sub_9FED+FEj
		ldaa	Temp5
		suba	<MapValue
		bcs	loc_A124
		staa	Temp5
		ldx	#$88B6
		brset	<BitFlags2a $20	loc_A11B
		brset	<BitFlags2a $10	loc_A11A
		ldaa	Temp3
		cmpa	byte_88B5
		bcs	loc_A117
		bset	<BitFlags2a $20
		bra	loc_A11B
; ---------------------------------------------------------------------------

loc_A117:				; CODE XREF: sub_9FED+123j
		bset	<BitFlags2a $10

loc_A11A:				; CODE XREF: sub_9FED+119j
		inx

loc_A11B:				; CODE XREF: sub_9FED+115j
					; sub_9FED+128j
		ldab	Temp5
		cmpb	0,x
		bcc	loc_A178
		bra	loc_A127
; ---------------------------------------------------------------------------

loc_A124:				; CODE XREF: sub_9FED+103j
					; sub_9FED+10Dj
		bclr	<BitFlags2a $30

loc_A127:				; CODE XREF: sub_9FED+135j
		ldaa	<Counter_PartThrottleUnlock
		cmpa	#1
		bls	loc_A137
		ldab	<Counter_MainLoop
		bitb	#7
		bne	locret_A136
		deca
		staa	<Counter_PartThrottleUnlock

locret_A136:				; CODE XREF: sub_9FED+B5J
					; sub_9FED+144j ...
		rts
; ---------------------------------------------------------------------------

loc_A137:				; CODE XREF: sub_9FED+13Ej
		ldx	#$88D9
		brclr	<PIA1_Buffer_t3	$20 loc_A141
		ldx	#$88BB

loc_A141:				; CODE XREF: sub_9FED+14Dj
		stx	Temp4
		bsr	sub_A182
		bcc	loc_A178
		ldx	Temp4
		ldab	#$F
		abx
		bsr	sub_A182
		bcs	loc_A178
		ldaa	<Counter_PartThrottleUnlock
		beq	loc_A168
		ldaa	TL_ConfigurationFlags2
		bita	#$80
		beq	loc_A164
		ldaa	<Ram_D3
		cmpa	byte_88BA
		bcs	locret_A136

loc_A164:				; CODE XREF: sub_9FED+16Ej
		bclr	<PIA1_Buffer_t3	$20
		rts
; ---------------------------------------------------------------------------

loc_A168:				; CODE XREF: sub_9FED+167j
		ldaa	<VehicleSpeedx8_Scaled
		ldab	byte_88B8
		cmpa	byte_88B3
		bcc	loc_A175
		ldab	byte_88B9

loc_A175:				; CODE XREF: sub_9FED+183j
		stab	<Counter_PartThrottleUnlock
		rts
; ---------------------------------------------------------------------------

loc_A178:				; CODE XREF: sub_9FED:loc_A086J
					; sub_9FED+105J ...
		clr	Counter_PartThrottleUnlock
		bset	<PIA1_Buffer_t3	$20
		bclr	<BitFlags2a $30
		rts
; End of function sub_9FED


; =============== S U B	R O U T	I N E =======================================


sub_A182:				; CODE XREF: sub_9FED+157p
					; sub_9FED+161p
		ldaa	<VehicleSpeedx8_Scaled
		jsr	Lookup4ByteTable
		ldaa	Temp3
		cba
		rts
; End of function sub_A182


; =============== S U B	R O U T	I N E =======================================


sub_A18C:				; CODE XREF: __RESET+632P
		ldaa	TL_ConfigurationFlags2
		bita	#$20
		beq	locret_A19E
		ldaa	TL_CONF01
		bita	#1
		beq	locret_A19E
		brclr	<Counter_MainLoop 2 loc_A19F

locret_A19E:				; CODE XREF: sub_A18C+5j sub_A18C+Cj
		rts
; ---------------------------------------------------------------------------

loc_A19F:				; CODE XREF: sub_A18C+Ej
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	#$82
		bcc	loc_A1D0
		cmpa	byte_88F7
		bcs	loc_A1D0
		brset	<BitFlags2a 4 loc_A1D0
		ldaa	<ScaledDistPWForCruiseControl
		cmpa	TL_TL_88E4
		bcc	loc_A1D0
		cmpa	byte_88F9
		bcs	loc_A1D0
		ldab	<Counter_MainLoop
		bne	loc_A1D3
		ldab	<Ram_D0
		incb
		beq	loc_A1CA
		stab	<Ram_D0
		cmpb	byte_88FA
		bcs	loc_A1D3

loc_A1CA:				; CODE XREF: sub_A18C+35j
		cmpa	<Ram_0C
		bcc	loc_A1D0
		staa	<Ram_0C

loc_A1D0:				; CODE XREF: sub_A18C+17j sub_A18C+1Cj ...
		clr	Ram_D0

loc_A1D3:				; CODE XREF: sub_A18C+30j sub_A18C+3Cj
		ldaa	<EngineRpm_HB
		cmpa	#$F
		bcs	loc_A202
		ldab	<ScaledDistPWForCruiseControl
		subb	<PTU_MapTemp
		bcc	loc_A1E0
		negb

loc_A1E0:				; CODE XREF: sub_A18C+51j
		cmpb	byte_88FB
		bcs	loc_A1ED
		bset	<BitFlags2a 4
		clr	Ram_D1
		bra	loc_A211
; ---------------------------------------------------------------------------

loc_A1ED:				; CODE XREF: sub_A18C+57j
		brclr	<BitFlags2a 4 loc_A205
		cmpb	byte_88FC
		bcc	loc_A205
		ldaa	<Ram_D1
		inca
		beq	loc_A202
		staa	<Ram_D1
		cmpa	byte_88FD
		bcs	loc_A208

loc_A202:				; CODE XREF: sub_A18C+4Bj sub_A18C+6Dj
		bclr	<BitFlags2a 4

loc_A205:				; CODE XREF: sub_A18C:loc_A1EDj
					; sub_A18C+68j
		clr	Ram_D1

loc_A208:				; CODE XREF: sub_A18C+74j
		ldaa	<Counter_MainLoop
		lsra
		lsra
		bita	byte_88FE
		bne	loc_A215

loc_A211:				; CODE XREF: sub_A18C+5Fj
		ldaa	<ScaledDistPWForCruiseControl
		staa	<PTU_MapTemp

loc_A215:				; CODE XREF: sub_A18C+83j
		brset	<IPL1 $40 loc_A21F
		brset	<BitFlags6a_t3 4 loc_A21F
		bra	loc_A27C
; ---------------------------------------------------------------------------

loc_A21F:				; CODE XREF: sub_A18C:loc_A215j
					; sub_A18C+8Dj
		brclr	<BitFlags66_t3 $80 loc_A270
		brclr	<BitFlags66_t3 $40 loc_A22E
		ldaa	<EngineRpm_HB
		cmpa	byte_88FF
		bcc	loc_A270

loc_A22E:				; CODE XREF: sub_A18C+97j
		ldaa	<ScaledDistPWForCruiseControl
		suba	<Ram_0C
		bcs	loc_A270
		cmpa	byte_8900
		bcs	loc_A270
		ldx	#$8901
		ldaa	<MapValue
		jsr	sub_E68D
		ldaa	<EngineRpm_HB
		cba
		bcc	loc_A256
		brset	<PIA1_Buffer_t3	$20 loc_A270
		subb	byte_890A
		bcc	loc_A251
		ldab	#0

loc_A251:				; CODE XREF: sub_A18C+C1j
		cba
		bcc	loc_A262
		bra	loc_A270
; ---------------------------------------------------------------------------

loc_A256:				; CODE XREF: sub_A18C+B8j
		ldaa	<Ram_D3
		inca
		beq	loc_A262
		staa	<Ram_D3
		cmpa	byte_890B
		bcs	loc_A276

loc_A262:				; CODE XREF: sub_A18C+C6j sub_A18C+CDj
		ldaa	<Counter_PartThrottleUnlock
		inca
		beq	loc_A276
		staa	<Counter_PartThrottleUnlock
		cmpa	byte_890C
		bhi	loc_A276
		bra	loc_A27C
; ---------------------------------------------------------------------------

loc_A270:				; CODE XREF: sub_A18C:loc_A21Fj
					; sub_A18C+A0j	...
		clr	Ram_D3
		clr	Counter_PartThrottleUnlock

loc_A276:				; CODE XREF: sub_A18C+D4j sub_A18C+D9j ...
		ldab	<PIA1_Buffer_t3
		orab	#$20
		bra	loc_A280
; ---------------------------------------------------------------------------

loc_A27C:				; CODE XREF: sub_A18C+91j sub_A18C+E2j
		ldab	<PIA1_Buffer_t3
		andb	#$DF

loc_A280:				; CODE XREF: sub_A18C+EEj
		stab	<PIA1_Buffer_t3
		rts
; End of function sub_A18C


; =============== S U B	R O U T	I N E =======================================


sub_A283:				; CODE XREF: __RESET:loc_9A8EP
		ldaa	TL_ConfigurationFlags2
		bita	#8
		beq	locret_A2A7
		ldaa	<CoolantTemp
		cmpa	byte_8858
		bcc	loc_A2A1
		cmpa	byte_8857
		bcs	loc_A29A
		brset	<BitFlags2a $80	loc_A2A1

loc_A29A:				; CODE XREF: sub_A283+11j
		bclr	<BitFlags2a $80
		bclr	<PIA2_Buffer_t3	$20
		rts
; ---------------------------------------------------------------------------

loc_A2A1:				; CODE XREF: sub_A283+Cj sub_A283+13j
		bset	<BitFlags2a $80
		bset	<PIA2_Buffer_t3	$20

locret_A2A7:				; CODE XREF: sub_A283+5j
		rts
; End of function sub_A283


; =============== S U B	R O U T	I N E =======================================


sub_A2A8:				; CODE XREF: __RESET+621P
		ldaa	TL_ConfigurationFlags2
		bita	#$10
		beq	locret_A2BA
		brset	<BitFlags29 $40	loc_A2B7
		bclr	<PIA2_Buffer_t3	4
		rts
; ---------------------------------------------------------------------------

loc_A2B7:				; CODE XREF: sub_A2A8+7j
		bset	<PIA2_Buffer_t3	4

locret_A2BA:				; CODE XREF: sub_A2A8+5j
		rts
; End of function sub_A2A8


; =============== S U B	R O U T	I N E =======================================


sub_A2BB:				; CODE XREF: __RESET+635P
		ldaa	TL_CONF01
		bita	#8
		bne	locret_A326
		ldaa	TL_ConfigurationFlags2
		bita	#4
		beq	locret_A326
		brclr	<IPL1 $40 loc_A316
		ldaa	<Counter_MainLoop
		anda	#$7F
		bne	locret_A326
		brset	<b5C_IPL1_t3 2 loc_A309
		ldaa	<BitFlags27
		bita	#$C0
		beq	loc_A2E1
		brclr	<PIA2_Buffer_t3	1 loc_A309

loc_A2E1:				; CODE XREF: sub_A2BB+20j
		ldx	#$885B
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	byte_8859
		bcc	loc_A2FB
		cmpa	byte_885A
		bcs	loc_A2F4
		brset	<BitFlags2a 8 loc_A2FB

loc_A2F4:				; CODE XREF: sub_A2BB+33j
		inx
		inx
		bclr	<BitFlags2a 8
		bra	loc_A2FE
; ---------------------------------------------------------------------------

loc_A2FB:				; CODE XREF: sub_A2BB+2Ej sub_A2BB+35j
		bset	<BitFlags2a 8

loc_A2FE:				; CODE XREF: sub_A2BB+3Ej
		brset	<PIA1_Buffer_t3	$80 loc_A303
		inx

loc_A303:				; CODE XREF: sub_A2BB:loc_A2FEj
		ldab	0,x
		cmpb	<CoolantTemp
		bcc	loc_A316

loc_A309:				; CODE XREF: sub_A2BB+18j sub_A2BB+22j
		brclr	<PIA1_Buffer_t3	$80 loc_A31F
		ldaa	#7
		staa	<Timer_MinimumFanRun
		bclr	<PIA1_Buffer_t3	$80
		bra	locret_A326
; ---------------------------------------------------------------------------

loc_A316:				; CODE XREF: sub_A2BB+Ej sub_A2BB+4Cj
		ldaa	<Timer_MinimumFanRun
		bne	loc_A31F
		bset	<PIA1_Buffer_t3	$80
		bra	locret_A326
; ---------------------------------------------------------------------------

loc_A31F:				; CODE XREF: sub_A2BB:loc_A309j
					; sub_A2BB+5Dj
		ldaa	<Timer_MinimumFanRun
		beq	locret_A326
		deca
		staa	<Timer_MinimumFanRun

locret_A326:				; CODE XREF: sub_A2BB+5j sub_A2BB+Cj ...
		rts
; End of function sub_A2BB


; =============== S U B	R O U T	I N E =======================================


sub_A327:				; CODE XREF: __RESET+5E3P
		brclr	<IPL1 $40 loc_A334
		ldaa	<Timer_AisChanges
		inca
		beq	loc_A337
		staa	<Timer_AisChanges
		bra	loc_A337
; ---------------------------------------------------------------------------

loc_A334:				; CODE XREF: sub_A327j
		clr	Timer_AisChanges

loc_A337:				; CODE XREF: sub_A327+7j sub_A327+Bj
		brclr	<BitFlags27 2 loc_A342
		brset	<StartupSwitchMirror1 1	loc_A342
		bclr	<BitFlags68_t3 $80

loc_A342:				; CODE XREF: sub_A327:loc_A337j
					; sub_A327+14j
		brset	<BitFlags68_t3 $80 loc_A34F
		brclr	<BitFlags6d_t3 8 loc_A352
		ldaa	#$30
		jmp	loc_A3DF
; ---------------------------------------------------------------------------

loc_A34F:				; CODE XREF: sub_A327:loc_A342j
		jmp	loc_A3E4
; ---------------------------------------------------------------------------

loc_A352:				; CODE XREF: sub_A327+1Fj
		ldx	#$874B
		brset	<BitFlags68_t3 $10 loc_A3B6
		ldaa	<DRBPointer1
		cmpa	#$19
		beq	loc_A371
		brclr	<BitFlags6d_t3 1 loc_A381
		ldd	<TargetIdleSpeedHB
		subd	#1
		bitb	#$3F
		bne	loc_A3E2
		bclr	<BitFlags6d_t3 1
		bra	loc_A3E2
; ---------------------------------------------------------------------------

loc_A371:				; CODE XREF: sub_A327+36j
		brset	<DRBSerialMode $20 loc_A3E4
		clr	DRBPointer1
		ldaa	<DRBPointer2
		ldab	#$FF
		bset	<BitFlags6d_t3 1
		bra	loc_A3E0
; ---------------------------------------------------------------------------

loc_A381:				; CODE XREF: sub_A327+38j
		brclr	<BitFlags2D 4 loc_A393
		brclr	<IPL1 $40 loc_A393
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	#8
		bcs	loc_A393
		ldaa	#$70
		bra	loc_A3DF
; ---------------------------------------------------------------------------

loc_A393:				; CODE XREF: sub_A327:loc_A381j
					; sub_A327+5Ej	...
		ldaa	byte_876A
		brset	<BitFlags2a 1 loc_A3DF
		brset	<b5C_IPL1_t3 2 loc_A3DF
		brclr	<BitFlags27 2 loc_A3B3
		brset	<StartupSwitchMirror1 1	loc_A3B3
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	byte_8841
		bcc	loc_A3B3
		ldaa	byte_8840
		jmp	loc_A3DF
; ---------------------------------------------------------------------------

loc_A3B3:				; CODE XREF: sub_A327+77j sub_A327+7Bj ...
		ldx	#$8738

loc_A3B6:				; CODE XREF: sub_A327+2Ej
		ldaa	<CoolantTemp
		jsr	Lookup4ByteTable
		brset	<KeyOnOrEngineRunningTime $FF loc_A3CE
		psha
		ldaa	<KeyOnOrEngineRunningTime
		ldx	#$875E
		jsr	Lookup4ByteTable
		pulb
		aba
		bcc	loc_A3CE
		ldaa	#$FF

loc_A3CE:				; CODE XREF: sub_A327+94j sub_A327+A3j
		ldab	<BitFlags27
		bitb	#$C0
		beq	loc_A3DF
		brclr	<StartupSwitchMirror1 $40 loc_A3DF
		ldab	byte_8769
		cba
		bcc	loc_A3DF
		tba

loc_A3DF:				; CODE XREF: sub_A327+25J sub_A327+6Aj ...
		clrb

loc_A3E0:				; CODE XREF: sub_A327+58j
		lsrd
		lsrd

loc_A3E2:				; CODE XREF: sub_A327+43j sub_A327+48j
		std	<TargetIdleSpeedHB

loc_A3E4:				; CODE XREF: sub_A327:loc_A34FJ
					; sub_A327:loc_A371j
		ldaa	<ATMOffset
		cmpa	#7
		beq	locret_A42E
		cmpa	#$14
		beq	locret_A42E
		brset	<BitFlags36_t3 $20 loc_A3F6
		brset	<IPL1 $40 loc_A41E

loc_A3F6:				; CODE XREF: sub_A327+C7j
		ldaa	<DesiredNewAisPosition
		cmpa	<CurrentAisPosition
		bne	loc_A403
		brset	<BitFlags36_t3 $40 loc_A403
		bclr	<BitFlags36_t3 $20

loc_A403:				; CODE XREF: sub_A327+D3j sub_A327+D5j
		ldaa	<CoolantTemp
		ldx	#$86C2
		jsr	Lookup4ByteTable
		psha
		ldaa	<BaroPressure
		ldx	#$86D5
		jsr	Lookup4ByteTable
		pulb
		aba
		bcc	loc_A41B
		jmp	loc_A59C
; ---------------------------------------------------------------------------

loc_A41B:				; CODE XREF: sub_A327+EFj
		jmp	loc_A58E
; ---------------------------------------------------------------------------

loc_A41E:				; CODE XREF: sub_A327+CBj
		brclr	<b5C_IPL1_t3 $88 loc_A433
		ldaa	byte_8A9B
		staa	<DesiredNewAisPosition
		brclr	<BitFlags68_t3 $40 loc_A42F
		bset	<BitFlags68_t3 $C

locret_A42E:				; CODE XREF: sub_A327+C1j sub_A327+C5j ...
		rts
; ---------------------------------------------------------------------------

loc_A42F:				; CODE XREF: sub_A327+100j
		bclr	<BitFlags68_t3 $C
		rts
; ---------------------------------------------------------------------------

loc_A433:				; CODE XREF: sub_A327:loc_A41Ej
		jsr	sub_A5D4
		dex
		bne	loc_A43A
		rts
; ---------------------------------------------------------------------------

loc_A43A:				; CODE XREF: sub_A327+110j
		brclr	<BitFlags68_t3 2 loc_A470
		ldx	#$8794
		ldaa	<BaroPressure
		brclr	<StartupSwitchMirror1 1	loc_A44A
		ldx	#$879E

loc_A44A:				; CODE XREF: sub_A327+11Cj
		jsr	sub_E68D
		tba
		brclr	<StartupSwitchMirror1 1	loc_A45C
		nega
		brclr	<BitFlags2D $20	loc_A46C
		bclr	<BitFlags2D $20
		bra	loc_A466
; ---------------------------------------------------------------------------

loc_A45C:				; CODE XREF: sub_A327+127j
		ldab	<EngineRpm_HB
		cmpb	byte_879D
		bcc	loc_A46C
		bset	<BitFlags2D $20

loc_A466:				; CODE XREF: sub_A327+133j
		jsr	sub_A5BA
		clra
		staa	<Timer_AisChanges

loc_A46C:				; CODE XREF: sub_A327+12Cj
					; sub_A327+13Aj
		bclr	<BitFlags68_t3 2
		rts
; ---------------------------------------------------------------------------

loc_A470:				; CODE XREF: sub_A327:loc_A43Aj
		brclr	<BitFlags66_t3 $80 loc_A48B
		brset	<BitFlags27 1 loc_A47B
		bclr	<BitFlags68_t3 $80

loc_A47B:				; CODE XREF: sub_A327+14Dj
		brclr	<StartupSwitchMirror1 $20 loc_A48F
		ldx	#$86B7
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		jsr	Lookup4ByteTable
		cmpa	<EngineRpm_HB
		bcc	loc_A48F

loc_A48B:				; CODE XREF: sub_A327:loc_A470j
		brclr	<BitFlags66_t3 $20 loc_A492

loc_A48F:				; CODE XREF: sub_A327:loc_A47Bj
					; sub_A327+162j
		jmp	loc_A4FF
; ---------------------------------------------------------------------------

loc_A492:				; CODE XREF: sub_A327:loc_A48Bj
		brset	<BitFlags66_t3 4 locret_A42E
		ldab	<Timer_CountdownFromStartRunForAisFeedback
		bne	locret_A42E
		ldaa	<DesiredNewAisPosition
		cmpa	#4
		bcs	loc_A4A3
		bclr	<BitFlags36_t3 $10

loc_A4A3:				; CODE XREF: sub_A327+177j
		brclr	<BitFlags27 2 loc_A4AB
		brclr	<StartupSwitchMirror1 1	loc_A4C7

loc_A4AB:				; CODE XREF: sub_A327:loc_A4A3j
		brclr	<BitFlags68_t3 $80 loc_A4C7
		ldx	#$87AE
		brclr	<StartupSwitchMirror1 $10 loc_A4B9
		ldx	#$87B9

loc_A4B9:				; CODE XREF: sub_A327+18Bj
		ldaa	<CoolantTemp
		jsr	Lookup4ByteTable
		jsr	sub_A5BA
		clra
		staa	<Timer_AisChanges
		bclr	<BitFlags68_t3 $80

loc_A4C7:				; CODE XREF: sub_A327+180j
					; sub_A327:loc_A4ABj
		ldab	byte_87A7
		cmpb	<Timer_AisChanges
		bcc	locret_A4FE
		ldx	#$876B
		ldd	<TargetIdleSpeedHB
		subd	<EngineRpm_HB
		bcc	loc_A4DE
		ldx	#$877E
		ldd	<EngineRpm_HB
		subd	<TargetIdleSpeedHB

loc_A4DE:				; CODE XREF: sub_A327+1AEj
		lsrd
		lsrd
		brset	<BitFlags27 1 loc_A4E8
		brset	<BitFlags68_t3 $10 loc_A4E9

loc_A4E8:				; CODE XREF: sub_A327+1B9j
		lsrd

loc_A4E9:				; CODE XREF: sub_A327+1BDj
		tsta
		beq	loc_A4EE
		ldab	#$FF

loc_A4EE:				; CODE XREF: sub_A327+1C3j
		tba
		cmpa	1,x
		bcs	locret_A4FE
		jsr	Lookup4ByteTable
		beq	locret_A4FE
		jsr	sub_A5BA
		clra
		staa	<Timer_AisChanges

locret_A4FE:				; CODE XREF: sub_A327+1A5j
					; sub_A327+1CAj ...
		rts
; ---------------------------------------------------------------------------

loc_A4FF:				; CODE XREF: sub_A327:loc_A48FJ
		ldaa	<CoolantTemp
		ldx	#$86F5
		jsr	Lookup4ByteTable
		staa	Temp5
		ldaa	<KeyOnOrEngineRunningTime
		ldx	#$8704
		jsr	Lookup4ByteTable
		adda	Temp5
		bcc	loc_A51A
		jmp	loc_A59C
; ---------------------------------------------------------------------------

loc_A51A:				; CODE XREF: sub_A327+1EEj
		staa	Temp5
		ldaa	<BaroPressure
		ldx	#$872D
		jsr	Lookup4ByteTable
		ldaa	Temp5
		mul
		lsld
		bcs	loc_A59C
		lsld
		bcs	loc_A59C
		staa	Temp5
		ldx	#$871E
		ldaa	<EngineRpm_HB
		jsr	Lookup4ByteTable
		cmpa	Temp5
		bcs	loc_A542
		staa	Temp5

loc_A542:				; CODE XREF: sub_A327+216j
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		ldx	#$870F
		jsr	Lookup4ByteTable
		cmpa	Temp5
		bcc	loc_A552
		ldaa	Temp5

loc_A552:				; CODE XREF: sub_A327+226j
		brset	<BitFlags68_t3 4 loc_A57C
		ldab	byte_86E0
		brset	<BitFlags66_t3 $20 loc_A579
		psha
		ldaa	<CoolantTemp
		cmpa	byte_86E1
		bcs	loc_A578
		ldx	#$86E5
		ldaa	<VehicleSpeedx8_Scaled
		jsr	Lookup4ByteTable
		brclr	<BitFlags68_t3 8 loc_A578
		ldaa	byte_86E3
		mul
		adca	#0
		tab

loc_A578:				; CODE XREF: sub_A327+23Cj
					; sub_A327+246j
		pula

loc_A579:				; CODE XREF: sub_A327+232j
		aba
		bcs	loc_A59C

loc_A57C:				; CODE XREF: sub_A327:loc_A552j
		brset	<BitFlags68_t3 $10 loc_A585
		adda	byte_86F4
		bcs	loc_A59C

loc_A585:				; CODE XREF: sub_A327:loc_A57Cj
		brclr	<StartupSwitchMirror1 $40 loc_A58E
		adda	byte_87AD
		bcs	loc_A59C

loc_A58E:				; CODE XREF: sub_A327:loc_A41BJ
					; sub_A327:loc_A585j
		brset	<BitFlags36_t3 $10 loc_A597
		adda	byte_87AC
		bcs	loc_A59C

loc_A597:				; CODE XREF: sub_A327:loc_A58Ej
		cmpa	byte_87A8
		bcs	loc_A59F

loc_A59C:				; CODE XREF: sub_A327+F1J
					; sub_A327+1F0J ...
		ldaa	byte_87A8

loc_A59F:				; CODE XREF: sub_A327+273j
		brset	<BitFlags66_t3 $20 loc_A5B4
		cmpa	<DesiredNewAisPosition
		bcc	loc_A5B1
		ldab	<Counter_MainLoop
		bitb	byte_87AB
		bne	locret_A5B3
		ldaa	<DesiredNewAisPosition
		deca

loc_A5B1:				; CODE XREF: sub_A327+27Ej
		staa	<DesiredNewAisPosition

locret_A5B3:				; CODE XREF: sub_A327+285j
		rts
; ---------------------------------------------------------------------------

loc_A5B4:				; CODE XREF: sub_A327:loc_A59Fj
		bclr	<BitFlags66_t3 $20
		staa	<DesiredNewAisPosition
		rts
; End of function sub_A327


; =============== S U B	R O U T	I N E =======================================


sub_A5BA:				; CODE XREF: sub_A327:loc_A466P
					; sub_A327+197P ...
		inx
		tsta
		bmi	loc_A5CC
		adda	<DesiredNewAisPosition
		ldab	byte_87A8
		bcs	loc_A5C8
		cba
		bcs	loc_A5C9

loc_A5C8:				; CODE XREF: sub_A5BA+9j
		tba

loc_A5C9:				; CODE XREF: sub_A5BA+Cj
		staa	<DesiredNewAisPosition
		rts
; ---------------------------------------------------------------------------

loc_A5CC:				; CODE XREF: sub_A5BA+2j
		adda	<DesiredNewAisPosition
		bcs	loc_A5D1
		clra

loc_A5D1:				; CODE XREF: sub_A5BA+14j
		staa	<DesiredNewAisPosition
		rts
; End of function sub_A5BA


; =============== S U B	R O U T	I N E =======================================


sub_A5D4:				; CODE XREF: sub_A327:loc_A433P
		ldx	#0
		ldab	<BitFlags68_t3
		andb	#4
		stab	Temp4
		ldab	<BitFlags68_t3
		andb	#$40
		lsrb
		lsrb
		lsrb
		lsrb
		eorb	Temp4
		bne	loc_A608
		brset	<BitFlags68_t3 4 loc_A659
		ldaa	<Timer_AisOrO2Sensor
		beq	loc_A604
		clrb
		stab	<Timer_AisChanges
		deca
		staa	<Timer_AisOrO2Sensor
		bne	loc_A659
		brset	<BitFlags66_t3 $80 loc_A604
		ldaa	byte_8792
		bsr	sub_A5BA

loc_A604:				; CODE XREF: sub_A5D4+1Dj sub_A5D4+27j
		bclr	<BitFlags68_t3 8
		rts
; ---------------------------------------------------------------------------

loc_A608:				; CODE XREF: sub_A5D4+15j
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	byte_884C
		bcs	loc_A659
		eorb	<BitFlags68_t3
		stab	<BitFlags68_t3
		bitb	#4
		bne	loc_A632
		ldaa	byte_86E2
		staa	<Timer_AisOrO2Sensor
		brset	<BitFlags66_t3 $80 loc_A629
		ldaa	byte_8791
		jsr	sub_A5BA
		bset	<BitFlags2f 8

loc_A629:				; CODE XREF: sub_A5D4+48j
		ldaa	<Timer_AisOrO2Sensor
		beq	loc_A656
		deca
		staa	<Timer_AisOrO2Sensor
		bra	loc_A656
; ---------------------------------------------------------------------------

loc_A632:				; CODE XREF: sub_A5D4+41j
		brset	<BitFlags66_t3 $80 loc_A63E
		ldaa	byte_8793
		jsr	sub_A5BA
		bra	loc_A653
; ---------------------------------------------------------------------------

loc_A63E:				; CODE XREF: sub_A5D4:loc_A632j
		ldx	#$86E5
		ldaa	<VehicleSpeedx8_Scaled
		jsr	Lookup4ByteTable
		ldab	byte_86E4
		mul
		tab
		ldaa	<DesiredNewAisPosition
		sba
		bcc	loc_A651
		clra

loc_A651:				; CODE XREF: sub_A5D4+7Aj
		staa	<DesiredNewAisPosition

loc_A653:				; CODE XREF: sub_A5D4+68j
		clra
		staa	<Timer_AisOrO2Sensor

loc_A656:				; CODE XREF: sub_A5D4+57j sub_A5D4+5Cj
		clra
		staa	<Timer_AisChanges

loc_A659:				; CODE XREF: sub_A5D4+17j sub_A5D4+25j ...
		bset	<BitFlags68_t3 8
		rts
; End of function sub_A5D4


; =============== S U B	R O U T	I N E =======================================


sub_A65D:				; CODE XREF: __RESET+5E9P
		brclr	<IPL1 $40 locret_A673
		brset	<BitFlags36_t3 $20 locret_A673
		brset	<BitFlags66_t3 $80 locret_A673
		ldaa	<b5C_IPL1_t3
		bita	#$88
		bne	locret_A673
		ldaa	<TimerOverflowsBetweenCamPulses
		beq	loc_A674

locret_A673:				; CODE XREF: sub_A65Dj	sub_A65D+4j ...
		rts
; ---------------------------------------------------------------------------

loc_A674:				; CODE XREF: sub_A65D+14j
		ldaa	<Timer_DacalCountdown
		lsra
		lsra
		brclr	<StartupSwitchMirror1 $40 loc_A68E
		tst	byte_883D
		bmi	loc_A688
		adda	byte_883D
		bcs	loc_A6C9
		bra	loc_A68E
; ---------------------------------------------------------------------------

loc_A688:				; CODE XREF: sub_A65D+22j
		adda	byte_883D
		bcs	loc_A68E
		clra

loc_A68E:				; CODE XREF: sub_A65D+1Bj sub_A65D+29j ...
		adda	byte_883C
		bcs	loc_A6C9
		psha
		ldx	#$87C4
		ldaa	<BaroPressure
		jsr	Lookup4ByteTable
		pula
		negb
		sba
		bcc	loc_A6A2
		clra

loc_A6A2:				; CODE XREF: sub_A65D+42j
		brclr	<BitFlags66_t3 4 loc_A6CB
		psha
		ldx	#$87D7
		ldaa	<KeyOnOrEngineRunningTime
		jsr	Lookup4ByteTable
		pula
		aba
		bcs	loc_A6C9
		psha
		ldx	#$87E2
		ldaa	<CoolantTemp
		jsr	Lookup4ByteTable
		pulb
		aba
		bcs	loc_A6C9
		brset	<PIA2_Buffer_t3	1 loc_A6CB
		adda	byte_883B
		bcc	loc_A6CB

loc_A6C9:				; CODE XREF: sub_A65D+27j sub_A65D+34j ...
		ldaa	#$FF

loc_A6CB:				; CODE XREF: sub_A65D:loc_A6A2j
					; sub_A65D+63j	...
		ldab	<DistributorFallingEdgePulsewidth_HB
		aslb
		bcs	loc_A6D3
		aslb
		bcc	loc_A6D5

loc_A6D3:				; CODE XREF: sub_A65D+71j
		ldab	#$FF

loc_A6D5:				; CODE XREF: sub_A65D+74j
		mul
		lsld
		bcs	loc_A704
		staa	Temp5
		ldx	#$87F5
		ldaa	<EngineRpm_HB
		jsr	Lookup4ByteTable
		psha
		ldx	#$880F
		ldaa	<CoolantTemp
		jsr	Lookup4ByteTable
		pulb
		mul
		adca	Temp5
		bcs	loc_A704
		staa	Temp5
		ldx	#$8804
		ldaa	<BaroPressure
		jsr	Lookup4ByteTable
		adda	Temp5
		bcc	loc_A706

loc_A704:				; CODE XREF: sub_A65D+7Aj sub_A65D+95j
		ldaa	#$FF

loc_A706:				; CODE XREF: sub_A65D+A5j
		staa	<MAPOffsetForCylTrim
		brset	<BitFlags66_t3 4 loc_A750
		brset	<BitFlags27 1 loc_A714
		brclr	<StartupSwitchMirror1 $10 loc_A74E

loc_A714:				; CODE XREF: sub_A65D+AFj
		ldab	<Counter_MainLoop
		bitb	byte_883F
		bne	loc_A74E
		ldab	<KeyOnOrEngineRunningTime
		cmpb	byte_883E
		bcs	loc_A74E
		brclr	<PIA2_Buffer_t3	1 loc_A74E
		ldab	<Timer_CountdownFromStartRunForAisFeedback
		bne	loc_A74E
		ldab	<CoolantTemp
		cmpb	byte_8839
		bcs	loc_A74E
		ldab	<TargetIdleSpeedHB
		subb	<EngineRpm_HB
		bcc	loc_A738
		negb

loc_A738:				; CODE XREF: sub_A65D+D8j
		cmpb	byte_883A
		bhi	loc_A74E
		ldab	<Timer_DacalCountdown
		cmpa	<MapValue
		bhi	loc_A746
		incb
		bne	loc_A74A

loc_A746:				; CODE XREF: sub_A65D+E4j
		tstb
		beq	loc_A752
		decb

loc_A74A:				; CODE XREF: sub_A65D+E7j
		stab	<Timer_DacalCountdown
		bra	loc_A752
; ---------------------------------------------------------------------------

loc_A74E:				; CODE XREF: sub_A65D+B3j sub_A65D+BCj ...
		bra	locret_A7BB
; ---------------------------------------------------------------------------

loc_A750:				; CODE XREF: sub_A65D+ABj
		bra	loc_A7BC
; ---------------------------------------------------------------------------

loc_A752:				; CODE XREF: sub_A65D+EAj sub_A65D+EFj
		brset	<BitFlags27 1 loc_A75A
		brclr	<BitFlags68_t3 $10 locret_A7BB

loc_A75A:				; CODE XREF: sub_A65D:loc_A752j
		ldaa	<Timer_AisChanges
		cmpa	byte_87A7
		bcs	locret_A7BB
		brset	<StartupSwitchMirror1 $40 loc_A786
		brclr	<BitFlags2f $20	loc_A775
		ldaa	byte_87AC
		staa	<CurrentAisPosition
		staa	<DesiredNewAisPosition
		bclr	<BitFlags2f $20
		bra	locret_A7BB
; ---------------------------------------------------------------------------

loc_A775:				; CODE XREF: sub_A65D+108j
		ldaa	<CurrentAisPosition
		cmpa	<DesiredNewAisPosition
		bne	locret_A7BB
		ldaa	<DesiredNewAisPosition
		cmpa	byte_87AC
		beq	locret_A7BB
		bhi	loc_A7B6
		bra	loc_A7B4
; ---------------------------------------------------------------------------

loc_A786:				; CODE XREF: sub_A65D+104j
		brclr	<BitFlags2f $20	loc_A79D
		ldaa	byte_87AC
		adda	byte_87AD
		bcc	loc_A794
		ldaa	#$FF

loc_A794:				; CODE XREF: sub_A65D+133j
		staa	<CurrentAisPosition
		staa	<DesiredNewAisPosition
		bclr	<BitFlags2f $20
		bra	locret_A7BB
; ---------------------------------------------------------------------------

loc_A79D:				; CODE XREF: sub_A65D:loc_A786j
		ldaa	<CurrentAisPosition
		cmpa	<DesiredNewAisPosition
		bne	locret_A7BB
		ldaa	<DesiredNewAisPosition
		ldab	byte_87AC
		addb	byte_87AD
		bcc	loc_A7AF
		ldab	#$FF

loc_A7AF:				; CODE XREF: sub_A65D+14Ej
		cba
		beq	locret_A7BB
		bhi	loc_A7B6

loc_A7B4:				; CODE XREF: sub_A65D+127j
		inca
		inca

loc_A7B6:				; CODE XREF: sub_A65D+125j
					; sub_A65D+155j
		deca
		staa	<DesiredNewAisPosition
		staa	<CurrentAisPosition

locret_A7BB:				; CODE XREF: sub_A65D:loc_A74Ej
					; sub_A65D+F9j	...
		rts
; ---------------------------------------------------------------------------

loc_A7BC:				; CODE XREF: sub_A65D:loc_A750j
		ldab	<Timer_CountdownFromStartRunForAisFeedback
		bne	locret_A7BB
		ldab	<Timer_AisChanges
		cmpb	byte_8838
		bcs	locret_A7BB
		ldx	#$881A
		suba	<MapValue
		bcc	loc_A7D2
		nega
		ldx	#$8829

loc_A7D2:				; CODE XREF: sub_A65D+16Fj
		jsr	Lookup4ByteTable
		jsr	sub_A5BA
		staa	<DesiredNewAisPosition
		cmpa	<CurrentAisPosition
		beq	locret_A7BB
		clr	Timer_AisChanges
		rts
; End of function sub_A65D


; =============== S U B	R O U T	I N E =======================================


sub_A7E2:				; CODE XREF: __RESET+5ECP
		brset	<BitFlags66_t3 4 locret_A801
		ldaa	<b5C_IPL1_t3
		bita	#$88
		bne	locret_A801
		ldaa	<DesiredNewAisPosition
		oraa	<CurrentAisPosition
		bne	locret_A801
		ldab	<Counter_MainLoop
		bitb	#$7F
		bne	locret_A801
		adda	#2
		staa	<CurrentAisPosition
		staa	<DesiredNewAisPosition
		bset	<BitFlags36_t3 $10

locret_A801:				; CODE XREF: sub_A7E2j	sub_A7E2+8j ...
		rts
; End of function sub_A7E2


; =============== S U B	R O U T	I N E =======================================


sub_A802:				; CODE XREF: __RESET+5C2P

; FUNCTION CHUNK AT AB74 SIZE 00000110 BYTES
; FUNCTION CHUNK AT AC95 SIZE 00000170 BYTES
; FUNCTION CHUNK AT AE35 SIZE 00000044 BYTES

		brclr	<b5C_IPL1_t3 $40 loc_A80E
		bclr	<Counter_Cruise_1 $F
		bset	<Counter_Cruise_1 $E
		bra	loc_A87C
; ---------------------------------------------------------------------------

loc_A80E:				; CODE XREF: sub_A802j
		bclr	<Counter_Cruise_1 $F
		brset	<StartupSwitchMirror1 4	loc_A81A
		clrb
		stab	<CruiseSpeedSetpoint
		bra	loc_A885
; ---------------------------------------------------------------------------

loc_A81A:				; CODE XREF: sub_A802+Fj
		inc	Counter_Cruise_1
		ldd	<VehicleSpeed_HB
		lsld
		lsld
		lsld
		aslb
		adca	#0
		staa	Temp0
		cmpa	byte_8918
		bcs	loc_A87C
		inc	Counter_Cruise_1
		ldaa	<EngineRpm_HB
		cmpa	byte_8919
		bcc	loc_A87C
		inc	Counter_Cruise_1
		brset	<StartupSwitchMirror1 $20 loc_A87C
		inc	Counter_Cruise_1
		brset	<BitFlags27 1 loc_A851
		brclr	<StartupSwitchMirror1 $10 loc_A87C
		inc	Counter_Cruise_1
		inc	Counter_Cruise_1
		bra	loc_A8AE
; ---------------------------------------------------------------------------

loc_A851:				; CODE XREF: sub_A802+3Fj
		inc	Counter_Cruise_1
		ldaa	<TimerOverflowsBetweenCamPulses
		bne	loc_A871
		brclr	<BitFlags2f 2 loc_A865
		brset	<CruiseStatus_1	$80 loc_A87C
		bset	<BitFlags2f 4
		bra	loc_A87C
; ---------------------------------------------------------------------------

loc_A865:				; CODE XREF: sub_A802+56j
		ldab	<ScaledDistPWForCruiseControl
		cmpb	byte_8916
		bcc	loc_A87C
		cmpb	byte_8917
		bcs	loc_A87C

loc_A871:				; CODE XREF: sub_A802+54j
		inc	Counter_Cruise_1
		brset	<CruiseStatus_1	$80 loc_A8AE
		brclr	<BitFlags24 8 loc_A8AE

loc_A87C:				; CODE XREF: sub_A802+Aj sub_A802+29j	...
		brclr	<CruiseStatus_1	$18 loc_A885
		ldaa	Temp0
		staa	<CruiseSpeedSetpoint

loc_A885:				; CODE XREF: sub_A802+16j
					; sub_A802:loc_A87Cj
		brset	<CruiseStatus_1	$80 loc_A892
		ldab	<Counter_Cruise_1
		andb	#$F
		ldaa	#$11
		mul
		stab	<Counter_Cruise_1

loc_A892:				; CODE XREF: sub_A802:loc_A885j
		clrb
		stab	<Timer_CruiseDecelerate
		stab	<Counter_Cruise_4
		stab	<CruiseControlVar0
		stab	<Counter_Cruise_2
		stab	<CruiseControlVar6
		stab	<CruiseControlVar1
		bclr	<CruiseStatus_1	$1F
		bset	<CruiseStatus_1	$A0
		bclr	<CruiseStatus_2	$F
		bset	<Timer_CruiseDecelerate	$80
		jmp	loc_AA64
; ---------------------------------------------------------------------------

loc_A8AE:				; CODE XREF: sub_A802+4Dj sub_A802+72j ...
		inc	Counter_Cruise_1
		ldaa	Temp1_t3
		tab
		eora	PIA2_Buffer_t3_Temp
		anda	#$C0
		beq	loc_A913
		brset	<BitFlags6a_t3 1 loc_A913
		bita	#$40
		bne	loc_A8C5
		lsrb

loc_A8C5:				; CODE XREF: sub_A802+C0j
		ldaa	#0
		bitb	#$40
		bne	loc_A901
		brset	<CruiseStatus_1	$80 loc_A8F6
		ldaa	Temp0
		psha
		ldd	#$F89
		jsr	ThrowNonCriticalError_
		pula
		staa	Temp0
		ldd	#$F08
		ldx	#$DC
		cmpa	0,x
		beq	loc_A8EC
		inx
		cmpa	0,x
		bne	loc_A913

loc_A8EC:				; CODE XREF: sub_A802+E3j
		cmpb	2,x
		bne	loc_A913
		clr	0,x
		clr	2,x
		bra	loc_A87C
; ---------------------------------------------------------------------------

loc_A8F6:				; CODE XREF: sub_A802+C9j
		ldaa	#7
		ldab	Temp1_t3
		bitb	#$C0
		bne	loc_A901
		ldaa	#$7F

loc_A901:				; CODE XREF: sub_A802+C7j sub_A802+FBj
		bita	<Counter_MainLoop
		bne	loc_A913
		ldaa	Temp0
		psha
		ldd	#$F10
		jsr	ThrowNonCriticalError_
		pula
		staa	Temp0

loc_A913:				; CODE XREF: sub_A802+B8j sub_A802+BAj ...
		inc	Counter_Cruise_1
		brset	<StartupSwitchMirror1 2	loc_A96E
		ldab	<Timer_CruiseDecelerate
		incb
		bne	loc_A920
		decb

loc_A920:				; CODE XREF: sub_A802+11Bj
		stab	<Timer_CruiseDecelerate
		brset	<CruiseStatus_1	1 loc_A93F
		brset	<Timer_CruiseDecelerate	$80 loc_A949
		cmpb	#4
		bls	loc_A949
		bset	<CruiseStatus_1	$21
		bclr	<CruiseStatus_1	$A
		bset	<CruiseStatus_2	4
		clra
		staa	<Counter_Cruise_4
		staa	<CruiseControlVar0
		bclr	<CruiseStatus_1	4

loc_A93F:				; CODE XREF: sub_A802+120j
		brset	<CruiseStatus_1	$80 loc_A949
		brset	<CruiseStatus_1	$10 loc_A95C
		bra	loc_A94C
; ---------------------------------------------------------------------------

loc_A949:				; CODE XREF: sub_A802+124j
					; sub_A802+12Aj ...
		jmp	loc_AB74
; ---------------------------------------------------------------------------

loc_A94C:				; CODE XREF: sub_A802+145j
		cmpb	byte_890F
		bls	loc_A949
		bset	<CruiseStatus_1	$10
		bclr	<CruiseStatus_2	3
		ldaa	Temp0
		staa	<CruiseControlVar0

loc_A95C:				; CODE XREF: sub_A802+141j
		ldab	<CruiseStatus_2
		cmpb	#$A0
		bcs	loc_A949
		ldab	<CruiseControlVar0
		subb	byte_8925
		bcc	loc_A96A
		clrb

loc_A96A:				; CODE XREF: sub_A802+165j
		stab	<CruiseControlVar0
		bra	loc_A949
; ---------------------------------------------------------------------------

loc_A96E:				; CODE XREF: sub_A802+114j
		brclr	<CruiseStatus_1	1 loc_A9D5
		ldaa	#$7F
		brset	<CruiseStatus_1	$80 loc_A9A8
		brset	<CruiseStatus_2	8 loc_A987
		ldab	<CruiseSpeedSetpoint
		subb	Temp0
		bcc	loc_A987
		cmpb	#$FC
		bcs	loc_A9A8

loc_A987:				; CODE XREF: sub_A802+176j
					; sub_A802+17Fj
		brset	<CruiseStatus_1	$10 loc_A98D
		bra	loc_A9AE
; ---------------------------------------------------------------------------

loc_A98D:				; CODE XREF: sub_A802:loc_A987j
		ldaa	<Counter_Cruise_4
		ldab	byte_8924
		addb	#$80
		bmi	loc_A99D
		mul
		adca	<Counter_Cruise_4
		bcs	loc_A9A4
		bra	loc_A9A0
; ---------------------------------------------------------------------------

loc_A99D:				; CODE XREF: sub_A802+192j
		mul
		adca	#0

loc_A9A0:				; CODE XREF: sub_A802+199j
		cmpa	#$7F
		bls	loc_A9AE

loc_A9A4:				; CODE XREF: sub_A802+197j
		ldaa	#$7F
		bra	loc_A9AE
; ---------------------------------------------------------------------------

loc_A9A8:				; CODE XREF: sub_A802+172j
					; sub_A802+183j
		bset	<CruiseStatus_2	1
		clrb
		stab	<CruiseControlVar6

loc_A9AE:				; CODE XREF: sub_A802+189j
					; sub_A802+1A0j ...
		ldab	Temp0
		stab	<CruiseSpeedSetpoint
		staa	Temp2
		jsr	sub_AB3C
		ldab	Temp2
		cba
		bhi	loc_A9C0
		tab

loc_A9C0:				; CODE XREF: sub_A802+1BBj
		bclr	<CruiseStatus_1	$91
		bclr	<CruiseStatus_2	8
		bclr	<BitFlags24 8
		clra
		staa	<Counter_Cruise_4
		staa	<Timer_CruiseDecelerate
		staa	<CruiseControlVar0
		staa	<Counter_Cruise_2
		jmp	loc_AA64
; ---------------------------------------------------------------------------

loc_A9D5:				; CODE XREF: sub_A802:loc_A96Ej
		clrb
		stab	<Timer_CruiseDecelerate
		brset	<StartupSwitchMirror1 8	loc_A9DF
		jmp	loc_AAD6
; ---------------------------------------------------------------------------

loc_A9DF:				; CODE XREF: sub_A802+1D6j
		ldab	<Counter_Cruise_4
		incb
		bne	loc_A9E5
		decb

loc_A9E5:				; CODE XREF: sub_A802+1E0j
		stab	<Counter_Cruise_4
		brclr	<CruiseStatus_1	2 loc_A9EE
		jmp	loc_AA80
; ---------------------------------------------------------------------------

loc_A9EE:				; CODE XREF: sub_A802+1E5j
		brclr	<CruiseStatus_1	$20 loc_A9F5
		jmp	loc_AB1D
; ---------------------------------------------------------------------------

loc_A9F5:				; CODE XREF: sub_A802:loc_A9EEj
		cmpb	#4
		bhi	loc_A9FC
		jmp	loc_AB74
; ---------------------------------------------------------------------------

loc_A9FC:				; CODE XREF: sub_A802+1F5j
		bset	<CruiseStatus_1	6
		bset	<CruiseStatus_2	4
		clra
		staa	<Counter_Cruise_2
		brclr	<CruiseStatus_1	$80 loc_AA41
		bset	<CruiseStatus_1	$20
		bclr	<CruiseStatus_1	$80
		bclr	<BitFlags24 8
		jsr	sub_AB3C
		staa	Temp2
		ldaa	<CruiseSpeedSetpoint
		suba	Temp0
		bcc	loc_AA22
		tab
		eorb	#$80

loc_AA22:				; CODE XREF: sub_A802+21Bj
		bpl	loc_AA29
		asla
		ldaa	#$80
		sbca	#0

loc_AA29:				; CODE XREF: sub_A802:loc_AA22j
		adda	#$80
		ldx	#$898F
		jsr	Lookup4ByteTable
		addb	#$80
		addb	Temp2
		bpl	loc_AA7B
		bvc	loc_AA3E
		ldab	#$7F
		bra	loc_AA7B
; ---------------------------------------------------------------------------

loc_AA3E:				; CODE XREF: sub_A802+236j
		clrb
		bra	loc_AA7B
; ---------------------------------------------------------------------------

loc_AA41:				; CODE XREF: sub_A802+203j
		bclr	<CruiseStatus_2	3
		ldaa	<CruiseSpeedSetpoint
		adda	#4
		staa	<CruiseSpeedSetpoint
		ldab	<CruiseControlVar2
		suba	#3
		cmpa	byte_8914
		bhi	loc_AA64
		ldab	byte_891A
		ldaa	<CruiseControlVar2
		bmi	loc_AA64
		aba
		bcs	loc_AA61
		cmpa	#$7F
		bls	loc_AA63

loc_AA61:				; CODE XREF: sub_A802+259j
		ldaa	#$7F

loc_AA63:				; CODE XREF: sub_A802+25Dj
		tab

loc_AA64:				; CODE XREF: sub_A802+A9J
					; sub_A802+1D0J ...
		ldaa	<CruiseSpeedSetpoint
		cmpa	byte_8914
		bls	loc_AA73
		bclr	<CruiseStatus_2	3
		ldaa	byte_8914
		bra	loc_AA79
; ---------------------------------------------------------------------------

loc_AA73:				; CODE XREF: sub_A802+267j
		cmpa	byte_8915
		bcc	loc_AA7B
		clra

loc_AA79:				; CODE XREF: sub_A802+26Fj
		staa	<CruiseSpeedSetpoint

loc_AA7B:				; CODE XREF: sub_A802+234j
					; sub_A802+23Aj ...
		stab	<CruiseControlVar2

loc_AA7D:				; CODE XREF: sub_A802:loc_AA80j
					; sub_A802+289j ...
		jmp	loc_AB74
; ---------------------------------------------------------------------------

loc_AA80:				; CODE XREF: sub_A802+1E9J
		brset	<CruiseStatus_1	$20 loc_AA7D
		brset	<CruiseStatus_1	8 loc_AA9F
		cmpb	byte_8910
		bls	loc_AA7D
		bset	<CruiseStatus_1	8
		bset	<CruiseStatus_2	8
		ldaa	Temp0
		adda	byte_8927
		bcc	loc_AA9D
		ldaa	#$FF

loc_AA9D:				; CODE XREF: sub_A802+297j
		staa	<CruiseControlVar0

loc_AA9F:				; CODE XREF: sub_A802+282j
		ldaa	Temp0
		cmpa	byte_8914
		bcs	loc_AAAE
		bset	<CruiseStatus_1	$20

loc_AAAA:				; DATA XREF: RESERVED:DFDEw
		ldab	<CruiseControlVar2
		bra	loc_AB06
; ---------------------------------------------------------------------------

loc_AAAE:				; CODE XREF: sub_A802+2A3j
		ldab	<CruiseStatus_2
		cmpb	#$A0
		bcs	loc_AA7D
		ldab	<CruiseControlVar0
		subb	byte_8926
		bcc	loc_AABC
		clrb

loc_AABC:				; CODE XREF: sub_A802+2B7j
		cmpb	byte_8914
		bcc	loc_AAD2
		adda	byte_8928
		bcs	loc_AACF
		cba
		bls	loc_AAD2
		tab
		cmpb	byte_8914
		bls	loc_AAD2

loc_AACF:				; CODE XREF: sub_A802+2C2j
		ldab	byte_8914

loc_AAD2:				; CODE XREF: sub_A802+2BDj
					; sub_A802+2C5j ...
		stab	<CruiseControlVar0
		bra	loc_AA7D
; ---------------------------------------------------------------------------

loc_AAD6:				; CODE XREF: sub_A802+1DAJ
		bclr	<CruiseStatus_1	2
		ldaa	<CruiseSpeedSetpoint
		beq	loc_AAE0
		bclr	<CruiseStatus_1	$20

loc_AAE0:				; CODE XREF: sub_A802+2D9j
		brclr	<CruiseStatus_1	8 loc_AB1D
		ldaa	<Counter_Cruise_4
		cmpa	#$5D
		bhi	loc_AAF4
		bclr	<CruiseStatus_1	8
		bclr	<CruiseStatus_2	8
		stab	<CruiseControlVar0
		bra	loc_AB1D
; ---------------------------------------------------------------------------

loc_AAF4:				; CODE XREF: sub_A802+2E6j
		ldaa	Temp0
		adda	#4
		suba	<CruiseSpeedSetpoint
		bcc	loc_AAFE
		clra

loc_AAFE:				; CODE XREF: sub_A802+2F9j
		ldx	#$89CC
		jsr	Lookup4ByteTable
		orab	#$80

loc_AB06:				; CODE XREF: sub_A802+2AAj
		ldaa	Temp0
		staa	<CruiseSpeedSetpoint
		bclr	<CruiseStatus_1	$C
		bclr	<CruiseStatus_2	8
		clra
		staa	<CruiseControlVar0
		staa	<Counter_Cruise_4
		tstb
		bmi	loc_AB1A
		clrb

loc_AB1A:				; CODE XREF: sub_A802+315j
		jmp	loc_AA64
; ---------------------------------------------------------------------------

loc_AB1D:				; CODE XREF: sub_A802+1F0J
					; sub_A802:loc_AAE0j ...
		clrb
		stab	<Counter_Cruise_4
		ldaa	<CruiseStatus_2
		eora	#4
		bita	#7
		bne	loc_AB74
		ldaa	<Counter_MainLoop
		bne	loc_AB74
		ldab	<Counter_Cruise_2
		incb
		cmpb	byte_891F
		bcs	loc_AB38
		bclr	<CruiseStatus_2	4
		clrb

loc_AB38:				; CODE XREF: sub_A802+330j
		stab	<Counter_Cruise_2
		bra	loc_AB74
; End of function sub_A802


; =============== S U B	R O U T	I N E =======================================


sub_AB3C:				; CODE XREF: sub_A802+1B4P
					; sub_A802+210P
		ldaa	<CruiseSpeedSetpoint
		ldx	#$8969
		jsr	Lookup4ByteTable
		bpl	loc_AB48
		ldab	#$7F

loc_AB48:				; CODE XREF: sub_AB3C+8j
		stab	Temp1
		ldaa	<MapVolts
		ldx	#$8978
		jsr	Lookup4ByteTable
		ldab	Temp1
		aslb
		mul
		adca	#0
		bpl	loc_AB5E
		ldaa	#$7F

loc_AB5E:				; CODE XREF: sub_AB3C+1Ej
		ldx	#$12
		ldab	<CruiseSpeedSetpoint
		cmpb	byte_8929
		bls	loc_AB69
		dex

loc_AB69:				; CODE XREF: sub_AB3C+2Aj
		adda	0,x
		bpl	locret_AB70
		bvs	loc_AB71
		clra

locret_AB70:				; CODE XREF: sub_AB3C+2Fj
		rts
; ---------------------------------------------------------------------------

loc_AB71:				; CODE XREF: sub_AB3C+31j
		ldaa	#$7F
		rts
; End of function sub_AB3C

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_A802

loc_AB74:				; CODE XREF: sub_A802:loc_A949J
					; sub_A802+1F7J ...
		brset	<CruiseStatus_1	$80 loc_AB89
		inc	Counter_Cruise_1
		brclr	<CruiseStatus_1	$18 loc_AB89
		inc	Counter_Cruise_1
		brset	<CruiseStatus_1	8 loc_AB89
		inc	Counter_Cruise_1

loc_AB89:				; CODE XREF: sub_A802:loc_AB74j
					; sub_A802+379j ...
		ldaa	<CruiseStatus_2
		adda	#$10
		cmpa	#$B0
		bcs	loc_AB93
		anda	#$F

loc_AB93:				; CODE XREF: sub_A802+38Dj
		staa	<CruiseStatus_2
		anda	#$F0
		beq	loc_AB9C
		jmp	loc_AE35
; ---------------------------------------------------------------------------

loc_AB9C:				; CODE XREF: sub_A802+395j
		clrb
		brclr	<BitFlags24 $10	loc_ABA4
		jmp	loc_AC80
; ---------------------------------------------------------------------------

loc_ABA4:				; CODE XREF: sub_A802+39Bj
		ldy	#$3E
		ldx	#$D000
		ldd	#$6DD
		brclr	<TimerOverflowsBetweenSpeedoPulses $FF loc_ABBF
		clrb
		clra
		brset	<TimerOverflowsBetweenSpeedoPulses $40 loc_ABC4
		ldab	#6
		dey
		ldx	#$DDD0

loc_ABBF:				; CODE XREF: sub_A802+3ACj
		sei
		jsr	sub_E6C0
		cli

loc_ABC4:				; CODE XREF: sub_A802+3B2j
		ldx	<VehicleSpeed_HB
		stx	Temp0
		std	<VehicleSpeed_HB
		brclr	<CruiseStatus_2	2 loc_AC3A
		ldaa	<Counter_Cruise_2
		brclr	<CruiseStatus_2	1 loc_ABE5
		cmpa	byte_8933
		bcc	loc_ABDF
		inca
		staa	<Counter_Cruise_2
		bra	loc_AC3A
; ---------------------------------------------------------------------------

loc_ABDF:				; CODE XREF: sub_A802+3D6j
		bclr	<CruiseStatus_2	1
		clra
		staa	<Counter_Cruise_2

loc_ABE5:				; CODE XREF: sub_A802+3CFj
		cmpa	byte_8932
		bcs	loc_AC3C
		ldab	<CruiseControlVar6
		tba
		bpl	loc_ABF0
		negb

loc_ABF0:				; CODE XREF: sub_A802+3EBj
		cmpb	byte_892B
		bcs	loc_AC34
		ldx	#$12
		ldab	<CruiseSpeedSetpoint
		cmpb	byte_8929
		bls	loc_AC00
		dex

loc_AC00:				; CODE XREF: sub_A802+3FBj
		ldab	0,x
		adda	2,x
		bvc	loc_AC0B
		asla
		ldaa	#$80
		sbca	#0

loc_AC0B:				; CODE XREF: sub_A802+402j
		staa	2,x
		cmpa	byte_892C
		bgt	loc_AC24
		cmpa	byte_892D
		bge	loc_AC34
		subb	byte_892F
		cmpb	byte_8931
		bge	loc_AC2F
		ldab	byte_8931
		bra	loc_AC2F
; ---------------------------------------------------------------------------

loc_AC24:				; CODE XREF: sub_A802+40Ej
		addb	byte_892E
		cmpb	byte_8930
		ble	loc_AC2F
		ldab	byte_8930

loc_AC2F:				; CODE XREF: sub_A802+41Bj
					; sub_A802+420j ...
		stab	0,x
		clra
		staa	2,x

loc_AC34:				; CODE XREF: sub_A802+3F1j
					; sub_A802+413j
		bclr	<CruiseStatus_2	2
		clra
		staa	<Counter_Cruise_2

loc_AC3A:				; CODE XREF: sub_A802+3C9j
					; sub_A802+3DBj
		bra	loc_AC66
; ---------------------------------------------------------------------------

loc_AC3C:				; CODE XREF: sub_A802+3E6j
		inca
		staa	<Counter_Cruise_2
		ldd	<VehicleSpeed_HB
		lsrd
		lsrd
		lsrd
		ldaa	<CruiseSpeedSetpoint
		asla
		asla
		sba
		adda	byte_892A
		bmi	loc_AC5B
		ldab	<CruiseControlVar6
		bpl	loc_AC54
		comb
		incb

loc_AC54:				; CODE XREF: sub_A802+44Ej
		cba
		ble	loc_AC66
		staa	<CruiseControlVar6
		bra	loc_AC66
; ---------------------------------------------------------------------------

loc_AC5B:				; CODE XREF: sub_A802+44Aj
		ldab	<CruiseControlVar6
		bmi	loc_AC61
		comb
		incb

loc_AC61:				; CODE XREF: sub_A802+45Bj
		cba
		bge	loc_AC66
		staa	<CruiseControlVar6

loc_AC66:				; CODE XREF: sub_A802:loc_AC3Aj
					; sub_A802+453j ...
		ldd	Temp0
		subd	<VehicleSpeed_HB
		bne	loc_AC70
		clr	CruiseControlVar3

loc_AC70:				; CODE XREF: sub_A802+469j
		std	Temp0
		clra
		ldab	<CruiseControlVar3
		bpl	loc_AC79
		deca

loc_AC79:				; CODE XREF: sub_A802+474j
		addd	Temp0
		asra
		rorb
		bsr	sub_AC84

loc_AC80:				; CODE XREF: sub_A802+39FJ
		stab	<CruiseControlVar3
		bra	loc_AC95
; END OF FUNCTION CHUNK	FOR sub_A802

; =============== S U B	R O U T	I N E =======================================


sub_AC84:				; CODE XREF: sub_A802+47Cp sub_AE05+EP ...
		lsld
		bcs	loc_AC8D
		tsta
		beq	loc_AC93
		ldab	#$7F
		rts
; ---------------------------------------------------------------------------

loc_AC8D:				; CODE XREF: sub_AC84+1j
		cmpa	#$FF
		beq	loc_AC92
		clrb

loc_AC92:				; CODE XREF: sub_AC84+Bj
		sec

loc_AC93:				; CODE XREF: sub_AC84+4j
		rorb
		rts
; End of function sub_AC84

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_A802

loc_AC95:				; CODE XREF: sub_A802+480j
		brset	<CruiseStatus_1	$80 loc_ACEF
		ldx	#$8943
		clrb
		ldaa	<CruiseSpeedSetpoint
		brclr	<CruiseStatus_1	$18 loc_ACA5
		ldaa	<CruiseControlVar0

loc_ACA5:				; CODE XREF: sub_A802+49Dj
		lsrd
		lsrd
		lsrd
		subd	<VehicleSpeed_HB
		bcc	loc_ACF2
		bclr	<CruiseStatus_1	4
		ldx	#$8934
		coma
		comb
		addd	#1
		stab	Temp0
		tsta
		beq	loc_ACC4
		psha
		ldaa	#$FF
		staa	Temp0
		pula

loc_ACC4:				; CODE XREF: sub_A802+4B9j
		lsrd
		lsrd
		brclr	<CruiseStatus_1	$10 loc_ACD4
		ldx	#$89D7
		tsta
		beq	loc_AD08
		ldaa	#$FF
		bra	loc_AD09
; ---------------------------------------------------------------------------

loc_ACD4:				; CODE XREF: sub_A802+4C4j
		tsta
		bne	loc_ACE9
		cmpb	byte_890D
		bcc	loc_ACE9
		tba
		ldab	Temp0
		cmpa	byte_890E
		bcs	loc_AD08
		ldaa	#5
		bra	loc_ACEB
; ---------------------------------------------------------------------------

loc_ACE9:				; CODE XREF: sub_A802+4D3j
					; sub_A802+4D8j
		ldaa	#$F

loc_ACEB:				; CODE XREF: sub_A802+4E5j
		oraa	#$80
		staa	<CruiseControlVar2

loc_ACEF:				; CODE XREF: sub_A802:loc_AC95j
		jmp	loc_AE35
; ---------------------------------------------------------------------------

loc_ACF2:				; CODE XREF: sub_A802+4A8j
		brclr	<CruiseStatus_1	$C loc_ACFB
		ldx	#$895A
		lsrd
		lsrd

loc_ACFB:				; CODE XREF: sub_A802:loc_ACF2j
		tsta
		beq	loc_AD00
		ldab	#$FF

loc_AD00:				; CODE XREF: sub_A802+4FAj
		cmpb	byte_8911
		bcc	loc_AD08
		bclr	<CruiseStatus_1	4

loc_AD08:				; CODE XREF: sub_A802+4CCj
					; sub_A802+4E1j ...
		tba

loc_AD09:				; CODE XREF: sub_A802+4D0j
		jsr	Lookup4ByteTable
		clra
		tstb
		bpl	loc_AD11
		deca

loc_AD11:				; CODE XREF: sub_A802+50Cj
		std	Temp0
		ldx	#$89BD
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		jsr	Lookup4ByteTable
		staa	Temp3
		ldx	#$89AE
		ldd	<VehicleSpeed_HB
		lsld
		lsld
		lsld
		jsr	Lookup4ByteTable
		adda	Temp3
		bcc	loc_AD31
		ldaa	#$FF

loc_AD31:				; CODE XREF: sub_A802+52Bj
		staa	Temp3
		clra
		staa	Temp2
		ldab	<CruiseControlVar3
		bpl	loc_AD3D
		deca

loc_AD3D:				; CODE XREF: sub_A802+538j
		lsld
		lsld
		addd	Temp0
		std	Temp0
		brset	<CruiseStatus_2	4 loc_AD71
		bpl	loc_AD50
		coma
		comb
		addd	#1

loc_AD50:				; CODE XREF: sub_A802+547j
		tsta
		beq	loc_AD55
		ldab	#$FF

loc_AD55:				; CODE XREF: sub_A802+54Fj
		cmpb	byte_891D
		bhi	loc_AD71
		clrb
		ldaa	<CruiseSpeedSetpoint
		lsrd
		lsrd
		lsrd
		subd	<VehicleSpeed_HB
		bpl	loc_AD69
		coma
		comb
		addd	#1

loc_AD69:				; CODE XREF: sub_A802+560j
		tsta
		bne	loc_AD71
		cmpb	byte_891E
		bls	loc_AD92

loc_AD71:				; CODE XREF: sub_A802+543j
					; sub_A802+556j ...
		clra
		ldab	<CruiseControlVar1
		bpl	loc_AD77
		deca

loc_AD77:				; CODE XREF: sub_A802+572j
		addd	Temp0
		staa	Temp4
		bpl	loc_AD84
		coma
		comb
		addd	#1

loc_AD84:				; CODE XREF: sub_A802+57Bj
		cpd	Temp2
		bcc	loc_AD95
		ldaa	Temp4
		bpl	loc_AD90
		negb

loc_AD90:				; CODE XREF: sub_A802+58Bj
		stab	<CruiseControlVar1

loc_AD92:				; CODE XREF: sub_A802+56Dj
					; sub_A802+59Fj ...
		jmp	loc_AE35
; ---------------------------------------------------------------------------

loc_AD95:				; CODE XREF: sub_A802+586j
		clra
		staa	<CruiseControlVar1
		ldaa	Temp4
		anda	#$80
		ldab	<CruiseControlVar2
		beq	loc_ADA8
		bpl	loc_AD92
		tab
		eorb	<CruiseControlVar2
		bpl	loc_AD92

loc_ADA8:				; CODE XREF: sub_A802+59Dj
		ldab	<TpsVolts_Minus_LowestSessionTpsVolts
		tsta
		bpl	loc_ADD7
		oraa	byte_8921
		brclr	<CruiseStatus_1	$10 loc_ADB9
		adda	byte_8923
		bra	loc_AE01
; ---------------------------------------------------------------------------

loc_ADB9:				; CODE XREF: sub_A802+5AEj
		staa	Temp4
		clra
		cmpb	byte_8912
		bcs	loc_AE01
		ldx	#$89FC
		stx	Temp2
		ldx	#$8A07
		bsr	sub_AE05
		oraa	#$80
		ldab	Temp4
		cba
		bcc	loc_AE01
		bra	loc_AE00
; ---------------------------------------------------------------------------

loc_ADD7:				; CODE XREF: sub_A802+5A9j
		cmpb	byte_8913
		bcc	loc_AE01
		oraa	byte_8920
		brclr	<CruiseStatus_1	8 loc_ADE8
		adda	byte_8922
		bra	loc_AE01
; ---------------------------------------------------------------------------

loc_ADE8:				; CODE XREF: sub_A802+5DDj
		brset	<CruiseStatus_1	4 loc_AE01
		staa	Temp4
		ldx	#$89E6
		stx	Temp2
		ldx	#$89F1
		bsr	sub_AE05
		ldab	Temp4
		cba
		bcc	loc_AE01

loc_AE00:				; CODE XREF: sub_A802+5D3j
		tba

loc_AE01:				; CODE XREF: sub_A802+5B5j
					; sub_A802+5BEj ...
		staa	<CruiseControlVar2
		bra	loc_AE35
; END OF FUNCTION CHUNK	FOR sub_A802

; =============== S U B	R O U T	I N E =======================================


sub_AE05:				; CODE XREF: sub_A802+5C9p
					; sub_A802+5F6p
		clrb
		ldaa	<CruiseSpeedSetpoint
		lsrd
		lsrd
		lsrd
		subd	<VehicleSpeed_HB
		asra
		rorb
		asra
		rorb
		asra
		rorb
		jsr	sub_AC84
		tba
		adda	#$80
		jsr	Lookup4ByteTable
		ldx	Temp2
		staa	Temp2
		ldd	Temp0
		jsr	sub_AC84
		tba
		adda	#$80
		jsr	Lookup4ByteTable
		ldab	Temp2
		mul
		adca	#0
		rts
; End of function sub_AE05

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_A802

loc_AE35:				; CODE XREF: sub_A802+397J
					; sub_A802:loc_ACEFJ ...
		ldaa	<PIA2_Buffer_t3
		anda	#$3F
		brset	<CruiseStatus_1	$80 loc_AE4E
		ldab	<CruiseControlVar2
		beq	loc_AE50
		bpl	loc_AE52
		brclr	<CruiseStatus_1	$10 loc_AE4E
		ldab	<Counter_Cruise_4
		incb
		beq	loc_AE4E
		stab	<Counter_Cruise_4

loc_AE4E:				; CODE XREF: sub_A802+637j
					; sub_A802+641j ...
		oraa	#$C0

loc_AE50:				; CODE XREF: sub_A802+63Dj
		oraa	#$80

loc_AE52:				; CODE XREF: sub_A802+63Fj
		bclr	<BitFlags6a_t3 1
		tab
		eorb	<PIA2_Buffer_t3
		andb	#$C0
		beq	loc_AE5F
		bset	<BitFlags6a_t3 1

loc_AE5F:				; CODE XREF: sub_A802+658j
		staa	<PIA2_Buffer_t3
		ldab	<CruiseControlVar2
		beq	loc_AE71
		lsld
		tstb
		beq	loc_AE6E
		subb	#2
		beq	loc_AE6E
		lsrd

loc_AE6E:				; CODE XREF: sub_A802+665j
					; sub_A802+669j
		stab	<CruiseControlVar2
		rts
; ---------------------------------------------------------------------------

loc_AE71:				; CODE XREF: sub_A802+661j
		brclr	<CruiseStatus_2	1 locret_AE78
		bset	<CruiseStatus_2	2

locret_AE78:				; CODE XREF: sub_A802:loc_AE71j
		rts
; END OF FUNCTION CHUNK	FOR sub_A802

; =============== S U B	R O U T	I N E =======================================


sub_AE79:				; CODE XREF: __RESET+5BFP
		dec	Ram64c3
		beq	loc_AE80
		bra	loc_AEC8
; ---------------------------------------------------------------------------

loc_AE80:				; CODE XREF: sub_AE79+3j
		ldaa	byte_8A12
		staa	Ram64c3
		ldx	#$8A13
		ldy	#$64C4
		ldd	<EngineRpm_HB
		subd	UNe_64C1
		lsld
		lsld
		lsld
		addd	#$8000
		jsr	sub_AEFA
		subd	#$8000
		ldx	#6

loc_AEA1:				; CODE XREF: sub_AE79+2Bj
		asra
		rorb
		dex
		bne	loc_AEA1
		bclr	<BitFlags2f 2
		cpd	word_8A15
		blt	loc_AEC3
		bset	<BitFlags2f 2
		ldab	byte_8A19
		stab	STe_64C6
		ldab	<TpsVolts
		stab	STe_64C7
		ldab	byte_8A1B
		stab	STe_64C8

loc_AEC3:				; CODE XREF: sub_AE79+34j
		ldd	<EngineRpm_HB
		std	UNe_64C1

loc_AEC8:				; CODE XREF: sub_AE79+5j
		brclr	<BitFlags2f 4 locret_AEF9
		dec	STe_64C8
		beq	loc_AEF6
		ldd	<EngineRpm_HB
		cpd	word_8A17
		bmi	loc_AEF6
		dec	STe_64C6
		bne	locret_AEF9
		ldab	byte_8A19
		stab	STe_64C6
		ldaa	<TpsVolts
		ldab	STe_64C7
		staa	STe_64C7
		sba
		bmi	locret_AEF9
		cmpa	byte_8A1A
		bpl	loc_AEF6
		bra	locret_AEF9
; ---------------------------------------------------------------------------

loc_AEF6:				; CODE XREF: sub_AE79+56j sub_AE79+5Ej ...
		bclr	<BitFlags2f 4

locret_AEF9:				; CODE XREF: sub_AE79:loc_AEC8j
					; sub_AE79+63j	...
		rts
; End of function sub_AE79


; =============== S U B	R O U T	I N E =======================================


sub_AEFA:				; CODE XREF: sub_AE79+1FP
		subd	0,y
		pshy
		bcs	loc_AF0C
		xgdy
		ldaa	1,x
		jsr	ScaleYbyA
		xgdy
		bra	loc_AF1D
; ---------------------------------------------------------------------------

loc_AF0C:				; CODE XREF: sub_AEFA+5j
		nega
		negb
		sbca	#0
		xgdy
		ldaa	0,x
		jsr	ScaleYbyA
		xgdy
		nega
		negb
		sbca	#0

loc_AF1D:				; CODE XREF: sub_AEFA+10j
		puly
		addd	0,y
		std	0,y
		rts
; End of function sub_AEFA

; ---------------------------------------------------------------------------
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
; end of 'RESERVED'

; ===========================================================================

; Segment type:	Pure data
		; segment EEPROM
		org $B600
word_B600:	fdb $FFFF		; DATA XREF: ROM:loc_E344r
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
word_B610:	fdb $FFFF		; DATA XREF: sub_9EDC+Er
byte_B612:	fcb $FF			; DATA XREF: sub_E191+75r sub_E191+9Cr ...
		fcb $FF
byte_B614:	fcb $FF			; DATA XREF: bcf2_MM+1Cr
byte_B615:	fcb $FF			; DATA XREF: bcf2_MM+18r
		fcb $FF
		fcb $FF
byte_B618:	fcb $FF			; DATA XREF: UpdatePIA1AndCheckOutputs2_MM+1D2r
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
byte_B7E0:	fcb $FF			; DATA XREF: bcf2_MM+Fr
byte_B7E1:	fcb $FF			; DATA XREF: bcf2_MM+Br
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
byte_B7EF:	fcb $FF			; DATA XREF: bcf2_MM+32r
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
		fcb $FF
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

; ===========================================================================

; Segment type:	Uninitialized
		; segment RESERVED
		org $B800

; =============== S U B	R O U T	I N E =======================================


sub_B800:				; CODE XREF: __RESET+5CEP
		ldab	<Counter_MainLoop
		bitb	#7
		beq	loc_B809
		jmp	loc_B87F
; ---------------------------------------------------------------------------

loc_B809:				; CODE XREF: sub_B800+4j
		ldaa	<LastCoolantTempVolts
		ldx	#$E537
		brclr	<PIA3_Buffer_t3	$10 loc_B833
		ldx	#$E51C
		cmpa	#$40
		bcc	loc_B837

loc_B819:				; CODE XREF: sub_B800+35j
		brset	<BitFlags66_t3 3 loc_B824
		ldab	<BitFlags66_t3
		addb	#1
		stab	<BitFlags66_t3
		rts
; ---------------------------------------------------------------------------

loc_B824:				; CODE XREF: sub_B800:loc_B819j
		sei
		bclr	<BitFlags66_t3 3
		ldab	<PIA3_Buffer_t3
		eorb	#$10
		stab	<PIA3_Buffer_t3
		stab	PIA3_Buffer_2_t3
		cli
		rts
; ---------------------------------------------------------------------------

loc_B833:				; CODE XREF: sub_B800+Ej
		cmpa	#$DC
		bcc	loc_B819

loc_B837:				; CODE XREF: sub_B800+17j
		bclr	<BitFlags66_t3 3
		cmpa	TL_CoolantTempOutOfRangeHigh
		bhi	loc_B863
		cmpa	TL_CoolantTempOutOfRangeLow
		bcs	loc_B868
		brclr	<b5C_IPL1_t3 2 loc_B84F
		ldaa	#2
		jsr	sub_D795
		bra	loc_B87F
; ---------------------------------------------------------------------------

loc_B84F:				; CODE XREF: sub_B800+44j
		jsr	Lookup4ByteTable
		ldab	<CoolantTemp
		sba
		bcc	loc_B85A
		decb
		bra	loc_B85F
; ---------------------------------------------------------------------------

loc_B85A:				; CODE XREF: sub_B800+55j
		cmpa	#3
		bcs	loc_B87F
		incb

loc_B85F:				; CODE XREF: sub_B800+58j
		stab	<CoolantTemp
		bra	loc_B87F
; ---------------------------------------------------------------------------

loc_B863:				; CODE XREF: sub_B800+3Dj
		ldd	#$1F9E
		bra	loc_B86B
; ---------------------------------------------------------------------------

loc_B868:				; CODE XREF: sub_B800+42j
		ldd	#$1E9E

loc_B86B:				; CODE XREF: sub_B800+66j
		brset	<b5C_IPL1_t3 2 loc_B87F
		jsr	ThrowNonCriticalError_
		bcc	loc_B87F
		bset	<b5C_IPL1_t3 2
		ldaa	TL_DefaultCoolantTempRaw
		staa	<CoolantTemp
		clr	Timer_ThermostatDiagnostics

loc_B87F:				; CODE XREF: sub_B800+6J sub_B800+4Dj	...
		ldaa	<CoolantTemp
		ldx	#$E546
		jsr	Lookup4ByteTable
		staa	<CoolantTemp_fromTable_Scaled
		rts
; End of function sub_B800


; =============== S U B	R O U T	I N E =======================================


sub_B88A:				; CODE XREF: __RESET+5CBP
		ldab	<Counter_MainLoop
		bitb	#7
		beq	loc_B893
		jmp	loc_B909
; ---------------------------------------------------------------------------

loc_B893:				; CODE XREF: sub_B88A+4j
		ldaa	<LastChargeTempVolts
		ldx	#$E537
		brclr	<PIA3_Buffer_t3	$20 loc_B8C0
		ldx	#$E51C
		cmpa	#$40
		bcc	loc_B8C4

loc_B8A3:				; CODE XREF: sub_B88A+38j
		brset	<BitFlags23 3 loc_B8B1
		ldab	<BitFlags23
		addb	#1
		stab	<BitFlags23
		ldaa	<LastChargeTempVolts
		bra	loc_B8C7
; ---------------------------------------------------------------------------

loc_B8B1:				; CODE XREF: sub_B88A:loc_B8A3j
		sei
		bclr	<BitFlags23 3
		ldab	<PIA3_Buffer_t3
		eorb	#$20
		stab	<PIA3_Buffer_t3
		stab	PIA3_Buffer_2_t3
		cli
		rts
; ---------------------------------------------------------------------------

loc_B8C0:				; CODE XREF: sub_B88A+Ej
		cmpa	#$DC
		bcc	loc_B8A3

loc_B8C4:				; CODE XREF: sub_B88A+17j
		bclr	<BitFlags23 3

loc_B8C7:				; CODE XREF: sub_B88A+25j
		cmpa	TL_ChargeTempOutOfRangeHigh
		bhi	loc_B8F0
		cmpa	TL_ChargeTempOutOfRangeLow
		bcs	loc_B8F5
		brclr	<b5C_IPL1_t3 1 loc_B8DC
		ldaa	#1
		jsr	sub_D795
		bra	loc_B909
; ---------------------------------------------------------------------------

loc_B8DC:				; CODE XREF: sub_B88A+47j
		jsr	Lookup4ByteTable
		ldab	<ChargeTempVolts
		sba
		bcc	loc_B8E7
		decb
		bra	loc_B8EC
; ---------------------------------------------------------------------------

loc_B8E7:				; CODE XREF: sub_B88A+58j
		cmpa	#3
		bcs	loc_B909
		incb

loc_B8EC:				; CODE XREF: sub_B88A+5Bj
		stab	<ChargeTempVolts
		bra	loc_B909
; ---------------------------------------------------------------------------

loc_B8F0:				; CODE XREF: sub_B88A+40j
		ldd	#$3A9E
		bra	loc_B8F8
; ---------------------------------------------------------------------------

loc_B8F5:				; CODE XREF: sub_B88A+45j
		ldd	#$399E

loc_B8F8:				; CODE XREF: sub_B88A+69j
		brset	<b5C_IPL1_t3 1 loc_B909
		jsr	ThrowNonCriticalError_
		bcc	loc_B909
		bset	<b5C_IPL1_t3 1
		ldaa	TL_DefaultChargeTemp_Limpin
		staa	<ChargeTempVolts

loc_B909:				; CODE XREF: sub_B88A+6J sub_B88A+50j	...
		ldaa	<ChargeTempVolts
		ldx	#$E587
		jsr	Lookup4ByteTable
		staa	<IntakeTemp_fromTable_Scaled
		rts
; End of function sub_B88A


; =============== S U B	R O U T	I N E =======================================


sub_B914:				; CODE XREF: __RESET+5BCP
		brclr	<BitFlags24 $10	loc_B92D
		sei
		ldd	<VehicleSpeed_HB
		lsrd
		lsrd
		lsrd
		lsrd
		lsrd
		std	Temp4
		ldd	<VehicleSpeed_HB
		subd	Temp4
		std	<VehicleSpeed_HB
		cli
		bra	*+2
; ---------------------------------------------------------------------------

loc_B92D:				; CODE XREF: sub_B914j	sub_B914+17j
		clra
		ldab	<VehicleSpeedx8_Scaled
		cmpb	byte_801E
		bcc	loc_B93D
		ldx	<EngineRpm_HB
		cpx	<TargetIdleSpeedHB
		bls	loc_B948
		bra	loc_B943
; ---------------------------------------------------------------------------

loc_B93D:				; CODE XREF: sub_B914+1Fj
		ldab	<MapValue
		cmpb	<MAPOffsetForCylTrim
		bls	loc_B948

loc_B943:				; CODE XREF: sub_B914+27j
		ldaa	<Timer_CountdownFromStartRunForAisFeedback
		beq	loc_B94A
		deca

loc_B948:				; CODE XREF: sub_B914+25j sub_B914+2Dj
		staa	<Timer_CountdownFromStartRunForAisFeedback

loc_B94A:				; CODE XREF: sub_B914+31j
		brset	<BitFlags66_t3 $80 loc_B967
		ldd	<VehicleSpeed_HB
		lsld
		lsld
		lsld
		aslb
		adca	#0
		ldab	byte_801E
		brset	<BitFlags66_t3 4 loc_B95F
		addb	#3

loc_B95F:				; CODE XREF: sub_B914+45j
		cba
		bcs	loc_B967
		bset	<BitFlags66_t3 4
		bra	loc_B96A
; ---------------------------------------------------------------------------

loc_B967:				; CODE XREF: sub_B914:loc_B94Aj
					; sub_B914+4Cj
		bclr	<BitFlags66_t3 4

loc_B96A:				; CODE XREF: sub_B914+51j
		ldd	<VehicleSpeed_HB
		lsld
		lsld
		lsld
		bcc	loc_B973
		ldaa	#$FF

loc_B973:				; CODE XREF: sub_B914+5Bj
		staa	<VehicleSpeedx8_Scaled
		rts
; End of function sub_B914


; =============== S U B	R O U T	I N E =======================================


sub_B976:				; CODE XREF: __RESET+610P
		brclr	<IPL1 $40 locret_B9B9
		ldaa	<MapValue2
		cmpa	#$80
		bcs	locret_B9B9
		ldaa	<EngineRpm_HB
		ldx	#$8024
		jsr	Lookup4ByteTable
		adda	<MapValue2
		bcc	loc_B98E
		ldaa	#$FF

loc_B98E:				; CODE XREF: sub_B976+14j
		cmpa	<BaroPressure
		bls	loc_B998
		ldab	<BaroPressure
		incb
		bne	loc_B9B1
		rts
; ---------------------------------------------------------------------------

loc_B998:				; CODE XREF: sub_B976+1Aj
		ldab	<TpsVolts_Minus_LowestSessionTpsVolts
		cmpb	byte_8037
		bcs	loc_B9B3
		ldab	<TPSVoltsSessionDelta
		cmpb	byte_8038
		bcs	loc_B9B4
		cmpa	<BaroPressure
		bcc	loc_B9B4
		ldab	<BaroPressure
		decb
		cmpb	#$80
		bcs	loc_B9B3

loc_B9B1:				; CODE XREF: sub_B976+1Fj
		stab	<BaroPressure

loc_B9B3:				; CODE XREF: sub_B976+27j sub_B976+39j
		clrb

loc_B9B4:				; CODE XREF: sub_B976+2Ej sub_B976+32j
		incb
		bmi	locret_B9B9
		stab	<TPSVoltsSessionDelta

locret_B9B9:				; CODE XREF: sub_B976j	sub_B976+8j ...
		rts
; End of function sub_B976


; =============== S U B	R O U T	I N E =======================================


sub_B9BA:				; CODE XREF: __RESET+5EFP
		brclr	<StartupSwitchMirror1 $10 loc_B9C1
		bclr	<BitFlags2a 1

loc_B9C1:				; CODE XREF: sub_B9BAj
		brset	<BitFlags27 1 loc_B9ED
		ldab	<BitFlags68_t3
		andb	#$10
		stab	Temp5
		ldab	<StartupSwitchMirror1
		andb	#$10
		eorb	Temp5
		beq	locret_B9F0
		eorb	<BitFlags68_t3
		orab	#$80
		stab	<BitFlags68_t3
		bclr	<BitFlags66_t3 4
		brclr	<BitFlags68_t3 $10 locret_B9F0
		bset	<BitFlags2f $10
		ldaa	byte_8A27
		staa	STe_64C0
		bra	locret_B9F0
; ---------------------------------------------------------------------------

loc_B9ED:				; CODE XREF: sub_B9BA:loc_B9C1j
		bclr	<BitFlags68_t3 $90

locret_B9F0:				; CODE XREF: sub_B9BA+19j sub_B9BA+24j ...
		rts
; End of function sub_B9BA


; =============== S U B	R O U T	I N E =======================================


sub_B9F1:				; CODE XREF: __RESET+5F5P
		brclr	<BitFlags27 $80	loc_BA15
		ldab	<BitFlags68_t3
		andb	#1
		stab	Temp5
		ldab	<StartupSwitchMirror1
		andb	#1
		eorb	Temp5
		beq	locret_BA1B
		eorb	<BitFlags68_t3
		brset	<BitFlags36_t3 $20 loc_BA11
		brclr	<IPL1 $40 loc_BA11
		orab	#2

loc_BA11:				; CODE XREF: sub_B9F1+16j sub_B9F1+1Aj
		stab	<BitFlags68_t3
		bra	locret_BA1B
; ---------------------------------------------------------------------------

loc_BA15:				; CODE XREF: sub_B9F1j
		bclr	<BitFlags68_t3 2
		bset	<BitFlags68_t3 1

locret_BA1B:				; CODE XREF: sub_B9F1+12j sub_B9F1+22j
		rts
; End of function sub_B9F1


; =============== S U B	R O U T	I N E =======================================


sub_BA1C:				; CODE XREF: __RESET+5B0P
		clr	Temp4
		clr	Temp3
		brset	<Ram_30	4 loc_BA33
		ldaa	<LastTpsVolts
		cmpa	byte_8A60
		bcc	loc_BA33
		ldaa	<Ram_30
		adda	#1
		staa	<Ram_30

loc_BA33:				; CODE XREF: sub_BA1C+6j sub_BA1C+Fj
		ldaa	<b5C_IPL1_t3
		bita	#$88
		bne	loc_BA88
		brset	<Ram_30	8 loc_BA57
		ldaa	<EngineRpm_HB
		cmpa	byte_8A5E
		bcs	loc_BA63
		ldaa	<BaroPressure
		cmpa	byte_8A63
		bcc	loc_BA50
		ldaa	byte_8A62
		bra	loc_BA53
; ---------------------------------------------------------------------------

loc_BA50:				; CODE XREF: sub_BA1C+2Dj
		ldaa	byte_8A61

loc_BA53:				; CODE XREF: sub_BA1C+32j
		cmpa	<MapVolts
		bcc	loc_BA63

loc_BA57:				; CODE XREF: sub_BA1C+1Dj
		ldaa	<LastTpsVolts
		cmpa	byte_8A60
		bcs	loc_BA63
		com	Temp4
		bra	loc_BA95
; ---------------------------------------------------------------------------

loc_BA63:				; CODE XREF: sub_BA1C+26j sub_BA1C+39j ...
		brset	<BitFlags2e 8 loc_BA7C
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	byte_8A5D
		bcs	loc_BA88
		ldaa	<EngineRpm_HB
		cmpa	byte_8A5E
		bcs	loc_BA88
		ldaa	<MapVolts
		cmpa	byte_8A5F
		bcc	loc_BA88

loc_BA7C:				; CODE XREF: sub_BA1C:loc_BA63j
		ldaa	<LastTpsVolts
		cmpa	byte_8A5C
		bcc	loc_BA88
		com	Temp3
		bra	loc_BA9F
; ---------------------------------------------------------------------------

loc_BA88:				; CODE XREF: sub_BA1C+1Bj sub_BA1C+50j ...
		sei
		ldaa	<LastTpsVolts
		cmpa	byte_8A59
		bcs	loc_BA9F
		cmpa	byte_8A5A
		bcs	loc_BADE

loc_BA95:				; CODE XREF: sub_BA1C+45j
		cli
		brclr	<Counter_MainLoop 1 loc_BAFC
		ldd	#$1BA0
		bra	loc_BAA7
; ---------------------------------------------------------------------------

loc_BA9F:				; CODE XREF: sub_BA1C+6Aj sub_BA1C+72j
		cli
		brclr	<Counter_MainLoop 1 loc_BAFC
		ldd	#$1AA0

loc_BAA7:				; CODE XREF: sub_BA1C+81j
		brset	<b5C_IPL1_t3 $40 loc_BAC7
		jsr	ThrowNonCriticalError_
		ldaa	<TpsVolts
		bcc	loc_BAFC
		bset	<b5C_IPL1_t3 $40
		tst	Temp4
		beq	loc_BABF
		bset	<Ram_30	8
		bra	loc_BAC7
; ---------------------------------------------------------------------------

loc_BABF:				; CODE XREF: sub_BA1C+9Cj
		tst	Temp3
		beq	loc_BAC7
		bset	<BitFlags2e 8

loc_BAC7:				; CODE XREF: sub_BA1C:loc_BAA7j
					; sub_BA1C+A1j	...
		ldaa	#$40
		staa	<LowestSessionTpsVolts
		brclr	<IPL1 $40 loc_BADA
		ldab	<MapValue
		cmpb	byte_8A5B
		bcs	loc_BADA
		adda	byte_801F
		inca

loc_BADA:				; CODE XREF: sub_BA1C+AFj sub_BA1C+B8j
		staa	<TpsVolts
		bra	loc_BAFC
; ---------------------------------------------------------------------------

loc_BADE:				; CODE XREF: sub_BA1C+77j
		brclr	<b5C_IPL1_t3 $40 loc_BAFA
		cli
		ldaa	<Counter_MainLoop
		bita	#7
		bne	loc_BAC7
		ldaa	#7
		jsr	sub_D795
		brset	<b5C_IPL1_t3 $40 loc_BAC7
		bclr	<BitFlags2e 8
		bclr	<Ram_30	8
		bra	loc_BAC7
; ---------------------------------------------------------------------------

loc_BAFA:				; CODE XREF: sub_BA1C:loc_BADEj
		staa	<TpsVolts

loc_BAFC:				; CODE XREF: sub_BA1C+7Aj sub_BA1C+84j ...
		cli
		brset	<BitFlags66_t3 $80 loc_BB26
		ldab	<Timer_CountdownFromStartRunForAisFeedback
		bne	loc_BB26
		brclr	<IPL1 $40 loc_BB26
		ldab	<KeyOnOrEngineRunningTime
		beq	loc_BB26
		cmpa	<LowestSessionTpsVolts
		bcc	loc_BB26
		ldaa	Timer_DelayBeforeUpdating_MINTHR
		deca
		bne	loc_BB29
		ldab	<LowestSessionTpsVolts
		cmpb	#1
		bcc	loc_BB20
		ldab	TL_ValueOf_MINTHR_WhenBatteryDisconnected

loc_BB20:				; CODE XREF: sub_BA1C+FFj
		decb
		stab	<LowestSessionTpsVolts
		bclr	<BitFlags66_t3 $10

loc_BB26:				; CODE XREF: sub_BA1C+E1j sub_BA1C+E7j ...
		ldaa	byte_8018

loc_BB29:				; CODE XREF: sub_BA1C+F9j
		staa	Timer_DelayBeforeUpdating_MINTHR
		ldaa	byte_8019
		ldab	<BitFlags66_t3
		bpl	loc_BB36
		ldaa	byte_801A

loc_BB36:				; CODE XREF: sub_BA1C+115j
		adda	<LowestSessionTpsVolts
		cmpa	<TpsVolts
		bcc	loc_BB55
		tstb
		bmi	loc_BB4E
		bitb	#$10
		bne	loc_BB4E
		ldaa	<LowestSessionTpsVolts
		inca
		cmpa	<TpsVolts
		bcc	loc_BB4E
		staa	<LowestSessionTpsVolts
		orab	#$10

loc_BB4E:				; CODE XREF: sub_BA1C+121j
					; sub_BA1C+125j ...
		orab	#$80
		bclr	<BitFlags2a 1
		bra	loc_BB6F
; ---------------------------------------------------------------------------

loc_BB55:				; CODE XREF: sub_BA1C+11Ej
		tstb
		bpl	loc_BB6D
		brset	<BitFlags68_t3 4 loc_BB5E
		orab	#$20

loc_BB5E:				; CODE XREF: sub_BA1C+13Cj
		ldx	#$87A9
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	byte_801E
		bcc	loc_BB69
		inx

loc_BB69:				; CODE XREF: sub_BA1C+14Aj
		ldaa	0,x
		staa	<Timer_CountdownFromStartRunForAisFeedback

loc_BB6D:				; CODE XREF: sub_BA1C+13Aj
		andb	#$7F

loc_BB6F:				; CODE XREF: sub_BA1C+137j
		bitb	#8
		bne	loc_BB94
		brclr	<StartupSwitchMirror1 $20 loc_BB94
		ldaa	<EngineRpm_HB
		cmpa	byte_801C
		bcs	loc_BB94
		ldaa	<MapValue
		cmpa	byte_801D
		bcc	loc_BB94
		ldaa	<LowestSessionTpsVolts
		inca
		cmpa	TL_ValueOf_MINTHR_WhenBatteryDisconnected
		bcs	loc_BB90
		ldaa	TL_ValueOf_MINTHR_WhenBatteryDisconnected

loc_BB90:				; CODE XREF: sub_BA1C+16Fj
		staa	<LowestSessionTpsVolts
		orab	#8

loc_BB94:				; CODE XREF: sub_BA1C+155j
					; sub_BA1C+157j ...
		ldaa	<LowestSessionTpsVolts
		adda	#$30
		cmpa	<TpsVolts
		bcc	loc_BB9E
		andb	#$F7

loc_BB9E:				; CODE XREF: sub_BA1C+17Ej
		stab	<BitFlags66_t3
		ldaa	<TpsVolts
		suba	<LowestSessionTpsVolts
		bcc	loc_BBA7
		clra

loc_BBA7:				; CODE XREF: sub_BA1C+188j
		staa	<TpsVolts_Minus_LowestSessionTpsVolts
		rts
; End of function sub_BA1C


; =============== S U B	R O U T	I N E =======================================


sub_BBAA:				; CODE XREF: __RESET+5B6P
		sei
		jsr	sub_E6AA
		cli
		std	Temp0
		addd	UNe_64A3
		rora
		rorb
		std	Temp2
		ldd	Temp0
		std	UNe_64A3
		std	<EngineRpm_HB
		clra
		ldab	<VehicleSpeedx8_Scaled
		std	Temp4
		ldab	Temp2
		lsrb
		aba
		lsrb
		clra
		ldx	Temp4
		fdiv
		xgdx
		bcc	loc_BBD8
		ldaa	#$FF

loc_BBD8:				; CODE XREF: sub_BBAA+2Aj
		lsra
		lsra
		staa	Temp4
		ldaa	<ScaledDistPWForCruiseControl
		tab
		lsrb
		lsrb
		sba
		adda	Temp4
		bcc	loc_BBEA
		ldaa	#$FF

loc_BBEA:				; CODE XREF: sub_BBAA+3Cj
		staa	<ScaledDistPWForCruiseControl
		rts
; End of function sub_BBAA


; =============== S U B	R O U T	I N E =======================================


sub_BBED:				; CODE XREF: __RESET+5C5P
		ldab	#$1C

loc_BBEF:				; CODE XREF: sub_BBED+Ej
		subb	#2
		bls	loc_BBFE
		ldx	#$8037
		abx
		ldx	0,x
		cpx	<EngineRpm_HB
		bcc	loc_BBEF
		lsrb

loc_BBFE:				; CODE XREF: sub_BBED+4j
		stab	<RPMTableOffset
		rts
; End of function sub_BBED


; =============== S U B	R O U T	I N E =======================================


sub_BC01:				; CODE XREF: __RESET+5DAP
		clr	Temp0
		ldab	byte_84D3
		ldaa	<MapValueTemp3
		mul
		lsld
		rol	Temp0
		lsld
		rol	Temp0
		staa	Temp1
		clra
		ldab	byte_84D2
		lsld
		addd	Temp0
		std	Temp0
		ldaa	<RPMTableOffset
		ldab	byte_84D4
		mul
		lsrd
		lsrd
		addd	Temp0
		lsrd
		lsrd
		oraa	#0
		beq	loc_BC33
		ldab	#$FF

loc_BC33:				; CODE XREF: sub_BC01+2Ej
		stab	<RPM_Scaled_maybe
		rts
; End of function sub_BC01


; =============== S U B	R O U T	I N E =======================================


sub_BC36:				; CODE XREF: __RESET+5B3P
		ldab	byte_801F
		addb	<LowestSessionTpsVolts
		bcs	loc_BC42
		cmpb	byte_8020
		bcs	loc_BC45

loc_BC42:				; CODE XREF: sub_BC36+5j
		ldab	byte_8020

loc_BC45:				; CODE XREF: sub_BC36+Aj
		brclr	<BitFlags66_t3 $40 loc_BC4B
		subb	#3

loc_BC4B:				; CODE XREF: sub_BC36:loc_BC45j
		cmpb	<TpsVolts
		bcc	loc_BC53
		bset	<BitFlags66_t3 $40
		rts
; ---------------------------------------------------------------------------

loc_BC53:				; CODE XREF: sub_BC36+17j
		bclr	<BitFlags66_t3 $40
		rts
; End of function sub_BC36


; =============== S U B	R O U T	I N E =======================================


sub_BC57:				; CODE XREF: __RESET+58FP
		ldaa	CoolantVoltsTmp1
		ldab	CoolantVoltsTmp2
		mul
		std	Temp1
		ldab	CoolantVoltsTmp1
		subb	CoolantVoltsTmp2
		bls	loc_BCAA
		clra
		xgdx
		ldd	Temp1
		aslb
		adca	#0
		tab
		abx
		ldd	Temp1
		idiv
		xgdx
		tsta
		bne	loc_BCAA
		stab	Temp0
		ldaa	Temp0
		ldx	#$E5AA
		jsr	Lookup4ByteTable
		tab
		suba	<AmbientAirTempVolts2
		bcc	loc_BC9A
		cmpa	#$F0
		bhi	loc_BCA6
		ldab	<AmbientAirTempVolts2
		subb	#$10
		bcc	loc_BCA6
		ldab	#0
		bra	loc_BCA6
; ---------------------------------------------------------------------------

loc_BC9A:				; CODE XREF: sub_BC57+33j
		cmpa	#$10
		bls	loc_BCA6
		ldab	<AmbientAirTempVolts2
		addb	#$10
		bcc	loc_BCA6
		ldab	#$FF

loc_BCA6:				; CODE XREF: sub_BC57+37j sub_BC57+3Dj ...
		stab	<AmbientAirTempVolts2
		bra	locret_BCBE
; ---------------------------------------------------------------------------

loc_BCAA:				; CODE XREF: sub_BC57+10j sub_BC57+22j
		brset	<b5C_IPL1_t3 2 locret_BCBE
		ldaa	<CoolantTemp
		cmpa	#$C1
		bcc	locret_BCBE
		ldd	#$4708
		jsr	ThrowNonCriticalError_
		ldaa	#$C1
		staa	<AmbientAirTempVolts2

locret_BCBE:				; CODE XREF: sub_BC57+51j
					; sub_BC57:loc_BCAAj ...
		rts
; End of function sub_BC57


; =============== S U B	R O U T	I N E =======================================


DetermineTargetBatteryVoltage:		; CODE XREF: __RESET+1AAP __RESET+592P
		ldaa	<AmbientAirTempVolts2
		ldab	byte_8011
		cmpb	#2
		beq	loc_BCD1
		cmpb	#1
		beq	loc_BCD6
		ldx	#$E5C1
		bra	loc_BCD9
; ---------------------------------------------------------------------------

loc_BCD1:				; CODE XREF: DetermineTargetBatteryVoltage+7j
		ldx	#$E5D4
		bra	loc_BCD9
; ---------------------------------------------------------------------------

loc_BCD6:				; CODE XREF: DetermineTargetBatteryVoltage+Bj
		ldx	#$E5E7

loc_BCD9:				; CODE XREF: DetermineTargetBatteryVoltage+10j
					; DetermineTargetBatteryVoltage+15j
		jsr	Lookup4ByteTable
		staa	<TargetBatteryVolts
		rts
; End of function DetermineTargetBatteryVoltage


; =============== S U B	R O U T	I N E =======================================


ReadA2DBattVolts:			; CODE XREF: __RESET+231P __RESET+4FAP ...
		ldaa	ADR2_A2DResults2
		ldab	<BodyComputerBatteryVoltsOutput
		addb	#$F8
		bcs	loc_BCF0
		comb
		aba
		bcc	locret_BCF1
		ldaa	#$FF
		bra	locret_BCF1
; ---------------------------------------------------------------------------

loc_BCF0:				; CODE XREF: ReadA2DBattVolts+7j
		sba

locret_BCF1:				; CODE XREF: ReadA2DBattVolts+Bj
					; ReadA2DBattVolts+Fj
		rts
; End of function ReadA2DBattVolts


; =============== S U B	R O U T	I N E =======================================


bcf2_MM:				; CODE XREF: __RESET+1A7P __RESET+619P
		brset	<BitFlags6a_t3 $40 locret_BD33
		ldaa	PPROG_EEPROMControlReg
		bita	#2
		bne	locret_BD33
		ldaa	byte_B7E1
		coma
		cmpa	byte_B7E0
		beq	loc_BD08
		ldaa	#8

loc_BD08:				; CODE XREF: bcf2_MM+12j
		staa	<BodyComputerBatteryVoltsOutput
		ldaa	byte_B615
		coma
		cmpa	byte_B614
		beq	loc_BD16
		clra
		bra	loc_BD22
; ---------------------------------------------------------------------------

loc_BD16:				; CODE XREF: bcf2_MM+1Fj
		cmpa	#$C
		ble	loc_BD1C
		ldaa	#$C

loc_BD1C:				; CODE XREF: bcf2_MM+26j
		cmpa	#$F4
		bge	loc_BD22
		ldaa	#$F4

loc_BD22:				; CODE XREF: bcf2_MM+22j bcf2_MM+2Cj
		staa	<Ram_4B
		ldaa	byte_B7EF
		cmpa	#$55
		bne	loc_BD30
		bset	<BitFlags6a_t3 2
		bra	locret_BD33
; ---------------------------------------------------------------------------

loc_BD30:				; CODE XREF: bcf2_MM+37j
		bclr	<BitFlags6a_t3 2

locret_BD33:				; CODE XREF: bcf2_MMj bcf2_MM+9j ...
		rts
; End of function bcf2_MM


; =============== S U B	R O U T	I N E =======================================


sub_BD34:				; CODE XREF: __RESET+644P
		clr	Temp4
		ldx	#$8083
		ldaa	<BitFlags6d_t3
		bita	#$50
		bne	loc_BD51
		ldaa	<Ram_CC
		beq	loc_BD4A
		brset	<PIA2_Buffer_t3	2 loc_BD51
		bra	loc_BD4E
; ---------------------------------------------------------------------------

loc_BD4A:				; CODE XREF: sub_BD34+Ej
		brclr	<PIA2_Buffer_t3	2 loc_BD51

loc_BD4E:				; CODE XREF: sub_BD34+14j
		ldx	#$811F

loc_BD51:				; CODE XREF: sub_BD34+Aj sub_BD34+10j	...
		ldaa	<EngineRPM_3D
		ldab	<MapValue2
		jsr	sub_E72F
		bpl	loc_BD5C
		ldaa	#$7F

loc_BD5C:				; CODE XREF: sub_BD34+24j
		staa	Temp5
		brclr	<IPL1 $10 loc_BD7B
		ldx	#$81BC
		ldaa	<EngineRPM_3D
		ldab	<MapValue2
		jsr	sub_E72F
		bpl	loc_BD71
		ldaa	#$7F

loc_BD71:				; CODE XREF: sub_BD34+39j
		adda	Temp5
		bpl	loc_BD78
		ldaa	#$7F

loc_BD78:				; CODE XREF: sub_BD34+40j
		staa	Temp5

loc_BD7B:				; CODE XREF: sub_BD34+2Bj
		ldx	#$8258
		ldab	<RPMTableOffset
		abx
		ldaa	0,x
		cmpa	<MapValue2
		bcc	loc_BDCC
		bset	<BitFlags23 $40
		ldx	#$8266
		ldaa	<CoolantTemp_fromTable_Scaled
		jsr	sub_E68D
		subb	#$20
		stab	Temp4
		ldaa	<IntakeTemp_fromTable_Scaled
		ldx	#$826F
		jsr	sub_E68D
		subb	#$20
		addb	Temp4
		bvc	loc_BDAF
		ldab	#$80
		tst	Temp4
		bmi	loc_BDAF
		ldab	#$7F

loc_BDAF:				; CODE XREF: sub_BD34+70j sub_BD34+77j
		stab	Temp4
		ldaa	<BaroPressure
		cmpa	byte_8278
		bcc	loc_BDCF
		subb	byte_8279
		bvc	loc_BDC7
		ldab	#$80
		tst	Temp4
		bmi	loc_BDC7
		ldab	#$7F

loc_BDC7:				; CODE XREF: sub_BD34+88j sub_BD34+8Fj
		stab	Temp4
		bra	loc_BDCF
; ---------------------------------------------------------------------------

loc_BDCC:				; CODE XREF: sub_BD34+51j
		bclr	<BitFlags23 $40

loc_BDCF:				; CODE XREF: sub_BD34+83j sub_BD34+96j
		jsr	sub_BF20
		ldaa	byte_827A
		beq	loc_BDEA
		brset	<BitFlags66_t3 $80 loc_BDEA
		ldab	<VehicleSpeedx8_Scaled
		brclr	<BitFlags23 $10	loc_BDE7
		adda	#3
		bcc	loc_BDE7
		ldaa	#$FF

loc_BDE7:				; CODE XREF: sub_BD34+A9j sub_BD34+AFj
		cba
		bcc	loc_BDEF

loc_BDEA:				; CODE XREF: sub_BD34+A1j sub_BD34+A3j
		bclr	<BitFlags23 $10
		bra	loc_BDF2
; ---------------------------------------------------------------------------

loc_BDEF:				; CODE XREF: sub_BD34+B4j
		bset	<BitFlags23 $10

loc_BDF2:				; CODE XREF: sub_BD34+B9j
		ldaa	byte_827A
		beq	loc_BE2B
		ldx	#$827C
		ldaa	<CoolantTemp_fromTable_Scaled
		jsr	sub_E68D
		brclr	<BitFlags23 $10	loc_BE0F
		addb	byte_827B
		bpl	loc_BE0A
		ldab	#$7F

loc_BE0A:				; CODE XREF: sub_BD34+D2j
		stab	Temp5
		bra	loc_BE2B
; ---------------------------------------------------------------------------

loc_BE0F:				; CODE XREF: sub_BD34+CBj
		stab	Temp4
		ldaa	<MapValue
		ldx	#$8285
		jsr	sub_E68D
		ldaa	Temp4
		mul
		adca	#0
		staa	Temp4
		jsr	sub_BF20
		staa	Temp0
		bra	loc_BE8E
; ---------------------------------------------------------------------------

loc_BE2B:				; CODE XREF: sub_BD34+C1j sub_BD34+D9j
		ldaa	Temp5
		staa	Temp0
		brclr	<IPL1 $40 loc_BE8E
		brset	<BitFlags66_t3 $80 loc_BE8E
		brset	<BitFlags66_t3 4 loc_BE8E
		ldab	<Timer_CountdownFromStartRunForAisFeedback
		bne	loc_BE96
		ldab	<TimerOverflowsBetweenCamPulses
		bne	loc_BE96
		ldab	<EngineRpm_HB
		cmpb	byte_869D
		bcs	loc_BE96
		ldab	<b5C_IPL1_t3
		bitb	#$88
		bne	loc_BE96
		ldab	<CoolantTemp
		cmpb	byte_8699
		bcs	loc_BE96
		ldx	<KeyOnOrEngineRunningTime
		cpx	word_869B
		bcs	loc_BE96
		ldx	#$86AB
		ldd	<EngineRpm_HB
		subd	<TargetIdleSpeedHB
		bcc	loc_BE6E
		ldx	#$86A0
		coma
		comb

loc_BE6E:				; CODE XREF: sub_BD34+133j
		lsrd
		lsrd
		lsrd
		lsrd
		bcc	loc_BE77
		addd	#1

loc_BE77:				; CODE XREF: sub_BD34+13Ej
		tsta
		beq	loc_BE7C
		ldab	#$FF

loc_BE7C:				; CODE XREF: sub_BD34+144j
		tba
		jsr	Lookup4ByteTable
		staa	SparkScatter
		staa	Temp4
		jsr	sub_BF20
		staa	Temp0
		bra	loc_BE9C
; ---------------------------------------------------------------------------

loc_BE8E:				; CODE XREF: sub_BD34+F5j sub_BD34+FDj ...
		clr	SparkScatter
		clr	SparkScatterIncrement
		bra	loc_BEB3
; ---------------------------------------------------------------------------

loc_BE96:				; CODE XREF: sub_BD34+10Bj
					; sub_BD34+10Fj ...
		clr	SparkScatter
		clr	SparkScatterIncrement

loc_BE9C:				; CODE XREF: sub_BD34+158j
		ldaa	byte_869F
		brset	<BitFlags6d_t3 8 loc_BEAE
		brset	<BitFlags2a 1 loc_BEAB
		brclr	<b5C_IPL1_t3 2 loc_BEB3

loc_BEAB:				; CODE XREF: sub_BD34+16Fj
		ldaa	byte_869E

loc_BEAE:				; CODE XREF: sub_BD34+16Bj
		staa	Temp0
		bra	loc_BEF9
; ---------------------------------------------------------------------------

loc_BEB3:				; CODE XREF: sub_BD34+160j
					; sub_BD34+173j
		ldd	#0
		brclr	<BitFlags2c 8 loc_BEC1
		sei
		bclr	<BitFlags2c 8
		cli
		bra	loc_BF01
; ---------------------------------------------------------------------------

loc_BEC1:				; CODE XREF: sub_BD34+182j
		ldaa	Temp0
		decb
		cmpb	<Ram_4C
		beq	loc_BEFE
		brclr	<IPL1 1	loc_BEFE
		brset	<BitFlags66_t3 $80 loc_BEFE
		cmpa	<Ram_4C
		bls	loc_BEFE
		ldaa	<EngineRpmTemp
		suba	<EngineRpm_HB
		bcs	loc_BEE0
		cmpa	byte_8082
		bcc	loc_BEF9

loc_BEE0:				; CODE XREF: sub_BD34+1A5j
		ldaa	<Ram_4C
		ldab	<CounterUp_43
		cmpb	byte_8081
		tab
		bcs	loc_BF01
		ldaa	<Ram_4C
		adda	byte_8080
		bpl	loc_BEF3
		ldaa	#$7F

loc_BEF3:				; CODE XREF: sub_BD34+1BBj
		tab
		cmpa	Temp0
		bcs	loc_BEFE

loc_BEF9:				; CODE XREF: sub_BD34+17Dj
					; sub_BD34+1AAj
		ldaa	Temp0
		ldab	#$FF

loc_BEFE:				; CODE XREF: sub_BD34+193j
					; sub_BD34+195j ...
		clr	CounterUp_43

loc_BF01:				; CODE XREF: sub_BD34+18Bj
					; sub_BD34+1B4j
		staa	Temp0
		stab	<Ram_4C
		adda	<Ram_4B
		bvc	loc_BF10
		bpl	loc_BF12
		ldaa	#$7F
		bra	loc_BF13
; ---------------------------------------------------------------------------

loc_BF10:				; CODE XREF: sub_BD34+1D4j
		bpl	loc_BF13

loc_BF12:				; CODE XREF: sub_BD34+1D6j
		clra

loc_BF13:				; CODE XREF: sub_BD34+1DAj
					; sub_BD34:loc_BF10j
		ldab	UNe_6481
		bitb	#2
		beq	loc_BF1D
		ldaa	UNe_6482

loc_BF1D:				; CODE XREF: sub_BD34+1E4j
		staa	<AdvanceTemporary
		rts
; End of function sub_BD34


; =============== S U B	R O U T	I N E =======================================


sub_BF20:				; CODE XREF: sub_BD34:loc_BDCFP
					; sub_BD34+EFP	...
		tst	Temp4
		bpl	loc_BF30
		ldaa	Temp4
		adda	Temp5
		bpl	loc_BF3A
		clra
		bra	loc_BF3A
; ---------------------------------------------------------------------------

loc_BF30:				; CODE XREF: sub_BF20+3j
		ldaa	Temp4
		adda	Temp5
		bpl	loc_BF3A
		ldaa	#$7F

loc_BF3A:				; CODE XREF: sub_BF20+Bj sub_BF20+Ej ...
		staa	Temp5
		rts
; End of function sub_BF20


; =============== S U B	R O U T	I N E =======================================


sub_BF3E:				; CODE XREF: __RESET+689P
		brclr	<Ram_EC	$20 locret_BF91
		brclr	<Ram_05	1 loc_BF4D
		ldaa	<Ram_FE
		cmpa	byte_842A
		bcs	locret_BF91

loc_BF4D:				; CODE XREF: sub_BF3E+4j
		bclr	<Ram_EC	$20
		ldx	#$842B
		ldaa	<CoolantTemp
		jsr	Lookup4ByteTable
		clrb
		std	Temp0
		sei
		std	InjectorPulsewidth_HB_Cyl4
		std	InjectorPulsewidth_HB_Cyl3
		std	InjectorPulsewidth_HB_Cyl2
		std	InjectorPulsewidth_HB_Cyl1
		brset	<BitFlags27 $80	loc_BF8D
		ldd	#$F060
		oraa	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1
		stab	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	Temp0
		std	TOC2_Counter_OC2
		std	TOC3_Counter_OC3
		ldaa	TCTL1_TimerControlReg1
		anda	#$AF
		staa	TCTL1_TimerControlReg1

loc_BF8D:				; CODE XREF: sub_BF3E+2Bj
		bset	<Ram_EC	$40
		cli

locret_BF91:				; CODE XREF: sub_BF3Ej	sub_BF3E+Dj
		rts
; End of function sub_BF3E


; =============== S U B	R O U T	I N E =======================================


sub_BF92:				; CODE XREF: __RESET+5C8P
		ldaa	<TimerOverflowsBetweenCamPulses
		bne	loc_BFCD
		ldd	word_807C
		cpd	word_82B1
		bcc	loc_BFA2
		ldd	word_82B1

loc_BFA2:				; CODE XREF: sub_BF92+Bj
		cpd	<DistributorFallingEdgePulsewidth_HB
		bcs	loc_BFCD
		ldx	#$6400
		brset	<IPL1 $41 loc_BFD3
		brset	<BitFlags23 $80	loc_BFC0
		brclr	0,x $20	loc_BFD3
		bset	<BitFlags23 $80
		ldaa	byte_807E
		staa	<Ram_7F
		bra	locret_BFD6
; ---------------------------------------------------------------------------

loc_BFC0:				; CODE XREF: sub_BF92+1Cj
		brset	0,x $20	locret_BFD6
		ldaa	<Ram_7F
		beq	locret_BFD6
		deca
		staa	<Ram_7F
		bra	locret_BFD6
; ---------------------------------------------------------------------------

loc_BFCD:				; CODE XREF: sub_BF92+2j sub_BF92+13j
		bclr	<IPL1 $41
		bclr	<BitFlags23 $80

loc_BFD3:				; CODE XREF: sub_BF92+18j sub_BF92+20j
		clr	Ram_7F

locret_BFD6:				; CODE XREF: sub_BF92+2Cj
					; sub_BF92:loc_BFC0j ...
		rts
; End of function sub_BF92


; =============== S U B	R O U T	I N E =======================================


calc_fuel_MM:				; CODE XREF: __RESET+40DP __RESET+5D4P
		brset	<IPL1 $40 locret_C04D
		ldaa	<CoolantTemp_fromTable_Scaled
		ldx	#$845D
		jsr	sub_E68D
		pshb
		ldaa	<BaroPressure
		ldx	#$8466
		jsr	sub_E68D
		pula
		mul
		std	Temp2
		ldaa	<CounterUp_UsedInCalcFuel
		ldx	#$846F
		jsr	Lookup4ByteTable
		ldy	Temp2
		jsr	ScaleYbyA
		sty	Temp4
		ldd	Temp2
		subd	Temp4
		std	Temp2
		ldaa	<EngineRpm_HB
		ldx	#$8482
		jsr	Lookup4ByteTable
		ldy	Temp2
		jsr	ScaleYbyA
		sty	Temp4
		ldd	Temp2
		subd	Temp4
		std	Temp2
		clra
		ldab	<Ram_B1
		lsld
		lsld
		addd	Temp2
		bcc	loc_C036
		ldd	#$FFFF

loc_C036:				; CODE XREF: calc_fuel_MM+5Aj
		brclr	<BitFlags21 2 loc_C04B
		xgdy
		ldaa	<CoolantTemp
		cmpa	byte_8AB7
		bcc	loc_C049
		ldaa	byte_8AB8
		jsr	ScaleYbyA

loc_C049:				; CODE XREF: calc_fuel_MM+6Aj
		xgdy

loc_C04B:				; CODE XREF: calc_fuel_MM:loc_C036j
		std	<Ram_71

locret_C04D:				; CODE XREF: calc_fuel_MMj
		rts
; End of function calc_fuel_MM


; =============== S U B	R O U T	I N E =======================================


sub_C04E:				; CODE XREF: __RESET+647P
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	byte_8684
		bcs	loc_C0B0
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	byte_8685
		bcs	loc_C0B0
		ldaa	<CoolantTemp
		cmpa	byte_8686
		bcs	loc_C0B0
		ldaa	<BaroPressure
		cmpa	byte_868B
		bcs	loc_C0B0
		ldaa	byte_8681
		ldab	<TargetIdleSpeedHB
		mul
		addd	<TargetIdleSpeedHB
		bcc	loc_C077
		ldd	#$FFFF

loc_C077:				; CODE XREF: sub_C04E+24j
		cpd	<EngineRpm_HB
		bcc	loc_C0B0
		brclr	<BitFlags2c $40	loc_C087
		jsr	sub_C109
		brset	<BitFlags2c $40	loc_C0B0

loc_C087:				; CODE XREF: sub_C04E+2Ej
		ldaa	byte_868C
		bne	loc_C092
		brclr	<BitFlags66_t3 $80 loc_C0B7
		bra	loc_C0B0
; ---------------------------------------------------------------------------

loc_C092:				; CODE XREF: sub_C04E+3Cj
		cmpa	#1
		bne	loc_C0A0
		ldd	<Ram_73
		cpd	word_868D
		bcs	loc_C0B7
		bra	loc_C0B0
; ---------------------------------------------------------------------------

loc_C0A0:				; CODE XREF: sub_C04E+46j
		cmpa	#2
		bne	loc_C0B0
		ldd	<Ram_73
		cpd	word_868D
		bcc	loc_C0B0
		brclr	<BitFlags66_t3 $80 loc_C0B7

loc_C0B0:				; CODE XREF: sub_C04E+5j sub_C04E+Cj ...
		ldaa	byte_8682
		staa	<Counter_E
		bra	loc_C0BE
; ---------------------------------------------------------------------------

loc_C0B7:				; CODE XREF: sub_C04E+3Ej sub_C04E+4Ej ...
		ldaa	<Counter_E
		bne	loc_C0BE
		bset	<BitFlags2c $C0

loc_C0BE:				; CODE XREF: sub_C04E+67j sub_C04E+6Bj
		ldd	word_868F
		brclr	<BitFlags2c 2 loc_C0CD
		subd	word_8691
		bcc	loc_C0CD
		ldd	#0

loc_C0CD:				; CODE XREF: sub_C04E+73j sub_C04E+7Aj
		cpd	<EngineRpm_HB
		bcc	loc_C0E9
		ldaa	byte_8693
		brclr	<BitFlags2c 2 loc_C0E0
		suba	byte_8694
		bcc	loc_C0E0
		ldaa	#0

loc_C0E0:				; CODE XREF: sub_C04E+87j sub_C04E+8Ej
		cmpa	<VehicleSpeedx8_Scaled
		bcc	loc_C0E9
		bset	<BitFlags2c 2
		bra	loc_C0EC
; ---------------------------------------------------------------------------

loc_C0E9:				; CODE XREF: sub_C04E+82j sub_C04E+94j
		bclr	<BitFlags2c 2

loc_C0EC:				; CODE XREF: sub_C04E+99j
		ldd	word_8695
		brclr	<BitFlags2c 1 loc_C0FB
		subd	word_8697
		bcc	loc_C0FB
		ldd	#0

loc_C0FB:				; CODE XREF: sub_C04E+A1j sub_C04E+A8j
		cpd	<EngineRpm_HB
		bcc	loc_C105
		bset	<BitFlags2c 1
		bra	locret_C108
; ---------------------------------------------------------------------------

loc_C105:				; CODE XREF: sub_C04E+B0j
		bclr	<BitFlags2c 1

locret_C108:				; CODE XREF: sub_C04E+B5j
		rts
; End of function sub_C04E


; =============== S U B	R O U T	I N E =======================================


sub_C109:				; CODE XREF: sub_C04E+32P
		tst	CounterDn_b7_o2
		bne	locret_C146
		ldaa	<EngineRpm_HB
		cmpa	<RpmRelated0087
		bcs	locret_C146
		ldd	<Ram_73
		cpd	word_8687
		bcc	loc_C11E
		bra	loc_C143
; ---------------------------------------------------------------------------

loc_C11E:				; CODE XREF: sub_C109+11j
		ldx	<Ram_73
		ldaa	byte_8683
		bne	loc_C12B
		brset	<BitFlags66_t3 $80 loc_C143
		bra	locret_C146
; ---------------------------------------------------------------------------

loc_C12B:				; CODE XREF: sub_C109+1Aj
		cmpa	#1
		bne	loc_C136
		cpx	word_8689
		bcc	loc_C143
		bra	locret_C146
; ---------------------------------------------------------------------------

loc_C136:				; CODE XREF: sub_C109+24j
		cmpa	#2
		bne	loc_C143
		brclr	<BitFlags66_t3 $80 locret_C146
		cpx	word_8689
		bcs	locret_C146

loc_C143:				; CODE XREF: sub_C109+13j sub_C109+1Cj ...
		bclr	<BitFlags2c $40

locret_C146:				; CODE XREF: sub_C109+3j sub_C109+9j ...
		rts
; End of function sub_C109


; =============== S U B	R O U T	I N E =======================================


sub_C147:				; CODE XREF: __RESET+5D7P
		ldx	#$84EE
		ldd	<EngineRpm_HB
		aslb
		adca	#0
		jsr	Lookup4ByteTable
		staa	Temp0
		ldab	<MapValue
		ldx	#$850D
		jsr	sub_E72F
		staa	<o2LowLimitForInMiddleDetermination
		ldaa	Temp0
		ldab	<MapValue
		ldx	#$85A9
		jsr	sub_E72F
		staa	Temp1
		brclr	<BitFlags29 8 loc_C181
		ldaa	Temp0
		ldab	<MapValue
		ldx	#$8ABA
		jsr	sub_E72F
		tab
		ldaa	Temp1
		sba

loc_C181:				; CODE XREF: sub_C147+26j
		staa	<o2HighLimitForInMiddleDetermination
		rts
; End of function sub_C147


; =============== S U B	R O U T	I N E =======================================


sub_C184:				; CODE XREF: __RESET+64AP
		ldaa	<CoolantTemp
		cmpa	byte_8671
		bcc	loc_C194
		ldd	#0
		staa	<Ram_82
		std	<Counter_F_HB
		bra	locret_C1F0
; ---------------------------------------------------------------------------

loc_C194:				; CODE XREF: sub_C184+5j
		ldab	<EngineRpmTemp
		cmpb	byte_8672
		bcs	loc_C19F
		brset	<BitFlags66_t3 $40 loc_C1BE

loc_C19F:				; CODE XREF: sub_C184+15j
		ldaa	<EngineRpmTemp
		ldab	<RPM_Scaled_maybe
		cmpa	byte_8676
		bls	loc_C1AD
		cmpb	byte_8677
		bhi	loc_C1B2

loc_C1AD:				; CODE XREF: sub_C184+22j
		clr	Ram_82
		bra	loc_C1B7
; ---------------------------------------------------------------------------

loc_C1B2:				; CODE XREF: sub_C184+27j
		ldaa	byte_8678
		staa	<Ram_82

loc_C1B7:				; CODE XREF: sub_C184+2Cj
		ldd	#0
		std	<Counter_F_HB
		bra	locret_C1F0
; ---------------------------------------------------------------------------

loc_C1BE:				; CODE XREF: sub_C184+17j
		ldaa	<EngineRpmTemp
		cmpa	byte_8673
		bhi	loc_C1DD
		ldab	<Ram_82
		cmpa	byte_867B
		bcs	loc_C1D1
		cmpb	byte_8674
		beq	loc_C1DB

loc_C1D1:				; CODE XREF: sub_C184+46j
		ldaa	byte_8675
		staa	<Ram_82
		ldd	#0
		std	<Counter_F_HB

loc_C1DB:				; CODE XREF: sub_C184+4Bj
		bra	locret_C1F0
; ---------------------------------------------------------------------------

loc_C1DD:				; CODE XREF: sub_C184+3Fj
		ldx	<Counter_F_HB
		cpx	word_8679
		bcc	loc_C1EB
		ldaa	byte_8675
		staa	<Ram_82
		bra	locret_C1F0
; ---------------------------------------------------------------------------

loc_C1EB:				; CODE XREF: sub_C184+5Ej
		ldaa	byte_8674
		staa	<Ram_82

locret_C1F0:				; CODE XREF: sub_C184+Ej sub_C184+38j	...
		rts
; End of function sub_C184


; =============== S U B	R O U T	I N E =======================================


sub_C1F1:				; CODE XREF: __RESET+64DP
		sei
		ldaa	<MapValueTemp2
		staa	<Ram_9D
		ldaa	<MapValue
		staa	<Ram_9E
		ldd	<DistributorFallingEdgePulsewidth_HB
		lsld
		lsld
		std	<Ram_9F
		ldaa	<Counter_O2SensorFeedbackCount_Signed
		staa	<Ram_A2
		ldaa	<BitFlags29
		eora	<Ram_A1
		anda	#$80
		beq	loc_C211
		bset	<BitFlags29 1
		bra	loc_C214
; ---------------------------------------------------------------------------

loc_C211:				; CODE XREF: sub_C1F1+19j
		bclr	<BitFlags29 1

loc_C214:				; CODE XREF: sub_C1F1+1Ej
		ldaa	<BitFlags29
		staa	<Ram_A1
		cli
		ldab	<Ram_0B
		cmpb	byte_866E
		bcs	loc_C225
		cmpb	byte_866D
		bls	loc_C22B

loc_C225:				; CODE XREF: sub_C1F1+2Dj
		ldaa	#$80
		staa	<Ram_0B
		staa	<ValueFromAdaptiveMemory

loc_C22B:				; CODE XREF: sub_C1F1+32j
		brclr	<Ram_A1	$40 loc_C284
		ldaa	<Ram_9D
		suba	<Ram_9E
		bcc	loc_C236
		nega

loc_C236:				; CODE XREF: sub_C1F1+42j
		cmpa	byte_865D
		bcc	loc_C284
		ldaa	<CoolantTemp
		cmpa	byte_865C
		bcs	loc_C284
		ldaa	<Ram_9F
		cmpa	byte_8660
		bcc	loc_C26E
		cmpa	byte_865F
		bcc	loc_C284
		cmpa	byte_865E
		bcs	loc_C284
		ldaa	<Ram_9E
		cmpa	byte_8662
		bcs	loc_C269
		ldx	#$8663
		brset	<BitFlags2c $20	loc_C286
		bset	<BitFlags2c $20
		bclr	<BitFlags2c $10
		bra	loc_C27B
; ---------------------------------------------------------------------------

loc_C269:				; CODE XREF: sub_C1F1+67j
		cmpa	byte_8661
		bcc	loc_C284

loc_C26E:				; CODE XREF: sub_C1F1+56j
		ldx	#$8668
		brset	<BitFlags2c $10	loc_C286
		bset	<BitFlags2c $10
		bclr	<BitFlags2c $20

loc_C27B:				; CODE XREF: sub_C1F1+76j
		clra
		clrb
		std	<Ram_9B
		ldaa	0,x
		staa	<Ram_99

locret_C283:				; CODE XREF: sub_C1F1:loc_C286j
					; sub_C1F1+A6j
		rts
; ---------------------------------------------------------------------------

loc_C284:				; CODE XREF: sub_C1F1:loc_C22Bj
					; sub_C1F1+48j	...
		bra	loc_C2E2
; ---------------------------------------------------------------------------

loc_C286:				; CODE XREF: sub_C1F1+6Cj sub_C1F1+80j
		brclr	<Ram_A1	1 locret_C283
		clra
		staa	Temp0
		ldab	<Ram_A2
		addd	<Ram_9B
		std	<Ram_9B
		dec	Ram_99
		bne	locret_C283
		subd	1,x
		bcs	loc_C2A4
		subd	3,x
		bcs	loc_C2E2
		inc	Temp0

loc_C2A4:				; CODE XREF: sub_C1F1+AAj
		brset	<BitFlags2c $20	loc_C2C4
		ldaa	<Ram_9A
		beq	loc_C2E2
		deca
		staa	<Ram_9A
		ldaa	<ValueFromAdaptiveMemory
		ldab	Temp0
		beq	loc_C2BB
		adda	byte_866F
		bra	loc_C2BE
; ---------------------------------------------------------------------------

loc_C2BB:				; CODE XREF: sub_C1F1+C3j
		suba	byte_866F

loc_C2BE:				; CODE XREF: sub_C1F1+C8j
		bcs	loc_C2E2
		staa	<ValueFromAdaptiveMemory
		bra	loc_C2E2
; ---------------------------------------------------------------------------

loc_C2C4:				; CODE XREF: sub_C1F1:loc_C2A4j
		ldaa	<Ram_0B
		ldab	Temp0
		beq	loc_C2CD
		inca
		inca

loc_C2CD:				; CODE XREF: sub_C1F1+D8j
		deca
		ldab	byte_866D
		cba
		bcc	loc_C2DB
		ldab	byte_866E
		cba
		bcs	loc_C2DB
		tab

loc_C2DB:				; CODE XREF: sub_C1F1+E1j sub_C1F1+E7j
		stab	<Ram_0B
		ldaa	byte_8670
		staa	<Ram_9A

loc_C2E2:				; CODE XREF: sub_C1F1:loc_C284j
					; sub_C1F1+AEj	...
		bclr	<BitFlags2c $30
		rts
; End of function sub_C1F1


; =============== S U B	R O U T	I N E =======================================


sub_C2E6:				; CODE XREF: __RESET+650P
		ldaa	<MapValue
		ldab	byte_864E
		mul
		ldab	#$FF
		subb	<BaroPressure
		mul
		lsrd
		lsrd
		lsrd
		lsrd
		std	<MAPLoadFactor
		rts
; End of function sub_C2E6


; =============== S U B	R O U T	I N E =======================================


sub_C2F8:				; CODE XREF: __RESET+616P
		ldx	<Counter_A_HB
		beq	loc_C2FF
		dex
		stx	<Counter_A_HB

loc_C2FF:				; CODE XREF: sub_C2F8+2j
		ldaa	<Counter_B
		beq	loc_C306
		deca
		staa	<Counter_B

loc_C306:				; CODE XREF: sub_C2F8+9j
		ldaa	<Counter_C
		beq	loc_C30D
		deca
		staa	<Counter_C

loc_C30D:				; CODE XREF: sub_C2F8+10j
		brclr	<IPL1 $40 loc_C32D
		brset	<BitFlags2c 4 loc_C323
		ldaa	<Counter_X
		beq	loc_C31E
		deca
		staa	<Counter_X
		bne	loc_C32D

loc_C31E:				; CODE XREF: sub_C2F8+1Fj
		sei
		bset	<BitFlags2c 4
		cli

loc_C323:				; CODE XREF: sub_C2F8+19j
		ldaa	<PreviousCoolantTemp_fromTable_Scaled
		ldx	#$84E2
		jsr	sub_E68D
		stab	<Counter_X

loc_C32D:				; CODE XREF: sub_C2F8:loc_C30Dj
					; sub_C2F8+24j
		ldaa	<Counter_D
		inca
		beq	loc_C334
		staa	<Counter_D

loc_C334:				; CODE XREF: sub_C2F8+38j
		ldaa	<Counter_E
		beq	loc_C33B
		deca
		staa	<Counter_E

loc_C33B:				; CODE XREF: sub_C2F8+3Ej
		ldx	<Counter_F_HB
		inx
		beq	locret_C342
		stx	<Counter_F_HB

locret_C342:				; CODE XREF: sub_C2F8+46j
		rts
; End of function sub_C2F8


; =============== S U B	R O U T	I N E =======================================


CalculateVariousFactors2:		; CODE XREF: __RESET:CalculateVariousFactors3P
					; __RESET+5D1P
		ldaa	<IntakeTemp_fromTable_Scaled
		ldx	#$8421
		jsr	sub_E68D
		stab	<Ram_81
		ldaa	<CoolantTemp_fromTable_Scaled
		brset	<IPL1 $40 loc_C38B
		ldaa	<PreviousCoolantTemp_fromTable_Scaled
		ldx	#$84E2
		jsr	sub_E68D
		stab	<Counter_X
		ldaa	<CoolantTemp_fromTable_Scaled
		ldx	#$83FD
		jsr	sub_E68D
		tba
		brclr	<BitFlags21 2 loc_C377
		ldab	<CoolantTemp
		cmpb	byte_8AB7
		bcc	loc_C377
		ldab	byte_8AB9
		mul
		adca	#0

loc_C377:				; CODE XREF: CalculateVariousFactors2+23j
					; CalculateVariousFactors2+2Cj
		staa	<Ram_BD
		ldaa	<CoolantTemp_fromTable_Scaled
		ldx	#$84B5
		jsr	sub_E68D
		tba
		clrb
		lsrd
		lsrd
		lsrd
		lsrd
		std	<Counter_A_HB
		ldaa	<CoolantTemp_fromTable_Scaled

loc_C38B:				; CODE XREF: CalculateVariousFactors2+Cj
		ldx	#$8406
		jsr	sub_E68D
		stab	<Ram_BE
		ldx	#$83EB
		jsr	sub_E68D
		stab	<Ram_A3
		ldx	#$84BE
		jsr	sub_E68D
		stab	<Ram_A6
		ldx	#$83F4
		jsr	sub_E68D
		stab	<Ram_A9
		ldx	#$84A3
		jsr	sub_E68D
		stab	<MapAverageFactorRAM_LB
		ldx	#$849A
		jsr	sub_E68D
		stab	<TPSAverageFactorRAM_HB
		ldx	#$84AC
		jsr	sub_E68D
		stab	<TPSAverageFactorRAM_LB
		ldx	#$84C7
		jsr	sub_E68D
		stab	<Ram_AC
		ldaa	<BatteryVolts
		ldx	#$843E
		jsr	Lookup4ByteTable
		stab	<Ram_B1
		ldaa	<BatteryVolts
		ldx	#$E5FA
		jsr	Lookup4ByteTable
		stab	CalculatedDwellTime
		rts
; End of function CalculateVariousFactors2


; =============== S U B	R O U T	I N E =======================================


CalculateAverageValues:			; CODE XREF: sub_C75D:loc_C952P
		ldaa	<TimerOverflowsBetweenCamPulses
		bne	loc_C3ED
		ldd	word_82AF
		cpd	<DistributorFallingEdgePulsewidth_HB
		bcc	loc_C3F2

loc_C3ED:				; CODE XREF: CalculateAverageValues+2j
		bset	<BitFlags29 2
		bra	loc_C3FC
; ---------------------------------------------------------------------------

loc_C3F2:				; CODE XREF: CalculateAverageValues+Aj
		ldd	<EngineRpm_HB
		cpd	<TargetIdleSpeedHB
		bcs	loc_C3FC
		bclr	<BitFlags29 2

loc_C3FC:				; CODE XREF: CalculateAverageValues+Fj
					; CalculateAverageValues+16j
		brclr	<BitFlags29 2 loc_C40F
		clrb
		ldaa	<MapValue
		std	<MapValueTemp2
		ldaa	<EngineRpm_HB
		std	<EngineRpmTemp
		ldaa	<TpsVolts
		std	<TPSVoltsTemp_B
		bra	loc_C43C
; ---------------------------------------------------------------------------

loc_C40F:				; CODE XREF: CalculateAverageValues:loc_C3FCj
		ldx	#$93
		ldaa	<MapValueTemp2
		suba	<MapValue
		bcc	loc_C41B
		ldx	#$8655

loc_C41B:				; CODE XREF: CalculateAverageValues+35j
		ldy	#$8C
		ldaa	<MapValue
		jsr	ProcessMapOrTpsBlockData
		ldx	#$84D5
		ldy	#$88
		ldaa	<EngineRpm_HB
		jsr	ProcessMapOrTpsBlockData
		ldx	#$865A
		ldy	#$97
		ldaa	<TpsVolts
		jsr	ProcessMapOrTpsBlockData

loc_C43C:				; CODE XREF: CalculateAverageValues+2Cj
		ldx	#$84D0
		ldy	#$8E
		ldaa	<MapValue
		jsr	ProcessMapOrTpsBlockData
		rts
; End of function CalculateAverageValues


; =============== S U B	R O U T	I N E =======================================


AVG2_CalculateAverages2:		; CODE XREF: sub_C75D:loc_C971P
		ldx	#$864F
		ldaa	<MapValueTemp1
		cmpa	<MapValue
		bcc	loc_C455
		ldx	#$91

loc_C455:				; CODE XREF: AVG2_CalculateAverages2+7j
		ldy	#$8A
		ldaa	<MapValue
		jsr	ProcessMapOrTpsBlockData
		ldx	#$8653
		ldaa	<TPSVoltsTemp_A
		cmpa	<TpsVolts
		bcc	loc_C46A
		ldx	#$93

loc_C46A:				; CODE XREF: AVG2_CalculateAverages2+1Cj
		ldy	#$95
		ldaa	<TpsVolts
		jsr	ProcessMapOrTpsBlockData
		rts
; End of function AVG2_CalculateAverages2


; =============== S U B	R O U T	I N E =======================================


sub_C474:				; CODE XREF: sub_C75D+6FP
		brset	<BitFlags6d_t3 $40 loc_C480
		brclr	<PIA2_Buffer_t3	2 loc_C488
		ldaa	<Ram_CC
		bne	loc_C488

loc_C480:				; CODE XREF: sub_C474j
		ldaa	byte_84DD
		ldx	#$834F
		bra	loc_C48E
; ---------------------------------------------------------------------------

loc_C488:				; CODE XREF: sub_C474+4j sub_C474+Aj
		ldaa	byte_84DE
		ldx	#$82B3

loc_C48E:				; CODE XREF: sub_C474+12j
		staa	<Ram_85
		ldaa	<EngineRPM_3D
		ldab	<MapValue2
		jsr	sub_E72F
		staa	<Ram_86
		rts
; End of function sub_C474


; =============== S U B	R O U T	I N E =======================================


sub_C49A:				; CODE XREF: IC1I+14CP	IC1I:loc_F6F2P
		ldaa	<MapValue
		ldx	#$840F
		jsr	sub_E68D
		ldaa	<Ram_BE
		lsra
		mul
		ldab	<Ram_BE
		lsrb
		lsrb
		aba
		bcs	loc_C4C9
		staa	LDXi_6490
		brclr	<BitFlags2c 4 loc_C4C1
		ldaa	<Ram_BD
		beq	loc_C4BE
		ldab	byte_84E1
		mul
		staa	<Ram_BD

loc_C4BE:				; CODE XREF: sub_C49A+1Cj
		bclr	<BitFlags2c 4

loc_C4C1:				; CODE XREF: sub_C49A+16j
		ldaa	LDXi_6490
		ldab	<Ram_BD
		aba
		bcc	loc_C4CB

loc_C4C9:				; CODE XREF: sub_C49A+11j
		ldaa	#$FF

loc_C4CB:				; CODE XREF: sub_C49A+2Dj
		staa	<Ram_84
		rts
; End of function sub_C49A


; =============== S U B	R O U T	I N E =======================================


sub_C4CE:				; CODE XREF: IC1I+14FP	IC1I+7C2P
		ldd	<Ram_73
		cpd	word_84EC
		bcc	loc_C4DB
		bset	<BitFlags29 $20
		bra	loc_C4E7
; ---------------------------------------------------------------------------

loc_C4DB:				; CODE XREF: sub_C4CE+6j
		bclr	<BitFlags29 $20
		brset	<BitFlags2c $80	loc_C4E7
		tst	Ram_82
		beq	loc_C4EC

loc_C4E7:				; CODE XREF: sub_C4CE+Bj sub_C4CE+10j
		ldaa	byte_84EB
		staa	<CounterDn_b9_o2

loc_C4EC:				; CODE XREF: sub_C4CE+17j
		ldaa	<Ram_B4
		cmpa	byte_8A55
		bcs	loc_C519
		brclr	<BitFlags29 $80	loc_C508
		brset	<b5D_IPL2_t3 1 loc_C538
		ldd	#$381
		jsr	ThrowNonCriticalError_
		bcc	loc_C519
		bset	<b5D_IPL2_t3 1
		bra	loc_C538
; ---------------------------------------------------------------------------

loc_C508:				; CODE XREF: sub_C4CE+25j
		brset	<b5D_IPL2_t3 2 loc_C538
		ldd	#$481
		jsr	ThrowNonCriticalError_
		bcc	loc_C519
		bset	<b5D_IPL2_t3 2
		bra	loc_C538
; ---------------------------------------------------------------------------

loc_C519:				; CODE XREF: sub_C4CE+23j sub_C4CE+33j ...
		tst	CounterDn_b9_o2
		bne	loc_C538
		ldd	<Counter_A_HB
		bne	loc_C538
		brset	<BitFlags29 $40	loc_C532
		ldaa	<O2SensorVolts
		cmpa	byte_8A53
		bcc	loc_C532
		cmpa	byte_8A54
		bcc	loc_C538

loc_C532:				; CODE XREF: sub_C4CE+54j sub_C4CE+5Dj
		ldaa	<O2SensorVolts
		cmpa	#$3E
		bcs	loc_C54B

loc_C538:				; CODE XREF: sub_C4CE+29j sub_C4CE+38j ...
		bclr	<BitFlags29 $54
		ldaa	byte_8649
		staa	<CounterDn_ba_o2
		ldaa	byte_864B
		staa	<CounterDn_bc_o2
		ldaa	#$80
		staa	<Counter_O2SensorFeedbackCount_Signed
		bra	locret_C577
; ---------------------------------------------------------------------------

loc_C54B:				; CODE XREF: sub_C4CE+68j
		jsr	sub_C578
		ldaa	<BitFlags29
		bita	#4
		beq	loc_C55C
		clr	Ram_B4
		jsr	sub_C5A3
		bra	loc_C55F
; ---------------------------------------------------------------------------

loc_C55C:				; CODE XREF: sub_C4CE+84j
		jsr	sub_C5DF

loc_C55F:				; CODE XREF: sub_C4CE+8Cj
		brset	<BitFlags29 $80	loc_C56B
		adda	<Counter_O2SensorFeedbackCount_Signed
		bcc	loc_C572
		ldaa	#$FF
		bra	loc_C572
; ---------------------------------------------------------------------------

loc_C56B:				; CODE XREF: sub_C4CE:loc_C55Fj
		tab
		ldaa	<Counter_O2SensorFeedbackCount_Signed
		sba
		bcc	loc_C572
		clra

loc_C572:				; CODE XREF: sub_C4CE+97j sub_C4CE+9Bj ...
		staa	<Counter_O2SensorFeedbackCount_Signed
		bset	<BitFlags29 $40

locret_C577:				; CODE XREF: sub_C4CE+7Bj
		rts
; End of function sub_C4CE


; =============== S U B	R O U T	I N E =======================================


sub_C578:				; CODE XREF: sub_C4CE:loc_C54BP
		ldab	<O2SensorVolts
		ldaa	<BitFlags29
		cmpb	<o2HighLimitForInMiddleDetermination
		bcs	loc_C58C
		cmpb	<o2LowLimitForInMiddleDetermination
		bcc	loc_C588
		brclr	<BitFlags29 $80	loc_C58C

loc_C588:				; CODE XREF: sub_C578+Aj
		ldab	#$80
		bra	loc_C58D
; ---------------------------------------------------------------------------

loc_C58C:				; CODE XREF: sub_C578+6j sub_C578+Cj
		clrb

loc_C58D:				; CODE XREF: sub_C578+12j
		pshb
		eorb	<BitFlags29
		aslb
		bcc	loc_C59A
		oraa	#4
		clr	Ram_B4
		bra	loc_C59C
; ---------------------------------------------------------------------------

loc_C59A:				; CODE XREF: sub_C578+19j
		anda	#$FB

loc_C59C:				; CODE XREF: sub_C578+20j
		anda	#$7F
		pulb
		aba
		staa	<BitFlags29
		rts
; End of function sub_C578


; =============== S U B	R O U T	I N E =======================================


sub_C5A3:				; CODE XREF: sub_C4CE+89P
		brclr	<BitFlags29 $10	loc_C5B5
		ldaa	<CounterUp_b6_o2
		ldab	byte_8648
		cba
		bcs	loc_C5B3
		stab	<Ram_B5
		bra	loc_C5B5
; ---------------------------------------------------------------------------

loc_C5B3:				; CODE XREF: sub_C5A3+Aj
		staa	<Ram_B5

loc_C5B5:				; CODE XREF: sub_C5A3j	sub_C5A3+Ej
		bclr	<BitFlags29 $10
		clr	CounterUp_b6_o2
		ldaa	byte_8649
		staa	<CounterDn_ba_o2
		ldaa	byte_864B
		staa	<CounterDn_bc_o2
		ldab	<Ram_B5
		ldaa	<EngineRpm_HB
		cmpa	byte_8647
		bcc	loc_C5D3
		addb	byte_8645
		bra	loc_C5D6
; ---------------------------------------------------------------------------

loc_C5D3:				; CODE XREF: sub_C5A3+29j
		addb	byte_8646

loc_C5D6:				; CODE XREF: sub_C5A3+2Ej
		bcc	loc_C5DA
		ldab	#$FF

loc_C5DA:				; CODE XREF: sub_C5A3:loc_C5D6j
		tba
		lsr	Ram_B5
		rts
; End of function sub_C5A3


; =============== S U B	R O U T	I N E =======================================


sub_C5DF:				; CODE XREF: sub_C4CE:loc_C55CP
		clra
		ldab	<CounterDn_bc_o2
		bne	loc_C62C
		ldab	<BitFlags29
		bitb	#$10
		bne	loc_C5F9
		clr	CounterUp_b6_o2
		bset	<BitFlags29 $10
		ldab	byte_864A
		stab	<CounterDn_bb_o2
		ldaa	#1
		bra	locret_C637
; ---------------------------------------------------------------------------

loc_C5F9:				; CODE XREF: sub_C5DF+9j
		ldab	<CounterUp_b6_o2
		cmpb	byte_864D
		bcs	loc_C61F
		brset	<BitFlags2c $80	loc_C612
		ldab	<VehicleSpeedx8_Scaled
		beq	loc_C612
		ldab	<EngineRpm_HB
		cmpb	byte_8A52
		bcs	loc_C612
		inc	Ram_B4

loc_C612:				; CODE XREF: sub_C5DF+21j sub_C5DF+27j ...
		ldaa	byte_864C
		clrb
		lsrd
		lsrd
		lsrd
		lsrd
		std	<Counter_A_HB
		clra
		bra	locret_C637
; ---------------------------------------------------------------------------

loc_C61F:				; CODE XREF: sub_C5DF+1Fj
		ldab	<CounterDn_bb_o2
		bne	loc_C62A
		ldaa	#1
		ldab	byte_864A
		stab	<CounterDn_bb_o2

loc_C62A:				; CODE XREF: sub_C5DF+42j
		bra	locret_C637
; ---------------------------------------------------------------------------

loc_C62C:				; CODE XREF: sub_C5DF+3j
		ldab	<CounterDn_ba_o2
		bne	locret_C637
		ldab	byte_8649
		stab	<CounterDn_ba_o2
		ldaa	#1

locret_C637:				; CODE XREF: sub_C5DF+18j sub_C5DF+3Ej ...
		rts
; End of function sub_C5DF


; =============== S U B	R O U T	I N E =======================================


sub_C638:				; CODE XREF: sub_C75D:loc_C7B4P
		brclr	<BitFlags66_t3 $80 loc_C64C
		ldab	<MapValue
		subb	<MapValueTemp1
		bcs	loc_C64C
		ldaa	<Ram_A4
		bne	loc_C64F
		ldaa	byte_8650
		cba
		bcs	loc_C64F

loc_C64C:				; CODE XREF: sub_C638j	sub_C638+8j
		clrb
		bra	loc_C651
; ---------------------------------------------------------------------------

loc_C64F:				; CODE XREF: sub_C638+Cj sub_C638+12j
		ldaa	<Ram_A3

loc_C651:				; CODE XREF: sub_C638+15j
		mul
		std	<Ram_A4
		ldaa	<TPSVoltsTemp_A
		ldab	byte_8652
		addb	<LowestSessionTpsVolts
		bcc	loc_C65F
		ldab	#$FF

loc_C65F:				; CODE XREF: sub_C638+23j
		cba
		bcc	loc_C66D
		ldaa	<TpsVolts
		suba	<TPSVoltsTemp_A
		bcs	loc_C66D
		cmpa	byte_8651
		bcc	loc_C66E

loc_C66D:				; CODE XREF: sub_C638+28j sub_C638+2Ej
		clra

loc_C66E:				; CODE XREF: sub_C638+33j
		ldab	<Ram_A6
		mul
		std	<Ram_A7
		rts
; End of function sub_C638


; =============== S U B	R O U T	I N E =======================================


sub_C674:				; CODE XREF: IC1I+152P	IC1I+7C5P
		clra
		ldab	<Counter_C
		beq	loc_C67C
		jmp	locret_C6B4
; ---------------------------------------------------------------------------

loc_C67C:				; CODE XREF: sub_C674+3j
		ldab	<EngineRpm_HB
		cmpb	byte_8657
		bcs	loc_C690
		ldab	<MapValueTemp2
		subb	<MapValue
		bcs	loc_C690
		cmpb	byte_8655
		bcs	loc_C690
		ldaa	<Ram_A9

loc_C690:				; CODE XREF: sub_C674+Dj sub_C674+13j	...
		mul
		std	<Ram_AA
		ldab	<TpsVolts
		ldaa	<LowestSessionTpsVolts
		adda	byte_8659
		bcc	loc_C69E
		ldaa	#$FF

loc_C69E:				; CODE XREF: sub_C674+26j
		cba
		bcs	loc_C6AB
		ldaa	<TPSVoltsTemp_B
		sba
		bcs	loc_C6AB
		cmpa	byte_8658
		bcc	loc_C6AF

loc_C6AB:				; CODE XREF: sub_C674+2Bj sub_C674+30j
		clra
		clrb
		bra	loc_C6B2
; ---------------------------------------------------------------------------

loc_C6AF:				; CODE XREF: sub_C674+35j
		ldab	<Ram_AC
		mul

loc_C6B2:				; CODE XREF: sub_C674+39j
		std	<Ram_AD

locret_C6B4:				; CODE XREF: sub_C674+5J
		rts
; End of function sub_C674


; =============== S U B	R O U T	I N E =======================================


sub_C6B5:				; CODE XREF: __RESET+5E6P
		ldaa	<EngineRpm_HB
		cmpa	byte_8A1C
		bcc	loc_C6E7
		brclr	<BitFlags2f 8 loc_C6DB
		bclr	<BitFlags2f 8
		ldaa	<CoolantTemp_fromTable_Scaled
		ldx	#$8A1E
		jsr	sub_E68D
		clra
		lsld
		lsld
		lsld
		lsld
		std	STe_64BA
		ldaa	byte_8A1D
		staa	STe_64BC
		bra	locret_C6EC
; ---------------------------------------------------------------------------

loc_C6DB:				; CODE XREF: sub_C6B5+7j
		ldaa	STe_64BC
		cmpa	#0
		beq	loc_C6E7
		dec	STe_64BC
		bra	locret_C6EC
; ---------------------------------------------------------------------------

loc_C6E7:				; CODE XREF: sub_C6B5+5j sub_C6B5+2Bj
		clra
		clrb
		std	STe_64BA

locret_C6EC:				; CODE XREF: sub_C6B5+24j sub_C6B5+30j
		rts
; End of function sub_C6B5


; =============== S U B	R O U T	I N E =======================================


sub_C6ED:				; CODE XREF: __RESET+5F2P
		ldaa	STe_64C0
		beq	loc_C6F7
		dec	STe_64C0
		bra	locret_C725
; ---------------------------------------------------------------------------

loc_C6F7:				; CODE XREF: sub_C6ED+3j
		brclr	<BitFlags2f $10	loc_C716
		bclr	<BitFlags2f $10
		ldx	#$8A29
		ldaa	<CoolantTemp_fromTable_Scaled
		jsr	sub_E68D
		clra
		lsld
		lsld
		lsld
		lsld
		std	STe_64BE
		ldaa	byte_8A28
		staa	STe_64BD
		bra	locret_C725
; ---------------------------------------------------------------------------

loc_C716:				; CODE XREF: sub_C6ED:loc_C6F7j
		ldaa	STe_64BD
		beq	loc_C720
		dec	STe_64BD
		bra	locret_C725
; ---------------------------------------------------------------------------

loc_C720:				; CODE XREF: sub_C6ED+2Cj
		clra
		clrb
		std	STe_64BE

locret_C725:				; CODE XREF: sub_C6ED+8j sub_C6ED+27j	...
		rts
; End of function sub_C6ED


; =============== S U B	R O U T	I N E =======================================


sub_C726:				; CODE XREF: IC1I+155P	IC1I:loc_F70FP
		ldx	#$648F
		ldaa	#1
		ldab	<Ram_81
		std	DoubleTempC
		ldab	<Ram_82
		jsr	sub_E6E9
		std	DoubleTempC
		ldaa	#1
		ldab	<Ram_0B
		jsr	sub_E6E9
		std	DoubleTempC
		ldaa	#1
		ldab	<Counter_O2SensorFeedbackCount_Signed
		jsr	sub_E6E9
		std	DoubleTempC
		xgdy
		ldaa	<Ram_84
		jsr	ScaleYbyA
		xgdy
		lsld
		lsld
		addd	DoubleTempC
		std	<PWMULT_Adaptive_fuel_pulsewidth_multiplier
		rts
; End of function sub_C726


; =============== S U B	R O U T	I N E =======================================


sub_C75D:				; CODE XREF: sub_C75D+3j IC1I+2BBP
		ldaa	ADCTL_A2DControlReg
		bpl	sub_C75D
		ldab	ADR4_A2DResults4
		stab	<LastTpsVolts
		cmpb	byte_8A59
		bcs	loc_C777
		cmpb	byte_8A5A
		bcc	loc_C777
		brset	<b5C_IPL1_t3 $40 loc_C777
		stab	<TpsVolts

loc_C777:				; CODE XREF: sub_C75D+Dj sub_C75D+12j	...
		ldaa	ADR1_A2DResults1
		ldab	<EngineRpm_HB
		cmpb	#$2F
		bcc	loc_C78E
		cmpb	#$D
		bcs	loc_C78E
		cmpa	byte_8A66
		bcc	loc_C792
		cmpa	byte_8A65
		bcs	loc_C792

loc_C78E:				; CODE XREF: sub_C75D+21j sub_C75D+25j
		brclr	<b5C_IPL1_t3 $88 loc_C795

loc_C792:				; CODE XREF: sub_C75D+2Aj sub_C75D+2Fj
		jsr	loc_D7BF

loc_C795:				; CODE XREF: sub_C75D:loc_C78Ej
		jsr	ConvertMAPVoltsToValue
		tab
		addb	MapValue_t3
		rorb
		stab	<MapValue

loc_C79F:				; CODE XREF: IC1I:loc_F720P
		brset	<IPL1 $40 loc_C7A6
		jmp	loc_C8D2
; ---------------------------------------------------------------------------

loc_C7A6:				; CODE XREF: sub_C75D:loc_C79Fj
		brset	<BitFlags27 8 loc_C7B4
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#8
		beq	loc_C7B4
		jsr	Interrupt_DwellTimer

loc_C7B4:				; CODE XREF: sub_C75D:loc_C7A6j
					; sub_C75D+52j
		jsr	sub_C638
		ldx	#$84DF
		ldaa	<MapValue2
		cmpa	<MapValue
		bcc	loc_C7C3
		ldx	#$84DE

loc_C7C3:				; CODE XREF: sub_C75D+61j
		ldy	#$90
		ldaa	<MapValue
		jsr	ProcessMapOrTpsBlockData
		jsr	sub_C474
		brclr	<BitFlags27 $40	loc_C7DD
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$10
		beq	loc_C7DD
		jsr	DwellTimerOC4Interrupt

loc_C7DD:				; CODE XREF: sub_C75D+72j sub_C75D+7Bj
		brclr	<BitFlags27 8 loc_C7EB
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$40
		beq	loc_C7EB
		jsr	nullsub_1

loc_C7EB:				; CODE XREF: sub_C75D:loc_C7DDj
					; sub_C75D+89j
		clra
		ldab	<MapValue
		lsld
		lsld
		tst	word_84D7
		bmi	loc_C7FA
		addd	word_84D7
		bra	loc_C802
; ---------------------------------------------------------------------------

loc_C7FA:				; CODE XREF: sub_C75D+96j
		addd	word_84D7
		bgt	loc_C802
		ldd	#0

loc_C802:				; CODE XREF: sub_C75D+9Bj sub_C75D+A0j
		xgdy
		ldaa	<Ram_85
		jsr	ScaleYbyA
		xgdy
		lsld
		bcc	loc_C811
		ldd	#$FFFF

loc_C811:				; CODE XREF: sub_C75D+AFj
		std	DoubleTempC
		brset	<BitFlags27 8 loc_C822
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#8
		beq	loc_C822
		jsr	Interrupt_DwellTimer

loc_C822:				; CODE XREF: sub_C75D+B7j sub_C75D+C0j
		ldaa	#1
		ldab	<Ram_86
		ldx	#$648F
		jsr	sub_E6E9
		ldx	#$75
		jsr	ScaleXbyB_somethingelse
		std	DoubleTempB
		brclr	<BitFlags27 8 loc_C843
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$40
		beq	loc_C843
		jsr	nullsub_1

loc_C843:				; CODE XREF: sub_C75D+D8j sub_C75D+E1j
		clra
		ldab	<Ram_B1
		lsld
		lsld
		addb	<ValueFromAdaptiveMemory
		adca	#0
		tst	word_84D9
		bmi	loc_C85B
		addd	word_84D9
		bvc	loc_C85E
		ldd	#$7FFF
		bra	loc_C85E
; ---------------------------------------------------------------------------

loc_C85B:				; CODE XREF: sub_C75D+F2j
		addd	word_84D9

loc_C85E:				; CODE XREF: sub_C75D+F7j sub_C75D+FCj
		std	<Ram_C0
		ldx	#$8418
		ldaa	<MapVolts
		jsr	sub_E68D
		stab	<Ram_C2
		ldd	DoubleTempB
		addd	<MAPLoadFactor
		bcs	loc_C883
		addd	<Ram_A7
		bcs	loc_C883
		addd	<Ram_A4
		bcs	loc_C883
		addd	STe_64BA
		bcs	loc_C883
		addd	STe_64BE
		bcc	loc_C886

loc_C883:				; CODE XREF: sub_C75D+112j
					; sub_C75D+116j ...
		ldd	#$FFFF

loc_C886:				; CODE XREF: sub_C75D+124j
		subd	<Ram_AD
		bcs	loc_C88E
		subd	<Ram_AA
		bcc	loc_C891

loc_C88E:				; CODE XREF: sub_C75D+12Bj
		ldd	#0

loc_C891:				; CODE XREF: sub_C75D+12Fj
		std	DoubleTempB
		ldy	DoubleTempB
		ldaa	<Ram_C2
		jsr	ScaleYbyA
		xgdy
		lsrd
		lsrd
		std	DoubleTempC
		ldd	DoubleTempB
		subd	DoubleTempC
		std	DoubleTempB
		tst	Ram_C0
		bpl	loc_C8C9
		ldd	#0
		subd	<Ram_C0
		cpd	DoubleTempB
		bpl	loc_C8C4
		ldd	DoubleTempB
		addd	<Ram_C0
		bra	loc_C8D0
; ---------------------------------------------------------------------------

loc_C8C4:				; CODE XREF: sub_C75D+15Ej
		ldd	#0
		bra	loc_C8D0
; ---------------------------------------------------------------------------

loc_C8C9:				; CODE XREF: sub_C75D+153j
		addd	<Ram_C0
		bcc	loc_C8D0
		ldd	#$FFFF

loc_C8D0:				; CODE XREF: sub_C75D+165j
					; sub_C75D+16Aj ...
		std	<Ram_73

loc_C8D2:				; CODE XREF: sub_C75D+46J
		brset	<BitFlags27 8 loc_C8E0
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#8
		beq	loc_C8E0
		jsr	Interrupt_DwellTimer

loc_C8E0:				; CODE XREF: sub_C75D:loc_C8D2j
					; sub_C75D+17Ej
		brclr	<BitFlags27 $40	loc_C8EE
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$10
		beq	loc_C8EE
		jsr	DwellTimerOC4Interrupt

loc_C8EE:				; CODE XREF: sub_C75D:loc_C8E0j
					; sub_C75D+18Cj
		brset	<IPL1 $40 loc_C93E
		ldx	#$84DF
		ldaa	<MapValue2
		cmpa	<MapValue
		bcc	loc_C8FE
		ldx	#$84DE

loc_C8FE:				; CODE XREF: sub_C75D+19Cj
		ldy	#$90
		ldaa	<MapValue
		jsr	ProcessMapOrTpsBlockData
		brclr	<BitFlags66_t3 $40 loc_C915
		brclr	<Ram_30	4 loc_C915
		clra
		clrb
		std	<InjectorPulsewidth_HB
		bra	loc_C952
; ---------------------------------------------------------------------------

loc_C915:				; CODE XREF: sub_C75D+1AAj
					; sub_C75D+1AEj
		ldaa	<CoolantTemp
		cmpa	TL_TL_8483
		bcs	loc_C938
		ldaa	<ChargeTempVolts
		cmpa	TL_TL_8484
		bcs	loc_C938
		ldaa	<Ram_80
		cmpa	#$FF
		beq	loc_C938
		inca
		staa	<Ram_80
		cmpa	TL_TL_8485
		bhi	loc_C938
		ldd	#0
		std	<InjectorPulsewidth_HB
		bra	loc_C952
; ---------------------------------------------------------------------------

loc_C938:				; CODE XREF: sub_C75D+1BDj
					; sub_C75D+1C4j ...
		ldd	<Ram_71
		std	<InjectorPulsewidth_HB
		bra	loc_C952
; ---------------------------------------------------------------------------

loc_C93E:				; CODE XREF: sub_C75D:loc_C8EEj
		ldd	<Ram_71
		beq	loc_C94F
		subd	TL_TL_8481
		bcs	loc_C94B
		std	<Ram_71
		bra	loc_C94F
; ---------------------------------------------------------------------------

loc_C94B:				; CODE XREF: sub_C75D+1E8j
		clra
		clrb
		std	<Ram_71

loc_C94F:				; CODE XREF: sub_C75D+1E3j
					; sub_C75D+1ECj
		jsr	sub_C975

loc_C952:				; CODE XREF: sub_C75D+1B6j
					; sub_C75D+1D9j ...
		jsr	CalculateAverageValues
		brclr	<BitFlags27 $40	loc_C963
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$10
		beq	loc_C963
		jsr	DwellTimerOC4Interrupt

loc_C963:				; CODE XREF: sub_C75D+1F8j
					; sub_C75D+201j
		brclr	<BitFlags27 8 loc_C971
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$40
		beq	loc_C971
		jsr	nullsub_1

loc_C971:				; CODE XREF: sub_C75D:loc_C963j
					; sub_C75D+20Fj
		jsr	AVG2_CalculateAverages2
		rts
; End of function sub_C75D


; =============== S U B	R O U T	I N E =======================================


sub_C975:				; CODE XREF: sub_C75D:loc_C94FP
		ldx	#$E1
		brclr	0,x $20	loc_C982
		ldd	#0
		jmp	loc_CA12
; ---------------------------------------------------------------------------

loc_C982:				; CODE XREF: sub_C975+3j
		brset	<BitFlags2c $80	loc_C989
		jmp	loc_C9E0
; ---------------------------------------------------------------------------

loc_C989:				; CODE XREF: sub_C975:loc_C982j
		ldaa	byte_8680
		ldab	<TargetIdleSpeedHB
		mul
		addd	<TargetIdleSpeedHB
		bcc	loc_C996
		ldd	#$FFFF

loc_C996:				; CODE XREF: sub_C975+1Cj
		staa	<RpmRelated0087
		cpd	<EngineRpm_HB
		bcs	loc_C99F
		bra	loc_C9D5
; ---------------------------------------------------------------------------

loc_C99F:				; CODE XREF: sub_C975+26j
		ldx	<Ram_73
		ldaa	byte_867F
		bne	loc_C9AD
		cpx	word_867D
		bhi	loc_C9D5
		bra	loc_C9E0
; ---------------------------------------------------------------------------

loc_C9AD:				; CODE XREF: sub_C975+2Fj
		cmpa	#1
		bne	loc_C9BC
		brclr	<BitFlags66_t3 $80 loc_C9E0
		cpx	word_867D
		bhi	loc_C9D5
		bra	loc_C9E0
; ---------------------------------------------------------------------------

loc_C9BC:				; CODE XREF: sub_C975+3Aj
		cmpa	#2
		bne	loc_C9CB
		brset	<BitFlags66_t3 $80 loc_C9D5
		cpx	word_867D
		bhi	loc_C9D5
		bra	loc_C9E0
; ---------------------------------------------------------------------------

loc_C9CB:				; CODE XREF: sub_C975+49j
		cmpa	#3
		bne	loc_C9D5
		brset	<BitFlags66_t3 $80 loc_C9D5
		bra	loc_C9E0
; ---------------------------------------------------------------------------

loc_C9D5:				; CODE XREF: sub_C975+28j sub_C975+34j ...
		bclr	<BitFlags2c $80
		bset	<BitFlags2c 8
		ldaa	byte_867C
		staa	<CounterDn_b7_o2

loc_C9E0:				; CODE XREF: sub_C975+11J sub_C975+36j ...
		ldy	word_84DB
		brclr	<BitFlags2c $80	loc_C9EC
		clra
		clrb
		bra	loc_C9FD
; ---------------------------------------------------------------------------

loc_C9EC:				; CODE XREF: sub_C975+6Fj
		ldd	<Ram_73
		cpd	<Ram_71
		bcc	loc_C9F5
		ldd	<Ram_71

loc_C9F5:				; CODE XREF: sub_C975+7Cj
		cpd	word_84DB
		bcc	loc_C9FD
		xgdy

loc_C9FD:				; CODE XREF: sub_C975+75j sub_C975+84j
		ldx	#$6481
		brclr	0,x 4 loc_CA12
		ldaa	UNe_6483
		clrb
		brset	0,x 8 loc_CA0F
		ldab	UNe_6484

loc_CA0F:				; CODE XREF: sub_C975+93j
		lsrd
		lsrd
		lsrd

loc_CA12:				; CODE XREF: sub_C975+AJ sub_C975+8Bj
		std	<InjectorPulsewidth_HB
		rts
; End of function sub_C975

; ---------------------------------------------------------------------------
DRBSerialToggles:fcb   0
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

; =============== S U B	R O U T	I N E =======================================


sub_CA29:				; CODE XREF: __RESET+67AP
		jsr	sub_DDB8
		jsr	sub_DEAD
		ldab	<DRBSerialMode
		bitb	#$C0
		bne	locret_CA94
		ldaa	BAUD_SerialBaudRate
		anda	#$37
		cmpa	#$22
		beq	loc_CA44
		ldaa	#$22
		staa	BAUD_SerialBaudRate
		rts
; ---------------------------------------------------------------------------

loc_CA44:				; CODE XREF: sub_CA29+13j
		ldaa	SCSR_SerialStatus
		bita	#$E
		beq	loc_CA4F
		ldaa	SCDR_SerialData
		rts
; ---------------------------------------------------------------------------

loc_CA4F:				; CODE XREF: sub_CA29+20j
		bita	#$20
		bne	DRB_ChrRxd
		brset	<DRBSerialMode $F loc_CA5B
		incb
		stab	<DRBSerialMode
		rts
; ---------------------------------------------------------------------------

loc_CA5B:				; CODE XREF: sub_CA29+2Aj
		brclr	<DRBSerialMode $30 locret_CA65
		bclr	<DRBSerialMode $30
		clr	DRBPointer1

locret_CA65:				; CODE XREF: sub_CA29:loc_CA5Bj
		rts
; ---------------------------------------------------------------------------

DRB_ChrRxd:				; CODE XREF: sub_CA29+28j
		ldaa	SCDR_SerialData
		staa	SCDR_SerialData
		andb	#$F0
		stab	<DRBSerialMode
		bitb	#$30
		bne	DRB_StorePointer
		staa	<DRBPointer1
		cmpa	#$14
		beq	DRB_SetModeVar
		bclr	<BitFlags6d_t3 8

DRB_SetModeVar:				; CODE XREF: sub_CA29+4Fj
		clr	DRBPointer2
		clr	DRBPointer3
		tab
		subb	#$10
		cmpb	#$14
		bcc	locret_CA94
		ldx	#$CA15
		abx
		ldab	0,x
		orab	<DRBSerialMode
		stab	<DRBSerialMode

locret_CA94:				; CODE XREF: sub_CA29+Aj sub_CA29+5Fj
		rts
; ---------------------------------------------------------------------------

DRB_StorePointer:			; CODE XREF: sub_CA29+49j
		bitb	#$20
		beq	DRB_SendMemLocToSCI
		jmp	loc_CAB7
; ---------------------------------------------------------------------------

DRB_SendMemLocToSCI:			; CODE XREF: sub_CA29+6Ej
		bitb	#$10
		bne	loc_CAA3
		jmp	loc_CAD4
; ---------------------------------------------------------------------------

loc_CAA3:				; CODE XREF: sub_CA29+75j
		staa	<DRBPointer3
		andb	#$CF
		stab	<DRBSerialMode
		rts
; ---------------------------------------------------------------------------

SendECUIDToSCI:				; DATA XREF: RESERVED:CC5Ao
		clr	DRBPointer1
		ldab	<DRBPointer3
		ldaa	<DRBPointer2
		xgdx
		ldaa	0,x

loc_CAB4:				; CODE XREF: RESERVED:CB00j
					; RESERVED:CB03j
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CAB7:				; CODE XREF: sub_CA29+70J
		staa	<DRBPointer2
		andb	#$DF
		stab	<DRBSerialMode
		ldab	<DRBPointer1
		cpd	#$1014
		bne	loc_CADD
		brset	<BitFlags66_t3 $80 loc_CAD4
		brset	<BitFlags27 1 loc_CAE2
		brclr	<BitFlags68_t3 $10 loc_CAE2
		bclr	<BitFlags68_t3 $80

loc_CAD4:				; CODE XREF: sub_CA29+77J sub_CA29+9Cj
		clr	DRBPointer1
		clr	DRBPointer2
		clr	DRBPointer3

loc_CADD:				; CODE XREF: sub_CA29+9Aj
		bclr	<BitFlags6d_t3 8
		bra	locret_CAE5
; ---------------------------------------------------------------------------

loc_CAE2:				; CODE XREF: sub_CA29+A0j sub_CA29+A4j
		bset	<BitFlags6d_t3 8

locret_CAE5:				; CODE XREF: sub_CA29+B7j
		rts
; End of function sub_CA29

; ---------------------------------------------------------------------------

DRB_ResetEMR:				; DATA XREF: RESERVED:CC68o
		clr	DRBPointer1
		brset	<BitFlags6a_t3 $40 loc_CB02
		brset	<BitFlags6a_t3 $20 loc_CB02
		bset	<BitFlags6a_t3 $40
		ldaa	<DRBPointer3
		staa	DRBOffsetStored_LB
		ldab	<DRBPointer2
		stab	DRBOffsetStored_HB
		ldaa	#$E2
		bra	loc_CAB4
; ---------------------------------------------------------------------------

loc_CB02:				; CODE XREF: RESERVED:CAE9j
					; RESERVED:CAEDj
		clra
		bra	loc_CAB4
; ---------------------------------------------------------------------------

DRB_UseRAMForSpecialProgramRoutine:	; DATA XREF: RESERVED:CC6Ao
		ldx	#0
		bra	loc_CB2D
; ---------------------------------------------------------------------------

DRB_UseRAM2ForSpecialProgramRoutine:	; DATA XREF: RESERVED:CC6Co
		ldx	#$6480
		bra	loc_CB2D
; ---------------------------------------------------------------------------

DRB_CheckSpecialProgramSize:		; DATA XREF: RESERVED:CC6Eo
		ldx	#$64C9
		ldaa	<DRBPointer2
		bne	loc_CB2A
		ldab	<DRBPointer3
		abx
		cpx	#$64D0
		bcs	loc_CB2A
		ldaa	#$FF
		staa	DRB_ProgramModeFlag

loc_CB23:				; CODE XREF: RESERVED:CB55j
					; RESERVED:CB8Bj
		clr	DRBPointer1
		clra
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CB2A:				; CODE XREF: RESERVED:CB14j
					; RESERVED:CB1Cj
		ldx	#$64C9

loc_CB2D:				; CODE XREF: RESERVED:CB08j
					; RESERVED:CB0Dj
		clr	DRBPointer1
		ldab	<DRBPointer2
		ldaa	<DRBPointer3
		abx
		staa	0,x
		ldaa	#$E5
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

DRB_SpecialProgramMode:			; DATA XREF: RESERVED:DRBTableo
		ldx	#$64C9
		ldab	<DRBPointer3
		cmpb	1,x
		beq	loc_CB4A
		comb
		cmpb	1,x
		bne	DRB_OutputSpecialCodes

loc_CB4A:				; CODE XREF: RESERVED:CB43j
		ldab	<DRBPointer2
		cmpb	0,x
		bne	loc_CB79
		abx
		ldaa	1,x
		cmpa	#$39
		bne	loc_CB23
		ldx	#$64C9
		clra

loc_CB5B:				; CODE XREF: RESERVED:CB5Fj
		inx
		adda	1,x
		decb
		bne	loc_CB5B
		cmpa	<DRBPointer3
		beq	loc_CB6E
		ldab	<DRBPointer3
		comb
		cba
		bne	DRB_OutputSpecialCodes
		jmp	DRB_SpecialProgramRoutine
; ---------------------------------------------------------------------------

loc_CB6E:				; CODE XREF: RESERVED:CB63j
		com	DRBPointer3
		ldaa	#$E4
		bra	loc_CBA5
; ---------------------------------------------------------------------------

DRB_OutputSpecialCodes:			; CODE XREF: RESERVED:CB48j
					; RESERVED:CB69j
		ldaa	#1
		bra	loc_CB7F
; ---------------------------------------------------------------------------

loc_CB79:				; CODE XREF: RESERVED:CB4Ej
					; RESERVED:CB91j
		ldaa	#2
		bra	loc_CB7F
; ---------------------------------------------------------------------------

loc_CB7D:				; CODE XREF: RESERVED:CB99j
		ldaa	#3

loc_CB7F:				; CODE XREF: RESERVED:CB77j
					; RESERVED:CB7Bj
		clr	DRBPointer1
		bra	loc_CBA5
; ---------------------------------------------------------------------------

DRB_Special1:				; DATA XREF: RESERVED:CC72o
		ldaa	<DRBPointer2
		bne	loc_CB8D
		bclr	<BitFlags2a 1
		bra	loc_CB23
; ---------------------------------------------------------------------------

loc_CB8D:				; CODE XREF: RESERVED:CB86j
		ldaa	<DRBPointer3
		bne	loc_CBA8
		brset	<BitFlags66_t3 $80 loc_CB79
		brset	<BitFlags27 1 loc_CB9D
		brset	<BitFlags68_t3 $10 loc_CB7D

loc_CB9D:				; CODE XREF: RESERVED:CB95j
		coma
		staa	<DRBPointer3
		ldaa	#1
		bset	<BitFlags2a 1

loc_CBA5:				; CODE XREF: RESERVED:CB73j
					; RESERVED:CB82j ...
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CBA8:				; CODE XREF: RESERVED:CB8Fj
		brset	<BitFlags66_t3 $80 loc_CBB4
		brset	<BitFlags27 1 locret_CBB7
		brclr	<BitFlags68_t3 $10 locret_CBB7

loc_CBB4:				; CODE XREF: RESERVED:loc_CBA8j
					; RESERVED:CBCAj
		clr	DRBPointer1

locret_CBB7:				; CODE XREF: RESERVED:CBACj
					; RESERVED:CBB0j
		rts
; ---------------------------------------------------------------------------

DRB_Special2:				; DATA XREF: RESERVED:CC74o
		ldaa	<DRBPointer3
		beq	loc_CBE1
		ldaa	<DRBPointer2
		cmpa	#1
		beq	loc_CBCC
		cmpa	#2
		beq	loc_CBD0
		cmpa	#3
		beq	loc_CBD4
		bra	loc_CBB4
; ---------------------------------------------------------------------------

loc_CBCC:				; CODE XREF: RESERVED:CBC0j
		ldd	<EngineRpm_HB
		bra	loc_CBD6
; ---------------------------------------------------------------------------

loc_CBD0:				; CODE XREF: RESERVED:CBC4j
		ldd	<InjectorPulsewidth_HB
		bra	loc_CBD6
; ---------------------------------------------------------------------------

loc_CBD4:				; CODE XREF: RESERVED:CBC8j
		ldd	<TargetIdleSpeedHB

loc_CBD6:				; CODE XREF: RESERVED:CBCEj
					; RESERVED:CBD2j
		stab	Temp0
		jsr	SerialOutput1a
		ldaa	Temp0
		bra	loc_CBA5
; ---------------------------------------------------------------------------

loc_CBE1:				; CODE XREF: RESERVED:CBBAj
		coma
		staa	<DRBPointer3
		rts
; ---------------------------------------------------------------------------

DRB_ClearAdaptiveMemory:		; DATA XREF: RESERVED:CC76o
		clr	DRBPointer1
		ldab	<TimerOverflowsBetweenCamPulses
		cmpb	#$50
		bls	loc_CBF0
		bra	loc_CBF4
; ---------------------------------------------------------------------------

loc_CBF0:				; CODE XREF: RESERVED:CBECj
		clra
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CBF4:				; CODE XREF: RESERVED:CBEEj
		ldaa	<DRBPointer2
		cmpa	#1
		beq	loc_CC0B
		cmpa	#2
		beq	loc_CC1C
		cmpa	#3
		beq	loc_CC24
		cmpa	#4
		beq	loc_CC30
		ldaa	#1
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CC0B:				; CODE XREF: RESERVED:CBF8j
		brclr	<BitFlags6a_t3 $40 loc_CC14
		ldaa	#2
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CC14:				; CODE XREF: RESERVED:loc_CC0Bj
		jsr	DRB_ClearErrorCodes

loc_CC17:				; CODE XREF: RESERVED:CC22j
					; RESERVED:CC2DJ ...
		ldaa	#$F0
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CC1C:				; CODE XREF: RESERVED:CBFCj
		ldaa	#$80
		staa	<ValueFromAdaptiveMemory
		staa	<Ram_0B
		bra	loc_CC17
; ---------------------------------------------------------------------------

loc_CC24:				; CODE XREF: RESERVED:CC00j
		sei
		bset	<BitFlags36_t3 $40
		ldaa	#$DF
		staa	<CurrentAisPosition
		cli
		jmp	loc_CC17
; ---------------------------------------------------------------------------

loc_CC30:				; CODE XREF: RESERVED:CC04j
		ldaa	TL_ValueOf_MINTHR_WhenBatteryDisconnected
		staa	<LowestSessionTpsVolts
		bra	loc_CC17

; =============== S U B	R O U T	I N E =======================================


DRB_ClearErrorCodes:			; CODE XREF: RESERVED:loc_CC14P
					; RESERVED:CCCFP ...
		clra
		clrb
		std	<ErrorBitRegister0
		std	<ErrorBitRegister2
		std	<ErrorBitRegisterStored0
		std	<ErrorBitRegisterStored2
		std	<ErrorCodeUpdateKeyOnCount
		staa	<ErrorCodeUpdateKeyOnCount3
		std	<b5C_IPL1_t3
		staa	<b5d_IPL2
		staa	UNe_64B9
		jsr	ErrorCodeResetEeprom
		rts
; End of function DRB_ClearErrorCodes

; ---------------------------------------------------------------------------
DRBFunctTable:	fdb OutputErrorCodes
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
DRBTable:	fdb DRB_SpecialProgramMode
		fdb DRB_Special1
		fdb DRB_Special2
		fdb DRB_ClearAdaptiveMemory

; =============== S U B	R O U T	I N E =======================================


DRBIIOutput:				; CODE XREF: __RESET+67DP
		ldaa	<DRBSerialMode
		bita	#$30
		beq	loc_CC7F
		rts
; ---------------------------------------------------------------------------

loc_CC7F:				; CODE XREF: DRBIIOutput+4j
		ldaa	<DRBPointer1
		beq	locret_CCA2
		cmpa	#$A
		beq	locret_CCA2
		tab
		ldx	#$CC50
		subb	#$10
		bcs	loc_CC99
		aslb
		cmpb	#$28
		bcc	loc_CC99
		abx
		ldx	0,x
		jmp	0,x
; ---------------------------------------------------------------------------

loc_CC99:				; CODE XREF: DRBIIOutput+15j
					; DRBIIOutput+1Aj
		bclr	<DRBSerialMode $30
		clra
		staa	<DRBPointer1
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

locret_CCA2:				; CODE XREF: DRBIIOutput+9j
					; DRBIIOutput+Dj
		rts
; End of function DRBIIOutput

; ---------------------------------------------------------------------------

ClearErrorCodes:			; DATA XREF: RESERVED:CC5Eo
		clra
		ldab	<TimerOverflowsBetweenCamPulses
		cmpb	#$50
		bhi	loc_CCB2
		staa	<DRBPointer1
		bclr	<DRBSerialMode $30
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CCB2:				; CODE XREF: RESERVED:CCA8j
		ldab	<DRBSerialMode
		andb	#$F
		cmpb	#3
		bls	loc_CCBD
		clr	BitFlags65_t3

loc_CCBD:				; CODE XREF: RESERVED:CCB8j
		ldaa	BitFlags65_t3
		inca
		cmpa	#$18
		bls	loc_CCD7
		brset	<BitFlags6a_t3 $40 loc_CCDA
		clra
		staa	<DRBPointer1
		staa	BitFlags65_t3
		jsr	DRB_ClearErrorCodes
		ldaa	#$E0
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CCD7:				; CODE XREF: RESERVED:CCC3j
		staa	BitFlags65_t3

loc_CCDA:				; CODE XREF: RESERVED:CCC5j
		ldd	#$FF00
		stab	<DRBPointer1
		bra	SerialOutput1a
; ---------------------------------------------------------------------------

SetupATM:				; DATA XREF: RESERVED:CC56o
		ldab	<TimerOverflowsBetweenCamPulses
		cmpb	#$50
		bls	loc_CD13
		ldaa	<DRBPointer2
		asla
		bcs	loc_CD13
		cmpa	#$4E
		bhi	loc_CD13
		ldx	#$CDDB
		ldab	<DRBPointer2
		aslb
		abx
		ldd	0,x
		cpd	#$D09C
		beq	loc_CD13
		ldaa	<DRBPointer2
		brset	<BitFlags27 1 loc_CD0B
		cmpa	#$17
		beq	loc_CD13
		bra	loc_CD18
; ---------------------------------------------------------------------------

loc_CD0B:				; CODE XREF: RESERVED:CD01j
		cmpa	#$F
		beq	loc_CD13
		cmpa	#$16
		bne	loc_CD18

loc_CD13:				; CODE XREF: RESERVED:CCE5j
					; RESERVED:CCEAj ...
		clra
		staa	<DRBPointer1
		staa	<DRBPointer2

loc_CD18:				; CODE XREF: RESERVED:CD09j
					; RESERVED:CD11j
		cmpa	<ATMOffset
		beq	SerialOutput1a
		staa	<ATMOffset
		ldab	#2
		stab	<KeyOnOrEngineRunningTime

; =============== S U B	R O U T	I N E =======================================


SerialOutput1a:				; CODE XREF: sub_9C2A+3FP sub_9C2A+54P ...
		ldab	SCSR_SerialStatus
		bpl	SerialOutput1a
		staa	SCDR_SerialData
		rts
; End of function SerialOutput1a

; ---------------------------------------------------------------------------

OutputErrorCodes:			; DATA XREF: RESERVED:DRBFunctTableo
		ldx	#$15
		ldab	<DRBPointer2
		cmpb	#7
		bhi	loc_CD41
		negb
		addb	#7
		abx
		inc	DRBPointer2
		ldaa	0,x
		beq	loc_CD41
		bra	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CD41:				; CODE XREF: RESERVED:CD32j
					; RESERVED:CD3Dj
		clr	DRBPointer1
		ldaa	#$FE
		bsr	SerialOutput1a
		adda	#$10
		ldx	#$14

loc_CD4D:				; CODE XREF: RESERVED:CD55j
		inx
		cpx	#$1D
		bcc	SerialOutput1a
		adda	0,x
		bra	loc_CD4D
; ---------------------------------------------------------------------------

OutputErrorBits:			; DATA XREF: RESERVED:CC52o
		ldaa	<ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
		brclr	<DRBPointer2 $FF loc_CD62
		ldaa	<ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB
		clr	DRBPointer1

loc_CD62:				; CODE XREF: RESERVED:CD59j
		inc	DRBPointer2
		bra	SerialOutput1a
; ---------------------------------------------------------------------------

SetupHiSpeedDataTransfer:		; DATA XREF: RESERVED:CC54o
		bset	<DRBSerialMode $80
		clr	DRBPointer1

loc_CD6D:				; CODE XREF: RESERVED:CD72j
		ldaa	SCSR_SerialStatus
		bita	#$40
		beq	loc_CD6D
		ldaa	#1
		staa	BAUD_SerialBaudRate

DRB_Return:				; DATA XREF: RESERVED:CC58o
					; RESERVED:CC60o ...
		rts
; ---------------------------------------------------------------------------

InitByteModeDownload:			; DATA XREF: RESERVED:CC66o
		bset	<DRBSerialMode $40
		clr	DRBPointer1
		rts
; ---------------------------------------------------------------------------

SendConstValues:			; DATA XREF: RESERVED:CC5Co
		ldaa	<DRBPointer2
		cmpa	#$80
		beq	loc_CD93
		cmpa	#$81
		beq	loc_CDBE
		cmpa	#$82
		beq	loc_CDC3
		clr	DRBPointer1
		rts
; ---------------------------------------------------------------------------

loc_CD93:				; CODE XREF: RESERVED:CD85j
		ldx	#$8002
		brclr	<BitFlags6a_t3 2 loc_CD9D
		ldx	#$8007

loc_CD9D:				; CODE XREF: RESERVED:CD96j
					; RESERVED:CDC1j
		ldab	<DRBPointer3
		cmpb	#4
		beq	loc_CDAC
		inc	DRBPointer3
		abx
		ldaa	0,x
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CDAC:				; CODE XREF: RESERVED:CDA1j
		ldaa	0,x
		adda	1,x
		adda	2,x
		adda	3,x

loc_CDB4:				; CODE XREF: RESERVED:CDD8j
		adda	#$16
		adda	<DRBPointer2
		clr	DRBPointer1

loc_CDBB:				; CODE XREF: RESERVED:CDD4j
					; RESERVED:CDDBj
		jmp	SerialOutput1a
; ---------------------------------------------------------------------------

loc_CDBE:				; CODE XREF: RESERVED:CD89j
		ldx	#$800D
		bra	loc_CD9D
; ---------------------------------------------------------------------------

loc_CDC3:				; CODE XREF: RESERVED:CD8Dj
		inc	DRBPointer3
		ldaa	byte_8006
		brclr	<BitFlags6a_t3 2 loc_CDD0
		ldaa	byte_800B

loc_CDD0:				; CODE XREF: RESERVED:CDC9j
		ldab	<DRBPointer3
		cmpb	#1
		beq	loc_CDBB
		cmpb	#5
		bcc	loc_CDB4
		clra
		bra	loc_CDBB
; ---------------------------------------------------------------------------
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
RTDataTbl_:	fdb SCI_MAPVolts
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

; =============== S U B	R O U T	I N E =======================================


ActuatorTestMode_MM:			; CODE XREF: __RESET+680P
		ldaa	<TimerOverflowsBetweenCamPulses
		cmpa	#$50
		bhi	loc_CE79
		clr	ATMOffset

loc_CE79:				; CODE XREF: ActuatorTestMode_MM+4j
		ldab	<ATMOffset
		bne	loc_CE80
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

loc_CE80:				; CODE XREF: ActuatorTestMode_MM+Bj
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	#$96
		bcs	loc_CE97
		clrb
		ldaa	<DRBPointer1
		cmpa	#$13
		bne	loc_CE91
		stab	<DRBPointer1
		stab	<DRBPointer2

loc_CE91:				; CODE XREF: ActuatorTestMode_MM+1Bj
		clr	ATMOffset
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

loc_CE97:				; CODE XREF: ActuatorTestMode_MM+14j
		ldx	#$CDDB
		aslb
		abx
		ldx	0,x
		jmp	0,x
; ---------------------------------------------------------------------------

ATM_SCServoSolenoid:			; DATA XREF: RESERVED:CDF3o
		ldaa	<PIA2_Buffer_t3
		oraa	#$C0
		ldab	<Counter_MainLoop
		cmpb	#$55
		bcs	loc_CF20
		anda	#$3F
		cmpb	#$AA
		bcs	loc_CF20
		oraa	#$80
		bra	loc_CF20
; ---------------------------------------------------------------------------

ATM_PurgeSolenoid:			; DATA XREF: RESERVED:CDF1o
		ldaa	<PIA2_Buffer_t3
		oraa	#$20
		brset	<Counter_MainLoop $80 loc_CF20
		anda	#$DF
		bra	loc_CF20
; ---------------------------------------------------------------------------

ATM_ASDRelay:				; DATA XREF: RESERVED:CDEFo
		ldaa	TCTL1_TimerControlReg1
		anda	#$FE
		staa	TCTL1_TimerControlReg1
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldaa	<PIA2_Buffer_t3
		oraa	#$10
		brset	<Counter_MainLoop $80 loc_CF20
		anda	#$EF
		bra	loc_CF20
; ---------------------------------------------------------------------------

ATM_BaroReadSolenoid:			; DATA XREF: RESERVED:CE13o
		ldaa	<PIA2_Buffer_t3
		anda	#$EF
		bra	loc_CF20
; ---------------------------------------------------------------------------
		brset	<BitFlags27 8 loc_CEEF
		ldaa	<PIA2_Buffer_t3
		oraa	#8
		brset	<Counter_MainLoop $80 loc_CF20
		anda	#$F7
		bra	loc_CF20
; ---------------------------------------------------------------------------

loc_CEEF:				; CODE XREF: ActuatorTestMode_MM+6Fj
		ldaa	<PIA1_Buffer_t3
		oraa	#$80
		brset	<Counter_MainLoop $80 loc_CEF9
		anda	#$7F

loc_CEF9:				; CODE XREF: ActuatorTestMode_MM+83j
		staa	<PIA1_Buffer_t3
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

Lce93:					; DATA XREF: RESERVED:CE05o
		ldaa	<PIA2_Buffer_t3
		oraa	#4
		brset	<Counter_MainLoop $80 loc_CF20
		anda	#$FB
		bra	loc_CF20
; ---------------------------------------------------------------------------

Lce9f:					; DATA XREF: RESERVED:CDFBo
		ldaa	<PIA2_Buffer_t3
		oraa	#2
		brset	<Counter_MainLoop $80 loc_CF20
		anda	#$FD
		bra	loc_CF20
; ---------------------------------------------------------------------------

ATM_ACClutchRelay:			; DATA XREF: RESERVED:CDEDo
		ldaa	<PIA2_Buffer_t3
		oraa	#1
		brset	<Counter_MainLoop $80 loc_CF20
		anda	#$FE

loc_CF20:				; CODE XREF: ActuatorTestMode_MM+38j
					; ActuatorTestMode_MM+3Ej ...
		staa	<PIA2_Buffer_t3
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

ATM_FanRelay:				; DATA XREF: RESERVED:CDEBo
		ldaa	<PIA1_Buffer_t3
		anda	#$7F
		ldab	<Counter_MainLoop
		andb	#$78
		beq	loc_CF49
		oraa	#$80
		bra	loc_CF49
; ---------------------------------------------------------------------------

ATM_EGRSolenoid:			; DATA XREF: RESERVED:CDF9o
					; RESERVED:CE09o
		ldaa	<PIA1_Buffer_t3
		oraa	#$20
		brset	<Counter_MainLoop $80 loc_CF49
		anda	#$DF
		bra	loc_CF49
; ---------------------------------------------------------------------------

Lced4:					; DATA XREF: RESERVED:CE07o
		ldaa	<PIA1_Buffer_t3
		oraa	#$10
		brset	<Counter_MainLoop $80 loc_CF49
		anda	#$EF

loc_CF49:				; CODE XREF: ActuatorTestMode_MM+BDj
					; ActuatorTestMode_MM+C1j ...
		staa	<PIA1_Buffer_t3
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

ATM_AISMotorOpenClose:			; CODE XREF: ActuatorTestMode_MM+127j
					; DATA XREF: RESERVED:CDE9o
		ldaa	#$10
		brset	<Counter_MainLoop $80 loc_CF56
		ldaa	#$70

loc_CF56:				; CODE XREF: ActuatorTestMode_MM+E0j
		staa	<DesiredNewAisPosition
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

ATM_AllSolenoidsRelays:			; DATA XREF: RESERVED:CE03o
		ldd	<PIA1_Buffer_t3
		oraa	#$10
		brset	<BitFlags27 1 loc_CF65
		oraa	#$20

loc_CF65:				; CODE XREF: ActuatorTestMode_MM+EFj
		brset	<BitFlags27 8 loc_CF6D
		orab	#$EB
		bra	loc_CF71
; ---------------------------------------------------------------------------

loc_CF6D:				; CODE XREF: ActuatorTestMode_MM:loc_CF65j
		oraa	#$80
		orab	#$E3

loc_CF71:				; CODE XREF: ActuatorTestMode_MM+FBj
		brset	<BitFlags2D $10	loc_CF77
		orab	#$10

loc_CF77:				; CODE XREF: ActuatorTestMode_MM:loc_CF71j
		brset	<Counter_MainLoop $80 loc_CF95
		anda	#$EF
		brset	<BitFlags27 1 loc_CF83
		anda	#$DF

loc_CF83:				; CODE XREF: ActuatorTestMode_MM+10Dj
		brset	<BitFlags27 8 loc_CF8B
		andb	#$14
		bra	loc_CF8F
; ---------------------------------------------------------------------------

loc_CF8B:				; CODE XREF: ActuatorTestMode_MM:loc_CF83j
		anda	#$7F
		andb	#$1C

loc_CF8F:				; CODE XREF: ActuatorTestMode_MM+119j
		brset	<BitFlags2D $10	loc_CF95
		andb	#$EF

loc_CF95:				; CODE XREF: ActuatorTestMode_MM:loc_CF77j
					; ActuatorTestMode_MM:loc_CF8Fj
		std	<PIA1_Buffer_t3
		bra	ATM_AISMotorOpenClose
; ---------------------------------------------------------------------------

ATM_Tachometer:				; DATA XREF: RESERVED:CDF5o
		bclr	<PIA2_Buffer_t3	$10
		ldx	#$6400
		sei
		ldaa	SwitchPortAccessReg1
		anda	#$FB
		brset	<Counter_MainLoop $80 loc_CFAB
		oraa	#4

loc_CFAB:				; CODE XREF: ActuatorTestMode_MM+135j
		staa	SwitchPortAccessReg1
		bset	2,x 4
		ldaa	#$14

loc_CFB3:				; CODE XREF: ActuatorTestMode_MM+144j
		deca
		bne	loc_CFB3
		bclr	2,x 4
		cli
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

ATM_IgnitionCoil1:			; DATA XREF: RESERVED:CDDDo
		bclr	<PIA2_Buffer_t3	$10
		ldab	<Counter_MainLoop
		aslb
		beq	loc_CFC8
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

loc_CFC8:				; CODE XREF: ActuatorTestMode_MM+153j
		sei
		ldaa	TCTL1_TimerControlReg1
		oraa	#3
		staa	TCTL1_TimerControlReg1
		ldab	#8
		stab	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	#$6D6
		std	TOC5_Counter_OC5_Dwell
		ldaa	TCTL1_TimerControlReg1
		anda	#$FE
		staa	TCTL1_TimerControlReg1
		cli
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------
AtmToggleOC2:	fcb $40
AtmToggleOC2_ForceCompare:fcb $40
AtmClrOC2SetOC3SetOC4SetOC5:fcb	$BF
AtmToggleOC3:	fcb $10
AtmToggleOC3_ForceCompare:fcb $20
AtmSetOC2ClrOC3SetOC4SetOC5:fcb	$EF
AtmToggleOC4:	fcb   4
AtmToggleOC4_ForceCompare:fcb $10
AtmSetOC2SetOC3ClrOC4SetOC5:fcb	$FB
		fcb $12
		fcb $27
		fcb $10
		fcb   3
		fcb $7E
		fcb $D0
		fcb $9C
; ---------------------------------------------------------------------------
		ldx	#$101C
		ldy	#$CFF1
		bra	ATM_IgnitionCoil2
; ---------------------------------------------------------------------------
		brset	<BitFlags27 $10	loc_D00B
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

loc_D00B:				; CODE XREF: ActuatorTestMode_MM+194j
		bra	loc_D014
; ---------------------------------------------------------------------------

Lcfa2:					; DATA XREF: RESERVED:CE19o
		brset	<BitFlags27 $40	loc_D014
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

loc_D014:				; CODE XREF: ActuatorTestMode_MM:loc_D00Bj
					; ActuatorTestMode_MM:Lcfa2j
		ldx	#$101A
		ldy	#$CFEE
		bra	ATM_IgnitionCoil2
; ---------------------------------------------------------------------------

Lcfb2:					; DATA XREF: RESERVED:CE17o
		brset	<BitFlags27 $40	loc_D024
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

loc_D024:				; CODE XREF: ActuatorTestMode_MM:Lcfb2j
		ldx	#$1018
		ldy	#$CFEB

ATM_IgnitionCoil2:			; CODE XREF: ActuatorTestMode_MM+192j
					; ActuatorTestMode_MM+1ABj
		bclr	<PIA2_Buffer_t3	$10
		ldab	<Counter_MainLoop
		aslb
		beq	loc_D036
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

loc_D036:				; CODE XREF: ActuatorTestMode_MM+1C1j
		sei
		ldd	0,y
		oraa	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1
		stab	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	#$1A9
		std	0,x
		ldaa	2,y
		anda	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1
		cli
		jmp	ATM_SerialOut
; ---------------------------------------------------------------------------

ATM_InjBank1:				; DATA XREF: RESERVED:CE15o
		ldx	#$6408
		bra	loc_D06A
; ---------------------------------------------------------------------------

ATM_InjBank2:				; DATA XREF: RESERVED:CDE7o
		ldx	#$640A
		bra	loc_D06A
; ---------------------------------------------------------------------------

ATM_InjBank3:				; DATA XREF: RESERVED:CDE5o
		ldx	#$640C
		bra	loc_D06A
; ---------------------------------------------------------------------------

ATM_InjBank4:				; DATA XREF: RESERVED:CDE3o
		ldx	#$640E

loc_D06A:				; CODE XREF: ActuatorTestMode_MM+1EBj
					; ActuatorTestMode_MM+1F0j ...
		bclr	<PIA2_Buffer_t3	$10
		ldab	<Counter_MainLoop
		aslb
		bne	ATM_SerialOut
		sei
		ldaa	PIA_Ctrl_2
		bita	#$F0
		beq	loc_D07F
		anda	#$F
		staa	PIA_Ctrl_2

loc_D07F:				; CODE XREF: ActuatorTestMode_MM+208j
		ldaa	#$F8
		cmpa	PIA_Ctrl_5
		beq	loc_D089
		staa	PIA_Ctrl_5

loc_D089:				; CODE XREF: ActuatorTestMode_MM+214j
		ldd	#$1A9
		std	0,x
		cli
		bra	ATM_SerialOut
; ---------------------------------------------------------------------------

ATM_PTUIndicator:			; DATA XREF: RESERVED:CDF7o
		ldaa	<PIA3_Buffer_t3
		eora	#2
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		bra	*+2
; ---------------------------------------------------------------------------

ATM_SerialOut:				; CODE XREF: ActuatorTestMode_MM+DJ
					; ActuatorTestMode_MM+24J ...
		ldaa	<DRBPointer1
		cmpa	#$14
		beq	loc_D0A7
		cmpa	#$1A
		beq	loc_D0D6

locret_D0A6:				; CODE XREF: ActuatorTestMode_MM+23Fj
					; ActuatorTestMode_MM+243j ...
		rts
; ---------------------------------------------------------------------------

loc_D0A7:				; CODE XREF: ActuatorTestMode_MM+230j
		ldab	<DRBPointer2
		cmpb	#$40
		bcc	loc_D0C5
		cmpb	#0
		beq	locret_D0A6
		cmpb	#$2D
		bhi	locret_D0A6
		ldx	#$CE2A
		clra
		abx
		ldab	0,x
		cmpb	#$FF
		beq	locret_D0A6
		xgdx
		ldaa	0,x
		bra	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

loc_D0C5:				; CODE XREF: ActuatorTestMode_MM+23Bj
		subb	#$40
		aslb
		bcs	locret_D0A6
		cmpb	#$10
		bcc	locret_D0A6
		ldx	#$CE58

loc_D0D1:				; CODE XREF: ActuatorTestMode_MM+272j
		abx
		ldx	0,x
		jmp	0,x
; ---------------------------------------------------------------------------

loc_D0D6:				; CODE XREF: ActuatorTestMode_MM+234j
		ldx	#$CE66
		ldab	<DRBPointer2
		aslb
		cmpb	#0
		beq	locret_D0A6
		cmpb	#8
		bls	loc_D0D1
		bra	locret_D0A6
; ---------------------------------------------------------------------------

SCI_LD07B:				; DATA XREF: RESERVED:CE68o
		ldaa	<StartupSwitchMirror1
		brclr	<BitFlags27 $C0	SerialOutput1a_jmp1
		ldab	byte_8011
		beq	loc_D0F3
		eora	#2

loc_D0F3:				; CODE XREF: ActuatorTestMode_MM+27Fj
		eora	#$80
		bra	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SCI_Ld08c:				; DATA XREF: RESERVED:CE6Ao
		ldaa	<PIA2_Buffer_t3
		bra	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SCI_Ld090:				; DATA XREF: RESERVED:CE6Co
		ldaa	<PIA1_Buffer_t3
		eora	#8
		bra	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SCI_Ld096:				; DATA XREF: RESERVED:CE6Eo
		ldaa	SwitchPortAccessReg1
		anda	#$70
		bra	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SCI_MAPVolts:				; DATA XREF: RESERVED:RTDataTbl_o
		sei
		ldaa	#$10
		staa	ADCTL_A2DControlReg

loc_D10E:				; CODE XREF: ActuatorTestMode_MM+2A1j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_D10E
		ldaa	ADR1_A2DResults1
		cli
		bra	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SCI_Speed:				; DATA XREF: RESERVED:CE5Ao
		ldaa	<VehicleSpeedx8_Scaled
		bra	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SCI_O2Volts:				; DATA XREF: RESERVED:CE5Co
		ldab	<O2SensorVolts
		ldaa	#$FF
		cmpb	byte_8A53
		bhi	loc_D12D
		cmpb	byte_8A54
		bhi	SerialOutput1a_jmp1
		anda	#$A0

loc_D12D:				; CODE XREF: ActuatorTestMode_MM+2B4j
		anda	#$B1

SerialOutput1a_jmp1:			; CODE XREF: ActuatorTestMode_MM+253j
					; ActuatorTestMode_MM+278j ...
		jmp	SerialOutput1a
; End of function ActuatorTestMode_MM

; ---------------------------------------------------------------------------

SCI_Ld0c7:				; DATA XREF: RESERVED:CE5Eo
		jmp	locret_D0A6
; ---------------------------------------------------------------------------

SCI_Ld0ca:				; DATA XREF: RESERVED:CE60o
		jmp	locret_D0A6
; ---------------------------------------------------------------------------

SendBaro:				; DATA XREF: RESERVED:CE62o
		ldaa	<BaroPressure
		suba	<MapValue
		bcc	SerialOutput1a_jmp2
		clra

SerialOutput1a_jmp2:			; CODE XREF: RESERVED:D13Cj
		jmp	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SendTPS:				; DATA XREF: RESERVED:CE64o
		ldaa	<TpsVolts
		suba	<LowestSessionTpsVolts
		bcc	loc_D149
		clra

loc_D149:				; CODE XREF: RESERVED:D146j
		ldab	TL_t3_0xfd
		staa	Temp0
		mul
		adca	Temp0
		bcc	loc_D157
		ldaa	#$FF

loc_D157:				; CODE XREF: RESERVED:D153j
		jmp	SerialOutput1a_jmp1
; ---------------------------------------------------------------------------

SCI_Ld0ef:				; DATA XREF: RESERVED:CE66o
		ldaa	<CalculatedSparkAdvance
		jmp	SerialOutput1a_jmp1

; =============== S U B	R O U T	I N E =======================================


sub_D15F:				; CODE XREF: sub_E825+44P
		ldx	#$8000
		ldd	#$9200
		std	Temp0
		clra
		ldab	#8

loc_D16B:				; CODE XREF: sub_D15F+24j
		bsr	sub_D185
		psha
		pshb
		jsr	OCToggleAndResetCopTimer
		ldaa	#$12
		adda	Temp0
		staa	Temp0
		ldaa	SwitchPortAccessReg1
		bita	#$40
		pulb
		pula
		beq	locret_D1AE
		bra	loc_D16B
; End of function sub_D15F


; =============== S U B	R O U T	I N E =======================================


sub_D185:				; CODE XREF: sub_D15F:loc_D16Bp
		cpx	#$B600
		bne	loc_D193
		inc	Temp0
		inc	Temp0
		ldx	#$B800

loc_D193:				; CODE XREF: sub_D185+3j sub_D185+22j
		adda	0,x
		adda	1,x
		adda	2,x
		adda	3,x
		adda	4,x
		adda	5,x
		adda	6,x
		adda	7,x
		abx
		cpx	Temp0
		bne	loc_D193
		tst	Temp0
		beq	loc_D1AF

locret_D1AE:				; CODE XREF: sub_D15F+22j sub_D185+2Ej
		rts
; ---------------------------------------------------------------------------

loc_D1AF:				; CODE XREF: sub_D185+27j
		pulx
		suba	byte_8005
		beq	locret_D1AE
		ldd	#$201
		jmp	ThrowNonCriticalError_
; End of function sub_D185

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_D69A

loc_D1BB:				; CODE XREF: sub_D69A+CJ
		ldaa	<Counter_MainLoop
		asla
		asla
		bne	locret_D1D1
		ldaa	LastCamFallingEdgeTime2
		bita	#$70
		beq	loc_D1D2
		suba	#$10
		bita	#$70
		beq	loc_D1D2
		staa	LastCamFallingEdgeTime2

locret_D1D1:				; CODE XREF: sub_D69A-4DBj
		rts
; ---------------------------------------------------------------------------

loc_D1D2:				; CODE XREF: sub_D69A-4D4j
					; sub_D69A-4CEj
		ldab	<PIA1_Buffer_t3
		eorb	#$40
		stab	<PIA1_Buffer_t3
		bita	#$F
		beq	loc_D1E5
		deca
		bita	#$F
		beq	loc_D1E5
		oraa	#$10
		bra	loc_D21A
; ---------------------------------------------------------------------------

loc_D1E5:				; CODE XREF: sub_D69A-4C0j
					; sub_D69A-4BBj
		tsta
		bmi	loc_D21E
		ldaa	#$AA
		ldab	<DRBPointer2
		cmpb	#$FE
		beq	loc_D20E
		tstb
		bmi	loc_D21A
		cmpb	#8
		bcs	loc_D201
		ldx	#$B618
		abx
		brset	0,x $FF	loc_D266
		bra	loc_D208
; ---------------------------------------------------------------------------

loc_D201:				; CODE XREF: sub_D69A-4A5j
		negb
		addb	#7
		ldx	#$15
		abx

loc_D208:				; CODE XREF: sub_D69A-49Bj
		ldab	0,x
		beq	loc_D21A
		bra	loc_D20F
; ---------------------------------------------------------------------------

loc_D20E:				; CODE XREF: sub_D69A-4ACj
		clrb

loc_D20F:				; CODE XREF: sub_D69A-48Ej
		ldx	#$D277
		abx
		ldaa	0,x
		anda	#$F
		asla
		oraa	#$A0

loc_D21A:				; CODE XREF: sub_D69A-4B7j
					; sub_D69A-4A9j ...
		staa	LastCamFallingEdgeTime2
		rts
; ---------------------------------------------------------------------------

loc_D21E:				; CODE XREF: sub_D69A-4B4j
		ldab	<DRBPointer2
		cmpb	#$FF
		bne	loc_D230
		ldaa	<ErrorCodeUpdateKeyOnCount
		cmpa	#$32
		bhi	loc_D230
		decb
		stab	<DRBPointer2
		clrb
		bra	loc_D255
; ---------------------------------------------------------------------------

loc_D230:				; CODE XREF: sub_D69A-478j
					; sub_D69A-472j
		cmpb	#$FE
		bne	loc_D235
		incb

loc_D235:				; CODE XREF: sub_D69A-468j
		incb
		stab	<DRBPointer2
		cmpb	#8
		bcs	loc_D24A
		brset	<DRBPointer2 $80 loc_D26F
		ldx	#$B618
		abx
		brset	0,x $FF	loc_D266
		bra	loc_D251
; ---------------------------------------------------------------------------

loc_D24A:				; CODE XREF: sub_D69A-460j
		negb
		addb	#7
		ldx	#$15
		abx

loc_D251:				; CODE XREF: sub_D69A-452j
		ldab	0,x
		beq	loc_D266

loc_D255:				; CODE XREF: sub_D69A-46Cj
		ldx	#$D277
		abx
		ldaa	0,x
		lsra
		lsra
		lsra
		lsra
		asla
		oraa	#$40
		staa	LastCamFallingEdgeTime2
		rts
; ---------------------------------------------------------------------------

loc_D266:				; CODE XREF: sub_D69A-49Fj
					; sub_D69A-456j ...
		ldaa	#$4A
		staa	LastCamFallingEdgeTime2
		bset	<DRBPointer2 $80
		rts
; ---------------------------------------------------------------------------

loc_D26F:				; CODE XREF: sub_D69A-45Ej
		clra
		staa	<DRBPointer1
		staa	<DRBSerialMode
		staa	<DRBPointer2
		rts
; END OF FUNCTION CHUNK	FOR sub_D69A
; ---------------------------------------------------------------------------
ErrorCodesToDash_Table_:fcb $12
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

; =============== S U B	R O U T	I N E =======================================


ThrowNonCriticalError_:			; CODE XREF: sub_9D4C+10AP
					; sub_9EDC+B3P	...
		ldx	#$8A32

loc_D2CC:				; CODE XREF: ThrowNonCriticalError_+Cj
		brclr	0,x $FF	loc_D2D7
		cmpa	0,x
		beq	loc_D323
		inx
		bra	loc_D2CC
; ---------------------------------------------------------------------------

loc_D2D7:				; CODE XREF: ThrowNonCriticalError_:loc_D2CCj
		tstb
		bmi	loc_D2E2
		cmpa	<ErrorBitRegisterStored3
		beq	loc_D320
		cmpa	<ErrorBitRegisterStored2
		beq	loc_D316

loc_D2E2:				; CODE XREF: ThrowNonCriticalError_+Fj
		andb	#$7F
		stab	Temp0
		ldy	#$DC
		cmpa	0,y
		beq	loc_D303
		iny
		cmpa	0,y
		beq	loc_D303
		tst	0,y
		beq	loc_D303
		dey
		tst	0,y
		bne	loc_D323

loc_D303:				; CODE XREF: ThrowNonCriticalError_+25j
					; ThrowNonCriticalError_+2Cj ...
		staa	0,y
		ldab	2,y
		incb
		beq	loc_D326
		cmpb	Temp0
		bcc	loc_D326
		stab	2,y
		clc
		rts
; ---------------------------------------------------------------------------

loc_D316:				; CODE XREF: ThrowNonCriticalError_+17j
		ldd	<ErrorBitRegisterStored2
		staa	<ErrorBitRegisterStored3
		stab	<ErrorBitRegisterStored2
		ldaa	<ErrorCodeUpdateKeyOnCount
		staa	<ErrorCodeUpdateKeyOnCount2

loc_D320:				; CODE XREF: ThrowNonCriticalError_+13j
		clr	ErrorCodeUpdateKeyOnCount

loc_D323:				; CODE XREF: ThrowNonCriticalError_+9j
					; ThrowNonCriticalError_+38j
		clra
		clc
		rts
; ---------------------------------------------------------------------------

loc_D326:				; CODE XREF: ThrowNonCriticalError_+41j
					; ThrowNonCriticalError_+46j
		tst	ErrorBitRegister0
		beq	loc_D336
		brset	<BitFlags6a_t3 $40 loc_D333
		brclr	<BitFlags6a_t3 $20 loc_D336

loc_D333:				; CODE XREF: ThrowNonCriticalError_+62j
		jmp	loc_D3BE
; ---------------------------------------------------------------------------

loc_D336:				; CODE XREF: ThrowNonCriticalError_+60j
					; ThrowNonCriticalError_+66j
		clr	0,y
		clr	2,y
		ldx	#$15

loc_D33F:				; CODE XREF: ThrowNonCriticalError_+83j
		cmpa	0,x
		bne	loc_D348
		clrb
		stab	0,x
		bra	loc_D350
; ---------------------------------------------------------------------------

loc_D348:				; CODE XREF: ThrowNonCriticalError_+78j
		inx
		cpx	#$1C
		bls	loc_D33F
		ldab	#$FF

loc_D350:				; CODE XREF: ThrowNonCriticalError_+7Dj
		ldx	#$1C
		ldy	#$1D
		stab	Temp0

loc_D35A:				; CODE XREF: ThrowNonCriticalError_+B1j
		cpx	#$1A
		bcs	loc_D36F
		psha
		ldab	0,y
		ldaa	Temp0
		staa	0,y
		iny
		stab	Temp0
		pula

loc_D36F:				; CODE XREF: ThrowNonCriticalError_+94j
		ldab	0,x
		staa	0,x
		tba
		beq	loc_D3A9
		dex
		cpx	#$15
		bcc	loc_D35A
		clr	ErrorCodeUpdateKeyOnCount
		sei
		brset	<BitFlags6a_t3 $40 loc_D3BE
		brset	<BitFlags6a_t3 $20 loc_D3BE
		bset	<BitFlags6a_t3 $40
		cli
		staa	DRBOffsetStored_LB
		ldx	#$B61F

loc_D392:				; CODE XREF: ThrowNonCriticalError_+D0j
		inx
		ldab	0,x
		cba
		beq	loc_D3A4
		incb
		bne	loc_D392
		xgdx
		subd	#$B600
		stab	DRBOffsetStored_HB
		sec
		rts
; ---------------------------------------------------------------------------

loc_D3A4:				; CODE XREF: ThrowNonCriticalError_+CDj
		bclr	<BitFlags6a_t3 $40
		sec
		rts
; ---------------------------------------------------------------------------

loc_D3A9:				; CODE XREF: ThrowNonCriticalError_+ABj
		cpy	#$1F
		bhi	loc_D3B9
		ldab	<ErrorCodeUpdateKeyOnCount
		beq	loc_D3BC
		ldab	Temp0
		stab	0,y

loc_D3B9:				; CODE XREF: ThrowNonCriticalError_+E4j
		clrb
		stab	<ErrorCodeUpdateKeyOnCount

loc_D3BC:				; CODE XREF: ThrowNonCriticalError_+E8j
		sec
		rts
; ---------------------------------------------------------------------------

loc_D3BE:				; CODE XREF: ThrowNonCriticalError_:loc_D333J
					; ThrowNonCriticalError_+B7j ...
		clc
		cli
		rts
; End of function ThrowNonCriticalError_

; ---------------------------------------------------------------------------
gw_PIA1AManipulation_Table2:fcb	0
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
gw_PIA1AManipulation_Table:fcb 1
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

; =============== S U B	R O U T	I N E =======================================


sub_D3E1:				; CODE XREF: __RESET+686P
		sei
		ldab	SPCR_SerialPeripheralControl
		orab	#1
		stab	SPCR_SerialPeripheralControl
		bclr	<PIA3_Buffer_t3	4
		ldab	<PIA3_Buffer_t3
		stab	PIA3_Buffer_2_t3
		ldaa	<PIA2_Buffer_t3
		cmpa	SPSR_SerialPeripheralStatus
		staa	SPDR_SerialPeripheralDataIO
		mul
		mul
		nop
		bset	<PIA3_Buffer_t3	4
		ldaa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		ldaa	SPDR_SerialPeripheralDataIO
		ldab	SPCR_SerialPeripheralControl
		andb	#$FC
		stab	SPCR_SerialPeripheralControl
		staa	Temp1_t3
		cli
		brclr	<BitFlags2e $40	loc_D47B
		eora	PIA2_Buffer_t3_Temp
		anda	byte_8A39
		ldx	#$D3D1
		ldab	<Counter_MainLoop
		andb	#7
		abx
		bita	0,x
		beq	loc_D47B
		ldaa	CountdownTimerFromKeyOn
		bne	loc_D47B
		ldaa	SwitchPortAccessReg1
		bita	#$40
		bne	loc_D47B
		ldaa	<BatteryVolts
		cmpa	#$A0
		bcs	loc_D47B
		ldaa	8,x
		ldab	#$A0
		cmpa	#$11
		beq	loc_D453
		cmpa	#$12
		beq	loc_D461
		cmpa	#$33
		beq	loc_D46F
		ldab	#$20
		jsr	ThrowNonCriticalError_
		bra	loc_D47B
; ---------------------------------------------------------------------------

loc_D453:				; CODE XREF: sub_D3E1+61j
		brset	<b5D_IPL2_t3 8 loc_D47B
		jsr	ThrowNonCriticalError_
		bcc	loc_D47B
		bset	<b5D_IPL2_t3 8
		bra	loc_D47B
; ---------------------------------------------------------------------------

loc_D461:				; CODE XREF: sub_D3E1+65j
		brset	<b5D_IPL2_t3 $20 loc_D47B
		jsr	ThrowNonCriticalError_
		bcc	loc_D47B
		bset	<b5D_IPL2_t3 $20
		bra	loc_D47B
; ---------------------------------------------------------------------------

loc_D46F:				; CODE XREF: sub_D3E1+69j
		brset	<b5D_IPL2_t3 4 loc_D47B
		jsr	ThrowNonCriticalError_
		bcc	loc_D47B
		bset	<b5D_IPL2_t3 4

loc_D47B:				; CODE XREF: sub_D3E1+33j sub_D3E1+47j ...
		ldaa	<PIA2_Buffer_t3
		staa	PIA2_Buffer_t3_Temp
		bset	<BitFlags2e $40
		rts
; End of function sub_D3E1


; =============== S U B	R O U T	I N E =======================================


UpdatePIA1AndCheckOutputs2_MM:		; CODE XREF: __RESET+476P __RESET+683P
		ldaa	<EngineRpm_HB
		cmpa	#$3F
		bcs	loc_D4A5
		brclr	<BitFlags27 $20	loc_D4A5
		ldaa	<BitFlags_BF_t3
		cmpa	#$83
		beq	loc_D4A5
		cmpa	#$81
		beq	loc_D4A5
		ldd	TCNT_Counter_FreeRunning16bit
		subd	TIC1_Counter_IC1_CamSensor
		cpd	#$FA
		bcs	loc_D4A5
		rts
; ---------------------------------------------------------------------------

loc_D4A5:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+4j
					; UpdatePIA1AndCheckOutputs2_MM+6j ...
		ldaa	<PIA1_Buffer_t3
		adda	#$C3
		staa	Temp0
		ldab	#$40
		ldaa	#$61
		ldy	#$1000
		ldx	#$6400
		sei
		bset	0,x 8
		bclr	8,y $20
		cmpb	SPSR_SerialPeripheralStatus
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	#$62

loc_D4D4:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+55j
		brclr	0,x 8 loc_D4DE
		decb
		bne	loc_D4D4
		jmp	loc_D640
; ---------------------------------------------------------------------------

loc_D4DE:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D4D4j
		ldab	#$B
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		staa	Temp1
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	#0

loc_D4F5:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+76j
		brclr	0,x 8 loc_D4FF
		decb
		bne	loc_D4F5
		jmp	loc_D640
; ---------------------------------------------------------------------------

loc_D4FF:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D4F5j
		ldab	#$B
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		staa	Temp2
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	<PIA1_Buffer_t3

loc_D516:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+97j
		brclr	0,x 8 loc_D520
		decb
		bne	loc_D516
		jmp	loc_D640
; ---------------------------------------------------------------------------

loc_D520:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D516j
		ldab	#$B
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		staa	Temp3
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	#0

loc_D537:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+B8j
		brclr	0,x 8 loc_D541
		decb
		bne	loc_D537
		jmp	loc_D640
; ---------------------------------------------------------------------------

loc_D541:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D537j
		ldab	#$B
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		staa	Temp4

loc_D553:				; DATA XREF: RESERVED:DFDAw
					; RESERVED:DFE3w
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	Temp0

loc_D559:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+DAj
		brclr	0,x 8 loc_D563
		decb
		bne	loc_D559
		jmp	loc_D640
; ---------------------------------------------------------------------------

loc_D563:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D559j
		ldab	#$B
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop

loc_D56F:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+F1j
		brset	$29,y $80 loc_D57A
		decb
		bne	loc_D56F
		jmp	loc_D640
; ---------------------------------------------------------------------------

loc_D57A:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D56Fj
		ldaa	SPDR_SerialPeripheralDataIO
		bset	8,y $20
		cli
		ldab	Temp1
		addb	Temp2
		addb	Temp3
		addb	Temp4
		cba
		beq	loc_D594
		jmp	locret_D63B
; ---------------------------------------------------------------------------

loc_D594:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+10Bj
		ldaa	Temp2
		brclr	<BitFlags27 $C0	loc_D5D8
		ldab	byte_8011
		beq	loc_D5AC
		cmpb	#2
		bne	loc_D5AA
		ldab	byte_800F
		lsrb
		bcs	loc_D5AC

loc_D5AA:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+11Ej
		eora	#2

loc_D5AC:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+11Aj
					; UpdatePIA1AndCheckOutputs2_MM+124j
		eora	#$80
		ldab	<StartupSwitchMirror1
		andb	#$40
		stab	Temp0
		staa	<StartupSwitchMirror1
		anda	#$40
		eora	Temp0
		beq	loc_D5C1
		bset	<BitFlags2f $20

loc_D5C1:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+138j
		brclr	<StartupSwitchMirror1 $40 loc_D5D3
		brclr	<StartupSwitchMirror1 $80 loc_D5CE
		bset	<BitFlags68_t3 $20
		bra	loc_D5E6
; ---------------------------------------------------------------------------

loc_D5CE:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+141j
		bclr	<BitFlags68_t3 $20
		bra	loc_D5E6
; ---------------------------------------------------------------------------

loc_D5D3:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D5C1j
		bset	<BitFlags68_t3 $20
		bra	loc_D5E6
; ---------------------------------------------------------------------------

loc_D5D8:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+113j
		staa	<StartupSwitchMirror1
		brclr	<StartupSwitchMirror1 $80 loc_D5E3
		bset	<BitFlags68_t3 $20
		bra	loc_D5E6
; ---------------------------------------------------------------------------

loc_D5E3:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+156j
		bclr	<BitFlags68_t3 $20

loc_D5E6:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+148j
					; UpdatePIA1AndCheckOutputs2_MM+14Dj ...
		brclr	<Ram_30	$80 loc_D63C
		ldaa	Temp4
		anda	byte_8A38
		ldx	#$D3C1
		ldab	<Counter_MainLoop
		andb	#7
		abx
		bita	0,x
		beq	locret_D63B
		ldaa	CountdownTimerFromKeyOn
		bne	locret_D63B
		ldaa	SwitchPortAccessReg1
		bita	#$40
		bne	locret_D63B
		ldaa	<BatteryVolts
		cmpa	#$A0
		bcs	locret_D63B
		ldaa	8,x
		ldab	#$A0
		cmpa	#$C
		beq	loc_D628
		cmpa	#$19
		bne	loc_D636
		brset	<b5D_IPL2_t3 $80 locret_D63B
		jsr	ThrowNonCriticalError_
		bcc	locret_D63B
		bset	<b5D_IPL2_t3 $80
		bra	locret_D63B
; ---------------------------------------------------------------------------

loc_D628:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+190j
		brset	<b5d_IPL2 $80 locret_D63B
		jsr	ThrowNonCriticalError_
		bcc	locret_D63B
		bset	<b5d_IPL2 $80
		bra	locret_D63B
; ---------------------------------------------------------------------------

loc_D636:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+194j
		ldab	#$20
		jsr	ThrowNonCriticalError_

locret_D63B:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+10DJ
					; UpdatePIA1AndCheckOutputs2_MM+176j ...
		rts
; ---------------------------------------------------------------------------

loc_D63C:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM:loc_D5E6j
		bset	<Ram_30	$80
		rts
; ---------------------------------------------------------------------------

loc_D640:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+57J
					; UpdatePIA1AndCheckOutputs2_MM+78J ...
		bset	8,y $20
		cli
		ldaa	<BitFlags6a_t3
		bita	#$60
		bne	loc_D665
		ldaa	PPROG_EEPROMControlReg
		bita	#2
		bne	loc_D665
		ldd	#$B618
		tba
		ldab	byte_B618
		beq	loc_D665
		decb
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB
		bset	<BitFlags6a_t3 $40

loc_D665:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+1C5j
					; UpdatePIA1AndCheckOutputs2_MM+1CCj ...
		ldd	#$4488
		jsr	ThrowNonCriticalError_
		bcc	loc_D680
		sei
		ldaa	SwitchPortAccessReg1
		anda	#$FE
		staa	SwitchPortAccessReg1
		ldab	#3

loc_D678:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+1F5j
		decb
		bne	loc_D678
		oraa	#1
		staa	SwitchPortAccessReg1

loc_D680:				; CODE XREF: UpdatePIA1AndCheckOutputs2_MM+1E7j
		cli
		rts
; End of function UpdatePIA1AndCheckOutputs2_MM


; =============== S U B	R O U T	I N E =======================================


sub_D682:				; CODE XREF: __RESET+65CP
		ldaa	<Ram_F3
		bpl	locret_D699
		anda	#$7F
		staa	<Ram_F3
		ldd	#$26A8
		brset	<b5C_IPL1_t3 $80 locret_D699
		jsr	ThrowNonCriticalError_
		bcc	locret_D699
		bset	<b5C_IPL1_t3 $80

locret_D699:				; CODE XREF: sub_D682+2j sub_D682+Bj ...
		rts
; End of function sub_D682


; =============== S U B	R O U T	I N E =======================================


sub_D69A:				; CODE XREF: __RESET+653P

; FUNCTION CHUNK AT D1BB SIZE 000000BC BYTES

		ldab	#$40
		brset	<IPL1 $40 loc_D6BA
		ldaa	<DRBPointer1
		cmpa	#$A
		bne	loc_D6A9
		jmp	loc_D1BB
; ---------------------------------------------------------------------------

loc_D6A9:				; CODE XREF: sub_D69A+Aj
		cmpa	#$18
		bne	loc_D6B4
		ldaa	<Counter_MainLoop
		asla
		bmi	loc_D6DE
		bra	loc_D6DD
; ---------------------------------------------------------------------------

loc_D6B4:				; CODE XREF: sub_D69A+11j
		brset	<BitFlags6a_t3 4 loc_D6DE
		bra	loc_D6DD
; ---------------------------------------------------------------------------

loc_D6BA:				; CODE XREF: sub_D69A+2j
		ldx	<KeyOnOrEngineRunningTime
		cpx	#3
		bls	loc_D6DE
		bclr	<Ram_05	$C0
		brclr	<PIA1_Buffer_t3	$40 loc_D6DD
		ldaa	<b5C_IPL1_t3
		bita	byte_8A3A
		bne	loc_D6DD
		ldaa	<b5D_IPL2_t3
		bita	byte_8A3B
		bne	loc_D6DD
		ldaa	<b5d_IPL2
		bita	byte_8A3C
		beq	loc_D6DE

loc_D6DD:				; CODE XREF: sub_D69A+18j sub_D69A+1Ej ...
		clrb

loc_D6DE:				; CODE XREF: sub_D69A+16j
					; sub_D69A:loc_D6B4j ...
		ldaa	#$BF
		anda	<PIA1_Buffer_t3
		aba
		staa	<PIA1_Buffer_t3
		rts
; End of function sub_D69A


; =============== S U B	R O U T	I N E =======================================


sub_D6E6:				; CODE XREF: __RESET+624P
		ldaa	<BitFlags27
		bita	#$C0
		beq	locret_D732
		brset	<IPL1 $40 loc_D6F6
		brset	<BitFlags6a_t3 4 loc_D72A
		bra	loc_D72F
; ---------------------------------------------------------------------------

loc_D6F6:				; CODE XREF: sub_D6E6+6j
		brset	<b5C_IPL1_t3 $20 loc_D72F
		ldaa	<Counter_MainLoop
		bita	#$3C
		bne	loc_D726
		ldaa	<TargetBatteryVolts
		suba	<BatteryVolts
		bcs	loc_D71F
		cmpa	#$11
		bcs	loc_D71F
		ldd	<EngineRpm_HB
		cpd	#$2EE0
		bcs	loc_D722
		ldaa	UNe_64B8
		inca
		cmpa	#$56
		bcs	loc_D723
		bset	<Ram_30	$20
		bra	loc_D72F
; ---------------------------------------------------------------------------

loc_D71F:				; CODE XREF: sub_D6E6+1Ej sub_D6E6+22j
		bclr	<Ram_30	$20

loc_D722:				; CODE XREF: sub_D6E6+2Aj
		clra

loc_D723:				; CODE XREF: sub_D6E6+32j
		staa	UNe_64B8

loc_D726:				; CODE XREF: sub_D6E6+18j
		brset	<Ram_30	$20 loc_D72F

loc_D72A:				; CODE XREF: sub_D6E6+Aj
		bset	<PIA2_Buffer_t3	4
		bra	locret_D732
; ---------------------------------------------------------------------------

loc_D72F:				; CODE XREF: sub_D6E6+Ej
					; sub_D6E6:loc_D6F6j ...
		bclr	<PIA2_Buffer_t3	4

locret_D732:				; CODE XREF: sub_D6E6+4j sub_D6E6+47j
		rts
; End of function sub_D6E6


; =============== S U B	R O U T	I N E =======================================


sub_D733:				; CODE XREF: __RESET+605P
		ldd	<ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
		tsta
		beq	loc_D740
		dec	ClearTheErrorTimer_0
		bne	loc_D740
		clr	ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB

loc_D740:				; CODE XREF: sub_D733+3j sub_D733+8j
		tstb
		beq	loc_D74B
		dec	ClearTheErrorTimer_1
		bne	loc_D74B
		clr	ErrorBitsAssociatedWithPIA1AndReg1eTo25_LB

loc_D74B:				; CODE XREF: sub_D733+Ej sub_D733+13j
		ldaa	ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
		beq	locret_D75A
		suba	#$10
		bita	#$F0
		bne	loc_D757
		clra

loc_D757:				; CODE XREF: sub_D733+21j
		staa	ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

locret_D75A:				; CODE XREF: sub_D733+1Bj
		rts
; End of function sub_D733


; =============== S U B	R O U T	I N E =======================================


sub_D75B:				; CODE XREF: __RESET+68CP
		brclr	<IPL1 $40 locret_D794
		brset	<BitFlags6d_t3 4 locret_D794
		brset	<BitFlags6a_t3 $40 locret_D794
		bset	<BitFlags6d_t3 4
		brclr	<ErrorBitRegisterStored3 $FF loc_D78D
		ldaa	<ErrorCodeUpdateKeyOnCount
		cmpa	#$32
		bcs	loc_D777
		jmp	DRB_ClearErrorCodes
; ---------------------------------------------------------------------------

loc_D777:				; CODE XREF: sub_D75B+17j
		ldaa	<ErrorBitRegisterStored1
		beq	loc_D782
		ldaa	<ErrorCodeUpdateKeyOnCount3
		inca
		beq	loc_D782
		staa	<ErrorCodeUpdateKeyOnCount3

loc_D782:				; CODE XREF: sub_D75B+1Ej sub_D75B+23j
		ldaa	<ErrorBitRegisterStored2
		beq	loc_D78D
		ldaa	<ErrorCodeUpdateKeyOnCount2
		inca
		beq	loc_D78D
		staa	<ErrorCodeUpdateKeyOnCount2

loc_D78D:				; CODE XREF: sub_D75B+Fj sub_D75B+29j	...
		ldaa	<ErrorCodeUpdateKeyOnCount
		inca
		beq	locret_D794
		staa	<ErrorCodeUpdateKeyOnCount

locret_D794:				; CODE XREF: sub_D75Bj	sub_D75B+4j ...
		rts
; End of function sub_D75B


; =============== S U B	R O U T	I N E =======================================


sub_D795:				; CODE XREF: sub_B800+4AP sub_B88A+4DP ...
		anda	#$F
		ldab	ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
		beq	loc_D7A4
		andb	#$F
		cba
		bne	locret_D7AB
		ldaa	ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

loc_D7A4:				; CODE XREF: sub_D795+5j
		adda	#$10
		bcs	loc_D7AC
		staa	ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR

locret_D7AB:				; CODE XREF: sub_D795+Aj
		rts
; ---------------------------------------------------------------------------

loc_D7AC:				; CODE XREF: sub_D795+11j
		ldab	#1

loc_D7AE:				; CODE XREF: sub_D795+1Dj
		deca
		beq	loc_D7B4
		aslb
		bra	loc_D7AE
; ---------------------------------------------------------------------------

loc_D7B4:				; CODE XREF: sub_D795+1Aj
		clr	ERRORCODERESETTIMERIN_UN_ERRORCODEIN_LN_VAR
		comb
		sei
		andb	<b5C_IPL1_t3
		stab	<b5C_IPL1_t3
		cli
		rts
; End of function sub_D795

; ---------------------------------------------------------------------------

loc_D7BF:				; CODE XREF: sub_C75D:loc_C792P
					; IC1I:loc_F213P ...
		ldab	<EngineRpm_HB
		cmpb	#$7D
		ldaa	#0
		bcc	loc_D7DD
		subb	#$10
		bcc	loc_D7CC
		clrb

loc_D7CC:				; CODE XREF: RESERVED:D7C9j
		ldaa	#$29
		mul
		lsld
		aslb
		adca	<LowestSessionTpsVolts
		tab
		ldaa	<TpsVolts
		adda	byte_8A9A
		sba
		bcc	loc_D7DD
		clra

loc_D7DD:				; CODE XREF: RESERVED:D7C5j
					; RESERVED:D7DAj
		ldx	#$8A86
		jsr	Lookup4ByteTable
		adda	byte_8A99
		bcc	locret_D7EA
		ldaa	#$FF

locret_D7EA:				; CODE XREF: RESERVED:D7E6j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_D7EB:				; CODE XREF: __RESET+50AP
		brclr	<Ram_05	1 loc_D825
		ldab	<BatteryVolts
		cmpb	byte_8A44
		bcs	loc_D816
		cmpb	byte_8A43
		bcc	loc_D816
		ldaa	<MapVolts_X
		suba	<MapValue3
		bls	loc_D816
		cmpa	byte_8A42
		bcs	loc_D816
		sei

loc_D807:				; CODE XREF: sub_D7EB+1Fj
		ldaa	ADCTL_A2DControlReg
		bpl	loc_D807
		ldaa	ADR1_A2DResults1
		staa	<MapVolts_X
		staa	<MapValue3
		cli
		bra	loc_D81F
; ---------------------------------------------------------------------------

loc_D816:				; CODE XREF: sub_D7EB+9j sub_D7EB+Ej ...
		ldaa	UNe_64B9
		anda	#$E0
		cmpa	#$E0
		bne	loc_D825

loc_D81F:				; CODE XREF: sub_D7EB+29j
		ldd	#$2828
		jsr	ThrowNonCriticalError_

loc_D825:				; CODE XREF: sub_D7EBj	sub_D7EB+32j
		brset	<BitFlags_BF_t3	$80 locret_D841
		ldaa	UNe_64B9
		anda	#$1F
		cmpa	#$1F
		bne	locret_D841
		brset	<b5d_IPL2 $40 locret_D841
		ldd	#$181
		jsr	ThrowNonCriticalError_
		bcc	locret_D841
		bset	<b5d_IPL2 $40

locret_D841:				; CODE XREF: sub_D7EB:loc_D825j
					; sub_D7EB+45j	...
		rts
; End of function sub_D7EB


; =============== S U B	R O U T	I N E =======================================


sub_D842:				; CODE XREF: __RESET+668P
		brclr	<IPL1 $40 locret_D88A
		ldd	<KeyOnOrEngineRunningTime
		cmpa	#$B
		bcs	locret_D88A
		ldaa	<CoolantTemp
		cmpa	byte_8A58
		bcs	locret_D88A
		bitb	#$1F
		bne	locret_D88A
		brset	<BitFlags27 1 loc_D85F
		brclr	<BitFlags68_t3 $10 locret_D88A

loc_D85F:				; CODE XREF: sub_D842+15j
		brset	<StartupSwitchMirror1 $20 locret_D88A
		brclr	<BitFlags66_t3 $80 locret_D88A
		ldaa	<EngineRpm_HB
		cmpa	byte_8A56
		bcs	locret_D88A
		ldaa	<MapVolts
		cmpa	byte_8A57
		bcc	locret_D88A
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	#2
		bcc	locret_D88A
		brset	<b5D_IPL2_t3 $10 locret_D88A
		ldd	#$23A0
		jsr	ThrowNonCriticalError_
		bcc	locret_D88A
		bset	<b5D_IPL2_t3 $10

locret_D88A:				; CODE XREF: sub_D842j	sub_D842+8j ...
		rts
; End of function sub_D842


; =============== S U B	R O U T	I N E =======================================


sub_D88B:				; CODE XREF: __RESET+66EP
		ldaa	SwitchPortAccessReg1
		bita	#$40
		beq	loc_D893
		rts
; ---------------------------------------------------------------------------

loc_D893:				; CODE XREF: sub_D88B+5j
		brset	<IPL1 $40 loc_D89A
		jmp	loc_D8DD
; ---------------------------------------------------------------------------

loc_D89A:				; CODE XREF: sub_D88B:loc_D893j
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	#$2C
		bcs	loc_D8DD
		ldaa	<CoolantTemp
		cmpa	#$CD
		bcs	loc_D8DD
		brclr	<BitFlags2e 4 loc_D8E2
		ldaa	<Counter_O2Diagnostics
		cmpa	#$13
		bcs	loc_D8D8
		ldaa	<O2SensorVolts
		cmpa	#$4D
		bcs	loc_D8DD
		ldaa	<Timer_O2MiddleDiagnostics
		cmpa	#$2A
		bcs	loc_D8CD
		brset	<b5d_IPL2 2 loc_D8CB
		ldd	#$2081
		jsr	ThrowNonCriticalError_
		bcc	locret_D93B
		bset	<b5d_IPL2 2

loc_D8CB:				; CODE XREF: sub_D88B+31j
		bra	locret_D93B
; ---------------------------------------------------------------------------

loc_D8CD:				; CODE XREF: sub_D88B+2Fj
		ldab	<Counter_MainLoop
		bitb	#$7F
		bne	locret_D93B
		inca
		staa	<Timer_O2MiddleDiagnostics
		bra	locret_D93B
; ---------------------------------------------------------------------------

loc_D8D8:				; CODE XREF: sub_D88B+23j
		inca
		staa	<Counter_O2Diagnostics
		bra	locret_D93B
; ---------------------------------------------------------------------------

loc_D8DD:				; CODE XREF: sub_D88B+CJ sub_D88B+13j	...
		bclr	<BitFlags2e 4
		bra	loc_D912
; ---------------------------------------------------------------------------

loc_D8E2:				; CODE XREF: sub_D88B+1Bj
		ldaa	<O2SensorVolts
		cmpa	byte_8A53
		bhi	loc_D912
		cmpa	byte_8A54
		bcs	loc_D912
		ldaa	<Timer_O2MiddleDiagnostics
		cmpa	#$15
		bcs	loc_D909
		bset	<BitFlags2e 4
		clra
		staa	<Timer_O2MiddleDiagnostics
		staa	<Counter_O2Diagnostics
		sei
		ldaa	<PIA3_Buffer_t3
		oraa	#8
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		cli
		bra	locret_D93B
; ---------------------------------------------------------------------------

loc_D909:				; CODE XREF: sub_D88B+67j
		ldab	<Counter_MainLoop
		bitb	#$7F
		bne	loc_D915
		inca
		bra	loc_D913
; ---------------------------------------------------------------------------

loc_D912:				; CODE XREF: sub_D88B+55j sub_D88B+5Cj ...
		clra

loc_D913:				; CODE XREF: sub_D88B+85j
		staa	<Timer_O2MiddleDiagnostics

loc_D915:				; CODE XREF: sub_D88B+82j
		sei
		ldaa	<PIA3_Buffer_t3
		anda	#$F7
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		cli
		ldaa	<Counter_MainLoop
		bita	#$F
		bne	locret_D93B
		brset	<b5d_IPL2 4 locret_D93B
		ldaa	<O2SensorVolts
		cmpa	#$3E
		bls	locret_D93B
		ldd	#$3E8F
		jsr	ThrowNonCriticalError_
		bcc	locret_D93B
		bset	<b5d_IPL2 4

locret_D93B:				; CODE XREF: sub_D88B+3Bj
					; sub_D88B:loc_D8CBj ...
		rts
; End of function sub_D88B


; =============== S U B	R O U T	I N E =======================================


sub_D93C:				; CODE XREF: __RESET+662P
		ldaa	<ATMOffset
		cmpa	#$D
		beq	loc_D973
		brset	<b5d_IPL2 $10 loc_D973
		sei
		ldaa	SwitchPortAccessReg1
		bita	#$10
		beq	loc_D973
		bita	#$40
		bne	loc_D973
		brset	<PIA2_Buffer_t3	$10 loc_D973
		brclr	<BitFlags2e $20	loc_D96D
		lsra
		eora	<BitFlags24
		bita	#2
		cli
		beq	loc_D96D
		ldd	#$BA0
		jsr	ThrowNonCriticalError_
		bcc	loc_D96D
		bset	<b5d_IPL2 $10

loc_D96D:				; CODE XREF: sub_D93C+1Aj sub_D93C+24j ...
		cli
		bset	<BitFlags2e $20
		bra	locret_D977
; ---------------------------------------------------------------------------

loc_D973:				; CODE XREF: sub_D93C+4j sub_D93C+6j ...
		cli
		bclr	<BitFlags2e $20

locret_D977:				; CODE XREF: sub_D93C+35j
		rts
; End of function sub_D93C


; =============== S U B	R O U T	I N E =======================================


sub_D978:				; CODE XREF: __RESET+613P
		brclr	<BitFlags2e 2 loc_D99E
		ldaa	<BatteryVolts
		cmpa	#$82
		bcs	locret_D99D
		ldaa	<Counter_MainLoop
		bita	#4
		bne	locret_D99D
		ldaa	<TimerOverflowsBetweenCamPulses
		bne	locret_D99D
		brset	<DistributorFallingEdgePulsewidth_HB $80 locret_D99D
		ldaa	SwitchPortAccessReg1
		bita	#$50
		bne	locret_D99D
		ldd	#$2C14
		jsr	ThrowNonCriticalError_

locret_D99D:				; CODE XREF: sub_D978+8j sub_D978+Ej ...
		rts
; ---------------------------------------------------------------------------

loc_D99E:				; CODE XREF: sub_D978j
		bset	<BitFlags2e 2
		rts
; End of function sub_D978


; =============== S U B	R O U T	I N E =======================================


sub_D9A2:				; CODE XREF: IC1I+7A4P
		ldaa	<BitFlags608D
		anda	#$F
		inca
		cmpa	byte_8A6A
		bcc	loc_D9B2
		inc	BitFlags608D
		jmp	locret_DA30
; ---------------------------------------------------------------------------

loc_D9B2:				; CODE XREF: sub_D9A2+8j
		ldaa	<BitFlags608D
		anda	#$F0
		staa	<BitFlags608D
		ldaa	<MapVolts_X
		suba	<MapValue3
		ldab	ADR1_A2DResults1
		stab	<MapVolts_X
		stab	<MapValue3
		brset	<b5C_IPL1_t3 $80 loc_D9EE
		cmpa	byte_8A68
		bcc	locret_DA30
		ldd	<EngineRpm_HB
		cpd	word_8A7B
		bcs	locret_DA30
		cpd	word_8A7D
		bcc	locret_DA30
		ldaa	<MapVolts_X
		cmpa	byte_8A7F
		bcs	locret_DA30
		cmpa	byte_8A80
		bcc	locret_DA30
		ldaa	<Ram_F3
		oraa	#$80
		staa	<Ram_F3
		bra	locret_DA30
; ---------------------------------------------------------------------------

loc_D9EE:				; CODE XREF: sub_D9A2+21j
		ldab	<BitFlags608D
		addb	#$10
		bcc	loc_D9F6
		orab	#$F0

loc_D9F6:				; CODE XREF: sub_D9A2+50j
		stab	<BitFlags608D
		suba	byte_8A68
		bcs	locret_DA30
		cmpa	byte_8A69
		bcs	locret_DA30
		ldaa	<VehicleSpeedx8_Scaled
		bne	loc_DA18
		brset	<BitFlags66_t3 $80 loc_DA18
		ldd	<EngineRpm_HB
		subd	<TargetIdleSpeedHB
		bcc	loc_DA12
		coma
		comb

loc_DA12:				; CODE XREF: sub_D9A2+6Cj
		cpd	word_8A81
		bcs	locret_DA30

loc_DA18:				; CODE XREF: sub_D9A2+62j sub_D9A2+64j
		ldab	byte_8A6A
		ldx	#$8A6B
		abx
		ldaa	0,x
		cmpa	<BitFlags608D
		bhi	locret_DA30
		ldaa	#8
		jsr	sub_D795
		ldaa	<BitFlags608D
		anda	#$F
		staa	<BitFlags608D

locret_DA30:				; CODE XREF: sub_D9A2+DJ sub_D9A2+28j	...
		rts
; End of function sub_D9A2


; =============== S U B	R O U T	I N E =======================================


sub_DA31:				; CODE XREF: __RESET+674P
		ldaa	<Counter_MainLoop
		bita	#7
		bne	loc_DA8A
		brset	<b5C_IPL1_t3 $80 loc_DA72
		tst	VehicleSpeedx8_Scaled
		bne	loc_DA72
		brset	<BitFlags66_t3 $80 loc_DA72
		ldd	<EngineRpm_HB
		subd	<TargetIdleSpeedHB
		bcc	loc_DA4C
		coma
		comb

loc_DA4C:				; CODE XREF: sub_DA31+17j
		cpd	word_8A81
		bcc	loc_DA72
		ldaa	<BaroPressure
		suba	<MapValue
		bcs	loc_DA67
		ldab	<BaroPressure
		ldx	#$8A84
		cmpb	byte_8A83
		bcc	loc_DA63
		inx

loc_DA63:				; CODE XREF: sub_DA31+2Fj
		cmpa	0,x
		bcc	loc_DA72

loc_DA67:				; CODE XREF: sub_DA31+25j
		ldd	#$2794
		jsr	ThrowNonCriticalError_
		bcc	loc_DA72
		bset	<b5C_IPL1_t3 $80

loc_DA72:				; CODE XREF: sub_DA31+6j sub_DA31+Dj ...
		brclr	<BitFlags2e $80	loc_DA8C
		sei

loc_DA77:				; CODE XREF: sub_DA31+49j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_DA77
		ldaa	ADR1_A2DResults1
		cli
		cmpa	TL_MapSensorMiddleLimit
		bcs	locret_DAC6
		cmpa	byte_8A66
		bcs	loc_DACB

loc_DA8A:				; CODE XREF: sub_DA31+4j
		bra	locret_DAC6
; ---------------------------------------------------------------------------

loc_DA8C:				; CODE XREF: sub_DA31:loc_DA72j
		ldx	<EngineRpm_HB
		cpx	#$C80
		bcs	locret_DAC6
		cpx	#$2EE0
		bcc	locret_DAC6
		ldaa	<TpsVolts_Minus_LowestSessionTpsVolts
		cmpa	#$32
		bcc	locret_DAC6
		sei

loc_DA9F:				; CODE XREF: sub_DA31+71j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_DA9F
		ldaa	ADR1_A2DResults1
		cli
		cmpa	byte_8A66
		bcc	loc_DAB7
		cmpa	byte_8A65
		bcc	loc_DAC7
		ldd	#$2494
		bra	loc_DABA
; ---------------------------------------------------------------------------

loc_DAB7:				; CODE XREF: sub_DA31+7Aj
		ldd	#$2594

loc_DABA:				; CODE XREF: sub_DA31+84j
		brset	<b5C_IPL1_t3 8 locret_DAC6
		jsr	ThrowNonCriticalError_
		bcc	locret_DAC6
		bset	<b5C_IPL1_t3 8

locret_DAC6:				; CODE XREF: sub_DA31+52j
					; sub_DA31:loc_DA8Aj ...
		rts
; ---------------------------------------------------------------------------

loc_DAC7:				; CODE XREF: sub_DA31+7Fj
		brclr	<b5C_IPL1_t3 8 locret_DAC6

loc_DACB:				; CODE XREF: sub_DA31+57j
		ldaa	#4
		jsr	sub_D795
		brset	<b5C_IPL1_t3 8 locret_DAC6
		bclr	<BitFlags2e $80
		bra	locret_DAC6
; End of function sub_DA31


; =============== S U B	R O U T	I N E =======================================


sub_DAD9:				; CODE XREF: __RESET+65FP
		ldaa	<Counter_MainLoop
		bita	#$1F
		bne	locret_DB00
		brclr	<IPL1 $40 locret_DB00
		ldaa	<BatteryVolts
		suba	<TargetBatteryVolts
		bcs	loc_DAFD
		cmpa	#$10
		bcs	loc_DAFD
		brset	<b5C_IPL1_t3 $20 locret_DB00
		ldd	#$6A0
		jsr	ThrowNonCriticalError_
		bcc	locret_DB00
		bset	<b5C_IPL1_t3 $20
		rts
; ---------------------------------------------------------------------------

loc_DAFD:				; CODE XREF: sub_DAD9+Ej sub_DAD9+12j
		bclr	<b5C_IPL1_t3 $20

locret_DB00:				; CODE XREF: sub_DAD9+4j sub_DAD9+6j ...
		rts
; End of function sub_DAD9


; =============== S U B	R O U T	I N E =======================================


sub_DB01:				; CODE XREF: __RESET+66BP
		brset	<b5C_IPL1_t3 2 locret_DB36
		ldaa	<CoolantTemp
		cmpa	byte_8A3F
		bcs	loc_DB11
		bset	<BitFlags6d_t3 2
		bra	locret_DB36
; ---------------------------------------------------------------------------

loc_DB11:				; CODE XREF: sub_DB01+9j
		brset	<BitFlags6d_t3 2 locret_DB36
		brclr	<IPL1 $40 locret_DB36
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	#$FF
		bne	locret_DB36
		ldaa	<VehicleSpeedx8_Scaled
		cmpa	byte_8A40
		bcs	locret_DB36
		ldab	Timer_ThermostatDiagnostics
		cmpb	byte_8A41
		beq	loc_DB37
		ldaa	<Counter_MainLoop
		bne	locret_DB36
		incb
		stab	Timer_ThermostatDiagnostics

locret_DB36:				; CODE XREF: sub_DB01j	sub_DB01+Ej ...
		rts
; ---------------------------------------------------------------------------

loc_DB37:				; CODE XREF: sub_DB01+2Bj
		ldd	#$2101
		jsr	ThrowNonCriticalError_
		bcc	locret_DB42
		bset	<BitFlags6d_t3 2

locret_DB42:				; CODE XREF: sub_DB01+3Cj
		rts
; End of function sub_DB01


; =============== S U B	R O U T	I N E =======================================


sub_DB43:				; CODE XREF: __RESET+638P
		brset	<BitFlags2D 8 loc_DB76
		brclr	<BitFlags2D 4 loc_DB76
		brclr	<IPL1 $40 loc_DB76
		sei
		ldaa	<BitFlags6a_t3
		bita	#$60
		bne	loc_DB74
		bset	<BitFlags2D 8
		ldx	#$B613
		ldaa	0,x
		inca
		beq	loc_DB74
		cmpa	byte_884E
		bcs	loc_DB69
		bset	<BitFlags2D 2

loc_DB69:				; CODE XREF: sub_DB43+21j
		staa	DRBOffsetStored_LB
		ldaa	#$13
		staa	DRBOffsetStored_HB
		bset	<BitFlags6a_t3 $40

loc_DB74:				; CODE XREF: sub_DB43+11j sub_DB43+1Cj
		cli
		nop

loc_DB76:				; CODE XREF: sub_DB43j	sub_DB43+4j ...
		sei
		brset	<BitFlags6a_t3 $40 loc_DBF9
		ldx	#$B616
		brclr	<BitFlags2D $10	loc_DBBA
		brset	<BitFlags2D 1 loc_DBBA
		ldaa	#$16
		ldab	#$4A
		brclr	<BitFlags6a_t3 $20 loc_DBB1
		cmpa	DRBOffsetStored_HB
		beq	loc_DBAA
		inca
		cmpa	DRBOffsetStored_HB
		bne	loc_DBBA
		bset	<BitFlags6a_t3 $40
		bclr	<BitFlags6a_t3 $20
		bset	<BitFlags2D 1
		ldaa	#$13
		clrb
		stab	Counter_ACControl1
		bra	loc_DBB4
; ---------------------------------------------------------------------------

loc_DBAA:				; CODE XREF: sub_DB43+4Ej
		bset	<BitFlags6a_t3 $40
		inca
		comb
		bra	loc_DBB4
; ---------------------------------------------------------------------------

loc_DBB1:				; CODE XREF: sub_DB43+47j
		bset	<BitFlags6a_t3 $60

loc_DBB4:				; CODE XREF: sub_DB43+65j sub_DB43+6Cj
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB

loc_DBBA:				; CODE XREF: sub_DB43+3Bj sub_DB43+3Fj ...
		ldaa	1,x
		coma
		cmpa	0,x
		bne	loc_DBCA
		cmpa	#$4A
		bne	loc_DBCA
		bset	<BitFlags2D 4
		bra	loc_DBCD
; ---------------------------------------------------------------------------

loc_DBCA:				; CODE XREF: sub_DB43+7Cj sub_DB43+80j
		bclr	<BitFlags2D 4

loc_DBCD:				; CODE XREF: sub_DB43+85j
		cli
		brclr	<BitFlags2D 2 locret_DBFA
		sei
		brset	<BitFlags6a_t3 $40 loc_DBF9
		ldaa	#$16
		ldab	#$EE
		brclr	<BitFlags6a_t3 $20 loc_DBF0
		cmpa	DRBOffsetStored_HB
		bne	loc_DBF9
		inca
		bset	<BitFlags6a_t3 $40
		bclr	<BitFlags6a_t3 $20
		bclr	<BitFlags2D 2
		bra	loc_DBF3
; ---------------------------------------------------------------------------

loc_DBF0:				; CODE XREF: sub_DB43+98j
		bset	<BitFlags6a_t3 $60

loc_DBF3:				; CODE XREF: sub_DB43+ABj
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB

loc_DBF9:				; CODE XREF: sub_DB43+34j sub_DB43+90j ...
		cli

locret_DBFA:				; CODE XREF: sub_DB43+8Bj
		rts
; End of function sub_DB43


; =============== S U B	R O U T	I N E =======================================


sub_DBFB:				; CODE XREF: __RESET+63BP
		brset	<BitFlags21 4 loc_DC2E
		brclr	<BitFlags21 2 loc_DC2E
		brclr	<IPL1 $40 loc_DC2E
		sei
		ldaa	<BitFlags6a_t3
		bita	#$60
		bne	loc_DC2C
		bset	<BitFlags21 4
		ldx	#$B6E0
		ldaa	0,x
		inca
		beq	loc_DC2C
		cmpa	byte_8AB6
		bcs	loc_DC21
		bset	<IPL1 8

loc_DC21:				; CODE XREF: sub_DBFB+21j
		staa	DRBOffsetStored_LB
		ldaa	#$E0
		staa	DRBOffsetStored_HB
		bset	<BitFlags6a_t3 $40

loc_DC2C:				; CODE XREF: sub_DBFB+11j sub_DBFB+1Cj
		cli
		nop

loc_DC2E:				; CODE XREF: sub_DBFBj	sub_DBFB+4j ...
		sei
		brset	<BitFlags6a_t3 $40 loc_DCAE
		ldx	#$B6E1
		brclr	<BitFlags2D $10	loc_DC6F
		brset	<BitFlags21 1 loc_DC6F
		ldaa	#$E1
		ldab	#$4A
		brclr	<BitFlags6a_t3 $20 loc_DC66
		cmpa	DRBOffsetStored_HB
		beq	loc_DC5F
		inca
		cmpa	DRBOffsetStored_HB
		bne	loc_DC6F
		bset	<BitFlags6a_t3 $40
		bclr	<BitFlags6a_t3 $20
		bset	<BitFlags21 1
		ldaa	#$E0
		clrb
		bra	loc_DC69
; ---------------------------------------------------------------------------

loc_DC5F:				; CODE XREF: sub_DBFB+4Ej
		bset	<BitFlags6a_t3 $40
		inca
		comb
		bra	loc_DC69
; ---------------------------------------------------------------------------

loc_DC66:				; CODE XREF: sub_DBFB+47j
		bset	<BitFlags6a_t3 $60

loc_DC69:				; CODE XREF: sub_DBFB+62j sub_DBFB+69j
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB

loc_DC6F:				; CODE XREF: sub_DBFB+3Bj sub_DBFB+3Fj ...
		ldaa	1,x
		coma
		cmpa	0,x
		bne	loc_DC7F
		cmpa	#$4A
		bne	loc_DC7F
		bset	<BitFlags21 2
		bra	loc_DC82
; ---------------------------------------------------------------------------

loc_DC7F:				; CODE XREF: sub_DBFB+79j sub_DBFB+7Dj
		bclr	<BitFlags21 2

loc_DC82:				; CODE XREF: sub_DBFB+82j
		cli
		brclr	<IPL1 8	locret_DCAF
		sei
		brset	<BitFlags6a_t3 $40 loc_DCAE
		ldaa	#$E1
		ldab	#$EE
		brclr	<BitFlags6a_t3 $20 loc_DCA5
		cmpa	DRBOffsetStored_HB
		bne	loc_DCAE
		inca
		bset	<BitFlags6a_t3 $40
		bclr	<BitFlags6a_t3 $20
		bclr	<IPL1 8
		bra	loc_DCA8
; ---------------------------------------------------------------------------

loc_DCA5:				; CODE XREF: sub_DBFB+95j
		bset	<BitFlags6a_t3 $60

loc_DCA8:				; CODE XREF: sub_DBFB+A8j
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB

loc_DCAE:				; CODE XREF: sub_DBFB+34j sub_DBFB+8Dj ...
		cli

locret_DCAF:				; CODE XREF: sub_DBFB+88j
		rts
; End of function sub_DBFB


; =============== S U B	R O U T	I N E =======================================


sub_DCB0:				; CODE XREF: __RESET+63EP
		brclr	<BitFlags29 8 loc_DCBB
		brclr	<BitFlags2f $40	loc_DCBB
		bset	<Ram_30	$10

loc_DCBB:				; CODE XREF: sub_DCB0j	sub_DCB0+4j
		sei
		brset	<BitFlags6a_t3 $40 loc_DD38
		ldx	#$B6E3
		brclr	<BitFlags2D $10	loc_DCF9
		brset	<BitFlags24 4 loc_DCF9
		ldaa	#$E3
		ldab	#$4A
		brclr	<BitFlags6a_t3 $20 loc_DCF0
		cmpa	DRBOffsetStored_HB
		beq	loc_DCE9
		inca
		cmpa	DRBOffsetStored_HB
		bne	loc_DCF9
		bset	<BitFlags6a_t3 $40
		bclr	<BitFlags6a_t3 $20
		bset	<BitFlags24 4
		bra	loc_DCF9
; ---------------------------------------------------------------------------

loc_DCE9:				; CODE XREF: sub_DCB0+26j
		bset	<BitFlags6a_t3 $40
		inca
		comb
		bra	loc_DCF3
; ---------------------------------------------------------------------------

loc_DCF0:				; CODE XREF: sub_DCB0+1Fj
		bset	<BitFlags6a_t3 $60

loc_DCF3:				; CODE XREF: sub_DCB0+3Ej
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB

loc_DCF9:				; CODE XREF: sub_DCB0+13j sub_DCB0+17j ...
		ldaa	1,x
		coma
		cmpa	0,x
		bne	loc_DD09
		cmpa	#$4A
		bne	loc_DD09
		bset	<BitFlags29 8
		bra	loc_DD0C
; ---------------------------------------------------------------------------

loc_DD09:				; CODE XREF: sub_DCB0+4Ej sub_DCB0+52j
		bclr	<BitFlags29 8

loc_DD0C:				; CODE XREF: sub_DCB0+57j
		cli
		brclr	<Ram_30	$10 locret_DD39
		sei
		brset	<BitFlags6a_t3 $40 loc_DD38
		ldaa	#$E3
		ldab	#$EE
		brclr	<BitFlags6a_t3 $20 loc_DD2F
		cmpa	DRBOffsetStored_HB
		bne	loc_DD38
		inca
		bset	<BitFlags6a_t3 $40
		bclr	<BitFlags6a_t3 $20
		bclr	<Ram_30	$10
		bra	loc_DD32
; ---------------------------------------------------------------------------

loc_DD2F:				; CODE XREF: sub_DCB0+6Aj
		bset	<BitFlags6a_t3 $60

loc_DD32:				; CODE XREF: sub_DCB0+7Dj
		staa	DRBOffsetStored_HB
		stab	DRBOffsetStored_LB

loc_DD38:				; CODE XREF: sub_DCB0+Cj sub_DCB0+62j	...
		cli

locret_DD39:				; CODE XREF: sub_DCB0+5Dj
		rts
; End of function sub_DCB0


; =============== S U B	R O U T	I N E =======================================


sub_DD3A:				; CODE XREF: __RESET+665P
		brset	<BitFlags21 $20	loc_DDAE
		ldaa	<b5d_IPL2
		bita	#$18
		bne	loc_DDAE
		ldaa	<TargetBatteryVolts
		sei

loc_DD47:				; CODE XREF: sub_DD3A+10j
		ldab	ADCTL_A2DControlReg
		bpl	loc_DD47
		suba	ADR2_A2DResults2
		cli
		bcs	loc_DDAE
		cmpa	byte_8A4B
		bcs	loc_DDAE
		ldd	<EngineRpm_HB
		cpd	word_8A4C
		bcs	loc_DDAE
		ldaa	#$F
		brclr	<BitFlags2e 1 loc_DD66
		clra

loc_DD66:				; CODE XREF: sub_DD3A+27j
		anda	<Counter_MainLoop
		bne	locret_DD80
		ldaa	<BatVoltsDiagCounter
		inca
		beq	loc_DD71
		staa	<BatVoltsDiagCounter

loc_DD71:				; CODE XREF: sub_DD3A+33j
		brset	<BitFlags2e 1 loc_DD81
		cmpa	byte_8A4E
		bcs	locret_DD80
		clra
		staa	<BatVoltsDiagCounter
		bset	<BitFlags2e 1

locret_DD80:				; CODE XREF: sub_DD3A+2Ej sub_DD3A+3Ej ...
		rts
; ---------------------------------------------------------------------------

loc_DD81:				; CODE XREF: sub_DD3A:loc_DD71j
		brset	<BitFlags21 $10	loc_DD91
		cmpa	byte_8A4F
		bcs	locret_DD80
		clra
		staa	<BatVoltsDiagCounter
		bset	<BitFlags21 $10
		rts
; ---------------------------------------------------------------------------

loc_DD91:				; CODE XREF: sub_DD3A:loc_DD81j
		cmpa	byte_8A51
		bcs	locret_DD80
		clra
		staa	<BatVoltsDiagCounter
		bclr	<BitFlags21 $10
		ldd	#$58A
		jsr	ThrowNonCriticalError_
		bcc	locret_DD80
		bset	<b5d_IPL2 8
		bclr	<BitFlags2e 1
		bclr	<BitFlags21 $30
		rts
; ---------------------------------------------------------------------------

loc_DDAE:				; CODE XREF: sub_DD3Aj	sub_DD3A+8j ...
		clra
		staa	<BatVoltsDiagCounter
		bclr	<BitFlags2e 1
		bclr	<BitFlags21 $30
		rts
; End of function sub_DD3A


; =============== S U B	R O U T	I N E =======================================


sub_DDB8:				; CODE XREF: sub_CA29P
		ldy	#$6485
		brset	<DRBSerialMode $80 loc_DE29
		brclr	<DRBSerialMode $40 loc_DE29
		ldaa	BAUD_SerialBaudRate
		cmpa	#$25
		bne	locret_DE28
		ldab	SCDR_SerialData
		ldaa	SCSR_SerialStatus
		bita	#$20
		beq	loc_DE2D
		bita	#$E
		bne	loc_DE24
		brset	0,y $E0	loc_DE49
		ldaa	#$F8
		brset	0,y $80	loc_DDFB
		deca
		brset	0,y $60	loc_DDFB
		ldaa	#$F5
		brset	0,y $40	loc_DDFB
		ldaa	#$F3
		brset	0,y $20	loc_DDFB
		ldaa	#$14

loc_DDFB:				; CODE XREF: sub_DDB8+28j sub_DDB8+2Ej ...
		cba
		bne	loc_DE29
		ldaa	LDXi_6485
		adda	#$20
		staa	LDXi_6485
		anda	#$E0
		cmpa	#$A0
		bne	loc_DE24
		ldaa	#$E0
		staa	LDXi_6485
		ldaa	#$52
		staa	<DRBPointer1
		ldd	SCSR_SerialStatus
		ldaa	#$F8
		ldab	SCSR_SerialStatus
		staa	SCDR_SerialData
		bra	loc_DE24
; ---------------------------------------------------------------------------

loc_DE22:				; CODE XREF: sub_DDB8+86j
		staa	<DRBPointer1

loc_DE24:				; CODE XREF: sub_DDB8+1Fj sub_DDB8+52j ...
		ldd	SCSR_SerialStatus
		pulx

locret_DE28:				; CODE XREF: sub_DDB8+11j
		rts
; ---------------------------------------------------------------------------

loc_DE29:				; CODE XREF: sub_DDB8+4j sub_DDB8+8j ...
		clr	LDXi_6485
		rts
; ---------------------------------------------------------------------------

loc_DE2D:				; CODE XREF: sub_DDB8+1Bj
		brset	0,y $E0	loc_DE39
		brclr	0,y $E0	loc_DE29
		bra	loc_DE24
; ---------------------------------------------------------------------------

loc_DE39:				; CODE XREF: sub_DDB8:loc_DE2Dj
		ldaa	<DRBPointer1
		deca
		cmpa	#$20
		bne	loc_DE22
		clra
		staa	<DRBPointer1
		staa	<DRBPointer2
		staa	<DRBSerialMode
		bra	loc_DE24
; ---------------------------------------------------------------------------

loc_DE49:				; CODE XREF: sub_DDB8+21j
		ldaa	#$28
		staa	<DRBPointer1
		brset	0,y 8 loc_DE97
		brset	0,y $10	loc_DE5F
		bset	0,y $10
		stab	<DRBPointer2
		bra	loc_DE24
; ---------------------------------------------------------------------------

loc_DE5F:				; CODE XREF: sub_DDB8+9Aj
		cmpb	<DRBPointer2
		bne	loc_DE88
		bclr	0,y $10
		tba
		ldab	LDXi_6485
		andb	#7
		cmpb	#4
		beq	loc_DE7D
		ldx	#$6481
		abx
		staa	0,x
		inc	LDXi_6485
		jmp	loc_DE24
; ---------------------------------------------------------------------------

loc_DE7D:				; CODE XREF: sub_DDB8+B7j
		cmpa	#$12
		bne	loc_DE85
		bclr	0,y 7

loc_DE85:				; CODE XREF: sub_DDB8+C7j sub_DDB8+F3j
		jmp	loc_DE24
; ---------------------------------------------------------------------------

loc_DE88:				; CODE XREF: sub_DDB8+A9j
		bset	0,y 8
		cmpb	#$12
		bne	loc_DE9B

loc_DE90:				; CODE XREF: sub_DDB8:loc_DEA2j
		bset	0,y $10
		jmp	loc_DE24
; ---------------------------------------------------------------------------

loc_DE97:				; CODE XREF: sub_DDB8+95j
		cmpb	#$12
		beq	loc_DEA2

loc_DE9B:				; CODE XREF: sub_DDB8+D6j
		bclr	0,y $10
		jmp	loc_DE24
; ---------------------------------------------------------------------------

loc_DEA2:				; CODE XREF: sub_DDB8+E1j
		brclr	0,y $10	loc_DE90
		bclr	0,y $1F
		bra	loc_DE85
; End of function sub_DDB8


; =============== S U B	R O U T	I N E =======================================


sub_DEAD:				; CODE XREF: sub_CA29+3P

; FUNCTION CHUNK AT DF46 SIZE 00000092 BYTES
; FUNCTION CHUNK AT DFF5 SIZE 0000000A BYTES
; FUNCTION CHUNK AT E019 SIZE 00000051 BYTES

		brset	<DRBSerialMode $40 loc_DEB5
		rts
; ---------------------------------------------------------------------------

loc_DEB2:				; CODE XREF: sub_DEAD:loc_DEB5j
		jmp	loc_E065
; ---------------------------------------------------------------------------

loc_DEB5:				; CODE XREF: sub_DEADj
		brset	<DRBSerialMode $70 loc_DEB2
		ldab	SCDR_SerialData
		ldaa	SCSR_SerialStatus
		bita	#$20
		bne	loc_DEC4
		rts
; ---------------------------------------------------------------------------

loc_DEC4:				; CODE XREF: sub_DEAD+14j
		ldx	#$6486
		ldaa	0,x
		bita	#3
		beq	loc_DED0
		jmp	loc_DF32
; ---------------------------------------------------------------------------

loc_DED0:				; CODE XREF: sub_DEAD+1Ej
		cmpb	#$F8
		bcc	loc_DEDB

loc_DED4:				; CODE XREF: sub_DEAD+33j sub_DEAD+40j ...
		jsr	sub_E093
		jsr	sub_E06A
		rts
; ---------------------------------------------------------------------------

loc_DEDB:				; CODE XREF: sub_DEAD+25j
		tsta
		bne	loc_DEE7
		cmpb	#$F8
		bne	loc_DED4
		ldaa	#$80
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DEE7:				; CODE XREF: sub_DEAD+2Fj
		cmpa	#$80
		bne	loc_DEF4
		cmpb	#$F9
		bne	loc_DED4
		ldaa	#$C0
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DEF4:				; CODE XREF: sub_DEAD+3Cj
		cmpa	#$C0
		bne	loc_DF01
		cmpb	#$FB
		bne	loc_DED4
		ldaa	#$E0
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DF01:				; CODE XREF: sub_DEAD+49j
		cmpa	#$E0
		bne	loc_DED4
		cmpb	#$F8
		bne	loc_DF0E
		ldaa	#2
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DF0E:				; CODE XREF: sub_DEAD+5Aj
		cmpb	#$F9
		bne	loc_DF17
		ldaa	#1
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DF17:				; CODE XREF: sub_DEAD+63j
		cmpb	#$FB
		bne	loc_DED4
		ldy	<EngineRpm_HB
		cpy	#$100
		bhi	loc_DF29
		ldaa	#5
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DF29:				; CODE XREF: sub_DEAD+75j
		ldd	#$17
		jsr	sub_E06A
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DF32:				; CODE XREF: sub_DEAD+20J
		bita	#1
		beq	loc_DF39
		jmp	loc_DF46
; ---------------------------------------------------------------------------

loc_DF39:				; CODE XREF: sub_DEAD+87j
		jmp	loc_DFF5
; End of function sub_DEAD


; =============== S U B	R O U T	I N E =======================================


sub_DF3C:				; CODE XREF: sub_DEAD:loc_E065P
		ldaa	SCSR_SerialStatus
		ldaa	SCDR_SerialData
		stab	SCDR_SerialData
		rts
; End of function sub_DF3C

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_DEAD

loc_DF46:				; CODE XREF: sub_DEAD+89J
		asla
		bcs	loc_DF9D
		asla
		bcs	loc_DF6E
		asla
		bcs	loc_DF63
		asla
		bcs	loc_DF59
		stab	STe_648A
		ldaa	#$10
		bra	loc_DF98
; ---------------------------------------------------------------------------

loc_DF59:				; CODE XREF: sub_DEAD+A3j
		stab	FDRVar3
		jsr	sub_E070
		ldaa	#$20
		bra	loc_DF98
; ---------------------------------------------------------------------------

loc_DF63:				; CODE XREF: sub_DEAD+A0j
		ldy	FDRVar3
		ldab	0,y
		ldaa	#$40
		bra	loc_DF98
; ---------------------------------------------------------------------------

loc_DF6E:				; CODE XREF: sub_DEAD+9Dj
		cmpb	#$FE
		beq	loc_DF7F

loc_DF72:				; CODE XREF: sub_DEAD+17AJ
		jsr	sub_E06A
		cmpb	#$1B
		bne	loc_DF7C
		bset	<DRBSerialMode $40

loc_DF7C:				; CODE XREF: sub_DEAD+CAj
		jmp	loc_E065
; ---------------------------------------------------------------------------

loc_DF7F:				; CODE XREF: sub_DEAD+C3j
		ldaa	0,x
		bita	#4
		beq	loc_DF96
		ldy	<EngineRpm_HB
		cpy	#$100
		bcs	loc_DF96
		ldab	#$17
		jsr	sub_E06A
		jmp	loc_E065
; ---------------------------------------------------------------------------

loc_DF96:				; CODE XREF: sub_DEAD+D6j sub_DEAD+DFj
		ldaa	#$80

loc_DF98:				; CODE XREF: sub_DEAD+AAj sub_DEAD+B4j ...
		oraa	0,x
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_DF9D:				; CODE XREF: sub_DEAD+9Aj
		sei
		ldy	FDRVar3
		cpy	#$9400
		bcc	loc_DFB5
		stab	0,y

loc_DFAB:				; CODE XREF: sub_DEAD+129j
		ldab	0,y
		jsr	sub_E06A
		cli
		jmp	loc_E065
; ---------------------------------------------------------------------------

loc_DFB5:				; CODE XREF: sub_DEAD+F9j
		ldx	#$64D0
		ldy	#$DFD8

loc_DFBC:				; CODE XREF: sub_DEAD+11Bj
		ldaa	0,y
		staa	0,x
		inx
		iny
		cpy	#$DFF5
		bne	loc_DFBC
		ldx	#$64D0
		ldy	FDRVar3
		jsr	0,x
		ldx	#FDRVar0
		bra	loc_DFAB
; END OF FUNCTION CHUNK	FOR sub_DEAD
; ---------------------------------------------------------------------------
		ldaa	#$AA
		staa	loc_D553+2
		lsra
		staa	M99_AAAA
		ldaa	#$A0
		staa	loc_D553+2
		stab	0,y
		ldx	#Ram_00

loc_DFEC:				; CODE XREF: RESERVED:DFF2j
		cmpb	0,y
		beq	locret_DFF4
		dex
		bne	loc_DFEC

locret_DFF4:				; CODE XREF: RESERVED:DFEFj
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_DEAD

loc_DFF5:				; CODE XREF: sub_DEAD:loc_DF39J
		asla
		bcs	loc_E031
		asla
		bcs	loc_E023
		asla
		bcs	loc_E019
		asla
; END OF FUNCTION CHUNK	FOR sub_DEAD
; ---------------------------------------------------------------------------
		fcb $25
; end of 'RESERVED'

; ---------------------------------------------------------------------------
; ===========================================================================

; Segment type:	Pure data
		; segment ROM
		org $E000
		cba
		asla
		bcs	loc_E00B
		stab	FDRVar2
		ldaa	#8
		bra	loc_E02C
; ---------------------------------------------------------------------------

loc_E00B:				; CODE XREF: ROM:E002j
		stab	FDRVar1
		ldaa	#$10
		bra	loc_E02C
; ---------------------------------------------------------------------------
		stab	STe_648A
		ldaa	#$20
		bra	loc_E02C
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_DEAD

loc_E019:				; CODE XREF: sub_DEAD+14Fj
		stab	FDRVar3
		jsr	sub_E070
		ldaa	#$C0
		bra	loc_E02C
; ---------------------------------------------------------------------------

loc_E023:				; CODE XREF: sub_DEAD+14Cj
		cmpb	#$FD
		beq	loc_E02A
		jmp	loc_DF72
; ---------------------------------------------------------------------------

loc_E02A:				; CODE XREF: sub_DEAD+178j
		ldaa	#$80

loc_E02C:				; CODE XREF: ROM:E009j	ROM:E010j ...
		oraa	0,x
		jmp	loc_E063
; ---------------------------------------------------------------------------

loc_E031:				; CODE XREF: sub_DEAD+149j
		ldx	FDRVar3
		ldy	FDRVar1
		ldab	SCDR_SerialData
		ldaa	0,x
		staa	SCDR_SerialData
		inx
		dey
		bne	loc_E04D
		ldx	#$6486
		jsr	sub_E06A
		pulx
		rts
; ---------------------------------------------------------------------------

loc_E04D:				; CODE XREF: sub_DEAD+196j
		stx	FDRVar3
		sty	FDRVar1
		cba
		bne	loc_E059
		pulx
		rts
; ---------------------------------------------------------------------------

loc_E059:				; CODE XREF: sub_DEAD+1A8j
		ldaa	FDRVar0
		anda	#$7F
		staa	FDRVar0
		pulx
		rts
; ---------------------------------------------------------------------------

loc_E063:				; CODE XREF: sub_DEAD+37J sub_DEAD+44J ...
		staa	0,x

loc_E065:				; CODE XREF: sub_DEAD:loc_DEB2J
					; sub_DEAD:loc_DF7CJ ...
		jsr	sub_DF3C
		pulx
		rts
; END OF FUNCTION CHUNK	FOR sub_DEAD

; =============== S U B	R O U T	I N E =======================================


sub_E06A:				; CODE XREF: sub_DEAD+2AP sub_DEAD+7FP ...
		clr	0,x
		bclr	<DRBSerialMode $40
		rts
; End of function sub_E06A


; =============== S U B	R O U T	I N E =======================================


sub_E070:				; CODE XREF: sub_DEAD+AFP
					; sub_DEAD+16FP
		pshx
		ldx	FDRVar3
		cpx	#$8000
		bcs	loc_E088
		cpx	#$FFFF
		bhi	loc_E088
		cpx	#$B600
		bcs	loc_E091
		cpx	#$B800
		bcc	loc_E091

loc_E088:				; CODE XREF: sub_E070+7j sub_E070+Cj
		pulx
		ldx	#$6486
		jsr	sub_E06A
		pulx
		rts
; ---------------------------------------------------------------------------

loc_E091:				; CODE XREF: sub_E070+11j sub_E070+16j
		pulx
		rts
; End of function sub_E070


; =============== S U B	R O U T	I N E =======================================


sub_E093:				; CODE XREF: sub_DEAD:loc_DED4P
		cmpb	#$14
		beq	loc_E098
		rts
; ---------------------------------------------------------------------------

loc_E098:				; CODE XREF: sub_E093+2j
		clr	FDRVar0
		ldab	#$25
		stab	BAUD_SerialBaudRate
		ldab	LDXi_6485
		addb	#$20
		stab	LDXi_6485
		bset	<DRBSerialMode $30
		ldd	SCSR_SerialStatus
		pulx
		rts
; End of function sub_E093


; =============== S U B	R O U T	I N E =======================================


sub_E0B0:				; CODE XREF: sub_E191+5AP
		ldab	#$93
		ldaa	Temp0
		bne	loc_E0B9
		ldab	#$80

loc_E0B9:				; CODE XREF: sub_E0B0+5j
		aba
		adda	Temp1
		adda	Temp2
		staa	Temp3
		tba
		ldab	#$40
		ldy	#$1000
		ldx	#$6400
		sei
		bset	0,x 8
		bclr	8,y $20
		cmpb	SPSR_SerialPeripheralStatus
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	Temp0

loc_E0EB:				; CODE XREF: sub_E0B0+40j
		brclr	0,x 8 loc_E0F5
		decb
		bne	loc_E0EB
		jmp	loc_E18E
; ---------------------------------------------------------------------------

loc_E0F5:				; CODE XREF: sub_E0B0:loc_E0EBj
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		staa	Temp0
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	Temp1

loc_E10B:				; CODE XREF: sub_E0B0+60j
		brclr	0,x 8 loc_E115
		decb
		bne	loc_E10B
		jmp	loc_E18E
; ---------------------------------------------------------------------------

loc_E115:				; CODE XREF: sub_E0B0:loc_E10Bj
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		staa	Temp1
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	Temp2

loc_E12B:				; CODE XREF: sub_E0B0+80j
		brclr	0,x 8 loc_E135
		decb
		bne	loc_E12B
		jmp	loc_E18E
; ---------------------------------------------------------------------------

loc_E135:				; CODE XREF: sub_E0B0:loc_E12Bj
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop
		ldaa	SPDR_SerialPeripheralDataIO
		staa	Temp2
		cmpa	SPSR_SerialPeripheralStatus
		ldaa	Temp3

loc_E14B:				; CODE XREF: sub_E0B0+A0j
		brclr	0,x 8 loc_E154
		decb
		bne	loc_E14B
		bra	loc_E18E
; ---------------------------------------------------------------------------

loc_E154:				; CODE XREF: sub_E0B0:loc_E14Bj
		staa	SPDR_SerialPeripheralDataIO
		bset	2,x 8
		bclr	2,x 8
		nop

loc_E15E:				; CODE XREF: sub_E0B0+B4j
		brset	$29,y $80 loc_E168
		decb
		bne	loc_E15E
		bra	loc_E18E
; ---------------------------------------------------------------------------

loc_E168:				; CODE XREF: sub_E0B0:loc_E15Ej
		ldaa	SPDR_SerialPeripheralDataIO
		bset	8,y $20
		cli
		suba	Temp0
		suba	Temp1
		suba	Temp2
		bne	locret_E190
		ldaa	Temp0
		anda	#$F
		cmpa	#1
		bne	locret_E190
		bset	<CCDFlags5 $40
		brset	<CCDFlags6 $80 locret_E190
		bset	<CCDFlags4_tsbec $10

loc_E18E:				; CODE XREF: sub_E0B0+42J sub_E0B0+62J ...
		nop
		cli

locret_E190:				; CODE XREF: sub_E0B0+C9j sub_E0B0+D2j ...
		rts
; End of function sub_E0B0


; =============== S U B	R O U T	I N E =======================================


sub_E191:				; CODE XREF: __RESET+5FBP
		ldab	<Counter_MainLoop
		andb	#$F
		bne	loc_E1D4
		brset	<CCDFlags4_tsbec 8 loc_E1BB
		ldaa	<KeyOnOrEngineRunningTime
		cmpa	#$83
		bcs	loc_E1D1
		ldaa	<EngineRpm_HB
		cmpa	#$2F
		bcs	loc_E1D1
		ldaa	<BatteryVolts
		cmpa	#$BD
		bcc	loc_E1D1
		ldab	<CCDFlags4_BodyCompFlags4_X
		incb
		stab	<CCDFlags4_BodyCompFlags4_X
		cmpb	#$71
		bcs	loc_E1D4
		bset	<CCDFlags4_tsbec 8
		bra	loc_E1D1
; ---------------------------------------------------------------------------

loc_E1BB:				; CODE XREF: sub_E191+6j
		ldaa	<TargetBatteryVolts
		suba	<BatteryVolts
		bcs	loc_E1C5
		cmpa	#1
		bhi	loc_E1D1

loc_E1C5:				; CODE XREF: sub_E191+2Ej
		ldab	<CCDFlags4_BodyCompFlags4_X
		incb
		stab	<CCDFlags4_BodyCompFlags4_X
		cmpb	#$22
		bcs	loc_E1D4
		bclr	<CCDFlags4_tsbec 8

loc_E1D1:				; CODE XREF: sub_E191+Ej sub_E191+14j	...
		clra
		staa	<CCDFlags4_BodyCompFlags4_X

loc_E1D4:				; CODE XREF: sub_E191+4j sub_E191+23j	...
		brset	<Counter_MainLoop 1 loc_E1EE
		ldx	#$E418
		ldab	<CCDTemp_HB
		lsld
		addb	#2
		abx
		lsrd
		stab	<CCDTemp_HB
		ldx	0,x
		jsr	0,x
		std	Temp1
		jsr	sub_E0B0

loc_E1EE:				; CODE XREF: sub_E191:loc_E1D4j
		ldaa	CountdownTimerFromKeyOn
		bne	locret_E1FB
		ldaa	byte_8014
		beq	loc_E1FC
		bclr	<CCDFlags5 $20

locret_E1FB:				; CODE XREF: sub_E191+60j
		rts
; ---------------------------------------------------------------------------

loc_E1FC:				; CODE XREF: sub_E191+65j
		ldaa	PPROG_EEPROMControlReg
		bita	#2
		bne	loc_E210
		bclr	<CCDFlags4_tsbec $20
		ldaa	byte_B612
		bita	#1
		beq	loc_E210
		bset	<CCDFlags4_tsbec $20

loc_E210:				; CODE XREF: sub_E191+70j sub_E191+7Aj
		ldaa	<Counter_MainLoop
		bita	#3
		bne	loc_E275
		brclr	<CCDFlags5 $40 loc_E238
		bset	<CCDFlags5 $80
		bclr	<CCDFlags5 $60
		bclr	<CCDFlags6 $7F
		brset	<CCDFlags6 $80 loc_E275
		ldaa	<BitFlags6a_t3
		bita	#$60
		bne	loc_E275
		ldaa	byte_B612
		bita	#2
		beq	loc_E275
		anda	#$FD
		bra	loc_E261
; ---------------------------------------------------------------------------

loc_E238:				; CODE XREF: sub_E191+85j
		ldaa	<CCDFlags6
		anda	#$7F
		brclr	<CCDFlags5 $80 loc_E246
		cmpa	#$71
		bcc	loc_E24F
		bra	loc_E24A
; ---------------------------------------------------------------------------

loc_E246:				; CODE XREF: sub_E191+ABj
		cmpa	#$2D
		bcc	loc_E275

loc_E24A:				; CODE XREF: sub_E191+B3j
		inc	CCDFlags6
		bra	loc_E275
; ---------------------------------------------------------------------------

loc_E24F:				; CODE XREF: sub_E191+B1j
		ldaa	<BitFlags6a_t3
		bita	#$60
		bne	loc_E275
		ldaa	byte_B612
		bita	#2
		bne	loc_E275
		bset	<CCDFlags6 $80
		oraa	#2

loc_E261:				; CODE XREF: sub_E191+A5j
		sei
		brclr	<BitFlags6a_t3 $40 loc_E269
		cli
		bra	loc_E275
; ---------------------------------------------------------------------------

loc_E269:				; CODE XREF: sub_E191+D1j
		bset	<BitFlags6a_t3 $40
		cli
		staa	DRBOffsetStored_LB
		ldaa	#$12
		staa	DRBOffsetStored_HB

loc_E275:				; CODE XREF: sub_E191+83j sub_E191+92j ...
		brclr	<CCDFlags5 $10 loc_E289
		brset	<CCDFlags5 $80 locret_E288
		ldaa	<CCDFlags6
		anda	#$7F
		cmpa	#$2D
		bcs	locret_E288
		bset	<CCDFlags5 $20

locret_E288:				; CODE XREF: sub_E191+E8j sub_E191+F2j
		rts
; ---------------------------------------------------------------------------

loc_E289:				; CODE XREF: sub_E191:loc_E275j
		brset	<CCDFlags5 $10 locret_E2D9
		brclr	<IPL1 $40 locret_E2D9
		ldaa	<BitFlags6a_t3
		bita	#$60
		bne	locret_E2D9
		ldaa	byte_B612
		bita	#1
		bne	loc_E2A4
		bita	#2
		bne	loc_E2D3
		bra	loc_E2D6
; ---------------------------------------------------------------------------

loc_E2A4:				; CODE XREF: sub_E191+10Bj
		brset	<CCDFlags5 $80 loc_E2B2
		ldaa	<CCDFlags6
		anda	#$7F
		cmpa	#$2D
		bcs	locret_E2D9
		bra	loc_E2D0
; ---------------------------------------------------------------------------

loc_E2B2:				; CODE XREF: sub_E191:loc_E2A4j
		sei
		brclr	<BitFlags6a_t3 $40 loc_E2BA
		cli
		bra	locret_E2D9
; ---------------------------------------------------------------------------

loc_E2BA:				; CODE XREF: sub_E191+122j
		bset	<BitFlags6a_t3 $40
		cli
		adda	#4
		cmpa	#$4C
		bcs	loc_E2C6
		anda	#$FE

loc_E2C6:				; CODE XREF: sub_E191+131j
		anda	#$FD
		staa	DRBOffsetStored_LB
		ldaa	#$12
		staa	DRBOffsetStored_HB

loc_E2D0:				; CODE XREF: sub_E191+11Fj
		bset	<CCDFlags4_tsbec $20

loc_E2D3:				; CODE XREF: sub_E191+10Fj
		bset	<CCDFlags5 $80

loc_E2D6:				; CODE XREF: sub_E191+111j
		bset	<CCDFlags5 $10

locret_E2D9:				; CODE XREF: sub_E191:loc_E289j
					; sub_E191+FCj	...
		rts
; End of function sub_E191

; ---------------------------------------------------------------------------

CCD_CCDBusOutputStatus:			; CODE XREF: ROM:E341J	ROM:loc_E3ADJ
					; DATA XREF: ...
		clra
		clrb
		staa	Temp0
		rts
; ---------------------------------------------------------------------------

CCD_EngineRPM:				; DATA XREF: ROM:E418o	ROM:E420o ...
		ldaa	#$E4
		staa	Temp0
		ldaa	<EngineRpm_HB
		ldab	<MapValue
		rts
; ---------------------------------------------------------------------------

CCD_FuelOutput:				; DATA XREF: ROM:E41Ao	ROM:E43Ao ...
		ldaa	#$84
		staa	Temp0
		sei
		ldaa	<CCDFuelOutput_HB
		ldab	<Counter_SpeedSensorInterrupt_HB_X
		clr	CCDFuelOutput_HB
		clr	Counter_SpeedSensorInterrupt_HB_X
		cli
		rts
; ---------------------------------------------------------------------------

CCD_SpeedSensorCounter:			; DATA XREF: ROM:E41Co	ROM:E43Co ...
		ldaa	#$44
		staa	Temp0
		sei
		ldaa	<Counter_InjectorCalc
		clrb
		clr	Counter_InjectorCalc
		cli
		rts
; ---------------------------------------------------------------------------

CCD_ConfigConst1:			; DATA XREF: ROM:E502o
		ldaa	#$AC
		staa	Temp0
		ldd	word_8012
		rts
; ---------------------------------------------------------------------------

CCD_CoolantTemp:			; DATA XREF: ROM:E462o	ROM:E4E2o
		ldaa	#$8C
		staa	Temp0
		ldaa	<CoolantTemp
		ldab	<AmbientAirTempVolts2
		rts
; ---------------------------------------------------------------------------

CCD_BatVoltsEtc:			; DATA XREF: ROM:E422o	ROM:E4A2o
		ldaa	#$D4
		staa	Temp0
		ldaa	<BatteryVolts
		ldab	<TargetBatteryVolts
		rts
; ---------------------------------------------------------------------------

CCD_ThrottlePos:			; DATA XREF: ROM:E432o	ROM:E452o ...
		ldaa	#$42
		staa	Temp0
		ldaa	<TpsVolts
		suba	<LowestSessionTpsVolts
		bcc	loc_E333
		clra

loc_E333:				; CODE XREF: ROM:E330j
		clrb
		rts
; ---------------------------------------------------------------------------

CCD_TargetIdleSPeed:			; DATA XREF: ROM:E482o
		ldaa	#$CC
		staa	Temp0
		ldaa	PPROG_EEPROMControlReg
		bita	#2
		beq	loc_E344
		jmp	CCD_CCDBusOutputStatus
; ---------------------------------------------------------------------------

loc_E344:				; CODE XREF: ROM:E33Fj
		ldd	word_B600
		lsld
		lsld
		staa	Temp3
		ldd	<TargetIdleSpeedHB
		lsld
		lsld
		tab
		ldaa	Temp3
		rts
; ---------------------------------------------------------------------------

CCD_Baro:				; DATA XREF: ROM:E442o
		ldaa	#$54
		staa	Temp0
		ldaa	<BaroPressure
		clrb
		rts
; ---------------------------------------------------------------------------

CCD_VehicleSpeed:			; DATA XREF: ROM:E42Ao	ROM:E44Ao ...
		ldaa	#$24
		staa	Temp0
		ldd	<VehicleSpeed_HB
		lsld
		lsld
		staa	Temp3
		lsld
		bcc	loc_E36F
		ldaa	#$FF

loc_E36F:				; CODE XREF: ROM:E36Bj
		ldab	#$34
		mul
		lsld
		lsld
		aslb
		adca	#0
		tab
		ldaa	Temp3
		rts
; ---------------------------------------------------------------------------

CCD_AlarmStatus:			; DATA XREF: ROM:E4C2o
		ldaa	PPROG_EEPROMControlReg
		bita	#2
		bne	loc_E3AD
		ldx	#$B672
		ldab	<CCDFlags4_tsbec
		tba
		incb
		andb	#7
		anda	#$F8
		cmpb	#6
		bne	loc_E393
		clrb

loc_E393:				; CODE XREF: ROM:E390j
		aba
		staa	<CCDFlags4_tsbec
		aslb
		aslb
		abx
		brset	0,x $FF	loc_E3AD
		ldaa	0,x
		staa	Temp0
		adda	1,x
		adda	2,x
		cmpa	3,x
		bne	loc_E3AD
		ldd	1,x
		rts
; ---------------------------------------------------------------------------

loc_E3AD:				; CODE XREF: ROM:E381j	ROM:E399j ...
		jmp	CCD_CCDBusOutputStatus
; ---------------------------------------------------------------------------

CCD_ToggleBCFlags:			; DATA XREF: ROM:E49Eo
		ldaa	#$EC
		staa	Temp0
		clra
		brclr	<b5C_IPL1_t3 2 loc_E3BC
		oraa	#1

loc_E3BC:				; CODE XREF: ROM:E3B6j
		brclr	<b5C_IPL1_t3 $40 loc_E3C2
		oraa	#2

loc_E3C2:				; CODE XREF: ROM:loc_E3BCj
		brclr	<CCDFlags4_tsbec 8 loc_E3C8
		oraa	#4

loc_E3C8:				; CODE XREF: ROM:loc_E3C2j
		brclr	<b5C_IPL1_t3 $20 loc_E3CE
		oraa	#8

loc_E3CE:				; CODE XREF: ROM:loc_E3C8j
		clrb
		brclr	<CCDFlags4_tsbec $10 loc_E3D8
		bclr	<CCDFlags4_tsbec $10
		orab	#1

loc_E3D8:				; CODE XREF: ROM:E3CFj
		brclr	<CCDFlags4_tsbec $20 locret_E3DE
		orab	#2

locret_E3DE:				; CODE XREF: ROM:loc_E3D8j
		rts
; ---------------------------------------------------------------------------

CCD_SwitchState:			; DATA XREF: ROM:E42Co	ROM:E44Co ...
		ldaa	#$A4
		staa	Temp0
		clra
		brset	<CruiseStatus_1	$80 loc_E3EB
		oraa	#1

loc_E3EB:				; CODE XREF: ROM:E3E5j
		ldab	<TpsVolts
		subb	<LowestSessionTpsVolts
		bcs	loc_E3F7
		cmpb	#5
		bcs	loc_E3F7
		oraa	#2

loc_E3F7:				; CODE XREF: ROM:E3EFj	ROM:E3F3j
		brclr	<StartupSwitchMirror1 $20 loc_E3FD
		oraa	#4

loc_E3FD:				; CODE XREF: ROM:loc_E3F7j
		brclr	<PIA2_Buffer_t3	1 loc_E403
		oraa	#8

loc_E403:				; CODE XREF: ROM:loc_E3FDj
		brset	<PIA1_Buffer_t3	$40 loc_E409
		oraa	#$20

loc_E409:				; CODE XREF: ROM:loc_E403j
		ldab	<StartupSwitchMirror1
		lsrb
		andb	#7
		psha
		ldaa	byte_8011
		beq	loc_E416
		eorb	#1

loc_E416:				; CODE XREF: ROM:E412j
		pula
		rts
; ---------------------------------------------------------------------------
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
gb_AISTEP_BitPatternForAisControl:fcb	6 ; DATA XREF: __RESET+42Ao
		fcb   5
		fcb   9
		fcb  $A
TL_TempForColdScaleFromA2D:fcb	 7	; DATA XREF: __RESET+38Do __RESET+3BDo
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
TL_TempForHotScaleA2D:fcb   4		; DATA XREF: __RESET+386o __RESET+3B6o
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
TL_ScaleCoolantTemp:fcb	  9		; DATA XREF: __RESET+3AAo
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
TL_ScaleChargeTemp:fcb	 9		; DATA XREF: __RESET+3DAo
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
TL_TempForScaleAmbientA2D:fcb	6	; DATA XREF: __RESET+19Bo
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

; =============== S U B	R O U T	I N E =======================================


ScaleYbyA:				; CODE XREF: sub_AEFA+BP sub_AEFA+1AP	...
		psha
		pshy
		pulb
		mul
		xgdy
		pulb
		pula
		mul
		adca	#0
		tab
		aby
		pshy
		puly
		rts
; End of function ScaleYbyA


; =============== S U B	R O U T	I N E =======================================


ScaleXbyB_somethingelse:		; CODE XREF: sub_C75D+D2P IC1I+631P
		psha
		tba
		ldy	0,x
		bsr	ScaleYbyA
		sty	Temp6
		pula
		psha
		ldab	1,x
		mul
		addd	Temp6
		bcs	loc_E647
		std	Temp6
		ldab	0,x
		pula
		mul
		tsta
		bne	loc_E648
		addb	Temp6
		bcc	loc_E64D
		bra	loc_E648
; ---------------------------------------------------------------------------

loc_E647:				; CODE XREF: ScaleXbyB_somethingelse+13j
		pula

loc_E648:				; CODE XREF: ScaleXbyB_somethingelse+1Dj
					; ScaleXbyB_somethingelse+24j
		ldab	#$FF
		stab	Temp7

loc_E64D:				; CODE XREF: ScaleXbyB_somethingelse+22j
		tba
		ldab	Temp7
		std	Temp6
		rts
; End of function ScaleXbyB_somethingelse


; =============== S U B	R O U T	I N E =======================================


Lookup4ByteTable:			; CODE XREF: __RESET+19EP
					; __RESET:FilterAndStoreCoolantTempP ...
		ldy	#0
		ldab	0,x
		aby
		inx
		ldab	#4
		cmpa	0,x
		bhi	loc_E669

loc_E664:				; CODE XREF: Lookup4ByteTable+16j
		ldaa	1,x
		tab
		bra	loc_E68A
; ---------------------------------------------------------------------------

loc_E669:				; CODE XREF: Lookup4ByteTable+Dj
					; Lookup4ByteTable+1Dj
		dey
		beq	loc_E664
		cmpa	4,x
		bcs	loc_E674
		abx
		bra	loc_E669
; ---------------------------------------------------------------------------

loc_E674:				; CODE XREF: Lookup4ByteTable+1Aj
		suba	0,x
		psha
		ldab	2,x
		mul
		xgdy
		pula
		ldab	3,x
		mul
		adca	#0
		tab
		aby
		xgdy
		addb	1,x
		tba

loc_E68A:				; CODE XREF: Lookup4ByteTable+12j
		psha
		pula
		rts
; End of function Lookup4ByteTable


; =============== S U B	R O U T	I N E =======================================


sub_E68D:				; CODE XREF: sub_A18C+B2P
					; sub_A327:loc_A44AP ...
		psha
		clrb
		rola
		rolb
		rola
		rolb
		rola
		rolb
		abx
		ldab	0,x
		subb	1,x
		bcs	loc_E6A0
		mul
		nega
		bra	loc_E6A2
; ---------------------------------------------------------------------------

loc_E6A0:				; CODE XREF: sub_E68D+Dj
		negb
		mul

loc_E6A2:				; CODE XREF: sub_E68D+11j
		adda	0,x
		tab
		pshb
		pulb
		pula
		rts
; End of function sub_E68D

; ---------------------------------------------------------------------------
		rts

; =============== S U B	R O U T	I N E =======================================


sub_E6AA:				; CODE XREF: sub_BBAA+1P
					; IC1I:loc_F4BAP
		ldy	#$36
		ldd	word_8072
		ldx	byte_8074
		brclr	<TimerOverflowsBetweenCamPulses	$FF sub_E6C0
		dey
		ldd	word_8076
		ldx	byte_8078
; End of function sub_E6AA


; =============== S U B	R O U T	I N E =======================================


sub_E6C0:				; CODE XREF: sub_A802+3BEP sub_E6AA+Aj
		pshx
		ldx	0,y
		fdiv
		stx	Temp6
		pula
		pulb
		ldx	0,y
		idiv
		xgdx
		addd	Temp6
		bcc	loc_E6D7
		ldd	#$FFFF

loc_E6D7:				; CODE XREF: sub_E6C0+12j
		std	Temp6
		rts
; End of function sub_E6C0


; =============== S U B	R O U T	I N E =======================================


ConvertMAPVoltsToValue:			; CODE XREF: __RESET+23EP
					; sub_C75D:loc_C795P ...
		ldab	byte_8021
		beq	loc_E6E1
		mul

loc_E6E1:				; CODE XREF: ConvertMAPVoltsToValue+3j
		addd	word_8022
		bcc	locret_E6E8
		ldaa	#$FF

locret_E6E8:				; CODE XREF: ConvertMAPVoltsToValue+9j
		rts
; End of function ConvertMAPVoltsToValue


; =============== S U B	R O U T	I N E =======================================


sub_E6E9:				; CODE XREF: sub_C726+CP sub_C726+16P	...
		psha
		tba
		ldy	0,x
		jsr	ScaleYbyA
		pula
		tsta
		xgdy
		beq	loc_E6FE
		addd	0,x
		bcc	loc_E6FE
		ldd	#$FFFF

loc_E6FE:				; CODE XREF: sub_E6E9+Cj sub_E6E9+10j
		psha
		pshb
		pulb
		pula
		rts
; End of function sub_E6E9


; =============== S U B	R O U T	I N E =======================================


DetermineNumberOfOverflowsBetweenSensorPulses_MM: ; CODE XREF: __RESET+4C5P
					; __RESET+51EP	...
		subd	4,x
		staa	0,y
		ldaa	0,x
		lsrd
		eorb	0,y
		bpl	loc_E717
		ldaa	0,x
		inca
		beq	loc_E717
		staa	0,x

loc_E717:				; CODE XREF: DetermineNumberOfOverflowsBetweenSensorPulses_MM+Bj
					; DetermineNumberOfOverflowsBetweenSensorPulses_MM+10j
		ldaa	0,x
		lsra
		cmpa	1,x
		bcs	locret_E720
		staa	1,x

locret_E720:				; CODE XREF: DetermineNumberOfOverflowsBetweenSensorPulses_MM+19j
		rts
; End of function DetermineNumberOfOverflowsBetweenSensorPulses_MM


; =============== S U B	R O U T	I N E =======================================


sub_E721:				; CODE XREF: __RESET+5B9P IC1I+58CP
		ldx	#$8053
		ldd	<EngineRpm_HB
		aslb
		adca	#0
		jsr	Lookup4ByteTable
		staa	<EngineRPM_3D
		rts
; End of function sub_E721


; =============== S U B	R O U T	I N E =======================================


sub_E72F:				; CODE XREF: sub_BD34+21P sub_BD34+36P ...
		ldy	#$E7A4
		brclr	2,x $FF	loc_E73B
		ldy	#$E7A0

loc_E73B:				; CODE XREF: sub_E72F+4j
		pshy
		psha
		psha
		ldaa	1,x
		deca
		mul
		psha
		pshb
		tsy
		ldaa	2,y
		ldab	0,x
		decb
		mul
		stab	3,y
		ldab	1,x
		stab	2,y
		mul
		inx
		inx
		inx
		abx
		tsta
		beq	loc_E762
		inx
		ldab	#$FF
		abx

loc_E762:				; CODE XREF: sub_E72F+2Dj
		ldab	1,y
		abx
		ldab	0,y
		pshy
		ldy	4,y
		ldaa	0,x
		suba	1,x
		jsr	0,y
		puly
		staa	1,y
		ldab	2,y
		abx
		pulb
		pshy
		ldy	4,y
		ldaa	0,x
		suba	1,x
		jsr	0,y
		puly
		tsx
		staa	1,x
		ldab	2,x
		ldy	3,x
		ldaa	0,x
		suba	1,x
		jsr	0,y
		pulb
		pulx
		pulx
		rts
; End of function sub_E72F

; ---------------------------------------------------------------------------
		blt	loc_E7AC
		bra	loc_E7A6
; ---------------------------------------------------------------------------
		bcs	loc_E7AC

loc_E7A6:				; CODE XREF: ROM:E7A2j
		mul
		adca	#0
		nega
		bra	loc_E7B0
; ---------------------------------------------------------------------------

loc_E7AC:				; CODE XREF: ROM:E7A0j	ROM:E7A4j
		nega
		mul
		adca	#0

loc_E7B0:				; CODE XREF: ROM:E7AAj
		adda	0,x
		rts

; =============== S U B	R O U T	I N E =======================================


ProcessMapOrTpsBlockData:		; CODE XREF: CalculateAverageValues+40P
					; CalculateAverageValues+4CP ...
		suba	0,y
		bcs	loc_E7BD
		ldab	1,x
		mul
		bra	loc_E7C5
; ---------------------------------------------------------------------------

loc_E7BD:				; CODE XREF: ProcessMapOrTpsBlockData+3j
		nega
		ldab	0,x
		mul
		nega
		negb
		sbca	#0

loc_E7C5:				; CODE XREF: ProcessMapOrTpsBlockData+8j
		addd	0,y
		std	0,y
		rts
; End of function ProcessMapOrTpsBlockData


; =============== S U B	R O U T	I N E =======================================


ResetCopTimer2:				; CODE XREF: __RESET:MainProgramLoopP
		sei
		ldaa	SwitchPortAccessReg1
		eora	#2
		staa	SwitchPortAccessReg1
		cli
; End of function ResetCopTimer2


; =============== S U B	R O U T	I N E =======================================


sub_E7D6:				; CODE XREF: __RESET:loc_94A2P
					; sub_E825+E8P	...
		ldd	#$55AA
		staa	COPRST_ArmOCToggleAndResetCopTimerReg
		stab	COPRST_ArmOCToggleAndResetCopTimerReg
		rts
; End of function sub_E7D6


; =============== S U B	R O U T	I N E =======================================


OCToggleAndResetCopTimer:		; CODE XREF: __RESET+8EP __RESET+91P ...
		ldaa	SwitchPortAccessReg1
		anda	#$FD
		staa	SwitchPortAccessReg1
		ldab	#$10

loc_E7EA:				; CODE XREF: OCToggleAndResetCopTimer+Bj
		decb
		bne	loc_E7EA
		oraa	#2
		staa	SwitchPortAccessReg1
		ldd	#$55AA
		staa	COPRST_ArmOCToggleAndResetCopTimerReg
		stab	COPRST_ArmOCToggleAndResetCopTimerReg
		rts
; End of function OCToggleAndResetCopTimer

; ---------------------------------------------------------------------------
		ldx	#ErrorBitRegisterStored0
		bra	loc_E809
; ---------------------------------------------------------------------------
		ldx	#Ram_05
		bra	loc_E809

; =============== S U B	R O U T	I N E =======================================


sub_E806:				; CODE XREF: sub_E825:loc_E880P
					; sub_E825:loc_E894P
		ldx	#Ram_01

loc_E809:				; CODE XREF: ROM:E7FFj	ROM:E804j ...
		ldy	#$242
		jsr	OCToggleAndResetCopTimer

loc_E810:				; CODE XREF: sub_E806+19j
		ldaa	SwitchPortAccessReg1
		bita	#$40
		bne	loc_E819
		sec
		rts
; ---------------------------------------------------------------------------

loc_E819:				; CODE XREF: sub_E806+Fj
		jsr	OCToggleAndResetCopTimer
		clc
		dey
		bne	loc_E810
		dex
		bne	loc_E809
		rts
; End of function sub_E806


; =============== S U B	R O U T	I N E =======================================


sub_E825:				; CODE XREF: __RESET+6AAP
		ldaa	SwitchPortAccessReg1
		bita	#$40
		bne	loc_E841
		brset	<Ram_30	$40 loc_E83C
		bset	<Ram_30	$40
		bclr	<BitFlags21 $80
		bclr	<BitFlags2e $42
		bclr	<Ram_30	$80

loc_E83C:				; CODE XREF: sub_E825+7j sub_E825+4Ej
		clr	CountdownTimerFromKeyOn
		cli
		rts
; ---------------------------------------------------------------------------

loc_E841:				; CODE XREF: sub_E825+5j
		bclr	<BitFlags21 $80
		bclr	<BitFlags2e $42
		bclr	<Ram_30	$C0
		ldaa	CountdownTimerFromKeyOn
		bne	loc_E859
		ldaa	#$17
		ldab	<TimerOverflowsBetweenCamPulses
		cmpb	#4
		bcs	loc_E859
		ldaa	#9

loc_E859:				; CODE XREF: sub_E825+28j sub_E825+30j
		deca
		beq	loc_E860
		staa	CountdownTimerFromKeyOn
		rts
; ---------------------------------------------------------------------------

loc_E860:				; CODE XREF: sub_E825+35j
		sei
		clra
		staa	<ErrorBitsAssociatedWithPIA1AndReg1eTo25_HB
		staa	<ClearTheErrorTimer_0
		jsr	OCToggleAndResetCopTimer
		jsr	sub_D15F
		ldaa	#$20

loc_E86E:				; CODE XREF: sub_E825+51j
		ldab	SwitchPortAccessReg1
		bitb	#$40
		beq	loc_E83C
		deca
		bne	loc_E86E
		jsr	OCToggleAndResetCopTimer
		ldaa	#$32
		staa	Temp3

loc_E880:				; CODE XREF: sub_E825+63j
		jsr	sub_E806
		bcs	loc_E8CC
		dec	Temp3
		bne	loc_E880
		ldaa	#$FF
		staa	TFLG1_TimerInterruptFlag1
		ldaa	#$32
		staa	Temp3

loc_E894:				; CODE XREF: sub_E825+7Ej
		jsr	sub_E806
		bcs	loc_E8CC
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#6
		bne	loc_E8CC
		dec	Temp3
		bne	loc_E894
		ldab	#3

loc_E8A7:				; CODE XREF: sub_E825+95j
		ldaa	#$10
		staa	ADCTL_A2DControlReg

loc_E8AC:				; CODE XREF: sub_E825+8Aj
		ldaa	ADCTL_A2DControlReg
		bpl	loc_E8AC
		ldaa	ADR1_A2DResults1
		cmpa	TL_MapSensorMiddleLimit
		bcc	loc_E8C9
		decb
		bne	loc_E8A7
		ldd	#$2481
		jsr	ThrowNonCriticalError_
		bcc	loc_E8C9
		bset	<Ram_05	4
		bra	loc_E8CC
; ---------------------------------------------------------------------------

loc_E8C9:				; CODE XREF: sub_E825+92j sub_E825+9Dj
		bclr	<Ram_05	4

loc_E8CC:				; CODE XREF: sub_E825+5Ej sub_E825+72j ...
		jsr	CountRamValuesFrom05to20
		std	<MinimumTimerCountBeforeMainloopCanContinue
		jsr	OCToggleAndResetCopTimer
		ldd	#0
		staa	PPROG_EEPROMControlReg
		stab	PIA_Ctrl_1
		staa	SwitchPortAccessReg1
		ldab	#7
		stab	PIA3_Buffer_2_t3
		staa	PIA_Ctrl_5
		staa	PIA_Ctrl_2
		ldd	#0
		std	OC1M_OutputCompare1Mask
		clr	SCCR2_SerialControlReg2
		ldd	#$FFFE
		std	PORTD_PortD
		ldd	#$AAF8
		staa	TCTL1_TimerControlReg1
		stab	CFORC_TimerForceCompare
		jsr	OCToggleAndResetCopTimer

loc_E906:				; CODE XREF: sub_E825+EBJ sub_E825+EEJ ...
		ldab	SwitchPortAccessReg1
		bitb	#$40
		beq	loc_E916
		jsr	sub_E7D6
		jmp	loc_E906
; ---------------------------------------------------------------------------
		jmp	loc_E906
; ---------------------------------------------------------------------------

loc_E916:				; CODE XREF: sub_E825+E6j
		jsr	sub_E7D6
		ldaa	#$40

loc_E91B:				; CODE XREF: sub_E825+FEj
		ldab	SwitchPortAccessReg1
		bitb	#$40
		bne	loc_E906
		deca
		bne	loc_E91B
		jsr	sub_E7D6
		jmp	__RESET
; End of function sub_E825


; =============== S U B	R O U T	I N E =======================================


CountRamValuesFrom05to20:		; CODE XREF: __RESET+20P
					; sub_E825:loc_E8CCP
		clra
		clrb
		ldx	#Ram_05

loc_E930:				; CODE XREF: CountRamValuesFrom05to20+Ej
		addb	0,x
		bcc	loc_E935
		inca

loc_E935:				; CODE XREF: CountRamValuesFrom05to20+7j
		inx
		cpx	#$20
		bcs	loc_E930
		rts
; End of function CountRamValuesFrom05to20

; ---------------------------------------------------------------------------
		ldaa	#$16
		bsr	sub_E942
		ldaa	#2

; =============== S U B	R O U T	I N E =======================================


sub_E942:				; CODE XREF: ROM:E93Ep
		staa	PPROG_EEPROMControlReg
		stab	0,x
		inca
		staa	PPROG_EEPROMControlReg
		ldy	#$1658

loc_E94F:				; CODE XREF: sub_E942+Fj
		dey
		bne	loc_E94F
		deca
		staa	PPROG_EEPROMControlReg
		clra
		staa	PPROG_EEPROMControlReg
		rts
; End of function sub_E942


; =============== S U B	R O U T	I N E =======================================


EmissionMaintenanceReminder2_MM:	; CODE XREF: __RESET+62FP
		brset	<BitFlags6a_t3 $40 loc_E963
		jmp	loc_E9EC
; ---------------------------------------------------------------------------

loc_E963:				; CODE XREF: EmissionMaintenanceReminder2_MMj
		ldaa	PPROG_EEPROMControlReg
		beq	loc_E979
		bclr	<BitFlags6a_t3 $80
		cmpa	#$17
		bne	loc_E974
		bset	<BitFlags6a_t3 8
		bra	loc_E97F
; ---------------------------------------------------------------------------

loc_E974:				; CODE XREF: EmissionMaintenanceReminder2_MM+11j
		bclr	<BitFlags6a_t3 8
		bra	loc_E97F
; ---------------------------------------------------------------------------

loc_E979:				; CODE XREF: EmissionMaintenanceReminder2_MM+Aj
		bset	<BitFlags6a_t3 $80
		bclr	<BitFlags6a_t3 8

loc_E97F:				; CODE XREF: EmissionMaintenanceReminder2_MM+16j
					; EmissionMaintenanceReminder2_MM+1Bj
		clra
		staa	PPROG_EEPROMControlReg
		ldaa	CountdownTimerFromKeyOn
		beq	loc_E991
		ldab	#3
		cba
		bcc	loc_E991
		tba
		staa	CountdownTimerFromKeyOn

loc_E991:				; CODE XREF: EmissionMaintenanceReminder2_MM+2Aj
					; EmissionMaintenanceReminder2_MM+2Fj
		ldx	#$B600
		ldab	DRBOffsetStored_HB
		abx
		ldab	DRBOffsetStored_LB
		ldaa	0,x
		cba
		beq	loc_E9D9
		brset	<BitFlags6a_t3 $80 loc_E9C3
		brclr	<BitFlags6a_t3 8 loc_E9AC
		cmpa	#$FF
		beq	loc_E9C3

loc_E9AC:				; CODE XREF: EmissionMaintenanceReminder2_MM+48j
		brset	<b5D_IPL2_t3 $40 loc_E9D9
		pshx
		psha
		pshb
		ldd	#$318A
		jsr	ThrowNonCriticalError_
		pulb
		pula
		pulx
		bcc	loc_E9C3
		bset	<b5D_IPL2_t3 $40
		bra	loc_E9D9
; ---------------------------------------------------------------------------

loc_E9C3:				; CODE XREF: EmissionMaintenanceReminder2_MM+44j
					; EmissionMaintenanceReminder2_MM+4Ej ...
		anda	DRBOffsetStored_LB
		cmpa	DRBOffsetStored_LB
		beq	loc_E9CF
		ldaa	#$16
		bra	loc_E9D1
; ---------------------------------------------------------------------------

loc_E9CF:				; CODE XREF: EmissionMaintenanceReminder2_MM+6Dj
		ldaa	#2

loc_E9D1:				; CODE XREF: EmissionMaintenanceReminder2_MM+71j
		staa	PPROG_EEPROMControlReg
		stab	0,x
		inca
		bra	loc_E9ED
; ---------------------------------------------------------------------------

loc_E9D9:				; CODE XREF: EmissionMaintenanceReminder2_MM+42j
					; EmissionMaintenanceReminder2_MM:loc_E9ACj ...
		bclr	<BitFlags6a_t3 $40
		brset	<BitFlags6a_t3 $20 loc_E9EC
		ldaa	#3
		cmpa	CountdownTimerFromKeyOn
		bne	loc_E9EC
		ldaa	#1
		staa	CountdownTimerFromKeyOn

loc_E9EC:				; CODE XREF: EmissionMaintenanceReminder2_MM+4J
					; EmissionMaintenanceReminder2_MM+80j ...
		clra

loc_E9ED:				; CODE XREF: EmissionMaintenanceReminder2_MM+7Bj
		staa	PPROG_EEPROMControlReg
		rts
; End of function EmissionMaintenanceReminder2_MM


; =============== S U B	R O U T	I N E =======================================


ErrorCodeResetEeprom:			; CODE XREF: __RESET+6A0P
					; DRB_ClearErrorCodes+15P
		ldx	#$B610

loc_E9F4:				; CODE XREF: ErrorCodeResetEeprom+12j
		ldab	#$10
		abx
		cpx	#$B650
		bhi	locret_EA05
		ldaa	0,x
		inca
		beq	locret_EA05
		bsr	sub_EA06
		bra	loc_E9F4
; ---------------------------------------------------------------------------

locret_EA05:				; CODE XREF: ErrorCodeResetEeprom+9j
					; ErrorCodeResetEeprom+Ej
		rts
; End of function ErrorCodeResetEeprom


; =============== S U B	R O U T	I N E =======================================


sub_EA06:				; CODE XREF: ErrorCodeResetEeprom+10p
		ldaa	#$E
		staa	PPROG_EEPROMControlReg
		stab	0,x
		inca
		staa	PPROG_EEPROMControlReg
		ldy	#$1652

loc_EA15:				; CODE XREF: sub_EA06+11j
		dey
		bne	loc_EA15
		deca
		staa	PPROG_EEPROMControlReg
		clr	PPROG_EEPROMControlReg
		sei
		jsr	OCToggleAndResetCopTimer
		cli
		rts
; End of function sub_EA06


; =============== S U B	R O U T	I N E =======================================


		; public IC2I
IC2I:					; DATA XREF: USER_VEC:FFECo
		ldd	TIC2_Counter_IC2_Speedometer
		lsld
		std	Temp5_t3
		jsr	sub_EB0F
		beq	loc_EA41
		fdiv
		jsr	sub_EB0F
		beq	loc_EA41
		fdiv
		jsr	sub_EB0F
		beq	loc_EA41
		jmp	loc_EAFC
; ---------------------------------------------------------------------------

loc_EA41:				; CODE XREF: IC2I+Aj IC2I+10j	...
		ldd	<Counter_SpeedSensorInterrupt_HB
		addd	#1
		std	<Counter_SpeedSensorInterrupt_HB
		bne	loc_EA4D
		bset	<IPL1 $80

loc_EA4D:				; CODE XREF: IC2I+22j
		ldaa	<Counter_SpeedSensorInterrupt_HB_X
		inca
		beq	loc_EA54
		staa	<Counter_SpeedSensorInterrupt_HB_X

loc_EA54:				; CODE XREF: IC2I+2Aj
		ldd	<VehicleSpeed_HB
		subd	#$500
		ldaa	<BitFlags24
		bcc	loc_EA7E
		bita	#$10
		bne	loc_EA65
		oraa	#$10
		bra	loc_EA85
; ---------------------------------------------------------------------------

loc_EA65:				; CODE XREF: IC2I+39j
		anda	#$1F
		oraa	#8
		staa	<BitFlags24
		clra
		staa	CruiseControlVar4
		staa	Counter_SomethingWithDistributor
		staa	<Counter_TimerRegHalfOverflowBetweenSpeedoPulses
		ldd	<VehicleSpeed_HB
		addd	#$53
		std	<VehicleSpeed_HB
		jmp	loc_EAFC
; ---------------------------------------------------------------------------

loc_EA7E:				; CODE XREF: IC2I+35j
		bita	#$10
		beq	loc_EA85
		jmp	loc_EB02
; ---------------------------------------------------------------------------

loc_EA85:				; CODE XREF: IC2I+3Dj IC2I+5Aj
		adda	#$20
		bcs	loc_EA8F
		anda	#$EF
		staa	<BitFlags24
		bra	loc_EAFC
; ---------------------------------------------------------------------------

loc_EA8F:				; CODE XREF: IC2I+61j
		staa	<BitFlags24
		ldab	CruiseControlVar4
		beq	loc_EAB5
		bita	#8
		bne	loc_EAB5
		ldaa	#$3A
		mul
		adca	#0
		cmpa	#3
		bcc	loc_EAA5
		ldaa	#3

loc_EAA5:				; CODE XREF: IC2I+7Bj
		tab
		ldaa	Counter_SomethingWithDistributor
		suba	CruiseControlVar4
		bcc	loc_EAAF
		nega

loc_EAAF:				; CODE XREF: IC2I+86j
		sba
		bcs	loc_EABB
		bset	<BitFlags24 8

loc_EAB5:				; CODE XREF: IC2I+6Ej IC2I+72j
		ldab	Counter_SomethingWithDistributor
		stab	CruiseControlVar4

loc_EABB:				; CODE XREF: IC2I+8Aj
		clra
		staa	Counter_SomethingWithDistributor
		ldd	Temp5_t3
		ldx	#$3C
		ldy	#$6490
		jsr	DetermineNumberOfOverflowsBetweenSensorPulses_MM
		ldaa	<Counter_TimerRegHalfOverflowBetweenSpeedoPulses
		lsra
		tab
		oraa	<TimerOverflowsBetweenSpeedoPulses
		beq	loc_EADD
		stab	<TimerOverflowsBetweenSpeedoPulses
		ldd	Temp5_t3
		subd	<PreviousVehicleSpeed_HB
		bra	loc_EAF2
; ---------------------------------------------------------------------------

loc_EADD:				; CODE XREF: IC2I+ACj
		ldd	Temp5_t3
		subd	<PreviousVehicleSpeed_HB
		subd	<SpeedoSensorPulsewidth_HB
		beq	loc_EAF4
		asra
		rorb
		asra
		rorb
		subd	#0
		bne	loc_EAF0
		incb

loc_EAF0:				; CODE XREF: IC2I+C7j
		addd	<SpeedoSensorPulsewidth_HB

loc_EAF2:				; CODE XREF: IC2I+B5j IC2I+E7j
		std	<SpeedoSensorPulsewidth_HB

loc_EAF4:				; CODE XREF: IC2I+BEj
		ldd	Temp5_t3
		std	<PreviousVehicleSpeed_HB
		clra
		staa	<Counter_TimerRegHalfOverflowBetweenSpeedoPulses

loc_EAFC:				; CODE XREF: IC2I+18J IC2I+55J ...
		ldaa	#2
		staa	TFLG1_TimerInterruptFlag1
		rti
; ---------------------------------------------------------------------------

loc_EB02:				; CODE XREF: IC2I+5CJ
		anda	#$EF
		staa	<BitFlags24
		ldaa	#1
		staa	<TimerOverflowsBetweenSpeedoPulses
		ldd	#$5F90
		bra	loc_EAF2
; End of function IC2I


; =============== S U B	R O U T	I N E =======================================


sub_EB0F:				; CODE XREF: IC2I+7P IC2I+DP ...
		ldaa	TCTL2_TimerControlReg2
		lsra
		eora	PORTA_PortA
		bita	#2
		rts
; End of function sub_EB0F


; =============== S U B	R O U T	I N E =======================================


		; public OC1I
OC1I:					; DATA XREF: USER_VEC:FFE8o
		bsr	sub_EB1C
		rti
; End of function OC1I


; =============== S U B	R O U T	I N E =======================================


sub_EB1C:				; CODE XREF: OC1Ip
		ldaa	#$80
		staa	TFLG1_TimerInterruptFlag1
		ldaa	#$10
		staa	ADCTL_A2DControlReg
		ldd	TOC1_Counter_OC1
		addd	#$1E0
		cpd	TCNT_Counter_FreeRunning16bit
		bmi	loc_EB43
		subd	#$89
		cpd	TCNT_Counter_FreeRunning16bit
		bpl	loc_EB3E
		addd	#$89

loc_EB3E:				; CODE XREF: sub_EB1C+1Dj
		addd	#$89
		bra	loc_EB49
; ---------------------------------------------------------------------------

loc_EB43:				; CODE XREF: sub_EB1C+14j
		ldd	TCNT_Counter_FreeRunning16bit
		addd	#$1E0

loc_EB49:				; CODE XREF: sub_EB1C+25j
		std	TOC1_Counter_OC1
		ldaa	TMSK1_TimerInterruptMask1
		anda	#$7F
		staa	TMSK1_TimerInterruptMask1
		inc	Timer_AlternatorDutyCycle
		ldx	#$6400
		ldaa	<ATMOffset
		cmpa	#$D
		bne	loc_EB63
		jmp	loc_EBF1
; ---------------------------------------------------------------------------

loc_EB63:				; CODE XREF: sub_EB1C+42j sub_EB1C+4Aj
		ldaa	ADCTL_A2DControlReg
		bpl	loc_EB63
		jsr	ReadA2DBattVolts
		staa	<BatteryVoltsRaw
		cli
		cmpa	<BatteryVolts
		bcc	loc_EB74
		staa	<BatteryVolts

loc_EB74:				; CODE XREF: sub_EB1C+54j
		ldaa	<EngineRpm_HB
		cmpa	#$C
		bcs	loc_EB82
		cmpa	#$10
		bcc	loc_EB87
		brset	<BitFlags24 1 loc_EB87

loc_EB82:				; CODE XREF: sub_EB1C+5Cj
		bclr	<BitFlags24 1
		bra	loc_EBEA
; ---------------------------------------------------------------------------

loc_EB87:				; CODE XREF: sub_EB1C+60j sub_EB1C+62j
		bset	<BitFlags24 1
		ldaa	<BatteryVoltsRaw
		cmpa	#$41
		bcc	loc_EB96
		ldab	<Counter_MainLoop
		bitb	#6
		bne	loc_EBEA

loc_EB96:				; CODE XREF: sub_EB1C+72j
		brclr	<BitFlags21 $10	loc_EBB1
		ldaa	<A2DResults2Temp
		bne	loc_EBA2
		ldaa	<BatteryVoltsRaw
		staa	<A2DResults2Temp

loc_EBA2:				; CODE XREF: sub_EB1C+80j
		suba	<BatteryVoltsRaw
		bls	loc_EBEA
		cmpa	byte_8A50
		bls	loc_EBEA
		bset	<BitFlags21 $20
		bclr	<BitFlags21 $10

loc_EBB1:				; CODE XREF: sub_EB1C:loc_EB96j
		clr	A2DResults2Temp
		ldaa	<BatteryVoltsRaw
		suba	<TargetBatteryVolts
		bne	loc_EBC0
		brclr	0,x 4 loc_EBE1
		bra	loc_EBEA
; ---------------------------------------------------------------------------

loc_EBC0:				; CODE XREF: sub_EB1C+9Cj
		ldab	#7
		bcc	loc_EBD4
		nega
		cmpa	#2
		beq	loc_EBCD
		bcc	loc_EBE1
		ldab	#3

loc_EBCD:				; CODE XREF: sub_EB1C+ABj
		andb	Timer_AlternatorDutyCycle
		beq	loc_EBEA
		bra	loc_EBE1
; ---------------------------------------------------------------------------

loc_EBD4:				; CODE XREF: sub_EB1C+A6j
		cmpa	#2
		beq	loc_EBDC
		bcc	loc_EBEA
		ldab	#3

loc_EBDC:				; CODE XREF: sub_EB1C+BAj
		andb	Timer_AlternatorDutyCycle
		bne	loc_EBEA

loc_EBE1:				; CODE XREF: sub_EB1C+9Ej sub_EB1C+ADj ...
		sei
		bset	0,x 4
		bset	<BitFlags24 2
		bra	loc_EBF1
; ---------------------------------------------------------------------------

loc_EBEA:				; CODE XREF: sub_EB1C+69j sub_EB1C+78j ...
		sei
		bclr	0,x 4
		bclr	<BitFlags24 2

loc_EBF1:				; CODE XREF: sub_EB1C+44J sub_EB1C+CCj
		bset	2,x 4
		ldaa	#$14

loc_EBF6:				; CODE XREF: sub_EB1C+DBj
		deca
		bne	loc_EBF6
		bclr	2,x 4
		cli
		ldaa	Timer_AlternatorDutyCycle
		lsra
		bcs	loc_EC7F
		ldab	<BitFlags36_t3
		bitb	#$40
		bne	loc_EC18
		lsra
		bcs	loc_EC7F
		ldaa	<EngineRpm_HB
		cmpa	#$5E
		bcs	loc_EC18
		ldaa	<CurrentAisPosition
		cmpa	<DesiredNewAisPosition
		beq	loc_EC7F

loc_EC18:				; CODE XREF: sub_EB1C+EBj sub_EB1C+F4j
		ldaa	<BatteryVolts
		cmpa	byte_86B6
		bcs	loc_EC7F
		sei
		ldaa	<PIA3_Buffer_t3
		oraa	#1
		staa	PIA3_Buffer_2_t3
		anda	#$FE
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		ldab	<CurrentAisPosition
		brclr	<BitFlags36_t3 $40 loc_EC3E
		ldaa	#1
		tstb
		bne	loc_EC46
		bclr	<BitFlags36_t3 $40
		bra	loc_EC4E
; ---------------------------------------------------------------------------

loc_EC3E:				; CODE XREF: sub_EB1C+114j
		ldaa	#1
		cmpb	<DesiredNewAisPosition
		beq	loc_EC4E
		bcs	loc_EC47

loc_EC46:				; CODE XREF: sub_EB1C+11Bj
		nega

loc_EC47:				; CODE XREF: sub_EB1C+128j
		tab
		adda	<CurrentAisPosition
		staa	<CurrentAisPosition
		bra	loc_EC4F
; ---------------------------------------------------------------------------

loc_EC4E:				; CODE XREF: sub_EB1C+120j
					; sub_EB1C+126j
		clrb

loc_EC4F:				; CODE XREF: sub_EB1C+130j
		ldx	#$E518
		addb	<BitFlags_36_t3
		andb	#3
		stab	<BitFlags_36_t3
		abx
		ldab	0,x
		tba
		comb
		aslb
		aslb
		aslb
		aslb
		anda	#$F
		aba
		ldx	#$1008
		sei
		bclr	0,x $20
		cmpa	SPSR_SerialPeripheralStatus
		staa	SPDR_SerialPeripheralDataIO
		ldaa	<PIA3_Buffer_t3
		oraa	#1
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		mul
		bset	0,x $20
		cli

loc_EC7F:				; CODE XREF: sub_EB1C+E5j sub_EB1C+EEj ...
		brclr	<DRBSerialMode $80 loc_ECE9
		ldaa	SCSR_SerialStatus
		bita	#$E
		psha
		pula
		beq	loc_EC91
		ldab	SCDR_SerialData
		bra	loc_ECE9
; ---------------------------------------------------------------------------

loc_EC91:				; CODE XREF: sub_EB1C+16Ej
		bita	#$20
		beq	loc_ECE9
		ldab	SCDR_SerialData
		cmpb	#$F2
		bne	loc_ECA4

loc_EC9C:				; CODE XREF: sub_EB1C+1A7j
		bclr	<BitFlags21 $40
		bclr	<BitFlags2f $80
		bra	loc_ECE6
; ---------------------------------------------------------------------------

loc_ECA4:				; CODE XREF: sub_EB1C+17Ej
		cmpb	#$F4
		bne	loc_ECB0
		bset	<BitFlags2f $80
		bclr	<BitFlags21 $40
		bra	loc_ECE6
; ---------------------------------------------------------------------------

loc_ECB0:				; CODE XREF: sub_EB1C+18Aj
		cmpb	#$F6
		bne	loc_ECBC
		bset	<BitFlags21 $40
		bclr	<BitFlags2f $80
		bra	loc_ECE6
; ---------------------------------------------------------------------------

loc_ECBC:				; CODE XREF: sub_EB1C+196j
		cmpb	#$FE
		bne	loc_ECC5
		bclr	<DRBSerialMode $B0
		bra	loc_EC9C
; ---------------------------------------------------------------------------

loc_ECC5:				; CODE XREF: sub_EB1C+1A2j
		brset	<BitFlags21 $40	loc_ECD5
		brset	<BitFlags2f $80	loc_ECDD
		ldx	#0
		abx
		ldab	0,x
		bra	loc_ECE6
; ---------------------------------------------------------------------------

loc_ECD5:				; CODE XREF: sub_EB1C:loc_ECC5j
		ldx	#$6480
		abx
		ldab	0,x
		bra	loc_ECE6
; ---------------------------------------------------------------------------

loc_ECDD:				; CODE XREF: sub_EB1C+1ADj
		ldx	#$ED05
		aslb
		abx
		ldx	0,x
		ldab	0,x

loc_ECE6:				; CODE XREF: sub_EB1C+186j
					; sub_EB1C+192j ...
		stab	SCDR_SerialData

loc_ECE9:				; CODE XREF: sub_EB1C:loc_EC7Fj
					; sub_EB1C+173j ...
		sei

loc_ECEA:				; CODE XREF: sub_EB1C+1D1j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_ECEA
		ldaa	ADR1_A2DResults1
		cmpa	<MapVolts_X
		bcs	loc_ECF8
		staa	<MapVolts_X

loc_ECF8:				; CODE XREF: sub_EB1C+1D8j
		cmpa	<MapValue3
		bcc	loc_ECFE
		staa	<MapValue3

loc_ECFE:				; CODE XREF: sub_EB1C+1DEj
		ldaa	#$80
		oraa	TMSK1_TimerInterruptMask1
		staa	TMSK1_TimerInterruptMask1
		rts
; End of function sub_EB1C

; ---------------------------------------------------------------------------
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

; =============== S U B	R O U T	I N E =======================================


sub_ED8B:				; CODE XREF: __RESET+419P
		ldd	#$8EFF
		stab	TFLG1_TimerInterruptFlag1
		staa	TMSK1_TimerInterruptMask1
		stab	TFLG2_TimerInterruptFlag2
		clr	PACNT_PulseAccumulatorCounter
; End of function sub_ED8B


; =============== S U B	R O U T	I N E =======================================


sub_ED9A:				; CODE XREF: IC1I+95P
		ldab	#1
		ldaa	SwitchPortAccessReg2
		bita	#1
		beq	loc_EDA5
		ldab	#0

loc_EDA5:				; CODE XREF: sub_ED9A+7j
		stab	PIA_Ctrl_2
		anda	#1
		eora	SwitchPortAccessReg2
		bita	#1
		beq	loc_EDBF
		ldaa	SwitchPortAccessReg2
		ldab	#1
		bita	#1
		beq	loc_EDBC
		ldab	#0

loc_EDBC:				; CODE XREF: sub_ED9A+1Ej
		stab	PIA_Ctrl_2

loc_EDBF:				; CODE XREF: sub_ED9A+15j
		ldd	#$1FB
		stab	PIA_Ctrl_4
		staa	PIA_Ctrl_3
		rts
; End of function sub_ED9A


; =============== S U B	R O U T	I N E =======================================


sub_EDC9:				; CODE XREF: __RESET+602P
		ldx	#$1000
		brset	9,x $3A	loc_EDD3
		bset	9,x $3A

loc_EDD3:				; CODE XREF: sub_EDC9+3j
		brclr	9,x 5 loc_EDDA
		bclr	9,x 5

loc_EDDA:				; CODE XREF: sub_EDC9:loc_EDD3j
		brclr	$C,x $F8 loc_EDE1
		bclr	$C,x $FF

loc_EDE1:				; CODE XREF: sub_EDC9:loc_EDDAj
		brclr	$D,x $F8 loc_EDE8
		bclr	$D,x $FF

loc_EDE8:				; CODE XREF: sub_EDC9:loc_EDE1j
		brset	$20,x $A2 loc_EDEF
		bset	$20,x $A2

loc_EDEF:				; CODE XREF: sub_EDC9:loc_EDE8j
		brclr	$20,x $C loc_EDF6
		bclr	$20,x $C

loc_EDF6:				; CODE XREF: sub_EDC9:loc_EDEFj
		brset	$21,x $1A loc_EDFD
		bset	$21,x $1A

loc_EDFD:				; CODE XREF: sub_EDC9:loc_EDF6j
		brclr	$21,x $25 loc_EE04
		bclr	$21,x $25

loc_EE04:				; CODE XREF: sub_EDC9:loc_EDFDj
		brset	$22,x $8E loc_EE0B
		bset	$22,x $8E

loc_EE0B:				; CODE XREF: sub_EDC9:loc_EE04j
		brclr	$22,x $61 loc_EE12
		bclr	$22,x $61

loc_EE12:				; CODE XREF: sub_EDC9:loc_EE0Bj
		brclr	$24,x $F0 loc_EE19
		bclr	$24,x $F0

loc_EE19:				; CODE XREF: sub_EDC9:loc_EE12j
		brset	$26,x $70 loc_EE20
		bset	$26,x $70

loc_EE20:				; CODE XREF: sub_EDC9:loc_EE19j
		brclr	$26,x $80 loc_EE27
		bclr	$26,x $80

loc_EE27:				; CODE XREF: sub_EDC9:loc_EE20j
		brset	$28,x $54 loc_EE2E
		bset	$28,x $54

loc_EE2E:				; CODE XREF: sub_EDC9:loc_EE27j
		brclr	$28,x $AB loc_EE35
		bclr	$28,x $AB

loc_EE35:				; CODE XREF: sub_EDC9:loc_EE2Ej
		brclr	$2C,x $18 loc_EE3C
		bclr	$2C,x $18

loc_EE3C:				; CODE XREF: sub_EDC9:loc_EE35j
		brset	$2D,x $C loc_EE43
		bset	$2D,x $C

loc_EE43:				; CODE XREF: sub_EDC9:loc_EE3Cj
		brclr	$2D,x $F3 loc_EE4A
		bclr	$2D,x $F3

loc_EE4A:				; CODE XREF: sub_EDC9:loc_EE43j
		brset	$39,x $88 loc_EE51
		bset	$39,x $88

loc_EE51:				; CODE XREF: sub_EDC9:loc_EE4Aj
		brclr	$39,x $40 loc_EE58
		bclr	$39,x $40

loc_EE58:				; CODE XREF: sub_EDC9:loc_EE51j
		brset	$3C,x $F loc_EE61
		sei
		bset	$3C,x $F
		cli

loc_EE61:				; CODE XREF: sub_EDC9:loc_EE58j
		ldx	#$6400
		sei
		ldaa	TL_IDENT1
		cmpa	#$11
		beq	loc_EE7C
		brclr	2,x $70	loc_EE73
		bclr	2,x $70

loc_EE73:				; CODE XREF: sub_EDC9+A3j
		brset	2,x $83	loc_EE8A
		bset	2,x $83
		bra	loc_EE8A
; ---------------------------------------------------------------------------

loc_EE7C:				; CODE XREF: sub_EDC9+A1j
		brclr	2,x $F0	loc_EE83
		bclr	2,x $F0

loc_EE83:				; CODE XREF: sub_EDC9:loc_EE7Cj
		brset	2,x 3 loc_EE8A
		bset	2,x 3

loc_EE8A:				; CODE XREF: sub_EDC9:loc_EE73j
					; sub_EDC9+B1j	...
		cli
		brclr	3,x $FE	loc_EE92
		bclr	3,x $FE

loc_EE92:				; CODE XREF: sub_EDC9+C2j
		brclr	4,x $FE	loc_EE99
		bclr	4,x $FE

loc_EE99:				; CODE XREF: sub_EDC9:loc_EE92j
		brset	6,x $F8	loc_EEA0
		bset	6,x $F8

loc_EEA0:				; CODE XREF: sub_EDC9:loc_EE99j
		brclr	6,x 6 locret_EEA7
		bclr	6,x 6

locret_EEA7:				; CODE XREF: sub_EDC9:loc_EEA0j
		rts
; End of function sub_EDC9

; ---------------------------------------------------------------------------
		fdb $4614
		fdb $3D15
		fdb $4513
		fdb $3D14
		fdb $1513

; =============== S U B	R O U T	I N E =======================================


VerifyOperationOfFuelInjectorDrivers_MM: ; CODE	XREF: __RESET+671P
		ldaa	<EngineRpm_HB
		cmpa	#$5E
		bcc	loc_EF26
		ldaa	<BatteryVolts
		cmpa	#$C3
		bcs	loc_EF26
		ldaa	SwitchPortAccessReg1
		bita	#$10
		beq	loc_EF26
		brset	<PIA2_Buffer_t3	$10 loc_EF26
		bita	#$40
		bne	loc_EF26
		brset	<b5d_IPL2 $20 loc_EF26
		sei
		ldaa	SwitchPortAccessReg2
		anda	#$F0
		bne	loc_EF29
		brset	<BitFlags27 $80	loc_EEE4
		ldaa	PORTA_PortA
		bita	#$60
		bne	loc_EF29

loc_EEE4:				; CODE XREF: VerifyOperationOfFuelInjectorDrivers_MM+27j
		brclr	<BitFlags21 $80	loc_EF29
		ldab	#7

loc_EEEA:				; CODE XREF: VerifyOperationOfFuelInjectorDrivers_MM+39j
		decb
		bne	loc_EEEA
		ldaa	PIA_Ctrl_4
		bita	#4
		bne	loc_EF21
		ldaa	<BitFlags_BF_t3
		ldab	<CylinderPointer
		cli
		ldx	#$EEAE
		brset	<BitFlags27 $80	loc_EF03
		ldx	#$EEA8

loc_EF03:				; CODE XREF: VerifyOperationOfFuelInjectorDrivers_MM+4Aj
		cmpa	#$84
		bne	loc_EF12
		decb
		bpl	loc_EF12
		ldab	#3
		brset	<BitFlags27 $80	loc_EF12
		ldab	#5

loc_EF12:				; CODE XREF: VerifyOperationOfFuelInjectorDrivers_MM+53j
					; VerifyOperationOfFuelInjectorDrivers_MM+56j ...
		andb	#7
		abx
		ldaa	0,x
		ldab	#$90
		jsr	ThrowNonCriticalError_
		bcc	loc_EF21
		bset	<b5d_IPL2 $20

loc_EF21:				; CODE XREF: VerifyOperationOfFuelInjectorDrivers_MM+40j
					; VerifyOperationOfFuelInjectorDrivers_MM+6Aj
		ldab	#4
		stab	PIA_Ctrl_4

loc_EF26:				; CODE XREF: VerifyOperationOfFuelInjectorDrivers_MM+4j
					; VerifyOperationOfFuelInjectorDrivers_MM+Aj ...
		bclr	<BitFlags21 $80

loc_EF29:				; CODE XREF: VerifyOperationOfFuelInjectorDrivers_MM+25j
					; VerifyOperationOfFuelInjectorDrivers_MM+30j ...
		cli
		rts
; End of function VerifyOperationOfFuelInjectorDrivers_MM

; ---------------------------------------------------------------------------
CrankPickupIntrAddressTable:fdb	CrankInterrupt_FallingEdge
		fdb CrankInterrupt_HandleCamSensorRisingEdgeA
		fdb CrankInterrupt_HandleCamSensorRisingEdgeB
		fdb CrankInterrupt_CalculateFuel

; =============== S U B	R O U T	I N E =======================================


		; public IC1I
IC1I:					; DATA XREF: USER_VEC:FFEEo
		ldd	#$510
		staa	TFLG1_TimerInterruptFlag1
		stab	ADCTL_A2DControlReg
		ldx	<EngineRpm_HB
		cpx	#$BB80
		bcc	loc_EF63
		ldx	TIC1_Counter_IC1_CamSensor
		ldab	#$C
		abx
		ldaa	#4

loc_EF4B:				; CODE XREF: IC1I+20j
		bita	PORTA_PortA
		beq	loc_EF60
		cpx	TCNT_Counter_FreeRunning16bit
		bpl	loc_EF4B
		ldd	#$510
		staa	TFLG1_TimerInterruptFlag1
		stab	ADCTL_A2DControlReg
		bra	loc_EF63
; ---------------------------------------------------------------------------

loc_EF60:				; CODE XREF: IC1I+1Bj
		jmp	loc_F723
; ---------------------------------------------------------------------------

loc_EF63:				; CODE XREF: IC1I+Ej IC1I+2Bj
		brclr	<Ram_EC	$40 loc_EF75
		ldaa	SwitchPortAccessReg2
		bita	#$80
		bne	loc_EF75
		brset	<Ram_EC	$F loc_EF75
		inc	Ram_EC

loc_EF75:				; CODE XREF: IC1I:loc_EF63j IC1I+39j ...
		ldab	CountdownTimerFromKeyOn
		bne	loc_EF7D
		bclr	<Ram_05	1

loc_EF7D:				; CODE XREF: IC1I+45j
		clr	ATMOffset
		ldaa	<DRBPointer1
		cmpa	#$A
		bne	loc_EF8C
		clr	DRBPointer1
		bclr	<DRBSerialMode $30

loc_EF8C:				; CODE XREF: IC1I+51j
		ldab	<BitFlags_BF_t3
		bpl	loc_EFB7
		ldaa	<Ram_F4
		inca
		beq	loc_EFA0
		cmpa	#$FF
		bne	loc_EF9E
		ldab	#1
		stab	PIA_Ctrl_4

loc_EF9E:				; CODE XREF: IC1I+64j
		staa	<Ram_F4

loc_EFA0:				; CODE XREF: IC1I+60j
		ldab	<BitFlags_BF_t3
		bitb	#4
		beq	loc_EFA8
		andb	#$F8

loc_EFA8:				; CODE XREF: IC1I+71j
		incb
		stab	<BitFlags_BF_t3
		andb	#7
		decb
		aslb
		ldx	#$EF2B
		abx
		ldx	0,x
		jmp	0,x
; ---------------------------------------------------------------------------

loc_EFB7:				; CODE XREF: IC1I+5Bj
		ldaa	UNe_64B9
		tab
		anda	#$E0
		andb	#$1F
		cmpb	#$1F
		beq	loc_EFC4
		incb

loc_EFC4:				; CODE XREF: IC1I+8Ej
		aba
		staa	UNe_64B9
		jsr	sub_ED9A
		jmp	loc_F723
; ---------------------------------------------------------------------------

CrankInterrupt_FallingEdge:		; DATA XREF: ROM:CrankPickupIntrAddressTableo
		brset	<PIA3_Buffer_t3	$40 loc_EFE3
		jsr	DwellTimerOC4Interrupt
		ldd	#$FFFF
		addd	TCNT_Counter_FreeRunning16bit
		std	TOC4_Counter_OC4
		ldaa	#$10
		staa	TFLG1_TimerInterruptFlag1

loc_EFE3:				; CODE XREF: IC1I:CrankInterrupt_FallingEdgej
		brset	<BitFlags27 $80	loc_EFFB
		brclr	<BitFlags27 $40	loc_F00F
		ldaa	<CylinderPointer
		beq	loc_F00F
		cmpa	#3
		beq	loc_F00F
		cmpa	#1
		beq	loc_F006
		cmpa	#4
		beq	loc_F006

loc_EFFB:				; CODE XREF: IC1I:loc_EFE3j
		ldaa	<PIA3_Buffer_t3
		anda	#$FD
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		bra	loc_F00F
; ---------------------------------------------------------------------------

loc_F006:				; CODE XREF: IC1I+C2j IC1I+C6j
		ldaa	<PIA3_Buffer_t3
		oraa	#2
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3

loc_F00F:				; CODE XREF: IC1I+B4j IC1I+BAj ...
		ldd	TIC1_Counter_IC1_CamSensor
		ldx	#$34
		ldy	#$6490
		jsr	DetermineNumberOfOverflowsBetweenSensorPulses_MM
		ldaa	<Counter_TimerPastHalfwayBetweenCamPulses
		lsra
		staa	<TimerOverflowsBetweenCamPulses
		ldd	TIC1_Counter_IC1_CamSensor
		subd	<LastCamFallingEdgeTime
		std	<DistributorFallingEdgePulsewidth_HB
		ldd	TIC1_Counter_IC1_CamSensor
		std	<LastCamFallingEdgeTime
		clr	Counter_TimerPastHalfwayBetweenCamPulses
		ldaa	CalculatedDwellTime
		clrb
		lsrd
		lsrd
		lsrd
		std	AntiDwellTime_HB
		ldd	<DistributorFallingEdgePulsewidth_HB
		subd	#$C8
		cpd	AntiDwellTime_HB
		bcs	loc_F048
		ldd	AntiDwellTime_HB

loc_F048:				; CODE XREF: IC1I+110j
		std	AntiDwellTime_HB
		ldaa	<TimerOverflowsBetweenCamPulses
		bne	loc_F08D
		ldx	#$6400
		ldd	word_82B1
		cpd	<DistributorFallingEdgePulsewidth_HB
		bcs	loc_F08D
		brset	<IPL1 $40 loc_F09C
		brclr	<BitFlags23 $80	loc_F06A
		brset	0,x $20	loc_F06A
		ldaa	<Ram_7F
		beq	loc_F072

loc_F06A:				; CODE XREF: IC1I+12Bj	IC1I+12Fj
		ldd	word_82AF
		cpd	<DistributorFallingEdgePulsewidth_HB
		bcs	loc_F08D

loc_F072:				; CODE XREF: IC1I+135j
		bset	<IPL1 $40
		ldd	#0
		std	<KeyOnOrEngineRunningTime
		staa	<ATMOffset
		bset	<Ram_80	$FF
		jsr	sub_C49A
		jsr	sub_C4CE
		jsr	sub_C674
		jsr	sub_C726
		bra	loc_F09C
; ---------------------------------------------------------------------------

loc_F08D:				; CODE XREF: IC1I+11Aj	IC1I+125j ...
		brclr	<IPL1 $40 loc_F094
		clr	CounterUp_UsedInCalcFuel

loc_F094:				; CODE XREF: IC1I:loc_F08Dj
		bclr	<IPL1 $40
		ldaa	byte_8654
		staa	<Counter_C

loc_F09C:				; CODE XREF: IC1I+127j	IC1I+158j
		ldaa	<TimerOverflowsBetweenCamPulses
		bne	loc_F0DB
		ldx	#$6400
		ldd	word_807C
		cpd	<DistributorFallingEdgePulsewidth_HB
		bcs	loc_F0DB
		brset	<IPL1 1	loc_F0FE
		brclr	<BitFlags23 $80	loc_F0BB
		brset	0,x $20	loc_F0BB
		ldaa	<Ram_7F
		beq	loc_F0C3

loc_F0BB:				; CODE XREF: IC1I+17Cj	IC1I+180j
		ldd	word_807A
		cpd	<DistributorFallingEdgePulsewidth_HB
		bcs	loc_F0DB

loc_F0C3:				; CODE XREF: IC1I+186j
		ldaa	TMSK1_TimerInterruptMask1
		oraa	#$10
		staa	TMSK1_TimerInterruptMask1
		ldd	#$FFFF
		addd	TCNT_Counter_FreeRunning16bit
		std	TOC4_Counter_OC4
		ldaa	#$10
		staa	TFLG1_TimerInterruptFlag1
		bra	loc_F0FE
; ---------------------------------------------------------------------------

loc_F0DB:				; CODE XREF: IC1I+16Bj	IC1I+176j ...
		bclr	<IPL1 1
		bset	<BitFlags2D $80
		ldaa	#8
		staa	<Ram_4D
		staa	<CalculatedSparkAdvance
		ldaa	TMSK1_TimerInterruptMask1
		anda	#$EF
		staa	TMSK1_TimerInterruptMask1
		ldaa	<PIA3_Buffer_t3
		oraa	#$40
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		bset	<IPL1 2
		jmp	loc_F1E0
; ---------------------------------------------------------------------------

loc_F0FE:				; CODE XREF: IC1I+178j	IC1I+1A6j
		brclr	<BitFlags2D $80	loc_F10D
		ldaa	<Ram_4D
		adda	byte_807F
		bpl	loc_F10B
		ldaa	#$7F

loc_F10B:				; CODE XREF: IC1I+1D4j
		staa	<Ram_4D

loc_F10D:				; CODE XREF: IC1I:loc_F0FEj
		brset	<BitFlags27 $80	loc_F148
		brclr	<IPL1 1	loc_F124
		ldab	<EngineRpm_HB
		cmpb	#$1F
		bcs	loc_F124
		ldaa	<CalculatedSparkAdvance
		cmpa	#$50
		bcs	loc_F124
		jmp	loc_F1E0
; ---------------------------------------------------------------------------

loc_F124:				; CODE XREF: IC1I+1DEj	IC1I+1E6j ...
		ldaa	<AdvanceTemporary
		brclr	<BitFlags2D $80	loc_F135
		cmpa	<Ram_4D
		bls	loc_F132
		ldaa	<Ram_4D
		bra	loc_F135
; ---------------------------------------------------------------------------

loc_F132:				; CODE XREF: IC1I+1F9j
		bclr	<BitFlags2D $80

loc_F135:				; CODE XREF: IC1I+1F3j	IC1I+1FDj
		staa	<CalculatedSparkAdvance
		bset	<IPL1 1
		ldaa	#$80
		suba	<CalculatedSparkAdvance
		psha
		ldab	#$11
		mul
		adca	#0
		pulb
		aba
		bra	loc_F17A
; ---------------------------------------------------------------------------

loc_F148:				; CODE XREF: IC1I:loc_F10Dj
		brclr	<IPL1 1	loc_F15B
		ldab	<EngineRpm_HB
		cmpb	#$1F
		bcs	loc_F15B
		ldaa	<CalculatedSparkAdvance
		cmpa	#$50
		bcs	loc_F15B
		jmp	loc_F1E0
; ---------------------------------------------------------------------------

loc_F15B:				; CODE XREF: IC1I:loc_F148j IC1I+21Dj	...
		ldaa	<AdvanceTemporary
		brclr	<BitFlags2D $80	loc_F16C
		cmpa	<Ram_4D
		bls	loc_F169
		ldaa	<Ram_4D
		bra	loc_F16C
; ---------------------------------------------------------------------------

loc_F169:				; CODE XREF: IC1I+230j
		bclr	<BitFlags2D $80

loc_F16C:				; CODE XREF: IC1I+22Aj	IC1I+234j
		staa	<CalculatedSparkAdvance
		bset	<IPL1 1
		ldaa	#$80
		suba	<CalculatedSparkAdvance
		ldab	#$B6
		mul
		adca	#0

loc_F17A:				; CODE XREF: IC1I+213j
		psha
		ldab	<DistributorFallingEdgePulsewidth_HB
		mul
		std	Temp5_t3
		pula
		ldab	<DistributorFallingEdgePulsewidth_LB
		mul
		adca	#0
		tab
		clra
		addd	Temp5_t3
		addd	<LastCamFallingEdgeTime
		subd	#$A
		std	Temp5_t3
		bset	<IPL1 2
		ldx	#$1020
		subd	AntiDwellTime_HB
		std	DoubleTempB
		subd	TCNT_Counter_FreeRunning16bit
		bmi	loc_F1B2
		cpd	#$20
		bmi	loc_F1B2
		ldaa	PORTA_PortA
		bita	#8
		beq	loc_F1CA

loc_F1B2:				; CODE XREF: IC1I+270j	IC1I+276j
		bset	0,x 3
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	Temp5_t3
		std	TOC5_Counter_OC5_Dwell
		bclr	0,x 1
		ldaa	#8
		staa	TFLG1_TimerInterruptFlag1
		bra	loc_F1E0
; ---------------------------------------------------------------------------

loc_F1CA:				; CODE XREF: IC1I+27Dj
		bclr	0,x 1
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	DoubleTempB
		std	TOC5_Counter_OC5_Dwell
		bset	0,x 3
		ldaa	#8
		staa	TFLG1_TimerInterruptFlag1

loc_F1E0:				; CODE XREF: IC1I+1C8J	IC1I+1EEJ ...
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#8
		beq	loc_F1EA
		jsr	Interrupt_DwellTimer

loc_F1EA:				; CODE XREF: IC1I+2B2j
		brset	<IPL1 4	loc_F1F3
		jsr	sub_C75D
		bra	loc_F239
; ---------------------------------------------------------------------------

loc_F1F3:				; CODE XREF: IC1I:loc_F1EAj IC1I+2C3j
		ldaa	ADCTL_A2DControlReg
		bpl	loc_F1F3
		ldaa	ADR1_A2DResults1
		ldab	<EngineRpm_HB
		cmpb	#$2F
		bcc	loc_F20F
		cmpb	#$D
		bcs	loc_F20F
		cmpa	byte_8A66
		bcc	loc_F213
		cmpa	byte_8A65
		bcs	loc_F213

loc_F20F:				; CODE XREF: IC1I+2CCj	IC1I+2D0j
		brclr	<b5C_IPL1_t3 $88 loc_F216

loc_F213:				; CODE XREF: IC1I+2D5j	IC1I+2DAj
		jsr	loc_D7BF

loc_F216:				; CODE XREF: IC1I:loc_F20Fj
		jsr	ConvertMAPVoltsToValue
		tab
		stab	MapValue_t3
		bra	loc_F239
; ---------------------------------------------------------------------------
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
ToggleOC3:	fcb $10
ToggleOC3_ForceCompare:fcb $20
SetOC2ClrOC3SetOC4SetOC5:fcb $EF
ToggleOC2:	fcb $40
ToggleOC2_ForceCompare:fcb $40
ClrOC2SetOC3SetOC4SetOC5:fcb $BF
; ---------------------------------------------------------------------------

loc_F239:				; CODE XREF: IC1I+2BEj	IC1I+2EAj
		brclr	<Ram_EC	$80 loc_F250
		brclr	<Ram_EC	$10 loc_F24A
		ldaa	<Ram_EC
		bita	#$F
		beq	loc_F24D
		deca
		staa	<Ram_EC

loc_F24A:				; CODE XREF: IC1I+30Aj
		jmp	locret_F2C8
; ---------------------------------------------------------------------------

loc_F24D:				; CODE XREF: IC1I+312j
		bclr	<Ram_EC	$80

loc_F250:				; CODE XREF: IC1I:loc_F239j
		ldd	<InjectorPulsewidth_HB
		beq	locret_F2C8
		brset	<BitFlags2f 4 locret_F2C8
		brclr	<BitFlags2c 3 loc_F25E
		bra	locret_F2C8
; ---------------------------------------------------------------------------

loc_F25E:				; CODE XREF: IC1I+325j
		ldx	#$F21F
		brset	<BitFlags27 $80	loc_F268
		ldx	#$F227

loc_F268:				; CODE XREF: IC1I+32Ej
		ldab	<CylinderPointer
		aslb
		abx
		ldx	0,x
		ldy	#$F233
		cpx	#$101A
		beq	loc_F28F
		ldy	#$F236
		cpx	#$1018
		beq	loc_F28F
		ldd	<InjectorPulsewidth_HB
		std	0,x
		cpd	#$7F
		bcs	loc_F28D
		bset	<BitFlags21 $80

loc_F28D:				; CODE XREF: IC1I+355j
		bra	loc_F2B4
; ---------------------------------------------------------------------------

loc_F28F:				; CODE XREF: IC1I+342j	IC1I+34Bj
		ldd	0,y
		oraa	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1
		stab	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	<InjectorPulsewidth_HB
		std	0,x
		cpd	#$7F
		bcs	loc_F2AB
		bset	<BitFlags21 $80

loc_F2AB:				; CODE XREF: IC1I+373j
		ldaa	2,y
		anda	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1

loc_F2B4:				; CODE XREF: IC1I:loc_F28Dj
		ldd	<InjectorPulsewidth_HB
		lsrd
		lsrd
		addd	<CCDFuelOutput_HB
		bcc	loc_F2BF
		ldd	#$FFFF

loc_F2BF:				; CODE XREF: IC1I+387j
		std	<CCDFuelOutput_HB
		ldaa	<Counter_InjectorCalc
		inca
		beq	locret_F2C8
		staa	<Counter_InjectorCalc

locret_F2C8:				; CODE XREF: IC1I:loc_F24AJ IC1I+31Fj	...
		rti
; ---------------------------------------------------------------------------

loc_F2C9:				; CODE XREF: IC1I+3A7j	IC1I+3ACj ...
		jmp	loc_F3B8
; ---------------------------------------------------------------------------

CrankInterrupt_HandleCamSensorRisingEdgeA: ; DATA XREF:	ROM:EF2Do
		ldd	TIC1_Counter_IC1_CamSensor
		std	L00F5_t3
		brclr	<IPL1 1	loc_F306
		ldaa	<EngineRpm_HB
		cmpa	#$5E
		bcc	loc_F2C9
		ldd	L00F5_t3
		brclr	<IPL1 2	loc_F2C9
		subd	<LastCamFallingEdgeTime
		lsld
		lsld
		xgdy
		ldaa	#$58
		suba	<CalculatedSparkAdvance
		ble	loc_F2C9
		ldab	#$CD
		mul
		lsld
		aslb
		adca	#0
		jsr	ScaleYbyA
		xgdy
		addd	TIC1_Counter_IC1_CamSensor
		subd	#$A
		std	Temp5_t3
		bra	loc_F315
; ---------------------------------------------------------------------------

loc_F306:				; CODE XREF: IC1I+39Fj
		ldd	#$308
		oraa	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1
		stab	TFLG1_TimerInterruptFlag1
		jmp	loc_F3AA
; ---------------------------------------------------------------------------

loc_F315:				; CODE XREF: IC1I+3D1j
		ldaa	PORTA_PortA
		bita	#8
		bne	loc_F350
		ldaa	TCTL1_TimerControlReg1
		bita	#1
		bne	loc_F326
		jmp	loc_F3B8
; ---------------------------------------------------------------------------

loc_F326:				; CODE XREF: IC1I+3EEj
		ldd	Temp5_t3
		subd	AntiDwellTime_HB
		std	TOC5_Counter_OC5_Dwell
		ldab	TCTL1_TimerControlReg1
		orab	#3
		stab	TCTL1_TimerControlReg1
		ldd	TOC5_Counter_OC5_Dwell
		subd	#$40
		subd	TCNT_Counter_FreeRunning16bit
		bpl	loc_F3B8
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	AntiDwellTime_HB
		std	Temp5_t3

loc_F350:				; CODE XREF: IC1I+3E7j
		ldaa	TCTL1_TimerControlReg1
		bita	#1
		beq	loc_F372
		ldaa	<CalculatedSparkAdvance
		cmpa	#$28
		bcs	loc_F3B8
		ldd	TOC5_Counter_OC5_Dwell
		addd	AntiDwellTime_HB
		std	TOC5_Counter_OC5_Dwell
		ldd	#$FE08
		anda	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1
		stab	TFLG1_TimerInterruptFlag1

loc_F372:				; CODE XREF: IC1I+422j
		ldaa	<CalculatedSparkAdvance
		cmpa	#$28
		bcc	loc_F38D
		ldaa	TCTL1_TimerControlReg1
		oraa	#3
		staa	TCTL1_TimerControlReg1
		ldd	TCNT_Counter_FreeRunning16bit
		std	TOC5_Counter_OC5_Dwell
		ldaa	#8
		staa	TFLG1_TimerInterruptFlag1
		bra	loc_F3B8
; ---------------------------------------------------------------------------

loc_F38D:				; CODE XREF: IC1I+443j
		ldd	Temp5_t3
		subd	TOC5_Counter_OC5_Dwell
		cpd	#$10
		bcs	loc_F39F
		ldd	Temp5_t3
		std	TOC5_Counter_OC5_Dwell

loc_F39F:				; CODE XREF: IC1I+464j
		ldd	TOC5_Counter_OC5_Dwell
		subd	TCNT_Counter_FreeRunning16bit
		bpl	loc_F3B8
		bclr	<IPL1 2

loc_F3AA:				; CODE XREF: IC1I+3DFJ
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	#4
		std	TOC5_Counter_OC5_Dwell

loc_F3B8:				; CODE XREF: IC1I:loc_F2C9J IC1I+3F0J	...
		ldaa	SparkScatter
		adda	SparkScatterIncrement
		bvc	loc_F3E8
		brclr	<BitFlags68_t3 4 loc_F3E7
		ldab	<DesiredNewAisPosition
		cmpb	<CurrentAisPosition
		bne	loc_F3E7
		ldab	byte_869A
		beq	loc_F3E7
		tsta
		bmi	loc_F3DA
		ldaa	<DesiredNewAisPosition
		sba
		bcc	loc_F3E5
		clra
		bra	loc_F3E5
; ---------------------------------------------------------------------------

loc_F3DA:				; CODE XREF: IC1I+49Dj
		ldaa	byte_87A8
		addb	<DesiredNewAisPosition
		bcs	loc_F3E5
		cba
		bls	loc_F3E5
		tba

loc_F3E5:				; CODE XREF: IC1I+4A2j	IC1I+4A5j ...
		staa	<DesiredNewAisPosition

loc_F3E7:				; CODE XREF: IC1I+48Dj	IC1I+495j ...
		clra

loc_F3E8:				; CODE XREF: IC1I+48Bj
		staa	SparkScatterIncrement
		rti
; ---------------------------------------------------------------------------

loc_F3EC:				; CODE XREF: IC1I+4C6j	IC1I+4C8j ...
		jmp	loc_F4AD
; ---------------------------------------------------------------------------

CrankInterrupt_HandleCamSensorRisingEdgeB: ; DATA XREF:	ROM:EF2Fo
		ldd	TIC1_Counter_IC1_CamSensor
		std	Counter_IC1_Temp
		ldaa	<EngineRpm_HB
		cmpa	#$5E
		bcc	loc_F3EC
		brclr	<IPL1 2	loc_F3EC
		ldd	TIC1_Counter_IC1_CamSensor
		subd	L00F5_t3
		lsld
		lsld
		xgdy
		ldaa	#$30
		suba	<CalculatedSparkAdvance
		bcc	loc_F410
		clra

loc_F410:				; CODE XREF: IC1I+4DAj
		ldab	#$CD
		mul
		lsld
		aslb
		adca	#0
		jsr	ScaleYbyA
		xgdy
		addd	TIC1_Counter_IC1_CamSensor
		subd	#$A
		std	Temp5_t3
		brclr	<IPL1 1	loc_F3EC
		ldaa	PORTA_PortA
		bita	#8
		bne	loc_F466
		ldaa	TCTL1_TimerControlReg1
		bita	#1
		beq	loc_F4AD
		ldd	Temp5_t3
		subd	AntiDwellTime_HB
		std	TOC5_Counter_OC5_Dwell
		ldab	TCTL1_TimerControlReg1
		orab	#3
		stab	TCTL1_TimerControlReg1
		ldab	#8
		stab	TFLG1_TimerInterruptFlag1
		ldd	TOC5_Counter_OC5_Dwell
		subd	#$40
		subd	TCNT_Counter_FreeRunning16bit
		bpl	loc_F4AD
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	AntiDwellTime_HB
		std	Temp5_t3

loc_F466:				; CODE XREF: IC1I+4FBj
		ldaa	TCTL1_TimerControlReg1
		bita	#1
		beq	loc_F482
		ldd	TOC5_Counter_OC5_Dwell
		addd	AntiDwellTime_HB
		std	TOC5_Counter_OC5_Dwell
		ldd	#$FE08
		anda	TCTL1_TimerControlReg1
		staa	TCTL1_TimerControlReg1
		stab	TFLG1_TimerInterruptFlag1

loc_F482:				; CODE XREF: IC1I+538j
		ldd	Temp5_t3
		subd	TOC5_Counter_OC5_Dwell
		cpd	#$10
		bcs	loc_F494
		ldd	Temp5_t3
		std	TOC5_Counter_OC5_Dwell

loc_F494:				; CODE XREF: IC1I+559j
		ldd	TOC5_Counter_OC5_Dwell
		subd	TCNT_Counter_FreeRunning16bit
		bpl	loc_F4AD
		bclr	<IPL1 2
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	TCNT_Counter_FreeRunning16bit
		addd	#4
		std	TOC5_Counter_OC5_Dwell

loc_F4AD:				; CODE XREF: IC1I:loc_F3ECJ IC1I+502j	...
		ldaa	<EngineRpm_HB
		cmpa	#$6D
		bcc	loc_F4C4
		cmpa	#$6A
		bcc	loc_F4BA
		bclr	<IPL1 4

loc_F4BA:				; CODE XREF: IC1I+582j
		jsr	sub_E6AA
		std	<EngineRpm_HB
		jsr	sub_E721
		bra	loc_F4C7
; ---------------------------------------------------------------------------

loc_F4C4:				; CODE XREF: IC1I+57Ej
		bset	<IPL1 4

loc_F4C7:				; CODE XREF: IC1I+58Fj
		clra
		brclr	<BitFlags66_t3 $40 loc_F4D1
		ldaa	<CounterUp_42
		inca
		beq	loc_F4D3

loc_F4D1:				; CODE XREF: IC1I+595j
		staa	<CounterUp_42

loc_F4D3:				; CODE XREF: IC1I+59Cj
		ldaa	<CounterUp_42
		cmpa	byte_81BB
		bcs	loc_F4DF
		bset	<IPL1 $10
		bra	loc_F4E2
; ---------------------------------------------------------------------------

loc_F4DF:				; CODE XREF: IC1I+5A5j
		bclr	<IPL1 $10

loc_F4E2:				; CODE XREF: IC1I+5AAj
		ldaa	<CounterDn_ba_o2
		beq	loc_F4E9
		deca
		staa	<CounterDn_ba_o2

loc_F4E9:				; CODE XREF: IC1I+5B1j
		ldaa	<CounterDn_bb_o2
		beq	loc_F4F0
		deca
		staa	<CounterDn_bb_o2

loc_F4F0:				; CODE XREF: IC1I+5B8j
		brset	<IPL1 $40 loc_F4FB
		ldaa	<CounterUp_UsedInCalcFuel
		inca
		beq	loc_F4FB
		staa	<CounterUp_UsedInCalcFuel

loc_F4FB:				; CODE XREF: IC1I:loc_F4F0j IC1I+5C4j
		ldaa	<CounterDn_bc_o2
		beq	loc_F502
		deca
		staa	<CounterDn_bc_o2

loc_F502:				; CODE XREF: IC1I+5CAj
		ldaa	<CounterDn_b9_o2
		beq	loc_F509
		deca
		staa	<CounterDn_b9_o2

loc_F509:				; CODE XREF: IC1I+5D1j
		ldaa	<CounterUp_b6_o2
		inca
		beq	loc_F510
		staa	<CounterUp_b6_o2

loc_F510:				; CODE XREF: IC1I+5D9j
		clra
		brclr	<IPL1 1	loc_F51A
		ldaa	<CounterUp_43
		inca
		beq	loc_F51C

loc_F51A:				; CODE XREF: IC1I+5DEj
		staa	<CounterUp_43

loc_F51C:				; CODE XREF: IC1I+5E5j
		ldaa	<CounterDn_b7_o2
		beq	loc_F523
		deca
		staa	<CounterDn_b7_o2

loc_F523:				; CODE XREF: IC1I+5EBj
		ldaa	Counter_SomethingWithDistributor
		inca
		beq	loc_F52C
		staa	Counter_SomethingWithDistributor

loc_F52C:				; CODE XREF: IC1I+5F4j
		jmp	*+3
; ---------------------------------------------------------------------------

locret_F52F:				; CODE XREF: IC1I:loc_F52CJ
		rti
; ---------------------------------------------------------------------------

CrankInterrupt_CalculateFuel:		; DATA XREF: ROM:EF31o
		brset	<IPL1 1	loc_F546
		ldaa	TCTL1_TimerControlReg1
		anda	#$FE
		staa	TCTL1_TimerControlReg1
		ldaa	#8
		staa	CFORC_TimerForceCompare
		bclr	<IPL1 2
		bra	loc_F572
; ---------------------------------------------------------------------------

loc_F546:				; CODE XREF: IC1I:CrankInterrupt_CalculateFuelj
		bra	*+2
; ---------------------------------------------------------------------------

loc_F548:				; CODE XREF: IC1I:loc_F546j
		clra
		clrb
		bra	loc_F567
; ---------------------------------------------------------------------------
		ldaa	<PIA3_Buffer_t3
		anda	#$BF
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		ldd	TIC1_Counter_IC1_CamSensor
		subd	Counter_IC1_Temp
		std	DoubleTempC
		ldx	#$648F
		ldd	word_828E
		jsr	ScaleXbyB_somethingelse

loc_F567:				; CODE XREF: IC1I+617j
		addd	TIC1_Counter_IC1_CamSensor
		std	TOC4_Counter_OC4
		ldaa	#$10
		staa	TFLG1_TimerInterruptFlag1

loc_F572:				; CODE XREF: IC1I+611j
		ldaa	<CylinderPointer
		inca
		brset	<BitFlags27 $80	loc_F57D
		cmpa	#6
		bra	loc_F57F
; ---------------------------------------------------------------------------

loc_F57D:				; CODE XREF: IC1I+642j
		cmpa	#4

loc_F57F:				; CODE XREF: IC1I+648j
		bcs	loc_F582
		clra

loc_F582:				; CODE XREF: IC1I:loc_F57Fj
		staa	<CylinderPointer
		brset	<BitFlags27 $80	loc_F5A7
		brclr	<BitFlags27 $40	loc_F5B0
		ldaa	<CylinderPointer
		beq	loc_F5A7
		cmpa	#3
		beq	loc_F5A7
		cmpa	#2
		beq	loc_F5B0
		cmpa	#5
		beq	loc_F5B0
		ldaa	<PIA3_Buffer_t3
		anda	#$FD
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3
		bra	loc_F5B0
; ---------------------------------------------------------------------------

loc_F5A7:				; CODE XREF: IC1I+651j	IC1I+65Bj ...
		ldaa	<PIA3_Buffer_t3
		oraa	#2
		staa	<PIA3_Buffer_t3
		staa	PIA3_Buffer_2_t3

loc_F5B0:				; CODE XREF: IC1I+655j	IC1I+663j ...
		brset	<IPL1 1	loc_F5B7
		jmp	loc_F680
; ---------------------------------------------------------------------------

loc_F5B7:				; CODE XREF: IC1I:loc_F5B0j
		brset	<BitFlags27 $80	loc_F5EC
		ldab	<EngineRpm_HB
		cmpb	#$1F
		bcc	loc_F5C4
		jmp	loc_F680
; ---------------------------------------------------------------------------

loc_F5C4:				; CODE XREF: IC1I+68Cj
		ldaa	<AdvanceTemporary
		brclr	<BitFlags2D $80	loc_F5D5
		cmpa	<Ram_4D
		bcs	loc_F5D2
		ldaa	<Ram_4D
		bra	loc_F5D5
; ---------------------------------------------------------------------------

loc_F5D2:				; CODE XREF: IC1I+699j
		bclr	<BitFlags2D $80

loc_F5D5:				; CODE XREF: IC1I+693j	IC1I+69Dj
		staa	<CalculatedSparkAdvance
		cmpa	#$50
		bcc	loc_F5DE
		jmp	loc_F680
; ---------------------------------------------------------------------------

loc_F5DE:				; CODE XREF: IC1I+6A6j
		ldaa	#$F8
		suba	<CalculatedSparkAdvance
		psha
		ldab	#$11
		mul
		adca	#0
		pulb
		aba
		bra	loc_F619
; ---------------------------------------------------------------------------

loc_F5EC:				; CODE XREF: IC1I:loc_F5B7j
		ldab	<EngineRpm_HB
		cmpb	#$1F
		bcs	loc_F609
		ldaa	<AdvanceTemporary
		brclr	<BitFlags2D $80	loc_F603
		cmpa	<Ram_4D
		bcs	loc_F600
		ldaa	<Ram_4D
		bra	loc_F603
; ---------------------------------------------------------------------------

loc_F600:				; CODE XREF: IC1I+6C7j
		bclr	<BitFlags2D $80

loc_F603:				; CODE XREF: IC1I+6C1j	IC1I+6CBj
		staa	<CalculatedSparkAdvance
		cmpa	#$50
		bcc	loc_F60C

loc_F609:				; CODE XREF: IC1I+6BDj
		jmp	loc_F680
; ---------------------------------------------------------------------------

loc_F60C:				; CODE XREF: IC1I+6D4j
		lsra
		tab
		ldaa	#$B8
		sba
		psha
		ldab	#$6C
		mul
		adca	#0
		pulb
		aba

loc_F619:				; CODE XREF: IC1I+6B7j
		psha
		ldab	<DistributorFallingEdgePulsewidth_HB
		mul
		std	Temp5_t3
		pula
		ldab	<DistributorFallingEdgePulsewidth_LB
		mul
		adca	#0
		tab
		clra
		addd	Temp5_t3
		addd	TIC1_Counter_IC1_CamSensor
		subd	#$A
		std	Temp5_t3
		bset	<IPL1 2
		ldx	#$1020
		subd	AntiDwellTime_HB
		std	DoubleTempB
		subd	TCNT_Counter_FreeRunning16bit
		bmi	loc_F652
		cpd	#$20
		bmi	loc_F652
		ldaa	PORTA_PortA
		bita	#8
		beq	loc_F66A

loc_F652:				; CODE XREF: IC1I+710j	IC1I+716j
		bset	0,x 3
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	Temp5_t3
		std	TOC5_Counter_OC5_Dwell
		bclr	0,x 1
		ldaa	#8
		staa	TFLG1_TimerInterruptFlag1
		bra	loc_F680
; ---------------------------------------------------------------------------

loc_F66A:				; CODE XREF: IC1I+71Dj
		bclr	0,x 1
		ldaa	#8
		staa	CFORC_TimerForceCompare
		ldd	DoubleTempB
		std	TOC5_Counter_OC5_Dwell
		bset	0,x 3
		ldaa	#8
		staa	TFLG1_TimerInterruptFlag1

loc_F680:				; CODE XREF: IC1I+681J	IC1I+68EJ ...
		ldaa	ADCTL_A2DControlReg
		bpl	loc_F680
		ldd	ADR3_A2DResults3
		staa	<O2SensorVolts
		stab	<LastTpsVolts
		cmpb	byte_8A59
		bcs	loc_F69C
		cmpb	byte_8A5A
		bcc	loc_F69C
		brset	<b5C_IPL1_t3 $40 loc_F69C
		stab	<TpsVolts

loc_F69C:				; CODE XREF: IC1I+75Cj	IC1I+761j ...
		ldaa	ADR1_A2DResults1
		ldab	<EngineRpm_HB
		cmpb	#$2F
		bcc	loc_F6B3
		cmpb	#$D
		bcs	loc_F6B3
		cmpa	byte_8A66
		bcc	loc_F6B7
		cmpa	byte_8A65
		bcs	loc_F6B7

loc_F6B3:				; CODE XREF: IC1I+770j	IC1I+774j
		brclr	<b5C_IPL1_t3 $88 loc_F6BA

loc_F6B7:				; CODE XREF: IC1I+779j	IC1I+77Ej
		jsr	loc_D7BF

loc_F6BA:				; CODE XREF: IC1I:loc_F6B3j
		jsr	ConvertMAPVoltsToValue
		tab
		brclr	<IPL1 4	loc_F6CA
		addb	MapValue_t3
		rorb
		stab	<MapValue
		bra	loc_F6CF
; ---------------------------------------------------------------------------

loc_F6CA:				; CODE XREF: IC1I+78Bj
		stab	MapValue_t3
		ldab	<MapValue

loc_F6CF:				; CODE XREF: IC1I+795j
		ldaa	<BaroPressure
		sba
		bcc	loc_F6D5
		clra

loc_F6D5:				; CODE XREF: IC1I+79Fj
		staa	<MapVolts
		jsr	sub_D9A2
		brclr	<IPL1 $40 loc_F723
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#8
		beq	loc_F6E8
		jsr	Interrupt_DwellTimer

loc_F6E8:				; CODE XREF: IC1I+7B0j
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$10
		beq	loc_F6F2
		jsr	DwellTimerOC4Interrupt

loc_F6F2:				; CODE XREF: IC1I+7BAj
		jsr	sub_C49A
		jsr	sub_C4CE
		jsr	sub_C674
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#8
		beq	loc_F705
		jsr	Interrupt_DwellTimer

loc_F705:				; CODE XREF: IC1I+7CDj
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$10
		beq	loc_F70F
		jsr	DwellTimerOC4Interrupt

loc_F70F:				; CODE XREF: IC1I+7D7j
		jsr	sub_C726
		brclr	<IPL1 4	loc_F723
		ldaa	TFLG1_TimerInterruptFlag1
		bita	#$10
		beq	loc_F720
		jsr	DwellTimerOC4Interrupt

loc_F720:				; CODE XREF: IC1I+7E8j
		jsr	loc_C79F

loc_F723:				; CODE XREF: IC1I:loc_EF60J IC1I+98J ...
		clr	ATMOffset
		ldaa	<DRBPointer1
		cmpa	#$A
		bne	locret_F732
		clr	DRBPointer1
		bclr	<DRBSerialMode $30

locret_F732:				; CODE XREF: IC1I+7F7j
		rti
; End of function IC1I


; =============== S U B	R O U T	I N E =======================================


		; public PAII
PAII:					; DATA XREF: USER_VEC:FFDAo
					; USER_VEC:FFDCo ...
		ldd	#$9E61
		anda	TMSK1_TimerInterruptMask1
		staa	TMSK1_TimerInterruptMask1
		stab	TFLG1_TimerInterruptFlag1
		ldd	#$FF0
		anda	TMSK2_TimerInterruptMask2
		staa	TMSK2_TimerInterruptMask2
		stab	TFLG2_TimerInterruptFlag2
		rti
; End of function PAII


; =============== S U B	R O U T	I N E =======================================


nullsub_1:				; CODE XREF: sub_C75D+8BP sub_C75D+E3P ...
		rts
; End of function nullsub_1


; =============== S U B	R O U T	I N E =======================================


		; public OC4I
OC4I:					; DATA XREF: USER_VEC:FFE2o
		bsr	DwellTimerOC4Interrupt
		rti
; End of function OC4I


; =============== S U B	R O U T	I N E =======================================


DwellTimerOC4Interrupt:			; CODE XREF: sub_C75D+7DP
					; sub_C75D+18EP ...
		ldd	#$1014
		staa	TFLG1_TimerInterruptFlag1
		rts
; End of function DwellTimerOC4Interrupt


; =============== S U B	R O U T	I N E =======================================


		; public I4_I5
I4_I5:					; DATA XREF: USER_VEC:off_FFE0o
		bsr	Interrupt_DwellTimer
		rti
; End of function I4_I5


; =============== S U B	R O U T	I N E =======================================


Interrupt_DwellTimer:			; CODE XREF: sub_C75D+54P sub_C75D+C2P ...
		ldaa	#8
		staa	TFLG1_TimerInterruptFlag1
		brclr	<BitFlags_BF_t3	$80 locret_F79C
		ldab	<TimerOverflowsBetweenCamPulses
		bne	locret_F79C
		brclr	<IPL1 1	locret_F79C
		ldab	TCTL1_TimerControlReg1
		eorb	#1
		bitb	#1
		bne	loc_F778
		brclr	<IPL1 2	locret_F79C

loc_F778:				; CODE XREF: Interrupt_DwellTimer+18j
		stab	TCTL1_TimerControlReg1
		lsrb
		bcs	loc_F79D
		ldab	#1
		ldaa	<CalculatedSparkAdvance
		cmpa	#$58
		bcc	loc_F78C
		incb
		cmpa	#$30
		bcc	loc_F78C
		incb

loc_F78C:				; CODE XREF: Interrupt_DwellTimer+2Aj
					; Interrupt_DwellTimer+2Fj
		ldaa	<BitFlags_BF_t3
		anda	#7
		cba
		bcs	loc_F7A7
		ldd	AntiDwellTime_HB

loc_F796:				; CODE XREF: Interrupt_DwellTimer+4Bj
		addd	TOC5_Counter_OC5_Dwell
		std	TOC5_Counter_OC5_Dwell

locret_F79C:				; CODE XREF: Interrupt_DwellTimer+5j
					; Interrupt_DwellTimer+Bj ...
		rts
; ---------------------------------------------------------------------------

loc_F79D:				; CODE XREF: Interrupt_DwellTimer+22j
		bclr	<IPL1 2
		ldd	<DistributorFallingEdgePulsewidth_HB
		subd	AntiDwellTime_HB
		bra	loc_F796
; ---------------------------------------------------------------------------

loc_F7A7:				; CODE XREF: Interrupt_DwellTimer+37j
		ldab	TCTL1_TimerControlReg1
		orab	#3
		stab	TCTL1_TimerControlReg1
		rts
; End of function Interrupt_DwellTimer

; ---------------------------------------------------------------------------
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

; =============== S U B	R O U T	I N E =======================================


		; public IRQ
IRQ:					; DATA XREF: USER_VEC:FFF2o
		ldx	#$1023
		brclr	0,x 4 loc_F7DA
		jmp	loc_F85A
; ---------------------------------------------------------------------------

loc_F7DA:				; CODE XREF: IRQ+3j
		ldx	TCNT_Counter_FreeRunning16bit
		ldab	#$C
		abx

loc_F7E0:				; CODE XREF: IRQ+1Cj
		ldaa	SwitchPortAccessReg2
		eora	PIA_Ctrl_2
		lsra
		bcs	loc_F865
		cpx	TCNT_Counter_FreeRunning16bit
		bpl	loc_F7E0
		brclr	<Ram_EC	$40 loc_F815
		ldaa	SwitchPortAccessReg2
		bita	#$80
		bne	loc_F815
		bclr	<Ram_EC	$40
		ldx	#$F7B0
		brset	<BitFlags27 $40	loc_F806
		ldx	#$F7C0

loc_F806:				; CODE XREF: IRQ+2Fj
		ldab	<Ram_EC
		tba
		andb	#$F
		abx
		ldab	0,x
		anda	#$F0
		aba
		oraa	#$10
		staa	<Ram_EC

loc_F815:				; CODE XREF: IRQ+1Ej IRQ+27j
		ldaa	#2
		ldab	SwitchPortAccessReg2
		lsrb
		bcc	loc_F824
		clra
		brset	<BitFlags27 $80	loc_F824
		ldaa	#5

loc_F824:				; CODE XREF: IRQ+4Bj IRQ+4Ej
		brclr	<BitFlags_BF_t3	$80 loc_F834
		ldab	#$C
		brclr	<BitFlags27 $80	loc_F830
		ldab	#8

loc_F830:				; CODE XREF: IRQ+5Aj
		cmpb	<Ram_F4
		bne	loc_F849

loc_F834:				; CODE XREF: IRQ:loc_F824j
		ldab	#$84
		staa	<CylinderPointer
		brset	<BitFlags_BF_t3	$80 loc_F842
		clr	KeyOnOrEngineRunningTime
		clr	Counter_MainLoop

loc_F842:				; CODE XREF: IRQ+68j
		stab	<BitFlags_BF_t3
		bset	<BitFlags2b $80
		bra	loc_F84C
; ---------------------------------------------------------------------------

loc_F849:				; CODE XREF: IRQ+62j
		bclr	<BitFlags2b $80

loc_F84C:				; CODE XREF: IRQ+77j
		brclr	<Ram_05	1 loc_F85A
		ldab	UNe_64B9
		addb	#$20
		bcs	loc_F85A
		stab	UNe_64B9

loc_F85A:				; CODE XREF: IRQ+7J IRQ:loc_F84Cj ...
		ldaa	PIA_Ctrl_2
		eora	#1
		staa	PIA_Ctrl_2
		clr	Ram_F4

loc_F865:				; CODE XREF: IRQ+17j
		ldaa	#1
		staa	PIA_Ctrl_4
		rti
; End of function IRQ

; ---------------------------------------------------------------------------
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
		fcb $3F
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

; Segment type:	Pure data
		; segment USER_VEC
		org $FFC0
RESERVFFC0:	fcb $FF
RESERVFFC1:	fcb $FF
RESERVFFC2:	fcb $FF
RESERVFFC3:	fcb $FF
RESERVFFC4:	fcb $FF
RESERVFFC5:	fcb $FF
RESERVFFC6:	fcb $FF
RESERVFFC7:	fcb $FF
RESERVFFC8:	fcb $FF
RESERVFFC9:	fcb $FF
RESERVFFCA:	fcb $FF
RESERVFFCB:	fcb $FF
RESERVFFCC:	fcb $FF
RESERVFFCD:	fcb $FF
RESERVFFCE:	fcb $FF
RESERVFFCF:	fcb $FF
RESERVFFD0:	fcb $FF
RESERVFFD1:	fcb $FF
RESERVFFD2:	fcb $FF
RESERVFFD3:	fcb $FF
RESERVFFD4:	fcb $FF
RESERVFFD5:	fcb $FF
		fdb SCISS
		fdb SPIE
		fdb PAII
		fdb PAII
		fdb PAII
off_FFE0:	fdb I4_I5
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
off_FFFE:	fdb __RESET
; end of 'USER_VEC'


		end
