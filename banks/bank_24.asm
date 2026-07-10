InitPlayerCharSprite::
	ld a, [wdcbb]
	and a
	jr nz, .asm_4011
	xor a
	ld [wPlayerSpriteID], a
	ld a, $01
	ld [wcd24], a
	jr .asm_4037
.asm_4011
	ld a, [wPlayerChar]
	cp $03
	jr nz, .asm_4024
	ld hl, wCharVariantFlags
	ld a, [hl]
	cp $80
	jr nz, .asm_4024
	ld a, $08
	jr .asm_4027
.asm_4024
	ld a, [wPlayerChar]
.asm_4027
	ld de, PlayerCharSpriteTable
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wPlayerSpriteID], a
	ld a, [hli]
	ld [wcd24], a
.asm_4037
	call InitPlayerAnim
	farcall LoadPlayerPartnerObjPals
	ret

; [wPlayerChar] * 2 -> db sprite_id, anim_id
PlayerCharSpriteTable::
	db $00, $10
	db $02, $03
	db $04, $05
	db $06, $07
	db $08, $09
	db $0a, $0b
	db $0c, $0d
	db $0e, $0f
	db $36, $07

LookupMovePP::
	ld de, MovePP
	ld a, [wd9bf]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wd9bf], a
	ret

ClearMenuSprites4::
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_406b
	ld a, c
	cp $04
	jr c, .asm_407c
	push hl
	ld a, [hli]
	cp $60
	jr nc, .asm_4081
	ld a, [hli]
	cp $70
	jr c, .asm_4081
	pop hl
.asm_407c
	ld a, $a0
	ld [hl], a
	jr .asm_4082
.asm_4081
	pop hl
.asm_4082
	add hl, de
	dec c
	jr nz, .asm_406b
	call DrawMenuCursorOAM
	ret
ClearMenuSprites12::
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_4093
	ld a, c
	cp $0c
	jr c, .asm_40a4
	push hl
	ld a, [hli]
	cp $60
	jr nc, .asm_40a9
	ld a, [hli]
	cp $70
	jr c, .asm_40a9
	pop hl
.asm_40a4
	ld a, $a0
	ld [hl], a
	jr .asm_40aa
.asm_40a9
	pop hl
.asm_40aa
	add hl, de
	dec c
	jr nz, .asm_4093
	call DrawMenuCursorOAM
	call DrawMenuSpriteSlot1
	call DrawMenuSpriteSlot2
	ret
ClearMenuSprites8::
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_40c1
	ld a, c
	cp $08
	jr c, .asm_40d2
	push hl
	ld a, [hli]
	cp $60
	jr nc, .asm_40d7
	ld a, [hli]
	cp $70
	jr c, .asm_40d7
	pop hl
.asm_40d2
	ld a, $a0
	ld [hl], a
	jr .asm_40d8
.asm_40d7
	pop hl
.asm_40d8
	add hl, de
	dec c
	jr nz, .asm_40c1
	call DrawMenuCursorOAM
	call DrawMenuSpriteSlot1
	ret
ClearAllMenuSprites::
	ld hl, wVirtualOAM
	ld bc, $0027
	ld de, $0004
.asm_40ec
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_40ec
	call DrawMenuCursorOAM
	call DrawMenuSpriteSlot1Low
	call DrawMenuSpriteSlot2Low
	ret

_ExecuteBattleScript::
; Start menu related
	ld a, [_BANKNUM]
	ld [wBattleScriptBank], a
	ld a, [wBattleScriptState]
	cp 1
	jr z, .asm_4111
	cp 2
	jr z, .asm_4129
	jp DispatchMenuState

.asm_4111:
	ld de, MenuScreenScriptPointers
	ldh a, [hFFC5]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wBattleScriptPos], a
	ld a, [hli]
	ld [wBattleScriptPos + 1], a
	ld a, 2
	ld [wBattleScriptState], a
	ret

.asm_4129
	farcall DispatchBattleScriptCommand
	ret

MenuScreenScriptPointers::
	dw Script_024_4162
	dw Script_024_4162
	dw Script_024_4181
	dw Script_024_41b7
	dw Script_024_41cb
	dw Script_024_41e3
	dw Script_024_41ec
	dw Script_024_420a
	dw Script_024_4208
	dw Script_024_42a5
	dw Script_024_42bb
	dw Script_024_42cb
	dw Script_024_42fa
	dw Script_024_430e
	dw Script_024_432e
	dw Script_024_4343
	dw Script_024_4355
	dw Script_024_438b
	dw Script_024_43af
	dw Script_024_4404
	dw Script_024_4421
	dw SaveScreenScript
	dw SaveRecordBoxScript
	dw Script_024_453f
	dw Script_024_4304

Script_024_4162::
	bs_print_text_xy String_025_60a9, $a9, $fd
	bs_vram_copy3 $0090, $8a00, BattleUIGFX_476a
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_place_tile_attr $0d00, Tilemap_4a_5745, Attrmap_4a_56ef
	bs_set_sprite_pos $18, $76
	bs_save_palbuf
	bs_end_script

Script_024_4181::
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $03e0, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_load_mon_bgpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_clear_oam
	bs_set_sprite_pos $18, $08
	bs_lcd_on_loadpal
	bs_end_script
Script_024_41b7::
	bs_print_text_xy String_025_60b7, $a0, $fd
	bs_draw_status_icons
	bs_set_sprite_pos $78, $78
	bs_end_script
Script_024_41c1::
	bs_print_text_xy String_025_60be, $a0, $fd
	bs_draw_status_icons
	bs_set_sprite_pos $78, $78
	bs_end_script
Script_024_41cb::
	bs_place_tile_attr $0d0c, Tilemap_4a_7f7f, Attrmap_4a_7fab
	bs_print_text_xy String_025_6099, $a0, $fd
	bs_place_tile_attr $0000, Tilemap_4a_5905, Attrmap_4a_579b
	bs_print_hp
	bs_print_all_stats
	bs_draw_status_2
	bs_set_cursor
	bs_end_script3
Script_024_41e3::
	bs_place_tile_attr $0000, Tilemap_4a_5d45, Attrmap_4a_5dfb
	bs_draw_equip_list
	bs_end_script3
Script_024_41ec::
	bs_clear_bgbox_at $09, $14, $9800
	bs_vram_copy3 $0080, $8980, BattleUIGFX_527a
	bs_vram_copy3 $0100, $8a00, BattleUIGFX_52fa
	bs_place_tile_attr $0401, Tilemap_4a_606d, Attrmap_4a_60b7
	bs_print_equip_name
	bs_end_script3
Script_024_4208::
	bs_copy_sprite_pos
	bs_end_script3
Script_024_420a::
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_vram_copy3 $0200, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $01e0, $9200, BattleUIGFX_53fa
	bs_vram_copy3 $0140, $8ea0, MenuDigits2GFX
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_6101, Attrmap_4a_6157
	bs_print_menu_pg_a $01
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_print_num_full_2 $0a, wMoney, $0305, $010a
	bs_clear_oam
	bs_set_sprite_pos $18, $10
	bs_lcd_on_loadpal
	bs_end_script
Script_024_424c::
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_vram_copy3 $0200, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $01e0, $9200, BattleUIGFX_53fa
	bs_vram_copy3 $0140, $8ea0, MenuDigits2GFX
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_vram_copy3 $0020, $8e80, BattleUIGFX_4e6a
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_6101, Attrmap_4a_6157
	bs_clear_vram_2
	bs_place_tile_attr $0600, Tilemap_4a_6357, Attrmap_4a_6401
	bs_draw_item_list
	bs_clear_oam
	bs_set_sprite_pos $18, $40
	bs_draw_x_47fb
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_draw_page_arrows
	bs_print_num_full_2 $0a, wMoney, $0305, $010a
	bs_lcd_on_loadpal
	bs_end_script
Script_024_42a5::
	bs_vram_copy3 $0020, $8e80, BattleUIGFX_4e6a
	bs_clear_vram_2
	bs_place_tile_attr $0600, Tilemap_4a_6357, Attrmap_4a_6401
	bs_draw_item_list
	bs_set_sprite_pos $18, $40
	bs_draw_x_47fb
	bs_draw_page_arrows
	bs_end_script
Script_024_42bb::
	bs_print_text_xy String_025_60c8, $90, $a0
	bs_place_tile_attr $0d0c, Tilemap_4a_64ab, Attrmap_4a_64d7
	bs_set_sprite_pos $78, $78
	bs_end_script
Script_024_42cb::
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $03e0, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_load_mon_bgpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_clear_oam
	bs_set_sprite_pos $18, $08
	bs_lcd_on_loadpal
	bs_end_script
Script_024_42fa::
	bs_draw_y
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_draw_party_list
	bs_end_script3
Script_024_4304::
	bs_skip_if_empty $02
	bs_load_bgpal_buf $b100  ; SRAM (monster-box bytes reused as palette)
	db $65, $27, $62, $53, $1a  ; trailing/branch data
Script_024_430e::
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_print_menu_pg_a $04
	bs_print_text_xy String_025_60db, $98, $a0
	bs_place_tile_attr $0f06, Tilemap_4a_662b, Attrmap_4a_664b
	bs_set_sprite_pos $48, $88
	bs_end_script
Script_024_432e::
	bs_place_tile_attr $0902, Tilemap_4a_666b, Attrmap_4a_66db
	bs_draw_party_4
	bs_place_tile_attr $000c, Tilemap_4a_62a1, Attrmap_4a_6227
	bs_print_menu_pg_b $05
	bs_set_sprite_pos $28, $58
	bs_end_script
Script_024_4343::
	bs_print_menu_pg_b $06
	bs_print_text_xy String_025_60db, $18, $20
	bs_place_tile_attr $0f0c, Tilemap_4a_674b, Attrmap_4a_676b
	bs_set_sprite_pos $78, $88
	bs_end_script
Script_024_4355::
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_vram_copy3 $03e0, $9000, MenuDigitsIconsGFX
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_load_mon_bgpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_place_tile_attr $0000, Tilemap_4a_5d45, Attrmap_4a_5dfb
	bs_draw_equip_list
	bs_clear_oam
	bs_set_sprite_pos $18, $10
	bs_lcd_on_loadpal
	bs_end_script
Script_024_438b::
	bs_clear_bgbox_at $09, $14, $9800
	bs_vram_copy3 $0080, $96e0, BattleUIGFX_527a
	bs_print_equip_n $80
	bs_place_tile_attr $0401, Tilemap_4a_678b, Attrmap_4a_67d5
	bs_skip_if_empty $08
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_draw_w_4745
	bs_set_cursor_2
	bs_set_sprite_pos $30, $30
	bs_end_script
Script_024_43af::
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_count_dex
	bs_vram_copy3 $0140, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $0020, $9380, BattleUIGFX_4e0a
	bs_vram_copy3 $0020, $93a0, BattleUIGFX_4e6a
	bs_vram_copy3 $0320, $9400, BattleUIGFX_571a
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_load_mon_bgpal_2 $06
	bs_load_mon_pic_cond $9140
	bs_place_tile_attr $0100, Tilemap_4a_681f, Attrmap_4a_6861
	bs_print_num_indir wd9d8, $0103, $0507
	bs_place_tile_attr $0109, Tilemap_4a_68a3, Attrmap_4a_68dd
	bs_print_two_nums
	bs_place_tile_attr $0a00, Tilemap_4a_6917, Attrmap_4a_69cd
	bs_draw_8_items
	bs_print_num_indir wSelectedPage, $0102, $1111
	bs_clear_oam
	bs_set_sprite_pos $18, $60
	bs_lcd_on_loadpal
	bs_end_script
Script_024_4404::
	bs_clear_bgbox_at $12, $0a, $980a
	bs_clear_bgbox_at $07, $08, $9921
	bs_place_tile_attr $0a01, Tilemap_4a_6a83, Attrmap_4a_6aa8
	bs_draw_text_53ab
	bs_draw_dex_pic
	bs_place_tile_attr $0008, Tilemap_4a_6acd, Attrmap_4a_6b97
	bs_draw_text_5711
	bs_clear_oam
	bs_end_script
Script_024_4421::
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_clear_bgbox_at $12, $14, $9800
	bs_vram_copy3 $0080, $8f60, OptionGFX_00c_5f5c
	bs_vram_copy3 $0100, $8000, Pointers_00c_63dc_63ee
	bs_print_text_xy String_025_60e0, $d0, $dc
	bs_print_text_xy String_025_60e7, $80, $c8
	bs_vram_copy3 $00a0, $8e00, MenuDigitsIconsGFX
	bs_vram_copy3 $0100, $9000, StartMenuBGGFX
	bs_vram_copy3 $0100, $9100, StartMenuBGGFX
	bs_vram_copy3 $0100, $9200, StartMenuBGGFX
	bs_vram_copy3 $0100, $9300, StartMenuBGGFX
	bs_vram_copy3 $0100, $9400, StartMenuBGGFX
	bs_vram_copy3 $0100, $9500, StartMenuBGGFX
	bs_vram_copy3 $0100, $9600, StartMenuBGGFX
	bs_vram_copy3 $0100, $9700, StartMenuBGGFX
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_6c61, Attrmap_4a_6dcb
	bs_draw_8_party
	bs_clear_oam
	bs_set_sprite_pos $20, $14
	bs_set_two_sprites $68, $10, $18, $18
	bs_lcd_on_loadpal
	bs_load_menu_option
	bs_load_pals_b
	bs_draw_v_40b7
	bs_draw_u_54cc
	bs_load_pals_a
	bs_end_script3
