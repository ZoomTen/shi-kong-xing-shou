Func_070_4000::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdcf5], a
	ldh a, [hFFD5]
	ld [wdcf3], a
.asm_401c
	ld de, ScreenTilemapPointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld de, ScreenAttrmapPointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld de, ScreenPalettePointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld de, ScreenGFX1Pointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, ScreenGFX2Pointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8800
	ld bc, $0100
	call CopyBytesVRAM
	ld de, ScreenOBJPalettePointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld de, ScreenCreditsPointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8000
	ld bc, $0460
	call CopyBytesVRAM
	call Func_070_41a8
	call Func_070_4190
	ld a, $28
	ld [wcd42], a
	ld a, $28
	ld [wcd43], a
	ld a, [wdcf3]
	inc a
	ld [wcd44], a
	call Func_070_41b6
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_40f8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_410c
	call Func_070_4175
	jp .asm_40f8
.asm_410c
	ld a, [wdcf3]
	cp $03
	jp nc, .asm_4123
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	xor a
	ldh [hFade], a
	jp .asm_401c
.asm_4123
	cp $04
	jr z, .asm_4134
	ld a, $01
	ld [hMapNumber], a
	xor a
	ld [hWarpNumber], a
	ld a, $07
	ldh [hMapGroup], a
.asm_4134
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
ScreenTilemapPointers:
	dr $1c013d, $1c0145
ScreenAttrmapPointers:
	dr $1c0145, $1c014d
ScreenPalettePointers:
	dr $1c014d, $1c0155
ScreenGFX1Pointers:
	dr $1c0155, $1c015d
ScreenGFX2Pointers:
	dr $1c015d, $1c0165
ScreenOBJPalettePointers:
	dr $1c0165, $1c016d
ScreenCreditsPointers:
	dr $1c016d, $1c0175
Func_070_4175:
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $60
	ret nz
	xor a
	ld [wdcf4], a
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	ld a, $01
	ld [hFade], a
	ret

Func_070_4190:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4199
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4199
	ret
.asm_41a1
	call DelayFrame
	dec c
	jr nz, .asm_41a1
	ret

Func_070_41a8:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_41ae
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_41ae
	ret

Func_070_41b6:
	ldh a, [hConsoleType]
	cp $11
	ret nz
	xor a
	ld [wd1fb], a
	ld hl, ObjectPlacementPointers
	ld de, wcd42
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $C0
.asm_41de
	ld a, [hli]
	cp $FF
	jr z, .asm_41f2
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_41de
.asm_41f2
	ld a, e
	ld [wd1fb], a
	ret
ObjectPlacementPointers:
	dr $1c01f7, $1c0201
CreditsSprites_0:
	dr $1c0201, $1c025e
CreditsSprites_1:
	dr $1c025e, $1c02bb
CreditsSprites_2:
	dr $1c02bb, $1c030c
CreditsSprites_3:
	dr $1c030c, $1c0391
CreditsOBJPalettes:
	RGB 21, 21, 21
	RGB 0, 0, 29
	RGB 0, 21, 31
	RGB 31, 29, 0
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
	RGB 21, 21, 21
	RGB 28, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
	RGB 21, 21, 21
	RGB 0, 16, 0
	RGB 17, 28, 0
	RGB 31, 28, 0
	RGB 21, 21, 21
	RGB 28, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
CreditsAttrmap_0:
	dr $1c03b9, $1c0521
CreditsTilemap_0:
	dr $1c0521, $1c0689
CreditsPalette_0:
	RGB 31, 31, 31
	RGB 31, 23, 0
	RGB 30, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
CreditsGFX_0:
	dr $1c06d1, $1c0ed1
CreditsGFX8800_0:
	dr $1c0ed1, $1c0ee1
CreditsAttrmap_1:
	dr $1c0ee1, $1c1049
CreditsTilemap_1:
	dr $1c1049, $1c11b1
CreditsPalette_1:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
CreditsGFX_1:
	dr $1c11b9, $1c19b9
CreditsGFX8800_1:
	dr $1c19b9, $1c1a29
CreditsAttrmap_2:
	dr $1c1a29, $1c1b91
CreditsTilemap_2:
	dr $1c1b91, $1c1cf9
CreditsPalette_2:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
CreditsGFX_2:
	dr $1c1d01, $1c2501
CreditsAttrmap_3:
	dr $1c2501, $1c2669
CreditsTilemap_3:
	dr $1c2669, $1c27d1
CreditsPalette_3:
	RGB 31, 31, 31
	RGB 29, 24, 10
	RGB 21, 12, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
CreditsGFX_3:
	dr $1c27e1, $1c2f81
CreditsFontGFX_0:
	dr $1c2f81, $1c3261
CreditsFontGFX_1:
	dr $1c3261, $1c3541
CreditsFontGFX_2:
	dr $1c3541, $1c37c1
CreditsFontGFX_3:
	dr $1c37c1, $1c3be0


