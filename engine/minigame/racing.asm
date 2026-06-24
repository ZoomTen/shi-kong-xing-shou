RacingMinigame::
	ld a, BGM_RACING
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
	ld [wdce8], a
	ld [wdcf6], a
	ld [wdcfc], a
	ld [wdcf5], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld [wcd40], a
	ld [wcd41], a
	ld [wcd7c], a
	ld [wcd85], a
	call Func_05e_4011
	ld a, $08
	ld [wcd6d], a
	ld a, $01
	ld [wcd72], a
	ld [wcd71], a
	ld hl, $9800
	ld de, RacingMinigame_Tilemap0
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, RacingMinigame_Attrmap0
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, RacingMinigame_Pal1
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, RacingMinigame_Pal2
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld hl, RacingMinigame_GFX1
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld hl, RacingMinigame_GFX2
	ld de, $8900
	ld bc, $00B0
	call CopyBytesVRAM
	ld hl, RacingMinigame_GFX3
	ld de, $8000
	ld bc, $0880
	call CopyBytesVRAM
	call Func_05e_4000
	ld a, $A0
	ldh [rWY], a
	ld [wWY], a
	ld a, $E7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_40e0
	call DelayFrame
	ldh a, [hJoypadDown]
	and $08
	jr nz, .asm_40ee
	call Func_05e_5408
	jr .asm_40e0
.asm_40ee
	ld bc, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	call FadeInScene
	ld hl, $9800
	ld de, RacingMinigame_Tilemap1
	ld bc, $1420
	ld a, $20
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, RacingMinigame_Attrmap1
	ld bc, $1420
	ld a, $20
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, $9C00
	ld de, RacingMinigame_TilemapRowA
	ld bc, $0612
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $06
	ldh [hVRAMCopyWidth], a
	call CopyBGMapTiles
	ld hl, $9C00
	ld de, RacingMinigame_TilemapRowB
	ld bc, $0612
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $06
	ldh [hVRAMCopyWidth], a
	call CopyBGMapAttrs
	ld hl, RacingMinigame_Pal3
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, RacingMinigame_GFX4
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld a, $2E
	ld [wTextFaceID], a
	call LoadTextFaceGFX
	ld a, $20
	ld [wcd56], a
	ld a, $68
	ld [wcd55], a
	ld a, $01
	ld [wcd57], a
	ld a, $81
	ld [wcd58], a
	ld a, $48
	ld [wcd5a], a
	ld a, $68
	ld [wcd59], a
	ld a, $03
	ld [wcd5b], a
	ld a, $83
	ld [wcd5c], a
	ld a, $88
	ld [wcd5e], a
	ld a, $30
	ld [wcd5d], a
	ld a, $05
	ld [wcd5f], a
	ld a, $85
	ld [wcd60], a
	ld a, $90
	ld [wcd62], a
	ld a, $30
	ld [wcd61], a
	ld a, $06
	ld [wcd63], a
	ld a, $86
	ld [wcd64], a
	ld a, $30
	ld [wcd9a], a
	ld a, $30
	ld [wcd99], a
	ld a, $0D
	ld [wcd9b], a
	ld a, $8D
	ld [wcd9c], a
	call Func_05e_4f4b
	ld a, $60
	ldh [hSCY], a
	ld [wcd92], a
	ld a, $E7
	ldh [rLCDC], a
	ld a, $77
	ldh [rWX], a
	ld [wWX], a
	xor a
	ldh [rWY], a
	ld [wWY], a
	call Func_05e_777c
	call Func_05e_77b8
	xor a
	ldh [hFade], a
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_41fa
	call DelayFrame
	call Func_05e_4f4b
	call Func_05e_4f05
	call Func_05e_4eac
	call Func_05e_4cf2
	call Func_05e_4d34
	call Func_05e_4d7a
	call Func_05e_4dc0
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_421e
	jr .asm_41fa
.asm_421e
	xor a
	ldh [hFade], a
	ld [wcd9b], a
	ld [wcd9c], a
.asm_4227
	call DelayFrame
	call Func_05e_4f4b
	call Func_05e_4bfa
	call Func_05e_49ce
	ld a, [wcd7c]
	and a
	jr nz, .asm_4242
	ld a, [wcd85]
	and a
	jr nz, .asm_4242
	call Func_05e_52b3
.asm_4242
	call Func_05e_4a00
	ld a, [wcd7e]
	and a
	jr nz, .asm_4254
	ld a, [wcd87]
	and a
	jr nz, .asm_4254
	call Func_05e_45cd
.asm_4254
	call Func_05e_448d
	call Func_05e_43c7
	call Func_05e_44e6
	call Func_05e_4c19
	call Func_05e_77f4
	call Func_05e_4b09
	call Func_05e_439f
	call Func_05e_4ae3
	call Func_05e_4b9d
	call Func_05e_783c
	call Func_05e_7827
	call Func_05e_4747
	ld a, [wcd6d]
	and a
	jp z, .asm_42fb
	call Func_05e_4f05
	call Func_05e_4eac
	call Func_05e_4cf2
	call Func_05e_4d34
	call Func_05e_4d7a
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_429a
	jr .asm_4227
.asm_429a
	cp $02
	jr z, .asm_42fb
	xor a
	ldh [hFade], a
.asm_42a1
	call DelayFrame
	call Func_05e_4f4b
	call Func_05e_4b8d
	call Func_05e_4f05
	call Func_05e_4eac
	call Func_05e_4cf2
	call Func_05e_4d34
	call Func_05e_4d7a
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFade]
	and a
	jr nz, .asm_42c5
	jr .asm_42a1
.asm_42c5
	ld a, $2A
	ld [wTextFaceID], a
	call LoadTextFaceGFX
	xor a
	ld [wcd57], a
	ld [wcd58], a
	ld [wcd5b], a
	ld [wcd5c], a
	ld a, $28
	ld [wcd9a], a
	ld a, $30
	ld [wcd99], a
	ld a, $0B
	ld [wcd9b], a
	ld a, $8B
	ld [wcd9c], a
	xor a
	ldh [hFade], a
	ld a, [wEventFlags + 4]
	set 1, a
	ld [wEventFlags + 4], a
	jr .asm_432f
.asm_42fb
	ld a, $2B
	ld [wTextFaceID], a
	call LoadTextFaceGFX
	xor a
	ld [wcd57], a
	ld [wcd58], a
	ld [wcd5b], a
	ld [wcd5c], a
	ld a, $28
	ld [wcd9a], a
	ld a, $30
	ld [wcd99], a
	ld a, $0C
	ld [wcd9b], a
	ld a, $8C
	ld [wcd9c], a
	xor a
	ldh [hFade], a
	ld a, [wEventFlags + 4]
	res 1, a
	ld [wEventFlags + 4], a
.asm_432f
	call DelayFrame
	call Func_05e_4f4b
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	cp $FF
	jr z, .asm_4340
	jr .asm_432f
.asm_4340
	call .asm_434c
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	jp JumpToGameMode
.asm_434c
	ld hl, RacingMinigame_Pal0
	call CopyBackgroundPalettes
	ld hl, RacingMinigame_Pal0
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ret
RacingMinigame_Pal0:
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
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
Func_05e_439f:
	ld a, [wcd97]
	and $F4
	cp $F0
	jr c, .asm_43b3
	xor a
	ld [wcd97], a
	ld a, [wcd98]
	inc a
	ld [wcd98], a
