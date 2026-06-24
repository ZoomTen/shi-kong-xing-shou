BuildVirtualOAM::
	homecall _BuildVirtualOAM
	ret

UpdatePlayerAnim::
	ld a, [_BANKNUM]
	push af
	call _UpdatePlayerAnim
	pop af
	rst Bankswitch
	ret

InitPlayerAnim::
	ld a, [_BANKNUM]
	push af
	ld a, 1
	ldh [hFFAC], a
	ld [wdcd0], a
	ld a, $0a
	ldh [hFFAD], a
	ld a, 1
	ldh [hFFDB], a
	ld [wdceb], a
	ld a, $0a
	ldh [hFFDC], a
	call InitPartyAnimBuffers
	call _UpdatePlayerAnim
	pop af
	rst Bankswitch
	ret

InitPartyAnimBuffers::
	ld hl, wPartyMons
.asm_0456:
	ld a, [hl]
	cp $51
	jr z, .asm_0481
	cp $75
	jr z, .asm_0486
	cp $6c
	jr z, .asm_048b
	cp $5b
	jr z, .asm_0490
	cp $63
	jr z, .asm_0495
	cp $91
	jr z, .asm_049a
	cp $90
	jr z, .asm_049f
	cp $7e
	jr z, .asm_04a4

	ld bc, $16
	add hl, bc
	ld a, l
	cp $80
	ret nc
	jr .asm_0456

.asm_0481
	ld de, wde00
	jr .asm_04a9

.asm_0486
	ld de, wde16
	jr .asm_04a9

.asm_048b
	ld de, wde2c
	jr .asm_04a9

.asm_0490
	ld de, wde42
	jr .asm_04a9

.asm_0495
	ld de, wde58
	jr .asm_04a9

.asm_049a
	ld de, wde6e
	jr .asm_04a9

.asm_049f
	ld de, wde84
	jr .asm_04a9

.asm_04a4
	ld de, wde9a
	jr .asm_04a9

.asm_04a9:
	push hl
	ld bc, $16
.copy1
	ld a, [hli]
	ld [de], a
	inc de
; @bad
	dec c
	ld a, c
	or b
	jr nz, .copy1

	pop de
	ld bc, .unk_04d0
	ld a, [wcd24]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $16
.copy2
	ld a, [hli]
	ld [de], a
	inc de
; @bad
	dec c
	ld a, c
	or b
	jr nz, .copy2
	ret

.unk_04d0
	dw wde00
	dw wde00
	dw wde00
	dw wde16
	dw wde00
	dw wde2c
	dw wde00
	dw wde42
	dw wde00
	dw wde58
	dw wde00
	dw wde6e
	dw wde00
	dw wde84
	dw wde00
	dw wde9a
	dw wde00

SetPartySlotStatus::
	ld a, [wdcf3]
	ld de, wdd00
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wdcf4]
	ld [hl], a
	and a
	ret nz
	ret

ClearPartyAnimBuffer::
	ld a, [wdcf3]
	ld de, .unk_0521
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $16
.asm_0517
	ld a, [hli]
	ld [hl], 0
	inc hl
; @bad
	dec c
	ld a, c
	or b
	jr nz, .asm_0517
	ret

.unk_0521
	dw wde00
	dw wde16
	dw wde2c
	dw wde42
	dw wde58
	dw wde6e
	dw wde84
	dw wde9a

GetPlayerFacingOffset::
	ld a, [wPlayerScreenY]
	ld b, a
	ld a, [wPlayerScreenX]
	ld c, a
	ld de, .unk_054f
	ld a, [wPlayerFacing]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	add b
	ld [wcd20], a
	ld a, [hli]
	add c
	ld [wcd21], a
	ret

.unk_054f
	db $f0, $00
	db $10, $00
	db $00, $10
	db $00, $f0

SpawnPlayerSprite::
	ld a, [_BANKNUM]
	push af
	ld a, [wPlayerSpriteX]
	ld [wPlayerScreenX], a
	ld a, [wPlayerSpriteY]
	ld [wPlayerScreenY], a
	ld a, 1
	ld [wcd02], a
	ldh [hFFAC], a
	ld [wdcd0], a
	ld a, $0a
	ldh [hFFAD], a
	ld a, [wd0e3]
	ld [wPlayerFacing], a
	ld a, [wd0e4]
	and a
	jr z, .asm_058a

	ld a, [wd0e4]
	ld [wPlayerSpriteID], a
	jp .asm_05e9 ; jr

.asm_058a
	ld a, [wPlayerChar]
	cp 3
	jr nz, .asm_05a0
	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_05a0

	ld a, $36
	ld [wPlayerSpriteID], a
	jr .asm_05a7

.asm_05a0
	ld a, [wPlayerChar]
	add a
	ld [wPlayerSpriteID], a

.asm_05a7
	ld a, [wdcea]
	and a
	jr z, .asm_05e9

	cp 2
	jr z, .asm_05b8

	ld a, 1
	ld [wcd24], a
	jr .asm_05ca

.asm_05b8
	ld a, [wPlayerChar]
	and a
	jr z, .asm_05c5

	add a
	inc a
	ld [wcd24], a
	jr .asm_05ca

.asm_05c5
	ld a, $10
	ld [wcd24], a

.asm_05ca
	ld a, [wPlayerFacing]
	ld [wcd23], a
	ld [wdcec], a
	call GetPlayerFacingOffset
	ld a, 1
	ld [wcd22], a
	ldh [hFFDB], a
	ld [wdceb], a
	ld a, $0a
	ldh [hFFDC], a
	ld a, 8
	ld [wcd26], a

.asm_05e9
	call _UpdatePlayerAnim
	call UpdateSpriteAnimQueueFast
	pop af
	rst Bankswitch
	ret

UpdatePlayerAndObjectAnims::
	ld a, [_BANKNUM]
	push af
	call _UpdatePlayerAnim
	call UpdateSpriteAnimQueueFast
	pop af
	rst Bankswitch
	ret

