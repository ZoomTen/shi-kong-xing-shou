BeachCutscene::
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
	ld de, BeachCutsceneTilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, BeachCutsceneAttrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, BeachCutsceneBackgroundPalettes
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, BeachCutsceneGFX2
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, BeachCutsceneObjectPalettes
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, BeachCutsceneGFX1
	ld de, $8000
	ld bc, $0340
	call CopyBytesVRAM
	call .asm_40e7
	call .asm_40cf
	ld a, $28
	ld [wcd42], a
	ld a, $28
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	call .asm_40f5
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_409b
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_40b2
	call .asm_40f5
	call .asm_40bb
	jp .asm_409b
.asm_40b2
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_40bb
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
.asm_40cf
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_40d8
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_40d8
	ret
.asm_40e0
	call DelayFrame
	dec c
	jr nz, .asm_40e0
	ret
.asm_40e7
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_40ed
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_40ed
	ret
.asm_40f5
	ldh a, [hConsoleType]
	cp $11
	ret nz
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4103
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4103
	xor a
	ld [wd1fb], a
	call .asm_4112
	ret
.asm_4112
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
	ld a, [wd1fb]
	ld e, a
	ld d, $C0
.asm_4131
	ld a, [hli]
	cp $FF
	jr z, .asm_4145
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
	jr .asm_4131
.asm_4145
	ld a, e
	ld [wd1fb], a
	ret
BeachCutsceneSpriteFrames:
	dw BeachCutsceneSpriteFrames_4152
	dw BeachCutsceneSpriteFrames_416b
	dw BeachCutsceneSpriteFrames_41d4
	dw BeachCutsceneSpriteFrames_4211
BeachCutsceneSpriteFrames_4152:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
BeachCutsceneSpriteFrames_416b:
	db $08, $38, $00, $00, $18, $28, $02, $00, $18, $30, $04, $00, $18, $38, $06, $00
	db $18, $40, $08, $00, $18, $48, $0a, $00, $18, $50, $0c, $00, $28, $28, $0e, $00
	db $28, $30, $10, $00, $28, $38, $12, $00, $28, $40, $14, $00, $28, $48, $16, $00
	db $38, $18, $18, $00, $38, $20, $1a, $00, $38, $28, $1c, $00, $38, $30, $1e, $00
	db $38, $38, $20, $00, $38, $40, $22, $00, $40, $10, $24, $00, $48, $18, $26, $00
	db $48, $20, $28, $00, $48, $38, $2a, $00, $48, $40, $2c, $00, $48, $48, $2e, $00
	db $50, $50, $30, $00, $50, $58, $32, $00, $ff
BeachCutsceneSpriteFrames_41d4:
	db $20, $10, $00, $00, $20, $18, $02, $00, $20, $20, $04, $00, $20, $28, $06, $00
	db $20, $30, $08, $00, $28, $38, $0a, $00, $28, $40, $0c, $00, $30, $10, $0e, $00
	db $30, $18, $10, $00, $30, $20, $12, $00, $30, $28, $14, $00, $30, $30, $16, $00
	db $38, $38, $18, $00, $38, $40, $1a, $00, $40, $28, $1c, $00, $ff
BeachCutsceneSpriteFrames_4211:
	db $00, $00, $00, $00, $00, $08, $02, $00, $00, $10, $04, $00, $00, $18, $06, $00
	db $00, $20, $08, $00, $00, $28, $0a, $00, $08, $30, $0c, $00, $10, $00, $0e, $00
	db $10, $08, $10, $00, $10, $10, $12, $00, $10, $18, $14, $00, $10, $20, $16, $00
	db $10, $28, $18, $00, $18, $30, $1a, $00, $20, $08, $1c, $00, $20, $10, $1e, $00
	db $20, $18, $20, $00, $20, $20, $22, $00, $20, $28, $24, $00, $ff
