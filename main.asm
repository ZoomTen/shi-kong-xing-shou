INCLUDE "constants.asm"

SECTION "bank01", ROMX
INCLUDE "banks/bank_01.asm"

SECTION "bank04", ROMX
INCLUDE "engine/gfx/oam.asm"

SECTION "bank05", ROMX
INCLUDE "engine/overworld/update_map_coords.asm"
INCLUDE "engine/overworld/object_events.asm"
INCLUDE "engine/overworld/overworld_loop.asm"
INCLUDE "engine/gfx/update_object_anims.asm"
INCLUDE "engine/overworld/load_map_objects.asm"
INCLUDE "engine/overworld/get_facing_tiles.asm"
INCLUDE "engine/overworld/handle_steps.asm"
INCLUDE "engine/overworld/events.asm"
INCLUDE "engine/menu/start_menu_init.asm"
INCLUDE "engine/battle/start_battle.asm"
INCLUDE "engine/overworld/switch_chara.asm"
INCLUDE "engine/overworld/interaction.asm"
INCLUDE "engine/overworld/process_input.asm"
INCLUDE "engine/overworld/zones.asm"

SECTION "Tilesets", ROMX
INCLUDE "data/maps/tilesets.asm"

SECTION "bank07", ROMX
INCLUDE "banks/bank_07.asm"

SECTION "bank08", ROMX
INCLUDE "banks/bank_08.asm"
INCLUDE "data/text/bank08_misc2.asm"
INCLUDE "data/text/ballots_house_intro.asm"
INCLUDE "data/text/bank08_misc.asm"
INCLUDE "engine/movie/meteor.asm"

SECTION "bank09", ROMX
INCLUDE "banks/bank_09.asm"

SECTION "bank0a", ROMX
INCLUDE "engine/gfx/textbox.asm"
INCLUDE "engine/copy_names.asm"

SECTION "bank0b", ROMX
INCLUDE "banks/bank_0b.asm"

SECTION "bank0c", ROMX
INCLUDE "banks/bank_0c.asm"
INCLUDE "engine/overworld/signposts.asm"

SECTION "SRAM Test", ROMX
INCLUDE "engine/save/sram_test.asm"

SECTION "Overworld Map Items", ROMX
INCLUDE "engine/overworld/map_items.asm"

SECTION "bank0d", ROMX
INCLUDE "banks/bank_0d.asm"

SECTION "bank0e", ROMX
INCLUDE "banks/bank_0e.asm"

SECTION "bank0f", ROMX
INCLUDE "banks/bank_0f.asm"

SECTION "bank10", ROMX
INCLUDE "banks/bank_10.asm"

SECTION "bank11", ROMX
INCLUDE "banks/bank_11.asm"

SECTION "bank12", ROMX
INCLUDE "banks/bank_12.asm"

SECTION "bank13", ROMX
INCLUDE "banks/bank_13.asm"

SECTION "bank14", ROMX
INCLUDE "banks/bank_14.asm"

SECTION "bank15", ROMX
INCLUDE "banks/bank_15.asm"

SECTION "bank17", ROMX
INCLUDE "banks/bank_17.asm"

SECTION "bank18", ROMX
INCLUDE "banks/bank_18.asm"

SECTION "bank1a", ROMX
INCLUDE "engine/movie/letter.asm"

SECTION "bank1b", ROMX
INCLUDE "engine/movie/gale.asm"

SECTION "bank1c", ROMX
INCLUDE "banks/bank_1c.asm"

SECTION "bank1e", ROMX
INCLUDE "banks/bank_1e.asm"

SECTION "bank1f", ROMX
INCLUDE "banks/bank_1f.asm"

SECTION "bank20", ROMX
INCLUDE "banks/bank_20.asm"

SECTION "bank21", ROMX
INCLUDE "banks/bank_21.asm"

SECTION "bank22", ROMX
INCLUDE "banks/bank_22.asm"

SECTION "bank23", ROMX
INCLUDE "banks/bank_23.asm"

SECTION "bank24", ROMX
INCLUDE "banks/bank_24.asm"

SECTION "bank25", ROMX
INCLUDE "banks/bank_25.asm"

SECTION "bank26", ROMX
INCLUDE "banks/bank_26.asm"

SECTION "bank2b", ROMX
INCLUDE "banks/bank_2b.asm"

SECTION "bank2c", ROMX
INCLUDE "banks/bank_2c.asm"

SECTION "bank2d", ROMX
INCLUDE "banks/bank_2d.asm"

SECTION "bank2e", ROMX
INCLUDE "banks/bank_2e.asm"

SECTION "bank2f", ROMX
INCLUDE "banks/bank_2f.asm"

SECTION "bank30", ROMX
INCLUDE "banks/bank_30.asm"

SECTION "bank31", ROMX
INCLUDE "banks/bank_31.asm"

SECTION "bank32", ROMX
INCLUDE "banks/bank_32.asm"

SECTION "bank33", ROMX
INCLUDE "banks/bank_33.asm"

SECTION "bank34", ROMX
INCLUDE "banks/bank_34.asm"

SECTION "bank35", ROMX
INCLUDE "banks/bank_35.asm"

SECTION "bank36", ROMX
INCLUDE "banks/bank_36.asm"

