INCLUDE "constants.asm"

SECTION "Title Screen GFX", ROMX

TitleScreen_BGPalette:: INCLUDE "gfx/title_screen/title_bg.pal"
TitleScreen_ObjPalette:: INCLUDE "gfx/title_screen/title_obj.pal"
TitleScreen_Attrs:: INCBIN "gfx/title_screen/title_screen.gbcattr"
TitleScreen_Tilemap:: INCBIN "gfx/title_screen/title_screen.tilemap"

SECTION "Vast Fame Logo GFX", ROMX

VastFame_Attrs:: INCBIN "gfx/intro/vast_fame_logo.gbcattr"
VastFame_Tilemap:: INCBIN "gfx/intro/vast_fame_logo.tilemap"
VastFame_Palette:: INCLUDE "gfx/intro/vast_fame_logo.pal"
VastFameGFX:: INCBIN "gfx/intro/vast_fame_logo.2bpp"

SECTION "Intro GFX 1", ROMX

Intro_Begin_BGPalette:: INCLUDE "gfx/intro/begin_bg.pal"
Intro_Begin_ObjPalette:: INCLUDE "gfx/intro/begin_obj.pal"
Intro_Text_Palette:: INCLUDE "gfx/intro/text.pal"
Intro_Begin_Attrs:: INCBIN "gfx/intro/begin.gbcattr"
Intro_Begin_Tilemap:: INCBIN "gfx/intro/begin.tilemap"
Intro_Begin_GFX:: INCBIN "gfx/intro/begin.2bpp"
Intro_Stars_GFX:: INCBIN "gfx/intro/stars.2bpp"
Intro_Ballot_Palette:: INCLUDE "gfx/intro/ballot.pal"
Intro_Buck_Palette:: INCLUDE "gfx/intro/buck.pal"
Intro_Nina_Palette:: INCLUDE "gfx/intro/nina.pal"
Intro_Claude_Palette:: INCLUDE "gfx/intro/claude.pal"
Intro_Helen_Palette:: INCLUDE "gfx/intro/helen.pal"
Intro_Lante_Palette:: INCLUDE "gfx/intro/lante.pal"
Intro_Randt_Palette:: INCLUDE "gfx/intro/randt.pal"
Intro_Mitt_Palette:: INCLUDE "gfx/intro/mitt.pal"
Intro_Pics_Attrs:: INCBIN "gfx/intro/pics.gbcattr"
Intro_Ballot_Tilemap:: INCBIN "gfx/intro/ballot.tilemap"
Intro_Buck_Tilemap:: INCBIN "gfx/intro/buck.tilemap"
Intro_Nina_Tilemap:: INCBIN "gfx/intro/nina.tilemap"
Intro_Claude_Tilemap:: INCBIN "gfx/intro/claude.tilemap"
Intro_Helen_Tilemap:: INCBIN "gfx/intro/helen.tilemap"
Intro_Lante_Tilemap:: INCBIN "gfx/intro/lante.tilemap"
Intro_Randt_Tilemap:: INCBIN "gfx/intro/randt.tilemap"
Intro_Mitt_Tilemap:: INCBIN "gfx/intro/mitt.tilemap"
Intro_Beasts_Attrs:: INCBIN "gfx/intro/pics_beasts.gbcattr"
Intro_Bladeberus_Tilemap:: INCBIN "gfx/intro/bladeberus.tilemap"
Intro_Beattro_Tilemap:: INCBIN "gfx/intro/beattro.tilemap"
Intro_Electreep_Tilemap:: INCBIN "gfx/intro/electreep.tilemap"
Intro_Charrot_Tilemap:: INCBIN "gfx/intro/charrot.tilemap"
Intro_Merlith_Tilemap:: INCBIN "gfx/intro/merlith.tilemap"
Intro_Muserode_Tilemap:: INCBIN "gfx/intro/muserode.tilemap"
Intro_Signaliton_Tilemap:: INCBIN "gfx/intro/signaliton.tilemap"
Intro_Drawvile_Tilemap:: INCBIN "gfx/intro/drawvile.tilemap"

