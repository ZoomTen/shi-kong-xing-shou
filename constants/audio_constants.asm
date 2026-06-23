; Banked sound driver entry points.
; The active driver bank is selected by wCurrentSoundBank; code banks it in
; then calls through these fixed offsets. See SoundEngine1_* (bank 02) and
; SoundEngine2_* (bank 03).
DEF SOUND_PLAY EQU $4000
DEF SOUND_LOAD EQU $4003
DEF SOUND_INIT EQU $4006
DEF SOUND_UNKNOWN EQU $4009

; pitch
	const_def 0
	const C_ ; 0
	const C# ; 1
	const D_ ; 2
	const D# ; 3
	const E_ ; 4
	const F_ ; 5
	const F# ; 6
	const G_ ; 7
	const G# ; 8
	const A_ ; 9
	const A# ; a
	const B_ ; b
	const __ ; c, rest

; channel
	const_def
	const CHAN1 ; 0
	const CHAN2 ; 1
	const CHAN3 ; 2
	const CHAN4 ; 3
DEF NUM_MUSIC_CHANS EQU const_value
	const CHAN5 ; 4
	const CHAN6 ; 5
	const CHAN7 ; 6
	const CHAN8 ; 7
DEF NUM_NOISE_CHANS EQU const_value - NUM_MUSIC_CHANS
DEF NUM_CHANNELS EQU const_value

; duty cycle values
	const_def
	const DUTY_12 ; 0
	const DUTY_25 ; 1
	const DUTY_50 ; 2
	const DUTY_75 ; 3

; stereo_panning values
	const_def
	const STEREO_ALTERNATING
	const STEREO_RIGHT
	const STEREO_LEFT
	const STEREO_CENTER

; channel_struct members (see macros/wram.asm)
DEF CHANNEL_SONG_ID                     EQUS "(wSound1Channel1SongID - wSound1Channel1)"
DEF CHANNEL_FIELD01                     EQUS "(wSound1Channel1Field01 - wSound1Channel1)"
DEF CHANNEL_SWEEP                       EQUS "(wSound1Channel1Sweep - wSound1Channel1)"
DEF CHANNEL_GLOBAL_TRANSPOSE            EQUS "(wSound1Channel1GlobalTranspose - wSound1Channel1)"
DEF CHANNEL_GLOBAL_FINE_PITCH           EQUS "(wSound1Channel1GlobalFinePitch - wSound1Channel1)"
DEF CHANNEL_GLOBAL_STEREO_PANNING       EQUS "(wSound1Channel1GlobalStereoPanning - wSound1Channel1)"
DEF CHANNEL_CURRENT_STEREO              EQUS "(wSound1Channel1CurrentStereo - wSound1Channel1)"
DEF CHANNEL_LENGTH_COUNTER              EQUS "(wSound1Channel1LengthCounter - wSound1Channel1)"
DEF CHANNEL_FIELD08                     EQUS "(wSound1Channel1Field08 - wSound1Channel1)"
DEF CHANNEL_FIELD09                     EQUS "(wSound1Channel1Field09 - wSound1Channel1)"
DEF CHANNEL_FIELD0A                     EQUS "(wSound1Channel1Field0A - wSound1Channel1)"
DEF CHANNEL_SPEED                       EQUS "(wSound1Channel1Speed - wSound1Channel1)"
DEF CHANNEL_FIELD0C                     EQUS "(wSound1Channel1Field0C - wSound1Channel1)"
DEF CHANNEL_ENVELOPE                    EQUS "(wSound1Channel1VolumeEnvelope - wSound1Channel1)"
DEF CHANNEL_VIBRATO_DELAY               EQUS "(wSound1Channel1VibratoDelay - wSound1Channel1)"
DEF CHANNEL_VIBRATO_TABLE_POINTER       EQUS "(wSound1Channel1VibratoTablePointer - wSound1Channel1)"
DEF CHANNEL_ENV_MODE                    EQUS "(wSound1Channel1EnvelopeMode - wSound1Channel1)"
DEF CHANNEL_ENV_PARAM_1                 EQUS "(wSound1Channel1EnvelopeParam1 - wSound1Channel1)"
DEF CHANNEL_ENV_PARAM_2                 EQUS "(wSound1Channel1EnvelopeParam2 - wSound1Channel1)"
DEF CHANNEL_INSTRUMENT_POINTER          EQUS "(wSound1Channel1InstrumentPointer - wSound1Channel1)"
DEF CHANNEL_INSTRUMENT_PITCH_OFFSET     EQUS "(wSound1Channel1InstrumentPitchOffset - wSound1Channel1)"
DEF CHANNEL_INSTRUMENT_VOLUME_OFFSET    EQUS "(wSound1Channel1InstrumentVolumeOffset - wSound1Channel1)"
DEF CHANNEL_FIELD18                     EQUS "(wSound1Channel1Field18 - wSound1Channel1)"
DEF CHANNEL_INSTRUMENT_UNKNOWN_OFFSET   EQUS "(wSound1Channel1InstrumentUnknownOffset - wSound1Channel1)"
DEF CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG  EQUS "(wSound1Channel1InstrumentUnknown2Retrig - wSound1Channel1)"
DEF CHANNEL_CUR_OCTAVE                  EQUS "(wSound1Channel1CurOctave - wSound1Channel1)"
DEF CHANNEL_PITCH_OFFSET                EQUS "(wSound1Channel1PitchOffset - wSound1Channel1)"
DEF CHANNEL_NOTE_FREQ                   EQUS "(wSound1Channel1NoteFreq - wSound1Channel1)"
; The envelope to use every time a note is "retriggered"
DEF CHANNEL_ENVELOPE_MODIFIER           EQUS "(wSound1Channel1EnvelopeModifier - wSound1Channel1)"
DEF CHANNEL_PLAYHEAD                    EQUS "(wSound1Channel1Playhead - wSound1Channel1)"
DEF CHANNEL_LOOP_POINT_1                EQUS "(wSound1Channel1LoopPoint1 - wSound1Channel1)"
DEF CHANNEL_LOOP_POINT_2                EQUS "(wSound1Channel1LoopPoint2 - wSound1Channel1)"
DEF CHANNEL_RETURN_POINT_1              EQUS "(wSound1Channel1ReturnPoint1 - wSound1Channel1)"
DEF CHANNEL_RETURN_POINT_2              EQUS "(wSound1Channel1ReturnPoint2 - wSound1Channel1)"
DEF CHANNEL_LOOP_COUNTER_1              EQUS "(wSound1Channel1LoopCounter1 - wSound1Channel1)"
DEF CHANNEL_LOOP_COUNTER_2              EQUS "(wSound1Channel1LoopCounter2 - wSound1Channel1)"

DEF CHANNEL_STRUCT_LENGTH EQUS "(wSound1Channel2 - wSound1Channel1)"
