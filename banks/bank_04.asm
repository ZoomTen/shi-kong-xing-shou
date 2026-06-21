Func_004_4000::
	ld hl, wVirtualOAM
	ld bc, 40
	ld de, 4
.asm_4009
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4009

	xor a
	ld [wd1fb], a
	call Func_004_4088
	call Func_004_4170
	call Func_004_41e6
	call Func_004_40cb
	call Func_004_426d
	ret

Func_004_4024::
	ld hl, wVirtualOAM
	ld bc, $0028
	ld de, $0004
.asm_402d
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_402d
	xor a
	ld [wd1fb], a
	call Func_004_4088
	call Func_004_4170
	call Func_004_41e6
	call Func_004_40cb
	ret

Func_004_4045::
	ld hl, wVirtualOAMSprite32
	ld bc, $0004
	ld de, $0004
.asm_404e
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_404e
	ld hl, Pointers_004_47ab
	ld de, wcde0
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc a, $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wVirtualOAMSprite32
.asm_4072
	ld a, [hli]
	cp $ff
	jr z, .asm_4087
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_4072
.asm_4087
	ret

Func_004_4088:
	ld hl, wd1a0
.asm_408b
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_40bf
	ld de, Pointers_004_47ab
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_40a6
	ld a, [hli]
	cp $ff
	jr z, .asm_40bb
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_40a6
.asm_40bb
	ld a, e
	ld [wd1fb], a
.asm_40bf
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $e0
	ret nc
	jp .asm_408b

Func_004_40cb:
	ld hl, wNPCObjects
.asm_40ce
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_4164
	push af
	ldh a, [hTextSource]
	and a
	jr z, .asm_40f5
	ld a, [wTextboxPos]
	and a
	jr z, .asm_40ec
	ld a, c
	cp $50
	jr nc, .asm_40f5
	pop af
	jr .asm_4164
.asm_40ec
	ld a, c
	cp $60
	jr c, .asm_40f5
	pop af
	jp .asm_4164
.asm_40f5
	ld a, [hl]
	ld [wd9fa], a
	ld a, l
	add $03
	ld l, a
	ld a, [hli]
	ld [wd9fd], a
	ld a, [hli]
	ld [wd9fe], a
	inc hl
	inc hl
	ld a, [hl]
	ld [wd9ff], a
	pop af
	ld de, Pointers_004_47ab
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_411d
	ld a, [hli]
	cp $ff
	jr z, .asm_4160
	add c
	ld [de], a
	inc de
	ld a, [wd9fa]
	cp $03
	jr nz, .asm_4131
	inc hl
	ld a, [hli]
	add b
	jr .asm_4134
.asm_4131
	ld a, [hli]
	add b
	inc hl
.asm_4134
	ld [de], a
	inc de
	ld a, [wd9fd]
	add [hl]
	inc hl
	ld [de], a
	ld a, [wd9fe]
	and a
	jr z, .asm_4146
	ld a, [de]
	add $04
	ld [de], a
.asm_4146
	inc de
	ld a, [hli]
	ld [de], a
	push hl
	ld hl, wd9ff
	add $03
	add [hl]
	ld [de], a
	pop hl
	ld a, [wd9fa]
	cp $03
	jr nz, .asm_415d
	ld a, [de]
	or $20
	ld [de], a
.asm_415d
	inc de
	jr .asm_411d
.asm_4160
	ld a, e
	ld [wd1fb], a
.asm_4164
	pop hl
	ld bc, $0020
	add hl, bc
	ld a, l
	cp $e0
	ret nc
	jp .asm_40ce

Func_004_4170:
	ld hl, Pointers_004_47ab
	ld de, wPlayerObject
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc a, $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_4190
	ld a, [hli]
	cp $ff
	jr z, .asm_41e1
	add c
	ld [de], a
	inc de
	ld a, [wPlayerFacing]
	cp $03
	jr z, .asm_41a5
	cp $11
	jr z, .asm_41a5
	jr .asm_41aa
.asm_41a5
	inc hl
	ld a, [hli]
	add b
	jr .asm_41ad
.asm_41aa
	ld a, [hli]
	add b
	inc hl
.asm_41ad
	ld [de], a
	inc de
	ld a, [wcd06]
	add [hl]
	inc hl
	ld [de], a
	ld a, [wcd07]
	and a
	jr z, .asm_41bf
	ld a, [de]
	add $04
	ld [de], a
.asm_41bf
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wPlayerFacing]
	cp $03
	jr z, .asm_41cf
	cp $11
	jr z, .asm_41cf
	jr .asm_41d3
.asm_41cf
	ld a, [de]
	or $20
	ld [de], a
.asm_41d3
	ld a, [wcd0a]
	cp $01
	jr nz, .asm_41de
	ld a, [de]
	or $80
	ld [de], a
.asm_41de
	inc de
	jr .asm_4190
.asm_41e1
	ld a, e
	ld [wd1fb], a
	ret

Func_004_41e6:
	ld hl, Pointers_004_47ab
	ld de, wFollowerObject
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	push af
	ldh a, [hTextSource]
	and a
	jr z, .asm_420f
	ld a, [wTextboxPos]
	and a
	jr z, .asm_4208
	ld a, c
	cp $50
	jr nc, .asm_420f
	pop af
	ret
.asm_4208
	ld a, c
	cp $60
	jr c, .asm_420f
	pop af
	ret
.asm_420f
	pop af
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc a, $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_4221
	ld a, [hli]
	cp $ff
	jr z, .asm_4268
	add c
	ld [de], a
	inc de
	ld a, [wcd23]
	cp $03
	jr nz, .asm_4235
	inc hl
	ld a, [hli]
	add b
	jr .asm_4238
.asm_4235
	ld a, [hli]
	add b
	inc hl
.asm_4238
	ld [de], a
	inc de
	ld a, [wcd26]
	add [hl]
	inc hl
	ld [de], a
	ld a, [wcd27]
	and a
	jr z, .asm_424a
	ld a, [de]
	add $04
	ld [de], a
.asm_424a
	inc de
	ld a, [hli]
	ld a, $02
	ld [de], a
	ld a, [wcd23]
	cp $03
	jr nz, .asm_425a
	ld a, [de]
	or $20
	ld [de], a
.asm_425a
	ld a, [wcd2a]
	cp $01
	jr nz, .asm_4265
	ld a, [de]
	or $80
	ld [de], a
.asm_4265
	inc de
	jr .asm_4221
.asm_4268
	ld a, e
	ld [wd1fb], a
	ret

Func_004_426d:
	ldh a, [hConsoleType]
	cp $11
	ret nz
	ld hl, Pointers_004_47ab
	ld de, wcbd0
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	inc de
	add a
	add l
	ld l, a
	ld a, h
	adc a, $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_4292
	ld a, [hli]
	cp $ff
	jr z, .asm_42a7
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_4292
.asm_42a7
	ld a, e
	ld [wd1fb], a
	ret
	ld de, Pointers_004_4337
	ld a, [wPlayerSpriteID]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, wScreenRowBuffer + $40
	ld bc, $0008
	call CopyBytes3
	pop hl
	ld de, wcaf0
	ld bc, $0008
	call CopyBytes3
	ld de, Pointers_004_4337
	ld a, [wcd24]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, wScreenRowBuffer + $40
	ld hl, $0010
	add hl, de
	push hl
	pop de
	pop hl
	push hl
	ld bc, $0008
	call CopyBytes3
	ld de, wcaf0
	ld hl, $0010
	add hl, de
	push hl
	pop de
	pop hl
	ld bc, $0008
	call CopyBytes3
	ld hl, wcaf0
	ld b, $18
	ld c, $80
	call LoadPalettes_OCPD
	ret
