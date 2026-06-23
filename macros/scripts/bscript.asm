; Battle/screen-script VM (Func_025_424e dispatcher, Jumptable_025_42b3).
; Used by bank 24 (battle) and bank 39 (screen) scripts. Operand counts validated
; against bank 24 (61/63 linear-exact). Mnemonics are best-effort.

	const_def
	const bscript_vm_nop ; $00
MACRO bs_vm_nop
	db bscript_vm_nop
ENDM
	const bscript_print_text_xy ; $01
MACRO bs_print_text_xy
	db bscript_print_text_xy
	dw \1
	db \2
	db \3
ENDM
	const bscript_place_tile_attr ; $02
MACRO bs_place_tile_attr
	db bscript_place_tile_attr
	dw \1
	dw \2
	dw \3
ENDM
	const bscript_vram_copy3 ; $03
MACRO bs_vram_copy3
	db bscript_vram_copy3
	dw \1
	dw \2
	dw \3
ENDM
	const bscript_set_sprite_pos ; $04
MACRO bs_set_sprite_pos
	db bscript_set_sprite_pos
	db \1
	db \2
ENDM
	const bscript_end_script ; $05
MACRO bs_end_script
	db bscript_end_script
ENDM
	const bscript_init_menu_a ; $06
MACRO bs_init_menu_a
	db bscript_init_menu_a
ENDM
	const bscript_end_menu ; $07
MACRO bs_end_menu
	db bscript_end_menu
ENDM
	const bscript_lcd_off_loadpal ; $08
MACRO bs_lcd_off_loadpal
	db bscript_lcd_off_loadpal
ENDM
	const bscript_lcd_on_loadpal ; $09
MACRO bs_lcd_on_loadpal
	db bscript_lcd_on_loadpal
ENDM
	const bscript_reset_scroll_clr ; $0a
MACRO bs_reset_scroll_clr
	db bscript_reset_scroll_clr
ENDM
	const bscript_load_bgpal_buf ; $0b
MACRO bs_load_bgpal_buf
	db bscript_load_bgpal_buf
	dw \1
ENDM
	const bscript_load_objpal_buf ; $0c
MACRO bs_load_objpal_buf
	db bscript_load_objpal_buf
	dw \1
ENDM
	const bscript_load_mon_bgpal ; $0d
MACRO bs_load_mon_bgpal
	db bscript_load_mon_bgpal
	db \1
ENDM
	const bscript_load_mon_pic ; $0e
MACRO bs_load_mon_pic
	db bscript_load_mon_pic
	dw \1
ENDM
	const bscript_print_mon_name ; $0f
MACRO bs_print_mon_name
	db bscript_print_mon_name
	db \1
	db \2
ENDM
	const bscript_draw_party_list ; $10
MACRO bs_draw_party_list
	db bscript_draw_party_list
ENDM
	const bscript_clear_oam ; $11
MACRO bs_clear_oam
	db bscript_clear_oam
ENDM
	const bscript_print_hp ; $12
MACRO bs_print_hp
	db bscript_print_hp
ENDM
	const bscript_load_mon_objpal ; $13
MACRO bs_load_mon_objpal
	db bscript_load_mon_objpal
	db \1
ENDM
	const bscript_load_map_bg ; $14
MACRO bs_load_map_bg
	db bscript_load_map_bg
ENDM
	const bscript_select_menu ; $15
MACRO bs_select_menu
	db bscript_select_menu
	db \1
ENDM
	const bscript_save_palbuf ; $16
MACRO bs_save_palbuf
	db bscript_save_palbuf
ENDM
	const bscript_init_bank4 ; $17
MACRO bs_init_bank4
	db bscript_init_bank4
ENDM
	const bscript_draw_status_icons ; $18
MACRO bs_draw_status_icons
	db bscript_draw_status_icons
ENDM
	const bscript_clear_bgbox ; $19
MACRO bs_clear_bgbox
	db bscript_clear_bgbox
	db \1
	db \2
ENDM
	const bscript_end_script3 ; $1a
MACRO bs_end_script3
	db bscript_end_script3
ENDM
	const bscript_clear_bgbox_at ; $1b
MACRO bs_clear_bgbox_at
	db bscript_clear_bgbox_at
	db \1
	db \2
	dw \3
ENDM
	const bscript_draw_status_2 ; $1c
MACRO bs_draw_status_2
	db bscript_draw_status_2
ENDM
	const bscript_print_all_stats ; $1d
MACRO bs_print_all_stats
	db bscript_print_all_stats
ENDM
	const bscript_set_cursor ; $1e
MACRO bs_set_cursor
	db bscript_set_cursor
