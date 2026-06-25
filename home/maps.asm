; Load objects in map
LoadMapObjects::
	ldh a, [hScriptBank]
	rst Bankswitch
	ld a, [wObjectEventPointer]
	ld l, a
	ld a, [wObjectEventPointer + 1]
	ld h, a
	ld de, wda00
.read_byte
	ld a, [hl]
	cp $88 ; terminator
	jr z, .exit

	ld a, $ff
	ld [de], a
	inc de
	ld c, 11
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	jr .read_byte

.exit
	ld [de], a
	ret

LoadMapData::
; Load map group
	ld de, .MapGroupPointers
	ldh a, [hMapGroup]
	ld l, a
	ld c, a
	ld b, 0
	ld h, 0
	add hl, hl
	add hl, bc
	add hl, de
; bank
	ld a, [hli]
	rst Bankswitch
; address
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

; Load map header from map number
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Load map attribute bank and etc.
	ld de, hMapAttrBank
REPT 4
	ld a, [hli]
	ld [de], a
	inc de
ENDR

; Map attribute pointer
	ld a, [hli]
	ld [wMapAttrPointer], a
	ld a, [hli]
	ld [wMapAttrPointer + 1], a

; warp data length
	ld bc, $0c

; get warp data
	ldh a, [hWarpNumber]
	and a
	jr z, .got_warp
.get_warp
	add hl, bc
	dec a
	jr nz, .get_warp
.got_warp
	ld a, [wd9d2]
	and a
	jr z, .get_spawn_position

; skip placing player
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	jr .get_scripts

.get_spawn_position
; offset the map
	ld a, [hli]
	ldh [hMapOffsetX], a
	ld a, [hli]
	ldh [hMapOffsetY], a
; where the player is placed on the screen
	ld a, [hli]
	ld [wPlayerSpriteX], a
	ld a, [hli]
	ld [wPlayerSpriteY], a

.get_scripts
; Script and object event bank
	ld de, hScriptBank
	ld a, [hli]
	ld [de], a
; @bad: should do inc hl instead
	inc de
	ld a, [hli]
	inc de
	ld a, [hli]
	inc de
	ld a, [hli]
	inc de

; Load object event pointer
	ld a, [hli]
	ld [wObjectEventPointer], a
	ld a, [hli]
	ld [wObjectEventPointer + 1], a

; Copy map events to df00
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMapEvents
.copy_map_events
	ld a, [hli]
	ld [de], a
	inc de
	cp -1
	ret z
REPT 5
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	jr .copy_map_events
	ret ; ?

.MapGroupPointers:
	dba Group00_Maps
	dba Group01_Maps
	dba Group02_Maps
	dba Group03_Maps
	dba Group04_Maps
	dba Group05_Maps
	dba Group06_Maps
	dba Group07_Maps
	dba Group02_Maps

_GetBlockCollision::
	ldh a, [hMapAttrBank]
	rst Bankswitch
	push de
	ldh a, [hMapOffsetY]
	add c
	ld c, a
	ld hl, wMapLayout
	ld a, [hMapWidth]
	ld e, a
	ld d, 0
	ld a, c
	and a
	jr z, .asm_20d2

.asm_20ce
	add hl, de
	dec c
	jr nz, .asm_20ce

.asm_20d2
	pop de
	ld a, d
	ld c, a
	ld d, 0
	ldh a, [hMapOffsetX]
	add e
	ld e, a
	add hl, de
	ld a, [wMapBlocksPointer]
	ld e, a
	ld a, [wMapBlocksPointer + 1]
	ld d, a
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, b
	and a
	jr z, .asm_20f1

	inc hl
	inc hl
.asm_20f1
	ld a, c
	and a
	jr z, .asm_20f6

	inc hl
.asm_20f6
	ld a, [wMapCollisionsPointer]
	ld e, a
	ld a, [wMapCollisionsPointer + 1]
	ld d, a
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wd0c8], a
	ret

_UpdatePlayerAnim::
	ldh a, [hFFAC]
	and a
	jr z, .asm_211f

	ld a, [wdcd0]
	and a
	jr nz, .asm_211c

	ldh a, [hFFAD]
	inc a
	ldh [hFFAD], a
	cp 5
	jr c, .asm_211f

.asm_211c
	call AnimatePlayerSprite

.asm_211f
	call AnimateObjectSprite
	ret

AnimatePlayerSprite::
	xor a
	ldh [hFFAD], a
	ld [wdcd0], a
	ld hl, wcd07
	ld a, 1
	sub [hl]
	ld [hl], a

