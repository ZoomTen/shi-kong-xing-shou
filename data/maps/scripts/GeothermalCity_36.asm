GeothermalCity_36_ObjectEvents::
	object_event $6d,  8,  3, wEventFlags + 10, $02, $00, $00, $00, Script_058_468c
	object_event $1a,  8,  3, wEventFlags + 10, $02, $01, $00, $00, Script_058_46d9
	objects_end

ObjSprite_58_4680::
	object_event $1a,  1,  3, 0, $00, $00, $00, $00, Script_058_46d9
	objects_end

Script_058_468c::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_58_4b4a
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_4b5e
	spriteface  2, FACE_UP
	face FACE_LEFT
	objmove $02, MovementData_058_665c
	clearobject $02
	emote  0, EMOTE_TEAR
	delay $03, $20
	loadobjsprite ObjSprite_58_4680
	spriteface  2, FACE_RIGHT
	objmove $02, MovementData_058_66ef
	spriteface  2, FACE_DOWN
	face FACE_UP
	stext text_58_4b99
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_4bd6
	stext text_58_4be7
	stext text_58_4c97
	stext text_58_4cbc
	setbit wEventFlags + 10, $02
	end

Script_058_46d9::
	checkbit wEventFlags + 10, $03, Script_058_46e7
	textface text_58_4d0c
	setbit wEventFlags + 10, $03
	end

Script_058_46e7::
	checkbit wEventFlags + 10, $04, Script_058_46f5
	textface text_58_4d98
	setbit wEventFlags + 10, $04
	end

Script_058_46f5::
	textface text_58_4e39
	setbit wEventFlags + 10, $05
	end

Script_058_46fd::
	stext text_58_61bc
	end

Script_058_4701::
	checkbit wEventFlags + 11, $05, Script_058_470b
	setmap MAP_GEOTHERMAL_CITY_36, $00
	end

Script_058_470b::
	setmap MAP_GEOTHERMAL_CITY_36, $01
	end

Script_058_470f::
	setmap MAP_DEATH_VALLEY, $00
	checkbit wEventFlags + 11, $02, Script_058_4735
	stext text_58_4ebc
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_4edb
	face FACE_RIGHT
	move MovementData_OneRight
	clearplayerpos
	spritewalk  1, MOVE_LEFT
	spriteface  1, FACE_RIGHT
	setbit wEventFlags + 10, $06
	end

Script_058_4735::
	checkbit wEventFlags + 11, $03, Script_058_4748
	stext text_58_5656
	emote  0, EMOTE_HEART
	delay $03, $20
	stext text_58_5697
	end

Script_058_4748::
	end
