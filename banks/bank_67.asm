BeachCutscene::
	ld a, $59
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
	dr $19c14a, $19c25e
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
	dr $19c2ee, $19c456
BeachCutsceneTilemap:
	dr $19c456, $19c5be
BeachCutsceneGFX1:
	dr $19c5be, $19c8fe
BeachCutsceneGFX2:
	dr $19c8fe, $19d06e

FloatingIslandCutscene1::
	ld a, $69
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
	ld de, unk_67_53c1 + $90
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, unk_67_53c1
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, unk_67_5721
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, unk_67_53c1 + $48
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
	ld a, $16
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
	dr $19d18c, $19d1f5

FloatingIslandCutscene2::
	ld a, $69
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
	ld a, $26
	call PlaySound
	xor a
	ld [wdcf4], a
	ld a, $01
	ld [hFade], a
	ret
FloatingIslandCutscene2_MoveDeltas:
	dr $19d2e8, $19d371
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
	ld hl, $414A
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
unk_67_53c1:
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
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
unk_67_5481:
	dr $19d481, $19d5b9
FloatingIsland1_Tilemap:
	dr $19d5b9, $19d721
unk_67_5721:
	dr $19d721, $19def1
FloatingIsland1_SpriteGFX:
	dr $19def1, $19e0d1
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
	dr $19e161, $19e2c9
FloatingIslandCutscene2_Tilemap:
	dr $19e2c9, $19e431
FloatingIslandCutscene2_GFX:
	dr $19e431, $19eba1
FloatingIslandCutscene2_GFX2:
	dr $19eba1, $19ee01
Script_067_6e01::
	dr $19ee01, $19ee0a

G5_03_ObjectEvents:
	dr $19ee0a, $19ee21

G5_04_ObjectEvents:
	dr $19ee21, $19ee38

G5_05_ObjectEvents:
	dr $19ee38, $19ee44

G5_06_ObjectEvents:
	dr $19ee44, $19f090
