GFX_039_4000:
INCBIN "gfx/misc/gfx_039_4000.2bpp"
Func_039_40a0:
	xor a
	ld [hFFC6], a
	ldh [hFFC5], a
	ld [wd1f4], a
	ld [wSelectedPage], a
	ld [wSelectedOption], a
	ld a, $01
	ld [wBattleScriptState], a
	ld a, [$7FFF]
	ld [wBattleScriptBank], a
.asm_40ba
	call DelayFrame
	ld a, [hFFC6]
	and a
	jr nz, .asm_40f4
	ld a, [wBattleScriptState]
	cp $01
	jr z, .asm_40d3
	cp $02
	jr z, .asm_40ec
	call .asm_4103
	jr .asm_40ba
.asm_40d3
	ld de, .data_40f9
	ldh a, [hFFC5]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wBattleScriptPos], a
	ld a, [hli]
	ld [$D089], a
	ld a, $02
	ld [wBattleScriptState], a
	jr .asm_40ba
.asm_40ec
	farcall Func_025_424e
	jr .asm_40ba
.asm_40f4
	xor a
	ld [hFFC6], a
	ret
.data_40f9:
	dr $E40F9, $E4103
.asm_4103
	ld de, unk_039_4111
	ldh a, [hFFC5]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
unk_039_4111:
	dr $E4111, $E41FB
; TODO
asm_039_41fb:
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, [_BANKNUM]
	ld [wBattleScriptBank], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(unk_039_4224)
	inc hl
	ld [hl], HIGH(unk_039_4224)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	xor a
	ldh [hFFC5], a
	ret
unk_039_4224:
	db $08, $14, $4c, $11, $17, $09, $40
Func_039_422b:
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld bc, wcde0
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4240
	ld a, [bc]
	dec a
	ld [bc], a
	jr .asm_4243
.asm_4240
	ld a, [bc]
	inc a
	ld [bc], a
.asm_4243
	ld a, $01
	sub [hl]
	ld [hl], a
	ret
unk_039_4248:
	dr $E4248, $E479F

asm_039_479f::
	ld a, [wd1f4]
	cp $02
	jr nz, .asm_47c6
	ld a, [wd9f3]
	cp $20
	jr nz, .asm_47b7
	ld a, [wEventFlags + $10]
	set 6, a
	ld [wEventFlags + $10], a
	jr .asm_47c6
.asm_47b7
	ld a, [wd9f3]
	cp $02
	jr nz, .asm_47c6
	ld a, [wEventFlags + 1]
	set 3, a
	ld [wEventFlags + 1], a
.asm_47c6
	ld de, .Pointers
	ld a, [wd1f4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9f3]
	ld b, a
.asm_47d8
	ld a, [hl]
	and a
	jr z, .asm_47e3
	cp b
	jr z, .asm_47e3
	inc hl
	inc hl
	jr .asm_47d8
.asm_47e3
	ld [hl], b
	inc hl
	ld a, [wd9d3]
	add [hl]
	ld [hl], a
	cp $64
	ret c
	ld [hl], $63
	sub $63
	ld [wd9d3], a
	ld de, .Pointers
	ld a, [wd1f4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9f3]
	ld b, a
.asm_4806
	ld a, [hl]
	and a
	jr z, .asm_480e
	inc hl
	inc hl
	jr .asm_4806
.asm_480e
	ld [hl], b
	inc hl
	ld a, [wd9d3]
	ld [hl], a
	ret

.Pointers
	dw wd300
	dw wddb0
	dw wd284
.Data
; TODO: unidentified data ($481b-$485b)
	db $3D, $00, $04, $80, $8A, $02, $04, $00, $93, $75, $25, $74, $41, $02, $0C, $00
	db $35, $76, $C7, $74, $43, $3B, $13, $D7, $D0, $05, $03, $01, $0C, $1A, $41, $5C
	db $09, $02, $04, $00, $93, $75, $25, $74, $02, $0E, $09, $AF, $76, $DD, $76, $45
	db $3B, $13, $D3, $D9, $02, $01, $0F, $0B, $3B, $13, $D7, $D0, $05, $03, $01, $0C
	db $1A

Func_039_485c::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, $01
	ld [bc], a
	ret

