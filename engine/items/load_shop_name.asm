LoadShopItemName::
	ld a, l
	ld [wSavedTextPos], a
	ld a, h
	ld [wSavedTextPos + 1], a
	ld a, [wItemNameCategory]
	cp ITEMNAMECAT_PRICE
	jr z, asm_01e_6e89
	ld [wItemCategory], a
	ld de, ItemNameCategories
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wItemNameIndex]
	ld [wCurItemID], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ld a, 1
	ld [wItemQty], a
; NB: dual purpose — besides loading the NAME for the textbox, this farcall GRANTS
; the item (1 of wCurItemID in category wItemCategory). Printing an "obtained"/
; "found" item's name is what deposits it in the bag. Display-only contexts use
; PrintItemName instead.
	farcall AddItemToBag
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
