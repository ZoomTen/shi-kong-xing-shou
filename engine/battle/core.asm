; Battle state machine: dispatcher (BattleJumptable), battle-end, and turn handling.
ReviveFaintedPartyMons::
	ld bc, wPartyMons

.loop
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .check

.next
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, .loop
	ret

.check
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr nz, .next
	ld [hl], 0
	ld hl, 2
	add hl, bc
	ld [hl], 1
	jr .next
	ret

RefreshBattleHUD::
	ld a, 1
	ld [wd0fd], a
	xor a
	ld [wd1fc], a
	ld a, $6d
	ld [wd8fe], a
	ld a, [wd981]
	ld e, a
	ld a, [wd982]
	ld d, a
	inc de
	ld hl, $9908
	ld bc, $0102
	call PrintNumber
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld de, 3
	add hl, de
	ld de, wd1f5
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	dec de
	ld hl, $9941
	ld bc, $0203
	call PrintNumber
	call DrawPlayerHPBar
	xor a
	ld [wd9d7], a
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	call ComputeStatValue
	ld de, hMathValue
	ld hl, $9945
	ld bc, $0103
	call PrintNumber
	ld de, wd876
	inc de
	ld hl, $984b
	ld bc, $0102
	call PrintNumber
	call DrawEnemyHPBar
	ret

CalcAndApplyMoveDamage::
	call CalcMoveDamage
	call ProcessPreMoveStatusTick

AnimateDamageHPDrain::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .enemy_only

.player
	call ComputeEnemyHPBarFill
	ldh a, [hMathValue]
	and a
	jr z, .player_done
	ld [wd9bd], a
	call SubtractDamageFromHP
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputeEnemyHPBarFill
	ldh a, [hMathValue]
	ld b, a
	ld a, [wd9bd]
	sub b
	ld [wd9bc], a
	call SetDamageMagnitudeMessage
	ld a, [wd9bc]
	and a
	ret z

.player_loop
	ld a, [wd9bd]
	and a
	jp z, HandleEnemyMonFaint
	call RenderEnemyHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	dec a
	ld [wd9bd], a
	jp z, HandleEnemyMonFaint
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, .player_loop
	ret

.player_done
	jp HandleEnemyMonFaint
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ret

.enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .player

.enemy_only
	call ComputePlayerHPBarFill
	ldh a, [hMathValue]
	and a
	jp z, HandlePlayerMonFaint
	ld [wd9bd], a
	call SubtractDamageFromHP
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputePlayerHPBarFill
	ldh a, [hMathValue]
	ld b, a
	ld a, [wd9bd]
	sub b
	ld [wd9bc], a
	call SetDamageMagnitudeMessage
	ld a, [wd9bc]
	and a
	ret z

.enemy_loop
	ld a, [wd9bd]
	and a
	jp z, HandlePlayerMonFaint
	call RenderPlayerHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	dec a
	ld [wd9bd], a
	jp z, HandlePlayerMonFaint
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, .enemy_loop
	call RefreshBattleHUD
	ret
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 0
	ld hl, $14
	add hl, bc
	ld a, [hl]
	cp 1
	jp z, TriggerAutoRevive
	inc hl
	ld a, [hl]
	cp 1
	jp z, TriggerAutoRevive
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ret

AnimateHPRestore::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .enemy_only

.player
	call ComputeEnemyHPBarFill
	ldh a, [hMathValue]
	ld [wd9bd], a
	call AddHealToHP
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputeEnemyHPBarFill
	ld a, [wd9bd]
	ld b, a
	ldh a, [hMathValue]
	sub b
	inc a
	ld [wd9bc], a

.player_loop
	ld a, [wd9bd]
	call RenderEnemyHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	inc a
	ld [wd9bd], a
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, .player_loop
	ret

.enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .player

.enemy_only
	call ComputePlayerHPBarFill
	ldh a, [hMathValue]
	ld [wd9bd], a
	call AddHealToHP
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputePlayerHPBarFill
	ld a, [wd9bd]
	ld b, a
	ldh a, [hMathValue]
	sub b
	inc a
	ld [wd9bc], a

.enemy_loop
	ld a, [wd9bd]
	call RenderPlayerHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd9bd]
	inc a
	ld [wd9bd], a
	ld a, [wd9bc]
	dec a
	ld [wd9bc], a
	jr nz, .enemy_loop
	call RefreshBattleHUD
	ret

GetExpToNextLevel::
	call GetMonNextLevel
	call GetExpTableValue
	ret

DrawEnemyHPBar::
	call ComputeEnemyHPBarFill
	ldh a, [hMathValue]

RenderEnemyHPBarTiles::
	ld d, 0
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
	ld hl, $0d03
	call GetTextBGMapPointer
	push hl
	ld c, 6

.full
	call WaitVRAM_STAT
	ld a, $a1
	ld [hli], a
	dec c
	jr nz, .full
	pop hl
	ld a, e
	ld b, a
	and a
	jr z, .remainder

.empty
	call WaitVRAM_STAT
	ld a, $99
	ld [hli], a
	dec e
	jr nz, .empty

.remainder
	ld a, b
	cp 6
	ret z
	ld a, e
	and a
	jr nz, .write
	ld a, d
	and a
	jr nz, .write
	ld d, 1

.write
	ld a, $a1
	sub d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

ComputeEnemyHPBarFill::
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	ld [wd999], a
	ld a, [hl]
	ld [wd998], a
	xor a
	ld [wd9d7], a
	farcall Func_025_4101
	ld a, [hMathValue]
	ld [wd99a], a
	ld a, [hMathValue + 1]
	ld [wd99b], a
	call ComputeHPBarFraction
	ret

ComputeHPBarFraction::
	ld a, [wd998]
	ld [hMathValue], a
	ld a, [wd999]
	ld [hMathValue + 1], a
	xor a
	ld [hMathValue + 2], a
	ld a, 2
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ld a, $30
	ldh [hMathOperand], a
	farcall Multiply32By8
	ldh a, [hMathValue]
	push af
	ldh a, [hMathValue + 1]
	push af
	ldh a, [hMathValue + 2]
	push af
	ld a, [wd99a]
	ldh [hMathValue], a
	ld a, [wd99b]
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	ld a, 2
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	ldh [hMathOperand], a
	pop af
	ldh [hMathValue + 2], a
	pop af
	ldh [hMathValue + 1], a
	pop af
	ldh [hMathValue], a
	farcall Divide32By16_4Digit
	ld d, 0
	ret

DrawPlayerHPBar::
	call ComputePlayerHPBarFill
	call DelayFrame
	ldh a, [hMathValue]

RenderPlayerHPBarTiles::
	ld d, 0
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
	ld hl, $0609
	call GetTextBGMapPointer
	push hl
	ld c, 6

.full
	call WaitVRAM_STAT
	ld a, $a2
	ld [hld], a
	dec c
	jr nz, .full
	pop hl
	ld a, e
	ld b, a
	and a
	jr z, .remainder

.empty
	call WaitVRAM_STAT
	ld a, $aa
	ld [hld], a
	dec e
	jr nz, .empty

.remainder
	ld a, b
	cp 6
	ret z
	ld a, e
	and a
	jr nz, .write
	ld a, d
	and a
	jr nz, .write
	ld d, 1

.write
	ld a, $a2
	add d
	ld d, a
	call WaitVRAM_STAT
	ld a, d
	ld [hl], a
	ret

ComputePlayerHPBarFill::
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 3
	add hl, bc
	ld a, [hld]
	ld [wd999], a
	ld a, [hl]
	ld [wd998], a
	xor a
	ld [wd9d7], a
	ld a, [wd983]
	ld [wSelectedOption], a
	farcall asm_025_410d
	ld a, [hMathValue]
	ld [wd99a], a
	ld a, [hMathValue + 1]
	ld [wd99b], a
	call ComputeHPBarFraction
	ret