SECTION "Intro GFX 2", ROMX

Intro_Ballot_GFX:: INCBIN "gfx/intro/ballot.2bpp"
Intro_Bladeberus_GFX:: INCBIN "gfx/intro/bladeberus.2bpp"
Intro_Buck_GFX:: INCBIN "gfx/intro/buck.2bpp"
Intro_Beattro_GFX:: INCBIN "gfx/intro/beattro.2bpp"
Intro_Nina_GFX:: INCBIN "gfx/intro/nina.2bpp"
Intro_Electreep_GFX:: INCBIN "gfx/intro/electreep.2bpp"
Intro_Claude_GFX:: INCBIN "gfx/intro/claude.2bpp"
Intro_Charrot_GFX:: INCBIN "gfx/intro/charrot.2bpp"
Intro_Helen_GFX:: INCBIN "gfx/intro/helen.2bpp"
Intro_Merlith_GFX:: INCBIN "gfx/intro/merlith.2bpp"
Intro_Lante_GFX:: INCBIN "gfx/intro/lante.2bpp"
Intro_Muserode_GFX:: INCBIN "gfx/intro/muserode.2bpp"

SECTION "Intro GFX 3", ROMX

Intro_Randt_GFX:: INCBIN "gfx/intro/randt.2bpp"
Intro_Signaliton_GFX:: INCBIN "gfx/intro/signaliton.2bpp"
Intro_Mitt_GFX:: INCBIN "gfx/intro/mitt.2bpp"
Intro_Drawvile_GFX:: INCBIN "gfx/intro/drawvile.2bpp"
Intro_Text1_GFX:: INCBIN "gfx/intro/text1.2bpp"
Intro_Text2_GFX:: INCBIN "gfx/intro/text2.2bpp"
Intro_Text3_GFX:: INCBIN "gfx/intro/text3.2bpp"
Intro_Text4_GFX:: INCBIN "gfx/intro/text4.2bpp"
Intro_Text5_GFX:: INCBIN "gfx/intro/text5.2bpp"
Intro_Text6_GFX:: INCBIN "gfx/intro/text6.2bpp"
Intro_Text7_GFX:: INCBIN "gfx/intro/text7.2bpp"
Intro_Text8_GFX:: INCBIN "gfx/intro/text8.2bpp"

SECTION "Meteor Cutscene GFX", ROMX

