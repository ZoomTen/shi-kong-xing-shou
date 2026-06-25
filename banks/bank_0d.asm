LoadEmotesAndPromptGFX::
	ld hl, PaperEmotesTiles
	ld de, $8540
	ld bc, $0140
	call CopyBytesVRAM
	ld hl, ContinueBlinkerTiles
	ld de, $8680
	ld bc, $0080
	call CopyBytesVRAM
	ret

_AnimatePaperScroll::
	call .asm_4089
	call .asm_4020
	ret
.asm_4020
	call DelayFrame
	ldh a, [hJoypadPressed]
	bit 0, a
	jr nz, .asm_4032
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	cp $7F
	jr c, .asm_4020
.asm_4032
	call Func_00d_412c
	xor a
	ld [hScrollNumber], a
	ret

.asm_403a
	ld a, $98
	ld [wBGMapAddr + 1], a
	ld a, $00
	ld [wBGMapAddr], a
	ld hl, wTilemap
	ld de, wMapTileAttrs
	ld a, $01
	ldh [rVBK], a
	ld b, $12
.asm_4050
	ld c, $14
.asm_4052
	ld a, [hli]
	push hl
	ld l, a
	ld h, $00
	add hl, de
	push de
	ld a, [wBGMapAddr + 1]
	ld d, a
	ld a, [wBGMapAddr]
	ld e, a
.asm_4061
	ldh a, [rSTAT]
	and $03
	jr nz, .asm_4061
	ld a, [hli]
	ld [de], a
	pop de
	ld hl, wBGMapAddr
	inc [hl]
	pop hl
	dec c
	jr nz, .asm_4052
	ld a, [wBGMapAddr]
	add $0C
	ld [wBGMapAddr], a
	ld a, [wBGMapAddr + 1]
	adc $00
	ld [wBGMapAddr + 1], a
	dec b
	jr nz, .asm_4050
	xor a
	ldh [rVBK], a
	ret
.asm_4089
	hlcoord 0, 6
	ld de, wScreenRowBuffer
	ld c, $50
.asm_4091
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_4091
	ld hl, PaperScrollTiles
	ld de, $8A00
	ld bc, $0050
	call CopyBytesVRAM
	call DelayFrame
	xor a
	ld [wCharacterTilePos], a
	ld de, Pointers_00d_437a
	ldh a, [hScrollNumber]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
Func_00d_40b8:
	pop hl
	ld a, [hli]
	push hl
	cp $F0
	jp nc, Func_00d_42a4
	cp $ED
	jp z, .asm_40cb
	call RequestLoadCharacter_PaperScroll
	jp Func_00d_40b8
.asm_40cb
	pop hl
	ld a, [hli]
	ld de, Pointers_00d_42a0
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wAnimFramePtr], a
	ld e, a
	ld a, [hli]
	ld [wAnimFramePtr + 1], a
	ld d, a
	call .asm_40e3
	ret
.asm_40e3
	xor a
	ld [wAnimFrameCounter], a
.asm_40e7
	call Func_00d_4193
	call Func_00d_41c0
	call Func_00d_4212
	call Func_00d_40ff
	ld a, [wAnimFrameCounter]
	inc a
	ld [wAnimFrameCounter], a
	cp $0A
	jr c, .asm_40e7
	ret
Func_00d_40ff:
	ld hl, $98C0
	ld de, wd100
	ld bc, $1404
	ld a, b
	ldh [hVRAMCopyWidth], a
	ld a, c
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld hl, $98C0
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	decoord 0, 6
	ld bc, $1404
	ld a, b
	ldh [hVRAMCopyWidth], a
	ld a, c
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret
Func_00d_412c:
	ld a, $09
	ld [wAnimFrameCounter], a
.asm_4131
	ld a, [wAnimFrameCounter]
	cp $01
	jr z, .asm_4143
	call .asm_4165
	call Func_00d_41c0
	call Func_00d_41db
	jr .asm_4154
.asm_4143
	hlcoord 0, 6
	ld de, wScreenRowBuffer
	ld c, $50
.asm_414b
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_414b
	call Func_00d_41c0
.asm_4154
	call Func_00d_40ff
	call DelayFrame
	ld a, [wAnimFrameCounter]
	dec a
	ld [wAnimFrameCounter], a
	and a
	jr nz, .asm_4131
	ret
.asm_4165
	ld de, wScreenRowBuffer
	ld a, [wAnimFrameCounter]
	add $05
	ld l, a
	ld h, $00
	add hl, de
	ld e, l
	ld d, h
	bccoord 5, 6
	ld a, [wAnimFrameCounter]
	ld l, a
	ld h, $00
	add hl, bc
	ld c, $04
.asm_417f
	push bc
	ld bc, $0014
	ld a, [de]
	ld [hl], a
	add hl, bc
	ld a, e
	add $14
	ld e, a
	ld a, d
	adc $00
	ld d, a
	pop bc
	dec c
	jr nz, .asm_417f
	ret
Func_00d_4193:
	ld a, [wAnimFramePtr]
	ld e, a
	ld a, [wAnimFramePtr + 1]
	ld d, a
	ld a, [wAnimFrameCounter]
	ld l, a
	ld h, $00
	push hl
	add hl, de
	ld e, l
	ld d, h
	bccoord 5, 6
	pop hl
	add hl, bc
	ld c, $04
