Func_00c_4000:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_4013
	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, .asm_4013
	ld a, $08
	jr .asm_4016
.asm_4013
	ld a, [wSelectedOption]
.asm_4016
	ld de, Pointers_00c_63dc
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0100
	ld de, vTiles0
	call Func_135a
	ret
Func_00c_402b:
	ld a, [wSelectedOption]
	cp $03
	jr nz, .asm_403e
	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, .asm_403e
	ld a, $08
	jr .asm_4041
.asm_403e
	ld a, [wSelectedOption]
.asm_4041
	ld de, Pointers_00c_5f4a
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0080
	ld de, $8f60
	call Func_135a
	ret

LoadSignpostText::
	ld de, .SignpostGroups

; map group
	ld a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a

; signpost number
	ld a, [wSignpostNumber]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de

; store to text buffer
	ld a, [hli]
	ld [wTextStart], a
	ld a, [hli]
	ld [wTextStart + 1], a
	ret

.SignpostGroups:
	dw Group00_Signposts
	dw Group00_Signposts
	dw Group02_Signposts
	dw Group03_Signposts
	dw Group04_Signposts
	dw Group05_Signposts
	dw Group06_Signposts
	dw Group00_Signposts

Group00_Signposts:
	dw text_0c_40a7
	dw text_0c_40a7
	dw text_0c_40af
	dw text_0c_40b8
	dw text_0c_40c0
	dw text_0c_40c7
	dw text_0c_40d1
	dw text_0c_40db
	dw text_0c_40e6
	dw text_0c_40ed
	dw text_0c_40f5
	dw text_0c_4103
	dw text_0c_410d
	dw text_0c_4116
	dw text_0c_4120
	dw text_0c_412a
	dw text_0c_4133

INCLUDE "data/text/signposts_1.asm"

Group02_Signposts:
	dw text_0c_4152
	dw text_0c_4152
	dw text_0c_415a
	dw text_0c_4162
	dw text_0c_416d
	dw text_0c_4176
	dw text_0c_417f
	dw text_0c_4189
	dw text_0c_4194
	dw text_0c_41af
	dw text_0c_41b6

INCLUDE "data/text/signposts_2.asm"

Group03_Signposts:
	dw text_0c_41cb
	dw text_0c_41cb
	dw text_0c_41d3
	dw text_0c_41da
	dw text_0c_41e5
	dw text_0c_41ee
	dw text_0c_41f7

INCLUDE "data/text/signposts_3.asm"

Group04_Signposts:
	dw text_0c_4216
	dw text_0c_4216
	dw text_0c_421e
	dw text_0c_4229
	dw text_0c_4233
	dw text_0c_423d
	dw text_0c_4250
	dw text_0c_4258
	dw text_0c_4260
	dw text_0c_426a
	dw text_0c_4272
	dw text_0c_4283

INCLUDE "data/text/signposts_4.asm"

Group05_Signposts:
	dw text_0c_42a5
	dw text_0c_42a5
	dw text_0c_42ad
	dw text_0c_42b5
	dw text_0c_42bd
	dw text_0c_42c7
	dw text_0c_42d3
	dw text_0c_42db

INCLUDE "data/text/signposts_5.asm"

Group06_Signposts:
	dw text_0c_42f9
	dw text_0c_42f9
	dw text_0c_4303
	dw text_0c_430e
	dw text_0c_431a
	dw text_0c_4322

INCLUDE "data/text/signposts_6.asm"

BattleUIGFX::
	INCBIN "gfx/misc/battleuigfx.2bpp"
BattleUIGFX_476a::
	INCBIN "gfx/misc/battleuigfx_476a.2bpp"
BattleUIGFX_483a::
	INCBIN "gfx/misc/battleuigfx_483a.2bpp"
BattleUIGFX_491a::
	INCBIN "gfx/misc/battleuigfx_491a.2bpp"
BattleUIGFX_4b8a::
	INCBIN "gfx/misc/battleuigfx_4b8a.2bpp"
BattleUIGFX_4e0a::
	INCBIN "gfx/misc/battleuigfx_4e0a.2bpp"
BattleUIGFX_4e6a::
	INCBIN "gfx/misc/battleuigfx_4e6a.2bpp"
BattleUIGFX_4e9a::
	INCBIN "gfx/misc/battleuigfx_4e9a.2bpp"
