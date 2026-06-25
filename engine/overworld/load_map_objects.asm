LoadVisibleMapObjects:
	ld hl, wda00
.loop
	ldh a, [hFFAA]
	ld d, a
	ldh a, [hFFAB]
	ld e, a
	push hl
	ld a, [hli]
	cp $88
	jr z, .endList
	cp $ff
	jr nz, .skipObject
	inc hl
	ld a, d
	cp $02
	jr c, .checkY
	sub $02
.checkY
	cp [hl]
	jr nc, .skipObject
	add $0c
	cp [hl]
	jr c, .skipObject
	inc hl
	ld a, e
	cp $02
	jr c, .checkX
	sub $02
.checkX
	cp [hl]
	jr nc, .skipObject
	add $0b
	cp [hl]
	jr c, .skipObject
	inc hl
	ld a, [hli]
	and a
	jr nz, .checkFlag
	inc hl
	inc hl
	inc hl
	jr .loadSprite
.checkFlag
	push bc
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [de]
	ld b, a
	ld a, c
	and a
	jr z, .testFlagBit
.shiftLoop
	srl b
	dec c
	jr nz, .shiftLoop
.testFlagBit
	ld a, b
	and $01
	cp [hl]
	jr z, .flagMatch
	pop bc
	jr .skipObject
.flagMatch
	pop bc
.loadSprite
	pop de
	push de
	call LoadObjectSprite
	ld a, c
	and a
	jr z, .noFacing
	swap a
	and $0f
	srl a
	pop hl
	ld [hl], a
	jr .nextObject
.noFacing
	pop hl
	jr .nextObject
.skipObject
	pop hl
.nextObject
	ld bc, $000c
	add hl, bc
	jp .loop
.endList
	pop hl
	ret
