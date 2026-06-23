Func_00a_4000::
	hlcoord 0, 0
	ld a, [wTextboxPos]
	and a
	jr nz, .backup_tilemap

	hlcoord 0, 10
.backup_tilemap
	ld a, l
	ld [wTextboxPointer], a
	ld a, h
	ld [wTextboxPointer + 1], a
	ld de, wScreenRowBuffer
	ld c, 8 * SCREEN_WIDTH
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

; Load textbox border tiles
	call DelayFrame
	ld hl, GFX_00a_4523
	ld de, $8a00
	ld bc, $70
	call CopyBytesVRAM

	call DelayFrame
	farcall Func_00d_4000

; Inefficient
	ld hl, wd1a0
	call Func_00a_405b
	ld hl, wd1a8
	call Func_00a_405b

	call LoadTextFaceGFX
	call DelayFrame
	call LoadTextFaceExtraSprites
	call DelayFrame
	ld hl, Tilemap_00a_42e3
	ld a, l
	ld [wdcd6], a
	ld a, h
	ld [wdcd6 + 1], a
	ret

Func_00a_405b:
	ld c, 8
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret

Func_00a_4063::
	ld a, $01
	ld [wTextboxPos], a
	ld hl, wTilemap
	ld a, [wVisibleObjects]
	cp $60
	jr nc, .asm_4079
	xor a
	ld [wTextboxPos], a
	hlcoord 0, 10
.asm_4079
	ld a, l
	ld [wTextboxPointer], a
	ld a, h
	ld [wTextboxPointer + 1], a
	ld de, wScreenRowBuffer
	ld c, $A0
.asm_4086
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_4086
	ld hl, GFX_00a_4523
	ld de, $8A00
	ld bc, $0070
	call CopyBytesVRAM
	call DelayFrame
	ld hl, GFX_00a_4423
	ld de, $8E00
	ld bc, Start
	call CopyBytesVRAM
	ld hl, Tilemap_00a_4383
	ld a, l
	ld [wdcd6], a
	ld a, h
	ld [wdcd6 + 1], a
	ret

Func_00a_40b3::
	ld a, $00
	ld [wd1e4], a
.asm_40b8
	call Func_00a_41fe
	call Func_00a_423b
	call Func_00a_4295
	ld a, [wTextboxPos]
	and a
	jr z, .asm_40cc
	ld hl, $0000
	jr .asm_40cf
.asm_40cc
	ld hl, $000A
.asm_40cf
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ld a, [wd1e4]
	inc a
	ld [wd1e4], a
	cp $02
	jr c, .asm_40b8
	ld de, wcbd0
	ld a, $18
	ld [de], a
	inc de
	ld a, $10
	ld [de], a
	inc de
	ld a, $02
	ld [de], a
	ld a, [wTextboxPos]
	and a
	ret nz
	ld a, $68
	ld [wcbd0], a
	ret

Func_00a_40f9:
	ld a, $13
	ld [wd1e4], a
.asm_40fe
	ld a, [wd1e4]
	cp $01
	jr z, .asm_4110
	call Func_00a_41b7
	call Func_00a_423b
	call Func_00a_425b
	jr .asm_4126
.asm_4110
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wScreenRowBuffer
	ld c, $A0
.asm_411d
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_411d
	call Func_00a_423b
.asm_4126
	ld a, [wTextboxPos]
	and a
	jr z, .asm_4131
	ld hl, $0000
	jr .asm_4134
.asm_4131
	ld hl, $000A
.asm_4134
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ld a, [wd1e4]
	dec a
	ld [wd1e4], a
	and a
	jr nz, .asm_40fe
	ret

Func_00a_4145:
	call Func_00a_41a3
	call Func_00a_423b
	ld a, [wTextboxPos]
	and a
	jr z, .asm_4156
	ld hl, $0000
	jr .asm_4159
.asm_4156
	ld hl, $000A
.asm_4159
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ld de, wcbd0
	ld a, $18
	ld [de], a
	inc de
	ld a, $10
	ld [de], a
	inc de
	ld a, $02
	ld [de], a
	ld a, [wTextboxPos]
	and a
	ret nz
	ld a, $68
	ld [wcbd0], a
	ret

Func_00a_4178::
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wScreenRowBuffer
	ld c, $A0
.asm_4185
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_4185
	call Func_00a_423b
	ld a, [wTextboxPos]
	and a
	jr z, .asm_4199
	ld hl, $0000
	jr .asm_419c
.asm_4199
	ld hl, $000A
.asm_419c
	call GetTextBGMapPointer
	call CopyTextboxToVRAM
	ret

Func_00a_41a3:
	ld de, Tilemap_00a_42e3
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld c, $A0
.asm_41b0
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_41b0
	ret

Func_00a_41b7:
	ld de, wScreenRowBuffer
	ld a, [wd1e4]
	ld l, a
	ld h, $00
	push hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	pop hl
	add hl, bc
	ld c, $08
	call Func_00a_4223
	ret

