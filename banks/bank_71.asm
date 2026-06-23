Credits::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdcf5], a
	call ClearBGMap0
	ld a, $50
	ld [wWX], a
	ld de, CreditsBgTilemap2
	ld hl, $9C00
	ld bc, $0B12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call Func_1373
	ld de, CreditsBgTilemap1
	ld hl, $9C00
	ld bc, $0B12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $0B
	ldh [hVRAMCopyWidth], a
	call Func_1367
	ld hl, CreditsPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, CreditsFontGFX
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld a, $51
	ld [wd9e5], a
	call LoadMonPic_vTiles9440
	farcall Func_026_4cef
	call Func_71_42bf
	call Func_71_42a7
	ld a, $E7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4082
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_40a5
	ld a, [wdcf5]
	and a
	jr nz, .asm_409f
	call Func_71_4116
	call .asm_40b7
	jp .asm_4082
.asm_409f
	call Func_71_40fb
	jp .asm_4082
.asm_40a5
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, $09
	ld [hMapNumber], a
	xor a
	ld [hWarpNumber], a
	jp JumpToGameMode
.asm_40b7
	ldh a, [hSCY]
	cp $20
	jr z, .asm_40c2
	cp $A0
	jr z, .asm_40c2
	ret
.asm_40c2
	ld de, CreditsMonPicList
	ld a, [wdcfb]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wd9e5], a
	call LoadMonPic_vTiles9440
	farcall Func_026_4cef
	ld a, [wdcfb]
	inc a
	ld [wdcfb], a
	cp $13
	ret c
	xor a
	ld [wdcfb], a
	ret
CreditsMonPicList:
	db MON_117, MON_108, MON_091, MON_099, MON_145, MON_144, MON_126, MON_027, MON_041, MON_012, MON_006, MON_073, MON_095, MON_054, MON_114, MON_104
	db MON_133, MON_141, MON_081
Func_71_40fb:
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $60
	ret nz
	xor a
	ld [wdcf4], a
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	ld a, $01
	ld [hFade], a
	ret
Func_71_4116:
	ld a, [wdcf3]
	and a
	jr z, .asm_4146
	ldh a, [hSCY]
	inc a
	ldh [hSCY], a
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld a, [wdcf3]
	dec a
	ld [wdcf3], a
	ld a, [wdcf4]
	cp $08
	ret c
	ld a, [wdcf3]
	cp $0E
	ret nz
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld a, $01
	ld [wdcf5], a
	ret
.asm_4146
	ld a, [wdcf4]
	and a
	jr z, .asm_414f
	call .asm_4162
.asm_414f
	call .asm_41bf
	call .asm_41a5
	ld a, $1D
	ld [wdcf3], a
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	ret
.asm_4162
	ld de, CreditsScreenLayouts
	ld a, [wdcf4]
	dec a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [hVRAMCopyHeight], a
	ld c, a
	ld a, [hli]
	ld [hVRAMCopyWidth], a
	ld b, a
	ld a, [hli]
	ld [wd083], a
	ld a, [hli]
	ld [wd083 + 1], a
	ld h, a
	ld a, [wd083]
	ld l, a
	ld e, $00
	call Func_15a8
	ld a, [hVRAMCopyWidth]
	ld b, a
	ld a, [hVRAMCopyHeight]
	ld c, a
	ld a, [wd083]
	ld l, a
	ld a, [wd083 + 1]
	ld h, a
	ld a, $01
	ldh [rVBK], a
	xor e
	call Func_15a8
	ret
.asm_41a5
	ld de, CreditsScreenGfx
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8800
	call CopyBytesVRAM
	ret
.asm_41bf
	ld de, CreditsScreenLayouts
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [hVRAMCopyHeight], a
	ld c, a
	ld a, [hli]
	ld [hVRAMCopyWidth], a
	ld b, a
	ld a, [hli]
	ld [wd083], a
	ld a, [hli]
	ld [wd083 + 1], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, [wd083]
	ld l, a
	ld a, [wd083 + 1]
	ld h, a
	call PlaceTilemap_Bank0
	pop hl
	ld a, [hVRAMCopyWidth]
	ld b, a
	ld a, [hVRAMCopyHeight]
	ld c, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wd083]
	ld l, a
	ld a, [wd083 + 1]
	ld h, a
	call PlaceAttrmap
	ret
CreditsScreenLayouts:
	credits_screen_layout 6, 6, $9a82, CreditsScreen1Tilemap, CreditsScreen1Attrmap
	credits_screen_layout 6, 6, $9a22, CreditsScreen2Tilemap, CreditsScreen2Attrmap
	credits_screen_layout 9, 6, $99c2, CreditsScreen3Tilemap, CreditsScreen3Attrmap
	credits_screen_layout 5, 6, $9962, CreditsScreen4Tilemap, CreditsScreen4Attrmap
	credits_screen_layout 7, 6, $9902, CreditsScreen5Tilemap, CreditsScreen5Attrmap
	credits_screen_layout 5, 6, $98a2, CreditsScreen6Tilemap, CreditsScreen6Attrmap
	credits_screen_layout 9, 6, $9842, CreditsScreen7Tilemap, CreditsScreen7Attrmap
	credits_screen_layout 5, 6, $9be2, CreditsScreen8Tilemap, CreditsScreen8Attrmap
	credits_screen_layout 6, 6, $9a80, CreditsScreen1Tilemap, CreditsScreen1Attrmap
	credits_screen_layout 6, 6, $9900, CreditsScreen2Tilemap, CreditsScreen2Attrmap
	credits_screen_layout 9, 6, $9b80, CreditsScreen3Tilemap, CreditsScreen3Attrmap
	credits_screen_layout 5, 6, $9a00, CreditsScreen4Tilemap, CreditsScreen4Attrmap
	credits_screen_layout 7, 6, $9880, CreditsScreen5Tilemap, CreditsScreen5Attrmap
	credits_screen_layout 5, 6, $9b00, CreditsScreen6Tilemap, CreditsScreen6Attrmap
	credits_screen_layout 9, 6, $9980, CreditsScreen7Tilemap, CreditsScreen7Attrmap
	credits_screen_layout 5, 6, $9800, CreditsScreen8Tilemap, CreditsScreen8Attrmap
