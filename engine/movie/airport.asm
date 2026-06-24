AirportCutscene4::
	call Func_4e_4ce3
	ld a, BGM_AIRPORT
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
	ld a, BGM_AIRPORT
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
	db $ff, $00, $01, $00, $01, $00, $ff, $00, $fe, $ff, $02, $01, $02, $01, $fe, $ff
	db $fc, $fe, $04, $02, $04, $02, $fc, $fe, $fe, $00, $02, $00, $02, $00, $fe, $00
	db $fe, $fd, $02, $03, $02, $03, $fe, $fd, $00, $fe, $00, $02, $00, $02, $00, $fe
	db $ff, $fe, $01, $02, $01, $02, $ff, $fe, $ff, $00, $01, $00, $01, $00, $ff, $00
	db $fc, $fe, $04, $02, $04, $02, $fc, $fe, $00, $ff, $00, $01, $00, $01, $00, $ff
	db $fe, $ff, $02, $01, $02, $01, $fe, $ff, $88
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
	db $ff, $00, $01, $00, $01, $00, $ff, $00, $fe, $ff, $02, $01, $02, $01, $fe, $ff
	db $fc, $fe, $04, $02, $04, $02, $fc, $fe, $fe, $00, $02, $00, $02, $00, $fe, $00
	db $00, $ff, $00, $ff, $01, $ff, $01, $00, $01, $ff, $ff, $ff, $ff, $ff, $00, $ff
	db $01, $ff, $01, $00, $01, $00, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $01, $ff
	db $01, $00, $01, $00, $01, $00, $00, $ff, $00, $ff, $ff, $ff, $ff, $ff, $00, $ff
	db $01, $ff, $01, $00, $01, $00, $01, $00, $01, $00, $ff, $ff, $ff, $ff, $00, $ff
	db $ff, $ff, $01, $fe, $02, $ff, $02, $00, $00, $fe, $ff, $fe, $00, $fe, $02, $00
	db $02, $00, $ff, $fe, $00, $ff, $00, $fe, $02, $00, $ff, $fe, $fe, $fe, $02, $ff
	db $02, $00, $ff, $fe, $00, $fe, $04, $fe, $fd, $fc, $01, $fd, $03, $ff, $03, $ff
	db $fe, $fd, $88

AirportCutscene1::
	call Func_4e_4ce3
	ld a, BGM_AIRPORT
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
	ld a, GAMEMODE_AIRPORT_CUTSCENE2
	ld [wTargetMode], a
	jp JumpToGameMode
AirportCutscene1_ScrollRamp:
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $02, $02
	db $02, $02, $02, $03, $03, $03, $03, $04, $04, $04, $05, $05, $05, $06, $06, $07
	db $08
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
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fd, $00, $fd, $00, $fd, $ff, $fd
	db $ff, $fd, $00, $fd, $ff, $fd, $ff, $fd, $ff, $fd, $ff, $fd, $ff, $fd, $ff, $fd
	db $ff, $fd, $ff, $fd, $ff, $fd, $fe, $fd, $ff, $fd, $ff, $fd, $fe, $fd, $ff, $fd
	db $ff, $fd, $fe, $fd, $ff, $fd, $fe, $fd, $fe, $fd, $ff, $fd, $fe, $fd, $fe, $fd
	db $ff, $fd, $fd, $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fd, $fc, $fd, $fc, $fd, $fc
	db $fd, $fc, $fe, $fc, $fd, $fc, $fc, $fc, $fd, $fc, $fd, $fc, $fc, $fc, $fc, $fc
	db $88
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
	db $ff
AirportCutscene1_AnimFrames_4ba1:
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $ff
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
	ld [wVirtualOAMPtr], a
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
	ld a, [wVirtualOAMPtr]
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
	ld [wVirtualOAMPtr], a
	ret
AirportCutscene1_OAMPointers:
	dw AirportCutscene1_OAMData
	dw AirportCutscene1_OAMData_4c4d
	dw AirportCutscene1_OAMData_4c9a
AirportCutscene1_OAMData:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
AirportCutscene1_OAMData_4c4d:
	db $00, $08, $00, $00, $00, $10, $02, $00, $10, $00, $04, $00, $10, $08, $06, $00
	db $10, $10, $08, $00, $10, $18, $0a, $00, $10, $20, $0c, $00, $10, $28, $0e, $00
	db $10, $30, $10, $00, $10, $38, $12, $00, $10, $40, $14, $00, $20, $00, $16, $00
	db $20, $08, $18, $00, $20, $10, $1a, $00, $20, $18, $1c, $00, $20, $20, $1e, $00
	db $20, $28, $20, $00, $20, $30, $22, $00, $20, $38, $24, $00, $ff
AirportCutscene1_OAMData_4c9a:
	db $00, $00, $26, $00, $00, $08, $28, $00, $00, $10, $2a, $00, $00, $18, $2c, $00
	db $00, $20, $2e, $00, $10, $00, $30, $00, $10, $08, $32, $00, $10, $10, $34, $00
	db $10, $18, $36, $00, $10, $20, $38, $00, $10, $28, $3a, $00, $10, $30, $3c, $00
	db $10, $38, $3e, $00, $10, $40, $40, $00, $20, $18, $42, $00, $20, $20, $44, $00
	db $20, $28, $46, $00, $20, $30, $48, $00, $ff
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
