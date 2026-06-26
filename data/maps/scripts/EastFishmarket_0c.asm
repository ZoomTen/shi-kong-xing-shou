EastFishmarket_0c_ObjectEvents::
	object_event $08,  8,  5, wEventFlags + 7, $02, $01, $00, $00, Script_055_54b3
	object_event $1f,  6,  5, 0, $00, $00, $00, $01, Script_055_5536
	object_event $1e,  6,  7, 0, $00, $00, $00, $02, Script_055_553a
	objects_end

ObjSprite_055_549b::
	object_event $60,  6,  8, 0, $00, $00, $00, $03, Script_055_53f0
	objects_end

ObjSprite_055_54a7::
	object_event $60,  6,  7, 0, $00, $00, $00, $04, Script_055_53f0
	objects_end

Script_055_54b3::
	ifcharindex $00, Script_055_54c1
	emote $02, $04
	delay $03, $20
	textface text_55_645b
	end

Script_055_54c1::
	walkpath
	face FACE_UP
	stext text_55_6326
	stext text_55_6364
	emote $02, $04
	delay $03, $20
	stext text_55_63b0
	loadobjsprite ObjSprite_055_549b
	delay $03, $10
	loadobjsprite ObjSprite_055_54a7
	clearobject $04
	spriteface  5, FACE_UP
	spriteface  6, FACE_LEFT
	spriteface  3, FACE_DOWN
	spritewalk  3, MOVE_DOWN
	spriteface  2, FACE_DOWN
	face FACE_DOWN
	emote $00, $00
	emote $02, $00
	emote $03, $00
	delay $03, $20
	stext text_55_6408
	move MovementData_OneDown
	setattach $06, $05, $f0, $00
	objmove $05, MovementData_055_7c94
	clearobject $05
	clearobject $06
	emote $00, $00
	delay $03, $20
	stext text_55_6452
	face $05
	objmove $00, MovementData_055_7e6b
	clearobject $00
	stext text_55_645b
	setbit wEventFlags + 7, $03
	setmappredef MAPPREDEF_14
	warpmode GAMEMODE_UNDERWATER_PICTURE_CUTSCENE, $12, $01
	emote $00, $00
	delay $03, $20
	stext text_55_6489
	end

Script_055_5536::
	textface text_55_62ff
	end

Script_055_553a::
	textface text_55_62c8
	end