Func_039_4879::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedOption]
	ld [hli], a
	ld bc, wcde0
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ret

Func_039_4892::
	xor a
	ld [hFFC6], a
	ldh [hFFC5], a
	ld [wd1f4], a
	ld [wSelectedPage], a
	ld [wSelectedOption], a
	ld [wTextboxPos], a
	ld a, $01
	ld [wBattleScriptState], a
	ld a, [_BANKNUM]
	ld [wBattleScriptBank], a
.asm_48af
	call DelayFrame
	ld a, [hFFC6]
	and a
	jr nz, .asm_48e9
	ld a, [wBattleScriptState]
	cp $01
	jr z, .asm_48c8
	cp $02
	jr z, .asm_48e1
	call Func_039_4904
	jr .asm_48af
.asm_48c8
	ld de, ScreenScript_Pointers
	ldh a, [hFFC5]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wBattleScriptPos], a
	ld a, [hli]
	ld [wBattleScriptPos + 1], a
	ld a, $02
	ld [wBattleScriptState], a
	jr .asm_48af
.asm_48e1
	farcall Func_025_424e
	jr .asm_48af
.asm_48e9
	xor a
	ld [hFFC6], a
	ret
ScreenScript_Pointers:
	dw ScreenScript_39_4928
	dw ScreenScript_39_4ac7
	dw ScreenScript_39_4cc1
	dw ScreenScript_39_4e9a
	dw ScreenScript_39_512d
	dw ScreenScript_39_5296
	dw ScreenScript_39_5392
	dw ScreenScript_39_54fd
	dw ScreenScript_39_55eb
	dw ScreenScript_39_5734
	dw ScreenScript_39_5811
Func_039_4904:
	ld de, ScreenLoop_Pointers
	ldh a, [hFFC5]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
ScreenLoop_Pointers:
	dw Func_039_497c
	dw Func_039_4afd
	dw Func_039_4cda
	dw Func_039_4ec0
	dw Func_039_5163
	dw Func_039_529f
	dw Func_039_53ab
	dw Func_039_5522
	dw Func_039_5604
	dw Func_039_574d
	dw Func_039_5826
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4928:
	dr $e4928, $e497c
Func_039_497c:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4997
	call Func_039_422b
	call .asm_499d
	jr Func_039_497c
.asm_4997
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_499d
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_49ae
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
	jr .asm_49be
.asm_49ae
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_49ca
	ld a, [wSelectedOption]
	cp $04
	ret z
	inc a
	ld [wSelectedOption], a
.asm_49be
	ld a, [wSelectedOption]
	swap a
	add $18
	ld hl, wcde0
	ld [hl], a
	ret
.asm_49ca
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, asm_039_41fb
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	ld [wd9f2], a
	call Func_039_4879
	ld a, [wSelectedOption]
	and a
	jp z, .asm_4a52
	cp $01
	jp z, .asm_4a13
	cp $02
	jp z, .asm_4a52
	cp $03
	jp z, .asm_49fb
	cp $04
	jp z, .asm_4a52
	ret
.asm_49fb
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld [wMonBoxIndex], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $07
	ldh [hFFC5], a
	ret
.asm_4a13
	call Func_039_4879
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $01
	ldh [hFFC5], a
	ret
.asm_4a2b
	call Func_039_4879
	ld a, $02
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld [wMonBoxIndex], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4ead)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4ead)
	xor a
	ld [wBattleScriptByte], a
	ret
.asm_4a52
	ld a, [wMonBoxCount]
	and a
	jr z, .asm_4aa5
	ld a, [wd9f2]
	cp $02
	jr z, .asm_4a2b
	cp $04
	jr z, .asm_4a7e
	call Func_039_4879
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld [wMonBoxIndex], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ret
.asm_4a7e
	call Func_039_4879
	ld a, $02
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld [wMonBoxIndex], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4e87)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4e87)
	xor a
	ld [wBattleScriptByte], a
	ret
.asm_4aa5
	ld a, SFX_19
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4ac0)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4ac0)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4ac0:
	dr $e4ac0, $e4ac7
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4ac7:
	dr $e4ac7, $e4afd
Func_039_4afd:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4b18
	call Func_039_422b
	call .asm_4b1e
	jr Func_039_4afd
