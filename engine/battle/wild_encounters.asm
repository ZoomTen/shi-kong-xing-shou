; Wild encounter group/slot tables and the routines that roll and load a wild mon.
Func_02d_507b::
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	jp Func_02d_50b3

Func_02d_5086::
	call LoadMapAttribute
	ld de, WildEncGroups
	ldh a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wBattleMusic]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ldh a, [hFFD8]
	inc a
	ld [hFFD8], a
	and $f
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

Func_02d_50b3::
	ld a, [hli]
	ld [wd9bf], a
	cp 1
	jr z, .skip
	ld a, [hl]
	ld [wd9dc], a
.skip
	call Func_02d_510c
	xor a
	ld [wBattleAnimStep], a
	ld e, l
	ld d, h
	ld bc, wd876
.loop
	call Func_02d_511b
	call Func_02d_5147
	push bc
	ld bc, wdb00
	ld a, [wBattleAnimStep]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
REPT 4
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	pop bc
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, [wBattleAnimStep]
	inc a
	ld [wBattleAnimStep], a
	ld a, [wd9bf]
	dec a
	ld [wd9bf], a
	jr nz, .loop
	xor a
	ld [wBattleAnimStep], a
	call DelayFrame
	call Func_02d_51ba
	ret

Func_02d_510c::
	push hl
	push bc

	ld hl, wd876
	ld c, $84
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear

	pop bc
	pop hl
	ret

Func_02d_511b::
	push de
	push hl
	ld hl, wd7cb
	ld a, [de]
	cp $a0
	jr nc, .done
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .done
	ld [hl], 1
.done
	pop hl
	pop de
	ret

Func_02d_5133::
	push de
	push hl
	ld hl, wd7cb
	ld a, [de]
	cp $a0
	jr nc, .done
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 2
.done
	pop hl
	pop de
	ret

Func_02d_5147::
; Load wild mon encounter data

; Get species and level
	ld hl, MON_SPECIES
	add hl, bc ; ld hl, bc
REPT 2
	ld a, [de]
	inc de
	ld [hli], a
ENDR

	ld hl, MON_EXP
	add hl, bc
REPT 4
	ld a, [de]
	inc de
	ld [hli], a
ENDR

	ld hl, MON_MOVE2ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, MON_MOVE3ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, MON_MOVE4ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, MON_STATUS
	add hl, bc
	ld [hl], 0
	inc hl
REPT 2
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	ret

Func_02d_5184::
	ld hl, MON_SPECIES
	add hl, bc
REPT 2
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	ld hl, MON_EXP
	add hl, bc
REPT 4
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	ld hl, MON_MOVE2ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, MON_MOVE3ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, MON_MOVE4ID
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, MON_STATUS
	add hl, bc
	ld [hl], 0
	ret

Func_02d_51ba::
	xor a
	ld [wd987], a
	ld bc, wd876

Func_02d_51c1::
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	ret z
	xor a
	ld [wd9d7], a
	push bc
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_025_40f6
	pop bc
	call Func_02d_51f1
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, h
	cp $d9
	jr c, Func_02d_51c1
	ret

asm_02d_51eb::
	jp Func_02d_51c1
	nop
	nop
	nop

Func_02d_51f1::
	ld hl, MON_HP
	add hl, bc
	ldh a, [hMathValue]
	ld [hli], a
	ldh a, [hMathValue + 1]
	ld [hli], a

	ld hl, MON_MOVE1ID
	add hl, bc
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE1PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE2PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE3PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, MON_MOVE4PP
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a

	ld hl, MON_STATUS
	add hl, bc
	ld [hl], 0
	ret

WildEncGroups::
	dw WildEncAttr_526a
	dw WildEncAttr_526a
	dw WildEncAttrSlots_54b4
	dw WildEncAttrSlots_572e
	dw WildEncAttrSlots_5916
	dw WildEncAttrSlots_5f22
	dw WildEncAttrSlots_61fe
	dw WildEncAttr_526a

WildEncAttr_526a::
	dw WildEncSlots_5274
	dw WildEncSlots_52d4
	dw WildEncSlots_5354
	dw WildEncSlots_53d4
	dw WildEncSlots_5454

WildEncSlots_5274::
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4
	dw WildEnc_5294
	dw WildEnc_52a4
	dw WildEnc_52b4
	dw WildEnc_52c4

WildEnc_5294::
	; species, level, exp[3], move1, move2, move3, move4, item, unk22, unk[5]
	db $01, 8, $01, $02, $00, $00, $2c, $25, $00, $00, $00, $00, $0a, $00, $0a, $00
WildEnc_52a4::
	db $01, 34, $02, $10, $00, $00, $2c, $0b, $00, $00, $00, $00, $14, $00, $0f, $00
WildEnc_52b4::
	db $01, 41, $01, $04, $00, $00, $2c, $00, $00, $00, $00, $00, $0f, $00, $0f, $00
WildEnc_52c4::
	db $01, 50, $02, $14, $00, $00, $2c, $0b, $00, $00, $00, $00, $14, $00, $0f, $00
WildEncSlots_52d4::
	dw WildEnc_52f4
	dw WildEnc_5304
	dw WildEnc_5314
	dw WildEnc_5324
	dw WildEnc_5334
	dw WildEnc_5344
	dw WildEnc_5304
	dw WildEnc_5314
	dw WildEnc_5324
	dw WildEnc_5334
	dw WildEnc_5344
	dw WildEnc_5304
	dw WildEnc_5314
	dw WildEnc_5324
	dw WildEnc_5334
	dw WildEnc_5344
WildEnc_52f4::
	db $01, 1, $02, $0e, $00, $00, $2c, $13, $00, $00, $00, $00, $24, $00, $16, $00
WildEnc_5304::
	db $01, 7, $03, $23, $00, $00, $2c, $0b, $00, $00, $00, $00, $2c, $00, $22, $00
WildEnc_5314::
	db $01, 33, $03, $30, $00, $00, $2c, $13, $00, $00, $00, $00, $32, $00, $1e, $00
WildEnc_5324::
	db $01, 50, $04, $82, $00, $00, $2c, $00, $00, $00, $00, $00, $2d, $00, $19, $00
WildEnc_5334::
	db $01, 106, $04, $aa, $00, $00, $1f, $2b, $00, $00, $00, $00, $28, $00, $20, $00
WildEnc_5344::
	db $01, 151, $05, $fa, $00, $00, $2c, $08, $00, $00, $00, $00, $37, $00, $1e, $00
WildEncSlots_5354::
	dw WildEnc_5374
	dw WildEnc_5384
	dw WildEnc_5394
	dw WildEnc_53a4
	dw WildEnc_53b4
	dw WildEnc_53c4
	dw WildEnc_5384
	dw WildEnc_5394
	dw WildEnc_53a4
	dw WildEnc_53b4
	dw WildEnc_53c4
	dw WildEnc_5384
	dw WildEnc_5394
	dw WildEnc_53a4
	dw WildEnc_53b4
	dw WildEnc_53c4
