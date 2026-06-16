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

Func_026_4012:
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
Pointers_026_4072:
	dw unk_026_407a
	dw unk_026_4092
	dw unk_026_40aa
	dw unk_026_40c2

; TODO: 4x4 tile arrangements for the move box (16 tiles + 8-byte trailer each)
unk_026_407a:
	db $a0, $a2, $a4, $a6, $a8, $aa, $ac, $ae, $a1, $a3, $a5, $a7, $a9, $ab, $ad, $af
	db $00, $00, $00, $00, $00, $16, $00, $00

unk_026_4092:
	db $b0, $b2, $b4, $b6, $b8, $ba, $bc, $be, $b1, $b3, $b5, $b7, $b9, $bb, $bd, $bf
	db $00, $00, $00, $00, $00, $16, $00, $00

unk_026_40aa:
	db $c0, $c2, $c4, $c6, $c8, $ca, $cc, $ce, $c1, $c3, $c5, $c7, $c9, $cb, $cd, $cf
	db $00, $00, $00, $00, $00, $16, $00, $00

unk_026_40c2:
	db $d0, $d2, $d4, $d6, $d8, $da, $dc, $de, $d1, $d3, $d5, $d7, $d9, $db, $dd, $df
	db $00, $00, $00, $00, $00, $16, $00, $00

; TODO: move-box BG-map position pairs, indexed by wd0c0 (slot 0-3)
Pointers_026_40da:
	db $01, $02
	db $01, $0b
	db $05, $02
	db $05, $0b

MoveName_Pointers:
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

Func_026_45b9:
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

Func_026_45f8:
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

asm_026_464a:
	call Func_12e6
	jr asm_026_4652

asm_026_464f:
	call GetPartyMonPtr

asm_026_4652:
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
	call Func_0b46
	ld a, [wd08a]
	ld [wMenuTextX], a
	call Func_0b46
	ld a, [wd08a]
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	push de
	pop hl
	call PrintMenuText
	ret

asm_026_4680:
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

unk_026_46ab:
	db $27
	db $28
	db $29
	db $2a

asm_026_46af:
	xor a
	ld [wd0c1], a
	ld bc, wdb20
	ld a, [wdc9e]
	and a
	jr z, asm_026_46c5

asm_026_46bc:
	ld hl, $13
	add hl, bc
	push hl
	pop bc
	dec a
	jr nz, asm_026_46bc

asm_026_46c5:
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
	call Func_113f
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
	ld de, unk_026_46ab
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap

asm_026_4734:
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

