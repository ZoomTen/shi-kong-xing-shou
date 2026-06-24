TheEnd::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ldh [rSCY], a
	ldh [rSCX], a
	ldh [rWY], a
	ldh [rWX], a
	ld [wdcde + 1], a
	ld hl, $9800
	ld de, TheEndTilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, TheEndAttrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, TheEndPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, TheEndGfx
	ld de, $9000
	ld bc, $0400
	call CopyBytesVRAM
	call Func_71_42bf
	call Func_71_42a7
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_5ab4
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ld a, [wTargetMode]
	cp $16
	jr nz, .asm_5ab4
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_5ab4
	ld a, [wdcde + 1]
	inc a
	ld [wdcde + 1], a
	cp $20
	jr nz, .asm_5ab4
	ld a, GAMEMODE_WORLD_MAP
	ld [wTargetMode], a
	jp JumpToGameMode
TheEndAttrmap: INCBIN "gfx/attrmaps/theendattrmap.bin"
TheEndTilemap: INCBIN "gfx/tilemaps/theendtilemap.tilemap"
TheEndPalette:
	RGB 31, 31, 31
	RGB 22, 31, 17
	RGB 10, 0, 20
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 31, 29, 0
	RGB 25, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 23, 31
	RGB 0, 0, 31
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
TheEndGfx: INCBIN "gfx/misc/theendgfx.bin"
