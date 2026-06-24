_UpdatePlayerMapCoords::
	ld a, [wPlayerObject]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	ld [wd3f9], a
	call GetSouthFacingTile
	call GetNorthFacingTile
	call GetWestFacingTile
	call GetEastFacingTile
	ret

CopyBGMapAttributes:
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz
	ld a, $98
	ld [wBGMapAddr + 1], a
	ld a, 0
	ld [wBGMapAddr], a
	ld hl, wTilemap
	ld de, wMapTileAttrs
	ld a, 1
	ldh [rVBK], a
	ld b, $12
.row
	ld c, $14
.col
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
	jr nz, .col
	ld a, [wBGMapAddr]
	add $c
	ld [wBGMapAddr], a
	ld a, [wBGMapAddr + 1]
	adc 0
	ld [wBGMapAddr + 1], a
	dec b
	jr nz, .row
	xor a
	ldh [rVBK], a
	ret

CopyVisibleTilemapWindow:
	ld hl, wc740
	ldh a, [hFFA0]
	and a
	jr z, .check_col_offset
	ld bc, $30
	add hl, bc
.check_col_offset
	ldh a, [hFF9F]
	and a
	jr z, .copy_win
	inc hl
	inc hl
.copy_win
	call CopyMapWindowToTilemap
	ret

CopyTextboxAttrs:: ; unreferenced?
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wd100
	ld c, $a0
	call LookupTileAttrs
	ret

ParseCurrentMapEvents::
; Determine player's Y position
; Store it to c
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wPlayerScreenY]
	sub $10
	ld c, a
	ld a, 0
	sbc 0
	ld b, a
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld c, l
	ldh a, [hMapOffsetY]
	add a
	add c
	ld c, a

; Determine player's X position
; Store it to b
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wPlayerScreenX]
	sub 8
	ld e, a
	ld a, 0
	sbc 0
	ld d, a
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld b, l
	ldh a, [hMapOffsetX]
	add a
	add b
	ld b, a

	ld hl, wMapEvents

MapEventLoop:
.check_x
	push hl
	ld a, [hli]
; $FF marks end of map events
	cp -1
	jr z, .exit
; $EE marks any X position
	cp ABSOLUTE
	jr z, .check_y
	cp b
	jr nz, JumpToNextMapEvent

.check_y
	ld a, [hli]
; $EE marks any Y position
	cp ABSOLUTE
	jr z, .execute_event
	cp c
	jr nz, JumpToNextMapEvent

.execute_event
	ld de, MapEvent_Jumptable
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.exit
	pop hl
	xor a
	ld [wSignpostNumber], a
	ld [wFoundItem], a
	ld [wd0f8], a
	ld [wd0ee], a
	ret

JumpToNextMapEvent:
	pop hl
	ld a, l
	add 6
	ld l, a
	jr MapEventLoop

MapEvent_Jumptable:
	dw MapEvent_Warp      ; 00
	dw MapEvent_Script    ; 01
	dw MapEvent_Signpost  ; 02
	dw MapEvent_FarWarp   ; 03
	dw MapEvent_04        ; 04
	dw MapEvent_05        ; 05
	dw MapEvent_06        ; 06
	dw MapEvent_07        ; 07

MapEvent_Warp:
	pop hl
	ld a, [hli]
	ldh [hMapNumber], a
	ld a, [hli]
	ldh [hWarpNumber], a
	ld a, [hli]
	ldh [hScrollNumber], a
	ld a, 1
	ldh [hFade], a
	pop hl
	ret

MapEvent_FarWarp:
	pop hl
	ld a, [hli]
	ldh [hMapNumber], a
	ld a, [hli]
	ldh [hWarpNumber], a
	ld a, [hli]
	ldh [hMapGroup], a
	xor a
	ld [hScrollNumber], a
	ld a, 1
	ldh [hFade], a
	pop hl
	ret

MapEvent_Script:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hMapPredef]
	cp [hl]
	jp nz, JumpToNextMapEvent

.no_conditional
	inc hl
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	ld a, 1
	ldh [hFFD6], a
	xor a
	ld [wScriptByte], a
	ld [wSignpostNumber], a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_Signpost:
	pop hl
	ld a, [hli]
	ld [wSignpostNumber], a
	xor a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_04:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hMapPredef]
	cp [hl]
	jp nz, JumpToNextMapEvent

.no_conditional
	inc hl
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	ld a, 1
	ld [wd0f8], a
	xor a
	ld [wSignpostNumber], a
	ld [wd0ee], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_05:
	pop hl
	ld a, [hli]
	ld [wd0ee], a
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	xor a
	ld [wSignpostNumber], a
	ld [wd0f8], a
	ld [wFoundItem], a
	pop hl
	ret

MapEvent_06:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hMapPredef]
	cp [hl]
	jp nc, JumpToNextMapEvent

.no_conditional
	inc hl
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hli]
	ld [wScriptPos + 1], a
	ld a, 1
	ldh [hFFD6], a
	xor a
	ld [wScriptByte], a
	pop hl
	ret

MapEvent_07:
	pop hl
	ld a, [hli]
	ld [wFoundItem], a
	xor a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wSignpostNumber], a
	pop hl
	ret

Overworld::
; upon entering overworld
	call PlayMapMusic
; ?
	ld a, $1C
	ld [wdce7], a

	xor a
	ldh [hFade], a
	ldh [hTextSource], a
	ldh [hFFC2], a	; map animations

	xor a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ldh [hFF9F], a
	ldh [hFFA0], a
	ldh [hFFC2], a
	ldh [hJoypadDown], a
	ldh [hJoypadPressed], a
	ld a, $FF
	ldh [hFF9E], a

	ld hl, wTileAnimFrameCounters
	ld c, $0C
	xor a