SaveScreenScript::
	bs_lcd_off_loadpal
	bs_reset_scroll_clr
	bs_count_dex
	bs_vram_copy3 $0140, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $0140, $9140, MenuDigits2GFX
	bs_vram_copy3 $0400, $9280, SaveScreenLabelsGFX
	bs_vram_copy3 $0010, $97c0, SaveScreenColonGFX
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_draw_text_50ad
IF DEF(ENGLISH)
; EN prompt region spans line 1 ($80+) AND the para line 2 ($a4+, +$24/row), so
; EndX covers through $bd for the pre-print clear; Yes/No moves to $c4-$cf (the
; ZH cells $68-$6f hold only 4 top-row slots -- the 5-tile English strip's final
; flush spilled into $70 and clobbered the player name's first tile).
	bs_print_text_xy String_025_6104, $80, $be
	bs_print_text_xy String_025_610d, $c4, $d0
ELSE
	bs_print_text_xy String_025_6104, $80, $9c
	bs_print_text_xy String_025_610d, $68, $70
ENDC
	bs_place_tile_attr $0000, SaveScreenPlayerPanelTilemap, SaveScreenPlayerPanelAttrmap
	bs_place_tile_attr $0c00, SaveScreenRecordsPanelTilemap, SaveScreenRecordsPanelAttrmap
	bs_place_tile_attr $000c, SaveScreenConfirmBarTilemap, SaveScreenConfirmBarAttrmap
	bs_print_num_full_2 $0a, wMoney, $0305, $0e0a
	bs_print_num_full $14, wCrystalCount, $0102, $0808
	bs_print_num_full_2 $0a, wDexCaughtCount, $0103, $1006
	bs_print_num_full_2 $0a, wDexSeenCount, $0103, $1002
	bs_clear_oam
IF DEF(ENGLISH)
	bs_set_sprite_pos $78, $80 ; cursor one column left, see StartMenu_SaveConfirm
ELSE
	bs_set_sprite_pos $78, $88
ENDC
	bs_draw_ac_407b
	bs_lcd_on_loadpal
	bs_end_script
SaveRecordBoxScript::
	bs_clear_bgbox_at $0c, $14, $9800
	bs_place_tile_attr $0101, SaveRecordBoxTilemap, SaveRecordBoxAttrmap
	bs_draw_clock
	bs_print_num_full_2 $0a, wSaveRecordCaught, $0103, $0608
	bs_print_num_full_2 $0a, wSaveRecordSeen, $0103, $0604
	bs_print_num_full $14, wSaveRecordCrystals, $0102, $1002
	bs_print_num_full_2 $0a, wSaveRecordHours, $0102, $0c08
	bs_print_num_full_2 $0a, wSaveRecordMinutes, $0102, $0f08
	bs_end_script
Script_024_453f::
	bs_print_equip_n $80
	bs_clear_oam
	bs_print_menu_pg_a $07
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_end_script
Script_024_454c::
	bs_init_menu_a
	bs_end_menu
Script_024_454e::
	bs_draw_v_40b7
	bs_load_pals_b
	bs_draw_u_54cc
	bs_load_pals_a
	bs_end_script3
Script_024_4553::
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_end_script3
Script_024_4564::
	bs_lcd_off_loadpal
	bs_load_map_bg
	bs_vram_copy3 $0090, $8a00, BattleUIGFX_476a
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_place_tile_attr $0d00, Tilemap_4a_5745, Attrmap_4a_56ef
	bs_set_sprite_pos $18, $76
	bs_print_text_xy String_025_60a9, $a9, $fd
	bs_load_menu_entry_n $01
	bs_clear_menu_table
	bs_init_bank4
	bs_lcd_on_loadpal
	bs_end_script3
Script_024_4589::
	bs_clear_bgbox $07, $06
	bs_place_tile_attr $0009, Tilemap_4a_5c8f, Attrmap_4a_5bd9
	bs_print_hp
	bs_select_menu $02
	bs_place_tile_attr $0009, Tilemap_4a_5c8f, Attrmap_4a_5bd9
	bs_print_hp
	bs_select_menu $02
Script_024_45a0::
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_print_text_xy String_025_60b7, $a0, $fd
	bs_draw_status_icons
	bs_select_menu $03
Script_024_45b0::
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_print_hp
	bs_print_all_stats
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_set_cursor
	bs_end_script3
Script_024_45c2::
	bs_place_tile_attr $0000, Tilemap_4a_5905, Attrmap_4a_579b
	bs_print_text_xy String_025_6099, $a0, $fd
	bs_print_hp
	bs_print_all_stats
	bs_end_script3
Script_024_45d1::
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_print_hp
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_clear_bgbox_at $07, $11, $9822
	bs_draw_equip_list
	bs_set_cursor
	bs_end_script3
Script_024_45e8::
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_print_hp
	bs_place_tile_attr $0401, Tilemap_4a_606d, Attrmap_4a_60b7
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_print_equip_name
	bs_set_cursor
	bs_end_script3
Script_024_4601::
	bs_clear_bgbox_at $09, $14, $9800
	bs_place_tile_attr $0000, Tilemap_4a_5d45, Attrmap_4a_5dfb
	bs_draw_equip_list
	bs_end_script3
BattleScript_024_460f::
	bs_clear_bgbox_at $09, $14, $9800
	bs_print_text_xy String_025_60b7, $a0, $fd
	bs_draw_status_icons
	bs_draw_party_list
	bs_load_menu_entry
	bs_end_script3
Script_024_461d::
	bs_swap_mon_data
	bs_draw_party_list
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_print_hp
	bs_load_menu_entry_n $03
	bs_end_script3
Script_024_462b::
	bs_clear_bgbox_at $0c, $0e, $9806
	bs_place_tile_attr $0000, Tilemap_4a_6101, Attrmap_4a_6157
	bs_print_num_full_2 $0a, wMoney, $0305, $010a
	bs_print_menu_pg_a $01
	bs_end_script3
Script_024_4642::
	bs_place_tile_attr $0600, Tilemap_4a_6357, Attrmap_4a_6401
	bs_draw_item_list
	bs_draw_page_arrows
	bs_draw_x_47fb
	bs_set_sprite_pos $18, $40
	bs_end_script3
Script_024_4650::
	bs_draw_x_47fb
	bs_end_script3
Script_024_4652::
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_place_tile_attr $0600, Tilemap_4a_6357, Attrmap_4a_6401
	bs_draw_item_list
	bs_draw_x_47fb
	bs_draw_page_arrows
	bs_end_script3
Script_024_4664::
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_draw_x_47fb
	bs_end_script3
Script_024_466d::
	bs_print_text_xy String_025_60cf, $90, $a0
	bs_place_tile_attr $0d0c, Tilemap_4a_64ab, Attrmap_4a_64d7
	bs_set_sprite_pos $78, $78
	bs_end_script
Script_024_467d::
	bs_lcd_off_loadpal
	bs_reset_scroll_2
	bs_vram_copy3 $0200, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $01e0, $9200, BattleUIGFX_53fa
	bs_vram_copy3 $0140, $8ea0, MenuDigits2GFX
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_place_tile_attr $0000, Tilemap_4a_6101, Attrmap_4a_6157
	bs_print_num_full_2 $0a, wMoney, $0305, $010a
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_print_menu_pg_a $01
	bs_place_tile_attr $0600, Tilemap_4a_6357, Attrmap_4a_6401
	bs_draw_item_list
	bs_draw_page_arrows
	bs_draw_x_47fb
	bs_lcd_on_loadpal
	bs_end_script3
Script_024_46bf::
	bs_place_tile_attr $0009, Tilemap_4a_5c8f, Attrmap_4a_5bd9
	bs_print_hp
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_end_script3
Script_024_46cb::
	bs_lcd_off_loadpal
	bs_vram_copy3 $03e0, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_load_mon_bgpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_lcd_on_loadpal
	bs_end_script3
Script_024_46f5::
	bs_vram_copy3 $03e0, $9000, MenuDigitsIconsGFX
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_load_bgpal_buf Palette_BattleUIBG
	bs_load_objpal_buf Palette_BattleUIObj
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_load_mon_bgpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_print_hp
	bs_draw_status_2
	bs_draw_s_42ba
	bs_end_script3
Script_024_471d::
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_print_menu_pg_a $04
	bs_print_text_xy String_025_60db, $98, $a0
	bs_place_tile_attr $0f06, Tilemap_4a_662b, Attrmap_4a_664b
	bs_end_script3
Script_024_473b::
	bs_vram_copy3 $0020, $8e80, BattleUIGFX_4e6a
	bs_print_menu_pg_b $05
	bs_place_tile_attr $000c, Tilemap_4a_62a1, Attrmap_4a_6227
	bs_end_script3
	bs_vram_copy3 $0200, $9000, MenuDigitsIconsGFX
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_end_script3
Script_024_475c::
	bs_lcd_off_loadpal
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_lcd_on_loadpal
	bs_end_script3
Script_024_4771::
	bs_draw_equip_list
	bs_end_script3
	bs_draw_w_4745
	bs_end_script3
Script_024_4775::
	bs_place_tile_attr $0009, Tilemap_4a_5c8f, Attrmap_4a_5bd9
	bs_clear_bgbox_at $06, $0c, $9824
	bs_vram_copy3 $00b0, $96e0, BattleUIGFX_491a
	bs_draw_party_list
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_end_script3
Script_024_4792::
	bs_clear_bgbox_at $05, $07, $982a
	bs_clear_bgbox_at $0a, $14, $9900
	bs_vram_copy3 $0040, $9400, BattleUIGFX_571a
	bs_place_tile_attr $0109, Tilemap_4a_68a3, Attrmap_4a_68dd
	bs_print_two_nums
	bs_place_tile_attr $0a00, Tilemap_4a_6917, Attrmap_4a_69cd
	bs_draw_8_items
	bs_print_num_indir wSelectedPage, $0102, $1111
	bs_end_script3
SaveScreenRedrawScript::
	bs_clear_bgbox_at $0c, $14, $9800
	bs_draw_text_50ad
IF DEF(ENGLISH)
; same EN region layout as SaveScreenScript above
	bs_print_text_xy String_025_6104, $80, $be
	bs_print_text_xy String_025_610d, $c4, $d0
ELSE
	bs_print_text_xy String_025_6104, $80, $9c
	bs_print_text_xy String_025_610d, $68, $70
ENDC
	bs_place_tile_attr $0000, SaveScreenPlayerPanelTilemap, SaveScreenPlayerPanelAttrmap
	bs_place_tile_attr $0c00, SaveScreenRecordsPanelTilemap, SaveScreenRecordsPanelAttrmap
	bs_place_tile_attr $000c, SaveScreenConfirmBarTilemap, SaveScreenConfirmBarAttrmap
	bs_print_num_full_2 $0a, wMoney, $0305, $0e0a
	bs_print_num_full $14, wCrystalCount, $0102, $0808
	bs_print_num_full_2 $0a, wDexCaughtCount, $0103, $1006
	bs_print_num_full_2 $0a, wDexSeenCount, $0103, $1002
IF DEF(ENGLISH)
	bs_set_sprite_pos $78, $80 ; cursor one column left, see StartMenu_SaveConfirm
ELSE
	bs_set_sprite_pos $78, $88
ENDC
	bs_end_script

DispatchMenuState::
	ld de, MenuStateJumptable
	ldh a, [hFFC5]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
MenuStateJumptable::
	dw StartMenu_MainLoop.loop
	dw StartMenu_MainLoop.loop
	dw StartMenu_PartyScreen
	dw StartMenu_PartyMonMenu
	dw StartMenu_PartyStatsPage1
	dw StartMenu_PartyStatsPage2
	dw StartMenu_PartyStatsPage3
	dw StartMenu_ItemCategoryMenu
	dw StartMenu_PartySelectScreen
	dw StartMenu_ItemScreen
	dw StartMenu_ItemActionScreen
	dw StartMenu_UseItemScreen
	dw StartMenu_ItemResultMessage
	dw StartMenu_ReplaceMovePrompt
	dw StartMenu_MoveSelectScreen
	dw StartMenu_TeachMoveScreen
	dw StartMenu_MoveSelectGrid
	dw StartMenu_GiveItemScreen
	dw StartMenu_DexScreen
	dw StartMenu_DexEntryScreen
	dw StartMenu_CharacterSelect
	dw StartMenu_SaveExecute
	dw StartMenu_SaveConfirm
	dw StartMenu_MessagePrompt
	dw StartMenu_MoveLearnedMessage
StartMenu_MessagePrompt::
.asm_4844
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4859
	call .asm_485d
	jr .asm_4844
.asm_4859
	xor a
	ldh [hFFC6], a
	ret
.asm_485d
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_467d)
	inc hl
	ld [hl], HIGH(Script_024_467d)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ld [hFFC5], a
	call LoadMenuCursorState
	ld hl, wcdf8
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, wcdf0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
; Orphan dead data (unreferenced; not code/text/palette).
OrphanData_024_4893::
	db $08, $03, $e0, $03, $00, $90, $9a, $4e, $03, $b0, $00, $e0, $96, $1a, $49, $0b
	db $29, $61, $0c, $69, $61, $02, $00, $00, $6f, $5a, $9b, $57, $10, $0d, $06, $0e
	db $e0, $93, $0f, $62, $6e, $1c, $50, $12, $09, $1a
StartMenu_SaveConfirm::
.asm_48bd
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_48d2
	call .asm_48d6
	jr .asm_48bd
.asm_48d2
	xor a
	ldh [hFFC6], a
	ret
.asm_48d6
	ld a, [wd9d9]
	and a
	jp z, .asm_495f
	call AnimateMenuCursorBounce
	ld a, [wSelectedOption]
	swap a
	add $78
	ld hl, wcde0
	ld [hli], a
