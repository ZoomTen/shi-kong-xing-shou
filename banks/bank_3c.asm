LoadSaveData:
	ld a, SRAM_ENABLE
	ld [rRAMG], a
	xor a
	ld [rRAMB], a
	ld hl, sMapOffsetX
	ld de, hMapOffsetX
	ld bc, $0026
	call CopyBytes3
	ld hl, sMapLayoutPointer
	ld de, wMapLayoutPointer
	ld bc, $004C
	call CopyBytes3
	ld hl, sTilemap
	ld de, wTilemap
	ld bc, $0190
	call CopyBytes3
	ld hl, sPartyMons
	ld de, wPartyMons
	ld bc, $0200
	call CopyBytes3
	ld hl, sa860
	ld de, wd7cb
	ld bc, $0098
	call CopyBytes3
	ld hl, sa4a6
	ld de, wMonBoxCount
	ld bc, $0010
	call CopyBytes3
	ld hl, sEventFlags
	ld de, wEventFlags
	ld bc, $0040
	call CopyBytes3
	ld hl, sa6db
	ld de, wMonBox
	ld bc, $017C
	call CopyBytes3
	ld hl, sa858
	ld de, wd871
	ld bc, $0005
	call CopyBytes3
	ld de, wPlayerScreenX
	ld hl, sPlayerScreenX
	ld a, [hli]
	ld [de], a
	dec de
	ld a, [hli]
	ld [de], a
	ld de, wddb0
	ld hl, sa430
	ld bc, $0050
	call CopyBytes3
	ld de, wde00
	ld hl, sa500
	ld bc, $00B0
	call CopyBytes3
	ld de, wdd00
	ld hl, sa600
	ld bc, $0040
	call CopyBytes3
	ld de, wdcbb
	ld hl, sa650
	ld bc, $0001
	call CopyBytes3
	ld de, wdcea
	ld hl, sa651
	ld bc, $0001
	call CopyBytes3
	ld de, wd9dd
	ld hl, sa652
	ld bc, $0001
	call CopyBytes3
	xor a
	ld [rRAMG], a
	ld [rRAMB], a
	ldh [hFFD6], a
	ret

NewGameContinueMenu::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ldh [hFFC2], a
	ldh [hJoypadPressed], a
	ld [hFFBB], a
	ld [wdccf], a
	ld [wdccc], a
	ldh [hFFA1], a
	ld [wcd0a], a
	call ClearBGMap0
	ld hl, $9800
	ld de, .Tilemap
	ld bc, $0B06
	ld a, $06
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, .Attrmap
	ld bc, $0B06
	ld a, $06
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, .Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, .Palette2
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, .GFX
	ld de, $9000
	ld bc, $0090
	call CopyBytesVRAM
	ld hl, .GFX2
	ld de, $8FE0
	ld bc, $0020
	call CopyBytesVRAM
	ld hl, wcde0
	ld [hl], $18
	inc hl
	ld [hl], $10
	inc hl
	ld [hl], $01
	ld a, $C7
	ldh [rLCDC], a
	call .asm_41d6
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	ld [wSelectedOption], a
	call FadeInPalette
.asm_416a
	farcall Func_024_4062
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_4183
	call .asm_418a
	jp .asm_416a
.asm_4183
	xor a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_418a
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_419f
	ld a, [wSelectedOption]
	and a
	ret z
	xor a
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $18
	ret
.asm_419f
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_41b5
	ld a, [wSelectedOption]
	and a
	ret nz
	ld a, $01
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $28
	ret
.asm_41b5
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $01
	ldh [hFade], a
	xor a
	ld [wd9d2], a
	ld a, [wcde0]
	cp $18
	ret z
	call SRAMTest_Fast
	and a
	ret nz
	ld a, $01
	ld [wd9d2], a
	call LoadSaveData
	ret
.asm_41d6
	ld hl, .MenuText
	ld a, $10
	ld [wMenuTextX], a
	ld a, $30
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

.MenuText:
	dr $f01eb, $f01f7
.Tilemap:
	dr $f01f7, $f0239
.Attrmap:
	dr $f0239, $f027b