.asm_2130:
	ld a, [wPlayerSpriteID]
	ld [wMapSpriteID], a
	call GetSpriteGFXPointers
	ld a, [wMapSpriteID]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPlayerFacing]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPlayerAnimFrame]
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $ff
	jr nz, .asm_216d
	ld a, h
	cp $ff
	jr nz, .asm_216d

	xor a
	ld [wPlayerAnimFrame], a
	ld [wd3f4], a
	ldh [hFFAD], a
	ldh [hFFAC], a
	ret

.asm_216d:
	ld a, l
	cp $ee
	jr nz, .asm_2182
	ld a, h
	cp $ee
	jr nz, .asm_2182

	xor a
	ld [wPlayerAnimFrame], a
	ld [wd3f4], a
	ldh [hFFAD], a
	jr .asm_2130

.asm_2182:
	ld a, [wcd06]
	swap a
	ld e, a
	ld a, [wcd07]
	and a
	jr z, .asm_2192

	ld a, $40
	add e
	ld e, a
.asm_2192
	ld d, $80
	ld bc, $40
	call CopyBytesVRAM
	ld hl, wPlayerAnimFrame
	inc [hl]
	ld a, [hl]
	cp 1
	jr nc, .asm_21a7
	xor a
	ld [wd3f4], a

.asm_21a7
	ldh a, [hSimulatedJoypadState]
	and a
	ret nz
	ld a, [hl]
	bit 0, a
	ret z

	xor a
	ld [wPlayerAnimFrame], a
	ld [wd3f4], a
	ldh [hFFAD], a
	ldh [hFFAC], a
	ret

AnimateObjectSprite::
	ld a, [wdcea]
	and a
	jp z, UpdateSpriteAnimQueue
	ldh a, [hFFDB]
	and a
	jp z, UpdateSpriteAnimQueue

	ld a, [wdceb]
	and a
	jr nz, .asm_21d8

	ldh a, [hFFDC]
	inc a
	ldh [hFFDC], a
	cp 5
	jp c, UpdateSpriteAnimQueue

.asm_21d8
	xor a
	ldh [hFFDC], a
	ld [wdceb], a
	ld hl, wcd27
	ld a, 1
	sub [hl]
	ld [hl], a

.asm_21e5
	ld a, [wcd24]
	ld [wMapSpriteID], a
	call GetSpriteGFXPointers
	ld a, [wMapSpriteID]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd23]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd25]
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $ff
	jr nz, .asm_221f
	ld a, h
	cp $ff
	jr nz, .asm_221f

	xor a
	ld [wcd25], a
	ldh [hFFDC], a
	ldh [hFFDB], a
	ret

.asm_221f
	ld a, l
	cp $ee
	jr nz, .asm_2231
	ld a, h
	cp $ee
	jr nz, .asm_2231

	xor a
	ld [wcd25], a
	ldh [hFFDC], a
	jr .asm_21e5

.asm_2231
	ld a, [wcd26]
	swap a
	ld e, a
	ld a, [wcd27]
	and a
	jr z, .asm_2241

	ld a, $40
	add e
	ld e, a

.asm_2241
	ld d, $80
	ld bc, $40
	call CopyBytesVRAM
	ld hl, wcd25
	inc [hl]
	ret

UpdateSpriteAnimQueue::
	ld bc, wcd40
.asm_2251:
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_2293
	dec [hl]
	ld a, [hl]
	and a
	jr nz, .asm_2293

	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, 1
	sub [hl]
	ld [hl], a
	ld [wd9fe], a
	ld hl, $0d
	add hl, bc
	ld [hl], $14
	push bc
	call AnimateQueuedSprite
	pop bc
	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld c, 4
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .copy
	ret

.asm_2293:
	ld hl, $20
	add hl, bc
	ld a, l
	cp $e0
	jr nc, .asm_22a0

	ld b, h
	ld c, l
	jr .asm_2251

.asm_22a0
	call UpdateTileAnimation
	ret

UpdateSpriteAnimQueueFast::
	ld bc, wcd40
.asm_22a7:
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_22ea
	dec [hl]
	ld a, [hl]
	and a
	jr nz, .asm_22ea

	ld hl, 3
	ld de, wd9fa
	add hl, bc
REPT 4
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, 1
	sub [hl]
	ld [hl], a
	ld [wd9fe], a
	ld hl, $0d
	add hl, bc
	ld [hl], $0a
	push bc
	call AnimateQueuedSprite
	pop bc
	push bc
	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld c, 4
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .copy

	pop bc
