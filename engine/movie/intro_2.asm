Intro_ScrollBG:
	ld a, [wdcfb]
	cp 4
	jr z, .scroll_down
	cp 3
	jr z, .scroll_up
	cp 2
	jr z, .scroll_left
	cp 1
	jr z, .scroll_right
	ret

.scroll_right
	ld a, [hSCX]
	inc a
	inc a
	inc a
	inc a
	ld [hSCX], a
	cp $a0
	jr z, .right_done
	ret

.right_done
	ld a, 1
	ld [wIntroSeqStep], a
	ret

.scroll_left
	ld a, [hSCX]
	dec a
	dec a
	dec a
	dec a
	ld [hSCX], a
	cp $a8
	jr z, .left_done
	ret

.left_done
	ld a, 1
	ld [wIntroSeqStep], a
	ret

.scroll_up
	ld a, [hSCY]
	dec a
	dec a
	dec a
	dec a
	ld [hSCY], a
	and a
	jr z, .up_done
	ret

.up_done
	ld a, 1
	ld [wIntroSeqStep], a
	ret

.scroll_down
	ld a, [hSCY]
	inc a
	inc a
	inc a
	inc a
	ld [hSCY], a
	and a
	jr z, .down_done
	ret

.down_done
	ld a, 1
	ld [wIntroSeqStep], a
	ret

Intro_ScrollTextSpritesUp:
	ld a, [wIntroStepTimer]
	cp $20
	jr z, .scroll
	inc a
	ld [wIntroStepTimer], a
	ret

.scroll
	ld a, [wcd42]
	sub 8
	ld [wcd42], a
	cp $38
	ret nz
	ld a, 2
	ld [wIntroSeqStep], a
	ret

Intro_ScrollWindow:
	ld a, [wIntroScrollMode]
	cp 4
	jp z, .scroll_down
	cp 3
	jp z, .scroll_left2
	cp 2
	jp z, .scroll_up
	cp 1
	jp z, .scroll_left
	ret

.scroll_left
	ld a, [wWX]
	dec a
	dec a
	dec a
	dec a
	ld [wWX], a
	cp $58
	jr z, .left_done
	ret

.left_done
	ld a, 4
	ld [wIntroSeqStep], a
	ret

.scroll_up
	ld a, [wWY]
	dec a
	dec a
	dec a
	dec a
	ld [wWY], a
	and a
	jr z, .up_done
	ret

.up_done
	ld a, 4
	ld [wIntroSeqStep], a
	ret

.scroll_left2
	ld a, [wWX]
	dec a
	dec a
	dec a
	dec a
	ld [wWX], a
	cp $58
	jr z, .left2_done
	ret

.left2_done
	ld a, 4
	ld [wIntroSeqStep], a
	ret

.scroll_down
	ld a, [wWY]
	dec a
	dec a
	dec a
	dec a
	ld [wWY], a
	and a
	jr z, .down_done
	ret

.down_done
	ld a, 4
	ld [wIntroSeqStep], a
	ret


Intro_SetupNewScreen:
; set appropriate scrolling animation
	ld a, [wdce8]
	ld de, Intro_ScrollingModes
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wdcfb], a ; BG scrolling mode
	ld a, [hli]
	ld [wIntroScrollMode], a ; window scrolling mode

; set initial BG positions
	ld a, [wdcfb]
	ld de, Intro_InitialBGPositions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [hSCY], a
	ld a, [hli]
	ld [hSCX], a

; set initial window positions
	ld a, [wIntroScrollMode]
	ld de, Intro_InitialWindowPositions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wWY], a
	ldh [rWY], a
	ld a, [hli]
	ld [wWX], a
	ldh [rWX], a
	ld a, [wdce8]

; render to BG
	ld de, Intro_TilemapPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
; offset the map so that it may be scrolled in
	ld hl, $9814
	ld bc, $0a12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $a
	ldh [hVRAMCopyWidth], a
	call PlaceTilemap_Bank0
	ld a, [wdce8]

; render to window
	ld de, Intro_TilemapPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
; get window tilemap
	ld de, 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9c00
	ld bc, $0a12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $a
	ldh [hVRAMCopyWidth], a
	call CopyBGMapTiles

; set bg attributes
	ld a, [wdce8]
	ld de, Intro_AttrPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9814
	ld bc, $0a12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $a
	ldh [hVRAMCopyWidth], a
	call PlaceAttrmap

; set win attributes
	ld a, [wdce8]
	ld de, Intro_AttrPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld de, 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9c00
	ld bc, $0a12
	ld a, $12
	ldh [hVRAMCopyHeight], a
	ld a, $a
	ldh [hVRAMCopyWidth], a
	call CopyBGMapAttrs

