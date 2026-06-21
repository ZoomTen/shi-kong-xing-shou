MiceMinigame::
	ld a, $5D
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
	ld [wcd40], a
	ld [wcd41], a
	ld a, $3C
	ld [wdcf8], a
.asm_4033
	call Func_5b_47d7
	call Func_5b_47c9
	ld a, [wdcf5]
	and a
	jr z, .asm_408d
	ld hl, MiceMinigame_GFX1
	ld de, $8000
	ld bc, $0760
	call CopyBytesVRAM
	ld hl, $9800
	ld de, MiceMinigame_Tilemap2
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, MiceMinigame_Attrmap2
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, MiceMinigame_GFX3
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, $8800
	ld bc, $0080
	call CopyBytesVRAM
	call Func_5b_4755
	jr .asm_40ca
.asm_408d
	ld hl, $9800
	ld de, MiceMinigame_Tilemap1
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld hl, $9800
	ld de, MiceMinigame_Attrmap1
	ld bc, $1412
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $14
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap
	ld hl, MiceMinigame_GFX2
	ld de, $9000
	ld bc, $0800
	call CopyBytesVRAM
	ld de, $8800
	ld bc, $00A0
	call CopyBytesVRAM
.asm_40ca
	ld hl, MiceMinigame_BGPalette
	ld de, wPaletteBuffer
	ld bc, $0040
	call CopyBytes3
	ld hl, MiceMinigame_ObjPalette
	ld de, wcaf0
	ld bc, $0040
	call CopyBytes3
	ld a, $C7
	ldh [rLCDC], a
	call Func_5b_47e8
	ld hl, wPaletteBuffer
	xor a
	ldh [hPaletteFadeState], a
	ldh [hFadeFrameCounter], a
	call FadeInPalette
.asm_40f4
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4147
	ld a, [wdcf5]
	and a
	jr z, .asm_412c
	call Func_5b_47e8
	call Func_5b_45de
	call Func_5b_468a
	ld a, [wdcf5]
	cp $01
	jr z, .asm_4126
	call Func_5b_449d
	call Func_5b_434e
	call Func_5b_41a9
	call Func_5b_4151
	jp .asm_40f4
.asm_4126
	call Func_5b_46f9
	jp .asm_40f4
.asm_412c
	ldh a, [hJoypadDown]
	and a
	jr z, .asm_40f4
	ld a, $01
	ld [wdcf5], a
	ldh [hFadeFrameCounter], a
	xor a
	ldh [hPaletteFadeState], a
	ld [wdce8], a
	ld bc, wPaletteBuffer
	call FadeOutPalette
	jp .asm_4033
.asm_4147
	xor a
	ld [hFFC6], a
	ld [wTargetMode], a
	jp JumpToGameMode
Func_5b_4151:
	ld a, [wPlayerFacing]
	cp $08
	ret nc
	ldh a, [hFadeFrameCounter]
	and $1F
	ret nz
	ld a, [wdcf8]
	and a
	jr z, Func_5b_4180
	dec a
	ld [wdcf8], a
	ld hl, $99ED
	ld de, wdcf8
	ld bc, $0102
	ld a, $39
	ld [wd8fe], a
	ld a, $01
	ld [wd1fc], a
	ld [wd0fd], a
	call Func_113f
	ret
Func_5b_4180:
	ld a, $09
	ld [wPlayerFacing], a
	xor a
	ld [wPlayerAnimFrame], a
	ld a, [wEventFlags + $b]
	res 1, a
	ld [wEventFlags + $b], a
	ld a, $74
	call PlaySound
	ld hl, $99D0
	ld de, MiceMinigame_FaceTilemap3
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
Func_5b_41a9:
	ld bc, wcd08
Func_5b_41ac:
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, Func_5b_41d5
	ld hl, $0006
	add hl, bc
	ld a, [hl]
	cp $08
	jr z, .asm_41c9
	call Func_5b_455f
	and a
	jp nz, Func_5b_41f1
	ld hl, $0006
	add hl, bc
	ld a, [hl]
.asm_41c9
	ld de, MiceMinigame_StateJumptable
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
Func_5b_41d5:
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $50
	jr c, Func_5b_41ac
	ret
