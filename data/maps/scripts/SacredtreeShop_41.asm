SacredtreeShop_41_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_059_4011
	objects_end

Script_059_4011::
	textface text_59_40a9
	end

Script_059_4015::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_59_40a9
	checkbit wEventFlags + 4, $01, Script_059_4026
	scr_35 $08 ; TEMP
	end

Script_059_4026::
	end
