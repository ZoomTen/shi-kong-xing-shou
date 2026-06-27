; Level-up learnsets, indexed by species via Learnset_Pointers.
MACRO levelup_move ; level, move
	db \1, \2
ENDM
	dw Learnset_Default
	dw Learnset_Default
	dw Learnset_42a4
	dw Learnset_42bf
	dw Learnset_42dc
	dw Learnset_42f9
	dw Learnset_4314
	dw Learnset_4333
	dw Learnset_434e
	dw Learnset_436b
	dw Learnset_4386
	dw Learnset_439f
	dw Learnset_43ba
	dw Learnset_43d5
	dw Learnset_43f0
	dw Learnset_440b
	dw Learnset_4426
	dw Learnset_443f
	dw Learnset_4460
	dw Learnset_4479
	dw Learnset_4492
	dw Learnset_44b1
	dw Learnset_44ce
	dw Learnset_44e7
	dw Learnset_4508
	dw Learnset_4521
	dw Learnset_453e
	dw Learnset_4555
	dw Learnset_456c
	dw Learnset_458b
	dw Learnset_45a2
	dw Learnset_45bd
	dw Learnset_45da
	dw Learnset_45f1
	dw Learnset_460e
	dw Learnset_462b
	dw Learnset_4644
	dw Learnset_465f
	dw Learnset_467c
	dw Learnset_4695
	dw Learnset_46b0
	dw Learnset_46cd
	dw Learnset_46ec
	dw Learnset_470d
	dw Learnset_4724
	dw Learnset_473f
	dw Learnset_4758
	dw Learnset_476d
	dw Learnset_4786
	dw Learnset_479f
	dw Learnset_47b8
	dw Learnset_47d1
	dw Learnset_47e8
	dw Learnset_47ff
	dw Learnset_4816
	dw Learnset_482d
	dw Learnset_4846
	dw Learnset_4865
	dw Learnset_487a
	dw Learnset_4899
	dw Learnset_48b2
	dw Learnset_48cd
	dw Learnset_48ea
	dw Learnset_48ff
	dw Learnset_491c
	dw Learnset_493d
	dw Learnset_4954
	dw Learnset_496f
	dw Learnset_4988
	dw Learnset_49a3
	dw Learnset_49ba
	dw Learnset_49d1
	dw Learnset_49ea
	dw Learnset_4a09
	dw Learnset_4a26
	dw Learnset_4a3d
	dw Learnset_4a58
	dw Learnset_4a73
	dw Learnset_4a90
	dw Learnset_4aaf
	dw Learnset_4acc
	dw Learnset_4ae3
	dw Learnset_4afe
	dw Learnset_4b15
	dw Learnset_4b2c
	dw Learnset_4b45
	dw Learnset_4b62
	dw Learnset_4b7d
	dw Learnset_4b9c
	dw Learnset_4bb3
	dw Learnset_4bce
	dw Learnset_4be5
	dw Learnset_4bfe
	dw Learnset_4c19
	dw Learnset_4c32
	dw Learnset_4c4b
	dw Learnset_4c68
	dw Learnset_4c81
	dw Learnset_4ca2
	dw Learnset_4cb9
	dw Learnset_4cd2
	dw Learnset_4ce7
	dw Learnset_4d02
	dw Learnset_4d1f
	dw Learnset_4d36
	dw Learnset_4d51
	dw Learnset_4d6e
	dw Learnset_4d89
	dw Learnset_4da8
	dw Learnset_4dc1
	dw Learnset_4dd8
	dw Learnset_4df3
	dw Learnset_4e12
	dw Learnset_4e2d
	dw Learnset_4e46
	dw Learnset_4e5d
	dw Learnset_4e76
	dw Learnset_4e8f
	dw Learnset_4eb0
	dw Learnset_4ecf
	dw Learnset_4ee6
	dw Learnset_4f03
	dw Learnset_4f1c
	dw Learnset_4f35
	dw Learnset_4f4c
	dw Learnset_4f65
	dw Learnset_4f7a
	dw Learnset_4f93
	dw Learnset_4fae
	dw Learnset_4fcb
	dw Learnset_4fe2
	dw Learnset_4ff9
	dw Learnset_5012
	dw Learnset_502f
	dw Learnset_5048
	dw Learnset_5067
	dw Learnset_5086
	dw Learnset_509f
	dw Learnset_50bc
	dw Learnset_50bf
	dw Learnset_50de
	dw Learnset_50fb
	dw Learnset_5114
	dw Learnset_512b
	dw Learnset_5142
	dw Learnset_515f
	dw Learnset_5178
	dw Learnset_5195
	dw Learnset_51ac
	dw Learnset_51c5
	dw Learnset_51e4
	dw Learnset_51fd
	dw Learnset_521b
	dw Learnset_5234
	dw Learnset_5235
	dw Learnset_524c
	dw Learnset_525d
	dw Learnset_5272
	dw Learnset_5283
	dw Learnset_529a
Learnset_Default:: ; species 000,001 
	levelup_move 4, MOVE_043
	levelup_move 7, MOVE_037
	levelup_move 15, MOVE_026
	levelup_move 20, MOVE_056
	levelup_move 25, MOVE_025
	levelup_move 30, MOVE_051
	levelup_move 33, MOVE_053
	levelup_move 37, MOVE_061
	levelup_move 41, MOVE_057
	levelup_move 45, MOVE_125
	levelup_move 49, MOVE_058
	levelup_move 54, MOVE_062
	levelup_move 59, MOVE_131
	db $ff
Learnset_42a4:: ; species 002 綠巨人
	levelup_move 5, MOVE_003
	levelup_move 8, MOVE_041
	levelup_move 11, MOVE_057
	levelup_move 15, MOVE_039
	levelup_move 20, MOVE_013
	levelup_move 26, MOVE_062
	levelup_move 33, MOVE_058
	levelup_move 36, MOVE_054
	levelup_move 40, MOVE_135
	levelup_move 44, MOVE_055
	levelup_move 48, MOVE_063
	levelup_move 53, MOVE_086
	levelup_move 57, MOVE_020
	db $ff
Learnset_42bf:: ; species 003 鐵拳蛙
	levelup_move 4, MOVE_019
	levelup_move 7, MOVE_026
	levelup_move 11, MOVE_023
	levelup_move 16, MOVE_049
	levelup_move 20, MOVE_055
	levelup_move 24, MOVE_029
	levelup_move 30, MOVE_040
	levelup_move 33, MOVE_057
	levelup_move 35, MOVE_060
	levelup_move 37, MOVE_139
	levelup_move 40, MOVE_063
	levelup_move 46, MOVE_048
	levelup_move 53, MOVE_014
	levelup_move 60, MOVE_077
	db $ff
Learnset_42dc:: ; species 004 橡皮管
	levelup_move 7, MOVE_031
	levelup_move 10, MOVE_043
	levelup_move 14, MOVE_032
	levelup_move 19, MOVE_007
	levelup_move 24, MOVE_021
	levelup_move 28, MOVE_052
	levelup_move 30, MOVE_045
	levelup_move 32, MOVE_034
	levelup_move 33, MOVE_006
	levelup_move 35, MOVE_062
	levelup_move 40, MOVE_053
	levelup_move 45, MOVE_022
	levelup_move 52, MOVE_058
	levelup_move 59, MOVE_054
	db $ff
Learnset_42f9:: ; species 005 金剛獸
	levelup_move 4, MOVE_008
	levelup_move 7, MOVE_013
	levelup_move 12, MOVE_035
	levelup_move 18, MOVE_041
	levelup_move 21, MOVE_045
	levelup_move 27, MOVE_006
	levelup_move 30, MOVE_054
	levelup_move 35, MOVE_023
	levelup_move 36, MOVE_042
	levelup_move 42, MOVE_046
	levelup_move 47, MOVE_049
	levelup_move 55, MOVE_063
	levelup_move 61, MOVE_048
	db $ff
Learnset_4314:: ; species 006 粉紅娘
	levelup_move 4, MOVE_019
	levelup_move 6, MOVE_031
	levelup_move 9, MOVE_050
	levelup_move 12, MOVE_011
	levelup_move 15, MOVE_059
	levelup_move 20, MOVE_040
	levelup_move 24, MOVE_060
	levelup_move 29, MOVE_061
	levelup_move 30, MOVE_036
	levelup_move 33, MOVE_053
	levelup_move 38, MOVE_054
	levelup_move 42, MOVE_018
	levelup_move 48, MOVE_032
	levelup_move 56, MOVE_063
	levelup_move 60, MOVE_136
	db $ff
Learnset_4333:: ; species 007 青草精
	levelup_move 4, MOVE_011
	levelup_move 10, MOVE_008
	levelup_move 14, MOVE_049
	levelup_move 18, MOVE_037
	levelup_move 19, MOVE_003
	levelup_move 24, MOVE_013
	levelup_move 25, MOVE_025
	levelup_move 30, MOVE_041
	levelup_move 39, MOVE_053
	levelup_move 42, MOVE_131
	levelup_move 48, MOVE_056
	levelup_move 54, MOVE_053
	levelup_move 59, MOVE_098
	db $ff
Learnset_434e:: ; species 008 怪笑爺
	levelup_move 3, MOVE_019
	levelup_move 8, MOVE_021
	levelup_move 11, MOVE_039
	levelup_move 14, MOVE_016
	levelup_move 17, MOVE_054
	levelup_move 18, MOVE_038
	levelup_move 25, MOVE_015
	levelup_move 29, MOVE_029
	levelup_move 34, MOVE_057
	levelup_move 40, MOVE_062
	levelup_move 45, MOVE_014
	levelup_move 49, MOVE_001
	levelup_move 54, MOVE_053
	levelup_move 59, MOVE_020
	db $ff
Learnset_436b:: ; species 009 機甲人
	levelup_move 5, MOVE_037
	levelup_move 10, MOVE_055
	levelup_move 14, MOVE_019
	levelup_move 16, MOVE_031
	levelup_move 20, MOVE_039
	levelup_move 25, MOVE_052
	levelup_move 31, MOVE_012
	levelup_move 34, MOVE_042
	levelup_move 41, MOVE_020
	levelup_move 46, MOVE_059
	levelup_move 52, MOVE_084
	levelup_move 56, MOVE_006
	levelup_move 61, MOVE_053
	db $ff
Learnset_4386:: ; species 010 長毛
	levelup_move 8, MOVE_002
	levelup_move 10, MOVE_011
	levelup_move 13, MOVE_049
	levelup_move 18, MOVE_029
	levelup_move 25, MOVE_032
	levelup_move 29, MOVE_013
	levelup_move 30, MOVE_015
	levelup_move 38, MOVE_010
	levelup_move 43, MOVE_014
	levelup_move 47, MOVE_022
	levelup_move 52, MOVE_057
	levelup_move 58, MOVE_062
	db $ff
Learnset_439f:: ; species 011 紅豬
	levelup_move 4, MOVE_037
	levelup_move 7, MOVE_028
	levelup_move 8, MOVE_019
	levelup_move 10, MOVE_023
	levelup_move 11, MOVE_033
	levelup_move 21, MOVE_041
	levelup_move 29, MOVE_065
	levelup_move 35, MOVE_138
	levelup_move 42, MOVE_067
	levelup_move 46, MOVE_064
	levelup_move 50, MOVE_066
	levelup_move 55, MOVE_069
	levelup_move 60, MOVE_131
	db $ff
Learnset_43ba:: ; species 012 火鳳凰
	levelup_move 6, MOVE_019
	levelup_move 11, MOVE_064
	levelup_move 16, MOVE_030
	levelup_move 20, MOVE_008
	levelup_move 24, MOVE_065
	levelup_move 31, MOVE_006
	levelup_move 35, MOVE_067
	levelup_move 40, MOVE_070
	levelup_move 43, MOVE_138
	levelup_move 47, MOVE_066
	levelup_move 51, MOVE_068
	levelup_move 55, MOVE_122
	levelup_move 57, MOVE_123
	db $ff
