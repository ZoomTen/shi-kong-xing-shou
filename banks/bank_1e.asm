_ClearMapLayoutPatch::
	ld de, LayoutPatches_01e_402a
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wMapPatchIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	push hl
	call ClearLayoutFlag
	pop hl
	call ApplyMapLayoutPatch
	ret

LayoutPatches_01e_402a:
	dw .patch_0
	dw .patch_0
	dw .patch_2
	dw .patch_3
	dw .patch_4
	dw .patch_5

.patch_0:
	db 0
	layout_patch 0, 0, 0, 0, 0

.patch_2:
	db 2
	layout_patch wdaba, 6, 2, 5, $26
	layout_patch wdaba, 6, 2, 5, $26

.patch_3:
	db 3
	layout_patch wdaba, 7, 1, 3, $0e
	layout_patch wdaba, 7, 1, 3, $0e
	layout_patch wdaba, 7, 1, 3, $0e

.patch_4:
	db 5
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 1, 5, 0, $05
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 1, 5, 0, $05

.patch_5:
	db 1
	layout_patch wdaba, 5, 3, 1, $04

_SetMapLayoutPatch::
	ld de, LayoutPatches_01e_40ad
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wMapPatchIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	push hl
	call SetLayoutFlag
	pop hl
	call ApplyMapLayoutPatch
	ret

LayoutPatches_01e_40ad:
	dw .patch_0
	dw .patch_1
	dw .patch_2
	dw .patch_3
	dw .patch_4
	dw .patch_5

.patch_0:
	db 0
	layout_patch 0, 0, 0, 0, 0

.patch_1:
	db 1
	layout_patch wdaba, 5, 2, 2, $18

.patch_2:
	db 3
	layout_patch wdaba, 6, 2, 5, $40
	layout_patch wdaba, 6, 2, 5, $40
	layout_patch wdaba, 6, 8, 4, $41

.patch_3:
	db 4
	layout_patch wdaba, 7, 1, 3, $15
	layout_patch wdaba, 7, 1, 3, $15
	layout_patch wdaba, 7, 1, 3, $15
	layout_patch wdaba, 7, 2, 2, $16

.patch_4:
	db 7
	layout_patch wdabb, 0, 2, 7, $58
	layout_patch wdabb, 1, 5, 0, $59
	layout_patch wdabb, 0, 2, 7, $58
	layout_patch wdabb, 0, 2, 7, $58
	layout_patch wdabb, 1, 5, 0, $59
	layout_patch wdabb, 0, $0a, 3, $5a
	layout_patch wdabb, 1, 1, 1, $5b

.patch_5:
	db 1
	layout_patch wdaba, 5, 3, 1, $2e

_ApplyMapLayoutPatchIfClear::
	ld de, LayoutPatches_01e_414f
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wMapPatchIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestLayoutFlag
	and a
	ret nz
	call ApplyMapLayoutPatch
	ret

LayoutPatches_01e_414f:
	dw .patch_none
	dw .patch_none
	dw .patch_none
	dw .patch_3
	dw .patch_4
	dw .patch_none

.patch_none:
	db 0
	layout_patch 0, 0, 0, 0, 0

.patch_3:
	db 3
	layout_patch wdaba, 7, 2, 2, $0e
	layout_patch wdaba, 7, 2, 2, $0e
	layout_patch wdaba, 7, 2, 2, $0e

.patch_4:
	db 5
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 1, 5, 0, $05
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 0, $0a, 3, $2e
	layout_patch wdabb, 1, 1, 1, $07

; For the current wMapType, walk its patch record list and apply every
; patch whose flag bit is set, editing wMapLayout in place.
_ApplyMapLayoutFlagPatches::
	ld de, LayoutPatches_01e_40ad
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and a
	ret z
	ld c, a
.loop
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestLayoutFlag
	and a
	jr z, .skip
	call ApplyMapLayoutPatch
.skip
	pop hl
	ld de, 6
	add hl, de
	dec c
	jr nz, .loop
	ret

; Same as _ApplyMapLayoutFlagPatches but using the secondary record table
; (LayoutPatches_01e_4910); used when the map is first set up.
ApplyMapLayoutFlagPatchesInit::
	ld de, LayoutPatches_01e_4910
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld c, a
.loop
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestLayoutFlag
	and a
	jr z, .skip
	call ApplyMapLayoutPatch
.skip
	pop hl
	ld de, 6
	add hl, de
	dec c
	jr nz, .loop
	ret

_SetMapLayoutPatchForItem::
	ld de, LayoutPatches_01e_4910
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wItemIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	push hl
	call SetLayoutFlag
	pop hl
	call ApplyMapLayoutPatch
	ret

INCLUDE "data/text/bank1e_misc3.asm"

LoadItemNameByMapType::
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld de, Pointers_01e_4d29
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wItemIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1f4], a
	push hl
	ld de, Pointers_01e_4ebd
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, [hli]
	ld [wd9f3], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ld a, 1
	ld [wd9d3], a
	farcall asm_039_479f
	ret

PrintEquipmentName::
	ld l, d
	ld h, 0
	ld de, EquipmentNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

PrintItemName::
	ld l, d
	ld h, 0
	ld de, ItemNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

Func_01e_4284:
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld a, [hl]
	ld [wd0c1], a
	ret

Func_01e_4290::
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld a, [hl]
	ld [wdce8], a
	and $0f ; ?
	ld l, a
	ld h, 0
	ld de, TypeNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $3c
	ld [wMenuTextX], a
	ld a, $40
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_01e_42ba:
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld a, [hl]
	ld [wdce8], a
	and $0f
	ld l, a
	ld h, 0
	ld de, TypeNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $79
	ld [wMenuTextX], a
	ld a, $7d
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_01e_42e4:
	ld l, d
	ld a, d
	ld h, 0
	ld de, TypeNameIndex_01e_551f
	add hl, de
	ld a, [hl]
	ld [wd8ff], a
	ret

Func_01e_42f1:
	ld l, d
	ld a, d
	ld [wd9e3], a
	ld h, 0
	ld de, TypeNameIndex_01e_551f
	add hl, de
	ld a, [hl]
	ld [wd8ff], a
	and $0f
	ld l, a
	ld h, 0
	ld de, TypeNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $eb
	ld [wMenuTextX], a
	ld a, $fd
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_01e_431f::
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPlayerMap2X]
	sla a
	sla a
	add $80
	swap a
	ld d, a
	and $f0
	ld e, a
	ld a, d
	and $0f
	or $80
	ld d, a
	ld bc, $40
	call CopyBytesVRAM
	ret

Func_01e_434d:
	ld de, PointerTable_01e_57ed
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintMenuText
	ret

DrawItemMenuPage:
	ld de, Pointers_01e_4ebd
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, Pointers_01e_44fd
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wd9f2]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wSelectedPage]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	pop de
	xor a
	ld [wd0c1], a

.loop
	ld a, [hli]
	ld [wd0c3], a
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0c1]
	sla a
	sla a
	sla a
	sla a
	add $a8
	ld [wMenuTextX], a
	ld a, $f8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	call Func_01e_43d3
	pop hl
	pop de
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 4
	jr c, .loop
	ret

Func_01e_43d3:
	ld de, Pointers_01e_447d
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wd0c3]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld de, wd1f5
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	dec de
	ld bc, $988e
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld a, 0
	ld [wd0fd], a
	ld bc, $0205
	call PrintNumber
	ret

Func_01e_4416:
	call Func_01e_4441
	ld de, wd1f5
	ldh a, [hMathValue + 2]
	ld [de], a
	inc de
	ldh a, [hMathValue + 1]
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	ld hl, $99ee
	ld de, wd1f5
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld [wd0fd], a
	ld bc, $0305
	call PrintNumber
	ret

