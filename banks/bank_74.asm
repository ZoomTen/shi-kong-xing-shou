; Bank 0 of a self-contained 32 KB MBC1 DMG ROM embedded in the cart: a
; multicart boot menu. Runs at $0000 base, but lives in bank 74's $4000
; window. mc_call/mc_jp subtract $4000 so an in-bank label resolves to the
; embedded ROM's $0000-base operand; bank-1/RAM targets stay raw.
; Bank 1 is at bank 75. Header/logo, font and tile data stay as db.

MACRO mc_call
if _NARG == 1
	call \1 - $4000
else
	call \1, \2 - $4000
endc
ENDM

MACRO mc_jp
if _NARG == 1
	jp \1 - $4000
else
	jp \1, \2 - $4000
endc
ENDM

Multicart_GBROM::
	mc_jp Multicart_Func_01d0
	db $00, $00, $00, $00, $00
	mc_jp Multicart_Func_0100
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	push hl
	push af
	rst $30
	pop af
	pop hl
	ret
	db $00, $00
	ld hl, $df80
	ld a, [hl]
	inc a
	cp $04
	ret nc
	ld [hl], a
	add l
	ld l, a
	ld a, [$d812]
	ld [hl], a
	ret
	mc_jp Multicart_Func_0275
	db $00, $00, $00, $00, $00
	mc_jp Multicart_Func_02d6
	db $00, $00, $00, $00, $00
	mc_jp Multicart_Func_02d7
	db $00, $00, $00, $00, $00
	mc_jp Multicart_Func_02d6
	db $00, $00, $00, $00, $00
	mc_jp Multicart_Func_02d6
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Multicart_Func_0100:
	nop
	mc_jp Multicart_Func_01d0
	db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
	db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
	db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80
	db $00, $00, $00, $01, $00, $00, $00, $00, $00, $66, $e1, $38, $c3, $d0, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $36, $63, $e3, $0e, $00, $07, $00, $0e, $36, $66, $e3, $07, $76, $67, $e3, $3e
	db $36, $66, $e3, $00, $00, $00, $00, $00, $06, $30, $33, $e0, $00, $00, $00, $00
	db $66, $30, $33, $f0, $66, $70, $33, $e0, $66, $30, $03, $e0, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $03, $03, $02, $00, $00, $00, $df, $00, $00
Multicart_Func_01d0:
	ld a, $00
	inc a
	ld [$d700], a
Multicart_01d6:
	ldh a, [$ff44]
	cp $91
	jr nz, Multicart_01d6
	ld bc, $d600
Multicart_01df:
	ldh a, [c]
	ld [bc], a
	inc bc
	ld a, c
	cp $00
	jr nz, Multicart_01df
	ld hl, $ff40
	res 7, [hl]
	res 0, [hl]
	res 1, [hl]
	ld sp, $d1ff
	xor a
	ld hl, $ff80
	ld bc, $0080
	mc_call Multicart_Func_07ef
	xor a
	ld [$d813], a
	ldh [$ff99], a
	ldh [$ff9b], a
	ld c, $80
	ld b, $0a
	ld hl, $026b
Multicart_020c:
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, Multicart_020c
	ld a, $01
	ld [$3fff], a
	ldh [$ff91], a
	ldh [$ff92], a
	ld a, $d0
	ldh [$ff48], a
	ld a, $e4
	ldh [$ff47], a
	ldh [$ff49], a
	xor a
	ldh [$ff43], a
	ldh [$ff42], a
	ldh [$ff4a], a
	ld a, $07
	ldh [$ff4b], a
	ld a, $55
	ldh [$ffa4], a
	ld a, $aa
	ldh [$ffa5], a
	mc_call Multicart_Func_0808
	ld bc, $4003
	ld a, $03
	ldh [$ff07], a
	ld a, $07
	ldh [$ff07], a
	xor a
	ldh [$ff01], a
	ldh [$ff02], a
	ld a, $05
	ldh [$ffff], a
	ld a, $80
	ldh [$ff40], a
	ld a, $00
	ld [$d824], a
	ld a, $00
	ld [$d825], a
	ld a, $00
	ld [$d826], a
	ld a, $aa
	ld [$5000], a
	ei
	mc_jp Multicart_Func_02ef
Multicart_Func_026b:
	ld a, $d2
	ldh [$ff46], a
	ld a, $28
Multicart_0271:
	dec a
	jr nz, Multicart_0271
	ret
Multicart_Func_0275:
	push af
	push bc
	push de
	push hl
	ld a, [$d813]
	bit 0, a
	call nz, $ff80
	mc_call Multicart_Func_0294
	mc_call Multicart_Func_1264
	ld hl, $00a4
	inc [hl]
	xor a
	ldh [$ff90], a
	xor a
	pop hl
	pop de
	pop bc
	pop af
	reti
Multicart_Func_0294:
	push bc
	ld a, [$d817]
	ld [$d818], a
	ld a, [$d815]
	ld [$d816], a
	ld a, $20
	ldh [$ff00], a
	ldh a, [$ff00]
	ldh a, [$ff00]
	cpl
	and $0f
	swap a
	ld b, a
	ld a, $10
	ldh [$ff00], a
	ldh a, [$ff00]
	ldh a, [$ff00]
	ldh a, [$ff00]
	ldh a, [$ff00]
	ldh a, [$ff00]
	ldh a, [$ff00]
	cpl
	and $0f
	or b
	ld b, a
	ld a, $30
	ldh [$ff00], a
	ld a, [$d815]
	xor b
	and b
	ld [$d817], a
	ld a, b
	ld [$d815], a
	pop bc
	ret
Multicart_Func_02d6:
	reti
Multicart_Func_02d7:
	push af
	push bc
	push de
	push hl
	ldh a, [$ff91]
	push af
	ld a, $01
	ld [$3fff], a
	call $4000
	pop af
	ld [$3fff], a
	pop hl
	pop de
	pop bc
	pop af
	reti
Multicart_Func_02ef:
	ld hl, $d200
	ld bc, $00a0
	xor a
	mc_call Multicart_Func_07ef
	mc_call Multicart_Func_08ee
	ld a, $01
	ld [$d813], a
	mc_call Multicart_Func_088f
	ld hl, $ff40
	set 6, [hl]
	res 3, [hl]
	res 4, [hl]
	res 1, [hl]
	ld bc, $0000
	mc_call Multicart_Func_090c
	ld bc, $2020
	ld a, $00
	mc_call Multicart_Func_07a6
	ld de, $0d42
	ld hl, $9000
	ld bc, $0010
	mc_call Multicart_Func_06b7
	mc_call Multicart_Func_08d4
	ld de, $0d42
	ld hl, $8800
	ld bc, $0490
	mc_call Multicart_Func_06b7
	mc_call Multicart_Func_03d1
	ld de, $1304
	ld hl, $9020
	ld bc, $0240
	mc_call Multicart_Func_06ab
	ld bc, $0000
	mc_call Multicart_Func_090c
	ld bc, $2002
	ld a, $c8
	mc_call Multicart_Func_07a6
	ld a, [$d700]
	or a
	jr z, Multicart_036f
	mc_call Multicart_Func_03b3
	ld bc, $0000
	mc_call Multicart_Func_090c
	ld bc, $2002
	ld a, $01
	mc_call Multicart_Func_07a6
	mc_call Multicart_Func_03c2