BattleUIGFX_527a::
	INCBIN "gfx/misc/battleuigfx_527a.2bpp"
BattleUIGFX_52fa::
	INCBIN "gfx/misc/battleuigfx_52fa.2bpp"
BattleUIGFX_53fa::
	INCBIN "gfx/misc/battleuigfx_53fa.2bpp"
BattleUIGFX_55da::
	INCBIN "gfx/misc/battleuigfx_55da.2bpp"
BattleUIGFX_571a::
	INCBIN "gfx/misc/battleuigfx_571a.2bpp"
BattleUIGFX_5a3a::
	INCBIN "gfx/misc/battleuigfx_5a3a.2bpp"
BattleUIGFX_5e3a::
	INCBIN "gfx/misc/battleuigfx_5e3a.2bpp"
BattleUIGFX_5e4a::
	INCBIN "gfx/misc/battleuigfx_5e4a.2bpp"
Pointers_00c_5f4a:
	dw OptionGFX_00c_5f5c
	dw OptionGFX_00c_5fdc
	dw OptionGFX_00c_605c
	dw OptionGFX_00c_60dc
	dw OptionGFX_00c_615c
	dw OptionGFX_00c_61dc
	dw OptionGFX_00c_625c
	dw OptionGFX_00c_62dc
	dw OptionGFX_00c_635c
OptionGFX_00c_5f5c: INCBIN "gfx/sprites/optiongfx.2bpp", $0, $80
OptionGFX_00c_5fdc: INCBIN "gfx/sprites/optiongfx.2bpp", $80, $80
OptionGFX_00c_605c: INCBIN "gfx/sprites/optiongfx.2bpp", $100, $80
OptionGFX_00c_60dc: INCBIN "gfx/sprites/optiongfx.2bpp", $180, $80
OptionGFX_00c_615c: INCBIN "gfx/sprites/optiongfx.2bpp", $200, $80
OptionGFX_00c_61dc: INCBIN "gfx/sprites/optiongfx.2bpp", $280, $80
OptionGFX_00c_625c: INCBIN "gfx/sprites/optiongfx.2bpp", $300, $80
OptionGFX_00c_62dc: INCBIN "gfx/sprites/optiongfx.2bpp", $380, $80
OptionGFX_00c_635c: INCBIN "gfx/sprites/optiongfx.2bpp", $400, $80
Pointers_00c_63dc:
	dw Pointers_00c_63dc_63ee
	dw Pointers_00c_63dc_64ee
	dw Pointers_00c_63dc_65ee
	dw Pointers_00c_63dc_66ee
	dw Pointers_00c_63dc_67ee
	dw Pointers_00c_63dc_68ee
	dw Pointers_00c_63dc_69ee
	dw Pointers_00c_63dc_6aee
	dw Pointers_00c_63dc_6bee
Pointers_00c_63dc_63ee:
	db $00, $00, $00, $00, $30, $30, $20, $20, $24, $20, $10, $00, $00, $00, $20, $20
	db $20, $22, $30, $37, $30, $32, $38, $38, $38, $38, $38, $38, $38, $38, $38, $38
	db $00, $00, $00, $00, $01, $00, $93, $00, $01, $00, $00, $00, $03, $00, $06, $50
	db $04, $f0, $04, $f0, $00, $78, $00, $38, $00, $1c, $00, $0e, $00, $07, $00, $07
	db $00, $00, $00, $00, $c0, $00, $80, $00, $00, $00, $c0, $00, $00, $00, $80, $00
	db $00, $04, $00, $0e, $00, $0e, $00, $5c, $00, $58, $00, $70, $00, $60, $00, $c0
	db $00, $00, $00, $00, $c0, $00, $30, $00, $0c, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $38, $38, $30, $30, $30, $30, $20, $20, $20, $20, $20, $21, $30, $31, $30, $31
	db $38, $38, $3c, $3c, $3e, $3e, $3c, $3c, $33, $30, $0c, $00, $00, $00, $00, $00
	db $20, $2f, $00, $07, $00, $03, $00, $01, $00, $c1, $00, $e3, $00, $ff, $00, $ff
	db $00, $ef, $00, $f8, $00, $73, $00, $39, $00, $1f, $00, $07, $00, $00, $00, $00
	db $00, $c0, $00, $c0, $01, $c1, $00, $c0, $00, $c0, $00, $e0, $00, $fe, $00, $ff
	db $00, $e7, $00, $07, $00, $fe, $00, $fe, $00, $fc, $00, $f8, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $04, $00, $08, $00, $30, $00, $00, $00, $00, $00
