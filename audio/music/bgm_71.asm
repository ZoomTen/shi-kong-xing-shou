Music_Bgm71_Ch1:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	stereo_panning STEREO_LEFT
	envelope_setting $5
	volume_envelope $91
	speed 6
	fine_pitch $1
	duty_cycle DUTY_50, DUTY_50
	mark_loop ;------
	transpose -12
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 1
	rest 8
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 1
	note G#, 5
	octave 5
	note C#, 4
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 2
	rest 8
	octave 4
	note G#, 1
	note A#, 1
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 1
	note F#, 6
	rest 3
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 1
	rest 8
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 1
	note G#, 5
	octave 5
	note C#, 4
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 1
	rest 9
	note D#, 1
	note C#, 1
	octave 4
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F_, 1
	note F#, 5
	rest 4
	repeat_loop 0 ;------

Music_Bgm71_Ch2:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; volume envelope
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	speed 6
	fine_pitch $2
	volume_envelope $11
	mark_loop2 ;------
	transpose -12
	duty_cycle DUTY_25, DUTY_25
	stereo_panning $4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 1
	rest 8
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 1
	note G#, 5
	octave 5
	note C#, 4
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 2
	rest 8
	octave 4
	note G#, 1
	note A#, 1
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 1
	note F#, 6
	rest 3
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 1
	rest 8
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F#, 1
	note G#, 5
	octave 5
	note C#, 4
	octave 4
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C#, 1
	rest 9
	note D#, 1
	note C#, 1
	octave 4
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note G#, 1
	rest 1
	note F_, 1
	note F#, 5
	rest 4
	repeat_loop2 0 ;------

Music_Bgm71_Ch3:
	sound_init 7, \ ; speed
	           $5, $86, $b0 ; unknown
	stereo_panning $4
	speed 6
	transpose 0
	mark_loop ;------
	octave 1
	note F#, 1
	note F#, 1
	note F#, 1
	rest 1
	note F#, 1
	rest 9
	note F#, 2
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 3
	octave 2
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	octave 1
	note C#, 3
	rest 1
	note F#, 1
	note F#, 1
	note F#, 1
	rest 1
	note F#, 2
	rest 10
	octave 0
	note B_, 2
	octave 1
	note B_, 1
	rest 1
	note C#, 2
	octave 2
	note C#, 1
	rest 1
	octave 1
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note C#, 3
	rest 1
	note F#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	rest 7
	note F#, 4
	octave 0
	note B_, 2
	note B_, 2
	rest 4
	octave 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note G#, 3
	rest 1
	note F#, 1
	rest 1
	note F#, 1
	rest 13
	octave 0
	note B_, 2
	note B_, 2
	octave 1
	note C#, 2
	note C#, 1
	rest 1
	note F#, 3
	rest 1
	note F#, 2
	rest 2
	repeat_loop 0 ;------

Music_Bgm71_Ch4:
	sound_init 7 ; speed
	speed 6
	mark_loop ;------
	note B_, 2
	note B_, 1
	rest 5
	octave 4
	note C_, 2
	note C_, 1
	rest 5
	octave 3
	note A_, 1
	rest 1
	note A_, 1
	rest 5
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note F#, 3
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 5
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 5
	octave 3
	note A_, 1
	rest 1
	note A_, 1
	rest 5
	note G_, 3
	rest 1
	note D_, 3
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 5
	octave 4
	note C_, 1
	rest 1
	note C_, 1
	rest 5
	octave 3
	note A_, 1
	rest 1
	note A_, 1
	rest 5
	octave 4
	note D_, 2
	rest 2
	octave 3
	note D_, 3
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 5
	note G_, 1
	rest 1
	note G_, 1
	rest 5
	note A_, 1
	rest 1
	note A_, 1
	rest 5
	note B_, 3
	rest 1
	note B_, 2
	rest 2
	repeat_loop 0 ;------
	sound_end