Multicart_036f:
	ld bc, $0010
	mc_call Multicart_Func_090c
	ld bc, $2002
	ld a, $c8
	mc_call Multicart_Func_07a6
	ld a, [$d700]
	or a
	jr z, Multicart_0397
	mc_call Multicart_Func_03b3
	ld bc, $0010
	mc_call Multicart_Func_090c
	ld bc, $2002
	ld a, $02
	mc_call Multicart_Func_07a6
	mc_call Multicart_Func_03c2
Multicart_0397:
	ld bc, $0100
	mc_call Multicart_Func_090c
	ld de, $122a
	ld bc, $1202
	mc_call Multicart_Func_077e
	ld a, $00
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_088f
	mc_call Multicart_Func_12fd
	ret
Multicart_Func_03b3:
	di
	ldh a, [$ff41]
	bit 1, a
	jr z, Multicart_03bc
	jr Multicart_Func_03b3
Multicart_03bc:
	ld a, $01
	ldh [$ff4f], a
	ei
	ret
Multicart_Func_03c2:
	di
	ldh a, [$ff41]
	bit 1, a
	jr z, Multicart_03cb
	jr Multicart_Func_03c2
Multicart_03cb:
	ld a, $00
	ldh [$ff4f], a
	ei
	ret
Multicart_Func_03d1:
	ld a, [$d700]
	or a
	ret z
	di
	mc_call Multicart_Func_043f
	ld a, $80
	ldh [$ff68], a
	ld b, $08
	ld hl, $0446
Multicart_03e3:
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff69], a
	ld a, [hli]
	ldh [$ff69], a
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff69], a
	ld a, [hli]
	ldh [$ff69], a
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff69], a
	ld a, [hli]
	ldh [$ff69], a
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff69], a
	ld a, [hli]
	ldh [$ff69], a
	dec b
	jr nz, Multicart_03e3
	mc_call Multicart_Func_043f
	ld a, $80
	ldh [$ff6a], a
	ld b, $08
	ld hl, $0486
Multicart_0416:
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff6b], a
	ld a, [hli]
	ldh [$ff6b], a
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff6b], a
	ld a, [hli]
	ldh [$ff6b], a
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff6b], a
	ld a, [hli]
	ldh [$ff6b], a
	mc_call Multicart_Func_043f
	ld a, [hli]
	ldh [$ff6b], a
	ld a, [hli]
	ldh [$ff6b], a
	dec b
	jr nz, Multicart_0416
	ei
	ret
Multicart_Func_043f:
	ldh a, [$ff41]
	bit 1, a
	ret z
	jr Multicart_Func_043f
	db $00, $5c, $e0, $02, $17, $5c, $f7, $5e, $0e, $2c, $17, $00, $e0, $02, $f7, $02
	db $00, $00, $17, $5c, $f7, $02, $17, $00, $f7, $5e, $eb, $02, $20, $01, $17, $00
	db $f7, $5e, $f4, $09, $2f, $01, $00, $00, $f7, $5e, $31, $02, $11, $01, $00, $00
	db $f7, $5e, $0c, $01, $c9, $00, $00, $00, $f7, $5e, $6f, $01, $ab, $00, $00, $00
	db $f7, $5e, $f7, $02, $e0, $02, $e0, $32, $f7, $5e, $f7, $02, $e0, $02, $00, $5c
	db $f7, $5e, $f7, $02, $e0, $02, $00, $5c, $f7, $5e, $f7, $02, $e0, $02, $00, $5c
	db $f7, $5e, $f7, $02, $e0, $02, $00, $5c, $f7, $5e, $f7, $02, $e0, $02, $00, $5c
	db $f7, $5e, $f7, $02, $e0, $02, $00, $5c, $f7, $5e, $f7, $02, $e0, $02, $00, $5c
	db $fa, $00, $d7, $b7, $c8, $f3, $cd, $3f, $04, $3e, $80, $e0, $68, $06, $08, $21
	db $34, $05, $cd, $3f, $04, $2a, $e0, $69, $2a, $e0, $69, $cd, $3f, $04, $2a, $e0
	db $69, $2a, $e0, $69, $cd, $3f, $04, $2a, $e0, $69, $2a, $e0, $69, $cd, $3f, $04
	db $2a, $e0, $69, $2a, $e0, $69, $05, $20, $d9, $cd, $3f, $04, $3e, $80, $e0, $6a
	db $06, $08, $21, $74, $05, $cd, $3f, $04, $2a, $e0, $6b, $2a, $e0, $6b, $cd, $3f
	db $04, $2a, $e0, $6b, $2a, $e0, $6b, $cd, $3f, $04, $2a, $e0, $6b, $2a, $e0, $6b
	db $cd, $3f, $04, $2a, $e0, $6b, $2a, $e0, $6b, $05, $20, $d9, $fb, $c9, $f7, $5e
	db $02, $50, $05, $30, $00, $00, $f7, $5e, $02, $50, $05, $30, $00, $00, $f7, $5e
	db $02, $50, $05, $30, $00, $00, $f7, $5e, $02, $50, $05, $30, $00, $00, $f7, $5e
	db $02, $50, $05, $30, $00, $00, $f7, $5e, $02, $50, $05, $30, $00, $00, $f7, $5e
	db $02, $50, $05, $30, $00, $00, $f7, $5e, $02, $50, $05, $30, $00, $00, $f7, $5e
	db $80, $02, $80, $01, $00, $00, $f7, $5e, $80, $02, $80, $01, $00, $00, $f7, $5e
	db $80, $02, $80, $01, $00, $00, $f7, $5e, $80, $02, $80, $01, $00, $00, $f7, $5e
	db $80, $02, $80, $01, $00, $00, $f7, $5e, $80, $02, $80, $01, $00, $00, $f7, $5e
	db $80, $02, $80, $01, $00, $00, $f7, $5e, $80, $02, $80, $01, $00, $00, $fa, $00
	db $d7, $b7, $c8, $f3, $cd, $3f, $04, $3e, $80, $e0, $68, $06, $08, $21, $22, $06
	db $cd, $3f, $04, $2a, $e0, $69, $2a, $e0, $69, $cd, $3f, $04, $2a, $e0, $69, $2a
	db $e0, $69, $cd, $3f, $04, $2a, $e0, $69, $2a, $e0, $69, $cd, $3f, $04, $2a, $e0
	db $69, $2a, $e0, $69, $05, $20, $d9, $cd, $3f, $04, $3e, $80, $e0, $6a, $06, $08
	db $21, $62, $06, $cd, $3f, $04, $2a, $e0, $6b, $2a, $e0, $6b, $cd, $3f, $04, $2a
	db $e0, $6b, $2a, $e0, $6b, $cd, $3f, $04, $2a, $e0, $6b, $2a, $e0, $6b, $cd, $3f
	db $04, $2a, $e0, $6b, $2a, $e0, $6b, $05, $20, $d9, $fb, $c9, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $1a, $22, $13, $0b
	db $78, $b1, $20, $01, $c9
Multicart_Func_06ab:
	ld a, [de]
	mc_call Multicart_Func_06d5
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, Multicart_Func_06ab
	ret
