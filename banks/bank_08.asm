BallotsHouse_StartScript::
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

GotoOverworld:: ; unreferenced?
	xor a ; GAMEMODE_OVERWORLD
	ld [wTargetMode], a
	jp JumpToGameMode

EmptyScript_008::
	end

Script_008_408a::
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

BallotsHouse1_ObjectEvents2::
	object_event $11,  5,  3, 0, $00, $00, $00, $00, Script_008_4123
	objects_end

Script_008_4123::
	textface text_08_4cf4
	end

BallotsHouse1_ObjectEvents3::
	object_event $11,  5,  3, 0, $00, $00, $00, $00, Script_008_4133
	objects_end

Script_008_4133::
	textface text_08_4e04
	end

Script_008_4137::
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

Script_008_4151::
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

Script_008_41a7::
	checkbit wEventFlags, 1, .script_41b1
	setmap MAP_BALLOTS_HOUSE_1, $00
	end

.script_41b1
	setmap MAP_BALLOTS_HOUSE_1, $03
	end

Script_008_41b5::
	checkbit wEventFlags, 2, .script_41bf
	setmap MAP_BELL_SCHOOL_1, $02
	end

.script_41bf
	stext text_08_522e
	face FACE_LEFT
	move MovementData_OneLeft
	end

Script_008_41c8::
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

Script_008_4214::
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

BallotsHouse1_ObjectEvents4::
	object_event $11,  3,  4, 0, $00, $00, $00, $00, EmptyScript_008
	object_event $24,  4,  4, 0, $00, $00, $00, $01, EmptyScript_008
	objects_end

Script_008_4285::
	stext text_08_55a7
	face FACE_UP
	move MovementData_OneUp
	clearplayerpos
	spritewalk 1, MOVE_DOWN
	spriteface 1, FACE_UP
	end

Script_008_4295::
	stext text_08_4f82
	face FACE_UP
	move MovementData_OneUp
	end

Bank08_EmptyObjectEvent::
	objects_end

BellVillage1_ObjectEvents::
	object_event $1b, $10, $09,     0, 0, 0, 9, 0, Script_008_42ed
	object_event $13, $08, $0E,     0, 0, 0, 5, 1, Script_008_42fb
	object_event $20, $0E, $0D,     0, 0, 0, 7, 2, Script_008_4309
	object_event $1D, $05, $09,     0, 0, 0, 6, 3, Script_008_430d
	object_event $16, $0B, $04,     0, 0, 0, 0, 4, Script_008_4311
	object_event $19, $06, $05,     0, 0, 0, 8, 0, Script_008_4315
	object_event $01, $05, $10, wEventFlags, 1, 1, 0, 0, Script_008_4319
	objects_end

Script_008_42ed::
	checkbit wEventFlags, 1, .script_42f7
	textface text_08_46b1
	end

.script_42f7
	textface text_08_4e23
	end

Script_008_42fb::
	checkbit wEventFlags, 1, .script_4305
	textface text_08_46fe
	end

.script_4305
	textface text_08_4e55
	end

Script_008_4309::
	textface text_08_4768
	end

Script_008_430d::
	textface text_08_47af
	end

Script_008_4311::
	textface text_08_47fb
	end

Script_008_4315::
	textface text_08_4837
	end

Script_008_4319::
	textface text_08_4e15
	end

HayatosHouse1_ObjectEvents::
	object_event $22,  5,  6, 0, $00, $00, $06, $00, Script_008_4334
	object_event $26,  8,  3, wEventFlags, $01, $00, $00, $01, Script_008_4342
	objects_end

Script_008_4334::
	checkbit wEventFlags, 1, .script_433e
	textface text_08_48d0
	end

.script_433e
	textface text_08_4eb0
	end

Script_008_4342::
	textface text_08_4911
	end

CarpetWomansHouse1_ObjectEvents::
	object_event $1f,  4,  6, 0, $00, $00, $06, $00, Script_008_435d
	object_event $15,  7,  4, 0, $00, $00, $06, $01, Script_008_436e
	objects_end