; set BG palettes
	ld a, [wdce8]
	ld de, Intro_BGPalettePointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3

; static object palette
	ld hl, Intro_Text_Palette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

; load in GFX for BG layer
	ld a, [wdce8]
	ld de, Intro_BGGFXPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $9000
	ld bc, $0800
	call FarCopyBytesVRAM

; load in GFX for window layer
	ld a, [wdce8]
	ld de, Intro_WinGFXPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8800
	ld bc, $0800
	call FarCopyBytesVRAM

; load in GFX for sprite layer
	ld a, [wdce8]
	ld de, Intro_SpriteGFXPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8000
	ld bc, $0800
	call FarCopyBytesVRAM

	ld a, $a0
	ld [wcd42], a
	ld a, $38
	ld [wcd43], a
	ld a, [wdce8]
	inc a
	ld [wcd44], a
	ret

Intro_ScrollingModes:
	dw $101
	dw $202
	dw $301
	dw $402
	dw $202
	dw $302
	dw $101
	dw $402

Intro_InitialBGPositions:
	dw $0
	dw $0
	dw $0
	dw $80
	dw $80

Intro_InitialWindowPositions:
	dw $0
	dw $a000
	dw $5880
	dw $a000
	dw $5880

Intro_TilemapPointers:
	dw Intro_Ballot_Tilemap
	dw Intro_Bladeberus_Tilemap

	dw Intro_Buck_Tilemap
	dw Intro_Beattro_Tilemap

	dw Intro_Nina_Tilemap
	dw Intro_Electreep_Tilemap

	dw Intro_Claude_Tilemap
	dw Intro_Charrot_Tilemap

	dw Intro_Helen_Tilemap
	dw Intro_Merlith_Tilemap

	dw Intro_Lante_Tilemap
	dw Intro_Muserode_Tilemap

	dw Intro_Randt_Tilemap
	dw Intro_Signaliton_Tilemap

	dw Intro_Mitt_Tilemap
	dw Intro_Drawvile_Tilemap

Intro_AttrPointers:
; Using the same attributes for all intro pictures
; for both BG and Window
rept 8
	dw Intro_Pics_Attrs
	dw Intro_Beasts_Attrs
endr

Intro_BGPalettePointers:
	dw Intro_Ballot_Palette
	dw Intro_Buck_Palette
	dw Intro_Nina_Palette
	dw Intro_Claude_Palette
	dw Intro_Helen_Palette
	dw Intro_Lante_Palette
	dw Intro_Randt_Palette
	dw Intro_Mitt_Palette

Intro_BGGFXPointers:
	dbaw Intro_Ballot_GFX
	dbaw Intro_Buck_GFX
	dbaw Intro_Nina_GFX
	dbaw Intro_Claude_GFX
	dbaw Intro_Helen_GFX
	dbaw Intro_Lante_GFX
	dbaw Intro_Randt_GFX
	dbaw Intro_Mitt_GFX

Intro_WinGFXPointers:
	dbaw Intro_Bladeberus_GFX
	dbaw Intro_Beattro_GFX
	dbaw Intro_Electreep_GFX
	dbaw Intro_Charrot_GFX
	dbaw Intro_Merlith_GFX
	dbaw Intro_Muserode_GFX
	dbaw Intro_Signaliton_GFX
	dbaw Intro_Drawvile_GFX

Intro_SpriteGFXPointers:
	dbaw Intro_Text1_GFX
	dbaw Intro_Text2_GFX
	dbaw Intro_Text3_GFX
	dbaw Intro_Text4_GFX
	dbaw Intro_Text5_GFX
	dbaw Intro_Text6_GFX
	dbaw Intro_Text7_GFX
	dbaw Intro_Text8_GFX

Intro_InitStars:
	ld a, [wdce8]
	cp 7
	ret nc
	ld a, [wdcf6]
	and a
	jr z, .SpawnStar
	dec a
	ld [wdcf6], a
	ret

.SpawnStar:
	ld bc, wdd50
.find_slot
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .found_slot
	ld hl, 5
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .find_slot
	ret

.found_slot
	ld de, .StarParameters
	ld a, [wdce8]
	ld l, a
	ld h, 0
	add hl, hl
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
	ld a, 1
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [wdcf6], a
	ld a, [hli]
	ld [bc], a
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	ret

.StarParameters:
	db $F0, $70, $02, $18, $01, $00, $00, $00
	db $00, $90, $02, $18, $01, $00, $00, $00
	db $F0, $80, $02, $18, $01, $00, $00, $00
	db $00, $90, $02, $18, $01, $00, $00, $00
	db $F0, $70, $02, $18, $01, $00, $00, $00
	db $00, $80, $02, $18, $01, $00, $00, $00
	db $F0, $90, $02, $18, $02, $00, $00, $00