Multicart_Func_06b7:
	ld a, [de]
	mc_call Multicart_Func_06d5
	inc hl
	ld a, [de]
	mc_call Multicart_Func_06d5
	inc hl
	inc de
	dec bc
	dec bc
	ld a, b
	or c
	jr nz, Multicart_Func_06b7
	ret
Multicart_Func_06c9:
	ld a, [de]
	mc_call Multicart_Func_0728
	inc hl
	inc de
	dec bc
	ld a, b
	or c
	jr nz, Multicart_Func_06c9
	ret
Multicart_Func_06d5:
	push af
	push bc
	ld b, a
	di
Multicart_06d9:
	ldh a, [$ff41]
	and $03
	cp $02
	jr z, Multicart_06d9
	cp $03
	jr z, Multicart_06d9
	ld [hl], b
	ei
	pop bc
	pop af
	ret
Multicart_Func_06ea:
	push af
	push bc
	ld b, a
	di
Multicart_06ee:
	ldh a, [$ff41]
	and $03
	cp $02
	jr z, Multicart_06ee
	cp $03
	jr z, Multicart_06ee
	ld [hl], b
	ei
	ld a, l
	and $1f
	cp $1f
	jr nz, Multicart_0707
	ld bc, $ffe0
	add hl, bc
Multicart_0707:
	pop bc
	pop af
	ret
Multicart_Func_070a:
	push af
	push bc
	ld b, a
Multicart_070d:
	ldh a, [$ff41]
	and $03
	cp $02
	jr z, Multicart_070d
	cp $03
	jr z, Multicart_070d
	ld [hl], b
	ld a, l
	and $1f
	cp $1f
	jr nz, Multicart_0725
	ld bc, $ffe0
	add hl, bc
Multicart_0725:
	pop bc
	pop af
	ret
Multicart_Func_0728:
	push af
	push bc
	ld b, a
Multicart_072b:
	ldh a, [$ff41]
	and $03
	cp $02
	jr z, Multicart_072b
	cp $03
	jr z, Multicart_072b
	ld [hl], b
	pop bc
	pop af
	ret
Multicart_Func_073b:
	di
Multicart_073c:
	ldh a, [$ff41]
	and $03
	cp $02
	jr z, Multicart_073c
	cp $03
	jr z, Multicart_073c
	ld a, [hl]
	ei
	ret
Multicart_Func_074b:
	di
Multicart_074c:
	ldh a, [$ff41]
	and $03
	cp $02
	jr z, Multicart_074c
	cp $03
	jr z, Multicart_074c
	ld a, [hl]
	ei
	push af
	ld a, l
	and $1f
	cp $1f
	jr nz, Multicart_0768
	push bc
	ld bc, $ffe0
	add hl, bc
	pop bc
Multicart_0768:
	pop af
	ret
Multicart_Func_076a:
	push bc
	push hl
Multicart_076c:
	mc_call Multicart_Func_074b
	ld [de], a
	inc hl
	inc de
	dec b
	jr nz, Multicart_076c
	pop hl
	mc_call Multicart_Func_07b9
	pop bc
	dec c
	jr nz, Multicart_Func_076a
	ret
Multicart_Func_077e:
	push bc
	push hl
Multicart_0780:
	ld a, [de]
	mc_call Multicart_Func_06ea
	inc hl
	inc de
	dec b
	jr nz, Multicart_0780
	pop hl
	mc_call Multicart_Func_07b9
	pop bc
	dec c
	jr nz, Multicart_Func_077e
	ret
Multicart_Func_0792:
	push bc
	push hl
Multicart_0794:
	ld a, [de]
	mc_call Multicart_Func_070a
	inc hl
	inc de
	dec b
	jr nz, Multicart_0794
	pop hl
	mc_call Multicart_Func_07b9
	pop bc
	dec c
	jr nz, Multicart_Func_0792
	ret
Multicart_Func_07a6:
	push bc
	push hl
Multicart_07a8:
	mc_call Multicart_Func_06ea
	inc hl
	inc de
	dec b
	jr nz, Multicart_07a8
	pop hl
	mc_call Multicart_Func_07b9
	pop bc
	dec c
	jr nz, Multicart_Func_07a6
	ret
Multicart_Func_07b9:
	push af
	ld a, h
	cp $9b
	jr z, Multicart_07c3
	cp $9f
	jr nz, Multicart_07ce
Multicart_07c3:
	ld a, l
	cp $e0
	jr c, Multicart_07ce
	push de
	ld de, $fc00
	add hl, de
	pop de
Multicart_07ce:
	ld bc, $0020
	add hl, bc
	pop af
	ret
Multicart_Func_07d4:
	push af
	ld a, h
	cp $98
	jr z, Multicart_07c3
	cp $9c
	jr nz, Multicart_07ce
	ld a, l
	cp $1f
	jr nc, Multicart_07ce
	push de
	ld de, $0400
	add hl, de
	pop de
	ld bc, $ffe0
	add hl, bc
	pop af
	ret
Multicart_Func_07ef:
	push de
	ld d, a
Multicart_07f1:
	ld [hl], d
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, Multicart_07f1
	pop de
	ret
Multicart_Func_07fa:
	push de
	ld d, a
Multicart_07fc:
	ld a, d
	mc_call Multicart_Func_06d5
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, Multicart_07fc
	pop de
	ret
Multicart_Func_0808:
	ldh [$ffa1], a
	ld a, l
	ldh [$ffa2], a
	ld a, h
	ldh [$ffa3], a
	pop hl
	ld a, [hli]
	ldh [$ffa0], a
	ld a, [hli]
	ldh [$ff9e], a
	ld a, [hli]
	ldh [$ff9f], a
	push hl
	ldh a, [$ffa0]
	mc_call Multicart_Func_0839
	ld hl, $082d
	push hl
	ldh a, [$ff9e]
	ld l, a
	ldh a, [$ff9f]
	ld h, a
	ldh a, [$ffa1]
	jp hl
	ldh a, [$ffa2]
	ld l, a
	ldh a, [$ffa3]
	ld h, a
	ldh a, [$ffa1]
	mc_call Multicart_Func_085b
	ret
Multicart_Func_0839:
	push af
	ldh a, [$ff96]
	ldh [$ff97], a
	ldh a, [$ff95]
	ldh [$ff96], a
	ldh a, [$ff94]
	ldh [$ff95], a
	ldh a, [$ff93]
	ldh [$ff94], a
	ldh a, [$ff92]
	ldh [$ff93], a
	ldh a, [$ff91]
	ldh [$ff92], a
	pop af
	ldh [$ff91], a
	ld [$3fff], a
	ldh a, [$ff91]
	ret
Multicart_Func_085b:
	push af
	ldh a, [$ff92]
	ldh [$ff91], a
	ldh a, [$ff93]
	ldh [$ff92], a
	ldh a, [$ff94]
	ldh [$ff93], a
	ldh a, [$ff95]
	ldh [$ff94], a
	ldh a, [$ff96]
	ldh [$ff95], a
	ldh a, [$ff97]
	ldh [$ff96], a
	ldh a, [$ff91]
	ld [$3fff], a
	pop af
	ret
Multicart_Func_087b:
	mc_call Multicart_Func_088f
	ld a, [$d815]
	ret
Multicart_Func_0882:
	mc_call Multicart_Func_087b
	or a
	jr nz, Multicart_Func_0882