Pointers_00c_63dc_64ee:
	db $00, $00, $00, $00, $3e, $3e, $3c, $3c, $3d, $3c, $3a, $38, $3a, $38, $38, $38
	db $3c, $3c, $3c, $3c, $3c, $3d, $3c, $3c, $3c, $3c, $39, $38, $38, $38, $38, $38
	db $00, $00, $00, $00, $87, $00, $06, $00, $0c, $00, $08, $00, $18, $00, $10, $00
	db $00, $60, $00, $00, $00, $e1, $00, $f3, $00, $1f, $80, $0f, $00, $0f, $00, $0f
	db $00, $00, $00, $00, $00, $00, $08, $00, $10, $00, $10, $00, $20, $00, $20, $00
	db $40, $00, $40, $00, $00, $02, $00, $06, $00, $02, $00, $9c, $00, $ff, $00, $03
	db $00, $00, $00, $00, $00, $00, $10, $00, $10, $00, $20, $00, $60, $00, $c0, $00
	db $c0, $00, $80, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80
	db $30, $30, $30, $34, $20, $20, $20, $29, $20, $21, $20, $23, $20, $2a, $20, $22
	db $30, $36, $30, $32, $38, $38, $3c, $3c, $3e, $3e, $3f, $3f, $00, $00, $00, $00
	db $00, $06, $00, $06, $00, $87, $00, $83, $00, $c3, $00, $e7, $00, $3f, $00, $0f
	db $00, $03, $00, $00, $00, $20, $00, $bc, $00, $7c, $80, $88, $00, $00, $00, $00
	db $38, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $8e, $00, $8e, $00, $dc
	db $00, $fc, $00, $78, $00, $78, $00, $70, $00, $60, $00, $40, $00, $00, $00, $00
	db $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $0c, $0c, $1c, $1c, $00, $00, $00, $00
Pointers_00c_63dc_65ee:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $3c, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $08, $00, $08, $00, $10, $00, $10, $01, $20, $03, $20, $03
	db $20, $07, $40, $07, $40, $00, $80, $0f, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $28, $00, $fe, $00, $fe
	db $00, $ff, $00, $ff, $00, $ff, $00, $fc, $00, $3e, $00, $3c, $00, $38, $00, $f0
	db $00, $00, $00, $00, $04, $04, $00, $00, $20, $00, $20, $00, $20, $00, $20, $00
	db $10, $00, $10, $00, $08, $00, $04, $c0, $00, $00, $0c, $0c, $04, $04, $1c, $1c
	db $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $08, $00, $08, $00, $08, $00
	db $08, $00, $04, $00, $04, $00, $02, $00, $02, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $0c, $00, $1f, $00, $1f, $00, $1f, $00, $0f, $00, $0f
	db $00, $07, $00, $03, $00, $01, $00, $00, $00, $20, $00, $38, $00, $00, $00, $00
	db $00, $f0, $00, $f1, $00, $f3, $00, $ff, $00, $02, $00, $02, $00, $84, $00, $cc
	db $00, $f8, $00, $f0, $00, $f0, $01, $e0, $01, $00, $00, $00, $00, $00, $00, $00
	db $1c, $1c, $0c, $0c, $0c, $0c, $0c, $0c, $1c, $1c, $1c, $1c, $3c, $3c, $7c, $7c
	db $fc, $fc, $fc, $fc, $fc, $fc, $7c, $7c, $7c, $7c, $bc, $3c, $00, $00, $00, $00
