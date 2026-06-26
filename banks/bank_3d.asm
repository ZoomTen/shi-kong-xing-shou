LoadBattleAnimGFX_03d::
	ld de, Pointers_03d_401b
	ld a, [wBattleAnimID]
	sub BATTLE_ANIM_BANK_6_START
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
Pointers_03d_401b::
	dw SubImage_03d_4037
	dw SubImage_03d_4699
	dw SubImage_03d_4e9b
	dw SubImage_03d_51dd
	dw SubImage_03d_55df
	dw SubImage_03d_58c1
	dw SubImage_03d_5f83
	dw SubImage_03d_6045
	dw SubImage_03d_6847
	dw SubImage_03d_6847
	dw SubImage_03d_6847
	dw SubImage_03d_6f69
	dw SubImage_03d_726b
	dw SubImage_03d_788d
SubImage_03d_4037::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_4037.2bpp"
.e

SubImage_03d_4699::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_4699.2bpp"
.e

SubImage_03d_4e9b::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_4e9b.2bpp"
.e

SubImage_03d_51dd::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_51dd.2bpp"
.e

SubImage_03d_55df::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_55df.2bpp"
.e

SubImage_03d_58c1::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_58c1.bin"
.e

SubImage_03d_5f83::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_5f83.2bpp"
.e

SubImage_03d_6045::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_6045.2bpp"
.e

SubImage_03d_6847::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_6847.2bpp"
.e

SubImage_03d_6f69::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_6f69.2bpp"
.e

SubImage_03d_726b::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_726b.2bpp"
.e

SubImage_03d_788d::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_3d_788d.2bpp"
.e