CreditsScreenGfx:
INCBIN "gfx/misc/creditsscreengfx.2bpp"
Func_71_42a7:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_42b0
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_42b0
	ret
Func_71_42b8:
	call DelayFrame
	dec c
	jr nz, Func_71_42b8
	ret
Func_71_42bf:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_42c5
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_42c5
	ret
CreditsBgTilemap1:
INCBIN "gfx/tilemaps/creditsbgtilemap1.tilemap"
CreditsBgTilemap2:
INCBIN "gfx/tilemaps/creditsbgtilemap2.tilemap"
CreditsPalette:
	RGB 31, 31, 31
	RGB 22, 31, 17
	RGB 0, 0, 22
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 31, 29, 0
	RGB 24, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 23, 31
	RGB 0, 0, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 17, 24, 31
	RGB 0, 0, 0
CreditsFontGFX:
INCBIN "gfx/misc/creditsfontgfx.2bpp"
CreditsScreen1Attrmap:
INCBIN "gfx/attrmaps/creditsscreen1attrmap.bin"
CreditsScreen1Tilemap:
INCBIN "gfx/tilemaps/creditsscreen1tilemap.tilemap"
CreditsScreen1Gfx:
INCBIN "gfx/misc/creditsscreen1gfx.2bpp"
CreditsScreen2Attrmap:
INCBIN "gfx/attrmaps/creditsscreen2attrmap.bin"
CreditsScreen2Tilemap:
INCBIN "gfx/tilemaps/creditsscreen2tilemap.tilemap"
CreditsScreen2Gfx:
INCBIN "gfx/misc/creditsscreen2gfx.2bpp"
CreditsScreen3Attrmap:
INCBIN "gfx/attrmaps/creditsscreen3attrmap.bin"
CreditsScreen3Tilemap:
INCBIN "gfx/tilemaps/creditsscreen3tilemap.tilemap"
CreditsScreen3Gfx:
INCBIN "gfx/misc/creditsscreen3gfx.2bpp"
CreditsScreen4Attrmap:
INCBIN "gfx/attrmaps/creditsscreen4attrmap.bin"
CreditsScreen4Tilemap:
INCBIN "gfx/tilemaps/creditsscreen4tilemap.tilemap"
CreditsScreen4Gfx:
INCBIN "gfx/misc/creditsscreen4gfx.2bpp"
CreditsScreen5Attrmap:
INCBIN "gfx/attrmaps/creditsscreen5attrmap.bin"
CreditsScreen5Tilemap:
INCBIN "gfx/tilemaps/creditsscreen5tilemap.tilemap"
CreditsScreen5Gfx:
INCBIN "gfx/misc/creditsscreen5gfx.2bpp"
CreditsScreen6Attrmap:
INCBIN "gfx/attrmaps/creditsscreen6attrmap.bin"
CreditsScreen6Tilemap:
INCBIN "gfx/tilemaps/creditsscreen6tilemap.tilemap"
CreditsScreen6Gfx:
INCBIN "gfx/misc/creditsscreen6gfx.2bpp"
CreditsScreen7Attrmap:
INCBIN "gfx/attrmaps/creditsscreen7attrmap.bin"
CreditsScreen7Tilemap:
INCBIN "gfx/tilemaps/creditsscreen7tilemap.tilemap"
CreditsScreen7Gfx:
INCBIN "gfx/misc/creditsscreen7gfx.2bpp"
CreditsScreen8Attrmap:
INCBIN "gfx/attrmaps/creditsscreen8attrmap.bin"
CreditsScreen8Tilemap:
INCBIN "gfx/tilemaps/creditsscreen8tilemap.tilemap"
CreditsScreen8Gfx:
INCBIN "gfx/misc/creditsscreen8gfx.2bpp"

TheEnd::
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ldh [rSCY], a
	ldh [rSCX], a
	ldh [rWY], a
	ldh [rWX], a
	ld [wdcde + 1], a
	ld hl, $9800
	ld de, TheEndTilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, TheEndAttrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, TheEndPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, TheEndGfx
	ld de, $9000
	ld bc, $0400
	call CopyBytesVRAM
	call Func_71_42bf
	call Func_71_42a7
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_5ab4
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ld a, [wTargetMode]
	cp $16
	jr nz, .asm_5ab4
	ldh a, [hFadeFrameCounter]
	and $07
	jr nz, .asm_5ab4
	ld a, [wdcde + 1]
	inc a
	ld [wdcde + 1], a
	cp $20
	jr nz, .asm_5ab4
	ld a, GAMEMODE_WORLD_MAP
	ld [wTargetMode], a
	jp JumpToGameMode
TheEndAttrmap:
INCBIN "gfx/attrmaps/theendattrmap.bin"
TheEndTilemap:
INCBIN "gfx/tilemaps/theendtilemap.tilemap"
TheEndPalette:
	RGB 31, 31, 31
	RGB 22, 31, 17
	RGB 10, 0, 20
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 31, 29, 0
	RGB 25, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 23, 31
	RGB 0, 0, 31
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_071_5dec:
	ds 8
TheEndGfx:
INCBIN "gfx/misc/theendgfx.bin"


