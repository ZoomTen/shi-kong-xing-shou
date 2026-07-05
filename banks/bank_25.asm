ComputeScaledHP::
	ld a, [wd3f0]
	ld c, a
	ld a, [wd3f1]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	and a
	jr z, .highByteZero
	ldh [hMathValue], a
	ld a, [hl]
	ldh [hMathValue + 1], a
	jr .scaleAndDivide

.highByteZero
	ld a, [hl]
	and a
	ret z
	xor a
	ldh [hMathValue + 1], a
	ld a, [hl]
	ldh [hMathValue], a

.scaleAndDivide
	xor a
	ldh [hMathValue + 2], a
	ld a, $20
	ldh [hMathOperand], a
	call Multiply32By8
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	push af
	ldh a, [hMathValue + 1]
	push af
	ldh a, [hMathValue + 2]
	push af
	xor a
	ld [wd9d7], a
	ld a, [wd3f0]
	ld c, a
	ld a, [wd3f1]
	ld b, a
	call _ComputeStatValue
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	ldh [hMathOperand], a
	pop af
	ldh [hMathValue + 2], a
	pop af
	ldh [hMathValue + 1], a
	pop af
	ldh [hMathValue], a
	ld b, 4
	call Divide32By16
	ret

ScanParty::
	ld bc, wPartyMons

.loop
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nextMon
	call CheckPartyMonMatch
	ld a, [wPartyScanType]
	cp $ff
	ret z

.nextMon
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, .loop
	ret

CheckPartyMonMatch::
	ld de, SpeciesScanTypeTable
	ld a, [bc]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, .checkElement14
	ld a, [wPartyScanType]
	cp [hl]
	jr z, .markFound

.checkElement14
	ld hl, $14
	add hl, bc
	ld a, [hli]
	cp $11
	jr c, .checkElement15
	cp $15
	jr nc, .checkElement15
	sub $f
	ld [hFFD7], a
	ld d, a
	ld a, [wPartyScanType]
	cp d
	jr nz, .checkElement15
	call IsSpeciesInCategoryList
	and a
	jr z, .markFound

.checkElement15
	ld hl, $15
	add hl, bc
	ld a, [hli]
	cp $11
	ret c
	cp $15
	ret nc
	sub $f
	ld [hFFD7], a
	ld d, a
	ld a, [wPartyScanType]
	cp d
	ret nz
	call IsSpeciesInCategoryList
	and a
	ret nz

.markFound
	ld a, $ff
	ld [wPartyScanType], a
	ret

ComputeBattlerStat::
	ld a, [wBattleTurn]
	and a
	jr nz, ComputeBattlerStat_TurnSet
	ld a, [wSideSelect]
	and a
	jr nz, ComputeActiveBattlerStat

ComputeEnemyBattlerStat::
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jp _ComputeStatValue

ComputeBattlerStat_TurnSet::
	ld a, [wSideSelect]
	and a
	jr nz, ComputeEnemyBattlerStat

ComputeActiveBattlerStat::
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jp _ComputeStatValue

INCLUDE "engine/battle/stat_calc.asm"

Divide32By16_StepDigit::
	ld a, e
	cp 1
	jr nz, Divide32By16_ShiftDivisor
	dec b

Divide32By16_ShiftDivisor::
	ldh a, [hMathOperand]
	srl a
	ldh [hMathOperand], a
	ldh a, [hMathOperand + 1]
	rr a
	ldh [hMathOperand + 1], a
	jr Func_025_41d1

Divide32By16_Finish::
	ldh a, [hMathValue + 2]
	ldh [hMathOperand], a
	ldh a, [hMathAccum]
	ldh [hMathValue], a
	ldh a, [hMathAccum + 1]
	ldh [hMathValue + 1], a
	ldh a, [hMathAccum + 2]
	ldh [hMathValue + 2], a
	ldh a, [hMathAccum + 3]
	ldh [hMathValue + 3], a
	pop de
	pop bc
	pop hl
	ret

DispatchBattleScriptCommand::
	ld de, BattleScriptCommandTable
	ld a, [wBattleScriptByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

PrintItemListNumber::
	ld de, wd1f5
	ld a, [wd0c3]
	ld [de], a
	ld bc, $9831
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, $ea
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ret

PrintItemGridNumber::
	ld de, wd1f5
	ld a, [wd0c3]
	ld [de], a
	ld bc, $9891
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ret

BattleScriptCommandTable::
	dw BattleScriptCmd_Nop
	dw BattleScriptCmd_PrintTextXY
	dw BattleScriptCmd_PlaceTileAttr
	dw BattleScriptCmd_VramCopy3
	dw BattleScriptCmd_SetSpritePos
	dw BattleScriptCmd_EndScript
	dw BattleScriptCmd_InitMenuA
	dw BattleScriptCmd_EndMenu
	dw BattleScriptCmd_LcdOffLoadPal
	dw BattleScriptCmd_LcdOnLoadPal
	dw BattleScriptCmd_ResetScrollClr
	dw LoadPaletteBufferFromScript
	dw LoadObjPaletteBufferFromScript
	dw LoadPartyMonPalette
	dw LoadPartyMonPic
	dw ClearAndPrintMonName
	dw DrawPartyMonIcons
	dw HideVirtualOAMSprites
	dw PrintPartyMonHP
	dw LoadAndApplyPartyMonPalette
	dw RestoreMapScreen
	dw SelectMenuOptionFromScript
	dw BackupPaletteBuffer
	dw UpdateVirtualOAM
	dw DrawMonScanPanel
	dw ClearScriptBox
	dw ResetBattleScriptState
	dw ClearScriptBoxAt
	dw DrawPartyMonStatusIcons
	dw DrawPartyMonStats
	dw UpdatePartyScrollArrows
	dw DrawPartyMonMoveList
	dw DrawPartyMonEquipName
	dw LoadMenuCursorEntry
	dw CopySpritePos
	dw SwapPartyMonData
	dw LoadMenuEntryByIndex
	dw DrawScriptMenuTextA
	dw DrawScriptMenuTextB
	dw RedrawItemList
	dw DrawPageArrows
	dw DrawSelectedItemName
	dw ClearItemMenuVRAM
	dw PrintItemQuantity
	dw DrawItemTextRight
	dw DrawPartyMonName
	dw DrawPartyMonMoveNames
	dw PrintEquipNameByIndex
	dw DrawMonEquipDetail
	dw LoadMonPicIfSeen
	dw LoadMonBGPalette
	dw DrawDexNamePage
	dw PrintTwoRecordNumbers
	dw LoadSelectedMonPalette
	dw PrintNumberFromScriptPtr
	dw DrawSelectedMonName
	dw DrawDexMonIconType
	dw DrawMonDescription
	dw LoadPlayerCharGfxPrintText
	dw PrintScriptNumberDouble
	dw DrawSaveOverwriteDialog
	dw FillVRAMFromScript
	dw SetMenuCursorSprites
	dw FarCopyToVRAMFromScript
	dw EndBattleScript
	dw DrawItemPageByFlag
	dw ClearItemCategoryMarker
	dw ClearAndDrawItemList
	dw DrawItemPageArrows
	dw PrintItemPrice
	dw ClearAndDrawBoxMonList
	dw LoadBoxMonPicAndPalette
	dw PrintBoxMonHP
	dw PrintBoxMonStats
	dw DrawBoxMonStatsScreen
	dw DrawBoxSlotNumbers
	dw ClearMenuOptionList
	dw ResetScrollAndClearBGMap
	dw CountDexSeenAndOwned
	dw ScriptCmdNop
	dw DrawPartyMonTypeName
	dw ClearScriptBoxVRAM1
	dw PrintScriptNumberSingle
	dw DrawItemTextLeft
	dw SkipScriptIfMonField14Zero
	dw DrawActiveMenuEntries
	dw DrawPersonalityDescription
	dw DrawSelectedOptionInfo
	dw BattleScriptCmd_SetTwoSprites
	dw BattleScriptCmd_LoadPalsA
	dw BattleScriptCmd_LoadMenuOption
	dw BattleScriptCmd_LoadPalsB
	dw DrawScriptMenuTextC
	dw DrawBoxMonTypeName
	dw PrintBoxCursorNumber
	dw LoadPlayerFacePic

BattleScriptCmd_Nop::
	call AdvanceBattleScript
	ret

BattleScriptCmd_PrintTextXY::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wMenuTextX], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	push de
	pop hl
	call PrintMenuText
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_PlaceTileAttr::
	farcall Func_04a_5691
	ret

