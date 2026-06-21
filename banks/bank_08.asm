Script_008_4000::
	face FACE_UP
	stext House_CutsceneText1
	face FACE_LEFT
	move MovementData_OneLeft
	face FACE_UP
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	stext House_CutsceneText2
	emote 0, EMOTE_HEART
	delay 3, 32
	face FACE_DOWN
	stext text_08_456d
	stext text_08_458a
	stext text_08_45a5
	face FACE_LEFT
	move MovementData_OneLeft
	move MovementData_OneLeft
	face FACE_DOWN
	move MovementData_OneDown
	stext text_08_45cc
	delay 3, 7
	emote 0, EMOTE_EXCLAMATION
	delay 3, 32
	face FACE_LEFT
	move MovementData_OneLeft
	move MovementData_OneLeft
	move MovementData_OneLeft
	face FACE_DOWN
	move MovementData_OneDown
	stext text_08_45db
	delay 3, 7
	emote 0, EMOTE_QUESTION
	delay 3, 32
	stext text_08_45f0
	move MovementData_OneDown
	move MovementData_OneDown
	move MovementData_OneDown
	move MovementData_OneDown
	setfollower $01 ; follower
	face FACE_LEFT
	setmap MAP_BELL_VILLAGE_1, $08 ; map switch
; outside
	face FACE_RIGHT
	stext text_08_4651
	stext text_08_465e
	stext text_08_46a4
	face FACE_LEFT
	setmappredef MAPPREDEF_01
	end

Func_008_4082:
	xor a
	ld [wTargetMode], a
	jp JumpToGameMode

Script_008_4089:
	end

Script_008_408a:
	checkbit wEventFlags, 0, .script_4113 ; check bit 0
	setmap MAP_BELL_OBSERVATORY_1, $01
	face FACE_UP
	spriteface 2, FACE_LEFT
	move MovementData_OneUp
	move MovementData_OneUp
	stext text_08_4b8b
	delay 3, 7
	move MovementData_OneUp
	move MovementData_OneUp
	face FACE_LEFT
	move MovementData_OneLeft
	stext text_08_4b9f
	delay 3, 7
	emote 0, EMOTE_ANGER
	delay 3, 32
	move MovementData_OneLeft
	move MovementData_OneLeft
	stext text_08_4baf
	emote 2, EMOTE_EXCLAMATION
	delay 3, 32
	spriteface 2, FACE_DOWN
	stext text_08_4bbb
	stext text_08_4bd2
	stext text_08_4bdc
	move MovementData_OneLeft
	move MovementData_OneLeft
	face FACE_UP
	spritewalk 2, MOVE_DELAY
	stext text_08_4bf3
	stext text_08_4c1d
	stext text_08_4c2e
	face FACE_LEFT
; Cutscene
	spriteface 2, FACE_LEFT
	setmap MAP_BLUE_MOON_1, $00
	movemap MovementData_TwelveUp ; apply movement data to map
	stext text_08_4c4c
	stext text_08_4c8c
	stext text_08_4cb5
	stext text_08_4cbd
	setfollower $00
	setmap MAP_BALLOTS_HOUSE_1, $02
	face FACE_DOWN
	spriteface 2, FACE_UP
	stext text_08_4cc6
	setbit wEventFlags, 0 ; set bit 0
	end

.script_4113
	setmap MAP_BELL_OBSERVATORY_1, $00
	end

BallotsHouse1_ObjectEvents2:
	object_event $11,  5,  3, 0, $00, $00, $00, $00, Script_008_4123
	objects_end

Script_008_4123:
	textface text_08_4cf4
	end

BallotsHouse1_ObjectEvents3:
	object_event $11,  5,  3, 0, $00, $00, $00, $00, Script_008_4133
	objects_end

Script_008_4133:
	textface text_08_4e04
	end

Script_008_4137:
	checkbit wEventFlags, 0, .script_414d
