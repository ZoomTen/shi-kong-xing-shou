unk_04e_4000:
	end
Script_04e_4001:: ; farjump2 target (bank_4f)
	setmap $08, $06
	end
Script_04e_4005:
	setmap $09, $00
	end

BanglinCo1f_ObjectEvents5:
BanglinCo2f_ObjectEvents:
BanglinCo3f_ObjectEvents:
BanglinCo4f_ObjectEvents:
BanglinCo5f_ObjectEvents:
	objects_end
Script_04e_400a::
	end

BanglinCo2_ObjectEvents:
	object_event $3e,  2,  2, 0, $00, $00, $00, $00, Script_04e_4043
	object_event $27,  9,  5, 0, $00, $00, $00, $01, Script_04e_4047
	object_event $1d,  9,  2, 0, $00, $00, $00, $02, Script_04e_404b
	object_event $25,  4,  4, 0, $00, $00, $00, $03, Script_04e_404f
	object_event $13,  5, 10, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end

Script_04e_4043:
	textface text_4e_4dd3
	end

Script_04e_4047:
	textface text_4e_4ec6
	end

Script_04e_404b:
	textface text_4e_4e23
	end

Script_04e_404f:
	textface text_4e_4e4c
	end

Script_04e_4053::
	face FACE_DOWN
	spriteface  6, FACE_UP
	spritewalk  6, MOVE_UP
	spritewalk  6, MOVE_UP
	stext text_4e_4f64
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_4f99
	setmap $0a, $00
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	stext text_4e_4faf
Script_04e_407c:
	warpmode GAMEMODE_RHYTHM_MINIGAME, $0a, $00
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	checkbit wEventFlags + 7, $01, Script_04e_409a
	stext text_4e_5035
	farjump Script_04e_407c
	end

Script_04e_409a:
	stext text_4e_5086
	stext text_4e_50c4
	setmap $09, $01
	end

ContestHall_ObjectEvents:
	object_event $06,  3,  5, 0, $00, $00, $00, $00, Script_04e_400a
	object_event $45,  3,  7, 0, $00, $00, $00, $01, Script_04e_400a
	object_event $45,  8,  5, 0, $00, $00, $00, $02, Script_04e_400a
	object_event $45,  8,  7, 0, $00, $00, $00, $03, Script_04e_400a
	objects_end

BanglinCo2_ObjectEvents2:
	object_event $3e,  2,  2, 0, $00, $00, $00, $00, Script_04e_4109
	object_event $27,  9,  5, 0, $00, $00, $00, $01, Script_04e_410d
	object_event $1d,  9,  2, 0, $00, $00, $00, $02, Script_04e_4111
	object_event $25,  4,  4, 0, $00, $00, $00, $03, Script_04e_4115
	object_event $13,  5, 10, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end

Script_04e_4109:
	textface text_4e_50d1
	end

Script_04e_410d:
	textface text_4e_51aa
	end

Script_04e_4111:
	textface text_4e_5146
	end

Script_04e_4115:
	textface text_4e_5172
	end

