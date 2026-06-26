; Battle intro phase (HandleBattleIntro) and battle-intro UI graphics.
HandleBattleIntro::
	ld de, .Jumptable
	ld a, [wBattleIntroJumptableIndex]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw BattleIntro_Jump_1
	dw BattleIntro_Jump_2
	dw BattleIntro_Jump_3
	dw BattleIntro_Jump_4
	dw BattleIntro_Jump_5
	dw BattleIntro_Jump_6

BattleIntro_Jump_1::
	farcall Func_00b_4dc5
	call DelayFrame
	farcall Func_00b_4dc5
	call DelayFrame
	farcall Func_00b_4dc5
	call DelayFrame
	call AdvanceRNG
	ld a, [wd991]
	and 7
	ld [wdcd9], a
	xor a
	ld [wdcda], a
	farcall StartBattleTransition
	call DelayFrame
	ld a, $e1
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, $80
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	ld de, wScreenRowBuffer
	ld bc, $80
	call CopyBytes3
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4

.oam_loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .oam_loop
	ldh a, [hSCX]
	ld [wd9ec], a
	ldh a, [hSCXHigh]
	ld [wd9ed], a
	ldh a, [hSCY]
	ld [wd9ee], a
	ldh a, [hSCYHigh]
	ld [wd9ef], a
	xor a
	ldh [hFade], a
	ldh [hSCX], a
	ldh [hSCXHigh], a
	ldh [hSCY], a
	ldh [hSCYHigh], a
	ld [wd9f8], a
	ld [wBattleScriptByte], a
	ld [wd9cc], a
	ld [wd9cd], a
	ld [wd9ca], a
	ld [wd9cb], a
	ld [wd9f6], a
	ld [wd9f5], a
	ld [wd9ea], a
	ld [wdb18], a
	ld [wd996], a
	ld [wd997], a
	ld [wd9b4], a
	ld [wd9b3], a
	ld [wd9b8], a
	ld [wd9b9], a
	call ClearBGMap0
	ld hl, wd978
	ld c, 8
	xor a

.clear_loop
	ld [hli], a
	dec c
	jr nz, .clear_loop
	ld a, 1
	ld [wBattleIntroJumptableIndex], a
	ld bc, wPartyMons

.party_loop
	ld hl, $13
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, .next
	and 1
	ld [hl], a

.next
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $80
	jr c, .party_loop
	call DelayFrame
	ret

BattleIntro_Jump_2::
	call DelayFrame
	call PlayBattleMusic
	ld a, [wd981]
	ld l, a
	ld a, [wd982]
	ld h, a
	ld a, [hl]
	ld [wd9e5], a
	farcall Func_02c_4000
	call DelayFrame
	farcall SetupEnemyNameWindow
	call Func_02b_6ad1
	call DelayFrame
	ld hl, Battle_UI_GFX
	ld de, $96d0
	ld bc, $90
	call CopyBytesVRAM
	ld hl, Battle_TextBoxBorder_GFX
	ld de, $9000
	ld bc, $d0
	call CopyBytesVRAM
	call DelayFrame
	ld hl, Battle_BGPals
	ld de, wPaletteBuffer
	ld bc, $30
	call CopyBytes3
	ld hl, Battle_OBPals
	ld de, wcaf0
	ld bc, $30
	call CopyBytes3
	call DelayFrame
	ld de, Battle_PlayerFace_BGMap
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Battle_PlayerFace_AttrMap
	ld hl, $9802
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	ld de, Battle_EnemyFace_BGMap
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ld de, Battle_EnemyFace_AttrMap
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ldh [hVRAMCopyHeight], a
	call PlaceAttrmap
	call DelayFrame
	ld a, 2
	ld [wBattleIntroJumptableIndex], a
	call Func_02b_6a41
	ret

PlayBattleMusic::
	ld de, BattleMusic
	ld a, [wBattleMusic]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	call PlaySound
	ret

PlayMusic_74::
	ld a, BGM_74
	call PlaySound
	ret

PlayMeteorMusic::
	ld a, BGM_METEOR
	call PlaySound
	ret

BattleMusic::
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1
	db BGM_BATTLE1, BGM_BATTLE2, BGM_BATTLE3, BGM_BATTLE4, BGM_BATTLE1

Func_02b_6a33::
	ld hl, wd93c
	ld c, 6
	jr asm_02b_6a46

Func_02b_6a3a::
	ld hl, wd900
	ld c, 6
	jr asm_02b_6a46

Func_02b_6a41::
	ld hl, wd900
	ld c, $c

asm_02b_6a46::
	ld a, $a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, asm_02b_6a46
	ret