.asm_4b18
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_4b1e
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4b3f
	ld a, [wSelectedOption]
	cp $03
	ret nc
	add $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_4b88
	ld a, [wSelectedOption]
	sub $03
	ld [wSelectedOption], a
	ret
.asm_4b3f
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4b52
	ld a, [wSelectedOption]
	cp $03
	ret c
	sub $03
	ld [wSelectedOption], a
	jr .asm_4b88
.asm_4b52
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4b66
	ld a, [wSelectedOption]
	and a
	ret z
	cp $03
	ret z
	dec a
	ld [wSelectedOption], a
	jr .asm_4b88
.asm_4b66
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4bb0
	ld a, [wSelectedOption]
	cp $02
	ret z
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_4b88
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_4b88
	ld de, PartyCursor_Pointers
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4ca4)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4ca4)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
.asm_4bb0
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_4c15
	ld a, SFX_11
	call PlaySound
	call Func_039_4879
	ld hl, wPartyMons
	ld bc, $0016
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4bff
	call GetPartyMonPtr
	ld a, [bc]
	cp $51
	jr z, .asm_4bff
	cp $75
	jr z, .asm_4bff
	cp $6C
	jr z, .asm_4bff
	cp $5B
	jr z, .asm_4bff
	cp $63
	jr z, .asm_4bff
	cp $91
	jr z, .asm_4bff
	cp $90
	jr z, .asm_4bff
	cp $7E
	jr z, .asm_4bff
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $02
	ldh [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_4bff
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4c8b)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4c8b)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_4c15
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4c38)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4c38)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	xor a
	ldh [hFFC5], a
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4c38:
	dr $e4c38, $e4c8b
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4c8b:
	dr $e4c8b, $e4ca4
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4ca4:
	dr $e4ca4, $e4cb5
; TODO: pointer table - resolve dw targets (cross-bank/wram or mid-block)
PartyCursor_Pointers:
	dr $e4cb5, $e4cc1
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4cc1:
	dr $e4cc1, $e4cda
Func_039_4cda:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4cf5
	call Func_039_422b
	call .asm_4cfb
	jr Func_039_4cda
.asm_4cf5
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_4cfb
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4d0c
	ld a, [wSelectedOption]
	and a
	ret z
	xor a
	ld [wSelectedOption], a
	jr .asm_4d1c
.asm_4d0c
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4d2d
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, $01
	ld [wSelectedOption], a
.asm_4d1c
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $48
	ld hl, wcde0
	ld [hl], a
	ret
.asm_4d2d
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_4d6d
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_4d72
	ld a, SFX_11
	call PlaySound
	ld a, [wMonBoxCount]
	cp $14
	jr nc, .asm_4d52
	call Func_039_4deb
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4d92)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4d92)
	jr .asm_4d5a
.asm_4d52
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4dc1)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4dc1)
.asm_4d5a
	ld a, $02
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	ret
.asm_4d6d
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_4d72
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_4de2)
	inc hl
	ld [hl], HIGH(ScreenScript_39_4de2)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	call Func_039_485c
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4d92:
	dr $e4d92, $e4dc1
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4dc1:
	dr $e4dc1, $e4de2
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4de2:
	dr $e4de2, $e4deb
Func_039_4deb:
	ld a, $01
	ldh [hFFC5], a
	call Func_039_485c
	call GetPartyMonPtr
	push bc
	ld hl, wMonBox
	ld a, [wMonBoxCount]
	ld de, $0013
	and a
	jr z, .asm_4e06
.asm_4e02
	add hl, de
	dec a
	jr nz, .asm_4e02
.asm_4e06
	ld e, $13
.asm_4e08
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .asm_4e08
	inc bc
	ld a, [bc]
	call .asm_4e39
	inc bc
	ld a, [bc]
	call .asm_4e39
	ld a, [wMonBoxCount]
	inc a
	ld [wMonBoxCount], a
	pop hl
	ld e, $16
	xor a
.asm_4e23
	ld [hli], a
	dec e
	jr nz, .asm_4e23
	call .asm_4e57
	ld de, wdca0
	ld a, [wdc9d]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wMonBoxCount]
	ld [hl], a
	ret
.asm_4e39
	and a
	ret z
	push bc
	ld d, a
	ld hl, wddb0
	ld bc, $0002
	ld e, $28
