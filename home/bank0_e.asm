
LoadMapAttrs::
; load map attribute pointer
	ldh a, [hMapAttrBank]
	rst Bankswitch
	ld a, [wMapAttrPointer]
	ld l, a
	ld a, [wMapAttrPointer + 1]
	ld h, a

; map size
	ld de, hMapWidth
	ld a, [hli]
	ld [de], a
	inc de ; hMapHeight
	ld a, [hli]
	ld [de], a

; copy map attribute data
	ld de, wMapAttributes
	ld c, $12
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

; load map layout?
	ld a, $98
	ld [wd0ba + 1], a
	ld a, $00
	ld [wd0ba], a
	ldh a, [hMapWidth]
	add a
	sub 10
	ldh [hFFA8], a
	ldh a, [hMapHeight]
	add a
	sub 9
	ldh [hFFA9], a
	ld a, [wd9d2]
	and a
	jr z, .asm_2473

	ldh a, [hFFAA]
	jr .asm_2478

.asm_2473
	ldh a, [hMapOffsetX]
	add a
	ldh [hFFAA], a

.asm_2478
	ld l, a
	ld h, 0
REPT 4
	sla l
	rl h
ENDR
	ld a, l
	ld [wd0c6], a
	ld a, h
	ld [wd0c6 + 1], a
	ld a, [wd9d2]
	and a
	jr z, .asm_249d

	ldh a, [hFFAB]
	jr .asm_24a2

.asm_249d
	ldh a, [hMapOffsetY]
	add a
	ldh [hFFAB], a

.asm_24a2
	ld l, a
	ld h, 0
REPT 4
	sla l
	rl h
ENDR
	ld a, l
	ld [wd0c4], a
	ld a, h
	ld [wd0c4 + 1], a
	ret

Func_24be::
	call Func_257c
	call Func_24d1
	call Func_24e6
	call Func_2529
	call Func_26e1
	call Func_254a
	ret

Func_24d1::
	ld a, [wd0f4]
	and a
	ret z
	cp 5
	ret z

	homecall Func_01e_41bf
	ret

Func_24e6::
	ld a, [hMapGroup]
	cp 1
	ret nz

	ld a, [hMapNumber]
	cp $23
	jr z, .asm_2504
	cp $24
	jr z, .asm_2504
	cp $25
	jr z, .asm_2504
	cp $26
	jr z, .asm_2504
	cp $27
	jr z, .asm_2504
	ret

.asm_2504
	ld a, [wd0f4]
	cp 1
	jr z, .asm_251c
	cp 2
	jr z, .asm_251c
	cp 3
	jr z, .asm_251c
	cp 4
	jr z, .asm_251c
	cp 5
	jr z, .asm_251c
	ret

.asm_251c
	homecall Func_01e_4194
	ret

Func_2529::
	ld hl, wMapLayout
	ldh a, [hMapOffsetY]
	ld b, a
	and a
	jr z, .skip

	ldh a, [hMapWidth]
	ld e, a
	ld d, 0
.asm_2537
	add hl, de
	dec b
	jr nz, .asm_2537

.skip
	ldh a, [hMapOffsetX]
	ld e, a
	ld d, 0
	add hl, de
	ld a, l
	ld [wMapLayoutPointer], a
	ld a, h
	ld [wMapLayoutPointer + 1], a
	ret

Func_254a::
	ld a, [wMapGBCAttrPointer]
	ld l, a
	ld a, [wMapGBCAttrPointer + 1]
	ld h, a
	ld de, wce00
.asm_2555
	ld a, [hli]
	cp $ff
	jr z, .asm_255e
	ld [de], a
	inc de
	jr .asm_2555

.asm_255e
	call Func_2c03
	ld a, [wMapCollisionsPointer]
	ld l, a
	ld a, [wMapCollisionsPointer + 1]
	ld h, a
	ld de, wcf00
	ld a, e
	ld [wMapCollisionsPointer], a
	ld a, d
	ld [wMapCollisionsPointer + 1], a
.asm_2574
	ld a, [hli]
	cp $ff
	ret z
	ld [de], a
	inc de
	jr .asm_2574

Func_257c::
	ld a, [wMapLayoutPointer]
	ld l, a
	ld a, [wMapLayoutPointer + 1]
	ld h, a
	ld a, [hli]
	ld [wd0f4], a
	ld de, wMapLayout
	ldh a, [hMapHeight]
	ld b, a
.asm_258e
	ldh a, [hMapWidth]
	ld c, a
.asm_2591
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2591
	dec b
	jr nz, .asm_258e
	ret

Func_259b::
	call Func_0a0a
	call Func_0b1b
	ret

Func_25a2::
	call Func_0a0a
	call Func_0a46
	ret

LoadTilesetHeader::
; always from bank 06
	ld a, BANK(Tilesets)
	rst Bankswitch

	ld a, [wMapTileset2Pointer]
	ld l, a
	ld a, [wMapTileset2Pointer + 1]
	ld h, a