IF DEF(ENGLISH)
; EN confirm-bar tilemap starts the Yes/No text one column further left (col 16),
; in what used to be the blank cursor column -- park the cursor in the new blank
; column (col 15) so it doesn't cover the first glyph
	ld a, $7e
ELSE
	ld a, $86
ENDC
	ld [hli], a
	ld a, $01
	ld [hli], a
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4902
	ld a, [wSelectedOption]
	cp $01
	ret z
	inc a
	ld [wSelectedOption], a
	ret
.asm_4902
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4912
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
	ret
.asm_4912
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_4957
	ld a, [wSelectedOption]
	and a
	jr z, .asm_493b
.asm_491e
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(SaveScreenRedrawScript)
	inc hl
	ld [hl], HIGH(SaveScreenRedrawScript)
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $15
	ldh [hFFC5], a
	ret
.asm_493b
	call WriteSaveData
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $16
	ldh [hFFC5], a
	xor a
	ld [wd9d9], a
	call ClearMenuCursorSprites
	ret
.asm_4957
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	jp .asm_491e
.asm_495f
	ldh a, [hJoypadPressed]
	and $03
	ret z
	jp ReturnToStartMenuMain

INCLUDE "engine/save/save_game.asm"

StartMenu_SaveExecute::
	call ClearAllMenuSprites
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4a9f
	call AnimateMenuCursorBounce
	call .asm_4aa3
	jr StartMenu_SaveExecute
.asm_4a9f
	xor a
	ldh [hFFC6], a
	ret
.asm_4aa3
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4ab5
	ld a, [wSelectedOption]
	cp $01
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_4ac4
.asm_4ab5
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4acf
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_4ac4
	ld a, [wSelectedOption]
	swap a
	add $78
	ld [wcde0], a
	ret
.asm_4acf
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, HandleMenuCancel
	ld a, [wSelectedOption]
	and a
	jp nz, ReturnToStartMenuMain
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $16
	ldh [hFFC5], a
	call ClearMenuCursorSprites
	call ClearMenuListSprites
	call SRAMTest_Fast
	ld b, a
	ld a, $01
	sub b
	ld [wd9d9], a
	and a
	ret nz
	call WriteSaveData
	ret

StartMenu_CharacterSelect::
.asm_4b04
	call ClearAllMenuSprites
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4b1c
	call .asm_4b20
	call .asm_4b3d
	jr .asm_4b04
.asm_4b1c
	xor a
	ldh [hFFC6], a
	ret
.asm_4b20
	ldh a, [hFadeFrameCounter]
	and $07
	ret nz
	ld bc, wcdf0
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4b35
	ld a, [bc]
	dec a
	ld [bc], a
	jr .asm_4b38
.asm_4b35
	ld a, [bc]
	inc a
	ld [bc], a
.asm_4b38
	ld a, $09
	sub [hl]
	ld [hl], a
	ret
.asm_4b3d
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4b4e
	ld a, SFX_11
	call PlaySound
	call NextLivePartyMon
	jr .asm_4b5f
.asm_4b4d
	ret
.asm_4b4e
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4b91
	ld a, SFX_11
	call PlaySound
	call PrevLivePartyMon
	jr .asm_4b5f
.asm_4b5e
	ret
.asm_4b5f
	ld de, MenuOptionCoords_024_4be8
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, [hli]
	ld bc, wcdf8
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_454e)
	inc hl
	ld [hl], HIGH(Script_024_454e)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_4b91
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_4bc0
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	ld [wPlayerChar], a
	call InitPlayerCharSprite
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4564)
	inc hl
	ld [hl], HIGH(Script_024_4564)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	call ClearMenuCursorSprites
	ret
.asm_4bc0
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	call InitPlayerCharSprite
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4564)
	inc hl
	ld [hl], HIGH(Script_024_4564)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	call ClearMenuCursorSprites
	ret
MenuOptionCoords_024_4be8::
	db $20, $14, $18, $18, $20, $34, $18, $38, $20, $54, $18, $58, $20, $74, $18, $78
	db $48, $14, $40, $18, $48, $34, $40, $38, $48, $54, $40, $58, $48, $74, $40, $78
StartMenu_DexEntryScreen::
.asm_4c08
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4c1d
	call .asm_4c21
	jr .asm_4c08
.asm_4c1d
	xor a
	ldh [hFFC6], a
	ret
.asm_4c21
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4792)
	inc hl
	ld [hl], HIGH(Script_024_4792)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $12
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
StartMenu_DexScreen::
.asm_4c48
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4c60
	call AnimateMenuCursorBounce
	call .asm_4c64
	jr .asm_4c48
.asm_4c60
	xor a
	ldh [hFFC6], a
	ret
.asm_4c64
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4c76
	ld a, [wSelectedOption]
	cp $07
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_4c85
.asm_4c76
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4cb8
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_4c85
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4d6a)
	inc hl
	ld [hl], HIGH(Script_024_4d6a)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedOption]
	swap a
	add $18
	ld [wcde0], a
	ld a, [wSelectedPage]
	add a
	add a
	add a
	ld e, a
	ld a, [wSelectedOption]
	add e
	ld [wd9d8], a
	ld a, SFX_11
	call PlaySound
	ret
.asm_4cb8
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4cd1
	ld a, [wSelectedPage]
	and a
	jr z, .asm_4cca
	dec a
	ld [wSelectedPage], a
	jr .asm_4ce8
.asm_4cca
	ld a, $12
	ld [wSelectedPage], a
	jr .asm_4ce8
.asm_4cd1
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4d11
	ld a, [wSelectedPage]
	cp $12
	jr z, .asm_4ce4
	inc a
	ld [wSelectedPage], a
	jr .asm_4ce8
.asm_4ce4
	xor a
	ld [wSelectedPage], a
.asm_4ce8
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4d49)
	inc hl
	ld [hl], HIGH(Script_024_4d49)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedPage]
	add a
	add a
	add a
	ld e, a
	ld a, [wSelectedOption]
	add e
	ld [wd9d8], a
	ld a, SFX_28
	call PlaySound
	ret
.asm_4d11
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, HandleMenuCancel
	ld a, SFX_11
	call PlaySound
	ld de, wDexStatuses
	ld a, [wd9d8]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	ret z
	ld [wd9da], a
	ld a, l
	ld [wd9da + 1], a
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $13
	ldh [hFFC5], a
	call ClearMenuCursorSprites
	ret
Script_024_4d49::
	bs_clear_bgbox_at $12, $0a, $980a
	bs_load_mon_pic_cond $9140
	bs_load_mon_objpal_2 $06
	bs_place_tile_attr $0a00, Tilemap_4a_6917, Attrmap_4a_69cd
	bs_print_num_indir wSelectedPage, $0102, $1111
	bs_draw_8_items
	bs_print_num_indir wd9d8, $0103, $0507
	bs_end_script3
Script_024_4d6a::
	bs_load_mon_objpal_2 $06
	bs_load_mon_pic_cond $9140
	bs_print_num_indir wd9d8, $0103, $0507
	bs_end_script3
StartMenu_GiveItemScreen::
.asm_4d77
	call ClearMenuSprites12
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4d8f
	call AnimateMenuCursorBounce
	call .asm_4d93
	jr .asm_4d77
.asm_4d8f
	xor a
	ldh [hFFC6], a
	ret
.asm_4d93
	xor a
	ld [wPlayerMap2Y], a
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4da9
	ld a, [wd9da + 1]
	and a
	jr z, .asm_4da9
	dec a
	ld [wd9da + 1], a
	jr .asm_4dc8
.asm_4da9
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4dec
	ld a, [wd9da + 1]
	cp $05
	ret z
	inc a
	ld [wd9da + 1], a
	call GetPartyMonPtrByIndex
	ld a, [bc]
	and a
	jr nz, .asm_4dc8
	ld a, [wd9da + 1]
	dec a
	ld [wd9da + 1], a
	ret
.asm_4dc8
	ld a, SFX_11
	call PlaySound
	call SetPartyMenuCursor
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4e77)
	inc hl
	ld [hl], HIGH(Script_024_4e77)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wd9da + 1]
	ld [wSelectedOption], a
	ret
.asm_4dec
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_4e42
	ld a, SFX_11
	call PlaySound
	ld a, $0B
	call HandlePartyGridInput.asm_5032
	call GetPartyMonPtrByIndex
	ld hl, $0014
	ld a, [wSelectedOption]
	ld e, a
	ld d, $00
	add hl, de
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4e23
	push hl
	call SetPartyMenuCursor.asm_4ebd
	pop hl
	ld a, [wCurItemID]
	ld [hl], a
	call CompactItems
	ld a, [wCurItemID]
	and a
	jr z, .asm_4e2a
	jr .asm_4e27
.asm_4e23
	ld a, [wCurItemID]
	ld [hl], a
.asm_4e27
	call ConsumeSelectedItem
.asm_4e2a
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $17
	ldh [hFFC5], a
	ld a, [wd9da + 1]
	ld [wSelectedOption], a
	ret
.asm_4e42
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4775)
	inc hl
	ld [hl], HIGH(Script_024_4775)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call LoadMenuCursorState
	ld hl, wcdf8
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, wcdf0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
Script_024_4e77::
	bs_place_tile_attr $0009, Tilemap_4a_5c8f, Attrmap_4a_5bd9
	bs_load_mon_objpal $06
	bs_load_mon_pic $93e0
	bs_print_mon_name $62, $6e
	bs_print_equip_n $80
	bs_clear_bgbox_at $04, $04, $998f
	bs_draw_status_2
	bs_draw_s_42ba
	bs_print_hp
	bs_skip_if_empty $08
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_draw_w_4745
	bs_set_cursor_2
	bs_set_sprite_pos $30, $30
	bs_end_script3
SetPartyMenuCursor::
	ld a, [wd9da + 1]
	ld de, OptionCursorCoords
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld b, h
	ld c, l
	ld de, wd1a0
	ld hl, $0021
	add hl, de
	ld a, [wd9da + 1]
	ld [hli], a
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ret
.asm_4ebd
	ld b, a
	ld a, [wd1fe]
	ld l, a
	ld a, [wd1ff]
	ld h, a
.asm_4ec6
	ld a, [hl]
	and a
	jr nz, .asm_4ecf
	ld a, b
	ld [hli], a
	ld [hl], $01
	ret
.asm_4ecf
	cp b
	jr nz, .asm_4ed5
	inc hl
	inc [hl]
	ret
.asm_4ed5
	inc hl
	inc hl
	jr .asm_4ec6
StartMenu_MoveSelectGrid::
.asm_4ed9
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_4ef1
	call AnimateMenuCursorBounce
	call HandlePartyGridInput
	jr .asm_4ed9
.asm_4ef1
	xor a
	ldh [hFFC6], a
	ret
MenuOptionTable_024_4ef5::
	db $18, $10, $18, $58, $38, $10, $38, $58
HandlePartyGridInput::
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_4f32
	ld a, [wSelectedOption]
	cp $02
	ret z
	cp $03
	ret z
	inc a
	inc a
	ld [wSelectedOption], a
	ld a, $0B
	call .asm_5032
	call GetPartyMonPtrByIndex
	ld a, [wSelectedOption]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4f8c
	ld a, [wSelectedOption]
	dec a
	dec a
	ld [wSelectedOption], a
	ret
.asm_4f32
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_4f65
	ld a, [wSelectedOption]
	cp $01
	ret z
	cp $03
	ret z
	inc a
	ld [wSelectedOption], a
	ld a, $0B
	call .asm_5032
	call GetPartyMonPtrByIndex
	ld a, [wSelectedOption]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4f8c
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_4f65
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_4f7a
	ld a, [wSelectedOption]
	and a
	ret z
	cp $01
	ret z
	dec a
	dec a
	ld [wSelectedOption], a
	jr .asm_4f8c
.asm_4f7a
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_4fa6
	ld a, [wSelectedOption]
	and a
	ret z
	cp $02
	ret z
	dec a
	ld [wSelectedOption], a
.asm_4f8c
	ld a, SFX_28
	call PlaySound
	ld bc, MenuOptionTable_024_4ef5
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, bc
	ld bc, wcde0
	ld a, [hl]
	ld [bc], a
	inc hl
	inc bc
	ld a, [hl]
	ld [bc], a
	ret
.asm_4fa6
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_4fef
	ld a, $0B
	call .asm_5032
	call GetPartyMonPtrByIndex
	ld a, [wSelectedOption]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld a, [hl]
	and a
	ret z
	call .asm_5011
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4771)
	inc hl
	ld [hl], HIGH(Script_024_4771)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $18
	ldh [hFFC5], a
	ld a, $0B
	call .asm_5032
	ld [wSelectedOption], a
	call ClearMenuCursorSprites
	call .asm_5011
	ret
.asm_4fef
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_475c)
	inc hl
	ld [hl], HIGH(Script_024_475c)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
.asm_5011
	ld c, l
	ld b, h
	inc hl
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [wCurItemID]
	cp $15
	jr z, .asm_5026
	cp $16
	jr z, .asm_5023
.asm_5023
	ld a, e
	jr .asm_502f
.asm_5026
	ld a, d
	add $0A
	cp e
	jr c, .asm_502f
	jr z, .asm_502f
	ld a, e
.asm_502f
	inc bc
	ld [bc], a
	ret
.asm_5032
	ld de, wd1a0
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ret
StartMenu_TeachMoveScreen::
.asm_503e
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5053
	call .asm_5057
	jr .asm_503e
.asm_5053
	xor a
	ldh [hFFC6], a
	ret