WildEnc_5374::
	db $01, 2, $03, $0c, $01, $00, $03, $00, $00, $00, $00, $00, $28, $00, $14, $00
WildEnc_5384::
	db $01, 7, $04, $c3, $01, $00, $2c, $0b, $00, $00, $00, $00, $3a, $00, $19, $00
WildEnc_5394::
	db $01, 8, $05, $56, $02, $00, $13, $2c, $00, $00, $00, $00, $42, $00, $28, $00
WildEnc_53a4::
	db $01, 9, $04, $e0, $01, $00, $25, $2c, $00, $00, $00, $00, $36, $00, $19, $00
WildEnc_53b4::
	db $01, 66, $03, $f3, $00, $00, $2c, $00, $00, $00, $00, $00, $2e, $00, $1e, $00
WildEnc_53c4::
	db $01, 118, $05, $9b, $02, $00, $2c, $08, $00, $00, $00, $00, $45, $00, $23, $00
WildEncSlots_53d4::
	dw WildEnc_53f4
	dw WildEnc_5404
	dw WildEnc_5414
	dw WildEnc_5424
	dw WildEnc_5434
	dw WildEnc_5444
	dw WildEnc_5404
	dw WildEnc_5414
	dw WildEnc_5424
	dw WildEnc_5434
	dw WildEnc_5444
	dw WildEnc_5404
	dw WildEnc_5414
	dw WildEnc_5424
	dw WildEnc_5434
	dw WildEnc_5444
WildEnc_53f4::
	db $01, 4, $07, $8c, $02, $00, $1f, $2c, $00, $00, $00, $00, $3c, $00, $2d, $00
WildEnc_5404::
	db $01, 36, $06, $d8, $01, $00, $2c, $25, $00, $00, $00, $00, $34, $00, $1e, $00
WildEnc_5414::
	db $01, 139, $08, $7b, $03, $00, $2b, $6f, $00, $00, $00, $00, $46, $00, $14, $00
WildEnc_5424::
	db $01, 151, $06, $ec, $01, $00, $08, $2c, $00, $00, $00, $00, $37, $00, $1e, $00
WildEnc_5434::
	db $01, 135, $07, $2b, $02, $00, $18, $2b, $00, $00, $00, $00, $41, $00, $28, $00
WildEnc_5444::
	db $01, 11, $07, $ba, $02, $00, $1c, $25, $2c, $00, $00, $00, $3c, $00, $23, $00
WildEncSlots_5454::
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
	dw WildEnc_5474
	dw WildEnc_5484
	dw WildEnc_5494
	dw WildEnc_54a4
WildEnc_5474::
	db $01, 66, $09, $20, $04, $00, $67, $2c, $0c, $00, $00, $00, $8e, $00, $32, $00
WildEnc_5484::
	db $01, 139, $0a, $1a, $06, $00, $1d, $2b, $0b, $00, $00, $00, $9b, $00, $14, $00
WildEnc_5494::
	db $01, 4, $0a, $6f, $06, $00, $2b, $2c, $1f, $00, $00, $00, $a1, $00, $2d, $00
WildEnc_54a4::
	db $01, 9, $0b, $bf, $07, $00, $31, $25, $2c, $00, $00, $00, $b1, $00, $23, $00
WildEncAttrSlots_54b4::
	dw WildEncSlots_54be
	dw WildEncSlots_551e
	dw WildEncSlots_558e
	dw WildEncSlots_561e
	dw WildEncSlots_569e
WildEncSlots_54be::
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
	dw WildEnc_54de
	dw WildEnc_54ee
	dw WildEnc_54fe
	dw WildEnc_550e
WildEnc_54de::
	db $01, 34, $0b, $cc, $07, $00, $2c, $10, $13, $00, $00, $00, $cc, $00, $37, $00
WildEnc_54ee::
	db $01, 55, $0c, $58, $0a, $00, $15, $24, $1a, $00, $00, $00, $ec, $00, $41, $00
WildEnc_54fe::
	db $01, 39, $0c, $89, $09, $00, $29, $80, $64, $5d, $00, $00, $d7, $00, $32, $00
WildEnc_550e::
	db $01, 43, $0d, $51, $0b, $00, $7e, $07, $2c, $00, $00, $00, $fe, $00, $46, $00
WildEncSlots_551e::
	dw WildEnc_553e
	dw WildEnc_554e
	dw WildEnc_555e
	dw WildEnc_556e
	dw WildEnc_557e
	dw WildEnc_553e
	dw WildEnc_554e
	dw WildEnc_555e
	dw WildEnc_556e
	dw WildEnc_557e
	dw WildEnc_553e
	dw WildEnc_554e
	dw WildEnc_555e
	dw WildEnc_556e
	dw WildEnc_557e
	dw WildEnc_553e
WildEnc_553e::
	db $01, 34, $0c, $ed, $08, $00, $13, $10, $2c, $00, $00, $00, $48, $01, $32, $00
WildEnc_554e::
	db $01, 43, $0d, $f4, $0a, $00, $07, $2c, $7e, $00, $00, $00, $64, $01, $2d, $00
WildEnc_555e::
	db $01, 118, $0d, $ca, $0b, $00, $86, $25, $15, $08, $00, $00, $71, $01, $3c, $00
WildEnc_556e::
	db $01, 131, $0e, $a7, $0e, $00, $50, $2c, $13, $00, $00, $00, $72, $01, $41, $00
WildEnc_557e::
	db $01, 39, $0f, $e6, $11, $00, $65, $29, $80, $64, $00, $00, $7f, $01, $4b, $00
WildEncSlots_558e::
	dw WildEnc_55ae
	dw WildEnc_55be
	dw WildEnc_55ce
	dw WildEnc_55de
	dw WildEnc_55ee
	dw WildEnc_55fe
	dw WildEnc_560e
	dw WildEnc_55ae
	dw WildEnc_55be
	dw WildEnc_55ce
	dw WildEnc_55de
	dw WildEnc_55ee
	dw WildEnc_55fe
	dw WildEnc_560e
	dw WildEnc_55ae
	dw WildEnc_55be
WildEnc_55ae::
	db $01, 40, $0e, $72, $0e, $00, $5d, $25, $66, $13, $00, $00, $98, $01, $37, $00
WildEnc_55be::
	db $01, 33, $0f, $c8, $10, $00, $63, $27, $5d, $13, $00, $00, $aa, $01, $3c, $00
WildEnc_55ce::
	db $01, 51, $0f, $4c, $11, $00, $50, $13, $2c, $00, $00, $00, $ae, $01, $41, $00
WildEnc_55de::
	db $01, 39, $10, $46, $14, $00, $65, $29, $80, $64, $00, $00, $d4, $01, $3c, $00
WildEnc_55ee::
	db $01, 71, $10, $eb, $13, $00, $2c, $25, $09, $13, $00, $00, $cb, $01, $46, $00
WildEnc_55fe::
	db $01, 110, $10, $99, $15, $00, $6d, $5e, $5f, $29, $00, $00, $d7, $01, $4b, $00
