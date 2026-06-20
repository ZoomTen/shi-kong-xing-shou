Func_00d_4000::
	ld hl, PaperEmotesTiles
	ld de, $8540
	ld bc, $0140
	call CopyBytesVRAM
	ld hl, ContinueBlinkerTiles
	ld de, $8680
	ld bc, $0080
	call CopyBytesVRAM
	ret

Func_00d_4019::
	call .asm_4089
	call .asm_4020
	ret
.asm_4020
	call DelayFrame
	ldh a, [hJoypadPressed]
	bit 0, a
	jr nz, .asm_4032
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	cp $7F
	jr c, .asm_4020
.asm_4032
	call Func_00d_412c
	xor a
	ld [hScrollNumber], a
	ret

.asm_403a
	ld a, $98
	ld [wBGMapAddr + 1], a
	ld a, $00
	ld [wBGMapAddr], a
	ld hl, wTilemap
	ld de, wMapTileAttrs
	ld a, $01
	ldh [rVBK], a
	ld b, $12
.asm_4050
	ld c, $14
.asm_4052
	ld a, [hli]
	push hl
	ld l, a
	ld h, $00
	add hl, de
	push de
	ld a, [wBGMapAddr + 1]
	ld d, a
	ld a, [wBGMapAddr]
	ld e, a
.asm_4061
	ldh a, [$FF41]
	and $03
	jr nz, .asm_4061
	ld a, [hli]
	ld [de], a
	pop de
	ld hl, wBGMapAddr
	inc [hl]
	pop hl
	dec c
	jr nz, .asm_4052
	ld a, [wBGMapAddr]
	add $0C
	ld [wBGMapAddr], a
	ld a, [wBGMapAddr + 1]
	adc $00
	ld [wBGMapAddr + 1], a
	dec b
	jr nz, .asm_4050
	xor a
	ldh [rVBK], a
	ret
.asm_4089
	hlcoord 0, 6
	ld de, wcb30
	ld c, $50
.asm_4091
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_4091
	ld hl, PaperScrollTiles
	ld de, $8A00
	ld bc, $0050
	call CopyBytesVRAM
	call DelayFrame
	xor a
	ld [wCharacterTilePos], a
	ld de, Pointers_00d_437a
	ldh a, [hScrollNumber]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
Func_00d_40b8:
	pop hl
	ld a, [hli]
	push hl
	cp $F0
	jp nc, Func_00d_42a4
	cp $ED
	jp z, .asm_40cb
	call RequestLoadCharacter_PaperScroll
	jp Func_00d_40b8
.asm_40cb
	pop hl
	ld a, [hli]
	ld de, Pointers_00d_42a0
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wdcd6], a
	ld e, a
	ld a, [hli]
	ld [wdcd6 + 1], a
	ld d, a
	call .asm_40e3
	ret
.asm_40e3
	xor a
	ld [wd1e4], a
.asm_40e7
	call Func_00d_4193
	call Func_00d_41c0
	call Func_00d_4212
	call Func_00d_40ff
	ld a, [wd1e4]
	inc a
	ld [wd1e4], a
	cp $0A
	jr c, .asm_40e7
	ret
Func_00d_40ff:
	ld hl, $98C0
	ld de, wd100
	ld bc, $1404
	ld a, b
	ldh [hVRAMCopyWidth], a
	ld a, c
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld hl, $98C0
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	decoord 0, 6
	ld bc, $1404
	ld a, b
	ldh [hVRAMCopyWidth], a
	ld a, c
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret
Func_00d_412c:
	ld a, $09
	ld [wd1e4], a
.asm_4131
	ld a, [wd1e4]
	cp $01
	jr z, .asm_4143
	call .asm_4165
	call Func_00d_41c0
	call Func_00d_41db
	jr .asm_4154
.asm_4143
	hlcoord 0, 6
	ld de, wcb30
	ld c, $50
.asm_414b
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_414b
	call Func_00d_41c0
.asm_4154
	call Func_00d_40ff
	call DelayFrame
	ld a, [wd1e4]
	dec a
	ld [wd1e4], a
	and a
	jr nz, .asm_4131
	ret
.asm_4165
	ld de, wcb30
	ld a, [wd1e4]
	add $05
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	bccoord 5, 6
	ld a, [wd1e4]
	ld l, a
	ld h, $00
	add hl, bc
	ld c, $04
