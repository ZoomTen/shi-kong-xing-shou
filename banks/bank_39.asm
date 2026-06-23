GFX_039_4000:
	INCBIN "gfx/misc/gfx_039_4000.2bpp"
GFX_039_4020:
	INCBIN "gfx/misc/gfx_039_4020.2bpp"
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
	ld [wBattleScriptPos + 1], a
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
	dw ScreenScript_39_411b
	dw ScreenScript_39_4248
	dw ScreenScript_39_445e
	dw ScreenScript_39_461f
	dw Func_039_4892
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
	dw Func_039_417e
	dw Func_039_4250
	dw Func_039_4469
	dw Func_039_462f
	dw Func_039_4892
ScreenScript_39_411b:
	bs_save_palbuf
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $0090, $9000, BattleUIGFX_4e9a
	bs_vram_copy3 $00a0, $9090, BattleUIGFX_483a
	bs_vram_copy3 $0140, $9130, BattleUIGFX_55da
	bs_vram_copy3 $0030, $8f80, BattleUIGFX_4e6a
	bs_farcopy_vram $39, $0020, $9270, GFX_039_4000
	bs_print_text_xy String_025_6199, $29, $3d
	bs_draw_aa_434d $01
	bs_load_bgpal_buf String_025_6129
	bs_fill_vram $0400, $8a80
	bs_load_objpal_buf String_025_6169
	bs_place_tile_attr $0000, Tilemap_4a_7541, Tilemap_4a_73d3
	bs_place_tile_attr $0004, Tilemap_4a_7593, Tilemap_4a_7425
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_print_num_full $13, wMoney, $0305, $0c01
	bs_clear_oam
	bs_set_sprite_pos $18, $0e
	bs_lcd_on_loadpal
	bs_end_script
Func_039_417e:
.asm_417e
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4199
	call Func_039_422b
	call .asm_419f
	jr .asm_417e
.asm_4199
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_419f
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_41bd
	ld a, [wSelectedOption]
	and a
	ret z
	ld a, SFX_11
	call PlaySound
	xor a
	ld [wSelectedOption], a
	ld [wd1f4], a
	ld hl, wcde0
	inc hl
	ld [hl], $0E
	ret
.asm_41bd
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_41dc
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, SFX_11
	call PlaySound
	ld a, $01
	ld [wSelectedOption], a
	ld [wd1f4], a
	ld hl, wcde0
	inc hl
	ld [hl], $36
	ret
.asm_41dc
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, asm_039_41fb
	ld a, SFX_11
	call PlaySound
	call Func_039_4879
	ld a, $01
	ldh [hFFC5], a
	ldh [hFFC6], a
	ld [wBattleScriptState], a
	xor a
	ld [wSelectedPage], a
	ld [wSelectedOption], a
	ret
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
; TODO: unk_ - data, referenced via `ld [hl], LOW(unk_039_4224)`
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
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
ScreenScript_39_4248:
	bs_clear_region
	bs_draw_item_page
	bs_set_sprite_pos $30, $0e
	bs_draw_item_x
	bs_draw_item_arrows
	bs_end_script
Func_039_4250:
.asm_4250
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_426b
	call Func_039_422b
	call .asm_4271
	jr .asm_4250
.asm_426b
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_4271
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4282
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
	jr .asm_4292
.asm_4282
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_42b8
	ld a, [wSelectedOption]
	cp $03
	ret z
	inc a
	ld [wSelectedOption], a
.asm_4292
	ld a, SFX_11
	call PlaySound
	ld hl, wcde0
	ld a, [wSelectedOption]
	swap a
	add $30
	ld [hl], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(unk_039_4409)
	inc hl
	ld [hl], HIGH(unk_039_4409)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_42b8
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_42c9
	ld a, [wSelectedPage]
	and a
	ret z
	dec a
	ld [wSelectedPage], a
	jr .asm_4304
.asm_42c9
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_432a
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .asm_42f7
	ld de, unk_039_43ea
	ld a, [wd1f4]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedPage]
	cp [hl]
	ret z
	inc a
	ld [wSelectedPage], a
	call Func_039_444a
	and a
	jr nz, .asm_4304
	ld a, [wSelectedPage]
	dec a
	ld [wSelectedPage], a
	ret