WildEnc_560e::
	db $01, 115, $11, $80, $17, $00, $25, $57, $2c, $13, $00, $00, $ef, $01, $50, $00
WildEncSlots_561e::
	dw WildEnc_563e
	dw WildEnc_564e
	dw WildEnc_565e
	dw WildEnc_566e
	dw WildEnc_567e
	dw WildEnc_568e
	dw WildEnc_563e
	dw WildEnc_564e
	dw WildEnc_565e
	dw WildEnc_566e
	dw WildEnc_567e
	dw WildEnc_568e
	dw WildEnc_563e
	dw WildEnc_564e
	dw WildEnc_565e
	dw WildEnc_566e
WildEnc_563e::
	db $01, 128, $11, $99, $18, $00, $13, $2c, $0f, $07, $00, $00, $a6, $01, $37, $00
WildEnc_564e::
	db $01, 131, $11, $e7, $19, $00, $0e, $50, $2c, $13, $00, $00, $b3, $01, $32, $00
WildEnc_565e::
	db $01, 58, $12, $93, $1b, $00, $02, $0f, $07, $2c, $00, $00, $ca, $01, $41, $00
WildEnc_566e::
	db $01, 55, $12, $70, $1d, $00, $51, $50, $15, $24, $00, $00, $bb, $01, $3c, $00
WildEnc_567e::
	db $01, 51, $12, $47, $1d, $00, $0e, $2c, $50, $13, $00, $00, $c3, $01, $4b, $00
WildEnc_568e::
	db $01, 35, $13, $77, $21, $00, $80, $17, $5f, $2b, $00, $00, $a9, $01, $46, $00
WildEncSlots_569e::
	dw WildEnc_56be
	dw WildEnc_56ce
	dw WildEnc_56de
	dw WildEnc_56ee
	dw WildEnc_56fe
	dw WildEnc_570e
	dw WildEnc_571e
	dw WildEnc_56be
	dw WildEnc_56ce
	dw WildEnc_56de
	dw WildEnc_56ee
	dw WildEnc_56fe
	dw WildEnc_570e
	dw WildEnc_571e
	dw WildEnc_56be
	dw WildEnc_56ce
WildEnc_56be::
	db $01, 79, $12, $66, $1d, $00, $17, $08, $03, $0b, $00, $00, $a0, $01, $41, $00
WildEnc_56ce::
	db $01, 84, $12, $39, $1d, $00, $0f, $25, $7e, $31, $00, $00, $a9, $01, $46, $00
WildEnc_56de::
	db $01, 135, $12, $a8, $1c, $00, $6e, $86, $28, $71, $00, $00, $b6, $01, $50, $00
WildEnc_56ee::
	db $01, 142, $13, $22, $20, $00, $69, $1f, $6e, $2b, $00, $00, $be, $01, $4b, $00
WildEnc_56fe::
	db $01, 147, $13, $99, $20, $00, $16, $84, $13, $09, $00, $00, $b7, $01, $37, $00
WildEnc_570e::
	db $01, 149, $13, $33, $21, $00, $58, $27, $23, $57, $00, $00, $bc, $01, $3c, $00
WildEnc_571e::
	db $01, 48, $14, $f9, $24, $00, $73, $6f, $27, $20, $00, $00, $d4, $01, $41, $00
WildEncAttrSlots_572e::
	dw WildEncSlots_5736
	dw WildEncSlots_5796
	dw WildEncSlots_5806
	dw WildEncSlots_5896
WildEncSlots_5736::
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
	dw WildEnc_5756
	dw WildEnc_5766
	dw WildEnc_5776
	dw WildEnc_5786
WildEnc_5756::
	db $01, 118, $13, $41, $20, $00, $72, $25, $86, $15, $00, $00, $e2, $01, $50, $00
WildEnc_5766::
	db $01, 55, $14, $27, $25, $00, $50, $15, $24, $1a, $00, $00, $f8, $01, $4b, $00
WildEnc_5776::
	db $01, 131, $13, $9a, $21, $00, $2c, $13, $50, $00, $00, $00, $ef, $01, $55, $00
WildEnc_5786::
	db $01, 115, $14, $1c, $25, $00, $57, $25, $13, $2c, $00, $00, $06, $02, $46, $00
WildEncSlots_5796::
	dw WildEnc_57b6
	dw WildEnc_57c6
	dw WildEnc_57d6
	dw WildEnc_57e6
	dw WildEnc_57f6
	dw WildEnc_57b6
	dw WildEnc_57c6
	dw WildEnc_57d6
	dw WildEnc_57e6
	dw WildEnc_57f6
	dw WildEnc_57b6
	dw WildEnc_57c6
	dw WildEnc_57d6
	dw WildEnc_57e6
	dw WildEnc_57f6
	dw WildEnc_57d6
WildEnc_57b6::
	db $01, 33, $14, $a8, $24, $00, $32, $63, $27, $5d, $00, $00, $10, $02, $50, $00
WildEnc_57c6::
	db $01, 35, $15, $57, $2b, $00, $17, $5f, $25, $2b, $00, $00, $20, $02, $4b, $00
WildEnc_57d6::
	db $01, 48, $14, $58, $26, $00, $27, $20, $1e, $08, $00, $00, $07, $02, $55, $00
WildEnc_57e6::
	db $01, 51, $15, $f6, $2a, $00, $50, $0e, $13, $2c, $00, $00, $1a, $02, $5a, $00
WildEnc_57f6::
	db $01, 4, $15, $d6, $2e, $00, $07, $2b, $20, $1f, $00, $00, $11, $02, $55, $00
WildEncSlots_5806::
	dw WildEnc_5826
	dw WildEnc_5836
	dw WildEnc_5846
	dw WildEnc_5856
	dw WildEnc_5866
	dw WildEnc_5876
	dw WildEnc_5886
	dw WildEnc_5826
	dw WildEnc_5836
	dw WildEnc_5846
	dw WildEnc_5856
	dw WildEnc_5866
	dw WildEnc_5876
	dw WildEnc_5886
	dw WildEnc_5876
	dw WildEnc_5856
WildEnc_5826::
	db $01, 7, $16, $47, $30, $00, $03, $31, $08, $0b, $00, $00, $24, $02, $5a, $00
WildEnc_5836::
	db $01, 34, $17, $05, $37, $00, $80, $10, $13, $00, $00, $00, $29, $02, $5f, $00
WildEnc_5846::
	db $01, 36, $18, $d6, $3f, $00, $02, $0c, $20, $15, $00, $00, $31, $02, $69, $00
WildEnc_5856::
	db $01, 51, $16, $cc, $32, $00, $50, $0e, $13, $2c, $00, $00, $19, $02, $50, $00
WildEnc_5866::
	db $01, 110, $17, $c4, $36, $00, $6d, $5e, $5f, $29, $00, $00, $21, $02, $55, $00
WildEnc_5876::
	db $01, 33, $18, $80, $3e, $00, $32, $63, $27, $5d, $00, $00, $34, $02, $64, $00