Func_004_4309:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_431c
	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, .asm_431c
	ld a, $1b
	jr .asm_431f
.asm_431c
	ld a, [wSelectedOption]
.asm_431f
	ld bc, wcaf0
	ld de, Pointers_004_4337
	add a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	pop de
	ld bc, $0008
	call CopyBytes3
	ret

Pointers_004_4337::
	dw Ballot_ObjPalette
	dw Snowy_ObjPalette
	dw Buck_ObjPalette
	dw Beattro_ObjPalette
	dw Nina_ObjPalette
	dw Electreep_ObjPalette
	dw Claude_ObjPalette
	dw Chromanix_ObjPalette
	dw Helen_ObjPalette
	dw Merlith_ObjPalette
	dw Lante_ObjPalette
	dw Muserode_ObjPalette
	dw Randt_ObjPalette
	dw Signaliton_ObjPalette
	dw Mitt_ObjPalette
	dw Drawvile_ObjPalette
	dw Bladeberus_ObjPalette
	dw Saya_ObjPalette
	dw Boy_ObjPalette
	dw Girl_ObjPalette
	dw ObjPalette_004_44c3
	dw ObjPalette_004_44cb
	dw ObjPalette_004_44d3
	dw ObjPalette_004_44db
	dw ObjPalette_004_44e3
	dw ObjPalette_004_44eb
	dw ObjPalette_004_44f3
	dw ObjPalette_004_44fb
	dw ObjPalette_004_4503
	dw ObjPalette_004_450b
	dw ObjPalette_004_4513
	dw ObjPalette_004_451b
	dw ObjPalette_004_4523
	dw ObjPalette_004_452b
	dw ObjPalette_004_4533
	dw ObjPalette_004_453b
	dw ObjPalette_004_4543
	dw ObjPalette_004_454b
	dw ObjPalette_004_4553
	dw ObjPalette_004_455b
	dw ObjPalette_004_4563
	dw ObjPalette_004_456b
	dw ObjPalette_004_4573
	dw ObjPalette_004_457b
	dw ObjPalette_004_4583
	dw ObjPalette_004_458b
	dw ObjPalette_004_4593
	dw ObjPalette_004_459b
	dw ObjPalette_004_45a3
	dw ObjPalette_004_45ab
	dw ObjPalette_004_45b3
	dw ObjPalette_004_45bb
	dw ObjPalette_004_45c3
	dw ObjPalette_004_45cb
	dw ObjPalette_004_45d3
	dw ObjPalette_004_45db
	dw ObjPalette_004_45e3
	dw ObjPalette_004_45eb
	dw ObjPalette_004_45f3
	dw ObjPalette_004_45fb
	dw ObjPalette_004_4603
	dw ObjPalette_004_460b
	dw ObjPalette_004_4613
	dw ObjPalette_004_461b
	dw ObjPalette_004_4623
	dw ObjPalette_004_462b
	dw ObjPalette_004_4633
	dw ObjPalette_004_463b
	dw ObjPalette_004_4643
	dw ObjPalette_004_464b
	dw ObjPalette_004_4653
	dw ObjPalette_004_45a3
	dw ObjPalette_004_465b
	dw ObjPalette_004_4663
	dw ObjPalette_004_466b
	dw ObjPalette_004_4673
	dw ObjPalette_004_467b
	dw ObjPalette_004_4683
	dw ObjPalette_004_468b
	dw ObjPalette_004_4693
	dw ObjPalette_004_469b
	dw ObjPalette_004_46a3
	dw ObjPalette_004_46ab
	dw ObjPalette_004_46b3
	dw ObjPalette_004_46bb
	dw ObjPalette_004_46c3
	dw ObjPalette_004_46cb
	dw ObjPalette_004_46d3
	dw ObjPalette_004_46db
	dw ObjPalette_004_46e3
	dw ObjPalette_004_46eb
	dw ObjPalette_004_46f3
	dw ObjPalette_004_46fb
	dw ObjPalette_004_4703
	dw ObjPalette_004_470b
	dw ObjPalette_004_4713
	dw ObjPalette_004_471b
	dw ObjPalette_004_4723
	dw ObjPalette_004_472b
	dw ObjPalette_004_4733
	dw ObjPalette_004_4673
	dw Helen_ObjPalette
	dw ObjPalette_004_473b
	dw ObjPalette_004_4743
	dw ObjPalette_004_474b
	dw ObjPalette_004_4753
	dw ObjPalette_004_475b
	dw ObjPalette_004_4763
	dw ObjPalette_004_476b
	dw ObjPalette_004_44f3
	dw ObjPalette_004_4773
	dw Mitt_ObjPalette
	dw ObjPalette_004_477b
	dw ObjPalette_004_4783
	dw ObjPalette_004_478b
	dw ObjPalette_004_4793
	dw ObjPalette_004_479b
	dw ObjPalette_004_47a3

Ballot_ObjPalette: INCBIN "gfx/sprites/ballot.gbcpal"
Snowy_ObjPalette: INCBIN "gfx/sprites/snowy.gbcpal"
Buck_ObjPalette: INCBIN "gfx/sprites/buck.gbcpal"
Beattro_ObjPalette: INCBIN "gfx/sprites/beattro.gbcpal"
Nina_ObjPalette: INCBIN "gfx/sprites/nina.gbcpal"
Electreep_ObjPalette: INCBIN "gfx/sprites/electreep.gbcpal"
Claude_ObjPalette: INCBIN "gfx/sprites/claude.gbcpal"
Chromanix_ObjPalette: INCBIN "gfx/sprites/chromanix.gbcpal"
Helen_ObjPalette: INCBIN "gfx/sprites/helen.gbcpal"
Merlith_ObjPalette: INCBIN "gfx/sprites/merlith.gbcpal"
Lante_ObjPalette: INCBIN "gfx/sprites/lante.gbcpal"
Muserode_ObjPalette: INCBIN "gfx/sprites/muserode.gbcpal"
Randt_ObjPalette: INCBIN "gfx/sprites/randt.gbcpal"
Signaliton_ObjPalette: INCBIN "gfx/sprites/signaliton.gbcpal"
Mitt_ObjPalette: INCBIN "gfx/sprites/mitt.gbcpal"
Drawvile_ObjPalette: INCBIN "gfx/sprites/drawvile.gbcpal"
Bladeberus_ObjPalette: INCBIN "gfx/sprites/bladeberus.gbcpal"
Saya_ObjPalette: INCBIN "gfx/sprites/saya.gbcpal"
Boy_ObjPalette: INCBIN "gfx/sprites/boy.gbcpal"
Girl_ObjPalette: INCBIN "gfx/sprites/girl.gbcpal"

ObjPalette_004_44c3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 30, 28

ObjPalette_004_44cb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 11, 10
	RGB 31, 30, 28

ObjPalette_004_44d3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 28, 15, 0
	RGB 31, 30, 28

ObjPalette_004_44db:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 25, 0, 25
	RGB 31, 30, 28

ObjPalette_004_44e3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 24, 0
	RGB 31, 30, 29

ObjPalette_004_44eb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 25, 0, 17
	RGB 31, 30, 29

ObjPalette_004_44f3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 10
	RGB 31, 30, 29

ObjPalette_004_44fb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 0, 0
	RGB 31, 30, 29

ObjPalette_004_4503:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 18, 8
	RGB 31, 30, 29

ObjPalette_004_450b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 27, 4, 25
	RGB 31, 30, 29

ObjPalette_004_4513:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 29, 0, 0
	RGB 31, 29, 25

ObjPalette_004_451b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 13, 13, 25
	RGB 30, 30, 30

ObjPalette_004_4523:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 17, 0
	RGB 31, 30, 29

ObjPalette_004_452b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 14, 8, 31
	RGB 31, 30, 29

ObjPalette_004_4533:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 30, 28

ObjPalette_004_453b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 11, 10
	RGB 31, 30, 28

ObjPalette_004_4543:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 28, 15, 0
	RGB 31, 30, 28

ObjPalette_004_454b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 25, 0, 25
	RGB 31, 30, 28

ObjPalette_004_4553:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 10
	RGB 31, 30, 29

ObjPalette_004_455b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 25, 0, 17
	RGB 31, 30, 29

ObjPalette_004_4563:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 20, 31
	RGB 31, 30, 29

ObjPalette_004_456b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 18, 8
	RGB 31, 30, 29

ObjPalette_004_4573:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 17, 0
	RGB 31, 31, 31

ObjPalette_004_457b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 31, 9, 0
	RGB 31, 30, 29

ObjPalette_004_4583:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 30, 28

ObjPalette_004_458b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 20, 31
	RGB 31, 30, 29

ObjPalette_004_4593:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 30, 28

ObjPalette_004_459b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 11, 10
	RGB 31, 30, 28

ObjPalette_004_45a3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 28, 15, 0
	RGB 31, 30, 28

ObjPalette_004_45ab:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 20, 31
	RGB 31, 30, 29

ObjPalette_004_45b3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 17, 10, 0
	RGB 31, 30, 29

ObjPalette_004_45bb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_45c3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 29, 0, 0
	RGB 31, 29, 25

ObjPalette_004_45cb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 25, 0, 17
	RGB 31, 30, 29

ObjPalette_004_45d3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 28, 15, 0
	RGB 31, 30, 28

ObjPalette_004_45db:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 17, 0
	RGB 31, 31, 31

ObjPalette_004_45e3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 17, 0
	RGB 31, 31, 31

ObjPalette_004_45eb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 17, 0
	RGB 31, 31, 31

ObjPalette_004_45f3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 20, 31
	RGB 31, 30, 29

ObjPalette_004_45fb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 16, 16
	RGB 31, 31, 31

ObjPalette_004_4603:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 11, 10
	RGB 31, 30, 28

ObjPalette_004_460b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 16, 16
	RGB 31, 31, 31

ObjPalette_004_4613:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 18, 8
	RGB 31, 30, 29

ObjPalette_004_461b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 13, 13, 25
	RGB 30, 30, 30

ObjPalette_004_4623:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 17, 10, 0
	RGB 31, 30, 29

ObjPalette_004_462b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 16, 16
	RGB 31, 31, 31

ObjPalette_004_4633:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 7, 16, 30
	RGB 31, 30, 29

ObjPalette_004_463b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 16, 16
	RGB 31, 31, 31

ObjPalette_004_4643:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 7, 16, 30
	RGB 31, 30, 29

ObjPalette_004_464b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 13, 13, 25
	RGB 30, 30, 30

ObjPalette_004_4653:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 31, 9, 0
	RGB 31, 30, 29

ObjPalette_004_465b:
	RGB 21, 21, 21
	RGB 27, 10, 0
	RGB 30, 22, 0
	RGB 30, 30, 30

ObjPalette_004_4663:
	RGB 21, 21, 21
	RGB 0, 5, 0
	RGB 0, 17, 0
	RGB 31, 30, 29

ObjPalette_004_466b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 23, 0
	RGB 31, 30, 29

ObjPalette_004_4673:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 30, 28

ObjPalette_004_467b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 16, 26
	RGB 31, 30, 28

ObjPalette_004_4683:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 28, 15, 0
	RGB 31, 30, 28

ObjPalette_004_468b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 11, 10
	RGB 31, 30, 28

ObjPalette_004_4693:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 23, 0
	RGB 31, 30, 29

ObjPalette_004_469b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 28, 15, 0
	RGB 31, 30, 28

ObjPalette_004_46a3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_46ab:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 20, 31
	RGB 31, 30, 29

ObjPalette_004_46b3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_46bb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 25, 0, 17
	RGB 31, 30, 29

ObjPalette_004_46c3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 28, 15, 0
	RGB 31, 30, 28

ObjPalette_004_46cb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 13, 13, 25
	RGB 30, 30, 30

ObjPalette_004_46d3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_46db:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_46e3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 30, 28

ObjPalette_004_46eb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_46f3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 23, 0
	RGB 31, 30, 29

ObjPalette_004_46fb:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 31, 9, 0
	RGB 31, 30, 29

ObjPalette_004_4703:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 20, 31
	RGB 31, 30, 29

ObjPalette_004_470b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 13, 13, 25
	RGB 30, 30, 30

ObjPalette_004_4713:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 29, 0, 0
	RGB 31, 29, 25

ObjPalette_004_471b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 29, 0, 0
	RGB 31, 29, 25

ObjPalette_004_4723:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_472b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29

ObjPalette_004_4733:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 0, 0
	RGB 31, 30, 29

ObjPalette_004_473b:
	RGB 21, 21, 21
	RGB 22, 0, 0
	RGB 30, 13, 0
	RGB 31, 30, 13

ObjPalette_004_4743:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 18, 8
	RGB 31, 30, 29

ObjPalette_004_474b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 18, 8
	RGB 31, 30, 29

ObjPalette_004_4753:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 11, 10
	RGB 31, 30, 28

ObjPalette_004_475b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 14, 8, 31
	RGB 31, 30, 29

ObjPalette_004_4763:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 17, 0
	RGB 31, 31, 31

ObjPalette_004_476b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 14, 8, 31
	RGB 31, 30, 29

ObjPalette_004_4773:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 24, 18, 8
	RGB 31, 30, 29

ObjPalette_004_477b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 0, 19, 19
	RGB 31, 30, 28

ObjPalette_004_4783:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 29, 0, 0
	RGB 31, 30, 29

ObjPalette_004_478b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 14, 8, 31
	RGB 31, 30, 29

ObjPalette_004_4793:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 25, 0, 17
	RGB 31, 30, 29

ObjPalette_004_479b:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 30, 23, 0
	RGB 31, 30, 29

ObjPalette_004_47a3:
	RGB 21, 21, 21
	RGB 0, 0, 0
	RGB 16, 21, 30
	RGB 31, 30, 29
Pointers_004_47ab:
	dw .frame_47e5
	dw .frame_47e5
	dw .frame_47f0
	dw .frame_4819
	dw .frame_4824
	dw .frame_482f
	dw .frame_483a
	dw .frame_483b
	dw .frame_4846
	dw .frame_4847
	dw .frame_4852
	dw .frame_4853
	dw .frame_485e
	dw .frame_485f
	dw .frame_486a
	dw .frame_486b
	dw .frame_4871
	dw .frame_4877
	dw .frame_487d
	dw .frame_4883
	dw .frame_4889
	dw .frame_488f
	dw .frame_4895
	dw .frame_489b
	dw .frame_48a1
	dw .frame_48a7
	dw .frame_48bc
	dw .frame_48d1
	dw .frame_48dc

; each frame: OAM entries (db y, x, unused, tile, attr), $ff-terminated
.frame_47e5
	db $fc, $00, $08, $00, $00
	db $fc, $08, $00, $02, $00
	db $ff
.frame_47f0
	db $00, $00, $18, $70, $01
	db $00, $08, $10, $72, $01
	db $00, $10, $08, $74, $01
	db $00, $18, $00, $76, $01
	db $10, $00, $18, $78, $01
	db $10, $08, $10, $7a, $01
	db $10, $10, $08, $7c, $01
	db $10, $18, $00, $7e, $01
	db $ff
.frame_4819
	db $00, $00, $00, $68, $00
	db $00, $08, $00, $6a, $00
	db $ff
.frame_4824
	db $00, $00, $00, $6c, $00
	db $00, $08, $00, $6e, $00
	db $ff
.frame_482f
	db $00, $00, $00, $54, $00
	db $00, $08, $00, $56, $00
	db $ff
.frame_483a
	db $ff
.frame_483b
	db $00, $00, $00, $58, $00
	db $00, $08, $00, $5a, $00
	db $ff
.frame_4846
	db $ff
.frame_4847
	db $00, $00, $00, $5c, $00
	db $00, $08, $00, $5e, $00
	db $ff
.frame_4852
	db $ff
.frame_4853
	db $00, $00, $00, $60, $00
	db $00, $08, $00, $62, $00
	db $ff
.frame_485e
	db $ff
.frame_485f
	db $00, $00, $00, $64, $00
	db $00, $08, $00, $66, $00
	db $ff
.frame_486a
	db $ff
.frame_486b
	db $00, $00, $00, $54, $01
	db $ff
.frame_4871
	db $00, $00, $00, $56, $01
	db $ff
.frame_4877
	db $00, $00, $00, $58, $01
	db $ff
.frame_487d
	db $00, $00, $00, $5a, $01
	db $ff
.frame_4883
	db $00, $00, $00, $5c, $01
	db $ff
.frame_4889
	db $00, $00, $00, $5e, $01
	db $ff
.frame_488f
	db $00, $00, $00, $60, $01
	db $ff
.frame_4895
	db $00, $00, $00, $62, $01
	db $ff
.frame_489b
	db $00, $00, $00, $64, $01
	db $ff
.frame_48a1
	db $00, $00, $00, $66, $01
	db $ff
.frame_48a7
	db $00, $00, $00, $18, $00
	db $00, $08, $08, $1a, $00
	db $10, $00, $00, $1c, $00
	db $10, $08, $08, $1e, $00
	db $ff
.frame_48bc
	db $00, $00, $00, $20, $00
	db $00, $08, $08, $22, $00
	db $10, $00, $00, $24, $00
	db $10, $08, $08, $26, $00
	db $ff
.frame_48d1
	db $00, $00, $00, $28, $00
	db $00, $08, $08, $2a, $00
	db $ff
.frame_48dc
	db $00, $00, $00, $2c, $00
	db $00, $08, $08, $2e, $00
	db $ff

Sprites00to13GFXPointers::
	dw BallotGFX_Pointers
	dw SnowyGFX_Pointers
	dw BuckGFX_Pointers
	dw BeattroGFX_Pointers
	dw NinaGFX_Pointers
	dw ElectreepGFX_Pointers
	dw ClaudeGFX_Pointers
	dw ChromanixGFX_Pointers
	dw HelenGFX_Pointers
	dw MerlithGFX_Pointers
	dw LanteGFX_Pointers
	dw MuserodeGFX_Pointers
	dw RandtGFX_Pointers
	dw SignalitonGFX_Pointers
	dw MittGFX_Pointers
	dw DrawvileGFX_Pointers
	dw BladeberusGFX_Pointers
	dw SayaGFX_Pointers
	dw BoyGFX_Pointers
	dw GirlGFX_Pointers

BallotGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways
	dw .holding_pda
	dw .hands_up

.facing_down
	dw BallotWalk_Down1_GFX
	dw BallotWalk_Down2_GFX
	dw BallotWalk_Down1_GFX
	dw BallotWalk_Down3_GFX
	dw $eeee

.facing_up
	dw BallotWalk_Up1_GFX
	dw BallotWalk_Up2_GFX
	dw BallotWalk_Up1_GFX
	dw BallotWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw BallotWalk_Sideways1_GFX
	dw BallotWalk_Sideways2_GFX
	dw BallotWalk_Sideways1_GFX
	dw BallotWalk_Sideways3_GFX
	dw $eeee

.holding_pda
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw $ffff

.hands_up
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw $ffff

BallotWalk_Down1_GFX: INCBIN "gfx/sprites/ballot.2bpp", $0, $40

BallotWalk_Down2_GFX: INCBIN "gfx/sprites/ballot.2bpp", $40, $40

BallotWalk_Down3_GFX: INCBIN "gfx/sprites/ballot.2bpp", $80, $40

BallotWalk_Sideways1_GFX: INCBIN "gfx/sprites/ballot.2bpp", $c0, $40

BallotWalk_Sideways2_GFX: INCBIN "gfx/sprites/ballot.2bpp", $100, $40

BallotWalk_Sideways3_GFX: INCBIN "gfx/sprites/ballot.2bpp", $140, $40

BallotWalk_Up1_GFX: INCBIN "gfx/sprites/ballot.2bpp", $180, $40

BallotWalk_Up2_GFX: INCBIN "gfx/sprites/ballot.2bpp", $1c0, $40

BallotWalk_Up3_GFX: INCBIN "gfx/sprites/ballot.2bpp", $200, $40

BallotHoldPDA_GFX: INCBIN "gfx/sprites/ballot.2bpp", $240, $40

BallotHandsUp_GFX: INCBIN "gfx/sprites/ballot.2bpp", $280, $40

SnowyGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw SnowyWalk_Down1_GFX
	dw SnowyWalk_Down2_GFX
	dw SnowyWalk_Down1_GFX
	dw SnowyWalk_Down3_GFX
	dw $eeee

.facing_up
	dw SnowyWalk_Up1_GFX
	dw SnowyWalk_Up2_GFX
	dw SnowyWalk_Up1_GFX
	dw SnowyWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw SnowyWalk_Sideways1_GFX
	dw SnowyWalk_Sideways2_GFX
	dw SnowyWalk_Sideways1_GFX
	dw SnowyWalk_Sideways3_GFX
	dw $eeee

SnowyWalk_Down1_GFX: INCBIN "gfx/sprites/snowy.2bpp", $0, $40

SnowyWalk_Down2_GFX: INCBIN "gfx/sprites/snowy.2bpp", $40, $40

SnowyWalk_Down3_GFX: INCBIN "gfx/sprites/snowy.2bpp", $80, $40

SnowyWalk_Sideways1_GFX: INCBIN "gfx/sprites/snowy.2bpp", $c0, $40

SnowyWalk_Sideways2_GFX: INCBIN "gfx/sprites/snowy.2bpp", $100, $40

