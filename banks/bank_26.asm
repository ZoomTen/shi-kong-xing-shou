Func_026_4000::
	ld de, MoveName_Pointers
	ld a, [wd9d8]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

Func_026_4012::
	ld a, [wd0c0]
	add a
	add a
	add a
	add a
	add $A0
	ld [wMenuTextX], a
	ld a, $FD
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	ld de, MoveName_Pointers
	ld a, [wd9d8]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ld de, Pointers_026_40da
	ld a, [wd0c0]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [wd1f2], a
	ld a, h
	ld [wd1f3], a
	call GetTextBGMapPointer
	ld bc, $0803
	ld a, $08
	ld [hVRAMCopyWidth], a
	ld a, $03
	ld [hVRAMCopyHeight], a
	push hl
	ld de, Pointers_026_4072
	ld a, [wd0c0]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	call PlaceTilemap
	ret

; TODO: tilemap-record pointers for the move box, indexed by wd0c0 (slot 0-3)
Pointers_026_4072::
	dw Tilemap_026_407a
	dw Tilemap_026_4092
	dw Tilemap_026_40aa
	dw Tilemap_026_40c2

; TODO: 4x4 tile arrangements for the move box (16 tiles + 8-byte trailer each)
Tilemap_026_407a::
	db $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af
	db $00, $00, $00, $00, $00, $16, $00, $00

Tilemap_026_4092::
	db $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf
	db $00, $00, $00, $00, $00, $16, $00, $00

Tilemap_026_40aa::
	db $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf
	db $00, $00, $00, $00, $00, $16, $00, $00

Tilemap_026_40c2::
	db $d0, $d2, $d4, $d6, $d8, $da, $dc, $de, $d1, $d3, $d5, $d7, $d9, $db, $dd, $df
	db $00, $00, $00, $00, $00, $16, $00, $00

; TODO: move-box BG-map position pairs, indexed by wd0c0 (slot 0-3)
Pointers_026_40da::
	db $01, $02
	db $01, $0b
	db $05, $02
	db $05, $0b

MoveName_Pointers::
	dw text_26_4200
	dw text_26_4200
	dw text_26_4205
	dw text_26_420c
	dw text_26_4213
	dw text_26_421a
	dw text_26_4221
	dw text_26_4227
	dw text_26_422e
	dw text_26_4235
	dw text_26_423b
	dw text_26_4241
	dw text_26_4248
	dw text_26_424f
	dw text_26_4256
	dw text_26_425d
	dw text_26_4263
	dw text_26_426a
	dw text_26_4270
	dw text_26_4277
	dw text_26_427e
	dw text_26_4284
	dw text_26_428a
	dw text_26_4290
	dw text_26_4297
	dw text_26_429e
	dw text_26_42a5
	dw text_26_42ac
	dw text_26_42b3
	dw text_26_42ba
	dw text_26_42c1
	dw text_26_42c7
	dw text_26_42ce
	dw text_26_42d4
	dw text_26_42da
	dw text_26_42e0
	dw text_26_42e7
	dw text_26_42ee
	dw text_26_42f5
	dw text_26_42fc
	dw text_26_4302
	dw text_26_4308
	dw text_26_430f
	dw text_26_4316
	dw text_26_431d
	dw text_26_4324
	dw text_26_432a
	dw text_26_4331
	dw text_26_4338
	dw text_26_433f
	dw text_26_4345
	dw text_26_434c
	dw text_26_4353
	dw text_26_435a
	dw text_26_4360
	dw text_26_4367
	dw text_26_436d
	dw text_26_4374
	dw text_26_437b
	dw text_26_4381
	dw text_26_4388
	dw text_26_438f
	dw text_26_4396
	dw text_26_439c
	dw text_26_43a2
	dw text_26_43a9
	dw text_26_43af
	dw text_26_43b5
	dw text_26_43bb
	dw text_26_43c1
	dw text_26_43c7
	dw text_26_43ce
	dw text_26_43d4
	dw text_26_43db
	dw text_26_43e1
	dw text_26_43e8
	dw text_26_43ef
	dw text_26_43f6
	dw text_26_43fc
	dw text_26_4403
	dw text_26_4409
	dw text_26_440f
	dw text_26_4416
	dw text_26_441d
	dw text_26_4424
	dw text_26_442b
	dw text_26_4431
	dw text_26_4438
	dw text_26_443f
	dw text_26_4446
	dw text_26_444c
	dw text_26_4453
	dw text_26_4459
	dw text_26_445f
	dw text_26_4465
	dw text_26_446c
	dw text_26_4473
	dw text_26_4479
	dw text_26_447f
	dw text_26_4485
	dw text_26_448b
	dw text_26_4491
	dw text_26_4497
	dw text_26_449d
	dw text_26_44a3
	dw text_26_44aa
	dw text_26_44b1
	dw text_26_44b7
	dw text_26_44bd
	dw text_26_44c3
	dw text_26_44c9
	dw text_26_44cf
	dw text_26_44d7
	dw text_26_44de
	dw text_26_44e4
	dw text_26_44ec
	dw text_26_44f3
	dw text_26_44fb
	dw text_26_4502
	dw text_26_450b
	dw text_26_4513
	dw text_26_451a
	dw text_26_4521
	dw text_26_4528
	dw text_26_4530
	dw text_26_4537
	dw text_26_453e
	dw text_26_4545
	dw text_26_454d
	dw text_26_4555
	dw text_26_455d
	dw text_26_4565
	dw text_26_456d
	dw text_26_4575
	dw text_26_457d
	dw text_26_4585
	dw text_26_458d
	dw text_26_4594
	dw text_26_459b
	dw text_26_45a3
	dw text_26_45aa
	dw text_26_45aa
	dw text_26_45b2

