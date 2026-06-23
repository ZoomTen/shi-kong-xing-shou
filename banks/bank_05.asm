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
	ld hl, wc740
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
	ld a, [wdcb9]
	and a
	jr z, Func_005_434a
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

Func_005_434a:
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

; TODO: palette - convert to RGB macros
Palette_005_4394:
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
	ld bc, wd1a0
.asm_4412
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	and a
	jr z, .asm_442a
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
.asm_442a
	ld hl, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	ld c, l
	ld b, h
	jr .asm_4412
.Jumptable:
	dw .asm_44a6
	dw .asm_44f5
	dw .asm_4549
	dw .asm_4597
	dw .asm_45e6
	dw .asm_4447
	dw .asm_44a3
	dw .asm_4446
.asm_4446
	ret
.asm_4447
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4453
	cp $01
	jr z, .asm_4473
.asm_4453
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
	jp c, .asm_442a
	xor a
	ld [hld], a
	ld [hl], $01
	ld hl, $0002
	add hl, bc
	ld [hl], $1B
	jp .asm_442a
.asm_4473
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_442a
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $07
	jr nc, .asm_4497
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $1B
	jr z, .asm_4492
	ld [hl], $1B
	jp .asm_442a
.asm_4492
	ld [hl], $1C
	jp .asm_442a
.asm_4497
	call .asm_461b
	jp .asm_442a
	jp .asm_442a
	jp .asm_442a
.asm_44a3
	jp .asm_442a
.asm_44a6
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_44c1
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .asm_442a
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .asm_442a
.asm_44c1
	ld a, [hl]
	cp $01
	jr nz, .asm_44f2
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_442a
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .asm_44ec
	cp $0A
	jp c, .asm_442a
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $05
	jr nz, .asm_44e7
	ld [hl], $06
	jp .asm_442a
.asm_44e7
	ld [hl], $05
	jp .asm_442a
.asm_44ec
	call .asm_461b
	jp .asm_442a
.asm_44f2
	jp .asm_442a
.asm_44f5
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4516
	ldh a, [hFadeFrameCounter]
	and $01
	jp nz, .asm_442a
	ld a, [bc]
	inc a
	ld [bc], a
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0A
	jp c, .asm_442a
	xor a
	ld [hld], a
	ld [hl], $01
	jp .asm_442a
.asm_4516
	cp $01
	jr nz, .asm_4546
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_442a
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .asm_4540
	cp $0A
	jp c, .asm_442a
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $07
	jr nz, .asm_453b
	ld [hl], $06
	jp .asm_442a
.asm_453b
	ld [hl], $07
	jp .asm_442a
.asm_4540
	call .asm_461b
	jp .asm_442a
.asm_4546
	jp .asm_442a
.asm_4549
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4564
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .asm_442a
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .asm_442a
.asm_4564
	cp $01
	jr nz, .asm_4594
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .asm_442a
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0E
	jr nc, .asm_458e
	cp $06
	jp c, .asm_442a
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $09
	jr nz, .asm_4589
	ld [hl], $06
	jp .asm_442a
.asm_4589
	ld [hl], $09
	jp .asm_442a
.asm_458e
	call .asm_461b
	jp .asm_442a
.asm_4594
	jp .asm_442a
.asm_4597
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_45b2
	inc hl
	inc [hl]
	ld a, [hl]
	cp $08
	jp nz, .asm_442a
	xor a
	ld [hld], a
	ld [hl], $01
	ld a, [bc]
	sub $08
	ld [bc], a
	jp .asm_442a
.asm_45b2
	ld a, [hl]
	cp $01
	jr nz, .asm_45e3
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_442a
	inc hl
	inc [hl]
	ld a, [hl]
	cp $15
	jr nc, .asm_45dd
	cp $0A
	jp c, .asm_442a
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $0B
	jr nz, .asm_45d8
	ld [hl], $06
	jp .asm_442a