Func_5b_41e1:
	ld hl, $0000
	add hl, bc
	dec [hl]
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, Func_5b_41d5
Func_5b_41f1:
	call AdvanceRNG
	ld a, [wd991]
	and $07
	push af
	ld hl, $0006
	add hl, bc
	ld [hli], a
	ld [hl], $00
	ld de, MiceMinigame_DirStateTable
	pop af
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld hl, $0003
	add hl, bc
	ld [hli], a
	ld [hl], $01
	inc hl
	ld [hl], $00
	jp Func_5b_41d5
Func_5b_4217:
	ld hl, $0000
	add hl, bc
	inc [hl]
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jp c, Func_5b_41d5
	jp Func_5b_41f1
Func_5b_422b:
	ld hl, $0001
	add hl, bc
	dec [hl]
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jp c, Func_5b_41d5
	jp Func_5b_41f1
Func_5b_423f:
	ld hl, $0001
	add hl, bc
	inc [hl]
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jp c, Func_5b_41d5
	jp Func_5b_41f1
Func_5b_4253:
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	sub $02
	ld [hl], a
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jp c, Func_5b_41d5
	jp Func_5b_41f1
Func_5b_426a:
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	add $02
	ld [hl], a
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jp c, Func_5b_41d5
	jp Func_5b_41f1
Func_5b_4281:
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	sub $02
	ld [hl], a
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jp c, Func_5b_41d5
	jp Func_5b_41f1
Func_5b_4298:
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	add $02
	ld [hl], a
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jp c, Func_5b_41d5
	jp Func_5b_41f1
Func_5b_42af:
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .asm_42bb
	add $04
	ld [hli], a
.asm_42bb
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	cp $08
	jr c, .asm_42c7
	sub $04
	ld [hl], a
.asm_42c7
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	cp $88
	ret c
	ld hl, $0000
	add hl, bc
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [wdcfc]
	inc a
	ld [wdcfc], a
	push bc
	ld hl, $99DE
	ld de, wdcfc
	ld bc, $0101
	ld a, $39
	ld [wd8fe], a
	ld a, $01
	ld [wd1fc], a
	xor a
	ld [wd0fd], a
	call Func_113f
	pop bc
	ld a, [wdcfc]
	cp $09
	jp c, Func_5b_41d5
	ld a, $08
	ld [wPlayerFacing], a
	xor a
	ld [wPlayerAnimFrame], a
	ld a, [wEventFlags + $b]
	set 1, a
	ld [wEventFlags + $b], a
	ld a, $6B
	call PlaySound
	ld hl, $99D0
	ld de, MiceMinigame_FaceTilemap4
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
MiceMinigame_DirStateTable:
	dr $16c330, $16c33c
MiceMinigame_StateJumptable:
	dr $16c33c, $16c34e
Func_5b_434e:
	ld a, [wPlayerFacing]
	cp $04
	jr z, .asm_4363
	cp $05
	jr z, .asm_43ac
	cp $06
	jr z, .asm_43d3
	cp $07
	jp z, .asm_43fa
	ret
.asm_4363
	call Func_5b_4570
	and a
	jr nz, .asm_4378
	ld hl, MiceMinigame_unk68A5
	ld a, [wdcf6]
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	cp $88
	jr nz, .asm_4397
.asm_4378
	ld a, [wPlayerFacing]
	sub $04
	ld [wPlayerFacing], a
	xor a
	ld [wPlayerAnimFrame], a
	ld hl, $99D0
	ld de, MiceMinigame_FaceTilemap0
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
.asm_4397
	ld a, [wVisibleObjects]
	add [hl]
	ld [wVisibleObjects], a
.asm_439e
	ld a, [wdcf6]
	inc a
	ld [wdcf6], a
	cp $16
	ret c
	call Func_5b_441a
	ret
.asm_43ac
	call Func_5b_4570
	and a
	jr nz, .asm_4378
	ld de, MiceMinigame_unk68F1
	ld a, [wdcf6]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4378
	ld a, [wVisibleObjects]
	add [hl]
	ld [wVisibleObjects], a
	inc hl
	ld a, [wPlayerScreenX]
	add [hl]
	ld [wPlayerScreenX], a
	jr .asm_439e
.asm_43d3
	call Func_5b_4570
	and a
	jr nz, .asm_4378
	ld de, MiceMinigame_unk68F1
	ld a, [wdcf6]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	cp $88
	jr z, .asm_4378
	ld a, [wVisibleObjects]
	add [hl]
	ld [wVisibleObjects], a
	inc hl
	ld a, [wPlayerScreenX]
	sub [hl]
	ld [wPlayerScreenX], a
	jr .asm_439e