Learnset_43d5:: ; species 013 赤鍊
	levelup_move 10, MOVE_012
	levelup_move 16, MOVE_021
	levelup_move 18, MOVE_065
	levelup_move 21, MOVE_025
	levelup_move 25, MOVE_010
	levelup_move 28, MOVE_004
	levelup_move 32, MOVE_002
	levelup_move 37, MOVE_006
	levelup_move 41, MOVE_070
	levelup_move 43, MOVE_069
	levelup_move 48, MOVE_064
	levelup_move 55, MOVE_067
	levelup_move 61, MOVE_126
	db $ff
Learnset_43f0:: ; species 014 噴火龍
	levelup_move 3, MOVE_014
	levelup_move 8, MOVE_024
	levelup_move 14, MOVE_015
	levelup_move 17, MOVE_064
	levelup_move 24, MOVE_019
	levelup_move 29, MOVE_003
	levelup_move 35, MOVE_065
	levelup_move 39, MOVE_066
	levelup_move 40, MOVE_005
	levelup_move 44, MOVE_067
	levelup_move 50, MOVE_068
	levelup_move 55, MOVE_069
	levelup_move 61, MOVE_070
	db $ff
Learnset_440b:: ; species 015 熔岩獸
	levelup_move 4, MOVE_012
	levelup_move 10, MOVE_048
	levelup_move 15, MOVE_065
	levelup_move 18, MOVE_003
	levelup_move 21, MOVE_125
	levelup_move 24, MOVE_032
	levelup_move 28, MOVE_027
	levelup_move 32, MOVE_131
	levelup_move 41, MOVE_069
	levelup_move 42, MOVE_034
	levelup_move 46, MOVE_064
	levelup_move 52, MOVE_066
	levelup_move 61, MOVE_067
	db $ff
Learnset_4426:: ; species 016 赤火狐
	levelup_move 8, MOVE_005
	levelup_move 12, MOVE_011
	levelup_move 15, MOVE_003
	levelup_move 24, MOVE_033
	levelup_move 28, MOVE_036
	levelup_move 30, MOVE_064
	levelup_move 37, MOVE_127
	levelup_move 40, MOVE_132
	levelup_move 45, MOVE_065
	levelup_move 50, MOVE_066
	levelup_move 56, MOVE_067
	levelup_move 62, MOVE_070
	db $ff
Learnset_443f:: ; species 017 燭妖
	levelup_move 5, MOVE_011
	levelup_move 7, MOVE_025
	levelup_move 10, MOVE_035
	levelup_move 13, MOVE_004
	levelup_move 19, MOVE_064
	levelup_move 22, MOVE_005
	levelup_move 24, MOVE_065
	levelup_move 26, MOVE_036
	levelup_move 29, MOVE_002
	levelup_move 34, MOVE_048
	levelup_move 40, MOVE_066
	levelup_move 41, MOVE_067
	levelup_move 43, MOVE_134
	levelup_move 49, MOVE_069
	levelup_move 55, MOVE_070
	levelup_move 60, MOVE_138
	db $ff
Learnset_4460:: ; species 018 焱爐妖
	levelup_move 5, MOVE_019
	levelup_move 10, MOVE_064
	levelup_move 13, MOVE_013
	levelup_move 17, MOVE_029
	levelup_move 19, MOVE_065
	levelup_move 25, MOVE_041
	levelup_move 30, MOVE_138
	levelup_move 34, MOVE_067
	levelup_move 42, MOVE_070
	levelup_move 46, MOVE_066
	levelup_move 51, MOVE_069
	levelup_move 57, MOVE_127
	db $ff
Learnset_4479:: ; species 019 日輪
	levelup_move 5, MOVE_037
	levelup_move 10, MOVE_064
	levelup_move 14, MOVE_017
	levelup_move 18, MOVE_065
	levelup_move 21, MOVE_032
	levelup_move 24, MOVE_128
	levelup_move 29, MOVE_024
	levelup_move 33, MOVE_069
	levelup_move 40, MOVE_020
	levelup_move 47, MOVE_066
	levelup_move 53, MOVE_067
	levelup_move 59, MOVE_070
	db $ff
Learnset_4492:: ; species 020 火眼狼
	levelup_move 7, MOVE_044
	levelup_move 10, MOVE_037
	levelup_move 15, MOVE_031
	levelup_move 19, MOVE_039
	levelup_move 20, MOVE_015
	levelup_move 24, MOVE_032
	levelup_move 27, MOVE_126
	levelup_move 30, MOVE_131
	levelup_move 33, MOVE_129
	levelup_move 37, MOVE_070
	levelup_move 43, MOVE_137
	levelup_move 47, MOVE_064
	levelup_move 53, MOVE_065
	levelup_move 58, MOVE_066
	levelup_move 62, MOVE_067
	db $ff
Learnset_44b1:: ; species 021 河童
	levelup_move 6, MOVE_037
	levelup_move 12, MOVE_028
	levelup_move 15, MOVE_071
	levelup_move 19, MOVE_019
	levelup_move 21, MOVE_072
	levelup_move 26, MOVE_041
	levelup_move 30, MOVE_009
	levelup_move 33, MOVE_073
	levelup_move 36, MOVE_075
	levelup_move 42, MOVE_005
	levelup_move 46, MOVE_074
	levelup_move 51, MOVE_076
	levelup_move 57, MOVE_077
	levelup_move 62, MOVE_078
	db $ff
Learnset_44ce:: ; species 022 刺錘
	levelup_move 5, MOVE_023
	levelup_move 8, MOVE_004
	levelup_move 16, MOVE_071
	levelup_move 21, MOVE_129
	levelup_move 25, MOVE_073
	levelup_move 28, MOVE_010
	levelup_move 32, MOVE_017
	levelup_move 41, MOVE_048
	levelup_move 43, MOVE_075
	levelup_move 48, MOVE_072
	levelup_move 55, MOVE_074
	levelup_move 61, MOVE_078
	db $ff
Learnset_44e7:: ; species 023 過河龍
	levelup_move 5, MOVE_011
	levelup_move 8, MOVE_003
	levelup_move 12, MOVE_041
	levelup_move 14, MOVE_015
	levelup_move 17, MOVE_023
	levelup_move 22, MOVE_072
	levelup_move 25, MOVE_035
	levelup_move 28, MOVE_075
	levelup_move 29, MOVE_073
	levelup_move 32, MOVE_010
	levelup_move 35, MOVE_002
	levelup_move 40, MOVE_079
	levelup_move 44, MOVE_071
	levelup_move 50, MOVE_074
	levelup_move 56, MOVE_078
	levelup_move 60, MOVE_077
	db $ff
Learnset_4508:: ; species 024 翻江鯉
	levelup_move 2, MOVE_044
	levelup_move 7, MOVE_019
	levelup_move 13, MOVE_071
	levelup_move 16, MOVE_073
	levelup_move 24, MOVE_021
	levelup_move 26, MOVE_074
	levelup_move 33, MOVE_040
	levelup_move 40, MOVE_005
	levelup_move 43, MOVE_139
	levelup_move 48, MOVE_075
	levelup_move 54, MOVE_077
	levelup_move 62, MOVE_079
	db $ff
Learnset_4521:: ; species 025 水妖
	levelup_move 4, MOVE_023
	levelup_move 8, MOVE_032
	levelup_move 10, MOVE_008
	levelup_move 15, MOVE_004
	levelup_move 21, MOVE_076
	levelup_move 24, MOVE_011
	levelup_move 25, MOVE_077
	levelup_move 30, MOVE_036
	levelup_move 33, MOVE_010
	levelup_move 39, MOVE_139
	levelup_move 43, MOVE_071
	levelup_move 48, MOVE_072
	levelup_move 53, MOVE_074
	levelup_move 59, MOVE_078
	db $ff
Learnset_453e:: ; species 026 夾面妖
	levelup_move 5, MOVE_013
	levelup_move 8, MOVE_071
	levelup_move 12, MOVE_012
	levelup_move 19, MOVE_072
	levelup_move 24, MOVE_015
	levelup_move 38, MOVE_078
	levelup_move 44, MOVE_075
	levelup_move 45, MOVE_139
	levelup_move 50, MOVE_074
	levelup_move 53, MOVE_077
	levelup_move 61, MOVE_079
	db $ff
Learnset_4555:: ; species 027 圓圓
	levelup_move 8, MOVE_124
	levelup_move 15, MOVE_018
	levelup_move 20, MOVE_024
	levelup_move 23, MOVE_048
	levelup_move 29, MOVE_073
	levelup_move 35, MOVE_137
	levelup_move 42, MOVE_130
	levelup_move 47, MOVE_074
	levelup_move 53, MOVE_078
	levelup_move 59, MOVE_079
	levelup_move 62, MOVE_077
	db $ff
Learnset_456c:: ; species 028 金魚王
	levelup_move 3, MOVE_012
	levelup_move 8, MOVE_019
	levelup_move 15, MOVE_003
	levelup_move 18, MOVE_011
	levelup_move 20, MOVE_071
	levelup_move 25, MOVE_008
	levelup_move 29, MOVE_073
	levelup_move 31, MOVE_041
	levelup_move 34, MOVE_018
	levelup_move 36, MOVE_075
	levelup_move 41, MOVE_076
	levelup_move 45, MOVE_072
	levelup_move 51, MOVE_074
	levelup_move 56, MOVE_077
	levelup_move 63, MOVE_078
	db $ff
Learnset_458b:: ; species 029 食人鯊
	levelup_move 5, MOVE_015
	levelup_move 11, MOVE_014
	levelup_move 17, MOVE_009
	levelup_move 25, MOVE_072
	levelup_move 30, MOVE_019
	levelup_move 36, MOVE_074
	levelup_move 45, MOVE_127
	levelup_move 49, MOVE_073
	levelup_move 54, MOVE_075
	levelup_move 58, MOVE_076
	levelup_move 61, MOVE_077
	db $ff
Learnset_45a2:: ; species 030 水瓶座
	levelup_move 4, MOVE_019
	levelup_move 10, MOVE_071
	levelup_move 18, MOVE_124
	levelup_move 25, MOVE_072
	levelup_move 29, MOVE_041
	levelup_move 33, MOVE_006
	levelup_move 37, MOVE_074
	levelup_move 41, MOVE_130
	levelup_move 45, MOVE_075
	levelup_move 51, MOVE_073
	levelup_move 56, MOVE_076
	levelup_move 60, MOVE_077
	levelup_move 62, MOVE_078
	db $ff
Learnset_45bd:: ; species 031 草叢怪
	levelup_move 10, MOVE_011
	levelup_move 16, MOVE_023
	levelup_move 21, MOVE_035
	levelup_move 24, MOVE_029
	levelup_move 25, MOVE_094
	levelup_move 29, MOVE_018
	levelup_move 31, MOVE_102
	levelup_move 34, MOVE_006
	levelup_move 37, MOVE_040
	levelup_move 43, MOVE_098
	levelup_move 46, MOVE_093
	levelup_move 51, MOVE_096
	levelup_move 56, MOVE_097
	levelup_move 60, MOVE_100
	db $ff
Learnset_45da:: ; species 032 蘑菇群
	levelup_move 3, MOVE_019
	levelup_move 9, MOVE_008
	levelup_move 14, MOVE_126
	levelup_move 20, MOVE_024
	levelup_move 24, MOVE_100
	levelup_move 26, MOVE_022
	levelup_move 37, MOVE_099
	levelup_move 42, MOVE_097
	levelup_move 47, MOVE_098
	levelup_move 53, MOVE_101
	levelup_move 59, MOVE_102
	db $ff