.load_tileset
	ld a, [hli]
	cp -1
	ret z

; load params for CopyBytesVRAM
; bank
	ld [wTilesetBank], a
; location
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
; byte count
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
; GFX address
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
; load tileset to VRAM
	ld a, [wTilesetBank]
	rst Bankswitch
	call CopyBytesVRAM
	pop hl
	inc hl
; bankswitch back
	ld a, BANK(Tilesets)
	rst Bankswitch
	jp .load_tileset ; jr

Func_25d6::
	ld a, [wLoadedROMBank]
	push af
	ld hl, wdae3
	ld e, [hl]
	inc hl
.asm_25df
	ld a, l
	cp e
	jr nc, .asm_25ed

	ld a, [hli]
	push hl
	push de
	call Func_263e
	pop de
	pop hl
	jr .asm_25df

.asm_25ed
	pop af
	rst Bankswitch

.asm_25ef
	ld a, $e4
	ld [wdae3], a
	ret

Func_25f5::
	xor a
	ld [wdae2], a
	jr Func_25d6.asm_25ef

Func_25fb::
	cp $7f
	ret nc
	or a
	jr nz, Func_2612

; SoundID == 0
	call Func_25f5
	xor a
	call Func_2612
	push hl
	push de
	push bc
	call Func_25d6
	pop bc
	pop de
	pop hl
	ret

Func_2612::
	push hl
	ld hl, wdae2
	bit 0, [hl]
	jr z, .asm_261e
	cp $53
	jr c, .exit

.asm_261e
	ld hl, wdae3
	ld l, [hl]
	ld [hl], a
	ld l, LOW(wdae3)
	ld a, [hl]
	cp LOW(wdaeb)
	jr nc, .exit
	inc [hl]

.exit
	pop hl
	ret

Func_262d::
	call Func_25f5
	ld a, [wLoadedROMBank]
	push af
	ld a, [wd091]
	rst Bankswitch
	call $4006
	pop af
	rst Bankswitch
	ret

Func_263e::
; Load sound bank?
	ld e, a
	cp $53
	jr c, .asm_2677
	cp $65
	jr c, .asm_2657
	cp $6d
	jr c, .asm_265b
	cp $76
	jr c, .asm_2653

	ld a, $1d
	jr .asm_265d

.asm_2653
	ld a, $1d
	jr .asm_265d

.asm_2657
	ld a, $02
	jr c, .asm_265d ; jr

.asm_265b
	ld a, $03

.asm_265d
	ld hl, wd091
	cp [hl]
	jr z, .asm_2672

	ld d, a
	push de
	ld e, 0
	ld a, [wd091]
	call .asm_2672
	pop de
	ld a, d
	ld [wd091], a

.asm_2672
	rst Bankswitch
	ld a, e
	jp $4003

.asm_2677
	ld a, [wd091]
	jr .asm_2672

Func_267c::
	ldh a, [rLCDC]
	bit 7, a ; LCDCF_ON
	ret z
	call Func_25d6
	ei
	xor a
	ld [hVBlank], a
.asm_2689
	halt
	ld a, [hVBlank]
	or a
	jr z, .asm_2689
	ret

unk_2691::
	ds $40, 0

WaitVRAM_STAT2::
; Copy of WaitVRAM_STAT
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT2

CopyBytes2::
; Copy bc bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Func_26e1::
	ldh a, [hMapAttrBank]
	rst Bankswitch
	ld hl, wc740
	ld a, l
	ld [wd0b2], a
	ld a, h
	ld [wd0b2 + 1], a
	ld a, [wMapLayoutPointer]
	ld l, a
	ld a, [wMapLayoutPointer + 1]
	ld h, a
	ld b, 5
.asm_26f9
	ld c, 6
.asm_26fb
	push bc
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	ld a, [wMapBlocksPointer]
	ld e, a
	ld a, [wMapBlocksPointer + 1]
	ld d, a
	add hl, hl
	add hl, hl
	add hl, de
	ld b, 2
.asm_270e
	ld c, 2
.asm_2710
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld a, [wMapMetatilesPointer]
	ld e, a
	ld a, [wMapMetatilesPointer + 1]
	ld d, a
	add hl, de
	ld a, [wd0b2]
	ld e, a
	ld a, [wd0b2 + 1]
	ld d, a
	call Func_278b
	ld a, [wd0b2]
	add 2
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	pop hl
	dec c
	jp nz, .asm_2710
	dec b
	jr z, .asm_2756

	ld a, [wd0b2]
	add $2c
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	jp .asm_270e

.asm_2756
	ld a, [wd0b2]
	sub $30
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	sbc 0
	ld [wd0b2 + 1], a
	pop hl
	pop bc
	dec c
	jp nz, .asm_26fb

	ldh a, [hMapWidth]
	sub 6
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [wd0b2]
	add $48
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	dec b
	jp nz, .asm_26f9
	ret

Func_278b::
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a

; add de, $17
	ld a, e
	add $17
	ld e, a
	ld a, d
	adc 0
	ld d, a

	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret
