	const_def

	const script_continue ; $00
MACRO scr_cont
	db script_continue
ENDM

	const script_spriteface ; $01
MACRO scr_spriteface
; sprite ID 0 is player
; sprite ID 1 is follower
; sprite ID 2+ is everything else
	db script_spriteface
	db \1 ; sprite ID
	db \2 ; facing
ENDM

	const script_delay ; $02
MACRO scr_delay
	db script_delay
	db \1 ; mask
	db \2 ; delay
ENDM

	const script_03 ; $03
MACRO scr_03
	db script_03
ENDM

	const script_04 ; $04
MACRO scr_04
	db script_04
	dw \1
ENDM

	const script_face ; $05
MACRO scr_face
	db script_face
	db \1 ; facing
ENDM

	const script_spritewalk ; $06
MACRO scr_spritewalk
; move a sprite in the direction
; specified by MOVE_* in \2
; this does NOT automatically make
; the sprite face the appropriate
; direction
	db script_spritewalk
	db \1
	db \2
ENDM

	const script_07 ; $07
MACRO scr_07
	db script_07
ENDM

	const script_08 ; $08
MACRO scr_08
	db script_08
	db \1
ENDM

	const script_end ; $09
MACRO scr_end
	db script_end
ENDM

	const script_checkbit ; $0a
MACRO scr_checkbit
	db script_checkbit
	dw \1
	db \2
	dw \3
ENDM

	const script_setbit ; $0b
MACRO scr_setbit
	db script_setbit
	dw \1
	db \2
ENDM

	const script_setmap ; $0c
MACRO scr_setmap
; This warps to a map in the same group
; as the map the script is in.
	db script_setmap
	db \1 ; map
	db \2 ; entrance?
ENDM

	const script_movemap ; $0d
MACRO scr_movemap
; Applies movement data to the loaded map.
; It should be used with maps that have
; no associated object events.
	db script_movemap
	dw \1 ; movement data (same as sprite)
ENDM

	const script_0e ; $0e
MACRO scr_0e
	db script_0e
ENDM

	const script_move ; $0f
MACRO scr_move
	db script_move
	dw \1 ; movement data
ENDM

	const script_10 ; $10
MACRO scr_10
	db script_10
ENDM

	const script_11 ; $11
MACRO scr_11
	db script_11
	dw \1
ENDM

	const script_12 ; $12
MACRO scr_12
	db script_12
ENDM

	const script_13 ; $13
MACRO scr_13
	db script_13
	dw \1, \2
ENDM

	const script_text ; $14
MACRO scr_text
	db script_text
	dw \1 ; text
ENDM

	const script_emote ; $15
MACRO scr_emote
	db script_emote
	db \1 ; sprite?
	db \2 ; emote
ENDM

	const script_16 ; $16 load sprite definitions?
MACRO scr_16
	db script_16
	dw \1
ENDM

	const script_17 ; $17
MACRO scr_17
	db script_17
	db \1, \2, \3
ENDM

	const script_18 ; $18
MACRO scr_18
	db script_18
	db \1
	dw \1
	db \2, \3 ; XXX variable?
ENDM

	const script_19 ; $19
MACRO scr_19
	db script_19
	db \1, \2 ; XXX variable?
ENDM

	const script_1a ; $1a
MACRO scr_1a
	db script_1a
	db \1, \2, \3, \4
ENDM

	const script_1b ; $1b
MACRO scr_1b
	db script_1b
	db \1
ENDM

	const script_1c ; $1c
MACRO scr_1c
	db script_1c
	db \1
ENDM

	const script_1d ; $1d
MACRO scr_1d
	db script_1d
	db \1
ENDM

	const script_1e ; $1e
MACRO scr_1e
	db script_1e
	db \1, \2
ENDM

	const script_1f ; $1f
MACRO scr_1f
	db script_1f
	db \1
ENDM

	const script_20 ; $20
MACRO scr_20
	db script_20
ENDM

	const_def $24

	const script_24 ; $24
MACRO scr_24
	db script_24
ENDM

	const script_25 ; $25
MACRO scr_25
	db script_25
ENDM

	const_def $2a

	const script_farjump ; $2a
MACRO scr_farjump
	db script_farjump
	dba \1
ENDM

	const_def $2e

	const script_2e ; $2e
MACRO scr_2e
	db script_2e
	db \1, \2, \3
ENDM

	const_def $30

	const script_30 ; $30
MACRO scr_30
	db script_30
	db \1, \2 ; pointer?
ENDM

	const_def $33

	const script_33 ; $33
MACRO scr_33
	db script_33
	db \1
ENDM

	const script_34 ; $34
MACRO scr_34
	db script_34
	db \1 ; cutscene
	db \2 ; map number
	db \3 ; warp number
ENDM
	const script_35 ; $35
MACRO scr_35
	db script_35, \1
ENDM
	const script_36 ; $36
MACRO scr_36
	db script_36
ENDM

	const script_37 ; $37
MACRO scr_37
	db script_37
ENDM

	const_def $3b

	const script_3b ; $3b
MACRO scr_3b
	db script_3b
	dw \1
ENDM

	const_def $3e

	const script_jump ; $3e
MACRO scr_jump
	db script_jump
	dw \1
ENDM

	const_def $44

	const script_44 ; $44
MACRO scr_44
	db script_44
ENDM

	const_def $48

	const script_48 ; $48
MACRO scr_48
	db script_48
	db \1
	db \2
ENDM

	const_def $4a

	const script_4a ; $4a
MACRO scr_4a
	db script_4a
	db \1
ENDM

	const_def $4d

	const script_4d ; $4d
MACRO scr_4d
	db script_4d
	db \1, \2
ENDM

	const script_4e ; $4e
MACRO scr_4e
	db script_4e
	db \1
	dw \2
ENDM

	const_def $52

	const script_52 ; $52
MACRO scr_52
	db script_52
ENDM

	const_def $5e

	const script_5e ; $5e
MACRO scr_5e
	db script_5e
	db \1 ; follower
ENDM

	const script_5f ; $5f
MACRO scr_5f
	db script_5f
ENDM

	const_def $61

	const script_61 ; $61
MACRO scr_61
	db script_61
ENDM

	const_def $62

	const script_62 ; $62
MACRO scr_62
	db script_62
	db \1, \2
ENDM

	const script_63 ; $63
MACRO scr_63
	db script_63
	db \1
	dw \2
ENDM

	const_def $65

	const script_65 ; $65
MACRO scr_65
	db script_65
	db \1
ENDM

	const_def $69

	const script_69 ; $69
MACRO scr_69
	db script_69
ENDM

	const_def $6f
	const script_6f
MACRO scr_6f
	db script_6f
ENDM

	const_def $77
	const script_77
MACRO scr_77
	db script_77
ENDM
