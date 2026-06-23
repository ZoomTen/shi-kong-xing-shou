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
INCBIN "gfx/tilemaps/screentilemappointers.tilemap"
ScreenAttrmapPointers:
INCBIN "gfx/attrmaps/screenattrmappointers.bin"
ScreenPalettePointers:
	dw CreditsPalette_0
	dw CreditsPalette_1
	dw CreditsPalette_2
	dw CreditsPalette_3
ScreenGFX1Pointers:
	dw CreditsGFX_0
	dw CreditsGFX_1
	dw CreditsGFX_2
	dw CreditsGFX_3
ScreenGFX2Pointers:
	dw CreditsGFX8800_0
	dw CreditsGFX8800_1
	dw CreditsGFX_2
	dw CreditsGFX_3
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
ScreenOBJPalettePointers:
	dw CreditsOBJPalettes
	dw CreditsOBJPalettes_4399
	dw CreditsOBJPalettes_43a1
	dw CreditsOBJPalettes_43a9
ScreenCreditsPointers:
	dw CreditsFontGFX_0
	dw CreditsFontGFX_1
	dw CreditsFontGFX_2
	dw CreditsFontGFX_3
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
	dw CreditsSprites_0
	dw CreditsSprites_0
	dw CreditsSprites_1
	dw CreditsSprites_2
	dw CreditsSprites_3
CreditsSprites_0:
	db $00, $20, $00, $00, $00, $28, $02, $00, $00, $48, $04, $00, $00, $50, $06, $00
	db $08, $00, $08, $00, $08, $08, $0a, $00, $08, $10, $0c, $00, $08, $18, $0e, $00
	db $10, $20, $10, $00, $10, $40, $12, $00, $10, $48, $14, $00, $10, $50, $16, $00
	db $18, $10, $18, $00, $18, $18, $1a, $00, $20, $20, $1c, $00, $30, $20, $1e, $00
	db $30, $28, $20, $00, $30, $30, $22, $00, $38, $08, $24, $00, $38, $10, $26, $00
	db $38, $48, $28, $00, $38, $50, $2a, $00, $48, $08, $2c, $00, $ff
CreditsSprites_1:
	db $08, $28, $00, $00, $08, $30, $02, $00, $08, $38, $04, $00, $08, $40, $06, $00
	db $10, $18, $08, $00, $10, $20, $0a, $00, $18, $28, $0c, $00, $18, $30, $0e, $00
	db $18, $38, $10, $00, $20, $18, $12, $00, $20, $20, $14, $00, $28, $38, $16, $00
	db $38, $28, $18, $00, $38, $30, $1a, $00, $48, $10, $1c, $00, $48, $18, $1e, $00
	db $48, $20, $20, $00, $48, $28, $22, $00, $48, $30, $24, $00, $48, $38, $26, $00
	db $48, $40, $28, $00, $48, $48, $2a, $00, $48, $50, $2c, $00, $ff
CreditsSprites_2:
	db $00, $28, $00, $00, $00, $30, $02, $00, $08, $20, $04, $00, $08, $38, $06, $00
	db $10, $28, $08, $00, $10, $30, $0a, $00, $28, $08, $0c, $00, $28, $30, $0e, $00
	db $28, $38, $10, $00, $30, $10, $12, $00, $30, $18, $14, $00, $38, $20, $16, $00
	db $38, $38, $18, $00, $38, $40, $1a, $00, $40, $18, $1c, $00, $40, $28, $1e, $00
	db $40, $30, $20, $00, $48, $38, $22, $00, $48, $40, $24, $00, $48, $48, $26, $00
	db $ff
CreditsSprites_3:
	db $00, $08, $00, $00, $00, $10, $02, $00, $00, $50, $04, $00, $00, $58, $06, $00
	db $08, $48, $08, $00, $10, $08, $0a, $01, $10, $10, $0c, $01, $10, $50, $0e, $00
	db $10, $58, $10, $00, $18, $38, $12, $00, $18, $40, $14, $00, $18, $48, $16, $00
	db $20, $50, $18, $00, $20, $58, $1a, $00, $28, $38, $1c, $00, $28, $40, $1e, $00
	db $28, $48, $20, $00, $30, $50, $22, $01, $30, $58, $24, $00, $38, $00, $26, $00
	db $38, $08, $28, $00, $38, $30, $2a, $01, $38, $38, $2c, $01, $38, $40, $2e, $01
	db $38, $48, $30, $01, $40, $50, $32, $01, $40, $58, $34, $00, $48, $30, $36, $01
	db $48, $38, $38, $01, $48, $40, $3a, $01, $48, $48, $3c, $01, $50, $18, $3e, $01
	db $50, $20, $40, $01, $ff
CreditsOBJPalettes:
	RGB 21, 21, 21
	RGB 0, 0, 29
	RGB 0, 21, 31
	RGB 31, 29, 0
CreditsOBJPalettes_4399:
	RGB 21, 21, 21
	RGB 31, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
CreditsOBJPalettes_43a1:
	RGB 21, 21, 21
	RGB 28, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
CreditsOBJPalettes_43a9:
	RGB 21, 21, 21
	RGB 0, 16, 0
	RGB 17, 28, 0
	RGB 31, 28, 0
	RGB 21, 21, 21
	RGB 28, 0, 0
	RGB 31, 15, 0
	RGB 30, 30, 0
CreditsAttrmap_0:
INCBIN "gfx/attrmaps/creditsattrmap_0.bin"
CreditsTilemap_0:
INCBIN "gfx/tilemaps/creditstilemap_0.tilemap"
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
INCBIN "gfx/misc/creditsgfx_0.2bpp"
CreditsGFX8800_0:
INCBIN "gfx/misc/creditsgfx8800_0.2bpp"
CreditsAttrmap_1:
INCBIN "gfx/attrmaps/creditsattrmap_1.bin"
CreditsTilemap_1:
INCBIN "gfx/tilemaps/creditstilemap_1.tilemap"
CreditsPalette_1:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
CreditsGFX_1:
INCBIN "gfx/misc/creditsgfx_1.2bpp"
CreditsGFX8800_1:
INCBIN "gfx/misc/creditsgfx8800_1.2bpp"
CreditsAttrmap_2:
INCBIN "gfx/attrmaps/creditsattrmap_2.bin"
CreditsTilemap_2:
INCBIN "gfx/tilemaps/creditstilemap_2.tilemap"
CreditsPalette_2:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
CreditsGFX_2:
INCBIN "gfx/misc/creditsgfx_2.2bpp"
CreditsAttrmap_3:
INCBIN "gfx/attrmaps/creditsattrmap_3.bin"
CreditsTilemap_3:
INCBIN "gfx/tilemaps/creditstilemap_3.tilemap"
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
INCBIN "gfx/misc/creditsgfx_3.2bpp"
CreditsFontGFX_0:
INCBIN "gfx/misc/creditsfontgfx_0.2bpp"
CreditsFontGFX_1:
INCBIN "gfx/misc/creditsfontgfx_1.2bpp"
CreditsFontGFX_2:
INCBIN "gfx/misc/creditsfontgfx_2.2bpp"
CreditsFontGFX_3:
INCBIN "gfx/misc/creditsfontgfx_3.bin"


