; TODO: structured data table (not graphics), classify records
unk_058_4000:
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_38_ObjectEvents:
	dr $160001, $160023

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_39_ObjectEvents:
	dr $160023, $1600bc
Script_058_40bc::
	dr $1600bc, $1600e9
Script_058_40e9::
	end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_17_ObjectEvents:
G4_1E_ObjectEvents:
G4_1F_ObjectEvents:
G4_4F_ObjectEvents3:
G4_50_ObjectEvents:
	dr $1600ea, $160101

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_20_ObjectEvents:
	dr $160101, $160139

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_18_ObjectEvents:
	dr $160139, $1601ee

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_52_ObjectEvents:
	dr $1601ee, $160210

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_19_ObjectEvents:
	dr $160210, $1604e2

G4_52_ObjectEvents2:
	object_event $06,  8,  6, 0, $00, $00, $00, $00, Script_058_40e9
	object_event $69,  6,  6, 0, $00, $00, $00, $01, Script_058_40e9
	object_event $69,  6,  7, 0, $00, $00, $00, $02, Script_058_40e9
	object_event $69,  6,  8, 0, $00, $00, $00, $03, Script_058_40e9
	objects_end

G4_19_ObjectEvents2:
	object_event $06,  8,  6, wEventFlags + 24, $01, $00, $00, $00, Script_058_40e9
	object_event $69,  6,  6, wEventFlags + 24, $01, $00, $00, $01, Script_058_40e9
	object_event $69,  6,  7, wEventFlags + 24, $01, $00, $00, $02, Script_058_40e9
	object_event $69,  6,  8, wEventFlags + 24, $01, $00, $00, $03, Script_058_40e9
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_14_ObjectEvents:
	dr $16053c, $1605e9

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_34_ObjectEvents:
	dr $1605e9, $160608

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_35_ObjectEvents:
	dr $160608, $160627

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_37_ObjectEvents:
	dr $160627, $16065d

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_36_ObjectEvents2:
	dr $16065d, $160669

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_36_ObjectEvents:
	dr $160669, $160749

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_16_ObjectEvents:
	dr $160749, $16082c

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_15_ObjectEvents:
	dr $16082c, $160868

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_4F_ObjectEvents:
	dr $160868, $16087f

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_4F_ObjectEvents2:
	dr $16087f, $1609ce

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_24_ObjectEvents3:
	dr $1609ce, $160a1d

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_1E_ObjectEvents2:
	dr $160a1d, $160a45

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_51_ObjectEvents:
	dr $160a45, $162810

