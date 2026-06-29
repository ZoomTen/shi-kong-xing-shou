NextLivePartyMon::
	ld de, wdd00
.nextSlot
	ld a, [wSelectedOption]
	inc a
	and $07
	ld [wSelectedOption], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret nz
	jr .nextSlot

PrevLivePartyMon::
	ld de, wdd00
.prevSlot
	ld a, [wSelectedOption]
	dec a
	and $07
	ld [wSelectedOption], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret nz
	jr .prevSlot

GetPartyMonPtr::
	ld a, [wSelectedOption]
GetPartyMonPtrByIndex::
	ld hl, wPartyMons
GetMonStructPtr::
	ld de, $16
	and a
	jr z, .gotPtr

.loop
	add hl, de
	dec a
	jr nz, .loop

.gotPtr
	push hl
	pop bc
	ret