; No entry
	stext text_08_4b77
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spritewalk 1, MOVE_UP
	spriteface 1, FACE_DOWN ; snowy faces down
	end

.script_414d
	setmap MAP_BELL_SCHOOL_1, $00
	end

Script_008_4151:
	checkbit wEventFlags, 1, .script_41a3
	stext text_08_4d0b
	face FACE_UP
	spriteface 2, FACE_DOWN
	spritewalk 2, MOVE_DOWN
	spritewalk 2, MOVE_DOWN
	move MovementData_OneUp
	emote 0, EMOTE_QUESTION
	delay 3, 32
	stext text_08_4d1a
	stext text_08_4d2d
	stext text_08_4d3e
	emote 2, EMOTE_EXCLAMATION
	delay 3, 32
	stext text_08_4d56
	stext text_08_4d70
	delay 3, 7
	stext text_08_4d77
	emote 0, EMOTE_ANGER
	delay 3, 32
	stext text_08_4d8f
	face FACE_DOWN
	move MovementData_OneDown
	move MovementData_OneDown
	move MovementData_OneDown
	setbit wEventFlags, 1
	setmappredef MAPPREDEF_02

.script_41a3
	setmap MAP_BELL_VILLAGE_1, $06
	end

Script_008_41a7:
	checkbit wEventFlags, 1, .script_41b1
	setmap MAP_BALLOTS_HOUSE_1, $00
	end

.script_41b1
	setmap MAP_BALLOTS_HOUSE_1, $03
	end

Script_008_41b5:
	checkbit wEventFlags, 2, .script_41bf
	setmap MAP_BELL_SCHOOL_1, $02
	end

.script_41bf
	stext text_08_522e
	face FACE_LEFT
	move MovementData_OneLeft
	end

Script_008_41c8:
	face FACE_UP
	spriteface 6, FACE_RIGHT
	spritewalk 6, MOVE_RIGHT
	spriteface 6, FACE_DOWN
	spritewalk 6, MOVE_DOWN
	spritewalk 6, MOVE_DOWN
	spriteface 6, FACE_LEFT
	spritewalk 6, MOVE_LEFT
	spriteface 6, FACE_DOWN
	spritewalk 6, MOVE_DOWN
	stext text_08_5306
	stext text_08_5346
	emote 6, EMOTE_TEAR
	delay 3, 32
	stext text_08_5387
	stext text_08_53af
	stext text_08_53ef
	spriteface 6, FACE_UP
	spritewalk 6, MOVE_UP
	spriteface 6, FACE_DOWN
	emote 6, EMOTE_HEART
	delay 3, 32
	stext text_08_5592
	setmap MAP_BELL_SCHOOL_NORTH_CLASSROOM_1, $01
	setbit wEventFlags, 3
	end

Script_008_4214:
	setmap MAP_BALLOTS_HOUSE_1, $04
	face FACE_UP
	spriteface 2, FACE_RIGHT
	spriteface 3, FACE_LEFT
	stext text_08_5468
	stext text_08_547e
	stext text_08_54d2
	emote 3, EMOTE_ANGER
	delay 3, 32
	stext text_08_54eb
	spriteface 3, FACE_DOWN
	spriteface 2, FACE_DOWN
	spritewalk 3, MOVE_DOWN
	spritewalk 3, MOVE_DOWN
	spritewalk 3, MOVE_DOWN
	spritewalk 3, MOVE_DOWN
	spritewalk 3, MOVE_DOWN
	spritewalk 3, MOVE_DOWN
	clearobject $03
	move MovementData_OneUp
	move MovementData_OneUp
	emote 0, EMOTE_QUESTION
	delay 3, 32
	stext text_08_5500
	stext text_08_550e
	emote 0, EMOTE_QUESTION
	delay 3, 32
	stext text_08_557d
	stext text_08_558a
	warpmode GAMEMODE_METEOR_CUTSCENE, $04, $00
	end

