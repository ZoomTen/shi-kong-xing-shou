GetEastFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	ld c, a
	ld b, 0
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	add $10
	ld e, a
	ld d, 0
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wEastFacingTile], a
	ret

GetWestFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	ld c, a
	ld b, 0
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	sub $10
	ld e, a
	ld d, 0
	cp $e0
	jr c, .addXOffset
	ld d, $ff

.addXOffset:
	add hl, de
	ld d, 0
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wWestFacingTile], a
	ret

GetNorthFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	sub $10
	ld c, a
	ld b, 0
	cp $e0
	jr c, .addScrollY
	ld b, $ff

.addScrollY:
	add hl, bc
	ld b, 0
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	ld e, a
	ld d, 0
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wNorthFacingTile], a
	ret

GetSouthFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	add $10
	ld c, a
	ld b, 0
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	ld e, a
	ld d, 0
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wSouthFacingTile], a
	ret