Multicart_0888:
	mc_call Multicart_Func_087b
	or a
	jr z, Multicart_0888
	ret
Multicart_Func_088f:
	push af
	ld a, $01
	ldh [$ff90], a
	halt
Multicart_0895:
	ldh a, [$ff90]
	and a
	jr nz, Multicart_0895
	pop af
	ret
Multicart_Func_089c:
	push af
	push hl
	ld a, h
	ldh [$ff43], a
	ld a, l
	ldh [$ff42], a
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_08aa:
	push af
	push hl
	ld a, h
	add $07
	ldh [$ff4b], a
	ld a, l
	ldh [$ff4a], a
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_08ba:
	push af
	push hl
	ld hl, $ff40
	set 1, [hl]
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_08c7:
	push af
	push hl
	ld hl, $ff40
	res 1, [hl]
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_08d4:
	push af
	push hl
	ld hl, $ff40
	set 0, [hl]
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_08e1:
	push af
	push hl
	ld hl, $ff40
	set 5, [hl]
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_08ee:
	push af
	push hl
	ld hl, $ff40
	ld a, [hl]
	and $fe
	ld [hl], a
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_08fd:
	push af
	push hl
	ld hl, $ff40
	ld a, [hl]
	and $df
	ld [hl], a
	pop hl
	pop af
	mc_call Multicart_Func_088f
	ret
Multicart_Func_090c:
	push de
	ld d, $98
	ldh a, [$ff42]
	srl a
	srl a
	srl a
	add c
	and $1f
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ldh a, [$ff43]
	srl a
	srl a
	srl a
	add b
	and $1f
	ld e, a
	add hl, de
	pop de
	ret
Multicart_Func_0931:
	push af
	push hl
	push de
	xor a
	ld b, a
	ld c, a
	ld d, a
	ld h, a
Multicart_0939:
	srl l
	jr nc, Multicart_0943
	ld a, e
	add c
	ld c, a
	ld a, b
	adc a, d
	ld b, a
Multicart_0943:
	sla e
	rl d
	inc h
	ld a, h
	cp $08
	jr nz, Multicart_0939
	pop de
	pop hl
	pop af
	ret
Multicart_Func_0951:
	push af
	push hl
	xor a
	ldh [$ffc2], a
	ldh [$ffc3], a
	ldh [$ffc4], a
	ldh [$ffc5], a
	ld a, $10
	ldh [$ffc6], a
Multicart_Func_0960:
	rr h
	rr l
	jr nc, Multicart_0970
	ldh a, [$ffc4]
	add e
	ldh [$ffc4], a
	ldh a, [$ffc5]
	adc a, d
	ldh [$ffc5], a
Multicart_0970:
	push hl
	ld a, $04
	ld hl, $ffc5
Multicart_0976:
	rr [hl]
	dec hl
	dec a
	jr nz, Multicart_0976
	pop hl
	ldh a, [$ffc6]
	dec a
	ldh [$ffc6], a
	mc_jp nz, Multicart_Func_0960
	ldh a, [$ffc5]
	ld d, a
	ldh a, [$ffc4]
	ld e, a
	ldh a, [$ffc3]
	ld b, a
	ldh a, [$ffc2]
	ld c, a
	pop hl
	pop af
	ret
Multicart_Func_0994:
	push bc
	ld a, [$d800]
	and $0f
	ld [$d800], a
	inc a
	ld b, a
Multicart_099f:
	mc_call Multicart_Func_087b
	or a
	jr nz, Multicart_09a8
	dec b
	jr nz, Multicart_099f
Multicart_09a8:
	pop bc
	ret
Multicart_Func_09aa:
	mc_call Multicart_Func_08ba
	ld a, $01
	ld [$d813], a
	mc_call Multicart_Func_0cb3
	ld a, $00
	ld [$d704], a
	mc_call Multicart_Func_0b2b
	mc_call Multicart_Func_0b5f
	mc_call Multicart_Func_0b7e
	ld a, $01
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_088f
	ld a, $01
	ld [$d826], a
Multicart_Func_09d1:
	mc_call Multicart_Func_087b
	or a
	jr nz, Multicart_Func_09d1
	ld a, $07
	ld [$d800], a
Multicart_09dc:
	mc_call Multicart_Func_0c8d
	mc_call Multicart_Func_0994
	and $ff
	jr nz, Multicart_09f2
	mc_call Multicart_Func_0ca9
	mc_call Multicart_Func_0994
	and $ff
	jr nz, Multicart_09f2
	jr Multicart_09dc
Multicart_09f2:
	bit 6, a
	mc_jp z, Multicart_Func_0a0f
	ld a, [$d704]
	dec a
	ld [$d704], a
	bit 7, a
	mc_call nz, Multicart_Func_0c1b
	ld a, $02
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_0b5f
	mc_jp Multicart_Func_09d1
Multicart_Func_0a0f:
	bit 4, a
	mc_jp z, Multicart_Func_0a2f
	ld a, [$d704]
	inc a
	ld [$d704], a
	ld b, a
	ld a, [$d705]
	cp b
	mc_call z, Multicart_Func_0c4a
	ld a, $02
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_0b5f
	mc_jp Multicart_Func_09d1
Multicart_Func_0a2f:
	bit 7, a
	mc_jp z, Multicart_Func_0a4f
	ld a, [$d704]
	inc a
	ld [$d704], a
	ld b, a
	ld a, [$d705]
	cp b
	mc_call z, Multicart_Func_0c4a
	ld a, $02
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_0b5f
	mc_jp Multicart_Func_09d1
Multicart_Func_0a4f:
	bit 5, a
	mc_jp z, Multicart_Func_0a6c
	ld a, [$d704]
	dec a
	ld [$d704], a
	bit 7, a
	mc_call nz, Multicart_Func_0c1b
	ld a, $02
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_0b5f
	mc_jp Multicart_Func_09d1
Multicart_Func_0a6c:
	bit 3, a
	mc_jp z, Multicart_Func_0a7a
	ld a, $02
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_0acb
Multicart_Func_0a7a:
	bit 2, a
	mc_jp z, Multicart_Func_0a88
	ld a, $02
	ld [$d812], a
	rst $28
	mc_jp Multicart_Func_09d1
Multicart_Func_0a88:
	bit 1, a
	mc_jp z, Multicart_Func_0a9c
	ld a, $02
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_0bcd
	mc_call Multicart_Func_0b5f
	mc_jp Multicart_Func_09d1
Multicart_Func_0a9c:
	ld a, $02
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_0acb
	ret
Multicart_Func_0aa6:
	push hl
	push de
	push bc
	push af
	push bc
	ld hl, $d300
	push af
	swap a
	and $0f
	add $81
	ld [hli], a
	pop af
	and $0f
	add $81
	ld [hli], a
	ld a, $ff
	ld [hli], a
	pop bc
	ld de, $d300
	mc_call Multicart_Func_0d32
	pop af
	pop bc
	pop de
	pop hl
	ret
Multicart_Func_0acb:
	ld a, $00
	ld [$d812], a
	rst $28
	mc_call Multicart_Func_088f
	ld hl, $0ae5
	ld de, $d720
	ld c, $f0
Multicart_0adc:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, Multicart_0adc
	jp $d720
Multicart_Func_0ae5:
	mc_call Multicart_Func_088f
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	ld a, [$d704]
	ld l, a
	ld h, $00
	add hl, bc
	ld bc, $1633
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld [$d707], a
	ld a, [hli]
	ld [$d708], a
	ld a, [hli]
	ld [$d709], a
	di
	ld a, [$d708]
	ld [$7000], a
	ld a, $bb
	ld [$5000], a
	ld a, [$d707]
	ld [$7000], a
	ld a, $55
	ld [$5000], a
	ld a, [$d709]
	ld [$7000], a
	nop
	mc_jp Multicart_Func_0100
Multicart_Func_0b2a:
	ret
Multicart_Func_0b2b:
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	ld hl, $000e
	add hl, bc
	ld a, [$d81c]
	cp h
	jr c, Multicart_0b4f
	jr z, Multicart_0b41
	jr Multicart_0b49
Multicart_0b41:
	ld a, [$d81b]
	cp l
	jr z, Multicart_0b4f
	jr c, Multicart_0b4f
Multicart_0b49:
	ld a, $0e
	ld [$d705], a
	ret
Multicart_0b4f:
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	ld a, [$d81b]
	sub c
	ld [$d705], a
	ret
Multicart_Func_0b5f:
	ld a, $60
	ld [$d808], a
	ld a, $30
	ld [$d807], a
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	ld a, [$d704]
	ld l, a
	ld h, $00
	add hl, bc
	ld b, h
	ld c, l
	mc_call Multicart_Func_0f8a
	ret
Multicart_Func_0b7e:
	ld e, $c5
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	or c
	jr nz, Multicart_0b8d
	ld e, $00
Multicart_0b8d:
	ld bc, $1302
	mc_call Multicart_Func_090c
	ld a, e
	mc_call Multicart_Func_06d5
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	ld hl, $000e
	add hl, bc
	ld a, [$d81c]
	cp h
	jr c, Multicart_0bc1
	jr z, Multicart_0bad
	jr Multicart_0bb5
Multicart_0bad:
	ld a, [$d81b]
	cp l
	jr c, Multicart_0bc1
	jr z, Multicart_0bc1
Multicart_0bb5:
	ld bc, $130f
	mc_call Multicart_Func_090c
	ld a, $c6
	mc_call Multicart_Func_06d5
	ret
Multicart_0bc1:
	ld bc, $130f
	mc_call Multicart_Func_090c
	ld a, $00
	mc_call Multicart_Func_06d5
	ret
Multicart_Func_0bcd:
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	ld hl, $000e
	add hl, bc
	ld a, [$d81c]
	cp h
	jr c, Multicart_0c02
	jr z, Multicart_0be3
	jr Multicart_0beb
Multicart_0be3:
	ld a, [$d81b]
	cp l
	jr z, Multicart_0c02
	jr c, Multicart_0c02
Multicart_0beb:
	ld a, l
	ld [$d701], a
	ld a, h
	ld [$d702], a
	mc_call Multicart_Func_0cb3
	ld a, $00
	ld [$d704], a
	mc_call Multicart_Func_0b2b
	mc_call Multicart_Func_0b7e
	ret
Multicart_0c02:
	ld a, $00
	ld [$d701], a
	ld a, $00
	ld [$d702], a
	mc_call Multicart_Func_0cb3
	ld a, $00
	ld [$d704], a
	mc_call Multicart_Func_0b2b
	mc_call Multicart_Func_0b7e
	ret
Multicart_Func_0c1b:
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	or c
	jr z, Multicart_0c41
	ld hl, $fff2
	add hl, bc
	ld a, l
	ld [$d701], a
	ld a, h
	ld [$d702], a
	mc_call Multicart_Func_0cb3
	ld a, $0d
	ld [$d704], a
	mc_call Multicart_Func_0b2b
	mc_call Multicart_Func_0b7e
	ret
Multicart_0c41:
	ld a, $00
	ld [$d704], a
	mc_call Multicart_Func_0b7e
	ret
Multicart_Func_0c4a:
	ld a, [$d701]
	ld c, a
	ld a, [$d702]
	ld b, a
	ld hl, $000e
	add hl, bc
	ld a, [$d81c]
	cp h
	jr c, Multicart_0c7f
	jr z, Multicart_0c60
	jr Multicart_0c68
Multicart_0c60:
	ld a, [$d81b]
	cp l
	jr z, Multicart_0c7f
	jr c, Multicart_0c7f
Multicart_0c68:
	ld a, l
	ld [$d701], a
	ld a, h
	ld [$d702], a
	mc_call Multicart_Func_0cb3
	ld a, $00
	ld [$d704], a
	mc_call Multicart_Func_0b2b
	mc_call Multicart_Func_0b7e
	ret
Multicart_0c7f:
	mc_call Multicart_Func_0b2b
	ld a, [$d705]
	dec a
	ld [$d704], a
	mc_call Multicart_Func_0b7e
	ret
Multicart_Func_0c8d:
	ld de, $d29c
	ld a, [$d704]
	sla a
	sla a
	sla a
	add $20
	ld [de], a
	inc de
	ld a, $08
	ld [de], a
	inc de
	ld a, $c7
	ld [de], a
	inc de
	ld a, $00
	ld [de], a
	ret
Multicart_Func_0ca9:
	ld hl, $d29c
	ld a, $00
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
Multicart_Func_0cb3:
	ld bc, $0002
	mc_call Multicart_Func_090c
	ld bc, $200e
	ld a, $00
	mc_call Multicart_Func_07a6
	ld a, [$d701]
	ld [$d81d], a
	ld a, [$d702]
	ld [$d81e], a
	ld a, $02
	ld [$d81f], a
	ld b, $0e
Multicart_0cd4:
	push bc
	ld a, [$d81d]
	ld c, a
	ld a, [$d81e]
	ld b, a
	ld hl, $2000
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, $01
	ld a, [$d81f]
	ld c, a
	mc_call Multicart_Func_0d32
	ld a, [$d81d]
	ld c, a
	ld a, [$d81e]
	ld b, a
	inc bc
	ld a, c
	ld [$d81d], a
	ld a, b
	ld [$d81e], a
	ld a, [$d81f]
	inc a
	ld [$d81f], a
	pop bc
	mc_call Multicart_Func_0d10
	jr nc, Multicart_0d0f
	dec b
	jr nz, Multicart_0cd4
Multicart_0d0f:
	ret
Multicart_Func_0d10:
	push bc
	ld a, [$d81c]
	ld b, a
	ld a, [$d81e]
	cp b
	jr c, Multicart_0d2b
	jr z, Multicart_0d1f
	jr Multicart_0d2e
Multicart_0d1f:
	ld a, [$d81b]
	ld b, a
	ld a, [$d81d]
	cp b
	jr c, Multicart_0d2b
	jr Multicart_0d2e
Multicart_0d2b:
	pop bc
	scf
	ret
Multicart_0d2e:
	pop bc
	scf
	ccf
	ret
Multicart_Func_0d32:
	mc_call Multicart_Func_090c
Multicart_0d35:
	ld a, [de]
	cp $ff
	jr z, Multicart_0d41
	mc_call Multicart_Func_06ea
	inc de
	inc hl
	jr Multicart_0d35
