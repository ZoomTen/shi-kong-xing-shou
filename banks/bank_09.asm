Func_009_4000::
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, HIGH(wVisibleObjects)
	jr Func_009_4010

Func_009_4008::
; Only run on every other tick
	ldh a, [hFadeFrameCounter]
	and 1
	ret nz

	ld bc, wcd40

Func_009_4010:
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, Func_009_404e
	ld hl, $000F
	add hl, bc
	ld a, [hl]
	and a
	jp z, Func_009_405e
	cp $01
	jr z, .asm_403f
	dec [hl]
	ld a, [hl]
	cp $01
	jr nz, Func_009_404e
	inc hl
	ld a, [hl]
	call Func_009_40b8
	and a
	jr z, Func_009_404e
	ld a, [hFFD6]
	and a
	jp nz, Func_009_4096
	dec hl
	ld [hl], $0F
	jr Func_009_404e
.asm_403f
	inc hl
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	ld de, Jumptable_009_4252
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

	dec [hl]
Func_009_404e:
	ldh a, [hFFD6]
	and a
	ret nz
	ld hl, $0020
	add hl, bc
	ld c, l
	ld b, h
	ld a, l
	cp $E0
	ret nc
	jr Func_009_4010
Func_009_405e:
	ld hl, $0008
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, hl
	ld de, Pointers_009_419b
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $000E
	add hl, bc
	ld a, [hl]
	pop hl
	ld e, a
	ld d, $00
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	cp $FF
	jr nz, Func_009_40a6
	ld hl, $000E
	add hl, bc
	ld [hl], $00
	ld a, [bc]
	ld [wcd08], a
	inc bc
	ld a, [bc]
	ld [wcd09], a
	dec bc
	ldh a, [hFFD6]
	and a
	jp z, Func_009_404e
Func_009_4096:
	ld hl, $0008
	add hl, bc
	ld [hl], $00
	xor a
	ld [wScriptByte], a
	ld [wd1e2], a
	jp Func_009_404e
Func_009_40a6:
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld hl, $000E
	add hl, bc
	inc [hl]
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], a
	jp Func_009_404e
Func_009_40b8:
	push hl
	push de
	and a
	jp z, .asm_418f
	cp $05
	jp nc, .asm_418f
	dec a
	push af
	ldh a, [hSCY]
	ld l, a
	ldh a, [hSCYHigh]
	ld h, a
	ld a, [wd0c4]
	ld e, a
	ld a, [wd0c4 + 1]
	ld d, a
	add hl, de
	ld a, [bc]
	sub $10
	cp $E0
	jr c, .asm_40e6
	cpl
	ld e, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc $00
	ld h, a
	jr .asm_40ea
.asm_40e6
	ld e, a
	ld d, $00
	add hl, de
.asm_40ea
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	ld [wPlayerMap2Y], a
	ldh a, [hSCX]
	ld l, a
	ldh a, [hSCXHigh]
	ld h, a
	ld a, [wd0c6]
	ld e, a
	ld a, [wd0c6 + 1]
	ld d, a
	add hl, de
	inc bc
	ld a, [bc]
	sub $08
	dec bc
	cp $D0
	jr c, .asm_4121
	cpl
	ld e, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc $00
	ld h, a
	jr .asm_4125
.asm_4121
	ld e, a
	ld d, $00
	add hl, de
.asm_4125
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	ld [wd0c3], a
	pop af
	ld de, unk_009_4193
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [wPlayerMap2Y]
	add [hl]
	ld [wd0c0], a
	inc hl
	ld a, [wd0c3]
	add [hl]
	ld [wd0c1], a
	ld hl, wd0c0
	ld a, [wPlayerMapY]
	cp [hl]
	jr nz, .asm_4171
	inc hl
	ld a, [wPlayerMapX]
	cp [hl]
	jr nz, .asm_4171
.asm_4161
	ld hl, $0012
	add hl, bc
	ld a, [wPlayerMap2Y]
	ld [hli], a
	ld a, [wd0c3]
	ld [hl], a
	ld a, $01
	jr .asm_4190
.asm_4171
	ld hl, wd0c0
	ld a, [wcd32]
	cp [hl]
	jr nz, .asm_4183
	inc hl
	ld a, [wcd32 + 1]
	cp [hl]
	jr nz, .asm_4183
	jr .asm_4161
.asm_4183
	ld hl, $0012
	add hl, bc
	ld a, [wd0c0]
	ld [hli], a
	ld a, [wd0c1]
	ld [hl], a