.asm_43b3
	ld a, [wcd95]
	and $F4
	cp $F0
	ret c
	xor a
	ld [wcd95], a
	ld a, [wcd96]
	inc a
	ld [wcd96], a
	ret
Func_05e_43c7:
	ld a, [wcd72]
	and a
	ret z
	ld a, [wcd70]
	cp $1E
	jp z, Func_05e_43e5
	cp $50
	jp z, Func_05e_43e5
	cp $A0
	jr z, Func_05e_43e5
	jr c, Func_05e_43e5
	ld a, $A0
	ld [wcd70], a
	ret
Func_05e_43e5:
	ld a, [wcd70]
	ld b, a
	ld a, [wcd71]
	add b
	ld [wcd70], a
	ret
Func_05e_43f1:
	ld a, [wcd95]
	ld c, a
	ld a, [wcd96]
	ld b, a
	ld a, [wcd97]
	ld e, a
	ld a, [wcd98]
	ld d, a
	cp b
	jr c, .asm_442e
	jr nz, .asm_4461
	ld a, e
	cp c
	jr c, .asm_440e
	jr nz, .asm_4419
	jr .asm_4423
.asm_440e
	ld a, c
	sub e
	cp $60
	jr nc, .asm_442e
	cp $30
	jr nc, .asm_444f
	ret
.asm_4419
	sub c
	cp $60
	jr nc, .asm_4461
	cp $30
	ret c
	jr .asm_4482
.asm_4423
	ld a, $03
	ld [wcd72], a
	ld a, $50
	ld [wcd70], a
	ret
.asm_442e
	ld a, [wcd6c]
	add $30
	jr nc, .asm_443e
	push af
	ld a, [wcd53]
	dec a
	ld [wcd93], a
	pop af
.asm_443e
	ld [wcd73], a
	ld hl, hMathAccum + 1
	add hl, bc
	push hl
	pop de
	ld a, e
	ld [wcd97], a
	ld a, d
	ld [wcd98], a
.asm_444f
	ld a, $03
	ld [wcd72], a
	ld a, $50
	ld [wcd70], a
	xor a
	ld [wcd7e], a
	ld [wcd87], a
	ret
.asm_4461
	ld a, [wcd6c]
	sub $30
	jr nc, .asm_4471
	push af
	ld a, [wcd53]
	inc a
	ld [wcd93], a
	pop af
.asm_4471
	ld [wcd70], a
	ld hl, $0060
	add hl, bc
	push hl
	pop de
	ld a, e
	ld [wcd97], a
	ld a, d
	ld [wcd98], a
.asm_4482
	ld a, $02
	ld [wcd72], a
	ld a, $00
	ld [wcd70], a
	ret
Func_05e_448d:
	ld a, [wcd70]
	cp $1E
	jr z, .asm_44a5
	cp $50
	jr z, .asm_44a5
	cp $A0
	jr z, .asm_449d
	ret
.asm_449d
	call Func_05e_43f1
	ld a, [wcd72]
	jr .asm_44b2
.asm_44a5
	ld a, [wcd72]
	inc a
	cp $05
	jr c, .asm_44af
	ld a, $04
.asm_44af
	ld [wcd72], a
.asm_44b2
	cp $01
	jr z, .asm_44c8
	cp $02
	jr z, .asm_44d0
	cp $03
	jr z, .asm_44d8
	cp $04
	jr z, .asm_44e0
	ld a, [wcd70]
	jp Func_05e_43e5
.asm_44c8
	ld a, $01
	ld [wcd71], a
	jp Func_05e_43e5
.asm_44d0
	ld a, $02
	ld [wcd71], a
	jp Func_05e_43e5
.asm_44d8
	ld a, $04
	ld [wcd71], a
	jp Func_05e_43e5
.asm_44e0
	ld a, $08
	ld [wcd71], a
	ret
Func_05e_44e6:
	ld a, [wcd98]
	ld b, a
	ld a, [wcd96]
	ld h, a
	cp b
	jp z, .asm_4525
	jp c, .asm_458f
	ld a, [wcd97]
	and a
	jr z, .asm_44fe
	cpl
	inc a
	ld c, a
.asm_44fe
	ld a, [wcd95]
	ld h, a
	ld a, b
	and a
	jr z, .asm_4508
	cpl
	ld b, a
.asm_4508
	add hl, bc
	ld a, h
	and a
	jp nz, .asm_45c5
	ld a, l
	cp $80
	jp nc, .asm_45c5
	ld a, $68
	add l
	ld [wcd59], a
	ld a, $03
	ld [wcd5b], a
	ld a, $83
	ld [wcd5c], a
	ret
.asm_4525
	ld a, [wcd97]
	ld c, a
	ld a, [wcd95]
	ld l, a
	cp c
	jr nc, .asm_4561
	ld a, l
	and a
	jr z, .asm_453a
	cpl
	inc a
	ld l, a
	ld a, h
	jr .asm_453e
.asm_453a
	ld a, h
	and a
	jr z, .asm_4540
.asm_453e
	cpl
	ld h, a
.asm_4540
	add hl, bc
	ld a, h
	and a
	jp nz, .asm_45c5
	ld a, l
	cp $80
	jp nc, .asm_45c5
	ld a, l
	cpl
	inc a
	ld l, a
	ld a, $68
	add l
	ld [wcd59], a
	ld a, $03
	ld [wcd5b], a
	ld a, $83
	ld [wcd5c], a
	ret
.asm_4561
	ld a, c
	and a
	jr z, .asm_456c
	ld a, c
	cpl
	inc a
	ld c, a
	ld a, b
	jr .asm_4570
.asm_456c
	ld a, b
	and a
	jr z, .asm_4572
.asm_4570
	cpl
	ld b, a
.asm_4572
	add hl, bc
	ld a, h
	and a
	jp nz, .asm_45c5
	ld a, l
	cp $80
	jp nc, .asm_45c5
	ld a, $68
	add l
	ld [wcd59], a
	ld a, $03
	ld [wcd5b], a
	ld a, $83
	ld [wcd5c], a
	ret
.asm_458f
	ld a, [wcd97]
	ld c, a
	ld a, [wcd95]
	and a
	jr z, .asm_459f
	cpl
	inc a
	ld l, a
	ld a, h
	jr .asm_45a3
.asm_459f
	ld a, h
	and a
	jr z, .asm_45a5
.asm_45a3
	cpl
	ld h, a
.asm_45a5
	add hl, bc
	ld a, h
	and a
	jp nz, .asm_45c5
	ld a, l
	cp $80
	jp nc, .asm_45c5
	cpl
	inc a
	ld l, a
	ld a, $68
	add l
	ld [wcd59], a
	ld a, $03
	ld [wcd5b], a
	ld a, $83
	ld [wcd5c], a
	ret
.asm_45c5
	xor a
	ld [wcd5b], a
	ld [wcd5c], a
	ret
Func_05e_45cd:
	ld a, [wcd72]
	and a
	ret z
	ld a, [wcd93]
	srl a
	srl a
	cp $01
	call z, .asm_470f
	cp $02
	call z, .asm_471a
	cp $03
	call z, .asm_4725
	cp $04
	call z, .asm_4730
	ld a, [wcd72]
	cp $01
	jp z, .asm_46c9
	cp $02
	jp z, .asm_469c
	cp $03
	jp z, .asm_465c
	cp $04
	jp z, .asm_4605
	ret