MonNamePointers:
	dw text_26_4888
	dw text_26_488d
	dw text_26_4893
	dw text_26_4899
	dw text_26_489f
	dw text_26_48a4
	dw text_26_48aa
	dw text_26_48b0
	dw text_26_48b7
	dw text_26_48bd
	dw text_26_48c3
	dw text_26_48ca
	dw text_26_48d1
	dw text_26_48d7
	dw text_26_48de
	dw text_26_48e4
	dw text_26_48ea
	dw text_26_48f1
	dw text_26_48f8
	dw text_26_48fd
	dw text_26_4904
	dw text_26_490b
	dw text_26_4912
	dw text_26_4919
	dw text_26_4920
	dw text_26_4925
	dw text_26_492c
	dw text_26_4931
	dw text_26_4938
	dw text_26_493f
	dw text_26_4946
	dw text_26_494c
	dw text_26_4953
	dw text_26_4958
	dw text_26_495d
	dw text_26_4963
	dw text_26_496a
	dw text_26_4971
	dw text_26_4978
	dw text_26_497f
	dw text_26_4986
	dw text_26_498c
	dw text_26_4993
	dw text_26_4999
	dw text_26_49a0
	dw text_26_49a7
	dw text_26_49ad
	dw text_26_49b4
	dw text_26_49ba
	dw text_26_49c0
	dw text_26_49c5
	dw text_26_49cc
	dw text_26_49d3
	dw text_26_49da
	dw text_26_49e1
	dw text_26_49e8
	dw text_26_49ed
	dw text_26_49f4
	dw text_26_49fa
	dw text_26_4a01
	dw text_26_4a08
	dw text_26_4a0f
	dw text_26_4a16
	dw text_26_4a1d
	dw text_26_4a24
	dw text_26_4a2b
	dw text_26_4a32
	dw text_26_4a39
	dw text_26_4a3e
	dw text_26_4a45
	dw text_26_4a4b
	dw text_26_4a50
	dw text_26_4a57
	dw text_26_4a5c
	dw text_26_4a61
	dw text_26_4a68
	dw text_26_4a6f
	dw text_26_4a74
	dw text_26_4a7a
	dw text_26_4a81
	dw text_26_4a88
	dw text_26_4a8f
	dw text_26_4a96
	dw text_26_4a9c
	dw text_26_4aa3
	dw text_26_4aa9
	dw text_26_4ab0
	dw text_26_4ab6
	dw text_26_4abb
	dw text_26_4ac2
	dw text_26_4ac8
	dw text_26_4ace
	dw text_26_4ad4
	dw text_26_4ada
	dw text_26_4adf
	dw text_26_4ae5
	dw text_26_4aea
	dw text_26_4af0
	dw text_26_4af6
	dw text_26_4afb
	dw text_26_4b02
	dw text_26_4b09
	dw text_26_4b0f
	dw text_26_4b16
	dw text_26_4b1d
	dw text_26_4b22
	dw text_26_4b29
	dw text_26_4b2e
	dw text_26_4b34
	dw text_26_4b3a
	dw text_26_4b40
	dw text_26_4b45
	dw text_26_4b4c
	dw text_26_4b53
	dw text_26_4b5a
	dw text_26_4b61
	dw text_26_4b67
	dw text_26_4b6c
	dw text_26_4b73
	dw text_26_4b7a
	dw text_26_4b80
	dw text_26_4b87
	dw text_26_4b8e
	dw text_26_4b93
	dw text_26_4b9a
	dw text_26_4ba0
	dw text_26_4ba6
	dw text_26_4bac
	dw text_26_4bb2
	dw text_26_4bb9
	dw text_26_4bc0
	dw text_26_4bc5
	dw text_26_4bca
	dw text_26_4bd0
	dw text_26_4bd7
	dw text_26_4bdd
	dw text_26_4be4
	dw text_26_4beb
	dw text_26_4bf1
	dw text_26_4bf8
	dw text_26_4bff
	dw text_26_4c05
	dw text_26_4c0c
	dw text_26_4c13
	dw text_26_4c19
	dw text_26_4c1f
	dw text_26_4c26
	dw text_26_4c2d
	dw text_26_4c34
	dw text_26_4c3b
	dw text_26_4c42
	dw text_26_4c49
	dw text_26_4c4f
	dw text_26_4c56
	dw text_26_4c5b
	dw text_26_4c61
	dw text_26_4c68
	dw text_26_4c6f
	dw text_26_4c76
	dw text_26_4c7c

INCLUDE "data/text/mon_names.asm"

Func_026_4c89:
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
	call Func_0b46
	ld a, [wd08a]
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

Func_026_4cb6:
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
	call Func_0b46
	ld a, [wd08a]
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
Func_026_4cef:
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

Func_026_4d1b:
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

Func_026_4d47:
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
Func_026_53ab:
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
Pointers_026_53be:
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
Func_026_54cc:
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

PersonalityDesc_Pointers:
	dw text_26_54ee
	dw text_26_550d
	dw text_26_5530
	dw text_26_5546
	dw text_26_5562
	dw text_26_5571
	dw text_26_5588
	dw text_26_55a2

INCLUDE "data/text/personality_desc.asm"

; TODO: prints a monster's move list, indexed by wd9da+1
Func_026_55b8:
	ld a, [wd9da + 1]
	ld l, a
	ld h, $00
	ld de, MonsterMoveList_Pointers
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

MonsterMoveList_Pointers:
	dw text_26_56a8
	dw text_26_56bd
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee
	dw text_26_56ee

; TODO: monster move-list text (sequences of move-name glyphs), via MonsterMoveList_Pointers
INCLUDE "data/text/monster_movelist.asm"
; TODO: prints a monster's description text indexed by wd9d8
Func_026_5711:
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