BattleJumptable::
	ld de, .Jumptable
	ldh a, [hBattleJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw HandleBattleIntro
	dw HandleBattleIntro
	dw HandleBattleMenu
	dw HandleBattleMoves
	dw HandleBattleTurns
	dw HandleBattleEnd


HandleBattleEnd::
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
	dw BattleEnd_Jump_1
	dw BattleEnd_Jump_2

BattleEnd_Jump_1::
	assert BANK(Script_023_55f6) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_55f6
	farcall ExecuteBattleAnimScriptAt
	call SetSideSelectForTurn
	call AccumulateEnemyReward
	ld a, [wSideSelect]
	and a
	jr z, BattleEnd_CheckPartyAlive
	ld a, [wd9dc]
	and a
	jr z, BattleEnd_PlayerLoss

BattleEnd_CheckPartyAlive::
	call BattleEnd_ScanNextLivingMon
	and a
	jr z, BattleEnd_PlayerLoss
	assert BANK(Script_023_55c5) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_55c5
	farcall ExecuteBattleAnimScriptAt
	ld a, 2
	ld [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ret

BattleEnd_PlayerLoss::
	ld a, [wSideSelect]
	and a
	jr nz, BattleEnd_Victory
	ld a, BGM_MONSTER_FAINTED
	call PlaySound
	ld a, [wEventFlags + 3]
	set 3, a
	ld [wEventFlags + 3], a
	call ReviveFaintedPartyMons
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld a, $57
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ret

BattleEnd_GameOverFade::
	ld a, 1
	ldh [hFade], a
	xor a
	ldh [hBattleJumptableIndex], a
	ld a, GAMEMODE_GAME_OVER
	ld [wTargetMode], a
	ld a, $57
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ret

BattleEnd_Victory::
	ld a, [wEventFlags + 3]
	res 3, a
	ld [wEventFlags + 3], a
	ld a, BGM_MONSTER_FAINTED
	call PlaySound
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld a, $29
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd9f5]
	and a
	jp nz, BattleEnd_RestoreMonStatBackup
	call ClampRewardValue
	ld a, $2b
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ld a, BGM_EXP_JINGLE
	call PlaySound
	ld a, [wMathScratch + 2]
	ld [wd9cf], a
	ld a, [wMathScratch + 3]
	ld [wd9ce], a
	ld a, $2c
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	call AddMoney
	xor a
	ld [wSelectedOption], a
	ld bc, wPartyMons

BattleEnd_AwardExpLoop::
	ld hl, 1
	add hl, bc
	ld a, [hl]
	cp $64
	jr nc, BattleEnd_AwardExpNext
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 6, a
	jr z, BattleEnd_AwardExpNext
	and $41
	ld [hl], a
	ld de, wd1a0
	ld a, $b
	ld l, a
	add a
	add l
	ld l, a
	ld h, 0
	add hl, de
	ld a, [wSelectedOption]
	ld [hl], a
	ld a, [wSelectedOption]
	push af
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	ld a, [bc]
	ld [wd9e5], a
	push bc
	call AddMonExp
	call CheckLevelUp
	pop bc
	pop af
	ld [wSelectedOption], a

BattleEnd_AwardExpNext::
	call DelayFrame
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
	ld a, l
	cp $80
	jr c, BattleEnd_AwardExpLoop

BattleEnd_RestoreMonStatBackup::
	ld a, [wdb1c]
	and a
	ret z
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 7
	add hl, bc
	ld b, $c
	ld de, wdcbc

CopyStatBackupBytes::
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, CopyStatBackupBytes
	xor a
	ld [wdb1c], a
	ret

ClampRewardValue::
	ld a, [wMathScratch + 1]
	cp $27
	jr z, .check_low
	jr nc, .max
	ld [wd9ce], a
	ld a, [wMathScratch]
	ld [wd9cf], a
	ret

.check_low
	ld a, [wMathScratch]
	cp $f
	jr nc, .max
	ld [wd9cf], a
	ld a, [wMathScratch + 1]
	ld [wd9ce], a
	ret

.max
	ld a, $27
	ld [wd9ce], a
	ld a, $f
	ld [wd9cf], a
	ret

; TODO: dest is wMoney (clamped to 99999, fed from PriceOptions),
; but caller plays BGM_EXP_JINGLE. money or exp?
AddMoney::
	ld hl, wMoney + 2
	ld a, [wMathScratch + 2]
	add [hl]
	ld [hld], a
	ld a, [wMathScratch + 3]
	adc [hl]
	ld [hld], a
	ld a, 0
	adc [hl]
	ld [hld], a
	call ClampMoney
	ret

AddMonExp::
	ld a, [wActiveMonPtr]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld bc, 4
	add hl, bc
	ld a, [wExpGained]
	add [hl]
	ld [hli], a
	ld a, [wMathScratch + 1]
	adc [hl]
	ld [hli], a
	ld a, 0
	adc [hl]
	ld [hli], a
	ret

ClampMoney::
	ld hl, wMoney
	ld a, [hli]
	cp 1
	ret c
	jr z, .check_mid

.clamp
	ld hl, wMoney
	ld [hl], 1
	inc hl
	ld [hl], $86
	inc hl
	ld [hl], $9f
	ret

.check_mid
	ld a, [hli]
	cp $86
	ret c
	jr z, .check_low
	jr .clamp

.check_low
	ld a, [hli]
	cp $9f
	ret c
	ret z
	jr .clamp

INCLUDE "engine/battle/exp.asm"

MathSquareByteD::
	xor a
	ldh [hMathValue + 2], a
	ldh [hMathValue + 1], a
	ld a, d
	ldh [hMathValue], a
	ldh [hMathOperand], a
	jp Multiply32By8_Preserve

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_02b_4a9b::
	db $11
	db $0
	db $0
	db $0
	db $45
	db $0
	db $0
	db $0
	db $54
	db $0
	db $0
	db $0
	db $34
	db $a
	db $0
	db $1e
	db $34
	db $14
	db $0
	db $46
	db $65
	db $8f
	db $64
	db $8c
	db $0
	db $3
	db $4
	db $8
	db $5
	db $9
	db $a
	db $9
	db $2
	db $1
	db $4
	db $8
	db $a
	db $3
	db $4
	db $1
	db $1
	db $4
	db $1
	db $6
	db $7
	db $9
	db $2
	db $8
	db $8
	db $4
	db $1
	db $3
	db $5
	db $6
	db $3
	db $1
	db $9
	db $3
	db $1
	db $2
	db $8
	db $a
	db $3
	db $4
	db $2
	db $1
	db $9
	db $8
	db $3
	db $6
	db $1
	db $9
	db $4
	db $2
	db $1
	db $1
	db $5
	db $8
	db $3
	db $9
	db $6
	db $5
	db $2
	db $6
	db $1
	db $7
	db $3
	db $4
	db $9
	db $8
	db $1
	db $9
	db $6
	db $2
	db $2
	db $3
	db $1
	db $8
	db $3
	db $9
	db $2
	db $a
	db $3
	db $2
	db $5
	db $8
	db $1
	db $a
	db $2
	db $9
	db $3
	db $9
	db $6
	db $2
	db $3
	db $7
	db $2
	db $2
	db $1
	db $3
	db $5
	db $1
	db $1
	db $6
	db $3
	db $4
	db $2
	db $9
	db $6
	db $9
	db $1
	db $3
	db $8
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $2
	db $0
	db $2
	db $1
	db $1
	db $1
	db $0
	db $1
	db $2
	db $1
	db $5
	db $0
	db $2
	db $5
	db $1
	db $4
	db $2
	db $1
	db $0
	db $3
	db $3
	db $3
	db $2
	db $5
	db $4

Multiply32By8_Preserve::
	push hl
	push bc
	push de
	farcall Multiply32By8
	pop de
	pop bc
	pop hl
	ret

Divide32By16_Preserve::
	push hl
	push de
	push bc
	farcall Divide32By16_4Digit
	pop bc
	pop de
	pop hl
	ret

SetSideSelectForTurn::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .clear
	jr .set

.enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .set

.clear
	xor a
	ld [wSideSelect], a
	ret

.set
	ld a, 1
	ld [wSideSelect], a
	ret

AccumulateEnemyReward::
	ld a, [wSideSelect]
	and a
	ret z
	ld de, wdb00
	ld a, [wd987]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, [wMathScratch]
	ld l, a
	ld a, [wMathScratch + 1]
	ld h, a
	add hl, de
	ld a, l
	ld [wMathScratch], a
	ld a, h
	ld [wMathScratch + 1], a
	pop hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wMathScratch + 2]
	ld l, a
	ld a, [wMathScratch + 3]
	ld h, a
	add hl, de
	ld a, l
	ld [wMathScratch + 2], a
	ld a, h
	ld [wMathScratch + 3], a
	ret