.asm_4605
	ld a, [wcd93]
	cp $14
	jp z, .asm_46ff
	ld a, [wcd92]
	bit 0, a
	jr z, .asm_4624
	sub $01
	ld [wcd92], a
	ld a, [wcd97]
	add $01
	ld [wcd97], a
	jp .asm_46e1
.asm_4624
	bit 1, a
	jr z, .asm_4638
	sub $02
	ld [wcd92], a
	ld a, [wcd97]
	add $02
	ld [wcd97], a
	jp .asm_46e1
.asm_4638
	bit 2, a
	jr z, .asm_464c
	sub $04
	ld [wcd92], a
	ld a, [wcd97]
	add $04
	ld [wcd97], a
	jp .asm_46e1
.asm_464c
	sub $08
	ld [wcd92], a
	ld a, [wcd97]
	add $08
	ld [wcd97], a
	jp .asm_46e1
.asm_465c
	ld a, [wcd93]
	cp $14
	jp z, .asm_46ff
	ld a, [wcd92]
	bit 0, a
	jr z, .asm_467a
	sub $01
	ld [wcd92], a
	ld a, [wcd97]
	add $01
	ld [wcd97], a
	jr .asm_46e1
.asm_467a
	bit 1, a
	jr z, .asm_468d
	sub $02
	ld [wcd92], a
	ld a, [wcd97]
	add $02
	ld [wcd97], a
	jr .asm_46e1
.asm_468d
	sub $04
	ld [wcd92], a
	ld a, [wcd97]
	add $04
	ld [wcd97], a
	jr .asm_46e1
.asm_469c
	ld a, [wcd93]
	cp $14
	jp z, .asm_46ff
	ld a, [wcd92]
	bit 0, a
	jr z, .asm_46ba
	sub $01
	ld [wcd92], a
	ld a, [wcd97]
	add $01
	ld [wcd97], a
	jr .asm_46e1
.asm_46ba
	sub $02
	ld [wcd92], a
	ld a, [wcd97]
	add $02
	ld [wcd97], a
	jr .asm_46e1
.asm_46c9
	ld a, [wcd93]
	cp $14
	jp z, .asm_46ff
	ld a, [wcd92]
	sub $01
	ld [wcd92], a
	ld a, [wcd97]
	add $01
	ld [wcd97], a
.asm_46e1
	ld a, [wcd92]
	and $FC
	and a
	ret nz
	ld a, [wcd92]
	ld b, a
	ld a, [wcd97]
	add b
	ld [wcd97], a
	xor a
	ld [wcd92], a
	ld a, [wcd93]
	inc a
	ld [wcd93], a
	ret
.asm_46ff
	ld a, [wcd92]
	and $F0
	and a
	ret nz
	ld [wcd92], a
	ld a, $02
	ld [hFade], a
	ret
.asm_470f
	ld a, [wcd92]
	and a
	ret nz
	ld a, $28
	ld [wcd61], a
	ret
.asm_471a
	ld a, [wcd92]
	and a
	ret nz
	ld a, $20
	ld [wcd61], a
	ret
.asm_4725
	ld a, [wcd92]
	and a
	ret nz
	ld a, $18
	ld [wcd61], a
	ret
.asm_4730
	ld a, [wcd92]
	and a
	ret nz
	ld a, $10
	ld [wcd61], a
	ret
.asm_473b
	ld a, [wcd50]
	inc a
	ld [wcd50], a
	cp $FF
	jr nz, .asm_473b
	ret
Func_05e_4747:
	call .asm_474e
	call .asm_476d
	ret
.asm_474e
	ld a, [wcd77]
	cp $07
	ret z
	ld a, [wcd91]
	ld c, a
	ld a, [wcd7c]
	cp c
	ret z
	and a
	ret z
	ld a, $08
	ld [wcd91], a
	ld a, [wcd6d]
	and a
	jr z, .asm_478a
	dec a
	jr .asm_478a
.asm_476d
	ld a, [wcd80]
	cp $07
	ret z
	ld a, [wcd91]
	ld c, a
	ld a, [wcd85]
	cp c
	ret z
	and a
	ret z
	ld a, $08
	ld [wcd91], a
	ld a, [wcd6d]
	and a
	jr z, .asm_478a
	dec a
.asm_478a
	ld [wcd6d], a
	sla a
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_TilePtrs0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9CE1
	ld bc, $0204
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $02
	ldh [hVRAMCopyWidth], a
	call CopyBGMapTiles
	ret
RacingMinigame_TilePtrs0:
	dw RacingMinigame_TilePtrs0_47bf
	dw RacingMinigame_TilePtrs0_47c7
	dw RacingMinigame_TilePtrs0_47cf
	dw RacingMinigame_TilePtrs0_47d7
	dw RacingMinigame_TilePtrs0_47df
	dw RacingMinigame_TilePtrs0_47e7
	dw RacingMinigame_TilePtrs0_47ef
	dw RacingMinigame_TilePtrs0_47f7
	dw RacingMinigame_TilePtrs0_47ff
RacingMinigame_TilePtrs0_47bf:
	db $78, $79, $78, $79, $78, $79, $78, $79
RacingMinigame_TilePtrs0_47c7:
	db $78, $79, $78, $79, $78, $79, $76, $77
RacingMinigame_TilePtrs0_47cf:
	db $78, $79, $78, $79, $78, $79, $57, $58
RacingMinigame_TilePtrs0_47d7:
	db $78, $79, $78, $79, $76, $77, $57, $58
RacingMinigame_TilePtrs0_47df:
	db $78, $79, $78, $79, $57, $58, $57, $58
RacingMinigame_TilePtrs0_47e7:
	db $78, $79, $76, $77, $57, $58, $57, $58
RacingMinigame_TilePtrs0_47ef:
	db $78, $79, $57, $58, $57, $58, $57, $58
RacingMinigame_TilePtrs0_47f7:
	db $76, $77, $57, $58, $57, $58, $57, $58
RacingMinigame_TilePtrs0_47ff:
	db $57, $58, $57, $58, $57, $58, $57, $58
Func_05e_4807:
	ld a, [wcd7d]
	and a
	jr z, Func_5e_4818
	ld bc, wcd77
	ld a, [bc]
	cp $07
	jr z, Func_5e_4818
	call Func_5e_4849
Func_5e_4818:
	ld a, [wcd86]
	and a
	ret z
	ld bc, wcd80
	ld a, [bc]
	cp $07
	ret z
	call Func_5e_4849
	ret
Func_05e_4828:
	ld a, [wcd7e]
	and a
	jr z, Func_5e_4818
	ld bc, wcd77
	ld a, [bc]
	cp $07
	jr z, Func_5e_4818
	call Func_5e_4849
	ld a, [wcd87]
	and a
	ret z
	ld bc, wcd80
	ld a, [bc]
	cp $07
	ret z
	call Func_5e_4849
	ret
Func_5e_4849:
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	cp $38
	jr nc, .asm_488f
	ld a, [wcd90]
	ld e, a
	ld d, $00
	ld hl, RacingMinigame_CoordTableB
	add hl, de
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_4881
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	and $F0
	cp $00
	jr z, .asm_4889
	cp $70
	jr z, .asm_4889
	ld a, [wcd90]
	inc a
	ld [wcd90], a
	ret
.asm_4881
	xor a
	ld [wcd7d], a
	ld [wcd90], a
	ret
.asm_4889
	ld a, $B0
	ld [wcd79], a
	ret
