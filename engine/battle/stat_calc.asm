; Stat computation and fixed-point math (HP/ATK/DEF/SPD/MAG/MDEF).
Func_025_4101::
	ld hl, wd876
	ld a, [wd987]
	call GetMonStructPtr
	jp _ComputeStatValue

asm_025_410d::
	call GetPartyMonPtr

_ComputeStatValue::
	ld de, StatFactorTable
	push de
	ld a, [bc]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	pop de
	add hl, hl
	add hl, de
	pop de
	add hl, de
	ld a, [wd9d7]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [hMathOperand], a
	ld de, StatBaseTable
	ld hl, 1
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, de
	ld a, [hl]
	ldh [hMathValue], a
	xor a
	ldh [hMathValue + 1], a
	ldh [hMathValue + 2], a
	call Multiply32By8
	ld a, $64
	ldh [hMathOperand], a
	ld b, 4
	call Divide32By16
	ret

Multiply32By8::
	push hl
	push bc
	ld a, 8
	ld b, a
	xor a
	ldh [hMathValue + 3], a
	ldh [hMathOperand + 1], a
	ldh [hMathOperand + 2], a
	ldh [hMathOperand + 3], a
	ldh [hMathAccum + 3], a
	ldh [hMathAccum + 2], a
	ldh [hMathAccum + 1], a
	ldh [hMathAccum], a

Func_025_4160::
	ldh a, [hMathOperand]
	srl a
	ldh [hMathOperand], a
	jr nc, Func_025_4188
	ldh a, [hMathAccum]
	ld c, a
	ldh a, [hMathValue]
	add c
	ldh [hMathAccum], a
	ldh a, [hMathAccum + 1]
	ld c, a
	ldh a, [hMathValue + 1]
	adc c
	ldh [hMathAccum + 1], a
	ldh a, [hMathAccum + 2]
	ld c, a
	ldh a, [hMathValue + 2]
	adc c
	ldh [hMathAccum + 2], a
	ldh a, [hMathAccum + 3]
	ld c, a
	ldh a, [hMathValue + 3]
	adc c
	ldh [hMathAccum + 3], a

Func_025_4188::
	dec b
	jr z, Func_025_41a5
	ldh a, [hMathValue]
	sla a
	ldh [hMathValue], a
	ldh a, [hMathValue + 1]
	rl a
	ldh [hMathValue + 1], a
	ldh a, [hMathValue + 2]
	rl a
	ldh [hMathValue + 2], a
	ldh a, [hMathValue + 3]
	rl a
	ldh [hMathValue + 3], a
	jr Func_025_4160

Func_025_41a5::
	ldh a, [hMathAccum]
	ldh [hMathValue], a
	ldh a, [hMathAccum + 1]
	ldh [hMathValue + 1], a
	ldh a, [hMathAccum + 2]
	ldh [hMathValue + 2], a
	ldh a, [hMathAccum + 3]
	ldh [hMathValue + 3], a
	pop bc
	pop hl
	ret

Divide32By16_4Digit::
	ld b, 4

Divide32By16::
	push hl
	push bc
	push de
	xor a
	ldh [hMathOperand + 1], a
	ldh [hMathOperand + 2], a
	ldh [hMathOperand + 3], a
	ldh [hMathValue + 3], a
	ldh [hMathAccum + 3], a
	ldh [hMathAccum + 2], a
	ldh [hMathAccum + 1], a
	ldh [hMathAccum], a
	ld a, 9
	ld e, a

Func_025_41d1::
	ldh a, [hMathOperand + 1]
	ld c, a
	ldh a, [hMathValue + 2]
	sub c
	ld d, a
	ldh a, [hMathOperand]
	ld c, a
	ldh a, [hMathValue + 3]
	sbc c
	jr c, Func_025_41ec
	ldh [hMathValue + 3], a
	ld a, d
	ldh [hMathValue + 2], a
	ldh a, [hMathAccum]
	inc a
	ldh [hMathAccum], a
	jr Func_025_41d1

Func_025_41ec::
	ld a, b
	cp 1
	jr z, Func_025_4236
	ldh a, [hMathAccum]
	sla a
	ldh [hMathAccum], a
	ldh a, [hMathAccum + 1]
	rl a
	ldh [hMathAccum + 1], a
	ldh a, [hMathAccum + 2]
	rl a
	ldh [hMathAccum + 2], a
	ldh a, [hMathAccum + 3]
	rl a
	ldh [hMathAccum + 3], a
	dec e
	jr nz, Func_025_4222
	ld a, 8
	ld e, a
	ldh a, [hMathOperand + 1]
	ldh [hMathOperand], a
	xor a
	ldh [hMathOperand + 1], a
	ldh a, [hMathValue + 2]
	ldh [hMathValue + 3], a
	ldh a, [hMathValue + 1]
	ldh [hMathValue + 2], a
	ldh a, [hMathValue]
	ldh [hMathValue + 1], a
