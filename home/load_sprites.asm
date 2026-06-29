LoadTextFaceGFX::
; Load face pic bank
	ld a, [_BANKNUM]
	push af
	ld a, [wTextFaceID]
	cp PIC_GFX_2
	jr c, .other_bank

; [wTextFaceID] >= 58
	ld a, BANK(_LoadTextFaceGFX2)
	rst Bankswitch
	call _LoadTextFaceGFX2
	pop af
	rst Bankswitch
	ret

.other_bank
	ld a, BANK(_LoadTextFaceGFX)
	rst Bankswitch
	call _LoadTextFaceGFX
	pop af
	rst Bankswitch
	ret

LoadTextFaceExtraSprites::
	ld a, [_BANKNUM]
	push af
	ld a, [wTextFaceID]
	cp PIC_GFX_2
	jr c, .other_bank

; [wTextFaceID] >= 58
	ld a, BANK(_LoadTextFaceExtraSprites2)
	rst Bankswitch
	call _LoadTextFaceExtraSprites2
	pop af
	rst Bankswitch
	ret

.other_bank
	ld a, BANK(_LoadTextFaceExtraSprites)
	rst Bankswitch
	call _LoadTextFaceExtraSprites
	pop af
	rst Bankswitch
	ret

LoadObjectSprite::
	ld bc, wcd40
.findFreeSlot
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr nz, NextObjectSpriteSlot
	inc de

_LoadObjectSprite::
	ld a, [de]
	ld hl, 4
	add hl, bc
	ld [hl], a
	inc de
	ld a, [de]
	ld [wPlayerMap2X], a
	ld hl, hFFAA
	sub [hl]
REPT 4
	add a
ENDR
	add $08
	ld hl, 1
	add hl, bc
	ld [hld], a
	inc de
	ld a, [de]
	ld [wPlayerMap2Y], a
	push hl
	ld hl, hFFAB
	sub [hl]
REPT 4
	add a
ENDR
	add $10
	pop hl
	ld [hl], a
	inc hl
	inc hl
	ld [hl], 1
	ld hl, 6
	add hl, bc
	ld a, c
	swap a
	and $0f
	add a
	add a
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld hl, 8
	add hl, bc
REPT 5
	inc de
ENDR
	ld a, [de]
	ld [hli], a
	inc hl
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld hl, $12
	add hl, bc
	ld a, [wPlayerMap2Y]
	ld [hli], a
	ld a, [wPlayerMap2X]
	ld [hl], a
	call LoadSpritePalette
	ret

NextObjectSpriteSlot::
	ld hl, $20
	add hl, bc
	ld a, l
	cp $e0
	jr z, .noFreeSlot

	push hl
	pop bc
	jr LoadObjectSprite.findFreeSlot

.noFreeSlot
	ld c, 0
	ret

LoadSelectedObjectSprite::
	ld a, [wSelectedObjectOffset]
	ld c, a
	ld b, $cd
	jp _LoadObjectSprite

