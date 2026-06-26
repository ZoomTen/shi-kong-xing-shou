ObjectEvents_05a_44cd::
	object_event $6b,  5,  0, 0, $00, $00, $00, $00, Script_05a_40bc
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
RadarStation_ObjectEvents::
	object_event $50,  5,  3, wEventFlags + 13, $07, $00, $00, $00, Script_05a_44e5
	objects_end

Script_05a_44e5::
	walkpath
	face FACE_UP
	dirmovement
	spriteface  1, FACE_UP
	stext text_5a_6663
	startbattle BattleData_02d_4cf1
	checkbit wEventFlags + 3, $03, unk_05a_4000
	stext text_5a_66f0
	spriteface  2, FACE_UP
	objmove $02, MovementData_05a_77d4
	clearobject $02 ; TEMP
	loadobjsprite ObjectEvents_05a_44cd
	objmove $02, MovementData_05a_776a
	clearobject $02 ; TEMP
	stext text_5a_673a
	giveitem ITEMNAMECAT_KEY, KEYITEM_17
	emote  0, EMOTE_QUESTION
	delay $03, $20 ; TEMP
	stext text_5a_674d
	setbit wEventFlags + 13, $07
	end
