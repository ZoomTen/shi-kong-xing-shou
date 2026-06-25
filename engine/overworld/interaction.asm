OverworldInteract:
	ldh a, [hJoypadPressed]
	bit 0, a
	ret z
	call CheckPendingTileInteract
	call TriggerFacingObjectScript
	call CheckTileInteractInFront
	call TriggerPendingScriptFlag
	call MaybeStartCharScript
	ld a, [wPlayerSpriteID]
	cp 9
	jr z, .asm_005_5148
	call TryBoardFacingBlock
	call TryInteractSignpost
	call TryShowFoundItem
	ret
.asm_005_5148
	ld de, wAdjacentBlocks
	ld a, [wPlayerFacing]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	ret nz
	xor a
	ld [wPlayerAnimFrame], a
	ld [wd0e4], a
	ld a, 1
	ld [hFFAC], a
	ld [wdcd0], a
	ld a, 8
	ld [wPlayerSpriteID], a
	farcall Func_024_6864
	call InitFollowerState
	call _UpdatePlayerMapCoords
	call ParseCurrentMapEvents
	ret

TryBoardFacingBlock:
	ld de, wAdjacentBlocks
	ld a, [wPlayerFacing]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	cp 3
	ret nz
	ld a, [wPlayerChar]
	cp 4
	ret nz
	farcall Func_024_6864
	ld a, 9
	ld [wPlayerSpriteID], a
	ld [wd0e4], a
	xor a
	ld [wPlayerAnimFrame], a
	ld a, 1
	ld [hFFAC], a
	ld [wdcd0], a
	call ClearFollowerState
	call _UpdatePlayerMapCoords
	call ParseCurrentMapEvents
	ret

InitFollowerState:
	ld a, 2
	ld [wdcea], a
	ld a, 1
	ld [wcd22], a
	ldh [hFFDB], a
	ld [wdceb], a
	ld a, $a
	ldh [hFFDC], a
	ld a, 8
	ld [wcd26], a
	ld a, 9
	ld [wcd24], a
	ld a, [wPlayerFacing]
	ld [wcd23], a
	ld [wdcec], a
	call GetPlayerFacingOffset
	ret

ClearFollowerState:
	xor a
	ld [wdcea], a
	ld hl, wcd20
	ld bc, 3
; ???
	xor a
.clearLoop
	ld [hli], a
	dec c
	ld a, c
	or b
	jr nz, .clearLoop
	ret

MaybeStartCharScript:
	ldh a, [hFFD6]
	and a
	ret nz
	ld a, [hTextSource]
	and a
	ret nz
	ld a, [wPlayerChar]
	cp 7
	ret nz
	ld a, [hFFB9]
	cp 5
	ret nc
	ld a, [hFFB9]
	inc a
	ld [hFFB9], a
	call AdvanceRNG
	ld a, [wd991]
	and $f
	ld [hFFB8], a
	xor a
	ld [wdce8], a
	ld a, [hFadeFrameCounter]
	and 8
	jr z, .startScript
	ld a, 1
	ld [wdce8], a

.startScript:
	ld hl, wScriptPos
	ld [hl], LOW(Script_005_524c)
	inc hl
	ld [hl], HIGH(Script_005_524c)
	ld a, 1
	ldh [hFFD6], a
	xor a
	ld [wScriptByte], a
	ld [wFoundItem], a
	ld [wSignpostNumber], a
	ld [wd0f8], a
	ld [wd0ee], a
	ld a, [hScriptBank]
	ld [wSavedScriptBank], a
	ld a, BANK(Script_005_524c)
	ld [hScriptBank], a
	ret

Script_005_524c:
	spriteface  1, $04
	delay $03, $10
	spriteface  1, FACE_DOWN
	objmove $01, MovementData_005_5270
	ifplayerx
	condtext
	setfollower $52
	end

; orphan data (no ref; not code/text/palette) - purpose unknown
unk_005_525e:
	db $77, $14, $64, $52, $70, $09, $e0, $10, $10, $f4, $7b, $f2, $be, $f1, $64, $f2, $c7, $e2

MovementData_005_5270:
	db $f8, $00, $fa, $00, $fc, $00, $fc, $00, $fc, $00, $fd, $00, $fe, $00, $ff, $00
	db $00, $00, $00, $00, $08, $00, $06, $00, $04, $00, $04, $00, $04, $00, $03, $00
	db $02, $00, $01, $00, $88

TriggerPendingScriptFlag:
	ld a, [wd0ee]
	and a
	ret z
	xor a
	ld [wd0f8], a
	ld [wScriptByte], a
	ld a, 1
	ldh [hFFD6], a
	ret

CheckPendingTileInteract:
	ld a, [wd0f8]
	and a
	ret z
	call GetFacingTileMapAddr
	xor a
	ld [wd0f8], a
	ld [wScriptByte], a
	ld a, 1
	ldh [hFFD6], a
	ret

