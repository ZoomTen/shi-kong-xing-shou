RhythmMinigame::
	ld a, BGM_ACADEMY
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
	ld [wdce8], a
	ld [wdcf6], a
	ld [wdcfc], a
	ld [wdcf5], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld [wcd40], a
	ld [wcd41], a
	ld hl, $9800
	ld de, RhythmScreen1Tilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, RhythmScreen1Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, RhythmBGPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, RhythmOBJPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, RhythmScreen1GFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, RhythmScreen1GFX2
	ld de, $8800
	ld bc, $0580
	call CopyBytesVRAM
	ld hl, RhythmSharedGFX
	ld de, $8400
	ld bc, $0360
	call CopyBytesVRAM
	ld hl, RhythmAnimFrames
	ld de, $8000
	ld bc, $0200
	call CopyBytesVRAM
	call Func_5d_4a6e
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_40b3
	call DelayFrame
	call Func_5d_4a1a
	ld a, [wdcf5]
	cp $01
	jr z, .asm_40c3
	jp .asm_40b3
.asm_40c3
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	jp .asm_40cf
.asm_40cf
	call Func_5d_4a51
	ld a, BGM_ACADEMY
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
	ld [wdce8], a
	ld [wdcf6], a
	ld [wdcfc], a
	ld [wdcf5], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld [wcd40], a
	ld [wcd41], a
	ld [wcd46 + 1], a
	ld [wcd46 + 2], a
	ld [wcd46 + 3], a
	ld [wcd46 + 4], a
	ld [wcd46 + 5], a
	ld [wcd4c + 3], a
	ld a, $02
	ld [wcd4c], a
	ld a, $00
	ld [wcd4c + 1], a
	ld a, $00
	ld [wcd4c + 2], a
	ld hl, $9800
	ld de, RhythmScreen2Tilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, RhythmScreen2Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, RhythmBGPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, RhythmOBJPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, RhythmScreen2GFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, RhythmScreen2GFX2
	ld de, $8800
	ld bc, $0290
	call CopyBytesVRAM
	ld hl, RhythmSharedGFX
	ld de, $8400
	ld bc, $0360
	call CopyBytesVRAM
	ld hl, RhythmAnimFrames
	ld de, $8000
	ld bc, $0200
	call CopyBytesVRAM
	call Func_5d_4a5f
	call Func_5d_4a6e
	ld a, $50
	ld [wcd42], a
	ld a, $48
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_41bd
	call DelayFrame
	call Func_5d_48a8
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_41f4
	call Func_5d_44c0
	call Func_5d_43f5
	ld a, [wdcf5]
	cp $02
	jr z, .asm_4200
	cp $03
	jr z, .asm_4226
	cp $04
	jr z, .asm_424c
	call Func_5d_435e
	call Func_5d_4581
	call .asm_4266
	call Func_5d_4800
	call Func_5d_4754
	jp .asm_41bd
.asm_41f4
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
	jp .asm_41bd
.asm_4200
	ld a, [wEventFlags + 7]
	res 1, a
	ld [wEventFlags + 7], a
	ld a, $01
	ld [wcd40], a
	ld a, $02
	ld [wcd46 + 4], a
	ld a, $8A
	ld [wcd45], a
	call Func_5d_435e
	ld a, $04
	ld [wdcf5], a
	xor a
	ld [wcd4c + 3], a
	jp .asm_41bd
.asm_4226
	ld a, [wEventFlags + 7]
	set 1, a
	ld [wEventFlags + 7], a
	ld a, $00
	ld [wcd40], a
	ld a, $03
	ld [wcd46 + 4], a
	ld a, $89
	ld [wcd45], a
	call Func_5d_435e
	ld a, $04
	ld [wdcf5], a
	xor a
	ld [wcd4c + 3], a
	jp .asm_41bd
.asm_424c
	ld a, [wcd4c + 3]
	inc a
	ld [wcd4c + 3], a
	cp $80
	jr z, .asm_425a
	jp .asm_41bd
.asm_425a
	xor a
	ld [wcd4c + 3], a
	ld a, $01
	ld [hFade], a
	jp .asm_41bd
.asm_4266
	ld a, [wcd4c + 3]
	inc a
	ld [wcd4c + 3], a
	cp $07
	ret nz
	xor a
	ld [wcd4c + 3], a
	ld a, [wcd4c + 2]
	and a
	jr z, .asm_4280
	dec a
	ld [wcd4c + 2], a
	jr .asm_42cf
