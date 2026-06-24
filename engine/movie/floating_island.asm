FloatingIslandCutscene1::
	ld a, BGM_METEOR
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
	ld de, FloatingIsland1_Tilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AttrMap_67_5451
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Palette_67_53c1
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_67_5721
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, Palette_67_5409
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, FloatingIsland1_SpriteGFX
	ld de, $8000
	ld bc, $01E0
	call CopyBytesVRAM
	call BeachCutscene.asm_40e7
	call BeachCutscene.asm_40cf
	ld a, $28
	ld [wcd42], a
	ld a, $28
	ld [wcd43], a
	ld a, $02
	ld [wcd44], a
	call BeachCutscene.asm_40f5
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_5109
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_5120
	call BeachCutscene.asm_40f5
	call .asm_5129
	jp .asm_5109
.asm_5120
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_5129
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $03
	ret nz
	xor a
	ld [wdcf3], a
	ld a, SFX_16
	call PlaySound
	ld a, [hSCY]
	ld b, a
	ld a, [hSCX]
	ld c, a
	ld de, FloatingIslandCutscene1_MovementDeltas
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_5182
	add b
	ld [hSCY], a
	ld a, [hli]
	add c
	ld [hSCX], a
	ld a, [wcd42]
	ld b, a
	ld a, [wcd43]
	ld c, a
	ld de, FloatingIslandCutscene1_MovementDeltas
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	add b
	ld [wcd42], a
	ld a, [hli]
	add c
	ld [wcd43], a
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	ret
.asm_5182
	xor a
	ld [wdcf4], a
	ld a, $01
	ld [hFade], a
	ret
FloatingIslandCutscene1_MovementDeltas:
	db $00, $ff
	db $00, $01
	db $ff, $01
	db $01, $ff
	db $01, $ff
	db $ff, $01
	db $ff, $01
	db $01, $ff
	db $02, $ff
	db $fe, $01
	db $fe, $01
	db $02, $ff
	db $03, $02
	db $fd, $fe
	db $fd, $fe
	db $03, $02
	db $04, $02
	db $fc, $fe
	db $fc, $fe
	db $04, $02
	db $04, $02
	db $fc, $fe
	db $fc, $fe
	db $04, $02
	db $04, $02
	db $fc, $fe
	db $fc, $fe
	db $04, $02
	db $04, $02
	db $fc, $fe
	db $fc, $fe
	db $04, $02
	db $03, $02
	db $fd, $fe
	db $fd, $fe
	db $03, $02
	db $03, $02
	db $fd, $fe
	db $fd, $fe
	db $03, $02
	db $03, $02
	db $fd, $fe
	db $fd, $fe
	db $03, $02
	db $02, $ff
	db $fe, $01
	db $fe, $01
	db $02, $ff
	db $02, $ff
	db $fe, $01
	db $fe, $01
	db $02, $ff
	db $88

FloatingIslandCutscene2::
	ld a, BGM_METEOR
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
	ld de, FloatingIslandCutscene2_Tilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, FloatingIslandCutscene2_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, FloatingIslandCutscene2_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, FloatingIslandCutscene2_GFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, FloatingIslandCutscene2_Palette2
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, FloatingIslandCutscene2_GFX2
	ld de, $8000
	ld bc, $0270
	call CopyBytesVRAM
	call BeachCutscene.asm_40e7
	call BeachCutscene.asm_40cf
	ld a, $28
	ld [wcd42], a
	ld a, $D0
	ld [wcd43], a
	ld a, $03
	ld [wcd44], a
	call Func_67_5371
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_5290
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_52a7
	call Func_67_5371
	call .asm_52b0
	jp .asm_5290
.asm_52a7
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_52b0
	ld a, [wcd42]
	ld b, a
	ld a, [wcd43]
	ld c, a
	ld de, FloatingIslandCutscene2_MoveDeltas
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_52d9
	add b
	ld [wcd42], a
	ld a, [hli]
	add c
	ld [wcd43], a
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	ret
.asm_52d9
	ld a, SFX_26
	call PlaySound
	xor a
	ld [wdcf4], a
	ld a, $01
	ld [hFade], a
	ret
FloatingIslandCutscene2_MoveDeltas:
	db $00, $01, $ff, $02, $ff, $02, $00, $02, $ff, $02, $00, $02, $ff, $02, $00, $02
	db $ff, $02, $00, $02, $ff, $02, $00, $02, $00, $02, $ff, $02, $00, $02, $00, $02
	db $ff, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $ff, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $01, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $01, $02, $00, $02, $00, $02, $01, $02
	db $00, $02, $01, $02, $00, $02, $00, $02, $01, $02, $01, $02, $00, $02, $01, $02
	db $00, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02
	db $01, $02, $01, $02, $01, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02, $02
	db $01, $02, $02, $02, $01, $02, $02, $02, $88
Func_67_5371:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_537a
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_537a
	xor a
	ld [wVirtualOAMPtr], a
	call .asm_5389
	ret
.asm_5389
	ld hl, BeachCutsceneSpriteFrames
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
.asm_53a8
	ld a, [hli]
	cp $FF
	jr z, .asm_53bc
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
	jr .asm_53a8
.asm_53bc
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
Palette_67_53c1:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 10, 16
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 8, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 23, 18, 11
	RGB 0, 13, 0
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
Palette_67_5409:
	RGB 12, 12, 12
	RGB 11, 28, 0
	RGB 23, 18, 11
	RGB 21, 21, 16
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
AttrMap_67_5451:
	INCBIN "data/attrmap_67_5451.bin"
FloatingIsland1_Tilemap:
INCBIN "gfx/tilemaps/floatingisland1_tilemap.tilemap"
GFX_67_5721:
INCBIN "gfx/misc/gfx_67_5721.2bpp"
FloatingIsland1_SpriteGFX:
INCBIN "gfx/misc/floatingisland1_spritegfx.2bpp"
FloatingIslandCutscene2_Palette:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 10, 16
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 8, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 23, 18, 11
	RGB 0, 13, 0
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
FloatingIslandCutscene2_Palette2:
	RGB 12, 12, 12
	RGB 0, 0, 0
	RGB 0, 16, 0
	RGB 31, 31, 31
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
FloatingIslandCutscene2_Attrmap:
INCBIN "gfx/attrmaps/floatingislandcutscene2_attrmap.bin"
FloatingIslandCutscene2_Tilemap:
INCBIN "gfx/tilemaps/floatingislandcutscene2_tilemap.tilemap"
FloatingIslandCutscene2_GFX:
INCBIN "gfx/misc/floatingislandcutscene2_gfx.2bpp"
FloatingIslandCutscene2_GFX2:
INCBIN "gfx/misc/floatingislandcutscene2_gfx2.2bpp"