CheckTileInteractInFront:
	ldh a, [hFFD6]
	and a
	ret nz
	ld a, [hTextSource]
	and a
	ret nz
	ld a, [wPlayerObject]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	ld [wd3f9], a
	ld a, [wPlayerFacing]
	cp FACE_DOWN
	jr z, asm_005_52e7
	cp FACE_UP
	jr z, asm_005_52f4
	cp FACE_LEFT
	jr z, asm_005_5301
	cp FACE_RIGHT
	jr z, asm_005_530e
	ret

asm_005_52e7:
	ld a, [wd0f9]
	add $10
	ld [wd0f9], a
	ld hl, wSouthFacingTile
	jr asm_005_5319

asm_005_52f4:
	ld a, [wd0f9]
	sub $10
	ld [wd0f9], a
	ld hl, wNorthFacingTile
	jr asm_005_5319

asm_005_5301:
	ld a, [wd3f9]
	sub $10
	ld [wd3f9], a
	ld hl, wWestFacingTile
	jr asm_005_5319

asm_005_530e:
	ld a, [wd3f9]
	add $10
	ld [wd3f9], a
	ld hl, wEastFacingTile

asm_005_5319:
	ld a, [hl]
	swap a
	and $f
	ret z
	cp 1
	jr z, ObtainTileItem
	cp 2
	jr z, InteractSetMapPatch
	cp 3
	jr z, asm_005_532c
	ret

asm_005_532c:
	call InteractClearMapPatch
	ret

ObtainTileItem:
	ld [wTileInteractType], a
	ld a, SFX_1a
	call PlaySound
	ld a, [hl]
	and $f
	ld [wItemIndex], a
	call RedrawTileAfterObtain
	call SetMapLayoutPatchForItem
	ld a, BANK(text_1e_4212)
	ldh [hTextSourceBank3], a
	ld a, TEXTSRC_ITEM_OBTAINED
	ldh [hTextSource], a
	ld hl, text_1e_4212
	ld a, l
	ld [wTextStart], a
	ld a, h
	ld [wTextStart + 1], a
	call SetTextboxYPosition
	ret

ApplyMapSpecialPalette: ; unreferenced?
	ld a, [hMapGroup]
	cp $04
	ret nz
	ldh a, [hMapNumber]
	cp $06
	jr z, .applyPalette
	cp $07
	jr z, .applyPalette
	cp $08
	jr z, .applyPalette
	cp $09
	jr z, .applyPalette
	ret
.applyPalette
	ld a, [wdcb9]
	and a
	ret z
	ld hl, Palette_005_4394
	ld de, wPaletteBuffer
	ld bc, $0008
	call CopyBytes3
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret

InteractSetMapPatch:
	ld [wTileInteractType], a
	ld a, SFX_1e
	call PlaySound
	ld a, [hl]
	and $f
	ld [wMapPatchIndex], a
	call DrawSetInteractTile
	call SetMapLayoutPatch
	ld a, [wMapPatchIndex]
	cp 2
	jr z, asm_005_53b4
	cp 3
	jr z, asm_005_53b7
	cp 4
	jr z, asm_005_53b7
	ret

asm_005_53b4:
	call DrawFixedSetPatch

asm_005_53b7:
	call ApplyMapLayoutFlagPatches
	ret

DrawFixedSetPatch:
	ld hl, $0505
	call GetScrolledTileVRAMAddr
	ld de, Tilemap_005_53d1
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call CopyBlockToVRAM
	ret

Tilemap_005_53d1:
	db $11
	db $13
	db $12
	db $14
	db $5
	db $5
	db $5
	db $5

InteractClearMapPatch:
	ld [wTileInteractType], a
	ld a, SFX_1e
	call PlaySound
	ld a, [hl]
	and $f
	ld [wMapPatchIndex], a
	call DrawClearInteractTile
	call ClearMapLayoutPatch
	ld a, [wMapPatchIndex]
	cp 2
	jr z, asm_005_53fd
	cp 3
	jr z, asm_005_5400
	cp 4
	jr z, asm_005_5400
	ret

asm_005_53fd:
	call DrawFixedClearPatch

asm_005_5400:
	call ApplyMapLayoutPatchIfClear
	ret

DrawFixedClearPatch:
	ld hl, $0505
	call GetScrolledTileVRAMAddr
	ld de, Tilemap_005_541a
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call CopyBlockToVRAM
	ret

Tilemap_005_541a:
	db $48
	db $4a
	db $49
	db $4b
	db $0
	db $0
	db $0
	db $0

SetTextboxYPosition:
	ld a, 1
	ld [wTextboxPos], a
	ld a, [wPlayerObject]
	cp $60
	ret nc
	xor a
	ld [wTextboxPos], a
	ret