BeachCutsceneObjectPalettes:
	RGB 21, 21, 21
	RGB 31, 17, 0
	RGB 31, 26, 21
	RGB 0, 6, 28
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
BeachCutsceneBackgroundPalettes:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 6, 28
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 29, 24, 10
	RGB 21, 12, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
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
BeachCutsceneAttrmap:
INCBIN "gfx/attrmaps/beachcutsceneattrmap.bin"
BeachCutsceneTilemap:
INCBIN "gfx/tilemaps/beachcutscenetilemap.tilemap"
BeachCutsceneGFX1:
INCBIN "gfx/misc/beachcutscenegfx1.2bpp"
BeachCutsceneGFX2:
INCBIN "gfx/misc/beachcutscenegfx2.2bpp"

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
	ld [wd1fb], a
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
	ld a, [wd1fb]
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
	ld [wd1fb], a
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
Script_067_6e01::
	farjump2 Script_066_4c9e
	end

Script_067_6e06:
	setmap $03, $00
	end2

G5_03_ObjectEvents:
	object_event $3c, 10, 12, 0, $00, $00, $00, $00, Script_067_6e5c
	object_event $3a,  9,  3, 0, $00, $00, $00, $01, Script_067_6e85
	objects_end
G5_04_ObjectEvents:
	object_event $40, 16,  7, 0, $00, $00, $00, $00, Script_067_6ea2
	object_event $3a,  3, 11, 0, $00, $00, $00, $01, Script_067_6ecb
	objects_end
G5_05_ObjectEvents:
	object_event $42, 16,  2, 0, $00, $00, $00, $00, Script_067_6ee8
	objects_end
G5_06_ObjectEvents:
	object_event $42, 17, 15, 0, $00, $00, $00, $00, Script_067_6f05
	object_event $40,  5,  7, 0, $00, $00, $00, $01, Script_067_6f2e
	objects_end

Script_067_6e5b:
	end

Script_067_6e5c:
	ifcharindex $03, Script_067_6e6d
	textface text_67_6f5d
	startbattle BattleData_02d_4de6
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6e6d:
	checkbit wEventFlags + 20, $00, Script_067_6e81
	textface text_67_6f6d
	stext text_67_6f86
	scr_48 $00, $23
	setbit wEventFlags + 20, $00
	end

Script_067_6e81:
	textface text_67_6f97
	end

Script_067_6e85:
	ifcharindex $03, Script_067_6e96
	textface text_67_6f54
	startbattle BattleData_02d_4e14
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6e96:
	textface text_67_6fa5
	checkbit wEventFlags + 3, $03, Script_067_6ea1
	scr_37
	end

Script_067_6ea1:
	end

Script_067_6ea2:
	ifcharindex $03, Script_067_6eb3
	textface text_67_6f65
	startbattle BattleData_02d_4e33
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6eb3:
	checkbit wEventFlags + 20, $01, Script_067_6ec7
	textface text_67_7002
	stext text_67_7025
	scr_48 $00, $3a
	setbit wEventFlags + 20, $01
	end

Script_067_6ec7:
	textface text_67_7036
	end

Script_067_6ecb:
	ifcharindex $03, Script_067_6edc
	textface text_67_6f54
	startbattle BattleData_02d_4e61
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6edc:
	textface text_67_6fdb
	checkbit wEventFlags + 3, $03, Script_067_6ee7
	townmusicanim
	end

Script_067_6ee7:
	end

Script_067_6ee8:
	ifcharindex $03, Script_067_6ef9
	textface text_67_6f4b
	startbattle BattleData_02d_4e80
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6ef9:
	textface text_67_6fb7
	checkbit wEventFlags + 3, $03, Script_067_6f04
	scr_37
	end

Script_067_6f04:
	end

Script_067_6f05:
	ifcharindex $03, Script_067_6f16
	textface text_67_6f4b
	startbattle BattleData_02d_4eae
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6f16:
	checkbit wEventFlags + 20, $02, Script_067_6f2a
	textface text_67_7044
	stext text_67_7069
	scr_48 $00, $26
	setbit wEventFlags + 20, $02
	end

Script_067_6f2a:
	textface text_67_7079
	end

Script_067_6f2e:
	ifcharindex $03, Script_067_6f3f
	textface text_67_6f65
	startbattle BattleData_02d_4ecd
	checkbit wEventFlags + 3, $03, Script_067_6e5b
	end

Script_067_6f3f:
	textface text_67_6fc9
	checkbit wEventFlags + 3, $03, Script_067_6f4a
	scr_37
	end

Script_067_6f4a:
	end

INCLUDE "data/text/bank67_6f4b.asm"
