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
	ld hl, $47ab
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
	ld de, $47ab
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
	ldh a, [$ffbc]
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
	ld de, $47ab
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
	ld hl, $47ab
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
	ld hl, $47ab
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
	ldh a, [$ffbc]
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
	ld a, [$cd2a]
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
	ldh a, [$ff91]
	cp $11
	ret nz
	ld hl, $47ab
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
	ld de, unk_004_4337
	ld a, [wPlayerSpriteID]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, $cb70
	ld bc, $0008
	call CopyBytes3
	pop hl
	ld de, wcaf0
	ld bc, $0008
	call CopyBytes3
	ld de, unk_004_4337
	ld a, [wcd24]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, $cb70
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
	ld de, unk_004_4337
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

unk_004_4337::
	dr $10337, $108e7

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
	dw BallotGFX_FacingDown_Pointers
	dw BallotGFX_FacingUp_Pointers
	dw BallotGFX_FacingSideways_Pointers
	dw BallotGFX_FacingSideways_Pointers
	dw BallotGFX_HoldingPDA_Pointers
	dw BallotGFX_HandsUp_Pointers

BallotGFX_FacingDown_Pointers:
	dw BallotWalk_Down1_GFX
	dw BallotWalk_Down2_GFX
	dw BallotWalk_Down1_GFX
	dw BallotWalk_Down3_GFX
	dw $eeee

BallotGFX_FacingUp_Pointers:
	dw BallotWalk_Up1_GFX
	dw BallotWalk_Up2_GFX
	dw BallotWalk_Up1_GFX
	dw BallotWalk_Up3_GFX
	dw $eeee

BallotGFX_FacingSideways_Pointers:
	dw BallotWalk_Sideways1_GFX
	dw BallotWalk_Sideways2_GFX
	dw BallotWalk_Sideways1_GFX
	dw BallotWalk_Sideways3_GFX
	dw $eeee

BallotGFX_HoldingPDA_Pointers:
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw $ffff

BallotGFX_HandsUp_Pointers:
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw $ffff

BallotWalk_Down1_GFX:
	INCBIN "gfx/sprites/ballot/down1.2bpp"

BallotWalk_Down2_GFX:
	INCBIN "gfx/sprites/ballot/down2.2bpp"

BallotWalk_Down3_GFX:
	INCBIN "gfx/sprites/ballot/down3.2bpp"

BallotWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/ballot/side1.2bpp"

BallotWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/ballot/side2.2bpp"

BallotWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/ballot/side3.2bpp"

BallotWalk_Up1_GFX:
	INCBIN "gfx/sprites/ballot/up1.2bpp"

BallotWalk_Up2_GFX:
	INCBIN "gfx/sprites/ballot/up2.2bpp"

BallotWalk_Up3_GFX:
	INCBIN "gfx/sprites/ballot/up3.2bpp"

BallotHoldPDA_GFX:
	INCBIN "gfx/sprites/ballot/pda.2bpp"

BallotHandsUp_GFX:
	INCBIN "gfx/sprites/ballot/hands_up.2bpp"

SnowyGFX_Pointers:
	dw SnowyGFX_FacingDown_Pointers
	dw SnowyGFX_FacingUp_Pointers
	dw SnowyGFX_FacingSideways_Pointers
	dw SnowyGFX_FacingSideways_Pointers

SnowyGFX_FacingDown_Pointers:
	dw SnowyWalk_Down1_GFX
	dw SnowyWalk_Down2_GFX
	dw SnowyWalk_Down1_GFX
	dw SnowyWalk_Down3_GFX
	dw $eeee

SnowyGFX_FacingUp_Pointers:
	dw SnowyWalk_Up1_GFX
	dw SnowyWalk_Up2_GFX
	dw SnowyWalk_Up1_GFX
	dw SnowyWalk_Up3_GFX
	dw $eeee

SnowyGFX_FacingSideways_Pointers:
	dw SnowyWalk_Sideways1_GFX
	dw SnowyWalk_Sideways2_GFX
	dw SnowyWalk_Sideways1_GFX
	dw SnowyWalk_Sideways3_GFX
	dw $eeee

SnowyWalk_Down1_GFX:
	INCBIN "gfx/sprites/snowy/down1.2bpp"

SnowyWalk_Down2_GFX:
	INCBIN "gfx/sprites/snowy/down2.2bpp"

SnowyWalk_Down3_GFX:
	INCBIN "gfx/sprites/snowy/down3.2bpp"

SnowyWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/snowy/side1.2bpp"

SnowyWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/snowy/side2.2bpp"

SnowyWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/snowy/side3.2bpp"

SnowyWalk_Up1_GFX:
	INCBIN "gfx/sprites/snowy/up1.2bpp"

