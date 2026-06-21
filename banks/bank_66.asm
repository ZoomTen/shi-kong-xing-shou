G5_22_ObjectEvents:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_066_400c
	objects_end

Script_066_400c::
	dr $19800c, $198010
Script_066_4010::
	dr $198010, $198022

G5_21_ObjectEvents:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_066_4039
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_066_403d
	objects_end

Script_066_4039::
	dr $198039, $19803d

Script_066_403d::
	dr $19803d, $198041
Script_066_4041::
	dr $198041, $19804f
Script_066_404f::
	dr $19804f, $1980bb
Script_066_40bb::
	dr $1980bb, $1980c9

G5_02_ObjectEvents3:
	dr $1980c9, $1980d5

Script_066_40d5::
	dr $1980d5, $198172

Script_066_4172::
	dr $198172, $198176

G5_18_ObjectEvents:
	dr $198176, $198182

Script_066_4182::
	dr $198182, $1981af

G5_16_ObjectEvents:
	object_event $12,  1,  5, 0, $00, $00, $00, $00, Script_066_4172
	object_event $25, 16,  3, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $22, 20,  3, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end
Script_066_41d1::
	dr $1981d1, $1981df
Script_066_41df::
	dr $1981df, $1981f2

Script_066_41f2::
	end

G5_01_ObjectEvents:
G5_02_ObjectEvents:
G5_08_ObjectEvents:
G5_09_ObjectEvents:
G5_0A_ObjectEvents:
G5_0C_ObjectEvents:
G5_0E_ObjectEvents:
G5_15_ObjectEvents3:
G5_17_ObjectEvents:
G5_19_ObjectEvents:
G5_1A_ObjectEvents:
G5_1C_ObjectEvents:
G5_23_ObjectEvents:
G5_27_ObjectEvents:
	objects_end

G5_1B_ObjectEvents:
	object_event $12, 23,  3, 0, $00, $00, $00, $00, Script_066_4200
	objects_end

Script_066_4200::
	dr $198200, $198204
Script_066_4204::
	dr $198204, $19820f

G5_07_ObjectEvents:
	dr $19820f, $19827e

Script_066_427e::
	dr $19827e, $19828a

Script_066_428a::
	dr $19828a, $19828e

Script_066_428e::
	dr $19828e, $198292
Script_066_4292::
	dr $198292, $1982a0

Script_066_42a0::
	dr $1982a0, $1982cf
Script_066_42cf::
	dr $1982cf, $1982ee

Script_066_42ee::
	dr $1982ee, $198323

Script_066_4323::
	dr $198323, $198331

Script_066_4331::
	dr $198331, $198335

Script_066_4335::
	dr $198335, $198339

Script_066_4339::
	dr $198339, $19833d

Script_066_433d::
	dr $19833d, $198341

G5_1E_ObjectEvents:
	object_event $1d,  5,  3, 0, $00, $00, $00, $00, Script_066_436b
	object_event $1a,  6,  6, 0, $00, $00, $00, $01, Script_066_4358
	objects_end

Script_066_4358::
	dr $198358, $19836b

Script_066_436b::
	dr $19836b, $1983a3

G5_1F_ObjectEvents2:
	object_event $20,  4,  3, 0, $00, $00, $00, $00, Script_066_43dd
	object_event $19,  5,  5, 0, $00, $00, $00, $01, Script_066_4440
	objects_end

G5_1F_ObjectEvents:
	dr $1983ba, $1983dd

Script_066_43dd::
	dr $1983dd, $198440

Script_066_4440::
	dr $198440, $198444

Script_066_4444::
	dr $198444, $19846a

G5_27_ObjectEvents4:
	dr $19846a, $198476

G5_27_ObjectEvents3:
	object_event $73,  6,  6, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end

G5_27_ObjectEvents2:
	object_event $73,  4,  8, 0, $00, $00, $00, $00, Script_066_41f2
	objects_end
Script_066_448e::
	dr $19848e, $198510

G5_20_ObjectEvents:
	object_event $16,  7,  6, 0, $00, $00, $08, $00, Script_066_451c
	objects_end

Script_066_451c::
	dr $19851c, $198520

G5_10_ObjectEvents:
	object_event $23,  8,  2, 0, $00, $00, $00, $00, Script_066_454d
	object_event $25,  5,  4, 0, $00, $00, $06, $01, Script_066_4537
	objects_end

Script_066_4537::
	dr $198537, $198545
Script_066_4545::
	spriteface  2, FACE_LEFT
	farjump Script_066_454d
	end

Script_066_454d::
	dr $19854d, $19856f

G5_0F_ObjectEvents:
	object_event $1b,  2,  6, 0, $00, $00, $00, $00, Script_066_458e
	object_event $21,  8,  4, 0, $00, $00, $06, $01, Script_066_45b6
	objects_end
Script_066_4586::
	dr $198586, $19858e

