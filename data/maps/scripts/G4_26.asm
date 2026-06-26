G4_26_ObjectEvents::

SacredtreeVillage_27_ObjectEvents::
	object_event $13, 19, 4, 0, $00, $00, $06, $00, Script_05a_42a3
	object_event $15, 5, 6, 0, $00, $00, $07, $01, Script_05a_42a7
	object_event $14, 13, 8, 0, $00, $00, $08, $02, Script_05a_42ab
	object_event $17, 7, 12, 0, $00, $00, $0a, $03, Script_05a_42b9
	object_event $16, 18, 13, 0, $00, $00, $0a, $04, Script_05a_42bd
	object_event $19, 8, 20, 0, $00, $00, $05, $00, Script_05a_42cb
	object_event $25, 17, 20, 0, $00, $00, $09, $01, Script_05a_42cf
	objects_end

Script_05a_42a3::
	textface text_5a_58a8
	end

Script_05a_42a7::
	textface text_5a_58ba
	end

Script_05a_42ab::
	checkbit wEventFlags + 13, $02, Script_05a_42b5
	textface text_5a_5923
	end

Script_05a_42b5::
	textface text_5a_6087
	end

Script_05a_42b9::
	textface text_5a_595a
	end

Script_05a_42bd::
	checkbit wEventFlags + 13, $02, Script_05a_42c7
	textface text_5a_59ee
	end

Script_05a_42c7::
	textface text_5a_60d2
	end

Script_05a_42cb::
	textface text_5a_5a2f
	end

Script_05a_42cf::
	textface text_5a_5a6b
	end