.asm_4280
	ld a, [wcd4c + 1]
	and a
	jr z, .asm_42a0
	ld a, $09
	ld [wcd4c + 2], a
	ld a, [wcd4c + 1]
	dec a
	ld [wcd4c + 1], a
	jr .asm_42cf
	ld a, [wcd4c + 1]
	and a
	jr z, .asm_42a0
	dec a
	ld [wcd4c + 1], a
	jr .asm_42cf
.asm_42a0
	ld a, [wcd4c]
	and a
	jr z, .asm_42c5
	ld a, [wcd4c]
	dec a
	ld [wcd4c], a
	ld a, $05
	ld [wcd4c + 1], a
	ld a, $09
	ld [wcd4c + 2], a
	jr .asm_42cf
	ld a, [wcd4c]
	and a
	jr z, .asm_42c5
	dec a
	ld [wcd4c], a
	jr .asm_42cf
.asm_42c5
	xor a
	ld [wcd4c + 2], a
	ld [wcd4c + 1], a
	ld [wcd4c], a
.asm_42cf
	ld a, [wcd4c + 2]
	ld de, ScoreDigitTiles
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	push hl
	pop de
	ld hl, $99EE
	ld bc, $0102
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $01
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wcd4c + 1]
	ld de, ScoreDigitTiles
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	push hl
	pop de
	ld hl, $99ED
	ld bc, $0102
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $01
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wcd4c]
	ld de, ScoreDigitTiles
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	push hl
	pop de
	ld hl, $99EB
	ld bc, $0102
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $01
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wcd4c + 2]
	ld b, a
	ld a, [wcd4c + 1]
	or b
	ld b, a
	ld a, [wcd4c]
	or b
	ret nz
	ld a, [wcd46 + 5]
	cp $03
	jr c, .asm_4344
	ld a, $02
	ld [wdcf5], a
	ret
.asm_4344
	ld a, $03
	ld [wdcf5], a
	ret
; TODO: 2bpp graphics - extract to PNG (rgbgfx)
ScoreDigitTiles:
	db $00, $0a, $01, $0b, $02, $0c, $03, $0d, $04, $0e, $05, $0f, $06, $10, $07, $11
	db $08, $12, $08, $13
Func_5d_435e:
	ld a, [wcd46 + 4]
	and a
	ret z
	cp $02
	jr z, .asm_43bc
	cp $03
	jr z, .asm_43d5
	cp $05
	jr z, .asm_43a3
	xor a
	ld [wcd46 + 4], a
	ld a, [wcd46 + 5]
	ld de, unk_5d_43F2
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $99
	ld de, BGMap_5d_43EE
	ld bc, $0202
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $02
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wcd46 + 5]
	inc a
	ld [wcd46 + 5], a
	cp $03
	jr c, .asm_43a3
	ld a, $02
	ld [wdcf5], a
	ret
.asm_43a3
	xor a
	ld [wcd46 + 4], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $10
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_43bc
	xor a
	ld [wcd46 + 4], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $30
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_43d5
	xor a
	ld [wcd46 + 4], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $20
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
BGMap_5d_43EE:
INCBIN "gfx/bgmaps/bgmap_5d_43ee.bin"
; TODO: indexed data table, classify type
unk_5d_43F2:
	db $e1, $e3, $e5
Func_5d_43f5:
	ld a, [wcd46 + 1]
	and a
	ret z
	xor a
	ld [wcd46 + 1], a
	ld de, AnimFrame_Pointers
	ld a, [wcd44]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd46 + 3]
	and a
	jr z, .asm_4417
	ld de, $8000
	jr .asm_441a
.asm_4417
	ld de, $8100
.asm_441a
	call .asm_4428
	ld a, [wcd46 + 3]
	ld c, a
	ld a, $01
	sub c
	ld [wcd46 + 3], a
	ret
.asm_4428
	ld bc, $0810
.asm_442b
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_442b
.asm_4431
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4431
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
.asm_443d
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_443d
.asm_4443
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4443
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
.asm_444f
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_444f
.asm_4455
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4455
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
.asm_4461
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4461
.asm_4467
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4467
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
.asm_4473
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4473
.asm_4479
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4479
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
.asm_4485
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4485
.asm_448b
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_448b
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
.asm_4497
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_4497
.asm_449d
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_449d
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
.asm_44a9
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_44a9
.asm_44af
	ldh a, [rSTAT]
	bit 1, a
	jr nz, .asm_44af
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jp nz, .asm_442b
	ret