BattleEnd_ScanNextLivingMon::
	ld a, [wSideSelect]
	and a
	jp nz, .next_enemy
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 0
	ld a, [wdb1c]
	and a
	jr z, .scan_start
	ld hl, 7
	add hl, bc
	ld b, $c
	ld de, wdcbc

.copy_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .copy_loop

.scan_start
	xor a
	ld [wd983], a
	ld [wdb18], a
	ld bc, wPartyMons

.scan_loop
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	ld a, [bc]
	and a
	jr z, .next
	ld hl, 2
	add hl, bc
	ld a, [hl]
	inc hl
	or [hl]
	jr z, .next
	ld a, [bc]
	ld [wd9e5], a
	ld hl, $13
	add hl, bc
	ld a, [hl]
	res 4, a
	res 5, a
	ld [hl], a
	xor a
	ld [wd997], a
	ld [wd9b3], a
	ld [wd9b8], a
	ld [wd9b4], a
	ld [wd9bb], a
	ld [wd9ba], a
	ld [wd9ea], a
	ld hl, wd978
	ld c, 4
	xor a

.clear_loop
	ld [hli], a
	dec c
	jr nz, .clear_loop
	call BattleHUD_InitBars
	ret

.next
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, [wd983]
	inc a
	ld [wd983], a
	cp 6
	jr c, .scan_loop
	xor a
	ret

.next_enemy
	ld a, [wd987]
	inc a
	ld [wd987], a
	ld hl, wd876
	ld bc, $16

.find_slot
	add hl, bc
	dec a
	jr nz, .find_slot
	ld a, l
	ld [wd984], a
	ld a, h
	ld [wd985], a
	ld a, [hl]
	and a
	ret z
	ld [wEnemyMonSpecies], a
	ld hl, $13
	add hl, bc
	ld a, [hl]
	and a
	ld [hl], a
	xor a
	ld [wd996], a
	ld [wd9b9], a
	ld [wd9b4], a
	ld [wd9b3], a
	ld [wd9bb], a
	ld [wd9ba], a
	ld [wd9ea], a
	ld hl, wd97c
	ld c, 4
	xor a

.clear_enemy
	ld [hli], a
	dec c
	jr nz, .clear_enemy
	call BattleHUD_InitBars
	ret

BattleEnd_Jump_2::
	call BattleEnd_RestoreMonStatBackup
	call DelayFrame
	ld a, $80
	ldh [rLCDC], a
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	ld hl, wc000
	ld bc, $28
	ld de, 4

.fill_loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .fill_loop
	call DelayFrame
	ld a, [wd9ec]
	ldh [hSCX], a
	ld a, [wd9ed]
	ldh [hSCXHigh], a
	ld a, [wd9ee]
	ldh [hSCY], a
	ld a, [wd9ef]
	ldh [hSCYHigh], a
	xor a
	ldh [hFade], a
	ld [wBattleCounter], a
	ld [wBattleScriptByte], a
	ldh [hBattleJumptableIndex], a
	call ClearBGMap0
	call DelayFrame
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
	farcall LoadScreenAttrmap
	call DelayFrame
	call ClearBattleOAMState
	call ClearExpRewardBuffer
	ld a, 1
	ld [hFFAC], a
	ld [wdcd0], a
	xor a
	ld [wPlayerAnimFrame], a
	call UpdatePlayerAndObjectAnims
	call DelayFrame
	call ReinitOverworldObjects
	call ReviveFaintedPartyMons
	ld a, $c7
	ldh [rLCDC], a
	ld a, $1c
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld hl, wScreenRowBuffer
	ld de, wPaletteBuffer
	ld bc, $80
	call CopyBytes3
	call DelayFrame
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	call PlayMapMusic
	call RunMapLoadHook
	ret

ReinitOverworldObjects::
	ld bc, wcd20

.loop
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	ld hl, $d
	add hl, bc
	ld [hl], 1
	ld hl, 5
	add hl, bc
	ld [hl], 0
	xor a
	ld [wScriptByte], a
	push bc
	call UpdateQueuedSpriteSlot
	pop bc

.next
	ld hl, $20
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $e0
	jr c, .loop
	ret

ClearExpRewardBuffer::
	ld hl, wd1a0
	ld c, $40
	xor a

.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

HandleBattleTurns::
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
	dw BattleTurns_Jump_1
	dw BattleTurns_Jump_2
	dw BattleTurns_Jump_3
	dw BattleTurns_Jump_4
	dw BattleTurns_Jump_5
	dw BattleTurns_Jump_6
	dw BattleTurns_Jump_7
	dw BattleTurns_Jump_8
	dw BattleTurns_Jump_9
	dw BattleTurns_Jump_10

BattleTurns_Jump_10::
	call DelayFrame
	call BattleMenu_Jump_4
	call DelayFrame
	call BattleMenu_Jump_1
	call DelayFrame
	call BattleMenu_Jump_2
	call DelayFrame
	xor a
	ld [wBattleIntroJumptableIndex], a
	ret

BattleTurns_Jump_9::
	call DelayFrame
	call BattleMenu_Jump_4
	call DelayFrame
	call BattleMenu_Jump_1
	call DelayFrame
	call BattleMenu_Jump_2
	call DelayFrame
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, [wd9ea]
	cp 1
	jr nz, .check_action
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $31
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [wBattleTurn], a
	ld a, 1
	ld [wd98a], a
	ret

.check_action
	ld a, [wdcaf]
	and a
	ret z
	xor a
	ld [wdcaf], a
	ld a, 1
	ld [wBattleTurn], a
	ld a, 1
	ld [wd98a], a
	ld a, 3
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wMoveTargetsEnemy], a
	ld [wBattleAnimStep], a
	ret

BattleTurns_Jump_1::
	call ClearVirtualOAM
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
	ld bc, $0480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld de, Battle_EnemyFace_BGMap
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Battle_EnemyFace_AttrMap
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld de, Battle_Panel10x4_BGMap
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Battle_Panel10x4_AttrMap
	ld hl, $98e0
	ld bc, $0a04
	ld a, $a
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	call RefreshBattleHUD
	ld de, Battle_HUD_BGMap
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

BattleTurns_Jump_2::
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [wd98a], a
	ld a, [wd9e3]
	cp $1f
	jr z, .enemy
	cp $20
	jr z, .enemy
	ld a, [wd9e2]
	cp $1f
	jr z, .player
	cp $20
	jr z, .player
	jr .ai

.enemy
	ld a, 1
	ld [wBattleTurn], a
	jr .done

.player
	xor a
	ld [wBattleTurn], a
	jr .done

.ai
	ld a, [wd983]
	ld [wSelectedOption], a
	ld a, 3
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hMathValue]
	ld [wd0c1], a
	ld a, 3
	ld [wd9d7], a
	farcall Func_025_4101
	ld a, 1
	ld [wBattleTurn], a
	ld a, [wd9ea]
	cp 2
	jr z, .done
	ldh a, [hMathValue]
	ld b, a
	ld a, [wd0c1]
	cp b
	jr nc, .done
	xor a
	ld [wBattleTurn], a

.done
	call CheckStatusPreMove
	ld a, [wBattleIntroJumptableIndex]
	cp 2
	ret nz
	call CheckPostTurnTrigger
	ret

CheckPostTurnTrigger::
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wd9b4]
	and a
	ret z
	jr .trigger

.enemy
	ld a, [wd9b3]
	and a
	ret z

.trigger
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $3f
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ld a, [wBattleTurn]
	and a
	jr nz, .clear_enemy
	xor a
	ld [wd9b4], a
	jr .finish

.clear_enemy
	xor a
	ld [wd9b3], a

.finish
	xor a
	ld [wSideSelect], a
	ld a, 5
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

CheckStatusPreMove::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr .dispatch

.enemy
	ld a, [wd9f6]
	and a
	ret nz
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a

.dispatch
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 1, a
	jp nz, ProcessStatusBit1
	bit 4, a
	jp nz, ProcessStatusBit4
	bit 5, a
	jp nz, ProcessStatusBit5
	bit 7, a
	jp nz, ProcessStatusBit7
	ret

ProcessDamageStatus::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr .dispatch

.enemy
	ld a, [wd9f6]
	and a
	ret nz
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a