WildEnc_5886::
	db $01, 65, $17, $1e, $37, $00, $6e, $1f, $2b, $00, $00, $00, $25, $02, $5f, $00
WildEncSlots_5896::
	dw WildEnc_58b6
	dw WildEnc_58c6
	dw WildEnc_58d6
	dw WildEnc_58e6
	dw WildEnc_58f6
	dw WildEnc_5906
	dw WildEnc_58b6
	dw WildEnc_58c6
	dw WildEnc_58d6
	dw WildEnc_58e6
	dw WildEnc_58f6
	dw WildEnc_5906
	dw WildEnc_58b6
	dw WildEnc_58c6
	dw WildEnc_58d6
	dw WildEnc_58e6
WildEnc_58b6::
	db $01, 1, $18, $7c, $40, $00, $38, $2b, $0c, $25, $00, $00, $38, $02, $64, $00
WildEnc_58c6::
	db $01, 4, $19, $88, $45, $00, $2b, $15, $07, $20, $00, $00, $41, $02, $6e, $00
WildEnc_58d6::
	db $01, 48, $1a, $bc, $4d, $00, $6f, $27, $20, $1e, $00, $00, $50, $02, $73, $00
WildEnc_58e6::
	db $01, 65, $1b, $3e, $59, $00, $2b, $6e, $1f, $00, $00, $00, $67, $02, $78, $00
WildEnc_58f6::
	db $01, 84, $19, $90, $47, $00, $0f, $7e, $31, $80, $00, $00, $48, $02, $73, $00
WildEnc_5906::
	db $01, 149, $1a, $0a, $52, $00, $58, $23, $57, $27, $00, $00, $51, $02, $64, $00
WildEncAttrSlots_5916::
	dw WildEncSlots_5932
	dw WildEncSlots_59a2
	dw WildEncSlots_5a22
	dw WildEncSlots_5a82
	dw WildEncSlots_5ae2
	dw WildEncSlots_5b42
	dw WildEncSlots_5bc2
	dw WildEncSlots_5c42
	dw WildEncSlots_5ca2
	dw WildEncSlots_5cf2
	dw WildEncSlots_5d62
	dw WildEncSlots_5dc2
	dw WildEncSlots_5e42
	dw WildEncSlots_5ea2
WildEncSlots_5932::
	dw WildEnc_5952
	dw WildEnc_5962
	dw WildEnc_5972
	dw WildEnc_5982
	dw WildEnc_5992
	dw WildEnc_5952
	dw WildEnc_5962
	dw WildEnc_5972
	dw WildEnc_5982
	dw WildEnc_5992
	dw WildEnc_5952
	dw WildEnc_5962
	dw WildEnc_5972
	dw WildEnc_5982
	dw WildEnc_5992
	dw WildEnc_5972
WildEnc_5952::
	db $01, 25, $1b, $81, $58, $00, $4c, $4d, $0b, $17, $00, $00, $74, $02, $96, $00
WildEnc_5962::
	db $01, 28, $1c, $fb, $61, $00, $47, $08, $03, $0c, $00, $00, $77, $02, $b9, $00
WildEnc_5972::
	db $01, 29, $1d, $34, $6d, $00, $48, $0e, $25, $0f, $00, $00, $85, $02, $9b, $00
WildEnc_5982::
	db $01, 21, $1b, $0a, $58, $00, $47, $29, $48, $1c, $00, $00, $5b, $02, $a0, $00
WildEnc_5992::
	db $01, 106, $1c, $ba, $65, $00, $48, $17, $3c, $1f, $00, $00, $6a, $02, $af, $00
WildEncSlots_59a2::
	dw WildEnc_59c2
	dw WildEnc_59d2
	dw WildEnc_59e2
	dw WildEnc_59f2
	dw WildEnc_5a02
	dw WildEnc_5a12
	dw WildEnc_59c2
	dw WildEnc_59d2
	dw WildEnc_59e2
	dw WildEnc_59f2
	dw WildEnc_5a02
	dw WildEnc_5a12
	dw WildEnc_59c2
	dw WildEnc_59e2
	dw WildEnc_5a12
	dw WildEnc_5a02
WildEnc_59c2::
	db $01, 102, $1c, $3a, $61, $00, $48, $0d, $4a, $49, $00, $00, $a3, $02, $dc, $00
WildEnc_59d2::
	db $01, 25, $1d, $98, $6d, $00, $4d, $0b, $4c, $17, $00, $00, $98, $02, $eb, $00
WildEnc_59e2::
	db $01, 30, $1e, $f5, $76, $00, $48, $7c, $29, $47, $00, $00, $a9, $02, $fa, $00
WildEnc_59f2::
	db $01, 29, $1d, $5a, $6b, $00, $09, $48, $0e, $0f, $00, $00, $92, $02, $f0, $00
WildEnc_5a02::
	db $01, 21, $1c, $ae, $61, $00, $47, $29, $1c, $48, $00, $00, $89, $02, $d7, $00
WildEnc_5a12::
	db $01, 27, $1d, $e0, $6d, $00, $49, $30, $7c, $12, $00, $00, $9f, $02, $f5, $00
WildEncSlots_5a22::
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
	dw WildEnc_5a42
	dw WildEnc_5a52
	dw WildEnc_5a62
	dw WildEnc_5a72
WildEnc_5a42::
	db $01, 1, $1d, $04, $6e, $00, $19, $38, $0c, $25, $00, $00, $c1, $02, $59, $01
WildEnc_5a52::
	db $01, 42, $1e, $6a, $75, $00, $73, $24, $72, $1e, $00, $00, $d1, $02, $7c, $01
WildEnc_5a62::
	db $01, 63, $1f, $9a, $83, $00, $68, $67, $1a, $13, $00, $00, $e2, $02, $68, $01
WildEnc_5a72::
	db $01, 76, $1e, $a6, $75, $00, $57, $4b, $09, $86, $00, $00, $e9, $02, $77, $01
WildEncSlots_5a82::
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
	dw WildEnc_5aa2
	dw WildEnc_5ab2
	dw WildEnc_5ac2
	dw WildEnc_5ad2
WildEnc_5aa2::
	db $01, 22, $1f, $ed, $85, $00, $0a, $49, $81, $47, $00, $00, $31, $03, $a9, $01
WildEnc_5ab2::
	db $01, 24, $20, $d7, $92, $00, $4a, $47, $15, $49, $00, $00, $3a, $03, $c7, $01
WildEnc_5ac2::
	db $01, 107, $21, $b6, $9f, $00, $7e, $1b, $14, $80, $00, $00, $47, $03, $e5, $01
WildEnc_5ad2::
	db $01, 103, $20, $56, $92, $00, $67, $47, $70, $01, $00, $00, $27, $03, $ae, $01
WildEncSlots_5ae2::
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
	dw WildEnc_5b02
	dw WildEnc_5b12
	dw WildEnc_5b22
	dw WildEnc_5b32
