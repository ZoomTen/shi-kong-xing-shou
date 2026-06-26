EastFishmarket_45_ObjectEvents::
	object_event $1c, 15,  6, wEventFlags + 8, $07, $01, $07, $00, Script_05c_4250
	object_event $14,  4,  7, wEventFlags + 8, $07, $01, $09, $01, Script_05c_4241
	object_event $13,  5, 14, wEventFlags + 8, $07, $01, $00, $02, Script_05c_4235
	object_event $15, 21, 13, wEventFlags + 8, $07, $01, $06, $03, Script_05c_4215
	object_event $17,  9, 20, wEventFlags + 8, $07, $01, $09, $04, Script_05c_4211
	object_event $16, 12, 13, wEventFlags + 8, $07, $00, $00, $00, Script_05c_419f
	objects_end

Script_05c_419f::
	setplayerchar $00
	setmap MAP_EAST_FISHMARKET_4E, $00
	end

EastFishmarket_4e_ObjectEvents2::
	object_event $65,  5,  3, 0, $00, $00, $00, $00, Script_05c_411c
	objects_end
