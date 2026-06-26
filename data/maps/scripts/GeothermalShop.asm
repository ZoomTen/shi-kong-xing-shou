; TODO: structured data table (not graphics), classify records
unk_058_4000::
	end

GeothermalShop_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_058_400d
	objects_end

Script_058_400d::
	textface text_58_40a5
	end

Script_058_4011::
	face FACE_LEFT
	spriteface 2, FACE_RIGHT
	stext text_58_40a5
	checkbit wEventFlags + 4, $01, Script_058_4022
	scr_35 $07
	end

Script_058_4022::
	end