SnowyWalk_Sideways3_GFX: INCBIN "gfx/sprites/snowy.2bpp", $140, $40

SnowyWalk_Up1_GFX: INCBIN "gfx/sprites/snowy.2bpp", $180, $40

SnowyWalk_Up2_GFX: INCBIN "gfx/sprites/snowy.2bpp", $1c0, $40

SnowyWalk_Up3_GFX: INCBIN "gfx/sprites/snowy.2bpp", $200, $40

BuckGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw BuckWalk_Down1_GFX
	dw BuckWalk_Down2_GFX
	dw BuckWalk_Down1_GFX
	dw BuckWalk_Down3_GFX
	dw $eeee

.facing_up
	dw BuckWalk_Up1_GFX
	dw BuckWalk_Up2_GFX
	dw BuckWalk_Up1_GFX
	dw BuckWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw BuckWalk_Sideways1_GFX
	dw BuckWalk_Sideways2_GFX
	dw BuckWalk_Sideways1_GFX
	dw BuckWalk_Sideways3_GFX
	dw $eeee

BuckWalk_Down1_GFX: INCBIN "gfx/sprites/buck.2bpp", $0, $40

BuckWalk_Down2_GFX: INCBIN "gfx/sprites/buck.2bpp", $40, $40

BuckWalk_Down3_GFX: INCBIN "gfx/sprites/buck.2bpp", $80, $40

BuckWalk_Sideways1_GFX: INCBIN "gfx/sprites/buck.2bpp", $c0, $40

BuckWalk_Sideways2_GFX: INCBIN "gfx/sprites/buck.2bpp", $100, $40

BuckWalk_Sideways3_GFX: INCBIN "gfx/sprites/buck.2bpp", $140, $40

BuckWalk_Up1_GFX: INCBIN "gfx/sprites/buck.2bpp", $180, $40

BuckWalk_Up2_GFX: INCBIN "gfx/sprites/buck.2bpp", $1c0, $40

BuckWalk_Up3_GFX: INCBIN "gfx/sprites/buck.2bpp", $200, $40

BeattroGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw BeattroWalk_Down1_GFX
	dw BeattroWalk_Down2_GFX
	dw BeattroWalk_Down1_GFX
	dw BeattroWalk_Down3_GFX
	dw $eeee

.facing_up
	dw BeattroWalk_Up1_GFX
	dw BeattroWalk_Up2_GFX
	dw BeattroWalk_Up1_GFX
	dw BeattroWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw BeattroWalk_Sideways1_GFX
	dw BeattroWalk_Sideways2_GFX
	dw BeattroWalk_Sideways1_GFX
	dw BeattroWalk_Sideways3_GFX
	dw $eeee

BeattroWalk_Down1_GFX: INCBIN "gfx/sprites/beattro.2bpp", $0, $40

BeattroWalk_Down2_GFX: INCBIN "gfx/sprites/beattro.2bpp", $40, $40

BeattroWalk_Down3_GFX: INCBIN "gfx/sprites/beattro.2bpp", $80, $40

BeattroWalk_Sideways1_GFX: INCBIN "gfx/sprites/beattro.2bpp", $c0, $40

BeattroWalk_Sideways2_GFX: INCBIN "gfx/sprites/beattro.2bpp", $100, $40

BeattroWalk_Sideways3_GFX: INCBIN "gfx/sprites/beattro.2bpp", $140, $40

BeattroWalk_Up1_GFX: INCBIN "gfx/sprites/beattro.2bpp", $180, $40

BeattroWalk_Up2_GFX: INCBIN "gfx/sprites/beattro.2bpp", $1c0, $40

BeattroWalk_Up3_GFX: INCBIN "gfx/sprites/beattro.2bpp", $200, $40

NinaGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw NinaWalk_Down1_GFX
	dw NinaWalk_Down2_GFX
	dw NinaWalk_Down1_GFX
	dw NinaWalk_Down3_GFX
	dw $eeee

.facing_up
	dw NinaWalk_Up1_GFX
	dw NinaWalk_Up2_GFX
	dw NinaWalk_Up1_GFX
	dw NinaWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw NinaWalk_Sideways1_GFX
	dw NinaWalk_Sideways2_GFX
	dw NinaWalk_Sideways1_GFX
	dw NinaWalk_Sideways3_GFX
	dw $eeee

NinaWalk_Down1_GFX: INCBIN "gfx/sprites/nina.2bpp", $0, $40

NinaWalk_Down2_GFX: INCBIN "gfx/sprites/nina.2bpp", $40, $40

NinaWalk_Down3_GFX: INCBIN "gfx/sprites/nina.2bpp", $80, $40

NinaWalk_Sideways1_GFX: INCBIN "gfx/sprites/nina.2bpp", $c0, $40

NinaWalk_Sideways2_GFX: INCBIN "gfx/sprites/nina.2bpp", $100, $40

NinaWalk_Sideways3_GFX: INCBIN "gfx/sprites/nina.2bpp", $140, $40

NinaWalk_Up1_GFX: INCBIN "gfx/sprites/nina.2bpp", $180, $40

NinaWalk_Up2_GFX: INCBIN "gfx/sprites/nina.2bpp", $1c0, $40

NinaWalk_Up3_GFX: INCBIN "gfx/sprites/nina.2bpp", $200, $40

ElectreepGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw ElectreepWalk_Down1_GFX
	dw ElectreepWalk_Down2_GFX
	dw ElectreepWalk_Down1_GFX
	dw ElectreepWalk_Down3_GFX
	dw $eeee

.facing_up
	dw ElectreepWalk_Up1_GFX
	dw ElectreepWalk_Up2_GFX
	dw ElectreepWalk_Up1_GFX
	dw ElectreepWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw ElectreepWalk_Sideways1_GFX
	dw ElectreepWalk_Sideways2_GFX
	dw ElectreepWalk_Sideways1_GFX
	dw ElectreepWalk_Sideways3_GFX
	dw $eeee

ElectreepWalk_Down1_GFX: INCBIN "gfx/sprites/electreep.2bpp", $0, $40

ElectreepWalk_Down2_GFX: INCBIN "gfx/sprites/electreep.2bpp", $40, $40

ElectreepWalk_Down3_GFX: INCBIN "gfx/sprites/electreep.2bpp", $80, $40

ElectreepWalk_Sideways1_GFX: INCBIN "gfx/sprites/electreep.2bpp", $c0, $40

ElectreepWalk_Sideways2_GFX: INCBIN "gfx/sprites/electreep.2bpp", $100, $40

ElectreepWalk_Sideways3_GFX: INCBIN "gfx/sprites/electreep.2bpp", $140, $40

ElectreepWalk_Up1_GFX: INCBIN "gfx/sprites/electreep.2bpp", $180, $40

ElectreepWalk_Up2_GFX: INCBIN "gfx/sprites/electreep.2bpp", $1c0, $40

ElectreepWalk_Up3_GFX: INCBIN "gfx/sprites/electreep.2bpp", $200, $40

ClaudeGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw ClaudeWalking_Down1_GFX
	dw ClaudeWalking_Down2_GFX
	dw ClaudeWalking_Down1_GFX
	dw ClaudeWalking_Down3_GFX
	dw $eeee

.facing_up
	dw ClaudeWalking_Up1_GFX
	dw ClaudeWalking_Up2_GFX
	dw ClaudeWalking_Up1_GFX
	dw ClaudeWalking_Up3_GFX
	dw $eeee