.asm_42f7
	ld a, [wSelectedPage]
	cp $01
	ret z
	ld a, $01
	ld [wSelectedPage], a
	jr .asm_4304
.asm_4304
	ld a, SFX_11
	call PlaySound
	ld hl, wcde0
	ld a, [wSelectedOption]
	swap a
	add $30
	ld [hl], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(unk_039_43fb)
	inc hl
	ld [hl], HIGH(unk_039_43fb)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_432a
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_43be
	ld a, SFX_11
	call PlaySound
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .asm_437a
	call Func_039_4430
	and a
	ret z
	ld [wd9f3], a
	inc hl
	ld a, [hli]
	ld [wd9f4], a
	ld a, [wd1f4]
	and a
	jr nz, .asm_4352
	jr .asm_4352
.asm_4352
	call Func_039_4879
	ld a, $02
	ld [wBattleScriptState], a
	ld a, $01
	ld [wd9d3], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(unk_039_43ed)
	inc hl
	ld [hl], HIGH(unk_039_43ed)
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $02
	ldh [hFFC5], a
	call Func_039_595d
	ret
.asm_437a
	ld a, [wd9f3]
	and a
	ret z
	ld a, $01
	ld [wd9d3], a
	call Func_039_45db
	and a
	jr nz, .asm_43a8
	call Func_039_4879
	ld a, $01
	ld [wBattleScriptState], a
	ld [wd9d3], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $02
	ldh [hFFC5], a
	call Func_039_595d
	ret
.asm_43a8
	ld hl, wBattleScriptPos
	ld [hl], LOW(unk_039_43f8)
	inc hl
	ld [hl], HIGH(unk_039_43f8)
	ld a, $02
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_43be
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(unk_039_440b)
	inc hl
	ld [hl], HIGH(unk_039_440b)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	xor a
	ldh [hFFC5], a
	call Func_039_485c
	ld a, [wSelectedOption]
	ld [wd1f4], a
	ret
unk_039_43ea:
	db $1d, $09, $0b
unk_039_43ed:
	db $5c, $0a, $02, $0e, $09, $af, $76, $dd, $76, $45, $05
unk_039_43f8:
	db $5c, $08
	db $1a
unk_039_43fb:
	db $1b, $08, $06, $8d, $98, $3d, $00, $04, $80, $8a, $41, $43, $44, $1a
unk_039_4409:
	db $43
	db $1a
unk_039_440b:
	db $01, $99, $61, $29, $3d, $5c, $01, $3d, $00, $04, $80, $8a, $02, $00, $00
	db $41, $75, $d3, $73, $02, $04, $00, $93, $75, $25, $74, $3b, $13, $d7, $d0, $05
	db $03, $01, $0c, $5c, $01, $1a
Func_039_4430:
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wSelectedPage]
	add a
	add a
	add a
	ld l, a
	ld a, [wSelectedOption]
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ret
Func_039_444a:
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wSelectedPage]
	add a
	add a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	ret
ScreenScript_39_445e:
	bs_draw_aa_434d $09
	bs_place_tile_attr $090e, Tilemap_4a_76af, Attrmap_4a_76dd
	bs_draw_q_4416
	bs_end_script
Func_039_4469:
.asm_4469
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4481
	call .asm_4487
	jr .asm_4469
.asm_4481
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_4487
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_44c4
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .asm_44a9
	ld hl, wd9f4
	ld a, [wd9d3]
	cp [hl]
	ret z
	inc a
	ld [wd9d3], a
	call .asm_45a0
	and a
	jp z, .asm_4533
	jr .asm_44bc
.asm_44a9
	ld a, [wd9d3]
	inc a
	ld [wd9d3], a
	cp $64
	jr nc, .asm_44bc
	call Func_039_45db
	and a
	jr nz, .asm_44bc
	jr .asm_4533
.asm_44bc
	ld a, [wd9d3]
	dec a
	ld [wd9d3], a
	ret
.asm_44c4
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_44d9
	ld a, [wd9d3]
	cp $01
	ret z
	dec a
	ld [wd9d3], a
	call Func_039_45db
	jr .asm_4533
