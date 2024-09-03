Func_01e_4000::
	dr $78000, $78083

Func_01e_4083::
	dr $78083, $78125

Func_01e_4125::
	dr $78125, $78194

Func_01e_4194::
	dr $78194, $781bf

Func_01e_41bf::
	dr $781bf, $781e8

Func_01e_41e8::
	dr $781e8, $78212

INCLUDE "data/text/bank1e_misc3.asm"

Func_01e_421a:: ; get item name?
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld de, Pointers_01e_4d29
	ld a, [wd0f4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wd0f5]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1f4], a
	push hl
	ld de, Pointers_01e_4ebd
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, [hli]
	ld [wd9f3], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ld a, 1
	ld [wd9d3], a
	farcall asm_039_479f
	ret

Func_01e_4266::
	ld l, d
	ld h, 0
	ld de, EquipmentNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_0b65
	ret

Func_01e_4275::
	ld l, d
	ld h, 0
	ld de, ItemNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_0b65
	ret

Func_01e_4284:
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld a, [hl]
	ld [wd0c1], a
	ret

Func_01e_4290::
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld a, [hl]
	ld [wdce8], a
	and $0f ; ?
	ld l, a
	ld h, 0
	ld de, TypeNames
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $3c
	ld [wd08b], a
	ld a, $40
	ld [wd08c], a
	xor a
	ld [wCharacterTilePos], a
	call Func_0b65
	ret

Func_01e_42ba:
	dr $782ba, $782e4

Func_01e_42e4:
	ld l, d
	ld a, d ; @bad
	ld h, 0
	ld de, unk_01e_551f
	add hl, de
	ld a, [hl]
	ld [wd8ff], a
	ret

Func_01e_42f1:
	dr $782f1, $7831f

Func_01e_431f::
	ld l, d
	ld h, 0
	ld de, MonIcons
	add hl, de
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0c3]
	sla a
	sla a
	add $80
	swap a
	ld d, a
	and $f0
	ld e, a
	ld a, d
	and $0f
	or $80
	ld d, a
	ld bc, $40
	call CopyBytesVRAM
	ret

Func_01e_434d:
	dr $7834d, $787fb

Func_01e_47fb:
	dr $787fb, $78ccf

unk_01e_4ccf:
	dr $78ccf, $78d29

Pointers_01e_4d29:
	dw unk_01e_4ccf
	dw unk_01e_4ead
	dw unk_01e_4eaf
	dw unk_01e_4eb3
	dw unk_01e_4eb5
	dw unk_01e_4ccf
	dw unk_01e_4ea1
	dw unk_01e_4e9f
	dw unk_01e_4e9d
	dw unk_01e_4e99
	dw unk_01e_4e83
	dw unk_01e_4e8b
	dw unk_01e_4e8f
	dw unk_01e_4e97
	dw unk_01e_4ea3
	dw unk_01e_4e79
	dw unk_01e_4e73
	dw unk_01e_4e6d
	dw unk_01e_4e5d
	dw unk_01e_4e57
	dw unk_01e_4e31
	dw unk_01e_4e37
	dw unk_01e_4e45
	dw unk_01e_4e4b
	dw unk_01e_4e1b
	dw unk_01e_4e23
	dw unk_01e_4e29
	dw unk_01e_4e2d
	dw unk_01e_4e15
	dw unk_01e_4e0f
	dw unk_01e_4e0b
	dw unk_01e_4df3
	dw unk_01e_4df7
	dw unk_01e_4dfb
	dw unk_01e_4dfd
	dw unk_01e_4e03
	dw unk_01e_4e07
	dw unk_01e_4de3
	dw unk_01e_4deb
	dw unk_01e_4db1
	dw unk_01e_4db7
	dw unk_01e_4dbb
	dw unk_01e_4dbd
	dw unk_01e_4dc3
	dw unk_01e_4dc9
	dw unk_01e_4dd3
	dw unk_01e_4dd5
	dw unk_01e_4dd9
	dw unk_01e_4ddb
	dw unk_01e_4d99
	dw unk_01e_4da1
	dw unk_01e_4da5
	dw unk_01e_4da7
	dw unk_01e_4da9
	dw unk_01e_4dad
	dw unk_01e_4e65