.asm_4e45
	ld a, [hl]
	cp d
	jr z, .asm_4e4c
	and a
	jr nz, .asm_4e51
.asm_4e4c
	ld a, d
	ld [hli], a
	inc [hl]
	pop bc
	ret
.asm_4e51
	add hl, bc
	dec e
	jr nz, .asm_4e45
	pop bc
	ret
.asm_4e57
	ld bc, wPartyMons
.asm_4e5a
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4e7b
	push bc
	ld hl, $0016
	add hl, bc
	ld e, $16
.asm_4e69
	ld a, [hli]
	ld [bc], a
	inc bc
	dec e
	jr nz, .asm_4e69
	pop bc
	ld hl, $0016
	add hl, bc
	ld e, $16
	xor a
.asm_4e77
	ld [hli], a
	dec e
	jr nz, .asm_4e77
.asm_4e7b
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $60
	jr c, .asm_4e5a
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4e87:
	dr $e4e87, $e4e9a
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4e9a:
	dr $e4e9a, $e4ead
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_4ead:
	dr $e4ead, $e4ec0
Func_039_4ec0:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4edb
	call Func_039_422b
	call .asm_4ee1
	jr Func_039_4ec0
.asm_4edb
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_4ee1
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4f5e
	ld a, [wSelectedOption]
	and a
	jr z, .asm_4ef4
	dec a
	ld [wSelectedOption], a
	jp .asm_4f7b
.asm_4ef4
	ld a, [wMonBoxIndex]
	and a
	ret z
	dec a
	ld [wMonBoxIndex], a
	ld a, [wSelectedOption]
	call Func_039_5115
	and a
	jr nz, .asm_4f43
	ld a, [wMonBoxIndex]
	inc a
	ld [wMonBoxIndex], a
	jr .asm_4f43
.asm_4f0f
	ld a, [wSelectedOption]
	cp $04
	jr z, .asm_4f28
	inc a
	ld [wSelectedOption], a
	call Func_039_5115
	and a
	jr nz, .asm_4f43
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_4f28
	ld a, [wMonBoxIndex]
	cp $0F
	ret nc
	inc a
	ld [wMonBoxIndex], a
	ld a, [wSelectedOption]
	call Func_039_5115
	and a
	jr nz, .asm_4f43
	ld a, [wMonBoxIndex]
	dec a
	ld [wMonBoxIndex], a
	ret
.asm_4f43
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_504a)
	inc hl
	ld [hl], HIGH(ScreenScript_39_504a)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_4f5e
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4f8c
	ld a, [wSelectedOption]
	inc a
	call Func_039_5115
	and a
	ret z
	ld a, [wSelectedOption]
	cp $04
	jr z, .asm_4f0f
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
.asm_4f7b
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $18
	ld hl, wcde0
	ld [hl], a
	ret
.asm_4f8c
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, Func_039_5016
	ld a, SFX_11
	call PlaySound
	ld a, [wd9f2]
	and a
	jp z, .asm_4fa8
	cp $02
	jp z, .asm_4fc4
	cp $04
	jr z, .asm_4fdf
.asm_4fa8
	call Func_039_4879
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $04
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	xor a
	ld hl, wcde0
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
.asm_4fc4
	call Func_12e6
	ld a, [bc]
	and a
	ret z
	call Func_039_4879
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $06
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_4fdf
	call Func_12e6
	ld a, [bc]
	and a
	ret z
	call Func_039_4879
	call Func_039_5067
	and a
	jr nz, .asm_5000
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $09
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_5000
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_503b)
	inc hl
	ld [hl], HIGH(ScreenScript_39_503b)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
Func_039_5016:
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_504c)
	inc hl
	ld [hl], HIGH(ScreenScript_39_504c)
	xor a
	ld [wBattleScriptByte], a
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	call Func_039_485c
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_503b:
	dr $e503b, $e504a
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_504a:
	dr $e504a, $e504c
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_504c:
	dr $e504c, $e5067
Func_039_5067:
	call Func_12e6
	ld a, [bc]
	ld de, Table_39_5074
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ret
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
Table_39_5074:
	dr $e5074, $e5115
