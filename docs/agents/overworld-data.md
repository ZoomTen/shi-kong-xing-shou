# Overworld Data

## Map Definitions

Split into map groups. Defined `LoadMapData.MapGroupPointers`.

### Map Group
Map group = table of map headers. Ex `Group00_Maps` @ `$1c000 (07:4000)`:
```
$1C000	5A 40	dw BellVillage1_Header ; -> 07:405a
$1C002	5A 40	dw BellVillage1_Header ; -> 07:405a
$1C004	CC 40	dw BellSchoolOutside1_Header ; -> 07:40cc
$1C006	EA 40	dw BellObservatoryOutside1_Header ; -> 07:40ea
$1C008	08 41	dw BallotsHouse1_Header ; -> 07:4108
$1C00A	4A 41	dw HayatosHouse1_Header ; -> 07:414a
```

### Map Header
Map header = 1 attribute pointer (6 bytes) + N "warp" structs (12 bytes each). Warp also defines which objects + map events (signposts, warp points, scripts) run on map load.
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
Array, $FF-terminated, 6 bytes each. Byte 1 = event type (in `MapEvent_Jumptable`), bytes 2-3 = X,Y pos, rest = event args.

$EE for byte 2 or 3 (or both) = event ignores player pos on that axis. Ex byte 2 = $EE, byte 3 = $08 → always runs at Y = 8.

For `script_event`, script bank = **Object event** bank.

## Object Events
Array, $88-terminated, 11 bytes each. Interact runs script in same bank.

Entry structure:
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

Map draw hierarchy:
1. **Metatiles** - 16x16px block of 2x2 graphics tiles.
2. **Blocks** - 32x32px unit of 2x2 metatiles.
3. **Layout** - area map of 32x32 blocks.

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
* Tileset 1 ptr = 0 → tileset 2 *always* from bank 6 as Tileset Header data.
* Tileset 1 ptr ≠ 0 → tilesets 1, 2 from header's bank.
	* Tileset 1 → GFX into $9000
	* Tileset 2 → GFX into $8800

### Tileset Header
Tileset fragments into VRAM, $FF-terminated array.
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

Layout starts with 1 byte into `D0F4` (maybe item-related?), then map layout.

## Converting a map group's headers to `map`/`warp` macros

Raw headers (`dbaw2` attr + manually-expanded 12-byte warp structs, each commented
with its `warp` line) → macro form in `macros/scripts/maps.asm`. See
`banks/bank_07.asm` (Group 00), `banks/bank_52.asm` (Group 04) for done examples.

**Macro forms** (all byte-identical to raw bytes — verify `make compare`):
* `map G<g>_<nn>` ≡ `dbaw2 <map>_MapAttributes` (`db BANK` + `ds 3` + `dw attr`). Sets
  `__current_map__`, so following `warp`s default pointers to map names.
* `warp X, Y, $Z` (3-arg) → ObjectEvents/MapEvents default `<map>_ObjectEvents` /
  `<map>_MapEvents`.
* `warp X, Y, $Z, Obj` (4-arg) → explicit ObjectEvents, MapEvents still default.
* `warp X, Y, $Z, Obj, Mev` (5-arg) → both explicit.
* `end_map` purges `__current_map__`.

**Naming.** Map number `<nn>` = **0-based index** into group table
(`GroupNN_Maps`), **2-digit hex** (matches `constants/map_constants.asm`). Group digit
1-digit (`G4_`). First header referenced twice (slots 0, 1 — a
default/dup) — canonical map = **higher** slot (`G4_01`); lower slot becomes
extra stacked `_Header` label (below). `Group<NN>_Maps` entries become
`dw G<g>_<nn>_Header` (`map` macro emits `\1_Header:`).

**Label-stacking trick** (key enabler). Attribute, ObjectEvents, MapEvents a
map points to *defined in other banks* under physical `bank_offset` names
(`MapAttributes_053_4000`, `ObjectEvents_055_53f1`, …), often **shared** by several
maps. To let every map use short form via own canonical name **without renaming or
moving anything**, stack alias labels above each def:

```
G4_01_ObjectEvents:
G4_0C_ObjectEvents2:
G4_42_ObjectEvents:
ObjectEvents_055_53f1:        ; original kept; e.g. this is just `objects_end`
	objects_end
```

Labels cost zero bytes; build uses rgbasm `-E` (export-all, `ASMFLAGS += -E` in
`Makefile`), so aliases resolve cross-bank, ROM unchanged. Shared target
accumulates 1 alias per (map, suffix-slot) using it; map with several distinct
ObjectEvents across warps gets `..._ObjectEvents`, `...2`, `...3`, … (first-seen
order; `_ObjectEventsN` suffix predates this — see
`BallotsHouse1_ObjectEvents2` in bank_07). Duplicate table slot same
way: stack `G4_00_Header::` above `map G4_01`.

**Procedure** (don't carpet-bomb `sed` — parse and assert):
1. Parse `Group<NN>_Maps` → slot→header (0-based hex numbers).
2. Per header, read `; warp …` comment lines to recover
   `(X, Y, $Z, ObjectEvents, MapEvents)` and `dbaw2` attr; **assert** each following
   6-line block matches `db X,Y / dw $Z / db BANK(obj) / ds 3 / dw obj / dw mev`, comment
   matches bytes (hard-error on mismatch).
3. First warp's object = map primary; emit `map` + 3-arg (primary) / 4-arg
   (others, via suffixed alias) `warp` + `end_map`. MapEvents 1:1 per header → always
   default (no 5-arg for these groups).
4. Stack `_MapAttributes` / `_ObjectEvents[N]` / `_MapEvents` aliases above each
   def (locate via `get_nearest_symbol.py` / grep). MapEvents defs in
   header's bank; attrs/objects elsewhere (53/57/55/58/59/5a/5c/01/11/50 for Group 04).
5. `make compare` must print `…gbc: OK`.
6. **Remove dead originals.** Once aliased, original `bank_offset` label
   (`MapEvents_052_4fb2`, `ObjectEvents_055_…`, `MapAttributes_053_…`) safe to delete
   **iff nothing else references it** — i.e. used only by this group. Keep any still
   referenced by another group/bank (e.g. `MapAttributes_001_*` / `_011_*` / `_050_*` shared
   with banks 07/10; already-named `TechShop_MapAttributes` too).
   CAUTION: references can be **implicit** — `map <Name>` / `map_attributes <Name>`
   macros *construct* `<Name>_MapAttributes` (`warp` builds `<Name>_ObjectEvents`), so
   plain grep won't see them. Don't trust text scan alone; **let `make compare` /
   linker be authority** — errors `Requested BANK() of symbol "X", which was
   not found` for any removed label still needed. Re-add (stacked in
   same alias group), re-run.