unk_02b_4000:
	dr $ac000, $ac3a8

BattleJumptable:
	ld de, .Jumptable
	ldh a, [hFFD3]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Func_02b_6847
	dw Func_02b_6847
	dw Func_02b_6417
	dw Func_02b_617c
	dw Func_02b_4d8c
	dw Func_02b_43c2

Func_02b_43c2:
	dr $ac3c2, $acd8c

Func_02b_4d8c:
	dr $acd8c, $ad547

Func_02b_5547:
	dr $ad547, $ad5cb

Func_02b_55cb:
	ld c, 32
.delay
	call DelayFrame
	dec c
	jr nz, .delay
	ret

Func_02b_55d4:
	dr $ad5d4, $ae17c

Func_02b_617c:
	dr $ae17c, $ae417

Func_02b_6417:
	dr $ae417, $ae847

Func_02b_6847:
	dr $ae847, $af650

SECTION "banknum2b", ROMX[$7fff], BANK[$2b]
	db $2b