.facing_sideways
	dw ClaudeWalking_Sideways1_GFX
	dw ClaudeWalking_Sideways2_GFX
	dw ClaudeWalking_Sideways1_GFX
	dw ClaudeWalking_Sideways3_GFX
	dw $eeee

ClaudeWalking_Down1_GFX: INCBIN "gfx/sprites/claude.2bpp", $0, $40

ClaudeWalking_Down2_GFX: INCBIN "gfx/sprites/claude.2bpp", $40, $40

ClaudeWalking_Down3_GFX: INCBIN "gfx/sprites/claude.2bpp", $80, $40

ClaudeWalking_Sideways1_GFX: INCBIN "gfx/sprites/claude.2bpp", $c0, $40

ClaudeWalking_Sideways2_GFX: INCBIN "gfx/sprites/claude.2bpp", $100, $40

ClaudeWalking_Sideways3_GFX: INCBIN "gfx/sprites/claude.2bpp", $140, $40

ClaudeWalking_Up1_GFX: INCBIN "gfx/sprites/claude.2bpp", $180, $40

ClaudeWalking_Up2_GFX: INCBIN "gfx/sprites/claude.2bpp", $1c0, $40

ClaudeWalking_Up3_GFX: INCBIN "gfx/sprites/claude.2bpp", $200, $40

ChromanixGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw ChromanixWalking_Down1_GFX
	dw ChromanixWalking_Down2_GFX
	dw ChromanixWalking_Down1_GFX
	dw ChromanixWalking_Down3_GFX
	dw $eeee

.facing_up
	dw ChromanixWalking_Up1_GFX
	dw ChromanixWalking_Up2_GFX
	dw ChromanixWalking_Up1_GFX
	dw ChromanixWalking_Up3_GFX
	dw $eeee

.facing_sideways
	dw ChromanixWalking_Sideways1_GFX
	dw ChromanixWalking_Sideways2_GFX
	dw ChromanixWalking_Sideways1_GFX
	dw ChromanixWalking_Sideways3_GFX
	dw $eeee

ChromanixWalking_Down1_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $0, $40

ChromanixWalking_Down2_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $40, $40

ChromanixWalking_Down3_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $80, $40

ChromanixWalking_Sideways1_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $c0, $40

ChromanixWalking_Sideways2_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $100, $40

ChromanixWalking_Sideways3_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $140, $40

ChromanixWalking_Up1_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $180, $40

ChromanixWalking_Up2_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $1c0, $40

ChromanixWalking_Up3_GFX: INCBIN "gfx/sprites/chromanix.2bpp", $200, $40

HelenGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways
	dw .eyes_closed

.facing_down
	dw HelenWalking_Down1_GFX
	dw HelenWalking_Down2_GFX
	dw HelenWalking_Down1_GFX
	dw HelenWalking_Down3_GFX
	dw $eeee

.facing_up
	dw HelenWalking_Up1_GFX
	dw HelenWalking_Up2_GFX
	dw HelenWalking_Up1_GFX
	dw HelenWalking_Up3_GFX
	dw $eeee

.facing_sideways
	dw HelenWalking_Sideways1_GFX
	dw HelenWalking_Sideways2_GFX
	dw HelenWalking_Sideways1_GFX
	dw HelenWalking_Sideways3_GFX
	dw $eeee

.eyes_closed
	dw HelenEyesClosedFacingDown_GFX
	dw HelenEyesClosedFacingDown_GFX
	dw $ffff

HelenWalking_Down1_GFX: INCBIN "gfx/sprites/helen.2bpp", $0, $40

HelenWalking_Down2_GFX: INCBIN "gfx/sprites/helen.2bpp", $40, $40

HelenWalking_Down3_GFX: INCBIN "gfx/sprites/helen.2bpp", $80, $40

HelenWalking_Sideways1_GFX: INCBIN "gfx/sprites/helen.2bpp", $c0, $40

HelenWalking_Sideways2_GFX: INCBIN "gfx/sprites/helen.2bpp", $100, $40

HelenWalking_Sideways3_GFX: INCBIN "gfx/sprites/helen.2bpp", $140, $40

HelenWalking_Up1_GFX: INCBIN "gfx/sprites/helen.2bpp", $180, $40

HelenWalking_Up2_GFX: INCBIN "gfx/sprites/helen.2bpp", $1c0, $40

HelenWalking_Up3_GFX: INCBIN "gfx/sprites/helen.2bpp", $200, $40

HelenEyesClosedFacingDown_GFX: INCBIN "gfx/sprites/helen.2bpp", $240, $40

MerlithGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw MerlithWalk_Down1_GFX
	dw MerlithWalk_Down2_GFX
	dw MerlithWalk_Down1_GFX
	dw MerlithWalk_Down3_GFX
	dw $eeee

.facing_up
	dw MerlithWalk_Up1_GFX
	dw MerlithWalk_Up2_GFX
	dw MerlithWalk_Up1_GFX
	dw MerlithWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw MerlithWalk_Sideways1_GFX
	dw MerlithWalk_Sideways2_GFX
	dw MerlithWalk_Sideways1_GFX
	dw MerlithWalk_Sideways3_GFX
	dw $eeee

MerlithWalk_Down1_GFX: INCBIN "gfx/sprites/merlith.2bpp", $0, $40

MerlithWalk_Down2_GFX: INCBIN "gfx/sprites/merlith.2bpp", $40, $40

MerlithWalk_Down3_GFX: INCBIN "gfx/sprites/merlith.2bpp", $80, $40

MerlithWalk_Sideways1_GFX: INCBIN "gfx/sprites/merlith.2bpp", $c0, $40

MerlithWalk_Sideways2_GFX: INCBIN "gfx/sprites/merlith.2bpp", $100, $40

MerlithWalk_Sideways3_GFX: INCBIN "gfx/sprites/merlith.2bpp", $140, $40

MerlithWalk_Up1_GFX: INCBIN "gfx/sprites/merlith.2bpp", $180, $40

MerlithWalk_Up2_GFX: INCBIN "gfx/sprites/merlith.2bpp", $1c0, $40

MerlithWalk_Up3_GFX: INCBIN "gfx/sprites/merlith.2bpp", $200, $40

LanteGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw LanteWalk_Down1_GFX
	dw LanteWalk_Down2_GFX
	dw LanteWalk_Down1_GFX
	dw LanteWalk_Down3_GFX
	dw $eeee

.facing_up
	dw LanteWalk_Up1_GFX
	dw LanteWalk_Up2_GFX
	dw LanteWalk_Up1_GFX
	dw LanteWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw LanteWalk_Sideways1_GFX
	dw LanteWalk_Sideways2_GFX
	dw LanteWalk_Sideways1_GFX
	dw LanteWalk_Sideways3_GFX
	dw $eeee

LanteWalk_Down1_GFX: INCBIN "gfx/sprites/lante.2bpp", $0, $40

LanteWalk_Down2_GFX: INCBIN "gfx/sprites/lante.2bpp", $40, $40

LanteWalk_Down3_GFX: INCBIN "gfx/sprites/lante.2bpp", $80, $40

LanteWalk_Sideways1_GFX: INCBIN "gfx/sprites/lante.2bpp", $c0, $40

LanteWalk_Sideways2_GFX: INCBIN "gfx/sprites/lante.2bpp", $100, $40