.asm_417f
	push bc
	ld bc, $0014
	ld a, [de]
	ld [hl], a
	add hl, bc
	ld a, e
	add $14
	ld e, a
	ld a, d
	adc $00
	ld d, a
	pop bc
	dec c
	jr nz, .asm_417f
	ret
Func_00d_4193:
	ld a, [wdcd6]
	ld e, a
	ld a, [wdcd6 + 1]
	ld d, a
	ld a, [wd1e4]
	ld l, a
	ld h, $00
	push hl
	add hl, de
	ld e, l
	ld d, h
	bccoord 5, 6
	pop hl
	add hl, bc
	ld c, $04
.asm_41ac
	push bc
	ld bc, $0014
	ld a, [de]
	ld [hl], a
	add hl, bc
	ld a, e
	add $0A
	ld e, a
	ld a, d
	adc $00
	ld d, a
	pop bc
	dec c
	jr nz, .asm_41ac
	ret
Func_00d_41c0:
	hlcoord 0, 6
	ld de, wd100
	ld c, $50
.asm_41c8
	ld a, [hli]
	push hl
	ld hl, wMapTileAttrs
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, .asm_41c8
	ret
Func_00d_41db:
	ld a, [wd1e4]
	dec a
	ld l, a
	ld h, $00
	bccoord 5, 6
	add hl, bc
	ld de, unk_00d_424c
	ld c, $04
.asm_41eb
	push bc
	ld bc, $0014
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_41eb
	ld a, [wd1e4]
	dec a
	add $05
	ld l, a
	ld h, $00
	ld bc, wd100
	add hl, bc
	ld c, $04
.asm_4206
	push bc
	ld bc, $0014
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4206
	ret
Func_00d_4212:
	ld a, [wd1e4]
	cp $09
	ret z
	inc a
	ld l, a
	ld h, $00
	bccoord 5, 6
	add hl, bc
	ld de, unk_00d_424c
	ld c, $04
.asm_4225
	push bc
	ld bc, $0014
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4225
	ld a, [wd1e4]
	inc a
	add $05
	ld l, a
	ld h, $00
	ld bc, wd100
	add hl, bc
	ld c, $04
.asm_4240
	push bc
	ld bc, $0014
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4240
	ret

; TODO: 4-byte row-fill tile IDs, read column-by-column (Func_00d_41db/Func_00d_4212)
unk_00d_424c:
	db $a1, $a3, $a3, $a4
; TODO: font/character tiles copied to VRAM $8A00
PaperScrollTiles:
	INCBIN "gfx/paper_scroll/tiles_4250.2bpp"
; TODO: source pointers for the two paper layouts, indexed *2
Pointers_00d_42a0:
	dw BGMap_00d_432a, BGMap_00d_4352

Func_00d_42a4:
	and $0F
	push af
	srl a
	add $40
	ld [hTargetBank], a
	pop af
	bit 0, a
	jr nz, .asm_42b7
	ld a, $40
	jr .asm_42b9
.asm_42b7
	ld a, $60
.asm_42b9
	ld [wdcd1 + 1], a
	xor a
	ld [wdcd1], a
	jp Func_00d_40b8

.asm_42c3
	ld a, $01
	ldh [rVBK], a
	jp .asm_42ce

.asm_42ca
	ld a, $00
	ldh [rVBK], a
.asm_42ce
	push hl
.asm_42cf
	ld a, [de]
	push bc
	ld c, a
.asm_42d2
	ldh a, [$FF41]
	and $03
	jr nz, .asm_42d2
	ld a, c
	ld [hl], a
	inc l
	xor a
	adc $00
	ld c, a
	ld a, l
	and $0F
	jr nz, .asm_42ec
	ld a, l
	bit 4, a
	jr nz, .asm_42ec
	sub $20
	ld l, a
.asm_42ec
	inc de
	pop bc
	dec b
	jr nz, .asm_42cf
	pop hl
	push bc
	ld bc, Bankswitch
	add hl, bc
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, .asm_42ce
	xor a
	ldh [rVBK], a
	ret

; TODO: attribute map for the paper area
unk_00d_4302:
	db $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $80, $80, $80, $80, $80
	db $80, $80, $80, $86, $86, $80, $80, $80, $80, $80, $80, $80, $80, $86, $86, $86
	db $86, $86, $86, $86, $86, $86, $86, $86