Func_01e_4441:
	ld de, Pointers_01e_447d
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wd9f3]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [hMathValue + 1], a
	ld a, [hli]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 2], a
	ld a, [wd9d3]
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .done
	ld a, 2
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit

.done
	ret

; seems to be shop prices
Pointers_01e_447d:
	dw Unk_01e_4481
	dw Unk_01e_44d1

Unk_01e_4481:
	bigdw 0
	bigdw 100
	bigdw 300
	bigdw 600
	bigdw 10000
	bigdw 50
	bigdw 150
	bigdw 300
	bigdw 1000
	bigdw 20
	bigdw 80
	bigdw 3000
	bigdw 100
	bigdw 100
	bigdw 100
	bigdw 200
	bigdw 200
	bigdw 500
	bigdw 2000
	bigdw 5000
	bigdw 10000
	bigdw 500
	bigdw 1000
	bigdw 5000
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 200
	bigdw 500
	bigdw 200
	bigdw 500
	bigdw 1000
	bigdw 50000
	bigdw 1000

Unk_01e_44d1:
	bigdw 0
	bigdw 2500
	bigdw 10000
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1500
	bigdw 1000
	bigdw 2000
	bigdw 500
	bigdw 1500
	bigdw 3000
	bigdw 1000

Pointers_01e_44fd:
	dw Pointers_01e_4501
	dw Pointers_01e_459b

Pointers_01e_4501:
	dw Unk_01e_451d
	dw Unk_01e_4526
	dw Unk_01e_452f
	dw Unk_01e_4538
	dw Unk_01e_4541
	dw Unk_01e_454a
	dw Unk_01e_4553
	dw Unk_01e_455c
	dw Unk_01e_4565
	dw Unk_01e_456e
	dw Unk_01e_4577
	dw Unk_01e_4580
	dw Unk_01e_4589
	dw Unk_01e_4592

Unk_01e_451d:
	db $01, $05, $0c, $0d, $0e, $12, $18, $27, -1
Unk_01e_4526:
	db $02, $05, $06, $0d, $0e, $12, $15, $27, -1
Unk_01e_452f:
	db $06, $09, $0c, $0d, $11, $19, $20, $23, -1
Unk_01e_4538:
	db $02, $05, $06, $0c, $12, $15, $23, $22, -1
Unk_01e_4541:
	db $02, $05, $09, $0a, $0b, $0c, $1c, $1e, -1
Unk_01e_454a:
	db $02, $03, $05, $06, $0c, $0d, $12, $15, -1
Unk_01e_4553:
	db $02, $03, $0a, $11, $12, $15, $24, $22, -1
Unk_01e_455c:
	db $03, $06, $07, $0c, $0d, $0f, $12, $15, -1
Unk_01e_4565:
	db $03, $07, $0c, $11, $13, $16, $24, $27, -1
Unk_01e_456e:
	db $03, $06, $0c, $0d, $15, $1d, $1a, $1e, -1
Unk_01e_4577:
	db $07, $08, $0c, $0d, $11, $16, $24, $27, -1
Unk_01e_4580:
	db $03, $08, $0c, $11, $14, $16, $17, $25, -1
Unk_01e_4589:
	db $03, $07, $0a, $0c, $11, $13, $15, $17, -1
Unk_01e_4592:
	db $03, $04, $08, $11, $13, $16, $22, $25, -1

Pointers_01e_459b:
	dw Unk_01e_45b7
	dw Unk_01e_45c0
	dw Unk_01e_45c9
	dw Unk_01e_45d2
	dw Unk_01e_45db
	dw Unk_01e_45e4
	dw Unk_01e_45ed
	dw Unk_01e_45f6
	dw Unk_01e_45ff
	dw Unk_01e_4608
	dw Unk_01e_4611
	dw Unk_01e_461a
	dw Unk_01e_4623
	dw Unk_01e_462c

Unk_01e_45b7:
	db $08, $09, $0c, $0f, $12, $10, $11, $13, -1
Unk_01e_45c0:
	db $08, $05, $0f, $11, $12, $15, $01, $02, -1
Unk_01e_45c9:
	db $06, $0d, $10, $13, $15, $09, $02, $01, -1
Unk_01e_45d2:
	db $03, $0f, $12, $13, $15, $01, $0e, $0a, -1
Unk_01e_45db:
	db $12, $15, $0e, $07, $04, $0a, $0f, $03, -1
Unk_01e_45e4:
	db $04, $0b, $0d, $11, $01, $13, $03, $0c, -1
Unk_01e_45ed:
	db $0b, $08, $04, $05, $11, $12, $13, $01, -1
Unk_01e_45f6:
	db $03, $0a, $09, $15, $10, $05, $0c, $01, -1
Unk_01e_45ff:
	db $13, $14, $08, $0a, $0f, $01, $0b, $15, -1
Unk_01e_4608:
	db $13, $11, $01, $15, $06, $07, $0c, $0e, -1
Unk_01e_4611:
	db $01, $02, $11, $15, $06, $07, $0c, $0e, -1
Unk_01e_461a:
	db $01, $02, $11, $13, $14, $15, $10, $09, -1
Unk_01e_4623:
	db $0a, $0b, $0c, $0d, $0e, $0f, $14, $10, -1
Unk_01e_462c:
	db $01, $02, $10, $11, $12, $13, $14, $15, -1

DrawItemPageWithIcons:
	ld de, Pointers_01e_4849
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, Pointers_01e_4ebd
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, [wSelectedPage]
	add a
	add a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	xor a
	ld [wd0c1], a

.loop
	ld a, [hli]
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0c1]
	sla a
	sla a
	sla a
	sla a
	add $a8
	ld [wMenuTextX], a
	ld a, $f8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	pop hl
	ld a, [hli]
	ld [wd0c3], a
	push hl
	ld hl, Func_025_4288
	ld b, $25
	rst FarCall
	pop hl
	pop de
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 4
	jr c, .loop
	ret

DrawItemListPage:
	ld de, Pointers_01e_4849
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, Pointers_01e_4ebd
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, [wSelectedPage]
	ld c, a
	add a
	add a
	add c
	add a
	ld c, a
	ld b, 0
	add hl, bc
	xor a
	ld [wd0c1], a

.loop
	ld a, [hli]
	call Func_01e_4719
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0c1]
	sla a
	sla a
	sla a
	sla a
	add $40
	ld [wMenuTextX], a
	ld a, $90
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	pop hl
	ld a, [hli]
	and a
	jr z, .skip
	ld [wd0c3], a
	push hl
	ld hl, Func_025_425d
	ld b, $25
	rst FarCall
	pop hl

.skip
	pop de
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 5
	jr c, .loop
	ret

Func_01e_4719:
	push bc
	ld c, a
	ld a, [wd1f4]
	and a
	jr z, .map0
	cp 1
	jr z, .map1
	ld a, c
	cp $29
	jr c, .keep
	jr .clear

.map1
	ld a, c
	cp $16
	jr c, .keep
	jr .clear

.map0
	ld a, c
	cp $5a
	jr c, .keep

.clear
	push hl
	ld [hl], 0
	dec hl
	ld [hl], 0
	pop hl
	xor a
	pop bc
	ret

.keep
	ld a, c
	pop bc
	ret

Func_01e_4745:
	ld de, Pointers_01e_614f
	ld a, [wd9d4]
	ld l, a
	ld a, [wd9d5]
	ld h, a
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_01e_4837