Script_066_458e::
	dr $19858e, $1985b6

Script_066_45b6::
	dr $1985b6, $1985ba

G5_11_ObjectEvents:
	object_event $13,  2,  6, 0, $00, $00, $00, $00, Script_066_45c6
	objects_end

Script_066_45c6::
	dr $1985c6, $1985cd

G5_12_ObjectEvents:
	dr $1985cd, $1985ef

Script_066_45ef::
	dr $1985ef, $1985f3

Script_066_45f3::
	dr $1985f3, $1985f7

Script_066_45f7::
	dr $1985f7, $1985fb

G5_13_ObjectEvents:
	object_event $12,  2,  3, 0, $00, $00, $00, $00, Script_066_461d
	object_event $14,  6,  3, 0, $00, $00, $00, $01, Script_066_4621
	object_event $17,  9,  6, 0, $00, $00, $05, $02, Script_066_4625
	objects_end

Script_066_461d::
	dr $19861d, $198621

Script_066_4621::
	dr $198621, $198625

Script_066_4625::
	dr $198625, $198629

G5_14_ObjectEvents:
	object_event $16,  4,  5, 0, $00, $00, $00, $00, Script_066_4640
	object_event $1f,  6,  3, 0, $00, $00, $00, $01, Script_066_465c
	objects_end

Script_066_4640::
	dr $198640, $19865c

Script_066_465c::
	dr $19865c, $198660

G5_24_ObjectEvents:
	object_event $22,  6, 10, 0, $00, $00, $00, $00, Script_066_466c
	objects_end

Script_066_466c::
	dr $19866c, $198670

G5_25_ObjectEvents:
	object_event $1e,  5,  5, 0, $00, $00, $00, $00, Script_066_467c
	objects_end

Script_066_467c::
	dr $19867c, $198680

G5_26_ObjectEvents:
	object_event $24,  6,  3, 0, $00, $00, $00, $00, Script_066_468c
	objects_end

Script_066_468c::
	dr $19868c, $1986c0

G5_1D_ObjectEvents:
	object_event $18,  6,  4, 0, $00, $00, $00, $00, Script_066_46cc
	objects_end

Script_066_46cc::
	dr $1986cc, $1987b2

Script_066_47b2::
	dr $1987b2, $1987b6

G5_1A_ObjectEvents2:
	object_event $27,  5,  5, 0, $00, $00, $00, $00, Script_066_4869
	object_event $28,  4,  5, 0, $00, $00, $00, $01, Script_066_4869
	objects_end
Script_066_47cd::
	dr $1987cd, $198869

Script_066_4869::
	dr $198869, $1988bb

G5_02_ObjectEvents2:
	object_event $0e, 15, 23, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $31, 18, 23, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $14, 16, 23, 0, $00, $00, $00, $02, Script_066_41f2
	object_event $0f, 14, 23, 0, $00, $00, $00, $03, Script_066_41f2
	object_event $57, 16, 15, 0, $00, $00, $00, $04, Script_066_41f2
	objects_end

G5_15_ObjectEvents:
	object_event $6f,  5,  3, 0, $00, $00, $00, $00, Script_066_495f
	object_event $13,  6,  2, 0, $00, $00, $00, $01, Script_066_4937
	object_event $0f,  4,  2, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

G5_15_ObjectEvents2:
	object_event $0e,  6,  3, 0, $00, $00, $00, $00, Script_066_41f2
	object_event $13,  7,  3, 0, $00, $00, $00, $01, Script_066_41f2
	object_event $0f,  6,  2, 0, $00, $00, $00, $02, Script_066_41f2
	objects_end

Script_066_4937::
	dr $198937, $19895f

Script_066_495f::
	dr $19895f, $198aa8

G5_1D_ObjectEvents2:
	dr $198aa8, $198aca
Script_066_4aca::
	dr $198aca, $198ad8

G5_0E_ObjectEvents2:
	dr $198ad8, $198aef
Script_066_4aef::
	dr $198aef, $198b24

G5_0B_ObjectEvents:
	dr $198b24, $198b53

Script_066_4b53::
	dr $198b53, $198bb1
Script_066_4bb1::
	dr $198bb1, $198bc5

Script_066_4bc5::
	dr $198bc5, $198bc9

Script_066_4bc9::
	dr $198bc9, $198c3e

G5_1D_ObjectEvents3:
	dr $198c3e, $198c61

G5_0D_ObjectEvents:
	object_event $0e,  4,  2, 0, $00, $00, $00, $00, Script_066_4bc5
	object_event $0f,  4,  3, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end

G5_0D_ObjectEvents2:
	object_event $6f,  4,  2, 0, $00, $00, $00, $00, Script_066_4bc9
	object_event $0f,  4,  3, 0, $00, $00, $00, $01, Script_066_41f2
	objects_end
Script_066_4c8f::
	dr $198c8f, $19be50