SnowyWalk_Up2_GFX:
	INCBIN "gfx/sprites/snowy/up2.2bpp"

SnowyWalk_Up3_GFX:
	INCBIN "gfx/sprites/snowy/up3.2bpp"

BuckGFX_Pointers:
	dw BuckGFX_FacingDown_Pointers
	dw BuckGFX_FacingUp_Pointers
	dw BuckGFX_FacingSideways_Pointers
	dw BuckGFX_FacingSideways_Pointers

BuckGFX_FacingDown_Pointers:
	dw BuckWalk_Down1_GFX
	dw BuckWalk_Down2_GFX
	dw BuckWalk_Down1_GFX
	dw BuckWalk_Down3_GFX
	dw $eeee

BuckGFX_FacingUp_Pointers:
	dw BuckWalk_Up1_GFX
	dw BuckWalk_Up2_GFX
	dw BuckWalk_Up1_GFX
	dw BuckWalk_Up3_GFX
	dw $eeee

BuckGFX_FacingSideways_Pointers:
	dw BuckWalk_Sideways1_GFX
	dw BuckWalk_Sideways2_GFX
	dw BuckWalk_Sideways1_GFX
	dw BuckWalk_Sideways3_GFX
	dw $eeee

BuckWalk_Down1_GFX:
	INCBIN "gfx/sprites/buck/down1.2bpp"

BuckWalk_Down2_GFX:
	INCBIN "gfx/sprites/buck/down2.2bpp"

BuckWalk_Down3_GFX:
	INCBIN "gfx/sprites/buck/down3.2bpp"

BuckWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/buck/side1.2bpp"

BuckWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/buck/side2.2bpp"

BuckWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/buck/side3.2bpp"

BuckWalk_Up1_GFX:
	INCBIN "gfx/sprites/buck/up1.2bpp"

BuckWalk_Up2_GFX:
	INCBIN "gfx/sprites/buck/up2.2bpp"

BuckWalk_Up3_GFX:
	INCBIN "gfx/sprites/buck/up3.2bpp"

BeattroGFX_Pointers:
	dw BeattroGFX_FacingDown_Pointers
	dw BeattroGFX_FacingUp_Pointers
	dw BeattroGFX_FacingSideways_Pointers
	dw BeattroGFX_FacingSideways_Pointers

BeattroGFX_FacingDown_Pointers:
	dw BeattroWalk_Down1_GFX
	dw BeattroWalk_Down2_GFX
	dw BeattroWalk_Down1_GFX
	dw BeattroWalk_Down3_GFX
	dw $eeee

BeattroGFX_FacingUp_Pointers:
	dw BeattroWalk_Up1_GFX
	dw BeattroWalk_Up2_GFX
	dw BeattroWalk_Up1_GFX
	dw BeattroWalk_Up3_GFX
	dw $eeee

BeattroGFX_FacingSideways_Pointers:
	dw BeattroWalk_Sideways1_GFX
	dw BeattroWalk_Sideways2_GFX
	dw BeattroWalk_Sideways1_GFX
	dw BeattroWalk_Sideways3_GFX
	dw $eeee

BeattroWalk_Down1_GFX:
	INCBIN "gfx/sprites/beattro/down1.2bpp"

BeattroWalk_Down2_GFX:
	INCBIN "gfx/sprites/beattro/down2.2bpp"

BeattroWalk_Down3_GFX:
	INCBIN "gfx/sprites/beattro/down3.2bpp"

BeattroWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/beattro/side1.2bpp"

BeattroWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/beattro/side2.2bpp"

BeattroWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/beattro/side3.2bpp"

BeattroWalk_Up1_GFX:
	INCBIN "gfx/sprites/beattro/up1.2bpp"

BeattroWalk_Up2_GFX:
	INCBIN "gfx/sprites/beattro/up2.2bpp"

BeattroWalk_Up3_GFX:
	INCBIN "gfx/sprites/beattro/up3.2bpp"

NinaGFX_Pointers:
	dw NinaGFX_FacingDown_Pointers
	dw NinaGFX_FacingUp_Pointers
	dw NinaGFX_FacingSideway_Pointers
	dw NinaGFX_FacingSideway_Pointers

NinaGFX_FacingDown_Pointers:
	dw NinaWalk_Down1_GFX
	dw NinaWalk_Down2_GFX
	dw NinaWalk_Down1_GFX
	dw NinaWalk_Down3_GFX
	dw $eeee

NinaGFX_FacingUp_Pointers:
	dw NinaWalk_Up1_GFX
	dw NinaWalk_Up2_GFX
	dw NinaWalk_Up1_GFX
	dw NinaWalk_Up3_GFX
	dw $eeee