Func_01e_475c:
	ld de, PointerTable_01e_59cc
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld bc, Pointers_01e_44fd
	pop hl
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [wd9f2]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [wSelectedPage]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, bc
	ld a, [hl]
	ld [wd9f3], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $60
	ld [wMenuTextX], a
	ld a, $a8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_01e_47af:
	ld de, PointerTable_01e_59cc
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld bc, Pointers_01e_4849
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [wd1fe], a
	ld a, [hli]
	ld b, a
	ld [wd1ff], a
	ld a, [wSelectedPage]
	add a
	add a
	ld l, a
	ld a, [wSelectedOption]
	add l
	ld l, a
	ld [wd1fd], a
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $60
	ld [wMenuTextX], a
	ld a, $a8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_01e_47fb:
	ld de, PointerTable_01e_59cc
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld bc, Pointers_01e_4849
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [wd1fe], a
	ld a, [hli]
	ld b, a
	ld [wd1ff], a
	ld a, [wSelectedPage]
	ld l, a
	add a
	add a
	add l
	ld l, a
	ld a, [wSelectedOption]
	add l
	ld l, a
	ld [wd1fd], a
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

Func_01e_4837:
	ld a, $a0
	ld [wMenuTextX], a
	ld a, $e8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Pointers_01e_4849:
	dw wd300
	dw wddb0
	dw wd284

Func_01e_484f:
	ld a, [wd1fe]
	ld l, a
	ld a, [wd1ff]
	ld h, a
	ld a, [wd1fd]
	add a
	add l
	ld l, a
	ld a, [hl]
	ld de, Pointers_01e_6567
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $a0
	ld [wMenuTextX], a
	ld a, $e8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_01e_487b:
	ld a, [wd1fe]
	ld l, a
	ld a, [wd1ff]
	ld h, a
	ld a, [wd1fd]
	add a
	add l
	ld l, a
	ld a, [hl]
	ld de, Pointers_01e_6567
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $40
	ld [wMenuTextX], a
	ld a, $88
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

; Clear bit b of the flag byte at [de].
ClearLayoutFlag:
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .done
.loop
	rrc l
	dec a
	jr nz, .loop
.done
	res 0, l
	ld a, b
	and a
	jr z, .done2
.loop2
	rlc l
	dec a
	jr nz, .loop2
.done2
	ld a, l
	ld [de], a
	ret

; Set bit b of the flag byte at [de].
SetLayoutFlag:
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .done
.loop
	rrc l
	dec a
	jr nz, .loop
.done
	set 0, l
	ld a, b
	and a
	jr z, .done2
.loop2
	rlc l
	dec a
	jr nz, .loop2
.done2
	ld a, l
	ld [de], a
	ret

; Write the patch's block value into wMapLayout at row*hMapWidth + col.
; hl -> col (db), row (db), value (db)
ApplyMapLayoutPatch:
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld hl, wMapLayout
	and a
	jr z, .skip
	ld a, [hMapWidth]
	ld c, a
	ld b, 0
.loop
	add hl, bc
	dec d
	jr nz, .loop
.skip
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	pop bc
	ret

; Return a = bit b of the flag byte at [de] (0 or 1).
TestLayoutFlag:
	push bc
	push hl
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .done
.loop
	rrc l
	dec a
	jr nz, .loop
.done
	bit 0, l
	jr z, .clear
	ld a, 1
	jr .store
.clear
	xor a
.store
	pop hl
	pop bc
	ret

LayoutPatches_01e_4910:
	dw MapLayoutPatches_None
	dw MapLayoutPatches_01e_4cf5
	dw MapLayoutPatches_01e_4cfc
	dw MapLayoutPatches_01e_4d09
	dw MapLayoutPatches_01e_4d10
	dw MapLayoutPatches_None
	dw .patch_4cc8
	dw .patch_4cc1
	dw .patch_4cba
	dw .patch_4cad
	dw .patch_4c94
	dw .patch_4c87
	dw .patch_4c6e
	dw .patch_4c67
	dw MapLayoutPatches_01e_4cd6
	dw .patch_4c48
	dw .patch_4c35
	dw .patch_4c22
	dw .patch_4bf0
	dw .patch_4bdd
	dw .patch_4b67
	dw .patch_4b7a
	dw .patch_4ba5
	dw .patch_4bb8
	dw .patch_4b4e
	dw .patch_4b3b
	dw .patch_4b2e
	dw .patch_4b21
	dw .patch_4aee
	dw .patch_4b01
	dw .patch_4b14
	dw .patch_4aa0
	dw .patch_4aad
	dw .patch_4aba
	dw .patch_4ac1
	dw .patch_4ad4
	dw .patch_4ae1
	dw .patch_4a6e
	dw .patch_4a87
	dw .patch_49ce
	dw .patch_49e1
	dw .patch_49ee
	dw .patch_49f5
	dw .patch_4a08
	dw .patch_4a1b
	dw .patch_4a3a
	dw .patch_4a41
	dw .patch_4a4e
	dw .patch_4a55
	dw .patch_4980
	dw .patch_4999
	dw .patch_49a6
	dw .patch_49ad
	dw .patch_49b4
	dw .patch_49c1
	dw .patch_4c09

.patch_4980:
	db 4
	layout_patch wdac9, 7, 6, 1, $a2
	layout_patch wdaca, 0, 8, 1, $a3
	layout_patch wdaca, 1, $0d, $0b, $a4
	layout_patch wdaca, 2, $0b, $0c, $a5

.patch_4999:
	db 2
	layout_patch wdaca, 3, 8, $0a, $aa
	layout_patch wdaca, 4, $0b, $0d, $ab

.patch_49a6:
	db 1
	layout_patch wdaca, 5, 4, 1, $45

.patch_49ad:
	db 1
	layout_patch wdaca, 6, 3, 1, $51

.patch_49b4:
	db 2
	layout_patch wdaca, 7, 3, 3, $51
	layout_patch wdacb, 0, 4, 4, $52

.patch_49c1:
	db 2
	layout_patch wdacb, 1, 0, 8, $4c
	layout_patch wdacb, 2, 3, 9, $4d

.patch_49ce:
	db 3
	layout_patch wdac6, 6, 2, 1, $47
	layout_patch wdac6, 7, 4, 1, $48
	layout_patch wdac7, 0, 5, 1, $49

.patch_49e1:
	db 2
	layout_patch wdac7, 1, 3, 5, $55
	layout_patch wdac7, 2, 0, 6, $56

.patch_49ee:
	db 1
	layout_patch wdac7, 3, 2, 3, $32

.patch_49f5:
	db 3
	layout_patch wdac7, 4, $0a, 1, $39
	layout_patch wdac7, 5, $0c, 1, $3a
	layout_patch wdac7, 6, 6, 4, $3b

.patch_4a08:
	db 3
	layout_patch wdac7, 7, 1, 4, $ab
	layout_patch wdac8, 0, 1, 9, $ac
	layout_patch wdac8, 1, 2, 9, $ad

.patch_4a1b:
	db 5
	layout_patch wdac8, 2, $0c, 1, $a4
	layout_patch wdac8, 3, $0d, 2, $a5
	layout_patch wdac8, 4, $0c, 9, $a6
	layout_patch wdac8, 5, 2, $0b, $a7
	layout_patch wdac8, 6, 0, $0e, $a8

.patch_4a3a:
	db 1
	layout_patch wdac8, 7, 1, 1, $4d

.patch_4a41:
	db 2
	layout_patch wdac9, 0, 5, 9, $51
	layout_patch wdac9, 1, 7, 9, $52

.patch_4a4e:
	db 1
	layout_patch wdac9, 2, 9, 9, $49

.patch_4a55:
	db 4
	layout_patch wdac9, 3, 8, 0, $52
	layout_patch wdac9, 4, 4, 4, $53
	layout_patch wdac9, 5, 3, 8, $54
	layout_patch wdac9, 6, 4, 8, $55