.asm_488f
	ld a, [wcd90]
	ld e, a
	ld d, $00
	ld hl, RacingMinigame_CoordTableA
	add hl, de
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .asm_48be
	ld d, a
	ld a, [hli]
	ld e, a
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	add d
	ld [hli], a
	ld a, [hl]
	add e
	ld [hli], a
	and $F0
	cp $00
	jr z, .asm_48c6
	cp $70
	jr z, .asm_48c6
	ld a, [wcd90]
	inc a
	ld [wcd90], a
	ret
.asm_48be
	xor a
	ld [wcd86], a
	ld [wcd90], a
	ret
.asm_48c6
	ld a, $B0
	ld [wcd82], a
	ret
RacingMinigame_CoordTableA:
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $ff, $00, $ff, $00
	db $ff, $00, $ff, $01, $ff, $00, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $ff, $00
	db $ff, $00, $ff, $01, $ff, $00, $ff, $00, $ff, $01, $ff, $00, $ff, $00, $ff, $01
	db $ff, $00, $fe, $01, $fe, $02, $ff, $02, $00, $02, $02, $02, $02, $02, $02, $01
	db $02, $00, $02, $01, $02, $01, $02, $00, $02, $01, $03, $00, $03, $01, $03, $00
	db $03, $00, $ff, $02, $fd, $00, $fd, $01, $fd, $01, $fd, $01, $fd, $02, $fd, $03
	db $ff, $03, $01, $03, $04, $03, $04, $02, $04, $02, $04, $01, $04, $00, $fe, $02
	db $fc, $01, $fc, $02, $fd, $04, $04, $06, $06, $02, $00, $04, $fd, $05, $04, $06
	db $88
RacingMinigame_CoordTableB:
	db $ff, $00, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $00
	db $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $00
	db $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $ff, $ff, $00, $ff, $00, $ff, $ff
	db $ff, $00, $fe, $ff, $fe, $fe, $ff, $fe, $00, $fe, $02, $fe, $02, $fe, $02, $ff
	db $02, $00, $02, $ff, $02, $ff, $02, $00, $02, $ff, $03, $00, $03, $ff, $03, $00
	db $03, $00, $ff, $fe, $fd, $00, $fd, $ff, $fd, $ff, $fd, $ff, $fd, $fe, $fd, $fd
	db $ff, $fd, $01, $fd, $04, $fd, $04, $fe, $04, $fe, $04, $ff, $04, $00, $fe, $fe
	db $fc, $ff, $fc, $fe, $fd, $fc, $04, $fa, $06, $fe, $00, $fc, $fd, $fb, $04, $fa
	db $88
Func_05e_49ce:
	ld a, [wcd55]
	add $02
	ld [wcd88], a
	add $0C
	ld [wcd89], a
	ld a, [wcd56]
	add $02
	ld [wcd8a], a
	add $0C
	ld [wcd8b], a
	ld a, [wcd76]
	and a
	jr z, .asm_49f4
	ld bc, wcd78
	call Func_05e_4a32
.asm_49f4
	ld a, [wcd7f]
	and a
	ret z
	ld bc, wcd81
	call Func_05e_4a32
	ret
Func_05e_4a00:
	ld a, [wcd59]
	add $02
	ld [wcd88], a
	add $0C
	ld [wcd89], a
	ld a, [wcd5a]
	add $02
	ld [wcd8a], a
	add $0C
	ld [wcd8b], a
	ld a, [wcd76]
	and a
	jr z, .asm_4a26
	ld bc, wcd78
	call Func_05e_4a85
.asm_4a26
	ld a, [wcd7f]
	and a
	ret z
	ld bc, wcd81
	call Func_05e_4a85
	ret
Func_05e_4a32:
	ld hl, $0000
	add hl, bc
	ld a, [hli]
	add $02
	ld [wcd8c], a
	add $0C
	ld [wcd8d], a
	ld a, [hli]
	add $02
	ld [wcd8e], a
	add $0C
	ld [wcd8f], a
	call Func_05e_4ac0
	and a
	jr z, .asm_4a6e
	ld hl, $0004
	add hl, bc
	ld [hl], $08
	inc hl
	ld [hl], $08
	xor a
	ld [wcd69], a
	ld [wcd6a], a
	ld [wcd6b], a
	ld a, $2D
	ld [wTextFaceID], a
	call LoadTextFaceGFX
	ret
.asm_4a6e
	ld hl, $0004
	add hl, bc
	ld [hl], $00
	ld a, [wTextFaceID]
	and a
	ret z
	xor a
	ld [wTextFaceID], a
	call LoadTextFaceGFX
	xor a
	ld [wcd91], a
	ret
Func_05e_4a85:
	ld hl, $0000
	add hl, bc
	ld a, [hli]
	add $02
	ld [wcd8c], a
	add $0C
	ld [wcd8d], a
	ld a, [hli]
	add $02
	ld [wcd8e], a
	add $0C
	ld [wcd8f], a
	call Func_05e_4ac0
	and a
	jr z, .asm_4ab9
	ld hl, $0006
	add hl, bc
	ld [hl], $08
	ld a, $00
	ld [wcd70], a
	ld a, $02
	ld [wcd71], a
	ld [wcd72], a
	ret
.asm_4ab9
	ld hl, $0006
	add hl, bc
	ld [hl], $00
	ret
Func_05e_4ac0:
	ld hl, wcd8d
	ld de, wcd88
	ld a, [de]
	cp [hl]
	jr nc, .asm_4ae1
	inc de
	dec hl
	ld a, [de]
	cp [hl]
	jr c, .asm_4ae1
	inc de
	ld hl, wcd8f
	ld a, [de]
	cp [hl]
	jr nc, .asm_4ae1
	inc de
	dec hl
	ld a, [de]
	cp [hl]
	jr c, .asm_4ae1
	ld a, $01
	ret
.asm_4ae1
	xor a
	ret
Func_05e_4ae3:
	ld a, [wcd76]
	and a
	jr z, .asm_4af9
	ld a, [wcd78]
	and $F0
	cp $A0
	jr nz, .asm_4af9
	xor a
	ld [wcd76], a
	call Func_05e_777c
.asm_4af9
	ld a, [wcd81]
	and $F0
	cp $A0
	ret nz
	xor a
	ld [wcd7f], a
	call Func_05e_77b8
	ret
Func_05e_4b09:
	ld a, [wcd6b]
	and a
	ret z
	cp $01
	jr z, .asm_4b39
	cp $02
	jr z, .asm_4b55
	cp $03
	jr z, .asm_4b71
	cp $04
	ret nz
	ld a, [wcd76]
	and a
	jr z, .asm_4b2b
	ld a, [wcd78]
	add $08
	ld [wcd78], a
.asm_4b2b
	ld a, [wcd7f]
	and a
	ret z
	ld a, [wcd81]
	add $08
	ld [wcd81], a
	ret
.asm_4b39
	ld a, [wcd76]
	and a
	jr z, .asm_4b47
	ld a, [wcd78]
	add $01
	ld [wcd78], a
.asm_4b47
	ld a, [wcd7f]
	and a
	ret z
	ld a, [wcd81]
	add $01
	ld [wcd81], a
	ret
.asm_4b55
	ld a, [wcd76]
	and a
	jr z, .asm_4b63
	ld a, [wcd78]
	add $02
	ld [wcd78], a
.asm_4b63
	ld a, [wcd7f]
	and a
	ret z
	ld a, [wcd81]
	add $02
	ld [wcd81], a
	ret