.asm_43fa
	call Func_5b_4570
	and a
	jp nz, .asm_4378
	ld de, MiceMinigame_unk68C8
	ld a, [wdcf6]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $88
	jp z, .asm_4378
	ld a, [wVisibleObjects]
	sub [hl]
	ld [wVisibleObjects], a
	jr .asm_439e
Func_5b_441a:
	ld a, [wVisibleObjects]
	add $02
	ld [wcd88], a
	add $0C
	ld [wcd89], a
	ld a, [wPlayerScreenX]
	add $02
	ld [wcd8a], a
	add $0C
	ld [wcd8b], a
	ld bc, wcd08
.asm_4437
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_446e
	ld hl, $0006
	add hl, bc
	ld a, [hl]
	cp $08
	jr z, .asm_446e
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
	call Func_5b_447a
	and a
	jr z, .asm_446e
	ld hl, $0006
	add hl, bc
	ld [hl], $08
.asm_446e
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $50
	jr c, .asm_4437
	ret
Func_5b_447a:
	ld hl, wcd8d
	ld de, wcd88
	ld a, [de]
	cp [hl]
	jr nc, .asm_449b
	inc de
	dec hl
	ld a, [de]
	cp [hl]
	jr c, .asm_449b
	inc de
	ld hl, wcd8f
	ld a, [de]
	cp [hl]
	jr nc, .asm_449b
	inc de
	dec hl
	ld a, [de]
	cp [hl]
	jr c, .asm_449b
	ld a, $01
	ret
.asm_449b
	xor a
	ret
Func_5b_449d:
	ld a, [wPlayerFacing]
	cp $04
	ret nc
	ldh a, [hJoypadDown]
	bit 7, a
	jr z, .asm_44c7
	ld a, [wPlayerFacing]
	and a
	jr z, .asm_44b8
	xor a
	ld [wPlayerFacing], a
	ld a, $14
	ld [wcd06], a
.asm_44b8
	call Func_5b_4570
	and a
	jr nz, .asm_4537
	ld a, [wVisibleObjects]
	inc a
	ld [wVisibleObjects], a
	jr .asm_4537
.asm_44c7
	ldh a, [hJoypadDown]
	bit 6, a
	jr z, .asm_44ed
	ld a, [wPlayerFacing]
	cp $03
	jr z, .asm_44de
	ld a, $03
	ld [wPlayerFacing], a
	ld a, $14
	ld [wcd06], a
.asm_44de
	call Func_5b_4570
	and a
	jr nz, .asm_4537
	ld a, [wVisibleObjects]
	dec a
	ld [wVisibleObjects], a
	jr .asm_4537
.asm_44ed
	ldh a, [hJoypadDown]
	bit 5, a
	jr z, .asm_4513
	ld a, [wPlayerFacing]
	cp $01
	jr z, .asm_4504
	ld a, $01
	ld [wPlayerFacing], a
	ld a, $14
	ld [wcd06], a
.asm_4504
	call Func_5b_4570
	and a
	jr nz, .asm_4537
	ld a, [wPlayerScreenX]
	dec a
	ld [wPlayerScreenX], a
	jr .asm_4537
.asm_4513
	ldh a, [hJoypadDown]
	bit 4, a
	jr z, .asm_4537
	ld a, [wPlayerFacing]
	cp $02
	jr z, .asm_452a
	ld a, $02
	ld [wPlayerFacing], a
	ld a, $14
	ld [wcd06], a
.asm_452a
	call Func_5b_4570
	and a
	jr nz, .asm_4537
	ld a, [wPlayerScreenX]
	inc a
	ld [wPlayerScreenX], a
.asm_4537
	ldh a, [hJoypadPressed]
	bit 0, a
	ret z
	ld a, [wPlayerFacing]
	add $04
	ld [wPlayerFacing], a
	xor a
	ld [wPlayerAnimFrame], a
	xor a
	ld [wdcf6], a
	ld hl, $99D0
	ld de, MiceMinigame_FaceTilemap1
	ld bc, $0404
	ld a, $04
	ldh [hVRAMCopyHeight], a
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ret
Func_5b_455f:
	push bc
	ld hl, $0000
	add hl, bc
	ld a, [hli]
	sub $10
	ld c, a
	ld a, [hli]
	sub $08
	ld b, a
	inc hl
	ld a, [hl]
	jr Func_5b_4580
