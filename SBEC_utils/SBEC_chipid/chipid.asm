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

; give receiver around 50ms too apply 20 volts to pin 45

   ldX      #$4119      ; 50ms
   jsr      wait

   ldD      #$AA90
   staA     $D555       ; store $AA at address $D555
   comA                 ; $AA is now $55
   staA     $AAAA       ; store $55 in address $AAAA
   staB     $D555       ; store $90 in address $D555

   ldX      #$0D05      ; 10ms
   jsr      wait

   ldD      $A000       ; ID should now be at $A000
   stD      mfg_id      ; copy ID from address to ram

   ldD      #$AAF0
   staA     $D555
   comA
   staA     $AAAA
   staB     $D555

   ldX      #$0D05      ; 10ms
   jsr      wait

   ldaB     mfg_id      ; send manufacture id to PC
   jsr      send

   ldaB     chp_id      ; send chip id to PC
   jsr      send
   stop

send:
   ldaA     $102E
   andA     #%10000000
   beq      send
   staB     $102F
   rts

wait:
   deX
   bne      wait
   rts

mfg_id fcb $AA
chp_id fcb $AA

THE_END:

                        ; pad bootstrap to 256 total bytes
 REPEAT 256-(THE_END-THE_BEGIN)
    fcb 0x00
 ENDR