BallotsHouse1_ObjectEvents4:
	object_event $11,  3,  4, 0, $00, $00, $00, $00, Script_008_4089
	object_event $24,  4,  4, 0, $00, $00, $00, $01, Script_008_4089
	objects_end

Script_008_4285:
	stext text_08_55a7
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk 1, MOVE_DOWN
	spriteface 1, FACE_UP
	end

Script_008_4295:
	stext text_08_4f82
	face FACE_UP
	move MovementData_OneUp
	end

BallotsHouse1_ObjectEvents:
BellSchoolOutside1_ObjectEvents:
BellObservatory1_ObjectEvents:
BellObservatoryOutside1_ObjectEvents:
	objects_end

BellVillage1_ObjectEvents:
	object_event $1b, $10, $09,     0, 0, 0, 9, 0, Script_008_42ed
	object_event $13, $08, $0E,     0, 0, 0, 5, 1, Script_008_42fb
	object_event $20, $0E, $0D,     0, 0, 0, 7, 2, Script_008_4309
	object_event $1D, $05, $09,     0, 0, 0, 6, 3, Script_008_430d
	object_event $16, $0B, $04,     0, 0, 0, 0, 4, Script_008_4311
	object_event $19, $06, $05,     0, 0, 0, 8, 0, Script_008_4315
	object_event $01, $05, $10, wEventFlags, 1, 1, 0, 0, Script_008_4319
	objects_end

Script_008_42ed:
	checkbit wEventFlags, 1, .script_42f7
	textface text_08_46b1
	end

.script_42f7
	textface text_08_4e23
	end

Script_008_42fb:
	checkbit wEventFlags, 1, .script_4305
	textface text_08_46fe
	end

.script_4305
	textface text_08_4e55
	end

Script_008_4309:
	textface text_08_4768
	end

Script_008_430d:
	textface text_08_47af
	end

Script_008_4311:
	textface text_08_47fb
	end

Script_008_4315:
	textface text_08_4837
	end

Script_008_4319:
	textface text_08_4e15
	end

HayatosHouse1_ObjectEvents:
	object_event $22,  5,  6, 0, $00, $00, $06, $00, Script_008_4334
	object_event $26,  8,  3, wEventFlags, $01, $00, $00, $01, Script_008_4342
	objects_end

Script_008_4334:
	checkbit wEventFlags, 1, .script_433e
	textface text_08_48d0
	end

.script_433e
	textface text_08_4eb0
	end

Script_008_4342:
	textface text_08_4911
	end

CarpetWomansHouse1_ObjectEvents:
	object_event $1f,  4,  6, 0, $00, $00, $06, $00, Script_008_435d
	object_event $15,  7,  4, 0, $00, $00, $06, $01, Script_008_436e
	objects_end

Script_008_435d:
	checkbit wEventFlags, 1, .script_436a
	textface text_08_497a
	stext text_08_49cc
	end

.script_436a
	textface text_08_4ecc
	end

Script_008_436e:
	checkbit wEventFlags, 1, .script_4378
	textface text_08_4aac
	end

.script_4378
	textface text_08_4f1a
	end

FangfangsHouse1_ObjectEvents:
	object_event $15,  5,  6, 0, $00, $00, $06, $00, Script_008_439e
	object_event $18,  8,  3, 0, $00, $00, $0a, $01, Script_008_43ac
	object_event $1a,  5,  3, wEventFlags, $01, $00, $00, $02, Script_008_43b0
	objects_end

Script_008_439e:
	checkbit wEventFlags, 1, .script_43a8
	textface text_08_49db
	end

.script_43a8
	textface text_08_4ef4
	end

Script_008_43ac:
	textface text_08_4a2e
	end

Script_008_43b0:
	textface text_08_4a87
	end

BellHealingCenter1_ObjectEvents:
	object_event $25,  5,  2, 0, $00, $00, $00, $00, Script_008_43c0
	objects_end

Script_008_43c0:
	stext text_08_4b14
	end

Script_008_43c4:
	face FACE_UP
	stext text_08_4b14
	end

