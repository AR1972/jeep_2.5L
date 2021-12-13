; 68HC11 bootstrap, download to a SBEC that has been
; placed into bootstrap mode by applying 12 volts to
; pin 45 until SBEC sends 0x00 on pin 25.
;
; bootstrap will send $B600->$B800 for backup, erase the
; 68hc11 eeprom, then send $B600->$B800 for verification

    ORG $0000

THE_BEGIN:
Start:
    ldS    #$FF         ; stack pointer = 0xFF
    ldX    #$1000       ; config 68HC11 registers
    ldD    #$330C       ; config SCI
    staA   $2B,X        ; store value in register A ($33) in 0x1000 + 0x002B
                        ; configures SCI for 1200 BAUD
    staB   $2D,X        ; store value in register B ($0C) in 0x1000 + 0x002D
                        ; configures SCI for TXD/RXD
    sei                 ; disable interrupts
    ldD    #$6001       ; load D register with 0x6001
    staA   $3C,X        ; store value in register A ($60) in 0x1000 + 0x003C
                        ; enables Special Mode
    staB   $3F,X        ; store value in register B ($01) in 0x1000 + 0x003F
                        ; System config Register
    ldaA   #%00010000   ; disable write protection for $B600->$B800
    staA   $35,X

    ldX    #$FFFF
    bsr    Delay
    bsr    SendData
    
EraseEEPROM:
    ldX    #$B600
    ldaA   #%00000100 | %00000010  ; load a with erase commands
    staA   $103B        ; set control reg to allow erase
    staB   0,X          ; write any byte to the eeprom address
    inc    $103B        ; turn on programming bit eep_EEPGM

    ;need to pause 10mSecs -  delay loop is 6 cycles long so at 2 mhz e-clock rate,
    ;value = 10mSec / (6 * (1 sec/2000000 cycles)) = 3334 or 0d06

    ldX    #$0D06       ; delay value to wait until erase cycle is complete
    bsr    Delay
    dec    $103B        ; turn off programming bit eep_EEPGM
    clr    $103B        ; set all control reg bits to 0

    ldX    #$FFFF
    bsr    Delay
    bsr    SendData
    stop

Delay:
    deX
    bne    Delay
    rts

SendData:
    ldx    #$B600

GetNextByte:
    ldaB   0,X

WaitForSCI:
    ldaA   $102E        ; check SCI status
    andA   #%10000000   ; check if ready to send
    beq    WaitForSCI   ; loop until ready
    staB   $102F        ; send byte to SCI
    inX                 ; point X to next byte
    cpX    #$B800
    bne    GetNextByte  ; loop until X = 0x0000
    rts

THE_END:

; pad bootstrap to 256 total bytes
 REPEAT 256-(THE_END-THE_BEGIN)
 fcb 0x00
 ENDR