.asm_5057
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_5069
	ld a, [wSelectedOption]
	cp $01
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_5078
.asm_5069
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_5088
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_5078
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $78
	ld [wcde0], a
	ret
.asm_5088
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_50d8
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .asm_50dd
	call .asm_510a
	ld a, [hBattleJumptableIndex]
	cp $05
	jr z, .asm_50c0
	call ConsumeSelectedItem
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call LoadMenuCursorState
	xor a
	ld [wSelectedOption], a
	ret
.asm_50c0
	call ClearBGMap0
	xor a
	ld [hFFC5], a
	ld [wBattleScriptByte], a
	ld [wBattleScriptState], a
	ld a, $01
	ldh [hFFC6], a
	call ClearMenuCursorSprites
	call .asm_50ff
	ret
.asm_50d8
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_50dd
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_473b)
	inc hl
	ld [hl], HIGH(Script_024_473b)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0E
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
.asm_50ff
	ld hl, wd1a0
	ld c, $40
	xor a
.asm_5105
	ld [hli], a
	dec c
	jr nz, .asm_5105
	ret
.asm_510a
	ld a, [hBattleJumptableIndex]
	cp $05
	jp z, .asm_5168
	ld de, wd1a0
	ld a, $0B
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld de, wd1a0
	ld a, $0E
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
.asm_513b
	ld c, l
	ld b, h
	ld a, [wd0c1]
	cp $0A
	jr nz, .asm_5149
	ld a, [wd9e3]
	jr .asm_5156
.asm_5149
	ld de, TMMoveTable
	ld a, [wCurItemID]
	sub $28
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
.asm_5156
	ld [bc], a
	inc bc
	ld de, MovePP
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [bc], a
	inc bc
	ld [bc], a
	xor a
	ld [wSelectedOption], a
	ret
.asm_5168
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld de, wd1a0
	ld a, $0E
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld l, a
	add a
	add l
	add $07
	ld l, a
	ld h, $00
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wd9e3]
	ld [bc], a
	inc bc
	ld de, MovePP
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld [bc], a
	inc bc
	ld [bc], a
	xor a
	ld [wSelectedOption], a
	ret
StartMenu_MoveSelectScreen::
.asm_519d
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_51b2
	call .asm_51b6
	jr .asm_519d
.asm_51b2
	xor a
	ldh [hFFC6], a
	ret
.asm_51b6
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_51c8
	ld a, [wSelectedOption]
	cp $03
	ret z
	inc a
	ld [wSelectedOption], a
	jr .asm_51d7
.asm_51c8
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_51e2
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_51d7
	ld a, [wSelectedOption]
	swap a
	add $28
	ld [wcde0], a
	ret
.asm_51e2
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_5204
	ld a, SFX_11
	call PlaySound
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0F
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_5204
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, [hBattleJumptableIndex]
	cp $05
	jr z, .asm_5232
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_471d)
	inc hl
	ld [hl], HIGH(Script_024_471d)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0D
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
.asm_5232
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_524f)
	inc hl
	ld [hl], HIGH(Script_024_524f)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0D
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
Script_024_524f::
	bs_clear_bgbox_at $12, $0c, $9808
	bs_clear_bgbox_at $06, $14, $9980
	bs_vram_copy3 $0020, $8fe0, BattleUIGFX_4b8a
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_print_menu_pg_a $04
	bs_print_text_xy String_025_60db, $98, $a0
	bs_place_tile_attr $0f06, Tilemap_4a_662b, Attrmap_4a_664b
	bs_end_script3
	db $c9  ; trailing/branch data
StartMenu_ReplaceMovePrompt::
.asm_5277
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_528f
	call AnimateMenuCursorBounce
	call .asm_5293
	jr .asm_5277
.asm_528f
	xor a
	ldh [hFFC6], a
	ret
.asm_5293
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_52a1
	ld a, [wSelectedOption]
	cp $01
	ret z
	jr .asm_52ac
.asm_52a1
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_52be
	ld a, [wSelectedOption]
	and a
	ret z
.asm_52ac
	ld hl, wSelectedOption
	ld a, $01
	sub [hl]
	ld [hl], a
	ld a, [wSelectedOption]
	swap a
	add $48
	ld [wcde0], a
	ret
.asm_52be
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_52f1
	ld a, [wSelectedOption]
	and a
	jr nz, .asm_52f6
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0E
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
	ld a, [hli]
	ld [wSelectedOption], a
	ret
.asm_52f1
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
.asm_52f6
	ld a, [hBattleJumptableIndex]
	cp $05
	jr z, .asm_531a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_46f5)
	inc hl
	ld [hl], HIGH(Script_024_46f5)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
.asm_531a
	ld a, $01
	ld [hFFC6], a
	xor a
	ld [wBattleScriptByte], a
	ld [hFFC5], a
	ld [wBattleScriptState], a
	call ClearMenuCursorSprites
	call StartMenu_TeachMoveScreen.asm_50ff
	ret
StartMenu_ItemResultMessage::
.asm_5330
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5345
	call .asm_5349
	jr .asm_5330
.asm_5345
	xor a
	ldh [hFFC6], a
	ret
.asm_5349
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_46bf)
	inc hl
	ld [hl], HIGH(Script_024_46bf)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ld [hFFC5], a
	call LoadMenuCursorState
	ld a, [wdcae]
	and a
	ret nz
	call ConsumeSelectedItem
	ld a, [hBattleJumptableIndex]
	and a
	ret z
	ld a, $01
	ld [wd9ea], a
	xor a
	ld [wBattleScriptByte], a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $08
	ld [wBattleIntroJumptableIndex], a
	call ClearMenuCursorSprites
	ret
StartMenu_MoveLearnedMessage::
.asm_5398
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_53ad
	call .asm_53b1
	jr .asm_5398
.asm_53ad
	xor a
	ldh [hFFC6], a
	ret
.asm_53b1
	ldh a, [hJoypadPressed]
	and $03
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_46cb)
	inc hl
	ld [hl], HIGH(Script_024_46cb)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0B
	ld [hFFC5], a
	call LoadMenuCursorState
	ld a, [wdcae]
	and a
	ret nz
	call ConsumeSelectedItem
	ld a, [hBattleJumptableIndex]
	and a
	ret z
	ld a, $01
	ld [wd9ea], a
	xor a
	ld [wBattleScriptByte], a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $08
	ld [wBattleIntroJumptableIndex], a
	call ClearMenuCursorSprites
	ret
StartMenu_UseItemScreen::
	xor a
	ld [wdcae], a
.asm_5409
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5421
	call AnimateMenuCursorBounce
	call .asm_5425
	jr .asm_5409
.asm_5421
	xor a
	ldh [hFFC6], a
	ret
.asm_5425
	ldh a, [hJoypadPressed]
	bit 7, a
	jp nz, PartyCursor_MoveDown
	ldh a, [hJoypadPressed]
	bit 6, a
	jp nz, PartyCursor_MoveUp
	ldh a, [hJoypadPressed]
	bit 5, a
	jp nz, PartyCursor_MoveLeft
	ldh a, [hJoypadPressed]
	bit 4, a
	jp nz, PartyCursor_MoveRight
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_556b
	ld a, [wItemCategory]
	and a
	jr z, .asm_546d
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $11
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld [wPlayerMap2Y], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wSelectedOption]
	ld [wd9da + 1], a
	ret
.asm_546d
	ld a, [wItemQty]
	and a
	ret z
	ld a, [wd0c1]
	cp $01
	jp z, .asm_54c5
	cp $02
	jp z, .asm_5512
	cp $03
	jr z, .asm_54ab
	cp $0A
	jr z, .asm_5488
	ret
.asm_5488
	call SaveMenuCursorState
	call GetPartyMonPtr
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	cp $63
	jr nc, .asm_54eb
	inc [hl]
	ld a, [hl]
	ld [wd9e8], a
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd982], a
	farcall Func_04a_4000
	ret
.asm_54ab
	ld a, [wCurItemID]
	cp $17
	jr z, .asm_54c2
	ld a, [wSelectedOption]
	ld [wd0c3], a
	call SaveMenuCursorState
	ld a, $10
	ld [hFFC5], a
	jr .asm_54dd
.asm_54c2
	call .asm_5594
.asm_54c5
	call SaveMenuCursorState
	xor a
	ld [wd3f9 + 4], a
	call DispatchItemEffect
	ld a, [wd3f9 + 4]
	and a
	jr nz, .asm_54eb
	ld a, $0C
	ld [hFFC5], a
	call ClearMenuCursorSprites
.asm_54dd
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_54eb
	ld a, SFX_46
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_55f9)
	inc hl
	ld [hl], HIGH(Script_024_55f9)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $0C
	ldh [hFFC5], a
	call ClearMenuCursorSprites
	ld a, $01
	ld [wdcae], a
	ret
.asm_5512
	call SaveMenuCursorState
	call GetPartyMonPtr
	call .asm_55d6
	and a
	jr z, .asm_54eb
	ld de, TMMoveTable
	ld a, [wCurItemID]
	sub $28
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	ld d, a
	ld hl, $0007
	add hl, bc
	ld bc, $0003
	ld e, $04
.asm_5535
	ld a, [hl]
	cp d
	ret z
	and a
	jr z, .asm_5552
	add hl, bc
	dec e
	jr nz, .asm_5535
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0D
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_5552
	call StartMenu_TeachMoveScreen.asm_513b
	ld a, $0C
	ld [hFFC5], a
	call ClearMenuCursorSprites
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_556b
	ldh a, [hJoypadPressed]
	bit 1, a
	jr z, .asm_5593
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_467d)
	inc hl
	ld [hl], HIGH(Script_024_467d)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
.asm_5593
	ret
.asm_5594
	ld hl, wPartyMons
	ld de, $0016
	ld a, [wSelectedOption]
	and a
	jr z, .asm_55a4
.asm_55a0
	add hl, de
	dec a
	jr nz, .asm_55a0
.asm_55a4
	push hl
	pop bc
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55b2
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
.asm_55b2
	ld hl, $000A
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55be
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
.asm_55be
	ld hl, $000D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_55ca
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
.asm_55ca
	ld hl, $0010
	add hl, bc
	ld a, [hl]
	and a
	ret z
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
	ret
.asm_55d6
	push hl
	pop bc
	ld de, Pointers_024_6e36
	ld l, [hl]
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurItemID]
	sub $27
	ld d, a
.asm_55e9
	ld a, [hli]
	cp $FF
	jr z, .asm_55f7
	cp d
	jr z, .asm_55f4
	jp .asm_55e9
.asm_55f4
	ld a, $01
	ret
.asm_55f7
	xor a
	ret
Script_024_55f9::
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_print_menu_pg_a $03
	bs_end_script3
DispatchItemEffect::
	call GetPartyMonPtr
	ld de, ItemEffectJumptable
	ld a, [wCurItemID]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.asm_5615
	ret
ItemEffectJumptable::
	dw ItemEffect_Null
	dw ItemEffect_Null
	dw ItemEffect_Null
	dw ItemEffect_Null
	dw ItemEffect_Null
	dw ItemEffect_HealHP30
	dw ItemEffect_HealHP50
	dw ItemEffect_HealHP100
	dw ItemEffect_HealHP200
	dw ItemEffect_HealHP20Pct
	dw ItemEffect_HealHP50Pct
	dw ItemEffect_HealHPFull
	dw ItemEffect_CureStatusBit0
	dw ItemEffect_CureStatusBit1
	dw ItemEffect_CureStatusBit4
	dw ItemEffect_CureStatusBit2
	dw ItemEffect_CureStatusBit3
	dw ItemEffect_CureAllStatus
	dw ItemEffect_Revive20Pct
	dw ItemEffect_Revive50Pct
	dw ItemEffect_ReviveFull
	dw ItemEffect_Null
	dw ItemEffect_Null
	dw ItemEffect_RestorePP
ItemEffect_Null::
	ret
ItemEffect_HealHP30::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	ld a, SFX_33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $001E
	add hl, bc
	ldh a, [hMathValue + 1]
	ld d, a
	ldh a, [hMathValue]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_567c
	jr c, .asm_5680
	jr nc, .asm_5682
.asm_567c
	ld a, l
	cp e
	jr nc, .asm_5682
.asm_5680
	push hl
	pop de
.asm_5682
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
SetItemUseFailed::
	ld a, $01
	ld [wd3f9 + 4], a
	ret
ItemEffect_HealHP50::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	ld a, SFX_33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0032
	add hl, bc
	ldh a, [hMathValue + 1]
	ld d, a
	ldh a, [hMathValue]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_56c6
	jr c, .asm_56ca
	jr nc, .asm_56cc
.asm_56c6
	ld a, l
	cp e
	jr nc, .asm_56cc
.asm_56ca
	push hl
	pop de
.asm_56cc
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
ItemEffect_HealHP100::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	ld a, SFX_33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0064
	add hl, bc
	ldh a, [hMathValue + 1]
	ld d, a
	ldh a, [hMathValue]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_570a
	jr c, .asm_570e
	jr nc, .asm_5710
.asm_570a
	ld a, l
	cp e
	jr nc, .asm_5710
.asm_570e
	push hl
	pop de
.asm_5710
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
ItemEffect_HealHP200::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	ld a, SFX_33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $00C8
	add hl, bc
	ldh a, [hMathValue + 1]
	ld d, a
	ldh a, [hMathValue]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_574e
	jr c, .asm_5752
	jr nc, .asm_5754
.asm_574e
	ld a, l
	cp e
	jr nc, .asm_5754
.asm_5752
	push hl
	pop de
