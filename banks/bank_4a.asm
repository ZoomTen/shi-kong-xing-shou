Func_04a_4000::
	ld de, Learnset_Pointers
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
.asm_4014
	ld a, [wd9e8]
	cp [hl]
	jr z, .asm_4023
	ld a, [hl]
	cp $FF
	jr z, .asm_4082
	inc hl
	inc hl
	jr .asm_4014
.asm_4023
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
.asm_403a
	ld a, [hl]
	cp d
	jr z, .asm_4082
	and a
	jr z, .asm_406e
	add hl, bc
	dec e
	jr nz, .asm_403a
	call ClearBGMap0
	call Func_04a_412a
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0D
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld de, wd1a0
	ld a, $0B
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedOption]
	ld [hli], a
	ret
.asm_406e
	ld a, [wd9e3]
	ld [hli], a
	ld [wd9bf], a
	push hl
	farcall LookupMovePP
	pop hl
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
.asm_4082
	ld a, $0C
	ld [hFFC5], a
	call Func_04a_412a
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret

LearnLevelUpMove::
	ld de, Learnset_Pointers
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
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	call ClearBGMap0
	call Func_04a_412a
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0D
	ld [hFFC5], a
.asm_40f6
	call DelayFrame
	ld a, [hFFC5]
	and a
	jr z, .asm_4107
	farcall _ExecuteBattleScript
	jr .asm_40f6
.asm_4107
	ret
.asm_4108
	push hl
	ld a, $33
	ld [wBattleMessageID], a
	farcall ShowBattleMessage
	pop hl
	ld a, [wd9e3]
	ld [hli], a
	push hl
	ld [wd9bf], a
	farcall LookupMovePP
	pop hl
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ret

Func_04a_412a::
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
Learnset_Pointers:: INCLUDE "data/monsters/learnsets.asm"
TextFont_GFX:: INCBIN "gfx/misc/textfont_gfx.2bpp"
Func_04a_5691::
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
Attrmap_4a_56ef:: db $07, $0c
	INCBIN "gfx/attrmaps/attrmap_4a_56ef.bin"
Tilemap_4a_5745:: db $07, $0c
	INCBIN "gfx/tilemaps/tilemap_4a_5745.tilemap"
Attrmap_4a_579b:: db $14, $12
	INCBIN "gfx/attrmaps/attrmap_4a_579b.bin"
Tilemap_4a_5905:: db $14, $12
	INCBIN "gfx/tilemaps/tilemap_4a_5905.tilemap"
Tilemap_4a_5a6f:: db $14, $12
	INCBIN "gfx/tilemaps/tilemap_4a_5a6f.tilemap"
Attrmap_4a_5bd9:: db $14, $09
	INCBIN "gfx/attrmaps/attrmap_4a_5bd9.bin"
Tilemap_4a_5c8f:: db $14, $09
	INCBIN "gfx/tilemaps/tilemap_4a_5c8f.tilemap"
Tilemap_4a_5d45:: db $14, $09
	INCBIN "gfx/tilemaps/tilemap_4a_5d45.tilemap"
Attrmap_4a_5dfb:: db $14, $09
	INCBIN "gfx/attrmaps/attrmap_4a_5dfb.bin"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
IF !DEF(ENGLISH)
unk_4a_5eb1::
	ds 18 ; unreferenced padding; dropped in EN to fit the widened dex-list panel
ENDC
Tilemap_4a_5ec3:: db $02, $01
	INCBIN "gfx/tilemaps/tilemap_4a_5ec3.tilemap"
Tilemap_4a_5ec7:: db $01, $02
	INCBIN "gfx/tilemaps/tilemap_4a_5ec7.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5ecb::
	ds 13
Tilemap_4a_5ed8:: db $17, $0a
	INCBIN "gfx/tilemaps/tilemap_4a_5ed8.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5fc0::
	ds 5
Tilemap_4a_5fc5:: db $08, $0a
	INCBIN "gfx/tilemaps/tilemap_4a_5fc5.tilemap"