INCLUDE "data/text/move_names.asm"

Func_026_45b9::
	ld a, [wd986]
	and a
	jr nz, .asm_45cf
	ld a, [wd9b5]
	and a
	jr nz, .asm_45d5
.asm_45c5
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr .asm_45dd
.asm_45cf
	ld a, [wd9b5]
	and a
	jr nz, .asm_45c5
.asm_45d5
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
.asm_45dd
	ld a, [bc]
	and a
	ret z
	cp $A0
	ret nc
	ld l, a
	ld h, $00
	add hl, hl
	ld de, MonNamePointers
	add hl, de
	ld a, [hli]
	ld [wd9d4], a
	ld a, [hli]
	ld [wd9d5], a
	ld a, $26
	ldh [hFFD4], a
	ret

Func_026_45f8::
	call GetPartyMonPtr
	ld a, [bc]
	and a
	ret z
	cp $A0
	ret nc
	ld l, a
	ld h, $00
	add hl, hl
	ld de, MonNamePointers
	add hl, de
	ld a, [hli]
	ld [wd9d4], a
	ld a, [hli]
	ld [wd9d5], a
	ld a, $26
	ldh [hFFD4], a
	ret

asm_026_4616::
	ld a, [wMenuTextX]
	swap a
	and $f0
	ld l, a
	ld a, [wMenuTextX]
	swap a
	and $f
	or $90
	ld h, a
	ld bc, $c0
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wd9d8]
	ld l, a
	and a
	ret z
	ld h, 0
	add hl, hl
	ld de, MonNamePointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

asm_026_464a::
	call GetBoxMonPtr
	jr asm_026_4652

asm_026_464f::
	call GetPartyMonPtr

asm_026_4652::
	ld a, [bc]
	and a
	ret z
	cp $a0
	ret nc
	ld l, a
	ld h, 0
	add hl, hl
	ld de, MonNamePointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wMenuTextX], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	push de
	pop hl
	call PrintMenuText
	ret

asm_026_4680::
	ld a, [wd0c0]
	ld l, a
	cp $a0
	ret nc
	ld h, 0
	add hl, hl
	ld de, MonNamePointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0c1]
	add a
	add a
	ld d, a
	add a
	add d
	add $80
	ld [wMenuTextX], a
	ld a, $e0
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Tilemap_026_46ab::
	db $27
	db $28
	db $29
	db $2a

asm_026_46af::
	xor a
	ld [wd0c1], a
	ld bc, wMonBox
	ld a, [wMonBoxIndex]
	and a
	jr z, asm_026_46c5

asm_026_46bc::
	ld hl, $13
	add hl, bc
	push hl
	pop bc
	dec a
	jr nz, asm_026_46bc

asm_026_46c5::
	push bc
	ld a, [bc]
	and a
	jr z, asm_026_4734
	inc bc
	ld e, c
	ld d, b
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9824
	add hl, bc
	ld bc, $0102
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld [wd0fd], a
	call PrintNumber
	pop bc
	push bc
	ld a, [bc]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, MonNamePointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0c1]
	add a
	add a
	ld d, a
	add a
	add d
	add $a8
	ld [wMenuTextX], a
	ld a, $e8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9822
	add hl, bc
	ld de, Tilemap_026_46ab
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap

asm_026_4734::
	pop bc
	ld hl, $13
	add hl, bc
	push hl
	pop bc
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 5
	jp c, asm_026_46c5
	ret

INCLUDE "data/monsters/name_pointers.asm"

INCLUDE "data/text/mon_names.asm"

Func_026_4c89::
	ld a, [wd9d9]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, MonsterPalettePointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	sla a
	sla a
	sla a
	ld bc, wPaletteBuffer
	ld l, a
	ld h, 0
	add hl, bc
	push de
	ld e, l
	ld d, h
	pop hl
	ld bc, 8
	call CopyBytes3
	ret

