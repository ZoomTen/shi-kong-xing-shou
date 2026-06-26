LoadBattleAnimGFX_049::
	ld de, Pointers_049_401b
	ld a, [wBattleAnimID]
	sub BATTLE_ANIM_BANK_9_START
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
Pointers_049_401b::
	dw SubImage_049_4031
	dw SubImage_049_47d3
	dw SubImage_049_47d3
	dw SubImage_049_4bb5
	dw SubImage_049_4fb7
	dw SubImage_049_5239
	dw SubImage_049_591b
	dw SubImage_049_7403
	dw SubImage_049_7403
	dw SubImage_049_7705
	dw SubImage_049_7b47
SubImage_049_4031::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_4031.2bpp"
.e

SubImage_049_47d3::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_47d3.2bpp"
.e

SubImage_049_4bb5::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_4bb5.2bpp"
.e

SubImage_049_4fb7::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_4fb7.2bpp"
.e

SubImage_049_5239::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_5239.2bpp"
.e

SubImage_049_591b::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_591b.2bpp"
.e

SubImage_049_609d::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_609d.2bpp"
.e

SubImage_049_685f::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_685f.2bpp"
.e

SubImage_049_7041::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_7041.2bpp"
.e

SubImage_049_7403::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_7403.2bpp"
.e

SubImage_049_7705::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_7705.2bpp"
.e

SubImage_049_7b47::
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_49_7b47.2bpp"
.e
