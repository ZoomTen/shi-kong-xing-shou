unk_05c_4000:
	setmap $06, $00
	end2

Script_05c_4004:
	checkbit wEventFlags + 9, $02, Script_05c_4015
	checkbit wEventFlags + 8, $05, Script_05c_4015
	farjump2 Script_055_5475
	end

Script_05c_4015:
	setmap $44, $02
	end2

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_65_ObjectEvents:
	dr $170019, $170061

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_4C_ObjectEvents:
	dr $170061, $170083

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_4B_ObjectEvents:
	dr $170083, $17011c
Script_05c_411c::
	end

G4_06_ObjectEvents:
G4_07_ObjectEvents:
G4_08_ObjectEvents:
G4_09_ObjectEvents:
G4_0A_ObjectEvents:
G4_10_ObjectEvents:
G4_44_ObjectEvents:
G4_4A_ObjectEvents:
G4_64_ObjectEvents:
	objects_end

G4_44_ObjectEvents2:
	object_event $1e, 11,  6, wEventFlags + 23, $04, $00, $00, $00, Script_05c_411c
	object_event $53, 12,  7, wEventFlags + 23, $04, $00, $00, $01, Script_05c_411c
	objects_end
Script_05c_4135:: ; farjump2 target (bank_55)
	setmap $44, $03
	spriteface  3, FACE_UP
	stext text_5c_458c
	spriteface  3, FACE_DOWN
	objmove $03, unk_05c_51fa
	clearobject $03
	face FACE_LEFT
	spriteface  2, FACE_LEFT
	stext text_5c_45b8
	objmove $02, MovementData_05c_5084
	clearobject $02
	setmappredef MAPPREDEF_15
	setbit wEventFlags + 23, $04
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_45_ObjectEvents:
	dr $17015c, $1701a5

G4_4E_ObjectEvents2:
	object_event $65,  5,  3, 0, $00, $00, $00, $00, Script_05c_411c
	objects_end

G4_4E_ObjectEvents:
	object_event $65,  5,  3, 0, $00, $00, $00, $00, Script_05c_411c
	object_event $16,  5,  6, 0, $00, $00, $00, $01, Script_05c_41c8
	objects_end
Script_05c_41c8:
	textface text_5c_47fc
	checkbit wEventFlags + 8, $06, Script_05c_41d2
	end
Script_05c_41d2:
	spriteface  3, FACE_UP
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_485a
	stext text_5c_486f
	loadobjsprite ObjSprite_5c_4205
	objmove $04, MovementData_05c_5106
	spriteface  4, FACE_UP
	stext text_5c_4889
	stext text_5c_48a2
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_48c2
	objmove $04, MovementData_05c_51a8
	clearobject $04
	setbit wEventFlags + 9, $01
	end
ObjSprite_5c_4205::
	object_event $56,  5,  8, 0, $00, $00, $00, $02, Script_05c_411c
	objects_end
Script_05c_4211:
	textface text_5c_4ddb
	end
Script_05c_4215:
	ifcharindex $00, Script_05c_421d
	textface text_5c_4dcc
	end
Script_05c_421d:
	checkbit wEventFlags + 9, $00, Script_05c_4231
	textface text_5c_4d57
	stext text_5c_4d90
	scr_48 $00, $11
	setbit wEventFlags + 9, $00
	end
Script_05c_4231:
	textface text_5c_4da1
	end
Script_05c_4235:
	textface text_5c_4ce1
	ifcharindex $04, Script_05c_423d
	end
Script_05c_423d:
	stext text_5c_4d27
	end
Script_05c_4241:
	textface text_5c_4c5e
	ifcharindex $04, Script_05c_4249
	end
Script_05c_4249:
	stext text_5c_4ca6
	stext text_5c_4cd1
	end
Script_05c_4250:
	textface text_5c_4c42
	end

G4_46_ObjectEvents:
	object_event $18,  5,  5, 0, $00, $00, $00, $00, Script_05c_426b
	object_event $1d,  8,  5, 0, $00, $00, $00, $01, Script_05c_4277
	objects_end
Script_05c_426b:
	textface text_5c_4e2b
	ifcharindex $04, Script_05c_4273
	end
Script_05c_4273:
	stext text_5c_4e60
	end
Script_05c_4277:
	textface text_5c_4e68
	ifcharindex $04, Script_05c_427f
	end
Script_05c_427f:
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_4ea2
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_47_ObjectEvents:
	dr $170289, $1702de

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_48_ObjectEvents:
	dr $1702de, $1702fd

G4_49_ObjectEvents:
	object_event $1b,  4,  5, 0, $00, $00, $06, $00, Script_05c_4309
	objects_end

Script_05c_4309:
	textface text_5c_5035
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_4D_ObjectEvents:
	dr $17030d, $17035f

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_0A_ObjectEvents2:
	dr $17035f, $170494

G4_4D_ObjectEvents2:
	object_event $08,  9,  6, wEventFlags + 9, $03, $00, $00, $00, Script_05c_411c
	object_event $09, 10,  6, wEventFlags + 9, $03, $00, $00, $01, Script_05c_411c
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_4E_ObjectEvents3:
	dr $1704ab, $17058c
INCLUDE "data/text/bank5c_458c.asm"
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
	dr $171053, $171084
MovementData_05c_5084::
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $88, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $88
MovementData_05c_5106::
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00
	db $88, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe
	db $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $88