.asm_45d8
	ld [hl], $0B
	jp .asm_442a
.asm_45dd
	call .asm_461b
	jp .asm_442a
.asm_45e3
	jp .asm_442a
.asm_45e6
	ldh a, [hFadeFrameCounter]
	and $0F
	jp nz, .asm_442a
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $0D
	jr nz, .asm_45fb
	ld a, $06
	ld [hl], a
	jr .asm_45fe
.asm_45fb
	ld a, $0D
	ld [hl], a
.asm_45fe
	ldh a, [hFadeFrameCounter]
	and $1F
	jp nz, .asm_442a
	ld hl, $0006
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $04
	jr nc, .asm_4612
	jp .asm_442a
.asm_4612
	call .asm_461b
	jp .asm_442a
	jp .asm_442a
.asm_461b
	push bc
	pop hl
	ld d, $08
	xor a
.asm_4620
	ld [hli], a
	dec d
	jr nz, .asm_4620
	ret
	db $E0, $00, $00, $F0, $01, $02, $03, $04, $05, $06, $07, $ED, $F0, $03, $08, $09
	db $0A, $0B, $0C, $0D, $EC, $F0, $0E, $0F, $10, $0D, $EE, $F0, $11, $12, $10, $0D
	db $EE, $F0, $13, $14, $10, $15, $16, $17, $18, $ED, $F0, $19, $1A, $1B, $1C, $1A
	db $1D, $1E, $ED, $F0, $18, $1F, $20, $21, $22, $0C, $0D, $E2, $EF

Func_005_4662:
	ld hl, wda00
.asm_4665
	ldh a, [hFFAA]
	ld d, a
	ldh a, [hFFAB]
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
	ld [wEastFacingTile], a
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
	ld [wWestFacingTile], a
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
	ld [wNorthFacingTile], a
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
	ld [wSouthFacingTile], a
	ret

Func_005_483a:
	ldh a, [hFFDD]
	and a
	ret z
	ldh a, [hFFDD]
	bit 3, a
	jr z, .asm_4848
	call .asm_4865
	ret
.asm_4848
	ldh a, [hFFDD]
	bit 2, a
	jr z, .asm_4852
	call .asm_48a2
	ret
.asm_4852
	ldh a, [hFFDD]
	bit 1, a
	jr z, .asm_485c
	call .asm_48e1
	ret
.asm_485c
	ldh a, [hFFDD]
	bit 0, a
	ret z
	call .asm_4920
	ret
.asm_4865
	ld a, [wcd23]
	and a
	jr z, .asm_488d
	cp $01
	jr z, .asm_4878
	cp $02
	jr z, .asm_4886
	cp $03
	jr z, .asm_487f
	ret
.asm_4878
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .asm_4892
.asm_487f
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .asm_4892
.asm_4886
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .asm_4892
.asm_488d
	ld hl, wcd20
	inc [hl]
	inc [hl]
.asm_4892
	ld a, [hFFDE]
	dec a
	dec a
	ld [hFFDE], a
	ret nz
	xor a
	ldh [hFFDD], a
	ld [wcd23], a
	ret
.asm_48a2
	ld a, [wcd23]
	and a
	jr z, .asm_48ca
	cp $01
	jr z, .asm_48b5
	cp $02
	jr z, .asm_48c3
	cp $03
	jr z, .asm_48bc
	ret
.asm_48b5
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .asm_48cf
.asm_48bc
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .asm_48cf
.asm_48c3
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .asm_48cf
.asm_48ca
	ld hl, wcd20
	inc [hl]
	inc [hl]
.asm_48cf
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
.asm_48e1
	ld a, [wcd23]
	and a
	jr z, .asm_4909
	cp $01
	jr z, .asm_48f4
	cp $02
	jr z, .asm_4902
	cp $03
	jr z, .asm_48fb
	ret