Func_039_5115:
	push af
	ld bc, wMonBox
	ld a, [wMonBoxIndex]
	ld l, a
	pop af
	add l
	and a
	jr z, .asm_512b
.asm_5122
	ld hl, $0013
	add hl, bc
	push hl
	pop bc
	dec a
	jr nz, .asm_5122
.asm_512b
	ld a, [bc]
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_512d:
	dr $e512d, $e5163
Func_039_5163:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_517b
	call .asm_5181
	jr Func_039_5163
.asm_517b
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_5181
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_519e
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_5198
	ld a, [wMonBoxIndex]
	and a
	ret z
	dec a
	ld [wMonBoxIndex], a
	jr .asm_51d5
.asm_5198
	dec a
	ld [wSelectedOption], a
	jr .asm_51d5
.asm_519e
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_51f0
	ld a, [wSelectedOption]
	cp $04
	jr nz, .asm_51c3
	ld a, [wMonBoxIndex]
	inc a
	ld [wMonBoxIndex], a
	ld a, [wSelectedOption]
	call Func_039_5115
	and a
	jr nz, .asm_51d5
	ld a, [wMonBoxIndex]
	dec a
	ld [wMonBoxIndex], a
	ret
.asm_51c3
	inc a
	ld [wSelectedOption], a
	call Func_039_5115
	and a
	jr nz, .asm_51d5
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_51d5
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_5241)
	inc hl
	ld [hl], HIGH(ScreenScript_39_5241)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_51f0
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_520d
	ld a, SFX_11
	call PlaySound
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $05
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_520d
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_524c)
	inc hl
	ld [hl], HIGH(ScreenScript_39_524c)
	xor a
	ld [wBattleScriptByte], a
	ld a, $03
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedOption]
	swap a
	add $18
	ld hl, wcde0
	ld [hli], a
	ld [hl], $10
	inc hl
	ld [hl], $01
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5241:
	dr $e5241, $e524c
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_524c:
	dr $e524c, $e5296
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5296:
	dr $e5296, $e529f
Func_039_529f:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_52b7
	call .asm_52bd
	jr Func_039_529f
.asm_52b7
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_52bd
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_52da
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_52d4
	ld a, [wMonBoxIndex]
	and a
	ret z
	dec a
	ld [wMonBoxIndex], a
	jr .asm_5311
.asm_52d4
	dec a
	ld [wSelectedOption], a
	jr .asm_5311
.asm_52da
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_532c
	ld a, [wSelectedOption]
	cp $04
	jr nz, .asm_52ff
	ld a, [wMonBoxIndex]
	inc a
	ld [wMonBoxIndex], a
	ld a, [wSelectedOption]
	call Func_039_5115
	and a
	jr nz, .asm_5311
	ld a, [wMonBoxIndex]
	dec a
	ld [wMonBoxIndex], a
	ret
.asm_52ff
	inc a
	ld [wSelectedOption], a
	call Func_039_5115
	and a
	jr nz, .asm_5311
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_5311
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_536d)
	inc hl
	ld [hl], HIGH(ScreenScript_39_536d)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_532c
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_5349
	ld a, SFX_11
	call PlaySound
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $05
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_5349
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_537c)
	inc hl
	ld [hl], HIGH(ScreenScript_39_537c)
	xor a
	ld [wBattleScriptByte], a
	ld a, $04
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_536d:
	dr $e536d, $e537c
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_537c:
	dr $e537c, $e5392
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5392:
	dr $e5392, $e53ab
Func_039_53ab:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_53c3
	call .asm_53c9
	jr Func_039_53ab
.asm_53c3
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_53c9
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_53da
	ld a, [wSelectedOption]
	and a
	ret z
	xor a
	ld [wSelectedOption], a
	jr .asm_53ea
.asm_53da
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_53fb
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, $01
	ld [wSelectedOption], a
.asm_53ea
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $48
	ld hl, wcde0
	ld [hl], a
	ret
.asm_53fb
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_5441
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_5446
	ld a, SFX_11
	call PlaySound
	ld hl, wcde0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, wPartyMon6Species
	ld a, [hl]
	and a
	jr nz, .asm_5427
	call Func_039_5490
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_5470)
	inc hl
	ld [hl], HIGH(ScreenScript_39_5470)
	jr .asm_542f
