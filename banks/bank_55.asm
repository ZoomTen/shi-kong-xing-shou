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
	ld [wd1fb], a
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
	ld a, [wd1fb]
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
	ld [wd1fb], a
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
; TODO: unreferenced data block, classify type
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
; TODO: unreferenced data block, classify type
unk_055_4472:
	ds 8
Tilemap_055_447a:
INCBIN "gfx/tilemaps/tilemap_055_447a.tilemap"
Attrmap_055_46ba:
INCBIN "gfx/attrmaps/attrmap_055_46ba.bin"
GFX_055_48fa:
INCBIN "gfx/misc/gfx_055_48fa.bin"

; TODO: unclassified data table - identify via consumer
unk_055_4bad:
	dr $154bad, $154e6a
GFX_055_4e6a:
INCBIN "gfx/misc/gfx_055_4e6a.2bpp"

G4_32_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_055_5316
	objects_end

Script_055_5316:
	textface text_55_53ae
	end

Script_055_531a:
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_55_53ae
	checkbit wEventFlags + 4, $01, Script_055_532b
	scr_35 $05
	end

Script_055_532b:
	end

G4_31_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_055_5343
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_055_5347
	objects_end

Script_055_5343:
	stext text_55_5367
	end

Script_055_5347:
	stext text_55_537f
	end

Script_055_534b:
	face FACE_UP
	stext text_55_5367
	checkbit wEventFlags + 3, $03, Script_055_5358
	scr_37
	end

Script_055_5358:
	end

Script_055_5359:
	face FACE_UP
	stext text_55_537f
	checkbit wEventFlags + 3, $03, Script_055_5366
	townmusicanim
	end

Script_055_5366:
	end

INCLUDE "data/text/bank55_misc2.asm"

Script_055_53ef::
	end

Script_055_53f0:
	end

G4_01_ObjectEvents:
G4_02_ObjectEvents:
G4_03_ObjectEvents:
G4_04_ObjectEvents:
G4_05_ObjectEvents:
G4_0C_ObjectEvents2:
G4_0F_ObjectEvents:
G4_12_ObjectEvents2:
G4_30_ObjectEvents:
G4_42_ObjectEvents:
G4_43_ObjectEvents:
	objects_end

Script_055_53f2:
	setmap $44, $00
	end

G4_0B_ObjectEvents:
	object_event $19, 15,  6, 0, $00, $00, $08, $00, Script_055_5933
	object_event $1c,  4,  7, 0, $00, $00, $0b, $01, Script_055_5937
	object_event $1a, 11,  6, 0, $00, $00, $06, $02, Script_055_593b
	object_event $14,  5, 14, 0, $00, $00, $06, $03, Script_055_593f
	object_event $13, 21, 13, 0, $00, $00, $06, $04, Script_055_5943
	object_event $15,  3, 21, 0, $00, $00, $00, $00, Script_055_5947
	object_event $17,  9, 19, 0, $00, $00, $0b, $01, Script_055_594b
	object_event $16, 15, 21, 0, $00, $00, $0b, $02, Script_055_594f
	object_event $16, 11, 14, 0, $00, $00, $00, $00, Script_055_5953
	objects_end

; TODO: unreferenced data block, classify type
unk_055_545a:
	checkbit wEventFlags + 7, $03, Script_055_5464
	setmap $0c, $00
	end2
Script_055_5464:
	setmap $0c, $03
	end2
Script_055_5468:
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end
Script_055_5475:
	setmap $0c, $02
	end2
G4_0C_ObjectEvents:
	object_event $08,  8,  5, wEventFlags + 7, $02, $01, $00, $00, Script_055_54b3
	object_event $1f,  6,  5, 0, $00, $00, $00, $01, Script_055_5536
	object_event $1e,  6,  7, 0, $00, $00, $00, $02, Script_055_553a
	objects_end

ObjSprite_055_549b:
	object_event $60,  6,  8, 0, $00, $00, $00, $03, Script_055_53f0
	objects_end

ObjSprite_055_54a7:
	object_event $60,  6,  7, 0, $00, $00, $00, $04, Script_055_53f0
	objects_end