NinaGFX_FacingSideway_Pointers:
	dw NinaWalk_Sideways1_GFX
	dw NinaWalk_Sideways2_GFX
	dw NinaWalk_Sideways1_GFX
	dw NinaWalk_Sideways3_GFX
	dw $eeee

NinaWalk_Down1_GFX:
	dr $11365, $113a5

NinaWalk_Down2_GFX:
	dr $113a5, $113e5

NinaWalk_Down3_GFX:
	dr $113e5, $11425

NinaWalk_Sideways1_GFX:
	dr $11425, $11465

NinaWalk_Sideways2_GFX:
	dr $11465, $114a5

NinaWalk_Sideways3_GFX:
	dr $114a5, $114e5

NinaWalk_Up1_GFX:
	dr $114e5, $11525

NinaWalk_Up2_GFX:
	dr $11525, $11565

NinaWalk_Up3_GFX:
	dr $11565, $115a5

ElectreepGFX_Pointers:
	dw ElectreepGFX_FacingDown_Pointers
	dw ElectreepGFX_FacingUp_Pointers
	dw ElectreepGFX_FacingSideways_Pointers
	dw ElectreepGFX_FacingSideways_Pointers

ElectreepGFX_FacingDown_Pointers:
	dw ElectreepWalk_Down1_GFX
	dw ElectreepWalk_Down2_GFX
	dw ElectreepWalk_Down1_GFX
	dw ElectreepWalk_Down3_GFX
	dw $eeee

ElectreepGFX_FacingUp_Pointers:
	dw ElectreepWalk_Up1_GFX
	dw ElectreepWalk_Up2_GFX
	dw ElectreepWalk_Up1_GFX
	dw ElectreepWalk_Up3_GFX
	dw $eeee

ElectreepGFX_FacingSideways_Pointers:
	dw ElectreepWalk_Sideways1_GFX
	dw ElectreepWalk_Sideways2_GFX
	dw ElectreepWalk_Sideways1_GFX
	dw ElectreepWalk_Sideways3_GFX
	dw $eeee

ElectreepWalk_Down1_GFX:
	dr $115cb, $1160b

ElectreepWalk_Down2_GFX:
	dr $1160b, $1164b

ElectreepWalk_Down3_GFX:
	dr $1164b, $1168b

ElectreepWalk_Sideways1_GFX:
	dr $1168b, $116cb

ElectreepWalk_Sideways2_GFX:
	dr $116cb, $1170b

ElectreepWalk_Sideways3_GFX:
	dr $1170b, $1174b

ElectreepWalk_Up1_GFX:
	dr $1174b, $1178b

ElectreepWalk_Up2_GFX:
	dr $1178b, $117cb

ElectreepWalk_Up3_GFX:
	dr $117cb, $1180b

ClaudeGFX_Pointers:
	dw ClaudeGFX_FacingDown_Pointers
	dw ClaudeGFX_FacingUp_Pointers
	dw ClaudeGFX_FacingSideways_Pointers
	dw ClaudeGFX_FacingSideways_Pointers

ClaudeGFX_FacingDown_Pointers:
	dw ClaudeWalking_Down1_GFX
	dw ClaudeWalking_Down2_GFX
	dw ClaudeWalking_Down1_GFX
	dw ClaudeWalking_Down3_GFX
	dw $eeee

ClaudeGFX_FacingUp_Pointers:
	dw ClaudeWalking_Up1_GFX
	dw ClaudeWalking_Up2_GFX
	dw ClaudeWalking_Up1_GFX
	dw ClaudeWalking_Up3_GFX
	dw $eeee

ClaudeGFX_FacingSideways_Pointers:
	dw ClaudeWalking_Sideways1_GFX
	dw ClaudeWalking_Sideways2_GFX
	dw ClaudeWalking_Sideways1_GFX
	dw ClaudeWalking_Sideways3_GFX
	dw $eeee

ClaudeWalking_Down1_GFX:
	dr $11831, $11871

ClaudeWalking_Down2_GFX:
	dr $11871, $118b1

ClaudeWalking_Down3_GFX:
	dr $118b1, $118f1

ClaudeWalking_Sideways1_GFX:
	dr $118f1, $11931

ClaudeWalking_Sideways2_GFX:
	dr $11931, $11971

ClaudeWalking_Sideways3_GFX:
	dr $11971, $119b1

ClaudeWalking_Up1_GFX:
	dr $119b1, $119f1

ClaudeWalking_Up2_GFX:
	dr $119f1, $11a31

ClaudeWalking_Up3_GFX:
	dr $11a31, $11a71

ChromanixGFX_Pointers:
	dw ChromanixGFX_FacingDown_Pointers
	dw ChromanixGFX_FacingUp_Pointers
	dw ChromanixGFX_FacingSideways_Pointers
	dw ChromanixGFX_FacingSideways_Pointers

