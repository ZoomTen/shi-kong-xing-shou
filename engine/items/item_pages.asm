DrawItemPageWithIcons::
	ld de, Pointers_01e_4849
	ld a, [wItemCategory]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, ItemNameCategories
	ld a, [wItemCategory]
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
	farcall PrintItemGridNumber
	pop hl
	pop de
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 4
	jr c, .loop
	ret

DrawItemListPage::
	ld de, Pointers_01e_4849
	ld a, [wItemCategory]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, ItemNameCategories
	ld a, [wItemCategory]
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
	farcall PrintItemListNumber
	pop hl

.skip
	pop de
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 5
	jr c, .loop
	ret

Func_01e_4719::
	push bc
	ld c, a
	ld a, [wItemCategory]
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

Func_01e_4745::
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

Func_01e_475c::
	ld de, PointerTable_01e_59cc
	ld a, [wItemCategory]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld bc, MartGroups
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
	ld [wCurItemID], a
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

Func_01e_47af::
	ld de, PointerTable_01e_59cc
	ld a, [wItemCategory]
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

Func_01e_47fb::
	ld de, PointerTable_01e_59cc
	ld a, [wItemCategory]
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

Func_01e_4837::
	ld a, $a0
	ld [wMenuTextX], a
	ld a, $e8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Pointers_01e_4849::
	dw wItemBag
	dw wEquipmentBag
	dw wKeyItemBag

Func_01e_484f::
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

Func_01e_487b::
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

