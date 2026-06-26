StardreamMachineRoom_0d_ObjectEvents::
	object_event $0e,  4,  2, 0, $00, $00, $00, $00, Script_066_4bc5
	object_event $0f,  4,  3, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end

StardreamMachineRoom_0d_ObjectEvents2::
	object_event $6f,  4,  2, 0, $00, $00, $00, $00, Script_066_4bc9
	object_event $0f,  4,  3, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end

Script_066_4c8f::
	checkbit wEventFlags + 15, $05, Script_066_4c96
	end

Script_066_4c96::
	stext text_66_7bbc
	farjump2 Script_067_6e06
	end

Script_066_4c9e:: ; farjump2 target (bank_67)
	setmap MAP_STARDREAM_CITY_07, $04
	end