; TODO

unk_01e_4d99:
	dw $3a00
	dw $4200
	dw $3500
	dw $1700

unk_01e_4da1:
	dw $4300
	dw $4700

unk_01e_4da5:
	dw $4900

unk_01e_4da7:
	dw $4c00

unk_01e_4da9:
	dw $4f00
	dw $5100

unk_01e_4dad:
	dw $901
	dw $5300

unk_01e_4db1:
	dw $2c00
	dw $a01
	dw $2e00

unk_01e_4db7:
	dw $2400
	dw $2600

unk_01e_4dbb:
	dw $3e00

unk_01e_4dbd:
	dw $c00
	dw $800
	dw $300

unk_01e_4dc3:
	dw $3b00
	dw $3000
	dw $2300

unk_01e_4dc9:
	dw $2400
	dw $b00
	dw $2200
	dw $5400
	dw $2700

unk_01e_4dd3:
	dw $4100

unk_01e_4dd5:
	dw $700
	dw $4500

unk_01e_4dd9:
	dw $1d00

unk_01e_4ddb:
	dw $4d00
	dw $2002
	dw $2400
	dw $3d00

unk_01e_4de3:
	dw $1401
	dw $2500
	dw $d01
	dw $2600

unk_01e_4deb:
	dw $800
	dw $d00
	dw $200
	dw $3600

unk_01e_4df3:
	dw $1100
	dw $2800

unk_01e_4df7:
	dw $f01
	dw $4b00

unk_01e_4dfb:
	dw $c00

unk_01e_4dfd:
	dw $2a00
	dw $4a00
	dw $3800

unk_01e_4e03:
	dw $800
	dw $1400

unk_01e_4e07:
	dw $2700
	dw $300

unk_01e_4e0b:
	dw $4400
	dw $5800

unk_01e_4e0f:
	dw $2700
	dw $1d00
	dw $1600

unk_01e_4e15:
	dw $1c00
	dw $3900
	dw $1300

unk_01e_4e1b:
	dw $700
	dw $1b00
	dw $3600
	dw $3200

unk_01e_4e23:
	dw $2300
	dw $1200
	dw $2200

unk_01e_4e29:
	dw $1401
	dw $1501

unk_01e_4e2d:
	dw $600
	dw $200

unk_01e_4e31:
	dw $1d00
	dw $1100
	dw $2300

unk_01e_4e37:
	dw $600
	dw $c01
	dw $1b00
	dw $1c00
	dw $c00
	dw $1301
	dw $1101

unk_01e_4e45:
	dw $1800
	dw $2300
	dw $3100

unk_01e_4e4b:
	dw $2700
	dw $300
	dw $2400
	dw $1300
	dw $101
	dw $300

unk_01e_4e57:
	dw $2700
	dw $b00
	dw $400

unk_01e_4e5d:
	dw $c00
	dw $2400
	dw $100
	dw $500

unk_01e_4e65:
	dw $c00
	dw $2400
	dw $100
	dw $500

unk_01e_4e6d:
	dw $200
	dw $500
	dw $2100

unk_01e_4e73:
	dw $4b00
	dw $801
	dw $700

unk_01e_4e79:
	dw $1100
	dw $1200
	dw $2700
	dw $900
	dw $c00

unk_01e_4e83:
	dw $400
	dw $5900
	dw $2700
	dw $1100

unk_01e_4e8b:
	dw $a00
	dw $600

unk_01e_4e8f:
	dw $1200
	dw $3f00
	dw $4300
	dw $2600

unk_01e_4e97:
	dw $5500

unk_01e_4e99:
	dw $2700
	dw $2900

unk_01e_4e9d:
	dw $1200

unk_01e_4e9f:
	dw $1100

unk_01e_4ea1:
	dw $600

unk_01e_4ea3:
	dw $2700
	dw $3400
	dw $100
	dw $c00
	dw $2600

unk_01e_4ead:
	dw $1300