Script_055_54b3:
	ifcharindex $00, Script_055_54c1
	emote $02, $04
	delay $03, $20
	textface text_55_645b
	end

Script_055_54c1:
	walkpath
	face FACE_UP
	stext text_55_6326
	stext text_55_6364
	emote $02, $04
	delay $03, $20
	stext text_55_63b0
	loadobjsprite ObjSprite_055_549b
	delay $03, $10
	loadobjsprite ObjSprite_055_54a7
	clearobject $04
	spriteface  5, FACE_UP
	spriteface  6, FACE_LEFT
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  2, FACE_DOWN
	face FACE_DOWN
	emote $00, $00
	emote $02, $00
	emote $03, $00
	delay $03, $20
	stext text_55_6408
	move MovementData_OneDown
	setattach $06, $05, $f0, $00
	objmove $05, MovementData_055_7c94
	clearobject $05
	clearobject $06
	emote $00, $00
	delay $03, $20
	stext text_55_6452
	face $05
	objmove $00, MovementData_055_7e6b
	clearobject $00
	stext text_55_645b
	setbit wEventFlags + 7, $03
	setmappredef MAPPREDEF_14
	warpmode GAMEMODE_UNDERWATER_PICTURE_CUTSCENE, $12, $01
	emote $00, $00
	delay $03, $20
	stext text_55_6489
	end

Script_055_5536:
	textface text_55_62ff
	end

Script_055_553a:
	textface text_55_62c8
	end

G4_0D_ObjectEvents:
	object_event $53, 16,  4, 0, $00, $00, $0a, $00, Script_055_5957
	object_event $54,  9,  2, 0, $00, $00, $06, $01, Script_055_5968
	object_event $53,  2,  6, 0, $00, $00, $00, $02, Script_055_5979
	object_event $55,  7, 17, 0, $00, $00, $0b, $03, Script_055_598a
	object_event $54,  9, 11, 0, $00, $00, $09, $04, Script_055_59a5
	object_event $55,  6,  8, wEventFlags + 8, $02, $00, $00, $00, Script_055_59f7
	object_event $55,  5,  8, wEventFlags + 8, $02, $01, $00, $00, Script_055_5a03
	object_event $53, 16, 15, 0, $00, $00, $00, $01, Script_055_59c0
	objects_end

G4_12_ObjectEvents:
	object_event $55,  4,  3, 0, $00, $00, $0b, $00, Script_055_5a0f
	objects_end

G4_11_ObjectEvents:
	object_event $4a,  4,  4, wEventFlags + 8, $03, $00, $00, $00, Script_055_55af
	objects_end

Script_055_55af:
	ifcharindex $00, Script_055_55bd
	emote $02, $03
	delay $03, $20
	textface text_55_68c8
	end

Script_055_55bd:
	spriteface  2, FACE_DOWN
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_55_6894
	emote $00, $03
	delay $03, $20
	stext text_55_68d1
	stext text_55_68f6
	emote $00, $03
	delay $03, $20
	stext text_55_6931
	stext text_55_693d
	emote $02, $00
	delay $03, $20
	stext text_55_697d
	stext text_55_6997
	face FACE_RIGHT
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_LEFT
	stext text_55_69a5
	stext text_55_69eb
	stext text_55_6a12
	stext text_55_6a3e
	stext text_55_6a75
	stext text_55_6b37
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_055_7c94
	clearobject $02
	setbit wEventFlags + 8, $03
	end

G4_0E_ObjectEvents:
	object_event $61,  2,  2, wEventFlags + 8, $04, $00, $00, $00, Script_055_53f0
	object_event $61,  3,  2, wEventFlags + 8, $04, $00, $00, $01, Script_055_53f0
	objects_end

G4_0E_ObjectEvents2:
	object_event $61,  2,  2, wEventFlags + 8, $04, $00, $00, $00, Script_055_53f0
	object_event $61,  3,  2, wEventFlags + 8, $04, $00, $00, $01, Script_055_53f0
	object_event $4a,  2,  3, wEventFlags + 8, $04, $00, $00, $02, Script_055_5666
	objects_end

