Func_003_4000:
	jp SoundEngine2_Play

Func_003_4003:
	jp SoundEngine2_Load

Func_003_4006:
	jp SoundEngine2_Init

Func_003_4009:
	jp SoundEngine2_Unknown

SoundEngine2_Unknown:
	ret

INCLUDE "audio/headers/headers_2.asm"

	ds 132

INCLUDE "audio/engine/engine_2.asm"

INCLUDE "audio/sfx/sfx_2.asm"
INCLUDE "audio/music/academy.asm"
INCLUDE "audio/music/unsettling_place.asm"
INCLUDE "audio/music/town_2.asm"
INCLUDE "audio/music/racing.asm"
INCLUDE "audio/music/meteor.asm"
INCLUDE "audio/music/level_up_jingle.asm"
INCLUDE "audio/music/exp_jingle.asm"
INCLUDE "audio/music/monster_fainted.asm"

SECTION "banknum3", ROMX[$7fff], BANK[$3]
	db $3
