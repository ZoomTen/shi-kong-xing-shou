
Music_Ship_Ch1:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $61, \ ; unknown 1
	           0, 0, \ ; vibrato
	           $86, $12, $85 ; unknown 2
	speed 7
	stereo_panning $4
	fine_pitch $2
	unknown_music_e9 $a1
	duty_cycle DUTY_50, DUTY_50
	mark_loop ;------
	transpose 0
	octave 3
	note F_, 2
	octave 4
	note E_, 1
	note F_, 1
	note E_, 6
	note D_, 2
	note C_, 2
	octave 3
	note A_, 2
	note A#, 2
	note A_, 1
	note A#, 1
	octave 4
	note F_, 8
	note C_, 2
	octave 3
	note A_, 2
	note A#, 2
	note A_, 1
	note A#, 1
	octave 4
	note G_, 6
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 8
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 1
	note F_, 1
	note E_, 6
	note D_, 2
	note C_, 2
	octave 3
	note A_, 2
	note A#, 2
	note A_, 1
	note A#, 1
	octave 4
	note F_, 6
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	note G_, 1
	note A_, 1
	note A#, 6
	note A_, 2
	note G_, 2
	note F_, 2
	note F_, 6
	note G_, 1
	note F_, 1
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 6
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note E_, 6
	note E_, 2
	note F_, 4
	note G_, 4
	note F_, 6
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note E_, 4
	note F_, 2
	note G_, 6
	note E_, 2
	note C_, 2
	note F_, 2
	note E_, 1
	note F_, 1
	note E_, 6
	note D_, 2
	note C_, 2
	octave 3
	note A_, 2
	note A#, 2
	note A_, 1
	note A#, 1
	octave 4
	note D_, 6
	note D_, 2
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 1
	note G_, 1
	note F_, 6
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 4
	note A_, 4
	note G_, 2
	note F_, 2
	note C_, 2
	repeat_loop 0 ;------

Music_Ship_Ch2:
	sound_init 6, \ ; speed
	           DUTY_25, DUTY_12, \ ; duty cycle
	           $a1, \ ; unknown 1
	           2, 5, \ ; vibrato
	           $8a, $34, $a7 ; unknown 2
	speed 7
	stereo_panning STEREO_CENTER
	fine_pitch $2
	unknown_music_e9 $a1
	duty_cycle DUTY_12, DUTY_12
	mark_loop ;------
	transpose -24
	octave 3
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	note G_, 1
	rest 1
	octave 4
	note F_, 1
	note G_, 1
	note F_, 1
	rest 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 3
	note A_, 1
	note A#, 1
	rest 1
	note A_, 1
	note A#, 1
	note A_, 1
	rest 1
	note G_, 1
	note F_, 1
	note G_, 1
	rest 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	rest 1
	note F_, 1
	note G_, 1
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	note A#, 1
	rest 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	note A_, 1
	note G_, 1
	rest 1
	note A_, 1
	octave 4
	note C_, 1
	note D_, 1
	rest 1
	note C_, 1
	note D_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	rest 1
	note C_, 1
	note D_, 1
	note F_, 1
	rest 1
	note E_, 1
	note D_, 1
	rest 2
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	note G_, 1
	note F_, 1
	rest 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	rest 1
	note E_, 1
	note F_, 1
	note E_, 1
	rest 1
	note D_, 1
	note E_, 1
	note D_, 1
	rest 1
	note C_, 1
	note D_, 1
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	note G_, 1
	rest 1
	note F_, 1
	note G_, 1
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	rest 1
	note E_, 1
	note F_, 1
	note E_, 1
	rest 1
	note D_, 1
	note E_, 1
	note D_, 1
	rest 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	rest 1
	note G_, 1
	note A_, 1
	note A#, 1
	rest 1
	note A_, 1
	note A#, 1
	note A_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 1
	note G_, 1
	note A_, 1
	rest 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	rest 1
	note C_, 1
	note D_, 1
	note F_, 1
	rest 1
	note D_, 1
	note F_, 1
	note G_, 1
	rest 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	rest 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	repeat_loop 0 ;------