ChromanixGFX_FacingDown_Pointers:
	dw ChromanixWalking_Down1_GFX
	dw ChromanixWalking_Down2_GFX
	dw ChromanixWalking_Down1_GFX
	dw ChromanixWalking_Down3_GFX
	dw $eeee

ChromanixGFX_FacingUp_Pointers:
	dw ChromanixWalking_Up1_GFX
	dw ChromanixWalking_Up2_GFX
	dw ChromanixWalking_Up1_GFX
	dw ChromanixWalking_Up3_GFX
	dw $eeee

ChromanixGFX_FacingSideways_Pointers:
	dw ChromanixWalking_Sideways1_GFX
	dw ChromanixWalking_Sideways2_GFX
	dw ChromanixWalking_Sideways1_GFX
	dw ChromanixWalking_Sideways3_GFX
	dw $eeee

ChromanixWalking_Down1_GFX:
	dr $11a97, $11ad7

ChromanixWalking_Down2_GFX:
	dr $11ad7, $11b17

ChromanixWalking_Down3_GFX:
	dr $11b17, $11b57

ChromanixWalking_Sideways1_GFX:
	dr $11b57, $11b97

ChromanixWalking_Sideways2_GFX:
	dr $11b97, $11bd7

ChromanixWalking_Sideways3_GFX:
	dr $11bd7, $11c17

ChromanixWalking_Up1_GFX:
	dr $11c17, $11c57

ChromanixWalking_Up2_GFX:
	dr $11c57, $11c97

ChromanixWalking_Up3_GFX:
	dr $11c97, $11cd7

HelenGFX_Pointers:
	dw HelenGFX_FacingDown_Pointers
	dw HelenGFX_FacingUp_Pointers
	dw HelenGFX_FacingSideways_Pointers
	dw HelenGFX_FacingSideways_Pointers
	dw HelenGFX_EyesClosed_Pointers

HelenGFX_FacingDown_Pointers:
	dw HelenWalking_Down1_GFX
	dw HelenWalking_Down2_GFX
	dw HelenWalking_Down1_GFX
	dw HelenWalking_Down3_GFX
	dw $eeee

HelenGFX_FacingUp_Pointers:
	dw HelenWalking_Up1_GFX
	dw HelenWalking_Up2_GFX
	dw HelenWalking_Up1_GFX
	dw HelenWalking_Up3_GFX
	dw $eeee

HelenGFX_FacingSideways_Pointers:
	dw HelenWalking_Sideways1_GFX
	dw HelenWalking_Sideways2_GFX
	dw HelenWalking_Sideways1_GFX
	dw HelenWalking_Sideways3_GFX
	dw $eeee

HelenGFX_EyesClosed_Pointers:
	dw HelenEyesClosedFacingDown_GFX
	dw HelenEyesClosedFacingDown_GFX
	dw $ffff

HelenWalking_Down1_GFX:
	dr $11d05, $11d45

HelenWalking_Down2_GFX:
	dr $11d45, $11d85

HelenWalking_Down3_GFX:
	dr $11d85, $11dc5

HelenWalking_Sideways1_GFX:
	dr $11dc5, $11e05

HelenWalking_Sideways2_GFX:
	dr $11e05, $11e45

HelenWalking_Sideways3_GFX:
	dr $11e45, $11e85

HelenWalking_Up1_GFX:
	dr $11e85, $11ec5

HelenWalking_Up2_GFX:
	dr $11ec5, $11f05

HelenWalking_Up3_GFX:
	dr $11f05, $11f45

HelenEyesClosedFacingDown_GFX:
	dr $11f45, $11f85

MerlithGFX_Pointers:
	dw MerlithGFX_FacingDown_Pointers
	dw MerlithGFX_FacingUp_Pointers
	dw MerlithGFX_FacingSideways_Pointers
	dw MerlithGFX_FacingSideways_Pointers

MerlithGFX_FacingDown_Pointers:
	dw MerlithWalk_Down1_GFX
	dw MerlithWalk_Down2_GFX
	dw MerlithWalk_Down1_GFX
	dw MerlithWalk_Down3_GFX
	dw $eeee

MerlithGFX_FacingUp_Pointers:
	dw MerlithWalk_Up1_GFX
	dw MerlithWalk_Up2_GFX
	dw MerlithWalk_Up1_GFX
	dw MerlithWalk_Up3_GFX
	dw $eeee

MerlithGFX_FacingSideways_Pointers:
	dw MerlithWalk_Sideways1_GFX
	dw MerlithWalk_Sideways2_GFX
	dw MerlithWalk_Sideways1_GFX
	dw MerlithWalk_Sideways3_GFX
	dw $eeee

MerlithWalk_Down1_GFX:
	dr $11fab, $11feb

MerlithWalk_Down2_GFX:
	dr $11feb, $1202b

MerlithWalk_Down3_GFX:
	dr $1202b, $1206b

MerlithWalk_Sideways1_GFX:
	dr $1206b, $120ab

MerlithWalk_Sideways2_GFX:
	dr $120ab, $120eb

MerlithWalk_Sideways3_GFX:
	dr $120eb, $1212b

MerlithWalk_Up1_GFX:
	dr $1212b, $1216b

MerlithWalk_Up2_GFX:
	dr $1216b, $121ab

MerlithWalk_Up3_GFX:
	dr $121ab, $121eb

LanteGFX_Pointers:
	dw LanteGFX_FacingDown_Pointers
	dw LanteGFX_FacingUp_Pointers
	dw LanteGFX_FacingSideways_Pointers
	dw LanteGFX_FacingSideways_Pointers

LanteGFX_FacingDown_Pointers:
	dw LanteWalk_Down1_GFX
	dw LanteWalk_Down2_GFX
	dw LanteWalk_Down1_GFX
	dw LanteWalk_Down3_GFX
	dw $eeee

LanteGFX_FacingUp_Pointers:
	dw LanteWalk_Up1_GFX
	dw LanteWalk_Up2_GFX
	dw LanteWalk_Up1_GFX
	dw LanteWalk_Up3_GFX
	dw $eeee

LanteGFX_FacingSideways_Pointers:
	dw LanteWalk_Sideways1_GFX
	dw LanteWalk_Sideways2_GFX
	dw LanteWalk_Sideways1_GFX
	dw LanteWalk_Sideways3_GFX
	dw $eeee

LanteWalk_Down1_GFX:
	dr $12211, $12251

LanteWalk_Down2_GFX:
	dr $12251, $12291

LanteWalk_Down3_GFX:
	dr $12291, $122d1

LanteWalk_Sideways1_GFX:
	dr $122d1, $12311

LanteWalk_Sideways2_GFX:
	dr $12311, $12351

LanteWalk_Sideways3_GFX:
	dr $12351, $12391

LanteWalk_Up1_GFX:
	dr $12391, $123d1

LanteWalk_Up2_GFX:
	dr $123d1, $12411

LanteWalk_Up3_GFX:
	dr $12411, $12451

MuserodeGFX_Pointers:
	dw MuserodeGFX_FacingDown_Pointers
	dw MuserodeGFX_FacingUp_Pointers
	dw MuserodeGFX_FacingSideways_Pointers
	dw MuserodeGFX_FacingSideways_Pointers

MuserodeGFX_FacingDown_Pointers:
	dw MuserodeWalk_Down1_GFX
	dw MuserodeWalk_Down2_GFX
	dw MuserodeWalk_Down1_GFX
	dw MuserodeWalk_Down3_GFX
	dw $eeee

MuserodeGFX_FacingUp_Pointers:
	dw MuserodeWalk_Up1_GFX
	dw MuserodeWalk_Up2_GFX
	dw MuserodeWalk_Up1_GFX
	dw MuserodeWalk_Up3_GFX
	dw $eeee

MuserodeGFX_FacingSideways_Pointers:
	dw MuserodeWalk_Sideways1_GFX
	dw MuserodeWalk_Sideways2_GFX
	dw MuserodeWalk_Sideways1_GFX
	dw MuserodeWalk_Sideways3_GFX
	dw $eeee

MuserodeWalk_Down1_GFX:
	dr $12477, $124b7

MuserodeWalk_Down2_GFX:
	dr $124b7, $124f7

MuserodeWalk_Down3_GFX:
	dr $124f7, $12537

MuserodeWalk_Sideways1_GFX:
	dr $12537, $12577

MuserodeWalk_Sideways2_GFX:
	dr $12577, $125b7

MuserodeWalk_Sideways3_GFX:
	dr $125b7, $125f7

MuserodeWalk_Up1_GFX:
	dr $125f7, $12637

MuserodeWalk_Up2_GFX:
	dr $12637, $12677

MuserodeWalk_Up3_GFX:
	dr $12677, $126b7

RandtGFX_Pointers:
	dw RandtGFX_FacingDown_Pointers
	dw RandtGFX_FacingUp_Pointers
	dw RandtGFX_FacingSideways_Pointers
	dw RandtGFX_FacingSideways_Pointers

RandtGFX_FacingDown_Pointers:
	dw RandtWalk_Down1_GFX
	dw RandtWalk_Down2_GFX
	dw RandtWalk_Down1_GFX
	dw RandtWalk_Down3_GFX
	dw $eeee

RandtGFX_FacingUp_Pointers:
	dw RandtWalk_Up1_GFX
	dw RandtWalk_Up2_GFX
	dw RandtWalk_Up1_GFX
	dw RandtWalk_Up3_GFX
	dw $eeee