.fill
	ld [hli], a
	dec c
	jr nz, .fill

	call CopyPlayerCharName
	call SetMapZoneFlags
	call LoadMap
	call CopyMapBufferToTilemap
	ld hl, $9800
	ld de, wTilemap
	ld bc, $1412
	ld a, $12
	ld [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call CopyBlockToVRAM
	call ClearObjectData
	call LoadVisibleMapObjects
	call CopyBGMapAttributes
	call SpawnPlayerSprite
	call _UpdatePlayerMapCoords
	xor a
	ldh [hSimulatedJoypadState], a
	ldh [hFFA4], a
	call BuildVirtualOAM
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	ld [wd9d2], a
	call FadeInPalette

OverworldLoop:
	call DelayFrame

; increase frame counter
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a

; check if we're fading to another map
	ldh a, [hFade]
	and a
	jp nz, Overworld_DoFade

; check if we have any part of the start menu open
	ldh a, [hFFC5]
	and a
	jp nz, Overworld_GotoProcessStartMenu

; check if we should be in battle
	ldh a, [hBattleJumptableIndex]
	and a
	jp nz, Overworld_GotoBattleJumptable

; not in battle

	call UpdateWalkAnimTimer
; update OAM?
	call BuildVirtualOAM

; check if we should briefly display
; a short text scroll now
	ldh a, [hScrollNumber]
	and a
	jp nz, Overworld_GotoProcessScroll

; check if we should be spawning
; a text box
	ldh a, [hTextSource]
	and a
	jp nz, Overworld_GotoProcessTextbox

; check if we are currently in a script
	ldh a, [hFFD6]
	and a
	jp nz, Overworld_GotoProcessScript

; trigger joypad reading
	ld a, $01
	ld [wd082], a

; move one step
	call Overworld_MovePlayerOneStep

; check for fade (again)
	ldh a, [hFade]
	and a
	jr nz, Overworld_DoFade

; disable joypad reading
	xor a
	ld [wd082], a

; if we are in a battle, go back to loop
	ld a, [hBattleJumptableIndex]
	and a
	jr nz, OverworldLoop

; specific events in the overworld
	call Overworld_DoBlackFlashing
	call HandleOverworldInput
	call Overworld_ProcessJoypadInput

; object events?
	call UpdateVisibleObjects
	call UpdatePlayerAnim
	call UpdateObjectAnimations
	jp OverworldLoop

Overworld_GotoProcessScript:
	xor a
	ld [wd082], a
	call DispatchScriptCommand
	call UpdateObjectAnimations
	call UpdatePlayerAnim
	jp OverworldLoop

Overworld_GotoProcessTextbox:
	ld hl, wTextStart
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp OverworldLoop

Overworld_GotoProcessScroll:
	call AnimatePaperScroll
	jp OverworldLoop

Overworld_GotoProcessStartMenu:
	call ExecuteBattleScript
	jp OverworldLoop

Overworld_GotoBattleJumptable:
	farcall BattleJumptable
	jp OverworldLoop

Overworld_DoFade:
	ld a, [wPlayerFacing]
	ld [wd0e3], a
	ld a, [wcd23]
	ld [wdcec], a
	jp JumpToGameMode

Overworld_DoBlackFlashing:
; for maps 04:06 through 04:09
; flashes to black, and then flashes back
; to the original palette
	ld a, [hMapGroup]
	cp $04
	ret nz
	ldh a, [hMapNumber]
	cp $06
	jr z, .DoFlash
	cp $07
	jr z, .DoFlash
	cp $08
	jr z, .DoFlash
	cp $09
	jr z, .DoFlash
	ret

.DoFlash:
	ld a, [wdcb9]
	and a
	jr z, FlashToBlack
	ld a, [wdcb8]
	inc a
	ld [wdcb8], a
	cp $20
	ret nz
	xor a
	ld [wdcb8], a
	ld [wdcb9], a
	ld hl, Palette_005_4394
	call PartialCopyBackgroundPalettes
	ret

FlashToBlack:
	ld a, [wdcb8]
	inc a
	ld [wdcb8], a
	cp $18
	ret nz
	xor a
	ld [wdcb8], a
	ld a, $01
	ld [wdcb9], a
	ld hl, Palettes_005_4364
	call PartialCopyBackgroundPalettes
	ret

Palettes_005_4364:
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0

Palette_005_4394:
	RGB 31, 31, 31
	RGB 31, 31,  4
	RGB 31,  6,  0
	RGB  0,  0,  0
	RGB 24, 31, 31
	RGB  8, 21, 31
	RGB  0,  4, 28
	RGB  0,  0,  0
	RGB 31, 23, 12
	RGB 27, 13,  4
	RGB 17,  5,  0
	RGB  0,  0,  0
	RGB 24, 31, 16
	RGB 17, 31,  9
	RGB 10, 22,  6
	RGB  0,  0,  0
	RGB 29, 29, 18
	RGB 25, 25,  9
	RGB 17, 17,  4
	RGB  0,  0,  0
	RGB 30, 30, 27
	RGB 24, 25, 19
	RGB 18, 18, 13
	RGB  9,  9,  2

; Unreferenced (dead) tilemap-place routine. Final call target $57a0 is stale: it lands
; mid-instruction inside Overworld_ProcessJoypadInput, so it stays a bare address.
DrawFullScreenTilemap:
	ld de, wTilemap
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
	call $57a0
	ret

UpdateWalkAnimTimer:
	ld a, [wdcfa]
	and a
	ret z
	dec a
	ld [wdcfa], a
	and a
	jr z, .set
	and $07
	ret nz
	ld hl, wcd02
	ld a, $01
	sub [hl]
	ld [hl], a
	jr .done
.set
	ld a, $01
	ld [wcd02], a
.done
	ldh [hFFAC], a
	ld [wdcd0], a
	ld a, $0A
	ldh [hFFAD], a
	ret

CopyPlayerCharName:
	farcall CopyNameByIndex
	ret

UpdateObjectAnimations::
	ld bc, wd1a0
.objectLoop
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	and a
	jr z, .nextObject
	ld hl, $0003
	add hl, bc
	ld de, .Jumptable
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.nextObject
	ld hl, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	ld c, l
	ld b, h
	jr .objectLoop
.Jumptable:
	dw .state0
	dw .state1
	dw .state2
	dw .state3
	dw .state4
	dw .state5
	dw .state6
	dw .state7Done
.state7Done
	ret
.state5
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr z, .s5Phase0
	cp $01
	jr z, .s5Phase1
.s5Phase0
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $10
	jp c, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld hl, $0002
	add hl, bc
	ld [hl], $1B
	jp .nextObject
.s5Phase1
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $07
	jr nc, .s5Reset
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $1B
	jr z, .s5SetFrame1C
	ld [hl], $1B
	jp .nextObject
.s5SetFrame1C
	ld [hl], $1C
	jp .nextObject
.s5Reset
	call .clearObjectState
	jp .nextObject
	jp .nextObject
	jp .nextObject
.state6
	jp .nextObject
.state0
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s0Phase1
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .nextObject
.s0Phase1
	ld a, [hl]
	cp $01
	jr nz, .s0Default
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .s0Reset
	cp $0A
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $05
	jr nz, .s0SetFrame05
	ld [hl], $06
	jp .nextObject
.s0SetFrame05
	ld [hl], $05
	jp .nextObject
.s0Reset
	call .clearObjectState
	jp .nextObject
.s0Default
	jp .nextObject
.state1
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s1Phase1
	ldh a, [hFadeFrameCounter]
	and $01
	jp nz, .nextObject
	ld a, [bc]
	inc a
	ld [bc], a
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0A
	jp c, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	jp .nextObject
.s1Phase1
	cp $01
	jr nz, .s1Default
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .s1Reset
	cp $0A
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $07
	jr nz, .s1SetFrame07
	ld [hl], $06
	jp .nextObject
.s1SetFrame07
	ld [hl], $07
	jp .nextObject
.s1Reset
	call .clearObjectState
	jp .nextObject
.s1Default
	jp .nextObject
.state2
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s2Phase1
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .nextObject
.s2Phase1
	cp $01
	jr nz, .s2Default
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0E
	jr nc, .s2Reset
	cp $06
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $09
	jr nz, .s2SetFrame09
	ld [hl], $06
	jp .nextObject
.s2SetFrame09
	ld [hl], $09
	jp .nextObject
.s2Reset
	call .clearObjectState
	jp .nextObject
.s2Default
	jp .nextObject
.state3
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .s3Phase1
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .nextObject
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .nextObject
.s3Phase1
	ld a, [hl]
	cp $01
	jr nz, .s3Default
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .nextObject
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .s3Reset
	cp $0A
	jp c, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $0B
	jr nz, .s3SetFrame0B
	ld [hl], $06
	jp .nextObject
.s3SetFrame0B
	ld [hl], $0B
	jp .nextObject
.s3Reset
	call .clearObjectState
	jp .nextObject
.s3Default
	jp .nextObject
.state4
	ldh a, [hFadeFrameCounter]
	and $0F
	jp nz, .nextObject
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $0D
	jr nz, .s4SetFrame0D
	ld a, $06
	ld [hl], a
	jr .s4Phase2
.s4SetFrame0D
	ld a, $0D
	ld [hl], a
.s4Phase2
	ldh a, [hFadeFrameCounter]
	and $1F
	jp nz, .nextObject
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $04
	jr nc, .s4Reset
	jp .nextObject
.s4Reset
	call .clearObjectState
	jp .nextObject
	jp .nextObject
.clearObjectState
	push bc
	pop hl
	ld d, $08
	xor a
.clearLoop
	ld [hli], a
	dec d
	jr nz, .clearLoop
	ret
	db $E0, $00, $00, $F0, $01, $02, $03, $04, $05, $06, $07, $ED, $F0, $03, $08, $09
	db $0A, $0B, $0C, $0D, $EC, $F0, $0E, $0F, $10, $0D, $EE, $F0, $11, $12, $10, $0D
	db $EE, $F0, $13, $14, $10, $15, $16, $17, $18, $ED, $F0, $19, $1A, $1B, $1C, $1A
	db $1D, $1E, $ED, $F0, $18, $1F, $20, $21, $22, $0C, $0D, $E2, $EF

LoadVisibleMapObjects:
	ld hl, wda00
.loop
	ldh a, [hFFAA]
	ld d, a
	ldh a, [hFFAB]
	ld e, a
	push hl
	ld a, [hli]
	cp $88
	jr z, .endList
	cp $ff
	jr nz, .skipObject
	inc hl
	ld a, d
	cp $02
	jr c, .checkY
	sub $02
.checkY
	cp [hl]
	jr nc, .skipObject
	add $0c
	cp [hl]
	jr c, .skipObject
	inc hl
	ld a, e
	cp $02
	jr c, .checkX
	sub $02
.checkX
	cp [hl]
	jr nc, .skipObject
	add $0b
	cp [hl]
	jr c, .skipObject
	inc hl
	ld a, [hli]
	and a
	jr nz, .checkFlag
	inc hl
	inc hl
	inc hl
	jr .loadSprite
.checkFlag
	push bc
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [de]
	ld b, a
	ld a, c
	and a
	jr z, .testFlagBit
.shiftLoop
	srl b
	dec c
	jr nz, .shiftLoop
.testFlagBit
	ld a, b
	and $01
	cp [hl]
	jr z, .flagMatch
	pop bc
	jr .skipObject
.flagMatch
	pop bc
.loadSprite
	pop de
	push de
	call LoadObjectSprite
	ld a, c
	and a
	jr z, .noFacing
	swap a
	and $0f
	srl a
	pop hl
	ld [hl], a
	jr .nextObject
.noFacing
	pop hl
	jr .nextObject
.skipObject
	pop hl
.nextObject
	ld bc, $000c
	add hl, bc
	jp .loop
.endList
	pop hl
	ret

GetEastFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	ld c, a
	ld b, 0
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	add $10
	ld e, a
	ld d, 0
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wEastFacingTile], a
	ret

GetWestFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	ld c, a
	ld b, 0
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	sub $10
	ld e, a
	ld d, 0
	cp $e0
	jr c, .addXOffset
	ld d, $ff

.addXOffset:
	add hl, de
	ld d, 0
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wWestFacingTile], a
	ret

GetNorthFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	sub $10
	ld c, a
	ld b, 0
	cp $e0
	jr c, .addScrollY
	ld b, $ff

.addScrollY:
	add hl, bc
	ld b, 0
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	ld e, a
	ld d, 0
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wNorthFacingTile], a
	ret

GetSouthFacingTile:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	add $10
	ld c, a
	ld b, 0
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl b
	ld c, l
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd3f9]
	ld e, a
	ld d, 0
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	rl d
	ld e, l
	call GetBlockCollision
	ld a, [wd0c8]
	ld [wSouthFacingTile], a
	ret

StepFollowerMovement:
	ldh a, [hFFDD]
	and a
	ret z
	ldh a, [hFFDD]
	bit 3, a
	jr z, .checkBit2
	call .handleBit3
	ret
.checkBit2
	ldh a, [hFFDD]
	bit 2, a
	jr z, .checkBit1
	call .handleBit2
	ret
.checkBit1
	ldh a, [hFFDD]
	bit 1, a
	jr z, .checkBit0
	call .handleBit1
	ret
.checkBit0
	ldh a, [hFFDD]
	bit 0, a
	ret z
	call .handleBit0
	ret
.handleBit3
	ld a, [wcd23]
	and a
	jr z, .b3State0
	cp $01
	jr z, .b3State1
	cp $02
	jr z, .b3State2
	cp $03
	jr z, .b3State3
	ret
.b3State1
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .b3Finish
.b3State3
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .b3Finish
.b3State2
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .b3Finish
.b3State0
	ld hl, wcd20
	inc [hl]
	inc [hl]
.b3Finish
	ld a, [hFFDE]
	dec a
	dec a
	ld [hFFDE], a
	ret nz
	xor a
	ldh [hFFDD], a
	ld [wcd23], a
	ret
.handleBit2
	ld a, [wcd23]
	and a
	jr z, .b2State0
	cp $01
	jr z, .b2State1
	cp $02
	jr z, .b2State2
	cp $03
	jr z, .b2State3
	ret
.b2State1
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .b2Finish
.b2State3
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .b2Finish
.b2State2
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .b2Finish
.b2State0
	ld hl, wcd20
	inc [hl]
	inc [hl]
.b2Finish
	ld a, [hFFDE]
	dec a
	dec a
	ld [hFFDE], a
	ret nz
	xor a
	ldh [hFFDD], a
	ld a, $01
	ld [wcd23], a
	ret
.handleBit1
	ld a, [wcd23]
	and a
	jr z, .b1State0
	cp $01
	jr z, .b1State1
	cp $02
	jr z, .b1State2
	cp $03
	jr z, .b1State3
	ret
.b1State1
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .b1Finish
.b1State3
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .b1Finish
.b1State2
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .b1Finish
.b1State0
	ld hl, wcd20
	inc [hl]
	inc [hl]
.b1Finish
	ld a, [hFFDE]
	dec a
	dec a
	ld [hFFDE], a
	ret nz
	xor a
	ldh [hFFDD], a
	ld a, $02
	ld [wcd23], a
	ret