Learnset_45f1:: ; species 033 樹精
	levelup_move 3, MOVE_019
	levelup_move 9, MOVE_093
	levelup_move 14, MOVE_039
	levelup_move 18, MOVE_099
	levelup_move 20, MOVE_050
	levelup_move 26, MOVE_119
	levelup_move 30, MOVE_017
	levelup_move 34, MOVE_051
	levelup_move 39, MOVE_127
	levelup_move 43, MOVE_097
	levelup_move 45, MOVE_094
	levelup_move 51, MOVE_095
	levelup_move 58, MOVE_101
	levelup_move 63, MOVE_102
	db $ff
Learnset_460e:: ; species 034 咬人果
	levelup_move 5, MOVE_096
	levelup_move 9, MOVE_016
	levelup_move 13, MOVE_019
	levelup_move 19, MOVE_128
	levelup_move 25, MOVE_101
	levelup_move 27, MOVE_015
	levelup_move 30, MOVE_040
	levelup_move 33, MOVE_013
	levelup_move 36, MOVE_095
	levelup_move 40, MOVE_097
	levelup_move 42, MOVE_093
	levelup_move 49, MOVE_094
	levelup_move 54, MOVE_098
	levelup_move 58, MOVE_099
	db $ff
Learnset_462b:: ; species 035 足鐮
	levelup_move 8, MOVE_037
	levelup_move 18, MOVE_095
	levelup_move 21, MOVE_023
	levelup_move 25, MOVE_128
	levelup_move 27, MOVE_096
	levelup_move 34, MOVE_129
	levelup_move 36, MOVE_029
	levelup_move 42, MOVE_131
	levelup_move 47, MOVE_093
	levelup_move 51, MOVE_097
	levelup_move 54, MOVE_045
	levelup_move 60, MOVE_047
	db $ff
Learnset_4644:: ; species 036 蛇王
	levelup_move 3, MOVE_037
	levelup_move 7, MOVE_102
	levelup_move 11, MOVE_093
	levelup_move 13, MOVE_012
	levelup_move 16, MOVE_021
	levelup_move 20, MOVE_032
	levelup_move 24, MOVE_002
	levelup_move 28, MOVE_126
	levelup_move 34, MOVE_129
	levelup_move 45, MOVE_124
	levelup_move 50, MOVE_128
	levelup_move 56, MOVE_131
	levelup_move 60, MOVE_022
	db $ff
Learnset_465f:: ; species 037 毒菊
	levelup_move 5, MOVE_023
	levelup_move 9, MOVE_031
	levelup_move 14, MOVE_093
	levelup_move 19, MOVE_041
	levelup_move 22, MOVE_094
	levelup_move 25, MOVE_008
	levelup_move 30, MOVE_095
	levelup_move 37, MOVE_096
	levelup_move 40, MOVE_036
	levelup_move 42, MOVE_097
	levelup_move 45, MOVE_100
	levelup_move 50, MOVE_098
	levelup_move 55, MOVE_102
	levelup_move 59, MOVE_099
	db $ff
Learnset_467c:: ; species 038 蟲精
	levelup_move 10, MOVE_019
	levelup_move 14, MOVE_093
	levelup_move 20, MOVE_035
	levelup_move 26, MOVE_101
	levelup_move 29, MOVE_040
	levelup_move 31, MOVE_010
	levelup_move 33, MOVE_097
	levelup_move 37, MOVE_099
	levelup_move 42, MOVE_098
	levelup_move 47, MOVE_129
	levelup_move 51, MOVE_020
	levelup_move 54, MOVE_039
	db $ff
Learnset_4695:: ; species 039 香菇精
	levelup_move 3, MOVE_024
	levelup_move 8, MOVE_100
	levelup_move 12, MOVE_128
	levelup_move 15, MOVE_041
	levelup_move 16, MOVE_101
	levelup_move 22, MOVE_013
	levelup_move 28, MOVE_102
	levelup_move 33, MOVE_099
	levelup_move 40, MOVE_095
	levelup_move 43, MOVE_098
	levelup_move 49, MOVE_097
	levelup_move 53, MOVE_096
	levelup_move 59, MOVE_094
	db $ff
Learnset_46b0:: ; species 040 花蝴蝶
	levelup_move 5, MOVE_019
	levelup_move 10, MOVE_102
	levelup_move 14, MOVE_037
	levelup_move 16, MOVE_093
	levelup_move 21, MOVE_039
	levelup_move 25, MOVE_015
	levelup_move 30, MOVE_134
	levelup_move 34, MOVE_096
	levelup_move 39, MOVE_100
	levelup_move 43, MOVE_126
	levelup_move 47, MOVE_097
	levelup_move 52, MOVE_098
	levelup_move 56, MOVE_101
	levelup_move 61, MOVE_110
	db $ff
Learnset_46cd:: ; species 041 獨角龍
	levelup_move 5, MOVE_008
	levelup_move 10, MOVE_021
	levelup_move 13, MOVE_134
	levelup_move 16, MOVE_037
	levelup_move 19, MOVE_114
	levelup_move 24, MOVE_007
	levelup_move 27, MOVE_132
	levelup_move 30, MOVE_032
	levelup_move 34, MOVE_122
	levelup_move 35, MOVE_123
	levelup_move 40, MOVE_115
	levelup_move 45, MOVE_116
	levelup_move 51, MOVE_117
	levelup_move 59, MOVE_118
	levelup_move 62, MOVE_022
	db $ff
Learnset_46ec:: ; species 042 獸面鳩
	levelup_move 5, MOVE_030
	levelup_move 8, MOVE_008
	levelup_move 12, MOVE_041
	levelup_move 14, MOVE_003
	levelup_move 17, MOVE_024
	levelup_move 19, MOVE_114
	levelup_move 24, MOVE_115
	levelup_move 26, MOVE_005
	levelup_move 30, MOVE_036
	levelup_move 34, MOVE_116
	levelup_move 38, MOVE_005
	levelup_move 43, MOVE_034
	levelup_move 47, MOVE_117
	levelup_move 51, MOVE_118
	levelup_move 55, MOVE_122
	levelup_move 57, MOVE_123
	db $ff
Learnset_470d:: ; species 043 暗蝠
	levelup_move 10, MOVE_007
	levelup_move 15, MOVE_126
	levelup_move 21, MOVE_129
	levelup_move 26, MOVE_040
	levelup_move 34, MOVE_027
	levelup_move 38, MOVE_118
	levelup_move 43, MOVE_122
	levelup_move 46, MOVE_112
	levelup_move 51, MOVE_134
	levelup_move 56, MOVE_137
	levelup_move 60, MOVE_114
	db $ff
Learnset_4724:: ; species 044 沙塵暴
	levelup_move 11, MOVE_003
	levelup_move 16, MOVE_124
	levelup_move 19, MOVE_114
	levelup_move 25, MOVE_115
	levelup_move 26, MOVE_011
	levelup_move 30, MOVE_116
	levelup_move 33, MOVE_127
	levelup_move 36, MOVE_117
	levelup_move 42, MOVE_118
	levelup_move 46, MOVE_008
	levelup_move 52, MOVE_022
	levelup_move 57, MOVE_039
	levelup_move 61, MOVE_132
	db $ff
Learnset_473f:: ; species 045 鳥人獸
	levelup_move 10, MOVE_030
	levelup_move 16, MOVE_011
	levelup_move 24, MOVE_022
	levelup_move 33, MOVE_122
	levelup_move 35, MOVE_123
	levelup_move 39, MOVE_036
	levelup_move 40, MOVE_020
	levelup_move 42, MOVE_132
	levelup_move 44, MOVE_130
	levelup_move 48, MOVE_114
	levelup_move 53, MOVE_115
	levelup_move 59, MOVE_116
	db $ff
Learnset_4758:: ; species 046 大嘴鳥
	levelup_move 10, MOVE_114
	levelup_move 16, MOVE_124
	levelup_move 25, MOVE_115
	levelup_move 31, MOVE_010
	levelup_move 33, MOVE_116
	levelup_move 36, MOVE_137
	levelup_move 43, MOVE_136
	levelup_move 49, MOVE_117
	levelup_move 55, MOVE_118
	levelup_move 60, MOVE_038
	db $ff
Learnset_476d:: ; species 047 飛天牛
	levelup_move 11, MOVE_026
	levelup_move 14, MOVE_023
	levelup_move 17, MOVE_017
	levelup_move 19, MOVE_003
	levelup_move 24, MOVE_122
	levelup_move 34, MOVE_018
	levelup_move 38, MOVE_123
	levelup_move 44, MOVE_117
	levelup_move 49, MOVE_114
	levelup_move 54, MOVE_115
	levelup_move 58, MOVE_116
	levelup_move 62, MOVE_118
	db $ff
Learnset_4786:: ; species 048 機械蝙
	levelup_move 7, MOVE_008
	levelup_move 16, MOVE_032
	levelup_move 20, MOVE_039
	levelup_move 24, MOVE_111
	levelup_move 28, MOVE_115
	levelup_move 32, MOVE_134
	levelup_move 36, MOVE_122
	levelup_move 40, MOVE_123
	levelup_move 42, MOVE_112
	levelup_move 47, MOVE_126
	levelup_move 51, MOVE_114
	levelup_move 57, MOVE_118
	db $ff
Learnset_479f:: ; species 049 鳥人
	levelup_move 4, MOVE_039
	levelup_move 10, MOVE_011
	levelup_move 18, MOVE_114
	levelup_move 20, MOVE_110
	levelup_move 24, MOVE_066
	levelup_move 30, MOVE_115
	levelup_move 35, MOVE_116
	levelup_move 41, MOVE_118
	levelup_move 46, MOVE_014
	levelup_move 51, MOVE_020
	levelup_move 56, MOVE_022
	levelup_move 61, MOVE_117
	db $ff
Learnset_47b8:: ; species 050 翼首龍
	levelup_move 6, MOVE_019
	levelup_move 12, MOVE_003
	levelup_move 16, MOVE_035
	levelup_move 18, MOVE_004
	levelup_move 20, MOVE_015
	levelup_move 25, MOVE_040
	levelup_move 33, MOVE_005
	levelup_move 40, MOVE_117
	levelup_move 44, MOVE_114
	levelup_move 49, MOVE_115
	levelup_move 56, MOVE_116
	levelup_move 63, MOVE_119
	db $ff
Learnset_47d1:: ; species 051 土沙
	levelup_move 7, MOVE_019
	levelup_move 16, MOVE_080
	levelup_move 22, MOVE_014
	levelup_move 25, MOVE_040
	levelup_move 27, MOVE_010
	levelup_move 29, MOVE_041
	levelup_move 34, MOVE_082
	levelup_move 43, MOVE_084
	levelup_move 49, MOVE_081
	levelup_move 56, MOVE_083
	levelup_move 62, MOVE_085
	db $ff
Learnset_47e8:: ; species 052 泥獸
	levelup_move 4, MOVE_012
	levelup_move 11, MOVE_016
	levelup_move 16, MOVE_083
	levelup_move 24, MOVE_013
	levelup_move 31, MOVE_082
	levelup_move 37, MOVE_086
	levelup_move 45, MOVE_131
	levelup_move 49, MOVE_080
	levelup_move 53, MOVE_081
	levelup_move 57, MOVE_084
	levelup_move 63, MOVE_085
	db $ff
Learnset_47ff:: ; species 053 四角龍
	levelup_move 9, MOVE_080
	levelup_move 15, MOVE_081
	levelup_move 21, MOVE_082
	levelup_move 28, MOVE_083
	levelup_move 34, MOVE_084
	levelup_move 40, MOVE_085
	levelup_move 45, MOVE_086
	levelup_move 48, MOVE_004
	levelup_move 51, MOVE_006
	levelup_move 55, MOVE_026
	levelup_move 61, MOVE_108
	db $ff
