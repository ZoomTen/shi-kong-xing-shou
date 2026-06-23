NextLivePartyMon::
	ld de, wdd00
.asm_0faf
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
	jr .asm_0faf

PrevLivePartyMon::
	ld de, wdd00
.asm_0fc7
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
	jr .asm_0fc7

GetPartyMonPtr::
	ld a, [wSelectedOption]
GetPartyMonPtrByIndex::
	ld hl, wPartyMons
GetMonStructPtr::
	ld de, $16
	and a
	jr z, .asm_0fec

.asm_0fe8
	add hl, de
	dec a
	jr nz, .asm_0fe8

.asm_0fec
	push hl
	pop bc
	ret

