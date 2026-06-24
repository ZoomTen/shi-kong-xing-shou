LoadSignpostText::
	ld de, SignpostGroups

; map group
	ld a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a

; signpost number
	ld a, [wSignpostNumber]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de

; store to text buffer
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ret

SignpostGroups: INCLUDE "data/maps/signposts.asm"
