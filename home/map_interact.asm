UpdateQueuedSpriteSlot::
	ld a, [_BANKNUM]
	push af

	ld hl, 3
	ld de, wd9fa
	add hl, bc
REPT 4
	ld a, [hli]
	ld [de], a
	inc de
ENDR

	ld a, 1
	sub [hl]
	ld [hl], a
	ld [wd9fe], a
	ld hl, $0d
	add hl, bc
	ld [hl], $0a
	push bc
	call AnimateQueuedSprite

	pop bc
	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld c, 4
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .copy

	pop af
	rst Bankswitch
	ret

CheckFoundItem::
	homecall CheckFoundItemEvent
	ret

GetSignpostText::
	homecall LoadSignpostText
	ret

