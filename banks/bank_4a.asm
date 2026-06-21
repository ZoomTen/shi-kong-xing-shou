Func_04a_4000:
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
	ld [wBattleScriptState], a
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
	dw TextLayouts
	dw TextLayouts
	dw TextLayouts_42a4
	dw TextLayouts_42bf
	dw TextLayouts_42dc
	dw TextLayouts_42f9
	dw TextLayouts_4314
	dw TextLayouts_4333
	dw TextLayouts_434e
	dw TextLayouts_436b
	dw TextLayouts_4386
	dw TextLayouts_439f
	dw TextLayouts_43ba
	dw TextLayouts_43d5
	dw TextLayouts_43f0
	dw TextLayouts_440b
	dw TextLayouts_4426
	dw TextLayouts_443f
	dw TextLayouts_4460
	dw TextLayouts_4479
	dw TextLayouts_4492
	dw TextLayouts_44b1
	dw TextLayouts_44ce
	dw TextLayouts_44e7
	dw TextLayouts_4508
	dw TextLayouts_4521
	dw TextLayouts_453e
	dw TextLayouts_4555
	dw TextLayouts_456c
	dw TextLayouts_458b
	dw TextLayouts_45a2
	dw TextLayouts_45bd
	dw TextLayouts_45da
	dw TextLayouts_45f1
	dw TextLayouts_460e
	dw TextLayouts_462b
	dw TextLayouts_4644
	dw TextLayouts_465f
	dw TextLayouts_467c
	dw TextLayouts_4695
	dw TextLayouts_46b0
	dw TextLayouts_46cd
	dw TextLayouts_46ec
	dw TextLayouts_470d
	dw TextLayouts_4724
	dw TextLayouts_473f
	dw TextLayouts_4758
	dw TextLayouts_476d
	dw TextLayouts_4786
	dw TextLayouts_479f
	dw TextLayouts_47b8
	dw TextLayouts_47d1
	dw TextLayouts_47e8
	dw TextLayouts_47ff
	dw TextLayouts_4816
	dw TextLayouts_482d
	dw TextLayouts_4846
	dw TextLayouts_4865
	dw TextLayouts_487a
	dw TextLayouts_4899
	dw TextLayouts_48b2
	dw TextLayouts_48cd
	dw TextLayouts_48ea
	dw TextLayouts_48ff
	dw TextLayouts_491c
	dw TextLayouts_493d
	dw TextLayouts_4954
	dw TextLayouts_496f
	dw TextLayouts_4988
	dw TextLayouts_49a3
	dw TextLayouts_49ba
	dw TextLayouts_49d1
	dw TextLayouts_49ea
	dw TextLayouts_4a09
	dw TextLayouts_4a26
	dw TextLayouts_4a3d
	dw TextLayouts_4a58
	dw TextLayouts_4a73
	dw TextLayouts_4a90
	dw TextLayouts_4aaf
	dw TextLayouts_4acc
	dw TextLayouts_4ae3
	dw TextLayouts_4afe
	dw TextLayouts_4b15
	dw TextLayouts_4b2c
	dw TextLayouts_4b45
	dw TextLayouts_4b62
	dw TextLayouts_4b7d
	dw TextLayouts_4b9c
	dw TextLayouts_4bb3
	dw TextLayouts_4bce
	dw TextLayouts_4be5
	dw TextLayouts_4bfe
	dw TextLayouts_4c19
	dw TextLayouts_4c32
	dw TextLayouts_4c4b
	dw TextLayouts_4c68
	dw TextLayouts_4c81
	dw TextLayouts_4ca2
	dw TextLayouts_4cb9
	dw TextLayouts_4cd2
	dw TextLayouts_4ce7
	dw TextLayouts_4d02
	dw TextLayouts_4d1f
	dw TextLayouts_4d36
	dw TextLayouts_4d51
	dw TextLayouts_4d6e
	dw TextLayouts_4d89
	dw TextLayouts_4da8
	dw TextLayouts_4dc1
	dw TextLayouts_4dd8
	dw TextLayouts_4df3
	dw TextLayouts_4e12
	dw TextLayouts_4e2d
	dw TextLayouts_4e46
	dw TextLayouts_4e5d
	dw TextLayouts_4e76
	dw TextLayouts_4e8f
	dw TextLayouts_4eb0
	dw TextLayouts_4ecf
	dw TextLayouts_4ee6
	dw TextLayouts_4f03
	dw TextLayouts_4f1c
	dw TextLayouts_4f35
	dw TextLayouts_4f4c
	dw TextLayouts_4f65
	dw TextLayouts_4f7a
	dw TextLayouts_4f93
	dw TextLayouts_4fae
	dw TextLayouts_4fcb
	dw TextLayouts_4fe2
	dw TextLayouts_4ff9
	dw TextLayouts_5012
	dw TextLayouts_502f
	dw TextLayouts_5048
	dw TextLayouts_5067
	dw TextLayouts_5086
	dw TextLayouts_509f
	dw TextLayouts_50bc
	dw TextLayouts_50bf
	dw TextLayouts_50de
	dw TextLayouts_50fb
	dw TextLayouts_5114
	dw TextLayouts_512b
	dw TextLayouts_5142
	dw TextLayouts_515f
	dw TextLayouts_5178
	dw TextLayouts_5195
	dw TextLayouts_51ac
	dw TextLayouts_51c5
	dw TextLayouts_51e4
	dw TextLayouts_51fd
	dw TextLayouts_521b
	dw TextLayouts_5234
	dw TextLayouts_5235
	dw TextLayouts_524c
	dw TextLayouts_525d
	dw TextLayouts_5272
	dw TextLayouts_5283
	dw TextLayouts_529a
TextLayouts:
	dr $128289, $1282a4
TextLayouts_42a4:
	dr $1282a4, $1282bf
TextLayouts_42bf:
	dr $1282bf, $1282dc
TextLayouts_42dc:
	dr $1282dc, $1282f9
TextLayouts_42f9:
	dr $1282f9, $128314
TextLayouts_4314:
	dr $128314, $128333
TextLayouts_4333:
	dr $128333, $12834e
TextLayouts_434e:
	dr $12834e, $12836b
TextLayouts_436b:
	dr $12836b, $128386
TextLayouts_4386:
	dr $128386, $12839f
TextLayouts_439f:
	dr $12839f, $1283ba
TextLayouts_43ba:
	dr $1283ba, $1283d5
TextLayouts_43d5:
	dr $1283d5, $1283f0
TextLayouts_43f0:
	dr $1283f0, $12840b
TextLayouts_440b:
	dr $12840b, $128426
TextLayouts_4426:
	dr $128426, $12843f
TextLayouts_443f:
	dr $12843f, $128460
TextLayouts_4460:
	dr $128460, $128479
TextLayouts_4479:
	dr $128479, $128492
TextLayouts_4492:
	dr $128492, $1284b1
TextLayouts_44b1:
	dr $1284b1, $1284ce
TextLayouts_44ce:
	dr $1284ce, $1284e7
TextLayouts_44e7:
	dr $1284e7, $128508
TextLayouts_4508:
	dr $128508, $128521
TextLayouts_4521:
	dr $128521, $12853e
TextLayouts_453e:
	dr $12853e, $128555
TextLayouts_4555:
	dr $128555, $12856c
TextLayouts_456c:
	dr $12856c, $12858b
TextLayouts_458b:
	dr $12858b, $1285a2
TextLayouts_45a2:
	dr $1285a2, $1285bd
TextLayouts_45bd:
	dr $1285bd, $1285da
TextLayouts_45da:
	dr $1285da, $1285f1
TextLayouts_45f1:
	dr $1285f1, $12860e
TextLayouts_460e:
	dr $12860e, $12862b
TextLayouts_462b:
	dr $12862b, $128644
TextLayouts_4644:
	dr $128644, $12865f
TextLayouts_465f:
	dr $12865f, $12867c
TextLayouts_467c:
	dr $12867c, $128695
TextLayouts_4695:
	dr $128695, $1286b0
TextLayouts_46b0:
	dr $1286b0, $1286cd
TextLayouts_46cd:
	dr $1286cd, $1286ec
TextLayouts_46ec:
	dr $1286ec, $12870d
TextLayouts_470d:
	dr $12870d, $128724
TextLayouts_4724:
	dr $128724, $12873f
TextLayouts_473f:
	dr $12873f, $128758
TextLayouts_4758:
	dr $128758, $12876d
TextLayouts_476d:
	dr $12876d, $128786
TextLayouts_4786:
	dr $128786, $12879f
TextLayouts_479f:
	dr $12879f, $1287b8
TextLayouts_47b8:
	dr $1287b8, $1287d1
TextLayouts_47d1:
	dr $1287d1, $1287e8
TextLayouts_47e8:
	dr $1287e8, $1287ff
TextLayouts_47ff:
	dr $1287ff, $128816