.asm_5754
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
ItemEffect_HealHP20Pct::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	ld a, SFX_33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hMathValue + 1]
	ld [wd9d8], a
	ldh a, [hMathValue]
	ld [wd9d9], a
	ld a, $14
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $64
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr z, .asm_57a6
	ldh a, [hMathValue]
	ld [wd9da], a
	ldh a, [hMathValue + 1]
	ld [wd9da + 1], a
	jr .asm_57af
.asm_57a6
	ldh a, [hMathValue]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_57af
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9da]
	ld b, a
	ld a, [wd9da + 1]
	ld c, a
	add hl, bc
	ld a, [wd9d8]
	ld d, a
	ld a, [wd9d9]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_57d1
	jr c, .asm_57d5
	jr nc, .asm_57d7
.asm_57d1
	ld a, l
	cp e
	jr nc, .asm_57d7
.asm_57d5
	push hl
	pop de
.asm_57d7
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
ItemEffect_HealHP50Pct::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	ld a, SFX_33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hMathValue + 1]
	ld [wd9d8], a
	ldh a, [hMathValue]
	ld [wd9d9], a
	ld a, $05
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $0A
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr z, .asm_5829
	ldh a, [hMathValue]
	ld [wd9da], a
	ldh a, [hMathValue + 1]
	ld [wd9da + 1], a
	jr .asm_5832
.asm_5829
	ldh a, [hMathValue]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_5832
	pop bc
	push bc
	ld hl, $0002
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9da]
	ld b, a
	ld a, [wd9da + 1]
	ld c, a
	add hl, bc
	ld a, [wd9d8]
	ld d, a
	ld a, [wd9d9]
	ld e, a
	ld a, h
	cp d
	jr z, .asm_5854
	jr c, .asm_5858
	jr nc, .asm_585a
.asm_5854
	ld a, l
	cp e
	jr nc, .asm_585a
.asm_5858
	push hl
	pop de
.asm_585a
	pop bc
	ld hl, $0002
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret
ItemEffect_HealHPFull::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	ld a, SFX_33
	call PlaySound
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hMathValue + 1]
	ld [wd9d8], a
	ldh a, [hMathValue]
	ld [wd9d9], a
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9d9]
	ld [hli], a
	ld a, [wd9d8]
	ld [hl], a
	ret
ItemEffect_CureStatusBit0::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	bit 0, a
	jp z, SetItemUseFailed_NoStatus
	res 0, a
	ld [hl], a
	ld a, SFX_4c
	call PlaySound
	ret
ItemEffect_CureStatusBit1::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	bit 1, a
	jr z, SetItemUseFailed_NoStatus
	res 1, a
	ld [hl], a
	ld a, SFX_4c
	call PlaySound
	ret
SetItemUseFailed_NoStatus::
	ld a, $01
	ld [wd3f9 + 4], a
	ret
ItemEffect_CureStatusBit4::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	bit 4, a
	jp z, SetItemUseFailed_NoStatus
	res 4, a
	ld [hl], a
	ld a, SFX_4c
	call PlaySound
	ret
ItemEffect_CureStatusBit2::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	bit 2, a
	jp z, SetItemUseFailed_NoStatus
	res 2, a
	ld [hl], a
	ld a, SFX_4c
	call PlaySound
	ret
ItemEffect_CureStatusBit3::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	bit 3, a
	jp z, SetItemUseFailed_NoStatus
	res 3, a
	ld [hl], a
	ld a, SFX_4c
	call PlaySound
	ret
ItemEffect_CureAllStatus::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	and a
	jp z, SetItemUseFailed_NoStatus
	ld [hl], $00
	ld a, SFX_4c
	call PlaySound
	ret
ItemEffect_Revive20Pct::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp nz, SetItemUseFailed
	ld [hl], $00
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hMathValue + 1]
	ld [wd9d8], a
	ldh a, [hMathValue]
	ld [wd9d9], a
	ld a, $02
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $0A
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr z, .asm_596e
	ldh a, [hMathValue]
	ld [wd9da], a
	ldh a, [hMathValue + 1]
	ld [wd9da + 1], a
	jr .asm_5977
.asm_596e
	ldh a, [hMathValue]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_5977
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9da + 1]
	ld [hli], a
	ld a, [wd9da]
	ld [hl], a
	ld a, SFX_33
	call PlaySound
	ret
ItemEffect_Revive50Pct::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp nz, SetItemUseFailed
	ld [hl], $00
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hMathValue + 1]
	ld [wd9d8], a
	ldh a, [hMathValue]
	ld [wd9d9], a
	ld a, $05
	ldh [hMathOperand], a
	farcall Multiply32By8
	ld a, $0A
	ldh [hMathOperand], a
	farcall Divide32By16_4Digit
	ldh a, [hMathValue + 1]
	and a
	jr z, .asm_59d0
	ldh a, [hMathValue]
	ld [wd9da], a
	ldh a, [hMathValue + 1]
	ld [wd9da + 1], a
	jr .asm_59d9
.asm_59d0
	ldh a, [hMathValue]
	ld [wd9da + 1], a
	xor a
	ld [wd9da], a
.asm_59d9
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9da + 1]
	ld [hli], a
	ld a, [wd9da]
	ld [hl], a
	ld a, SFX_33
	call PlaySound
	ret
ItemEffect_ReviveFull::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp nz, SetItemUseFailed
	ld [hl], $00
	push bc
	xor a
	ld [wd9d7], a
	farcall asm_025_410d
	ldh a, [hMathValue + 1]
	ld [wd9d8], a
	ldh a, [hMathValue]
	ld [wd9d9], a
	pop bc
	ld hl, $0002
	add hl, bc
	ld a, [wd9d9]
	ld [hli], a
	ld a, [wd9d8]
	ld [hl], a
	ld a, SFX_33
	call PlaySound
	ret
ItemEffect_RestorePP::
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $BF
	jp z, SetItemUseFailed
	call GetPartyMonPtr
	ld hl, $0007
	add hl, bc
	ld bc, $0003
	ld e, $04
.asm_5a36
	ld a, [hl]
	and a
	ret z
	push hl
	inc hl
	inc hl
	ld a, [hld]
	ld [hl], a
	pop hl
	add hl, bc
	dec e
	jr nz, .asm_5a36
	ld a, SFX_33
	call PlaySound
	ret
StartMenu_ItemActionScreen::
.asm_5a49
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_5a61
	call AnimateMenuCursorBounce
	call .asm_5a65
	jr .asm_5a49
.asm_5a61
	xor a
	ldh [hFFC6], a
	ret
.asm_5a65
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_5a73
	ld a, [wSelectedOption]
	cp $01
	ret z
	jr .asm_5a7e
.asm_5a73
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_5a95
	ld a, [wSelectedOption]
	and a
	ret z
.asm_5a7e
	ld a, SFX_11
	call PlaySound
	ld hl, wSelectedOption
	ld a, $01
	sub [hl]
	ld [hl], a
	ld a, [wSelectedOption]
	swap a
	add $78
	ld [wcde0], a
	ret
.asm_5a95
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_5ae7
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .asm_5ac5
	ld a, [wItemCategory]
	cp $01
	jr z, .asm_5ab3
	cp $02
	ret z
	jr .asm_5ab3
.asm_5ab3
	call ConsumeSelectedItem
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4652)
	inc hl
	ld [hl], HIGH(Script_024_4652)
	jr .asm_5afe
.asm_5ac5
	ld a, [wItemCategory]
	and a
	jp z, .asm_5b19
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd1fd]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wCurItemID], a
	ld a, [hl]
	ld [wItemQty], a
	jp .asm_5b7e
.asm_5ae7
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4664)
	inc hl
	ld [hl], HIGH(Script_024_4664)
.asm_5afe
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call LoadMenuCursorState
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
.asm_5b19
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd1fd]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wCurItemID], a
	ld a, [hl]
	ld [wItemQty], a
	ld de, ItemUseActionTable
	ld a, [wCurItemID]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	and a
	ret z
	cp $01
	jp z, .asm_5b7e
	cp $02
	jp z, .asm_5b9c
	cp $03
	jp z, .asm_5b7e
	cp $04
	jp z, .asm_5bf4
	cp $05
	jp z, .asm_5ba8
	cp $06
	jp z, .asm_5bc7
	cp $07
	jp z, .asm_5bca
	cp $08
	jp z, .asm_5bcd
	cp $09
	jp z, .asm_5bd0
	cp $0A
	jp z, .asm_5b71
	ret
.asm_5b71
	ld [wd0c1], a
	ld a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_5c20
	jp .asm_5b81
.asm_5b7e
	ld [wd0c1], a
.asm_5b81
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0B
	ldh [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld [wSelectedOption], a
	ld a, $01
	ldh [hFFC6], a
	call ClearMenuCursorSprites
	ret
.asm_5b9c
	ld [wd0c1], a
	ld a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_5c20
	jr .asm_5b81
.asm_5ba8
	ld [wd0c1], a
	ld a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_5c20
	ld a, [wd0d3]
	and a
	jp z, .asm_5c20
	ld a, [wd9eb]
	and a
	jp nz, .asm_5c20
	call UseRepelItem
	call .asm_5c4d
	ret
.asm_5bc7
	jp .asm_5c20
.asm_5bca
	jp .asm_5c20
.asm_5bcd
	jp .asm_5c20
.asm_5bd0
	ld a, [wd0d3]
	cp $02
	jr nz, .asm_5c20
	ld a, [hBattleJumptableIndex]
	and a
	jr nz, .asm_5c20
	call .asm_5c75
	xor a
	ld [wPlayerSpriteID], a
	ld [wd0e4], a
	ld [wPlayerAnimFrame], a
	ld [wd0df], a
	call ClearMenuCursorSprites
	call ConsumeSelectedItem
	ret
.asm_5bf4
	ld a, [hBattleJumptableIndex]
	and a
	jr z, .asm_5c20
	ld a, $02
	ld [wd9ea], a
	xor a
	ld [wBattleScriptByte], a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $09
	ld [wBattleIntroJumptableIndex], a
	call ConsumeSelectedItem
	call ClearMenuCursorSprites
	call DelayFrame
	ret
.asm_5c20
	ld a, SFX_22
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_5f78)
	inc hl
	ld [hl], HIGH(Script_024_5f78)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call LoadMenuCursorState
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
.asm_5c4d
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_5f67)
	inc hl
	ld [hl], HIGH(Script_024_5f67)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call LoadMenuCursorState
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
.asm_5c75
	ld de, Pointers_024_5c97
	ldh a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ldh a, [hMapNumber]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ldh [hMapNumber], a
	ld a, [hli]
	ldh [hWarpNumber], a
	ld a, $01
	ldh [hFade], a
	call RedrawOverworldScreen
	ret
Pointers_024_5c97::
	dw Pointers_024_5c97_5ca7
	dw Pointers_024_5c97_5ca7
	dw Pointers_024_5c97_5d13
	dw Pointers_024_5c97_5d5b
	dw Pointers_024_5c97_5da3
	dw Pointers_024_5c97_5e6f
	dw Pointers_024_5c97_5ebf
	dw Pointers_024_5c97_5ca7
Pointers_024_5c97_5ca7::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $1d, $01, $1d, $01
	db $1d, $01, $1d, $01, $1a, $01, $15, $01, $15, $01, $15, $01, $15, $01, $15, $01
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Pointers_024_5c97_5d13::
	db $00, $00, $00, $00, $00, $00, $03, $00, $03, $00, $03, $00, $06, $00, $06, $00
	db $00, $00, $08, $01, $08, $01, $08, $01, $08, $01, $08, $01, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
Pointers_024_5c97_5d5b::
	db $00, $00, $01, $00, $01, $00, $01, $00, $04, $00, $04, $00, $04, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $0b, $00, $0b, $00, $0b, $00, $0b, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $04, $00, $00, $00, $00, $00, $00, $00
Pointers_024_5c97_5da3::
	db $00, $00, $0f, $01, $0f, $01, $0f, $01, $0f, $01, $0f, $01, $06, $00, $06, $00
	db $06, $00, $06, $00, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $15, $00, $15, $00, $00, $00
	db $00, $00, $00, $00, $1a, $00, $1a, $00, $1a, $00, $1a, $00, $00, $00, $00, $00
	db $00, $00, $2b, $01, $2b, $01, $2b, $01, $2b, $01, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $15, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $5f, $01, $5f, $01, $5f, $01, $5f, $01, $00, $00, $00, $00
Pointers_024_5c97_5e6f::
	db $00, $00, $01, $00, $01, $00, $03, $00, $03, $00, $03, $00, $03, $00, $00, $00
	db $0e, $01, $0e, $01, $0e, $01, $0e, $01, $0e, $01, $0e, $01, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $17, $00
	db $17, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
Pointers_024_5c97_5ebf::
	db $00, $00, $01, $01, $01, $01, $03, $01, $03, $01, $03, $01, $03, $01, $03, $01
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
UseRepelItem::
	ld a, [wCurItemID]
	cp $23
	jr z, .asm_5f29
	cp $24
	jr z, .asm_5f30
	cp $25
	jr z, .asm_5f37
	ret
.asm_5f29
	ld a, $32
	ld [wd9eb], a
	jr .asm_5f3c
.asm_5f30
	ld a, $78
	ld [wd9eb], a
	jr .asm_5f3c
.asm_5f37
	ld a, $C8
	ld [wd9eb], a
.asm_5f3c
	call ConsumeSelectedItem
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_42a5)
	inc hl
	ld [hl], HIGH(Script_024_42a5)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $09
	ldh [hFFC5], a
	call LoadMenuCursorState
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ret
Script_024_5f67::
	bs_place_tile_attr $0600, Tilemap_4a_6357, Attrmap_4a_6401
	bs_draw_item_list
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_draw_x_47fb
	bs_end_script3