; TODO: unreferenced data block, classify type
unk_055_5658:
	checkbit wEventFlags + 8, $03, Script_055_5662
	setmap $0e, $01
	end
Script_055_5662:
	setmap $0e, $03
	end
Script_055_5666:
	spriteface  2, FACE_RIGHT
	stext text_55_6b4c
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	clearobject $03
	face FACE_UP
	spriteface  1, FACE_UP
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	clearobject $04
	spriteface  2, FACE_DOWN
	stext text_55_6b89
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	setattach $01, $00, $10, $00
	objmove $00, MovementData_055_7c53
	clearattach $01
	setmap $0f, $02
	spriteface  2, FACE_UP
	emote $02, $03
	delay $03, $20
	stext text_55_6ba9
	spriteface  2, FACE_RIGHT
	face FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_UP
	emote $02, $00
	delay $03, $20
	stext text_55_6bce
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	setbit wEventFlags + 8, $04
	end

G4_0F_ObjectEvents2:
	object_event $4a,  6,  4, wEventFlags + 8, $04, $00, $00, $00, Script_055_53f0
	objects_end

G4_05_ObjectEvents2:
	object_event $4a,  5,  7, 0, $00, $00, $00, $00, Script_055_53f0
	object_event $1e,  6,  3, 0, $00, $00, $00, $01, Script_055_53f0
	object_event $4c,  6,  6, 0, $00, $00, $00, $02, Script_055_53f0
	objects_end
; $155704

ObjSprite_055_5704:
	object_event $48,  6,  3, 0, $00, $00, $00, $00, Script_055_53f0
	objects_end

ObjSprite_055_5710:
	object_event $56,  6,  0, 0, $00, $00, $00, $00, Script_055_53f0
	objects_end
Script_055_571c:
	end

Script_055_571d:
	setmap $05, $00
	end

Script_055_5721:
	checkbit wEventFlags + 8, $05, Script_055_571d
	setplayerchar $00
	setmap $05, $01
	spriteface  3, $04
	spriteface  2, FACE_UP
	emote $02, $00
	delay $03, $20
	stext text_55_6bec
	stext text_55_6c08
	emote $00, $04
	delay $03, $20
	stext text_55_6c84
	stext text_55_6c9b
	emote $02, $00
	emote $00, $00
	delay $03, $20
	stext text_55_6ccc
	stext text_55_6d04
	emote $02, $00
	delay $03, $20
	spritewalk  2, MOVE_UP
	spriteface  2, FACE_RIGHT
	spriteface  4, FACE_LEFT
	stext text_55_6d54
	stext text_55_6d9e
	spriteface  4, FACE_UP
	spriteface  2, FACE_UP
	objmove $02, MovementData_055_7df6
	clearobject $02
	emote $00, $00
	delay $03, $20
	spriteface  4, FACE_DOWN
	stext text_55_6da7
	move MovementData_OneUp
	spritewalk  1, MOVE_UP
	emote $00, $04
	delay $03, $20
	stext text_55_6e1f
	stext text_55_6e29
	startbattle BattleData_02d_4bad
	checkbit wEventFlags + 3, $03, Script_055_5823
	clearobject $04
	spriteface  3, $05
	objmove $03, MovementData_055_7d7f
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	face FACE_LEFT
	stext text_55_6e53
	clearplayerpos
	spritewalk  3, MOVE_RIGHT
	clearobject $03
	face FACE_UP
	stext text_55_6eb9
	loadobjsprite ObjSprite_055_5704
	objmove $02, MovementData_055_7f17
	clearobject $02
	loadobjsprite ObjSprite_055_5704
	objmove $02, MovementData_055_7f40
	clearobject $02
	loadobjsprite ObjSprite_055_5704
	objmove $02, MovementData_055_7f6d
	clearobject $02
	loadobjsprite ObjSprite_055_5710
	objmove $02, MovementData_055_7c94
	emote $00, $00
	delay $03, $20
	stext text_55_6ed6
	objmove $02, MovementData_055_7d36
	clearobject $02
	stext text_55_6f0b
	scr_48 $02, $0f
	setbit wEventFlags + 8, $05
	warpmode GAMEMODE_METEOR_CUTSCENE2, $24, $01
	spriteface  3, FACE_UP
	stext text_55_6f21
	emote $02, $04
	delay $03, $20
	stext text_55_6f4e
	stext text_55_6fa0
	spriteface  3, FACE_DOWN
	objmove $03, MovementData_055_7cd5
	clearobject $03
	face FACE_DOWN
	setmap $0f, $01
	end

