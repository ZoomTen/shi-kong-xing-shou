; Battle menu phase: move/item/switch selection (HandleBattleMenu).
HandleBattleMenu::
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw BattleMenu_Jump_1
	dw BattleMenu_Jump_2
	dw BattleMenu_Jump_3
	dw BattleMenu_Jump_4
	dw BattleMenu_Jump_5

BattleMenu_Jump_1::
	xor a
	ld [wd9f6], a
	ld [wd9f5], a
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	call DelayFrame
	call LoadEnemyMonPic
	farcall Func_026_4d47
	ld de, Battle_PlayerFace_BGMap
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Battle_PlayerFace_AttrMap
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	call DelayFrame
	ld a, $55
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	ld a, [wd9e5]
	ld [wd9d8], a
	farcall asm_026_4616
	ld a, $61
	ld [wMenuTextX], a
	ld a, [wEnemyMonSpecies]
	ld [wd9d8], a
	farcall asm_026_4616
	ld hl, Battle_HUDFont_GFX
	ld de, $96d0
	ld bc, $0130
	call CopyBytesVRAM
	call DelayFrame
	ld hl, Battle_HUDStats_GFX
	ld de, $8800
	ld bc, $02b0
	call CopyBytesVRAM
	ld hl, Battle_OBPals + $10
	ld de, $8700
	ld bc, $20
	call CopyBytesVRAM
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMenu_Jump_2::
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, $13
	add hl, bc
	ld a, [hl]
	set 6, a
	ld [hl], a
	ld de, Battle_EnemyFace_AttrMap
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld a, [wd9f8]
	and a
	jr nz, .alt
	ld a, 1
	ld [wBattleAnimID], a
	ld [wd9f8], a
	ld [wd9ea], a
	ld de, Script_023_55cc
	farcall ExecuteBattleAnimScriptAt
	xor a
	ld [wd9ea], a
	ret

.alt:
	ld de, Battle_EnemyFace_BGMap
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld de, Battle_Panel10x4_BGMap
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call DelayFrame
	ld de, Battle_Panel10x4_AttrMap
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld de, Battle_Panel10x3_BGMap
	ld hl, $982a
	ld bc, $0a03
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 3
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Battle_Panel10x3_AttrMap
	ld hl, $982a
	ld bc, $0a03
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 3
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	call RefreshBattleHUD
	call BattleMenu_PrintHelpBar
	ld de, Battle_Panel13x6_BGMap
	ld hl, $9987
	ld bc, $0d06
	ld a, $d
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	xor a
	ld [hFFC6], a
	ld hl, wcde0
	ld [hl], $78
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], 0
	xor a
	ld [wSelectedOption], a
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMenu_PrintHelpBar::
	call DelayFrame
	ld hl, BattleMenu_HelpText
	ld a, $ab
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

INCLUDE "text/battle_menu.asm"

BattleMenu_Jump_3::
	call RefreshBattleOAM
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .done
	call BattleMenu_AnimCursor
	call BattleMenu_HandleInput
	jr BattleMenu_Jump_3

.done:
	xor a
	ldh [hFFC6], a
	ret

BattleMenu_HandleInput::
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .not_right
	ld a, [wSelectedOption]
	bit 0, a
	ret nz
	set 0, a
	ld [wSelectedOption], a
	jr .move_cursor

.not_right:
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .not_left
	ld a, [wSelectedOption]
	bit 0, a
	ret z
	res 0, a
	ld [wSelectedOption], a
	jr .move_cursor

.not_left:
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .not_up
	ld a, [wSelectedOption]
	bit 1, a
	ret z
	res 1, a
	ld [wSelectedOption], a
	jr .move_cursor

.not_up:
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .a_button
	ld a, [wSelectedOption]
	bit 1, a
	ret nz
	set 1, a
	ld [wSelectedOption], a

.move_cursor:
	ld de, .CursorCoords
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld de, wcde0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

