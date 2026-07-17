; Face-pic loader for wTextFaceID >= PIC_GFX_2 (second face table).
; Twin of _LoadTextFaceGFX (banks/bank_1f.asm) for IDs < PIC_GFX_2.
_LoadTextFaceGFX2::
; 2bpp
	ld de, FacePicPointers2
	ld a, [wTextFaceID]
	sub a, PIC_GFX_2
	ld l, a
	ld h, $00
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
	ld de, FacePalettePointers2
	pop hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 1 palettes
	ld c, BCPSF_AUTOINC | $38
	call LoadPalettes_BCPD
	ret

INCLUDE "data/faces/palettes2.asm"
INCLUDE "data/faces/pics2.asm"