; TODO: paper layout A (tilemap source for Func_00d_4193)
BGMap_00d_432a:
	db $a1, $a2, $a2, $a2, $a2, $a2, $a2, $a2, $a2, $a1, $a3, $a8, $aa, $ac, $ae, $b0
	db $b2, $b4, $b6, $a3, $a3, $a9, $ab, $ad, $af, $b1, $b3, $b5, $b7, $a3, $a4, $a2
	db $a2, $a2, $a2, $a2, $a2, $a2, $a2, $a4
; TODO: paper layout B
BGMap_00d_4352:
	db $a1, $a2, $a2, $a2, $a2, $a2, $a2, $a2, $a2, $a1, $a3, $a8, $aa, $a0, $ac, $ae
	db $a0, $b0, $b2, $a3, $a3, $a9, $ab, $a0, $ad, $af, $a0, $b1, $b3, $a3, $a4, $a2
	db $a2, $a2, $a2, $a2, $a2, $a2, $a2, $a4
; TODO: paper-scroll script pointer table, indexed by hScrollNumber *2
Pointers_00d_437a:
	dw $43c2, $43c2, $43c8, $43cf, $43d5, $43dc, $43e3, $43e9
	dw $43ef, $43f6, $43fd, $4404, $440b, $4412, $4418, $441e
	dw $4426, $442e, $4434, $443c, $4445, $444e, $4457, $4460
	dw $446a, $4472, $447a, $4482, $448b, $4494, $449d, $44a5
	dw $44ae, $44b6, $44be, $44c7
; TODO: paper-scroll scripts (F0/ED character command lists)
Script_00d_43c2:
	db $f0, $26, $27, $28, $ed, $01, $f0, $29, $00, $00, $2a, $ed, $00, $f0, $2b, $0a
	db $2c, $ed, $01, $f0, $2d, $00, $00, $2e, $ed, $00, $f0, $2f, $30, $18, $31, $ed
	db $00, $f0, $19, $32, $33, $ed, $01, $f0, $34, $31, $35, $ed, $01, $f0, $34, $36
	db $18, $31, $ed, $00, $f0, $37, $38, $39, $3a, $ed, $00, $f0, $3b, $3c, $18, $31
	db $ed, $00, $f0, $37, $38, $39, $3d, $ed, $00, $f0, $3e, $3f, $18, $31, $ed, $00
	db $f0, $40, $41, $42, $ed, $01, $f0, $43, $44, $45, $ed, $01, $f3, $68, $f0, $57
	db $f6, $2e, $ed, $01, $f4, $24, $f3, $d3, $f2, $1c, $ed, $01, $f0, $26, $54, $39
	db $ed, $01, $f4, $b4, $f1, $1b, $f4, $cf, $ed, $01, $f0, $4a, $f4, $8d, $f0, $18
	db $31, $ed, $00, $f3, $c2, $f0, $00, $00, $f3, $d9, $ed, $00, $f0, $60, $f3, $c2
	db $f0, $3d, $31, $ed, $00, $f6, $89, $4f, $f0, $37, $f4, $be, $ed, $00, $f2, $c5
	db $f1, $2e, $f0, $2a, $f2, $a8, $ed, $00, $f1, $dc, $f3, $48, $f2, $1c, $ed, $01
	db $f2, $c4, $f0, $39, $f2, $c5, $ed, $01, $f0, $26, $00, $00, $f4, $bb, $ed, $00
	db $f4, $08, $f0, $00, $00, $f4, $bb, $ed, $00, $f1, $1f, $f0, $00, $00, $f4, $c9
	db $ed, $00, $f6, $a8, $f0, $00, $00, $f4, $4f, $ed, $00, $f7, $2c, $f5, $9d, $f6
	db $31, $ed, $01, $f4, $4d, $f0, $00, $00, $f7, $49, $ed, $00, $f6, $b5, $f7, $34
	db $f6, $50, $ed, $01, $f2, $39, $f3, $3a, $f0, $31, $ed, $01, $f4, $08, $f3, $d9
	db $f0, $68, $31, $ed, $00, $f7, $40, $f1, $90, $f0, $31, $ed, $01
; TODO: paper tiles copied to VRAM $8540
PaperEmotesTiles:
	INCBIN "gfx/paper_scroll/tiles_44cf.2bpp"
; TODO: extra tiles, not copied by Func_00d_4000 (referenced elsewhere?)
LightbulbEmoteTiles:
	INCBIN "gfx/paper_scroll/tiles_460f.2bpp"
; TODO: paper tiles copied to VRAM $8680
ContinueBlinkerTiles:
	INCBIN "gfx/paper_scroll/tiles_464f.2bpp"
	db $00