BellObservatory1_ObjectEvents2:
	object_event $11,  3,  7, 0, $00, $00, $00, $00, Script_008_4089
	objects_end

BellSchool1_ObjectEvents:
	object_event $24,  4, 13, wEventFlags, $03, $00, $00, $00, Script_008_43ed
	object_event $16,  7,  7, 0, $00, $00, $00, $01, Script_008_43f1
	objects_end

Script_008_43ed:
	textface text_08_4fa8
	end

Script_008_43f1:
	textface text_08_5001
	end

BellSchoolSouthClassroom1_ObjectEvents:
	object_event $1e,  7,  6, 0, $00, $00, $00, $00, Script_008_440c
	object_event $21,  4,  6, 0, $00, $00, $00, $01, Script_008_4410
	objects_end

Script_008_440c:
	textface text_08_5039
	end

Script_008_4410:
	textface text_08_506b
	end

BellSchoolNorthClassroom1_ObjectEvents:
	object_event $26,  4,  8, 0, $00, $00, $00, $00, Script_008_4463
	object_event $2c,  3,  8, 0, $00, $00, $00, $01, Script_008_4462
	object_event $1e,  7,  8, 0, $00, $00, $00, $02, Script_008_44da
	object_event $1a,  2, 10, wEventFlags, $02, $00, $00, $03, Script_008_44e1
	object_event $1a,  3,  6, wEventFlags, $02, $01, $00, $03, Script_008_44e1
	object_event $24, 12,  3, wEventFlags, $02, $00, $00, $04, Script_008_44e8
	object_event $24,  5,  2, wEventFlags, $02, $01, $00, $04, Script_008_44e8
	objects_end

Script_008_4462:
	end

Script_008_4463:
	checkbit wEventFlags, $02, Script_008_44d3
	walkpath
	face FACE_UP
	textface text_08_50a3
	emote $00, $04
	delay $03, $20
	stext text_08_50e8
	stext text_08_5105
	stext text_08_5188
	stext text_08_5195
; teacher moves to chair
	spriteface 6, FACE_LEFT
	spritewalk 6, MOVE_LEFT
	spritewalk 6, MOVE_LEFT
	spritewalk 6, MOVE_LEFT
	spritewalk 6, MOVE_LEFT
	spritewalk 6, MOVE_LEFT
	spritewalk 6, MOVE_LEFT
	spriteface 6, FACE_UP
	spritewalk 6, MOVE_UP
	spriteface 6, FACE_LEFT
	spritewalk 6, MOVE_LEFT
	spriteface 6, FACE_DOWN
; female student walks up to player
	spriteface 5, FACE_UP
	spritewalk 5, MOVE_UP
	spriteface 5, FACE_RIGHT
	stext text_08_51e5
; walking to seat
	spriteface 5, FACE_UP
	spritewalk 5, MOVE_UP
	spritewalk 5, MOVE_UP
	spritewalk 5, MOVE_UP
	spriteface 5, FACE_RIGHT
	spritewalk 5, MOVE_RIGHT
	spriteface 5, FACE_UP
	spriteface 2, FACE_UP
	spriteface 4, FACE_UP
	setbit wEventFlags, $02
	setmappredef MAPPREDEF_03
	end

Script_008_44d3:
	textface text_08_5291
	spriteface 2, FACE_UP
	end

Script_008_44da:
	textface text_08_52d0
	spriteface 4, FACE_UP
	end

Script_008_44e1:
	textface text_08_5267
	spriteface 5, FACE_UP
	end

Script_008_44e8:
	textface text_08_522e
	spriteface 6, FACE_DOWN
	end

Script_008_44ef:
	textface text_08_4519
	startbattle BattleData_02d_506b
	loadscriptedmon $09

Script_008_44f7:
	textface text_08_4519
	startbattle BattleData_02d_506b
	loadscriptedmon $09

Script_008_44ff:
	textface text_08_452d
	checkbit wEventFlags + 4, $01, .done
	scr_35 $01
	end
