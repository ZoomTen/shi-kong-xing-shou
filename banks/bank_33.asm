Func_033_4000:
	ld a, [wd986]
	and a
	jr nz, .asm_4033
	ld a, [wd990]
	and a
	jr nz, .asm_4039
.asm_400c
	ld de, Attrmap_033_409D
	ld hl, vBGMap0
	ld bc, $0806
	ld a, $08
	ldh [hVRAMCopyWidth], a
	ld a, $06
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld de, TilemapPointers_033_40E1
	ld a, [wd98b]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, vBGMap0
	jr .asm_405e
.asm_4033
	ld a, [wd990]
	and a
	jr nz, .asm_400c
.asm_4039
	ld de, Attrmap_033_406D
	ld hl, vBGMap0 + $CC
	ld bc, $0806
	ld a, $08
	ldh [hVRAMCopyWidth], a
	ld a, $06
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld de, TilemapPointers_033_40CD
	ld a, [wd98b]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, vBGMap0 + $CC
.asm_405e
	ld bc, $0806
	ld a, $08
	ldh [hVRAMCopyWidth], a
	ld a, $06
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

Attrmap_033_406D:
	ds $30, $06 ; 8x6, all palette 6
Attrmap_033_409D:
	ds $30, $07 ; 8x6, all palette 7

TilemapPointers_033_40CD:
	dw Tilemap_033_40f5
	dw Tilemap_033_4125
	dw Tilemap_033_4155
	dw Tilemap_033_4185
	dw Tilemap_033_41b5
	dw Tilemap_033_41e5
	dw Tilemap_033_4215
	dw Tilemap_033_4245
	dw Tilemap_033_43f5
	dw Tilemap_033_43f5
TilemapPointers_033_40E1:
	dw Tilemap_033_4275
	dw Tilemap_033_42a5
	dw Tilemap_033_42d5
	dw Tilemap_033_4305
	dw Tilemap_033_4335
	dw Tilemap_033_4365
	dw Tilemap_033_4395
	dw Tilemap_033_43c5
	dw Tilemap_033_43f5
	dw Tilemap_033_43f5

Tilemap_033_40f5:
	INCBIN "gfx/tilemaps/tilemap_033_40f5.tilemap"
Tilemap_033_4125:
	INCBIN "gfx/tilemaps/tilemap_033_4125.tilemap"
Tilemap_033_4155:
	INCBIN "gfx/tilemaps/tilemap_033_4155.tilemap"
Tilemap_033_4185:
	INCBIN "gfx/tilemaps/tilemap_033_4185.tilemap"
Tilemap_033_41b5:
	INCBIN "gfx/tilemaps/tilemap_033_41b5.tilemap"
Tilemap_033_41e5:
	INCBIN "gfx/tilemaps/tilemap_033_41e5.tilemap"
Tilemap_033_4215:
	INCBIN "gfx/tilemaps/tilemap_033_4215.tilemap"
Tilemap_033_4245:
	INCBIN "gfx/tilemaps/tilemap_033_4245.tilemap"
Tilemap_033_4275:
	INCBIN "gfx/tilemaps/tilemap_033_4275.tilemap"
Tilemap_033_42a5:
	INCBIN "gfx/tilemaps/tilemap_033_42a5.tilemap"
Tilemap_033_42d5:
	INCBIN "gfx/tilemaps/tilemap_033_42d5.tilemap"
Tilemap_033_4305:
	INCBIN "gfx/tilemaps/tilemap_033_4305.tilemap"
Tilemap_033_4335:
	INCBIN "gfx/tilemaps/tilemap_033_4335.tilemap"
Tilemap_033_4365:
	INCBIN "gfx/tilemaps/tilemap_033_4365.tilemap"
Tilemap_033_4395:
	INCBIN "gfx/tilemaps/tilemap_033_4395.tilemap"
Tilemap_033_43c5:
	INCBIN "gfx/tilemaps/tilemap_033_43c5.tilemap"
Tilemap_033_43f5:
	INCBIN "gfx/tilemaps/tilemap_033_43f5.tilemap"

; copies bc bytes (length-prefixed at [wd990:wd98f]) to vTiles0
Func_033_4425:
	ld a, [wCopySrc]
	ld l, a
	ld a, [wCopySrc + 1]
	ld h, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, vTiles0
	call CopyBytesVRAM
	ret

; copies [src][len] record at [wd990:wd98f] to VRAM
Func_033_4438:
	ld a, [wCopySrc]
	ld l, a
	ld a, [wCopySrc + 1]
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

; battle-bg tile GFX: [dw len][2bpp] records, indexed by a computed wd990:wd98f pointer
SubImage_033_444c:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_444c.2bpp"
.e
SubImage_033_4b0e:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_4b0e.2bpp"
.e
SubImage_033_4c90:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_4c90.2bpp"
.e
SubImage_033_5352:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_5352.2bpp"
.e
SubImage_033_5834:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_5834.2bpp"
.e
SubImage_033_5ed6:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_5ed6.2bpp"
.e
SubImage_033_66d8:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_66d8.2bpp"
.e
SubImage_033_6cda:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_6cda.2bpp"
.e
SubImage_033_739c:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_739c.2bpp"
.e
SubImage_033_799e:
	dw .e - .d
.d
	INCBIN "gfx/misc/gfx_33_799e.2bpp"
.e
