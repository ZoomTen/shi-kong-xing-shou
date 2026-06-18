Func_005_4000::
	ld a, [wPlayerObject]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	ld [wd3f9], a
	call Func_005_47e6
	call Func_005_478a
	call Func_005_472e
	call Func_005_46da
	ret

Func_005_401d:
	ldh a, [hConsoleType]
	cp $11
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

asm_005_4038:
	ld c, $14

asm_005_403a:
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
	jr nz, asm_005_403a
	ld a, [wBGMapAddr]
	add $c
	ld [wBGMapAddr], a
	ld a, [wBGMapAddr + 1]
	adc 0
	ld [wBGMapAddr + 1], a
	dec b
	jr nz, asm_005_4038
	xor a
	ldh [rVBK], a
	ret

Func_005_406b:
	ld hl, $c740
	ldh a, [hFFA0]
	and a
	jr z, asm_005_4077
	ld bc, $30
	add hl, bc

asm_005_4077:
	ldh a, [hFF9F]
	and a
	jr z, asm_005_407e
	inc hl
	inc hl

asm_005_407e:
	call Func_005_5a35
	ret

asm_005_4082:
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	ld de, wd100
	ld c, $a0
	call Func_005_5906
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
	ld [wd1e3], a
	ld [wdcb4], a
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
	ldh a, [hFFBA]
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
	ld [wd1e3], a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wdcb4], a
	pop hl
	ret

MapEvent_Signpost:
	pop hl
	ld a, [hli]
	ld [wd1e3], a
	xor a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wdcb4], a
	pop hl
	ret

MapEvent_04:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hFFBA]
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
	ld [wd1e3], a
	ld [wd0ee], a
	ld [wdcb4], a
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
	ld [wd1e3], a
	ld [wd0f8], a
	ld [wdcb4], a
	pop hl
	ret

MapEvent_06:
	pop hl
	ld a, [hl]
	and a
	jr z, .no_conditional
	ldh a, [hFFBA]
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
	ld [wdcb4], a
	xor a
	ld [wd0f8], a
	ld [wd0ee], a
	ld [wd1e3], a
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

	ld hl, wd1e3 + 2
	ld c, $0C
	xor a
