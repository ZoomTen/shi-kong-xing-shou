unk_04a_4000:
	dr $128000, $128098

Func_04a_4098:
	ld de, TextLayout_Pointers
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld a, [bc]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_40ac
	ld a, [wd9e8]
	cp [hl]
	jr z, .asm_40ba
	ld a, [hl]
	cp $FF
	ret z
	inc hl
	inc hl
	jr .asm_40ac
.asm_40ba
	inc hl
	ld a, [hl]
	ld [wd9e3], a
	ld d, a
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld bc, $0003
	ld e, $04
.asm_40d1
	ld a, [hl]
	cp d
	ret z
	and a
	jr z, .asm_4108
	add hl, bc
	dec e
	jr nz, .asm_40d1
	ld a, $33
	ld [wd3ff], a
	farcall Func_02d_4000
	call ClearBGMap0
	call .asm_412a
	ld a, $01
	ld [wd087], a
	ld a, $0D
	ld [hFFC5], a
.asm_40f6
	call DelayFrame
	ld a, [hFFC5]
	and a
	jr z, .asm_4107
	farcall Func_024_40fd
	jr .asm_40f6
.asm_4107
	ret
.asm_4108
	push hl
	ld a, $33
	ld [wd3ff], a
	farcall Func_02d_4000
	pop hl
	ld a, [wd9e3]
	ld [hli], a
	push hl
	ld [wd9bf], a
	farcall Func_024_4053
	pop hl
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ret
.asm_412a
	ld hl, wcde0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ret
TextLayout_Pointers:
	dr $128149, $128289
TextLayouts:
	dr $128289, $1292b1
TextFont_GFX:
	dr $1292b1, $129691