Func_5b_4570:
	push bc
	ld a, [wVisibleObjects]
	sub $10
	ld c, a
	ld a, [wPlayerScreenX]
	sub $08
	ld b, a
	ld a, [wPlayerFacing]
Func_5b_4580:
	and a
	jr z, .asm_45a1
	cp $01
	jr z, .asm_45ab
	cp $02
	jr z, .asm_45b1
	cp $03
	jr z, .asm_45bb
	cp $04
	jr z, .asm_45a1
	cp $05
	jr z, .asm_45ab
	cp $06
	jr z, .asm_45b1
	cp $07
	jr z, .asm_45bb
	pop bc
	ret
.asm_45a1
	ld a, c
	add $10
	ld c, a
	ld a, b
	add $08
	ld b, a
	jr .asm_45bf
.asm_45ab
	ld a, c
	add $0C
	ld c, a
	jr .asm_45bf
.asm_45b1
	ld a, b
	add $10
	ld b, a
	ld a, c
	add $0C
	ld c, a
	jr .asm_45bf
.asm_45bb
	ld a, b
	add $08
	ld b, a
.asm_45bf
	ld hl, MiceMinigame_unk685F
	ld a, c
	swap a
	and $0F
	ld c, a
.asm_45c8
	and a
	jr z, .asm_45d2
	ld de, $000A
	add hl, de
	dec a
	jr .asm_45c8
.asm_45d2
	ld a, b
	swap a
	and $0F
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hl]
	pop bc
	ret
Func_5b_45de:
	ld a, [wPlayerSpriteID]
	and a
	jr nz, .asm_45ee
	ld a, [wcd06]
	inc a
	ld [wcd06], a
	cp $0A
	ret c
.asm_45ee
	xor a
	ld [wPlayerSpriteID], a
	ld [wcd06], a
	ld de, MiceMinigame_AnimScriptPointers
	ld a, [wPlayerFacing]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wPlayerAnimFrame]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_4616
	xor a
	ld [wPlayerAnimFrame], a
	jr .asm_45ee
.asm_4616
	cp $EE
	jr nz, .asm_4620
	ld a, $01
	ld [hFFC6], a
	ret
.asm_4620
	ld [wcd02], a
	ld a, [wPlayerAnimFrame]
	inc a
	ld [wPlayerAnimFrame], a
	ret
MiceMinigame_AnimScriptPointers:
	dr $16c62b, $16c68a
Func_5b_468a:
	call Func_5b_45de
	ld bc, wcd08
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_469d
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
.asm_469d
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_46dc
.asm_46a5
	ld hl, $0004
	add hl, bc
	ld [hl], $00
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	ld de, MiceMinigame_AnimScript2Pointers
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_46d2
	ld hl, $0005
	add hl, bc
	ld [hl], $00
	jr .asm_46a5
.asm_46d2
	ld hl, $0002
	add hl, bc
	ld [hl], a
	ld hl, $0005
	add hl, bc
	inc [hl]
.asm_46dc
	ld hl, $0008
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $50
	jr c, .asm_469d
	ret
MiceMinigame_AnimScript2Pointers:
	dr $16c6e8, $16c6f9
Func_5b_46f9:
	ld a, [wdce8]
	and a
	jr nz, .asm_470e
	ldh a, [hFadeFrameCounter]
	and $1F
	ret nz
	ld a, $01
	ld [wdce8], a
	xor a
	ld [wdcf6], a
	ret
.asm_470e
	ld a, [wdce8]
	cp $01
	ret nz
	ldh a, [hFadeFrameCounter]
	and $03
	ret nz
	ld a, [wcd52]
	and a
	jr z, .asm_472a
	ld a, [wcd52]
	ld [wcd57], a
	xor a
	ld [wcd52], a
	ret
.asm_472a
	ld a, [wcd57]
	ld [wcd52], a
	ld a, [wdcf6]
	inc a
	ld [wdcf6], a
	cp $04
	ret c
	xor a
	ld [wdcf6], a
	ld [wdce8], a
	ld a, [wcd52]
	inc a
	ld [wcd52], a
	cp $1E
	ret c
	xor a
	ld [wcd52], a
	ld a, $02
	ld [wdcf5], a
	ret
Func_5b_4755:
	ld hl, wcd50
	ld a, $40
	ld [hli], a
	ld a, $58
	ld [hli], a
	ld [hl], $1A
	ld hl, wVisibleObjects
	ld de, MiceMinigame_ObjectInitData
