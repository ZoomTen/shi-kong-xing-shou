SacredtreeVillage_57_ObjectEvents::
	object_event $20,  7,  6, 0, $00, $00, $0b, $00, Script_05a_430a
	objects_end

Script_05a_430a::
	checkbit wEventFlags + 13, $03, Script_05a_4314
	textface text_5a_5b68
	end

Script_05a_4314::
	checkbit wEventFlags + 13, $04, Script_05a_433d
	textface text_5a_6273
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_62a5
	startbattle BattleData_02d_4cc3
	checkbit wEventFlags + 3, $03, unk_05a_4000
	stext text_5a_62e8
	stext text_5a_6311
	scr_48 $02, $16
	setbit wEventFlags + 13, $04
	end

Script_05a_433d::
	textface text_5a_6321
	end