.fill
	ld [hli], a
	dec c
	jr nz, .fill

	call Func_005_4408
	call Func_005_5a9c
	call LoadMap_Banked
	call Func_005_5a32
	ld hl, $9800
	ld de, wTilemap
	ld bc, $1412
	ld a, $12
	ld [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call Func_005_5a59
	call Func_005_5a8e
	call Func_005_4662
	call Func_005_401d
	call SpawnPlayerSprite
	call Func_005_4000
	xor a
	ldh [hSimulatedJoypadState], a
	ldh [hFFA4], a
	call Func_0419
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

	call Func_005_43e1
; update OAM?
	call Func_0419

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
	call Func_005_4bc1
	call Overworld_ProcessJoypadInput

; object events?
	call Func_062c
	call UpdatePlayerAnim_Banked
	call Func_005_440f
	jp OverworldLoop

Overworld_GotoProcessScript:
	xor a
	ld [wd082], a
	call Func_06d0
	call Func_005_440f
	call UpdatePlayerAnim_Banked
	jp OverworldLoop

Overworld_GotoProcessTextbox:
	ld hl, wTextStart
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText_Banked
	jp OverworldLoop

Overworld_GotoProcessScroll:
	call Func_074d
	jp OverworldLoop

Overworld_GotoProcessStartMenu:
	call Func_0b39
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
	ld a, [wdcb6 + 3]
	and a
	jr z, Func_005_434a
	ld a, [wdcb6 + 2]
	inc a
	ld [wdcb6 + 2], a
	cp $20
	ret nz
	xor a
	ld [wdcb6 + 2], a
	ld [wdcb6 + 3], a
	ld hl, unk_005_4394
	call PartialCopyBackgroundPalettes
	ret

Func_005_434a:
	ld a, [$dcb8]
	inc a
	ld [$dcb8], a
	cp $18
	ret nz
	xor a
	ld [$dcb8], a
	ld a, $01
	ld [$dcb9], a
	ld hl, $4364
	call PartialCopyBackgroundPalettes
	ret
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

unk_005_4394:
	dr $14394, $143e1

Func_005_43e1:
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

Func_005_4408:
	farcall asm_00a_45b4
	ret

Func_005_440f:
	dr $1440f, $14662

Func_005_4662:
	ld hl, wda00
.asm_4665
	ldh a, [$ffaa]
	ld d, a
	ldh a, [$ffab]
	ld e, a
	push hl
	ld a, [hli]
	cp $88
	jr z, .asm_46d8
	cp $ff
	jr nz, .asm_46d0
	inc hl
	ld a, d
	cp $02
	jr c, .asm_467d
	sub $02
.asm_467d
	cp [hl]
	jr nc, .asm_46d0
	add $0c
	cp [hl]
	jr c, .asm_46d0
	inc hl
	ld a, e
	cp $02
	jr c, .asm_468d
	sub $02
.asm_468d
	cp [hl]
	jr nc, .asm_46d0
	add $0b
	cp [hl]
	jr c, .asm_46d0
	inc hl
	ld a, [hli]
	and a
	jr nz, .asm_469f
	inc hl
	inc hl
	inc hl
	jr .asm_46ba
.asm_469f
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
	jr z, .asm_46b0
.asm_46ab
	srl b
	dec c
	jr nz, .asm_46ab
.asm_46b0
	ld a, b
	and $01
	cp [hl]
	jr z, .asm_46b9
	pop bc
	jr .asm_46d0
.asm_46b9
	pop bc
.asm_46ba
	pop de
	push de
	call LoadObjectSprite
	ld a, c
	and a
	jr z, .asm_46cd
	swap a
	and $0f
	srl a
	pop hl
	ld [hl], a
	jr .asm_46d1
.asm_46cd
	pop hl
	jr .asm_46d1
.asm_46d0
	pop hl
.asm_46d1
	ld bc, $000c
	add hl, bc
	jp .asm_4665
.asm_46d8
	pop hl
	ret

Func_005_46da:
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
	call GetBlockCollision_Banked
	ld a, [wd0c8]
	ld [wd3f8], a
	ret

Func_005_472e:
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
	jr c, asm_005_4766
	ld d, $ff

asm_005_4766:
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
	call GetBlockCollision_Banked
	ld a, [wd0c8]
	ld [wd3f7], a
	ret

Func_005_478a:
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0f9]
	sub $10
	ld c, a
	ld b, 0
	cp $e0
	jr c, asm_005_479e
	ld b, $ff

asm_005_479e:
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
	call GetBlockCollision_Banked
	ld a, [wd0c8]
	ld [wd3f6], a
	ret

Func_005_47e6:
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
	call GetBlockCollision_Banked
	ld a, [wd0c8]
	ld [wd3f5], a
	ret

unk_005_483a:
	dr $1483a, $1495f

Overworld_MovePlayerOneStep:
	dr $1495f, $14bc1

Func_005_4bc1:
	ldh a, [$ffa7]
	and a
	ret nz
	ldh a, [$ffd6]
	and a
	ret nz
	call Func_005_50e5
	call Func_005_5123
	ld a, [wd3f4]
	and a
	ret nz
	ld hl, unk_005_5632
	ld a, [wd0df]
	and a
	jr z, Func_005_4bc1.asm_4bfa
	cp $01
	jr z, .asm_4beb
	cp $02
	jr z, .asm_4bf0
	cp $03
	jr z, .asm_4bf5
	jr Func_005_4bc1.asm_4bfa
.asm_4beb
	ld hl, $5650
	jr Func_005_4bc1.asm_4bfa
.asm_4bf0
	ld hl, $566e
	jr Func_005_4bc1.asm_4bfa
.asm_4bf5
	ld hl, $568c
	jr Func_005_4bc1.asm_4bfa

.asm_4bfa:
	ld de, 6
	ldh a, [hJoypadPressed]
	bit START_F, a
	jp nz, Func_005_4f2e

	ldh a, [hJoypadDown]
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right

	jr .asm_4c1c

.down:
	add hl, de

.up:
	add hl, de

.left:
	add hl, de

.right:
	add hl, de

.asm_4c1c:
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
	jr nz, .asm_4c3a
	call Func_005_4e4e
	ret

.asm_4c3a:
	dr $14c3a, $14c69

