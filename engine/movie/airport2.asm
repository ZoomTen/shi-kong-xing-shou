AirportCutscene2::
	call Func_055_43cb
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
	ld de, Tilemap_055_447a
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, Attrmap_055_46ba
	ld bc, $2012
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $20
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, Palette_055_43ea
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, Palette_055_4432
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_055_48fa
	ld de, $9000
	ld bc, $0570
	call CopyBytesVRAM
	ld hl, GFX_055_4e6a
	ld de, $8000
	ld bc, $04A0
	call CopyBytesVRAM
	call Func_055_43d9
	ld a, $F0
	ld [wcd42], a
	ld a, $B8
	ld [wcd43], a
	ld a, $02
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
.asm_40a6
	call DelayFrame
	call Func_055_42c6
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_40c2
	call Func_055_423b
	call Func_055_411c
	call Func_055_40f1
	jp .asm_40a6
.asm_40c2
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, $05
	ld [hMapPredef], a
	jp JumpToModeAndSetMapPredefs
ScrollXDeltas_055_40d0:
	db $07, $07, $07, $07, $07, $07, $07, $07, $06, $06, $06, $06, $06, $06, $05, $05
	db $05, $05, $05, $04, $04, $04, $04, $03, $03, $03, $02, $02, $02, $01, $01, $00
	db $00
Func_055_40f1:
	ld a, [wdcf3]
	cp $40
	jr c, .asm_4111
	ld a, [wdcf4]
	cp $20
	ret nc
	inc a
	ld [wdcf4], a
	ld de, ScrollXDeltas_055_40d0
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld c, a
	ldh a, [hSCX]
	add c
	ldh [hSCX], a
	ret
.asm_4111
	inc a
	ld [wdcf3], a
	ldh a, [hSCX]
	add $08
	ldh [hSCX], a
	ret
Func_055_411c:
	ld a, [wdce8]
	ld de, ObjectMoveDeltas_055_414c
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4146
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
.asm_4146
	ld a, $01
	ld [hFade], a
	ret
ObjectMoveDeltas_055_414c:
	db $01, $00, $04, $03, $04, $04, $04, $03, $04, $04, $04, $03, $04, $04, $04, $04
	db $04, $04, $04, $04, $03, $03, $03, $03, $03, $03, $02, $03, $03, $03, $01, $02
	db $03, $03, $02, $03, $03, $03, $02, $03, $02, $03, $02, $03, $03, $03, $02, $03
	db $02, $03, $02, $03, $02, $03, $02, $03, $02, $03, $01, $02, $01, $02, $01, $02
	db $01, $02, $02, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02
	db $01, $02, $01, $02, $01, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $88
Func_055_423b:
	ld a, [wcd45]
	and a
	ret z
	and $80
	jr nz, .asm_424b
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	jr .asm_4258
.asm_424b
	ld a, [wcd45]
	and $7F
	ld [wcd45], a
	ld a, $00
	ld [wcd46], a
.asm_4258
	ld a, [wcd45]
	ld de, ColorAnimPointers_055_4282
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
	jr nz, .asm_4277
	xor a
	ld [wcd46], a
	ret
.asm_4277
	ld [wcd44], a
	ld a, [wcd46]
	inc a
	ld [wcd46], a
	ret
ColorAnimPointers_055_4282:
	dw ColorAnimData_055_4288
	dw ColorAnimData_055_4288_4289
	dw ColorAnimData_055_4288_4289
ColorAnimData_055_4288:
	db $ff
ColorAnimData_055_4288_4289:
	db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $ff
Func_055_42c6:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_42cf
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_42cf
	xor a
	ld [wVirtualOAMPtr], a
	call .asm_42de
	ret
.asm_42de
	ld hl, SpriteFramePointers_055_4316
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
.asm_42fd
	ld a, [hli]
	cp $FF
	jr z, .asm_4311
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
	jr .asm_42fd
.asm_4311
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
SpriteFramePointers_055_4316:
	dw SpriteFrameData_055_431c
	dw SpriteFrameData_055_431c_4335
	dw SpriteFrameData_055_431c_4382
SpriteFrameData_055_431c:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
SpriteFrameData_055_431c_4335:
	db $00, $30, $00, $00, $00, $38, $02, $00, $10, $00, $04, $00, $10, $08, $06, $00
	db $10, $10, $08, $00, $10, $18, $0a, $00, $10, $20, $0c, $00, $10, $28, $0e, $00
	db $10, $30, $10, $00, $10, $38, $12, $00, $10, $40, $14, $00, $20, $08, $16, $00
	db $20, $10, $18, $00, $20, $18, $1a, $00, $20, $20, $1c, $00, $20, $28, $1e, $00
	db $20, $30, $20, $00, $20, $38, $22, $00, $20, $40, $24, $00, $ff
SpriteFrameData_055_431c_4382:
	db $00, $20, $26, $00, $00, $28, $28, $00, $00, $30, $2a, $00, $00, $38, $2c, $00
	db $00, $40, $2e, $00, $10, $00, $30, $00, $10, $08, $32, $00, $10, $10, $34, $00
	db $10, $18, $36, $00, $10, $20, $38, $00, $10, $28, $3a, $00, $10, $30, $3c, $00
	db $10, $38, $3e, $00, $10, $40, $40, $00, $20, $10, $42, $00, $20, $18, $44, $00
	db $20, $20, $46, $00, $20, $28, $48, $00, $ff
Func_055_43cb:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_43d1
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_43d1
	ret
Func_055_43d9:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_43e2
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_43e2
	ret
Palette_055_43ea:
	RGB 31, 31, 31
	RGB 20, 15, 28
	RGB 31, 16, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 11, 11, 11
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_055_442a:
	ds 8
Palette_055_4432:
	RGB 17, 17, 17
	RGB 0, 0, 0
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
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_055_4472:
	ds 8
Tilemap_055_447a:
INCBIN "gfx/tilemaps/tilemap_055_447a.tilemap"
Attrmap_055_46ba:
INCBIN "gfx/attrmaps/attrmap_055_46ba.bin"
GFX_055_48fa:
INCBIN "gfx/misc/gfx_055_48fa.bin"
GFX_055_4e6a:
INCBIN "gfx/misc/gfx_055_4e6a.2bpp"
