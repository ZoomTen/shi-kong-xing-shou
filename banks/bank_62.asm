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
	dw WorldMapNameStringPointers
	dw WorldMapNameStringPointers
	dw WorldMapNameStringPointers + $c
	dw WorldMapNameStringPointers + $14
	dw WorldMapNameStringPointers + $1a
	dw WorldMapNameStringPointers + $26
	dw WorldMapNameStringPointers + $2c
WorldMapNameStringPointers:
	dw WorldMapNames
	dw WorldMapNames_4124
	dw WorldMapNames_412a
	dw WorldMapNames_4131
	dw WorldMapNames_4139
	dw WorldMapNames_413f
	dw WorldMapNames_4146
	dw WorldMapNames_414d
	dw WorldMapNames_4155
	dw WorldMapNames_415b
	dw WorldMapNames_4161
	dw WorldMapNames_4167
	dw WorldMapNames_416f
	dw WorldMapNames_417c
	dw WorldMapNames_4183
	dw WorldMapNames_4189
	dw WorldMapNames_4190
	dw WorldMapNames_4197
	dw WorldMapNames_419d
	dw WorldMapNames_41a4
	dw WorldMapNames_41ab
	dw WorldMapNames_41b2
	dw WorldMapNames_41b9
	dw WorldMapNames_41c2
WorldMapNames:
	dr $18811e, $188124
WorldMapNames_4124:
	dr $188124, $18812a
WorldMapNames_412a:
	dr $18812a, $188131
WorldMapNames_4131:
	dr $188131, $188139
WorldMapNames_4139:
	dr $188139, $18813f
WorldMapNames_413f:
	dr $18813f, $188146
WorldMapNames_4146:
	dr $188146, $18814d
WorldMapNames_414d:
	dr $18814d, $188155
WorldMapNames_4155:
	dr $188155, $18815b
WorldMapNames_415b:
	dr $18815b, $188161
WorldMapNames_4161:
	dr $188161, $188167
WorldMapNames_4167:
	dr $188167, $18816f
WorldMapNames_416f:
	dr $18816f, $18817c
WorldMapNames_417c:
	dr $18817c, $188183
WorldMapNames_4183:
	dr $188183, $188189
WorldMapNames_4189:
	dr $188189, $188190
WorldMapNames_4190:
	dr $188190, $188197
WorldMapNames_4197:
	dr $188197, $18819d
WorldMapNames_419d:
	dr $18819d, $1881a4
WorldMapNames_41a4:
	dr $1881a4, $1881ab
WorldMapNames_41ab:
	dr $1881ab, $1881b2
WorldMapNames_41b2:
	dr $1881b2, $1881b9
WorldMapNames_41b9:
	dr $1881b9, $1881c2
WorldMapNames_41c2:
	dr $1881c2, $1881c9
WorldMapLocationIdPointers:
	dw WorldMapLocationIds
	dw WorldMapLocationIds
	dw WorldMapLocationIds_420f
	dw WorldMapLocationIds_4233
	dw WorldMapLocationIds_4257
	dw WorldMapLocationIds_42bd
	dw WorldMapLocationIds_42e5
	dw WorldMapLocationIds_4312
WorldMapLocationIds:
	dr $1881d9, $18820f
WorldMapLocationIds_420f:
	dr $18820f, $188233
WorldMapLocationIds_4233:
	dr $188233, $188257
WorldMapLocationIds_4257:
	dr $188257, $1882bd
WorldMapLocationIds_42bd:
	dr $1882bd, $1882e5
WorldMapLocationIds_42e5:
	dr $1882e5, $188312
WorldMapLocationIds_4312:
	dr $188312, $188327
WorldMapCursorCoordPointers:
	dw WorldMapCursorCoords
	dw WorldMapCursorCoords
	dw WorldMapCursorCoords_4345
	dw WorldMapCursorCoords_4351
	dw WorldMapCursorCoords_4359
	dw WorldMapCursorCoords_436d
	dw WorldMapCursorCoords_4377
WorldMapCursorCoords:
	dr $188335, $188345
WorldMapCursorCoords_4345:
	dr $188345, $188351