.done
	end

Script_008_450c:
	textface text_08_4537
	checkbit wEventFlags + 3, 3, .script_4517
	scr_37
	end

.script_4517
	townmusicanim
	end

INCLUDE "data/text/bank08_misc2.asm"
INCLUDE "data/text/ballots_house_intro.asm"
INCLUDE "data/text/bank08_misc.asm"

MeteorCutscene_ApplyTextPals:
	ld hl, MeteorCutscene_TextPalette
	call CopyBackgroundPalettes
	ld hl, MeteorCutscene_TextPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	ret

MeteorCutscene_ApplyBlackPal:
	ld hl, MeteorCutscene_BlackPalette
	call CopyBackgroundPalettes
	ld hl, MeteorCutscene_BlackPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	ret

Func_008_55f7:
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ret

MeteorCutscene_ClearSpriteBuffer:
	ld hl, wVisibleObjects
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

MeteorCutscene::
	ld a, BGM_METEOR
	call PlaySound

	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf5], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_Text1_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_TextAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_TextPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_TextGFX_1
	ld de, vTiles2
	ld bc, $520
	call CopyBytesVRAM

	call MeteorCutscene_ClearSpriteBuffer
	call MeteorCutscene_HideAllSprites
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette

.SceneLoop:
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .done

	ld a, [wdcf5]
	and a
	jr z, .Text2_WaitBlack
	cp 1
	jr z, .FadeToMeteors
	cp 2
	jr z, .DoMeteorAnimation
	cp 3
	jr z, .FadeFromMeteors ; to text 4
	cp 4
	jr z, .Text4_WaitBlack ; texts 4 - 9
	cp 5
	jr z, .Text2_Load ; texts 2 and 3
	cp 6
	jr z, .Text2_WaitShow ; texts 2 and 3
	cp 7
	jr z, .Text4_Load ; texts 4 - 9
	cp 8
	jr z, .Text4_WaitShow ; texts 4 - 9
	jp .SceneLoop

.done
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, 4
	ld [hMapPredef], a
	jp JumpToModeAndSetMapPredefs

.Text2_WaitBlack:
	call MeteorCutscene_WaitAndBlackOut
	jp .SceneLoop

.FadeToMeteors:
	call MeteorCutscene_DoFadeToMeteors
	jp .SceneLoop

.DoMeteorAnimation:
	call MeteorCutscene_AnimateStormBG
	call MeteorCutscene_InitMeteor
	call MeteorCutscene_PlaceMeteor
	call MeteorCutscene_AnimateMeteor
	call MeteorCutscene_MoveMeteor
	jp .SceneLoop

.FadeFromMeteors:
	call MeteorCutscene_DoFadeFromMeteors
	jp .SceneLoop

.Text4_WaitBlack:
	call MeteorCutscene_WaitAndBlackOut2
	jp .SceneLoop

.Text2_Load:
	call MeteorCutscene_LoadTexts
	jp .SceneLoop

.Text2_WaitShow:
	call MeteorCutscene_WaitAndShowText
	jp .SceneLoop

.Text4_Load:
	call MeteorCutscene_LoadTexts2
	jp .SceneLoop

.Text4_WaitShow:
	call MeteorCutscene_WaitAndShowText2
	jp .SceneLoop

MeteorCutscene_DoFadeToMeteors:
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf6], a
	ld [wdce8], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_StormTilemap_1
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_StormAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_MeteorPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_OBJPalette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_StormGFX
	ld de, vTiles2
	ld bc, $760
	call CopyBytesVRAM

	ld hl, MeteorCutscene_MeteorGFX
	ld de, vTiles0
	ld bc, $80
	call CopyBytesVRAM
	call MeteorCutscene_ClearSpriteBuffer
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
	ld a, 2
	ld [wdcf5], a
	ret

MeteorCutscene_PlaceMeteor:
	ld a, [wdcf6]
	and a
	jr z, .shoot
	dec a
	ld [wdcf6], a
	ret