BattleScriptCmd_VramCopy3::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call CopyBytesVRAM_Bank0C
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_SetSpritePos::
	ld bc, wcde0
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	ld a, 1
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_SetTwoSprites::
	ld bc, wcdf0
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	ld a, 4
	ld [bc], a
	ld bc, wcdf8
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [bc], a
	inc bc
	ld a, 6
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_LoadPalsA::
	farcall Func_00c_402b
	farcall StageSelectedCharObjPal
	ld hl, wcaf0
	ld c, $80
	ld b, $40
	call LoadPalettes_OCPD
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_LoadPalsB::
	farcall Func_00c_4000
	farcall Func_20_4048
	ld hl, wcaf0
	ld c, $80
	ld b, $40
	call LoadPalettes_OCPD
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_EndScript::
	xor a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ret

BattleScriptCmd_InitMenuA::
	call CopyScreenRegionToBuffer
	call PlaceScreenBufferTilemap
	call ApplyScreenBufferAttrmap
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_EndMenu::
	xor a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_LcdOffLoadPal::
	ld a, $80
	ldh [rLCDC], a
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_LcdOnLoadPal::
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

BattleScriptCmd_ResetScrollClr::
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
	call ClearBGMap0
	ret

BattleScriptCmd_LoadMenuOption::
	ld a, [wPlayerChar]
	ld [wSelectedOption], a
	ld de, CharObjectPosTable
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, [hli]
	ld bc, wcdf8
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

CharObjectPosTable::
	dw $1420

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
MenuOptionCoords::
	dw $1818
	dw $3420
	dw $3818
	dw $5420
	dw $5818
	dw $7420
	dw $7818
	dw $1448
	dw $1840
	dw $3448
	dw $3840
	dw $5448
	dw $5840
	dw $7448
	dw $7840

LoadPaletteBufferFromScript::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

LoadObjPaletteBufferFromScript::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

LoadPartyMonPalette::
	call GetPartyMonPtr
	ld a, [bc]
	ld [wd9d9], a
	farcall Func_026_4c89
	xor a
	ld [wBattleScriptByte], a
	ret

LoadPartyMonPic::
	call GetPartyMonPtr
	ld a, [bc]
	ld [wd9d9], a
	call LoadMonPic
	xor a
	ld [wBattleScriptByte], a
	ret

ClearAndPrintMonName::
	ld bc, $c0
	ld hl, $9620
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall asm_026_464f
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPartyMonIcons::
	xor a
	ld [wd0c3], a
	ld bc, wPartyMons

.loop
	ld a, [bc]
	and a
	jr z, .done
	call DrawPartyMonIconBox
	ld a, [wd0c3]
	inc a
	ld [wd0c3], a
	ld hl, $16
	add hl, bc
	ld c, l
	ld b, h
	ld a, c
	cp $80
	jr c, .loop

.done
	xor a
	ld [wBattleScriptByte], a
	ret

HideVirtualOAMSprites::
	ld hl, wc000
	ld bc, $28
	ld de, 4

.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ld [wBattleScriptByte], a
	ld [wVirtualOAMPtr], a
	ret

PrintPartyMonHP::
	call GetPartyMonPtr

PrintMonCurAndMaxHP::
	push bc
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	ld de, wd1f5
	ld [de], a
	inc de
	dec bc
	ld a, [bc]
	ld [de], a
	dec de
	ld hl, $998a
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	xor a
	ld [wd9d7], a
	call _ComputeStatValue
	ld de, wd1f5
	ldh a, [hMathValue + 1]
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	dec de
	ld hl, $99aa
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

LoadAndApplyPartyMonPalette::
	call GetPartyMonPtr
	ld a, [bc]
	ld [wd9d9], a
	farcall Func_026_4cb6
	xor a
	ld [wBattleScriptByte], a
	ret

RestoreMapScreen::
	ld a, [wd0bc]
	ldh [hSCX], a
	ld a, [wd0bd]
	ldh [hSCXHigh], a
	ld a, [wd0be]
	ldh [hSCY], a
	ld a, [wd0bf]
	ldh [hSCYHigh], a
	call LoadMapGFX
	decoord 0, 0
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1412
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, $12
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call LoadScreenAttrmap
	ld hl, wScreenRowBuffer
	ld de, wPaletteBuffer
	ld bc, $80
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

SelectMenuOptionFromScript::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ldh [hFFC5], a
	call LoadSelectedMenuEntry
	xor a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ret

BackupPaletteBuffer::
	ld hl, wPaletteBuffer
	ld de, wScreenRowBuffer
	ld bc, $80
	call CopyBytes3
	xor a
	ld [wBattleScriptByte], a
	ret

UpdateVirtualOAM::
	farcall _BuildVirtualOAM
	xor a
	ld [wBattleScriptByte], a
	ret

DrawMonScanPanel::
	xor a
	ld [wd0c1], a
	ld [wd0c0], a
	ld a, 1
	ld [wd9d8], a
	ldh a, [hBattleJumptableIndex]
	and a
	jr nz, .placePanel
	call GetPartyMonPtr
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, .placePanel