Script_04e_4119::
	face FACE_DOWN
	spriteface  6, FACE_UP
	spritewalk  6, MOVE_UP
	spritewalk  6, MOVE_UP
	stext text_4e_51fa
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_DOWN
	stext text_4e_5235
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_524c
	stext text_4e_5263
	emote  3, EMOTE_HEART
	delay $03, $20
	stext text_4e_527a
	emote  0, EMOTE_TEAR
	delay $03, $20
	stext text_4e_52b3
	stext text_4e_52c3
	emote  4, EMOTE_TEAR
	emote  5, EMOTE_TEAR
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_52e8
	stext text_4e_5303
	spriteface  6, FACE_DOWN
	spritewalk  6, MOVE_DOWN
	spritewalk  6, MOVE_DOWN
	clearobject $06
	stext text_4e_5337
	setmap $0a, $01
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_LEFT
	spriteface  5, FACE_LEFT
	stext text_4e_5375
	loadobjsprite ObjSprite_4e_43c9
	spriteface  6, FACE_DOWN
	objmove $06, MovementData_04e_6058
	spriteface  6, FACE_LEFT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	spriteface  6, FACE_RIGHT
	spritewalk  6, MOVE_RIGHT
	spriteface  6, FACE_RIGHT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	emote  3, EMOTE_HEART
	emote  4, EMOTE_HEART
	delay $03, $20
	spriteface  6, FACE_UP
	objmove $06, MovementData_04e_617a
	clearobject $06
	stext text_4e_541b
	loadobjsprite ObjSprite_4e_43bd
	spriteface  6, FACE_DOWN
	objmove $06, MovementData_04e_6058
	spriteface  6, FACE_DOWN
	delay $03, $10
	spriteface  6, $04
	spriteface  6, $06
	delay $03, $10
	spriteface  6, $04
	delay $03, $10
	spriteface  6, FACE_DOWN
	spriteface  6, FACE_RIGHT
	spritewalk  6, MOVE_RIGHT
	spriteface  6, $07
	delay $03, $10
	spriteface  6, $04
	delay $03, $10
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_5475
	spriteface  6, $05
	objmove $06, MovementData_04e_617a
	clearobject $06
	stext text_4e_54c0
	stext text_4e_5530
	loadobjsprite ObjSprite_4e_43b1
	spriteface  6, FACE_DOWN
	delay $03, $20
	stext text_4e_5587
	emote  6, EMOTE_TEAR
	delay $03, $20
	stext text_4e_5595
	objmove $06, MovementData_04e_6058
	spriteface  6, FACE_LEFT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	spriteface  6, FACE_RIGHT
	spritewalk  6, MOVE_RIGHT
	spriteface  6, FACE_RIGHT
	delay $03, $10
	spriteface  6, FACE_DOWN
	delay $03, $10
	emote  4, EMOTE_ANGER
	emote  5, EMOTE_ANGER
	delay $03, $20
	stext text_4e_55bf
	emote  2, EMOTE_HEART
	delay $03, $20
	stext text_4e_55cf
	emote  4, EMOTE_EXCLAMATION
	emote  5, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_55eb
	emote  6, EMOTE_QUESTION
	delay $03, $20
	stext text_4e_561f
	spriteface  6, FACE_UP
	objmove $06, MovementData_04e_617a
	clearobject $06
	stext text_4e_563d
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	spriteface  4, FACE_DOWN
	spriteface  5, FACE_DOWN
	setattach $02, $03, $f0, $00
	objmove $03, MovementData_04e_6119
	clearobject $03
	clearobject $02
	setattach $04, $05, $f0, $00
	objmove $05, MovementData_04e_6119
	clearobject $05
	clearobject $04
	loadobjsprite ObjSprite_4e_43a5
	spriteface  2, FACE_DOWN
	spritewalk  2, MOVE_DOWN
	spritewalk  2, MOVE_DOWN
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_DOWN
	stext text_4e_5666
	stext text_4e_568a
	loadobjsprite ObjSprite_4e_43b1
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	spritewalk  3, MOVE_DOWN
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_56a5
	stext text_4e_56b8
	loadobjsprite ObjSprite_4e_4399
	spriteface  4, FACE_DOWN
	spritewalk  4, MOVE_DOWN
	spritewalk  4, MOVE_DOWN
	loadobjsprite ObjSprite_4e_4381
	loadobjsprite ObjSprite_4e_438d
	spritewalk  5, MOVE_DOWN
	spriteface  5, FACE_RIGHT
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_UP
	spriteface  4, FACE_LEFT
	stext text_4e_5711
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	emote  4, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk  6, MOVE_DOWN
	stext text_4e_577d
	spriteface  5, FACE_UP
	spriteface  6, FACE_UP
	setattach $05, $06, $10, $00
	objmove $06, MovementData_04e_617a
	clearobject $06
	clearobject $05
	stext text_4e_579f
	stext text_4e_57ae
	stext text_4e_57fb
	setmappredef MAPPREDEF_12
	setbit wEventFlags + 6, $04
	setfollower $02
	setplayerchar $00
	face FACE_LEFT
	setmap $08, $05
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	stext text_4e_5804
	stext text_4e_5826
	stext text_4e_5833
	clearplayerpos
	spritewalk  2, MOVE_RIGHT
	clearobject $02
	spritewalk  3, MOVE_RIGHT
	spritewalk  3, MOVE_RIGHT
	clearobject $03
	scr_62 $03, $01
	setbit wEventFlags + 24, $04
	end

