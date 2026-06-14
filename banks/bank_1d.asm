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
INCLUDE "audio/sfx/sfx_3.asm"

	dr $76593, $77380