.shoot
	ld bc, wdd50
.loop
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .play_sfx
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .loop
	ret

.play_sfx
	ld a, SFX_2c
	call PlaySound

	ld de, unk_008_57e2
	ld a, [wdce8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
REPT 3
	ld a, [hli]
	ld [bc], a
	inc bc
ENDR
	ld a, 1
	ld [bc], a
	ld a, [hli]
	ld [wdcf6], a
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp 7
	ret c
	xor a
	ld [wdce8], a
	ret

; TODO: indexed data table, classify type
unk_008_57e2:
	dw $30f0, $1004
	dw $5000, $1004
	dw $70f0, $1004
	dw $9000, $1004
	dw $40f0, $1004
	dw $6000, $1004
	dw $80f0, $1004

MeteorCutscene_AnimateMeteor:
	ld bc, wdd50
.asm_5801
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5815
.asm_5809
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .asm_5801
	ret

.asm_5815
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5820
	dec [hl]
	jr .asm_5809

.asm_5820
	ld [hl], 4
	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld d, a
	ld a, 3
	sub d
	ld [hl], a
	jr .asm_5809

MeteorCutscene_MoveMeteor:
	ld bc, wdd50
.asm_5831
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5845
.asm_5839
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4f
	jr c, .asm_5831
	ret

.asm_5845
	ld hl, 1
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, 0
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	cp $a0
	jr nz, .asm_5839
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	jr .asm_5839

MeteorCutscene_InitMeteor:
; clears the OAM each time
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ld [wd1fb], a
	call MeteorCutscene_InitMeteor2
	ret

MeteorCutscene_HideAllSprites:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

MeteorCutscene_InitMeteor2:
	ld bc, wdd50
.asm_5890
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_58a4
.asm_5898
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4f
	jr c, .asm_5890
	ret

.asm_58a4
	ld hl, 0
	add hl, bc
	ld a, [hl]
	ld [wdcf7], a
	ld hl, 1
	add hl, bc
	ld a, [hl]
	ld [wdcf8], a
	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld de, .Frames
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_58ca
	ld a, [hli]
	cp -1
	jr z, .asm_58ea
	push bc
	ld b, a
	ld a, [wdcf7]
	add b
	pop bc
	ld [de], a
	inc de
	ld a, [hli]
	push bc
	ld b, a
	ld a, [wdcf8]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop bc
	jr .asm_58ca

.asm_58ea
	ld a, e
	ld [wd1fb], a
	jp .asm_5898

.Frames:
	dw .Frame1
	dw .Frame1
	dw .Frame2

.Frame1:
	db 0
	db 0
	db 0
	db 0
	db 0
	db 8
	db 2
	db 0
	db -1

.Frame2:
	db 0
	db 0
	db 4
	db 0
	db 0
	db 8
	db 6
	db 0
	db -1

MeteorCutscene_AnimateStormBG:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $40
	ret nz
	xor a
	ld [wdcf3], a
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	hlbgcoord 0, 0
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 3
	ret c
	ld a, 3
	ld [wdcf5], a
	ret

.Tilemaps:
	dw MeteorCutscene_StormTilemap_2
	dw MeteorCutscene_StormTilemap_3
	dw MeteorCutscene_StormTilemap_3

MeteorCutscene_DoFadeFromMeteors:
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_Text4_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_TextAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_TextPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_TextGFX_2
	ld de, vTiles2
	ld bc, $800
	call CopyBytesVRAM

	ld hl, MeteorCutscene_TextGFX_3
	ld de, vTiles1
	ld bc, $210
	call CopyBytesVRAM

	call MeteorCutscene_ClearSpriteBuffer
	call MeteorCutscene_HideAllSprites
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
	ld a, 4
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndBlackOut:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyBlackPal
	ld a, 5
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndShowText:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $20
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyTextPals
	ld a, 0
	ld [wdcf5], a
	ret

MeteorCutscene_LoadTexts:
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	hlbgcoord 0, 8
	lb bc, $14, 2
	ld a, 2
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 3
	jr nc, .asm_5a2f
	ld a, 6
	ld [wdcf5], a
	ret

.asm_5a2f
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld a, 1
	ld [wdcf5], a
	ret

.Tilemaps:	; texts 2 and 3
	dw MeteorCutscene_Text2_Tilemap
	dw MeteorCutscene_Text3_Tilemap
	dw MeteorCutscene_Text3_Tilemap

MeteorCutscene_WaitAndBlackOut2:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyBlackPal
	ld a, 7
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndShowText2:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $20
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyTextPals
	ld a, 4
	ld [wdcf5], a
	ret

MeteorCutscene_LoadTexts2:
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	hlbgcoord 0, 8
	lb bc, $14, 2
	ld a, 2
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 6
	jr nc, .asm_5aa2
	ld a, 8
	ld [wdcf5], a
	ret

.asm_5aa2
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf5], a
	ld a, 1
	ld [hFade], a
	ret

