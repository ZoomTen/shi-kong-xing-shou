; Battle move-execution phase (HandleBattleMoves).
HandleBattleMoves::
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
	dw BattleMoves_Init
	dw BattleMoves_Loop

BattleMoves_Init::
	ld a, $d
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	ld bc, $0d06
	ld hl, $9987
	call ClearBGMapBox
	ld bc, $0400
	ld hl, $8ab0
	xor a
	call ByteFillVRAM
	call DelayFrame
	call BattleMoves_LoadList
	ld de, Battle_Panel11x10_BGMap
	ld hl, $9909
	ld bc, $0b0a
	ld a, $b
	ldh [hVRAMCopyWidth], a
	ld a, $a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Battle_Panel11x10_AttrMap
	ld hl, $9909
	ld bc, $0b0a
	ld a, $b
	ldh [hVRAMCopyWidth], a
	ld a, $a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 7
	add hl, bc
	ld a, [wdb18]
	and a
	jr z, .got_move
	ld de, 3

.skip_move:
	add hl, de
	dec a
	jr nz, .skip_move

.got_move:
	ld d, [hl]
	call DelayFrame
	farcall Func_01e_42f1
	ld de, Battle_Panel9x6_BGMap
	ld hl, $9980
	ld bc, $0906
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld a, 1
	ld [wd1fc], a
	ld a, $77
	ld [wd8fe], a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 8
	add hl, bc
	ld a, [wdb18]
	and a
	jr z, .got_pp
	ld de, 3

.skip_pp:
	add hl, de
	dec a
	jr nz, .skip_pp

.got_pp:
	ld e, l
	ld d, h
	ld a, [de]
	ld [wd97c + 4], a
	push de
	ld hl, $99a1
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call PrintNumber
	pop de
	inc de
	ld hl, $99a4
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call PrintNumber
	ld hl, wcde0
	ld [hl], $58
	ld a, [wdb18]
	swap a
	add [hl]
	ld [hl], a
	inc hl
	ld [hl], $58
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], 0
	ld a, [wdb18]
	ld [wSelectedOption], a
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

BattleMoves_LoadList::
	xor a
	ld [wd0c0], a
	ld a, $fd
	ld [wMenuTextEndX], a
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 7
	add hl, bc

.loop:
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
	add $ab
	ld [wMenuTextX], a
	xor a
	ld [wCharacterTilePos], a
	push hl
	farcall Func_026_4000
	pop hl
	ld a, [wd0c0]
	inc a
	ld [wd0c0], a
	cp 4
	jr nz, .loop

.done:
	ret

BattleMoves_Loop::
	call RefreshBattleOAM
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .done
	call BattleMenu_AnimCursor
	call BattleMoves_HandleInput
	jr BattleMoves_Loop

.done:
	xor a
	ldh [hFFC6], a
	ret

BattleMoves_HandleInput::
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .not_down
	ld a, [wSelectedOption]
	cp 3
	ret z
	inc a
	ld [wSelectedOption], a
	call BattleMoves_GetMoveID
	and a
	jr nz, .move_cursor
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret

.not_down:
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .not_up
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
	jr .move_cursor

.move_cursor:
	ld a, [wSelectedOption]
	swap a
	add $58
	ld [wcde0], a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 7
	add hl, bc
	ld a, [wSelectedOption]
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	add hl, bc
	push hl
	ld d, [hl]
	farcall Func_01e_42f1
	ld a, 1
	ld [wd1fc], a
	ld [wd0fd], a
	ld a, $77
	ld [wd8fe], a
	pop de
	inc de
	ld a, [de]
	ld [wd97c + 4], a
	push de
	ld hl, $99a1
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call PrintNumber
	pop de
	inc de
	ld a, 1
	ld [wd0fd], a
	ld hl, $99a4
	ld bc, $0102
	ld a, 1
	ld [wd0fd], a
	call PrintNumber
	ret

.not_up:
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .b_pressed
	ld a, [wd97c + 4]
	and a
	ret z
	call BattleMoves_GetCursorState
	and a
	ret nz
	ld a, [wd9e3]
	cp $7b
	jr nz, .check_pp
	ld a, [wd9b8]
	and a
	ret z

.check_pp:
	cp $7a
	jr nz, .select_move
	ld a, [wd9b8]
	and a
	ret nz

.select_move:
	ld a, [wSelectedOption]
	ld [wdb18], a
	ld a, 1
	ld [hFFC6], a
	ld a, 4
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 7
	add hl, bc
	ld a, [wSelectedOption]
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	add hl, bc
	inc hl
	dec [hl]
	ret

.b_pressed:
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld hl, $9980
	ld bc, $0906
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld hl, $9909
	ld bc, $0b0a
	ld a, $b
	ldh [hVRAMCopyWidth], a
	ld a, $a
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	ld a, 2
	ldh [hBattleJumptableIndex], a
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld [hFFC6], a
	ret

BattleMoves_GetCursorState::
	ld de, wd978
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ret

BattleMoves_GetMoveID::
	ld bc, 7
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	add hl, bc
	ld a, [wSelectedOption]
	and a
	jr z, .got_byte

.loop:
	ld bc, 3
	add hl, bc
	dec a
	jr nz, .loop

.got_byte:
	ld a, [hl]
	ret
