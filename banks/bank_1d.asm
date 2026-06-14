_SoundEngine3_Play:
	jp SoundEngine3_Play

_SoundEngine3_Load:
	jp SoundEngine3_Load

_SoundEngine3_Init:
	jp SoundEngine3_Init

_SoundEngine3_Unknown:
	jp SoundEngine3_Unknown

SoundEngine3_Unknown:
	ret

INCLUDE "audio/headers/headers_3.asm"

	ds 98

INCLUDE "audio/engine/engine_3.asm"

SoundEngine3_NoteFrequencies:
INCLUDE "audio/notes.asm"

INCLUDE "audio/sfx/sfx_3.asm"

SoundEngine3_InstrumentPointers:
INCLUDE "audio/instruments.asm"

SoundEngine3_VibratoTables:
INCLUDE "audio/vibrato_tables.asm"

SoundEngine3_Waveforms:
INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/sfx_3b.asm"

INCLUDE "audio/music/intro.asm"
INCLUDE "audio/music/junkyard.asm"
INCLUDE "audio/music/title.asm"
INCLUDE "audio/music/airport.asm"
INCLUDE "audio/music/shop.asm"
INCLUDE "audio/music/healing_center.asm"
INCLUDE "audio/music/battle_transition.asm"
INCLUDE "audio/music/bgm_74.asm"
