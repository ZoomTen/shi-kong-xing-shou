; BattleAnim VM (bank 23). anim_NN = state NN + operands.
; Pointer states (5/8/9/14/24/35/71/72) take a dw pointer (bank 2e delta/scroll table,
; or GFX src in the bank from operand 1 for anim_14).

	const_def
	const banim_00 ; state 0
MACRO anim_00
	db banim_00
ENDM
	const banim_01 ; state 1
MACRO anim_01
	db banim_01
ENDM
	const banim_02 ; state 2
MACRO anim_02
	db banim_02
	db \1
	db \2
	db \3
	db \4
	db \5
ENDM
	const banim_03 ; state 3
MACRO anim_03
	db banim_03
ENDM
	const banim_04 ; state 4
MACRO anim_04
	db banim_04
	db \1
	db \2
	db \3
	db \4
	db \5
ENDM
	const banim_05 ; state 5
MACRO anim_05
	db banim_05
	db \1
	db \2
	dw \3
ENDM
	const banim_06 ; state 6
MACRO anim_06
	db banim_06
	db \1
	db \2
ENDM
	const banim_07 ; state 7
MACRO anim_07
	db banim_07
	db \1
	db \2
ENDM
	const banim_08 ; state 8
MACRO anim_08
	db banim_08
	dw \1
ENDM
	const banim_09 ; state 9
MACRO anim_09
	db banim_09
	db \1
	db \2
	db \3
	dw \4
ENDM
	const banim_10 ; state 10
MACRO anim_10
	db banim_10
	db \1
ENDM
	const banim_11 ; state 11
MACRO anim_11
	db banim_11
	db \1
	db \2
	db \3
	db \4
ENDM
	const banim_12 ; state 12
MACRO anim_12
	db banim_12
ENDM
	const banim_13 ; state 13
MACRO anim_13
	db banim_13
ENDM
	const banim_14 ; state 14
MACRO anim_14
	db banim_14
	db \1
	dw \2
ENDM
	const banim_15 ; state 15
	const banim_16 ; state 16
MACRO anim_16
	db banim_16
ENDM
	const banim_17 ; state 17
MACRO anim_17
	db banim_17
	db \1
	db \2
ENDM
	const banim_18 ; state 18
MACRO anim_18
	db banim_18
	db \1
	db \2
ENDM
	const banim_19 ; state 19
MACRO anim_19
	db banim_19
ENDM
	const banim_20 ; state 20
MACRO anim_20
	db banim_20
ENDM
	const banim_21 ; state 21
MACRO anim_21
	db banim_21
ENDM
	const banim_22 ; state 22
MACRO anim_22
	db banim_22
ENDM
	const banim_23 ; state 23
MACRO anim_23
	db banim_23
	db \1
ENDM
	const banim_24 ; state 24
MACRO anim_24
	db banim_24
	dw \1
ENDM
	const banim_25 ; state 25
MACRO anim_25
	db banim_25
	db \1
ENDM
	const banim_26 ; state 26
MACRO anim_26
	db banim_26
	db \1
ENDM
	const banim_27 ; state 27
MACRO anim_27
	db banim_27
	db \1
	db \2
ENDM
	const banim_28 ; state 28
MACRO anim_28
	db banim_28
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	db \7
ENDM
	const banim_29 ; state 29
MACRO anim_29
	db banim_29
	db \1
ENDM
	const banim_30 ; state 30
MACRO anim_30
	db banim_30
	db \1
ENDM
	const banim_31 ; state 31
MACRO anim_31
	db banim_31
ENDM
	const banim_32 ; state 32
MACRO anim_32
	db banim_32
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	db \7
ENDM
	const banim_33 ; state 33
MACRO anim_33
	db banim_33
ENDM
	const banim_34 ; state 34
MACRO anim_34
	db banim_34
ENDM
	const banim_35 ; state 35
MACRO anim_35
	db banim_35
	dw \1
