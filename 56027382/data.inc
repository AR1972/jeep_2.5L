

byte_8000:      fcb 1                   ; sub_DDA7+4↓o
                fcb 0
byte_8002:      fcb $56                 ; RESERVED:loc_CC19↓o
                fcb 2
                fcb $73
byte_8005:      fcb $82                 ; sub_D004+2B↓r
byte_8006:      fcb $B1                 ; RESERVED:CC4C↓r
byte_8007:      fcb $56                 ; RESERVED:CC20↓o
                fcb 2
                fcb $74
                fcb 4
byte_800B:      fcb $B1                 ; RESERVED:CC53↓r
                fcb $2A
byte_800D:      fcb $2E                 ; RESERVED:loc_CC44↓o
                fcb $18
                fcb $12
                fcb $88
                fcb $FF
byte_8012:      fcb 1                   ; ROM:E038↓r
                fcb $82
byte_8014:      fcb $FF                 ; sub_DEC8+62↓r
byte_8015:      fcb $81                 ; __RESET+3A↓r __RESET+10F↓r ...
byte_8016:      fcb $20                 ; __RESET+413↓r sub_9C70+4↓r ...
byte_8017:      fcb 3                   ; __RESET+3A5↓r
byte_8018:      fcb $10                 ; sub_BA0E:loc_BB17↓r
byte_8019:      fcb 2                   ; sub_BA0E+10F↓r
byte_801A:      fcb 1                   ; sub_BA0E+116↓r
byte_801B:      fcb $5C                 ; __RESET+3A8↓r __RESET+3AF↓r ...
byte_801C:      fcb $26                 ; sub_BA0E+15C↓r
byte_801D:      fcb $4C                 ; sub_BA0E+163↓r
byte_801E:      fcb 4                   ; sub_B914+1C↓r sub_B914+42↓r ...
byte_801F:      fcb $90                 ; sub_BA0E+BA↓r sub_BC27↓r
byte_8020:      fcb $D0                 ; sub_BC27+7↓r
                                        ; sub_BC27:loc_BC33↓r
byte_8021:      fcb 0                   ; sub_E3F8↓r
byte_8022:      fcb 0                   ; sub_E3F8:loc_E3FE↓r
                fcb 0
byte_8024:      fcb 5                   ; sub_B976+C↓o
                fcb $1F, 0, 0, $42
                fcb $3E, 8, 0, 8
                fcb $5E, 9, $FF, $B6
                fcb $7D, 0, 0, $53
                fcb $9C, $A
byte_8037:      fcb $90                 ; sub_B976+24↓r sub_BBDE+6↓o
byte_8038:      fcb $20                 ; sub_B976+2B↓r
                fcb $F
                fcb $A0
                fcb $14
                fcb $50
                fcb $17
                fcb $70
                fcb $20
                fcb $D0
                fcb $23
                fcb $F0
                fcb $2E
                fcb $E0
                fcb $3E
                fcb $80
                fcb $4E
                fcb $20
                fcb $5D
                fcb $C0
                fcb $6D
                fcb $60
                fcb $7D
                fcb 0
                fcb $8C
                fcb $A0
                fcb $9C
                fcb $40
byte_8053:      fcb 3                   ; sub_E43E↓o
                fcb $13, 0, 5, $25
                fcb $2F, $90, 1, 5
                fcb $9C, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
byte_8072:      fcb 3                   ; sub_E3C7+4↓r
                fcb $93
byte_8074:      fcb $87                 ; sub_E3C7+7↓r
                fcb 0
byte_8076:      fcb 0                   ; sub_E3C7+10↓r
                fcb 3
byte_8078:      fcb $93                 ; sub_E3C7+13↓r
                fcb $87
byte_807A:      fcb $53                 ; ROM:loc_ED1B↓r
                fcb $B5
byte_807C:      fcb $75                 ; sub_BF21+4↓r ROM:ED03↓r
                fcb $30
byte_807E:      fcb 0                   ; sub_BF21+27↓r
byte_807F:      fcb $14                 ; ROM:ED64↓r
byte_8080:      fcb 2                   ; sub_BD17+1B8↓r
byte_8081:      fcb 4                   ; sub_BD17+1B0↓r
byte_8082:      fcb 5                   ; sub_BD17+1A7↓r
byte_8083:      fcb $11                 ; sub_BD17+3↓o
                fcb 9
                fcb 0
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $E, 8, 8
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $E, $A, $A
                fcb $1C, $1C, $1C, $1C, $20, $20, $14, $C, $A
                fcb $1C, $1C, $1E, $20, $25, $25, $16, $D, $B
                fcb $1C, $1C, $1F, $31, $2D, $27, $17, $E, $10
                fcb $1C, $1C, $20, $3C, $2B, $29, $1A, $10, $12
                fcb $1C, $1C, $26, $3D, $32, $2C, $1E, $10, $10
                fcb $1C, $2C, $36, $36, $34, $2F, $20, $16, $13
                fcb $1C, $2C, $36, $3B, $38, $30, $21, $1B, $14
                fcb $1C, $2C, $36, $43, $39, $33, $22, $1B, $15
                fcb $1C, $2C, $36, $47, $45, $42, $2D, $24, $24
                fcb $1C, $2C, $3A, $55, $51, $49, $37, $23, $23
                fcb $1C, $2C, $3A, $56, $52, $4A, $3D, $23, $23
                fcb $1C, $2C, $3C, $58, $52, $4A, $3F, $31, $24
                fcb $1C, $2C, $40, $53, $55, $49, $46, $42, $3B
                fcb $1C, $2C, $3C, $4B, $47, $49, $48, $42, $3C
                fcb $1C, $2C, $3C, $58, $52, $4D, $48, $3F, $3A
byte_811F:      fcb $11                 ; sub_BD17:loc_BD31↓o
                fcb 9
                fcb 0
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $E, 8, 8
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $E, $A, $A
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $12, $A, $A
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $16, $C, $A
                fcb $1C, $1C, $1C, $1C, $1C, $24, $18, $C, $A
                fcb $1C, $1C, $1C, $1C, $1C, $2C, $1C, $12, $10
                fcb $1C, $1C, $1C, $1C, $2A, $28, $18, $12, $10
                fcb $1C, $4C, $4A, $40, $36, $2C, $1C, $12, $10
                fcb $1C, $4C, $48, $4D, $36, $34, $24, $12, $10
                fcb $1C, $4C, $48, $4A, $48, $44, $2B, $12, $12
                fcb $1C, $4C, $48, $4E, $4D, $48, $33, $1F, $17
                fcb $1C, $4C, $48, $50, $4B, $44, $42, $32, $21
                fcb $1C, $4C, $54, $54, $56, $54, $42, $2A, $21
                fcb $1C, $4C, $5B, $58, $58, $54, $47, $28, $21
                fcb $1C, $4C, $4D, $50, $4D, $47, $32, $26, $23
                fcb $1C, $4C, $4D, $50, $4B, $3E, $2E, $28, $25
                fcb $1C, $4C, $4D, $50, $4B, $3E, $2E, $28, $25
