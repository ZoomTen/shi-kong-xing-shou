WorldMap::
	ldh a, [hSCX]
	ld [wd0bc], a
	ldh a, [hSCXHigh]
	ld [wd0bd], a
	ldh a, [hSCY]
	ld [wd0be], a
	ldh a, [hSCYHigh]
	ld [wd0bf], a
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdce8], a
	ld [wcd4c], a
	ld [wdcf5], a
	call Func_062_469a
	ld hl, WorldMapGFX2
	ld de, $9000
	ld bc, $0490
	call CopyBytesVRAM
	ld hl, WorldMapBackgroundPalettes
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, WorldMapObjectPalettes
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, WorldMapGFX1
	ld de, $8000
	ld bc, $0100
	call CopyBytesVRAM
	call Func_062_5eeb
	call Func_062_456f
	call Func_062_437d
	call Func_062_4580
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
	call Func_062_40a4
.asm_4082
	call DelayFrame
	call Func_062_4580
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_409a
	call Func_062_443e
	call Func_062_4642
	jr .asm_4082
.asm_409a
	xor a
	ldh [hFade], a
	ld hl, WorldMap
	ld b, $0D
	rst FarCall
	ret
Func_062_40a4:
	ld de, WorldMapNamePointers
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld a, [wdce8]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld bc, $0180
	ld hl, $9310
	xor a
	call ByteFillVRAM
	call DelayFrame
	pop hl
	ld a, $31
	ld [wMenuTextX], a
	ld a, $49
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret
WorldMapNamePointers:
	dr $1880e0, $1880ee
WorldMapNameStringPointers:
	dr $1880ee, $18811e
WorldMapNames:
	dr $18811e, $1881c9
WorldMapLocationIdPointers:
	dr $1881c9, $1881d9
WorldMapLocationIds:
	dr $1881d9, $188327
WorldMapCursorCoordPointers:
	dr $188327, $188335
WorldMapCursorCoords:
	dr $188335, $18837d
Func_062_437d:
	ld de, WorldMapLocationIdPointers
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld a, [hMapNumber]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wdcf3], a
	ld de, WorldMapCursorCoordPointers
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wcd42], a
	ld a, [hli]
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	ld de, WorldMapLocationCounts
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wcd4c], a
	ld de, WorldMapMarkerCoordPointers
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [wcd51], a
	ld a, $03
	ld [wcd52], a
	ld a, $82
	ld [wcd53], a
	xor a
	ld [wdce8], a
	ret
WorldMapLocationCounts:
	dr $1883f5, $1883fc
WorldMapMarkerCoordPointers:
	dr $1883fc, $18840c
WorldMapMarkerCoords:
	dr $18840c, $18843e
Func_062_443e:
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4460
	ld a, $0D
.asm_4446
	call PlaySound
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	ld b, a
	ld a, [wcd4c]
	cp b
	jr nc, .asm_447d
	jr z, .asm_447d
	ld a, $00
	ld [wdce8], a
	jr .asm_447d
.asm_4460
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_44a1
	ld a, $0D
	call PlaySound
	ld a, [wdce8]
	and a
	jr z, .asm_4477
	dec a
	ld [wdce8], a
	jr nc, .asm_447d
.asm_4477
	ld a, [wcd4c]
	ld [wdce8], a
.asm_447d
	ld de, WorldMapMarkerCoordPointers
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld a, [wdce8]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [wcd51], a
	call Func_062_40a4
	ret
.asm_44a1
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $01
	ldh [hFade], a
	call .asm_44ae
	ret
.asm_44ae
	ld a, $80
	ldh [rLCDC], a
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	call DelayFrame
	ld a, [wd0bc]
	ldh [hSCX], a
	ld a, [wd0bd]
	ldh [hSCXHigh], a
	ld a, [wd0be]
	ldh [hSCY], a
	ld a, [wd0bf]
	ldh [hSCYHigh], a
	call LoadMapGFX
	ld de, wTilemap
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1412
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, $12
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call DelayFrame
	farcall Func_025_57a0
	ld de, wPaletteBuffer
	ld hl, wScreenRowBuffer
	ld bc, $0080
	call CopyBytes3
	call Func_062_4564
	call Func_062_5eeb
	ld a, $01
	ld [hFFAC], a
	ld [wdcd0], a
	xor a
	ld [wPlayerAnimFrame], a
	call Func_05f2
	call DelayFrame
	ld hl, WorldMap
	ld b, $04
	rst FarCall
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	ret
Func_062_4538:
	ld bc, wcd20