TextLayouts_4816:
	dr $128816, $12882d
TextLayouts_482d:
	dr $12882d, $128846
TextLayouts_4846:
	dr $128846, $128865
TextLayouts_4865:
	dr $128865, $12887a
TextLayouts_487a:
	dr $12887a, $128899
TextLayouts_4899:
	dr $128899, $1288b2
TextLayouts_48b2:
	dr $1288b2, $1288cd
TextLayouts_48cd:
	dr $1288cd, $1288ea
TextLayouts_48ea:
	dr $1288ea, $1288ff
TextLayouts_48ff:
	dr $1288ff, $12891c
TextLayouts_491c:
	dr $12891c, $12893d
TextLayouts_493d:
	dr $12893d, $128954
TextLayouts_4954:
	dr $128954, $12896f
TextLayouts_496f:
	dr $12896f, $128988
TextLayouts_4988:
	dr $128988, $1289a3
TextLayouts_49a3:
	dr $1289a3, $1289ba
TextLayouts_49ba:
	dr $1289ba, $1289d1
TextLayouts_49d1:
	dr $1289d1, $1289ea
TextLayouts_49ea:
	dr $1289ea, $128a09
TextLayouts_4a09:
	dr $128a09, $128a26
TextLayouts_4a26:
	dr $128a26, $128a3d
TextLayouts_4a3d:
	dr $128a3d, $128a58
TextLayouts_4a58:
	dr $128a58, $128a73
TextLayouts_4a73:
	dr $128a73, $128a90
TextLayouts_4a90:
	dr $128a90, $128aaf
TextLayouts_4aaf:
	dr $128aaf, $128acc
TextLayouts_4acc:
	dr $128acc, $128ae3
TextLayouts_4ae3:
	dr $128ae3, $128afe
TextLayouts_4afe:
	dr $128afe, $128b15
TextLayouts_4b15:
	dr $128b15, $128b2c
TextLayouts_4b2c:
	dr $128b2c, $128b45
TextLayouts_4b45:
	dr $128b45, $128b62
TextLayouts_4b62:
	dr $128b62, $128b7d
TextLayouts_4b7d:
	dr $128b7d, $128b9c
TextLayouts_4b9c:
	dr $128b9c, $128bb3
TextLayouts_4bb3:
	dr $128bb3, $128bce
TextLayouts_4bce:
	dr $128bce, $128be5
TextLayouts_4be5:
	dr $128be5, $128bfe
TextLayouts_4bfe:
	dr $128bfe, $128c19
TextLayouts_4c19:
	dr $128c19, $128c32
TextLayouts_4c32:
	dr $128c32, $128c4b
TextLayouts_4c4b:
	dr $128c4b, $128c68
TextLayouts_4c68:
	dr $128c68, $128c81
TextLayouts_4c81:
	dr $128c81, $128ca2
TextLayouts_4ca2:
	dr $128ca2, $128cb9
TextLayouts_4cb9:
	dr $128cb9, $128cd2
TextLayouts_4cd2:
	dr $128cd2, $128ce7
TextLayouts_4ce7:
	dr $128ce7, $128d02
TextLayouts_4d02:
	dr $128d02, $128d1f
TextLayouts_4d1f:
	dr $128d1f, $128d36
TextLayouts_4d36:
	dr $128d36, $128d51
TextLayouts_4d51:
	dr $128d51, $128d6e
TextLayouts_4d6e:
	dr $128d6e, $128d89
TextLayouts_4d89:
	dr $128d89, $128da8
TextLayouts_4da8:
	dr $128da8, $128dc1
TextLayouts_4dc1:
	dr $128dc1, $128dd8
TextLayouts_4dd8:
	dr $128dd8, $128df3
TextLayouts_4df3:
	dr $128df3, $128e12
TextLayouts_4e12:
	dr $128e12, $128e2d
TextLayouts_4e2d:
	dr $128e2d, $128e46
TextLayouts_4e46:
	dr $128e46, $128e5d
TextLayouts_4e5d:
	dr $128e5d, $128e76
TextLayouts_4e76:
	dr $128e76, $128e8f
TextLayouts_4e8f:
	dr $128e8f, $128eb0
TextLayouts_4eb0:
	dr $128eb0, $128ecf
TextLayouts_4ecf:
	dr $128ecf, $128ee6
TextLayouts_4ee6:
	dr $128ee6, $128f03
TextLayouts_4f03:
	dr $128f03, $128f1c
TextLayouts_4f1c:
	dr $128f1c, $128f35
