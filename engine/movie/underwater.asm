UnderwaterPictureCutscene::
	ld a, BGM_TOWN1
	call PlaySound
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
	ld hl, $9800
	ld de, UnderwaterPicture_Tilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, UnderwaterPicture_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, UnderwaterPicture_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, UnderwaterPicture_GFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, UnderwaterPicture_GFX2
	ld de, $8800
	ld bc, $0050
	call CopyBytesVRAM
	ld hl, UnderwaterPicture_OBJPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, UnderwaterPicture_SpriteGFX
	ld de, $8000
	ld bc, $0440
	call CopyBytesVRAM
	call Func_061_419d
	call Func_061_4185
	ld a, $28
	ld [wcd42], a
	ld a, $28
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	call .asm_5dfd
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_5dc9
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_5de0
	call .asm_5dfd
	call .asm_5de9
	jp .asm_5dc9
.asm_5de0
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_5de9
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	ld a, $01
	ld [hFade], a
	ret
.asm_5dfd
	ldh a, [hConsoleType]
	cp $11
	ret nz
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_5e0b
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_5e0b
	xor a
	ld [wVirtualOAMPtr], a
	call .asm_5e1a
	ret
.asm_5e1a
	ld hl, UnderwaterPicture_SpriteOAMPointers
	ld de, wcd42
	ld a, [de]
	ld c, a
	inc de
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
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_5e39
	ld a, [hli]
	cp $FF
	jr z, .asm_5e4d
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
	jr .asm_5e39
.asm_5e4d
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
UnderwaterPicture_SpriteOAMPointers:
	dw UnderwaterPicture_SpriteOAM_Empty
	dw UnderwaterPicture_SpriteOAM_Empty_5e6f
UnderwaterPicture_SpriteOAM_Empty:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
UnderwaterPicture_SpriteOAM_Empty_5e6f:
	db $00, $10, $00, $00, $08, $00, $02, $00, $08, $08, $04, $00, $08, $20, $06, $00
	db $08, $28, $08, $00, $08, $30, $0a, $00, $10, $10, $0c, $00, $10, $18, $0e, $00
	db $18, $08, $10, $00, $18, $30, $12, $00, $20, $10, $14, $00, $20, $50, $16, $00
	db $20, $58, $18, $00, $28, $38, $1a, $00, $30, $10, $1c, $00, $30, $18, $1e, $00
	db $30, $20, $20, $00, $30, $40, $22, $00, $30, $50, $24, $00, $30, $58, $26, $00
	db $38, $38, $28, $00, $40, $28, $2a, $00, $40, $30, $2c, $00, $40, $40, $2e, $00
	db $40, $48, $30, $00, $40, $50, $32, $00, $40, $58, $34, $00, $50, $20, $36, $00
	db $50, $28, $38, $00, $50, $30, $3a, $00, $50, $40, $3c, $00, $50, $48, $3e, $00
	db $50, $50, $40, $00, $50, $58, $42, $00, $ff
UnderwaterPicture_Palette:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 26, 0, 8
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 21, 7, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 15, 15
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
	ds 8
UnderwaterPicture_OBJPalette:
	RGB 21, 21, 21
	RGB 31, 14, 0
	RGB 31, 24, 17
	RGB 31, 25, 0
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
	ds 8
UnderwaterPicture_Tilemap:
INCBIN "gfx/tilemaps/underwaterpicture_tilemap.tilemap"
UnderwaterPicture_Attrmap:
INCBIN "gfx/attrmaps/underwaterpicture_attrmap.bin"
UnderwaterPicture_GFX:
INCBIN "gfx/misc/underwaterpicture_gfx.2bpp"
UnderwaterPicture_GFX2:
INCBIN "gfx/misc/underwaterpicture_gfx2.2bpp"
UnderwaterPicture_SpriteGFX:
INCBIN "gfx/misc/underwaterpicture_spritegfx.bin"