SECTION "bank37", ROMX
INCLUDE "banks/bank_37.asm"

SECTION "bank38", ROMX
INCLUDE "banks/bank_38.asm"

SECTION "bank39", ROMX
INCLUDE "banks/bank_39.asm"

SECTION "bank3a", ROMX
INCLUDE "banks/bank_3a.asm"

SECTION "bank3b", ROMX
INCLUDE "banks/bank_3b.asm"

SECTION "bank3c", ROMX
INCLUDE "engine/save/load_game.asm"
INCLUDE "engine/menu/new_game_continue.asm"
INCLUDE "engine/movie/game_over.asm"
INCLUDE "engine/movie/1a.asm"

SECTION "bank3d", ROMX
INCLUDE "banks/bank_3d.asm"

SECTION "bank3e", ROMX
INCLUDE "banks/bank_3e.asm"

SECTION "bank3f", ROMX
INCLUDE "banks/bank_3f.asm"

SECTION "bank48", ROMX
INCLUDE "banks/bank_48.asm"

SECTION "bank49", ROMX
INCLUDE "banks/bank_49.asm"

SECTION "bank4a", ROMX
INCLUDE "banks/bank_4a.asm"

SECTION "bank4d", ROMX
INCLUDE "banks/bank_4d.asm"

SECTION "bank4e", ROMX
INCLUDE "banks/bank_4e.asm"

SECTION "bank4f", ROMX
INCLUDE "banks/bank_4f.asm"

SECTION "bank50", ROMX
INCLUDE "banks/bank_50.asm"

SECTION "bank52", ROMX
INCLUDE "banks/bank_52.asm"

SECTION "bank53", ROMX
INCLUDE "banks/bank_53.asm"

SECTION "bank55", ROMX
INCLUDE "engine/movie/airport2.asm"
INCLUDE "banks/bank_55.asm"

SECTION "bank57", ROMX
INCLUDE "banks/bank_57.asm"

SECTION "bank58", ROMX
INCLUDE "banks/bank_58.asm"

SECTION "bank59", ROMX
INCLUDE "banks/bank_59.asm"

SECTION "bank5a", ROMX
INCLUDE "banks/bank_5a.asm"

SECTION "bank5b", ROMX
INCLUDE "engine/minigame/mice.asm"

SECTION "bank5c", ROMX
INCLUDE "banks/bank_5c.asm"
INCLUDE "engine/movie/helen.asm"

SECTION "bank5d", ROMX
INCLUDE "engine/minigame/rhythm.asm"

SECTION "bank5e", ROMX
INCLUDE "banks/bank_5e.asm"
INCLUDE "engine/minigame/racing.asm"

SECTION "bank5f", ROMX
INCLUDE "engine/movie/crystal.asm"

SECTION "bank60", ROMX
INCLUDE "banks/bank_60.asm"

SECTION "bank61", ROMX
INCLUDE "engine/movie/meteor_2.asm"
INCLUDE "engine/movie/underwater.asm"

SECTION "bank62", ROMX
INCLUDE "engine/movie/world_map.asm"
INCLUDE "engine/debug/sound_test.asm"

SECTION "bank63", ROMX
INCLUDE "banks/bank_63.asm"

SECTION "bank64", ROMX
INCLUDE "banks/bank_64.asm"

SECTION "bank66", ROMX
INCLUDE "banks/bank_66.asm"

SECTION "bank67", ROMX
INCLUDE "engine/movie/beach.asm"
INCLUDE "engine/movie/floating_island.asm"
INCLUDE "banks/bank_67.asm"

SECTION "bank69", ROMX
INCLUDE "banks/bank_69.asm"

SECTION "bank6a", ROMX
INCLUDE "banks/bank_6a.asm"

SECTION "bank6b", ROMX
INCLUDE "banks/bank_6b.asm"

SECTION "bank6b #2", ROMX
INCLUDE "banks/bank_6b_2.asm"

SECTION "bank6c", ROMX
INCLUDE "banks/bank_6c.asm"

SECTION "bank6e", ROMX
INCLUDE "banks/bank_6e.asm"

SECTION "bank6f", ROMX
INCLUDE "engine/movie/1d.asm"

SECTION "bank70", ROMX
INCLUDE "engine/movie/1e.asm"

SECTION "bank71", ROMX
INCLUDE "engine/movie/credits.asm"
INCLUDE "engine/movie/the_end.asm"

SECTION "bank76", ROMX
INCLUDE "banks/bank_76.asm"

SECTION "bank77", ROMX
INCLUDE "engine/movie/intro_vastfame.asm"
INCLUDE "engine/movie/title_screen.asm"
INCLUDE "engine/movie/intro_2.asm"

SECTION "bank7a", ROMX
INCLUDE "engine/movie/1b_1c.asm"

SECTION "bank7b", ROMX
INCLUDE "banks/bank_7b.asm"

SECTION "bank7c", ROMX
INCLUDE "banks/bank_7c.asm"

SECTION "bank7d", ROMX
INCLUDE "banks/bank_7d.asm"

SECTION "bank7e", ROMX
INCLUDE "banks/bank_7e.asm"

SECTION "bank7f", ROMX
INCLUDE "banks/bank_7f.asm"
