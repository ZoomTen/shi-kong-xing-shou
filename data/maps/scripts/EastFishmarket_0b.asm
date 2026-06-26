EastFishmarket_0b_ObjectEvents::
	object_event $19, 15,  6, 0, $00, $00, $08, $00, Script_055_5933
	object_event $1c,  4,  7, 0, $00, $00, $0b, $01, Script_055_5937
	object_event $1a, 11,  6, 0, $00, $00, $06, $02, Script_055_593b
	object_event $14,  5, 14, 0, $00, $00, $06, $03, Script_055_593f
	object_event $13, 21, 13, 0, $00, $00, $06, $04, Script_055_5943
	object_event $15,  3, 21, 0, $00, $00, $00, $00, Script_055_5947
	object_event $17,  9, 19, 0, $00, $00, $0b, $01, Script_055_594b
	object_event $16, 15, 21, 0, $00, $00, $0b, $02, Script_055_594f
	object_event $16, 11, 14, 0, $00, $00, $00, $00, Script_055_5953
	objects_end

; TODO: unreferenced data block, classify type
unk_055_545a::
	checkbit wEventFlags + 7, $03, Script_055_5464
	setmap MAP_EAST_FISHMARKET_0C, $00
	end2

Script_055_5464::
	setmap MAP_EAST_FISHMARKET_0C, $03
	end2

Script_055_5468::
	face FACE_DOWN
	move MovementData_OneDown
	clearplayerpos
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_DOWN
	end

Script_055_5475::
	setmap MAP_EAST_FISHMARKET_0C, $02
	end2