Script_024_5f78::
	bs_place_tile_attr $000c, Tilemap_4a_61ad, Attrmap_4a_6227
	bs_print_menu_pg_a $02
	bs_end_script3
; [wCurItemID] -> item-use action class
ItemUseActionTable::
	db $00
	db $04
	db $04
	db $04
	db $04
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $03
	db $03
	db $03
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $05
	db $05
	db $05
	db $0a
	db $09
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
ClearMenuCursorSprites::
	ld hl, wcde0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wVirtualOAMSprite38YCoord
	ld c, $08
	xor a
.asm_601d
	ld [hli], a
	dec c
	jr nz, .asm_601d
	ret
ClearMenuListSprites::
	ld hl, wcdf8
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	ld hl, wVirtualOAMSprite24YCoord
	ld c, $28
	xor a
.asm_6036
	ld [hli], a
	dec c
	jr nz, .asm_6036
	ret
ConsumeSelectedItem::
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd1fd]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret z
	inc hl
	dec [hl]
	ld a, [hld]
	and a
	jr nz, .asm_6056
	ld [hl], $00
.asm_6056
	ld [wItemQty], a
	xor a
	ld [wd0c0], a
CompactItems::
	ld de, ItemCategorySizes
	ld a, [wItemCategory]
	ld l, a
	ld h, $00
	add hl, de
	ld c, [hl]
	ld a, [wd1fe]
	ld l, a
	ld e, a
	ld a, [wd1ff]
	ld h, a
	ld d, a
.asm_6072
	ld a, [hl]
	and a
	jr z, .asm_6080
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_6072
	ret
.asm_6080
	ld a, l
	add $02
	ld l, a
	dec c
	jr nz, .asm_6072
	ld a, l
	sub e
	srl a
	ld c, a
.asm_608c
	dec c
	ret z
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	jr .asm_608c
.asm_6095
	ret
; [wItemCategory] -> item-list capacity
ItemCategorySizes::
	db $78
	db $28
	db $2d
StartMenu_ItemScreen::
.asm_6099
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_60b1
	call AnimateMenuCursorBounce
	call .asm_60b5
	jr .asm_6099
.asm_60b1
	xor a
	ldh [hFFC6], a
	ret
.asm_60b5
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_60da
	ld a, [wSelectedOption]
	cp $04
	ret nc
	inc a
	ld [wSelectedOption], a
	ld a, [wItemCategory]
	cp $01
	jr z, .asm_60e9
	call .asm_62f7
	and a
	jr nz, .asm_60e9
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_60da
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_6114
	ld a, [wSelectedOption]
	and a
	ret z
	dec a
	ld [wSelectedOption], a
.asm_60e9
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	sla a
	sla a
	sla a
	sla a
	add $18
	ld [wcde0], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4650)
	inc hl
	ld [hl], HIGH(Script_024_4650)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_6114
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_6125
	ld a, [wSelectedPage]
	and a
	ret z
	dec a
	ld [wSelectedPage], a
	jr .asm_614c
.asm_6125
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_6189
	ld de, ItemCategoryMaxPage
	ld a, [wItemCategory]
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedPage]
	cp [hl]
	ret z
	inc a
	ld [wSelectedPage], a
	call .asm_6312
	and a
	jr nz, .asm_614c
	ld a, [wSelectedPage]
	dec a
	ld [wSelectedPage], a
	ret
.asm_614c
	ld a, SFX_11
	call PlaySound
	xor a
	ld [wSelectedOption], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4642)
	inc hl
	ld [hl], HIGH(Script_024_4642)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, [wd3f9 + 1]
	and a
	ret z
	ld a, [wSelectedPage]
	ld c, a
	ld a, [wd3f9 + 3]
	cp c
	jr z, .asm_6181
	ld hl, wcdf0
	inc hl
	inc hl
	ld [hl], $00
	ret
.asm_6181
	ld hl, wcdf0
	inc hl
	inc hl
	ld [hl], $03
	ret
.asm_6189
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_627d
	ld a, SFX_11
	call PlaySound
	ld a, [wItemCategory]
	cp $01
	jr z, .asm_61e4
	call .asm_62f7
	and a
	ret z
	ld [wCurItemID], a
	ld a, [wd3f9 + 1]
	and a
	jp nz, .asm_622c
	ld a, [wItemCategory]
	and a
	jr z, .asm_6208
	ld a, [wCurItemID]
	cp $07
	ret nz
	call SaveMenuCursorState
	ld a, [wdce4]
	cp $01
	jp nz, StartMenu_ItemActionScreen.asm_5c20
	ld a, $01
	ldh [hFFD6], a
	ld [wd0fd + 1], a
	xor a
	ld [wScriptByte], a
	ld a, [hScriptBank]
	ld [wdcad], a
	ld a, BANK(Script_4a_7fd7)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(Script_4a_7fd7)
	inc hl
	ld [hl], HIGH(Script_4a_7fd7)
	call RedrawOverworldScreen
	ret
.asm_61e4
	call .asm_62f7
	ld [wCurItemID], a
	call SaveMenuCursorState
	ld a, $02
	ld [wBattleScriptState], a
	ld a, $0A
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_466d)
	inc hl
	ld [hl], HIGH(Script_024_466d)
	ret
.asm_6208
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $0A
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld bc, wcde0
	ld hl, wcdf0
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	ld [hli], a
	ret
.asm_622c
	call .asm_62f7
	push hl
	push af
	inc hl
	ld a, [hl]
	push af
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wd3f9 + 3]
	ld l, a
	add a
	add a
	add l
	ld l, a
	ld a, [wd3f9 + 2]
	add l
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop af
	ld [hld], a
	pop af
	ld [hl], a
	pop hl
	ld [hl], e
	inc hl
	ld [hl], d
.asm_6259
	ld a, [wd3f9 + 3]
	ld [wSelectedPage], a
	ld a, [wd3f9 + 2]
	ld [wSelectedOption], a
	ld hl, wcdf0
	ld de, wcde0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $01
	ld [de], a
	ld [hl], $00
	xor a
	ld [wd3f9 + 1], a
	jp .asm_614c
.asm_627d
	ldh a, [hJoypadPressed]
	bit 1, a
	jp z, .asm_62c8
	ld a, SFX_11
	call PlaySound
	ld a, [wd3f9 + 1]
	and a
	jr nz, .asm_6259
	ldh a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_62b2
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_462b)
	inc hl
	ld [hl], HIGH(Script_024_462b)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $07
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
.asm_62b2
	xor a
	ld [wBattleScriptByte], a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ld [wBattleIntroJumptableIndex], a
	call ClearMenuCursorSprites
	ret
.asm_62c8
	ldh a, [hJoypadPressed]
	bit 2, a
	ret z
	ld a, [wd3f9 + 1]
	and a
	jp nz, .asm_622c
	ld a, [wSelectedPage]
	ld [wd3f9 + 3], a
	ld a, [wSelectedOption]
	ld [wd3f9 + 2], a
	ld a, $01
	ld [wd3f9 + 1], a
	ld hl, wcde0
	ld de, wcdf0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $03
	ld [de], a
	ld [hl], $01
	ret
.asm_62f7
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wSelectedPage]
	ld l, a
	add a
	add a
	add l
	ld l, a
	ld a, [wSelectedOption]
	add l
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	ret
.asm_6312
	ld a, [wd1fe]
	ld e, a
	ld a, [wd1ff]
	ld d, a
	ld a, [wSelectedPage]
	ld l, a
	add a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hl]
	ret
StartMenu_ItemCategoryMenu::
.asm_6328
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6340
	call AnimateMenuCursorBounce
	call HandleItemCategoryInput
	jr .asm_6328
.asm_6340
	xor a
	ldh [hFFC6], a
	ret
; [wItemCategory] -> max page index
ItemCategoryMaxPage::
	db $17
	db $07
	db $08
HandleItemCategoryInput::
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_635a
	ld a, [wSelectedOption]
	cp $02
	jr z, .asm_635a
	inc a
	ld [wSelectedOption], a
	jr .asm_636a
.asm_635a
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_637a
	ld a, [wSelectedOption]
	and a
	jr z, .asm_637a
	dec a
	ld [wSelectedOption], a
.asm_636a
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	swap a
	add $18
	ld [wcde0], a
	ret
.asm_637a
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, HandleMenuCancel
	ld a, [wSelectedOption]
	ld [wItemCategory], a
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $09
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	xor a
	ld [wSelectedOption], a
	ld [wSelectedPage], a
	ret
StartMenu_PartySelectScreen::
.asm_63a4
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_63bc
	call AnimateMenuCursorBounce
	call .asm_63c0
	jr .asm_63a4
.asm_63bc
	xor a
	ldh [hFFC6], a
	ret
.asm_63c0
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_63e2
	ld a, [wSelectedOption]
	cp $03
	jr nc, .asm_63e2
	add $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	sub $03
	ld [wSelectedOption], a
	ret
.asm_63e2
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_6404
	ld a, [wSelectedOption]
	cp $03
	jr c, .asm_6404
	sub $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	add $03
	ld [wSelectedOption], a
	ret
.asm_6404
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_6428
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6428
	cp $03
	jr z, .asm_6428
	dec a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	add $01
	ld [wSelectedOption], a
	ret
.asm_6428
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_645f
	ld a, [wSelectedOption]
	cp $02
	ret z
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_644b
	ld a, [wSelectedOption]
	sub $01
	ld [wSelectedOption], a
	ret
.asm_644b
	ld de, OptionCursorCoords
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ret
.asm_645f
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_6485
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_461d)
	inc hl
	ld [hl], HIGH(Script_024_461d)
	ld a, $03
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_6485
	ldh a, [hJoypadPressed]
	bit 1, a
	jr z, .asm_64a8
	ld a, SFX_11
	call PlaySound
	ld hl, wcdf0
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld [hl], $00
	inc hl
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	call LoadMenuCursorState
	ret
.asm_64a8
	ret
StartMenu_PartyStatsPage3::
.asm_64a9
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_64be
	call .asm_64c2
	jr .asm_64a9
.asm_64be
	xor a
	ldh [hFFC6], a
	ret
.asm_64c2
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_64d4
	ld a, [wSelectedOption]
	and a
	jr z, .asm_64d4
	dec a
	ld [wSelectedOption], a
	jr .asm_64f3
.asm_64d4
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_6511
	ld a, [wSelectedOption]
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_64f3
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_64f3
	ld a, SFX_28
	call PlaySound
	call SaveSelectedPartySlot
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_45e8)
	inc hl
	ld [hl], HIGH(Script_024_45e8)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_6511
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_6536
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(BattleScript_024_460f)
	inc hl
	ld [hl], HIGH(BattleScript_024_460f)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ldh [hFFC5], a
	ret
.asm_6536
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4601)
	inc hl
	ld [hl], HIGH(Script_024_4601)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $05
	ldh [hFFC5], a
	ret
StartMenu_PartyStatsPage2::
.asm_655a
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_656f
	call .asm_6573
	jr .asm_655a
.asm_656f
	xor a
	ldh [hFFC6], a
	ret
.asm_6573
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_6585
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6585
	dec a
	ld [wSelectedOption], a
	jr .asm_65a4
.asm_6585
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_65c2
	ld a, [wSelectedOption]
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_65a4
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_65a4
	ld a, SFX_28
	call PlaySound
	call SaveSelectedPartySlot
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_45d1)
	inc hl
	ld [hl], HIGH(Script_024_45d1)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_65c2
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_65df
	ld a, SFX_11
	call PlaySound
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $06
	ldh [hFFC5], a
	ret
.asm_65df
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_45c2)
	inc hl
	ld [hl], HIGH(Script_024_45c2)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ldh [hFFC5], a
	ret
StartMenu_PartyStatsPage1::
.asm_6603
	call ClearMenuSprites8
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6618
	call .asm_661c
	jr .asm_6603
.asm_6618
	xor a
	ldh [hFFC6], a
	ret
.asm_661c
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, .asm_662e
	ld a, [wSelectedOption]
	and a
	jr z, .asm_662e
	dec a
	ld [wSelectedOption], a
	jr .asm_664d
.asm_662e
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, .asm_666b
	ld a, [wSelectedOption]
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, .asm_664d
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
.asm_664d
	ld a, SFX_28
	call PlaySound
	call SaveSelectedPartySlot
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_45b0)
	inc hl
	ld [hl], HIGH(Script_024_45b0)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_666b
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, .asm_6688
	ld a, SFX_11
	call PlaySound
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $05
	ldh [hFFC5], a
	ret
.asm_6688
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, SFX_11
	call PlaySound
	ld a, [hBattleJumptableIndex]
	and a
	jr nz, .asm_66b1
	ld a, $02
	ld [wBattleScriptState], a
	call LoadMenuCursorState
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_45a0)
	inc hl
	ld [hl], HIGH(Script_024_45a0)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_66b1
	ld a, $02
	ld [wBattleScriptState], a
	call LoadMenuCursorState
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_66ca)
	inc hl
	ld [hl], HIGH(Script_024_66ca)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
Script_024_66ca::
	bs_place_tile_attr $0000, Tilemap_4a_5a6f, Attrmap_4a_579b
	bs_draw_party_list
	bs_print_text_xy String_025_60be, $a0, $fd
	bs_draw_status_icons
	bs_select_menu $03
SaveSelectedPartySlot::
	ld a, [wSelectedOption]
	ld de, OptionCursorCoords
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld b, h
	ld c, l
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [wSelectedOption]
	ld [hli], a
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ret
StartMenu_PartyMonMenu::
.asm_66f8
	call ClearMenuSprites4
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6710
	call AnimateMenuCursorBounce
	call .asm_6714
	jr .asm_66f8