.Tilemaps:	; texts 5 to 10
	dw MeteorCutscene_Text5_Tilemap
	dw MeteorCutscene_Text6_Tilemap
	dw MeteorCutscene_Text7_Tilemap
	dw MeteorCutscene_Text8_Tilemap
	dw MeteorCutscene_Text9_Tilemap
	dw MeteorCutscene_Text9_Tilemap

MeteorCutscene_BlackPalette:
INCBIN "gfx/cutscenes/cutscene_black.pal"

MeteorCutscene_TextPalette:
INCBIN "gfx/cutscenes/cutscene_text.pal"

MeteorCutscene_Text1_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_1.tilemap"

MeteorCutscene_Text4_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_4.tilemap"

MeteorCutscene_TextAttr:
INCBIN "gfx/cutscenes/cutscene_text.attr"

MeteorCutscene_TextGFX_1:
INCBIN "gfx/cutscenes/meteor/text_gfx_1.2bpp"

MeteorCutscene_TextGFX_2:
INCBIN "gfx/cutscenes/meteor/text_gfx_2.2bpp"

MeteorCutscene_TextGFX_3:
INCBIN "gfx/cutscenes/meteor/text_gfx_3.2bpp"

; TODO: indexed data table, classify type
unk_008_6eae:
INCBIN "data/unk_008_6eae.bin"

MeteorCutscene_Text2_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_2.tilemap"

MeteorCutscene_Text3_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_3.tilemap"

; TODO: indexed data table, classify type
unk_008_6f26:
INCBIN "data/unk_008_6f26.bin"

MeteorCutscene_Text5_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_5.tilemap"

MeteorCutscene_Text6_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_6.tilemap"

MeteorCutscene_Text7_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_7.tilemap"

MeteorCutscene_Text8_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_8.tilemap"

MeteorCutscene_Text9_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_9.tilemap"

MeteorCutscene_StormTilemap_1:
INCBIN "gfx/cutscenes/meteor/storm_bg_1.tilemap"

MeteorCutscene_StormAttr:
INCBIN "gfx/cutscenes/meteor/storm.gbcattr"

MeteorCutscene_MeteorPalette:
INCBIN "gfx/cutscenes/meteor/meteor_bg.pal"

MeteorCutscene_OBJPalette:
INCBIN "gfx/cutscenes/meteor/meteor_obj.pal"

MeteorCutscene_StormGFX:
INCBIN "gfx/cutscenes/meteor/storm.2bpp"

MeteorCutscene_MeteorGFX:
INCBIN "gfx/cutscenes/meteor/meteor.2bpp"

MeteorCutscene_StormTilemap_2:
INCBIN "gfx/cutscenes/meteor/storm_bg_2.tilemap"

MeteorCutscene_StormTilemap_3:
INCBIN "gfx/cutscenes/meteor/storm_bg_3.tilemap"