WildEnc_5b02::
	db $01, 19, $20, $7b, $90, $00, $41, $18, $80, $40, $00, $00, $63, $03, $fe, $01
WildEnc_5b12::
	db $01, 31, $21, $fa, $9e, $00, $5e, $12, $1d, $66, $00, $00, $5b, $03, $f9, $01
WildEnc_5b22::
	db $01, 52, $22, $94, $ae, $00, $52, $53, $0c, $2c, $00, $00, $6b, $03, $21, $02
WildEnc_5b32::
	db $01, 129, $21, $2b, $a0, $00, $52, $0c, $53, $10, $00, $00, $52, $03, $30, $02
WildEncSlots_5b42::
	dw WildEnc_5b62
	dw WildEnc_5b72
	dw WildEnc_5b82
	dw WildEnc_5b92
	dw WildEnc_5ba2
	dw WildEnc_5bb2
	dw WildEnc_5b62
	dw WildEnc_5b72
	dw WildEnc_5b82
	dw WildEnc_5b92
	dw WildEnc_5ba2
	dw WildEnc_5bb2
	dw WildEnc_5b62
	dw WildEnc_5b82
	dw WildEnc_5ba2
	dw WildEnc_5bb2
WildEnc_5b62::
	db $01, 95, $20, $ee, $94, $00, $42, $43, $44, $82, $00, $00, $66, $03, $6c, $02
WildEnc_5b72::
	db $01, 98, $21, $66, $9c, $00, $40, $3d, $29, $0d, $00, $00, $63, $03, $ad, $02
WildEnc_5b82::
	db $01, 18, $22, $db, $ab, $00, $43, $8a, $1d, $41, $00, $00, $71, $03, $99, $02
WildEnc_5b92::
	db $01, 16, $21, $af, $a0, $00, $21, $40, $03, $24, $00, $00, $5f, $03, $62, $02
WildEnc_5ba2::
	db $01, 13, $20, $7b, $90, $00, $15, $02, $04, $0a, $00, $00, $56, $03, $b2, $02
WildEnc_5bb2::
	db $01, 14, $21, $9d, $9f, $00, $03, $40, $0f, $0e, $00, $00, $68, $03, $85, $02
WildEncSlots_5bc2::
	dw WildEnc_5be2
	dw WildEnc_5bf2
	dw WildEnc_5c02
	dw WildEnc_5c12
	dw WildEnc_5c22
	dw WildEnc_5c32
	dw WildEnc_5be2
	dw WildEnc_5bf2
	dw WildEnc_5c02
	dw WildEnc_5c12
	dw WildEnc_5c22
	dw WildEnc_5c32
	dw WildEnc_5be2
	dw WildEnc_5c02
	dw WildEnc_5c22
	dw WildEnc_5c32
WildEnc_5be2::
	db $01, 12, $21, $7d, $a0, $00, $41, $1e, $40, $06, $00, $00, $97, $03, $ad, $02
WildEnc_5bf2::
	db $01, 15, $22, $38, $aa, $00, $41, $83, $20, $1b, $00, $00, $88, $03, $9e, $02
WildEnc_5c02::
	db $01, 17, $23, $39, $bf, $00, $42, $30, $40, $24, $00, $00, $9b, $03, $7b, $02
WildEnc_5c12::
	db $01, 20, $22, $c4, $ab, $00, $1f, $81, $0f, $7e, $00, $00, $8f, $03, $62, $02
WildEnc_5c22::
	db $01, 93, $21, $9e, $9f, $00, $42, $23, $0f, $0b, $00, $00, $99, $03, $99, $02
WildEnc_5c32::
	db $01, 94, $22, $25, $aa, $00, $28, $41, $50, $0c, $00, $00, $8b, $03, $8f, $02
WildEncSlots_5c42::
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
	dw WildEnc_5c62
	dw WildEnc_5c72
	dw WildEnc_5c82
	dw WildEnc_5c92
WildEnc_5c62::
	db $01, 104, $22, $84, $aa, $00, $4c, $11, $4d, $0a, $00, $00, $cc, $03, $bc, $02
WildEnc_5c72::
	db $01, 105, $23, $c0, $bd, $00, $4d, $49, $47, $86, $00, $00, $c2, $03, $f3, $02
WildEnc_5c82::
	db $01, 23, $24, $85, $ca, $00, $48, $49, $4b, $0a, $00, $00, $d5, $03, $d5, $02
WildEnc_5c92::
	db $01, 22, $23, $94, $ba, $00, $47, $49, $11, $0a, $00, $00, $c7, $03, $0c, $03
WildEncSlots_5ca2::
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cc2
	dw WildEnc_5cd2
	dw WildEnc_5ce2
	dw WildEnc_5cd2
WildEnc_5cc2::
	db $01, 16, $23, $b2, $bd, $00, $40, $24, $21, $03, $00, $00, $dd, $03, $d9, $03
WildEnc_5cd2::
	db $01, 96, $24, $ed, $cc, $00, $83, $81, $80, $27, $00, $00, $e2, $03, $b7, $02
WildEnc_5ce2::
	db $01, 97, $25, $f4, $db, $00, $06, $05, $42, $41, $00, $00, $03, $04, $5d, $02
WildEncSlots_5cf2::
	dw WildEnc_5d12
	dw WildEnc_5d22
	dw WildEnc_5d32
	dw WildEnc_5d42
	dw WildEnc_5d52
	dw WildEnc_5d12
	dw WildEnc_5d22
	dw WildEnc_5d32
	dw WildEnc_5d42
	dw WildEnc_5d52
	dw WildEnc_5d12
	dw WildEnc_5d22
	dw WildEnc_5d32
	dw WildEnc_5d42
	dw WildEnc_5d52
	dw WildEnc_5d42
WildEnc_5d12::
	db $01, 32, $25, $2a, $e1, $00, $63, $16, $64, $18, $00, $00, $41, $04, $52, $03
WildEnc_5d22::
	db $01, 37, $26, $7a, $f3, $00, $60, $5f, $5e, $5d, $00, $00, $47, $04, $2f, $03
WildEnc_5d32::
	db $01, 38, $27, $13, $04, $01, $63, $61, $0a, $65, $00, $00, $75, $04, $4d, $03
WildEnc_5d42::
	db $01, 111, $26, $0b, $f6, $00, $60, $5e, $66, $09, $00, $00, $37, $04, $34, $03
WildEnc_5d52::
	db $01, 114, $25, $36, $e1, $00, $60, $64, $16, $68, $00, $00, $e6, $03, $75, $03
WildEncSlots_5d62::
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
	dw WildEnc_5d82
	dw WildEnc_5d92
	dw WildEnc_5da2
	dw WildEnc_5db2
WildEnc_5d82::
	db $01, 116, $27, $36, $03, $01, $06, $5e, $12, $66, $00, $00, $ed, $04, $9d, $03
WildEnc_5d92::
	db $01, 122, $28, $0f, $12, $01, $76, $7e, $81, $07, $00, $00, $12, $05, $de, $03
