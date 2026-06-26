; TODO: structured data table (not graphics), classify records
unk_05a_4000::
	end

SacredtreeShop_5d_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_05a_400d
	objects_end

Script_05a_400d::
	textface text_5a_40a5
	end

Script_05a_4011::
	face FACE_LEFT
	spriteface 2, FACE_RIGHT
	stext text_5a_40a5
	checkbit wEventFlags + 4, $01, Script_05a_4022
	scr_35 $08
	end

Script_05a_4022::
	end
