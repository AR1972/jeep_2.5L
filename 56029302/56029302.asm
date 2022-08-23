
 ORG $0000
 include defines.inc
; ===========================================================================
 ORG $8000
 include data.inc
 ORG $90E0
; =============== S U B R O U T I N E =======================================


                ; public SCISS
SCISS:                                  ; DATA XREF: USER_VEC:FFD6↓o
                                        ; USER_VEC:FFD8↓o ...
                sei                     ; NOCOP
                                        ; OPC
                                        ; SOFT
                                        ; XIRQ
                                        ; SPIE
                ldab    #$80
                stab    FDRVar0
                ldd     #$2A9
                staa    TMSK2           ; Timer Interrupt Mask Register 2
                stab    OPTION          ; System Configuration Options
                ldaa    #$F8
                staa    BPROT           ; Block Protect Register
                lds     #TopOfStack
                clr     byte_0
                clr     byte_1
                bra     loc_915C
; End of function SCISS


; =============== S U B R O U T I N E =======================================


                ; public CME
CME:                                    ; DATA XREF: USER_VEC:FFFC↓o
                sei
                lds     #TopOfStack
                ldd     #$2A9
                staa    TMSK2           ; Timer Interrupt Mask Register 2
                stab    OPTION          ; System Configuration Options
                ldaa    #$F8
                staa    BPROT           ; Block Protect Register
                clra
                staa    FDRVar0
                ldx     #0

loc_9118:                               ; CODE XREF: CME+23↓j
                ldaa    0,x
                cmpa    #0
                bne     loc_9126
                inx
                cpx     #$48 ; 'H'
                bcs     loc_9118
                bra     loc_915C
; ---------------------------------------------------------------------------

loc_9126:                               ; CODE XREF: CME+1D↑j
                ldd     <byte_9
                tba
                comb
                std     <byte_0
                bra     loc_915C
; End of function CME


; =============== S U B R O U T I N E =======================================


                ; public __RESET
__RESET:                                ; CODE XREF: sub_F351+10C↓J
                                        ; DATA XREF: USER_VEC:off_FFFE↓o

; FUNCTION CHUNK AT 9804 SIZE 00000169 BYTES

                sei
                lds     #TopOfStack
                ldd     #$2A9
                staa    TMSK2           ; Timer Interrupt Mask Register 2
                stab    OPTION          ; System Configuration Options
                ldaa    #$F8
                staa    BPROT           ; Block Protect Register
                clra
                staa    FDRVar0
                ldd     <byte_9
                tba
                comb
                xgdy
                jsr     sub_F460
                cpd     <byte_0
                beq     loc_9156
                ldy     #0

loc_9156:                               ; CODE XREF: __RESET+22↑j
                sty     <byte_0
                bset    <byte_2 2

loc_915C:                               ; CODE XREF: SCISS+1D↑j
                                        ; CME+25↑j ...
                jsr     sub_F32B
                ldaa    #$90
                tap
                ldab    #$F
                ldaa    byte_8017
                bita    #8
                beq     loc_916D
                ldab    #6

loc_916D:                               ; CODE XREF: __RESET+3B↑j
                stab    HPRIO           ; Highest Priority I-Bit Int and Misc
                clr     OC1M            ; Output Compare 1 Mask Register
                clr     OC1D            ; Output Compare 1 Data Register
                ldd     #$FF
                staa    TMSK1           ; Timer Interrupt Mask Register 1
                stab    TFLG1           ; Timer Interrupt Flag Register 1
                ldaa    #$1A
                staa    TCTL2           ; Timer Control Register 2
                ldd     #$AA78
                staa    TCTL1           ; Timer Control Register 1
                stab    CFORC           ; Timer Compare Force Register
                ldd     #$7520
                staa    PIA3_Buffer_2_t3
                staa    <byte_F1
                stab    PORTD           ; Port D Data
                ldd     #$80F
                staa    SwitchPortAccessReg1
                stab    PIA_Ctrl_1
                ldab    PIA_Ctrl_1
                andb    #$F7
                stab    PIA_Ctrl_1
                jsr     sub_F335
                jsr     sub_F335
                ldd     #$3A54
                staa    DDRD            ; Data Direction for Port D
                ldaa    SPSR            ; SPI Status Register
                stab    SPCR            ; SPI Control Register
                jsr     sub_F335
                ldd     #$F878
                staa    PIA_Ctrl_5
                stab    PACTL           ; Pulse Accumulator Control Register
                clra
                staa    PIA_Ctrl_3
                staa    PPROG           ; EEPROM Program Control Register
                staa    PIA_Ctrl_2
                ldd     #8
                std     InjectorPulsewidth_HB_Cyl1
                std     InjectorPulsewidth_HB_Cyl2
                std     InjectorPulsewidth_HB_Cyl3
                std     InjectorPulsewidth_HB_Cyl4
                ldd     #$C22
                staa    SCCR2           ; Serial Communications Control Register 2
                stab    BAUD            ; SCI Baud Rate Control 3
                ldd     SCSR            ; Serial Communications Status Register
                jsr     sub_F335
                clr     SCCR1           ; SCI Control Register 1
                ldx     #$48 ; 'H'
                ldd     <byte_0
                coma
                cba
                beq     loc_9221
                ldab    #$81
                ldaa    FDRVar0
                bmi     loc_9208
                ldab    #$F0
                stab    <byte_8
                ldab    #8

loc_9208:                               ; CODE XREF: __RESET+D2↑j
                stab    <byte_2
                ldaa    #$5C ; '\'
                staa    <byte_3
                ldaa    #$80
                staa    <byte_6
                ldaa    byte_8EED
                staa    <byte_7
                ldd     #$40DF
                staa    <byte_4
                stab    <byte_5
                ldx     #9

loc_9221:                               ; CODE XREF: __RESET+CB↑j
                ldy     #$594

loc_9225:                               ; CODE XREF: __RESET+F9↓j
                dey
                bne     loc_9225
                dex
                clrb

loc_922B:                               ; CODE XREF: __RESET+103↓j
                inx
                stab    0,x
                cpx     #$1FF
                bcs     loc_922B
                ldaa    byte_8017
                staa    <byte_4F
                ldx     #CountdownTimerFromKeyOn
                dex
                clrb

loc_923D:                               ; CODE XREF: __RESET+115↓j
                inx
                stab    0,x
                cpx     #$48D
                bcs     loc_923D
                ldaa    #$E5
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                jsr     sub_F335
                ldy     #$594

loc_9253:                               ; CODE XREF: __RESET+127↓j
                dey
                bne     loc_9253
                ldaa    #$14
                staa    ADCTL           ; A_D Control Register

loc_925C:                               ; CODE XREF: __RESET+131↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_925C
                ldaa    ADR1            ; A_D Result Register 1
                staa    byte_156
                ldaa    <byte_F1
                anda    #$7F
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                jsr     sub_F335
                ldy     #unk_476

loc_9277:                               ; CODE XREF: __RESET+14B↓j
                dey
                bne     loc_9277
                ldaa    #$14
                staa    ADCTL           ; A_D Control Register

loc_9280:                               ; CODE XREF: __RESET+155↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_9280
                ldaa    ADR1            ; A_D Result Register 1
                staa    byte_154
                ldaa    byte_154
                ldab    byte_156
                mul
                std     FDRVar1
                ldab    byte_154
                subb    byte_156
                bls     loc_92B8
                clra
                xgdx
                ldd     FDRVar1
                aslb
                adca    #0
                tab
                abx
                ldd     FDRVar1
                idiv
                xgdx
                tsta
                bne     loc_92B8
                tba
                ldx     #byte_EBB2
                jsr     sub_F0B5
                bra     loc_92BA
; ---------------------------------------------------------------------------

loc_92B8:                               ; CODE XREF: __RESET+16D↑j
                                        ; __RESET+17F↑j
                ldaa    #$C1

loc_92BA:                               ; CODE XREF: __RESET+188↑j
                staa    <byte_7F
                jsr     sub_B10D
                jsr     sub_E88B
                ldaa    <byte_F1
                oraa    #$10
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                jsr     sub_F335
                ldy     #$594

loc_92D2:                               ; CODE XREF: __RESET+1A6↓j
                dey
                bne     loc_92D2
                ldaa    #$14
                staa    ADCTL           ; A_D Control Register

loc_92DB:                               ; CODE XREF: __RESET+1B0↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_92DB
                ldaa    ADR1            ; A_D Result Register 1
                cmpa    #$40 ; '@'
                bcc     loc_92F0
                ldaa    <byte_F1
                anda    #$EF
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3

loc_92F0:                               ; CODE XREF: __RESET+1B7↑j
                jsr     sub_F335
                ldy     #$594

loc_92F7:                               ; CODE XREF: __RESET+1CB↓j
                dey
                bne     loc_92F7
                ldaa    #$14
                staa    ADCTL           ; A_D Control Register

loc_9300:                               ; CODE XREF: __RESET+1D5↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_9300
                ldaa    ADR1            ; A_D Result Register 1
                staa    <byte_74

loc_930A:                               ; CODE XREF: __RESET+1DF↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_930A
                ldaa    ADR2            ; A_D Result Register 2
                cmpa    #$40 ; '@'
                bcc     loc_931F
                ldaa    <byte_F1
                anda    #$DF
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3

loc_931F:                               ; CODE XREF: __RESET+1E6↑j
                jsr     sub_F335
                ldy     #$594

loc_9326:                               ; CODE XREF: __RESET+1FA↓j
                dey
                bne     loc_9326
                ldaa    #$14
                staa    ADCTL           ; A_D Control Register

loc_932F:                               ; CODE XREF: __RESET+204↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_932F
                ldab    ADR2            ; A_D Result Register 2
                stab    <byte_73
                ldaa    #$10
                staa    ADCTL           ; A_D Control Register
                jsr     sub_F335

loc_9341:                               ; CODE XREF: __RESET+216↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_9341
                ldaa    ADR2            ; A_D Result Register 2
                jsr     sub_F1F4
                stab    <byte_76
                ldab    ADR4            ; A_D Result Register 4
                stab    <byte_75
                ldaa    ADR1            ; A_D Result Register 1
                jsr     sub_F2EC
                staa    <byte_6D
                clrb
                std     <byte_C1
                staa    byte_155
                ldaa    ADR1            ; A_D Result Register 1
                staa    byte_16E
                staa    byte_16F
                brclr   <byte_2 2 loc_9394
                brclr   <byte_2 4 loc_9394
                cmpa    byte_9066
                bcc     loc_9394
                ldab    #2

loc_9379:                               ; CODE XREF: __RESET+25E↓j
                ldaa    #$10
                staa    ADCTL           ; A_D Control Register

loc_937E:                               ; CODE XREF: __RESET+253↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_937E
                ldaa    ADR1            ; A_D Result Register 1
                cmpa    byte_9066
                bcc     loc_9394
                decb
                bne     loc_9379
                bset    <byte_F2 8
                bset    <byte_56 $80

loc_9394:                               ; CODE XREF: __RESET+23C↑j
                                        ; __RESET+240↑j ...
                bclr    <byte_2 2
                ldaa    <byte_2
                anda    #$C0
                cmpa    #$80
                bne     loc_93B5
                ldd     #$AFF
                std     <byte_F7
                ldaa    #$F1
                staa    word_119
                ldab    #$FF
                ldaa    <byte_4F
                bita    #$C0
                beq     loc_93CD
                ldab    #$FB
                bra     loc_93CD
; ---------------------------------------------------------------------------

loc_93B5:                               ; CODE XREF: __RESET+26F↑j
                ldaa    <byte_2
                adda    #$40 ; '@'
                staa    <byte_2
                ldaa    PIA_Ctrl_1
                oraa    #4
                staa    PIA_Ctrl_1
                ldab    #$EF
                ldaa    <byte_4F
                bita    #$C0
                beq     loc_93CD
                ldab    #$EB

loc_93CD:                               ; CODE XREF: __RESET+281↑j
                                        ; __RESET+285↑j ...
                stab    <byte_F0
                jsr     sub_F335
                bset    <byte_49 8
                ldaa    #3
                staa    byte_153
                bset    <byte_4C $10
                bset    <byte_7C $FF
                bset    <byte_4A $10
                bset    <byte_4D $4C ; 'L'
                bset    <byte_4 $20 ; ' '
                bclr    <byte_4 $10
                bset    <byte_5F $A0
                ldaa    #$80
                staa    <byte_61
                ldd     #$FFFF
                std     word_117
                std     byte_115
                std     byte_108
                std     byte_10A
                staa    <byte_68
                clra
                staa    byte_13C
                ldaa    <byte_8
                cmpa    #$80
                bcc     loc_9412
                ldaa    #$F0
                staa    <byte_8

loc_9412:                               ; CODE XREF: __RESET+2DE↑j
                brset   <byte_2 1 loc_942A
                bset    <byte_2 1
                ldaa    <byte_4F
                bita    #$C8
                bne     loc_942A
                ldaa    byte_86BB
                beq     loc_942A
                bset    <byte_51 8
                bset    <byte_5C $80

loc_942A:                               ; CODE XREF: __RESET:loc_9412↑j
                                        ; __RESET+2EF↑j ...
                ldaa    <byte_6D
                clrb
                std     <byte_BD
                std     <byte_BF
                ldaa    <byte_75
                std     <byte_C6
                std     <byte_C8
                ldx     #$B616
                ldaa    0,x
                cmpa    #$4A ; 'J'
                bne     loc_9448
                coma
                cmpa    1,x
                bne     loc_9448
                bset    <byte_55 4

loc_9448:                               ; CODE XREF: __RESET+310↑j
                                        ; __RESET+315↑j
                ldaa    <byte_74
                ldx     #byte_EA3B
                brclr   <byte_F1 $10 loc_9454
                ldx     #byte_EA20

loc_9454:                               ; CODE XREF: __RESET+31F↑j
                jsr     sub_F0B5
                staa    <byte_72
                ldaa    <byte_74
                cmpa    byte_9046
                bcc     loc_9469
                cmpa    byte_9045
                bcs     loc_9469
                ldaa    <byte_72
                bra     loc_946C
; ---------------------------------------------------------------------------

loc_9469:                               ; CODE XREF: __RESET+330↑j
                                        ; __RESET+335↑j
                ldaa    byte_9047

loc_946C:                               ; CODE XREF: __RESET+339↑j
                staa    <byte_72
                staa    byte_13A
                ldaa    byte_8018
                bita    #8
                bne     loc_948F
                bset    <byte_B4 $20 ; ' '
                ldab    <byte_21
                andb    #$F0
                beq     loc_948C
                ldaa    <byte_72
                cmpa    byte_8B11
                bcs     loc_94B2
                cmpb    #$F0
                bne     loc_94B2

loc_948C:                               ; CODE XREF: __RESET+351↑j
                jmp     loc_955A
; ---------------------------------------------------------------------------

loc_948F:                               ; CODE XREF: __RESET+348↑j
                bset    <byte_B4 $20 ; ' '
                ldab    <byte_21
                andb    #$F0
                beq     loc_94AF
                ldaa    <byte_72
                cmpa    byte_8B11
                bcs     loc_94B2
                ldab    <byte_21
                andb    #$F0
                cmpb    #$D0
                bcc     loc_94AF
                cmpb    #$B0
                beq     loc_94AF
                cmpb    #$70 ; 'p'
                bne     loc_94B2

loc_94AF:                               ; CODE XREF: __RESET+368↑j
                                        ; __RESET+377↑j ...
                jmp     loc_955A
; ---------------------------------------------------------------------------

loc_94B2:                               ; CODE XREF: __RESET+358↑j
                                        ; __RESET+35C↑j ...
                ldaa    <byte_1E
                ldab    <byte_1F
                cba
                bge     loc_94BA
                tba

loc_94BA:                               ; CODE XREF: __RESET+389↑j
                ldab    <byte_20
                cba
                bge     loc_94C0
                tba

loc_94C0:                               ; CODE XREF: __RESET+38F↑j
                clrb

loc_94C1:                               ; CODE XREF: __RESET+3B3↓j
                cmpb    byte_8B04
                beq     loc_94DA
                cmpb    byte_8B05
                beq     loc_94DA
                cmpb    byte_8B06
                beq     loc_94DA
                cmpb    byte_8B07
                beq     loc_94DA
                pshb
                jsr     sub_F309
                pulb

loc_94DA:                               ; CODE XREF: __RESET+396↑j
                                        ; __RESET+39B↑j ...
                incb
                pshb
                addb    #$C
                cmpb    #$1C
                pulb
                bcs     loc_94C1
                ldaa    <byte_1D
                ldab    byte_8B04
                jsr     sub_F309
                ldaa    <byte_1E
                ldab    byte_8B05
                jsr     sub_F309
                ldaa    <byte_1F
                ldab    byte_8B06
                jsr     sub_F309
                ldaa    <byte_20
                ldab    byte_8B07
                jsr     sub_F309
                bclr    <byte_21 $F0
                ldaa    <byte_35
                ldab    <byte_36
                cba
                bge     loc_950E
                tba

loc_950E:                               ; CODE XREF: __RESET+3DD↑j
                ldab    <byte_37
                cba
                bge     loc_9514
                tba

loc_9514:                               ; CODE XREF: __RESET+3E3↑j
                clrb

loc_9515:                               ; CODE XREF: __RESET+407↓j
                cmpb    byte_8B04
                beq     loc_952E
                cmpb    byte_8B05
                beq     loc_952E
                cmpb    byte_8B06
                beq     loc_952E
                cmpb    byte_8B07
                beq     loc_952E
                pshb
                jsr     sub_F315
                pulb

loc_952E:                               ; CODE XREF: __RESET+3EA↑j
                                        ; __RESET+3EF↑j ...
                incb
                pshb
                addb    #$23 ; '#'
                cmpb    #$33 ; '3'
                pulb
                bcs     loc_9515
                ldaa    <byte_34
                ldab    byte_8B04
                jsr     sub_F315
                ldaa    <byte_35
                ldab    byte_8B05
                jsr     sub_F315
                ldaa    <byte_36
                ldab    byte_8B06
                jsr     sub_F315
                ldaa    <byte_37
                ldab    byte_8B07
                jsr     sub_F315
                bclr    <byte_38 $F0

loc_955A:                               ; CODE XREF: __RESET:loc_948C↑J
                                        ; __RESET:loc_94AF↑J
                ldaa    <byte_72
                cmpa    byte_8B10
                bcs     loc_9564
                bset    <byte_B4 $40 ; '@'

loc_9564:                               ; CODE XREF: __RESET+431↑j
                ldx     #$C
                ldaa    $E,x
                ldab    $F,x
                cba
                bgt     loc_9571
                tba
                ldab    $E,x

loc_9571:                               ; CODE XREF: __RESET+43E↑j
                sba
                cmpa    #$D
                bcs     loc_957A
                ldaa    $E,x
                staa    $F,x

loc_957A:                               ; CODE XREF: __RESET+446↑j
                ldx     #$23 ; '#'
                ldaa    $E,x
                ldab    $F,x
                cba
                bgt     loc_9587
                tba
                ldab    $E,x

loc_9587:                               ; CODE XREF: __RESET+454↑j
                sba
                cmpa    #$D
                bcs     loc_9590
                ldaa    $E,x
                staa    $F,x

loc_9590:                               ; CODE XREF: __RESET+45C↑j
                ldaa    <byte_73
                ldx     #byte_EA3B
                brclr   <byte_F1 $20 loc_959C ; ' '
                ldx     #byte_EA20

loc_959C:                               ; CODE XREF: __RESET+467↑j
                jsr     sub_F0B5
                staa    <byte_6F
                ldaa    <byte_73
                cmpa    byte_9049
                bcc     loc_95B1
                cmpa    byte_9048
                bcs     loc_95B1
                ldaa    <byte_6F
                bra     loc_95B4
; ---------------------------------------------------------------------------

loc_95B1:                               ; CODE XREF: __RESET+478↑j
                                        ; __RESET+47D↑j
                ldaa    byte_904A

loc_95B4:                               ; CODE XREF: __RESET+481↑j
                staa    <byte_6F
                ldaa    <byte_75
                staa    <byte_6E
                ldab    <byte_3
                addb    byte_801A
                cmpb    byte_801E
                bcs     loc_95CD
                adda    #6
                ldab    byte_801E
                cba
                bcc     loc_95CD
                tab

loc_95CD:                               ; CODE XREF: __RESET+494↑j
                                        ; __RESET+49C↑j
                stab    <byte_3
                ldaa    <byte_72
                cmpa    byte_903D
                bcs     loc_95DB
                cmpa    byte_903E
                bcs     loc_95DE

loc_95DB:                               ; CODE XREF: __RESET+4A6↑j
                bset    <byte_50 2

loc_95DE:                               ; CODE XREF: __RESET+4AB↑j
                jsr     sub_CDF1
                jsr     sub_CD65
                jsr     sub_C97D
                jsr     sub_F53B
                ldaa    #$BF
                ldab    byte_8018
                bitb    #$20 ; ' '
                beq     loc_95FC
                ldab    byte_8017
                bitb    #1
                beq     loc_95FC
                anda    #$DF

loc_95FC:                               ; CODE XREF: __RESET+4C3↑j
                                        ; __RESET+4CA↑j
                staa    <byte_EF
                ldaa    SwitchPortAccessReg1
                oraa    #1
                staa    SwitchPortAccessReg1
                ldx     #$238

loc_9609:                               ; CODE XREF: __RESET+4DC↓j
                dex
                bne     loc_9609
                bclr    <byte_52 8
                jsr     sub_A8E3
                ldaa    <byte_F1
                oraa    #1
                staa    PIA3_Buffer_2_t3
                anda    #$FE
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                ldx     #byte_DB63
                ldab    <byte_B
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
                ldx     #PORTD          ; Port D Data
                bclr    0,x $20 ; ' '
                cmpa    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                ldaa    <byte_F1
                oraa    #1
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                mul
                bset    0,x $20 ; ' '
                ldd     TCNTH           ; Timer Counter Register
                addd    #$FA0
                std     TOC1H           ; Output Compare 1 Register
                ldaa    SPCR            ; SPI Control Register
                anda    #$FC
                oraa    #1
                staa    SPCR            ; SPI Control Register
                ldab    <byte_F0
                ldaa    <byte_F1
                anda    #$FB
                staa    PIA3_Buffer_2_t3
                staa    <byte_F1
                cmpb    SPSR            ; SPI Status Register
                stab    SPDR            ; SPI Data Register
                mul
                mul
                nop
                ldaa    <byte_F1
                oraa    #4
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                ldab    SPCR            ; SPI Control Register
                andb    #$FC
                stab    SPCR            ; SPI Control Register
                jsr     sub_F335
                ldx     #$535

loc_9688:                               ; CODE XREF: __RESET+562↓j
                ldaa    SwitchPortAccessReg1
                bita    #$10
                bne     loc_9692
                dex
                bne     loc_9688

loc_9692:                               ; CODE XREF: __RESET+55F↑j
                cli
                ldd     TCNTH           ; Timer Counter Register
                std     word_14C
                jmp     loc_9804
; End of function __RESET

; ---------------------------------------------------------------------------
off_969C:       fdb loc_9787            ; DATA XREF: sub_96AC+C3↓o
                fdb loc_9790
                fdb loc_97FD
                fdb loc_97A9
                fdb loc_97FD
                fdb loc_97CC
                fdb loc_97EA
                fdb loc_97FD

; =============== S U B R O U T I N E =======================================


sub_96AC:                               ; CODE XREF: __RESET:loc_9804↓P
                jsr     sub_F321
                ldaa    byte_8017
                staa    <byte_4F
                inc     byte_13D
                sei
                ldd     TCNTH           ; Timer Counter Register
                std     FDRVar0
                inc     byte_65
                bne     loc_96D0
                bclr    <byte_2 $C0
                bset    <byte_4E 4
                ldaa    <byte_64
                inca
                beq     loc_96D0
                staa    <byte_64

loc_96D0:                               ; CODE XREF: sub_96AC+15↑j
                                        ; sub_96AC+20↑j
                ldaa    #$10
                staa    ADCTL           ; A_D Control Register
                ldd     FDRVar0
                ldx     #byte_115
                ldy     #Temp5_t3
                jsr     sub_F108
                cmpa    #$10
                bcs     loc_9704
                brset   <byte_56 $10 loc_9707
                bset    <byte_56 $10
                ldab    #$AA
                stab    TCTL1           ; Timer Control Register 1
                ldab    #$78 ; 'x'
                stab    CFORC           ; Timer Compare Force Register
                ldaa    byte_168
                anda    #$E0
                staa    byte_168
                bclr    <byte_53 $C0
                bra     loc_9707
; ---------------------------------------------------------------------------

loc_9704:                               ; CODE XREF: sub_96AC+38↑j
                bclr    <byte_56 $10

loc_9707:                               ; CODE XREF: sub_96AC+3A↑j
                                        ; sub_96AC+56↑j ...
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_9707
                ldaa    <byte_65
                lsra
                bcs     loc_971C
                lsra
                bcs     loc_971C
                ldaa    ADR2            ; A_D Result Register 2
                jsr     sub_F1F4
                staa    <byte_76

loc_971C:                               ; CODE XREF: sub_96AC+63↑j
                                        ; sub_96AC+66↑j
                ldd     ADR3            ; A_D Result Register 3
                staa    <byte_70
                stab    <byte_75
                ldaa    ADR1            ; A_D Result Register 1
                cli
                jsr     sub_A49B
                ldaa    byte_116
                beq     loc_9738
                bclr    <byte_48 $41 ; 'A'
                bclr    <byte_51 $40 ; '@'
                bclr    <byte_5D $C

loc_9738:                               ; CODE XREF: sub_96AC+81↑j
                ldaa    <byte_8
                suba    <byte_6D
                bcc     loc_973F
                clra

loc_973F:                               ; CODE XREF: sub_96AC+90↑j
                staa    byte_157
                ldaa    #$14
                sei
                staa    ADCTL           ; A_D Control Register
                ldd     TCNTH           ; Timer Counter Register
                lsld
                ldx     #byte_108
                ldy     #Temp5_t3
                jsr     sub_F108

loc_9756:                               ; CODE XREF: sub_96AC+AD↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_9756
                ldab    ADR4            ; A_D Result Register 4
                stab    <byte_71
                ldab    ADR3            ; A_D Result Register 3
                stab    byte_100
                ldab    <byte_F1
                orab    #$40 ; '@'
                stab    <byte_F1
                stab    PIA3_Buffer_2_t3
                ldx     #off_969C
                ldab    byte_13D
                bitb    #7
                beq     loc_9787
                orab    #$80
                cmpb    #$F8
                bcs     loc_97FD
                andb    #7
                aslb
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_9787:                               ; CODE XREF: sub_96AC+CB↑j
                                        ; DATA XREF: RESERVED:off_969C↑o
                ldd     ADR1            ; A_D Result Register 1
                staa    <byte_74
                stab    <byte_73
                bra     loc_97FD
; ---------------------------------------------------------------------------

loc_9790:                               ; DATA XREF: RESERVED:969E↑o
                ldaa    <byte_F1
                anda    #$7F
                brclr   <byte_F1 $10 loc_979D
                bset    <byte_4B 8
                bra     loc_97A0
; ---------------------------------------------------------------------------

loc_979D:                               ; CODE XREF: sub_96AC+E8↑j
                bclr    <byte_4B 8

loc_97A0:                               ; CODE XREF: sub_96AC+EF↑j
                anda    #$EF
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                bra     loc_97FD
; ---------------------------------------------------------------------------

loc_97A9:                               ; DATA XREF: RESERVED:96A2↑o
                ldaa    ADR1            ; A_D Result Register 1
                ldab    #$10
                stab    ADCTL           ; A_D Control Register
                cmpa    byte_154
                bne     loc_97BB
                bset    <byte_4B $20 ; ' '
                bra     loc_97BE
; ---------------------------------------------------------------------------

loc_97BB:                               ; CODE XREF: sub_96AC+108↑j
                bclr    <byte_4B $20 ; ' '

loc_97BE:                               ; CODE XREF: sub_96AC+10D↑j
                staa    byte_154
                ldaa    <byte_F1
                oraa    #$80
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                bra     loc_97FD
; ---------------------------------------------------------------------------

loc_97CC:                               ; DATA XREF: RESERVED:96A6↑o
                ldaa    ADR1            ; A_D Result Register 1
                ldab    #$10
                stab    ADCTL           ; A_D Control Register
                cli
                staa    byte_156
                brclr   <byte_4B $20 loc_97FD ; ' '
                ldab    <byte_4A
                bitb    #3
                bne     loc_97FD
                jsr     sub_EB4A
                jsr     sub_E88B
                bra     loc_97FD
; ---------------------------------------------------------------------------

loc_97EA:                               ; DATA XREF: RESERVED:96A8↑o
                ldaa    <byte_F1
                anda    #$7F
                brclr   <byte_4B 8 loc_97F6
                oraa    #$10
                bra     loc_97F8
; ---------------------------------------------------------------------------

loc_97F6:                               ; CODE XREF: sub_96AC+142↑j
                anda    #$EF

loc_97F8:                               ; CODE XREF: sub_96AC+148↑j
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3

loc_97FD:                               ; CODE XREF: sub_96AC+D1↑j
                                        ; sub_96AC+E2↑j ...
                ldab    #$10
                stab    ADCTL           ; A_D Control Register
                cli
                rts
; End of function sub_96AC

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR __RESET

loc_9804:                               ; CODE XREF: __RESET+56B↑J
                                        ; __RESET+83C↓J
                jsr     sub_96AC
                jsr     sub_CA82
                jsr     sub_EBC9
                nop
                nop
                nop
                nop
                jsr     sub_CE79
                jsr     sub_ED72
                jsr     sub_EFEC
                jsr     sub_F2FA
                jsr     sub_EEA7
                jsr     sub_E7DE
                jsr     sub_E0ED
                jsr     sub_CE39
                jsr     sub_EA4A
                jsr     sub_EACA
                jsr     sub_E9A1
                jsr     sub_CDF1
                jsr     sub_C97D
                ldaa    byte_8019
                bita    #$40 ; '@'
                bne     loc_9844
                bclr    <byte_5D 8
                bra     loc_9856
; ---------------------------------------------------------------------------

loc_9844:                               ; CODE XREF: __RESET+70F↑j
                jsr     sub_BE83
                jsr     sub_C1F5
                jsr     sub_D61C
                jsr     sub_BBCE
                jsr     sub_BCC3
                jsr     sub_BD64

loc_9856:                               ; CODE XREF: __RESET+714↑j
                ldaa    byte_8019
                bita    #$80
                bne     loc_9862
                bclr    <byte_5D 4
                bra     loc_9871
; ---------------------------------------------------------------------------

loc_9862:                               ; CODE XREF: __RESET+72D↑j
                jsr     sub_C574
                jsr     sub_C8E3
                jsr     sub_C2B7
                jsr     sub_C3AC
                jsr     sub_C455

loc_9871:                               ; CODE XREF: __RESET+732↑j
                ldaa    <byte_5D
                anda    #$C
                bne     loc_987A
                bclr    <byte_51 $40 ; '@'

loc_987A:                               ; CODE XREF: __RESET+747↑j
                jsr     sub_B554
                jsr     sub_D6A4
                jsr     sub_D9D7
                jsr     sub_DB41
                jsr     sub_E978
                jsr     sub_DEE3
                jsr     sub_CD14
                jsr     sub_B22F
                brclr   <byte_B4 $10 loc_989B
                jsr     sub_CFA0
                bra     loc_989F
; ---------------------------------------------------------------------------

loc_989B:                               ; CODE XREF: __RESET+764↑j
                brclr   <byte_52 2 loc_98B1

loc_989F:                               ; CODE XREF: __RESET+76B↑j
                jsr     sub_D0D2
                jsr     sub_CEF4
                jsr     loc_CFC8
                jsr     sub_CF6B
                jsr     sub_D074
                jsr     sub_D019

loc_98B1:                               ; CODE XREF: __RESET:loc_989B↑j
                ldaa    <byte_65
                anda    #$3F ; '?'
                bne     loc_98BA
                jsr     sub_CD65

loc_98BA:                               ; CODE XREF: __RESET+787↑j
                ldaa    <byte_65
                bne     loc_98C4
                jsr     sub_F57B
                jsr     sub_B054

loc_98C4:                               ; CODE XREF: __RESET+78E↑j
                ldaa    <byte_65
                lsra
                bcc     loc_98D9
                lsra
                bcc     loc_98D7
                jsr     sub_A703
                jsr     sub_CD20
                jsr     sub_B10D
                bra     loc_98E8
; ---------------------------------------------------------------------------

loc_98D7:                               ; CODE XREF: __RESET+79C↑j
                bra     loc_98E8
; ---------------------------------------------------------------------------

loc_98D9:                               ; CODE XREF: __RESET+799↑j
                jsr     sub_D4F8
                jsr     sub_D457
                jsr     sub_F471
                jsr     sub_DDDE
                jsr     sub_D564

loc_98E8:                               ; CODE XREF: __RESET+7A7↑j
                                        ; __RESET:loc_98D7↑j
                jsr     sub_DC08
                jsr     sub_B800
                jsr     sub_CB52
                jsr     sub_CC8F
                jsr     sub_AF7A
                ldaa    <byte_6B
                cmpa    #$7D ; '}'
                bcc     loc_991F
                jsr     sub_A7FD
                jsr     sub_A6C6
                jsr     sub_A867
                jsr     sub_A4F6
                jsr     sub_A825
                jsr     sub_A544
                ldaa    byte_8019
                bita    #$80
                beq     loc_9919
                jsr     sub_A605

loc_9919:                               ; CODE XREF: __RESET+7E6↑j
                jsr     sub_F644
                jsr     sub_A730

loc_991F:                               ; CODE XREF: __RESET+7CD↑j
                jsr     sub_ED93
                jsr     sub_A0F1
                jsr     sub_9981
                jsr     sub_9BF3
                jsr     sub_9E01
                jsr     sub_A35F
                jsr     sub_A2BC
                jsr     sub_CA13
                jsr     sub_B07D
                brset   <byte_4E $40 loc_9954 ; '@'
                sei
                ldaa    byte_177
                bne     loc_9954
                ldd     <byte_0
                cli
                coma
                cba
                beq     loc_9954
                jsr     sub_F506
                ldd     <byte_9
                tba
                comb
                std     <byte_0

loc_9954:                               ; CODE XREF: __RESET+80C↑j
                                        ; __RESET+814↑j ...
                cli
                jsr     sub_F351

loc_9958:                               ; CODE XREF: __RESET+834↓j
                ldd     TCNTH           ; Timer Counter Register
                subd    word_14C
                cpd     #$ABE
                bcs     loc_9958
                ldd     TCNTH           ; Timer Counter Register
                std     word_14C
                jmp     loc_9804
; END OF FUNCTION CHUNK FOR __RESET
; ---------------------------------------------------------------------------
byte_996D:      fcb 0                   ; DATA XREF: sub_9981+61↓o
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


sub_9981:                               ; CODE XREF: __RESET+7F7↑P
                jsr     sub_AA7C
                jsr     sub_AB71
                ldab    <byte_FA
                bitb    #$C0
                bne     locret_99EC
                ldaa    BAUD            ; SCI Baud Rate Control 3
                anda    #$37 ; '7'
                cmpa    #$22 ; '"'
                beq     loc_999C
                ldaa    #$22 ; '"'
                staa    BAUD            ; SCI Baud Rate Control 3
                rts
; ---------------------------------------------------------------------------

loc_999C:                               ; CODE XREF: sub_9981+13↑j
                ldaa    SCSR            ; Serial Communications Status Register
                bita    #$E
                beq     loc_99A7
                ldaa    SCDR            ; SCI Data (Read RDR, Write TDR)
                rts
; ---------------------------------------------------------------------------

loc_99A7:                               ; CODE XREF: sub_9981+20↑j
                bita    #$20 ; ' '
                bne     loc_99BE
                brset   <byte_FA $F loc_99B3
                incb
                stab    <byte_FA
                rts
; ---------------------------------------------------------------------------

loc_99B3:                               ; CODE XREF: sub_9981+2A↑j
                brclr   <byte_FA $30 locret_99BD ; '0'
                bclr    <byte_FA $30 ; '0'
                clr     byte_F7

locret_99BD:                            ; CODE XREF: sub_9981:loc_99B3↑j
                rts
; ---------------------------------------------------------------------------

loc_99BE:                               ; CODE XREF: sub_9981+28↑j
                ldaa    SCDR            ; SCI Data (Read RDR, Write TDR)
                staa    SCDR            ; SCI Data (Read RDR, Write TDR)
                andb    #$F0
                stab    <byte_FA
                bitb    #$30 ; '0'
                bne     loc_99ED
                staa    <byte_F7
                cmpa    #$14
                beq     loc_99D5
                bclr    <byte_50 8

loc_99D5:                               ; CODE XREF: sub_9981+4F↑j
                clr     byte_F8
                clr     byte_F9
                tab
                subb    #$10
                cmpb    #$14
                bcc     locret_99EC
                ldx     #byte_996D
                abx
                ldab    0,x
                orab    <byte_FA
                stab    <byte_FA

locret_99EC:                            ; CODE XREF: sub_9981+A↑j
                                        ; sub_9981+5F↑j
                rts
; ---------------------------------------------------------------------------

loc_99ED:                               ; CODE XREF: sub_9981+49↑j
                bitb    #$20 ; ' '
                beq     loc_99F4
                jmp     loc_9A0F
; ---------------------------------------------------------------------------

loc_99F4:                               ; CODE XREF: sub_9981+6E↑j
                bitb    #$10
                bne     loc_99FB
                jmp     loc_9A2C
; ---------------------------------------------------------------------------

loc_99FB:                               ; CODE XREF: sub_9981+75↑j
                staa    <byte_F9
                andb    #$CF
                stab    <byte_FA
                rts
; ---------------------------------------------------------------------------

loc_9A02:                               ; DATA XREF: RESERVED:9BD5↓o
                clr     byte_F7
                ldab    <byte_F9
                ldaa    <byte_F8
                xgdx
                ldaa    0,x

loc_9A0C:                               ; CODE XREF: RESERVED:9A58↓j
                                        ; RESERVED:9A5B↓j
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9A0F:                               ; CODE XREF: sub_9981+70↑J
                staa    <byte_F8
                andb    #$DF
                stab    <byte_FA
                ldab    <byte_F7
                cpd     #TIC3H          ; Input Capture 3 Register
                bne     loc_9A35
                brset   <byte_4A $80 loc_9A2C
                brset   <byte_4F 1 loc_9A3A
                brclr   <byte_4D $10 loc_9A3A
                bclr    <byte_4D $80

loc_9A2C:                               ; CODE XREF: sub_9981+77↑J
                                        ; sub_9981+9C↑j
                clr     byte_F7
                clr     byte_F8
                clr     byte_F9

loc_9A35:                               ; CODE XREF: sub_9981+9A↑j
                bclr    <byte_50 8
                bra     locret_9A3D
; ---------------------------------------------------------------------------

loc_9A3A:                               ; CODE XREF: sub_9981+A0↑j
                                        ; sub_9981+A4↑j
                bset    <byte_50 8

locret_9A3D:                            ; CODE XREF: sub_9981+B7↑j
                rts
; End of function sub_9981

; ---------------------------------------------------------------------------

loc_9A3E:                               ; DATA XREF: RESERVED:9BE3↓o
                clr     byte_F7
                brset   <byte_4E $40 loc_9A5A ; '@'
                brset   <byte_4E $20 loc_9A5A ; ' '
                bset    <byte_4E $40 ; '@'
                ldaa    <byte_F9
                staa    byte_162
                ldab    <byte_F8
                stab    byte_161
                ldaa    #$E2
                bra     loc_9A0C
; ---------------------------------------------------------------------------

loc_9A5A:                               ; CODE XREF: RESERVED:9A41↑j
                                        ; RESERVED:9A45↑j
                clra
                bra     loc_9A0C
; ---------------------------------------------------------------------------

loc_9A5D:                               ; DATA XREF: RESERVED:9BE5↓o
                ldx     #0
                bra     loc_9A85
; ---------------------------------------------------------------------------

loc_9A62:                               ; DATA XREF: RESERVED:9BE7↓o
                ldx     #CountdownTimerFromKeyOn
                bra     loc_9A85
; ---------------------------------------------------------------------------

loc_9A67:                               ; DATA XREF: RESERVED:9BE9↓o
                ldx     #byte_48E
                ldaa    <byte_F8
                bne     loc_9A82
                ldab    <byte_F9
                abx
                cpx     #unk_4D0
                bcs     loc_9A82
                ldaa    #$FF
                staa    byte_48E

loc_9A7B:                               ; CODE XREF: RESERVED:9AAD↓j
                                        ; RESERVED:9AE6↓j
                clr     byte_F7
                clra
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9A82:                               ; CODE XREF: RESERVED:9A6C↑j
                                        ; RESERVED:9A74↑j
                ldx     #byte_48E

loc_9A85:                               ; CODE XREF: RESERVED:9A60↑j
                                        ; RESERVED:9A65↑j
                clr     byte_F7
                ldab    <byte_F8
                ldaa    <byte_F9
                abx
                staa    0,x
                ldaa    #$E5
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9A94:                               ; DATA XREF: RESERVED:9BEB↓o
                ldx     #byte_48E
                ldab    <byte_F9
                cmpb    1,x
                beq     loc_9AA2
                comb
                cmpb    1,x
                bne     loc_9ACD

loc_9AA2:                               ; CODE XREF: RESERVED:9A9B↑j
                ldab    <byte_F8
                cmpb    0,x
                bne     loc_9AD1
                abx
                ldaa    1,x
                cmpa    #$39 ; '9'
                bne     loc_9A7B
                ldx     #byte_48E
                clra

loc_9AB3:                               ; CODE XREF: RESERVED:9AB7↓j
                inx
                adda    1,x
                decb
                bne     loc_9AB3
                cmpa    <byte_F9
                beq     loc_9AC6
                ldab    <byte_F9
                comb
                cba
                bne     loc_9ACD
                jmp     unk_490
; ---------------------------------------------------------------------------

loc_9AC6:                               ; CODE XREF: RESERVED:9ABB↑j
                com     byte_F9
                ldaa    #$E4
                bra     loc_9B06
; ---------------------------------------------------------------------------

loc_9ACD:                               ; CODE XREF: RESERVED:9AA0↑j
                                        ; RESERVED:9AC1↑j
                ldaa    #1
                bra     loc_9AD7
; ---------------------------------------------------------------------------

loc_9AD1:                               ; CODE XREF: RESERVED:9AA6↑j
                                        ; RESERVED:9AEC↓j
                ldaa    #2
                bra     loc_9AD7
; ---------------------------------------------------------------------------

loc_9AD5:                               ; CODE XREF: RESERVED:9AF4↓j
                ldaa    #3

loc_9AD7:                               ; CODE XREF: RESERVED:9ACF↑j
                                        ; RESERVED:9AD3↑j
                clr     byte_F7
                bra     loc_9B06
; ---------------------------------------------------------------------------

loc_9ADC:                               ; DATA XREF: RESERVED:9BED↓o
                ldaa    <byte_F8
                bne     loc_9AE8
                bclr    <byte_52 1
                bclr    <byte_49 1
                bra     loc_9A7B
; ---------------------------------------------------------------------------

loc_9AE8:                               ; CODE XREF: RESERVED:9ADE↑j
                ldaa    <byte_F9
                bne     loc_9B10
                brset   <byte_4A $80 loc_9AD1
                brset   <byte_4F 1 loc_9AF8
                brset   <byte_4D $10 loc_9AD5

loc_9AF8:                               ; CODE XREF: RESERVED:9AF0↑j
                coma
                staa    <byte_F9
                ldaa    <byte_F8
                cmpa    #1
                bne     loc_9B09
                ldaa    #1
                bset    <byte_52 1

loc_9B06:                               ; CODE XREF: RESERVED:9ACB↑j
                                        ; RESERVED:9ADA↑j ...
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9B09:                               ; CODE XREF: RESERVED:9AFF↑j
                ldaa    #$10
                bset    <byte_49 1
                bra     loc_9B06
; ---------------------------------------------------------------------------

loc_9B10:                               ; CODE XREF: RESERVED:9AEA↑j
                brset   <byte_4A $80 loc_9B1C
                brset   <byte_4F 1 locret_9B1F
                brclr   <byte_4D $10 locret_9B1F

loc_9B1C:                               ; CODE XREF: RESERVED:loc_9B10↑j
                                        ; RESERVED:9B34↓j
                clr     byte_F7

locret_9B1F:                            ; CODE XREF: RESERVED:9B14↑j
                                        ; RESERVED:9B18↑j
                rts
; ---------------------------------------------------------------------------

loc_9B20:                               ; DATA XREF: RESERVED:9BEF↓o
                ldaa    <byte_F9
                beq     loc_9B4F
                ldaa    <byte_F8
                cmpa    #1
                beq     loc_9B3A
                cmpa    #2
                beq     loc_9B3E
                cmpa    #3
                beq     loc_9B42
                cmpa    #4
                bne     loc_9B1C
                ldd     <byte_84
                bra     loc_9B44
; ---------------------------------------------------------------------------

loc_9B3A:                               ; CODE XREF: RESERVED:9B28↑j
                ldd     <byte_6B
                bra     loc_9B44
; ---------------------------------------------------------------------------

loc_9B3E:                               ; CODE XREF: RESERVED:9B2C↑j
                ldd     <byte_82
                bra     loc_9B44
; ---------------------------------------------------------------------------

loc_9B42:                               ; CODE XREF: RESERVED:9B30↑j
                ldd     <byte_80

loc_9B44:                               ; CODE XREF: RESERVED:9B38↑j
                                        ; RESERVED:9B3C↑j ...
                stab    FDRVar0
                jsr     sub_9CA1
                ldaa    FDRVar0
                bra     loc_9B06
; ---------------------------------------------------------------------------

loc_9B4F:                               ; CODE XREF: RESERVED:9B22↑j
                coma
                staa    <byte_F9
                rts
; ---------------------------------------------------------------------------

loc_9B53:                               ; DATA XREF: RESERVED:9BF1↓o
                clr     byte_F7
                ldab    byte_116
                cmpb    #$50 ; 'P'
                bls     loc_9B5F
                bra     loc_9B63
; ---------------------------------------------------------------------------

loc_9B5F:                               ; CODE XREF: RESERVED:9B5B↑j
                clra
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9B63:                               ; CODE XREF: RESERVED:9B5D↑j
                ldaa    <byte_F8
                cmpa    #1
                beq     loc_9B7A
                cmpa    #2
                beq     loc_9B8B
                cmpa    #3
                beq     loc_9B9D
                cmpa    #4
                beq     loc_9BA9
                ldaa    #1
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9B7A:                               ; CODE XREF: RESERVED:9B67↑j
                brclr   <byte_4E $40 loc_9B83 ; '@'
                ldaa    #2
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9B83:                               ; CODE XREF: RESERVED:loc_9B7A↑j
                jsr     sub_9BB0

loc_9B86:                               ; CODE XREF: RESERVED:9B9B↓j
                                        ; RESERVED:9BA6↓J ...
                ldaa    #$F0
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9B8B:                               ; CODE XREF: RESERVED:9B6B↑j
                clra
                staa    <byte_9C
                staa    <byte_9D
                ldx     #$C

loc_9B93:                               ; CODE XREF: RESERVED:9B99↓j
                staa    0,x
                inx
                cpx     #$39 ; '9'
                bcs     loc_9B93
                bra     loc_9B86
; ---------------------------------------------------------------------------

loc_9B9D:                               ; CODE XREF: RESERVED:9B6F↑j
                sei
                bset    <byte_4 $40 ; '@'
                ldaa    #$DF
                staa    <byte_5
                cli
                jmp     loc_9B86
; ---------------------------------------------------------------------------

loc_9BA9:                               ; CODE XREF: RESERVED:9B73↑j
                ldaa    byte_801E
                staa    <byte_3
                bra     loc_9B86

; =============== S U B R O U T I N E =======================================


sub_9BB0:                               ; CODE XREF: RESERVED:loc_9B83↑P
                                        ; RESERVED:9C4B↓P ...
                clra
                clrb
                std     <byte_3D
                std     <byte_3F
                std     <byte_41
                std     <byte_43
                std     <byte_45
                staa    <byte_47
                std     <byte_F2
                std     <byte_F4
                staa    <byte_F6
                staa    byte_168
                jsr     sub_F506
                rts
; End of function sub_9BB0

; ---------------------------------------------------------------------------
off_9BCB:       fdb loc_9CAA            ; DATA XREF: sub_9BF3+10↓o
                fdb loc_9CD6
                fdb loc_9CE8
                fdb loc_9C5D
                fdb locret_9CFA
                fdb loc_9A02
                fdb loc_9D02
                fdb loc_9C1E
                fdb locret_9CFA
                fdb locret_9CFA
                fdb locret_9CFA
                fdb loc_9CFB
                fdb loc_9A3E
                fdb loc_9A5D
                fdb loc_9A62
                fdb loc_9A67
                fdb loc_9A94
                fdb loc_9ADC
                fdb loc_9B20
                fdb loc_9B53

; =============== S U B R O U T I N E =======================================


sub_9BF3:                               ; CODE XREF: __RESET+7FA↑P
                ldaa    <byte_FA
                bita    #$30 ; '0'
                beq     loc_9BFA
                rts
; ---------------------------------------------------------------------------

loc_9BFA:                               ; CODE XREF: sub_9BF3+4↑j
                ldaa    <byte_F7
                beq     locret_9C1D
                cmpa    #$A
                beq     locret_9C1D
                tab
                ldx     #off_9BCB
                subb    #$10
                bcs     loc_9C14
                aslb
                cmpb    #$28 ; '('
                bcc     loc_9C14
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_9C14:                               ; CODE XREF: sub_9BF3+15↑j
                                        ; sub_9BF3+1A↑j
                bclr    <byte_FA $30 ; '0'
                clra
                staa    <byte_F7
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

locret_9C1D:                            ; CODE XREF: sub_9BF3+9↑j
                                        ; sub_9BF3+D↑j
                rts
; End of function sub_9BF3

; ---------------------------------------------------------------------------

loc_9C1E:                               ; DATA XREF: RESERVED:9BD9↑o
                clra
                ldab    byte_116
                cmpb    #$50 ; 'P'
                bhi     loc_9C2E
                staa    <byte_F7
                bclr    <byte_FA $30 ; '0'
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9C2E:                               ; CODE XREF: RESERVED:9C24↑j
                ldab    <byte_FA
                andb    #$F
                cmpb    #3
                bls     loc_9C39
                clr     word_119+1

loc_9C39:                               ; CODE XREF: RESERVED:9C34↑j
                ldaa    word_119+1
                inca
                cmpa    #$18
                bls     loc_9C53
                brset   <byte_4E $40 loc_9C56 ; '@'
                clra
                staa    <byte_F7
                staa    word_119+1
                jsr     sub_9BB0
                ldaa    #$E0
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9C53:                               ; CODE XREF: RESERVED:9C3F↑j
                staa    word_119+1

loc_9C56:                               ; CODE XREF: RESERVED:9C41↑j
                ldd     #$FF00
                stab    <byte_F7
                bra     sub_9CA1
; ---------------------------------------------------------------------------

loc_9C5D:                               ; DATA XREF: RESERVED:9BD1↑o
                ldab    byte_116
                cmpb    #$50 ; 'P'
                bls     loc_9C90
                ldaa    <byte_F8
                asla
                bcs     loc_9C90
                cmpa    #$4E ; 'N'
                bhi     loc_9C90
                ldx     #loc_9D5C
                ldab    <byte_F8
                aslb
                abx
                ldd     0,x
                cpd     #$A016
                beq     loc_9C90
                ldaa    <byte_F8
                brset   <byte_4F 1 loc_9C88
                cmpa    #$17
                beq     loc_9C90
                bra     loc_9C95
; ---------------------------------------------------------------------------

loc_9C88:                               ; CODE XREF: RESERVED:9C7E↑j
                cmpa    #$F
                beq     loc_9C90
                cmpa    #$16
                bne     loc_9C95

loc_9C90:                               ; CODE XREF: RESERVED:9C62↑j
                                        ; RESERVED:9C67↑j ...
                clra
                staa    <byte_F7
                staa    <byte_F8

loc_9C95:                               ; CODE XREF: RESERVED:9C86↑j
                                        ; RESERVED:9C8E↑j
                cmpa    byte_128
                beq     sub_9CA1
                staa    byte_128
                ldab    #2
                stab    <byte_64

; =============== S U B R O U T I N E =======================================


sub_9CA1:                               ; CODE XREF: sub_9981:loc_9A0C↑J
                                        ; RESERVED:9A7F↑J ...
                ldab    SCSR            ; Serial Communications Status Register
                bpl     sub_9CA1
                staa    SCDR            ; SCI Data (Read RDR, Write TDR)
                rts
; End of function sub_9CA1

; ---------------------------------------------------------------------------

loc_9CAA:                               ; DATA XREF: RESERVED:off_9BCB↑o
                ldx     #$3D ; '='
                ldab    <byte_F8
                cmpb    #7
                bhi     loc_9CC0
                negb
                addb    #7
                abx
                inc     byte_F8
                ldaa    0,x
                beq     loc_9CC0
                bra     sub_9CA1
; ---------------------------------------------------------------------------

loc_9CC0:                               ; CODE XREF: RESERVED:9CB1↑j
                                        ; RESERVED:9CBC↑j
                clr     byte_F7
                ldaa    #$FE
                bsr     sub_9CA1
                adda    #$10
                ldx     #$3C ; '<'

loc_9CCC:                               ; CODE XREF: RESERVED:9CD4↓j
                inx
                cpx     #$45 ; 'E'
                bcc     sub_9CA1
                adda    0,x
                bra     loc_9CCC
; ---------------------------------------------------------------------------

loc_9CD6:                               ; DATA XREF: RESERVED:9BCD↑o
                ldaa    byte_124
                brclr   <byte_F8 $FF loc_9CE3
                ldaa    byte_125
                clr     byte_F7

loc_9CE3:                               ; CODE XREF: RESERVED:9CD9↑j
                inc     byte_F8
                bra     sub_9CA1
; ---------------------------------------------------------------------------

loc_9CE8:                               ; DATA XREF: RESERVED:9BCF↑o
                bset    <byte_FA $80
                clr     byte_F7

loc_9CEE:                               ; CODE XREF: RESERVED:9CF3↓j
                ldaa    SCSR            ; Serial Communications Status Register
                bita    #$40 ; '@'
                beq     loc_9CEE
                ldaa    #1
                staa    BAUD            ; SCI Baud Rate Control 3

locret_9CFA:                            ; DATA XREF: RESERVED:9BD3↑o
                                        ; RESERVED:9BDB↑o ...
                rts
; ---------------------------------------------------------------------------

loc_9CFB:                               ; DATA XREF: RESERVED:9BE1↑o
                bset    <byte_FA $40 ; '@'
                clr     byte_F7
                rts
; ---------------------------------------------------------------------------

loc_9D02:                               ; DATA XREF: RESERVED:9BD7↑o
                ldaa    <byte_F8
                cmpa    #$80
                beq     loc_9D14
                cmpa    #$81
                beq     loc_9D3F
                cmpa    #$82
                beq     loc_9D44
                clr     byte_F7
                rts
; ---------------------------------------------------------------------------

loc_9D14:                               ; CODE XREF: RESERVED:9D06↑j
                ldx     #byte_8002
                brclr   <byte_5B $80 loc_9D1E
                ldx     #byte_8007

loc_9D1E:                               ; CODE XREF: RESERVED:9D17↑j
                                        ; RESERVED:9D42↓j
                ldab    <byte_F9
                cmpb    #4
                beq     loc_9D2D
                inc     byte_F9
                abx
                ldaa    0,x
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9D2D:                               ; CODE XREF: RESERVED:9D22↑j
                ldaa    0,x
                adda    1,x
                adda    2,x
                adda    3,x

loc_9D35:                               ; CODE XREF: RESERVED:9D59↓j
                adda    #$16
                adda    <byte_F8
                clr     byte_F7

loc_9D3C:                               ; CODE XREF: RESERVED:9D55↓j
                                        ; RESERVED:loc_9D5C↓j
                jmp     sub_9CA1
; ---------------------------------------------------------------------------

loc_9D3F:                               ; CODE XREF: RESERVED:9D0A↑j
                ldx     #byte_800D
                bra     loc_9D1E
; ---------------------------------------------------------------------------

loc_9D44:                               ; CODE XREF: RESERVED:9D0E↑j
                inc     byte_F9
                ldaa    byte_8006
                brclr   <byte_5B $80 loc_9D51
                ldaa    byte_800B

loc_9D51:                               ; CODE XREF: RESERVED:9D4A↑j
                ldab    <byte_F9
                cmpb    #1
                beq     loc_9D3C
                cmpb    #5
                bcc     loc_9D35
                clra

loc_9D5C:                               ; DATA XREF: RESERVED:9C6D↑o
                                        ; sub_9E01:loc_9E2A↓o
                bra     loc_9D3C
; ---------------------------------------------------------------------------
                fdb loc_9F14
                fdb loc_A016
                fdb loc_A016
                fdb loc_9FE1
                fdb loc_9FDC
                fdb loc_9FD7
                fdb loc_9EA8
                fdb loc_A016
                fdb loc_9E7E
                fdb loc_9E53
                fdb loc_9E47
                fdb loc_9E33
                fdb loc_9EF0
                fdb loc_A00B
                fdb loc_9E8D
                fdb loc_9E72
                fdb loc_A016
                fdb loc_A016
                fdb loc_A016
                fdb loc_9EB6
                fdb loc_A016
                fdb loc_9E99
                fdb loc_9E8D
                fdb loc_A016
                fdb loc_A016
                fdb loc_A016
                fdb loc_A016
                fdb loc_9E6C
                fdb loc_9FD2
                fdb loc_9F95
                fdb loc_9F65
                fdb loc_A016
                fdb loc_A016
                fdb loc_A016
                fdb loc_A016
                fdb loc_A016
                fdb loc_9F5C
                fdb loc_9F4B
byte_9DAA:      fcb $A0
byte_9DAB:      fcb $16                 ; DATA XREF: sub_9E01+22E↓o
                fcb 0
                fcb $70
                fcb 0
                fcb 0
                fcb $72
                fcb $74
                fcb $75
                fcb 3
                fcb 0
                fcb $76
                fcb $6D
                fcb 5
                fcb $1C
                fcb $9C
                fcb 8
                fcb $6B
                fcb $6B
                fcb 0
                fcb $45
                fcb 0
                fcb $6A
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb $6F
                fcb $73
                fcb $FF
                fcb $46
                fcb $47
                fcb $61
                fcb 0
                fcb $67
                fcb $7E
                fcb $7D
                fcb   0
                fcb   0
                fcb $FB
                fcb   0
                fcb   0
                fcb $97
                fcb   0
                fcb   0
                fcb $7F ; 
                fcb   0
                fcb $71 ; q
                fcb   0
                fcb $9D
                fcb   0
                fcb   0
                fcb   0
                fcb   0
                fcb $33 ; 3
                fcb   0
                fcb   0
                fcb   0
                fcb   0
                fcb $96
off_9DE7:       fdb loc_A085            ; DATA XREF: sub_9E01+247↓o
                fdb loc_A096
                fdb loc_A09A
                fdb loc_A0AF
                fdb loc_A0B2
                fdb loc_A0B5
                fdb loc_A0BF
                fdb loc_A0D7
off_9DF7:       fdb loc_A0DC            ; DATA XREF: sub_9E01:loc_A050↓o
                fdb loc_A060
                fdb loc_A074
                fdb loc_A078
                fdb loc_A07E

; =============== S U B R O U T I N E =======================================


sub_9E01:                               ; CODE XREF: __RESET+7FD↑P
                ldaa    byte_116
                cmpa    #$50 ; 'P'
                bhi     loc_9E0B
                clr     byte_128

loc_9E0B:                               ; CODE XREF: sub_9E01+5↑j
                ldab    byte_128
                bne     loc_9E13
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9E13:                               ; CODE XREF: sub_9E01+D↑j
                ldaa    <byte_64
                cmpa    #$96
                bcs     loc_9E2A
                clrb
                ldaa    <byte_F7
                cmpa    #$13
                bne     loc_9E24
                stab    <byte_F7
                stab    <byte_F8

loc_9E24:                               ; CODE XREF: sub_9E01+1D↑j
                clr     byte_128
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9E2A:                               ; CODE XREF: sub_9E01+16↑j
                ldx     #loc_9D5C
                aslb
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_9E33:                               ; DATA XREF: RESERVED:9D74↑o
                ldaa    <byte_F0
                oraa    #$C0
                ldab    <byte_65
                cmpb    #$55 ; 'U'
                bcs     loc_9E88
                anda    #$3F ; '?'
                cmpb    #$AA
                bcs     loc_9E88
                oraa    #$80
                bra     loc_9E88
; ---------------------------------------------------------------------------

loc_9E47:                               ; DATA XREF: RESERVED:9D72↑o
                ldaa    <byte_F0
                oraa    #$20 ; ' '
                brset   <byte_65 $80 loc_9E88
                anda    #$DF
                bra     loc_9E88
; ---------------------------------------------------------------------------

loc_9E53:                               ; DATA XREF: RESERVED:9D70↑o
                ldaa    TCTL1           ; Timer Control Register 1
                anda    #$FE
                staa    TCTL1           ; Timer Control Register 1
                ldaa    #8
                staa    CFORC           ; Timer Compare Force Register
                ldaa    <byte_F0
                oraa    #$10
                brset   <byte_65 $80 loc_9E88
                anda    #$EF
                bra     loc_9E88
; ---------------------------------------------------------------------------

loc_9E6C:                               ; DATA XREF: RESERVED:9D94↑o
                ldaa    <byte_F0
                anda    #$EF
                bra     loc_9E88
; ---------------------------------------------------------------------------

loc_9E72:                               ; DATA XREF: RESERVED:9D7C↑o
                ldaa    <byte_F0
                oraa    #2
                brset   <byte_65 $80 loc_9E88
                anda    #$FD
                bra     loc_9E88
; ---------------------------------------------------------------------------

loc_9E7E:                               ; DATA XREF: RESERVED:9D6E↑o
                ldaa    <byte_F0
                oraa    #1
                brset   <byte_65 $80 loc_9E88
                anda    #$FE

loc_9E88:                               ; CODE XREF: sub_9E01+3A↑j
                                        ; sub_9E01+40↑j ...
                staa    <byte_F0
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9E8D:                               ; DATA XREF: RESERVED:9D7A↑o
                                        ; RESERVED:9D8A↑o
                ldaa    <byte_EF
                oraa    #$20 ; ' '
                brset   <byte_65 $80 loc_9EA3
                anda    #$DF
                bra     loc_9EA3
; ---------------------------------------------------------------------------

loc_9E99:                               ; DATA XREF: RESERVED:9D88↑o
                ldaa    <byte_EF
                oraa    #$10
                brset   <byte_65 $80 loc_9EA3
                anda    #$EF

loc_9EA3:                               ; CODE XREF: sub_9E01+90↑j
                                        ; sub_9E01+96↑j ...
                staa    <byte_EF
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9EA8:                               ; CODE XREF: sub_9E01+ED↓j
                                        ; DATA XREF: RESERVED:9D6A↑o
                ldaa    #$10
                brset   <byte_65 $80 loc_9EB0
                ldaa    #$70 ; 'p'

loc_9EB0:                               ; CODE XREF: sub_9E01+A9↑j
                staa    byte_111
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9EB6:                               ; DATA XREF: RESERVED:9D84↑o
                ldd     <byte_EF
                oraa    #$10
                brset   <byte_4F 1 loc_9EC0
                oraa    #$20 ; ' '

loc_9EC0:                               ; CODE XREF: sub_9E01+B9↑j
                brset   <byte_4F 8 loc_9EC8
                orab    #$EB
                bra     loc_9ECA
; ---------------------------------------------------------------------------

loc_9EC8:                               ; CODE XREF: sub_9E01:loc_9EC0↑j
                orab    #$E7

loc_9ECA:                               ; CODE XREF: sub_9E01+C5↑j
                brset   <byte_55 $10 loc_9ED0
                orab    #$10

loc_9ED0:                               ; CODE XREF: sub_9E01:loc_9ECA↑j
                brset   <byte_65 $80 loc_9EEC
                anda    #$EF
                brset   <byte_4F 1 loc_9EDC
                anda    #$DF

loc_9EDC:                               ; CODE XREF: sub_9E01+D5↑j
                brset   <byte_4F 8 loc_9EE4
                andb    #$14
                bra     loc_9EE6
; ---------------------------------------------------------------------------

loc_9EE4:                               ; CODE XREF: sub_9E01:loc_9EDC↑j
                andb    #$18

loc_9EE6:                               ; CODE XREF: sub_9E01+E1↑j
                brset   <byte_55 $10 loc_9EEC
                andb    #$EF

loc_9EEC:                               ; CODE XREF: sub_9E01:loc_9ED0↑j
                                        ; sub_9E01:loc_9EE6↑j
                std     <byte_EF
                bra     loc_9EA8
; ---------------------------------------------------------------------------

loc_9EF0:                               ; DATA XREF: RESERVED:9D76↑o
                bclr    <byte_F0 $10
                ldx     #SwitchPortAccessReg1
                sei
                ldaa    SwitchPortAccessReg1
                anda    #$FB
                brset   <byte_65 $80 loc_9F02
                oraa    #4

loc_9F02:                               ; CODE XREF: sub_9E01+FB↑j
                staa    SwitchPortAccessReg1
                bset    2,x 4
                ldaa    #$14

loc_9F0A:                               ; CODE XREF: sub_9E01+10A↓j
                deca
                bne     loc_9F0A
                bclr    2,x 4
                cli
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F14:                               ; DATA XREF: RESERVED:9D5E↑o
                bclr    <byte_F0 $10
                ldab    <byte_65
                aslb
                beq     loc_9F1F
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F1F:                               ; CODE XREF: sub_9E01+119↑j
                sei
                ldaa    TCTL1           ; Timer Control Register 1
                oraa    #3
                staa    TCTL1           ; Timer Control Register 1
                ldab    #8
                stab    CFORC           ; Timer Compare Force Register
                ldd     TCNTH           ; Timer Counter Register
                addd    #$6D6
                std     TCO5H           ; Output Compare 5 Register
                ldaa    TCTL1           ; Timer Control Register 1
                anda    #$FE
                staa    TCTL1           ; Timer Control Register 1
                cli
                jmp     loc_A016
; ---------------------------------------------------------------------------
byte_9F42:      fcb $40                 ; DATA XREF: sub_9E01+1A0↓o
                fcb $40
                fcb $BF
byte_9F45:      fcb $10                 ; DATA XREF: sub_9E01+174↓o
                fcb $20
                fcb $EF
byte_9F48:      fcb 4                   ; DATA XREF: sub_9E01+154↓o
                fcb $10
                fcb $FB
; ---------------------------------------------------------------------------

loc_9F4B:                               ; DATA XREF: RESERVED:9DA8↑o
                brset   <byte_4F $10 loc_9F52
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F52:                               ; CODE XREF: sub_9E01:loc_9F4B↑j
                ldx     #TOC4H          ; Output Compare 4 Register
                ldy     #byte_9F48
                jmp     loc_9FA5
; ---------------------------------------------------------------------------

loc_9F5C:                               ; DATA XREF: RESERVED:9DA6↑o
                brset   <byte_4F $10 loc_9F63
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F63:                               ; CODE XREF: sub_9E01:loc_9F5C↑j
                bra     loc_9F72
; ---------------------------------------------------------------------------

loc_9F65:                               ; DATA XREF: RESERVED:9D9A↑o
                ldaa    <byte_4F
                bita    #$60 ; '`'
                bne     loc_9F72
                brset   <byte_4F $10 loc_9F7C
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F72:                               ; CODE XREF: sub_9E01:loc_9F63↑j
                                        ; sub_9E01+168↑j
                ldx     #TOC3H          ; Output Compare 3 Register
                ldy     #byte_9F45
                jmp     loc_9FA5
; ---------------------------------------------------------------------------

loc_9F7C:                               ; CODE XREF: sub_9E01+16A↑j
                bclr    <byte_F0 $10
                ldab    <byte_65
                aslb
                beq     loc_9F87
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F87:                               ; CODE XREF: sub_9E01+181↑j
                sei
                ldd     #$1A9
                std     word_48C
                jsr     sub_F245
                cli
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F95:                               ; DATA XREF: RESERVED:9D98↑o
                ldaa    <byte_4F
                bita    #$70 ; 'p'
                bne     loc_9F9E
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9F9E:                               ; CODE XREF: sub_9E01+198↑j
                ldx     #TOC2H          ; Output Compare 2 Register
                ldy     #byte_9F42

loc_9FA5:                               ; CODE XREF: sub_9E01+158↑J
                                        ; sub_9E01+178↑J
                bclr    <byte_F0 $10
                ldab    <byte_65
                aslb
                beq     loc_9FB0
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9FB0:                               ; CODE XREF: sub_9E01+1AA↑j
                sei
                ldd     0,y
                oraa    TCTL1           ; Timer Control Register 1
                staa    TCTL1           ; Timer Control Register 1
                stab    CFORC           ; Timer Compare Force Register
                ldd     TCNTH           ; Timer Counter Register
                addd    #$1A9
                std     0,x
                ldaa    2,y
                anda    TCTL1           ; Timer Control Register 1
                staa    TCTL1           ; Timer Control Register 1
                cli
                jmp     loc_A016
; ---------------------------------------------------------------------------

loc_9FD2:                               ; DATA XREF: RESERVED:9D96↑o
                ldx     #InjectorPulsewidth_HB_Cyl1
                bra     loc_9FE4
; ---------------------------------------------------------------------------

loc_9FD7:                               ; DATA XREF: RESERVED:9D68↑o
                ldx     #InjectorPulsewidth_HB_Cyl2
                bra     loc_9FE4
; ---------------------------------------------------------------------------

loc_9FDC:                               ; DATA XREF: RESERVED:9D66↑o
                ldx     #InjectorPulsewidth_HB_Cyl3
                bra     loc_9FE4
; ---------------------------------------------------------------------------

loc_9FE1:                               ; DATA XREF: RESERVED:9D64↑o
                ldx     #InjectorPulsewidth_HB_Cyl4

loc_9FE4:                               ; CODE XREF: sub_9E01+1D4↑j
                                        ; sub_9E01+1D9↑j ...
                bclr    <byte_F0 $10
                ldab    <byte_65
                aslb
                bne     loc_A016
                sei
                ldaa    PIA_Ctrl_2
                bita    #$F0
                beq     loc_9FF9
                anda    #$F
                staa    PIA_Ctrl_2

loc_9FF9:                               ; CODE XREF: sub_9E01+1F1↑j
                ldaa    #$F8
                cmpa    PIA_Ctrl_5
                beq     loc_A003
                staa    PIA_Ctrl_5

loc_A003:                               ; CODE XREF: sub_9E01+1FD↑j
                ldd     #$1A9
                std     0,x
                cli
                bra     loc_A016
; ---------------------------------------------------------------------------

loc_A00B:                               ; DATA XREF: RESERVED:9D78↑o
                ldaa    <byte_F1
                eora    #2
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                bra     loc_A016
; ---------------------------------------------------------------------------

loc_A016:                               ; CODE XREF: sub_9E01+F↑J
                                        ; sub_9E01+26↑J ...
                ldaa    <byte_F7
                cmpa    #$14
                beq     loc_A021
                cmpa    #$1A
                beq     loc_A050

locret_A020:                            ; CODE XREF: sub_9E01+228↓j
                                        ; sub_9E01+22C↓j ...
                rts
; ---------------------------------------------------------------------------

loc_A021:                               ; CODE XREF: sub_9E01+219↑j
                ldab    <byte_F8
                cmpb    #$40 ; '@'
                bcc     loc_A03F
                cmpb    #0
                beq     locret_A020
                cmpb    #$3B ; ';'
                bhi     locret_A020
                ldx     #byte_9DAB
                clra
                abx
                ldab    0,x
                cmpb    #0
                beq     locret_A020
                xgdx
                ldaa    0,x
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A03F:                               ; CODE XREF: sub_9E01+224↑j
                subb    #$40 ; '@'
                aslb
                bcs     locret_A020
                cmpb    #$12
                bcc     locret_A020
                ldx     #off_9DE7

loc_A04B:                               ; CODE XREF: sub_9E01+25B↓j
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_A050:                               ; CODE XREF: sub_9E01+21D↑j
                ldx     #off_9DF7
                ldab    <byte_F8
                aslb
                cmpb    #0
                beq     locret_A020
                cmpb    #8
                bls     loc_A04B
                bra     locret_A020
; ---------------------------------------------------------------------------

loc_A060:                               ; DATA XREF: RESERVED:9DF9↑o
                ldaa    <byte_7B
                brclr   <byte_4F $C0 loc_A06A
                eora    #$82
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A06A:                               ; CODE XREF: sub_9E01+261↑j
                ldab    byte_8018
                lsrb
                bcc     loc_A0AC
                eora    #$80
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A074:                               ; DATA XREF: RESERVED:9DFB↑o
                ldaa    <byte_F0
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A078:                               ; DATA XREF: RESERVED:9DFD↑o
                ldaa    <byte_EF
                eora    #8
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A07E:                               ; DATA XREF: RESERVED:9DFF↑o
                ldaa    SwitchPortAccessReg1
                anda    #$70 ; 'p'
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A085:                               ; DATA XREF: RESERVED:off_9DE7↑o
                sei
                ldaa    #$10
                staa    ADCTL           ; A_D Control Register

loc_A08B:                               ; CODE XREF: sub_9E01+28D↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_A08B
                ldaa    ADR1            ; A_D Result Register 1
                cli
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A096:                               ; DATA XREF: RESERVED:9DE9↑o
                ldaa    <byte_7A
                bra     loc_A0AC
; ---------------------------------------------------------------------------

loc_A09A:                               ; DATA XREF: RESERVED:9DEB↑o
                ldab    <byte_70
                ldaa    #$FF
                cmpb    byte_9052
                bhi     loc_A0AA
                cmpb    byte_9053
                bhi     loc_A0AC
                anda    #$A0

loc_A0AA:                               ; CODE XREF: sub_9E01+2A0↑j
                anda    #$B1

loc_A0AC:                               ; CODE XREF: sub_9E01+23C↑j
                                        ; sub_9E01+267↑j ...
                jmp     sub_9CA1
; End of function sub_9E01

; ---------------------------------------------------------------------------

loc_A0AF:                               ; DATA XREF: RESERVED:9DED↑o
                jmp     locret_A020
; ---------------------------------------------------------------------------

loc_A0B2:                               ; DATA XREF: RESERVED:9DEF↑o
                jmp     locret_A020
; ---------------------------------------------------------------------------

loc_A0B5:                               ; DATA XREF: RESERVED:9DF1↑o
                ldaa    <byte_8
                suba    <byte_6D
                bcc     loc_A0BC
                clra

loc_A0BC:                               ; CODE XREF: RESERVED:A0B9↑j
                jmp     loc_A0AC
; ---------------------------------------------------------------------------

loc_A0BF:                               ; DATA XREF: RESERVED:9DF3↑o
                ldaa    <byte_6E
                suba    <byte_3
                bcc     loc_A0C6
                clra

loc_A0C6:                               ; CODE XREF: RESERVED:A0C3↑j
                ldab    byte_9063
                staa    FDRVar0
                mul
                adca    FDRVar0
                bcc     loc_A0D4
                ldaa    #$FF

loc_A0D4:                               ; CODE XREF: RESERVED:A0D0↑j
                jmp     loc_A0AC
; ---------------------------------------------------------------------------

loc_A0D7:                               ; DATA XREF: RESERVED:9DF5↑o
                ldaa    <byte_6A
                jmp     loc_A0AC
; ---------------------------------------------------------------------------

loc_A0DC:                               ; DATA XREF: RESERVED:off_9DF7↑o
                ldab    <byte_71
                ldaa    #$FF
                cmpb    byte_9052
                bhi     loc_A0EC
                cmpb    byte_9053
                bhi     loc_A0EE
                anda    #$A0

loc_A0EC:                               ; CODE XREF: RESERVED:A0E3↑j
                anda    #$B1

loc_A0EE:                               ; CODE XREF: RESERVED:A0E8↑j
                jmp     sub_9CA1

; =============== S U B R O U T I N E =======================================


sub_A0F1:                               ; CODE XREF: __RESET+7F4↑P
                brclr   <byte_49 1 locret_A12B
                brset   <byte_4A $80 loc_A128
                brset   <byte_4F 1 loc_A101
                brset   <byte_4D $10 loc_A128

loc_A101:                               ; CODE XREF: sub_A0F1+8↑j
                ldd     byte_183
                ldx     byte_185
                fdiv
                xgdx
                ldab    byte_90A4
                brset   <byte_4F $10 loc_A113
                ldab    byte_90A5

loc_A113:                               ; CODE XREF: sub_A0F1+1B↑j
                mul
                adca    #0
                staa    FDRVar3
                ldaa    #$18
                brset   <byte_4F $20 loc_A121 ; ' '
                ldaa    #$17

loc_A121:                               ; CODE XREF: sub_A0F1+2A↑j
                suba    FDRVar3
                staa    <byte_97
                bra     locret_A12B
; ---------------------------------------------------------------------------

loc_A128:                               ; CODE XREF: sub_A0F1+4↑j
                                        ; sub_A0F1+C↑j
                bclr    <byte_49 1

locret_A12B:                            ; CODE XREF: sub_A0F1↑j
                                        ; sub_A0F1+35↑j
                rts
; End of function sub_A0F1


; =============== S U B R O U T I N E =======================================


sub_A12C:                               ; CODE XREF: OC1I+41↓P
                cli
                brclr   <byte_FA $80 loc_A197
                ldaa    SCSR            ; Serial Communications Status Register
                bita    #$E
                psha
                pula
                beq     loc_A13F
                ldab    SCDR            ; SCI Data (Read RDR, Write TDR)
                bra     loc_A197
; ---------------------------------------------------------------------------

loc_A13F:                               ; CODE XREF: sub_A12C+C↑j
                bita    #$20 ; ' '
                beq     loc_A197
                ldab    SCDR            ; SCI Data (Read RDR, Write TDR)
                cmpb    #$F2
                bne     loc_A152

loc_A14A:                               ; CODE XREF: sub_A12C+45↓j
                bclr    <byte_49 $40 ; '@'
                bclr    <byte_5E $80
                bra     loc_A194
; ---------------------------------------------------------------------------

loc_A152:                               ; CODE XREF: sub_A12C+1C↑j
                cmpb    #$F4
                bne     loc_A15E
                bset    <byte_5E $80
                bclr    <byte_49 $40 ; '@'
                bra     loc_A194
; ---------------------------------------------------------------------------

loc_A15E:                               ; CODE XREF: sub_A12C+28↑j
                cmpb    #$F6
                bne     loc_A16A
                bset    <byte_49 $40 ; '@'
                bclr    <byte_5E $80
                bra     loc_A194
; ---------------------------------------------------------------------------

loc_A16A:                               ; CODE XREF: sub_A12C+34↑j
                cmpb    #$FE
                bne     loc_A173
                bclr    <byte_FA $B0
                bra     loc_A14A
; ---------------------------------------------------------------------------

loc_A173:                               ; CODE XREF: sub_A12C+40↑j
                brset   <byte_49 $40 loc_A183 ; '@'
                brset   <byte_5E $80 loc_A18B
                ldx     #0
                abx
                ldab    0,x
                bra     loc_A194
; ---------------------------------------------------------------------------

loc_A183:                               ; CODE XREF: sub_A12C:loc_A173↑j
                ldx     #$100
                abx
                ldab    0,x
                bra     loc_A194
; ---------------------------------------------------------------------------

loc_A18B:                               ; CODE XREF: sub_A12C+4B↑j
                ldx     #$A1BA
                aslb
                abx
                ldx     0,x
                ldab    0,x

loc_A194:                               ; CODE XREF: sub_A12C+24↑j
                                        ; sub_A12C+30↑j ...
                stab    SCDR            ; SCI Data (Read RDR, Write TDR)

loc_A197:                               ; CODE XREF: sub_A12C+1↑j
                                        ; sub_A12C+11↑j ...
                sei

loc_A198:                               ; CODE XREF: sub_A12C+6F↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_A198
                ldaa    ADR1            ; A_D Result Register 1
                staa    byte_1A1
                cmpa    byte_16E
                bcs     loc_A1AB
                staa    byte_16E

loc_A1AB:                               ; CODE XREF: sub_A12C+7A↑j
                cmpa    byte_16F
                bcc     loc_A1B3
                staa    byte_16F

loc_A1B3:                               ; CODE XREF: sub_A12C+82↑j
                ldaa    #$80
                oraa    TMSK1           ; Timer Interrupt Mask Register 1
                staa    TMSK1           ; Timer Interrupt Mask Register 1
                rts
; End of function sub_A12C

; ---------------------------------------------------------------------------
                fdb $44
                fdb $3D
                fdb $45
                fdb $46
                fdb $47
                fdb $124
                fdb $126
                fdb $125
                fdb $127
                fdb $6B
                fdb $6C
                fdb $78
                fdb $79
                fdb $7B
                fdb $76
                fdb $156
                fdb $7F
                fdb $75
                fdb 3
                fdb $6E
                fdb $74
                fdb $72
                fdb $1A1
                fdb $6D
                fdb 8
                fdb $157
                fdb $70
                fdb $71
                fdb $73
                fdb $6F
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $82
                fdb $83
                fdb $84
                fdb $85
                fdb $9C
                fdb $9D
                fdb $1C
                fdb $33
                fdb $66
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $FFFF
                fdb $80
                fdb $81
                fdb $111
                fdb $FFFF
                fdb $FFFF
                fdb $7D
                fdb $FF
                fdb $EF
                fdb $F0
                fdb 5
                fdb $61
                fdb $FB
                fdb $62
                fdb $96

; =============== S U B R O U T I N E =======================================


sub_A240:                               ; CODE XREF: sub_F351+47↓P
                ldx     #$8000
                ldd     #$9200
                std     FDRVar0
                clra
                ldab    #8

loc_A24C:                               ; CODE XREF: sub_A240+24↓j
                bsr     sub_A266
                psha
                pshb
                jsr     sub_F335
                ldaa    #$12
                adda    FDRVar0
                staa    FDRVar0
                ldaa    SwitchPortAccessReg1
                bita    #$40 ; '@'
                pulb
                pula
                beq     locret_A28F
                bra     loc_A24C
; End of function sub_A240


; =============== S U B R O U T I N E =======================================


sub_A266:                               ; CODE XREF: sub_A240:loc_A24C↑p
                cpx     #$B600
                bne     loc_A274
                inc     FDRVar0
                inc     FDRVar0
                ldx     #$B800

loc_A274:                               ; CODE XREF: sub_A266+3↑j
                                        ; sub_A266+22↓j
                adda    0,x
                adda    1,x
                adda    2,x
                adda    3,x
                adda    4,x
                adda    5,x
                adda    6,x
                adda    7,x
                abx
                cpx     FDRVar0
                bne     loc_A274
                tst     FDRVar0
                beq     loc_A290

locret_A28F:                            ; CODE XREF: sub_A240+22↑j
                                        ; sub_A266+2E↓j
                rts
; ---------------------------------------------------------------------------

loc_A290:                               ; CODE XREF: sub_A266+27↑j
                pulx
                suba    byte_8005
                beq     locret_A28F
                ldd     #$201
                jmp     sub_AE82
; End of function sub_A266

; ---------------------------------------------------------------------------
byte_A29C:      fcb 0                   ; DATA XREF: sub_A35F+AA↓o
                fcb 0
                fcb 4
                fcb 0
                fcb $10
                fcb $20
                fcb 0
                fcb $80
                fcb 0
                fcb 0
                fcb $19
                fcb 0
                fcb $32
                fcb $C
                fcb 0
                fcb $E
byte_A2AC:      fcb 1                   ; DATA XREF: sub_A2BC+3D↓o
                fcb 2
                fcb 4
                fcb 8
                fcb $10
                fcb $20
                fcb 0
                fcb 0
                fcb $10
                fcb $11
                fcb $33
                fcb $51
                fcb $A
                fcb $12
                fcb 0
                fcb 0

; =============== S U B R O U T I N E =======================================


sub_A2BC:                               ; CODE XREF: __RESET+803↑P
                sei
                ldab    SPCR            ; SPI Control Register
                orab    #1
                stab    SPCR            ; SPI Control Register
                bclr    <byte_F1 4
                ldab    <byte_F1
                stab    PIA3_Buffer_2_t3
                ldaa    <byte_F0
                cmpa    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                mul
                mul
                nop
                bset    <byte_F1 4
                ldaa    <byte_F1
                staa    PIA3_Buffer_2_t3
                ldaa    SPDR            ; SPI Data Register
                ldab    SPCR            ; SPI Control Register
                andb    #$FC
                stab    SPCR            ; SPI Control Register
                staa    byte_165
                cli
                brclr   <byte_56 $40 loc_A356 ; '@'
                eora    byte_166
                anda    byte_9037
                ldx     #byte_A2AC
                ldab    <byte_65
                andb    #7
                abx
                bita    0,x
                beq     loc_A356
                ldaa    byte_177
                bne     loc_A356
                ldaa    SwitchPortAccessReg1
                bita    #$40 ; '@'
                bne     loc_A356
                ldaa    <byte_76
                cmpa    #$A0
                bcs     loc_A356
                ldaa    8,x
                ldab    #$A0
                cmpa    #$11
                beq     loc_A32E
                cmpa    #$12
                beq     loc_A33C
                cmpa    #$33 ; '3'
                beq     loc_A34A
                ldab    #$20 ; ' '
                jsr     sub_AE82
                bra     loc_A356
; ---------------------------------------------------------------------------

loc_A32E:                               ; CODE XREF: sub_A2BC+61↑j
                brset   <byte_F3 8 loc_A356
                jsr     sub_AE82
                bcc     loc_A356
                bset    <byte_F3 8
                bra     loc_A356
; ---------------------------------------------------------------------------

loc_A33C:                               ; CODE XREF: sub_A2BC+65↑j
                brset   <byte_F3 $20 loc_A356 ; ' '
                jsr     sub_AE82
                bcc     loc_A356
                bset    <byte_F3 $20 ; ' '
                bra     loc_A356
; ---------------------------------------------------------------------------

loc_A34A:                               ; CODE XREF: sub_A2BC+69↑j
                brset   <byte_F3 4 loc_A356
                jsr     sub_AE82
                bcc     loc_A356
                bset    <byte_F3 4

loc_A356:                               ; CODE XREF: sub_A2BC+33↑j
                                        ; sub_A2BC+47↑j ...
                ldaa    <byte_F0
                staa    byte_166
                bset    <byte_56 $40 ; '@'
                rts
; End of function sub_A2BC


; =============== S U B R O U T I N E =======================================


sub_A35F:                               ; CODE XREF: __RESET+800↑P
                ldaa    <byte_6B
                cmpa    #$3F ; '?'
                bcs     loc_A380
                brclr   <byte_4F $20 loc_A380 ; ' '
                ldaa    <byte_62
                cmpa    #$83
                beq     loc_A380
                cmpa    #$81
                beq     loc_A380
                ldd     TCNTH           ; Timer Counter Register
                subd    TIC1H           ; Input Capture 1 Register
                cpd     #$FA
                bcs     loc_A380
                rts
; ---------------------------------------------------------------------------

loc_A380:                               ; CODE XREF: sub_A35F+4↑j
                                        ; sub_A35F+6↑j ...
                bset    <byte_52 8
                jsr     sub_A8E3
                bcc     loc_A38B
                jmp     loc_A459
; ---------------------------------------------------------------------------

loc_A38B:                               ; CODE XREF: sub_A35F+27↑j
                brset   <byte_7B 1 loc_A39D
                brset   <byte_5A 4 loc_A3A0
                ldaa    <byte_5A
                oraa    #4
                eora    #8
                staa    <byte_5A
                bra     loc_A3A0
; ---------------------------------------------------------------------------

loc_A39D:                               ; CODE XREF: sub_A35F:loc_A38B↑j
                bclr    <byte_5A 4

loc_A3A0:                               ; CODE XREF: sub_A35F+30↑j
                                        ; sub_A35F+3C↑j
                brset   <byte_59 $80 loc_A3A7
                jmp     loc_A455
; ---------------------------------------------------------------------------

loc_A3A7:                               ; CODE XREF: sub_A35F:loc_A3A0↑j
                ldaa    <byte_4F
                bita    #1
                bne     loc_A403
                bita    #$38 ; '8'
                beq     loc_A403
                brset   <byte_5A $20 loc_A403 ; ' '
                brset   <byte_5A 1 loc_A3DE
                brset   <byte_5A 2 loc_A3C6
                brclr   <byte_EF $10 loc_A403
                bset    <byte_5A 2
                bra     loc_A403
; ---------------------------------------------------------------------------

loc_A3C6:                               ; CODE XREF: sub_A35F+5A↑j
                ldaa    STe_648A
                bita    #$10
                bne     loc_A3FD
                brset   <byte_5B $40 loc_A3D6 ; '@'
                bset    <byte_5B $40 ; '@'
                bra     loc_A403
; ---------------------------------------------------------------------------

loc_A3D6:                               ; CODE XREF: sub_A35F+6E↑j
                bset    <byte_5A 1
                bclr    <byte_EF $10
                bra     loc_A403
; ---------------------------------------------------------------------------

loc_A3DE:                               ; CODE XREF: sub_A35F+56↑j
                brclr   <byte_5A 2 loc_A3E7
                bclr    <byte_5A 2
                bra     loc_A403
; ---------------------------------------------------------------------------

loc_A3E7:                               ; CODE XREF: sub_A35F:loc_A3DE↑j
                ldaa    STe_648A
                bita    #$10
                bne     loc_A3FD
                brclr   <byte_5B $40 loc_A3FA ; '@'
                bclr    <byte_5B $40 ; '@'
                bset    <byte_EF $10
                bra     loc_A403
; ---------------------------------------------------------------------------

loc_A3FA:                               ; CODE XREF: sub_A35F+8F↑j
                bset    <byte_5B $20 ; ' '

loc_A3FD:                               ; CODE XREF: sub_A35F+6C↑j
                                        ; sub_A35F+8D↑j
                bset    <byte_5A $20 ; ' '
                bset    <byte_EF $10

loc_A403:                               ; CODE XREF: sub_A35F+4C↑j
                                        ; sub_A35F+50↑j ...
                ldaa    STe_648A
                anda    byte_9036
                ldx     #byte_A29C
                ldab    <byte_65
                andb    #7
                abx
                bita    0,x
                beq     locret_A454
                ldaa    byte_177
                bne     locret_A454
                ldaa    SwitchPortAccessReg1
                bita    #$40 ; '@'
                bne     locret_A454
                ldaa    <byte_76
                cmpa    #$A0
                bcs     locret_A454
                ldaa    8,x
                ldab    #$A0
                cmpa    #$C
                beq     loc_A441
                cmpa    #$19
                bne     loc_A44F
                brset   <byte_F3 $80 locret_A454
                jsr     sub_AE82
                bcc     locret_A454
                bset    <byte_F3 $80
                bra     locret_A454
; ---------------------------------------------------------------------------

loc_A441:                               ; CODE XREF: sub_A35F+CE↑j
                brset   <byte_F5 $80 locret_A454
                jsr     sub_AE82
                bcc     locret_A454
                bset    <byte_F5 $80
                bra     locret_A454
; ---------------------------------------------------------------------------

loc_A44F:                               ; CODE XREF: sub_A35F+D2↑j
                ldab    #$20 ; ' '
                jsr     sub_AE82

locret_A454:                            ; CODE XREF: sub_A35F+B4↑j
                                        ; sub_A35F+B9↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A455:                               ; CODE XREF: sub_A35F+45↑J
                bset    <byte_59 $80
                rts
; ---------------------------------------------------------------------------

loc_A459:                               ; CODE XREF: sub_A35F+29↑J
                bset    8,y $20 ; ' '
                cli
                ldaa    <byte_4E
                bita    #$60 ; '`'
                bne     loc_A47E
                ldaa    PPROG           ; EEPROM Program Control Register
                bita    #2
                bne     loc_A47E
                ldd     #$B618
                tba
                ldab    byte_B618
                beq     loc_A47E
                decb
                staa    byte_161
                stab    byte_162
                bset    <byte_4E $40 ; '@'

loc_A47E:                               ; CODE XREF: sub_A35F+103↑j
                                        ; sub_A35F+10A↑j ...
                ldd     #$4488
                jsr     sub_AE82
                bcc     loc_A499
                sei
                ldaa    SwitchPortAccessReg1
                anda    #$FE
                staa    SwitchPortAccessReg1
                ldab    #3

loc_A491:                               ; CODE XREF: sub_A35F+133↓j
                decb
                bne     loc_A491
                oraa    #1
                staa    SwitchPortAccessReg1

loc_A499:                               ; CODE XREF: sub_A35F+125↑j
                cli
                rts
; End of function sub_A35F


; =============== S U B R O U T I N E =======================================


sub_A49B:                               ; CODE XREF: sub_96AC+7B↑P
                brclr   <byte_2 1 loc_A4D9
                ldab    <byte_76
                cmpb    byte_9044
                bcs     loc_A4CA
                cmpb    byte_9043
                bcc     loc_A4CA
                ldaa    byte_16E
                suba    byte_16F
                bls     loc_A4CA
                cmpa    byte_9042
                bcs     loc_A4CA
                sei

loc_A4B9:                               ; CODE XREF: sub_A49B+21↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_A4B9
                ldaa    ADR1            ; A_D Result Register 1
                staa    byte_16E
                staa    byte_16F
                cli
                bra     loc_A4D3
; ---------------------------------------------------------------------------

loc_A4CA:                               ; CODE XREF: sub_A49B+9↑j
                                        ; sub_A49B+E↑j ...
                ldaa    byte_168
                anda    #$E0
                cmpa    #$E0
                bne     loc_A4D9

loc_A4D3:                               ; CODE XREF: sub_A49B+2D↑j
                ldd     #$2828
                jsr     sub_AE82

loc_A4D9:                               ; CODE XREF: sub_A49B↑j
                                        ; sub_A49B+36↑j
                brset   <byte_62 $80 locret_A4F5
                ldaa    byte_168
                anda    #$1F
                cmpa    #$1F
                bne     locret_A4F5
                brset   <byte_F5 $40 locret_A4F5 ; '@'
                ldd     #$181
                jsr     sub_AE82
                bcc     locret_A4F5
                bset    <byte_F5 $40 ; '@'

locret_A4F5:                            ; CODE XREF: sub_A49B:loc_A4D9↑j
                                        ; sub_A49B+49↑j ...
                rts
; End of function sub_A49B


; =============== S U B R O U T I N E =======================================


sub_A4F6:                               ; CODE XREF: __RESET+7D8↑P
                brclr   <byte_48 $40 locret_A543 ; '@'
                ldd     <byte_64
                cmpa    #$B
                bcs     locret_A543
                ldaa    <byte_72
                cmpa    byte_9057
                bcs     locret_A543
                bitb    #$1F
                bne     locret_A543
                brset   <byte_4F 1 loc_A513
                brclr   <byte_4D $10 locret_A543

loc_A513:                               ; CODE XREF: sub_A4F6+15↑j
                brset   <byte_7B $20 locret_A543 ; ' '
                brclr   <byte_4A $80 locret_A543
                ldaa    <byte_6B
                cmpa    byte_9055
                bcs     locret_A543
                ldaa    <byte_8
                suba    <byte_6D
                bcc     loc_A529
                clra

loc_A529:                               ; CODE XREF: sub_A4F6+30↑j
                cmpa    byte_9056
                bcc     locret_A543
                ldaa    <byte_7A
                cmpa    #2
                bcc     locret_A543
                brset   <byte_F3 $10 locret_A543
                ldd     #$23A0
                jsr     sub_AE82
                bcc     locret_A543
                bset    <byte_F3 $10

locret_A543:                            ; CODE XREF: sub_A4F6↑j
                                        ; sub_A4F6+8↑j ...
                rts
; End of function sub_A4F6


; =============== S U B R O U T I N E =======================================


sub_A544:                               ; CODE XREF: __RESET+7DE↑P
                ldaa    SwitchPortAccessReg1
                bita    #$40 ; '@'
                beq     loc_A54C
                rts
; ---------------------------------------------------------------------------

loc_A54C:                               ; CODE XREF: sub_A544+5↑j
                brset   <byte_48 $40 loc_A553 ; '@'
                jmp     loc_A59E
; ---------------------------------------------------------------------------

loc_A553:                               ; CODE XREF: sub_A544:loc_A54C↑j
                ldaa    <byte_64
                cmpa    #$2C ; ','
                bcs     loc_A59E
                ldaa    <byte_72
                cmpa    #$CD
                bcs     loc_A59E
                brclr   <byte_56 4 loc_A5A6
                brset   <byte_5E 2 loc_A574
                ldaa    byte_173
                cmpa    #$13
                bcs     loc_A598
                bset    <byte_5E 2
                clr     byte_173

loc_A574:                               ; CODE XREF: sub_A544+1F↑j
                ldaa    <byte_70
                cmpa    #$4D ; 'M'
                bcs     loc_A59E
                ldaa    byte_173
                cmpa    #$2A ; '*'
                bcs     loc_A592
                brset   <byte_F5 2 loc_A590
                ldd     #$2081
                jsr     sub_AE82
                bcc     locret_A604
                bset    <byte_F5 2

loc_A590:                               ; CODE XREF: sub_A544+3D↑j
                bra     locret_A604
; ---------------------------------------------------------------------------

loc_A592:                               ; CODE XREF: sub_A544+3B↑j
                ldab    <byte_65
                bitb    #$7F
                bne     locret_A604

loc_A598:                               ; CODE XREF: sub_A544+28↑j
                inca
                staa    byte_173
                bra     locret_A604
; ---------------------------------------------------------------------------

loc_A59E:                               ; CODE XREF: sub_A544+C↑J
                                        ; sub_A544+13↑j ...
                bclr    <byte_56 4
                bclr    <byte_5E 2
                bra     loc_A5D6
; ---------------------------------------------------------------------------

loc_A5A6:                               ; CODE XREF: sub_A544+1B↑j
                ldaa    <byte_70
                cmpa    byte_9052
                bhi     loc_A5D6
                cmpa    byte_9053
                bcs     loc_A5D6
                ldaa    byte_173
                cmpa    #$15
                bcs     loc_A5CD
                bset    <byte_56 4
                clra
                staa    byte_173
                sei
                ldaa    <byte_F1
                oraa    #8
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                cli
                bra     locret_A604
; ---------------------------------------------------------------------------

loc_A5CD:                               ; CODE XREF: sub_A544+73↑j
                ldab    <byte_65
                bitb    #$7F
                bne     loc_A5DA
                inca
                bra     loc_A5D7
; ---------------------------------------------------------------------------

loc_A5D6:                               ; CODE XREF: sub_A544+60↑j
                                        ; sub_A544+67↑j ...
                clra

loc_A5D7:                               ; CODE XREF: sub_A544+90↑j
                staa    byte_173

loc_A5DA:                               ; CODE XREF: sub_A544+8D↑j
                brset   <byte_5E 4 loc_A5E9
                sei
                ldaa    <byte_F1
                anda    #$F7
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                cli

loc_A5E9:                               ; CODE XREF: sub_A544:loc_A5DA↑j
                ldaa    <byte_65
                bita    #$F
                bne     locret_A604
                brset   <byte_F5 4 locret_A604
                ldaa    <byte_70
                cmpa    #$3E ; '>'
                bls     locret_A604
                ldd     #$3E8F
                jsr     sub_AE82
                bcc     locret_A604
                bset    <byte_F5 4

locret_A604:                            ; CODE XREF: sub_A544+47↑j
                                        ; sub_A544:loc_A590↑j ...
                rts
; End of function sub_A544


; =============== S U B R O U T I N E =======================================


sub_A605:                               ; CODE XREF: __RESET+7E8↑P
                ldaa    SwitchPortAccessReg1
                bita    #$40 ; '@'
                beq     loc_A60D
                rts
; ---------------------------------------------------------------------------

loc_A60D:                               ; CODE XREF: sub_A605+5↑j
                brset   <byte_48 $40 loc_A614 ; '@'
                jmp     loc_A65F
; ---------------------------------------------------------------------------

loc_A614:                               ; CODE XREF: sub_A605:loc_A60D↑j
                ldaa    <byte_64
                cmpa    #$2C ; ','
                bcs     loc_A65F
                ldaa    <byte_72
                cmpa    #$CD
                bcs     loc_A65F
                brclr   <byte_5E 4 loc_A667
                brset   <byte_5E 1 loc_A635
                ldaa    byte_172
                cmpa    #$13
                bcs     loc_A659
                bset    <byte_5E 1
                clr     byte_172

loc_A635:                               ; CODE XREF: sub_A605+1F↑j
                ldaa    <byte_71
                cmpa    #$4D ; 'M'
                bcs     loc_A65F
                ldaa    byte_172
                cmpa    #$2A ; '*'
                bcs     loc_A653
                brset   <byte_F6 2 loc_A651
                ldd     #$4181
                jsr     sub_AE82
                bcc     locret_A6C5
                bset    <byte_F6 2

loc_A651:                               ; CODE XREF: sub_A605+3D↑j
                bra     locret_A6C5
; ---------------------------------------------------------------------------

loc_A653:                               ; CODE XREF: sub_A605+3B↑j
                ldab    <byte_65
                bitb    #$7F
                bne     locret_A6C5

loc_A659:                               ; CODE XREF: sub_A605+28↑j
                inca
                staa    byte_172
                bra     locret_A6C5
; ---------------------------------------------------------------------------

loc_A65F:                               ; CODE XREF: sub_A605+C↑J
                                        ; sub_A605+13↑j ...
                bclr    <byte_5E 4
                bclr    <byte_5E 1
                bra     loc_A697
; ---------------------------------------------------------------------------

loc_A667:                               ; CODE XREF: sub_A605+1B↑j
                ldaa    <byte_71
                cmpa    byte_9052
                bhi     loc_A697
                cmpa    byte_9053
                bcs     loc_A697
                ldaa    byte_172
                cmpa    #$15
                bcs     loc_A68E
                bset    <byte_5E 4
                clra
                staa    byte_172
                sei
                ldaa    <byte_F1
                oraa    #8
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                cli
                bra     locret_A6C5
; ---------------------------------------------------------------------------

loc_A68E:                               ; CODE XREF: sub_A605+73↑j
                ldab    <byte_65
                bitb    #$7F
                bne     loc_A69B
                inca
                bra     loc_A698
; ---------------------------------------------------------------------------

loc_A697:                               ; CODE XREF: sub_A605+60↑j
                                        ; sub_A605+67↑j ...
                clra

loc_A698:                               ; CODE XREF: sub_A605+90↑j
                staa    byte_172

loc_A69B:                               ; CODE XREF: sub_A605+8D↑j
                brset   <byte_56 4 loc_A6AA
                sei
                ldaa    <byte_F1
                anda    #$F7
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                cli

loc_A6AA:                               ; CODE XREF: sub_A605:loc_A69B↑j
                ldaa    <byte_65
                bita    #$F
                bne     locret_A6C5
                brset   <byte_F6 4 locret_A6C5
                ldaa    <byte_71
                cmpa    #$3E ; '>'
                bls     locret_A6C5
                ldd     #$428F
                jsr     sub_AE82
                bcc     locret_A6C5
                bset    <byte_F6 4

locret_A6C5:                            ; CODE XREF: sub_A605+47↑j
                                        ; sub_A605:loc_A651↑j ...
                rts
; End of function sub_A605


; =============== S U B R O U T I N E =======================================


sub_A6C6:                               ; CODE XREF: __RESET+7D2↑P
                ldaa    byte_128
                cmpa    #$D
                beq     loc_A6FE
                brset   <byte_F5 $10 loc_A6FE
                sei
                ldaa    SwitchPortAccessReg1
                bita    #$10
                beq     loc_A6FE
                bita    #$40 ; '@'
                bne     loc_A6FE
                brset   <byte_F0 $10 loc_A6FE
                brclr   <byte_56 $20 loc_A6F8 ; ' '
                lsra
                eora    <byte_4C
                bita    #2
                cli
                beq     loc_A6F8
                ldd     #$BA0
                jsr     sub_AE82
                bcc     loc_A6F8
                bset    <byte_F5 $10

loc_A6F8:                               ; CODE XREF: sub_A6C6+1B↑j
                                        ; sub_A6C6+25↑j ...
                cli
                bset    <byte_56 $20 ; ' '
                bra     locret_A702
; ---------------------------------------------------------------------------

loc_A6FE:                               ; CODE XREF: sub_A6C6+5↑j
                                        ; sub_A6C6+7↑j ...
                cli
                bclr    <byte_56 $20 ; ' '

locret_A702:                            ; CODE XREF: sub_A6C6+36↑j
                rts
; End of function sub_A6C6


; =============== S U B R O U T I N E =======================================


sub_A703:                               ; CODE XREF: __RESET+79E↑P
                brclr   <byte_56 2 loc_A72C
                ldaa    <byte_76
                cmpa    #$82
                bcs     locret_A72B
                ldaa    <byte_65
                bita    #4
                bne     locret_A72B
                ldaa    byte_116
                bne     locret_A72B
                ldaa    word_117
                asla
                bcs     locret_A72B
                ldaa    SwitchPortAccessReg1
                bita    #$50 ; 'P'
                bne     locret_A72B
                ldd     #$2C14
                jsr     sub_AE82

locret_A72B:                            ; CODE XREF: sub_A703+8↑j
                                        ; sub_A703+E↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A72C:                               ; CODE XREF: sub_A703↑j
                bset    <byte_56 2
                rts
; End of function sub_A703


; =============== S U B R O U T I N E =======================================


sub_A730:                               ; CODE XREF: __RESET+7EE↑P
                ldaa    <byte_65
                bita    #7
                bne     loc_A7B5
                sei

loc_A737:                               ; CODE XREF: sub_A730+A↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_A737
                ldaa    ADR1            ; A_D Result Register 1
                staa    FDRVar2
                jsr     sub_F2EC
                staa    FDRVar1
                cli
                ldaa    FDRVar2
                cmpa    byte_9065
                bcc     loc_A7A4
                cmpa    byte_9064
                bcs     loc_A7A4
                brset   <byte_F2 $80 loc_A774
                tst     byte_7A
                bne     loc_A7A4
                brset   <byte_4A $80 loc_A7A4
                ldd     <byte_6B
                subd    <byte_80
                bcc     loc_A76E
                coma
                comb
                addd    #1

loc_A76E:                               ; CODE XREF: sub_A730+37↑j
                cpd     byte_9067
                bcc     loc_A7A4

loc_A774:                               ; CODE XREF: sub_A730+26↑j
                ldaa    <byte_8
                suba    FDRVar1
                bcs     loc_A78A
                ldab    <byte_8
                ldx     #byte_906A
                cmpb    byte_9069
                bcc     loc_A786
                inx

loc_A786:                               ; CODE XREF: sub_A730+53↑j
                cmpa    0,x
                bcc     loc_A79B

loc_A78A:                               ; CODE XREF: sub_A730+49↑j
                brset   <byte_F2 $80 loc_A7A4
                ldd     #$2794
                jsr     sub_AE82
                bcc     loc_A7A4
                bset    <byte_F2 $80
                bra     loc_A7A4
; ---------------------------------------------------------------------------

loc_A79B:                               ; CODE XREF: sub_A730+58↑j
                brclr   <byte_F2 $80 loc_A7A4
                ldaa    #8
                jsr     sub_B0B7

loc_A7A4:                               ; CODE XREF: sub_A730+1F↑j
                                        ; sub_A730+24↑j ...
                brclr   <byte_56 $80 loc_A7B7
                ldaa    FDRVar2
                cmpa    byte_9066
                bcs     locret_A7EA
                cmpa    byte_9065
                bcs     loc_A7EF

loc_A7B5:                               ; CODE XREF: sub_A730+4↑j
                bra     locret_A7EA
; ---------------------------------------------------------------------------

loc_A7B7:                               ; CODE XREF: sub_A730:loc_A7A4↑j
                ldx     <byte_6B
                cpx     #$C80
                bcs     locret_A7EA
                cpx     #$2EE0
                bcc     locret_A7EA
                ldaa    <byte_77
                cmpa    #$32 ; '2'
                bcc     locret_A7EA
                ldaa    FDRVar2
                cmpa    byte_9065
                bcc     loc_A7DB
                cmpa    byte_9064
                bcc     loc_A7EB
                ldd     #$2494
                bra     loc_A7DE
; ---------------------------------------------------------------------------

loc_A7DB:                               ; CODE XREF: sub_A730+9F↑j
                ldd     #$2594

loc_A7DE:                               ; CODE XREF: sub_A730+A9↑j
                brset   <byte_F2 8 locret_A7EA
                jsr     sub_AE82
                bcc     locret_A7EA
                bset    <byte_F2 8

locret_A7EA:                            ; CODE XREF: sub_A730+7E↑j
                                        ; sub_A730:loc_A7B5↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A7EB:                               ; CODE XREF: sub_A730+A4↑j
                brclr   <byte_F2 8 locret_A7EA

loc_A7EF:                               ; CODE XREF: sub_A730+83↑j
                ldaa    #4
                jsr     sub_B0B7
                brset   <byte_F2 8 locret_A7EA
                bclr    <byte_56 $80
                bra     locret_A7EA
; End of function sub_A730


; =============== S U B R O U T I N E =======================================


sub_A7FD:                               ; CODE XREF: __RESET+7CF↑P
                ldaa    <byte_65
                bita    #$1F
                bne     locret_A824
                brclr   <byte_48 $40 locret_A824 ; '@'
                ldaa    <byte_76
                suba    <byte_7D
                bcs     loc_A821
                cmpa    #$10
                bcs     loc_A821
                brset   <byte_F2 $20 locret_A824 ; ' '
                ldd     #$6A0
                jsr     sub_AE82
                bcc     locret_A824
                bset    <byte_F2 $20 ; ' '
                rts
; ---------------------------------------------------------------------------

loc_A821:                               ; CODE XREF: sub_A7FD+E↑j
                                        ; sub_A7FD+12↑j
                bclr    <byte_F2 $20 ; ' '

locret_A824:                            ; CODE XREF: sub_A7FD+4↑j
                                        ; sub_A7FD+6↑j ...
                rts
; End of function sub_A7FD


; =============== S U B R O U T I N E =======================================


sub_A825:                               ; CODE XREF: __RESET+7DB↑P
                brset   <byte_F2 2 locret_A85A
                ldaa    <byte_72
                cmpa    byte_903F
                bcs     loc_A835
                bset    <byte_50 2
                bra     locret_A85A
; ---------------------------------------------------------------------------

loc_A835:                               ; CODE XREF: sub_A825+9↑j
                brset   <byte_50 2 locret_A85A
                brclr   <byte_48 $40 locret_A85A ; '@'
                ldaa    <byte_64
                cmpa    #$FF
                bne     locret_A85A
                ldaa    <byte_7A
                cmpa    byte_9040
                bcs     locret_A85A
                ldab    byte_163
                cmpb    byte_9041
                beq     loc_A85B
                ldaa    <byte_65
                bne     locret_A85A
                incb
                stab    byte_163

locret_A85A:                            ; CODE XREF: sub_A825↑j
                                        ; sub_A825+E↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A85B:                               ; CODE XREF: sub_A825+2B↑j
                ldd     #$2101
                jsr     sub_AE82
                bcc     locret_A866
                bset    <byte_50 2

locret_A866:                            ; CODE XREF: sub_A825+3C↑j
                rts
; End of function sub_A825


; =============== S U B R O U T I N E =======================================


sub_A867:                               ; CODE XREF: __RESET+7D5↑P
                brset   <byte_49 $20 loc_A8D8 ; ' '
                ldaa    <byte_F5
                bita    #$18
                bne     loc_A8D8
                ldaa    <byte_7D
                suba    <byte_76
                bcs     loc_A8D8
                cmpa    byte_904B
                bcs     loc_A8D8
                ldd     <byte_6B
                cpd     word_904C
                bcs     loc_A8D8
                ldaa    #$F
                brclr   <byte_56 1 loc_A88B
                clra

loc_A88B:                               ; CODE XREF: sub_A867+1F↑j
                anda    <byte_65
                bne     locret_A8A8
                ldaa    byte_171
                inca
                beq     loc_A898
                staa    byte_171

loc_A898:                               ; CODE XREF: sub_A867+2C↑j
                brset   <byte_56 1 loc_A8A9
                cmpa    byte_904E
                bcs     locret_A8A8
                clra
                staa    byte_171
                bset    <byte_56 1

locret_A8A8:                            ; CODE XREF: sub_A867+26↑j
                                        ; sub_A867+38↑j ...
                rts
; ---------------------------------------------------------------------------

loc_A8A9:                               ; CODE XREF: sub_A867:loc_A898↑j
                brset   <byte_49 $10 loc_A8BA
                cmpa    byte_904F
                bcs     locret_A8A8
                clra
                staa    byte_171
                bset    <byte_49 $10
                rts
; ---------------------------------------------------------------------------

loc_A8BA:                               ; CODE XREF: sub_A867:loc_A8A9↑j
                cmpa    byte_9051
                bcs     locret_A8A8
                clra
                staa    byte_171
                bclr    <byte_49 $10
                ldd     #$58A
                jsr     sub_AE82
                bcc     locret_A8A8
                bset    <byte_F5 8
                bclr    <byte_56 1
                bclr    <byte_49 $30 ; '0'
                rts
; ---------------------------------------------------------------------------

loc_A8D8:                               ; CODE XREF: sub_A867↑j
                                        ; sub_A867+8↑j ...
                clra
                staa    byte_171
                bclr    <byte_56 1
                bclr    <byte_49 $30 ; '0'
                rts
; End of function sub_A867


; =============== S U B R O U T I N E =======================================


sub_A8E3:                               ; CODE XREF: __RESET+4E1↑P
                                        ; sub_A35F+24↑P
                ldaa    <byte_EF
                adda    #$C3
                staa    FDRVar0
                ldab    #$40 ; '@'
                ldaa    #$61 ; 'a'
                ldy     #PORTA          ; Port A data
                ldx     #SwitchPortAccessReg1
                sei
                bset    0,x 8
                bclr    8,y $20 ; ' '
                cmpb    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                cmpa    SPSR            ; SPI Status Register
                ldaa    #$62 ; 'b'

loc_A912:                               ; CODE XREF: sub_A8E3+34↓j
                brclr   0,x 8 loc_A91C
                decb
                bne     loc_A912
                jmp     loc_AA17
; ---------------------------------------------------------------------------

loc_A91C:                               ; CODE XREF: sub_A8E3:loc_A912↑j
                ldab    #$B
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                staa    FDRVar1
                cmpa    SPSR            ; SPI Status Register
                ldaa    #0

loc_A933:                               ; CODE XREF: sub_A8E3+55↓j
                brclr   0,x 8 loc_A93D
                decb
                bne     loc_A933
                jmp     loc_AA17
; ---------------------------------------------------------------------------

loc_A93D:                               ; CODE XREF: sub_A8E3:loc_A933↑j
                ldab    #$B
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                staa    FDRVar2
                cmpa    SPSR            ; SPI Status Register
                ldaa    <byte_EF

loc_A954:                               ; CODE XREF: sub_A8E3+76↓j
                brclr   0,x 8 loc_A95E
                decb
                bne     loc_A954
                jmp     loc_AA17
; ---------------------------------------------------------------------------

loc_A95E:                               ; CODE XREF: sub_A8E3:loc_A954↑j
                ldab    #$B
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                staa    FDRVar3
                cmpa    SPSR            ; SPI Status Register
                ldaa    #0

loc_A975:                               ; CODE XREF: sub_A8E3+97↓j
                brclr   0,x 8 loc_A97F
                decb
                bne     loc_A975
                jmp     loc_AA17
; ---------------------------------------------------------------------------

loc_A97F:                               ; CODE XREF: sub_A8E3:loc_A975↑j
                ldab    #$B
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                staa    STe_648A
                cmpa    SPSR            ; SPI Status Register
                ldaa    FDRVar0

loc_A997:                               ; CODE XREF: sub_A8E3+B9↓j
                brclr   0,x 8 loc_A9A1
                decb
                bne     loc_A997
                jmp     loc_AA17
; ---------------------------------------------------------------------------

loc_A9A1:                               ; CODE XREF: sub_A8E3:loc_A997↑j
                ldab    #$B
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop

loc_A9AD:                               ; CODE XREF: sub_A8E3+D0↓j
                brset   $29,y $80 loc_A9B8
                decb
                bne     loc_A9AD
                jmp     loc_AA17
; ---------------------------------------------------------------------------

loc_A9B8:                               ; CODE XREF: sub_A8E3:loc_A9AD↑j
                ldaa    SPDR            ; SPI Data Register
                bset    8,y $20 ; ' '
                brclr   <byte_52 8 loc_A9C4
                cli

loc_A9C4:                               ; CODE XREF: sub_A8E3+DC↑j
                ldab    FDRVar1
                addb    FDRVar2
                addb    FDRVar3
                addb    STe_648A
                cba
                beq     loc_A9D6
                jmp     loc_AA17
; ---------------------------------------------------------------------------

loc_A9D6:                               ; CODE XREF: sub_A8E3+EE↑j
                ldaa    FDRVar2
                ldab    <byte_4F
                bitb    #$C0
                beq     loc_A9E5
                eora    #$82
                staa    <byte_7B
                bra     loc_A9EF
; ---------------------------------------------------------------------------

loc_A9E5:                               ; CODE XREF: sub_A8E3+FA↑j
                ldab    byte_8018
                lsrb
                bcc     loc_AA06
                eora    #$80
                staa    <byte_7B

loc_A9EF:                               ; CODE XREF: sub_A8E3+100↑j
                brclr   <byte_7B $40 loc_AA01 ; '@'
                brclr   <byte_7B $80 loc_A9FC
                bset    <byte_4D $20 ; ' '
                bra     loc_AA14
; ---------------------------------------------------------------------------

loc_A9FC:                               ; CODE XREF: sub_A8E3+110↑j
                bclr    <byte_4D $20 ; ' '
                bra     loc_AA14
; ---------------------------------------------------------------------------

loc_AA01:                               ; CODE XREF: sub_A8E3:loc_A9EF↑j
                bset    <byte_4D $20 ; ' '
                bra     loc_AA14
; ---------------------------------------------------------------------------

loc_AA06:                               ; CODE XREF: sub_A8E3+106↑j
                staa    <byte_7B
                brclr   <byte_7B $80 loc_AA11
                bset    <byte_4D $20 ; ' '
                bra     loc_AA14
; ---------------------------------------------------------------------------

loc_AA11:                               ; CODE XREF: sub_A8E3+125↑j
                bclr    <byte_4D $20 ; ' '

loc_AA14:                               ; CODE XREF: sub_A8E3+117↑j
                                        ; sub_A8E3+11C↑j ...
                clc
                bra     locret_AA18
; ---------------------------------------------------------------------------

loc_AA17:                               ; CODE XREF: sub_A8E3+36↑J
                                        ; sub_A8E3+57↑J ...
                sec

locret_AA18:                            ; CODE XREF: sub_A8E3+132↑j
                rts
; End of function sub_A8E3


; =============== S U B R O U T I N E =======================================


                ; public IC2I
IC2I:                                   ; DATA XREF: USER_VEC:FFEC↓o

; FUNCTION CHUNK AT EF06 SIZE 000000DC BYTES

                ldd     TIC2H           ; Input Capture 2 Register
                lsld
                std     CountdownTimerFromKeyOn
                jmp     loc_EF06
; End of function IC2I

; ---------------------------------------------------------------------------
                beq     loc_AA34
                fdiv
                jsr     sub_EFE2
                beq     loc_AA34
                fdiv
                jsr     sub_EFE2
                beq     loc_AA34
                jmp     loc_EFCE
; ---------------------------------------------------------------------------

loc_AA34:                               ; CODE XREF: RESERVED:AA23↑j
                                        ; RESERVED:AA29↑j ...
                jmp     loc_EF06

; =============== S U B R O U T I N E =======================================


                ; public OC1I
OC1I:                                   ; DATA XREF: USER_VEC:FFE8↓o
                ldaa    #$80
                staa    TFLG1           ; Timer Interrupt Flag Register 1
                ldaa    #$10
                staa    ADCTL           ; A_D Control Register
                ldd     TOC1H           ; Output Compare 1 Register
                addd    #$1E0
                cpd     TCNTH           ; Timer Counter Register
                bmi     loc_AA5E
                subd    #$89
                cpd     TCNTH           ; Timer Counter Register
                bpl     loc_AA59
                addd    #$89

loc_AA59:                               ; CODE XREF: OC1I+1D↑j
                addd    #$89
                bra     loc_AA64
; ---------------------------------------------------------------------------

loc_AA5E:                               ; CODE XREF: OC1I+14↑j
                ldd     TCNTH           ; Timer Counter Register
                addd    #$1E0

loc_AA64:                               ; CODE XREF: OC1I+25↑j
                std     TOC1H           ; Output Compare 1 Register
                ldaa    TMSK1           ; Timer Interrupt Mask Register 1
                anda    #$7F
                staa    TMSK1           ; Timer Interrupt Mask Register 1
                inc     byte_151
                jsr     sub_E8C6
                jsr     sub_DB67
                jsr     sub_A12C
                rti
; End of function OC1I


; =============== S U B R O U T I N E =======================================


sub_AA7C:                               ; CODE XREF: sub_9981↑P
                ldy     #$17C
                brset   <byte_FA $80 loc_AAED
                brclr   <byte_FA $40 loc_AAED ; '@'
                ldaa    BAUD            ; SCI Baud Rate Control 3
                cmpa    #$25 ; '%'
                bne     locret_AAEC
                ldab    SCDR            ; SCI Data (Read RDR, Write TDR)
                ldaa    SCSR            ; Serial Communications Status Register
                bita    #$20 ; ' '
                beq     loc_AAF1
                bita    #$E
                bne     loc_AB04
                brset   0,y $E0 loc_AB0D
                ldaa    #$F8
                brset   0,y $80 loc_AABF
                deca

loc_AAAA:                               ; DATA XREF: RESERVED:ACA2↓w
                brset   0,y $60 loc_AABF ; '`'
                ldaa    #$F5
                brset   0,y $40 loc_AABF ; '@'
                ldaa    #$F3
                brset   0,y $20 loc_AABF ; ' '
                ldaa    #$14

loc_AABF:                               ; CODE XREF: sub_AA7C+28↑j
                                        ; sub_AA7C:loc_AAAA↑j ...
                cba
                bne     loc_AB04
                ldaa    byte_17C
                adda    #$20 ; ' '
                staa    byte_17C
                anda    #$E0
                cmpa    #$A0
                bne     loc_AAE8
                ldaa    #$E0
                staa    byte_17C
                ldaa    #$52 ; 'R'
                staa    <byte_F7
                ldd     SCSR            ; Serial Communications Status Register
                ldaa    #$F8
                ldab    SCSR            ; Serial Communications Status Register
                staa    SCDR            ; SCI Data (Read RDR, Write TDR)
                bra     loc_AAE8
; ---------------------------------------------------------------------------

loc_AAE6:                               ; CODE XREF: sub_AA7C+86↓j
                staa    <byte_F7

loc_AAE8:                               ; CODE XREF: sub_AA7C+52↑j
                                        ; sub_AA7C+68↑j ...
                ldd     SCSR            ; Serial Communications Status Register
                pulx

locret_AAEC:                            ; CODE XREF: sub_AA7C+11↑j
                rts
; ---------------------------------------------------------------------------

loc_AAED:                               ; CODE XREF: sub_AA7C+4↑j
                                        ; sub_AA7C+8↑j ...
                clr     byte_17C
                rts
; ---------------------------------------------------------------------------

loc_AAF1:                               ; CODE XREF: sub_AA7C+1B↑j
                brset   0,y $E0 loc_AAFD
                brclr   0,y $E0 loc_AAED
                bra     loc_AAE8
; ---------------------------------------------------------------------------

loc_AAFD:                               ; CODE XREF: sub_AA7C:loc_AAF1↑j
                ldaa    <byte_F7
                deca
                cmpa    #$20 ; ' '
                bne     loc_AAE6

loc_AB04:                               ; CODE XREF: sub_AA7C+1F↑j
                                        ; sub_AA7C+44↑j
                clra
                staa    <byte_F7
                staa    <byte_F8
                staa    <byte_FA
                bra     loc_AAE8
; ---------------------------------------------------------------------------

loc_AB0D:                               ; CODE XREF: sub_AA7C+21↑j
                ldaa    #$28 ; '('
                staa    <byte_F7
                brset   0,y 8 loc_AB5B
                brset   0,y $10 loc_AB23
                bset    0,y $10
                stab    <byte_F8
                bra     loc_AAE8
; ---------------------------------------------------------------------------

loc_AB23:                               ; CODE XREF: sub_AA7C+9A↑j
                cmpb    <byte_F8
                bne     loc_AB4C
                bclr    0,y $10
                tba
                ldab    byte_17C
                andb    #7
                cmpb    #4
                beq     loc_AB41
                ldx     #$178
                abx
                staa    0,x
                inc     byte_17C
                jmp     loc_AAE8
; ---------------------------------------------------------------------------

loc_AB41:                               ; CODE XREF: sub_AA7C+B7↑j
                cmpa    #$12
                bne     loc_AB49
                bclr    0,y 7

loc_AB49:                               ; CODE XREF: sub_AA7C+C7↑j
                                        ; sub_AA7C+F3↓j
                jmp     loc_AAE8
; ---------------------------------------------------------------------------

loc_AB4C:                               ; CODE XREF: sub_AA7C+A9↑j
                bset    0,y 8
                cmpb    #$12
                bne     loc_AB5F

loc_AB54:                               ; CODE XREF: sub_AA7C:loc_AB66↓j
                bset    0,y $10
                jmp     loc_AAE8
; ---------------------------------------------------------------------------

loc_AB5B:                               ; CODE XREF: sub_AA7C+95↑j
                cmpb    #$12
                beq     loc_AB66

loc_AB5F:                               ; CODE XREF: sub_AA7C+D6↑j
                bclr    0,y $10
                jmp     loc_AAE8
; ---------------------------------------------------------------------------

loc_AB66:                               ; CODE XREF: sub_AA7C+E1↑j
                brclr   0,y $10 loc_AB54
                bclr    0,y $1F
                bra     loc_AB49
; End of function sub_AA7C


; =============== S U B R O U T I N E =======================================


sub_AB71:                               ; CODE XREF: sub_9981+3↑P

; FUNCTION CHUNK AT AC0A SIZE 00000092 BYTES
; FUNCTION CHUNK AT ACB9 SIZE 00000075 BYTES

                brset   <byte_FA $40 loc_AB79 ; '@'
                rts
; ---------------------------------------------------------------------------

loc_AB76:                               ; CODE XREF: sub_AB71:loc_AB79↓j
                jmp     loc_AD29
; ---------------------------------------------------------------------------

loc_AB79:                               ; CODE XREF: sub_AB71↑j
                brset   <byte_FA $70 loc_AB76 ; 'p'
                ldab    SCDR            ; SCI Data (Read RDR, Write TDR)
                ldaa    SCSR            ; Serial Communications Status Register
                bita    #$20 ; ' '
                bne     loc_AB88
                rts
; ---------------------------------------------------------------------------

loc_AB88:                               ; CODE XREF: sub_AB71+14↑j
                ldx     #byte_17D
                ldaa    0,x
                bita    #3
                beq     loc_AB94
                jmp     loc_ABF6
; ---------------------------------------------------------------------------

loc_AB94:                               ; CODE XREF: sub_AB71+1E↑j
                cmpb    #$F8
                bcc     loc_AB9F

loc_AB98:                               ; CODE XREF: sub_AB71+33↓j
                                        ; sub_AB71+40↓j ...
                jsr     sub_AD57
                jsr     sub_AD2E
                rts
; ---------------------------------------------------------------------------

loc_AB9F:                               ; CODE XREF: sub_AB71+25↑j
                tsta
                bne     loc_ABAB
                cmpb    #$F8
                bne     loc_AB98
                ldaa    #$80
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ABAB:                               ; CODE XREF: sub_AB71+2F↑j
                cmpa    #$80
                bne     loc_ABB8
                cmpb    #$F9
                bne     loc_AB98
                ldaa    #$C0
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ABB8:                               ; CODE XREF: sub_AB71+3C↑j
                cmpa    #$C0
                bne     loc_ABC5
                cmpb    #$FB
                bne     loc_AB98
                ldaa    #$E0
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ABC5:                               ; CODE XREF: sub_AB71+49↑j
                cmpa    #$E0
                bne     loc_AB98
                cmpb    #$F8
                bne     loc_ABD2
                ldaa    #2
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ABD2:                               ; CODE XREF: sub_AB71+5A↑j
                cmpb    #$F9
                bne     loc_ABDB
                ldaa    #1
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ABDB:                               ; CODE XREF: sub_AB71+63↑j
                cmpb    #$FB
                bne     loc_AB98
                ldy     <byte_6B
                cpy     #$100
                bhi     loc_ABED
                ldaa    #5
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ABED:                               ; CODE XREF: sub_AB71+75↑j
                ldd     #$17
                jsr     sub_AD2E
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ABF6:                               ; CODE XREF: sub_AB71+20↑J
                bita    #1
                beq     loc_ABFD
                jmp     loc_AC0A
; ---------------------------------------------------------------------------

loc_ABFD:                               ; CODE XREF: sub_AB71+87↑j
                jmp     loc_ACB9
; End of function sub_AB71


; =============== S U B R O U T I N E =======================================


sub_AC00:                               ; CODE XREF: sub_AB71:loc_AD29↓P
                ldaa    SCSR            ; Serial Communications Status Register
                ldaa    SCDR            ; SCI Data (Read RDR, Write TDR)
                stab    SCDR            ; SCI Data (Read RDR, Write TDR)
                rts
; End of function sub_AC00

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_AB71

loc_AC0A:                               ; CODE XREF: sub_AB71+89↑J
                asla
                bcs     loc_AC61
                asla
                bcs     loc_AC32
                asla
                bcs     loc_AC27
                asla
                bcs     loc_AC1D
                stab    byte_181
                ldaa    #$10
                bra     loc_AC5C
; ---------------------------------------------------------------------------

loc_AC1D:                               ; CODE XREF: sub_AB71+A3↑j
                stab    byte_180
                jsr     sub_AD34
                ldaa    #$20 ; ' '
                bra     loc_AC5C
; ---------------------------------------------------------------------------

loc_AC27:                               ; CODE XREF: sub_AB71+A0↑j
                ldy     byte_180
                ldab    0,y
                ldaa    #$40 ; '@'
                bra     loc_AC5C
; ---------------------------------------------------------------------------

loc_AC32:                               ; CODE XREF: sub_AB71+9D↑j
                cmpb    #$FE
                beq     loc_AC43

loc_AC36:                               ; CODE XREF: sub_AB71+17A↓J
                jsr     sub_AD2E
                cmpb    #$1B
                bne     loc_AC40
                bset    <byte_FA $40 ; '@'

loc_AC40:                               ; CODE XREF: sub_AB71+CA↑j
                jmp     loc_AD29
; ---------------------------------------------------------------------------

loc_AC43:                               ; CODE XREF: sub_AB71+C3↑j
                ldaa    0,x
                bita    #4
                beq     loc_AC5A
                ldy     <byte_6B
                cpy     #$100
                bcs     loc_AC5A
                ldab    #$17
                jsr     sub_AD2E
                jmp     loc_AD29
; ---------------------------------------------------------------------------

loc_AC5A:                               ; CODE XREF: sub_AB71+D6↑j
                                        ; sub_AB71+DF↑j
                ldaa    #$80

loc_AC5C:                               ; CODE XREF: sub_AB71+AA↑j
                                        ; sub_AB71+B4↑j ...
                oraa    0,x
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_AC61:                               ; CODE XREF: sub_AB71+9A↑j
                sei
                ldy     byte_180
                cpy     #$9400
                bcc     loc_AC79
                stab    0,y

loc_AC6F:                               ; CODE XREF: sub_AB71+129↓j
                ldab    0,y
                jsr     sub_AD2E
                cli
                jmp     loc_AD29
; ---------------------------------------------------------------------------

loc_AC79:                               ; CODE XREF: sub_AB71+F9↑j
                ldx     #$4D0
                ldy     #loc_AC9C

loc_AC80:                               ; CODE XREF: sub_AB71+11B↓j
                ldaa    0,y
                staa    0,x
                inx
                iny
                cpy     #$ACB9
                bne     loc_AC80
                ldx     #$4D0
                ldy     byte_180
                jsr     0,x
                ldx     #$17D
                bra     loc_AC6F
; END OF FUNCTION CHUNK FOR sub_AB71
; ---------------------------------------------------------------------------

loc_AC9C:                               ; DATA XREF: sub_AB71+10B↑o
                ldaa    #$AA
                staa    loc_D555
                lsra
                staa    loc_AAAA
                ldaa    #$A0
                staa    loc_D555
                stab    0,y
                ldx     #0

loc_ACB0:                               ; CODE XREF: RESERVED:ACB6↓j
                cmpb    0,y
                beq     locret_ACB8
                dex
                bne     loc_ACB0

locret_ACB8:                            ; CODE XREF: RESERVED:ACB3↑j
                rts
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_AB71

loc_ACB9:                               ; CODE XREF: sub_AB71:loc_ABFD↑J
                asla
                bcs     loc_ACF5
                asla
                bcs     loc_ACE7
                asla
                bcs     loc_ACDD
                asla
                bcs     loc_ACD6
                asla
                bcs     loc_ACCF
                stab    byte_17F
                ldaa    #8
                bra     loc_ACF0
; ---------------------------------------------------------------------------

loc_ACCF:                               ; CODE XREF: sub_AB71+155↑j
                stab    byte_17E
                ldaa    #$10
                bra     loc_ACF0
; ---------------------------------------------------------------------------

loc_ACD6:                               ; CODE XREF: sub_AB71+152↑j
                stab    byte_181
                ldaa    #$20 ; ' '
                bra     loc_ACF0
; ---------------------------------------------------------------------------

loc_ACDD:                               ; CODE XREF: sub_AB71+14F↑j
                stab    byte_180
                jsr     sub_AD34
                ldaa    #$C0
                bra     loc_ACF0
; ---------------------------------------------------------------------------

loc_ACE7:                               ; CODE XREF: sub_AB71+14C↑j
                cmpb    #$FD
                beq     loc_ACEE
                jmp     loc_AC36
; ---------------------------------------------------------------------------

loc_ACEE:                               ; CODE XREF: sub_AB71+178↑j
                ldaa    #$80

loc_ACF0:                               ; CODE XREF: sub_AB71+15C↑j
                                        ; sub_AB71+163↑j ...
                oraa    0,x
                jmp     loc_AD27
; ---------------------------------------------------------------------------

loc_ACF5:                               ; CODE XREF: sub_AB71+149↑j
                ldx     byte_180
                ldy     byte_17E
                ldab    SCDR            ; SCI Data (Read RDR, Write TDR)
                ldaa    0,x
                staa    SCDR            ; SCI Data (Read RDR, Write TDR)
                inx
                dey
                bne     loc_AD11
                ldx     #$17D
                jsr     sub_AD2E
                pulx
                rts
; ---------------------------------------------------------------------------

loc_AD11:                               ; CODE XREF: sub_AB71+196↑j
                stx     byte_180
                sty     byte_17E
                cba
                bne     loc_AD1D
                pulx
                rts
; ---------------------------------------------------------------------------

loc_AD1D:                               ; CODE XREF: sub_AB71+1A8↑j
                ldaa    byte_17D
                anda    #$7F
                staa    byte_17D
                pulx
                rts
; ---------------------------------------------------------------------------

loc_AD27:                               ; CODE XREF: sub_AB71+37↑J
                                        ; sub_AB71+44↑J ...
                staa    0,x

loc_AD29:                               ; CODE XREF: sub_AB71:loc_AB76↑J
                                        ; sub_AB71:loc_AC40↑J ...
                jsr     sub_AC00
                pulx
                rts
; END OF FUNCTION CHUNK FOR sub_AB71

; =============== S U B R O U T I N E =======================================


sub_AD2E:                               ; CODE XREF: sub_AB71+2A↑P
                                        ; sub_AB71+7F↑P ...
                clr     0,x
                bclr    <byte_FA $40 ; '@'
                rts
; End of function sub_AD2E


; =============== S U B R O U T I N E =======================================


sub_AD34:                               ; CODE XREF: sub_AB71+AF↑P
                                        ; sub_AB71+16F↑P
                pshx
                ldx     byte_180
                cpx     #$8000
                bcs     loc_AD4C
                cpx     #$FFFF
                bhi     loc_AD4C
                cpx     #$B600
                bcs     loc_AD55
                cpx     #$B800
                bcc     loc_AD55

loc_AD4C:                               ; CODE XREF: sub_AD34+7↑j
                                        ; sub_AD34+C↑j
                pulx
                ldx     #byte_17D
                jsr     sub_AD2E
                pulx
                rts
; ---------------------------------------------------------------------------

loc_AD55:                               ; CODE XREF: sub_AD34+11↑j
                                        ; sub_AD34+16↑j
                pulx
                rts
; End of function sub_AD34


; =============== S U B R O U T I N E =======================================


sub_AD57:                               ; CODE XREF: sub_AB71:loc_AB98↑P
                cmpb    #$14
                beq     loc_AD5C
                rts
; ---------------------------------------------------------------------------

loc_AD5C:                               ; CODE XREF: sub_AD57+2↑j
                clr     byte_17D
                ldab    #$25 ; '%'
                stab    BAUD            ; SCI Baud Rate Control 3
                ldab    byte_17C
                addb    #$20 ; ' '
                stab    byte_17C
                bset    <byte_FA $30 ; '0'
                ldd     SCSR            ; Serial Communications Status Register
                pulx
                rts
; End of function sub_AD57

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_AF7A

loc_AD74:                               ; CODE XREF: sub_AF7A+C↓J
                ldaa    <byte_65
                asla
                asla
                bne     locret_AD8A
                ldaa    word_119
                bita    #$70 ; 'p'
                beq     loc_AD8B
                suba    #$10
                bita    #$70 ; 'p'
                beq     loc_AD8B
                staa    word_119

locret_AD8A:                            ; CODE XREF: sub_AF7A-202↑j
                rts
; ---------------------------------------------------------------------------

loc_AD8B:                               ; CODE XREF: sub_AF7A-1FB↑j
                                        ; sub_AF7A-1F5↑j
                ldab    <byte_EF
                eorb    #$40 ; '@'
                stab    <byte_EF
                bita    #$F
                beq     loc_AD9E
                deca
                bita    #$F
                beq     loc_AD9E
                oraa    #$10
                bra     loc_ADD3
; ---------------------------------------------------------------------------

loc_AD9E:                               ; CODE XREF: sub_AF7A-1E7↑j
                                        ; sub_AF7A-1E2↑j
                tsta
                bmi     loc_ADD7
                ldaa    #$AA
                ldab    <byte_F8
                cmpb    #$FE
                beq     loc_ADC7
                tstb
                bmi     loc_ADD3
                cmpb    #8
                bcs     loc_ADBA
                ldx     #$B618
                abx
                brset   0,x $FF loc_AE1F
                bra     loc_ADC1
; ---------------------------------------------------------------------------

loc_ADBA:                               ; CODE XREF: sub_AF7A-1CC↑j
                negb
                addb    #7
                ldx     #$3D ; '='
                abx

loc_ADC1:                               ; CODE XREF: sub_AF7A-1C2↑j
                ldab    0,x
                beq     loc_ADD3
                bra     loc_ADC8
; ---------------------------------------------------------------------------

loc_ADC7:                               ; CODE XREF: sub_AF7A-1D3↑j
                clrb

loc_ADC8:                               ; CODE XREF: sub_AF7A-1B5↑j
                ldx     #byte_AE30
                abx
                ldaa    0,x
                anda    #$F
                asla
                oraa    #$A0

loc_ADD3:                               ; CODE XREF: sub_AF7A-1DE↑j
                                        ; sub_AF7A-1D0↑j ...
                staa    word_119
                rts
; ---------------------------------------------------------------------------

loc_ADD7:                               ; CODE XREF: sub_AF7A-1DB↑j
                ldab    <byte_F8
                cmpb    #$FF
                bne     loc_ADE9
                ldaa    <byte_45
                cmpa    #$32 ; '2'
                bhi     loc_ADE9
                decb
                stab    <byte_F8
                clrb
                bra     loc_AE0E
; ---------------------------------------------------------------------------

loc_ADE9:                               ; CODE XREF: sub_AF7A-19F↑j
                                        ; sub_AF7A-199↑j
                cmpb    #$FE
                bne     loc_ADEE
                incb

loc_ADEE:                               ; CODE XREF: sub_AF7A-18F↑j
                incb
                stab    <byte_F8
                cmpb    #8
                bcs     loc_AE03
                brset   <byte_F8 $80 loc_AE28
                ldx     #$B618
                abx
                brset   0,x $FF loc_AE1F
                bra     loc_AE0A
; ---------------------------------------------------------------------------

loc_AE03:                               ; CODE XREF: sub_AF7A-187↑j
                negb
                addb    #7
                ldx     #$3D ; '='
                abx

loc_AE0A:                               ; CODE XREF: sub_AF7A-179↑j
                ldab    0,x
                beq     loc_AE1F

loc_AE0E:                               ; CODE XREF: sub_AF7A-193↑j
                ldx     #byte_AE30
                abx
                ldaa    0,x
                lsra
                lsra
                lsra
                lsra
                asla
                oraa    #$40 ; '@'
                staa    word_119
                rts
; ---------------------------------------------------------------------------

loc_AE1F:                               ; CODE XREF: sub_AF7A-1C6↑j
                                        ; sub_AF7A-17D↑j ...
                ldaa    #$4A ; 'J'
                staa    word_119
                bset    <byte_F8 $80
                rts
; ---------------------------------------------------------------------------

loc_AE28:                               ; CODE XREF: sub_AF7A-185↑j
                clra
                staa    <byte_F7
                staa    <byte_FA
                staa    <byte_F8
                rts
; END OF FUNCTION CHUNK FOR sub_AF7A
; ---------------------------------------------------------------------------
byte_AE30:      fcb $12                 ; DATA XREF: sub_AF7A:loc_ADC8↑o
                                        ; sub_AF7A:loc_AE0E↑o
                fcb $54
                fcb $53
                fcb $52
                fcb $51
                fcb $47
                fcb $46
                fcb $45
                fcb $52
                fcb $51
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
                fcb $52
                fcb $52
                fcb $21
                fcb $21
                fcb $51
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


sub_AE82:                               ; CODE XREF: sub_A266+33↑J
                                        ; sub_A2BC+6D↑P ...
                ldx     #byte_9030

loc_AE85:                               ; CODE XREF: sub_AE82+C↓j
                brclr   0,x $FF loc_AE90
                cmpa    0,x
                beq     loc_AEDC
                inx
                bra     loc_AE85
; ---------------------------------------------------------------------------

loc_AE90:                               ; CODE XREF: sub_AE82:loc_AE85↑j
                tstb
                bmi     loc_AE9B
                cmpa    <byte_44
                beq     loc_AED9
                cmpa    <byte_43
                beq     loc_AECF

loc_AE9B:                               ; CODE XREF: sub_AE82+F↑j
                andb    #$7F
                stab    FDRVar0
                ldy     #$124
                cmpa    0,y
                beq     loc_AEBC
                iny
                cmpa    0,y
                beq     loc_AEBC
                tst     0,y
                beq     loc_AEBC
                dey
                tst     0,y
                bne     loc_AEDC

loc_AEBC:                               ; CODE XREF: sub_AE82+25↑j
                                        ; sub_AE82+2C↑j ...
                staa    0,y
                ldab    2,y
                incb
                beq     loc_AEDF
                cmpb    FDRVar0
                bcc     loc_AEDF
                stab    2,y
                clc
                rts
; ---------------------------------------------------------------------------

loc_AECF:                               ; CODE XREF: sub_AE82+17↑j
                ldd     <byte_43
                staa    <byte_44
                stab    <byte_43
                ldaa    <byte_45
                staa    <byte_46

loc_AED9:                               ; CODE XREF: sub_AE82+13↑j
                clr     byte_45

loc_AEDC:                               ; CODE XREF: sub_AE82+9↑j
                                        ; sub_AE82+38↑j
                clra
                clc
                rts
; ---------------------------------------------------------------------------

loc_AEDF:                               ; CODE XREF: sub_AE82+41↑j
                                        ; sub_AE82+46↑j
                tst     byte_3D
                beq     loc_AEEF
                brset   <byte_4E $40 loc_AEEC ; '@'
                brclr   <byte_4E $20 loc_AEEF ; ' '

loc_AEEC:                               ; CODE XREF: sub_AE82+62↑j
                jmp     loc_AF77
; ---------------------------------------------------------------------------

loc_AEEF:                               ; CODE XREF: sub_AE82+60↑j
                                        ; sub_AE82+66↑j
                clr     0,y
                clr     2,y
                ldx     #$3D ; '='

loc_AEF8:                               ; CODE XREF: sub_AE82+83↓j
                cmpa    0,x
                bne     loc_AF01
                clrb
                stab    0,x
                bra     loc_AF09
; ---------------------------------------------------------------------------

loc_AF01:                               ; CODE XREF: sub_AE82+78↑j
                inx
                cpx     #$44 ; 'D'
                bls     loc_AEF8
                ldab    #$FF

loc_AF09:                               ; CODE XREF: sub_AE82+7D↑j
                ldx     #$44 ; 'D'
                ldy     #$45 ; 'E'
                stab    FDRVar0

loc_AF13:                               ; CODE XREF: sub_AE82+B1↓j
                cpx     #$42 ; 'B'
                bcs     loc_AF28
                psha
                ldab    0,y
                ldaa    FDRVar0
                staa    0,y
                iny
                stab    FDRVar0
                pula

loc_AF28:                               ; CODE XREF: sub_AE82+94↑j
                ldab    0,x
                staa    0,x
                tba
                beq     loc_AF62
                dex
                cpx     #$3D ; '='
                bcc     loc_AF13
                clr     byte_45
                sei
                brset   <byte_4E $40 loc_AF77 ; '@'
                brset   <byte_4E $20 loc_AF77 ; ' '
                bset    <byte_4E $40 ; '@'
                cli
                staa    byte_162
                ldx     #$B61F

loc_AF4B:                               ; CODE XREF: sub_AE82+D0↓j
                inx
                ldab    0,x
                cba
                beq     loc_AF5D
                incb
                bne     loc_AF4B
                xgdx
                subd    #$B600
                stab    byte_161
                sec
                rts
; ---------------------------------------------------------------------------

loc_AF5D:                               ; CODE XREF: sub_AE82+CD↑j
                bclr    <byte_4E $40 ; '@'
                sec
                rts
; ---------------------------------------------------------------------------

loc_AF62:                               ; CODE XREF: sub_AE82+AB↑j
                cpy     #$47 ; 'G'
                bhi     loc_AF72
                ldab    <byte_45
                beq     loc_AF75
                ldab    FDRVar0
                stab    0,y

loc_AF72:                               ; CODE XREF: sub_AE82+E4↑j
                clrb
                stab    <byte_45

loc_AF75:                               ; CODE XREF: sub_AE82+E8↑j
                sec
                rts
; ---------------------------------------------------------------------------

loc_AF77:                               ; CODE XREF: sub_AE82:loc_AEEC↑J
                                        ; sub_AE82+B7↑j ...
                clc
                cli
                rts
; End of function sub_AE82


; =============== S U B R O U T I N E =======================================


sub_AF7A:                               ; CODE XREF: __RESET+7C6↑P

; FUNCTION CHUNK AT AD74 SIZE 000000BC BYTES

                ldab    #$40 ; '@'
                brset   <byte_48 $40 loc_AF9F ; '@'
                ldaa    <byte_F7
                cmpa    #$A
                bne     loc_AF89
                jmp     loc_AD74
; ---------------------------------------------------------------------------

loc_AF89:                               ; CODE XREF: sub_AF7A+A↑j
                cmpa    #$18
                bne     loc_AF98
                ldaa    <byte_65
                asla
                bmi     loc_AF95
                jmp     loc_B04B
; ---------------------------------------------------------------------------

loc_AF95:                               ; CODE XREF: sub_AF7A+16↑j
                                        ; sub_AF7A:loc_AF98↓j
                jmp     loc_B04C
; ---------------------------------------------------------------------------

loc_AF98:                               ; CODE XREF: sub_AF7A+11↑j
                brset   <byte_4E 4 loc_AF95
                jmp     loc_B04B
; ---------------------------------------------------------------------------

loc_AF9F:                               ; CODE XREF: sub_AF7A+2↑j
                ldaa    <byte_1C
                bpl     loc_AFBE
                cmpa    byte_90A2
                bcc     loc_AFD7
                pshb
                ldd     #$2D81
                jsr     sub_AE82
                pulb
                bcc     loc_AFD7
                ldaa    byte_9039
                bita    #1
                beq     loc_AFD7
                bset    <byte_51 $80
                bra     loc_AFD7
; ---------------------------------------------------------------------------

loc_AFBE:                               ; CODE XREF: sub_AF7A+27↑j
                cmpa    byte_90A3
                bcs     loc_AFD7
                pshb
                ldd     #$4E81
                jsr     sub_AE82
                pulb
                bcc     loc_AFD7
                ldaa    byte_9039
                bita    #2
                beq     loc_AFD7
                bset    <byte_51 $80

loc_AFD7:                               ; CODE XREF: sub_AF7A+2C↑j
                                        ; sub_AF7A+36↑j ...
                ldaa    byte_8019
                bita    #$80
                beq     loc_B016
                ldaa    <byte_33
                bpl     loc_AFFD
                cmpa    byte_90A2
                bcc     loc_B016
                pshb
                ldd     #$3F81
                jsr     sub_AE82
                pulb
                bcc     loc_B016
                ldaa    byte_903B
                bita    #1
                beq     loc_B016
                bset    <byte_51 $80
                bra     loc_B016
; ---------------------------------------------------------------------------

loc_AFFD:                               ; CODE XREF: sub_AF7A+66↑j
                cmpa    byte_90A3
                bcs     loc_B016
                pshb
                ldd     #$4381
                jsr     sub_AE82
                pulb
                bcc     loc_B016
                ldaa    byte_903B
                bita    #2
                beq     loc_B016
                bset    <byte_51 $80

loc_B016:                               ; CODE XREF: sub_AF7A+62↑j
                                        ; sub_AF7A+6B↑j ...
                brset   <byte_51 $80 loc_B04B
                ldx     <byte_64
                cpx     #3
                bls     loc_B04C
                bclr    <byte_2 $C0
                brclr   <byte_EF $40 loc_B04B ; '@'
                ldaa    <byte_F2
                bita    byte_9038
                bne     loc_B04B
                ldaa    <byte_F3
                bita    byte_9039
                bne     loc_B04B
                ldaa    <byte_F5
                bita    byte_903A
                bne     loc_B04B
                ldaa    <byte_F4
                bita    byte_903B
                bne     loc_B04B
                ldaa    <byte_F6
                bita    byte_903C
                beq     loc_B04C

loc_B04B:                               ; CODE XREF: sub_AF7A+18↑J
                                        ; sub_AF7A+22↑J ...
                clrb

loc_B04C:                               ; CODE XREF: sub_AF7A:loc_AF95↑J
                                        ; sub_AF7A+A5↑j ...
                ldaa    #$BF
                anda    <byte_EF
                aba
                staa    <byte_EF
                rts
; End of function sub_AF7A


; =============== S U B R O U T I N E =======================================


sub_B054:                               ; CODE XREF: __RESET+793↑P
                ldd     byte_124
                tsta
                beq     loc_B062
                dec     byte_126
                bne     loc_B062
                clr     byte_124

loc_B062:                               ; CODE XREF: sub_B054+4↑j
                                        ; sub_B054+9↑j
                tstb
                beq     loc_B06D
                dec     byte_127
                bne     loc_B06D
                clr     byte_125

loc_B06D:                               ; CODE XREF: sub_B054+F↑j
                                        ; sub_B054+14↑j
                ldaa    byte_164
                beq     locret_B07C
                suba    #$10
                bita    #$F0
                bne     loc_B079
                clra

loc_B079:                               ; CODE XREF: sub_B054+22↑j
                staa    byte_164

locret_B07C:                            ; CODE XREF: sub_B054+1C↑j
                rts
; End of function sub_B054


; =============== S U B R O U T I N E =======================================


sub_B07D:                               ; CODE XREF: __RESET+809↑P
                brclr   <byte_48 $40 locret_B0B6 ; '@'
                brset   <byte_50 4 locret_B0B6
                brset   <byte_4E $40 locret_B0B6 ; '@'
                bset    <byte_50 4
                brclr   <byte_44 $FF loc_B0AF
                ldaa    <byte_45
                cmpa    #$32 ; '2'
                bcs     loc_B099
                jmp     sub_9BB0
; ---------------------------------------------------------------------------

loc_B099:                               ; CODE XREF: sub_B07D+17↑j
                ldaa    <byte_42
                beq     loc_B0A4
                ldaa    <byte_47
                inca
                beq     loc_B0A4
                staa    <byte_47

loc_B0A4:                               ; CODE XREF: sub_B07D+1E↑j
                                        ; sub_B07D+23↑j
                ldaa    <byte_43
                beq     loc_B0AF
                ldaa    <byte_46
                inca
                beq     loc_B0AF
                staa    <byte_46

loc_B0AF:                               ; CODE XREF: sub_B07D+F↑j
                                        ; sub_B07D+29↑j ...
                ldaa    <byte_45
                inca
                beq     locret_B0B6
                staa    <byte_45

locret_B0B6:                            ; CODE XREF: sub_B07D↑j
                                        ; sub_B07D+4↑j ...
                rts
; End of function sub_B07D


; =============== S U B R O U T I N E =======================================


sub_B0B7:                               ; CODE XREF: sub_A730+71↑P
                                        ; sub_A730+C1↑P ...
                anda    #$F
                ldab    byte_164
                beq     loc_B0C6
                andb    #$F
                cba
                bne     locret_B0CD
                ldaa    byte_164

loc_B0C6:                               ; CODE XREF: sub_B0B7+5↑j
                adda    #$10
                bcs     loc_B0CE
                staa    byte_164

locret_B0CD:                            ; CODE XREF: sub_B0B7+A↑j
                rts
; ---------------------------------------------------------------------------

loc_B0CE:                               ; CODE XREF: sub_B0B7+11↑j
                ldab    #1

loc_B0D0:                               ; CODE XREF: sub_B0B7+1D↓j
                deca
                beq     loc_B0D6
                aslb
                bra     loc_B0D0
; ---------------------------------------------------------------------------

loc_B0D6:                               ; CODE XREF: sub_B0B7+1A↑j
                clr     byte_164
                comb
                sei
                andb    <byte_F2
                stab    <byte_F2
                cli
                rts
; End of function sub_B0B7


; =============== S U B R O U T I N E =======================================


sub_B0E1:                               ; CODE XREF: sub_D14D:loc_D182↓P
                                        ; IC1I:loc_FBAB↓P ...
                ldab    <byte_6B
                cmpb    #$7D ; '}'
                ldaa    #0
                bcc     loc_B0FF
                subb    #$10
                bcc     loc_B0EE
                clrb

loc_B0EE:                               ; CODE XREF: sub_B0E1+A↑j
                ldaa    #$29 ; ')'
                mul
                lsld
                aslb
                adca    <byte_3
                tab
                ldaa    <byte_6E
                adda    byte_9080
                sba
                bcc     loc_B0FF
                clra

loc_B0FF:                               ; CODE XREF: sub_B0E1+6↑j
                                        ; sub_B0E1+1B↑j
                ldx     #byte_906C
                jsr     sub_F0B5
                adda    byte_907F
                bcc     locret_B10C
                ldaa    #$FF

locret_B10C:                            ; CODE XREF: sub_B0E1+27↑j
                rts
; End of function sub_B0E1


; =============== S U B R O U T I N E =======================================


sub_B10D:                               ; CODE XREF: __RESET+18E↑P
                                        ; __RESET+7A4↑P
                brset   <byte_4E $40 locret_B14D ; '@'
                ldaa    PPROG           ; EEPROM Program Control Register
                bita    #2
                bne     locret_B14D
                ldaa    byte_B7E1
                coma
                cmpa    byte_B7E0
                beq     loc_B123
                ldaa    #8

loc_B123:                               ; CODE XREF: sub_B10D+12↑j
                staa    <byte_7E
                ldaa    byte_B615
                coma
                cmpa    byte_B614
                beq     loc_B131
                clra
                bra     loc_B13D
; ---------------------------------------------------------------------------

loc_B131:                               ; CODE XREF: sub_B10D+1F↑j
                cmpa    #$C
                ble     loc_B137
                ldaa    #$C

loc_B137:                               ; CODE XREF: sub_B10D+26↑j
                cmpa    #$F4
                bge     loc_B13D
                ldaa    #$F4

loc_B13D:                               ; CODE XREF: sub_B10D+22↑j
                                        ; sub_B10D+2C↑j
                staa    <byte_67
                ldaa    byte_B7EF
                cmpa    #$55 ; 'U'
                bne     loc_B14A
                bset    <byte_5B $80
                rts
; ---------------------------------------------------------------------------

loc_B14A:                               ; CODE XREF: sub_B10D+37↑j
                bclr    <byte_5B $80

locret_B14D:                            ; CODE XREF: sub_B10D↑j
                                        ; sub_B10D+9↑j
                rts
; End of function sub_B10D


; =============== S U B R O U T I N E =======================================


sub_B14E:                               ; CODE XREF: sub_B22F+5F↓P
                ldab    #$93
                ldaa    FDRVar0
                bne     loc_B157
                ldab    #$80

loc_B157:                               ; CODE XREF: sub_B14E+5↑j
                aba
                adda    FDRVar1
                adda    FDRVar2
                staa    FDRVar3
                tba
                ldab    #$40 ; '@'
                ldy     #PORTA          ; Port A data
                ldx     #SwitchPortAccessReg1
                sei
                bset    0,x 8
                bclr    8,y $20 ; ' '
                cmpb    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                cmpa    SPSR            ; SPI Status Register
                ldaa    FDRVar0

loc_B189:                               ; CODE XREF: sub_B14E+40↓j
                brclr   0,x 8 loc_B193
                decb
                bne     loc_B189
                jmp     loc_B22C
; ---------------------------------------------------------------------------

loc_B193:                               ; CODE XREF: sub_B14E:loc_B189↑j
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                staa    FDRVar0
                cmpa    SPSR            ; SPI Status Register
                ldaa    FDRVar1

loc_B1A9:                               ; CODE XREF: sub_B14E+60↓j
                brclr   0,x 8 loc_B1B3
                decb
                bne     loc_B1A9
                jmp     loc_B22C
; ---------------------------------------------------------------------------

loc_B1B3:                               ; CODE XREF: sub_B14E:loc_B1A9↑j
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                staa    FDRVar1
                cmpa    SPSR            ; SPI Status Register
                ldaa    FDRVar2

loc_B1C9:                               ; CODE XREF: sub_B14E+80↓j
                brclr   0,x 8 loc_B1D3
                decb
                bne     loc_B1C9
                jmp     loc_B22C
; ---------------------------------------------------------------------------

loc_B1D3:                               ; CODE XREF: sub_B14E:loc_B1C9↑j
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop
                ldaa    SPDR            ; SPI Data Register
                staa    FDRVar2
                cmpa    SPSR            ; SPI Status Register
                ldaa    FDRVar3

loc_B1E9:                               ; CODE XREF: sub_B14E+A0↓j
                brclr   0,x 8 loc_B1F2
                decb
                bne     loc_B1E9
                bra     loc_B22C
; ---------------------------------------------------------------------------

loc_B1F2:                               ; CODE XREF: sub_B14E:loc_B1E9↑j
                staa    SPDR            ; SPI Data Register
                bset    2,x 8
                bclr    2,x 8
                nop

loc_B1FC:                               ; CODE XREF: sub_B14E+B4↓j
                brset   $29,y $80 loc_B206
                decb
                bne     loc_B1FC
                bra     loc_B22C
; ---------------------------------------------------------------------------

loc_B206:                               ; CODE XREF: sub_B14E:loc_B1FC↑j
                ldaa    SPDR            ; SPI Data Register
                bset    8,y $20 ; ' '
                cli
                suba    FDRVar0
                suba    FDRVar1
                suba    FDRVar2
                bne     locret_B22E
                ldaa    FDRVar0
                anda    #$F
                cmpa    #1
                bne     locret_B22E
                bset    <byte_FB $40 ; '@'
                brset   <byte_FC $80 locret_B22E
                bset    <byte_FE $10

loc_B22C:                               ; CODE XREF: sub_B14E+42↑J
                                        ; sub_B14E+62↑J ...
                nop
                cli

locret_B22E:                            ; CODE XREF: sub_B14E+C9↑j
                                        ; sub_B14E+D2↑j ...
                rts
; End of function sub_B14E


; =============== S U B R O U T I N E =======================================


sub_B22F:                               ; CODE XREF: __RESET+761↑P
                ldab    <byte_65
                andb    #$F
                bne     loc_B277
                brset   <byte_FE 8 loc_B25B
                ldaa    <byte_64
                cmpa    #$83
                bcs     loc_B273
                ldaa    <byte_6B
                cmpa    #$2F ; '/'
                bcs     loc_B273
                ldaa    <byte_76
                cmpa    #$BD
                bcc     loc_B273
                ldab    byte_12A
                incb
                stab    byte_12A
                cmpb    #$71 ; 'q'
                bcs     loc_B277
                bset    <byte_FE 8
                bra     loc_B273
; ---------------------------------------------------------------------------

loc_B25B:                               ; CODE XREF: sub_B22F+6↑j
                ldaa    <byte_7D
                suba    <byte_76
                bcs     loc_B265
                cmpa    #1
                bhi     loc_B273

loc_B265:                               ; CODE XREF: sub_B22F+30↑j
                ldab    byte_12A
                incb
                stab    byte_12A
                cmpb    #$22 ; '"'
                bcs     loc_B277
                bclr    <byte_FE 8

loc_B273:                               ; CODE XREF: sub_B22F+E↑j
                                        ; sub_B22F+14↑j ...
                clra
                staa    byte_12A

loc_B277:                               ; CODE XREF: sub_B22F+4↑j
                                        ; sub_B22F+25↑j ...
                brset   <byte_65 1 loc_B291
                ldx     #off_B454
                ldab    <byte_FD
                lsld
                addb    #2
                abx
                lsrd
                stab    <byte_FD
                ldx     0,x
                jsr     0,x
                std     FDRVar1
                jsr     sub_B14E

loc_B291:                               ; CODE XREF: sub_B22F:loc_B277↑j
                ldaa    byte_177
                bne     locret_B29E
                ldaa    byte_8014
                beq     loc_B29F
                bclr    <byte_FB $20 ; ' '

locret_B29E:                            ; CODE XREF: sub_B22F+65↑j
                rts
; ---------------------------------------------------------------------------

loc_B29F:                               ; CODE XREF: sub_B22F+6A↑j
                ldaa    PPROG           ; EEPROM Program Control Register
                bita    #2
                bne     loc_B2B3
                bclr    <byte_FE $20 ; ' '
                ldaa    byte_B612
                bita    #1
                beq     loc_B2B3
                bset    <byte_FE $20 ; ' '

loc_B2B3:                               ; CODE XREF: sub_B22F+75↑j
                                        ; sub_B22F+7F↑j
                ldaa    <byte_65
                bita    #3
                bne     loc_B318
                brclr   <byte_FB $40 loc_B2DB ; '@'
                bset    <byte_FB $80
                bclr    <byte_FB $60 ; '`'
                bclr    <byte_FC $7F
                brset   <byte_FC $80 loc_B318
                ldaa    <byte_4E
                bita    #$60 ; '`'
                bne     loc_B318
                ldaa    byte_B612
                bita    #2
                beq     loc_B318
                anda    #$FD
                bra     loc_B304
; ---------------------------------------------------------------------------

loc_B2DB:                               ; CODE XREF: sub_B22F+8A↑j
                ldaa    <byte_FC
                anda    #$7F
                brclr   <byte_FB $80 loc_B2E9
                cmpa    #$71 ; 'q'
                bcc     loc_B2F2
                bra     loc_B2ED
; ---------------------------------------------------------------------------

loc_B2E9:                               ; CODE XREF: sub_B22F+B0↑j
                cmpa    #$2D ; '-'
                bcc     loc_B318

loc_B2ED:                               ; CODE XREF: sub_B22F+B8↑j
                inc     byte_FC
                bra     loc_B318
; ---------------------------------------------------------------------------

loc_B2F2:                               ; CODE XREF: sub_B22F+B6↑j
                ldaa    <byte_4E
                bita    #$60 ; '`'
                bne     loc_B318
                ldaa    byte_B612
                bita    #2
                bne     loc_B318
                bset    <byte_FC $80
                oraa    #2

loc_B304:                               ; CODE XREF: sub_B22F+AA↑j
                sei
                brclr   <byte_4E $40 loc_B30C ; '@'
                cli
                bra     loc_B318
; ---------------------------------------------------------------------------

loc_B30C:                               ; CODE XREF: sub_B22F+D6↑j
                bset    <byte_4E $40 ; '@'
                cli
                staa    byte_162
                ldaa    #$12
                staa    byte_161

loc_B318:                               ; CODE XREF: sub_B22F+88↑j
                                        ; sub_B22F+97↑j ...
                brclr   <byte_FB $10 loc_B32C
                brset   <byte_FB $80 locret_B32B
                ldaa    <byte_FC
                anda    #$7F
                cmpa    #$2D ; '-'
                bcs     locret_B32B
                bset    <byte_FB $20 ; ' '

locret_B32B:                            ; CODE XREF: sub_B22F+ED↑j
                                        ; sub_B22F+F7↑j
                rts
; ---------------------------------------------------------------------------

loc_B32C:                               ; CODE XREF: sub_B22F:loc_B318↑j
                brset   <byte_FB $10 locret_B37C
                brclr   <byte_48 $40 locret_B37C ; '@'
                ldaa    <byte_4E
                bita    #$60 ; '`'
                bne     locret_B37C
                ldaa    byte_B612
                bita    #1
                bne     loc_B347
                bita    #2
                bne     loc_B376
                bra     loc_B379
; ---------------------------------------------------------------------------

loc_B347:                               ; CODE XREF: sub_B22F+110↑j
                brset   <byte_FB $80 loc_B355
                ldaa    <byte_FC
                anda    #$7F
                cmpa    #$2D ; '-'
                bcs     locret_B37C
                bra     loc_B373
; ---------------------------------------------------------------------------

loc_B355:                               ; CODE XREF: sub_B22F:loc_B347↑j
                sei
                brclr   <byte_4E $40 loc_B35D ; '@'
                cli
                bra     locret_B37C
; ---------------------------------------------------------------------------

loc_B35D:                               ; CODE XREF: sub_B22F+127↑j
                bset    <byte_4E $40 ; '@'
                cli
                adda    #4
                cmpa    #$4C ; 'L'
                bcs     loc_B369
                anda    #$FE

loc_B369:                               ; CODE XREF: sub_B22F+136↑j
                anda    #$FD
                staa    byte_162
                ldaa    #$12
                staa    byte_161

loc_B373:                               ; CODE XREF: sub_B22F+124↑j
                bset    <byte_FE $20 ; ' '

loc_B376:                               ; CODE XREF: sub_B22F+114↑j
                bset    <byte_FB $80

loc_B379:                               ; CODE XREF: sub_B22F+116↑j
                bset    <byte_FB $10

locret_B37C:                            ; CODE XREF: sub_B22F:loc_B32C↑j
                                        ; sub_B22F+101↑j ...
                rts
; End of function sub_B22F

; ---------------------------------------------------------------------------

loc_B37D:                               ; CODE XREF: RESERVED:loc_B3CD↓j
                                        ; RESERVED:loc_B3CF↓j ...
                clra
                clrb
                staa    FDRVar0
                rts
; ---------------------------------------------------------------------------

loc_B383:                               ; DATA XREF: RESERVED:off_B454↓o
                                        ; RESERVED:B45C↓o ...
                ldaa    #$E4
                staa    FDRVar0
                ldaa    <byte_6B
                ldab    <byte_6D
                rts
; ---------------------------------------------------------------------------

loc_B38D:                               ; DATA XREF: RESERVED:B456↓o
                                        ; RESERVED:B466↓o ...
                ldaa    #$84
                staa    FDRVar0
                sei
                ldaa    word_158
                ldab    byte_15A
                clr     word_158
                clr     byte_15A
                cli
                rts
; ---------------------------------------------------------------------------

loc_B3A1:                               ; DATA XREF: RESERVED:B458↓o
                                        ; RESERVED:B468↓o ...
                ldaa    #$44 ; 'D'
                staa    FDRVar0
                sei
                ldaa    byte_15B
                clrb
                clr     byte_15B
                cli
                rts
; ---------------------------------------------------------------------------

loc_B3B0:                               ; DATA XREF: RESERVED:B53E↓o
                ldaa    #$AC
                staa    FDRVar0
                ldd     byte_8012
                rts
; ---------------------------------------------------------------------------

loc_B3B9:                               ; DATA XREF: RESERVED:B49E↓o
                                        ; RESERVED:B51E↓o
                ldaa    #$8C
                staa    FDRVar0
                ldaa    <byte_72
                ldab    <byte_7F
                rts
; ---------------------------------------------------------------------------

loc_B3C3:                               ; DATA XREF: RESERVED:B45E↓o
                                        ; RESERVED:B4DE↓o
                ldaa    #$D4
                staa    FDRVar0
                ldaa    <byte_76
                ldab    <byte_7D
                rts
; ---------------------------------------------------------------------------

loc_B3CD:                               ; DATA XREF: RESERVED:B46E↓o
                                        ; RESERVED:B48E↓o ...
                bra     loc_B37D
; ---------------------------------------------------------------------------

loc_B3CF:                               ; DATA XREF: RESERVED:B4BE↓o
                bra     loc_B37D
; ---------------------------------------------------------------------------

loc_B3D1:                               ; DATA XREF: RESERVED:B47E↓o
                jmp     loc_B37D
; ---------------------------------------------------------------------------

loc_B3D4:                               ; DATA XREF: RESERVED:B462↓o
                                        ; RESERVED:B482↓o ...
                ldaa    #$24 ; '$'
                staa    FDRVar0
                ldd     <byte_78
                lsld
                lsld
                staa    FDRVar3
                lsld
                bcc     loc_B3E5
                ldaa    #$FF

loc_B3E5:                               ; CODE XREF: RESERVED:B3E1↑j
                ldab    #$34 ; '4'
                mul
                lsld
                lsld
                aslb
                adca    #0
                tab
                ldaa    FDRVar3
                rts
; ---------------------------------------------------------------------------

loc_B3F2:                               ; DATA XREF: RESERVED:B4FE↓o
                jmp     loc_B37D
; ---------------------------------------------------------------------------

loc_B3F5:                               ; DATA XREF: RESERVED:B4DA↓o
                ldaa    #$EC
                staa    FDRVar0
                clra
                brclr   <byte_F2 2 loc_B401
                oraa    #1

loc_B401:                               ; CODE XREF: RESERVED:B3FB↑j
                brclr   <byte_F2 $40 loc_B407 ; '@'
                oraa    #2

loc_B407:                               ; CODE XREF: RESERVED:loc_B401↑j
                brclr   <byte_FE 8 loc_B40D
                oraa    #4

loc_B40D:                               ; CODE XREF: RESERVED:loc_B407↑j
                brclr   <byte_F2 $20 loc_B413 ; ' '
                oraa    #8

loc_B413:                               ; CODE XREF: RESERVED:loc_B40D↑j
                clrb
                brclr   <byte_FE $10 loc_B41D
                bclr    <byte_FE $10
                orab    #1

loc_B41D:                               ; CODE XREF: RESERVED:B414↑j
                brclr   <byte_FE $20 locret_B423 ; ' '
                orab    #2

locret_B423:                            ; CODE XREF: RESERVED:loc_B41D↑j
                rts
; ---------------------------------------------------------------------------

loc_B424:                               ; DATA XREF: RESERVED:B46A↓o
                                        ; RESERVED:B48A↓o ...
                ldaa    #$A4
                staa    FDRVar0
                clra
                brset   <byte_5F $80 loc_B430
                oraa    #1

loc_B430:                               ; CODE XREF: RESERVED:B42A↑j
                ldab    <byte_6E
                subb    <byte_3
                bcs     loc_B43C
                cmpb    #5
                bcs     loc_B43C
                oraa    #2

loc_B43C:                               ; CODE XREF: RESERVED:B434↑j
                                        ; RESERVED:B438↑j
                brclr   <byte_7B $20 loc_B442 ; ' '
                oraa    #4

loc_B442:                               ; CODE XREF: RESERVED:loc_B43C↑j
                brclr   <byte_F0 1 loc_B448
                oraa    #8

loc_B448:                               ; CODE XREF: RESERVED:loc_B442↑j
                brset   <byte_EF $40 loc_B44E ; '@'
                oraa    #$20 ; ' '

loc_B44E:                               ; CODE XREF: RESERVED:loc_B448↑j
                ldab    <byte_7B
                andb    #$E
                lsrb
                rts
; ---------------------------------------------------------------------------
off_B454:       fdb loc_B383            ; DATA XREF: sub_B22F+4C↑o
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B3C3
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B3D1
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B3B9
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B3CF
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B3F5
                fdb loc_B383
                fdb loc_B3C3
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B3F2
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B3B9
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B37D
                fdb loc_B383
                fdb loc_B3B0
                fdb loc_B37D
                fdb loc_B3D4
                fdb loc_B383
                fdb loc_B38D
                fdb loc_B3A1
                fdb loc_B424
                fdb loc_B383
                fdb loc_B3CD
                fdb loc_B37D
                fdb loc_B37D

; =============== S U B R O U T I N E =======================================


sub_B554:                               ; CODE XREF: __RESET:loc_987A↑P
                ldaa    <byte_F7
                cmpa    #$A
                bne     loc_B55E
                bset    <byte_F0 $10
                rts
; ---------------------------------------------------------------------------

loc_B55E:                               ; CODE XREF: sub_B554+4↑j
                cmpa    #$18
                bne     loc_B5AD
                ldaa    <byte_FA
                bita    #$30 ; '0'
                bne     loc_B5AD
                ldaa    byte_116
                cmpa    #$50 ; 'P'
                bls     loc_B59E
                ldaa    <byte_F8
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
                bne     loc_B59E
                bset    <byte_55 $10
                tst     byte_65
                bne     loc_B592
                deca
                beq     loc_B59E
                andb    #$F0
                addb    #$10
                aba
                staa    <byte_F8

loc_B592:                               ; CODE XREF: sub_B554+32↑j
                ldaa    #$E1
                jsr     sub_9CA1
                sei
                ldaa    <byte_F0
                anda    #$EF
                bra     loc_B5DD
; ---------------------------------------------------------------------------

loc_B59E:                               ; CODE XREF: sub_B554+19↑j
                                        ; sub_B554+2A↑j ...
                clra
                staa    <byte_F7
                staa    byte_128
                bclr    <byte_55 $10
                bclr    <byte_FA $30 ; '0'
                jsr     sub_9CA1

loc_B5AD:                               ; CODE XREF: sub_B554+C↑j
                                        ; sub_B554+12↑j
                ldx     #$5B ; '['
                ldab    #4
                ldaa    <byte_76
                cmpa    #$B2
                brset   <byte_4B 4 loc_B5C6
                bcc     loc_B5CA
                ldaa    <byte_72
                cmpa    #$8F
                bcc     loc_B5CA
                ldab    #$B
                bra     loc_B5CA
; ---------------------------------------------------------------------------

loc_B5C6:                               ; CODE XREF: sub_B554+62↑j
                bcs     loc_B5CA
                ldab    #3

loc_B5CA:                               ; CODE XREF: sub_B554+66↑j
                                        ; sub_B554+6C↑j ...
                sei
                ldaa    <byte_F0
                anda    #$EF
                cmpb    byte_115
                bhi     loc_B5DD
                cpx     <byte_64
                bhi     loc_B5DD
                oraa    #$10
                bclr    <byte_AA $FF

loc_B5DD:                               ; CODE XREF: sub_B554+48↑j
                                        ; sub_B554+7E↑j ...
                staa    <byte_F0
                cli
                brclr   <byte_48 $40 locret_B5ED ; '@'
                ldab    <byte_64
                cmpb    #4
                bcs     locret_B5ED
                bset    <byte_4B 4

locret_B5ED:                            ; CODE XREF: sub_B554+8C↑j
                                        ; sub_B554+94↑j
                rts
; End of function sub_B554

; ===========================================================================

; Segment type: Pure data
                ; segment EEPROM
 ORG $B600
  OPT NOL
 REPEAT $200
 fcb $FF
 OPT LIS
word_B610 equ $B610 ;fdb $5AA5
byte_B612 equ $B612
byte_B614 equ $B614
byte_B615 equ $B615
byte_B618 equ $B618
byte_B7E0 equ $B7E0
byte_B7E1 equ $B7E1
byte_B7EF equ $B7EF
; end of 'EEPROM'

; ===========================================================================

; Segment type: Uninitialized
                ; segment RESERVED
 ORG $B800

; =============== S U B R O U T I N E =======================================


sub_B800:                               ; CODE XREF: __RESET+7BD↑P
                clr     STe_648A
                ldx     #byte_80B1
                ldaa    <byte_50
                bita    #$50 ; 'P'
                bne     loc_B834
                brset   <byte_4C 4 loc_B819
                brclr   <byte_F0 2 loc_B844
                ldx     #byte_814D
                bra     loc_B844
; ---------------------------------------------------------------------------

loc_B819:                               ; CODE XREF: sub_B800+C↑j
                ldaa    byte_123
                tsta
                beq     loc_B828
                brset   <byte_F0 2 loc_B844
                ldx     #byte_814D
                bra     loc_B844
; ---------------------------------------------------------------------------

loc_B828:                               ; CODE XREF: sub_B800+1D↑j
                brclr   <byte_F0 2 loc_B838
                bclr    <byte_48 $20 ; ' '
                bset    <byte_4D 2
                bra     loc_B841
; ---------------------------------------------------------------------------

loc_B834:                               ; CODE XREF: sub_B800+A↑j
                brset   <byte_48 $20 loc_B841 ; ' '

loc_B838:                               ; CODE XREF: sub_B800:loc_B828↑j
                ldx     #byte_814D
                bset    <byte_48 $20 ; ' '
                bset    <byte_4D 2

loc_B841:                               ; CODE XREF: sub_B800+32↑j
                                        ; sub_B800:loc_B834↑j
                bclr    <byte_4C 4

loc_B844:                               ; CODE XREF: sub_B800+10↑j
                                        ; sub_B800+17↑j ...
                ldaa    byte_13E
                ldab    <byte_C1
                jsr     sub_F126
                bpl     loc_B850
                ldaa    #$7F

loc_B850:                               ; CODE XREF: sub_B800+4C↑j
                staa    Temp5_t3
                brclr   <byte_48 $10 loc_B870
                ldx     #byte_81EA
                ldaa    byte_13E
                ldab    <byte_C1
                jsr     sub_F126
                bpl     loc_B866
                ldaa    #$7F

loc_B866:                               ; CODE XREF: sub_B800+62↑j
                adda    Temp5_t3
                bpl     loc_B86D
                ldaa    #$7F

loc_B86D:                               ; CODE XREF: sub_B800+69↑j
                staa    Temp5_t3

loc_B870:                               ; CODE XREF: sub_B800+53↑j
                brset   <byte_48 1 loc_B89B
                ldaa    <byte_72
                cmpa    byte_836F
                bcs     loc_B88B
                cmpa    byte_836E
                bcc     loc_B88B
                bset    <byte_B4 2
                ldaa    byte_8370
                staa    byte_102
                bra     loc_B8B5
; ---------------------------------------------------------------------------

loc_B88B:                               ; CODE XREF: sub_B800+79↑j
                                        ; sub_B800+7E↑j
                cmpa    byte_8374
                bcs     loc_B8B5
                bset    <byte_B4 2
                ldaa    byte_8373
                staa    byte_102
                bra     loc_B8B5
; ---------------------------------------------------------------------------

loc_B89B:                               ; CODE XREF: sub_B800:loc_B870↑j
                brset   <byte_B4 1 loc_B8B5
                brclr   <byte_B4 2 loc_B8B5
                tst     byte_102
                beq     loc_B8B2
                tst     byte_65
                bne     loc_B8B5
                dec     byte_102
                bra     loc_B8B5
; ---------------------------------------------------------------------------

loc_B8B2:                               ; CODE XREF: sub_B800+A6↑j
                bset    <byte_B4 1

loc_B8B5:                               ; CODE XREF: sub_B800+89↑j
                                        ; sub_B800+8E↑j ...
                brclr   <byte_B4 2 loc_B8CE
                ldx     #byte_807E
                ldd     <byte_6B
                aslb
                adca    #0
                jsr     sub_F0B5
                ldab    <byte_C1
                ldx     #byte_833C
                jsr     sub_F126
                bra     loc_B927
; ---------------------------------------------------------------------------

loc_B8CE:                               ; CODE XREF: sub_B800:loc_B8B5↑j
                jsr     sub_BB94
                ldx     #byte_8286
                abx
                ldaa    0,x
                cmpa    <byte_C1
                bcc     loc_B92C
                bset    <byte_4B $40 ; '@'
                ldx     #byte_808D
                ldaa    <byte_72
                jsr     sub_F0B5
                ldab    <byte_C1
                ldx     #byte_8294
                jsr     sub_F126
                staa    STe_648A
                ldx     #byte_806B
                ldaa    <byte_6F
                jsr     sub_F0B5
                ldab    <byte_C1
                ldx     #byte_82E8
                jsr     sub_F126
                adda    STe_648A
                bvc     loc_B90F
                ldaa    #$80
                tst     STe_648A
                bmi     loc_B90F
                ldaa    #$7F

loc_B90F:                               ; CODE XREF: sub_B800+104↑j
                                        ; sub_B800+10B↑j
                staa    STe_648A
                ldab    <byte_8
                cmpb    byte_836C
                bcc     loc_B92F
                suba    byte_836D
                bvc     loc_B927
                ldaa    #$80
                tst     STe_648A
                bmi     loc_B927
                ldaa    #$7F

loc_B927:                               ; CODE XREF: sub_B800+CC↑j
                                        ; sub_B800+11C↑j ...
                staa    STe_648A
                bra     loc_B92F
; ---------------------------------------------------------------------------

loc_B92C:                               ; CODE XREF: sub_B800+D9↑j
                bclr    <byte_4B $40 ; '@'

loc_B92F:                               ; CODE XREF: sub_B800+117↑j
                                        ; sub_B800+12A↑j
                jsr     sub_BB76
                ldaa    byte_8379
                beq     loc_B972
                ldx     #byte_837B
                ldaa    <byte_72
                jsr     sub_F0B5
                brclr   <byte_4B $10 loc_B956
                addb    byte_837A
                bpl     loc_B94A
                ldab    #$7F

loc_B94A:                               ; CODE XREF: sub_B800+146↑j
                stab    Temp5_t3
                brclr   <byte_B4 2 loc_B954
                jsr     sub_BB76

loc_B954:                               ; CODE XREF: sub_B800+14D↑j
                bra     loc_B972
; ---------------------------------------------------------------------------

loc_B956:                               ; CODE XREF: sub_B800+13F↑j
                stab    STe_648A
                ldaa    <byte_6D
                ldx     #byte_839E
                jsr     sub_F0B5
                ldaa    STe_648A
                mul
                adca    #0
                staa    STe_648A
                jsr     sub_BB76
                staa    FDRVar0
                bra     loc_B9D7
; ---------------------------------------------------------------------------

loc_B972:                               ; CODE XREF: sub_B800+135↑j
                                        ; sub_B800:loc_B954↑j
                ldaa    Temp5_t3
                staa    FDRVar0
                brclr   <byte_48 $40 loc_B9D7 ; '@'
                brset   <byte_4A $80 loc_B9D7
                brset   <byte_4A 4 loc_B9D7
                ldab    byte_112
                bne     loc_B9DF
                ldab    byte_116
                bne     loc_B9DF
                ldab    <byte_6B
                cmpb    byte_8C3F
                bcs     loc_B9DF
                ldab    <byte_F2
                bitb    #$88
                bne     loc_B9DF
                ldab    <byte_72
                cmpb    byte_8C3B
                bcs     loc_B9DF
                ldx     <byte_64
                cpx     byte_8C3D
                bcs     loc_B9DF
                ldx     #byte_8C4C
                ldd     <byte_6B
                subd    <byte_80
                bcc     loc_B9B7
                ldx     #byte_8C41
                coma
                comb

loc_B9B7:                               ; CODE XREF: sub_B800+1B0↑j
                lsrd
                lsrd
                lsrd
                lsrd
                bcc     loc_B9C0
                addd    #1

loc_B9C0:                               ; CODE XREF: sub_B800+1BB↑j
                tsta
                beq     loc_B9C5
                ldab    #$FF

loc_B9C5:                               ; CODE XREF: sub_B800+1C1↑j
                tba
                jsr     sub_F0B5
                staa    byte_15D
                staa    STe_648A
                jsr     sub_BB76
                staa    FDRVar0
                bra     loc_B9E5
; ---------------------------------------------------------------------------

loc_B9D7:                               ; CODE XREF: sub_B800+170↑j
                                        ; sub_B800+178↑j ...
                clr     byte_15D
                clr     byte_15C
                bra     loc_B9FD
; ---------------------------------------------------------------------------

loc_B9DF:                               ; CODE XREF: sub_B800+187↑j
                                        ; sub_B800+18C↑j ...
                clr     byte_15D
                clr     byte_15C

loc_B9E5:                               ; CODE XREF: sub_B800+1D5↑j
                ldaa    byte_9082
                brset   <byte_50 8 loc_B9F7
                brset   <byte_52 1 loc_B9F4
                brclr   <byte_F2 2 loc_B9FD

loc_B9F4:                               ; CODE XREF: sub_B800+1EC↑j
                ldaa    byte_8C40

loc_B9F7:                               ; CODE XREF: sub_B800+1E8↑j
                staa    FDRVar0
                jmp     loc_BB4F
; ---------------------------------------------------------------------------

loc_B9FD:                               ; CODE XREF: sub_B800+1DD↑j
                                        ; sub_B800+1F0↑j
                brclr   <byte_B4 1 loc_BA33
                brclr   <byte_B4 2 loc_BA10
                bclr    <byte_B4 2
                ldaa    FDRVar0
                staa    byte_101
                bra     loc_BA33
; ---------------------------------------------------------------------------

loc_BA10:                               ; CODE XREF: sub_B800+201↑j
                ldaa    byte_101
                adda    byte_102
                bpl     loc_BA1A
                ldaa    #$7F

loc_BA1A:                               ; CODE XREF: sub_B800+216↑j
                ldab    FDRVar0
                subb    byte_8372
                bcc     loc_BA23
                clrb

loc_BA23:                               ; CODE XREF: sub_B800+220↑j
                stab    FDRVar1
                cmpa    FDRVar1
                bcs     loc_BA30
                bclr    <byte_B4 1
                bra     loc_BA33
; ---------------------------------------------------------------------------

loc_BA30:                               ; CODE XREF: sub_B800+229↑j
                staa    FDRVar0

loc_BA33:                               ; CODE XREF: sub_B800:loc_B9FD↑j
                                        ; sub_B800+20E↑j ...
                ldaa    byte_8379
                beq     loc_BA4B
                brset   <byte_4A $80 loc_BA4B
                ldab    <byte_7A
                brclr   <byte_4B $10 loc_BA48
                adda    #3
                bcc     loc_BA48
                ldaa    #$FF

loc_BA48:                               ; CODE XREF: sub_B800+23E↑j
                                        ; sub_B800+244↑j
                cba
                bcc     loc_BA57

loc_BA4B:                               ; CODE XREF: sub_B800+236↑j
                                        ; sub_B800+238↑j
                brclr   <byte_4B $10 loc_BA52
                bset    <byte_5E 8

loc_BA52:                               ; CODE XREF: sub_B800:loc_BA4B↑j
                bclr    <byte_4B $10
                bra     loc_BA61
; ---------------------------------------------------------------------------

loc_BA57:                               ; CODE XREF: sub_B800+249↑j
                brset   <byte_4B $10 loc_BA5E
                bset    <byte_5E 8

loc_BA5E:                               ; CODE XREF: sub_B800:loc_BA57↑j
                bset    <byte_4B $10

loc_BA61:                               ; CODE XREF: sub_B800+255↑j
                brset   <byte_B4 2 loc_BABC
                brset   <byte_5E 8 loc_BAD1
                brclr   <byte_5E $10 loc_BA73
                brset   <byte_4D 2 loc_BAD1
                bra     loc_BA7D
; ---------------------------------------------------------------------------

loc_BA73:                               ; CODE XREF: sub_B800+269↑j
                brset   <byte_4D 2 loc_BAD1
                brset   <byte_4D 1 loc_BA7D
                bra     loc_BABC
; ---------------------------------------------------------------------------

loc_BA7D:                               ; CODE XREF: sub_B800+271↑j
                                        ; sub_B800+277↑j
                ldaa    <byte_6D
                cmpa    byte_8375
                bcc     loc_BAC9
                ldaa    byte_105
                adda    byte_8376
                staa    FDRVar3
                ldaa    byte_106
                cmpa    FDRVar0
                bcs     loc_BAA7
                suba    FDRVar3
                bcc     loc_BA9B
                clra

loc_BA9B:                               ; CODE XREF: sub_B800+298↑j
                cmpa    FDRVar0
                beq     loc_BABE
                bcs     loc_BABE
                adda    byte_8376
                bra     loc_BAB6
; ---------------------------------------------------------------------------

loc_BAA7:                               ; CODE XREF: sub_B800+293↑j
                adda    FDRVar3
                bcc     loc_BAAE
                ldaa    #$FF

loc_BAAE:                               ; CODE XREF: sub_B800+2AA↑j
                cmpa    FDRVar0
                bcc     loc_BAC3
                suba    byte_8376

loc_BAB6:                               ; CODE XREF: sub_B800+2A5↑j
                staa    FDRVar0
                staa    byte_107

loc_BABC:                               ; CODE XREF: sub_B800:loc_BA61↑j
                                        ; sub_B800+27B↑j
                bra     loc_BB08
; ---------------------------------------------------------------------------

loc_BABE:                               ; CODE XREF: sub_B800+29E↑j
                                        ; sub_B800+2A0↑j
                adda    byte_8376
                bra     loc_BAC6
; ---------------------------------------------------------------------------

loc_BAC3:                               ; CODE XREF: sub_B800+2B1↑j
                suba    byte_8376

loc_BAC6:                               ; CODE XREF: sub_B800+2C1↑j
                staa    FDRVar0

loc_BAC9:                               ; CODE XREF: sub_B800+282↑j
                bclr    <byte_5E $10
                bclr    <byte_4D 1
                bra     loc_BB08
; ---------------------------------------------------------------------------

loc_BAD1:                               ; CODE XREF: sub_B800+265↑j
                                        ; sub_B800+26D↑j ...
                clra
                staa    byte_105
                staa    byte_104
                ldaa    byte_107
                brset   <byte_5E $10 loc_BAE6
                brset   <byte_4D 1 loc_BAE6
                ldaa    FDRVar0

loc_BAE6:                               ; CODE XREF: sub_B800+2DB↑j
                                        ; sub_B800+2DF↑j
                staa    byte_106
                staa    FDRVar0
                brset   <byte_5E 8 loc_BAFF
                brclr   <byte_4D 2 loc_BB08
                bset    <byte_4D 1
                bclr    <byte_4D 2
                bclr    <byte_5E $10
                bra     loc_BB08
; ---------------------------------------------------------------------------

loc_BAFF:                               ; CODE XREF: sub_B800+2EC↑j
                bclr    <byte_4D 3
                bset    <byte_5E $10
                bclr    <byte_5E 8

loc_BB08:                               ; CODE XREF: sub_B800:loc_BABC↑j
                                        ; sub_B800+2CF↑j ...
                ldd     #0
                brclr   <byte_54 8 loc_BB16
                sei
                bclr    <byte_54 8
                cli
                bra     loc_BB57
; ---------------------------------------------------------------------------

loc_BB16:                               ; CODE XREF: sub_B800+30B↑j
                ldaa    FDRVar0
                decb
                cmpb    <byte_68
                beq     loc_BB54
                brclr   <byte_48 1 loc_BB54
                brset   <byte_4A $80 loc_BB54
                cmpa    <byte_68
                bls     loc_BB54
                ldaa    <byte_BB
                suba    <byte_6B
                bcs     loc_BB35
                cmpa    byte_80B0
                bcc     loc_BB4F

loc_BB35:                               ; CODE XREF: sub_B800+32E↑j
                ldaa    <byte_68
                ldab    byte_10F
                cmpb    byte_80AF
                tab
                bcs     loc_BB57
                ldaa    <byte_68
                adda    byte_80AE
                bpl     loc_BB49
                ldaa    #$7F

loc_BB49:                               ; CODE XREF: sub_B800+345↑j
                tab
                cmpa    FDRVar0
                bcs     loc_BB54

loc_BB4F:                               ; CODE XREF: sub_B800+1FA↑J
                                        ; sub_B800+333↑j
                ldaa    FDRVar0
                ldab    #$FF

loc_BB54:                               ; CODE XREF: sub_B800+31C↑j
                                        ; sub_B800+31E↑j ...
                clr     byte_10F

loc_BB57:                               ; CODE XREF: sub_B800+314↑j
                                        ; sub_B800+33E↑j
                staa    FDRVar0
                stab    <byte_68
                adda    <byte_67
                bvc     loc_BB66
                bpl     loc_BB68
                ldaa    #$7F
                bra     loc_BB69
; ---------------------------------------------------------------------------

loc_BB66:                               ; CODE XREF: sub_B800+35E↑j
                bpl     loc_BB69

loc_BB68:                               ; CODE XREF: sub_B800+360↑j
                clra

loc_BB69:                               ; CODE XREF: sub_B800+364↑j
                                        ; sub_B800:loc_BB66↑j
                ldab    byte_178
                bitb    #2
                beq     loc_BB73
                ldaa    byte_179

loc_BB73:                               ; CODE XREF: sub_B800+36E↑j
                staa    <byte_66
                rts
; End of function sub_B800


; =============== S U B R O U T I N E =======================================


sub_BB76:                               ; CODE XREF: sub_B800:loc_B92F↑P
                                        ; sub_B800+151↑P ...
                tst     STe_648A
                bpl     loc_BB86
                ldaa    STe_648A
                adda    Temp5_t3
                bpl     loc_BB90
                clra
                bra     loc_BB90
; ---------------------------------------------------------------------------

loc_BB86:                               ; CODE XREF: sub_BB76+3↑j
                ldaa    STe_648A
                adda    Temp5_t3
                bpl     loc_BB90
                ldaa    #$7F

loc_BB90:                               ; CODE XREF: sub_BB76+B↑j
                                        ; sub_BB76+E↑j ...
                staa    Temp5_t3
                rts
; End of function sub_BB76


; =============== S U B R O U T I N E =======================================


sub_BB94:                               ; CODE XREF: sub_B800:loc_B8CE↑P
                ldab    #$1C

loc_BB96:                               ; CODE XREF: sub_BB94+E↓j
                subb    #2
                bls     locret_BBA5
                ldx     #byte_803C
                abx
                ldx     0,x
                cpx     <byte_6B
                bcc     loc_BB96
                lsrb

locret_BBA5:                            ; CODE XREF: sub_BB94+4↑j
                rts
; End of function sub_BB94


; =============== S U B R O U T I N E =======================================


sub_BBA6:                               ; CODE XREF: sub_BE83:loc_BF48↓P
                ldx     #byte_8906
                ldd     <byte_6B
                aslb
                adca    #0
                jsr     sub_F0B5
                staa    FDRVar0
                ldab    <byte_6D
                ldx     #byte_893D
                jsr     sub_F126
                staa    STe_648A
                ldaa    FDRVar0
                ldab    <byte_6D
                ldx     #byte_896D
                jsr     sub_F126
                staa    FDRVar3
                rts
; End of function sub_BBA6


; =============== S U B R O U T I N E =======================================


sub_BBCE:                               ; CODE XREF: __RESET+71F↑P
                ldx     #$C
                ldab    <byte_22
                abx
                ldaa    byte_8019
                bita    #2
                beq     loc_BC0E
                brset   <byte_F0 $20 loc_BC0E ; ' '
                ldaa    <byte_72
                cmpa    byte_8B16
                bcs     loc_BC0E
                ldy     #$1D
                ldab    <byte_22
                cmpb    byte_8B04
                beq     loc_BC06
                iny
                cmpb    byte_8B05
                beq     loc_BC06
                iny
                cmpb    byte_8B06
                beq     loc_BC06
                iny
                cmpb    byte_8B07
                bne     loc_BC0E

loc_BC06:                               ; CODE XREF: sub_BBCE+21↑j
                                        ; sub_BBCE+28↑j ...
                xgdy
                xgdx
                bset    <byte_B4 $80
                bra     loc_BC11
; ---------------------------------------------------------------------------

loc_BC0E:                               ; CODE XREF: sub_BBCE+B↑j
                                        ; sub_BBCE+D↑j ...
                bclr    <byte_B4 $80

loc_BC11:                               ; CODE XREF: sub_BBCE+3E↑j
                ldab    0,x
                stab    Temp5_t3
                ldy     #byte_8AF2
                clra
                ldab    byte_8AF0
                brset   <byte_4A $40 loc_BC73 ; '@'
                brset   <byte_4A $80 loc_BC28
                bra     loc_BC2F
; ---------------------------------------------------------------------------

loc_BC28:                               ; CODE XREF: sub_BBCE+54↑j
                cpx     #$1D
                bne     loc_BC75
                bra     loc_BC87
; ---------------------------------------------------------------------------

loc_BC2F:                               ; CODE XREF: sub_BBCE+58↑j
                ldab    byte_8AF1
                ldaa    byte_8019
                bita    #2
                beq     loc_BC40
                cpx     #$1D
                bne     loc_BC75
                bra     loc_BC46
; ---------------------------------------------------------------------------

loc_BC40:                               ; CODE XREF: sub_BBCE+69↑j
                ldaa    <byte_22
                cmpa    #$E
                bne     loc_BC75

loc_BC46:                               ; CODE XREF: sub_BBCE+70↑j
                ldaa    Temp5_t3
                bne     loc_BC75
                ldaa    byte_8AF6
                brclr   <byte_9E $80 loc_BC55
                ldaa    byte_8AF7

loc_BC55:                               ; CODE XREF: sub_BBCE+80↑j
                cmpa    <byte_1C
                beq     loc_BC75
                ldab    <byte_1C
                stab    Temp5_t3
                ldy     #byte_8AF6
                ldab    byte_8AF5
                brset   <byte_57 1 loc_BC87
                jsr     sub_BC93
                ldaa    Temp5_t3
                staa    <byte_1C
                bra     loc_BC81
; ---------------------------------------------------------------------------

loc_BC73:                               ; CODE XREF: sub_BBCE+50↑j
                bra     loc_BC89
; ---------------------------------------------------------------------------

loc_BC75:                               ; CODE XREF: sub_BBCE+5D↑j
                                        ; sub_BBCE+6E↑j ...
                brset   <byte_57 1 loc_BC87
                jsr     sub_BC93
                ldaa    Temp5_t3
                staa    0,x

loc_BC81:                               ; CODE XREF: sub_BBCE+A3↑j
                cli
                ldaa    0,x
                staa    <byte_9C
                rts
; ---------------------------------------------------------------------------

loc_BC87:                               ; CODE XREF: sub_BBCE+5F↑j
                                        ; sub_BBCE+97↑j ...
                ldaa    0,x

loc_BC89:                               ; CODE XREF: sub_BBCE:loc_BC73↑j
                staa    <byte_9C
                ldaa    <byte_9A
                cba
                bcs     locret_BC92
                stab    <byte_9A

locret_BC92:                            ; CODE XREF: sub_BBCE+C0↑j
                rts
; End of function sub_BBCE


; =============== S U B R O U T I N E =======================================


sub_BC93:                               ; CODE XREF: sub_BBCE+9B↑P
                                        ; sub_BBCE+AB↑P
                sei
                ldaa    <byte_9A
                sba
                bcs     locret_BCC2
                staa    <byte_9A
                cli
                ldaa    2,y
                brclr   <byte_9E $80 loc_BCA4
                nega

loc_BCA4:                               ; CODE XREF: sub_BC93+C↑j
                ldab    0,y
                adda    Temp5_t3
                bvc     loc_BCB5
                ldaa    Temp5_t3
                bpl     loc_BCBE
                ldab    1,y
                tba

loc_BCB5:                               ; CODE XREF: sub_BC93+17↑j
                cba
                bge     loc_BCBE
                ldab    1,y
                cba
                bge     loc_BCBF

loc_BCBE:                               ; CODE XREF: sub_BC93+1C↑j
                                        ; sub_BC93+23↑j
                tba

loc_BCBF:                               ; CODE XREF: sub_BC93+29↑j
                staa    Temp5_t3

locret_BCC2:                            ; CODE XREF: sub_BC93+4↑j
                rts
; End of function sub_BC93


; =============== S U B R O U T I N E =======================================


sub_BCC3:                               ; CODE XREF: __RESET+722↑P
                ldaa    byte_8019
                bita    #2
                bne     loc_BCCB

locret_BCCA:                            ; CODE XREF: sub_BCC3:loc_BCCB↓j
                rts
; ---------------------------------------------------------------------------

loc_BCCB:                               ; CODE XREF: sub_BCC3+5↑j
                brclr   <byte_B4 $40 locret_BCCA ; '@'
                brclr   <byte_21 8 loc_BCF1
                ldx     #$C
                ldab    byte_8B04
                abx
                ldaa    <byte_1D
                suba    0,x
                blt     loc_BCF1
                brclr   <byte_21 $80 loc_BCE7
                adda    byte_8B09

loc_BCE7:                               ; CODE XREF: sub_BCC3+1D↑j
                cmpa    byte_8B08
                bcs     loc_BCF1
                bset    <byte_21 $80
                bra     loc_BCF4
; ---------------------------------------------------------------------------

loc_BCF1:                               ; CODE XREF: sub_BCC3+C↑j
                                        ; sub_BCC3+1B↑j ...
                bclr    <byte_21 $80

loc_BCF4:                               ; CODE XREF: sub_BCC3+2C↑j
                brclr   <byte_21 4 loc_BD16
                ldx     #$C
                ldab    byte_8B05
                abx
                ldaa    <byte_1E
                suba    0,x
                blt     loc_BD16
                brclr   <byte_21 $40 loc_BD0C ; '@'
                adda    byte_8B0B

loc_BD0C:                               ; CODE XREF: sub_BCC3+42↑j
                cmpa    byte_8B0A
                bcs     loc_BD16
                bset    <byte_21 $40 ; '@'
                bra     loc_BD19
; ---------------------------------------------------------------------------

loc_BD16:                               ; CODE XREF: sub_BCC3:loc_BCF4↑j
                                        ; sub_BCC3+40↑j ...
                bclr    <byte_21 $40 ; '@'

loc_BD19:                               ; CODE XREF: sub_BCC3+51↑j
                brclr   <byte_21 2 loc_BD3B
                ldx     #$C
                ldab    byte_8B06
                abx
                ldaa    <byte_1F
                suba    0,x
                blt     loc_BD3B
                brclr   <byte_21 $20 loc_BD31 ; ' '
                adda    byte_8B0D

loc_BD31:                               ; CODE XREF: sub_BCC3+67↑j
                cmpa    byte_8B0C
                bcs     loc_BD3B
                bset    <byte_21 $20 ; ' '
                bra     loc_BD3E
; ---------------------------------------------------------------------------

loc_BD3B:                               ; CODE XREF: sub_BCC3:loc_BD19↑j
                                        ; sub_BCC3+65↑j ...
                bclr    <byte_21 $20 ; ' '

loc_BD3E:                               ; CODE XREF: sub_BCC3+76↑j
                brclr   <byte_21 1 loc_BD60
                ldx     #$C
                ldab    byte_8B07
                abx
                ldaa    <byte_20
                suba    0,x
                blt     loc_BD60
                brclr   <byte_21 $10 loc_BD56
                adda    byte_8B0F

loc_BD56:                               ; CODE XREF: sub_BCC3+8C↑j
                cmpa    byte_8B0E
                bcs     loc_BD60
                bset    <byte_21 $10
                bra     locret_BD63
; ---------------------------------------------------------------------------

loc_BD60:                               ; CODE XREF: sub_BCC3:loc_BD3E↑j
                                        ; sub_BCC3+8A↑j ...
                bclr    <byte_21 $10

locret_BD63:                            ; CODE XREF: sub_BCC3+9B↑j
                rts
; End of function sub_BCC3


; =============== S U B R O U T I N E =======================================


sub_BD64:                               ; CODE XREF: __RESET+725↑P
                ldab    <byte_9E
                clra
                cmpb    byte_8AD9
                bge     loc_BD78
                ldab    <byte_72
                cmpb    byte_8ADA
                bcs     loc_BD78
                ldaa    <byte_98
                inca
                beq     loc_BD7A

loc_BD78:                               ; CODE XREF: sub_BD64+6↑j
                                        ; sub_BD64+D↑j
                staa    <byte_98

loc_BD7A:                               ; CODE XREF: sub_BD64+12↑j
                ldaa    byte_8AE0
                beq     loc_BD8B
                brclr   <byte_57 $40 loc_BD85 ; '@'
                adda    #4

loc_BD85:                               ; CODE XREF: sub_BD64+1B↑j
                cmpa    <byte_7A
                bcs     loc_BD9C
                bra     loc_BDA1
; ---------------------------------------------------------------------------

loc_BD8B:                               ; CODE XREF: sub_BD64+19↑j
                ldab    <byte_80
                addb    byte_8AE1
                brclr   <byte_57 $40 loc_BD97 ; '@'
                addb    byte_8AE2

loc_BD97:                               ; CODE XREF: sub_BD64+2C↑j
                ldaa    <byte_6B
                cba
                bcs     loc_BDA1

loc_BD9C:                               ; CODE XREF: sub_BD64+23↑j
                bclr    <byte_57 $40 ; '@'
                bra     loc_BDA4
; ---------------------------------------------------------------------------

loc_BDA1:                               ; CODE XREF: sub_BD64+25↑j
                                        ; sub_BD64+36↑j
                bset    <byte_57 $40 ; '@'

loc_BDA4:                               ; CODE XREF: sub_BD64+3B↑j
                clra
                staa    Temp5_t3
                ldab    <byte_57
                ldx     #byte_8AE4
                ldaa    <byte_4A
                bmi     loc_BE05
                bitb    #$40 ; '@'
                beq     loc_BDD8
                bitb    #$80
                bne     loc_BDC6
                ldaa    <byte_72
                cmpa    byte_8ADC
                bcs     loc_BDC3
                clr     byte_9E

loc_BDC3:                               ; CODE XREF: sub_BD64+5A↑j
                bset    <byte_57 $80

loc_BDC6:                               ; CODE XREF: sub_BD64+53↑j
                ldab    #$E
                ldaa    byte_8017
                bita    #1
                bne     loc_BE27
                ldaa    <byte_4D
                bita    #$10
                bne     loc_BE27
                incb
                bra     loc_BE27
; ---------------------------------------------------------------------------

loc_BDD8:                               ; CODE XREF: sub_BD64+4F↑j
                andb    #$7F
                stab    <byte_57
                ldaa    byte_8019
                bita    #8
                beq     loc_BE05
                ldaa    byte_8AE3
                ldab    #$C
                cmpb    <byte_22
                bcs     loc_BDEF
                adda    byte_8AE2

loc_BDEF:                               ; CODE XREF: sub_BD64+86↑j
                cmpa    <byte_6B
                bcc     loc_BE27
                incb
                bra     loc_BE27
; ---------------------------------------------------------------------------

loc_BDF6:                               ; CODE XREF: sub_BD64+AF↓j
                ldaa    0,x
                cmpb    Temp5_t3
                bcc     loc_BE00
                adda    byte_8AEB

loc_BE00:                               ; CODE XREF: sub_BD64+97↑j
                cmpa    <byte_6D
                bcc     loc_BE15
                inx

loc_BE05:                               ; CODE XREF: sub_BD64+4B↑j
                                        ; sub_BD64+7D↑j
                bclr    <byte_57 $80
                ldab    <byte_22
                inc     Temp5_t3
                inc     Temp5_t3
                cpx     #byte_8AE9
                bne     loc_BDF6

loc_BE15:                               ; CODE XREF: sub_BD64+9E↑j
                ldaa    byte_8AE9
                lsrb
                bcs     loc_BE1E
                adda    byte_8AEA

loc_BE1E:                               ; CODE XREF: sub_BD64+B5↑j
                ldab    Temp5_t3
                cmpa    <byte_6B
                bcs     loc_BE26
                decb

loc_BE26:                               ; CODE XREF: sub_BD64+BF↑j
                decb

loc_BE27:                               ; CODE XREF: sub_BD64+69↑j
                                        ; sub_BD64+6F↑j ...
                cmpb    <byte_22
                bne     loc_BE3E
                ldaa    byte_8019
                bita    #2
                beq     loc_BE80
                ldaa    byte_165
                eora    byte_166
                bita    #$20 ; ' '
                bne     loc_BE74
                bra     loc_BE80
; ---------------------------------------------------------------------------

loc_BE3E:                               ; CODE XREF: sub_BD64+C5↑j
                clr     byte_9A
                clr     byte_B2
                ldaa    byte_8019
                bita    #2
                beq     loc_BE74
                ldaa    <byte_72
                cmpa    byte_8B16
                bcs     loc_BE71
                ldaa    #$80
                cmpb    byte_8B04
                beq     loc_BE6B
                lsra
                cmpb    byte_8B05
                beq     loc_BE6B
                lsra
                cmpb    byte_8B06
                beq     loc_BE6B
                lsra
                cmpb    byte_8B07
                bne     loc_BE74

loc_BE6B:                               ; CODE XREF: sub_BD64+F3↑j
                                        ; sub_BD64+F9↑j ...
                eora    <byte_B3
                staa    <byte_B3
                bra     loc_BE74
; ---------------------------------------------------------------------------

loc_BE71:                               ; CODE XREF: sub_BD64+EC↑j
                bclr    <byte_B3 $F0

loc_BE74:                               ; CODE XREF: sub_BD64+D6↑j
                                        ; sub_BD64+E5↑j ...
                ldaa    <byte_98
                cmpa    byte_8ADB
                bls     loc_BE80
                clra
                staa    <byte_9E
                staa    <byte_98

loc_BE80:                               ; CODE XREF: sub_BD64+CC↑j
                                        ; sub_BD64+D8↑j ...
                stab    <byte_22
                rts
; End of function sub_BD64


; =============== S U B R O U T I N E =======================================


sub_BE83:                               ; CODE XREF: __RESET:loc_9844↑P
                ldd     <byte_88
                cpd     byte_88AF
                bcc     loc_BE98
                bset    <byte_57 8
                ldaa    byte_88B1
                staa    <byte_EA

loc_BE93:                               ; CODE XREF: sub_BE83+1E↓j
                clra
                staa    <byte_9E
                bra     loc_BEA6
; ---------------------------------------------------------------------------

loc_BE98:                               ; CODE XREF: sub_BE83+6↑j
                ldaa    <byte_EA
                beq     loc_BEA3
                dec     byte_EA
                beq     loc_BEA3
                bra     loc_BE93
; ---------------------------------------------------------------------------

loc_BEA3:                               ; CODE XREF: sub_BE83+17↑j
                                        ; sub_BE83+1C↑j
                bclr    <byte_57 8

loc_BEA6:                               ; CODE XREF: sub_BE83+13↑j
                ldaa    <byte_72
                ldab    <byte_65
                bne     loc_BEC1
                cmpa    byte_8AD8
                ldab    <byte_90
                bcs     loc_BEBA
                beq     loc_BEC1
                decb
                stab    <byte_90
                bra     loc_BEC1
; ---------------------------------------------------------------------------

loc_BEBA:                               ; CODE XREF: sub_BE83+2E↑j
                bne     loc_BEC1
                ldab    byte_8AD7
                stab    <byte_90

loc_BEC1:                               ; CODE XREF: sub_BE83+27↑j
                                        ; sub_BE83+30↑j ...
                brclr   <byte_50 8 loc_BED1
                bclr    <byte_5D 8
                brset   <byte_5D 4 loc_BECF
                bclr    <byte_51 $40 ; '@'

loc_BECF:                               ; CODE XREF: sub_BE83+45↑j
                bra     loc_BF15
; ---------------------------------------------------------------------------

loc_BED1:                               ; CODE XREF: sub_BE83:loc_BEC1↑j
                brset   <byte_5D 8 loc_BF1F
                ldaa    <byte_72
                cmpa    byte_893C
                bcs     loc_BF15
                ldaa    <byte_92
                brset   <byte_65 $FF loc_BEE4
                bra     loc_BEE9
; ---------------------------------------------------------------------------

loc_BEE4:                               ; CODE XREF: sub_BE83+5B↑j
                beq     loc_BEEB
                deca
                staa    <byte_92

loc_BEE9:                               ; CODE XREF: sub_BE83+5F↑j
                bne     loc_BF15

loc_BEEB:                               ; CODE XREF: sub_BE83:loc_BEE4↑j
                ldaa    <byte_70
                cmpa    byte_899D
                bcc     loc_BEF7
                cmpa    byte_899E
                bcc     loc_BF15

loc_BEF7:                               ; CODE XREF: sub_BE83+6D↑j
                brset   <byte_56 4 loc_BF15
                ldaa    <byte_70
                cmpa    #$3E ; '>'
                bcc     loc_BF15
                bset    <byte_96 $80
                bset    <byte_51 $40 ; '@'
                bset    <byte_5D 8
                bclr    <byte_51 3
                clra
                staa    byte_19E
                staa    <byte_B0
                staa    <byte_94

loc_BF15:                               ; CODE XREF: sub_BE83:loc_BECF↑j
                                        ; sub_BE83+57↑j ...
                clr     byte_9E
                bset    <byte_57 1
                bset    <byte_B4 $20 ; ' '
                rts
; ---------------------------------------------------------------------------

loc_BF1F:                               ; CODE XREF: sub_BE83:loc_BED1↑j
                clrb
                brset   <byte_56 4 loc_BF3A
                ldaa    <byte_70
                cmpa    #$3E ; '>'
                bcc     loc_BF3A
                cmpa    byte_899D
                bcc     loc_BF46
                cmpa    byte_899E
                bcs     loc_BF46
                ldaa    <byte_64
                cmpa    #$2C ; ','
                bcs     loc_BF46

loc_BF3A:                               ; CODE XREF: sub_BE83+9D↑j
                                        ; sub_BE83+A5↑j
                brset   <byte_65 1 loc_BF48
                ldab    <byte_92
                incb
                bne     loc_BF46
                jmp     loc_C0D1
; ---------------------------------------------------------------------------

loc_BF46:                               ; CODE XREF: sub_BE83+AA↑j
                                        ; sub_BE83+AF↑j ...
                stab    <byte_92

loc_BF48:                               ; CODE XREF: sub_BE83:loc_BF3A↑j
                jsr     sub_BBA6
                ldaa    <byte_70
                clrb
                cmpa    STe_648A
                bcc     loc_BF59
                cmpa    FDRVar3
                bcs     loc_BF5A
                rts
; ---------------------------------------------------------------------------

loc_BF59:                               ; CODE XREF: sub_BE83+CE↑j
                decb

loc_BF5A:                               ; CODE XREF: sub_BE83+D3↑j
                stab    Temp5_t3
                jsr     sub_C164
                ldab    <byte_B2
                beq     loc_BF69
                cmpb    byte_8B12
                bcs     loc_BFB0

loc_BF69:                               ; CODE XREF: sub_BE83+DF↑j
                ldab    byte_8AEC
                ldaa    Temp5_t3
                bmi     loc_BF72
                negb

loc_BF72:                               ; CODE XREF: sub_BE83+EC↑j
                addb    <byte_9E
                bvs     loc_BF7B
                eorb    Temp5_t3
                bmi     loc_BFB0

loc_BF7B:                               ; CODE XREF: sub_BE83+F1↑j
                ldab    <byte_6D
                cmpb    byte_8AED
                bhi     loc_BFAD
                brset   <byte_51 $10 loc_BFAD
                ldab    <byte_6B
                cmpb    byte_8AEF
                bhi     loc_BFAD
                ldab    <byte_D1
                orab    <byte_D4
                orab    <byte_B5
                orab    <byte_AD
                orab    <byte_AF
                bne     loc_BFB0
                brset   <byte_54 $80 loc_BFB0
                ldab    <byte_90
                bne     loc_BFAD
                brset   <byte_57 8 loc_BFAD
                bclr    <byte_57 1
                bclr    <byte_B4 $20 ; ' '
                bra     loc_BFB3
; ---------------------------------------------------------------------------

loc_BFAD:                               ; CODE XREF: sub_BE83+FD↑j
                                        ; sub_BE83+FF↑j ...
                bset    <byte_B4 $20 ; ' '

loc_BFB0:                               ; CODE XREF: sub_BE83+E4↑j
                                        ; sub_BE83+F6↑j ...
                bset    <byte_57 1

loc_BFB3:                               ; CODE XREF: sub_BE83+128↑j
                clra
                ldab    <byte_57
                eorb    Temp5_t3
                andb    #$20 ; ' '
                beq     loc_BFFB
                eorb    <byte_57
                stab    <byte_57
                clrb
                ldaa    <byte_94
                stab    <byte_94
                stab    <byte_B0
                stab    <byte_A1
                brset   <byte_57 2 locret_BFFA
                brset   <byte_51 $10 locret_BFFA
                ldab    byte_8A04
                beq     loc_BFE8
                ldab    <byte_A3
                brclr   <byte_57 $20 loc_BFDE ; ' '
                negb

loc_BFDE:                               ; CODE XREF: sub_BE83+156↑j
                addb    <byte_9E
                stab    <byte_9E
                lsr     byte_A3
                bclr    <byte_5A $80

loc_BFE8:                               ; CODE XREF: sub_BE83+152↑j
                brset   <byte_57 $10 loc_C017
                bclr    <byte_51 3
                bclr    <byte_F3 3
                bclr    <byte_F5 6
                clr     byte_19E
                bra     loc_C017
; ---------------------------------------------------------------------------

locret_BFFA:                            ; CODE XREF: sub_BE83+147↑j
                                        ; sub_BE83+14B↑j ...
                rts
; ---------------------------------------------------------------------------

loc_BFFB:                               ; CODE XREF: sub_BE83+138↑j
                brset   <byte_57 2 locret_BFFA
                brset   <byte_51 $10 locret_BFFA
                ldab    <byte_94
                bne     loc_C00A
                jmp     loc_C086
; ---------------------------------------------------------------------------

loc_C00A:                               ; CODE XREF: sub_BE83+182↑j
                clr     byte_B0
                clr     byte_A1
                ldab    <byte_65
                bitb    byte_89A9
                bne     loc_C086

loc_C017:                               ; CODE XREF: sub_BE83:loc_BFE8↑j
                                        ; sub_BE83+175↑j
                clr     byte_B0
                clr     byte_A1
                staa    FDRVar3
                ldx     #unk_89AA
                jsr     sub_C0E4
                brclr   <byte_50 $40 loc_C02D ; '@'
                ldaa    byte_909B

loc_C02D:                               ; CODE XREF: sub_BE83+1A3↑j
                ldab    FDRVar3
                beq     loc_C03E
                tab
                subb    FDRVar3
                bcc     loc_C03C
                clrb
                stab    FDRVar3

loc_C03C:                               ; CODE XREF: sub_BE83+1B3↑j
                stab    <byte_94

loc_C03E:                               ; CODE XREF: sub_BE83+1AD↑j
                ldab    <byte_94
                addb    0,x
                sba
                bhi     loc_C04F
                adda    0,x
                bpl     loc_C04A
                clra

loc_C04A:                               ; CODE XREF: sub_BE83+1C4↑j
                clrb
                stab    <byte_94
                bra     loc_C056
; ---------------------------------------------------------------------------

loc_C04F:                               ; CODE XREF: sub_BE83+1C0↑j
                ldaa    0,x
                tab
                addb    <byte_94
                stab    <byte_94

loc_C056:                               ; CODE XREF: sub_BE83+1CA↑j
                ldab    FDRVar3
                beq     loc_C05F
                cba
                bcs     loc_C05F
                tba

loc_C05F:                               ; CODE XREF: sub_BE83+1D6↑j
                                        ; sub_BE83+1D9↑j
                brclr   <byte_57 $20 loc_C064 ; ' '
                nega

loc_C064:                               ; CODE XREF: sub_BE83:loc_C05F↑j
                jsr     sub_C23C
                brclr   <byte_4A $80 locret_C07D
                ldaa    <byte_72
                cmpa    byte_89D6
                bcc     locret_C07D
                ldaa    Temp5_t3
                bne     locret_C07D
                ldaa    byte_89D7
                jsr     sub_C23C

locret_C07D:                            ; CODE XREF: sub_BE83+1E4↑j
                                        ; sub_BE83+1ED↑j ...
                rts
; ---------------------------------------------------------------------------

loc_C07E:                               ; CODE XREF: sub_BE83+209↓j
                ldaa    <byte_65
                bne     locret_C0E3
                inc     byte_19E
                rts
; ---------------------------------------------------------------------------

loc_C086:                               ; CODE XREF: sub_BE83+184↑J
                                        ; sub_BE83+192↑j
                ldaa    byte_19E
                cmpa    byte_9054
                bcs     loc_C07E
                clr     byte_19E
                brset   <byte_51 3 loc_C099
                inc     byte_51
                rts
; ---------------------------------------------------------------------------

loc_C099:                               ; CODE XREF: sub_BE83+20E↑j
                ldaa    byte_9054
                staa    byte_19E
                brclr   <byte_57 $20 loc_C0B4 ; ' '
                brset   <byte_F3 1 loc_C0C3
                ldd     #$381
                jsr     sub_AE82
                bcc     locret_C0E3
                bset    <byte_F3 1
                bra     loc_C0C3
; ---------------------------------------------------------------------------

loc_C0B4:                               ; CODE XREF: sub_BE83+21C↑j
                brset   <byte_F3 2 loc_C0C3
                ldd     #$481
                jsr     sub_AE82
                bcc     locret_C0E3
                bset    <byte_F3 2

loc_C0C3:                               ; CODE XREF: sub_BE83+220↑j
                                        ; sub_BE83+22F↑j ...
                clra
                staa    <byte_9C
                ldx     #$C

loc_C0C9:                               ; CODE XREF: sub_BE83+24C↓j
                staa    0,x
                inx
                cpx     #$22 ; '"'
                bne     loc_C0C9

loc_C0D1:                               ; CODE XREF: sub_BE83+C0↑J
                clra
                staa    <byte_9A
                staa    byte_19E
                staa    <byte_92
                bclr    <byte_5D 8
                brset   <byte_5D 4 locret_C0E3
                bclr    <byte_51 $40 ; '@'

locret_C0E3:                            ; CODE XREF: sub_BE83+1FD↑j
                                        ; sub_BE83+22A↑j ...
                rts
; End of function sub_BE83


; =============== S U B R O U T I N E =======================================


sub_C0E4:                               ; CODE XREF: sub_BE83+1A0↑P
                                        ; sub_C1F5+32↓P
                brset   <byte_4A $80 loc_C10E
                ldaa    <byte_80
                adda    byte_89A5
                ldab    <byte_A0
                cmpb    #9
                bne     loc_C0F6
                adda    byte_89A6

loc_C0F6:                               ; CODE XREF: sub_C0E4+D↑j
                cmpa    <byte_6B
                bcs     loc_C10E
                ldaa    #9
                staa    <byte_A0
                ldab    #$14
                ldaa    byte_8017
                lsra
                bcs     loc_C15A
                brclr   <byte_4D $10 loc_C15A
                decb
                decb
                bra     loc_C15A
; ---------------------------------------------------------------------------

loc_C10E:                               ; CODE XREF: sub_C0E4↑j
                                        ; sub_C0E4+14↑j
                ldy     #byte_899F
                ldaa    <byte_A0
                suba    #3
                bcs     loc_C11C
                suba    #3
                bcc     loc_C11E

loc_C11C:                               ; CODE XREF: sub_C0E4+32↑j
                adda    #3

loc_C11E:                               ; CODE XREF: sub_C0E4+36↑j
                staa    STe_648A
                clrb

loc_C122:                               ; CODE XREF: sub_C0E4+52↓j
                ldaa    0,y
                cmpb    STe_648A
                bne     loc_C12D
                adda    byte_89A3

loc_C12D:                               ; CODE XREF: sub_C0E4+44↑j
                cmpa    <byte_6B
                bcc     loc_C13A
                incb
                iny
                cmpb    #2
                bcs     loc_C122
                bra     loc_C141
; ---------------------------------------------------------------------------

loc_C13A:                               ; CODE XREF: sub_C0E4+4B↑j
                tstb
                bne     loc_C13F
                iny

loc_C13F:                               ; CODE XREF: sub_C0E4+57↑j
                iny

loc_C141:                               ; CODE XREF: sub_C0E4+54↑j
                                        ; sub_C0E4+71↓j
                ldaa    0,y
                cmpb    <byte_A0
                bne     loc_C14B
                adda    byte_89A4

loc_C14B:                               ; CODE XREF: sub_C0E4+62↑j
                cmpa    <byte_6D
                bcc     loc_C157
                addb    #3
                iny
                cmpb    #6
                bcs     loc_C141

loc_C157:                               ; CODE XREF: sub_C0E4+69↑j
                stab    <byte_A0
                aslb

loc_C15A:                               ; CODE XREF: sub_C0E4+20↑j
                                        ; sub_C0E4+22↑j ...
                brclr   <byte_57 $20 loc_C15F ; ' '
                incb

loc_C15F:                               ; CODE XREF: sub_C0E4:loc_C15A↑j
                abx
                ldaa    $16,x
                tab
                rts
; End of function sub_C0E4


; =============== S U B R O U T I N E =======================================


sub_C164:                               ; CODE XREF: sub_BE83+DA↑P
                ldaa    <byte_AD
                beq     loc_C16B
                dec     byte_AD

loc_C16B:                               ; CODE XREF: sub_C164+2↑j
                brset   <byte_54 $80 loc_C178
                ldaa    <byte_B5
                beq     loc_C17F
                dec     byte_B5
                bra     loc_C1E4
; ---------------------------------------------------------------------------

loc_C178:                               ; CODE XREF: sub_C164:loc_C16B↑j
                ldaa    byte_8ADF
                staa    <byte_B5
                bra     loc_C1E4
; ---------------------------------------------------------------------------

loc_C17F:                               ; CODE XREF: sub_C164+D↑j
                brset   <byte_57 8 loc_C1E4
                brset   <byte_4A $40 loc_C190 ; '@'
                ldaa    <byte_AF
                beq     loc_C197
                deca
                staa    <byte_AF
                bra     loc_C1E4
; ---------------------------------------------------------------------------

loc_C190:                               ; CODE XREF: sub_C164+1F↑j
                ldaa    byte_8ADD
                staa    <byte_AF
                bra     loc_C1E4
; ---------------------------------------------------------------------------

loc_C197:                               ; CODE XREF: sub_C164+25↑j
                brset   <byte_5A $10 loc_C1E4
                pshb
                ldx     #byte_8AF9
                ldaa    <byte_8
                jsr     sub_F0B5
                pulb
                brclr   <byte_51 $10 loc_C1AC
                adda    byte_8AEE

loc_C1AC:                               ; CODE XREF: sub_C164+41↑j
                cmpa    <byte_6D
                bls     loc_C1BC
                bset    <byte_51 $10
                ldaa    byte_8019
                bita    #$20 ; ' '
                bne     loc_C1E4
                bra     loc_C1ED
; ---------------------------------------------------------------------------

loc_C1BC:                               ; CODE XREF: sub_C164+4A↑j
                bclr    <byte_51 $10
                ldaa    byte_8ADE
                beq     loc_C1C6
                ldaa    <byte_D1

loc_C1C6:                               ; CODE XREF: sub_C164+5E↑j
                oraa    <byte_AD
                bne     loc_C1E7
                brclr   <byte_57 2 loc_C1E0
                bset    <byte_57 $10
                tstb
                bne     loc_C1D9
                bset    <byte_57 $20 ; ' '
                bra     loc_C1DC
; ---------------------------------------------------------------------------

loc_C1D9:                               ; CODE XREF: sub_C164+6E↑j
                bclr    <byte_57 $20 ; ' '

loc_C1DC:                               ; CODE XREF: sub_C164+73↑j
                bclr    <byte_57 2
                rts
; ---------------------------------------------------------------------------

loc_C1E0:                               ; CODE XREF: sub_C164+66↑j
                bclr    <byte_57 $10
                rts
; ---------------------------------------------------------------------------

loc_C1E4:                               ; CODE XREF: sub_C164+12↑j
                                        ; sub_C164+19↑j ...
                clr     byte_9E

loc_C1E7:                               ; CODE XREF: sub_C164+64↑j
                bset    <byte_57 2
                bclr    <byte_57 $10

loc_C1ED:                               ; CODE XREF: sub_C164+56↑j
                clra
                staa    <byte_94
                staa    <byte_B0
                staa    <byte_A3
                rts
; End of function sub_C164


; =============== S U B R O U T I N E =======================================


sub_C1F5:                               ; CODE XREF: __RESET+719↑P
                brclr   <byte_5D 8 loc_C1FD
                brclr   <byte_57 2 loc_C200

loc_C1FD:                               ; CODE XREF: sub_C1F5↑j
                jmp     loc_C282
; ---------------------------------------------------------------------------

loc_C200:                               ; CODE XREF: sub_C1F5+4↑j
                ldaa    byte_8A04
                beq     loc_C224
                cmpa    <byte_A1
                bhi     loc_C224
                ldx     #byte_8A05
                bset    <byte_5A $40 ; '@'
                brset   <byte_5A $80 loc_C219
                bset    <byte_5A $80
                clr     byte_A3

loc_C219:                               ; CODE XREF: sub_C1F5+1A↑j
                brclr   <byte_57 $20 loc_C21F ; ' '
                inx
                inx

loc_C21F:                               ; CODE XREF: sub_C1F5:loc_C219↑j
                ldab    0,x
                inx
                bra     loc_C231
; ---------------------------------------------------------------------------

loc_C224:                               ; CODE XREF: sub_C1F5+E↑j
                                        ; sub_C1F5+12↑j
                ldx     #byte_89D8
                jsr     sub_C0E4
                brclr   <byte_50 $40 loc_C231 ; '@'
                ldab    byte_909A

loc_C231:                               ; CODE XREF: sub_C1F5+2D↑j
                                        ; sub_C1F5+35↑j
                sei
                ldaa    <byte_B0
                sba
                bcs     loc_C27F
                staa    <byte_B0
                cli
                ldaa    0,x
; End of function sub_C1F5


; =============== S U B R O U T I N E =======================================


sub_C23C:                               ; CODE XREF: sub_BE83:loc_C064↑P
                                        ; sub_BE83+1F7↑P
                ldab    byte_89A7
                adda    <byte_9E
                bvc     loc_C24B
                ldaa    <byte_9E
                bpl     loc_C254
                ldab    byte_89A8
                tba

loc_C24B:                               ; CODE XREF: sub_C23C+5↑j
                cba
                bge     loc_C254
                ldab    byte_89A8
                cba
                bge     loc_C255

loc_C254:                               ; CODE XREF: sub_C23C+9↑j
                                        ; sub_C23C+10↑j
                tba

loc_C255:                               ; CODE XREF: sub_C23C+16↑j
                brset   <byte_F5 4 loc_C25D
                brclr   <byte_F3 3 loc_C260

loc_C25D:                               ; CODE XREF: sub_C23C:loc_C255↑j
                tsta
                bmi     loc_C27F

loc_C260:                               ; CODE XREF: sub_C23C+1D↑j
                ldab    byte_8A04
                beq     loc_C27D
                brclr   <byte_5A $40 loc_C27D ; '@'
                tab
                subb    <byte_9E
                bpl     loc_C26F
                negb

loc_C26F:                               ; CODE XREF: sub_C23C+30↑j
                addb    <byte_A3
                bcs     loc_C278
                cmpb    byte_8A09
                bcs     loc_C27B

loc_C278:                               ; CODE XREF: sub_C23C+35↑j
                ldab    byte_8A09

loc_C27B:                               ; CODE XREF: sub_C23C+3A↑j
                stab    <byte_A3

loc_C27D:                               ; CODE XREF: sub_C23C+27↑j
                                        ; sub_C23C+29↑j
                staa    <byte_9E

loc_C27F:                               ; CODE XREF: sub_C1F5+40↑j
                                        ; sub_C23C+22↑j
                cli
                bra     loc_C28B
; ---------------------------------------------------------------------------

loc_C282:                               ; CODE XREF: sub_C1F5:loc_C1FD↑J
                clr     byte_B0
                clr     byte_A1
                clr     byte_A3

loc_C28B:                               ; CODE XREF: sub_C23C+44↑j
                bclr    <byte_5A $40 ; '@'
                rts
; End of function sub_C23C


; =============== S U B R O U T I N E =======================================


sub_C28F:                               ; CODE XREF: sub_C574:loc_C636↓P
                ldx     #byte_8906
                ldd     <byte_6B
                aslb
                adca    #0
                jsr     sub_F0B5
                staa    FDRVar0
                ldab    <byte_6D
                ldx     #byte_8A0A
                jsr     sub_F126
                staa    STe_648A
                ldaa    FDRVar0
                ldab    <byte_6D
                ldx     #byte_8A3A
                jsr     sub_F126
                staa    FDRVar3
                rts
; End of function sub_C28F


; =============== S U B R O U T I N E =======================================


sub_C2B7:                               ; CODE XREF: __RESET+73A↑P
                ldx     #$23 ; '#'
                ldab    <byte_22
                abx
                ldaa    byte_8019
                bita    #2
                beq     loc_C2F7
                brset   <byte_F0 $20 loc_C2F7 ; ' '
                ldaa    <byte_72
                cmpa    byte_8B16
                bcs     loc_C2F7
                ldy     #$34 ; '4'
                ldab    <byte_22
                cmpb    byte_8B04
                beq     loc_C2EF
                iny
                cmpb    byte_8B05
                beq     loc_C2EF
                iny
                cmpb    byte_8B06
                beq     loc_C2EF
                iny
                cmpb    byte_8B07
                bne     loc_C2F7

loc_C2EF:                               ; CODE XREF: sub_C2B7+21↑j
                                        ; sub_C2B7+28↑j ...
                xgdy
                xgdx
                bset    <byte_B4 $80
                bra     loc_C2FA
; ---------------------------------------------------------------------------

loc_C2F7:                               ; CODE XREF: sub_C2B7+B↑j
                                        ; sub_C2B7+D↑j ...
                bclr    <byte_B4 $80

loc_C2FA:                               ; CODE XREF: sub_C2B7+3E↑j
                ldab    0,x
                stab    Temp5_t3
                ldy     #byte_8AF2
                clra
                ldab    byte_8AF0
                brset   <byte_4A $40 loc_C35C ; '@'
                brset   <byte_4A $80 loc_C311
                bra     loc_C318
; ---------------------------------------------------------------------------

loc_C311:                               ; CODE XREF: sub_C2B7+54↑j
                cpx     #$34 ; '4'
                bne     loc_C35E
                bra     loc_C370
; ---------------------------------------------------------------------------

loc_C318:                               ; CODE XREF: sub_C2B7+58↑j
                ldab    byte_8AF1
                ldaa    byte_8019
                bita    #2
                beq     loc_C329
                cpx     #$34 ; '4'
                bne     loc_C35E
                bra     loc_C32F
; ---------------------------------------------------------------------------

loc_C329:                               ; CODE XREF: sub_C2B7+69↑j
                ldaa    <byte_22
                cmpa    #$E
                bne     loc_C35E

loc_C32F:                               ; CODE XREF: sub_C2B7+70↑j
                ldaa    Temp5_t3
                bne     loc_C35E
                ldaa    byte_8AF6
                brclr   <byte_9F $80 loc_C33E
                ldaa    byte_8AF7

loc_C33E:                               ; CODE XREF: sub_C2B7+80↑j
                cmpa    <byte_33
                beq     loc_C35E
                ldab    <byte_33
                stab    Temp5_t3
                ldy     #byte_8AF6
                ldab    byte_8AF5
                brset   <byte_58 1 loc_C370
                jsr     sub_C37C
                ldaa    Temp5_t3
                staa    <byte_33
                bra     loc_C36A
; ---------------------------------------------------------------------------

loc_C35C:                               ; CODE XREF: sub_C2B7+50↑j
                bra     loc_C372
; ---------------------------------------------------------------------------

loc_C35E:                               ; CODE XREF: sub_C2B7+5D↑j
                                        ; sub_C2B7+6E↑j ...
                brset   <byte_58 1 loc_C370
                jsr     sub_C37C
                ldaa    Temp5_t3
                staa    0,x

loc_C36A:                               ; CODE XREF: sub_C2B7+A3↑j
                cli
                ldaa    0,x
                staa    <byte_9D
                rts
; ---------------------------------------------------------------------------

loc_C370:                               ; CODE XREF: sub_C2B7+5F↑j
                                        ; sub_C2B7+97↑j ...
                ldaa    0,x

loc_C372:                               ; CODE XREF: sub_C2B7:loc_C35C↑j
                staa    <byte_9D
                ldaa    <byte_9B
                cba
                bcs     locret_C37B
                stab    <byte_9B

locret_C37B:                            ; CODE XREF: sub_C2B7+C0↑j
                rts
; End of function sub_C2B7


; =============== S U B R O U T I N E =======================================


sub_C37C:                               ; CODE XREF: sub_C2B7+9B↑P
                                        ; sub_C2B7+AB↑P
                sei
                ldaa    <byte_9B
                sba
                bcs     locret_C3AB
                staa    <byte_9B
                cli
                ldaa    2,y
                brclr   <byte_9F $80 loc_C38D
                nega

loc_C38D:                               ; CODE XREF: sub_C37C+C↑j
                ldab    0,y
                adda    Temp5_t3
                bvc     loc_C39E
                ldaa    Temp5_t3
                bpl     loc_C3A7
                ldab    1,y
                tba

loc_C39E:                               ; CODE XREF: sub_C37C+17↑j
                cba
                bge     loc_C3A7
                ldab    1,y
                cba
                bge     loc_C3A8

loc_C3A7:                               ; CODE XREF: sub_C37C+1C↑j
                                        ; sub_C37C+23↑j
                tba

loc_C3A8:                               ; CODE XREF: sub_C37C+29↑j
                staa    Temp5_t3

locret_C3AB:                            ; CODE XREF: sub_C37C+4↑j
                rts
; End of function sub_C37C


; =============== S U B R O U T I N E =======================================


sub_C3AC:                               ; CODE XREF: __RESET+73D↑P
                ldaa    byte_8019
                bita    #2
                bne     loc_C3B4

locret_C3B3:                            ; CODE XREF: sub_C3AC:loc_C3B4↓j
                rts
; ---------------------------------------------------------------------------

loc_C3B4:                               ; CODE XREF: sub_C3AC+5↑j
                brclr   <byte_B4 $40 locret_C3B3 ; '@'
                brclr   <byte_38 8 loc_C3DA
                ldx     #$23 ; '#'
                ldab    byte_8B04
                abx
                ldaa    <byte_34
                suba    0,x
                blt     loc_C3DA
                brclr   <byte_38 $80 loc_C3D0
                adda    byte_8B09

loc_C3D0:                               ; CODE XREF: sub_C3AC+1D↑j
                cmpa    byte_8B08
                bcs     loc_C3DA
                bset    <byte_38 $80
                bra     loc_C3DD
; ---------------------------------------------------------------------------

loc_C3DA:                               ; CODE XREF: sub_C3AC+C↑j
                                        ; sub_C3AC+1B↑j ...
                bclr    <byte_38 $80

loc_C3DD:                               ; CODE XREF: sub_C3AC+2C↑j
                brclr   <byte_38 4 loc_C3FF
                ldx     #$23 ; '#'
                ldab    byte_8B05
                abx
                ldaa    <byte_35
                suba    0,x
                blt     loc_C3FF
                brclr   <byte_38 $40 loc_C3F5 ; '@'
                adda    byte_8B0B

loc_C3F5:                               ; CODE XREF: sub_C3AC+42↑j
                cmpa    byte_8B0A
                bcs     loc_C3FF
                bset    <byte_38 $40 ; '@'
                bra     loc_C402
; ---------------------------------------------------------------------------

loc_C3FF:                               ; CODE XREF: sub_C3AC:loc_C3DD↑j
                                        ; sub_C3AC+40↑j ...
                bclr    <byte_38 $40 ; '@'

loc_C402:                               ; CODE XREF: sub_C3AC+51↑j
                brclr   <byte_38 2 loc_C424
                ldx     #$23 ; '#'
                ldab    byte_8B06
                abx
                ldaa    <byte_36
                suba    0,x
                blt     loc_C424
                brclr   <byte_38 $20 loc_C41A ; ' '
                adda    byte_8B0D

loc_C41A:                               ; CODE XREF: sub_C3AC+67↑j
                cmpa    byte_8B0C
                bcs     loc_C424
                bset    <byte_38 $20 ; ' '
                bra     loc_C427
; ---------------------------------------------------------------------------

loc_C424:                               ; CODE XREF: sub_C3AC:loc_C402↑j
                                        ; sub_C3AC+65↑j ...
                bclr    <byte_38 $20 ; ' '

loc_C427:                               ; CODE XREF: sub_C3AC+76↑j
                brclr   <byte_38 1 loc_C449
                ldx     #$23 ; '#'
                ldab    byte_8B07
                abx
                ldaa    <byte_37
                suba    0,x
                blt     loc_C449
                brclr   <byte_38 $10 loc_C43F
                adda    byte_8B0F

loc_C43F:                               ; CODE XREF: sub_C3AC+8C↑j
                cmpa    byte_8B0E
                bcs     loc_C449
                bset    <byte_38 $10
                bra     loc_C44C
; ---------------------------------------------------------------------------

loc_C449:                               ; CODE XREF: sub_C3AC:loc_C427↑j
                                        ; sub_C3AC+8A↑j ...
                bclr    <byte_38 $10

loc_C44C:                               ; CODE XREF: sub_C3AC+9B↑j
                ldaa    <byte_38
                oraa    <byte_21
                staa    <byte_38
                staa    <byte_21
                rts
; End of function sub_C3AC


; =============== S U B R O U T I N E =======================================


sub_C455:                               ; CODE XREF: __RESET+740↑P
                ldab    <byte_9F
                clra
                cmpb    byte_8AD9
                bge     loc_C469
                ldab    <byte_72
                cmpb    byte_8ADA
                bcs     loc_C469
                ldaa    <byte_99
                inca
                beq     loc_C46B

loc_C469:                               ; CODE XREF: sub_C455+6↑j
                                        ; sub_C455+D↑j
                staa    <byte_99

loc_C46B:                               ; CODE XREF: sub_C455+12↑j
                ldaa    byte_8AE0
                beq     loc_C47C
                brclr   <byte_58 $40 loc_C476 ; '@'
                adda    #4

loc_C476:                               ; CODE XREF: sub_C455+1B↑j
                cmpa    <byte_7A
                bcs     loc_C48D
                bra     loc_C492
; ---------------------------------------------------------------------------

loc_C47C:                               ; CODE XREF: sub_C455+19↑j
                ldab    <byte_80
                addb    byte_8AE1
                brclr   <byte_58 $40 loc_C488 ; '@'
                addb    byte_8AE2

loc_C488:                               ; CODE XREF: sub_C455+2C↑j
                ldaa    <byte_6B
                cba
                bcs     loc_C492

loc_C48D:                               ; CODE XREF: sub_C455+23↑j
                bclr    <byte_58 $40 ; '@'
                bra     loc_C495
; ---------------------------------------------------------------------------

loc_C492:                               ; CODE XREF: sub_C455+25↑j
                                        ; sub_C455+36↑j
                bset    <byte_58 $40 ; '@'

loc_C495:                               ; CODE XREF: sub_C455+3B↑j
                clra
                staa    Temp5_t3
                ldab    <byte_58
                ldx     #byte_8AE4
                ldaa    <byte_4A
                bmi     loc_C4F6
                bitb    #$40 ; '@'
                beq     loc_C4C9
                bitb    #$80
                bne     loc_C4B7
                ldaa    <byte_72
                cmpa    byte_8ADC
                bcs     loc_C4B4
                clr     byte_9F

loc_C4B4:                               ; CODE XREF: sub_C455+5A↑j
                bset    <byte_58 $80

loc_C4B7:                               ; CODE XREF: sub_C455+53↑j
                ldab    #$E
                ldaa    byte_8017
                bita    #1
                bne     loc_C518
                ldaa    <byte_4D
                bita    #$10
                bne     loc_C518
                incb
                bra     loc_C518
; ---------------------------------------------------------------------------

loc_C4C9:                               ; CODE XREF: sub_C455+4F↑j
                andb    #$7F
                stab    <byte_58
                ldaa    byte_8019
                bita    #8
                beq     loc_C4F6
                ldaa    byte_8AE3
                ldab    #$C
                cmpb    <byte_22
                bcs     loc_C4E0
                adda    byte_8AE2

loc_C4E0:                               ; CODE XREF: sub_C455+86↑j
                cmpa    <byte_6B
                bcc     loc_C518
                incb
                bra     loc_C518
; ---------------------------------------------------------------------------

loc_C4E7:                               ; CODE XREF: sub_C455+AF↓j
                ldaa    0,x
                cmpb    Temp5_t3
                bcc     loc_C4F1
                adda    byte_8AEB

loc_C4F1:                               ; CODE XREF: sub_C455+97↑j
                cmpa    <byte_6D
                bcc     loc_C506
                inx

loc_C4F6:                               ; CODE XREF: sub_C455+4B↑j
                                        ; sub_C455+7D↑j
                bclr    <byte_58 $80
                ldab    <byte_22
                inc     Temp5_t3
                inc     Temp5_t3
                cpx     #byte_8AE9
                bne     loc_C4E7

loc_C506:                               ; CODE XREF: sub_C455+9E↑j
                ldaa    byte_8AE9
                lsrb
                bcs     loc_C50F
                adda    byte_8AEA

loc_C50F:                               ; CODE XREF: sub_C455+B5↑j
                ldab    Temp5_t3
                cmpa    <byte_6B
                bcs     loc_C517
                decb

loc_C517:                               ; CODE XREF: sub_C455+BF↑j
                decb

loc_C518:                               ; CODE XREF: sub_C455+69↑j
                                        ; sub_C455+6F↑j ...
                cmpb    <byte_22
                bne     loc_C52F
                ldaa    byte_8019
                bita    #2
                beq     loc_C571
                ldaa    byte_165
                eora    byte_166
                bita    #$20 ; ' '
                bne     loc_C565
                bra     loc_C571
; ---------------------------------------------------------------------------

loc_C52F:                               ; CODE XREF: sub_C455+C5↑j
                clr     byte_9B
                clr     byte_B2
                ldaa    byte_8019
                bita    #2
                beq     loc_C565
                ldaa    <byte_72
                cmpa    byte_8B16
                bcs     loc_C562
                ldaa    #$80
                cmpb    byte_8B04
                beq     loc_C55C
                lsra
                cmpb    byte_8B05
                beq     loc_C55C
                lsra
                cmpb    byte_8B06
                beq     loc_C55C
                lsra
                cmpb    byte_8B07
                bne     loc_C565

loc_C55C:                               ; CODE XREF: sub_C455+F3↑j
                                        ; sub_C455+F9↑j ...
                eora    <byte_B3
                staa    <byte_B3
                bra     loc_C565
; ---------------------------------------------------------------------------

loc_C562:                               ; CODE XREF: sub_C455+EC↑j
                bclr    <byte_B3 $F0

loc_C565:                               ; CODE XREF: sub_C455+D6↑j
                                        ; sub_C455+E5↑j ...
                ldaa    <byte_99
                cmpa    byte_8ADB
                bls     loc_C571
                clra
                staa    <byte_9F
                staa    <byte_99

loc_C571:                               ; CODE XREF: sub_C455+CC↑j
                                        ; sub_C455+D8↑j ...
                stab    <byte_22
                rts
; End of function sub_C455


; =============== S U B R O U T I N E =======================================


sub_C574:                               ; CODE XREF: __RESET:loc_9862↑P
                ldd     <byte_8A
                cpd     byte_88AF
                bcc     loc_C589
                bset    <byte_58 8
                ldaa    byte_88B1
                staa    <byte_EB

loc_C584:                               ; CODE XREF: sub_C574+1E↓j
                clra
                staa    <byte_9F
                bra     loc_C597
; ---------------------------------------------------------------------------

loc_C589:                               ; CODE XREF: sub_C574+6↑j
                ldaa    <byte_EB
                beq     loc_C594
                dec     byte_EB
                beq     loc_C594
                bra     loc_C584
; ---------------------------------------------------------------------------

loc_C594:                               ; CODE XREF: sub_C574+17↑j
                                        ; sub_C574+1C↑j
                bclr    <byte_58 8

loc_C597:                               ; CODE XREF: sub_C574+13↑j
                ldaa    <byte_72
                ldab    <byte_65
                bne     loc_C5B2
                cmpa    byte_8AD8
                ldab    <byte_91
                bcs     loc_C5AB
                beq     loc_C5B2
                decb
                stab    <byte_91
                bra     loc_C5B2
; ---------------------------------------------------------------------------

loc_C5AB:                               ; CODE XREF: sub_C574+2E↑j
                bne     loc_C5B2
                ldab    byte_8AD7
                stab    <byte_91

loc_C5B2:                               ; CODE XREF: sub_C574+27↑j
                                        ; sub_C574+30↑j ...
                brclr   <byte_50 8 loc_C5C2
                bclr    <byte_5D 4
                brset   <byte_5D 8 loc_C5C0
                bclr    <byte_51 $40 ; '@'

loc_C5C0:                               ; CODE XREF: sub_C574+45↑j
                bra     loc_C603
; ---------------------------------------------------------------------------

loc_C5C2:                               ; CODE XREF: sub_C574:loc_C5B2↑j
                brset   <byte_5D 4 loc_C60D
                ldaa    <byte_72
                cmpa    byte_893C
                bcs     loc_C603
                ldaa    <byte_93
                brset   <byte_65 $FF loc_C5D5
                bra     loc_C5DA
; ---------------------------------------------------------------------------

loc_C5D5:                               ; CODE XREF: sub_C574+5B↑j
                beq     loc_C5DC
                deca
                staa    <byte_93

loc_C5DA:                               ; CODE XREF: sub_C574+5F↑j
                bne     loc_C603

loc_C5DC:                               ; CODE XREF: sub_C574:loc_C5D5↑j
                ldaa    <byte_71
                cmpa    byte_8A6A
                bcc     loc_C5E8
                cmpa    byte_8A6B
                bcc     loc_C603

loc_C5E8:                               ; CODE XREF: sub_C574+6D↑j
                brset   <byte_5E 4 loc_C603
                ldaa    <byte_71
                cmpa    #$3E ; '>'
                bcc     loc_C603
                bset    <byte_51 $40 ; '@'
                bset    <byte_5D 4
                bclr    <byte_5D 3
                clra
                staa    byte_152
                staa    <byte_B1
                staa    <byte_95

loc_C603:                               ; CODE XREF: sub_C574:loc_C5C0↑j
                                        ; sub_C574+57↑j ...
                clr     byte_9F
                bset    <byte_58 1
                bset    <byte_B4 $20 ; ' '
                rts
; ---------------------------------------------------------------------------

loc_C60D:                               ; CODE XREF: sub_C574:loc_C5C2↑j
                clrb
                brset   <byte_5E 4 loc_C628
                ldaa    <byte_71
                cmpa    #$3E ; '>'
                bcc     loc_C628
                cmpa    byte_8A6A
                bcc     loc_C634
                cmpa    byte_8A6B
                bcs     loc_C634
                ldaa    <byte_64
                cmpa    #$2C ; ','
                bcs     loc_C634

loc_C628:                               ; CODE XREF: sub_C574+9A↑j
                                        ; sub_C574+A2↑j
                brset   <byte_65 1 loc_C636
                ldab    <byte_93
                incb
                bne     loc_C634
                jmp     loc_C7BF
; ---------------------------------------------------------------------------

loc_C634:                               ; CODE XREF: sub_C574+A7↑j
                                        ; sub_C574+AC↑j ...
                stab    <byte_93

loc_C636:                               ; CODE XREF: sub_C574:loc_C628↑j
                jsr     sub_C28F
                ldaa    <byte_71
                clrb
                cmpa    STe_648A
                bcc     loc_C647
                cmpa    FDRVar3
                bcs     loc_C648
                rts
; ---------------------------------------------------------------------------

loc_C647:                               ; CODE XREF: sub_C574+CB↑j
                decb

loc_C648:                               ; CODE XREF: sub_C574+D0↑j
                stab    Temp5_t3
                jsr     sub_C852
                ldab    <byte_B2
                beq     loc_C657
                cmpb    byte_8B12
                bcs     loc_C69E

loc_C657:                               ; CODE XREF: sub_C574+DC↑j
                ldab    byte_8AEC
                ldaa    Temp5_t3
                bmi     loc_C660
                negb

loc_C660:                               ; CODE XREF: sub_C574+E9↑j
                addb    <byte_9F
                bvs     loc_C669
                eorb    Temp5_t3
                bmi     loc_C69E

loc_C669:                               ; CODE XREF: sub_C574+EE↑j
                ldab    <byte_6D
                cmpb    byte_8AED
                bhi     loc_C69B
                brset   <byte_51 $10 loc_C69B
                ldab    <byte_6B
                cmpb    byte_8AEF
                bhi     loc_C69B
                ldab    <byte_D1
                orab    <byte_D4
                orab    <byte_B6
                orab    <byte_AE
                orab    <byte_AF
                bne     loc_C69E
                brset   <byte_54 $80 loc_C69E
                ldab    <byte_91
                bne     loc_C69B
                brset   <byte_58 8 loc_C69B
                bclr    <byte_58 1
                bclr    <byte_B4 $20 ; ' '
                bra     loc_C6A1
; ---------------------------------------------------------------------------

loc_C69B:                               ; CODE XREF: sub_C574+FA↑j
                                        ; sub_C574+FC↑j ...
                bset    <byte_B4 $20 ; ' '

loc_C69E:                               ; CODE XREF: sub_C574+E1↑j
                                        ; sub_C574+F3↑j ...
                bset    <byte_58 1

loc_C6A1:                               ; CODE XREF: sub_C574+125↑j
                clra
                ldab    <byte_58
                eorb    Temp5_t3
                andb    #$20 ; ' '
                beq     loc_C6E9
                eorb    <byte_58
                stab    <byte_58
                clrb
                ldaa    <byte_95
                stab    <byte_95
                stab    <byte_B1
                stab    <byte_A2
                brset   <byte_58 2 locret_C6E8
                brset   <byte_51 $10 locret_C6E8
                ldab    byte_8A04
                beq     loc_C6D6
                ldab    <byte_A4
                brclr   <byte_58 $20 loc_C6CC ; ' '
                negb

loc_C6CC:                               ; CODE XREF: sub_C574+153↑j
                addb    <byte_9F
                stab    <byte_9F
                lsr     byte_A4
                bclr    <byte_5D $80

loc_C6D6:                               ; CODE XREF: sub_C574+14F↑j
                brset   <byte_58 $10 loc_C705
                bclr    <byte_5D 3
                bclr    <byte_F4 3
                bclr    <byte_F6 6
                clr     byte_152
                bra     loc_C705
; ---------------------------------------------------------------------------

locret_C6E8:                            ; CODE XREF: sub_C574+144↑j
                                        ; sub_C574+148↑j ...
                rts
; ---------------------------------------------------------------------------

loc_C6E9:                               ; CODE XREF: sub_C574+135↑j
                brset   <byte_58 2 locret_C6E8
                brset   <byte_51 $10 locret_C6E8
                ldab    <byte_95
                bne     loc_C6F8
                jmp     loc_C774
; ---------------------------------------------------------------------------

loc_C6F8:                               ; CODE XREF: sub_C574+17F↑j
                clr     byte_B1
                clr     byte_A2
                ldab    <byte_65
                bitb    byte_89A9
                bne     loc_C774

loc_C705:                               ; CODE XREF: sub_C574:loc_C6D6↑j
                                        ; sub_C574+172↑j
                clr     byte_B1
                clr     byte_A2
                staa    FDRVar3
                ldx     #unk_8A76
                jsr     sub_C7D2
                brclr   <byte_50 $40 loc_C71B ; '@'
                ldaa    byte_909B

loc_C71B:                               ; CODE XREF: sub_C574+1A0↑j
                ldab    FDRVar3
                beq     loc_C72C
                tab
                subb    FDRVar3
                bcc     loc_C72A
                clrb
                stab    FDRVar3

loc_C72A:                               ; CODE XREF: sub_C574+1B0↑j
                stab    <byte_95

loc_C72C:                               ; CODE XREF: sub_C574+1AA↑j
                ldab    <byte_95
                addb    0,x
                sba
                bhi     loc_C73D
                adda    0,x
                bpl     loc_C738
                clra

loc_C738:                               ; CODE XREF: sub_C574+1C1↑j
                clrb
                stab    <byte_95
                bra     loc_C744
; ---------------------------------------------------------------------------

loc_C73D:                               ; CODE XREF: sub_C574+1BD↑j
                ldaa    0,x
                tab
                addb    <byte_95
                stab    <byte_95

loc_C744:                               ; CODE XREF: sub_C574+1C7↑j
                ldab    FDRVar3
                beq     loc_C74D
                cba
                bcs     loc_C74D
                tba

loc_C74D:                               ; CODE XREF: sub_C574+1D3↑j
                                        ; sub_C574+1D6↑j
                brclr   <byte_58 $20 loc_C752 ; ' '
                nega

loc_C752:                               ; CODE XREF: sub_C574:loc_C74D↑j
                jsr     sub_C92A
                brclr   <byte_4A $80 locret_C76B
                ldaa    <byte_72
                cmpa    byte_8AA2
                bcc     locret_C76B
                ldaa    Temp5_t3
                bne     locret_C76B
                ldaa    byte_8AA3
                jsr     sub_C92A

locret_C76B:                            ; CODE XREF: sub_C574+1E1↑j
                                        ; sub_C574+1EA↑j ...
                rts
; ---------------------------------------------------------------------------

loc_C76C:                               ; CODE XREF: sub_C574+206↓j
                ldaa    <byte_65
                bne     locret_C7D1
                inc     byte_152
                rts
; ---------------------------------------------------------------------------

loc_C774:                               ; CODE XREF: sub_C574+181↑J
                                        ; sub_C574+18F↑j
                ldaa    byte_152
                cmpa    byte_9054
                bcs     loc_C76C
                clr     byte_152
                brset   <byte_5D 3 loc_C787
                inc     byte_5D
                rts
; ---------------------------------------------------------------------------

loc_C787:                               ; CODE XREF: sub_C574+20B↑j
                ldaa    byte_9054
                staa    byte_152
                brclr   <byte_58 $20 loc_C7A2 ; ' '
                brset   <byte_F4 1 loc_C7B1
                ldd     #$881
                jsr     sub_AE82
                bcc     locret_C7D1
                bset    <byte_F4 1
                bra     loc_C7B1
; ---------------------------------------------------------------------------

loc_C7A2:                               ; CODE XREF: sub_C574+219↑j
                brset   <byte_F4 2 loc_C7B1
                ldd     #$981
                jsr     sub_AE82
                bcc     locret_C7D1
                bset    <byte_F4 2

loc_C7B1:                               ; CODE XREF: sub_C574+21D↑j
                                        ; sub_C574+22C↑j ...
                clra
                staa    <byte_9D
                ldx     #$23 ; '#'

loc_C7B7:                               ; CODE XREF: sub_C574+249↓j
                staa    0,x
                inx
                cpx     #$39 ; '9'
                bne     loc_C7B7

loc_C7BF:                               ; CODE XREF: sub_C574+BD↑J
                clra
                staa    <byte_9B
                staa    byte_152
                staa    <byte_93
                bclr    <byte_5D 4
                brset   <byte_5D 8 locret_C7D1
                bclr    <byte_51 $40 ; '@'

locret_C7D1:                            ; CODE XREF: sub_C574+1FA↑j
                                        ; sub_C574+227↑j ...
                rts
; End of function sub_C574


; =============== S U B R O U T I N E =======================================


sub_C7D2:                               ; CODE XREF: sub_C574+19D↑P
                                        ; sub_C8E3+32↓P
                brset   <byte_4A $80 loc_C7FC
                ldaa    <byte_80
                adda    byte_8A72
                ldab    <byte_A0
                cmpb    #9
                bne     loc_C7E4
                adda    byte_8A73

loc_C7E4:                               ; CODE XREF: sub_C7D2+D↑j
                cmpa    <byte_6B
                bcs     loc_C7FC
                ldaa    #9
                staa    <byte_A0
                ldab    #$14
                ldaa    byte_8017
                lsra
                bcs     loc_C848
                brclr   <byte_4D $10 loc_C848
                decb
                decb
                bra     loc_C848
; ---------------------------------------------------------------------------

loc_C7FC:                               ; CODE XREF: sub_C7D2↑j
                                        ; sub_C7D2+14↑j
                ldy     #byte_8A6C
                ldaa    <byte_A0
                suba    #3
                bcs     loc_C80A
                suba    #3
                bcc     loc_C80C

loc_C80A:                               ; CODE XREF: sub_C7D2+32↑j
                adda    #3

loc_C80C:                               ; CODE XREF: sub_C7D2+36↑j
                staa    STe_648A
                clrb

loc_C810:                               ; CODE XREF: sub_C7D2+52↓j
                ldaa    0,y
                cmpb    STe_648A
                bne     loc_C81B
                adda    byte_8A70

loc_C81B:                               ; CODE XREF: sub_C7D2+44↑j
                cmpa    <byte_6B
                bcc     loc_C828
                incb
                iny
                cmpb    #2
                bcs     loc_C810
                bra     loc_C82F
; ---------------------------------------------------------------------------

loc_C828:                               ; CODE XREF: sub_C7D2+4B↑j
                tstb
                bne     loc_C82D
                iny

loc_C82D:                               ; CODE XREF: sub_C7D2+57↑j
                iny

loc_C82F:                               ; CODE XREF: sub_C7D2+54↑j
                                        ; sub_C7D2+71↓j
                ldaa    0,y
                cmpb    <byte_A0
                bne     loc_C839
                adda    byte_8A71

loc_C839:                               ; CODE XREF: sub_C7D2+62↑j
                cmpa    <byte_6D
                bcc     loc_C845
                addb    #3
                iny
                cmpb    #6
                bcs     loc_C82F

loc_C845:                               ; CODE XREF: sub_C7D2+69↑j
                stab    <byte_A0
                aslb

loc_C848:                               ; CODE XREF: sub_C7D2+20↑j
                                        ; sub_C7D2+22↑j ...
                brclr   <byte_58 $20 loc_C84D ; ' '
                incb

loc_C84D:                               ; CODE XREF: sub_C7D2:loc_C848↑j
                abx
                ldaa    $16,x
                tab
                rts
; End of function sub_C7D2


; =============== S U B R O U T I N E =======================================


sub_C852:                               ; CODE XREF: sub_C574+D7↑P
                ldaa    <byte_AE
                beq     loc_C859
                dec     byte_AE

loc_C859:                               ; CODE XREF: sub_C852+2↑j
                brset   <byte_54 $80 loc_C866
                ldaa    <byte_B6
                beq     loc_C86D
                dec     byte_B6
                bra     loc_C8D2
; ---------------------------------------------------------------------------

loc_C866:                               ; CODE XREF: sub_C852:loc_C859↑j
                ldaa    byte_8ADF
                staa    <byte_B6
                bra     loc_C8D2
; ---------------------------------------------------------------------------

loc_C86D:                               ; CODE XREF: sub_C852+D↑j
                brset   <byte_58 8 loc_C8D2
                brset   <byte_4A $40 loc_C87E ; '@'
                ldaa    <byte_AF
                beq     loc_C885
                deca
                staa    <byte_AF
                bra     loc_C8D2
; ---------------------------------------------------------------------------

loc_C87E:                               ; CODE XREF: sub_C852+1F↑j
                ldaa    byte_8ADD
                staa    <byte_AF
                bra     loc_C8D2
; ---------------------------------------------------------------------------

loc_C885:                               ; CODE XREF: sub_C852+25↑j
                brset   <byte_5A $10 loc_C8D2
                pshb
                ldx     #byte_8AF9
                ldaa    <byte_8
                jsr     sub_F0B5
                pulb
                brclr   <byte_51 $10 loc_C89A
                adda    byte_8AEE

loc_C89A:                               ; CODE XREF: sub_C852+41↑j
                cmpa    <byte_6D
                bls     loc_C8AA
                bset    <byte_51 $10
                ldaa    byte_8019
                bita    #$20 ; ' '
                bne     loc_C8D2
                bra     loc_C8DB
; ---------------------------------------------------------------------------

loc_C8AA:                               ; CODE XREF: sub_C852+4A↑j
                bclr    <byte_51 $10
                ldaa    byte_8ADE
                beq     loc_C8B4
                ldaa    <byte_D1

loc_C8B4:                               ; CODE XREF: sub_C852+5E↑j
                oraa    <byte_AE
                bne     loc_C8D5
                brclr   <byte_58 2 loc_C8CE
                bset    <byte_58 $10
                tstb
                bne     loc_C8C7
                bset    <byte_58 $20 ; ' '
                bra     loc_C8CA
; ---------------------------------------------------------------------------

loc_C8C7:                               ; CODE XREF: sub_C852+6E↑j
                bclr    <byte_58 $20 ; ' '

loc_C8CA:                               ; CODE XREF: sub_C852+73↑j
                bclr    <byte_58 2
                rts
; ---------------------------------------------------------------------------

loc_C8CE:                               ; CODE XREF: sub_C852+66↑j
                bclr    <byte_58 $10
                rts
; ---------------------------------------------------------------------------

loc_C8D2:                               ; CODE XREF: sub_C852+12↑j
                                        ; sub_C852+19↑j ...
                clr     byte_9F

loc_C8D5:                               ; CODE XREF: sub_C852+64↑j
                bset    <byte_58 2
                bclr    <byte_58 $10

loc_C8DB:                               ; CODE XREF: sub_C852+56↑j
                clra
                staa    <byte_95
                staa    <byte_B1
                staa    <byte_A4
                rts
; End of function sub_C852


; =============== S U B R O U T I N E =======================================


sub_C8E3:                               ; CODE XREF: __RESET+737↑P
                brclr   <byte_5D 4 loc_C8EB
                brclr   <byte_58 2 loc_C8EE

loc_C8EB:                               ; CODE XREF: sub_C8E3↑j
                jmp     loc_C970
; ---------------------------------------------------------------------------

loc_C8EE:                               ; CODE XREF: sub_C8E3+4↑j
                ldaa    byte_8A04
                beq     loc_C912
                cmpa    <byte_A2
                bhi     loc_C912
                ldx     #byte_8AD0
                bset    <byte_5A $40 ; '@'
                brset   <byte_5D $80 loc_C907
                bset    <byte_5D $80
                clr     byte_A4

loc_C907:                               ; CODE XREF: sub_C8E3+1A↑j
                brclr   <byte_58 $20 loc_C90D ; ' '
                inx
                inx

loc_C90D:                               ; CODE XREF: sub_C8E3:loc_C907↑j
                ldab    0,x
                inx
                bra     loc_C91F
; ---------------------------------------------------------------------------

loc_C912:                               ; CODE XREF: sub_C8E3+E↑j
                                        ; sub_C8E3+12↑j
                ldx     #unk_8AA4
                jsr     sub_C7D2
                brclr   <byte_50 $40 loc_C91F ; '@'
                ldab    byte_909A

loc_C91F:                               ; CODE XREF: sub_C8E3+2D↑j
                                        ; sub_C8E3+35↑j
                sei
                ldaa    <byte_B1
                sba
                bcs     loc_C96D
                staa    <byte_B1
                cli
                ldaa    0,x
; End of function sub_C8E3


; =============== S U B R O U T I N E =======================================


sub_C92A:                               ; CODE XREF: sub_C574:loc_C752↑P
                                        ; sub_C574+1F4↑P
                ldab    byte_8A74
                adda    <byte_9F
                bvc     loc_C939
                ldaa    <byte_9F
                bpl     loc_C942
                ldab    byte_8A75
                tba

loc_C939:                               ; CODE XREF: sub_C92A+5↑j
                cba
                bge     loc_C942
                ldab    byte_8A75
                cba
                bge     loc_C943

loc_C942:                               ; CODE XREF: sub_C92A+9↑j
                                        ; sub_C92A+10↑j
                tba

loc_C943:                               ; CODE XREF: sub_C92A+16↑j
                brset   <byte_F6 4 loc_C94B
                brclr   <byte_F4 3 loc_C94E

loc_C94B:                               ; CODE XREF: sub_C92A:loc_C943↑j
                tsta
                bmi     loc_C96D

loc_C94E:                               ; CODE XREF: sub_C92A+1D↑j
                ldab    byte_8A04
                beq     loc_C96B
                brclr   <byte_5A $40 loc_C96B ; '@'
                tab
                subb    <byte_9F
                bpl     loc_C95D
                negb

loc_C95D:                               ; CODE XREF: sub_C92A+30↑j
                addb    <byte_A4
                bcs     loc_C966
                cmpb    byte_8AD4
                bcs     loc_C969

loc_C966:                               ; CODE XREF: sub_C92A+35↑j
                ldab    byte_8AD4

loc_C969:                               ; CODE XREF: sub_C92A+3A↑j
                stab    <byte_A4

loc_C96B:                               ; CODE XREF: sub_C92A+27↑j
                                        ; sub_C92A+29↑j
                staa    <byte_9F

loc_C96D:                               ; CODE XREF: sub_C8E3+40↑j
                                        ; sub_C92A+22↑j
                cli
                bra     loc_C979
; ---------------------------------------------------------------------------

loc_C970:                               ; CODE XREF: sub_C8E3:loc_C8EB↑J
                clr     byte_B1
                clr     byte_A2
                clr     byte_A4

loc_C979:                               ; CODE XREF: sub_C92A+44↑j
                bclr    <byte_5A $40 ; '@'
                rts
; End of function sub_C92A


; =============== S U B R O U T I N E =======================================


sub_C97D:                               ; CODE XREF: __RESET+4B6↑P
                                        ; __RESET+707↑P
                brclr   <byte_48 $40 loc_C984 ; '@'
                jmp     locret_CA12
; ---------------------------------------------------------------------------

loc_C984:                               ; CODE XREF: sub_C97D↑j
                ldaa    <byte_72
                ldab    byte_8AD7
                cmpa    byte_8AD5
                bcc     loc_C991
                ldab    byte_8AD6

loc_C991:                               ; CODE XREF: sub_C97D+F↑j
                stab    <byte_90
                stab    <byte_91
                ldaa    byte_13A
                ldx     #byte_8919
                jsr     sub_F0B5
                staa    <byte_92
                staa    <byte_93
                bset    <byte_57 3
                ldaa    byte_8019
                bita    #$80
                beq     loc_C9AF
                bset    <byte_58 3

loc_C9AF:                               ; CODE XREF: sub_C97D+2D↑j
                clr     byte_A3
                clr     byte_A4
                ldaa    <byte_72
                ldx     #byte_86CF
                jsr     sub_F0B5
                pshb
                ldaa    <byte_8
                ldx     #byte_86F2
                jsr     sub_F0B5
                pula
                mul
                std     FDRVar2
                ldaa    <byte_D9
                ldx     #byte_8705
                jsr     sub_F0B5
                ldy     FDRVar2
                jsr     sub_F06D
                sty     STe_648A
                ldd     FDRVar2
                subd    STe_648A
                std     FDRVar2
                ldaa    <byte_6B
                ldx     #byte_8728
                jsr     sub_F0B5
                ldy     FDRVar2
                jsr     sub_F06D
                sty     STe_648A
                ldd     FDRVar2
                subd    STe_648A
                std     FDRVar2
                clra
                ldab    <byte_D8
                lsld
                lsld
                addd    FDRVar2
                bcc     loc_CA10
                ldd     #$FFFF

loc_CA10:                               ; CODE XREF: sub_C97D+8E↑j
                std     <byte_86

locret_CA12:                            ; CODE XREF: sub_C97D+4↑J
                rts
; End of function sub_C97D


; =============== S U B R O U T I N E =======================================


sub_CA13:                               ; CODE XREF: __RESET+806↑P
                brclr   <byte_51 8 locret_CA81
                brclr   <byte_2 1 loc_CA23
                ldaa    byte_13D
                cmpa    byte_86BB
                bcs     locret_CA81

loc_CA23:                               ; CODE XREF: sub_CA13+4↑j
                bclr    <byte_51 8
                ldx     #byte_86BC
                ldaa    <byte_72
                jsr     sub_F0B5
                clrb
                std     FDRVar0
                std     word_48C
                sei
                std     InjectorPulsewidth_HB_Cyl4
                std     InjectorPulsewidth_HB_Cyl3
                std     InjectorPulsewidth_HB_Cyl2
                std     InjectorPulsewidth_HB_Cyl1
                ldd     #loc_F060
                brset   <byte_4F $20 loc_CA4C ; ' '
                ldd     #$FC70

loc_CA4C:                               ; CODE XREF: sub_CA13+32↑j
                oraa    TCTL1           ; Timer Control Register 1
                staa    TCTL1           ; Timer Control Register 1
                stab    CFORC           ; Timer Compare Force Register
                ldd     TCNTH           ; Timer Counter Register
                addd    FDRVar0
                std     TOC2H           ; Output Compare 2 Register
                std     TOC3H           ; Output Compare 3 Register
                brset   <byte_4F $20 loc_CA75 ; ' '
                std     TOC4H           ; Output Compare 4 Register
                ldaa    TCTL1           ; Timer Control Register 1
                anda    #$AB
                staa    TCTL1           ; Timer Control Register 1
                jsr     sub_F245
                bra     loc_CA7D
; ---------------------------------------------------------------------------

loc_CA75:                               ; CODE XREF: sub_CA13+4E↑j
                ldaa    TCTL1           ; Timer Control Register 1
                anda    #$AF
                staa    TCTL1           ; Timer Control Register 1

loc_CA7D:                               ; CODE XREF: sub_CA13+60↑j
                bset    <byte_5C $40 ; '@'
                cli

locret_CA81:                            ; CODE XREF: sub_CA13↑j
                                        ; sub_CA13+E↑j
                rts
; End of function sub_CA13


; =============== S U B R O U T I N E =======================================


sub_CA82:                               ; CODE XREF: __RESET+6D9↑P

; FUNCTION CHUNK AT F7A3 SIZE 00000098 BYTES

                sei

loc_CA83:                               ; CODE XREF: sub_CA82+4↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_CA83
                ldaa    ADR4            ; A_D Result Register 4
                cli
                ldab    <byte_E5
                staa    <byte_E5
                sba
                bcs     loc_CAAA
                cmpa    byte_87FD
                bcc     loc_CA9B
                jmp     loc_CB4B
; ---------------------------------------------------------------------------

loc_CA9B:                               ; CODE XREF: sub_CA82+14↑j
                staa    Temp5_t3
                brclr   <byte_48 $40 loc_CAAA ; '@'
                brset   <byte_54 $80 loc_CAAA
                brclr   <byte_FB $20 loc_CAAD ; ' '

loc_CAAA:                               ; CODE XREF: sub_CA82+F↑j
                                        ; sub_CA82+1C↑j ...
                jmp     loc_CB4B
; ---------------------------------------------------------------------------

loc_CAAD:                               ; CODE XREF: sub_CA82+24↑j
                ldaa    <byte_6B
                cmpa    byte_87FE
                bcc     loc_CAAA
                ldx     #byte_8853
                ldaa    <byte_77
                jsr     sub_F0B5
                staa    STe_648A
                ldab    Temp5_t3
                aslb
                bcs     loc_CAC8
                aslb
                bcc     loc_CACA

loc_CAC8:                               ; CODE XREF: sub_CA82+41↑j
                ldab    #$FF

loc_CACA:                               ; CODE XREF: sub_CA82+44↑j
                brclr   <byte_5C $20 loc_CADD ; ' '
                bclr    <byte_5C $20 ; ' '
                clra
                ldx     #unk_186

loc_CAD5:                               ; CODE XREF: sub_CA82+59↓j
                inx
                staa    0,x
                cpx     #byte_19D
                bne     loc_CAD5

loc_CADD:                               ; CODE XREF: sub_CA82:loc_CACA↑j
                ldx     #byte_87FF
                ldaa    STe_648A
                sei
                bset    <byte_B4 8
                jsr     sub_F126
                bclr    <byte_B4 8
                cli
                staa    STe_648A
                ldaa    <byte_E6
                ldab    byte_19D
                ldx     #byte_187
                abx
                cpx     #byte_19D
                beq     loc_CB04
                staa    0,x
                inc     byte_19D

loc_CB04:                               ; CODE XREF: sub_CA82+7B↑j
                ldaa    <byte_72
                ldx     #byte_8872
                jsr     sub_F0B5
                ldab    STe_648A
                mul
                std     FDRVar2
                ldaa    STe_648A
                clrb
                lsrd
                lsrd
                addd    FDRVar2
                rora
                rorb
                lsrd
                std     FDRVar2
                beq     loc_CB4B
                clra
                ldab    <byte_D8
                lsld
                lsld
                addd    FDRVar2
                tst     byte_88AB
                bmi     loc_CB3B
                addd    byte_88AB
                bcc     loc_CB42
                ldd     #$FFFF
                bra     loc_CB42
; ---------------------------------------------------------------------------

loc_CB3B:                               ; CODE XREF: sub_CA82+AD↑j
                addd    byte_88AB
                bcc     loc_CB4B
                beq     loc_CB4B

loc_CB42:                               ; CODE XREF: sub_CA82+B2↑j
                                        ; sub_CA82+B7↑j
                bset    <byte_B4 4
                std     FDRVar0
                jmp     loc_F6C1
; ---------------------------------------------------------------------------

loc_CB4B:                               ; CODE XREF: sub_CA82+16↑J
                                        ; sub_CA82:loc_CAAA↑J ...
                bclr    <byte_B4 4
                bset    <byte_5C $20 ; ' '
                rts
; End of function sub_CA82


; =============== S U B R O U T I N E =======================================


sub_CB52:                               ; CODE XREF: __RESET+7C0↑P
                ldaa    <byte_64
                cmpa    byte_8C26
                bcs     loc_CBD0
                ldaa    <byte_7A
                cmpa    byte_8C27
                bcs     loc_CBD0
                ldaa    <byte_72
                cmpa    byte_8C28
                bcs     loc_CBD0
                ldaa    <byte_8
                cmpa    byte_8C2D
                bcs     loc_CBD0
                ldaa    byte_8C23
                ldab    <byte_80
                mul
                addd    <byte_80
                bcc     loc_CB7B
                ldd     #$FFFF

loc_CB7B:                               ; CODE XREF: sub_CB52+24↑j
                cpd     <byte_6B
                bcc     loc_CBD0
                brclr   <byte_54 $40 loc_CB8B ; '@'
                jsr     sub_CC29
                brset   <byte_54 $40 loc_CBD0 ; '@'

loc_CB8B:                               ; CODE XREF: sub_CB52+2E↑j
                ldaa    byte_8C2E
                bne     loc_CB96
                brclr   <byte_4A $80 loc_CBD7
                bra     loc_CBD0
; ---------------------------------------------------------------------------

loc_CB96:                               ; CODE XREF: sub_CB52+3C↑j
                cmpa    #1
                bne     loc_CBB2
                ldd     <byte_88
                cpd     byte_8C2F
                bcs     loc_CBD7
                ldaa    byte_8019
                asla
                bcc     loc_CBD0
                ldd     <byte_8A
                cpd     byte_8C2F
                bcs     loc_CBD7
                bra     loc_CBD0
; ---------------------------------------------------------------------------

loc_CBB2:                               ; CODE XREF: sub_CB52+46↑j
                cmpa    #2
                bne     loc_CBD0
                brset   <byte_4A $80 loc_CBD0
                ldd     <byte_88
                cpd     byte_8C2F
                bcs     loc_CBD7
                ldaa    byte_8019
                asla
                bcc     loc_CBD0
                ldd     <byte_8A
                cpd     byte_8C2F
                bcs     loc_CBD7

loc_CBD0:                               ; CODE XREF: sub_CB52+5↑j
                                        ; sub_CB52+C↑j ...
                ldaa    byte_8C24
                staa    <byte_A9
                bra     loc_CBDE
; ---------------------------------------------------------------------------

loc_CBD7:                               ; CODE XREF: sub_CB52+3E↑j
                                        ; sub_CB52+4E↑j ...
                ldaa    <byte_A9
                bne     loc_CBDE
                bset    <byte_54 $C0

loc_CBDE:                               ; CODE XREF: sub_CB52+83↑j
                                        ; sub_CB52+87↑j
                ldd     byte_8C31
                brclr   <byte_54 2 loc_CBED
                subd    byte_8C33
                bcc     loc_CBED
                ldd     #0

loc_CBED:                               ; CODE XREF: sub_CB52+8F↑j
                                        ; sub_CB52+96↑j
                cpd     <byte_6B
                bcc     loc_CC09
                ldaa    byte_8C35
                brclr   <byte_54 2 loc_CC00
                suba    byte_8C36
                bcc     loc_CC00
                ldaa    #0

loc_CC00:                               ; CODE XREF: sub_CB52+A3↑j
                                        ; sub_CB52+AA↑j
                cmpa    <byte_7A
                bcc     loc_CC09
                bset    <byte_54 2
                bra     loc_CC0C
; ---------------------------------------------------------------------------

loc_CC09:                               ; CODE XREF: sub_CB52+9E↑j
                                        ; sub_CB52+B0↑j
                bclr    <byte_54 2

loc_CC0C:                               ; CODE XREF: sub_CB52+B5↑j
                ldd     byte_8C37
                brclr   <byte_54 1 loc_CC1B
                subd    byte_8C39
                bcc     loc_CC1B
                ldd     #0

loc_CC1B:                               ; CODE XREF: sub_CB52+BD↑j
                                        ; sub_CB52+C4↑j
                cpd     <byte_6B
                bcc     loc_CC25
                bset    <byte_54 1
                bra     locret_CC28
; ---------------------------------------------------------------------------

loc_CC25:                               ; CODE XREF: sub_CB52+CC↑j
                bclr    <byte_54 1

locret_CC28:                            ; CODE XREF: sub_CB52+D1↑j
                rts
; End of function sub_CB52


; =============== S U B R O U T I N E =======================================


sub_CC29:                               ; CODE XREF: sub_CB52+32↑P
                tst     byte_DA
                bne     locret_CC8E
                ldaa    <byte_6B
                cmpa    <byte_BA
                bcs     locret_CC8E
                ldd     <byte_88
                cpd     byte_8C29
                bcc     loc_CC4A
                ldaa    byte_8019
                asla
                bcc     loc_CC8B
                ldd     <byte_8A
                cpd     byte_8C29
                bcs     loc_CC8B

loc_CC4A:                               ; CODE XREF: sub_CC29+11↑j
                ldx     <byte_88
                ldaa    byte_8C25
                bne     loc_CC57
                brset   <byte_4A $80 loc_CC8B
                bra     locret_CC8E
; ---------------------------------------------------------------------------

loc_CC57:                               ; CODE XREF: sub_CC29+26↑j
                cmpa    #1
                bne     loc_CC70
                cpx     byte_8C2B
                bcs     locret_CC8E
                ldaa    byte_8019
                asla
                bcc     loc_CC8B
                ldd     <byte_8A
                cpd     byte_8C2B
                bcs     locret_CC8E
                bra     loc_CC8B
; ---------------------------------------------------------------------------

loc_CC70:                               ; CODE XREF: sub_CC29+30↑j
                cmpa    #2
                bne     loc_CC8B
                brclr   <byte_4A $80 locret_CC8E
                cpx     byte_8C2B
                bcs     locret_CC8E
                ldaa    byte_8019
                asla
                bcc     loc_CC8B
                ldd     <byte_8A
                cpd     byte_8C2B
                bcs     locret_CC8E

loc_CC8B:                               ; CODE XREF: sub_CC29+17↑j
                                        ; sub_CC29+1F↑j ...
                bclr    <byte_54 $40 ; '@'

locret_CC8E:                            ; CODE XREF: sub_CC29+3↑j
                                        ; sub_CC29+9↑j ...
                rts
; End of function sub_CC29


; =============== S U B R O U T I N E =======================================


sub_CC8F:                               ; CODE XREF: __RESET+7C3↑P
                ldaa    <byte_72
                cmpa    byte_8B17
                bls     loc_CCEF
                brclr   <byte_59 $10 loc_CCA7
                ldx     #byte_8B5F
                ldab    1,x
                ldaa    <byte_BB
                subb    byte_8B18
                cba
                bhi     loc_CCF9

loc_CCA7:                               ; CODE XREF: sub_CC8F+7↑j
                ldx     #byte_8B5F
                ldab    1,x
                ldaa    <byte_BB
                cba
                bhi     loc_CCF9

loc_CCB1:                               ; CODE XREF: sub_CC8F+6E↓j
                ldaa    byte_8019
                bita    #4
                bne     loc_CCCD
                ldx     #byte_8B3C
                ldd     <byte_6B
                aslb
                adca    #0
                jsr     sub_F0B5
                ldaa    <byte_8
                sba
                ldab    <byte_C1
                cba
                bcs     loc_CCDD
                bra     loc_CCEF
; ---------------------------------------------------------------------------

loc_CCCD:                               ; CODE XREF: sub_CC8F+27↑j
                ldx     #byte_8B19
                ldd     <byte_6B
                aslb
                adca    #0
                jsr     sub_F0B5
                ldaa    <byte_C1
                cba
                bls     loc_CCEF

loc_CCDD:                               ; CODE XREF: sub_CC8F+3A↑j
                ldx     #byte_8B82
                ldaa    byte_13E
                ldab    <byte_C1
                jsr     sub_F126
                staa    <byte_AC
                bset    <byte_5A $10
                bra     loc_CCF5
; ---------------------------------------------------------------------------

loc_CCEF:                               ; CODE XREF: sub_CC8F+5↑j
                                        ; sub_CC8F+3C↑j ...
                clr     byte_AC
                bclr    <byte_5A $10

loc_CCF5:                               ; CODE XREF: sub_CC8F+5E↑j
                bclr    <byte_59 $10

locret_CCF8:                            ; CODE XREF: sub_CC8F+83↓j
                rts
; ---------------------------------------------------------------------------

loc_CCF9:                               ; CODE XREF: sub_CC8F+16↑j
                                        ; sub_CC8F+20↑j
                brset   <byte_4A $40 loc_CCFF ; '@'
                bra     loc_CCB1
; ---------------------------------------------------------------------------

loc_CCFF:                               ; CODE XREF: sub_CC8F:loc_CCF9↑j
                ldx     #byte_8B5F
                ldd     <byte_6B
                aslb
                adca    #0
                jsr     sub_F0B5
                staa    <byte_AC
                bset    <byte_59 $10
                bset    <byte_5A $10
                bra     locret_CCF8
; End of function sub_CC8F


; =============== S U B R O U T I N E =======================================


sub_CD14:                               ; CODE XREF: __RESET+75E↑P
                brclr   <byte_51 $20 locret_CD64 ; ' '
                ldaa    <byte_E0
                beq     locret_CD64
                deca
                staa    <byte_E0
                rts
; End of function sub_CD14


; =============== S U B R O U T I N E =======================================


sub_CD20:                               ; CODE XREF: __RESET+7A1↑P
                ldaa    <byte_A5
                beq     loc_CD27
                deca
                staa    <byte_A5

loc_CD27:                               ; CODE XREF: sub_CD20+2↑j
                ldaa    <byte_A6
                beq     loc_CD2E
                deca
                staa    <byte_A6

loc_CD2E:                               ; CODE XREF: sub_CD20+9↑j
                ldaa    <byte_A7
                beq     loc_CD35
                deca
                staa    <byte_A7

loc_CD35:                               ; CODE XREF: sub_CD20+10↑j
                brclr   <byte_48 $40 loc_CD56 ; '@'
                brset   <byte_54 4 loc_CD4B
                ldaa    <byte_E1
                beq     loc_CD46
                deca
                staa    <byte_E1
                bne     loc_CD56

loc_CD46:                               ; CODE XREF: sub_CD20+1F↑j
                sei
                bset    <byte_54 4
                cli

loc_CD4B:                               ; CODE XREF: sub_CD20+19↑j
                ldaa    byte_13A
                ldx     #byte_88B7
                jsr     sub_F0B5
                stab    <byte_E1

loc_CD56:                               ; CODE XREF: sub_CD20:loc_CD35↑j
                                        ; sub_CD20+24↑j
                ldaa    <byte_A8
                inca
                beq     loc_CD5D
                staa    <byte_A8

loc_CD5D:                               ; CODE XREF: sub_CD20+39↑j
                ldaa    <byte_A9
                beq     locret_CD64
                deca
                staa    <byte_A9

locret_CD64:                            ; CODE XREF: sub_CD14↑j
                                        ; sub_CD14+6↑j ...
                rts
; End of function sub_CD20


; =============== S U B R O U T I N E =======================================


sub_CD65:                               ; CODE XREF: __RESET+4B3↑P
                                        ; __RESET+789↑P
                ldaa    <byte_72
                brset   <byte_48 $40 loc_CD80 ; '@'
                ldaa    byte_13A
                ldx     #byte_88B7
                jsr     sub_F0B5
                stab    <byte_E1
                ldaa    <byte_72
                ldx     #byte_85A6
                jsr     sub_F0B5
                stab    <byte_DC

loc_CD80:                               ; CODE XREF: sub_CD65+2↑j
                ldx     #byte_85DC
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_DF
                ldx     #byte_8592
                ldaa    <byte_72
                jsr     sub_F0B5
                staa    <byte_EC
                ldx     #byte_87E2
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_CD
                ldx     #byte_856C
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_D0
                ldx     #byte_8740
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_C4
                ldx     #byte_87AC
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_C5
                ldx     #byte_8881
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_D3
                ldx     #byte_875B
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_E7
                ldx     #byte_87C7
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_E8
                ldx     #byte_889C
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    byte_140
                ldx     #byte_8587
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    byte_141
                rts
; End of function sub_CD65


; =============== S U B R O U T I N E =======================================


sub_CDF1:                               ; CODE XREF: __RESET:loc_95DE↑P
                                        ; __RESET+704↑P
                ldaa    <byte_6F
                ldx     #byte_8679
                jsr     sub_F0B5
                stab    <byte_AB
                ldaa    <byte_76
                ldx     #byte_869C
                jsr     sub_F0B5
                stab    <byte_D8
                ldaa    <byte_76
                ldx     #byte_CE26
                jsr     sub_F0B5
                stab    byte_150
                ldaa    <byte_8
                ldx     #byte_88DC
                jsr     sub_F0B5
                stab    <byte_D6
                ldaa    <byte_6B
                ldx     #byte_8542
                jsr     sub_F0B5
                stab    byte_13F
                rts
; End of function sub_CDF1

; ---------------------------------------------------------------------------
byte_CE26:      fcb 5                   ; DATA XREF: sub_CDF1+16↑o
                fcb $95, $9C, $FA, 5
                fcb $A1, $53, $FF, 9
                fcb $C2, $34, $FF, $97
                fcb $E2, $27, $FF, $6A
                fcb $FF, $1F

; =============== S U B R O U T I N E =======================================


sub_CE39:                               ; CODE XREF: __RESET+6F8↑P
                brclr   <byte_48 $40 loc_CE65 ; '@'
                brset   <byte_4B $80 loc_CE51
                ldd     <byte_64
                bita    #$C0
                bne     loc_CE65
                lsld
                lsld
                cmpa    byte_88DA
                bcs     loc_CE65
                bset    <byte_4B $80

loc_CE51:                               ; CODE XREF: sub_CE39+4↑j
                ldaa    <byte_DE
                beq     loc_CE76
                ldaa    <byte_65
                bita    #$1F
                bne     loc_CE69
                ldaa    <byte_DE
                suba    byte_88DB
                bcc     loc_CE67
                clra
                bra     loc_CE67
; ---------------------------------------------------------------------------

loc_CE65:                               ; CODE XREF: sub_CE39↑j
                                        ; sub_CE39+C↑j ...
                ldaa    #$FF

loc_CE67:                               ; CODE XREF: sub_CE39+27↑j
                                        ; sub_CE39+2A↑j
                staa    <byte_DE

loc_CE69:                               ; CODE XREF: sub_CE39+20↑j
                ldaa    <byte_72
                ldx     #byte_85C9
                jsr     sub_F0B5
                ldab    <byte_DE
                mul
                adca    #0

loc_CE76:                               ; CODE XREF: sub_CE39+1A↑j
                staa    <byte_DD
                rts
; End of function sub_CE39


; =============== S U B R O U T I N E =======================================


sub_CE79:                               ; CODE XREF: __RESET+6E3↑P
                ldaa    <byte_7A
                cmpa    byte_88FA
                bcc     loc_CEA0
                brset   <byte_4A $80 loc_CECF
                clrb
                brclr   <byte_54 $10 loc_CECC
                ldaa    <byte_65
                bita    #7
                bne     loc_CEAA
                inc     byte_174
                ldaa    byte_88FB
                cmpa    byte_174
                bcc     loc_CEAA
                bclr    <byte_54 $10
                clrb
                bra     loc_CECC
; ---------------------------------------------------------------------------

loc_CEA0:                               ; CODE XREF: sub_CE79+5↑j
                clr     byte_174
                bset    <byte_54 $10
                brset   <byte_4A $80 loc_CECF

loc_CEAA:                               ; CODE XREF: sub_CE79+14↑j
                                        ; sub_CE79+1F↑j
                ldx     #byte_850C
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_E9
                ldaa    byte_88F9
                staa    byte_175
                ldx     #byte_8791
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_C3
                ldx     #byte_8551
                ldaa    <byte_72
                jsr     sub_F0B5

loc_CECC:                               ; CODE XREF: sub_CE79+C↑j
                                        ; sub_CE79+25↑j
                stab    <byte_CA
                rts
; ---------------------------------------------------------------------------

loc_CECF:                               ; CODE XREF: sub_CE79+7↑j
                                        ; sub_CE79+2D↑j
                ldx     #byte_8527
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_CA
                ldx     #byte_8776
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_C3
                ldaa    byte_88F8
                staa    byte_175
                ldx     #byte_84F1
                ldaa    <byte_72
                jsr     sub_F0B5
                stab    <byte_E9
                rts
; End of function sub_CE79


; =============== S U B R O U T I N E =======================================


sub_CEF4:                               ; CODE XREF: __RESET+774↑P
                                        ; sub_D14D+217↓P
                ldaa    byte_116
                bne     loc_CF02
                ldd     byte_83B5
                cpd     word_117
                bcc     loc_CF07

loc_CF02:                               ; CODE XREF: sub_CEF4+3↑j
                bset    <byte_49 2
                bra     loc_CF11
; ---------------------------------------------------------------------------

loc_CF07:                               ; CODE XREF: sub_CEF4+C↑j
                ldd     <byte_6B
                cpd     <byte_80
                bcs     loc_CF11
                bclr    <byte_49 2

loc_CF11:                               ; CODE XREF: sub_CEF4+11↑j
                                        ; sub_CEF4+18↑j
                brclr   <byte_49 2 loc_CF24
                clrb
                ldaa    <byte_6D
                std     <byte_BF
                ldaa    <byte_6B
                std     <byte_BB
                ldaa    <byte_6E
                std     <byte_C8
                bra     locret_CF6A
; ---------------------------------------------------------------------------

loc_CF24:                               ; CODE XREF: sub_CEF4:loc_CF11↑j
                ldx     #$C4
                ldaa    <byte_BF
                sei
                suba    <byte_6D
                bcc     loc_CF31
                ldx     #byte_8900

loc_CF31:                               ; CODE XREF: sub_CEF4+38↑j
                ldy     #$BF
                ldaa    <byte_6D
                jsr     sub_F1B2
                brclr   <byte_B4 $10 loc_CF3F
                cli

loc_CF3F:                               ; CODE XREF: sub_CEF4+46↑j
                ldx     #byte_88A7
                ldy     #$BB
                ldaa    <byte_6B
                jsr     sub_F1B2
                ldx     #$E7
                ldaa    <byte_C8
                sei
                suba    <byte_6E
                bcc     loc_CF58
                ldx     #byte_8904

loc_CF58:                               ; CODE XREF: sub_CEF4+5F↑j
                ldy     #$C8
                ldaa    <byte_6E
                jsr     sub_F1B2
                brset   <byte_B4 $10 loc_CF69
                brclr   <byte_52 2 locret_CF6A

loc_CF69:                               ; CODE XREF: sub_CEF4+6D↑j
                cli

locret_CF6A:                            ; CODE XREF: sub_CEF4+2E↑j
                                        ; sub_CEF4+71↑j
                rts
; End of function sub_CEF4


; =============== S U B R O U T I N E =======================================


sub_CF6B:                               ; CODE XREF: __RESET+77A↑P
                                        ; sub_D14D+230↓P
                ldx     #byte_88F7
                ldaa    <byte_BD
                sei
                cmpa    <byte_6D
                bcc     loc_CF78
                ldx     #$C2

loc_CF78:                               ; CODE XREF: sub_CF6B+8↑j
                ldy     #$BD
                ldaa    <byte_6D
                jsr     sub_F1B2
                ldx     #byte_88FE
                ldaa    <byte_C6
                cmpa    <byte_6E
                bcc     loc_CF8D
                ldx     #$C4

loc_CF8D:                               ; CODE XREF: sub_CF6B+1D↑j
                ldy     #$C6
                ldaa    <byte_6E
                jsr     sub_F1B2
                brset   <byte_B4 $10 loc_CF9E
                brclr   <byte_52 2 locret_CF9F

loc_CF9E:                               ; CODE XREF: sub_CF6B+2B↑j
                cli

locret_CF9F:                            ; CODE XREF: sub_CF6B+2F↑j
                rts
; End of function sub_CF6B


; =============== S U B R O U T I N E =======================================


sub_CFA0:                               ; CODE XREF: __RESET+768↑P
                                        ; sub_D14D+7B↓P
                brset   <byte_50 $40 loc_CFAD ; '@'
                brclr   <byte_F0 2 loc_CFB5
                ldaa    byte_123
                bne     loc_CFB5

loc_CFAD:                               ; CODE XREF: sub_CFA0↑j
                ldaa    byte_88B2
                ldx     #byte_8455
                bra     loc_CFBB
; ---------------------------------------------------------------------------

loc_CFB5:                               ; CODE XREF: sub_CFA0+4↑j
                                        ; sub_CFA0+B↑j
                ldaa    byte_88B3
                ldx     #byte_83B9

loc_CFBB:                               ; CODE XREF: sub_CFA0+13↑j
                staa    <byte_B8
                ldaa    byte_13E
                ldab    <byte_C1
                jsr     sub_F126
                staa    <byte_B9
                rts
; End of function sub_CFA0

; ---------------------------------------------------------------------------

loc_CFC8:                               ; CODE XREF: __RESET+777↑P
                                        ; IC1I+163↓P ...
                ldaa    <byte_DF
                ldx     #byte_8602
                ldab    <byte_C1
                jsr     sub_F126
                lsra
                psha
                brclr   <byte_54 4 loc_CFE5
                ldaa    <byte_DC
                beq     loc_CFE2
                ldab    byte_88B6
                mul
                staa    <byte_DC

loc_CFE2:                               ; CODE XREF: RESERVED:CFDA↑j
                bclr    <byte_54 4

loc_CFE5:                               ; CODE XREF: RESERVED:CFD4↑j
                pula
                ldab    <byte_DC
                aba
                bcs     loc_CFF0
                ldab    <byte_DD
                aba
                bcc     loc_CFF2

loc_CFF0:                               ; CODE XREF: RESERVED:CFE9↑j
                ldaa    #$FF

loc_CFF2:                               ; CODE XREF: RESERVED:CFEE↑j
                psha
                ldx     #byte_85EF
                ldaa    <byte_6B
                jsr     sub_F0B5
                pula
                psha
                mul
                lsld
; end of 'RESERVED'

; ===========================================================================

; Segment type: Pure data
                ; segment ROM_EPROM
                org $CFFF
                bcs     loc_D004
                lsld
                bcc     loc_D008

loc_D004:                               ; CODE XREF: ROM_EPROM:CFFF↑j
                ldaa    #$FF
                bra     loc_D00B
; ---------------------------------------------------------------------------

loc_D008:                               ; CODE XREF: ROM_EPROM:D002↑j
                aslb
                adca    #0

loc_D00B:                               ; CODE XREF: ROM_EPROM:D006↑j
                tab
                clra
                xgdx
                pulb
                abx
                xgdx
                tsta
                beq     loc_D016
                ldab    #$FF

loc_D016:                               ; CODE XREF: ROM_EPROM:D012↑j
                stab    <byte_B7
                rts

; =============== S U B R O U T I N E =======================================


sub_D019:                               ; CODE XREF: __RESET+780↑P
                                        ; sub_D14D+5F↓P
                ldab    <byte_6D
                subb    <byte_BD
                bcs     loc_D029
                ldaa    <byte_CB
                bne     loc_D02C
                ldaa    byte_175
                cba
                bcs     loc_D02C

loc_D029:                               ; CODE XREF: sub_D019+4↑j
                clrb
                bra     loc_D034
; ---------------------------------------------------------------------------

loc_D02C:                               ; CODE XREF: sub_D019+8↑j
                                        ; sub_D019+E↑j
                cmpb    <byte_E9
                bcs     loc_D032
                ldab    <byte_E9

loc_D032:                               ; CODE XREF: sub_D019+15↑j
                ldaa    <byte_CA

loc_D034:                               ; CODE XREF: sub_D019+11↑j
                mul
                brclr   <byte_4A $80 loc_D04C
                xgdy
                ldaa    byte_13F
                jsr     sub_F06D
                xgdy
                lsld
                bcs     loc_D049
                lsld
                bcc     loc_D04C

loc_D049:                               ; CODE XREF: sub_D019+2B↑j
                ldd     #$FFFF

loc_D04C:                               ; CODE XREF: sub_D019+1C↑j
                                        ; sub_D019+2E↑j
                std     <byte_CB
                ldaa    <byte_C6
                ldab    byte_88FD
                addb    <byte_3
                bcc     loc_D059
                ldab    #$FF

loc_D059:                               ; CODE XREF: sub_D019+3C↑j
                cba
                bcc     loc_D067
                ldaa    <byte_6E
                suba    <byte_C6
                bcs     loc_D067
                cmpa    byte_88FC
                bcc     loc_D068

loc_D067:                               ; CODE XREF: sub_D019+41↑j
                                        ; sub_D019+47↑j
                clra

loc_D068:                               ; CODE XREF: sub_D019+4C↑j
                cmpa    <byte_E8
                bcs     loc_D06E
                ldaa    <byte_E8

loc_D06E:                               ; CODE XREF: sub_D019+51↑j
                ldab    <byte_CD
                mul
                std     <byte_CE
                rts
; End of function sub_D019


; =============== S U B R O U T I N E =======================================


sub_D074:                               ; CODE XREF: __RESET+77D↑P
                                        ; IC1I+166↓P ...
                clra
                ldab    <byte_A6
                beq     loc_D080
                ldab    <byte_A7
                beq     loc_D080
                jmp     locret_D0D1
; ---------------------------------------------------------------------------

loc_D080:                               ; CODE XREF: sub_D074+3↑j
                                        ; sub_D074+7↑j
                ldab    <byte_6B
                cmpb    byte_8902
                bcs     loc_D09C
                ldab    <byte_BF
                subb    <byte_6D
                bcs     loc_D09C
                cmpb    byte_8900
                bcs     loc_D09C
                cmpb    byte_141
                bcs     loc_D09A
                ldab    byte_141

loc_D09A:                               ; CODE XREF: sub_D074+21↑j
                ldaa    <byte_D0

loc_D09C:                               ; CODE XREF: sub_D074+11↑j
                                        ; sub_D074+17↑j ...
                mul
                std     <byte_D1
                beq     loc_D0A8
                ldaa    byte_8ADE
                staa    <byte_AD
                staa    <byte_AE

loc_D0A8:                               ; CODE XREF: sub_D074+2B↑j
                ldab    <byte_6E
                ldaa    <byte_3
                adda    byte_8904
                bcc     loc_D0B3
                ldaa    #$FF

loc_D0B3:                               ; CODE XREF: sub_D074+3B↑j
                cba
                bcs     loc_D0C0
                ldaa    <byte_C8
                sba
                bcs     loc_D0C0
                cmpa    byte_8903
                bcc     loc_D0C4

loc_D0C0:                               ; CODE XREF: sub_D074+40↑j
                                        ; sub_D074+45↑j
                clra
                clrb
                bra     loc_D0CF
; ---------------------------------------------------------------------------

loc_D0C4:                               ; CODE XREF: sub_D074+4A↑j
                cmpa    byte_140
                bcs     loc_D0CC
                ldaa    byte_140

loc_D0CC:                               ; CODE XREF: sub_D074+53↑j
                ldab    <byte_D3
                mul

loc_D0CF:                               ; CODE XREF: sub_D074+4E↑j
                std     <byte_D4

locret_D0D1:                            ; CODE XREF: sub_D074+9↑J
                rts
; End of function sub_D074


; =============== S U B R O U T I N E =======================================


sub_D0D2:                               ; CODE XREF: __RESET:loc_989F↑P
                                        ; sub_D14D+82↓P
                brclr   <byte_51 $20 loc_D0E6 ; ' '
                ldab    <byte_E0
                beq     loc_D0E3
                clra
                ldab    <byte_EC
                lsld
                lsld
                lsld
                lsld
                bra     loc_D0EE
; ---------------------------------------------------------------------------

loc_D0E3:                               ; CODE XREF: sub_D0D2+6↑j
                bclr    <byte_51 $20 ; ' '

loc_D0E6:                               ; CODE XREF: sub_D0D2↑j
                ldaa    byte_85A5
                staa    <byte_E0
                ldd     #0

loc_D0EE:                               ; CODE XREF: sub_D0D2+F↑j
                std     <byte_ED
                rts
; End of function sub_D0D2


; =============== S U B R O U T I N E =======================================


sub_D0F1:                               ; CODE XREF: IC1I+169↓P
                                        ; IC1I:loc_FE2F↓P
                ldx     #UNe_6484
                ldaa    #1
                ldab    <byte_AB
                std     UNe_6484
                ldab    <byte_AC
                jsr     sub_F0EE
                std     UNe_6484
                ldaa    #1
                brclr   <byte_49 8 loc_D10D
                ldab    <byte_9C
                bra     loc_D10F
; ---------------------------------------------------------------------------

loc_D10D:                               ; CODE XREF: sub_D0F1+14↑j
                ldab    <byte_9D

loc_D10F:                               ; CODE XREF: sub_D0F1+1A↑j
                addb    #$80
                jsr     sub_F0EE
                std     UNe_6484
                ldaa    #1
                brclr   <byte_49 8 loc_D121
                ldab    <byte_9E
                bra     loc_D123
; ---------------------------------------------------------------------------

loc_D121:                               ; CODE XREF: sub_D0F1+28↑j
                ldab    <byte_9F

loc_D123:                               ; CODE XREF: sub_D0F1+2E↑j
                addb    #$80
                jsr     sub_F0EE
                std     UNe_6484
                xgdy
                ldaa    <byte_B7
                jsr     sub_F06D
                xgdy
                lsld
                lsld
                addd    UNe_6484
                std     UNe_6484
                ldaa    #1
                ldab    <byte_D6
                jsr     sub_F0EE
                brclr   <byte_49 8 loc_D14A
                std     <byte_8C
                rts
; ---------------------------------------------------------------------------

loc_D14A:                               ; CODE XREF: sub_D0F1+52↑j
                std     <byte_8E
                rts
; End of function sub_D0F1


; =============== S U B R O U T I N E =======================================


sub_D14D:                               ; CODE XREF: sub_D14D+3↓j
                                        ; IC1I+347↓P
                ldaa    ADCTL           ; A_D Control Register
                bpl     sub_D14D
                ldab    ADR4            ; A_D Result Register 4
                stab    <byte_75
                cmpb    byte_9058
                bcs     loc_D167
                cmpb    byte_9059
                bcc     loc_D167
                brset   <byte_F2 $40 loc_D167 ; '@'
                stab    <byte_6E

loc_D167:                               ; CODE XREF: sub_D14D+D↑j
                                        ; sub_D14D+12↑j ...
                ldaa    ADR1            ; A_D Result Register 1
                ldab    <byte_6B
                cmpb    #$2F ; '/'
                bcc     loc_D17E
                cmpb    #$D
                bcs     loc_D17E
                cmpa    byte_9065
                bcc     loc_D182
                cmpa    byte_9064
                bcs     loc_D182

loc_D17E:                               ; CODE XREF: sub_D14D+21↑j
                                        ; sub_D14D+25↑j
                brclr   <byte_F2 $88 loc_D185

loc_D182:                               ; CODE XREF: sub_D14D+2A↑j
                                        ; sub_D14D+2F↑j
                jsr     sub_B0E1

loc_D185:                               ; CODE XREF: sub_D14D:loc_D17E↑j
                jsr     sub_F2EC
                tab
                addb    byte_155
                rorb
                stab    <byte_6D

loc_D18F:                               ; CODE XREF: IC1I+5F7↓P
                brset   <byte_48 $40 loc_D196 ; '@'
                jmp     loc_D2E4
; ---------------------------------------------------------------------------

loc_D196:                               ; CODE XREF: sub_D14D:loc_D18F↑j
                brset   <byte_4F 8 loc_D1A4
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #8
                beq     loc_D1A4
                jsr     sub_FE58

loc_D1A4:                               ; CODE XREF: sub_D14D:loc_D196↑j
                                        ; sub_D14D+52↑j
                brset   <byte_B4 $10 loc_D1AF
                brset   <byte_52 2 loc_D1AF
                jsr     sub_D019

loc_D1AF:                               ; CODE XREF: sub_D14D:loc_D1A4↑j
                                        ; sub_D14D+5B↑j
                ldx     #byte_88B4
                ldaa    <byte_C1
                cmpa    <byte_6D
                bcc     loc_D1BB
                ldx     #byte_88B3

loc_D1BB:                               ; CODE XREF: sub_D14D+69↑j
                ldy     #$C1
                ldaa    <byte_6D
                jsr     sub_F1B2
                brset   <byte_B4 $10 loc_D1D2
                jsr     sub_CFA0
                brset   <byte_52 2 loc_D1D2
                jsr     sub_D0D2

loc_D1D2:                               ; CODE XREF: sub_D14D+77↑j
                                        ; sub_D14D+7E↑j
                brclr   <byte_4F 8 loc_D1E0
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #$40 ; '@'
                beq     loc_D1E0
                jsr     nullsub_1

loc_D1E0:                               ; CODE XREF: sub_D14D:loc_D1D2↑j
                                        ; sub_D14D+8E↑j
                clra
                ldab    <byte_6D
                lsld
                lsld
                tst     byte_88A9
                bmi     loc_D1EF
                addd    byte_88A9
                bra     loc_D1F7
; ---------------------------------------------------------------------------

loc_D1EF:                               ; CODE XREF: sub_D14D+9B↑j
                addd    byte_88A9
                bgt     loc_D1F7
                ldd     #0

loc_D1F7:                               ; CODE XREF: sub_D14D+A0↑j
                                        ; sub_D14D+A5↑j
                xgdy
                ldaa    <byte_B8
                jsr     sub_F06D
                xgdy
                lsld
                bcc     loc_D206
                ldd     #$FFFF

loc_D206:                               ; CODE XREF: sub_D14D+B4↑j
                std     UNe_6484
                brset   <byte_4F 8 loc_D217
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #8
                beq     loc_D217
                jsr     sub_FE58

loc_D217:                               ; CODE XREF: sub_D14D+BC↑j
                                        ; sub_D14D+C5↑j
                ldaa    #1
                ldab    <byte_B9
                ldx     #UNe_6484
                jsr     sub_F0EE
                brclr   <byte_49 8 loc_D22A
                ldx     #$8C
                bra     loc_D22D
; ---------------------------------------------------------------------------

loc_D22A:                               ; CODE XREF: sub_D14D+D4↑j
                ldx     #$8E

loc_D22D:                               ; CODE XREF: sub_D14D+DB↑j
                jsr     sub_F081
                std     UNe_6482
                brclr   <byte_4F 8 loc_D241
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #$40 ; '@'
                beq     loc_D241
                jsr     nullsub_1

loc_D241:                               ; CODE XREF: sub_D14D+E6↑j
                                        ; sub_D14D+EF↑j
                clra
                ldab    <byte_D8
                lsld
                lsld
                std     UNe_6484
                clra
                brclr   <byte_49 8 loc_D252
                ldab    <byte_1C
                bra     loc_D254
; ---------------------------------------------------------------------------

loc_D252:                               ; CODE XREF: sub_D14D+FD↑j
                ldab    <byte_33

loc_D254:                               ; CODE XREF: sub_D14D+103↑j
                bpl     loc_D257
                coma

loc_D257:                               ; CODE XREF: sub_D14D:loc_D254↑j
                lsld
                lsld
                addd    UNe_6484
                tst     byte_88AB
                bmi     loc_D26B
                addd    byte_88AB
                bvc     loc_D273
                ldd     #$7FFF
                bra     loc_D273
; ---------------------------------------------------------------------------

loc_D26B:                               ; CODE XREF: sub_D14D+112↑j
                addd    byte_88AB
                bvc     loc_D273
                ldd     #$8000

loc_D273:                               ; CODE XREF: sub_D14D+117↑j
                                        ; sub_D14D+11C↑j ...
                std     <byte_E2
                ldx     #byte_8656
                ldaa    <byte_8
                suba    <byte_6D
                jsr     sub_F0B5
                stab    <byte_E4
                ldd     UNe_6482
                addd    <byte_CE
                bcs     loc_D290
                addd    <byte_ED
                bcs     loc_D290
                addd    <byte_CB
                bcc     loc_D293

loc_D290:                               ; CODE XREF: sub_D14D+139↑j
                                        ; sub_D14D+13D↑j
                ldd     #$FFFF

loc_D293:                               ; CODE XREF: sub_D14D+141↑j
                subd    <byte_D4
                bcs     loc_D29B
                subd    <byte_D1
                bcc     loc_D29E

loc_D29B:                               ; CODE XREF: sub_D14D+148↑j
                ldd     #0

loc_D29E:                               ; CODE XREF: sub_D14D+14C↑j
                std     UNe_6482
                ldy     UNe_6482
                ldaa    <byte_E4
                jsr     sub_F06D
                sty     UNe_6484
                ldd     UNe_6482
                subd    UNe_6484
                std     UNe_6482
                tst     byte_E2
                bpl     loc_D2D3
                ldd     #0
                subd    <byte_E2
                cpd     UNe_6482
                bpl     loc_D2CE
                ldd     UNe_6482
                addd    <byte_E2
                bra     loc_D2DA
; ---------------------------------------------------------------------------

loc_D2CE:                               ; CODE XREF: sub_D14D+178↑j
                ldd     #0
                bra     loc_D2DA
; ---------------------------------------------------------------------------

loc_D2D3:                               ; CODE XREF: sub_D14D+16D↑j
                addd    <byte_E2
                bcc     loc_D2DA
                ldd     #$FFFF

loc_D2DA:                               ; CODE XREF: sub_D14D+17F↑j
                                        ; sub_D14D+184↑j ...
                brclr   <byte_49 8 loc_D2E2
                std     <byte_88
                bra     loc_D2F2
; ---------------------------------------------------------------------------

loc_D2E2:                               ; CODE XREF: sub_D14D:loc_D2DA↑j
                std     <byte_8A

loc_D2E4:                               ; CODE XREF: sub_D14D+46↑J
                brset   <byte_4F 8 loc_D2F2
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #8
                beq     loc_D2F2
                jsr     sub_FE58

loc_D2F2:                               ; CODE XREF: sub_D14D+193↑j
                                        ; sub_D14D:loc_D2E4↑j ...
                brset   <byte_48 $40 loc_D348 ; '@'
                ldx     #byte_88B4
                ldaa    <byte_C1
                cmpa    <byte_6D
                bcc     loc_D302
                ldx     #byte_88B3

loc_D302:                               ; CODE XREF: sub_D14D+1B0↑j
                ldy     #$C1
                ldaa    <byte_6D
                jsr     sub_F1B2
                brclr   <byte_4A $40 loc_D31B ; '@'
                brclr   <byte_59 4 loc_D31B
                clra
                clrb
                std     <byte_82
                std     <byte_84
                bra     loc_D35C
; ---------------------------------------------------------------------------

loc_D31B:                               ; CODE XREF: sub_D14D+1BE↑j
                                        ; sub_D14D+1C2↑j
                ldaa    <byte_72
                cmpa    byte_873D
                bcs     loc_D340
                ldaa    <byte_6F
                cmpa    byte_873E
                bcs     loc_D340
                ldaa    <byte_AA
                cmpa    #$FF
                beq     loc_D340
                inca
                staa    <byte_AA
                cmpa    byte_873F
                bhi     loc_D340
                ldd     #0
                std     <byte_82
                std     <byte_84
                bra     loc_D35C
; ---------------------------------------------------------------------------

loc_D340:                               ; CODE XREF: sub_D14D+1D3↑j
                                        ; sub_D14D+1DA↑j ...
                ldd     <byte_86
                std     <byte_82
                std     <byte_84
                bra     loc_D35C
; ---------------------------------------------------------------------------

loc_D348:                               ; CODE XREF: sub_D14D:loc_D2F2↑j
                ldd     <byte_86
                beq     loc_D359
                subd    byte_873B
                bcs     loc_D355
                std     <byte_86
                bra     loc_D359
; ---------------------------------------------------------------------------

loc_D355:                               ; CODE XREF: sub_D14D+202↑j
                clra
                clrb
                std     <byte_86

loc_D359:                               ; CODE XREF: sub_D14D+1FD↑j
                                        ; sub_D14D+206↑j
                jsr     sub_D381

loc_D35C:                               ; CODE XREF: sub_D14D+1CC↑j
                                        ; sub_D14D+1F1↑j ...
                brset   <byte_B4 $10 loc_D367
                brset   <byte_52 2 loc_D367
                jsr     sub_CEF4

loc_D367:                               ; CODE XREF: sub_D14D:loc_D35C↑j
                                        ; sub_D14D+213↑j
                brclr   <byte_4F 8 loc_D375
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #$40 ; '@'
                beq     loc_D375
                jsr     nullsub_1

loc_D375:                               ; CODE XREF: sub_D14D:loc_D367↑j
                                        ; sub_D14D+223↑j
                brset   <byte_B4 $10 locret_D380
                brset   <byte_52 2 locret_D380
                jsr     sub_CF6B

locret_D380:                            ; CODE XREF: sub_D14D:loc_D375↑j
                                        ; sub_D14D+22C↑j
                rts
; End of function sub_D14D


; =============== S U B R O U T I N E =======================================


sub_D381:                               ; CODE XREF: sub_D14D:loc_D359↑P
                ldx     #$FB
                brclr   0,x $20 loc_D38E ; ' '
                ldd     #0
                jmp     loc_D42E
; ---------------------------------------------------------------------------

loc_D38E:                               ; CODE XREF: sub_D381+3↑j
                brset   <byte_54 $80 loc_D395
                jmp     loc_D3F4
; ---------------------------------------------------------------------------

loc_D395:                               ; CODE XREF: sub_D381:loc_D38E↑j
                ldaa    byte_8C22
                ldab    <byte_80
                mul
                addd    <byte_80
                bcc     loc_D3A2
                ldd     #$FFFF

loc_D3A2:                               ; CODE XREF: sub_D381+1C↑j
                staa    <byte_BA
                cpd     <byte_6B
                bcs     loc_D3AB
                bra     loc_D3E9
; ---------------------------------------------------------------------------

loc_D3AB:                               ; CODE XREF: sub_D381+26↑j
                brclr   <byte_49 8 loc_D3B3
                ldx     <byte_88
                bra     loc_D3B5
; ---------------------------------------------------------------------------

loc_D3B3:                               ; CODE XREF: sub_D381:loc_D3AB↑j
                ldx     <byte_8A

loc_D3B5:                               ; CODE XREF: sub_D381+30↑j
                ldaa    byte_8C21
                bne     loc_D3C1
                cpx     byte_8C1F
                bhi     loc_D3E9
                bra     loc_D3F4
; ---------------------------------------------------------------------------

loc_D3C1:                               ; CODE XREF: sub_D381+37↑j
                cmpa    #1
                bne     loc_D3D0
                brclr   <byte_4A $80 loc_D3F4
                cpx     byte_8C1F
                bhi     loc_D3E9
                bra     loc_D3F4
; ---------------------------------------------------------------------------

loc_D3D0:                               ; CODE XREF: sub_D381+42↑j
                cmpa    #2
                bne     loc_D3DF
                brset   <byte_4A $80 loc_D3E9
                cpx     byte_8C1F
                bhi     loc_D3E9
                bra     loc_D3F4
; ---------------------------------------------------------------------------

loc_D3DF:                               ; CODE XREF: sub_D381+51↑j
                cmpa    #3
                bne     loc_D3E9
                brset   <byte_4A $80 loc_D3E9
                bra     loc_D3F4
; ---------------------------------------------------------------------------

loc_D3E9:                               ; CODE XREF: sub_D381+28↑j
                                        ; sub_D381+3C↑j ...
                bclr    <byte_54 $80
                bset    <byte_54 8
                ldaa    byte_8C1E
                staa    <byte_DA

loc_D3F4:                               ; CODE XREF: sub_D381+11↑J
                                        ; sub_D381+3E↑j ...
                ldy     byte_88AD
                brclr   <byte_54 $80 loc_D400
                clra
                clrb
                bra     loc_D419
; ---------------------------------------------------------------------------

loc_D400:                               ; CODE XREF: sub_D381+77↑j
                brclr   <byte_49 8 loc_D408
                ldd     <byte_88
                bra     loc_D40A
; ---------------------------------------------------------------------------

loc_D408:                               ; CODE XREF: sub_D381:loc_D400↑j
                ldd     <byte_8A

loc_D40A:                               ; CODE XREF: sub_D381+85↑j
                cpd     <byte_86
                bcc     loc_D411
                ldd     <byte_86

loc_D411:                               ; CODE XREF: sub_D381+8C↑j
                cpd     byte_88AD
                bcc     loc_D419
                xgdy

loc_D419:                               ; CODE XREF: sub_D381+7D↑j
                                        ; sub_D381+94↑j
                ldx     #$178
                brclr   0,x 4 loc_D42E
                ldaa    byte_17A
                clrb
                brset   0,x 8 loc_D42B
                ldab    byte_17B

loc_D42B:                               ; CODE XREF: sub_D381+A3↑j
                lsrd
                lsrd
                lsrd

loc_D42E:                               ; CODE XREF: sub_D381+A↑J
                                        ; sub_D381+9B↑j
                brclr   <byte_49 8 loc_D43C
                std     <byte_82
                brset   <byte_5D 4 loc_D444
                std     <byte_84
                bra     loc_D444
; ---------------------------------------------------------------------------

loc_D43C:                               ; CODE XREF: sub_D381:loc_D42E↑j
                std     <byte_84
                brset   <byte_5D 4 loc_D444
                std     <byte_82

loc_D444:                               ; CODE XREF: sub_D381+B3↑j
                                        ; sub_D381+B9↑j ...
                brclr   <byte_5D 8 loc_D452
                brset   <byte_5D 4 locret_D456
                ldd     <byte_82
                std     <byte_84
                bra     locret_D456
; ---------------------------------------------------------------------------

loc_D452:                               ; CODE XREF: sub_D381:loc_D444↑j
                ldd     <byte_84
                std     <byte_82

locret_D456:                            ; CODE XREF: sub_D381+C7↑j
                                        ; sub_D381+CF↑j
                rts
; End of function sub_D381


; =============== S U B R O U T I N E =======================================


sub_D457:                               ; CODE XREF: __RESET+7AE↑P
                ldab    byte_8E02
                ldaa    <byte_F0
                bita    #1
                beq     loc_D466
                subb    #3
                bcc     loc_D466
                ldab    #0

loc_D466:                               ; CODE XREF: sub_D457+7↑j
                                        ; sub_D457+B↑j
                cmpb    <byte_77
                bcc     loc_D480
                ldab    byte_15E
                cmpb    byte_8E03
                bcc     loc_D483
                ldaa    <byte_65
                bita    #7
                bne     loc_D47E
                incb
                beq     loc_D47E
                stab    byte_15E

loc_D47E:                               ; CODE XREF: sub_D457+1F↑j
                                        ; sub_D457+22↑j
                bra     loc_D4E8
; ---------------------------------------------------------------------------

loc_D480:                               ; CODE XREF: sub_D457+11↑j
                clr     byte_15E

loc_D483:                               ; CODE XREF: sub_D457+19↑j
                brclr   <byte_48 $40 loc_D4E8 ; '@'
                ldab    <byte_64
                cmpb    byte_8E09
                bcs     loc_D4E8
                brclr   <byte_55 4 loc_D4A8
                ldaa    <byte_6B
                cmpa    #$20 ; ' '
                bcc     loc_D4E8
                brset   <byte_7B $80 loc_D4E8
                ldaa    byte_8018
                lsra
                bcc     loc_D4EF
                brclr   <byte_7B $40 loc_D4E8 ; '@'
                bra     loc_D4EF
; ---------------------------------------------------------------------------

loc_D4A8:                               ; CODE XREF: sub_D457+37↑j
                brset   <byte_4D 8 loc_D4E8
                ldab    byte_8E04
                brclr   <byte_5D $40 loc_D4B5 ; '@'
                subb    #3

loc_D4B5:                               ; CODE XREF: sub_D457+58↑j
                ldaa    <byte_72
                cba
                bcs     loc_D4BF
                bset    <byte_5D $40 ; '@'
                bra     loc_D4E8
; ---------------------------------------------------------------------------

loc_D4BF:                               ; CODE XREF: sub_D457+61↑j
                bclr    <byte_5D $40 ; '@'
                ldx     <byte_6B
                cpx     byte_8E05
                bcc     loc_D4E8
                cpx     byte_8E07
                bcc     loc_D4F6
                cpx     byte_8DFF
                bcc     loc_D4D9
                ldab    byte_8E01
                stab    byte_15F

loc_D4D9:                               ; CODE XREF: sub_D457+7A↑j
                ldab    byte_15F
                beq     loc_D4EF
                ldaa    <byte_65
                bita    #7
                bne     loc_D4E8
                decb
                stab    byte_15F

loc_D4E8:                               ; CODE XREF: sub_D457:loc_D47E↑j
                                        ; sub_D457:loc_D483↑j ...
                sei
                ldaa    <byte_F0
                oraa    #1
                bra     loc_D4F4
; ---------------------------------------------------------------------------

loc_D4EF:                               ; CODE XREF: sub_D457+49↑j
                                        ; sub_D457+4F↑j ...
                sei
                ldaa    <byte_F0
                anda    #$FE

loc_D4F4:                               ; CODE XREF: sub_D457+96↑j
                staa    <byte_F0

loc_D4F6:                               ; CODE XREF: sub_D457+75↑j
                cli
                rts
; End of function sub_D457


; =============== S U B R O U T I N E =======================================


sub_D4F8:                               ; CODE XREF: __RESET:loc_98D9↑P
                brset   <byte_F0 1 loc_D515
                brclr   <byte_48 $40 loc_D515 ; '@'
                brclr   <byte_55 4 loc_D515
                ldaa    byte_160
                inca
                beq     loc_D512
                staa    byte_160
                cmpa    byte_8E0A
                bcs     loc_D515

loc_D512:                               ; CODE XREF: sub_D4F8+10↑j
                bset    <byte_55 2

loc_D515:                               ; CODE XREF: sub_D4F8↑j
                                        ; sub_D4F8+4↑j ...
                ldab    <byte_7C
                ldaa    <byte_4D
                lsra
                eora    <byte_4D
                bita    #$20 ; ' '
                beq     loc_D54E
                brclr   <byte_4D $20 loc_D539 ; ' '
                cmpb    #$30 ; '0'
                bcs     loc_D52E
                bclr    <byte_7C 7
                bset    <byte_4D $40 ; '@'

loc_D52E:                               ; CODE XREF: sub_D4F8+2E↑j
                                        ; sub_D4F8+4E↓j ...
                ldaa    <byte_65
                bita    #$1F
                bne     locret_D563
                addb    #8
                bcc     loc_D561
                rts
; ---------------------------------------------------------------------------

loc_D539:                               ; CODE XREF: sub_D4F8+28↑j
                brclr   <byte_7C 7 loc_D544
                tba
                anda    #7
                cmpa    #5
                bls     loc_D54B

loc_D544:                               ; CODE XREF: sub_D4F8:loc_D539↑j
                cmpb    #$B8
                bcs     loc_D52E
                bclr    <byte_4D $40 ; '@'

loc_D54B:                               ; CODE XREF: sub_D4F8+4A↑j
                clrb
                bra     loc_D561
; ---------------------------------------------------------------------------

loc_D54E:                               ; CODE XREF: sub_D4F8+26↑j
                brset   <byte_7C 7 loc_D555
                incb
                stab    <byte_7C

loc_D555:                               ; CODE XREF: sub_D4F8:loc_D54E↑j
                                        ; DATA XREF: RESERVED:AC9E↑w ...
                brset   <byte_4D $40 loc_D52E ; '@'
                cmpb    #$60 ; '`'
                bcs     loc_D52E
                andb    #7
                orab    #$60 ; '`'

loc_D561:                               ; CODE XREF: sub_D4F8+3E↑j
                                        ; sub_D4F8+54↑j
                stab    <byte_7C

locret_D563:                            ; CODE XREF: sub_D4F8+3A↑j
                rts
; End of function sub_D4F8


; =============== S U B R O U T I N E =======================================


sub_D564:                               ; CODE XREF: __RESET+7B7↑P
                brset   <byte_55 8 loc_D597
                brclr   <byte_55 4 loc_D597
                brclr   <byte_48 $40 loc_D597 ; '@'
                sei
                ldaa    <byte_4E
                bita    #$60 ; '`'
                bne     loc_D595
                bset    <byte_55 8
                ldx     #$B613
                ldaa    0,x
                inca
                beq     loc_D595
                cmpa    byte_8E0B
                bcs     loc_D58A
                bset    <byte_55 2

loc_D58A:                               ; CODE XREF: sub_D564+21↑j
                staa    byte_162
                ldaa    #$13
                staa    byte_161
                bset    <byte_4E $40 ; '@'

loc_D595:                               ; CODE XREF: sub_D564+11↑j
                                        ; sub_D564+1C↑j
                cli
                nop

loc_D597:                               ; CODE XREF: sub_D564↑j
                                        ; sub_D564+4↑j ...
                sei
                brset   <byte_4E $40 loc_D61A ; '@'
                ldx     #$B616
                brclr   <byte_55 $10 loc_D5DB
                brset   <byte_55 1 loc_D5DB
                ldaa    #$16
                ldab    #$4A ; 'J'
                brclr   <byte_4E $20 loc_D5D2 ; ' '
                cmpa    byte_161
                beq     loc_D5CB
                inca
                cmpa    byte_161
                bne     loc_D5DB
                bset    <byte_4E $40 ; '@'
                bclr    <byte_4E $20 ; ' '
                bset    <byte_55 1
                ldaa    #$13
                clrb
                stab    byte_160
                bra     loc_D5D5
; ---------------------------------------------------------------------------

loc_D5CB:                               ; CODE XREF: sub_D564+4E↑j
                bset    <byte_4E $40 ; '@'
                inca
                comb
                bra     loc_D5D5
; ---------------------------------------------------------------------------

loc_D5D2:                               ; CODE XREF: sub_D564+47↑j
                bset    <byte_4E $60 ; '`'

loc_D5D5:                               ; CODE XREF: sub_D564+65↑j
                                        ; sub_D564+6C↑j
                staa    byte_161
                stab    byte_162

loc_D5DB:                               ; CODE XREF: sub_D564+3B↑j
                                        ; sub_D564+3F↑j ...
                ldaa    1,x
                coma
                cmpa    0,x
                bne     loc_D5EB
                cmpa    #$4A ; 'J'
                bne     loc_D5EB
                bset    <byte_55 4
                bra     loc_D5EE
; ---------------------------------------------------------------------------

loc_D5EB:                               ; CODE XREF: sub_D564+7C↑j
                                        ; sub_D564+80↑j
                bclr    <byte_55 4

loc_D5EE:                               ; CODE XREF: sub_D564+85↑j
                cli
                brclr   <byte_55 2 locret_D61B
                sei
                brset   <byte_4E $40 loc_D61A ; '@'
                ldaa    #$16
                ldab    #$EE
                brclr   <byte_4E $20 loc_D611 ; ' '
                cmpa    byte_161
                bne     loc_D61A
                inca
                bset    <byte_4E $40 ; '@'
                bclr    <byte_4E $20 ; ' '
                bclr    <byte_55 2
                bra     loc_D614
; ---------------------------------------------------------------------------

loc_D611:                               ; CODE XREF: sub_D564+98↑j
                bset    <byte_4E $60 ; '`'

loc_D614:                               ; CODE XREF: sub_D564+AB↑j
                staa    byte_161
                stab    byte_162

loc_D61A:                               ; CODE XREF: sub_D564+34↑j
                                        ; sub_D564+90↑j ...
                cli

locret_D61B:                            ; CODE XREF: sub_D564+8B↑j
                rts
; End of function sub_D564


; =============== S U B R O U T I N E =======================================


sub_D61C:                               ; CODE XREF: __RESET+71C↑P
                ldaa    <byte_72
                ldx     #byte_8B15
                brset   <byte_F0 $20 loc_D626 ; ' '
                inx

loc_D626:                               ; CODE XREF: sub_D61C+5↑j
                cmpa    0,x
                bcs     loc_D685
                ldab    #8
                ldaa    <byte_22
                ldx     #byte_8B13
                cmpa    byte_8B04
                beq     loc_D649
                inx
                lsrb
                cmpa    byte_8B05
                beq     loc_D649
                lsrb
                cmpa    byte_8B06
                beq     loc_D649
                lsrb
                cmpa    byte_8B07
                bne     loc_D69D

loc_D649:                               ; CODE XREF: sub_D61C+18↑j
                                        ; sub_D61C+1F↑j ...
                brclr   <byte_51 $40 loc_D6A0 ; '@'
                ldaa    <byte_D1
                bne     loc_D6A0
                brset   <byte_54 $80 loc_D6A0
                brset   <byte_B4 $20 loc_D69D ; ' '
                bitb    <byte_B3
                bne     loc_D69D
                aslb
                aslb
                aslb
                aslb
                bitb    <byte_B3
                beq     loc_D69D
                ldaa    <byte_B2
                cmpa    0,x
                bcc     loc_D68A
                bitb    <byte_21
                bne     loc_D69D
                bitb    <byte_38
                bne     loc_D69D
                tsta
                beq     loc_D67C
                brclr   <byte_65 $3F loc_D67C ; '?'
                bra     loc_D681
; ---------------------------------------------------------------------------

loc_D67C:                               ; CODE XREF: sub_D61C+58↑j
                                        ; sub_D61C+5A↑j
                inca
                beq     loc_D681
                staa    <byte_B2

loc_D681:                               ; CODE XREF: sub_D61C+5E↑j
                                        ; sub_D61C+61↑j
                cmpa    #3
                bcs     loc_D6A0

loc_D685:                               ; CODE XREF: sub_D61C+C↑j
                bclr    <byte_F0 $20 ; ' '
                bra     locret_D6A3
; ---------------------------------------------------------------------------

loc_D68A:                               ; CODE XREF: sub_D61C+4D↑j
                lsrb
                lsrb
                lsrb
                lsrb
                pshb
                tba
                orab    <byte_B3
                stab    <byte_B3
                oraa    <byte_21
                staa    <byte_21
                pula
                oraa    <byte_38
                staa    <byte_38

loc_D69D:                               ; CODE XREF: sub_D61C+2B↑j
                                        ; sub_D61C+39↑j ...
                clr     byte_B2

loc_D6A0:                               ; CODE XREF: sub_D61C:loc_D649↑j
                                        ; sub_D61C+33↑j ...
                bset    <byte_F0 $20 ; ' '

locret_D6A3:                            ; CODE XREF: sub_D61C+6C↑j
                rts
; End of function sub_D61C


; =============== S U B R O U T I N E =======================================


sub_D6A4:                               ; CODE XREF: __RESET+74F↑P
                brclr   <byte_48 $40 loc_D6B3 ; '@'
                ldaa    byte_110
                inca
                beq     loc_D6B6
                staa    byte_110
                bra     loc_D6B6
; ---------------------------------------------------------------------------

loc_D6B3:                               ; CODE XREF: sub_D6A4↑j
                clr     byte_110

loc_D6B6:                               ; CODE XREF: sub_D6A4+8↑j
                                        ; sub_D6A4+D↑j
                brset   <byte_4D $80 loc_D6C2
                brclr   <byte_50 8 loc_D6C5
                ldaa    #$30 ; '0'
                bra     loc_D73E
; ---------------------------------------------------------------------------

loc_D6C2:                               ; CODE XREF: sub_D6A4:loc_D6B6↑j
                jmp     loc_D743
; ---------------------------------------------------------------------------

loc_D6C5:                               ; CODE XREF: sub_D6A4+16↑j
                ldx     #byte_8CE0
                brset   <byte_4D $10 loc_D71B
                ldaa    <byte_F7
                cmpa    #$19
                beq     loc_D6E4
                brclr   <byte_50 1 loc_D6F4
                ldd     <byte_80
                subd    #1
                bitb    #$3F ; '?'
                bne     loc_D741
                bclr    <byte_50 1
                bra     loc_D741
; ---------------------------------------------------------------------------

loc_D6E4:                               ; CODE XREF: sub_D6A4+2C↑j
                brset   <byte_FA $20 loc_D743 ; ' '
                clr     byte_F7
                ldaa    <byte_F8
                ldab    #$FF
                bset    <byte_50 1
                bra     loc_D73F
; ---------------------------------------------------------------------------

loc_D6F4:                               ; CODE XREF: sub_D6A4+2E↑j
                brclr   <byte_55 4 loc_D706
                brclr   <byte_48 $40 loc_D706 ; '@'
                ldaa    <byte_64
                cmpa    #8
                bcs     loc_D706
                ldaa    #$70 ; 'p'
                bra     loc_D73E
; ---------------------------------------------------------------------------

loc_D706:                               ; CODE XREF: sub_D6A4:loc_D6F4↑j
                                        ; sub_D6A4+54↑j ...
                ldaa    byte_8CFF
                brset   <byte_52 1 loc_D73E
                brset   <byte_F2 2 loc_D73E
                ldaa    byte_90A6
                brset   <byte_49 1 loc_D73E
                ldx     #byte_8CCD

loc_D71B:                               ; CODE XREF: sub_D6A4+24↑j
                ldaa    <byte_72
                jsr     sub_F0B5
                brset   <byte_64 $FF loc_D733
                psha
                ldaa    <byte_64
                ldx     #byte_8CF3
                jsr     sub_F0B5
                pulb
                aba
                bcc     loc_D733
                ldaa    #$FF

loc_D733:                               ; CODE XREF: sub_D6A4+7C↑j
                                        ; sub_D6A4+8B↑j
                brclr   <byte_7B $40 loc_D73E ; '@'
                ldab    byte_8CFE
                cba
                bcc     loc_D73E
                tba

loc_D73E:                               ; CODE XREF: sub_D6A4+1C↑j
                                        ; sub_D6A4+60↑j ...
                clrb

loc_D73F:                               ; CODE XREF: sub_D6A4+4E↑j
                lsrd
                lsrd

loc_D741:                               ; CODE XREF: sub_D6A4+39↑j
                                        ; sub_D6A4+3E↑j
                std     <byte_80

loc_D743:                               ; CODE XREF: sub_D6A4:loc_D6C2↑J
                                        ; sub_D6A4:loc_D6E4↑j
                ldaa    byte_128
                cmpa    #7
                beq     locret_D790
                cmpa    #$14
                beq     locret_D790
                brset   <byte_4 $20 loc_D756 ; ' '
                brset   <byte_48 $40 loc_D77F ; '@'

loc_D756:                               ; CODE XREF: sub_D6A4+AA↑j
                ldaa    byte_111
                cmpa    <byte_5
                bne     loc_D764
                brset   <byte_4 $40 loc_D764 ; '@'
                bclr    <byte_4 $20 ; ' '

loc_D764:                               ; CODE XREF: sub_D6A4+B7↑j
                                        ; sub_D6A4+B9↑j
                ldaa    <byte_72
                ldx     #byte_8C58
                jsr     sub_F0B5
                psha
                ldaa    <byte_8
                ldx     #byte_8C6B
                jsr     sub_F0B5
                pulb
                aba
                bcc     loc_D77C
                jmp     loc_D8EE
; ---------------------------------------------------------------------------

loc_D77C:                               ; CODE XREF: sub_D6A4+D3↑j
                jmp     loc_D8E0
; ---------------------------------------------------------------------------

loc_D77F:                               ; CODE XREF: sub_D6A4+AE↑j
                brclr   <byte_F2 $88 loc_D795
                ldaa    byte_9081
                staa    byte_111
                brclr   <byte_4D $40 loc_D791 ; '@'
                bset    <byte_4D $C

locret_D790:                            ; CODE XREF: sub_D6A4+A4↑j
                                        ; sub_D6A4+A8↑j ...
                rts
; ---------------------------------------------------------------------------

loc_D791:                               ; CODE XREF: sub_D6A4+E5↑j
                bclr    <byte_4D $C
                rts
; ---------------------------------------------------------------------------

loc_D795:                               ; CODE XREF: sub_D6A4:loc_D77F↑j
                jsr     sub_D92D
                dex
                bne     loc_D79C
                rts
; ---------------------------------------------------------------------------

loc_D79C:                               ; CODE XREF: sub_D6A4+F5↑j
                brclr   <byte_4A $80 loc_D7A9
                brset   <byte_4F 1 loc_D7AD
                bclr    <byte_4D $80
                bra     loc_D7AD
; ---------------------------------------------------------------------------

loc_D7A9:                               ; CODE XREF: sub_D6A4:loc_D79C↑j
                brclr   <byte_4A $20 loc_D7B0 ; ' '

loc_D7AD:                               ; CODE XREF: sub_D6A4+FC↑j
                                        ; sub_D6A4+103↑j
                jmp     loc_D839
; ---------------------------------------------------------------------------

loc_D7B0:                               ; CODE XREF: sub_D6A4:loc_D7A9↑j
                brset   <byte_4A 4 locret_D790
                ldab    byte_112
                bne     locret_D790
                ldaa    byte_111
                cmpa    #4
                bcs     loc_D7C3
                bclr    <byte_4 $10

loc_D7C3:                               ; CODE XREF: sub_D6A4+11A↑j
                brclr   <byte_4D $80 loc_D7FE
                ldx     #byte_8D6D
                brclr   <byte_7B $10 loc_D7D7
                ldx     #byte_8D78
                ldd     <byte_80
                subd    <byte_6B
                bra     loc_D7DB
; ---------------------------------------------------------------------------

loc_D7D7:                               ; CODE XREF: sub_D6A4+126↑j
                ldd     <byte_6B
                subd    <byte_80

loc_D7DB:                               ; CODE XREF: sub_D6A4+131↑j
                bcs     loc_D7FE
                lsrd
                lsrd
                lsrd
                tsta
                bne     loc_D7E8
                subb    byte_8D6C
                bcs     loc_D7FE

loc_D7E8:                               ; CODE XREF: sub_D6A4+13D↑j
                ldaa    <byte_72
                jsr     sub_F0B5
                jsr     sub_D910
                brclr   <byte_7B $10 loc_D7F7
                bset    <byte_51 $20 ; ' '

loc_D7F7:                               ; CODE XREF: sub_D6A4+14C↑j
                clra
                staa    byte_110
                bclr    <byte_4D $80

loc_D7FE:                               ; CODE XREF: sub_D6A4:loc_D7C3↑j
                                        ; sub_D6A4:loc_D7DB↑j ...
                ldab    byte_8D53
                cmpb    byte_110
                bcc     locret_D838
                ldx     #byte_8D00
                ldd     <byte_80
                subd    <byte_6B
                bcc     loc_D817
                ldx     #byte_8D13
                coma
                comb
                addd    #1

loc_D817:                               ; CODE XREF: sub_D6A4+169↑j
                lsrd
                lsrd
                brset   <byte_4F 1 loc_D821
                brset   <byte_4D $10 loc_D822

loc_D821:                               ; CODE XREF: sub_D6A4+175↑j
                lsrd

loc_D822:                               ; CODE XREF: sub_D6A4+179↑j
                tsta
                beq     loc_D827
                ldab    #$FF

loc_D827:                               ; CODE XREF: sub_D6A4+17F↑j
                tba
                cmpa    1,x
                bcs     locret_D838
                jsr     sub_F0B5
                beq     locret_D838
                jsr     sub_D910
                clra
                staa    byte_110

locret_D838:                            ; CODE XREF: sub_D6A4+160↑j
                                        ; sub_D6A4+186↑j ...
                rts
; ---------------------------------------------------------------------------

loc_D839:                               ; CODE XREF: sub_D6A4:loc_D7AD↑J
                ldaa    <byte_72
                ldx     #byte_8C8A
                jsr     sub_F0B5
                staa    Temp5_t3
                ldaa    <byte_64
                ldx     #byte_8C99
                jsr     sub_F0B5
                adda    Temp5_t3
                bcc     loc_D854

loc_D851:                               ; CODE XREF: sub_D6A4+1C0↓j
                                        ; sub_D6A4+1C3↓j
                jmp     loc_D8EE
; ---------------------------------------------------------------------------

loc_D854:                               ; CODE XREF: sub_D6A4+1AB↑j
                staa    Temp5_t3
                ldaa    <byte_8
                ldx     #byte_8CC2
                jsr     sub_F0B5
                ldaa    Temp5_t3
                mul
                lsld
                bcs     loc_D851
                lsld
                bcs     loc_D851
                staa    Temp5_t3
                ldx     #byte_8CB3
                ldaa    <byte_6B
                jsr     sub_F0B5
                cmpa    Temp5_t3
                bcs     loc_D87C
                staa    Temp5_t3

loc_D87C:                               ; CODE XREF: sub_D6A4+1D3↑j
                ldaa    <byte_77
                ldx     #byte_8CA4
                jsr     sub_F0B5
                cmpa    Temp5_t3
                bcc     loc_D88C
                ldaa    Temp5_t3

loc_D88C:                               ; CODE XREF: sub_D6A4+1E3↑j
                brset   <byte_4D 4 loc_D8B6
                ldab    byte_8C76
                brset   <byte_4A $20 loc_D8B3 ; ' '
                psha
                ldaa    <byte_72
                cmpa    byte_8C77
                bcs     loc_D8B2
                ldx     #byte_8C7A
                ldaa    <byte_7A
                jsr     sub_F0B5
                brclr   <byte_4D 8 loc_D8B2
                ldaa    byte_8C78
                mul
                adca    #0
                tab

loc_D8B2:                               ; CODE XREF: sub_D6A4+1F9↑j
                                        ; sub_D6A4+203↑j
                pula

loc_D8B3:                               ; CODE XREF: sub_D6A4+1EF↑j
                aba
                bcs     loc_D8EE

loc_D8B6:                               ; CODE XREF: sub_D6A4:loc_D88C↑j
                brclr   <byte_7B $40 loc_D8BF ; '@'
                adda    byte_8D6B
                bcs     loc_D8EE

loc_D8BF:                               ; CODE XREF: sub_D6A4:loc_D8B6↑j
                brset   <byte_4 $10 loc_D8C8
                adda    byte_8D6A
                bcs     loc_D8EE

loc_D8C8:                               ; CODE XREF: sub_D6A4:loc_D8BF↑j
                brset   <byte_4D $10 loc_D8E9
                tst     byte_8C89
                bpl     loc_D8D9
                adda    byte_8C89
                bcs     loc_D8E9
                clra
                bra     loc_D8E9
; ---------------------------------------------------------------------------

loc_D8D9:                               ; CODE XREF: sub_D6A4+22B↑j
                adda    byte_8C89
                bcs     loc_D8EE
                bra     loc_D8E9
; ---------------------------------------------------------------------------

loc_D8E0:                               ; CODE XREF: sub_D6A4:loc_D77C↑J
                brset   <byte_4 $10 loc_D8E9
                adda    byte_8D6A
                bcs     loc_D8EE

loc_D8E9:                               ; CODE XREF: sub_D6A4:loc_D8C8↑j
                                        ; sub_D6A4+230↑j ...
                cmpa    byte_8D54
                bcs     loc_D8F1

loc_D8EE:                               ; CODE XREF: sub_D6A4+D5↑J
                                        ; sub_D6A4:loc_D851↑J ...
                ldaa    byte_8D54

loc_D8F1:                               ; CODE XREF: sub_D6A4+248↑j
                brset   <byte_4A $20 loc_D909 ; ' '
                cmpa    byte_111
                bcc     loc_D905
                ldab    <byte_65
                bitb    byte_8D56
                bne     locret_D908
                ldaa    byte_111
                deca

loc_D905:                               ; CODE XREF: sub_D6A4+254↑j
                staa    byte_111

locret_D908:                            ; CODE XREF: sub_D6A4+25B↑j
                rts
; ---------------------------------------------------------------------------

loc_D909:                               ; CODE XREF: sub_D6A4:loc_D8F1↑j
                bclr    <byte_4A $20 ; ' '
                staa    byte_111
                rts
; End of function sub_D6A4


; =============== S U B R O U T I N E =======================================


sub_D910:                               ; CODE XREF: sub_D6A4+149↑P
                                        ; sub_D6A4+18D↑P ...
                tsta
                bmi     loc_D923
                adda    byte_111
                ldab    byte_8D54
                bcs     loc_D91E
                cba
                bcs     loc_D91F

loc_D91E:                               ; CODE XREF: sub_D910+9↑j
                tba

loc_D91F:                               ; CODE XREF: sub_D910+C↑j
                staa    byte_111
                rts
; ---------------------------------------------------------------------------

loc_D923:                               ; CODE XREF: sub_D910+1↑j
                adda    byte_111
                bcs     loc_D929
                clra

loc_D929:                               ; CODE XREF: sub_D910+16↑j
                staa    byte_111
                rts
; End of function sub_D910


; =============== S U B R O U T I N E =======================================


sub_D92D:                               ; CODE XREF: sub_D6A4:loc_D795↑P
                ldab    <byte_4D
                andb    #4
                stab    STe_648A
                ldab    <byte_4D
                andb    #$40 ; '@'
                lsrb
                lsrb
                lsrb
                lsrb
                eorb    STe_648A
                bne     loc_D970
                ldaa    byte_114
                bne     loc_D993
                brclr   <byte_4E 2 loc_D9A5
                bclr    <byte_4E 2
                clr     byte_110
                brset   <byte_4D 4 loc_D962
                brset   <byte_4A $80 loc_D95E
                ldaa    byte_8D27
                bsr     sub_D910
                pulx

loc_D95E:                               ; CODE XREF: sub_D92D+27↑j
                                        ; sub_D92D+72↓j ...
                bclr    <byte_4D 8
                rts
; ---------------------------------------------------------------------------

loc_D962:                               ; CODE XREF: sub_D92D+23↑j
                brset   <byte_4A $80 loc_D96C
                ldaa    byte_8D2A
                bsr     sub_D910
                pulx

loc_D96C:                               ; CODE XREF: sub_D92D:loc_D962↑j
                                        ; sub_D92D+48↓j ...
                bset    <byte_4D 8
                rts
; ---------------------------------------------------------------------------

loc_D970:                               ; CODE XREF: sub_D92D+12↑j
                ldaa    <byte_64
                cmpa    byte_8E09
                bcs     loc_D96C
                bset    <byte_4E 2
                eorb    <byte_4D
                stab    <byte_4D
                bitb    #4
                bne     loc_D9AB
                ldaa    byte_8D28
                staa    byte_114
                brset   <byte_4A $80 loc_D993
                ldaa    byte_8D26
                jsr     sub_D910
                pulx

loc_D993:                               ; CODE XREF: sub_D92D+17↑j
                                        ; sub_D92D+5B↑j ...
                ldaa    byte_114
                beq     loc_D99C
                deca
                staa    byte_114

loc_D99C:                               ; CODE XREF: sub_D92D+69↑j
                clr     byte_110
                brset   <byte_4D 4 loc_D95E
                bra     loc_D96C
; ---------------------------------------------------------------------------

loc_D9A5:                               ; CODE XREF: sub_D92D+19↑j
                brset   <byte_4D 4 loc_D96C
                bra     loc_D95E
; ---------------------------------------------------------------------------

loc_D9AB:                               ; CODE XREF: sub_D92D+53↑j
                ldaa    byte_8D2B
                staa    byte_114
                brset   <byte_4A $80 loc_D9BE
                ldaa    byte_8D29
                jsr     sub_D910
                pulx
                bra     loc_D993
; ---------------------------------------------------------------------------

loc_D9BE:                               ; CODE XREF: sub_D92D+84↑j
                ldx     #byte_8C7A
                ldaa    <byte_7A
                jsr     sub_F0B5
                ldab    byte_8C79
                mul
                tab
                ldaa    byte_111
                sba
                bcc     loc_D9D2
                clra

loc_D9D2:                               ; CODE XREF: sub_D92D+A2↑j
                staa    byte_111
                bra     loc_D993
; End of function sub_D92D


; =============== S U B R O U T I N E =======================================


sub_D9D7:                               ; CODE XREF: __RESET+752↑P
                brclr   <byte_48 $40 locret_D9EE ; '@'
                brset   <byte_4 $20 locret_D9EE ; ' '
                brset   <byte_4A $80 locret_D9EE
                ldaa    <byte_F2
                bita    #$88
                bne     locret_D9EE
                ldaa    byte_116
                beq     loc_D9EF

locret_D9EE:                            ; CODE XREF: sub_D9D7↑j
                                        ; sub_D9D7+4↑j ...
                rts
; ---------------------------------------------------------------------------

loc_D9EF:                               ; CODE XREF: sub_D9D7+15↑j
                ldaa    <byte_6
                lsra
                lsra
                brclr   <byte_7B $40 loc_DA09 ; '@'
                tst     byte_8DFC
                bmi     loc_DA03
                adda    byte_8DFC
                bcs     loc_DA44
                bra     loc_DA09
; ---------------------------------------------------------------------------

loc_DA03:                               ; CODE XREF: sub_D9D7+23↑j
                adda    byte_8DFC
                bcs     loc_DA09
                clra

loc_DA09:                               ; CODE XREF: sub_D9D7+1C↑j
                                        ; sub_D9D7+2A↑j ...
                adda    byte_8DFB
                bcs     loc_DA44
                psha
                ldx     #byte_8D83
                ldaa    <byte_8
                jsr     sub_F0B5
                pula
                negb
                sba
                bcc     loc_DA1D
                clra

loc_DA1D:                               ; CODE XREF: sub_D9D7+43↑j
                brclr   <byte_4A 4 loc_DA46
                psha
                ldx     #byte_8D96
                ldaa    <byte_64
                jsr     sub_F0B5
                pula
                aba
                bcs     loc_DA44
                psha
                ldx     #byte_8DA1
                ldaa    <byte_72
                jsr     sub_F0B5
                pulb
                aba
                bcs     loc_DA44
                brset   <byte_F0 1 loc_DA46
                adda    byte_8DFA
                bcc     loc_DA46

loc_DA44:                               ; CODE XREF: sub_D9D7+28↑j
                                        ; sub_D9D7+35↑j ...
                ldaa    #$FF

loc_DA46:                               ; CODE XREF: sub_D9D7:loc_DA1D↑j
                                        ; sub_D9D7+64↑j ...
                staa    STe_648A
                ldd     word_117
                lsld
                bcs     loc_DA57
                lsld
                bcs     loc_DA57
                aslb
                adca    #0
                bra     loc_DA59
; ---------------------------------------------------------------------------

loc_DA57:                               ; CODE XREF: sub_D9D7+76↑j
                                        ; sub_D9D7+79↑j
                ldaa    #$FF

loc_DA59:                               ; CODE XREF: sub_D9D7+7E↑j
                ldab    STe_648A
                mul
                lsld
                bcs     loc_DA8B
                staa    Temp5_t3
                ldx     #byte_8DB4
                ldaa    <byte_6B
                jsr     sub_F0B5
                psha
                ldx     #byte_8DCE
                ldaa    <byte_72
                jsr     sub_F0B5
                pulb
                mul
                adca    Temp5_t3
                bcs     loc_DA8B
                staa    Temp5_t3
                ldx     #byte_8DC3
                ldaa    <byte_8
                jsr     sub_F0B5
                adda    Temp5_t3
                bcc     loc_DA8D

loc_DA8B:                               ; CODE XREF: sub_D9D7+87↑j
                                        ; sub_D9D7+A2↑j
                ldaa    #$FF

loc_DA8D:                               ; CODE XREF: sub_D9D7+B2↑j
                staa    byte_113
                brset   <byte_4A 4 loc_DB10
                brset   <byte_4F 1 loc_DA9C
                brclr   <byte_7B $10 locret_DB0F

loc_DA9C:                               ; CODE XREF: sub_D9D7+BD↑j
                ldab    <byte_65
                bitb    byte_8DFE
                bne     locret_DB0F
                ldab    <byte_64
                cmpb    byte_8DFD
                bcs     locret_DB0F
                brclr   <byte_F0 1 locret_DB0F
                ldab    byte_112
                bne     locret_DB0F
                ldab    <byte_72
                cmpb    byte_8DF8
                bcs     locret_DB0F
                ldab    <byte_80
                subb    <byte_6B
                bcc     loc_DAC1
                negb

loc_DAC1:                               ; CODE XREF: sub_D9D7+E7↑j
                cmpb    byte_8DF9
                bhi     locret_DB0F
                ldab    <byte_6
                cmpa    <byte_6D
                bhi     loc_DACF
                incb
                bne     loc_DAD3

loc_DACF:                               ; CODE XREF: sub_D9D7+F3↑j
                tstb
                beq     loc_DAD5
                decb

loc_DAD3:                               ; CODE XREF: sub_D9D7+F6↑j
                stab    <byte_6

loc_DAD5:                               ; CODE XREF: sub_D9D7+F9↑j
                brset   <byte_4F 1 loc_DADD
                brclr   <byte_4D $10 locret_DB0F

loc_DADD:                               ; CODE XREF: sub_D9D7:loc_DAD5↑j
                ldaa    byte_110
                cmpa    byte_8D53
                bcs     locret_DB0F
                ldaa    <byte_5
                cmpa    byte_111
                bne     locret_DB0F
                ldaa    byte_8D6A
                brclr   <byte_7B $40 loc_DAFA ; '@'
                adda    byte_8D6B
                bcc     loc_DAFA
                ldaa    #$FF

loc_DAFA:                               ; CODE XREF: sub_D9D7+118↑j
                                        ; sub_D9D7+11F↑j
                staa    FDRVar3
                ldaa    byte_111
                cmpa    FDRVar3
                beq     locret_DB0F
                bhi     loc_DB09
                inca
                inca

loc_DB09:                               ; CODE XREF: sub_D9D7+12E↑j
                deca
                staa    byte_111
                staa    <byte_5

locret_DB0F:                            ; CODE XREF: sub_D9D7+C1↑j
                                        ; sub_D9D7+CA↑j ...
                rts
; ---------------------------------------------------------------------------

loc_DB10:                               ; CODE XREF: sub_D9D7+B9↑j
                ldab    byte_112
                bne     locret_DB0F
                ldab    byte_110
                cmpb    byte_8DF7
                bcs     locret_DB0F
                ldx     #byte_8DD9
                suba    <byte_6D
                bcc     loc_DB30
                nega
                ldx     #byte_8DE8
                psha
                ldd     <byte_6B
                subd    <byte_80
                pula
                bcs     locret_DB0F

loc_DB30:                               ; CODE XREF: sub_D9D7+14B↑j
                jsr     sub_F0B5
                jsr     sub_D910
                ldaa    byte_111
                cmpa    <byte_5
                beq     locret_DB0F
                clr     byte_110
                rts
; End of function sub_D9D7


; =============== S U B R O U T I N E =======================================


sub_DB41:                               ; CODE XREF: __RESET+755↑P
                brset   <byte_4A 4 locret_DB62
                ldaa    <byte_F2
                bita    #$88
                bne     locret_DB62
                ldaa    byte_111
                oraa    <byte_5
                bne     locret_DB62
                ldab    <byte_65
                bitb    #$7F
                bne     locret_DB62
                adda    #2
                staa    <byte_5
                staa    byte_111
                bset    <byte_4 $10

locret_DB62:                            ; CODE XREF: sub_DB41↑j
                                        ; sub_DB41+8↑j ...
                rts
; End of function sub_DB41

; ---------------------------------------------------------------------------
byte_DB63:      fcb 6                   ; DATA XREF: __RESET+4F2↑o
                                        ; sub_DB67+6D↓o
                fcb 5
                fcb 9
                fcb $A

; =============== S U B R O U T I N E =======================================


sub_DB67:                               ; CODE XREF: OC1I+3E↑P
                ldaa    byte_151
                lsra
                bcs     loc_DBC7
                ldab    <byte_4
                bitb    #$40 ; '@'
                bne     loc_DB8A
                lsra
                bcs     loc_DBC7
                brclr   <byte_51 4 loc_DB7D
                jmp     loc_DC04
; ---------------------------------------------------------------------------

loc_DB7D:                               ; CODE XREF: sub_DB67+F↑j
                ldaa    <byte_6B
                cmpa    #$5E ; '^'
                bcs     loc_DB8A
                ldaa    <byte_5
                cmpa    byte_111
                beq     locret_DC07

loc_DB8A:                               ; CODE XREF: sub_DB67+A↑j
                                        ; sub_DB67+1A↑j
                ldaa    <byte_76
                cmpa    byte_8C57
                bcs     locret_DC07
                sei
                ldaa    <byte_F1
                oraa    #1
                staa    PIA3_Buffer_2_t3
                anda    #$FE
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                ldab    <byte_5
                brclr   <byte_4 $40 loc_DBB0 ; '@'
                ldaa    #1
                tstb
                bne     loc_DBB9
                bclr    <byte_4 $40 ; '@'
                bra     loc_DBD0
; ---------------------------------------------------------------------------

loc_DBB0:                               ; CODE XREF: sub_DB67+3B↑j
                ldaa    #1
                cmpb    byte_111
                beq     loc_DBD0
                bcs     loc_DBBA

loc_DBB9:                               ; CODE XREF: sub_DB67+42↑j
                nega

loc_DBBA:                               ; CODE XREF: sub_DB67+50↑j
                tab
                negb
                cmpb    byte_176
                bne     loc_DBC9
                bset    <byte_51 4
                staa    byte_176

loc_DBC7:                               ; CODE XREF: sub_DB67+4↑j
                                        ; sub_DB67+D↑j
                bra     locret_DC07
; ---------------------------------------------------------------------------

loc_DBC9:                               ; CODE XREF: sub_DB67+58↑j
                adda    <byte_5
                staa    <byte_5
                negb
                bra     loc_DBD1
; ---------------------------------------------------------------------------

loc_DBD0:                               ; CODE XREF: sub_DB67+47↑j
                                        ; sub_DB67+4E↑j
                clrb

loc_DBD1:                               ; CODE XREF: sub_DB67+67↑j
                stab    byte_176
                ldx     #byte_DB63
                addb    <byte_B
                andb    #3
                stab    <byte_B
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
                ldx     #PORTD          ; Port D Data
                sei
                bclr    0,x $20 ; ' '
                cmpa    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                ldaa    <byte_F1
                oraa    #1
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                mul
                bset    0,x $20 ; ' '
                rts
; ---------------------------------------------------------------------------

loc_DC04:                               ; CODE XREF: sub_DB67+13↑J
                bclr    <byte_51 4

locret_DC07:                            ; CODE XREF: sub_DB67+21↑j
                                        ; sub_DB67+28↑j ...
                rts
; End of function sub_DB67


; =============== S U B R O U T I N E =======================================


sub_DC08:                               ; CODE XREF: __RESET:loc_98E8↑P
                ldaa    byte_9039
                bita    #8
                bne     loc_DC12
                jmp     loc_DD1E
; ---------------------------------------------------------------------------

loc_DC12:                               ; CODE XREF: sub_DC08+5↑j
                brset   <byte_48 $40 loc_DC22 ; '@'
                ldaa    <byte_72
                cmpa    byte_9085
                bcc     loc_DC39
                bset    <byte_50 $80
                bra     loc_DC39
; ---------------------------------------------------------------------------

loc_DC22:                               ; CODE XREF: sub_DC08:loc_DC12↑j
                ldaa    <byte_64
                cmpa    byte_9086
                bcs     loc_DC39
                brset   <byte_50 $80 loc_DC39
                brset   <byte_57 2 loc_DC39
                brset   <byte_58 2 loc_DC39
                brset   <byte_51 $40 loc_DC3C ; '@'

loc_DC39:                               ; CODE XREF: sub_DC08+13↑j
                                        ; sub_DC08+18↑j ...
                jmp     loc_DCB8
; ---------------------------------------------------------------------------

loc_DC3C:                               ; CODE XREF: sub_DC08+2D↑j
                ldaa    <byte_F2
                bne     loc_DCB8
                brclr   <byte_F0 $20 loc_DC39 ; ' '
                ldaa    <byte_8
                suba    <byte_6D
                bcc     loc_DC4B
                clra

loc_DC4B:                               ; CODE XREF: sub_DC08+40↑j
                cmpa    byte_9087
                bcs     loc_DCB8
                ldab    byte_16A
                brset   <byte_50 $40 loc_DCD6 ; '@'
                cmpb    byte_908F
                bcc     loc_DCC7
                ldaa    <byte_6D
                cmpa    byte_908B
                bcs     loc_DCB8
                cmpa    byte_908A
                bcc     loc_DCB8
                ldaa    <byte_77
                cmpa    byte_9089
                bcs     loc_DCB8
                cmpa    byte_9088
                bcc     loc_DCB8
                ldaa    <byte_6B
                cmpa    byte_908D
                bcs     loc_DCB8
                cmpa    byte_908C
                bcc     loc_DCB8
                ldaa    <byte_9E
                cmpa    byte_908E
                bge     loc_DCB8
                ldaa    <byte_65
                bita    #3
                bne     loc_DC91
                incb
                stab    byte_16A

loc_DC91:                               ; CODE XREF: sub_DC08+83↑j
                bset    <byte_50 $10
                ldab    byte_9096
                ldaa    <byte_9E
                suba    byte_169
                bvc     loc_DCA3
                bmi     loc_DCA5
                nega
                bra     loc_DCAB
; ---------------------------------------------------------------------------

loc_DCA3:                               ; CODE XREF: sub_DC08+94↑j
                bmi     loc_DCAA

loc_DCA5:                               ; CODE XREF: sub_DC08+96↑j
                mul
                adca    #0
                bra     loc_DCAF
; ---------------------------------------------------------------------------

loc_DCAA:                               ; CODE XREF: sub_DC08:loc_DCA3↑j
                nega

loc_DCAB:                               ; CODE XREF: sub_DC08+99↑j
                mul
                adca    #0
                nega

loc_DCAF:                               ; CODE XREF: sub_DC08+A0↑j
                adda    byte_169
                staa    byte_169
                jmp     loc_DD66
; ---------------------------------------------------------------------------

loc_DCB8:                               ; CODE XREF: sub_DC08:loc_DC39↑J
                                        ; sub_DC08+36↑j ...
                clra
                staa    byte_16A
                bclr    <byte_50 $50 ; 'P'
                ldaa    <byte_9E
                staa    byte_169
                jmp     loc_DD66
; ---------------------------------------------------------------------------

loc_DCC7:                               ; CODE XREF: sub_DC08+52↑j
                clrb
                bset    <byte_50 $40 ; '@'
                bclr    <byte_50 $10
                ldaa    byte_169
                staa    byte_16B
                bra     loc_DCE2
; ---------------------------------------------------------------------------

loc_DCD6:                               ; CODE XREF: sub_DC08+4B↑j
                cmpb    byte_9098
                bcc     loc_DD2E
                ldaa    <byte_65
                bita    #3
                bne     loc_DCE5
                incb

loc_DCE2:                               ; CODE XREF: sub_DC08+CC↑j
                stab    byte_16A

loc_DCE5:                               ; CODE XREF: sub_DC08+D7↑j
                ldaa    <byte_6D
                cmpa    byte_9094
                bcs     loc_DCB8
                cmpa    byte_9095
                bcc     loc_DCB8
                ldaa    <byte_77
                cmpa    byte_9092
                bcs     loc_DCB8
                cmpa    byte_9093
                bcc     loc_DCB8
                ldaa    <byte_6B
                cmpa    byte_9090
                bcs     loc_DCB8
                cmpa    byte_9091
                bcc     loc_DCB8
                ldaa    <byte_9E
                cmpa    byte_16B
                ble     loc_DD66
                staa    byte_16B
                suba    byte_169
                staa    byte_16C
                cmpa    byte_9097
                bcs     loc_DD66

loc_DD1E:                               ; CODE XREF: sub_DC08+7↑J
                ldaa    byte_16D
                anda    #$F
                staa    byte_16D
                bset    <byte_50 $80
                bclr    <byte_50 $70 ; 'p'
                bra     loc_DD66
; ---------------------------------------------------------------------------

loc_DD2E:                               ; CODE XREF: sub_DC08+D1↑j
                clrb
                stab    byte_16A
                ldab    <byte_50
                andb    #$AF
                ldaa    byte_16D
                adda    #$10
                staa    byte_16D
                anda    #$F0
                cmpa    byte_9099
                bcs     loc_DD54
                orab    #$20 ; ' '
                pshb
                ldd     #$2E81
                jsr     sub_AE82
                bcc     loc_DD53
                bset    <byte_F3 8

loc_DD53:                               ; CODE XREF: sub_DC08+146↑j
                pulb

loc_DD54:                               ; CODE XREF: sub_DC08+13B↑j
                ldaa    byte_16D
                inca
                staa    byte_16D
                anda    #$F
                cmpa    byte_9084
                bcs     loc_DD64
                orab    #$80

loc_DD64:                               ; CODE XREF: sub_DC08+158↑j
                stab    <byte_50

loc_DD66:                               ; CODE XREF: sub_DC08+AD↑J
                                        ; sub_DC08+BC↑J ...
                brset   <byte_50 $40 loc_DDC9 ; '@'
                ldaa    byte_123
                beq     loc_DD72
                dec     byte_123

loc_DD72:                               ; CODE XREF: sub_DC08+165↑j
                brclr   <byte_4A $80 loc_DDBC
                brset   <byte_4A $40 loc_DDBC ; '@'
                ldaa    byte_8E12
                brset   <byte_F0 2 loc_DD88
                suba    byte_8E13
                bcc     loc_DD88
                ldaa    #0

loc_DD88:                               ; CODE XREF: sub_DC08+175↑j
                                        ; sub_DC08+17C↑j
                cmpa    <byte_6B
                bcs     loc_DDBC
                ldaa    <byte_72
                cmpa    byte_8E0E
                bcs     loc_DDBC
                ldaa    <byte_6D
                brset   <byte_F0 2 loc_DD9F
                suba    byte_8E0C
                bcc     loc_DD9F
                clra

loc_DD9F:                               ; CODE XREF: sub_DC08+18D↑j
                                        ; sub_DC08+194↑j
                cmpa    byte_8E0D
                bcs     loc_DDBC
                ldaa    <byte_8
                suba    byte_8E0F
                bcc     loc_DDAC
                clra

loc_DDAC:                               ; CODE XREF: sub_DC08+1A1↑j
                cmpa    <byte_6D
                bcc     loc_DDCD
                ldaa    <byte_8
                suba    byte_8E11
                bcc     loc_DDB8
                clra

loc_DDB8:                               ; CODE XREF: sub_DC08+1AD↑j
                cmpa    <byte_6D
                bcc     locret_DDDD

loc_DDBC:                               ; CODE XREF: sub_DC08:loc_DD72↑j
                                        ; sub_DC08+16E↑j ...
                brclr   <byte_F0 2 loc_DDC9
                bset    <byte_4C 4
                ldaa    byte_8E10
                staa    byte_123

loc_DDC9:                               ; CODE XREF: sub_DC08:loc_DD66↑j
                                        ; sub_DC08:loc_DDBC↑j
                bclr    <byte_F0 2
                rts
; ---------------------------------------------------------------------------

loc_DDCD:                               ; CODE XREF: sub_DC08+1A6↑j
                brset   <byte_F0 2 loc_DDDA
                bset    <byte_4C 4
                ldaa    byte_8E10
                staa    byte_123

loc_DDDA:                               ; CODE XREF: sub_DC08:loc_DDCD↑j
                bset    <byte_F0 2

locret_DDDD:                            ; CODE XREF: sub_DC08+1B2↑j
                rts
; End of function sub_DC08


; =============== S U B R O U T I N E =======================================


sub_DDDE:                               ; CODE XREF: __RESET+7B4↑P
                ldaa    byte_8018
                bita    #$20 ; ' '
                beq     locret_DDF0
                ldaa    byte_8017
                bita    #1
                beq     locret_DDF0
                brclr   <byte_65 2 loc_DDF1

locret_DDF0:                            ; CODE XREF: sub_DDDE+5↑j
                                        ; sub_DDDE+C↑j
                rts
; ---------------------------------------------------------------------------

loc_DDF1:                               ; CODE XREF: sub_DDDE+E↑j
                ldaa    <byte_7A
                cmpa    #$82
                bcc     loc_DE25
                cmpa    byte_8EEC
                bcs     loc_DE25
                brset   <byte_52 4 loc_DE25
                ldaa    byte_13B
                cmpa    byte_8EED
                bcc     loc_DE25
                cmpa    byte_8EEE
                bcs     loc_DE25
                ldab    <byte_65
                bne     loc_DE28
                ldab    byte_134
                incb
                beq     loc_DE1F
                stab    byte_134
                cmpb    byte_8EEF
                bcs     loc_DE28

loc_DE1F:                               ; CODE XREF: sub_DDDE+37↑j
                cmpa    <byte_7
                bcc     loc_DE25
                staa    <byte_7

loc_DE25:                               ; CODE XREF: sub_DDDE+17↑j
                                        ; sub_DDDE+1C↑j ...
                clr     byte_134

loc_DE28:                               ; CODE XREF: sub_DDDE+31↑j
                                        ; sub_DDDE+3F↑j
                ldaa    <byte_6B
                cmpa    #$F
                bcs     loc_DE5B
                ldab    byte_13B
                subb    byte_136
                bcc     loc_DE37
                negb

loc_DE37:                               ; CODE XREF: sub_DDDE+56↑j
                cmpb    byte_8EF0
                bcs     loc_DE44
                bset    <byte_52 4
                clr     byte_135
                bra     loc_DE6A
; ---------------------------------------------------------------------------

loc_DE44:                               ; CODE XREF: sub_DDDE+5C↑j
                brclr   <byte_52 4 loc_DE5E
                cmpb    byte_8EF1
                bcc     loc_DE5E
                ldaa    byte_135
                inca
                beq     loc_DE5B
                staa    byte_135
                cmpa    byte_8EF2
                bcs     loc_DE61

loc_DE5B:                               ; CODE XREF: sub_DDDE+4E↑j
                                        ; sub_DDDE+73↑j
                bclr    <byte_52 4

loc_DE5E:                               ; CODE XREF: sub_DDDE:loc_DE44↑j
                                        ; sub_DDDE+6D↑j
                clr     byte_135

loc_DE61:                               ; CODE XREF: sub_DDDE+7B↑j
                ldaa    <byte_65
                lsra
                lsra
                bita    byte_8EF3
                bne     loc_DE70

loc_DE6A:                               ; CODE XREF: sub_DDDE+64↑j
                ldaa    byte_13B
                staa    byte_136

loc_DE70:                               ; CODE XREF: sub_DDDE+8A↑j
                brset   <byte_48 $40 loc_DE7A ; '@'
                brset   <byte_4E 4 loc_DE7A
                bra     loc_DEDC
; ---------------------------------------------------------------------------

loc_DE7A:                               ; CODE XREF: sub_DDDE:loc_DE70↑j
                                        ; sub_DDDE+96↑j
                brclr   <byte_4A $80 loc_DED0
                brclr   <byte_4A $40 loc_DE89 ; '@'
                ldaa    <byte_6B
                cmpa    byte_8EF4
                bcc     loc_DED0

loc_DE89:                               ; CODE XREF: sub_DDDE+A0↑j
                ldaa    byte_13B
                suba    <byte_7
                bcs     loc_DED0
                cmpa    byte_8EF5
                bcs     loc_DED0
                ldx     #byte_8EF6
                ldaa    <byte_6D
                jsr     sub_F0B5
                ldaa    <byte_6B
                cba
                bcc     loc_DEB2
                brset   <byte_EF $20 loc_DED0 ; ' '
                subb    byte_8F19
                bcc     loc_DEAD
                ldab    #0

loc_DEAD:                               ; CODE XREF: sub_DDDE+CB↑j
                cba
                bcc     loc_DEC0
                bra     loc_DED0
; ---------------------------------------------------------------------------

loc_DEB2:                               ; CODE XREF: sub_DDDE+C2↑j
                ldaa    byte_137
                inca
                beq     loc_DEC0
                staa    byte_137
                cmpa    byte_8F1A
                bcs     loc_DED6

loc_DEC0:                               ; CODE XREF: sub_DDDE+D0↑j
                                        ; sub_DDDE+D8↑j
                ldaa    byte_138
                inca
                beq     loc_DED6
                staa    byte_138
                cmpa    byte_8F1B
                bhi     loc_DED6
                bra     loc_DEDC
; ---------------------------------------------------------------------------

loc_DED0:                               ; CODE XREF: sub_DDDE:loc_DE7A↑j
                                        ; sub_DDDE+A9↑j ...
                clr     byte_137
                clr     byte_138

loc_DED6:                               ; CODE XREF: sub_DDDE+E0↑j
                                        ; sub_DDDE+E6↑j ...
                ldab    <byte_EF
                orab    #$20 ; ' '
                bra     loc_DEE0
; ---------------------------------------------------------------------------

loc_DEDC:                               ; CODE XREF: sub_DDDE+9A↑j
                                        ; sub_DDDE+F0↑j
                ldab    <byte_EF
                andb    #$DF

loc_DEE0:                               ; CODE XREF: sub_DDDE+FC↑j
                stab    <byte_EF
                rts
; End of function sub_DDDE


; =============== S U B R O U T I N E =======================================


sub_DEE3:                               ; CODE XREF: __RESET+75B↑P

; FUNCTION CHUNK AT DFE2 SIZE 00000101 BYTES

                brset   <byte_5B $20 loc_DEEA ; ' '
                jmp     loc_DFE2
; ---------------------------------------------------------------------------

loc_DEEA:                               ; CODE XREF: sub_DEE3↑j
                jsr     sub_DFC9
                brclr   <byte_5A 8 loc_DF01
                brset   <byte_4F 8 loc_DEFB
                bclr    <byte_F0 8
                jmp     loc_DF81
; ---------------------------------------------------------------------------

loc_DEFB:                               ; CODE XREF: sub_DEE3+E↑j
                bclr    <byte_EF $80
                jmp     loc_DF81
; ---------------------------------------------------------------------------

loc_DF01:                               ; CODE XREF: sub_DEE3+A↑j
                brset   <byte_4F 8 loc_DF0A
                bset    <byte_F0 8
                bra     loc_DF0D
; ---------------------------------------------------------------------------

loc_DF0A:                               ; CODE XREF: sub_DEE3:loc_DF01↑j
                bset    <byte_EF $80

loc_DF0D:                               ; CODE XREF: sub_DEE3+25↑j
                ldaa    byte_8E18
                brset   <byte_52 $40 loc_DF17 ; '@'
                adda    byte_8E19

loc_DF17:                               ; CODE XREF: sub_DEE3+2D↑j
                cmpa    <byte_7A
                bcc     loc_DF7E
                bset    <byte_52 $40 ; '@'
                ldaa    <byte_72
                cmpa    byte_8E15
                bcs     loc_DF81
                ldaa    byte_8E1B
                brset   <byte_EF $10 loc_DF2E
                adda    #4

loc_DF2E:                               ; CODE XREF: sub_DEE3+45↑j
                cmpa    byte_13B
                bcs     loc_DF81
                brclr   <byte_4D $10 loc_DF81
                ldaa    <byte_6B
                cmpa    byte_8E17
                bcs     loc_DF53
                ldaa    byte_134
                beq     loc_DF53
                ldaa    <byte_65
                bita    #7
                bne     loc_DF4E
                dec     byte_134
                beq     loc_DF53

loc_DF4E:                               ; CODE XREF: sub_DEE3+64↑j
                ldx     #byte_8E4B
                bra     loc_DF59
; ---------------------------------------------------------------------------

loc_DF53:                               ; CODE XREF: sub_DEE3+59↑j
                                        ; sub_DEE3+5E↑j ...
                ldx     #byte_8E34
                clr     byte_134

loc_DF59:                               ; CODE XREF: sub_DEE3+6E↑j
                ldaa    <byte_6B
                jsr     sub_F0B5
                ldaa    <byte_77
                cba
                bcs     loc_DF9B
                ldx     #byte_8E1D
                ldaa    <byte_6B
                jsr     sub_F0B5
                ldaa    <byte_77
                cba
                bcc     loc_DF76
                brclr   <byte_EF $10 loc_DFE2
                bra     loc_DF84
; ---------------------------------------------------------------------------

loc_DF76:                               ; CODE XREF: sub_DEE3+8B↑j
                ldaa    byte_8E16
                staa    byte_134
                bra     loc_DF84
; ---------------------------------------------------------------------------

loc_DF7E:                               ; CODE XREF: sub_DEE3+36↑j
                bclr    <byte_52 $40 ; '@'

loc_DF81:                               ; CODE XREF: sub_DEE3+15↑J
                                        ; sub_DEE3+1B↑J ...
                clr     byte_134

loc_DF84:                               ; CODE XREF: sub_DEE3+91↑j
                                        ; sub_DEE3+99↑j
                ldaa    byte_8E1A
                staa    byte_135

loc_DF8A:                               ; CODE XREF: sub_DEE3+C1↓j
                                        ; sub_DEE3+C7↓j
                brclr   <byte_5A 8 loc_DF92
                brset   <byte_EF $10 loc_DFE2

loc_DF92:                               ; CODE XREF: sub_DEE3:loc_DF8A↑j
                bset    <byte_EF $10
                clr     byte_137

loc_DF98:                               ; CODE XREF: sub_DEE3:loc_E04A↓J
                jmp     loc_E0D9
; ---------------------------------------------------------------------------

loc_DF9B:                               ; CODE XREF: sub_DEE3+7E↑j
                ldaa    byte_135
                beq     loc_DFAC
                ldab    <byte_65
                bitb    #7
                bne     loc_DF8A
                deca
                staa    byte_135
                bne     loc_DF8A

loc_DFAC:                               ; CODE XREF: sub_DEE3+BB↑j
                brclr   <byte_EF $10 loc_DFE2
                brclr   <byte_5E $20 loc_DFB7 ; ' '
                jmp     loc_E0D9
; ---------------------------------------------------------------------------

loc_DFB7:                               ; CODE XREF: sub_DEE3+CD↑j
                bset    <byte_5E $20 ; ' '
                bclr    <byte_EF $10
                ldaa    byte_8E1C
                staa    byte_139
                clr     byte_137
                jmp     loc_E0D9
; End of function sub_DEE3


; =============== S U B R O U T I N E =======================================


sub_DFC9:                               ; CODE XREF: sub_DEE3:loc_DEEA↑P
                brclr   <byte_5E $20 locret_DFE1 ; ' '
                ldaa    <byte_65
                bita    #7
                bne     locret_DFE1
                ldaa    byte_139
                beq     loc_DFDE
                deca
                staa    byte_139
                bne     locret_DFE1

loc_DFDE:                               ; CODE XREF: sub_DFC9+D↑j
                bclr    <byte_5E $20 ; ' '

locret_DFE1:                            ; CODE XREF: sub_DFC9↑j
                                        ; sub_DFC9+8↑j ...
                rts
; End of function sub_DFC9

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_DEE3

loc_DFE2:                               ; CODE XREF: sub_DEE3+4↑J
                                        ; sub_DEE3+8D↑j ...
                ldaa    byte_8018
                bita    #$40 ; '@'
                bne     loc_DFEC
                jmp     locret_E0A1
; ---------------------------------------------------------------------------

loc_DFEC:                               ; CODE XREF: sub_DEE3+104↑j
                ldd     #byte_8EA8
                brclr   <byte_5B $20 loc_DFFA ; ' '
                brset   <byte_EF $10 loc_DFFA
                ldd     #byte_8E64

loc_DFFA:                               ; CODE XREF: sub_DEE3+10C↑j
                                        ; sub_DEE3+110↑j
                std     FDRVar0
                addd    #8
                brset   <byte_EF $20 loc_E007 ; ' '
                addd    #$1E

loc_E007:                               ; CODE XREF: sub_DEE3+11D↑j
                std     FDRVar2
                ldx     FDRVar0
                ldaa    <byte_65
                bita    #1
                bne     loc_E01F
                ldaa    byte_137
                cmpa    byte_8E63
                beq     loc_E01F
                inca
                staa    byte_137

loc_E01F:                               ; CODE XREF: sub_DEE3+12E↑j
                                        ; sub_DEE3+136↑j
                ldaa    byte_136
                staa    Temp5_t3
                ldaa    <byte_65
                bita    0,x
                bne     loc_E030
                ldaa    <byte_6D
                staa    byte_136

loc_E030:                               ; CODE XREF: sub_DEE3+146↑j
                ldaa    <byte_77
                beq     loc_E04A
                staa    STe_648A
                ldaa    <byte_72
                cmpa    byte_8E62
                bcs     loc_E04A
                brclr   <byte_4D $10 loc_E04A
                brclr   <byte_4A $80 loc_E04A
                brclr   <byte_7B $20 loc_E04D ; ' '

loc_E04A:                               ; CODE XREF: sub_DEE3+14F↑j
                                        ; sub_DEE3+159↑j ...
                jmp     loc_DF98
; ---------------------------------------------------------------------------

loc_E04D:                               ; CODE XREF: sub_DEE3+163↑j
                ldaa    <byte_7A
                cmpa    1,x
                bcc     loc_E061
                ldaa    <byte_6D
                suba    Temp5_t3
                bcs     loc_E061
                cmpa    2,x
                bcs     loc_E08D
                jmp     loc_E0D9
; ---------------------------------------------------------------------------

loc_E061:                               ; CODE XREF: sub_DEE3+16E↑j
                                        ; sub_DEE3+175↑j
                ldaa    Temp5_t3
                suba    <byte_6D
                bcs     loc_E08D
                staa    Temp5_t3
                ldab    4,x
                brset   <byte_52 $20 loc_E086 ; ' '
                brset   <byte_52 $10 loc_E084
                ldaa    STe_648A
                cmpa    3,x
                bcs     loc_E081
                bset    <byte_52 $20 ; ' '
                bra     loc_E086
; ---------------------------------------------------------------------------

loc_E081:                               ; CODE XREF: sub_DEE3+197↑j
                bset    <byte_52 $10

loc_E084:                               ; CODE XREF: sub_DEE3+18E↑j
                ldab    5,x

loc_E086:                               ; CODE XREF: sub_DEE3+18A↑j
                                        ; sub_DEE3+19C↑j
                cmpb    Temp5_t3
                bhi     loc_E090
                bra     loc_E0D9
; ---------------------------------------------------------------------------

loc_E08D:                               ; CODE XREF: sub_DEE3+179↑j
                                        ; sub_DEE3+183↑j
                bclr    <byte_52 $30 ; '0'

loc_E090:                               ; CODE XREF: sub_DEE3+1A6↑j
                ldaa    byte_138
                cmpa    #1
                bls     loc_E0A2
                ldab    <byte_65
                bitb    #7
                bne     locret_E0A1
                deca
                staa    byte_138

locret_E0A1:                            ; CODE XREF: sub_DEE3+106↑J
                                        ; sub_DEE3+1B8↑j ...
                rts
; ---------------------------------------------------------------------------

loc_E0A2:                               ; CODE XREF: sub_DEE3+1B2↑j
                ldx     FDRVar2
                bsr     sub_E0E3
                bcc     loc_E0D9
                ldx     FDRVar2
                ldab    #$F
                abx
                bsr     sub_E0E3
                bcs     loc_E0D9
                ldx     FDRVar0
                ldaa    byte_138
                beq     loc_E0CB
                brclr   <byte_5B $20 loc_E0C7 ; ' '
                ldaa    byte_137
                cmpa    byte_8E63
                bcs     locret_E0A1

loc_E0C7:                               ; CODE XREF: sub_DEE3+1D8↑j
                bclr    <byte_EF $20 ; ' '
                rts
; ---------------------------------------------------------------------------

loc_E0CB:                               ; CODE XREF: sub_DEE3+1D6↑j
                ldaa    <byte_7A
                ldab    6,x
                cmpa    1,x
                bcc     loc_E0D5
                ldab    7,x

loc_E0D5:                               ; CODE XREF: sub_DEE3+1EE↑j
                stab    byte_138
                rts
; ---------------------------------------------------------------------------

loc_E0D9:                               ; CODE XREF: sub_DEE3:loc_DF98↑J
                                        ; sub_DEE3+D1↑J ...
                clr     byte_138
                bset    <byte_EF $20 ; ' '
                bclr    <byte_52 $30 ; '0'
                rts
; END OF FUNCTION CHUNK FOR sub_DEE3

; =============== S U B R O U T I N E =======================================


sub_E0E3:                               ; CODE XREF: sub_DEE3+1C2↑p
                                        ; sub_DEE3+1CC↑p
                ldaa    <byte_7A
                jsr     sub_F0B5
                ldaa    STe_648A
                cba
                rts
; End of function sub_E0E3


; =============== S U B R O U T I N E =======================================


sub_E0ED:                               ; CODE XREF: __RESET+6F5↑P

; FUNCTION CHUNK AT E48E SIZE 00000127 BYTES
; FUNCTION CHUNK AT E5C6 SIZE 00000180 BYTES
; FUNCTION CHUNK AT E795 SIZE 00000049 BYTES

                bclr    <byte_61 $F
                brset   <byte_7B 4 loc_E0F9
                clrb
                stab    <byte_FF
                bra     loc_E166
; ---------------------------------------------------------------------------

loc_E0F9:                               ; CODE XREF: sub_E0ED+3↑j
                inc     byte_61
                ldd     <byte_78
                lsld
                lsld
                lsld
                aslb
                adca    #0
                staa    FDRVar0
                cmpa    byte_8F27
                bcs     loc_E15D
                inc     byte_61
                ldaa    <byte_6B
                cmpa    byte_8F28
                bcc     loc_E15D
                inc     byte_61
                brset   <byte_7B $20 loc_E15D ; ' '
                inc     byte_61
                brset   <byte_4F 1 loc_E130
                brclr   <byte_7B $10 loc_E15D
                inc     byte_61
                inc     byte_61
                bra     loc_E19A
; ---------------------------------------------------------------------------

loc_E130:                               ; CODE XREF: sub_E0ED+33↑j
                inc     byte_61
                ldaa    byte_116
                bne     loc_E152
                brclr   <byte_5E $40 loc_E145 ; '@'
                brset   <byte_5F $80 loc_E15D
                bset    <byte_54 $20 ; ' '
                bra     loc_E15D
; ---------------------------------------------------------------------------

loc_E145:                               ; CODE XREF: sub_E0ED+4B↑j
                ldab    byte_13B
                cmpb    byte_8F25
                bcc     loc_E15D
                cmpb    byte_8F26
                bcs     loc_E15D

loc_E152:                               ; CODE XREF: sub_E0ED+49↑j
                inc     byte_61
                brset   <byte_5F $80 loc_E19A
                brclr   <byte_4C 8 loc_E19A

loc_E15D:                               ; CODE XREF: sub_E0ED+1D↑j
                                        ; sub_E0ED+27↑j ...
                brclr   <byte_5F $18 loc_E166
                ldaa    FDRVar0
                staa    <byte_FF

loc_E166:                               ; CODE XREF: sub_E0ED+A↑j
                                        ; sub_E0ED:loc_E15D↑j
                brset   <byte_5F $80 loc_E173
                ldab    <byte_61
                andb    #$F
                ldaa    #$11
                mul
                stab    <byte_61

loc_E173:                               ; CODE XREF: sub_E0ED:loc_E166↑j
                clrb
                stab    byte_11C
                stab    byte_121
                stab    byte_122
                stab    byte_11B
                stab    byte_120
                stab    byte_11D
                bclr    <byte_5F $1F
                bset    <byte_5F $A0
                bclr    <byte_60 $F
                ldaa    byte_11C
                oraa    #$80
                staa    byte_11C
                jmp     loc_E36A
; ---------------------------------------------------------------------------

loc_E19A:                               ; CODE XREF: sub_E0ED+41↑j
                                        ; sub_E0ED+68↑j ...
                inc     byte_61
                ldaa    byte_165
                tab
                eora    byte_166
                anda    #$C0
                beq     loc_E200
                brset   <byte_4E 1 loc_E200
                bita    #$40 ; '@'
                bne     loc_E1B1
                lsrb

loc_E1B1:                               ; CODE XREF: sub_E0ED+C1↑j
                ldaa    #0
                bitb    #$40 ; '@'
                bne     loc_E1EE
                brset   <byte_5F $80 loc_E1E3
                ldaa    FDRVar0
                psha
                ldd     #$F89
                jsr     sub_AE82
                pula
                staa    FDRVar0
                ldd     #$F08
                ldx     #byte_124
                cmpa    0,x
                beq     loc_E1D8
                inx
                cmpa    0,x
                bne     loc_E200

loc_E1D8:                               ; CODE XREF: sub_E0ED+E4↑j
                cmpb    2,x
                bne     loc_E200
                clr     0,x
                clr     2,x
                jmp     loc_E15D
; ---------------------------------------------------------------------------

loc_E1E3:                               ; CODE XREF: sub_E0ED+CA↑j
                ldaa    #7
                ldab    byte_165
                bitb    #$C0
                bne     loc_E1EE
                ldaa    #$7F

loc_E1EE:                               ; CODE XREF: sub_E0ED+C8↑j
                                        ; sub_E0ED+FD↑j
                bita    <byte_65
                bne     loc_E200
                ldaa    FDRVar0
                psha
                ldd     #$F10
                jsr     sub_AE82
                pula
                staa    FDRVar0

loc_E200:                               ; CODE XREF: sub_E0ED+B9↑j
                                        ; sub_E0ED+BB↑j ...
                inc     byte_61
                brset   <byte_7B 2 loc_E267
                ldab    byte_11C
                incb
                bne     loc_E20E
                decb

loc_E20E:                               ; CODE XREF: sub_E0ED+11E↑j
                stab    byte_11C
                brset   <byte_5F 1 loc_E235
                ldaa    byte_11C
                asla
                bcs     loc_E23F
                ldab    byte_11C
                cmpb    #4
                bls     loc_E23F
                bset    <byte_5F $21 ; '!'
                bclr    <byte_5F $A
                bset    <byte_60 4
                clra
                staa    byte_121
                staa    byte_122
                bclr    <byte_5F 4

loc_E235:                               ; CODE XREF: sub_E0ED+124↑j
                brset   <byte_5F $80 loc_E23F
                brset   <byte_5F $10 loc_E253
                bra     loc_E242
; ---------------------------------------------------------------------------

loc_E23F:                               ; CODE XREF: sub_E0ED+12C↑j
                                        ; sub_E0ED+133↑j ...
                jmp     loc_E48E
; ---------------------------------------------------------------------------

loc_E242:                               ; CODE XREF: sub_E0ED+150↑j
                cmpb    byte_8F1E
                bls     loc_E23F
                bset    <byte_5F $10
                bclr    <byte_60 3
                ldaa    FDRVar0
                staa    byte_122

loc_E253:                               ; CODE XREF: sub_E0ED+14C↑j
                ldab    <byte_60
                cmpb    #$A0
                bcs     loc_E23F
                ldab    byte_122
                subb    byte_8F32
                bcc     loc_E262
                clrb

loc_E262:                               ; CODE XREF: sub_E0ED+172↑j
                stab    byte_122
                bra     loc_E23F
; ---------------------------------------------------------------------------

loc_E267:                               ; CODE XREF: sub_E0ED+116↑j
                brclr   <byte_5F 1 loc_E2D5
                ldaa    #$7F
                brset   <byte_5F $80 loc_E2A3
                brset   <byte_60 8 loc_E280
                ldab    <byte_FF
                subb    FDRVar0
                bcc     loc_E280
                cmpb    #$FC
                bcs     loc_E2A3

loc_E280:                               ; CODE XREF: sub_E0ED+184↑j
                                        ; sub_E0ED+18D↑j
                brset   <byte_5F $10 loc_E286
                bra     loc_E2AA
; ---------------------------------------------------------------------------

loc_E286:                               ; CODE XREF: sub_E0ED:loc_E280↑j
                ldaa    byte_121
                ldab    byte_8F31
                addb    #$80
                bmi     loc_E298
                mul
                adca    byte_121
                bcs     loc_E29F
                bra     loc_E29B
; ---------------------------------------------------------------------------

loc_E298:                               ; CODE XREF: sub_E0ED+1A1↑j
                mul
                adca    #0

loc_E29B:                               ; CODE XREF: sub_E0ED+1A9↑j
                cmpa    #$7F
                bls     loc_E2AA

loc_E29F:                               ; CODE XREF: sub_E0ED+1A7↑j
                ldaa    #$7F
                bra     loc_E2AA
; ---------------------------------------------------------------------------

loc_E2A3:                               ; CODE XREF: sub_E0ED+180↑j
                                        ; sub_E0ED+191↑j
                bset    <byte_60 1
                clrb
                stab    byte_120

loc_E2AA:                               ; CODE XREF: sub_E0ED+197↑j
                                        ; sub_E0ED+1B0↑j ...
                ldab    FDRVar0
                stab    <byte_FF
                staa    FDRVar2
                jsr     sub_E451
                ldab    FDRVar2
                cba
                bhi     loc_E2BC
                tab

loc_E2BC:                               ; CODE XREF: sub_E0ED+1CC↑j
                bclr    <byte_5F $91
                bclr    <byte_60 8
                bclr    <byte_4C 8
                clra
                staa    byte_121
                staa    byte_11C
                staa    byte_122
                staa    byte_11B
                jmp     loc_E36A
; ---------------------------------------------------------------------------

loc_E2D5:                               ; CODE XREF: sub_E0ED:loc_E267↑j
                clrb
                stab    byte_11C
                brset   <byte_7B 8 loc_E2E0
                jmp     loc_E3E4
; ---------------------------------------------------------------------------

loc_E2E0:                               ; CODE XREF: sub_E0ED+1EC↑j
                ldab    byte_121
                incb
                bne     loc_E2E7
                decb

loc_E2E7:                               ; CODE XREF: sub_E0ED+1F7↑j
                stab    byte_121
                brclr   <byte_5F 2 loc_E2F1
                jmp     loc_E38A
; ---------------------------------------------------------------------------

loc_E2F1:                               ; CODE XREF: sub_E0ED+1FD↑j
                brclr   <byte_5F $20 loc_E2F8 ; ' '
                jmp     loc_E42F
; ---------------------------------------------------------------------------

loc_E2F8:                               ; CODE XREF: sub_E0ED:loc_E2F1↑j
                cmpb    #4
                bhi     loc_E2FF
                jmp     loc_E48E
; ---------------------------------------------------------------------------

loc_E2FF:                               ; CODE XREF: sub_E0ED+20D↑j
                bset    <byte_5F 6
                bset    <byte_60 4
                clra
                staa    byte_11B
                brclr   <byte_5F $80 loc_E345
                bset    <byte_5F $20 ; ' '
                bclr    <byte_5F $80
                bclr    <byte_4C 8
                jsr     sub_E451
                staa    FDRVar2
                ldaa    <byte_FF
                suba    FDRVar0
                bcc     loc_E326
                tab
                eorb    #$80

loc_E326:                               ; CODE XREF: sub_E0ED+234↑j
                bpl     loc_E32D
                asla
                ldaa    #$80
                sbca    #0

loc_E32D:                               ; CODE XREF: sub_E0ED:loc_E326↑j
                adda    #$80
                ldx     #byte_8F9C
                jsr     sub_F0B5
                addb    #$80
                addb    FDRVar2
                bpl     loc_E381
                bvc     loc_E342
                ldab    #$7F
                bra     loc_E381
; ---------------------------------------------------------------------------

loc_E342:                               ; CODE XREF: sub_E0ED+24F↑j
                clrb
                bra     loc_E381
; ---------------------------------------------------------------------------

loc_E345:                               ; CODE XREF: sub_E0ED+21C↑j
                bclr    <byte_60 3
                ldaa    <byte_FF
                adda    #4
                staa    <byte_FF
                ldab    byte_11E
                suba    #3
                cmpa    byte_8F23
                bhi     loc_E36A
                ldab    byte_8F29
                ldaa    byte_11E
                bmi     loc_E36A
                aba
                bcs     loc_E367
                cmpa    #$7F
                bls     loc_E369

loc_E367:                               ; CODE XREF: sub_E0ED+274↑j
                ldaa    #$7F

loc_E369:                               ; CODE XREF: sub_E0ED+278↑j
                tab

loc_E36A:                               ; CODE XREF: sub_E0ED+AA↑J
                                        ; sub_E0ED+1E5↑J ...
                ldaa    <byte_FF
                cmpa    byte_8F23
                bls     loc_E379
                bclr    <byte_60 3
                ldaa    byte_8F23
                bra     loc_E37F
; ---------------------------------------------------------------------------

loc_E379:                               ; CODE XREF: sub_E0ED+282↑j
                cmpa    byte_8F24
                bcc     loc_E381
                clra

loc_E37F:                               ; CODE XREF: sub_E0ED+28A↑j
                staa    <byte_FF

loc_E381:                               ; CODE XREF: sub_E0ED+24D↑j
                                        ; sub_E0ED+253↑j ...
                stab    byte_11E
                jsr     sub_E776

loc_E387:                               ; CODE XREF: sub_E0ED:loc_E38A↓j
                                        ; sub_E0ED+2A8↓j ...
                jmp     loc_E48E
; ---------------------------------------------------------------------------

loc_E38A:                               ; CODE XREF: sub_E0ED+201↑J
                brset   <byte_5F $20 loc_E387 ; ' '
                brset   <byte_5F 8 loc_E3AA
                cmpb    byte_8F1F
                bls     loc_E387
                bset    <byte_5F 8
                bset    <byte_60 8
                ldaa    FDRVar0
                adda    byte_8F34
                bcc     loc_E3A7
                ldaa    #$FF

loc_E3A7:                               ; CODE XREF: sub_E0ED+2B6↑j
                staa    byte_122

loc_E3AA:                               ; CODE XREF: sub_E0ED+2A1↑j
                ldaa    FDRVar0
                cmpa    byte_8F23
                bcs     loc_E3BA
                bset    <byte_5F $20 ; ' '
                ldab    byte_11E
                bra     loc_E416
; ---------------------------------------------------------------------------

loc_E3BA:                               ; CODE XREF: sub_E0ED+2C3↑j
                ldab    <byte_60
                cmpb    #$A0
                bcs     loc_E387
                ldab    byte_122
                subb    byte_8F33
                bcc     loc_E3C9
                clrb

loc_E3C9:                               ; CODE XREF: sub_E0ED+2D9↑j
                cmpb    byte_8F23
                bcc     loc_E3DF
                adda    byte_8F35
                bcs     loc_E3DC
                cba
                bls     loc_E3DF
                tab
                cmpb    byte_8F23
                bls     loc_E3DF

loc_E3DC:                               ; CODE XREF: sub_E0ED+2E4↑j
                ldab    byte_8F23

loc_E3DF:                               ; CODE XREF: sub_E0ED+2DF↑j
                                        ; sub_E0ED+2E7↑j ...
                stab    byte_122
                bra     loc_E387
; ---------------------------------------------------------------------------

loc_E3E4:                               ; CODE XREF: sub_E0ED+1F0↑J
                bclr    <byte_5F 2
                ldaa    <byte_FF
                beq     loc_E3EE
                bclr    <byte_5F $20 ; ' '

loc_E3EE:                               ; CODE XREF: sub_E0ED+2FC↑j
                brclr   <byte_5F 8 loc_E42F
                ldaa    byte_121
                cmpa    #$5D ; ']'
                bhi     loc_E404
                bclr    <byte_5F 8
                bclr    <byte_60 8
                stab    byte_122
                bra     loc_E42F
; ---------------------------------------------------------------------------

loc_E404:                               ; CODE XREF: sub_E0ED+30A↑j
                ldaa    FDRVar0
                adda    #4
                suba    <byte_FF
                bcc     loc_E40E
                clra

loc_E40E:                               ; CODE XREF: sub_E0ED+31E↑j
                ldx     #byte_8FD9
                jsr     sub_F0B5
                orab    #$80

loc_E416:                               ; CODE XREF: sub_E0ED+2CB↑j
                ldaa    FDRVar0
                staa    <byte_FF
                bclr    <byte_5F $C
                bclr    <byte_60 8
                clra
                staa    byte_122
                staa    byte_121
                tstb
                bmi     loc_E42C
                clrb

loc_E42C:                               ; CODE XREF: sub_E0ED+33C↑j
                jmp     loc_E36A
; ---------------------------------------------------------------------------

loc_E42F:                               ; CODE XREF: sub_E0ED+208↑J
                                        ; sub_E0ED:loc_E3EE↑j ...
                clrb
                stab    byte_121
                ldaa    <byte_60
                eora    #4
                bita    #7
                bne     loc_E48E
                ldaa    <byte_65
                bne     loc_E48E
                ldab    byte_11B
                incb
                cmpb    byte_8F2C
                bcs     loc_E44C
                bclr    <byte_60 4
                clrb

loc_E44C:                               ; CODE XREF: sub_E0ED+359↑j
                stab    byte_11B
                bra     loc_E48E
; End of function sub_E0ED


; =============== S U B R O U T I N E =======================================


sub_E451:                               ; CODE XREF: sub_E0ED+1C5↑P
                                        ; sub_E0ED+229↑P
                ldaa    <byte_FF
                ldx     #byte_8F76
                jsr     sub_F0B5
                bpl     loc_E45D
                ldab    #$7F

loc_E45D:                               ; CODE XREF: sub_E451+8↑j
                stab    FDRVar1
                ldaa    <byte_8
                suba    <byte_6D
                bcc     loc_E467
                clra

loc_E467:                               ; CODE XREF: sub_E451+13↑j
                ldx     #byte_8F85
                jsr     sub_F0B5
                ldab    FDRVar1
                aslb
                mul
                adca    #0
                bpl     loc_E478
                ldaa    #$7F

loc_E478:                               ; CODE XREF: sub_E451+23↑j
                ldx     #$3A ; ':'
                ldab    <byte_FF
                cmpb    byte_8F36
                bls     loc_E483
                dex

loc_E483:                               ; CODE XREF: sub_E451+2F↑j
                adda    0,x
                bpl     locret_E48A
                bvs     loc_E48B
                clra

locret_E48A:                            ; CODE XREF: sub_E451+34↑j
                rts
; ---------------------------------------------------------------------------

loc_E48B:                               ; CODE XREF: sub_E451+36↑j
                ldaa    #$7F
                rts
; End of function sub_E451

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_E0ED

loc_E48E:                               ; CODE XREF: sub_E0ED:loc_E23F↑J
                                        ; sub_E0ED+20F↑J ...
                brset   <byte_5F $80 loc_E4A3
                inc     byte_61
                brclr   <byte_5F $18 loc_E4A3
                inc     byte_61
                brset   <byte_5F 8 loc_E4A3
                inc     byte_61

loc_E4A3:                               ; CODE XREF: sub_E0ED:loc_E48E↑j
                                        ; sub_E0ED+3A8↑j ...
                ldaa    <byte_60
                adda    #$10
                cmpa    #$B0
                bcs     loc_E4AD
                anda    #$F

loc_E4AD:                               ; CODE XREF: sub_E0ED+3BC↑j
                staa    <byte_60
                anda    #$F0
                beq     loc_E4B6
                jmp     loc_E795
; ---------------------------------------------------------------------------

loc_E4B6:                               ; CODE XREF: sub_E0ED+3C4↑j
                clrb
                brclr   <byte_4C $10 loc_E4BE
                jmp     loc_E5B0
; ---------------------------------------------------------------------------

loc_E4BE:                               ; CODE XREF: sub_E0ED+3CA↑j
                ldy     #byte_10A
                ldx     #$D000
                ldd     #$6DD
                ldaa    byte_109
                bne     loc_E4D1
                ldaa    #6
                bra     loc_E4E4
; ---------------------------------------------------------------------------

loc_E4D1:                               ; CODE XREF: sub_E0ED+3DE↑j
                clrb
                clra
                ldab    byte_109
                andb    #$40 ; '@'
                beq     loc_E4DD
                clrb
                bra     loc_E4E9
; ---------------------------------------------------------------------------

loc_E4DD:                               ; CODE XREF: sub_E0ED+3EB↑j
                ldab    #6
                dey
                ldx     #$DDD0

loc_E4E4:                               ; CODE XREF: sub_E0ED+3E2↑j
                sei
                jsr     sub_F22A
                cli

loc_E4E9:                               ; CODE XREF: sub_E0ED+3EE↑j
                ldx     <byte_78
                stx     FDRVar0
                std     <byte_78
                brclr   <byte_60 2 loc_E564
                ldaa    byte_11B
                brclr   <byte_60 1 loc_E50D
                cmpa    byte_8F40
                bcc     loc_E506
                inca
                staa    byte_11B
                bra     loc_E564
; ---------------------------------------------------------------------------

loc_E506:                               ; CODE XREF: sub_E0ED+411↑j
                bclr    <byte_60 1
                clra
                staa    byte_11B

loc_E50D:                               ; CODE XREF: sub_E0ED+40A↑j
                cmpa    byte_8F3F
                bcs     loc_E566
                ldab    byte_120
                tba
                bpl     loc_E519
                negb

loc_E519:                               ; CODE XREF: sub_E0ED+429↑j
                cmpb    byte_8F38
                bcs     loc_E55D
                ldx     #$3A ; ':'
                ldab    <byte_FF
                cmpb    byte_8F36
                bls     loc_E529
                dex

loc_E529:                               ; CODE XREF: sub_E0ED+439↑j
                ldab    0,x
                adda    2,x
                bvc     loc_E534
                asla
                ldaa    #$80
                sbca    #0

loc_E534:                               ; CODE XREF: sub_E0ED+440↑j
                staa    2,x
                cmpa    byte_8F39
                bgt     loc_E54D
                cmpa    byte_8F3A
                bge     loc_E55D
                subb    byte_8F3C
                cmpb    byte_8F3E
                bge     loc_E558
                ldab    byte_8F3E
                bra     loc_E558
; ---------------------------------------------------------------------------

loc_E54D:                               ; CODE XREF: sub_E0ED+44C↑j
                addb    byte_8F3B
                cmpb    byte_8F3D
                ble     loc_E558
                ldab    byte_8F3D

loc_E558:                               ; CODE XREF: sub_E0ED+459↑j
                                        ; sub_E0ED+45E↑j ...
                stab    0,x
                clra
                staa    2,x

loc_E55D:                               ; CODE XREF: sub_E0ED+42F↑j
                                        ; sub_E0ED+451↑j
                bclr    <byte_60 2
                clra
                staa    byte_11B

loc_E564:                               ; CODE XREF: sub_E0ED+403↑j
                                        ; sub_E0ED+417↑j
                bra     loc_E595
; ---------------------------------------------------------------------------

loc_E566:                               ; CODE XREF: sub_E0ED+423↑j
                inca
                staa    byte_11B
                ldd     <byte_78
                lsrd
                lsrd
                lsrd
                ldaa    <byte_FF
                asla
                asla
                sba
                adda    byte_8F37
                bmi     loc_E588
                ldab    byte_120
                bpl     loc_E580
                comb
                incb

loc_E580:                               ; CODE XREF: sub_E0ED+48F↑j
                cba
                ble     loc_E595
                staa    byte_120
                bra     loc_E595
; ---------------------------------------------------------------------------

loc_E588:                               ; CODE XREF: sub_E0ED+48A↑j
                ldab    byte_120
                bmi     loc_E58F
                comb
                incb

loc_E58F:                               ; CODE XREF: sub_E0ED+49E↑j
                cba
                bge     loc_E595
                staa    byte_120

loc_E595:                               ; CODE XREF: sub_E0ED:loc_E564↑j
                                        ; sub_E0ED+494↑j ...
                ldd     FDRVar0
                subd    <byte_78
                bne     loc_E59F
                clr     byte_11F

loc_E59F:                               ; CODE XREF: sub_E0ED+4AD↑j
                std     FDRVar0
                clra
                ldab    byte_11F
                bpl     loc_E5A9
                deca

loc_E5A9:                               ; CODE XREF: sub_E0ED+4B9↑j
                addd    FDRVar0
                asra
                rorb
                bsr     sub_E5B5

loc_E5B0:                               ; CODE XREF: sub_E0ED+3CE↑J
                stab    byte_11F
                bra     loc_E5C6
; END OF FUNCTION CHUNK FOR sub_E0ED

; =============== S U B R O U T I N E =======================================


sub_E5B5:                               ; CODE XREF: sub_E0ED+4C1↑p
                                        ; sub_E746+E↓P ...
                lsld
                bcs     loc_E5BE
                tsta
                beq     loc_E5C4
                ldab    #$7F
                rts
; ---------------------------------------------------------------------------

loc_E5BE:                               ; CODE XREF: sub_E5B5+1↑j
                cmpa    #$FF
                beq     loc_E5C3
                clrb

loc_E5C3:                               ; CODE XREF: sub_E5B5+B↑j
                sec

loc_E5C4:                               ; CODE XREF: sub_E5B5+4↑j
                rorb
                rts
; End of function sub_E5B5

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_E0ED

loc_E5C6:                               ; CODE XREF: sub_E0ED+4C6↑j
                brset   <byte_5F $80 loc_E625
                ldx     #byte_8F50
                clrb
                ldaa    <byte_FF
                brclr   <byte_5F $18 loc_E5D7
                ldaa    byte_122

loc_E5D7:                               ; CODE XREF: sub_E0ED+4E3↑j
                lsrd
                lsrd
                lsrd
                subd    <byte_78
                bcc     loc_E628
                bclr    <byte_5F 4
                ldx     #byte_8F41
                coma
                comb
                addd    #1
                stab    FDRVar0
                tsta
                beq     loc_E5F6
                psha
                ldaa    #$FF
                staa    FDRVar0
                pula

loc_E5F6:                               ; CODE XREF: sub_E0ED+500↑j
                lsrd
                lsrd
                brclr   <byte_5F $10 loc_E606
                ldx     #byte_8FE4
                tsta
                beq     loc_E63E
                ldaa    #$FF
                bra     loc_E63F
; ---------------------------------------------------------------------------

loc_E606:                               ; CODE XREF: sub_E0ED+50B↑j
                tsta
                bne     loc_E61B
                cmpb    byte_8F1C
                bcc     loc_E61B
                tba
                ldab    FDRVar0
                cmpa    byte_8F1D
                bcs     loc_E63E
                ldaa    #5
                bra     loc_E61D
; ---------------------------------------------------------------------------

loc_E61B:                               ; CODE XREF: sub_E0ED+51A↑j
                                        ; sub_E0ED+51F↑j
                ldaa    #$F

loc_E61D:                               ; CODE XREF: sub_E0ED+52C↑j
                oraa    #$80
                staa    byte_11E
                jsr     sub_E776

loc_E625:                               ; CODE XREF: sub_E0ED:loc_E5C6↑j
                jmp     loc_E795
; ---------------------------------------------------------------------------

loc_E628:                               ; CODE XREF: sub_E0ED+4EF↑j
                brclr   <byte_5F $C loc_E631
                ldx     #byte_8F67
                lsrd
                lsrd

loc_E631:                               ; CODE XREF: sub_E0ED:loc_E628↑j
                tsta
                beq     loc_E636
                ldab    #$FF

loc_E636:                               ; CODE XREF: sub_E0ED+545↑j
                cmpb    byte_8F20
                bcc     loc_E63E
                bclr    <byte_5F 4

loc_E63E:                               ; CODE XREF: sub_E0ED+513↑j
                                        ; sub_E0ED+528↑j ...
                tba

loc_E63F:                               ; CODE XREF: sub_E0ED+517↑j
                jsr     sub_F0B5
                clra
                tstb
                bpl     loc_E647
                deca

loc_E647:                               ; CODE XREF: sub_E0ED+557↑j
                std     FDRVar0
                ldx     #byte_8FCA
                ldaa    <byte_77
                jsr     sub_F0B5
                staa    FDRVar3
                ldx     #byte_8FBB
                ldd     <byte_78
                lsld
                lsld
                lsld
                jsr     sub_F0B5
                adda    FDRVar3
                bcc     loc_E667
                ldaa    #$FF

loc_E667:                               ; CODE XREF: sub_E0ED+576↑j
                staa    FDRVar3
                clra
                staa    FDRVar2
                ldab    byte_11F
                bpl     loc_E674
                deca

loc_E674:                               ; CODE XREF: sub_E0ED+584↑j
                lsld
                lsld
                addd    FDRVar0
                std     FDRVar0
                brset   <byte_60 4 loc_E6A8
                bpl     loc_E687
                coma
                comb
                addd    #1

loc_E687:                               ; CODE XREF: sub_E0ED+593↑j
                tsta
                beq     loc_E68C
                ldab    #$FF

loc_E68C:                               ; CODE XREF: sub_E0ED+59B↑j
                cmpb    byte_8F2A
                bhi     loc_E6A8
                clrb
                ldaa    <byte_FF
                lsrd
                lsrd
                lsrd
                subd    <byte_78
                bpl     loc_E6A0
                coma
                comb
                addd    #1

loc_E6A0:                               ; CODE XREF: sub_E0ED+5AC↑j
                tsta
                bne     loc_E6A8
                cmpb    byte_8F2B
                bls     loc_E6CB

loc_E6A8:                               ; CODE XREF: sub_E0ED+58F↑j
                                        ; sub_E0ED+5A2↑j ...
                clra
                ldab    byte_11D
                bpl     loc_E6AF
                deca

loc_E6AF:                               ; CODE XREF: sub_E0ED+5BF↑j
                addd    FDRVar0
                staa    STe_648A
                bpl     loc_E6BC
                coma
                comb
                addd    #1

loc_E6BC:                               ; CODE XREF: sub_E0ED+5C8↑j
                cpd     FDRVar2
                bcc     loc_E6CE
                ldaa    STe_648A
                bpl     loc_E6C8
                negb

loc_E6C8:                               ; CODE XREF: sub_E0ED+5D8↑j
                stab    byte_11D

loc_E6CB:                               ; CODE XREF: sub_E0ED+5B9↑j
                                        ; sub_E0ED+5EF↓j ...
                jmp     loc_E795
; ---------------------------------------------------------------------------

loc_E6CE:                               ; CODE XREF: sub_E0ED+5D3↑j
                clra
                staa    byte_11D
                ldaa    STe_648A
                anda    #$80
                ldab    byte_11E
                beq     loc_E6E4
                bpl     loc_E6CB
                tab
                eorb    byte_11E
                bpl     loc_E6CB

loc_E6E4:                               ; CODE XREF: sub_E0ED+5ED↑j
                ldab    <byte_77
                tsta
                bpl     loc_E713
                oraa    byte_8F2E
                brclr   <byte_5F $10 loc_E6F5
                adda    byte_8F30
                bra     loc_E73D
; ---------------------------------------------------------------------------

loc_E6F5:                               ; CODE XREF: sub_E0ED+5FF↑j
                staa    STe_648A
                clra
                cmpb    byte_8F21
                bcs     loc_E73D
                ldx     #byte_9009
                stx     FDRVar2
                ldx     #byte_9014
                bsr     sub_E746
                oraa    #$80
                ldab    STe_648A
                cba
                bcc     loc_E73D
                bra     loc_E73C
; ---------------------------------------------------------------------------

loc_E713:                               ; CODE XREF: sub_E0ED+5FA↑j
                cmpb    byte_8F22
                bcc     loc_E73D
                oraa    byte_8F2D
                brclr   <byte_5F 8 loc_E724
                adda    byte_8F2F
                bra     loc_E73D
; ---------------------------------------------------------------------------

loc_E724:                               ; CODE XREF: sub_E0ED+62E↑j
                brset   <byte_5F 4 loc_E73D
                staa    STe_648A
                ldx     #byte_8FF3
                stx     FDRVar2
                ldx     #byte_8FFE
                bsr     sub_E746
                ldab    STe_648A
                cba
                bcc     loc_E73D

loc_E73C:                               ; CODE XREF: sub_E0ED+624↑j
                tba

loc_E73D:                               ; CODE XREF: sub_E0ED+606↑j
                                        ; sub_E0ED+60F↑j ...
                staa    byte_11E
                jsr     sub_E776
                jmp     loc_E795
; END OF FUNCTION CHUNK FOR sub_E0ED

; =============== S U B R O U T I N E =======================================


sub_E746:                               ; CODE XREF: sub_E0ED+61A↑p
                                        ; sub_E0ED+647↑p
                clrb
                ldaa    <byte_FF
                lsrd
                lsrd
                lsrd
                subd    <byte_78
                asra
                rorb
                asra
                rorb
                asra
                rorb
                jsr     sub_E5B5
                tba
                adda    #$80
                jsr     sub_F0B5
                ldx     FDRVar2
                staa    FDRVar2
                ldd     FDRVar0
                jsr     sub_E5B5
                tba
                adda    #$80
                jsr     sub_F0B5
                ldab    FDRVar2
                mul
                adca    #0
                rts
; End of function sub_E746


; =============== S U B R O U T I N E =======================================


sub_E776:                               ; CODE XREF: sub_E0ED+297↑P
                                        ; sub_E0ED+535↑P ...
                brset   <byte_52 2 locret_E794
                ldx     #byte_901F
                ldaa    <byte_6B
                jsr     sub_F0B5
                ldab    byte_11E
                andb    #$7F
                mul
                adca    #0
                ldab    byte_11E
                bpl     loc_E791
                oraa    #$80

loc_E791:                               ; CODE XREF: sub_E776+17↑j
                staa    byte_11E

locret_E794:                            ; CODE XREF: sub_E776↑j
                rts
; End of function sub_E776

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_E0ED

loc_E795:                               ; CODE XREF: sub_E0ED+3C6↑J
                                        ; sub_E0ED:loc_E625↑J ...
                ldaa    <byte_F0
                anda    #$3F ; '?'
                brset   <byte_5F $80 loc_E7B1
                ldab    byte_11E
                beq     loc_E7B3
                bpl     loc_E7B5
                brclr   <byte_5F $10 loc_E7B1
                ldab    byte_121
                incb
                beq     loc_E7B1
                stab    byte_121

loc_E7B1:                               ; CODE XREF: sub_E0ED+6AC↑j
                                        ; sub_E0ED+6B7↑j ...
                oraa    #$C0

loc_E7B3:                               ; CODE XREF: sub_E0ED+6B3↑j
                oraa    #$80

loc_E7B5:                               ; CODE XREF: sub_E0ED+6B5↑j
                bclr    <byte_4E 1
                tab
                eorb    <byte_F0
                andb    #$C0
                beq     loc_E7C2
                bset    <byte_4E 1

loc_E7C2:                               ; CODE XREF: sub_E0ED+6D0↑j
                staa    <byte_F0
                ldab    byte_11E
                beq     loc_E7D6
                lsld
                tstb
                beq     loc_E7D2
                subb    #2
                beq     loc_E7D2
                lsrd

loc_E7D2:                               ; CODE XREF: sub_E0ED+6DE↑j
                                        ; sub_E0ED+6E2↑j
                stab    byte_11E
                rts
; ---------------------------------------------------------------------------

loc_E7D6:                               ; CODE XREF: sub_E0ED+6DA↑j
                brclr   <byte_60 1 locret_E7DD
                bset    <byte_60 2

locret_E7DD:                            ; CODE XREF: sub_E0ED:loc_E7D6↑j
                rts
; END OF FUNCTION CHUNK FOR sub_E0ED

; =============== S U B R O U T I N E =======================================


sub_E7DE:                               ; CODE XREF: __RESET+6F2↑P
                dec     byte_12E
                beq     loc_E7E5
                bra     loc_E82D
; ---------------------------------------------------------------------------

loc_E7E5:                               ; CODE XREF: sub_E7DE+3↑j
                ldaa    byte_9026
                staa    byte_12E
                ldx     #byte_9027
                ldy     #$12F
                ldd     <byte_6B
                subd    byte_12C
                lsld
                lsld
                lsld
                addd    #$8000
                jsr     sub_E85F
                subd    #$8000
                ldx     #6

loc_E806:                               ; CODE XREF: sub_E7DE+2B↓j
                asra
                rorb
                dex
                bne     loc_E806
                bclr    <byte_5E $40 ; '@'
                cpd     word_9029
                blt     loc_E828
                bset    <byte_5E $40 ; '@'
                ldab    byte_902D
                stab    byte_131
                ldab    <byte_6E
                stab    byte_132
                ldab    byte_902F
                stab    byte_133

loc_E828:                               ; CODE XREF: sub_E7DE+34↑j
                ldd     <byte_6B
                std     byte_12C

loc_E82D:                               ; CODE XREF: sub_E7DE+5↑j
                brclr   <byte_54 $20 locret_E85E ; ' '
                dec     byte_133
                beq     loc_E85B
                ldd     <byte_6B
                cpd     word_902B
                bmi     loc_E85B
                dec     byte_131
                bne     locret_E85E
                ldab    byte_902D
                stab    byte_131
                ldaa    <byte_6E
                ldab    byte_132
                staa    byte_132
                sba
                bmi     locret_E85E
                cmpa    byte_902E
                bpl     loc_E85B
                bra     locret_E85E
; ---------------------------------------------------------------------------

loc_E85B:                               ; CODE XREF: sub_E7DE+56↑j
                                        ; sub_E7DE+5E↑j ...
                bclr    <byte_54 $20 ; ' '

locret_E85E:                            ; CODE XREF: sub_E7DE:loc_E82D↑j
                                        ; sub_E7DE+63↑j ...
                rts
; End of function sub_E7DE


; =============== S U B R O U T I N E =======================================


sub_E85F:                               ; CODE XREF: sub_E7DE+1F↑P
                subd    0,y
                pshy
                bcs     loc_E871
                xgdy
                ldaa    1,x
                jsr     sub_F06D
                xgdy
                bra     loc_E882
; ---------------------------------------------------------------------------

loc_E871:                               ; CODE XREF: sub_E85F+5↑j
                nega
                negb
                sbca    #0
                xgdy
                ldaa    0,x
                jsr     sub_F06D
                xgdy
                nega
                negb
                sbca    #0

loc_E882:                               ; CODE XREF: sub_E85F+10↑j
                puly
                addd    0,y
                std     0,y
                rts
; End of function sub_E85F


; =============== S U B R O U T I N E =======================================


sub_E88B:                               ; CODE XREF: __RESET+191↑P
                                        ; sub_96AC+139↑P
                ldaa    <byte_7F
                ldx     #byte_E8B3
                ldab    byte_8011
                cmpb    #0
                beq     loc_E89A
                ldx     #byte_E8A0

loc_E89A:                               ; CODE XREF: sub_E88B+A↑j
                jsr     sub_F0B5
                staa    <byte_7D
                rts
; End of function sub_E88B

; ---------------------------------------------------------------------------
byte_E8A0:      fcb 5                   ; DATA XREF: sub_E88B+C↑o
                fcb $79, $EB, $FF, $D2
                fcb $84, $E9, $FF, $A3
                fcb $9A, $E1, $FF, $A3
                fcb $B0, $D9, $FF, $D6
                fcb $BC, $D7
byte_E8B3:      fcb 5                   ; DATA XREF: sub_E88B+2↑o
                fcb $87, $EB, $FF, $A6
                fcb $8A, $EA, $FF, $A3
                fcb $9D, $E3, $FF, $9E
                fcb $B7, $D9, $FF, $C1
                fcb $BF, $D7

; =============== S U B R O U T I N E =======================================


sub_E8C6:                               ; CODE XREF: OC1I+3B↑P
                ldx     #SwitchPortAccessReg1
                ldaa    byte_128
                cmpa    #$D
                bne     loc_E8D3
                jmp     loc_E96B
; ---------------------------------------------------------------------------

loc_E8D3:                               ; CODE XREF: sub_E8C6+8↑j
                                        ; sub_E8C6+10↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_E8D3
                ldaa    ADR2            ; A_D Result Register 2
                jsr     sub_F1F4
                staa    byte_129
                cli
                cmpa    <byte_76
                bcc     loc_E8E8
                staa    <byte_76

loc_E8E8:                               ; CODE XREF: sub_E8C6+1E↑j
                ldaa    <byte_6B
                cmpa    #$C
                bcs     loc_E8F6
                cmpa    #$10
                bcc     loc_E8FB
                brset   <byte_4C 1 loc_E8FB

loc_E8F6:                               ; CODE XREF: sub_E8C6+26↑j
                bclr    <byte_4C 1
                bra     loc_E964
; ---------------------------------------------------------------------------

loc_E8FB:                               ; CODE XREF: sub_E8C6+2A↑j
                                        ; sub_E8C6+2C↑j
                bset    <byte_4C 1
                ldaa    byte_129
                cmpa    #$41 ; 'A'
                bcc     loc_E90B
                ldab    <byte_65
                bitb    #6
                bne     loc_E964

loc_E90B:                               ; CODE XREF: sub_E8C6+3D↑j
                brclr   <byte_49 $10 loc_E92A
                ldaa    byte_170
                bne     loc_E91A
                ldaa    byte_129
                staa    byte_170

loc_E91A:                               ; CODE XREF: sub_E8C6+4C↑j
                suba    byte_129
                bls     loc_E964
                cmpa    byte_9050
                bls     loc_E964
                bset    <byte_49 $20 ; ' '
                bclr    <byte_49 $10

loc_E92A:                               ; CODE XREF: sub_E8C6:loc_E90B↑j
                clr     byte_170
                ldaa    byte_129
                suba    <byte_7D
                bne     loc_E93A
                brclr   0,x 4 loc_E95B
                bra     loc_E964
; ---------------------------------------------------------------------------

loc_E93A:                               ; CODE XREF: sub_E8C6+6C↑j
                ldab    #7
                bcc     loc_E94E
                nega
                cmpa    #2
                beq     loc_E947
                bcc     loc_E95B
                ldab    #3

loc_E947:                               ; CODE XREF: sub_E8C6+7B↑j
                andb    byte_151
                beq     loc_E964
                bra     loc_E95B
; ---------------------------------------------------------------------------

loc_E94E:                               ; CODE XREF: sub_E8C6+76↑j
                cmpa    #2
                beq     loc_E956
                bcc     loc_E964
                ldab    #3

loc_E956:                               ; CODE XREF: sub_E8C6+8A↑j
                andb    byte_151
                bne     loc_E964

loc_E95B:                               ; CODE XREF: sub_E8C6+6E↑j
                                        ; sub_E8C6+7D↑j ...
                sei
                bset    0,x 4
                bset    <byte_4C 2
                bra     loc_E96B
; ---------------------------------------------------------------------------

loc_E964:                               ; CODE XREF: sub_E8C6+33↑j
                                        ; sub_E8C6+43↑j ...
                sei
                bclr    0,x 4
                bclr    <byte_4C 2

loc_E96B:                               ; CODE XREF: sub_E8C6+A↑J
                                        ; sub_E8C6+9C↑j
                bset    2,x 4
                ldaa    #$14

loc_E970:                               ; CODE XREF: sub_E8C6+AB↓j
                deca
                bne     loc_E970
                bclr    2,x 4
                cli
                rts
; End of function sub_E8C6


; =============== S U B R O U T I N E =======================================


sub_E978:                               ; CODE XREF: __RESET+758↑P
                brclr   <byte_7B $10 loc_E97F
                bclr    <byte_52 1

loc_E97F:                               ; CODE XREF: sub_E978↑j
                brset   <byte_4F 1 loc_E99D
                ldab    <byte_4D
                andb    #$10
                stab    Temp5_t3
                ldab    <byte_7B
                andb    #$10
                eorb    Temp5_t3
                beq     locret_E9A0
                eorb    <byte_4D
                orab    #$80
                stab    <byte_4D
                bclr    <byte_4A 4
                rts
; ---------------------------------------------------------------------------

loc_E99D:                               ; CODE XREF: sub_E978:loc_E97F↑j
                bclr    <byte_4D $90

locret_E9A0:                            ; CODE XREF: sub_E978+19↑j
                rts
; End of function sub_E978


; =============== S U B R O U T I N E =======================================


sub_E9A1:                               ; CODE XREF: __RESET+701↑P
                brclr   <byte_48 $40 loc_E9EB ; '@'
                ldaa    <byte_C1
                cmpa    #$80
                bcs     loc_E9E9
                ldaa    <byte_6B
                ldx     #byte_8027
                jsr     sub_F0B5
                adda    <byte_C1
                bcc     loc_E9B9
                ldaa    #$FF

loc_E9B9:                               ; CODE XREF: sub_E9A1+14↑j
                cmpa    <byte_8
                bls     loc_E9C3
                ldab    <byte_8
                incb
                bne     loc_E9DD
                rts
; ---------------------------------------------------------------------------

loc_E9C3:                               ; CODE XREF: sub_E9A1+1A↑j
                ldab    <byte_77
                cmpb    byte_803A
                bcs     loc_E9E2
                ldab    byte_13C
                cmpb    byte_803B
                bcs     loc_E9E3
                cmpa    <byte_8
                bcc     loc_E9E3
                ldab    <byte_8
                decb
                cmpb    #$80
                bcs     loc_E9E2

loc_E9DD:                               ; CODE XREF: sub_E9A1+1F↑j
                                        ; sub_E9A1+79↓j ...
                stab    <byte_8

loc_E9DF:                               ; CODE XREF: sub_E9A1+4F↓j
                                        ; sub_E9A1+75↓j
                bclr    <byte_2 8

loc_E9E2:                               ; CODE XREF: sub_E9A1+27↑j
                                        ; sub_E9A1+3A↑j ...
                clrb

loc_E9E3:                               ; CODE XREF: sub_E9A1+2F↑j
                                        ; sub_E9A1+33↑j
                incb
                bmi     loc_E9E9
                stab    byte_13C

loc_E9E9:                               ; CODE XREF: sub_E9A1+8↑j
                                        ; sub_E9A1+43↑j ...
                cli
                rts
; ---------------------------------------------------------------------------

loc_E9EB:                               ; CODE XREF: sub_E9A1↑j
                brclr   <byte_2 8 loc_E9E2
                sei
                brclr   <byte_2 1 loc_E9DF
                ldaa    <byte_65
                adda    byte_13C
                bcs     loc_EA00
                cmpa    byte_803C
                bcs     loc_E9E9

loc_EA00:                               ; CODE XREF: sub_E9A1+58↑j
                                        ; sub_E9A1+62↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_EA00
                ldaa    ADR1            ; A_D Result Register 1
                jsr     sub_F2EC
                tab
                suba    byte_155
                cli
                bcc     loc_EA18
                nega
                cmpa    byte_803D
                bhi     loc_E9DF

loc_EA18:                               ; CODE XREF: sub_E9A1+6F↑j
                cmpb    #$80
                bcc     loc_E9DD
                ldab    #$F0
                bra     loc_E9DD
; End of function sub_E9A1

; ---------------------------------------------------------------------------
byte_EA20:      fcb 7                   ; DATA XREF: __RESET+323↑o
                                        ; __RESET+46B↑o ...
                fcb 0, $D3, $FF, $85
                fcb $53, $AB, $FF, $9D
                fcb $D7, $78, $FF, $55
                fcb $E6, $6E, $FF, $17
                fcb $F1, $64, $FE, $CD
                fcb $F6, $5E, $FD, $AB
                fcb $FF, $49
byte_EA3B:      fcb 4                   ; DATA XREF: __RESET+31C↑o
                                        ; __RESET+464↑o ...
                fcb $42, $FF, $FF, $55
                fcb $57, $F1, $FF, $75
                fcb $C5, $B5, $FF, $4F
                fcb $FF, $8D

; =============== S U B R O U T I N E =======================================


sub_EA4A:                               ; CODE XREF: __RESET+6FB↑P
                ldab    <byte_65
                bitb    #7
                beq     loc_EA53
                jmp     locret_EAC9
; ---------------------------------------------------------------------------

loc_EA53:                               ; CODE XREF: sub_EA4A+4↑j
                ldaa    <byte_74
                ldx     #byte_EA3B
                brclr   <byte_F1 $10 loc_EA7D
                ldx     #byte_EA20
                cmpa    #$40 ; '@'
                bcc     loc_EA81

loc_EA63:                               ; CODE XREF: sub_EA4A+35↓j
                brset   <byte_4A 3 loc_EA6E
                ldab    <byte_4A
                addb    #1
                stab    <byte_4A
                rts
; ---------------------------------------------------------------------------

loc_EA6E:                               ; CODE XREF: sub_EA4A:loc_EA63↑j
                sei
                bclr    <byte_4A 3
                ldab    <byte_F1
                eorb    #$10
                stab    <byte_F1
                stab    PIA3_Buffer_2_t3
                cli
                rts
; ---------------------------------------------------------------------------

loc_EA7D:                               ; CODE XREF: sub_EA4A+E↑j
                cmpa    #$DC
                bcc     loc_EA63

loc_EA81:                               ; CODE XREF: sub_EA4A+17↑j
                bclr    <byte_4A 3
                cmpa    byte_9046
                bhi     loc_EAAD
                cmpa    byte_9045
                bcs     loc_EAB2
                brclr   <byte_F2 2 loc_EA99
                ldaa    #2
                jsr     sub_B0B7
                bra     locret_EAC9
; ---------------------------------------------------------------------------

loc_EA99:                               ; CODE XREF: sub_EA4A+44↑j
                jsr     sub_F0B5
                ldab    <byte_72
                sba
                bcc     loc_EAA4
                decb
                bra     loc_EAA9
; ---------------------------------------------------------------------------

loc_EAA4:                               ; CODE XREF: sub_EA4A+55↑j
                cmpa    #3
                bcs     locret_EAC9
                incb

loc_EAA9:                               ; CODE XREF: sub_EA4A+58↑j
                stab    <byte_72
                bra     locret_EAC9
; ---------------------------------------------------------------------------

loc_EAAD:                               ; CODE XREF: sub_EA4A+3D↑j
                ldd     #$1F9E
                bra     loc_EAB5
; ---------------------------------------------------------------------------

loc_EAB2:                               ; CODE XREF: sub_EA4A+42↑j
                ldd     #$1E9E

loc_EAB5:                               ; CODE XREF: sub_EA4A+66↑j
                brset   <byte_F2 2 locret_EAC9
                jsr     sub_AE82
                bcc     locret_EAC9
                bset    <byte_F2 2
                ldaa    byte_9047
                staa    <byte_72
                clr     byte_163

locret_EAC9:                            ; CODE XREF: sub_EA4A+6↑J
                                        ; sub_EA4A+4D↑j ...
                rts
; End of function sub_EA4A


; =============== S U B R O U T I N E =======================================


sub_EACA:                               ; CODE XREF: __RESET+6FE↑P
                ldab    <byte_65
                bitb    #7
                beq     loc_EAD3
                jmp     locret_EB49
; ---------------------------------------------------------------------------

loc_EAD3:                               ; CODE XREF: sub_EACA+4↑j
                ldaa    <byte_73
                ldx     #byte_EA3B
                brclr   <byte_F1 $20 loc_EB00 ; ' '
                ldx     #byte_EA20
                cmpa    #$40 ; '@'
                bcc     loc_EB04

loc_EAE3:                               ; CODE XREF: sub_EACA+38↓j
                brset   <byte_4B 3 loc_EAF1
                ldab    <byte_4B
                addb    #1
                stab    <byte_4B
                ldaa    <byte_73
                bra     loc_EB07
; ---------------------------------------------------------------------------

loc_EAF1:                               ; CODE XREF: sub_EACA:loc_EAE3↑j
                sei
                bclr    <byte_4B 3
                ldab    <byte_F1
                eorb    #$20 ; ' '
                stab    <byte_F1
                stab    PIA3_Buffer_2_t3
                cli
                rts
; ---------------------------------------------------------------------------

loc_EB00:                               ; CODE XREF: sub_EACA+E↑j
                cmpa    #$DC
                bcc     loc_EAE3

loc_EB04:                               ; CODE XREF: sub_EACA+17↑j
                bclr    <byte_4B 3

loc_EB07:                               ; CODE XREF: sub_EACA+25↑j
                cmpa    byte_9049
                bhi     loc_EB30
                cmpa    byte_9048
                bcs     loc_EB35
                brclr   <byte_F2 1 loc_EB1C
                ldaa    #1
                jsr     sub_B0B7
                bra     locret_EB49
; ---------------------------------------------------------------------------

loc_EB1C:                               ; CODE XREF: sub_EACA+47↑j
                jsr     sub_F0B5
                ldab    <byte_6F
                sba
                bcc     loc_EB27
                decb
                bra     loc_EB2C
; ---------------------------------------------------------------------------

loc_EB27:                               ; CODE XREF: sub_EACA+58↑j
                cmpa    #3
                bcs     locret_EB49
                incb

loc_EB2C:                               ; CODE XREF: sub_EACA+5B↑j
                stab    <byte_6F
                bra     locret_EB49
; ---------------------------------------------------------------------------

loc_EB30:                               ; CODE XREF: sub_EACA+40↑j
                ldd     #$3A9E
                bra     loc_EB38
; ---------------------------------------------------------------------------

loc_EB35:                               ; CODE XREF: sub_EACA+45↑j
                ldd     #$399E

loc_EB38:                               ; CODE XREF: sub_EACA+69↑j
                brset   <byte_F2 1 locret_EB49
                jsr     sub_AE82
                bcc     locret_EB49
                bset    <byte_F2 1
                ldaa    byte_904A
                staa    <byte_6F

locret_EB49:                            ; CODE XREF: sub_EACA+6↑J
                                        ; sub_EACA+50↑j ...
                rts
; End of function sub_EACA


; =============== S U B R O U T I N E =======================================


sub_EB4A:                               ; CODE XREF: sub_96AC+136↑P
                ldaa    byte_154
                ldab    byte_156
                mul
                std     FDRVar1
                ldab    byte_154
                subb    byte_156
                bls     loc_EB9D
                clra
                xgdx
                ldd     FDRVar1
                aslb
                adca    #0
                tab
                abx
                ldd     FDRVar1
                idiv
                xgdx
                tsta
                bne     loc_EB9D
                stab    FDRVar0
                ldaa    FDRVar0
                ldx     #byte_EBB2
                jsr     sub_F0B5
                tab
                suba    <byte_7F
                bcc     loc_EB8D
                cmpa    #$F0
                bhi     loc_EB99
                ldab    <byte_7F
                subb    #$10
                bcc     loc_EB99
                ldab    #0
                bra     loc_EB99
; ---------------------------------------------------------------------------

loc_EB8D:                               ; CODE XREF: sub_EB4A+33↑j
                cmpa    #$10
                bls     loc_EB99
                ldab    <byte_7F
                addb    #$10
                bcc     loc_EB99
                ldab    #$FF

loc_EB99:                               ; CODE XREF: sub_EB4A+37↑j
                                        ; sub_EB4A+3D↑j ...
                stab    <byte_7F
                bra     locret_EBB1
; ---------------------------------------------------------------------------

loc_EB9D:                               ; CODE XREF: sub_EB4A+10↑j
                                        ; sub_EB4A+22↑j
                brset   <byte_F2 2 locret_EBB1
                ldaa    <byte_72
                cmpa    #$C1
                bcc     locret_EBB1
                ldd     #$4708
                jsr     sub_AE82
                ldaa    #$C1
                staa    <byte_7F

locret_EBB1:                            ; CODE XREF: sub_EB4A+51↑j
                                        ; sub_EB4A:loc_EB9D↑j ...
                rts
; End of function sub_EB4A

; ---------------------------------------------------------------------------
byte_EBB2:      fcb 6                   ; DATA XREF: __RESET+182↑o
                                        ; sub_EB4A+2A↑o
                fcb 5, $FF, $FC, $C0
                fcb $15, $CB, $FE, $F8
                fcb $32, $AD, $FF, $83
                fcb $6F, $8F, $FF, $96
                fcb $C8, $6C, $FF, $56
                fcb $E7, $58

; =============== S U B R O U T I N E =======================================


sub_EBC9:                               ; CODE XREF: __RESET+6DC↑P
                clr     STe_648A
                clr     FDRVar3
                ldaa    <byte_8
                suba    <byte_6D
                bcc     loc_EBD6
                clra

loc_EBD6:                               ; CODE XREF: sub_EBC9+A↑j
                staa    FDRVar2
                brset   <byte_59 4 loc_EBEA
                ldaa    <byte_75
                cmpa    byte_905F
                bcc     loc_EBEA
                ldaa    <byte_59
                adda    #1
                staa    <byte_59

loc_EBEA:                               ; CODE XREF: sub_EBC9+10↑j
                                        ; sub_EBC9+19↑j
                ldaa    <byte_F2
                bita    #$88
                bne     loc_EC41
                brset   <byte_59 8 loc_EC0F
                ldaa    <byte_6B
                cmpa    byte_905D
                bcs     loc_EC1B
                ldaa    <byte_8
                cmpa    byte_9062
                bcc     loc_EC07
                ldaa    byte_9061
                bra     loc_EC0A
; ---------------------------------------------------------------------------

loc_EC07:                               ; CODE XREF: sub_EBC9+37↑j
                ldaa    byte_9060

loc_EC0A:                               ; CODE XREF: sub_EBC9+3C↑j
                cmpa    FDRVar2
                bcc     loc_EC1B

loc_EC0F:                               ; CODE XREF: sub_EBC9+27↑j
                ldaa    <byte_75
                cmpa    byte_905F
                bcs     loc_EC1B
                com     STe_648A
                bra     loc_EC4E
; ---------------------------------------------------------------------------

loc_EC1B:                               ; CODE XREF: sub_EBC9+30↑j
                                        ; sub_EBC9+44↑j ...
                brset   <byte_56 8 loc_EC35
                ldaa    <byte_7A
                cmpa    byte_905C
                bcs     loc_EC41
                ldaa    <byte_6B
                cmpa    byte_905D
                bcs     loc_EC41
                ldaa    FDRVar2
                cmpa    byte_905E
                bcc     loc_EC41

loc_EC35:                               ; CODE XREF: sub_EBC9:loc_EC1B↑j
                ldaa    <byte_75
                cmpa    byte_905B
                bcc     loc_EC41
                com     FDRVar3
                bra     loc_EC58
; ---------------------------------------------------------------------------

loc_EC41:                               ; CODE XREF: sub_EBC9+25↑j
                                        ; sub_EBC9+5B↑j ...
                sei
                ldaa    <byte_75
                cmpa    byte_9058
                bcs     loc_EC58
                cmpa    byte_9059
                bcs     loc_EC96

loc_EC4E:                               ; CODE XREF: sub_EBC9+50↑j
                cli
                brclr   <byte_65 1 loc_ECB4
                ldd     #$1BA0
                bra     loc_EC60
; ---------------------------------------------------------------------------

loc_EC58:                               ; CODE XREF: sub_EBC9+76↑j
                                        ; sub_EBC9+7E↑j
                cli
                brclr   <byte_65 1 loc_ECB4
                ldd     #$1AA0

loc_EC60:                               ; CODE XREF: sub_EBC9+8D↑j
                brset   <byte_F2 $40 loc_EC80 ; '@'
                jsr     sub_AE82
                ldaa    <byte_6E
                bcc     loc_ECB4
                bset    <byte_F2 $40 ; '@'
                tst     STe_648A
                beq     loc_EC78
                bset    <byte_59 8
                bra     loc_EC80
; ---------------------------------------------------------------------------

loc_EC78:                               ; CODE XREF: sub_EBC9+A8↑j
                tst     FDRVar3
                beq     loc_EC80
                bset    <byte_56 8

loc_EC80:                               ; CODE XREF: sub_EBC9:loc_EC60↑j
                                        ; sub_EBC9+AD↑j ...
                ldaa    #$40 ; '@'
                staa    <byte_3
                brclr   <byte_48 $40 loc_EC92 ; '@'
                ldab    <byte_6D
                cmpb    byte_905A
                bcs     loc_EC92
                adda    byte_8022

loc_EC92:                               ; CODE XREF: sub_EBC9+BB↑j
                                        ; sub_EBC9+C4↑j
                staa    <byte_6E
                bra     loc_ECB4
; ---------------------------------------------------------------------------

loc_EC96:                               ; CODE XREF: sub_EBC9+83↑j
                brclr   <byte_F2 $40 loc_ECB2 ; '@'
                cli
                ldaa    <byte_65
                bita    #7
                bne     loc_EC80
                ldaa    #7
                jsr     sub_B0B7
                brset   <byte_F2 $40 loc_EC80 ; '@'
                bclr    <byte_56 8
                bclr    <byte_59 8
                bra     loc_EC80
; ---------------------------------------------------------------------------

loc_ECB2:                               ; CODE XREF: sub_EBC9:loc_EC96↑j
                staa    <byte_6E

loc_ECB4:                               ; CODE XREF: sub_EBC9+86↑j
                                        ; sub_EBC9+90↑j ...
                cli
                brset   <byte_4A $80 loc_ECDF
                ldab    byte_112
                bne     loc_ECDF
                brclr   <byte_48 $40 loc_ECDF ; '@'
                ldab    <byte_64
                beq     loc_ECDF
                cmpa    <byte_3
                bcc     loc_ECDF
                ldaa    byte_153
                deca
                bne     loc_ECE2
                ldab    <byte_3
                cmpb    #1
                bcc     loc_ECD9
                ldab    byte_801E

loc_ECD9:                               ; CODE XREF: sub_EBC9+10B↑j
                decb
                stab    <byte_3
                bclr    <byte_4A $10

loc_ECDF:                               ; CODE XREF: sub_EBC9+EC↑j
                                        ; sub_EBC9+F3↑j ...
                ldaa    byte_801B

loc_ECE2:                               ; CODE XREF: sub_EBC9+105↑j
                staa    byte_153
                ldaa    byte_801C
                ldab    <byte_4A
                bpl     loc_ECEF
                ldaa    byte_801D

loc_ECEF:                               ; CODE XREF: sub_EBC9+121↑j
                adda    <byte_3
                cmpa    <byte_6E
                bcc     loc_ED11
                tstb
                bmi     loc_ED07
                bitb    #$10
                bne     loc_ED07
                ldaa    <byte_3
                inca
                cmpa    <byte_6E
                bcc     loc_ED07
                staa    <byte_3
                orab    #$10

loc_ED07:                               ; CODE XREF: sub_EBC9+12D↑j
                                        ; sub_EBC9+131↑j ...
                orab    #$80
                clr     byte_113
                bclr    <byte_52 1
                bra     loc_ED37
; ---------------------------------------------------------------------------

loc_ED11:                               ; CODE XREF: sub_EBC9+12A↑j
                tstb
                bpl     loc_ED35
                brset   <byte_4D 4 loc_ED1A
                orab    #$20 ; ' '

loc_ED1A:                               ; CODE XREF: sub_EBC9+14B↑j
                stab    FDRVar0
                ldaa    byte_8D55
                ldab    <byte_7A
                cmpb    byte_8021
                bcc     loc_ED2F
                ldx     #byte_8D57
                ldaa    <byte_6B
                jsr     sub_F0B5

loc_ED2F:                               ; CODE XREF: sub_EBC9+15C↑j
                staa    byte_112
                ldab    FDRVar0

loc_ED35:                               ; CODE XREF: sub_EBC9+149↑j
                andb    #$7F

loc_ED37:                               ; CODE XREF: sub_EBC9+146↑j
                bitb    #8
                bne     loc_ED5C
                brclr   <byte_7B $20 loc_ED5C ; ' '
                ldaa    <byte_6B
                cmpa    byte_801F
                bcs     loc_ED5C
                ldaa    <byte_6D
                cmpa    byte_8020
                bcc     loc_ED5C
                ldaa    <byte_3
                inca
                cmpa    byte_801E
                bcs     loc_ED58
                ldaa    byte_801E

loc_ED58:                               ; CODE XREF: sub_EBC9+18A↑j
                staa    <byte_3
                orab    #8

loc_ED5C:                               ; CODE XREF: sub_EBC9+170↑j
                                        ; sub_EBC9+172↑j ...
                ldaa    <byte_3
                adda    #$30 ; '0'
                cmpa    <byte_6E
                bcc     loc_ED66
                andb    #$F7

loc_ED66:                               ; CODE XREF: sub_EBC9+199↑j
                stab    <byte_4A
                ldaa    <byte_6E
                suba    <byte_3
                bcc     loc_ED6F
                clra

loc_ED6F:                               ; CODE XREF: sub_EBC9+1A3↑j
                staa    <byte_77
                rts
; End of function sub_EBC9


; =============== S U B R O U T I N E =======================================


sub_ED72:                               ; CODE XREF: __RESET+6E6↑P
                ldab    byte_8022
                addb    <byte_3
                bcs     loc_ED7E
                cmpb    byte_8023
                bcs     loc_ED81

loc_ED7E:                               ; CODE XREF: sub_ED72+5↑j
                ldab    byte_8023

loc_ED81:                               ; CODE XREF: sub_ED72+A↑j
                brclr   <byte_4A $40 loc_ED87 ; '@'
                subb    #3

loc_ED87:                               ; CODE XREF: sub_ED72:loc_ED81↑j
                cmpb    <byte_6E
                bcc     loc_ED8F
                bset    <byte_4A $40 ; '@'
                rts
; ---------------------------------------------------------------------------

loc_ED8F:                               ; CODE XREF: sub_ED72+17↑j
                bclr    <byte_4A $40 ; '@'
                rts
; End of function sub_ED72


; =============== S U B R O U T I N E =======================================


sub_ED93:                               ; CODE XREF: __RESET:loc_991F↑P
                brset   <byte_48 $40 loc_ED9D ; '@'
                brset   <byte_4E 4 loc_EDAA
                bra     loc_EDAF
; ---------------------------------------------------------------------------

loc_ED9D:                               ; CODE XREF: sub_ED93↑j
                brset   <byte_4E $40 locret_EDEA ; '@'
                ldd     word_B610
                cpd     #$5AA5
                beq     loc_EDAF

loc_EDAA:                               ; CODE XREF: sub_ED93+4↑j
                bclr    <byte_EF 8
                bra     loc_EDB2
; ---------------------------------------------------------------------------

loc_EDAF:                               ; CODE XREF: sub_ED93+8↑j
                                        ; sub_ED93+15↑j
                bset    <byte_EF 8

loc_EDB2:                               ; CODE XREF: sub_ED93+1A↑j
                brset   <byte_48 $80 loc_EDB9
                jmp     loc_EE6C
; ---------------------------------------------------------------------------

loc_EDB9:                               ; CODE XREF: sub_ED93:loc_EDB2↑j
                brset   <byte_4E $40 locret_EDEA ; '@'
                brclr   <byte_4E $20 loc_EDEB ; ' '
                jsr     sub_EE8F
                stab    byte_162
                inc     byte_161
                bset    <byte_4E $40 ; '@'
                bclr    <byte_4E $20 ; ' '
                sei
                bclr    <byte_48 $80
                cli
                cpd     word_909C
                beq     loc_EDE7
                cpd     word_909E
                beq     loc_EDE7
                cpd     word_90A0
                bne     locret_EDEA

loc_EDE7:                               ; CODE XREF: sub_ED93+46↑j
                                        ; sub_ED93+4C↑j
                bset    <byte_4E $10

locret_EDEA:                            ; CODE XREF: sub_ED93:loc_ED9D↑j
                                        ; sub_ED93:loc_EDB9↑j ...
                rts
; ---------------------------------------------------------------------------

loc_EDEB:                               ; CODE XREF: sub_ED93+2A↑j
                ldx     #$44 ; 'D'
                ldaa    #$30 ; '0'

loc_EDF0:                               ; CODE XREF: sub_ED93+69↓j
                brclr   0,x $FF loc_EDFE
                cmpa    0,x
                beq     loc_EE4E
                dex
                cpx     #$3D ; '='
                bcc     loc_EDF0

loc_EDFE:                               ; CODE XREF: sub_ED93:loc_EDF0↑j
                ldd     #0
                std     STe_648A
                staa    byte_161
                ldx     #$B600
                ldy     #$B60E

loc_EE0E:                               ; CODE XREF: sub_ED93+AC↓j
                ldd     0,x
                subd    0,y
                cpd     #1
                bne     loc_EE2A
                ldd     0,x
                cpd     STe_648A
                bcs     loc_EE2A
                std     STe_648A
                pshx
                pula
                pula
                staa    byte_161

loc_EE2A:                               ; CODE XREF: sub_ED93+84↑j
                                        ; sub_ED93+8C↑j
                cpx     #$B60E
                beq     loc_EE41
                inx
                inx
                cpy     #$B60E
                bne     loc_EE3B
                ldy     #$B5FE

loc_EE3B:                               ; CODE XREF: sub_ED93+A2↑j
                iny
                iny
                bra     loc_EE0E
; ---------------------------------------------------------------------------

loc_EE41:                               ; CODE XREF: sub_ED93+9A↑j
                ldd     STe_648A
                bne     loc_EE54
                ldd     #$3003
                jsr     sub_AE82
                bcc     locret_EE53

loc_EE4E:                               ; CODE XREF: sub_ED93+63↑j
                sei
                bclr    <byte_48 $80
                cli

locret_EE53:                            ; CODE XREF: sub_ED93+B9↑j
                rts
; ---------------------------------------------------------------------------

loc_EE54:                               ; CODE XREF: sub_ED93+B1↑j
                ldaa    byte_161
                adda    #2
                cmpa    #$10
                bne     loc_EE5F
                ldaa    #0

loc_EE5F:                               ; CODE XREF: sub_ED93+C8↑j
                staa    byte_161
                jsr     sub_EE8F
                staa    byte_162
                bset    <byte_4E $60 ; '`'

locret_EE6B:                            ; CODE XREF: sub_ED93:loc_EE6C↓j
                                        ; sub_ED93+DD↓j
                rts
; ---------------------------------------------------------------------------

loc_EE6C:                               ; CODE XREF: sub_ED93+23↑J
                brclr   <byte_4E $10 locret_EE6B
                brset   <byte_4E $40 locret_EE6B ; '@'
                ldd     #$105A
                brclr   <byte_4E $20 loc_EE85 ; ' '
                inca
                comb
                bclr    <byte_4E $30 ; '0'
                bset    <byte_4E $40 ; '@'
                bra     loc_EE88
; ---------------------------------------------------------------------------

loc_EE85:                               ; CODE XREF: sub_ED93+E4↑j
                bset    <byte_4E $60 ; '`'

loc_EE88:                               ; CODE XREF: sub_ED93+F0↑j
                staa    byte_161
                stab    byte_162
                rts
; End of function sub_ED93


; =============== S U B R O U T I N E =======================================


sub_EE8F:                               ; CODE XREF: sub_ED93+2E↑P
                                        ; sub_ED93+CF↑P
                ldx     #$B600
                ldab    byte_161
                subb    #2
                bpl     loc_EE9B
                ldab    #$E

loc_EE9B:                               ; CODE XREF: sub_EE8F+8↑j
                abx
                ldd     0,x
                addd    #1
                bcc     locret_EEA6
                ldd     #$FFFF

locret_EEA6:                            ; CODE XREF: sub_EE8F+12↑j
                rts
; End of function sub_EE8F


; =============== S U B R O U T I N E =======================================


sub_EEA7:                               ; CODE XREF: __RESET+6EF↑P
                brclr   <byte_4C $10 loc_EEC0
                sei
                ldd     <byte_78
                lsrd
                lsrd
                lsrd
                lsrd
                lsrd
                std     STe_648A
                ldd     <byte_78
                subd    STe_648A
                std     <byte_78
                cli
                bra     loc_EEC0
; ---------------------------------------------------------------------------

loc_EEC0:                               ; CODE XREF: sub_EEA7↑j
                                        ; sub_EEA7+17↑j
                clra
                ldab    <byte_7A
                cmpb    byte_8021
                bcc     loc_EED0
                ldx     <byte_6B
                cpx     <byte_80
                bls     loc_EEDD
                bra     loc_EED7
; ---------------------------------------------------------------------------

loc_EED0:                               ; CODE XREF: sub_EEA7+1F↑j
                ldab    <byte_6D
                cmpb    byte_113
                bls     loc_EEDD

loc_EED7:                               ; CODE XREF: sub_EEA7+27↑j
                ldaa    byte_112
                beq     loc_EEE0
                deca

loc_EEDD:                               ; CODE XREF: sub_EEA7+25↑j
                                        ; sub_EEA7+2E↑j
                staa    byte_112

loc_EEE0:                               ; CODE XREF: sub_EEA7+33↑j
                brset   <byte_4A $80 loc_EEF7
                ldab    <byte_7A
                ldaa    byte_8021
                brset   <byte_4A 4 loc_EEEF
                adda    #3

loc_EEEF:                               ; CODE XREF: sub_EEA7+42↑j
                cba
                bcc     loc_EEF7
                bset    <byte_4A 4
                bra     loc_EEFA
; ---------------------------------------------------------------------------

loc_EEF7:                               ; CODE XREF: sub_EEA7:loc_EEE0↑j
                                        ; sub_EEA7+49↑j
                bclr    <byte_4A 4

loc_EEFA:                               ; CODE XREF: sub_EEA7+4E↑j
                ldd     <byte_78
                lsld
                lsld
                lsld
                bcc     loc_EF03
                ldaa    #$FF

loc_EF03:                               ; CODE XREF: sub_EEA7+58↑j
                staa    <byte_7A
                rts
; End of function sub_EEA7

; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR IC2I

loc_EF06:                               ; CODE XREF: IC2I+7↑J
                                        ; RESERVED:loc_AA34↑J
                ldd     <byte_9
                addd    #1
                std     <byte_9
                bne     loc_EF12
                bset    <byte_48 $80

loc_EF12:                               ; CODE XREF: IC2I+44F4↑j
                ldaa    byte_15A
                inca
                beq     loc_EF1B
                staa    byte_15A

loc_EF1B:                               ; CODE XREF: IC2I+44FD↑j
                ldd     <byte_78
                subd    #$500
                ldaa    <byte_4C
                bcc     loc_EF46
                bita    #$10
                bne     loc_EF2C
                oraa    #$10
                bra     loc_EF4D
; ---------------------------------------------------------------------------

loc_EF2C:                               ; CODE XREF: IC2I+450D↑j
                anda    #$1F
                oraa    #8
                staa    <byte_4C
                clra
                staa    byte_149
                staa    byte_148
                staa    byte_108
                ldd     <byte_78
                addd    #$53 ; 'S'
                std     <byte_78
                jmp     loc_EFCE
; ---------------------------------------------------------------------------

loc_EF46:                               ; CODE XREF: IC2I+4509↑j
                bita    #$10
                beq     loc_EF4D
                jmp     loc_EFD4
; ---------------------------------------------------------------------------

loc_EF4D:                               ; CODE XREF: IC2I+4511↑j
                                        ; IC2I+452F↑j
                adda    #$20 ; ' '
                bcs     loc_EF57
                anda    #$EF
                staa    <byte_4C
                bra     loc_EFCE
; ---------------------------------------------------------------------------

loc_EF57:                               ; CODE XREF: IC2I+4536↑j
                staa    <byte_4C
                ldab    byte_149
                beq     loc_EF7D
                bita    #8
                bne     loc_EF7D
                ldaa    #$3A ; ':'
                mul
                adca    #0
                cmpa    #3
                bcc     loc_EF6D
                ldaa    #3

loc_EF6D:                               ; CODE XREF: IC2I+4550↑j
                tab
                ldaa    byte_148
                suba    byte_149
                bcc     loc_EF77
                nega

loc_EF77:                               ; CODE XREF: IC2I+455B↑j
                sba
                bcs     loc_EF83
                bset    <byte_4C 8

loc_EF7D:                               ; CODE XREF: IC2I+4543↑j
                                        ; IC2I+4547↑j
                ldab    byte_148
                stab    byte_149

loc_EF83:                               ; CODE XREF: IC2I+455F↑j
                clra
                staa    byte_148
                ldd     CountdownTimerFromKeyOn
                ldx     #byte_108
                ldy     #LDXi_6485
                jsr     sub_F108
                ldaa    byte_108
                lsra
                tab
                oraa    byte_109
                beq     loc_EFA9
                stab    byte_109
                ldd     CountdownTimerFromKeyOn
                subd    byte_10C
                bra     loc_EFC1
; ---------------------------------------------------------------------------

loc_EFA9:                               ; CODE XREF: IC2I+4583↑j
                ldd     CountdownTimerFromKeyOn
                subd    byte_10C
                subd    byte_10A
                beq     loc_EFC4
                asra
                rorb
                asra
                rorb
                subd    #0
                bne     loc_EFBE
                incb

loc_EFBE:                               ; CODE XREF: IC2I+45A2↑j
                addd    byte_10A

loc_EFC1:                               ; CODE XREF: IC2I+458E↑j
                                        ; IC2I+45C7↓j
                std     byte_10A

loc_EFC4:                               ; CODE XREF: IC2I+4599↑j
                ldd     CountdownTimerFromKeyOn
                std     byte_10C
                clra
                staa    byte_108

loc_EFCE:                               ; CODE XREF: RESERVED:AA31↑J
                                        ; IC2I+452A↑J ...
                ldaa    #2
                staa    TFLG1           ; Timer Interrupt Flag Register 1
                rti
; ---------------------------------------------------------------------------

loc_EFD4:                               ; CODE XREF: IC2I+4531↑J
                anda    #$EF
                staa    <byte_4C
                ldaa    #1
                staa    byte_109
                ldd     #$5F90
                bra     loc_EFC1
; END OF FUNCTION CHUNK FOR IC2I

; =============== S U B R O U T I N E =======================================


sub_EFE2:                               ; CODE XREF: RESERVED:AA26↑P
                                        ; RESERVED:AA2C↑P
                ldaa    TCTL2           ; Timer Control Register 2
                lsra
                eora    PORTA           ; Port A data
                bita    #2
                rts
; End of function sub_EFE2


; =============== S U B R O U T I N E =======================================


sub_EFEC:                               ; CODE XREF: __RESET+6E9↑P
                sei
                jsr     sub_F211
                cli
                std     FDRVar0
                addd    word_14E
                rora
                rorb
                std     FDRVar2
                ldd     FDRVar0
                std     word_14E
                std     <byte_6B
                brset   <byte_4F $20 loc_F00C ; ' '
                brclr   <byte_4F $10 loc_F040

loc_F00C:                               ; CODE XREF: sub_EFEC+18↑j
                brset   <byte_52 2 loc_F01B
                cpd     #$68B0
                bcs     loc_F024
                bset    <byte_52 2
                bra     loc_F024
; ---------------------------------------------------------------------------

loc_F01B:                               ; CODE XREF: sub_EFEC:loc_F00C↑j
                cpd     #$6590
                bcc     loc_F024
                bclr    <byte_52 2

loc_F024:                               ; CODE XREF: sub_EFEC+28↑j
                                        ; sub_EFEC+2D↑j ...
                brclr   <byte_4F $10 loc_F040
                brset   <byte_B4 $10 loc_F037
                cpd     #$6D60
                bcs     loc_F040
                bset    <byte_B4 $10
                bra     loc_F040
; ---------------------------------------------------------------------------

loc_F037:                               ; CODE XREF: sub_EFEC+3C↑j
                cpd     #$68B0
                bcc     loc_F040
                bclr    <byte_B4 $10

loc_F040:                               ; CODE XREF: sub_EFEC+1C↑j
                                        ; sub_EFEC:loc_F024↑j ...
                clra
                ldab    <byte_7A
                std     STe_648A
                ldab    FDRVar2
                lsrb
                aba
                lsrb
                clra
                ldx     STe_648A
                fdiv
                xgdx
                bcc     loc_F056
                ldaa    #$FF

loc_F056:                               ; CODE XREF: sub_EFEC+66↑j
                lsra
                lsra
                staa    STe_648A
                ldaa    byte_13B
                tab
                lsrb

loc_F060:                               ; DATA XREF: sub_CA13+2F↑o
                lsrb
                sba
                adda    STe_648A
                bcc     loc_F069
                ldaa    #$FF

loc_F069:                               ; CODE XREF: sub_EFEC+79↑j
                staa    byte_13B
                rts
; End of function sub_EFEC


; =============== S U B R O U T I N E =======================================


sub_F06D:                               ; CODE XREF: sub_C97D+5A↑P
                                        ; sub_C97D+76↑P ...
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
; End of function sub_F06D


; =============== S U B R O U T I N E =======================================


sub_F081:                               ; CODE XREF: sub_D14D:loc_D22D↑P
                psha
                tba
                ldy     0,x
                bsr     sub_F06D
                sty     UNe_6481
                pula
                psha
                ldab    1,x
                mul
                addd    UNe_6481
                bcs     loc_F0A7
                std     UNe_6481
                ldab    0,x
                pula
                mul
                tsta
                bne     loc_F0A8
                addb    UNe_6481
                bcc     loc_F0AD
                bra     loc_F0A8
; ---------------------------------------------------------------------------

loc_F0A7:                               ; CODE XREF: sub_F081+13↑j
                pula

loc_F0A8:                               ; CODE XREF: sub_F081+1D↑j
                                        ; sub_F081+24↑j
                ldab    #$FF
                stab    UNe_6482

loc_F0AD:                               ; CODE XREF: sub_F081+22↑j
                tba
                ldab    UNe_6482
                std     UNe_6481
                rts
; End of function sub_F081


; =============== S U B R O U T I N E =======================================


sub_F0B5:                               ; CODE XREF: __RESET+185↑P
                                        ; __RESET:loc_9454↑P ...
                ldy     #0
                ldab    0,x
                aby
                inx
                ldab    #4
                cmpa    0,x
                bhi     loc_F0C9

loc_F0C4:                               ; CODE XREF: sub_F0B5+16↓j
                ldaa    1,x
                tab
                bra     loc_F0EA
; ---------------------------------------------------------------------------

loc_F0C9:                               ; CODE XREF: sub_F0B5+D↑j
                                        ; sub_F0B5+1D↓j
                dey
                beq     loc_F0C4
                cmpa    4,x
                bcs     loc_F0D4
                abx
                bra     loc_F0C9
; ---------------------------------------------------------------------------

loc_F0D4:                               ; CODE XREF: sub_F0B5+1A↑j
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

loc_F0EA:                               ; CODE XREF: sub_F0B5+12↑j
                psha
                pula
                rts
; End of function sub_F0B5

; ---------------------------------------------------------------------------
                rts

; =============== S U B R O U T I N E =======================================


sub_F0EE:                               ; CODE XREF: sub_D0F1+C↑P
                                        ; sub_D0F1+20↑P ...
                psha
                tba
                ldy     0,x
                jsr     sub_F06D
                pula
                tsta
                xgdy
                beq     loc_F103
                addd    0,x
                bcc     loc_F103
                ldd     #$FFFF

loc_F103:                               ; CODE XREF: sub_F0EE+C↑j
                                        ; sub_F0EE+10↑j
                psha
                pshb
                pulb
                pula
                rts
; End of function sub_F0EE


; =============== S U B R O U T I N E =======================================


sub_F108:                               ; CODE XREF: sub_96AC+33↑P
                                        ; sub_96AC+A7↑P ...
                subd    4,x
                staa    0,y
                ldaa    0,x
                lsrd
                eorb    0,y
                bpl     loc_F11C
                ldaa    0,x
                inca
                beq     loc_F11C
                staa    0,x

loc_F11C:                               ; CODE XREF: sub_F108+B↑j
                                        ; sub_F108+10↑j
                ldaa    0,x
                lsra
                cmpa    1,x
                bcs     locret_F125
                staa    1,x

locret_F125:                            ; CODE XREF: sub_F108+19↑j
                rts
; End of function sub_F108


; =============== S U B R O U T I N E =======================================


sub_F126:                               ; CODE XREF: sub_B800+49↑P
                                        ; sub_B800+5F↑P ...
                ldy     #loc_F1A3
                brclr   2,x $FF loc_F132
                ldy     #loc_F19F

loc_F132:                               ; CODE XREF: sub_F126+4↑j
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
                beq     loc_F159
                inx
                ldab    #$FF
                abx

loc_F159:                               ; CODE XREF: sub_F126+2D↑j
                ldab    1,y
                abx
                brclr   <byte_B4 8 loc_F165
                xgdx
                stab    <byte_E6
                xgdx

loc_F165:                               ; CODE XREF: sub_F126+37↑j
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
; End of function sub_F126

; ---------------------------------------------------------------------------

loc_F19F:                               ; DATA XREF: sub_F126+8↑o
                blt     loc_F1AB
                bra     loc_F1A5
; ---------------------------------------------------------------------------

loc_F1A3:                               ; DATA XREF: sub_F126↑o
                bcs     loc_F1AB

loc_F1A5:                               ; CODE XREF: ROM_EPROM:F1A1↑j
                mul
                adca    #0
                nega
                bra     loc_F1AF
; ---------------------------------------------------------------------------

loc_F1AB:                               ; CODE XREF: ROM_EPROM:loc_F19F↑j
                                        ; ROM_EPROM:loc_F1A3↑j
                nega
                mul
                adca    #0

loc_F1AF:                               ; CODE XREF: ROM_EPROM:F1A9↑j
                adda    0,x
                rts

; =============== S U B R O U T I N E =======================================


sub_F1B2:                               ; CODE XREF: sub_CEF4+43↑P
                                        ; sub_CEF4+54↑P ...
                suba    0,y
                bcs     loc_F1BC
                ldab    1,x
                mul
                bra     loc_F1C4
; ---------------------------------------------------------------------------

loc_F1BC:                               ; CODE XREF: sub_F1B2+3↑j
                nega
                ldab    0,x
                mul
                nega
                negb
                sbca    #0

loc_F1C4:                               ; CODE XREF: sub_F1B2+8↑j
                addd    0,y
                std     0,y
                rts
; End of function sub_F1B2

; ---------------------------------------------------------------------------
                ldx     #$19
                bra     loc_F1D8
; ---------------------------------------------------------------------------
                ldx     #5
                bra     loc_F1D8

; =============== S U B R O U T I N E =======================================


sub_F1D5:                               ; CODE XREF: sub_F351:loc_F3AF↓P
                                        ; sub_F351:loc_F3C6↓P
                ldx     #1

loc_F1D8:                               ; CODE XREF: ROM_EPROM:F1CE↑j
                                        ; ROM_EPROM:F1D3↑j ...
                ldy     #$242
                jsr     sub_F335

loc_F1DF:                               ; CODE XREF: sub_F1D5+19↓j
                ldaa    SwitchPortAccessReg1
                bita    #$40 ; '@'
                bne     loc_F1E8
                sec
                rts
; ---------------------------------------------------------------------------

loc_F1E8:                               ; CODE XREF: sub_F1D5+F↑j
                jsr     sub_F335
                clc
                dey
                bne     loc_F1DF
                dex
                bne     loc_F1D8
                rts
; End of function sub_F1D5


; =============== S U B R O U T I N E =======================================


sub_F1F4:                               ; CODE XREF: __RESET+21B↑P
                                        ; sub_96AC+6B↑P ...
                ldab    <byte_7E
                cmpb    #$10
                bhi     loc_F20F
                comb
                addb    #9
                bcs     loc_F204
                mul
                adca    #0
                bra     loc_F20F
; ---------------------------------------------------------------------------

loc_F204:                               ; CODE XREF: sub_F1F4+9↑j
                staa    byte_182
                mul
                adca    byte_182
                bcc     loc_F20F
                ldaa    #$FF

loc_F20F:                               ; CODE XREF: sub_F1F4+4↑j
                                        ; sub_F1F4+E↑j ...
                tab
                rts
; End of function sub_F1F4


; =============== S U B R O U T I N E =======================================


sub_F211:                               ; CODE XREF: sub_EFEC+1↑P
                                        ; IC1I:loc_F929↓P
                ldy     #word_117
                ldaa    byte_116
                beq     loc_F224
                dey
                ldd     word_80A4
                ldx     byte_80A6
                bra     sub_F22A
; ---------------------------------------------------------------------------

loc_F224:                               ; CODE XREF: sub_F211+7↑j
                ldd     word_80A0
                ldx     byte_80A2
; End of function sub_F211


; =============== S U B R O U T I N E =======================================


sub_F22A:                               ; CODE XREF: sub_E0ED+3F8↑P
                                        ; sub_F211+11↑j
                pshx
                ldx     0,y
                fdiv
                stx     CountdownTimerFromKeyOn
                pula
                pulb
                ldx     0,y
                idiv
                xgdx
                addd    CountdownTimerFromKeyOn
                bcc     loc_F241
                ldd     #$FFFF

loc_F241:                               ; CODE XREF: sub_F22A+12↑j
                std     CountdownTimerFromKeyOn
                rts
; End of function sub_F22A


; =============== S U B R O U T I N E =======================================


sub_F245:                               ; CODE XREF: sub_9E01+18D↑P
                                        ; sub_CA13+5D↑P ...
                ldaa    <byte_F1
                oraa    #1
                staa    PIA3_Buffer_2_t3
                anda    #$FE
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                ldx     #PORTD          ; Port D Data
                bclr    0,x $20 ; ' '
                ldaa    #$FE
                ldy     #SwitchPortAccessReg1
                cmpa    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                bset    0,y 8
                bset    2,y 8
                bclr    2,y 8
                nop
                ldab    #$16

loc_F274:                               ; CODE XREF: sub_F245+35↓j
                brclr   0,y 8 loc_F27F
                decb
                bne     loc_F274
                jmp     loc_F2D9
; ---------------------------------------------------------------------------

loc_F27F:                               ; CODE XREF: sub_F245:loc_F274↑j
                ldd     word_48C
                cmpa    SPSR            ; SPI Status Register
                stab    SPDR            ; SPI Data Register
                bset    2,y 8
                bclr    2,y 8
                nop
                ldab    #$D

loc_F293:                               ; CODE XREF: sub_F245+54↓j
                brclr   0,y 8 loc_F29D
                decb
                bne     loc_F293
                bra     loc_F2D9
; ---------------------------------------------------------------------------

loc_F29D:                               ; CODE XREF: sub_F245:loc_F293↑j
                ldd     word_48C
                cmpb    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                bset    2,y 8
                bclr    2,y 8
                nop
                ldab    #$D

loc_F2B1:                               ; CODE XREF: sub_F245+72↓j
                brclr   0,y 8 loc_F2BB
                decb
                bne     loc_F2B1
                bra     loc_F2D9
; ---------------------------------------------------------------------------

loc_F2BB:                               ; CODE XREF: sub_F245:loc_F2B1↑j
                ldd     word_48C
                aba
                adda    #$FE
                cmpb    SPSR            ; SPI Status Register
                staa    SPDR            ; SPI Data Register
                bset    2,y 8
                bclr    2,y 8
                nop
                ldab    #$D

loc_F2D2:                               ; CODE XREF: sub_F245+92↓j
                brset   $21,x $80 loc_F2D9
                decb
                bne     loc_F2D2

loc_F2D9:                               ; CODE XREF: sub_F245+37↑J
                                        ; sub_F245+56↑j ...
                cmpa    SPSR            ; SPI Status Register
                ldaa    SPDR            ; SPI Data Register
                ldaa    <byte_F1
                oraa    #1
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                bset    0,x $20 ; ' '
                rts
; End of function sub_F245


; =============== S U B R O U T I N E =======================================


sub_F2EC:                               ; CODE XREF: __RESET+228↑P
                                        ; sub_A730+12↑P ...
                ldab    byte_8024
                beq     loc_F2F2
                mul

loc_F2F2:                               ; CODE XREF: sub_F2EC+3↑j
                addd    byte_8025
                bcc     locret_F2F9
                ldaa    #$FF

locret_F2F9:                            ; CODE XREF: sub_F2EC+9↑j
                rts
; End of function sub_F2EC


; =============== S U B R O U T I N E =======================================


sub_F2FA:                               ; CODE XREF: __RESET+6EC↑P
                                        ; IC1I+EF↓P
                ldx     #byte_8058
                ldd     <byte_6B
                aslb
                adca    #0
                jsr     sub_F0B5
                staa    byte_13E
                rts
; End of function sub_F2FA


; =============== S U B R O U T I N E =======================================


sub_F309:                               ; CODE XREF: __RESET+3A8↑P
                                        ; __RESET+3BA↑P ...
                ldx     #$C
                abx
                ldab    0,x
                cba
                ble     locret_F314
                staa    0,x

locret_F314:                            ; CODE XREF: sub_F309+7↑j
                rts
; End of function sub_F309


; =============== S U B R O U T I N E =======================================


sub_F315:                               ; CODE XREF: __RESET+3FC↑P
                                        ; __RESET+40E↑P ...
                ldx     #$23 ; '#'
                abx
                ldab    0,x
                cba
                ble     locret_F320
                staa    0,x

locret_F320:                            ; CODE XREF: sub_F315+7↑j
                rts
; End of function sub_F315


; =============== S U B R O U T I N E =======================================


sub_F321:                               ; CODE XREF: sub_96AC↑P
                sei
                ldaa    SwitchPortAccessReg1
                eora    #2
                staa    SwitchPortAccessReg1
                cli
; End of function sub_F321


; =============== S U B R O U T I N E =======================================


sub_F32B:                               ; CODE XREF: __RESET:loc_915C↑P
                                        ; sub_F351+F1↓P ...
                ldd     #$55AA
                staa    COPRST          ; Arm_Reset COP Timer Circuitry
                stab    COPRST          ; Arm_Reset COP Timer Circuitry
                rts
; End of function sub_F32B


; =============== S U B R O U T I N E =======================================


sub_F335:                               ; CODE XREF: __RESET+7B↑P
                                        ; __RESET+7E↑P ...
                ldaa    SwitchPortAccessReg1
                anda    #$FD
                staa    SwitchPortAccessReg1
                ldab    #$10

loc_F33F:                               ; CODE XREF: sub_F335+B↓j
                decb
                bne     loc_F33F
                oraa    #2
                staa    SwitchPortAccessReg1
                ldd     #$55AA
                staa    COPRST          ; Arm_Reset COP Timer Circuitry
                stab    COPRST          ; Arm_Reset COP Timer Circuitry
                rts
; End of function sub_F335


; =============== S U B R O U T I N E =======================================


sub_F351:                               ; CODE XREF: __RESET+827↑P
                ldaa    SwitchPortAccessReg1
                bita    #$40 ; '@'
                bne     loc_F36D
                brset   <byte_59 $40 loc_F368 ; '@'
                bset    <byte_59 $40 ; '@'
                bclr    <byte_49 $80
                bclr    <byte_56 $42 ; 'B'
                bclr    <byte_59 $80

loc_F368:                               ; CODE XREF: sub_F351+7↑j
                                        ; sub_F351+51↓j
                clr     byte_177
                cli
                rts
; ---------------------------------------------------------------------------

loc_F36D:                               ; CODE XREF: sub_F351+5↑j
                bclr    <byte_49 $80
                bclr    <byte_56 $42 ; 'B'
                bclr    <byte_59 $C0
                ldaa    byte_177
                bne     loc_F386
                ldaa    #$17
                ldab    byte_116
                cmpb    #4
                bcs     loc_F386
                ldaa    #9

loc_F386:                               ; CODE XREF: sub_F351+28↑j
                                        ; sub_F351+31↑j
                deca
                beq     loc_F38D
                staa    byte_177
                rts
; ---------------------------------------------------------------------------

loc_F38D:                               ; CODE XREF: sub_F351+36↑j
                sei
                clra
                staa    byte_124
                staa    byte_126
                jsr     sub_F335
                jsr     sub_A240
                ldaa    #$20 ; ' '

loc_F39D:                               ; CODE XREF: sub_F351+54↓j
                ldab    SwitchPortAccessReg1
                bitb    #$40 ; '@'
                beq     loc_F368
                deca
                bne     loc_F39D
                jsr     sub_F335
                ldaa    #$32 ; '2'
                staa    FDRVar3

loc_F3AF:                               ; CODE XREF: sub_F351+66↓j
                jsr     sub_F1D5
                bcs     loc_F3FE
                dec     FDRVar3
                bne     loc_F3AF
                bset    <byte_2 8
                ldaa    #$FF
                staa    TFLG1           ; Timer Interrupt Flag Register 1
                ldaa    #$32 ; '2'
                staa    FDRVar3

loc_F3C6:                               ; CODE XREF: sub_F351+84↓j
                jsr     sub_F1D5
                bcs     loc_F3FE
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #6
                bne     loc_F3FE
                dec     FDRVar3
                bne     loc_F3C6
                ldab    #3

loc_F3D9:                               ; CODE XREF: sub_F351+9B↓j
                ldaa    #$10
                staa    ADCTL           ; A_D Control Register

loc_F3DE:                               ; CODE XREF: sub_F351+90↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_F3DE
                ldaa    ADR1            ; A_D Result Register 1
                cmpa    byte_9066
                bcc     loc_F3FB
                decb
                bne     loc_F3D9
                ldd     #$2481
                jsr     sub_AE82
                bcc     loc_F3FB
                bset    <byte_2 4
                bra     loc_F3FE
; ---------------------------------------------------------------------------

loc_F3FB:                               ; CODE XREF: sub_F351+98↑j
                                        ; sub_F351+A3↑j
                bclr    <byte_2 4

loc_F3FE:                               ; CODE XREF: sub_F351+61↑j
                                        ; sub_F351+78↑j ...
                jsr     sub_F460
                std     <byte_0
                jsr     sub_F335
                ldd     #0
                staa    PIA_Ctrl_3
                staa    PPROG           ; EEPROM Program Control Register
                stab    PIA_Ctrl_1
                staa    SwitchPortAccessReg1
                ldab    #7
                stab    PIA3_Buffer_2_t3
                staa    PIA_Ctrl_5
                staa    PIA_Ctrl_2
                ldd     #0
                std     OC1M            ; Output Compare 1 Mask Register
                clr     SCCR2           ; Serial Communications Control Register 2
                ldd     #$FFFE
                std     PORTD           ; Port D Data
                ldd     #$AAF8
                staa    TCTL1           ; Timer Control Register 1
                stab    CFORC           ; Timer Compare Force Register
                jsr     sub_F335

loc_F43B:                               ; CODE XREF: sub_F351+F4↓J
                                        ; sub_F351+F7↓J ...
                ldab    SwitchPortAccessReg1
                bitb    #$40 ; '@'
                beq     loc_F44B
                jsr     sub_F32B
                jmp     loc_F43B
; ---------------------------------------------------------------------------
                jmp     loc_F43B
; ---------------------------------------------------------------------------

loc_F44B:                               ; CODE XREF: sub_F351+EF↑j
                jsr     sub_F32B
                ldaa    #$40 ; '@'

loc_F450:                               ; CODE XREF: sub_F351+107↓j
                ldab    SwitchPortAccessReg1
                bitb    #$40 ; '@'
                bne     loc_F43B
                deca
                bne     loc_F450
                jsr     sub_F32B
                jmp     __RESET
; End of function sub_F351


; =============== S U B R O U T I N E =======================================


sub_F460:                               ; CODE XREF: __RESET+1C↑P
                                        ; sub_F351:loc_F3FE↑P
                clra
                clrb
                ldx     #2

loc_F465:                               ; CODE XREF: sub_F460+E↓j
                addb    0,x
                bcc     loc_F46A
                inca

loc_F46A:                               ; CODE XREF: sub_F460+7↑j
                inx
                cpx     #$48 ; 'H'
                bcs     loc_F465
                rts
; End of function sub_F460


; =============== S U B R O U T I N E =======================================


sub_F471:                               ; CODE XREF: __RESET+7B1↑P
                brset   <byte_4E $40 loc_F478 ; '@'
                jmp     loc_F501
; ---------------------------------------------------------------------------

loc_F478:                               ; CODE XREF: sub_F471↑j
                ldaa    PPROG           ; EEPROM Program Control Register
                beq     loc_F48E
                bclr    <byte_4E $80
                cmpa    #$17
                bne     loc_F489
                bset    <byte_4E 8
                bra     loc_F494
; ---------------------------------------------------------------------------

loc_F489:                               ; CODE XREF: sub_F471+11↑j
                bclr    <byte_4E 8
                bra     loc_F494
; ---------------------------------------------------------------------------

loc_F48E:                               ; CODE XREF: sub_F471+A↑j
                bset    <byte_4E $80
                bclr    <byte_4E 8

loc_F494:                               ; CODE XREF: sub_F471+16↑j
                                        ; sub_F471+1B↑j
                clra
                staa    PPROG           ; EEPROM Program Control Register
                ldaa    byte_177
                beq     loc_F4A6
                ldab    #3
                cba
                bcc     loc_F4A6
                tba
                staa    byte_177

loc_F4A6:                               ; CODE XREF: sub_F471+2A↑j
                                        ; sub_F471+2F↑j
                ldx     #$B600
                ldab    byte_161
                abx
                ldab    byte_162
                ldaa    0,x
                cba
                beq     loc_F4EE
                brset   <byte_4E $80 loc_F4D8
                brclr   <byte_4E 8 loc_F4C1
                cmpa    #$FF
                beq     loc_F4D8

loc_F4C1:                               ; CODE XREF: sub_F471+48↑j
                brset   <byte_F3 $40 loc_F4EE ; '@'
                pshx
                psha
                pshb
                ldd     #$318A
                jsr     sub_AE82
                pulb
                pula
                pulx
                bcc     loc_F4D8
                bset    <byte_F3 $40 ; '@'
                bra     loc_F4EE
; ---------------------------------------------------------------------------

loc_F4D8:                               ; CODE XREF: sub_F471+44↑j
                                        ; sub_F471+4E↑j ...
                anda    byte_162
                cmpa    byte_162
                beq     loc_F4E4
                ldaa    #$16
                bra     loc_F4E6
; ---------------------------------------------------------------------------

loc_F4E4:                               ; CODE XREF: sub_F471+6D↑j
                ldaa    #2

loc_F4E6:                               ; CODE XREF: sub_F471+71↑j
                staa    PPROG           ; EEPROM Program Control Register
                stab    0,x
                inca
                bra     loc_F502
; ---------------------------------------------------------------------------

loc_F4EE:                               ; CODE XREF: sub_F471+42↑j
                                        ; sub_F471:loc_F4C1↑j ...
                bclr    <byte_4E $40 ; '@'
                brset   <byte_4E $20 loc_F501 ; ' '
                ldaa    #3
                cmpa    byte_177
                bne     loc_F501
                ldaa    #1
                staa    byte_177

loc_F501:                               ; CODE XREF: sub_F471+4↑J
                                        ; sub_F471+80↑j ...
                clra

loc_F502:                               ; CODE XREF: sub_F471+7B↑j
                staa    PPROG           ; EEPROM Program Control Register
                rts
; End of function sub_F471


; =============== S U B R O U T I N E =======================================


sub_F506:                               ; CODE XREF: __RESET+81D↑P
                                        ; sub_9BB0+17↑P
                ldx     #$B610

loc_F509:                               ; CODE XREF: sub_F506+12↓j
                ldab    #$10
                abx
                cpx     #$B650
                bhi     locret_F51A
                ldaa    0,x
                inca
                beq     locret_F51A
                bsr     sub_F51B
                bra     loc_F509
; ---------------------------------------------------------------------------

locret_F51A:                            ; CODE XREF: sub_F506+9↑j
                                        ; sub_F506+E↑j
                rts
; End of function sub_F506


; =============== S U B R O U T I N E =======================================


sub_F51B:                               ; CODE XREF: sub_F506+10↑p
                ldaa    #$E
                staa    PPROG           ; EEPROM Program Control Register
                stab    0,x
                inca
                staa    PPROG           ; EEPROM Program Control Register
                ldy     #$1652

loc_F52A:                               ; CODE XREF: sub_F51B+11↓j
                dey
                bne     loc_F52A
                deca
                staa    PPROG           ; EEPROM Program Control Register
                clr     PPROG           ; EEPROM Program Control Register
                sei
                jsr     sub_F335
                cli
                rts
; End of function sub_F51B


; =============== S U B R O U T I N E =======================================


sub_F53B:                               ; CODE XREF: __RESET+4B9↑P
                ldd     #$8EFF
                stab    TFLG1           ; Timer Interrupt Flag Register 1
                staa    TMSK1           ; Timer Interrupt Mask Register 1
                ldab    #$70 ; 'p'
                stab    TFLG2           ; Timer Interrupt Flag Register 2
                clr     PACNT           ; Pulse Accumulator Count Register
; End of function sub_F53B


; =============== S U B R O U T I N E =======================================


sub_F54C:                               ; CODE XREF: IC1I+6A↓P
                ldab    #1
                ldaa    SwitchPortAccessReg2
                bita    #1
                beq     loc_F557
                ldab    #0

loc_F557:                               ; CODE XREF: sub_F54C+7↑j
                stab    PIA_Ctrl_2
                anda    #1
                eora    SwitchPortAccessReg2
                bita    #1
                beq     loc_F571
                ldaa    SwitchPortAccessReg2
                ldab    #1
                bita    #1
                beq     loc_F56E
                ldab    #0

loc_F56E:                               ; CODE XREF: sub_F54C+1E↑j
                stab    PIA_Ctrl_2

loc_F571:                               ; CODE XREF: sub_F54C+15↑j
                ldd     #$1FB
                stab    PIA_Ctrl_4
                staa    PIA_Ctrl_3
                rts
; End of function sub_F54C


; =============== S U B R O U T I N E =======================================


sub_F57B:                               ; CODE XREF: __RESET+790↑P
                ldx     #PORTA          ; Port A data
                brset   9,x $3A loc_F585 ; ':'
                bset    9,x $3A ; ':'

loc_F585:                               ; CODE XREF: sub_F57B+3↑j
                brclr   9,x 5 loc_F58C
                bclr    9,x 5

loc_F58C:                               ; CODE XREF: sub_F57B:loc_F585↑j
                brclr   $C,x $F8 loc_F593
                bclr    $C,x $FF

loc_F593:                               ; CODE XREF: sub_F57B:loc_F58C↑j
                brclr   $D,x $F8 loc_F59A
                bclr    $D,x $FF

loc_F59A:                               ; CODE XREF: sub_F57B:loc_F593↑j
                brset   $20,x $AA loc_F5A1
                bset    $20,x $AA

loc_F5A1:                               ; CODE XREF: sub_F57B:loc_F59A↑j
                brset   $21,x $1A loc_F5A8
                bset    $21,x $1A

loc_F5A8:                               ; CODE XREF: sub_F57B:loc_F5A1↑j
                brclr   $21,x $25 loc_F5AF ; '%'
                bclr    $21,x $25 ; '%'

loc_F5AF:                               ; CODE XREF: sub_F57B:loc_F5A8↑j
                brset   $22,x $8E loc_F5B6
                bset    $22,x $8E

loc_F5B6:                               ; CODE XREF: sub_F57B:loc_F5AF↑j
                brclr   $22,x $71 loc_F5BD ; 'q'
                bclr    $22,x $71 ; 'q'

loc_F5BD:                               ; CODE XREF: sub_F57B:loc_F5B6↑j
                brclr   $24,x $F0 loc_F5C4
                bclr    $24,x $F0

loc_F5C4:                               ; CODE XREF: sub_F57B:loc_F5BD↑j
                brset   $26,x $78 loc_F5CB ; 'x'
                bset    $26,x $78 ; 'x'

loc_F5CB:                               ; CODE XREF: sub_F57B:loc_F5C4↑j
                brclr   $26,x $87 loc_F5D2
                bclr    $26,x $87

loc_F5D2:                               ; CODE XREF: sub_F57B:loc_F5CB↑j
                brset   $28,x $54 loc_F5D9 ; 'T'
                bset    $28,x $54 ; 'T'

loc_F5D9:                               ; CODE XREF: sub_F57B:loc_F5D2↑j
                brclr   $28,x $AB loc_F5E0
                bclr    $28,x $AB

loc_F5E0:                               ; CODE XREF: sub_F57B:loc_F5D9↑j
                brclr   $2C,x $18 loc_F5E7
                bclr    $2C,x $18

loc_F5E7:                               ; CODE XREF: sub_F57B:loc_F5E0↑j
                brset   $2D,x $C loc_F5EE
                bset    $2D,x $C

loc_F5EE:                               ; CODE XREF: sub_F57B:loc_F5E7↑j
                brclr   $2D,x $F3 loc_F5F5
                bclr    $2D,x $F3

loc_F5F5:                               ; CODE XREF: sub_F57B:loc_F5EE↑j
                brset   $39,x $88 loc_F5FC
                bset    $39,x $88

loc_F5FC:                               ; CODE XREF: sub_F57B:loc_F5F5↑j
                brclr   $39,x $40 loc_F603 ; '@'
                bclr    $39,x $40 ; '@'

loc_F603:                               ; CODE XREF: sub_F57B:loc_F5FC↑j
                brset   $3C,x $F loc_F60C
                sei
                bset    $3C,x $F
                cli

loc_F60C:                               ; CODE XREF: sub_F57B:loc_F603↑j
                ldx     #SwitchPortAccessReg1
                sei
                brclr   2,x $F0 loc_F617
                bclr    2,x $F0

loc_F617:                               ; CODE XREF: sub_F57B+95↑j
                brset   2,x 3 loc_F61E
                bset    2,x 3

loc_F61E:                               ; CODE XREF: sub_F57B:loc_F617↑j
                cli
                brclr   3,x $FE loc_F626
                bclr    3,x $FE

loc_F626:                               ; CODE XREF: sub_F57B+A4↑j
                brclr   4,x $FE loc_F62D
                bclr    4,x $FE

loc_F62D:                               ; CODE XREF: sub_F57B:loc_F626↑j
                brset   6,x $F8 loc_F634
                bset    6,x $F8

loc_F634:                               ; CODE XREF: sub_F57B:loc_F62D↑j
                brclr   6,x 6 locret_F63B
                bclr    6,x 6

locret_F63B:                            ; CODE XREF: sub_F57B:loc_F634↑j
                rts
; End of function sub_F57B

; ---------------------------------------------------------------------------
word_F63C:      fdb $4645               ; DATA XREF: sub_F644+48↓o
                fdb $4F14
                fdb $1550
                fdb $3D13

; =============== S U B R O U T I N E =======================================


sub_F644:                               ; CODE XREF: __RESET:loc_9919↑P
                ldaa    <byte_6B
                cmpa    #$5E ; '^'
                bcc     loc_F6A3
                ldaa    <byte_76
                cmpa    #$C3
                bcs     loc_F6A3
                ldaa    SwitchPortAccessReg1
                bita    #$10
                beq     loc_F6A3
                brset   <byte_F0 $10 loc_F6A3
                bita    #$40 ; '@'
                bne     loc_F6A3
                brset   <byte_F5 $20 loc_F6A3 ; ' '
                sei
                ldaa    SwitchPortAccessReg2
                anda    #$F0
                bne     loc_F6A6
                ldaa    PORTA           ; Port A data
                bita    #$70 ; 'p'
                bne     loc_F6A6
                ldaa    SwitchPortAccessReg1
                bita    #$80
                bne     loc_F6A6
                brclr   <byte_49 $80 loc_F6A6
                ldab    #9

loc_F67F:                               ; CODE XREF: sub_F644+3C↓j
                decb
                bne     loc_F67F
                ldaa    PIA_Ctrl_4
                bita    #4
                bne     loc_F69E
                ldab    <byte_63
                cli
                ldx     #word_F63C
                andb    #7
                abx
                ldaa    0,x
                ldab    #$90
                jsr     sub_AE82
                bcc     loc_F69E
                bset    <byte_F5 $20 ; ' '

loc_F69E:                               ; CODE XREF: sub_F644+43↑j
                                        ; sub_F644+55↑j
                ldab    #4
                stab    PIA_Ctrl_4

loc_F6A3:                               ; CODE XREF: sub_F644+4↑j
                                        ; sub_F644+A↑j ...
                bclr    <byte_49 $80

loc_F6A6:                               ; CODE XREF: sub_F644+25↑j
                                        ; sub_F644+2C↑j ...
                cli
                rts
; End of function sub_F644

; ---------------------------------------------------------------------------
byte_F6A8:      fcb $10                 ; DATA XREF: ROM_EPROM:F6D3↓o
                fcb 8
                fcb $10
                fcb $18
                fcb $10
                fcb $1A
                fcb 4
                fcb $C
                fcb 4
                fcb $E
                fcb $10
                fcb $1C
                fcb 4
                fcb 8
                fcb 4
                fcb $A
byte_F6B8:      fcb 4                   ; DATA XREF: ROM_EPROM:F6E5↓o
                fcb $10
byte_F6BA:      fcb $FB
byte_F6BB:      fcb $10                 ; DATA XREF: ROM_EPROM:loc_F713↓o
                fcb $20
                fcb $EF
byte_F6BE:      fcb $40                 ; DATA XREF: ROM_EPROM:loc_F741↓o
                fcb $40
                fcb $BF
; ---------------------------------------------------------------------------

loc_F6C1:                               ; CODE XREF: sub_CA82+C6↑J
                ldaa    #3
                staa    Temp5_t3
                ldab    <byte_63
                incb

loc_F6C9:                               ; CODE XREF: sub_CA82+2DB5↓J
                decb
                bmi     loc_F6CE
                bra     loc_F6D0
; ---------------------------------------------------------------------------

loc_F6CE:                               ; CODE XREF: ROM_EPROM:F6CA↑j
                ldab    #7

loc_F6D0:                               ; CODE XREF: ROM_EPROM:F6CC↑j
                stab    STe_648A
                ldx     #byte_F6A8
                ldab    STe_648A
                aslb
                abx
                ldx     0,x
                cmpb    #0
                bne     loc_F6E4
                jmp     loc_F7D8
; ---------------------------------------------------------------------------

loc_F6E4:                               ; CODE XREF: ROM_EPROM:F6DF↑j
                sei
                ldy     #byte_F6B8
                cpx     #TOC4H          ; Output Compare 4 Register
                bne     loc_F713
                ldaa    PORTA           ; Port A data
                staa    FDRVar2
                bita    #$10
                bne     loc_F6FB
                jmp     loc_F773
; ---------------------------------------------------------------------------

loc_F6FB:                               ; CODE XREF: ROM_EPROM:F6F6↑j
                ldd     TOC4H           ; Output Compare 4 Register
                subd    TCNTH           ; Timer Counter Register
                bmi     loc_F773
                subd    #$A
                bmi     loc_F773
                std     FDRVar2
                subd    FDRVar0
                bcs     loc_F76C
                jmp     loc_F815
; ---------------------------------------------------------------------------

loc_F713:                               ; CODE XREF: ROM_EPROM:F6EC↑j
                ldy     #byte_F6BB
                cpx     #TOC3H          ; Output Compare 3 Register
                bne     loc_F741
                ldaa    PORTA           ; Port A data
                staa    FDRVar2
                bita    #$20 ; ' '
                beq     loc_F773
                ldd     TOC3H           ; Output Compare 3 Register
                std     FDRVar2
                subd    TCNTH           ; Timer Counter Register
                bmi     loc_F773
                subd    #$A
                bmi     loc_F773
                std     FDRVar2
                subd    FDRVar0
                bcs     loc_F76C
                jmp     loc_F815
; ---------------------------------------------------------------------------

loc_F741:                               ; CODE XREF: ROM_EPROM:F71A↑j
                ldy     #byte_F6BE
                cpx     #TOC2H          ; Output Compare 2 Register
                bne     loc_F7A3
                ldaa    PORTA           ; Port A data
                staa    FDRVar2
                bita    #$40 ; '@'
                beq     loc_F773
                ldd     TOC2H           ; Output Compare 2 Register
                std     FDRVar2
                subd    TCNTH           ; Timer Counter Register
                bmi     loc_F773
                subd    #$A
                bmi     loc_F773
                std     FDRVar2
                subd    FDRVar0
                bcc     loc_F799

loc_F76C:                               ; CODE XREF: ROM_EPROM:F70E↑j
                                        ; ROM_EPROM:F73C↑j
                coma
                negb
                std     word_19F
                bra     loc_F779
; ---------------------------------------------------------------------------

loc_F773:                               ; CODE XREF: ROM_EPROM:F6F8↑J
                                        ; ROM_EPROM:F701↑j ...
                ldd     FDRVar0
                std     word_19F

loc_F779:                               ; CODE XREF: ROM_EPROM:F771↑j
                ldd     0,y
                oraa    TCTL1           ; Timer Control Register 1
                staa    TCTL1           ; Timer Control Register 1
                stab    CFORC           ; Timer Compare Force Register
                ldd     TCNTH           ; Timer Counter Register
                std     FDRVar2
                addd    FDRVar0
                std     0,x
                ldaa    2,y
                anda    TCTL1           ; Timer Control Register 1
                staa    TCTL1           ; Timer Control Register 1

loc_F799:                               ; CODE XREF: ROM_EPROM:F76A↑j
                bra     loc_F815
; ---------------------------------------------------------------------------
byte_F79B:      fcb 0                   ; DATA XREF: sub_CA82:loc_F7A3↓o
                fcb 0
                fcb 0
                fcb $40
                fcb $80
                fcb 0
                fcb $10
                fcb $20
; ---------------------------------------------------------------------------
; START OF FUNCTION CHUNK FOR sub_CA82

loc_F7A3:                               ; CODE XREF: ROM_EPROM:F748↑j
                ldy     #byte_F79B
                ldab    STe_648A
                aby
                ldab    0,y
                stab    FDRVar2
                ldaa    SwitchPortAccessReg2
                bita    FDRVar2
                beq     loc_F7C5
                ldd     0,x
                std     FDRVar2
                cpd     #$FFFA
                bcs     loc_F7C7

loc_F7C5:                               ; CODE XREF: sub_CA82+2D36↑j
                clra
                clrb

loc_F7C7:                               ; CODE XREF: sub_CA82+2D41↑j
                subd    FDRVar0
                bcc     loc_F815
                coma
                negb
                std     word_19F
                ldd     FDRVar0
                std     0,x
                bra     loc_F815
; ---------------------------------------------------------------------------

loc_F7D8:                               ; CODE XREF: ROM_EPROM:F6E1↑J
                sei
                ldaa    SwitchPortAccessReg1
                staa    FDRVar2
                bita    #$80
                beq     loc_F800
                ldd     word_14A
                std     FDRVar2
                subd    TCNTH           ; Timer Counter Register
                bmi     loc_F800
                subd    #$1E
                bmi     loc_F800
                std     FDRVar2
                subd    FDRVar0
                bcc     loc_F815
                coma
                negb
                std     word_19F

loc_F800:                               ; CODE XREF: sub_CA82+2D5F↑j
                                        ; sub_CA82+2D6A↑j ...
                ldd     TCNTH           ; Timer Counter Register
                std     FDRVar2
                addd    FDRVar0
                std     word_14A
                ldd     FDRVar0
                std     word_48C
                jsr     sub_F245

loc_F815:                               ; CODE XREF: ROM_EPROM:F710↑J
                                        ; ROM_EPROM:F73E↑J ...
                cli
                ldd     word_19F
                lsrd
                lsrd
                addd    word_158
                bcc     loc_F823
                ldd     #$FFFF

loc_F823:                               ; CODE XREF: sub_CA82+2D9C↑j
                std     word_158
                clra
                clrb
                std     word_19F
                ldaa    Temp5_t3
                deca
                beq     locret_F83A
                staa    Temp5_t3
                ldab    STe_648A
                jmp     loc_F6C9
; ---------------------------------------------------------------------------

locret_F83A:                            ; CODE XREF: sub_CA82+2DAD↑j
                rts
; END OF FUNCTION CHUNK FOR sub_CA82
; ---------------------------------------------------------------------------
byte_F83B:      fcb $FC                 ; DATA XREF: IC1I+51↓o
                fcb $C1
                fcb $F8
                fcb $AF

; =============== S U B R O U T I N E =======================================


                ; public IC1I
IC1I:                                   ; DATA XREF: USER_VEC:FFEE↓o
                ldd     #$510
                staa    TFLG1           ; Timer Interrupt Flag Register 1
                stab    ADCTL           ; A_D Control Register
                brclr   <byte_5C $40 loc_F85A ; '@'
                ldaa    SwitchPortAccessReg2
                bita    #$80
                bne     loc_F85A
                brset   <byte_5C $F loc_F85A
                inc     byte_5C

loc_F85A:                               ; CODE XREF: IC1I+9↑j
                                        ; IC1I+12↑j ...
                ldaa    byte_177
                bne     loc_F862
                bclr    <byte_2 1

loc_F862:                               ; CODE XREF: IC1I+1E↑j
                clr     byte_128
                ldaa    <byte_F7
                cmpa    #$A
                bne     loc_F871
                clr     byte_F7
                bclr    <byte_FA $30 ; '0'

loc_F871:                               ; CODE XREF: IC1I+2A↑j
                ldab    <byte_62
                bpl     loc_F898
                ldaa    byte_12B
                inca
                beq     loc_F887
                cmpa    #$FF
                bne     loc_F884
                ldab    #1
                stab    PIA_Ctrl_4

loc_F884:                               ; CODE XREF: IC1I+3E↑j
                staa    byte_12B

loc_F887:                               ; CODE XREF: IC1I+3A↑j
                ldab    <byte_62
                eorb    #1
                stab    <byte_62
                andb    #1
                aslb
                ldx     #byte_F83B
                abx
                ldx     0,x
                jmp     0,x
; ---------------------------------------------------------------------------

loc_F898:                               ; CODE XREF: IC1I+34↑j
                ldaa    byte_168
                tab
                anda    #$E0
                andb    #$1F
                cmpb    #$1F
                beq     loc_F8A5
                incb

loc_F8A5:                               ; CODE XREF: IC1I+63↑j
                aba
                staa    byte_168
                jsr     sub_F54C
                jmp     locret_FE39
; ---------------------------------------------------------------------------
                brset   <byte_48 1 loc_F8C3
                ldaa    TCTL1           ; Timer Control Register 1
                anda    #$FE
                staa    TCTL1           ; Timer Control Register 1
                ldaa    #8
                staa    CFORC           ; Timer Compare Force Register
                bclr    <byte_48 2

loc_F8C3:                               ; CODE XREF: IC1I+70↑j
                ldaa    <byte_63
                inca
                cmpa    #8
                bne     loc_F8CB
                clra

loc_F8CB:                               ; CODE XREF: IC1I+89↑j
                staa    <byte_63
                ldab    byte_8019
                aslb
                bcc     loc_F8EA
                anda    #7
                cmpa    #7
                beq     loc_F8EA
                cmpa    #4
                beq     loc_F8EA
                cmpa    #2
                beq     loc_F8EA
                cmpa    #1
                beq     loc_F8EA
                bclr    <byte_49 8
                bra     loc_F8ED
; ---------------------------------------------------------------------------

loc_F8EA:                               ; CODE XREF: IC1I+92↑j
                                        ; IC1I+98↑j ...
                bset    <byte_49 8

loc_F8ED:                               ; CODE XREF: IC1I+A9↑j
                ldaa    <byte_F1
                oraa    #2
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                ldd     TIC1H           ; Input Capture 1 Register
                ldx     #byte_115
                ldy     #LDXi_6485
                jsr     sub_F108
                ldaa    byte_115
                lsra
                staa    byte_116
                ldd     TIC1H           ; Input Capture 1 Register
                subd    word_119
                std     word_117
                ldd     TIC1H           ; Input Capture 1 Register
                std     word_119
                clr     byte_115
                ldaa    <byte_6B
                cmpa    #$6D ; 'm'
                bcc     loc_F933
                cmpa    #$6A ; 'j'
                bcc     loc_F929
                bset    <byte_48 4

loc_F929:                               ; CODE XREF: IC1I+E5↑j
                jsr     sub_F211
                std     <byte_6B
                jsr     sub_F2FA
                bra     loc_F936
; ---------------------------------------------------------------------------

loc_F933:                               ; CODE XREF: IC1I+E1↑j
                bclr    <byte_48 4

loc_F936:                               ; CODE XREF: IC1I+F2↑j
                ldaa    byte_150
                clrb
                lsrd
                lsrd
                lsrd
                std     word_146
                ldd     word_117
                cpd     #$3A9
                bcc     loc_F963
                lsrd
                std     CountdownTimerFromKeyOn
                lsrd
                std     UNe_6482
                lsrd
                lsrd
                lsrd
                std     UNe_6484
                lsrd
                addd    CountdownTimerFromKeyOn
                addd    UNe_6482
                addd    UNe_6484
                bra     loc_F966
; ---------------------------------------------------------------------------

loc_F963:                               ; CODE XREF: IC1I+108↑j
                subd    #$C8

loc_F966:                               ; CODE XREF: IC1I+122↑j
                cpd     word_146
                bcs     loc_F96F
                ldd     word_146

loc_F96F:                               ; CODE XREF: IC1I+12B↑j
                std     word_146
                brclr   <byte_B4 $10 loc_F979
                jmp     loc_FA07
; ---------------------------------------------------------------------------

loc_F979:                               ; CODE XREF: IC1I+133↑j
                ldaa    byte_116
                bne     loc_F9AD
                ldd     byte_83B7
                cpd     word_117
                bcs     loc_F9AD
                brset   <byte_48 $40 loc_F9BE ; '@'
                ldd     byte_83B5
                cpd     word_117
                bcs     loc_F9AD
                bset    <byte_48 $40 ; '@'
                ldd     #0
                std     <byte_64
                staa    byte_128
                bset    <byte_AA $FF
                jsr     loc_CFC8
                jsr     sub_D074
                jsr     sub_D0F1
                bra     loc_F9BE
; ---------------------------------------------------------------------------

loc_F9AD:                               ; CODE XREF: IC1I+13D↑j
                                        ; IC1I+146↑j ...
                brclr   <byte_48 $40 loc_F9B4 ; '@'
                clr     byte_D9

loc_F9B4:                               ; CODE XREF: IC1I:loc_F9AD↑j
                bclr    <byte_48 $40 ; '@'
                ldaa    byte_88FF
                staa    <byte_A6
                staa    <byte_A7

loc_F9BE:                               ; CODE XREF: IC1I+148↑j
                                        ; IC1I+16C↑j
                ldaa    byte_116
                bne     loc_F9E7
                ldd     word_80AA
                cpd     word_117
                bcs     loc_F9E7
                brset   <byte_48 1 loc_F9F9
                ldd     word_80A8
                cpd     word_117
                bcs     loc_F9E7
                ldaa    <byte_5B
                anda    #$1F
                cmpa    byte_80AC
                bcc     loc_F9F9
                inc     byte_5B
                bra     loc_F9EA
; ---------------------------------------------------------------------------

loc_F9E7:                               ; CODE XREF: IC1I+182↑j
                                        ; IC1I+18B↑j ...
                bclr    <byte_5B $1F

loc_F9EA:                               ; CODE XREF: IC1I+1A6↑j
                bclr    <byte_48 1
                bset    <byte_55 $80
                ldaa    #$A
                staa    <byte_69
                staa    <byte_6A
                jmp     loc_FADF
; ---------------------------------------------------------------------------

loc_F9F9:                               ; CODE XREF: IC1I+18D↑j
                                        ; IC1I+1A1↑j
                bset    <byte_48 1
                ldaa    <byte_69
                adda    byte_80AD
                bpl     loc_FA05
                ldaa    #$7F

loc_FA05:                               ; CODE XREF: IC1I+1C2↑j
                staa    <byte_69

loc_FA07:                               ; CODE XREF: IC1I+137↑J
                ldab    <byte_6B
                cmpb    #$19
                bcc     loc_FA10
                jmp     loc_FAA4
; ---------------------------------------------------------------------------

loc_FA10:                               ; CODE XREF: IC1I+1CC↑j
                ldaa    <byte_66
                brclr   <byte_55 $80 loc_FA21
                cmpa    <byte_69
                bls     loc_FA1E
                ldaa    <byte_69
                bra     loc_FA21
; ---------------------------------------------------------------------------

loc_FA1E:                               ; CODE XREF: IC1I+1D9↑j
                bclr    <byte_55 $80

loc_FA21:                               ; CODE XREF: IC1I+1D3↑j
                                        ; IC1I+1DD↑j
                staa    <byte_6A
                cmpb    #$38 ; '8'
                bcc     loc_FA2B
                cmpa    #$46 ; 'F'
                bcs     loc_FAA4

loc_FA2B:                               ; CODE XREF: IC1I+1E6↑j
                cmpa    #$32 ; '2'
                bcs     loc_FAA4
                ldaa    #$BE
                suba    <byte_6A
                psha
                ldab    #$6C ; 'l'
                mul
                adca    #0
                pulb
                aba
                psha
                ldab    word_117
                mul
                std     CountdownTimerFromKeyOn
                pula
                ldab    word_117+1
                mul
                adca    #0
                tab
                clra
                addd    CountdownTimerFromKeyOn
                addd    TIC1H           ; Input Capture 1 Register
                subd    #$A
                std     CountdownTimerFromKeyOn
                bset    <byte_48 $A
                ldx     #TCTL1          ; Timer Control Register 1
                subd    word_146
                std     UNe_6482
                subd    TCNTH           ; Timer Counter Register
                bmi     loc_FA76
                cpd     #$20 ; ' '
                bmi     loc_FA76
                ldaa    PORTA           ; Port A data
                bita    #8
                beq     loc_FA8E

loc_FA76:                               ; CODE XREF: IC1I+228↑j
                                        ; IC1I+22E↑j
                bset    0,x 3
                ldaa    #8
                staa    CFORC           ; Timer Compare Force Register
                ldd     CountdownTimerFromKeyOn
                std     TCO5H           ; Output Compare 5 Register
                bclr    0,x 1
                ldaa    #8
                staa    TFLG1           ; Timer Interrupt Flag Register 1
                bra     loc_FAA4
; ---------------------------------------------------------------------------

loc_FA8E:                               ; CODE XREF: IC1I+235↑j
                bclr    0,x 1
                ldaa    #8
                staa    CFORC           ; Timer Compare Force Register
                ldd     UNe_6482
                std     TCO5H           ; Output Compare 5 Register
                bset    0,x 3
                ldaa    #8
                staa    TFLG1           ; Timer Interrupt Flag Register 1

loc_FAA4:                               ; CODE XREF: IC1I+1CE↑J
                                        ; IC1I+1EA↑j ...
                brset   <byte_52 2 loc_FAEA
                brset   <byte_B4 $10 loc_FAEA
                ldaa    byte_15D
                adda    byte_15C
                bvc     loc_FADC
                ldab    byte_111
                cmpb    <byte_5
                bne     loc_FADB
                ldab    byte_8C3C
                beq     loc_FADB
                tsta
                bmi     loc_FACC
                ldaa    byte_111
                sba
                bcc     loc_FAD8
                clra
                bra     loc_FAD8
; ---------------------------------------------------------------------------

loc_FACC:                               ; CODE XREF: IC1I+282↑j
                ldaa    byte_8D54
                addb    byte_111
                bcs     loc_FAD8
                cba
                bls     loc_FAD8
                tba

loc_FAD8:                               ; CODE XREF: IC1I+288↑j
                                        ; IC1I+28B↑j ...
                staa    byte_111

loc_FADB:                               ; CODE XREF: IC1I+27A↑j
                                        ; IC1I+27F↑j
                clra

loc_FADC:                               ; CODE XREF: IC1I+273↑j
                staa    byte_15C

loc_FADF:                               ; CODE XREF: IC1I+1B7↑J
                brset   <byte_48 $40 loc_FAEA ; '@'
                ldaa    <byte_D9
                inca
                beq     loc_FAEA
                staa    <byte_D9

loc_FAEA:                               ; CODE XREF: IC1I:loc_FAA4↑j
                                        ; IC1I+269↑j ...
                brclr   <byte_B4 1 loc_FB01
                ldaa    byte_103
                inca
                cmpa    byte_8371
                bcs     loc_FAFE
                inc     byte_102
                inc     byte_102
                clra

loc_FAFE:                               ; CODE XREF: IC1I+2B6↑j
                staa    byte_103

loc_FB01:                               ; CODE XREF: IC1I:loc_FAEA↑j
                clra
                brclr   <byte_4A $40 loc_FB0C ; '@'
                ldaa    byte_10E
                inca
                beq     loc_FB0F

loc_FB0C:                               ; CODE XREF: IC1I+2C3↑j
                staa    byte_10E

loc_FB0F:                               ; CODE XREF: IC1I+2CB↑j
                ldaa    byte_10E
                cmpa    byte_81E9
                bcs     loc_FB1C
                bset    <byte_48 $10
                bra     loc_FB1F
; ---------------------------------------------------------------------------

loc_FB1C:                               ; CODE XREF: IC1I+2D6↑j
                bclr    <byte_48 $10

loc_FB1F:                               ; CODE XREF: IC1I+2DB↑j
                inc     byte_B0
                inc     byte_B1
                inc     byte_9A
                inc     byte_9B
                brclr   <byte_51 $40 loc_FB45 ; '@'
                brset   <byte_57 2 loc_FB3A
                ldaa    <byte_A1
                inca
                beq     loc_FB3A
                staa    <byte_A1

loc_FB3A:                               ; CODE XREF: IC1I+2F0↑j
                                        ; IC1I+2F7↑j
                brset   <byte_58 2 loc_FB45
                ldaa    <byte_A2
                inca
                beq     loc_FB45
                staa    <byte_A2

loc_FB45:                               ; CODE XREF: IC1I+2EC↑j
                                        ; IC1I:loc_FB3A↑j ...
                clra
                brclr   <byte_48 1 loc_FB50
                ldaa    byte_10F
                inca
                beq     loc_FB53

loc_FB50:                               ; CODE XREF: IC1I+307↑j
                staa    byte_10F

loc_FB53:                               ; CODE XREF: IC1I+30F↑j
                ldaa    <byte_DA
                beq     loc_FB5A
                deca
                staa    <byte_DA

loc_FB5A:                               ; CODE XREF: IC1I+316↑j
                ldaa    byte_148
                inca
                beq     loc_FB63
                staa    byte_148

loc_FB63:                               ; CODE XREF: IC1I+31F↑j
                brset   <byte_5E $10 loc_FB6B
                brclr   <byte_4D 1 loc_FB7F

loc_FB6B:                               ; CODE XREF: IC1I:loc_FB63↑j
                inc     byte_104
                ldaa    byte_104
                cmpa    byte_8377
                bcs     loc_FB82
                ldaa    byte_105
                adda    byte_8378
                staa    byte_105

loc_FB7F:                               ; CODE XREF: IC1I+328↑j
                clr     byte_104

loc_FB82:                               ; CODE XREF: IC1I+335↑j
                brclr   <byte_48 4 loc_FB8B
                jsr     sub_D14D
                bra     loc_FBD0
; ---------------------------------------------------------------------------

loc_FB8B:                               ; CODE XREF: IC1I:loc_FB82↑j
                                        ; IC1I+34F↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_FB8B
                ldaa    ADR1            ; A_D Result Register 1
                ldab    <byte_6B
                cmpb    #$2F ; '/'
                bcc     loc_FBA7
                cmpb    #$D
                bcs     loc_FBA7
                cmpa    byte_9065
                bcc     loc_FBAB
                cmpa    byte_9064
                bcs     loc_FBAB

loc_FBA7:                               ; CODE XREF: IC1I+358↑j
                                        ; IC1I+35C↑j
                brclr   <byte_F2 $88 loc_FBAE

loc_FBAB:                               ; CODE XREF: IC1I+361↑j
                                        ; IC1I+366↑j
                jsr     sub_B0E1

loc_FBAE:                               ; CODE XREF: IC1I:loc_FBA7↑j
                jsr     sub_F2EC
                tab
                stab    byte_155
                bra     loc_FBD0
; ---------------------------------------------------------------------------
byte_FBB7:      fcb $10                 ; DATA XREF: IC1I:loc_FC17↓o
                fcb 8
                fcb $10
                fcb $18
                fcb $10
                fcb $1A
                fcb 4
                fcb $C
                fcb 4
                fcb $E
                fcb $10
                fcb $1C
                fcb 4
                fcb 8
                fcb 4
                fcb $A
byte_FBC7:      fcb 4                   ; DATA XREF: IC1I+3E5↓o
                fcb $10
                fcb $FB
byte_FBCA:      fcb $10                 ; DATA XREF: IC1I+3EE↓o
                fcb $20
                fcb $EF
byte_FBCD:      fcb $40                 ; DATA XREF: IC1I+3F7↓o
                fcb $40
                fcb $BF
; ---------------------------------------------------------------------------

loc_FBD0:                               ; CODE XREF: IC1I+34A↑j
                                        ; IC1I+376↑j
                brclr   <byte_5C $80 loc_FBE7
                brclr   <byte_5C $10 loc_FBE1
                ldaa    <byte_5C
                bita    #$F
                beq     loc_FBE4
                deca
                staa    <byte_5C

loc_FBE1:                               ; CODE XREF: IC1I+395↑j
                jmp     locret_FCC0
; ---------------------------------------------------------------------------

loc_FBE4:                               ; CODE XREF: IC1I+39D↑j
                bclr    <byte_5C $80

loc_FBE7:                               ; CODE XREF: IC1I:loc_FBD0↑j
                ldd     <byte_82
                bne     loc_FBF2
                ldd     <byte_84
                bne     loc_FBF2
                jmp     locret_FCC0
; ---------------------------------------------------------------------------

loc_FBF2:                               ; CODE XREF: IC1I+3AA↑j
                                        ; IC1I+3AE↑j
                brclr   <byte_50 8 loc_FC10
                ldx     #byte_82
                ldaa    #1
                ldab    byte_9083
                jsr     sub_F0EE
                std     <byte_82
                ldx     #byte_84
                ldaa    #1
                ldab    byte_9083
                jsr     sub_F0EE
                std     <byte_84

loc_FC10:                               ; CODE XREF: IC1I:loc_FBF2↑j
                brclr   <byte_54 $23 loc_FC17 ; '#'
                jmp     locret_FCC0
; ---------------------------------------------------------------------------

loc_FC17:                               ; CODE XREF: IC1I:loc_FC10↑j
                ldx     #byte_FBB7
                ldab    <byte_63
                aslb
                abx
                ldx     0,x
                cmpb    #0
                beq     loc_FC59
                ldy     #byte_FBC7
                cpx     #TOC4H          ; Output Compare 4 Register
                beq     loc_FC56
                ldy     #byte_FBCA
                cpx     #TOC3H          ; Output Compare 3 Register
                beq     loc_FC56
                ldy     #byte_FBCD
                cpx     #TOC2H          ; Output Compare 2 Register
                beq     loc_FC56
                brclr   <byte_49 8 loc_FC47
                ldd     <byte_82
                bra     loc_FC49
; ---------------------------------------------------------------------------

loc_FC47:                               ; CODE XREF: IC1I+400↑j
                ldd     <byte_84

loc_FC49:                               ; CODE XREF: IC1I+406↑j
                std     0,x
                cpd     #$7F
                bcs     loc_FC54
                bset    <byte_49 $80

loc_FC54:                               ; CODE XREF: IC1I+410↑j
                bra     loc_FCAA
; ---------------------------------------------------------------------------

loc_FC56:                               ; CODE XREF: IC1I+3EC↑j
                                        ; IC1I+3F5↑j ...
                jmp     loc_FC6E
; ---------------------------------------------------------------------------

loc_FC59:                               ; CODE XREF: IC1I+3E3↑j
                ldd     <byte_84
                std     word_48C
                jsr     sub_F245
                ldd     <byte_84
                cpd     #$7F
                bcs     loc_FC6C
                bset    <byte_49 $80

loc_FC6C:                               ; CODE XREF: IC1I+428↑j
                bra     loc_FCAA
; ---------------------------------------------------------------------------

loc_FC6E:                               ; CODE XREF: IC1I:loc_FC56↑J
                brclr   <byte_49 8 loc_FC76
                ldd     <byte_82
                bra     loc_FC78
; ---------------------------------------------------------------------------

loc_FC76:                               ; CODE XREF: IC1I:loc_FC6E↑j
                ldd     <byte_84

loc_FC78:                               ; CODE XREF: IC1I+435↑j
                std     UNe_6482
                std     CountdownTimerFromKeyOn
                ldd     0,y
                oraa    TCTL1           ; Timer Control Register 1
                staa    TCTL1           ; Timer Control Register 1
                stab    CFORC           ; Timer Compare Force Register
                ldd     TCNTH           ; Timer Counter Register
                addd    UNe_6482
                std     0,x
                ldd     UNe_6482
                cpd     #$7F
                bcs     loc_FC9E
                bset    <byte_49 $80

loc_FC9E:                               ; CODE XREF: IC1I+45A↑j
                ldaa    2,y
                anda    TCTL1           ; Timer Control Register 1
                staa    TCTL1           ; Timer Control Register 1
                ldd     CountdownTimerFromKeyOn

loc_FCAA:                               ; CODE XREF: IC1I:loc_FC54↑j
                                        ; IC1I:loc_FC6C↑j
                lsrd
                lsrd
                addd    word_158
                bcc     loc_FCB4
                ldd     #$FFFF

loc_FCB4:                               ; CODE XREF: IC1I+470↑j
                std     word_158
                ldaa    byte_15B
                inca
                beq     locret_FCC0
                staa    byte_15B

locret_FCC0:                            ; CODE XREF: IC1I:loc_FBE1↑J
                                        ; IC1I+3B0↑J ...
                rti
; ---------------------------------------------------------------------------
                ldaa    #$14
                staa    ADCTL           ; A_D Control Register

loc_FCC6:                               ; CODE XREF: IC1I+48A↓j
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_FCC6
                ldaa    ADR4            ; A_D Result Register 4
                staa    <byte_71
                ldaa    #$10
                staa    ADCTL           ; A_D Control Register
                brset   <byte_48 1 loc_FCE9
                ldaa    TCTL1           ; Timer Control Register 1
                oraa    #1
                staa    TCTL1           ; Timer Control Register 1
                ldaa    #8
                staa    CFORC           ; Timer Compare Force Register
                bset    <byte_48 2

loc_FCE9:                               ; CODE XREF: IC1I+496↑j
                brclr   <byte_63 1 loc_FCF9
                ldaa    <byte_F1
                anda    #$FD
                staa    <byte_F1
                staa    PIA3_Buffer_2_t3
                jsr     sub_F335

loc_FCF9:                               ; CODE XREF: IC1I:loc_FCE9↑j
                ldaa    byte_8019
                asla
                bcc     loc_FD1E
                ldaa    <byte_63
                inca
                cmpa    #8
                bne     loc_FD07
                clra

loc_FD07:                               ; CODE XREF: IC1I+4C5↑j
                anda    #7
                cmpa    #7
                beq     loc_FD1E
                cmpa    #4
                beq     loc_FD1E
                cmpa    #2
                beq     loc_FD1E
                cmpa    #1
                beq     loc_FD1E
                bclr    <byte_49 8
                bra     loc_FD21
; ---------------------------------------------------------------------------

loc_FD1E:                               ; CODE XREF: IC1I+4BE↑j
                                        ; IC1I+4CC↑j ...
                bset    <byte_49 8

loc_FD21:                               ; CODE XREF: IC1I+4DD↑j
                brset   <byte_48 1 loc_FD28
                jmp     loc_FDBC
; ---------------------------------------------------------------------------

loc_FD28:                               ; CODE XREF: IC1I:loc_FD21↑j
                brclr   <byte_48 8 loc_FD32
                bclr    <byte_48 8
                jmp     loc_FDBC
; ---------------------------------------------------------------------------

loc_FD32:                               ; CODE XREF: IC1I:loc_FD28↑j
                ldaa    <byte_66
                brclr   <byte_55 $80 loc_FD43
                cmpa    <byte_69
                bls     loc_FD40
                ldaa    <byte_69
                bra     loc_FD43
; ---------------------------------------------------------------------------

loc_FD40:                               ; CODE XREF: IC1I+4FB↑j
                bclr    <byte_55 $80

loc_FD43:                               ; CODE XREF: IC1I+4F5↑j
                                        ; IC1I+4FF↑j
                staa    <byte_6A
                ldd     TIC1H           ; Input Capture 1 Register
                subd    word_119
                std     UNe_6482
                std     byte_185
                clra
                ldab    #$64 ; 'd'
                subb    <byte_6A
                lsld
                lsld
                xgdy
                ldaa    #$B6
                jsr     sub_F06D
                xgdy
                ldx     #UNe_6482
                jsr     sub_F0EE
                addd    TIC1H           ; Input Capture 1 Register
                subd    #$A
                std     CountdownTimerFromKeyOn
                bset    <byte_48 2
                ldx     #TCTL1          ; Timer Control Register 1
                subd    word_146
                std     UNe_6482
                subd    TCNTH           ; Timer Counter Register
                bmi     loc_FD8E
                cpd     #$20 ; ' '
                bmi     loc_FD8E
                ldaa    PORTA           ; Port A data
                bita    #8
                beq     loc_FDA6

loc_FD8E:                               ; CODE XREF: IC1I+540↑j
                                        ; IC1I+546↑j
                bset    0,x 3
                ldaa    #8
                staa    CFORC           ; Timer Compare Force Register
                ldd     CountdownTimerFromKeyOn
                std     TCO5H           ; Output Compare 5 Register
                bclr    0,x 1
                ldaa    #8
                staa    TFLG1           ; Timer Interrupt Flag Register 1
                bra     loc_FDBC
; ---------------------------------------------------------------------------

loc_FDA6:                               ; CODE XREF: IC1I+54D↑j
                bclr    0,x 1
                ldaa    #8
                staa    CFORC           ; Timer Compare Force Register
                ldd     UNe_6482
                std     TCO5H           ; Output Compare 5 Register
                bset    0,x 3
                ldaa    #8
                staa    TFLG1           ; Timer Interrupt Flag Register 1

loc_FDBC:                               ; CODE XREF: IC1I+4E6↑J
                                        ; IC1I+4F0↑J ...
                ldaa    ADCTL           ; A_D Control Register
                bpl     loc_FDBC
                ldd     ADR3            ; A_D Result Register 3
                staa    <byte_70
                stab    <byte_75
                cmpb    byte_9058
                bcs     loc_FDD8
                cmpb    byte_9059
                bcc     loc_FDD8
                brset   <byte_F2 $40 loc_FDD8 ; '@'
                stab    <byte_6E

loc_FDD8:                               ; CODE XREF: IC1I+58C↑j
                                        ; IC1I+591↑j ...
                ldaa    ADR1            ; A_D Result Register 1
                ldab    <byte_6B
                cmpb    #$2F ; '/'
                bcc     loc_FDEF
                cmpb    #$D
                bcs     loc_FDEF
                cmpa    byte_9065
                bcc     loc_FDF3
                cmpa    byte_9064
                bcs     loc_FDF3

loc_FDEF:                               ; CODE XREF: IC1I+5A0↑j
                                        ; IC1I+5A4↑j
                brclr   <byte_F2 $88 loc_FDF6

loc_FDF3:                               ; CODE XREF: IC1I+5A9↑j
                                        ; IC1I+5AE↑j
                jsr     sub_B0E1

loc_FDF6:                               ; CODE XREF: IC1I:loc_FDEF↑j
                jsr     sub_F2EC
                tab
                brset   <byte_48 4 loc_FE06
                addb    byte_155
                rorb
                stab    <byte_6D
                bra     loc_FE09
; ---------------------------------------------------------------------------

loc_FE06:                               ; CODE XREF: IC1I+5BB↑j
                stab    byte_155

loc_FE09:                               ; CODE XREF: IC1I+5C5↑j
                brclr   <byte_48 $40 locret_FE39 ; '@'
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #8
                beq     loc_FE17
                jsr     sub_FE58

loc_FE17:                               ; CODE XREF: IC1I+5D3↑j
                brset   <byte_B4 $10 loc_FE25
                brset   <byte_52 2 loc_FE25
                jsr     loc_CFC8
                jsr     sub_D074

loc_FE25:                               ; CODE XREF: IC1I:loc_FE17↑j
                                        ; IC1I+5DC↑j
                ldaa    TFLG1           ; Timer Interrupt Flag Register 1
                bita    #8
                beq     loc_FE2F
                jsr     sub_FE58

loc_FE2F:                               ; CODE XREF: IC1I+5EB↑j
                jsr     sub_D0F1
                brset   <byte_48 4 locret_FE39
                jsr     loc_D18F

locret_FE39:                            ; CODE XREF: IC1I+6D↑J
                                        ; IC1I:loc_FE09↑j ...
                rti
; End of function IC1I


; =============== S U B R O U T I N E =======================================


                ; public PAII
PAII:                                   ; DATA XREF: USER_VEC:FFDA↓o
                                        ; USER_VEC:FFDC↓o ...
                ldd     #$8E71          ; RTII
                                        ; IC3I
                                        ; OC2I
                                        ; OC3I
                                        ; OC4I
                                        ; TOI
                                        ; PAOVI
                anda    TMSK1           ; Timer Interrupt Mask Register 1
                staa    TMSK1           ; Timer Interrupt Mask Register 1
                stab    TFLG1           ; Timer Interrupt Flag Register 1
                ldd     #$F70
                anda    TMSK2           ; Timer Interrupt Mask Register 2
                staa    TMSK2           ; Timer Interrupt Mask Register 2
                stab    TFLG2           ; Timer Interrupt Flag Register 2
                rti
; End of function PAII

; ---------------------------------------------------------------------------
                rts

; =============== S U B R O U T I N E =======================================


nullsub_1:                              ; CODE XREF: sub_D14D+90↑P
                                        ; sub_D14D+F1↑P ...
                rts
; End of function nullsub_1


; =============== S U B R O U T I N E =======================================


                ; public I4_I5
I4_I5:                                  ; DATA XREF: USER_VEC:FFE0↓o
                bsr     sub_FE58
                rti
; End of function I4_I5


; =============== S U B R O U T I N E =======================================


sub_FE58:                               ; CODE XREF: sub_D14D+54↑P
                                        ; sub_D14D+C7↑P ...
                ldaa    #8
                staa    TFLG1           ; Timer Interrupt Flag Register 1
                brclr   <byte_62 $80 locret_FE91
                ldab    byte_116
                bne     locret_FE91
                brclr   <byte_48 1 locret_FE91
                ldab    TCTL1           ; Timer Control Register 1
                eorb    #1
                bitb    #1
                bne     loc_FE77
                brclr   <byte_48 2 locret_FE91

loc_FE77:                               ; CODE XREF: sub_FE58+19↑j
                stab    TCTL1           ; Timer Control Register 1
                lsrb
                bcs     loc_FE82
                ldd     word_146
                bra     loc_FE8B
; ---------------------------------------------------------------------------

loc_FE82:                               ; CODE XREF: sub_FE58+23↑j
                bclr    <byte_48 2
                ldd     word_117
                subd    word_146

loc_FE8B:                               ; CODE XREF: sub_FE58+28↑j
                addd    TCO5H           ; Output Compare 5 Register
                std     TCO5H           ; Output Compare 5 Register

locret_FE91:                            ; CODE XREF: sub_FE58+5↑j
                                        ; sub_FE58+C↑j ...
                rts
; End of function sub_FE58

; ---------------------------------------------------------------------------
byte_FE92:      fcb 5                   ; DATA XREF: IRQ+39↓o
                fcb 4
                fcb 4
                fcb 3
                fcb 3
                fcb 2
                fcb 2
                fcb 1
                fcb 1
                fcb 1
                fcb 1
                fcb 1
                fcb 1
                fcb 1
                fcb 1
                fcb 1

; =============== S U B R O U T I N E =======================================


                ; public IRQ
IRQ:                                    ; DATA XREF: USER_VEC:FFF2↓o
                ldx     #TFLG1          ; Timer Interrupt Flag Register 1
                brclr   0,x 4 loc_FEAC
                jmp     loc_FF31
; ---------------------------------------------------------------------------

loc_FEAC:                               ; CODE XREF: IRQ+3↑j
                brset   <byte_B4 $10 loc_FECD
                ldd     TCNTH           ; Timer Counter Register
                subd    TIC1H           ; Input Capture 1 Register
                std     byte_183
                ldx     TCNTH           ; Timer Counter Register
                ldab    #$C
                abx

loc_FEBF:                               ; CODE XREF: IRQ+29↓j
                ldaa    SwitchPortAccessReg2
                eora    PIA_Ctrl_2
                lsra
                bcs     loc_FF3C
                cpx     TCNTH           ; Timer Counter Register
                bpl     loc_FEBF

loc_FECD:                               ; CODE XREF: IRQ:loc_FEAC↑j
                brclr   <byte_5C $40 loc_FEED ; '@'
                ldaa    SwitchPortAccessReg2
                bita    #$80
                bne     loc_FEED
                bclr    <byte_5C $40 ; '@'
                ldx     #byte_FE92
                ldab    <byte_5C
                tba
                andb    #$F
                abx
                ldab    0,x
                anda    #$F0
                aba
                oraa    #$10
                staa    <byte_5C

loc_FEED:                               ; CODE XREF: IRQ:loc_FECD↑j
                                        ; IRQ+34↑j
                ldaa    #1
                ldab    SwitchPortAccessReg2
                lsrb
                bcc     loc_FEF7
                ldaa    #5

loc_FEF7:                               ; CODE XREF: IRQ+51↑j
                brclr   <byte_62 $80 loc_FF02
                ldab    byte_12B
                cmpb    #8
                bne     loc_FF20

loc_FF02:                               ; CODE XREF: IRQ:loc_FEF7↑j
                ldab    #$81
                staa    <byte_63
                brset   <byte_62 $80 loc_FF19
                clr     byte_115
                inc     byte_115
                inc     byte_115
                clr     byte_64
                clr     byte_65

loc_FF19:                               ; CODE XREF: IRQ+64↑j
                stab    <byte_62
                bset    <byte_53 $80
                bra     loc_FF23
; ---------------------------------------------------------------------------

loc_FF20:                               ; CODE XREF: IRQ+5E↑j
                bclr    <byte_53 $80

loc_FF23:                               ; CODE XREF: IRQ+7C↑j
                brclr   <byte_2 1 loc_FF31
                ldab    byte_168
                addb    #$20 ; ' '
                bcs     loc_FF31
                stab    byte_168

loc_FF31:                               ; CODE XREF: IRQ+7↑J
                                        ; IRQ:loc_FF23↑j ...
                ldaa    PIA_Ctrl_2
                eora    #1
                staa    PIA_Ctrl_2
                clr     byte_12B

loc_FF3C:                               ; CODE XREF: IRQ+24↑j
                ldaa    #1
                staa    PIA_Ctrl_4
                rti
; End of function IRQ

 ORG $FF7E
Copyright:      fcc "1993 COPYRIGHT CHRYSLER CORPORATION"
                fdb $FFFF
 ORG $FFBE      
                fcb $80
                fcb 2
; end of 'ROM_EPROM'

; ===========================================================================

; Segment type: Pure data
                ; segment USER_VEC
                org $FFC0
RESERVFFC0:     fcb $3F ; ?             ; RESERVED
RESERVFFC1:     fcb $3F ; ?             ; RESERVED
RESERVFFC2:     fcb $3F ; ?             ; RESERVED
RESERVFFC3:     fcb $3F ; ?             ; RESERVED
RESERVFFC4:     fcb $3F ; ?             ; RESERVED
RESERVFFC5:     fcb $3F ; ?             ; RESERVED
RESERVFFC6:     fcb $3F ; ?             ; RESERVED
RESERVFFC7:     fcb $3F ; ?             ; RESERVED
RESERVFFC8:     fcb $3F ; ?             ; RESERVED
RESERVFFC9:     fcb $3F ; ?             ; RESERVED
RESERVFFCA:     fcb $3F ; ?             ; RESERVED
RESERVFFCB:     fcb $3F ; ?             ; RESERVED
RESERVFFCC:     fcb $3F ; ?             ; RESERVED
RESERVFFCD:     fcb $3F ; ?             ; RESERVED
RESERVFFCE:     fcb $3F ; ?             ; RESERVED
RESERVFFCF:     fcb $3F ; ?             ; RESERVED
RESERVFFD0:     fcb $3F ; ?             ; RESERVED
RESERVFFD1:     fcb $3F ; ?             ; RESERVED
RESERVFFD2:     fcb $3F ; ?             ; RESERVED
RESERVFFD3:     fcb $3F ; ?             ; RESERVED
RESERVFFD4:     fcb $3F ; ?             ; RESERVED
RESERVFFD5:     fcb $3F ; ?             ; RESERVED
                fdb SCISS               ; SCI Serial System
                fdb SCISS               ; SPI Serial Transfer Complete
                fdb PAII                ; Pulse Accumulator Input Edge
                fdb PAII                ; Pulse Accumulator Overflow
                fdb PAII                ; Timer Overflow
                fdb I4_I5               ; Timer Input Capture 4 / Output Compare 5
                fdb PAII                ; Timer Output Compare 4
                fdb PAII                ; Timer Output Compare 3
                fdb PAII                ; Timer Output Compare 2
                fdb OC1I                ; Timer Output Compare 1
                fdb PAII                ; Timer Input Capture 3
                fdb IC2I                ; Timer Input Capture 2
                fdb IC1I                ; Timer Input Capture 1
                fdb PAII                ; Real Time Interrupt
                fdb IRQ                 ; IRQ
                fdb SCISS               ; XIRQ Pin
                fdb SCISS               ; Software Interrupt
                fdb SCISS               ; Illegal Opcode Trap
                fdb SCISS               ; COP Failure
                fdb CME                 ; Clock Monitor Fail
off_FFFE:       fdb __RESET             ; Processor reset
; end of 'USER_VEC'


                end