Script_055_5823:
	face FACE_DOWN
	setmap $04, $00
	end

G4_24_ObjectEvents2:
	object_event $4d,  6,  4, 0, $00, $00, $00, $00, Script_055_53f0
	object_event $62,  6,  5, 0, $00, $00, $00, $01, Script_055_53f0
	objects_end

G4_13_ObjectEvents:
	object_event $54,  2,  4, 0, $00, $00, $00, $00, Script_055_587c
	object_event $55,  9,  4, 0, $00, $00, $00, $01, Script_055_58aa
	object_event $53,  7,  2, 0, $00, $00, $00, $02, Script_055_58bf
	objects_end

Script_055_5862:
	ifcharindex $03, Script_055_586f
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_55_64e9
	end

Script_055_586f:
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_55_67b7
	farjump Script_055_5887
	end

Script_055_587c:
	ifcharindex $03, Script_055_5884
	textface text_55_64e9
	end

Script_055_5884:
	textface text_55_67b7

Script_055_5887:
	checkbit wEventFlags + 3, $03, Script_055_588f
	scr_37
	end

Script_055_588f:
	end

Script_055_5890:
	ifcharindex $03, Script_055_589d
	face FACE_RIGHT
	spriteface  3, FACE_LEFT
	stext text_55_64f1
	end

Script_055_589d:
	face FACE_RIGHT
	spriteface  3, FACE_LEFT
	stext text_55_683c
	farjump Script_055_58b5
	end

Script_055_58aa:
	ifcharindex $03, Script_055_58b2
	textface text_55_64f1
	end

Script_055_58b2:
	textface text_55_683c

Script_055_58b5:
	checkbit wEventFlags + 4, $01, Script_055_58be
	scr_35 $06
	end

Script_055_58be:
	end

Script_055_58bf:
	textface text_55_53c5
	checkbit wEventFlags + 3, $03, Script_055_58ca
	townmusicanim
	end

Script_055_58ca:
	end

G4_2C_ObjectEvents:
	object_event $18,  5,  5, 0, $00, $00, $00, $00, Script_055_5a1b
	object_event $1d,  8,  5, 0, $00, $00, $00, $01, Script_055_5a4c
	objects_end

G4_2D_ObjectEvents:
	object_event $1f,  3,  3, 0, $00, $00, $00, $00, Script_055_5a50
	object_event $1e,  5,  5, 0, $00, $00, $06, $01, Script_055_5a54
	objects_end

G4_2E_ObjectEvents:
	object_event $16,  3,  4, 0, $00, $00, $00, $00, Script_055_5a6d
	object_event $19,  8,  3, 0, $00, $00, $06, $01, Script_055_5a71
	objects_end

G4_2F_ObjectEvents:
	object_event $1b,  4,  5, 0, $00, $00, $06, $00, Script_055_5a75
	objects_end

G4_33_ObjectEvents:
	object_event $08,  4,  4, wEventFlags + 7, $02, $00, $00, $00, Script_055_5a79
	object_event $4b,  6,  3, 0, $00, $00, $00, $01, Script_055_5a7d
	objects_end

Script_055_5933:
	textface text_55_5b1f
	end

Script_055_5937:
	textface text_55_5b52
	end

Script_055_593b:
	textface text_55_5ba0
	end

Script_055_593f:
	textface text_55_5be3
	end

Script_055_5943:
	textface text_55_5c28
	end

Script_055_5947:
	textface text_55_5c6f
	end

Script_055_594b:
	textface text_55_5cbb
	end

Script_055_594f:
	textface text_55_5d0a
	end

Script_055_5953:
	textface text_55_5fc7
	end