.asm_5427
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_5484)
	inc hl
	ld [hl], HIGH(ScreenScript_39_5484)
.asm_542f
	ld a, $02
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ret
.asm_5441
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_5446
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_5468)
	inc hl
	ld [hl], HIGH(ScreenScript_39_5468)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	call Func_039_485c
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5468:
	dr $e5468, $e5470
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5470:
	dr $e5470, $e5484
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5484:
	dr $e5484, $e5490
Func_039_5490:
	ld hl, wPartyMons
	ld bc, $0016
.asm_5496
	ld a, [hl]
	and a
	jr z, .asm_549d
	add hl, bc
	jr .asm_5496
.asm_549d
	push hl
	call Func_039_4879
	ld a, $03
	ldh [hFFC5], a
	call Func_039_485c
	call Func_12e6
	pop hl
	push bc
	ld e, $13
.asm_54af
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .asm_54af
	pop hl
	ld e, $13
	xor a
.asm_54b9
	ld [hli], a
	dec e
	jr nz, .asm_54b9
	call Func_039_54c8
	ld a, [wMonBoxCount]
	dec a
	ld [wMonBoxCount], a
	ret
Func_039_54c8:
	ld bc, wMonBox
.asm_54cb
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_54ec
	push bc
	ld hl, $0013
	add hl, bc
	ld e, $13
.asm_54da
	ld a, [hli]
	ld [bc], a
	inc bc
	dec e
	jr nz, .asm_54da
	pop bc
	ld hl, $0013
	add hl, bc
	ld e, $13
	xor a
.asm_54e8
	ld [hli], a
	dec e
	jr nz, .asm_54e8
.asm_54ec
	ld hl, $0013
	add hl, bc
	push hl
	pop bc
	ld a, h
	cp $DC
	jr nz, .asm_54cb
	ld a, l
	cp $80
	jr c, .asm_54cb
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_54fd:
	dr $e54fd, $e5522
Func_039_5522:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_553d
	call Func_039_422b
	call .asm_5543
	jr Func_039_5522
.asm_553d
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_5543
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_5585
	ld a, [wSelectedOption]
	and a
	jr z, .asm_5555
	dec a
	ld [wSelectedOption], a
	jr .asm_5599
.asm_5555
	ld a, [wMonBoxIndex]
	and a
	ret z
	dec a
	ld [wMonBoxIndex], a
	jr .asm_556a
.asm_5560
	ld a, [wMonBoxIndex]
	cp $07
	ret z
	inc a
	ld [wMonBoxIndex], a
.asm_556a
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_55dd)
	inc hl
	ld [hl], HIGH(ScreenScript_39_55dd)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_5585
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_55aa
	ld a, [wSelectedOption]
	cp $04
	jr z, .asm_5560
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
.asm_5599
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $18
	ld hl, wcde0
	ld [hl], a
	ret
.asm_55aa
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, Func_039_5016
	ld a, [wMonBoxIndex]
	ld b, a
	ld a, [wSelectedOption]
	add b
	ld b, a
	ld a, [wdc9d]
	cp b
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, b
	ld [wd1f4], a
	call Func_039_4879
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $08
	ldh [hFFC5], a
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_55dd:
	dr $e55dd, $e55eb
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_55eb:
	dr $e55eb, $e5604
Func_039_5604:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_561f
	call Func_039_422b
	call .asm_5625
	jr Func_039_5604
.asm_561f
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_5625
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_5636
	ld a, [wSelectedOption]
	and a
	ret z
	xor a
	ld [wSelectedOption], a
	jr .asm_5646
.asm_5636
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_5657
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, $01
	ld [wSelectedOption], a
.asm_5646
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $48
	ld hl, wcde0
	ld [hl], a
	ret
.asm_5657
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_568e
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_5693
	ld a, SFX_11
	call PlaySound
	call Func_039_56de
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_56bd)
	inc hl
	ld [hl], HIGH(ScreenScript_39_56bd)
	ld a, $02
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $07
	ldh [hFFC5], a
	farcall WriteSaveData
	call Func_039_595d
	ret
.asm_568e
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_5693
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_56b5)
	inc hl
	ld [hl], HIGH(ScreenScript_39_56b5)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $07
	ldh [hFFC5], a
	call Func_039_485c
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_56b5:
	dr $e56b5, $e56bd
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_56bd:
	dr $e56bd, $e56de
