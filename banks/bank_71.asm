Credits::
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
	call ClearBGMap0
	ld a, $50
	ld [wWX], a
	ld de, CreditsBgTilemap2
	ld hl, $9C00
	ld bc, $0B12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call Func_1373
	ld de, CreditsBgTilemap1
	ld hl, $9C00
	ld bc, $0B12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call Func_1367
	ld hl, CreditsPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, CreditsFontGFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld a, $51
	ld [wd9e5], a
	call LoadMonPic_vTiles9440
	farcall Func_026_4cef
	call Func_71_42bf
	call Func_71_42a7
	ld a, $E7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4082
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_40a5
	ld a, [wdcf5]
	and a
	jr nz, .asm_409f
	call Func_71_4116
	call .asm_40b7
	jp .asm_4082
.asm_409f
	call Func_71_40fb
	jp .asm_4082
.asm_40a5
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, $09
	ld [hMapNumber], a
	xor a
	ld [hWarpNumber], a
	jp JumpToGameMode
.asm_40b7
	ldh a, [hSCY]
	cp $20
	jr z, .asm_40c2
	cp $A0
	jr z, .asm_40c2
	ret
.asm_40c2
	ld de, CreditsMonPicList
	ld a, [wdcfb]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wd9e5], a
	call LoadMonPic_vTiles9440
	farcall Func_026_4cef
	ld a, [wdcfb]
	inc a
	ld [wdcfb], a
	cp $13
	ret c
	xor a
	ld [wdcfb], a
	ret
CreditsMonPicList:
	dr $1c40e8, $1c40fb
Func_71_40fb:
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
Func_71_4116:
	ld a, [wdcf3]
	and a
	jr z, .asm_4146
	ldh a, [hSCY]
	inc a
	ldh [hSCY], a
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld a, [wdcf3]
	dec a
	ld [wdcf3], a
	ld a, [wdcf4]
	cp $08
	ret c
	ld a, [wdcf3]
	cp $0E
	ret nz
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld a, $01
	ld [wdcf5], a
	ret
.asm_4146
	ld a, [wdcf4]
	and a
	jr z, .asm_414f
	call .asm_4162
.asm_414f
	call .asm_41bf
	call .asm_41a5
	ld a, $1D
	ld [wdcf3], a
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	ret
.asm_4162
	ld de, CreditsScreenLayouts
	ld a, [wdcf4]
	dec a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [hVRAMCopyHeight], a
	ld c, a
	ld a, [hli]
	ld [hVRAMCopyWidth], a
	ld b, a
	ld a, [hli]
	ld [wd083], a
	ld a, [hli]
	ld [wd083 + 1], a
	ld h, a
	ld a, [wd083]
	ld l, a
	ld e, $00
	call Func_15a8
	ld a, [hVRAMCopyWidth]
	ld b, a
	ld a, [hVRAMCopyHeight]
	ld c, a
	ld a, [wd083]
	ld l, a
	ld a, [wd083 + 1]
	ld h, a
	ld a, $01
	ldh [rVBK], a
	xor e
	call Func_15a8
	ret
.asm_41a5
	ld de, CreditsScreenGfx
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8800
	call CopyBytesVRAM
	ret
.asm_41bf
	ld de, CreditsScreenLayouts
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [hVRAMCopyHeight], a
	ld c, a
	ld a, [hli]
	ld [hVRAMCopyWidth], a
	ld b, a
	ld a, [hli]
	ld [wd083], a
	ld a, [hli]
	ld [wd083 + 1], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, [wd083]
	ld l, a
	ld a, [wd083 + 1]
	ld h, a
	call PlaceTilemap_Bank0
	pop hl
	ld a, [hVRAMCopyWidth]
	ld b, a
	ld a, [hVRAMCopyHeight]
	ld c, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wd083]
	ld l, a
	ld a, [wd083 + 1]
	ld h, a
	call PlaceAttrmap
	ret
CreditsScreenLayouts:
	dr $1c4207, $1c4287
CreditsScreenGfx:
	dr $1c4287, $1c42a7
Func_71_42a7:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_42b0
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_42b0
	ret
Func_71_42b8:
	call DelayFrame
	dec c
	jr nz, Func_71_42b8
	ret
Func_71_42bf:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_42c5
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_42c5
	ret
CreditsBgTilemap1:
	dr $1c42cd, $1c4393
CreditsBgTilemap2:
	dr $1c4393, $1c4459
CreditsPalette:
	RGB 31, 31, 31
	RGB 22, 31, 17
	RGB 0, 0, 22
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 31, 29, 0
	RGB 24, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 23, 31
	RGB 0, 0, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
CreditsFontGFX:
	dr $1c4499, $1c48d9
CreditsScreen1Attrmap:
	dr $1c48d9, $1c48fd
CreditsScreen1Tilemap:
	dr $1c48fd, $1c4921
CreditsScreen1Gfx:
	dr $1c4921, $1c4a71
CreditsScreen2Attrmap:
	dr $1c4a71, $1c4a95
CreditsScreen2Tilemap:
	dr $1c4a95, $1c4ab9
CreditsScreen2Gfx:
	dr $1c4ab9, $1c4c09
CreditsScreen3Attrmap:
	dr $1c4c09, $1c4c3f
CreditsScreen3Tilemap:
	dr $1c4c3f, $1c4c75
CreditsScreen3Gfx:
	dr $1c4c75, $1c4f85
CreditsScreen4Attrmap:
	dr $1c4f85, $1c4fa3
CreditsScreen4Tilemap:
	dr $1c4fa3, $1c4fc1
CreditsScreen4Gfx:
	dr $1c4fc1, $1c5111
CreditsScreen5Attrmap:
	dr $1c5111, $1c513b
CreditsScreen5Tilemap:
	dr $1c513b, $1c5165
CreditsScreen5Gfx:
	dr $1c5165, $1c5375
CreditsScreen6Attrmap:
	dr $1c5375, $1c5393
CreditsScreen6Tilemap:
	dr $1c5393, $1c53b1
CreditsScreen6Gfx:
	dr $1c53b1, $1c5501
CreditsScreen7Attrmap:
	dr $1c5501, $1c5537
CreditsScreen7Tilemap:
	dr $1c5537, $1c556d
CreditsScreen7Gfx:
	dr $1c556d, $1c587d
CreditsScreen8Attrmap:
	dr $1c587d, $1c589b
CreditsScreen8Tilemap:
	dr $1c589b, $1c58b9
CreditsScreen8Gfx:
	dr $1c58b9, $1c5a49

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
	ld a, $10
	ld [wTargetMode], a
	jp JumpToGameMode
TheEndAttrmap:
	dr $1c5adc, $1c5c44
TheEndTilemap:
	dr $1c5c44, $1c5dac
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
unk_071_5dec:
	dr $1c5dec, $1c5df4
TheEndGfx:
	dr $1c5df4, $1c5f90