Func_5d_44c0:
	ld a, [wcd45]
	and a
	ret z
	and $80
	jr nz, .asm_44d0
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	jr .asm_44dd
.asm_44d0
	ld a, [wcd45]
	and $7F
	ld [wcd45], a
	ld a, $00
	ld [wcd46], a
.asm_44dd
	ld a, [wcd45]
	ld de, RhythmPattern_Pointers
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
	jr nz, .asm_44fc
	xor a
	ld [wcd46], a
	ret
.asm_44fc
	cp $88
	jr z, .asm_4510
	ld [wcd44], a
	ld a, [wcd46]
	inc a
	ld [wcd46], a
	ld a, $01
	ld [wcd46 + 1], a
	ret
.asm_4510
	ld a, $81
	ld [wcd45], a
	ld a, $01
	ld [wcd46 + 1], a
	ld [wcd44], a
	xor a
	ld [wcd40], a
	ld [wcd46], a
	ld hl, $99D0
	ld de, RhythmTileChunks
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
RhythmPattern_Pointers:
	dw RhythmPatterns
	dw RhythmPatterns_4550
	dw RhythmPatterns_4557
	dw RhythmPatterns_455b
	dw RhythmPatterns_455f
	dw RhythmPatterns_4563
	dw RhythmPatterns_4567
	dw RhythmPatterns_456b
	dw RhythmPatterns_456f
	dw RhythmPatterns_4573
	dw RhythmPatterns_457a
RhythmPatterns:
	db $ff
RhythmPatterns_4550:
	db $01, $01, $01, $02, $02, $02, $ff
RhythmPatterns_4557:
	db $03, $03, $03, $88
RhythmPatterns_455b:
	db $04, $04, $04, $88
RhythmPatterns_455f:
	db $05, $05, $05, $88
RhythmPatterns_4563:
	db $06, $06, $06, $88
RhythmPatterns_4567:
	db $07, $07, $07, $88
RhythmPatterns_456b:
	db $08, $08, $08, $88
RhythmPatterns_456f:
	db $09, $09, $09, $88
RhythmPatterns_4573:
	db $0a, $0a, $0a, $0b, $0b, $0b, $ff
RhythmPatterns_457a:
	db $0c, $0c, $0c, $0d, $0d, $0d, $ff
Func_5d_4581:
	ldh a, [hJoypadPressed]
	bit 0, a
	call nz, .asm_46b4
	ldh a, [hJoypadPressed]
	bit 1, a
	call nz, .asm_46ec
	ldh a, [hJoypadPressed]
	bit 4, a
	call nz, .asm_4677
	ldh a, [hJoypadPressed]
	bit 5, a
	call nz, .asm_463a
	ldh a, [hJoypadPressed]
	bit 6, a
	call nz, .asm_45ac
	ldh a, [hJoypadPressed]
	bit 7, a
	call nz, .asm_45fd
	ret
.asm_45ac
	call .asm_4724
	ld a, [wcd40]
	and a
	jp nz, .asm_45e8
	ld a, SFX_1a
	call PlaySound
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $01
	jr nz, .asm_45e8
	xor a
	ld [wcd40], a
	ld hl, $0003
	add hl, bc
	ld [hl], $04
	ld a, $82
	ld [wcd45], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $20
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_45e8
	ld a, $01
	ld [wcd40], a
	ld a, $05
	ld [wcd46 + 4], a
	ld a, $88
	ld [wcd45], a
	ld a, SFX_19
	call PlaySound
	ret