.asm_4b71
	ld a, [wcd76]
	and a
	jr z, .asm_4b7f
	ld a, [wcd78]
	add $04
	ld [wcd78], a
.asm_4b7f
	ld a, [wcd7f]
	and a
	ret z
	ld a, [wcd81]
	add $04
	ld [wcd81], a
	ret
Func_05e_4b8d:
	ld a, [wcd55]
	sub $08
	ld [wcd55], a
	cp $E0
	ret nz
	ld a, $01
	ldh [hFade], a
	ret
Func_05e_4b9d:
	ld a, [wcd6b]
	sla a
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_TilePtrs1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9CE3
	ld bc, $0104
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ld a, $01
	ldh [hVRAMCopyWidth], a
	call CopyBGMapTiles
	ret
.asm_4bc0
	push bc
	ld a, [de]
	inc de
	ld c, a
.asm_4bc4
	ldh a, [rSTAT]
	and $03
	jr nz, .asm_4bc4
	ld a, c
	ld [hl], a
	ld bc, $0020
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4bc0
	ld a, [hVRAMCopyHeight]
	ld c, a
	dec b
	jr nz, .asm_4bc0
	ret
RacingMinigame_TilePtrs1:
	dw RacingMinigame_TilePtrs1_4be6
	dw RacingMinigame_TilePtrs1_4bea
	dw RacingMinigame_TilePtrs1_4bee
	dw RacingMinigame_TilePtrs1_4bf2
	dw RacingMinigame_TilePtrs1_4bf6
RacingMinigame_TilePtrs1_4be6:
	db $59, $59, $59, $59
RacingMinigame_TilePtrs1_4bea:
	db $59, $59, $59, $75
RacingMinigame_TilePtrs1_4bee:
	db $59, $59, $75, $75
RacingMinigame_TilePtrs1_4bf2:
	db $59, $75, $75, $75
RacingMinigame_TilePtrs1_4bf6:
	db $75, $75, $75, $75
Func_05e_4bfa:
	ld a, [wcd6b]
	and a
	ret z
	ld a, [wcd69]
	cp $1E
	jr c, Func_5e_4c10
	cp $50
	jr c, Func_5e_4c10
	cp $A0
	ret nc
	jr Func_5e_4c10
Func_05e_4c0f:
	ret
Func_5e_4c10:
	ld b, a
	ld a, [wcd6a]
	add b
	ld [wcd69], a
	ret
Func_05e_4c19:
	ldh a, [hJoypadDown]
	bit 5, a
	jr z, .asm_4c36
	call .asm_4cb6
	call Func_05e_4ac0
	and a
	jr nz, .asm_4c51
	ld a, [wcd56]
	sub $02
	cp $10
	jr z, .asm_4c51
	ld [wcd56], a
	jr .asm_4c51
.asm_4c36
	ldh a, [hJoypadDown]
	bit 4, a
	jr z, .asm_4c51
	call .asm_4cb6
	call Func_05e_4ac0
	and a
	jr nz, .asm_4c51
	ld a, [wcd56]
	add $02
	cp $58
	jr z, .asm_4c51
	ld [wcd56], a
.asm_4c51
	ldh a, [hJoypadDown]
	bit 1, a
	jr z, .asm_4c67
	ld a, [wcd6b]
	and a
	jr nz, .asm_4c62
	xor a
	ld [wcd69], a
	ret
.asm_4c62
	dec a
	ld [wcd6b], a
	ret
.asm_4c67
	ldh a, [hJoypadDown]
	bit 0, a
	ret z
	ld a, [wcd69]
	cp $00
	jr z, .asm_4c80
	cp $1E
	jr z, .asm_4c80
	cp $50
	jr z, .asm_4c80
	cp $A0
	jr z, .asm_4c80
	ret
.asm_4c80
	ld a, [wcd6b]
	inc a
	cp $05
	jr c, .asm_4c8a
	ld a, $04
.asm_4c8a
	ld [wcd6b], a
	cp $01
	jr z, .asm_4c9e
	cp $02
	jr z, .asm_4ca4
	cp $03
	jr z, .asm_4caa
	cp $04
	jr z, .asm_4cb0
	ret
.asm_4c9e
	ld a, $01
	ld [wcd6a], a
	ret
.asm_4ca4
	ld a, $02
	ld [wcd6a], a
	ret
.asm_4caa
	ld a, $04
	ld [wcd6a], a
	ret
.asm_4cb0
	ld a, $04
	ld [wcd6a], a
	ret
.asm_4cb6
	ld a, [wcd55]
	add $02
	ld [wcd88], a
	add $1C
	ld [wcd89], a
	ld a, [wcd56]
	add $02
	ld [wcd8a], a
	add $14
	ld [wcd8b], a
	ld bc, wcd59
	call .asm_4cd7
	ret
.asm_4cd7
	ld hl, $0000
	add hl, bc
	ld a, [hli]
	add $02
	ld [wcd8c], a
	add $0C
	ld [wcd8d], a
	ld a, [hli]
	add $02
	ld [wcd8e], a
	add $0C
	ld [wcd8f], a
	ret
Func_05e_4cf2:
	ld a, [wcd5c]
	and a
	ret z
	and $80
	jr nz, .asm_4d02
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4d0a
.asm_4d02
	ld a, [wcd5c]
	and $7F
	ld [wcd5c], a
.asm_4d0a
	ld a, [wcd5c]
	ld de, RacingMinigame_AnimPtrs
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd66]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4d29
	xor a
	ld [wcd66], a
	ret
.asm_4d29
	ld [wcd5b], a
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	ret
Func_05e_4d34:
	ld a, [wcd60]
	and a
	ret z
	and $80
	jr nz, .asm_4d44
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4d50
.asm_4d44
	ld a, [wcd60]
	and $7F
	ld [wcd60], a
	xor a
	ld [wcd67], a
.asm_4d50
	ld a, [wcd60]
	ld de, RacingMinigame_AnimPtrs
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd67]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4d6f
	xor a
	ld [wcd67], a
	ret
.asm_4d6f
	ld [wcd5f], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	ret
Func_05e_4d7a:
	ld a, [wcd64]
	and a
	ret z
	and $80
	jr nz, .asm_4d8a
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4d96
.asm_4d8a
	ld a, [wcd64]
	and $7F
	ld [wcd64], a
	xor a
	ld [wcd68], a
.asm_4d96
	ld a, [wcd64]
	ld de, RacingMinigame_AnimPtrs
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd68]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4db5
	xor a
	ld [wcd68], a
	ret
.asm_4db5
	ld [wcd63], a
	ld a, [wcd68]
	inc a
	ld [wcd68], a
	ret
Func_05e_4dc0:
	ld a, [wcd9c]
	and a
	ret z
	and $80
	jr nz, .asm_4dd0
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4ddc
.asm_4dd0
	ld a, [wcd9c]
	and $7F
	ld [wcd9c], a
	xor a
	ld [wcd9d], a
.asm_4ddc
	ld a, [wcd9c]
	ld de, RacingMinigame_AnimPtrs
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd9d]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4dff
	ld a, $01
	ldh [hFade], a
	xor a
	ld [wcd9d], a
	ret
.asm_4dff
	ld [wcd9b], a
	ld a, [wcd9d]
	inc a
	ld [wcd9d], a
	ret
