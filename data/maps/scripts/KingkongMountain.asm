; TODO: object_event array + interleaved scripts/text - per-bank carve
KingkongMountain_ObjectEvents::
	object_event $62,  8,  3, wEventFlags + 18, $07, $00, $00, $00, Script_06c_4722
	objects_end

Script_06c_4722::
	textface text_6c_5f63
	startbattle BattleData_02d_4efb
	checkbit wEventFlags + 3, $03, Script_06c_473a
	clearobject $02
	setbit wEventFlags + 18, $07
	stext text_6c_5f78
	giveitem ITEMNAMECAT_KEY, KEYITEM_26

Script_06c_473a::
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G6_0D_ObjectEvents2::
	object_event $0e,  6,  5, wEventFlags + 24, $02, $00, $00, $00, Script_06c_4706
	object_event $0f,  6,  6, wEventFlags + 24, $02, $00, $00, $01, Script_06c_4706
	objects_end

Script_06c_4752::
	setplayerchar $00
	face FACE_DOWN
	warpmode GAMEMODE_FLOATING_ISLAND_CUTSCENE2, $0d, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_6c_50fe
	playsound SFX_4d
	delay $03, $08
	playsound SFX_4d
	delay $03, $08
	playsound SFX_4d
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_6c_5137
	warpmode GAMEMODE_WORLD_MAP2, $0d, $01
	spriteface  2, FACE_UP
	spriteface  3, FACE_UP
	stext text_6c_5151
	clearplayerpos
	spritewalk  2, MOVE_UP
	clearobject $02
	spritewalk  3, MOVE_UP
	spritewalk  3, MOVE_UP
	clearobject $03
	setbit wEventFlags + 24, $02
	end
