_SoundEngine1_Play:
	jp SoundEngine1_Play

_SoundEngine1_Load:
	jp SoundEngine1_Load

_SoundEngine1_Init:
	jp SoundEngine1_Init

_SoundEngine1_Unknown:
	jp SoundEngine1_Unknown

unk_002_400c:
	dr $800c, $8035

SoundEngine1_Unknown:
	ld hl, wd657
	ld a, [hl]
	ld [hl], 0
	or a
	ld d, $ff
	jr nz, asm_002_404b
	ld d, $60
	ld a, [wd70a]
	cp $b
	jr nz, asm_002_404b
	ld d, $7c

asm_002_404b:
	ld a, d
	ld [wdae0], a
	ld hl, wd656
	ld a, [hl]
	ld [hl], 0
	or a
	ret nz
	ld a, [wd70a]
	cp $10
	jp z, asm_002_407d
	ld hl, $400b
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

asm_002_4069:
	cp $ff
	ret z
	push af
	call SoundEngine1_Init
	call WaitSoundFlush
	pop af
	ld [wd658], a
	call QueueSound
	jp FlushSoundQueue

asm_002_407d:
	ld a, [wd68a]
	and 7
	add $30
	ld e, a
	ld a, 0
	adc $40
	ld d, a
	ld a, [de]
	jr asm_002_4069

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
