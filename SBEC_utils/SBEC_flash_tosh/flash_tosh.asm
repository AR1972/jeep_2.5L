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

    ldX     #$8000        ; load index with value

Next64ByteBlock:
    ldY     #Buffer-1
    cpX     #$B600
    bne     LoopToFillRAM
    ldX     #$B800

LoopToFillRAM:
    ldD     $102E
    bitA    #%00100000
    beq     LoopToFillRAM
    staB    $00,Y
    inY
    cpY     #Buffer+$40
    bne     LoopToFillRAM

    ldY     #$4119           ; 50ms
wait_0:
    deY
    bne     wait_0

    ldY     #Buffer

pgm_sector:
    ldD     #$AAA0
    staA    $D555
    comA
    staA    $AAAA
    staB    $D555
    clrB
    staB    $A000

pgm_even:
    ldaA    $00,Y
    staA    $00,X
    inY
    inX
    ldaB    #$0C
    bsr     ShortDelayLoop
    cpY     #Buffer+$40
    bne     pgm_even

reset:
    xgdx
    subD    #$40
    xgdx
    ldY     #Buffer

pgm_odd:
    ldaA    $01,Y
    staA    $01,X
    inY
    inX
    ldaB    #$0C
    bsr     ShortDelayLoop
    cpY     #Buffer+$40
    bne     pgm_odd
    cpX     #$0000
    bne     Next64ByteBlock

Finished:
    ldaA    #$19
    staA    RetryCounter

wait_1:
    ldY     #$0D05*2   ; 10ms x 2

wait_2:
    deY
    bne     wait_2
    dec     RetryCounter
    bne     wait_1
    ldX     #$8000

SendByte:
    ldaB    0,X

WaitForSCI:
    ldaA    $102E
    andA    #%10000000
    beq     WaitForSCI
    staB    $102F
    inX
    bne     SendByte

XXX:
    stop

ShortDelayLoop:
    decB
    bne     ShortDelayLoop
    rts

RetryCounter:
    fcb $19
    fcb $00
Buffer:
 REPEAT $40
    fcb 0x00
 ENDR
THE_END:

                             ; pad bootstrap to 256 total bytes
 REPEAT 256-(THE_END-THE_BEGIN)
    fcb 0x00
 ENDR