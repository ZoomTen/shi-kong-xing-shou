EastFishmarketShop_ObjectEvents::
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_05c_406d
	objects_end

Script_05c_406d::
	textface text_5c_4105
	end

Script_05c_4071::
	face FACE_LEFT
	spriteface  2, FACE_RIGHT
	stext text_5c_4105
	checkbit wEventFlags + 4, $01, Script_05c_4082
	scr_35 $05
	end

Script_05c_4082::
	end