Func_04a_5691:
	call Func_0b46
	ld a, [wd08a]
	push af
	call Func_0b46
	ld a, [wd08a]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	call Func_0b46
	ld a, [wd08a]
	ld e, a
	call Func_0b46
	ld a, [wd08a]
	ld d, a
	ld a, [de]
	inc de
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ldh [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceTilemap
	call Func_0b46
	ld a, [wd08a]
	ld e, a
	call Func_0b46
	ld a, [wd08a]
	ld d, a
	ld a, [de]
	inc de
	ld b, a
	ldh [hVRAMCopyWidth], a
	ld a, [de]
	inc de
	ld c, a
	ldh [hVRAMCopyHeight], a
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	call PlaceAttrmap
	xor a
	ld [wd08a], a
	ret
Tilemap_4a_56ef:
	dr $1296ef, $129745
Attrmap_4a_5745:
	dr $129745, $12979b
Tilemap_4a_579b:
	dr $12979b, $129905
Attrmap_4a_5905:
	dr $129905, $129a6f
Tilemap_4a_5a6f:
	dr $129a6f, $129bd9
Tilemap_4a_5bd9:
	dr $129bd9, $129c8f
Attrmap_4a_5c8f:
	dr $129c8f, $129d45
Tilemap_4a_5d45:
	dr $129d45, $129dfb
Attrmap_4a_5dfb:
	dr $129dfb, $129eb1
unk_4a_5eb1:
	dr $129eb1, $129ec3
Tilemap_4a_5ec3:
	dr $129ec3, $129ec7
Tilemap_4a_5ec7:
	dr $129ec7, $129ecb
unk_4a_5ecb:
	dr $129ecb, $129ed8
Tilemap_4a_5ed8:
	dr $129ed8, $129fc0
unk_4a_5fc0:
	dr $129fc0, $129fc5
Tilemap_4a_5fc5:
	dr $129fc5, $12a017
Tilemap_4a_6017:
	dr $12a017, $12a051
unk_4a_6051:
	dr $12a051, $12a06d
Tilemap_4a_606d:
	dr $12a06d, $12a0b7
Attrmap_4a_60b7:
	dr $12a0b7, $12a101
Tilemap_4a_6101:
	dr $12a101, $12a157
Attrmap_4a_6157:
	dr $12a157, $12a1ad
Tilemap_4a_61ad:
	dr $12a1ad, $12a227
Attrmap_4a_6227:
	dr $12a227, $12a2a1
Tilemap_4a_62a1:
	dr $12a2a1, $12a31b
Tilemap_4a_631b:
	dr $12a31b, $12a339
Attrmap_4a_6339:
	dr $12a339, $12a357
Tilemap_4a_6357:
	dr $12a357, $12a401
Attrmap_4a_6401:
	dr $12a401, $12a4ab
Tilemap_4a_64ab:
	dr $12a4ab, $12a4d7
Attrmap_4a_64d7:
	dr $12a4d7, $12a503
Tilemap_4a_6503:
	dr $12a503, $12a51d
Attrmap_4a_651d:
	dr $12a51d, $12a537
Tilemap_4a_6537:
	dr $12a537, $12a5b1
Attrmap_4a_65b1:
	dr $12a5b1, $12a62b
Tilemap_4a_662b:
	dr $12a62b, $12a64b
Attrmap_4a_664b:
	dr $12a64b, $12a66b
Tilemap_4a_666b:
	dr $12a66b, $12a6db
Attrmap_4a_66db:
	dr $12a6db, $12a74b
Tilemap_4a_674b:
	dr $12a74b, $12a76b
Attrmap_4a_676b:
	dr $12a76b, $12a78b
Tilemap_4a_678b:
	dr $12a78b, $12a7d5
Attrmap_4a_67d5:
	dr $12a7d5, $12a81f
Tilemap_4a_681f:
	dr $12a81f, $12a861
Attrmap_4a_6861:
	dr $12a861, $12a8a3
Tilemap_4a_68a3:
	dr $12a8a3, $12a8dd
Attrmap_4a_68dd:
	dr $12a8dd, $12a917
Tilemap_4a_6917:
	dr $12a917, $12a9cd
Attrmap_4a_69cd:
	dr $12a9cd, $12aa83
Tilemap_4a_6a83:
	dr $12aa83, $12aaa8
Attrmap_4a_6aa8:
	dr $12aaa8, $12aacd
Tilemap_4a_6acd:
	dr $12aacd, $12ab97
Attrmap_4a_6b97:
	dr $12ab97, $12ac61
Tilemap_4a_6c61:
	dr $12ac61, $12adcb
Attrmap_4a_6dcb:
	dr $12adcb, $12af35
Tilemap_4a_6f35:
	dr $12af35, $12afc7
Attrmap_4a_6fc7:
	dr $12afc7, $12b059
Tilemap_4a_7059:
	dr $12b059, $12b0bb
Attrmap_4a_70bb:
	dr $12b0bb, $12b11d
Tilemap_4a_711d:
	dr $12b11d, $12b197
Attrmap_4a_7197:
	dr $12b197, $12b211
Tilemap_4a_7211:
	dr $12b211, $12b2b5
Attrmap_4a_72b5:
	dr $12b2b5, $12b359
Tilemap_4a_7359:
	dr $12b359, $12b3d3
Tilemap_4a_73d3:
	dr $12b3d3, $12b425
Tilemap_4a_7425:
	dr $12b425, $12b4c7
Tilemap_4a_74c7:
	dr $12b4c7, $12b541
Tilemap_4a_7541:
	dr $12b541, $12b593
Tilemap_4a_7593:
	dr $12b593, $12b635
Tilemap_4a_7635:
	dr $12b635, $12b6af
Tilemap_4a_76af:
	dr $12b6af, $12b6dd
Attrmap_4a_76dd:
	dr $12b6dd, $12b70b
Tilemap_4a_770b:
	dr $12b70b, $12b72b
Attrmap_4a_772b:
	dr $12b72b, $12b74b
Tilemap_4a_774b:
	dr $12b74b, $12b7b9
Attrmap_4a_77b9:
	dr $12b7b9, $12b827
Tilemap_4a_7827:
	dr $12b827, $12b8c5
Attrmap_4a_78c5:
	dr $12b8c5, $12b963
Tilemap_4a_7963:
	dr $12b963, $12b9a1
Attrmap_4a_79a1:
	dr $12b9a1, $12b9df
Tilemap_4a_79df:
	dr $12b9df, $12ba59
Attrmap_4a_7a59:
	dr $12ba59, $12bad3
Tilemap_4a_7ad3:
	dr $12bad3, $12baf3
Tilemap_4a_7af3:
	dr $12baf3, $12bbcd
Attrmap_4a_7bcd:
	dr $12bbcd, $12bca7
Tilemap_4a_7ca7:
	dr $12bca7, $12bd5d
Attrmap_4a_7d5d:
	dr $12bd5d, $12be13
Tilemap_4a_7e13:
	dr $12be13, $12bec9
Attrmap_4a_7ec9:
	dr $12bec9, $12bf7f
Tilemap_4a_7f7f:
	dr $12bf7f, $12bfab
Attrmap_4a_7fab:
	dr $12bfab, $12bfd7
unk_4a_7fd7:
	dr $12bfd7, $12bfff