.asm_44d9
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_451d
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .asm_4500
	ld hl, wd9f4
	ld a, [wd9d3]
	cp [hl]
	ret nc
	add $0A
	cp [hl]
	jr z, .asm_44f4
	ret nc
.asm_44f4
	ld [wd9d3], a
	call .asm_45a0
	and a
	jp z, .asm_4533
	jr .asm_4514
.asm_4500
	ld a, [wd9d3]
	add $0A
	ld [wd9d3], a
	cp $64
	jr nc, .asm_4514
	call Func_039_45db
	and a
	jr nz, .asm_4514
	jr .asm_4533
.asm_4514
	ld a, [wd9d3]
	sub $0A
	ld [wd9d3], a
	ret
.asm_451d
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4558
	ld a, [wd9d3]
	cp $0A
	ret c
	sub $0A
	ld [wd9d3], a
	call Func_039_45db
	jr .asm_4533
.asm_4533
	ld a, SFX_11
	call PlaySound
	ld hl, $99EB
	ld de, wd9d3
	ld a, $13
	ld [wd8fe], a
	ld a, $01
	ld [wd0fd], a
	ld [wd1fc], a
	ld bc, $0102
	call Func_113f
	farcall Func_01e_4416
	ret
.asm_4558
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_457b
	ld a, SFX_11
	call PlaySound
	call Func_039_4879
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ret
.asm_457b
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(unk_039_4615)
	inc hl
	ld [hl], HIGH(unk_039_4615)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	call Func_039_485c
	ret
.asm_45a0
	farcall Func_01e_4441
	ldh a, [hMathValue + 2]
	cp $02
	jr nc, .asm_45c2
	cp $01
	jr c, .asm_45c0
	ldh a, [hMathValue + 1]
	cp $87
	jr nc, .asm_45c2
	cp $86
	jr c, .asm_45c0
	ldh a, [hMathValue]
	cp $A0
	jr nc, .asm_45c2
.asm_45c0
	xor a
	ret
.asm_45c2
	ld a, $01
	ret
Func_039_45c5:
	farcall Func_01e_4441
	ldh a, [hMathValue + 2]
	ld [wd9ca], a
	ldh a, [hMathValue + 1]
	ld [wd9cb], a
	ldh a, [hMathValue]
	ld [wd9cc], a
	ret
Func_039_45db:
	farcall Func_01e_4441
	ld hl, wMoney
	ldh a, [hMathValue + 2]
	cp [hl]
	jr z, .asm_45ed
	jr c, .asm_4601
	jr .asm_4612
.asm_45ed
	inc hl
	ldh a, [hMathValue + 1]
	cp [hl]
	jr z, .asm_45f7
	jr c, .asm_4601
	jr .asm_4612
.asm_45f7
	inc hl
	ldh a, [hMathValue]
	cp [hl]
	jr z, .asm_4601
	jr c, .asm_4601
	jr .asm_4612
.asm_4601
	ldh a, [hMathValue + 2]
	ld [wd9ca], a
	ldh a, [hMathValue + 1]
	ld [wd9cb], a
	ldh a, [hMathValue]
	ld [wd9cc], a
	xor a
	ret
.asm_4612
	ld a, $01
	ret
unk_039_4615:
	db $02, $0c, $00, $35, $76, $c7, $74, $41, $43, $1a
ScreenScript_39_461f:
	bs_print_text_xy String_025_60db, $a0, $a8
	bs_place_tile_attr $0f06, Tilemap_4a_770b, Attrmap_4a_772b
	bs_set_sprite_pos $48, $86
	bs_end_script
Func_039_462f:
.asm_462f
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_464a
	call Func_039_422b
	call .asm_4650
	jr .asm_462f
.asm_464a
	ldh a, [hFFC6]
	dec a
	ldh [hFFC6], a
	ret
.asm_4650
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_466a
	ld a, [wSelectedOption]
	and a
	ret z
	ld a, SFX_11
	call PlaySound
	xor a
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $48
	ret
.asm_466a
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4685
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, SFX_11
	call PlaySound
	ld a, $01
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $58
	ret
