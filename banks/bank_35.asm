LoadBattleAnimGFX_035::
	ld de, Pointers_035_401b
	ld a, [wBattleAnimID]
	sub BATTLE_ANIM_BANK_3_START
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
Pointers_035_401b::
	dw SubImage_035_4037
	dw SubImage_035_45b9
	dw SubImage_035_47fb
	dw SubImage_035_4a3d
	dw SubImage_035_4e3f
	dw SubImage_035_5201
	dw SubImage_035_5583
	dw SubImage_035_5aa5
	dw SubImage_035_5f67
	dw SubImage_035_63a9
	dw SubImage_035_654b
	dw SubImage_035_6d4d
	dw SubImage_035_72af
	dw SubImage_035_7691
SubImage_035_4037::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_4037.2bpp"
.e

SubImage_035_45b9::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_45b9.2bpp"
.e

SubImage_035_47fb::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_47fb.2bpp"
.e

SubImage_035_4a3d::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_4a3d.2bpp"
.e

SubImage_035_4e3f::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_4e3f.2bpp"
.e

SubImage_035_5201::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_5201.2bpp"
.e

SubImage_035_5583::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_5583.2bpp"
.e

SubImage_035_5aa5::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_5aa5.2bpp"
.e

SubImage_035_5f67::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_5f67.2bpp"
.e

SubImage_035_63a9::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_63a9.2bpp"
.e

SubImage_035_654b::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_654b.2bpp"
.e

SubImage_035_6d4d::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_6d4d.2bpp"
.e

SubImage_035_72af::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_72af.2bpp"
.e

SubImage_035_7691::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_35_7691.2bpp"
.e