.handleBit0
	ld a, [wcd23]
	and a
	jr z, .b0State0
	cp $01
	jr z, .b0State1
	cp $02
	jr z, .b0State2
	cp $03
	jr z, .b0State3
	ret
.b0State1
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .b0Finish
.b0State3
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .b0Finish
.b0State2
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .b0Finish
.b0State0
	ld hl, wcd20
	inc [hl]
	inc [hl]
.b0Finish
	ld a, [hFFDE]
	dec a
	dec a
	ld [hFFDE], a
	ret nz
	xor a
	ldh [hFFDD], a
	ld a, $03
	ld [wcd23], a
	ret

Overworld_MovePlayerOneStep:
	ld a, $01
	ld [hFFBB], a
	ldh a, [hSimulatedJoypadState]
	and a
	ret z
	xor a
	ld [wd3f2], a
	ld [wd3f3], a
	ld a, [hFFBB]
	and a
	jp nz, .asm_4a28
	ldh a, [hSimulatedJoypadState]
	bit 3, a
	jr nz, .asm_4989
	bit 2, a
	jr nz, .asm_49a9
	bit 1, a
	jr nz, .asm_49c9
	bit 0, a
	jr nz, .asm_49ed
	ret
.asm_4989
	call .asm_4b37
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_49a3
	ld a, $FF
	ld [wd3f3], a
	ld hl, hSCY
	ld a, [hl]
	add $01
	ld [hli], a
	jr nc, .asm_4a0f
	inc [hl]
	jr .asm_4a0f
.asm_49a3
	ld hl, wVisibleObjects
	inc [hl]
	jr .asm_4a0f
.asm_49a9
	call .asm_4b58
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_49c3
	ld a, $01
	ld [wd3f3], a
	ld hl, hSCY
	ld a, [hl]
	sub $01
	ld [hli], a
	jr nc, .asm_4a0f
	dec [hl]
	jr .asm_4a0f
.asm_49c3
	ld hl, wVisibleObjects
	dec [hl]
	jr .asm_4a0f
.asm_49c9
	xor a
	ld [wd3f3], a
	call .asm_4b7b
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_49e7
	ld a, $01
	ld [wd3f2], a
	ld hl, hSCX
	ld a, [hl]
	sub $01
	ld [hli], a
	jr nc, .asm_4a0f
	dec [hl]
	jr .asm_4a0f
.asm_49e7
	ld hl, wPlayerScreenX
	dec [hl]
	jr .asm_4a0f
.asm_49ed
	xor a
	ld [wd3f3], a
	call .asm_4b9e
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_4a0b
	ld a, $FF
	ld [wd3f2], a
	ld hl, hSCX
	ld a, [hl]
	add $01
	ld [hli], a
	jr nc, .asm_4a0f
	inc [hl]
	jr .asm_4a0f
.asm_4a0b
	ld hl, wPlayerScreenX
	inc [hl]
.asm_4a0f
	call StepFollowerMovement
	call .asm_4ae5
	ld a, [hFFA6]
	dec a
	ld [hFFA6], a
	and a
	ret nz
	xor a
	ldh [hSimulatedJoypadState], a
	call ParseCurrentMapEvents
	call LoadVisibleMapObjects
	ret
.asm_4a28
	ldh a, [hSimulatedJoypadState]
	bit 3, a
	jr nz, .asm_4a3b
	bit 2, a
	jr nz, .asm_4a5c
	bit 1, a
	jr nz, .asm_4a7d
	bit 0, a
	jr nz, .asm_4aa2
	ret
.asm_4a3b
	call .asm_4b37
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_4a55
	ld a, $FE
	ld [wd3f3], a
	ld hl, hSCY
	ld a, [hl]
	add $02
	ld [hli], a
	jr nc, .asm_4ac5
	inc [hl]
	jr .asm_4ac5
.asm_4a55
	ld hl, wVisibleObjects
	inc [hl]
	inc [hl]
	jr .asm_4ac5
.asm_4a5c
	call .asm_4b58
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_4a76
	ld a, $02
	ld [wd3f3], a
	ld hl, hSCY
	ld a, [hl]
	sub $02
	ld [hli], a
	jr nc, .asm_4ac5
	dec [hl]
	jr .asm_4ac5
.asm_4a76
	ld hl, wVisibleObjects
	dec [hl]
	dec [hl]
	jr .asm_4ac5
.asm_4a7d
	xor a
	ld [wd3f3], a
	call .asm_4b7b
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_4a9b
	ld a, $02
	ld [wd3f2], a
	ld hl, hSCX
	ld a, [hl]
	sub $02
	ld [hli], a
	jr nc, .asm_4ac5
	dec [hl]
	jr .asm_4ac5
.asm_4a9b
	ld hl, wPlayerScreenX
	dec [hl]
	dec [hl]
	jr .asm_4ac5
.asm_4aa2
	xor a
	ld [wd3f3], a
	call .asm_4b9e
	ldh a, [hFF9E]
	cp $EE
	jr z, .asm_4ac0
	ld a, $FE
	ld [wd3f2], a
	ld hl, hSCX
	ld a, [hl]
	add $02
	ld [hli], a
	jr nc, .asm_4ac5
	inc [hl]
	jr .asm_4ac5
.asm_4ac0
	ld hl, wPlayerScreenX
	inc [hl]
	inc [hl]
.asm_4ac5
	call StepFollowerMovement
	call .asm_4ae5
	ld a, [hFFA6]
	dec a
	dec a
	ld [hFFA6], a
	and a
	ret nz
	xor a
	ldh [hSimulatedJoypadState], a
	call CheckMapPositionTrigger
	call ParseCurrentMapEvents
	call LoadVisibleMapObjects
	call StartBattle
	ret
.asm_4ae5
	ld bc, wcd20
.asm_4ae8
	ld hl, $0002
	add hl, bc
	ld a, [hld]
	and a
	jr z, .asm_4b0a
	ld a, [wd3f2]
	add [hl]
	ld [hld], a
	cp $E0
	jr nc, .asm_4afd
	cp $B0
	jr nc, .asm_4b16
.asm_4afd
	ld a, [wd3f3]
	add [hl]
	ld [hl], a
	cp $F0
	jr nc, .asm_4b0a
	cp $B0
	jr nc, .asm_4b16
.asm_4b0a
	ld hl, $0020
	add hl, bc
	ld c, l
	ld b, h
	ld a, l
	cp $E0
	ret nc
	jr .asm_4ae8
.asm_4b16
	ld a, c
	swap a
	srl a
	and a
	jr z, .asm_4b2a
	ld hl, wda00
	ld de, $000C
.asm_4b24
	cp [hl]
	jr z, .asm_4b2a
	add hl, de
	jr .asm_4b24
.asm_4b2a
	ld [hl], $FF
	ld l, c
	ld h, b
	ld e, $20
	xor a
.asm_4b31
	ld [hli], a
	dec e
	jr nz, .asm_4b31
	jr .asm_4b0a
