;
; **** ZP ABSOLUTE ADRESSES **** 
;
a02 = $02
a03 = $03
a04 = $04
a05 = $05
a06 = $06
a07 = $07
a08 = $08
a10 = $10
a11 = $11
a13 = $13
a14 = $14
a15 = $15
a16 = $16
a17 = $17
a18 = $18
a19 = $19
a1B = $1B
a1D = $1D
a1F = $1F
a20 = $20
a21 = $21
a22 = $22
a23 = $23
a24 = $24
a25 = $25
a26 = $26
a27 = $27
a28 = $28
a29 = $29
a2B = $2B
a2C = $2C
a2D = $2D
a2E = $2E
a2F = $2F
a30 = $30
a31 = $31
a32 = $32
a33 = $33
a34 = $34
a35 = $35
a36 = $36
a37 = $37
a38 = $38
a39 = $39
a3A = $3A
a3B = $3B
a3C = $3C
a3D = $3D
a3E = $3E
a3F = $3F
a40 = $40
a41 = $41
a42 = $42
a43 = $43
a44 = $44
a45 = $45
a46 = $46
a47 = $47
a48 = $48
a49 = $49
a4A = $4A
a4B = $4B
a4C = $4C
a4D = $4D
a4E = $4E
a4F = $4F
a50 = $50
a51 = $51
a52 = $52
a53 = $53
a55 = $55
a56 = $56
a57 = $57
a58 = $58
a59 = $59
a5A = $5A
a5B = $5B
a5C = $5C
a5D = $5D
a5E = $5E
a5F = $5F
a60 = $60
a61 = $61
a62 = $62
a63 = $63
a64 = $64
a65 = $65
a66 = $66
aC5 = $C5
aF1 = $F1
aF2 = $F2
aF3 = $F3
aF4 = $F4
aFC = $FC
;
; **** ZP POINTERS **** 
;
p02 = $02
p03 = $03
p04 = $04
p05 = $05
p13 = $13
p15 = $15
p17 = $17
p25 = $25
p48 = $48
p70 = $70
pE9 = $E9
pF2 = $F2
;
; **** FIELDS **** 
;
f0340 = $0340
f0360 = $0360
f0450 = $0450
f0478 = $0478
f04A0 = $04A0
f04C8 = $04C8
f0500 = $0500
f05E5 = $05E5
f05EF = $05EF
f0600 = $0600
f06F8 = $06F8
f0700 = $0700
f0720 = $0720
f0748 = $0748
f0770 = $0770
f07DF = $07DF
fD80A = $D80A
fD820 = $D820
fD850 = $D850
fD878 = $D878
fD8A0 = $D8A0
fD8C8 = $D8C8
fDAF8 = $DAF8
fDB20 = $DB20
fDB48 = $DB48
fDB70 = $DB70
fDBDF = $DBDF
;
; **** ABSOLUTE ADRESSES **** 
;
a0291 = $0291
a0314 = $0314
a0315 = $0315
a0318 = $0318
a0319 = $0319
a0430 = $0430
a0431 = $0431
a044C = $044C
a0551 = $0551
a0552 = $0552
a05B2 = $05B2
a05B3 = $05B3
a05DE = $05DE
a062E = $062E
a067E = $067E
a07A0 = $07A0
a07A1 = $07A1
a07BC = $07BC
a07C9 = $07C9
a07D3 = $07D3
a07F8 = $07F8
a07F9 = $07F9
a07FA = $07FA
a07FB = $07FB
aD829 = $D829
aD84E = $D84E
aDB99 = $DB99
aDBBE = $DBBE
;
; **** POINTERS **** 
;
p20 = $0020
p0300 = $0300
p0400 = $0400
p0401 = $0401
p0523 = $0523
p0622 = $0622
p0800 = $0800
pB181 = $B181
pBFFF = $BFFF
pD1F6 = $D1F6
pD833 = $D833
pDBA3 = $DBA3
;
; **** EXTERNAL JUMPS **** 
;
e07EB = $07EB
eEA31 = $EA31
;
; **** PREDEFINED LABELS **** 
;
ROM_SCNKEY = $FF9F

        * = $0801

;------------------------------------------------
; SYS 64738
; Somehow execution passes to j8000 where the game starts.
;------------------------------------------------
        .BYTE $0C,$08,$0A,$00,$9E,$36,$34,$37,$33,$38
p080B   .BYTE $00,$00,$00,$F7,$DF,$FD,$CB,$FF
        .BYTE $DF,$FF,$EB,$FF,$C3,$FF,$FF,$FF
        .BYTE $FF
        LDA f4BFF,X
        BRK #$82
        .BYTE $02    ;JAM 
        BRK #$C2
        DEY 
        BRK #$80
        BVC e07EB
        BRK #$00
        BRK #$00
        BRK #$00
        BRK #$00
        BRK #$00
        BRK #$02
        BRK #$00
        BRK #$00
        BRK #$00

.include "padding.asm"
.include "charset.asm"
.include "sprites.asm"
.include "padding3.asm"
.include "charset2.asm"
.include "padding2.asm"

j7000   LDX a62
        INC a62
        LDA a62
        CMP #$30
        BNE b700E
        LDA #$19
        STA a62
b700E   INC a07D3
        LDA a07D3
        CMP #$3A
        BNE b701B
        DEC a07D3
b701B   INX 
b701C   INC a0552
        LDA a0552
        CMP #$3A
        BNE b702E
        LDA #$30
        STA a0552
        INC a0551
b702E   DEX 
        BNE b701C
j7031   LDA #$01
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA #$08
        STA $D407    ;Voice 2: Frequency Control - Low-Byte
        LDA #$0C
        STA $D40E    ;Voice 3: Frequency Control - Low-Byte
        LDA #<pB181
        STA a02
        LDA #>pB181
        STA a03
        LDX #$E1
b704A   DEC a02
        LDA a02
        CMP #$02
p7050   BNE b7057
        INC a02
        JMP j7065

b7057   CMP #$80
        BNE b7060
        LDA #$21
        STA $D404    ;Voice 1: Control Register
b7060   LDA a02
        STA $D401    ;Voice 1: Frequency Control - High-Byte
j7065   DEC a03
        LDA a03
        CMP #$02
        BNE b7072
        INC a03
        JMP j7080

b7072   CMP #$80
        BNE b707B
        LDA #$21
        STA $D40B    ;Voice 2: Control Register
b707B   LDA a03
        STA $D408    ;Voice 2: Frequency Control - High-Byte
j7080   DEX 
        TXA 
        CMP #$02
        BNE b708A
        INX 
        JMP j7097

b708A   CMP #$80
        BNE b7093
        LDA #$21
        STA $D412    ;Voice 3: Control Register
b7093   TXA 
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
j7097   LDA #$05
        STA a04
b709B   LDY #$C0
b709D   DEY 
        BNE b709D
        DEC a04
        BNE b709B
        LDA #$FF
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        CPX #$03
        BNE b704A
        LDX #$FF
b70AF   LDA #$08
        STA a04
b70B3   DEY 
        BNE b70B3
        DEC a04
        BNE b70B3
        DEX 
        TXA 
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        CPX #$40
        BNE b70CE
        LDA #$20
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
b70CE   TXA 
        BNE b70AF
        LDA #$0A
        STA a59
        LDA a61
        BNE b70DC
        JMP j72B8

b70DC   LDA #$07
        STA a5B
        LDA #$04
        STA a58
        LDX #$00
b70E6   LDA f70F4,X
        JSR s9ED7
        INX 
        CPX #$23
        BNE b70E6
        JMP j7155

f70F4   .TEXT "CAMEL KARMA ANTIBONUS\\\", $84, "106 ", $87, "X ", $83, "00"
s7117   LDA #$04
        STA a03
        LDA a60
        STA a02
        LDY #$06
b7121   LDA (p02),Y
        SEC 
        SBC #$01
        STA (p02),Y
        CMP #$2F
        BNE b7140
        LDA #$39
        STA (p02),Y
        DEY 
        CPY #$FF
        BNE b7121
        LDY #$00
        LDA #$30
b7139   STA (p02),Y
        INY 
        CPY #$07
        BNE b7139
b7140   RTS 

s7141   LDX #$40
b7143   LDA #$01
        STA a02
b7147   DEY 
        BNE b7147
        DEC a02
        BNE b7147
        STX $D40F    ;Voice 3: Frequency Control - High-Byte
        DEX 
        BNE b7143
        RTS 

j7155   LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        LDA #$21
        STA $D412    ;Voice 3: Control Register
        LDA #$FF
        STA $D416    ;Filter Cutoff Frequency: High-Byte
b7167   JSR s7141
        LDA #$6A
        STA a04
b716E   JSR s7117
        DEC a04
        BNE b716E
        INC a05B3
        LDA a05B3
        CMP #$3A
        BNE b7187
        LDA #$30
        STA a05B3
        INC a05B2
b7187   DEC a61
        BNE b7167
        LDA #$FF
        STA a04
b718F   LDA a04
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        JSR s7141
        LDA a04
        SEC 
        SBC #$20
        STA a04
        CMP #$FF
        BNE b718F
        JMP j72B8

s71A5   JSR ROM_SCNKEY ;$FF9F - scan keyboard                    
        LDA aC5
        CMP #$04
        BEQ b71D2
        CMP #$03
        BEQ b71D2
        CMP #$3C
        BEQ b71D2
        CMP #$39
        BNE b71C0
        LDX #$F8
        TXS 
        JMP j8234

b71C0   CMP #$29
        BNE b71D1
        LDA #$00
        STA a24
        JSR s78D0
        JSR s78C8
        JSR s78D0
b71D1   RTS 

b71D2   LDA a57
        BNE b71D1
        LDA a56
        BNE b71D1
        LDX #$00
b71DC   LDA f5200,X
        CMP #$F0
        BNE b71EB
b71E3   INX 
        CPX #$0C
        BNE b71DC
        JMP j71F1

b71EB   LDA f5000,X
        BEQ b71E3
        RTS 

j71F1   LDA #$01
        STA $D015    ;Sprite display Enable
        JSR s96CC
        JSR InitCharset
        LDA aC5
        CMP #$3C
        BEQ b721B
        CMP #$04
        BNE b720F
        JSR s8747
        AND #$03
        TAX 
        JMP j7221

b720F   JSR s8747
        AND #$03
        CLC 
        ADC #$08
        TAX 
        JMP j7221

b721B   JSR s8747
        AND #$07
        TAX 
j7221   LDA f5000,X
        BNE b7230
        INX 
        CPX #$0C
        BNE j7221
        LDX #$00
        JMP j7221

b7230   LDA f5180,X
        LDX a23
        BNE b723D
        CLC 
        ADC #$06
        JMP j7240

b723D   SEC 
        SBC #$09
j7240   STA a29
        LDA #$04
        STA a24
        LDA #>p0C0F
        STA a59
        LDA #<p0C0F
        STA a58
        LDA #$06
        STA a5B
        LDX #$00
        STX $D404    ;Voice 1: Control Register
b7257   LDA f72AD,X
        JSR s9ED7
        INX 
        CPX #$0B
        BNE b7257
        LDX #$00
        LDA #$21
        STA $D404    ;Voice 1: Control Register
b7269   LDY #$C0
b726B   STY a02
        TXA 
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        ADC a02
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        DEY 
        BNE b726B
        INX 
        CPX #$E0
        BNE b7283
        LDA #$20
        STA $D404    ;Voice 1: Control Register
b7283   CPX #$00
        BNE b7269
        LDA #$20
        LDX #$00
b728B   STA f05EF,X
        INX 
        CPX #$0B
        BNE b728B
        LDA #$01
        STA a56
        LDX #$00
b7299   TXA 
        PHA 
        JSR s9709
        PLA 
        TAX 
        INX 
        BNE b7299
        LDA #$FF
        STA $D015    ;Sprite display Enable
        LDA #$00
        STA a56
        RTS 

f72AD   .TEXT "D", $84, "JUMPING.."
j72B8   LDA a044C
        CMP #$35
        BNE b72C9
        LDA a07BC
        CMP #$35
        BNE b72C9
        JMP j739B

b72C9   LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        JSR s7369
        LDA #$21
        STA $D404    ;Voice 1: Control Register
j72DF   LDA a044C
        CMP #$35
        BEQ b72EF
        JSR s7346
        INC a044C
        JMP j72DF

b72EF   LDA a07BC
        CMP #$35
        BEQ b72FF
        JSR s7346
        INC a07BC
        JMP b72EF

b72FF   LDA #$00
        STA a02
        LDA #$21
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
b730B   LDX a02
b730D   STX $D401    ;Voice 1: Frequency Control - High-Byte
        STX $D408    ;Voice 2: Frequency Control - High-Byte
        STX $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA a02
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        LDY #$60
b731D   DEY 
        BNE b731D
        INX 
        CPX #$60
        BNE b730D
        INC a02
        LDA a02
        CMP #$50
        BNE b730B
        LDA #$20
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        LDA #$30
        STA a044C
        STA a07BC
        LDX #$F8
        TXS 
        JMP j8278

s7346   LDX #$C0
        LDA #$F4
        STA $D417    ;Filter Resonance Control / Voice Input Control
b734D   STX $D401    ;Voice 1: Frequency Control - High-Byte
        LDY #$C0
b7352   DEY 
        BNE b7352
        DEX 
        BNE b734D
        LDX #$01
        TXA 
        PHA 
        LDY #$03
        LDA #$04
        STA a03
        LDA a60
        STA a02
        JMP j9E46

s7369   LDA #>p0C07
        STA a59
        LDA #<p0C07
        STA a58
        LDX #$00
b7373   LDA f737F,X
        JSR s9ED7
        INX 
        CPX #$1C
        BNE b7373
        RTS 

f737F   .TEXT $82, "PLANETBUSTER ", $81, "CHARGE ", $86, "BONUS"
j739B   LDA #$21
        STA $D404    ;Voice 1: Control Register
        LDA #$00
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        LDA #$F5
        STA $D417    ;Filter Resonance Control / Voice Input Control
        JMP b72FF

j73AD   LDA a63
        TAX 
        BEQ b73BA
        LDA #$00
b73B4   CLC 
        ADC #$08
        DEX 
        BNE b73B4
b73BA   TAX 
        LDY #$00
b73BD   LDA f73DC,X
        AND #$3F
        STA f07DF,Y
        INX 
        INY 
        CPY #$08
        BNE b73BD
