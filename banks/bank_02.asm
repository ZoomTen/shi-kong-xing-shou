Func_002_4000:
	jp SoundEngine1_Play

Func_002_4003:
	jp SoundEngine1_Load

Func_002_4006:
	jp SoundEngine1_Init

Func_002_4009:
	jp SoundEngine1_Unknown

unk_002_400c:
	dr $800c, $8035

SoundEngine1_Unknown:
	dr $8035, $808d

SoundEngine1_HeaderPointers:
	dw unk_002_418b
	dw unk_002_418f
	dw unk_002_4193
	dw unk_002_4197
	dw unk_002_419b
	dw unk_002_41a1
	dw unk_002_41a5
	dw unk_002_41ab
	dw unk_002_41b1
	dw unk_002_41b7
	dw unk_002_418b
	dw unk_002_422b
	dw unk_002_4235
	dw unk_002_41bd
	dw unk_002_41c1
	dw unk_002_41c5
	dw unk_002_41c9
	dw unk_002_41cd
	dw unk_002_41d1
	dw unk_002_41d5
	dw unk_002_41db
	dw unk_002_41df
	dw unk_002_41e3
	dw unk_002_41e7
	dw unk_002_41eb
	dw unk_002_41f1
	dw unk_002_41f5
	dw unk_002_41f9
	dw unk_002_41fd
	dw unk_002_4201
	dw unk_002_4205
	dw unk_002_4209
	dw unk_002_420d
	dw unk_002_4211
	dw unk_002_4215
	dw unk_002_421b
	dw unk_002_4221
	dw unk_002_4225
	dw unk_002_423f
	dw unk_002_4247
	dw unk_002_424b
	dw unk_002_424f
	dw unk_002_4255
	dw unk_002_4259
	dw unk_002_425f
	dw unk_002_4265
	dw unk_002_426f
	dw unk_002_4273
	dw unk_002_4277
	dw unk_002_427b
	dw unk_002_427f
	dw unk_002_4289
	dw unk_002_4283
	dw unk_002_429d
	dw unk_002_42a1
	dw unk_002_4299
	dw unk_002_42a9
	dw unk_002_42ad
	dw unk_002_4243
	dw unk_002_42c5
	dw unk_002_42b1
	dw unk_002_42b5
	dw unk_002_42b9
	dw unk_002_42bd
	dw unk_002_42c1
	dw unk_002_42e5
	dw unk_002_42eb
	dw unk_002_42f3
	dw unk_002_42fb
	dw unk_002_4301
	dw unk_002_4305
	dw unk_002_42f7
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_42c9
	dw unk_002_42cd
	dw unk_002_42d1
	dw unk_002_42d5
	dw unk_002_42d9
	dw unk_002_42dd
	dw unk_002_42e1
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw Music_Town1
	dw Music_Battle1
	dw Music_Blackout
	dw Music_Ship
	dw Music_Forest
	dw Music_Town3
	dw Music_Battle2
	dw Music_Town4
	dw Music_Battle3
	dw Music_Battle4
	dw Music_Routes1
	dw Music_Stargazing
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw unk_002_41a5
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0

unk_002_418b:
	db $0
	db $0
	dw unk_002_4ecc

unk_002_418f:
	db $80
	db $0
	dw unk_002_4ecd

unk_002_4193:
	db $80
	db $0
	dw unk_002_4ed6

unk_002_4197:
	db $80
	db $0
	dw unk_002_4edf

unk_002_419b:
	db $c0
	db $0
	dw unk_002_4ee8
	dw unk_002_4edf

unk_002_41a1:
	db $80
	db $0
	dw unk_002_4ef7

unk_002_41a5:
	db $c0
	db $0
	dw unk_002_4f04
	dw unk_002_4ecd

unk_002_41ab:
	db $c0
	db $0
	dw unk_002_4f21
	dw unk_002_4ecd

unk_002_41b1:
	db $c0
	db $0
	dw unk_002_4f3c
	dw unk_002_4ecd

unk_002_41b7:
	db $c0
	db $0
	dw unk_002_4f54
	dw unk_002_4ecd

unk_002_41bd:
	db $10
	db $4
	dw unk_002_515e

unk_002_41c1:
	db $80
	db $4
	dw unk_002_516c