BanglinCo1f_ObjectEvents4:
	object_event $06,  4,  5, wEventFlags + 24, $04, $00, $00, $00, Script_04e_400a
	object_event $07,  3,  5, wEventFlags + 24, $04, $00, $00, $01, Script_04e_400a
	objects_end
ObjSprite_4e_4381::
	object_event $38,  5,  1, 0, $00, $00, $00, $03, Script_04e_400a
	objects_end
ObjSprite_4e_438d::
	object_event $28,  5,  0, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end
ObjSprite_4e_4399::
	object_event $35,  6,  0, 0, $00, $00, $00, $02, Script_04e_400a
	objects_end
ObjSprite_4e_43a5::
	object_event $31,  6,  0, 0, $00, $00, $00, $00, Script_04e_400a
	objects_end
ObjSprite_4e_43b1::
	object_event $39,  5,  0, 0, $00, $00, $00, $01, Script_04e_400a
	objects_end
ObjSprite_4e_43bd::
	object_event $37,  5,  0, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end
ObjSprite_4e_43c9::
	object_event $3f,  5,  0, 0, $00, $00, $00, $04, Script_04e_400a
	objects_end

ContestHall_ObjectEvents2:
	object_event $06,  3,  5, 0, $00, $00, $00, $00, Script_04e_400a
	object_event $45,  3,  7, 0, $00, $00, $00, $01, Script_04e_400a
	object_event $45,  8,  5, 0, $00, $00, $00, $02, Script_04e_400a
	object_event $45,  8,  7, 0, $00, $00, $00, $03, Script_04e_400a
	objects_end

BanglinCo5f_ObjectEvents2:
	object_event $27, 11,  6, wEventFlags + 6, $05, $00, $00, $00, Script_04e_400a
	object_event $28, 10,  6, wEventFlags + 6, $05, $00, $00, $01, Script_04e_400a
	objects_end

Script_04e_4419::
	face FACE_LEFT
	setmap $0e, $02
	face FACE_UP
	spriteface  1, FACE_UP
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_RIGHT
	stext text_4e_5861
	stext text_4e_5886
	stext text_4e_58bc
	stext text_4e_58f5
	stext text_4e_591e
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	emote  2, EMOTE_EXCLAMATION
	emote  3, EMOTE_EXCLAMATION
	delay $03, $20
	setattach $01, $00, $00, $10
	objmove $00, MovementData_4e_5ff6
	clearattach $01
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	spriteface  2, FACE_RIGHT
	spritewalk  3, MOVE_DOWN
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	stext text_4e_594e
	stext text_4e_597a
	startbattle BattleData_02d_4b70
	checkbit wEventFlags + 3, $03, Script_04e_44aa
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_59b0
	stext text_4e_59c1
	scr_48 $02, $0c
	stext text_4e_59d4
	spriteface  2, FACE_DOWN
	spriteface  3, FACE_DOWN
	setattach $02, $03, $f0, $00
	objmove $03, MovementData_04e_6119
	clearobject $03
	clearobject $02
	emote  0, EMOTE_TEAR
	delay $03, $20
	setbit wEventFlags + 6, $05
	setmappredef MAPPREDEF_13
	end

Script_04e_44aa:
	face FACE_DOWN
	setmap $0e, $03
	end

BanglinCo1f_ObjectEvents6:
	object_event $35,  6,  5, wEventFlags + 6, $06, $00, $00, $00, Script_04e_400a
	object_event $06,  6,  6, wEventFlags + 6, $06, $00, $00, $01, Script_04e_400a
	object_event $04,  5,  6, wEventFlags + 6, $06, $00, $00, $02, Script_04e_400a
	objects_end

