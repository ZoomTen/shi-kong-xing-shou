Music_Intro_Ch1:
	sound_init 7, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $61, \ ; volume envelope
	           0, 0, \ ; vibrato
	           $86, $12, $85 ; unknown 2
	speed 7
	stereo_panning $4
	fine_pitch $2
	volume_envelope $81
	duty_cycle DUTY_50, DUTY_50
	mark_loop ;------
	transpose 0
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F#, 4
	note D_, 4
	octave 2
	note A_, 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F#, 4
	note D_, 4
	octave 2
	note A_, 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F#, 4
	note D_, 4
	octave 2
	note A_, 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F#, 4
	note D_, 2
	octave 2
	note A_, 4
	octave 3
	note F#, 2
	note G_, 2
	note A_, 2
	note A_, 5
	rest 1
	note A_, 2
	note F#, 2
	note A_, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 8
	note A_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note B_, 4
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 4
	note G_, 2
	note A_, 2
	note B_, 2
	note B_, 8
	note G_, 2
	note B_, 2
	note B_, 2
	octave 4
	note E_, 2
	note C#, 4
	note C#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	note A_, 10
	note F#, 2
	note G_, 2
	note A_, 2
	note A_, 10
	rest 2
	note F#, 2
	note F#, 2
	note G_, 2
	note A_, 5
	rest 1
	note A_, 2
	note F#, 2
	note A_, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 6
	note D_, 2
	note A_, 2
	note G_, 2
	note G_, 2
	note A_, 2
	note B_, 6
	note B_, 2
	note G_, 2
	note B_, 9
	rest 1
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note E_, 6
	note E_, 2
	note D_, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note E_, 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 1
	rest 1
	note E_, 2
	note D_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note D_, 4
	note F#, 9
	rest 3
	note E_, 2
	note F#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 4
	note A_, 2
	note F#, 2
	note F#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 4
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note F#, 2
	note F#, 1
	rest 1
	note F#, 2
	note F#, 8
	note G_, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	note B_, 8
	note A_, 2
	note G_, 2
	note F#, 4
	note G_, 4
	octave 4
	note D_, 5
	rest 1
	rest 4
	note D_, 2
	note C#, 4
	note D_, 2
	note E_, 4
	note D_, 8
	octave 3
	note A_, 2
	note G_, 6
	note F#, 12
	rest 4
	repeat_loop 0 ;------

Music_Intro_Ch2:
	sound_init 7, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $a1, \ ; volume envelope
	           2, 5, \ ; vibrato
	           $8a, $34, $a7 ; unknown 2
	speed 7
	stereo_panning STEREO_CENTER
	fine_pitch $2
	volume_envelope $a1
	duty_cycle DUTY_12, DUTY_12
	mark_loop ;------
	transpose -24
	envelope_setting $12
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A_, 4
	note D_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A_, 4
	note D_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	note D_, 2
	note G_, 2
	note B_, 4
	note D_, 2
	note G_, 2
	note B_, 2
	note B_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note G_, 2
	note D_, 2
	note B_, 2
	note E_, 2
	note G_, 2
	note B_, 4
	note E_, 2
	note G_, 2
	note B_, 2
	note B_, 2
	note E_, 2
	note G_, 2
	note B_, 6
	note B_, 4
	note A_, 2
	note D_, 2
	note E_, 2
	note A_, 4
	note D_, 2
	note E_, 2
	note A_, 2
	note F#, 2
	note D_, 4
	note F#, 2
	note D_, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note E_, 2
	note D_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note E_, 2
	note D_, 6
	note E_, 2
	note F#, 2
	note G_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note G_, 4
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note E_, 4
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	note B_, 4
	note A_, 2
	note F#, 2
	note G_, 2
	note A_, 4
	note F#, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note A_, 4
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note B_, 2
	note F#, 2
	note B_, 2
	note F#, 2
	note B_, 2
	note F#, 2
	note B_, 2
	note F#, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 8
	octave 3
	note A_, 4
	octave 4
	note D_, 4
	octave 3
	note A_, 2
	octave 4
	note D_, 4
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note D_, 2
	note A_, 9
	rest 1
	repeat_loop 0 ;------