.asm_45fd
	call .asm_4724
	ld a, [wcd40]
	and a
	jp nz, .asm_45e8
	ld a, SFX_1a
	call PlaySound
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $02
	jp nz, .asm_45e8
	xor a
	ld [wcd40], a
	ld hl, $0003
	add hl, bc
	ld [hl], $04
	ld a, $83
	ld [wcd45], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $20
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_463a
	call .asm_4724
	ld a, [wcd40]
	and a
	jp nz, .asm_45e8
	ld a, SFX_1a
	call PlaySound
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $03
	jp nz, .asm_45e8
	xor a
	ld [wcd40], a
	ld hl, $0003
	add hl, bc
	ld [hl], $04
	ld a, $84
	ld [wcd45], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $20
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_4677
	call .asm_4724
	ld a, [wcd40]
	and a
	jp nz, .asm_45e8
	ld a, SFX_1a
	call PlaySound
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $04
	jp nz, .asm_45e8
	xor a
	ld [wcd40], a
	ld hl, $0003
	add hl, bc
	ld [hl], $04
	ld a, $85
	ld [wcd45], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $20
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_46b4
	call .asm_4724
	ld a, [wcd40]
	and a
	jp nz, .asm_45e8
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $05
	jp nz, .asm_45e8
	xor a
	ld [wcd40], a
	ld hl, $0003
	add hl, bc
	ld [hl], $04
	ld a, $86
	ld [wcd45], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $20
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_46ec
	call .asm_4724
	ld a, [wcd40]
	and a
	jp nz, .asm_45e8
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $06
	jp nz, .asm_45e8
	xor a
	ld [wcd40], a
	ld hl, $0003
	add hl, bc
	ld [hl], $04
	ld a, $87
	ld [wcd45], a
	ld hl, $99D0
	ld de, RhythmTileChunks + $20
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $04
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_4724
	ld bc, wdd50
.asm_4727
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_473c
.asm_472f
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5F
	jr c, .asm_4727
	jr .asm_474e
.asm_473c
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	cp $3D
	jr nc, .asm_472f
	cp $34
	jr c, .asm_472f
	xor a
	ld [wcd40], a
	ret
.asm_474e
	ld a, $01
	ld [wcd40], a
	ret

Func_5d_4754:
	ld bc, wdd50
Func_5d_4757:
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr nz, Func_5d_476b

Func_5d_475f:
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5F
	jr c, Func_5d_4757
	ret
Func_5d_476b:
	ld de, RhythmState_Jumptable
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
	ret

Func_5d_477d:
	ld hl, $0000
	add hl, bc
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld a, $01
	ld [wcd40], a
	ld [wcd46 + 4], a
	ld a, $88
	ld [wcd45], a
	jp Func_5d_475f
RhythmState_Jumptable:
	dw Func_5d_47a6
	dw Func_5d_47aa
	dw Func_5d_47b8
	dw Func_5d_47c7
	dw Func_5d_47d7
Func_5d_47a6:
	jp Func_5d_475f
	ret

Func_5d_47aa:
	ld hl, $0001
	add hl, bc
	dec [hl]
	ld a, [hl]
	cp $F0
	jp nz, Func_5d_475f
	jp Func_5d_477d

Func_5d_47b8:
	ld hl, $0001
	add hl, bc
	dec [hl]
	dec [hl]
	ld a, [hl]
	cp $F0
	jp nz, Func_5d_475f
	jp Func_5d_477d

Func_5d_47c7:
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $F0
	jp nz, Func_5d_475f
	jp Func_5d_477d

Func_5d_47d7:
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $07
	jr c, .asm_47e2
	jr nc, .asm_47e7
.asm_47e2
	ld [hl], $07
	jp Func_5d_475f
.asm_47e7
	inc [hl]
	ld a, [hl]
	cp $0A
	jp c, Func_5d_475f
	ld hl, $0000
	add hl, bc
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	jp Func_5d_475f

Func_5d_4800:
	ld a, [wdcf6]
	and a
	jr z, .asm_480b
	dec a
	ld [wdcf6], a
	ret
.asm_480b
	ld bc, wdd50
.asm_480e
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4822
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5F
	jr c, .asm_480e
	ret
.asm_4822
	push hl
	pop bc
.asm_4824
	ld de, NoteSpawnTable
	ld a, [wdcfc]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $FF
	jr z, .asm_4858
	push af
	inc hl
	ld a, [hl]
	ld [wdce8], a
	inc hl
	inc hl
	ld a, [hl]
	ld [wdcf6], a
	ld a, $18
	ld [bc], a
	inc bc
	ld a, $B8
	ld [bc], a
	inc bc
	pop af
	ld [bc], a
	inc bc
	ld a, [wdce8]
	ld [bc], a
	ld a, [wdcfc]
	inc a
	ld [wdcfc], a
	ret
.asm_4858
	xor a
	ld [wdcfc], a
	jp .asm_4824
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
NoteSpawnTable:
	db $01, $01, $00, $60, $02, $01, $00, $60, $03, $01, $00, $40, $04, $01, $00, $40
	db $01, $01, $00, $20, $01, $01, $00, $20, $02, $01, $00, $40, $02, $01, $00, $40
	db $05, $01, $00, $20, $05, $01, $00, $20, $06, $01, $00, $20, $06, $01, $00, $10
	db $03, $01, $00, $20, $04, $01, $00, $20, $01, $01, $00, $10, $02, $01, $00, $40
	db $05, $01, $00, $40, $06, $01, $00, $10, $ff