byte_81BB:      fcb 3                   ; ROM:F0F3↓r
byte_81BC:      fcb $11                 ; sub_BD17+2F↓o
                fcb 9
                fcb 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
                fcb 0, 0, 0, 0, 0, 0, 0, 0, 0
byte_8258:      fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF
                                        ; sub_BD17:loc_BD5E↓o
                fcb $98, $98, $98, $98, $98, $98, $98
byte_8266:      fcb $28, $26, $24, $20, $20, $20, $20, $20, $1A
                                        ; sub_BD17+56↓o
byte_826F:      fcb $26, $24, $22, $20, $20, $1A, $14, $14, $14
                                        ; sub_BD17+65↓o
byte_8278:      fcb $D0                 ; sub_BD17+80↓r
byte_8279:      fcb 6                   ; sub_BD17+85↓r
byte_827A:      fcb $14                 ; sub_BD17+9E↓r
                                        ; sub_BD17:loc_BDD5↓r
byte_827B:      fcb $1C                 ; sub_BD17+CF↓r
byte_827C:      fcb 0, 0, 0, 0, 0, 0, 0, 0, 0 ; sub_BD17+C3↓o
byte_8285:      fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                                        ; sub_BD17+E0↓o
byte_828E:      fcb 1                   ; ROM:F174↓r
                fcb $B3
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb $FF
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
byte_82AF:      fcb $53                 ; sub_C2E6+4↓r ROM:loc_ECD1↓r
                fcb $F0
byte_82B1:      fcb $75                 ; sub_BF21+7↓r sub_BF21+D↓r ...
                fcb $30
byte_82B3:      fcb $11                 ; sub_C379+17↓o
                fcb 9
                fcb 0
                fcb $3E, $3E, $3E, $3E, $3E, $3E, $42, $52, $6C
                fcb $50, $50, $4A, $4A, $4A, $50, $50, $60, $80
                fcb $50, $50, $4A, $50, $57, $58, $5C, $69, $8D
                fcb $4A, $60, $5B, $64, $6A, $68, $68, $6B, $86
                fcb $7A, $7A, $8E, $7D, $73, $70, $70, $6D, $80
                fcb $8A, $8A, $95, $7E, $7B, $74, $72, $76, $7A
                fcb $90, $9A, $9D, $8C, $7F, $7A, $77, $77, $7A
                fcb $A0, $9A, $9D, $88, $7D, $7A, $79, $7A, $79
                fcb $A0, $A0, $9D, $91, $80, $7B, $7A, $7C, $78
                fcb $A0, $B0, $9D, $86, $7A, $7D, $7A, $7C, $7E
                fcb $A0, $B0, $9D, $88, $7C, $7F, $7B, $7C, $A0
                fcb $A0, $CC, $98, $84, $7D, $7F, $8A, $8A, $E4
                fcb $A0, $E7, $99, $88, $7E, $7E, $E3, $E3, $E3
                fcb $A0, $D5, $A2, $91, $86, $87, $8E, $F9, $AC
                fcb $A0, $DC, $B2, $A2, $97, $99, $95, $95, $8F
                fcb $A0, $90, $D5, $C3, $B4, $A9, $A5, $C9, $9B
                fcb $A0, $90, $E1, $D1, $C6, $BE, $B7, $DA, $AA
byte_834F:      fcb $11                 ; sub_C379+F↓o
                fcb 9
                fcb 0
                fcb $38, $38, $38, $38, $38, $38, $38, $38, $38
                fcb $38, $38, $38, $38, $38, $38, $3F, $3F, $3F
                fcb $40, $40, $40, $40, $40, $40, $43, $43, $43
                fcb $46, $46, $46, $46, $46, $46, $46, $46, $46
                fcb $44, $44, $44, $57, $43, $42, $47, $47, $47
                fcb $48, $48, $4B, $58, $45, $42, $4A, $4A, $4A
                fcb $5F, $5F, $5F, $58, $32, $36, $3E, $5C, $4E
                fcb $62, $64, $6D, $31, $32, $36, $43, $5C, $5C
                fcb $65, $68, $46, $3C, $3C, $3E, $45, $62, $62
                fcb $6B, $6B, $50, $3A, $35, $39, $45, $5E, $60
                fcb $6B, $6B, $49, $45, $42, $4A, $53, $6B, $6B
                fcb $50, $50, $4D, $43, $49, $50, $55, $6C, $6C
                fcb $48, $48, $46, $48, $4C, $54, $5A, $6E, $6E
                fcb $4A, $4A, $49, $49, $4E, $55, $59, $67, $67
                fcb $4C, $4C, $4C, $4B, $51, $57, $59, $59, $59
                fcb $4D, $4D, $4D, $55, $5D, $60, $70, $70, $70
                fcb $4A, $4A, $4A, $55, $5F, $5E, $5F, $5F, $5F
byte_83EB:      fcb $D0, $A4, $74, $13, $C, $A, 4, 4, 4 ; sub_C25C+3C↓o
byte_83F4:      fcb $14, $14, $14, $14, $10, $A, 3, 3, 3 ; sub_C25C+4C↓o
byte_83FD:      fcb $CA, $88, $58, $2A, $23, $F, 5, 0, 0 ; sub_C25C+1C↓o
byte_8406:      fcb $50, $48, $34, $1E, $10, 5, 0, 0, 0
                                        ; sub_C25C:loc_C290↓o
byte_840F:      fcb 0, 0, 0, 0, $40, $80, $80, $80, $80 ; sub_C39F+2↓o
byte_8418:      fcb 0, 0, 0, 0, 0, 0, 0, 0, 0 ; sub_C5F1+102↓o
byte_8421:      fcb $40, $40, $30, $30, $28, $20, $1A, 8, 8
                                        ; sub_C25C+2↓o