LanteWalk_Sideways3_GFX: INCBIN "gfx/sprites/lante.2bpp", $140, $40

LanteWalk_Up1_GFX: INCBIN "gfx/sprites/lante.2bpp", $180, $40

LanteWalk_Up2_GFX: INCBIN "gfx/sprites/lante.2bpp", $1c0, $40

LanteWalk_Up3_GFX: INCBIN "gfx/sprites/lante.2bpp", $200, $40

MuserodeGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw MuserodeWalk_Down1_GFX
	dw MuserodeWalk_Down2_GFX
	dw MuserodeWalk_Down1_GFX
	dw MuserodeWalk_Down3_GFX
	dw $eeee

.facing_up
	dw MuserodeWalk_Up1_GFX
	dw MuserodeWalk_Up2_GFX
	dw MuserodeWalk_Up1_GFX
	dw MuserodeWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw MuserodeWalk_Sideways1_GFX
	dw MuserodeWalk_Sideways2_GFX
	dw MuserodeWalk_Sideways1_GFX
	dw MuserodeWalk_Sideways3_GFX
	dw $eeee

MuserodeWalk_Down1_GFX: INCBIN "gfx/sprites/muserode.2bpp", $0, $40

MuserodeWalk_Down2_GFX: INCBIN "gfx/sprites/muserode.2bpp", $40, $40

MuserodeWalk_Down3_GFX: INCBIN "gfx/sprites/muserode.2bpp", $80, $40

MuserodeWalk_Sideways1_GFX: INCBIN "gfx/sprites/muserode.2bpp", $c0, $40

MuserodeWalk_Sideways2_GFX: INCBIN "gfx/sprites/muserode.2bpp", $100, $40

MuserodeWalk_Sideways3_GFX: INCBIN "gfx/sprites/muserode.2bpp", $140, $40

MuserodeWalk_Up1_GFX: INCBIN "gfx/sprites/muserode.2bpp", $180, $40

MuserodeWalk_Up2_GFX: INCBIN "gfx/sprites/muserode.2bpp", $1c0, $40

MuserodeWalk_Up3_GFX: INCBIN "gfx/sprites/muserode.2bpp", $200, $40

RandtGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw RandtWalk_Down1_GFX
	dw RandtWalk_Down2_GFX
	dw RandtWalk_Down1_GFX
	dw RandtWalk_Down3_GFX
	dw $eeee

.facing_up
	dw RandtWalk_Up1_GFX
	dw RandtWalk_Up2_GFX
	dw RandtWalk_Up1_GFX
	dw RandtWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw RandtWalk_Sideways1_GFX
	dw RandtWalk_Sideways2_GFX
	dw RandtWalk_Sideways1_GFX
	dw RandtWalk_Sideways3_GFX
	dw $eeee

RandtWalk_Down1_GFX: INCBIN "gfx/sprites/randt.2bpp", $0, $40

RandtWalk_Down2_GFX: INCBIN "gfx/sprites/randt.2bpp", $40, $40

RandtWalk_Down3_GFX: INCBIN "gfx/sprites/randt.2bpp", $80, $40

RandtWalk_Sideways1_GFX: INCBIN "gfx/sprites/randt.2bpp", $c0, $40

RandtWalk_Sideways2_GFX: INCBIN "gfx/sprites/randt.2bpp", $100, $40

RandtWalk_Sideways3_GFX: INCBIN "gfx/sprites/randt.2bpp", $140, $40

RandtWalk_Up1_GFX: INCBIN "gfx/sprites/randt.2bpp", $180, $40

RandtWalk_Up2_GFX: INCBIN "gfx/sprites/randt.2bpp", $1c0, $40

RandtWalk_Up3_GFX: INCBIN "gfx/sprites/randt.2bpp", $200, $40

SignalitonGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways
	dw .flashing

.flashing
	dw SignalitonFlash_GFX
	dw SignalitonWalk_Down1_GFX
	dw SignalitonFlash_GFX
	dw SignalitonWalk_Down1_GFX
	dw $eeee

.facing_down
	dw SignalitonWalk_Down1_GFX
	dw SignalitonWalk_Down2_GFX
	dw SignalitonWalk_Down1_GFX
	dw SignalitonWalk_Down3_GFX
	dw $eeee

.facing_up
	dw SignalitonWalk_Up1_GFX
	dw SignalitonWalk_Up2_GFX
	dw SignalitonWalk_Up1_GFX
	dw SignalitonWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw SignalitonWalk_Sideways1_GFX
	dw SignalitonWalk_Sideways2_GFX
	dw SignalitonWalk_Sideways1_GFX
	dw SignalitonWalk_Sideways3_GFX
	dw $eeee

SignalitonWalk_Down1_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $0, $40

SignalitonWalk_Down2_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $40, $40

SignalitonWalk_Down3_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $80, $40

SignalitonWalk_Sideways1_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $c0, $40

SignalitonWalk_Sideways2_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $100, $40

SignalitonWalk_Sideways3_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $140, $40

SignalitonWalk_Up1_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $180, $40

SignalitonWalk_Up2_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $1c0, $40

SignalitonWalk_Up3_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $200, $40

SignalitonFlash_GFX: INCBIN "gfx/sprites/signaliton.2bpp", $240, $40

MittGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw MittWalk_Down1_GFX
	dw MittWalk_Down2_GFX
	dw MittWalk_Down1_GFX
	dw MittWalk_Down3_GFX
	dw $eeee

.facing_up
	dw MittWalk_Up1_GFX
	dw MittWalk_Up2_GFX
	dw MittWalk_Up1_GFX
	dw MittWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw MittWalk_Sideways1_GFX
	dw MittWalk_Sideways2_GFX
	dw MittWalk_Sideways1_GFX
	dw MittWalk_Sideways3_GFX
	dw $eeee

MittWalk_Down1_GFX: INCBIN "gfx/sprites/mitt.2bpp", $0, $40

MittWalk_Down2_GFX: INCBIN "gfx/sprites/mitt.2bpp", $40, $40

MittWalk_Down3_GFX: INCBIN "gfx/sprites/mitt.2bpp", $80, $40

MittWalk_Sideways1_GFX: INCBIN "gfx/sprites/mitt.2bpp", $c0, $40

MittWalk_Sideways2_GFX: INCBIN "gfx/sprites/mitt.2bpp", $100, $40

MittWalk_Sideways3_GFX: INCBIN "gfx/sprites/mitt.2bpp", $140, $40

MittWalk_Up1_GFX: INCBIN "gfx/sprites/mitt.2bpp", $180, $40

MittWalk_Up2_GFX: INCBIN "gfx/sprites/mitt.2bpp", $1c0, $40

MittWalk_Up3_GFX: INCBIN "gfx/sprites/mitt.2bpp", $200, $40

DrawvileGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways
	dw .spinning

.spinning
	dw DrawvileWalk_Down1_GFX
	dw DrawvileFacing_Left_GFX
	dw DrawvileWalk_Up1_GFX
	dw DrawvileFacing_Right_GFX
	dw $eeee

.facing_down
	dw DrawvileWalk_Down1_GFX
	dw DrawvileWalk_Down2_GFX
	dw DrawvileWalk_Down1_GFX
	dw DrawvileWalk_Down3_GFX
	dw $eeee