BattleIntro_Jump_3::
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld a, $40
	ldh [hSCX], a
	ld a, $c0
	ld [wWX], a
	xor a
	ld [wWY], a
	ld hl, $1072
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e1], a
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	ld a, 3
	ld [wBattleIntroJumptableIndex], a
	ret

BattleIntro_Jump_4::
	ldh a, [hSCX]
	sub 2
	ldh [hSCX], a
	ld a, [wWX]
	add 2
	ld [wWX], a
	and a
	jr z, .done
	ret

.done
	ld a, 4
	ld [wBattleIntroJumptableIndex], a
	ld de, Battle_StatusPanel_BGMap
	ld hl, $98e1
	ld bc, $0904
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	call Func_02b_6ae6
	ret

Func_02b_6abc::
	ld de, Battle_HUD_BGMap
	ld hl, $9980
	ld bc, $1406
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	ret

Func_02b_6ad1::
	ld hl, wMenuTextBuffer
	ld a, $55
	ld [wMenuTextX], a
	ld a, $61
	ld [wMenuTextEndX], a
	xor a
	ld [wCharacterTilePos], a
	call PrintMenuText
	ret

Func_02b_6ae6::
	xor a
	ld [wd0c1], a
	ld de, $9942
	ld bc, wPartyMons

.party_loop
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .enemy_start
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .party_fainted
	call WaitVRAM_STAT
	ld a, $6d
	ld [de], a
	jr .party_next

.party_fainted
	call WaitVRAM_STAT
	ld a, $6e
	ld [de], a

.party_next
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 6
	jr c, .party_loop

.enemy_start
	xor a
	ld [wd0c1], a
	ld a, [wd9dc]
	and a
	ret z
	ld de, $988b
	ld bc, wd876

.enemy_loop
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .enemy_fainted
	call WaitVRAM_STAT
	ld a, $6d
	ld [de], a
	jr .enemy_next

.enemy_fainted
	call WaitVRAM_STAT
	ld a, $6e
	ld [de], a

.enemy_next
	ld hl, $16
	add hl, bc
	push hl
	pop bc
	inc e
	ld a, [wd0c1]
	inc a
	ld [wd0c1], a
	cp 6
	jr c, .enemy_loop
	ret

BattleIntro_Jump_5::
	ld a, 1
	ld [wd986], a
	ld a, 1
	ld [wd9b5], a
	call AdvanceRNG
	ld a, [wd991]
	and 1
	add $55
	ld [wd3ff], a
	farcall Func_02d_4000
	call Wait32Frames
	call Wait32Frames
	xor a
	ld [wd9b5], a
	call AdvanceRNG
	ld a, [wd991]
	and 1
	add 2
	ld [wd3ff], a
	farcall Func_02d_4000
	ld a, 9
	ldh [hVRAMCopyWidth], a
	ld a, 4
	ldh [hVRAMCopyHeight], a
	ld bc, $0904
	ld hl, $9829
	call ClearBGMapBox
	ld bc, $0904
	ld hl, $98e1
	call ClearBGMapBox
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	ld bc, $1406
	ld hl, $9980
	call ClearBGMapBox
	ld a, 5
	ld [wBattleIntroJumptableIndex], a
	ret

BattleIntro_Jump_6::
	ld a, [wWX]
	sub 4
	ld [wWX], a
	cp $c0
	ret nc
	ld hl, $98cc
	ld bc, $0606
	ld a, 6
	ldh [hVRAMCopyWidth], a
	ld a, 6
	ldh [hVRAMCopyHeight], a
	call ClearBGMapBox
	xor a
	ldh [hSCX], a
	ld [wWX], a
	ld a, 2
	ldh [hBattleJumptableIndex], a
	xor a
	ld [wBattleIntroJumptableIndex], a
	di
	ld a, $8f
	ldh [rLYC], a
	ei
	ld hl, $106f
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e1], a
	ret

Battle_TextBoxBorder_GFX:: INCBIN "gfx/battle_intro/textbox_border.2bpp"

Battle_UI_GFX:: INCBIN "gfx/battle_intro/ui.2bpp"

Battle_BGPals:: INCBIN "gfx/battle_intro/bg.pal"

Battle_StatusPanel_BGMap:: INCBIN "gfx/battle_intro/statuspanel_a.tilemap"
; Second 9x4 frame, not referenced by disassembled code.
	INCBIN "gfx/battle_intro/statuspanel_b.tilemap"

Battle_HUD_BGMap:: INCBIN "gfx/battle_intro/hud.tilemap"

Battle_PlayerFace_BGMap:: INCBIN "gfx/battle_intro/face_player.tilemap"

Battle_EnemyFace_BGMap:: INCBIN "gfx/battle_intro/face_enemy.tilemap"