unk_002_41c5:
	db $80
	db $4
	dw unk_002_5188

unk_002_41c9:
	db $10
	db $3
	dw unk_002_51ad

unk_002_41cd:
	db $10
	db $3
	dw unk_002_51be

unk_002_41d1:
	db $10
	db $a
	dw unk_002_51d0

unk_002_41d5:
	db $90
	db $b
	dw unk_002_51e5
	dw unk_002_51f7

unk_002_41db:
	db $10
	db $c
	dw unk_002_5212

unk_002_41df:
	db $80
	db $5
	dw unk_002_522e

unk_002_41e3:
	db $80
	db $9
	dw unk_002_523d

unk_002_41e7:
	db $10
	db $a
	dw unk_002_525f

unk_002_41eb:
	db $30
	db $a
	dw unk_002_526e
	dw unk_002_527a

unk_002_41f1:
	db $10
	db $a
	dw unk_002_5288

unk_002_41f5:
	db $10
	db $a
	dw unk_002_5293

unk_002_41f9:
	db $10
	db $3
	dw unk_002_52ab

unk_002_41fd:
	db $10
	db $7
	dw unk_002_52bc

unk_002_4201:
	db $80
	db $4
	dw unk_002_52e7

unk_002_4205:
	db $80
	db $a
	dw unk_002_52f3

unk_002_4209:
	db $80
	db $7
	dw unk_002_5308

unk_002_420d:
	db $80
	db $4
	dw unk_002_5331

unk_002_4211:
	db $10
	db $4
	dw unk_002_5347

unk_002_4215:
	db $30
	db $a
	dw unk_002_535d
	dw unk_002_5352

unk_002_421b:
	db $30
	db $a
	dw unk_002_5387
	dw unk_002_5368

unk_002_4221:
	db $80
	db $8
	dw unk_002_53ab

unk_002_4225:
	db $90
	db $9
	dw unk_002_53c1
	dw unk_002_53dd

unk_002_422b:
	db $f0
	db $4
	dw unk_002_4ecc
	dw unk_002_4ecc
	dw unk_002_4ecc
	dw unk_002_4ecc

unk_002_4235:
	db $f0
	db $f
	dw unk_002_4ecc
	dw unk_002_4ecc
	dw unk_002_4ecc
	dw unk_002_4ecc

unk_002_423f:
	db $80
	db $4
	dw unk_002_54e3

unk_002_4243:
	db $80
	db $4
	dw unk_002_54ef

unk_002_4247:
	db $80
	db $1
	dw unk_002_551b

unk_002_424b:
	db $10
	db $2
	dw unk_002_553b

unk_002_424f:
	db $30
	db $4
	dw unk_002_5cf6
	dw unk_002_5d38

unk_002_4255:
	db $10
	db $7
	dw unk_002_5548

unk_002_4259:
	db $90
	db $9
	dw unk_002_555d
	dw unk_002_5577

unk_002_425f:
	db $90
	db $9
	dw unk_002_55a6
	dw unk_002_55c7

unk_002_4265:
	db $f0
	db $f
	dw unk_002_551a
	dw unk_002_5503
	dw unk_002_551a
	dw unk_002_551a

unk_002_426f:
	db $80
	db $4
	dw unk_002_5603

unk_002_4273:
	db $80
	db $4
	dw unk_002_561f

unk_002_4277:
	db $10
	db $4
	dw unk_002_5644

unk_002_427b:
	db $10
	db $3
	dw unk_002_5652

unk_002_427f:
	db $10
	db $3
	dw unk_002_5696

unk_002_4283:
	db $30
	db $4
	dw unk_002_574f
	dw unk_002_577c

unk_002_4289:
	db $10
	db $3
	dw unk_002_56c6
	db $10
	db $3
	dw unk_002_5788
	db $b0
	db $3
	dw unk_002_582d
	dw unk_002_5855
	dw unk_002_585f

unk_002_4299:
	db $1
	db $3
	dw unk_002_58b0

unk_002_429d:
	db $1
	db $3
	dw unk_002_58be

unk_002_42a1:
	db $b0
	db $3
	dw unk_002_591f
	dw unk_002_5985
	dw unk_002_598f

unk_002_42a9:
	db $80
	db $4
	dw unk_002_5d44

unk_002_42ad:
	db $10
	db $4
	dw unk_002_5d52