byte_842A:      fcb 8                   ; sub_C25C+76↓o
                fcb $61, $FF, $FE, $70
                fcb $71, $E6, $FA, $C0
                fcb $81, $92, $FC, $88
                fcb $92, $57, $FD, $80
                fcb $A2, $2F, $FE, $E0
                fcb $C2, $B, $FF, $D9
                fcb $E3, 6, $FF, $C9
                fcb $FF, 0
byte_8449:      fcb $F8, $C0, $6A, $2D, $28, $25, $14, $14, $14
                                        ; sub_BF66+6↓o
byte_8452:      fcb $CC, $CC, $CC, $CC, $CC, $CC, $E6, $FF, $FF
                                        ; sub_BF66+F↓o
word_845B:      fdb $BB8                ; sub_C5F1+1D7↓r
byte_845D:      fcb $D0                 ; sub_C5F1+1AC↓r
byte_845E:      fcb $D0                 ; sub_C5F1+1B3↓r
byte_845F:      fcb 4                   ; sub_C5F1+1C1↓r
byte_8460:      fcb $10, $10, $10, $10, $12, $18, $1C, $1C, $1C
                                        ; sub_C25C+5C↓o
byte_8469:      fcb $10, $10, $10, $B, 8, 8, 4, 4, 4 ; sub_C25C+54↓o
byte_8472:      fcb $20, $20, $20, $18, $18, $18, $18, $18, $18
                                        ; sub_C25C+64↓o
byte_847B:      fcb $FA, $D0, $B0, $32, $32, $32, $32, $1C, $1C
                                        ; sub_C25C+24↓o
byte_8484:      fcb $60, $50, $40, $40, $30, $30, $10, $10, $10
                                        ; sub_C25C+44↓o
byte_848D:      fcb $20, $20, $20, $20, $20, $40, $40, $40, $40
                                        ; sub_C25C+6C↓o
byte_8496:      fcb $80                 ; sub_C2E6:loc_C341↓o
                fcb $80
byte_8498:      fcb $96                 ; sub_BBF2+15↓r
byte_8499:      fcb $60                 ; sub_BBF2+3↓r
byte_849A:      fcb $9F                 ; sub_BBF2+21↓r
byte_849B:      fcb $20                 ; sub_C2E6+43↓o
                fcb $20
byte_849D:      fcb 0                   ; sub_C5F1+93↓r sub_C5F1+98↓r ...
                fcb 1
byte_849F:      fcb $FF                 ; sub_C5F1+EE↓r sub_C5F1+F3↓r ...
                fcb $D6
byte_84A1:      fcb 2                   ; sub_C7FB:loc_C866↓r
                                        ; sub_C7FB:loc_C87B↓r
                fcb $19
byte_84A3:      fcb $99                 ; sub_C379:loc_C385↓r
byte_84A4:      fcb $99                 ; sub_C379:loc_C38D↓r
                                        ; sub_C5F1+63↓o ...
byte_84A5:      fcb $40                 ; sub_C5F1+5A↓o sub_C5F1+187↓o
                fcb $40
byte_84A7:      fcb $F0                 ; sub_C39F+1E↓r
byte_84A8:      fcb $28, $28, $24, $20, $18, $18, $18, $18, $18
                                        ; sub_C211+2D↓o sub_C25C+12↓o
byte_84B1:      fcb $10                 ; sub_C3D3:loc_C3EC↓r
byte_84B2:      fcb 2                   ; sub_C3D3+2↓r
                fcb $4F
byte_84B4:      fcb 4                   ; sub_C079↓o
                fcb $13, 0, $A, $AB
                fcb $1F, $80, 2, $11
                fcb $3E, $C0, 1, $57
                fcb $6D, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
byte_84D3:      fcb 5                   ; sub_C079+10↓o
                fcb 9
                fcb 0
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                fcb $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C, $1C
                fcb $18, $18, $18, $18, $18, $18, $18, $18, $18
                fcb $18, $18, $18, $18, $18, $18, $18, $18, $18
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
byte_856F:      fcb 5                   ; sub_C079+1D↓o
                fcb 9
                fcb 0
                fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
                fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
                fcb $22, $22, $22, $22, $22, $22, $22, $22, $22
                fcb $20, $20, $20, $20, $20, $20, $20, $20, $20
                fcb $20, $20, $20, $20, $20, $20, $20, $20, $20
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
byte_860B:      fcb $B                  ; sub_C4A8+2B↓r
byte_860C:      fcb $10                 ; sub_C4A8:loc_C4D8↓r
byte_860D:      fcb $20                 ; sub_C4A8+26↓r
byte_860E:      fcb $20                 ; sub_C4A8+6↓r
byte_860F:      fcb 4                   ; sub_C3D3+6D↓r sub_C4A8+18↓r ...
byte_8610:      fcb 2                   ; sub_C4E4+11↓r sub_C4E4+46↓r
byte_8611:      fcb $60                 ; sub_C3D3+72↓r sub_C4A8+1D↓r
byte_8612:      fcb 1                   ; sub_C4E4:loc_C517↓r
byte_8613:      fcb $FE                 ; sub_C4E4+1C↓r
byte_8614:      fcb $29                 ; sub_C1FF+2↓r
byte_8615:      fcb $40                 ; sub_C34E↓o
byte_8616:      fcb $B                  ; sub_C53D+E↓r
byte_8617:      fcb 5                   ; sub_C53D+30↓r
byte_8618:      fcb $8C                 ; sub_C53D+1E↓r
byte_8619:      fcb $C0                 ; sub_C34E+15↓o
byte_861A:      fcb $B                  ; ROM:ECF7↓r
byte_861B:      fcb $15                 ; sub_C2E6+37↓o sub_C579+15↓r
                fcb $20
byte_861D:      fcb $26                 ; sub_C579+A↓r
byte_861E:      fcb $10                 ; sub_C579+32↓r
byte_861F:      fcb $A0                 ; sub_C579+23↓r
byte_8620:      fcb $C0                 ; sub_C2E6+4F↓o
                fcb $C0
byte_8622:      fcb $D6                 ; sub_C10C+4A↓r
byte_8623:      fcb 8                   ; sub_C10C:loc_C14F↓r
byte_8624:      fcb $B                  ; sub_C10C+5B↓r
byte_8625:      fcb $1D                 ; sub_C10C+56↓r
byte_8626:      fcb $FF                 ; sub_C10C+51↓r
byte_8627:      fcb 1                   ; sub_C10C:loc_C182↓r
byte_8628:      fcb $38                 ; sub_C10C+62↓r
byte_8629:      fcb $10                 ; sub_C10C+67↓o
                fcb 7
                fcb $A0
                fcb   0
                fcb $C0
