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
	farcall LoadEmotesAndPromptGFX
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
	dw WorldMapNameStringPointers_40fa
	dw WorldMapNameStringPointers_4102
	dw WorldMapNameStringPointers_4108
	dw WorldMapNameStringPointers_4114
	dw WorldMapNameStringPointers_411a
WorldMapNameStringPointers:
	dw WorldMapNames
	dw WorldMapNames_4124
	dw WorldMapNames_412a
	dw WorldMapNames_4131
	dw WorldMapNames_4139
	dw WorldMapNames_413f
WorldMapNameStringPointers_40fa:
	dw WorldMapNames_4146
	dw WorldMapNames_414d
	dw WorldMapNames_4155
	dw WorldMapNames_415b
WorldMapNameStringPointers_4102:
	dw WorldMapNames_4161
	dw WorldMapNames_4167
	dw WorldMapNames_416f
WorldMapNameStringPointers_4108:
	dw WorldMapNames_417c
	dw WorldMapNames_4183
	dw WorldMapNames_4189
	dw WorldMapNames_4190
	dw WorldMapNames_4197
	dw WorldMapNames_419d
WorldMapNameStringPointers_4114:
	dw WorldMapNames_41a4
	dw WorldMapNames_41ab
	dw WorldMapNames_41b2
WorldMapNameStringPointers_411a:
	dw WorldMapNames_41b9
	dw WorldMapNames_41c2
INCLUDE "text/worldmap_names.asm"
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
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02
	db $02, $02, $02, $02, $02, $07, $07, $07, $07, $07, $07, $07, $02, $04, $04, $04
	db $04, $04, $07, $06, $06, $06, $06, $06, $01, $03, $00, $00, $00, $02, $02, $02
	db $02, $02, $02, $02, $02, $02
WorldMapLocationIds_420f:
	db $00, $00, $02, $05, $05, $05, $04, $04, $00, $00, $00, $00, $00, $00, $00, $02
	db $02, $00, $02, $02, $02, $02, $02, $01, $03, $02, $02, $00, $00, $00, $00, $00
	db $00, $00, $00, $00
WorldMapLocationIds_4233:
	db $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $03, $01, $02, $00, $00, $00, $00, $00, $00, $00, $00, $03
	db $03, $03, $03, $03
WorldMapLocationIds_4257:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $01, $00, $00, $00, $02, $05, $06, $08, $08, $08, $04, $04, $04, $04, $09, $02
	db $08, $03, $03, $03, $03, $04, $04, $04, $04, $04, $07, $03, $00, $00, $00, $00
	db $00, $00, $00, $00, $02, $02, $02, $02, $02, $02, $04, $04, $04, $04, $04, $04
	db $04, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05
	db $08, $08, $08, $00, $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $07, $03
	db $03, $03, $03, $03, $00, $00
WorldMapLocationIds_42bd:
	db $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $04, $03, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
WorldMapLocationIds_42e5:
	db $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
WorldMapLocationIds_4312:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00
WorldMapCursorCoordPointers:
	dw WorldMapCursorCoords
	dw WorldMapCursorCoords
	dw WorldMapCursorCoords_4345
	dw WorldMapCursorCoords_4351
	dw WorldMapCursorCoords_4359
	dw WorldMapCursorCoords_436d
	dw WorldMapCursorCoords_4377
WorldMapCursorCoords:
	db $4c, $8c, $64, $7c, $54, $64, $3c, $3c, $5c, $2c, $2c, $14, $1c, $5c, $24, $54
WorldMapCursorCoords_4345:
	db $34, $84, $44, $74, $5c, $74, $54, $34, $34, $24, $44, $54
WorldMapCursorCoords_4351:
	db $44, $64, $5c, $5c, $4c, $34, $34, $24
WorldMapCursorCoords_4359:
	db $1c, $7c, $5c, $5c, $4c, $54, $5c, $14, $4c, $2c, $34, $1c, $34, $0c, $5c, $24
	db $5c, $44, $44, $34
WorldMapCursorCoords_436d:
	db $34, $4c, $1c, $74, $5c, $2c, $3c, $1c, $2c, $5c
WorldMapCursorCoords_4377:
	db $4c, $2c, $34, $6c, $44, $4c
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
	db $05, $05, $03, $02, $05, $02, $01
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
	db $4c, $8c, $54, $64, $24, $5c, $1c, $5c, $5c, $2c, $2c, $14
WorldMapMarkerCoords_4418:
	db $34, $84, $5c, $74, $44, $54, $34, $24
WorldMapMarkerCoords_4420:
	db $44, $64, $34, $24, $64, $74
WorldMapMarkerCoords_4426:
	db $1c, $7c, $4c, $54, $4c, $2c, $34, $1c, $34, $0c, $5c, $14
WorldMapMarkerCoords_4432:
	db $34, $4c, $5c, $2c, $1c, $74
WorldMapMarkerCoords_4438:
	db $4c, $2c, $34, $6c, $44, $4c
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
	ld a, SFX_0d
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
	farcall LoadScreenAttrmap
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
	call UpdatePlayerAndObjectAnims
	call DelayFrame
	farcall _BuildVirtualOAM
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
	call UpdateQueuedSpriteSlot
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
	ld [wVirtualOAMPtr], a
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
	ld a, [wVirtualOAMPtr]
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
	ld [wVirtualOAMPtr], a
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
	ld a, [wVirtualOAMPtr]
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
	ld [wVirtualOAMPtr], a
	ret
WorldMapSpriteLayoutPointers:
	dw WorldMapSpriteLayouts
	dw WorldMapSpriteLayouts_461e
	dw WorldMapSpriteLayouts_4627
	dw WorldMapSpriteLayouts_4630
	dw WorldMapSpriteLayouts_4639
WorldMapSpriteLayouts:
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
WorldMapSpriteLayouts_461e:
	db $00, $00, $00, $00, $00, $08, $02, $00, $ff
WorldMapSpriteLayouts_4627:
	db $00, $00, $04, $00, $00, $08, $06, $00, $ff
WorldMapSpriteLayouts_4630:
	db $01, $00, $08, $01, $01, $08, $0a, $01, $ff
WorldMapSpriteLayouts_4639:
	db $01, $00, $0c, $01, $01, $08, $0e, $01, $ff
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
	db $ff
WorldMapAnimFrames_4690:
	db $01, $01, $02, $02, $ff
WorldMapAnimFrames_4695:
	db $03, $03, $04, $04, $ff
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
	ds 8
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
	ds 8
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
	db $ff
WorldMap2_FrameSeq1:
	db $01, $01, $02, $02, $ff
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
	ld [wVirtualOAMPtr], a
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
	ld a, [wVirtualOAMPtr]
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
	ld [wVirtualOAMPtr], a
	ret
WorldMap2_SpriteLayoutPointers:
	dw WorldMap2_SpriteLayout0
	dw WorldMap2_SpriteLayout1
	dw WorldMap2_SpriteLayout2
WorldMap2_SpriteLayout0:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
WorldMap2_SpriteLayout1:
	db $01, $00, $08, $01, $01, $08, $0a, $01, $ff
WorldMap2_SpriteLayout2:
	db $01, $00, $0c, $01, $01, $08, $0e, $01, $ff