Tilemap_4a_6017:: db $07, $08
	INCBIN "gfx/tilemaps/tilemap_4a_6017.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
IF !DEF(ENGLISH)
unk_4a_6051::
	ds 28 ; unreferenced padding; dropped in EN to fit the widened dex-list panel
ENDC
Tilemap_4a_606d:: db $0c, $06
	INCBIN "gfx/tilemaps/tilemap_4a_606d.tilemap"
Attrmap_4a_60b7:: db $0c, $06
	INCBIN "gfx/attrmaps/attrmap_4a_60b7.bin"
Tilemap_4a_6101:: db $07, $0c
	INCBIN "gfx/tilemaps/tilemap_4a_6101.tilemap"
Attrmap_4a_6157:: db $07, $0c
	INCBIN "gfx/attrmaps/attrmap_4a_6157.bin"
Tilemap_4a_61ad:: db $14, $06
	INCBIN "gfx/tilemaps/tilemap_4a_61ad.tilemap"
Attrmap_4a_6227:: db $14, $06
	INCBIN "gfx/attrmaps/attrmap_4a_6227.bin"
Tilemap_4a_62a1:: db $14, $06
	INCBIN "gfx/tilemaps/tilemap_4a_62a1.tilemap"
Tilemap_4a_631b:: db $07, $04
	INCBIN "gfx/tilemaps/tilemap_4a_631b.tilemap"
Attrmap_4a_6339:: db $07, $04
	INCBIN "gfx/attrmaps/attrmap_4a_6339.bin"
Tilemap_4a_6357:: db $0e, $0c
	INCBIN "gfx/tilemaps/tilemap_4a_6357.tilemap"
Attrmap_4a_6401:: db $0e, $0c
	INCBIN "gfx/attrmaps/attrmap_4a_6401.bin"
Tilemap_4a_64ab:: db $07, $06
	INCBIN "gfx/tilemaps/tilemap_4a_64ab.tilemap"
Attrmap_4a_64d7:: db $07, $06
	INCBIN "gfx/attrmaps/attrmap_4a_64d7.bin"
Tilemap_4a_6503:: db $06, $04
	INCBIN "gfx/tilemaps/tilemap_4a_6503.tilemap"
Attrmap_4a_651d:: db $06, $04
	INCBIN "gfx/attrmaps/attrmap_4a_651d.bin"
Tilemap_4a_6537:: db $14, $06
	INCBIN "gfx/tilemaps/tilemap_4a_6537.tilemap"
Attrmap_4a_65b1:: db $14, $06
	INCBIN "gfx/attrmaps/attrmap_4a_65b1.bin"
Tilemap_4a_662b:: db $05, $06
	INCBIN "gfx/tilemaps/tilemap_4a_662b.tilemap"
Attrmap_4a_664b:: db $05, $06
	INCBIN "gfx/attrmaps/attrmap_4a_664b.bin"
Tilemap_4a_666b:: db $0b, $0a
	INCBIN "gfx/tilemaps/tilemap_4a_666b.tilemap"
Attrmap_4a_66db:: db $0b, $0a
	INCBIN "gfx/attrmaps/attrmap_4a_66db.bin"
Tilemap_4a_674b:: db $05, $06
	INCBIN "gfx/tilemaps/tilemap_4a_674b.tilemap"
Attrmap_4a_676b:: db $05, $06
	INCBIN "gfx/attrmaps/attrmap_4a_676b.bin"
Tilemap_4a_678b:: db $0c, $06
	INCBIN "gfx/tilemaps/tilemap_4a_678b.tilemap"
Attrmap_4a_67d5:: db $0c, $06
	INCBIN "gfx/attrmaps/attrmap_4a_67d5.bin"
