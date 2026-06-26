StardreamFlorist_ObjectEvents::
	object_event $23,  8,  2, 0, $00, $00, $00, $00, Script_066_454d
	object_event $25,  5,  4, 0, $00, $00, $06, $01, Script_066_4537
	objects_end

Script_066_4537::
	checkbit wEventFlags + 15, $01, Script_066_4541
	textface text_66_551e
	end

Script_066_4541::
	textface text_66_5f6c
	end

Script_066_4545::
	spriteface  2, FACE_LEFT
	farjump Script_066_454d
	end

Script_066_454d::
	checkbit wEventFlags + 15, $01, Script_066_4557
	stext text_66_5571
	end

Script_066_4557::
	checkbit wEventFlags + 16, $00, Script_066_456b
	stext text_66_5f95
	stext text_66_5fde
	giveitem ITEMNAMECAT_KEY, KEYITEM_1b
	setbit wEventFlags + 16, $00
	end

Script_066_456b::
	stext text_66_5fef
	end