.asm_4b37
	ld a, [hFFA6]
	cp $10
	ret nz
	ld a, [wVisibleObjects]
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub $08
	ld [wd3f9], a
	call GetSouthFacingTile
	call GetNorthFacingTile
	call GetWestFacingTile
	call GetEastFacingTile
	ret
.asm_4b58
	ld a, [hFFA6]
	cp $10
	ret nz
	ld a, [wVisibleObjects]
	sub $20
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub $08
	ld [wd3f9], a
	call GetSouthFacingTile
	call GetNorthFacingTile
	call GetWestFacingTile
	call GetEastFacingTile
	ret
.asm_4b7b
	ld a, [hFFA6]
	cp $10
	ret nz
	ld a, [wVisibleObjects]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub $18
	ld [wd3f9], a
	call GetSouthFacingTile
	call GetNorthFacingTile
	call GetWestFacingTile
	call GetEastFacingTile
	ret
.asm_4b9e
	ld a, [hFFA6]
	cp $10
	ret nz
	ld a, [wVisibleObjects]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	add $08
	ld [wd3f9], a
	call GetSouthFacingTile
	call GetNorthFacingTile
	call GetWestFacingTile
	call GetEastFacingTile
	ret

HandleOverworldInput:
	ldh a, [hSimulatedJoypadState]
	and a
	ret nz
	ldh a, [hFFD6]
	and a
	ret nz
	call CyclePlayerCharacter
	call OverworldInteract
	ld a, [wd3f4]
	and a
	ret nz
	ld hl, unk_005_5632
	ld a, [wd0df]
	and a
	jr z, .readDirInput
	cp $01
	jr z, .state1Table
	cp $02
	jr z, .state2Table
	cp $03
	jr z, .state3Table
	jr .readDirInput
.state1Table
	ld hl, unk_005_5650
	jr .readDirInput
.state2Table
	ld hl, unk_005_566e
	jr .readDirInput
.state3Table
	ld hl, unk_005_568c
	jr .readDirInput

.readDirInput:
	ld de, 6
	ldh a, [hJoypadPressed]
	bit START_F, a
	jp nz, InitStartMenu

	ldh a, [hJoypadDown]
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right

	jr .loadInputEntry

.down:
	add hl, de

.up:
	add hl, de

.left:
	add hl, de

.right:
	add hl, de

.loadInputEntry:
	ld a, [hli]
	ldh [hFF9E], a
	ld a, [hli]
	ldh [hSimulatedJoypadState], a
	ld a, [hli]
	ld [wd1f9], a
	ld a, [hli]
	ld [wd1fa], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ldh [hFFA1], a
	ldh a, [hFF9E]
	cp $ff
	jr nz, .handleTileAction
	call CheckMapPositionTrigger
	ret

.handleTileAction:
	xor a
	ld [wd0ec], a
	ldh a, [hFFA1]
	and a
	jr z, CheckSpriteThenClearFlag
	cp $04
	jp z, CheckFollowerMapTrigger
	cp $03
	jr z, CheckFollowerSprite
CheckTileHighNibble:
	and $F0
	cp $20
	jr z, CheckMapGroupForItem
CommitPlayerFacing:
	ldh a, [hFF9E]
	ld [wPlayerFacing], a
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ld [wcd0a], a
	ld a, $01
	ldh [hFFAC], a
	ld [wdcd0], a
	ret

ApplyPlayerFacingTurn:
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	jr z, CheckSpriteThenClearFlag
	ld a, $01
	ld [wcd0a], a
	jr ApplyFacing
CheckFollowerSprite:
	ld a, [wPlayerSpriteID]
	cp $09
	jr nz, CommitPlayerFacing
	jr ClearTurnFlag
CheckMapGroupForItem:
	jr CommitPlayerFacing
	ldh a, [hMapGroup]
	cp $01
	jr nz, CommitPlayerFacing
	ld a, $01
	ld [wd0ec], a
	ldh a, [hFFA1]
	and $0f
	ld [wItemIndex], a
CheckSpriteThenClearFlag:
	ld a, [wPlayerSpriteID]
	cp $09
	jr z, CommitPlayerFacing
ClearTurnFlag:
	xor a
	ld [wcd0a], a
ApplyFacing:
	ldh a, [hFF9E]
	cp $ff
	ret z
	ld a, $01
	ldh [hFFAC], a
	ldh a, [hFF9E]
	ld hl, wPlayerFacing
	cp [hl]
	jr z, .facingUnchanged
	ld [hl], a
	ld [wd0e3], a
	ld a, [wPlayerSpriteID]
	and a
	jr nz, .facingUnchanged
	ld a, $ff
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ld [wPlayerAnimFrame], a
	ld a, $01
	ld [wd3f4], a
	ld a, $01
	ld [wdcd0], a
	jr PositionFollowerInFront
	ret
.facingUnchanged
	call CheckObjectInFront
	and a
	jp nz, CheckTileHighNibble
PositionFollowerInFront:
	ld a, [wdcea]
	and a
	ret z
	ld a, [wPlayerFacing]
	and a
	jr z, .facingUp
	cp $01
	jr z, .facingDown
	cp $02
	jr z, .facingRight
	cp $03
	jr z, .facingLeft
	ret
.facingUp
	ld a, [wPlayerMapX]
	ld [wcd32 + 1], a
	ld a, [wPlayerMapY]
	dec a
	ld [wcd32], a
	ld a, $08
	ldh [hFFDD], a
	xor a
	ld [wdcee], a
	jr .applyPosition
.facingDown
	ld a, [wPlayerMapX]
	ld [wcd32 + 1], a
	ld a, [wPlayerMapY]
	inc a
	ld [wcd32], a
	ld a, $04
	ldh [hFFDD], a
	ld a, $01
	ld [wdcee], a
	jr .applyPosition
.facingRight
	ld a, [wPlayerMapY]
	ld [wcd32], a
	ld a, [wPlayerMapX]
	inc a
	ld [wcd32 + 1], a
	ld a, $02
	ldh [hFFDD], a
	ld a, $02
	ld [wdcee], a
	jr .applyPosition
.facingLeft
	ld a, [wPlayerMapY]
	ld [wcd32], a
	ld a, [wPlayerMapX]
	dec a
	ld [wcd32 + 1], a
	ld a, $01
	ldh [hFFDD], a
	ld a, $03
	ld [wdcee], a
	jr .applyPosition
.applyPosition
	ld a, [hFFAB]
	ld b, a
	ld a, [wcd32]
	sub b
	swap a
	and $f0
	add $10
	ld [wcd3e], a
	ld a, [hFFAA]
	ld b, a
	ld a, [wcd32 + 1]
	sub b
	swap a
	and $f0
	add $08
	ld [wcd3e + 1], a
	ld a, $10
	ld [hFFDE], a
	ld a, $01
	ldh [hFFDB], a
	ld [wdceb], a
	ret
GetPlayerMapTileX:
	ld a, [wPlayerScreenX]
	sub $08
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAA]
	add e
	ret
