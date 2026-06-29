FadeOutPalette::
	ld a, 0
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	jr nz, .exit

; CGB only from here
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ld hl, Palette_White
	ld a, 0
	ld [wPaletteFadeDirection], a
	call UpdatePaletteFade
	ldh a, [hPaletteFadeState]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr FadeOutPalette

.exit
; Warning:: LCD disabled outside of VBlank here
	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

FadeInScene::
; Switch intro scene?
.loop
	ld a, 0
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	jr nz, .exit

	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ld hl, Palette_White
	ld a, 0
	ld [wPaletteFadeDirection], a
	call UpdatePaletteFade
	ldh a, [hPaletteFadeState]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr FadeInScene

.exit
	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

FadeInPalette2::
; CGB-only fade
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ld hl, Palette_Black
	ld a, 1
	ld [wPaletteFadeDirection], a
	call UpdatePaletteFade
	ldh a, [hPaletteFadeState]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr FadeInPalette2

.exit
	ret

ClearBGMap0::
; Clear both banks of the BG map from address $9800 - $9c00
; Wastes cycles on DMG because banked VRAM doesn't exist there.
	call DelayFrame
	di
; Load VRAM bank 1
	ld a, 1
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
.clear_bank1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .clear_bank1
; clear byte
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_bank1

	ei
	call DelayFrame
	di
; Load VRAM bank 0
	xor a
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
.clear_bank0
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .clear_bank0
; clear byte
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_bank0

	ei
	ret

LoadMapBGPalettes::
	ld a, [_BANKNUM]
	push af

	ldh a, [hMapAttrBank]
	rst Bankswitch
	ld a, [wMapPalettesPointer]
	ld l, a
	ld a, [wMapPalettesPointer + 1]
	ld h, a
	ld de, wPaletteBuffer
	ld c, $40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1
	pop af
	rst Bankswitch

	ld de, wPaletteBuffer
	ld hl, $30
	add hl, de
	push hl
	pop de
	ld hl, .fixedBGPalette
	ld bc, 8
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy2
	ret

.fixedBGPalette
	dw $7fff
	dw $7e57
	dw $792c
	dw $0000

LoadBattlePalettes::
	ld hl, DefaultSpritePalettes
	ld de, wcaf0
	ld c, $40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1

	ld de, Pointers_0a8b
	ld a, [wPlayerChar]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, wcaf0
	ld bc, 8
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy2

	ld de, wcaf0
	ld hl, $10
	add hl, de
	push hl
	pop de
	pop hl
	ld bc, 8
	add hl, bc
	ld bc, 8
.copy3
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy3
	ret

Pointers_0a8b::
	dw .battlePalsChar0
	dw .battlePalsChar1
	dw .battlePalsChar2
	dw .battlePalsChar3
	dw .battlePalsChar4
	dw .battlePalsChar5
	dw .battlePalsChar6
	dw .battlePalsChar7

.battlePalsChar0
	dw $56b5
	dw $0000
	dw $001d
	dw $67bf
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.battlePalsChar1
	dw $56b5
	dw $0000
	dw $65ad
	dw $7bde
	dw $56b5
	dw $0000
	dw $0220
	dw $7fff

.battlePalsChar2
	dw $56b5
	dw $0000
	dw $0220
	dw $7fff
	dw $56b5
	dw $0000
	dw $2978
	dw $73df

.battlePalsChar3
	dw $56b5
	dw $0000
	dw $01fc
	dw $73df
	dw $56b5
	dw $0000
	dw $001e
	dw $77df

.battlePalsChar4
	dw $56b5
	dw $0000
	dw $7e80
	dw $77df
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.battlePalsChar5
	dw $56b5
	dw $0000
	dw $4419
	dw $77df
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.battlePalsChar6
	dw $56b5
	dw $0000
	dw $65ad
	dw $7bde
	dw $56b5
	dw $0000
	dw $2978
	dw $73df

.battlePalsChar7
	dw $56b5
	dw $0000
	dw $02fe
	dw $77df
	dw $56b5
	dw $0000
	dw $6a1e
	dw $73df

LoadExtraPalettes::
	ld de, wcaf0
	ld hl, $18
	add hl, de
	push hl
	pop de
	ld hl, Palettes_2c3c
	ld c, 40
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ret

CopyBytes3::
; Copy bc bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