.placePanel
	ld de, BoxTilemapPointers
	ld a, [wd9d8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [hli]
	ld c, a
	ldh [hVRAMCopyHeight], a
	push hl
	pop de
	ld a, [de]
	inc de
	ld l, a
	ld [wd0b8], a
	ld a, [de]
	inc de
	ld h, a
	ld [wd0b9], a
	call PlaceTilemap
	ld de, BoxAttrmapPointers
	ld a, [wd9d8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [hli]
	ld c, a
	ldh [hVRAMCopyHeight], a
	push hl
	pop de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	call PlaceAttrmap
	xor a
	ld [wBattleScriptByte], a
	ret

ShowSpeciesScanTypeLabel:: ; unreferenced?
	ld de, SpeciesScanTypeTable
	ld a, [bc]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hFFD7], a
	jp PrintScanTypeLabel

AdvanceScanDisplayLine::
	ld a, [wd9d8]
	inc a
	ld [wd9d8], a
	ret

; TODO: unk_ - lookup table indexed by bc
SpeciesScanTypeTable::
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $1
	db $6
	db $0
	db $0
	db $0
	db $0
	db $1
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $6
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0

ShowMonScanType1:: ; unreferenced?
	ld hl, $14
	add hl, bc
	ld a, [hli]
	cp $11
	ret c
	cp $15
	ret nc
	sub $f
	ld [hFFD7], a
	call IsSpeciesInCategoryList
	and a
	ret nz

PrintScanTypeLabel::
	ld a, [hFFD7]
	call PrintMenuStringByIndex

AdvanceAndRecordScanType::
	ld a, [wd9d8]
	inc a
	ld [wd9d8], a
	ld a, [wd0c1]
	and a
	jr z, .recordSlot1
	ld a, [hFFD7]
	ld [wd0c0], a
	ret

.recordSlot1
	ld a, [hFFD7]
	ld [wd0c1], a
	ret

ShowMonScanType2:: ; unreferenced?
	ld hl, $15
	add hl, bc
	ld a, [hli]
	cp $11
	ret c
	cp $15
	ret nc
	sub $f
	ld [hFFD7], a
	call IsSpeciesInCategoryList
	and a
	ret nz
	jp PrintScanTypeLabel

PrintScanTypeLabelAlt:: ; unreferenced?
	ld a, [hFFD7]
	call PrintMenuStringByIndex
	jp AdvanceAndRecordScanType

IsSpeciesInCategoryList::
	push hl
	cp 5
	jr nz, .loadList
	push af
	ld a, [wdce4]
	cp 1
	jr nz, .cat5Bail
	pop af

.loadList
	ld de, CategorySpeciesLists
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [bc]
	ld e, a

.scanLoop
	ld a, [hli]
	cp $ff
	jr z, .notInList
	cp e
	jr z, .inList
	jr .scanLoop

.cat5Bail
	pop af

.notInList
	ld a, 1
	pop hl
	ret

.inList
	xor a
	pop hl
	ret

CategorySpeciesLists::
	dw ScanMatchList0
	dw ScanMatchList1
	dw ScanMatchList2
	dw ScanMatchList3
	dw ScanMatchList4
	dw ScanMatchList5

; TODO: unk_ - record pointed to by a dw pointer-table
ScanMatchList0::
	db $2, $3, $5, $6, $7, $9, $a, -1
; TODO: unk_ - record pointed to by a dw pointer-table
ScanMatchList1::
	db $d, -1
; TODO: unk_ - record pointed to by a dw pointer-table
ScanMatchList2::
	db $22, -1
; TODO: unk_ - record pointed to by a dw pointer-table
ScanMatchList3::
	db $22, -1
; TODO: unk_ - record pointed to by a dw pointer-table
ScanMatchList4::
	db $30, -1
; TODO: unk_ - record pointed to by a dw pointer-table
ScanMatchList5::
	db $22, -1

BoxTilemapPointers::
	dw Tilemap_MonInfoBox7x6
	dw Tilemap_MonInfoBox7x6
	dw Tilemap_MonInfoBox8x8
	dw Tilemap_MonInfoBox8x10
BoxAttrmapPointers::
	dw AttrMap_MonInfoBox7x6
	dw AttrMap_MonInfoBox7x6
	dw AttrMap_MonInfoBox8x8
	dw AttrMap_MonInfoBox8x10

ClearScriptBox::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	ld [hVRAMCopyHeight], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [wd0b8]
	ld l, a
	ld a, [wd0b9]
	ld h, a
	call ClearBGMapBox
	xor a
	ld [wBattleScriptByte], a
	ret

ClearScriptBoxVRAM1::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	ld [hVRAMCopyHeight], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [wd0b8]
	ld l, a
	ld a, [wd0b9]
	ld h, a
	call ClearBGMapBox_VRAM1
	xor a
	ld [wBattleScriptByte], a
	ret

ResetBattleScriptState::
	xor a
	ld [wBattleScriptByte], a
	ld [wBattleScriptState], a
	ret

ClearScriptBoxAt::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	ldh [hVRAMCopyHeight], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	ldh [hVRAMCopyWidth], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call ClearBGMapBox
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPartyMonStatusIcons::
	call GetPartyMonPtr
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, EndStatusIconCmd
	ld [wd9d8], a
	bit 0, a
	call nz, DrawStatusIconBit0
	ld a, [wd9d8]
	bit 1, a
	call nz, DrawStatusIconBit1
	ld a, [wd9d8]
	bit 4, a
	call nz, DrawStatusIconBit4
	ld a, [wd9d8]
	bit 5, a
	call nz, DrawStatusIconBit5
	jr EndStatusIconCmd

DrawStatusIconBit0::
	ld de, StatusIconTilesBit0
	ld hl, $0f0c
	jr PlaceStatusIcon

DrawStatusIconBit1::
	ld de, StatusIconTilesBit1
	ld hl, $110c
	jr PlaceStatusIcon

DrawStatusIconBit4::
	ld de, StatusIconTilesBit4
	ld hl, $0f0e
	jr PlaceStatusIcon

DrawStatusIconBit5::
	ld de, StatusIconTilesBit5
	ld hl, $110e

PlaceStatusIcon::
	call GetTextBGMapPointer
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

EndStatusIconCmd::
	xor a
	ld [wBattleScriptByte], a
	ret

StatusIconTilesBit0::
	db $2e, $2f, $36, $37
StatusIconTilesBit1::
	db $32, $33, $3a, $3b
StatusIconTilesBit4::
	db $30, $31, $38, $39
StatusIconTilesBit5::
	db $34, $35, $3c, $3d

DrawPartyMonStats::
	call GetPartyMonPtr

PrintMonStats::
	push bc
	ld a, 1
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9846
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld a, 2
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9886
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld a, 3
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9850
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld a, 5
	ld [wd9d7], a
	call _ComputeStatValue
	ldh a, [hMathValue + 1]
	ld de, wd1f5
	push de
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	pop de
	ld hl, $9890
	ld bc, $0203
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld de, wd1f5
	ld hl, 6
	add hl, bc
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	dec de
	dec de
	ld hl, $98e6
	ld bc, $0306
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	call PrintExpToNextLevel
	xor a
	ld [wBattleScriptByte], a
	ret

UpdatePartyScrollArrows::
	ld hl, wcde0
	ld [hl], $a0
	ld hl, wcdf0
	ld [hl], $a0
	ld a, [wSelectedOption]
	and a
	jr z, .showDownArrow
	ld hl, wcdf0
	ld a, $90
	ld [hli], a
	ld a, $4e
	ld [hli], a
	ld a, 2
	ld [hli], a
	ld a, [wSelectedOption]
	cp 5
	jr z, .done
	push af
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	pop af
	ld [wSelectedOption], a
	ld a, [bc]
	and a
	jr z, .done

.showDownArrow
	ld hl, wcde0
	ld a, $90
	ld [hli], a
	ld a, $5a
	ld [hli], a
	ld [hl], 1

.done
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPartyMonMoveList::
	ld bc, $0400
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr

DrawMonMoveList::
	xor a
	ld [wd0c0], a
	ld hl, 7
	add hl, bc

.loop
	ld a, [hli]
	and a
	jr z, .done
	ld [wd9d8], a
	ld a, [hli]
	ld [wd0c3], a
	ld a, [hli]
	ld [wPlayerMap2Y], a
	push hl
	farcall Func_026_4012
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0302
	add hl, bc
	call GetTextBGMapPointer
	ld de, wd1f5
	ld a, [wd0c3]
	ld [de], a
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0602
	add hl, bc
	call GetTextBGMapPointer
	ld de, wd1f5
	ld a, [wPlayerMap2Y]
	ld [de], a
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop hl
	ld a, [wd0c0]
	inc a
	ld [wd0c0], a
	cp 4
	jr nz, .loop

.done
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPartyMonEquipName::
	ld bc, $0100
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	ld hl, $14
	add hl, bc
	ld a, [hli]
	ld [wd0c1], a
	ld d, a
	ld a, [hli]
	ld [wd0c0], a
	ld a, $a0
	ld [wMenuTextX], a
	ld a, $fd
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall PrintEquipmentName
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPartyMonTypeName::
	ld bc, $40
	ld hl, $8790
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	ld a, [bc]
	ld d, a
	farcall Func_01e_42ba
	xor a
	ld [wBattleScriptByte], a
	ret

DrawBoxMonTypeName::
	ld bc, $40
	ld hl, $8790
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetBoxMonPtr
	ld a, [bc]
	ld d, a
	farcall Func_01e_42ba
	xor a
	ld [wBattleScriptByte], a
	ret

LoadMenuCursorEntry::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, 1
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

CopySpritePos::
	ld hl, wcde0
	ld de, wcdf0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	xor a
	ld [wBattleScriptByte], a
	ret

SwapPartyMonData::
	ld a, [wSelectedOption]
	push af
	ld a, [wd9d9]
	ld [wSelectedOption], a
	call GetPartyMonPtr
	pop af
	push bc
	ld [wSelectedOption], a
	ld hl, wd100
	ld d, $16

.copyMonBToTemp
	ld a, [bc]
	ld [hli], a
	inc bc
	dec d
	jr nz, .copyMonBToTemp
	call GetPartyMonPtr
	push bc
	pop hl
	pop bc
	push hl
	ld d, $16

.copyMonAToB
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .copyMonAToB
	pop bc
	ld hl, wd100
	ld d, $16

.copyTempToMonA
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .copyTempToMonA
	ld a, [wd9d9]
	ld [wSelectedOption], a
	xor a
	ld [wBattleScriptByte], a
	ret

LoadMenuEntryByIndex::
	call AdvanceBattleScript
	ld de, wd1a0
	ld a, [wBattleScriptByte]
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, 1
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

DrawScriptMenuTextA::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $a0
	ld [wMenuTextX], a
	ld a, $e8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

DrawScriptMenuTextC::
	ld bc, $0200
	ld hl, $9600
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0280
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $60
	ld [wMenuTextX], a
	ld a, $a8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

DrawScriptMenuTextB::
	ld bc, $0240
	ld hl, $8d80
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $d8
	ld [wMenuTextX], a
	ld a, $fc
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

RedrawItemList::
	ld bc, $0400
	ld hl, $9400
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0100
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall DrawItemListPage
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPageArrows::
	ld a, [wSelectedPage]
	and a
	jr z, .noLeftArrow
	ld hl, $996f
	call WaitVRAM_STAT
	ld [hl], $e8
	jr .checkRightArrow

.noLeftArrow
	ld hl, $996f
	call WaitVRAM_STAT
	ld [hl], 0

.checkRightArrow
	ld a, [wSelectedPage]
	inc a
	call GetItemListPageByte
	and a
	jr z, .noRightArrow
	ld hl, $9972
	call WaitVRAM_STAT
	ld [hl], $e9
	jr .printPageNumber

.noRightArrow
	ld hl, $9972
	call WaitVRAM_STAT
	ld [hl], 0

.printPageNumber
	ld de, wd1f5
	ld a, [wSelectedPage]
	inc a
	ld [de], a
	ld hl, $9970
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

GetItemListPageByte::
	ld l, a
	add a
	add a
	add l

GetItemListByte::
	ld l, a
	ld h, 0
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	add hl, hl
	add hl, de
	ld a, [hl]
	ret

DrawSelectedItemName::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_01e_47fb
	xor a
	ld [wBattleScriptByte], a
	ret

ClearItemMenuVRAM::
	ld bc, $0400
	ld hl, $9400
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0100
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	xor a
	ld [wBattleScriptByte], a
	ret

PrintItemQuantity::
	ld a, [wItemQty]
	ld de, wd1f5
	ld [de], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

DrawItemTextRight::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_026_45f8
	farcall Func_01e_484f
	xor a
	ld [wBattleScriptByte], a
	ret

DrawItemTextLeft::
	ld bc, $0400
	ld hl, $9400
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $80
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_026_45f8
	farcall Func_01e_487b
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPartyMonName::
	call GetPartyMonPtr
	ld bc, $0500
	ld hl, $8a80
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall Func_026_45f8
	ld a, $a8
	ld [wMenuTextX], a
	ld a, $f8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_01e_434d
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPartyMonMoveNames::
	ld bc, $0400
	ld hl, $8980
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	xor a
	ld [wd0c0], a
	ld hl, 7
	add hl, bc

.moveLoop
	ld a, [hli]
	and a
	jr z, .done
	ld [wd9d8], a
	ld a, [hli]
	ld [wd0c3], a
	ld a, [hli]
	ld [wPlayerMap2Y], a
	ld a, [wd0c0]
	add a
	add a
	add a
	add a
	add $98
	ld [wMenuTextX], a
	ld a, $d8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	push hl
	farcall Func_026_4000
	pop hl
	ld a, [wd0c0]
	inc a
	ld [wd0c0], a
	cp 4
	jr nz, .moveLoop

.done
	xor a
	ld [wBattleScriptByte], a
	ret

PrintEquipNameByIndex::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wd9d8], a
	swap a
	ld l, a
	and $f
	or $80
	ld h, a
	ld a, l
	and $f0
	ld l, a
	ld bc, $0100
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetPartyMonPtr
	ld hl, $14
	add hl, bc
	ld a, [hli]
	ld [wd0c1], a
	ld d, a
	ld a, [hli]
	ld [wd0c0], a
	ld a, [wd9d8]
	ld [wMenuTextX], a
	ld a, $90
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall PrintEquipmentName
	xor a
	ld [wBattleScriptByte], a
	ret

