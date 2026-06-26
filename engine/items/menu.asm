Func_01e_4284::
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

Func_01e_42ba::
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

Func_01e_42e4::
	ld l, d
	ld a, d
	ld h, 0
	ld de, MoveTypes
	add hl, de
	ld a, [hl]
	ld [wd8ff], a
	ret

Func_01e_42f1::
	ld l, d
	ld a, d
	ld [wd9e3], a
	ld h, 0
	ld de, MoveTypes
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

Func_01e_434d::
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

DrawItemMenuPage::
	ld de, ItemNameCategories
	ld a, [wd1f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, MartGroups
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

Func_01e_43d3::
	ld de, ItemPriceTables
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

Func_01e_4416::
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

Func_01e_4441::
	ld de, ItemPriceTables
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