Music_Ship_Ch3:
	sound_init 6, \ ; speed
	           $4, $84, $80 ; unknown
	stereo_panning STEREO_CENTER
	speed 7
	mark_loop ;------
	transpose 0
	octave 1
	note F_, 2
	rest 1
	note F_, 1
	note C_, 2
	note F_, 3
	rest 1
	note F_, 2
	note C_, 2
	note F_, 2
	note G_, 2
	rest 1
	note G_, 1
	note D_, 2
	note G_, 3
	rest 1
	note G_, 2
	note D_, 2
	note G_, 2
	note A#, 2
	rest 1
	note A#, 1
	note G_, 2
	note A#, 4
	note A#, 2
	note G_, 2
	note D_, 2
	note F_, 2
	rest 1
	note F_, 1
	note C_, 2
	note F_, 3
	rest 1
	note G_, 2
	note A_, 2
	note C_, 2
	note D_, 2
	rest 1
	note D_, 1
	note F_, 2
	note A_, 4
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	note F_, 2
	note A#, 2
	rest 1
	note A#, 1
	note F_, 2
	rest 1
	note F_, 1
	note D_, 2
	rest 1
	note D_, 1
	octave 0
	note A#, 2
	octave 1
	note D_, 2
	note C_, 2
	rest 1
	note C_, 1
	note E_, 2
	note C_, 3
	rest 1
	note C_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	rest 1
	note C_, 1
	note E_, 2
	note C_, 4
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	rest 1
	note F_, 1
	note C_, 2
	note F_, 3
	rest 1
	note F_, 2
	note C_, 2
	note F_, 2
	note A_, 2
	rest 1
	note A_, 1
	note E_, 2
	note A_, 3
	rest 1
	note A_, 2
	note E_, 2
	note C_, 2
	octave 0
	note A#, 2
	rest 1
	note A#, 1
	octave 1
	note D_, 2
	octave 0
	note A#, 3
	rest 1
	octave 1
	note F_, 2
	note A#, 2
	note F_, 2
	note C_, 2
	rest 1
	note C_, 1
	note G_, 2
	note C_, 4
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note C_, 2
	note F_, 2
	rest 1
	note F_, 1
	note C_, 2
	note F_, 4
	note F_, 2
	octave 2
	note C_, 2
	octave 1
	note F_, 2
	octave 0
	note A#, 2
	rest 1
	note A#, 1
	octave 1
	note D_, 2
	octave 0
	note A#, 3
	rest 1
	octave 1
	note D_, 1
	note F_, 1
	note A#, 1
	note F_, 1
	octave 0
	note A#, 2
	octave 1
	note C_, 2
	rest 1
	note C_, 1
	note C_, 1
	rest 1
	note C_, 4
	note C_, 2
	note G_, 2
	note C_, 2
	note F_, 2
	rest 1
	note F_, 1
	octave 2
	note C_, 2
	octave 1
	note F_, 2
	rest 2
	note C_, 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 1
	note C_, 2
	repeat_loop 0 ;------

Music_Ship_Ch4:
	sound_init 6 ; speed
	speed 7
	mark_loop ;------
	note D#, 2
	rest 1
	note D#, 1
	note E_, 2
	note D#, 2
	rest 1
	note D#, 1
	note D#, 2
	note E_, 2
	rest 2
	note D#, 2
	rest 1
	note D#, 1
	note E_, 2
	note D#, 2
	rest 1
	note D#, 1
	note D#, 2
	note E_, 1
	note D#, 1
	note D#, 2
	note D#, 2
	rest 1
	note D#, 1
	note E_, 2
	note D#, 3
	rest 1
	note D#, 2
	note E_, 1
	rest 1
	note D#, 1
	rest 1
	note D#, 2
	rest 1
	note D#, 1
	note E_, 2
	note D#, 1
	rest 3
	note D#, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D#, 1
	rest 1
	repeat_loop 0 ;------
