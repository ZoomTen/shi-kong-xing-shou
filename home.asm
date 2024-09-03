INCLUDE "constants.asm"

INCLUDE "home/header.asm"

SECTION "Home", ROM0

INCLUDE "home/main_loop.asm"
INCLUDE "home/delay_frame.asm"
INCLUDE "home/copy_vram.asm"
INCLUDE "home/bank0_b.asm"
INCLUDE "home/palettes.asm"
INCLUDE "home/bank0_c.asm"
INCLUDE "home/text_menu.asm"
INCLUDE "home/load_mon_pics.asm"
INCLUDE "data/monsters/pic_pointers.asm"
INCLUDE "home/bank0_d.asm"
INCLUDE "home/text.asm"
INCLUDE "home/maps.asm"
INCLUDE "home/bank0_e.asm"
INCLUDE "home/maps_2.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/wait_lcd.asm"
INCLUDE "home/load_oam.asm"
INCLUDE "home/clear_memory.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/bank0_f.asm"
INCLUDE "home/sram.asm"
INCLUDE "home/play_sound.asm"
INCLUDE "home/bank0_g.asm"


SECTION "Debug", ROM0[$2ca4]

INCLUDE "home/debug.asm"
