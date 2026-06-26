EastFishmarketUndersea_13_ObjectEvents::
	object_event $54,  2,  4, 0, $00, $00, $00, $00, Script_055_587c
	object_event $55,  9,  4, 0, $00, $00, $00, $01, Script_055_58aa
	object_event $53,  7,  2, 0, $00, $00, $00, $02, Script_055_58bf
	objects_end

Script_055_5862::
	ifcharindex $03, Script_055_586f
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_55_64e9
	end

Script_055_586f::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_55_67b7
	farjump Script_055_5887
	end

Script_055_587c::
	ifcharindex $03, Script_055_5884
	textface text_55_64e9
	end

Script_055_5884::
	textface text_55_67b7

Script_055_5887::
	checkbit wEventFlags + 3, $03, Script_055_588f
	scr_37
	end

Script_055_588f::
	end

Script_055_5890::
	ifcharindex $03, Script_055_589d
	face FACE_RIGHT
	spriteface  3, FACE_LEFT
	stext text_55_64f1
	end

Script_055_589d::
	face FACE_RIGHT
	spriteface  3, FACE_LEFT
	stext text_55_683c
	farjump Script_055_58b5
	end

Script_055_58aa::
	ifcharindex $03, Script_055_58b2
	textface text_55_64f1
	end

Script_055_58b2::
	textface text_55_683c

Script_055_58b5::
	checkbit wEventFlags + 4, $01, Script_055_58be
	scr_35 $06
	end

Script_055_58be::
	end

Script_055_58bf::
	textface text_55_53c5
	checkbit wEventFlags + 3, $03, Script_055_58ca
	townmusicanim
	end

Script_055_58ca::
	end