RacingMinigame_AnimPtrs:
	dw RacingMinigame_AnimPtrs_4e2a
	dw RacingMinigame_AnimPtrs_4e2b
	dw RacingMinigame_AnimPtrs_4e2b
	dw RacingMinigame_AnimPtrs_4e2e
	dw RacingMinigame_AnimPtrs_4e2e
	dw RacingMinigame_AnimPtrs_4e31
	dw RacingMinigame_AnimPtrs_4e33
	dw RacingMinigame_AnimPtrs_4e2a
	dw RacingMinigame_AnimPtrs_4e2a
	dw RacingMinigame_AnimPtrs_4e2a
	dw RacingMinigame_AnimPtrs_4e2a
	dw RacingMinigame_AnimPtrs_4e35
	dw RacingMinigame_AnimPtrs_4e37
	dw RacingMinigame_AnimPtrs_4e39
	dw RacingMinigame_AnimPtrs_4e39
	dw RacingMinigame_AnimPtrs_4e39
RacingMinigame_AnimPtrs_4e2a:
	db $ff
RacingMinigame_AnimPtrs_4e2b:
	db $01, $02, $ff
RacingMinigame_AnimPtrs_4e2e:
	db $03, $04, $ff
RacingMinigame_AnimPtrs_4e31:
	db $05, $ff
RacingMinigame_AnimPtrs_4e33:
	db $06, $ff
RacingMinigame_AnimPtrs_4e35:
	db $0b, $ff
RacingMinigame_AnimPtrs_4e37:
	db $0c, $ff
RacingMinigame_AnimPtrs_4e39:
	db $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
	db $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e
	db $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e
	db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10
	db $10, $10, $10, $10, $10, $10, $10, $10, $11, $11, $11, $11, $11, $11, $11, $11
	db $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11
	db $11, $11, $11, $11, $11, $11, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $ff
Func_05e_4eac:
	ld a, [wcd58]
	and a
	ret z
	and $80
	jr nz, .asm_4ebc
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	jr .asm_4ec8
.asm_4ebc
	ld a, [wcd58]
	and $7F
	ld [wcd58], a
	xor a
	ld [wcd65], a
.asm_4ec8
	ld a, [wcd58]
	ld de, RacingMinigame_AnimPtrs
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd65]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4eeb
	cp $FF
	jr nz, .asm_4efa
	xor a
	ld [wcd65], a
	ret
.asm_4eeb
	xor a
	ld [wcd65], a
	ld [wcd57], a
	ld [wcd58], a
	ld a, $01
	ldh [hFade], a
	ret
.asm_4efa
	ld [wcd57], a
	ld a, [wcd65]
	inc a
	ld [wcd65], a
	ret
Func_05e_4f05:
	ld a, [wcd45]
	and a
	ret z
	and $80
	jr nz, .asm_4f15
	ldh a, [hFadeFrameCounter]
	and $01
	ret nz
	jr .asm_4f21
.asm_4f15
	ld a, [wcd45]
	and $7F
	ld [wcd45], a
	xor a
	ld [wcd46], a
.asm_4f21
	ld a, [wcd45]
	ld de, RacingMinigame_AnimPtrs
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
	jr nz, .asm_4f40
	xor a
	ld [wcd46], a
	ret
.asm_4f40
	ld [wcd44], a
	ld a, [wcd46]
	inc a
	ld [wcd46], a
	ret
Func_05e_4f4b:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_4f54
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4f54
	xor a
	ld [wVirtualOAMPtr], a
	call Func_5e_50b7
	call Func_5e_507f
	call Func_5e_5047
	call Func_5e_500f
	call .asm_4f72
	call .asm_4faa
	ret
.asm_4f72
	ld hl, RacingMinigame_SpritePtrs
	ld de, wcd99
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
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_4f91
	ld a, [hli]
	cp $FF
	jr z, .asm_4fa5
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
	jr .asm_4f91
.asm_4fa5
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
.asm_4faa
	ld hl, wcd76
	ld a, [hli]
	cp $01
	jr nz, .asm_4fdd
	ld a, [hli]
	push hl
	sla a
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_SpritePtrs
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld hl, wVirtualOAMSprite16YCoord
.asm_4fc9
	ld a, [de]
	cp $FF
	jr z, .asm_4fdd
	add c
	ld [hli], a
	inc de
	ld a, [de]
	add b
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	jr .asm_4fc9
.asm_4fdd
	ld hl, wcd7f
	ld a, [hli]
	cp $01
	ret nz
	ld a, [hli]
	push hl
	sla a
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_SpritePtrs
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld hl, wVirtualOAMSprite18YCoord
.asm_4ffb
	ld a, [de]
	cp $FF
	ret z
	add c
	ld [hli], a
	inc de
	ld a, [de]
	add b
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	jr .asm_4ffb
Func_05e_500e:
	ret
Func_5e_500f:
	ld hl, RacingMinigame_SpritePtrs
	ld de, wcd61
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
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_502e
	ld a, [hli]
	cp $FF
	jr z, .asm_5042
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
	jr .asm_502e
.asm_5042
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
Func_5e_5047:
	ld hl, RacingMinigame_SpritePtrs
	ld de, wcd5d
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
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_5066
	ld a, [hli]
	cp $FF
	jr z, .asm_507a
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
	jr .asm_5066
.asm_507a
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
Func_5e_507f:
	ld hl, RacingMinigame_SpritePtrs
	ld de, wcd59
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
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_509e
	ld a, [hli]
	cp $FF
	jr z, .asm_50b2
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
	jr .asm_509e
.asm_50b2
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
Func_5e_50b7:
	ld a, [wcd57]
	and a
	ret z
	ld hl, RacingMinigame_SpritePtrs
	ld de, wcd55
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
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_50db
	ld a, [hli]
	cp $FF
	jr z, .asm_50ef
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
	jr .asm_50db
.asm_50ef
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
Func_05e_50f4:
	ld hl, RacingMinigame_SpritePtrs
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
	sla a
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $C0
.asm_5114
	ld a, [hli]
	cp $FF
	jr z, .asm_5128
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
	jr .asm_5114
.asm_5128
	ld a, e
	ld [wVirtualOAMPtr], a
	ret
RacingMinigame_SpritePtrs:
	dw RacingMinigame_SpritePtrs_5151
	dw RacingMinigame_SpritePtrs_5172
	dw RacingMinigame_SpritePtrs_518b
	dw RacingMinigame_SpritePtrs_51a4
	dw RacingMinigame_SpritePtrs_51bd
	dw RacingMinigame_SpritePtrs_51d6
	dw RacingMinigame_SpritePtrs_51db
	dw RacingMinigame_SpritePtrs_51e0
	dw RacingMinigame_SpritePtrs_51e9
	dw RacingMinigame_SpritePtrs_51f2
	dw RacingMinigame_SpritePtrs_51fb
	dw RacingMinigame_SpritePtrs_5204
	dw RacingMinigame_SpritePtrs_5235
	dw RacingMinigame_SpritePtrs_526e
	dw RacingMinigame_SpritePtrs_527b
	dw RacingMinigame_SpritePtrs_5288
	dw RacingMinigame_SpritePtrs_5299
	dw RacingMinigame_SpritePtrs_52a6
RacingMinigame_SpritePtrs_5151:
	db $00, $00, $00, $00, $00, $08, $00, $00, $00, $10, $00, $00, $00, $18, $00, $00
	db $10, $00, $00, $00, $10, $08, $00, $00, $10, $10, $00, $00, $10, $18, $00, $00
	db $ff
