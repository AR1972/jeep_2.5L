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

    ldX   #$8000        ; load index with value

Next64ByteBlock:
    ldY   #Buffer-1     ; load index with value
    cpX   #$B600
    bne   LoopToFillRAM
    ldX   #$B800

LoopToFillRAM:
    ldD   $102E
    bitA  #%00100000       ; -00100000-
    beq   LoopToFillRAM    ; branch if equal (zero)
    staB  $00,Y            ; -00000000-
    inY                    ; increment index (x=x+1)
    cpY   #Buffer+$40
    bne   LoopToFillRAM    ; branch if not equal (not zero)

    ldY   #$4119           ; 50ms
wait_0:
    deY
    bne   wait_0
    
    ldY   #Buffer                    ; load index with value

pgm_sector:    
    ldD   #$AAA0                    ; load d (a&b) with value
    staA  $D555
    comA
    staA  $AAAA
    staB  $D555                      ; store b into memory
    clrB                             ; b = 0
    staB  $A000                      ; store b into memory

pgm_even:
    ldaA  $00,Y            ; load a with value from temp RAM
    staA  $00,X
    inY
    inX
    ldaB  #$0A
    bsr   ShortDelayLoop
    cpY   #Buffer+$40
    bne   pgm_even

reset:
    xgdx
    subD  #$40
    xgdx
    ldY   #Buffer

pgm_odd:
    ldaA  $01,Y
    staA  $01,X
    inY
    inX
    ldaB  #$0A
    bsr   ShortDelayLoop
    cpY   #Buffer+$40
    bne   pgm_odd
    cpX   #$0000  
    bne   Next64ByteBlock

Finished:
    staB    $00,X
    ldaA    #$19
    staA    RetryCounter

wait_1:
    ldY     #$4119      ; 50ms

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
    jmp     XXX

ShortDelayLoop:
    decB
    bne   ShortDelayLoop             ; branch if not equal (not zero)
    rts                              ; return from subroutine

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