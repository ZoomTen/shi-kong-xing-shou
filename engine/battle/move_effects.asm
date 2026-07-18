; Move-effect engine: effect dispatch, MoveEffectPointers, per-effect handlers, SetCaughtMon, and effect graphics.
ExecuteMoveEffect::
	ld a, [wBattleTurn]
	and a
	jr z, .asm_4018
	ld a, [wd9ea]
	and a
	jr z, .asm_4018

	xor a
	ld [wd9ea], a
	ld de, ItemEffectPointers
	ld a, [wCurItemID]
	jr .asm_401e

.asm_4018
	ld de, MoveEffectPointers
	ld a, [wBattleAnimID]

.asm_401e
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

RollMoveHit::
	call CheckMoveCategoryGate
	and a
	jp nz, .asm_40ed
	call ComputeTypeEffectiveness
	ld a, [wd9c7]
	and a
	jp z, .asm_40ed
	call AdvanceRNG
	ld de, MoveAccuracy
	ld a, [wBattleAnimID]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	jp z, .asm_40f2
	ld [hMathOperand], a
	ld a, [wd98d]
	and a
	jr z, .asm_407d
	ld de, wd93c
	ld a, [wd987]
	add a
	ld l, a
	add a
	add a
	add l
	add $02
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [hMathValue], a
	xor a
	ld [hMathValue + 1], a
	ld [hMathValue + 2], a
	farcall Multiply32By8
	ld de, wd900
	ld a, [wd983]
	jr .asm_40a5
.asm_407d
	ld de, wd900
	ld a, [wd983]
	add a
	ld l, a
	add a
	add a
	add l
	add $02
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [hMathValue], a
	xor a
	ld [hMathValue + 1], a
	ld [hMathValue + 2], a
	farcall Multiply32By8
	ld de, wd93c
	ld a, [wd987]
.asm_40a5
	add a
	ld l, a
	add a
	add a
	add l
	add $03
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [hMathOperand], a
	farcall Divide32By16_4Digit
	ld a, [hMathValue]
	ld [wd993], a
	ld a, [wd991]
	ld [hMathValue], a
	xor a
	ld [hMathValue + 1], a
	ld [hMathValue + 2], a
	ld a, $64
	ld [hMathOperand], a
	farcall Multiply32By8
	ld a, $ff
	ld [hMathOperand], a
	farcall Divide32By16_4Digit
	ld a, [hMathValue]
	ld b, a
	ld a, [wd993]
	cp b
	jr nc, .asm_40f2
.asm_40ed
	xor a
	ld [wd993], a
	ret
.asm_40f2
	ld a, $01
	ld [wd993], a
	ret
INCLUDE "data/moves/accuracy.asm"
CheckMoveCategoryGate::
	ld de, MoveCategory
	ld a, [wBattleAnimID]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $01
	jr z, .asm_41a1
	cp $02
	jr z, .asm_41bd
	cp $03
	jr z, .asm_41da
	ret
.asm_41a1
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	jr .asm_420f
.asm_41bd
	ld a, $01
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	jr .asm_420f
.asm_41da
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $01
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
	ld a, $04
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4211
.asm_420f
	xor a
	ret
.asm_4211
	ld a, $01
	ret
INCLUDE "data/moves/category.asm"

ComputeTypeEffectiveness::
	ld a, $01
	ld [wSideSelect], a
	xor a
	ld [wd9af], a
	call GetStatByte
	ld d, a
	farcall Func_01e_4284
	ld de, TypeMatchupChart
	ld a, [wd8ff]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wFacingTileX]
	and $0f
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [wd9c7], a
	ret

INCLUDE "data/moves/type_matchup.asm"

ItemEffectPointers::
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw MoveEffect_RaiseUserStat0
	dw MoveEffect_RaiseUserStat1
	dw MoveEffect_RaiseUserStat3By3
	dw MoveEffect_RaiseUserStat2
	dw MoveEffect_RaiseUserStat8
	dw MoveEffect_LowerEnemyStat1
	dw MoveEffect_LowerEnemyStat0
	dw ItemEffect_LowerStat3
	dw MoveEffect_LowerEnemyStat2
	dw MoveEffect_LowerEnemyStat8
	dw ItemEffect_SetAnimStep6
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon
	dw ItemEffect_CatchMon

ItemEffect_CatchMon::
	ld a, [wd993]
	and a
	jr nz, .asm_4395

	ld a, $52
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ret

.asm_4395:
	ld a, [wd984]
	ld e, a
	ld a, [wd985]
	ld d, a
	call SetCaughtMon
	ld a, $ff
	ld [wd9ea], a
	ld bc, wPartyMons
.room_in_party
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .next_slot

; Copy wild mon data into empty slot
	ld a, [wd984]
	ld e, a
	ld a, [wd985]
	ld d, a
	ld b, PARTYMON_STRUCT_LENGTH
.copy
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .copy

	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $51
	ld [wBattleMessageID], a
	ld a, $05
	ld [wBattleAnimStep], a
	ret

.next_slot
	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp LOW($d280)
	jr c, .room_in_party

; No free slot
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $53
	ld [wBattleMessageID], a
	ld a, $05
	ld [wBattleAnimStep], a
	call StoreCaughtMonInBox
	ret

StoreCaughtMonInBox::
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, wMonBox
	ld a, [wMonBoxCount]
	ld de, $0013
	and a
	jr z, .asm_4406
.asm_4402
	add hl, de
	dec a
	jr nz, .asm_4402
.asm_4406
	ld e, $13
.asm_4408
	ld a, [bc]
	ld [hli], a
	inc bc
	dec e
	jr nz, .asm_4408
	ld a, [wMonBoxCount]
	inc a
	ld [wMonBoxCount], a
	ret

SetCaughtMon::
	push de
	push hl
	ld hl, wDexStatuses
; check if species is valid
	ld a, [de]
	cp NUM_MONS
	jr nc, .exit

; @bug: $00 is considered valid, however 'dec a' causes this to become $ff
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], $02
.exit
	pop de
	pop hl
	ret

ItemEffect_LowerStat3::
	ld a, $01
	ld [wSideSelect], a
	ld [wMoveTargetsEnemy], a
	ld a, $03
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $54
	ld [wBattleMessageID], a
	ret

ItemEffect_SetAnimStep6::
	ld a, $06
	ld [wBattleAnimStep], a
	ret
	ld a, $06
	ld [wBattleAnimStep], a
	ret
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $40
	ld [wBattleMessageID], a
	ld a, $04
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4467
	call ComputeEnemyMonStat
	jr .asm_446a
.asm_4467
	call ComputeActiveMonStat
.asm_446a
	ld a, [wd99b]
	ldh [hMathValue + 1], a
	ld a, [wd99a]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 2], a
	call SwapMathValueBytes
	ld a, $05
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	call SwapMathValueBytes
	ldh a, [hMathValue]
	ld [wd9b0], a
	ldh a, [hMathValue + 1]
	ld [wd9b1], a
	ret
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $34
	ld [wBattleMessageID], a
	ld a, $03
	ld [wBattleAnimStep], a
	ld a, $1e
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ret

MoveEffectPointers::
	dw MoveEffect_Damage ; $00
	dw MoveEffect_SetStatus4Variant ; $01
	dw MoveEffect_RandomStatTileTwoTurn ; $02
	dw MoveEffect_GenericHit ; $03
	dw MoveEffect_TypedFractionalDamage ; $04
	dw MoveEffect_HalfStatDamage ; $05
	dw MoveEffect_LowerEnemyStat1By2 ; $06
	dw MoveEffect_Damage ; $07
	dw MoveEffect_LowerEnemyStat2OnHit ; $08
	dw MoveEffect_GenericHit ; $09
	dw MoveEffect_GenericHit ; $0a
	dw MoveEffect_RaiseUserStat0 ; $0b
	dw MoveEffect_RaiseUserStat1 ; $0c
	dw MoveEffect_DisableRandomMove ; $0d
	dw MoveEffect_TwoTurnChargeB ; $0e
	dw MoveEffect_GenericHit ; $0f
	dw MoveEffect_TwoTurnChargeA ; $10
	dw MoveEffect_RaiseUserStat9 ; $11
	dw MoveEffect_HalfStatValueFail ; $12
	dw MoveEffect_LowerEnemyStat1OnHit ; $13
	dw MoveEffect_HealValueFromStat ; $14
	dw MoveEffect_TwoTurnChargeA ; $15
	dw MoveEffect_TrySetStatus7_30 ; $16
	dw MoveEffect_LowerEnemyStat2OnHit ; $17
	dw MoveEffect_RaiseUserStat0 ; $18
	dw MoveEffect_GenericHit ; $19
	dw MoveEffect_GenericHit ; $1a
	dw MoveEffect_RaiseUserStat3OnHit ; $1b
	dw MoveEffect_GenericHit ; $1c
	dw MoveEffect_SetStatus5OnHit ; $1d
	dw MoveEffect_GenericHit ; $1e
	dw MoveEffect_GenericHit ; $1f
	dw MoveEffect_GenericHit ; $20
	dw MoveEffect_GenericHit ; $21
	dw MoveEffect_HealValueFromStatOnHit ; $22
	dw MoveEffect_SetFlagD9F5Msg42 ; $23
	dw MoveEffect_RaiseUserStats0to3 ; $24
	dw MoveEffect_LowerEnemyStat0OnHit ; $25
	dw MoveEffect_DrainSetStatus4 ; $26
	dw MoveEffect_RaiseUserStat8OnHit ; $27
	dw MoveEffect_RaiseUserStat1 ; $28
	dw MoveEffect_RaiseUserStat2 ; $29
	dw MoveEffect_GenericHit ; $2a
	dw MoveEffect_GenericHit ; $2b
	dw MoveEffect_GenericHit ; $2c
	dw MoveEffect_GenericHit ; $2d
	dw MoveEffect_GenericHit ; $2e
	dw MoveEffect_StatMinus5Value ; $2f
	dw MoveEffect_RaiseUserStat1 ; $30
	dw MoveEffect_TrySetStatus7_30 ; $31
	dw MoveEffect_GenericHit ; $32
	dw MoveEffect_GenericHit ; $33
	dw MoveEffect_InflictMajorStatusD ; $34
	dw MoveEffect_GenericHit ; $35
	dw MoveEffect_LevelTimes2Damage ; $36
	dw MoveEffect_GenericHit ; $37
	dw MoveEffect_GenericHit ; $38
	dw MoveEffect_QuarterStoredValue ; $39
	dw MoveEffect_QuarterStoredValue ; $3a
	dw MoveEffect_TryStatus1_10 ; $3b
	dw MoveEffect_TryStatus3_10 ; $3c
	dw MoveEffect_TryStatus2_10 ; $3d
	dw MoveEffect_TwoTurnStatHeal ; $3e
	dw MoveEffect_GenericHit ; $3f
	dw MoveEffect_SetStatus2OnHit ; $40
	dw MoveEffect_GenericHit ; $41
	dw MoveEffect_SetStatus2OnHit ; $42
	dw MoveEffect_GenericHit ; $43
	dw MoveEffect_GenericHit ; $44
	dw MoveEffect_HealValueFromStat ; $45
	dw MoveEffect_InflictMajorStatusC ; $46
	dw MoveEffect_TryLowerEnemyStat8_30 ; $47
	dw MoveEffect_GenericHit ; $48
	dw MoveEffect_GenericHit ; $49
	dw MoveEffect_RecallHalveValue ; $4a
	dw MoveEffect_GenericHit ; $4b
	dw MoveEffect_GenericHit ; $4c
	dw MoveEffect_TryLowerEnemyStat1_30 ; $4d
	dw MoveEffect_TryLowerEnemyStat8_20 ; $4e
	dw MoveEffect_TryStatus3_30 ; $4f
	dw MoveEffect_GenericHit ; $50
	dw MoveEffect_GenericHit ; $51
	dw MoveEffect_GenericHit ; $52
	dw MoveEffect_InflictMajorStatusB ; $53
	dw MoveEffect_GenericHit ; $54
	dw MoveEffect_GenericHit ; $55
	dw MoveEffect_HealValueFromStatOnHit ; $56
	dw MoveEffect_TryStatus1_10 ; $57
	dw MoveEffect_GenericHit ; $58
	dw MoveEffect_TryStatus1_30 ; $59
	dw MoveEffect_TryStatus1_10 ; $5a
	dw MoveEffect_TryStatus1_30 ; $5b
	dw MoveEffect_SetStatus1 ; $5c
	dw MoveEffect_DoubleValueFailMsg40 ; $5d
	dw MoveEffect_GenericHit ; $5e
	dw MoveEffect_TryLowerEnemyStat1_20 ; $5f
	dw MoveEffect_GenericHit ; $60
	dw MoveEffect_InflictMajorStatusA ; $61
	dw MoveEffect_GenericHit ; $62
	dw MoveEffect_SetStatTile63 ; $63
	dw MoveEffect_Damage ; $64
	dw MoveEffect_SetStatus1Always ; $65
	dw MoveEffect_SetStatus0OnHit ; $66
	dw MoveEffect_TryStatus1_30 ; $67
	dw MoveEffect_TryStatus5_Chance10 ; $68
	dw MoveEffect_TryStatus5_Chance10 ; $69
	dw MoveEffect_TryLowerEnemyStat0 ; $6a
	dw MoveEffect_SetFlagD9B3 ; $6b
	dw MoveEffect_GenericHit ; $6c
	dw MoveEffect_Damage ; $6d
	dw MoveEffect_SetStatus5OnHit ; $6e
	dw MoveEffect_LowerEnemyStat2OnHit ; $6f
	dw MoveEffect_RandomStatTileMsg49 ; $70
	dw MoveEffect_DisableRandomMove ; $71
	dw MoveEffect_TryLowerEnemyStat1_20 ; $72
	dw MoveEffect_TryLowerEnemyStat1_20 ; $73
	dw MoveEffect_TryLowerEnemyStat1_20 ; $74
	dw MoveEffect_GenericHit ; $75
	dw MoveEffect_GenericHit ; $76
	dw MoveEffect_SetStatTile77 ; $77
	dw MoveEffect_SetFlagD9B6 ; $78
	dw MoveEffect_SetFlagD9B6 ; $79
	dw MoveEffect_Disguise ; $7a
	dw MoveEffect_Transform ; $7b
	dw MoveEffect_LowerEnemyStat8OnHit ; $7c
	dw MoveEffect_MirrorCounter ; $7d
	dw MoveEffect_FailMsg40Step4 ; $7e
	dw MoveEffect_ResetAllStatStages ; $7f
	dw MoveEffect_SetStatus0OnHit ; $80
	dw MoveEffect_BindSetStatus0 ; $81
	dw MoveEffect_HalfStatValueFail ; $82
	dw MoveEffect_GenericHit ; $83
	dw MoveEffect_StealMoney ; $84
	dw MoveEffect_SwapStatBlock ; $85
	dw MoveEffect_SetTurnFlagD9F5 ; $86
	dw MoveEffect_SetStatTile87 ; $87
	dw MoveEffect_SeedRandomCounter ; $88
	dw MoveEffect_InflictMultiStatus ; $89
	dw MoveEffect_SetStatTile8a ; $8a
	dw MoveEffect_SetStatTile8b ; $8b
	dw MoveEffect_SetStatTile8c ; $8c
	dw MoveEffect_SelfAnimAdvance ; $8d
	dw MoveEffect_GenericHit ; $8e

