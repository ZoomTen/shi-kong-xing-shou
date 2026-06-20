Func_04d_4000:
	ld a, [wd98f]
	ld l, a
	ld a, [wd990]
	ld h, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call CopyBytesVRAM
	ret
Bank4d_SpriteGFX:
INCBIN "gfx/misc/bank4d_spritegfx.bin"
Func_4d_5ed8:
	ld l, e
	ld h, d
	ld c, $b0
	ld b, $10
	call LoadPalettes_OCPD
	ret
; TODO: unreferenced data block, classify type
unk_4d_5ee2:
	dr $135ee2, $135f3a
Func_4d_5f3a:
	ld hl, wd1a0
.asm_5f3d
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_5f79
	ld [wd0c1], a
	ld de, SpriteLayout_Pointers
	ld a, [wd0c1]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_5f5e
	ld a, [hli]
	cp $ff
	jp z, .asm_5f75
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jp .asm_5f5e
.asm_5f75
	ld a, e
	ld [wd1fb], a
.asm_5f79
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $e0
	ret nc
	jp .asm_5f3d
Func_4d_5f85:
	ret
SpriteLayout_Pointers:
	dr $135f86, $135fa8
SpriteLayouts:
	dr $135fa8, $1363f0


