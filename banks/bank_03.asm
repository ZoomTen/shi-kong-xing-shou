_SoundEngine2_Play:
	jp SoundEngine2_Play

_SoundEngine2_Load:
	jp SoundEngine2_Load

_SoundEngine2_Init:
	jp SoundEngine2_Init

_SoundEngine2_Unknown:
	jp SoundEngine2_Unknown

SoundEngine2_Unknown:
	ret

INCLUDE "audio/headers/headers_2.asm"

	ds 132

INCLUDE "audio/engine/engine_2.asm"

SoundEngine2_NoteFrequencies:
INCLUDE "audio/notes.asm"

INCLUDE "audio/sfx/sfx_2.asm"

SoundEngine2_InstrumentPointers:
INCLUDE "audio/instruments.asm"

SoundEngine2_VibratoTables:
INCLUDE "audio/vibrato_tables.asm"

SoundEngine2_Waveforms:
INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/sfx_2b.asm"

INCLUDE "audio/music/academy.asm"
INCLUDE "audio/music/unsettling_place.asm"
INCLUDE "audio/music/town_2.asm"
INCLUDE "audio/music/racing.asm"
INCLUDE "audio/music/meteor.asm"
INCLUDE "audio/music/level_up_jingle.asm"
INCLUDE "audio/music/exp_jingle.asm"
INCLUDE "audio/music/monster_fainted.asm"
