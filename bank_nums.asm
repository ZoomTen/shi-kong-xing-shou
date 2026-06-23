; perhaps to avoid keeping track of bank numbers via a variable
; VF decided it'd rather append bank numbers to the end of each
; bank instead.

MACRO endbank
SECTION "banknum\1", ROMX[$7fff], BANK[\1]
	db BANK(@)
ENDM

DEF i = 1
REPT $40
	endbank {i} ; $01 - $40
	DEF i += 1
ENDR

SECTION "banknum41", ROMX[$7fff], BANK[$41]
	db $42 ; VF moment

DEF i = $42
REPT $32
	endbank {i} ; $42 - $73
	DEF i += 1
ENDR

; bank $74 & $75 missing bank numbers because it's an embedded
; Game Boy ROM for a multicart menu this rip presumably came from.

DEF i = $76
REPT $0a
	endbank {i} ; $76 - $7f
	DEF i += 1
ENDR
