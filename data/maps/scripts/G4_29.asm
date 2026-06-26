G4_29_ObjectEvents::

SacredtreeVillage_55_ObjectEvents::
	object_event $16, 13,  4, 0, $00, $00, $00, $00, Script_059_444a
	objects_end

Script_059_444a::
	checkbit wEventFlags + 12, $03, Script_059_4454
	textface text_59_5279
	end

Script_059_4454::
	checkbit wEventFlags + 14, $02, Script_059_4462
	textface text_59_52c3
	setbit wEventFlags + 12, $04
	end

Script_059_4462::
	textface text_59_6f51
	end

Script_059_4466::
	ifcharindex $01, Script_059_446b
	end

Script_059_446b::
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	setattach $01, $00, $f0, $00 ; TEMP
	playsound SFX_41
	objmove $00, MovementData_059_7ac9
	clearattach $01 ; TEMP
	spriteface  1, FACE_RIGHT
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_LEFT
	end

Script_059_448d::
	ifcharindex $01, Script_059_4492
	end

Script_059_4492::
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	setattach $01, $00, $f0, $00 ; TEMP
	playsound SFX_41
	objmove $00, MovementData_059_7b0a
	clearattach $01 ; TEMP
	spriteface  1, FACE_LEFT
	spritewalk  1, MOVE_LEFT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_RIGHT
	end

ObjSprite_59_44b4::
	object_event $6e,  5,  3, 0, $00, $00, $00, $00, Script_059_40c9
	objects_end

ObjSprite_59_44c0::
	object_event $6e,  5,  2, 0, $00, $00, $00, $01, Script_059_40c9
	objects_end

ObjSprite_59_44cc::
	object_event $6e,  5,  1, 0, $00, $00, $00, $02, Script_059_40c9
	objects_end

ObjSprite_59_44d8::
	object_event $6e,  5,  0, 0, $00, $00, $00, $03, Script_059_40c9
	objects_end

Script_059_44e4::
	checkbit wEventFlags + 12, $06, Script_059_44eb
	end

Script_059_44eb::
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	loadobjsprite ObjSprite_59_44b4
	loadobjsprite ObjSprite_59_44c0
	loadobjsprite ObjSprite_59_44cc
	loadobjsprite ObjSprite_59_44d8
	move MovementData_OneUp
	setmap MAP_G4_1A, $00
	end