MeteorCutscene_BlackPalette:: INCBIN "gfx/meteor/cutscene_black.pal"
MeteorCutscene_TextPalette:: INCBIN "gfx/meteor/cutscene_text.pal"
MeteorCutscene_Text1_Tilemap:: INCBIN "gfx/meteor/text_1.tilemap"
MeteorCutscene_Text4_Tilemap:: INCBIN "gfx/meteor/text_4.tilemap"
MeteorCutscene_TextAttr:: INCBIN "gfx/meteor/cutscene_text.attr"
MeteorCutscene_TextGFX_1:: INCBIN "gfx/meteor/text_gfx_1.2bpp"
MeteorCutscene_TextGFX_2:: INCBIN "gfx/meteor/text_gfx_2.2bpp"
MeteorCutscene_TextGFX_3:: INCBIN "gfx/meteor/text_gfx_3.2bpp"
unk_008_6eae:: INCBIN "data/unk_008_6eae.bin" ; ??
MeteorCutscene_Text2_Tilemap:: INCBIN "gfx/meteor/text_2.tilemap"
MeteorCutscene_Text3_Tilemap:: INCBIN "gfx/meteor/text_3.tilemap"
unk_008_6f26:: INCBIN "data/unk_008_6f26.bin" ; ??
MeteorCutscene_Text5_Tilemap:: INCBIN "gfx/meteor/text_5.tilemap"
MeteorCutscene_Text6_Tilemap:: INCBIN "gfx/meteor/text_6.tilemap"
MeteorCutscene_Text7_Tilemap:: INCBIN "gfx/meteor/text_7.tilemap"
MeteorCutscene_Text8_Tilemap:: INCBIN "gfx/meteor/text_8.tilemap"
MeteorCutscene_Text9_Tilemap:: INCBIN "gfx/meteor/text_9.tilemap"
MeteorCutscene_StormTilemap_1:: INCBIN "gfx/meteor/storm_bg_1.tilemap"
MeteorCutscene_StormAttr:: INCBIN "gfx/meteor/storm.gbcattr"
MeteorCutscene_MeteorPalette:: INCBIN "gfx/meteor/meteor_bg.pal"
MeteorCutscene_OBJPalette:: INCBIN "gfx/meteor/meteor_obj.pal"
MeteorCutscene_StormGFX:: INCBIN "gfx/meteor/storm.2bpp"
MeteorCutscene_MeteorGFX:: INCBIN "gfx/meteor/meteor.2bpp"
MeteorCutscene_StormTilemap_2:: INCBIN "gfx/meteor/storm_bg_2.tilemap"
MeteorCutscene_StormTilemap_3:: INCBIN "gfx/meteor/storm_bg_3.tilemap"

SECTION "Gale Cutscene GFX", ROMX

GaleCutscene_Attrmap::
	ds $168 ; all palette 0
	ds $118 ; padding
GaleCutscene_Tilemap0:: INCBIN "gfx/gale/galecutscene_tilemap0.tilemap"
GaleCutscene_Tilemap1:: INCBIN "gfx/gale/galecutscene_tilemap1.tilemap"
GaleCutscene_Tilemap2:: INCBIN "gfx/gale/galecutscene_tilemap2.tilemap"
GaleCutscene_Tilemap3:: INCBIN "gfx/gale/galecutscene_tilemap3.tilemap"
GaleCutscene_BlackPalette:: INCLUDE "gfx/gale/black.pal"
GaleCutscene_Palette:: INCLUDE "gfx/gale/palette.pal"
GaleCutscene_GFX:: INCBIN "gfx/gale/galecutscene_gfx.2bpp"

SECTION "Letter Cutscene GFX", ROMX

LetterCutscene_BlackPalette::
	ds $40 ; all RGB 0, 0, 0 (fade to black)

LetterCutscene_Palette::
	RGB 31, 31, 31
	RGB 8, 21, 31
	RGB 0, 0, 23
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	ds 8 ; padding

LetterCutscene_Attrmap:: ds $168 ; all palette 0

LetterCutscene_InitialTilemap:: INCBIN "gfx/tilemaps/lettercutscene_tilemap_initial.tilemap"
LetterCutscene_Tilemap0:: INCBIN "gfx/tilemaps/lettercutscene_tilemap0.tilemap"
LetterCutscene_Tilemap1:: INCBIN "gfx/tilemaps/lettercutscene_tilemap1.tilemap"
LetterCutscene_Tilemap2:: INCBIN "gfx/tilemaps/lettercutscene_tilemap2.tilemap"
LetterCutscene_Tilemap3:: INCBIN "gfx/tilemaps/lettercutscene_tilemap3.tilemap"

LetterCutscene_GFX:: INCBIN "gfx/misc/lettercutscene_gfx.2bpp"


SECTION "Airport Cutscene GFX", ROMX