LoadBattleEffectGFX::
	ld de, Pointers_030_565c
	ld a, [wd98f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; size
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $8000
	call CopyBytesVRAM
	ret

LoadBattleEffectGFXAlt::
	ld de, Pointers_030_58f8
	ld a, [wd98f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; size
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $8000
	call CopyBytesVRAM
	ret

MoveEffect_SelfAnimAdvance::
	ld a, $02
	ld [wBattleAnimStep], a
	xor a
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_SetStatTile8c::
	xor a
	ld [wSideSelect], a
	ld a, $04
	ld [wd9af], a
	ld a, $8c
	call SetStatTile
	ld a, $34
	ld [wBattleMessageID], a
	ret

MoveEffect_SetStatTile8b::
	xor a
	ld [wSideSelect], a
	ld a, $04
	ld [wd9af], a
	ld a, $8b
	call SetStatTile
	ld a, $34
	ld [wBattleMessageID], a
	ret

MoveEffect_SetStatTile8a::
	xor a
	ld [wSideSelect], a
	ld a, $04
	ld [wd9af], a
	ld a, $8a
	call SetStatTile
	ld a, $34
	ld [wBattleMessageID], a
	ret

MoveEffect_InflictMultiStatus::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4658
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4660
.asm_4658
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4660
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	jp z, MoveEffect_MissMessage
	ld a, [hli]
	cp $11
	jp z, MoveEffect_MissMessage
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 1, a
	set 2, a
	set 3, a
	set 5, a
	ld [hl], a
	ld a, $4e
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_SeedRandomCounter::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	xor a
	ld [wSideSelect], a
	ld [wBattleAnimStep], a
	ld a, $5c
	ld [wBattleMessageID], a
	ld a, $04
	ld [wd9af], a
	ld a, $88
	call SetStatTile
	ld a, $05
	ld [wd9af], a
	ld a, $02
	call SetStatTile
.asm_46b0
	call AdvanceRNG
	ld a, [wd991]
	cp $82
	jr nc, .asm_46b0
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_46c7
	ld a, [wd991]
	ld [wd9e2], a
	ret
.asm_46c7
	ld a, [wd991]
	ld [wd9e3], a
	ret

MoveEffect_SetStatTile87::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	xor a
	ld [wSideSelect], a
	ld a, $04
	ld [wd9af], a
	ld a, $87
	call SetStatTile
	ld a, $34
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ret

MoveEffect_SetTurnFlagD9F5::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [hFFD6]
	and a
	jp nz, MoveEffect_MissMessage
	ld de, wd9f5
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, de
	ld [hl], $02
	ld a, $06
	ld [wBattleAnimStep], a
	ret

MoveEffect_SwapStatBlock::
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_474d
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $59
	ld [wBattleMessageID], a
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	ld de, wdcbc
	ld b, $0c
.asm_472f
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_472f
	ld a, [wActiveMonPtr]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	pop de
	pop hl
	ld b, $0c
.asm_4746
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_4746
	ret
.asm_474d
	ld a, [wdb1c]
	and a
	jp nz, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $59
	ld [wBattleMessageID], a
	ld a, [wActiveMonPtr]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	ld de, wdcbc
	ld b, $0c
.asm_4770
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_4770
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld bc, $0007
	add hl, bc
	push hl
	pop de
	pop hl
	ld b, $0c
.asm_4787
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_4787
	ld a, $01
	ld [wdb1c], a
	ret

MoveEffect_StealMoney::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $58
	ld [wBattleMessageID], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_47d3
	ld a, $01
	ld [wd9f7], a
	ld hl, wMoney + 2
	ld a, [hld]
	ldh [hMathValue], a
	ld a, [hld]
	ldh [hMathValue + 1], a
	ld a, [hld]
	ldh [hMathValue + 2], a
	call SwapMathValueBytes
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	call SwapMathValueBytes
	ld hl, wMoney + 2
	ldh a, [hMathValue]
	ld [hld], a
	ldh a, [hMathValue + 1]
	ld [hld], a
	ldh a, [hMathValue + 2]
	ld [hld], a
	ret
.asm_47d3
	ld de, wdb00
	ld a, [wd987]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	inc hl
	inc hl
	push hl
	pop de
	ld hl, wMoney + 2
	ld a, [de]
	add [hl]
	ld [hld], a
	inc de
	ld a, [de]
	adc a, [hl]
	ld [hld], a
	ret

MoveEffect_BindSetStatus0::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4803
	ld a, $01
	ld [wd9bb], a
	jp MoveEffect_SetStatus0
.asm_4803
	ld a, $01
	ld [wd9ba], a
	jp MoveEffect_SetStatus0

MoveEffect_ResetAllStatStages::
	ld a, $4d
	ld [wBattleMessageID], a
	xor a
	ld [wSideSelect], a
	call .asm_481c
	ld a, $01
	ld [wSideSelect], a
.asm_481c
	xor a
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $01
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $02
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $03
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $08
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $09
	ld [wd9af], a
	ld a, $0a
	call SetStatTile
	ld a, $4d
	ld [wBattleMessageID], a
	ret

MoveEffect_FailMsg40Step4::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $04
	ld [wBattleAnimStep], a
	ld a, $40
	ld [wBattleMessageID], a
	ret

MoveEffect_MirrorCounter::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $4c
	ld [wBattleMessageID], a
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_48a7
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	ld a, $02
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	ld a, $7d
	call SetStatTile
	ret
.asm_48a7
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_48b4
	ld a, [wd9e3]
	ld [wd9e2], a
	ret
.asm_48b4
	ld a, [wd9e2]
	ld [wd9e3], a
	ret

MoveEffect_LowerEnemyStat8OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	jp MoveEffect_LowerEnemyStat8

MoveEffect_Transform::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4901
	xor a
	ld [wd9b9], a
	ld a, [wd9c8]
	ld [wEnemyMonSpecies], a
	call LoadEnemyMonPic
	farcall Func_026_4d47
	xor a
	ld [wd9c8], a
	ret
.asm_4901
	xor a
	ld [wd9b8], a
	ld a, [wd9c9]
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	xor a
	ld [wd9c9], a
	ret

MoveEffect_Disguise::
	ld a, $4b
	ld [wBattleMessageID], a
	call AdvanceRNG
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	ld a, [wd991]
	and $03
	add $02
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	ld a, $7a
	call SetStatTile
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_494a
	ld a, $01
	ld [wd9b9], a
	ret
.asm_494a
	ld a, $01
	ld [wd9b8], a
	ret

MoveEffect_SetFlagD9B6::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_496d
	ld a, $01
	ld [wd9b6 + 1], a
	ret
.asm_496d
	ld a, $01
	ld [wd9b6], a
	ret

MoveEffect_SetStatTile77::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $4a
	ld [wBattleMessageID], a
	xor a
	ld [wSideSelect], a
	ld a, $04
	ld [wd9af], a
	ld a, $77
	call SetStatTile
	ret

MoveEffect_RandomStatTileMsg49::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	call AdvanceRNG
	ld a, $01
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	ld a, [wd991]
	and $03
	add $02
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	ld a, $70
	call SetStatTile
	ld a, $49
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_49cc
	ld a, $8e
	ld [wd9e3], a
	ret
.asm_49cc
	ld a, $8e
	ld [wd9e2], a
	ret

MoveEffect_SetFlagD9B3::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	ld a, $01
	call SetStatTile
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jr z, .asm_49fd
	ld a, $01
	ld [wd9b3], a
	ret
.asm_49fd
	ld a, $01
	ld [wd9b4], a
	ret

MoveEffect_TryLowerEnemyStat0::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	jp MoveEffect_LowerEnemyStat0

MoveEffect_TryStatus5_Chance10::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc
	jp MoveEffect_SetStatus5

MoveEffect_SetStatus0OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
MoveEffect_SetStatus0::
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4a54
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4a5c
.asm_4a54
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4a5c
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	jp z, MoveEffect_MissMessage
	cp $15
	jp z, MoveEffect_MissMessage
	ld a, [hli]
	cp $11
	jp z, MoveEffect_MissMessage
	cp $15
	jp z, MoveEffect_MissMessage
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 0, a
	ld [hl], a
	ld a, $1a
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_SetStatTile63::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $48
	ld [wBattleMessageID], a
	ld a, $04
	ld [wd9af], a
	ld a, $63
	call SetStatTile
	ret

MoveEffect_InflictMajorStatusA::
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4aca
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $02
	call SetStatTile
	ld a, $46
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ret
.asm_4aca
	xor a
	call SetStatTile
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_57e1) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_57e1
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_TryLowerEnemyStat1_20::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $32
	ret nc
	ld a, $01
	ld [wSideSelect], a
	ld a, $01
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $1f
	ld [wBattleMessageID], a
	ret

MoveEffect_DoubleValueFailMsg40::
	call DoubleStoredValue16
	ld a, $40
	ld [wBattleMessageID], a
	ld a, $04
	ld [wBattleAnimStep], a
	xor a
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_SetStatus1Always::
	jp MoveEffect_SetStatus1

MoveEffect_TryStatus1_30::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	jp MoveEffect_SetStatus1

MoveEffect_InflictMajorStatusB::
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4b72
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $02
	call SetStatTile
	ld a, $47
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ret
.asm_4b72
	xor a
	call SetStatTile
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_57f4) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_57f4
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_TryStatus3_30::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	jp MoveEffect_SetStatus3

MoveEffect_TryLowerEnemyStat8_20::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $32
	ret nc

MoveEffect_LowerEnemyStat8::
	ld a, $01
	ld [wSideSelect], a
	ld [wMoveTargetsEnemy], a
	ld a, $08
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $21
	ld [wBattleMessageID], a
	ret

MoveEffect_TryLowerEnemyStat1_30::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	ld a, $01
	ld [wSideSelect], a
	ld a, $01
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $1f
	ld [wBattleMessageID], a
	ret

MoveEffect_RecallHalveValue::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $34
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4c2e
	ld a, [wd9e5]
	ld d, a
	jr .asm_4c32
.asm_4c2e
	ld a, [wEnemyMonSpecies]
	ld d, a
.asm_4c32
	farcall Func_01e_4284
	ld a, [wFacingTileX]
	cp $07
	ret nz
	call HalveStoredValue16
	ld a, $40
	ld [wBattleMessageID], a
	ld a, $04
	ld [wBattleAnimStep], a
	xor a
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_TryLowerEnemyStat8_30::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4c63
	ld a, [wd9e5]
	ld d, a
	jr .asm_4c67
.asm_4c63
	ld a, [wEnemyMonSpecies]
	ld d, a
.asm_4c67
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	ld a, $01
	ld [wSideSelect], a
	ld a, $08
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $21
	ld [wBattleMessageID], a
	ret