RandtGFX_FacingSideways_Pointers:
	dw RandtWalk_Sideways1_GFX
	dw RandtWalk_Sideways2_GFX
	dw RandtWalk_Sideways1_GFX
	dw RandtWalk_Sideways3_GFX
	dw $eeee

RandtWalk_Down1_GFX:
	dr $126dd, $1271d

RandtWalk_Down2_GFX:
	dr $1271d, $1275d

RandtWalk_Down3_GFX:
	dr $1275d, $1279d

RandtWalk_Sideways1_GFX:
	dr $1279d, $127dd

RandtWalk_Sideways2_GFX:
	dr $127dd, $1281d

RandtWalk_Sideways3_GFX:
	dr $1281d, $1285d

RandtWalk_Up1_GFX:
	dr $1285d, $1289d

RandtWalk_Up2_GFX:
	dr $1289d, $128dd

RandtWalk_Up3_GFX:
	dr $128dd, $1291d

SignalitonGFX_Pointers:
	dw SignalitonGFX_FacingDown_Pointers
	dw SignalitonGFX_FacingUp_Pointers
	dw SignalitonGFX_FacingSideways_Pointers
	dw SignalitonGFX_FacingSideways_Pointers
	dw SignalitonGFX_Flashing_Pointers

SignalitonGFX_Flashing_Pointers:
	dw SignalitonFlash_GFX
	dw SignalitonWalk_Down1_GFX
	dw SignalitonFlash_GFX
	dw SignalitonWalk_Down1_GFX
	dw $eeee

SignalitonGFX_FacingDown_Pointers:
	dw SignalitonWalk_Down1_GFX
	dw SignalitonWalk_Down2_GFX
	dw SignalitonWalk_Down1_GFX
	dw SignalitonWalk_Down3_GFX
	dw $eeee

SignalitonGFX_FacingUp_Pointers:
	dw SignalitonWalk_Up1_GFX
	dw SignalitonWalk_Up2_GFX
	dw SignalitonWalk_Up1_GFX
	dw SignalitonWalk_Up3_GFX
	dw $eeee

SignalitonGFX_FacingSideways_Pointers:
	dw SignalitonWalk_Sideways1_GFX
	dw SignalitonWalk_Sideways2_GFX
	dw SignalitonWalk_Sideways1_GFX
	dw SignalitonWalk_Sideways3_GFX
	dw $eeee

SignalitonWalk_Down1_GFX:
	dr $1294f, $1298f

SignalitonWalk_Down2_GFX:
	dr $1298f, $129cf

SignalitonWalk_Down3_GFX:
	dr $129cf, $12a0f

SignalitonWalk_Sideways1_GFX:
	dr $12a0f, $12a4f

SignalitonWalk_Sideways2_GFX:
	dr $12a4f, $12a8f

SignalitonWalk_Sideways3_GFX:
	dr $12a8f, $12acf

SignalitonWalk_Up1_GFX:
	dr $12acf, $12b0f

SignalitonWalk_Up2_GFX:
	dr $12b0f, $12b4f

SignalitonWalk_Up3_GFX:
	dr $12b4f, $12b8f

SignalitonFlash_GFX:
	dr $12b8f, $12bcf

MittGFX_Pointers:
	dw MittGFX_FacingDown_Pointers
	dw MittGFX_FacingUp_Pointers
	dw MittGFX_FacingSideways_Pointers
	dw MittGFX_FacingSideways_Pointers

MittGFX_FacingDown_Pointers:
	dw MittWalk_Down1_GFX
	dw MittWalk_Down2_GFX
	dw MittWalk_Down1_GFX
	dw MittWalk_Down3_GFX
	dw $eeee

MittGFX_FacingUp_Pointers:
	dw MittWalk_Up1_GFX
	dw MittWalk_Up2_GFX
	dw MittWalk_Up1_GFX
	dw MittWalk_Up3_GFX
	dw $eeee

MittGFX_FacingSideways_Pointers:
	dw MittWalk_Sideways1_GFX
	dw MittWalk_Sideways2_GFX
	dw MittWalk_Sideways1_GFX
	dw MittWalk_Sideways3_GFX
	dw $eeee

MittWalk_Down1_GFX:
	dr $12bf5, $12c35

MittWalk_Down2_GFX:
	dr $12c35, $12c75

MittWalk_Down3_GFX:
	dr $12c75, $12cb5

MittWalk_Sideways1_GFX:
	dr $12cb5, $12cf5

MittWalk_Sideways2_GFX:
	dr $12cf5, $12d35

MittWalk_Sideways3_GFX:
	dr $12d35, $12d75

MittWalk_Up1_GFX:
	dr $12d75, $12db5

