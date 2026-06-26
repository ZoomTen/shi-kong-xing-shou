LoadItemNameByIndex::
	ld a, l
	ld [wSavedTextPos], a
	ld a, h
	ld [wSavedTextPos + 1], a
	ld de, ItemNameIndex_01e_6e24
	ld a, [hFFB8]
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