.Palette:
	RGB 31, 31, 31
	RGB 11, 27, 31
	RGB 10, 10, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 25, 0
	RGB 24, 0, 0
	RGB 0, 0, 0
.Palette2:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 15, 29
	RGB 31, 27, 23
.GFX:
	dr $f0293, $f0323
.GFX2:
	dr $f0323, $f0343

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
	ld hl, GFX_03c_4775
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
	ld a, $02
	ld [wTargetMode], a
	ret
.asm_4419
	ldh a, [hJoypadPressed]
	and a
	ret z
	ld a, $01
	ldh [hFade], a
	ld a, $02
	ld [wTargetMode], a
	ret
AttrMap_03c_4427:
	dr $f0427, $f058f
Tilemap_03c_458f:
	dr $f058f, $f06f7
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
	dr $f0737, $f0775
GFX_03c_4775:
	dr $f0775, $f0c55
Func_03c_4c55:
	dr $f0c55, $f0c63
Func_03c_4c63:
	dr $f0c63, $f0c74

Func_03c_4c74::
	call Func_03c_4c55
	ld a, $6E
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
	ld [wdcf5], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld hl, $9800
	ld de, Tilemap_03c_531c
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AttrMap_03c_51b4
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Palettes_03c_5484
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, Palettes_03c_5b8c
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_03c_549c
	ld de, $9000
	ld bc, $06F0
	call CopyBytesVRAM
	ld hl, GFX_03c_5b94
	ld de, $8000
	ld bc, $0340
	call CopyBytesVRAM
	call Func_03c_4c63
	ld a, $50
	ld [wcd55], a
	ld a, $28
	ld [wcd56], a
	ld a, $01
	ld [wcd57], a
	ld a, $81
	ld [wcd58], a
	ld a, $38
	ld [wcd59], a
	ld a, $48
	ld [wcd5a], a
	ld a, $01
	ld [wcd5b], a
	ld a, $81
	ld [wcd5c], a
	ld a, $48
	ld [wcd5d], a
	ld a, $78
	ld [wcd5e], a
	ld a, $01
	ld [wcd5f], a
	ld a, $81
	ld [wcd60], a
	call Func_03c_4fb7
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4d45
	call DelayFrame
	call Func_03c_4fb7
	call .asm_4e41
	call .asm_4e87
	call Func_03c_4f68
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_4d61
	jp .asm_4d45
.asm_4d61
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	ld hl, $9800
	ld de, Tilemap_03c_603c
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AttrMap_03c_5ed4
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Palettes_03c_61a4
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_03c_61c4
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, $8800
	ld bc, $0020
	call CopyBytesVRAM
	ld hl, Palettes_03c_69e4
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_03c_69ec
	ld de, $8000
	ld bc, $0280
	call CopyBytesVRAM
	ld a, $60
	ld [wcd55], a
	ld a, $38
	ld [wcd56], a
	ld a, $05
	ld [wcd57], a
	ld a, $85
	ld [wcd58], a
	ld a, $48
	ld [wcd59], a
	ld a, $58
	ld [wcd5a], a
	ld a, $05
	ld [wcd5b], a
	ld a, $85
	ld [wcd5c], a
	ld a, $58
	ld [wcd5d], a
	ld a, $88
	ld [wcd5e], a
	ld a, $05
	ld [wcd5f], a
	ld a, $85
	ld [wcd60], a
	call Func_03c_4fb7
	xor a
	ldh [hFade], a
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4e1c
	call DelayFrame
	call Func_03c_4fb7
	call .asm_4e41
	call .asm_4e87
	call Func_03c_4f68
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_4e38
	jp .asm_4e1c
.asm_4e38
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_4e41
	ld a, [wcd58]
	and a
	ret z
	and $80
	jr nz, .asm_4e51
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	jr .asm_4e5d
.asm_4e51
	ld a, [wcd58]
	and $7F
	ld [wcd58], a
	xor a
	ld [wcd65], a
.asm_4e5d
	ld a, [wcd58]
	ld de, Pointers_03c_4ec9
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd65]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4e7c
	xor a
	ld [wcd65], a
	ret
.asm_4e7c
	ld [wcd57], a
	ld a, [wcd65]
	inc a
	ld [wcd65], a
	ret
