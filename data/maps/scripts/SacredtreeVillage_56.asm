SacredtreeVillage_56_ObjectEvents::
	object_event $18,  5,  4, 0, $00, $00, $07, $00, Script_05a_42df
	objects_end

Script_05a_42df::
	checkbit wEventFlags + 13, $04, Script_05a_42e9
	textface text_5a_5ac1
	end

Script_05a_42e9::
	checkbit wEventFlags + 13, $05, Script_05a_42fa
	textface text_5a_634a
	takeitem ITEMNAMECAT_KEY, KEYITEM_16
	setbit wEventFlags + 13, $05
	end

Script_05a_42fa::
	textface text_5a_634a
	end