Func_005_4c69:
	ldh a, [$ff91]
	cp $11
	jr z, .asm_4c93
	ld a, $01
	ld [wcd0a], a
	jr .asm_4c9e
	ld a, [wPlayerSpriteID]
	cp $09
	jr nz, $4c52
	jr .asm_4c9a
	jr $4c52
	ldh a, [$ff9a]
	cp $01
	jr nz, $4c52
	ld a, $01
	ld [$d0ec], a
	ldh a, [$ffa1]
	and $0f
	ld [wItemIndex], a
.asm_4c93
	ld a, [wPlayerSpriteID]
	cp $09
	jr z, $4c52
.asm_4c9a
	xor a
	ld [wcd0a], a
.asm_4c9e
	ldh a, [$ff9e]
	cp $ff
	ret z
	ld a, $01
	ldh [$ffac], a
	ldh a, [$ff9e]
	ld hl, wPlayerFacing
	cp [hl]
	jr z, .asm_4cd0
	ld [hl], a
	ld [wd0e3], a
	ld a, [wPlayerSpriteID]
	and a
	jr nz, .asm_4cd0
	ld a, $ff
	ldh [$ff9e], a
	xor a
	ldh [$ffa7], a
	ld [wPlayerAnimFrame], a
	ld a, $01
	ld [wd3f4], a
	ld a, $01
	ld [wdcd0], a
	jr .asm_4cd7
	ret
.asm_4cd0
	call $56e1
	and a
	jp nz, $4c4c
.asm_4cd7
	ld a, [wdcea]
	and a
	ret z
	ld a, [wPlayerFacing]
	and a
	jr z, .asm_4cef
	cp $01
	jr z, .asm_4d06
	cp $02
	jr z, .asm_4d1e
	cp $03
	jr z, .asm_4d36
	ret
.asm_4cef
	ld a, [wPlayerMapX]
	ld [$cd33], a
	ld a, [wPlayerMapY]
	dec a
	ld [$cd32], a
	ld a, $08
	ldh [$ffdd], a
	xor a
	ld [$dcee], a
	jr .asm_4d4e
.asm_4d06
	ld a, [wPlayerMapX]
	ld [$cd33], a
	ld a, [wPlayerMapY]
	inc a
	ld [$cd32], a
	ld a, $04
	ldh [$ffdd], a
	ld a, $01
	ld [$dcee], a
	jr .asm_4d4e
.asm_4d1e
	ld a, [wPlayerMapY]
	ld [$cd32], a
	ld a, [wPlayerMapX]
	inc a
	ld [$cd33], a
	ld a, $02
	ldh [$ffdd], a
	ld a, $02
	ld [$dcee], a
	jr .asm_4d4e
.asm_4d36
	ld a, [wPlayerMapY]
	ld [$cd32], a
	ld a, [wPlayerMapX]
	dec a
	ld [$cd33], a
	ld a, $01
	ldh [$ffdd], a
	ld a, $03
	ld [$dcee], a
	jr .asm_4d4e
.asm_4d4e
	ld a, [hFFAB]
	ld b, a
	ld a, [$cd32]
	sub b
	swap a
	and $f0
	add $10
	ld [$cd3e], a
	ld a, [hFFAA]
	ld b, a
	ld a, [$cd33]
	sub b
	swap a
	and $f0
	add $08
	ld [$cd3f], a
	ld a, $10
	ld [hFFDE], a
	ld a, $01
	ldh [$ffdb], a
	ld [wdceb], a
	ret
	ld a, [wPlayerScreenX]
	sub $08
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [$ffaa]
	add e
	ret
	ld a, [wPlayerObject]
	sub $10
	srl a
	srl a
	srl a
	srl a
	ld e, a
	ldh a, [$ffab]
	add e
	ret
	ld a, [wdcfa]
	and a
	ret nz
	ld hl, $0005
	add hl, de
	ld a, [hl]
	cp $01
	jr z, .asm_4db4
	cp $02
	jr z, .asm_4db4
	ret
.asm_4db4
	ld a, $40
	ld [wdcfa], a
	call .asm_4dbd
	ret
.asm_4dbd
	ld bc, wPartyMon1
.asm_4dc0
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4dfb
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4dd4
	jr nz, .asm_4deb
	jr .asm_4ddd
.asm_4dd4
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $06
	jr nc, .asm_4deb
.asm_4ddd
	ld hl, $0003
	add hl, bc
	ld [hl], $00
	ld hl, $0002
	add hl, bc
	ld [hl], $01
	jr .asm_4dfb
