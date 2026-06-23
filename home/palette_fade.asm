UpdatePaletteFade::
	ldh a, [hPaletteFadeState]
	cp 1
	jp z, .asm_29f1
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

.asm_29f1:
	ld hl, wBGPals2
	ld bc, wBGPals1
	ld e, $40
	xor a
	ld [wPaletteFadeChanged], a

.asm_29fd:
	push de
	ld a, [hl]
	and $1f
	ld d, a
	ld a, [bc]
	and $1f
	cp d
	jr z, .asm_2a23

	push af
	ld a, [wPaletteFadeDirection]
	and a
	jr z, .asm_2a15

	pop af
	sub $01
	ld d, a
	jr .asm_2a19

.asm_2a15:
	pop af
	add $01
	ld d, a

.asm_2a19:
	ld a, $01
	ld [wPaletteFadeChanged], a
	ld a, [bc]
	and $e0
	or d
	ld [bc], a

.asm_2a23:
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
	jr z, .asm_2a76

	push af
	ld a, [wPaletteFadeDirection]
	and a
	jr z, .asm_2a52

	pop af
	sub $01
	ld d, a
	jr .asm_2a56

.asm_2a52:
	pop af
	add $01
	ld d, a

.asm_2a56:
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

.asm_2a76:
	ld a, [hl]
	srl a
	srl a
	ld d, a
	ld a, [bc]
	srl a
	srl a
	cp d
	jr z, .asm_2aa5

	push af
	ld a, [wPaletteFadeDirection]
	and a
	jr z, .asm_2a91

	pop af
	sub $01
	ld d, a
	jr .asm_2a95

.asm_2a91:
	pop af
	add $01
	ld d, a

.asm_2a95:
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

.asm_2aa5:
	inc hl
	inc bc
	pop de
	dec e
	jp nz, .asm_29fd

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
