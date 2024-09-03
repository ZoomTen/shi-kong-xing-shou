Func_28d6::
; Clear or duplicate line of text in textbox
; Used in para and cont text commands
	ld a, [wcbf6]
	and a
	ret z

; Backup SP
	ld [hFFA2], sp

	ld hl, wBGMapBufferPointers
	ld sp, hl
	ld hl, wd128
.copy
	pop bc
	ld a, [hli]
	ld [bc], a
	ldh a, [hFFA5]
	dec a
	ldh [hFFA5], a
	jr nz, .copy

; Restore old SP
	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl

	xor a
	ld [wcbf6], a
	ret

PrintCharacter::
; Print one vertically arranged character using four tiles
	ld a, [wCharacterBGMapTransferStatus]
	and a
	ret z

; Backup SP
	ld [hFFA2], sp

; BG map addresses are held at wBGMapBufferPointers
	ld hl, wBGMapBufferPointers
	ld sp, hl
	ld a, [wcbf3]
; Each character occupies four tiles
REPT 3
	pop bc
	ld [bc], a
	inc a
ENDR
	pop bc
	ld [bc], a

; Restore old SP
	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl

	xor a
	ld [wCharacterBGMapTransferStatus], a
	ret

LoadCharacter::
	ld a, [wCharacterTileTransferStatus]
	and a
	ret z

; Save current ROM bank
	ld a, [_BANKNUM]
	push af
; Switch
	ldh a, [hTargetBank]
	rst Bankswitch

; Backup stack pointer
	ld [hFFA2], sp

	ld a, [wCharacterTileSrc]
	ld l, a
	ld a, [wCharacterTileSrc + 1]
	ld h, a
	ld sp, hl

	ld a, [wCharacterTileDest]
	ld l, a
	ld a, [wCharacterTileDest + 1]
	ld h, a
	ld a, [wCharacterTileCount]
	ld e, a

.load_tile
REPT 3
	pop bc
	ld [hl], c
	inc l
	ld [hl], c
	inc l
	ld [hl], b
	inc l
	ld [hl], b
	inc l
ENDR
	pop bc
	ld [hl], c
	inc l
	ld [hl], c
	inc l
	ld [hl], b
	inc l
	ld [hl], b

	inc hl
	dec e
	jr nz, .load_tile

; Restore old stack pointer
	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl

	xor a
	ld [wCharacterTileTransferStatus], a
	pop af
	rst Bankswitch
	ret

Func_297a::
	ldh a, [hFFA4]
	and a
	ret z

	ld [hFFA2], sp
	ld hl, wBGMapBufferPointers
	ld sp, hl
	ld hl, wd100
	ld de, wd128
.asm_298b
REPT 2
	pop bc
	ld a, 1
	ldh [rVBK], a
	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	dec c
	xor a
	ldh [rVBK], a
	ld a, [de]
	inc de
	ld [bc], a
	inc c
	ld a, [de]
	inc de
	ld [bc], a
ENDR
	ldh a, [hFFA5]
	dec a
	dec a
	ldh [hFFA5], a
	jr nz, .asm_298b

	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl
	xor a
	ldh [hFFA4], a
	ret

Func_29c8::
	ldh a, [hFFC4]
	cp 1
	jp z, .asm_29f1
	cp 2
	jp z, .ret

; wBGPals2 copy
	ld de, wBGPals2
	push bc
	ld c, $80
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1

; wBGPals1 copy
	pop hl
	ld de, wBGPals1
	ld c, $80
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy2

	ld a, 1
	ldh [hFFC4], a
	ret

.asm_29f1:
	ld hl, wBGPals2
	ld bc, wBGPals1
	ld e, $40
	xor a
	ld [wd0b5], a

.asm_29fd:
	push de
	ld a, [hl]
	and $1f
	ld d, a
	ld a, [bc]
	and $1f
	cp d
	jr z, .asm_2a23

	push af
	ld a, [wd0b4]
	and a
	jr z, .asm_2a15

	pop af
	sub $01
	ld d, a
	jr .asm_2a19

.asm_2a15:
	pop af
	add $01
	ld d, a

.asm_2a19:
	ld a, $01
	ld [wd0b5], a
	ld a, [bc]
	and $e0
	or d
	ld [bc], a

.asm_2a23:
	ld a, [hl]
	and $f0
	swap a
	ld d, a
	inc hl
	ld a, [hl]
	and $03
	swap a
	or d
	srl a
	ld d, a
	ld a, [bc]
	and $f0
	swap a
	ld e, a
	inc bc
	ld a, [bc]
	and $03
	swap a
	or e
	srl a
	cp d
	jr z, .asm_2a76

	push af
	ld a, [wd0b4]
	and a
	jr z, .asm_2a52

	pop af
	sub $01
	ld d, a
	jr .asm_2a56

.asm_2a52:
	pop af
	add $01
	ld d, a

.asm_2a56:
	ld a, $01
	ld [wd0b5], a
	ld a, d
	sla a
	ld d, a
	and $f0
	swap a
	ld e, a
	ld a, d
	swap a
	and $f0
	ld d, a
	dec bc
	ld a, [bc]
	and $1f
	or d
	ld [bc], a
	inc bc
	ld a, [bc]
	and $fc
	or e
	ld [bc], a

.asm_2a76:
	ld a, [hl]
	srl a
	srl a
	ld d, a
	ld a, [bc]
	srl a
	srl a
	cp d
	jr z, .asm_2aa5

	push af
	ld a, [wd0b4]
	and a
	jr z, .asm_2a91

	pop af
	sub $01
	ld d, a
	jr .asm_2a95

.asm_2a91:
	pop af
	add $01
	ld d, a

.asm_2a95:
	ld a, $01
	ld [wd0b5], a
	ld a, d
	sla a
	sla a
	ld d, a
	ld a, [bc]
	and $03
	or d
	ld [bc], a

.asm_2aa5:
	inc hl
	inc bc
	pop de
	dec e
	jp nz, .asm_29fd

	ld a, [wd0b5]
	and a
	jr nz, .ret

	ld a, 0
	ldh [hFFC4], a
	ret

.ret
	ret

unk_2ab8::
REPT $40
	dw $0000
ENDR

unk_2b38::
REPT $40
	dw $7fff
ENDR