MittWalk_Up2_GFX:
	dr $12db5, $12df5

MittWalk_Up3_GFX:
	dr $12df5, $12e35

DrawvileGFX_Pointers:
	dw DrawvileGFX_FacingDown_Pointers
	dw DrawvileGFX_FacingUp_Pointers
	dw DrawvileGFX_FacingSideways_Pointers
	dw DrawvileGFX_FacingSideways_Pointers
	dw DrawvileGFX_Spinning_Pointers

DrawvileGFX_Spinning_Pointers:
	dw DrawvileWalk_Down1_GFX
	dw DrawvileFacing_Left_GFX
	dw DrawvileWalk_Up1_GFX
	dw DrawvileFacing_Right_GFX
	dw $eeee

DrawvileGFX_FacingDown_Pointers:
	dw DrawvileWalk_Down1_GFX
	dw DrawvileWalk_Down2_GFX
	dw DrawvileWalk_Down1_GFX
	dw DrawvileWalk_Down3_GFX
	dw $eeee

DrawvileGFX_FacingUp_Pointers:
	dw DrawvileWalk_Up1_GFX
	dw DrawvileWalk_Up2_GFX
	dw DrawvileWalk_Up1_GFX
	dw DrawvileWalk_Up3_GFX
	dw $eeee

DrawvileGFX_FacingSideways_Pointers:
	dw DrawvileWalk_Sideways1_GFX
	dw DrawvileWalk_Sideways2_GFX
	dw DrawvileWalk_Sideways1_GFX
	dw DrawvileWalk_Sideways3_GFX
	dw $eeee

DrawvileWalk_Down1_GFX:
	dr $12e67, $12ea7

DrawvileWalk_Down2_GFX:
	dr $12ea7, $12ee7

DrawvileWalk_Down3_GFX:
	dr $12ee7, $12f27

DrawvileWalk_Sideways1_GFX:
	dr $12f27, $12f67

DrawvileWalk_Sideways2_GFX:
	dr $12f67, $12fa7

DrawvileWalk_Sideways3_GFX:
	dr $12fa7, $12fe7

DrawvileWalk_Up1_GFX:
	dr $12fe7, $13027

DrawvileWalk_Up2_GFX:
	dr $13027, $13067

DrawvileWalk_Up3_GFX:
	dr $13067, $130a7

DrawvileFacing_Left_GFX:
	dr $130a7, $130e7

DrawvileFacing_Right_GFX:
	dr $130e7, $13127

BladeberusGFX_Pointers:
	dw BladeberusGFX_FacingDown_Pointers
	dw BladeberusGFX_FacingUp_Pointers
	dw BladeberusGFX_FacingSideways_Pointers
	dw BladeberusGFX_FacingSideways_Pointers

BladeberusGFX_FacingDown_Pointers:
	dw BladeberusWalk_Down1_GFX
	dw BladeberusWalk_Down2_GFX
	dw BladeberusWalk_Down1_GFX
	dw BladeberusWalk_Down3_GFX
	dw $eeee

BladeberusGFX_FacingUp_Pointers:
	dw BladeberusWalk_Up1_GFX
	dw BladeberusWalk_Up2_GFX
	dw BladeberusWalk_Up1_GFX
	dw BladeberusWalk_Up3_GFX
	dw $eeee

BladeberusGFX_FacingSideways_Pointers:
	dw BladeberusWalk_Sideways1_GFX
	dw BladeberusWalk_Sideways2_GFX
	dw BladeberusWalk_Sideways1_GFX
	dw BladeberusWalk_Sideways3_GFX
	dw $eeee

BladeberusWalk_Down1_GFX:
	INCBIN "gfx/sprites/bladeberus/down1.2bpp"

BladeberusWalk_Down2_GFX:
	INCBIN "gfx/sprites/bladeberus/down2.2bpp"

BladeberusWalk_Down3_GFX:
	INCBIN "gfx/sprites/bladeberus/down3.2bpp"

BladeberusWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/bladeberus/side1.2bpp"

BladeberusWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/bladeberus/side2.2bpp"

BladeberusWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/bladeberus/side3.2bpp"

BladeberusWalk_Up1_GFX:
	INCBIN "gfx/sprites/bladeberus/up1.2bpp"

BladeberusWalk_Up2_GFX:
	INCBIN "gfx/sprites/bladeberus/up2.2bpp"

BladeberusWalk_Up3_GFX:
	INCBIN "gfx/sprites/bladeberus/up3.2bpp"

SayaGFX_Pointers:
	dw SayaGFX_FacingDown_Pointers
	dw SayaGFX_FacingUp_Pointers
	dw SayaGFX_FacingSideways_Pointers
	dw SayaGFX_FacingSideways_Pointers

