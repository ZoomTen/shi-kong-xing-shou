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
	ld [wItemCategory], a
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
; NB: dual purpose — this farcall also GRANTS the item (see AddItemToBag /
; LoadShopItemName). Loading the name for an "obtained" message is what deposits
; it in the bag.
	farcall AddItemToBag
	ret