Script_04e_44d2::
	checkbit wEventFlags + 6, $05, Script_04e_44dc
	setmap $08, $07
	end

Script_04e_44dc:
	checkbit wEventFlags + 6, $06, Script_04e_4586
	setplayerchar $00
	face FACE_RIGHT
	setmap $08, $08
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_UP
	spriteface  4, FACE_UP
	stext text_4e_5a18
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4e_5a66
	stext text_4e_5a7c
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4e_5abb
	spriteface  2, FACE_UP
	face FACE_UP
	move MovementData_OneUp
	face $04
	stext text_4e_5acc
	face FACE_UP
	stext text_4e_5b80
	stext text_4e_5b8a
	face FACE_DOWN
	move MovementData_OneDown
	spriteface  2, FACE_LEFT
	stext text_4e_5bfb
	face FACE_RIGHT
	spriteface  4, FACE_RIGHT
	spriteface  3, FACE_UP
	spriteface  2, FACE_DOWN
	stext text_4e_5c07
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_4e_5c62
	spriteface  3, FACE_LEFT
	spriteface  2, FACE_LEFT
	stext text_4e_5c6f
	stext text_4e_5cad
	scr_48 $02, $0d
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $08, $08
	spriteface  2, FACE_LEFT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_UP
	stext text_4e_5cba
	spriteface  2, FACE_RIGHT
	objmove $02, MovementData_04e_61db
	clearobject $02
	clearplayerpos
	spriteface  4, FACE_UP
	spritewalk  4, MOVE_UP
	clearobject $04
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	spriteface  3, FACE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	setbit wEventFlags + 6, $06
	end

Script_04e_4586:
	setmap $08, $07
	end

Airport_ObjectEvents2:
	object_event $35,  6,  5, wEventFlags + 6, $06, $01, $00, $00, Script_04e_400a
	object_event $06,  7,  5, wEventFlags + 6, $06, $01, $00, $01, Script_04e_400a
	object_event $04,  7,  6, wEventFlags + 6, $06, $01, $00, $02, Script_04e_400a
	objects_end

Airport_ObjectEvents:
	object_event $35,  6,  5, wEventFlags + 6, $06, $01, $00, $00, Script_04e_45b8
	objects_end

Script_04e_45b8:
	walkpath
	setplayerchar $00
	face FACE_UP
	setmap $11, $01
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_LEFT
	spriteface  4, FACE_LEFT
	stext text_4e_5d75
	stext text_4e_5d8c
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_4e_5dac
	stext text_4e_5dd6
	stext text_4e_5de3
	emote  4, EMOTE_QUESTION
	delay $03, $20
	stext text_4e_5e1b
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface  2, FACE_DOWN
	stext text_4e_5e2b
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_RIGHT
	setattach $04, $03, $10, $00
	objmove $03, MovementData_04e_61db
	clearobject $03
	clearobject $04
	spriteface  2, FACE_DOWN
	face FACE_UP
	stext text_4e_5e5e
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	spriteface  2, FACE_RIGHT
	setattach $01, $00, $10, $00
	objmove $00, MovementData_04e_61db
	clearobject $00
	clearobject $01
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	stext text_4e_5e75
	warpmode GAMEMODE_AIRPORT_CUTSCENE1, $0a, $00
	end

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
INCLUDE "data/text/bank4e_4d02.asm"
INCLUDE "data/text/bank4e_51fa.asm"
MovementData_4e_5ff6:
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $88, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $88
MovementData_04e_6058:
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $88
MovementData_04e_6119:
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00
	db $88
MovementData_04e_617a:
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $88
MovementData_04e_61db:
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02, $00, $02
	db $88, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $88, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $88, $ff, $ff, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $88, $ff, $00, $fc, $fe
	db $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe
	db $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe
	db $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $88, $ff, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $88, $ff, $01, $fc, $03, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $fc, $02, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $02, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $88, $ff, $01, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc
	db $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc
	db $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $88
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