unk_002_42b1:
	db $80
	db $4
	dw unk_002_5d91

unk_002_42b5:
	db $80
	db $4
	dw unk_002_5db2

unk_002_42b9:
	db $80
	db $4
	dw unk_002_5ddf

unk_002_42bd:
	db $80
	db $4
	dw unk_002_5e0b

unk_002_42c1:
	db $10
	db $4
	dw unk_002_5e21

unk_002_42c5:
	db $80
	db $4
	dw unk_002_5e3b

unk_002_42c9:
	db $80
	db $2
	dw unk_002_5439

unk_002_42cd:
	db $80
	db $2
	dw unk_002_5465

unk_002_42d1:
	db $80
	db $1
	dw unk_002_5482

unk_002_42d5:
	db $80
	db $1
	dw unk_002_548e

unk_002_42d9:
	db $80
	db $1
	dw unk_002_549e

unk_002_42dd:
	db $10
	db $c
	dw unk_002_54ac

unk_002_42e1:
	db $80
	db $2
	dw unk_002_54d3

unk_002_42e5:
	db $a0
	db $3
	dw unk_002_5bd1
	dw unk_002_5bb5

unk_002_42eb:
	db $b0
	db $9
	dw unk_002_5bfb
	dw unk_002_5c30
	dw unk_002_5c6d

unk_002_42f3:
	db $10
	db $2
	dw unk_002_5c98

unk_002_42f7:
	db $10
	db $1
	dw unk_002_5cee

unk_002_42fb:
	db $30
	db $2
	dw unk_002_5ca2
	dw unk_002_5cae

unk_002_4301:
	db $10
	db $1
	dw unk_002_5cbc

unk_002_4305:
	db $10
	db $1
	dw unk_002_5cdb

Music_Town1:
	db $f
	db $0
	dw Music_Town1_Ch1
	dw Music_Town1_Ch2
	dw Music_Town1_Ch3
	dw Music_Town1_Ch4

Music_Battle1:
	db $f
	db $0
	dw Music_Battle1_Ch1
	dw Music_Battle1_Ch2
	dw Music_Battle1_Ch3
	dw Music_Battle1_Ch4

Music_Blackout:
	db $f
	db $0
	dw Music_Blackout_Ch1
	dw Music_Blackout_Ch2
	dw Music_Blackout_Ch3
	dw Music_Blackout_Ch4

Music_Ship:
	db $f
	db $0
	dw Music_Ship_Ch1
	dw Music_Ship_Ch2
	dw Music_Ship_Ch3
	dw Music_Ship_Ch4

Music_Forest:
	db $f
	db $0
	dw Music_Forest_Ch1
	dw Music_Forest_Ch2
	dw Music_Forest_Ch3
	dw Music_Forest_Ch4

Music_Town3:
	db $f
	db $0
	dw Music_Town3_Ch1
	dw Music_Town3_Ch2
	dw Music_Town3_Ch3
	dw Music_Town3_Ch4

Music_Battle2:
	db $f
	db $0
	dw Music_Battle2_Ch1
	dw Music_Battle2_Ch2
	dw Music_Battle2_Ch3
	dw Music_Battle2_Ch4

Music_Town4:
	db $f
	db $0
	dw Music_Town4_Ch1
	dw Music_Town4_Ch2
	dw Music_Town4_Ch3
	dw Music_Town4_Ch4

Music_Battle3:
	db $f
	db $0
	dw Music_Battle3_Ch1
	dw Music_Battle3_Ch2
	dw Music_Battle3_Ch3
	dw Music_Battle3_Ch4

Music_Battle4:
	db $f
	db $0
	dw Music_Battle4_Ch1
	dw Music_Battle4_Ch2
	dw Music_Battle4_Ch3
	dw Music_Battle4_Ch4

Music_Routes1:
	db $f
	db $0
	dw Music_Routes1_Ch1
	dw Music_Routes1_Ch2
	dw Music_Routes1_Ch3
	dw Music_Routes1_Ch4

Music_Stargazing:
	db $f
	db $0
	dw Music_Stargazing_Ch1
	dw Music_Stargazing_Ch2
	dw Music_Stargazing_Ch3
	dw Music_Stargazing_Ch4

	ds 30

SoundEngine1_Load:
	dr $839f, $8478