DrawMonEquipDetail::
	ld bc, $0480
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld de, wd1a0
	ld a, $b
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	call GetPartyMonPtrByIndex
	ld hl, $14
	add hl, bc
	ld a, [wPlayerMap2Y]
	add l
	ld [wd9d4], a
	ld a, h
	ld [wd9d5], a
	farcall Func_01e_4745
	xor a
	ld [wBattleScriptByte], a
	ret

LoadMonPicIfSeen::
	ld de, wd7cb
	ld a, [wd9d8]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .seen
	xor a
	ld [wd9d9], a
	jr .loadPic

.seen
	ld a, [wd9d8]
	inc a
	ld [wd9d9], a

.loadPic
	call LoadMonPic
	xor a
	ld [wBattleScriptByte], a
	ret

LoadMonBGPalette::
	ld a, [wd9d8]
	inc a
	ld [wd9d9], a
	farcall Func_026_4c89
	xor a
	ld [wBattleScriptByte], a
	ret

DrawDexNamePage::
	ld bc, $0600
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wSelectedPage]
	ld hl, wd7cb
	ld de, 8
	call AddDEToHLNTimes
	xor a
	ld [wd0c1], a

.dexLoop
	ld a, [hli]
	push hl
	and a
	jr nz, .notBlank
	xor a
	ld [wd0c0], a
	jr .printNameNext

.notBlank
	cp 2
	jr nz, .seen
	ld a, l
	sub $cb
	ld [wd0c0], a
	ld de, $982c
	ld a, [wd0c1]
	swap a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld bc, $0102
	ld a, 1
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	ld e, $38
	call IncFillBoxVRAM
	jr .printNameNext

.seen
	ld a, l
	sub $cb
	ld [wd0c0], a

.printNameNext
	farcall asm_026_4680
	pop hl
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 8
	jr c, .dexLoop
	xor a
	ld [wBattleScriptByte], a
	ret

AddDEToHLNTimes::
	and a
	jr z, .done

.loop
	add hl, de
	dec a
	jr nz, .loop

.done
	ret

PrintTwoRecordNumbers::
	ld de, wd0d5
	ld hl, $99e5
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld bc, $0103
	ld a, 0
	ld [wd0fd], a
	call _PrintNumber
	ld de, wd0d6
	ld hl, $9965
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld bc, $0103
	ld a, 0
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

LoadSelectedMonPalette::
	ld a, [wd9d8]
	inc a
	ld [wd9d9], a
	farcall Func_026_4cb6
	xor a
	ld [wBattleScriptByte], a
	ret

PrintNumberFromScriptPtr::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	ld a, [de]
	inc a
	ld b, a
	ld de, wd1f5
	ld [de], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

DrawSelectedMonName::
	ld bc, $c0
	ld hl, $9720
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $72
	ld [wMenuTextX], a
	ld a, $7e
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_026_53ab
	xor a
	ld [wBattleScriptByte], a
	ret

DrawDexMonIconType::
; Used in dex
	ld bc, $40
	ld hl, $93c0
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wd9d8]
	inc a
	ld d, a
	farcall Func_01e_4290
	xor a
	ld [wBattleScriptByte], a
	ret

DrawMonDescription::
	ld bc, $06c0
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $80
	ld [wMenuTextX], a
	ld a, $ec
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_026_5711
	xor a
	ld [wBattleScriptByte], a
	ret

DrawPersonalityDescription::
	ld bc, $0480
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, $80
	ld [wMenuTextX], a
	ld a, $c8
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	farcall Func_026_54cc
	xor a
	ld [wBattleScriptByte], a
	ret

LoadPlayerCharGfxPrintText::
	farcall Func_01f_4028
	ld hl, wMenuTextBuffer
	ld a, $70
	ld [wMenuTextX], a
	ld a, $7c
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
IF DEF(ENGLISH)
	; clear the name region ($9700, tiles $70-$7c) so a shorter proportional name
	; doesn't leave the tail of the previously shown wider one (mirrors
	; DrawSelectedOptionInfo)
	ld hl, $9700
	ld bc, $00c0
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld hl, wMenuTextBuffer ; reload the string pointer (clobbered by the clear)
ENDC
	call PrintMenuText
	xor a
	ld [wBattleScriptByte], a
	ret

LoadPlayerFacePic::
	farcall Func_20_407b
	ld hl, wcaf0
	ld c, $80
	ld b, $40
	call LoadPalettes_OCPD
	ld bc, wcdf8
	ld a, $18
	ld [bc], a
	inc bc
	ld a, $28
	ld [bc], a
	inc bc
	ld a, 7
	ld [bc], a
	xor a
	ld [wBattleScriptByte], a
	ret