.patch_4a6e:
	db 4
	layout_patch wdac5, 6, 3, 7, $9e
	layout_patch wdac5, 7, $0d, 9, $9f
	layout_patch wdac6, 0, 0, $0d, $a0
	layout_patch wdac6, 1, 2, $0d, $a1

.patch_4a87:
	db 4
	layout_patch wdac6, 2, 3, 7, $9f
	layout_patch wdac6, 3, $0d, 9, $a0
	layout_patch wdac6, 4, 0, $0d, $a1
	layout_patch wdac6, 5, 2, $0d, $a2

.patch_4aa0:
	db 2
	layout_patch wdac4, 2, 8, 0, $4a
	layout_patch wdac4, 3, 9, 1, $4b

.patch_4aad:
	db 2
	layout_patch wdac4, 4, 1, 7, $47
	layout_patch wdac4, 5, 3, 7, $48

.patch_4aba:
	db 1
	layout_patch wdac4, 6, 1, 6, $47

.patch_4ac1:
	db 3
	layout_patch wdac4, 7, 0, 1, $4b
	layout_patch wdac5, 0, 2, 1, $4c
	layout_patch wdac5, 1, 3, 4, $4d

.patch_4ad4:
	db 2
	layout_patch wdac5, 2, 5, 9, $4f
	layout_patch wdac5, 3, 5, $0a, $50

.patch_4ae1:
	db 2
	layout_patch wdac5, 4, 5, 5, $55
	layout_patch wdac5, 5, 6, 5, $56

.patch_4aee:
	db 3
	layout_patch wdac3, 2, 5, 3, $22
	layout_patch wdac3, 3, 5, 5, $23
	layout_patch wdac3, 4, 2, 7, $24

.patch_4b01:
	db 3
	layout_patch wdac3, 5, 5, 6, $2e
	layout_patch wdac3, 6, 7, 8, $2f
	layout_patch wdac3, 7, 5, 9, $30

.patch_4b14:
	db 2
	layout_patch wdac4, 0, 0, 5, $35
	layout_patch wdac4, 1, 2, 5, $36

.patch_4b21:
	db 2
	layout_patch wdac3, 0, 1, 4, $3c
	layout_patch wdac3, 1, 5, 4, $3d

.patch_4b2e:
	db 2
	layout_patch wdac2, 6, 0, 3, $49
	layout_patch wdac2, 7, 2, 5, $4a

.patch_4b3b:
	db 3
	layout_patch wdac2, 3, 4, 1, $64
	layout_patch wdac2, 4, 8, 8, $65
	layout_patch wdac2, 5, 6, $0a, $66

.patch_4b4e:
	db 4
	layout_patch wdac1, 7, 8, 1, $61
	layout_patch wdac2, 0, 9, 1, $62
	layout_patch wdac2, 1, 0, 2, $63
	layout_patch wdac2, 2, 0, 4, $64

.patch_4b67:
	db 3
	layout_patch wdabf, 4, $0a, 1, $3c
	layout_patch wdabf, 5, 1, 9, $3d
	layout_patch wdabf, 6, 3, 9, $3e

.patch_4b7a:
	db 7
	layout_patch wdabf, 7, 3, 1, $50
	layout_patch wdac0, 0, 7, 1, $51
	layout_patch wdac0, 1, 1, 2, $52
	layout_patch wdac0, 2, 2, 2, $53
	layout_patch wdac0, 3, 4, 3, $54
	layout_patch wdac0, 4, 9, 4, $55
	layout_patch wdac0, 5, $0a, 5, $56

.patch_4ba5:
	db 3
	layout_patch wdac0, 6, 8, 3, $49
	layout_patch wdac0, 7, 1, 5, $4a
	layout_patch wdac1, 0, 7, 8, $4b

.patch_4bb8:
	db 6
	layout_patch wdac1, 1, 4, 4, $42
	layout_patch wdac1, 2, 8, 4, $43
	layout_patch wdac1, 3, 1, 7, $44
	layout_patch wdac1, 4, 2, 7, $45
	layout_patch wdac1, 5, 3, 8, $46
	layout_patch wdac1, 6, 3, $0a, $47

.patch_4bdd:
	db 3
	layout_patch wdabf, 1, $0a, 1, $a4
	layout_patch wdabf, 2, $0b, 2, $a5
	layout_patch wdabf, 3, 0, 6, $a6

.patch_4bf0:
	db 4
	layout_patch wdabe, 5, 9, 0, $a3
	layout_patch wdabe, 6, $0d, 5, $a4
	layout_patch wdabe, 7, 1, 6, $a5
	layout_patch wdabf, 0, $0e, 7, $a6

.patch_4c09:
	db 4
	layout_patch wdabe, 5, 9, 0, $a1
	layout_patch wdabe, 6, $0d, 5, $a2
	layout_patch wdabe, 7, 1, 6, $a3
	layout_patch wdabf, 0, $0e, 7, $a4

.patch_4c22:
	db 3
	layout_patch wdabe, 2, 4, 3, $ab
	layout_patch wdabe, 3, $0e, 6, $ac
	layout_patch wdabe, 4, 1, $0d, $ad

.patch_4c35:
	db 3
	layout_patch wdabd, 7, $0a, 1, $6c
	layout_patch wdabe, 0, $0b, 2, $6d
	layout_patch wdabe, 1, 0, 6, $6e

.patch_4c48:
	db 5
	layout_patch wdabd, 2, 9, 0, $75
	layout_patch wdabd, 3, $0a, 0, $76
	layout_patch wdabd, 4, $0d, 5, $77
	layout_patch wdabd, 5, 1, 6, $78
	layout_patch wdabd, 6, $0e, 7, $79

.patch_4c67:
	db 1
	layout_patch wdabd, 1, 4, 4, $2d

.patch_4c6e:
	db 4
	layout_patch wdabc, 5, 6, 1, $3d
	layout_patch wdabc, 6, 3, 7, $3e
	layout_patch wdabc, 7, 1, 8, $3f
	layout_patch wdabd, 0, 3, 8, $40

.patch_4c87:
	db 2
	layout_patch wdabc, 3, 4, 4, $4a
	layout_patch wdabc, 4, $0a, 6, $4b

.patch_4c94:
	db 4
	layout_patch wdabb, 7, 1, 1, $43
	layout_patch wdabc, 0, $0a, 1, $44
	layout_patch wdabc, 1, $0a, 3, $45
	layout_patch wdabc, 2, 9, 8, $46

.patch_4cad:
	db 2
	layout_patch wdabb, 5, 0, 1, $19
	layout_patch wdabb, 6, 1, 1, $1a

.patch_4cba:
	db 1
	layout_patch wdabb, 4, 2, 4, $14

.patch_4cc1:
	db 1
	layout_patch wdabb, 3, 5, 4, $15

.patch_4cc8:
	db 1
	layout_patch wdabb, 2, 3, 2, $18

MapLayoutPatches_None:
	db 0
	layout_patch 0, 0, 0, 0, 0

MapLayoutPatches_01e_4cd6:
	db 5
	layout_patch wdab9, 0, $0b, 3, $57
	layout_patch wdab9, 1, 0, $0a, $58
	layout_patch wdab9, 2, 2, $0a, $59
	layout_patch wdab9, 3, 0, $0b, $5a
	layout_patch wdab9, 4, 2, $0b, $5b

MapLayoutPatches_01e_4cf5:
	db 1
	layout_patch wdab9, 5, 2, 0, $16

MapLayoutPatches_01e_4cfc:
	db 2
	layout_patch wdab9, 6, 3, 6, $3e
	layout_patch wdab9, 7, 8, 7, $3f