Func_5d_48a8:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_48b1
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_48b1
	xor a
	ld [wd1fb], a
	call Func_5d_4951
	call .asm_48c3
	ret
.asm_48c3
	ld hl, SpriteAnim_Pointers
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
.asm_48e2
	ld a, [hli]
	cp $FF
	jr z, .asm_48f6
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
	jr .asm_48e2
.asm_48f6
	ld a, e
	ld [wd1fb], a
	ret
SpriteAnim_Pointers:
	dw SpriteFrame_Empty
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
	dw SpriteFrame_Title
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
SpriteFrame_Empty:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
SpriteFrame_Title:
	db $00, $00, $00, $01, $00, $08, $02, $01, $00, $10, $04, $01, $00, $18, $06, $01
	db $10, $00, $08, $01, $10, $08, $0a, $01, $10, $10, $0c, $01, $10, $18, $0e, $01
	db $ff
Func_5d_4951:
	ld bc, wdd50
.asm_4954
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4968
.asm_495c
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5F
	jr c, .asm_4954
	ret
.asm_4968
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	ld [wdcf7], a
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	ld [wdcf8], a
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	ld de, SpriteOAM_Pointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $C0
.asm_498e
	ld a, [hli]
	cp $FF
	jr z, .asm_49ae
	push bc
	ld b, a
	ld a, [wdcf7]
	add b
	pop bc
	ld [de], a
	inc de
	ld a, [hli]
	push bc
	ld b, a
	ld a, [wdcf8]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop bc
	jr .asm_498e
.asm_49ae
	ld a, e
	ld [wd1fb], a
	jp .asm_495c
SpriteOAM_Pointers:
	dw SpriteFrames_49C9
	dw SpriteFrames_49C9
	dw SpriteFrames_49C9_49d2
	dw SpriteFrames_49C9_49db
	dw SpriteFrames_49C9_49e4
	dw SpriteFrames_49C9_49ed
	dw SpriteFrames_49C9_49f6
	dw SpriteFrames_49C9_49ff
	dw SpriteFrames_49C9_4a08
	dw SpriteFrames_49C9_4a11
SpriteFrames_49C9:
	db $00, $00, $40, $00, $00, $08, $42, $00, $ff
SpriteFrames_49C9_49d2:
	db $00, $00, $44, $00, $00, $08, $46, $00, $ff
SpriteFrames_49C9_49db:
	db $00, $00, $48, $00, $00, $08, $4a, $00, $ff
SpriteFrames_49C9_49e4:
	db $00, $00, $4c, $00, $00, $08, $4e, $00, $ff
SpriteFrames_49C9_49ed:
	db $00, $00, $50, $00, $00, $08, $52, $00, $ff
SpriteFrames_49C9_49f6:
	db $00, $00, $54, $00, $00, $08, $56, $00, $ff
SpriteFrames_49C9_49ff:
	db $00, $00, $58, $00, $00, $08, $5a, $00, $ff
SpriteFrames_49C9_4a08:
	db $00, $00, $5c, $00, $00, $08, $5e, $00, $ff
SpriteFrames_49C9_4a11:
	db $00, $00, $60, $00, $00, $08, $62, $00, $ff
Func_5d_4a1a:
	ldh a, [hJoypadDown]
	and a
	ret z
	ld a, $01
	ld [wdcf5], a
	ret

Func_5d_4a24:
	ld hl, RhythmBGPalette
	call CopyBackgroundPalettes
	ld hl, RhythmBGPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

Func_5d_4a37:
	ld hl, BlackPalette
	call CopyBackgroundPalettes
	ld hl, BlackPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

Func_5d_4a4a:
	call DelayFrame
	dec c
	jr nz, Func_5d_4a4a
	ret

Func_5d_4a51:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_4a57
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_4a57
	ret

Func_5d_4a5f:
	ld hl, wdd50
	ld bc, $0010
.asm_4a65
	ld [hl], $00
	inc hl
	dec c
	ld a, c
	or b
	jr nz, .asm_4a65
	ret

Func_5d_4a6e:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4a77
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4a77
	ret
