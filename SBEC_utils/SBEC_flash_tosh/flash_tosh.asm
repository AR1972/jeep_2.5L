; 68HC11 bootstrap, download to a SBEC that has been
; placed into bootstrap mode by applying 12 volts to
; pin 45 until SBEC sends 0x00 on pin 25.

    ORG $0000

THE_BEGIN:
Start:
    ldS     #$FF        ; stack pointer = 0xFF
    ldX     #$1000      ; config 68HC11 registers
    ldD     #$330C      ; config SCI
    staA    $2B,X       ; store value in register A ($33) in 0x1000 + 0x002B
                        ; configures SCI for 1200 BAUD
    staB    $2D,X       ; store value in register B ($0C) in 0x1000 + 0x002D
                        ; configures SCI for TXD/RXD
    sei                 ; disable interrupts
    ldD     #$6001      ; load D register with 0x6001
    staA    $3C,X       ; store value in register A ($60) in 0x1000 + 0x003C
                        ; enables Special Mode
    staB    $3F,X       ; store value in register B ($01) in 0x1000 + 0x003F
                        ; System Config Register

; give receiver around 100ms

    ldX     #$7E00
Delay:
    deX
    bne     Delay

    ldx   #$8000               ; load index with value

Next64ByteBlock:
           ldy   #Buffer               ; load index with value

LoopToFillRAM:
           ldd   $102E
           bita  #%00100000                       ;  -00100000-
           beq   LoopToFillRAM              ; branch if equal (zero)
           stab  $00,Y                    ;  -00000000-
           iny                              ; increment index (x=x+1)
           cpy   #LenBuffer
           bne   LoopToFillRAM              ; branch if not equal (not zero)
           ldab  #$C8                      ; load b with value -11001000-
           jsr   ShortDelayLoop
           ldy   #Buffer               ; load index with value

InitRetryCounter:
           ldab  #$19                       ; load b with value -00011001-
           stab  RetryCounter               ; store b into memory

ProgramBytes:
           ldD   #$AAA0                    ; load d (a&b) with value
           staA  $D555
           comA
           staA  $AAAA
           staA  $D555                      ; store b into memory
           clrB                             ; b = 0
           staB  $A000                      ; store b into memory
           ldaB  $00,Y                    ; load b with memory at index + value -00000000-
           staB  $00,X                    ;  -00000000-
           ldaB  #$50                      ; load b with value -01010000-
           bra   ShortDelayLoop             ; branch
; not sure what all this is about, but it's different from the FCC version. Needed?
;           ldab  0x00, Y                   ; load b with memory at index + value -00000000-
;           stab  0x00, X                   ;  -00000000-
;           nop                             ; no operation
;           nop                             ; no operation

VerifyByte:
           ldaA  $00,X                    ; load b with memory at index + value -00000000-
;           ldaa  LAAAA                     ; load a with memory contents
;           ldaa  LD555                     ; load a with memory contents
;           ldaa  CPU_SerialStatus          ; load a with memory contents
;           ldaa  CPU_SerialData            ; load a with memory contents
           cmpa  $00,Y                    ;  -00000000-
           beq   ByteVerified               ; branch if equal (zero)
VerifyFailed:
           dec   RetryCounter               ; decrement memory contents
           bne   ProgramBytes               ; branch if not equal (not zero)

Finished:

          stop

ByteVerified:
           inX                              ; increment index (x=x+1)
           inY                              ; increment index (x=x+1)
           cpY   #LenBuffer
           bne   InitRetryCounter           ; branch if not equal (not zero)

SkipEEPROM:
           cpX   #$b600
           bne   Skip                       ; branch if not equal (not zero)
           ldX   #$b800                    ; load index with value

Skip:   
           cpX   #$0000
           bne   Next64ByteBlock
           bra   Finished                   ; branch if not equal (not zero)

ShortDelayLoop:
           decB
           bne   ShortDelayLoop             ; branch if not equal (not zero)
           rts                              ; return from subroutine
Done:
    stop

RetryCounter:
    fcb   $19
Buffer:
 REPEAT $40
    fcb 0x00
 ENDR
LenBuffer:
THE_END:

                             ; pad bootstrap to 256 total bytes
 REPEAT 256-(THE_END-THE_BEGIN)
    fcb 0x00
 ENDR