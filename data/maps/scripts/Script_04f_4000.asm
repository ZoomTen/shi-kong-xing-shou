Script_04f_4000::
	end

Script_04f_4001::
	checkbit wEventFlags + 6, $04, .skip
	setmap MAP_BANGLIN_CO_1F, $00
	end
.skip
	farjump2 Script_04e_4001
	end
