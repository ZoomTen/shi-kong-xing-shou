
Func_2c03::
	ld hl, wce00
	ld de, $a0
	add hl, de
	ld de, .unk_2c1b
.get_length
	ld a, [de]
	cp $ff
	ret z
; Store length in b
	ld b, a
	inc de
	ld a, [de]
	inc de
.copy_byte
	ld [hli], a
	dec b
	jr nz, .copy_byte
	jr .get_length

.unk_2c1b
	db $01, $06
	db $07, $06
	db $48, $06
	db $10, $07
	db $ff

unk_2c24::
	db $b5, $56, $00, $00, $1d, $00, $bf, $67
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $b5, $56, $00, $00, $d6, $6e, $de, $7b

unk_2c3c::
	ds 40, 0
