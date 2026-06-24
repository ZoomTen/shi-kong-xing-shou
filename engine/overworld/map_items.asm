TestFoundItemFlag:
	push bc
	push hl
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .asm_6eb2
.asm_6ead
	rrc l
	dec a
	jr nz, .asm_6ead
.asm_6eb2
	bit 0, l
	jr z, .asm_6eba
	ld a, $01
	jr .asm_6ebb
.asm_6eba
	xor a
.asm_6ebb
	pop hl
	pop bc
	ret

SetFoundItemFlag:
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .asm_6ec9
.asm_6ec4
	rrc l
	dec a
	jr nz, .asm_6ec4
.asm_6ec9
	set 0, l
	ld a, b
	and a
	jr z, .asm_6ed4
.asm_6ecf
	rlc l
	dec a
	jr nz, .asm_6ecf
.asm_6ed4
	ld a, l
	ld [de], a
	ret

CheckFoundItemEvent::
	ld de, FoundItemEventGroups
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wFoundItem]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [wPlayerFacing]
	cp d
	jr nz, .asm_6f1d
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestFoundItemFlag
	and a
	jr nz, .asm_6f1c
	pop hl
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call SetFoundItemFlag
	pop hl
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld [wItemNameCategory], a
	ld a, [hli]
	ld [wItemNameIndex], a
	ret
.asm_6f1c
	pop hl
.asm_6f1d
	xor a
	ld [wFoundItem], a
	ret

FoundItemEventGroups: INCLUDE "data/maps/found_items.asm"