.dispatch
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 0, a
	jp nz, ProcessStatusBit0
	ret

CheckStatusPostMove::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	jr .dispatch

.enemy
	ld a, [wd9f6]
	and a
	ret nz
	ld a, [wd9ea]
	and a
	ret nz
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a

.dispatch
	ld hl, $13
	add hl, bc
	ld a, [hl]
	bit 1, a
	jp nz, ProcessStatusBit1
	bit 2, a
	jp nz, ProcessStatusBit2
	bit 3, a
	jp nz, ProcessStatusBit3
	bit 4, a
	jp nz, ProcessStatusBit4
	bit 5, a
	jp nz, ProcessStatusBit5
	bit 7, a
	jp nz, ProcessStatusBit7
	ret

ProcessStatusBit2::
	xor a
	ld [wMoveTargetsEnemy], a
	xor a
	ld [wd9d7], a
	farcall ComputeBattlerStat
	ld a, $19
	ld [wBattleMessageID], a
	jr ApplyStatusDamageTick

ProcessStatusBit3::
	ld a, $18
	ld [wBattleMessageID], a

ApplyStatusDamageTick::
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	xor a
	ldh [hMathValue + 2], a
	ld a, $a
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, CommitStatusDamageHP
	ldh a, [hMathValue]
	and a
	jr nz, CommitStatusDamageHP
	ld a, 1

CommitStatusDamageHP::
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	call AnimateDamageHPDrain
	ret

ProcessStatusBit1::
	call AdvanceRNG
	ld a, [wd991]
	and 3
	jr nz, .recover
	ld a, $1e
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ret

.recover
	ld a, [hl]
	res 1, a
	ld [hl], a
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $1e
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wSideSelect], a
	ld a, 5
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

ProcessStatusBit0::
	xor a
	ld [wSideSelect], a
	ld [wMoveTargetsEnemy], a
	ld a, 2
	ld [wd9af], a
	call GetStatByte
	ldh [hMathValue], a
	ld a, 3
	ld [wd9af], a
	call GetStatByte
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	ld a, $f
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	and a
	jr nz, .got_value
	ld a, 1

.got_value
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	ld de, wd9ba
	ld a, [wBattleTurn]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, .play
	ld a, 2
	ldh [hMathOperand], a
	ldh [hMathValue], a
	farcall Multiply32By8
	ldh a, [hMathValue]
	ld [wd9b0], a

.play
	call AnimateDamageHPDrain
	ld a, $1a
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ret

ProcessStatusBit4::
	call AdvanceRNG
	ld a, [wd991]
	and 3
	jr z, .recover
	xor a
	ld [wMoveTargetsEnemy], a
	ld a, $25
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	ret

.recover
	ld a, [hl]
	res 4, a
	ld [hl], a
	ld a, $26
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wSideSelect], a
	ld [wMoveTargetsEnemy], a
	ld a, 5
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

ProcessStatusBit5::
	call AdvanceRNG
	ld a, [wd991]
	and 3
	jr z, .recover
	call AdvanceRNG
	ld a, [wd991]
	and 1
	push af
	ld de, wd996
	ld a, [wBattleTurn]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop af
	ld [hl], a
	ret

.recover
	ld a, [hl]
	res 5, a
	ld [hl], a
	ld de, wd996
	ld a, [wBattleTurn]
	ld l, a
	ld h, 0
	add hl, de
	ld [hl], 0
	ret

ProcessStatusBit7::
	ld a, [wBattleTurn]
	and a
	jr z, .enemy
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	jr .got_actor

.enemy
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a

.got_actor
	ld hl, $13
	add hl, bc
	ld a, [hl]
	res 7, a
	ld [hl], a
	ld a, $24
	ld [wBattleMessageID], a
	ld a, 6
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wMoveTargetsEnemy], a
	ret

BattleTurns_Jump_3::
	call BattleAI_ChooseAction
	ld de, wd9f5
	ld a, [wBattleTurn]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, .status
	cp 1
	jr z, .flee
	ld a, $4f
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	ld a, 5
	ldh [hBattleJumptableIndex], a
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ret

.flee
	ld a, $50
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call BattleTurn_AdvanceToNextActor
	ret

.status
	ld de, wd996
	ld a, [wBattleTurn]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, .check_swap
	ld a, $23
	ld [wBattleMessageID], a
	ld de, wd9e2
	ld a, [wBattleTurn]
	ld l, a
	ld h, 0
	add hl, de
	ld [hl], $8d
	jr .commit

.check_swap
	ld a, [wd9ea]
	cp 2
	jr nz, .random
	ld a, [wBattleTurn]
	and a
	jr z, .random
	ld a, $30
	ld [wBattleMessageID], a
	jr .commit

.random
	call AdvanceRNG
	ld a, [wd991]
	and 3
	add $a
	ld [wBattleMessageID], a

.commit
	xor a
	ld [wMoveTargetsEnemy], a
	farcall ShowBattleMessage
	ld a, 3
	ld [wBattleIntroJumptableIndex], a
	ret

BattleTurns_Jump_8::
	farcall ShowBattleMessage
	call DelayFrame
	ld a, [wBattleScriptPos]
	ld e, a
	ld a, [wBattleScriptPos + 1]
	ld d, a
	farcall ExecuteBattleAnimScriptAt
	ld a, 4
	ld [wBattleIntroJumptableIndex], a
	ret

BattleTurns_Jump_4::
	xor a
	ld [wBattleState], a
	farcall ExecuteBattleAnimScript
	ld a, [hBattleJumptableIndex]
	cp 5
	ret z
	ld a, 4
	ld [wBattleIntroJumptableIndex], a
	ret

BattleAI_ChooseAction::
	ld a, [wBattleTurn]
	and a
	ret nz
	ld a, [wd9b9]
	and a
	jr nz, BattleAI_Dispatch
	ld a, 5
	ld [wd9af], a
	xor a
	ld [wSideSelect], a
	call GetStatTile
	and a
	ret nz

BattleAI_Dispatch::
	ld de, BattleAI_ActionIndex
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld l, [hl]
	ld h, 0
	add hl, de
	ld l, [hl]
	ld h, 0
	ld de, .Jumptable
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
	ret

.Jumptable:
	dw BattleAI_Action0
	dw BattleAI_Action0
	dw BattleAI_Action2
	dw BattleAI_Action3
	dw BattleAI_Action4
	dw BattleAI_Action5
	dw BattleAI_Action6
	dw BattleAI_Action7
	dw BattleAI_Action8
	dw BattleAI_Action9
	dw BattleAI_Action10

BattleAI_Action0::
	call AdvanceRNG
	ld a, [wd991]
	cp $cc
	jp nc, BattleAI_Action3
	call AdvanceRNG
	ld a, [wd991]
	and 1
	inc a
	ld [wd9f5], a
	ret

BattleAI_Action2::
	call ComputeEnemyMonStat
	ld a, [wd99a]
	ldh [hMathValue], a
	ld a, [wd99b]
	ldh [hMathValue + 1], a
	ld a, 2
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $a
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	ld b, a
	ld a, [wd999]
	cp b
	jr z, .check_low
	jp nc, BattleAI_PickRandomMove

.check_low
	ldh a, [hMathValue]
	ld b, a
	ld a, [wd998]
	cp b
	jp nc, BattleAI_PickRandomMove
	ld a, 3
	jr BattleAI_SelectMoveSlot

BattleAI_PickRandomMove::
	call AdvanceRNG
	ld a, [wd991]
	and 3
	cp 3
	jp z, BattleAI_PickRandomMove
	jr BattleAI_SelectMoveSlot

BattleAI_PickRandomMove01::
	call AdvanceRNG
	ld a, [wd991]
	and 1
	jr BattleAI_SelectMoveSlot

BattleAI_Action3::
	call AdvanceRNG
	ld a, [wd991]
	and 3

BattleAI_SelectMoveSlot::
	ld e, a
	add a
	add e
	ld e, a
	ld d, 0
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	ld bc, 7
	add hl, bc
	add hl, de
	ld a, [hli]
	and a
	jr z, BattleAI_Action3
	ld [wd9e2], a
	cp $7b
	jr nz, .check_7a
	ld a, [wd9b9]
	and a
	jr z, BattleAI_Action3

.check_7a
	cp $7a
	jr z, .force_7b