.asm_4e87
	ld a, [wcd5c]
	and a
	ret z
	and $80
	jr nz, .asm_4e97
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4e9f
.asm_4e97
	ld a, [wcd5c]
	and $7F
	ld [wcd5c], a
.asm_4e9f
	ld a, [wcd5c]
	ld de, Pointers_03c_4ec9
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd66]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4ebe
	xor a
	ld [wcd66], a
	ret
.asm_4ebe
	ld [wcd5b], a
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	ret
Pointers_03c_4ec9:
	dr $f0ec9, $f0f68
Func_03c_4f68:
	ld a, [wcd60]
	and a
	ret z
	and $80
	jr nz, .asm_4f78
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4f84
.asm_4f78
	ld a, [wcd60]
	and $7F
	ld [wcd60], a
	xor a
	ld [wcd67], a
.asm_4f84
	ld a, [wcd60]
	ld de, Pointers_03c_4ec9
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd67]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4fa7
	cp $FF
	jr nz, .asm_4fac
	xor a
	ld [wcd67], a
	ret
.asm_4fa7
	ld a, $01
	ldh [hFade], a
	ret
.asm_4fac
	ld [wcd5f], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	ret

Func_03c_4fb7:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4fc0
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4fc0
	xor a
	ld [wd1fb], a
	call .asm_5045
	call .asm_500d
	call .asm_4fd5
	ret
.asm_4fd5
	ld hl, Pointers_03c_50bb
	ld de, wcd5d
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
.asm_4ff4
	ld a, [hli]
	cp $FF
	jr z, .asm_5008
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
	jr .asm_4ff4
.asm_5008
	ld a, e
	ld [wd1fb], a
	ret
.asm_500d
	ld hl, Pointers_03c_50bb
	ld de, wcd59
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
.asm_502c
	ld a, [hli]
	cp $FF
	jr z, .asm_5040
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
	jr .asm_502c
.asm_5040
	ld a, e
	ld [wd1fb], a
	ret
.asm_5045
	ld a, [wcd57]
	and a
	ret z
	ld hl, Pointers_03c_50bb
	ld de, wcd55
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
.asm_5069
	ld a, [hli]
	cp $FF
	jr z, .asm_507d
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
	jr .asm_5069
.asm_507d
	ld a, e
	ld [wd1fb], a
	ret

Func_03c_5082:
	ld hl, Pointers_03c_50bb
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
	sla a
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
.asm_50a2
	ld a, [hli]
	cp $FF
	jr z, .asm_50b6
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
	jr .asm_50a2
.asm_50b6
	ld a, e
	ld [wd1fb], a
	ret
Pointers_03c_50bb:
	dr $f10bb, $f11b4
AttrMap_03c_51b4:
	dr $f11b4, $f131c
Tilemap_03c_531c:
	dr $f131c, $f1484
Palettes_03c_5484:
	RGB 31, 31, 31
	RGB 18, 31, 0
	RGB 5, 19, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 14, 11, 31
	RGB 10, 5, 20
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 22, 31
	RGB 0, 12, 25
	RGB 0, 0, 0
GFX_03c_549c:
	dr $f149c, $f1b8c
Palettes_03c_5b8c:
	RGB 16, 16, 16
	RGB 31, 31, 7
	RGB 31, 17, 0
	RGB 31, 0, 0
GFX_03c_5b94:
	dr $f1b94, $f1ed4
AttrMap_03c_5ed4:
	dr $f1ed4, $f203c
Tilemap_03c_603c:
	dr $f203c, $f21a4
Palettes_03c_61a4:
	RGB 31, 31, 0
	RGB 25, 25, 8
	RGB 16, 16, 2
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 18, 31, 0
	RGB 5, 19, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 14, 11, 31
	RGB 10, 5, 20
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 22, 31
	RGB 0, 12, 25
	RGB 0, 0, 0
GFX_03c_61c4:
	dr $f21c4, $f29c4
GFX_03c_69c4:
	dr $f29c4, $f29e4
Palettes_03c_69e4:
	RGB 0, 0, 30
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
GFX_03c_69ec:
	dr $f29ec, $f2c70


