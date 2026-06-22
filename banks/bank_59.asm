; TODO: structured data table (not graphics), classify records
unk_059_4000:
	setmap $2a, $00
	end
Script_059_4004:
	end
; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_41_ObjectEvents:
	dr $164005, $164027

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_40_ObjectEvents:
	dr $164027, $1640c9
Script_059_40c9::
	end

G4_1A_ObjectEvents:
G4_1B_ObjectEvents:
G4_1C_ObjectEvents:
G4_1D_ObjectEvents2:
G4_2A_ObjectEvents:
G4_2B_ObjectEvents:
G4_53_ObjectEvents:
G4_54_ObjectEvents:
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_25_ObjectEvents:
	dr $1640cb, $164119

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_3A_ObjectEvents:
	dr $164119, $164125

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_3B_ObjectEvents:
	dr $164125, $16413c

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_3C_ObjectEvents:
	dr $16413c, $164153

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_3D_ObjectEvents:
	dr $164153, $16416a

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_3F_ObjectEvents:
	dr $16416a, $1642be

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_3F_ObjectEvents2:
	dr $1642be, $16442e

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_3E_ObjectEvents:
	dr $16442e, $16443e

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_29_ObjectEvents:
G4_55_ObjectEvents:
	dr $16443e, $164504

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_1D_ObjectEvents:
	dr $164504, $1645b2

G4_24_ObjectEvents4:
	object_event $4d,  6,  3, 0, $00, $00, $00, $00, Script_059_40c9
	object_event $62,  6,  4, 0, $00, $00, $00, $01, Script_059_40c9
	object_event $62,  7,  4, 0, $00, $00, $00, $02, Script_059_40c9
	objects_end

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_24_ObjectEvents:
	dr $1645d4, $164686

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_24_ObjectEvents5:
	dr $164686, $16471f

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_21_ObjectEvents:
	dr $16471f, $164736

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_22_ObjectEvents:
	dr $164736, $164758

; TODO: object_event array + interleaved scripts/text - per-bank carve
G4_23_ObjectEvents:
	dr $164758, $167d00