AirportCutscene1_Palette::
	RGB 31, 31, 31
	RGB 22, 27, 31
	RGB 8, 17, 31
	RGB 0, 0, 25
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB 16, 16, 16
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
AirportCutscene1_ObjPalette::
	RGB 25, 25, 25
	RGB 0, 0, 1
	RGB 31, 18, 18
	RGB 31, 31, 31
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
AirportCutscene1_Tilemap:: INCBIN "gfx/tilemaps/airportcutscene1_tilemap.tilemap"
AirportCutscene1_Attrmap:: INCBIN "gfx/attrmaps/airportcutscene1_attrmap.bin"
AirportCutscene1_GFX:: INCBIN "gfx/misc/airportcutscene1_gfx.2bpp"
AirportCutscene1_ObjGFX:: INCBIN "gfx/misc/airportcutscene1_objgfx.bin"

SECTION "Battle UI GFX", ROMX

BattleUIGFX:: INCBIN "gfx/misc/battleuigfx.2bpp"
BattleUIGFX_476a:: INCBIN "gfx/misc/battleuigfx_476a.2bpp"
BattleUIGFX_483a:: INCBIN "gfx/misc/battleuigfx_483a.2bpp"
BattleUIGFX_491a:: INCBIN "gfx/misc/battleuigfx_491a.2bpp"
BattleUIGFX_4b8a:: INCBIN "gfx/misc/battleuigfx_4b8a.2bpp"
BattleUIGFX_4e0a:: INCBIN "gfx/misc/battleuigfx_4e0a.2bpp"
BattleUIGFX_4e6a:: INCBIN "gfx/misc/battleuigfx_4e6a.2bpp"
BattleUIGFX_4e9a:: INCBIN "gfx/misc/battleuigfx_4e9a.2bpp"
BattleUIGFX_527a:: INCBIN "gfx/misc/battleuigfx_527a.2bpp"
BattleUIGFX_52fa:: INCBIN "gfx/misc/battleuigfx_52fa.2bpp"
BattleUIGFX_53fa:: INCBIN "gfx/misc/battleuigfx_53fa.2bpp"
BattleUIGFX_55da:: INCBIN "gfx/misc/battleuigfx_55da.2bpp"
BattleUIGFX_571a:: INCBIN "gfx/misc/battleuigfx_571a.2bpp"
BattleUIGFX_5a3a:: INCBIN "gfx/misc/battleuigfx_5a3a.2bpp"
BattleUIGFX_5e3a:: INCBIN "gfx/misc/battleuigfx_5e3a.2bpp"
BattleUIGFX_5e4a:: INCBIN "gfx/misc/battleuigfx_5e4a.2bpp"

SECTION "bank0c Misc GFX", ROMX
Pointers_00c_5f4a::
	dw OptionGFX_00c_5f5c
	dw OptionGFX_00c_5fdc
	dw OptionGFX_00c_605c
	dw OptionGFX_00c_60dc
	dw OptionGFX_00c_615c
	dw OptionGFX_00c_61dc
	dw OptionGFX_00c_625c
	dw OptionGFX_00c_62dc
	dw OptionGFX_00c_635c
OptionGFX_00c_5f5c:: INCBIN "gfx/sprites/optiongfx.2bpp", $0, $80
OptionGFX_00c_5fdc:: INCBIN "gfx/sprites/optiongfx.2bpp", $80, $80
OptionGFX_00c_605c:: INCBIN "gfx/sprites/optiongfx.2bpp", $100, $80
OptionGFX_00c_60dc:: INCBIN "gfx/sprites/optiongfx.2bpp", $180, $80
OptionGFX_00c_615c:: INCBIN "gfx/sprites/optiongfx.2bpp", $200, $80
OptionGFX_00c_61dc:: INCBIN "gfx/sprites/optiongfx.2bpp", $280, $80
OptionGFX_00c_625c:: INCBIN "gfx/sprites/optiongfx.2bpp", $300, $80
OptionGFX_00c_62dc:: INCBIN "gfx/sprites/optiongfx.2bpp", $380, $80
OptionGFX_00c_635c:: INCBIN "gfx/sprites/optiongfx.2bpp", $400, $80
Pointers_00c_63dc::
	dw Pointers_00c_63dc_63ee
	dw Pointers_00c_63dc_64ee
	dw Pointers_00c_63dc_65ee
	dw Pointers_00c_63dc_66ee
	dw Pointers_00c_63dc_67ee
	dw Pointers_00c_63dc_68ee
	dw Pointers_00c_63dc_69ee
	dw Pointers_00c_63dc_6aee
	dw Pointers_00c_63dc_6bee
Pointers_00c_63dc_63ee::
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

; character sets

SECTION "charset0_low", ROMX
GFX_040_4000:: INCBIN "gfx/character_set/image_40_4000.1bpp"

SECTION "charset0_high", ROMX
GFX_040_6000:: INCBIN "gfx/character_set/image_40_6000.1bpp"

SECTION "charset1_low", ROMX
GFX_041_4000: INCBIN "gfx/character_set/image_41_4000.1bpp"

SECTION "charset1_high", ROMX
GFX_041_6000: INCBIN "gfx/character_set/image_41_6000.1bpp"

SECTION "charset2_low", ROMX
GFX_042_4000: INCBIN "gfx/character_set/image_42_4000.1bpp"

SECTION "charset2_high", ROMX
GFX_042_6000: INCBIN "gfx/character_set/image_42_6000.1bpp"

SECTION "charset3_low", ROMX
GFX_043_4000: INCBIN "gfx/character_set/image_43_4000.1bpp"

SECTION "charset3_high", ROMX
GFX_043_6000: INCBIN "gfx/character_set/image_43_6000.1bpp"

SECTION "charset4_low", ROMX
GFX_044_4000: INCBIN "gfx/character_set/image_44_4000.1bpp"

SECTION "charset4_high", ROMX
GFX_044_6000: INCBIN "gfx/character_set/image_44_6000.1bpp"

; tile set gfx

SECTION "Tilesets 1", ROMX

TilesetFrag_1:: INCBIN "gfx/tilesets/image_16_4000.2bpp"
TilesetFrag_2:: INCBIN "gfx/tilesets/image_16_4560.2bpp"
TilesetFrag_3:: INCBIN "gfx/tilesets/image_16_47e0.2bpp"
TilesetFrag_4:: INCBIN "gfx/tilesets/image_16_4a70.2bpp"
TilesetFrag_5:: INCBIN "gfx/tilesets/image_16_4c50.2bpp"
TilesetFrag_6:: INCBIN "gfx/tilesets/image_16_4fa0.2bpp"
TilesetFrag_7:: INCBIN "gfx/tilesets/image_16_5440.2bpp"
TilesetFrag_8:: INCBIN "gfx/tilesets/image_16_5550.2bpp"
TilesetFrag_9:: INCBIN "gfx/tilesets/image_16_5d50.2bpp"
TilesetFrag_10:: INCBIN "gfx/tilesets/image_16_5db0.2bpp"
TilesetFrag_11:: INCBIN "gfx/tilesets/image_16_6260.2bpp"
TilesetFrag_12:: INCBIN "gfx/tilesets/image_16_64e0.2bpp"
TilesetFrag_13:: INCBIN "gfx/tilesets/image_16_65b0.2bpp"
TilesetFrag_14:: INCBIN "gfx/tilesets/image_16_6b00.2bpp"
TilesetFrag_15:: INCBIN "gfx/tilesets/image_16_6cf0.2bpp"
TilesetFrag_16:: INCBIN "gfx/tilesets/image_16_7100.2bpp"
TilesetFrag_17:: INCBIN "gfx/tilesets/image_16_75b0.2bpp"
TilesetFrag_18:: INCBIN "gfx/tilesets/image_16_7aa0.2bpp"
TilesetFrag_19:: INCBIN "gfx/tilesets/image_16_7da0.2bpp"

SECTION "Tilesets 2", ROMX

