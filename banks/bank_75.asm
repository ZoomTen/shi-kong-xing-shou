Func_075_4000:
	jp Func_075_40bd
	jp Func_075_4026
ChannelRegisterPairs:
	dr $1d4006, $1d4016
ChannelPanMasks:
	dr $1d4016, $1d401a
unk_75_401A:
	dr $1d401a, $1d4026
Func_075_4026:
	ld a, $80
	ldh [rNR52], a
	ldh [rNR30], a
	swap a
	ldh [rNR12], a
	ldh [rNR22], a
	ldh [rNR32], a
	ldh [rNR42], a
	swap a
	ldh [rNR14], a
	ldh [rNR24], a
	ldh [rNR34], a
	ldh [rNR44], a
	ld a, $77
	ldh [rNR50], a
	xor a
	ldh [rNR10], a
	ldh [rNR51], a
	ld de, $0010
	ld hl, wMapEvents
	ld b, $08
.asm_4051
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_4051
	ld a, $80
	ld [wMapEvents + $2B], a
	ld [wMapEvents + $6B], a
	ret
Func_75_405f:
	ld hl, wMapEvents + $80
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
	jr z, Func_075_4026
	ld de, SongHeaderPointers
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
	ldh [rNR10], a
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

Func_075_40bd:
	ld b, $08
Func_075_40bf:
	ld h, $DF
Func_75_40c1:
	dec b
	bit 7, b
	jp nz, Func_75_405f
	ld l, b
	swap l
	ld a, [hl]
	bit 0, a
	jr z, Func_075_40bf
	inc l
	dec [hl]
	jr z, .asm_4116
	inc l
	dec [hl]
	jr nz, Func_75_40c1
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
	ld de, wMapEvents + $90
	ld a, [wMapEvents + $84]
	add e
	ld e, a
	ld a, c
	ld [de], a
	dec l
	dec l
	bit 7, [hl]
	jr nz, Func_75_40c1
	push hl
	ld hl, ChannelRegisterPairs
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
	jr Func_75_40c1
.asm_4116
	ld a, b
	ld [wMapEvents + $84], a
	dec l
	set 3, l
	ld e, [hl]
	inc l
	ld d, [hl]
Func_075_4120:
	inc de
Func_075_4121:
	ld a, [de]
	bit 7, a
	jr z, .asm_419e
	bit 6, a
	jr z, .asm_413e
	bit 5, a
	jr z, .asm_414f
	push hl
	ld hl, SoundCommandJumpTable
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
	ld hl, Table_75_45CF
	add hl, bc
	ld a, [hl]
	pop hl
	inc l
	ld [hl], a
	dec l
	jr Func_075_4120
.asm_414f
	and $1F
	ld b, a
	ld a, [wMapEvents + $84]
	and $03
	add b
	push hl
	ld hl, ChannelPanMasks
	add l
	ld l, a
	ld a, $00
	adc h
	ld h, a
	ld a, [hl]
	ld hl, wMapEvents + $88
	ld b, a
	ld a, [wMapEvents + $84]
	add l
	ld l, a
	ld [hl], b
	pop hl
	jr Func_075_4120
.asm_4170
	push hl
	ld hl, wMapEvents + $90
	ld a, [wMapEvents + $84]
	add l
	ld l, a
	ld a, $08
	ld [hl], a
	pop hl
	ld a, [wMapEvents + $84]
	ld b, a
	res 3, l
	set 1, [hl]
	bit 7, [hl]
	jp nz, Func_75_40c1
	ld a, b
	ld hl, wMapEvents + $88
	add l
	ld l, a
	ld a, [hl]
	cpl
	ld c, a
	ldh a, [rNR51]
	and c
	swap c
	and c
	ldh [rNR51], a
	jp Func_075_40bf
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
	ld a, [wMapEvents + $84]
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
	ld hl, NoteFrequencyTable
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec c
	ld a, [bc]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wMapEvents + $84]
	and $03
	cp $02
	jr nz, .asm_41dd
	ldh a, [rNR52]
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
	ld de, wMapEvents + $90
	ld a, [wMapEvents + $84]
	add e
	ld e, a
	ld a, c
	ld [de], a
	dec l
	dec l
	bit 7, [hl]
	jr nz, .asm_424e
	push hl
	ld hl, ChannelRegisterPairs
	ld c, a
	ld a, [wMapEvents + $84]
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
	ld hl, wMapEvents + $88
	ld a, [wMapEvents + $84]
	add l
	ld l, a
	ld a, [hl]
	ld b, a
	cpl
	ld e, a
	ldh a, [rNR51]
	and e
	swap e
	and e
	or b
	ldh [rNR51], a
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
	ld a, [wMapEvents + $84]
	ld b, a
	jp Func_075_40bf
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
	ld de, wMapEvents + $90
	ld a, [wMapEvents + $84]
	add e
	ld e, a
	ld a, b
	ld [de], a
	dec l
	res 2, l
	bit 7, [hl]
	jr nz, .asm_424f
	ldh [rNR42], a
	ld hl, wMapEvents + $88
	ld a, [wMapEvents + $84]
	add l
	ld l, a
	ld a, [hl]
	ld b, a
	cpl
	ld e, a
	ldh a, [rNR51]
	and e
	swap e
	and e
	or b
	ldh [rNR51], a
	ld a, c
	ldh [rNR43], a
	ld a, $80
	ldh [rNR44], a
	jr .asm_424f
SoundCommandJumpTable:
	dr $1d42a6, $1d42c6
Func_075_42c6:
	pop hl
	jp Func_075_4120

Func_075_42ca:
	inc de
	ld a, [de]
	add a
	ld hl, InstrumentPointers
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
	jp Func_075_4120

Func_075_42e7:
	inc de
	ld a, [de]
	pop hl
	set 1, l
	ld [hl], a
	res 1, l
	jp Func_075_4120

Func_075_42f2:
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
	jp Func_075_4120

Func_075_4301:
	inc de
	pop hl
	dec l
	dec l
	ld a, [de]
	ld [hl], a
	inc l
	inc l
	jp Func_075_4120

Func_075_430c:
	inc de
	ld a, [wMapEvents + $84]
	ld c, a
	add a
	add c
	ld hl, wMapEvents + $A8
	add l
	ld l, a
	ld a, [de]
	ld [hl], a
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	pop hl
	jp Func_075_4120

Func_075_4322:
	ld a, [wMapEvents + $84]
	ld c, a
	add a
	add c
	ld hl, wMapEvents + $A8
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
	jp Func_075_4120

Func_075_4338:
	ld a, [wMapEvents + $84]
	add a
	ld hl, wMapEvents + $98
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
	jp Func_075_4121

Func_075_434f:
	ld a, [wMapEvents + $84]
	add a
	ld hl, wMapEvents + $98
	add l
	ld l, a
	ld e, [hl]
	inc l
	ld d, [hl]
	pop hl
	jp Func_075_4120

Func_075_435f:
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld e, c
	ld d, a
	pop hl
	jp Func_075_4121

Func_075_436a:
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
	jp Func_075_4120

Func_075_4377:
	pop hl
	inc de
	ld a, [de]
	ld c, a
	ld a, [wMapEvents + $84]
	and a
	jr z, .asm_4387
	ld a, c
	ldh [rNR10], a
	jp Func_075_4120
.asm_4387
	ld a, c
	ld [wMapEvents + $85], a
	dec l
	res 3, l
	set 2, [hl]
	bit 7, [hl]
	jp nz, .asm_4397
	ldh [rNR10], a
.asm_4397
	set 3, l
	inc l
	jp Func_075_4120

Func_075_439d:
	pop hl
	ld a, [wMapEvents + $84]
	and a
	jr z, .asm_43aa
	xor a
	ldh [rNR10], a
	jp Func_075_4120
.asm_43aa
	xor a
	ld [wMapEvents + $85], a
	dec l
	res 3, l
	bit 7, [hl]
	res 2, [hl]
	jp nz, .asm_43bb
	xor a
	ldh [rNR10], a
.asm_43bb
	set 3, l
	inc l
	jp Func_075_4120

Func_075_43c1:
	ld a, [wMapEvents + $84]
	cp $06
	jr z, .asm_43e1
	ld hl, wMapEvents + $86
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
	call Func_75_43ee
.asm_43ea
	pop hl
	jp Func_075_4120
Func_75_43ee:
	xor a
	ldh [rNR32], a
	ldh [rNR30], a
	ld a, $80
	ldh [rNR34], a
	ld b, $10
	ld c, $30
.asm_43fb
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .asm_43fb
	ld a, $80
	ldh [rNR30], a
	ld a, [wMapEvents + $84]
	ret

Func_075_4409:
	pop hl
	dec hl
	res 3, l
	res 0, [hl]
	ld a, [wMapEvents + $84]
	cp $04
	jr nc, .asm_4434
	bit 7, [hl]
	jr nz, .asm_442d
.asm_441a
	ld hl, ChannelRegisterPairs
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
	ld a, [wMapEvents + $84]
	ld b, a
	jp Func_075_40bf
.asm_4434
	res 6, l
	res 7, [hl]
	bit 0, [hl]
	ld a, [wMapEvents + $84]
	jr z, .asm_441a
	cp $04
	jr nz, .asm_444d
	xor a
	bit 2, [hl]
	jr z, .asm_444b
	ld a, [wMapEvents + $85]
.asm_444b
	ldh [rNR10], a
.asm_444d
	ld a, [wMapEvents + $84]
	res 2, a
	ld [wMapEvents + $84], a
	ld de, wMapEvents + $90
	add e
	ld e, a
	push hl
	ld a, [wMapEvents + $84]
	cp $02
	call z, .asm_44a2
	ld hl, wMapEvents + $88
	add l
	ld l, a
	ld a, [hl]
	ld b, a
	cpl
	ld c, a
	ldh a, [rNR51]
	and c
	swap c
	and c
	or b
	ldh [rNR51], a
	ld hl, ChannelRegisterPairs
	ld a, [wMapEvents + $84]
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
	ld a, [wMapEvents + $84]
	set 2, a
	ld b, a
	jp Func_075_40bf
.asm_44a2
	ld hl, wMapEvents + $86
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_75_43ee
NoteFrequencyTable:
	dr $1d44ab, $1d4553
SongHeaderPointers:
	dr $1d4553, $1d45cf
Table_75_45CF:
	dr $1d45cf, $1d45ef
unk_75_45EF:
	dr $1d45ef, $1d45ff
unk_75_45FF:
	dr $1d45ff, $1d460f
InstrumentPointers:
	dr $1d460f, $1d4655
SoundInstruments:
	dr $1d4655, $1d4786
SoundSongData:
	dr $1d4786, $1d7a60