.asm_4deb
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
.asm_4dfb
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, .asm_4dc0
	ret
	ldh a, [$ff9a]
	cp $01
	ret nz
	ldh a, [$ff9b]
	cp $1e
	jr z, .asm_4e1f
	cp $1f
	jr z, .asm_4e1f
	cp $20
	jr z, .asm_4e1f
	cp $21
	jr z, .asm_4e1f
	ret
.asm_4e1f
	ldh a, [$ff9e]
	cp $ff
	ret z
	ld a, $01
	ldh [$ffac], a
	xor a
	ld [wcd0a], a
	ldh a, [$ff9e]
	ld hl, wPlayerFacing
	cp [hl]
	jr z, .asm_4e4a
	ld [hl], a
	ld a, $ff
	ldh [$ff9e], a
	xor a
	ldh [$ffa7], a
	ld [wPlayerAnimFrame], a
	ld a, $01
	ld [wd3f4], a
	ld a, $01
	ld [wdcd0], a
	ret
.asm_4e4a
	jp .asm_4cd7
	ret

Func_005_4e4e:
	ldh a, [$ff9a]
	cp $01
	ret nz
	ldh a, [$ff9b]
	cp $1e
	jr z, .asm_4e67
	cp $1f
	jr z, .asm_4ead
	cp $20
	jr z, .asm_4ed5
	cp $21
	jp z, .asm_4f1b
	ret
.asm_4e67
	call $4d7d
	cp $02
	jr z, .asm_4e8f
	cp $09
	ret nz
	call $4d8f
	cp $06
	jr z, .asm_4e86
	cp $04
	jr z, .asm_4e7d
	ret
.asm_4e7d
	ld de, wcd60
	call $4da1
	jp .asm_4f2d
.asm_4e86
	ld de, wNPCObjects
	call $4da1
	jp .asm_4f2d
.asm_4e8f
	call $4d8f
	cp $03
	jr z, .asm_4ea4
	cp $05
	jr z, .asm_4e9b
	ret
.asm_4e9b
	ld de, $cda0
	call $4da1
	jp .asm_4f2d
.asm_4ea4
	ld de, $cd80
	call $4da1
	jp .asm_4f2d
.asm_4ead
	call $4d7d
	cp $02
	jr z, .asm_4ec6
	cp $09
	ret nz
	call $4d8f
	cp $06
	ret nz
	ld de, wNPCObjects
	call $4da1
	jp .asm_4f2d
.asm_4ec6
	call $4d8f
	cp $03
	ret nz
	ld de, wcd60
	call $4da1
	jp .asm_4f2d
.asm_4ed5
	call $4d7d
	cp $02
	jr z, .asm_4efd
	cp $06
	ret nz
	call $4d8f
	cp $05
	jr z, .asm_4eeb
	cp $03
	jr z, .asm_4ef4
	ret
.asm_4eeb
	ld de, wNPCObjects
	call $4da1
	jp .asm_4f2d
.asm_4ef4
	ld de, wcd60
	call $4da1
	jp .asm_4f2d
.asm_4efd
	call $4d8f
	cp $04
	jr z, .asm_4f09
	cp $06
	jr z, .asm_4f12
	ret
.asm_4f09
	ld de, $cd80
	call $4da1
	jp .asm_4f2d
.asm_4f12
	ld de, $cda0
	call $4da1
	jp .asm_4f2d
.asm_4f1b
	call $4d7d
	cp $07
	ret nz
	call $4d8f
	cp $06
	ret nz
	ld de, wNPCObjects
	call $4da1
.asm_4f2d
	ret

Func_005_4f2e:
; Init Start Menu
	ld a, 1
	ldh [hFFC5], a
	ld [wd087], a
	xor a
	ld [wd08a], a
	call Func_005_4f3d
	ret

Func_005_4f3d:
	ld hl, wcde0
	ld c, $20
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret

Func_005_4f48:
; on battle start
	dr $14f48, $150a5

Func_005_50a5:
	farcall Func_02d_5086
	xor a
	ld [wd987], a
	ld hl, wd876
	ld a, l
	ld [wd984], a
	ld a, h
	ld [wd984 + 1], a
	ld a, [hl]
	ld [wEnemyMonSpecies], a

	ld bc, wPartyMons
	ld e, 0
