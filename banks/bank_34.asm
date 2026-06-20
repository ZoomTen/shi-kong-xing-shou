LoadBattleAnimGFX_034:
	ld de, Pointers_034_401b
	ld a, [wBattleAnimID]
	sub BATTLE_ANIM_BANK_2_START
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
Pointers_034_401b:
	dw SubImage_034_4037
	dw SubImage_034_4299
	dw SubImage_034_46db
	dw SubImage_034_4a9d
	dw SubImage_034_515f
	dw SubImage_034_53a1
	dw SubImage_034_5543
	dw SubImage_034_5c05
	dw SubImage_034_6027
	dw SubImage_034_63e9
	dw SubImage_034_69ab
	dw SubImage_034_6b4d
	dw SubImage_034_6e4f
	dw SubImage_034_7511
SubImage_034_4037:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_4037.2bpp"
.e

SubImage_034_4299:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_4299.2bpp"
.e

SubImage_034_46db:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_46db.2bpp"
.e

SubImage_034_4a9d:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_4a9d.2bpp"
.e

SubImage_034_515f:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_515f.2bpp"
.e

SubImage_034_53a1:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_53a1.2bpp"
.e

SubImage_034_5543:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_5543.2bpp"
.e

SubImage_034_5c05:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_5c05.2bpp"
.e

SubImage_034_6027:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_6027.2bpp"
.e

SubImage_034_63e9:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_63e9.2bpp"
.e

SubImage_034_69ab:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_69ab.2bpp"
.e

SubImage_034_6b4d:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_6b4d.2bpp"
.e

SubImage_034_6e4f:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_6e4f.2bpp"
.e

SubImage_034_7511:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_34_7511.2bpp"
.e


