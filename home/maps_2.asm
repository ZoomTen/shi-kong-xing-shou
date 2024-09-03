Func_26e1::
	ldh a, [hMapAttrBank]
	rst Bankswitch
	ld hl, wc740
	ld a, l
	ld [wd0b2], a
	ld a, h
	ld [wd0b2 + 1], a
	ld a, [wMapLayoutPointer]
	ld l, a
	ld a, [wMapLayoutPointer + 1]
	ld h, a
	ld b, 5
.asm_26f9
	ld c, 6
.asm_26fb
	push bc
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	ld a, [wMapBlocksPointer]
	ld e, a
	ld a, [wMapBlocksPointer + 1]
	ld d, a
	add hl, hl
	add hl, hl
	add hl, de
	ld b, 2
.asm_270e
	ld c, 2
.asm_2710
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld a, [wMapMetatilesPointer]
	ld e, a
	ld a, [wMapMetatilesPointer + 1]
	ld d, a
	add hl, de
	ld a, [wd0b2]
	ld e, a
	ld a, [wd0b2 + 1]
	ld d, a
	call Func_278b
	ld a, [wd0b2]
	add 2
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	pop hl
	dec c
	jp nz, .asm_2710
	dec b
	jr z, .asm_2756

	ld a, [wd0b2]
	add $2c
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	jp .asm_270e

.asm_2756
	ld a, [wd0b2]
	sub $30
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	sbc 0
	ld [wd0b2 + 1], a
	pop hl
	pop bc
	dec c
	jp nz, .asm_26fb

	ldh a, [hMapWidth]
	sub 6
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [wd0b2]
	add $48
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	dec b
	jp nz, .asm_26f9
	ret

Func_278b::
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a

; add de, $17
	ld a, e
	add $17
	ld e, a
	ld a, d
	adc 0
	ld d, a

	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret
