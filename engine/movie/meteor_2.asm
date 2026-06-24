MeteorCutscene2::
	ld a, BGM_METEOR
	call PlaySound
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
	ld hl, $9800
	ld de, MeteorCutscene2_Tilemap1
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, MeteorCutscene2_Attrmap1
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, MeteorCutscene2_Palette1
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, MeteorCutscene2_GFX1
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, MeteorCutscene2_GFX2
	ld de, $8800
	ld bc, $0230
	call CopyBytesVRAM
	ld hl, MeteorCutscene2_PaletteOBJ
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, MeteorCutscene2_GFX3
	ld de, $8000
	ld bc, $0080
	call CopyBytesVRAM
	call Func_061_419d
	call Func_061_4185
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4095
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_40bb
	ld a, [wdcf5]
	cp $01
	jr z, .asm_40c4
	call Func_061_41ab
	call Func_061_42e6
	call Func_061_4217
	call Func_61_4280
	call Func_061_42b0
	jp .asm_4095
.asm_40bb
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_40c4
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeOutPalette
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
	ld hl, $9800
	ld de, MeteorCutscene2_Tilemap2
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, MeteorCutscene2_Attrmap2
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, MeteorCutscene2_Palette2
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, MeteorCutscene2_GFX4
	ld de, $9000
	ld bc, $02E0
	call CopyBytesVRAM
	ld hl, MeteorCutscene2_PaletteOBJ
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, MeteorCutscene2_GFX3
	ld de, $8000
	ld bc, $0080
	call CopyBytesVRAM
	call Func_061_419d
	call Func_061_4185
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_4151
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jp nz, .asm_40bb
	call Func_061_42e6
	call Func_061_4217
	call Func_61_4280
	call Func_061_42b0
	call .asm_4171
	jp .asm_4151
.asm_4171
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	ld a, $01
	ld [hFade], a
	ret
Func_061_4185:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_418e
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_418e
	ret
.asm_4196
	call DelayFrame
	dec c
	jr nz, .asm_4196
	ret
Func_061_419d:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_41a3
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_41a3
	ret
Func_061_41ab:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $40
	ret nz
	xor a
	ld [wdcf3], a
	ld de, MeteorCutscene2_AnimTilemapPointers
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld de, MeteorCutscene2_AnimAttrmapPointers
	ld a, [wdcf4]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9800
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp $03
	ret c
	ld a, $01
	ld [wdcf5], a
	ret
MeteorCutscene2_AnimTilemapPointers:
INCBIN "gfx/tilemaps/meteorcutscene2_animtilemappointers.tilemap"
MeteorCutscene2_AnimAttrmapPointers:
INCBIN "gfx/attrmaps/meteorcutscene2_animattrmappointers.bin"
Func_061_4217:
	ld a, [wdcf6]
	and a
	jr z, .asm_4222
	dec a
	ld [wdcf6], a
	ret
.asm_4222
	ld bc, wdd50
.asm_4225
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4239
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5F
	jr c, .asm_4225
	ret
.asm_4239
	ld de, MeteorCutscene2_ObjectInitTable
	ld a, [wdce8]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, $01
	ld [bc], a
	ld a, [hli]
	ld [wdcf6], a
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp $07
	ret c
	xor a
	ld [wdce8], a
	ret
MeteorCutscene2_ObjectInitTable:
	db $f0, $30, $04, $10, $00, $50, $04, $10, $f0, $70, $04, $10, $00, $90, $04, $10
	db $f0, $40, $04, $10, $00, $60, $04, $10, $f0, $80, $04, $10
Func_61_4280:
	ld bc, wdd50
.asm_4283
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4297
.asm_428b
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5F
	jr c, .asm_4283
	ret
.asm_4297
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_42a2
	dec [hl]
	jr .asm_428b
.asm_42a2
	ld [hl], $04
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	ld d, a
	ld a, $03
	sub d
	ld [hl], a
	jr .asm_428b
Func_061_42b0:
	ld bc, wdd50
.asm_42b3
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_42c7
.asm_42bb
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4F
	jr c, .asm_42b3
	ret