j73CB   LDA a64
        TAX 
        LDA f8214,X
        LDX #$00
b73D3   STA fDBDF,X
        INX 
        CPX #$08
        BNE b73D3
        RTS 

f73DC   .TEXT "BLOATED REPLETE FULL    ADEQUATENOT BAD "
        .TEXT "PECKISH RUMBLINGFAMISHEDDIRE    DEAD    "
s742C   LDA a3B
        BNE b7431
        RTS 

b7431   DEC a64
        BEQ b7438
        JMP j73CB

b7438   LDA #$06
        STA a64
        DEC a63
        LDA a63
        CMP #$FF
        BEQ b744A
        JSR s7454
        JMP j73AD

b744A   LDA #$09
        STA a63
        JSR j73AD
        JMP j9CAD

s7454   INC a07C9
        LDA a07C9
        CMP #$37
        BNE b7461
        DEC a07C9
b7461   RTS 

j7462   DEC a65
        BNE b7461
        LDA a66
        STA a65
        INC a64
        LDA a64
        CMP #$07
        BEQ b7475
        JMP j73CB

b7475   LDA #$01
        STA a64
        INC a63
        JSR j73AD
        LDA a63
        CMP #$09
        BNE b7461
        JMP j9CAD

s7487   LDA #$55
        STA a03
        LDA #$36
        STA a07C9
        LDA #$00
        STA a02
        LDX a62
        BEQ b74A8
b7498   LDA a02
        CLC 
        ADC #$08
        STA a02
        LDA a03
        ADC #$00
        STA a03
        DEX 
        BNE b7498
b74A8   LDY #$00
        LDA (p02),Y
        STA a5C
        STA a5D
        INY 
        LDA (p02),Y
        STA a4C70
        STA a53
        INY 
        LDA (p02),Y
        STA a4C71
        INY 
        LDA (p02),Y
        STA a65
        STA a66
        INY 
        LDA (p02),Y
        BNE b74CD
        JMP j75C3

b74CD   STA a04
        INY 
        LDA (p02),Y
        STA a03
        LDA #>p0800
        STA a06
        LDA #<p0800
        STA a05
        LDY #$00
b74DE   LDA (p03),Y
        STA (p05),Y
        INC a03
        BNE b74E8
        INC a04
b74E8   INC a05
        BNE b74EE
        INC a06
b74EE   LDA a06
        CMP #$10
        BNE b74DE
        JMP j75C3

s74F7   LDX #$00
b74F9   LDA f4448,X
        AND #$80
        BEQ b750B
        INC f4448,X
        LDA f4448,X
        ORA #$80
        STA f4448,X
b750B   LDA f4454,X
        AND #$80
        BEQ b751D
        INC f4454,X
        LDA f4454,X
        ORA #$80
        STA f4454,X
b751D   LDA f4474,X
        AND #$80
        BEQ b752F
        INC f4474,X
        LDA f4474,X
        ORA #$80
        STA f4474,X
b752F   INX 
        CPX #$04
        BNE b74F9
b7534   RTS 

j7535   CMP #$08
        BNE b7534
        LDA #$01
        STA f50B0,X
        LDA f51A0,X
        CMP a30
        BPL b754A
        LDA #$03
        STA f50B0,X
b754A   JSR s9035
        LDY f5070,X
b7550   TYA 
        PHA 
        LDA #$01
        STA f50A0,X
        LDA f5180,X
        CMP a50
        BPL b7563
        LDA #$03
        STA f50A0,X
b7563   JSR s8FEE
        PLA 
        TAY 
        DEY 
        BNE b7550
b756B   RTS 

j756C   LDA a62
        AND #$02
        BEQ b756B
        LDX #$00
b7574   LDA f4200,X
        CMP #$02
        BNE b7580
        LDA #$00
        STA f4200,X
b7580   LDA f4300,X
        CMP #$02
        BNE b758C
        LDA #$00
        STA f4300,X
b758C   INX 
        BNE b7574
        RTS 

s7590   LDA a62
        PHA 
        LDA a5C
        CLC 
        ADC #$10
        PHA 
        LDA #$31
        STA a62
        JSR s7487
        PLA 
        STA a5C
        STA a5D
        PLA 
        STA a62
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        LDX #$00
        TXA 
b75B3   STA f5000,X
        INX 
        CPX #$0C
        BNE b75B3
        LDA #$F5
        STA $D417    ;Filter Resonance Control / Voice Input Control
        JMP j8EA1

j75C3   LDA a62
        CMP #$31
        BEQ b75D2
        LDA a41F0
        STA a044C
        STA a07BC
b75D2   RTS 

j75D3   LDA #$00
        STA a57
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        STA $D015    ;Sprite display Enable
        STA a24
        JSR s9A1C
        LDA #>p0B0F
        STA a59
        LDA #<p0B0F
        STA a58
        LDX #$00
        LDA #$01
        STA a5B
b75F6   LDA f7674,X
        JSR s9ED7
        INX 
        CPX #$09
        BNE b75F6
        LDA #$14
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$15
        STA $D404    ;Voice 1: Control Register
        LDA #$00
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        STA a02
b7617   LDA #$00
        STA a03
b761B   LDA a03
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX #$02
b7622   LDY #$30
b7624   DEY 
        BNE b7624
        DEX 
        BNE b7622
        INC a03
        BNE b761B
b762E   LDA a03
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX #$02
b7635   LDY #$30
b7637   DEY 
        BNE b7637
        DEX 
        BNE b7635
        DEC a03
        BNE b762E
        DEC a02
        LDA a02
        STA $D418    ;Select Filter Mode and Volume
        BNE b7617
        JSR s765D
        LDA a41F6
        CMP #$02
        BNE b7657
        JMP j7A32

b7657   JSR s7743
j765A   JMP j8234

s765D   LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

f7674   .TEXT "GAME OVER"
f767D   .TEXT "FAR OUT FLOCK OF FLEECY FLIERS\\\\\  "
p76A2   .TEXT "1\\0005000\\PHREAKY GOATOIDS    2\\00040"
        .TEXT "00\\LLICK THAT LLAMA    3\\0003000\\PINK"
        .TEXT " FLOYD          "
p7702   .TEXT "4\\0002000\\GENESIS             5\\00010"
        .TEXT "00\\MARILLION           ", $FF
s7743   LDX #$00
b7745   STX a06
        JSR s7752
        LDX a06
        INX 
        CPX #$05
        BNE b7745
        RTS 

s7752   LDA #$04
        STA a03
        LDA a60
        STA a02
        LDA #<p76A2
        STA a04
        LDA #>p76A2
        STA a05
        CPX #$00
        BEQ b7776
b7766   LDA a04
        CLC 
        ADC #$20
        STA a04
        LDA a05
        ADC #$00
        STA a05
        DEX 
        BNE b7766
b7776   DEC a02
        DEC a02
        DEC a02
        LDY #$03
b777E   LDA (p02),Y
        CMP (p04),Y
        BEQ b7787
        BPL b778D
        RTS 

b7787   INY 
        CPY #$0A
        BNE b777E
        RTS 

b778D   LDA a06
        CMP #$04
        BNE b7796
        JMP j77CE

b7796   LDA #<p7702
        STA a48
        LDA #>p7702
        STA a49
        LDA #$04
        STA aF1
b77A2   LDY #$03
b77A4   LDA (p48),Y
        TAX 
        TYA 
        PHA 
        CLC 
        ADC #$20
        TAY 
        TXA 
        STA (p48),Y
        PLA 
        TAY 
        INY 
        CPY #$20
        BNE b77A4
        LDY #$20
b77B9   DEC a48
        LDA a48
        CMP #$FF
        BNE b77C3
        DEC a49
b77C3   DEY 
        BNE b77B9
        DEC aF1
        LDA aF1
        CMP a06
        BNE b77A2
j77CE   LDY #$03
b77D0   LDA (p02),Y
        STA (p04),Y
        INY 
        CPY #$0A
        BNE b77D0
        LDA #$04
        STA a06
        JMP j7822

f77E0   .BYTE $00,$0A,$1C,$14,$12,$0E,$15,$1A
        .BYTE $1D,$21,$22,$25,$2A,$24,$27,$26
        .BYTE $29,$3E,$11,$0D,$16,$1E,$1F,$09
        .BYTE $17,$19,$0C,$3C,$2C,$2F,$38,$18
        .BYTE $01
f7801   .BYTE $FF,$01,$02,$03,$04,$05,$06,$07
        .BYTE $08,$09,$0A,$0B,$0C,$0D,$0E,$0F
        .BYTE $10,$11,$12,$13,$14,$15,$16,$17
        .BYTE $18,$19,$1A,$20,$1C,$1F,$1B,$1E
        .BYTE $00
j7822   JSR s9A1C
        LDA #$00
        STA a24
        JSR s7F10
        LDA #>p0523
        STA a5B
        LDA #<p0523
        STA a5A
        LDA #>p0E00
        STA a59
        LDA #<p0E00
        STA a58
b783C   JSR s804D
        INC a58
        LDA a58
        CMP #$28
        BNE b783C
        LDA #$0A
        STA a59
        LDA #$01
        STA a5B
        LDA #$05
        STA a58
        LDX #$00
b7855   LDA f78A4,X
        JSR s9ED7
        INX 
        CPX #$1E
        BNE b7855
        LDA #$10
        STA a59
        JSR s7A59
        LDA #$03
        STA $D015    ;Sprite display Enable
        LDA #$01
        STA a4470
        STA a4471
        LDA #<p901C
        STA a4460
        LDA #>p901C
        STA a4461
        LDA #$8D
        STA a4468
        STA a4469
        LDA #<pD1F6
        STA a07F8
        LDA #>pD1F6
        STA a07F9
        LDA #<p0C05
        STA a58
        LDA #>p0C05
        STA a59
        LDA #$03
        STA a5B
        LDA #$00
        STA aF1
        JMP j78D8

        RTS 

f78A4   .TEXT "TYPE IN YOUR HISCORE SIGNATURE"
s78C2   JSR ROM_SCNKEY ;$FF9F - scan keyboard                    
        LDA aC5
        RTS 

s78C8   JSR s78C2
        CMP #$40
        BEQ s78C8
        RTS 

s78D0   JSR s78C2
        CMP #$40
        BNE s78D0
        RTS 

j78D8   JSR s78C8
        LDX #$00
b78DD   CMP f77E0,X
        BEQ b78E9
        INX 
        CPX #$21
        BNE b78DD
        BEQ j78D8
b78E9   LDA f7801,X
        BNE b78FC
        LDA #$16
        STA aF1
        LDA #$00
        STA a1F
        JSR s765D
        JMP j79AB

b78FC   CMP #$FF
        BEQ b7915
        LDY aF1
        CPY #$10
        BNE b7909
        JMP j78D8

b7909   STA a5A
        JSR s804D
        INC a58
        INC aF1
        JMP j793C

b7915   LDA #$20
        STA a5A
        DEC a58
        JSR s804D
        DEC aF1
        LDA aF1
        CMP #$FF
        BEQ b792C
        JSR s7980
        JMP j795C

b792C   INC aF1
        INC a58
        JMP j78D8

b7933   LDY #$80
b7935   DEY 
        BNE b7935
        DEX 
        BNE b7933
        RTS 

j793C   INC a4460
        INC a07F8
        LDA a07F8
        CMP #$FA
        BEQ b7951
        LDX #$38
        JSR b7933
        JMP j793C

b7951   LDA #$F6
        STA a07F8
        JSR s78D0
        JMP j78D8

j795C   DEC a4460
        DEC a07F8
        LDA a07F8
        CMP #$F5
        BNE b796E
        LDA #$F9
        STA a07F8
b796E   CMP #$F6
        BEQ b797A
        LDX #$38
        JSR b7933
        JMP j795C

b797A   JSR s78D0
        JMP j78D8

s7980   LDA #$07
        STA $D015    ;Sprite display Enable
        LDA #$E5
        STA a07FA
        LDA #$90
        STA a4462
        STA a446A
b7992   INC a4472
        LDX #$03
        JSR b7933
        DEC a4462
        LDA a4462
        CMP a4460
        BNE b7992
        LDA #$03
        STA $D015    ;Sprite display Enable
        RTS 

j79AB   JSR s7980
        LDA #$E0
        STA a07F8
b79B3   LDX #$40
        JSR b7933
        INC a07F8
        LDA a07F8
        CMP #$E5
        BNE b79B3
        LDA #$00
        STA $D015    ;Sprite display Enable
        LDX #$00
        LDY #$0C
b79CB   LDA f05E5,X
        STA (p04),Y
        INY 
        INX 
        CPX #$10
        BNE b79CB
        RTS 

s79D7   LDA a60
        CMP #$0A
        BEQ b79E4
        LDA #$0A
        STA a60
        JMP j79EC

b79E4   LDA #<p20
        STA a60
        LDA #>p20
        STA a61
j79EC   LDA a41F1
        PHA 
        LDA a62
        STA a41F1
        PLA 
        STA a62
        LDA a41F3
        PHA 
        LDA a5C
        STA a41F3
        PLA 
        STA a5C
        LDA a41F2
        PHA 
        LDA a07D3
        STA a41F2
        PLA 
        STA a07D3
        LDA a41F4
        PHA 
        LDA a044C
        STA a41F4
        LDA a41F5
        PHA 
        LDA a07BC
        STA a41F5
        JSR s7A4D
        PLA 
        STA a07BC
        PLA 
        STA a044C
        RTS 

j7A32   LDA a60
        CMP #$20
        BNE b7A3E
        JSR s79D7
        JSR s7EE6
b7A3E   JSR s7743
        JSR s79D7
        JSR s7EE6
        JSR s7743
        JMP j765A

s7A4D   LDA a5C
        PHA 
        JSR s7487
        PLA 
        STA a5C
        STA a5D
        RTS 

s7A59   LDA #$01
        STA a5B
        LDA #$0F
        STA a58
        LDX #$00
b7A63   LDA f7A86,X
        JSR s9ED7
        INX 
        CPX #$07
        BNE b7A63
        LDA a60
        CMP #$20
        BNE b7A76
        LDX #$0A
b7A76   LDA f7A86,X
        JSR s9ED7
        INX 
        CPX #$0A
        BEQ b7A85
        CPX #$0D
        BNE b7A76
b7A85   RTS 

