StardreamCity_0f_ObjectEvents::
	object_event $1b,  2,  6, 0, $00, $00, $00, $00, Script_066_458e
	object_event $21,  8,  4, 0, $00, $00, $06, $01, Script_066_45b6
	objects_end

Script_066_4586::
	spriteface  2, FACE_UP
	farjump Script_066_4591
	end

Script_066_458e::
	spriteface  2, FACE_RIGHT

Script_066_4591::
	checkbit wEventFlags + 15, $02, Script_066_459b
	stext text_66_55a9
	end

Script_066_459b::
	checkbit wEventFlags + 15, $03, Script_066_45b2
	stext text_66_70db
	stext text_66_715f
	giveitem ITEMNAMECAT_KEY, KEYITEM_23
	takeitem ITEMNAMECAT_KEY, KEYITEM_19
	setbit wEventFlags + 15, $03
	end

Script_066_45b2::
	stext text_66_716f
	end

Script_066_45b6::
	textface text_66_55ff
	end