DrawSelectedOptionInfo::
	farcall Func_01f_40b7
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	farcall Func_01f_40ea
	farcall CopySelectedOptionName
	ld hl, wMenuTextBuffer
	ld a, $d0
	ld [wMenuTextX], a
	ld a, $dc
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
IF DEF(ENGLISH)
	; clear the name region ($8d00, tiles $d0-$dc) so the previously selected
	; name doesn't linger under the new one (mirrors the desc draw's clear)
	ld hl, $8d00
	ld bc, $00c0
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld hl, wMenuTextBuffer ; reload the string pointer (clobbered by the clear)
ENDC
	call PrintMenuText
	xor a
	ld [wBattleScriptByte], a
	ret

DrawActiveMenuEntries::
	xor a
	ld [wBattleScriptByte], a

.loop
	ld de, wdd00
	ld a, [wBattleScriptByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
	farcall Func_01f_405d

.next
	ld a, [wBattleScriptByte]
	inc a
	ld [wBattleScriptByte], a
	cp 8
	jr c, .loop
	xor a
	ld [wBattleScriptByte], a
	ret

PrintScriptNumberDouble::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wd8fe], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld a, 1
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

PrintScriptNumberSingle::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wd8fe], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

DrawSaveOverwriteDialog::
	ld a, [wd9d9]
	and a
	jr z, .saveResult
	ld hl, String_025_6112
	ld a, $80
	ld [wMenuTextX], a
	ld a, $9c
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
IF DEF(ENGLISH)
	; clear the dialog text region ($8800, tiles $80-$9c) so a shorter proportional
	; string doesn't leave the tail of a wider one
	ld hl, $8800
	ld bc, ($9c - $80) * $10
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld hl, String_025_6112 ; reload the string pointer (clobbered by the clear)
ENDC
	call PrintMenuText
	ld hl, $c
	call GetTextBGMapPointer
	ld de, Tilemap_OverwriteConfirm20x6
	ld a, [de]
	inc de
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ld [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceTilemap
	xor a
	ld [wBattleScriptByte], a
	ret

.saveResult
	ld hl, String_025_611b
	ld a, $80
	ld [wMenuTextX], a
	ld a, $94
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
IF DEF(ENGLISH)
	; clear the dialog text region ($8800, tiles $80-$94) so the shorter "Save OK"
	; doesn't leave the tail of the wider "Is it OK to overwrite?" prompt
	ld hl, $8800
	ld bc, ($94 - $80) * $10
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld hl, String_025_611b ; reload the string pointer (clobbered by the clear)
ENDC
	call PrintMenuText
	ld hl, $c
	call GetTextBGMapPointer
	ld de, Tilemap_SaveResult20x6
	ld a, [de]
	inc de
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ld [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceTilemap
	call StampSaveTimeRecord
	xor a
	ld [wBattleScriptByte], a
	ret

StampSaveTimeRecord::
	ld a, [wd0d5]
	ld [wd871], a
	ld a, [wd0d6]
	ld [wd872], a
	ld a, [wd0da]
	ld [wd873], a
	ld a, [wGameTimeHours]
	ld [wd874], a
	ld a, [wGameTimeMinutes]
	ld [wd875], a
	ret

FillVRAMFromScript::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	xor a
	call ByteFillVRAM
	xor a
	ld [wBattleScriptByte], a
	ret

SetMenuCursorSprites::
	ld hl, wcdf0
	ld [hl], $a0
	ld hl, wcdf8
	ld [hl], $a0
	ld a, [wSelectedOption]
	and a
	jr z, .setSecondCursor
	ld hl, wcdf0
	ld a, $94
	ld [hli], a
	ld a, $4e
	ld [hli], a
	ld a, 2
	ld [hli], a
	ld a, [wSelectedOption]
	cp 5
	jr z, .resetState
	push af
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	pop af
	ld [wSelectedOption], a
	ld a, [bc]
	and a
	jr z, .resetState

.setSecondCursor
	ld hl, wcdf8
	ld a, $94
	ld [hli], a
	ld a, $5a
	ld [hli], a
	ld [hl], 1

.resetState
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld hl, wcde0
	ld [hl], $30
	inc hl
	ld [hl], $30
	ret

FarCopyToVRAMFromScript::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld [wTempBank], a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld c, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld b, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld d, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call FarCopyBytesVRAM
	xor a
	ld [wBattleScriptByte], a
	ret

EndBattleScript::
	xor a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld [wBattleScriptByte], a
	ld a, 2
	ld [hFFC6], a
	ret

DrawItemPageByFlag::
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .plainPage
	farcall DrawItemPageWithIcons
	xor a
	ld [wBattleScriptByte], a
	ret

.plainPage
	farcall DrawItemMenuPage
	xor a
	ld [wBattleScriptByte], a
	ret

ClearItemCategoryMarker::
	ld a, [wItemCategory]
	and a
	jr z, .cat0
	ld bc, $80
	ld hl, $9290
	jr .fill

.cat0
	ld bc, $80
	ld hl, $9310

.fill
	xor a
	call ByteFillVRAM
	xor a
	ld [wBattleScriptByte], a
	ret

ClearAndDrawItemList::
	ld bc, $0200
	ld hl, $9600
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld bc, $0280
	ld hl, $8800
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wEventFlags + 4]
	bit 0, a
	jr z, .plainList
	farcall Func_01e_47af
	xor a
	ld [wBattleScriptByte], a
	ret

.plainList
	farcall Func_01e_475c
	xor a
	ld [wBattleScriptByte], a
	ret

DrawItemPageArrows::
	ld a, [wEventFlags + 4]
	bit 0, a
	jp z, .drawArrowsAlt
	ld a, [wSelectedPage]
	and a
	jr z, .clearLeftArrow
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], $f8
	jr .drawRightArrow

.clearLeftArrow
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], 0

.drawRightArrow
	ld a, [wSelectedPage]
	inc a
	add a
	add a
	call GetItemListByte
	and a
	jr z, .clearRightArrow
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], $f9
	jr .printPageNum

.clearRightArrow
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], 0

.printPageNum
	ld de, wd1f5
	ld a, [wSelectedPage]
	inc a
	ld [de], a
	ld hl, $9990
	ld bc, $0102
	ld a, 9
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

.drawArrowsAlt
	ld a, [wSelectedPage]
	and a
	jr z, .clearLeftArrowAlt
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], $f8
	jr .drawRightArrowAlt

.clearLeftArrowAlt
	ld hl, $998f
	call WaitVRAM_STAT
	ld [hl], 0

.drawRightArrowAlt
	ld a, [wSelectedPage]
	and a
	jr nz, .clearRightArrowAlt
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], $f9
	jr .printPageNumAlt

.clearRightArrowAlt
	ld hl, $9992
	call WaitVRAM_STAT
	ld [hl], 0

.printPageNumAlt
	ld de, wd1f5
	ld a, [wSelectedPage]
	inc a
	ld [de], a
	ld hl, $9990
	ld bc, $0102
	ld a, 9
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

PrintItemPrice::
	farcall Func_01e_4416
	xor a
	ld [wBattleScriptByte], a
	ret

ClearAndDrawBoxMonList::
	ld bc, $0500
	ld hl, $8a80
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall asm_026_46af
	xor a
	ld [wBattleScriptByte], a
	ret

LoadBoxMonPicAndPalette::
	call GetBoxMonPtr
	push bc
	ld a, [bc]
	ld [wd9d9], a
	farcall Func_026_4cb6
	pop bc
	call LoadMonPic
	ld bc, $c0
	ld hl, $9620
	xor a
	call ByteFillVRAM
	call DelayFrame
	farcall asm_026_464a
	xor a
	ld [wBattleScriptByte], a
	ret

PrintBoxMonHP::
	call GetBoxMonPtr
	jp PrintMonCurAndMaxHP

PrintBoxMonStats::
	call GetBoxMonPtr
	jp PrintMonStats

DrawBoxMonStatsScreen::
	ld bc, $0400
	ld hl, $8a00
	xor a
	call ByteFillVRAM
	call DelayFrame
	call GetBoxMonPtr
	jp DrawMonMoveList

DrawBoxSlotNumbers::
	ld c, 0