.asm_6710
	xor a
	ldh [hFFC6], a
	ret
.asm_6714
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, .asm_672a
	ld a, [wSelectedOption]
	cp $01
	jr z, .asm_672a
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
	jr .asm_673c
.asm_672a
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, .asm_6750
	ld a, [wSelectedOption]
	and a
	ret z
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
.asm_673c
	ld de, MenuOptionTable_024_6969
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ret
.asm_6750
	ldh a, [hJoypadPressed]
	bit 0, a
	jp z, .asm_6844
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6787
	cp $01
	jr z, .asm_6767
	ret
.asm_6767
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ldh [hFFC5], a
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [hl]
	ld [wSelectedOption], a
	ret
.asm_6787
	ldh a, [hBattleJumptableIndex]
	and a
	jp nz, .asm_67b8
	call SaveMenuCursorState
	ld a, $01
	ld [wBattleScriptState], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $08
	ldh [hFFC5], a
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld [wd9d9], a
	ld de, wcde0
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret
.asm_67b8
	ld a, [wdb1c]
	and a
	jr z, .asm_67d9
	ld a, [wd981]
	ld c, a
	ld a, [wd982]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld b, $0C
	ld de, wdcbb + 1
.asm_67cf
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_67cf
	xor a
	ld [wdb1c], a
.asm_67d9
	ld de, wd1a0
	ld hl, $0006
	add hl, de
	ld a, [hl]
	ld d, a
	ld a, [wd983]
	cp d
	ret z
	call SelectActivePartyMon
	and a
	ret z
	ld a, d
	ld [wd983], a
	ld a, $01
	ld [wdcaf], a
	xor a
	ld [wBattleScriptByte], a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld [wdb18], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $04
	ld [hBattleJumptableIndex], a
	ld a, $08
	ld [wBattleIntroJumptableIndex], a
	call ClearMenuCursorSprites
	call DelayFrame
	ld hl, wd978
	ld c, $04
	xor a
.asm_681b
	ld [hli], a
	dec c
	jr nz, .asm_681b
	ld hl, wd900
	ld c, $0C
.asm_6824
	ld a, $0A
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $0A
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_6824
	xor a
	ld [wd9b3], a
	ld [wd9b8], a
	ld [wd9bb], a
	ld [wd997], a
	ret
.asm_6844
	ldh a, [hJoypadPressed]
	bit 1, a
	ret z
	ld a, $02
	ld [wBattleScriptState], a
	ldh [hFFC5], a
	call LoadMenuCursorState
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4589)
	inc hl
	ld [hl], HIGH(Script_024_4589)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret

MovePlayerSpriteForward::
	ld a, [wPlayerFacing]
	and a
	jr z, .asm_687f
	cp $01
	jr z, .asm_6876
	cp $02
	jr z, .asm_6888
	cp $03
	jr z, .asm_6891
.asm_6876
	ld a, [wPlayerObject]
	sub $10
	ld [wPlayerObject], a
	ret
.asm_687f
	ld a, [wPlayerObject]
	add $10
	ld [wPlayerObject], a
	ret
.asm_6888
	ld a, [wPlayerScreenX]
	sub $10
	ld [wPlayerScreenX], a
	ret
.asm_6891
	ld a, [wPlayerScreenX]
	add $10
	ld [wPlayerScreenX], a
	ret
RedrawOverworldScreen::
	ld a, $80
	ldh [rLCDC], a
	ld hl, Palette_White
	call CopyBackgroundPalettes
	ld hl, Palette_White
	call CopyObjectPalettes
	call DelayFrame
	ld a, [wd0bc]
	ldh [hSCX], a
	ld a, [wd0bd]
	ldh [hSCXHigh], a
	ld a, [wd0be]
	ldh [hSCY], a
	ld a, [wd0bf]
	ldh [hSCYHigh], a
	call LoadMapGFX
	ld de, wTilemap
	ld a, [wd0ba]
	ld l, a
	ld a, [wd0bb]
	ld h, a
	ld bc, $1412
	ld a, $14
	ldh [hVRAMCopyWidth], a
	ld a, $12
	ldh [hVRAMCopyHeight], a
	call PlaceTilemap
	farcall LoadScreenAttrmap
	ld de, wPaletteBuffer
	ld hl, wScreenRowBuffer
	ld bc, $0080
	call CopyBytes3
	call ClearMenuCursorTable
	ld hl, InitPlayerCharSprite
	ld b, $04
	rst $30
	ld a, $c7
	ldh [rLCDC], a
	ld hl, wPaletteBuffer
	call CopyBackgroundPalettes
	ld hl, wcaf0
	call CopyObjectPalettes
	call DelayFrame
	ld a, $01
	ldh [hFFC6], a
	xor a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ret
SelectActivePartyMon::
	ld hl, wPartyMon1
	ld bc, $0016
	ld a, d
	and a
	jr z, .asm_6924
.asm_6920
	add hl, bc
	dec a
	jr nz, .asm_6920
.asm_6924
	push hl
	pop bc
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	cp $bf
	jr z, .asm_693f
	and $41
	ld [hl], a
	ld a, c
	ld [wActiveMonPtr], a
	ld a, b
	ld [wd982], a
	ld a, [bc]
	ld [wd9e5], a
	ret
.asm_693f
	xor a
	ret
ClearMenuCursorTable::
	ld hl, wd1a0
	ld c, $40
	xor a
ClearMenuCursorTable_Loop::
	ld [hli], a
	dec c
	jr nz, ClearMenuCursorTable_Loop
	ret
LoadMenuCursorState::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hli]
	ld [wSelectedOption], a
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, $01
	ld [bc], a
	ret

MenuOptionTable_024_6969::
	db $78, $78, $88, $78
StartMenu_PartyScreen::
	call ClearMenuSprites4
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6985
	call AnimateMenuCursorBounce
	call PartyInput_CheckDown
	jr StartMenu_PartyScreen
.asm_6985
	xor a
	ldh [hFFC6], a
	ret
PartyInput_CheckDown::
	ldh a, [hJoypadPressed]
	bit 7, a
	jr z, PartyInput_CheckUp
PartyCursor_MoveDown::
	ld a, [wSelectedOption]
	cp $03
	ret nc
	add $03
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, RefreshPartyCursor
	ld a, [wSelectedOption]
	sub $03
	ld [wSelectedOption], a
	ret
PartyInput_CheckUp::
	ldh a, [hJoypadPressed]
	bit 6, a
	jr z, PartyInput_CheckLeft
PartyCursor_MoveUp::
	ld a, [wSelectedOption]
	cp $03
	ret c
	sub $03
	ld [wSelectedOption], a
	jr RefreshPartyCursor
PartyInput_CheckLeft::
	ldh a, [hJoypadPressed]
	bit 5, a
	jr z, PartyInput_CheckRight
PartyCursor_MoveLeft::
	ld a, [wSelectedOption]
	and a
	ret z
	cp $03
	ret z
	dec a
	ld [wSelectedOption], a
	jr RefreshPartyCursor
PartyInput_CheckRight::
	ldh a, [hJoypadPressed]
	bit 4, a
	jr z, PartyScreen_ConfirmSelection
PartyCursor_MoveRight::
	ld a, [wSelectedOption]
	cp $02
	ret z
	cp $05
	ret z
	inc a
	ld [wSelectedOption], a
	call GetPartyMonPtr
	ld a, [bc]
	and a
	jr nz, RefreshPartyCursor
	ld a, [wSelectedOption]
	dec a
	ld [wSelectedOption], a
	ret
RefreshPartyCursor::
	ld a, SFX_11
	call PlaySound
	ld de, OptionCursorCoords
	ld a, [wSelectedOption]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld bc, wcde0
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4553)
	inc hl
	ld [hl], HIGH(Script_024_4553)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
PartyScreen_ConfirmSelection::
	ldh a, [hJoypadPressed]
	bit 0, a
	jr z, HandleMenuCancel
	ld a, SFX_11
	call PlaySound
	call SaveMenuCursorState
	ldh a, [hBattleJumptableIndex]
	and a
	jr nz, .asm_6a46
	ld a, $01
	ld [wBattleScriptState], a
	ld a, $03
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ret
.asm_6a46
	ld a, $02
	ld [wBattleScriptState], a
	ld a, $03
	ld [hFFC5], a
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_41c1)
	inc hl
	ld [hl], HIGH(Script_024_41c1)
	ret
HandleMenuCancel::
	ldh a, [hJoypadPressed]
	bit 1, a
	jr z, PartyInput_Return
	ld a, SFX_11
	call PlaySound
	ldh a, [hBattleJumptableIndex]
	and a
	jr nz, ExitMenuToBattle
ReturnToStartMenuMain::
	ld a, $02
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_4564)
	inc hl
	ld [hl], HIGH(Script_024_4564)
	xor a
	ld [wBattleScriptByte], a
	ld a, $01
	ldh [hFFC6], a
	ldh [hFFC5], a
	call ClearMenuCursorSprites
	ret
ExitMenuToBattle::
	xor a
	ld [wBattleScriptByte], a
	ldh [hFFC5], a
	ld [wBattleScriptState], a
	ld a, $01
	ldh [hFFC6], a
	ld a, $03
	ld [wBattleIntroJumptableIndex], a
PartyInput_Return::
	ret

OptionCursorCoords::
	db $18, $08
	db $18, $40
	db $18, $78
	db $38, $08
	db $38, $40
	db $38, $78

AnimateMenuCursorBounce::
	ldh a, [hFadeFrameCounter]
	and $07
AnimateMenuCursorBounce_Apply::
	ret nz
	ld bc, wcde0
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_6ac0
	ld a, [bc]
	dec a
	ld [bc], a
	jr .asm_6ac3
.asm_6ac0
	ld a, [bc]
	inc a
	ld [bc], a
.asm_6ac3
	ld a, $01
	sub [hl]
	ld [hl], a
	ret

StartMenu_MainLoop::
; Start menu main loop
.loop
	call ClearMenuSprites4
	call DelayFrame
	ldh a, [hFadeFrameCounter]
	inc a
	ldh [hFadeFrameCounter], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6ae0

	call StartMenu_BounceCursor
	call StartMenu_Input
	jr .loop

.asm_6ae0:
	xor a
	ldh [hFFC6], a
	ret

StartMenu_Input::
; Check down
	ldh a, [hJoypadPressed]
	bit D_DOWN_F, a
	jr z, .check_up

; Pressed down
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	inc a
	ld [wSelectedOption], a
	cp 5
	jr c, .asm_6b1c

; reached bottom
	xor a
	ld [wSelectedOption], a
	jr .asm_6b1c

.check_up
	ldh a, [hJoypadPressed]
	bit D_UP_F, a
	jr z, .check_a

; Pressed up
	ld a, SFX_11
	call PlaySound
	ld a, [wSelectedOption]
	and a
	jr z, .reached_top

	dec a
	ld [wSelectedOption], a
	jr .asm_6b1c

.reached_top
	ld a, 4
	ld [wSelectedOption], a

.asm_6b1c
	ld a, [wSelectedOption]
	add a
	add a
	add a
	add a
	add $18
	ld [wcde0], a
	jr .ret