Learnset_4816:: ; species 054 丟石怪
	levelup_move 6, MOVE_037
	levelup_move 14, MOVE_021
	levelup_move 20, MOVE_014
	levelup_move 22, MOVE_081
	levelup_move 27, MOVE_010
	levelup_move 30, MOVE_082
	levelup_move 35, MOVE_084
	levelup_move 42, MOVE_086
	levelup_move 48, MOVE_083
	levelup_move 55, MOVE_085
	levelup_move 60, MOVE_020
	db $ff
Learnset_482d:: ; species 055 鬥石
	levelup_move 6, MOVE_026
	levelup_move 12, MOVE_036
	levelup_move 15, MOVE_021
	levelup_move 17, MOVE_080
	levelup_move 21, MOVE_081
	levelup_move 26, MOVE_011
	levelup_move 28, MOVE_082
	levelup_move 35, MOVE_036
	levelup_move 43, MOVE_083
	levelup_move 49, MOVE_084
	levelup_move 55, MOVE_085
	levelup_move 61, MOVE_086
	db $ff
Learnset_4846:: ; species 056 石蛟
	levelup_move 10, MOVE_021
	levelup_move 16, MOVE_081
	levelup_move 19, MOVE_082
	levelup_move 21, MOVE_083
	levelup_move 23, MOVE_084
	levelup_move 24, MOVE_018
	levelup_move 26, MOVE_003
	levelup_move 30, MOVE_085
	levelup_move 33, MOVE_086
	levelup_move 40, MOVE_127
	levelup_move 42, MOVE_130
	levelup_move 46, MOVE_006
	levelup_move 51, MOVE_026
	levelup_move 56, MOVE_036
	levelup_move 60, MOVE_040
	db $ff
Learnset_4865:: ; species 057 刺角獸
	levelup_move 11, MOVE_080
	levelup_move 20, MOVE_029
	levelup_move 26, MOVE_081
	levelup_move 31, MOVE_082
	levelup_move 36, MOVE_040
	levelup_move 40, MOVE_083
	levelup_move 43, MOVE_084
	levelup_move 47, MOVE_085
	levelup_move 53, MOVE_086
	levelup_move 59, MOVE_005
	db $ff
Learnset_487a:: ; species 058 壁面石
	levelup_move 8, MOVE_007
	levelup_move 16, MOVE_015
	levelup_move 20, MOVE_019
	levelup_move 22, MOVE_002
	levelup_move 25, MOVE_041
	levelup_move 26, MOVE_010
	levelup_move 31, MOVE_011
	levelup_move 36, MOVE_038
	levelup_move 40, MOVE_084
	levelup_move 45, MOVE_080
	levelup_move 49, MOVE_081
	levelup_move 52, MOVE_082
	levelup_move 57, MOVE_083
	levelup_move 61, MOVE_085
	levelup_move 64, MOVE_086
	db $ff
Learnset_4899:: ; species 059 機械石
	levelup_move 6, MOVE_037
	levelup_move 13, MOVE_080
	levelup_move 16, MOVE_126
	levelup_move 20, MOVE_081
	levelup_move 24, MOVE_134
	levelup_move 29, MOVE_082
	levelup_move 33, MOVE_040
	levelup_move 40, MOVE_083
	levelup_move 45, MOVE_047
	levelup_move 49, MOVE_084
	levelup_move 54, MOVE_085
	levelup_move 59, MOVE_086
	db $ff
Learnset_48b2:: ; species 060 泥人
	levelup_move 4, MOVE_019
	levelup_move 8, MOVE_080
	levelup_move 14, MOVE_014
	levelup_move 19, MOVE_012
	levelup_move 21, MOVE_033
	levelup_move 24, MOVE_040
	levelup_move 28, MOVE_081
	levelup_move 34, MOVE_082
	levelup_move 42, MOVE_034
	levelup_move 46, MOVE_083
	levelup_move 50, MOVE_084
	levelup_move 55, MOVE_085
	levelup_move 60, MOVE_086
	db $ff
Learnset_48cd:: ; species 061 紅魔人
	levelup_move 4, MOVE_012
	levelup_move 11, MOVE_014
	levelup_move 17, MOVE_003
	levelup_move 24, MOVE_033
	levelup_move 27, MOVE_040
	levelup_move 29, MOVE_103
	levelup_move 31, MOVE_006
	levelup_move 34, MOVE_135
	levelup_move 36, MOVE_104
	levelup_move 44, MOVE_034
	levelup_move 49, MOVE_090
	levelup_move 53, MOVE_105
	levelup_move 58, MOVE_106
	levelup_move 62, MOVE_107
	db $ff
Learnset_48ea:: ; species 062 飛首
	levelup_move 5, MOVE_044
	levelup_move 10, MOVE_030
	levelup_move 16, MOVE_037
	levelup_move 26, MOVE_105
	levelup_move 35, MOVE_136
	levelup_move 43, MOVE_106
	levelup_move 45, MOVE_103
	levelup_move 50, MOVE_107
	levelup_move 54, MOVE_112
	levelup_move 60, MOVE_108
	db $ff
Learnset_48ff:: ; species 063 屍妖
	levelup_move 3, MOVE_008
	levelup_move 9, MOVE_026
	levelup_move 14, MOVE_037
	levelup_move 18, MOVE_041
	levelup_move 20, MOVE_103
	levelup_move 25, MOVE_019
	levelup_move 29, MOVE_104
	levelup_move 33, MOVE_106
	levelup_move 38, MOVE_006
	levelup_move 44, MOVE_107
	levelup_move 49, MOVE_105
	levelup_move 53, MOVE_110
	levelup_move 59, MOVE_108
	levelup_move 62, MOVE_113
	db $ff
Learnset_491c:: ; species 064 閻魔人
	levelup_move 3, MOVE_013
	levelup_move 9, MOVE_029
	levelup_move 14, MOVE_113
	levelup_move 19, MOVE_040
	levelup_move 21, MOVE_134
	levelup_move 25, MOVE_110
	levelup_move 28, MOVE_041
	levelup_move 29, MOVE_010
	levelup_move 32, MOVE_105
	levelup_move 36, MOVE_090
	levelup_move 40, MOVE_137
	levelup_move 45, MOVE_108
	levelup_move 49, MOVE_104
	levelup_move 54, MOVE_106
	levelup_move 59, MOVE_107
	levelup_move 62, MOVE_109
	db $ff
Learnset_493d:: ; species 065 傑森
	levelup_move 7, MOVE_110
	levelup_move 16, MOVE_031
	levelup_move 25, MOVE_105
	levelup_move 30, MOVE_113
	levelup_move 33, MOVE_006
	levelup_move 37, MOVE_005
	levelup_move 42, MOVE_106
	levelup_move 47, MOVE_107
	levelup_move 53, MOVE_108
	levelup_move 58, MOVE_112
	levelup_move 62, MOVE_090
	db $ff
Learnset_4954:: ; species 066 豬妖
	levelup_move 6, MOVE_012
	levelup_move 9, MOVE_103
	levelup_move 14, MOVE_104
	levelup_move 21, MOVE_040
	levelup_move 24, MOVE_008
	levelup_move 28, MOVE_105
	levelup_move 33, MOVE_041
	levelup_move 37, MOVE_111
	levelup_move 42, MOVE_137
	levelup_move 45, MOVE_107
	levelup_move 50, MOVE_106
	levelup_move 55, MOVE_112
	levelup_move 60, MOVE_108
	db $ff
Learnset_496f:: ; species 067 電子腦
	levelup_move 5, MOVE_019
	levelup_move 9, MOVE_109
	levelup_move 14, MOVE_111
	levelup_move 16, MOVE_113
	levelup_move 21, MOVE_105
	levelup_move 26, MOVE_037
	levelup_move 33, MOVE_110
	levelup_move 43, MOVE_131
	levelup_move 47, MOVE_090
	levelup_move 51, MOVE_106
	levelup_move 56, MOVE_107
	levelup_move 61, MOVE_108
	db $ff
Learnset_4988:: ; species 068 黑煞
	levelup_move 6, MOVE_104
	levelup_move 12, MOVE_012
	levelup_move 17, MOVE_003
	levelup_move 22, MOVE_105
	levelup_move 25, MOVE_090
	levelup_move 30, MOVE_134
	levelup_move 33, MOVE_110
	levelup_move 38, MOVE_024
	levelup_move 45, MOVE_107
	levelup_move 49, MOVE_106
	levelup_move 53, MOVE_090
	levelup_move 58, MOVE_108
	levelup_move 62, MOVE_112
	db $ff
Learnset_49a3:: ; species 069 黑寡婦
	levelup_move 6, MOVE_029
	levelup_move 10, MOVE_126
	levelup_move 17, MOVE_129
	levelup_move 20, MOVE_124
	levelup_move 24, MOVE_010
	levelup_move 33, MOVE_134
	levelup_move 38, MOVE_130
	levelup_move 45, MOVE_106
	levelup_move 51, MOVE_105
	levelup_move 56, MOVE_107
	levelup_move 60, MOVE_027
	db $ff
Learnset_49ba:: ; species 070 史萊姆
	levelup_move 8, MOVE_112
	levelup_move 14, MOVE_104
	levelup_move 23, MOVE_008
	levelup_move 28, MOVE_065
	levelup_move 34, MOVE_133
	levelup_move 39, MOVE_107
	levelup_move 44, MOVE_127
	levelup_move 49, MOVE_103
	levelup_move 51, MOVE_110
	levelup_move 55, MOVE_105
	levelup_move 61, MOVE_108
	db $ff
Learnset_49d1:: ; species 071 仙人
	levelup_move 8, MOVE_037
	levelup_move 11, MOVE_009
	levelup_move 15, MOVE_019
	levelup_move 22, MOVE_132
	levelup_move 25, MOVE_022
	levelup_move 31, MOVE_125
	levelup_move 35, MOVE_087
	levelup_move 45, MOVE_121
	levelup_move 48, MOVE_119
	levelup_move 54, MOVE_120
	levelup_move 57, MOVE_092
	levelup_move 62, MOVE_091
	db $ff
Learnset_49ea:: ; species 072 雷神
	levelup_move 7, MOVE_019
	levelup_move 14, MOVE_087
	levelup_move 18, MOVE_009
	levelup_move 20, MOVE_035
	levelup_move 24, MOVE_088
	levelup_move 25, MOVE_039
	levelup_move 28, MOVE_011
	levelup_move 29, MOVE_089
	levelup_move 30, MOVE_017
	levelup_move 32, MOVE_091
	levelup_move 38, MOVE_092
	levelup_move 44, MOVE_120
	levelup_move 49, MOVE_090
	levelup_move 55, MOVE_034
	levelup_move 62, MOVE_020
	db $ff
Learnset_4a09:: ; species 073 泥菩薩
	levelup_move 3, MOVE_037
	levelup_move 7, MOVE_008
	levelup_move 9, MOVE_021
	levelup_move 14, MOVE_029
	levelup_move 16, MOVE_087
	levelup_move 24, MOVE_126
	levelup_move 33, MOVE_130
	levelup_move 38, MOVE_121
	levelup_move 40, MOVE_127
	levelup_move 43, MOVE_088
	levelup_move 49, MOVE_089
	levelup_move 54, MOVE_092
	levelup_move 59, MOVE_091
	levelup_move 63, MOVE_119
	db $ff
Learnset_4a26:: ; species 074 天狗
	levelup_move 6, MOVE_019
	levelup_move 12, MOVE_031
	levelup_move 15, MOVE_037
	levelup_move 25, MOVE_125
	levelup_move 27, MOVE_119
	levelup_move 35, MOVE_088
	levelup_move 43, MOVE_127
	levelup_move 48, MOVE_087
	levelup_move 53, MOVE_089
	levelup_move 59, MOVE_109
	levelup_move 62, MOVE_091
	db $ff
