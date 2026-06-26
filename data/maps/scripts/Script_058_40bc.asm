Script_058_40bc::
	setmap MAP_GEOTHERMAL_CITY_14, $08
	checkbit wEventFlags + 9, $04, Script_058_40da
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20 ; TEMP
	stext text_58_4a88
	setbit wEventFlags + 9, $04
	setmappredef $16
	end

Script_058_40da::
	end

Script_058_40db::
	setmap MAP_G4_1E, $01
	end

Script_058_40df::
	farjump2 Script_05c_4058
	end

Script_058_40e4::
	farjump2 Script_059_40c5
	end

Script_058_40e9::
	end
