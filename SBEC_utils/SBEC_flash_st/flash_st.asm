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

    ldX     #$8000

Next64ByteBlock:

; each time programming voltage is disconnected
; we receive a 0x00, write this byte before the
; buffer so it doesn't get written to the EEPROM

    ldY     #Buffer-1

LoopToFillRAM:
    ldD     $102E
    bitA    #%00100000
    beq     LoopToFillRAM
    staB    $00,Y
    inY
    cpY     #Buffer+64
    bne     LoopToFillRAM
    ldY     #$4119      ; 50ms
wait_0:
    deY
    bne     wait_0
    ldY     #Buffer

InitRetryCounter:
    ldaA    #$19
    staA    <RetryCounter

ProgramBytes:
    ldaA    #$40
    staA    $00,X
    ldaA    $00,Y
    staA    $00,X
    ldaB    #$28
    bsr     ShortDelayLoop
    ldaB    #$C0
    staB    $00,X
    ldaB    #$02
    bsr     ShortDelayLoop
    cmpA    $00,X
    beq     ByteVerified
    dec     RetryCounter
    bne     ProgramBytes

Finished:
    ldaA    #$19
    staA    <RetryCounter

wait_1:
    ldY     #$1A0A      ; 20ms

wait_2:
    deY
    bne     wait_2
    dec     RetryCounter
    bne     wait_1
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

ByteVerified:
ResetEEPROM:
    ldaB    #$FF
    staB    $00,X
    staB    $00,X
    clrB
    staB    $00,X
    ldaB    #$64
    bsr     ShortDelayLoop
    inX
    inY
    cpY     #Buffer+64
    bne     InitRetryCounter

SkipEEPROM:
    cpX     #$B600
    bne     Skip                       ; branch if not equal (not zero)
    ldX     #$B800                     ; load index with value

Skip:
    cpX     #$0000
    beq     Finished
    ldY     #Next64ByteBlock
    jmp     $00,Y

ShortDelayLoop:
    decB
    bne     ShortDelayLoop           ; branch if not equal (not zero)
    rts                              ; return from subroutine

RetryCounter:
    fcb   $19
    fcb   $00
Buffer:
 OPT NOL
 REPEAT 64
    fcb $00
; pad bootstrap to 256 total bytes
 REPEAT 256-*
    fcb $00
 OPT LIS
