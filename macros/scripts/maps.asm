MACRO map
; \1 = map name
; \2 = (optional) MapAttributes to use
\1_Header:
IF _NARG > 1
	db BANK(\2)
	ds 3
	dw \2
ELSE
	db BANK(\1_MapAttributes)
	ds 3
	dw \1_MapAttributes
ENDC
DEF __current_map__ equs "\1"
ENDM

MACRO warp
; \1 = block view X-offset
; \2 = block view Y-offset
; \3 = OAM location
; \4 = object events location
; \5 = map events location
	db \1, \2
	dw \3

if _NARG  > 3
	db BANK(\4)
else
	db BANK({__current_map__}_ObjectEvents)
endc
	ds 3

if _NARG  > 3
	dw \4 ; different bank
else
	dw {__current_map__}_ObjectEvents ; different bank
endc

if _NARG  > 4
	dw \5 ; same bank
else
	dw {__current_map__}_MapEvents ; same bank
endc
ENDM

MACRO end_map
PURGE __current_map__
ENDM

; usage:
;	map_attr BELL_VILLAGE_1, \
;	   XX_Layout, \
;	   XX_Blocks, \
;	   XX_Metatiles, \
;	   XX_Attrmap, \
;	   XX_Palette, \
;	   Tileset_X, Tileset_Y, \
;	   X_Collision
MACRO map_attr
; \1 = map ID
; \2 = layout
; \3 = block
; \4 = metatile
; \5 = attrmap
; \6 = palette
; \7 = tileset 1
; \8 = tileset 2
; \9 = collision
	IF !STRCMP("\7", "0")
	; \7 == 0, tilesets MUST be from BANK("Tilesets")
		assert BANK(\8) == BANK("Tilesets")
	ELSE
	; \7 filled in, both tilesets read from THIS bank
		assert BANK(\7) == BANK(@)
		assert BANK(\8) == BANK(@)
	ENDC
	assert BANK(\2) == BANK(@)
	assert BANK(\3) == BANK(@)
	assert BANK(\4) == BANK(@)
	assert BANK(\5) == BANK(@)
	assert BANK(\6) == BANK(@)

	db \1_WIDTH, \1_HEIGHT
	dw \2, \3, \4, \5, \6, \7, \8, 0, \9
ENDM

MACRO tileset_fragment
; \1 = tileset source
; \2 = VRAM destination
; \3 = number of bytes
	db BANK(\1)
	dw \2, \3
	dw \1
ENDM

MACRO end_tileset
	db -1
ENDM

MACRO credits_screen_layout
; \1 = height
; \2 = width
; \3 = VRAM destination
; \4 = tilemap source
; \5 = attrmap source
	db \1, \2
	dw \3, \4, \5
ENDM
