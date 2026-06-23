LoadBattleAnimGFX_03e:
	ld de, Pointers_03e_401b
	ld a, [wBattleAnimID]
	sub BATTLE_ANIM_BANK_7_START
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, vTiles0
	call CopyBytesVRAM
	ret
Pointers_03e_401b:
	dw SubImage_03e_4041
	dw SubImage_03e_4843
	dw SubImage_03e_4f65
	dw SubImage_03e_5549
	dw SubImage_03e_5549
	dw SubImage_03e_5549
	dw SubImage_03e_50e7
	dw SubImage_03e_5549
	dw SubImage_03e_564b
	dw SubImage_03e_58cd
	dw SubImage_03e_5b6f
	dw SubImage_03e_6151
	dw SubImage_03e_6493
	dw SubImage_03e_6bb5
	dw SubImage_03e_7057
	dw SubImage_03e_71d9
	dw SubImage_03e_765b
	dw SubImage_03e_765b
	dw SubImage_03e_7c9d
SubImage_03e_4041:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_4041.bin"
.e

SubImage_03e_4843:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_4843.2bpp"
.e

SubImage_03e_4f65:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_4f65.2bpp"
.e

SubImage_03e_50e7:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_50e7.2bpp"
.e

SubImage_03e_5549:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_5549.2bpp"
.e

SubImage_03e_564b:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_564b.2bpp"
.e

SubImage_03e_58cd:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_58cd.2bpp"
.e

SubImage_03e_5b6f:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_5b6f.2bpp"
.e

SubImage_03e_6151:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_6151.2bpp"
.e

SubImage_03e_6493:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_6493.2bpp"
.e

SubImage_03e_6bb5:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_6bb5.2bpp"
.e

SubImage_03e_7057:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_7057.2bpp"
.e

SubImage_03e_71d9:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_71d9.2bpp"
.e

SubImage_03e_765b:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_765b.2bpp"
.e

SubImage_03e_7c9d:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3e_7c9d.2bpp"
.e