GetItemPickupTileAddr:
	and a
	ret nz
	ld a, [hl]
	and $0F
	ld [wItemIndex], a
	call .computeAddr
	ret
.computeAddr
	ld a, [wVisibleObjects]
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub $08
	ld [wd3f9], a
	ld a, [wPlayerFacing]
	cp $00
	jr z, ComputeTileMapAddr
	ld a, [wd0f9]
	sub $30
	ld [wd0f9], a
	jp ComputeTileMapAddr

GetFacingTileMapAddr:
	ld a, [wPlayerObject]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	ld [wd3f9], a
	ld a, [wPlayerFacing]
	cp 0
	jr z, ComputeTileMapAddr
	ld a, [wd0f9]
	sub $10
	ld [wd0f9], a

ComputeTileMapAddr:
	ld a, [wd0f9]
	srl a
	srl a
	srl a
	ld l, a
	ld a, [wd3f9]
	srl a
	srl a
	srl a
	ld h, a
	call GetTileVRAMAddress
	ld a, l
	ld [wd083], a
	ld a, h
	ld [wd083 + 1], a
	ret

; TODO: unreferenced data block, classify type
unk_005_549d:
	rept 8
	db $3e
	endr
	rept 8
	db $03
	endr

DrawClearInteractTile:
	ld a, [wTileInteractType]
	cp 3
	ret nz
	ld a, [wd0f9]
	srl a
	srl a
	srl a
	ld l, a
	ld a, [wd3f9]
	srl a
	srl a
	srl a
	ld h, a
	call GetTileVRAMAddress
	ld de, Tilemap_005_5500
	jr Copy2x2BlockToVRAM

DrawSetInteractTile:
	ld a, [wTileInteractType]
	cp 2
	ret nz
	ld a, [wd0f9]
	srl a
	srl a
	srl a
	ld l, a
	ld a, [wd3f9]
	srl a
	srl a
	srl a
	ld h, a
	call GetTileVRAMAddress
	ld de, Tilemap_005_54fc

Copy2x2BlockToVRAM:
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call CopyBlockToVRAM
	ret

Tilemap_005_54fc:
	db $9
	db $b
	db $a
	db $c

Tilemap_005_5500:
	db $d
	db $f
	db $e
	db $10

RedrawTileAfterObtain:
	ld a, [wTileInteractType]
	cp 1
	ret nz
	ld a, [wd0f9]
	srl a
	srl a
	srl a
	ld l, a
	ld a, [wd3f9]
	srl a
	srl a
	srl a
	ld h, a
	call GetTileVRAMAddress
	ld de, Tilemap_005_556d
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call CopyBlockToVRAM
	ld a, [wd0f9]
	srl a
	srl a
	srl a
	ld c, a
	ld a, [wd3f9]
	srl a
	srl a
	srl a
	ld b, a
	ld hl, wTilemap
	ld de, $14
	ld a, c
	and a
	jr z, asm_005_5552

asm_005_554e:
	add hl, de
	dec c
	jr nz, asm_005_554e

asm_005_5552:
	ld c, b
	ld b, 0
	add hl, bc
	ld de, Tilemap_005_556d
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld bc, $12
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ret

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_005_5569:
	db $0
	db $2
	db $1
	db $3

Tilemap_005_556d:
	db $1

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_005_556e:
	db $3

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_005_556f:
	db $2

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_005_5570:
	db $4

GetScrolledTileVRAMAddr:
	ld a, [hFFAA]
	ld b, a
	ld a, [hFFAB]
	ld c, a
	ld a, l
	sub c
	add a
	ld l, a
	ld a, h
	sub b
	add a
	ld h, a
	ld a, [wd0ba]
	ld c, a
	ld a, [wd0bb]
	ld b, a
	ld e, h
	ld a, l
	add a
	add a
	add a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, bc
	bit 5, l
	jr z, .addRowOffset
	add hl, de
	bit 5, l
	jr nz, .composeAddr
	ld a, l
	sub $20
	ld l, a
	jr .composeAddr

.addRowOffset:
	add hl, de
	bit 5, l
	jr z, .composeAddr
	ld a, l
	sub $20
	ld l, a

.composeAddr:
	ld a, h
	and 3
	or $98
	ld h, a
	ret

GetTileVRAMAddress:
	ld a, [wd0ba]
	ld c, a
	ld a, [wd0bb]
	ld b, a
	ld e, h
	ld a, l
	add a
	add a
	add a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, bc
	bit 5, l
	jr z, .addRow
	add hl, de
	bit 5, l
	jr nz, .finalize
	ld a, l
	sub $20
	ld l, a
	jr .finalize

.addRow:
	add hl, de
	bit 5, l
	jr z, .finalize
	ld a, l
	sub $20
	ld l, a