.asm_453b
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4558
	ld hl, $000D
	add hl, bc
	ld [hl], $01
	ld hl, $0005
	add hl, bc
	ld [hl], $00
	xor a
	ld [wScriptByte], a
	push bc
	call Func_06f8
	pop bc
.asm_4558
	ld hl, $0020
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $E0
	jr c, .asm_453b
	ret
Func_062_4564:
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_456a
	ld [hli], a
	dec c
	jr nz, .asm_456a
	ret
Func_062_456f:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4578
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4578
	ret
Func_062_4580:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4589
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4589
	xor a
	ld [wd1fb], a
	call .asm_459b
	call .asm_45d3
	ret
.asm_459b
	ld hl, WorldMapSpriteLayoutPointers
	ld de, wcd50
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
.asm_45ba
	ld a, [hli]
	cp $FF
	jr z, .asm_45ce
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
	jr .asm_45ba
.asm_45ce
	ld a, e
	ld [wd1fb], a
	ret
.asm_45d3
	ld hl, WorldMapSpriteLayoutPointers
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
.asm_45f2
	ld a, [hli]
	cp $FF
	jr z, .asm_4606
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
	jr .asm_45f2
.asm_4606
	ld a, e
	ld [wd1fb], a
	ret
WorldMapSpriteLayoutPointers:
	dr $18860b, $188615
WorldMapSpriteLayouts:
	dr $188615, $188642
Func_062_4642:
	ld a, [wcd53]
	and a
	ret z
	and $80
	jr nz, .asm_4652
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	jr .asm_465f
.asm_4652
	ld a, [wcd53]
	and $7F
	ld [wcd53], a
	ld a, $00
	ld [wcd54], a
.asm_465f
	ld a, [wcd53]
	ld de, WorldMapAnimFramePointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd54]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_467e
	xor a
	ld [wcd54], a
	ret
.asm_467e
	ld [wcd52], a
	ld a, [wcd54]
	inc a
	ld [wcd54], a
	ret
WorldMapAnimFramePointers:
	dr $188689, $18868f
WorldMapAnimFrames:
	dr $18868f, $18869a
Func_062_469a:
	ld de, WorldMapTilemapAttrmapPointers
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ret
WorldMapTilemapAttrmapPointers:
	dr $1886d7, $1886f3
WorldMapObjectPalettes:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 29, 0, 0
	RGB 30, 30, 30
	RGB 21, 21, 21
	RGB 0, 0, 25
	RGB 29, 0, 0
	RGB 30, 30, 30
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
WorldMapPalettePad1:
	dr $188733, $18873b
WorldMapBackgroundPalettes:
	RGB 31, 30, 26
	RGB 28, 23, 14
	RGB 14, 11, 6
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 16, 28, 6
	RGB 0, 18, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 31, 30, 26
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 27, 0
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 23, 25, 27
	RGB 13, 15, 18
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
WorldMapPalettePad2:
	dr $18877b, $188783
WorldMapGFX1:
	dr $188783, $188883
WorldMapGFX2:
	dr $188883, $188d13
WorldMapAttrmap0:
	dr $188d13, $188e7b
WorldMapTilemap0:
	dr $188e7b, $188fe3
WorldMapAttrmap2:
	dr $188fe3, $18914b
WorldMapTilemap2:
	dr $18914b, $1892b3
WorldMapAttrmap3:
	dr $1892b3, $18941b
WorldMapTilemap3:
	dr $18941b, $189583
WorldMapAttrmap4:
	dr $189583, $1896eb
WorldMapTilemap4:
	dr $1896eb, $189853
WorldMapAttrmap5:
	dr $189853, $1899bb
WorldMapTilemap5:
	dr $1899bb, $189b23
WorldMapAttrmap6:
	dr $189b23, $189c8b
WorldMapTilemap6:
	dr $189c8b, $189df3