TilesetFrag_20:: INCBIN "gfx/tilesets/gfx_017_4f9e.2bpp"
TilesetFrag_21:: INCBIN "gfx/tilesets/gfx_017_511e.2bpp"
TilesetFrag_22:: INCBIN "gfx/tilesets/image_17_512e.2bpp"
TilesetFrag_23:: INCBIN "gfx/tilesets/image_17_578e.2bpp"
TilesetFrag_24:: INCBIN "gfx/tilesets/image_17_5c1e.2bpp"
TilesetFrag_25:: INCBIN "gfx/tilesets/gfx_017_612e.2bpp"
TilesetFrag_26:: INCBIN "gfx/tilesets/gfx_017_66ce.2bpp"
TilesetFrag_27:: INCBIN "gfx/tilesets/image_17_680e.2bpp"
TilesetFrag_28:: INCBIN "gfx/tilesets/gfx_017_6cae.2bpp"
TilesetFrag_29:: INCBIN "gfx/tilesets/gfx_017_6e2e.2bpp"
TilesetFrag_30:: INCBIN "gfx/tilesets/gfx_017_739e.2bpp"
TilesetFrag_31:: INCBIN "gfx/tilesets/gfx_017_783e.2bpp"

SECTION "Tilesets 3", ROMX

TilesetFrag_32:: INCBIN "gfx/tilesets/image_19_4000.2bpp"
TilesetFrag_33:: INCBIN "gfx/tilesets/image_19_4670.2bpp"
TilesetFrag_34:: INCBIN "gfx/tilesets/image_19_47f0.2bpp"
TilesetFrag_35:: INCBIN "gfx/tilesets/image_19_4960.2bpp"
TilesetFrag_36:: INCBIN "gfx/tilesets/gfx_019_49e0.2bpp"
TilesetFrag_37:: INCBIN "gfx/tilesets/gfx_019_4fc0.2bpp"
TilesetFrag_38:: INCBIN "gfx/tilesets/gfx_019_5180.2bpp"
TilesetFrag_39:: INCBIN "gfx/tilesets/gfx_019_5810.2bpp"
TilesetFrag_40:: INCBIN "gfx/tilesets/gfx_019_5970.2bpp"
TilesetFrag_41:: INCBIN "gfx/tilesets/gfx_019_5b50.2bpp"
TilesetFrag_42:: INCBIN "gfx/tilesets/gfx_019_6350.2bpp"
TilesetFrag_43:: INCBIN "gfx/tilesets/gfx_019_6440.2bpp"
TilesetFrag_44:: INCBIN "gfx/tilesets/gfx_019_68e0.2bpp"
TilesetFrag_45:: INCBIN "gfx/tilesets/gfx_019_6a60.2bpp"
TilesetFrag_46:: INCBIN "gfx/tilesets/gfx_019_6c20.2bpp"
TilesetFrag_47:: INCBIN "gfx/tilesets/gfx_019_7420.2bpp"
TilesetFrag_48:: INCBIN "gfx/tilesets/gfx_019_7470.2bpp"
TilesetFrag_49:: INCBIN "gfx/tilesets/gfx_019_7a00.2bpp"

SECTION "Tilesets 4", ROMX