ENDM
	const banim_36 ; state 36
MACRO anim_36
	db banim_36
ENDM
	const banim_37 ; state 37
MACRO anim_37
	db banim_37
ENDM
	const banim_38 ; state 38
MACRO anim_38
	db banim_38
ENDM
	const banim_39 ; state 39
MACRO anim_39
	db banim_39
ENDM
	const banim_40 ; state 40
MACRO anim_40
	db banim_40
	db \1
	db \2
ENDM
	const banim_41 ; state 41
MACRO anim_41
	db banim_41
ENDM
	const banim_42 ; state 42
MACRO anim_42
	db banim_42
ENDM
	const banim_43 ; state 43
MACRO anim_43
	db banim_43
ENDM
	const banim_44 ; state 44
MACRO anim_44
	db banim_44
ENDM
	const banim_45 ; state 45
MACRO anim_45
	db banim_45
ENDM
	const banim_46 ; state 46
MACRO anim_46
	db banim_46
ENDM
	const banim_47 ; state 47
MACRO anim_47
	db banim_47
ENDM
	const banim_48 ; state 48
MACRO anim_48
	db banim_48
	db \1
ENDM
	const banim_49 ; state 49
MACRO anim_49
	db banim_49
ENDM
	const banim_50 ; state 50
MACRO anim_50
	db banim_50
ENDM
	const banim_51 ; state 51
MACRO anim_51
	db banim_51
	db \1
ENDM
	const banim_52 ; state 52
MACRO anim_52
	db banim_52
ENDM
	const banim_53 ; state 53
MACRO anim_53
	db banim_53
ENDM
	const banim_54 ; state 54
MACRO anim_54
	db banim_54
ENDM
	const banim_55 ; state 55
MACRO anim_55
	db banim_55
ENDM
	const banim_56 ; state 56
MACRO anim_56
	db banim_56
	db \1
ENDM
	const banim_57 ; state 57
MACRO anim_57
	db banim_57
ENDM
	const banim_58 ; state 58
MACRO anim_58
	db banim_58
ENDM
	const banim_59 ; state 59
	const banim_60 ; state 60
MACRO anim_60
	db banim_60
ENDM
	const banim_61 ; state 61
	const banim_62 ; state 62
MACRO anim_62
	db banim_62
	db \1
	db \2
ENDM
	const banim_63 ; state 63
MACRO anim_63
	db banim_63
	db \1
	db \2
ENDM
	const banim_64 ; state 64
MACRO anim_64
	db banim_64
ENDM
	const banim_65 ; state 65
MACRO anim_65
	db banim_65
	db \1
ENDM
	const banim_66 ; state 66
MACRO anim_66
	db banim_66
	db \1
ENDM
	const banim_67 ; state 67
	const banim_68 ; state 68
	const banim_69 ; state 69
MACRO anim_69
	db banim_69
	db \1
	db \2
ENDM
	const banim_70 ; state 70
MACRO anim_70
	db banim_70
	db \1
	db \2
ENDM
	const banim_71 ; state 71
MACRO anim_71
	db banim_71
	db \1
	dw \2
ENDM
	const banim_72 ; state 72
MACRO anim_72
	db banim_72
	db \1
	dw \2
ENDM
	const banim_73 ; state 73
MACRO anim_73
	db banim_73
ENDM
	const banim_74 ; state 74
MACRO anim_74
	db banim_74
ENDM
	const banim_75 ; state 75
MACRO anim_75
	db banim_75
ENDM
	const banim_76 ; state 76
MACRO anim_76
	db banim_76
ENDM
	const banim_77 ; state 77
MACRO anim_77
	db banim_77
ENDM
	const banim_78 ; state 78
MACRO anim_78
	db banim_78
ENDM
	const banim_79 ; state 79
MACRO anim_79
	db banim_79
ENDM
	const banim_80 ; state 80
MACRO anim_80
	db banim_80
	db \1
ENDM
