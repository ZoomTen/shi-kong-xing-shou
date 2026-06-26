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