unk_01e_4eaf:
	dw $300
	dw $600

unk_01e_4eb3:
	dw $a00
	
unk_01e_4eb5:
	dw $202
	dw $2400
	dw $1e00
	dw $2f00

Pointers_01e_4ebd:
	dw ItemNames
	dw EquipmentNames
	dw KeyItemNames

ItemNames:
	dw text_1e_4f91
	dw text_1e_4f97
	dw text_1e_4f9d
	dw text_1e_4fa3
	dw text_1e_4faa
	dw text_1e_4fb0
	dw text_1e_4fb7
	dw text_1e_4fbe
	dw text_1e_4fc4
	dw text_1e_4fcc
	dw text_1e_4fd2
	dw text_1e_4fda
	dw text_1e_4fdf
	dw text_1e_4fe6
	dw text_1e_4fed
	dw text_1e_4ff2
	dw text_1e_4ffa
	dw text_1e_5001
	dw text_1e_5009
	dw text_1e_500e
	dw text_1e_5014
	dw text_1e_5019
	dw text_1e_5020
	dw text_1e_5026
	dw text_1e_502e
	dw text_1e_5034
	dw text_1e_503a
	dw text_1e_503f
	dw text_1e_5045
	dw text_1e_504a
	dw text_1e_5052
	dw text_1e_5058
	dw text_1e_505d
	dw text_1e_5066
	dw text_1e_506e
	dw text_1e_5073
	dw text_1e_507b
	dw text_1e_5083
	dw text_1e_508b
	dw text_1e_5092
	dw text_1e_5099
	dw text_1e_50a0
	dw text_1e_50a7
	dw text_1e_50ae
	dw text_1e_50b5
	dw text_1e_50bc
	dw text_1e_50c3
	dw text_1e_50ca
	dw text_1e_50d1
	dw text_1e_50d8
	dw text_1e_50e0
	dw text_1e_50e8
	dw text_1e_50f0
	dw text_1e_50f8
	dw text_1e_5100
	dw text_1e_5108
	dw text_1e_5110
	dw text_1e_5118
	dw text_1e_5120
	dw text_1e_5128
	dw text_1e_5130
	dw text_1e_5138
	dw text_1e_5140
	dw text_1e_5148
	dw text_1e_5150
	dw text_1e_5158
	dw text_1e_5160
	dw text_1e_5168
	dw text_1e_5170
	dw text_1e_5178
	dw text_1e_5180
	dw text_1e_5188
	dw text_1e_5190
	dw text_1e_5198
	dw text_1e_51a0
	dw text_1e_51a8
	dw text_1e_51b0
	dw text_1e_51b8
	dw text_1e_51c0
	dw text_1e_51c8
	dw text_1e_51d0
	dw text_1e_51d8
	dw text_1e_51e0
	dw text_1e_51e8
	dw text_1e_51f0
	dw text_1e_51f8
	dw text_1e_5200
	dw text_1e_5208
	dw text_1e_5210
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218
	dw text_1e_5218

INCLUDE "data/text/item_names.asm"

EquipmentNames:
	dw text_1e_5268
	dw text_1e_526e
	dw text_1e_5274
	dw text_1e_527c
	dw text_1e_5284
	dw text_1e_528c
	dw text_1e_5294
	dw text_1e_529c
	dw text_1e_52a4
	dw text_1e_52ab
	dw text_1e_52b1
	dw text_1e_52b7
	dw text_1e_52c0
	dw text_1e_52c6
	dw text_1e_52cf
	dw text_1e_52d8
	dw text_1e_52de
	dw text_1e_52e2
	dw text_1e_52ea
	dw text_1e_52f2
	dw text_1e_52fa
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302
	dw text_1e_5302

INCLUDE "data/text/equipment_names.asm"