.asm_4685
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_46c5
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_46ca
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .asm_46a5
	call Func_039_45c5
	call .asm_46ec
	jr .asm_46a8
.asm_46a5
	call Func_039_4785
.asm_46a8
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(asm_039_479f.Data)
	inc hl
	ld [hl], HIGH(asm_039_479f.Data)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $01
	ldh [hFFC5], a
	call Func_039_485c
	ret
.asm_46c5
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_46ca
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(asm_039_479f.Data)
	inc hl
	ld [hl], HIGH(asm_039_479f.Data)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $01
	ldh [hFFC5], a
	call Func_039_485c
	ret
.asm_46ec
	ld hl, wd9cc
	ld a, [wMoney + 2]
	add [hl]
	ld [wMoney + 2], a
	dec hl
	ld a, [wMoney + 1]
	adc [hl]
	ld [wMoney + 1], a
	dec hl
	ld a, [wMoney]
	adc [hl]
	ld [wMoney], a
	and a
	jr z, .asm_472e
	cp $02
	jr nc, .asm_471f
	ld a, [wMoney + 1]
	cp $87
	jr nc, .asm_471f
	cp $86
	jr c, .asm_472e
	ld a, [wMoney + 2]
	cp $A0
	jr c, .asm_472e
.asm_471f
	ld a, $9F
	ld [wMoney + 2], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $01
	ld [wMoney], a
.asm_472e
	ld a, $01
	ldh [hFFC5], a
	call Func_039_485c
	call Func_039_4430
	inc hl
	ld a, [wd9d3]
	ld b, a
	ld a, [hl]
	sub b
	ld [hl], a
	and a
	ret nz
	dec hl
	ld [hl], $00
	call .asm_4749
	ret
.asm_4749
	ld de, Func_039_4782
	ld a, [wd1f4]
	ld l, a
	ld h, $00
	add hl, de
	ld c, [hl]
	ld a, [wd1fe]
	ld l, a
	ld e, a
	ld a, [wd1ff]
	ld h, a
	ld d, a
.asm_475e
	ld a, [hl]
	and a
	jr z, .asm_476c
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_475e
	ret
.asm_476c
	ld a, l
	add $02
	ld l, a
	dec c
	jr nz, .asm_475e
	ld a, l
	sub e
	srl a
	ld c, a
.asm_4778
	dec c
	ret z
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	jr .asm_4778
Func_039_4781:
	ret
Func_039_4782:
	ld a, b
	jr z, asm_039_479f.asm_47b2
Func_039_4785:
	ld hl, wd9cc
	ld a, [wMoney + 2]
	sub [hl]
	ld [wMoney + 2], a
	dec hl
	ld a, [wMoney + 1]
	sbc [hl]
	ld [wMoney + 1], a
	dec hl
	ld a, [wMoney]
	sbc [hl]
	ld [wMoney], a
asm_039_479f::
	ld a, [wd1f4]
	cp $02
	jr nz, .asm_47c6
	ld a, [wd9f3]
	cp $20
	jr nz, .asm_47b7
	ld a, [wEventFlags + $10]
	set 6, a
.asm_47b2
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
ScreenScript_39_4928:
	bs_save_palbuf
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $0090, $9000, BattleUIGFX_4e9a
	bs_vram_copy3 $00a0, $9090, BattleUIGFX_483a
	bs_vram_copy3 $0140, $9130, BattleUIGFX_55da
	bs_vram_copy3 $0020, $8f80, BattleUIGFX_4e6a
	bs_farcopy_vram $39, $0080, $9270, GFX_039_4020
	bs_print_text_xy String_025_61a3, $2f, $5b
	bs_draw_aa_434d $0b
	bs_load_bgpal_buf String_025_6129
	bs_fill_vram $0400, $8a80
	bs_load_objpal_buf String_025_6169
	bs_place_tile_attr $0b00, Tilemap_4a_774b, Attrmap_4a_77b9
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_clear_oam
	bs_set_sprite_pos $18, $66
	bs_lcd_on_loadpal
	bs_end_script
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
ScreenScript_39_4ac0:
	bs_draw_aa_434d $19
	bs_draw_aa_434d $0b
	bs_select_menu $00
	bs_end_script3