.asm_4766
	ld a, [de]
	cp $FF
	ret z
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc hl
	jr .asm_4766
Func_5b_4781:
	ret
MiceMinigame_ObjectInitData:
	dr $16c782, $16c7c9
Func_5b_47c9:
	ld hl, wVisibleObjects
	ld bc, $0100
.asm_47cf
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_47cf
	ret
Func_5b_47d7:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_47e0
	ld a, $A0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_47e0
	ret
Func_5b_47e8:
	ld hl, wc000
	ld bc, $0028
	ld de, $0004
.asm_47f1
	ld [hl], $A0
	add hl, de
	dec c
	jr nz, .asm_47f1
	xor a
	ld [wd1fb], a
	call Func_5b_47ff
	ret
Func_5b_47ff:
	ld hl, wVisibleObjects
.asm_4802
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_4863
	ld [wdcf3], a
	ld a, [hli]
	ld [wdcf4], a
	ld de, MiceMinigame_SpriteFramePointers
	ld a, [wdcf3]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $C0
.asm_4827
	ld a, [hli]
	cp $FF
	jp z, .asm_485f
	add c
	ld [de], a
	inc de
	ld a, [wdcf4]
	cp $02
	jr z, .asm_4840
	cp $06
	jr z, .asm_4840
	ld a, [hli]
	add b
	inc hl
	jr .asm_4843
.asm_4840
	inc hl
	ld a, [hli]
	add b
.asm_4843
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wdcf4]
	cp $02
	jr z, .asm_4857
	cp $06
	jr z, .asm_4857
	jr .asm_485b
.asm_4857
	ld a, [de]
	or $20
	ld [de], a
.asm_485b
	inc de
	jp .asm_4827
.asm_485f
	ld a, e
	ld [wd1fb], a
.asm_4863
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $60
	ret nc
	jp .asm_4802
MiceMinigame_SpriteFramePointers:
	dw MiceMinigame_SpriteFrames
	dw MiceMinigame_SpriteFrames
	dw MiceMinigame_SpriteFrames_48b6
	dw MiceMinigame_SpriteFrames_48c1
	dw MiceMinigame_SpriteFrames_48cc
	dw MiceMinigame_SpriteFrames_48d7
	dw MiceMinigame_SpriteFrames_48e2
	dw MiceMinigame_SpriteFrames_48ed
	dw MiceMinigame_SpriteFrames_48f8
	dw MiceMinigame_SpriteFrames_4903
	dw MiceMinigame_SpriteFrames_490e
	dw MiceMinigame_SpriteFrames_4919
	dw MiceMinigame_SpriteFrames_4924
	dw MiceMinigame_SpriteFrames_492f
	dw MiceMinigame_SpriteFrames_493a
	dw MiceMinigame_SpriteFrames_4945
	dw MiceMinigame_SpriteFrames_4950
	dw MiceMinigame_SpriteFrames_495b
	dw MiceMinigame_SpriteFrames_4966
	dw MiceMinigame_SpriteFrames_4971
	dw MiceMinigame_SpriteFrames_497c
	dw MiceMinigame_SpriteFrames_4987
	dw MiceMinigame_SpriteFrames_4992
	dw MiceMinigame_SpriteFrames_499d
	dw MiceMinigame_SpriteFrames_49a8
	dw MiceMinigame_SpriteFrames_49b3
	dw MiceMinigame_SpriteFrames_49be
	dw MiceMinigame_SpriteFrames_49c9
	dw MiceMinigame_SpriteFrames_49d4
	dw MiceMinigame_SpriteFrames_49df
MiceMinigame_SpriteFrames:
	dr $16c8ab, $16c8b6
MiceMinigame_SpriteFrames_48b6:
	dr $16c8b6, $16c8c1
MiceMinigame_SpriteFrames_48c1:
	dr $16c8c1, $16c8cc
MiceMinigame_SpriteFrames_48cc:
	dr $16c8cc, $16c8d7
MiceMinigame_SpriteFrames_48d7:
	dr $16c8d7, $16c8e2
MiceMinigame_SpriteFrames_48e2:
	dr $16c8e2, $16c8ed
MiceMinigame_SpriteFrames_48ed:
	dr $16c8ed, $16c8f8
MiceMinigame_SpriteFrames_48f8:
	dr $16c8f8, $16c903
MiceMinigame_SpriteFrames_4903:
	dr $16c903, $16c90e
MiceMinigame_SpriteFrames_490e:
	dr $16c90e, $16c919