.asm_48f4
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .asm_490e
.asm_48fb
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .asm_490e
.asm_4902
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .asm_490e
.asm_4909
	ld hl, wcd20
	inc [hl]
	inc [hl]
.asm_490e
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
.asm_4920
	ld a, [wcd23]
	and a
	jr z, .asm_4948
	cp $01
	jr z, .asm_4933
	cp $02
	jr z, .asm_4941
	cp $03
	jr z, .asm_493a
	ret
.asm_4933
	ld hl, wcd20
	dec [hl]
	dec [hl]
	jr .asm_494d
.asm_493a
	ld hl, wcd21
	inc [hl]
	inc [hl]
	jr .asm_494d
.asm_4941
	ld hl, wcd21
	dec [hl]
	dec [hl]
	jr .asm_494d
.asm_4948
	ld hl, wcd20
	inc [hl]
	inc [hl]
.asm_494d
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
	call Func_005_483a
	call .asm_4ae5
	ld a, [hFFA6]
	dec a
	ld [hFFA6], a
	and a
	ret nz
	xor a
	ldh [hSimulatedJoypadState], a
	call ParseCurrentMapEvents
	call Func_005_4662
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
	call Func_005_483a
	call .asm_4ae5
	ld a, [hFFA6]
	dec a
	dec a
	ld [hFFA6], a
	and a
	ret nz
	xor a
	ldh [hSimulatedJoypadState], a
	call Func_005_4e4e
	call ParseCurrentMapEvents
	call Func_005_4662
	call Func_005_4f48
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
	call Func_005_47e6
	call Func_005_478a
	call Func_005_472e
	call Func_005_46da
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
	call Func_005_47e6
	call Func_005_478a
	call Func_005_472e
	call Func_005_46da
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
	call Func_005_47e6
	call Func_005_478a
	call Func_005_472e
	call Func_005_46da
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
	call Func_005_47e6
	call Func_005_478a
	call Func_005_472e
	call Func_005_46da
	ret

Func_005_4bc1:
	ldh a, [hSimulatedJoypadState]
	and a
	ret nz
	ldh a, [hFFD6]
	and a
	ret nz
	call Func_005_50e5
	call OverworldInteract
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
	ld hl, unk_005_5650
	jr Func_005_4bc1.asm_4bfa
.asm_4bf0
	ld hl, unk_005_566e
	jr Func_005_4bc1.asm_4bfa
.asm_4bf5
	ld hl, unk_005_568c
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
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
	dr $14c3a, $14c4c
; TODO
asm_005_4c4c:
	and $F0
	cp $20
	jr z, Func_005_4c69.asm_4c7f
asm_005_4c52:
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

Func_005_4c69:
	ldh a, [hConsoleType]
	cp $11
	jr z, .asm_4c93
	ld a, $01
	ld [wcd0a], a
	jr .asm_4c9e
	ld a, [wPlayerSpriteID]
	cp $09
	jr nz, asm_005_4c52
	jr .asm_4c9a
.asm_4c7f
	jr asm_005_4c52
	ldh a, [hMapGroup]
	cp $01
	jr nz, asm_005_4c52
	ld a, $01
	ld [wd0ec], a
	ldh a, [hFFA1]
	and $0f
	ld [wItemIndex], a
.asm_4c93
	ld a, [wPlayerSpriteID]
	cp $09
	jr z, asm_005_4c52
.asm_4c9a
	xor a
	ld [wcd0a], a
.asm_4c9e
	ldh a, [hFF9E]
	cp $ff
	ret z
	ld a, $01
	ldh [hFFAC], a
	ldh a, [hFF9E]
	ld hl, wPlayerFacing
	cp [hl]
	jr z, .asm_4cd0
	ld [hl], a
	ld [wd0e3], a
	ld a, [wPlayerSpriteID]
	and a
	jr nz, .asm_4cd0
	ld a, $ff
	ldh [hFF9E], a
	xor a
	ldh [hSimulatedJoypadState], a
	ld [wPlayerAnimFrame], a
	ld a, $01
	ld [wd3f4], a
	ld a, $01
	ld [wdcd0], a
	jr Func_005_4cd7
	ret