Script_055_5957:
	ifcharindex $03, Script_055_595f
	textface text_55_64aa
	end

Script_055_595f:
	textface text_55_64f9
	setbit wEventFlags + 7, $04
	countflags7
	end

Script_055_5968:
	ifcharindex $03, Script_055_5970
	textface text_55_64b2
	end

Script_055_5970:
	textface text_55_650e
	setbit wEventFlags + 7, $05
	countflags7
	end

Script_055_5979:
	ifcharindex $03, Script_055_5981
	textface text_55_64ba
	end

Script_055_5981:
	textface text_55_653d
	setbit wEventFlags + 7, $06
	countflags7
	end

Script_055_598a:
	ifcharindex $03, Script_055_5992
	textface text_55_64c2
	end

Script_055_5992:
	checkbit wEventFlags + 8, $05, Script_055_59a1
	textface text_55_65c6
	setbit wEventFlags + 7, $07
	countflags7
	end

Script_055_59a1:
	textface text_55_6fab
	end

Script_055_59a5:
	ifcharindex $03, Script_055_59ad
	textface text_55_64ca
	end

Script_055_59ad:
	checkbit wEventFlags + 8, $05, Script_055_59bc
	textface text_55_6630
	setbit wEventFlags + 8, $00
	countflags7
	end

Script_055_59bc:
	textface text_55_6fda
	end

Script_055_59c0:
	ifcharindex $03, Script_055_59c8
	textface text_55_64da
	end

Script_055_59c8:
	checkbit wEventFlags + 8, $05, Script_055_59d7
	textface text_55_6684
	setbit wEventFlags + 8, $01
	countflags7
	end

Script_055_59d7:
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_55_7043
	emote $00, $04
	delay $03, $20
	stext text_55_70ad
	stext text_55_70ee
	stext text_55_7109
	face FACE_DOWN
	farjump2 Script_05c_4135
	end

Script_055_59f7:
	ifcharindex $03, Script_055_59ff
	textface text_55_64d2
	end

Script_055_59ff:
	textface text_55_6704
	end

Script_055_5a03:
	ifcharindex $03, Script_055_5a0b
	textface text_55_64d2
	end

Script_055_5a0b:
	textface text_55_672a
	end

Script_055_5a0f:
	ifcharindex $03, Script_055_5a17
	textface text_55_64e1
	end

Script_055_5a17:
	textface text_55_673a
	end

Script_055_5a1b:
	textface text_55_5d57
	spriteface  3, FACE_LEFT
	stext text_55_5da9
	spriteface  2, FACE_RIGHT
	emote $02, $03
	delay $03, $20
	stext text_55_5dc7
	emote $03, $00
	delay $03, $20
	stext text_55_5dd7
	stext text_55_5e09
	emote $03, $04
	delay $03, $20
	stext text_55_5e3e
	emote $00, $01
	delay $03, $20
	end

Script_055_5a4c:
	textface text_55_5da9
	end

Script_055_5a50:
	textface text_55_5e56
	end

Script_055_5a54:
	textface text_55_5e96
	spriteface  2, FACE_DOWN
	stext text_55_5edc
	emote $03, $00
	delay $03, $20
	stext text_55_5efc
	emote $00, $01
	delay $03, $20
	end

Script_055_5a6d:
	textface text_55_5f11
	end

Script_055_5a71:
	textface text_55_5f65
	end

Script_055_5a75:
	textface text_55_5f91
	end

Script_055_5a79:
	textface text_55_5fe4
	end

Script_055_5a7d:
	checkbit wEventFlags + 7, $02, Script_055_5aeb
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_55_6073
	emote $03, $00
	delay $03, $20
	spriteface  3, FACE_LEFT
	delay $03, $10
	spriteface  3, FACE_RIGHT
	delay $03, $10
	spriteface  3, FACE_DOWN
	stext text_55_6122
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_UP
	stext text_55_6144
	face FACE_LEFT
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_DOWN
	stext text_55_6168
	emote $02, $04
	delay $03, $20
	stext text_55_6193
	emote $03, $03
	delay $03, $20
	stext text_55_61c5
	stext text_55_61ce
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_055_7c94
	clearobject $02
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	stext text_55_61e2
	setbit wEventFlags + 7, $02
	end

