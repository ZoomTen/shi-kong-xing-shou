Func_00c_4000:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_4013
	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_4013
	ld a, $08
	jr .asm_4016
.asm_4013
	ld a, [wSelectedOption]
.asm_4016
	ld de, Pointers_00c_63dc
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0100
	ld de, vTiles0
	call CopyBytesVRAM_Bank0C
	ret
Func_00c_402b:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_403e
	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_403e
	ld a, $08
	jr .asm_4041
.asm_403e
	ld a, [wSelectedOption]
.asm_4041
	ld de, Pointers_00c_5f4a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0080
	ld de, $8f60
	call CopyBytesVRAM_Bank0C
	ret