KeyItemNames:
	dw text_1e_5358
	dw text_1e_535e
	dw text_1e_5365
	dw text_1e_536e
	dw text_1e_5374
	dw text_1e_5379
	dw text_1e_5382
	dw text_1e_5388
	dw text_1e_538d
	dw text_1e_5395
	dw text_1e_539c
	dw text_1e_53a2
	dw text_1e_53aa
	dw text_1e_53b3
	dw text_1e_53ba
	dw text_1e_53c2
	dw text_1e_53c8
	dw text_1e_53cf
	dw text_1e_53d7
	dw text_1e_53de
	dw text_1e_53e7
	dw text_1e_53ec
	dw text_1e_53f4
	dw text_1e_53fc
	dw text_1e_5404
	dw text_1e_540b
	dw text_1e_5412
	dw text_1e_541a
	dw text_1e_5421
	dw text_1e_5427
	dw text_1e_542c
	dw text_1e_5432
	dw text_1e_5437
	dw text_1e_5440
	dw text_1e_5449
	dw text_1e_5451
	dw text_1e_5458
	dw text_1e_5461
	dw text_1e_5468
	dw text_1e_546f
	dw text_1e_5478

INCLUDE "data/text/key_item_names.asm"

INCLUDE "data/monsters/menu_icons.asm"

unk_01e_551f:
	dr $7951f, $795ae

TypeNames:
	dw text_1e_55c0
	dw text_1e_55c3
	dw text_1e_55c6
	dw text_1e_55c9
	dw text_1e_55cc
	dw text_1e_55cf
	dw text_1e_55d2
	dw text_1e_55d5
	dw text_1e_55d8

INCLUDE "data/text/mon_types.asm"

INCLUDE "data/icon_pointers.asm"

PointerTable_01e_57ed:
	dw text_1e_5829
	dw text_1e_582a
	dw text_1e_5836
	dw text_1e_5841
	dw text_1e_584f
	dw text_1e_585f
	dw text_1e_586c
	dw text_1e_5875
	dw text_1e_587d
	dw text_1e_5888
	dw text_1e_5890
	dw text_1e_5898
	dw text_1e_58a5
	dw text_1e_58b1
	dw text_1e_58c1
	dw text_1e_58d4
	dw text_1e_58f0
	dw text_1e_58fb
	dw text_1e_5907
	dw text_1e_591f
	dw text_1e_592c
	dw text_1e_5947
	dw text_1e_595f
	dw text_1e_5971
	dw text_1e_597a
	dw text_1e_598b
	dw text_1e_599b
	dw text_1e_59a9
	dw text_1e_59b7
	dw text_1e_59c4

INCLUDE "data/text/bank1e_misc.asm"

PointerTable_01e_59cc:
	dr $799cc, $79aa0

INCLUDE "data/text/bank1e_misc2.asm"

text_01e_buffer2:
	dr $79c3f, $7ade3

Func_01e_6de3::
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld de, unk_01e_6e24
	ld a, [hFFB8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd1f4], a
	push hl
	ld de, Pointers_01e_4ebd
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, [hli]
	ld [wd9f3], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ld a, 1
	ld [wd9d3], a
	farcall asm_039_479f
	ret

unk_01e_6e24:
	dr $7ae24, $7ae44

INCLUDE "data/text/bank1e_misc4.asm"

Func_01e_6e4d::
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld a, [wdcb6]
	cp 7
	jr z, asm_01e_6e89
	ld [wd1f4], a
	ld de, Pointers_01e_4ebd
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wdcb7]
	ld [wd9f3], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ld a, 1
	ld [wd9d3], a
	farcall asm_039_479f
	ret

asm_01e_6e89:
	ld a, [wdcb7]
	ld de, PriceOptions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd9cc + 1], a
	ld a, [hli]
	ld [wd9cc], a
	ld a, [wdcb7]
	ld de, PriceTexts
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	farcall Func_02b_4569
	ret

PriceOptions:
	bigdw 500
	bigdw 500
	bigdw 1000
	bigdw 1500
	bigdw 2000
	bigdw 2500
	

PriceTexts:
	dw text_1e_6ece
	dw text_1e_6ece
	dw text_1e_6ed5
	dw text_1e_6edd
	dw text_1e_6ee5
	dw text_1e_6eed
	
INCLUDE "data/text/store_price_options.asm"