.finalize:
	ld a, h
	and 3
	or $98
	ld h, a
	ret

TryInteractSignpost:
	ldh a, [hFFD6]
	and a
	ret nz
	ld a, [wSignpostNumber]
	and a
	ret z
	ld a, [wPlayerFacing]
	cp 1
	ret nz
	ld a, TEXTSRC_SIGNPOST
	ldh [hTextSource], a
	ld a, BANK(text_0c_40a7)
	ldh [hTextSourceBank2], a
	call GetSignpostText
	ret

TryShowFoundItem:
	ldh a, [hFFD6]
	and a
	ret nz
	ld a, [wFoundItem]
	and a
	ret z
	call CheckFoundItem
	ld a, [wFoundItem]
	and a
	ret z
	ld a, SFX_12
	call PlaySound
	ld a, TEXTSRC_ITEM_FOUND
	ldh [hTextSource], a
	ld a, BANK(text_1e_6e44)
	ld [wFoundItemTextBank], a
	ld hl, text_1e_6e44
	ld a, l
	ld [wTextStart], a
	ld a, h
	ld [wTextStart + 1], a
	call SetTextboxYPosition
	ret

; TODO: unk_ - data, referenced via `ld hl, unk_005_5632`
unk_005_5632:
	db $ff, $00, $00, $00, $a1, $ff, $03, $01, $01, $00, $f8, $d3, $02, $02, $01, $00
	db $f7, $d3, $01, $04, $01, $ff, $f6, $d3, $00, $08, $01, $01, $f5, $d3
; TODO: unk_ - data, referenced via `ld hl, unk_005_5650`
unk_005_5650:
	db $ff, $00, $00, $00, $a1, $ff, $02, $02, $01, $00, $f7, $d3, $03, $01, $01, $00
	db $f8, $d3, $01, $04, $01, $ff, $f6, $d3, $00, $08, $01, $01, $f5, $d3
; TODO: unk_ - data, referenced via `ld hl, unk_005_566e`
unk_005_566e:
	db $ff, $00, $00, $00, $a1, $ff, $03, $01, $01, $00, $f8, $d3, $02, $02, $01, $00
	db $f7, $d3, $00, $08, $01, $01, $f5, $d3, $01, $04, $01, $ff, $f6, $d3
; TODO: unk_ - data, referenced via `ld hl, unk_005_568c`
unk_005_568c:
	db $ff, $00, $00, $00, $a1, $ff, $02, $02, $01, $00, $f7, $d3, $03, $01, $01, $00
	db $f8, $d3, $00, $08, $01, $01, $f5, $d3, $01, $04, $01, $ff, $f6, $d3

TriggerFacingObjectScript:
	ld de, unk_005_5764
	ld a, [wPlayerFacing]
	call FindObjectAtFacingTile
	and a
	jr nz, .foundObject
	ld a, [wPlayerMap2Y]
	ld [wPlayerMapY], a
	ld a, [wPlayerMap2X]
	ld [wPlayerMapX], a
	ret

.foundObject:
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld [wcd0b], a
	ld b, $cd
	ld hl, $b
	add hl, bc
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hl]
	ld [wScriptPos + 1], a
	xor a
	ld [wScriptByte], a
	ld a, 1
	ldh [hFFD6], a
	ret
CheckObjectInFront:
	ld de, unk_005_5764
	ldh a, [hFF9E]

FindObjectAtFacingTile:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [wPlayerObject]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAB]
	add e
	ld [wPlayerMap2Y], a
	add [hl]
	ld [wFacingTileY], a
	inc hl
	ld a, [wPlayerScreenX]
	sub 8
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAA]
	add e
	ld [wPlayerMap2X], a
	add [hl]
	ld [wFacingTileX], a
	ld bc, wNPCObjects

.loop:
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nextObject
	ld hl, $12
	add hl, bc
	ld a, [wFacingTileY]
	cp [hl]
	jr nz, .nextObject
	inc hl
	ld a, [wFacingTileX]
	cp [hl]
	jr nz, .nextObject
	ld a, [wPlayerMap2Y]
	ld [wPlayerMapY], a
	ld a, [wPlayerMap2X]
	ld [wPlayerMapX], a
	ld a, c
	ld [wSelectedObjectOffset], a
	ld a, 1
	ret

.nextObject:
	ld hl, $20
	add hl, bc
	ld c, l
	ld b, h
	ld a, l
	cp $e0
	jr c, .loop
	ld a, [wFacingTileY]
	ld [wPlayerMapY], a
	ld a, [wFacingTileX]
	ld [wPlayerMapX], a
	xor a
	ret

; TODO: unk_ - data, referenced via `ld de, unk_005_5764`
unk_005_5764:
	db $1

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_005_5765:
	db $0
	db $ff
	db $0
	db $0
	db $ff
	db $0
	db $1
