INCLUDE "constants.asm"

SECTION "Audio 1", ROMX

_SoundEngine1_Play:
	jp SoundEngine1_Play

_SoundEngine1_Load:
	jp SoundEngine1_Load

_SoundEngine1_Init:
	jp SoundEngine1_Init

_PlayMapSound:
	jp PlayMapSound

MapSounds:
	db $62, $7e, $64, $5e, $65, $61, $67, $5c
	db $6c, $00, $00, $5d, $6c, $00, $ff, $00
	db $5e, $00, $59, $63, $00, $63, $6c, $ff
	db $6d, $7a, $63, $ff, $ff, $73, $ff, $63
	db $ff, $ff, $ff, $ff

MapSounds_Map10:
	db $78, $78, $79, $ff, $78

PlayMapSound: ; is this even used??
	ld hl, wSound2Channel2NoteFreq
	ld a, [hl]
	ld [hl], 0
	or a
	ld d, $ff
	jr nz, .compute
	ld d, $60
	ld a, [wSound2Channel6Playhead]
	cp $b
	jr nz, .compute
	ld d, $7c

.compute
	ld a, d
	ld [wdae0], a
	ld hl, wSound2Channel2PitchOffset
	ld a, [hl]
	ld [hl], 0
	or a
	ret nz
	ld a, [wSound2Channel6Playhead]
	cp $10
	jp z, .map10
	ld hl, MapSounds - 1
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

.play
	cp $ff
	ret z
	push af
	call SoundEngine1_Init
	call WaitSoundFlush
	pop af
	ld [wSound2Channel2NoteFreq + 1], a
	call QueueSound
	jp FlushSoundQueue

.map10
	ld a, [wSound2Channel3LoopPoint2]
	and 7
	add LOW(MapSounds_Map10)
	ld e, a
	ld a, 0
	adc HIGH(MapSounds_Map10)
	ld d, a
	ld a, [de]
	jr .play

INCLUDE "audio/headers/headers_1.asm"

	ds 30

INCLUDE "audio/engine/engine_1.asm"

SoundEngine1_NoteFrequencies:
INCLUDE "audio/notes.asm"

INCLUDE "audio/sfx/sfx_1.asm"

SoundEngine1_InstrumentPointers:
INCLUDE "audio/instruments.asm"

SoundEngine1_VibratoTables:
INCLUDE "audio/vibrato_tables.asm"

SoundEngine1_Waveforms:
INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/sfx_1b.asm"

SECTION "Music 1", ROMX

INCLUDE "audio/music/town_1.asm"
INCLUDE "audio/music/battle_1.asm"
INCLUDE "audio/music/blackout.asm"
INCLUDE "audio/music/ship.asm"
INCLUDE "audio/music/forest.asm"
INCLUDE "audio/music/town_3.asm"
INCLUDE "audio/music/battle_2.asm"
INCLUDE "audio/music/town_4.asm"
INCLUDE "audio/music/battle_3.asm"
INCLUDE "audio/music/battle_4.asm"
INCLUDE "audio/music/routes_1.asm"
INCLUDE "audio/music/stargazing.asm"

SECTION "Audio 2", ROMX

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

SECTION "Music 2", ROMX

INCLUDE "audio/music/academy.asm"
INCLUDE "audio/music/unsettling_place.asm"
INCLUDE "audio/music/town_2.asm"
INCLUDE "audio/music/racing.asm"
INCLUDE "audio/music/meteor.asm"
INCLUDE "audio/music/level_up_jingle.asm"
INCLUDE "audio/music/exp_jingle.asm"
INCLUDE "audio/music/monster_fainted.asm"

SECTION "Audio 3", ROMX

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

SECTION "Music 3", ROMX

INCLUDE "audio/music/intro.asm"
INCLUDE "audio/music/junkyard.asm"
INCLUDE "audio/music/title.asm"
INCLUDE "audio/music/airport.asm"
INCLUDE "audio/music/shop.asm"
INCLUDE "audio/music/healing_center.asm"
INCLUDE "audio/music/battle_transition.asm"
INCLUDE "audio/music/bgm_74.asm"
