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
    staB    $3F,X       ; store valie in register B ($01) in 0x1000 + 0x003F
                        ; System Config Register

; give receiver around 100ms to apply 20 volts to pin 45

    ldX     #$7E00
wait_1:
    deX
    bne     wait_1

    ldD     #$AAC0
    staA    $D555       ; write $AA to address $D555
    comA                ; $AA is now $55
    staA    $AAAA       ; write $55 to address $AAAA
    staB    $D555       ; write $C0 to address $D555
    ldD     #$FF0C
    staA    $AAAA       ; write $FF to address $AAAA

wait_2sec:
    ldX     #$D903

wait_2:
    deX
    bne     wait_2
    decB
    bne     wait_2sec
    ldaB    $AAAA       ; read from address $AAAA
    ldaB    $D555       ; read from address $D555

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
    stop

THE_END:

                             ; pad bootstrap to 256 total bytes
 REPEAT 256-(THE_END-THE_BEGIN)
    fcb 0x00
 ENDR