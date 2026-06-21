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
	dw SpriteLayouts
	dw SpriteLayouts
	dw SpriteLayouts_5fb3
	dw SpriteLayouts_5fbe
	dw SpriteLayouts_5fc9
	dw SpriteLayouts_5fd4
	dw SpriteLayouts_5fe9
	dw SpriteLayouts_6008
	dw SpriteLayouts_6045
	dw SpriteLayouts_60c8
	dw SpriteLayouts_6155
	dw SpriteLayouts_61e2
	dw SpriteLayouts_6251
	dw SpriteLayouts_62ac
	dw SpriteLayouts_62ee
	dw SpriteLayouts_630d
	dw SpriteLayouts_6381
SpriteLayouts:
	dr $135fa8, $135fb3
SpriteLayouts_5fb3:
	dr $135fb3, $135fbe
SpriteLayouts_5fbe:
	dr $135fbe, $135fc9
SpriteLayouts_5fc9:
	dr $135fc9, $135fd4
SpriteLayouts_5fd4:
	dr $135fd4, $135fe9
SpriteLayouts_5fe9:
	dr $135fe9, $136008
SpriteLayouts_6008:
	dr $136008, $136045
SpriteLayouts_6045:
	dr $136045, $1360c8
SpriteLayouts_60c8:
	dr $1360c8, $136155
SpriteLayouts_6155:
	dr $136155, $1361e2
SpriteLayouts_61e2:
	dr $1361e2, $136251
SpriteLayouts_6251:
	dr $136251, $1362ac
SpriteLayouts_62ac:
	dr $1362ac, $1362ee
SpriteLayouts_62ee:
	dr $1362ee, $13630d
SpriteLayouts_630d:
	dr $13630d, $136381
SpriteLayouts_6381:
	dr $136381, $1363f0