ScreenScript_39_4ac7:
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $03e0, $9000, BattleUIGFX_4e9a
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_load_bgpal_buf String_025_6129
	bs_load_objpal_buf String_025_6169
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Tilemap_4a_579b
	bs_draw_party_list
	bs_load_mon_bgpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_clear_oam
	bs_set_sprite_pos $18, $08
	bs_lcd_on_loadpal
	bs_end_script
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
	ld de, PartyCursor_Coords
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
ScreenScript_39_4c38:
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $0090, $9000, BattleUIGFX_4e9a
	bs_vram_copy3 $00a0, $9090, BattleUIGFX_483a
	bs_vram_copy3 $0140, $9130, BattleUIGFX_55da
	bs_vram_copy3 $0020, $8f80, BattleUIGFX_4e6a
	bs_farcopy_vram $39, $0080, $9270, GFX_039_4020
	bs_print_text_xy String_025_61a3, $2f, $5b
	bs_draw_aa_434d $0b
	bs_load_bgpal_buf String_025_6129
	bs_fill_vram $0400, $8a80
	bs_load_objpal_buf String_025_6169
	bs_place_tile_attr $0b00, Tilemap_4a_774b, Attrmap_4a_77b9
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_clear_oam
	bs_set_sprite_pos $18, $66
	bs_lcd_on_loadpal
	bs_end_script
ScreenScript_39_4c8b:
	bs_draw_z_434d $00
	bs_place_tile_attr $000c, Tilemap_4a_6537, Attrmap_4a_6227
	bs_draw_z_434d $1d
	bs_place_tile_attr $0009, Attrmap_4a_5c8f, Tilemap_4a_5bd9
	bs_draw_party_list
	bs_select_menu $01
	bs_set_sprite_pos $1c, $48
	bs_end_script3
ScreenScript_39_4ca4:
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_end_script3
; TODO: pointer table - resolve dw targets (cross-bank/wram or mid-block)
; party-menu cursor coords (6 y,x pairs)
PartyCursor_Coords:
	db $18, $08, $18, $40, $18, $78, $38, $08, $38, $40, $38, $78
ScreenScript_39_4cc1:
	bs_draw_z_434d $0d
	bs_place_tile_attr $000c, Tilemap_4a_6537, Attrmap_4a_6227
	bs_print_text_xy String_025_60db, $98, $a0
	bs_place_tile_attr $0f06, Tilemap_4a_662b, Attrmap_4a_664b
	bs_set_sprite_pos $48, $86
	bs_end_script
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
ScreenScript_39_4d92:
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Tilemap_4a_579b
	bs_draw_party_list
	bs_draw_z_434d $00
	bs_place_tile_attr $000c, Tilemap_4a_6537, Attrmap_4a_6227
	bs_draw_z_434d $0e
	bs_place_tile_attr $0009, Attrmap_4a_5c8f, Tilemap_4a_5bd9
	bs_set_sprite_pos $18, $08
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_draw_party_list
	bs_end_script
ScreenScript_39_4dc1:
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Tilemap_4a_579b
	bs_draw_party_list
	bs_draw_z_434d $00
	bs_place_tile_attr $000c, Tilemap_4a_6537, Attrmap_4a_6227
	bs_draw_z_434d $0f
	bs_set_sprite_pos $18, $08
	bs_place_tile_attr $0009, Attrmap_4a_5c8f, Tilemap_4a_5bd9
	bs_draw_party_list
	bs_select_menu $01
	bs_end_script3
ScreenScript_39_4de2:
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Tilemap_4a_579b
	bs_draw_party_list
	bs_end_script3
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
ScreenScript_39_4e87:
	bs_clear_bgbox_at $0c, $14, $9800
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_draw_r_46af
	bs_draw_aa_434d $1c
	bs_set_sprite_pos $18, $10
	bs_end_script
ScreenScript_39_4e9a:
	bs_clear_bgbox_at $0c, $14, $9800
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_draw_r_46af
	bs_draw_aa_434d $0c
	bs_set_sprite_pos $18, $10
	bs_end_script
