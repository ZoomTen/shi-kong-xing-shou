unk_002_4ecc:
	sound_end

unk_002_4ecd:
	sound_init 1 ; speed
	note C_, 0
	note A_, 0
	note G#, 9
	note C#, 1
	note G#, 1
	octave 0
	note C#, 5
	sound_end

unk_002_4ed6:
	sound_init 2 ; speed
	note C_, 0
	note A#, 0
	note G#, 10
	note D#, 1
	retrigger $e0, $1e
	sound_end

unk_002_4edf:
	sound_init 1 ; speed
	note C_, 0
	note A_, 0
	note G#, 9
	note C#, 1
	note B_, 1
	octave 1
	note B_, 7
	sound_end

unk_002_4ee8:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 3
	note F_, 1
	note D_, 1
	octave 2
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	octave 1
	note B_, 1
	note G#, 1
	sound_end

unk_002_4ef7:
	sound_init 1 ; speed
	note C#, 1
	note C_, 0
	note C_, 9
	octave 5
	note D#, 2
	envelope_setting $6
	note D#, 1
	envelope_setting $2
	note D#, 1
	sound_end

unk_002_4f04:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 4
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f21:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 4
	note D#, 1
	note C_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f3c:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f54:
	sound_init 1, \ ; speed
	           $10, $e ; waveform, envelope mode
	octave 3
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 0
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_end

unk_002_4f6a:
	sound_init 7, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $90, \ ; volume envelope
	           0, 10, \ ; vibrato
	           $e5, $4, $14 ; envelope mode, params
	note D_, 4
	note D#, 4
	note E_, 4
	note F_, 4
	note F#, 4
	note G_, 4
	sound_end

unk_002_4f78:
	sound_end