.asm_4cd0
	call Func_005_56e1
	and a
	jp nz, asm_005_4c4c
Func_005_4cd7:
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
	ld [wcd32 + 1], a
	ld a, [wPlayerMapY]
	dec a
	ld [wcd32], a
	ld a, $08
	ldh [hFFDD], a
	xor a
	ld [wdcee], a
	jr .asm_4d4e
.asm_4d06
	ld a, [wPlayerMapX]
	ld [wcd32 + 1], a
	ld a, [wPlayerMapY]
	inc a
	ld [wcd32], a
	ld a, $04
	ldh [hFFDD], a
	ld a, $01
	ld [wdcee], a
	jr .asm_4d4e
.asm_4d1e
	ld a, [wPlayerMapY]
	ld [wcd32], a
	ld a, [wPlayerMapX]
	inc a
	ld [wcd32 + 1], a
	ld a, $02
	ldh [hFFDD], a
	ld a, $02
	ld [wdcee], a
	jr .asm_4d4e
.asm_4d36
	ld a, [wPlayerMapY]
	ld [wcd32], a
	ld a, [wPlayerMapX]
	dec a
	ld [wcd32 + 1], a
	ld a, $01
	ldh [hFFDD], a
	ld a, $03
	ld [wdcee], a
	jr .asm_4d4e
.asm_4d4e
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
Func_005_4d7d:
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
Func_005_4d8f:
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
Func_005_4da1:
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
	ldh a, [hMapGroup]
	cp $01
	ret nz
	ldh a, [hMapNumber]
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
	jr z, .asm_4e4a
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
.asm_4e4a
	jp Func_005_4cd7
	ret

Func_005_4e4e:
	ldh a, [hMapGroup]
	cp $01
	ret nz
	ldh a, [hMapNumber]
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
	call Func_005_4d7d
	cp $02
	jr z, .asm_4e8f
	cp $09
	ret nz
	call Func_005_4d8f
	cp $06
	jr z, .asm_4e86
	cp $04
	jr z, .asm_4e7d
	ret
.asm_4e7d
	ld de, wcd60
	call Func_005_4da1
	jp .asm_4f2d
.asm_4e86
	ld de, wNPCObjects
	call Func_005_4da1
	jp .asm_4f2d
.asm_4e8f
	call Func_005_4d8f
	cp $03
	jr z, .asm_4ea4
	cp $05
	jr z, .asm_4e9b
	ret
.asm_4e9b
	ld de, wcda0
	call Func_005_4da1
	jp .asm_4f2d
.asm_4ea4
	ld de, wcd80
	call Func_005_4da1
	jp .asm_4f2d
.asm_4ead
	call Func_005_4d7d
	cp $02
	jr z, .asm_4ec6
	cp $09
	ret nz
	call Func_005_4d8f
	cp $06
	ret nz
	ld de, wNPCObjects
	call Func_005_4da1
	jp .asm_4f2d
.asm_4ec6
	call Func_005_4d8f
	cp $03
	ret nz
	ld de, wcd60
	call Func_005_4da1
	jp .asm_4f2d
.asm_4ed5
	call Func_005_4d7d
	cp $02
	jr z, .asm_4efd
	cp $06
	ret nz
	call Func_005_4d8f
	cp $05
	jr z, .asm_4eeb
	cp $03
	jr z, .asm_4ef4
	ret
.asm_4eeb
	ld de, wNPCObjects
	call Func_005_4da1
	jp .asm_4f2d
.asm_4ef4
	ld de, wcd60
	call Func_005_4da1
	jp .asm_4f2d
.asm_4efd
	call Func_005_4d8f
	cp $04
	jr z, .asm_4f09
	cp $06
	jr z, .asm_4f12
	ret