ScreenScript_39_4ead:
	bs_clear_bgbox_at $0c, $14, $9800
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_draw_r_46af
	bs_draw_aa_434d $1a
	bs_set_sprite_pos $18, $10
	bs_end_script
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
ScreenScript_39_503b:
	bs_draw_aa_434d $18
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_draw_r_46af
	bs_draw_aa_434d $1a
	bs_select_menu $03
	bs_end_script3
ScreenScript_39_504a:
	bs_draw_r_46af
	bs_end_script3
ScreenScript_39_504c:
	bs_clear_bgbox_at $0c, $14, $9800
	bs_print_text_xy String_025_61a3, $2f, $5b
	bs_draw_aa_434d $0b
	bs_place_tile_attr $0b00, Tilemap_4a_774b, Attrmap_4a_77b9
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_end_script3
Func_039_5067:
	call Func_12e6
	ld a, [bc]
	ld de, Table_39_5074
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ret
Table_39_5074:
	db $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00
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
ScreenScript_39_512d:
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $03e0, $9000, BattleUIGFX_4e9a
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_load_bgpal_buf String_025_6129
	bs_load_objpal_buf String_025_6169
	bs_draw_mon_full $06, $93e0, $62, $6e
	bs_print_hp_2
	bs_clear_oam
	bs_draw_ab_42ba
	bs_print_text_xy String_025_6099, $a0, $fd
	bs_place_tile_attr $0000, Attrmap_4a_5905, Tilemap_4a_579b
	bs_print_hp
	bs_print_stats_2
	bs_lcd_on_loadpal
	bs_end_script
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
ScreenScript_39_5241:
	bs_draw_mon_full $06, $93e0, $62, $6e
	bs_print_hp_2
	bs_clear_oam
	bs_print_stats_2
	bs_draw_ab_42ba
	bs_end_script3
ScreenScript_39_524c:
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $0090, $9000, BattleUIGFX_4e9a
	bs_vram_copy3 $00a0, $9090, BattleUIGFX_483a
	bs_vram_copy3 $0140, $9130, BattleUIGFX_55da
	bs_vram_copy3 $0020, $8f80, BattleUIGFX_4e6a
	bs_farcopy_vram $39, $0080, $9270, GFX_039_4020
	bs_load_bgpal_buf String_025_6129
	bs_load_objpal_buf String_025_6169
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_draw_r_46af
	bs_draw_aa_434d $0c
	bs_clear_oam
	bs_set_sprite_pos $18, $10
	bs_lcd_on_loadpal
	bs_end_script
ScreenScript_39_5296:
	bs_place_tile_attr $0000, Tilemap_4a_5d45, Attrmap_4a_5dfb
	bs_draw_party_stats
	bs_end_script3
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
ScreenScript_39_536d:
	bs_draw_mon_full $06, $93e0, $62, $6e
	bs_print_hp_2
	bs_draw_ab_42ba
	bs_clear_bgbox_at $07, $11, $9822
	bs_draw_party_stats
	bs_end_script3
ScreenScript_39_537c:
	bs_place_tile_attr $0000, Attrmap_4a_5905, Tilemap_4a_579b
	bs_print_text_xy String_025_6099, $a0, $fd
	bs_draw_mon_full $06, $93e0, $62, $6e
	bs_print_hp_2
	bs_clear_oam
	bs_print_stats_2
	bs_end_script3
ScreenScript_39_5392:
	bs_draw_aa_434d $10
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_print_text_xy String_025_60db, $e4, $fd
	bs_place_tile_attr $0f06, Tilemap_4a_7ad3, Attrmap_4a_664b
	bs_set_sprite_pos $48, $86
	bs_end_script
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
ScreenScript_39_5468:
	bs_clear_bgbox_at $06, $05, $98cf
	bs_draw_aa_434d $1a
	bs_end_script3
ScreenScript_39_5470:
	bs_clear_bgbox_at $06, $05, $98cf
	bs_draw_aa_434d $11
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_draw_r_46af
	bs_draw_aa_434d $1a
	bs_select_menu $03
	bs_end_script3
