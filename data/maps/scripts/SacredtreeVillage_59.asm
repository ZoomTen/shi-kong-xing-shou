SacredtreeVillage_59_ObjectEvents::
	object_event $1b, 6, 4, 0, $00, $00, $0b, $00, Script_05a_4375
	objects_end

Script_05a_4375::
	checkbit wEventFlags + 13, $02, Script_05a_437f
	textface text_5a_5cb0
	end

Script_05a_437f::
	checkbit wEventFlags + 13, $04, Script_05a_438d
	textface text_5a_611e
	setbit wEventFlags + 13, $03
	end

Script_05a_438d::
	checkbit wEventFlags + 13, $05, Script_05a_4397
	textface text_5a_61fa
	end

Script_05a_4397::
	textface text_5a_6241
	end
