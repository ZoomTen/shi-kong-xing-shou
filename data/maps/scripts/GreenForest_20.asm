GreenForest_20_ObjectEvents::
	object_event $46,  5,  3, wEventFlags + 6, $01, $00, $00, $00, Script_04f_4cd7
	objects_end

Script_04f_4cd7::
	stext text_4f_6746
	startbattle BattleData_02d_4b60
	checkbit wEventFlags + 3, $03, Script_04f_4000
	spriteface  2, FACE_UP
	spriteface  2, FACE_LEFT
	spriteface  2, FACE_RIGHT
	clearobject $02
	loadobjsprite ObjSprite_4f_4cbf
	objmove $03, MovementData_04f_7c26
	clearobject $03
	loadobjsprite ObjSprite_4f_4cbf
	objmove $03, MovementData_04f_7c4f
	clearobject $03
	loadobjsprite ObjSprite_4f_4cbf
	objmove $03, MovementData_04f_7c7c
	clearobject $03
	loadobjsprite ObjSprite_4f_4cbf
	objmove $03, MovementData_04f_7ca9
	clearobject $03
	loadobjsprite ObjSprite_4f_4cbf
	objmove $03, MovementData_04f_7cd6
	clearobject $03
	setmappredef MAPPREDEF_10
	setplayerchar $00
	setmap MAP_G3_1F, $01
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	spriteface  3, FACE_RIGHT
	emote  2, EMOTE_TEAR
	delay $03, $20
	stext text_4f_6787
	emote  0, EMOTE_EXCLAMATION
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_4f_6799
	clearplayerpos
	spritewalk  2, MOVE_RIGHT
	clearobject $02
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spritewalk  3, MOVE_RIGHT
	clearobject $03
	scr_62 $03, $01
	setbit wEventFlags + 6, $01
	end

G3_1F_ObjectEvents2::
	object_event $06,  4,  4, wEventFlags + 6, $01, $00, $00, $00, Script_04f_4031
	object_event $07,  3,  4, wEventFlags + 6, $01, $00, $00, $01, Script_04f_4031
	objects_end

Script_04f_4d6f::
	checkbit wEventFlags + 5, $05, Script_04f_4d86
	setmap MAP_GREEN_FOREST_P_13, $00
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_4f_61aa
	setbit wEventFlags + 5, $05
	end

Script_04f_4d86::
	checkbit wEventFlags + 6, $01, Script_04f_4d90
	setmap MAP_GREEN_FOREST_P_13, $00
	end

Script_04f_4d90::
	setmap MAP_GREEN_FOREST_P_12, $00
	end

Script_04f_4d94::
	checkbit wEventFlags + 5, $04, Script_04f_4da4
	checkbit wEventFlags + 5, $06, Script_04f_4dae
	setmap MAP_GREEN_FOREST_P_32, $03
	end

Script_04f_4da4::
	checkbit wEventFlags + 5, $06, Script_04f_4dae
	setmap MAP_GREEN_FOREST_P_32, $02
	end

Script_04f_4dae::
	setmap MAP_GREEN_FOREST_P_32, $00
	end

GreenForestP32_ObjectEvents2::
	object_event $36,  5,  3, 0, $00, $00, $00, $00, Script_04f_4dbe
	objects_end

Script_04f_4dbe::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_4f_61fa
	stext text_4f_621a
	setbit wEventFlags + 5, $06
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	clearobject $02
	move MovementData_OneUp
	face FACE_LEFT
	move MovementData_OneLeft
	setmap MAP_GREEN_FOREST_P_4, $00
	end2