HalveStoredValue16::
	ld a, [wd9b1]
	and a
	jr nz, .asm_4c9f
	ld a, [wd9b0]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_4ca6
.asm_4c9f
	ldh [hMathValue], a
	ld a, [wd9b0]
	ldh [hMathValue + 1], a
.asm_4ca6
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .asm_4cc1
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret
.asm_4cc1
	ld [wd9b0], a
	ldh a, [hMathValue]
	ld [wd9b1], a
	ret

MoveEffect_InflictMajorStatusC::
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4cef
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $02
	call SetStatTile
	ld a, $46
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ret
.asm_4cef
	xor a
	call SetStatTile
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_57d1) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_57d1
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	jp MoveEffect_TryStatus2_30

MoveEffect_SetStatus2OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
MoveEffect_TryStatus2_30::
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
MoveEffect_SetStatus2::
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4d3d
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4d45
.asm_4d3d
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4d45
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 2, a
	ld [hl], a
	ld a, $19
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_TwoTurnStatHeal::
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4d8c
	ld a, $01
	call SetStatTile
	ld a, $36
	ld [wBattleMessageID], a
	xor a
	ld [wSideSelect], a
	ld a, $04
	ld [wd9af], a
	ld a, $3e
	call SetStatTile
	ret
.asm_4d8c
	dec a
	jr z, .asm_4da4
	call SetStatTile
	ld a, $36
	ld [wBattleMessageID], a
	ld a, $03
	ld [wBattleAnimStep], a
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ret
.asm_4da4
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	call SetStatTile
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $37
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call WaitFrames32
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_580f) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_580f
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, $03
	ld [wBattleAnimStep], a
	xor a
	ld [wSideSelect], a
	ld a, $06
	ld [wd9af], a
	call GetStatTile
	ld [wd9b0], a
	ld a, $07
	ld [wd9af], a
	call GetStatTile
	call DoubleStoredValue16
	ld a, $06
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $07
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_TryStatus2_10::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc
	jp MoveEffect_SetStatus2

MoveEffect_TryStatus3_10::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc
MoveEffect_SetStatus3::
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4e52
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4e5a
.asm_4e52
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4e5a
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 3, a
	ld [hl], a
	ld a, $18
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_TryStatus1_10::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $19
	ret nc

MoveEffect_SetStatus1::
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_4ea3
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4eab
.asm_4ea3
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4eab
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 1, a
	ld [hl], a
	ld a, $1e
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_QuarterStoredValue::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [wd9b1]
	and a
	jr nz, .asm_4ee1
	xor a
	ldh [hMathValue + 1], a
	ld a, [wd9b0]
	ldh [hMathValue], a
	jr .asm_4eeb
.asm_4ee1
	ld a, [wd9b1]
	ldh [hMathValue], a
	ld a, [wd9b0]
	ldh [hMathValue + 1], a
.asm_4eeb
	xor a
	ldh [hMathValue + 2], a
	ld a, $04
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $03
	ld [wBattleAnimStep], a
	ld a, $34
	ld [wBattleMessageID], a
	ret

MoveEffect_LevelTimes2Damage::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [wBattleTurn]
	and a
	jr z, .asm_4f27
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_4f2f
.asm_4f27
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_4f2f
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	ldh [hMathValue + 2], a
	ld a, $02
	ld [hMathOperand], a
	farcall Multiply32By8
	ldh a, [hMathValue]
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ld a, $34
	ld [wBattleMessageID], a
	ld a, $03
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_InflictMajorStatusD::
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_4f7d
	ld a, $02
	call SetStatTile
	ld a, $46
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ret
.asm_4f7d
	xor a
	call SetStatTile
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_580f) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_580f
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_StatMinus5Value::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, [wBattleTurn]
	and a
	jr z, .asm_4fb6
	call ComputeEnemyMonStat
	jr .asm_4fb9
.asm_4fb6
	call ComputeActiveMonStat
.asm_4fb9
	ld a, [wd998]
	sub $05
	ld [wd9b0], a
	ld a, [wd999]
	sbc a, $00
	ld [wd9b1], a
	ld a, $03
	ld [wBattleAnimStep], a
	ld a, $14
	ld [wBattleMessageID], a
	ret

MoveEffect_RaiseUserStat2::
	xor a
	ld [wSideSelect], a
	ld a, $02
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $3c
	ld [wBattleMessageID], a
	ret

MoveEffect_RaiseUserStat8OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage

MoveEffect_RaiseUserStat8::
	xor a
	ld [wSideSelect], a
	ld a, $08
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $3a
	ld [wBattleMessageID], a
	ret

MoveEffect_DrainSetStatus4::
	ld a, $1c
	ld [wBattleMessageID], a
	ld a, $04
	ld [wBattleAnimStep], a
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_501c
	call ComputeEnemyMonStat
	jr .asm_501f
.asm_501c
	call ComputeActiveMonStat
.asm_501f
	ld a, [wd998]
	ld c, a
	ld a, [wd999]
	ld b, a
	ld a, [wd99a]
	sub c
	ld [wd9b0], a
	ld a, [wd99b]
	sbc a, b
	ld [wd9b1], a
	ld a, [wBattleTurn]
	and a
	jr z, .asm_5045
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_504d
.asm_5045
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_504d
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 4, a
	ld [hl], a
	ret

MoveEffect_LowerEnemyStat0OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage

MoveEffect_LowerEnemyStat0::
	ld a, $01
	ld [wSideSelect], a
	ld [wMoveTargetsEnemy], a
	xor a
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $44
	ld [wBattleMessageID], a
	ret

MoveEffect_RaiseUserStats0to3::
	ld a, $43
	ld [wBattleMessageID], a
	xor a
	ld [wSideSelect], a
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $01
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $02
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $03
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ret

MoveEffect_SetFlagD9F5Msg42::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [hFFD6]
	and a
	jp nz, MoveEffect_MissMessage
	ld hl, wd9f5
	ld a, [wBattleTurn]
	and a
	jr z, .asm_50be
	ld hl, wd9f6
.asm_50be
	ld a, $02
	ld [hl], a
	ld a, $42
	ld [wBattleMessageID], a
	ld a, $06
	ld [wBattleAnimStep], a
	ret

MoveEffect_HealValueFromStatOnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, [wBattleTurn]
	and a
	jr z, .asm_50e3
	call ComputeEnemyMonStat
	jr .asm_50e6
.asm_50e3
	call ComputeActiveMonStat
.asm_50e6
	ld a, [wd998]
	ld [wd9b0], a
	ld a, [wd999]
	ld [wd9b1], a
	ld a, $03
	ld [wBattleAnimStep], a
	ret

MoveEffect_SetStatus5OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	xor a
	ld [wBattleAnimStep], a
MoveEffect_SetStatus5::
	ld a, $1b
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_511d
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_5125
.asm_511d
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_5125
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	ld a, [hli]
	cp $11
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 5, a
	ld [hl], a
	ret

MoveEffect_RaiseUserStat3OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage

MoveEffect_RaiseUserStat3By3::
	xor a
	ld [wSideSelect], a
	ld a, $03
	ld [wd9af], a
	ld a, $03
	call AddStatTile
	ld a, $41
	ld [wBattleMessageID], a
	ret

MoveEffect_TrySetStatus7_30::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wBattleAnimStep], a
	call AdvanceRNG
	ld a, [wd991]
	cp $4c
	ret nc
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_517f
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_5187
.asm_517f
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_5187
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 7, a
	ld [hl], a
	ret

MoveEffect_HealValueFromStat::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_51a6
	call ComputeEnemyMonStat
	jr .asm_51a9
.asm_51a6
	call ComputeActiveMonStat
.asm_51a9
	ld a, [wd998]
	ld [wd9b0], a
	ld a, [wd999]
	ld [wd9b1], a
	ld a, $03
	ld [wBattleAnimStep], a
	ret

MoveEffect_LowerEnemyStat1OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage

MoveEffect_LowerEnemyStat1::
	ld a, $01
	ld [wSideSelect], a
	ld [wMoveTargetsEnemy], a
	ld a, $01
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $1f
	ld [wBattleMessageID], a
	ret

MoveEffect_HalfStatValueFail::
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $40
	ld [wBattleMessageID], a
	ld a, $04
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_51f3
	call ComputeEnemyMonStat
	jr .asm_51f6
.asm_51f3
	call ComputeActiveMonStat
.asm_51f6
	ld a, [wd99b]
	and a
	jr nz, .asm_5206
	ld a, [wd99a]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_520d
.asm_5206
	ldh [hMathValue], a
	ld a, [wd99a]
	ldh [hMathValue + 1], a
.asm_520d
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .asm_5228
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret
.asm_5228
	ld [wd9b0], a
	ldh a, [hMathValue]
	ld [wd9b1], a
	ret

MoveEffect_RaiseUserStat9::
	xor a
	ld [wSideSelect], a
	ld a, $09
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $45
	ld [wBattleMessageID], a
	xor a
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_TwoTurnChargeA::
	ld a, $01
	ld [wMoveTargetsEnemy], a
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_527d
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $02
	push af
	call SetStatTile
	ld a, $01
	ld [wSideSelect], a
	pop af
	call SetStatTile
	ld a, $02
	ld [wBattleAnimStep], a
	call .asm_52b1
	ret
.asm_527d
	dec a
	and a
	jr z, .asm_5292
	call SetStatTile
	ld a, $34
	ld [wBattleMessageID], a
	ld a, $02
	ld [wBattleAnimStep], a
	call .asm_52b1
	ret
.asm_5292
	call SetStatTile
	ld a, $01
	ld [wSideSelect], a
	xor a
	call SetStatTile
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $34
	ld [wBattleMessageID], a
	ld a, $02
	ld [wBattleAnimStep], a
	call .asm_52b1
	ret
.asm_52b1
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_52bd
	ld a, $01
	ld [wd9b3], a
	ret
.asm_52bd
	ld a, $01
	ld [wd9b4], a
	ret

MoveEffect_TwoTurnChargeB::
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_52f3
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $02
	call SetStatTile
	ld a, $36
	ld [wBattleMessageID], a
	xor a
	ld [wSideSelect], a
	ld a, $04
	ld [wd9af], a
	ld a, $0e
	call SetStatTile
	ret
.asm_52f3
	dec a
	jr z, .asm_530b
	call SetStatTile
	ld a, $36
	ld [wBattleMessageID], a
	ld a, $03
	ld [wBattleAnimStep], a
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ret
.asm_530b
	call SetStatTile
	ld a, $04
	ld [wd9af], a
	call SetStatTile
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $37
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call WaitFrames32
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_580f) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_580f
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, $03
	ld [wBattleAnimStep], a
	xor a
	ld [wSideSelect], a
	ld a, $06
	ld [wd9af], a
	call GetStatTile
	ld [wd9b0], a
	ld a, $07
	ld [wd9af], a
	call GetStatTile
	call DoubleStoredValue16
	ld a, $06
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $07
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret
WaitFrames32::
	ld c, $20
.asm_5374
	call DelayFrame
	dec c
	jr nz, .asm_5374
	ret
DoubleStoredValue16::
	ld [wd9b1], a
	and a
	jr nz, .asm_538b
	ld a, [wd9b0]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_5393
.asm_538b
	xor a
	ldh [hMathValue + 1], a
	ld a, [wd9b0]
	ldh [hMathValue], a
.asm_5393
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Multiply32By8
	ldh a, [hMathValue + 1]
	and a
	jr z, .asm_53b0
	ldh a, [hMathValue + 1]
	ld [wd9b0], a
	ldh a, [hMathValue]
	ld [wd9b1], a
	ret
.asm_53b0
	ldh a, [hMathValue]
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ret

MoveEffect_DisableRandomMove::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage

.asm_53c1
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $3e
	ld [wBattleMessageID], a
	call AdvanceRNG
	call GetRandomMoveSlotByte
	and a
	jr z, .asm_53c1

	ld a, [wBattleTurn]
	and a
	jr z, .asm_53df
	ld de, wd97c
	jr .asm_53e2

.asm_53df
	ld de, wd978
.asm_53e2
	ld a, [wd991]
	and $03
	ld l, a
	ld h, 0
	add hl, de
	ld [hl], $01
	ret

GetRandomMoveSlotByte::
	ld a, [wBattleTurn]
	and a
	jr z, .asm_53fe

	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr .asm_5406

.asm_53fe
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

.asm_5406
	ld bc, 7
	add hl, bc
	ld a, [wd991]
	and $03
	jr z, .asm_5418

.asm_5411
	ld bc, 3
	add hl, bc
	dec a
	jr nz, .asm_5411

.asm_5418
	ld a, [hl]
	ret

MoveEffect_RaiseUserStat1::
	xor a
	ld [wSideSelect], a
	ld a, $01
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $38
	ld [wBattleMessageID], a
	ret

MoveEffect_RaiseUserStat0::
	xor a
	ld [wSideSelect], a
	xor a
	ld [wd9af], a
	ld a, $01
	call AddStatTile
	ld a, $3b
	ld [wBattleMessageID], a
	ret

MoveEffect_LowerEnemyStat2OnHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage

MoveEffect_LowerEnemyStat2::
	ld a, $01
	ld [wSideSelect], a
	ld [wMoveTargetsEnemy], a
	ld a, $02
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $20
	ld [wBattleMessageID], a
	ret

MoveEffect_LowerEnemyStat1By2::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $01
	ld [wSideSelect], a
	ld a, $01
	ld [wd9af], a
	ld a, $fe
	call AddStatTile
	ld a, $1f
	ld [wBattleMessageID], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_HalfStatDamage::
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $34
	ld [wBattleMessageID], a
	ld a, $03
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jr z, .asm_54a0
	call ComputeEnemyMonStat
	jr .asm_54a3
.asm_54a0
	call ComputeActiveMonStat
.asm_54a3
	ld a, [wd999]
	and a
	jr nz, .asm_54b3
	ld a, [wd998]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .asm_54ba
.asm_54b3
	ldh [hMathValue], a
	ld a, [wd998]
	ldh [hMathValue + 1], a
.asm_54ba
	xor a
	ldh [hMathValue + 2], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .asm_54d5
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret
.asm_54d5
	ld [wd9b0], a
	ldh a, [hMathValue]
	ld [wd9b1], a
	ret

MoveEffect_TypedFractionalDamage::
	ld a, [wd9c7]
	and a
	jp z, MoveEffect_MissMessage
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_551e
	ld a, $04
	ld [wd9af], a
	ld a, $04
	call AddStatTile
	xor a
	ld [wd9af], a
	ld a, $05
	call AddStatTile
	ld a, $01
	ld [wd9af], a
	ld a, $fb
	call AddStatTile
	ld a, $05
	ld [wd9af], a
	ld a, $02
	push af
	call SetStatTile
	jr .asm_5524
.asm_551e
	add $02
	push af
	call SetStatTile
.asm_5524
	farcall CalcMoveDamage
	ld a, [wd9b0]
	ldh [hMathValue], a
	ld a, [wd9b1]
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	call SwapMathValueBytes
	pop af
	dec a
	ldh [hMathOperand], a
	farcall Multiply32By8
	call SwapMathValueBytes
	ldh a, [hMathValue]
	ld [wd9b0], a
	ldh a, [hMathValue + 1]
	ld [wd9b1], a
	ld a, $03
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

MoveEffect_SetStatus4Variant::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, [wd98d]
	and a
	jr nz, .asm_5573
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_557b
.asm_5573
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_557b
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 4, a
	ld [hl], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $1c
	ld [wBattleMessageID], a
	ld a, $02
	ld [wBattleAnimStep], a
	ret

MoveEffect_Damage::
	ld a, [wd993]
	and a
	jr nz, MoveEffect_SetStatus4

MoveEffect_MissMessage::
	call AdvanceRNG
	ld a, [wd991]
	and $03
	add $0f
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret
MoveEffect_SetStatus4::
	ld a, [wd98d]
	and a
	jr nz, .asm_55d2
	ld a, [wActiveMonPtr]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_55da
.asm_55d2
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_55da
	ld hl, $0014
	add hl, bc
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld a, [hli]
	cp $11
	ret z
	cp $10
	ret z
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	set 4, a
	ld [hl], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ld a, $1c
	ld [wBattleMessageID], a
	xor a
	ld [wBattleAnimStep], a
	ret

MoveEffect_RandomStatTileTwoTurn::
	xor a
	ld [wSideSelect], a
	ld a, $05
	ld [wd9af], a
	call GetStatTile
	and a
	jr nz, .asm_562a
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $02
	call SetStatTile
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret
.asm_562a
	dec a
	and a
	jr z, .asm_563c
	call SetStatTile
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret
.asm_563c
	call SetStatTile
	ld a, $34
	ld [wBattleMessageID], a
	ld a, $01
	ld [wBattleAnimStep], a
	ret

MoveEffect_GenericHit::
	ld a, [wd993]
	and a
	jp z, MoveEffect_MissMessage
	ld a, $02
	ld [wBattleAnimStep], a
	ld a, $01
	ld [wMoveTargetsEnemy], a
	ret

Pointers_030_565c::
	dw .image_566a
	dw .image_572c
	dw .image_57ae
	dw .image_57f0
	dw .image_5832
	dw .image_5874
	dw .image_58b6

.image_566a
	dw .image_566a_e - .image_566a_d
.image_566a_d
	INCBIN "gfx/battle/image_30_566c.interleave.w16.2bpp"
.image_566a_e

.image_572c
	dw .image_572c_e - .image_572c_d
.image_572c_d
	INCBIN "gfx/battle/image_30_572e.interleave.w16.2bpp"
.image_572c_e

.image_57ae
	dw .image_57ae_e - .image_57ae_d
.image_57ae_d
	INCBIN "gfx/misc/gfx_30_57b0.2bpp"
.image_57ae_e

.image_57f0
	dw .image_57f0_e - .image_57f0_d
.image_57f0_d
	INCBIN "gfx/misc/gfx_30_57f2.2bpp"
.image_57f0_e

.image_5832
	dw .image_5832_e - .image_5832_d
.image_5832_d
	INCBIN "gfx/misc/gfx_30_5834.2bpp"
.image_5832_e

.image_5874
	dw .image_5874_e - .image_5874_d
.image_5874_d
	INCBIN "gfx/misc/gfx_30_5876.2bpp"
.image_5874_e

.image_58b6
	dw .image_58b6_e - .image_58b6_d
.image_58b6_d
	INCBIN "gfx/misc/gfx_30_58b8.2bpp"
.image_58b6_e

Pointers_030_58f8::
	dw SubImage_030_5906
	dw SubImage_030_5968
	dw SubImage_030_59ca
	dw SubImage_030_5a2c
	dw SubImage_030_5a8e
	dw SubImage_030_5af0
	dw SubImage_030_5b52
GFX_030_5906::
SubImage_030_5906::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5906.2bpp"
.e

SubImage_030_5968::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5968.2bpp"
.e

SubImage_030_59ca::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_59ca.2bpp"
.e

SubImage_030_5a2c::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5a2c.2bpp"
.e

SubImage_030_5a8e::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5a8e.2bpp"
.e

SubImage_030_5af0::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5af0.2bpp"
.e

SubImage_030_5b52::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_30_5b52.2bpp"
.e
Palettes_030_5bb4:: ; 3 palettes (orphan)
	RGB 28, 7, 28
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
RunBattleAnimPaletteEffect::
	ld a, [wd9a0]
	and a
	ret z
	cp $01
	jp z, PaletteAnimFade1
	cp $02
	jp z, PaletteAnimFade2
	cp $03
	jp z, PaletteAnimFade3
	cp $04
	jp z, PaletteAnimFade4
	cp $05
	jp z, PaletteAnimFade5
	ret
RunBattleAnimSprites::
	ld a, [wd9ad]
	and a
	ret z
	ld a, [wBattleAnimID]
	cp $3b
	jp z, AnimMove_3b
	cp $3c
	jp z, AnimMove_3c
	cp $3d
	jp z, AnimMove_3d
	cp $41
	jp z, AnimMove_41
	cp $45
	jp z, AnimMove_45
	cp $48
	jp z, AnimMove_48
	cp $4a
	jp z, AnimMove_4a
	cp $4b
	jp z, AnimMove_4b
	cp $4e
	jp z, AnimMove_4e
	cp $53
	jp z, AnimMove_53
	cp $54
	jp z, AnimMove_54
	cp $56
	jp z, AnimMove_56
	cp $57
	jp z, AnimMove_57
	cp $5c
	jp z, AnimMove_5c
	cp $63
	jp z, AnimMove_63
	cp $6a
	jp z, AnimMove_6a
	cp $6b
	jp z, AnimMove_6b
	cp $6c
	jp z, AnimMove_6c
	cp $6f
	jp z, AnimMove_6f
	cp $76
	jp z, AnimMove_76
	cp $79
	jp z, AnimMove_79
	cp $7e
	jp z, AnimMove_7e
	cp $81
	jp z, AnimMove_81
	cp $82
	jp z, AnimMove_82
	cp $83
	jp z, AnimMove_83
	cp $88
	jp z, AnimMove_88
	cp $8a
	jp z, AnimMove_8a
	cp $8b
	jp z, AnimMove_8b
	cp $8c
	jp z, AnimMove_8c
	ret
AnimMove_8c::
	ld bc, wd1a8
.asm_5c88
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5cc5
	ldh a, [hFadeFrameCounter]
	and $3f
	jr nz, .asm_5cea
	ld [hl], $01
	ld de, BattleAnimStepTable_030_5cff
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, $03
	ld [bc], a
	dec bc
	dec bc
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $05
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_5cc5
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_5cea
	ld de, BattleAnimData_030_5cf7
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld l, [hl]
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_5ce3
	ld hl, $0002
	add hl, bc
	ld [hl], a
	jr .asm_5cea
.asm_5ce3
	ld hl, $0000
	add hl, bc
	call ClearAnimSpriteSlot