f7A86   .TEXT "PLAYER ONETWO"
j7A93   LDA #>p0A0F
        STA a59
        LDA #<p0A0F
        STA a58
        LDA #$20
        STA a5A
b7A9F   JSR s804D
        INC a58
        LDA a58
        CMP #$0E
        BNE b7A9F
        RTS 

f7AAB   .TEXT "GAME PLAY OPTIONS\\PRESS FIRE TO START"
f7AD1   .TEXT "F1\\PLAYERS IN GAME\\\\\\\\\\\\\\\\\\1"
f7AF7   .TEXT "F3\\PLANETBUSTER INITIAL CHARGE\\\\\\0"
f7B1D   .TEXT "F5\\GAME ENTRY LEVEL\\\\\\\\\\\\\\\\\1"
s7B43   JSR s9A1C
        LDA #$00
        STA aF4
        LDA #<pBFFF
        STA aF2
        LDA #>pBFFF
        STA aF3
        LDA #$01
        STA a5B
        LDA #$01
        STA a58
        LDX #$00
b7B5C   LDA #$09
        STA a59
        LDA #$01
        STA a5B
        LDA f7AAB,X
        JSR s7B9E
        LDA #$0B
        STA a59
        LDA #$07
        STA a5B
        LDA f7AD1,X
        JSR s7B9E
        LDA #$04
        STA a5B
        LDA #$0D
        STA a59
        LDA f7AF7,X
        JSR s7B9E
        LDA #$0F
        STA a59
        LDA #$03
        STA a5B
        LDA f7B1D,X
        JSR s7B9E
        INC a58
        INX 
        CPX #$26
        BNE b7B5C
        JMP j7BA5

s7B9E   AND #$3F
        STA a5A
        JMP s804D

j7BA5   LDA $DC00    ;CIA1: Data Port Register A
        AND #$10
        BNE b7BAF
        JMP j7C08

b7BAF   JSR ROM_SCNKEY ;$FF9F - scan keyboard                    
        LDA aF4
        BEQ b7BBC
        LDX #$F8
        TXS 
        JMP j8234

b7BBC   LDA aC5
        CMP #$40
        BEQ j7BA5
        JSR s7BCB
        JSR s78D0
        JMP j7BA5

s7BCB   CMP #$04
        BNE b7BE0
        INC a05DE
        LDA a05DE
        CMP #$33
        BNE b7BDF
        DEC a05DE
        DEC a05DE
b7BDF   RTS 

b7BE0   CMP #$05
        BNE b7BF4
        INC a062E
        LDA a062E
        CMP #$35
        BNE b7BDF
        LDA #$30
        STA a062E
        RTS 

b7BF4   CMP #$06
        BNE b7BDF
        INC a067E
        LDA a067E
        CMP #$3A
        BNE b7BDF
        LDA #$31
        STA a067E
        RTS 

j7C08   LDA a05DE
        SEC 
        SBC #$30
        STA a41F6
        LDA a062E
        STA a41F0
        LDA a067E
        SEC 
        SBC #$31
        STA a62
        STA a41F1
        RTS 

s7C23   LDA #$00
        STA aF1
        LDA #<p0401
        STA a23
        LDA #>p0401
        STA a24
        STA a41F7
        RTS 

j7C33   LDX #$00
        LDA #$20
b7C37   STA f4000,X
        INX 
        CPX #$04
        BNE b7C37
        LDX aF1
        LDA f767D,X
        CMP #$FF
        BNE b7C4E
        LDX #$FF
        STX aF1
        LDA #$20
b7C4E   AND #$3F
        STA a4002
        LDA #$01
        STA a4004
        INC aF1
        RTS 

s7C5B   LDA #$00
        STA a24
        STA a57
        JSR s9A1C
        LDA #$05
        STA a5B
        STA a41F7
        LDA #<p0300
        STA a58
b7C6F   LDA #>p0300
        STA a59
        LDA #$2F
        STA a5A
        JSR s804D
        LDA #<p2314
        STA a59
        LDA #>p2314
        STA a5A
        JSR s804D
        INC a58
        LDA a58
        CMP #$28
        BNE b7C6F
        LDA #$01
        STA a5B
        LDA #$05
        STA a58
        LDX #$00
b7C97   LDA #$09
        STA a59
        LDA f7D61,X
        JSR s7B9E
        LDA #$0B
        STA a59
        LDA #$04
        STA a5B
        LDA f7D81,X
        JSR s7B9E
        LDA #$01
        STA a5B
        LDA #$0D
        STA a59
        LDA f7DA1,X
        JSR s7B9E
        LDA #$0F
        STA a59
        LDA f7DC1,X
        JSR s7B9E
        INC a58
        INX 
        CPX #$20
        BNE b7C97
        LDA #$FF
        STA $D015    ;Sprite display Enable
        STA $D01B    ;Sprite to Background Display Priority
        LDA #$20
        STA a4440
        STA a444C
        STA a4464
        LDA #$40
        STA a4441
        STA a444D
        STA a4465
        LDA #$6C
        STA a4442
        STA a444E
        STA a4466
        LDA #$8C
        STA a4443
        STA a444F
        STA a4467
        LDX #$00
b7D04   LDA #$50
        STA f4444,X
        LDA #$84
        STA f446C,X
        LDA #$BE
        STA f4450,X
        LDA #$0F
        STA f4448,X
        STA f4454,X
        STA f4474,X
        LDA #$07
        STA a4470,X
        INX 
        CPX #$04
        BNE b7D04
        LDA #$CA
        STA a4484
        STA a4485
        LDA #$D9
        STA a4486
        STA a4487
        LDA #$C4
        STA a4488
        STA a4489
        LDA #$D3
        STA a448A
        STA a448B
        LDA #$CD
        STA a4480
        STA a4481
        LDA #$DC
        STA a4482
        STA a4483
        JSR s7E34
        JSR s7E76
        JMP j7DE1

f7D61   .TEXT "       CRACKED BY \HCR\         "
f7D81   .TEXT "   S H E E P   IN   S P A C E   "
f7DA1   .TEXT " DESIGN AND PROGRAMMING BY JEFF "
f7DC1   .TEXT "   MUSIC ARRANGED BY J\LISNEY   "
j7DE1   LDX #$10
b7DE3   LDY #$20
b7DE5   TXA 
        PHA 
        TYA 
        PHA 
        JSR ROM_SCNKEY ;$FF9F - scan keyboard                    
        PLA 
        TAY 
        PLA 
        TAX 
        LDA aC5
        CMP #$40
        BNE b7E06
        LDA a1F
        BEQ b7E06
        DEY 
        BNE b7DE5
        DEX 
        BNE b7DE3
        JSR s7E13
        JMP j7DE1

b7E06   LDA #$00
        STA $D015    ;Sprite display Enable
        STA a1F
        JSR s765D
        JMP s78D0

s7E13   LDX #$00
b7E15   INC a4440,X
        INC a4464,X
        INC a444C,X
        INX 
        CPX #$02
        BNE b7E15
b7E23   DEC a444C,X
        DEC a4464,X
        DEC a4440,X
        INX 
        CPX #$04
        BNE b7E23
        JMP j7E5D

s7E34   LDA #$05
        STA a62
        JSR s7487
        LDA #$33
        STA a07F8
        STA a07F9
        LDA #$2F
        STA a07FA
        STA a07FB
        LDX #$00
b7E4D   LDA #$80
        STA a4468,X
        LDA #$56
        STA a4460,X
        INX 
        CPX #$04
        BNE b7E4D
        RTS 

j7E5D   INC a4460
        INC a4461
        DEC a4462
        DEC a4463
        INC a4468
        DEC a4469
        INC a446A
        DEC a446B
        RTS 

s7E76   LDA #$01
        STA a10
        STA a19
        STA a1B
        STA a1D
        LDA #>p65FE
        STA a14
        LDA #<p65FE
        STA a13
        STA a15
        STA a17
        LDA #$68
        STA a16
        LDA #$6B
        STA a18
        LDA #$1B
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$11
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        LDA #$F0
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA #$00
        STA a5F
        LDA #$01
        STA a1F
        RTS 

j7EBD   LDX #$00
        LDA #$20
b7EC1   STA f4000,X
        INX 
        CPX #$04
        BNE b7EC1
        INC aF2
        BNE b7ED7
        INC aF3
        LDA aF3
        CMP #$D0
        BNE b7ED7
        STA aF4
b7ED7   LDY #$00
        LDA (pF2),Y
        AND #$3F
        STA a4002
        LDA #$01
        STA a4004
        RTS 

s7EE6   LDA a60
        CMP #$20
        BEQ b7EFE
        LDX #$00
b7EEE   LDA #$01
        STA fD80A,X
        LDA #$06
        STA fD820,X
        INX 
        CPX #$07
        BNE b7EEE
        RTS 

b7EFE   LDX #$00
b7F00   LDA #$01
        STA fD820,X
        LDA #$06
        STA fD80A,X
        INX 
        CPX #$07
        BNE b7F00
        RTS 

s7F10   LDA #$01
        STA a10
        STA a19
        STA a1B
        STA a1D
        LDA #$56
        STA a14
        LDA #$57
        STA a16
        STA a18
        LDA #$BE
        STA a13
        LDA #$3E
        STA a15
        LDA #<p0FBE
        STA a17
        LDA #>p0FBE
        STA $D418    ;Select Filter Mode and Volume
        LDA #$F0
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA #$1B
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$11
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        LDA #$00
        STA a5F
        LDA #$01
        STA a1F
        RTS 

        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$02
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$A9
        .BYTE $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00

;------------------------------------------------
; Execution starts here
; j8000
;------------------------------------------------
        ORA #$80
        ORA #$80
        .BYTE $C3,$C2 ;DCP ($C2,X)
        CMP $3038
        LDA #$7F
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        JMP j821C


s8011   LDA #>p0400
        STA a49
        LDA #<p0400
        STA a48
        LDX #$00
b801B   LDA a48
        STA f0340,X
        LDA a49
        STA f0360,X
        LDA a48
        CLC 
        ADC #$28
        STA a48
        LDA a49
        ADC #$00
        STA a49
        INX 
        CPX #$1B
        BNE b801B
        RTS 

s8038   LDX a59
        LDY a58
        LDA f0340,X
        STA a48
        LDA f0360,X
        STA a49
        RTS 

s8047   JSR s8038
        LDA (p48),Y
b804C   RTS 

s804D   LDA a58
        CMP #$28
        BPL b804C
        TXA 
        PHA 
        TYA 
        PHA 
        JSR s8038
        LDA a5A
        STA (p48),Y
        LDA a49
        CLC 
        ADC #$D4
        STA a49
        LDA a5B
        STA (p48),Y
        PLA 
        TAY 
        PLA 
        TAX 
        RTS 

s806E   LDX #$00
b8070   LDA #$20
        STA p0400,X
        STA f0500,X
        STA f0600,X
        STA f0700,X
        DEX 
        BNE b8070
        RTS 

s8082   LDX #$2F
        SEI 
        LDA #<p80D2
        STA a0314    ;IRQ
        LDA #>p80D2
        STA a0315    ;IRQ
        LDA #$80
        STA a0291
        LDA #<p80D1
        STA a0318    ;NMI
        LDA #>p80D1
        STA a0319    ;NMI
        LDA #$00
        STA a20
        LDA #$02
        CLI 
        LDA #$81
        STA $D01A    ;VIC Interrupt Mask Register (IMR)
        LDA $D016    ;VIC Control Register 2
        AND #$F7
        ORA #$10
        STA $D016    ;VIC Control Register 2
        LDA #$20
        STA $D012    ;Raster Position
        LDA $D011    ;VIC Control Register 1
        AND #$7F
        STA $D011    ;VIC Control Register 1
        LDA #$00
        STA a1F
        LDA #$07
        STA a10
        STA a11
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        RTS 

p80D1   RTI 

p80D2   LDA $D019    ;VIC Interrupt Request Register (IRR)
        AND #$01
        BNE b80DC
        JMP eEA31

b80DC   INC a20
        JMP j83D0

j80E1   LDA a20
        TAX 
        LDA f83C8,X
        STA $D012    ;Raster Position
        LDA $D011    ;VIC Control Register 1
        AND #$7F
        ORA f83CC,X
        STA $D011    ;VIC Control Register 1
        LDA #$81
        STA $D019    ;VIC Interrupt Request Register (IRR)
        STA $D01A    ;VIC Interrupt Mask Register (IMR)
        PLA 
        TAY 
        PLA 
        TAX 
        PLA 
        RTI 

j8103   LDA a1F
        BNE b810A
b8107   JMP j80E1

b810A   DEC a10
        BNE b8107
        LDA a11
        STA a10
        DEC a19
        BNE b814E
        LDA a13
        CLC 
        ADC #$02
        STA a13
        LDA a14
        ADC #$00
        STA a14
        LDY #$00
        STY $D404    ;Voice 1: Control Register
        LDA (p13),Y
        STA a19
        INY 
        LDA (p13),Y
        CMP #$F0
        BEQ b814E
        TAX 
        LDA f8193,X
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA f81D4,X
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA a5F
        BNE b814E
        LDA #$11
        STA $D404    ;Voice 1: Control Register
b814E   DEC a1B
        BNE b8190
        LDA a15
        CLC 
        ADC #$02
        STA a15
        LDA a16
        ADC #$00
        STA a16
        LDY #$00
        LDA (p15),Y
        STY $D40B    ;Voice 2: Control Register
        STA a1B
        INY 
        LDA (p15),Y
        CMP #$F0
        BEQ b8190
        CMP #$FF
        BNE b817A
        LDA #$00
        STA a1F
        JMP b8107

b817A   TAX 
        LDA f8193,X
        STA $D407    ;Voice 2: Frequency Control - Low-Byte
        LDA f81D4,X
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA a5F
        BNE b8190
        LDA #$11
        STA $D40B    ;Voice 2: Control Register
b8190   JMP j8383

f8193   .BYTE $18,$38,$5A,$7D,$A3,$CC,$F6,$23
        .BYTE $53,$86,$BB,$F4,$30,$70,$B4,$FB
        .BYTE $47,$98,$ED,$47,$A7,$0C,$77,$E9
        .BYTE $61,$E1,$68,$F7,$8F,$30,$DA,$8F
        .BYTE $4E,$18,$EF,$D2,$C3,$C3,$D1,$EF
        .BYTE $1F,$60,$B5,$1E,$9C,$31,$DF,$A5
        .BYTE $87,$86,$A2,$DF,$3E,$C1,$6B,$3C
        .BYTE $39,$63,$BE,$4B,$0F,$0C,$45,$BF
        .BYTE $7D