.a_button:
	ldh a, [hJoypadPressed]
	bit 0, a
	ret z
	ld a, [wSelectedOption]
	and a
	jr z, .selected_0
	cp 1
	jr z, .selected_1
	cp 2
	jp z, .selected_2
	cp 3
	jp z, .selected_3
	ret

.selected_0:
	ld a, [wd9b8]
	and a
	jr nz, .attack
	ld a, 1
	ld [wBattleTurn], a
	ld a, 5
	ld [wd9af], a
	xor a
	ld [wSideSelect], a
	call GetStatTile
	and a
	jr z, .attack
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	call ClearBattleOAMState
	ret

.attack:
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 4, a
	jr nz, .attack_alt
	ld a, 3
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	call ClearBattleOAMState
	ret

.attack_alt:
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	call ClearBattleOAMState
	ret

.selected_1:
	ld a, 2
	ld [wBattleScriptState], a
	ld a, 9
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, 1
	ldh [hFFC6], a
	xor a
	ld [wSelectedOption], a
	ld [wSelectedPage], a
	ld [wItemCategory], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_424c)
	inc hl
	ld [hl], HIGH(Script_024_424c)
	call ClearBattleOAMState
	ret

.selected_2:
	ld a, 1
	ld [wBattleScriptState], a
	ld a, 2
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, 1
	ldh [hFFC6], a
	xor a
	ld [wSelectedOption], a
	ld [wSelectedPage], a
	ld [wItemCategory], a
	ret

.selected_3:
	ld a, [hFFD6]
	and a
	jr nz, .run_forced
	ld de, .RunChances
	ld a, [wd0e4 + 7]
	inc a
	ld [wd0e4 + 7], a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .run_set
	xor a
	ld [wd0e4 + 7], a
	jr .selected_3

.run_set:
	ld [wd9f6], a
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	ret

.run_forced:
	ld a, 1
	ld [wd9f6], a
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [hFFC6], a
	ret

.RunChances:
	db $2, $2, $1, $1, $2, $2, $1, $2, $2, $2
	db $2, $1, $2, $2, $1, $2, $2, $2, $1, $2
	db $2, $1, $2, $1, $2, $1, $2, $2, $2, $2
	db $2, $2, $1, $1, $2, $2, $2, $1, $2, $2
	db $1, $2, $2, $1, $2, $2, $2, $1, $2, $2
	db -1

.CursorCoords:
	dw $4678
	dw $4688
	dw $7678
	dw $7688

BattleMenu_AnimCursor::
	ldh a, [hFadeFrameCounter]
	and 7
	ret nz
	ld bc, wcde0
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .grow
	ld a, [bc]
	dec a
	ld [bc], a
	jr .store

.grow:
	ld a, [bc]
	inc a
	ld [bc], a

.store:
	ld a, 1
	sub [hl]
	ld [hl], a
	ret

BattleMenu_Jump_4::
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	ldh a, [hSCX]
	ld [wd0bc], a
	ldh a, [hSCXHigh]
	ld [wd0bd], a
	ldh a, [hSCY]
	ld [wd0be], a
	ldh a, [hSCYHigh]
	ld [wd0bf], a
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wBattleScriptByte], a
	ld [hFFC6], a
	call ClearBGMap0
	ld hl, Battle_BGPals
	ld de, wPaletteBuffer
	ld bc, $30
	call CopyBytes3
	ld hl, Battle_OBPals
	ld de, wcaf0
	ld bc, $30
	call CopyBytes3
	ld hl, Battle_UI_GFX
	ld de, $96d0
	ld bc, $90
	call CopyBytesVRAM
	call DelayFrame
	ld hl, Battle_TextBoxBorder_GFX
	ld de, $9000
	ld bc, $d0
	call CopyBytesVRAM
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	ld a, [wdcaf]
	and a
	ret z
	ld a, 4
	ld [hBattleJumptableIndex], a
	ld a, 8
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMenu_Jump_5::
	ld a, 3
	ld [wBattleIntroJumptableIndex], a
	ret