Intro_MoveStars:
	ld bc, wdd50
.next_star_loop
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .dispatch

.next_star
	ld hl, 5
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .next_star_loop
	ret

.dispatch
	ld de, .Jumptable
	ld hl, 4
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .MoveStar_Idle
	dw .MoveStar_Diagonal
	dw .MoveStar_Scripted

.MoveStar_Idle:
	ret

.StarMotionScript:
	dw $ff00
	dw $fc03
	dw $fc04
	dw $fc03
	dw $fc03
	dw $fc03
	dw $fc03
	dw $fc04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fa04
	dw $fa05
	dw $fa05
	dw $fcfe
	dw $fffc
	dw $fdfa
	dw $fcfa
	dw $fbfa
	dw $fcfc
	dw $fcfd
	dw $fcff
	dw $fcff
	dw $fcff
	dw $fc00
	dw $fc00
	dw $fc01
	dw $fc01
	dw $fc02
	dw $fc02
	dw $fc02
	dw $fc03
	dw $fa05
	dw $fa06
	dw $fa05
	dw $fa06
	db $88

.MoveStar_Scripted:
	ld de, .StarMotionScript
	ld a, [wIntroStepTimer]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	cp $88
	jr z, .script_done
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, 0
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ld hl, 1
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .script_next_frame
	dec [hl]
	jr .script_advance
.script_next_frame:
	ld [hl], 2
	ld hl, 3
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp 5
	jp c, .script_advance
	ld a, 1
	ld [hl], a
.script_advance
	ld a, [wIntroStepTimer]
	add 2
	ld [wIntroStepTimer], a
	jp .next_star

.script_done:
	xor a
	ld [wIntroStepTimer], a
	ld a, 1
	ld [hFade], a
	jp .next_star

.MoveStar_Diagonal:
	ld hl, 1
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, 0
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	cp $a8
	jr z, .diagonal_reset
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .diagonal_next_frame
	dec [hl]
	jp .next_star

.diagonal_next_frame:
	ld [hl], 2
	ld hl, 3
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp 5
	jp c, .next_star
	ld a, 1
	ld [hl], a
	jp .next_star

.diagonal_reset:
	ld hl, 3
	add hl, bc
	ld [hl], 0
	jp .next_star

Intro_ClearSprites:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.clear
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear
	xor a
	ld [wVirtualOAMPtr], a
	call Func_077_4d1e
	ret

Func_077_4d1e:
	ld bc, wdd50

.next_star_loop
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .draw_star

.next_star
	ld hl, 5
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .next_star_loop
	ret

.draw_star
	ld hl, 0
	add hl, bc
	ld a, [hl]
	ld [wdcf7], a
	ld hl, 1
	add hl, bc
	ld a, [hl]
	ld [wdcf8], a
	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld de, Intro_StarSprites
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $c0

.copy_sprite
	ld a, [hli]
	cp $ff
	jr z, .done
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
	jr .copy_sprite

.done
	ld a, e
	ld [wVirtualOAMPtr], a
	jp .next_star

Intro_StarSprites:
	dw .Frame0
	dw .Frame0
	dw .Frame1
	dw .Frame2
	dw .Frame3

.Frame0:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  2,  0,  0,  0, $08, 0
	dsprite  2,  0,  1,  0, $0a, 0
	dsprite  2,  0,  2,  0, $0c, 0
	dsprite  2,  0,  3,  0, $0e, 0
	db -1 ; end

.Frame1:
	dsprite  0,  0,  0,  0, $10, 0
	dsprite  0,  0,  1,  0, $12, 0
	dsprite  0,  0,  2,  0, $14, 0
	dsprite  0,  0,  3,  0, $16, 0
	dsprite  2,  0,  0,  0, $18, 0
	dsprite  2,  0,  1,  0, $1a, 0
	dsprite  2,  0,  2,  0, $1c, 0
	dsprite  2,  0,  3,  0, $1e, 0
	db -1 ; end

.Frame2:
	dsprite  0,  0,  0,  0, $20, 0
	dsprite  0,  0,  1,  0, $22, 0
	dsprite  0,  0,  2,  0, $24, 0
	dsprite  0,  0,  3,  0, $26, 0
	dsprite  2,  0,  0,  0, $28, 0
	dsprite  2,  0,  1,  0, $2a, 0
	dsprite  2,  0,  2,  0, $2c, 0
	dsprite  2,  0,  3,  0, $2e, 0
	db -1 ; end