MonsterDesc_Pointers:
	dw text_26_5864
	dw text_26_5869
	dw text_26_5886
	dw text_26_58a9
	dw text_26_58d6
	dw text_26_58fa
	dw text_26_591e
	dw text_26_5941
	dw text_26_5964
	dw text_26_598d
	dw text_26_59b2
	dw text_26_59d5
	dw text_26_59f8
	dw text_26_5a23
	dw text_26_5a4a
	dw text_26_5a6b
	dw text_26_5a8b
	dw text_26_5abe
	dw text_26_5ae0
	dw text_26_5b0a
	dw text_26_5b30
	dw text_26_5b50
	dw text_26_5b7d
	dw text_26_5b9d
	dw text_26_5bc5
	dw text_26_5be5
	dw text_26_5c06
	dw text_26_5c35
	dw text_26_5c6d
	dw text_26_5ca6
	dw text_26_5ccd
	dw text_26_5cfe
	dw text_26_5d35
	dw text_26_5d65
	dw text_26_5d8f
	dw text_26_5dc2
	dw text_26_5de7
	dw text_26_5e1e
	dw text_26_5e41
	dw text_26_5e60
	dw text_26_5e8a
	dw text_26_5ebb
	dw text_26_5eea
	dw text_26_5f1c
	dw text_26_5f4a
	dw text_26_5f73
	dw text_26_5f9f
	dw text_26_5fcb
	dw text_26_5ff8
	dw text_26_6026
	dw text_26_6049
	dw text_26_6078
	dw text_26_60a0
	dw text_26_60cb
	dw text_26_60f5
	dw text_26_6126
	dw text_26_614b
	dw text_26_6176
	dw text_26_619b
	dw text_26_61c4
	dw text_26_61eb
	dw text_26_621d
	dw text_26_6247
	dw text_26_6273
	dw text_26_629f
	dw text_26_62c7
	dw text_26_62f7
	dw text_26_631b
	dw text_26_6342
	dw text_26_6373
	dw text_26_63a0
	dw text_26_63cf
	dw text_26_6400
	dw text_26_642b
	dw text_26_644f
	dw text_26_6473
	dw text_26_6499
	dw text_26_64c1
	dw text_26_64ea
	dw text_26_6519
	dw text_26_6545
	dw text_26_656b
	dw text_26_6594
	dw text_26_65b9
	dw text_26_65e2
	dw text_26_6609
	dw text_26_6638
	dw text_26_6666
	dw text_26_6691
	dw text_26_66b2
	dw text_26_66dc
	dw text_26_670b
	dw text_26_6730
	dw text_26_675e
	dw text_26_6783
	dw text_26_67a7
	dw text_26_67d5
	dw text_26_67ff
	dw text_26_681d
	dw text_26_684a
	dw text_26_6878
	dw text_26_68ad
	dw text_26_68d8
	dw text_26_6900
	dw text_26_692d
	dw text_26_695c
	dw text_26_6985
	dw text_26_69a6
	dw text_26_69d3
	dw text_26_69fc
	dw text_26_6a24
	dw text_26_6a49
	dw text_26_6a75
	dw text_26_6aa4
	dw text_26_6acb
	dw text_26_6af9
	dw text_26_6b2b
	dw text_26_6b58
	dw text_26_6b8a
	dw text_26_6bba
	dw text_26_6be2
	dw text_26_6c0c
	dw text_26_6c3e
	dw text_26_6c65
	dw text_26_6c92
	dw text_26_6cb6
	dw text_26_6cda
	dw text_26_6d02
	dw text_26_6d25
	dw text_26_6d46
	dw text_26_6d6f
	dw text_26_6d9e
	dw text_26_6dcf
	dw text_26_6dfa
	dw text_26_6e1c
	dw text_26_6e4a
	dw text_26_6e79
	dw text_26_6e9f
	dw text_26_6eca
	dw text_26_6ef6
	dw text_26_6f1f
	dw text_26_6f4d
	dw text_26_6f71
	dw text_26_6f9d
	dw text_26_6fc3
	dw text_26_6ff0
	dw text_26_7014
	dw text_26_703b
	dw text_26_7067
	dw text_26_7096
	dw text_26_70c0
	dw text_26_70eb
	dw text_26_7116
	dw text_26_5864
	dw text_26_5864
	dw text_26_5864
	dw text_26_5864
	dw text_26_5864
	dw text_26_5864
	dw text_26_5864

INCLUDE "data/text/monster_desc.asm"