WildEnc_5da2::
	db $01, 125, $29, $27, $2e, $01, $72, $73, $74, $89, $00, $00, $18, $05, $cf, $03
WildEnc_5db2::
	db $01, 132, $28, $9b, $1f, $01, $1a, $51, $50, $52, $00, $00, $eb, $04, $a7, $03
WildEncSlots_5dc2::
	dw WildEnc_5de2
	dw WildEnc_5df2
	dw WildEnc_5e02
	dw WildEnc_5e12
	dw WildEnc_5e22
	dw WildEnc_5e32
	dw WildEnc_5de2
	dw WildEnc_5df2
	dw WildEnc_5e02
	dw WildEnc_5e12
	dw WildEnc_5e22
	dw WildEnc_5df2
	dw WildEnc_5e02
	dw WildEnc_5e12
	dw WildEnc_5e22
	dw WildEnc_5e32
WildEnc_5de2::
	db $01, 6, $28, $d6, $13, $01, $36, $35, $3d, $3c, $00, $00, $06, $05, $1a, $04
WildEnc_5df2::
	db $01, 67, $29, $fa, $2e, $01, $6e, $71, $69, $6d, $00, $00, $2b, $05, $7e, $04
WildEnc_5e02::
	db $01, 85, $2a, $34, $40, $01, $3e, $34, $31, $1d, $00, $00, $7a, $05, $e8, $03
WildEnc_5e12::
	db $01, 77, $29, $36, $26, $01, $78, $5c, $58, $80, $00, $00, $47, $05, $41, $05
WildEnc_5e22::
	db $01, 75, $28, $0c, $14, $01, $5a, $59, $58, $57, $00, $00, $1c, $05, $83, $04
WildEnc_5e32::
	db $01, 141, $29, $de, $29, $01, $52, $0a, $50, $0e, $00, $00, $0f, $05, $3d, $04
WildEncSlots_5e42::
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
	dw WildEnc_5e62
	dw WildEnc_5e72
	dw WildEnc_5e82
	dw WildEnc_5e92
WildEnc_5e62::
	db $01, 42, $2a, $db, $3e, $01, $72, $73, $74, $22, $00, $00, $74, $05, $d4, $03
WildEnc_5e72::
	db $01, 44, $2b, $ae, $56, $01, $74, $72, $73, $76, $00, $00, $8a, $05, $1a, $04
WildEnc_5e82::
	db $01, 59, $2c, $80, $71, $01, $53, $52, $51, $50, $00, $00, $ac, $05, $c5, $03
WildEnc_5e92::
	db $01, 74, $2b, $72, $55, $01, $7f, $58, $77, $7d, $00, $00, $7f, $05, $de, $03
WildEncSlots_5ea2::
	dw WildEnc_5ec2
	dw WildEnc_5ed2
	dw WildEnc_5ee2
	dw WildEnc_5ef2
	dw WildEnc_5f02
	dw WildEnc_5f12
	dw WildEnc_5ec2
	dw WildEnc_5ed2
	dw WildEnc_5ee2
	dw WildEnc_5ef2
	dw WildEnc_5f02
	dw WildEnc_5ed2
	dw WildEnc_5ee2
	dw WildEnc_5ef2
	dw WildEnc_5f02
	dw WildEnc_5f12
WildEnc_5ec2::
	db $01, 83, $2b, $d2, $59, $01, $22, $36, $0a, $16, $00, $00, $ad, $05, $e2, $04
WildEnc_5ed2::
	db $01, 87, $2c, $9c, $6b, $01, $8a, $16, $3d, $32, $00, $00, $d9, $05, $51, $04
WildEnc_5ee2::
	db $01, 112, $2d, $b2, $82, $01, $62, $66, $5e, $12, $00, $00, $ef, $05, $49, $07
WildEnc_5ef2::
	db $01, 79, $2b, $8b, $55, $01, $57, $05, $03, $0f, $00, $00, $a6, $05, $cd, $05
WildEnc_5f02::
	db $01, 77, $2d, $ea, $82, $01, $78, $5c, $58, $80, $00, $00, $f8, $05, $13, $06
WildEnc_5f12::
	db $01, 134, $2c, $f2, $6d, $01, $82, $7f, $56, $55, $00, $00, $d1, $05, $72, $06
WildEncAttrSlots_5f22::
	dw WildEncSlots_5f2e
	dw WildEncSlots_5f9e
	dw WildEncSlots_600e
	dw WildEncSlots_607e
	dw WildEncSlots_60fe
	dw WildEncSlots_617e
WildEncSlots_5f2e::
	dw WildEnc_5f4e
	dw WildEnc_5f5e
	dw WildEnc_5f6e
	dw WildEnc_5f7e
	dw WildEnc_5f8e
	dw WildEnc_5f4e
	dw WildEnc_5f5e
	dw WildEnc_5f6e
	dw WildEnc_5f7e
	dw WildEnc_5f8e
	dw WildEnc_5f4e
	dw WildEnc_5f5e
	dw WildEnc_5f6e
	dw WildEnc_5f7e
	dw WildEnc_5f8e
	dw WildEnc_5f6e
WildEnc_5f4e::
	db $01, 45, $2c, $cd, $6d, $01, $7a, $7b, $14, $82, $00, $00, $bb, $05, $6f, $04
WildEnc_5f5e::
	db $01, 47, $2d, $3a, $7f, $01, $75, $7a, $7b, $12, $00, $00, $e0, $05, $47, $04
WildEnc_5f6e::
	db $01, 49, $2e, $5b, $a1, $01, $76, $74, $73, $72, $00, $00, $33, $06, $b0, $04
WildEnc_5f7e::
	db $01, 119, $2d, $bf, $82, $01, $73, $74, $88, $89, $00, $00, $db, $05, $2e, $04
WildEnc_5f8e::
	db $01, 120, $2c, $e9, $79, $01, $16, $7a, $7b, $82, $00, $00, $9e, $05, $65, $04
WildEncSlots_5f9e::
	dw WildEnc_5fbe
	dw WildEnc_5fce
	dw WildEnc_5fde
	dw WildEnc_5fee
	dw WildEnc_5ffe
	dw WildEnc_5fbe
	dw WildEnc_5fce
	dw WildEnc_5fde
	dw WildEnc_5fee
	dw WildEnc_5ffe
	dw WildEnc_5fbe
	dw WildEnc_5fce
	dw WildEnc_5fde
	dw WildEnc_5fee
	dw WildEnc_5ffe
	dw WildEnc_5fde
WildEnc_5fbe::
	db $01, 31, $2d, $fd, $7f, $01, $62, $5e, $12, $66, $00, $00, $28, $06, $a1, $04
WildEnc_5fce::
	db $01, 41, $2e, $4f, $a8, $01, $7a, $7b, $72, $20, $00, $00, $44, $06, $42, $04
WildEnc_5fde::
	db $01, 40, $2f, $2f, $b8, $01, $5d, $60, $7e, $64, $00, $00, $79, $06, $ed, $03
