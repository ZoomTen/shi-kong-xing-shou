Func_026_4000::
	dr $98000, $98616

asm_026_4616::
	ld a, [wd08b]
	swap a
	and $f0
	ld l, a
	ld a, [wd08b]
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
	call Func_0b65
	ret

asm_026_464a:
	call Func_12e6
	jr asm_026_4652

asm_026_464f:
	call Func_0fdc

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
	ld [wd08b], a
	call Func_0b46
	ld a, [wd08a]
	ld [wd08c], a
	xor a
	ld [wCharacterTilePos], a
	push de
	pop hl
	call Func_0b65
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
	ld [wd08b], a
	ld a, $e0
	ld [wd08c], a
	xor a
	ld [wCharacterTilePos], a
	call Func_0b65
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
	ld [wd08b], a
	ld a, $e8
	ld [wd08c], a
	xor a
	ld [wCharacterTilePos], a
	call Func_0b65
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
	ldh [hFF92], a
	ld a, 2
	ldh [hFF93], a
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
	ld bc, wcab0
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
	dr $98cb6, $98d47

Func_026_4d47:
	dr $98d47, $98d73

INCLUDE "data/monsters/palettes.asm"

unk_026_53ab:
	dr $993ab, $9b140


SECTION "banknum26", ROMX[$7fff], BANK[$26]
	db $26