TextLayouts_4f35:
	dr $128f35, $128f4c
TextLayouts_4f4c:
	dr $128f4c, $128f65
TextLayouts_4f65:
	dr $128f65, $128f7a
TextLayouts_4f7a:
	dr $128f7a, $128f93
TextLayouts_4f93:
	dr $128f93, $128fae
TextLayouts_4fae:
	dr $128fae, $128fcb
TextLayouts_4fcb:
	dr $128fcb, $128fe2
TextLayouts_4fe2:
	dr $128fe2, $128ff9
TextLayouts_4ff9:
	dr $128ff9, $129012
TextLayouts_5012:
	dr $129012, $12902f
TextLayouts_502f:
	dr $12902f, $129048
TextLayouts_5048:
	dr $129048, $129067
TextLayouts_5067:
	dr $129067, $129086
TextLayouts_5086:
	dr $129086, $12909f
TextLayouts_509f:
	dr $12909f, $1290bc
TextLayouts_50bc:
	dr $1290bc, $1290bf
TextLayouts_50bf:
	dr $1290bf, $1290de
TextLayouts_50de:
	dr $1290de, $1290fb
TextLayouts_50fb:
	dr $1290fb, $129114
TextLayouts_5114:
	dr $129114, $12912b
TextLayouts_512b:
	dr $12912b, $129142
TextLayouts_5142:
	dr $129142, $12915f
TextLayouts_515f:
	dr $12915f, $129178
TextLayouts_5178:
	dr $129178, $129195
TextLayouts_5195:
	dr $129195, $1291ac
TextLayouts_51ac:
	dr $1291ac, $1291c5
TextLayouts_51c5:
	dr $1291c5, $1291e4
TextLayouts_51e4:
	dr $1291e4, $1291fd
TextLayouts_51fd:
	dr $1291fd, $12921b
TextLayouts_521b:
	dr $12921b, $129234
TextLayouts_5234:
	dr $129234, $129235
TextLayouts_5235:
	dr $129235, $12924c
TextLayouts_524c:
	dr $12924c, $12925d
TextLayouts_525d:
	dr $12925d, $129272
TextLayouts_5272:
	dr $129272, $129283
TextLayouts_5283:
	dr $129283, $12929a
TextLayouts_529a:
	dr $12929a, $1292b1
TextFont_GFX:
INCBIN "gfx/misc/textfont_gfx.2bpp"
Func_04a_5691:
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	push af
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld h, a
	pop af
	ld l, a
	call GetTextBGMapPointer
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
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
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
	ld e, a
	call AdvanceBattleScript
	ld a, [wBattleScriptByte]
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
	ld [wBattleScriptByte], a
	ret
Tilemap_4a_56ef:
INCBIN "gfx/tilemaps/tilemap_4a_56ef.tilemap"
Attrmap_4a_5745:
INCBIN "gfx/attrmaps/attrmap_4a_5745.bin"
Tilemap_4a_579b:
INCBIN "gfx/tilemaps/tilemap_4a_579b.tilemap"
Attrmap_4a_5905:
INCBIN "gfx/attrmaps/attrmap_4a_5905.bin"
Tilemap_4a_5a6f:
INCBIN "gfx/tilemaps/tilemap_4a_5a6f.tilemap"
Tilemap_4a_5bd9:
INCBIN "gfx/tilemaps/tilemap_4a_5bd9.tilemap"
Attrmap_4a_5c8f:
INCBIN "gfx/attrmaps/attrmap_4a_5c8f.bin"
Tilemap_4a_5d45:
INCBIN "gfx/tilemaps/tilemap_4a_5d45.tilemap"
Attrmap_4a_5dfb:
INCBIN "gfx/attrmaps/attrmap_4a_5dfb.bin"
; TODO: unreferenced data block, classify type
unk_4a_5eb1:
	dr $129eb1, $129ec3
Tilemap_4a_5ec3:
INCBIN "gfx/tilemaps/tilemap_4a_5ec3.tilemap"
Tilemap_4a_5ec7:
INCBIN "gfx/tilemaps/tilemap_4a_5ec7.tilemap"
; TODO: unreferenced data block, classify type
unk_4a_5ecb:
	dr $129ecb, $129ed8
Tilemap_4a_5ed8:
INCBIN "gfx/tilemaps/tilemap_4a_5ed8.tilemap"
; TODO: unreferenced data block, classify type
unk_4a_5fc0:
	dr $129fc0, $129fc5
