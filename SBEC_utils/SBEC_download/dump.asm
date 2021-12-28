; 68HC11 bootstrap, download to a SBEC that has been
; placed into bootstrap mode by applying 12 volts to
; pin 45 until SBEC sends 0x00 on pin 25. Bootstrap
; checks for first 2 bytes of the Mopar part number
; at 0x2000 if not found sets start address for the
; download to 0x8000 then sends EPROM image of two
; possible sizes 0x2000 -> 0xFFFF or 0x8000 -> 0xFFFF

    ORG $0000

Start:
    ldS     #$FF        ; stack pointer = 0xFF
    ldX     #$1000      ; config 68HC11 registers
    ldD     #$330C      ; config SCI
    staA    $2B,X       ; store value in register A ($33) in 0x1000 + 0x002B
                        ; configures SCI for 1200 BAUD
    staB    $2D,X       ; store value in register B ($0C) in 0x1000 + 0x002D
                        ; configures SCI for TXD/RXD
    sei                 ; disable interupts
    ldD     #$6001      ; load D register with 0x6001
    staA    $3C,X       ; store value in register A ($60) in 0x1000 + 0x003C
                        ; enables Special Mode
    staB    $3F,X       ; store valie in register B ($01) in 0x1000 + 0x003F
                        ; System Config Register

; give receiver around 200ms to prepare for byte stream

    ldX     #$FFFF
Delay:
    deX
    bne     Delay

; this section tries to determin a 64k EPROM by checking
; for the first two bytes of the part number that should
; be located at 0x2002

    ldX     #$2000
    ldD     $02,X
    cpD     #$5602      ; check for the part number
    bne     ThirtyTwoK  ; assume a 32k EEPROM if part num not found
    ldX     #$2000      ; looks like a 64k EEPROM 0x2000 is the start address
    bra     SendByte

ThirtyTwoK:
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
Done:
    stop