Music_Intro_Ch3:
	sound_init 7, \ ; speed
	           $2, $84, $80 ; unknown
	stereo_panning STEREO_CENTER
	speed 7
	mark_loop ;------
	transpose 0
	octave 1
	note D_, 4
	rest 2
	note D_, 1
	rest 1
	note D_, 8
	note D_, 5
	rest 1
	note D_, 1
	rest 1
	note D_, 8
	note D_, 6
	note D_, 1
	rest 1
	note D_, 6
	note A_, 1
	note D_, 1
	note D_, 4
	rest 2
	note D_, 1
	rest 1
	note D_, 4
	note A_, 2
	octave 0
	note A_, 2
	octave 1
	note D_, 5
	rest 1
	note D_, 1
	rest 1
	note D_, 4
	note A_, 2
	octave 0
	note A_, 2
	octave 1
	note D_, 5
	rest 1
	note D_, 1
	rest 1
	note D_, 4
	note A_, 2
	note D_, 2
	note G_, 5
	rest 1
	note G_, 1
	rest 1
	note G_, 6
	note D_, 2
	note G_, 5
	rest 1
	note G_, 1
	rest 1
	note G_, 4
	note F#, 4
	note E_, 4
	rest 2
	note E_, 1
	rest 1
	note E_, 6
	octave 0
	note B_, 2
	octave 1
	note E_, 2
	note E_, 4
	note E_, 1
	rest 1
	note E_, 4
	note A_, 4
	note D_, 5
	rest 1
	note D_, 1
	rest 1
	note D_, 4
	note A_, 2
	octave 0
	note A_, 2
	octave 1
	note D_, 1
	rest 1
	note D_, 4
	note D_, 1
	rest 1
	note D_, 2
	note A_, 2
	octave 0
	note A_, 1
	rest 1
	note A_, 2
	octave 1
	note D_, 4
	rest 2
	note D_, 1
	rest 1
	note D_, 4
	note A_, 2
	octave 0
	note A_, 2
	octave 1
	note D_, 1
	rest 1
	note D_, 4
	note D_, 1
	rest 1
	note D_, 4
	note A_, 2
	octave 0
	note A_, 2
	octave 1
	note G_, 5
	rest 1
	note G_, 1
	rest 1
	note G_, 4
	note D_, 2
	octave 0
	note B_, 2
	octave 1
	note G_, 5
	rest 1
	note G_, 1
	rest 1
	note G_, 4
	note F#, 4
	note E_, 1
	rest 1
	note E_, 3
	rest 1
	note E_, 2
	note A_, 5
	rest 1
	note A_, 2
	note E_, 5
	rest 1
	note E_, 2
	note A_, 4
	note A_, 4
	note D_, 4
	rest 2
	note D_, 2
	note D_, 4
	octave 0
	note B_, 1
	rest 3
	octave 1
	note D_, 5
	rest 1
	note D_, 1
	rest 1
	note D_, 4
	note F#, 2
	note D_, 2
	note E_, 5
	rest 1
	note E_, 1
	rest 1
	note E_, 4
	note A_, 2
	note E_, 2
	note A_, 5
	rest 1
	note A_, 2
	note E_, 4
	octave 0
	note A_, 4
	octave 1
	note D_, 5
	rest 1
	note D_, 1
	rest 1
	note D_, 4
	note F#, 2
	note D_, 2
	octave 0
	note B_, 4
	rest 2
	note B_, 2
	octave 1
	note D_, 4
	note F#, 4
	note G_, 5
	rest 1
	note G_, 1
	rest 1
	note G_, 8
	note A_, 1
	rest 1
	note A_, 5
	rest 1
	note A_, 4
	note A_, 4
	note D_, 4
	rest 2
	note D_, 1
	rest 1
	note D_, 7
	rest 1
	note D_, 5
	rest 1
	note D_, 1
	rest 1
	note D_, 2
	note A_, 2
	note D_, 1
	rest 1
	note D_, 2
	repeat_loop 0 ;------

Music_Intro_Ch4:
	sound_init 7 ; speed
	speed 7
	mark_loop ;------
	note D#, 4
	note E_, 4
	note C#, 2
	note C#, 2
	note E_, 4
	note D#, 4
	note E_, 4
	note C#, 1
	note D#, 2
	note C#, 1
	note E_, 2
	note D_, 2
	repeat_loop 0 ;------