.force_7b
	ld a, [wd9b9]
	and a
	ret z
	ld a, $7b
	ld [wd9e2], a
	ret

BattleAI_Action4::
	call AdvanceRNG
	ld a, [wd991]
	and 1
	jp z, BattleAI_PickRandomMove
	ld a, 3
	jp BattleAI_SelectMoveSlot

BattleAI_Action5::
	call ComputeEnemyMonStat
	ld a, [wd99a]
	ldh [hMathValue], a
	ld a, [wd99b]
	ldh [hMathValue + 1], a
	ld a, 5
	ldh [hMathOperand], a
	farcall Multiply32By8

BattleAI_EvalHPThreshold::
	ld a, $a
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	ld b, a
	ld a, [wd999]
	cp b
	jr z, .check_low
	jp nc, BattleAI_PickRandomMove

.check_low
	ldh a, [hMathValue]
	ld b, a
	ld a, [wd998]
	cp b
	jp nc, BattleAI_PickRandomMove
	call AdvanceRNG
	ld a, [hMathValue]
	cp $80
	jp nc, BattleAI_PickRandomMove
	ld a, 3
	jp BattleAI_SelectMoveSlot

BattleAI_Action6::
	call ComputeEnemyMonStat
	ld a, [wd99a]
	ldh [hMathValue], a
	ld a, [wd99b]
	ldh [hMathValue + 1], a
	ld a, 3
	ldh [hMathOperand], a
	farcall Multiply32By8
	jp BattleAI_EvalHPThreshold

BattleAI_Action7::
	call AdvanceRNG
	cp $cc
	jp nc, BattleAI_PickRandomMove01
	call AdvanceRNG
	ld a, [wd991]
	and 1
	add 2
	jp BattleAI_SelectMoveSlot

BattleAI_Action8::
	call AdvanceRNG
	cp $80
	jp nc, BattleAI_PickRandomMove
	ld a, 3
	jp BattleAI_SelectMoveSlot

BattleAI_Action9::
	call ComputeEnemyMonStat
	ld a, [wd99a]
	ldh [hMathValue], a
	ld a, [wd99b]
	ldh [hMathValue + 1], a
	ld a, 3
	ldh [hMathOperand], a
	farcall Multiply32By8
	jp BattleAI_EvalHPThreshold

BattleAI_Action10::
	ld a, [wd9f7]
	and a
	jr nz, .has_flag
	xor a
	jp BattleAI_SelectMoveSlot

.has_flag
	call AdvanceRNG
	ld a, [wd991]
	and 1
	inc a
	ld [wd9f5], a
	ret

; TODO: confirm. Monster state byte -> BattleAI_Dispatch jumptable index.
BattleAI_ActionIndex::
	db $0
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3
	db $3

GFX_02b_54c7:: INCBIN "gfx/battle/image_2b_54c7.2bpp"

BattleTurns_Jump_5::
	ld hl, GFX_02b_54c7
	ld de, $8680
	ld bc, $80
	call CopyBytesVRAM
	farcall ExecuteMoveEffect

BattleTurns_Jump_7::
	ld a, [wBattleAnimStep]
	and a
	jr nz, EndBattleTurn

BattleTurn_PostMoveSequence::
	farcall ShowBattleMessage
	call Wait32Frames
	call ProcessEndTurnStatusTick
	ldh a, [hBattleJumptableIndex]
	cp 5
	ret z
	call ApplyPostMoveStatEffects
	ldh a, [hBattleJumptableIndex]
	cp 5
	ret z

BattleTurn_AdvanceToNextActor::
	ld a, [wd98a]
	cp 2
	jr z, ReturnToBattleMenu
	inc a
	ld [wd98a], a
	call ProcessDamageStatus
	ld a, [hBattleJumptableIndex]
	cp 5
	ret z
	ld hl, wBattleTurn
	ld a, 1
	sub [hl]
	ld [hl], a
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	xor a
	ld [wd98e], a
	call CheckStatusPostMove
	ld a, [wBattleIntroJumptableIndex]
	cp 2
	ret nz
	call CheckPostTurnTrigger
	ret

ReturnToBattleMenu::
	call ProcessDamageStatus
	ld a, [hBattleJumptableIndex]
	cp 5
	ret z
	xor a
	ld [wd98a], a
	ld [wd98e], a
	ld [wd9ea], a
	ld [wBattleIntroJumptableIndex], a
	ld a, 2
	ld [hBattleJumptableIndex], a
	ret

EndBattleTurn::
	ld a, 5
	ld [wBattleIntroJumptableIndex], a
	ret

Wait32Frames::
	ld c, 32
.delay
	call DelayFrame
	dec c
	jr nz, .delay
	ret

BattleTurns_Jump_6::
	ld a, [wBattleAnimStep]
	cp 1
	jp z, BattleStep_ScriptedFlee
	cp 2
	jp z, BattleStep_CalcDamage
	cp 3
	jp z, ApplyMoveDamageToTarget
	cp 4
	jp z, AnimateHealEffect
	cp 5
	jp z, BattleStep_FinishWithMessage
	cp 6
	jr z, BattleStep_SetEscapeFlag
	jp ReturnToBattleMenu


BattleStep_SetEscapeFlag::
	ld a, 2
	ld [wd9f6], a
	ld a, [wd993]
	and a
	jr nz, .commit
	ld a, 1
	ld [wd9f6], a

.commit
	ld a, 4
	ldh [hBattleJumptableIndex], a
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	ret

BattleStep_FinishWithMessage::
	farcall ShowBattleMessage
	call Wait32Frames
	xor a
	ld [wBattleIntroJumptableIndex], a
	ld a, 1
	ld [wMoveTargetsEnemy], a
	ld a, 5
	ldh [hBattleJumptableIndex], a
	ret

BattleStep_ScriptedFlee::
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_5809) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_5809
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, 1
	ld [wMoveTargetsEnemy], a
	ld a, $1b
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	jp ReturnToBattleMenu


CalcMoveDamage::
	ld a, [wd9c7]
	and a
	jr nz, ComputeMoveDamage
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ret

ComputeMoveDamage::
	call ComputeDamageStats
	ld hl, wAttackerStatHi
	ld a, [wDefenderStatHi]
	cp [hl]
	jr c, .compute
	dec hl
	ld a, [wDefenderStatLo]
	cp [hl]
	jr c, .compute
	call ComputeMoveDamage_Alt
	jr .store

.compute
	call GetMovePower
	ldh [hMathOperand], a
	ld a, [wAttackerStatLo]
	ldh [hMathValue], a
	ld a, [wAttackerStatHi]
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	farcall Multiply32By8
	ld a, $64
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	call GetStatStageDamageMultiplier
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $64
	ld [hMathOperand], a
	farcall Divide32By16_4Digit
	ld a, [wd9c7]
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $a
	ld [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	push af
	ldh a, [hMathValue + 1]
	push af
	call GetStatDeltaDamageFactor
	ldh [hMathOperand], a
	pop af
	ldh [hMathValue + 1], a
	pop af
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 2], a
	farcall Multiply32By8
	ld a, $64
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit

.store
	ldh a, [hMathValue + 1]
	ld [wd9b1], a
	and a
	jr z, .low_byte
	ld a, $ff
	ldh [hMathValue], a
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	call ApplyCriticalHit
	ret

.low_byte
	ldh a, [hMathValue]
	ld [wd9b0], a
	and a
	jr nz, .nonzero
	ld a, 1
	ld [wd9b0], a
	ret

.nonzero
	call ApplyCriticalHit
	ret

ApplyCriticalHit::
	ld a, [wBattleAnimID]
	cp 4
	ret z
	call AdvanceRNG
	xor a
	ld [wSideSelect], a
	ld a, 9
	ld [wd9af], a
	call GetStatTile
	cp $a
	jr z, .max_grade
	ld a, [wd991]
	cp $26
	jr c, .crit
	ret

.max_grade
	ld a, [wd991]
	cp $c
	ret nc

.crit
	ld a, $27
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ld a, [wd9b0]
	ldh [hMathValue], a
	ld a, [wd9b1]
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	ld a, $f
	ld [hMathOperand], a
	farcall Multiply32By8
	ld a, $a
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	ld [wd9b0], a
	ldh a, [hMathValue + 1]
	ld [wd9b1], a
	ld a, $14
	ld [wBattleMessageID], a
	ret