.facing_up
	dw DrawvileWalk_Up1_GFX
	dw DrawvileWalk_Up2_GFX
	dw DrawvileWalk_Up1_GFX
	dw DrawvileWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw DrawvileWalk_Sideways1_GFX
	dw DrawvileWalk_Sideways2_GFX
	dw DrawvileWalk_Sideways1_GFX
	dw DrawvileWalk_Sideways3_GFX
	dw $eeee

DrawvileWalk_Down1_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $0, $40

DrawvileWalk_Down2_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $40, $40

DrawvileWalk_Down3_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $80, $40

DrawvileWalk_Sideways1_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $c0, $40

DrawvileWalk_Sideways2_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $100, $40

DrawvileWalk_Sideways3_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $140, $40

DrawvileWalk_Up1_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $180, $40

DrawvileWalk_Up2_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $1c0, $40

DrawvileWalk_Up3_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $200, $40

DrawvileFacing_Left_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $240, $40

DrawvileFacing_Right_GFX: INCBIN "gfx/sprites/drawvile.2bpp", $280, $40

BladeberusGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw BladeberusWalk_Down1_GFX
	dw BladeberusWalk_Down2_GFX
	dw BladeberusWalk_Down1_GFX
	dw BladeberusWalk_Down3_GFX
	dw $eeee

.facing_up
	dw BladeberusWalk_Up1_GFX
	dw BladeberusWalk_Up2_GFX
	dw BladeberusWalk_Up1_GFX
	dw BladeberusWalk_Up3_GFX
	dw $eeee

.facing_sideways
	dw BladeberusWalk_Sideways1_GFX
	dw BladeberusWalk_Sideways2_GFX
	dw BladeberusWalk_Sideways1_GFX
	dw BladeberusWalk_Sideways3_GFX
	dw $eeee

BladeberusWalk_Down1_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $0, $40

BladeberusWalk_Down2_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $40, $40

BladeberusWalk_Down3_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $80, $40

BladeberusWalk_Sideways1_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $c0, $40

BladeberusWalk_Sideways2_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $100, $40

BladeberusWalk_Sideways3_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $140, $40

BladeberusWalk_Up1_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $180, $40

BladeberusWalk_Up2_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $1c0, $40

BladeberusWalk_Up3_GFX: INCBIN "gfx/sprites/bladeberus.2bpp", $200, $40

SayaGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw SayaWalk_Down1_GFX
	dw SayaWalk_Down2_GFX
	dw SayaWalk_Down1_GFX
	dw SayaWalk_Down3_GFX
	dw $ffff

.facing_up
	dw SayaWalk_Up1_GFX
	dw SayaWalk_Up2_GFX
	dw SayaWalk_Up1_GFX
	dw SayaWalk_Up3_GFX
	dw $ffff

.facing_sideways
	dw SayaWalk_Sideways1_GFX
	dw SayaWalk_Sideways2_GFX
	dw SayaWalk_Sideways1_GFX
	dw SayaWalk_Sideways3_GFX
	dw $ffff

SayaWalk_Down1_GFX: INCBIN "gfx/sprites/saya.2bpp", $0, $40

SayaWalk_Down2_GFX: INCBIN "gfx/sprites/saya.2bpp", $40, $40

SayaWalk_Down3_GFX: INCBIN "gfx/sprites/saya.2bpp", $80, $40

SayaWalk_Sideways1_GFX: INCBIN "gfx/sprites/saya.2bpp", $c0, $40

SayaWalk_Sideways2_GFX: INCBIN "gfx/sprites/saya.2bpp", $100, $40

SayaWalk_Sideways3_GFX: INCBIN "gfx/sprites/saya.2bpp", $140, $40

SayaWalk_Up1_GFX: INCBIN "gfx/sprites/saya.2bpp", $180, $40

SayaWalk_Up2_GFX: INCBIN "gfx/sprites/saya.2bpp", $1c0, $40

SayaWalk_Up3_GFX: INCBIN "gfx/sprites/saya.2bpp", $200, $40

BoyGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw BoyWalk_Down1_GFX
	dw BoyWalk_Down2_GFX
	dw BoyWalk_Down1_GFX
	dw BoyWalk_Down3_GFX
	dw $ffff

.facing_up
	dw BoyWalk_Up1_GFX
	dw BoyWalk_Up2_GFX
	dw BoyWalk_Up1_GFX
	dw BoyWalk_Up3_GFX
	dw $ffff

.facing_sideways
	dw BoyWalk_Sideways1_GFX
	dw BoyWalk_Sideways2_GFX
	dw BoyWalk_Sideways1_GFX
	dw BoyWalk_Sideways3_GFX
	dw $ffff

BoyWalk_Down1_GFX: INCBIN "gfx/sprites/boy.2bpp", $0, $40

BoyWalk_Down2_GFX: INCBIN "gfx/sprites/boy.2bpp", $40, $40

BoyWalk_Down3_GFX: INCBIN "gfx/sprites/boy.2bpp", $80, $40

BoyWalk_Sideways1_GFX: INCBIN "gfx/sprites/boy.2bpp", $c0, $40

BoyWalk_Sideways2_GFX: INCBIN "gfx/sprites/boy.2bpp", $100, $40

BoyWalk_Sideways3_GFX: INCBIN "gfx/sprites/boy.2bpp", $140, $40

BoyWalk_Up1_GFX: INCBIN "gfx/sprites/boy.2bpp", $180, $40

BoyWalk_Up2_GFX: INCBIN "gfx/sprites/boy.2bpp", $1c0, $40

BoyWalk_Up3_GFX: INCBIN "gfx/sprites/boy.2bpp", $200, $40

GirlGFX_Pointers:
	dw .facing_down
	dw .facing_up
	dw .facing_sideways
	dw .facing_sideways

.facing_down
	dw GirlWalk_Down1_GFX
	dw GirlWalk_Down2_GFX
	dw GirlWalk_Down1_GFX
	dw GirlWalk_Down3_GFX
	dw $ffff

.facing_up
	dw GirlWalk_Up1_GFX
	dw GirlWalk_Up2_GFX
	dw GirlWalk_Up1_GFX
	dw GirlWalk_Up3_GFX
	dw $ffff

.facing_sideways
	dw GirlWalk_Sideways1_GFX
	dw GirlWalk_Sideways2_GFX
	dw GirlWalk_Sideways1_GFX
	dw GirlWalk_Sideways3_GFX
	dw $ffff

GirlWalk_Down1_GFX: INCBIN "gfx/sprites/girl.2bpp", $0, $40

GirlWalk_Down2_GFX: INCBIN "gfx/sprites/girl.2bpp", $40, $40

GirlWalk_Down3_GFX: INCBIN "gfx/sprites/girl.2bpp", $80, $40

GirlWalk_Sideways1_GFX: INCBIN "gfx/sprites/girl.2bpp", $c0, $40

GirlWalk_Sideways2_GFX: INCBIN "gfx/sprites/girl.2bpp", $100, $40

GirlWalk_Sideways3_GFX: INCBIN "gfx/sprites/girl.2bpp", $140, $40

GirlWalk_Up1_GFX: INCBIN "gfx/sprites/girl.2bpp", $180, $40

GirlWalk_Up2_GFX: INCBIN "gfx/sprites/girl.2bpp", $1c0, $40

GirlWalk_Up3_GFX: INCBIN "gfx/sprites/girl.2bpp", $200, $40
