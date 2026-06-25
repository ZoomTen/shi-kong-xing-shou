CyclePlayerCharacter:
	ldh a, [hJoypadPressed]
	bit 2, a
	ret z
	ld a, [hMapPredef]
	cp $11
	ret z
	ld a, [wPlayerSpriteID]
	cp 9
	ret z
	ld a, [wPlayerChar]

.nextChar:
	inc a

.checkSlot:
	push af
	ld de, wdd00
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	jr z, .slotEmpty
	pop af
	ld [wPlayerChar], a
	farcall Func_024_4000
	farcall CopyNameByIndex
	ret

.slotEmpty:
	pop af
	cp 8
	jr c, .nextChar
	xor a
	jr .checkSlot
	ret
