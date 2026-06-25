UpdateObjectAnimations::
	ld bc, wd1a0
.objectLoop
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	and a
	jr z, .nextObject
	ld hl, $0003
	add hl, bc
	ld de, .Jumptable
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.nextObject
	ld hl, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	ld c, l
	ld b, h
	jr .objectLoop
.Jumptable:
	dw .state0
	dw .state1
	dw .state2
	dw .state3
	dw .state4
	dw .state5
	dw .state6
	dw .state7Done
.state7Done
	ret
.state5
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr z, .s5Phase0
	cp $01
	jr z, .s5Phase1
.s5Phase0
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $10
	jp c, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld hl, $0002
	add hl, bc
	ld [hl], $1B
	jp .nextObject
.s5Phase1
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $07
	jr nc, .s5Reset
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $1B
	jr z, .s5SetFrame1C
	ld [hl], $1B
	jp .nextObject
.s5SetFrame1C
	ld [hl], $1C
	jp .nextObject
.s5Reset
	call .clearObjectState
	jp .nextObject
	jp .nextObject
	jp .nextObject
.state6
	jp .nextObject
.state0
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s0Phase1
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .nextObject
.s0Phase1
	ld a, [hl]
	cp $01
	jr nz, .s0Default
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .s0Reset
	cp $0A
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $05
	jr nz, .s0SetFrame05
	ld [hl], $06
	jp .nextObject
.s0SetFrame05
	ld [hl], $05
	jp .nextObject
.s0Reset
	call .clearObjectState
	jp .nextObject
.s0Default
	jp .nextObject
.state1
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s1Phase1
	ldh a, [hFadeFrameCounter]
	and $01
	jp nz, .nextObject
	ld a, [bc]
	inc a
	ld [bc], a
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0A
	jp c, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	jp .nextObject
.s1Phase1
	cp $01
	jr nz, .s1Default
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .s1Reset
	cp $0A
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $07
	jr nz, .s1SetFrame07
	ld [hl], $06
	jp .nextObject
.s1SetFrame07
	ld [hl], $07
	jp .nextObject
.s1Reset
	call .clearObjectState
	jp .nextObject
.s1Default
	jp .nextObject
.state2
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s2Phase1
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .nextObject
.s2Phase1
	cp $01
	jr nz, .s2Default
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0E
	jr nc, .s2Reset
	cp $06
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $09
	jr nz, .s2SetFrame09
	ld [hl], $06
	jp .nextObject
.s2SetFrame09
	ld [hl], $09
	jp .nextObject
.s2Reset
	call .clearObjectState
	jp .nextObject
.s2Default
	jp .nextObject
.state3
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s3Phase1
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .nextObject
.s3Phase1
	ld a, [hl]
	cp $01
	jr nz, .s3Default
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .s3Reset
	cp $0A
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $0B
	jr nz, .s3SetFrame0B
	ld [hl], $06
	jp .nextObject
.s3SetFrame0B
	ld [hl], $0B
	jp .nextObject
.s3Reset
	call .clearObjectState
	jp .nextObject
.s3Default
	jp .nextObject
.state4
	ldh a, [hFadeFrameCounter]
	and $0F
	jp nz, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $0D
	jr nz, .s4SetFrame0D
	ld a, $06
	ld [hl], a
	jr .s4Phase2
.s4SetFrame0D
	ld a, $0D
	ld [hl], a
.s4Phase2
	ldh a, [hFadeFrameCounter]
	and $1F
	jp nz, .nextObject
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $04
	jr nc, .s4Reset
	jp .nextObject
.s4Reset
	call .clearObjectState
	jp .nextObject
	jp .nextObject
.clearObjectState
	push bc
	pop hl
	ld d, $08
	xor a
.clearLoop
	ld [hli], a
	dec d
	jr nz, .clearLoop
	ret

; TODO: a map of some kind?
	db $E0, $00, $00, $F0, $01, $02, $03, $04, $05, $06, $07, $ED, $F0, $03, $08, $09
	db $0A, $0B, $0C, $0D, $EC, $F0, $0E, $0F, $10, $0D, $EE, $F0, $11, $12, $10, $0D
	db $EE, $F0, $13, $14, $10, $15, $16, $17, $18, $ED, $F0, $19, $1A, $1B, $1C, $1A
	db $1D, $1E, $ED, $F0, $18, $1F, $20, $21, $22, $0C, $0D, $E2, $EF
