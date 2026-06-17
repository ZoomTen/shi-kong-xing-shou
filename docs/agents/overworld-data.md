# Overworld Data

## Map Definitions

Divided into several map groups. Map groups defined in `LoadMapData.MapGroupPointers`.

### Map Group
Map groups are a table of map headers. Ex: `Group00_Maps`, defined at address `$1c000 (07:4000)`:
```
$1C000	5A 40	dw BellVillage1_Header ; -> 07:405a
$1C002	5A 40	dw BellVillage1_Header ; -> 07:405a
$1C004	CC 40	dw BellSchoolOutside1_Header ; -> 07:40cc
$1C006	EA 40	dw BellObservatoryOutside1_Header ; -> 07:40ea
$1C008	08 41	dw BallotsHouse1_Header ; -> 07:4108
$1C00A	4A 41	dw HayatosHouse1_Header ; -> 07:414a
```

### Map Header
The structure of a map header consists of one map attribute pointer of 6 bytes, and several "warp" structs, 12 bytes each. A "warp" also defines which objects and map events (signposts, warp points, scripts) are to be run when the map is loaded.
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

**NOTE:** Map events are read from the SAME BANK as the map header!

## Map Events
An array terminated with $FF, each entry 6 bytes long. The first byte is the type of event (defined in `MapEvent_Jumptable`), bytes 2 and 3 are the X and Y positions, respectively, and the rest are map event arguments.

$EE for bytes 2 or 3 (or both) marks that this event should run regardless of the player's position for that axis. Ex: byte 2 is $EE, while byte 3 is $08 -> event will always run when player steps on Y = 8.

For a `script_event`, the bank where the script is located is the **Object event** bank.

## Object Events
Object events are an array terminated with $88, each entry 11 bytes long. Interacting with an object event will run a script located in the same bank.

Rough structure of each entry is as follows:
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

Maps are drawn in the following hierarchy:
1. **Metatiles** - 16x16px block made out of 2x2 graphics tiles.
2. **Blocks** - 32x32px units made out of 2x2 metatiles.
3. **Layout** - The area map drawn using the 32x32 blocks.

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
* If tileset 1 pointer = 0, then tileset 2 will *always* be loaded from bank 6 as Tileset Header data.
* If tileset 1 pointer is non-zero, then tilesets 1 and 2 will come from the same bank as the header.
	* Tileset 1 will be loaded as GFX into $9000
	* Tileset 2 will be loaded as GFX into $8800

### Tileset Header
An array of tileset fragments to be loaded into VRAM, $FF-terminated.
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

Layouts begin with a single byte loaded into `D0F4` (possibly item-related?), followed by the actual map layout.

## Converting a map group's headers to `map`/`warp` macros

Raw headers (`dbaw2` attr + manually-expanded 12-byte warp structs, each already commented
with its `warp` line) convert to the macro form in `macros/scripts/maps.asm`. See
`banks/bank_07.asm` (Group 00) and `banks/bank_52.asm` (Group 04) for completed examples.

**Macro forms** (all byte-identical to the raw bytes — verify with `make compare`):
* `map G<g>_<nn>` ≡ `dbaw2 <map>_MapAttributes` (`db BANK` + `ds 3` + `dw attr`). It sets
  `__current_map__`, so following `warp`s default their pointers to the map's names.
* `warp X, Y, $Z` (3-arg) → ObjectEvents/MapEvents default to `<map>_ObjectEvents` /
  `<map>_MapEvents`.
* `warp X, Y, $Z, Obj` (4-arg) → explicit ObjectEvents, MapEvents still defaulted.
* `warp X, Y, $Z, Obj, Mev` (5-arg) → both explicit.
* `end_map` purges `__current_map__`.

**Naming.** Map number `<nn>` = the **0-based index** into the group table
(`GroupNN_Maps`), as **2-digit hex** (matches `constants/map_constants.asm`). Group digit
is 1-digit (`G4_`). The first header is referenced by the table twice (slots 0 and 1, a
default/dup) — the canonical map is the **higher** slot (`G4_01`); the lower slot becomes
an extra stacked `_Header` label (see below). `Group<NN>_Maps` entries become
`dw G<g>_<nn>_Header` (the `map` macro emits label `\1_Header:`).

**The label-stacking trick** (key enabler). The attribute, ObjectEvents, and MapEvents a
map points to are *defined in other banks* under physical `bank_offset` names
(`MapAttributes_053_4000`, `ObjectEvents_055_53f1`, …) and are often **shared** by several
maps. To let every map use the short form via its own canonical name **without renaming or
moving anything**, stack alias labels above each definition:

```
G4_01_ObjectEvents:
G4_0C_ObjectEvents2:
G4_42_ObjectEvents:
ObjectEvents_055_53f1:        ; original kept; e.g. this is just `objects_end`
	objects_end
```

Labels cost zero bytes and the build uses rgbasm `-E` (export-all, `ASMFLAGS += -E` in the
`Makefile`), so all aliases resolve cross-bank and the ROM is unchanged. A shared target
accumulates one alias per (map, suffix-slot) that uses it; a map with several distinct
ObjectEvents across its warps gets `..._ObjectEvents`, `...2`, `...3`, … (first-seen
order; the `_ObjectEventsN` suffix convention predates this — see
`BallotsHouse1_ObjectEvents2` in bank_07). The duplicate table slot is handled the same
way: stack `G4_00_Header::` above the `map G4_01` line.

**Procedure** (don't carpet-bomb `sed` — parse and assert):
1. Parse `Group<NN>_Maps` → slot→header (0-based hex numbers).
2. For each header, read the `; warp …` comment lines to recover
   `(X, Y, $Z, ObjectEvents, MapEvents)` and the `dbaw2` attr; **assert** each following
   6-line block matches `db X,Y / dw $Z / db BANK(obj) / ds 3 / dw obj / dw mev` and that
   the comment matches the bytes (hard-error on any mismatch).
3. Pick the first warp's object as the map's primary; emit `map` + 3-arg (primary) / 4-arg
   (others, via suffixed alias) `warp` + `end_map`. MapEvents is 1:1 per header → always
   the default (no 5-arg needed for these groups).
4. Stack the `_MapAttributes` / `_ObjectEvents[N]` / `_MapEvents` aliases above each
   definition (locate with `get_nearest_symbol.py` / grep). MapEvents defs live in the
   header's own bank; attrs/objects in others (53/57/55/58/59/5a/5c/01/11/50 for Group 04).
5. `make compare` must print `…gbc: OK`.
6. **Remove dead originals.** Once aliased, an original `bank_offset` label
   (`MapEvents_052_4fb2`, `ObjectEvents_055_…`, `MapAttributes_053_…`) is safe to delete
   **iff nothing else references it** — i.e. it was used only by this group. Keep any still
   referenced by another group/bank (e.g. `MapAttributes_001_*` / `_011_*` / `_050_*` are
   shared with banks 07/10; the already-named `TechShop_MapAttributes` etc. too).
   CAUTION: references can be **implicit** — the `map <Name>` / `map_attributes <Name>`
   macros *construct* `<Name>_MapAttributes` (and `warp` builds `<Name>_ObjectEvents`), so
   a plain grep won't see them. Don't trust a text scan alone; **let `make compare` /
   the linker be the authority** — it errors `Requested BANK() of symbol "X", which was
   not found` for any label you removed that's still needed. Re-add it (stacked in the
   same alias group) and re-run.
