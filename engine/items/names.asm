LoadItemNameByMapType::
	ld a, l
	ld [wSavedTextPos], a
	ld a, h
	ld [wSavedTextPos + 1], a
	ld de, ItemNameIndexPointers
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
	ld de, ItemNameCategories
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

