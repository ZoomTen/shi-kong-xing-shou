GameOver::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ldh [hFFC2], a
	ld [wdccf], a
	ld [wdccc], a
	ldh [hFFA1], a
	ld [wcd0a], a
	call ClearBGMap0
	ld hl, $9800
	ld de, Tilemap_03c_458f
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AttrMap_03c_4427
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Palettes_03c_46f7
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, Palettes_03c_46f7
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, GameOverGFX
	ld de, $9000
	ld bc, $04E0
	call CopyBytesVRAM
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	ld [wSelectedOption], a
	call FadeInPalette
.asm_43bc
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_43d2
	call .asm_43d5
	call .asm_4419
	jp .asm_43bc
.asm_43d2
	jp StartGame
.asm_43d5
	ldh a, [hFadeFrameCounter]
	and $0F
	ret nz
	ld de, Pointers_03c_4737
	ldh a, [hFFA1]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, $9968
	ld bc, $0403
	ld a, $03
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ldh a, [hFFA1]
	inc a
	ldh [hFFA1], a
	cp $07
	ret c
	ld a, $05
	ldh [hFFA1], a
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
	cp $10
	ret c
	ld a, $01
	ldh [hFade], a
	ld a, GAMEMODE_NEW_GAME_CONTINUE_MENU
	ld [wTargetMode], a
	ret
.asm_4419
	ldh a, [hJoypadPressed]
	and a
	ret z
	ld a, $01
	ldh [hFade], a
	ld a, GAMEMODE_NEW_GAME_CONTINUE_MENU
	ld [wTargetMode], a
	ret


AttrMap_03c_4427:
INCBIN "gfx/attrmaps/attrmap_03c_4427.bin"
Tilemap_03c_458f:
INCBIN "gfx/tilemaps/tilemap_03c_458f.tilemap"
Palettes_03c_46f7:
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 10, 10, 10
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 27, 23
	RGB 0, 15, 29
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
Pointers_03c_4737:
	dw Tilemap_03c_4745
	dw Tilemap_03c_4745
	dw Tilemap_03c_4751
	dw Tilemap_03c_475d
	dw Tilemap_03c_4769
	dw Tilemap_03c_475d
	dw Tilemap_03c_4769
Tilemap_03c_4745:
	db $11, $12, $13, $14, $17, $18, $19, $1a, $1e, $1f, $20, $21
Tilemap_03c_4751:
	db $36, $37, $38, $39, $3a, $3b, $3c, $3d, $1e, $3e, $3f, $40
Tilemap_03c_475d:
	db $36, $37, $38, $39, $41, $42, $43, $44, $1e, $45, $46, $47
Tilemap_03c_4769:
	db $36, $37, $38, $39, $48, $49, $4a, $4b, $1e, $4c, $4d, $40
GameOverGFX:
INCBIN "gfx/misc/game_over.2bpp"
