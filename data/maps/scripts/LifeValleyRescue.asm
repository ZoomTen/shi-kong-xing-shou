LifeValleyRescue_ObjectEvents::
	object_event $4f,  5,  5, wEventFlags + 11, $05, $00, $00, $00, Script_058_48a5
	object_event $51,  6,  5, wEventFlags + 11, $05, $00, $00, $01, Script_058_48a1
	objects_end

LifeValleyRescue_ObjectEvents2::
	object_event $4f,  5,  5, 0, $00, $00, $00, $00, Script_058_40e9
	object_event $51,  6,  5, 0, $00, $00, $00, $01, Script_058_40e9
	object_event $0a,  6,  6, 0, $00, $00, $00, $02, Script_058_40e9
	objects_end

Script_058_48a1::
	textface text_58_5aac
	end

Script_058_48a5::
	setplayerchar $00
	face FACE_UP
	setmap MAP_LIFE_VALLEY_RESCUE, $01
	spriteface 4, FACE_UP
	stext text_58_5aac
	stext text_58_5a99
	stext text_58_5ac1
	stext text_58_5ad6
	startbattle BattleData_02d_4bfb
	checkbit wEventFlags + 3, $03, Script_058_49bc
	clearobject $02
	loadobjsprite unk_058_49e5
	playsound SFX_2c
	spriteface 2, FACE_UP
	delay $03, $08
	spriteface 2, FACE_UP
	clearobject $02
	delay $03, $08
	loadobjsprite unk_058_49f1
	playsound SFX_2c
	spriteface 2, FACE_UP
	delay $03, $08
	spriteface 2, FACE_UP
	clearobject $02
	delay $03, $08
	loadobjsprite unk_058_49fd
	playsound SFX_2c
	spriteface 2, FACE_UP
	delay $03, $08
	spriteface 2, FACE_UP
	clearobject $02
	delay $03, $08
	stext text_58_5ae9
	stext text_58_5b70
	emote 3, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 3, FACE_LEFT
	spritewalk 3, MOVE_LEFT
	spriteface 3, FACE_DOWN
	spriteface 4, FACE_LEFT
	stext text_58_5b9a
	stext text_58_5bd5
	emote 0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_5be6
	stext text_58_5c02
	spriteface 4, FACE_UP
	spritewalk 4, MOVE_UP
	spriteface 4, FACE_LEFT
	spriteface 3, FACE_RIGHT
	stext text_58_5c45
	emote 3, EMOTE_TEAR
	delay $03, $20
	stext text_58_5c68
	stext text_58_5c7f
	emote 3, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_5cbb
	emote 4, EMOTE_HEART
	delay $03, $20
	stext text_58_5ce6
	stext text_58_5cf0
	spriteface 3, FACE_LEFT
	objmove $03, MovementData_058_67e4
	clearobject $03
	emote 4, EMOTE_EXCLAMATION
	delay $03, $20
	spritewalk 4, MOVE_LEFT
	spriteface 4, FACE_DOWN
	stext text_58_5d14
	emote 0, EMOTE_TEAR
	delay $03, $20
	setbit wEventFlags + 11, $05
	setmap MAP_SACREDTREE_STARDREAM_DEPARTURE, $02
	spriteface 3, FACE_UP
	stext text_58_5d71
	emote 2, EMOTE_ANGER
	delay $03, $20
	stext text_58_5dac
	stext text_58_5dba
	spriteface 3, FACE_DOWN
	objmove $03, MovementData_058_67bb
	clearobject $03
	loadobjsprite ObjSprite_58_49c2
	spriteface 3, FACE_UP
	objmove $03, MovementData_058_6761
	stext text_58_5dc7
	emote 2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_5dd2
	stext text_58_5e0f
	stext text_58_5e56
	stext text_58_5e73
	setmap MAP_LIFE_VALLEY_RESCUE, $02
	end

Script_058_49bc::
	face FACE_DOWN
	setmap MAP_LIFE_VALLEY, $02
	end

ObjSprite_58_49c2::
	object_event $50,  6, 11, 0, $00, $00, $00, $01, Script_058_40e9
	objects_end

SacredtreeStardreamDeparture_ObjectEvents3::
	object_event $4d, 6, 3, 0, $00, $00, $00, $00, Script_058_40e9
	object_event $62, 6, 4, 0, $00, $00, $00, $01, Script_058_40e9
	objects_end

unk_058_49e5::
	object_event $66, 4, 4, 0, $00, $00, $00, $00, Script_058_40e9
	objects_end

unk_058_49f1::
	object_event $66, 6, 3, 0, $00, $00, $00, $00, Script_058_40e9
	objects_end

unk_058_49fd::
	object_event $66, 7, 4, 0, $00, $00, $00, $00, Script_058_40e9
	objects_end

Script_058_4a09::
	checkbit wEventFlags + 11, $05, Script_058_4a13

Script_058_4a0f::
	setmap MAP_G4_1E, $00
	end

Script_058_4a13::
	checkbit wEventFlags + 12, $01, Script_058_4a0f
	setmap MAP_G4_1E, $03
	end

G4_1E_ObjectEvents2::
	object_event $62,  2,  3, wEventFlags + 12, $01, $00, $00, $00, Script_058_4a29
	objects_end

Script_058_4a29::
	textface text_58_63df
	startbattle BattleData_02d_4c1a
	checkbit wEventFlags + 3, $03, unk_058_4000
	clearobject $02
	emote 0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_63fd
	setbit wEventFlags + 12, $01
	end