.asm_5cea
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp nz, .asm_5c88
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_5cf7`
BattleAnimData_030_5cf7::
	db $03, $04, $05, $00, $05, $00, $05, $ff
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): per-[wd9ae] 2B coord-delta added to sprite pos at wd1a0
BattleAnimStepTable_030_5cff::
	db $d0, $08, $d0, $18, $d0, $00, $d0, $20, $d0, $10
AnimMove_8b::
	ld bc, wd1a8
.asm_5d0c
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, AnimMove_8a_Spawn
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	jr nc, .asm_5d2a
	and $01
	jr nz, .asm_5d49
	ld hl, $0000
	add hl, bc
	dec [hl]
	jr .asm_5d31
.asm_5d2a
	ld hl, $0000
	add hl, bc
	call ClearAnimSpriteSlot
.asm_5d31
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and $03
	jr nz, .asm_5d49
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $03
	jr nz, .asm_5d47
	ld [hl], $04
	jr .asm_5d49
.asm_5d47
	ld [hl], $03
.asm_5d49
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp nz, .asm_5d0c
	ret
AnimMove_8a::
	ld bc, wd1a8
AnimMove_8a_Loop::
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, AnimMove_8a_Advance
AnimMove_8a_Spawn::
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, AnimMove_8a_Next
	ld [hl], $01
	ld de, BattleAnimStepTable_030_5dce
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, $04
	ld [bc], a
	dec bc
	dec bc
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $05
	ret c
	xor a
	ld [wd9ae], a
	ret
AnimMove_8a_Advance::
	ld hl, $0000
	add hl, bc
	dec [hl]
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	jr c, .asm_5dac
	ld hl, $0000
	add hl, bc
	call ClearAnimSpriteSlot
.asm_5dac
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, AnimMove_8a_Next
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $04
	jr nz, .asm_5dbf
	ld [hl], $05
	jr AnimMove_8a_Next
.asm_5dbf
	ld [hl], $04
AnimMove_8a_Next::
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp nz, AnimMove_8a_Loop
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_5dce::
	db $f8, $00, $00, $10, $04, $20, $fc, $08, $04, $18
AnimMove_88::
	ld bc, wd1a8
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5e24
	ld [hl], $01
	ld de, BattleAnimStepTable_030_5e69
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, $02
	ld [bc], a
	ld bc, wd1b0
	ld de, wd1a0
	ld a, [de]
	add [hl]
	ld [bc], a
	inc de
	inc hl
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	ld a, $03
	ld [bc], a
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $04
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_5e24
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld bc, wd1a8
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	cp $01
	jr z, .asm_5e59
	cp $02
	jr z, .asm_5e49
	ld [hl], $00
	ld hl, $0002
	add hl, bc
	ld [hl], $00
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $00
	ret
.asm_5e49
	ld [hl], $03
	ld hl, $0002
	add hl, bc
	ld [hl], $02
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $03
	ret
.asm_5e59
	ld [hl], $02
	ld hl, $0002
	add hl, bc
	ld [hl], $03
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $02
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_5e69::
	db $04, $fc, $fc, $04, $04, $04, $fc, $fc, $00, $04, $00, $fc, $fc, $04, $04, $04
AnimMove_83::
	ld a, [wd9ae]
	and a
	jr z, .asm_5ef1
	ld bc, wd1a0
.asm_5e82
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5ea7
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $07
	jr nz, .asm_5ee5
	ld hl, $0002
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $06
	jr c, .asm_5ee5
	ld hl, $0000
	add hl, bc
	call ClearAnimSpriteSlot
	jr .asm_5ee5
.asm_5ea7
	ldh a, [hFadeFrameCounter]
	and $0f
	jr nz, .asm_5ee5
	ld de, BattleAnimStepTable_030_5f2a
	ld a, [wd9ae]
	sub $01
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wBattleTurn]
	add a
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], $03
	inc hl
	inc hl
	ld [hl], $01
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	ld a, $01
	ld [wd9ae], a
	ret
.asm_5ee5
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jr c, .asm_5e82
	ret
.asm_5ef1
	ld a, [wBattleTurn]
	and a
	jr z, .asm_5efc
	ld de, BattleAnimData_030_5f3e
	jr .asm_5eff
.asm_5efc
	ld de, BattleAnimData_030_5f8f
.asm_5eff
	ld bc, wd1a0
	ld hl, $0003
	add hl, bc
	inc [hl]
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr nz, .asm_5f21
	ld a, $01
	ld [wd9ae], a
	ld a, $03
	ld [wd9a0], a
	ld a, $0b
	ld [wd99f], a
	ret
.asm_5f21
	ld a, [bc]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, [bc]
	add [hl]
	ld [bc], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): 2D table [wd9ae-1]x[wBattleTurn], sprite/coord record
BattleAnimStepTable_030_5f2a::
	db $40, $60, $10, $10, $50, $70, $20, $20, $38, $80, $08, $30, $58, $68, $28, $18
	db $58, $80, $28, $30
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_5f3e`
BattleAnimData_030_5f3e::
	db $ff, $ff, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe
	db $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe
	db $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe
	db $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe
	db $ff, $fe, $ff, $fe, $00, $fe, $ff, $fe, $00, $fe, $ff, $fe, $ff, $fe, $00, $fe
	db $88
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_5f8f`
BattleAnimData_030_5f8f::
	db $00, $01, $02, $02, $01, $02, $02, $02, $02, $02, $01, $02, $02, $02, $01, $02
	db $02, $02, $01, $02, $02, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02, $02
	db $01, $02, $02, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02, $02, $02, $02
	db $01, $02, $02, $02, $01, $02, $02, $02, $01, $02, $02, $02, $02, $02, $01, $02
	db $02, $02, $01, $02, $02, $02, $01, $02, $02, $02, $02, $02, $01, $02, $02, $02
	db $88
AnimMove_82::
	ld a, [wd9ae]
	and a
	jr z, .asm_5fff
	cp $01
	jr z, .asm_602a
	cp $02
	jr z, .asm_606c
	cp $03
	jr z, .asm_602a
	cp $04
	jr z, .asm_6071
	cp $05
	jr z, .asm_602a
	cp $06
	jr z, .asm_6076
	ret
.asm_5fff
	ld de, BattleAnimData_030_607b
.asm_6002
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	push hl
	pop de
	ld hl, wd1a0
	ld c, $03
.asm_6011
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld [hl], $05
	inc de
	inc de
	ld a, l
	add $06
	ld l, a
	dec c
	jr nz, .asm_6011
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
.asm_602a
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $05
	jr z, .asm_6056
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $05
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $05
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $05
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
.asm_6056
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $06
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $06
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $06
	ret
.asm_606c
	ld de, BattleAnimData_030_6087
	jr .asm_6002
.asm_6071
	ld de, BattleAnimData_030_6093
	jr .asm_6002
.asm_6076
	xor a
	ld [wd9ae], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): per-[wBattleTurn] sprite-position setup (copied to wd1a0)
BattleAnimData_030_607b::
	db $10, $18, $40, $68, $20, $40, $50, $90, $30, $28, $60, $78
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6087`
BattleAnimData_030_6087::
	db $10, $28, $40, $78, $30, $18, $60, $68, $20, $40, $50, $90
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6093`
BattleAnimData_030_6093::
	db $20, $28, $50, $68, $30, $38, $60, $78, $10, $40, $40, $90
AnimMove_81::
	ld a, [wd9ae]
	and a
	jr z, .asm_60af
	cp $01
	jr z, .asm_60fe
	cp $02
	jp z, .asm_6104
	ret
.asm_60af
	ld a, $01
	ld [wd9ae], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_60dc
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $02
	ld hl, wd1a8
	ld [hl], $40
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $02
	ld hl, wd1b0
	ld [hl], $40
	inc hl
	ld [hl], $88
	inc hl
	ld [hl], $02
	ret
.asm_60dc
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $02
	ld hl, wd1a8
	ld [hl], $10
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $02
	ld hl, wd1b0
	ld [hl], $10
	inc hl
	ld [hl], $38
	inc hl
	ld [hl], $02
	ret
.asm_60fe
	ld a, $02
	ld [wd9ae], a
	ret
.asm_6104
	ld hl, wd1a0
	inc [hl]
	inc [hl]
	ld hl, wd1a8
	inc [hl]
	inc [hl]
	ld hl, wd1b0
	inc [hl]
	inc [hl]
	inc hl
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $10
	ret c
	ld hl, wd1a0
	inc hl
	inc hl
	ld [hl], $03
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $03
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $03
	ld a, $03
	ld [wd9ae], a
	ret
AnimMove_7e::
	ld a, [wd9ae]
	and a
	jp z, .asm_6326
	cp $01
	jp z, .asm_62ea
	cp $02
	jp z, .asm_6273
	cp $03
	jp z, .asm_6237
	cp $04
	jp z, .asm_6214
	cp $05
	jp z, .asm_61d8
	cp $06
	jp z, .asm_61ad
	cp $07
	jp z, .asm_6171
	cp $08
	jp z, .asm_6166
	ret
.asm_6166
	call ClearAnimSpriteTable
	xor a
	ld [wd9ad], a
	ld [wd9ae], a
	ret
.asm_6171
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_618e
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $01
	jr nz, .asm_618a
	ld [hl], $00
	jr .asm_619e
.asm_618a
	ld [hl], $01
	jr .asm_619e
.asm_618e
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $0a
	jr nz, .asm_619c
	ld [hl], $00
	jr .asm_619e
.asm_619c
	ld [hl], $0a
.asm_619e
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $08
	ld [wd9ae], a
	ret
.asm_61ad
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_61c8
	ld hl, wd1a0
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	cp $02
	ret nc
	ld a, $07
	ld [wd9ae], a
	ret
.asm_61c8
	ld hl, wd1a0
	inc hl
	inc hl
	dec [hl]
	ld a, [hl]
	cp $0b
	ret nc
	ld a, $07
	ld [wd9ae], a
	ret
.asm_61d8
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_61f5
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $09
	jr nz, .asm_61f1
	ld [hl], $00
	jr .asm_6205
.asm_61f1
	ld [hl], $09
	jr .asm_6205
.asm_61f5
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $12
	jr nz, .asm_6203
	ld [hl], $00
	jr .asm_6205
.asm_6203
	ld [hl], $12
.asm_6205
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $06
	ld [wd9ae], a
	ret
.asm_6214
	ld a, $05
	ld [wd9ae], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_622b
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $30
	inc hl
	ld [hl], $09
	ret
.asm_622b
	ld hl, wd1a0
	ld [hl], $58
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $12
	ret
.asm_6237
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6254
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $12
	jr nz, .asm_6250
	ld [hl], $00
	jr .asm_6264
.asm_6250
	ld [hl], $12
	jr .asm_6264
.asm_6254
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $09
	jr nz, .asm_6262
	ld [hl], $00
	jr .asm_6264
.asm_6262
	ld [hl], $09
.asm_6264
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $04
	ld [wd9ae], a
	ret
.asm_6273
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_628f
	ld hl, wd1a0
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $12
	ret c
	ld a, $03
	ld [wd9ae], a
	jr .asm_629e
.asm_628f
	ld hl, wd1a0
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $09
	ret c
	ld a, $03
	ld [wd9ae], a
.asm_629e
	ld a, $01
	ld [wMoveTargetsEnemy], a
	farcall CalcAndApplyMoveDamage
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_62b9
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .asm_62c1
.asm_62b9
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
.asm_62c1
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	ret nz
	ld a, $05
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld [wd9ad], a
	ld [wd9ae], a
	ld a, $01
	ld [hFFC6], a
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	ld [wd98c], a
	ld [wd98e], a
	ret
.asm_62ea
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6307
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $0a
	jr nz, .asm_6303
	ld [hl], $00
	jr .asm_6317
.asm_6303
	ld [hl], $0a
	jr .asm_6317
.asm_6307
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $01
	jr nz, .asm_6315
	ld [hl], $00
	jr .asm_6317
.asm_6315
	ld [hl], $01
.asm_6317
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	ld [hl], $00
	ld a, $02
	ld [wd9ae], a
	ret
.asm_6326
	ld a, $01
	ld [wd9ae], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_633d
	ld hl, wd1a0
	ld [hl], $58
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $0a
	ret
.asm_633d
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $30
	inc hl
	ld [hl], $01
	ret
AnimMove_79::
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $02
	jr z, .asm_635b
	ld [hl], $02
	ret
.asm_635b
	ld [hl], $03
	ret
AnimMove_76::
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_6374
	ld hl, wd1a8
	inc hl
	inc hl
	ld a, [hl]
	cp $01
	jr z, .asm_6372
	ld [hl], $01
	jr .asm_6374
.asm_6372
	ld [hl], $02
.asm_6374
	ld a, [wd9ae]
	and a
	jp z, .asm_6381
	cp $01
	jp z, .asm_6395
	ret
.asm_6381
	ld hl, wd1a8
	inc hl
	dec [hl]
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld [hl], $00
	ld a, $01
	ld [wd9ae], a
	ret
.asm_6395
	ld hl, wd1a8
	inc hl
	inc [hl]
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld [hl], $00
	xor a
	ld [wd9ae], a
	ret
AnimMove_6f::
	ld a, [wd9ae]
	and a
	jp z, .asm_6495
	cp $01
	jp z, .asm_6471
	cp $02
	jp z, .asm_6495
	cp $03
	jp z, .asm_6447
	cp $04
	jr z, .asm_6416
	cp $05
	jr z, .asm_63c6
.asm_63c6
	ld bc, wd1a0
	ld de, BattleAnimSeq_030_64d0
	ld hl, $0004
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr nz, .asm_63e7
.asm_63dc
	call ClearAnimSpriteTable
	xor a
	ld [wd9ad], a
	ld [wd9ae], a
	ret
.asm_63e7
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a0
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	ld bc, wd1a8
	ld de, BattleAnimSeq_030_64d0
	ld hl, $0004
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_63dc
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a8
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	ret
.asm_6416
	ld de, BattleAnimData_030_64cc
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a0
	ld a, d
	sub $09
	ld [hl], a
	inc hl
	ld a, e
	sub $07
	ld [hl], a
	inc hl
	ld [hl], $01
	inc hl
	inc hl
	ld [hl], $04
	ld hl, wd1a8
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], $02
	ld a, $05
	ld [wd9ae], a
	ret
.asm_6447
	ld hl, wd1a0
	dec [hl]
	inc hl
	dec [hl]
	ld hl, wd1a8
	inc [hl]
	inc hl
	dec [hl]
	ld hl, wd1b0
	inc [hl]
	inc hl
	inc [hl]
	ld hl, wd1b8
	dec [hl]
	inc hl
	inc [hl]
	ld bc, $0003
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld a, $04
	ld [wd9ae], a
	call ClearAnimSpriteTable
	ret
.asm_6471
	ld hl, wd1a0
	dec [hl]
	ld hl, wd1a8
	inc hl
	dec [hl]
	ld hl, wd1b0
	inc [hl]
	ld hl, wd1b8
	inc hl
	inc [hl]
	ld bc, $0003
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	ld a, $02
	ld [wd9ae], a
	call ClearAnimSpriteTable
	ret
.asm_6495
	ld de, BattleAnimData_030_64c8
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, wd1a0
	ld c, $04
.asm_64a9
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], $01
	ld a, [wd9ae]
	and a
	jr z, .asm_64b7
	ld [hl], $02
.asm_64b7
	push bc
	ld bc, $0006
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_64a9
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wBattleTurn
BattleAnimData_030_64c8::
	db $20, $28, $50, $78
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wBattleTurn
BattleAnimData_030_64cc::
	db $40, $a0, $10, $50
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): $88-terminated anim/movement sequence (auto-stepped via [bc+4])
BattleAnimSeq_030_64d0::
	db $ff, $00, $fd, $ff, $fd, $fe, $fd, $fd, $fd, $fd, $fe, $fd, $fe, $fd, $fe, $fd
	db $ff, $fd, $ff, $fd, $ff, $fd, $00, $fd, $ff, $fd, $00, $fd, $00, $fd, $00, $fd
	db $01, $fd, $00, $fd, $01, $fd, $02, $fd, $01, $fd, $02, $fd, $01, $fd, $03, $fd
	db $03, $fd, $03, $fe, $03, $fe, $03, $fe, $03, $ff, $03, $00, $03, $ff, $03, $00
	db $03, $00, $03, $01, $03, $01, $03, $01, $03, $02, $03, $02, $03, $03, $03, $03
	db $02, $04, $03, $04, $01, $04, $02, $04, $00, $04, $01, $04, $00, $04, $00, $04
	db $ff, $04, $ff, $04, $fc, $04, $fc, $03, $fc, $03, $fc, $02, $fc, $01, $fc, $00
	db $fc, $00, $fc, $00, $fc, $fe, $fc, $fe, $fc, $ff, $fc, $fc, $fc, $fc, $fe, $fc
	db $ff, $fc, $ff, $fc, $00, $fc, $01, $fc, $02, $fc, $03, $fc, $04, $fc, $04, $fd
	db $04, $ff, $04, $ff, $04, $00, $05, $01, $05, $02, $05, $05, $04, $05, $02, $05
	db $01, $05, $fe, $05, $fc, $05, $fb, $04, $fb, $01, $fb, $00, $fb, $fe, $fb, $fc
	db $fd, $fb, $00, $fb, $03, $fb, $04, $fc, $05, $ff, $04, $04, $00, $05, $fb, $03
	db $88
AnimMove_6c::
	ld bc, wd1a8
.asm_6594
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_65b9
	cp $01
	jp z, .asm_65f9
	cp $02
	jp z, .asm_6633
	cp $03
	jp z, .asm_666a
	cp $04
	jp z, .asm_6633
	cp $05
	jp z, .asm_669b
	jp .asm_66bc
.asm_65b9
	ldh a, [hFadeFrameCounter]
	and $0f
	jp nz, .asm_66bc
	ld de, BattleAnimStepTable_030_66c9
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld [hl], $02
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $03
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_65f9
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $30
	jr c, .asm_6611
	ld [hl], $00
	dec hl
	ld [hl], $02
	ld hl, $0002
	add hl, bc
	ld [hl], $04
	jp .asm_66bc
.asm_6611
	ld hl, $0000
	add hl, bc
	dec [hl]
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	and $03
	jp nz, .asm_66bc
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $02
	jr nz, .asm_662e
	ld [hl], $03
	jp .asm_66bc
.asm_662e
	ld [hl], $02
	jp .asm_66bc
.asm_6633
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $0f
	jr c, .asm_6643
	ld [hl], $00
	dec hl
	inc [hl]
	jr .asm_66bc
.asm_6643
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6659
	ld hl, $0000
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	inc hl
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	jr .asm_66bc
.asm_6659
	ld hl, $0000
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	inc hl
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jr .asm_66bc
.asm_666a
	ld de, BattleAnimStepTable_030_66d5
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, $0004
	add hl, bc
	ld [hl], $04
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	jr .asm_66bc
.asm_669b
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	cp $03
	jr nz, .asm_66ae
	ld [hl], $00
	ld hl, $0004
	add hl, bc
	ld [hl], $06
	jr .asm_66bc
.asm_66ae
	ld [hl], $03
	ld a, $03
	ld [wd9a0], a
	ld a, $01
	ld [wd99f], a
	jr .asm_66bc
.asm_66bc
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $c0
	jp c, .asm_6594
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_66c9::
	db $30, $28, $70, $78, $30, $18, $70, $68, $30, $38, $70, $88
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_66d5::
	db $80, $a0, $50, $d0, $80, $90, $50, $e0, $80, $b0, $50, $f0
AnimMove_6b::
	ld a, [wd9ae]
	and a
	jr z, .asm_66e8
	ret
.asm_66e8
	ld hl, wd1a8
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_66f5
	dec hl
	dec [hl]
	dec hl
	dec [hl]
.asm_66f5
	ld hl, wd1b0
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_6702
	dec hl
	inc [hl]
	dec hl
	dec [hl]
.asm_6702
	ld hl, wd1b8
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_670f
	dec hl
	dec [hl]
	dec hl
	inc [hl]
.asm_670f
	ld hl, wd1c0
	inc hl
	inc hl
	ld a, [hl]
	and a
	ret z
	dec hl
	inc [hl]
	dec hl
	inc [hl]
	ret
AnimMove_6a::
	ld bc, wd1a0
.asm_671f
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_673d
	cp $01
	jp z, .asm_6781
	cp $02
	jp z, .asm_67ab
	cp $03
	jp z, .asm_6781
	cp $04
	jp z, .asm_67dd
	ret
.asm_673d
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_67e5
	ld de, BattleAnimData_030_67f2
	ld a, [wd9ae]
	add a
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $03
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_6781
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $14
	jr c, .asm_6791
	ld [hl], $00
	dec hl
	inc [hl]
	jr .asm_67e5
.asm_6791
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_67a1
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	add $08
	ld [hl], a
	jr .asm_67e5
.asm_67a1
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	sub $08
	ld [hl], a
	jr .asm_67e5
.asm_67ab
	ld de, BattleAnimData_030_6804
	ld a, [wd9ae]
	add a
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, $0004
	add hl, bc
	ld [hl], $03
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	jr .asm_67e5
.asm_67dd
	ld hl, $0002
	add hl, bc
	ld [hl], $00
	jr .asm_67e5
.asm_67e5
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $b8
	jp c, .asm_671f
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_67f2`
BattleAnimData_030_67f2::
	db $20, $30, $01, $50, $60, $01, $10, $30, $02, $40, $60, $02, $30, $30, $02, $60
	db $60, $02
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6804`
BattleAnimData_030_6804::
	db $50, $30, $01, $20, $60, $01, $40, $30, $02, $10, $60, $02, $60, $30, $02, $30
	db $60, $02
AnimMove_63::
	ld a, [wd9ae]
	and a
	jr z, .asm_6825
	cp $01
	jr z, .asm_6861
	cp $02
	jr z, .asm_6882
	ret
.asm_6825
	ld de, BattleAnimData_030_68b2
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld bc, wd1a0
.asm_6835
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, [wBattleAnimStep]
	inc a
	ld [hl], a
	inc de
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	inc de
	inc de
	ld a, [wBattleAnimStep]
	inc a
	ld [wBattleAnimStep], a
	cp $03
	jr c, .asm_6835
	ld a, $01
	ld [wd9ae], a
	xor a
	ld [wBattleAnimStep], a
	ret
.asm_6861
	ldh a, [hFadeFrameCounter]
	and $0f
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	inc [hl]
	ld hl, wd1a8
	inc hl
	inc hl
	inc [hl]
	ld hl, wd1b0
	inc hl
	inc hl
	inc [hl]
	ld a, [hl]
	cp $05
	ret c
	ld a, $02
	ld [wd9ae], a
	ret
.asm_6882
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr nz, .asm_68a1
	ld [hl], $05
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $05
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $05
	ret
.asm_68a1
	ld [hl], $00
	ld hl, wd1a8
	inc hl
	inc hl
	ld [hl], $00
	ld hl, wd1b0
	inc hl
	inc hl
	ld [hl], $00
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wBattleTurn
BattleAnimData_030_68b2::
	db $54, $68, $24, $18, $4c, $78, $1c, $28, $4c, $88, $30, $38
AnimMove_5c::
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld de, wd1a8
	inc de
	inc de
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr nz, .asm_68d7
	ld a, $06
	ld [hl], a
	ld [de], a
	jr AnimMove_5c_Step
.asm_68d7
	xor a
	ld [hl], a
	ld [de], a
	jr AnimMove_5c_Step
AnimMove_57::
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld de, wd1a8
	inc de
	inc de
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr nz, .asm_68f5
	ld a, $03
	ld [hl], a
	ld [de], a
	jr AnimMove_5c_Step
.asm_68f5
	xor a
	ld [hl], a
	ld [de], a
AnimMove_5c_Step::
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	and $01
	jr z, .asm_6919
	ld hl, wd1a8
	inc hl
	ld a, [hl]
	sub $08
	ld [hl], a
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $08
	ld [hl], a
	ret
.asm_6919
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $08
	ld [hl], a
	ld hl, wd1a8
	inc hl
	ld a, [hl]
	add $08
	ld [hl], a
	ret
AnimMove_56::
	ldh a, [hFadeFrameCounter]
	and $0f
	ret nz
	ld hl, wd1a0
	inc hl
	inc hl
	ld a, [hl]
	cp $04
	ret z
	inc [hl]
	ret
AnimMove_54::
	ld bc, wd1a0
.asm_693d
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_6951
	cp $01
	jp z, .asm_6999
	cp $02
	jp z, .asm_69bb
	ret
.asm_6951
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .asm_69e4
	ld de, BattleAnimStepTable_030_69f1
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $01
	ld hl, $0004
	add hl, bc
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $01
	ld [hl], a
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	xor a
	ld [wd9ae], a
	ret
.asm_6999
	ld de, BattleAnimSeq_030_6a09
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_69dd
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	jr .asm_69e4
.asm_69bb
	ld de, BattleAnimSeq_030_6a09
	ld hl, $0005
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_69dd
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	sub e
	ld [hli], a
	jr .asm_69e4
.asm_69dd
	ld hl, $0000
	add hl, bc
	call ClearAnimSpriteSlot
.asm_69e4
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_693d
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_69f1::
	db $30, $78, $00, $20, $30, $88, $00, $30, $30, $70, $00, $18, $30, $80, $00, $28
	db $30, $68, $00, $10, $30, $90, $00, $38
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by hl
BattleAnimSeq_030_6a09::
	db $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00
	db $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00, $04, $00
	db $ff, $00, $fd, $01, $fd, $01, $fd, $01, $fd, $02, $fd, $02, $fe, $03, $fe, $03
	db $02, $02, $01, $02, $02, $01, $02, $02, $02, $01, $02, $01, $02, $01, $02, $01
	db $02, $00, $00, $02, $fe, $02, $fe, $02, $fe, $02, $ff, $02, $00, $02, $ff, $02
	db $03, $03, $03, $02, $88
AnimMove_53::
	ld a, [wd9ae]
	and a
	jr nz, .asm_6aa1
	ld a, $01
	ld [wd9ae], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6a86
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $01
	ld hl, wd1a8
	ld [hl], $40
	inc hl
	ld [hl], $28
	inc hl
	ld [hl], $01
	ret
.asm_6a86
	ld hl, wd1a0
	ld [hl], $70
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $01
	ld hl, wd1a8
	ld [hl], $70
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $01
	xor a
	ld [wd98e], a
	ret
.asm_6aa1
	ld bc, wd1a0
	ld de, BattleAnimData_030_6adb
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_6ad0
	ld d, a
	ld a, [hl]
	ld e, a
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	ld hl, $0008
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	sub e
	ld [hli], a
	ret
.asm_6ad0
	xor a
	ld [wd9ad], a
	ld [wd9ae], a
	call ClearAnimSpriteTable
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); indexed table (index wd98e)
BattleAnimData_030_6adb::
	db $ff, $00, $fd, $00, $fd, $00, $fd, $00, $fd, $01, $fd, $00, $fd, $01, $fd, $02
	db $fd, $02, $ff, $02, $ff, $02, $01, $02, $01, $02, $02, $02, $02, $01, $02, $01
	db $02, $00, $02, $01, $02, $00, $02, $01, $02, $00, $02, $00, $02, $00, $02, $00
	db $02, $00, $00, $02, $fd, $00, $fd, $00, $fd, $01, $fd, $03, $ff, $03, $01, $02
	db $01, $02, $02, $02, $02, $01, $02, $01, $02, $00, $02, $01, $00, $02, $fe, $01
	db $fe, $02, $ff, $03, $01, $03, $02, $02, $02, $01, $88
AnimMove_3b::
	ld a, [wd9ae]
	cp $01
	jp z, AnimMove_3b_Flicker
	cp $02
	jp z, AnimMove_3b_PhaseB
	cp $03
	jp z, AnimMove_3b_Flicker
	cp $04
	jp z, AnimMove_3b_PhaseC
	cp $05
	jp z, AnimMove_3b_Flicker
	ld a, $01
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $20
	ld [hli], a
	ld [hl], $06
	ret
AnimMove_3b_Flicker::
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld de, wd1a0
	ld hl, $000a
	add hl, de
	ld a, [hl]
	cp $06
	jr nz, .asm_6b8b
	ld [hl], $07
	ret
.asm_6b8b
	ld [hl], $06
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	call ClearAnimSpriteSlot
	xor a
	ld [wd9ad], a
	ret
AnimMove_3b_PhaseB::
	ld a, $03
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $10
	ld [hli], a
	ld [hl], $06
	ret
AnimMove_3b_PhaseC::
	ld a, $05
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $06
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wBattleTurn
BattleAnimData_030_6bee::
	db $40, $60, $10, $10
AnimMove_3c::
	ld a, [wd9ae]
	cp $01
	jp z, AnimMove_3b_Flicker
	cp $02
	jp z, AnimMove_3c_PhaseB
	cp $03
	jp z, AnimMove_3b_Flicker
	cp $04
	jp z, AnimMove_3c_PhaseC
	cp $05
	jp z, AnimMove_3b_Flicker
	ld a, $01
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $20
	ld [hli], a
	ld [hl], $06
	ret
AnimMove_3c_PhaseB::
	ld a, $03
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	add $20
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $06
	ret
AnimMove_3c_PhaseC::
	ld a, $05
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	add $10
	inc de
	ld [hli], a
	ld a, [de]
	add $10
	ld [hli], a
	ld [hl], $06
	ret
AnimMove_3d::
	ld a, [wd9ae]
	cp $01
	jp z, .asm_6cc0
	cp $02
	jp z, AnimMove_3c_PhaseB
	cp $03
	jp z, .asm_6cc0
	cp $04
	jp z, AnimMove_3c_PhaseC
	cp $05
	jp z, .asm_6cc0
	ld a, $01
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	add $20
	ld [hli], a
	ld [hl], $06
	ret
.asm_6cc0
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld de, wd1a0
	ld hl, $000a
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $08
	ret c
	ld [hl], $06
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $06
	ret c
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	call ClearAnimSpriteSlot
	xor a
	ld [wd9ad], a
	ret
	ld a, $03
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	add $20
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $06
	ret
	ld a, $05
	ld [wd9ae], a
	ld de, wd1a0
	ld hl, $0008
	add hl, de
	push hl
	ld de, BattleAnimData_030_6bee
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	add $10
	inc de
	ld [hli], a
	ld a, [de]
	add $10
	ld [hli], a
	ld [hl], $06
	ret
AnimMove_41::
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld bc, wd1a0
.asm_6d40
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_6d63
	inc hl
	inc [hl]
	ld a, [hl]
	ld de, BattleAnimSeq_030_6d6f
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .asm_6d5e
	ld l, c
	ld h, b
	call ClearAnimSpriteSlot
	jr .asm_6d63
.asm_6d5e
	ld hl, $0002
	add hl, bc
	ld [hl], a
.asm_6d63
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jr c, .asm_6d40
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); indexed table (index hl)
BattleAnimSeq_030_6d6f::
	db $01, $02, $03, $03, $02, $01, $ff
AnimMove_45::
	ld bc, wd1a0
.asm_6d79
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	cp $01
	jp z, .asm_6dc9
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_6de4
	ld de, BattleAnimData_030_6df1
	ld a, [wd9ae]
	cp $0a
	jr c, .asm_6d9e
	xor a
	ld [wd9ae], a
	ld [wd9ad], a
	call ClearAnimSpriteTable
	ret
.asm_6d9e
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $01
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	ret
.asm_6dc9
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_6de4
	ld hl, $0002
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $05
	jp c, .asm_6de4
	ld [hl], $00
	ld hl, $0004
	add hl, bc
	ld [hl], $00
	jr .asm_6de4
.asm_6de4
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_6d79
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); data, referenced via `ld de, BattleAnimData_030_6df1`
BattleAnimData_030_6df1::
	db $40, $60, $10, $10, $50, $70, $20, $20, $60, $58, $30, $08, $48, $88, $18, $38
	db $48, $68, $18, $20, $60, $80, $30, $30, $40, $68, $10, $18, $50, $70, $20, $20
	db $60, $80, $30, $30, $48, $88, $18, $38
AnimMove_48::
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld de, wd1a0
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $01
	jr nz, .asm_6e30
	ld [hl], $02
	jr .asm_6e32
.asm_6e30
	ld [hl], $01
.asm_6e32
	ld de, wd1a8
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $03
	jr nz, .asm_6e44
	ld [hl], $04
	jr .asm_6e46
.asm_6e44
	ld [hl], $03
.asm_6e46
	ld de, wd1b0
	ld hl, $0002
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $03
	jr nz, .asm_6e57
	ld [hl], $04
	ret
.asm_6e57
	ld [hl], $03
	ret
AnimMove_4a::
	ldh a, [hFadeFrameCounter]
	and $0f
	ret nz
	ld de, BattleAnimStepTable_030_6e94
	ld a, [wd9ae]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld bc, wd1b0
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $05
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $03
	ret c
	xor a
	ld [wd9ae], a
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd9ae
BattleAnimStepTable_030_6e94::
	db $40, $78, $10, $28, $40, $68, $10, $18, $40, $88, $10, $38
AnimMove_4b::
	ld a, [wd9ae]
	inc a
	ld [wd9ae], a
	cp $04
	ret c
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6eb9
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	add $08
	ld [hl], a
	ret
.asm_6eb9
	ld hl, wd1a0
	inc hl
	ld a, [hl]
	sub $08
	ld [hl], a
	ret
AnimMove_4e::
	ld bc, wd1a8
.asm_6ec5
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_6ed4
	cp $01
	jp z, .asm_6f13
	ret
.asm_6ed4
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .asm_6f5b
	ld de, BattleAnimRngTable_030_6f68
	call AdvanceRNG
	ld a, [wd991]
	and $07
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $03
	ld [hl], a
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ret
.asm_6f13
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_6f5b
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6f3b
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $70
	jp z, .asm_6f54
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $60
	jp z, .asm_6f54
	jp .asm_6f5b
.asm_6f3b
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $30
	jp z, .asm_6f54
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $f8
	jp z, .asm_6f54
	jp .asm_6f5b
.asm_6f54
	ld hl, $0000
	add hl, bc
	call ClearAnimSpriteSlot
.asm_6f5b
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_6ec5
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine): RNG-selected ([wd991]&7) 4B record
BattleAnimRngTable_030_6f68::
	db $30, $80, $00, $18, $30, $88, $00, $20, $30, $90, $00, $28, $30, $98, $00, $30
	db $30, $a0, $00, $38, $30, $a8, $00, $40, $30, $b0, $00, $48, $30, $b8, $00, $50
PaletteAnimFade1::
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jr z, PaletteAnimFade1_Load
PaletteAnimFade1_Apply::
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_6fa9
	xor a
	ld [wd9a0], a
	ld [wd9aa], a
.asm_6fa9
	ld de, wPaletteBuffer
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6fc0
	ld a, [wd99e]
	and a
	jr nz, .asm_6fc6
.asm_6fb8
	ld a, $38
	ld l, a
	ld h, $00
	add hl, de
	jr PaletteAnimFade1_LoadBlend
.asm_6fc0
	ld a, [wd99e]
	and a
	jr nz, .asm_6fb8
.asm_6fc6
	ld a, $30
	ld l, a
	ld h, $00
	add hl, de
	jr PaletteAnimFade1_LoadBlend
PaletteAnimFade1_Load::
	ld a, [wd99c]
	ld l, a
	ld a, [wd99d]
	ld h, a
PaletteAnimFade1_LoadBlend::
	ld b, $08
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6fea
	ld a, [wd99e]
	and a
	jr nz, .asm_6ff0
.asm_6fe4
	ld c, $b8
	call LoadPalettes_BCPD
	ret
.asm_6fea
	ld a, [wd99e]
	and a
	jr nz, .asm_6fe4
.asm_6ff0
	ld c, $b0
	call LoadPalettes_BCPD
	ret
PaletteAnimFade2::
	ld a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, PaletteAnimFade1_Apply
	ld de, wPaletteBuffer
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_701e
	ld a, [wd99e]
	and a
	jr nz, .asm_7024
.asm_7016
	ld a, $38
	ld l, a
	ld h, $00
	add hl, de
	jr .asm_702a
.asm_701e
	ld a, [wd99e]
	and a
	jr nz, .asm_7016
.asm_7024
	ld a, $30
	ld l, a
	ld h, $00
	add hl, de
.asm_702a
	ld b, $06
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_703e
	ld a, [wd99e]
	and a
	jr nz, .asm_7044
.asm_7038
	ld c, $ba
	call LoadPalettes_BCPD
	ret
.asm_703e
	ld a, [wd99e]
	and a
	jr nz, .asm_7038
.asm_7044
	ld c, $b2
	call LoadPalettes_BCPD
	ret
PaletteAnimFade3::
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, .asm_7084
	ld de, wPaletteBuffer
	ld c, $08
.asm_7060
	ld hl, $0000
	add hl, de
	xor a
	ld [hli], a
	ld [hli], a
	ld hl, $0006
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_7060
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
.asm_7084
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_7092
	xor a
	ld [wd9a0], a
.asm_7092
	ld de, wPaletteBuffer
	ld c, $08
.asm_7097
	ld hl, $0000
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	ld hl, $0006
	add hl, de
	xor a
	ld [hli], a
	ld [hli], a
	push hl
	pop de
	dec c
	jr nz, .asm_7097
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
PaletteAnimFade4::
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, .asm_70eb
	ld de, wPaletteBuffer
	ld c, $08
.asm_70cd
	ld hl, $0000
	add hl, de
	ld [hl], $80
	inc hl
	ld [hl], $7e
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_70cd
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
.asm_70eb
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_70f9
	xor a
	ld [wd9a0], a
.asm_70f9
	ld de, wPaletteBuffer
	ld c, $08
.asm_70fe
	ld hl, $0000
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_70fe
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
PaletteAnimFade5::
	ld a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd9aa
	ld a, $01
	sub [hl]
	ld [hl], a
	and a
	jp nz, .asm_7150
	ld de, wPaletteBuffer
	ld c, $08
.asm_7132
	ld hl, $0000
	add hl, de
	ld [hl], $1f
	inc hl
	ld [hl], $00
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_7132
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
.asm_7150
	ld a, [wd99f]
	dec a
	ld [wd99f], a
	and a
	jr nz, .asm_715e
	xor a
	ld [wd9a0], a
.asm_715e
	ld de, wPaletteBuffer
	ld c, $08
.asm_7163
	ld hl, $0000
	add hl, de
	ld [hl], $ff
	inc hl
	ld [hl], $7f
	inc hl
	ld hl, $0008
	add hl, de
	push hl
	pop de
	dec c
	jr nz, .asm_7163
	ld hl, wPaletteBuffer
	ld c, $80
	ld b, $40
	call LoadPalettes_BCPD
	ret
ClearAnimSpriteSlot::
	ld e, $08
	xor a
.asm_7184
	ld [hli], a
	dec e
	jr nz, .asm_7184
	ret
ClearAnimSpriteTable::
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_718f
	ld [hli], a
	dec c
	jr nz, .asm_718f
	ret
BattleAnim_SlideSpriteAcross::
	ld a, [wBattleAnimStep]
	cp $01
	jp z, .asm_71f2
	cp $02
	jp z, .asm_7202
	cp $03
	jp z, .asm_7213
	cp $04
	jp z, .asm_7226
	cp $05
	jp z, .asm_7236
	cp $06
	jp z, .asm_7247
	cp $07
	jp z, .asm_725a
	cp $08
	jp z, .asm_727e
	cp $09
	jp z, .asm_72b4
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_71dc
	ld hl, wd1a0
	ld [hl], $80
	inc hl
	ld [hl], $58
	inc hl
	ld [hl], $01
	ld a, $04
	ld [wBattleAnimStep], a
	jr .asm_71ec
.asm_71dc
	ld hl, wd1a0
	ld [hl], $80
	inc hl
	ld [hl], $08
	inc hl
	ld [hl], $01
	ld a, $01
	ld [wBattleAnimStep], a
.asm_71ec
	ld a, $29
	ld [wBattleState], a
	ret
.asm_71f2
	ld hl, wd1a0
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $d0
	ret nz
	ld a, $02
	ld [wBattleAnimStep], a
	ret
.asm_7202
	ld hl, wd1a0
	ld [hl], $d0
	inc hl
	ld [hl], $08
	inc hl
	ld [hl], $02
	ld a, $03
	ld [wBattleAnimStep], a
	ret
.asm_7213
	ld hl, wd1a0
	ld a, [hl]
	add $04
	ld [hl], a
	cp $a0
	ret nz
	jp .asm_72c6
	ld a, $07
	ld [wBattleAnimStep], a
	ret
.asm_7226
	ld hl, wd1a0
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $d0
	ret nz
	ld a, $05
	ld [wBattleAnimStep], a
	ret
.asm_7236
	ld hl, wd1a0
	ld [hl], $d0
	inc hl
	ld [hl], $58
	inc hl
	ld [hl], $02
	ld a, $06
	ld [wBattleAnimStep], a
	ret
.asm_7247
	ld hl, wd1a0
	ld a, [hl]
	add $04
	ld [hl], a
	cp $a0
	ret nz
	jp .asm_72c6
	ld a, $07
	ld [wBattleAnimStep], a
	ret
.asm_725a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_726d
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $06
	jr .asm_7278
.asm_726d
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $06
.asm_7278
	ld a, $08
	ld [wBattleAnimStep], a
	ret
.asm_727e
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $09
	ret c
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_72a3
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $03
	jr .asm_72ae
.asm_72a3
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $03
.asm_72ae
	ld a, $09
	ld [wBattleAnimStep], a
	ret
.asm_72b4
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $06
	ret c
.asm_72c6
	ld hl, wd1a0
	call ClearAnimSpriteSlot
	xor a
	ld [wBattleState], a
	ld [wd98e], a
	ld [wBattleAnimStep], a
	ret
BattleAnim_GatherToCenter::
	ld a, [wBattleAnimStep]
	cp $01
	jp z, .asm_73af
	cp $0b
	jp z, .asm_7399
	cp $6f
	jp z, .asm_7368
	cp $16
	jp z, .asm_73cb
	cp $de
	jp z, .asm_73e8
	cp $04
	jp z, .asm_74d5
	cp $2c
	jp z, .asm_74bf
	cp $2a
	jp z, .asm_748e
	cp $37
	jp z, .asm_74f3
	cp $06
	jp z, .asm_7419
	cp $07
	jp z, .asm_742d
	cp $08
	jp z, .asm_744b
	cp $09
	jp z, .asm_7468
	cp $63
	jp z, .asm_7573
	cp $62
	jp z, .asm_7590
	cp $58
	jp z, .asm_7557
	cp $4d
	jp z, .asm_7541
	cp $42
	jp z, .asm_7510
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_734f
	ld hl, wd1a0
	ld [hl], $10
	inc hl
	ld [hl], $38
	inc hl
	ld [hl], $01
	inc hl
	ld [hl], $06
	ld a, $2a
	ld [wBattleAnimStep], a
	jr .asm_7362
.asm_734f
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $05
	inc hl
	ld [hl], $06
	ld a, $6f
	ld [wBattleAnimStep], a
.asm_7362
	ld a, $2a
	ld [wBattleState], a
	ret
.asm_7368
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_737c
	ld [hl], $00
	jr .asm_737e
.asm_737c
	ld [hl], $05
.asm_737e
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $04
	ld a, $0b
	ld [wBattleAnimStep], a
	ret
.asm_7399
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $03
	ld a, $01
	ld [wBattleAnimStep], a
	ret
.asm_73af
	ld hl, wd1a0
	ld a, [hl]
	dec a
	ld [hl], a
	inc hl
	ld a, [hl]
	dec a
	ld [hl], a
	cp $30
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $16
	ld [wBattleAnimStep], a
	ret
.asm_73cb
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $01
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $de
	ld [wBattleAnimStep], a
	ret
.asm_73e8
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_73fc
	ld [hl], $00
	jr .asm_73fe
.asm_73fc
	ld [hl], $01
.asm_73fe
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $06
	ld [wBattleAnimStep], a
	ret
.asm_7419
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $03
	ld a, $07
	ld [wBattleAnimStep], a
	ret
.asm_742d
	ld hl, wd1a0
	ld a, [hl]
	inc a
	ld [hl], a
	inc hl
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	ret nz
	ld hl, wd1a0
	ld [hl], $40
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $04
	ld a, $08
	ld [wBattleAnimStep], a
	ret
.asm_744b
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $05
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $09
	ld [wBattleAnimStep], a
	ret
.asm_7468
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	cp $05
	jr z, .asm_747d
	ld [hl], $05
	jr .asm_747f
.asm_747d
	ld [hl], $06
.asm_747f
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	jp .asm_75b6
.asm_748e
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_74a2
	ld [hl], $00
	jr .asm_74a4
.asm_74a2
	ld [hl], $01
.asm_74a4
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $2c
	ld [wBattleAnimStep], a
	ret
.asm_74bf
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld [hl], $00
	inc hl
	ld [hl], $18
	inc hl
	ld [hl], $03
	ld a, $04
	ld [wBattleAnimStep], a
	ret
.asm_74d5
	ld hl, wd1a0
	ld a, [hl]
	inc a
	ld [hl], a
	inc hl
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	ret nz
	ld hl, wd1a0
	ld [hl], $48
	inc hl
	ld [hl], $68
	inc hl
	ld [hl], $04
	ld a, $37
	ld [wBattleAnimStep], a
	ret
.asm_74f3
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $05
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $42
	ld [wBattleAnimStep], a
	ret
.asm_7510
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_7524
	ld [hl], $00
	jr .asm_7526
.asm_7524
	ld [hl], $05
.asm_7526
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $04
	ld a, $4d
	ld [wBattleAnimStep], a
	ret
.asm_7541
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld [hl], $28
	inc hl
	ld [hl], $48
	inc hl
	ld [hl], $03
	ld a, $58
	ld [wBattleAnimStep], a
	ret
.asm_7557
	ld hl, wd1a0
	ld a, [hl]
	dec a
	ld [hl], a
	inc hl
	ld a, [hl]
	dec a
	ld [hl], a
	cp $30
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $02
	ld a, $63
	ld [wBattleAnimStep], a
	ret
.asm_7573
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld [hl], $01
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld [hl], $06
	ld a, $62
	ld [wBattleAnimStep], a
	ret
.asm_7590
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld hl, wd1a0
	ld bc, $0002
	add hl, bc
	ld a, [hl]
	cp $01
	jr z, .asm_75a5
	ld [hl], $01
	jr .asm_75a7
.asm_75a5
	ld [hl], $06
.asm_75a7
	ld hl, wd1a0
	ld bc, $0003
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and a
	ret nz
	jp .asm_75b6
.asm_75b6
	ld hl, wd1a0
	call ClearAnimSpriteSlot
	xor a
	ld [wBattleState], a
	ld [wd98e], a
	ld [wBattleAnimStep], a
	ret
BattleAnim_SlideSpriteOut::
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_75e9
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $e0
	jr nz, .asm_75e3
	xor a
	ld [wBattleState], a
	ld hl, wd1a0
	call ClearAnimSpriteSlot
	ret
.asm_75e3
	ld a, [hl]
	add $02
	ld [hli], a
	jr .asm_7603
.asm_75e9
	ld hl, wd1a0
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $e0
	jr nz, .asm_75ff
	xor a
	ld [wBattleState], a
	ld hl, wd1a0
	call ClearAnimSpriteSlot
	ret
.asm_75ff
	ld a, [hl]
	sub $02
	ld [hli], a
.asm_7603
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	inc [hl]
	ld a, [hl]
	cp $06
	ret c
	ld [hl], $04
	ret
BattleAnim_ConvergeSprites::
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	ld hl, wd1a0
	ld de, wd1a8
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_7633
	ld a, [de]
	add $02
	ld [de], a
	inc de
	ld a, [de]
	add $02
	ld [de], a
	inc de
	inc [hl]
	inc [hl]
	inc hl
	inc [hl]
	inc [hl]
	inc hl
	jr .asm_7643
.asm_7633
	ld a, [de]
	sub $02
	ld [de], a
	inc de
	ld a, [de]
	sub $02
	ld [de], a
	inc de
	dec [hl]
	dec [hl]
	inc hl
	dec [hl]
	dec [hl]
	inc hl
.asm_7643
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	inc [hl]
	ld a, [hl]
	cp $04
	jr c, .asm_7660
	ld [hl], $01
	inc hl
	inc [hl]
	ld a, [hl]
	cp $03
	ret c
	dec hl
	ld a, $05
	ld [hl], a
	ld [de], a
	xor a
	ld [wBattleState], a
	ret
.asm_7660
	ld a, [de]
	inc a
	ld [de], a
	cp $04
	ret c
	ld a, $01
	ld [de], a
	ret
BattleAnim_SweepPaletteFlash::
	ld de, wd1a0
.asm_766d
	ld hl, $0004
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_7684
	cp $01
	jp z, .asm_768d
	cp $02
	jp z, .asm_76ba
	cp $03
	jp z, .asm_76e4
.asm_7684
	ld hl, $0004
	add hl, de
	ld [hl], $01
	jp .asm_772e
.asm_768d
	ldh a, [hFadeFrameCounter]
	and $07
	jp nz, .asm_772e
	ld hl, $0002
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $03
	jp c, .asm_772e
	ld hl, $0004
	add hl, de
	ld [hl], $02
	ld a, $03
	ld [wd9a0], a
	ld a, $05
	ld [wd99f], a
	ld a, $01
	ld [wd9ad], a
	xor a
	ld [wd9ae], a
	jr .asm_772e
.asm_76ba
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_76d2
	ld hl, $0001
	add hl, de
	dec [hl]
	ld a, [hl]
	cp $58
	jr nz, .asm_7719
	ld hl, $0004
	add hl, de
	ld [hl], $03
	jr .asm_7719
.asm_76d2
	ld hl, $0001
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $38
	jr nz, .asm_7719
	ld hl, $0004
	add hl, de
	ld [hl], $03
	jr .asm_7719
.asm_76e4
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_76f6
	ld hl, $0001
	add hl, de
	inc [hl]
	ld a, [hl]
	cp $88
	jr nz, .asm_7719
	jr .asm_7700
.asm_76f6
	ld hl, $0001
	add hl, de
	dec [hl]
	ld a, [hl]
	cp $08
	jr nz, .asm_7719
.asm_7700
	ld hl, $0004
	add hl, de
	ld [hl], $02
	inc hl
	inc [hl]
	ld a, [hl]
	cp $01
	jr c, .asm_772e
	xor a
	ld [wBattleState], a
	ld [wd9ad], a
	ld [wd9ae], a
	jr .asm_7719
.asm_7719
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_772e
	ld hl, $0002
	add hl, de
	ld a, [hl]
	cp $03
	jr nz, .asm_772c
	ld [hl], $04
	jr .asm_772e
.asm_772c
	ld [hl], $03
.asm_772e
	ld hl, $0008
	add hl, de
	push hl
	pop de
	ld a, l
	cp $b0
	jp c, .asm_766d
	ret
BattleAnim_RandomScatterBurst::
	ld bc, wd1a0
.asm_773e
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_7752
	cp $01
	jp z, .asm_77a0
	cp $02
	jp z, .asm_77e1
	ret
.asm_7752
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, .asm_783f
	ld de, BattleAnimRngTable_030_6f68
	call AdvanceRNG
	ld a, [wd991]
	and $07
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	call AdvanceRNG
	ld a, [wd991]
	and $03
	add $01
	cp $04
	jr c, .asm_778f
	ld a, $02
.asm_778f
	ld [hl], a
	ld hl, $0004
	add hl, bc
	call AdvanceRNG
	ld a, [wd991]
	and $01
	add $01
	ld [hl], a
	ret
.asm_77a0
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_783f
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_77c8
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $70
	jp z, .asm_7822
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $60
	jp z, .asm_7822
	jp .asm_783f
.asm_77c8
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hli], a
	cp $30
	jp z, .asm_7822
	ld a, [hl]
	sub $02
	ld [hli], a
	cp $f8
	jp z, .asm_7822
	jp .asm_783f
.asm_77e1
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_783f
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_7809
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hli], a
	cp $70
	jp z, .asm_7822
	ld a, [hl]
	sub $04
	ld [hli], a
	cp $60
	jp z, .asm_7822
	jp .asm_783f
.asm_7809
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hli], a
	cp $30
	jp z, .asm_7822
	ld a, [hl]
	sub $04
	ld [hli], a
	cp $f8
	jp z, .asm_7822
	jp .asm_783f
.asm_7822
	ld hl, $0000
	add hl, bc
	call ClearAnimSpriteSlot
	ld a, [wBattleAnimStep]
	inc a
	ld [wBattleAnimStep], a
	cp $14
	jr nz, .asm_783f
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	call ClearAnimSpriteTable
	ret
.asm_783f
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jp c, .asm_773e
	ret
BattleAnim_MultiStageSweep::
	ld bc, wd1a0
.asm_784f
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_7876
	cp $01
	jp z, .asm_78b0
	cp $02
	jp z, .asm_78c5
	cp $03
	jp z, .asm_78db
	cp $04
	jp z, .asm_790e
	cp $05
	jp z, .asm_7938
	cp $06
	jp z, .asm_7953
	ret
.asm_7876
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld de, BattleAnimData_030_7981
	ld a, [wBattleAnimStep]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $01
	ld hl, $0004
	add hl, bc
	ld [hl], $01
	ld a, [wBattleAnimStep]
	inc a
	ld [wBattleAnimStep], a
	xor a
	ld [wd98c], a
	ret
.asm_78b0
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $03
	jp c, .asm_7974
	ld hl, $0004
	add hl, bc
	ld [hl], $02
	jp .asm_7974
.asm_78c5
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	sub $04
	ld [hl], a
	cp $e0
	jp nz, .asm_7974
	ld hl, $0004
	add hl, bc
	ld [hl], $03
	jp .asm_7974
.asm_78db
	ld de, BattleAnimData_030_798d
	ld a, [wd98e]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld a, [wBattleTurn]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0000
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld [hl], $09
	ld hl, $0004
	add hl, bc
	ld [hl], $04
	ld a, [wd98e]
	inc a
	ld [wd98e], a
	jp .asm_7974
.asm_790e
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_7924
	ld a, [hl]
	cp $50
	jp nz, .asm_7974
	jr .asm_792a
.asm_7924
	ld a, [hl]
	cp $20
	jp nz, .asm_7974
.asm_792a
	ld hl, $0002
	add hl, bc
	ld [hl], $04
	ld hl, $0004
	add hl, bc
	ld [hl], $05
	jr .asm_7974
.asm_7938
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_7974
	ld hl, $0002
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp $08
	jp c, .asm_7974
	ld [hl], $00
	ld hl, $0004
	add hl, bc
	ld [hl], $06
	jr .asm_7974
.asm_7953
	ldh a, [hFadeFrameCounter]
	and $03
	jr nz, .asm_7974
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	cp $0a
	jr c, .asm_7974
	xor a
	ld [wBattleAnimStep], a
	ld [wd98c], a
	ld [wd98e], a
	ld [wBattleState], a
	jp .asm_7974
.asm_7974
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $b8
	jp c, .asm_784f
	ret
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wBattleAnimStep
BattleAnimData_030_7981::
	db $30, $28, $50, $78, $30, $18, $50, $68, $30, $38, $50, $88
; battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); lookup table indexed by wd98e
BattleAnimData_030_798d::
	db $f0, $70, $f0, $20, $f0, $60, $f0, $10, $f0, $80, $f0, $30
; TODO: unk_ - battle move-anim data (bank30 MoveEffectPointers/wBattleAnimID engine); orphan (no direct reference; computed pointer or dead)
unk_030_7999::