Script_008_435d::
	checkbit wEventFlags, 1, .script_436a
	textface text_08_497a
	stext text_08_49cc
	end

.script_436a
	textface text_08_4ecc
	end

Script_008_436e::
	checkbit wEventFlags, 1, .script_4378
	textface text_08_4aac
	end

.script_4378
	textface text_08_4f1a
	end

FangfangsHouse1_ObjectEvents::
	object_event $15,  5,  6, 0, $00, $00, $06, $00, Script_008_439e
	object_event $18,  8,  3, 0, $00, $00, $0a, $01, Script_008_43ac
	object_event $1a,  5,  3, wEventFlags, $01, $00, $00, $02, Script_008_43b0
	objects_end

Script_008_439e::
	checkbit wEventFlags, 1, .script_43a8
	textface text_08_49db
	end

.script_43a8
	textface text_08_4ef4
	end

Script_008_43ac::
	textface text_08_4a2e
	end

Script_008_43b0::
	textface text_08_4a87
	end

BellHealingCenter1_ObjectEvents::
	object_event $25,  5,  2, 0, $00, $00, $00, $00, Script_008_43c0
	objects_end

Script_008_43c0::
	stext text_08_4b14
	end

Script_008_43c4::
	face FACE_UP
	stext text_08_4b14
	end

BellObservatory1_ObjectEvents2::
	object_event $11,  3,  7, 0, $00, $00, $00, $00, EmptyScript_008
	objects_end

BellSchool1_ObjectEvents::
	object_event $24,  4, 13, wEventFlags, $03, $00, $00, $00, Script_008_43ed
	object_event $16,  7,  7, 0, $00, $00, $00, $01, Script_008_43f1
	objects_end

Script_008_43ed::
	textface text_08_4fa8
	end

Script_008_43f1::
	textface text_08_5001
	end

BellSchoolSouthClassroom1_ObjectEvents::
	object_event $1e,  7,  6, 0, $00, $00, $00, $00, Script_008_440c
	object_event $21,  4,  6, 0, $00, $00, $00, $01, Script_008_4410
	objects_end

Script_008_440c::
	textface text_08_5039
	end

Script_008_4410::
	textface text_08_506b
	end

BellSchoolNorthClassroom1_ObjectEvents::
	object_event $26,  4,  8, 0, $00, $00, $00, $00, Script_008_4463
	object_event $2c,  3,  8, 0, $00, $00, $00, $01, Script_008_4462
	object_event $1e,  7,  8, 0, $00, $00, $00, $02, Script_008_44da
	object_event $1a,  2, 10, wEventFlags, $02, $00, $00, $03, Script_008_44e1
	object_event $1a,  3,  6, wEventFlags, $02, $01, $00, $03, Script_008_44e1
	object_event $24, 12,  3, wEventFlags, $02, $00, $00, $04, Script_008_44e8
	object_event $24,  5,  2, wEventFlags, $02, $01, $00, $04, Script_008_44e8
	objects_end

Script_008_4462::
	end

Script_008_4463::
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

Script_008_44d3::
	textface text_08_5291
	spriteface 2, FACE_UP
	end

Script_008_44da::
	textface text_08_52d0
	spriteface 4, FACE_UP
	end

Script_008_44e1::
	textface text_08_5267
	spriteface 5, FACE_UP
	end

Script_008_44e8::
	textface text_08_522e
	spriteface 6, FACE_DOWN
	end

Script_008_44ef::
	textface text_08_4519
	startbattle BattleData_02d_506b
	loadscriptedmon $09

Script_008_44f7::
	textface text_08_4519
	startbattle BattleData_02d_506b
	loadscriptedmon $09

Script_008_44ff::
	textface text_08_452d
	checkbit wEventFlags + 4, $01, .done
	scr_35 $01
	end
.done
	end

Script_008_450c::
	textface text_08_4537
	checkbit wEventFlags + 3, 3, .script_4517
	scr_37
	end

.script_4517
	townmusicanim
	end