.drawSlotRow
	push bc
	ld a, [wMonBoxIndex]
	add c
	ld de, wd1f5
	inc a
	ld [de], a
	ld l, c
	swap l
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9826
	add hl, bc
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop bc
	push bc
	ld de, wdca0
	ld l, c
	ld a, [wMonBoxIndex]
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, .skipLeftMarker
	ld l, c
	swap l
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9828
	add hl, bc
	ld de, SelectionMarkerRightTiles
	ld bc, $0102
	ld a, 1
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap

.skipLeftMarker
	pop bc
	push bc
	jr .nextSlot

.drawLeftMarker
	ld a, [wMonBoxIndex]
	add c
	ld l, a
	ld a, [wdc9d]
	cp l
	jr nz, .nextSlot
	ld l, c
	swap l
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, $9822
	add hl, bc
	ld de, SelectionMarkerLeftTiles
	ld bc, $0102
	ld a, 1
	ldh [hVRAMCopyWidth], a
	ld a, 2
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap

.nextSlot
	pop bc
	inc c
	ld a, c
	cp 5
	jp c, .drawSlotRow
	xor a
	ld [wBattleScriptByte], a
	ret
SelectionMarkerRightTiles::
	db $2d
	db $2e
SelectionMarkerLeftTiles::
	db $2b
	db $2c

PrintBoxCursorNumber::
	ld de, wd1f5
	ld a, [wdc9d]
	inc a
	ld [de], a
	ld hl, $9870
	ld a, $13
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	xor a
	ld [wBattleScriptByte], a
	ret

ClearMenuOptionList::
	call ClearMenuOptionBuffer
	xor a
	ld [wBattleScriptByte], a
	ret

ClearMenuOptionBuffer::
	ld hl, wd1a0
	ld c, $40
	xor a

.clearLoop
	ld [hli], a
	dec c
	jr nz, .clearLoop
	ret

ResetScrollAndClearBGMap::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wBattleScriptByte], a
	call ClearBGMap0
	xor a
	ld [wBattleScriptByte], a
	ret

CountDexSeenAndOwned::
	xor a
	ld [wd0d6], a
	ld [wd0d5], a
	ld hl, wd7cb
	ld bc, $9f

.countLoop
	ld a, [hli]
	and a
	jr z, .nextEntry
	cp 1
	jr z, .incSeen
	ld a, [wd0d5]
	inc a
	ld [wd0d5], a

.incSeen
	ld a, [wd0d6]
	inc a
	ld [wd0d6], a

.nextEntry
	dec c
	ld a, c
	or b
	jr nz, .countLoop
	xor a
	ld [wBattleScriptByte], a
	ret

ScriptCmdNop::
	xor a
	ld [wBattleScriptByte], a
	ret

SkipScriptIfMonField14Zero::
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	call GetPartyMonPtr
	ld hl, $14
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .done
	call AdvanceScriptPosByByte

.done
	xor a
	ld [wBattleScriptByte], a
	ret

AdvanceScriptPosByByte::
	push de
	push hl
	ld a, [wBattleScriptPos]
	ld e, a
	ld a, [wBattleScriptPos + 1]
	ld d, a
	ld a, [wBattleScriptByte]
	ld l, a
	ld h, 0
	add hl, de
	ld a, l
	ld [wBattleScriptPos], a
	ld a, h
	ld [wBattleScriptPos + 1], a
	pop hl
	pop de
	ret

PrintExpToNextLevel::
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	push hl
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall GetExpToNextLevel
	ld de, wd1f5
	ldh a, [hMathValue + 2]
	ld [de], a
	inc de
	ldh a, [hMathValue + 1]
	ld [de], a
	inc de
	ldh a, [hMathValue]
	ld [de], a
	ld de, wd1f5
	ld hl, $98ed
	ld bc, $0306
	ld a, $a
	ld [wd8fe], a
	ld a, 0
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	pop hl
	ld a, l
	ld [wd981], a
	ld a, h
	ld [wd982], a
	ret

unknown::
	db $0
	db $0
	db $0
	db $0
	db $8
	db $0
	db $13
	db $0
	db $25
	db $0
	db $3d
	db $0
	db $5b
	db $0
	db $7f
	db $0
	db $a9
	db $0
	db $d9
	db $0
	db $f
	db $1
	db $4b
	db $1
	db $8d
	db $1
	db $d5
	db $1
	db $23
	db $2
	db $77
	db $2
	db $d1
	db $2
	db $31
	db $3
	db $97
	db $3
	db $3
	db $4
	db $75
	db $4
	db $ed
	db $4
	db $6b
	db $5
	db $ef
	db $5
	db $79
	db $6
	db $9
	db $7
	db $9f
	db $7
	db $3b
	db $8
	db $dd
	db $8
	db $85
	db $9
	db $33
	db $a
	db $f
	db $1
	db $a1
	db $b
	db $63
	db $c
	db $27
	db $d
	db $f3
	db $d
	db $c5
	db $e
	db $9d
	db $f
	db $7b
	db $10
	db $5f
	db $11
	db $49
	db $12
	db $39
	db $13
	db $2f
	db $14
	db $2b
	db $15
	db $23
	db $16
	db $35
	db $17
	db $43
	db $18
	db $bf
	db $1a
	db $71
	db $1a
	db $91
	db $1b
	db $b7
	db $1c
	db $e3
	db $1d
	db $15
	db $1f
	db $4d
	db $20
	db $8d
	db $21
	db $cf
	db $22
	db $19
	db $24
	db $69
	db $25
	db $bf
	db $26
	db $1b
	db $28
	db $7d
	db $29
	db $e5
	db $2a
	db $53
	db $2c
	db $c7
	db $2d
	db $41
	db $2f
	db $c1
	db $30
	db $47
	db $32
	db $d3
	db $33
	db $65
	db $35
	db $fd
	db $36
	db $9d
	db $38
	db $3f
	db $3a
	db $e9
	db $3b
	db $99
	db $3d
	db $4f
	db $3f
	db $b
	db $41
	db $cd
	db $42
	db $95
	db $44
	db $63
	db $46
	db $37
	db $48
	db $11
	db $4a
	db $f1
	db $4b
	db $d7
	db $4d
	db $c3
	db $4f
	db $b5
	db $51
	db $ad
	db $53
	db $ab
	db $55
	db $af
	db $57
	db $b9
	db $59
	db $c7
	db $5b
	db $df
	db $5d
	db $fb
	db $5f
	db $1d
	db $62
	db $45
	db $64
	db $73
	db $66
	db $a7
	db $68
	db $e1
	db $6a
	db $21
	db $6d
	db $67
	db $6f
	db $b3
	db $71
	db $ff
	db $ff

LoadSelectedMenuEntry::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, 1
	ld [bc], a
	ret

PrintMenuStringByIndex::
	ld de, MenuTextPointers
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld [wCharacterTilePos], a
	ld a, $90
	ld [wMenuTextX], a
	ld a, $ff
	ld [wMenuTextEndX], a
	ld a, [wd9d8]
	cp 2
	jr nz, .printMenuText
	ld a, $98
	ld [wMenuTextX], a

.printMenuText
	call PrintMenuText
	ret

MenuTextPointers::
	dw MenuTextString0
	dw MenuTextString1
	dw MenuTextString2
	dw MenuTextString3
	dw MenuTextString4
	dw MenuTextString5

; Strings, but they don't decode into anything coherent
MenuTextString0::
	db $f0, $19, $f1, $5f, $ed
MenuTextString1::
	db $f5, $64, $f0, $56, $ed
MenuTextString2::
	db $f0, $5d, $f5, $a0, $ed
MenuTextString3::
	db $f8, $0d, $f3, $05, $ed
MenuTextString4::
	db $f3, $73, $f1, $5f, $ed
MenuTextString5::
	db $f5, $63, $f0, $80, $ed

