UpdatePaletteFade::
	ldh a, [hPaletteFadeState]
	cp 1
	jp z, .fadeStep
	cp 2
	jp z, .ret

; wBGPals2 copy
	ld de, wBGPals2
	push bc
	ld c, $80
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1

; wBGPals1 copy
	pop hl
	ld de, wBGPals1
	ld c, $80
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy2

	ld a, 1
	ldh [hPaletteFadeState], a
	ret

.fadeStep:
	ld hl, wBGPals2
	ld bc, wBGPals1
	ld e, $40
	xor a
	ld [wPaletteFadeChanged], a

.fadeColor:
	push de
	ld a, [hl]
	and $1f
	ld d, a
	ld a, [bc]
	and $1f
	cp d
	jr z, .fadeGreen

	push af
	ld a, [wPaletteFadeDirection]
	and a
	jr z, .redInc

	pop af
	sub $01
	ld d, a
	jr .storeRed

.redInc:
	pop af
	add $01
	ld d, a

.storeRed:
	ld a, $01
	ld [wPaletteFadeChanged], a
	ld a, [bc]
	and $e0
	or d
	ld [bc], a

.fadeGreen:
	ld a, [hl]
	and $f0
	swap a
	ld d, a
	inc hl
	ld a, [hl]
	and $03
	swap a
	or d
	srl a
	ld d, a
	ld a, [bc]
	and $f0
	swap a
	ld e, a
	inc bc
	ld a, [bc]
	and $03
	swap a
	or e
	srl a
	cp d
	jr z, .fadeBlue

	push af
	ld a, [wPaletteFadeDirection]
	and a
	jr z, .greenInc

	pop af
	sub $01
	ld d, a
	jr .storeGreen

.greenInc:
	pop af
	add $01
	ld d, a

.storeGreen:
	ld a, $01
	ld [wPaletteFadeChanged], a
	ld a, d
	sla a
	ld d, a
	and $f0
	swap a
	ld e, a
	ld a, d
	swap a
	and $f0
	ld d, a
	dec bc
	ld a, [bc]
	and $1f
	or d
	ld [bc], a
	inc bc
	ld a, [bc]
	and $fc
	or e
	ld [bc], a

.fadeBlue:
	ld a, [hl]
	srl a
	srl a
	ld d, a
	ld a, [bc]
	srl a
	srl a
	cp d
	jr z, .nextColor

	push af
	ld a, [wPaletteFadeDirection]
	and a
	jr z, .blueInc

	pop af
	sub $01
	ld d, a
	jr .storeBlue

.blueInc:
	pop af
	add $01
	ld d, a

.storeBlue:
	ld a, $01
	ld [wPaletteFadeChanged], a
	ld a, d
	sla a
	sla a
	ld d, a
	ld a, [bc]
	and $03
	or d
	ld [bc], a

.nextColor:
	inc hl
	inc bc
	pop de
	dec e
	jp nz, .fadeColor

	ld a, [wPaletteFadeChanged]
	and a
	jr nz, .ret

	ld a, 0
	ldh [hPaletteFadeState], a
	ret

.ret
	ret

Palette_Black::
REPT $40
	dw $0000
ENDR

Palette_White::
REPT $40
	dw $7fff
ENDR