ScreenScript_39_5484:
	bs_clear_bgbox_at $06, $05, $98cf
	bs_draw_aa_434d $12
	bs_draw_aa_434d $1a
	bs_select_menu $03
	bs_end_script3
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
ScreenScript_39_54fd:
	bs_clear_bgbox_at $0c, $14, $9800
	bs_print_text_xy String_025_61bf, $a8, $b0
	bs_print_text_xy String_025_61b6, $b0, $c0
	bs_place_tile_attr $0000, Tilemap_4a_79df, Attrmap_4a_7a59
	bs_place_tile_attr $0a00, Tilemap_4a_7963, Attrmap_4a_79a1
	bs_print_box_num
	bs_draw_box_markers
	bs_draw_aa_434d $1b
	bs_set_sprite_pos $18, $10
	bs_end_script
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
ScreenScript_39_55dd:
	bs_clear_bgbox_at $0a, $09, $9821
	bs_place_tile_attr $0000, Tilemap_4a_79df, Attrmap_4a_7a59
	bs_draw_box_markers
	bs_end_script3
ScreenScript_39_55eb:
	bs_draw_aa_434d $14
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_print_text_xy String_025_60db, $e4, $fd
	bs_place_tile_attr $0f06, Tilemap_4a_7ad3, Attrmap_4a_664b
	bs_set_sprite_pos $48, $86
	bs_end_script
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
ScreenScript_39_56b5:
	bs_clear_bgbox_at $06, $05, $98cf
	bs_draw_aa_434d $1b
	bs_end_script3
ScreenScript_39_56bd:
	bs_clear_bgbox_at $06, $05, $98cf
	bs_draw_aa_434d $15
	bs_place_tile_attr $0000, Tilemap_4a_79df, Attrmap_4a_7a59
	bs_print_text_xy String_025_61b6, $b0, $c0
	bs_place_tile_attr $0a00, Tilemap_4a_7963, Attrmap_4a_79a1
	bs_print_box_num
	bs_draw_box_markers
	bs_draw_aa_434d $1b
	bs_select_menu $07
	bs_end_script3
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
ScreenScript_39_5734:
	bs_draw_aa_434d $16
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_print_text_xy String_025_60db, $e4, $fd
	bs_place_tile_attr $0f06, Tilemap_4a_7ad3, Attrmap_4a_664b
	bs_set_sprite_pos $48, $86
	bs_end_script
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
ScreenScript_39_57f5:
	bs_clear_bgbox_at $06, $05, $98cf
	bs_draw_aa_434d $17
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_draw_r_46af
	bs_draw_aa_434d $1c
	bs_select_menu $03
	bs_end_script3
ScreenScript_39_5809:
	bs_clear_bgbox_at $06, $05, $98cf
	bs_draw_aa_434d $1c
	bs_end_script3
ScreenScript_39_5811:
	bs_clear_bgbox_at $09, $14, $9800
	bs_vram_copy3 $0080, $8980, BattleUIGFX_527a
	bs_place_tile_attr $0401, Tilemap_4a_606d, Attrmap_4a_60b7
	bs_print_equip_name
	bs_end_script3
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
ScreenScript_39_58dd:
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_print_hp
	bs_place_tile_attr $0401, Tilemap_4a_606d, Attrmap_4a_60b7
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_print_equip_name
	bs_end_script3
ScreenScript_39_58f5:
	bs_save_palbuf
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $0090, $9000, BattleUIGFX_4e9a
	bs_vram_copy3 $00a0, $9090, BattleUIGFX_483a
	bs_vram_copy3 $0140, $9130, BattleUIGFX_55da
	bs_vram_copy3 $0020, $8f80, BattleUIGFX_4e6a
	bs_farcopy_vram $39, $0080, $9270, GFX_039_4020
	bs_load_bgpal_buf String_025_6129
	bs_load_objpal_buf String_025_6169
	bs_place_tile_attr $0000, Tilemap_4a_7827, Attrmap_4a_78c5
	bs_place_tile_attr $000c, Tilemap_4a_7635, Tilemap_4a_74c7
	bs_draw_r_46af
	bs_draw_aa_434d $0c
	bs_clear_oam
	bs_set_sprite_pos $18, $10
	bs_lcd_on_loadpal
	bs_end_script
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