f81D4   .BYTE $02,$02,$02,$02,$02,$02,$02,$03
        .BYTE $03,$03,$03,$03,$04,$04,$04,$04
        .BYTE $05,$05,$05,$06,$06,$07,$07,$07
        .BYTE $08,$08,$09,$09,$0A,$0B,$0B,$0C
        .BYTE $0D,$0E,$0E,$0F,$10,$11,$12,$13
        .BYTE $15,$16,$17,$19,$1A,$1C,$1D,$1F
        .BYTE $21,$23,$25,$27,$2A,$2C,$2F,$32
        .BYTE $35,$38,$3B,$3F,$43,$47,$4B,$4F
f8214   .BYTE $54,$01,$07,$03,$05,$04,$06,$00

j821C
        JSR s8011
        LDA #$00
        STA a57
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        JSR s806E
        LDA #$18
        STA $D018    ;VIC Memory Control Register
        JSR s9216
j8234   JSR s8082
        JSR s7C5B
        JSR s7C23
        JSR s7B43
        JSR s7487
        LDA a5C
        STA a41F3
        LDA a41F0
        STA a41F4
        STA a41F5
        LDA #$34
        STA a41F2
        LDA #$FE
        STA $D01B    ;Sprite to Background Display Priority
        LDA $D01E    ;Sprite to Sprite Collision Detect
        LDA $D01F    ;Sprite to Background Collision Detect
        LDA #$09
        STA $D022    ;Background Color 1, Multi-Color Register 0
        LDA #$0E
        STA $D023    ;Background Color 2, Multi-Color Register 1
        LDA #$0A
        STA a60
        JSR s866C
        JSR s8082
        JSR s9216
j8278   JSR s7487
        LDA #$0A
        STA a59
        JSR s866C
        JSR InitCharset
        LDA #$00
        STA a41F7
        STA a61
        LDA a4C70
        STA a53
j8291   LDA #$00
        STA a63
        STA a4C72
        STA a3B
        STA a5E
        STA a52
        STA a4D
        STA a4458
        STA a4459
        STA a445A
        STA a23
        STA a37
        STA a27
        STA a3F
        STA a4A
        STA a3C
        LDA #$FF
        STA a38
        JSR s9792
        JSR s9254
        JSR s7EE6
        LDA #$1F
        STA $D418    ;Select Filter Mode and Volume
        JSR s9A1C
        LDA #$01
        STA a21
        STA a51
        STA a4C
        STA a64
        STA a34
        STA a36
        STA a22
        STA a2E
        STA a2D
        STA a39
        STA a3A
        STA a3E
        STA a4470
        STA a56
        LDA #$0A
        STA a59
        JSR s7A59
        JSR s96CC
        JSR j73AD
        LDA $D01C    ;Sprites Multi-Color Mode Select
        AND #$FC
        STA $D01C    ;Sprites Multi-Color Mode Select
        LDA #$03
        STA $D025    ;Sprite Multi-Color Register 0
        LDA #$FF
        STA $D015    ;Sprite display Enable
        JSR s8E82
        LDA #$04
        STA $D026    ;Sprite Multi-Color Register 1
        JSR j8EA1
        LDA #$90
        STA a30
        STA a4468
        LDA #$18
        STA a2F
        STA a4460
        STA a35
        LDA #$C4
        STA a32
        LDA #$C0
        STA a07F9
        LDA #$01
        STA a24
        STA a31
        LDA #$07
        STA a33
        LDA #$00
        STA $D415    ;Filter Cutoff Frequency: Low-Nybble
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$BB
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        JSR s9B2E
        LDA #$00
        STA a37
        JMP j865A

s834D   TYA 
        PHA 
        TAX 
        INX 
        TYA 
        ASL 
        TAY 
        LDA a08
        STA $D001,Y  ;Sprite 0 Y Pos
        LDA a07
        ASL 
        STA $D000,Y  ;Sprite 0 X Pos
        BCS b8373
        LDA #$00
        SEC 
b8364   ROL 
        DEX 
        BNE b8364
        EOR #$FF
        AND $D010    ;Sprites 0-7 MSB of X coordinate
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j8380

b8373   LDA #$00
        SEC 
b8376   ROL 
        DEX 
        BNE b8376
        ORA $D010    ;Sprites 0-7 MSB of X coordinate
        STA $D010    ;Sprites 0-7 MSB of X coordinate
j8380   PLA 
        TAY 
        RTS 

j8383   DEC a1D
        BNE b83C5
        LDA a17
        CLC 
        ADC #$02
        STA a17
        LDA a18
        ADC #$00
        STA a18
        LDY #$00
        LDA (p17),Y
        STY $D412    ;Voice 3: Control Register
        STA a1D
        INY 
        LDA (p17),Y
        CMP #$F0
        BEQ b83C5
        CMP #$FF
        BNE b83AF
        LDA #$00
        STA a1F
        JMP b8107

b83AF   TAX 
        LDA f8193,X
        STA $D40E    ;Voice 3: Frequency Control - Low-Byte
        LDA f81D4,X
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA a5F
        BNE b83C5
        LDA #$11
        STA $D412    ;Voice 3: Control Register
b83C5   JMP b8107

f83C8   EOR (p70,X)
        LDA (pE9),Y
f83CC   BRK #$00
        BRK #$00
j83D0   LDA a20
        CMP #$01
        BNE b83EA
        LDA a57
        BNE b83E4
        LDA $D016    ;VIC Control Register 2
        AND #$F8
        ORA a21
        STA $D016    ;VIC Control Register 2
b83E4   JSR s88C1
        JMP j80E1

b83EA   CMP #$02
        BNE b83FC
        LDA $D016    ;VIC Control Register 2
        AND #$F8
        STA $D016    ;VIC Control Register 2
        JSR s88EA
        JMP j80E1

b83FC   CMP #$03
        BNE b8414
        LDA a57
        BNE b840E
        LDA $D016    ;VIC Control Register 2
        AND #$F8
        ORA a21
        STA $D016    ;VIC Control Register 2
b840E   JSR s8913
        JMP j80E1

b8414   LDA $D016    ;VIC Control Register 2
        AND #$F8
        STA $D016    ;VIC Control Register 2
        JSR s8AA6
        LDA a56
        CMP #$02
        BNE b8441
        LDA $D020    ;Border Color
        AND #$07
        CMP #$02
        BNE b8439
        LDA #$06
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        JMP b8441

b8439   LDA #$02
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
b8441   LDA #$00
        STA a20
        DEC a22
        BEQ b844C
b8449   JMP j8103

b844C   LDA #$01
        STA a22
        LDA a23
        BEQ b846B
        LDA a21
        SEC 
        SBC a24
        STA a21
        AND #$F8
        BEQ b8449
        LDA a21
        AND #$07
        STA a21
        JSR s8485
        JMP b8449

b846B   LDA a21
        CLC 
        ADC a24
        STA a21
        AND #$F8
        BEQ b8449
        LDA a21
        AND #$07
        STA a21
        JSR s8572
        JSR s855B
        JMP b8449

s8485   LDA a57
        BEQ b848C
        JMP j9A58

b848C   JSR s8572
        LDX #$00
        LDY #$01
j8493   JSR s8499
        JMP j84FA

s8499   LDA f04A0,Y
        STA f04A0,X
        LDA f04C8,Y
        STA f04C8,X
        LDA f0450,Y
        STA f0450,X
        LDA f0478,Y
        STA f0478,X
        LDA f06F8,Y
        STA f06F8,X
        LDA f0720,Y
        STA f0720,X
        LDA f0748,Y
        STA f0748,X
        LDA f0770,Y
        STA f0770,X
        LDA fD8A0,Y
        STA fD8A0,X
        LDA fD8C8,Y
        STA fD8C8,X
        LDA fD850,Y
        STA fD850,X
        LDA fD878,Y
        STA fD878,X
        LDA fDAF8,Y
        STA fDAF8,X
        LDA fDB20,Y
        STA fDB20,X
        LDA fDB48,Y
        STA fDB48,X
        LDA fDB70,Y
        STA fDB70,X
        RTS 

j84FA   INY 
        INX 
        CPX #$27
        BEQ b8503
        JMP j8493

b8503   LDX #$27
j8505   LDA f4000
        STA f0450,X
        LDA a4001
        STA f0478,X
        LDA a4002
        STA f04A0,X
        LDA a4003
        STA f04C8,X
        LDA a4004
        STA fD850,X
        STA fD878,X
        STA fD8A0,X
        STA fD8C8,X
        TXA 
        PHA 
        JSR s85F0
        PLA 
        TAX 
        LDA f4000
        STA f06F8,X
        LDA a4001
        STA f0720,X
        LDA a4002
        STA f0748,X
        LDA a4003
        STA f0770,X
        LDA a4004
        STA fDAF8,X
        STA fDB20,X
        STA fDB48,X
        STA fDB70,X
        RTS 

s855B   LDA a57
        BEQ b8562
        JMP j9ACE

b8562   LDY #$26
        LDX #$27
b8566   JSR s8499
        DEY 
        DEX 
        BNE b8566
        LDX #$00
        JMP j8505

s8572   LDA a41F7
        BEQ b857A
        JMP j7C33

b857A   JSR s8580
        JMP j85A1

s8580   LDA a23
        BEQ b8588
        INC a27
        INC a27
b8588   DEC a27
        LDA a27
        AND #$F8
        BEQ b859A
        LDA a23
        BEQ b8598
        INC a29
        INC a29
b8598   DEC a29
b859A   LDA a27
        AND #$07
        STA a27
        RTS 

j85A1   LDA a29
        LDY #$00
        STY a2B
j85A7   LDY a23
        CPY #$01
        BNE b85B0
        CLC 
        ADC #$05
b85B0   STA a28
        LDA a27
        CLC 
        ASL 
        CLC 
        ASL 
        CLC 
        ASL 
        CLC 
        ADC a2B
        STA a25
        LDX a28
        LDA f4200,X
        LDY a2B
        CPY #$40
        BNE b85CD
        LDA f4300,X
b85CD   PHA 
        AND #$80
        CLC 
        ADC a25
        STA a25
        PLA 
        AND #$3F
        CLC 
        ADC #$45
        STA a26
        LDY #$00
        LDX #$04
b85E1   LDA (p25),Y
        STA f4000,Y
        INY 
        DEX 
        BNE b85E1
        LDA (p25),Y
        STA f4000,Y
        RTS 

s85F0   LDA #$40
        STA a2B
        LDA a41F7
        BEQ b85FC
        JMP j7EBD

b85FC   LDA a29
        JMP j85A7

        LDA #$00
b8603   STA f4200,X
        STA f4300,X
        INX 
        BNE b8603
        RTS 

j860D   LDA a23
        BNE b8628
        DEC a24
        LDA a24
        CMP #$FF
        BEQ b861C
b8619   JMP j8A2B

b861C   JSR s8580
        LDA #$01
        STA a23
        STA a24
        JMP j8A2B

b8628   INC a24
        LDA a24
        CMP #$08
        BNE b8619
        DEC a24
        LDA a24
        CMP #$FF
        BNE b863A
        INC a24
b863A   JMP j8A2B

j863D   LDA a23
        BEQ b8657
        DEC a24
        LDA a24
        CMP #$FF
        BNE b863A
        LDA #$01
        STA a24
        JSR s8580
        LDA #$00
        STA a23
        JMP j8A2B

b8657   JMP b8628

j865A   JSR s8B6B
        JSR s8B82
        JSR s8C88
        JSR s8DA4
        JSR s97C1
        JMP j865A

s866C   LDX #$00
        TXA 
b866F   STA f4200,X
        STA f4300,X
        DEX 
        BNE b866F
        LDA #$02
        LDX #$10
b867C   STA f4200,X
        STA f4300,X
        INX 
        CPX #$F0
        BNE b867C
        LDA #$1C
        STA a02
b868B   JSR s8747
        AND #$7F
        ADC #$60
        TAX 
        LDA #$03
        STA a03
        JSR s8747
        AND #$01
        TAY 
b869D   JSR s8747
        AND #$01
        BEQ b86A9
        LDA #$80
        JMP j86AB

b86A9   LDA #$03
j86AB   CPY #$01
        BEQ b86B5
        STA f4200,X
        JMP j86B8

b86B5   STA f4300,X
j86B8   INX 
        DEC a03
        BNE b869D
        DEC a02
        BNE b868B
        JSR s8747
        AND #$7F
        ADC #$60
        TAX 
        LDA #$81
        STA f4300,X
        STA f4200,X
        STX a4422
        LDA #$04
        STA a03
b86D8   JSR s8747
        AND #$1F
        SEC 
        SBC #$10
        TAX 
        JSR s8747
        AND #$01
        TAY 
        LDA #$05
        CPY #$01
        BEQ b86F3
        STA f4200,X
        JMP j86F6

b86F3   STA f4300,X
j86F6   DEC a03
        BNE b86D8
        LDA #$0C
        STA a02
b86FE   JSR s8747
        AND #$7F
        ADC #$10
        TAX 
        LDA #$03
        STA a03
        JSR s8747
        AND #$01
        STA a04
b8711   JSR s8747
        AND #$03
        TAY 
        LDA f8743,Y
        LDY a04
        CPY #$01
        BEQ b872D
        LDY f4200,X
        CPY #$02
        BNE b8737
        STA f4200,X
        JMP b8737

b872D   LDY f4300,X
        CPY #$02
        BNE b8737
        STA f4300,X
b8737   INX 
        DEC a03
        BNE b8711
        DEC a02
        BNE b86FE
        JMP j8753

f8743   .BYTE $04,$83,$04,$83
s8747   STX aFC
        INC a2C
        LDX a2C
        LDA fA000,X
        LDX aFC
        RTS 

j8753   LDA #$08
        STA a04
        LDA #$10
        STA a02
        STA a03
        STA a05
        STA a06
b8761   JSR s8747
        AND #$07
        ADC #$03
        ADC a02
        STA a02
        TAX 
        LDA f4200,X
        CMP #$02
        BNE b8761
        LDY a04
        DEY 
        LDA #$01
        STA f4200,X
        TXA 
        STA f4400,Y
