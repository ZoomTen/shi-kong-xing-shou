LCD::
	di
	push af
	push bc
	push de
	push hl

; run LCD routine pointer
	ld a, [wLCDFunction]
	ld l, a
	ld a, [wLCDFunction + 1]
	ld h, a
	or l
	and a
	jr z, Finish_LCD
	jp hl

Finish_LCD::
	pop hl
	pop de
	pop bc
	pop af
	ei
	reti