MiceMinigame_SpriteFrames_4919:
	dr $16c919, $16c924
MiceMinigame_SpriteFrames_4924:
	dr $16c924, $16c92f
MiceMinigame_SpriteFrames_492f:
	dr $16c92f, $16c93a
MiceMinigame_SpriteFrames_493a:
	dr $16c93a, $16c945
MiceMinigame_SpriteFrames_4945:
	dr $16c945, $16c950
MiceMinigame_SpriteFrames_4950:
	dr $16c950, $16c95b
MiceMinigame_SpriteFrames_495b:
	dr $16c95b, $16c966
MiceMinigame_SpriteFrames_4966:
	dr $16c966, $16c971
MiceMinigame_SpriteFrames_4971:
	dr $16c971, $16c97c
MiceMinigame_SpriteFrames_497c:
	dr $16c97c, $16c987
MiceMinigame_SpriteFrames_4987:
	dr $16c987, $16c992
MiceMinigame_SpriteFrames_4992:
	dr $16c992, $16c99d
MiceMinigame_SpriteFrames_499d:
	dr $16c99d, $16c9a8
MiceMinigame_SpriteFrames_49a8:
	dr $16c9a8, $16c9b3
MiceMinigame_SpriteFrames_49b3:
	dr $16c9b3, $16c9be
MiceMinigame_SpriteFrames_49be:
	dr $16c9be, $16c9c9
MiceMinigame_SpriteFrames_49c9:
	dr $16c9c9, $16c9d4
MiceMinigame_SpriteFrames_49d4:
	dr $16c9d4, $16c9df
MiceMinigame_SpriteFrames_49df:
	dr $16c9df, $16c9ef
MiceMinigame_ObjPalette:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 31, 0, 0
	RGB 30, 30, 30
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 18, 29
	RGB 31, 30, 30
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 14, 8, 31
	RGB 31, 31, 31
MiceMinigame_GFX1:
INCBIN "gfx/misc/miceminigame_gfx1.2bpp"
MiceMinigame_BGPalette:
	RGB 31, 31, 27
	RGB 27, 25, 18
	RGB 18, 15, 10
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 16, 25, 6
	RGB 0, 13, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 0, 23, 29
	RGB 0, 9, 26
	RGB 0, 0, 0
	RGB 31, 31, 27
	RGB 29, 22, 0
	RGB 18, 9, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 31, 21, 0
	RGB 27, 0, 0
	RGB 0, 0, 0
	RGB 30, 30, 30
	RGB 28, 14, 0
	RGB 20, 0, 0
	RGB 0, 0, 0
	RGB 31, 31, 31
	RGB 30, 16, 28
	RGB 19, 0, 14
	RGB 0, 0, 0
MiceMinigame_Attrmap1:
INCBIN "gfx/attrmaps/miceminigame_attrmap1.bin"
MiceMinigame_Tilemap1:
INCBIN "gfx/tilemaps/miceminigame_tilemap1.tilemap"
MiceMinigame_GFX2:
INCBIN "gfx/misc/miceminigame_gfx2.2bpp"
MiceMinigame_Attrmap2:
INCBIN "gfx/attrmaps/miceminigame_attrmap2.bin"
MiceMinigame_Tilemap2:
INCBIN "gfx/tilemaps/miceminigame_tilemap2.tilemap"
MiceMinigame_GFX3:
INCBIN "gfx/misc/miceminigame_gfx3.2bpp"
MiceMinigame_unk685F:
	dr $16e85f, $16e8a5
MiceMinigame_unk68A5:
	dr $16e8a5, $16e8c8
MiceMinigame_unk68C8:
	dr $16e8c8, $16e8f1
MiceMinigame_unk68F1:
	dr $16e8f1, $16e930
MiceMinigame_FaceTilemaps:
MiceMinigame_FaceTilemap0:
INCBIN "gfx/tilemaps/miceminigame_facetilemap0.tilemap"
MiceMinigame_FaceTilemap1:
INCBIN "gfx/tilemaps/miceminigame_facetilemap1.tilemap"
MiceMinigame_FaceTilemap2:
INCBIN "gfx/tilemaps/miceminigame_facetilemap2.tilemap"
MiceMinigame_FaceTilemap3:
INCBIN "gfx/tilemaps/miceminigame_facetilemap3.tilemap"
MiceMinigame_FaceTilemap4:
INCBIN "gfx/tilemaps/miceminigame_facetilemap4.tilemap"