SoundEngine1_Play:
	dr $8478, $8d2d

SoundEngine1_Init:
	dr $8d2d, $8ecc

unk_002_4ecc::
	dr $8ecc, $8ecd

unk_002_4ecd::
	dr $8ecd, $8ed6

unk_002_4ed6::
	dr $8ed6, $8edf

unk_002_4edf::
	dr $8edf, $8ee8

unk_002_4ee8::
	dr $8ee8, $8ef7

unk_002_4ef7::
	dr $8ef7, $8f04

unk_002_4f04::
	dr $8f04, $8f21

unk_002_4f21::
	dr $8f21, $8f3c

unk_002_4f3c::
	dr $8f3c, $8f54

unk_002_4f54::
	dr $8f54, $915e

unk_002_515e::
	dr $915e, $916c

unk_002_516c::
	dr $916c, $9188

unk_002_5188::
	dr $9188, $91ad

unk_002_51ad::
	dr $91ad, $91be

unk_002_51be::
	dr $91be, $91d0

unk_002_51d0::
	dr $91d0, $91e5

unk_002_51e5::
	dr $91e5, $91f7

unk_002_51f7::
	dr $91f7, $9212

unk_002_5212::
	dr $9212, $922e

unk_002_522e::
	dr $922e, $923d

unk_002_523d::
	dr $923d, $925f

unk_002_525f::
	dr $925f, $926e

unk_002_526e::
	dr $926e, $927a

unk_002_527a::
	dr $927a, $9288

unk_002_5288::
	dr $9288, $9293

unk_002_5293::
	dr $9293, $92ab

unk_002_52ab::
	dr $92ab, $92bc

unk_002_52bc::
	dr $92bc, $92e7

unk_002_52e7::
	dr $92e7, $92f3

unk_002_52f3::
	dr $92f3, $9308

unk_002_5308::
	dr $9308, $9331

unk_002_5331::
	dr $9331, $9347

unk_002_5347::
	dr $9347, $9352

unk_002_5352::
	dr $9352, $935d

unk_002_535d::
	dr $935d, $9368

unk_002_5368::
	dr $9368, $9387

unk_002_5387::
	dr $9387, $93ab

unk_002_53ab::
	dr $93ab, $93c1

unk_002_53c1::
	dr $93c1, $93dd

unk_002_53dd::
	dr $93dd, $9439

unk_002_5439::
	dr $9439, $9465

unk_002_5465::
	dr $9465, $9482

unk_002_5482::
	dr $9482, $948e

unk_002_548e::
	dr $948e, $949e

unk_002_549e::
	dr $949e, $94ac

unk_002_54ac::
	dr $94ac, $94d3

unk_002_54d3::
	dr $94d3, $94e3

unk_002_54e3::
	dr $94e3, $94ef

unk_002_54ef::
	dr $94ef, $9503

unk_002_5503::
	dr $9503, $951a

unk_002_551a::
	dr $951a, $951b

unk_002_551b::
	dr $951b, $953b

unk_002_553b::
	dr $953b, $9548

unk_002_5548::
	dr $9548, $955d

unk_002_555d::
	dr $955d, $9577

unk_002_5577::
	dr $9577, $95a6

unk_002_55a6::
	dr $95a6, $95c7

unk_002_55c7::
	dr $95c7, $9603

unk_002_5603::
	dr $9603, $961f

unk_002_561f::
	dr $961f, $9644

unk_002_5644::
	dr $9644, $9652

unk_002_5652::
	dr $9652, $9696

unk_002_5696::
	dr $9696, $96c6

unk_002_56c6::
	dr $96c6, $974f

unk_002_574f::
	dr $974f, $977c

unk_002_577c::
	dr $977c, $9788

unk_002_5788::
	dr $9788, $982d

unk_002_582d::
	dr $982d, $9855

unk_002_5855::
	dr $9855, $985f

unk_002_585f::
	dr $985f, $98b0

unk_002_58b0::
	dr $98b0, $98be

unk_002_58be::
	dr $98be, $991f

unk_002_591f::
	dr $991f, $9985

unk_002_5985::
	dr $9985, $998f

unk_002_598f::
	dr $998f, $9bb5

unk_002_5bb5::
	dr $9bb5, $9bd1