.check_a
	ldh a, [hJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .check_exit

; Pressed A
	ld a, [wSelectedOption]
	and a
	jr z, .asm_6b3c
	cp 1
	jr z, .asm_6b3c
	jr .asm_6b42

.asm_6b3c
	ld a, [wdcbb]
	and a
	jr z, .check_exit

.asm_6b42
	ld a, [wSelectedOption]
	cp 2
	jr nz, .asm_6b57

	ld a, [hMapPredef]
	cp $11
	jr z, .check_exit

	ld a, [wPlayerSpriteID]
	cp 9
	jr z, .check_exit

.asm_6b57
	ld a, SFX_11
	call PlaySound
	call SaveMenuCursorState
	ld a, 1
	ld [wBattleScriptState], a
	ldh [hFFC6], a
	xor a
	ld [wBattleScriptByte], a

	ld de, MenuOptionStateTable_024_6b9c
	ld a, [wSelectedOption]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ldh [hFFC5], a

	xor a
	ld [wd9d8], a
	ld [wSelectedPage], a
	jr .ret

.check_exit
	ldh a, [hJoypadPressed]
	and START | B_BUTTON
	jr z, .ret

; Close menu
	ld a, 2
	ld [wBattleScriptState], a
	ld hl, wBattleScriptPos
	ld [hl], LOW(Script_024_454c)
	inc hl
	ld [hl], HIGH(Script_024_454c)
	xor a
	ld [wBattleScriptByte], a
	ld a, 1
	ldh [hFFC6], a

.ret
	ret

MenuOptionStateTable_024_6b9c::
	db $02, $07, $14, $12, $15

SaveMenuCursorState::
	ld de, wd1a0
	ldh a, [hFFC5]
	ld l, a
	add a
	add l
	ld l, a
	ld h, $00
	add hl, de
	ld a, [wSelectedOption]
	ld [hli], a
	ld bc, wcde0
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ret

StartMenu_BounceCursor::
	ldh a, [hFadeFrameCounter]
	and 7 ; 0 or 8
	ret nz

; x coord = 76 or 77
	ld bc, wcde0
	inc bc
	ld a, [bc]
	cp $76
	jr z, .move

	ld a, $76
	ld [bc], a
	ret

.move
	ld a, $77
	ld [bc], a
	ret

DrawMenuSpriteSlot2::
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf8
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
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $94
	ld e, a
	ld d, $C0
.asm_6bef
	ld a, [hli]
	cp $FF
	jr z, .asm_6c04
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
	jr .asm_6bef
.asm_6c04
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

DrawMenuSpriteSlot1::
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf0
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
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $98
	ld e, a
	ld d, $C0
.asm_6c28
	ld a, [hli]
	cp $FF
	jr z, .asm_6c3d
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
	jr .asm_6c28
.asm_6c3d
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

DrawMenuCursorOAM::
	ld hl, SpriteOAMTemplate_Pointers
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
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $9C
	ld e, a
	ld d, $C0
.asm_6c61
	ld a, [hli]
	cp $FF
	jr z, .asm_6c76
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
	jr .asm_6c61
.asm_6c76
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

DrawMenuSpriteSlot1Low::
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf0
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
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $80
	ld e, a
	ld d, $C0
.asm_6c9a
	ld a, [hli]
	cp $FF
	jr z, .asm_6caf
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
	jr .asm_6c9a
.asm_6caf
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

DrawMenuSpriteSlot2Low::
	ld hl, SpriteOAMTemplate_Pointers
	ld de, wcdf8
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
	adc $00
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $60
	ld e, a
	ld d, $C0
.asm_6cd3
	ld a, [hli]
	cp $FF
	jr z, .asm_6ce8
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
	jr .asm_6cd3
.asm_6ce8
	ld a, e
	ld [wVirtualOAMPtr], a
	ret

SpriteOAMTemplate_Pointers::
	dw .template0
	dw .template0
	dw .template1
	dw .template2
	dw .template3
	dw .template4
	dw .template5
	dw .template6
.template0
	db $00, $00, $00, $FE, $00, $FF
.template1
	db $00, $00, $00, $FE, $20, $FF
.template2
	db $00, $00, $00, $FE, $03, $FF
.template3
	db $00, $00, $08, $F6, $00
	db $00, $08, $00, $F8, $00
	db $FF
.template4
	db $00, $00, $08, $FA, $00
	db $00, $08, $00, $FC, $00
	db $FF
.template5
	db $00, $00, $08, $00, $01
	db $00, $08, $00, $02, $01
	db $00, $10, $08, $04, $01
	db $00, $18, $00, $06, $01
	db $10, $00, $08, $08, $01
	db $10, $08, $00, $0A, $01
	db $10, $10, $08, $0C, $01
	db $10, $18, $00, $0E, $01
	db $FF
.template6
	db $00, $00, $08, $E0, $01
	db $00, $08, $00, $E2, $01
	db $00, $10, $08, $E4, $01
	db $00, $18, $00, $E6, $01
	db $10, $00, $08, $E8, $01
	db $10, $08, $00, $EA, $01
	db $10, $10, $08, $EC, $01
	db $10, $18, $00, $EE, $01
	db $FF

INCLUDE "data/moves/pp.asm"
; [wCurItemID - $28] -> MOVE_* taught by TM
TMMoveTable::
	db $89
	db $35
	db $4d
	db $6b
	db $2e
	db $05
	db $45
	db $16
	db $73
	db $23
	db $4c
	db $22
	db $07
	db $78
	db $19
	db $40
	db $81
	db $77
	db $5d
	db $06
	db $1e
	db $4f
	db $75
	db $0a
	db $2a
	db $61
	db $3b
	db $32
	db $68
	db $85
	db $88
	db $5a
	db $3c
	db $8c
	db $48
	db $66
	db $44
	db $54
	db $26
	db $50
	db $8b
	db $8a
	db $39
	db $7b
	db $3d
	db $31
	db $20
	db $5b
	db $84
	db $7d
Pointers_024_6e36::
	dw Pointers_024_6e36_6f68
	dw Pointers_024_6e36_6f68
	dw Pointers_024_6e36_6f82
	dw Pointers_024_6e36_6f9c
	dw Pointers_024_6e36_6fb6
	dw Pointers_024_6e36_6fd0
	dw Pointers_024_6e36_6fea
	dw Pointers_024_6e36_7004
	dw Pointers_024_6e36_701e
	dw Pointers_024_6e36_7038
	dw Pointers_024_6e36_7052
	dw Pointers_024_6e36_706c
	dw Pointers_024_6e36_7082
	dw Pointers_024_6e36_7098
	dw Pointers_024_6e36_70ae
	dw Pointers_024_6e36_70c4
	dw Pointers_024_6e36_70da
	dw Pointers_024_6e36_70f0
	dw Pointers_024_6e36_7106
	dw Pointers_024_6e36_711c
	dw Pointers_024_6e36_7132
	dw Pointers_024_6e36_7148
	dw Pointers_024_6e36_715d
	dw Pointers_024_6e36_7172
	dw Pointers_024_6e36_7187
	dw Pointers_024_6e36_719c
	dw Pointers_024_6e36_71b1
	dw Pointers_024_6e36_71c6
	dw Pointers_024_6e36_71db
	dw Pointers_024_6e36_71f0
	dw Pointers_024_6e36_7205
	dw Pointers_024_6e36_721a
	dw Pointers_024_6e36_722e
	dw Pointers_024_6e36_7242
	dw Pointers_024_6e36_7256
	dw Pointers_024_6e36_726a
	dw Pointers_024_6e36_727e
	dw Pointers_024_6e36_7292
	dw Pointers_024_6e36_72a6
	dw Pointers_024_6e36_72ba
	dw Pointers_024_6e36_72ce
	dw Pointers_024_6e36_72e2
	dw Pointers_024_6e36_72f6
	dw Pointers_024_6e36_730a
	dw Pointers_024_6e36_731e
	dw Pointers_024_6e36_7332
	dw Pointers_024_6e36_7346
	dw Pointers_024_6e36_735a
	dw Pointers_024_6e36_736e
	dw Pointers_024_6e36_7382
	dw Pointers_024_6e36_7396
	dw Pointers_024_6e36_73aa
	dw Pointers_024_6e36_73be
	dw Pointers_024_6e36_73d2
	dw Pointers_024_6e36_73e6
	dw Pointers_024_6e36_73fa
	dw Pointers_024_6e36_740e
	dw Pointers_024_6e36_7422
	dw Pointers_024_6e36_7436
	dw Pointers_024_6e36_744a
	dw Pointers_024_6e36_745e
	dw Pointers_024_6e36_7472
	dw Pointers_024_6e36_7486
	dw Pointers_024_6e36_749a
	dw Pointers_024_6e36_74ae
	dw Pointers_024_6e36_74c2
	dw Pointers_024_6e36_74d6
	dw Pointers_024_6e36_74ea
	dw Pointers_024_6e36_74fe
	dw Pointers_024_6e36_7512
	dw Pointers_024_6e36_7526
	dw Pointers_024_6e36_753a
	dw Pointers_024_6e36_754f
	dw Pointers_024_6e36_7564
	dw Pointers_024_6e36_7579
	dw Pointers_024_6e36_758e
	dw Pointers_024_6e36_75a3
	dw Pointers_024_6e36_75b8
	dw Pointers_024_6e36_75cd
	dw Pointers_024_6e36_75e2
	dw Pointers_024_6e36_75f7
	dw Pointers_024_6e36_760c
	dw Pointers_024_6e36_7626
	dw Pointers_024_6e36_7640
	dw Pointers_024_6e36_765a
	dw Pointers_024_6e36_7674
	dw Pointers_024_6e36_768e
	dw Pointers_024_6e36_76a8
	dw Pointers_024_6e36_76c2
	dw Pointers_024_6e36_76dc
	dw Pointers_024_6e36_76f6
	dw Pointers_024_6e36_770c
	dw Pointers_024_6e36_7722
	dw Pointers_024_6e36_7738
	dw Pointers_024_6e36_774e
	dw Pointers_024_6e36_7764
	dw Pointers_024_6e36_777a
	dw Pointers_024_6e36_7790
	dw Pointers_024_6e36_77a6
	dw Pointers_024_6e36_77bc
	dw Pointers_024_6e36_77d1
	dw Pointers_024_6e36_77e6
	dw Pointers_024_6e36_77fb
	dw Pointers_024_6e36_7810
	dw Pointers_024_6e36_7825
	dw Pointers_024_6e36_783a
	dw Pointers_024_6e36_784f
	dw Pointers_024_6e36_7864
	dw Pointers_024_6e36_7879
	dw Pointers_024_6e36_788d
	dw Pointers_024_6e36_78a1
	dw Pointers_024_6e36_78b5
	dw Pointers_024_6e36_78c9
	dw Pointers_024_6e36_78dd
	dw Pointers_024_6e36_78f1
	dw Pointers_024_6e36_7905
	dw Pointers_024_6e36_7919
	dw Pointers_024_6e36_792d
	dw Pointers_024_6e36_7941
	dw Pointers_024_6e36_7955
	dw Pointers_024_6e36_7969
	dw Pointers_024_6e36_797d
	dw Pointers_024_6e36_7991
	dw Pointers_024_6e36_79a5
	dw Pointers_024_6e36_79b9
	dw Pointers_024_6e36_79cd
	dw Pointers_024_6e36_79e1
	dw Pointers_024_6e36_79f5
	dw Pointers_024_6e36_7a09
	dw Pointers_024_6e36_7a1d
	dw Pointers_024_6e36_7a31
	dw Pointers_024_6e36_7a45
	dw Pointers_024_6e36_7a59
	dw Pointers_024_6e36_7a6d
	dw Pointers_024_6e36_7a81
	dw Pointers_024_6e36_7a95
	dw Pointers_024_6e36_7aa9
	dw Pointers_024_6e36_7abd
	dw Pointers_024_6e36_7ad1
	dw Pointers_024_6e36_7ae5
	dw Pointers_024_6e36_7af9
	dw Pointers_024_6e36_7b0d
	dw Pointers_024_6e36_7b21
	dw Pointers_024_6e36_7b35
	dw Pointers_024_6e36_7b49
	dw Pointers_024_6e36_7b5e
	dw Pointers_024_6e36_7b73
	dw Pointers_024_6e36_7b88
	dw Pointers_024_6e36_7b9d
	dw Pointers_024_6e36_7bb2
	dw Pointers_024_6e36_7bc7
	dw Pointers_024_6e36_7bdc
	dw Pointers_024_6e36_7bf0
Pointers_024_6e36_6f68::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_6f82::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_6f9c::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_6fb6::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_6fd0::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_6fea::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_7004::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_701e::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_7038::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_7052::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_706c::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7082::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7098::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_70ae::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_70c4::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_70da::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_70f0::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7106::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_711c::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7132::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7148::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_715d::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_7172::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_7187::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_719c::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_71b1::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_71c6::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_71db::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_71f0::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_7205::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_721a::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_722e::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7242::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7256::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_726a::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_727e::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7292::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_72a6::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_72ba::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_72ce::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_72e2::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_72f6::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_730a::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_731e::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7332::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7346::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_735a::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_736e::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7382::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7396::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_73aa::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_73be::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_73d2::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_73e6::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_73fa::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_740e::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7422::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7436::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_744a::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_745e::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7472::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7486::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_749a::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_74ae::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_74c2::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_74d6::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_74ea::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_74fe::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7512::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7526::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_753a::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_754f::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7564::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7579::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_758e::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_75a3::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_75b8::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_75cd::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_75e2::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_75f7::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_760c::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_7626::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_7640::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_765a::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_7674::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_768e::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_76a8::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_76c2::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_76dc::
	db $01, $02, $05, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $19, $1b, $1c, $1e
	db $1f, $21, $27, $2b, $2d, $2e, $2f, $31, $32, $ff
Pointers_024_6e36_76f6::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_770c::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7722::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7738::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_774e::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7764::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_777a::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_7790::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_77a6::
	db $01, $06, $07, $08, $0a, $0c, $0d, $0f, $10, $11, $14, $15, $18, $1e, $1f, $25
	db $27, $2a, $2f, $31, $32, $ff
Pointers_024_6e36_77bc::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_77d1::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_77e6::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_77fb::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_7810::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_7825::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_783a::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_784f::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_7864::
	db $01, $03, $06, $08, $0a, $0b, $0c, $0d, $0f, $11, $14, $18, $1e, $1f, $23, $27
	db $29, $2f, $31, $32, $ff
Pointers_024_6e36_7879::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_788d::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_78a1::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_78b5::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_78c9::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_78dd::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_78f1::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7905::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7919::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $13, $14, $18, $1a, $1e, $1f, $24, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_792d::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7941::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7955::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7969::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_797d::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7991::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_79a5::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_79b9::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_79cd::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_79e1::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_79f5::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a09::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a1d::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a31::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a45::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a59::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a6d::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a81::
	db $01, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $16, $18, $1e, $1f, $26, $27, $28
	db $2f, $31, $32, $ff
Pointers_024_6e36_7a95::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7aa9::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7abd::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7ad1::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7ae5::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7af9::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7b0d::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7b21::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7b35::
	db $01, $04, $06, $08, $0a, $0c, $0d, $0f, $11, $14, $18, $1d, $1e, $1f, $20, $27
	db $2f, $31, $32, $ff
Pointers_024_6e36_7b49::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7b5e::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7b73::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7b88::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7b9d::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7bb2::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7bc7::
	db $01, $06, $08, $0a, $0c, $0d, $0e, $0f, $11, $12, $14, $18, $1e, $1f, $22, $27
	db $2f, $30, $31, $32, $ff
Pointers_024_6e36_7bdc::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff
Pointers_024_6e36_7bf0::
	db $01, $06, $08, $09, $0a, $0c, $0d, $0f, $11, $14, $17, $18, $1e, $1f, $27, $2c
	db $2f, $31, $32, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

