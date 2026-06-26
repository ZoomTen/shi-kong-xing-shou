Script_00f_4001::
	end

Script_00f_4002::
	setmap MAP_TECH_CITY, $00
	end

Script_00f_4006::
	setmap MAP_TECH_CITY, $02
	end

Script_00f_400a::
	checkbit wEventFlags + 2, $06, Script_00f_4016
	farjump2 Script_00e_4001
	end

Script_00f_4015::
	end

Script_00f_4016::
	setmap MAP_TECH_CITY, $01
	end