WildEnc_5fee::
	db $01, 54, $2d, $75, $82, $01, $56, $54, $52, $51, $00, $00, $3e, $06, $97, $04
WildEnc_5ffe::
	db $01, 61, $2e, $28, $89, $01, $21, $68, $67, $22, $00, $00, $61, $06, $4c, $04
WildEncSlots_600e::
	dw WildEnc_602e
	dw WildEnc_603e
	dw WildEnc_604e
	dw WildEnc_605e
	dw WildEnc_606e
	dw WildEnc_602e
	dw WildEnc_603e
	dw WildEnc_604e
	dw WildEnc_605e
	dw WildEnc_606e
	dw WildEnc_602e
	dw WildEnc_603e
	dw WildEnc_604e
	dw WildEnc_605e
	dw WildEnc_606e
	dw WildEnc_604e
WildEnc_602e::
	db $01, 3, $2d, $5b, $81, $01, $3c, $3f, $39, $37, $00, $00, $29, $06, $b5, $04
WildEnc_603e::
	db $01, 73, $2e, $70, $9c, $01, $79, $57, $82, $7f, $00, $00, $2f, $06, $a1, $04
WildEnc_604e::
	db $01, 69, $2f, $44, $b4, $01, $6a, $0a, $81, $82, $00, $00, $98, $06, $ed, $03
WildEnc_605e::
	db $01, 113, $30, $34, $d4, $01, $83, $60, $5f, $2b, $00, $00, $c0, $06, $e8, $03
WildEnc_606e::
	db $01, 152, $2f, $33, $b8, $01, $75, $7a, $7b, $12, $00, $00, $9e, $06, $37, $05
WildEncSlots_607e::
	dw WildEnc_609e
	dw WildEnc_60ae
	dw WildEnc_60be
	dw WildEnc_60ce
	dw WildEnc_60de
	dw WildEnc_60ee
	dw WildEnc_609e
	dw WildEnc_60ae
	dw WildEnc_60be
	dw WildEnc_60ce
	dw WildEnc_60de
	dw WildEnc_60ee
	dw WildEnc_609e
	dw WildEnc_60be
	dw WildEnc_60ce
	dw WildEnc_60ee
WildEnc_609e::
	db $01, 26, $2e, $53, $a8, $01, $4b, $8b, $4e, $48, $00, $00, $45, $06, $fc, $03
WildEnc_60ae::
	db $01, 68, $2f, $07, $b0, $01, $6b, $5a, $69, $6e, $00, $00, $7a, $06, $9c, $04
WildEnc_60be::
	db $01, 70, $30, $90, $d4, $01, $6b, $7f, $41, $00, $00, $00, $f6, $06, $ed, $03
WildEnc_60ce::
	db $01, 86, $31, $48, $fb, $01, $24, $3c, $3b, $22, $00, $00, $09, $07, $e7, $04
WildEnc_60de::
	db $01, 89, $30, $5b, $d5, $02, $34, $3e, $89, $0e, $00, $00, $fe, $06, $19, $05
WildEnc_60ee::
	db $01, 143, $2f, $2d, $b8, $01, $6a, $69, $88, $25, $00, $00, $8d, $06, $1a, $04
WildEncSlots_60fe::
	dw WildEnc_611e
	dw WildEnc_612e
	dw WildEnc_613e
	dw WildEnc_614e
	dw WildEnc_615e
	dw WildEnc_616e
	dw WildEnc_611e
	dw WildEnc_612e
	dw WildEnc_613e
	dw WildEnc_614e
	dw WildEnc_615e
	dw WildEnc_616e
	dw WildEnc_611e
	dw WildEnc_613e
	dw WildEnc_614e
	dw WildEnc_616e
WildEnc_611e::
	db $01, 61, $31, $3e, $fb, $01, $68, $22, $67, $03, $00, $00, $09, $07, $e8, $03
WildEnc_612e::
	db $01, 67, $32, $c4, $11, $02, $69, $83, $6f, $86, $00, $00, $62, $07, $e8, $03
WildEnc_613e::
	db $01, 68, $33, $5c, $2d, $02, $5a, $69, $6b, $7c, $00, $00, $d2, $07, $1a, $04
WildEnc_614e::
	db $01, 138, $34, $7c, $4a, $02, $85, $00, $00, $00, $00, $00, $ec, $07, $51, $04
WildEnc_615e::
	db $01, 137, $33, $ad, $2a, $02, $6a, $6b, $67, $68, $00, $00, $ce, $07, $1f, $04
WildEnc_616e::
	db $01, 140, $32, $49, $12, $02, $68, $6b, $69, $67, $00, $00, $61, $07, $b0, $04
WildEncSlots_617e::
	dw WildEnc_619e
	dw WildEnc_61ae
	dw WildEnc_61be
	dw WildEnc_61ce
	dw WildEnc_61de
	dw WildEnc_61ee
	dw WildEnc_619e
	dw WildEnc_61ae
	dw WildEnc_61be
	dw WildEnc_61ce
	dw WildEnc_61de
	dw WildEnc_61ee
	dw WildEnc_619e
	dw WildEnc_61be
	dw WildEnc_61ce
	dw WildEnc_61ee
WildEnc_619e::
	db $01, 9, $31, $2f, $f1, $01, $34, $2a, $14, $1f, $00, $00, $08, $07, $b5, $04
WildEnc_61ae::
	db $01, 67, $32, $96, $0d, $02, $69, $83, $6f, $86, $00, $00, $66, $07, $a1, $04
WildEnc_61be::
	db $01, 82, $33, $4f, $2d, $02, $38, $32, $87, $31, $00, $00, $cf, $07, $4c, $04
WildEnc_61ce::
	db $01, 79, $34, $a0, $4a, $02, $83, $05, $02, $57, $00, $00, $ee, $07, $1f, $04
WildEnc_61de::
	db $01, 45, $33, $80, $39, $02, $7a, $7b, $82, $16, $00, $00, $d6, $07, $1c, $04
WildEnc_61ee::
	db $01, 150, $32, $8b, $16, $02, $5a, $59, $77, $57, $00, $00, $47, $07, $15, $04
WildEncAttrSlots_61fe::
	dw WildEncSlots_6208
	dw WildEncSlots_6278
	dw WildEncSlots_62f8
	dw WildEncSlots_6378
	dw WildEncSlots_63e8
WildEncSlots_6208::
	dw WildEnc_6228
	dw WildEnc_6238
	dw WildEnc_6248
	dw WildEnc_6258
	dw WildEnc_6268
	dw WildEnc_6228
	dw WildEnc_6238
	dw WildEnc_6248
	dw WildEnc_6258
	dw WildEnc_6268
	dw WildEnc_6228
	dw WildEnc_6238
	dw WildEnc_6248
	dw WildEnc_6258
	dw WildEnc_6268
	dw WildEnc_6248
WildEnc_6228::
	db $01, 46, $32, $07, $12, $02, $74, $88, $73, $72, $00, $00, $d4, $07, $27, $06
