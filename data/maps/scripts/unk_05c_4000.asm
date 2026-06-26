unk_05c_4000::
	setmap MAP_G4_06, $00
	end2

Script_05c_4004::
	checkbit wEventFlags + 9, $02, Script_05c_4015
	checkbit wEventFlags + 8, $05, Script_05c_4015
	farjump2 Script_055_5475
	end

Script_05c_4015::
	setmap MAP_G4_44, $02
	end2