WorldMapCursorCoords_4351:
	dr $188351, $188359
WorldMapCursorCoords_4359:
	dr $188359, $18836d
WorldMapCursorCoords_436d:
	dr $18836d, $188377
WorldMapCursorCoords_4377:
	dr $188377, $18837d
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
	dw WorldMapMarkerCoords
	dw WorldMapMarkerCoords
	dw WorldMapMarkerCoords_4418
	dw WorldMapMarkerCoords_4420
	dw WorldMapMarkerCoords_4426
	dw WorldMapMarkerCoords_4432
	dw WorldMapMarkerCoords_4438
	dw WorldMapMarkerCoords
WorldMapMarkerCoords:
	dr $18840c, $188418
WorldMapMarkerCoords_4418:
	dr $188418, $188420
WorldMapMarkerCoords_4420:
	dr $188420, $188426
WorldMapMarkerCoords_4426:
	dr $188426, $188432
WorldMapMarkerCoords_4432:
	dr $188432, $188438
WorldMapMarkerCoords_4438:
	dr $188438, $18843e
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
	dw WorldMapSpriteLayouts
	dw WorldMapSpriteLayouts_461e
	dw WorldMapSpriteLayouts_4627
	dw WorldMapSpriteLayouts_4630
	dw WorldMapSpriteLayouts_4639
WorldMapSpriteLayouts:
	dr $188615, $18861e
WorldMapSpriteLayouts_461e:
	dr $18861e, $188627
WorldMapSpriteLayouts_4627:
	dr $188627, $188630
WorldMapSpriteLayouts_4630:
	dr $188630, $188639
WorldMapSpriteLayouts_4639:
	dr $188639, $188642
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
	dw WorldMapAnimFrames
	dw WorldMapAnimFrames_4690
	dw WorldMapAnimFrames_4695
WorldMapAnimFrames:
	dr $18868f, $188690
WorldMapAnimFrames_4690:
	dr $188690, $188695
WorldMapAnimFrames_4695:
	dr $188695, $18869a
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
INCBIN "gfx/attrmaps/worldmaptilemapattrmappointers.bin"
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
INCBIN "gfx/misc/worldmapgfx1.2bpp"
WorldMapGFX2:
INCBIN "gfx/misc/worldmapgfx2.2bpp"
WorldMapAttrmap0:
INCBIN "gfx/attrmaps/worldmapattrmap0.bin"
WorldMapTilemap0:
INCBIN "gfx/tilemaps/worldmaptilemap0.tilemap"
WorldMapAttrmap2:
INCBIN "gfx/attrmaps/worldmapattrmap2.bin"
WorldMapTilemap2:
INCBIN "gfx/tilemaps/worldmaptilemap2.tilemap"
WorldMapAttrmap3:
INCBIN "gfx/attrmaps/worldmapattrmap3.bin"
WorldMapTilemap3:
INCBIN "gfx/tilemaps/worldmaptilemap3.tilemap"
WorldMapAttrmap4:
INCBIN "gfx/attrmaps/worldmapattrmap4.bin"
WorldMapTilemap4:
INCBIN "gfx/tilemaps/worldmaptilemap4.tilemap"
WorldMapAttrmap5:
INCBIN "gfx/attrmaps/worldmapattrmap5.bin"
WorldMapTilemap5:
INCBIN "gfx/tilemaps/worldmaptilemap5.tilemap"
WorldMapAttrmap6:
INCBIN "gfx/attrmaps/worldmapattrmap6.bin"
WorldMapTilemap6:
INCBIN "gfx/tilemaps/worldmaptilemap6.tilemap"

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
	dw WorldMap2_FrameSeq0
	dw WorldMap2_FrameSeq1
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
	dw WorldMap2_SpriteLayout0
	dw WorldMap2_SpriteLayout1
	dw WorldMap2_SpriteLayout2
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
INCBIN "gfx/tilemaps/debug_soundtest_tilemap.tilemap"
Debug_SoundTest_Attrmap:
INCBIN "gfx/attrmaps/debug_soundtest_attrmap.bin"
Debug_SoundTest_GFX:
INCBIN "gfx/misc/debug_soundtest_gfx.bin"