Multicart_0d41:
	ret
	db $00, $00, $00, $00, $00, $00, $00, $00, $3e, $63, $67, $6b, $73, $63, $3e, $00
	db $18, $38, $18, $18, $18, $18, $7e, $00, $3e, $63, $03, $0e, $3c, $70, $7f, $00
	db $3e, $63, $03, $0e, $03, $63, $3e, $00, $0e, $1e, $36, $66, $66, $7f, $06, $00
	db $7f, $60, $7e, $63, $03, $63, $3e, $00, $3e, $63, $60, $7e, $63, $63, $3e, $00
	db $7f, $63, $06, $0c, $18, $18, $18, $00, $3e, $63, $63, $3e, $63, $63, $3e, $00
	db $3e, $63, $63, $3f, $03, $63, $3e, $00, $1c, $36, $63, $63, $7f, $63, $63, $00
	db $7e, $63, $63, $7e, $63, $63, $7e, $00, $3e, $63, $60, $60, $60, $63, $3e, $00
	db $7e, $63, $63, $63, $63, $63, $7e, $00, $7f, $60, $60, $7e, $60, $60, $7f, $00
	db $7f, $60, $60, $7e, $60, $60, $60, $00, $3e, $63, $60, $67, $63, $63, $3f, $00
	db $63, $63, $63, $7f, $63, $63, $63, $00, $3c, $18, $18, $18, $18, $18, $3c, $00
	db $1f, $06, $06, $06, $06, $66, $3c, $00, $63, $66, $6c, $78, $6c, $66, $63, $00
	db $60, $60, $60, $60, $60, $60, $7f, $00, $63, $77, $7f, $6b, $6b, $63, $63, $00
	db $63, $73, $7b, $7f, $6f, $67, $63, $00, $3e, $63, $63, $63, $63, $63, $3e, $00
	db $7e, $63, $63, $63, $7e, $60, $60, $00, $3e, $63, $63, $63, $7f, $63, $3d, $00
	db $7e, $63, $63, $7e, $6c, $66, $63, $00, $3e, $63, $60, $3e, $03, $63, $3e, $00
	db $7e, $18, $18, $18, $18, $18, $18, $00, $63, $63, $63, $63, $63, $63, $3e, $00
	db $63, $63, $63, $63, $36, $1c, $08, $00, $63, $63, $6b, $6b, $7f, $77, $22, $00
	db $63, $36, $1c, $08, $1c, $36, $63, $00, $66, $66, $7e, $3c, $18, $18, $18, $00
	db $7e, $06, $0c, $18, $30, $60, $7f, $00, $00, $18, $18, $7e, $18, $18, $00, $00
	db $00, $00, $00, $7e, $00, $00, $00, $00, $49, $2a, $1c, $7f, $1c, $2a, $49, $00
	db $00, $03, $06, $0c, $18, $30, $60, $00, $00, $60, $30, $18, $0c, $06, $03, $00
	db $00, $00, $7f, $00, $7f, $00, $00, $00, $0c, $18, $30, $60, $30, $18, $0c, $00
	db $30, $18, $0c, $06, $0c, $18, $30, $00, $0c, $18, $30, $30, $30, $18, $0c, $00
	db $30, $18, $0c, $0c, $0c, $18, $30, $00, $3c, $30, $30, $30, $30, $30, $3c, $00
	db $3c, $0c, $0c, $0c, $0c, $0c, $3c, $00, $3c, $60, $60, $c0, $60, $60, $3c, $00
	db $3c, $06, $06, $03, $06, $06, $3c, $00, $18, $3c, $3c, $18, $18, $00, $18, $18
	db $3e, $63, $06, $0c, $18, $00, $18, $18, $00, $00, $00, $00, $00, $18, $18, $30
	db $00, $00, $00, $00, $00, $18, $18, $00, $00, $18, $18, $00, $00, $18, $18, $00
	db $00, $18, $18, $00, $00, $18, $18, $30, $00, $36, $7f, $36, $7f, $36, $00, $00
	db $08, $3e, $6b, $38, $0e, $6b, $3e, $08, $00, $63, $66, $0c, $18, $33, $63, $00
	db $1c, $36, $1c, $3b, $66, $66, $3d, $00, $3e, $63, $6f, $6f, $6e, $60, $3e, $00
	db $66, $66, $24, $00, $00, $00, $00, $00, $18, $18, $30, $00, $00, $00, $00, $00
	db $18, $18, $0c, $00, $00, $00, $00, $00, $18, $18, $18, $00, $18, $18, $18, $00
	db $18, $3c, $66, $c3, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff
	db $00, $00, $73, $db, $ce, $00, $00, $00, $08, $1c, $3e, $7f, $1c, $1c, $1c, $00
	db $1c, $1c, $1c, $7f, $3e, $1c, $08, $00, $00, $04, $06, $ff, $ff, $06, $04, $00
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
Multicart_Func_0f8a:
	ld a, $01
	ld [$d803], a
	ld a, $10
	ld [$d804], a
	mc_call Multicart_Func_10ab
	ld bc, $0010
	mc_call Multicart_Func_090c
	ld bc, $2002
	ld a, $c8
	mc_call Multicart_Func_07a6
Multicart_Func_0fa5:
	mc_call Multicart_Func_10c1
	ld a, [$d811]
	cp $ff
	mc_jp z, Multicart_Func_0ff9
	cp $e0
	mc_jp nc, Multicart_Func_0fbd
	cp $80
	mc_jp nc, Multicart_Func_0fe7
	mc_jp Multicart_Func_0fa5
Multicart_Func_0fbd:
	ld a, [$d811]
	ld [$d810], a
	mc_call Multicart_Func_10c1
	ld a, [$d811]
	ld [$d80f], a
	mc_call Multicart_Func_1024
	mc_call Multicart_Func_10de
	mc_call Multicart_Func_0ffa
	mc_call Multicart_Func_0ffa
	mc_call Multicart_Func_0ffa
	mc_call Multicart_Func_0ffa
	mc_call Multicart_Func_1010
	mc_call Multicart_Func_1010
	mc_jp Multicart_Func_0fa5
Multicart_Func_0fe7:
	mc_call Multicart_Func_105f
	mc_call Multicart_Func_1104
	mc_call Multicart_Func_0ffa
	mc_call Multicart_Func_0ffa
	mc_call Multicart_Func_1010
	mc_jp Multicart_Func_0fa5
Multicart_Func_0ff9:
	ret
Multicart_Func_0ffa:
	push af
	push bc
	ld a, [$d808]
	dec a
	ld b, a
	ld a, [$d807]
	cp b
	jr nz, Multicart_1009
	ld a, $01
Multicart_1009:
	inc a
	ld [$d807], a
	pop bc
	pop af
	ret
Multicart_Func_1010:
	push de
	push af
	ld a, [$d803]
	and $1f
	cp $1f
	jr c, Multicart_101d
	ld a, $ff
Multicart_101d:
	inc a
	ld [$d803], a
	pop af
	pop de
	ret
Multicart_Func_1024:
	push hl
	push bc
	push de
	push af
	ld a, [$d80f]
	ld l, a
	ld a, [$d810]
	and $01
	ld h, a
	ld de, $0020
	mc_call Multicart_Func_0951
	ld hl, $4c00
	add hl, bc
	push hl
	ld a, $01
	mc_call Multicart_Func_0839
	ld a, [$d807]
	ld l, a
	ld e, $10
	mc_call Multicart_Func_0931
	ld h, $90
	ld l, $00
	add hl, bc
	pop de
	ld bc, $0040
	mc_call Multicart_Func_06b7
	mc_call Multicart_Func_085b
	pop af
	pop de
	pop bc
	pop hl
	ret
