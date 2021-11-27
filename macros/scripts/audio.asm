; Header commands
channel_count: MACRO
    assert (\1) <= 4 && 0 < (\1), \
    "channel_count: must not exceed maximum number of GB channels"

    db (1 << \1) - 1
ENDM

sfx_starting_channel: MACRO
    db \1
ENDM

channel: MACRO
    dw \1
ENDM

; Channel commands
note: MACRO
    dn (\1), (\2) - 1 ; pitch, length
ENDM

rest: MACRO
    note __, (\1)
ENDM

    const_def $d0

    const sound_init_cmd ; $d0

sound_init: MACRO
    assert (\1) <= 15 && 0 < (\1), \
    "sound_init: speed must not exceed 15"

    db sound_init_cmd + (\1)

    assert 0<(\2) && (\2)<=3, "sound_init: duty_cycle 1st argument between 0 - 3"
    assert 0<(\3) && (\3)<=3, "sound_init: duty_cycle 2nd argument between 0 - 3"
    dn (\2), (\3) ; duty cycle

    db (\4)
    dn (\5), (\6) ; vibrato
    db (\7), (\8), (\9) ; unknown
ENDM

    const_skip 15
    const octave_cmd ; $e0

octave: MACRO
    assert (\1) <= 7 && 0 < (\1), \
    "octave: must not exceed 7"

    db octave_cmd + (\1)
ENDM

    const_skip 7
    const duty_cycle_cmd ; $e8

duty_cycle: MACRO
    assert 0<(\1) && (\1)<=3, "duty_cycle: 1st argument between 0 - 3"
    assert 0<(\2) && (\2)<=3, "duty_cycle: 2nd argument between 0 - 3"

    db duty_cycle_cmd
    dn (\1), (\2)
ENDM

    const unknown_music_e9_cmd ; $e9

unknown_music_e9: MACRO
    db unknown_music_e9_cmd, (\1)
ENDM

    const unknown_music_ea_cmd ; $ea

unknown_music_ea: MACRO
    db unknown_music_ea_cmd, (\1)
ENDM

    const vibrato_cmd ; $eb

vibrato: MACRO
    db vibrato_cmd
    dn (\1), (\2) 
ENDM

    const transpose_cmd  ;  $ec

transpose: MACRO
    db transpose_cmd, (\1)
ENDM

    const unknown_music_ed_cmd ; $ed

unknown_music_ed: MACRO
    db unknown_music_ed_cmd, (\1)
ENDM

    const unknown_volume_cmd ; $ee

unknown_volume: MACRO
    db unknown_volume_cmd, (\1)
if (\1) > $7f
    db (\2), (\3)
endc
ENDM

    const fine_pitch_cmd ; $ef

fine_pitch: MACRO
    db fine_pitch_cmd, (\1)
ENDM

; TODO decipher the rest of these commands
    const unknown_music_f0_cmd ; $f0 xx volume only?
    const unknown_music_f1_cmd ; $f1 xx vol param 1?
    const unknown_music_f2_cmd ; $f2 xx vol param 2?
    const stereo_panning_cmd   ; $f3 xx stereo
    const unknown_music_f4_cmd ; $f4 xx yy ?
    const sound_nop_cmd        ; $f5 sound_nop
    const speed_cmd            ; $f6 xx speed
    const sound_call_cmd       ; $f7 xx yy sound_call_1
    const sound_call2_cmd      ; $f8 xx yy sound_call_2
    const sound_ret_cmd        ; $f9 sound_ret_1
    const sound_ret2_cmd       ; $fa sound_ret_2
    const mark_loop_cmd        ; $fb mark_loop_1
    const mark_loop2_cmd       ; $fc mark_loop_2
    const repeat_loop_cmd      ; $fd xx repeat_loop_1
    const repeat_loop2_cmd     ; $fe xx repeat_loop_2
    const sound_end            ; $ff ret