.asm_4f09
	ld de, wcd80
	call Func_005_4da1
	jp .asm_4f2d
.asm_4f12
	ld de, wcda0
	call Func_005_4da1
	jp .asm_4f2d
.asm_4f1b
	call Func_005_4d7d
	cp $07
	ret nz
	call Func_005_4d8f
	cp $06
	ret nz
	ld de, wNPCObjects
	call Func_005_4da1
.asm_4f2d
	ret

Func_005_4f2e:
; Init Start Menu
	ld a, 1
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
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
	ld [wd985], a
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
	ld [wd982], a
	ret


Func_005_50e5:
	ldh a, [hJoypadPressed]
	bit 2, a
	ret z
	ld a, [hMapPredef]
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
	farcall Func_024_4000
	farcall asm_00a_45b4
	ret

asm_005_511a:
	pop af
	cp 8
	jr c, asm_005_50f9
	xor a
	jr asm_005_50fa
	ret

OverworldInteract:
	ldh a, [hJoypadPressed]
	bit 0, a
	ret z
	call Func_005_52a6
	call Func_005_56aa
	call CheckTileInteractInFront
	call Func_005_5295
	call Func_005_51ed
	ld a, [wPlayerSpriteID]
	cp 9
	jr z, asm_005_5148
	call Func_005_5179
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
	call Func_005_51b1
	call Func_005_4000
	call ParseCurrentMapEvents
	ret

Func_005_5179:
	ld de, wAdjacentBlocks
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

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_005_525e:
	dr $1525e, $15270

MovementData_005_5270:
	db $f8, $00, $fa, $00, $fc, $00, $fc, $00, $fc, $00, $fd, $00, $fe, $00, $ff, $00
	db $00, $00, $00, $00, $08, $00, $06, $00, $04, $00, $04, $00, $04, $00, $03, $00
	db $02, $00, $01, $00, $88

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
	call SetMapLayoutPatchForItem_Banked
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

Func_005_535b:
	ld a, [hMapGroup]
	cp $04
	ret nz
	ldh a, [hMapNumber]
	cp $06
	jr z, .asm_5374
	cp $07
	jr z, .asm_5374
	cp $08
	jr z, .asm_5374
	cp $09
	jr z, .asm_5374
	ret
.asm_5374
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
	ld de, Tilemap_005_53d1
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call Func_005_5a59
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
	ld de, Tilemap_005_541a
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call Func_005_5a59
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

Func_005_5432:
	and a
	ret nz
	ld a, [hl]
	and $0F
	ld [wItemIndex], a
	call .asm_543e
	ret
.asm_543e
	ld a, [wVisibleObjects]
	ld [wd0f9], a
	ld a, [wPlayerScreenX]
	sub $08
	ld [wd3f9], a
	ld a, [wPlayerFacing]
	cp $00
	jr z, asm_005_547d
	ld a, [wd0f9]
	sub $30
	ld [wd0f9], a
	jp asm_005_547d

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

; TODO: unreferenced data block, classify type
unk_005_549d:
	rept 8
	db $3e
	endr
	rept 8
	db $03
	endr

Func_005_54ad:
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
	call Func_005_55b5
	ld de, Tilemap_005_5500
	jr asm_005_54ef

Func_005_54cf:
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
	call Func_005_55b5
	ld de, Tilemap_005_54fc

asm_005_54ef:
	ld bc, $0202
	ld a, 2
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call Func_005_5a59
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
	call Func_005_55b5
	ld de, Tilemap_005_556d
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
Func_005_56e1:
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
	ld [wd0d4], a
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
.asm_5ace
	ld a, [hli]
	cp $FF
	ret z
	cp $EE
	jr z, .asm_5ade
	cp b
	jr nz, .asm_5ace
	ld a, c
	ld [wd0d3], a
	ret
.asm_5ade
	ld c, $02
	jr .asm_5ace
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