LoadScreenAttrmap::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz
	hlcoord 0, 0
	ld a, h
	ld [wAnimFramePtr + 1], a
	ld a, l
	ld [wAnimFramePtr], a
	call BuildAttrmapStrip
	ld de, wd100
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1406
	ld a, $14
	ld [hVRAMCopyWidth], a
	ld a, 6
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	call BuildAttrmapStrip
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld de, $c0
	add hl, de
	ld a, h
	and 3
	or $98
	ld h, a
	ld de, wd100
	ld bc, $1406
	ld a, $14
	ld [hVRAMCopyWidth], a
	ld a, 6
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	call BuildAttrmapStrip
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld de, $0180
	add hl, de
	ld a, h
	and 3
	or $98
	ld h, a
	ld de, wd100
	ld bc, $1406
	ld a, $14
	ld [hVRAMCopyWidth], a
	ld a, 6
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	ret

BuildAttrmapStrip::
	ld hl, wd100
	ld a, h
	ld [wBGMapAddr + 1], a
	ld a, l
	ld [wBGMapAddr], a
	ld a, [wAnimFramePtr + 1]
	ld h, a
	ld a, [wAnimFramePtr]
	ld l, a
	ld de, wMapTileAttrs
	ld c, $78

.convertTile
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, de
	push de
	ld a, [wBGMapAddr + 1]
	ld d, a
	ld a, [wBGMapAddr]
	ld e, a
	ld a, [hli]
	ld [de], a
	pop de
	ld hl, wBGMapAddr
	inc [hl]
	pop hl
	dec c
	jr nz, .convertTile
	ld a, l
	ld [wAnimFramePtr], a
	ld a, h
	ld [wAnimFramePtr + 1], a
	ret

DrawPartyMonIconBox::
	push bc

; Get starting address for each "icon box"
	ld a, [wd0c3]
	ld l, a
	ld h, 0
	ld de, .coords
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [wd1f2], a
	ld a, h
	ld [wd1f3], a
	call GetTextBGMapPointer

; Place tilemap
	lb bc, $06, $04
	ld a, $06
	ld [hVRAMCopyWidth], a
	ld a, $04
	ld [hVRAMCopyHeight], a
	ld de, Tilemap_PartyMonIconBox6x4
	call PlaceTilemap

; Place attribute map
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	lb bc, $06, $04
	ld a, $06
	ld [hVRAMCopyWidth], a
	ld a, $04
	ld [hVRAMCopyHeight], a
	ld de, AttrMap_PartyMonIconBox6x4
	call PlaceAttrmap

	pop bc
	push bc
	ld a, [bc]
	ld d, a
	farcall Func_01e_431f

; Add [1, 1] to point to where icons should load
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	lb bc, $01, $01
	add hl, bc
	call GetTextBGMapPointer

; Load mon icon tilemap
	ld a, [wd0c3]
	sla a
	sla a ; 4 tiles
	add $80 ; start at tile $80
	ld e, a
	lb bc, $02, $02
	ld a, $02
	ld [hVRAMCopyWidth], a
	ld [hVRAMCopyHeight], a
	call IncFillBoxVRAM

	pop bc
	push bc
	call PrintMonIconNumber
	pop bc
	push bc

	call DelayFrame
	call DrawMonStatBar
	pop bc
	ret

.coords
	db $00, $00
	db $00, $07
	db $00, $0e
	db $04, $00
	db $04, $07
	db $04, $0e

DrawMonStatBar::
	ld a, c
	ld [wd3f0], a
	ld a, b
	ld [wd3f1], a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	and a
	jr z, .singleByteValue
	ldh [hMathValue], a
	ld a, [hl]
	ldh [hMathValue + 1], a
	jr .computeBarFill

.singleByteValue
	ld a, [hl]
	and a
	ret z
	xor a
	ldh [hMathValue + 1], a
	ld a, [hl]
	ldh [hMathValue], a

.computeBarFill
	xor a
	ldh [hMathValue + 2], a
	ld a, $20
	ldh [hMathOperand], a
	call Multiply32By8
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	push af
	ldh a, [hMathValue + 1]
	push af
	ldh a, [hMathValue + 2]
	push af
	xor a
	ld [wd9d7], a
	ld a, [wd3f0]
	ld c, a
	ld a, [wd3f1]
	ld b, a
	call _ComputeStatValue
	ld a, 4
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ldh a, [hMathValue]
	ldh [hMathOperand], a
	pop af
	ldh [hMathValue + 2], a
	pop af
	ldh [hMathValue + 1], a
	pop af
	ldh [hMathValue], a
	ld b, 4
	call Divide32By16
	ld d, 0
	ldh a, [hMathValue]
	cp $20
	jr c, .splitTiles
	ld a, $20
	ldh [hMathValue], a

.splitTiles
	srl a
	rr d
	srl a
	rr d
	srl a
	rr d
	ld e, a
	ld a, d
	swap a
	srl a
	ld d, a
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0103
	add hl, bc
	call GetTextBGMapPointer
	ld a, e
	ld b, a
	and a
	jr z, .checkPartial

.fillLoop
	call WaitVRAM_STAT
	ld a, $70
	ld [hli], a
	dec e
	jr nz, .fillLoop

.checkPartial
	ld a, b
	cp 4
	ret z
	ld a, e
	and a
	jr nz, .drawCap
	ld a, d
	and a
	jr nz, .drawCap
	ld d, 1

.drawCap
	ld a, $78
	sub d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

INCLUDE "data/monsters/stats.asm"
PrintMonIconNumber::
	ld hl, 1
	add hl, bc
	push hl
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f3]
	ld h, a
	ld bc, $0402
	add hl, bc
	call GetTextBGMapPointer
	pop de
	ld bc, $0102
	ld a, $a
	ld [wd8fe], a
	xor a
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call _PrintNumber
	ret

_PrintNumber::
	push bc
	xor a
	ldh [hMathValue + 3], a
	ldh [hMathValue + 2], a
	ldh [hMathValue + 1], a
	ld a, b
	and $f
	cp 1
	jr z, .load1Byte
	cp 2
	jr z, .load2Bytes
	ld a, [de]
	ldh [hMathValue + 2], a
	inc de
	ld a, [de]
	ldh [hMathValue + 1], a
	inc de
	ld a, [de]
	ldh [hMathValue], a
	jr .dispatchByDigitCount

.load2Bytes
	ld a, [de]
	ldh [hMathValue + 1], a
	inc de
	ld a, [de]
	ldh [hMathValue], a
	jr .dispatchByDigitCount

.load1Byte
	ld a, [de]
	ldh [hMathValue], a

.dispatchByDigitCount
	push de
	ld d, b
	ld a, c
	ld b, a
	xor a
	ld c, a
	ld a, b
	cp 2
	jr z, .printTensOnes
	cp 3
	jr z, .printHundreds
	cp 4
	jr z, .printThousands
	cp 5
	jr z, .printTenThousands
	cp 6
	jr z, .printHundredThousands
	ld a, $f
	ldh [hMathOperand], a
	ld a, $42
	ldh [hMathOperand + 1], a
	ld a, $40
	ldh [hMathAccum + 3], a
	call PrintPlaceValueDigit
	call AdvanceDigitColumn

.printHundredThousands
	ld a, 1
	ldh [hMathOperand], a
	ld a, $86
	ldh [hMathOperand + 1], a
	ld a, $a0
	ldh [hMathAccum + 3], a
	call PrintPlaceValueDigit
	call AdvanceDigitColumn

.printTenThousands
	xor a
	ldh [hMathOperand], a
	ld a, $27
	ldh [hMathOperand + 1], a
	ld a, $10
	ldh [hMathAccum + 3], a
	call PrintPlaceValueDigit
	call AdvanceDigitColumn

.printThousands
	xor a
	ldh [hMathOperand], a
	ld a, 3
	ldh [hMathOperand + 1], a
	ld a, $e8
	ldh [hMathAccum + 3], a
	call PrintPlaceValueDigit
	call AdvanceDigitColumn

.printHundreds
	xor a
	ldh [hMathOperand], a
	xor a
	ldh [hMathOperand + 1], a
	ld a, $64
	ldh [hMathAccum + 3], a
	call PrintPlaceValueDigit
	call AdvanceDigitColumn

.printTensOnes
	ld c, 0
	ldh a, [hMathValue]

.divModTenLoop
	cp $a
	jr c, .printTens
	sub $a
	inc c
	jr .divModTenLoop

.printTens
	ld b, a
	ldh a, [hMathValue + 3]
	or c
	ldh [hMathValue + 3], a
	jr nz, .tensSingle
	call PrintLeadingZeroDigit
	jr .printOnes