RacingMinigame_SpritePtrs_5172:
	db $00, $00, $00, $01, $00, $08, $02, $01, $00, $10, $04, $01, $10, $00, $06, $01
	db $10, $08, $08, $01, $10, $10, $0a, $01, $ff
RacingMinigame_SpritePtrs_518b:
	db $00, $00, $0c, $01, $00, $08, $0e, $01, $00, $10, $10, $01, $10, $00, $12, $01
	db $10, $08, $14, $01, $10, $10, $16, $01, $ff
RacingMinigame_SpritePtrs_51a4:
	db $00, $00, $18, $02, $00, $08, $1a, $02, $00, $10, $1c, $02, $10, $00, $1e, $02
	db $10, $08, $20, $02, $10, $10, $22, $02, $ff
RacingMinigame_SpritePtrs_51bd:
	db $00, $00, $24, $02, $00, $08, $26, $02, $00, $10, $28, $02, $10, $00, $2a, $02
	db $10, $08, $2c, $02, $10, $10, $2e, $02, $ff
RacingMinigame_SpritePtrs_51d6:
	db $00, $00, $30, $01, $ff
RacingMinigame_SpritePtrs_51db:
	db $00, $00, $32, $02, $ff
RacingMinigame_SpritePtrs_51e0:
	db $00, $00, $34, $00, $00, $08, $36, $00, $ff
RacingMinigame_SpritePtrs_51e9:
	db $00, $00, $38, $00, $00, $08, $3a, $00, $ff
RacingMinigame_SpritePtrs_51f2:
	db $00, $00, $3c, $00, $00, $08, $3e, $00, $ff
RacingMinigame_SpritePtrs_51fb:
	db $00, $00, $40, $00, $00, $08, $42, $00, $ff
RacingMinigame_SpritePtrs_5204:
	db $00, $00, $44, $03, $00, $08, $46, $03, $00, $10, $48, $03, $00, $18, $4a, $03
	db $00, $20, $4c, $03, $00, $28, $4e, $03, $10, $00, $50, $03, $10, $08, $52, $03
	db $10, $10, $54, $03, $10, $18, $56, $03, $10, $20, $58, $03, $10, $28, $5a, $03
	db $ff
RacingMinigame_SpritePtrs_5235:
	db $00, $00, $5c, $04, $00, $08, $5e, $04, $00, $10, $60, $04, $00, $18, $62, $04
	db $00, $20, $64, $04, $00, $28, $66, $04, $00, $30, $68, $04, $10, $00, $6a, $04
	db $10, $08, $6c, $04, $10, $10, $6e, $04, $10, $18, $70, $04, $10, $20, $72, $04
	db $10, $28, $74, $04, $10, $30, $76, $04, $ff
RacingMinigame_SpritePtrs_526e:
	db $00, $04, $78, $04, $00, $0c, $7a, $04, $00, $14, $7c, $04, $ff
RacingMinigame_SpritePtrs_527b:
	db $00, $04, $7e, $03, $00, $0c, $7a, $04, $00, $14, $7c, $04, $ff
RacingMinigame_SpritePtrs_5288:
	db $04, $00, $80, $03, $04, $08, $82, $03, $04, $10, $84, $03, $04, $18, $86, $03
	db $ff
RacingMinigame_SpritePtrs_5299:
	db $00, $04, $7e, $03, $00, $0c, $7e, $03, $00, $14, $7c, $04, $ff
RacingMinigame_SpritePtrs_52a6:
	db $00, $04, $7e, $03, $00, $0c, $7e, $03, $00, $14, $7e, $03, $ff
Func_05e_52b3:
	ld a, [wcd6b]
	and a
	ret z
	ld a, [wcd53]
	cp $04
	call z, .asm_53d0
	ld a, [wcd53]
	cp $08
	call z, .asm_53d0
	ld a, [wcd53]
	cp $0C
	call z, .asm_53d0
	ld a, [wcd53]
	cp $10
	call z, .asm_53d0
	ld a, [wcd6b]
	cp $01
	jp z, .asm_536e
	cp $02
	jp z, .asm_5344
	cp $03
	jp z, .asm_5308
	cp $04
	jp z, .asm_52f0
	ret
.asm_52f0
	ld a, [wcd53]
	cp $14
	jp z, .asm_53c0
	ldh a, [hSCY]
	sub $04
	ldh [hSCY], a
	ld a, [wcd95]
	add $04
	ld [wcd95], a
	jr .asm_5384
.asm_5308
	ld a, [wcd53]
	cp $14
	jp z, .asm_53c0
	ldh a, [hSCY]
	bit 0, a
	jr z, .asm_5324
	sub $01
	ldh [hSCY], a
	ld a, [wcd95]
	add $01
	ld [wcd95], a
	jr .asm_5384
.asm_5324
	bit 1, a
	jr z, .asm_5336
	sub $02
	ldh [hSCY], a
	ld a, [wcd95]
	add $02
	ld [wcd95], a
	jr .asm_5384
.asm_5336
	sub $04
	ldh [hSCY], a
	ld a, [wcd95]
	add $04
	ld [wcd95], a
	jr .asm_5384
.asm_5344
	ld a, [wcd53]
	cp $14
	jp z, .asm_53c0
	ldh a, [hSCY]
	bit 0, a
	jr z, .asm_5360
	sub $01
	ldh [hSCY], a
	ld a, [wcd95]
	add $01
	ld [wcd95], a
	jr .asm_5384
.asm_5360
	sub $02
	ldh [hSCY], a
	ld a, [wcd95]
	add $02
	ld [wcd95], a
	jr .asm_5384
.asm_536e
	ld a, [wcd53]
	cp $14
	jp z, .asm_53c0
	ldh a, [hSCY]
	sub $01
	ldh [hSCY], a
	ld a, [wcd95]
	add $01
	ld [wcd95], a
.asm_5384
	ld a, [wcd52]
	inc a
	cp $18
	jr z, .asm_53b4
	ld [wcd52], a
	ldh a, [hSCY]
	and $FC
	and a
	ret nz
	ld a, [hSCY]
	ld b, a
	ld a, [wcd95]
	add b
	ld [wcd95], a
	xor a
	ld [hSCY], a
	xor a
	ld [wcd52], a
	ld a, [wcd53]
	inc a
	ld [wcd53], a
	cp $14
	jr z, .asm_53de
	ret
.asm_53b4
	ld [wcd52], a
	ld a, [wcd53]
	inc a
	cp $01
	jr nc, .asm_53f3
	ret
.asm_53c0
	ld a, [hSCY]
	and $F0
	and a
	ret nz
	ld [hSCY], a
	ld a, $01
	ld [hFade], a
	ret
.asm_53d0
	ld a, [hSCY]
	and a
	ret nz
	ld a, [wcd5d]
	sub $08
	ld [wcd5d], a
	ret
.asm_53de
	ld hl, $9800
	ld de, RacingMinigame_Tilemap2
	ld bc, $0E06
	ld a, $06
	ldh [hVRAMCopyHeight], a
	ld a, $0E
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_53f3
	ld hl, $9B40
	ld de, RacingMinigame_Tilemap3
	ld bc, $0E06
	ld a, $06
	ldh [hVRAMCopyHeight], a
	ld a, $0E
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
Func_05e_5408:
	ld a, [wcd50]
	inc a
	ld [wcd50], a
	cp $0F
	ret c
	xor a
	ld [wcd50], a
	ld a, [wcd51]
	inc a
	ld [wcd51], a
	and $01
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_RowPtrs
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $99E0
	ld bc, $1401
	ld a, $01
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
RacingMinigame_RowPtrs:
	dw RacingMinigame_BannerRowA
	dw RacingMinigame_BannerRowB
