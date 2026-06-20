Func_048_4000:
	ld de, Pointers_048_401b
	ld a, [wBattleAnimID]
	sub BATTLE_ANIM_BANK_8_START
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
Pointers_048_401b:
	dw SubImage_048_402d
	dw SubImage_048_442f
	dw SubImage_048_4b71
	dw SubImage_048_5495
	dw SubImage_048_5b97
	dw SubImage_048_5d79
	dw SubImage_048_667d
	dw SubImage_048_6bbf
	dw SubImage_048_70a1
SubImage_048_402d:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_402d.2bpp"
.e

SubImage_048_442f:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_442f.2bpp"
.e

SubImage_048_4b71:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_4b71.2bpp"
.e

SubImage_048_4cb3:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_4cb3.2bpp"
.e

SubImage_048_5495:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_5495.2bpp"
.e

SubImage_048_5b97:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_5b97.2bpp"
.e

SubImage_048_5d79:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_5d79.2bpp"
.e

SubImage_048_627b:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_627b.2bpp"
.e

SubImage_048_667d:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_667d.2bpp"
.e

SubImage_048_6bbf:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_6bbf.2bpp"
.e

SubImage_048_70a1:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_48_70a1.2bpp"
.e

	ds 13