Multicart_Func_105f:
	push hl
	push bc
	push de
	push af
	ld a, [$d811]
	sub $80
	ld l, a
	ld h, $00
	ld de, $0008
	mc_call Multicart_Func_0951
	ld hl, $0d42
	add hl, bc
	push hl
	ld hl, $c400
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	pop de
	ld c, $08
Multicart_1082:
	ld a, [de]
	cpl
	ld [hli], a
	inc de
	dec c
	jr nz, Multicart_1082
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [$d807]
	ld l, a
	ld e, $10
	mc_call Multicart_Func_0931
	ld h, $90
	ld l, $00
	add hl, bc
	ld de, $c400
	ld bc, $0020
	mc_call Multicart_Func_06b7
	pop af
	pop de
	pop bc
	pop hl
	ret
Multicart_Func_10ab:
	push hl
	push bc
	push de
	push af
	ld hl, $2018
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [$d80b], a
	ld a, [hli]
	ld [$d80c], a
	pop af
	pop de
	pop bc
	pop hl
	ret
Multicart_Func_10c1:
	push hl
	push bc
	push de
	push af
	ld a, [$d80b]
	ld l, a
	ld a, [$d80c]
	ld h, a
	ld a, [hli]
	ld [$d811], a
	ld a, l
	ld [$d80b], a
	ld a, h
	ld [$d80c], a
	pop af
	pop de
	pop bc
	pop hl
	ret
Multicart_Func_10de:
	push hl
	push bc
	push de
	push af
	ld a, [$d807]
	ld c, a
	ld b, $00
	ld hl, $112a
	add hl, bc
	push hl
	ld a, [$d803]
	ld b, a
	ld a, [$d804]
	ld c, a
	mc_call Multicart_Func_090c
	pop de
	ld bc, $0202
	mc_call Multicart_Func_077e
	pop af
	pop de
	pop bc
	pop hl
	ret
Multicart_Func_1104:
	push hl
	push bc
	push de
	push af
	ld a, [$d807]
	ld c, a
	ld b, $00
	ld hl, $112a
	add hl, bc
	push hl
	ld a, [$d803]
	ld b, a
	ld a, [$d804]
	ld c, a
	mc_call Multicart_Func_090c
	pop de
	ld bc, $0102
	mc_call Multicart_Func_077e
	pop af
	pop de
	pop bc
	pop hl
	ret
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
	db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
	db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f
	db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f
	db $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f
	db $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f
	db $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f
	db $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8a, $8b, $8c, $8d, $8e, $8f
	db $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f
	db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af
	db $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf
	db $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce, $cf
	db $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8, $d9, $da, $db, $dc, $dd, $de, $df
	db $e0, $e1, $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9, $ea, $eb, $ec, $ed, $ee, $ef
	db $f0, $f1, $f2, $f3, $f4, $f5, $f6, $f7, $f8, $f9, $fa, $fb, $fc, $fd, $fe, $ff
	db $02, $04, $06, $08, $0a, $0c, $0e, $10, $12, $14, $16, $18, $1a, $1c, $1e, $20
	db $22, $24, $03, $05, $07, $09, $0b, $0d, $0f, $11, $13, $15, $17, $19, $1b, $1d
	db $1f, $21, $23, $25
Multicart_Func_124e:
	ld a, c
	ld [$d81b], a
	ld a, b
	ld [$d81c], a
	ld a, $00
	ld [$d701], a
	ld a, $00
	ld [$d702], a
	mc_call Multicart_Func_09aa
	ret
Multicart_Func_1264:
	ld a, [$d826]
	or a
	ret z
	ld a, [$d825]
	inc a
	ld [$d825], a
	cp $10
	ret nz
	ld a, $00
	ld [$d825], a
	ld bc, $0100
	mc_call Multicart_Func_090c
	push hl
	ld hl, $122a
	ld a, [$d824]
	ld c, a
	ld b, $00
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [$d824]
	ld b, a
	ld a, $12
	sub b
	ld b, a
	ld c, $01
	mc_call Multicart_Func_0792
	ld bc, $0101
	mc_call Multicart_Func_090c
	push hl
	ld hl, $123c
	ld a, [$d824]
	ld c, a
	ld b, $00
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [$d824]
	ld b, a
	ld a, $12
	sub b
	ld b, a
	ld c, $01
	mc_call Multicart_Func_0792
	ld a, [$d824]
	or a
	jr z, Multicart_12ef
	ld b, a
	ld a, $13
	sub b
	ld b, a
	ld c, $00
	mc_call Multicart_Func_090c
	ld de, $122a
	ld a, [$d824]
	ld b, a
	ld c, $01
	mc_call Multicart_Func_0792
	ld a, [$d824]
	ld b, a
	ld a, $13
	sub b
	ld b, a
	ld c, $01
	mc_call Multicart_Func_090c
	ld de, $123c
	ld a, [$d824]
	ld b, a
	ld c, $01
	mc_call Multicart_Func_0792
Multicart_12ef:
	ld a, [$d824]
	inc a
	cp $12
	jr c, Multicart_12f9
	ld a, $00
Multicart_12f9:
	ld [$d824], a
	ret