.asm_41d4
	push hl
	ld de, wd100
	ld a, $14
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, $08
	ld c, a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	pop hl
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	ld a, $14
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, $08
	ld c, a
	ld [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

Func_00a_41fe:
	ld a, [wdcd6]
	ld e, a
	ld a, [wdcd6 + 1]
	ld d, a
	ld a, [wd1e4]
	add a
	ld b, a
	add a
	add a
	add b
	ld l, a
	ld h, $00
	push hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	pop hl
	add hl, bc
	ld c, $08
Func_00a_4221:
	ld b, $0A
Func_00a_4223:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, Func_00a_4223
	push bc
	ld bc, $000A
	add hl, bc
	ld a, e
	add $0A
	ld e, a
	ld a, d
	adc $00
	ld d, a
	pop bc
	dec c
	jr nz, Func_00a_4221
	ret
Func_00a_423b:
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wd100
	ld c, $A0
.asm_4248
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
	jr nz, .asm_4248
	ret

Func_00a_425b:
	ld a, [wd1e4]
	dec a
	ld l, a
	ld h, $00
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	add hl, bc
	ld de, unk_00a_42db
	ld c, $08
.asm_4270
	push bc
	ld bc, $0014
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4270
	ld a, [wd1e4]
	dec a
	ld l, a
	ld h, $00
	ld bc, wd100
	add hl, bc
	ld c, $08
.asm_4289
	push bc
	ld bc, $0014
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4289
	ret

Func_00a_4295:
	ld a, [wd1e4]
	and a
	ret nz
	inc a
	add a
	ld b, a
	add a
	add a
	add b
	ld l, a
	ld h, $00
	ld a, [wTextboxPointer]
	ld c, a
	ld a, [wTextboxPointer + 1]
	ld b, a
	add hl, bc
	ld de, unk_00a_42db
	ld c, $08
.asm_42b1
	push bc
	ld bc, $0014
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_42b1
	ld a, [wd1e4]
	inc a
	add a
	ld b, a
	add a
	add a
	add b
	ld l, a
	ld h, $00
	ld bc, wd100
	add hl, bc
	ld c, $08
.asm_42cf
	push bc
	ld bc, $0014
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_42cf
	ret

; TODO: unk_ - data, referenced via `ld de, unk_00a_42db`
unk_00a_42db:
	db $a3, $a4, $a4, $a4, $a4, $a4, $a4, $a6

Tilemap_00a_42e3:
	INCBIN "gfx/tilemaps/tilemap_00a_42e3.tilemap"
Tilemap_00a_4383:
	INCBIN "gfx/tilemaps/tilemap_00a_4383.tilemap"
; TODO: tilemap copied to VRAM $8E00
GFX_00a_4423:
	db $11, $11, $11, $11, $1f, $1f, $11, $11, $21, $21, $01, $01, $ff, $ff, $00, $00
	db $1f, $1f, $10, $10, $10, $10, $10, $10, $1f, $1f, $10, $10, $00, $00, $00, $00
	db $00, $00, $10, $10, $f8, $f8, $00, $00, $00, $00, $04, $04, $fe, $fe, $10, $10
	db $f8, $f8, $10, $10, $10, $10, $10, $10, $f0, $f0, $10, $10, $00, $00, $00, $00
	db $00, $00, $3f, $3f, $00, $00, $00, $00, $00, $00, $ff, $ff, $01, $01, $11, $11
	db $31, $31, $41, $41, $81, $81, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00
	db $10, $10, $f8, $f8, $00, $00, $00, $00, $04, $04, $fe, $fe, $00, $00, $20, $20
	db $10, $10, $0c, $0c, $04, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $10, $10, $11, $11, $11, $11, $fd, $fd, $11, $11, $31, $31, $39, $39, $55, $55
	db $51, $51, $91, $91, $12, $12, $14, $14, $18, $18, $13, $13, $00, $00, $00, $00
	db $04, $04, $fe, $fe, $00, $00, $00, $00, $fc, $fc, $04, $04, $84, $84, $48, $48
	db $48, $48, $50, $50, $20, $20, $50, $50, $8e, $8e, $04, $04, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $01, $01, $03, $03, $01, $01, $00, $00, $00, $00
	db $01, $01, $03, $03, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $80, $80, $c0, $c0, $80, $80, $00, $00, $00, $00
	db $80, $80, $c0, $c0, $80, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
; TODO: data/gfx block (zeros + tile-like bytes), exact use TBD
GFX_00a_4523:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $07, $03, $0d, $04, $1a, $09, $35, $13, $3b, $27, $27, $3f, $26, $3e
	db $00, $00, $ff, $ff, $00, $ff, $00, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00
	db $00, $00, $f0, $e0, $38, $f0, $dc, $38, $ae, $9c, $d6, $ce, $66, $6e, $36, $2e
	db $26, $3e, $26, $3e, $26, $3e, $26, $3e, $26, $3e, $26, $3e, $26, $3e, $26, $3e
	db $33, $2f, $35, $33, $3a, $19, $1d, $0c, $0f, $07, $07, $03, $00, $00, $00, $00
	db $56, $6e, $8e, $de, $9e, $3c, $3c, $f8, $f8, $f0, $f0, $e0, $00, $00, $00, $00

asm_00a_4593::
	ld bc, $c0
	ld hl, $9610
	xor a
	call ByteFillVRAM
	ld a, $61
	ld [wMenuTextX], a
	ld a, $6d
	ld [wMenuTextEndX], a
	ld a, [wEnemyMonSpecies]
	ld [wd9d8], a
	farcall asm_026_4616
	ret

asm_00a_45b4:
	ld bc, wd86a
	ld de, NamePointers
	ld a, [wd9dd]
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

asm_00a_45c6:
	ld a, [hli]
	ld [bc], a
	inc bc
	cp $ed
	jr nz, asm_00a_45c6
	ret

Func_00a_45ce:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_45e1

	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, .asm_45e1

	ld a, $2b
	jr .asm_45e4

.asm_45e1:
	ld a, [wSelectedOption]

.asm_45e4:
	ld bc, wd86a
	ld de, NamePointers
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_45f3
	ld a, [hli]
	ld [bc], a
	inc bc
	cp TX_LINE
	jr nz, .asm_45f3
	ret

INCLUDE "data/name_pointers.asm"
INCLUDE "data/text/names.asm"