.asm_22ea:
	ld hl, $20
	add hl, bc
	ld a, l
	cp $e0
	ret nc

	ld b, h
	ld c, l
	jr .asm_22a7

AnimateQueuedSprite::
	ld a, [wd9fb]
	ld [wMapSpriteID], a
	call GetSpriteGFXPointers
	ld a, [wMapSpriteID]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9fa]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9fc]
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $ff
	jr nz, .asm_2332
	ld a, h
	cp $ff
	jr nz, .asm_2332

	xor a
	ld [wd9fc], a
	ld hl, $0d
	add hl, bc
	ld [hl], 0
	ret

.asm_2332:
	ld a, l
	cp $ee
	jr nz, .asm_2341
	ld a, h
	cp $ee
	jr nz, .asm_2341

	xor a
	ld [wd9fc], a
	ret

.asm_2341
	ld a, [wd9fd]
	swap a
	ld e, a
	or $80
	ld d, a
	ld a, e
	and $f0
	ld e, a
	ld a, [wd9fe]
	and a
	jr z, .asm_2358

	ld a, $40
	add e
	ld e, a

.asm_2358
	ld bc, $40
	call CopyBytesVRAM
	ld hl, wd9fc
	inc [hl]
	ret

GetSpriteGFXPointers::
	ld a, [wMapSpriteID]
	cp SPRITE_14
	jr c, .sprites1
	cp SPRITE_2E
	jr c, .sprites2
	cp SPRITE_53
	jr c, .sprites3
; 53 onwards
	ld a, BANK(Sprites53to75GFXPointers)
	rst Bankswitch
	ld de, Sprites53to75GFXPointers
	ld a, [wMapSpriteID]
	sub SPRITE_53
	ld [wMapSpriteID], a
	ret
.sprites3
	ld a, BANK(Sprites2Eto52GFXPointers)
	rst Bankswitch
	ld de, Sprites2Eto52GFXPointers
	ld a, [wMapSpriteID]
	sub SPRITE_2E
	ld [wMapSpriteID], a
	ret
.sprites2
	ld a, BANK(Sprites14to2DGFXPointers)
	rst Bankswitch
	ld de, Sprites14to2DGFXPointers
	ld a, [wMapSpriteID]
	sub SPRITE_14
	ld [wMapSpriteID], a
	ret
.sprites1
	ld a, BANK(Sprites00to13GFXPointers)
	rst Bankswitch
	ld de, Sprites00to13GFXPointers
	ret

UpdateTileAnimation::
	ldh a, [hFade]
	and a
	ret nz
	ld a, [wd1f1]
	inc a
	ld [wd1f1], a
	cp 7
	ret nz

	xor a
	ld [wd1f1], a
	homecall Func_01c_4000
	ret

; TODO: unreferenced data block, classify type
unk_23c5::
	db $05, $00, $00, $00, $00, $00, $00, $0a, $0a, $0a, $14, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0a, $0a, $0a, $0a, $0a, $00, $00, $08, $08, $08, $08, $00, $00, $00, $00, $0a, $0a, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

LoadMapAttrs::
; load map attribute pointer
	ldh a, [hMapAttrBank]
	rst Bankswitch
	ld a, [wMapAttrPointer]
	ld l, a
	ld a, [wMapAttrPointer + 1]
	ld h, a

; map size
	ld de, hMapWidth
	ld a, [hli]
	ld [de], a
	inc de ; hMapHeight
	ld a, [hli]
	ld [de], a

; copy map attribute data
	ld de, wMapAttributes
	ld c, $12
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

; load map layout?
	ld a, $98
	ld [wd0bb], a
	ld a, $00
	ld [wd0ba], a
	ldh a, [hMapWidth]
	add a
	sub 10
	ldh [hFFA8], a
	ldh a, [hMapHeight]
	add a
	sub 9
	ldh [hFFA9], a
	ld a, [wd9d2]
	and a
	jr z, .asm_2473

	ldh a, [hFFAA]
	jr .asm_2478

.asm_2473
	ldh a, [hMapOffsetX]
	add a
	ldh [hFFAA], a

.asm_2478
	ld l, a
	ld h, 0
REPT 4
	sla l
	rl h
ENDR
	ld a, l
	ld [wd0c6], a
	ld a, h
	ld [wd0c6 + 1], a
	ld a, [wd9d2]
	and a
	jr z, .asm_249d

	ldh a, [hFFAB]
	jr .asm_24a2

.asm_249d
	ldh a, [hMapOffsetY]
	add a
	ldh [hFFAB], a

.asm_24a2
	ld l, a
	ld h, 0
REPT 4
	sla l
	rl h
