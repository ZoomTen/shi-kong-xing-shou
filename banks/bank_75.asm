Multicart_Func_4000:
	jp Multicart_Func_40bd
	jp Multicart_Func_4026
Multicart_ChannelRegisterPairs:
	db $12, $14, $17, $19, $1c, $1e, $21, $23, $12, $14, $17, $19, $1c, $1e, $21, $23
Multicart_ChannelPanMasks:
	db $11, $22, $44, $88
Multicart_unk_401A:
	db $01, $02, $04, $08, $10, $20, $40, $80, $01, $20, $44, $88
Multicart_Func_4026:
	ld a, $80
	ldh [$ff26], a
	ldh [$ff1a], a
	swap a
	ldh [$ff12], a
	ldh [$ff17], a
	ldh [$ff1c], a
	ldh [$ff21], a
	swap a
	ldh [$ff14], a
	ldh [$ff19], a
	ldh [$ff1e], a
	ldh [$ff23], a
	ld a, $77
	ldh [$ff24], a
	xor a
	ldh [$ff10], a
	ldh [$ff25], a
	ld de, $0010
	ld hl, $df00
	ld b, $08
.asm_4051
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_4051
	ld a, $80
	ld [$df2b], a
	ld [$df6b], a
	ret
Multicart_Func_405f:
	ld hl, $df80
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	inc a
	add l
	ld l, a
	ld a, [hl]
	add a
	jr z, Multicart_Func_4026
	ld de, Multicart_SongHeaderPointers
	ld h, $00
	ld l, a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, $DF
	ld b, $DF
.asm_407c
	ld a, [de]
	inc a
	ret z
	dec a
	jr nz, .asm_408f
	ld l, $40
	bit 0, [hl]
	jr nz, .asm_4093
.asm_4088
	ld l, a
	xor a
	ldh [$ff10], a
	ld a, l
	jr .asm_4093
.asm_408f
	cp $04
	jr z, .asm_4088
.asm_4093
	swap a
	ld l, a
	cp $40
	jr c, .asm_40a1
	sub $40
	ld c, a
	ld a, [bc]
	or $80
	ld [bc], a
.asm_40a1
	set 0, [hl]
	ld a, $81
	and [hl]
	ld [hl], a
	inc l
	ld [hl], $01
	xor a
	set 2, l
	ld [hl], a
	inc l
	ld [hl], a
	inc l
	ld [hl], a
	inc l
	inc de
	ld a, [de]
	ld [hl], a
	inc l
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	jr .asm_407c

Multicart_Func_40bd:
	ld b, $08
Multicart_Func_40bf:
	ld h, $DF
Multicart_Func_40c1:
	dec b
	bit 7, b
	jp nz, Multicart_Func_405f
	ld l, b
	swap l
	ld a, [hl]
	bit 0, a
	jr z, Multicart_Func_40bf
	inc l
	dec [hl]
	jr z, .asm_4116
	inc l
	dec [hl]
	jr nz, Multicart_Func_40c1
	inc l
	ld e, [hl]
	inc l
	ld d, [hl]
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	inc l
	sub [hl]
	jr nc, .asm_40e5
	xor a
.asm_40e5
	dec l
	ld [hl], d
	dec l
	ld [hl], e
	dec l
	ld [hl], c
	ld c, a
	ld de, $df90
	ld a, [$df84]
	add e
	ld e, a
	ld a, c
	ld [de], a
	dec l
	dec l
	bit 7, [hl]
	jr nz, Multicart_Func_40c1
	push hl
	ld hl, Multicart_ChannelRegisterPairs
	ld a, b
	add a
	add l
	ld l, a
	ld a, $00
	adc h
	ld h, a
	ld a, c
	ld c, [hl]
	ldh [c], a
	inc hl
	ld c, [hl]
	pop hl
	ld a, $0D
	or l
	ld l, a
	ld a, [hl]
	ldh [c], a
	jr Multicart_Func_40c1
.asm_4116
	ld a, b
	ld [$df84], a
	dec l
	set 3, l
	ld e, [hl]
	inc l
	ld d, [hl]
Multicart_Func_4120:
	inc de
Multicart_Func_4121:
	ld a, [de]
	bit 7, a
	jr z, .asm_419e
	bit 6, a
	jr z, .asm_413e
	bit 5, a
	jr z, .asm_414f
	push hl
	ld hl, Multicart_SoundCommandJumpTable
	and $0F
	add a
	ld c, a
	ld b, $00
	add hl, bc
	ld b, [hl]
	inc hl
	ld h, [hl]
	ld l, b
	jp hl
.asm_413e
	push hl
	res 7, a
	ld c, a
	ld b, $00
	ld hl, Multicart_Table_45CF
	add hl, bc
	ld a, [hl]
	pop hl
	inc l
	ld [hl], a
	dec l
	jr Multicart_Func_4120
.asm_414f
	and $1F
	ld b, a
	ld a, [$df84]
	and $03
	add b
	push hl
	ld hl, Multicart_ChannelPanMasks
	add l
	ld l, a
	ld a, $00
	adc h
	ld h, a
	ld a, [hl]
	ld hl, $df88
	ld b, a
	ld a, [$df84]
	add l
	ld l, a
	ld [hl], b
	pop hl
	jr Multicart_Func_4120
.asm_4170
	push hl
	ld hl, $df90
	ld a, [$df84]
	add l
	ld l, a
	ld a, $08
	ld [hl], a
	pop hl
	ld a, [$df84]
	ld b, a
	res 3, l
	set 1, [hl]
	bit 7, [hl]
	jp nz, Multicart_Func_40c1
	ld a, b
	ld hl, $df88
	add l
	ld l, a
	ld a, [hl]
	cpl
	ld c, a
	ldh a, [$ff25]
	and c
	swap c
	and c
	ldh [$ff25], a
	jp Multicart_Func_40bf
.asm_419e
	inc l
	ld c, [hl]
	res 3, l
	dec l
	ld [hl], c
	set 3, l
	ld [hl], d
	dec l
	ld [hl], e
	cp $54
	jr z, .asm_4170
	ld c, a
	ld a, [$df84]
	and $03
	cp $03
	jp z, .asm_4256
	ld a, c
	dec l
	add [hl]
	ld c, l
	ld b, h
	add a
	ld e, a
	ld d, $00
	ld hl, Multicart_NoteFrequencyTable
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec c
	ld a, [bc]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [$df84]
	and $03
	cp $02
	jr nz, .asm_41dd
	ldh a, [$ff26]
	bit 2, a
	jr nz, .asm_41e1
.asm_41dd
	ld a, $80
	or h
	ld h, a
.asm_41e1
	set 3, c
	dec c
	ld a, h
	ld [bc], a
	dec c
	ld a, l
	ld [bc], a
	push hl
	inc c
	ld l, c
	ld h, b
	inc c
	res 3, l
	ld a, [bc]
	ld e, a
	inc c
	ld a, [bc]
	ld d, a
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	sub [hl]
	jr nc, .asm_41fd
	xor a
.asm_41fd
	dec l
	ld [hl], d
	dec l
	ld [hl], e
	dec l
	ld [hl], c
	ld c, a
	ld de, $df90
	ld a, [$df84]
	add e
	ld e, a
	ld a, c
	ld [de], a
	dec l
	dec l
	bit 7, [hl]
	jr nz, .asm_424e
	push hl
	ld hl, Multicart_ChannelRegisterPairs
	ld c, a
	ld a, [$df84]
	add a
	add l
	ld l, a
	ld a, $00
	adc h
	ld h, a
	ld a, c
	ld c, [hl]
	ldh [c], a
	dec c
	pop de
	ld a, $0B
	or e
	ld e, a
	ld a, [de]
	ldh [c], a
	inc hl
	ld c, [hl]
	ld hl, $df88
	ld a, [$df84]
	add l
	ld l, a
	ld a, [hl]
	ld b, a
	cpl
	ld e, a
	ldh a, [$ff25]
	and e
	swap e
	and e
	or b
	ldh [$ff25], a
	pop hl
	dec c
	ld a, l
	ldh [c], a
	inc c
	ld a, h
	ldh [c], a
	jr .asm_424f
.asm_424e
	pop hl
.asm_424f
	ld a, [$df84]
	ld b, a
	jp Multicart_Func_40bf
.asm_4256
	set 2, l
	swap c
	ld [hl], c
	inc l
	ld [hl], $80
	inc l
	ld e, [hl]
	inc l
	ld d, [hl]
	ld a, $0D
	xor l
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	ld a, [de]
	inc l
	sub [hl]
	jr nc, .asm_4274
	ld a, $08
.asm_4274
	ld b, a
	ld de, $df90
	ld a, [$df84]
	add e
	ld e, a
	ld a, b
	ld [de], a
	dec l
	res 2, l
	bit 7, [hl]
	jr nz, .asm_424f
	ldh [$ff21], a
	ld hl, $df88
	ld a, [$df84]
	add l
	ld l, a
	ld a, [hl]
	ld b, a
	cpl
	ld e, a
	ldh a, [$ff25]
	and e
	swap e
	and e
	or b
	ldh [$ff25], a
	ld a, c
	ldh [$ff22], a
	ld a, $80
	ldh [$ff23], a
	jr .asm_424f
Multicart_SoundCommandJumpTable:
	db $ca, $42, $e7, $42, $f2, $42, $01, $43, $0c, $43, $22, $43, $38, $43, $4f, $43
	db $5f, $43, $6a, $43, $77, $43, $9d, $43, $c1, $43, $09, $44, $c6, $42, $09, $44
Multicart_Func_42c6:
	pop hl
	jp Multicart_Func_4120

Multicart_Func_42ca:
	inc de
	ld a, [de]
	add a
	ld hl, Multicart_InstrumentPointers
	ld c, a
	ld b, $00
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	set 2, l
	inc l
	ld a, [bc]
	ld [hl], a
	inc bc
	inc l
	ld a, [bc]
	ld [hl], a
	res 1, l
	res 2, l
	jp Multicart_Func_4120

Multicart_Func_42e7:
	inc de
	ld a, [de]
	pop hl
	set 1, l
	ld [hl], a
	res 1, l
	jp Multicart_Func_4120

Multicart_Func_42f2:
	inc de
	pop hl
	ld a, $0C
	xor l
	ld l, a
	ld a, [de]
	ld [hl], a
	ld a, $0C
	xor l
	ld l, a
	jp Multicart_Func_4120

Multicart_Func_4301:
	inc de
	pop hl
	dec l
	dec l
	ld a, [de]
	ld [hl], a
	inc l
	inc l
	jp Multicart_Func_4120

Multicart_Func_430c:
	inc de
	ld a, [$df84]
	ld c, a
	add a
	add c
	ld hl, $dfa8
	add l
	ld l, a
	ld a, [de]
	ld [hl], a
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	pop hl
	jp Multicart_Func_4120

Multicart_Func_4322:
	ld a, [$df84]
	ld c, a
	add a
	add c
	ld hl, $dfa8
	add l
	ld l, a
	dec [hl]
	jr z, .asm_4334
	inc l
	ld e, [hl]
	inc l
	ld d, [hl]
.asm_4334
	pop hl
	jp Multicart_Func_4120

Multicart_Func_4338:
	ld a, [$df84]
	add a
	ld hl, $df98
	add l
	ld l, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld [hl], e
	ld e, c
	inc l
	ld [hl], d
	ld d, a
	pop hl
	jp Multicart_Func_4121

Multicart_Func_434f:
	ld a, [$df84]
	add a
	ld hl, $df98
	add l
	ld l, a
	ld e, [hl]
	inc l
	ld d, [hl]
	pop hl
	jp Multicart_Func_4120

Multicart_Func_435f:
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld e, c
	ld d, a
	pop hl
	jp Multicart_Func_4121

Multicart_Func_436a:
	inc de
	pop hl
	dec l
	dec l
	dec l
	ld a, [de]
	ld [hl], a
	inc l
	inc l
	inc l
	jp Multicart_Func_4120

Multicart_Func_4377:
	pop hl
	inc de
	ld a, [de]
	ld c, a
	ld a, [$df84]
	and a
	jr z, .asm_4387
	ld a, c
	ldh [$ff10], a
	jp Multicart_Func_4120
.asm_4387
	ld a, c
	ld [$df85], a
	dec l
	res 3, l
	set 2, [hl]
	bit 7, [hl]
	jp nz, .asm_4397
	ldh [$ff10], a
.asm_4397
	set 3, l
	inc l
	jp Multicart_Func_4120

Multicart_Func_439d:
	pop hl
	ld a, [$df84]
	and a
	jr z, .asm_43aa
	xor a
	ldh [$ff10], a
	jp Multicart_Func_4120
.asm_43aa
	xor a
	ld [$df85], a
	dec l
	res 3, l
	bit 7, [hl]
	res 2, [hl]
	jp nz, .asm_43bb
	xor a
	ldh [$ff10], a
.asm_43bb
	set 3, l
	inc l
	jp Multicart_Func_4120

Multicart_Func_43c1:
	ld a, [$df84]
	cp $06
	jr z, .asm_43e1
	ld hl, $df86
	inc de
	ld a, [de]
	ld [hli], a
	ld c, a
	inc de
	ld a, [de]
	ld [hl], a
	ld b, a
	pop hl
	add sp, -2
	dec l
	res 3, l
	bit 7, [hl]
	jr nz, .asm_43ea
	ld l, c
	ld h, b
	jr .asm_43e7
.asm_43e1
	inc de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	ld h, a
.asm_43e7
	call Multicart_Func_43ee
.asm_43ea
	pop hl
	jp Multicart_Func_4120
Multicart_Func_43ee:
	xor a
	ldh [$ff1c], a
	ldh [$ff1a], a
	ld a, $80
	ldh [$ff1e], a
	ld b, $10
	ld c, $30
.asm_43fb
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .asm_43fb
	ld a, $80
	ldh [$ff1a], a
	ld a, [$df84]
	ret

Multicart_Func_4409:
	pop hl
	dec hl
	res 3, l
	res 0, [hl]
	ld a, [$df84]
	cp $04
	jr nc, .asm_4434
	bit 7, [hl]
	jr nz, .asm_442d
.asm_441a
	ld hl, Multicart_ChannelRegisterPairs
	add a
	add l
	ld l, a
	ld a, $00
	adc h
	ld h, a
	ld c, [hl]
	ld a, $08
	ldh [c], a
	inc hl
	ld c, [hl]
	swap a
	ldh [c], a
.asm_442d
	ld a, [$df84]
	ld b, a
	jp Multicart_Func_40bf
.asm_4434
	res 6, l
	res 7, [hl]
	bit 0, [hl]
	ld a, [$df84]
	jr z, .asm_441a
	cp $04
	jr nz, .asm_444d
	xor a
	bit 2, [hl]
	jr z, .asm_444b
	ld a, [$df85]
.asm_444b
	ldh [$ff10], a
.asm_444d
	ld a, [$df84]
	res 2, a
	ld [$df84], a
	ld de, $df90
	add e
	ld e, a
	push hl
	ld a, [$df84]
	cp $02
	call z, .asm_44a2
	ld hl, $df88
	add l
	ld l, a
	ld a, [hl]
	ld b, a
	cpl
	ld c, a
	ldh a, [$ff25]
	and c
	swap c
	and c
	or b
	ldh [$ff25], a
	ld hl, Multicart_ChannelRegisterPairs
	ld a, [$df84]
	add a
	add l
	ld l, a
	ld a, $00
	adc h
	ld h, a
	ld c, [hl]
	ld a, [de]
	ldh [c], a
	dec c
	pop de
	ld a, $0B
	or e
	ld e, a
	ld a, [de]
	ldh [c], a
	inc hl
	ld c, [hl]
	dec c
	inc e
	ld a, [de]
	ldh [c], a
	inc e
	inc c
	ld a, [de]
	set 7, a
	ldh [c], a
	ld a, [$df84]
	set 2, a
	ld b, a
	jp Multicart_Func_40bf
.asm_44a2
	ld hl, $df86
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Multicart_Func_43ee
Multicart_NoteFrequencyTable:
	db $2c, $00, $9d, $00, $07, $01, $6b, $01, $c9, $01, $23, $02, $77, $02, $c7, $02
	db $12, $03, $58, $03, $9b, $03, $da, $03, $16, $04, $4e, $04, $83, $04, $b5, $04
	db $e5, $04, $11, $05, $3b, $05, $63, $05, $89, $05, $ac, $05, $ce, $05, $ed, $05
	db $0b, $06, $27, $06, $42, $06, $5b, $06, $72, $06, $89, $06, $9e, $06, $b2, $06
	db $c4, $06, $d6, $06, $e7, $06, $f7, $06, $06, $07, $14, $07, $21, $07, $2d, $07
	db $39, $07, $44, $07, $4f, $07, $59, $07, $62, $07, $6b, $07, $73, $07, $7b, $07
	db $83, $07, $8a, $07, $90, $07, $97, $07, $9d, $07, $a2, $07, $a7, $07, $ac, $07
	db $b1, $07, $b6, $07, $ba, $07, $be, $07, $c1, $07, $c5, $07, $c8, $07, $cb, $07
	db $ce, $07, $d1, $07, $d4, $07, $d6, $07, $d9, $07, $db, $07, $dd, $07, $df, $07
	db $e1, $07, $e2, $07, $e4, $07, $e6, $07, $e7, $07, $e9, $07, $ea, $07, $eb, $07
	db $ec, $07, $ed, $07, $ee, $07, $ef, $07
