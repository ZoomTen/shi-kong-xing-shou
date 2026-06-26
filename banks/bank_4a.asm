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
	farcall Func_024_4053
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
	farcall Func_024_4053
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
INCLUDE "data/monsters/learnsets.asm"
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
Tilemap_4a_56ef:: INCBIN "gfx/tilemaps/tilemap_4a_56ef.tilemap"
Attrmap_4a_5745:: INCBIN "gfx/attrmaps/attrmap_4a_5745.bin"
Tilemap_4a_579b:: INCBIN "gfx/tilemaps/tilemap_4a_579b.tilemap"
Attrmap_4a_5905:: INCBIN "gfx/attrmaps/attrmap_4a_5905.bin"
Tilemap_4a_5a6f:: INCBIN "gfx/tilemaps/tilemap_4a_5a6f.tilemap"
Tilemap_4a_5bd9:: INCBIN "gfx/tilemaps/tilemap_4a_5bd9.tilemap"
Attrmap_4a_5c8f:: INCBIN "gfx/attrmaps/attrmap_4a_5c8f.bin"
Tilemap_4a_5d45:: INCBIN "gfx/tilemaps/tilemap_4a_5d45.tilemap"
Attrmap_4a_5dfb:: INCBIN "gfx/attrmaps/attrmap_4a_5dfb.bin"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5eb1::
	ds 18
Tilemap_4a_5ec3:: INCBIN "gfx/tilemaps/tilemap_4a_5ec3.tilemap"
Tilemap_4a_5ec7:: INCBIN "gfx/tilemaps/tilemap_4a_5ec7.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5ecb::
	ds 13
Tilemap_4a_5ed8:: INCBIN "gfx/tilemaps/tilemap_4a_5ed8.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_5fc0::
	ds 5
Tilemap_4a_5fc5:: INCBIN "gfx/tilemaps/tilemap_4a_5fc5.tilemap"
Tilemap_4a_6017:: INCBIN "gfx/tilemaps/tilemap_4a_6017.tilemap"
; TODO: unk_ - orphan (no direct reference; computed pointer or dead)
unk_4a_6051::
	ds 28