ENDR
	ld a, l
	ld [wd0c4], a
	ld a, h
	ld [wd0c4 + 1], a
	ret

_LoadMap::
	call LoadMapLayout
	call SetupMapLayoutFlagPatches
	call SetupCrystalMines
	call GetMapLayoutPointer
	call _BuildBlockmap
	call LoadMapTileAttrs
	ret

SetupMapLayoutFlagPatches::
	ld a, [wMapType]
	and a
	ret z
	cp MAPTYPE_CRYSTAL_MINES_P1
	ret z

	homecall ApplyMapLayoutFlagPatchesInit
	ret

SetupCrystalMines::
	ld a, [hMapGroup]
	cp MAPGROUP_GROUP_01
	ret nz

	ld a, [hMapNumber]
	cp MAP_CRYSTAL_MINES_P1
	jr z, .crystal_mines
	cp MAP_CRYSTAL_MINES_P2
	jr z, .crystal_mines
	cp MAP_CRYSTAL_MINES_P3
	jr z, .crystal_mines
	cp MAP_CRYSTAL_MINES_P4
	jr z, .crystal_mines
	cp MAP_CRYSTAL_MINES_P5
	jr z, .crystal_mines
	ret

.crystal_mines
	ld a, [wMapType]
	cp MAPTYPE_CRYSTAL_MINES_P2
	jr z, .do_special
	cp MAPTYPE_CRYSTAL_MINES_P3
	jr z, .do_special
	cp MAPTYPE_CRYSTAL_MINES_P4
	jr z, .do_special
	cp MAPTYPE_CRYSTAL_MINES_P5
	jr z, .do_special
	cp MAPTYPE_CRYSTAL_MINES_P1
	jr z, .do_special
	ret

.do_special
	homecall _ApplyMapLayoutFlagPatches
	ret

GetMapLayoutPointer::
	ld hl, wMapLayout
	ldh a, [hMapOffsetY]
	ld b, a
	and a
	jr z, .skip

	ldh a, [hMapWidth]
	ld e, a
	ld d, 0
.asm_2537
	add hl, de
	dec b
	jr nz, .asm_2537

.skip
	ldh a, [hMapOffsetX]
	ld e, a
	ld d, 0
	add hl, de
	ld a, l
	ld [wMapLayoutPointer], a
	ld a, h
	ld [wMapLayoutPointer + 1], a
	ret

LoadMapTileAttrs::
	ld a, [wMapGBCAttrPointer]
	ld l, a
	ld a, [wMapGBCAttrPointer + 1]
	ld h, a
	ld de, wMapTileAttrs
.loop
	ld a, [hli]
	cp -1
	jr z, .load_defaults
	ld [de], a
	inc de
	jr .loop

.load_defaults
	call LoadDefaultTileAttrs
	ld a, [wMapCollisionsPointer]
	ld l, a
	ld a, [wMapCollisionsPointer + 1]
	ld h, a
	ld de, wMapCollision
	ld a, e
	ld [wMapCollisionsPointer], a
	ld a, d
	ld [wMapCollisionsPointer + 1], a
.loop2
	ld a, [hli]
	cp -1
	ret z
	ld [de], a
	inc de
	jr .loop2

LoadMapLayout::
	ld a, [wMapLayoutPointer]
	ld l, a
	ld a, [wMapLayoutPointer + 1]
	ld h, a
	ld a, [hli]
	ld [wMapType], a
	ld de, wMapLayout
	ldh a, [hMapHeight]
	ld b, a
.row
	ldh a, [hMapWidth]
	ld c, a
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	dec b
	jr nz, .row
	ret

LoadMapPalettes2::
	call LoadMapBGPalettes
	call LoadExtraPalettes
	ret

LoadMapPalettes1::
	call LoadMapBGPalettes
	call LoadBattlePalettes
	ret

LoadTilesetHeader::
; always from bank 06
	ld a, BANK("Tilesets")
	rst Bankswitch

	ld a, [wMapTileset2Pointer]
	ld l, a
	ld a, [wMapTileset2Pointer + 1]
	ld h, a
.load_tileset
	ld a, [hli]
	cp -1
	ret z

; load params for CopyBytesVRAM
; bank
	ld [wTilesetBank], a
; location
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
; byte count
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
; GFX address
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
; load tileset to VRAM
	ld a, [wTilesetBank]
	rst Bankswitch
	call CopyBytesVRAM
	pop hl
	inc hl
; bankswitch back
	ld a, BANK("Tilesets")
	rst Bankswitch
	jp .load_tileset ; jr

