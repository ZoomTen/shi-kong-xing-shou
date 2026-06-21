; TODO: unreferenced data block, classify type
unk_04e_4000:
	dr $138000, $138009

BanglinCo1f_ObjectEvents5:
BanglinCo2f_ObjectEvents:
BanglinCo3f_ObjectEvents:
BanglinCo4f_ObjectEvents:
BanglinCo5f_ObjectEvents:
	dr $138009, $13800b

BanglinCo2_ObjectEvents:
	dr $13800b, $138053

Script_04e_4053::
	dr $138053, $1380a4

ContestHall_ObjectEvents:
	dr $1380a4, $1380d1

BanglinCo2_ObjectEvents2:
	dr $1380d1, $138119

Script_04e_4119::
	dr $138119, $13836a

BanglinCo1f_ObjectEvents4:
	dr $13836a, $1383d5

ContestHall_ObjectEvents2:
	dr $1383d5, $138402

BanglinCo5f_ObjectEvents2:
	dr $138402, $138419

Script_04e_4419::
	dr $138419, $1384b0

BanglinCo1f_ObjectEvents6:
	dr $1384b0, $1384d2

Script_04e_44d2::
	dr $1384d2, $13858a

Airport_ObjectEvents2:
	dr $13858a, $1385ac

Airport_ObjectEvents:
	dr $1385ac, $138637

AirportCutscene4::
	call Func_4e_4ce3
	ld a, $70
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
	ld [wdcf7], a
	ld [wdcf8], a
	ld a, $02
	ld [wdcf5], a
	ld hl, $9800
	ld de, AirportCutscene1_Tilemap
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AirportCutscene1_Attrmap
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, AirportCutscene1_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, AirportCutscene1_ObjPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, AirportCutscene1_GFX
	ld de, $9000
	ld bc, $0560
	call CopyBytesVRAM
	ld hl, AirportCutscene1_ObjGFX
	ld de, $8000
	ld bc, $04A0
	call CopyBytesVRAM
	call Func_4e_4cf1
	ld a, $30
	ld [wcd42], a
	ld a, $38
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	call Func_4e_4bde
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
	jp Func_4e_478e

AirportCutscene3::
	call Func_4e_4ce3
	ld a, $70
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
	ld de, AirportCutscene1_Tilemap
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AirportCutscene1_Attrmap
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, AirportCutscene1_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, AirportCutscene1_ObjPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, AirportCutscene1_GFX
	ld de, $9000
	ld bc, $0560
	call CopyBytesVRAM
	ld hl, AirportCutscene1_ObjGFX
	ld de, $8000
	ld bc, $04A0
	call CopyBytesVRAM
	call Func_4e_4cf1
	ld a, $30
	ld [wcd42], a
	ld a, $A8
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	call Func_4e_4bde
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
Func_4e_478e:
	call DelayFrame
	call Func_4e_4bde
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_47b2
	call .asm_47cc
	ld a, [wdcf5]
	cp $01
	jr z, .asm_47c0
	cp $02
	jr z, .asm_47c6
	call .asm_47d3
	jp Func_4e_478e
.asm_47b2
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, $05
	ld [hMapGroup], a
	jp JumpToGameMode
.asm_47c0
	call .asm_47e4
	jp Func_4e_478e
.asm_47c6
	call Func_4e_487d
	jp Func_4e_478e
.asm_47cc
	ldh a, [hSCX]
	sub $08
	ldh [hSCX], a
	ret
.asm_47d3
	ld a, [wcd43]
	dec a
	dec a
	ld [wcd43], a
	cp $38
	ret nz
	ld a, $01
	ld [wdcf5], a
	ret
.asm_47e4
	ld a, [wcd42]
	ld b, a
	ld a, [wcd43]
	ld c, a
	ld de, AirportCutscene3_PathScript1
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_480d
	add b
	ld [wcd42], a
	ld a, [hli]
	add c
	ld [wcd43], a
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	ret
.asm_480d
	xor a
	ld [wdcf3], a
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $04
	ret c
	xor a
	ld [wdcf4], a
	ld a, $01
	ldh [hFade], a
	ret
AirportCutscene3_PathScript1:
	dr $138824, $13887d
Func_4e_487d:
	ld a, [wcd42]
	ld b, a
	ld a, [wcd43]
	ld c, a
	ld de, AirportCutscene3_PathScript2
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_48a6
	add b
	ld [wcd42], a
	ld a, [hli]
	add c
	ld [wcd43], a
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	ret
.asm_48a6
	xor a
	ld [wdcf3], a
	ld a, $01
	ld [hFade], a
	ret
AirportCutscene3_PathScript2:
	dr $1388b0, $138943

