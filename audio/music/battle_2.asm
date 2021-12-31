
Music_Battle2_Ch1:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; unknown 1
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 6
	fine_pitch $2
	unknown_music_e9 $a1
	duty_cycle DUTY_50, DUTY_50
	mark_loop ;------
	transpose 1
	octave 3
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 2
	note C#, 2
	note D_, 2
	note F#, 2
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note E_, 1
	note F#, 2
	note B_, 2
	note A_, 2
	note F#, 2
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 2
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note G_, 2
	octave 3
	note D_, 2
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note E_, 2
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 2
	note E_, 2
	note F#, 2
	note B_, 2
	octave 4
	note C#, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	octave 3
	note B_, 1
	octave 4
	note C#, 3
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note C#, 1
	note D_, 3
	note E_, 2
	note C#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note D_, 1
	note E_, 3
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 1
	note D_, 1
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	octave 3
	note B_, 1
	octave 4
	note C#, 3
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note C#, 1
	note D_, 3
	note E_, 2
	note D_, 2
	note E_, 2
	note F#, 1
	note E_, 1
	note D_, 2
	note E_, 1
	note D_, 1
	note C#, 2
	note D_, 1
	note C#, 1
	octave 3
	note B_, 2
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A_, 2
	note F#, 2
	note E_, 1
	rest 3
	note A_, 2
	note F#, 1
	rest 3
	note E_, 2
	note D_, 1
	rest 1
	repeat_loop 0 ;------

Music_Battle2_Ch2:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; unknown 1
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 6
	fine_pitch $2
	stereo_panning $4
	unknown_music_e9 $91
	duty_cycle DUTY_75, 5
	mark_loop ;------
	transpose -11
	octave 4
	note D_, 1
	note D_, 1
	octave 3
	note B_, 1
	rest 1
	note F#, 1
	rest 3
	octave 4
	note D_, 1
	note D_, 1
	octave 3
	note B_, 1
	rest 1
	note F#, 1
	rest 3
	octave 4
	note D_, 1
	note D_, 1
	octave 3
	note B_, 1
	rest 1
	note G_, 1
	rest 3
	octave 4
	note D_, 1
	note D_, 1
	octave 3
	note B_, 1
	rest 1
	note G_, 1
	rest 3
	note A_, 1
	note A_, 1
	note E_, 1
	rest 1
	note A_, 1
	rest 3
	note A_, 1
	note A_, 1
	note E_, 1
	rest 1
	note A_, 1
	rest 3
	note B_, 1
	note B_, 1
	rest 1
	note B_, 1
	note B_, 1
	rest 1
	note B_, 1
	note B_, 1
	rest 2
	octave 4
	note C#, 1
	rest 1
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	rest 3
	octave 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	rest 3
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note D_, 1
	rest 3
	note E_, 1
	note E_, 1
	rest 1
	note E_, 1
	note E_, 1
	rest 1
	note F#, 1
	note F#, 1
	rest 2
	note F#, 1
	rest 1
	note A_, 2
	note F#, 1
	rest 1
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note F#, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note F#, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note F#, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note F#, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note F#, 1
	note D_, 1
	octave 3
	note B_, 1
	rest 1
	octave 4
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note A_, 1
	octave 3
	note F#, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note B_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	repeat_loop 0 ;------

Music_Battle2_Ch3:
	sound_init 6, \ ; speed
	           $4, $84, $80 ; unknown
	stereo_panning $4
	speed 6
	mark_loop ;------
	transpose 13
	octave 0
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	note A_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	note A_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	octave 1
	note D_, 2
	note E_, 1
	note F#, 2
	note E_, 1
	note F#, 2
	note E_, 1
	note F#, 3
	note E_, 2
	note F#, 2
	note A_, 2
	note D_, 1
	note E_, 2
	note D_, 1
	note E_, 2
	note D_, 1
	note E_, 3
	note D_, 2
	note E_, 2
	note G_, 2
	note E_, 1
	note F#, 2
	note E_, 1
	note F#, 2
	note E_, 1
	note F#, 3
	note E_, 2
	note F#, 2
	note A_, 2
	note D_, 1
	note E_, 2
	note D_, 1
	note E_, 2
	note D_, 1
	note E_, 3
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 1
	note F#, 2
	note E_, 1
	note E_, 2
	note D_, 1
	note D_, 3
	note C#, 2
	note D_, 2
	note C#, 2
	octave 0
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	octave 1
	note D_, 2
	octave 0
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	octave 1
	note E_, 2
	octave 0
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	octave 1
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 0
	note A_, 1
	note B_, 2
	octave 1
	note A_, 1
	note B_, 2
	octave 0
	note A_, 1
	note B_, 3
	octave 1
	note A_, 2
	note B_, 2
	note A_, 2
	octave 0
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	note A_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 2
	note A_, 1
	note B_, 3
	note A_, 2
	note B_, 2
	octave 1
	note D_, 2
	note E_, 1
	note F#, 2
	note E_, 1
	note F#, 2
	note E_, 1
	note F#, 3
	note E_, 2
	note F#, 4
	repeat_loop 0 ;------

Music_Battle2_Ch4:
	sound_init 6 ; speed
	speed 6
	mark_loop ;------
	note D#, 1
	note D#, 1
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note E_, 1
	rest 1
	note D#, 2
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note D_, 1
	rest 1
	note D#, 1
	note D#, 1
	note E_, 1
	rest 1
	note D#, 1
	note D#, 1
	note E_, 1
	note E_, 1
	repeat_loop 0 ;------