GetPlayerMapTileY:
	ld a, [wPlayerObject]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [hFFAB]
	add e
	ret
DrainPartyHPOnField:
	ld a, [wdcfa]
	and a
	ret nz
	ld hl, $0005
	add hl, de
	ld a, [hl]
	cp $01
	jr z, .startDrain
	cp $02
	jr z, .startDrain
	ret
.startDrain
	ld a, $40
	ld [wdcfa], a
	call .drainParty
	ret
.drainParty
	ld bc, wPartyMon1
.monLoop
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nextMon
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr z, .checkHpLow
	jr nz, .subtractHp
	jr .setMinHp
.checkHpLow
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $06
	jr nc, .subtractHp
.setMinHp
	ld hl, $0003
	add hl, bc
	ld [hl], $00
	ld hl, $0002
	add hl, bc
	ld [hl], $01
	jr .nextMon
.subtractHp
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	sub $05
	ld [hl], a
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	sbc a, $00
	ld [hl], a
.nextMon
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, .monLoop
	ret
CheckFollowerMapTrigger:
	ldh a, [hMapGroup]
	cp $01
	ret nz
	ldh a, [hMapNumber]
	cp $1e
	jr z, .onTriggerMap
	cp $1f
	jr z, .onTriggerMap
	cp $20
	jr z, .onTriggerMap
	cp $21
	jr z, .onTriggerMap
	ret
.onTriggerMap
	ldh a, [hFF9E]
	cp $ff
	ret z
	ld a, $01
	ldh [hFFAC], a
	xor a
	ld [wcd0a], a
	ldh a, [hFF9E]
	ld hl, wPlayerFacing
	cp [hl]
	jr z, .facingMatches
	ld [hl], a
	ld a, $ff
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ld [wPlayerAnimFrame], a
	ld a, $01
	ld [wd3f4], a
	ld a, $01
	ld [wdcd0], a
	ret
.facingMatches
	jp PositionFollowerInFront
	ret

CheckMapPositionTrigger:
	ldh a, [hMapGroup]
	cp $01
	ret nz
	ldh a, [hMapNumber]
	cp $1e
	jr z, .map1e
	cp $1f
	jr z, .map1f
	cp $20
	jr z, .map20
	cp $21
	jp z, .map21
	ret
.map1e
	call GetPlayerMapTileX
	cp $02
	jr z, .map1eColLeft
	cp $09
	ret nz
	call GetPlayerMapTileY
	cp $06
	jr z, .map1eColXTriggerB
	cp $04
	jr z, .map1eColXTriggerA
	ret
.map1eColXTriggerA
	ld de, wcd60
	call DrainPartyHPOnField
	jp .triggerDone
.map1eColXTriggerB
	ld de, wNPCObjects
	call DrainPartyHPOnField
	jp .triggerDone
.map1eColLeft
	call GetPlayerMapTileY
	cp $03
	jr z, .map1eColLeftTriggerB
	cp $05
	jr z, .map1eColLeftTriggerA
	ret
.map1eColLeftTriggerA
	ld de, wcda0
	call DrainPartyHPOnField
	jp .triggerDone
.map1eColLeftTriggerB
	ld de, wcd80
	call DrainPartyHPOnField
	jp .triggerDone
.map1f
	call GetPlayerMapTileX
	cp $02
	jr z, .map1fColLeft
	cp $09
	ret nz
	call GetPlayerMapTileY
	cp $06
	ret nz
	ld de, wNPCObjects
	call DrainPartyHPOnField
	jp .triggerDone
.map1fColLeft
	call GetPlayerMapTileY
	cp $03
	ret nz
	ld de, wcd60
	call DrainPartyHPOnField
	jp .triggerDone
.map20
	call GetPlayerMapTileX
	cp $02
	jr z, .map20ColLeft
	cp $06
	ret nz
	call GetPlayerMapTileY
	cp $05
	jr z, .map20TriggerA
	cp $03
	jr z, .map20TriggerB
	ret
.map20TriggerA
	ld de, wNPCObjects
	call DrainPartyHPOnField
	jp .triggerDone
.map20TriggerB
	ld de, wcd60
	call DrainPartyHPOnField
	jp .triggerDone
.map20ColLeft
	call GetPlayerMapTileY
	cp $04
	jr z, .map20ColLeftTriggerA
	cp $06
	jr z, .map20ColLeftTriggerB
	ret
.map20ColLeftTriggerA
	ld de, wcd80
	call DrainPartyHPOnField
	jp .triggerDone
.map20ColLeftTriggerB
	ld de, wcda0
	call DrainPartyHPOnField
	jp .triggerDone
.map21
	call GetPlayerMapTileX
	cp $07
	ret nz
	call GetPlayerMapTileY
	cp $06
	ret nz
	ld de, wNPCObjects
	call DrainPartyHPOnField
.triggerDone
	ret

InitStartMenu:
; Init Start Menu
	ld a, 1
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	call ClearStartMenuBuffer
	ret

ClearStartMenuBuffer:
	ld hl, wcde0
	ld c, $20
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret

StartBattle:
; battles only enabled after a certain scene?
	ldh a, [hMapPredef]
	cp MAPPREDEF_04
	ret c
; don't do battle while a scene transition is happening
	ldh a, [hFade]
	and a
	ret nz
	ld a, [wd0d3]
	and a
	ret z
	call .asm_4f7a
	and a
	ret z
	ld a, BGM_BATTLE_TRANSITION
	call PlaySound
	xor a
	ld [wd9dc], a
	ld [wd9bf], a
	ld a, $01
	ldh [hBattleJumptableIndex], a
	call InitBattleParticipants
	xor a
	ld [wBattleIntroJumptableIndex], a
	ldh [hFF9E], a
	ldh [hSimulatedJoypadState], a
	ld [wcd0a], a
	ret
.asm_4f7a
	ld a, [wd9eb]
	and a
	jr z, .asm_4f86
	dec a
	ld [wd9eb], a
	jr .asm_4fc9
.asm_4f86
	ld a, [wBattleCounter]
	inc a
	ld [wBattleCounter], a
	and $03
	call z, .asm_501d
	ld a, [wd0d3]
	cp $02
	jr z, .asm_4faa
	ld de, .table2
	ld a, [wBattleCounter]
	cp $19
	jr nc, .asm_4fbb
	ld l, a
	ld h, $00
	add hl, de
	ld b, [hl]
	jr .asm_4fbd
.asm_4faa
	ld de, .table1
	ld a, [wBattleCounter]
	cp $22
	jr nc, .asm_4fbb
	ld l, a
	ld h, $00
	add hl, de
	ld b, [hl]
	jr .asm_4fbd
.asm_4fbb
	ld b, $80
.asm_4fbd
	call AdvanceRNG
	ld a, [wd991]
	cp b
	jr nc, .asm_4fc9
	ld a, $01
	ret
.asm_4fc9
	xor a
	ret