Learnset_4a3d:: ; species 075 雷獸
	levelup_move 14, MOVE_003
	levelup_move 18, MOVE_037
	levelup_move 20, MOVE_087
	levelup_move 25, MOVE_048
	levelup_move 28, MOVE_088
	levelup_move 33, MOVE_010
	levelup_move 35, MOVE_089
	levelup_move 38, MOVE_008
	levelup_move 39, MOVE_090
	levelup_move 43, MOVE_140
	levelup_move 49, MOVE_092
	levelup_move 55, MOVE_091
	levelup_move 61, MOVE_131
	db $ff
Learnset_4a58:: ; species 076 海神
	levelup_move 4, MOVE_008
	levelup_move 11, MOVE_009
	levelup_move 16, MOVE_037
	levelup_move 19, MOVE_073
	levelup_move 22, MOVE_087
	levelup_move 26, MOVE_075
	levelup_move 30, MOVE_134
	levelup_move 35, MOVE_089
	levelup_move 41, MOVE_130
	levelup_move 43, MOVE_131
	levelup_move 46, MOVE_073
	levelup_move 53, MOVE_075
	levelup_move 60, MOVE_079
	db $ff
Learnset_4a73:: ; species 077 小天使
	levelup_move 6, MOVE_012
	levelup_move 11, MOVE_128
	levelup_move 15, MOVE_023
	levelup_move 18, MOVE_088
	levelup_move 25, MOVE_124
	levelup_move 26, MOVE_040
	levelup_move 30, MOVE_092
	levelup_move 38, MOVE_010
	levelup_move 40, MOVE_120
	levelup_move 43, MOVE_087
	levelup_move 49, MOVE_089
	levelup_move 54, MOVE_092
	levelup_move 59, MOVE_091
	levelup_move 62, MOVE_090
	db $ff
Learnset_4a90:: ; species 078 天兵
	levelup_move 9, MOVE_003
	levelup_move 12, MOVE_011
	levelup_move 14, MOVE_050
	levelup_move 21, MOVE_119
	levelup_move 25, MOVE_059
	levelup_move 27, MOVE_062
	levelup_move 31, MOVE_051
	levelup_move 34, MOVE_041
	levelup_move 36, MOVE_005
	levelup_move 39, MOVE_061
	levelup_move 42, MOVE_060
	levelup_move 44, MOVE_087
	levelup_move 49, MOVE_088
	levelup_move 55, MOVE_089
	levelup_move 61, MOVE_091
	db $ff
Learnset_4aaf:: ; species 079 機械雷
	levelup_move 6, MOVE_011
	levelup_move 17, MOVE_003
	levelup_move 20, MOVE_008
	levelup_move 24, MOVE_023
	levelup_move 26, MOVE_087
	levelup_move 30, MOVE_035
	levelup_move 33, MOVE_015
	levelup_move 37, MOVE_002
	levelup_move 41, MOVE_005
	levelup_move 45, MOVE_131
	levelup_move 50, MOVE_088
	levelup_move 56, MOVE_089
	levelup_move 61, MOVE_092
	levelup_move 64, MOVE_091
	db $ff
Learnset_4acc:: ; species 080 金光球
	levelup_move 9, MOVE_092
	levelup_move 11, MOVE_128
	levelup_move 16, MOVE_087
	levelup_move 20, MOVE_134
	levelup_move 23, MOVE_119
	levelup_move 25, MOVE_089
	levelup_move 33, MOVE_020
	levelup_move 45, MOVE_090
	levelup_move 49, MOVE_088
	levelup_move 56, MOVE_092
	levelup_move 61, MOVE_091
	db $ff
Learnset_4ae3:: ; species 081 藍靈犬
	levelup_move 4, MOVE_023
	levelup_move 7, MOVE_002
	levelup_move 10, MOVE_037
	levelup_move 15, MOVE_045
	levelup_move 19, MOVE_062
	levelup_move 24, MOVE_024
	levelup_move 27, MOVE_042
	levelup_move 35, MOVE_047
	levelup_move 42, MOVE_046
	levelup_move 47, MOVE_048
	levelup_move 51, MOVE_049
	levelup_move 56, MOVE_053
	levelup_move 62, MOVE_057
	db $ff
Learnset_4afe:: ; species 082 機械貓
	levelup_move 5, MOVE_008
	levelup_move 13, MOVE_049
	levelup_move 19, MOVE_039
	levelup_move 25, MOVE_135
	levelup_move 28, MOVE_013
	levelup_move 30, MOVE_017
	levelup_move 40, MOVE_050
	levelup_move 45, MOVE_056
	levelup_move 49, MOVE_004
	levelup_move 54, MOVE_010
	levelup_move 60, MOVE_038
	db $ff
Learnset_4b15:: ; species 083 妙虎
	levelup_move 10, MOVE_019
	levelup_move 16, MOVE_040
	levelup_move 24, MOVE_022
	levelup_move 29, MOVE_032
	levelup_move 35, MOVE_010
	levelup_move 38, MOVE_054
	levelup_move 41, MOVE_034
	levelup_move 46, MOVE_057
	levelup_move 51, MOVE_062
	levelup_move 56, MOVE_063
	levelup_move 61, MOVE_014
	db $ff
Learnset_4b2c:: ; species 084 寵物犬
	levelup_move 3, MOVE_128
	levelup_move 10, MOVE_049
	levelup_move 16, MOVE_126
	levelup_move 20, MOVE_037
	levelup_move 24, MOVE_015
	levelup_move 29, MOVE_063
	levelup_move 36, MOVE_014
	levelup_move 42, MOVE_136
	levelup_move 47, MOVE_022
	levelup_move 52, MOVE_002
	levelup_move 58, MOVE_035
	levelup_move 61, MOVE_052
	db $ff
Learnset_4b45:: ; species 085 虎犬
	levelup_move 3, MOVE_029
	levelup_move 7, MOVE_049
	levelup_move 15, MOVE_052
	levelup_move 19, MOVE_016
	levelup_move 25, MOVE_134
	levelup_move 31, MOVE_002
	levelup_move 36, MOVE_131
	levelup_move 40, MOVE_041
	levelup_move 42, MOVE_062
	levelup_move 44, MOVE_137
	levelup_move 49, MOVE_014
	levelup_move 53, MOVE_063
	levelup_move 58, MOVE_062
	levelup_move 62, MOVE_057
	db $ff
Learnset_4b62:: ; species 086 維京人
	levelup_move 4, MOVE_019
	levelup_move 10, MOVE_025
	levelup_move 16, MOVE_024
	levelup_move 20, MOVE_034
	levelup_move 25, MOVE_059
	levelup_move 28, MOVE_010
	levelup_move 34, MOVE_060
	levelup_move 40, MOVE_036
	levelup_move 43, MOVE_005
	levelup_move 48, MOVE_049
	levelup_move 52, MOVE_048
	levelup_move 56, MOVE_050
	levelup_move 63, MOVE_058
	db $ff
Learnset_4b7d:: ; species 087 鬥精靈
	levelup_move 6, MOVE_011
	levelup_move 10, MOVE_049
	levelup_move 18, MOVE_019
	levelup_move 24, MOVE_063
	levelup_move 27, MOVE_050
	levelup_move 29, MOVE_039
	levelup_move 31, MOVE_010
	levelup_move 33, MOVE_061
	levelup_move 35, MOVE_040
	levelup_move 39, MOVE_022
	levelup_move 43, MOVE_138
	levelup_move 46, MOVE_052
	levelup_move 51, MOVE_053
	levelup_move 56, MOVE_058
	levelup_move 61, MOVE_061
	db $ff
Learnset_4b9c:: ; species 088 雙面獸
	levelup_move 10, MOVE_008
	levelup_move 20, MOVE_004
	levelup_move 24, MOVE_013
	levelup_move 29, MOVE_018
	levelup_move 30, MOVE_042
	levelup_move 33, MOVE_047
	levelup_move 39, MOVE_053
	levelup_move 43, MOVE_010
	levelup_move 48, MOVE_014
	levelup_move 52, MOVE_060
	levelup_move 59, MOVE_079
	db $ff
Learnset_4bb3:: ; species 089 大舌蛙
	levelup_move 9, MOVE_071
	levelup_move 12, MOVE_052
	levelup_move 17, MOVE_014
	levelup_move 20, MOVE_037
	levelup_move 25, MOVE_021
	levelup_move 29, MOVE_013
	levelup_move 30, MOVE_058
	levelup_move 34, MOVE_129
	levelup_move 38, MOVE_062
	levelup_move 44, MOVE_137
	levelup_move 49, MOVE_103
	levelup_move 54, MOVE_134
	levelup_move 60, MOVE_130
	db $ff
Learnset_4bce:: ; species 090 火炎怪
	levelup_move 8, MOVE_134
	levelup_move 16, MOVE_015
	levelup_move 22, MOVE_037
	levelup_move 27, MOVE_065
	levelup_move 34, MOVE_066
	levelup_move 38, MOVE_067
	levelup_move 42, MOVE_136
	levelup_move 43, MOVE_069
	levelup_move 48, MOVE_064
	levelup_move 53, MOVE_014
	levelup_move 59, MOVE_040
	db $ff
Learnset_4be5:: ; species 091 鸚鵡獸
	levelup_move 10, MOVE_030
	levelup_move 15, MOVE_064
	levelup_move 20, MOVE_040
	levelup_move 25, MOVE_007
	levelup_move 30, MOVE_134
	levelup_move 35, MOVE_017
	levelup_move 40, MOVE_034
	levelup_move 45, MOVE_138
	levelup_move 50, MOVE_065
	levelup_move 55, MOVE_067
	levelup_move 60, MOVE_068
	levelup_move 63, MOVE_069
	db $ff
Learnset_4bfe:: ; species 092 邪火怪
	levelup_move 3, MOVE_012
	levelup_move 9, MOVE_026
	levelup_move 11, MOVE_064
	levelup_move 14, MOVE_065
	levelup_move 23, MOVE_048
	levelup_move 25, MOVE_024
	levelup_move 30, MOVE_018
	levelup_move 34, MOVE_070
	levelup_move 38, MOVE_036
	levelup_move 40, MOVE_066
	levelup_move 43, MOVE_067
	levelup_move 56, MOVE_069
	levelup_move 61, MOVE_061
	db $ff
Learnset_4c19:: ; species 093 烈火劍
	levelup_move 8, MOVE_011
	levelup_move 19, MOVE_015
	levelup_move 21, MOVE_035
	levelup_move 24, MOVE_013
	levelup_move 28, MOVE_066
	levelup_move 34, MOVE_010
	levelup_move 38, MOVE_036
	levelup_move 42, MOVE_131
	levelup_move 47, MOVE_065
	levelup_move 52, MOVE_045
	levelup_move 58, MOVE_067
	levelup_move 61, MOVE_138
	db $ff
Learnset_4c32:: ; species 094 巨火岩
	levelup_move 4, MOVE_012
	levelup_move 7, MOVE_008
	levelup_move 10, MOVE_080
	levelup_move 15, MOVE_011
	levelup_move 24, MOVE_033
	levelup_move 27, MOVE_040
	levelup_move 33, MOVE_065
	levelup_move 40, MOVE_036
	levelup_move 45, MOVE_064
	levelup_move 49, MOVE_066
	levelup_move 54, MOVE_067
	levelup_move 61, MOVE_014
	db $ff