.asm_418f
	xor a
.asm_4190
	pop de
	pop hl
	ret

; TODO: facing (x, y) delta table, indexed by direction (1-4), *2
unk_009_4193:
	db $01, $00, $ff, $00, $00, $ff, $00, $01
; TODO: pointer table into unk_009_41b5 records, indexed by object field $0008, *2
Pointers_009_419b:
	dw $41b5, $41b6, $41ba, $41be, $41c2, $41c6, $41d3
	dw $41e0, $41f9, $4212, $4225, $4238, $424b
; TODO: 3-byte records, $ff-terminated lists; stepped by object field $000e, *3
unk_009_41b5:
	db $ff, $01, $01, $10, $ff, $01, $02, $10, $ff, $01, $03, $10
	db $ff, $01, $04, $10, $ff, $3f, $02, $10, $7f, $02, $10, $3f
	db $01, $10, $3f, $01, $10, $ff, $3f, $03, $10, $3f, $03, $10
	db $3f, $04, $10, $7f, $04, $10, $ff, $1f, $03, $10, $1f, $03
	db $10, $1f, $01, $10, $1f, $04, $10, $1f, $04, $10, $1f, $04
	db $10, $1f, $02, $10, $6f, $03, $10, $ff, $1f, $04, $10, $1f
	db $04, $10, $1f, $02, $10, $1f, $02, $10, $1f, $03, $10, $1f
	db $03, $10, $1f, $01, $10, $1f, $01, $10, $ff, $3f, $02, $10
	db $3f, $02, $10, $1f, $03, $10, $1f, $01, $10, $2f, $01, $10
	db $6f, $04, $10, $ff, $1f, $01, $10, $2f, $01, $10, $3f, $01
	db $10, $3f, $02, $10, $4f, $02, $10, $5f, $02, $10, $ff, $4f
	db $04, $10, $3f, $04, $10, $2f, $04, $10, $1f, $03, $10, $2f
	db $03, $10, $3f, $03, $10, $ff, $3f, $03, $10, $3f, $04, $10
	db $ff
; TODO: action handlers indexed by object field $000f, *2; jumped via jp hl
Jumptable_009_4252:
	dw Func_009_425c, Func_009_426f, Func_009_42a2, Func_009_42cd, Func_009_42fd

Func_009_425c:
	ldh a, [hFadeFrameCounter]
	and $03
	jp nz, Func_009_404e
	ld hl, $0011
	add hl, bc
	ld a, [hl]
	and a
	jr z, Func_009_4299
	dec [hl]
	jp Func_009_404e

Func_009_426f:
	ld hl, $0011
	add hl, bc
	ld a, [hl]
	and a
	jr z, Func_009_4299
	dec [hl]
	ld a, [bc]
	inc a
	ld [bc], a
	ld hl, $000D
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4285
	ld [hl], $01
.asm_4285
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jp z, Func_009_404e
	ld [hl], $00
	ld hl, $000D
	add hl, bc
	ld [hl], $01
	jp Func_009_404e
Func_009_4299:
	ld hl, $000F
	add hl, bc
	ld [hl], $00
	jp Func_009_404e

Func_009_42a2:
	ld hl, $0011
	add hl, bc
	ld a, [hl]
	and a
	jr z, Func_009_4299
	dec [hl]
	ld a, [bc]
	dec a
	ld [bc], a
	ld hl, $000D
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_42b8
	ld [hl], $01
.asm_42b8
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	cp $01
	jp z, Func_009_404e
	ld [hl], $01
	ld hl, $000D
	add hl, bc
	ld [hl], $01
	jp Func_009_404e

Func_009_42cd:
	ld hl, $0011
	add hl, bc
	ld a, [hl]
	and a
	jp z, Func_009_4299
	dec [hl]
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	ld hl, $000D
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_42e8
	ld [hl], $01
.asm_42e8
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	cp $02
	jp z, Func_009_404e
	ld [hl], $02
	ld hl, $000D
	add hl, bc
	ld [hl], $01
	jp Func_009_404e

Func_009_42fd:
	ld hl, $0011
	add hl, bc
	ld a, [hl]
	and a
	jp z, Func_009_4299
	dec [hl]
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld hl, $000D
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4318
	ld [hl], $01
.asm_4318
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	cp $03
	jp z, Func_009_404e
	ld [hl], $03
	ld hl, $000D
	add hl, bc
	ld [hl], $01
	jp Func_009_404e
	db $00, $00, $00

