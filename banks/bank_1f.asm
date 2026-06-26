_LoadTextFaceGFX::
; 2bpp
	ld de, FacePicPointers
	ld a, [wTextFaceID]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8f00
	ld bc, $100
	call CopyBytesVRAM

; palette
	ld de, FacePalettePointers
	pop hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 1 palettes
	ld c, BCPSF_AUTOINC | $38
	call LoadPalettes_BCPD
	ret

Func_01f_4028::
; 2bpp
	ld de, unk_01f_4335
	ld a, [wPlayerChar]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8d00
	ld bc, $100
	call CopyBytesVRAM

; BG palette
	ld bc, wPaletteBuffer
	ld hl, 7
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld c, l
	ld b, h
	; ld bc, wPaletteBuffer + $38
	ld de, FacePalettePointers
	pop hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	pop de
	ld bc, 1 palettes
	call CopyBytes3
	ret

Func_01f_405d::
	ld a, [wBattleScriptByte]
	push af
	cp 3
	jr nz, .asm_4072

	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_4072

	pop af
	ld a, 8
	jr .asm_4073

.asm_4072
	pop af

.asm_4073
	ld de, unk_01f_4335
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wBattleScriptByte]
	ld b, a
	ld de, $9000
	ld a, d
	or b
	ld d, a
	ld e, 0
	ld bc, $100
	call CopyBytesVRAM
	ret

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_01f_4091::
	db $90, $91, $92, $93, $94, $95, $96, $97, $93

Func_01f_409a::
	ld bc, wPaletteBuffer
	ld hl, $38
	add hl, bc
	ld c, l
	ld b, h
	ld hl, .unk_40af
	push bc
	pop de
	ld bc, 8
	call CopyBytes3
	ret

.unk_40af
	db $ff, $7f, $dc, $01, $0f, $15, $00, $00

Func_01f_40b7::
	ld a, [wSelectedOption]
	cp 3
	jr nz, .asm_40ca

	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_40ca

	call Func_01f_409a
	ret

.asm_40ca
	ld bc, wPaletteBuffer
	ld hl, $38
	add hl, bc
	ld c, l
	ld b, h
	ld de, FacePalettePointers
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	pop de
	ld bc, 8
	call CopyBytes3
	ret

Func_01f_40ea::
	ld hl, $9822
	ld a, 16
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, 9
	ld c, a
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox_VRAM1
	ld de, .unk_4119
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .unk_4129
	ld a, 4
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ld c, a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ret

.unk_4119
	dw $9822
	dw $9826
	dw $982a
	dw $982e
	dw $98c2
	dw $98c6
	dw $98ca
	dw $98ce

.unk_4129
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07

INCLUDE "data/faces/palettes.asm"
INCLUDE "data/faces/pics.asm"