Learnset_4c4b:: ; species 095 火精靈
	levelup_move 7, MOVE_064
	levelup_move 9, MOVE_065
	levelup_move 13, MOVE_066
	levelup_move 16, MOVE_134
	levelup_move 19, MOVE_067
	levelup_move 20, MOVE_016
	levelup_move 28, MOVE_068
	levelup_move 31, MOVE_130
	levelup_move 34, MOVE_131
	levelup_move 38, MOVE_069
	levelup_move 43, MOVE_070
	levelup_move 48, MOVE_138
	levelup_move 54, MOVE_017
	levelup_move 60, MOVE_010
	db $ff
Learnset_4c68:: ; species 096 炎龍獸
	levelup_move 10, MOVE_002
	levelup_move 16, MOVE_039
	levelup_move 22, MOVE_128
	levelup_move 26, MOVE_129
	levelup_move 33, MOVE_131
	levelup_move 37, MOVE_005
	levelup_move 40, MOVE_020
	levelup_move 43, MOVE_138
	levelup_move 47, MOVE_064
	levelup_move 52, MOVE_065
	levelup_move 58, MOVE_066
	levelup_move 62, MOVE_097
	db $ff
Learnset_4c81:: ; species 097 風火輪
	levelup_move 8, MOVE_017
	levelup_move 14, MOVE_015
	levelup_move 16, MOVE_035
	levelup_move 18, MOVE_065
	levelup_move 20, MOVE_126
	levelup_move 24, MOVE_040
	levelup_move 26, MOVE_066
	levelup_move 28, MOVE_013
	levelup_move 30, MOVE_002
	levelup_move 31, MOVE_005
	levelup_move 33, MOVE_006
	levelup_move 38, MOVE_067
	levelup_move 43, MOVE_068
	levelup_move 47, MOVE_064
	levelup_move 53, MOVE_070
	levelup_move 60, MOVE_057
	db $ff
Learnset_4ca2:: ; species 098 火神
	levelup_move 10, MOVE_008
	levelup_move 12, MOVE_064
	levelup_move 19, MOVE_013
	levelup_move 25, MOVE_061
	levelup_move 33, MOVE_041
	levelup_move 39, MOVE_058
	levelup_move 43, MOVE_067
	levelup_move 49, MOVE_065
	levelup_move 54, MOVE_066
	levelup_move 59, MOVE_069
	levelup_move 63, MOVE_070
	db $ff
Learnset_4cb9:: ; species 099 人魚
	levelup_move 8, MOVE_011
	levelup_move 15, MOVE_071
	levelup_move 22, MOVE_075
	levelup_move 29, MOVE_036
	levelup_move 31, MOVE_018
	levelup_move 33, MOVE_139
	levelup_move 40, MOVE_079
	levelup_move 44, MOVE_072
	levelup_move 49, MOVE_073
	levelup_move 54, MOVE_074
	levelup_move 58, MOVE_077
	levelup_move 62, MOVE_078
	db $ff
Learnset_4cd2:: ; species 100 雪熊
	levelup_move 8, MOVE_060
	levelup_move 26, MOVE_077
	levelup_move 30, MOVE_036
	levelup_move 36, MOVE_078
	levelup_move 40, MOVE_131
	levelup_move 44, MOVE_079
	levelup_move 49, MOVE_076
	levelup_move 53, MOVE_060
	levelup_move 59, MOVE_073
	levelup_move 62, MOVE_048
	db $ff
Learnset_4ce7:: ; species 101 章魚怪
	levelup_move 4, MOVE_037
	levelup_move 9, MOVE_073
	levelup_move 15, MOVE_124
	levelup_move 20, MOVE_021
	levelup_move 26, MOVE_128
	levelup_move 31, MOVE_006
	levelup_move 37, MOVE_075
	levelup_move 42, MOVE_131
	levelup_move 46, MOVE_071
	levelup_move 50, MOVE_072
	levelup_move 56, MOVE_074
	levelup_move 60, MOVE_076
	levelup_move 64, MOVE_077
	db $ff
Learnset_4d02:: ; species 102 水妖
	levelup_move 7, MOVE_072
	levelup_move 14, MOVE_073
	levelup_move 19, MOVE_074
	levelup_move 21, MOVE_017
	levelup_move 24, MOVE_013
	levelup_move 29, MOVE_029
	levelup_move 30, MOVE_075
	levelup_move 36, MOVE_129
	levelup_move 39, MOVE_130
	levelup_move 44, MOVE_136
	levelup_move 49, MOVE_076
	levelup_move 53, MOVE_077
	levelup_move 58, MOVE_078
	levelup_move 61, MOVE_079
	db $ff
Learnset_4d1f:: ; species 103 蟹居獸
	levelup_move 5, MOVE_037
	levelup_move 12, MOVE_009
	levelup_move 19, MOVE_110
	levelup_move 20, MOVE_001
	levelup_move 25, MOVE_071
	levelup_move 32, MOVE_112
	levelup_move 45, MOVE_073
	levelup_move 50, MOVE_072
	levelup_move 54, MOVE_074
	levelup_move 59, MOVE_075
	levelup_move 62, MOVE_076
	db $ff
Learnset_4d36:: ; species 104 水精靈
	levelup_move 6, MOVE_071
	levelup_move 13, MOVE_037
	levelup_move 18, MOVE_115
	levelup_move 20, MOVE_012
	levelup_move 24, MOVE_010
	levelup_move 27, MOVE_077
	levelup_move 30, MOVE_017
	levelup_move 33, MOVE_076
	levelup_move 42, MOVE_078
	levelup_move 47, MOVE_072
	levelup_move 50, MOVE_073
	levelup_move 55, MOVE_074
	levelup_move 61, MOVE_075
	db $ff
Learnset_4d51:: ; species 105 巨獸龜
	levelup_move 3, MOVE_012
	levelup_move 9, MOVE_015
	levelup_move 15, MOVE_041
	levelup_move 22, MOVE_071
	levelup_move 26, MOVE_134
	levelup_move 31, MOVE_073
	levelup_move 35, MOVE_077
	levelup_move 40, MOVE_110
	levelup_move 43, MOVE_079
	levelup_move 48, MOVE_072
	levelup_move 52, MOVE_074
	levelup_move 56, MOVE_075
	levelup_move 61, MOVE_076
	levelup_move 65, MOVE_078
	db $ff
Learnset_4d6e:: ; species 106 咕嚕妖
	levelup_move 5, MOVE_043
	levelup_move 9, MOVE_076
	levelup_move 14, MOVE_060
	levelup_move 17, MOVE_023
	levelup_move 25, MOVE_072
	levelup_move 30, MOVE_050
	levelup_move 37, MOVE_032
	levelup_move 42, MOVE_078
	levelup_move 46, MOVE_071
	levelup_move 50, MOVE_073
	levelup_move 53, MOVE_074
	levelup_move 58, MOVE_075
	levelup_move 62, MOVE_079
	db $ff
Learnset_4d89:: ; species 107 蚌殼獸
	levelup_move 4, MOVE_012
	levelup_move 9, MOVE_037
	levelup_move 13, MOVE_031
	levelup_move 16, MOVE_027
	levelup_move 19, MOVE_041
	levelup_move 21, MOVE_126
	levelup_move 26, MOVE_128
	levelup_move 32, MOVE_020
	levelup_move 35, MOVE_032
	levelup_move 40, MOVE_075
	levelup_move 44, MOVE_072
	levelup_move 48, MOVE_073
	levelup_move 52, MOVE_074
	levelup_move 56, MOVE_076
	levelup_move 60, MOVE_077
	db $ff
Learnset_4da8:: ; species 108 小綿羊
	levelup_move 4, MOVE_019
	levelup_move 15, MOVE_087
	levelup_move 17, MOVE_037
	levelup_move 24, MOVE_015
	levelup_move 28, MOVE_088
	levelup_move 31, MOVE_035
	levelup_move 38, MOVE_109
	levelup_move 44, MOVE_135
	levelup_move 49, MOVE_097
	levelup_move 54, MOVE_098
	levelup_move 58, MOVE_089
	levelup_move 62, MOVE_091
	db $ff
Learnset_4dc1:: ; species 109 紅螞蟻
	levelup_move 9, MOVE_093
	levelup_move 17, MOVE_037
	levelup_move 26, MOVE_012
	levelup_move 29, MOVE_095
	levelup_move 31, MOVE_036
	levelup_move 34, MOVE_099
	levelup_move 40, MOVE_119
	levelup_move 45, MOVE_140
	levelup_move 50, MOVE_010
	levelup_move 55, MOVE_022
	levelup_move 60, MOVE_032
	db $ff
Learnset_4dd8:: ; species 110 樹精
	levelup_move 5, MOVE_096
	levelup_move 8, MOVE_041
	levelup_move 11, MOVE_095
	levelup_move 15, MOVE_094
	levelup_move 20, MOVE_109
	levelup_move 26, MOVE_102
	levelup_move 33, MOVE_101
	levelup_move 41, MOVE_100
	levelup_move 45, MOVE_135
	levelup_move 49, MOVE_093
	levelup_move 54, MOVE_097
	levelup_move 59, MOVE_098
	levelup_move 62, MOVE_099
	db $ff
Learnset_4df3:: ; species 111 毛毛
	levelup_move 4, MOVE_019
	levelup_move 7, MOVE_009
	levelup_move 11, MOVE_023
	levelup_move 16, MOVE_102
	levelup_move 20, MOVE_094
	levelup_move 24, MOVE_029
	levelup_move 30, MOVE_040
	levelup_move 35, MOVE_096
	levelup_move 40, MOVE_126
	levelup_move 41, MOVE_130
	levelup_move 44, MOVE_084
	levelup_move 49, MOVE_093
	levelup_move 55, MOVE_095
	levelup_move 58, MOVE_097
	levelup_move 62, MOVE_098
	db $ff
Learnset_4e12:: ; species 112 紅毛怪
	levelup_move 10, MOVE_011
	levelup_move 16, MOVE_023
	levelup_move 21, MOVE_035
	levelup_move 24, MOVE_029
	levelup_move 25, MOVE_094
	levelup_move 29, MOVE_018
	levelup_move 31, MOVE_102
	levelup_move 34, MOVE_006
	levelup_move 37, MOVE_040
	levelup_move 43, MOVE_098
	levelup_move 49, MOVE_093
	levelup_move 56, MOVE_095
	levelup_move 61, MOVE_097
	db $ff
Learnset_4e2d:: ; species 113 泰山
	levelup_move 8, MOVE_037
	levelup_move 18, MOVE_095
	levelup_move 21, MOVE_023
	levelup_move 25, MOVE_128
	levelup_move 27, MOVE_096
	levelup_move 34, MOVE_129
	levelup_move 36, MOVE_029
	levelup_move 42, MOVE_131
	levelup_move 45, MOVE_053
	levelup_move 51, MOVE_055
	levelup_move 56, MOVE_057
	levelup_move 61, MOVE_058
	db $ff
Learnset_4e46:: ; species 114 絨球獸
	levelup_move 3, MOVE_019
	levelup_move 9, MOVE_008
	levelup_move 14, MOVE_126
	levelup_move 20, MOVE_024
	levelup_move 24, MOVE_100
	levelup_move 26, MOVE_022
	levelup_move 37, MOVE_099
	levelup_move 42, MOVE_097
	levelup_move 48, MOVE_101
	levelup_move 55, MOVE_098
	levelup_move 60, MOVE_102
	db $ff
Learnset_4e5d:: ; species 115 老山羊
	levelup_move 4, MOVE_019
	levelup_move 15, MOVE_087
	levelup_move 17, MOVE_037
	levelup_move 24, MOVE_015
	levelup_move 28, MOVE_088
	levelup_move 31, MOVE_035
	levelup_move 38, MOVE_109
	levelup_move 44, MOVE_135
	levelup_move 50, MOVE_092
	levelup_move 54, MOVE_097
	levelup_move 59, MOVE_098
	levelup_move 61, MOVE_134
	db $ff