b8780   JSR s8747
        AND #$07
        ADC #$03
        ADC a02
        STA a02
        TAX 
        LDA f4300,X
        CMP #$02
        BNE b8780
        LDY a04
        DEY 
        LDA #$01
        STA f4300,X
        TXA 
        STA f4408,Y
b879F   JSR s8747
        AND #$07
        ADC #$03
        ADC a06
        STA a06
        TAX 
        LDA f4200,X
        CMP #$02
        BNE b879F
        LDY a04
        DEY 
        LDA #$82
        STA f4200,X
        TXA 
        STA f4410,X
b87BE   JSR s8747
        AND #$07
        ADC #$04
        ADC a05
        STA a05
        TAX 
        LDA f4300,X
        CMP #$02
        BNE b87BE
        LDY a04
        DEY 
        LDA #$82
        STA f4300,X
        TXA 
        STA f4418,X
        DEC a04
        BNE b8761
b87E1   JSR s8747
        AND #$3F
        ADC #$10
        TAX 
        LDA f4200,X
        CMP #$02
        BNE b87E1
        LDA #$84
        STA f4200,X
        STX a4420
b87F8   JSR s8747
        AND #$3F
        ADC #$10
        TAX 
        LDA f4300,X
        CMP #$02
        BNE b87F8
        LDA #$84
        STA f4300,X
        STX a4421
        JMP j756C

b8812   RTS 

j8813   LDA a4C
        BEQ b8820
        DEC a4C
        BNE b8820
        LDA #$80
        STA $D412    ;Voice 3: Control Register
b8820   LDA a56
        BNE b8812
        LDA a2518
        PHA 
        LDX #$00
b882A   LDA f2519,X
        STA a2518,X
        INX 
        CPX #$07
        BNE b882A
        PLA 
        STA a251F
        LDX #$08
b883B   CLC 
        LDA a251F,X
        ROL 
        ADC #$00
        ROL 
        ADC #$00
        STA a251F,X
        CLC 
        LDA f24C7,X
        ROL 
        ADC #$00
        ROL 
        ADC #$00
        STA f24C7,X
        DEX 
        BNE b883B
        LDA a2340
        ASL 
        ADC #$01
        STA a2340
        EOR #$FF
        STA a2341
        LDA a2350
        ASL 
        ADC #$01
        STA a2350
        EOR #$FF
        STA a2351
        LDA a234F
        ASL 
        ADC #$01
        STA a234F
        EOR #$FF
        STA a234E
        LDA a235F
        ASL 
        ADC #$01
        STA a235F
        EOR #$FF
        STA a235E
        DEC a2D
        BEQ b8895
        RTS 

b8895   LDA #$03
        STA a2D
        INC a2E
        LDA a2E
        AND #$03
        STA a2E
        BEQ b88AC
        TAY 
        LDA #$00
b88A6   CLC 
        ADC #$20
        DEY 
        BNE b88A6
b88AC   STA a02
        LDA #$4B
        STA a03
        LDY #$00
b88B4   LDA (p02),Y
        STA f2300,Y
        INY 
        CPY #$20
        BNE b88B4
        JMP j7462

s88C1   LDA $D01E    ;Sprite to Sprite Collision Detect
        STA a4459
        LDY #$04
b88C9   LDA f443C,Y
        STA a07
        LDA a4440,Y
        STA a08
        JSR s834D
        LDA f4444,Y
        STA $D027,Y  ;Sprite 0 Color
        LDA f447C,Y
        STA a07F8,Y
        INY 
        CPY #$08
        BNE b88C9
        JMP j8D74

s88EA   LDA $D01E    ;Sprite to Sprite Collision Detect
        STA a4458
        LDY #$04
b88F2   LDA a4460,Y
        STA a07
        LDA a4468,Y
        STA a08
        JSR s834D
        LDA a4470,Y
        STA $D027,Y  ;Sprite 0 Color
        LDA a4484,Y
        STA a07F8,Y
        INY 
        CPY #$08
        BNE b88F2
        JMP j8D84

s8913   LDA $D01E    ;Sprite to Sprite Collision Detect
        STA a445A
        LDY #$04
b891B   LDA f4448,Y
        STA a07
        LDA a444C,Y
        STA a08
        JSR s834D
        LDA f4450,Y
        STA $D027,Y  ;Sprite 0 Color
        LDA a4480,Y
        STA a07F8,Y
        INY 
        CPY #$08
        BNE b891B
        JMP j8D94

s893C   LDA $DC00    ;CIA1: Data Port Register A
        STA a38
        LDA a3C
        BEQ b8948
        JMP j9CAD

b8948   JSR s8B40
        JSR s74F7
        JSR s8AC6
        JSR s9B97
        JSR s8A88
        LDA a56
        BEQ b895E
        JSR s9709
b895E   LDA #$02
        STA a02
b8962   LDA a38
        AND #$03
        CMP #$03
        BEQ b8972
        LDA a38
        AND #$01
        BEQ b8974
b8970   INC a30
b8972   INC a30
b8974   DEC a30
        LDA a30
        CMP #$44
        BEQ b8970
        CMP #$D4
        BEQ b8974
        JSR s8A4C
        LDA a56
        CMP #$02
        BNE b898E
b8989   LDX #$08
        JMP j899B

b898E   LDA a57
        BNE b8989
        LDX #$00
        LDA a30
b8996   CMP f89DB,X
        BNE b89AE
j899B   LDA f89EB,X
        STA a33
        LDA f89FB,X
        STA a32
        STX a47
        LDA a31
        STA a34
        JMP j89B3

b89AE   INX 
        CPX #$10
        BNE b8996
j89B3   DEC a02
        BNE b8962
        DEC a36
        BEQ b89BE
        JMP j8A2B

b89BE   LDA #$06
        STA a36
        LDA a31
        BNE b89C9
        JMP j8A73

b89C9   CMP a23
        BEQ b89D0
b89CD   JMP j860D

b89D0   LDA a33
        CMP a24
        BEQ j8A2B
        BPL b89CD
        JMP j863D

f89DB   .BYTE $4C,$4E,$58,$60,$67,$70,$77,$80
        .BYTE $90,$99,$A9,$B1,$B9,$C1,$C5,$C7
f89EB   .BYTE $00,$01,$02,$03,$04,$05,$06,$07
        .BYTE $07,$06,$05,$04,$03,$02,$01,$00
f89FB   .BYTE $C7,$C7,$C7,$C7,$C7,$C4,$C4,$C4
        .BYTE $C4,$C4,$C4,$C1,$C1,$C1,$C1,$C1
f8A0B   .BYTE $FF,$01,$01,$02,$04,$06,$08,$00
        .BYTE $00,$08,$06,$04,$02,$01,$01,$FF
f8A1B   .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00
        .BYTE $00,$01,$01,$01,$01,$01,$01,$01
j8A2B   LDA a2F
        STA a4460
        LDA a30
        STA a4468
        LDA a32
        LDY a39
        CLC 
        ADC f8B67,Y
        ADC a3B
        LDY a31
        CPY #$00
        BNE b8A48
        CLC 
        ADC #$0F
b8A48   STA a07F8
b8A4B   RTS 

s8A4C   LDA a56
        CMP #$01
        BEQ b8A4B
        LDA a38
        AND #$0C
        CMP #$0C
        BEQ b8A4B
        LDA $DC00    ;CIA1: Data Port Register A
        AND #$08
        BNE b8A6A
        LDA #$01
        STA a31
        LDA #$18
        STA a35
        RTS 

b8A6A   LDA #$00
        STA a31
        LDA #$90
        STA a35
        RTS 

j8A73   CMP a23
        BEQ b8A7A
b8A77   JMP j863D

b8A7A   LDA a33
        CMP a24
        BEQ b8A85
        BPL b8A77
        JMP j860D

b8A85   JMP j8A2B

s8A88   LDA a33
        CMP #$04
        BPL b8A8F
        RTS 

b8A8F   LDA a31
        BEQ b8A9D
        LDA a2F
        CMP a35
        BNE b8A9A
        RTS 

b8A9A   DEC a2F
b8A9C   RTS 

b8A9D   LDA a2F
        CMP a35
        BEQ b8A9C
        INC a2F
        RTS 

s8AA6   LDA $D01F    ;Sprite to Background Collision Detect
        STA a37
        LDY #$00
b8AAD   LDA a4460,Y
        STA a07
        LDA a4468,Y
        STA a08
        JSR s834D
        LDA a4470,Y
        STA $D027,Y  ;Sprite 0 Color
        INY 
        CPY #$04
        BNE b8AAD
b8AC5   RTS 

s8AC6   LDA #$00
        STA a3B
        LDA a56
        BNE b8AC5
        LDA a57
        BNE b8AC5
        LDA a37
        AND #$01
        BEQ b8AC5
        LDA a2F
        SEC 
        SBC #$08
        LSR 
        LSR 
        STA a58
        DEC a58
        LDA a31
        BEQ b8AEB
        INC a58
        INC a58
b8AEB   LDA a32
        CMP #$C1
        BNE b8B18
        LDA #$16
        STA a59
        JSR s8047
        CMP #$6C
        BEQ b8B0F
        CMP #$6E
        BEQ b8B0F
j8B00   LDA #$FF
        STA a3C
        LDA #$01
        STA a3A
        LDA #$DE
        STA a32
        PLA 
        PLA 
        RTS 

b8B0F   LDA a38
        ORA #$02
        STA a38
        JMP j8B30

b8B18   LDA #$02
        STA a59
        JSR s8047
        CMP #$6D
        BEQ b8B2A
        CMP #$6F
        BEQ b8B2A
        JMP j8B00

b8B2A   LDA a38
        ORA #$01
        STA a38
j8B30   LDA #$09
        STA a3B
        LDA a32
        CMP #$C7
        BEQ b8B3B
        RTS 

b8B3B   LDA #$06
        STA a3B
b8B3F   RTS 

s8B40   DEC a3A
        BNE b8B3F
        LDA #$16
        STA a3A
        LDA a2F
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ADC a29
        STA a50
        INC a50
        INC a39
        JSR s742C
        LDA a39
        AND #$03
        STA a39
        RTS 

f8B67   .BYTE $00,$01,$02,$01
s8B6B   DEC a3D
        BEQ b8B70
b8B6F   RTS 

b8B70   LDA #$09
        STA a3D
        JSR s893C
        DEC a3E
        BNE b8B6F
        LDA #$05
        STA a3E
        JMP j8813

s8B82   DEC a41
        BEQ b8B87
        RTS 

b8B87   LDA #$03
        STA a41
        JSR s9639
        LDA a3F
        BEQ b8B95
        JMP j8BD0

b8B95   LDA a38
        AND #$10
        BEQ b8B9C
b8B9B   RTS 

b8B9C   LDA a3B
        BNE b8B9B
        LDA a2F
        STA a3F
        LDA a30
        STA a40
        LDA a31
        STA a44
        LDA #$0C
        STA a46
        LDA #$00
        STA a43
        LDX a47
        LDA f8A0B,X
        CMP #$FF
        BEQ b8BE2
        STA a42
        LDA f8A1B,X
        STA a45
        LDA #$E5
        STA a07F9
        LDA #$01
        STA a4A
        JSR s8C5E
j8BD0   LDA a37
        AND #$02
        BEQ b8BFE
        LDA a57
        BNE b8BFE
        JSR s9E66
        LDA #$81
        STA $D412    ;Voice 3: Control Register
b8BE2   LDA #$04
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        STA a4C
        LDA #$00
        STA a3F
        STA a4A
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$C0
        STA a07F9
        STA a4461
        RTS 

b8BFE   JSR s92DB
        LDA a44
        BNE b8C09
        DEC a3F
        DEC a3F
b8C09   INC a3F
        LDA a3F
        BEQ b8BE2
        AND #$F0
        CMP #$D0
        BEQ b8BE2
        CMP #$F0
        BEQ b8BE2
        DEC a46
        BEQ b8C20
        JMP j8C50

b8C20   LDA a42
        BEQ j8C50
        LDA a45
        CMP #$FF
        BEQ b8C2E
        INC a40
        INC a40
b8C2E   DEC a40
        INC a43
        LDA a43
        AND #$03
        CLC 
        ADC #$E5
        STA a07F9
        LDA a43
        CMP #$04
        BNE b8C4C
        LDA #$00
        STA a43
        DEC a42
        BNE b8C4C
        INC a42
b8C4C   LDA a42
        STA a46
j8C50   LDA a3F
        STA a4461
        LDA a40
        STA a4469
        INC a4471
        RTS 

s8C5E   LDA a4A
        CMP #$01
        BEQ b8C65
        RTS 

b8C65   LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        LDA #$0F
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        LDA #$CC
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        LDA #<p7050
        STA a44C0
        LDA #>p7050
        STA a44C1
b8C87   RTS 

s8C88   DEC a4B
        BNE b8C87
        LDA #$06
        STA a4B
        LDA a4A
        CMP #$01
        BEQ b8C97
b8C96   RTS 

b8C97   LDA a44C0
        CMP a44C1
        BEQ b8CCC
        CMP #$50
        BNE b8CA8
        LDA #$21
        STA $D404    ;Voice 1: Control Register
b8CA8   INC a44C0
        LDA a44C0
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$00
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA a44C0
        CMP a44C1
        BNE b8C96
        LDA #$20
        STA $D404    ;Voice 1: Control Register
        LDA #$60
        STA a44C0
        STA a44C1
        RTS 

b8CCC   DEC a44C0
        DEC a44C1
        BNE b8CD5
        RTS 

b8CD5   LDA a44C0
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        RTS 

        LDX #$00
        LDA #$30
        STA a02
b8CE2   LDA #$50
        STA f4444,X
        LDA a02
        STA a4440,X
        STA a444C,X
        STA a4464,X
        LDA #$80
        STA f446C,X
        LDA #$C0
        STA f4450,X
        LDA #$01
        STA f4474,X
        STA f4448,X
        STA f4454,X
        LDA a02
        ADC #$10
        STA a02
        INX 
        CPX #$04
        BNE b8CE2
        RTS 

s8D13   LDA a27
        CLC 
        ADC a23
        ASL 
        ASL 
        STA a4E
        LDA a29
        PHA 
        LDY #$08
b8D21   LDA f5180,X
        CMP a29
        BEQ b8D37
        INC a29
        DEY 
        BNE b8D21
        LDA #$F0
        STA a4F
        STA f5200,X
        JMP j8D55