Battle_EnemyFace_AttrMap:: INCBIN "gfx/battle_intro/face_enemy_a.gbcattr"
; Second 6x6 attrmap, not referenced by disassembled code.
	INCBIN "gfx/battle_intro/face_enemy_b.gbcattr"

Battle_PlayerFace_AttrMap:: INCBIN "gfx/battle_intro/face_player.gbcattr"

Battle_Panel10x4_BGMap:: INCBIN "gfx/battle_intro/panel10x4.tilemap"

Battle_Panel10x4_AttrMap:: INCBIN "gfx/battle_intro/panel10x4.gbcattr"

Battle_Panel10x3_BGMap:: INCBIN "gfx/battle_intro/panel10x3.tilemap"

Battle_Panel10x3_AttrMap:: INCBIN "gfx/battle_intro/panel10x3.gbcattr"

Battle_Panel13x6_BGMap:: INCBIN "gfx/battle_intro/panel13x6.tilemap"

Battle_Panel11x10_BGMap:: INCBIN "gfx/battle_intro/panel11x10.tilemap"

Battle_Panel11x10_AttrMap:: INCBIN "gfx/battle_intro/panel11x10.gbcattr"

Battle_Panel9x6_BGMap:: INCBIN "gfx/battle_intro/panel9x6.tilemap"

Battle_HUDFont_GFX:: INCBIN "gfx/battle_intro/hud_font.2bpp"

Battle_HUDStats_GFX:: INCBIN "gfx/battle_intro/hud_stats.2bpp"

; Last $20 bytes alias as GFX copied to vTiles $8700.
; TODO: indexed mid-block (+offset at runtime); consider per-entry sub-labels
Battle_OBPals:: INCBIN "gfx/battle_intro/ob.pal"

; Source entry consumed by BuildOAMList: y, x, tile, attr.
; The third source byte is skipped by the reader, so it is reserved.
MACRO oam_build_entry
	db \1 ; y, + base y in c
	db \2 ; x, + base x in b
	db 0  ; (skipped by reader)
	db \3 ; tile
	db \4 ; attr
ENDM


Func_02b_7506::
	ld hl, wcde0
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld hl, wcdf0
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ret


Func_02b_7525::
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret


Func_02b_7536::
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ld [wVirtualOAMPtr], a
	call BuildOAMList
	ret


; Builds OAM entries from the list selected by wcde2.
; wcde0/wcde1 = base y/x offset, wVirtualOAMPtr = write cursor into wVirtualOAM.
BuildOAMList::
	ld hl, OAMList_Pointers
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
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wVirtualOAMPtr]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.loop
	ld a, [hli]
	cp -1
	jr z, .done
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
	jr .loop
.done
	ld a, e
	ld [wVirtualOAMPtr], a
	ret


OAMList_Pointers::
	dw OAMList_758e
	dw OAMList_758e
	dw OAMList_758e

OAMList_758e::
	; y, x, tile, attr
	oam_build_entry $00, $00, $70, $01
	db -1


BattleAnimTable_02b_7594::
	db $00, $0f, $23, $23, $14, $00, $00, $00, $00, $0f, $37, $00, $00, $00, $00, $28
	db $0f, $00, $00, $00, $5a, $14, $2a, $00, $00, $1e, $0f, $00, $14, $00, $19, $14
	db $2d, $28, $00, $00, $00, $00, $00, $00, $00, $00, $37, $14, $14, $23, $44, $00
	db $00, $19, $1e, $23, $32, $41, $00, $32, $28, $2e, $40, $32, $32, $32, $00, $00
	db $14, $19, $1e, $37, $4b, $78, $55, $14, $19, $32, $2d, $46, $14, $28, $3c, $50
	db $0f, $14, $1e, $23, $3a, $50, $00, $14, $0f, $28, $3c, $50, $00, $14, $19, $12
	db $28, $3c, $50, $00, $00, $00, $00, $0f, $14, $28, $39, $4b, $00, $00, $00, $00
	db $00, $00, $14, $26, $3e, $0f, $50, $00, $1e, $46, $00, $50, $00, $00, $14, $00
	db $00, $00, $00, $50, $00

; ramp ascending to $c8
; TODO: unk_ - data, referenced via `ld de, unk_02b_7619 + $a`
unk_02b_7619::
	db $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $64, $6e, $6e, $78, $78, $82
	db $82, $8c, $8c, $96, $96, $a0, $a0, $aa, $aa, $b4, $b4, $be, $be, $c8, $c8

; ramp descending to $00
; TODO: unk_ - data, referenced via `ld de, unk_02b_7638`
unk_02b_7638::
	db $64, $5f, $5f, $5a, $5a, $55, $55, $50, $50, $4b, $4b, $46, $46, $41, $41, $3c
	db $3c, $37, $37, $32, $32, $00, $00, $00
