
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