.asm_50c3:
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_50d8

	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc e
	ld a, l
	cp $80
	ret nc

	ld c, l
	ld b, h
	jr .asm_50c3

.asm_50d8:
	ld a, e
	ld [wd983], a
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd981 + 1], a
	ret


Func_005_50e5:
	ldh a, [hJoypadPressed]
	bit 2, a
	ret z
	ld a, [hFFBA]
	cp $11
	ret z
	ld a, [wPlayerSpriteID]
	cp 9
	ret z
	ld a, [wd9dd]

asm_005_50f9:
	inc a

asm_005_50fa:
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
	jr z, asm_005_511a
	pop af
	ld [wd9dd], a
	farcall unk_024_4000
	farcall asm_00a_45b4
	ret

asm_005_511a:
	pop af
	cp 8
	jr c, asm_005_50f9
	xor a
	jr asm_005_50fa
	ret

Func_005_5123:
	ldh a, [hJoypadPressed]
	bit 0, a
	ret z
	call Func_005_52a6
	call Func_005_56aa
	call Func_005_52ba
	call Func_005_5295
	call Func_005_51ed
	ld a, [wPlayerSpriteID]
	cp 9
	jr z, asm_005_5148
	call Func_005_5179
	call Func_005_55e9
	call Func_005_5604
	ret

asm_005_5148:
	ld de, wd3f5
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
	call Func_005_51b1
	call Func_005_4000
	call ParseCurrentMapEvents
	ret

Func_005_5179:
	ld de, wd3f5
	ld a, [wPlayerFacing]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	cp 3
	ret nz
	ld a, [wd9dd]
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
	call Func_005_51db
	call Func_005_4000
	call ParseCurrentMapEvents
	ret

Func_005_51b1:
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

Func_005_51db:
	xor a
	ld [wdcea], a
	ld hl, wcd20
	ld bc, 3
; ???
	xor a
.asm_51e6
	ld [hli], a
	dec c
	ld a, c
	or b
	jr nz, .asm_51e6
	ret

Func_005_51ed:
	ldh a, [hFFD6]
	and a
	ret nz
	ld a, [hTextSource]
	and a
	ret nz
	ld a, [wd9dd]
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
	jr z, asm_005_5224
	ld a, 1
	ld [wdce8], a

asm_005_5224:
	ld hl, wScriptPos
	ld [hl], LOW(Script_005_524c)
	inc hl
	ld [hl], HIGH(Script_005_524c)
	ld a, 1
	ldh [hFFD6], a
	xor a
	ld [wScriptByte], a
	ld [wdcb4], a
	ld [wd1e3], a
	ld [wd0f8], a
	ld [wd0ee], a
	ld a, [hScriptBank]
	ld [wdcba], a
	ld a, BANK(Script_005_524c)
	ld [hScriptBank], a
	ret

Script_005_524c:
	scr_spriteface  1, $04 ; TEMP
	scr_delay $03, $10 ; TEMP
	scr_spriteface  1, FACE_DOWN
	scr_4e $01, unk_005_5270
	scr_77
	scr_6f
	scr_5e $52
	scr_end

unk_005_525e:
	dr $1525e, $15270

unk_005_5270:
	dr $15270, $15295

Func_005_5295:
	ld a, [wd0ee]
	and a
	ret z
	xor a
	ld [wd0f8], a
	ld [wScriptByte], a
	ld a, 1
	ldh [hFFD6], a
	ret

Func_005_52a6:
	ld a, [wd0f8]
	and a
	ret z
	call Func_005_545e
	xor a
	ld [wd0f8], a
	ld [wScriptByte], a
	ld a, 1
	ldh [hFFD6], a
	ret

Func_005_52ba:
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
	cp 0
	jr z, asm_005_52e7
	cp 1
	jr z, asm_005_52f4
	cp 2
	jr z, asm_005_5301
	cp 3
	jr z, asm_005_530e
	ret

asm_005_52e7:
	ld a, [wd0f9]
	add $10
	ld [wd0f9], a
	ld hl, wd3f5
	jr asm_005_5319

asm_005_52f4:
	ld a, [wd0f9]
	sub $10
	ld [wd0f9], a
	ld hl, wd3f6
	jr asm_005_5319

asm_005_5301:
	ld a, [wd3f9]
	sub $10
	ld [wd3f9], a
	ld hl, wd3f7
	jr asm_005_5319