Script_055_5aeb:
	textface text_55_6288
	end

INCLUDE "data/text/bank55_misc.asm"

MovementData_055_7c53:
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $88

MovementData_055_7c94:
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $88

MovementData_055_7cd5:
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $88

MovementData_055_7d36:
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $02, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $88

MovementData_055_7d7f:
	db $ff, $00, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00
	db $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $ff
	db $ff, $00, $ff, $ff, $ff, $00, $ff, $ff, $ff, $00, $ff, $ff, $ff, $ff, $00, $ff
	db $00, $ff, $01, $ff, $01, $ff, $01, $ff, $01, $00, $01, $ff, $01, $00, $01, $00
	db $01, $ff, $01, $00, $01, $00, $01, $00, $01, $00, $01, $ff, $02, $00, $02, $00
	db $02, $ff, $02, $00, $02, $00, $02, $00, $02, $ff, $02, $00, $04, $00, $04, $ff
	db $04, $00, $04, $00, $04, $00, $04, $ff, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $88

MovementData_055_7df6:
	db $ff, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $01
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $01
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $01
	db $fe, $00
	db $fe, $00
	db $fe, $00
	db $fe, $01
	db $fe, $00
	db $fe, $00
	db $fe, $01
	db $ff, $00
	db $ff, $00
	db $ff, $01
	db $ff, $00
	db $ff, $00
	db $ff, $00
	db $ff, $01
	db $ff, $00
	db $ff, $01
	db $ff, $00
	db $ff, $01
	db $ff, $00
	db $ff, $01
	db $00, $01
	db $00, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $01
	db $03, $01
	db $03, $01
	db $03, $01
	db $04, $01
	db $04, $01
	db $04, $01
	db $88

MovementData_055_7e6b:
	db $ff, $ff
	db $fe, $ff
	db $fe, $ff
	db $fe, $00
	db $fe, $ff
	db $fe, $ff
	db $fe, $ff
	db $fe, $ff
	db $ff, $ff
	db $ff, $ff
	db $ff, $ff
	db $ff, $ff
	db $00, $ff
	db $00, $ff
	db $00, $ff
	db $01, $ff
	db $01, $ff
	db $01, $ff
	db $01, $00
	db $01, $ff
	db $02, $00
	db $02, $ff
	db $02, $00
	db $02, $ff
	db $02, $00
	db $02, $ff
	db $02, $00
	db $02, $00
	db $04, $ff
	db $04, $00
	db $04, $ff
	db $04, $00
	db $04, $00
	db $04, $00
	db $88, $ff
	db $00, $fe
	db $00, $fe
	db $00, $fe
	db $00, $fe
	db $00, $fe
	db $00, $fe
	db $01, $fe
	db $00, $fe
	db $00, $fe
	db $00, $fe
	db $01, $fe
	db $00, $fe
	db $00, $fe
	db $01, $fe
	db $00, $fe
	db $01, $fe
	db $00, $fe
	db $00, $fe
	db $01, $fe
	db $01, $fe
	db $00, $fe
	db $01, $fe
	db $00, $fe
	db $01, $fe
	db $01, $fe
	db $01, $fe
	db $01, $fe
	db $02, $ff
	db $01, $ff
	db $00, $ff
	db $01, $ff
	db $01, $ff
	db $01, $00
	db $01, $ff
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $00
	db $01, $01
	db $01, $00
	db $01, $00
	db $01, $01
	db $01, $01
	db $01, $01
	db $01, $00
	db $01, $03
	db $03, $03
	db $02, $03
	db $02, $03
	db $03, $03
	db $01, $88

MovementData_055_7f17:
	db $ff, $ff
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $fc, $fc
	db $88

MovementData_055_7f40:
	db $ff, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $fc, $00
	db $88

MovementData_055_7f6d:
	db $ff, $01, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04
	db $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04
	db $fc, $04, $fc, $04, $fd, $04, $fc, $04, $88, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00