.tensSingle
	ld a, [wd1fc]
	and a
	jr nz, .tensDouble
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	jr .printOnes

.tensDouble
	push bc
	ld a, c
	add a
	ld c, a
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, c
	inc a
	ld [hl], a
	pop hl
	pop bc

.printOnes
	call AdvanceDigitColumn
	ld a, [wd1fc]
	and a
	jr nz, .onesDouble
	ld a, [wd8fe]
	add b
	ld b, a
	call WaitVRAM_STAT
	ld a, b
	ld [hli], a
	pop de
	dec de
	pop bc
	ret

.onesDouble
	ld a, b
	add a
	ld b, a
	ld a, [wd8fe]
	add b
	ld b, a
	call WaitVRAM_STAT
	ld a, b
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, b
	inc a
	ld [hl], a
	pop hl
	inc hl
	pop de
	dec de
	pop bc
	ret

PrintPlaceValueDigit::
	ld c, 0

.subtractLoop
	ldh a, [hMathOperand]
	ld b, a
	ldh a, [hMathValue + 2]
	ldh [hMathAccum + 2], a
	cp b
	jr c, .printDigit
	sub b
	ldh [hMathValue + 2], a
	ldh a, [hMathOperand + 1]
	ld b, a
	ldh a, [hMathValue + 1]
	ldh [hMathAccum + 1], a
	cp b
	jr nc, .subMidByte
	ldh a, [hMathValue + 2]
	or 0
	jr z, .restoreHigh
	dec a
	ldh [hMathValue + 2], a
	ldh a, [hMathValue + 1]

.subMidByte
	sub b
	ldh [hMathValue + 1], a
	ldh a, [hMathAccum + 3]
	ld b, a
	ldh a, [hMathValue]
	ldh [hMathAccum], a
	cp b
	jr nc, .subLowByte
	ldh a, [hMathValue + 1]
	and a
	jr nz, .borrowLowByte
	ldh a, [hMathValue + 2]
	and a
	jr z, .restoreMid
	dec a
	ldh [hMathValue + 2], a
	xor a

.borrowLowByte
	dec a
	ldh [hMathValue + 1], a
	ldh a, [hMathValue]

.subLowByte
	sub b
	ldh [hMathValue], a
	inc c
	jr .subtractLoop

.restoreMid
	ldh a, [hMathAccum + 1]
	ldh [hMathValue + 1], a

.restoreHigh
	ldh a, [hMathAccum + 2]
	ldh [hMathValue + 2], a

.printDigit
	ldh a, [hMathValue + 3]
	or c
	jr z, PrintLeadingZeroDigit
	ld a, [wd1fc]
	and a
	jr nz, .printDigitTall
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	ldh [hMathValue + 3], a
	ret

.printDigitTall
	ld a, c
	add a
	ld c, a
	ld a, [wd8fe]
	add c
	ld c, a
	call WaitVRAM_STAT
	ld a, c
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, c
	inc a
	ld [hl], a
	ldh [hMathValue + 3], a
	pop hl
	ret

PrintLeadingZeroDigit::
	ld a, [wd0fd]
	and a
	jr nz, .drawZeroTile
	bit 7, d
	ret z

.drawZeroTile
	ld a, [wd1fc]
	and a
	jr nz, .drawZeroTileTall
	call WaitVRAM_STAT
	ld a, [wd8fe]
	ld [hl], a
	ret

.drawZeroTileTall
	call WaitVRAM_STAT
	ld a, [wd8fe]
	ld [hl], a
	push hl
	ld de, $20
	add hl, de
	call WaitVRAM_STAT
	ld a, [wd8fe]
	inc a
	ld [hl], a
	pop hl
	ret

AdvanceDigitColumn::
	bit 7, d
	jr nz, .advance
	bit 6, d
	jr z, .advance
	ldh a, [hMathValue + 3]
	and a
	ret z

.advance
	inc hl
	ret

DrawStatusConditionIcons::
	ld e, 0
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	ret z
	bit 4, a
	jr z, .checkBit5
	call DrawStatusIcon

.checkBit5
	inc e
	ld a, [hl]
	bit 5, a
	jr z, .checkBit1
	call DrawStatusIcon

.checkBit1
	inc e
	ld a, [hl]
	bit 1, a
	jr z, .checkBit0
	call DrawStatusIcon

.checkBit0
	inc e
	ld a, [hl]
	bit 0, a
	ret z
	call DrawStatusIcon
	ret

DrawStatusIcon::
	push hl
	push bc
	ld bc, StatusIconBGMapOffsets
	ld l, e
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1f2]
	ld c, a
	ld a, [wd1f3]
	ld b, a
	add hl, bc
	push de
	call GetTextBGMapPointer
	pop de
	ld a, e
	add $2e
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	pop bc
	pop hl
	ret

; TODO: unk_ - indexed table (index hli)
StatusIconBGMapOffsets::
	dw $100d
	dw $120d
	dw $100f
	dw $120f

ApplyScreenBufferAttrmap::
	ld hl, wScreenRowBuffer
	ld de, wd100
	ld c, $54

.lookupAttr
	ld a, [hli]
	push hl
	ld hl, wMapTileAttrs
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, .lookupAttr
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	ld de, wd100
	ld a, 7
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, $c
	ld c, a
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap
	ret

PlaceScreenBufferTilemap::
	ld hl, $0d00
	call GetTextBGMapPointer
	ld a, 7
	ld b, a
	ld [hVRAMCopyWidth], a
	ld a, $c
	ld c, a
	ld [hVRAMCopyHeight], a
	ld de, wScreenRowBuffer
	call PlaceTilemap
	ret

CopyScreenRegionToBuffer::
	hlcoord 0, 0
	ld de, $d
	add hl, de
	ld de, wScreenRowBuffer
	ld bc, $070c

.nextRow
	push hl

.copyTile
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copyTile
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	ld b, 7
	dec c
	jr nz, .nextRow
	ret

INCLUDE "text/menu_25_6099.asm"

Palette_BattleUIBG::
	db $ff, $7f, $14, $63, $a5, $35, $00, $00, $ff, $7f, $5f, $03, $1b, $00, $00, $00
	db $ff, $7f, $a0, $7e, $80, $70, $00, $00, $ff, $7f, $d6, $6e, $6b, $41, $00, $00
	db $ff, $7f, $4d, $03, $c0, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Palette_BattleUIObj::
	db $b5, $56, $00, $00, $1d, $00, $bf, $67, $b5, $56, $ff, $45, $3f, $53, $7e, $03
	db $b5, $56, $00, $00, $d6, $6e, $de, $7b, $b5, $56, $00, $00, $1d, $00, $bf, $67
	db $ff, $7f, $6b, $7f, $4a, $7d, $00, $00, $ff, $7f, $3f, $03, $18, $00, $00, $00

INCLUDE "text/menu_25_6199.asm"

Tilemap_MonInfoBox7x6:: INCBIN "gfx/tilemaps/tilemap_025_61c4.tilemap"
AttrMap_MonInfoBox7x6:: INCBIN "gfx/tilemaps/tilemap_025_61f2.tilemap"
Tilemap_MonInfoBox8x8:: INCBIN "gfx/tilemaps/tilemap_025_6220.tilemap"
AttrMap_MonInfoBox8x8:: INCBIN "gfx/tilemaps/tilemap_025_6264.tilemap"
Tilemap_MonInfoBox8x10:: INCBIN "gfx/tilemaps/tilemap_025_62a8.tilemap"
AttrMap_MonInfoBox8x10:: INCBIN "gfx/tilemaps/tilemap_025_62fc.tilemap"
Tilemap_OverwriteConfirm20x6:: INCBIN "gfx/tilemaps/tilemap_025_6350.tilemap"
Tilemap_SaveResult20x6:: INCBIN "gfx/tilemaps/tilemap_025_63ca.tilemap"

AttrMap_PartyMonIconBox6x4::
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $02, $01, $01, $01, $01, $02 ; HP Bar

Tilemap_PartyMonIconBox6x4::
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $17, $0a, $0b ; Lv01
	db $6e, $78, $78, $78, $78, $6f ; HP Bar