SayaGFX_FacingDown_Pointers:
	dw SayaWalk_Down1_GFX
	dw SayaWalk_Down2_GFX
	dw SayaWalk_Down1_GFX
	dw SayaWalk_Down3_GFX
	dw $ffff

SayaGFX_FacingUp_Pointers:
	dw SayaWalk_Up1_GFX
	dw SayaWalk_Up2_GFX
	dw SayaWalk_Up1_GFX
	dw SayaWalk_Up3_GFX
	dw $ffff

SayaGFX_FacingSideways_Pointers:
	dw SayaWalk_Sideways1_GFX
	dw SayaWalk_Sideways2_GFX
	dw SayaWalk_Sideways1_GFX
	dw SayaWalk_Sideways3_GFX
	dw $ffff

SayaWalk_Down1_GFX:
	dr $133b3, $133f3

SayaWalk_Down2_GFX:
	dr $133f3, $13433

SayaWalk_Down3_GFX:
	dr $13433, $13473

SayaWalk_Sideways1_GFX:
	dr $13473, $134b3

SayaWalk_Sideways2_GFX:
	dr $134b3, $134f3

SayaWalk_Sideways3_GFX:
	dr $134f3, $13533

SayaWalk_Up1_GFX:
	dr $13533, $13573

SayaWalk_Up2_GFX:
	dr $13573, $135b3

SayaWalk_Up3_GFX:
	dr $135b3, $135f3

BoyGFX_Pointers:
	dw BoyGFX_FacingDown_Pointers
	dw BoyGFX_FacingUp_Pointers
	dw BoyGFX_FacingSideways_Pointers
	dw BoyGFX_FacingSideways_Pointers

BoyGFX_FacingDown_Pointers:
	dw BoyWalk_Down1_GFX
	dw BoyWalk_Down2_GFX
	dw BoyWalk_Down1_GFX
	dw BoyWalk_Down3_GFX
	dw $ffff

BoyGFX_FacingUp_Pointers:
	dw BoyWalk_Up1_GFX
	dw BoyWalk_Up2_GFX
	dw BoyWalk_Up1_GFX
	dw BoyWalk_Up3_GFX
	dw $ffff

BoyGFX_FacingSideways_Pointers:
	dw BoyWalk_Sideways1_GFX
	dw BoyWalk_Sideways2_GFX
	dw BoyWalk_Sideways1_GFX
	dw BoyWalk_Sideways3_GFX
	dw $ffff

BoyWalk_Down1_GFX:
	dr $13619, $13659

BoyWalk_Down2_GFX:
	dr $13659, $13699

BoyWalk_Down3_GFX:
	dr $13699, $136d9

BoyWalk_Sideways1_GFX:
	dr $136d9, $13719

BoyWalk_Sideways2_GFX:
	dr $13719, $13759

BoyWalk_Sideways3_GFX:
	dr $13759, $13799

BoyWalk_Up1_GFX:
	dr $13799, $137d9

BoyWalk_Up2_GFX:
	dr $137d9, $13819

BoyWalk_Up3_GFX:
	dr $13819, $13859

GirlGFX_Pointers:
	dw GirlGFX_FacingDown_Pointers
	dw GirlGFX_FacingUp_Pointers
	dw GirlGFX_FacingSideways_Pointers
	dw GirlGFX_FacingSideways_Pointers

GirlGFX_FacingDown_Pointers:
	dw GirlWalk_Down1_GFX
	dw GirlWalk_Down2_GFX
	dw GirlWalk_Down1_GFX
	dw GirlWalk_Down3_GFX
	dw $ffff

GirlGFX_FacingUp_Pointers:
	dw GirlWalk_Up1_GFX
	dw GirlWalk_Up2_GFX
	dw GirlWalk_Up1_GFX
	dw GirlWalk_Up3_GFX
	dw $ffff

GirlGFX_FacingSideways_Pointers:
	dw GirlWalk_Sideways1_GFX
	dw GirlWalk_Sideways2_GFX
	dw GirlWalk_Sideways1_GFX
	dw GirlWalk_Sideways3_GFX
	dw $ffff

GirlWalk_Down1_GFX:
	dr $1387f, $138bf

GirlWalk_Down2_GFX:
	dr $138bf, $138ff

GirlWalk_Down3_GFX:
	dr $138ff, $1393f

GirlWalk_Sideways1_GFX:
	dr $1393f, $1397f

GirlWalk_Sideways2_GFX:
	dr $1397f, $139bf

GirlWalk_Sideways3_GFX:
	dr $139bf, $139ff

GirlWalk_Up1_GFX:
	dr $139ff, $13a3f

GirlWalk_Up2_GFX:
	dr $13a3f, $13a7f

GirlWalk_Up3_GFX:
	dr $13a7f, $13abf