asm_005_530e:
	ld a, [wd3f9]
	add $10
	ld [wd3f9], a
	ld hl, wd3f8

asm_005_5319:
	ld a, [hl]
	swap a
	and $f
	ret z
	cp 1
	jr z, asm_005_5330
	cp 2
	jr z, asm_005_5390
	cp 3
	jr z, asm_005_532c
	ret

asm_005_532c:
	call Func_005_53d9
	ret

asm_005_5330:
	ld [wd086], a
	ld a, SFX_1a
	call PlaySound
	ld a, [hl]
	and $f
	ld [wItemIndex], a
	call Func_005_5504
	call SetMapLayoutPatchForItem_Banked
	ld a, BANK(text_1e_4212)
	ldh [hTextSourceBank3], a
	ld a, 3
	ldh [hTextSource], a
	ld hl, text_1e_4212
	ld a, l
	ld [wTextStart], a
	ld a, h
	ld [wTextStart + 1], a
	call Func_005_5422
	ret

unk_005_535b:
	dr $1535b, $15390

asm_005_5390:
	ld [wd086], a
	ld a, SFX_1e
	call PlaySound
	ld a, [hl]
	and $f
	ld [wMapPatchIndex], a
	call Func_005_54cf
	call SetMapLayoutPatch_Banked
	ld a, [wMapPatchIndex]
	cp 2
	jr z, asm_005_53b4
	cp 3
	jr z, asm_005_53b7
	cp 4
	jr z, asm_005_53b7
	ret

asm_005_53b4:
	call Func_005_53bb

asm_005_53b7:
	call ApplyMapLayoutFlagPatches_Banked
	ret

Func_005_53bb:
	ld hl, $0505
	call Func_005_5571
	ld de, unk_005_53d1
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call Func_005_5a59
	ret

unk_005_53d1:
	db $11
	db $13
	db $12
	db $14
	db $5
	db $5
	db $5
	db $5

Func_005_53d9:
	ld [wd086], a
	ld a, SFX_1e
	call PlaySound
	ld a, [hl]
	and $f
	ld [wMapPatchIndex], a
	call Func_005_54ad
	call ClearMapLayoutPatch_Banked
	ld a, [wMapPatchIndex]
	cp 2
	jr z, asm_005_53fd
	cp 3
	jr z, asm_005_5400
	cp 4
	jr z, asm_005_5400
	ret

asm_005_53fd:
	call Func_005_5404

asm_005_5400:
	call ApplyMapLayoutPatchIfClear_Banked
	ret

Func_005_5404:
	ld hl, $0505
	call Func_005_5571
	ld de, unk_005_541a
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call Func_005_5a59
	ret

unk_005_541a:
	db $48
	db $4a
	db $49
	db $4b
	db $0
	db $0
	db $0
	db $0

Func_005_5422:
	ld a, 1
	ld [wTextboxPos], a
	ld a, [wPlayerObject]
	cp $60
	ret nc
	xor a
	ld [wTextboxPos], a
	ret

unk_005_5432:
	dr $15432, $1545e

Func_005_545e:
	ld a, [wPlayerObject]
	sub $10
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub 8
	ld [wd3f9], a
	ld a, [wPlayerFacing]
	cp 0
	jr z, asm_005_547d
	ld a, [wd0f9]
	sub $10
	ld [wd0f9], a

asm_005_547d:
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
	call Func_005_55b5
	ld a, l
	ld [wd083], a
	ld a, h
	ld [wd083 + 1], a
	ret

unk_005_549d:
	rept 8
	db $3e
	endr
	rept 8
	db $03
	endr

Func_005_54ad:
	ld a, [wd086]
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
	call Func_005_55b5
	ld de, unk_005_5500
	jr asm_005_54ef

Func_005_54cf:
	ld a, [wd086]
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
	call Func_005_55b5
	ld de, unk_005_54fc

asm_005_54ef:
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call Func_005_5a59
	ret

unk_005_54fc:
	db $9
	db $b
	db $a
	db $c

unk_005_5500:
	db $d
	db $f
	db $e
	db $10

Func_005_5504:
	ld a, [wd086]
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
	call Func_005_55b5
	ld de, unk_005_556d
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call Func_005_5a59
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
	ld de, unk_005_556d
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

unk_005_5569:
	db $0
	db $2
	db $1
	db $3

