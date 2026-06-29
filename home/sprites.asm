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
.scanLoop:
	ld a, [hl]
	cp $51
	jr z, .useBuffer0
	cp $75
	jr z, .useBuffer1
	cp $6c
	jr z, .useBuffer2
	cp $5b
	jr z, .useBuffer3
	cp $63
	jr z, .useBuffer4
	cp $91
	jr z, .useBuffer5
	cp $90
	jr z, .useBuffer6
	cp $7e
	jr z, .useBuffer7

	ld bc, $16
	add hl, bc
	ld a, l
	cp $80
	ret nc
	jr .scanLoop

.useBuffer0
	ld de, wde00
	jr .copyBuffers

.useBuffer1
	ld de, wde16
	jr .copyBuffers

.useBuffer2
	ld de, wde2c
	jr .copyBuffers

.useBuffer3
	ld de, wde42
	jr .copyBuffers

.useBuffer4
	ld de, wde58
	jr .copyBuffers

.useBuffer5
	ld de, wde6e
	jr .copyBuffers

.useBuffer6
	ld de, wde84
	jr .copyBuffers

.useBuffer7
	ld de, wde9a
	jr .copyBuffers

.copyBuffers:
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
	ld bc, .bufferPointers
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

.bufferPointers
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
	ld de, .bufferPtrs
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $16
.clearLoop
	ld a, [hli]
	ld [hl], 0
	inc hl
; @bad
	dec c
	ld a, c
	or b
	jr nz, .clearLoop
	ret

.bufferPtrs
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
	ld de, .facingOffsets
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

.facingOffsets
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
	jr z, .computeSpriteID

	ld a, [wd0e4]
	ld [wPlayerSpriteID], a
	jp .updateAndExit ; jr

.computeSpriteID
	ld a, [wPlayerChar]
	cp 3
	jr nz, .charSpriteID
	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .charSpriteID

	ld a, $36
	ld [wPlayerSpriteID], a
	jr .checkFollower

.charSpriteID
	ld a, [wPlayerChar]
	add a
	ld [wPlayerSpriteID], a

.checkFollower
	ld a, [wdcea]
	and a
	jr z, .updateAndExit

	cp 2
	jr z, .followerMode2

	ld a, 1
	ld [wcd24], a
	jr .setupAnim

.followerMode2
	ld a, [wPlayerChar]
	and a
	jr z, .char0Variant

	add a
	inc a
	ld [wcd24], a
	jr .setupAnim

.char0Variant
	ld a, $10
	ld [wcd24], a

.setupAnim
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

.updateAndExit
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

