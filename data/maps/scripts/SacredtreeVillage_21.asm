SacredtreeVillage_21_ObjectEvents::
	object_event $6c, 18, 21, 0, $00, $00, $00, $00, Script_059_469d
	object_event $6c,  9,  7, 0, $00, $00, $00, $01, Script_059_469d
	objects_end

G4_22_ObjectEvents::
	object_event $6c, 21,  4, 0, $00, $00, $00, $00, Script_059_469d
	object_event $6c,  4, 16, 0, $00, $00, $00, $01, Script_059_469d
	object_event $6c, 22,  4, 0, $00, $00, $00, $02, Script_059_469d
	objects_end

G4_23_ObjectEvents::
	object_event $6c, 17,  1, 0, $00, $00, $00, $00, Script_059_469d
	object_event $6c,  5, 14, 0, $00, $00, $00, $01, Script_059_469d
	object_event $6c,  5, 15, 0, $00, $00, $00, $02, Script_059_469d
	object_event $6c, 17,  2, 0, $00, $00, $00, $03, Script_059_469d
	objects_end

Script_059_4785::
	setmappredef $18
	setplayerchar $00 ; TEMP
	face FACE_UP
	setmap MAP_SACREDTREE_VILLAGE_3F, $02
	stext text_59_6de8
	spriteface  2, FACE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spritewalk  2, MOVE_RIGHT
	spriteface  2, FACE_UP
	delay $03, $10 ; TEMP
	spriteface  2, FACE_LEFT
	spritewalk  2, MOVE_LEFT
	spritewalk  2, MOVE_LEFT
	spriteface  2, FACE_DOWN
	stext text_59_6e14
	stext text_59_6e54
	scr_48 $02, $18
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $3f, $02
	stext text_59_6e63
	clearplayerpos
	spritewalk  2, MOVE_DOWN
	clearobject $02 ; TEMP
	spriteface  3, FACE_RIGHT
	spritewalk  3, MOVE_RIGHT
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	clearobject $03 ; TEMP
	loadscriptedmon $06
	scr_62 $06, $01 ; TEMP
	stext text_59_6eed
	stext text_59_6f05
	setbit wEventFlags + 14, $01
	end

ObjSprite_59_47e1::
	object_event $48, 16,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

ObjSprite_59_47ed::
	object_event $48,  7,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

ObjSprite_59_47f9::
	object_event $48,  9,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

ObjSprite_59_4805::
	object_event $48,  8,  0, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_4811::
	checkbit wEventFlags + 14, $02, Script_059_481b
	setmap MAP_G4_29, $00
	end

Script_059_481b::
	setmap MAP_SACREDTREE_VILLAGE_55, $00
	end

Script_059_481f::
	checkbit wEventFlags + 13, $02, Script_059_4826
	end

Script_059_4826::
	face FACE_LEFT
	farjump unk_059_4839
	checkbit wEventFlags + 13, $02, Script_059_4833
	end

Script_059_4833::
	face FACE_UP
	farjump unk_059_4839

unk_059_4839::
	checkbit wEventFlags + 14, $02, Script_059_4867
	loadobjsprite ObjSprite_59_47e1
	loadobjsprite ObjSprite_59_47ed
	objmove $03, MovementData_059_7c17
	clearobject $03 ; TEMP
	loadobjsprite ObjSprite_59_47f9
	objmove $03, MovementData_059_7c17
	clearobject $03 ; TEMP
	loadobjsprite ObjSprite_59_4805
	objmove $03, MovementData_059_7c17
	clearobject $03 ; TEMP
	setmap MAP_SACREDTREE_VILLAGE_55, $02
	setbit wEventFlags + 14, $02
	setmappredef $19
	end

Script_059_4867::
	stext text_59_6415
	scr_48 $02, $15
	end

Script_059_486e::
	end

Script_059_486f::
	checkbit wEventFlags + 23, $05, Script_059_486e
	face FACE_LEFT
	farjump unk_059_4887
	checkbit wEventFlags + 23, $05, Script_059_486e
	face FACE_UP
	farjump unk_059_4887

unk_059_4887::
	stext text_59_6415
	scr_48 $02, $15
	setbit wEventFlags + 23, $05
	end

ObjSprite_59_4892::
	object_event $62, 16,  5, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

ObjSprite_59_489e::
	object_event $62, 16,  6, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

Script_059_48aa::
	loadobjsprite ObjSprite_59_4892
	farjump unk_059_48b4
	loadobjsprite ObjSprite_59_489e

unk_059_48b4::
	spriteface  3, FACE_LEFT
	spritewalk  3, MOVE_LEFT
	stext text_59_6f79
	startbattle BattleData_02d_4ca4
	checkbit wEventFlags + 3, $03, Script_059_48e4
	clearobject $03 ; TEMP
	stext text_59_6f9e
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_59_700f
	emote  0, EMOTE_TEAR
	delay $03, $20 ; TEMP
	stext text_59_70c9
	setbit wEventFlags + 14, $03
	setmappredef $1a
	end

Script_059_48e4::
	face FACE_LEFT
	setmap MAP_SACREDTREE_VILLAGE_55, $02
	end