byte_862E:      fcb 8                   ; sub_C10C:loc_C187↓o
                fcb 3
                fcb $90
                fcb 0
                fcb $E0
byte_8633:      fcb $A8                 ; sub_C10C+2D↓r sub_C10C+DB↓r
byte_8634:      fcb $68                 ; sub_C10C+28↓r sub_C10C+E1↓r
byte_8635:      fcb $10                 ; sub_C10C+C3↓r
                                        ; sub_C10C:loc_C1D4↓r
byte_8636:      fcb 4                   ; sub_C10C+EA↓r
byte_8637:      fcb 1                   ; sub_C09F+2↓r
byte_8638:      fcb $17                 ; sub_C09F+12↓r
byte_8639:      fcb $85                 ; sub_C09F+3C↓r
byte_863A:      fcb $32                 ; sub_C09F+48↓r
                                        ; sub_C09F:loc_C106↓r
byte_863B:      fcb $24                 ; sub_C09F:loc_C0EC↓r
                                        ; sub_C09F+60↓r
byte_863C:      fcb $56                 ; sub_C09F+1F↓r
byte_863D:      fcb $F1                 ; sub_C09F+24↓r
byte_863E:      fcb $17                 ; sub_C09F:loc_C0CD↓r
byte_863F:      fcb 0                   ; sub_C09F+5B↓r
                fcb 1
byte_8641:      fcb $6E                 ; sub_C09F+43↓r
byte_8642:      fcb $A0                 ; sub_C7FB+66↓r
byte_8643:      fcb 3                   ; sub_C7FB+31↓r sub_C7FB+40↓r ...
                fcb $84
byte_8645:      fcb 2                   ; sub_C7FB+2C↓r
byte_8646:      fcb $C0                 ; sub_C7FB:loc_C80F↓r
byte_8647:      fcb $F0                 ; sub_BF80+1C↓r
byte_8648:      fcb 3                   ; sub_BF80:loc_BFE2↓r
byte_8649:      fcb 1                   ; sub_C03B+17↓r
byte_864A:      fcb 8                   ; sub_BF80+2↓r
byte_864B:      fcb $A                  ; sub_BF80+9↓r
byte_864C:      fcb $9A                 ; sub_BF80+10↓r
byte_864D:      fcb 0                   ; sub_C03B+D↓r
                fcb 0
byte_864F:      fcb 3                   ; sub_C03B+26↓r sub_C03B+35↓r
                fcb $A
byte_8651:      fcb 0                   ; sub_BF80+17↓r
byte_8652:      fcb 2                   ; sub_BF80:loc_BFB9↓r
byte_8653:      fcb 2                   ; sub_BF80+4A↓r sub_BF80+58↓r
                fcb $F0
byte_8655:      fcb $9C                 ; sub_BF80:loc_BFF0↓r
                fcb $40
byte_8657:      fcb 1                   ; sub_BF80+77↓r
                fcb $90
byte_8659:      fcb $E0                 ; sub_BF80+84↓r
byte_865A:      fcb 8                   ; sub_BF80+8B↓r
byte_865B:      fcb $B2                 ; sub_BF80:loc_C01E↓r
                fcb $20
byte_865D:      fcb 1                   ; sub_BF80+A5↓r
                fcb $90
byte_865F:      fcb $80                 ; sub_BD17+120↓r
byte_8660:      fcb 1                   ; ROM:EFF1↓r
byte_8661:      fcb 0                   ; sub_BD17+127↓r
                fcb $B6
byte_8663:      fcb $F                  ; sub_BD17+113↓r
byte_8664:      fcb $1C                 ; sub_BD17:loc_BE8E↓r
byte_8665:      fcb $1C                 ; sub_BD17:loc_BE7F↓r
byte_8666:      fcb 2                   ; sub_BD17+135↓o
                fcb 5, 0, 1, $6E
                fcb $C, $A
                fcb $FF, $FF, $FF, $FF
byte_8671:      fcb 2                   ; sub_BD17+12C↓o
                fcb 5, 0, $FF, $9A
                fcb $F, $FC
                fcb $FF, $FF, $FF, $FF
byte_867C:      fcb $71                 ; sub_E832+FE↓r
byte_867D:      fcb 3                   ; sub_A2B6+137↓o
                fcb $D0, $D0, 0, 0
                fcb $D0, $D0, 0, 0
                fcb $D0, $D0
byte_8688:      fcb 5                   ; sub_A2B6+BD↓o
                fcb $58, $E0, $FE, $66
                fcb $80, $A0, $FD, $CD
                fcb $A8, $48, $FF, $9A
                fcb $D0, $38, 0, $CD
                fcb $F8, $58
byte_869B:      fcb 3                   ; sub_A2B6+C6↓o
                fcb $9A, $28, $FF, $7A
                fcb $C8, $10, $FF, $9A
                fcb $F0, 0
byte_86A6:      fcb $14                 ; sub_A2B6+206↓r
byte_86A7:      fcb $A0                 ; sub_A2B6+210↓r
byte_86A8:      fcb $20                 ; sub_A531+43↓r
byte_86A9:      fcb $D0                 ; sub_A2B6+221↓r
byte_86AA:      fcb $E8                 ; sub_A531+6F↓r
byte_86AB:      fcb 4                   ; sub_A2B6+215↓o
                                        ; sub_A531:loc_A598↓o
                fcb $14, $14, $FF, $C0
                fcb $3C, $A, $FF, $F3
                fcb $64, 8, $FF, $EF
                fcb $82, 6
byte_86BA:      fcb 0                   ; sub_A2B6+230↓r
byte_86BB:      fcb 4                   ; sub_A2B6+1B1↓o
                fcb $68, $50, $FF, $55
                fcb $80, $40, $FF, $33
                fcb $A8, $20, $FF, $33
                fcb $D0, 0
byte_86CA:      fcb 3                   ; sub_A2B6+1BC↓o
                fcb 0, 0, 0, 0
                fcb $10, 0, 0, 0
                fcb $21, 0
byte_86D5:      fcb 4                   ; sub_A2B6+1F4↓o
                fcb 0, 0, 0, 0
                fcb 2, 0, 0, 0
                fcb 5, 0, 0, 0
                fcb $1E, 0
byte_86E4:      fcb 4                   ; sub_A2B6+1E2↓o
                fcb $1C, 5, 0, $72
                fcb $2E, $D, 0, 0
                fcb $3F, $D, 0, 0
                fcb $FF, $D