TilesetFrag_50:: INCBIN "gfx/tilesets/gfx_051_4000.2bpp"
TilesetFrag_51:: INCBIN "gfx/tilesets/gfx_051_4800.2bpp"
TilesetFrag_52:: INCBIN "gfx/tilesets/gfx_051_49c0.2bpp"
TilesetFrag_53:: INCBIN "gfx/tilesets/gfx_051_51c0.2bpp"
TilesetFrag_54:: INCBIN "gfx/tilesets/gfx_051_5360.2bpp"
TilesetFrag_55:: INCBIN "gfx/tilesets/gfx_051_53e0.2bpp"
TilesetFrag_56:: INCBIN "gfx/tilesets/gfx_051_5470.2bpp"
TilesetFrag_57:: INCBIN "gfx/tilesets/gfx_051_5810.2bpp"
TilesetFrag_58:: INCBIN "gfx/tilesets/gfx_051_5a90.2bpp"
TilesetFrag_59:: INCBIN "gfx/tilesets/gfx_051_5e70.2bpp"
TilesetFrag_60:: INCBIN "gfx/tilesets/gfx_051_6280.2bpp"
TilesetFrag_61:: INCBIN "gfx/tilesets/gfx_051_6380.2bpp"
TilesetFrag_62:: INCBIN "gfx/tilesets/gfx_051_6440.2bpp"
TilesetFrag_63:: INCBIN "gfx/tilesets/gfx_051_66c0.2bpp"
TilesetFrag_64:: INCBIN "gfx/tilesets/gfx_051_6720.2bpp"
TilesetFrag_65:: INCBIN "gfx/tilesets/gfx_051_68c0.2bpp"

SECTION "Tilesets 5", ROMX

TilesetFrag_66:: INCBIN "gfx/tilesets/gfx_054_4000.2bpp"
TilesetFrag_67:: INCBIN "gfx/tilesets/gfx_054_4800.2bpp"
TilesetFrag_68:: INCBIN "gfx/tilesets/gfx_054_4830.2bpp"
TilesetFrag_69:: INCBIN "gfx/tilesets/gfx_054_5010.2bpp"
TilesetFrag_71:: INCBIN "gfx/tilesets/gfx_054_53a0.2bpp"
TilesetFrag_72:: INCBIN "gfx/tilesets/gfx_054_55c0.2bpp"
TilesetFrag_73:: INCBIN "gfx/tilesets/gfx_054_58e0.2bpp"
TilesetFrag_74:: INCBIN "gfx/tilesets/gfx_054_5dd0.2bpp"
TilesetFrag_75:: INCBIN "gfx/tilesets/gfx_054_60d0.2bpp"
TilesetFrag_77:: INCBIN "gfx/tilesets/gfx_054_62d0.2bpp"
TilesetFrag_78:: INCBIN "gfx/tilesets/gfx_054_6410.2bpp"
TilesetFrag_79:: INCBIN "gfx/tilesets/gfx_054_6670.2bpp"
TilesetFrag_80:: INCBIN "gfx/tilesets/gfx_054_6770.2bpp"
TilesetFrag_81:: INCBIN "gfx/tilesets/gfx_054_6810.2bpp"
TilesetFrag_83:: INCBIN "gfx/tilesets/gfx_054_6990.2bpp"
TilesetFrag_84:: INCBIN "gfx/tilesets/gfx_054_6dc0.2bpp"
TilesetFrag_85:: INCBIN "gfx/tilesets/gfx_054_7380.2bpp"
TilesetFrag_86:: INCBIN "gfx/tilesets/gfx_054_7880.2bpp"
TilesetFrag_87:: INCBIN "gfx/tilesets/gfx_054_7a40.2bpp"
TilesetFrag_88:: INCBIN "gfx/tilesets/gfx_054_7b50.2bpp"
TilesetFrag_70:: INCBIN "gfx/tilesets/gfx_054_7bf0.2bpp"

SECTION "Tilesets 6", ROMX