.Frame3:
	dsprite  0,  0,  0,  0, $30, 0
	dsprite  0,  0,  1,  0, $32, 0
	dsprite  0,  0,  2,  0, $34, 0
	dsprite  0,  0,  3,  0, $36, 0
	dsprite  2,  0,  0,  0, $38, 0
	dsprite  2,  0,  1,  0, $3a, 0
	dsprite  2,  0,  2,  0, $3c, 0
	dsprite  2,  0,  3,  0, $3e, 0
	db -1 ; end

Intro_LoadNewTextSprites:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.clear
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear
	xor a
	ld [wVirtualOAMPtr], a
	call .LoadSprites
	ret

.LoadSprites:
	ld hl, Intro_TextSprites
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
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, $c0
.load_sprite
	ld a, [hli]
	cp -1
	jr z, .done
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
	jr .load_sprite
.done
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

Intro_TextSprites:
	dw .Nothing
	dw .BallotText
	dw .BuckText
	dw .NinaText
	dw .ClaudeText
	dw .HelenText
	dw .LanteText
	dw .RandtText
	dw .MittText

.Nothing:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $00, 0
	db -1 ; end

.BallotText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  0,  0, $36, 0
	dsprite  6,  0,  1,  0, $38, 0
	dsprite  6,  0,  2,  0, $3a, 0
	dsprite  6,  0,  3,  0, $3c, 0
	dsprite  6,  0,  4,  0, $3e, 0
	dsprite  6,  0,  5,  0, $40, 0
	dsprite  6,  0,  6,  0, $42, 0
	db -1 ; end

.BuckText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  0,  0, $36, 0
	dsprite  6,  0,  1,  0, $38, 0
	dsprite  6,  0,  2,  0, $3a, 0
	dsprite  6,  0,  3,  0, $3c, 0
	dsprite  6,  0,  4,  0, $3e, 0
	dsprite  6,  0,  5,  0, $40, 0
	dsprite  6,  0,  6,  0, $42, 0
	dsprite  6,  0,  7,  0, $44, 0
	dsprite  6,  0,  8,  0, $46, 0
	db -1 ; end

.NinaText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  1,  0, $36, 0
	dsprite  6,  0,  2,  0, $38, 0
	dsprite  6,  0,  3,  0, $3a, 0
	dsprite  6,  0,  4,  0, $3c, 0
	dsprite  6,  0,  5,  0, $3e, 0
	dsprite  6,  0,  6,  0, $40, 0
	db -1 ; end

.ClaudeText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	db -1 ; end

.HelenText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	db -1 ; end

.LanteText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  1,  0, $24, 0
	dsprite  4,  0,  2,  0, $26, 0
	dsprite  4,  0,  3,  0, $28, 0
	dsprite  4,  0,  4,  0, $2a, 0
	dsprite  4,  0,  5,  0, $2c, 0
	dsprite  4,  0,  6,  0, $2e, 0
	db -1 ; end

.RandtText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  0,  0, $36, 0
	dsprite  6,  0,  1,  0, $38, 0
	dsprite  6,  0,  2,  0, $3a, 0
	dsprite  6,  0,  3,  0, $3c, 0
	dsprite  6,  0,  4,  0, $3e, 0
	dsprite  6,  0,  5,  0, $40, 0
	dsprite  6,  0,  6,  0, $42, 0
	db -1 ; end

.MittText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	db -1 ; end

Intro_CheckButtonSkip:
	ldh a, [hJoypadDown]
	and a
	ret z
; able to be skipped by any button
	ld a, 1
	ld [hFade], a
	ret

Intro_ReloadStartPalette:
	ld hl, Intro_Begin_BGPalette
	call CopyBackgroundPalettes
	ld hl, Intro_Begin_BGPalette
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	ret

; unused?
	ld hl, Palette_077_52f7
	call CopyBackgroundPalettes
	ld hl, Palette_077_52f7
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	ret

; unused?
	ld hl, Palette_077_52b7
	call CopyBackgroundPalettes
	ld hl, Palette_077_52f7
	ld de, wPaletteBuffer
	ld bc, $40
	call CopyBytes3
	ret

Intro_DelayCFrames:
	call DelayFrame
	dec c
	jr nz, Intro_DelayCFrames
	ret

Intro_ClearScreenState:
	ld hl, wVisibleObjects
	ld bc, $0100
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Intro_ClearStarObjects:
	ld hl, wdd50
	ld bc, $10
.loop
	ld [hl], 0
	inc hl
	dec c
	ld a, c
	or b
	jr nz, .loop
	ret

Intro_ClearOAMBuffer:
	ld hl, wc000
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

Palette_077_52b7:
rept 32
	RGB 31, 31, 31
endr

Palette_077_52f7:
rept 32
	RGB 0, 0, 0
endr
