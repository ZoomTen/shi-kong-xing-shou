MACRO assert_valid_rgb
rept _NARG
	assert 0 <= (\1) && (\1) <= 31, "RGB channel must be 0-31"
	shift
endr
ENDM

MACRO RGB
rept _NARG / 3
	assert_valid_rgb \1, \2, \3
	dw palred (\1) + palgreen (\2) + palblue (\3)
	shift 3
endr
ENDM

DEF palred   EQUS "(1 << 0) *"
DEF palgreen EQUS "(1 << 5) *"
DEF palblue  EQUS "(1 << 10) *"

DEF palettes EQUS "* PALETTE_SIZE"
DEF palette  EQUS "+ PALETTE_SIZE *"
DEF color    EQUS "+ PAL_COLOR_SIZE *"

DEF tiles EQUS "* LEN_2BPP_TILE"
DEF tile  EQUS "+ LEN_2BPP_TILE *"

DEF hlcoord EQUS "coord hl,"
DEF bccoord EQUS "coord bc,"
DEF decoord EQUS "coord de,"

MACRO coord
; register, x, y[, origin]
	if _NARG < 4
	ld \1, (\3) * SCREEN_WIDTH + (\2) + wTilemap
	else
	ld \1, (\3) * SCREEN_WIDTH + (\2) + \4
	endc
ENDM

DEF hlbgcoord EQUS "bgcoord hl,"
DEF bcbgcoord EQUS "bgcoord bc,"
DEF debgcoord EQUS "bgcoord de,"

MACRO bgcoord
; register, x, y[, origin]
	if _NARG < 4
	ld \1, (\3) * BG_MAP_WIDTH + (\2) + vBGMap0
	else
	ld \1, (\3) * BG_MAP_WIDTH + (\2) + \4
	endc
ENDM