unk_005_556d:
	db $1

unk_005_556e:
	db $3

unk_005_556f:
	db $2

unk_005_5570:
	db $4

Func_005_5571:
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
	jr z, asm_005_55a5
	add hl, de
	bit 5, l
	jr nz, asm_005_55ae
	ld a, l
	sub $20
	ld l, a
	jr asm_005_55ae

asm_005_55a5:
	add hl, de
	bit 5, l
	jr z, asm_005_55ae
	ld a, l
	sub $20
	ld l, a

asm_005_55ae:
	ld a, h
	and 3
	or $98
	ld h, a
	ret

Func_005_55b5:
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
	jr z, asm_005_55d9
	add hl, de
	bit 5, l
	jr nz, asm_005_55e2
	ld a, l
	sub $20
	ld l, a
	jr asm_005_55e2

asm_005_55d9:
	add hl, de
	bit 5, l
	jr z, asm_005_55e2
	ld a, l
	sub $20
	ld l, a

asm_005_55e2:
	ld a, h
	and 3
	or $98
	ld h, a
	ret

Func_005_55e9:
	ldh a, [hFFD6]
	and a
	ret nz
	ld a, [wd1e3]
	and a
	ret z
	ld a, [wPlayerFacing]
	cp 1
	ret nz
	ld a, 2
	ldh [hTextSource], a
	ld a, $c
	ldh [hTextSourceBank2], a
	call Func_0740
	ret

Func_005_5604:
	ldh a, [hFFD6]
	and a
	ret nz
	ld a, [wdcb4]
	and a
	ret z
	call Func_0733
	ld a, [wdcb4]
	and a
	ret z
	ld a, SFX_12
	call PlaySound
	ld a, 5
	ldh [hTextSource], a
	ld a, BANK(text_1e_6e44)
	ld [wdcb5], a
	ld hl, text_1e_6e44
	ld a, l
	ld [wTextStart], a
	ld a, h
	ld [wTextStart + 1], a
	call Func_005_5422
	ret

unk_005_5632:
	dr $15632, $156aa

Func_005_56aa:
	ld de, unk_005_5764
	ld a, [wPlayerFacing]
	call Func_005_56e6
	and a
	jr nz, asm_005_56c3
	ld a, [wPlayerMap2Y]
	ld [wPlayerMapY], a
	ld a, [wPlayerMap2X]
	ld [wPlayerMapX], a
	ret

asm_005_56c3:
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
	ld de, unk_005_5764
	ldh a, [hFF9E]

Func_005_56e6:
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

asm_005_571f:
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, asm_005_574b
	ld hl, $12
	add hl, bc
	ld a, [wFacingTileY]
	cp [hl]
	jr nz, asm_005_574b
	inc hl
	ld a, [wFacingTileX]
	cp [hl]
	jr nz, asm_005_574b
	ld a, [wPlayerMap2Y]
	ld [wPlayerMapY], a
	ld a, [wPlayerMap2X]
	ld [wPlayerMapX], a
	ld a, c
	ld [wSelectedObjectOffset], a
	ld a, 1
	ret

asm_005_574b:
	ld hl, $20
	add hl, bc
	ld c, l
	ld b, h
	ld a, l
	cp $e0
	jr c, asm_005_571f
	ld a, [wFacingTileY]
	ld [wPlayerMapY], a
	ld a, [wFacingTileX]
	ld [wPlayerMapX], a
	xor a
	ret

unk_005_5764:
	db $1

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
	call Func_005_5978
	call BuildBlockmap_Banked
	call Func_005_406b
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
	call Func_005_59a9
	call BuildBlockmap_Banked
	call Func_005_406b
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
	call Func_005_59dc
	call BuildBlockmap_Banked
	call Func_005_406b
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
	call Func_005_5a07
	call BuildBlockmap_Banked
	call Func_005_406b
	call .asm_58d0
	ret
.asm_5853
	ld hl, wTilemap
	ld de, wd128
	call Func_005_5919
	ld c, $28
	call Func_005_5900
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call Func_005_5953
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
	call Func_005_5919
	ld c, $28
	call Func_005_5900
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
	call Func_005_5953
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
	call Func_005_5922
	ld c, $24
	call Func_005_5900
	ld a, [wd0ba]
	ld e, a
	ld a, [wd0bb]
	ld d, a
	call Func_005_5935
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
	call Func_005_5922
	ld c, $24
	call Func_005_5900
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
	call Func_005_5935
	ld a, $01
	ldh [hFFA4], a
	ld a, $10
	ldh [hFFA6], a
	ld a, $FF
	ldh [hFF9E], a
	ret