WildEnc_6238::
	db $01, 88, $33, $0c, $35, $02, $35, $2f, $12, $2a, $00, $00, $05, $08, $aa, $05
WildEnc_6248::
	db $01, 121, $34, $75, $4b, $02, $73, $76, $74, $72, $00, $00, $2f, $08, $40, $06
WildEnc_6258::
	db $01, 123, $35, $c0, $72, $02, $75, $7a, $7b, $12, $00, $00, $3b, $08, $e1, $05
WildEnc_6268::
	db $01, 148, $34, $b4, $4e, $02, $5a, $59, $77, $57, $00, $00, $28, $08, $13, $06
WildEncSlots_6278::
	dw WildEnc_6298
	dw WildEnc_62a8
	dw WildEnc_62b8
	dw WildEnc_62c8
	dw WildEnc_62d8
	dw WildEnc_62e8
	dw WildEnc_6298
	dw WildEnc_62a8
	dw WildEnc_62b8
	dw WildEnc_62c8
	dw WildEnc_62d8
	dw WildEnc_62e8
	dw WildEnc_6298
	dw WildEnc_62a8
	dw WildEnc_62c8
	dw WildEnc_62e8
WildEnc_6298::
	db $01, 53, $33, $29, $31, $02, $55, $56, $54, $53, $00, $00, $fd, $07, $c1, $07
WildEnc_62a8::
	db $01, 56, $34, $07, $4e, $e3, $53, $55, $52, $54, $00, $00, $32, $08, $0d, $07
WildEnc_62b8::
	db $01, 57, $35, $98, $70, $02, $54, $53, $52, $51, $00, $00, $5c, $08, $a4, $06
WildEnc_62c8::
	db $01, 60, $36, $7c, $97, $02, $52, $22, $51, $50, $00, $00, $8b, $08, $04, $06
WildEnc_62d8::
	db $01, 130, $35, $ca, $78, $02, $53, $54, $51, $52, $00, $00, $6b, $08, $9a, $06
WildEnc_62e8::
	db $01, 133, $34, $10, $4b, $02, $2f, $53, $52, $51, $00, $00, $37, $08, $73, $05
WildEncSlots_62f8::
	dw WildEnc_6318
	dw WildEnc_6328
	dw WildEnc_6338
	dw WildEnc_6348
	dw WildEnc_6358
	dw WildEnc_6368
	dw WildEnc_6318
	dw WildEnc_6328
	dw WildEnc_6338
	dw WildEnc_6348
	dw WildEnc_6358
	dw WildEnc_6368
	dw WildEnc_6318
	dw WildEnc_6328
	dw WildEnc_6348
	dw WildEnc_6368
WildEnc_6318::
	db $01, 136, $34, $4b, $50, $02, $6b, $7c, $5a, $69, $00, $00, $43, $08, $db, $06
WildEnc_6328::
	db $01, 62, $35, $91, $70, $02, $88, $6a, $69, $13, $00, $00, $7e, $08, $3a, $07
WildEnc_6338::
	db $01, 64, $36, $70, $96, $02, $69, $6c, $5a, $89, $00, $00, $b7, $08, $9e, $07
WildEnc_6348::
	db $01, 70, $37, $6c, $b9, $02, $6b, $41, $7f, $00, $00, $00, $dd, $08, $40, $06
WildEnc_6358::
	db $01, 137, $36, $70, $96, $02, $6a, $67, $6b, $68, $00, $00, $b2, $08, $3a, $07
WildEnc_6368::
	db $01, 141, $35, $8a, $6c, $02, $0e, $54, $0a, $52, $00, $00, $8a, $08, $36, $06
WildEncSlots_6378::
	dw WildEnc_6398
	dw WildEnc_63a8
	dw WildEnc_63b8
	dw WildEnc_63c8
	dw WildEnc_63d8
	dw WildEnc_6398
	dw WildEnc_63a8
	dw WildEnc_63b8
	dw WildEnc_63c8
	dw WildEnc_63d8
	dw WildEnc_6398
	dw WildEnc_63a8
	dw WildEnc_63b8
	dw WildEnc_63c8
	dw WildEnc_63d8
	dw WildEnc_6398
WildEnc_6398::
	db $01, 72, $37, $c2, $bd, $02, $78, $5c, $5b, $59, $00, $00, $fb, $08, $90, $06
WildEnc_63a8::
	db $01, 78, $38, $ec, $e0, $02, $3c, $3d, $3e, $33, $00, $00, $51, $09, $f9, $06
WildEnc_63b8::
	db $01, 80, $39, $4a, $08, $03, $5a, $77, $59, $86, $00, $00, $85, $09, $9e, $07
WildEnc_63c8::
	db $01, 14, $38, $6e, $da, $02, $42, $41, $05, $40, $00, $00, $60, $09, $08, $07
WildEnc_63d8::
	db $01, 95, $37, $ce, $ba, $02, $46, $44, $45, $43, $00, $00, $0c, $09, $d6, $06
WildEncSlots_63e8::
	dw WildEnc_6408
	dw WildEnc_6418
	dw WildEnc_6428
	dw WildEnc_6438
	dw WildEnc_6448
	dw WildEnc_6458
	dw WildEnc_6468
	dw WildEnc_6478
	dw WildEnc_6488
	dw WildEnc_6498
	dw WildEnc_6458
	dw WildEnc_6448
	dw WildEnc_6438
	dw WildEnc_6428
	dw WildEnc_6498
	dw WildEnc_6478
WildEnc_6408::
	db $01, 5, $38, $a4, $e5, $02, $36, $2e, $2a, $2d, $00, $00, $74, $09, $dc, $05
WildEnc_6418::
	db $01, 90, $39, $5d, $08, $03, $43, $42, $45, $88, $00, $00, $b6, $09, $09, $06
WildEnc_6428::
	db $01, 92, $3a, $1b, $32, $03, $46, $42, $43, $40, $00, $00, $c8, $09, $72, $06
WildEnc_6438::
	db $01, 100, $39, $c5, $0c, $03, $4f, $4d, $4e, $83, $00, $00, $bb, $09, $e1, $05
WildEnc_6448::
	db $01, 101, $38, $18, $e4, $02, $83, $4b, $49, $80, $00, $00, $6c, $09, $a4, $06
WildEnc_6458::
	db $01, 109, $3a, $5e, $30, $03, $5d, $8c, $77, $63, $00, $00, $db, $09, $72, $06
WildEnc_6468::
	db $01, 124, $38, $e7, $e4, $02, $7a, $7b, $73, $20, $00, $00, $93, $09, $af, $05
WildEnc_6478::
	db $01, 146, $39, $46, $09, $03, $79, $57, $82, $7e, $00, $00, $bf, $09, $72, $06
WildEnc_6488::
	db $01, 10, $3a, $e4, $30, $03, $0a, $0f, $20, $31, $00, $00, $e4, $09, $78, $05
WildEnc_6498::
	db $01, 127, $39, $bc, $08, $03, $51, $52, $0e, $50, $00, $00, $b9, $09, $e1, $05
