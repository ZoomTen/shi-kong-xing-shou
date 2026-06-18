# Overworld Data

## Map Definitions

Split into map groups. Defined in `LoadMapData.MapGroupPointers`.

### Map Group
Map group = table of map headers. Ex: `Group00_Maps`, at `$1c000 (07:4000)`:
```
$1C000	5A 40	dw BellVillage1_Header ; -> 07:405a
$1C002	5A 40	dw BellVillage1_Header ; -> 07:405a
$1C004	CC 40	dw BellSchoolOutside1_Header ; -> 07:40cc
$1C006	EA 40	dw BellObservatoryOutside1_Header ; -> 07:40ea
$1C008	08 41	dw BallotsHouse1_Header ; -> 07:4108
$1C00A	4A 41	dw HayatosHouse1_Header ; -> 07:414a
```

### Map Header
Map header = one map attribute pointer (6 bytes) + several "warp" structs (12 bytes each). Warp also defines which objects and map events (signposts, warp points, scripts) run on map load.
```
$1C1EC	01		db BANK(BellSchoolNorthClassroom_MapAttributes)
$1C1EE	00 00 00	db 0, 0, 0 ; ?
$1C1F0	C8 40		dw BellSchoolNorthClassroom_MapAttributes

; warp number 0
; Spawn position
	$1C1F2	01	db 1 ; Block view X offset
	$1C1F3	00	db 0 ; Block view Y offset
	$1C1F4	78 40	dw $4078 ; Game Boy sprite position
; Script pointers
	$1C1F6	08		db BANK(BellSchoolNorthClassroom1_ObjectEvents)
	$1C1F8	00 00 00	db 0, 0, 0 ; ?
	$1C1FA	14 44		dw BellSchoolNorthClassroom1_ObjectEvents
	$1C1FC	FA 42		dw BellSchoolNorthClassroom1_MapEvents
; This will load objects from 08:4414
; and load events from 07:42fa

; warp number 1  (same structure as warp 0)
; warp number 2
; etc.
```

**NOTE:** Map events read from SAME BANK as map header!

## Map Events
Array, $FF-terminated, each entry 6 bytes. Byte 1 = event type (defined in `MapEvent_Jumptable`), bytes 2-3 = X and Y positions, rest = map event args.

$EE for byte 2 or 3 (or both) = event runs regardless of player position on that axis. Ex: byte 2 = $EE, byte 3 = $08 -> event always runs when player steps on Y = 8.

For `script_event`, script bank = **Object event** bank.

## Object Events
Array, $88-terminated, each entry 11 bytes. Interacting with object event runs script in same bank.

Rough entry structure:
```
; event 0
$2031D	22	db 22 ; sprite picture ID
$2031E	05	db 5 ; X position
$2031F	06	db 6 ; Y position
$20320	00 00	dw 0 ; RAM flag (0 = none)
$20322	00	db 0 ; unknown
$20323	00	db 0 ; unknown
$20324	00	db 0 ; unknown
$20325	00	db 0 ; unknown
$20326	34 43	dw Script_008_4334 ; script to run when interacted with
; event 1
; event 2
; ...
$203330	88	db objects_end
```
(to be documented)

## Map Attributes

Maps drawn in this hierarchy:
1. **Metatiles** - 16x16px block of 2x2 graphics tiles.
2. **Blocks** - 32x32px units of 2x2 metatiles.
3. **Layout** - area map drawn with 32x32 blocks.

### Map Attribute Header
```
$40DC	12	db 18 ; Map width
$40DD	0C	db 12 ; Map height
$40DE	0D 60	dw TechCity_Layout
$40E0	A2 61	dw TechCity_Blocks
$40E2	E6 60	dw TechCity_Metatiles
$40E4	63 6A	dw TechCity_AttrMap
$40E6	EB 63	dw TechCity_Palettes
$40E8	00 00	dw 0 ; tileset 1
$40EA	70 40	dw Tileset_006_4070 ; tileset 2
$40EC	00 00	dw 0 ; ?
$40EE	33 64	dw TechCity_Collision
```
NOTES:
* If tileset 1 pointer = 0, tileset 2 *always* loaded from bank 6 as Tileset Header data.
* If tileset 1 pointer non-zero, tilesets 1 and 2 come from same bank as header.
	* Tileset 1 loaded as GFX into $9000
	* Tileset 2 loaded as GFX into $8800

### Tileset Header
Array of tileset fragments loaded into VRAM, $FF-terminated.
```
; fragment 0
	$18000	16	db BANK(gfx_016_4000)
	$18001	00 09	dw $9000 ; where in VRAM
	$18003	60 05	dw $560  ; how many bytes
	$18005	00 40	dw gfx_016_4000
; fragment 1
	$18007	16	db BANK(gfx_016_4560)
	$18008	70 95	dw $9570 ; where in VRAM
	$1800A	80 02	dw $280  ; how many bytes
	$1800C	60 45	dw gfx_016_4560
; fragment 2
; fragment 3
; ...
$1800E	FF	db -1 ; end
```

### Layout

Layout starts with single byte loaded into `D0F4` (maybe item-related?), then actual map layout.