SetEffectivenessIndicator::
	ld a, [wBattleMessageID]
	and a
	ret nz
	ld a, [wd9c7]
	and a
	jr z, .grade0
	cp $14
	jr z, .grade14
	cp $f
	jr z, .grade0f
	cp 5
	jr z, .grade5
	cp 2
	jr z, .grade2
	cp $a
	jr z, .grade0a

.grade0
	ld a, $13
	ld [wBattleMessageID], a
	ret

.grade14
	ld a, $14
	ld [wBattleMessageID], a
	ret

.grade0f
	ld a, $15
	ld [wBattleMessageID], a
	ret

.grade5
	ld a, $16
	ld [wBattleMessageID], a
	ret

.grade2
	ld a, $17
	ld [wBattleMessageID], a
	ret

.grade0a
	ld a, $35
	ld [wBattleMessageID], a
	ret

GetStatDeltaDamageFactor::
	ld a, [wDefenderStatLo]
	ld c, a
	ld a, [wDefenderStatHi]
	ld b, a
	ld a, [wAttackerStatLo]
	sub c
	ld l, a
	ldh [hMathValue], a
	ld a, [wAttackerStatHi]
	sbc b
	ld h, a
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	ld de, StatValueToGrade - 1
	xor a
	ld [wSideSelect], a
	ld a, 1
	ld [wd9af], a
	call GetStatByte
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .min
	ldh a, [hMathValue]
	cp $14
	jr nc, .min
	ld de, StatDeltaToValue
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ret

.min
	ld a, 5
	ret

; TODO: confirm. Indexed by stat delta (< $14); descending values.
StatDeltaToValue::
	db $5a
	db $55
	db $50
	db $4b
	db $3c
	db $37
	db $32
	db $2d
	db $28
	db $23
	db $1e
	db $19
	db $14
	db $f
	db $f
	db $f
	db $f
	db $f
	db $f
	db $f
	db $0

; TODO: confirm. 1-based index -> grade tier (groups of 5, $2..$15).
StatValueToGrade::
	db $2
	db $2
	db $2
	db $2
	db $2
	db $3
	db $3
	db $3
	db $3
	db $3
	db $4
	db $4
	db $4
	db $4
	db $4
	db $5
	db $5
	db $5
	db $5
	db $5
	db $6
	db $6
	db $6
	db $6
	db $6
	db $7
	db $7
	db $7
	db $7
	db $7
	db $8
	db $8
	db $8
	db $8
	db $8
	db $9
	db $9
	db $9
	db $9
	db $9
	db $a
	db $a
	db $a
	db $a
	db $a
	db $b
	db $b
	db $b
	db $b
	db $b
	db $c
	db $c
	db $c
	db $c
	db $c
	db $d
	db $d
	db $d
	db $d
	db $d
	db $e
	db $e
	db $e
	db $e
	db $e
	db $f
	db $f
	db $f
	db $f
	db $f
	db $10
	db $10
	db $10
	db $10
	db $10
	db $11
	db $11
	db $11
	db $11
	db $11
	db $12
	db $12
	db $12
	db $12
	db $12
	db $13
	db $13
	db $13
	db $13
	db $13
	db $14
	db $14
	db $14
	db $14
	db $14
	db $15
	db $15
	db $15
	db $15
	db $15

ComputeMoveDamage_Alt::
	call GetMovePower
	ldh [hMathOperand], a
	ld a, [wDefenderStatLo]
	ldh [hMathValue], a
	ld a, [wDefenderStatHi]
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	farcall Multiply32By8
	ld a, $64
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	ld c, a
	ldh a, [hMathValue + 1]
	ld b, a
	ld a, [wDefenderStatLo]
	ld l, a
	ld a, [wDefenderStatHi]
	ld h, a
	add hl, bc
	ld a, [wAttackerStatLo]
	ld c, a
	ld a, [wAttackerStatHi]
	ld b, a
	ld a, l
	sub c
	ldh [hMathValue], a
	ld a, h
	sbc b
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	ld a, [wd9c7]
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $a
	ld [hMathOperand], a
	farcall Divide32By16_4Digit
	ret

GetStatStageDamageMultiplier::
	ld a, 1
	ld [wSideSelect], a
	ld [wd9af], a
	call GetStatByte
	ld c, a
	xor a
	ld [wSideSelect], a
	ld a, 1
	ld [wd9af], a
	call GetStatByte
	cp c
	jr c, .descending
	sub c
	ld de, DamageStageMultiplier_Up + $a
	jr .clamp

.descending
	ld b, a
	ld a, c
	sub b
	ld de, DamageStageMultiplier_Down

.clamp
	cp $14
	jr c, .lookup
	ld a, $14

.lookup
	ld l, a
	ld h, 0
	add hl, de
	
	ld a, [hl]
	
	ret

GetMovePower::
	ld de, MovePower
	ld a, [wBattleAnimID]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ret

ComputeDamageStats::
	xor a
	ld [wSideSelect], a
	ld a, 1
	ld [wd9d7], a
	farcall ComputeBattlerStat
	xor a
	ld [wd9af], a
	ld [wSideSelect], a
	ldh [hMathValue + 2], a
	call GetStatTile
	ldh [hMathOperand], a
	call ApplyDefenderElementBonus
	call ApplyAttackerElementPenalty
	farcall Multiply32By8
	ld a, $a
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	ld [wDefenderStatLo], a
	ldh a, [hMathValue + 1]
	ld [wDefenderStatHi], a
	ld a, 2
	ld [wSideSelect], a
	ld a, 2
	ld a, 5
	ld [wd9d7], a
	farcall ComputeBattlerStat
	ld a, 1
	ld [wd9af], a
	ld [wSideSelect], a
	xor a
	ldh [hMathValue + 2], a
	call GetStatTile
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $a
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	ld [wAttackerStatLo], a
	ldh a, [hMathValue + 1]
	ld [wAttackerStatHi], a
	ret

ApplyAttackerElementPenalty::
	ld a, [wBattleTurn]
	and a
	jr z, .player
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr .got_actor

.player
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

.got_actor
	ld bc, $14
	add hl, bc
	ld a, [hl]
	cp $a
	jr c, .second
	cp $10
	jr nc, .second
	jr .match

.second
	inc hl
	ld a, [hl]
	cp $a
	ret c
	cp $10
	ret nc

.match
	ld [wd9e9], a
	ld de, StatTypeRemap
	sub $a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [wd8ff]
	cp [hl]
	ret nz
	ldh a, [hMathOperand]
	sub 5
	ldh [hMathOperand], a
	ret

ApplyDefenderElementBonus::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr .got_actor

.enemy
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

.got_actor
	ld bc, $14
	add hl, bc
	ld a, [hl]
	cp 3
	jr c, .second
	cp $a
	jr nc, .second
	jr .match

.second
	inc hl
	cp 3
	ret c
	cp $a
	ret nc

.match
	ld [wd9e9], a
	cp 9
	jr z, .bonus
	ld de, StatTypeRemap
	sub 3
	ld l, a
	ld h, 0
	add hl, de
	ld a, [wd8ff]
	cp [hl]
	ret nz

.bonus
	ldh a, [hMathOperand]
	add 3
	ldh [hMathOperand], a
	ret

; TODO: confirm. 7-entry index remap.
StatTypeRemap::
	db $3
	db $2
	db $5
	db $1
	db $4
	db $6
	db $0

BattleStep_CalcDamage::
	xor a
	ld [wBattleAnimStep], a
	call CalcMoveDamage

ApplyMoveDamageToTarget::
	call ProcessPreMoveStatusTick
	xor a
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jp nz, ApplyDamage_PlayerTurn
	ld a, [wMoveTargetsEnemy]
	and a
	jp nz, DrainPlayerHPBar

DrainEnemyHPBar::
	call ComputeEnemyHPBarFill
	ldh a, [hMathValue]
	and a
	jr z, HandleEnemyMonFaint
	ld [wd98c], a
	call SubtractDamageFromHP
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputeEnemyHPBarFill
	ldh a, [hMathValue]
	ld b, a
	ld a, [wd98c]
	sub b
	ld [wd98e], a
	call SetDamageMagnitudeMessage
	ld a, [wd98e]
	and a
	jp z, BattleStep_AfterDamage

