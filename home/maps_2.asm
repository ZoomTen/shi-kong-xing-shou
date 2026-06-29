_BuildBlockmap::
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
.blockRowLoop
	ld c, 6
.blockColLoop
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
.metatileRowLoop
	ld c, 2
.metatileColLoop
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
	call PlaceMetatile
	ld a, [wd0b2]
	add 2
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	pop hl
	dec c
	jp nz, .metatileColLoop
	dec b
	jr z, .blockDone

	ld a, [wd0b2]
	add $2c
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	jp .metatileRowLoop

.blockDone
	ld a, [wd0b2]
	sub $30
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	sbc 0
	ld [wd0b2 + 1], a
	pop hl
	pop bc
	dec c
	jp nz, .blockColLoop

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
	jp nz, .blockRowLoop
	ret

PlaceMetatile::
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