MapLayoutPatches_01e_4d09:
	db 1
	layout_patch wdaba, 0, 2, 0, $14

MapLayoutPatches_01e_4d10:
	db 4
	layout_patch wdaba, 1, 1, 0, $54
	layout_patch wdaba, 2, $0b, 0, $55
	layout_patch wdaba, 3, 0, 8, $56
	layout_patch wdaba, 4, 5, 8, $57

Pointers_01e_4d29:
; appears to be category, index
	dw MapLayoutPatches_None
	dw ItemNameIndex_01e_4ead
	dw ItemNameIndex_01e_4eaf
	dw ItemNameIndex_01e_4eb3
	dw ItemNameIndex_01e_4eb5
	dw MapLayoutPatches_None
	dw ItemNameIndex_01e_4ea1
	dw ItemNameIndex_01e_4e9f
	dw ItemNameIndex_01e_4e9d
	dw ItemNameIndex_01e_4e99
	dw ItemNameIndex_01e_4e83
	dw ItemNameIndex_01e_4e8b
	dw ItemNameIndex_01e_4e8f
	dw ItemNameIndex_01e_4e97
	dw ItemNameIndex_01e_4ea3
	dw ItemNameIndex_01e_4e79
	dw ItemNameIndex_01e_4e73
	dw ItemNameIndex_01e_4e6d
	dw ItemNameIndex_01e_4e5d
	dw ItemNameIndex_01e_4e57
	dw ItemNameIndex_01e_4e31
	dw ItemNameIndex_01e_4e37
	dw ItemNameIndex_01e_4e45
	dw ItemNameIndex_01e_4e4b
	dw ItemNameIndex_01e_4e1b
	dw ItemNameIndex_01e_4e23
	dw ItemNameIndex_01e_4e29
	dw ItemNameIndex_01e_4e2d
	dw ItemNameIndex_01e_4e15
	dw ItemNameIndex_01e_4e0f
	dw ItemNameIndex_01e_4e0b
	dw ItemNameIndex_01e_4df3
	dw ItemNameIndex_01e_4df7
	dw ItemNameIndex_01e_4dfb
	dw ItemNameIndex_01e_4dfd
	dw ItemNameIndex_01e_4e03
	dw ItemNameIndex_01e_4e07
	dw ItemNameIndex_01e_4de3
	dw ItemNameIndex_01e_4deb
	dw ItemNameIndex_01e_4db1
	dw ItemNameIndex_01e_4db7
	dw ItemNameIndex_01e_4dbb
	dw ItemNameIndex_01e_4dbd
	dw ItemNameIndex_01e_4dc3
	dw ItemNameIndex_01e_4dc9
	dw ItemNameIndex_01e_4dd3
	dw ItemNameIndex_01e_4dd5
	dw ItemNameIndex_01e_4dd9
	dw ItemNameIndex_01e_4ddb
	dw ItemNameIndex_01e_4d99
	dw ItemNameIndex_01e_4da1
	dw ItemNameIndex_01e_4da5
	dw ItemNameIndex_01e_4da7
	dw ItemNameIndex_01e_4da9
	dw ItemNameIndex_01e_4dad
	dw ItemNameIndex_01e_4e65

ItemNameIndex_01e_4d99:
	db $00, $3a
	db $00, $42
	db $00, $35
	db $00, $17

ItemNameIndex_01e_4da1:
	db $00, $43
	db $00, $47

ItemNameIndex_01e_4da5:
	db $00, $49

ItemNameIndex_01e_4da7:
	db $00, $4c

ItemNameIndex_01e_4da9:
	db $00, $4f
	db $00, $51

ItemNameIndex_01e_4dad:
	db $01, $09
	db $00, $53

ItemNameIndex_01e_4db1:
	db $00, $2c
	db $01, $0a
	db $00, $2e

ItemNameIndex_01e_4db7:
	db $00, $24
	db $00, $26

ItemNameIndex_01e_4dbb:
	db $00, $3e

ItemNameIndex_01e_4dbd:
	db $00, $0c
	db $00, $08
	db $00, $03

ItemNameIndex_01e_4dc3:
	db $00, $3b
	db $00, $30
	db $00, $23

ItemNameIndex_01e_4dc9:
	db $00, $24
	db $00, $0b
	db $00, $22
	db $00, $54
	db $00, $27

ItemNameIndex_01e_4dd3:
	db $00, $41

ItemNameIndex_01e_4dd5:
	db $00, $07
	db $00, $45

ItemNameIndex_01e_4dd9:
	db $00, $1d

ItemNameIndex_01e_4ddb:
	db $00, $4d
	db $02, $20
	db $00, $24
	db $00, $3d

ItemNameIndex_01e_4de3:
	db $01, $14
	db $00, $25
	db $01, $0d
	db $00, $26

ItemNameIndex_01e_4deb:
	db $00, $08
	db $00, $0d
	db $00, $02
	db $00, $36

ItemNameIndex_01e_4df3:
	db $00, $11
	db $00, $28

ItemNameIndex_01e_4df7:
	db $01, $0f
	db $00, $4b

ItemNameIndex_01e_4dfb:
	db $00, $0c

ItemNameIndex_01e_4dfd:
	db $00, $2a
	db $00, $4a
	db $00, $38

ItemNameIndex_01e_4e03:
	db $00, $08
	db $00, $14

ItemNameIndex_01e_4e07:
	db $00, $27
	db $00, $03

ItemNameIndex_01e_4e0b:
	db $00, $44
	db $00, $58

ItemNameIndex_01e_4e0f:
	db $00, $27
	db $00, $1d
	db $00, $16

ItemNameIndex_01e_4e15:
	db $00, $1c
	db $00, $39
	db $00, $13

ItemNameIndex_01e_4e1b:
	db $00, $07
	db $00, $1b
	db $00, $36
	db $00, $32

ItemNameIndex_01e_4e23:
	db $00, $23
	db $00, $12
	db $00, $22

ItemNameIndex_01e_4e29:
	db $01, $14
	db $01, $15

ItemNameIndex_01e_4e2d:
	db $00, $06
	db $00, $02

ItemNameIndex_01e_4e31:
	db $00, $1d
	db $00, $11
	db $00, $23

ItemNameIndex_01e_4e37:
	db $00, $06
	db $01, $0c
	db $00, $1b
	db $00, $1c
	db $00, $0c
	db $01, $13
	db $01, $11

ItemNameIndex_01e_4e45:
	db $00, $18
	db $00, $23
	db $00, $31

ItemNameIndex_01e_4e4b:
	db $00, $27
	db $00, $03
	db $00, $24
	db $00, $13
	db $01, $01
	db $00, $03

ItemNameIndex_01e_4e57:
	db $00, $27
	db $00, $0b
	db $00, $04

ItemNameIndex_01e_4e5d:
	db $00, $0c
	db $00, $24
	db $00, $01
	db $00, $05

ItemNameIndex_01e_4e65:
	db $00, $0c
	db $00, $24
	db $00, $01
	db $00, $05

ItemNameIndex_01e_4e6d:
	db $00, $02
	db $00, $05
	db $00, $21

ItemNameIndex_01e_4e73:
	db $00, $4b
	db $01, $08
	db $00, $07

ItemNameIndex_01e_4e79:
	db $00, $11
	db $00, $12
	db $00, $27
	db $00, $09
	db $00, $0c

ItemNameIndex_01e_4e83:
	db $00, $04
	db $00, $59
	db $00, $27
	db $00, $11

ItemNameIndex_01e_4e8b:
	db $00, $0a
	db $00, $06

ItemNameIndex_01e_4e8f:
	db $00, $12
	db $00, $3f
	db $00, $43
	db $00, $26

ItemNameIndex_01e_4e97:
	db $00, $55

ItemNameIndex_01e_4e99:
	db $00, $27
	db $00, $29

ItemNameIndex_01e_4e9d:
	db $00, $12

ItemNameIndex_01e_4e9f:
	db $00, $11

ItemNameIndex_01e_4ea1:
	db $00, $06

ItemNameIndex_01e_4ea3:
	db $00, $27
	db $00, $34
	db $00, $01
	db $00, $0c
	db $00, $26

ItemNameIndex_01e_4ead:
	db $00, $13

ItemNameIndex_01e_4eaf:
	db $00, $03
	db $00, $06

ItemNameIndex_01e_4eb3:
	db $00, $0a

ItemNameIndex_01e_4eb5:
	db $02, $02
	db $00, $24
	db $00, $1e
	db $00, $2f

Pointers_01e_4ebd:
	dw ItemNames
	dw EquipmentNames
	dw KeyItemNames

ItemNames:
	dw text_1e_4f91
	dw text_1e_4f97
	dw text_1e_4f9d
	dw text_1e_4fa3
	dw text_1e_4faa
	dw text_1e_4fb0
	dw text_1e_4fb7
	dw text_1e_4fbe
	dw text_1e_4fc4
	dw text_1e_4fcc
	dw text_1e_4fd2
	dw text_1e_4fda
	dw text_1e_4fdf
	dw text_1e_4fe6
	dw text_1e_4fed
	dw text_1e_4ff2
	dw text_1e_4ffa
	dw text_1e_5001
	dw text_1e_5009
	dw text_1e_500e
	dw text_1e_5014
	dw text_1e_5019
	dw text_1e_5020
	dw text_1e_5026
	dw text_1e_502e
	dw text_1e_5034
	dw text_1e_503a
	dw text_1e_503f
	dw text_1e_5045
	dw text_1e_504a
	dw text_1e_5052
	dw text_1e_5058
	dw text_1e_505d
	dw text_1e_5066
	dw text_1e_506e
	dw text_1e_5073
	dw text_1e_507b
	dw text_1e_5083
	dw text_1e_508b
	dw text_1e_5092
	dw text_1e_5099
	dw text_1e_50a0
	dw text_1e_50a7
	dw text_1e_50ae
	dw text_1e_50b5
	dw text_1e_50bc
	dw text_1e_50c3
	dw text_1e_50ca
	dw text_1e_50d1
	dw text_1e_50d8
	dw text_1e_50e0
	dw text_1e_50e8
	dw text_1e_50f0
	dw text_1e_50f8
	dw text_1e_5100
	dw text_1e_5108
	dw text_1e_5110
	dw text_1e_5118
	dw text_1e_5120
	dw text_1e_5128
	dw text_1e_5130
	dw text_1e_5138
	dw text_1e_5140
	dw text_1e_5148
	dw text_1e_5150
	dw text_1e_5158
	dw text_1e_5160
	dw text_1e_5168
	dw text_1e_5170
	dw text_1e_5178
	dw text_1e_5180
	dw text_1e_5188
	dw text_1e_5190
	dw text_1e_5198
	dw text_1e_51a0
	dw text_1e_51a8
	dw text_1e_51b0
	dw text_1e_51b8
	dw text_1e_51c0
	dw text_1e_51c8
	dw text_1e_51d0
	dw text_1e_51d8
	dw text_1e_51e0
	dw text_1e_51e8
	dw text_1e_51f0
	dw text_1e_51f8
	dw text_1e_5200
	dw text_1e_5208
	dw text_1e_5210
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218

INCLUDE "data/text/item_names.asm"

EquipmentNames:
	dw text_1e_5268
	dw text_1e_526e
	dw text_1e_5274
	dw text_1e_527c
	dw text_1e_5284
	dw text_1e_528c
	dw text_1e_5294
	dw text_1e_529c
	dw text_1e_52a4
	dw text_1e_52ab
	dw text_1e_52b1
	dw text_1e_52b7
	dw text_1e_52c0
	dw text_1e_52c6
	dw text_1e_52cf
	dw text_1e_52d8
	dw text_1e_52de
	dw text_1e_52e2
	dw text_1e_52ea
	dw text_1e_52f2
	dw text_1e_52fa
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302

INCLUDE "data/text/equipment_names.asm"

KeyItemNames:
	dw text_1e_5358
	dw text_1e_535e
	dw text_1e_5365
	dw text_1e_536e
	dw text_1e_5374
	dw text_1e_5379
	dw text_1e_5382
	dw text_1e_5388
	dw text_1e_538d
	dw text_1e_5395
	dw text_1e_539c
	dw text_1e_53a2
	dw text_1e_53aa
	dw text_1e_53b3
	dw text_1e_53ba
	dw text_1e_53c2
	dw text_1e_53c8
	dw text_1e_53cf
	dw text_1e_53d7
	dw text_1e_53de
	dw text_1e_53e7
	dw text_1e_53ec
	dw text_1e_53f4
	dw text_1e_53fc
	dw text_1e_5404
	dw text_1e_540b
	dw text_1e_5412
	dw text_1e_541a
	dw text_1e_5421
	dw text_1e_5427
	dw text_1e_542c
	dw text_1e_5432
	dw text_1e_5437
	dw text_1e_5440
	dw text_1e_5449
	dw text_1e_5451
	dw text_1e_5458
	dw text_1e_5461
	dw text_1e_5468
	dw text_1e_546f
	dw text_1e_5478

INCLUDE "data/text/key_item_names.asm"

INCLUDE "data/monsters/menu_icons.asm"

; type-name index per wBattleAnimID (low nibble -> TypeNames)
TypeNameIndex_01e_551f:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $04
	db $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $03, $03, $03, $03, $03, $03, $03, $06, $06, $06, $05, $06, $06, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $05, $05, $05, $05, $05, $05, $05, $05, $05
	db $05, $08, $08, $08, $08, $08, $08, $06, $06, $06, $08, $08, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $06, $00, $00

TypeNames:
	dw text_1e_55c0
	dw text_1e_55c3
	dw text_1e_55c6
	dw text_1e_55c9
	dw text_1e_55cc
	dw text_1e_55cf
	dw text_1e_55d2
	dw text_1e_55d5
	dw text_1e_55d8

INCLUDE "data/text/mon_types.asm"

INCLUDE "data/icon_pointers.asm"

PointerTable_01e_57ed:
	dw text_1e_5829
	dw text_1e_582a
	dw text_1e_5836
	dw text_1e_5841
	dw text_1e_584f
	dw text_1e_585f
	dw text_1e_586c
	dw text_1e_5875
	dw text_1e_587d
	dw text_1e_5888
	dw text_1e_5890
	dw text_1e_5898
	dw text_1e_58a5
	dw text_1e_58b1
	dw text_1e_58c1
	dw text_1e_58d4
	dw text_1e_58f0
	dw text_1e_58fb
	dw text_1e_5907
	dw text_1e_591f
	dw text_1e_592c
	dw text_1e_5947
	dw text_1e_595f
	dw text_1e_5971
	dw text_1e_597a
	dw text_1e_598b
	dw text_1e_599b
	dw text_1e_59a9
	dw text_1e_59b7
	dw text_1e_59c4

INCLUDE "data/text/bank1e_misc.asm"

PointerTable_01e_59cc:
	dw Pointers_01e_59d2
	dw Pointers_01e_614f
	dw Pointers_01e_63e5
