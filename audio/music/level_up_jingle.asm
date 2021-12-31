
Music_LevelUpJingle_Ch1:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_50, \ ; duty cycle
	           $c1, \ ; unknown 1
	           5, 2, \ ; vibrato
	           $8b, $26, $b5 ; unknown 2
	fine_pitch $2
	duty_cycle DUTY_50, DUTY_25
	speed 6
	mark_loop ;------
	transpose -12
	unknown_music_e9 $91
	stereo_panning $4
	octave 3
	note E_, 1
	rest 1
	note G#, 1
	note B_, 1
	octave 4
	note E_, 2
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	rest 1
	note G#, 1
	note B_, 1
	octave 4
	note E_, 2
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	rest 1
	note G#, 1
	note B_, 1
	octave 4
	note E_, 2
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	rest 1
	note G#, 2
	note B_, 3
	rest 1
	sound_end

Music_LevelUpJingle_Ch2:
	sound_init 6, \ ; speed
	           DUTY_50, DUTY_75, \ ; duty cycle
	           $b1, \ ; unknown 1
	           2, 4, \ ; vibrato
	           $8b, $35, $c7 ; unknown 2
	speed 6
	fine_pitch $2
	unknown_music_e9 $91
	duty_cycle DUTY_75, 5
	mark_loop ;------
	transpose -12
	stereo_panning $3
	octave 3
	note G#, 2
	note B_, 1
	octave 4
	note E_, 1
	note G#, 2
	note E_, 1
	note G#, 1
	octave 3
	note G#, 1
	rest 1
	note B_, 1
	octave 4
	note E_, 1
	note G#, 1
	rest 1
	note E_, 1
	note G#, 1
	octave 3
	note G#, 1
	rest 1
	note B_, 1
	octave 4
	note E_, 1
	note G#, 2
	note E_, 1
	note G#, 1
	octave 3
	note B_, 1
	rest 1
	octave 4
	note E_, 2
	note G#, 2
	rest 2
	sound_end

Music_LevelUpJingle_Ch3:
	sound_init 6, \ ; speed
	           $2, $84, $80 ; unknown
	stereo_panning $2
	speed 6
	mark_loop ;------
	transpose 12
	octave 1
	note E_, 2
	rest 1
	note E_, 2
	rest 1
	note E_, 2
	note E_, 2
	rest 1
	note E_, 2
	rest 1
	note E_, 2
	note E_, 2
	rest 1
	note E_, 2
	rest 1
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 3
	rest 1
	sound_end

Music_LevelUpJingle_Ch4:
	sound_init 6 ; speed
	speed 6
	mark_loop ;------
	note C#, 2
	rest 1
	note C#, 2
	rest 1
	note C#, 2
	note C#, 2
	rest 1
	note C#, 2
	rest 1
	note C#, 2
	note C#, 2
	rest 1
	note C#, 2
	rest 1
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 3
	rest 1
	sound_end
