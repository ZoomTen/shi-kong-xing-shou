G2_23_ObjectEvents::
	object_event $11,  5,  2, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end

Script_012_4c89::
	object_event $04,  1,  6, 0, $00, $00, $00, $00, Script_012_44cc
	objects_end

Script_012_4c95::
	setplayerchar $00
	setmap MAP_G2_11, $01
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_12_739a
	stext text_12_73c5
	stext text_12_7412
	emote $00, $00
	delay $03, $20
	stext text_12_748c
	stext text_12_7497
	stext text_12_74d8
	stext text_12_74df
	spriteface  2, FACE_DOWN
	objmove $02, MovementData_012_4e4a
	clearobject $02
	face FACE_UP
	setfollower $00
	setmap MAP_G2_23, $00
	stext text_12_74f8
	stext text_12_751b
	stext text_12_755b
	stext text_12_756e
	spriteface  2, FACE_UP
	spritewalk  2, MOVE_UP
	spritewalk  2, MOVE_UP
	clearobject $02
	move MovementData_OneUp
	stext text_12_7576
	face FACE_DOWN
	setfollower $02
	setmap MAP_G2_11, $02
	emote $00, $00
	delay $03, $20
	stext text_12_75b7
	stext text_12_75c0
	loadobjsprite Script_012_4c89
	spriteface  2, FACE_RIGHT
	objmove $02, MovementData_012_4df8
	stext text_12_75ce
	clearplayerpos
	spritewalk  2, MOVE_RIGHT
	clearobject $02
	setbit wEventFlags + 4, $03
	setmappredef MAPPREDEF_09
	end

Script_012_4d14::
	checkbit wEventFlags + 4, $03, Script_012_4d1e
	setmap MAP_GALL_ENTERPRISE, $01
	end2

Script_012_4d1e::
	checkbit wEventFlags + 4, $06, Script_012_4d28
	setmap MAP_GALL_ENTERPRISE, $03
	end2

Script_012_4d28::
	setmap MAP_GALL_ENTERPRISE, $06
	end2

GallEnterprise_ObjectEvents3::
	object_event $2d,  6,  5, 0, $00, $00, $00, $00, Script_012_4d38
	objects_end

Script_012_4d38::
	checkbit wEventFlags + 4, $05, Script_012_4d6d
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	emote $00, $03
	delay $03, $20
	stext text_12_75f9
	emote $02, $00
	delay $03, $20
	stext text_12_763c
	face FACE_LEFT
	move MovementData_OneLeft
	clearplayerpos
	spritewalk  1, MOVE_UP
	spriteface  1, FACE_LEFT
	emote $00, $03
	delay $03, $20
	stext text_12_7696
	end

Script_012_4d6d::
	textface text_12_78bd
	end

Script_012_4d71::
	farjump2 Script_04f_4384
	end

MovementData_012_4d76::
	db $ff, $00, $fe, $00, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff, $fe, $ff
	db $fe, $ff, $fe, $fe, $ff, $fe, $ff, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff
	db $00, $ff, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $02, $ff, $01, $ff, $01, $fe
	db $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $ff, $02, $00, $02, $ff
	db $88

MovementData_012_4db7::
	db $ff, $00, $fe, $00, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01, $fe, $01
	db $fe, $01, $fe, $02, $ff, $02, $ff, $01, $00, $01, $ff, $01, $00, $01, $00, $01
	db $00, $01, $01, $01, $00, $01, $00, $01, $01, $01, $02, $01, $01, $01, $01, $02
	db $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $00, $02, $01
	db $88

MovementData_012_4df8::
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04
	db $88

MovementData_012_4e29::
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc
	db $88

MovementData_012_4e4a::
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
	db $88, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
	db $00, $88

MovementData_012_4f8c::
	db $ff, $ff, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc
	db $fc, $fc, $fc, $fc, $fc, $fc, $fc, $fc, $88

MovementData_012_4fb5::
	db $ff, $00, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe
	db $fc, $fd, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe
	db $fc, $fe, $fc, $fe, $fc, $fe, $fc, $fd, $fc, $fe, $fc, $fe, $88

MovementData_012_4fe2::
	db $ff, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00
	db $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $fc, $00, $88

MovementData_012_500f::
	db $ff, $01, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $02, $fc, $03
	db $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $fc, $03
	db $fc, $03, $fc, $02, $fc, $03, $fc, $03, $fc, $03, $fc, $03, $88

MovementData_012_503c::
	db $ff, $01, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04
	db $fd, $04, $fc, $04, $fd, $04, $fc, $04, $fc, $04, $fd, $04, $fc, $04, $fd, $04
	db $fc, $04, $fc, $04, $fd, $04, $fc, $04, $88

MovementData_012_5065::
	db $01, $ff, $04, $fc, $04, $fc

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_012_506b::
	db $03, $fc, $04, $fc, $03, $fc, $04, $fc, $04, $fc, $03, $fc, $04, $fc, $03, $fc
	db $04, $fc, $04, $fc, $03, $fc, $04, $fc, $03, $fc, $04, $fc, $04, $fc, $03, $fc
	db $04, $fc, $88

MovementData_012_508e::
	db $01, $01, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $04, $04, $04, $04, $04, $04, $04, $04, $88

MovementData_012_50b7::
	db $ff, $00, $fe, $ff, $fe, $00, $fe, $00, $fe, $ff, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $ff, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $00, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $00, $fe, $00, $fe, $00
	db $fe, $01, $fe, $00, $fe, $00, $fe, $01, $fe, $00, $fe, $01, $fe, $01, $88

MovementData_012_50f6::
	db $01, $ff, $01, $fd, $01, $fd, $00, $fd, $00, $fd, $00, $fd, $03, $01, $03, $03
	db $01, $03, $01, $03, $01, $03, $01, $03, $00, $03, $00, $03, $00, $03, $03, $ff
	db $03, $fd, $01, $fd, $01, $fd, $01, $fd, $01, $fd, $00, $fd, $00, $fd, $00, $fd
	db $03, $01, $03, $03, $01, $03, $01, $03, $01, $03, $01, $03, $00, $03, $00, $03
	db $00, $03, $03, $ff, $03, $fd, $01, $fd, $01, $fd, $01, $fd, $01, $fd, $00, $fd
	db $00, $fd, $00, $fd, $03, $01, $03, $03, $01, $03, $01, $03, $01, $03, $01, $03
	db $00, $03, $00, $03, $00, $03, $03, $ff, $03, $fd, $01, $fd, $01, $fd, $01, $fd
	db $88

MovementData_012_5167::
	db $01, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $88