Learnset_4e76:: ; species 116 怯膽茸
	levelup_move 10, MOVE_011
	levelup_move 16, MOVE_023
	levelup_move 21, MOVE_035
	levelup_move 24, MOVE_029
	levelup_move 25, MOVE_094
	levelup_move 29, MOVE_018
	levelup_move 31, MOVE_102
	levelup_move 34, MOVE_006
	levelup_move 37, MOVE_040
	levelup_move 43, MOVE_098
	levelup_move 48, MOVE_100
	levelup_move 55, MOVE_101
	db $ff
Learnset_4e8f:: ; species 117 機械鳥
	levelup_move 4, MOVE_030
	levelup_move 6, MOVE_019
	levelup_move 12, MOVE_003
	levelup_move 16, MOVE_035
	levelup_move 18, MOVE_004
	levelup_move 20, MOVE_015
	levelup_move 25, MOVE_040
	levelup_move 33, MOVE_005
	levelup_move 40, MOVE_117
	levelup_move 42, MOVE_114
	levelup_move 46, MOVE_115
	levelup_move 51, MOVE_116
	levelup_move 56, MOVE_117
	levelup_move 61, MOVE_118
	levelup_move 63, MOVE_122
	levelup_move 64, MOVE_123
	db $ff
Learnset_4eb0:: ; species 118 飛馬
	levelup_move 5, MOVE_008
	levelup_move 10, MOVE_021
	levelup_move 13, MOVE_134
	levelup_move 16, MOVE_037
	levelup_move 19, MOVE_114
	levelup_move 24, MOVE_007
	levelup_move 27, MOVE_132
	levelup_move 30, MOVE_032
	levelup_move 34, MOVE_122
	levelup_move 35, MOVE_123
	levelup_move 40, MOVE_115
	levelup_move 46, MOVE_116
	levelup_move 51, MOVE_117
	levelup_move 57, MOVE_118
	levelup_move 62, MOVE_022
	db $ff
Learnset_4ecf:: ; species 119 笨笨鳥
	levelup_move 10, MOVE_114
	levelup_move 16, MOVE_124
	levelup_move 25, MOVE_115
	levelup_move 31, MOVE_010
	levelup_move 33, MOVE_116
	levelup_move 36, MOVE_137
	levelup_move 43, MOVE_136
	levelup_move 47, MOVE_113
	levelup_move 52, MOVE_117
	levelup_move 57, MOVE_038
	levelup_move 61, MOVE_118
	db $ff
Learnset_4ee6:: ; species 120 青蛟
	levelup_move 10, MOVE_030
	levelup_move 16, MOVE_011
	levelup_move 24, MOVE_022
	levelup_move 33, MOVE_122
	levelup_move 35, MOVE_123
	levelup_move 39, MOVE_036
	levelup_move 40, MOVE_020
	levelup_move 42, MOVE_132
	levelup_move 44, MOVE_130
	levelup_move 47, MOVE_114
	levelup_move 52, MOVE_115
	levelup_move 57, MOVE_116
	levelup_move 61, MOVE_117
	levelup_move 64, MOVE_118
	db $ff
Learnset_4f03:: ; species 121 插翅兔
	levelup_move 4, MOVE_039
	levelup_move 10, MOVE_011
	levelup_move 18, MOVE_114
	levelup_move 20, MOVE_110
	levelup_move 24, MOVE_066
	levelup_move 30, MOVE_115
	levelup_move 35, MOVE_116
	levelup_move 41, MOVE_118
	levelup_move 46, MOVE_117
	levelup_move 51, MOVE_134
	levelup_move 56, MOVE_014
	levelup_move 61, MOVE_030
	db $ff
Learnset_4f1c:: ; species 122 天精靈
	levelup_move 10, MOVE_007
	levelup_move 15, MOVE_126
	levelup_move 21, MOVE_129
	levelup_move 26, MOVE_040
	levelup_move 34, MOVE_027
	levelup_move 38, MOVE_118
	levelup_move 43, MOVE_122
	levelup_move 44, MOVE_123
	levelup_move 50, MOVE_114
	levelup_move 54, MOVE_115
	levelup_move 59, MOVE_116
	levelup_move 62, MOVE_117
	db $ff
Learnset_4f35:: ; species 123 天龍
	levelup_move 11, MOVE_026
	levelup_move 14, MOVE_023
	levelup_move 17, MOVE_017
	levelup_move 19, MOVE_003
	levelup_move 24, MOVE_122
	levelup_move 34, MOVE_018
	levelup_move 38, MOVE_123
	levelup_move 44, MOVE_117
	levelup_move 51, MOVE_114
	levelup_move 57, MOVE_115
	levelup_move 63, MOVE_116
	db $ff
Learnset_4f4c:: ; species 124 飛天妖
	levelup_move 7, MOVE_008
	levelup_move 16, MOVE_032
	levelup_move 20, MOVE_039
	levelup_move 24, MOVE_111
	levelup_move 28, MOVE_115
	levelup_move 32, MOVE_134
	levelup_move 36, MOVE_122
	levelup_move 40, MOVE_123
	levelup_move 46, MOVE_114
	levelup_move 51, MOVE_116
	levelup_move 56, MOVE_117
	levelup_move 61, MOVE_118
	db $ff
Learnset_4f65:: ; species 125 比比鳥
	levelup_move 10, MOVE_114
	levelup_move 16, MOVE_124
	levelup_move 25, MOVE_115
	levelup_move 31, MOVE_010
	levelup_move 33, MOVE_116
	levelup_move 36, MOVE_137
	levelup_move 43, MOVE_136
	levelup_move 48, MOVE_117
	levelup_move 53, MOVE_030
	levelup_move 60, MOVE_118
	db $ff
Learnset_4f7a:: ; species 126 彩繪精
	levelup_move 9, MOVE_080
	levelup_move 15, MOVE_081
	levelup_move 21, MOVE_082
	levelup_move 28, MOVE_083
	levelup_move 34, MOVE_084
	levelup_move 40, MOVE_085
	levelup_move 45, MOVE_086
	levelup_move 48, MOVE_001
	levelup_move 53, MOVE_014
	levelup_move 58, MOVE_022
	levelup_move 61, MOVE_125
	levelup_move 64, MOVE_136
	db $ff
Learnset_4f93:: ; species 127 咖啡獸
	levelup_move 4, MOVE_019
	levelup_move 8, MOVE_080
	levelup_move 14, MOVE_014
	levelup_move 19, MOVE_012
	levelup_move 21, MOVE_033
	levelup_move 24, MOVE_040
	levelup_move 28, MOVE_081
	levelup_move 34, MOVE_082
	levelup_move 42, MOVE_034
	levelup_move 50, MOVE_083
	levelup_move 54, MOVE_084
	levelup_move 59, MOVE_085
	levelup_move 61, MOVE_086
	db $ff
Learnset_4fae:: ; species 128 石魔
	levelup_move 8, MOVE_007
	levelup_move 16, MOVE_015
	levelup_move 20, MOVE_019
	levelup_move 22, MOVE_002
	levelup_move 25, MOVE_041
	levelup_move 26, MOVE_010
	levelup_move 31, MOVE_011
	levelup_move 36, MOVE_038
	levelup_move 40, MOVE_084
	levelup_move 43, MOVE_080
	levelup_move 49, MOVE_081
	levelup_move 54, MOVE_082
	levelup_move 58, MOVE_083
	levelup_move 62, MOVE_085
	db $ff
Learnset_4fcb:: ; species 129 混江獸
	levelup_move 4, MOVE_012
	levelup_move 11, MOVE_016
	levelup_move 16, MOVE_083
	levelup_move 24, MOVE_013
	levelup_move 31, MOVE_082
	levelup_move 37, MOVE_086
	levelup_move 45, MOVE_131
	levelup_move 49, MOVE_081
	levelup_move 52, MOVE_124
	levelup_move 56, MOVE_084
	levelup_move 61, MOVE_085
	db $ff
Learnset_4fe2:: ; species 130 石星
	levelup_move 11, MOVE_080
	levelup_move 20, MOVE_029
	levelup_move 26, MOVE_081
	levelup_move 31, MOVE_082
	levelup_move 36, MOVE_040
	levelup_move 40, MOVE_083
	levelup_move 43, MOVE_084
	levelup_move 46, MOVE_005
	levelup_move 51, MOVE_086
	levelup_move 56, MOVE_036
	levelup_move 62, MOVE_085
	db $ff
Learnset_4ff9:: ; species 131 滾滾糢
	levelup_move 7, MOVE_019
	levelup_move 16, MOVE_080
	levelup_move 22, MOVE_014
	levelup_move 25, MOVE_040
	levelup_move 27, MOVE_010
	levelup_move 29, MOVE_041
	levelup_move 34, MOVE_082
	levelup_move 43, MOVE_084
	levelup_move 47, MOVE_081
	levelup_move 52, MOVE_083
	levelup_move 57, MOVE_086
	levelup_move 62, MOVE_085
	db $ff
Learnset_5012:: ; species 132 困途掌
	levelup_move 6, MOVE_026
	levelup_move 12, MOVE_036
	levelup_move 15, MOVE_021
	levelup_move 17, MOVE_080
	levelup_move 21, MOVE_081
	levelup_move 26, MOVE_011
	levelup_move 28, MOVE_082
	levelup_move 35, MOVE_036
	levelup_move 43, MOVE_083
	levelup_move 47, MOVE_084
	levelup_move 53, MOVE_050
	levelup_move 58, MOVE_086
	levelup_move 60, MOVE_056
	levelup_move 63, MOVE_085
	db $ff
Learnset_502f:: ; species 133 地底人
	levelup_move 6, MOVE_037
	levelup_move 13, MOVE_080
	levelup_move 16, MOVE_126
	levelup_move 20, MOVE_081
	levelup_move 24, MOVE_134
	levelup_move 29, MOVE_082
	levelup_move 33, MOVE_040
	levelup_move 40, MOVE_083
	levelup_move 45, MOVE_047
	levelup_move 51, MOVE_084
	levelup_move 57, MOVE_086
	levelup_move 62, MOVE_085
	db $ff
Learnset_5048:: ; species 134 玉玲瓏
	levelup_move 10, MOVE_021
	levelup_move 16, MOVE_081
	levelup_move 19, MOVE_082
	levelup_move 21, MOVE_083
	levelup_move 23, MOVE_084
	levelup_move 24, MOVE_018
	levelup_move 26, MOVE_003
	levelup_move 30, MOVE_085
	levelup_move 33, MOVE_086
	levelup_move 40, MOVE_127
	levelup_move 42, MOVE_130
	levelup_move 47, MOVE_080
	levelup_move 52, MOVE_006
	levelup_move 57, MOVE_026
	levelup_move 60, MOVE_036
	db $ff
Learnset_5067:: ; species 135 銷魂閹
	levelup_move 3, MOVE_013
	levelup_move 9, MOVE_029
	levelup_move 14, MOVE_113
	levelup_move 19, MOVE_040
	levelup_move 21, MOVE_134
	levelup_move 25, MOVE_110
	levelup_move 28, MOVE_041
	levelup_move 29, MOVE_010
	levelup_move 32, MOVE_105
	levelup_move 36, MOVE_090
	levelup_move 40, MOVE_137
	levelup_move 45, MOVE_108
	levelup_move 50, MOVE_097
	levelup_move 55, MOVE_104
	levelup_move 60, MOVE_107
	db $ff
Learnset_5086:: ; species 136 勾魂使
	levelup_move 6, MOVE_104
	levelup_move 12, MOVE_012
	levelup_move 17, MOVE_003
	levelup_move 22, MOVE_105
	levelup_move 25, MOVE_090
	levelup_move 30, MOVE_134
	levelup_move 33, MOVE_110
	levelup_move 38, MOVE_124
	levelup_move 45, MOVE_107
	levelup_move 51, MOVE_045
	levelup_move 56, MOVE_106
	levelup_move 61, MOVE_108
	db $ff
