INCLUDE "constants.asm"

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

SECTION "bank08", ROMX
GotoOverworld:: ; unreferenced?
	xor a ; GAMEMODE_OVERWORLD
	ld [wTargetMode], a
	jp JumpToGameMode

SECTION "Meteor Cutscene", ROMX
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

SECTION "bank13", ROMX
INCLUDE "banks/bank_13.asm"

SECTION "bank14", ROMX
INCLUDE "banks/bank_14.asm"

SECTION "bank15", ROMX
INCLUDE "banks/bank_15.asm"

SECTION "Letter Cutscene", ROMX
INCLUDE "engine/movie/letter.asm"

SECTION "Gale Cutscene", ROMX
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
INCLUDE "engine/battle/core.asm"
INCLUDE "engine/battle/moves.asm"
INCLUDE "engine/battle/menu.asm"
INCLUDE "engine/battle/intro.asm"

SECTION "bank2c", ROMX
INCLUDE "banks/bank_2c.asm"

SECTION "bank2d", ROMX
INCLUDE "banks/bank_2d.asm"

SECTION "bank2e", ROMX
INCLUDE "engine/battle/animation.asm"

SECTION "bank2f", ROMX
INCLUDE "banks/bank_2f.asm"

SECTION "bank30", ROMX
INCLUDE "engine/battle/move_effects.asm"

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

SECTION "Game Over", ROMX
INCLUDE "engine/movie/game_over.asm"

SECTION "Cutscene 1a", ROMX
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

SECTION "Airport 2 Cutscene", ROMX
INCLUDE "engine/movie/airport2.asm"

SECTION "Mice Minigame", ROMX
INCLUDE "engine/minigame/mice.asm"

SECTION "Helen Cutscene", ROMX
INCLUDE "engine/movie/helen.asm"

SECTION "Rhythm Minigame", ROMX
INCLUDE "engine/minigame/rhythm.asm"

SECTION "bank5e", ROMX
INCLUDE "banks/bank_5e.asm"

SECTION "Racing Minigame", ROMX
INCLUDE "engine/minigame/racing.asm"

SECTION "Crystal Cutscene", ROMX
INCLUDE "engine/movie/crystal.asm"

SECTION "bank60", ROMX
INCLUDE "banks/bank_60.asm"

SECTION "Meteor 2 Cutscene", ROMX
INCLUDE "engine/movie/meteor_2.asm"

SECTION "Underwater Cutscene", ROMX
INCLUDE "engine/movie/underwater.asm"

SECTION "World Map Cutscene", ROMX
INCLUDE "engine/movie/world_map.asm"

SECTION "Sound Test", ROMX
INCLUDE "engine/debug/sound_test.asm"

SECTION "Beach", ROMX
INCLUDE "engine/movie/beach.asm"

SECTION "Floating Island", ROMX
INCLUDE "engine/movie/floating_island.asm"

SECTION "Cutscene 1d", ROMX
INCLUDE "engine/movie/1d.asm"

SECTION "Cutscene 1e", ROMX
INCLUDE "engine/movie/1e.asm"

SECTION "Credits", ROMX
INCLUDE "engine/movie/credits.asm"

SECTION "The End", ROMX
INCLUDE "engine/movie/the_end.asm"

SECTION "Intro & Title", ROMX
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