DrainEnemyHPBarLoop::
	ld a, [wd98c]
	call RenderEnemyHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	dec a
	ld [wd98c], a
	and a
	jr z, HandleEnemyMonFaint
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, DrainEnemyHPBarLoop
	call RefreshBattleHUD
	jp BattleStep_AfterDamage

HandleEnemyMonFaint::
	ld a, [wd984]
	ld l, a
	ld a, [wd985]
	ld h, a
	jr MarkMonFainted

HandlePlayerMonFaint::
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a

MarkMonFainted::
	push hl
	pop bc
	ld hl, 2
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 0
	ld hl, $14
	add hl, bc
	ld a, [hl]
	cp 1
	jr z, TriggerAutoRevive
	inc hl
	ld a, [hl]
	cp 1
	jr z, TriggerAutoRevive
	ld hl, $13
	add hl, bc
	ld a, $bf
	ld [hl], a
	ld a, 5
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	ret

TriggerAutoRevive::
	ld [wd9e9], a
	ld [hl], 0
	call ReviveMonWithMessage
	ret
	jp BattleTurn_PostMoveSequence

ApplyDamage_PlayerTurn::
	ld a, [wMoveTargetsEnemy]
	and a
	jp nz, DrainEnemyHPBar

DrainPlayerHPBar::
	call ComputePlayerHPBarFill
	ldh a, [hMathValue]
	and a
	jr z, HandlePlayerMonFaint
	ld [wd98c], a
	call SubtractDamageFromHP
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputePlayerHPBarFill
	ldh a, [hMathValue]
	ld b, a
	ld a, [wd98c]
	sub b
	ld [wd98e], a
	call SetDamageMagnitudeMessage
	ld a, [wd98e]
	and a
	jp z, BattleStep_AfterDamage

DrainPlayerHPBarLoop::
	ld a, [wd98c]
	call RenderPlayerHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	dec a
	ld [wd98c], a
	and a
	jp z, HandlePlayerMonFaint
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, DrainPlayerHPBarLoop
	call RefreshBattleHUD

BattleStep_AfterDamage::
	call BattleTurn_PostMoveSequence
	ret

SubtractDamageFromHP::
	ld a, [wd9b0]
	ld c, a
	ld a, [wd9b1]
	ld b, a
	ld a, [wd999]
	cp b
	jr z, .check_low
	jr nc, ComputeHPAfterDamage
	jr .clamp

.check_low
	ld a, [wd998]
	cp c
	jr nc, ComputeHPAfterDamage

.clamp
	ld a, [wd998]
	ld [wd9b0], a
	ld a, [wd999]
	ld [wd9b1], a
	ld de, 0
	ret

ComputeHPAfterDamage::
	ld a, [wd998]
	sub c
	ld e, a
	ld a, [wd999]
	sbc b
	ld d, a
	ret

SetDamageMagnitudeMessage::
	ld a, [wd9c7]
	and a
	jr z, .none
	ld a, [wd98e]
	cp $28
	jr nc, .dmg28
	cp $1e
	jr nc, .dmg1e
	cp $14
	jr nc, .dmg14
	cp $a
	jr nc, .dmg0a
	cp 5
	jr nc, .dmg05
	ld a, $17
	ld [wBattleMessageID], a
	ret

.none
	ld a, $13
	ld [wBattleMessageID], a
	ret

.dmg05
	ld a, $16
	ld [wBattleMessageID], a
	ret

.dmg0a
	ld a, $35
	ld [wBattleMessageID], a
	ret

.dmg14
	ld a, $34
	ld [wBattleMessageID], a
	ret

.dmg1e
	ld a, $15
	ld [wBattleMessageID], a
	ret

.dmg28
	ld a, $14
	ld [wBattleMessageID], a
	ret

ReviveMonWithMessage::
	ld a, $2e
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	ld a, [wd99a]
	ld [wd9b0], a
	ld a, [wd99b]
	ld [wd9b1], a
	call HalveHPValue
	ld a, 1
	ld [wMoveTargetsEnemy], a
	call AnimateHPRestore
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $2f
	ld [wBattleMessageID], a
	ret

AnimateHealEffect::
	xor a
	ld [wBattleAnimStep], a
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .enemy_only

.player
	call ComputeEnemyHPBarFill
	ldh a, [hMathValue]
	ld [wd98c], a
	call AddHealToHP
	ld a, [wd984]
	ld c, a
	ld a, [wd985]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputeEnemyHPBarFill
	ld a, [wd98c]
	ld b, a
	ldh a, [hMathValue]
	sub b
	inc a
	ld [wd98e], a

.player_loop
	ld a, [wd98c]
	call RenderEnemyHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, .player_loop
	jp BattleStep_AfterDamage

.enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .player

.enemy_only
	call ComputePlayerHPBarFill
	ldh a, [hMathValue]
	ld [wd98c], a
	call AddHealToHP
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, 2
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	call ComputePlayerHPBarFill
	ld a, [wd98c]
	ld b, a
	ldh a, [hMathValue]
	sub b
	inc a
	ld [wd98e], a

.enemy_loop
	ld a, [wd98c]
	call RenderPlayerHPBarTiles
	call DelayFrame
	call DelayFrame
	ld a, [wd98c]
	inc a
	ld [wd98c], a
	ld a, [wd98e]
	dec a
	ld [wd98e], a
	jr nz, .enemy_loop
	call RefreshBattleHUD
	jp BattleStep_AfterDamage

AddHealToHP::
	ld a, [wd9b0]
	ld c, a
	ld a, [wd9b1]
	ld b, a
	ld a, [wd998]
	ld l, a
	ld a, [wd999]
	ld h, a
	add hl, bc
	ld e, l
	ld d, h
	ld a, [wd99b]
	cp d
	jr c, .clamp
	jr z, .check_low
	jr nc, HealHPDone

.check_low
	ld a, [wd99a]
	cp e
	jr nc, HealHPDone

.clamp
	ld a, [wd99a]
	ld e, a
	ld a, [wd99b]
	ld d, a

HealHPDone::
	ret

ApplyPostMoveStatEffects::
	ld a, [wBattleTurn]
	and a
	jr z, .player
	call ComputePlayerHPBarFill
	ld a, [wd981]
	ld l, a
	ld [wd3f0], a
	ld a, [wd982]
	ld h, a
	ld [wd3f1], a
	jr .got_actor

.player
	call ComputeEnemyHPBarFill
	ld a, [wd984]
	ld l, a
	ld [wd3f0], a
	ld a, [wd985]
	ld h, a
	ld [wd3f1], a

.got_actor
	xor a
	ld [wMoveTargetsEnemy], a
	ld bc, $14
	add hl, bc
	ld a, [hl]
	cp 2
	call z, ApplyLeechDrainEffect
	cp $12
	call z, ApplyStatHealEffect
	cp $13
	call z, ApplyStatHealEffect
	cp $14
	call z, ApplyStatHealEffect
	inc hl
	ld a, [hl]
	cp 2
	jr z, ApplyLeechDrainEffect
	cp $12
	jr z, ApplyStatHealEffect
	cp $13
	jr z, ApplyStatHealEffect
	cp $14
	jr z, ApplyStatHealEffect
	ret

ApplyLeechDrainEffect::
	push af
	push hl
	ld [wd9e9], a
	ld a, $2e
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call ComputeDrainBaseStat
	ld a, [wd99a]
	ldh [hMathValue], a
	ld a, [wd99b]
	ldh [hMathValue + 1], a
	xor a
	ldh [hMathValue + 2], a
	ld a, 5
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue]
	ld [wd9b0], a
	ldh a, [hMathValue + 1]
	ld [wd9b1], a
	xor a
	ld [wMoveTargetsEnemy], a
	call AnimateHPRestore
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $40
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	pop hl
	pop af
	ret

ComputeDrainBaseStat::
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .alt

.player
	call ComputeEnemyMonStat
	ret

.enemy
	ld a, [wMoveTargetsEnemy]
	and a
	jr nz, .player

.alt
	call ComputeEnemyMonStat
	ret

ApplyStatHealEffect::
	push af
	push hl
	ld [wd9e9], a
	farcall ComputeScaledHP
	ldh a, [hMathValue]
	cp $10
	jr nc, ApplyStatHealEffect_Abort
	ld a, [wd9e9]
	cp $12
	jr z, .stat12
	cp $13
	jr z, .stat13
	cp $14
	jr z, .stat14