Func_026_4cb6::
	ld a, [wd9d9]
	ld l, a
	ld h, $00
	add hl, hl
	ld de, MonsterPalettePointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	sla a
	sla a
	sla a
	push af
	ld bc, wPaletteBuffer
	ld l, a
	ld h, $00
	add hl, bc
	push de
	ld e, l
	ld d, h
	pop hl
	ld bc, _hl_
	call CopyBytes3
	pop af
	add $80
	ld c, a
	pop hl
	ld b, $08
	call LoadPalettes_BCPD
	ret


; TODO: loads a monster's palette (indexed by wd9e5) into wPaletteBuffer
Func_026_4cef::
	ld a, [wd9e5]
	ld l, a
	ld h, $00
	add hl, hl
	ld de, MonsterPalettePointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld bc, wPaletteBuffer
	ld l, $30
	ld h, $00
	add hl, bc
	push de
	ld e, l
	ld d, h
	pop hl
	ld bc, _hl_
	call CopyBytes3
	ld a, $B0
	ld c, a
	pop hl
	ld b, $08
	call LoadPalettes_BCPD
	ret

Func_026_4d1b::
	ld a, [wd9e5]
	ld l, a
	ld h, $00
	add hl, hl
	ld de, MonsterPalettePointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld bc, wPaletteBuffer
	ld l, $30
	ld h, $00
	add hl, bc
	push de
	ld e, l
	ld d, h
	pop hl
	ld bc, _hl_
	call CopyBytes3
	ld a, $B0
	ld c, a
	pop hl
	ld b, $08
	call LoadPalettes_BCPD
	ret

Func_026_4d47::
	ld a, [wEnemyMonSpecies]
	ld l, a
	ld h, $00
	add hl, hl
	ld de, MonsterPalettePointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld bc, wPaletteBuffer
	ld l, $38
	ld h, $00
	add hl, bc
	push de
	ld e, l
	ld d, h
	pop hl
	ld bc, _hl_
	call CopyBytes3
	ld a, $B8
	ld c, a
	pop hl
	ld b, $08
	call LoadPalettes_BCPD
	ret

INCLUDE "data/monsters/palettes.asm"

; TODO: prints a monster's name (MonNamePointers, indexed by wd9d8)
Func_026_53ab::
	ld a, [wd9d8]
	inc a
	ld l, a
	ld h, $00
	ld de, MonNamePointers
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

; TODO: 112-entry pointer table + glyph-sequence text (move-list style); indexer not yet found
Pointers_026_53be::
	dw text_26_549e
	dw text_26_549e
	dw text_26_54ae
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be
	dw text_26_54be

; TODO: glyph-sequence text reached via Pointers_026_53be
INCLUDE "data/text/monster_53be.asm"
; TODO: prints menu option text indexed by wSelectedOption
Func_026_54cc::
	ld de, PersonalityDesc_Pointers
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

INCLUDE "data/monsters/personality_pointers.asm"

INCLUDE "data/text/personality_desc.asm"

; seems to print a monster's move list, unreferenced
Func_026_55b8::
	ld a, [wd9da + 1]
	ld l, a
	ld h, $00
	ld de, .Pointers
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

.Pointers:
	dw Unk_026_56a8
	dw Unk_026_56bd
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee
	dw Unk_026_56ee

; appears to be text, but no interpretation matches
Unk_026_56a8::
	db $f0, $a7, $f3, $b1, $f0, $20, $62, $f2, $2c, $05, $f1, $7c, $f0, $18, $f1, $5f
	db $f6, $57, $f0, $58, $ed

Unk_026_56bd::
	db $f1, $59, $d5, $f3, $b1, $f0, $20, $62, $15, $f6, $58, $f3, $0c, $f0, $39, $f2
	db $2c, $f0, $ac, $f2, $05, $f1, $7c, $f0, $18, $f1, $5f, $f6, $57, $f0, $06, $f1
	db $92, $f0, $a0, $97, $19, $f2, $93, $f0, $18, $f2, $6d, $f6, $57, $f0, $0c, $58
	db $ed

Unk_026_56ee::
	db $f1, $59, $d5, $f0, $bf, $26, $27, $28, $cd, $34, $31, $35, $f3, $0d, $f1, $1f
	db $c5, $f0, $20, $b5, $f1, $11, $f0, $18, $f5, $df, $f0, $04, $06, $f1, $0c, $f0
	db $1c, $58, $ed

; TODO: prints a monster's description text indexed by wd9d8
Func_026_5711::
	ld de, MonsterDesc_Pointers
	ld a, [wd9d8]
	inc a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

INCLUDE "data/monsters/desc_pointers.asm"

INCLUDE "data/text/mon_descriptions.asm"


