LoadBattleAnimGFX_031::
	ld de, Pointers_031_401b
	ld a, [wBattleAnimID]
	sub BATTLE_ANIM_BANK_1_START
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
Pointers_031_401b::
	dw SubImage_031_403d
	dw SubImage_031_447f
	dw SubImage_031_4781
	dw SubImage_031_4f83
	dw SubImage_031_56c5
	dw SubImage_031_403d
	dw SubImage_031_5d87
	dw SubImage_031_6229
	dw SubImage_031_6229
	dw SubImage_031_66ab
	dw SubImage_031_6b6d
	dw SubImage_031_732f
	dw SubImage_031_76b1
	dw SubImage_031_7a53
	dw SubImage_031_7c95
	dw SubImage_031_7c95
	dw SubImage_031_7c95
SubImage_031_403d::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_403d.2bpp"
.e

SubImage_031_447f::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_447f.2bpp"
.e

SubImage_031_4781::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_4781.2bpp"
.e

SubImage_031_4f83::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_4f83.2bpp"
.e

SubImage_031_56c5::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_56c5.2bpp"
.e

SubImage_031_5d87::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_5d87.2bpp"
.e

SubImage_031_6229::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_6229.2bpp"
.e

SubImage_031_66ab::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_66ab.2bpp"
.e

SubImage_031_6b6d::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_6b6d.2bpp"
.e

SubImage_031_732f::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_732f.2bpp"
.e

SubImage_031_76b1::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_76b1.2bpp"
.e

SubImage_031_7a53::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_7a53.2bpp"
.e

SubImage_031_7c95::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_31_7c95.2bpp"
.e