.table1
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $0c, $0c, $0c
	db $0c, $0c, $18, $18, $18, $24, $24, $30, $30, $3c, $3c, $3c, $49, $49, $55, $55
	db $55, $61, $61, $61, $6d, $6d, $6d, $80, $80, $80, $80
.table2
	db $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $0c, $0c, $0c, $18, $18, $18
	db $24, $24, $24, $30, $30, $3c, $3c, $3c, $49, $49, $55, $55, $55, $61, $61, $61
	db $6d, $6d, $6d, $80, $80, $80, $80
.asm_501d
	push de
	ld d, $00
	ld bc, wPartyMons
.asm_5023
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5068
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, .asm_5068
	bit 0, a
	jr z, .asm_5068
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_5055
	dec hl
	ld a, [hl]
	sub $01
	ld [hli], a
	ld a, [hl]
	sbc $00
	ld [hl], a
	ld d, $01
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_5055
	jr .asm_5068
.asm_5055
	ld a, BGM_MONSTER_FAINTED
	call PlaySound
	ld hl, $0002
	add hl, bc
	ld [hl], $01
	ld hl, $0013
	add hl, bc
	ld [hl], $00
	jr .asm_5082
.asm_5068
	ld hl, $0016
	add hl, bc
	ld c, l
	ld b, h
	ld a, c
	cp $80
	jr c, .asm_5023
	ld a, d
	and a
	jr z, .asm_5082
	farcall Func_00b_4dc5
	ld a, SFX_17
	call PlaySound
.asm_5082
	pop de
	ret

CheckPartyAllFainted:
	ld bc, wPartyMons
.loop
	ld a, [bc]
	and a
	jr z, .nextMon
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	jr nz, .notFainted
.nextMon
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, l
	cp $80
	jr c, .loop
	ld a, $01
	ret
.notFainted
	xor a
	ret

InitBattleParticipants:
	farcall Func_02d_5086
	xor a
	ld [wd987], a
	ld hl, wd876
	ld a, l
	ld [wd984], a
	ld a, h
	ld [wd985], a
	ld a, [hl]
	ld [wEnemyMonSpecies], a

	ld bc, wPartyMons
	ld e, 0
.loop:
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .foundSlot

	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc e
	ld a, l
	cp $80
	ret nc

	ld c, l
	ld b, h
	jr .loop

.foundSlot:
	ld a, e
	ld [wd983], a
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	ret


CyclePlayerCharacter:
	ldh a, [hJoypadPressed]
	bit 2, a
	ret z
	ld a, [hMapPredef]
	cp $11
	ret z
	ld a, [wPlayerSpriteID]
	cp 9
	ret z
	ld a, [wPlayerChar]

.nextChar:
	inc a

.checkSlot:
	push af
	ld de, wdd00
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	jr z, .slotEmpty
	pop af
	ld [wPlayerChar], a
	farcall Func_024_4000
	farcall CopyNameByIndex
	ret

.slotEmpty:
	pop af
	cp 8
	jr c, .nextChar
	xor a
	jr .checkSlot
	ret

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
	jr z, asm_005_5148
	call TryBoardFacingBlock
	call TryInteractSignpost
	call TryShowFoundItem
	ret

asm_005_5148:
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

ApplyMapSpecialPalette:
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

Overworld_ProcessJoypadInput:
	ldh a, [hFF9E]
	cp $80
	ret nc
	and a
	jp z, .asm_5785
	cp $01
	jp z, .asm_57ba
	cp $02
	jp z, .asm_57ec
	cp $03
	jp z, .asm_581e
	ret
.asm_5785
	ld a, [wPlayerObject]
	cp $50
	jr nc, .asm_5796
.asm_578c
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_5796
	ld hl, hFFA9
	ldh a, [hFFAB]
	cp [hl]
	jr nz, .asm_57ad
	ld a, [wPlayerObject]
	cp $90
	jr c, .asm_578c
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_57ad
	call ScrollMapDown
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_5879
	ret
.asm_57ba
	ld a, [wPlayerObject]
	cp $60
	jr c, .asm_57cb
.asm_57c1
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_57cb
	ldh a, [hFFAB]
	and a
	jr nz, .asm_57df
	ld a, [wPlayerObject]
	cp $20
	jr nc, .asm_57c1
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_57df
	call ScrollMapUp
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_5853
	ret
.asm_57ec
	ld a, [wPlayerScreenX]
	cp $58
	jr c, .asm_57fd
.asm_57f3
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_57fd
	ldh a, [hFFAA]
	and a
	jr nz, .asm_5811
	ld a, [wPlayerScreenX]
	cp $18
	jr nc, .asm_57f3
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_5811
	call ScrollMapLeft
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_58aa
	ret
.asm_581e
	ld a, [wPlayerScreenX]
	cp $48
	jr nc, .asm_582f
.asm_5825
	ld a, $EE
	ldh [hFF9E], a
	ld a, $10
	ld [hFFA6], a
	ret
.asm_582f
	ld hl, hFFA8
	ldh a, [hFFAA]
	cp [hl]
	jr nz, .asm_5846
	ld a, [wPlayerScreenX]
	cp $90
	jr c, .asm_5825
	ld a, $FF
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ret
.asm_5846
	call ScrollMapRight
	call BuildBlockmap
	call CopyVisibleTilemapWindow
	call .asm_58d0
	ret
.asm_5853
	ld hl, wTilemap
	ld de, wd128
	call CopyTilemapRowToBuffer
	ld c, $28
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call BuildBGMapRowPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_5879
	hlcoord 0, 16
	ld de, wd128
	call CopyTilemapRowToBuffer
	ld c, $28
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $0200
	add hl, bc
	ld a, h
	and $03
	or $98
	ld e, l
	ld d, a
	call BuildBGMapRowPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_58aa
	ld hl, wTilemap
	ld de, wd128
	call CopyTilemapColumnToBuffer
	ld c, $24
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call BuildBGMapColumnPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret
.asm_58d0
	hlcoord 18, 0
	ld de, wd128
	call CopyTilemapColumnToBuffer
	ld c, $24
	call BuildEdgeAttrBuffer
	ld a, [wd0ba]
	ld e, a
	and $E0
	ld b, a
	ld a, e
	add $12
	and $1F
	or b
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call BuildBGMapColumnPointers
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret

BuildEdgeAttrBuffer:
	ld hl, wd128
	ld de, wd100

LookupTileAttrs:
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
	jr nz, LookupTileAttrs
	ret


CopyTilemapRowToBuffer:
	ld c, $28

.loop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

CopyTilemapColumnToBuffer:
	ld c, $12

.loop:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $13
	add l
	ld l, a
	jr nc, .nextRow
	inc h

.nextRow:
	dec c
	jr nz, .loop
	ret

BuildBGMapColumnPointers:
	ld hl, wBGMapBufferPointers
	ld c, $12

.loop:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, .nextSlot
	inc d
	ld a, d
	and 3
	or $98
	ld d, a

.nextSlot:
	dec c
	jr nz, .loop
	ld a, $12
	ldh [hFFA5], a
	ret

