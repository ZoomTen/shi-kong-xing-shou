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