Pointers_00c_63dc_66ee:
	db $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $10, $00, $10, $00, $20, $01
	db $20, $01, $00, $01, $00, $00, $07, $00, $00, $00, $20, $23, $24, $24, $34, $34
	db $00, $00, $00, $00, $00, $00, $00, $20, $00, $78, $01, $fc, $00, $fe, $00, $fe
	db $00, $ff, $00, $ff, $00, $f8, $00, $31, $c0, $1a, $00, $1c, $00, $3c, $00, $1e
	db $00, $00, $00, $00, $00, $00, $20, $00, $10, $00, $10, $00, $88, $00, $8a, $00
	db $4d, $00, $65, $00, $24, $80, $16, $00, $96, $00, $0e, $00, $04, $00, $04, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $80, $00, $a0, $00, $a4, $00, $f4, $00, $d4, $00, $c8, $00
	db $3c, $3c, $3c, $3c, $38, $38, $38, $38, $38, $38, $3c, $3c, $3c, $3c, $3e, $3e
	db $3e, $3e, $3c, $3c, $38, $38, $31, $30, $23, $20, $37, $30, $00, $00, $00, $00
	db $00, $0f, $00, $8f, $00, $87, $00, $47, $00, $7f, $00, $77, $00, $23, $00, $38
	db $00, $1f, $00, $0f, $c0, $07, $e0, $03, $c0, $01, $80, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $f8, $00, $c8, $00, $cc, $00, $fc, $00, $3c, $00, $3c
	db $00, $f8, $00, $f8, $00, $f0, $00, $e0, $00, $c0, $00, $00, $00, $00, $00, $00
	db $88, $00, $88, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $04, $00, $0c, $00, $1c, $00, $3c, $00, $00, $00, $00, $00
Pointers_00c_63dc_67ee:
	db $00, $00, $00, $00, $30, $30, $20, $20, $20, $20, $00, $00, $00, $00, $00, $01
	db $00, $00, $00, $02, $00, $00, $00, $04, $20, $04, $10, $00, $28, $00, $08, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $00, $c0, $00, $c8
	db $00, $d4, $00, $e6, $00, $eb, $00, $75, $00, $76, $00, $03, $00, $7d, $00, $87
	db $00, $00, $00, $00, $03, $00, $03, $00, $00, $00, $18, $00, $18, $00, $00, $00
	db $03, $00, $03, $00, $00, $00, $00, $c0, $00, $f0, $00, $40, $00, $fc, $00, $c0
	db $00, $00, $00, $00, $1c, $1c, $0c, $0c, $04, $04, $64, $04, $60, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $00, $08, $00, $08, $00
	db $14, $00, $28, $20, $2c, $20, $34, $30, $38, $38, $38, $38, $38, $38, $3a, $38
	db $3a, $38, $3a, $38, $34, $30, $34, $30, $28, $20, $10, $00, $00, $00, $00, $00
	db $00, $03, $00, $03, $00, $02, $00, $06, $00, $1e, $00, $3f, $00, $3f, $00, $1c
	db $00, $1c, $00, $0f, $00, $07, $00, $01, $00, $00, $00, $0c, $00, $00, $00, $00
	db $00, $c0, $00, $e0, $00, $60, $00, $30, $00, $39, $00, $f9, $00, $fe, $00, $1e
	db $00, $fc, $00, $f8, $00, $f0, $00, $e0, $00, $c0, $00, $00, $00, $00, $00, $00
	db $14, $00, $08, $00, $18, $00, $14, $04, $0c, $0c, $1c, $1c, $1c, $1c, $1c, $1c
	db $1c, $1c, $0c, $0c, $0c, $0c, $0c, $0c, $04, $04, $00, $00, $00, $00, $00, $00
Pointers_00c_63dc_68ee:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $00, $78, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $02, $00, $0c, $00, $30, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $20
	db $00, $00, $00, $00, $1c, $1c, $0c, $0c, $0c, $0c, $0c, $0c, $84, $04, $18, $18
	db $0c, $0c, $14, $14, $14, $14, $34, $34, $3c, $3c, $1c, $1c, $7c, $7c, $7c, $7c
	db $00, $00, $00, $23, $00, $10, $00, $04, $00, $00, $00, $28, $00, $08, $00, $04
	db $00, $02, $00, $01, $00, $04, $00, $02, $20, $01, $30, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $80, $00, $81, $00, $47, $00, $7f, $00, $1f, $00, $3f
	db $00, $1f, $00, $0c, $00, $43, $00, $01, $00, $18, $00, $00, $00, $00, $00, $00
	db $00, $e0, $00, $e0, $00, $c4, $00, $c0, $00, $e0, $00, $fc, $01, $f8, $04, $e0
	db $11, $80, $44, $00, $10, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $7c, $7c, $7c, $7c, $7c, $7c, $64, $64, $10, $00, $40, $00, $14, $04, $4c, $0c
	db $3c, $3c, $3c, $3c, $5c, $1c, $2c, $0c, $24, $04, $70, $00, $00, $00, $00, $00