RacingMinigame_Attrmap0:
INCBIN "gfx/attrmaps/racingminigame_attrmap0.bin"
RacingMinigame_Tilemap0:
INCBIN "gfx/tilemaps/racingminigame_tilemap0.tilemap"
; TODO: cutscene/minigame data - classify records (verify consumer: db vs dw vs [sub-table][data])
RacingMinigame_BannerRowA:
	db $11, $12, $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f, $90, $91, $92, $93, $94, $95, $11
RacingMinigame_BannerRowB:
	db $11, $12, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15
	db $15, $15, $95, $11
RacingMinigame_Pal1:
	RGB 26, 29, 31
	RGB 8, 26, 31
	RGB 0, 8, 28
	RGB 0, 0, 0
	RGB 31, 31, 20
	RGB 31, 31, 0
	RGB 31, 15, 0
	RGB 0, 0, 0
RacingMinigame_GFX1:
INCBIN "gfx/misc/racingminigame_gfx1.2bpp"
RacingMinigame_GFX2:
INCBIN "gfx/misc/racingminigame_gfx2.2bpp"
RacingMinigame_Pal2:
	RGB 15, 15, 15
	RGB 21, 23, 26
	RGB 10, 12, 16
	RGB 0, 0, 0
	RGB 15, 15, 15
	RGB 31, 31, 31
	RGB 8, 16, 23
	RGB 0, 0, 0
	RGB 15, 15, 15
	RGB 31, 22, 14
	RGB 16, 0, 17
	RGB 0, 0, 0
	RGB 15, 15, 15
	RGB 31, 25, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 15, 15, 15
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
RacingMinigame_GFX3:
INCBIN "gfx/misc/racingminigame_gfx3.2bpp"
RacingMinigame_Attrmap1:
INCBIN "gfx/attrmaps/racingminigame_attrmap1.bin"
RacingMinigame_Tilemap1:
INCBIN "gfx/tilemaps/racingminigame_tilemap1.tilemap"
RacingMinigame_Tilemap2:
INCBIN "gfx/tilemaps/racingminigame_tilemap2.tilemap"
RacingMinigame_Tilemap3:
INCBIN "gfx/tilemaps/racingminigame_tilemap3.tilemap"
RacingMinigame_Pal3:
	RGB 30, 30, 30
	RGB 28, 14, 0
	RGB 20, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 20, 0
	RGB 31, 0, 0
	RGB 0, 0, 0
	RGB 12, 31, 31
	RGB 8, 16, 23
	RGB 24, 28, 23
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 4, 28
	RGB 0, 0, 0
	RGB 30, 31, 27
	RGB 23, 25, 19
	RGB 17, 19, 12
	RGB 0, 0, 0
RacingMinigame_GFX4:
INCBIN "gfx/misc/racingminigame_gfx4.2bpp"
RacingMinigame_TilemapRowB:
INCBIN "gfx/tilemaps/racingminigame_tilemaprowb.tilemap"
RacingMinigame_TilemapRowA:
INCBIN "gfx/tilemaps/racingminigame_tilemaprowa.tilemap"
RacingMinigame_ScrollTableA:
	db $30, $00, $18, $07, $40, $01, $38, $09, $e0, $02, $28, $0a, $20, $02, $10, $08
	db $50, $03, $28, $0a, $40, $04, $30, $08, $30, $05, $40, $0a, $20, $06, $48, $08
	db $20, $07, $20, $0a, $40, $08, $60, $08, $90, $09, $50, $0a, $20, $09, $38, $07
	db $50, $0a, $40, $09, $40, $0b, $28, $07, $30, $0c, $18, $09, $20, $0d, $18, $07
	db $20, $0e, $10, $09, $40, $0f, $38, $07, $90, $10, $48, $09, $b0, $11, $58, $07
	db $c0, $12, $38, $09, $40, $12, $10, $0a, $30, $13, $28, $08, $20, $14, $48, $0a
	db $90, $15, $30, $07, $90, $16, $50, $09, $e0, $17, $20, $07, $20, $17, $28, $09
	db $50, $18, $38, $07, $40, $19, $40, $09, $30, $1a, $28, $07, $20, $1b, $40, $09
	db $20, $1c, $10, $07, $40, $1d, $58, $09, $90, $1e, $10, $07, $b0, $1f, $28, $09
	db $ff, $ff
Func_05e_777c:
	ld a, [wcd76]
	and a
	ret nz
	ld a, [wcd7c]
	and a
	ret nz
	ld a, [wcd7e]
	and a
	ret nz
	ld a, [wcd75]
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_ScrollTableA
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	cp $FF
	ret z
	ld [wcd7a], a
	ld a, [hli]
	ld [wcd7b], a
	ld a, [hli]
	ld [wcd79], a
	ld a, [hli]
	ld [wcd77], a
	ld a, $F0
	ld [wcd78], a
	ld a, [wcd75]
	inc a
	ld [wcd75], a
	ret
Func_05e_77b8:
	ld a, [wcd7f]
	and a
	ret nz
	ld a, [wcd85]
	and a
	ret nz
	ld a, [wcd87]
	and a
	ret nz
	ld a, [wcd75]
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_ScrollTableA
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	cp $FF
	ret z
	ld [wcd83], a
	ld a, [hli]
	ld [wcd84], a
	ld a, [hli]
	ld [wcd82], a
	ld a, [hli]
	ld [wcd80], a
	ld a, $F0
	ld [wcd81], a
	ld a, [wcd75]
	inc a
	ld [wcd75], a
	ret
Func_05e_77f4:
	ld a, [wcd7a]
	ld c, a
	ld a, [wcd7b]
	ld b, a
	ldh a, [hSCY]
	and $F0
	cp c
	jr nz, .asm_780e
	ld a, [wcd53]
	cp b
	jr nz, .asm_780e
	ld a, $01
	ld [wcd76], a
.asm_780e
	ld a, [wcd83]
	ld c, a
	ld a, [wcd84]
	ld b, a
	ldh a, [hSCY]
	and $F0
	cp c
	ret nz
	ld a, [wcd53]
	cp b
	ret nz
	ld a, $01
	ld [wcd7f], a
	ret
Func_05e_7827:
	ld a, [wcd9f]
	and a
	ret z
	dec a
	ld [wcd9f], a
	ld a, [wcd9e]
	ld c, a
	ld a, [wcd5a]
	add c
	ld [wcd5a], a
	ret
Func_05e_783c:
	ld a, [wcda0]
	ld c, a
	ld b, $00
	ld hl, RacingMinigame_ScrollTableB
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	and a
	ret z
	ld c, a
	ld a, [wcda1]
	inc a
	ld [wcda1], a
	cp c
	ret c
	xor a
	ld [wcda1], a
	ld a, [hli]
	ld [wcd9e], a
	ld a, [hli]
	ld [wcd9f], a
	ld a, [wcda0]
	inc a
	ld [wcda0], a
	ret
RacingMinigame_ScrollTableB:
	db $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff
	db $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff
	db $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18
	db $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff
	db $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff
	db $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18
	db $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff
	db $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff
	db $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18, $30, $ff, $18, $ff, $01, $18
	db $30, $ff, $18, $ff, $01, $18, $00