b8D37   DEY 
        TYA 
        EOR #$07
        ASL 
        ASL 
        ASL 
        ASL 
        ASL 
        CLC 
        ADC f5190,X
        SEC 
        SBC a4E
        STA a4F
        LDA a21
        CLC 
        ROR 
        CLC 
        ADC a4F
        STA a4F
        STA f5200,X
j8D55   PLA 
        STA a29
        TXA 
        AND #$0C
        BNE b8D63
        LDA a4F
        STA a4440,X
        RTS 

b8D63   TXA 
        AND #$08
        BNE b8D6E
        LDA a4F
        STA a4460,X
        RTS 

b8D6E   LDA a4F
        STA f4444,X
b8D73   RTS 

j8D74   LDX #$04
        LDA a41F7
        BNE b8D73
b8D7B   JSR s8D13
        INX 
        CPX #$08
        BNE b8D7B
        RTS 

j8D84   LDX #$08
        LDA a41F7
        BNE b8D73
b8D8B   JSR s8D13
        INX 
        CPX #$0C
        BNE b8D8B
        RTS 

j8D94   LDX #$00
        LDA a41F7
        BNE b8D73
b8D9B   JSR s8D13
        INX 
        CPX #$04
        BNE b8D9B
b8DA3   RTS 

s8DA4   DEC a51
        BNE b8DA3
        LDA #$06
        STA a51
        JSR s71A5
        LDA a56
        CMP #$01
        BEQ b8DA3
        LDX #$00
b8DB7   LDA f5000,X
        BEQ b8DBF
        JSR s8DCB
b8DBF   JSR s8FC7
        JSR s8E1E
        INX 
        CPX #$0C
        BNE b8DB7
b8DCA   RTS 

s8DCB   DEC f51C0,X
        BNE b8DCA
        LDA f5000,X
        CMP #$06
        BNE b8DDA
        JMP j9C91

b8DDA   LDA f5010,X
        STA f51C0,X
        LDA f51D0,X
        BEQ b8DED
        LDA f51B0,X
        CMP f5030,X
        BEQ b8DF5
b8DED   LDA f51B0,X
        CMP f5020,X
        BNE b8E0B
b8DF5   LDA f51D0,X
        BEQ b8E02
        EOR #$FF
        STA f51D0,X
        JMP b8E0B

b8E02   LDA f5030,X
        STA f51B0,X
        DEC f51B0,X
b8E0B   LDA f51D0,X
        CMP #$F0
        BEQ b8E18
        INC f51B0,X
        INC f51B0,X
b8E18   DEC f51B0,X
        JMP j9104

s8E1E   TXA 
        AND #$0C
        BNE b8E30
        LDA f51A0,X
        STA f4444,X
        LDA f51B0,X
        STA a4480,X
        RTS 

b8E30   TXA 
        AND #$08
        BNE b8E42
        LDA f51A0,X
        STA a4468,X
        LDA f51B0,X
        STA a4484,X
        RTS 

b8E42   LDA f51A0,X
        STA f4448,X
        LDA f51B0,X
        STA f447C,X
b8E4E   RTS 

s8E4F   LDX #<f5000
        STX a02
        LDA #>f5000
        STA a03
        LDX a06
        JSR s949C
        BNE b8E4E
        LDX #$00
b8E60   TXA 
        TAY 
        LDA (p04),Y
        LDY a06
        STA (p02),Y
        LDA a02
        CLC 
        ADC #$10
        STA a02
        LDA a03
        ADC #$00
        STA a03
        INX 
        CPX #$20
        BNE b8E60
        LDA #$01
        STA f51C0,Y
        LDA #$00
        RTS 

s8E82   LDX #$00
        TXA 
b8E85   STA f5000,X
        STA f5100,X
        INX 
        BNE b8E85
        LDA #$C0
        LDX #$00
b8E92   STA a4480,X
        STA a4484,X
        STA a4488,X
        INX 
        CPX #$04
        BNE b8E92
        RTS 

j8EA1   LDX #$00
b8EA3   LDA f5000,X
        BNE b8EB5
        LDA a5D
        BEQ b8EB5
        TXA 
        PHA 
        JSR s8EBB
        DEC a5D
        PLA 
        TAX 
b8EB5   INX 
        CPX #$0C
        BNE b8EA3
        RTS 

s8EBB   STX a06
        JSR s96AD
        LDA f5000,X
        CMP #$03
        BEQ b8ECB
        CMP #$04
        BNE b8EE1
b8ECB   LDA f5030,X
        STA f51B0,X
        LDA f51D0,X
        CMP #$F0
        BNE b8EDE
        LDA f5020,X
        STA f51B0,X
b8EDE   JMP j8EF3

b8EE1   STA f50E0,X
        LDA #$06
        STA f5000,X
        LDA #$F0
        STA f51B0,X
        LDA #$0C
        STA f51C0,X
j8EF3   JSR s8747
        AND #$3F
        ADC a29
        SBC #$10
        STA f5180,X
        NOP 
        TXA 
        AND #$0C
        BNE b8F29
        LDA f5090,X
        STA f4448,X
        LDA f5030,X
        STA f5120,X
        LDA f51A0,X
        BNE b8F21
        JSR s8747
        AND #$0F
        CLC 
        ADC #$4D
        STA f51A0,X
b8F21   LDA #$01
        STA f5040,X
        JMP j8F73

b8F29   TXA 
        AND #$08
        BNE b8F52
        LDA f5090,X
        STA a4470,X
        LDA f5030,X
        STA f5120,X
        LDA f51A0,X
        BNE b8F4A
        JSR s8747
        AND #$0F
        CLC 
        ADC #$81
        STA f51A0,X
b8F4A   LDA #$02
        STA f5040,X
        JMP j8F73

b8F52   LDA f5090,X
        STA a444C,X
        LDA f5030,X
        STA f5120,X
        LDA f51A0,X
        BNE b8F6E
        JSR s8747
        AND #$0F
        CLC 
        ADC #$BE
        STA f51A0,X
b8F6E   LDA #$03
        STA f5040,X
j8F73   LDA f5130,X
        BEQ b8F80
        JSR s8747
        AND #$7F
        STA f5050,X
b8F80   LDA f5100,X
        BEQ b8F92
        JSR s8747
        AND #$07
        ADC #$01
        STA f50C0,X
        STA f51E0,X
b8F92   LDA f5110,X
        BEQ b8FA4
        JSR s8747
        AND #$07
        ADC #$01
        STA f50D0,X
        STA f51F0,X
b8FA4   LDA f5140,X
        AND #$01
        BEQ b8FB5
        JSR s8747
        AND #$03
        ORA #$01
        STA f50A0,X
b8FB5   LDA f5140,X
        AND #$02
        BEQ b8FC6
        JSR s8747
        AND #$03
        ORA #$01
        STA f50B0,X
b8FC6   RTS 

s8FC7   LDA f5000,X
        BNE b8FCF
        JMP j96C6

b8FCF   CMP #$01
        BEQ b8FD6
        JMP j9128

b8FD6   LDA f50A0,X
        AND #$01
        BEQ b901D
        DEC f51E0,X
        BNE b901D
        LDA f50C0,X
        STA f51E0,X
        JSR s8FEE
        JMP b901D

s8FEE   LDA f50A0,X
        AND #$02
        BEQ b900A
        INC f5190,X
        LDA f5190,X
        CMP #$20
        BNE p901C
        LDA #$00
        STA f5190,X
        INC f5180,X
        JMP p901C

b900A   DEC f5190,X
        LDA f5190,X
        CMP #$FF
        BNE p901C
        LDA #$1F
        STA f5190,X
        DEC f5180,X
p901C   RTS 

b901D   LDA f50B0,X
        AND #$01
        BEQ b9075
        DEC f51F0,X
        BNE b9075
        LDA f50D0,X
        STA f51F0,X
        JSR s9035
        JMP b9075

s9035   LDA f50B0,X
        AND #$02
        BEQ b9058
        LDY f5040,X
        DEC f51A0,X
        LDA f51A0,X
        CMP f9076,Y
        BNE b9074
        INC f51A0,X
        LDA f50B0,X
        EOR #$02
        STA f50B0,X
        JMP s9035

b9058   LDY f5040,X
        INC f51A0,X
        LDA f51A0,X
        CMP f907A,Y
        BNE b9074
        DEC f51A0,X
        LDA f50B0,X
        EOR #$02
        STA f50B0,X
        JMP s9035

b9074   RTS 

b9075   RTS 

f9076   .BYTE $00,$4C,$80,$BD
f907A   .BYTE $00,$5E,$9E,$D2
s907E   LDY #$00
        STA a04
        STY a05
        JSR s909B
        JSR s909B
        JSR s909B
        JSR s909B
        JSR s909B
        LDA a05
        CLC 
        ADC #$58
        STA a05
        RTS 

s909B   CLC 
        LDA a04
        ASL 
        STA a04
        LDA a05
        ROL 
        STA a05
        RTS 

j90A7   LDA #>f5000
        STA a03
        LDA #<f5000
        STA a02
        LDX #$00
b90B1   TXA 
        TAY 
        LDA (p04),Y
        LDY a06
        STA (p02),Y
        LDA a02
        CLC 
        ADC #$10
        STA a02
        LDA a03
        ADC #$00
        STA a03
        INX 
        CPX #$18
        BNE b90B1
        LDX a06
        JSR j8F73
        LDA f5030,X
        STA f51B0,X
        TXA 
        AND #$0C
        BNE b90E7
        LDA #$01
        STA f5040,X
        LDA f5090,X
        STA f4448,X
        RTS 

b90E7   TXA 
        AND #$08
        BNE b90F8
        LDA #$02
        STA f5040,X
        LDA f5090,X
        STA a4470,X
        RTS 

b90F8   LDA #$03
        STA f5040,X
        LDA f5090,X
        STA a444C,X
b9103   RTS 

j9104   LDA f5050,X
        BEQ b9103
        DEC f5050,X
        BNE b9103
s910E   LDA f5060,X
s9111   CMP #$FF
        BEQ b911D
        STX a06
        JSR s907E
        JMP j90A7

b911D   LDA #$00
        STA f51A0,X
        JSR s9B72
        JMP s8EBB

j9128   CMP #$02
        BEQ b912F
        JMP j9360

b912F   LDA f50D0,X
        BEQ b9142
        DEC f51F0,X
        BNE b9142
        LDA f50D0,X
        STA f51F0,X
        JSR s9035
b9142   LDA f51E0,X
        AND #$80
        STA a05
        DEC f51E0,X
        LDA f51E0,X
        ORA a05
        STA f51E0,X
        AND #$7F
        BEQ b9159
        RTS 

b9159   LDA f50A0,X
        BEQ b9161
        JMP j91AF

b9161   LDA f51E0,X
        AND #$80
        BNE b918F
        DEC f50C0,X
        BEQ b9184
j916D   LDA f50C0,X
        STA f51E0,X
j9173   LDA f50A0,X
        PHA 
        LDA #$00
        STA f50A0,X
        JSR s9209
        PLA 
        STA f50A0,X
        RTS 

b9184   LDA #$01
        STA f50C0,X
        JSR s91E9
        JMP j916D

b918F   INC f50C0,X
        LDA f50C0,X
        CMP #$0A
        BEQ j916D
        ORA #$80
        STA f51E0,X
        LDA f50A0,X
        PHA 
        LDA #$02
        STA f50A0,X
        JSR s9209
        PLA 
        STA f50A0,X
        RTS 

j91AF   LDA f51E0,X
        BEQ b91D8
        DEC f50C0,X
        BNE b91BF
        INC f50C0,X
        JSR s91E9
b91BF   LDA f50C0,X
b91C2   ORA #$80
        STA f51E0,X
        LDA f50A0,X
        PHA 
        LDA #$02
        STA f50A0,X
        JSR s9209
        PLA 
        STA f50A0,X
        RTS 

b91D8   INC f50C0,X
        LDA f50C0,X
        CMP #$0A
        BEQ b91C2
        STA f51E0,X
        JMP j9173

b91E8   RTS 

s91E9   LDA f5180,X
        CMP a50
        BPL b9201
        LDA f50A0,X
        BNE b91E8
j91F5   LDA f50C0,X
        PHA 
        JSR s910E
        PLA 
        STA f50C0,X
        RTS 

b9201   LDA f50A0,X
        BEQ b91E8
        JMP j91F5

s9209   LDA f5080,X
        STA a04
b920E   JSR s8FEE
        DEC a04
        BNE b920E
        RTS 

s9216   LDA #$01
        STA a5B
        LDA #$00
        STA a58
        LDX #$00
b9220   LDA f9263,X
        AND #$3F
        STA a5A
        LDA #$00
        STA a59
        JSR s804D
        LDA f928B,X
        AND #$3F
        STA a5A
        INC a59
        JSR s804D
        LDA #$17
        STA a59
        JSR s804D
        LDA f92B3,X
        AND #$3F
        STA a5A
        INC a59
        JSR s804D
        INC a58
        INX 
        CPX #$28
        BNE b9220
s9254   LDA #$08
        STA aDB99
        STA aDBBE
        STA aD829
        STA aD84E
        RTS 

f9263   .TEXT " SCORE 1\\0000000      SCORE 2\\0000000 "
f928B   .TEXT " ! $%&' 00 !!!!!!PROXIM",$22,$22,$22,$22,$22,$22," ()*+,-0 ",$22," "
f92B3   .TEXT " SHIELDS 6\\\SHEEP 4\\\STOMACH FULL     "
s92DB   LDA a445A
        ORA a4458
        ORA a4459
        AND #$02
        BNE b92E9
        RTS 

b92E9   LDX #$00
b92EB   LDA f5000,X
        BEQ b930C
        LDA f5200,X
        CMP #$F0
        BEQ b930C
        SEC 
        SBC a3F
        STA a05
        AND #$80
        BEQ b9306
        LDA a05
        EOR #$FF
        STA a05
b9306   LDA a05
        CMP #$0C
        BMI b9312
b930C   INX 
        CPX #$0C
        BNE b92EB
        RTS 

b9312   LDA f51A0,X
        SEC 
        SBC a40
        STA a05
        AND #$80
        BEQ b9324
        LDA a05
        EOR #$FF
        STA a05
b9324   LDA a05
        CMP #$10
        BPL b930C
        LDA f5160,X
        BEQ b930C
        PLA 
        PLA 
        JSR b8BE2
        LDA #$00
        STA a4461
        JSR s9254
        LDA #$C0
        STA a07F9
