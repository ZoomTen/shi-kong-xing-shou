StardreamAirship_18_ObjectEvents::
	object_event $62,  7,  3, wEventFlags + 14, $07, $00, $00, $00, Script_066_4182
	objects_end

Script_066_4182::
	textface text_66_4dd7
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_66_4dee
	stext text_66_4e0b
	startbattle BattleData_02d_4d1f
	checkbit wEventFlags + 3, $03, Script_066_41f1
	clearobject $02
	setbit wEventFlags + 14, $07
	setplayerchar $00
	face FACE_RIGHT
	warpmode GAMEMODE_AIRPORT_CUTSCENE4, $1b, $02
	spriteface  2, FACE_LEFT
	stext text_66_4e17
	end