BlackPalette:
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
RhythmBGPalette:
	RGB 31, 31, 31
	RGB 27, 25, 18
	RGB 18, 15, 10
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 23, 29
	RGB 0, 9, 26
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 21, 0
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 22, 15
	RGB 0, 12, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 30, 16, 28
	RGB 19, 0, 14
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
; TODO: padding between palettes, confirm
unk_5d_4AFF_pad:
	ds 8
RhythmOBJPalette:
	RGB 21, 21, 21
	RGB 16, 0, 0
	RGB 31, 25, 0
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 17, 0
	RGB 31, 30, 29
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 20, 17, 31
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
; TODO: padding between palettes, confirm
unk_5d_4B47_pad:
	ds 8
RhythmScreen1Tilemap:
INCBIN "gfx/tilemaps/rhythmscreen1tilemap.tilemap"
RhythmScreen1Attrmap:
INCBIN "gfx/attrmaps/rhythmscreen1attrmap.bin"
RhythmScreen2Tilemap:
INCBIN "gfx/tilemaps/rhythmscreen2tilemap.tilemap"
RhythmScreen2Attrmap:
INCBIN "gfx/attrmaps/rhythmscreen2attrmap.bin"
RhythmScreen1GFX:
INCBIN "gfx/misc/rhythmscreen1gfx.2bpp"
RhythmScreen1GFX2:
INCBIN "gfx/misc/rhythmscreen1gfx2.2bpp"
RhythmScreen2GFX:
INCBIN "gfx/misc/rhythmscreen2gfx.2bpp"
RhythmScreen2GFX2:
INCBIN "gfx/misc/rhythmscreen2gfx2.2bpp"
RhythmSharedGFX:
INCBIN "gfx/misc/rhythmsharedgfx.2bpp"
AnimFrame_Pointers:
	dw RhythmAnimFrames
	dw RhythmAnimFrames
	dw RhythmAnimFrames_6d7b
	dw RhythmAnimFrames_6e7b
	dw RhythmAnimFrames_6f7b
	dw RhythmAnimFrames_707b
	dw RhythmAnimFrames_717b
	dw RhythmAnimFrames_727b
	dw RhythmAnimFrames_737b
	dw RhythmAnimFrames_747b
	dw RhythmAnimFrames_757b
	dw RhythmAnimFrames_767b
	dw RhythmAnimFrames_777b
	dw RhythmAnimFrames_787b
RhythmAnimFrames: INCBIN "gfx/sprites/rhythmanim.2bpp", $0, $100
RhythmAnimFrames_6d7b: INCBIN "gfx/sprites/rhythmanim.2bpp", $100, $100
RhythmAnimFrames_6e7b: INCBIN "gfx/sprites/rhythmanim.2bpp", $200, $100
RhythmAnimFrames_6f7b: INCBIN "gfx/sprites/rhythmanim.2bpp", $300, $100
RhythmAnimFrames_707b: INCBIN "gfx/sprites/rhythmanim.2bpp", $400, $100
RhythmAnimFrames_717b: INCBIN "gfx/sprites/rhythmanim.2bpp", $500, $100
RhythmAnimFrames_727b: INCBIN "gfx/sprites/rhythmanim.2bpp", $600, $100
RhythmAnimFrames_737b: INCBIN "gfx/sprites/rhythmanim.2bpp", $700, $100
RhythmAnimFrames_747b: INCBIN "gfx/sprites/rhythmanim.2bpp", $800, $100
RhythmAnimFrames_757b: INCBIN "gfx/sprites/rhythmanim.2bpp", $900, $100
RhythmAnimFrames_767b: INCBIN "gfx/sprites/rhythmanim.2bpp", $a00, $100
RhythmAnimFrames_777b: INCBIN "gfx/sprites/rhythmanim.2bpp", $b00, $100
RhythmAnimFrames_787b: INCBIN "gfx/sprites/rhythmanim.2bpp", $c00, $100
; TODO: indexed mid-block (+offset at runtime); consider per-entry sub-labels
; 4 tilemap chunks (4x4 tile indices each) copied to the BG map
RhythmTileChunks:
	db $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c
	db $1d, $1e, $2d, $2e, $2f, $30, $31, $32, $33, $34, $35, $28, $29, $2a, $2b, $2c
	db $1d, $1e, $1f, $20, $36, $37, $38, $24, $39, $3a, $3b, $28, $29, $2a, $2b, $2c
	db $1d, $1e, $1f, $20, $3c, $3d, $3e, $24, $3f, $40, $41, $28, $29, $2a, $2b, $2c
; TODO: padding between palettes, confirm
unk_5d_79BB_pad:
	ds 5