j9341   JSR s9E29
        LDA f5190,X
        ADC #$04
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$04
        STA a4C
        LDA #$81
        STA $D412    ;Voice 3: Control Register
        LDA #$00
        STA f51D0,X
        LDA f5160,X
        JMP j9E0A

j9360   CMP #$03
        BEQ b9367
        JMP j94E0

b9367   LDA f5080,X
        BNE b938D
        LDA #$04
        STA f51E0,X
        LDA #$CC
        STA f51A0,X
        INC f5080,X
        JSR s8747
        AND #$07
        TAY 
        LDA f4408,Y
        STA f5180,X
        LDA #$15
        STA f5190,X
b938A   JMP j94C5

b938D   CMP #$01
        BNE b93A6
        DEC f51F0,X
        BNE b938A
        DEC f51E0,X
        BNE b938A
        INC f5080,X
        LDA #$18
        STA f51E0,X
        JMP b938A

b93A6   CMP #$02
        BNE b93C5
        LDA #$00
        STA f50A0,X
        JSR s8FEE
        LDA #$02
        STA f50B0,X
        JSR s9035
        DEC f51E0,X
        BNE b938A
        INC f5080,X
        JMP b938A

b93C5   CMP #$03
        BNE b93F1
        LDA #$00
        STA f50A0,X
        LDA a4421
        CMP f5180,X
        BNE b93E1
        INC f5080,X
        LDA #$18
        STA f51E0,X
        JMP b938A

b93E1   BMI b93E8
        LDA #$02
        STA f50A0,X
b93E8   JSR s8FEE
        JSR s8FEE
        JMP b938A

b93F1   CMP #$04
        BNE b940D
        LDA #$00
        STA f50B0,X
        JSR s9035
        DEC f51E0,X
        BNE b938A
        INC f5080,X
        LDA #$18
        STA f51E0,X
b940A   JMP b938A

b940D   CMP #$05
        BNE b9427
        INC a444C,X
        LDA #$02
        STA f50B0,X
        JSR s9035
        DEC f51E0,X
        BNE b940A
        INC f5080,X
        JMP b938A

b9427   CMP #$06
        BNE b9456
        INC a444C,X
        LDA #$00
        STA f50A0,X
        LDA f5180,X
        CMP a4422
        BNE b9446
        INC f5080,X
        LDA #$18
        STA f51E0,X
b9443   JMP b938A

b9446   BPL b944D
        LDA #$02
        STA f50A0,X
b944D   JSR s8FEE
        JSR s8FEE
        JMP b938A

b9456   LDA #$00
        STA f50B0,X
        INC a444C,X
        JSR s9035
        DEC f51E0,X
        BNE b9443
        LDA #$02
        STA f5080,X
        LDA f5090,X
        STA a444C,X
j9471   INC a07BC
        LDA a07BC
        CMP #$36
        BNE b948A
        DEC a07BC
        JSR s9B6D
        JSR s9B2E
        JSR s9E02
        JMP j95F7

b948A   CMP #$35
        BNE b9498
        LDA a044C
        CMP #$35
        BNE b9498
        JSR s98E5
b9498   JMP b938A

b949B   RTS 

s949C   LDY #$04
        LDA (p04),Y
        PHA 
        BEQ b94C3
        TXA 
        AND #$0C
        BNE b94AF
        PLA 
        CMP #$01
        BNE b949B
        BEQ b94C0
b94AF   TXA 
        AND #$08
        BNE b94BB
        PLA 
        CMP #$02
        BNE b949B
        BEQ b94C0
b94BB   PLA 
        CMP #$03
        BNE b949B
b94C0   LDA #$00
        RTS 

b94C3   PLA 
        RTS 

j94C5   LDA #$08
        STA aDB99
        STA aDBBE
        LDA f5180,X
        CMP a50
        BPL b94DA
        LDA #$0D
        STA aDB99
        RTS 

b94DA   LDA #$0D
        STA aDBBE
        RTS 

j94E0   CMP #$04
        BEQ b94E7
        JMP j7535

b94E7   LDA f5080,X
        BNE b950D
        JSR s8747
        AND #$07
        TAY 
        LDA f4400,Y
        STA f5180,X
        LDA #$15
        STA f5190,X
        LDA #$4D
        STA f51A0,X
        LDA #$04
        STA f51E0,X
        INC f5080,X
b950A   JMP j961E

b950D   CMP #$01
        BNE b9526
        DEC f51F0,X
        BNE b950A
        DEC f51E0,X
        BNE b950A
        LDA #$0F
        STA f51E0,X
        INC f5080,X
b9523   JMP j961E

b9526   CMP #$02
        BNE b9545
        LDA #$02
        STA f50A0,X
        JSR s8FEE
        LDA #$00
        STA f50B0,X
        JSR s9035
        DEC f51E0,X
        BNE b9523
        INC f5080,X
b9542   JMP j961E

b9545   CMP #$03
        BNE b9574
        LDA #$00
        STA f50A0,X
        LDA a4420
        CMP f5180,X
        BMI b955B
        LDA #$02
        STA f50A0,X
b955B   JSR s8FEE
        JSR s8FEE
        LDA f5180,X
        CMP a4420
        BNE b9542
        INC f5080,X
        LDA #$0F
        STA f51E0,X
b9571   JMP j961E

b9574   CMP #$04
        BNE b9590
        LDA #$02
        STA f50B0,X
        JSR s9035
        DEC f51E0,X
        BNE b9571
        LDA #$0F
        STA f51E0,X
        INC f5080,X
b958D   JMP j961E

b9590   CMP #$05
        BNE b95AA
        LDA #$00
        STA f50B0,X
        JSR s9035
        INC f4448,X
        DEC f51E0,X
        BNE b958D
        INC f5080,X
b95A7   JMP j961E

b95AA   CMP #$06
        BNE b95DC
        LDA #$00
        STA f50A0,X
        LDA f5180,X
        CMP a4422
        BPL b95C0
        LDA #$02
        STA f50A0,X
b95C0   JSR s8FEE
        JSR s8FEE
        INC f4448,X
        LDA f5180,X
        CMP a4422
        BNE b95A7
        LDA #$0F
        STA f51E0,X
        INC f5080,X
b95D9   JMP j961E

b95DC   LDA #$02
        STA f50B0,X
        JSR s9035
        INC f4448,X
        DEC f51E0,X
        BNE b95D9
        LDA f5090,X
        STA f4448,X
        LDA #$02
        STA f5080,X
j95F7   INC a044C
        LDA a044C
        CMP #$36
        BNE b9610
        DEC a044C
        JSR s9B6D
        JSR s9B2E
        JSR s9E02
        JMP j9471

b9610   CMP #$35
        BNE j961E
        LDA a07BC
        CMP #$35
        BNE j961E
        JSR s98E5
j961E   LDA #$08
        STA aD829
        STA aD84E
        LDA f5180,X
        CMP a50
        BMI b9633
        LDA #$0D
        STA aD84E
        RTS 

b9633   LDA #$0D
        STA aD829
        RTS 

s9639   LDY a52
        LDA a29
        CLC 
        ADC f9689,Y
        LDX #$00
b9643   CMP f5180,X
        BEQ b9654
b9648   INX 
        CPX #$0C
        BNE b9643
        LDA #$08
        STA a04
        JMP j9660

b9654   LDA f5000,X
        BEQ b9648
        LDA f5090,X
        ORA #$08
        STA a04
j9660   LDA #>pD833
        STA a03
        LDA #<pD833
        STA a02
        LDA f9695,Y
        TAY 
        LDA a04
        STA (p02),Y
        LDA #>pDBA3
        STA a03
        LDA #<pDBA3
        STA a02
        LDA a04
        STA (p02),Y
        INC a52
        LDA a52
        CMP #$0C
        BNE b9688
        LDA #$00
        STA a52
b9688   RTS 

f9689   .BYTE $FA,$FB,$FC,$FD,$FE,$FF,$05,$06
        .BYTE $07,$08,$09,$0A
f9695   .BYTE $00,$01,$02,$03,$04,$05,$0C,$0D
        .BYTE $0E,$0F,$10,$11,$0A,$0C,$0D,$0B
        .BYTE $0F,$09,$09,$0F,$0B,$0D,$0C,$0A
s96AD   INC a53
        LDA a53
        CMP a4C71
        BNE b96BB
        LDA a4C70
        STA a53
b96BB   JSR s907E
        JSR s8E4F
        BNE s96AD
        LDX a06
        RTS 

j96C6   LDY #$40
b96C8   DEY 
        BNE b96C8
        RTS 

s96CC   LDA #$00
        STA a55
        TAX 
b96D1   STA f5400,X
        INX 
        BNE b96D1
        LDA #$80
        STA $D412    ;Voice 3: Control Register
        LDA #$03
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$01
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA #$0A
        STA $D407    ;Voice 2: Frequency Control - Low-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        LDA #$0F
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        LDA #$F7
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        RTS 

s9709   LDA a56
        CMP #$02
        BNE b9712
        JMP j98FF

b9712   LDA $D41B    ;Oscillator 3 Output
        TAX 
j9716   LDA f5400,X
        BEQ b971F
        INX 
        JMP j9716

b971F   INC a55
        LDA #$FF
        JSR s976A
        LDA a55
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        BEQ b973E
        CMP #$E0
        BNE b9739
        LDA #$20
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
b9739   LDA #$F7
        STA a38
        RTS 

b973E   STA a56
        LDA #$F5
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA #$72
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        LDA a57
        BNE b9769
        JMP j7A93

InitCharset
        LDX #$00
        TXA 
b9754   STA f2200,X
        STA f2300,X
        STA f2400,X
        STA f2500,X
        STA f2600,X
        STA f2700,X
        INX 
        BNE b9754
b9769   RTS 

s976A   STA f5400,X
        LDA f6000,X
        STA f2200,X
        LDA f6100,X
        STA f2300,X
        LDA f6200,X
        STA f2400,X
        LDA f6300,X
        STA f2500,X
        LDA f6400,X
        STA f2600,X
        LDA f6500,X
        STA f2700,X
        RTS 

s9792   LDA #$ED
        STA a07FA
        STA a07FB
        LDX #$02
b979C   LDA #$00
        STA a4469,X
        LDA #$F0
        STA a4461,X
        STA f4BFF,X
        LDA #<p1810
        STA a4C04
        LDA #>p1810
        STA a4C05
        LDA #$01
        STA a4471,X
        DEX 
        BNE b979C
        LDA #$10
        STA a4C06
b97C0   RTS 

s97C1   DEC a4C06
        BNE b97C0
        LDA #$20
        STA a4C06
        LDX #$00
b97CD   JSR s9859
        JSR s9866
        INX 
        CPX #$02
        BNE b97CD
b97D8   RTS 

j97D9   LDA f4C00,X
        CMP #$F0
        BNE b97D8
        LDA a56
        BNE b97D8
        JSR s8747
        AND #$07
        STA a03
        TAY 
        INY 
b97ED   LDA f5200,Y
        CMP #$F0
        BNE b9800
        INY 
        CPY #$0C
        BNE b97FB
        LDY #$00
b97FB   CPY a03
        BNE b97ED
b97FF   RTS 

b9800   LDA f5000,Y
        BEQ b97FF
        LDA f5070,Y
        BNE b97FF
        LDA f5200,Y
        STA f4C00,X
        LDA f51A0,Y
        STA f4C02,X
        SEC 
        SBC a30
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        STA f4C12,X
        LDA f4C00,X
        SEC 
        SBC a2F
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        STA f4C10,X
        AND #$03
        BNE b9858
        LDA f4C12,X
        AND #$03
        BNE b9858
        JSR s8747
        AND #$07
        ORA #$01
        STA f4C12,X
        JSR s8747
        AND #$07
        ORA #$01
        STA f4C10,X
b9858   RTS 

s9859   DEC a4C04,X
        BNE b9858
        LDA #$10
        STA a4C04,X
        JMP j97D9

s9866   LDA f4C00,X
        CMP #$F0
        BNE b986E
        RTS 

b986E   LDA #$ED
        STA a07FA,X
        LDA f4C10,X
        AND #$04
        BNE b9887
        LDA f4C00,X
        SEC 
        SBC f4C10,X
        STA f4C00,X
        JMP j9893

b9887   LDA f4C10,X
        AND #$03
        CLC 
        ADC f4C00,X
        STA f4C00,X
j9893   LDA f4C12,X
        AND #$04
        BNE b98A7
        LDA f4C02,X
        SEC 
        SBC f4C12,X
        STA f4C02,X
        JMP j98B1

b98A7   LDA f4C12,X
        CLC 
        ADC f4C02,X
        STA f4C02,X
j98B1   LDA f4C00,X
        AND #$F0
        CMP #$F0
        BEQ b98D8
        CMP #$D0
        BEQ b98D8
        LDA f4C02,X
        AND #$F0
        CMP #$E0
        BEQ b98D8
        CMP #$30
        BEQ b98D8
j98CB   LDA f4C00,X
        STA a4462,X
        LDA f4C02,X
        STA a446A,X
        RTS 

b98D8   LDA #$00
        STA f4C02,X
        LDA #$F0
        STA f4C00,X
        JMP j98CB

s98E5   JSR s96CC
        LDA #$02
        STA a4D00
        STA a4D01
        STA a56
        LDA #$01
        STA a4D02
        LDA #$F5
        STA $D417    ;Filter Resonance Control / Voice Input Control
        JMP j99B0

j98FF   LDA a4D00
        CMP #$02
        BNE b9930
        LDY $D41B    ;Oscillator 3 Output
j9909   LDA f5400,Y
        BEQ b9912
        INY 
        JMP j9909

b9912   LDA #$06
        STA a04
        STA f5400,Y
        LDA #>f2200
        STA a03
        LDA #<f2200
        STA a02
b9921   LDA (p02),Y
        AND #$CC
        STA (p02),Y
        INC a03
        DEC a04
        BNE b9921
        JMP j9957

b9930   LDY $D41B    ;Oscillator 3 Output
j9933   LDA f5400,Y
        BNE b993C
        INY 
        JMP j9933

b993C   LDA #$00
        STA f5400,Y
        LDA #>p0622
        STA a04
        LDA #<p0622
        STA a03
        LDA #$00
        STA a02
b994D   LDA #$00
        STA (p02),Y
        INC a03
        DEC a04
        BNE b994D