byte_86F3:      fcb 3                   ; sub_A2B6+1CF↓o
                fcb $9A, $50, $FF, $DF
                fcb $C8, $4A, $FF, $C0
                fcb $F0, $40
byte_86FE:      fcb 5                   ; sub_A2B6+6B↓o
                fcb $58, $96, $FF, $86
                fcb $A8, $70, $FF, $86
                fcb $D0, $5D, 0, 0
                fcb $E5, $5D, 4, $1C
                fcb $EE, $82
byte_8711:      fcb 5                   ; sub_A2B6:loc_A2D5↓o
                fcb $58, $96, $FF, $86
                fcb $A8, $70, $FF, $86
                fcb $D0, $5D, 0, 0
                fcb $E5, $5D, 4, $1C
                fcb $EE, $82
byte_8724:      fcb 3                   ; sub_A2B6+7A↓o
                fcb 0, 0, 0, 0
                fcb 0, 0, 0, 0
                fcb 0, 0
byte_872F:      fcb $6A                 ; sub_A2B6+90↓r
byte_8730:      fcb $64                 ; sub_A2B6:loc_A316↓r
byte_8731:      fcb 5                   ; sub_A2B6+17E↓o
                fcb $32, 1, 0, 0
                fcb $4B, 2, 0, 0
                fcb $5A, 3, 0, 0
                fcb $78, 5, 0, 0
                fcb $96, 8
byte_8744:      fcb 5                   ; sub_A2B6+187↓o
                fcb $40, $FF, 0, 0
                fcb $A0, $FE, 0, 0
                fcb $C8, $FB, 0, 0
                fcb $E6, $FA, 0, 0
                fcb $FF, $F8
byte_8757:      fcb $11                 ; sub_A531+4C↓r
byte_8758:      fcb $11                 ; sub_A531+2B↓r
byte_8759:      fcb $EE                 ; sub_A531+5F↓r
byte_875A:      fcb $1A                 ; sub_A2B6+F6↓o
                fcb $1A
                fcb $1A
                fcb $1A
                fcb $1A
                fcb $1A
                fcb $16
                fcb 8
                fcb 8
byte_8763:      fcb $1F                 ; sub_A2B6+116↓r
byte_8764:      fcb $1A                 ; sub_A2B6+FF↓o
                fcb $1A
                fcb $1A
                fcb $1A
                fcb $1A
                fcb $1A
                fcb $16
                fcb 8
                fcb 8
byte_876D:      fcb $38                 ; sub_A2B6:loc_A42D↓r
                                        ; sub_A5B7+ED↓r
byte_876E:      fcb $DB                 ; sub_A2B6:loc_A4F4↓r
                                        ; sub_A2B6:loc_A4F9↓r ...
byte_876F:      fcb $40                 ; sub_BA0E:loc_BB4F↓o
                fcb $50
byte_8771:      fcb $7F                 ; sub_A2B6+250↓r
byte_8772:      fcb $10                 ; sub_A2B6+239↓r sub_A5B7+FA↓r
byte_8773:      fcb 3                   ; sub_A2B6+15F↓o
                fcb $58, $F0, 0, 0
                fcb $A8, $F0, 0, 0
                fcb $F8, $F0
byte_877E:      fcb 3                   ; sub_A2B6+166↓o
                fcb $58, $10, 0, 0
                fcb $A8, $10, 0, 0
                fcb $F8, $10
byte_8789:      fcb 4                   ; sub_A5B7+21↓o
                fcb $9A, $98, $FF, $CA
                fcb $AD, $94, 0, 0
                fcb $C8, $94, $FF, $80
                fcb $F0, $80
                fcb $FF, $FF, $FF, $FF
byte_879C:      fcb 2                   ; sub_A5B7+3E↓o
                fcb $B, 0, 0, 0
                fcb $1B, 0
                fcb $FF, $FF, $FF, $FF
byte_87A7:      fcb 4                   ; sub_A5B7+4B↓o
                fcb $58, $30, $FF, $B3
                fcb $80, $24, $FF, $80
                fcb $A8, $10, $FF, $9A
                fcb $D0, 0
                fcb $FF, $FF, $FF, $FF
byte_87BA:      fcb 4                   ; sub_A5B7+73↓o
                fcb $1F, 0, 0, 0
                fcb $46, 0, 0, 0
                fcb $6D, 0, 0, 0
                fcb $BC, 0
byte_87C9:      fcb 3                   ; sub_A5B7+8E↓o
                fcb 0, 0, 0, 0
                fcb $8F, 0, 0, 0
                fcb $FF, 0
byte_87D4:      fcb 2                   ; sub_A5B7+7C↓o
                fcb $90, $FF, 0, 0
                fcb $C7, $FF
                fcb $FF, $FF, $FF, $FF
byte_87DF:      fcb 4                   ; sub_A5B7+114↓o
                fcb 8, 0, 0, $80
                fcb $C, 2, 0, $40
                fcb $10, 3, 0, $40
                fcb $18, 5
byte_87EE:      fcb 4                   ; sub_A5B7+11C↓o
                fcb 8, 0, $FF, $C0
                fcb $C, $FF, $FF, $C0
                fcb $10, $FE, $FF, $E0
                fcb $18, $FD
byte_87FD:      fcb $3F                 ; sub_A5B7+10F↓r
byte_87FE:      fcb $D4                 ; sub_A5B7+C3↓r
byte_87FF:      fcb 2                   ; sub_A5B7:loc_A686↓r
byte_8800:      fcb $12                 ; sub_A5B7+5B↓r
byte_8801:      fcb $1F                 ; sub_A5B7+1B↓r
byte_8802:      fcb $B                  ; sub_A5B7+B4↓r
byte_8803:      fcb $7F                 ; sub_A5B7+AD↓r
word_8804:      fdb $FAD                ; sub_9ADD+62↓r
byte_8806:      fcb $70                 ; sub_9ADD+67↓r
byte_8807:      fcb $8C                 ; sub_9ADD↓r
byte_8808:      fcb $70                 ; sub_9ADD+16↓r
byte_8809:      fcb $FF                 ; sub_9ADD+51↓r
word_880A:      fdb $7D00               ; sub_9ADD+58↓r
word_880C:      fdb $7D00               ; sub_9ADD+5D↓r
byte_880E:      fcb 4                   ; sub_9ADD+32↓r sub_A531+36↓r
byte_880F:      fcb $B6                 ; sub_9B69+11↓r
byte_8810:      fcb 7                   ; sub_D9B9+1E↓r
byte_8811:      fcb $10                 ; sub_9CF3+153↓r
byte_8812:      fcb $FE                 ; sub_9CF3:loc_9E4C↓r
byte_8813:      fcb $FE                 ; sub_9CF3+148↓r
byte_8814:      fcb $10                 ; sub_9CF3+160↓r
byte_8815:      fcb $A                  ; sub_9CF3+17A↓r
                                        ; sub_9CF3+187↓r