Multicart_SongHeaderPointers:
	db $86, $47, $87, $47, $c3, $48, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
	db $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
	db $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
	db $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
	db $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
	db $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
	db $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
	db $87, $47, $87, $47, $87, $47, $87, $47, $87, $47, $87, $47
Multicart_Table_45CF:
	db $8c, $1c, $2a, $a8, $e0, $15, $54, $70, $38, $c4, $60, $48, $a0, $c0, $d2, $5a
	db $3c, $50, $78, $40, $80, $3e, $21, $42, $6e, $ac, $62, $31, $3f, $46, $2d, $36
Multicart_unk_45EF:
	db $12, $14, $16, $18, $1a, $1c, $1e, $20, $22, $24, $26, $28, $2a, $2c, $2e, $30
Multicart_unk_45FF:
	db $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10
Multicart_InstrumentPointers:
	db $57, $46, $59, $46, $73, $46, $75, $46, $85, $46, $8d, $46, $8f, $46, $a9, $46
	db $ab, $46, $b3, $46, $b7, $46, $bd, $46, $c5, $46, $c7, $46, $c9, $46, $cb, $46
	db $d3, $46, $d5, $46, $d7, $46, $d9, $46, $db, $46, $df, $46, $e1, $46, $e7, $46
	db $e9, $46, $eb, $46, $f3, $46, $f5, $46, $fd, $46, $07, $47, $0f, $47, $11, $47
	db $19, $47, $1b, $47, $1d, $47
Multicart_SoundInstruments:
	db $23, $47, $ff, $f0, $12, $9b, $5a, $f0, $03, $f1, $0a, $d0, $04, $d1, $0a, $b0
	db $04, $b1, $0a, $90, $04, $91, $0a, $70, $04, $71, $0a, $50, $ff, $00, $ff, $20
	db $05, $a9, $02, $f0, $03, $f1, $14, $c0, $05, $b0, $05, $a0, $ff, $97, $ff, $00
	db $01, $d0, $0a, $f0, $0e, $f1, $ff, $00, $ff, $f1, $03, $c9, $50, $f0, $02, $f1
	db $0f, $d0, $02, $d1, $0f, $b0, $02, $b1, $0f, $90, $02, $91, $0f, $70, $02, $71
	db $0f, $50, $ff, $00, $ff, $f2, $02, $f1, $32, $d0, $ff, $d7, $ff, $00, $03, $f2
	db $ff, $00, $02, $f1, $ff, $a2, $ff, $00, $03, $f1, $23, $c0, $ff, $c7, $ff, $00
	db $3e, $20, $0b, $20, $ff, $f4, $03, $c9, $41, $f0, $ff, $f7, $ff, $00, $14, $20
	db $05, $20, $ff, $f3, $06, $20, $2d, $f0, $ff, $f7, $07, $20, $40, $f0, $ff, $f7
	db $ff, $00, $ff, $f7, $19, $20, $05, $a9, $0a, $f0, $ff, $f6, $ff, $00, $ff, $40
	db $03, $f1, $37, $c0, $ff, $c7, $ff, $00, $03, $e9, $03, $f1, $23, $c0, $ff, $c7
	db $ff, $00, $04, $20, $02, $00, $04, $40, $02, $00, $24, $19, $05, $f4, $01, $00
	db $05, $d4, $01, $00, $09, $20, $ff, $c4, $0a, $f2, $28, $d7, $ff, $00, $12, $20
	db $ff, $9d, $da, $42, $11, $11, $11, $23, $57, $8a, $ce, $ee, $ee, $ee, $b8, $52
	db $26, $bf, $fb, $63, $00, $00, $00, $01, $36, $9c, $ef, $ff, $ff, $ff, $c9, $40
	db $04, $8b, $de, $ee, $db, $74, $22, $22, $24, $8b, $de, $ee, $db, $74, $22, $22
	db $24, $bb, $bb, $bb, $bb, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $bb, $3b, $bb, $b3, $33, $3b, $bb, $bb, $33, $33, $33, $33, $33, $33, $33
	db $33, $cc, $dd, $dd, $cc, $bb, $aa, $99, $88, $77, $66, $55, $44, $33, $23, $23
	db $33