MovementData_05c_51a8::
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $88
unk_05c_51fa::
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $88, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $88, $ff, $00, $fe, $00, $fe
	db $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe
	db $ff, $fe, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $ff, $ff
	db $00, $ff, $ff, $ff, $00, $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $01, $ff, $01
	db $ff, $01, $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01, $ff, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $ff, $02, $00, $02, $00, $02, $ff, $02, $00, $02
	db $00, $02, $00, $02, $ff, $02, $00, $04, $00, $04, $ff, $04, $00, $04, $00, $04
	db $00, $04, $ff, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $88, $ff, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00
	db $fe, $00, $fe, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $ff, $00, $ff, $00
	db $ff, $01, $ff, $00, $ff, $01, $ff, $00, $ff, $01, $ff, $00, $ff, $01, $00, $01
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $01, $03, $01, $03, $01
	db $04, $01, $04, $01, $04, $01, $88, $ff, $ff, $fe, $ff, $fe, $ff, $fe, $00, $fe
	db $ff, $fe, $ff, $fe, $ff, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00
	db $ff, $00, $ff, $00, $ff, $01, $ff, $01, $ff, $01, $ff, $01, $00, $01, $ff, $02
	db $00, $02, $ff, $02, $00, $02, $ff, $02, $00, $02, $ff, $02, $00, $02, $00, $04
	db $ff, $04, $00, $04, $ff, $04, $00, $04, $00, $04, $00, $88, $ff, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00, $fe, $00
	db $fe, $01, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $01, $fe, $00, $fe, $00
	db $fe, $01, $fe, $01, $fe, $00, $fe, $01, $fe, $00, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $02, $ff, $01, $ff, $00, $ff, $01, $ff, $01, $ff, $01, $00, $01
	db $ff, $01, $00, $01, $00, $01, $00, $01, $00, $01, $01, $01, $00, $01, $00, $01
	db $01, $01, $01, $01, $01, $01, $00, $01, $03, $03, $03, $02, $03, $02, $03, $03
	db $03, $01, $88, $ff, $ff, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $88, $ff, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88, $ff, $01, $fc, $04, $fc, $04, $fd
	db $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc
	db $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc
	db $04, $88, $ff, $00, $fe, $01, $fe, $01, $fe, $00, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $02, $fe, $01, $fe, $02, $ff, $01
	db $ff, $01, $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $01, $01, $00, $01, $01, $01, $01, $01
	db $00, $01, $01, $01, $01, $01, $01, $01, $03, $03, $03, $02, $03, $01, $03, $02
	db $03, $01, $03, $01, $03, $02, $04, $01, $00, $00, $88, $ff, $01, $fe, $02, $fe
	db $02, $fe, $01, $fe, $01, $fe, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $ff, $fd, $ff, $fd, $fe, $fd, $fe, $fd, $fd, $fc, $fc, $fd, $fc, $fd, $fc, $fe
	db $fd, $00, $00, $88, $ff, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff
	db $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $fe, $fe, $ff, $fe, $fe, $fe, $fe
	db $fe, $fe, $00, $ff, $ff, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff
	db $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $fd, $01, $fd, $02, $fd
	db $02, $fc, $02, $fc, $03, $fc, $04, $fc, $01, $fe, $00, $00, $88

Func_05c_55e7::
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
	ld de, Tilemap_5c
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, Attrmap_5c
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, BGPals_5c
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, GFX_5c
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	call Func_05c_5705
	call Func_05c_5740
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_5653
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_5671
	ld a, [wdcf5]
	and a
	jr z, .asm_567a
	cp $01
	jr z, .asm_5680
	cp $02
	jr z, .asm_5686
	jp .asm_5653
.asm_5671
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_567a
	call .asm_568c
	jp .asm_5653
.asm_5680
	call .asm_56b5
	jp .asm_5653
.asm_5686
	call .asm_56a0
	jp .asm_5653
.asm_568c
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $A0
	ret nz
	xor a
	ld [wdcf3], a
	ld a, $01
	ld [wdcf5], a
	ret
.asm_56a0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $20
	ret nz
	xor a
	ld [wdcf4], a
	ld [wdcf5], a
	call Func_05c_5713
	ret
.asm_56b5
	call Func_05c_5726
	ld a, [wdcfb]
	ld de, StripTilemapPointers_5c
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $98E0
	ld bc, $1402
	ld a, $02
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcfb]
	inc a
	ld [wdcfb], a
	cp $08
	jr z, .asm_56ea
	ld a, $02
	ld [wdcf5], a
	ret
.asm_56ea
	ld c, $0C
	call Func_05c_5739
	ld a, $01
	ld [hFade], a
	ret
StripTilemapPointers_5c:
INCBIN "gfx/tilemaps/striptilemappointers_5c.tilemap"
Func_05c_5705:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_570b
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_570b
	ret

Func_05c_5713:
	ld hl, BGPals_5c
	call CopyBackgroundPalettes
	ld hl, BGPals_5c
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

Func_05c_5726:
	ld hl, BGPalsBlack_5c
	call CopyBackgroundPalettes
	ld hl, BGPalsBlack_5c
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret

Func_05c_5739:
	call DelayFrame
	dec c
	jr nz, Func_05c_5739
	ret

Func_05c_5740:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_5749
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_5749
	ret
BGPalsBlack_5c:
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
BGPals_5c:
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 0, 23
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
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
unk_5c_57d1:
	ds 8
Attrmap_5c:
INCBIN "gfx/attrmaps/attrmap_5c.bin"
Tilemap_5c:
INCBIN "gfx/tilemaps/tilemap_5c.tilemap"
StripTilemaps_5c:
INCBIN "gfx/tilemaps/striptilemaps_5c.tilemap"
GFX_5c:
INCBIN "gfx/misc/gfx_5c.bin"