byte_8816:      fcb 4                   ; sub_9CF3+16C↓r
byte_8817:      fcb $70                 ; sub_9CF3+134↓r
byte_8818:      fcb 3                   ; sub_9CF3+13B↓r
byte_8819:      fcb $58                 ; sub_A227+E↓r
byte_881A:      fcb $FF                 ; sub_A227+9↓r
byte_881B:      fcb $5A                 ; sub_A25F+2B↓r
byte_881C:      fcb $46                 ; sub_A25F+30↓r
word_881D:      fdb $E8E3               ; sub_A25F:loc_A285↓o
                fdb $E8E3
word_8821:      fdb 0                   ; sub_9C70+19↓r
word_8823:      fdb 0                   ; sub_9C70+2F↓r
byte_8825:      fcb 0                   ; sub_9C70+15↓r
byte_8826:      fcb 0                   ; sub_9C70+43↓r sub_9C70+4F↓r ...
byte_8827:      fcb $92                 ; sub_9F91+2D↓r
byte_8828:      fcb 0                   ; sub_9F91:loc_A012↓r
byte_8829:      fcb $20                 ; sub_9F91+45↓r
byte_882A:      fcb $32                 ; sub_9F91:loc_9FAB↓r
byte_882B:      fcb 0                   ; sub_9F91+21↓r
byte_882C:      fcb 6                   ; sub_9F91:loc_A01F↓r
byte_882D:      fcb $40                 ; sub_9F91+32↓r
byte_882E:      fcb 6                   ; sub_9F91+6E↓o
                fcb $1C, $24, 0, $E7
                fcb $3B, $40, 5, $C0
                fcb $3F, $57, 6, $AB
                fcb $42, $6B, 0, 0
                fcb $54, $6B, 0, 0
                fcb $54, $A8
byte_8845:      fcb 4                   ; sub_9F91:loc_9FEF↓o
                fcb $1F, $F, 0, $F7
                fcb $74, $61, 0, 0
                fcb $8A, $61, 0, 0
                fcb $8A, $A8
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
byte_885C:      fcb 4                   ; sub_9F91:loc_9FEA↓o
                fcb $1F, $F, 0, $F7
                fcb $74, $61, 0, 0
                fcb $8A, $61, 0, 0
                fcb $8A, $A8
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
byte_8873:      fcb $B8                 ; sub_9F91+E1↓r
byte_8874:      fcb 7                   ; sub_9F91+CF↓r
byte_8875:      fcb $7C                 ; sub_9F91+F4↓r sub_9F91+180↓r
byte_8876:      fcb $14                 ; sub_9F91+100↓r
byte_8877:      fcb $66                 ; sub_9F91+120↓r
word_8878:      fdb $8118               ; sub_9F91+112↓o
byte_887A:      fcb $20                 ; sub_9F91+17D↓r
byte_887B:      fcb $11                 ; sub_9F91+185↓r
byte_887C:      fcb 0                   ; sub_9F91+C0↓r sub_9F91+172↓r
byte_887D:      fcb 4                   ; sub_9F91+151↓o
                fcb $64, $F, 0, 0
                fcb $64, $2E, 0, $AB
                fcb $82, $42, 0, 0
                fcb $82, $A8
                fcb 2
                fcb $64, $F, 0, 0
                fcb $96, $F, $FF, $FF
                fcb $FF, $FF
                fcb $FF, $FF, $FF, $FF
byte_889B:      fcb 4                   ; sub_9F91:loc_A0DB↓o
                fcb $5E, 5, 0, 0
                fcb $5E, $33, 0, $AB
                fcb $7C, $47, 0, 0
                fcb $7C, $A8
                fcb 5
                fcb $5E
                fcb 5
                fcb 0
                fcb 0
                fcb $96
                fcb 5
                fcb 2
                fcb $62
                fcb $FF
                fcb $FF
                fcb 0
                fcb 0
                fcb $FF
                fcb $FF
byte_88B9:      fcb $50                 ; sub_A130+19↓r
byte_88BA:      fcb $2D                 ; __RESET+EE↓r sub_A130+24↓r
byte_88BB:      fcb $24                 ; sub_A130+29↓r
byte_88BC:      fcb 2                   ; sub_A130+39↓r
byte_88BD:      fcb 8                   ; sub_A130:loc_A184↓r
byte_88BE:      fcb 5                   ; sub_A130+65↓r
byte_88BF:      fcb $10                 ; sub_A130+71↓r
byte_88C0:      fcb $F                  ; sub_A130+80↓r
byte_88C1:      fcb $50                 ; sub_A130+9D↓r
byte_88C2:      fcb 8                   ; sub_A130+A8↓r
byte_88C3:      fcb $FF, $FF, $FF, $41, $41, $3F, $3C, $40, $40
                                        ; sub_A130+AD↓o
byte_88CC:      fcb 8                   ; sub_A130+BE↓r
byte_88CD:      fcb $D                  ; sub_A130+D1↓r
byte_88CE:      fcb $80                 ; sub_A130+DD↓r
byte_88CF:      fcb $FE                 ; sub_A706+4BE↓r
byte_88D0:      fcb $F0                 ; sub_A706+4C7↓r
byte_88D1:      fcb 0                   ; sub_A706:loc_A839↓r
byte_88D2:      fcb $40                 ; sub_A706+26F↓r
byte_88D3:      fcb $30                 ; sub_A706:loc_ABED↓r
byte_88D4:      fcb 0                   ; sub_A706+5A4↓r
byte_88D5:      fcb $94                 ; sub_A706:loc_ACC4↓r
byte_88D6:      fcb $AA                 ; sub_A706+235↓r
                                        ; sub_A706+24D↓r ...
byte_88D7:      fcb $46                 ; sub_A706:loc_A960↓r
byte_88D8:      fcb $4F                 ; sub_A706+4C↓r
byte_88D9:      fcb 0                   ; sub_A706+51↓r
byte_88DA:      fcb $3C                 ; sub_A706+1A↓r
byte_88DB:      fcb $7D                 ; sub_A706+24↓r
byte_88DC:      fcb 8                   ; sub_A706+23A↓r
                fcb 4
                fcb $2D
