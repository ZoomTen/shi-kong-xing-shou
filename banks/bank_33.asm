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
	db $0d, $0e, $0f, $10, $11, $12, $00, $00
	db $13, $14, $15, $16, $17, $18, $00, $00
	db $19, $1a, $1b, $1c, $1d, $1e, $00, $00
	db $1f, $20, $21, $22, $23, $24, $00, $00
	db $25, $26, $27, $28, $29, $2a, $00, $00
	db $2b, $2c, $2d, $2e, $2f, $30, $00, $00
Tilemap_033_4125:
	db $00, $0d, $0e, $0f, $10, $11, $12, $00
	db $00, $13, $14, $15, $16, $17, $18, $00
	db $00, $19, $1a, $1b, $1c, $1d, $1e, $00
	db $00, $1f, $20, $21, $22, $23, $24, $00
	db $00, $25, $26, $27, $28, $29, $2a, $00
	db $00, $2b, $2c, $2d, $2e, $2f, $30, $00
Tilemap_033_4155:
	db $00, $00, $0d, $0e, $0f, $10, $11, $12
	db $00, $00, $13, $14, $15, $16, $17, $18
	db $00, $00, $19, $1a, $1b, $1c, $1d, $1e
	db $00, $00, $1f, $20, $21, $22, $23, $24
	db $00, $00, $25, $26, $27, $28, $29, $2a
	db $00, $00, $2b, $2c, $2d, $2e, $2f, $30
Tilemap_033_4185:
	db $00, $00, $00, $0d, $0e, $0f, $10, $11
	db $00, $00, $00, $13, $14, $15, $16, $17
	db $00, $00, $00, $19, $1a, $1b, $1c, $1d
	db $00, $00, $00, $1f, $20, $21, $22, $23
	db $00, $00, $00, $25, $26, $27, $28, $29
	db $00, $00, $00, $2b, $2c, $2d, $2e, $2f
Tilemap_033_41b5:
	db $00, $00, $00, $00, $0d, $0e, $0f, $10
	db $00, $00, $00, $00, $13, $14, $15, $16
	db $00, $00, $00, $00, $19, $1a, $1b, $1c
	db $00, $00, $00, $00, $1f, $20, $21, $22
	db $00, $00, $00, $00, $25, $26, $27, $28
	db $00, $00, $00, $00, $2b, $2c, $2d, $2e
Tilemap_033_41e5:
	db $00, $00, $00, $00, $00, $0d, $0e, $0f
	db $00, $00, $00, $00, $00, $13, $14, $15
	db $00, $00, $00, $00, $00, $19, $1a, $1b
	db $00, $00, $00, $00, $00, $1f, $20, $21
	db $00, $00, $00, $00, $00, $25, $26, $27
	db $00, $00, $00, $00, $00, $2b, $2c, $2d
Tilemap_033_4215:
	db $00, $00, $00, $00, $00, $00, $0d, $0e
	db $00, $00, $00, $00, $00, $00, $13, $14
	db $00, $00, $00, $00, $00, $00, $19, $1a
	db $00, $00, $00, $00, $00, $00, $1f, $20
	db $00, $00, $00, $00, $00, $00, $25, $26
	db $00, $00, $00, $00, $00, $00, $2b, $2c
Tilemap_033_4245:
	db $00, $00, $00, $00, $00, $00, $00, $0d
	db $00, $00, $00, $00, $00, $00, $00, $13
	db $00, $00, $00, $00, $00, $00, $00, $19
	db $00, $00, $00, $00, $00, $00, $00, $1f
	db $00, $00, $00, $00, $00, $00, $00, $25
	db $00, $00, $00, $00, $00, $00, $00, $2b
Tilemap_033_4275:
	db $00, $00, $36, $35, $34, $33, $32, $31
	db $00, $00, $3c, $3b, $3a, $39, $38, $37
	db $00, $00, $42, $41, $40, $3f, $3e, $3d
	db $00, $00, $48, $47, $46, $45, $44, $43
	db $00, $00, $4e, $4d, $4c, $4b, $4a, $49
	db $00, $00, $54, $53, $52, $51, $50, $4f
Tilemap_033_42a5:
	db $00, $36, $35, $34, $33, $32, $31, $00
	db $00, $3c, $3b, $3a, $39, $38, $37, $00
	db $00, $42, $41, $40, $3f, $3e, $3d, $00
	db $00, $48, $47, $46, $45, $44, $43, $00
	db $00, $4e, $4d, $4c, $4b, $4a, $49, $00
	db $00, $54, $53, $52, $51, $50, $4f, $00
Tilemap_033_42d5:
	db $36, $35, $34, $33, $32, $31, $00, $00
	db $3c, $3b, $3a, $39, $38, $37, $00, $00
	db $42, $41, $40, $3f, $3e, $3d, $00, $00
	db $48, $47, $46, $45, $44, $43, $00, $00
	db $4e, $4d, $4c, $4b, $4a, $49, $00, $00
	db $54, $53, $52, $51, $50, $4f, $00, $00
Tilemap_033_4305:
	db $35, $34, $33, $32, $31, $00, $00, $00
	db $3b, $3a, $39, $38, $37, $00, $00, $00
	db $41, $40, $3f, $3e, $3d, $00, $00, $00
	db $47, $46, $45, $44, $43, $00, $00, $00
	db $4d, $4c, $4b, $4a, $49, $00, $00, $00
	db $53, $52, $51, $50, $4f, $00, $00, $00
Tilemap_033_4335:
	db $34, $33, $32, $31, $00, $00, $00, $00
	db $3a, $39, $38, $37, $00, $00, $00, $00
	db $40, $3f, $3e, $3d, $00, $00, $00, $00
	db $46, $45, $44, $43, $00, $00, $00, $00
	db $4c, $4b, $4a, $49, $00, $00, $00, $00
	db $52, $51, $50, $4f, $00, $00, $00, $00
Tilemap_033_4365:
	db $33, $32, $31, $00, $00, $00, $00, $00
	db $39, $38, $37, $00, $00, $00, $00, $00
	db $3f, $3e, $3d, $00, $00, $00, $00, $00
	db $45, $44, $43, $00, $00, $00, $00, $00
	db $4b, $4a, $49, $00, $00, $00, $00, $00
	db $51, $50, $4f, $00, $00, $00, $00, $00
Tilemap_033_4395:
	db $32, $31, $00, $00, $00, $00, $00, $00
	db $38, $37, $00, $00, $00, $00, $00, $00
	db $3e, $3d, $00, $00, $00, $00, $00, $00
	db $44, $43, $00, $00, $00, $00, $00, $00
	db $4a, $49, $00, $00, $00, $00, $00, $00
	db $50, $4f, $00, $00, $00, $00, $00, $00
Tilemap_033_43c5:
	db $31, $00, $00, $00, $00, $00, $00, $00
	db $37, $00, $00, $00, $00, $00, $00, $00
	db $3d, $00, $00, $00, $00, $00, $00, $00
	db $43, $00, $00, $00, $00, $00, $00, $00
	db $49, $00, $00, $00, $00, $00, $00, $00
	db $4f, $00, $00, $00, $00, $00, $00, $00
Tilemap_033_43f5:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

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
