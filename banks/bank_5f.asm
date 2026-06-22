CrystalCutscene::
	ld a, BGM_JUNKYARD
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
	ld de, CrystalCutscene_Tilemap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, CrystalCutscene_Attrmap
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, CrystalCutscene_PaletteBG
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, CrystalCutscene_GFX
	ld de, $9000
	ld bc, $0720
	call CopyBytesVRAM
	ld hl, CrystalCutscene_PaletteOBJ
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, CrystalCutscene_SpriteGFX
	ld de, $8000
	ld bc, $0800
	call CopyBytesVRAM
	call Func_5f_4282
	call Func_5f_4290
	ld a, $F0
	ld [wcd42], a
	ld a, $48
	ld [wcd43], a
	ld a, $01
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	ld a, $C7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_409d
	call Func_5f_417A
	call DelayFrame
	call .asm_4106
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_40c1
	ld a, [wdcf5]
	cp $01
	jr z, .asm_40ca
	cp $02
	jr z, .asm_40dc
	call .asm_40f6
	jp .asm_409d
.asm_40c1
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_40ca
	ld a, SFX_29
	call PlaySound
	ld a, $82
	ld [wcd45], a
	ld a, $02
	ld [wdcf5], a
	jp .asm_409d
.asm_40dc
	call .asm_40e2
	jp .asm_409d
.asm_40e2
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
.asm_40f6
	ld a, [wcd42]
	inc a
	ld [wcd42], a
	cp $60
	ret nz
	ld a, $01
	ld [wdcf5], a
	ret
.asm_4106
	ld a, [wcd45]
	and a
	ret z
	and $80
	jr nz, .asm_4116
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	jr .asm_4123
.asm_4116
	ld a, [wcd45]
	and $7F
	ld [wcd45], a
	ld a, $00
	ld [wcd46], a
.asm_4123
	ld a, [wcd45]
	ld de, CrystalCutscene_ColorCyclePointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd46]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4142
	xor a
	ld [wcd46], a
	ret
.asm_4142
	ld [wcd44], a
	ld a, [wcd46]
	inc a
	ld [wcd46], a
	ret
CrystalCutscene_ColorCyclePointers:
	dw CrystalCutscene_ColorCyclePointers_4153
	dw CrystalCutscene_ColorCyclePointers_4154
	dw CrystalCutscene_ColorCyclePointers_415b
CrystalCutscene_ColorCyclePointers_4153:
	db $ff
CrystalCutscene_ColorCyclePointers_4154:
	db $01, $01, $02, $02, $03, $03, $ff
CrystalCutscene_ColorCyclePointers_415b:
	db $04, $04, $05, $05, $06, $06, $07, $07, $08, $08, $09, $09, $0a, $0a, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff
Func_5f_417A:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4183
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4183
	xor a
	ld [wd1fb], a
	call .asm_4192
	ret
.asm_4192
	ld hl, CrystalCutscene_ObjectOAMPointers
	ld de, wcd42
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $C0
.asm_41b1
	ld a, [hli]
	cp $FF
	jr z, .asm_41c5
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_41b1
.asm_41c5
	ld a, e
	ld [wd1fb], a
	ret
CrystalCutscene_ObjectOAMPointers:
	dw CrystalCutscene_ObjectOAMPointers_41e0
	dw CrystalCutscene_ObjectOAMPointers_41f9
	dw CrystalCutscene_ObjectOAMPointers_4206
	dw CrystalCutscene_ObjectOAMPointers_4213
	dw CrystalCutscene_ObjectOAMPointers_4220
	dw CrystalCutscene_ObjectOAMPointers_422d
	dw CrystalCutscene_ObjectOAMPointers_423a
	dw CrystalCutscene_ObjectOAMPointers_4247
	dw CrystalCutscene_ObjectOAMPointers_4254
	dw CrystalCutscene_ObjectOAMPointers_4261
	dw CrystalCutscene_ObjectOAMPointers_426e
CrystalCutscene_ObjectOAMPointers_41e0:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $ff
CrystalCutscene_ObjectOAMPointers_41f9:
	db $00, $00, $00, $00, $00, $08, $02, $00, $00, $10, $04, $00, $ff
CrystalCutscene_ObjectOAMPointers_4206:
	db $00, $00, $06, $00, $00, $08, $08, $00, $00, $10, $0a, $00, $ff
CrystalCutscene_ObjectOAMPointers_4213:
	db $00, $00, $0c, $00, $00, $08, $0e, $00, $00, $10, $10, $00, $ff
CrystalCutscene_ObjectOAMPointers_4220:
	db $00, $00, $12, $00, $00, $08, $14, $00, $00, $10, $16, $00, $ff
CrystalCutscene_ObjectOAMPointers_422d:
	db $00, $00, $18, $00, $00, $08, $1a, $00, $00, $10, $1c, $00, $ff
CrystalCutscene_ObjectOAMPointers_423a:
	db $00, $00, $1e, $00, $00, $08, $20, $00, $00, $10, $22, $00, $ff
CrystalCutscene_ObjectOAMPointers_4247:
	db $00, $00, $24, $00, $00, $08, $26, $00, $00, $10, $28, $00, $ff
CrystalCutscene_ObjectOAMPointers_4254:
	db $00, $00, $2a, $00, $00, $08, $2c, $00, $00, $10, $2e, $00, $ff
CrystalCutscene_ObjectOAMPointers_4261:
	db $00, $00, $30, $00, $00, $08, $32, $00, $00, $10, $34, $00, $ff
CrystalCutscene_ObjectOAMPointers_426e:
	db $00, $00, $36, $00, $00, $08, $38, $00, $00, $10, $3a, $00, $ff
Func_5f_427B:
	call DelayFrame
	dec c
	jr nz, Func_5f_427B
	ret
Func_5f_4282:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_4288
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_4288
	ret
Func_5f_4290:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4299
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4299
	ret
CrystalCutscene_PaletteBG:
	RGB 31, 31, 31
	RGB 25, 20, 25
	RGB 14, 8, 14
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 0, 31
	RGB 19, 0, 18
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 16, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 31, 0
	RGB 22, 22, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 13, 28, 23
	RGB 0, 16, 12
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 24, 31
	RGB 0, 14, 31
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
CrystalCutscene_Pad_42E1:
	dr $17c2e1, $17c2e9
CrystalCutscene_PaletteOBJ:
	RGB 31, 31, 31
	RGB 0, 24, 31
	RGB 0, 14, 31
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
	RGB 0, 0, 0
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
CrystalCutscene_Pad_4329:
	dr $17c329, $17c331
CrystalCutscene_Attrmap:
INCBIN "gfx/attrmaps/crystalcutscene_attrmap.bin"
CrystalCutscene_Tilemap:
INCBIN "gfx/tilemaps/crystalcutscene_tilemap.tilemap"
CrystalCutscene_GFX:
INCBIN "gfx/misc/crystalcutscene_gfx.2bpp"
CrystalCutscene_SpriteGFX:
INCBIN "gfx/misc/crystalcutscene_spritegfx.bin"


