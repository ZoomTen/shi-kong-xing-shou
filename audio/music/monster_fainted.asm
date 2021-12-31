
Music_MonsterFainted_Ch1:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	fine_pitch $2
	duty_cycle DUTY_50, DUTY_25
	speed 6
	mark_loop ;------
	duty_cycle DUTY_50, DUTY_50
	transpose -12
	unknown_music_e9 $91
	stereo_panning $3
	octave 3
	note D#, 4
	rest 2
	note G_, 2
	note F_, 3
	rest 1
	note D_, 4
	note D#, 15
	rest 1
	sound_end

Music_MonsterFainted_Ch2:
	sound_init 7, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; unknown 1
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 6
	fine_pitch $2
	unknown_music_e9 $91
	duty_cycle DUTY_75, 5
	mark_loop ;------
	duty_cycle DUTY_50, DUTY_50
	transpose -12
	stereo_panning $4
	octave 3
	note D#, 4
	rest 2
	note G_, 2
	note F_, 3
	rest 1
	note D_, 4
	note D#, 15
	rest 1
	sound_end

Music_MonsterFainted_Ch3:
	sound_init 7, \ ; speed
	           $2, $84, $80 ; unknown
	stereo_panning $2
	speed 6
	mark_loop ;------
	transpose 12
	octave 1
	note C_, 4
	rest 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 4
	note C_, 8
	rest 8
	sound_end

Music_MonsterFainted_Ch4:
	sound_init 6 ; speed
	speed 6
	mark_loop ;------
	rest 4
	sound_end
