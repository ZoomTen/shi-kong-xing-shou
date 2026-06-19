Func_038_4000:
	ld hl, wd1a0
.asm_4003
	push hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jp z, .asm_40b8
	ld [wd0c1], a
	ld de, SpriteComposition_Pointers
	ld a, [wd988]
	sub $39
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [wd0c1]
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
.asm_4032
	ld a, [hli]
	cp $FF
	jp z, .asm_40b4
	add c
	ld [de], a
	inc de
	ld a, [wd986]
	and a
	jr nz, .asm_4071
	ld a, [wd988]
	cp $48
	jr z, .asm_4071
	cp $4A
	jr z, .asm_4071
	cp $4C
	jr z, .asm_4071
	cp $4E
	jr z, .asm_4071
	cp $50
	jr z, .asm_4071
	cp $56
	jr z, .asm_4071
	cp $5D
	jr z, .asm_4071
	cp $5E
	jr z, .asm_4071
	cp $60
	jr z, .asm_4071
	cp $62
	jr z, .asm_4071
	inc hl
	ld a, [hli]
	add b
	jr .asm_4074
.asm_4071
	ld a, [hli]
	add b
	inc hl
.asm_4074
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wd986]
	and a
	jr nz, .asm_40b0
	ld a, [wd988]
	cp $48
	jr z, .asm_40b0
	cp $4A
	jr z, .asm_40b0
	cp $4C
	jr z, .asm_40b0
	cp $4E
	jr z, .asm_40b0
	cp $50
	jr z, .asm_40b0
	cp $56
	jr z, .asm_40b0
	cp $5D
	jr z, .asm_40b0
	cp $5E
	jr z, .asm_40b0
	cp $60
	jr z, .asm_40b0
	cp $62
	jr z, .asm_40b0
	ld a, [de]
	or $20
	ld [de], a
.asm_40b0
	inc de
	jp .asm_4032
.asm_40b4
	ld a, e
	ld [wd1fb], a
.asm_40b8
	pop hl
	ld bc, $0008
	add hl, bc
	ld a, l
	cp $E0
	ret nc
	jp .asm_4003
SpriteComposition_Pointers:
	dr $e00c4, $e0118
SpriteComposition_Map39:
	dr $e0118, $e03b8
SpriteComposition_Map3A:
	dr $e03b8, $e058b
SpriteComposition_Map3B:
	dr $e058b, $e0637
SpriteComposition_Map3C:
	dr $e0637, $e0776
SpriteComposition_Map3D:
	dr $e0776, $e0829
SpriteComposition_Map3E:
	dr $e0829, $e0944
SpriteComposition_Map3F:
	dr $e0944, $e09c7
SpriteComposition_Map40:
	dr $e09c7, $e0ad8
SpriteComposition_Map41:
	dr $e0ad8, $e0b2f
SpriteComposition_Map42:
	dr $e0b2f, $e0c0b
SpriteComposition_Map43:
	dr $e0c0b, $e0cbf
SpriteComposition_Map44:
	dr $e0cbf, $e0e52
SpriteComposition_Map45:
	dr $e0e52, $e0f0e
SpriteComposition_Map46:
	dr $e0f0e, $e0f6a
SpriteComposition_Map47:
	dr $e0f6a, $e0f7f
SpriteComposition_Map48:
	dr $e0f7f, $e1034
SpriteComposition_Map49:
	dr $e1034, $e110b
SpriteComposition_Map4A:
	dr $e110b, $e11de
SpriteComposition_Map4B:
	dr $e11de, $e139e
SpriteComposition_Map4C:
	dr $e139e, $e1401
SpriteComposition_Map4D:
	dr $e1401, $e1505
SpriteComposition_Map4E:
	dr $e1505, $e1568
SpriteComposition_Map4F:
	dr $e1568, $e163b
SpriteComposition_Map50:
	dr $e163b, $e1662
SpriteComposition_Map51:
	dr $e1662, $e1710
SpriteComposition_Map53:
	dr $e1710, $e1810
SpriteComposition_Map55:
	dr $e1810, $e1966
SpriteComposition_Map56:
	dr $e1966, $e1a3d
SpriteComposition_Map57:
	dr $e1a3d, $e1aca
SpriteComposition_Map59:
	dr $e1aca, $e1bdd
SpriteComposition_Map5A:
	dr $e1bdd, $e1d2b
SpriteComposition_Map5B:
	dr $e1d2b, $e1eb0
SpriteComposition_Map5C:
	dr $e1eb0, $e1fba
SpriteComposition_Map5D:
	dr $e1fba, $e210e
SpriteComposition_Map5E:
	dr $e210e, $e219e
SpriteComposition_Map5F:
	dr $e219e, $e224c
SpriteComposition_Map60:
	dr $e224c, $e22dc
SpriteComposition_Map61:
	dr $e22dc, $e23fb
SpriteComposition_Map62:
	dr $e23fb, $e2430


