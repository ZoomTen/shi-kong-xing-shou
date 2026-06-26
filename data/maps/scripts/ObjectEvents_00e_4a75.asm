ObjectEvents_00e_4a75::
	object_event $2a,  2,  2, wEventFlags + $18, $05, $00, $00, $00, Script_00e_4a81
	objects_end

Script_00e_4a81::
	emote $02, $00
	delay $03, $20
	stext text_0e_6784
	startbattle BattleData_02d_4af3
	checkbit wEventFlags + 3, $03, Script_00e_4a45
	stext text_0e_67ae
	spriteface $02, $03
	objmove $02, Script_0e_7e69
	clearobject $02
	move MovementData_OneUp
	clearplayerpos
	spriteface $01, $01
	spritewalk $01, $02
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	spritewalk $01, $02
	spriteface $01, $03
	stext text_0e_67e0
	setbit wEventFlags + 24, $05
	end
