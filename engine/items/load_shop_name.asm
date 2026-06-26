LoadShopItemName::
	ld a, l
	ld [wSavedTextPos], a
	ld a, h
	ld [wSavedTextPos + 1], a
	ld a, [wItemNameCategory]
	cp 7
	jr z, asm_01e_6e89
	ld [wd1f4], a
	ld de, ItemNameCategories
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

asm_01e_6e89::
	ld a, [wItemNameIndex]
	ld de, PriceOptions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wMathScratch + 3], a
	ld a, [hli]
	ld [wMathScratch + 2], a
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
	farcall AddMoney
	ret