Pointers_00c_63dc_69ee:
	db $00, $00, $00, $00, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3f, $3e, $3e
	db $3d, $3c, $3b, $38, $38, $38, $30, $30, $30, $30, $38, $38, $38, $38, $30, $30
	db $00, $00, $00, $00, $f8, $f9, $f0, $f4, $e0, $e8, $c0, $d0, $80, $83, $00, $03
	db $00, $0d, $60, $0f, $00, $07, $00, $03, $00, $01, $00, $00, $01, $18, $00, $38
	db $00, $00, $00, $00, $04, $80, $00, $60, $00, $38, $00, $fc, $00, $fe, $00, $ff
	db $00, $ff, $00, $ff, $00, $ff, $00, $f3, $00, $39, $c0, $0d, $f0, $06, $00, $02
	db $00, $00, $00, $00, $0c, $00, $30, $00, $40, $00, $80, $00, $00, $00, $00, $00
	db $00, $80, $00, $80, $00, $c0, $00, $c0, $00, $e0, $00, $e0, $00, $e0, $00, $c0
	db $30, $30, $20, $21, $20, $21, $20, $20, $20, $20, $20, $2e, $20, $24, $30, $34
	db $30, $33, $38, $39, $20, $20, $20, $20, $31, $30, $3b, $38, $00, $00, $00, $00
	db $00, $38, $00, $38, $00, $f8, $00, $fc, $00, $30, $00, $03, $00, $0f, $00, $0f
	db $00, $0f, $00, $ff, $00, $ff, $00, $3f, $80, $00, $e0, $00, $00, $00, $00, $00
	db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00, $e0, $00, $f0
	db $00, $f0, $00, $f0, $00, $e0, $00, $80, $01, $00, $03, $00, $00, $00, $00, $00
	db $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $04, $04, $4c, $0c, $f4, $04, $ec, $0c, $00, $00, $00, $00
Pointers_00c_63dc_6aee:
	db $00, $00, $00, $00, $24, $20, $06, $00, $02, $00, $38, $00, $31, $00, $21, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $11, $00, $33, $00, $f7, $00, $34, $00, $c1, $00, $07, $00
	db $01, $08, $01, $18, $00, $38, $00, $7c, $00, $3c, $40, $0e, $10, $07, $00, $03
	db $00, $00, $00, $00, $00, $00, $82, $00, $e7, $00, $77, $00, $80, $00, $c3, $00
	db $80, $0c, $00, $0e, $00, $1f, $00, $1f, $00, $3c, $02, $30, $08, $60, $00, $c0
	db $00, $00, $00, $00, $78, $00, $78, $00, $74, $00, $4c, $00, $3c, $00, $04, $00
	db $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $80, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $20, $20, $30, $30, $30, $30, $38, $38, $38, $38, $3c, $3c
	db $3e, $3e, $3f, $3f, $3e, $3e, $38, $38, $31, $30, $23, $20, $00, $00, $00, $00
	db $00, $03, $00, $07, $00, $06, $00, $0c, $00, $1c, $00, $7e, $00, $7f, $00, $3f
	db $00, $38, $00, $1c, $00, $0f, $80, $07, $80, $03, $c0, $00, $00, $00, $00, $00
	db $00, $c0, $00, $e0, $00, $60, $00, $30, $00, $1e, $00, $1e, $00, $3e, $00, $fc
	db $00, $1c, $00, $38, $01, $f0, $00, $e0, $00, $c0, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $04, $04, $0c, $0c, $0c, $0c, $1c, $1c, $1c, $1c, $3c, $3c
	db $7c, $7c, $fc, $fc, $7c, $7c, $9c, $1c, $6c, $0c, $f4, $04, $00, $00, $00, $00