j9957   DEC a4D01
        BNE b9989
        JSR s8747
        AND #$04
        ADC #$02
        STA a4D01
b9966   LDA #$04
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        INC a4470
        LDA a55
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        LDA a38
        ORA #$F0
        STA a38
        LDA #$80
        ORA a4D02
        STA $D412    ;Voice 3: Control Register
        LDA a4D02
        EOR #$01
b9988   =*+$02
        STA a4D02
b998A   =*+$01
b9989   LDA a4D00
        CMP #$01
        BEQ b9994
        INC a55
        INC a55
b9994   DEC a55
        BEQ b9999
b9998   RTS 

b9999   DEC a4D00
        BNE b9998
        LDA #$80
        STA $D412    ;Voice 3: Control Register
        LDA #$01
        STA a4470
        JSR s99EC
b99AC   =*+$01
        LDA #$00
        JMP b973E

j99B0   LDX #$00
b99B2   LDA #$00
        STX a06
        JSR s907E
        JSR j90A7
        LDX a06
        INX 
        CPX #$0C
        BNE b99B2
        LDX #$00
b99C5   LDA a4422
        STA f5180,X
        LDA #$15
        STA f5190,X
        LDA f99E1,X
        STA f51A0,X
        INX 
        CPX #$0C
        BNE b99C5
        LDX #$F8
        TXS 
        JMP j865A

f99E1   BVC b9A33
        RTS 

        BVS b9966
        BCC b9988
        BCC b998A
        BCS b99AC
s99EC   LDX #$00
b99EE   LDA f9A48,X
        STA f4C30,X
        JSR s8747
        AND #$1F
        ADC #$04
        STA f4C20,X
        JSR s8747
        AND #$07
        ORA #$01
        STA f4C50,X
        STA f4C40,X
        LDA #$00
        STA f4C60,X
        INX 
        CPX #$10
        BNE b99EE
        LDA #$01
        JSR s7590
        STA a57
s9A1C   SEI 
        LDA #$00
        STA a56
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        LDA #>p2002
        STA a5A
        LDA #<p2002
        STA a59
b9A2F   LDA #$00
        STA a58
b9A33   JSR s804D
        INC a58
        LDA a58
        CMP #$28
        BNE b9A33
        INC a59
        LDA a59
        CMP #$17
        BNE b9A2F
        CLI 
        RTS 

f9A48   .BYTE $02,$04,$05,$07,$09,$0A,$0C,$0D
        .BYTE $0F,$10,$12,$13,$15,$16,$06,$0B
j9A58   LDX #$00
b9A5A   DEC f4C50,X
        BNE b9A62
        JSR s9A76
b9A62   INX 
        CPX #$10
        BNE b9A5A
        INC a27
        LDA a27
        CMP #$08
        BNE b9A75
        LDA #$00
        STA a27
        INC a29
b9A75   RTS 

s9A76   LDA f4C40,X
        STA f4C50,X
        DEC f4C60,X
        LDA f4C60,X
        CMP #$FF
        BNE b9AB5
        LDA #$03
        STA f4C60,X
        LDA f4C20,X
        STA a58
        LDA f4C30,X
        STA a59
        LDA #$20
        STA a5A
        JSR s804D
        DEC f4C20,X
        LDA f4C20,X
        CMP #$FF
        BNE b9AB5
        LDA #$27
        STA f4C20,X
        JSR s8747
        AND #$03
        ORA #$01
        STA f4C40,X
b9AB5   LDA #$01
        STA a5B
        LDA f4C20,X
        STA a58
        LDA f4C30,X
        STA a59
        LDA #$3A
        CLC 
        ADC f4C60,X
        STA a5A
        JMP s804D

j9ACE   LDX #$00
b9AD0   DEC f4C50,X
        BNE b9AD8
        JSR s9AEC
b9AD8   INX 
        CPX #$10
        BNE b9AD0
        DEC a27
        LDA a27
        CMP #$FF
        BNE b9AEB
        LDA #$07
        STA a27
        DEC a29
b9AEB   RTS 

s9AEC   LDA f4C40,X
        STA f4C50,X
        INC f4C60,X
        LDA f4C60,X
        CMP #$04
        BNE b9AB5
        LDA #$00
        STA f4C60,X
        LDA f4C20,X
        STA a58
        LDA f4C30,X
        STA a59
        LDA #$20
        STA a5A
        JSR s804D
        INC f4C20,X
        LDA f4C20,X
        CMP #$28
        BNE b9AB5
        LDA #$00
        STA f4C20,X
        JSR s8747
        AND #$03
        ORA #$01
        STA f4C40,X
        JMP b9AB5

s9B2E   LDA a5C
        CMP #$64
        BNE b9B36
        DEC a5C
b9B36   LDA #$30
        STA a0430
        STA a0431
        STA a07A0
        STA a07A1
        LDY a5C
        CPY #$00
        BNE b9B4B
        RTS 

b9B4B   INC a0431
        LDA a0431
        CMP #$3A
        BNE b9B5D
        LDA #$30
        STA a0431
        INC a0430
b9B5D   DEY 
        BNE b9B4B
        LDA a0430
        STA a07A0
        LDA a0431
        STA a07A1
        RTS 

s9B6D   INC a5D
        INC a5C
        RTS 

s9B72   DEC a5C
        JSR s9B2E
        LDA a5C
        BNE b9B7E
        JMP j9E8F

b9B7E   LDA a5D
        BEQ b9B85
        DEC a5D
        RTS 

b9B85   LDA #$00
        STA f5000,X
        LDA #$01
        STA f5070,X
        LDA #$C0
        STA f51B0,X
        PLA 
        PLA 
b9B96   RTS 

s9B97   LDA a5E
        BNE b9BA3
        LDA #$01
        STA a4470
        JMP j9BAA

b9BA3   LDA a5E
        STA a4470
        DEC a5E
j9BAA   LDA a56
        BEQ b9BAF
        RTS 

b9BAF   LDA a445A
        ORA a4458
        ORA a4459
        AND #$03
        CMP #$01
        BNE b9B96
        LDX #$00
b9BC0   LDA a2F
        SEC 
        SBC f5200,X
        STA a06
        AND #$80
        BEQ b9BD2
        LDA a06
        EOR #$FF
        STA a06
b9BD2   LDA a06
        CMP #$10
        BMI b9BE0
b9BD8   INX 
        CPX #$0C
        BNE b9BC0
        JMP j9C31

b9BE0   LDA a30
        SEC 
        SBC f51A0,X
        STA a06
        BEQ b9BD8
        AND #$80
        BEQ b9BF4
        LDA a06
        EOR #$FF
        STA a06
b9BF4   LDA a06
        CMP #$10
        BPL b9BD8
        LDA f5150,X
        BEQ b9BD8
        LDA f5000,X
        BEQ b9BD8
        CMP #$06
        BEQ b9BD8
        LDA a07C9
        CMP #$30
        BNE b9C12
        JMP j9CAD

b9C12   DEC a07C9
        LDA #$80
        STA $D412    ;Voice 3: Control Register
        LDA #$20
        STA a5E
        LDA #$04
        STA a4C
        JSR s9254
        JSR s8580
        LDA a23
        EOR #$01
        STA a23
        JMP j9341

j9C31   LDX #$00
b9C33   LDA a2F
        SEC 
        SBC f4C00,X
        STA a06
        AND #$80
        BEQ b9C45
        LDA a06
        EOR #$FF
        STA a06
b9C45   LDA a06
        CMP #$0C
        BMI b9C51
b9C4B   INX 
        CPX #$02
        BNE b9C33
        RTS 

b9C51   LDA a30
        SEC 
        SBC f4C02,X
        STA a06
        AND #$80
        BEQ b9C63
        LDA a06
        EOR #$FF
        STA a06
b9C63   LDA a06
        CMP #$10
        BPL b9C4B
        LDA a07C9
        CMP #$30
        BNE b9C73
        JMP j9CAD

b9C73   DEC a07C9
        LDA #$80
        STA $D412    ;Voice 3: Control Register
        LDA a2F
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        JSR b98D8
        LDA #$81
        STA $D412    ;Voice 3: Control Register
        LDA #$20
        STA a5E
        LDA #$04
        STA a4C
b9C90   RTS 

j9C91   LDA #$0C
        STA f51C0,X
        INC f51B0,X
        LDA f51B0,X
        CMP #$F6
        BNE b9C90
        LDA f5120,X
        STA f51B0,X
        LDA f50E0,X
        STA f5000,X
        RTS 

j9CAD   LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        LDA #$01
        STA $D015    ;Sprite display Enable
        JSR b8BE2
        LDA #$F7
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA #$00
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        STA a02
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA #$21
        STA $D404    ;Voice 1: Control Register
b9CD7   LDX #$00
b9CD9   STX $D401    ;Voice 1: Frequency Control - High-Byte
        LDY #$02
b9CDE   DEY 
        BNE b9CDE
        INX 
        BNE b9CD9
        INC $D022    ;Background Color 1, Multi-Color Register 0
        INC a4470
        INC a02
        LDA a02
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        LDA a07F8
        CMP #$E1
        BNE b9D00
        LDA #$E0
        STA a07F8
        JMP j9D05

b9D00   LDA #$E1
        STA a07F8
j9D05   LDA a02
        BNE b9CD7
        LDA #$09
        STA $D022    ;Background Color 1, Multi-Color Register 0
        LDA #$60
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        LDA #$01
        STA a4470
j9D1D   INC a07F8
        LDA a07F8
        CMP #$E5
        BEQ b9D3C
        LDA #$08
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        LDX #$12
b9D33   DEY 
        BNE b9D33
        DEX 
        BNE b9D33
        JMP j9D1D

b9D3C   LDA #$C0
        STA a07F8
        LDA a57
        BEQ b9D5E
        LDA #$00
        STA a57
        JSR s9A1C
        LDA a41F6
        CMP #$02
        BEQ b9D5B
        LDA #$FF
        STA a4C72
        JMP b9D5E

b9D5B   JSR s7487
b9D5E   LDA #$00
        STA a57
        STA a24
        JSR InitCharset
        LDA #$0C
        STA a59
        LDA #$01
        STA a5B
        LDA #$0C
        STA a58
        LDX #$00
b9D75   LDA f9DD5,X
        AND #$3F
        STA a5A
        JSR s804D
        INC a58
        INX 
        CPX #$12
        BNE b9D75
        LDA #$80
        STA $D404    ;Voice 1: Control Register
        LDA #$02
        STA a02
b9D8F   DEX 
        BNE b9D8F
        DEY 
        BNE b9D8F
        DEC a02
        BNE b9D8F
        JSR s9DE7
        JSR s8747
        STA a29
        LDX #$F8
        TXS 
        LDA #$36
        STA a07C9
        DEC a07D3
        LDA a41F6
        CMP #$02
        BNE b9DC0
        JSR s79D7
        LDA a07D3
        CMP #$30
        BNE b9DC0
        JSR s79D7
b9DC0   LDA a07D3
        CMP #$30
        BNE b9DCA
        JMP j75D3

b9DCA   LDA a4C72
        BEQ b9DD2
        JMP j9E8F

b9DD2   JMP j8291

f9DD5   .TEXT "GOT YOU_ SHEEPOID["
s9DE7   LDX #$00
b9DE9   LDA f5000,X
        BEQ b9DFA
        INC a5D
        LDA #$00
        STA f5000,X
        LDA #$C0
        STA f51B0,X
b9DFA   INX 
        CPX #$0C
        BNE b9DE9
        JMP s9B2E

s9E02   TXA 
        PHA 
        JSR j8EA1
        PLA 
        TAX 
        RTS 

j9E0A   JSR s9111
        LDA f50C0,X
        AND #$80
        BNE b9E15
        RTS 

b9E15   LDA a44
        ASL 
        ORA #$01
        STA f50A0,X
        LDA f50C0,X
        AND #$7F
        STA f50C0,X
        STA f51E0,X
        RTS 

s9E29   TXA 
        PHA 
        LDA #$04
        STA a03
        LDA a60
        STA a02
        LDA f5170,X
        STA a04
        AND #$0F
        TAY 
        LDA a04
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        TAX 
j9E46   TYA 
        PHA 
b9E48   LDA (p02),Y
        CLC 
        ADC #$01
        STA (p02),Y
        LDA (p02),Y
        CMP #$3A
        BNE b9E5E
        LDA #$30
        STA (p02),Y
        DEY 
        CPY #$FF
        BNE b9E48
b9E5E   PLA 
        TAY 
        DEX 
        BNE j9E46
        PLA 
        TAX 
b9E65   RTS 

s9E66   LDA a3F
        SEC 
        SBC #$08
        LSR 
        LSR 
        STA a58
        LDA #$02
        STA a59
        LDA a40
        AND #$80
        BEQ b9E7D
        LDA #$16
        STA a59
b9E7D   JSR s8047
        CMP #$BB
        BNE b9E65
        INC a61
        LDA a61
        CMP #$64
        BNE b9E65
        DEC a61
        RTS 

j9E8F   LDA a57
        BEQ b9E9A
        LDA #$00
        STA a57
        JSR s9A1C
b9E9A   LDX #$00
        STX $D015    ;Sprite display Enable
        LDA #$82
b9EA1   STA f4200,X
        STA f4300,X
        INX 
        BNE b9EA1
        LDA #$04
        STA a24
        LDA a4C72
        BEQ b9EB6
        JMP j7031

b9EB6   LDA #>p080B
        STA a59
        LDA #<p080B
        STA a58
        LDX #$00
        STX $D404    ;Voice 1: Control Register
        STX $D40B    ;Voice 2: Control Register
        STX $D412    ;Voice 3: Control Register
b9EC9   LDA f9EF0,X
        JSR s9ED7
        INX 
        CPX #$14
        BNE b9EC9
        JMP j7000

s9ED7   STA a5A
        AND #$80
        BEQ b9EE4
        LDA a5A
        AND #$0F
        STA a5B
        RTS 

b9EE4   LDA a5A
        AND #$3F
        STA a5A
        JSR s804D
        INC a58
        RTS 

f9EF0   .TEXT "LEVEL ", $84, "00 ", $81, "COMPLETED"
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$8A,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00
        BRK #$00
        .TEXT $00, "SHEEP IN SPACE"
fA000   .TEXT $94, $E3, $7B, $E3, "CBMBASIC"
        .BYTE $30