Tilemap_4a_606d:: INCBIN "gfx/tilemaps/tilemap_4a_606d.tilemap"
Attrmap_4a_60b7:: INCBIN "gfx/attrmaps/attrmap_4a_60b7.bin"
Tilemap_4a_6101:: INCBIN "gfx/tilemaps/tilemap_4a_6101.tilemap"
Attrmap_4a_6157:: INCBIN "gfx/attrmaps/attrmap_4a_6157.bin"
Tilemap_4a_61ad:: INCBIN "gfx/tilemaps/tilemap_4a_61ad.tilemap"
Attrmap_4a_6227:: INCBIN "gfx/attrmaps/attrmap_4a_6227.bin"
Tilemap_4a_62a1:: INCBIN "gfx/tilemaps/tilemap_4a_62a1.tilemap"
Tilemap_4a_631b:: INCBIN "gfx/tilemaps/tilemap_4a_631b.tilemap"
Attrmap_4a_6339:: INCBIN "gfx/attrmaps/attrmap_4a_6339.bin"
Tilemap_4a_6357:: INCBIN "gfx/tilemaps/tilemap_4a_6357.tilemap"
Attrmap_4a_6401:: INCBIN "gfx/attrmaps/attrmap_4a_6401.bin"
Tilemap_4a_64ab:: INCBIN "gfx/tilemaps/tilemap_4a_64ab.tilemap"
Attrmap_4a_64d7:: INCBIN "gfx/attrmaps/attrmap_4a_64d7.bin"
Tilemap_4a_6503:: INCBIN "gfx/tilemaps/tilemap_4a_6503.tilemap"
Attrmap_4a_651d:: INCBIN "gfx/attrmaps/attrmap_4a_651d.bin"
Tilemap_4a_6537:: INCBIN "gfx/tilemaps/tilemap_4a_6537.tilemap"
Attrmap_4a_65b1:: INCBIN "gfx/attrmaps/attrmap_4a_65b1.bin"
Tilemap_4a_662b:: INCBIN "gfx/tilemaps/tilemap_4a_662b.tilemap"
Attrmap_4a_664b:: INCBIN "gfx/attrmaps/attrmap_4a_664b.bin"
Tilemap_4a_666b:: INCBIN "gfx/tilemaps/tilemap_4a_666b.tilemap"
Attrmap_4a_66db:: INCBIN "gfx/attrmaps/attrmap_4a_66db.bin"
Tilemap_4a_674b:: INCBIN "gfx/tilemaps/tilemap_4a_674b.tilemap"
Attrmap_4a_676b:: INCBIN "gfx/attrmaps/attrmap_4a_676b.bin"
Tilemap_4a_678b:: INCBIN "gfx/tilemaps/tilemap_4a_678b.tilemap"
Attrmap_4a_67d5:: INCBIN "gfx/attrmaps/attrmap_4a_67d5.bin"
Tilemap_4a_681f:: INCBIN "gfx/tilemaps/tilemap_4a_681f.tilemap"
Attrmap_4a_6861:: INCBIN "gfx/attrmaps/attrmap_4a_6861.bin"
Tilemap_4a_68a3:: INCBIN "gfx/tilemaps/tilemap_4a_68a3.tilemap"
Attrmap_4a_68dd:: INCBIN "gfx/attrmaps/attrmap_4a_68dd.bin"
Tilemap_4a_6917:: INCBIN "gfx/tilemaps/tilemap_4a_6917.tilemap"
Attrmap_4a_69cd:: INCBIN "gfx/attrmaps/attrmap_4a_69cd.bin"
Tilemap_4a_6a83:: INCBIN "gfx/tilemaps/tilemap_4a_6a83.tilemap"
Attrmap_4a_6aa8:: INCBIN "gfx/attrmaps/attrmap_4a_6aa8.bin"
Tilemap_4a_6acd:: INCBIN "gfx/tilemaps/tilemap_4a_6acd.tilemap"
Attrmap_4a_6b97:: INCBIN "gfx/attrmaps/attrmap_4a_6b97.bin"
Tilemap_4a_6c61:: INCBIN "gfx/tilemaps/tilemap_4a_6c61.tilemap"
Attrmap_4a_6dcb:: INCBIN "gfx/attrmaps/attrmap_4a_6dcb.bin"
Tilemap_4a_6f35:: INCBIN "gfx/tilemaps/tilemap_4a_6f35.tilemap"
Attrmap_4a_6fc7:: INCBIN "gfx/attrmaps/attrmap_4a_6fc7.bin"
Tilemap_4a_7059:: INCBIN "gfx/tilemaps/tilemap_4a_7059.tilemap"
Attrmap_4a_70bb:: INCBIN "gfx/attrmaps/attrmap_4a_70bb.bin"
Tilemap_4a_711d:: INCBIN "gfx/tilemaps/tilemap_4a_711d.tilemap"
Attrmap_4a_7197:: INCBIN "gfx/attrmaps/attrmap_4a_7197.bin"
Tilemap_4a_7211:: INCBIN "gfx/tilemaps/tilemap_4a_7211.tilemap"
Attrmap_4a_72b5:: INCBIN "gfx/attrmaps/attrmap_4a_72b5.bin"
Tilemap_4a_7359:: INCBIN "gfx/tilemaps/tilemap_4a_7359.tilemap"
Tilemap_4a_73d3:: INCBIN "gfx/tilemaps/tilemap_4a_73d3.tilemap"
Tilemap_4a_7425:: INCBIN "gfx/tilemaps/tilemap_4a_7425.tilemap"
Tilemap_4a_74c7:: INCBIN "gfx/tilemaps/tilemap_4a_74c7.tilemap"
Tilemap_4a_7541:: INCBIN "gfx/tilemaps/tilemap_4a_7541.tilemap"
Tilemap_4a_7593:: INCBIN "gfx/tilemaps/tilemap_4a_7593.tilemap"
Tilemap_4a_7635:: INCBIN "gfx/tilemaps/tilemap_4a_7635.tilemap"
Tilemap_4a_76af:: INCBIN "gfx/tilemaps/tilemap_4a_76af.tilemap"
Attrmap_4a_76dd:: INCBIN "gfx/attrmaps/attrmap_4a_76dd.bin"
Tilemap_4a_770b:: INCBIN "gfx/tilemaps/tilemap_4a_770b.tilemap"
Attrmap_4a_772b:: INCBIN "gfx/attrmaps/attrmap_4a_772b.bin"
Tilemap_4a_774b:: INCBIN "gfx/tilemaps/tilemap_4a_774b.tilemap"
Attrmap_4a_77b9:: INCBIN "gfx/attrmaps/attrmap_4a_77b9.bin"
Tilemap_4a_7827:: INCBIN "gfx/tilemaps/tilemap_4a_7827.tilemap"
Attrmap_4a_78c5:: INCBIN "gfx/attrmaps/attrmap_4a_78c5.bin"
Tilemap_4a_7963:: INCBIN "gfx/tilemaps/tilemap_4a_7963.tilemap"
Attrmap_4a_79a1:: INCBIN "gfx/attrmaps/attrmap_4a_79a1.bin"
Tilemap_4a_79df:: INCBIN "gfx/tilemaps/tilemap_4a_79df.tilemap"
Attrmap_4a_7a59:: INCBIN "gfx/attrmaps/attrmap_4a_7a59.bin"
Tilemap_4a_7ad3:: INCBIN "gfx/tilemaps/tilemap_4a_7ad3.tilemap"
Tilemap_4a_7af3:: INCBIN "gfx/tilemaps/tilemap_4a_7af3.tilemap"
Attrmap_4a_7bcd:: INCBIN "gfx/attrmaps/attrmap_4a_7bcd.bin"
Tilemap_4a_7ca7:: INCBIN "gfx/tilemaps/tilemap_4a_7ca7.tilemap"
Attrmap_4a_7d5d:: INCBIN "gfx/attrmaps/attrmap_4a_7d5d.bin"
Tilemap_4a_7e13:: INCBIN "gfx/tilemaps/tilemap_4a_7e13.tilemap"
Attrmap_4a_7ec9:: INCBIN "gfx/attrmaps/attrmap_4a_7ec9.bin"
Tilemap_4a_7f7f:: INCBIN "gfx/tilemaps/tilemap_4a_7f7f.tilemap"
Attrmap_4a_7fab:: INCBIN "gfx/attrmaps/attrmap_4a_7fab.bin"
; overworld script (launched from bank 24 via wScriptPos/hScriptBank), then zero-padding to bank end
Script_4a_7fd7::
	fadeout
	worldmap
	endrestore