Learnset_509f:: ; species 137 木乃伊
	levelup_move 3, MOVE_008
	levelup_move 9, MOVE_026
	levelup_move 14, MOVE_037
	levelup_move 18, MOVE_041
	levelup_move 20, MOVE_103
	levelup_move 25, MOVE_019
	levelup_move 29, MOVE_104
	levelup_move 33, MOVE_106
	levelup_move 38, MOVE_006
	levelup_move 44, MOVE_107
	levelup_move 49, MOVE_112
	levelup_move 55, MOVE_105
	levelup_move 59, MOVE_110
	levelup_move 61, MOVE_108
	db $ff
Learnset_50bc:: ; species 138 魔蛋獸
	levelup_move 55, MOVE_125
	db $ff
Learnset_50bf:: ; species 139 布妖
	levelup_move 3, MOVE_040
	levelup_move 9, MOVE_029
	levelup_move 14, MOVE_134
	levelup_move 19, MOVE_013
	levelup_move 21, MOVE_113
	levelup_move 25, MOVE_110
	levelup_move 28, MOVE_010
	levelup_move 29, MOVE_041
	levelup_move 32, MOVE_105
	levelup_move 36, MOVE_090
	levelup_move 40, MOVE_137
	levelup_move 45, MOVE_108
	levelup_move 50, MOVE_016
	levelup_move 54, MOVE_036
	levelup_move 60, MOVE_107
	db $ff
Learnset_50de:: ; species 140 小惡魔
	levelup_move 6, MOVE_012
	levelup_move 9, MOVE_103
	levelup_move 14, MOVE_104
	levelup_move 21, MOVE_040
	levelup_move 24, MOVE_008
	levelup_move 28, MOVE_105
	levelup_move 33, MOVE_041
	levelup_move 37, MOVE_111
	levelup_move 42, MOVE_137
	levelup_move 45, MOVE_107
	levelup_move 49, MOVE_132
	levelup_move 53, MOVE_106
	levelup_move 58, MOVE_131
	levelup_move 63, MOVE_108
	db $ff
Learnset_50fb:: ; species 141 奪命蠍
	levelup_move 7, MOVE_019
	levelup_move 16, MOVE_080
	levelup_move 22, MOVE_014
	levelup_move 25, MOVE_040
	levelup_move 27, MOVE_010
	levelup_move 29, MOVE_041
	levelup_move 34, MOVE_082
	levelup_move 43, MOVE_084
	levelup_move 48, MOVE_015
	levelup_move 53, MOVE_109
	levelup_move 58, MOVE_105
	levelup_move 63, MOVE_107
	db $ff
Learnset_5114:: ; species 142 鏈鼠
	levelup_move 7, MOVE_110
	levelup_move 16, MOVE_031
	levelup_move 25, MOVE_105
	levelup_move 30, MOVE_113
	levelup_move 33, MOVE_006
	levelup_move 37, MOVE_005
	levelup_move 42, MOVE_022
	levelup_move 48, MOVE_045
	levelup_move 53, MOVE_106
	levelup_move 56, MOVE_111
	levelup_move 61, MOVE_108
	db $ff
Learnset_512b:: ; species 143 大頭鬼
	levelup_move 5, MOVE_044
	levelup_move 10, MOVE_030
	levelup_move 16, MOVE_037
	levelup_move 26, MOVE_105
	levelup_move 35, MOVE_136
	levelup_move 43, MOVE_106
	levelup_move 47, MOVE_003
	levelup_move 51, MOVE_052
	levelup_move 56, MOVE_109
	levelup_move 59, MOVE_107
	levelup_move 62, MOVE_108
	db $ff
Learnset_5142:: ; species 144 時空獸
	levelup_move 6, MOVE_011
	levelup_move 17, MOVE_003
	levelup_move 20, MOVE_008
	levelup_move 24, MOVE_023
	levelup_move 26, MOVE_087
	levelup_move 30, MOVE_035
	levelup_move 33, MOVE_015
	levelup_move 37, MOVE_002
	levelup_move 41, MOVE_005
	levelup_move 45, MOVE_131
	levelup_move 49, MOVE_088
	levelup_move 55, MOVE_089
	levelup_move 59, MOVE_092
	levelup_move 62, MOVE_091
	db $ff
Learnset_515f:: ; species 145 音樂靈
	levelup_move 9, MOVE_092
	levelup_move 11, MOVE_128
	levelup_move 16, MOVE_087
	levelup_move 20, MOVE_134
	levelup_move 23, MOVE_119
	levelup_move 25, MOVE_089
	levelup_move 33, MOVE_020
	levelup_move 45, MOVE_090
	levelup_move 49, MOVE_088
	levelup_move 54, MOVE_091
	levelup_move 57, MOVE_120
	levelup_move 61, MOVE_121
	db $ff
Learnset_5178:: ; species 146 時間獸
	levelup_move 3, MOVE_037
	levelup_move 7, MOVE_008
	levelup_move 9, MOVE_021
	levelup_move 14, MOVE_029
	levelup_move 16, MOVE_087
	levelup_move 24, MOVE_126
	levelup_move 33, MOVE_130
	levelup_move 38, MOVE_121
	levelup_move 40, MOVE_127
	levelup_move 45, MOVE_088
	levelup_move 49, MOVE_089
	levelup_move 53, MOVE_092
	levelup_move 58, MOVE_091
	levelup_move 62, MOVE_090
	db $ff
Learnset_5195:: ; species 147 時間郎
	levelup_move 8, MOVE_037
	levelup_move 11, MOVE_009
	levelup_move 15, MOVE_019
	levelup_move 22, MOVE_132
	levelup_move 25, MOVE_022
	levelup_move 31, MOVE_125
	levelup_move 35, MOVE_087
	levelup_move 45, MOVE_121
	levelup_move 51, MOVE_113
	levelup_move 56, MOVE_135
	levelup_move 61, MOVE_091
	db $ff
Learnset_51ac:: ; species 148 金獅王
	levelup_move 9, MOVE_092
	levelup_move 11, MOVE_128
	levelup_move 16, MOVE_087
	levelup_move 20, MOVE_134
	levelup_move 23, MOVE_119
	levelup_move 25, MOVE_089
	levelup_move 33, MOVE_020
	levelup_move 45, MOVE_090
	levelup_move 50, MOVE_088
	levelup_move 53, MOVE_010
	levelup_move 58, MOVE_015
	levelup_move 63, MOVE_134
	db $ff
Learnset_51c5:: ; species 149 天眼
	levelup_move 7, MOVE_019
	levelup_move 14, MOVE_087
	levelup_move 18, MOVE_009
	levelup_move 20, MOVE_035
	levelup_move 24, MOVE_088
	levelup_move 25, MOVE_039
	levelup_move 28, MOVE_011
	levelup_move 29, MOVE_089
	levelup_move 30, MOVE_017
	levelup_move 32, MOVE_091
	levelup_move 38, MOVE_092
	levelup_move 44, MOVE_120
	levelup_move 49, MOVE_090
	levelup_move 55, MOVE_121
	levelup_move 61, MOVE_112
	db $ff
Learnset_51e4:: ; species 150 音樂獸
	levelup_move 9, MOVE_092
	levelup_move 11, MOVE_128
	levelup_move 16, MOVE_087
	levelup_move 20, MOVE_134
	levelup_move 23, MOVE_119
	levelup_move 25, MOVE_089
	levelup_move 33, MOVE_020
	levelup_move 45, MOVE_090
	levelup_move 49, MOVE_109
	levelup_move 54, MOVE_111
	levelup_move 59, MOVE_091
	levelup_move 62, MOVE_112
	db $ff
Learnset_51fd:: ; species 151 天行馬
	levelup_move 5, MOVE_008
	levelup_move 10, MOVE_022
	levelup_move 13, MOVE_015
	levelup_move 16, MOVE_037
	levelup_move 19, MOVE_114
	levelup_move 24, MOVE_007
	levelup_move 27, MOVE_132
	levelup_move 30, MOVE_032
	levelup_move 34, MOVE_122
	levelup_move 35, MOVE_123
	levelup_move 40, MOVE_115
	levelup_move 46, MOVE_116
	levelup_move 51, MOVE_117
	levelup_move 57, MOVE_118
	levelup_move 62, MOVE_014
Learnset_521b:: ; species 152 翻天龍
	levelup_move 11, MOVE_026
	levelup_move 14, MOVE_023
	levelup_move 17, MOVE_017
	levelup_move 19, MOVE_003
	levelup_move 24, MOVE_122
	levelup_move 34, MOVE_018
	levelup_move 38, MOVE_123
	levelup_move 44, MOVE_117
	levelup_move 48, MOVE_115
	levelup_move 53, MOVE_005
	levelup_move 58, MOVE_116
	levelup_move 63, MOVE_118
	db $ff
Learnset_5234:: ; species 153 
	db $ff
Learnset_5235:: ; species 154 狼人獸
	levelup_move 6, MOVE_011
	levelup_move 10, MOVE_049
	levelup_move 18, MOVE_019
	levelup_move 24, MOVE_063
	levelup_move 27, MOVE_050
	levelup_move 29, MOVE_039
	levelup_move 31, MOVE_010
	levelup_move 33, MOVE_061
	levelup_move 35, MOVE_040
	levelup_move 39, MOVE_022
	levelup_move 43, MOVE_138
	db $ff
Learnset_524c:: ; species 155 水魔人
	levelup_move 5, MOVE_013
	levelup_move 8, MOVE_071
	levelup_move 12, MOVE_012
	levelup_move 19, MOVE_072
	levelup_move 24, MOVE_015
	levelup_move 38, MOVE_078
	levelup_move 44, MOVE_075
	levelup_move 45, MOVE_139
	db $ff
Learnset_525d:: ; species 156 火魔人
	levelup_move 4, MOVE_012
	levelup_move 10, MOVE_048
	levelup_move 15, MOVE_065
	levelup_move 18, MOVE_003
	levelup_move 21, MOVE_125
	levelup_move 24, MOVE_032
	levelup_move 28, MOVE_027
	levelup_move 32, MOVE_131
	levelup_move 41, MOVE_069
	levelup_move 42, MOVE_034
	db $ff
Learnset_5272:: ; species 157 神秘獸
	levelup_move 11, MOVE_026
	levelup_move 14, MOVE_023
	levelup_move 17, MOVE_017
	levelup_move 19, MOVE_003
	levelup_move 24, MOVE_122
	levelup_move 34, MOVE_018
	levelup_move 38, MOVE_123
	levelup_move 44, MOVE_117
	db $ff
Learnset_5283:: ; species 158 懲罰者
	levelup_move 9, MOVE_003
	levelup_move 12, MOVE_011
	levelup_move 14, MOVE_050
	levelup_move 21, MOVE_119
	levelup_move 25, MOVE_059
	levelup_move 27, MOVE_062
	levelup_move 31, MOVE_051
	levelup_move 34, MOVE_041
	levelup_move 36, MOVE_005
	levelup_move 39, MOVE_061
	levelup_move 42, MOVE_060
	db $ff
Learnset_529a:: ; species 159 懲罰者
	levelup_move 9, MOVE_003
	levelup_move 12, MOVE_011
	levelup_move 14, MOVE_050
	levelup_move 21, MOVE_119
	levelup_move 25, MOVE_059
	levelup_move 27, MOVE_062
	levelup_move 31, MOVE_051
	levelup_move 34, MOVE_041
	levelup_move 36, MOVE_005
	levelup_move 39, MOVE_061
	levelup_move 42, MOVE_060
	db $ff