Pointers_01e_59d2:
	dw text_1e_5aa0
	dw text_1e_5aa1
	dw text_1e_5ab2
	dw text_1e_5ac6
	dw text_1e_5ad7
	dw text_1e_5aec
	dw text_1e_5b04
	dw text_1e_5b1b
	dw text_1e_5b34
	dw text_1e_5b4d
	dw text_1e_5b66
	dw text_1e_5b7e
	dw text_1e_5b97
	dw text_1e_5ba2
	dw text_1e_5bad
	dw text_1e_5bb8
	dw text_1e_5bc3
	dw text_1e_5bce
	dw text_1e_5bd7
	dw text_1e_5bee
	dw text_1e_5c05
	dw text_1e_5c1a
	dw text_1e_5c2c
	dw text_1e_5c3f
	dw text_1e_5c4d
	dw text_1e_5c65
	dw text_1e_5c7d
	dw text_1e_5c95
	dw text_1e_5cad
	dw text_1e_5cc2
	dw text_1e_5cdc
	dw text_1e_5cf6
	dw text_1e_5d10
	dw text_1e_5d2a
	dw text_1e_5d41
	dw text_1e_5d5c
	dw text_1e_5d7a
	dw text_1e_5d95
	dw text_1e_5db1
	dw text_1e_5dcc
	dw text_1e_5de6
	dw text_1e_5df6
	dw text_1e_5e08
	dw text_1e_5e1a
	dw text_1e_5e2c
	dw text_1e_5e3c
	dw text_1e_5e4c
	dw text_1e_5e5e
	dw text_1e_5e70
	dw text_1e_5e83
	dw text_1e_5e93
	dw text_1e_5ea4
	dw text_1e_5eb6
	dw text_1e_5ec7
	dw text_1e_5eda
	dw text_1e_5eea
	dw text_1e_5efb
	dw text_1e_5f0c
	dw text_1e_5f1d
	dw text_1e_5f2f
	dw text_1e_5f41
	dw text_1e_5f53
	dw text_1e_5f65
	dw text_1e_5f78
	dw text_1e_5f8a
	dw text_1e_5f9a
	dw text_1e_5fac
	dw text_1e_5fbd
	dw text_1e_5fcd
	dw text_1e_5fdd
	dw text_1e_5fee
	dw text_1e_5ffd
	dw text_1e_600d
	dw text_1e_601e
	dw text_1e_6032
	dw text_1e_6043
	dw text_1e_6055
	dw text_1e_6067
	dw text_1e_6078
	dw text_1e_6089
	dw text_1e_609b
	dw text_1e_60ae
	dw text_1e_60c2
	dw text_1e_60d3
	dw text_1e_60e7
	dw text_1e_60f8
	dw text_1e_610a
	dw text_1e_611c
	dw text_1e_612e
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f

INCLUDE "data/text/bank1e_misc2.asm"

INCLUDE "data/text/bank1e_5c3f.asm"

Pointers_01e_614f:
	dw text_1e_6197 
	dw text_1e_6198 
	dw text_1e_61b7 
	dw text_1e_61d1 
	dw text_1e_61e8 
	dw text_1e_61ff 
	dw text_1e_6216 
	dw text_1e_622d 
	dw text_1e_6244 
	dw text_1e_625b 
	dw text_1e_6271 
	dw text_1e_6291 
	dw text_1e_62b1 
	dw text_1e_62d1 
	dw text_1e_62f1 
	dw text_1e_6311 
	dw text_1e_6331 
	dw text_1e_6350 
	dw text_1e_636e 
	dw text_1e_638b 
	dw text_1e_63a8 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5
	INCLUDE "data/text/bank1e_6197.asm"
Pointers_01e_63e5:
	dw text_1e_6437 
	dw text_1e_6438 
	dw text_1e_6442 
	dw text_1e_644b 
	dw text_1e_6458 
	dw text_1e_645d 
	dw text_1e_6466 
	dw text_1e_646c 
	dw text_1e_6471 
	dw text_1e_6479 
	dw text_1e_6480 
	dw text_1e_6486 
	dw text_1e_648e 
	dw text_1e_6497 
	dw text_1e_649e 
	dw text_1e_64a6 
	dw text_1e_64ac 
	dw text_1e_64b3 
	dw text_1e_64bb 
	dw text_1e_64c2 
	dw text_1e_64cf 
	dw text_1e_64d4 
	dw text_1e_64dc 
	dw text_1e_64e4 
	dw text_1e_64ec 
	dw text_1e_64f3 
	dw text_1e_64fa 
	dw text_1e_6502 
	dw text_1e_6509 
	dw text_1e_650f 
	dw text_1e_6514 
	dw text_1e_651a 
	dw text_1e_651f 
	dw text_1e_6528 
	dw text_1e_6531 
	dw text_1e_6539 
	dw text_1e_6540 
	dw text_1e_6549 
	dw text_1e_6550 
	dw text_1e_6557 
	dw text_1e_6560
	INCLUDE "data/text/bank1e_6437.asm"

Pointers_01e_6567:
	dw text_1e_6635
	dw text_1e_6636
	dw text_1e_6646
	dw text_1e_6659
	dw text_1e_6669
	dw text_1e_667e
	dw text_1e_6689
	dw text_1e_6694
	dw text_1e_66a0
	dw text_1e_66ac
	dw text_1e_66b8
	dw text_1e_66c4
	dw text_1e_66d1
	dw text_1e_66db
	dw text_1e_66e5
	dw text_1e_66ef
	dw text_1e_66f9
	dw text_1e_6703
	dw text_1e_670f
	dw text_1e_6721
	dw text_1e_6733
	dw text_1e_6741
	dw text_1e_674e
	dw text_1e_675c
	dw text_1e_676c
	dw text_1e_6775
	dw text_1e_677e
	dw text_1e_6788
	dw text_1e_6792
	dw text_1e_679a
	dw text_1e_67a4
	dw text_1e_67ae
	dw text_1e_67b9
	dw text_1e_67c4
	dw text_1e_67ce
	dw text_1e_67e4
	dw text_1e_67ff
	dw text_1e_681a
	dw text_1e_682f
	dw text_1e_6837
	dw text_1e_683d
	dw text_1e_6847
	dw text_1e_6855
	dw text_1e_6863
	dw text_1e_6871
	dw text_1e_687d
	dw text_1e_6889
	dw text_1e_6897
	dw text_1e_68a5
	dw text_1e_68b3
	dw text_1e_68bf
	dw text_1e_68cc
	dw text_1e_68da
	dw text_1e_68e7
	dw text_1e_68f5
	dw text_1e_6901
	dw text_1e_690e
	dw text_1e_691a
	dw text_1e_6925
	dw text_1e_6933
	dw text_1e_6941
	dw text_1e_694f
	dw text_1e_695d
	dw text_1e_696b
	dw text_1e_6979
	dw text_1e_6985
	dw text_1e_6993
	dw text_1e_69a0
	dw text_1e_69ac
	dw text_1e_69b8
	dw text_1e_69c4
	dw text_1e_69cd
	dw text_1e_69d9
	dw text_1e_69e6
	dw text_1e_69f6
	dw text_1e_6a03
	dw text_1e_6a11
	dw text_1e_6a1f
	dw text_1e_6a2c
	dw text_1e_6a39
	dw text_1e_6a47
	dw text_1e_6a55
	dw text_1e_6a63
	dw text_1e_6a70
	dw text_1e_6a80
	dw text_1e_6a8d
	dw text_1e_6a9b
	dw text_1e_6aa9
	dw text_1e_6ab7
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	INCLUDE "data/text/bank1e_6635.asm"
Func_01e_6acd:
	ld a, [$DCE6]
	and a
	jr nz, .asm_6ad9
	ldh a, [hFFD6]
	and a
	jp nz, .asm_6c6b
