; 68HC11 bootstrap, download to a SBEC that has been
; placed into bootstrap mode by applying 12 volts to
; pin 45 until SBEC sends 0x00 on pin 25.

 OPT H11
    ORG $0000

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

; give receiver around 100ms to apply 20 volts to pin 45

; each time programming voltage is disconnected
; we receive a 0x00, this helps us to time our
; loop wait until it is received and discard it

wait_for_it:
    ldD     $102E
    bitA    #%00100000
    beq     wait_for_it
    ldY     #$0BB8
    ldX     #$8000

SendEraseCommand:
    ldaA    #$20
    staA    $00,X
    staA    $00,X
    pshX

Delay120ms:
    ldX     #$0FA0

LongDelayLoop:
    deX
    bne     LongDelayLoop
    pulX
    ldaA    #$FF

EraseConfirmLoop:
    ldaB    #$A0
    staB    $00,X

    ldaB    #$02
wait:
    decB
    bne     wait
    cmpa    $00,X
    bne     CheckEraseRetryCounter
    inx

SkipEEPROM:
    cpx     #$b600
    bne     Skip3                      ; branch if not equal (not zero)
    ldx     #$b800                     ; load index with value

Skip3:
    cpx     #$0000
    bne     EraseConfirmLoop
    bra     JumpToStart

CheckEraseRetryCounter:
    deY
    bne     SendEraseCommand

JumpToStart:

; each time programming voltage is disconnected
; we receive a 0x00, this helps us to time our
; loop wait until it is received and discard it

    ldD     $102E
    bitA    #%00100000
    beq     JumpToStart
    ldX     #$8000      ; load the start address in register X

SendByte:
    ldaB    0,X         ; load byte at address X+0

WaitForSCI:
    ldaA    $102E       ; check SCI status
    andA    #%10000000  ; check if ready to send
    beq     WaitForSCI  ; loop until ready
    staB    $102F       ; send byte to SCI
    inX                 ; point X to next byte
    bne     SendByte    ; loop until X = 0x0000

XXX:
    stop
    bra     XXX

; pad bootstrap to 256 total bytes
 OPT NOL
 REPEAT 256-*
    fcb $00
 OPT LIS