.stat12
	ld a, $14
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	jr ApplyHealEffectFinish

.stat13
	ld a, $3c
	ld [wd9b0], a
	xor a
	ld [wd9b1], a
	jr ApplyHealEffectFinish

.stat14
	ld a, [wd99a]
	ld [wd9b0], a
	ld a, [wd99b]
	ld [wd9b1], a
	call HalveHPValue

ApplyHealEffectFinish::
	ld a, $2e
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	xor a
	ld [wMoveTargetsEnemy], a
	call AnimateHPRestore
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $40
	ld [wBattleMessageID], a
	pop hl
	ld [hl], 0
	pop af
	farcall ShowBattleMessage
	call Wait32Frames
	ret

ApplyStatHealEffect_Abort::
	pop hl
	pop af
	ret

ProcessEndTurnStatusTick::
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	call GetStatTile
	cp $63
	jp z, ProcessStatusEffect63
	cp $70
	jp z, ProcessDisguiseCountdown
	cp $7d
	jp z, ProcessMoveSwapCountdown
	cp $88
	jp z, ProcessStatusEffect88Countdown
	ret

CheckHealOnElement5::
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp 5
	ret nz
	jp ApplyElementHealIfReady

CheckHealOnElement2::
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp 2
	ret nz
	jp ApplyElementHealIfReady

CheckHealOnElement1::
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp 1
	ret nz

ApplyElementHealIfReady::
	ld a, [wd9b1]
	and a
	jr nz, DecrementHealCounter
	ld a, [wd9b0]
	cp $64
	jr z, ApplyAccumulatedHeal
	jr nc, DecrementHealCounter

ApplyAccumulatedHeal::
	call HalveHPValue
	ld a, 1
	ld [wMoveTargetsEnemy], a
	call AnimateHPRestore
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $40
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ret

DecrementHealCounter::
	ld a, [wd9b0]
	sub $64
	ld [wd9b0], a
	ld a, [wd9b1]
	sbc 0
	ld [wd9b1], a
	ret

HalveHPValue::
	ld a, [wd9b1]
	and a
	jr nz, .swap
	ld a, [wd9b0]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	jr .convert

.swap
	ldh [hMathValue], a
	ld a, [wd9b0]
	ldh [hMathValue + 1], a

.convert
	xor a
	ldh [hMathValue + 2], a
	ld a, 2
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr nz, .high
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret

.high
	ld [wd9b0], a
	ldh a, [hMathValue]
	ld [wd9b1], a
	ret

ProcessPreMoveStatusTick::
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	call GetStatTile
	cp $e
	jp z, AccumulateDamageToStat67
	cp $3e
	jp z, AccumulateDamageToStat67
	cp $70
	jp z, ProcessDisguiseCountdown
	cp $77
	jp z, ProcessStatusEffect77
	cp $7a
	jp z, ProcessStatusEffect7a
	cp $87
	jp z, ProcessStatusEffect87
	cp $8a
	jp z, CheckHealOnElement1
	cp $8b
	jp z, CheckHealOnElement2
	cp $8c
	jp z, CheckHealOnElement5
	ret

DecrementStatPair::
	ld a, 1
	ld [wSideSelect], a
	xor a
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ld a, 1
	ld [wd9af], a
	ld a, $ff
	call AddStatTile
	ret

AccumulateDamageToStat67::
	ld a, [wd9b0]
	ld c, a
	ld a, [wd9b1]
	ld b, a
	ld a, 1
	ld [wSideSelect], a
	ld a, 6
	ld [wd9af], a
	call GetStatTile
	ld l, a
	ld a, 7
	ld [wd9af], a
	call GetStatTile
	ld h, a
	add hl, bc
	ld a, 6
	ld [wd9af], a
	ld a, l
	call SetStatTile
	ld a, 7
	ld [wd9af], a
	ld a, h
	call SetStatTile
	ret

DoubleHPValue::
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd9b1]
	and a
	jr nz, .swap
	ldh [hMathValue + 1], a
	ld a, [wd9b0]
	ldh [hMathValue], a
	jr .convert

.swap
	ldh [hMathValue], a
	ld a, [wd9b0]
	ldh [hMathValue + 1], a

.convert
	xor a
	ldh [hMathValue + 2], a
	ld a, 2
	ldh [hMathOperand], a
	farcall Multiply32By8
	ldh a, [hMathValue + 1]
	and a
	jr nz, .high
	ld [wd9b1], a
	ldh a, [hMathValue]
	ld [wd9b0], a
	ret

.high
	ld [wd9b0], a
	ldh a, [hMathValue]
	ld [wd9b1], a
	ret

ProcessStatusEffect63::
	ld a, $5b
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	ld a, $a
	ld [wd9c7], a
	ld a, $63
	ld [wBattleAnimID], a
	ld a, 1
	ld [wMoveTargetsEnemy], a
	xor a
	ld [wBattleAnimStep], a
	call CalcAndApplyMoveDamage
	ldh a, [hBattleJumptableIndex]
	cp 5
	ret z
	xor a
	ld [wMoveTargetsEnemy], a
	call AnimateHPRestore
	ret

ProcessDisguiseCountdown::
	ld a, 1
	ld [wSideSelect], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr z, .expired
	call SetStatTile
	ret

.expired
	call SetStatTile
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wd9c9]
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	xor a
	ld [wd9c9], a
	ret

.enemy
	ld a, [wd9c8]
	ld [wEnemyMonSpecies], a
	call LoadEnemyMonPic
	farcall Func_026_4d47
	xor a
	ld [wd9c8], a
	ret

ProcessStatusEffect77::
	ld a, $77
	ld [wBattleAnimID], a
	xor a
	ld [wBattleState], a
	ld [wBattleAnimStep], a
	assert BANK(Script_023_57ae) == BANK(MoveAnimScript_Pointers)
	ld de, Script_023_57ae
	farcall ExecuteBattleAnimScriptAt
	call DelayFrame
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile

ResetBattleEffectState::
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $13
	ld [wBattleMessageID], a
	ld a, 1
	ld [hFFC6], a
	xor a
	ld [wBattleState], a
	ld [wd9ad], a
	ld [wd9ae], a
	ld [wBattleAnimStep], a
	ld [wd98c], a
	ld [wd98e], a
	ret

ProcessStatusEffect7a::
	ld a, 1
	ld [wSideSelect], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr z, .expired
	call SetStatTile
	jp ResetStateOnElement

.expired
	call SetStatTile
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	xor a
	ld [wd9b8], a
	ld a, [wd9c9]
	ld [wd9e5], a
	call LoadMonPic_vTiles90d0
	farcall Func_026_4d1b
	xor a
	ld [wd9c9], a
	jp ResetStateOnElement

.enemy
	xor a
	ld [wd9b9], a
	ld a, [wd9c8]
	ld [wEnemyMonSpecies], a
	call LoadEnemyMonPic
	farcall Func_026_4d47
	xor a
	ld [wd9c8], a

ResetStateOnElement::
	ld a, [wd8ff]
	cp 3
	jp z, ResetBattleEffectState
	cp 0
	jp z, ResetBattleEffectState
	cp 4
	jp z, ResetBattleEffectState
	ret

ProcessMoveSwapCountdown::
	ld a, 1
	ld [wSideSelect], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr nz, .active
	xor a
	call SetStatTile
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ret

.active
	call SetStatTile
	ld a, [wBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wd9e2]
	ld [wd9e3], a
	ret

.enemy
	ld a, [wd9e3]
	ld [wd9e2], a
	ret

ProcessStatusEffect87::
	ld a, 1
	ld [wSideSelect], a
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, [wd8ff]
	cp $a
	ret z
	xor a
	ld [wd9b0], a
	ld [wd9b1], a
	ld a, $22
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call Wait32Frames
	call Wait32Frames
	ret

ProcessStatusEffect88Countdown::
	ld a, 1
	ld [wSideSelect], a
	ld a, 5
	ld [wd9af], a
	call GetStatTile
	dec a
	jr nz, .write
	ld a, 4
	ld [wd9af], a
	xor a
	call SetStatTile
	ld a, 5
	ld [wd9af], a
	xor a

.write
	call SetStatTile
	ret
