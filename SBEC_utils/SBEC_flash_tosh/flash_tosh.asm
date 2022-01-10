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

    ldX     #$8000      ; load index with value

Next64ByteBlock:
    ldY     #Buffer-1   ; ECU nearly always receives $00 when programming
                        ; voltage is disconnected store it before the buffer
    clr     Odd         ; init our EVEN, ODD flag
    cpX     #$B600         ; PC won't be sending the MCU EEPROM address $B600->$B800
    bne     LoopToFillRAM  ; so just skip it
    ldX     #$B800

LoopToFillRAM:
    ldD     $102E          ; loop until a byte has been received
    bitA    #%00100000
    beq     LoopToFillRAM
    staB    $00,Y          ; store byte to write buffer
    inY                    ; increment buffer address
    cpY     #Buffer+$40    ; test if buffer is full
    bne     LoopToFillRAM  ; loop until buffer is full

; we need to delay a little to allow the PC some time to apply 20 volts to pin
; 45, the ECU will then apply 12 (Vpp) volts to pin 1 of the EEPROM

    ldY     #$4119      ; 50ms
wait_0:
    deY
    bne     wait_0

    ldY     #Buffer     ; point to the beginning of the write buffer

; the Jeep Toshiba EEPROM's have 64 byte sectors, bytes to be programmed
; are loaded EVEN/ODD or ODD/EVEN, once the 64th byte to be programmed is
; loaded, or maybe the 65th, the chip begins writing the bytes. The first
; byte loaded determines if ODD ore EVENS are going to be loaded first.
; it is unclear if each sector is flashed after each load sequence, or
; just once after both ODD and EVEN bytes have been loaded.

pgm_sector:
    ldD     #$AAA0      ; pretty much the SDP disable the AT29C256 uses
    staA    $D555       ; store $AA @ address $D555
    comA                ; $AA is now $55
    staA    $AAAA       ; store $55 @ address $AAAA
    staB    $D555       ; store $A0 @ address $D555
    clrB                ; register B is now $00
    ;staB    $A000      ; works for some Toshiba chips
                        ; store $00 @ address $8000
    staB    $8000       ; works for both discovered
                        ; variants of Toshiba chips

; first pass, 64 bytes are loaded from the write buffer, starting with an EVEN byte ($00),
; second pass, 63 bytes are loaded from the write buffer starting with an ODD byte ($01).
; it's unclear if each sector is flashed twice, after each loading sequence, or just once.

ld_bytes:
    ldaA    $00,Y       ; load byte from our buffer into register A
    staA    $00,X       ; store byte to EEPROM
    inY                 ; increment buffer address
    inX                 ; increment EEPROM address
    ldaB    #$0C                ; a little delay is needed for EEPROM to
    bsr     ShortDelayLoop      ; register the byte to be written
    cpY     #Buffer+$40         ; test to see if we have reached the end
    bne     ld_bytes            ; of the write buffer
    brclr   Odd,$00000001,reset ; test if we need to load ODD bytes
    deX                         ;
    bsr     VerifyWriteComplete ; wait for the last byte loaded to be written
    inX
    cpX     #$0000              ; test if X has rolled over to $0000 and programming
    bne     Next64ByteBlock     ; is finished, or get the next 64 bytes to be written.

Finished:
    ldaA    #$19                ; wait for programming voltage to be disconnected
    staA    Delay               ; EEPROM and ECU need about 2 seconds before we
                                ; start sending bytes or write verification or
                                ; tends to fail.
wait_1:
    ldY     #$0D05*2            ; 10ms x 2

wait_2:
    deY
    bne     wait_2
    dec     Delay
    bne     wait_1

    ldX     #$8000      ; point to the beginning of the EEPROM

SendByte:
    ldaB    0,X         ; load byte into B

WaitForSCI:
    ldaA    $102E       ; wait for SCI to be ready to send
    andA    #%10000000
    beq     WaitForSCI
    staB    $102F       ; send byte
    inX                 ; point to next byte
    bne     SendByte    ; loop until X rolls over to $0000

XXX:
    stop

ShortDelayLoop:
    decB
    bne     ShortDelayLoop
    rts

; reset to the beginning of the write buffer plus one.
; reset to the beginning of the EEPROM sector plus one.
; set flag to indicate ODD bytes have been/are being loaded

reset:
    xgdx                ; move X register to D register
    subD    #$40-1      ; subtract $3F from D register
    xgdx                ; move D register to X register
    ldY     #Buffer+1   ; point to beginning of write buffer plus one
    inc     Odd         ; set ODD bytes flag
    bra     ld_bytes    ; load ODD bytes

; loop until byte has been written, should
; take 20ms MAX to write a sector

VerifyWriteComplete:
    ldaB    0,X
    pshA
    andA    #%10000000
    andB    #%10000000
    cBA
    pulA
    bne     VerifyWriteComplete
    rts

Odd:
Delay:
    fcb $00
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