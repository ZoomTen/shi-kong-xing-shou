Script_058_40eb::
	warppowerplant
	end

Script_058_40ed::
	randomwarp
	setmap MAP_G4_20, $00
	end

Script_058_40f2::
	warp6c
	checkbit wEventFlags + 11, $05, Script_058_40fd
	setmap MAP_G4_17, $00
	end

Script_058_40fd::
	setmap MAP_G4_50, $00
	end