Tilemap_4a_5fc5:
INCBIN "gfx/tilemaps/tilemap_4a_5fc5.tilemap"
Tilemap_4a_6017:
INCBIN "gfx/tilemaps/tilemap_4a_6017.tilemap"
; TODO: unreferenced data block, classify type
unk_4a_6051:
	dr $12a051, $12a06d
Tilemap_4a_606d:
INCBIN "gfx/tilemaps/tilemap_4a_606d.tilemap"
Attrmap_4a_60b7:
INCBIN "gfx/attrmaps/attrmap_4a_60b7.bin"
Tilemap_4a_6101:
INCBIN "gfx/tilemaps/tilemap_4a_6101.tilemap"
Attrmap_4a_6157:
INCBIN "gfx/attrmaps/attrmap_4a_6157.bin"
Tilemap_4a_61ad:
INCBIN "gfx/tilemaps/tilemap_4a_61ad.tilemap"
Attrmap_4a_6227:
INCBIN "gfx/attrmaps/attrmap_4a_6227.bin"
Tilemap_4a_62a1:
INCBIN "gfx/tilemaps/tilemap_4a_62a1.tilemap"
Tilemap_4a_631b:
INCBIN "gfx/tilemaps/tilemap_4a_631b.tilemap"
Attrmap_4a_6339:
INCBIN "gfx/attrmaps/attrmap_4a_6339.bin"
Tilemap_4a_6357:
INCBIN "gfx/tilemaps/tilemap_4a_6357.tilemap"
Attrmap_4a_6401:
INCBIN "gfx/attrmaps/attrmap_4a_6401.bin"
Tilemap_4a_64ab:
INCBIN "gfx/tilemaps/tilemap_4a_64ab.tilemap"
Attrmap_4a_64d7:
INCBIN "gfx/attrmaps/attrmap_4a_64d7.bin"
Tilemap_4a_6503:
INCBIN "gfx/tilemaps/tilemap_4a_6503.tilemap"
Attrmap_4a_651d:
INCBIN "gfx/attrmaps/attrmap_4a_651d.bin"
Tilemap_4a_6537:
INCBIN "gfx/tilemaps/tilemap_4a_6537.tilemap"
Attrmap_4a_65b1:
INCBIN "gfx/attrmaps/attrmap_4a_65b1.bin"
Tilemap_4a_662b:
INCBIN "gfx/tilemaps/tilemap_4a_662b.tilemap"
Attrmap_4a_664b:
INCBIN "gfx/attrmaps/attrmap_4a_664b.bin"
Tilemap_4a_666b:
INCBIN "gfx/tilemaps/tilemap_4a_666b.tilemap"
Attrmap_4a_66db:
INCBIN "gfx/attrmaps/attrmap_4a_66db.bin"
Tilemap_4a_674b:
INCBIN "gfx/tilemaps/tilemap_4a_674b.tilemap"
Attrmap_4a_676b:
INCBIN "gfx/attrmaps/attrmap_4a_676b.bin"
Tilemap_4a_678b:
INCBIN "gfx/tilemaps/tilemap_4a_678b.tilemap"
Attrmap_4a_67d5:
INCBIN "gfx/attrmaps/attrmap_4a_67d5.bin"
Tilemap_4a_681f:
INCBIN "gfx/tilemaps/tilemap_4a_681f.tilemap"
Attrmap_4a_6861:
INCBIN "gfx/attrmaps/attrmap_4a_6861.bin"
Tilemap_4a_68a3:
INCBIN "gfx/tilemaps/tilemap_4a_68a3.tilemap"
Attrmap_4a_68dd:
INCBIN "gfx/attrmaps/attrmap_4a_68dd.bin"
Tilemap_4a_6917:
INCBIN "gfx/tilemaps/tilemap_4a_6917.tilemap"
Attrmap_4a_69cd:
INCBIN "gfx/attrmaps/attrmap_4a_69cd.bin"
Tilemap_4a_6a83:
INCBIN "gfx/tilemaps/tilemap_4a_6a83.tilemap"
Attrmap_4a_6aa8:
INCBIN "gfx/attrmaps/attrmap_4a_6aa8.bin"
Tilemap_4a_6acd:
INCBIN "gfx/tilemaps/tilemap_4a_6acd.tilemap"
Attrmap_4a_6b97:
INCBIN "gfx/attrmaps/attrmap_4a_6b97.bin"
Tilemap_4a_6c61:
INCBIN "gfx/tilemaps/tilemap_4a_6c61.tilemap"
Attrmap_4a_6dcb:
INCBIN "gfx/attrmaps/attrmap_4a_6dcb.bin"
Tilemap_4a_6f35:
INCBIN "gfx/tilemaps/tilemap_4a_6f35.tilemap"
Attrmap_4a_6fc7:
INCBIN "gfx/attrmaps/attrmap_4a_6fc7.bin"
Tilemap_4a_7059:
INCBIN "gfx/tilemaps/tilemap_4a_7059.tilemap"
Attrmap_4a_70bb:
INCBIN "gfx/attrmaps/attrmap_4a_70bb.bin"
Tilemap_4a_711d:
INCBIN "gfx/tilemaps/tilemap_4a_711d.tilemap"
Attrmap_4a_7197:
INCBIN "gfx/attrmaps/attrmap_4a_7197.bin"
Tilemap_4a_7211:
INCBIN "gfx/tilemaps/tilemap_4a_7211.tilemap"
Attrmap_4a_72b5:
INCBIN "gfx/attrmaps/attrmap_4a_72b5.bin"
Tilemap_4a_7359:
INCBIN "gfx/tilemaps/tilemap_4a_7359.tilemap"
Tilemap_4a_73d3:
INCBIN "gfx/tilemaps/tilemap_4a_73d3.tilemap"
Tilemap_4a_7425:
INCBIN "gfx/tilemaps/tilemap_4a_7425.tilemap"
Tilemap_4a_74c7:
INCBIN "gfx/tilemaps/tilemap_4a_74c7.tilemap"
Tilemap_4a_7541:
INCBIN "gfx/tilemaps/tilemap_4a_7541.tilemap"
Tilemap_4a_7593:
INCBIN "gfx/tilemaps/tilemap_4a_7593.tilemap"
Tilemap_4a_7635:
INCBIN "gfx/tilemaps/tilemap_4a_7635.tilemap"
Tilemap_4a_76af:
INCBIN "gfx/tilemaps/tilemap_4a_76af.tilemap"
Attrmap_4a_76dd:
INCBIN "gfx/attrmaps/attrmap_4a_76dd.bin"
Tilemap_4a_770b:
INCBIN "gfx/tilemaps/tilemap_4a_770b.tilemap"
Attrmap_4a_772b:
INCBIN "gfx/attrmaps/attrmap_4a_772b.bin"
Tilemap_4a_774b:
INCBIN "gfx/tilemaps/tilemap_4a_774b.tilemap"
Attrmap_4a_77b9:
INCBIN "gfx/attrmaps/attrmap_4a_77b9.bin"
Tilemap_4a_7827:
INCBIN "gfx/tilemaps/tilemap_4a_7827.tilemap"
Attrmap_4a_78c5:
INCBIN "gfx/attrmaps/attrmap_4a_78c5.bin"
Tilemap_4a_7963:
INCBIN "gfx/tilemaps/tilemap_4a_7963.tilemap"
Attrmap_4a_79a1:
INCBIN "gfx/attrmaps/attrmap_4a_79a1.bin"
Tilemap_4a_79df:
INCBIN "gfx/tilemaps/tilemap_4a_79df.tilemap"
Attrmap_4a_7a59:
INCBIN "gfx/attrmaps/attrmap_4a_7a59.bin"
Tilemap_4a_7ad3:
INCBIN "gfx/tilemaps/tilemap_4a_7ad3.tilemap"
Tilemap_4a_7af3:
INCBIN "gfx/tilemaps/tilemap_4a_7af3.tilemap"
Attrmap_4a_7bcd:
INCBIN "gfx/attrmaps/attrmap_4a_7bcd.bin"
Tilemap_4a_7ca7:
INCBIN "gfx/tilemaps/tilemap_4a_7ca7.tilemap"
Attrmap_4a_7d5d:
INCBIN "gfx/attrmaps/attrmap_4a_7d5d.bin"
Tilemap_4a_7e13:
INCBIN "gfx/tilemaps/tilemap_4a_7e13.tilemap"
Attrmap_4a_7ec9:
INCBIN "gfx/attrmaps/attrmap_4a_7ec9.bin"
Tilemap_4a_7f7f:
INCBIN "gfx/tilemaps/tilemap_4a_7f7f.tilemap"
Attrmap_4a_7fab:
INCBIN "gfx/attrmaps/attrmap_4a_7fab.bin"
; TODO: unreferenced data block, classify type
unk_4a_7fd7:
	dr $12bfd7, $12bfff