TilesetFrag_89:: INCBIN "gfx/tilesets/gfx_056_4000.2bpp"
TilesetFrag_90:: INCBIN "gfx/tilesets/gfx_056_4540.2bpp"
TilesetFrag_91:: INCBIN "gfx/tilesets/gfx_056_47f0.2bpp"
TilesetFrag_92:: INCBIN "gfx/tilesets/gfx_056_4940.2bpp"
TilesetFrag_93:: INCBIN "gfx/tilesets/gfx_056_4980.2bpp"
TilesetFrag_76:: INCBIN "gfx/tilesets/gfx_056_4a30.2bpp"
TilesetFrag_82:: INCBIN "gfx/tilesets/gfx_056_4bc0.2bpp"
TilesetFrag_94:: INCBIN "gfx/tilesets/gfx_056_4cb0.2bpp"
TilesetFrag_95:: INCBIN "gfx/tilesets/gfx_056_5150.2bpp"
TilesetFrag_96:: INCBIN "gfx/tilesets/gfx_056_5270.2bpp"
TilesetFrag_97:: INCBIN "gfx/tilesets/gfx_056_5960.2bpp"
TilesetFrag_98:: INCBIN "gfx/tilesets/gfx_056_5e40.2bpp"
TilesetFrag_99:: INCBIN "gfx/tilesets/gfx_056_6640.2bpp"

SECTION "Tilesets 7", ROMX

TilesetFrag_100:: INCBIN "gfx/tilesets/gfx_065_4000.2bpp"
TilesetFrag_101:: INCBIN "gfx/tilesets/gfx_065_4580.2bpp"
TilesetFrag_102:: INCBIN "gfx/tilesets/gfx_065_4a20.2bpp"
TilesetFrag_103:: INCBIN "gfx/tilesets/gfx_065_4aa0.2bpp"
TilesetFrag_104:: INCBIN "gfx/tilesets/gfx_065_51e0.2bpp"
TilesetFrag_105:: INCBIN "gfx/tilesets/gfx_065_53a0.2bpp"
TilesetFrag_106:: INCBIN "gfx/tilesets/gfx_065_54f0.2bpp"
TilesetFrag_107:: INCBIN "gfx/tilesets/gfx_065_55b0.2bpp"
TilesetFrag_108:: INCBIN "gfx/tilesets/gfx_065_55f0.2bpp"

SECTION "Tilesets 8", ROMX

TilesetFrag_109:: INCBIN "gfx/tilesets/gfx_06b_4000.2bpp"
TilesetFrag_110:: INCBIN "gfx/tilesets/gfx_06b_4080.2bpp"
TilesetFrag_111:: INCBIN "gfx/tilesets/gfx_06b_4360.2bpp"
TilesetFrag_112:: INCBIN "gfx/tilesets/gfx_06b_43c0.2bpp"
TilesetFrag_113:: INCBIN "gfx/tilesets/gfx_06b_47b0.2bpp"
TilesetFrag_114:: INCBIN "gfx/tilesets/gfx_06b_4850.2bpp"
TilesetFrag_115:: INCBIN "gfx/tilesets/gfx_06b_48c0.2bpp"
TilesetFrag_116:: INCBIN "gfx/tilesets/gfx_06b_4be0.2bpp"
TilesetFrag_117:: INCBIN "gfx/tilesets/gfx_06b_4ca0.2bpp"
TilesetFrag_118:: INCBIN "gfx/tilesets/gfx_06b_52b0.2bpp"
TilesetFrag_119:: INCBIN "gfx/tilesets/gfx_06b_55c0.2bpp"
TilesetFrag_120:: INCBIN "gfx/tilesets/gfx_06b_5aa0.2bpp"
TilesetFrag_121:: INCBIN "gfx/tilesets/gfx_06b_5b20.2bpp"
TilesetFrag_122:: INCBIN "gfx/tilesets/gfx_06b_5be0.2bpp"
TilesetFrag_123:: INCBIN "gfx/tilesets/gfx_06b_5db0.2bpp"
TilesetFrag_124:: INCBIN "gfx/tilesets/gfx_06b_61e0.2bpp"

SECTION "Tilesets 9", ROMX

TilesetFrag_126:: INCBIN "gfx/tilesets/gfx_06b_66fe.2bpp"

SECTION "Tilesets 10", ROMX

TilesetFrag_127:: INCBIN "gfx/tilesets/gfx_06b_6f35.2bpp"
TilesetFrag_125:: INCBIN "gfx/tilesets/gfx_06b_7635.2bpp"
