DeathValley_ObjectEvents::
	object_event $0a, 21, 10, wEventFlags + 11, $03, $00, $00, $00, Script_058_4797
	object_event $0b, 21, 11, wEventFlags + 11, $03, $00, $00, $01, Script_058_40e9
	object_event $67, 19, 26, wEventFlags + 11, $05, $00, $00, $00, Script_058_481c
	object_event $22, 18, 26, wEventFlags + 11, $05, $00, $00, $01, Script_058_40e9
	object_event $13, 18, 25, wEventFlags + 11, $05, $00, $00, $02, Script_058_40e9
	object_event $16, 17, 27, wEventFlags + 11, $05, $00, $00, $03, Script_058_40e9
	object_event $18, 17, 26, wEventFlags + 11, $05, $00, $00, $04, Script_058_40e9
	objects_end

Script_058_4797::
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_58_56be
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_56cc
	emote  2, EMOTE_ANGER
	delay $03, $20
	stext text_58_56fe
	startbattle BattleData_02d_4beb
	checkbit wEventFlags + 3, $03, unk_058_4000
	stext text_58_5719
	emote  0, EMOTE_QUESTION
	delay $03, $20
	stext text_58_5736
	stext text_58_575e
	stext text_58_576d
	stext text_58_583a
	stext text_58_5847
	stext text_58_588d
	stext text_58_589d
	stext text_58_58e8
	giveitem ITEMNAMECAT_KEY, KEYITEM_12
	incsteps
	warpmode GAMEMODE_CRYSTAL_CUTSCENE, $16, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	playsound SFX_2c
	runmovement MovementData_00b_41d5
	emote  2, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_58_58f7
	stext text_58_591b
	stext text_58_5939
	clearplayerpos
	spritewalk  2, MOVE_UP
	clearobject $02
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	loadscriptedmon $05
	scr_62 $05, $01
	stext text_58_5967
	stext text_58_5980
	setbit wEventFlags + 11, $03
	end

Script_058_481c::
	spriteface  3, FACE_RIGHT
	spriteface  4, FACE_RIGHT
	spriteface  5, FACE_RIGHT
	spriteface  6, FACE_RIGHT
	stext text_58_59c6
	end
