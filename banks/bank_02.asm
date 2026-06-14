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
	ld hl, wd657
	ld a, [hl]
	ld [hl], 0
	or a
	ld d, $ff
	jr nz, .compute
	ld d, $60
	ld a, [wd70a]
	cp $b
	jr nz, .compute
	ld d, $7c

.compute
	ld a, d
	ld [wdae0], a
	ld hl, wd656
	ld a, [hl]
	ld [hl], 0
	or a
	ret nz
	ld a, [wd70a]
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
	ld [wd658], a
	call QueueSound
	jp FlushSoundQueue

.map10
	ld a, [wd68a]
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
INCLUDE "audio/sfx/sfx_1.asm"
SoundEngine1_Waveforms:
INCLUDE "audio/wave_instruments.asm"
INCLUDE "audio/sfx/sfx_1b.asm"
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
