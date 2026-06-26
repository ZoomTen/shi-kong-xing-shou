SacredtreeVillage_28_ObjectEvents::
	object_event $0c,  7,  5, 0, $00, $00, $00, $00, Script_05a_43bd
	object_event $0d,  7,  4, 0, $00, $00, $00, $01, Script_05a_40bc
	object_event $6a,  6,  4, 0, $00, $00, $00, $02, Script_05a_40bc
	objects_end

Script_05a_43bd::
	checkbit wEventFlags + 13, $01, Script_05a_43f2
	textface text_5a_5d6f
	emote 0, EMOTE_TEAR
	delay $03, $20
	stext text_5a_5dcc
	stext text_5a_5de0
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_5e65
	stext text_5a_5eb7
	stext text_5a_5f03
	spriteface 2, FACE_RIGHT
	emote 2, EMOTE_ANGER
	delay $03, $20
	stext text_5a_5f39
	setbit wEventFlags + 13, $01
	end

Script_05a_43f2::
	checkbit wEventFlags + 14, $00, Script_05a_43ff
	textface text_5a_5fb9
	stext text_5a_6039
	end

Script_05a_43ff::
	walkpath
	face FACE_UP
	dirmovement
	spriteface 1, FACE_UP
	stext text_5a_68fd
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_693f
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	spriteface 2, FACE_LEFT
	spritewalk 2, MOVE_LEFT
	spriteface 2, FACE_DOWN
	stext text_5a_6966
	spriteface 2, FACE_UP
	spritewalk 2, MOVE_UP
	clearobject $02
	spriteface 3, FACE_LEFT
	spritewalk 3, MOVE_LEFT
	clearobject $03
	face FACE_LEFT
	move MovementData_OneLeft
	face FACE_UP
	spriteface 1, FACE_LEFT
	spritewalk 1, MOVE_LEFT
	spriteface 1, FACE_UP
	stext text_5a_69ca
	emote 0, EMOTE_TEAR
	delay $03, $20
	move MovementData_OneUp
	spritewalk 1, MOVE_UP
	move MovementData_OneUp
	clearobject $00
	spritewalk 1, MOVE_UP
	clearobject $01
	stext text_5a_69e4
	spriteface 4, FACE_UP
	delay $03, $10
	objmove $04, MovementData_05a_77d4
	clearobject $04
	setmap MAP_G4_53, $01
	stext text_5a_69fa
	playsound SFX_2c
	runmovement MovementData_00b_4227
	runmovement MovementData_00b_4227
	playsound SFX_2c
	runmovement MovementData_00b_41fe
	runmovement MovementData_00b_41fe
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	farjump2 Script_059_4785
	end

Script_05a_448c::
	face FACE_LEFT
	farjump Script_05a_4498
	face FACE_UP
	farjump Script_05a_4498

Script_05a_4498::
	stext text_5a_604f
	giveitem ITEMNAMECAT_KEY, KEYITEM_15
	checkbit wEventFlags + 13, $01, Script_05a_44a5
	end

Script_05a_44a5::
	checkbit wEventFlags + 13, $02, Script_05a_44be
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote 0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5a_605f
	setbit wEventFlags + 13, $02
	end

Script_05a_44be::
	end

Script_05a_44bf::
	checkbit wEventFlags + 13, $02, Script_05a_44c9
	setmap MAP_G4_26, $01
	end

Script_05a_44c9::
	setmap MAP_SACREDTREE_VILLAGE_27, $01
	end