Pointers_00c_63dc_6bee:
	db $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $13, $00, $12, $00, $25, $00
	db $24, $00, $02, $00, $00, $00, $04, $00, $00, $00, $28, $20, $20, $20, $10, $00
	db $00, $00, $00, $00, $40, $00, $40, $00, $11, $00, $40, $00, $80, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $00, $03, $00, $c6, $00, $78, $00, $3c, $00, $1e, $00
	db $1f, $00, $0f, $00, $0f, $00, $07, $00, $07, $00, $07, $00, $07, $00, $07, $00
	db $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $80, $00, $a0, $00, $a4, $00, $d4, $00, $d4, $00, $c8, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $10, $00, $20, $20, $28, $20, $34, $30
	db $3a, $38, $3c, $3c, $38, $38, $31, $30, $23, $20, $37, $30, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $88, $00
	db $00, $00, $81, $00, $1f, $00, $e0, $00, $c0, $00, $80, $00, $00, $00, $00, $00
	db $0f, $00, $1f, $00, $0f, $00, $07, $00, $07, $00, $07, $00, $0f, $00, $1f, $00
	db $3e, $00, $f8, $00, $c0, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $e8, $00, $e8, $00, $e0, $00, $e0, $00, $c0, $00, $c0, $00, $80, $00, $00, $00
	db $00, $00, $00, $00, $04, $00, $0c, $00, $1c, $00, $3c, $00, $00, $00, $00, $00

_SRAMTest::
; Write pattern of decreasing bytes into SRAM and verify that they were written correctly
; If check succeeds, exit silently; otherwise display error screen
	ld hl, _SRAM
	ld bc, $2000
.write_pattern
	ld a, c
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .write_pattern

	ld hl, _SRAM
	ld bc, $2000
.check_pattern
	ld a, [hli]
	cp c
	jr nz, .failed_check
	dec bc
	ld a, c
	or b
	jr nz, .check_pattern
	ret

.failed_check:
	xor a ; SRAM_DISABLE
	ld [rRAMG], a

	ei
	call ClearBGMap0

; Load tiles into vTiles2
	ld de, vTiles2
	ld hl, SRAMErrorGFX
	ld bc, 14 tiles
	call CopyBytesVRAM

; Place tilemap
	hlbgcoord 3, 9
	ld de, SRAMErrorTilemap
	lb bc, 14, 1
	ld a, 14
	ld [hVRAMCopyWidth], a
	ld a, 1
	ld [hVRAMCopyHeight], a
	call PlaceTilemap_Bank0

; CGB only
; Place attrmap
	hlbgcoord 3, 9
	ld de, SRAMErrorAttrmap
	lb bc, 14, 1
	ld a, 14
	ld [hVRAMCopyWidth], a
	ld a, 1
	ld [hVRAMCopyHeight], a
	call PlaceAttrmap

; CGB only
	ld hl, SRAMErrorPalette
	ld c, BCPSF_AUTOINC
	ld b, 1 palettes
	call LoadPalettes_BCPD

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld a, $a0
	ldh [rWY], a

; After displaying message, wait for any input before exiting
.wait_input
	call DelayFrame
	ldh a, [hJoypadPressed]
	and a
	jr z, .wait_input

	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

SRAMErrorGFX:
	INCBIN "gfx/sram_error.2bpp"

SRAMErrorAttrmap:
	ds 14, $00

SRAMErrorTilemap:
	;  "T"  "E"  "S"  "T"  " "               "SRAM ERROR"
	db $01, $02, $03, $04, $00, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d

SRAMErrorPalette:
REPT 8
	RGB 31, 31, 31
	RGB 31, 23, 14
	RGB 24, 13, 0
	RGB 0, 0, 0
ENDR

TestFoundItemFlag:
	push bc
	push hl
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .asm_6eb2
.asm_6ead
	rrc l
	dec a
	jr nz, .asm_6ead
.asm_6eb2
	bit 0, l
	jr z, .asm_6eba
	ld a, $01
	jr .asm_6ebb
.asm_6eba
	xor a
.asm_6ebb
	pop hl
	pop bc
	ret

SetFoundItemFlag:
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .asm_6ec9
.asm_6ec4
	rrc l
	dec a
	jr nz, .asm_6ec4
.asm_6ec9
	set 0, l
	ld a, b
	and a
	jr z, .asm_6ed4
.asm_6ecf
	rlc l
	dec a
	jr nz, .asm_6ecf
.asm_6ed4
	ld a, l
	ld [de], a
	ret