byte_88DF:      fcb $20                 ; sub_A706:loc_AC42↓r
byte_88E0:      fcb $20                 ; sub_A706+553↓r
byte_88E1:      fcb 2                   ; sub_A706+316↓r
byte_88E2:      fcb 1                   ; sub_A706+5C3↓r
byte_88E3:      fcb 1                   ; sub_A706+594↓r
byte_88E4:      fcb 5                   ; sub_A706+5CA↓r
byte_88E5:      fcb 5                   ; sub_A706+59B↓r
byte_88E6:      fcb $80                 ; sub_A706+176↓r
byte_88E7:      fcb 6                   ; sub_A706+14B↓r
byte_88E8:      fcb 4                   ; sub_A706+29D↓r
byte_88E9:      fcb $18                 ; sub_A706+27D↓r
byte_88EA:      fcb 6                   ; sub_A706+2A8↓r
byte_88EB:      fcb $5A                 ; sub_AA29+27↓r sub_A706+3E1↓r
byte_88EC:      fcb 4                   ; sub_A706+430↓r
byte_88ED:      fcb $20                 ; sub_A706:loc_AADD↓r
byte_88EE:      fcb $10                 ; sub_A706+3F4↓r
byte_88EF:      fcb $FC                 ; sub_A706+3F9↓r
byte_88F0:      fcb 4                   ; sub_A706:loc_AB11↓r
byte_88F1:      fcb 8                   ; sub_A706+3FE↓r
byte_88F2:      fcb $42                 ; sub_A706+40E↓r
                                        ; sub_A706+413↓r
byte_88F3:      fcb $CE                 ; sub_A706+401↓r
                                        ; sub_A706+406↓r
byte_88F4:      fcb $B                  ; sub_A706:loc_AAD2↓r
byte_88F5:      fcb 8                   ; sub_A706+3BC↓r
byte_88F6:      fcb 4                   ; sub_A706+496↓o
                fcb 0, 0, $FF, $FB
                fcb $30, $FF, $FF, $F6
                fcb $80, $FC, $FF, $EC
                fcb $FF, $F2
byte_8905:      fcb 5                   ; sub_A706+480↓o
                fcb 0, 0, 0, $30
                fcb $10, 3, 0, $1B
                fcb $40, 8, 0, $20
                fcb $80, $10, 0, $C
                fcb $FF, $16
                fcb $FF, $FF, $FF, $FF
byte_891C:      fcb 4                   ; sub_A706+4DD↓o
                fcb 0, 0, 1, 0
                fcb $10, $10, 0, $C0
                fcb $30, $28, 0, $20
                fcb $70, $30
byte_892B:      fcb 4                   ; sub_AA29+2↓o
                fcb 0, 0, 0, $B3
                fcb $3C, $2A, 0, $1A
                fcb $5A, $2D, 0, $26
                fcb $6E, $30
byte_893A:      fcb 5                   ; sub_AA29+11↓o
                fcb 0, $C0, $FF, $55
                fcb $30, $A0, $FF, $9A
                fcb $80, $80, $FF, $55
                fcb $B0, $60, $FF, 0
                fcb $D0, $40
                fcb $FF, $FF, $FF, $FF
byte_8951:      fcb 4                   ; sub_A706+212↓o
                fcb $80, $80, 1, 0
                fcb $84, $84, 0, $20
                fcb $94, $86, 0, $14
                fcb $C6, $8A
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
byte_8970:      fcb 4                   ; sub_A706+506↓o
                fcb $46, 4, $FF, $F3
                fcb $5A, 3, $FF, $F3
                fcb $6E, 2, $FF, $E6
                fcb $82, 0
byte_897F:      fcb 4                   ; sub_A706+4FB↓o
                fcb 0, 6, 0, $E0
                fcb $10, $14, 0, $90
                fcb $20, $1D, 0, $30
                fcb $30, $20
byte_898E:      fcb 3                   ; sub_A706:loc_A9EB↓o
                fcb 2, $18, $10, 0
                fcb 4, $38, 8, 0
                fcb 6, $48
byte_8999:      fcb 2                   ; sub_A706+4B1↓o
                fcb $20, $E8, $FE, $80
                fcb $30, $D0
                fcb $FF, $FF, $FF, $FF
                fcb $FF, $FF, $FF, $FF
byte_89A8:      fcb 2                   ; sub_A706+5D6↓o
                fcb $A0, 3, 0, $18
                fcb $C0, 6
                fcb $FF, $FF, $FF, $FF
byte_89B3:      fcb 2                   ; sub_A706+5DC↓o
                fcb $A8, $80, $FE, $ED
                fcb $D0, $55
                fcb $FF, $FF, $FF, $FF
byte_89BE:      fcb 2                   ; sub_A706+5A9↓o
                fcb $A0, 3, 0, $18
                fcb $C0, 6
                fcb $FF, $FF, $FF, $FF
byte_89C9:      fcb 2                   ; sub_A706+5AF↓o
                fcb $A8, $80, $FE, $ED
                fcb $D0, $55
                fcb $FF, $FF, $FF, $FF
TL_ErrorBitsMask1:fcb 0                 ; ThrowNonCriticalError↓o
                fcb 0
                fcb 0
                fcb 0
                fcb 0
                fcb 0
byte_89DA:      fcb 4                   ; sub_D303+149↓r
byte_89DB:      fcb $11                 ; sub_D260+3A↓r
byte_89DC:      fcb $EB                 ; sub_D4F9+30↓r
byte_89DD:      fcb $93                 ; sub_9CF3↓r sub_D4F9+37↓r
byte_89DE:      fcb $3E                 ; sub_D4F9+3E↓r
byte_89DF:      fcb $63                 ; __RESET+3BA↓r
byte_89E0:      fcb $E4                 ; __RESET+3BF↓r
byte_89E1:      fcb $CF                 ; sub_D977+6↓r
byte_89E2:      fcb $32                 ; sub_D977+20↓r
byte_89E3:      fcb $AA                 ; sub_D977+28↓r
byte_89E4:      fcb 4                   ; sub_D64A+16↓r
byte_89E5:      fcb $BD                 ; sub_D64A+B↓r
byte_89E6:      fcb $79                 ; sub_D64A+6↓r
byte_89E7:      fcb $1A                 ; __RESET+359↓r sub_B800+3F↓r
byte_89E8:      fcb $FD                 ; __RESET+354↓r sub_B800+3A↓r
byte_89E9:      fcb $B1                 ; __RESET:loc_97D2↓r
                                        ; sub_B800+77↓r
