
LoadDefaultTileAttrs::
	ld hl, wMapTileAttrs
	ld de, $a0
	add hl, de
	ld de, .attrs
.get_length
	ld a, [de]
	cp -1
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

.attrs
	db $01, 6
	db $07, 6
	db $48, 6
	db $10, 7
	db -1

DefaultSpritePalettes::
	db $b5, $56, $00, $00, $1d, $00, $bf, $67
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $b5, $56, $00, $00, $d6, $6e, $de, $7b

Palettes_2c3c::
	ds 40, 0