Func_039_56de:
	ld de, wdca0
	ld a, [wdc9d]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wMonBoxCount]
	ld [hl], a
	ld a, $0A
	ld [rRAMG], a
	xor a
	ld [rRAMB], a
	ld a, [wdc9d]
	sla a
	add $A9
	ld d, a
	ld e, $00
	ld hl, wMonBox
	ld bc, $017C
	call CopyBytes3
	ld de, wdca0
	ld a, [wd1f4]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [wMonBoxCount], a
	ld a, [wd1f4]
	sla a
	add $A9
	ld h, a
	ld l, $00
	ld de, wMonBox
	ld bc, $017C
	call CopyBytes3
	ld a, [wd1f4]
	ld [wdc9d], a
	xor a
	ld [rRAMG], a
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5734:
	dr $e5734, $e574d
Func_039_574d:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5768
	call Func_039_422b
	call .asm_576e
	jr Func_039_574d
.asm_5768
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_576e
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_577f
	ld a, [wSelectedOption]
	and a
	ret z
	xor a
	ld [wSelectedOption], a
	jr .asm_578f
.asm_577f
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_57a0
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, $01
	ld [wSelectedOption], a
.asm_578f
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $48
	ld hl, wcde0
	ld [hl], a
	ret
.asm_57a0
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_57ce
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_57d3
	ld a, SFX_11
	call PlaySound
	call Func_039_5940
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_57f5)
	inc hl
	ld [hl], HIGH(ScreenScript_39_57f5)
	ld a, $02
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ret
.asm_57ce
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_57d3
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_5809)
	inc hl
	ld [hl], HIGH(ScreenScript_39_5809)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	call Func_039_485c
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_57f5:
	dr $e57f5, $e5809
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5809:
	dr $e5809, $e5811
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_5811:
	dr $e5811, $e5826
Func_039_5826:
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_583e
	call .asm_5844
	jr Func_039_5826
.asm_583e
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_5844
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_5861
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_585b
	ld a, [wMonBoxIndex]
	and a
	ret z
	dec a
	ld [wMonBoxIndex], a
	jr .asm_5898
.asm_585b
	dec a
	ld [wSelectedOption], a
	jr .asm_5898
.asm_5861
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_58ae
	ld a, [wSelectedOption]
	cp $04
	jr nz, .asm_5886
	ld a, [wMonBoxIndex]
	inc a
	ld [wMonBoxIndex], a
	ld [wSelectedOption], a
	call Func_039_5115
	and a
	jr nz, .asm_5898
	ld a, [wMonBoxIndex]
	dec a
	ld [wMonBoxIndex], a
	ret
.asm_5886
	inc a
	ld [wSelectedOption], a
	call Func_039_5115
	and a
	jr nz, .asm_5898
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_5898
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_58dd)
	inc hl
	ld [hl], HIGH(ScreenScript_39_58dd)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_58ae
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(ScreenScript_39_58f5)
	inc hl
	ld [hl], HIGH(ScreenScript_39_58f5)
	xor a
	ld [wBattleScriptByte], a
	ld a, $03
	ldh [hFFC5], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedOption]
	swap a
	add $18
	ld hl, wcde0
	ld [hli], a
	ld [hl], $10
	inc hl
	ld [hl], $01
	ret
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_58dd:
	dr $e58dd, $e58f5
; TODO: battle/screen-script VM bytecode - needs opcode-table decoder (LEAVE per scope)
ScreenScript_39_58f5:
	dr $e58f5, $e5940
Func_039_5940:
	ld a, $03
	ldh [hFFC5], a
	call Func_039_485c
	call Func_12e6
	ld e, $13
	xor a
.asm_594d
	ld [bc], a
	inc bc
	dec e
	jr nz, .asm_594d
	call Func_039_54c8
	ld a, [wMonBoxCount]
	dec a
	ld [wMonBoxCount], a
	ret
Func_039_595d:
	ld hl, wcde0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wVirtualOAMSprite38YCoord
	ld c, $08
	xor a
.asm_597f
	ld [hli], a
	dec c
	jr nz, .asm_597f
	ret


