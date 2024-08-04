MACRO map
; \1 = map name
\1_Header:
	db BANK(\1_MapAttributes)
	ds 3
	dw \1_MapAttributes
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

MACRO map_attributes
; \1 = map name
; \2 = map ID
; \3 = tileset 1
; \4 = tileset 2
\1_MapAttributes::
	db \2_WIDTH, \2_HEIGHT
	dw \1_Layout
	dw \1_Blocks
	dw \1_Metatiles
	dw \1_AttrMap
	dw \1_Palettes
	dw \3, \4
	dw 0 ; ??
	dw \1_Collision
ENDM

MACRO map_attr_data ; temporary measure
; \1 = width|height, e.g. $0D12 == $0D $12
; \2 = layout location
; \3 = block location
; \4 = metatile location
; \5 = attrmap location
; \6 = palette location
; \7 = tileset 1
; \8 = tileset 2
; \9 = collision location
	db (\1 >> 8 & $ff), (\1 & $ff)
	dw \2, \3, \4, \5, \6
	dw \7, \8
	dw 0
	dw \9
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
