StardreamSchool_26_ObjectEvents::
	object_event $24,  6,  3, 0, $00, $00, $00, $00, Script_066_468c
	objects_end

Script_066_468c::
	checkbit wEventFlags + 15, $01, Script_066_46a4
	textface text_66_56c0
	end

Script_066_4696::
	checkbit wEventFlags + 15, $04, Script_066_46a0
	textface text_66_60dd
	end

Script_066_46a0::
	textface text_66_77d4
	end

Script_066_46a4::
	checkbit wEventFlags + 16, $04, Script_066_4696
	textface text_66_6027
	countflags10 $05, $b2, $46
	end

Script_066_46b2::
	stext text_66_6063
	stext text_66_60cd
	giveitem ITEMNAMECAT_KEY, KEYITEM_1c
	setbit wEventFlags + 16, $04
	end