Func_005_5900:
	ld hl, wd128
	ld de, wd100

Func_005_5906:
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
	jr nz, Func_005_5906
	ret


Func_005_5919:
	ld c, $28

asm_005_591b:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, asm_005_591b
	ret

Func_005_5922:
	ld c, $12

asm_005_5924:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $13
	add l
	ld l, a
	jr nc, asm_005_5931
	inc h

asm_005_5931:
	dec c
	jr nz, asm_005_5924
	ret

Func_005_5935:
	ld hl, wBGMapBufferPointers
	ld c, $12

asm_005_593a:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, asm_005_594b
	inc d
	ld a, d
	and 3
	or $98
	ld d, a

asm_005_594b:
	dec c
	jr nz, asm_005_593a
	ld a, $12
	ldh [hFFA5], a
	ret

Func_005_5953:
	ld hl, wBGMapBufferPointers
	push de
	call Func_005_595f
	pop de
	ld a, $20
	add e
	ld e, a

Func_005_595f:
	ld c, $a

asm_005_5961:
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
	jr nz, asm_005_5961
	ld a, $14
	ldh [hFFA5], a
	ret

Func_005_5978:
	ld hl, hFFAB
	inc [hl]
	ld a, [wd0ba]
	add $40
	ld [wd0ba], a
	jr nc, asm_005_5991
	ld a, [wd0bb]
	inc a
	and 3
	or $98
	ld [wd0bb], a

asm_005_5991:
	ld hl, hFFA0
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret nz
	call Func_005_599e
	ret

Func_005_599e:
	ld hl, wMapAttributes
	ld a, [hMapWidth]
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

Func_005_59a9:
	ld hl, hFFAB
	dec [hl]
	ld a, [wd0ba]
	sub $40
	ld [wd0ba], a
	jr nc, asm_005_59c2
	ld a, [wd0bb]
	dec a
	and 3
	or $98
	ld [wd0bb], a

asm_005_59c2:
	ld hl, hFFA0
	ld a, 1
	sub [hl]
	ld [hl], a
	and a
	ret z
	call Func_005_59cf
	ret

Func_005_59cf:
	ld hl, wMapAttributes
	ld a, [hMapWidth]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

Func_005_59dc:
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
	call Func_005_59fd
	ret

Func_005_59fd:
	ld hl, wMapAttributes
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

Func_005_5a07:
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
	call Func_005_5a28
	ret

Func_005_5a28:
	ld hl, wMapAttributes
	ld a, [hl]
	add 1
	ld [hli], a
	ret nc
	inc [hl]
	ret

Func_005_5a32:
	ld hl, wc740

Func_005_5a35:
	ld de, wTilemap
	ld b, $12

asm_005_5a3a:
	ld c, $14

asm_005_5a3c:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, asm_005_5a3c
	ld a, l
	add 4
	ld l, a
	ld a, h
	adc 0
	ld h, a
	dec b
	jr nz, asm_005_5a3a
	ret

Func_005_5a4e:
	ld a, 1
	ldh [rVBK], a
	jp Func_005_5a59

Func_005_5a55:
	ld a, 0
	ldh [rVBK], a

Func_005_5a59:
	push hl

asm_005_5a5a:
	ld a, [de]
	push bc
	ld c, a

asm_005_5a5d:
	ldh a, [rSTAT]
	and 3
	jr nz, asm_005_5a5d
	ld a, c
	ld [hl], a
	inc l
	xor a
	adc 0
	ld c, a
	ld a, l
	and $f
	jr nz, asm_005_5a77
	ld a, l
	bit 4, a
	jr nz, asm_005_5a77
	sub $20
	ld l, a

asm_005_5a77:
	inc de
	pop bc
	dec b
	jr nz, asm_005_5a5a
	pop hl
	push bc
	ld bc, $20
	add hl, bc
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, Func_005_5a59
	ld a, 0
	ldh [rVBK], a
	ret

Func_005_5a8e:
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

Func_005_5a9c:
	dr $15a9c, $15cf0
