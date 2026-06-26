EastFishmarketUndersea_0e_ObjectEvents::
	object_event $61,  2,  2, wEventFlags + 8, $04, $00, $00, $00, Script_055_53f0
	object_event $61,  3,  2, wEventFlags + 8, $04, $00, $00, $01, Script_055_53f0
	objects_end

EastFishmarketUndersea_0e_ObjectEvents2::
	object_event $61,  2,  2, wEventFlags + 8, $04, $00, $00, $00, Script_055_53f0
	object_event $61,  3,  2, wEventFlags + 8, $04, $00, $00, $01, Script_055_53f0
	object_event $4a,  2,  3, wEventFlags + 8, $04, $00, $00, $02, Script_055_5666
	objects_end

; TODO: unreferenced data block, classify type
unk_055_5658::
	checkbit wEventFlags + 8, $03, Script_055_5662
	setmap MAP_EAST_FISHMARKET_UNDERSEA_0E, $01
	end

Script_055_5662::
	setmap MAP_EAST_FISHMARKET_UNDERSEA_0E, $03
	end

Script_055_5666::
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
	setmap MAP_G4_0F, $02
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

G4_0F_ObjectEvents2::
	object_event $4a,  6,  4, wEventFlags + 8, $04, $00, $00, $00, Script_055_53f0
	objects_end

G4_05_ObjectEvents2::
	object_event $4a,  5,  7, 0, $00, $00, $00, $00, Script_055_53f0
	object_event $1e,  6,  3, 0, $00, $00, $00, $01, Script_055_53f0
	object_event $4c,  6,  6, 0, $00, $00, $00, $02, Script_055_53f0
	objects_end

; $155704

ObjSprite_055_5704::
	object_event $48,  6,  3, 0, $00, $00, $00, $00, Script_055_53f0
	objects_end

ObjSprite_055_5710::
	object_event $56,  6,  0, 0, $00, $00, $00, $00, Script_055_53f0
	objects_end

Script_055_571c::
	end

Script_055_571d::
	setmap MAP_G4_05, $00
	end

Script_055_5721::
	checkbit wEventFlags + 8, $05, Script_055_571d
	setplayerchar $00
	setmap MAP_G4_05, $01
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
	giveitem ITEMNAMECAT_KEY, KEYITEM_0f
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
	setmap MAP_G4_0F, $01
	end

Script_055_5823::
	face FACE_DOWN
	setmap MAP_G4_04, $00
	end

SacredtreeStardreamDeparture_ObjectEvents2::
	object_event $4d,  6,  4, 0, $00, $00, $00, $00, Script_055_53f0
	object_event $62,  6,  5, 0, $00, $00, $00, $01, Script_055_53f0
	objects_end