CheckFoundItemEvent::
	ld de, FoundItemEventGroups
	ld a, [hMapGroup]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wFoundItem]
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [wPlayerFacing]
	cp d
	jr nz, .asm_6f1d
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestFoundItemFlag
	and a
	jr nz, .asm_6f1c
	pop hl
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call SetFoundItemFlag
	pop hl
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld [wItemNameCategory], a
	ld a, [hli]
	ld [wItemNameIndex], a
	ret
.asm_6f1c
	pop hl
.asm_6f1d
	xor a
	ld [wFoundItem], a
	ret

FoundItemEventGroups:
	dw Group00_FoundItems
	dw Group00_FoundItems
	dw Group02_FoundItems
	dw Group03_FoundItems
	dw Group04_FoundItems
	dw Group05_FoundItems
	dw Group06_FoundItems
	dw Group00_FoundItems
Group00_FoundItems:
	found_item_event FACE_DOWN, wFoundItemFlags, 0, 0, $00
	found_item_event FACE_UP, wFoundItemFlags, 0, 0, $15
	found_item_event FACE_UP, wFoundItemFlags, 1, 0, $3c
	found_item_event FACE_UP, wFoundItemFlags, 2, 0, $1d
	found_item_event FACE_UP, wFoundItemFlags, 3, 0, $12
	found_item_event FACE_UP, wFoundItemFlags, 4, 0, $01
	found_item_event FACE_UP, wFoundItemFlags, 5, 0, $27
	found_item_event FACE_UP, wFoundItemFlags, 6, 7, $01
	found_item_event FACE_UP, wFoundItemFlags, 7, 0, $17
	found_item_event FACE_UP, wFoundItemFlags + 1, 0, 0, $19
	found_item_event FACE_UP, wFoundItemFlags + 1, 1, 0, $1a
	found_item_event FACE_UP, wFoundItemFlags + 1, 2, 0, $0c
	found_item_event FACE_UP, wFoundItemFlags + 1, 3, 0, $56
	found_item_event FACE_UP, wFoundItemFlags + 1, 4, 0, $1c
	found_item_event FACE_UP, wFoundItemFlags + 1, 5, 0, $1d
	found_item_event FACE_UP, wFoundItemFlags + 1, 6, 0, $02
	found_item_event FACE_UP, wFoundItemFlags + 1, 7, 1, $15
	found_item_event FACE_UP, wFoundItemFlags + 2, 0, 0, $23
Group02_FoundItems:
	found_item_event FACE_DOWN, wFoundItemFlags + 2, 1, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 2, 1, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 2, 2, 0, $16
	found_item_event FACE_UP, wFoundItemFlags + 2, 3, 0, $1f
	found_item_event FACE_UP, wFoundItemFlags + 2, 4, 0, $22
	found_item_event FACE_UP, wFoundItemFlags + 2, 5, 0, $0b
	found_item_event FACE_UP, wFoundItemFlags + 2, 6, 0, $12
	found_item_event FACE_UP, wFoundItemFlags + 2, 7, 0, $25
	found_item_event FACE_UP, wFoundItemFlags + 3, 0, 0, $20
	found_item_event FACE_UP, wFoundItemFlags + 3, 1, 0, $0e
	found_item_event FACE_UP, wFoundItemFlags + 3, 2, 1, $01
	found_item_event FACE_UP, wFoundItemFlags + 3, 3, 0, $0b
	found_item_event FACE_UP, wFoundItemFlags + 3, 4, 0, $26
	found_item_event FACE_UP, wFoundItemFlags + 3, 5, 7, $02
	found_item_event FACE_UP, wFoundItemFlags + 3, 6, 0, $17
Group03_FoundItems:
	found_item_event FACE_DOWN, wFoundItemFlags + 3, 7, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 3, 7, 0, $14
	found_item_event FACE_UP, wFoundItemFlags + 4, 0, 1, $12
	found_item_event FACE_UP, wFoundItemFlags + 4, 1, 0, $4e
	found_item_event FACE_UP, wFoundItemFlags + 4, 2, 0, $22
	found_item_event FACE_UP, wFoundItemFlags + 4, 3, 0, $0b
	found_item_event FACE_UP, wFoundItemFlags + 4, 4, 0, $13
	found_item_event FACE_UP, wFoundItemFlags + 4, 5, 1, $05
	found_item_event FACE_UP, wFoundItemFlags + 4, 6, 7, $01
	found_item_event FACE_UP, wFoundItemFlags + 4, 7, 1, $12
