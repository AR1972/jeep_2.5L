; 68HC11 bootstrap, download to a SBEC that has been
; placed into bootstrap mode by applying 12 volts to
; pin 45 until SBEC sends 0x00 on pin 25.
;
; bootstrap will bulk erase eeprom then fill a 64
; byte buffer then write buffer to eeprom, repeat
; until 512 bytes has been written then send eeprom
; to PC for verification

    ORG $0000

Start:
    ldS    #$FF              ; stack pointer = 0xFF
    ldX    #$1000            ; config 68HC11 registers
    ldD    #$330C            ; config SCI
    staA   $2B,X             ; store value in register A ($33) in 0x1000 + 0x002B
                             ; configures SCI for 1200 BAUD
    staB   $2D,X             ; store value in register B ($0C) in 0x1000 + 0x002D
                             ; configures SCI for TXD/RXD
    sei                      ; disable interrupts
    ldD    #$6001            ; load D register with 0x6001
    staA   $3C,X             ; store value in register A ($60) in 0x1000 + 0x003C
                             ; enables Special Mode
    staB   $3F,X             ; store value in register B ($01) in 0x1000 + 0x003F
                             ; System config Register
    ldaA   #%00010000        ; disable write protection for $B600->$B800
                             ; write protect system config register $103F
                             ; this is needed for the 68hc11E9 MCU
    staA   $35,X

EraseEEPROM:
    ldX    #$B600
    ldaA   #%00000110        ; load a with erase commands
    staA   $103B             ; set control reg to allow erase
    staB   0,X               ; write any byte to the eeprom address
    inc    $103B             ; turn on programming bit EEPGM
    pshX
    ldX    #10000/3          ; set up for 10ms delay
    bsr    Delay
    dec    $103B             ; turn off programming bit EEPGM
    clr    $103B             ; set all control reg bits to 0
    pulX                     ; point X to beginning of eeprom

Next64ByteBlock:
    ldy    #Buffer           ; point Y to beginning of write buffer

FillBuffer:
    ldD    $102E
    bitA   #%00100000        ; check if a byte was received
    beq    FillBuffer        ; loop if no
    staB   $00,Y             ; store byte in buffer
    inY                      ; point to next byte in buffer
    cpY    #Buffer+64      ; check if buffer is full
    bne    FillBuffer        ; get next byte
    pshX
    ldX    #$C8
    bsr    Delay
    pulX
    ldY    #Buffer           ; point Y to beginning of buffer

InitRetryCounter:
    ldaA   #$19
    staA   <RetryCounter

SkipCheck:
    ldaA   $00,Y             ; load byte from write buffer into A
    cmpA   #$FF              ; skip write if byte in A is 0xFF
    beq    ByteVerified
    cmpA   $00,X             ; skip write if value in eeprom is the
    beq    ByteVerified      ; same as byte in A

ProgramBytes:
    ldaB   #%00010010        ; set BYTE and EELAT bit
    staB   $103B             ; store A into PPROG register
    staA   $00,X             ; store byte in A into eeprom address
    inc    $103B             ; turn on programming bit EEPGM
    pshX                     ; save eeprom address (X) to stack
    ldX    #10000/3          ; set up for 10ms delay
    bsr    Delay
    pulX                     ; pull eeprom address off stack into X
    dec    $103B             ; turn off programming bit EEPGM
    clr    $103B             ; set all control reg bits to 0
    cmpA   $00,X             ; compare a with memory at index + value -00000000-
    beq    ByteVerified      ; branch if equal (zero)
    dec    RetryCounter      ; decrement memory contents
    bne    ProgramBytes      ; branch if not equal (not zero)
    jmp    ByteVerified

Finished:
    ldX    #$FFFF            ; give receiver about 200ms
    bsr    Delay

SendData:
    ldX    #$B600

GetNextByte:
    ldaB   0,X

WaitForSCI:
    ldaA   $102E             ; check SCI status
    andA   #%10000000        ; check if ready to send
    beq    WaitForSCI        ; loop until ready
    staB   $102F             ; send byte to SCI
    inX                      ; point X to next byte
    cpX    #$B800
    bne    GetNextByte       ; loop until X = 0x0000
Done:
    stop

Delay:
    deX
    bne    Delay
    rts

ByteVerified:
    inX                      ; increment eeprom address (X)
    inY                      ; increment write buffer (Y)
    cpY   #Buffer+64
    bne   InitRetryCounter
    cpX   #$B800
    bne   Next64ByteBlock
    bra   Finished

RetryCounter:
    fcb   $19
Buffer:
    bsz 64
                             ; pad bootstrap to 256 total bytes
    bsz 256-*