Multicart_SoundSongData:
	db $ff, $00, $93, $47, $01, $d9, $47, $02, $3f, $48, $03, $94, $48, $ff, $c0, $f2
	db $50, $f0, $12, $f1, $c0, $f4, $02, $f6, $ce, $47, $f3, $fe, $f6, $ce, $47, $f3
	db $fd, $f6, $ce, $47, $f3, $fb, $f6, $ce, $47, $f3, $00, $f5, $f2, $00, $f0, $0b
	db $f1, $00, $f6, $13, $48, $a6, $1a, $1c, $ab, $18, $f1, $80, $f6, $13, $48, $b9
	db $1a, $a1, $1c, $9d, $21, $f8, $95, $47, $a1, $26, $b9, $54, $a1, $26, $b9, $54
	db $a1, $26, $26, $f7, $c0, $f9, $02, $f0, $12, $f1, $c0, $f2, $50, $f4, $08, $a1
	db $28, $b4, $21, $54, $a1, $28, $b4, $21, $54, $a1, $28, $28, $f5, $f2, $60, $f0
	db $0b, $f1, $00, $be, $54, $f6, $13, $48, $a6, $1a, $1c, $ab, $18, $f1, $80, $f6
	db $13, $48, $b9, $1a, $a1, $1c, $9f, $21, $b0, $54, $f8, $dd, $47, $b9, $24, $a1
	db $23, $1f, $b9, $1c, $a1, $1a, $9a, $1c, $b1, $54, $21, $a0, $23, $90, $1f, $b9
	db $1c, $1a, $a0, $1c, $b1, $54, $91, $1c, $b9, $1c, $1d, $90, $1f, $b9, $1d, $1c
	db $a1, $1d, $a6, $1f, $1d, $a1, $1c, $92, $18, $f7, $c0, $fc, $36, $47, $f9, $01
	db $f0, $02, $f4, $08, $a1, $15, $b0, $21, $b8, $54, $a1, $15, $b0, $21, $b8, $54
	db $a1, $0c, $0e, $f5, $f4, $02, $f6, $80, $48, $f6, $80, $48, $f3, $f7, $f6, $80
	db $48, $f6, $80, $48, $f3, $fe, $f6, $80, $48, $f6, $80, $48, $f3, $fc, $f6, $80
	db $48, $f6, $80, $48, $f3, $00, $f5, $f8, $48, $48, $a1, $15, $b0, $21, $b8, $54
	db $a1, $15, $b0, $21, $b8, $54, $a0, $15, $b1, $54, $a0, $15, $b1, $54, $f7, $c0
	db $f2, $90, $f4, $02, $f0, $07, $a1, $05, $f0, $05, $b9, $02, $f5, $f0, $07, $a1
	db $05, $05, $f4, $02, $f0, $07, $a1, $05, $f0, $05, $b9, $02, $f5, $f0, $07, $a1
	db $05, $f0, $05, $b9, $05, $b4, $f2, $70, $06, $06, $f8, $96, $48, $05, $c6, $48
	db $ff, $c0, $f0, $00, $f1, $80, $b0, $30, $2b, $34, $2f, $37, $32, $ff, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8, $0f, $6f, $68, $6f
	db $0f, $60, $bf, $03, $bf, $b7, $03, $ef, $eb, $01, $6f, $6d, $0e, $6f, $ff, $ff
	db $ff, $ff, $ef, $ef, $ef, $ef, $af, $df, $ff, $ff, $fd, $fe, $80, $bf, $7b, $f3
	db $ef, $df, $ff, $ff, $01, $fd, $bb, $cf, $e7, $f7, $c0, $fe, $fe, $fe, $fe, $00
	db $ff, $ff, $07, $ff, $ff, $ff, $fb, $01, $ff, $ff, $c0, $df, $c0, $df, $c0, $fe
	db $de, $c0, $07, $f7, $07, $f7, $07, $ff, $f7, $03, $de, $be, $40, $fe, $fe, $00
	db $ff, $ff, $ff, $ef, $07, $ff, $fb, $01, $ff, $ff, $08, $6b, $08, $80, $b6, $80
	db $b6, $80, $6f, $6b, $6d, $81, $ef, $ef, $ef, $ef, $00, $ff, $80, $be, $80, $be
	db $ff, $ff, $6f, $ef, $d7, $db, $dd, $bd, $ff, $ff, $ef, $f7, $80, $dd, $eb, $00
	db $f7, $80, $ff, $f3, $8f, $bf, $bf, $81, $b7, $b7, $f5, $d6, $b7, $77, $f6, $f7
	db $ff, $ff, $b7, $b7, $77, $77, $f7, $f7, $ff, $ff, $f7, $f7, $80, $f7, $00, $f7
	db $f7, $80, $f7, $f7, $f7, $01, $f7, $f7, $b7, $d7, $f7, $f7, $f0, $87, $df, $ff
	db $ff, $ff, $d7, $f7, $f7, $f7, $d7, $ef, $ff, $ff, $df, $ef, $03, $f6, $ee, $e6
	db $ca, $aa, $df, $df, $df, $03, $db, $db, $03, $db, $6e, $ee, $ee, $ef, $ef, $ef
	db $ff, $ff, $db, $03, $db, $df, $df, $df, $ff, $ff, $ef, $ee, $ef, $03, $ec, $cd
	db $c7, $a8, $df, $03, $77, $af, $01, $bb, $df, $01, $af, $6f, $ef, $ee, $ed, $eb
	db $ff, $ff, $7f, $07, $77, $f7, $d7, $ef, $ff, $ff, $ee, $ee, $ed, $00, $eb, $c7
	db $cb, $ae, $ff, $07, $f7, $ef, $5f, $bf, $5f, $ef, $ad, $68, $e5, $ed, $ec, $ed
	db $ff, $ff, $f1, $03, $f7, $f7, $07, $f7, $ff, $ff, $81, $b7, $81, $b7, $81, $bf
	db $bf, $bf, $81, $ed, $81, $ed, $81, $fd, $fd, $fd, $bf, $bf, $bf, $bf, $bf, $bf
	db $ff, $ff, $fd, $fd, $fd, $fd, $ed, $f3, $ff, $ff, $f7, $eb, $dd, $be, $41, $ff
	db $88, $aa, $fb, $fb, $fb, $7b, $5b, $db, $db, $db, $aa, $88, $dd, $dd, $aa, $77
	db $ff, $ff, $db, $db, $fb, $fb, $eb, $77, $ff, $ff, $ff, $ff, $80, $ff, $ff, $ff
	db $ff, $c0, $ff, $f7, $03, $ff, $ff, $ff, $ef, $07, $ff, $ff, $ff, $ff, $00, $ff
	db $ff, $ff, $ff, $ff, $ff, $fb, $01, $ff, $ff, $ff, $00, $7f, $7f, $40, $7f, $41
	db $5d, $5d, $01, $6d, $75, $01, $7d, $7d, $75, $75, $41, $7f, $41, $7f, $00, $7f
	db $ff, $ff, $ad, $dd, $a9, $75, $01, $fd, $ff, $ff, $fe, $fe, $00, $fe, $fe, $fe
	db $80, $ff, $ff, $fb, $01, $ff, $ff, $ff, $03, $ff, $fd, $ae, $af, $af, $6f, $f0
	db $ff, $ff, $ff, $7f, $7b, $ed, $ed, $0f, $ff, $ff, $ff, $00, $fb, $83, $bf, $83
	db $fb, $00, $f7, $03, $7f, $07, $f7, $07, $7f, $03, $ff, $ad, $ae, $af, $6f, $e0
	db $ff, $ff, $ff, $f7, $fb, $6d, $ef, $0f, $ff, $ff, $ff, $80, $bb, $a0, $b1, $aa
	db $b0, $b0, $7f, $01, $ef, $83, $c7, $ab, $07, $07, $b7, $b0, $bd, $7b, $f7, $cf
	db $ff, $ff, $77, $07, $57, $07, $7d, $01, $ff, $ff, $f3, $c0, $df, $c0, $df, $c0
	db $df, $c0, $ff, $1f, $df, $1f, $df, $1f, $ff, $07, $df, $c0, $f7, $77, $00, $ff
	db $ff, $ff, $ff, $01, $fd, $7d, $7b, $e7, $ff, $ff, $f7, $80, $b6, $00, $b6, $80
	db $80, $b6, $df, $df, $df, $81, $7b, $fb, $bb, $bb, $80, $e7, $00, $db, $e7, $99
	db $ff, $ff, $bb, $d7, $ef, $d7, $b9, $7d, $ff, $ff, $ff, $04, $dd, $dc, $bd, $04
	db $b5, $b4, $fb, $01, $df, $03, $df, $03, $df, $01, $b7, $b5, $85, $b5, $ff, $ff
	db $ff, $ff, $fd, $55, $55, $55, $fd, $f3, $ff, $ff, $ef, $e8, $ed, $ee, $a7, $ab
	db $af, $6c, $f7, $03, $f7, $ef, $5f, $bf, $4f, $f1, $e3, $e8, $ef, $ef, $e0, $ef
	db $ff, $ff, $bb, $03, $bf, $bb, $01, $ff, $ff, $ff, $ff, $83, $bb, $ba, $b9, $83
	db $af, $ee, $bf, $83, $7b, $77, $af, $df, $af, $77, $a2, $af, $af, $a3, $0f, $bf
	db $ff, $ff, $f9, $07, $77, $77, $07, $77, $ff, $ff, $fe, $fe, $00, $fe, $fe, $c0
	db $df, $df, $ff, $fb, $01, $ff, $ff, $07, $f7, $f7, $c0, $fb, $fb, $f7, $ef, $1f
	db $ff, $ff, $07, $bf, $bf, $bd, $bd, $c1, $ff, $ff, $fb, $fb, $00, $fb, $fe, $e0
	db $ee, $ee, $bf, $bb, $01, $bf, $ff, $0f, $ef, $ef, $00, $fd, $fb, $f7, $cf, $3f
	db $ff, $ff, $01, $7f, $bf, $cf, $f1, $fb, $ff, $ff, $ef, $ee, $02, $ee, $ec, $da
	db $de, $ae, $3f, $db, $01, $df, $df, $03, $df, $df, $ae, $5e, $da, $ba, $82, $fa
	db $ff, $ff, $03, $df, $df, $db, $01, $ff, $ff, $ff, $f3, $0e, $b6, $d5, $df, $f7
	db $00, $f7, $fb, $f3, $ef, $df, $bd, $f9, $f7, $ef, $e3, $e4, $d6, $b7, $77, $f7
	db $ff, $ff, $df, $fd, $f9, $f7, $ef, $9f, $ff, $ff, $ef, $ee, $83, $ab, $ab, $ab
	db $ab, $83, $f7, $03, $df, $df, $df, $df, $df, $df, $af, $ef, $eb, $e1, $1d, $b8
	db $ff, $ff, $df, $df, $df, $df, $db, $01, $ff, $ff, $88, $aa, $88, $ff, $80, $b6
	db $80, $b6, $d7, $db, $df, $01, $df, $df, $db, $db, $80, $f7, $80, $f7, $f7, $f7
	db $ff, $ff, $d7, $ef, $cd, $b5, $79, $fd, $ff, $ff, $fe, $fe, $fe, $fe, $fe, $00
	db $fe, $fe, $ff, $ff, $ff, $ff, $fb, $01, $ff, $ff, $fe, $fe, $fe, $fe, $fe, $c0
	db $ff, $ff, $ff, $ff, $ff, $ff, $ef, $07, $ff, $ff, $bf, $cf, $ef, $78, $9f, $d7
	db $f7, $e8, $bf, $bf, $b7, $03, $bf, $bf, $bb, $01, $9f, $de, $dd, $d0, $db, $df
	db $ff, $ff, $7f, $ef, $f7, $03, $fb, $fb, $ff, $ff, $ff, $00, $fd, $fb, $fb, $f7
	db $e0, $d7, $fb, $01, $ff, $ff, $ff, $f7, $03, $f7, $b7, $77, $f7, $f7, $f0, $f7
	db $ff, $ff, $f7, $f7, $f7, $f7, $07, $f7, $ff, $ff, $ef, $01, $bb, $01, $ff, $81
	db $bd, $81, $7f, $03, $7f, $03, $fb, $03, $7f, $03, $bd, $bd, $81, $bd, $b5, $7b
	db $ff, $ff, $7f, $03, $7f, $03, $7d, $01, $ff, $ff, $ef, $ec, $df, $b7, $f7, $e8
	db $cf, $af, $f7, $03, $ff, $ff, $fb, $01, $ef, $ef, $6f, $ef, $ef, $ef, $ef, $ef
	db $ff, $ff, $ef, $ef, $ef, $ef, $af, $df, $ff, $ff, $ff, $80, $fe, $fe, $fe, $00
	db $fe, $fd, $f7, $03, $ff, $ff, $fb, $01, $ff, $7f, $fb, $fb, $f7, $ef, $df, $3f
	db $ff, $ff, $bf, $bf, $df, $ef, $f1, $fb, $ff, $ff, $ff, $00, $fd, $fd, $fd, $fd
	db $fd, $fd, $fb, $01, $ff, $ff, $7f, $bf, $cf, $ef, $fd, $fd, $fd, $fd, $fd, $fd
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ef, $ef, $ec, $03, $ee, $ea
	db $e6, $cf, $7f, $b7, $03, $ff, $f7, $f7, $f7, $6f, $2f, $ef, $ef, $ef, $a8, $df
	db $ff, $ff, $6f, $5f, $df, $bb, $01, $ff, $ff, $ff, $ef, $01, $ef, $07, $74, $6f
	db $5f, $6c, $ef, $01, $ef, $df, $01, $77, $af, $01, $75, $75, $2c, $5d, $7d, $7a
	db $ff, $ff, $6f, $03, $ef, $01, $ef, $01, $ff, $ff, $ff, $fc, $05, $dc, $dd, $dc
	db $05, $dc, $fb, $01, $df, $03, $df, $03, $df, $01, $df, $dd, $c5, $1b, $bf, $ff
	db $ff, $ff, $fd, $55, $55, $55, $fd, $f3, $ff, $ff, $e0, $ef, $e8, $ef, $e8, $00
	db $dd, $c0, $0f, $ef, $2f, $ef, $2f, $01, $ff, $07, $c1, $dd, $c1, $1d, $fd, $fc
	db $ff, $ff, $6f, $af, $df, $af, $71, $fb, $ff, $ff, $fd, $fe, $00, $ff, $e0, $ef
	db $e0, $ff, $ff, $fb, $01, $ff, $0f, $ef, $0f, $ff, $80, $bf, $b0, $b7, $b0, $bf
	db $ff, $ff, $03, $fb, $1b, $db, $1b, $f3, $ff, $ff, $de, $dd, $db, $d8, $05, $da
	db $d8, $df, $b7, $b7, $2f, $83, $b7, $ab, $03, $bb, $88, $55, $dd, $da, $d7, $df
	db $ff, $ff, $01, $bb, $d7, $ef, $55, $b9, $ff, $ff, $fd, $fe, $80, $bd, $76, $d7
	db $b4, $f3, $ff, $ff, $01, $fd, $db, $37, $fb, $ef, $88, $fe, $de, $de, $c0, $df
	db $ff, $ff, $0f, $ff, $f7, $f7, $07, $f7, $ff, $ff, $fd, $fb, $f7, $ef, $df, $00
	db $ff, $ff, $ff, $ff, $df, $ef, $f7, $03, $fd, $ff, $c0, $df, $df, $df, $c0, $df
	db $ff, $ff, $07, $f7, $f7, $f7, $07, $f7, $ff, $ff, $00, $fe, $80, $ae, $76, $ee
	db $fe, $c0, $01, $ff, $01, $ed, $db, $ef, $ff, $07, $de, $c0, $de, $c0, $fe, $ff
	db $ff, $ff, $f7, $07, $f7, $07, $ff, $03, $ff, $ff, $83, $bb, $83, $ff, $c0, $de
	db $c0, $de, $83, $bb, $83, $ff, $07, $f7, $07, $f7, $c0, $fe, $00, $fe, $fe, $fe
	db $ff, $ff, $07, $ff, $01, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $80, $fe, $c0, $de
	db $c0, $de, $ff, $ff, $03, $ff, $07, $f7, $07, $f7, $c0, $fe, $00, $fe, $fe, $fe
	db $ff, $ff, $07, $ff, $01, $ff, $ff, $ff, $ff, $ff, $df, $dd, $de, $08, $de, $df
	db $cc, $df, $6f, $6b, $67, $01, $f7, $6f, $03, $bf, $9c, $5f, $d8, $df, $5e, $b9
	db $ff, $ff, $07, $bf, $01, $77, $f9, $fd, $ff, $ff, $7d, $bd, $f0, $0b, $e8, $db
	db $bb, $7b, $ef, $df, $43, $ff, $43, $77, $6f, $43, $b7, $df, $dd, $de, $bf, $40
	db $ff, $ff, $77, $77, $57, $ef, $ff, $01, $ff, $ff, $f7, $f0, $80, $b7, $a0, $b7
	db $b8, $a0, $ef, $ef, $6b, $6d, $81, $ef, $ed, $6b, $bf, $a0, $af, $a0, $b6, $60
	db $ff, $ff, $e7, $6f, $4d, $75, $f9, $7d, $ff, $ff, $f0, $fe, $fe, $fe, $fe, $fe
	db $fe, $fe, $0f, $7f, $7f, $7f, $7f, $7f, $7f, $7f, $fe, $fe, $fe, $fe, $f0, $ff
	db $ff, $ff, $7f, $7f, $7f, $7f, $0f, $ff, $ff, $ff, $ff, $83, $bb, $b9, $82, $ee
	db $ef, $a6, $5f, $5f, $5f, $5b, $53, $4f, $5f, $4f, $ad, $ab, $a3, $0e, $bd, $f3
	db $ff, $ff, $57, $57, $5f, $dd, $dd, $e1, $ff, $ff, $f7, $f0, $ef, $df, $80, $5e
	db $de, $c0, $ff, $1f, $bf, $77, $03, $f7, $f7, $07, $dd, $fb, $fb, $f7, $ef, $9f
	db $ff, $ff, $77, $7f, $5d, $6d, $7d, $81, $ff, $ff, $ff, $00, $7f, $7f, $60, $6f
	db $6f, $6f, $fb, $01, $fb, $fb, $1b, $db, $db, $db, $6f, $60, $6f, $7f, $00, $7f
	db $ff, $ff, $db, $1b, $db, $fb, $03, $fb, $ff, $ff, $ff, $80, $ef, $dd, $be, $80
	db $f7, $f7, $fd, $7d, $ed, $ed, $ed, $6d, $6d, $ed, $80, $f7, $f7, $f0, $07, $bf
	db $ff, $ff, $ed, $ed, $ed, $7d, $f5, $fb, $ff, $ff, $fe, $fe, $c0, $fe, $fe, $00
	db $fc, $fa, $ff, $ef, $07, $ff, $fb, $01, $7f, $bf, $f6, $ee, $de, $be, $fe, $fe
	db $ff, $ff, $df, $ef, $f1, $fb, $ff, $ff, $ff, $ff, $fe, $fe, $00, $f6, $ee, $d6
	db $3a, $fe, $ff, $fb, $01, $ef, $df, $af, $73, $ff, $fa, $f6, $ee, $de, $3e, $fe
	db $ff, $ff, $bf, $df, $ef, $f7, $f9, $ff, $ff, $ff, $f7, $f4, $ed, $ec, $cd, $ac
	db $6d, $ec, $f7, $03, $f7, $07, $f7, $07, $f7, $07, $ed, $ed, $e0, $ee, $ec, $eb
	db $ff, $ff, $f7, $f7, $01, $ef, $f3, $fb, $ff, $ff, $dd, $b0, $0b, $d8, $ab, $08
	db $fe, $80, $f7, $2d, $a3, $37, $ad, $21, $ff, $03, $fe, $f6, $ee, $de, $3e, $fe
	db $ff, $ff, $ff, $df, $ef, $f3, $fb, $ff, $ff, $ff, $ef, $f5, $00, $bd, $dd, $db
	db $00, $ff, $bf, $81, $bb, $b7, $af, $b7, $bb, $bd, $81, $bd, $bd, $bd, $81, $bd
	db $ff, $ff, $bd, $9d, $ab, $b7, $bf, $bf, $ff, $ff, $ff, $ff, $02, $ef, $ee, $ec
	db $87, $ee, $bf, $b7, $03, $7f, $f7, $03, $fb, $af, $ee, $ee, $e2, $0d, $bb, $f7
	db $ff, $ff, $af, $af, $af, $af, $af, $f1, $ff, $ff, $ff, $ff, $04, $df, $dd, $de
	db $06, $df, $d7, $db, $01, $df, $db, $db, $d7, $8f, $df, $de, $c5, $1f, $bf, $ff
	db $ff, $ff, $4f, $d7, $d9, $db, $5f, $bf, $ff, $ff, $ef, $d6, $ba, $7e, $82, $ee
	db $ee, $02, $fb, $01, $fb, $03, $fb, $03, $ff, $bb, $ee, $6c, $aa, $c6, $ee, $02
	db $ff, $ff, $d7, $ef, $f7, $db, $bd, $7d, $ff, $ff, $bf, $c8, $ef, $7f, $9c, $dd
	db $f5, $f5, $fb, $01, $fb, $fb, $1b, $db, $db, $db, $ed, $6c, $9d, $df, $df, $df
	db $ff, $ff, $db, $1b, $db, $fb, $eb, $f7, $ff, $ff, $fe, $fe, $fe, $80, $be, $be
	db $be, $80, $ff, $ff, $fb, $01, $fb, $fb, $fb, $03, $be, $fe, $fe, $fe, $fe, $fe
	db $ff, $ff, $fb, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $ee, $f5, $80, $fb, $00
	db $ef, $d0, $ff, $ef, $df, $03, $bf, $01, $ef, $17, $3e, $e0, $fe, $80, $fe, $fc
	db $ff, $ff, $f9, $0f, $ff, $03, $ff, $ff, $ff, $ff, $f7, $f7, $ef, $e0, $de, $de
	db $9d, $6d, $bf, $bf, $bf, $bf, $9f, $af, $b7, $b9, $f5, $fb, $f7, $ef, $df, $ff
	db $ff, $ff, $bd, $bf, $bf, $bf, $bf, $bf, $ff, $ff, $ff, $80, $fe, $ee, $ee, $ee
	db $d6, $d6, $f7, $03, $ff, $ef, $ef, $ef, $d7, $d7, $ba, $7a, $fe, $fe, $00, $ff
	db $ff, $ff, $bb, $7b, $ff, $fb, $01, $ff, $ff, $ff, $ef, $df, $28, $b7, $cf, $34
	db $e5, $d5, $77, $77, $01, $77, $77, $01, $dd, $dd, $34, $e5, $95, $f5, $b4, $cd
	db $ff, $ff, $01, $dd, $dd, $dd, $01, $fd, $ff, $ff, $f4, $f7, $ef, $ef, $cf, $af
	db $60, $ef, $03, $f7, $ef, $df, $bf, $bb, $01, $df, $ef, $ef, $ef, $ef, $ee, $ef
	db $ff, $ff, $df, $df, $df, $df, $bf, $7f, $ff, $ff, $fb, $fc, $fe, $00, $fb, $fb
	db $f8, $fb, $ff, $ff, $fb, $01, $ff, $ef, $07, $ef, $fb, $f7, $ef, $df, $be, $7f
	db $ff, $ff, $ef, $ef, $ef, $ef, $df, $3f, $ff, $ff, $be, $bd, $b8, $0b, $b8, $bb
	db $b8, $ba, $ff, $ff, $03, $bb, $03, $bb, $03, $db, $be, $ae, $9e, $3e, $fd, $f3
	db $ff, $ff, $df, $db, $d5, $c1, $dd, $c1, $ff, $ff, $fd, $fe, $80, $bb, $77, $fe
	db $fe, $00, $ff, $ff, $01, $bd, $db, $bf, $db, $01, $fe, $fd, $fb, $f7, $cf, $3f
	db $ff, $ff, $ff, $7f, $bf, $cf, $f1, $fb, $ff, $ff, $ef, $01, $ef, $83, $83, $29
	db $01, $01, $87, $b7, $71, $07, $af, $df, $21, $ef, $e0, $80, $fe, $00, $fe, $f8
	db $ff, $ff, $1f, $03, $ff, $01, $ff, $ff, $ff, $ff, $fb, $00, $fb, $ff, $02, $f7
	db $ef, $ae, $bf, $01, $bf, $df, $01, $bf, $77, $03, $a3, $af, $a1, $0f, $be, $fd
	db $ff, $ff, $ff, $57, $57, $57, $d7, $f9, $ff, $ff, $f7, $01, $f7, $ff, $80, $dd
	db $ee, $ee, $df, $01, $df, $f7, $0f, $f7, $e7, $df, $00, $f6, $e6, $ce, $be, $7e
	db $ff, $ff, $01, $bf, $df, $ef, $f1, $fb, $ff, $ff, $ff, $f7, $03, $ef, $e8, $ef
	db $ef, $ef, $7f, $7f, $7f, $7b, $01, $7b, $7b, $7b, $e2, $0e, $be, $fd, $fb, $f7
	db $ff, $ff, $fb, $fb, $fb, $bb, $d7, $ef, $ff, $ff, $fe, $fe, $80, $fe, $fe, $00
	db $fe, $fd, $ff, $f7, $03, $ff, $fb, $01, $ff, $7f, $fd, $fb, $fb, $f7, $ef, $9f
	db $ff, $ff, $7f, $bf, $bf, $cf, $f1, $fb, $ff, $ff, $ff, $c0, $ff, $ff, $fe, $fe
	db $00, $fe, $ef, $07, $df, $bf, $7f, $fb, $01, $ff, $fe, $fe, $fe, $fe, $fa, $fd
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fe, $fe, $00, $fe
	db $fe, $fd, $ff, $ff, $ff, $fb, $01, $ff, $ff, $7f, $fd, $fb, $fb, $f7, $ef, $9f
	db $ff, $ff, $bf, $bf, $df, $ef, $f1, $fb, $ff, $ff, $f7, $e0, $df, $bf, $40, $de
	db $de, $c0, $ff, $0f, $bf, $7f, $07, $f7, $f7, $07, $de, $c0, $ff, $db, $bd, $7e
	db $ff, $ff, $f7, $07, $ff, $77, $b9, $dd, $ff, $ff, $ff, $fe, $06, $75, $73, $74
	db $77, $77, $7f, $fb, $01, $ff, $ff, $07, $ef, $df, $77, $07, $76, $fd, $fd, $fe
	db $ff, $ff, $bf, $7f, $ff, $fd, $fd, $01, $ff, $ff, $fe, $fd, $fb, $f7, $ee, $de
	db $3e, $f6, $ff, $7f, $bf, $df, $ef, $f1, $fb, $ff, $f6, $f6, $f6, $f6, $f6, $00
	db $ff, $ff, $0f, $ff, $ff, $ff, $fb, $01, $ff, $ff, $eb, $19, $da, $db, $00, $db
	db $cb, $da, $df, $bf, $83, $3b, $83, $bb, $83, $bf, $99, $5b, $d3, $db, $5a, $bc
	db $ff, $ff, $83, $81, $d5, $a9, $fd, $f3, $ff, $ff, $df, $df, $de, $04, $da, $de
	db $d6, $ce, $5f, $6f, $eb, $01, $ef, $eb, $01, $ef, $9e, $5e, $de, $de, $5e, $be
	db $ff, $ff, $eb, $01, $ef, $eb, $01, $ff, $ff, $ff, $bf, $cf, $ef, $ff, $f0, $ee
	db $ed, $dd, $7f, $7f, $7b, $73, $6f, $1f, $3f, $5f, $1b, $db, $d7, $cf, $dd, $de
	db $ff, $ff, $6f, $77, $71, $7b, $7f, $ff, $ff, $ff, $ff, $00, $fd, $fb, $fb, $f7
	db $e0, $d7, $fb, $01, $ff, $ff, $ff, $f7, $03, $f7, $b7, $77, $f7, $f7, $f0, $f7
	db $ff, $ff, $f7, $f7, $f7, $f7, $07, $f7, $ff, $ff, $ff, $80, $be, $be, $be, $be
	db $80, $be, $fb, $01, $fb, $fb, $fb, $fb, $03, $fb, $be, $be, $be, $be, $80, $bf
	db $ff, $ff, $fb, $fb, $fb, $fb, $03, $fb, $ff, $ff, $f7, $f7, $01, $f7, $f5, $fe
	db $00, $fb, $df, $db, $01, $df, $df, $fb, $01, $ff, $f8, $fb, $f7, $ef, $df, $bf
	db $ff, $ff, $0f, $ef, $ef, $ef, $5f, $bf, $ff, $ff, $ff, $c0, $de, $dd, $d0, $d7
	db $d0, $d7, $fb, $01, $ff, $ff, $07, $f7, $07, $f7, $d0, $df, $bb, $b7, $6d, $fe
	db $ff, $ff, $07, $7f, $6f, $73, $7b, $ff, $ff, $ff, $ff, $fb, $fb, $f7, $f7, $ef
	db $de, $3e, $3f, $7f, $bf, $bf, $df, $ef, $f1, $fb, $fd, $fb, $f7, $ef, $c0, $ef
	db $ff, $ff, $ff, $ff, $bf, $df, $0f, $ef, $ff, $ff, $fd, $fe, $fe, $80, $fe, $fe
	db $fe, $fe, $ff, $ff, $f7, $03, $ff, $ff, $ff, $ef, $c0, $fe, $fe, $fe, $fe, $00
	db $ff, $ff, $07, $ff, $ff, $ff, $fb, $01, $ff, $ff, $7f, $9d, $de, $fe, $0f, $e8
	db $de, $be, $bf, $b7, $b7, $af, $bf, $01, $9f, $af, $dd, $db, $df, $df, $af, $70
	db $ff, $ff, $b3, $bb, $bf, $bf, $ff, $01, $ff, $ff, $dd, $ac, $77, $fc, $05, $df
	db $de, $06, $6b, $21, $7b, $21, $6b, $39, $03, $fb, $de, $de, $56, $8e, $de, $05
	db $ff, $ff, $03, $fb, $03, $fb, $03, $fd, $ff, $ff, $7d, $9d, $fc, $7b, $97, $ff
	db $de, $3d, $ff, $ff, $01, $bd, $bb, $5f, $ef, $f7, $bb, $80, $db, $db, $db, $00
	db $ff, $ff, $f9, $07, $b7, $b7, $b7, $01, $ff, $ff, $7e, $90, $de, $fe, $78, $9b
	db $d8, $ff, $ef, $01, $ef, $0f, $03, $bb, $03, $bf, $e8, $df, $30, $be, $bd, $bb
	db $ff, $ff, $03, $bf, $01, $f7, $fb, $fb, $ff, $ff, $ef, $e8, $db, $d8, $9f, $40
	db $dd, $db, $ef, $07, $ef, $0f, $7f, $03, $5f, $67, $d7, $fe, $c0, $fe, $fe, $00
	db $ff, $ff, $77, $7f, $07, $ff, $ff, $01, $ff, $ff, $fe, $00, $41, $f6, $c1, $f7
	db $80, $e0, $ff, $01, $05, $ef, $01, $ab, $83, $0f, $ef, $e0, $e0, $ef, $e0, $df
	db $ff, $ff, $ef, $0f, $2f, $ef, $0f, $f7, $ff, $ff, $ff, $00, $fb, $83, $bf, $83
	db $fb, $00, $f7, $03, $7f, $07, $f7, $07, $7f, $03, $ff, $ad, $ae, $af, $6f, $e0
	db $ff, $ff, $ff, $f7, $fb, $6d, $ef, $0f, $ff, $ff, $ff, $80, $bb, $a0, $b1, $aa
	db $b0, $b0, $7f, $01, $ef, $83, $c7, $ab, $07, $07, $b7, $b0, $bd, $7b, $f7, $cf
	db $ff, $ff, $77, $07, $57, $07, $7d, $01, $ff, $ff, $df, $df, $d8, $03, $db, $d8
	db $db, $db, $df, $d7, $01, $df, $df, $5b, $5b, $57, $c3, $1b, $ba, $f7, $f7, $ef
	db $ff, $ff, $6f, $6f, $cf, $ad, $75, $f9, $ff, $ff, $de, $dd, $06, $54, $55, $54
	db $56, $06, $db, $b7, $db, $01, $ad, $01, $b7, $07, $de, $de, $d6, $d6, $04, $f7
	db $ff, $ff, $b7, $07, $b5, $b5, $09, $fd, $ff, $ff, $df, $81, $76, $c0, $fe, $00
	db $fe, $c0, $df, $81, $77, $0f, $ef, $01, $ef, $0f, $fe, $80, $fe, $00, $fe, $fe
	db $ff, $ff, $ff, $03, $ff, $01, $ff, $ff, $ff, $ff, $ef, $f7, $80, $dd, $eb, $00
	db $f7, $80, $ff, $f3, $8f, $bf, $bf, $81, $b7, $b7, $f5, $d6, $b7, $77, $f6, $f7
	db $ff, $ff, $b7, $b7, $77, $77, $f7, $f7, $ff, $ff, $7d, $9c, $db, $fc, $1d, $dd
	db $f0, $ed, $ff, $03, $ff, $07, $77, $b7, $01, $77, $ed, $1b, $d8, $df, $df, $df
	db $ff, $ff, $b7, $b7, $03, $f7, $d7, $ef, $ff, $ff, $ff, $80, $fb, $fb, $fb, $83
	db $bf, $bf, $f7, $03, $bf, $bf, $bf, $83, $fb, $fb, $bf, $83, $fb, $fb, $fb, $00
	db $ff, $ff, $fb, $83, $bf, $bf, $bf, $01, $ff, $ff, $de, $e6, $f2, $fa, $fe, $00
	db $fe, $fa, $f7, $e7, $df, $bf, $fb, $01, $ff, $bf, $f6, $ee, $de, $3e, $fe, $fe
	db $ff, $ff, $df, $ef, $f1, $fb, $ff, $ff, $ff, $ff, $fe, $fe, $c0, $fd, $fb, $f7
	db $00, $ff, $ff, $ef, $07, $7f, $bf, $db, $01, $ef, $e0, $ef, $ef, $e0, $ff, $ff
	db $ff, $ff, $6f, $6f, $6f, $6f, $af, $df, $ff, $ff, $ff, $02, $ee, $ee, $ee, $e2
	db $0e, $bd, $ef, $07, $6f, $af, $af, $ed, $ed, $f1, $ff, $ad, $ae, $af, $6f, $f0
	db $ff, $ff, $ff, $fb, $7d, $6d, $ed, $0f, $ff, $ff, $f8, $f7, $e8, $df, $00, $d6
	db $da, $c0, $3f, $df, $2f, $f7, $01, $d7, $b7, $07, $ff, $e0, $ef, $e0, $ef, $e0
	db $ff, $ff, $ff, $0f, $ef, $0f, $ef, $0f, $ff, $ff, $eb, $aa, $c9, $00, $ff, $dd
	db $eb, $80, $f7, $f7, $f7, $f7, $81, $f7, $f7, $f7, $f7, $f7, $80, $f7, $f7, $80
	db $ff, $ff, $b7, $d7, $f7, $f7, $d7, $ef, $ff, $ff, $ef, $ef, $ef, $ed, $00, $ed
	db $ed, $ed, $ff, $ff, $ff, $83, $bb, $bb, $bb, $bb, $ed, $ed, $ed, $dd, $b5, $7b
	db $ff, $ff, $bb, $bb, $bb, $bb, $83, $bb, $ff, $ff, $bf, $cf, $ef, $78, $9b, $db
	db $f3, $eb, $bf, $bf, $bb, $01, $bb, $bb, $bb, $bb, $d8, $1b, $db, $db, $d8, $db
	db $ff, $ff, $03, $bb, $bb, $bb, $03, $fb, $ff, $ff, $df, $df, $dc, $dd, $05, $dd
	db $dc, $dd, $ff, $f7, $03, $f7, $f7, $f7, $07, $f7, $dd, $c4, $1d, $bf, $ff, $f0
	db $ff, $ff, $f7, $07, $f7, $ff, $ff, $01, $ff, $ff, $fd, $fe, $80, $bf, $7f, $f0
	db $f7, $f0, $ff, $ff, $01, $fd, $db, $0f, $df, $1f, $fd, $e0, $ef, $ef, $e0, $ef
	db $ff, $ff, $ff, $0f, $ef, $ef, $0f, $ef, $ff, $ff, $fd, $fe, $ff, $80, $ff, $ff
	db $ff, $fe, $ff, $ff, $ef, $07, $df, $bf, $7f, $ff, $fd, $f3, $cf, $b7, $f8, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $01, $ff, $ff, $ff, $f7, $eb, $dd, $be, $41, $ff
	db $88, $aa, $fb, $fb, $fb, $7b, $5b, $db, $db, $db, $aa, $88, $dd, $dd, $aa, $77
	db $ff, $ff, $db, $db, $fb, $fb, $eb, $77, $ff, $ff, $ff, $04, $77, $6e, $5e, $6e
	db $76, $76, $df, $01, $df, $03, $db, $03, $db, $03, $76, $77, $2f, $5e, $7d, $7f
	db $ff, $ff, $db, $8f, $57, $d9, $dd, $df, $ff, $ff, $ff, $f8, $0f, $6f, $68, $6f
	db $0f, $60, $bf, $03, $bf, $b7, $03, $ef, $eb, $01, $6f, $6d, $0e, $6f, $ff, $ff
	db $ff, $ff, $ef, $ef, $ef, $ef, $af, $df, $ff, $ff, $81, $bd, $81, $bd, $81, $bf
	db $bf, $b8, $81, $bd, $81, $bd, $81, $fd, $fd, $1d, $bb, $b8, $bb, $b8, $bf, $bf
	db $ff, $ff, $dd, $1d, $dd, $1d, $fd, $f3, $ff, $ff, $f7, $e0, $df, $80, $de, $c0
	db $de, $40, $ff, $0f, $df, $07, $f7, $07, $f7, $05, $77, $c0, $df, $c0, $df, $c0
	db $ff, $ff, $dd, $07, $f7, $07, $f7, $07, $ff, $ff, $f7, $f7, $f0, $87, $f7, $81
	db $f7, $f7, $83, $bb, $bb, $b7, $b7, $af, $b7, $bb, $00, $ef, $ef, $df, $bf, $ff
	db $ff, $ff, $bd, $9d, $ab, $b7, $bf, $bf, $ff, $ff, $ff, $ff, $80, $ff, $ff, $ff
	db $ff, $c0, $ff, $f7, $03, $ff, $ff, $ff, $ef, $07, $ff, $ff, $ff, $ff, $00, $ff
	db $ff, $ff, $ff, $ff, $ff, $fb, $01, $ff, $ff, $ff, $fe, $de, $de, $de, $00, $de
	db $de, $de, $ef, $ef, $ef, $ef, $01, $ef, $ef, $ef, $de, $de, $de, $df, $df, $e0
	db $ff, $ff, $ef, $0f, $ef, $ff, $ff, $03, $ff, $ff, $dd, $dd, $04, $52, $56, $50
	db $06, $5e, $ff, $fb, $01, $db, $db, $1b, $db, $db, $d6, $c5, $15, $bb, $f7, $ef
	db $ff, $ff, $db, $db, $43, $9b, $bf, $ff, $ff, $ff, $ef, $ee, $ee, $82, $a9, $a8
	db $ab, $83, $df, $df, $03, $df, $df, $01, $9f, $8f, $ef, $eb, $e2, $09, $bb, $ff
	db $ff, $ff, $4f, $57, $d1, $db, $df, $df, $ff, $ff, $fc, $fb, $f7, $e8, $df, $b0
	db $77, $f0, $7f, $bf, $df, $2f, $f7, $1b, $dd, $1f, $f7, $f0, $f7, $f7, $f5, $e3
	db $ff, $ff, $df, $1f, $ef, $5f, $bf, $c3, $ff, $ff, $ff, $80, $ff, $ff, $e0, $ef
	db $ef, $ef, $f7, $03, $ff, $ef, $07, $ef, $ef, $ef, $e0, $ff, $f7, $fb, $fb, $00
	db $ff, $ff, $0f, $ff, $df, $bf, $7b, $01, $ff, $ff, $ff, $80, $ed, $ed, $00, $ed
	db $ed, $dc, $fb, $7b, $db, $db, $5b, $db, $fb, $eb, $be, $fe, $80, $fe, $fe, $00
	db $ff, $ff, $f7, $ff, $03, $ff, $fb, $01, $ff, $ff, $fd, $fe, $00, $ff, $e0, $ef
	db $e0, $ff, $ff, $fb, $01, $ff, $0f, $ef, $0f, $ff, $80, $bf, $b0, $b7, $b0, $bf
	db $ff, $ff, $03, $fb, $1b, $db, $1b, $f3, $ff, $ff, $00, $de, $be, $00, $9c, $aa
	db $b6, $aa, $01, $f7, $fb, $01, $73, $ab, $db, $ab, $9c, $aa, $b6, $aa, $9c, $be
	db $ff, $ff, $73, $ab, $db, $ab, $7b, $f3, $ff, $ff, $ef, $6c, $ab, $a6, $ef, $04
	db $ce, $c6, $df, $01, $df, $03, $df, $01, $03, $fb, $aa, $6e, $ee, $ee, $ee, $ed
	db $ff, $ff, $03, $fb, $03, $fb, $eb, $f7, $ff, $ff, $ff, $c0, $fe, $00, $66, $66
	db $8c, $ad, $ff, $07, $ff, $01, $cd, $cd, $63, $6b, $8c, $c0, $ee, $d6, $ba, $00
	db $ff, $ff, $63, $07, $ef, $d7, $bb, $01, $ff, $ff, $ec, $ec, $e9, $64, $ae, $a8
	db $ae, $e0, $07, $17, $f7, $07, $ef, $03, $ef, $01, $ee, $ed, $d2, $d7, $be, $7d
	db $ff, $ff, $ef, $b7, $a9, $1b, $af, $b7, $ff, $ff, $00, $ef, $e0, $ce, $b5, $fb
	db $f6, $ce, $7b, $db, $db, $db, $db, $fb, $eb, $f7, $00, $fb, $f3, $ea, $99, $f3
	db $ff, $ff, $01, $6f, $9f, $cf, $f1, $fb, $ff, $ff, $ef, $df, $80, $7f, $db, $db
	db $80, $db, $ff, $f7, $03, $ff, $6f, $6f, $03, $6f, $db, $db, $00, $d6, $bb, $7d
	db $ff, $ff, $6f, $6b, $01, $ef, $73, $bb, $ff, $ff, $ef, $ef, $01, $ee, $81, $ab
	db $ab, $83, $bf, $83, $7b, $f7, $03, $7b, $03, $7b, $c7, $cb, $ab, $6f, $ef, $ee
	db $ff, $ff, $03, $7b, $03, $b7, $7b, $fb, $ff, $ff, $f3, $0e, $b6, $d5, $df, $f7
	db $00, $f7, $fb, $f3, $ef, $df, $bd, $f9, $f7, $ef, $e3, $e4, $d6, $b7, $77, $f7
	db $ff, $ff, $df, $fd, $f9, $f7, $ef, $9f, $ff, $ff, $ef, $ee, $83, $ab, $ab, $ab
	db $ab, $83, $f7, $03, $df, $df, $df, $df, $df, $df, $af, $ef, $eb, $e1, $1d, $b8
	db $ff, $ff, $df, $df, $df, $df, $db, $01, $ff, $ff, $ef, $e8, $ed, $81, $ec, $01
	db $ec, $ad, $ff, $1f, $bf, $83, $3b, $ab, $2b, $b7, $a1, $ad, $a8, $8f, $6f, $f0
	db $ff, $ff, $ab, $ad, $1d, $bf, $bf, $01, $ff, $ff, $ef, $e8, $ed, $ee, $a7, $ab
	db $af, $6c, $f7, $03, $f7, $ef, $5f, $bf, $4f, $f1, $e3, $e8, $ef, $ef, $e0, $ef
	db $ff, $ff, $bb, $03, $bf, $bb, $01, $ff, $ff, $ff, $ff, $df, $dd, $dd, $dd, $04
	db $d9, $dd, $bf, $bf, $bf, $b7, $83, $37, $b7, $b7, $dd, $dd, $dd, $c5, $1d, $be
	db $ff, $ff, $b7, $af, $bd, $fd, $fd, $01, $ff, $ff, $fe, $fe, $c0, $de, $de, $c0
	db $de, $f6, $ff, $f7, $03, $f7, $f7, $07, $f7, $ff, $fa, $fd, $fa, $f7, $cf, $3f
	db $ff, $ff, $ff, $ff, $7f, $9f, $e1, $fb, $ff, $ff, $ef, $ee, $ef, $01, $dd, $dd
	db $bd, $db, $ff, $03, $fb, $7b, $7b, $7b, $7b, $77, $eb, $f7, $eb, $dd, $be, $f9
	db $ff, $ff, $af, $df, $af, $77, $f1, $fb, $ff, $ff, $ff, $bf, $bf, $bf, $bf, $bb
	db $81, $bf, $7f, $7f, $7f, $7f, $7f, $7b, $01, $7f, $bf, $bf, $bf, $b9, $a7, $8f
	db $ff, $ff, $7f, $7f, $7d, $7d, $7d, $81, $ff, $ff, $f7, $e2, $0e, $ee, $02, $ef
	db $c7, $ca, $fb, $01, $fb, $fb, $03, $ff, $fb, $07, $af, $6e, $ef, $ef, $ec, $ef
	db $ff, $ff, $df, $03, $df, $df, $01, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $ff
	db $c1, $f7, $7f, $5f, $6f, $7b, $01, $7f, $7f, $7f, $f7, $f7, $f0, $8f, $df, $ff
	db $ff, $ff, $bf, $df, $dd, $ed, $f5, $fb, $ff, $ff, $fe, $00, $77, $40, $c0, $f7
	db $80, $e0, $ff, $01, $dd, $05, $07, $df, $03, $0f, $cf, $a0, $e0, $ef, $e0, $df
	db $ff, $ff, $e7, $2b, $2f, $ef, $0f, $f7, $ff, $ff, $e0, $ef, $e8, $ef, $e8, $00
	db $dd, $c0, $0f, $ef, $2f, $ef, $2f, $01, $ff, $07, $c1, $dd, $c1, $1d, $fd, $fc
	db $ff, $ff, $6f, $af, $df, $af, $71, $fb, $ff, $ff, $f7, $e7, $df, $ba, $f3, $ee
	db $cf, $ae, $df, $bb, $77, $0f, $bb, $01, $bd, $83, $6f, $ee, $ef, $ef, $ef, $ee
	db $ff, $ff, $7b, $b7, $cf, $d7, $b9, $7d, $ff, $ff, $7f, $bc, $dd, $05, $ed, $dd
	db $bd, $dd, $ff, $01, $fd, $05, $75, $75, $75, $05, $ed, $ec, $dd, $9f, $a7, $78
	db $ff, $ff, $fd, $01, $fd, $ff, $ff, $01, $ff, $ff, $df, $04, $df, $06, $56, $56
	db $06, $57, $df, $01, $df, $03, $0b, $db, $03, $dd, $54, $07, $de, $07, $df, $df
	db $ff, $ff, $01, $f7, $01, $f7, $77, $ef, $ff, $ff, $ff, $c0, $ff, $ff, $00, $fb
	db $fb, $fb, $ef, $07, $ff, $fb, $01, $bf, $bf, $bf, $fb, $f7, $f7, $ef, $df, $3f
	db $ff, $ff, $bf, $bf, $bd, $bd, $bd, $c1, $ff, $ff, $ef, $ee, $02, $f6, $ee, $c6
	db $aa, $6e, $f7, $03, $f7, $f7, $07, $f7, $f7, $f7, $ee, $ee, $ee, $ee, $e8, $ef
	db $ff, $ff, $07, $f7, $f7, $f7, $01, $ff, $ff, $ff, $ef, $ef, $ef, $a4, $ab, $af
	db $6f, $e0, $7f, $7f, $77, $03, $77, $77, $77, $01, $ef, $ee, $ee, $ed, $eb, $e7
	db $ff, $ff, $7f, $bf, $df, $ef, $f1, $fb, $ff, $ff, $dd, $dd, $b8, $37, $aa, $bd
	db $bb, $b7, $f7, $f7, $41, $57, $d7, $c1, $f7, $b7, $b0, $be, $bd, $b3, $b7, $bf
	db $ff, $ff, $01, $af, $b7, $b9, $bd, $bf, $ff, $ff, $fd, $fd, $c0, $fd, $fd, $00
	db $fe, $f9, $ff, $f7, $27, $df, $bb, $01, $ff, $ff, $f3, $e8, $db, $bb, $7b, $fc
	db $ff, $ff, $ff, $07, $ff, $ff, $ff, $03, $ff, $ff, $f3, $8e, $bf, $83, $bf, $80
	db $bd, $84, $f7, $03, $f7, $07, $f7, $07, $ef, $2f, $bd, $84, $bd, $8c, $39, $ff
	db $ff, $ff, $ef, $2f, $ef, $75, $f5, $f9, $ff, $ff, $ef, $ee, $df, $bb, $03, $f7
	db $ee, $da, $fb, $01, $bb, $bb, $ab, $77, $03, $db, $02, $ee, $aa, $aa, $aa, $ef
	db $ff, $ff, $db, $03, $ff, $fd, $fd, $01, $ff, $ff, $ef, $f7, $00, $bd, $db, $00
	db $6e, $00, $bf, $bf, $81, $7b, $fb, $db, $db, $db, $6e, $42, $5a, $42, $7e, $79
	db $ff, $ff, $db, $d7, $ef, $d7, $b9, $7d, $ff, $ff, $ff, $8c, $6f, $dc, $05, $54
	db $57, $06, $ff, $01, $df, $51, $55, $51, $df, $01, $57, $54, $05, $fc, $af, $54
	db $ff, $ff, $df, $51, $55, $51, $df, $01, $ff, $ff, $de, $dd, $db, $d8, $05, $da
	db $d8, $df, $b7, $b7, $2f, $83, $b7, $ab, $03, $bb, $88, $55, $dd, $da, $d7, $df
	db $ff, $ff, $01, $bb, $d7, $ef, $55, $b9, $ff, $ff, $c1, $dd, $dd, $c1, $fe, $fe
	db $00, $fd, $07, $77, $77, $07, $df, $ef, $01, $7f, $f3, $cf, $01, $dd, $dd, $c1
	db $ff, $ff, $9f, $e7, $01, $77, $77, $07, $ff, $ff, $fe, $80, $ef, $00, $ff, $c0
	db $de, $c0, $ff, $03, $ef, $01, $ff, $07, $f7, $07, $de, $c0, $fe, $c0, $fe, $00
	db $ff, $ff, $f7, $07, $ff, $07, $ff, $01, $ff, $ff, $fe, $c0, $df, $d0, $df, $c0
	db $df, $d0, $ff, $03, $7f, $07, $77, $01, $77, $07, $df, $d0, $d7, $b7, $70, $f7
	db $ff, $ff, $7f, $07, $f7, $f7, $07, $f7, $ff, $ff, $ff, $06, $54, $56, $06, $56
	db $56, $06, $7f, $07, $f7, $07, $f7, $07, $03, $ff, $de, $df, $da, $da, $df, $df
	db $ff, $ff, $01, $fd, $ad, $ad, $fb, $e7, $ff, $ff, $76, $ae, $dd, $ac, $69, $e5
	db $ed, $cc, $83, $f7, $f7, $01, $ff, $7f, $03, $df, $ad, $6c, $ed, $ed, $ad, $dc
	db $ff, $ff, $df, $01, $df, $af, $71, $fb, $ff, $ff, $ef, $ef, $ef, $e8, $03, $cd
	db $c5, $a8, $df, $d7, $db, $01, $df, $5f, $5b, $1b, $ad, $6d, $eb, $e7, $ef, $ec
	db $ff, $ff, $57, $57, $4f, $ad, $75, $f9, $ff, $ff, $ee, $ef, $ec, $03, $ef, $cc
	db $c5, $a9, $ef, $5f, $07, $b7, $b7, $07, $bf, $bb, $ac, $6f, $ee, $ed, $eb, $ef
	db $ff, $ff, $01, $3b, $bb, $ab, $b7, $bf, $ff, $ff, $bf, $df, $03, $fe, $84, $fe
	db $86, $fe, $ef, $67, $7b, $fd, $03, $fb, $fb, $03, $86, $b7, $b7, $b7, $86, $b5
	db $ff, $ff, $ab, $af, $af, $6d, $ed, $f1, $ff, $ff, $ff, $e0, $ef, $ef, $ef, $e0
	db $ee, $fe, $ef, $07, $ef, $ef, $ef, $0f, $ef, $ff, $ee, $ee, $ee, $d6, $ba, $7c
	db $ff, $ff, $ff, $07, $ff, $ff, $ff, $01, $ff, $ff, $7f, $ba, $d7, $ef, $d7, $b7
	db $f6, $e7, $fb, $01, $df, $df, $df, $df, $03, $df, $d7, $b7, $77, $f7, $ac, $df
	db $ff, $ff, $df, $df, $df, $db, $01, $ff, $ff, $ff, $ff, $fb, $01, $7b, $7b, $03
	db $7b, $7b, $fb, $01, $7b, $7b, $03, $7b, $7b, $03, $03, $7b, $fe, $fe, $fd, $fb
	db $ff, $ff, $7b, $7b, $fb, $fb, $eb, $f7, $ff, $ff, $c0, $df, $c0, $df, $c0, $fe
	db $de, $c0, $07, $f7, $07, $f7, $07, $ff, $f7, $03, $de, $be, $40, $fe, $fe, $00
	db $ff, $ff, $ff, $ef, $07, $ff, $fb, $01, $ff, $ff, $df, $81, $6f, $81, $b7, $81
	db $bd, $81, $df, $81, $6f, $f7, $bf, $81, $bf, $7f, $b7, $81, $ff, $c0, $db, $00
	db $ff, $ff, $83, $ff, $ff, $07, $b7, $01, $ff, $ff, $07, $af, $a8, $8d, $ad, $a8
	db $af, $8c, $77, $73, $15, $b7, $b7, $01, $f7, $37, $ad, $ac, $ad, $0c, $ed, $ef
	db $ff, $ff, $b5, $33, $b7, $27, $b5, $f9, $ff, $ff, $db, $eb, $00, $ef, $f7, $e0
	db $fe, $e0, $b7, $af, $01, $ef, $df, $0f, $ff, $0f, $fe, $80, $f6, $e6, $de, $be
	db $ff, $ff, $ff, $03, $df, $ef, $f3, $fb, $ff, $ff, $ec, $dd, $bd, $75, $0d, $dd
	db $b5, $05, $01, $fd, $75, $ad, $05, $dd, $dd, $05, $dd, $55, $55, $55, $dd, $dd
	db $ff, $ff, $7d, $7d, $05, $fd, $f5, $fb, $ff, $ff, $ff, $f0, $f7, $f7, $f0, $f7
	db $f7, $f7, $cf, $3f, $ff, $f7, $03, $df, $df, $db, $00, $ff, $fd, $f9, $f7, $ef
	db $ff, $ff, $01, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f0, $f7, $f7, $f0, $f7
	db $f7, $f7, $cf, $3f, $ff, $f7, $03, $df, $df, $db, $00, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $01, $ff, $bf, $cf, $e7, $f7, $ff, $ff, $ff, $df, $e7, $7f, $9f, $df
	db $f6, $ef, $df, $df, $df, $57, $59, $5d, $df, $db, $df, $1f, $df, $df, $df, $dc
	db $ff, $ff, $d7, $ef, $df, $bf, $7f, $ff, $ff, $ff, $fb, $30, $db, $f8, $f0, $36
	db $d0, $fe, $77, $37, $6b, $41, $2b, $ab, $21, $eb, $f0, $dd, $a0, $3b, $b7, $af
	db $ff, $ff, $2b, $e1, $2b, $6b, $a1, $af, $ff, $ff, $df, $df, $df, $d8, $0f, $df
	db $d8, $cf, $6f, $6f, $6f, $61, $6f, $6f, $61, $6f, $1f, $d8, $df, $de, $5d, $bb
	db $ff, $ff, $6f, $61, $6f, $ef, $ef, $ef, $ff, $ff, $ef, $e8, $ef, $02, $ef, $c8
	db $c7, $aa, $bf, $03, $bf, $07, $bf, $01, $6f, $b7, $ad, $6a, $ef, $e8, $ef, $ef
	db $ff, $ff, $bb, $0d, $bf, $03, $bf, $bf, $ff, $ff, $f7, $f7, $01, $f7, $ff, $f7
	db $ef, $cf, $df, $db, $01, $df, $7f, $7f, $77, $03, $af, $6f, $ef, $ef, $ef, $ef
	db $ff, $ff, $7f, $7f, $7f, $7d, $7d, $81, $ff, $ff, $ef, $ec, $ef, $04, $ef, $ee
	db $e6, $ce, $df, $01, $77, $01, $ff, $03, $db, $03, $2e, $ee, $ef, $ee, $af, $dc
	db $ff, $ff, $db, $03, $df, $03, $df, $01, $ff, $ff, $fe, $f6, $76, $6e, $6c, $42
	db $76, $6e, $ff, $df, $dd, $bd, $b9, $05, $ed, $dd, $5a, $00, $7c, $7e, $00, $7f
	db $ff, $ff, $b5, $01, $f9, $fd, $01, $fd, $ff, $ff, $80, $bf, $7f, $e0, $ef, $e0
	db $ef, $e0, $01, $fd, $fb, $0f, $ef, $0f, $ef, $0f, $ed, $fe, $00, $f7, $ef, $df
	db $ff, $ff, $ef, $fb, $01, $df, $e7, $f7, $ff, $ff, $fd, $fe, $80, $bb, $bb, $80
	db $bb, $aa, $ff, $f7, $03, $df, $db, $01, $df, $97, $aa, $aa, $aa, $9b, $7b, $fb
	db $ff, $ff, $97, $57, $d7, $5b, $df, $df, $ff, $ff, $fe, $f2, $ee, $de, $f1, $cf
	db $20, $ef, $ff, $e7, $b3, $7b, $ff, $77, $03, $7f, $e0, $ef, $e0, $ef, $e0, $ef
	db $ff, $ff, $07, $7f, $07, $7f, $01, $ff, $ff, $ff, $ef, $ef, $01, $de, $dd, $c3
	db $db, $db, $7b, $01, $7f, $ff, $01, $dd, $db, $5f, $db, $db, $bb, $aa, $75, $fb
	db $ff, $ff, $43, $5f, $5f, $9f, $df, $e1, $ff, $ff, $fe, $f6, $02, $ee, $de, $d8
	db $86, $56, $ff, $fb, $81, $db, $1b, $db, $db, $db, $d6, $d6, $d6, $c7, $df, $fe
	db $ff, $ff, $9b, $5b, $db, $bb, $6b, $f7, $ff, $ff, $00, $76, $7a, $60, $7d, $40
	db $7b, $70, $01, $dd, $bd, $0d, $fd, $05, $bd, $1d, $4b, $7a, $7b, $7c, $7f, $00
	db $ff, $ff, $a5, $7d, $dd, $1d, $fd, $01, $ff, $ff, $ee, $e8, $de, $90, $5e, $de
	db $de, $dc, $57, $db, $db, $01, $df, $df, $5b, $e7, $d2, $de, $de, $de, $da, $dd
	db $ff, $ff, $ef, $cf, $b7, $f5, $f9, $fd, $ff, $ff, $80, $bb, $80, $f7, $ef, $da
	db $85, $ef, $03, $bb, $03, $bf, $6f, $03, $6f, $03, $db, $01, $ef, $ab, $ab, $ef
	db $ff, $ff, $6f, $03, $6f, $6f, $01, $7f, $ff, $ff, $dd, $dd, $80, $dd, $c1, $dd
	db $c1, $dd, $f7, $e3, $9f, $bf, $bf, $81, $b7, $b7, $dd, $00, $ff, $eb, $dc, $bd
	db $ff, $ff, $b7, $b7, $77, $77, $f7, $f7, $ff, $ff, $ef, $ef, $ec, $05, $eb, $ee
	db $e5, $ce, $bf, $df, $01, $fd, $6b, $f7, $fb, $0f, $2f, $ef, $ee, $ed, $ad, $de
	db $ff, $ff, $df, $bf, $7f, $fd, $fd, $01, $ff, $ff, $fc, $fb, $f7, $ef, $d0, $3e
	db $fe, $fe, $7f, $bf, $df, $ef, $17, $f9, $ff, $ef, $c0, $fe, $ee, $f6, $fa, $80
	db $ff, $ff, $07, $ff, $ef, $df, $b7, $03, $ff, $ff, $ff, $ff, $00, $bb, $bb, $bb
	db $bb, $bb, $ff, $fb, $01, $bb, $bb, $bb, $bb, $bb, $b7, $af, $bf, $80, $bf, $ff
	db $ff, $ff, $c3, $fb, $fb, $03, $fb, $ff, $ff, $ff, $ff, $ef, $ef, $ef, $ef, $ef
	db $ef, $ef, $fb, $fb, $7b, $7b, $7b, $7b, $7b, $7b, $ef, $ef, $ef, $df, $bf, $ff
	db $ff, $ff, $7b, $7b, $7b, $fb, $fb, $fb, $ff, $ff, $fe, $f6, $ee, $de, $fc, $f3
	db $c0, $37, $ff, $ef, $f3, $9b, $7f, $f7, $03, $f7, $f0, $f7, $f0, $f7, $f0, $f7
	db $ff, $ff, $07, $f7, $07, $f7, $07, $f7, $ff, $ff, $ef, $ef, $ec, $03, $ef, $eb
	db $e7, $cf, $ff, $fb, $01, $df, $df, $df, $df, $df, $2f, $ef, $ef, $ef, $af, $df
	db $ff, $ff, $df, $df, $df, $df, $5f, $bf, $ff, $ff, $ff, $04, $df, $de, $be, $be
	db $06, $b6, $df, $01, $df, $03, $db, $03, $db, $03, $b7, $b4, $b7, $84, $b7, $ff
	db $ff, $ff, $dd, $01, $f7, $01, $77, $e7, $ff, $ff, $ee, $ef, $ec, $02, $ee, $ea
	db $e6, $c8, $e7, $5f, $03, $ef, $ef, $ef, $ef, $01, $2e, $ee, $ee, $ee, $ad, $db
	db $ff, $ff, $ef, $ef, $ef, $ef, $ef, $ef, $ff, $ff, $80, $b8, $bb, $b8, $be, $a0
	db $bf, $a0, $01, $1d, $dd, $1d, $fd, $05, $fd, $05, $ac, $ad, $ac, $a0, $bf, $80
	db $ff, $ff, $35, $b5, $35, $05, $fd, $01, $ff, $ff, $02, $bb, $b7, $b6, $ae, $b6
	db $b6, $ba, $01, $fb, $fb, $1b, $db, $db, $db, $db, $ba, $ba, $97, $af, $bf, $bf
	db $ff, $ff, $1b, $db, $fb, $fb, $eb, $f7, $ff, $ff, $08, $ef, $ee, $0c, $7d, $7c
	db $0d, $ec, $01, $57, $db, $01, $dd, $89, $55, $89, $ed, $ec, $ed, $ec, $6d, $9d
	db $ff, $ff, $dd, $89, $55, $89, $fd, $fb, $ff, $ff, $ff, $07, $6c, $6d, $5b, $6f
	db $77, $77, $bf, $df, $01, $fd, $fb, $7f, $77, $67, $77, $2f, $5f, $7f, $7f, $7f
	db $ff, $ff, $5f, $3f, $7d, $7d, $7d, $81, $ff, $ff, $fb, $81, $bb, $a3, $ab, $01
	db $7d, $83, $f7, $83, $b7, $b7, $b7, $71, $ff, $03, $bb, $83, $bb, $83, $bb, $b6
	db $ff, $ff, $7b, $b7, $cf, $cf, $b7, $79, $ff, $ff, $c0, $df, $c0, $de, $d0, $de
	db $c0, $dd, $03, $f7, $07, $ef, $1f, $bb, $01, $ff, $d8, $d3, $a8, $9b, $78, $fb
	db $ff, $ff, $07, $f7, $07, $f7, $07, $f7, $ff, $ff, $e7, $f7, $ff, $01, $de, $df
	db $c3, $db, $bf, $bb, $81, $7f, $bf, $83, $5f, $5f, $da, $d8, $db, $bb, $6b, $f6
	db $ff, $ff, $df, $01, $df, $af, $71, $fb, $ff, $ff, $00, $6f, $41, $37, $41, $6b
	db $00, $ff, $87, $b7, $71, $07, $af, $df, $21, $ff, $00, $fb, $80, $b7, $a8, $80
	db $ff, $ff, $01, $bf, $03, $db, $2b, $03, $ff, $ff, $fe, $ee, $ee, $c0, $de, $be
	db $7e, $fe, $ff, $ff, $f7, $03, $ff, $ff, $ff, $ef, $c0, $fe, $fe, $fe, $fe, $00
	db $ff, $ff, $07, $ff, $ff, $ff, $fb, $01, $ff, $ff, $ff, $e0, $ee, $e0, $ee, $e0
	db $fd, $fb, $ef, $07, $ef, $0f, $ef, $0f, $7f, $9f, $f3, $cb, $3b, $fb, $f7, $ef
	db $ff, $ff, $af, $b1, $bb, $bf, $bf, $bf, $ff, $ff, $f7, $f4, $ed, $ed, $cc, $cf
	db $af, $60, $f7, $03, $f7, $f7, $07, $bf, $bb, $01, $ef, $ee, $ee, $ed, $eb, $ef
	db $ff, $ff, $bf, $af, $b3, $b9, $bd, $bf, $ff, $ff, $f7, $b1, $b7, $00, $ff, $5a
	db $24, $7e, $ff, $e7, $db, $bd, $c3, $ff, $ff, $81, $00, $5a, $24, $7e, $00, $7e
	db $ff, $ff, $fd, $fb, $d7, $ef, $f7, $fb, $ff, $ff, $df, $ef, $03, $f6, $ee, $e6
	db $ca, $aa, $df, $df, $df, $03, $db, $db, $03, $db, $6e, $ee, $ee, $ef, $ef, $ef
	db $ff, $ff, $db, $03, $db, $df, $df, $df, $ff, $ff, $fe, $fe, $fe, $fe, $00, $fe
	db $fe, $fd, $ff, $ff, $ff, $fb, $01, $ff, $ff, $7f, $fd, $fb, $f9, $f6, $ce, $3f
	db $ff, $ff, $7f, $bf, $bf, $cf, $f1, $fb, $ff, $ff, $fd, $fe, $80, $bf, $7b, $f3
	db $ef, $df, $ff, $ff, $01, $fd, $bb, $cf, $e7, $f7, $c0, $fe, $fe, $fe, $fe, $00
	db $ff, $ff, $07, $ff, $ff, $ff, $fb, $01, $ff, $ff, $f4, $f7, $ec, $ef, $cc, $af
	db $68, $eb, $07, $f7, $01, $f7, $07, $ff, $01, $fd, $e6, $ee, $ef, $ef, $ee, $e9
	db $ff, $ff, $0b, $ef, $5f, $1f, $e3, $f7, $ff, $ff, $fe, $fe, $06, $54, $53, $57
	db $07, $56, $ff, $07, $f7, $ef, $5f, $bf, $5f, $ef, $55, $52, $06, $76, $fe, $fe
	db $ff, $ff, $f1, $03, $f7, $f7, $07, $f7, $ff, $ff, $ff, $04, $bd, $bc, $bd, $bd
	db $04, $b5, $df, $01, $b7, $01, $b7, $87, $01, $ff, $b5, $b5, $b5, $83, $b7, $fe
	db $ff, $ff, $03, $5b, $03, $5b, $03, $fd, $ff, $ff, $ef, $ef, $ee, $82, $a9, $ab
	db $ab, $ab, $bf, $df, $01, $fd, $fb, $7f, $7f, $67, $83, $af, $eb, $e3, $1b, $bf
	db $ff, $ff, $5f, $3f, $7f, $7d, $7d, $81, $ff, $ff, $ff, $80, $dd, $ee, $f7, $c0
	db $fe, $00, $df, $3b, $f3, $ef, $5f, $07, $f7, $01, $fe, $c0, $fe, $fe, $fa, $fd
	db $ff, $ff, $f7, $07, $f7, $ff, $ff, $ff, $ff, $ff, $ff, $07, $74, $77, $6e, $5e
	db $6e, $76, $df, $df, $01, $df, $03, $db, $03, $db, $76, $77, $4c, $7f, $7f, $7f
	db $ff, $ff, $03, $df, $01, $df, $df, $df, $ff, $ff, $ef, $ef, $dd, $80, $c1, $dd
	db $c1, $dd, $7f, $07, $7f, $7b, $83, $7f, $7f, $07, $c1, $dd, $d9, $b7, $bb, $7f
	db $ff, $ff, $7f, $7b, $83, $77, $b9, $fd, $ff, $ff, $ee, $ae, $ae, $84, $ab, $6f
	db $e3, $ce, $ff, $ff, $fb, $01, $5b, $5b, $5b, $db, $2e, $ed, $eb, $ef, $ee, $ef
	db $ff, $ff, $bb, $bb, $7b, $7b, $d7, $ef, $ff, $ff, $bf, $de, $03, $ff, $86, $ff
	db $87, $fc, $fb, $01, $df, $df, $03, $bb, $7b, $01, $87, $b7, $b7, $b7, $87, $b7
	db $ff, $ff, $ff, $03, $7b, $7b, $03, $7b, $ff, $ff, $ff, $c0, $fe, $fe, $00, $fa
	db $f6, $ce, $cf, $3f, $ff, $fb, $01, $bf, $cf, $f1, $30, $f7, $f0, $f7, $f0, $f7
	db $ff, $ff, $1b, $df, $1f, $df, $1f, $df, $ff, $ff, $be, $ce, $e8, $7e, $9e, $d0
	db $fe, $ed, $ef, $ef, $03, $ef, $ef, $01, $ef, $f7, $d8, $15, $dc, $dd, $dd, $de
	db $ff, $ff, $09, $eb, $0f, $ff, $fb, $03, $ff, $ff, $fe, $fe, $fe, $fe, $82, $fa
	db $fa, $f6, $ff, $ff, $f7, $e7, $df, $3f, $7f, $9f, $ee, $de, $be, $7e, $fa, $fd
	db $ff, $ff, $ef, $f1, $fb, $ff, $ff, $ff, $ff, $ff, $ef, $e0, $d7, $ba, $80, $bf
	db $60, $ef, $bf, $83, $6f, $f7, $01, $fd, $1b, $df, $e0, $ef, $e0, $ef, $e0, $ef
	db $ff, $ff, $1f, $ff, $0f, $ef, $0f, $ff, $ff, $ff, $ff, $ff, $80, $fe, $fe, $fe
	db $fe, $fe, $ff, $f7, $03, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fe, $fe, $fe, $00
	db $ff, $ff, $ff, $ff, $ff, $ff, $fb, $01, $ff, $ff, $7f, $bf, $f8, $0f, $ee, $de
	db $be, $7e, $77, $af, $01, $7f, $03, $fb, $03, $fb, $be, $de, $de, $de, $af, $70
	db $ff, $ff, $03, $fb, $03, $fb, $ff, $01, $ff, $ff, $00, $fe, $80, $ae, $76, $ee
	db $ff, $c0, $01, $ff, $01, $ed, $db, $ef, $ff, $07, $de, $de, $c0, $de, $de, $c0
	db $ff, $ff, $f7, $f7, $07, $f7, $f7, $07, $ff, $ff, $e0, $fe, $80, $ae, $72, $ee
	db $87, $f4, $0f, $ff, $01, $ed, $9b, $ef, $e7, $1f, $c7, $f4, $d7, $e8, $d7, $b8
	db $ff, $ff, $bf, $0f, $bf, $07, $ff, $01, $ff, $ff, $fc, $fb, $f4, $ef, $d0, $b7
	db $70, $f7, $7f, $bf, $5f, $ef, $17, $db, $1d, $df, $f0, $ef, $d0, $b7, $f7, $f0
	db $ff, $ff, $1f, $ff, $0f, $ef, $ef, $0f, $ff, $ff, $ff, $c0, $df, $d0, $df, $d8
	db $db, $d8, $7f, $01, $bf, $01, $bf, $03, $bb, $03, $db, $d8, $df, $b0, $7f, $ff
	db $ff, $ff, $bb, $03, $bf, $01, $bf, $bf, $ff, $ff, $ff, $c0, $ee, $f2, $fa, $00
	db $f6, $ee, $df, $3f, $ef, $cf, $bb, $01, $df, $ef, $c0, $2e, $e0, $ee, $e0, $ef
	db $ff, $ff, $01, $eb, $0f, $ef, $0f, $ef, $ff, $ff, $f7, $80, $f7, $00, $dd, $b6
	db $f7, $80, $df, $df, $83, $5b, $db, $9b, $db, $cb, $f7, $00, $ff, $bb, $bb, $7b
	db $ff, $ff, $b9, $79, $fd, $bb, $bb, $bd, $ff, $ff, $de, $b0, $6f, $1c, $b7, $04
	db $df, $88, $f7, $2d, $db, $47, $ed, $41, $f7, $23, $53, $d8, $fd, $ae, $6f, $e0
	db $ff, $ff, $95, $37, $ff, $db, $ed, $07, $ff, $ff, $04, $6d, $05, $6d, $05, $6d
	db $05, $f5, $01, $ff, $83, $bb, $83, $ff, $11, $55, $a5, $a5, $55, $f5, $ec, $9d
	db $ff, $ff, $55, $11, $ff, $ff, $01, $ff, $ff, $ff, $ff, $80, $fe, $ee, $f6, $f6
	db $fe, $00, $f7, $03, $ff, $ef, $ef, $df, $fb, $01, $fe, $fe, $fe, $fe, $fe, $fe
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $c0, $df, $bd, $fd, $00
	db $fb, $f7, $ff, $03, $fb, $f7, $ff, $01, $df, $df, $e7, $f9, $fe, $fd, $f3, $cf
	db $ff, $ff, $bf, $bf, $7f, $bf, $cf, $ef, $ff, $ff, $fd, $fe, $00, $ff, $e0, $ef
	db $ef, $e0, $ff, $fb, $01, $ff, $0f, $ef, $ef, $0f, $fe, $f6, $e6, $de, $ba, $fd
	db $ff, $ff, $ff, $df, $e7, $f3, $fb, $ff, $ff, $ff, $08, $6b, $08, $80, $b6, $80
	db $b6, $80, $6f, $6b, $6d, $81, $ef, $ef, $ef, $ef, $00, $ff, $80, $be, $80, $be
	db $ff, $ff, $6f, $ef, $d7, $db, $dd, $bd, $ff, $ff, $fe, $fe, $fe, $fe, $fe, $fe
	db $fe, $fe, $ff, $ff, $ff, $ff, $ef, $07, $ff, $ff, $fe, $fe, $fe, $fe, $fe, $00
	db $ff, $ff, $ff, $ff, $ff, $ff, $fb, $01, $ff, $ff, $dc, $df, $08, $df, $dc, $d7
	db $c8, $1b, $07, $f7, $01, $f7, $07, $ff, $01, $bd, $dc, $dd, $dd, $dd, $5f, $bf
	db $ff, $ff, $03, $bb, $bb, $ab, $b7, $bf, $ff, $ff, $ef, $df, $84, $b7, $96, $a5
	db $b6, $07, $ff, $fd, $43, $77, $f7, $c1, $f7, $77, $b7, $97, $a5, $b6, $b5, $63
	db $ff, $ff, $77, $77, $41, $ff, $7f, $81, $ff, $ff, $fb, $fb, $00, $fb, $eb, $ef
	db $01, $ed, $bf, $bb, $01, $bf, $bf, $fb, $81, $bb, $ed, $ed, $ed, $dd, $b5, $7b
	db $ff, $ff, $bb, $bb, $bb, $bb, $83, $bb, $ff, $ff, $bb, $d7, $ef, $d7, $aa, $eb
	db $01, $ab, $0f, $6f, $6f, $6f, $e3, $ff, $07, $77, $ab, $ab, $ab, $6d, $ef, $ec
	db $ff, $ff, $77, $af, $df, $af, $77, $f9, $ff, $ff, $ff, $ff, $80, $fe, $fe, $c0
	db $fe, $fe, $ef, $07, $ff, $ff, $ef, $07, $ff, $fb, $00, $fe, $fe, $fe, $f6, $f9
	db $ff, $ff, $01, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ef, $01, $ef, $af, $a1, $af
	db $01, $ef, $ef, $01, $ef, $03, $df, $03, $7b, $03, $cd, $ad, $6b, $e7, $ef, $1f
	db $ff, $ff, $7b, $03, $7b, $03, $b7, $7b, $ff, $ff, $ff, $e0, $ee, $e0, $ee, $e0
	db $ee, $fe, $ef, $07, $ef, $0f, $ef, $0f, $ef, $fb, $00, $fa, $f6, $ce, $3e, $fe
	db $ff, $ff, $01, $bf, $cf, $f1, $fb, $ff, $ff, $ff, $ee, $ec, $ee, $02, $ee, $ce
	db $c6, $aa, $f7, $03, $f7, $f7, $07, $f7, $f7, $07, $ae, $6e, $e8, $ee, $ec, $eb
	db $ff, $ff, $f7, $f7, $01, $f7, $f9, $fd, $ff, $ff, $ef, $ef, $82, $ee, $ee, $00
	db $ee, $ae, $d7, $db, $01, $df, $d7, $d7, $97, $4f, $a2, $af, $af, $8e, $b3, $7c
	db $ff, $ff, $df, $ab, $73, $fb, $ff, $01, $ff, $ff, $80, $b6, $b6, $80, $b6, $b6
	db $80, $f7, $81, $fb, $d7, $ef, $ef, $01, $ed, $eb, $80, $f7, $f7, $f0, $07, $bf
	db $ff, $ff, $ef, $ef, $ef, $ef, $af, $df, $ff, $ff, $00, $7d, $60, $7d, $40, $60
	db $6f, $60, $01, $fd, $0d, $ed, $05, $0d, $ed, $0d, $7e, $60, $6e, $60, $7e, $00
	db $ff, $ff, $fd, $0d, $fd, $05, $fd, $01, $ff, $ff, $f8, $fe, $fe, $fe, $fe, $fe
	db $fe, $fe, $1f, $7f, $7f, $7f, $7f, $7f, $7f, $7f, $fe, $fe, $fe, $fe, $fe, $f8
	db $ff, $ff, $7f, $7f, $7f, $7f, $7f, $1f, $ff, $ff, $f0, $c7, $8f, $9f, $9f, $9f
	db $9f, $9f, $3f, $8f, $c7, $e7, $e7, $e7, $e7, $e7, $9f, $9f, $98, $8f, $c7, $f0
	db $ff, $ff, $e7, $e7, $67, $07, $8f, $09, $e3, $ff, $fe, $f7, $03, $df, $dc, $bf
	db $87, $33, $f7, $77, $6f, $ff, $03, $6f, $6d, $6d, $b5, $b6, $b7, $87, $bf, $f8
	db $ff, $ff, $6b, $67, $6f, $6f, $6b, $01, $ff, $ff, $ef, $e8, $da, $db, $9a, $58
	db $dd, $da, $7f, $01, $eb, $1b, $eb, $03, $f7, $f9, $d6, $dd, $db, $df, $dc, $d3
	db $ff, $ff, $05, $6f, $9f, $6f, $f1, $fb, $ff, $ff, $ff, $ff, $e0, $ed, $ed, $ed
	db $ed, $ed, $ef, $87, $7f, $bf, $bf, $bf, $bf, $df, $dd, $dd, $dd, $bd, $bc, $7f
	db $ff, $ff, $df, $6f, $b7, $59, $db, $ff, $ff, $ff, $fd, $fb, $c0, $de, $c0, $de
	db $c0, $de, $ff, $f7, $03, $f7, $07, $f7, $07, $7f, $fd, $fd, $fb, $f7, $cf, $3f
	db $ff, $ff, $6f, $5f, $57, $05, $75, $81, $ff, $ff, $ee, $f6, $80, $bf, $60, $ef
	db $e0, $ff, $ef, $df, $01, $fd, $0b, $ef, $0f, $ff, $c0, $de, $c0, $de, $c0, $df
	db $ff, $ff, $07, $f7, $07, $f7, $07, $f7, $ff, $ff, $fe, $80, $bf, $7f, $c0, $e5
	db $9c, $fa, $ff, $01, $fd, $fb, $0f, $ef, $cf, $bf, $e6, $9c, $fa, $e6, $9a, $fd
	db $ff, $ff, $7f, $bf, $cf, $f1, $fb, $ff, $ff, $ff, $fe, $00, $c0, $de, $c0, $de
	db $c0, $fe, $ff, $01, $07, $f7, $07, $f7, $07, $fb, $80, $ff, $00, $ef, $f7, $ff
	db $ff, $ff, $03, $ef, $01, $ef, $ef, $cf, $ff, $ff, $ff, $01, $ee, $cf, $37, $e4
	db $d3, $35, $df, $df, $01, $db, $d7, $01, $df, $3f, $e6, $d5, $37, $f7, $d7, $ef
	db $ff, $ff, $03, $7b, $03, $7b, $03, $7b, $ff, $ff, $df, $de, $bc, $77, $0f, $df
	db $bf, $74, $7f, $07, $f7, $6f, $9f, $af, $77, $b9, $07, $df, $57, $57, $57, $df
	db $ff, $ff, $cd, $ef, $7f, $9f, $cf, $ef, $ff, $ff, $ef, $df, $bf, $78, $07, $ef
	db $de, $b7, $df, $df, $df, $01, $df, $df, $03, $ff, $06, $de, $56, $56, $56, $de
	db $ff, $ff, $03, $fb, $fb, $fb, $03, $fb, $ff, $ff, $ee, $ee, $ea, $65, $ad, $ab
	db $af, $ef, $ff, $fb, $01, $7f, $7f, $77, $03, $7f, $ef, $ef, $d7, $db, $bb, $7f
	db $ff, $ff, $77, $03, $7f, $7f, $7f, $7f, $ff, $ff, $ef, $c1, $db, $b7, $41, $d4
	db $d5, $c1, $01, $bb, $bb, $ab, $77, $ef, $af, $83, $d5, $d5, $c0, $dd, $bd, $79
	db $ff, $ff, $6f, $ef, $01, $ef, $ef, $ef, $ff, $ff, $ff, $df, $ed, $02, $ff, $84
	db $fe, $85, $ef, $ef, $6d, $ab, $ef, $81, $ef, $c7, $fe, $86, $b6, $b6, $85, $b7
	db $ff, $ff, $ab, $6d, $ef, $ef, $7f, $81, $ff, $ff, $df, $df, $05, $55, $55, $54
	db $07, $57, $03, $7b, $7b, $03, $ff, $01, $dd, $dd, $dc, $df, $d7, $07, $fe, $fd
	db $ff, $ff, $01, $df, $af, $77, $fb, $fd, $ff, $ff, $ef, $ef, $eb, $81, $ab, $aa
	db $a9, $83, $ef, $af, $af, $af, $77, $d9, $db, $df, $af, $eb, $e3, $1a, $be, $ff
	db $ff, $ff, $bf, $bf, $6f, $f7, $03, $fb, $ff, $ff, $ef, $c1, $dd, $c1, $dd, $c1
	db $dd, $dd, $f7, $f7, $f7, $01, $f7, $f7, $77, $b7, $01, $f5, $ed, $dd, $35, $fb
	db $ff, $ff, $b7, $f7, $f7, $f7, $d7, $ef, $ff, $ff, $fe, $ee, $f6, $f6, $fe, $00
	db $fb, $fb, $ff, $f3, $ef, $df, $fb, $01, $bf, $bf, $fb, $f7, $f7, $ef, $df, $bf
	db $ff, $ff, $bf, $bf, $bd, $bd, $bd, $c1, $ff, $ff, $df, $de, $05, $db, $d4, $dd
	db $8c, $55, $1f, $ef, $17, $fb, $05, $f7, $07, $f7, $dc, $dd, $d8, $d5, $dd, $dc
	db $ff, $ff, $07, $ff, $07, $f7, $f7, $07, $ff, $ff, $f8, $ff, $0e, $6d, $69, $6e
	db $6d, $6b, $01, $bf, $7b, $b3, $4f, $df, $4f, $97, $6f, $0e, $6d, $fb, $fe, $ff
	db $ff, $ff, $57, $db, $dd, $df, $bf, $7f, $ff, $ff, $fe, $fe, $fe, $00, $fe, $fc
	db $fc, $fa, $ff, $ff, $fb, $01, $ff, $7f, $bf, $df, $f6, $ee, $de, $3e, $fe, $fe
	db $ff, $ff, $ef, $f7, $f1, $fb, $ff, $ff, $ff, $ff, $ef, $c0, $af, $60, $ef, $e0
	db $ef, $e0, $ff, $0f, $ef, $0f, $ef, $0f, $ff, $07, $ef, $e0, $ff, $ad, $76, $ff
	db $ff, $ff, $ff, $01, $fd, $bd, $db, $e7, $ff, $ff, $df, $dd, $c0, $b7, $00, $eb
	db $dd, $bd, $ff, $fb, $81, $bb, $3b, $83, $bb, $ef, $60, $ef, $e0, $ef, $e0, $ef
	db $ff, $ff, $07, $ef, $0f, $ef, $0f, $ef, $ff, $ff, $f7, $81, $f7, $c1, $f7, $81
	db $c0, $ff, $df, $03, $df, $07, $df, $03, $07, $f7, $00, $ff, $c0, $ae, $6f, $f0
	db $ff, $ff, $01, $f7, $07, $fb, $75, $07, $ff, $ff, $fc, $f3, $e7, $e7, $ff, $ff
	db $fe, $ff, $1f, $e7, $f3, $f3, $e7, $8f, $1f, $8f, $ff, $ff, $e7, $e7, $f3, $fc
	db $ff, $ff, $e7, $f3, $f3, $f3, $e7, $1f, $ff, $ff, $00, $dd, $c1, $dd, $c1, $dd
	db $00, $fd, $ff, $81, $bd, $bd, $bd, $81, $ff, $bf, $ff, $e0, $fe, $e0, $fe, $80
	db $ff, $ff, $1f, $ff, $ff, $0f, $ff, $03, $ff, $ff, $ff, $07, $76, $6c, $5f, $5e
	db $6d, $77, $7f, $7f, $07, $e7, $1f, $4f, $b1, $bb, $74, $75, $2d, $5c, $7f, $7f
	db $ff, $ff, $07, $bf, $bb, $01, $bf, $bf, $ff, $ff, $07, $cf, $e7, $f3, $fb, $f9
	db $fc, $fe, $c1, $e7, $cf, $9f, $bf, $3f, $7f, $ff, $fc, $f9, $f3, $e7, $cf, $07
	db $ff, $ff, $7f, $3f, $9f, $cf, $e7, $c1, $ff, $ff, $ff, $ff, $ff, $c0, $df, $df
	db $df, $df, $ff, $ff, $ef, $07, $ef, $ef, $ef, $ef, $df, $df, $df, $c0, $df, $ff
	db $ff, $ff, $ef, $ef, $ef, $0f, $ef, $ff, $ff, $ff, $f7, $f7, $ef, $c8, $2f, $ef
	db $ed, $00, $5f, $6f, $03, $7f, $bf, $db, $e3, $01, $f6, $e7, $d7, $36, $f5, $e3
	db $ff, $ff, $e7, $5f, $bf, $cf, $f1, $fb, $ff, $ff, $fb, $c0, $fb, $f8, $00, $ff
	db $e0, $ee, $bf, $07, $bf, $3f, $01, $ff, $0f, $ef, $e0, $ee, $e0, $f7, $ef, $df
	db $ff, $ff, $0f, $ef, $0f, $df, $ef, $e7, $ff, $ff, $f7, $ef, $df, $bc, $07, $ef
	db $df, $bb, $ff, $ff, $fb, $01, $df, $df, $df, $df, $03, $ed, $c7, $ab, $6c, $ef
	db $ff, $ff, $df, $df, $df, $db, $01, $ff, $ff, $ff, $ef, $01, $ef, $81, $b7, $81
	db $bd, $81, $ef, $01, $ef, $bf, $81, $bf, $7f, $c3, $b7, $81, $c0, $db, $db, $00
	db $ff, $ff, $ff, $ff, $07, $b7, $b7, $01, $ff, $ff, $df, $df, $bf, $76, $0f, $dc
	db $b6, $07, $bf, $83, $7b, $07, $ef, $01, $db, $57, $df, $57, $54, $55, $df, $df
	db $ff, $ff, $df, $57, $d9, $dd, $5f, $bf, $ff, $ff, $ff, $dc, $df, $dc, $05, $dc
	db $dd, $de, $df, $01, $ff, $01, $75, $01, $db, $57, $d5, $ce, $1c, $fa, $f6, $fc
	db $ff, $ff, $db, $ff, $db, $e7, $b7, $79, $ff, $ff, $fd, $00, $7f, $61, $6d, $61
	db $7f, $44, $df, $df, $81, $7d, $ed, $eb, $ef, $6f, $55, $55, $44, $7f, $00, $7f
	db $ff, $ff, $6f, $6f, $57, $d7, $b9, $7d, $ff, $ff, $ff, $ff, $f0, $f7, $f7, $f0
	db $f7, $f7, $df, $0f, $ff, $ff, $ff, $03, $bf, $bf, $f7, $00, $fb, $f3, $ef, $df
	db $ff, $ff, $bb, $01, $bf, $cf, $e7, $f7, $ff, $ff, $ef, $ef, $ef, $82, $a9, $ab
	db $aa, $aa, $7f, $03, $7b, $b7, $cf, $b7, $59, $03, $83, $ae, $eb, $e2, $1b, $bf
	db $ff, $ff, $df, $03, $df, $01, $df, $df, $ff, $ff, $f7, $b7, $b6, $b4, $87, $f7
	db $f7, $84, $bf, $03, $bb, $d7, $4f, $b7, $77, $01, $b7, $b6, $b7, $b7, $b7, $77
	db $ff, $ff, $f7, $f7, $77, $f7, $f7, $cf, $ff, $ff, $be, $ce, $ee, $7c, $9b, $df
	db $f7, $ee, $ff, $07, $f7, $ef, $5f, $bf, $5f, $ef, $dd, $18, $d5, $dd, $dc, $dd
	db $ff, $ff, $f1, $0b, $ef, $ef, $0f, $ef, $ff, $ff, $fb, $00, $fb, $f9, $87, $f7
	db $00, $f7, $bf, $01, $bf, $fb, $fb, $bb, $bb, $bb, $e3, $e5, $d5, $b7, $77, $f7
	db $ff, $ff, $bb, $bb, $bb, $fb, $eb, $f7, $ff, $ff, $ff, $03, $f4, $ef, $df, $ea
	db $e4, $ce, $bf, $db, $01, $bf, $77, $f7, $0f, $eb, $2f, $ef, $ee, $e9, $af, $d8
	db $ff, $ff, $db, $b7, $6f, $d7, $3b, $fd, $ff, $ff, $ff, $bf, $cc, $ef, $04, $ed
	db $dd, $bc, $df, $df, $01, $df, $01, $dd, $dd, $01, $dd, $ef, $ee, $cd, $b7, $78
	db $ff, $ff, $dd, $57, $db, $dd, $df, $01, $ff, $ff, $e8, $ef, $de, $9e, $5e, $de
	db $d8, $d9, $01, $7f, $07, $f7, $07, $17, $01, $59, $dd, $db, $df, $de, $dd, $de
	db $ff, $ff, $75, $8f, $07, $af, $df, $23, $ff, $ff, $fe, $fe, $fe, $be, $9e, $ce
	db $f6, $fe, $ff, $ff, $ff, $f7, $e7, $cf, $bf, $ff, $fd, $fb, $f7, $ef, $df, $bf
	db $ff, $ff, $7f, $bf, $df, $ef, $f1, $fb, $ff, $ff, $80, $bf, $bf, $a0, $be, $be
	db $b0, $b6, $07, $f7, $b7, $17, $f7, $f7, $17, $d7, $b6, $b0, $be, $be, $a0, $7f
	db $ff, $ff, $d7, $17, $f5, $d5, $19, $ed, $ff, $ff, $00, $fe, $fe, $80, $ae, $76
	db $ee, $ff, $01, $ff, $ff, $01, $ed, $db, $ef, $ff, $e0, $ff, $80, $fb, $f7, $e0
	db $ff, $ff, $0f, $ff, $03, $ff, $ef, $07, $ff, $ff, $f7, $ee, $ef, $dd, $dd, $bb
	db $03, $f7, $fb, $01, $fb, $fb, $fb, $fb, $fb, $fb, $ef, $db, $bd, $00, $be, $fe
	db $ff, $ff, $fb, $fb, $fb, $bb, $d7, $ef, $ff, $ff, $ee, $ee, $02, $ce, $c6, $aa
	db $6a, $ee, $07, $f7, $07, $f7, $07, $f7, $f7, $07, $ff, $ed, $ae, $af, $6f, $f0
	db $ff, $ff, $ff, $ff, $7b, $6d, $ed, $0f, $ff, $ff, $ff, $ff, $c0, $df, $df, $d0
	db $df, $db, $7f, $7f, $01, $7d, $7b, $07, $f7, $ef, $dd, $de, $df, $be, $b9, $67
	db $ff, $ff, $df, $bf, $7f, $9f, $e1, $fb, $ff, $ff, $fd, $fd, $fc, $fd, $fd, $00
	db $fd, $fd, $ff, $df, $0f, $ff, $fb, $01, $ff, $ff, $fd, $fd, $fd, $fd, $fd, $fd
	db $ff, $ff, $7f, $9f, $cf, $ef, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $e1, $ef, $ef
	db $e0, $ef, $df, $8f, $7f, $ff, $ff, $ef, $07, $bf, $ef, $ef, $ef, $ef, $ef, $00
	db $ff, $ff, $bf, $bf, $bf, $bf, $bb, $01, $ff, $ff, $f7, $03, $ec, $ed, $dd, $dd
	db $84, $55, $df, $df, $01, $dd, $db, $df, $03, $7b, $d5, $d5, $c3, $db, $f7, $ec
	db $ff, $ff, $77, $af, $df, $af, $71, $fb, $ff, $ff, $f8, $f3, $e7, $cf, $cf, $cf
	db $cf, $cf, $37, $c7, $e7, $f7, $f7, $ff, $ff, $c3, $cf, $cf, $cf, $e7, $f3, $f8
	db $ff, $ff, $e7, $e7, $e7, $c7, $87, $27, $ff, $ff, $e0, $f3, $f3, $f3, $f3, $f3
	db $f3, $f0, $1f, $c7, $e3, $f3, $f3, $e3, $c7, $1f, $f3, $f3, $f3, $f3, $f3, $e1
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $e0, $e0, $e7, $e7, $e7, $e4
	db $e3, $e7, $07, $07, $ff, $ff, $ff, $1f, $e7, $f3, $ff, $ff, $e7, $e7, $f3, $fc
	db $ff, $ff, $f3, $f3, $f3, $f3, $e7, $1f, $ff, $ff, $f8, $f3, $e7, $e7, $e7, $e7
	db $e7, $e6, $0f, $e7, $f3, $e3, $c3, $93, $33, $73, $e4, $e1, $e3, $e7, $f3, $f8
	db $ff, $ff, $f3, $f3, $f3, $f3, $e7, $0f, $ff, $ff, $ee, $ee, $dc, $dd, $9b, $57
	db $df, $de, $ff, $fb, $01, $fb, $f7, $bf, $bf, $af, $de, $dd, $db, $df, $de, $df
	db $ff, $ff, $b7, $b3, $bb, $bf, $bf, $7f, $ff, $ff, $bf, $cf, $ef, $78, $9f, $df
	db $ff, $f0, $7f, $7f, $77, $03, $77, $77, $77, $01, $f7, $ee, $1e, $dd, $db, $d7
	db $ff, $ff, $7f, $bf, $df, $ef, $f1, $fb, $ff, $ff, $ec, $ed, $ec, $01, $ed, $e8
	db $e7, $c8, $07, $f7, $07, $f7, $f7, $07, $ff, $03, $2f, $ef, $e0, $ef, $af, $df
	db $ff, $ff, $bf, $bb, $01, $bf, $bf, $bf, $ff, $ff, $de, $b8, $7e, $e8, $df, $98
	db $5b, $d8, $ff, $21, $bf, $1f, $e1, $3b, $bb, $3b, $de, $d0, $d6, $d0, $de, $de
	db $ff, $ff, $fb, $1b, $fb, $1b, $fb, $f7, $ff, $ff, $eb, $ed, $ef, $01, $6b, $aa
	db $e7, $cf, $bf, $bf, $bb, $01, $77, $f7, $77, $af, $ab, $6d, $ef, $ef, $ae, $dd
	db $ff, $ff, $af, $df, $af, $77, $f1, $fb, $ff, $ff, $fb, $f8, $f7, $ef, $d0, $ff
	db $80, $ff, $ff, $1f, $bf, $6f, $07, $ef, $01, $ef, $e0, $fd, $ae, $ae, $6f, $f0
	db $ff, $ff, $0f, $f7, $fb, $ed, $ed, $0f, $ff, $ff, $7e, $9e, $d0, $fe, $7e, $9f
	db $d0, $f7, $ef, $ef, $01, $ef, $0f, $bf, $01, $bd, $e5, $d6, $35, $b3, $b7, $b7
	db $ff, $ff, $ad, $b5, $29, $9d, $b9, $bd, $ff, $ff, $fd, $fe, $80, $bf, $7f, $e0
	db $fe, $fe, $ff, $ff, $01, $fd, $db, $0f, $ff, $f7, $80, $fe, $fe, $fe, $fa, $fd
	db $ff, $ff, $03, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fd, $fe, $80, $bf, $7e, $fe
	db $c0, $de, $ff, $ff, $01, $fd, $fb, $ff, $07, $f7, $de, $c0, $de, $de, $c0, $df
	db $ff, $ff, $f7, $07, $f7, $f7, $07, $f7, $ff, $ff, $ef, $e8, $ef, $03, $ef, $cf
	db $c7, $ab, $fb, $01, $df, $df, $bf, $bf, $3f, $2f, $aa, $6d, $eb, $ef, $ef, $ef
	db $ff, $ff, $b7, $bb, $bd, $bf, $bf, $bf, $ff, $ff, $ef, $ef, $01, $bb, $d7, $01
	db $ff, $83, $ef, $ef, $01, $bb, $d7, $01, $ff, $83, $bb, $83, $d7, $d7, $b5, $73
	db $ff, $ff, $bb, $83, $d7, $d5, $b5, $71, $ff, $ff, $ef, $db, $81, $5a, $c1, $db
	db $c1, $db, $df, $b7, $03, $b7, $83, $b7, $83, $b7, $c1, $f0, $fd, $fe, $fd, $83
	db $ff, $ff, $83, $1f, $7f, $ff, $7f, $83, $ff, $ff, $fb, $c0, $fb, $00, $ef, $eb
	db $c0, $9b, $af, $b7, $bf, $01, $bf, $bf, $5f, $db, $40, $db, $c0, $db, $c0, $df
	db $ff, $ff, $d7, $cf, $df, $6d, $75, $f9, $ff, $ff, $f7, $07, $f7, $c0, $db, $c0
	db $ff, $80, $bf, $83, $7f, $07, $b7, $07, $ff, $01, $bd, $78, $f3, $fd, $fe, $f9
	db $ff, $ff, $fd, $1b, $bf, $7f, $ff, $ff, $ff, $ff, $df, $01, $bd, $63, $c0, $df
	db $c0, $c0, $ff, $81, $bd, $81, $03, $7f, $03, $03, $df, $c0, $ff, $b6, $76, $ff
	db $ff, $ff, $7f, $01, $fd, $dd, $eb, $f7, $ff, $ff, $fb, $01, $6f, $03, $6f, $03
	db $6f, $01, $ef, $ef, $01, $6d, $6d, $6d, $01, $ef, $fd, $b5, $b5, $49, $fd, $f3
	db $ff, $ff, $ef, $6f, $af, $df, $af, $71, $ff, $ff, $f6, $ee, $de, $be, $f5, $eb
	db $cc, $ae, $07, $ef, $ef, $ef, $f1, $ff, $07, $f7, $6e, $ef, $ef, $ef, $ec, $e3
	db $ff, $ff, $ef, $5f, $bf, $4f, $f1, $fb, $ff, $ff, $fe, $c0, $fe, $fe, $00, $f7
	db $fb, $c0, $ff, $07, $ff, $fb, $01, $df, $bf, $07, $fe, $fe, $80, $fe, $fe, $fe
	db $ff, $ff, $ff, $f7, $03, $ff, $ff, $ff, $ff, $ff, $70, $b7, $f8, $0f, $e8, $db
	db $b8, $7b, $01, $bd, $03, $bf, $03, $bb, $03, $bb, $b8, $df, $d0, $df, $af, $70
	db $ff, $ff, $03, $bf, $01, $bf, $bf, $01, $ff, $ff, $bf, $c8, $ef, $7d, $9d, $df
	db $f4, $ef, $e7, $1f, $f7, $b7, $af, $ff, $0f, $df, $df, $30, $bf, $bf, $be, $bf
	db $ff, $ff, $bb, $01, $bf, $bf, $bf, $7f, $ff, $ff, $e0, $f3, $f3, $f3, $f3, $f3
	db $f0, $f3, $07, $e7, $f7, $ff, $bf, $bf, $3f, $bf, $f3, $f3, $f3, $f3, $f3, $e1
	db $ff, $ff, $bf, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fe, $fc, $f8, $fe, $fe, $fe
	db $fe, $fe, $7f, $7f, $7f, $7f, $7f, $7f, $7f, $7f, $fe, $fe, $fe, $fe, $fe, $f0
	db $ff, $ff, $7f, $7f, $7f, $7f, $7f, $0f, $ff, $ff, $0c, $6b, $55, $5a, $6d, $6a
	db $67, $6c, $41, $5b, $67, $f7, $fb, $0d, $fd, $07, $2f, $5d, $7b, $77, $7f, $7f
	db $ff, $ff, $bf, $b7, $b9, $bd, $bf, $bf, $ff, $ff, $de, $dd, $d8, $03, $d9, $da
	db $d0, $cb, $c3, $db, $5b, $5b, $3d, $7f, $43, $5b, $19, $da, $db, $db, $5b, $b6
	db $ff, $ff, $5b, $5b, $67, $67, $5b, $3d, $ff, $ff, $bf, $d0, $df, $78, $9b, $db
	db $f3, $ea, $fb, $01, $5f, $03, $5b, $5b, $5b, $c3, $d9, $1b, $d8, $db, $d8, $db
	db $ff, $ff, $fb, $fb, $03, $fb, $03, $fb, $ff, $ff, $fe, $ff, $c0, $df, $df, $df
	db $df, $df, $ff, $7b, $01, $7f, $77, $03, $7f, $7f, $d8, $db, $bb, $bb, $78, $fb
	db $ff, $ff, $07, $f7, $f7, $f7, $07, $f7, $ff, $ff, $7f, $9e, $dd, $04, $ed, $dd
	db $dc, $bd, $7f, $ff, $f7, $03, $f7, $f7, $07, $ff, $dc, $ed, $ed, $ec, $d5, $38
	db $ff, $ff, $07, $f7, $f7, $07, $ff, $01, $ff, $ff, $fe, $86, $b5, $b3, $86, $ed
	db $e9, $ad, $ff, $bb, $bb, $55, $ef, $ff, $ef, $6f, $a5, $ad, $ad, $a5, $1c, $bd
	db $ff, $ff, $6f, $61, $6f, $6f, $af, $c1, $ff, $ff, $80, $fe, $fe, $e0, $ee, $ee
	db $e0, $ee, $03, $ff, $ef, $07, $ef, $ef, $0f, $ef, $ee, $00, $ef, $ef, $ef, $ef
	db $ff, $ff, $ef, $01, $ef, $ef, $af, $df, $ff, $ff, $fe, $06, $de, $de, $de, $de
	db $06, $de, $07, $f7, $f7, $07, $f7, $f7, $07, $f7, $de, $d6, $cf, $1f, $be, $f1
	db $ff, $ff, $f7, $07, $6f, $6f, $ed, $e1, $ff, $ff, $ef, $af, $ac, $83, $af, $68
	db $e7, $cf, $bf, $b7, $03, $bf, $bb, $01, $ef, $ef, $28, $ee, $ef, $ef, $ef, $ef
	db $ff, $ff, $01, $ef, $6f, $ef, $af, $df, $ff, $ff, $fe, $ff, $c0, $df, $50, $97
	db $d4, $d7, $ff, $7f, $03, $ff, $07, $f7, $17, $77, $94, $55, $d4, $d7, $af, $5c
	db $ff, $ff, $17, $57, $17, $75, $55, $19, $ff, $ff, $ff, $c0, $de, $de, $c0, $de
	db $de, $c0, $f7, $03, $f7, $f7, $07, $f7, $f7, $07, $fe, $fe, $80, $fe, $fe, $00
	db $ff, $ff, $ff, $f7, $03, $ff, $fb, $01, $ff, $ff, $fb, $e0, $ef, $e0, $ef, $e0
	db $ff, $c0, $ff, $0f, $ef, $0f, $ef, $0f, $ff, $07, $fe, $fe, $e0, $fe, $fe, $00
	db $ff, $ff, $ff, $df, $0f, $ff, $fb, $01, $ff, $ff, $df, $dc, $df, $07, $dd, $de
	db $d5, $cf, $bf, $01, $df, $b7, $0d, $db, $ad, $07, $9f, $58, $df, $df, $5f, $bf
	db $ff, $ff, $df, $01, $df, $df, $df, $df, $ff, $ff, $f0, $ef, $df, $a0, $6e, $ee
	db $e0, $ee, $1f, $bf, $77, $03, $f7, $f7, $07, $f7, $ee, $e0, $ef, $ef, $df, $bf
	db $ff, $ff, $f7, $07, $f7, $f7, $d7, $ef, $ff, $ff, $fe, $80, $bb, $80, $aa, $aa
	db $9b, $b0, $ff, $03, $df, $03, $97, $57, $5b, $0f, $b8, $bf, $a0, $bf, $7d, $fe
	db $ff, $ff, $0f, $7f, $03, $7f, $7f, $ff, $ff, $ff, $c1, $fd, $eb, $f3, $f7, $e0
	db $df, $30, $6f, $5f, $b7, $af, $df, $0f, $f1, $1b, $f7, $f0, $f7, $fb, $fd, $80
	db $ff, $ff, $df, $1f, $df, $bf, $77, $03, $ff, $ff, $ef, $ef, $ef, $03, $da, $d8
	db $db, $db, $bf, $bf, $7f, $77, $fb, $01, $fd, $ff, $b6, $d6, $c6, $ba, $7a, $fe
	db $ff, $ff, $03, $fb, $fb, $fb, $03, $fb, $ff, $ff, $e0, $ef, $e8, $ef, $e8, $80
	db $bb, $80, $0f, $ef, $2f, $ef, $2f, $03, $bb, $03, $bf, $f0, $fb, $fd, $fe, $81
	db $ff, $ff, $fb, $1f, $bf, $7f, $ff, $03, $ff, $ff, $fe, $80, $bb, $60, $fb, $e0
	db $fb, $80, $ff, $01, $bd, $0b, $bf, $0f, $bf, $03, $f6, $ee, $d0, $3e, $fe, $c0
	db $ff, $ff, $df, $ef, $11, $fb, $ff, $07, $ff, $ff, $f7, $f7, $00, $f7, $fb, $83
	db $fb, $fb, $df, $db, $01, $df, $b7, $83, $bf, $b7, $83, $fb, $fb, $03, $fb, $fb
	db $ff, $ff, $83, $bf, $bb, $81, $bf, $bf, $ff, $ff, $fd, $fd, $fd, $00, $fd, $fd
	db $fd, $fd, $ff, $ff, $fb, $01, $fb, $fb, $fb, $fb, $fb, $fb, $f7, $ef, $df, $3f
	db $ff, $ff, $fb, $fb, $fb, $bb, $d7, $ef, $ff, $ff, $f8, $f3, $e7, $e7, $f3, $f8
	db $fe, $ff, $17, $c7, $e7, $f7, $ff, $ff, $3f, $8f, $ff, $ef, $e7, $e3, $e9, $ec
	db $ff, $ff, $e7, $f3, $f3, $f3, $e7, $0f, $ff, $ff, $c0, $e7, $e7, $e7, $e7, $e7
	db $e7, $e7, $3f, $8f, $e3, $f3, $f3, $f3, $f3, $f3, $e7, $e7, $e7, $e7, $e7, $c0
	db $ff, $ff, $f3, $f3, $f3, $e7, $8f, $3f, $ff, $ff, $7d, $90, $df, $7f, $90, $df
	db $ff, $d0, $df, $5f, $c1, $b7, $77, $f7, $f7, $41, $df, $30, $b7, $b7, $b0, $b7
	db $ff, $ff, $f7, $77, $77, $77, $77, $77, $ff, $ff, $fe, $80, $bf, $40, $ff, $e0
	db $ef, $e0, $ff, $01, $fd, $0d, $ff, $0f, $ef, $0f, $ff, $c0, $de, $c0, $de, $c0
	db $ff, $ff, $ff, $07, $f7, $07, $f7, $07, $ff, $ff, $fb, $f6, $cd, $3b, $f0, $ff
	db $81, $dd, $bf, $df, $e7, $b9, $1f, $ef, $03, $bb, $ed, $f9, $e5, $9d, $f5, $fb
	db $ff, $ff, $db, $f3, $cb, $3b, $eb, $f7, $ff, $ff, $f7, $f7, $80, $f7, $00, $f7
	db $f7, $80, $f7, $f7, $f7, $01, $f7, $f7, $b7, $d7, $f7, $f7, $f0, $87, $df, $ff
	db $ff, $ff, $d7, $f7, $f7, $f7, $d7, $ef, $ff, $ff, $ef, $ee, $ef, $03, $ec, $cd
	db $c7, $a8, $df, $03, $77, $af, $01, $bb, $df, $01, $af, $6f, $ef, $ee, $ed, $eb
	db $ff, $ff, $7f, $07, $77, $f7, $d7, $ef, $ff, $ff, $ff, $83, $bb, $ba, $b9, $83
	db $af, $ee, $bf, $83, $7b, $77, $af, $df, $af, $77, $a2, $af, $af, $a3, $0f, $bf
	db $ff, $ff, $f9, $07, $77, $77, $07, $77, $ff, $ff, $fb, $fb, $00, $fb, $fe, $e0
	db $ee, $ee, $bf, $bb, $01, $bf, $ff, $0f, $ef, $ef, $00, $fd, $fb, $f7, $cf, $3f
	db $ff, $ff, $01, $7f, $bf, $cf, $f1, $fb, $ff, $ff, $ef, $ee, $02, $ee, $ec, $da
	db $de, $ae, $3f, $db, $01, $df, $df, $03, $df, $df, $ae, $5e, $da, $ba, $82, $fa
	db $ff, $ff, $03, $df, $df, $db, $01, $ff, $ff, $ff, $fe, $fe, $00, $fe, $fe, $fe
	db $80, $ff, $ff, $fb, $01, $ff, $ff, $ff, $03, $ff, $fd, $ae, $af, $af, $6f, $f0
	db $ff, $ff, $ff, $7f, $7b, $ed, $ed, $0f, $ff, $ff, $ff, $00, $fb, $fb, $fb, $80
	db $bb, $bb, $fb, $01, $bf, $bf, $bb, $01, $bb, $bb, $bb, $b7, $af, $bf, $80, $bf
	db $ff, $ff, $bb, $c3, $fb, $fb, $03, $fb, $ff, $ff, $df, $ef, $01, $ff, $83, $ff
	db $83, $ff, $ff, $01, $fd, $fd, $fd, $01, $7d, $7f, $83, $bb, $bb, $bb, $83, $bb
	db $ff, $ff, $7f, $7f, $7f, $7d, $7d, $81, $ff, $ff
