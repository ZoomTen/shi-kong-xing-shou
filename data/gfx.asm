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

; character sets

SECTION "charset0_low", ROMX
GFX_040_4000: INCBIN "gfx/character_set/image_40_4000.1bpp"

SECTION "charset0_high", ROMX
GFX_040_6000: INCBIN "gfx/character_set/image_40_6000.1bpp"

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