WorldMap2::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdce8], a
	ld [wcd4c], a
	ld [wdcf5], a
	call Func_062_469a
	ld hl, WorldMapGFX2
	ld de, $9000
	ld bc, $0490
	call CopyBytesVRAM
	ld hl, WorldMapBackgroundPalettes
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, WorldMapObjectPalettes
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, WorldMapGFX1
	ld de, $8000
	ld bc, $0100
	call CopyBytesVRAM
	call Func_062_5ef9
	call Func_062_456f
	ld a, $4C
	ld [wcd42], a
	ld a, $2C
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	call Func_062_5f1b
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
	call Func_062_40a4
.asm_5e72
	call DelayFrame
	call Func_062_5f1b
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_5e8a
	call .asm_5e93
	call Func_062_5f07
	jr .asm_5e72
.asm_5e8a
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_5e93
	ld a, [wcd45]
	and a
	ret z
	and $80
	jr nz, .asm_5ea3
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	jr .asm_5eb0
.asm_5ea3
	ld a, [wcd45]
	and $7F
	ld [wcd45], a
	ld a, $00
	ld [wcd46], a
.asm_5eb0
	ld a, [wcd45]
	ld de, WorldMap2_FrameSeqPointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd46]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_5ecf
	xor a
	ld [wcd46], a
	ret
.asm_5ecf
	ld [wcd44], a
	ld a, [wcd46]
	inc a
	ld [wcd46], a
	ret
WorldMap2_FrameSeqPointers:
	dr $189eda, $189ede
WorldMap2_FrameSeq0:
	dr $189ede, $189edf
WorldMap2_FrameSeq1:
	dr $189edf, $189ee4
Func_062_5ee4:
.asm_5ee4
	call DelayFrame
	dec c
	jr nz, .asm_5ee4
	ret
Func_062_5eeb:
	ld hl, wcd40
	ld bc, $00C0
.asm_5ef1
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_5ef1
	ret
Func_062_5ef9:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_5eff
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_5eff
	ret
Func_062_5f07:
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
Func_062_5f1b:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_5f24
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_5f24
	xor a
	ld [wd1fb], a
	call Func_062_5f33
	ret
Func_062_5f33:
	ld hl, WorldMap2_SpriteLayoutPointers
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
.asm_5f52
	ld a, [hli]
	cp $FF
	jr z, .asm_5f66
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
	jr .asm_5f52
.asm_5f66
	ld a, e
	ld [wd1fb], a
	ret
WorldMap2_SpriteLayoutPointers:
	dr $189f6b, $189f71
WorldMap2_SpriteLayout0:
	dr $189f71, $189f8a
WorldMap2_SpriteLayout1:
	dr $189f8a, $189f93
WorldMap2_SpriteLayout2:
	dr $189f93, $189f9c

Debug_SoundTest::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld hl, $9800
	ld de, Debug_SoundTest_Tilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, Debug_SoundTest_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Debug_SoundTest_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, Debug_SoundTest_GFX
	ld de, $9000
	ld bc, $0300
	call CopyBytesVRAM
	call Func_062_5ef9
	call Func_062_456f
	ld a, $59
	ld [wdcfb], a
	call Func_062_6047
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_600d
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_6020
	call Func_062_6029
	jp .asm_600d
.asm_6020
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode

Func_062_6029:
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_6038
	ld a, [wdcfb]
	inc a
	ld [wdcfb], a
	jr Func_062_6047
.asm_6038
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, Func_062_609c
	ld a, [wdcfb]
	dec a
	ld [wdcfb], a
	jr Func_062_6047
Func_062_6047:
	ld a, [wdcfb]
	and $F0
	swap a
	ld [wdcf3], a
	ld a, [wdcfb]
	and $0F
	ld [wdcf4], a
	ld a, [wdcf3]
	ld de, Func_062_6029_Pointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $98E9
	ld bc, $0102
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $01
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	ld de, Func_062_6029_Pointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $98EA
	ld bc, $0102
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $01
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
Func_062_609c:
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_60a9
	ld a, [wdcfb]
	call PlaySound
	ret
.asm_60a9
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $01
	ld [hFade], a
	ret

Func_062_6029_Pointers:
	dr $18a0b4, $18a0f4
Debug_SoundTest_Palette:
	dr $18a0f4, $18a13c
Debug_SoundTest_Tilemap:
	dr $18a13c, $18a2a4
Debug_SoundTest_Attrmap:
	dr $18a2a4, $18a40c
Debug_SoundTest_GFX:
	dr $18a40c, $18a710