BuildBGMapRowPointers:
	ld hl, wBGMapBufferPointers
	push de
	call StoreBGMapRowPointers
	pop de
	ld a, $20
	add e
	ld e, a

StoreBGMapRowPointers:
	ld c, $a

.storeRow:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	inc a
	and $1f
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
	dec c
	jr nz, .storeRow
	ld a, $14
	ldh [hFFA5], a
	ret

ScrollMapDown:
	ld hl, hFFAB
	inc [hl]
	ld a, [wd0ba]
	add $40
	ld [wd0ba], a
	jr nc, .noCarry
	ld a, [wd0bb]
	inc a
	and 3
	or $98
	ld [wd0bb], a

.noCarry:
	ld hl, hFFA0
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret nz
	call MoveMapAttrPtrDown
	ret

MoveMapAttrPtrDown:
	ld hl, wMapAttributes
	ld a, [hMapWidth]
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

ScrollMapUp:
	ld hl, hFFAB
	dec [hl]
	ld a, [wd0ba]
	sub $40
	ld [wd0ba], a
	jr nc, .noWrap
	ld a, [wd0bb]
	dec a
	and 3
	or $98
	ld [wd0bb], a

.noWrap:
	ld hl, hFFA0
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret z
	call MoveMapAttrPtrUp
	ret

MoveMapAttrPtrUp:
	ld hl, wMapAttributes
	ld a, [hMapWidth]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

ScrollMapLeft:
	ld hl, hFFAA
	dec [hl]
	ld a, [wd0ba]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub 2
	and $1f
	or d
	ld [wd0ba], a
	ld hl, hFF9F
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret z
	call MoveMapAttrPtrLeft
	ret

MoveMapAttrPtrLeft:
	ld hl, wMapAttributes
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

ScrollMapRight:
	ld hl, hFFAA
	inc [hl]
	ld a, [wd0ba]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add 2
	and $1f
	or d
	ld [wd0ba], a
	ld hl, hFF9F
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret nz
	call MoveMapAttrPtrRight
	ret

MoveMapAttrPtrRight:
	ld hl, wMapAttributes
	ld a, [hl]
	add 1
	ld [hli], a
	ret nc
	inc [hl]
	ret

CopyMapBufferToTilemap:
	ld hl, wc740

CopyMapWindowToTilemap:
	ld de, wTilemap
	ld b, $12

.nextRow:
	ld c, $14

.copyTile:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyTile
	ld a, l
	add 4
	ld l, a
	ld a, h
	adc 0
	ld h, a
	dec b
	jr nz, .nextRow
	ret

CopyBlockToVRAMAttr:
	ld a, 1
	ldh [rVBK], a
	jp CopyBlockToVRAM

CopyBlockToVRAMTiles:
	ld a, 0
	ldh [rVBK], a

CopyBlockToVRAM:
	push hl

.rowLoop:
	ld a, [de]
	push bc
	ld c, a

.waitVRAM:
	ldh a, [rSTAT]
	and 3
	jr nz, .waitVRAM
	ld a, c
	ld [hl], a
	inc l
	xor a
	adc 0
	ld c, a
	ld a, l
	and $f
	jr nz, .nextByte
	ld a, l
	bit 4, a
	jr nz, .nextByte
	sub $20
	ld l, a

.nextByte:
	inc de
	pop bc
	dec b
	jr nz, .rowLoop
	pop hl
	push bc
	ld bc, $20
	add hl, bc
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, CopyBlockToVRAM
	ld a, 0
	ldh [rVBK], a
	ret

ClearObjectData:
	ld hl, wPlayerScreenY
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

SetMapZoneFlags:
	ld de, Pointers_005_5b12
	ldh a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hMapNumber]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [wdce4], a
	xor a
	ld [wd0d3], a
	ld [wBattleCounter], a
	ld de, Pointers_005_5c70
	ldh a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $01
	ldh a, [hMapNumber]
	ld b, a
.loop
	ld a, [hli]
	cp $FF
	ret z
	cp $EE
	jr z, .marker
	cp b
	jr nz, .loop
	ld a, c
	ld [wd0d3], a
	ret
.marker
	ld c, $02
	jr .loop
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_005_5ae2:
	db $e0, $d0, $01, $01, $e0, $d0, $02, $02, $e0, $d0, $04, $04, $e0, $d0, $08, $08
	db $e0, $d0, $10, $10, $e0, $d0, $20, $20, $e0, $d0, $40, $40, $e0, $d0, $80, $80
	db $e1, $d0, $01, $01, $e1, $d0, $02, $02, $e1, $d0, $04, $04, $e1, $d0, $08, $08
Pointers_005_5b12:
	dw Pointers_005_5b12_5b22
	dw Pointers_005_5b12_5b22
	dw Pointers_005_5b12_5b58
	dw Pointers_005_5b12_5b7c
	dw Pointers_005_5b12_5ba0
	dw Pointers_005_5b12_5c06
	dw Pointers_005_5b12_5c2e
	dw Pointers_005_5b12_5c5b
Pointers_005_5b12_5b22:
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01
Pointers_005_5b12_5b58:
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01
Pointers_005_5b12_5b7c:
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01
Pointers_005_5b12_5ba0:
	db $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00
	db $01, $00, $00, $00, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $01, $01
	db $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $01
Pointers_005_5b12_5c06:
	db $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01
Pointers_005_5b12_5c2e:
	db $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $01, $01, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $01, $00
Pointers_005_5b12_5c5b:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00
Pointers_005_5c70:
	dw Pointers_005_5c70_5c80
	dw Pointers_005_5c70_5c81
	dw Pointers_005_5c70_5c8f
	dw Pointers_005_5c70_5c9d
	dw Pointers_005_5c70_5cad
	dw Pointers_005_5c70_5cce
	dw Pointers_005_5c70_5ce0
	dw Pointers_005_5c70_5c80
Pointers_005_5c70_5c80:
	db $ff
Pointers_005_5c70_5c81:
	db $28, $29, $ee, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $ff
Pointers_005_5c70_5c8f:
	db $17, $18, $ee, $03, $04, $05, $06, $07, $09, $0a, $0b, $0c, $0d, $ff
Pointers_005_5c70_5c9d:
	db $15, $16, $ee, $0b, $0c, $0d, $0e, $04, $05, $06, $20, $01, $02, $03, $1f, $ff
Pointers_005_5c70_5cad:
	db $0e, $10, $1e, $20, $2a, $5e, $ee, $01, $02, $03, $04, $05, $06, $07, $08, $09
	db $0a, $15, $16, $4f, $1a, $1b, $1c, $1d, $21, $22, $23, $24, $60, $61, $62, $63
	db $ff
Pointers_005_5c70_5cce:
	db $1b, $1c, $ee, $01, $02, $03, $04, $05, $06, $08, $09, $0a, $0b, $0c, $0d, $17
	db $18, $ff
Pointers_005_5c70_5ce0:
	db $0e, $1e, $1f, $08, $09, $0a, $0b, $ee, $01, $02, $03, $04, $05, $06, $07, $ff