AirportCutscene1::
	call Func_4e_4ce3
	ld a, $70
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
	ld de, AirportCutscene1_Tilemap
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, AirportCutscene1_Attrmap
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, AirportCutscene1_Palette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, AirportCutscene1_ObjPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, AirportCutscene1_GFX
	ld de, $9000
	ld bc, $0560
	call CopyBytesVRAM
	ld hl, AirportCutscene1_ObjGFX
	ld de, $8000
	ld bc, $04a0
	call CopyBytesVRAM
	call Func_4e_4cf1
	ld a, $58
	ld [wcd42], a
	ld a, $b0
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_49e9
	call DelayFrame
	call Func_4e_4bde
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_4a05
	call Func_4e_4b53
	call Func_4e_4a52
	call Func_4e_4a31
	jp .asm_49e9
.asm_4a05
	xor a
	ldh [hFade], a
	ld a, $07
	ld [wTargetMode], a
	jp JumpToGameMode
AirportCutscene1_ScrollRamp:
	dr $138a10, $138a31
Func_4e_4a31:
	ld a, [wdcf3]
	cp $20
	jr nc, .asm_4a4b
	inc a
	ld [wdcf3], a
	ld de, AirportCutscene1_ScrollRamp
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld c, a
	ldh a, [hSCX]
	sub c
	ldh [hSCX], a
	ret
.asm_4a4b
	ldh a, [hSCX]
	sub $08
	ldh [hSCX], a
	ret
Func_4e_4a52:
	ld a, [wdce8]
	ld de, AirportCutscene1_SpritePath
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4a7c
	ld b, a
	inc hl
	ld a, [hl]
	ld c, a
	ld a, [wcd42]
	add b
	ld [wcd42], a
	ld a, [wcd43]
	add c
	ld [wcd43], a
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	ret
.asm_4a7c
	ld a, $01
	ld [hFade], a
	ret
AirportCutscene1_SpritePath:
	dr $138a82, $138b53
Func_4e_4b53:
	ld a, [wcd45]
	and a
	ret z
	and $80
	jr nz, .asm_4b63
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	jr .asm_4b70
.asm_4b63
	ld a, [wcd45]
	and $7f
	ld [wcd45], a
	ld a, $00
	ld [wcd46], a
.asm_4b70
	ld a, [wcd45]
	ld de, AirportCutscene1_AnimPointers
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
	cp $ff
	jr nz, .asm_4b8f
	xor a
	ld [wcd46], a
	ret
.asm_4b8f
	ld [wcd44], a
	ld a, [wcd46]
	inc a
	ld [wcd46], a
	ret
AirportCutscene1_AnimPointers:
	dw AirportCutscene1_AnimFrames
	dw AirportCutscene1_AnimFrames_4ba1
	dw AirportCutscene1_AnimFrames_4ba1
AirportCutscene1_AnimFrames:
	dr $138ba0, $138ba1
AirportCutscene1_AnimFrames_4ba1:
	dr $138ba1, $138bde
Func_4e_4bde:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4be7
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4be7
	xor a
	ld [wd1fb], a
	call Func_4e_4bf6
	ret
Func_4e_4bf6:
	ld hl, AirportCutscene1_OAMPointers
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
	ld d, $c0
.asm_4c15
	ld a, [hli]
	cp $ff
	jr z, .asm_4c29
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
	jr .asm_4c15
.asm_4c29
	ld a, e
	ld [wd1fb], a
	ret
AirportCutscene1_OAMPointers:
	dw AirportCutscene1_OAMData
	dw AirportCutscene1_OAMData_4c4d
	dw AirportCutscene1_OAMData_4c9a
AirportCutscene1_OAMData:
	dr $138c34, $138c4d
AirportCutscene1_OAMData_4c4d:
	dr $138c4d, $138c9a
AirportCutscene1_OAMData_4c9a:
	dr $138c9a, $138ce3
Func_4e_4ce3:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_4ce9
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_4ce9
	ret
Func_4e_4cf1:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4cfa
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4cfa
	ret
; TODO: noise / likely compressed (not graphics)
unk_4e_4d02:
	dr $138d02, $139ff6
; TODO: data, not noise (not graphics)
unk_4e_5ff6:
	dr $139ff6, $13a377
AirportCutscene1_Palette:
	RGB 31, 31, 31
	RGB 22, 27, 31
	RGB 8, 17, 31
	RGB 0, 0, 25
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB 16, 16, 16
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
AirportCutscene1_ObjPalette:
	RGB 25, 25, 25
	RGB 0, 0, 1
	RGB 31, 18, 18
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
AirportCutscene1_Tilemap:
INCBIN "gfx/tilemaps/airportcutscene1_tilemap.tilemap"
AirportCutscene1_Attrmap:
INCBIN "gfx/attrmaps/airportcutscene1_attrmap.bin"
AirportCutscene1_GFX:
INCBIN "gfx/misc/airportcutscene1_gfx.2bpp"
AirportCutscene1_ObjGFX:
INCBIN "gfx/misc/airportcutscene1_objgfx.bin"