byte_89EA:      fcb $1A                 ; __RESET+389↓r sub_B88A+42↓r
byte_89EB:      fcb $FD                 ; __RESET+384↓r
                                        ; sub_B88A:loc_B8C7↓r
byte_89EC:      fcb $A8                 ; __RESET:loc_9802↓r
                                        ; sub_B88A+7A↓r
byte_89ED:      fcb $10                 ; sub_DA71+18↓r
byte_89EE:      fcb $2E                 ; sub_DA71+1F↓r
                fcb $E0
byte_89F0:      fcb $8E                 ; sub_DA71+3B↓r
byte_89F1:      fcb $7F                 ; sub_DA71+4B↓r
byte_89F2:      fcb 4                   ; sub_E832+8A↓r
byte_89F3:      fcb 6                   ; sub_DA71:loc_DAC8↓r
byte_89F4:      fcb $2E                 ; sub_C4E4+2B↓r
byte_89F5:      fcb $22                 ; sub_C3D3+5A↓r sub_CCF6+2AA↓r ...
byte_89F6:      fcb $14                 ; sub_C3D3+5F↓r sub_CCF6+2AF↓r ...
byte_89F7:      fcb $A                  ; sub_C3D3+20↓r
byte_89F8:      fcb $38                 ; sub_D6A1+27↓r
byte_89F9:      fcb $70                 ; sub_D6A1+2E↓r
byte_89FA:      fcb $B0                 ; sub_D6A1+C↓r
byte_89FB:      fcb 8                   ; sub_BA0E+6F↓r sub_C5F1+A↓r ...
byte_89FC:      fcb $F0                 ; sub_BA0E+74↓r sub_C5F1+F↓r ...
byte_89FD:      fcb $D1                 ; sub_BA0E+B5↓r
byte_89FE:      fcb $20                 ; sub_BA0E+62↓r
byte_89FF:      fcb $28                 ; sub_BA0E+4D↓r
byte_8A00:      fcb $2F                 ; sub_BA0E+23↓r sub_BA0E+54↓r
byte_8A01:      fcb $28                 ; sub_BA0E+5B↓r
byte_8A02:      fcb $DC                 ; sub_BA0E+C↓r sub_BA0E+3D↓r
byte_8A03:      fcb $8C                 ; sub_BA0E:loc_BA42↓r
byte_8A04:      fcb $64                 ; sub_BA0E+2F↓r
byte_8A05:      fcb $CE                 ; sub_BA0E+2A↓r
byte_8A06:      fcb $AB                 ; RESERVED:loc_CFC8↓r
byte_8A07:      fcb 2                   ; sub_C5F1+2C↓r sub_D8A7+7C↓r ...
byte_8A08:      fcb $FD                 ; sub_C5F1+27↓r sub_D8A7+54↓r ...
byte_8A09:      fcb $66                 ; __RESET+255↓r __RESET+269↓r ...
byte_8A0A:      fcb 1                   ; sub_D818+25↓r sub_D818+56↓r
byte_8A0B:      fcb 2                   ; sub_D818+5B↓r
byte_8A0C:      fcb 5                   ; sub_D818+5↓r
                                        ; sub_D818:loc_D88E↓r
byte_8A0D:      fcb $F0, $80, $50, $40, $30, $30, $20, $20, $20, $10, $10
                                        ; sub_D818+79↓o
                fcb $10, $10, 0, 0, 0
byte_8A1D:      fcb $12                 ; sub_D818+2C↓r
                fcb $C0
byte_8A1F:      fcb $2E                 ; sub_D818+32↓r
                fcb $E0
byte_8A21:      fcb $12                 ; sub_D818+3A↓r
byte_8A22:      fcb $F7                 ; sub_D818+3F↓r
byte_8A23:      fcb 2                   ; sub_D818:loc_D888↓r
                                        ; sub_D8A7:loc_D8C2↓r
                fcb 0
byte_8A25:      fcb $CE                 ; sub_D8A7+2C↓r
byte_8A26:      fcb $21                 ; sub_D8A7+29↓o
                fcb $10
byte_8A28:      fcb 5                   ; sub_D61E:loc_D63C↓o
                fcb 0, 0, 7, $92
                fcb 7, $35, 4, $64
                fcb $19, $84, 1, $66
                fcb $28, $99, 0, $95
                fcb $34, $A0
byte_8A3B:      fcb $2E                 ; sub_D61E+24↓r
byte_8A3C:      fcb $B                  ; sub_D61E+17↓r
byte_8A3D:      fcb $20                 ; sub_A2B6+DA↓r
byte_8A3E:      fcb 3                   ; sub_9CF3+118↓r
byte_8A3F:      fcb $D2                 ; sub_9CF3+10↓r
byte_8A40:      fcb 5                   ; sub_9CF3+1C↓r
byte_8A41:      fcb $20                 ; sub_9CF3+32↓r
byte_8A42:      fcb $40                 ; sub_9CF3+55↓r
byte_8A43:      fcb $10                 ; sub_9CF3+50↓r
byte_8A44:      fcb $D0                 ; sub_9CF3+49↓r
byte_8A45:      fcb $70                 ; sub_9CF3+44↓r
byte_8A46:      fcb $60                 ; sub_9CF3+61↓r
byte_8A47:      fcb $30                 ; sub_9CF3+5C↓r
byte_8A48:      fcb $C0                 ; sub_9CF3+68↓r
word_8A49:      fdb $1B0                ; sub_9CF3+3D↓r
byte_8A4B:      fcb $44                 ; sub_9CF3+CB↓r
byte_8A4C:      fcb $51                 ; sub_9CF3+D0↓r
byte_8A4D:      fcb $22                 ; sub_9CF3+BF↓r
byte_8A4E:      fcb $2E                 ; sub_9CF3+C4↓r
byte_8A4F:      fcb $71                 ; sub_9CF3+B3↓r
byte_8A50:      fcb $B0                 ; sub_9CF3+B8↓r
byte_8A51:      fcb $80                 ; sub_9CF3+73↓r
byte_8A52:      fcb $20                 ; sub_9CF3+E1↓r
word_8A53:      fdb $16C                ; sub_9CF3:loc_9D9C↓r
byte_8A55:      fcb 3                   ; sub_9CF3+FF↓r
byte_8A56:      fcb 8                   ; sub_E832:loc_E9D6↓r
byte_8A57:      fcb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