Group04_FoundItems:
	found_item_event FACE_DOWN, wFoundItemFlags + 5, 0, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 5, 0, 0, $18
	found_item_event FACE_UP, wFoundItemFlags + 5, 1, 0, $19
	found_item_event FACE_UP, wFoundItemFlags + 5, 2, 0, $15
	found_item_event FACE_UP, wFoundItemFlags + 5, 3, 0, $17
	found_item_event FACE_UP, wFoundItemFlags + 5, 4, 0, $07
	found_item_event FACE_UP, wFoundItemFlags + 5, 5, 7, $05
	found_item_event FACE_UP, wFoundItemFlags + 5, 6, 1, $0b
	found_item_event FACE_UP, wFoundItemFlags + 5, 7, 0, $2d
	found_item_event FACE_UP, wFoundItemFlags + 6, 0, 0, $48
	found_item_event FACE_UP, wFoundItemFlags + 6, 1, 0, $04
	found_item_event FACE_UP, wFoundItemFlags + 6, 2, 7, $02
	found_item_event FACE_UP, wFoundItemFlags + 6, 3, 0, $21
	found_item_event FACE_UP, wFoundItemFlags + 6, 4, 0, $16
	found_item_event FACE_UP, wFoundItemFlags + 6, 5, 0, $23
	found_item_event FACE_UP, wFoundItemFlags + 6, 6, 0, $1c
	found_item_event FACE_UP, wFoundItemFlags + 6, 7, 0, $19
	found_item_event FACE_UP, wFoundItemFlags + 7, 0, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 7, 1, 0, $13
	found_item_event FACE_UP, wFoundItemFlags + 7, 2, 7, $01
	found_item_event FACE_DOWN, wFoundItemFlags + 7, 3, 0, $50
	found_item_event FACE_RIGHT, wFoundItemFlags + 7, 4, 0, $23
	found_item_event FACE_RIGHT, wFoundItemFlags + 7, 5, 0, $1e
	found_item_event FACE_LEFT, wFoundItemFlags + 7, 6, 7, $02
	found_item_event FACE_LEFT, wFoundItemFlags + 7, 7, 0, $46
Group05_FoundItems:
	found_item_event FACE_DOWN, wFoundItemFlags + 8, 0, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 8, 0, 0, $2b
	found_item_event FACE_UP, wFoundItemFlags + 8, 1, 0, $57
	found_item_event FACE_UP, wFoundItemFlags + 8, 2, 0, $03
	found_item_event FACE_UP, wFoundItemFlags + 8, 3, 0, $0d
	found_item_event FACE_UP, wFoundItemFlags + 8, 4, 0, $13
	found_item_event FACE_UP, wFoundItemFlags + 8, 5, 0, $11
	found_item_event FACE_UP, wFoundItemFlags + 8, 6, 0, $0a
	found_item_event FACE_UP, wFoundItemFlags + 8, 7, 0, $26
	found_item_event FACE_UP, wFoundItemFlags + 9, 0, 0, $15
	found_item_event FACE_UP, wFoundItemFlags + 9, 1, 7, $02
	found_item_event FACE_UP, wFoundItemFlags + 9, 2, 0, $1e
	found_item_event FACE_UP, wFoundItemFlags + 9, 3, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 9, 4, 0, $52
	found_item_event FACE_UP, wFoundItemFlags + 9, 5, 0, $07
	found_item_event FACE_UP, wFoundItemFlags + 9, 6, 0, $09
Group06_FoundItems:
	found_item_event FACE_DOWN, wFoundItemFlags + 9, 7, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 9, 7, 0, $0d
	found_item_event FACE_UP, wFoundItemFlags + 10, 0, 0, $16
	found_item_event FACE_UP, wFoundItemFlags + 10, 1, 0, $20
	found_item_event FACE_UP, wFoundItemFlags + 10, 2, 0, $1d
	found_item_event FACE_UP, wFoundItemFlags + 10, 3, 0, $40
	found_item_event FACE_UP, wFoundItemFlags + 10, 4, 0, $11
	found_item_event FACE_UP, wFoundItemFlags + 10, 5, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 10, 6, 7, $04
	found_item_event FACE_UP, wFoundItemFlags + 10, 7, 7, $05
	found_item_event FACE_UP, wFoundItemFlags + 11, 0, 0, $37
