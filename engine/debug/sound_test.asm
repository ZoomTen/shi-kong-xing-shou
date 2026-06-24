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
	dw .data_0
	dw .data_1
	dw .data_2
	dw .data_3
	dw .data_4
	dw .data_5
	dw .data_6
	dw .data_7
	dw .data_8
	dw .data_9
	dw .data_10
	dw .data_11
	dw .data_12
	dw .data_13
	dw .data_14
	dw .data_15
.data_0
	db $00, $0e
.data_1
	db $01, $0f
.data_2
	db $02, $10
.data_3
	db $03, $11
.data_4
	db $04, $12
.data_5
	db $05, $13
.data_6
	db $06, $14
.data_7
	db $07, $15
.data_8
	db $08, $16
.data_9
	db $08, $17
.data_10
	db $09, $18
.data_11
	db $0a, $19
.data_12
	db $0b, $1a
.data_13
	db $0c, $1b
.data_14
	db $0d, $1c
.data_15
	db $0d, $1d
Debug_SoundTest_Palette:
	RGB 31, 31, 31
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 23, 29
	RGB 0, 9, 26
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 30, 16, 28
	RGB 19, 0, 14
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
Debug_SoundTest_Tilemap:
INCBIN "gfx/tilemaps/debug_soundtest_tilemap.tilemap"
Debug_SoundTest_Attrmap:
INCBIN "gfx/attrmaps/debug_soundtest_attrmap.bin"
Debug_SoundTest_GFX:
INCBIN "gfx/misc/debug_soundtest_gfx.bin"