Multicart_Func_12fd:
	ld bc, $000c
	mc_call Multicart_Func_124e
	ret
	db $fe, $fe, $fe, $fe, $fe, $fe, $80, $80, $be, $be, $be, $be, $be, $be, $80, $80
	db $be, $be, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $fe, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $fb, $fb, $01, $01, $fb, $fb, $fb, $fb, $fb, $fb, $03, $03
	db $fb, $fb, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $fd, $fd, $fe, $fe, $00, $00, $ef, $ef, $f7, $f7, $fb, $fb, $fb, $fb, $fd, $fd
	db $fe, $fe, $fd, $fd, $fb, $fb, $f7, $f7, $cf, $cf, $3f, $3f, $ff, $ff, $ff, $ff
	db $ff, $ff, $fb, $fb, $01, $01, $ef, $ef, $df, $df, $df, $df, $bf, $bf, $7f, $7f
	db $ff, $ff, $7f, $7f, $9f, $9f, $ef, $ef, $f1, $f1, $fb, $fb, $ff, $ff, $ff, $ff
	db $ef, $ef, $d6, $d6, $ba, $ba, $7e, $7e, $82, $82, $ee, $ee, $ee, $ee, $02, $02
	db $ee, $ee, $6c, $6c, $aa, $aa, $c6, $c6, $ee, $ee, $02, $02, $ff, $ff, $ff, $ff
	db $fb, $fb, $01, $01, $fb, $fb, $03, $03, $fb, $fb, $03, $03, $ff, $ff, $bb, $bb
	db $d7, $d7, $ef, $ef, $f7, $f7, $db, $db, $bd, $bd, $7d, $7d, $ff, $ff, $ff, $ff
	db $f7, $f7, $b6, $b6, $b6, $b6, $b6, $b6, $82, $82, $be, $be, $be, $be, $86, $86
	db $b6, $b6, $b6, $b6, $b5, $b5, $b3, $b3, $77, $77, $f4, $f4, $ff, $ff, $ff, $ff
	db $fb, $fb, $01, $01, $ff, $ff, $ff, $ff, $03, $03, $fb, $fb, $7b, $7b, $b7, $b7
	db $b7, $b7, $af, $af, $df, $df, $af, $af, $71, $71, $fb, $fb, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $cf, $cf, $0f, $0f, $cf, $cf, $cf, $cf, $cf, $cf
	db $cf, $cf, $cf, $cf, $cf, $cf, $cf, $cf, $03, $03, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $83, $83, $39, $39, $39, $39, $f9, $f9, $f3, $f3
	db $e7, $e7, $cf, $cf, $9f, $9f, $39, $39, $01, $01, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $fe, $fe, $fd, $fd, $fb, $fb, $f7, $f7, $cf, $cf, $30, $30, $ff, $ff, $ff, $ff
	db $f0, $f0, $f7, $f7, $f7, $f7, $f7, $f7, $f0, $f0, $f7, $f7, $ff, $ff, $ff, $ff
	db $ff, $ff, $7f, $7f, $bf, $bf, $df, $df, $e7, $e7, $19, $19, $ff, $ff, $df, $df
	db $0f, $0f, $df, $df, $df, $df, $df, $df, $1f, $1f, $df, $df, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $cf, $cf, $0f, $0f, $cf, $cf, $cf, $cf, $cf, $cf
	db $cf, $cf, $cf, $cf, $cf, $cf, $cf, $cf, $03, $03, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $54, $15, $62, $15, $76, $15, $8a, $15, $93, $15, $a5, $15, $b4, $15, $c8, $15
	db $81, $82, $b6, $9d, $8b, $98, $91, $99, $80, $a1, $9c, $8b, $ff, $ff, $81, $83
	db $b6, $8d, $9c, $8b, $a4, $a3, $80, $97, $99, $98, $99, $9a, $99, $96, $a3, $83
	db $ff, $ff, $81, $84, $b6, $9d, $9a, $8b, $9e, $93, $99, $80, $97, $99, $98, $9d
	db $9e, $8f, $9c, $9d, $ff, $ff, $81, $85, $b6, $a4, $99, $99, $95, $ff, $ff, $81
	db $86, $b6, $9d, $a1, $99, $9c, $8e, $80, $90, $93, $91, $92, $9e, $8f, $9c, $ff
	db $ff, $81, $87, $b6, $a1, $8f, $9d, $9e, $80, $9d, $9e, $99, $9c, $a3, $ff, $ff
	db $81, $88, $b6, $9d, $8b, $98, $8d, $9e, $93, $9e, $a3, $97, $99, $98, $9d, $9e
	db $8f, $9c, $ff, $ff, $81, $89, $b6, $8e, $8f, $a0, $93, $96, $80, $96, $8b, $98
	db $8e, $ff, $ff, $e7, $15, $ef, $15, $f9, $15, $03, $16, $0f, $16, $19, $16, $21
	db $16, $2b, $16, $e0, $79, $e0, $1a, $e1, $70, $ff, $ff, $e0, $4e, $e1, $69, $e1
	db $6a, $80, $83, $ff, $ff, $e0, $75, $e0, $d9, $e0, $ac, $e0, $f4, $ff, $ff, $e1
	db $6d, $e0, $05, $e1, $6e, $e1, $6f, $80, $82, $ff, $ff, $e0, $00, $e0, $01, $e0
	db $73, $e0, $d7, $ff, $ff, $e1, $71, $e0, $2f, $e1, $72, $ff, $ff, $e1, $1b, $e0
	db $f4, $e0, $e1, $e0, $e2, $ff, $ff, $e0, $61, $e0, $62, $e0, $10, $ff, $ff, $30
	db $00, $81, $81, $31, $40, $81, $81, $32, $80, $82, $82, $33, $a0, $82, $82, $34
	db $c0, $83, $83, $35, $d0, $83, $83, $36, $e0, $83, $83, $00, $f0, $85, $85, $00
	db $f4, $85, $85, $00, $f8, $85, $85, $00, $fc, $86, $86, $00, $fe, $86, $86, $00
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
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $a2, $20, $b7, $20
	db $c6, $20, $d8, $20, $e6, $20, $f5, $20, $06, $21, $10, $21, $23, $21, $32, $21
	db $42, $21, $4d, $21, $30, $20, $3a, $20, $44, $20, $4e, $20, $56, $20, $5e, $20
	db $68, $20, $74, $20, $7e, $20, $86, $20, $90, $20, $98, $20, $e0, $01, $e0, $02
	db $e0, $03, $e0, $04, $ff, $ff, $e0, $05, $e0, $06, $e0, $07, $e0, $08, $ff, $ff
	db $e0, $09, $e0, $0a, $e0, $0b, $e0, $07, $ff, $ff, $e0, $0c, $e0, $0d, $e0, $0e
	db $ff, $ff, $e0, $0f, $e0, $10, $e0, $11, $ff, $ff, $e0, $12, $e0, $13, $e0, $14
	db $e0, $04, $ff, $ff, $e0, $15, $e0, $16, $e0, $17, $e0, $18, $80, $83, $ff, $ff
	db $e0, $19, $e0, $1a, $e0, $1b, $e0, $1c, $ff, $ff, $e0, $10, $e0, $1d, $e0, $1e
	db $ff, $ff, $e0, $1f, $e0, $20, $e0, $21, $e0, $22, $ff, $ff, $e0, $23, $e0, $24
	db $e0, $25, $ff, $ff, $e0, $26, $e0, $27, $e0, $28, $e0, $29, $ff, $ff, $81, $82
	db $b6, $9d, $9a, $8b, $9e, $93, $99, $80, $97, $99, $98, $99, $9d, $9e, $8f, $9c
	db $9d, $ff, $ff, $81, $83, $b6, $8b, $9a, $99, $9e, $92, $8f, $99, $9d, $93, $9d
	db $ff, $ff, $81, $84, $b6, $9d, $a1, $99, $9c, $8e, $80, $90, $93, $91, $92, $9e
	db $8f, $9c, $ff, $ff, $81, $85, $b6, $9d, $8b, $98, $91, $99, $80, $a1, $9c, $8b
	db $ff, $ff, $81, $86, $b6, $8e, $8f, $a0, $93, $96, $80, $96, $8b, $98, $8e, $ff
	db $ff, $81, $87, $b6, $8e, $93, $91, $93, $80, $97, $99, $98, $9d, $9e, $8f, $9c
	db $ff, $ff, $81, $88, $b6, $a4, $99, $99, $95, $83, $ff, $ff, $81, $89, $b6, $9c
	db $8b, $93, $98, $8c, $99, $a1, $80, $9a, $9c, $93, $98, $8d, $8f, $ff, $ff, $81
	db $8a, $b6, $97, $8b, $91, $93, $8d, $80, $8c, $8b, $96, $96, $ff, $ff, $82, $81
	db $b6, $90, $93, $9c, $8f, $80, $8e, $9c, $8b, $91, $99, $98, $ff, $ff, $82, $82
	db $b6, $96, $8b, $9d, $8b, $97, $8b, $ff, $ff, $82, $83, $b6, $9e, $99, $9a, $80
	db $9d, $8f, $8d, $9c, $8f, $9e, $ff, $ff, $00, $00, $00, $00