ENDM
	const bscript_draw_equip_list ; $1f
MACRO bs_draw_equip_list
	db bscript_draw_equip_list
ENDM
	const bscript_print_equip_name ; $20
MACRO bs_print_equip_name
	db bscript_print_equip_name
ENDM
	const bscript_load_menu_entry ; $21
MACRO bs_load_menu_entry
	db bscript_load_menu_entry
ENDM
	const bscript_copy_sprite_pos ; $22
MACRO bs_copy_sprite_pos
	db bscript_copy_sprite_pos
ENDM
	const bscript_swap_mon_data ; $23
MACRO bs_swap_mon_data
	db bscript_swap_mon_data
ENDM
	const bscript_load_menu_entry_n ; $24
MACRO bs_load_menu_entry_n
	db bscript_load_menu_entry_n
	db \1
ENDM
	const bscript_print_menu_pg_a ; $25
MACRO bs_print_menu_pg_a
	db bscript_print_menu_pg_a
	db \1
ENDM
	const bscript_print_menu_pg_b ; $26
MACRO bs_print_menu_pg_b
	db bscript_print_menu_pg_b
	db \1
ENDM
	const bscript_draw_item_list ; $27
MACRO bs_draw_item_list
	db bscript_draw_item_list
ENDM
	const bscript_draw_page_arrows ; $28
MACRO bs_draw_page_arrows
	db bscript_draw_page_arrows
ENDM
	const bscript_draw_x_47fb ; $29
MACRO bs_draw_x_47fb
	db bscript_draw_x_47fb
ENDM
	const bscript_clear_vram_2 ; $2a
MACRO bs_clear_vram_2
	db bscript_clear_vram_2
ENDM
	const bscript_print_num_d9d3 ; $2b
MACRO bs_print_num_d9d3
	db bscript_print_num_d9d3
	dw \1
ENDM
	const bscript_draw_y ; $2c
MACRO bs_draw_y
	db bscript_draw_y
ENDM
	const bscript_draw_z_434d ; $2d
MACRO bs_draw_z_434d
	db bscript_draw_z_434d
	db \1
ENDM
	const bscript_draw_party_4 ; $2e
MACRO bs_draw_party_4
	db bscript_draw_party_4
ENDM
	const bscript_print_equip_n ; $2f
MACRO bs_print_equip_n
	db bscript_print_equip_n
	db \1
ENDM
	const bscript_draw_w_4745 ; $30
MACRO bs_draw_w_4745
	db bscript_draw_w_4745
ENDM
	const bscript_load_mon_pic_cond ; $31
MACRO bs_load_mon_pic_cond
	db bscript_load_mon_pic_cond
	dw \1
ENDM
	const bscript_load_mon_bgpal_2 ; $32
MACRO bs_load_mon_bgpal_2
	db bscript_load_mon_bgpal_2
	db \1
ENDM
	const bscript_draw_8_items ; $33
MACRO bs_draw_8_items
	db bscript_draw_8_items
ENDM
	const bscript_print_two_nums ; $34
MACRO bs_print_two_nums
	db bscript_print_two_nums
ENDM
	const bscript_load_mon_objpal_2 ; $35
MACRO bs_load_mon_objpal_2
	db bscript_load_mon_objpal_2
	db \1
ENDM
	const bscript_print_num_indir ; $36
MACRO bs_print_num_indir
	db bscript_print_num_indir
	dw \1
	dw \2
	dw \3
ENDM
	const bscript_draw_text_53ab ; $37
MACRO bs_draw_text_53ab
	db bscript_draw_text_53ab
ENDM
	const bscript_draw_dex_pic ; $38
MACRO bs_draw_dex_pic
	db bscript_draw_dex_pic
ENDM
	const bscript_draw_text_5711 ; $39
MACRO bs_draw_text_5711
	db bscript_draw_text_5711
ENDM
	const bscript_draw_text_50ad ; $3a
MACRO bs_draw_text_50ad
	db bscript_draw_text_50ad
ENDM
	const bscript_print_num_full ; $3b
MACRO bs_print_num_full
	db bscript_print_num_full
	db \1
	dw \2
	dw \3
	dw \4
ENDM
	const bscript_draw_clock ; $3c
MACRO bs_draw_clock
	db bscript_draw_clock
ENDM
	const bscript_fill_vram ; $3d
MACRO bs_fill_vram
	db bscript_fill_vram
	dw \1
	dw \2
ENDM
	const bscript_set_cursor_2 ; $3e
MACRO bs_set_cursor_2
	db bscript_set_cursor_2