.asm_6ad9
	ld de, MonSpeciesTable_01e_6d3b
	ld a, [wEnemyMonSpecies]
	ld l, a
	ld h, $00
	add hl, de
	ld b, [hl]
	and a
	jp z, .asm_6c6b
	ld a, [wd9f3]
	cp $01
	jr z, .asm_6afc
	cp $02
	jp z, .asm_6bec
	cp $03
	jp z, .asm_6c1f
	ld d, $01
	ret
.asm_6afc
	ld a, b
	cp $01
	jp z, .asm_6b0a
	cp $02
	jp z, .asm_6bab
	jp .asm_6c6b
.asm_6b0a
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $16
	jp nc, .asm_6b2a
	cp $0A
	jp nc, .asm_6b6a
	jr .asm_6b4a
.asm_6b2a
	ld de, unk_01e_6c6e
	ld a, [$D0EA]
	inc a
	ld [$D0EA], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6b43
	xor a
	ld [$D0EA], a
	jr .asm_6b2a
.asm_6b43
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6b4a
	ld de, unk_01e_6c97
	ld a, [$D0E6]
	inc a
	ld [$D0E6], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6b63
	xor a
	ld [$D0E6], a
	jr .asm_6b4a
.asm_6b63
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6b6a
	ld de, unk_01e_6cc0
	ld a, [$D0E7]
	inc a
	ld [$D0E7], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6b83
	xor a
	ld [$D0E7], a
	jr .asm_6b6a
.asm_6b83
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6b8a
	ld de, unk_01e_6d12
	ld a, [$D0E9]
	inc a
	ld [$D0E9], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6ba4
	xor a
	ld [$D0E9], a
	jp .asm_6b8a
.asm_6ba4
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6bab
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $16
	jp nc, .asm_6c6b
	cp $0A
	jp nc, .asm_6b8a
	jp .asm_6b6a
.asm_6bcc
	ld de, unk_01e_6ce9
	ld a, [$D0E8]
	inc a
	ld [$D0E8], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6be5
	xor a
	ld [$D0E8], a
	jr .asm_6bcc
.asm_6be5
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6bec
	ld a, b
	cp $01
	jr z, .asm_6bfe
	cp $02
	jp z, .asm_6b0a
	cp $03
	jp z, .asm_6bab
	jp .asm_6c6b
.asm_6bfe
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $20
	jp nc, .asm_6b6a
	cp $10
	jp nc, .asm_6b4a
	ld d, $01
	ret
.asm_6c1f
	ld a, b
	cp $01
	jr z, .asm_6c36
	cp $02
	jp z, .asm_6bfe
	cp $03
	jp z, .asm_6b0a
	cp $04
	jp z, .asm_6bab
	jp .asm_6c6b
.asm_6c36
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $18
	jp nc, .asm_6b4a
	ld d, $01
	ret
.asm_6c52
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $0F
	jp c, .asm_6b8a
.asm_6c6b
	ld d, $00
	ret
; TODO: unk_ - data, referenced via `ld de, unk_01e_6c6e`
unk_01e_6c6e:
	db $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $01, $01, $01, $01, $00, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $01, $01
	db $01, $01, $00, $01, $01, $01, $01, $01, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6c97`
unk_01e_6c97:
	db $00, $00, $01, $00, $00, $01, $00, $00, $00, $01, $00, $00, $01, $00, $01, $00
	db $00, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $01, $00, $00, $00, $00
	db $01, $00, $00, $00, $00, $00, $00, $00, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6cc0`
unk_01e_6cc0:
	db $00, $01, $01, $00, $01, $00, $00, $00, $01, $00, $01, $00, $00, $01, $00, $01
	db $00, $01, $00, $00, $00, $01, $01, $00, $01, $00, $01, $01, $00, $01, $00, $01
	db $00, $00, $00, $01, $00, $00, $01, $00, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6ce9`
unk_01e_6ce9:
	db $00, $01, $01, $00, $00, $01, $01, $00, $01, $00, $01, $00, $01, $01, $01, $00
	db $01, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $00
	db $00, $01, $00, $01, $00, $01, $00, $00, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6d12`
unk_01e_6d12:
	db $01, $01, $01, $00, $01, $01, $01, $00, $01, $01, $01, $01, $00, $01, $01, $00
	db $01, $01, $00, $01, $01, $00, $01, $01, $01, $01, $00, $01, $01, $01, $00, $01
	db $00, $01, $00, $01, $01, $00, $01, $00, $ff
MonSpeciesTable_01e_6d3b:
	db $00, $02, $02, $03, $01, $02, $03, $02, $01, $01, $02, $01, $03, $01, $02, $01
	db $01, $03, $01, $02, $03, $02, $03, $03, $02, $01, $03, $02, $02, $02, $02, $03
	db $03, $02, $01, $02, $01, $03, $03, $02, $02, $01, $02, $02, $03, $03, $03, $03
	db $02, $03, $01, $02, $02, $03, $03, $02, $02, $03, $02, $03, $02, $03, $03, $02
	db $03, $02, $01, $03, $02, $03, $03, $02, $02, $03, $02, $02, $02, $03, $03, $02
	db $02, $03, $03, $03, $02, $03, $03, $03, $02, $03, $02, $03, $02, $02, $03, $03
	db $02, $03, $02, $03, $03, $02, $02, $03, $03, $03, $01, $03, $02, $03, $02, $03
	db $03, $02, $03, $02, $03, $01, $01, $03, $03, $03, $02, $03, $02, $03, $03, $02
	db $02, $02, $03, $02, $02, $03, $02, $01, $02, $02, $03, $01, $03, $02, $02, $03
	db $02, $02, $03, $02, $02, $02, $03, $01, $03, $00, $05, $05, $05, $05, $05, $06
INCLUDE "data/text/bank1e_6ddb.asm"

LoadItemNameByIndex::
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld de, ItemNameIndex_01e_6e24
	ld a, [hFFB8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1f4], a
	push hl
	ld de, Pointers_01e_4ebd
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, [hli]
	ld [wd9f3], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ld a, 1
	ld [wd9d3], a
	farcall asm_039_479f
	ret

; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
; 16 (category, index) records, consumed by LoadItemNameByIndex / LoadItemNameByMapType
ItemNameIndex_01e_6e24:
	db $00, $01
	db $00, $06
	db $01, $02
	db $00, $0d
	db $00, $23
	db $00, $02
	db $00, $24
	db $01, $10
	db $00, $57
	db $00, $05
	db $00, $0b
	db $00, $4b
	db $00, $21
	db $00, $0a
	db $01, $11
	db $00, $10

INCLUDE "data/text/bank1e_misc4.asm"

LoadShopItemName::
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld a, [wItemNameCategory]
	cp 7
	jr z, asm_01e_6e89
	ld [wd1f4], a
	ld de, Pointers_01e_4ebd
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wItemNameIndex]
	ld [wd9f3], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ld a, 1
	ld [wd9d3], a
	farcall asm_039_479f
	ret

asm_01e_6e89:
	ld a, [wItemNameIndex]
	ld de, PriceOptions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd9cd], a
	ld a, [hli]
	ld [wd9cc], a
	ld a, [wItemNameIndex]
	ld de, PriceTexts
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	farcall AddExpToTotal
	ret

PriceOptions:
	bigdw 500
	bigdw 500
	bigdw 1000
	bigdw 1500
	bigdw 2000
	bigdw 2500
	

PriceTexts:
	dw text_1e_6ece
	dw text_1e_6ece
	dw text_1e_6ed5
	dw text_1e_6edd
	dw text_1e_6ee5
	dw text_1e_6eed
	
INCLUDE "data/text/store_price_options.asm"