.asm_42c7
	ld hl, $0001
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $04
	ld [hl], a
	cp $A0
	jr nz, .asm_42bb
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	jr .asm_42bb
Func_061_42e6:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_42ef
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_42ef
	xor a
	ld [wVirtualOAMPtr], a
	call .asm_42fe
	ret
.asm_42fe
	ld bc, wdd50
.asm_4301
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4315
.asm_4309
	ld hl, $0004
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4F
	jr c, .asm_4301
	ret
.asm_4315
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	ld [wdcf7], a
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	ld [wdcf8], a
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	ld de, MeteorCutscene2_AnimFramePointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_433b
	ld a, [hli]
	cp $FF
	jr z, .asm_435b
	push bc
	ld b, a
	ld a, [wdcf7]
	add b
	pop bc
	ld [de], a
	inc de
	ld a, [hli]
	push bc
	ld b, a
	ld a, [wdcf8]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop bc
	jr .asm_433b
.asm_435b
	ld a, e
	ld [wVirtualOAMPtr], a
	jp .asm_4309
MeteorCutscene2_AnimFramePointers:
	dw MeteorCutscene2_AnimFrame0
	dw MeteorCutscene2_AnimFrame0
	dw MeteorCutscene2_AnimFrame1
MeteorCutscene2_AnimFrame0:
	db $00, $00, $00, $00, $00, $08, $02, $00, $ff
MeteorCutscene2_AnimFrame1:
	db $00, $00, $04, $00, $00, $08, $06, $00, $ff

MeteorCutscene2_Palette1::
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 4, 25
	RGB 0, 0, 0
	RGB 31, 22, 28
	RGB 23, 4, 19
	RGB 13, 2, 10
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
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	ds 8
MeteorCutscene2_PaletteOBJ::
	RGB 21, 21, 21
	RGB 9, 0, 0
	RGB 27, 0, 0
	RGB 31, 26, 7
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
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	ds 8
MeteorCutscene2_GFX1:: INCBIN "gfx/misc/meteorcutscene2_gfx1.2bpp"
MeteorCutscene2_GFX2:: INCBIN "gfx/misc/meteorcutscene2_gfx2.2bpp"
MeteorCutscene2_GFX3:: INCBIN "gfx/misc/meteorcutscene2_gfx3.2bpp"
MeteorCutscene2_Attrmap1:: INCBIN "gfx/attrmaps/meteorcutscene2_attrmap1.bin"
MeteorCutscene2_Tilemap1:: INCBIN "gfx/tilemaps/meteorcutscene2_tilemap1.tilemap"
unk_61_516A:
	db $00, $00, $00, $00, $38, $39, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $3a, $3b, $00, $00, $00, $00, $00, $00
MeteorCutscene2_AnimAttrmap0:: INCBIN "gfx/attrmaps/meteorcutscene2_animattrmap0.bin"
MeteorCutscene2_AnimTilemap0:: INCBIN "gfx/tilemaps/meteorcutscene2_animtilemap0.tilemap"
MeteorCutscene2_AnimAttrmap1:: INCBIN "gfx/attrmaps/meteorcutscene2_animattrmap1.bin"
MeteorCutscene2_AnimTilemap1:: INCBIN "gfx/tilemaps/meteorcutscene2_animtilemap1.tilemap"
MeteorCutscene2_Palette2::
	RGB 31, 30, 28
	RGB 27, 25, 18
	RGB 18, 14, 9
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 19, 26, 11
	RGB 6, 13, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 8, 26, 31
	RGB 0, 11, 30
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 31, 24, 10
	RGB 21, 10, 0
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 27, 25, 21
	RGB 0, 15, 30
	RGB 0, 0, 0
	RGB 31, 30, 28
	RGB 20, 27, 27
	RGB 8, 14, 14
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	ds 8
MeteorCutscene2_Attrmap2:: INCBIN "gfx/attrmaps/meteorcutscene2_attrmap2.bin"
MeteorCutscene2_Tilemap2:: INCBIN "gfx/tilemaps/meteorcutscene2_tilemap2.tilemap"
MeteorCutscene2_GFX4:: INCBIN "gfx/misc/meteorcutscene2_gfx4.2bpp"