ENDM
	const bscript_farcopy_vram ; $3f
MACRO bs_farcopy_vram
	db bscript_farcopy_vram
	db \1
	dw \2
	dw \3
	dw \4
ENDM
	const bscript_end_to_menu ; $40
MACRO bs_end_to_menu
	db bscript_end_to_menu
ENDM
	const bscript_draw_item_page ; $41
MACRO bs_draw_item_page
	db bscript_draw_item_page
ENDM
	const bscript_clear_region ; $42
MACRO bs_clear_region
	db bscript_clear_region
ENDM
	const bscript_draw_item_x ; $43
MACRO bs_draw_item_x
	db bscript_draw_item_x
ENDM
	const bscript_draw_item_arrows ; $44
MACRO bs_draw_item_arrows
	db bscript_draw_item_arrows
ENDM
	const bscript_draw_q_4416 ; $45
MACRO bs_draw_q_4416
	db bscript_draw_q_4416
ENDM
	const bscript_draw_r_46af ; $46
MACRO bs_draw_r_46af
	db bscript_draw_r_46af
ENDM
	const bscript_draw_mon_full ; $47
MACRO bs_draw_mon_full
	db bscript_draw_mon_full
	db \1
	dw \2
	db \3
	db \4
ENDM
	const bscript_print_hp_2 ; $48
MACRO bs_print_hp_2
	db bscript_print_hp_2
ENDM
	const bscript_print_stats_2 ; $49
MACRO bs_print_stats_2
	db bscript_print_stats_2
ENDM
	const bscript_draw_party_stats ; $4a
MACRO bs_draw_party_stats
	db bscript_draw_party_stats
ENDM
	const bscript_draw_box_markers ; $4b
MACRO bs_draw_box_markers
	db bscript_draw_box_markers
ENDM
	const bscript_clear_menu_table ; $4c
MACRO bs_clear_menu_table
	db bscript_clear_menu_table
ENDM
	const bscript_reset_scroll_2 ; $4d
MACRO bs_reset_scroll_2
	db bscript_reset_scroll_2
ENDM
	const bscript_count_dex ; $4e
MACRO bs_count_dex
	db bscript_count_dex
ENDM
	const bscript_vm_nop_2 ; $4f
MACRO bs_vm_nop_2
	db bscript_vm_nop_2
ENDM
	const bscript_draw_s_42ba ; $50
MACRO bs_draw_s_42ba
	db bscript_draw_s_42ba
ENDM
	const bscript_clear_bgbox_vram1 ; $51
MACRO bs_clear_bgbox_vram1
	db bscript_clear_bgbox_vram1
	db \1
	db \2
ENDM
	const bscript_print_num_full_2 ; $52
MACRO bs_print_num_full_2
	db bscript_print_num_full_2
	db \1
	dw \2
	dw \3
	dw \4
ENDM
	const bscript_draw_t_45f8 ; $53
MACRO bs_draw_t_45f8
	db bscript_draw_t_45f8
ENDM
	const bscript_skip_if_empty ; $54
MACRO bs_skip_if_empty
	db bscript_skip_if_empty
	db \1
ENDM
	const bscript_draw_8_party ; $55
MACRO bs_draw_8_party
	db bscript_draw_8_party
ENDM
	const bscript_draw_u_54cc ; $56
MACRO bs_draw_u_54cc
	db bscript_draw_u_54cc
ENDM
	const bscript_draw_v_40b7 ; $57
MACRO bs_draw_v_40b7
	db bscript_draw_v_40b7
ENDM
	const bscript_set_two_sprites ; $58
MACRO bs_set_two_sprites
	db bscript_set_two_sprites
	db \1
	db \2
	db \3
	db \4
ENDM
	const bscript_load_pals_a ; $59
MACRO bs_load_pals_a
	db bscript_load_pals_a
ENDM
	const bscript_load_menu_option ; $5a
MACRO bs_load_menu_option
	db bscript_load_menu_option
ENDM
	const bscript_load_pals_b ; $5b
MACRO bs_load_pals_b
	db bscript_load_pals_b
ENDM
	const bscript_draw_aa_434d ; $5c
MACRO bs_draw_aa_434d
	db bscript_draw_aa_434d
	db \1
ENDM
	const bscript_draw_ab_42ba ; $5d
MACRO bs_draw_ab_42ba
	db bscript_draw_ab_42ba
ENDM
	const bscript_print_box_num ; $5e
MACRO bs_print_box_num
	db bscript_print_box_num
ENDM
	const bscript_draw_ac_407b ; $5f
MACRO bs_draw_ac_407b
	db bscript_draw_ac_407b
ENDM