; EN mon box: bottom row keeps a continuous $07 edge up to the exposed corner
; (the EN mon# prints at cols 3-5; ZH printed at 4-6 with a 09 prefix at col 3).
Tilemap_4a_681f:: db $08, $08
	INCBIN "gfx/tilemaps/tilemap_4a_681f.tilemap"
Attrmap_4a_6861:: db $08, $08
	INCBIN "gfx/attrmaps/attrmap_4a_6861.bin"
Tilemap_4a_68a3:: db $08, $07
	INCBIN "gfx/tilemaps/tilemap_4a_68a3.tilemap"
Attrmap_4a_68dd:: db $08, $07
	INCBIN "gfx/attrmaps/attrmap_4a_68dd.bin"
IF DEF(ENGLISH)
; EN dex-list panel: 11 wide (was 10), placed one column left (col9) so the mon box
; can sit flush at col0 and the inter-panel gap survives. Name grid is 7 columns at
; stride 14 tiles/row: [border][icon][gap][7-col name][border]. Matched by the shifted
; placement coords in bank_24, asm_026_4680 (stride) and DrawDexNamePage (clear+icon).
Tilemap_4a_6917:: db $0b, $12
	INCBIN "gfx/tilemaps/tilemap_4a_6917.tilemap"
Attrmap_4a_69cd:: db $0b, $12
	INCBIN "gfx/attrmaps/attrmap_4a_69cd.bin"
ELSE
Tilemap_4a_6917:: db $0a, $12
	INCBIN "gfx/tilemaps/tilemap_4a_6917.tilemap"
Attrmap_4a_69cd:: db $0a, $12
	INCBIN "gfx/attrmaps/attrmap_4a_69cd.bin"
ENDC
IF DEF(ENGLISH)
; EN dex name/type box widened 7->10 tiles: the type-name field gains 3 columns.
; The type field is relocated to free VRAM $ec-$f5 (see Func_01e_4290) because the
; ZH slot $3c-$3f is boxed in by BattleUIGFX at $40+; the extra columns point there.
Tilemap_4a_6a83:: db $0a, $05
	INCBIN "gfx/tilemaps/tilemap_4a_6a83.tilemap"
Attrmap_4a_6aa8:: db $0a, $05
	INCBIN "gfx/attrmaps/attrmap_4a_6aa8.bin"
ELSE
Tilemap_4a_6a83:: db $07, $05
	INCBIN "gfx/tilemaps/tilemap_4a_6a83.tilemap"
Attrmap_4a_6aa8:: db $07, $05
	INCBIN "gfx/attrmaps/attrmap_4a_6aa8.bin"
ENDC
Tilemap_4a_6acd:: db $14, $0a
	INCBIN "gfx/tilemaps/tilemap_4a_6acd.tilemap"
Attrmap_4a_6b97:: db $14, $0a
	INCBIN "gfx/attrmaps/attrmap_4a_6b97.bin"
Tilemap_4a_6c61:: db $14, $12
	INCBIN "gfx/tilemaps/tilemap_4a_6c61.tilemap"
Attrmap_4a_6dcb:: db $14, $12
	INCBIN "gfx/attrmaps/attrmap_4a_6dcb.bin"
SaveScreenPlayerPanelTilemap:: db $0c, $0c
	INCBIN "gfx/tilemaps/savescreen_playerpanel.tilemap"
SaveScreenPlayerPanelAttrmap:: db $0c, $0c
	INCBIN "gfx/attrmaps/savescreen_playerpanel_attrmap.bin"
SaveScreenRecordsPanelTilemap:: db $08, $0c
	INCBIN "gfx/tilemaps/savescreen_recordspanel.tilemap"
SaveScreenRecordsPanelAttrmap:: db $08, $0c
	INCBIN "gfx/attrmaps/savescreen_recordspanel_attrmap.bin"
SaveScreenConfirmBarTilemap:: db $14, $06
	INCBIN "gfx/tilemaps/savescreen_confirmbar.tilemap"
SaveScreenConfirmBarAttrmap:: db $14, $06
	INCBIN "gfx/attrmaps/savescreen_confirmbar_attrmap.bin"
SaveRecordBoxTilemap:: db $12, $09
	INCBIN "gfx/tilemaps/saverecordbox.tilemap"
SaveRecordBoxAttrmap:: db $12, $09
	INCBIN "gfx/attrmaps/saverecordbox_attrmap.bin"
Tilemap_4a_7359:: db $14, $06
	INCBIN "gfx/tilemaps/tilemap_4a_7359.tilemap"
Attrmap_4a_73d3:: db $14, $04
	INCBIN "gfx/attrmaps/attrmap_4a_73d3.bin"
Attrmap_4a_7425:: db $14, $08
	INCBIN "gfx/attrmaps/attrmap_4a_7425.bin"
Attrmap_4a_74c7:: db $14, $06
	INCBIN "gfx/attrmaps/attrmap_4a_74c7.bin"
Tilemap_4a_7541:: db $14, $04
	INCBIN "gfx/tilemaps/tilemap_4a_7541.tilemap"
Tilemap_4a_7593:: db $14, $08
	INCBIN "gfx/tilemaps/tilemap_4a_7593.tilemap"
Tilemap_4a_7635:: db $14, $06
	INCBIN "gfx/tilemaps/tilemap_4a_7635.tilemap"
Tilemap_4a_76af:: db $0b, $04
	INCBIN "gfx/tilemaps/tilemap_4a_76af.tilemap"
Attrmap_4a_76dd:: db $0b, $04
	INCBIN "gfx/attrmaps/attrmap_4a_76dd.bin"
Tilemap_4a_770b:: db $05, $06
	INCBIN "gfx/tilemaps/tilemap_4a_770b.tilemap"
Attrmap_4a_772b:: db $05, $06
	INCBIN "gfx/attrmaps/attrmap_4a_772b.bin"
Tilemap_4a_774b:: db $09, $0c
	INCBIN "gfx/tilemaps/tilemap_4a_774b.tilemap"
Attrmap_4a_77b9:: db $09, $0c
	INCBIN "gfx/attrmaps/attrmap_4a_77b9.bin"
Tilemap_4a_7827:: db $0d, $0c
	INCBIN "gfx/tilemaps/tilemap_4a_7827.tilemap"
Attrmap_4a_78c5:: db $0d, $0c
	INCBIN "gfx/attrmaps/attrmap_4a_78c5.bin"
Tilemap_4a_7963:: db $0a, $06
	INCBIN "gfx/tilemaps/tilemap_4a_7963.tilemap"
Attrmap_4a_79a1:: db $0a, $06
	INCBIN "gfx/attrmaps/attrmap_4a_79a1.bin"
Tilemap_4a_79df:: db $0a, $0c
	INCBIN "gfx/tilemaps/tilemap_4a_79df.tilemap"
Attrmap_4a_7a59:: db $0a, $0c
	INCBIN "gfx/attrmaps/attrmap_4a_7a59.bin"
Tilemap_4a_7ad3:: db $05, $06
	INCBIN "gfx/tilemaps/tilemap_4a_7ad3.tilemap"
Tilemap_4a_7af3:: db $0c, $12
	INCBIN "gfx/tilemaps/tilemap_4a_7af3.tilemap"
Attrmap_4a_7bcd:: db $0c, $12
	INCBIN "gfx/attrmaps/attrmap_4a_7bcd.bin"
Tilemap_4a_7ca7:: db $14, $09
	INCBIN "gfx/tilemaps/tilemap_4a_7ca7.tilemap"
Attrmap_4a_7d5d:: db $14, $09
	INCBIN "gfx/attrmaps/attrmap_4a_7d5d.bin"
Tilemap_4a_7e13:: db $14, $09
	INCBIN "gfx/tilemaps/tilemap_4a_7e13.tilemap"
Attrmap_4a_7ec9:: db $14, $09
	INCBIN "gfx/attrmaps/attrmap_4a_7ec9.bin"
Tilemap_4a_7f7f:: db $07, $06
	INCBIN "gfx/tilemaps/tilemap_4a_7f7f.tilemap"
Attrmap_4a_7fab:: db $07, $06
	INCBIN "gfx/attrmaps/attrmap_4a_7fab.bin"
; overworld script (launched from bank 24 via wScriptPos/hScriptBank), then zero-padding to bank end
Script_4a_7fd7::
	fadeout
	worldmap
	endrestore