.asm_41ac
	push bc
	ld bc, $0014
	ld a, [de]
	ld [hl], a
	add hl, bc
	ld a, e
	add $0A
	ld e, a
	ld a, d
	adc $00
	ld d, a
	pop bc
	dec c
	jr nz, .asm_41ac
	ret
Func_00d_41c0:
	hlcoord 0, 6
	ld de, wd100
	ld c, $50
.asm_41c8
	ld a, [hli]
	push hl
	ld hl, wMapTileAttrs
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, .asm_41c8
	ret
Func_00d_41db:
	ld a, [wAnimFrameCounter]
	dec a
	ld l, a
	ld h, $00
	bccoord 5, 6
	add hl, bc
	ld de, unk_00d_424c
	ld c, $04
.asm_41eb
	push bc
	ld bc, $0014
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_41eb
	ld a, [wAnimFrameCounter]
	dec a
	add $05
	ld l, a
	ld h, $00
	ld bc, wd100
	add hl, bc
	ld c, $04
.asm_4206
	push bc
	ld bc, $0014
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4206
	ret
Func_00d_4212:
	ld a, [wAnimFrameCounter]
	cp $09
	ret z
	inc a
	ld l, a
	ld h, $00
	bccoord 5, 6
	add hl, bc
	ld de, unk_00d_424c
	ld c, $04
.asm_4225
	push bc
	ld bc, $0014
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4225
	ld a, [wAnimFrameCounter]
	inc a
	add $05
	ld l, a
	ld h, $00
	ld bc, wd100
	add hl, bc
	ld c, $04
.asm_4240
	push bc
	ld bc, $0014
	ld [hl], $06
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_4240
	ret

; TODO: unk_ - data, referenced via `ld de, unk_00d_424c`
unk_00d_424c:
	db $a1, $a3, $a3, $a4
; TODO: font/character tiles copied to VRAM $8A00
PaperScrollTiles:
	INCBIN "gfx/paper_scroll/tiles_4250.2bpp"
; TODO: source pointers for the two paper layouts, indexed *2
Pointers_00d_42a0:
	dw Tilemap_00d_432a, Tilemap_00d_4352

Func_00d_42a4:
	and $0F
	push af
	srl a
	add $40
	ld [hTargetBank], a
	pop af
	bit 0, a
	jr nz, .asm_42b7
	ld a, $40
	jr .asm_42b9
.asm_42b7
	ld a, $60
.asm_42b9
	ld [wCharacterTileSource + 1], a
	xor a
	ld [wCharacterTileSource], a
	jp Func_00d_40b8

.asm_42c3
	ld a, $01
	ldh [rVBK], a
	jp .asm_42ce

.asm_42ca
	ld a, $00
	ldh [rVBK], a
.asm_42ce
	push hl
.asm_42cf
	ld a, [de]
	push bc
	ld c, a
.asm_42d2
	ldh a, [rSTAT]
	and $03
	jr nz, .asm_42d2
	ld a, c
	ld [hl], a
	inc l
	xor a
	adc $00
	ld c, a
	ld a, l
	and $0F
	jr nz, .asm_42ec
	ld a, l
	bit 4, a
	jr nz, .asm_42ec
	sub $20
	ld l, a
.asm_42ec
	inc de
	pop bc
	dec b
	jr nz, .asm_42cf
	pop hl
	push bc
	ld bc, Bankswitch
	add hl, bc
	pop bc
	ldh a, [hVRAMCopyWidth]
	ld b, a
	dec c
	jr nz, .asm_42ce
	xor a
	ldh [rVBK], a
	ret

; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_00d_4302:
	db $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $86, $80, $80, $80, $80, $80
	db $80, $80, $80, $86, $86, $80, $80, $80, $80, $80, $80, $80, $80, $86, $86, $86
	db $86, $86, $86, $86, $86, $86, $86, $86
Tilemap_00d_432a:
	INCBIN "gfx/tilemaps/tilemap_00d_432a.tilemap"
Tilemap_00d_4352:
	INCBIN "gfx/tilemaps/tilemap_00d_4352.tilemap"
; TODO: paper-scroll script pointer table, indexed by hScrollNumber *2
Pointers_00d_437a:
	dw Script_00d_43c2, Script_00d_43c2, Script_00d_43c8, Script_00d_43cf, Script_00d_43d5, Script_00d_43dc, Script_00d_43e3, Script_00d_43e9
	dw Script_00d_43ef, Script_00d_43f6, Script_00d_43fd, Script_00d_4404, Script_00d_440b, Script_00d_4412, Script_00d_4418, Script_00d_441e
	dw Script_00d_4426, Script_00d_442e, Script_00d_4434, Script_00d_443c, Script_00d_4445, Script_00d_444e, Script_00d_4457, Script_00d_4460
	dw Script_00d_446a, Script_00d_4472, Script_00d_447a, Script_00d_4482, Script_00d_448b, Script_00d_4494, Script_00d_449d, Script_00d_44a5
	dw Script_00d_44ae, Script_00d_44b6, Script_00d_44be, Script_00d_44c7
; TODO: paper-scroll scripts (F0/ED character command lists)
INCLUDE "data/text/bank0d_paperscroll.asm"
PaperEmotesTiles:
	INCBIN "gfx/paper_scroll/tiles_44cf.2bpp"
LightbulbEmoteTiles:
	INCBIN "gfx/paper_scroll/tiles_460f.2bpp"
ContinueBlinkerTiles:
	INCBIN "gfx/paper_scroll/tiles_464f.2bpp"
