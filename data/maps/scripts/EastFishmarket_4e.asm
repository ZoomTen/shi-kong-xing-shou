EastFishmarket_4e_ObjectEvents::
	object_event $65,  5,  3, 0, $00, $00, $00, $00, Script_05c_411c
	object_event $16,  5,  6, 0, $00, $00, $00, $01, Script_05c_41c8
	objects_end

Script_05c_41c8::
	textface text_5c_47fc
	checkbit wEventFlags + 8, $06, Script_05c_41d2
	end

Script_05c_41d2::
	spriteface  3, FACE_UP
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_485a
	stext text_5c_486f
	loadobjsprite ObjSprite_5c_4205
	objmove $04, MovementData_05c_5106
	spriteface  4, FACE_UP
	stext text_5c_4889
	stext text_5c_48a2
	emote  0, EMOTE_EXCLAMATION
	delay $03, $20
	stext text_5c_48c2
	objmove $04, MovementData_05c_51a8
	clearobject $04
	setbit wEventFlags + 9, $01
	end

ObjSprite_5c_4205::
	object_event $56,  5,  8, 0, $00, $00, $00, $02, Script_05c_411c
	objects_end

Script_05c_4211::
	textface text_5c_4ddb
	end

Script_05c_4215::
	ifcharindex $00, Script_05c_421d
	textface text_5c_4dcc
	end

Script_05c_421d::
	checkbit wEventFlags + 9, $00, Script_05c_4231
	textface text_5c_4d57
	stext text_5c_4d90
	giveitem ITEMNAMECAT_ITEM, ITEM_11
	setbit wEventFlags + 9, $00
	end

Script_05c_4231::
	textface text_5c_4da1
	end

Script_05c_4235::
	textface text_5c_4ce1
	ifcharindex $04, Script_05c_423d
	end

Script_05c_423d::
	stext text_5c_4d27
	end

Script_05c_4241::
	textface text_5c_4c5e
	ifcharindex $04, Script_05c_4249
	end

Script_05c_4249::
	stext text_5c_4ca6
	stext text_5c_4cd1
	end

Script_05c_4250::
	textface text_5c_4c42
	end