unk_002_5bd1::
	dr $9bd1, $9bfb

unk_002_5bfb::
	dr $9bfb, $9c30

unk_002_5c30::
	dr $9c30, $9c6d

unk_002_5c6d::
	dr $9c6d, $9c98

unk_002_5c98::
	dr $9c98, $9ca2

unk_002_5ca2::
	dr $9ca2, $9cae

unk_002_5cae::
	dr $9cae, $9cbc

unk_002_5cbc::
	dr $9cbc, $9cdb

unk_002_5cdb::
	dr $9cdb, $9cee

unk_002_5cee::
	dr $9cee, $9cf6

unk_002_5cf6::
	dr $9cf6, $9d38

unk_002_5d38::
	dr $9d38, $9d44

unk_002_5d44::
	dr $9d44, $9d52

unk_002_5d52::
	dr $9d52, $9d91

unk_002_5d91::
	dr $9d91, $9db2

unk_002_5db2::
	dr $9db2, $9ddf

unk_002_5ddf::
	dr $9ddf, $9e0b

unk_002_5e0b::
	dr $9e0b, $9e21

unk_002_5e21::
	dr $9e21, $9e3b

unk_002_5e3b::
	dr $9e3b, $9fca

Music_Town1_Ch1: dr $9fca, $a045
Music_Town1_Ch2: dr $a045, $a1c1
Music_Town1_Ch3: dr $a1c1, $a239
Music_Town1_Ch4: dr $a239, $a243

Music_Battle1_Ch1: dr $a243, $a3df
Music_Battle1_Ch2: dr $a3df, $a49f
Music_Battle1_Ch3: dr $a49f, $a594
Music_Battle1_Ch4: dr $a594, $a5d9

Music_Blackout_Ch1: dr $a5d9, $a6bb
Music_Blackout_Ch2: dr $a6bb, $a73d
Music_Blackout_Ch3: dr $a73d, $a7bf
Music_Blackout_Ch4: dr $a7bf, $a7d8

Music_Ship_Ch1: dr $a7d8, $a85f
Music_Ship_Ch2: dr $a85f, $a990
Music_Ship_Ch3: dr $a990, $aa45
Music_Ship_Ch4: dr $aa45, $aa77

Music_Forest_Ch1: dr $aa77, $ab6f
Music_Forest_Ch2: dr $ab6f, $ac88
Music_Forest_Ch3: dr $ac88, $ad45
Music_Forest_Ch4: dr $ad45, $ad8a

Music_Town3_Ch1: dr $ad8a, $ae9a
Music_Town3_Ch2: dr $ae9a, $af48
Music_Town3_Ch3: dr $af48, $affe
Music_Town3_Ch4: dr $affe, $b046

Music_Battle2_Ch1: dr $b046, $b121
Music_Battle2_Ch2: dr $b121, $b27a
Music_Battle2_Ch3: dr $b27a, $b323
Music_Battle2_Ch4: dr $b323, $b348

Music_Town4_Ch1: dr $b348, $b3ce
Music_Town4_Ch2: dr $b3ce, $b4b3
Music_Town4_Ch3: dr $b4b3, $b544
Music_Town4_Ch4: dr $b544, $b54e

Music_Battle3_Ch1: dr $b54e, $b5ca
Music_Battle3_Ch2: dr $b5ca, $b6f3
Music_Battle3_Ch3: dr $b6f3, $b7b5
Music_Battle3_Ch4: dr $b7b5, $b7da

Music_Battle4_Ch1: dr $b7da, $b895
Music_Battle4_Ch2: dr $b895, $b953
Music_Battle4_Ch3: dr $b953, $ba37
Music_Battle4_Ch4: dr $ba37, $ba6f

Music_Routes1_Ch1: dr $ba6f, $bb09
Music_Routes1_Ch2: dr $bb09, $bbf0
Music_Routes1_Ch3: dr $bbf0, $bcc9
Music_Routes1_Ch4: dr $bcc9, $bced

Music_Stargazing_Ch1: dr $bced, $bda7
Music_Stargazing_Ch2: dr $bda7, $be2d
Music_Stargazing_Ch3: dr $be2d, $beaa
Music_Stargazing_Ch4: dr $beaa, $bec0

SECTION "banknum2", ROMX[$7fff], BANK[$2]
	db $2
