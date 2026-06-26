	const_def

	const script_scont ; $00
MACRO scont
	db script_scont
ENDM

	const script_spriteface ; $01
MACRO spriteface
; sprite ID 0 is player
; sprite ID 1 is follower
; sprite ID 2+ is everything else
	db script_spriteface
	db \1 ; sprite ID
	db \2 ; facing
ENDM

	const script_delay ; $02
MACRO delay
	db script_delay
	db \1 ; mask
	db \2 ; delay
ENDM

	const script_delaywait ; $03
MACRO delaywait
	db script_delaywait
ENDM

	const script_textface ; $04
MACRO textface
	assert BANK(\1) == BANK(@)
	db script_textface
	dw \1
ENDM

	const script_face ; $05
MACRO face
	db script_face
	db \1 ; facing
ENDM

	const script_spritewalk ; $06
MACRO spritewalk
; move a sprite in the direction
; specified by MOVE_* in \2
; this does NOT automatically make
; the sprite face the appropriate
; direction
	db script_spritewalk
	db \1
	db \2
ENDM

	const script_spritewalkstep ; $07
MACRO spritewalkstep
	db script_spritewalkstep
ENDM

	const script_setwalktarget ; $08
MACRO setwalktarget
	db script_setwalktarget
	db \1
ENDM

	const script_end ; $09
MACRO end
	db script_end
ENDM

	const script_checkbit ; $0a
MACRO checkbit
	db script_checkbit
	dw \1
	assert BANK(\3) == BANK(@)
	db \2
	dw \3
ENDM

	const script_setbit ; $0b
MACRO setbit
	db script_setbit
	dw \1
	db \2
ENDM

	const script_setmap ; $0c
MACRO setmap
; This warps to a map in the same group
; as the map the script is in.
	db script_setmap
	db \1 ; map number
	db \2 ; warp number
ENDM

	const script_movemap ; $0d
MACRO movemap
; Applies movement data to the loaded map.
; It should be used with maps that have
; no associated object events.
	assert BANK(\1) == BANK(Func_00b_6229) ; movemap step derefs in its bank
	db script_movemap
	dw \1 ; movement data (same as sprite)
ENDM

	const script_movemapstep ; $0e
MACRO movemapstep
	db script_movemapstep
ENDM

	const script_move ; $0f
MACRO move
	assert BANK(\1) == BANK(Func_00b_60dd) ; move step derefs in its bank
	db script_move
	dw \1 ; movement data
ENDM

	const script_movestep ; $10
MACRO movestep
	db script_movestep
ENDM

	const script_move2 ; $11
MACRO move2
	assert BANK(\1) == BANK(Func_00b_60b2) ; move2 step derefs in its bank
	db script_move2
	dw \1
ENDM

	const script_move2step ; $12
MACRO move2step
	db script_move2step
ENDM

	const script_setbgcopy ; $13
MACRO setbgcopy
; \1 = BG dest (VRAM); \2 = BG-copy table, dereferenced in bank $0b (Func_00b_606f)
	assert BANK(\2) == BANK(Func_00b_606f) ; BG-copy stamper derefs in its bank
	db script_setbgcopy
	dw \1, \2
ENDM

	const script_stext ; $14
MACRO stext
	assert BANK(\1) == BANK(@)
	db script_stext
	dw \1 ; text
ENDM

	const script_emote ; $15
MACRO emote
	db script_emote
	db \1 ; sprite?
	db \2 ; emote
ENDM

	const script_loadobjsprite ; $16
MACRO loadobjsprite
	assert BANK(\1) == BANK(@)
	db script_loadobjsprite
	dw \1
ENDM

	const script_offsetobject ; $17
MACRO offsetobject
	db script_offsetobject
	db \1, \2, \3
ENDM

	const script_objscript ; $18
MACRO objscript
	db script_objscript
	assert BANK(\2) == BANK(Script_19) ; run as a script by objscriptstep ($19)
	db \1 ; sprite ID
	dw \2 ; movement script
ENDM

	const script_objscriptstep ; $19
MACRO objscriptstep
	db script_objscriptstep
	db \1, \2 ; XXX variable?
ENDM

	const script_setattach ; $1a
MACRO setattach
	db script_setattach
	db \1 ; attached sprite ID
	db \2 ; target sprite ID
	db \3, \4 ; offset
ENDM

	const script_clearattach ; $1b
MACRO clearattach
	db script_clearattach
	db \1
ENDM

	const script_clearobject ; $1c
MACRO clearobject
	db script_clearobject
	db \1
ENDM

	const script_objmapcoords ; $1d
MACRO objmapcoords
	db script_objmapcoords
	db \1
ENDM

	const script_setmapobjbyte ; $1e
MACRO setmapobjbyte
	db script_setmapobjbyte
	db \1, \2
ENDM

	const script_setmappredef ; $1f
MACRO setmappredef
	db script_setmappredef
	db \1
ENDM

	const script_spawnanim ; $20
MACRO spawnanim
	db script_spawnanim
ENDM

	const script_copyobjfield ; $21
MACRO copyobjfield
	db script_copyobjfield
	db \1, \2
ENDM

	const script_copyobjy ; $22
MACRO copyobjy
	db script_copyobjy
	db \1, \2
ENDM

	const script_loadspriteat ; $23
MACRO loadspriteat
	db script_loadspriteat
	db \1, \2, \3
ENDM

	const script_walkpath ; $24
MACRO walkpath
	db script_walkpath
ENDM

	const script_walkpathstep ; $25
MACRO walkpathstep
	db script_walkpathstep
ENDM

	const script_removeobj ; $26
MACRO removeobj
	db script_removeobj
	db \1
ENDM

	const script_clearbit ; $27
MACRO clearbit
	db script_clearbit
	dw \1
	db \2
ENDM

	const script_fadeout ; $28
MACRO fadeout
	db script_fadeout
ENDM

	const script_fadein ; $29
MACRO fadein
	db script_fadein
ENDM

	const script_farjump ; $2a
MACRO farjump
	db script_farjump
	dba \1
ENDM

	const script_jumpifnotdown ; $2b
MACRO jumpifnotdown
	assert BANK(\1) == BANK(@)
	db script_jumpifnotdown
	dw \1
ENDM

	const script_reloadscreen ; $2c
MACRO reloadscreen
	db script_reloadscreen
ENDM

	const script_copytilemap ; $2d
MACRO copytilemap
	db script_copytilemap
	db \1, \2, \3, \4
ENDM

	const script_setlayouttile ; $2e
MACRO setlayouttile
	db script_setlayouttile
	dw \1 ; map layout offset
	db \2 ; tile
ENDM

	const script_copygfx ; $2f
MACRO copygfx
	db script_copygfx
	db \1, \2, \3, \4
ENDM

	const script_setbgcopyplayer ; $30
MACRO setbgcopyplayer
; \1 = BG-copy pointer table (dw -> {w,h,tiles}); dereferenced in bank $0b (Func_00b_606f)
	assert BANK(\1) == BANK(Func_00b_606f) ; BG-copy stamper derefs in its bank
	db script_setbgcopyplayer
	dw \1
ENDM

	const script_copytilemapplayer ; $31
MACRO copytilemapplayer
	db script_copytilemapplayer
	db \1, \2
ENDM

	const script_facemove1 ; $32
MACRO facemove1
	db script_facemove1
ENDM

	const script_facemove2 ; $33
MACRO facemove2
	db script_facemove2
	db \1
ENDM

	const script_warpmode ; $34
MACRO warpmode
	db script_warpmode
	db \1 ; cutscene
	db \2 ; map number
	db \3 ; warp number
ENDM

	const script_35 ; $35
MACRO scr_35
	db script_35, \1
ENDM

	const script_townmusicanim ; $36
MACRO townmusicanim
	db script_townmusicanim
ENDM

	const script_37 ; $37
MACRO scr_37
	db script_37
ENDM

	const script_38 ; $38
MACRO scr_38
	db script_38
ENDM

	const script_runmovement ; $39
MACRO runmovement
	assert BANK(\1) == BANK(Script_3a) ; runmovement step ($3a) derefs in its bank
	db script_runmovement
	dw \1
ENDM

	const script_runmovementstep ; $3a
MACRO runmovementstep
	db script_runmovementstep
ENDM

	const script_startbattle ; $3b
MACRO startbattle
; \1 = enemy battle-data pointer; dereferenced in bank $2d (see Func_02d_50b3)
	assert BANK(\1) == BANK(Func_02d_507b) ; battle-data deref in its bank
	db script_startbattle
	dw \1
ENDM

	const script_ifmoney ; $3c
MACRO ifmoney
	db script_ifmoney
	dw \1
ENDM

	const script_ifmoney2 ; $3d
MACRO ifmoney2
	db script_ifmoney2
	dw \1
ENDM

	const script_sjump ; $3e
MACRO sjump
	assert BANK(\1) == BANK(@)
	db script_sjump
	dw \1
ENDM

	const script_countflags7 ; $3f
MACRO countflags7
	db script_countflags7
ENDM

	const script_getobjstatus ; $40
MACRO getobjstatus
	db script_getobjstatus
	db \1
ENDM

	const script_refreshobjects ; $41
MACRO refreshobjects
	db script_refreshobjects
ENDM

	const script_getmapobjbyte ; $42
MACRO getmapobjbyte
	db script_getmapobjbyte
	db \1
ENDM

	const script_clearbgfade ; $43
MACRO clearbgfade
	db script_clearbgfade
ENDM

	const script_clearplayerpos ; $44
MACRO clearplayerpos
	db script_clearplayerpos
ENDM

	const script_setup45 ; $45
MACRO setup45
	db script_setup45
	db \1, \2, \3, \4, \5, \6, \7
ENDM

	const script_addmoney ; $46
MACRO addmoney
	db script_addmoney
	db \1, \2
ENDM

	const script_warpmode2 ; $47
MACRO warpmode2
	db script_warpmode2
	db \1, \2, \3, \4
ENDM

	const script_48 ; $48
MACRO scr_48
	db script_48
	db \1
	db \2
ENDM

	const script_49 ; $49
MACRO scr_49
	db script_49
ENDM

	const script_startsub ; $4a
MACRO startsub
	db script_startsub
	db \1
ENDM

	const script_stopsub ; $4b
MACRO stopsub
	db script_stopsub
ENDM

	const script_returnmap ; $4c
MACRO returnmap
	db script_returnmap
ENDM

	const script_listdec ; $4d
MACRO listdec
	db script_listdec
	db \1, \2
ENDM

	const script_objmove ; $4e
MACRO objmove
	db script_objmove
	assert BANK(\2) == BANK(@)
	db \1
	dw \2
ENDM

	const script_ifspecies ; $4f
MACRO ifspecies
	db script_ifspecies
	db \1
ENDM

	const script_clearmon ; $50
MACRO clearmon
	db script_clearmon
ENDM

	const script_51 ; $51
MACRO scr_51
	db script_51
	db \1, \2
ENDM

	const script_incsteps ; $52
MACRO incsteps
	db script_incsteps
ENDM

	const script_warp3 ; $53
MACRO warp3
	db script_warp3
	db \1, \2, \3
ENDM

	const script_objmoveb ; $54
MACRO objmoveb
	db script_objmoveb
	assert BANK(\2) == BANK(Script_55) ; run by Script_55 (handler forces this bank)
	db \1
	dw \2
ENDM

	const script_objaccum ; $55
MACRO objaccum
	db script_objaccum
	db \1, \2
ENDM

	const script_ifplayersprite ; $56
MACRO ifplayersprite
	db script_ifplayersprite
	db \1
ENDM

	const script_57 ; $57
MACRO scr_57
	db script_57
ENDM

	const script_setplayersprite ; $58
MACRO setplayersprite
	db script_setplayersprite
	db \1
ENDM

	const script_listop59 ; $59
MACRO listop59
	db script_listop59
	db \1, \2, \3
ENDM

	const script_listop5a ; $5a
MACRO listop5a
	db script_listop5a
	db \1, \2, \3
ENDM

	const script_jumpifnotright ; $5b
MACRO jumpifnotright
	assert BANK(\1) == BANK(@)
	db script_jumpifnotright
	dw \1
ENDM

	const script_reviveparty ; $5c
MACRO reviveparty
	db script_reviveparty
ENDM

	const script_scanparty ; $5d
MACRO scanparty
	db script_scanparty
	db \1
ENDM

	const script_setfollower ; $5e
MACRO setfollower
	db script_setfollower
	db \1 ; follower
ENDM

	const script_dirmovement ; $5f
MACRO dirmovement
	db script_dirmovement
ENDM

	const script_dirmovementstep ; $60
MACRO dirmovementstep
	db script_dirmovementstep
ENDM

	const script_loadscriptedmon ; $61
MACRO loadscriptedmon
	db script_loadscriptedmon
	db \1 ; scripted-mon index
ENDM

	const script_62 ; $62
MACRO scr_62
	db script_62
	db \1, \2
ENDM

	const script_ifcharindex ; $63
MACRO ifcharindex
	db script_ifcharindex
	assert BANK(\2) == BANK(@)
	db \1
	dw \2
ENDM

	const script_loadbufmon ; $64
MACRO loadbufmon
	db script_loadbufmon
ENDM

	const script_setplayerchar ; $65
MACRO setplayerchar
	db script_setplayerchar
	db \1
ENDM

	const script_farjump2 ; $66
MACRO farjump2
	db script_farjump2
if _NARG == 1
	dw \1
	db BANK(\1)
else
	dw \1 ; address
	db \2 ; bank (target unresolved)
endc
ENDM

	const script_swapfollower ; $67
MACRO swapfollower
	db script_swapfollower
ENDM

	const script_upgrademoves ; $68
MACRO upgrademoves
	db script_upgrademoves
ENDM

	const script_end2 ; $69
MACRO end2
	db script_end2
ENDM

	const script_randomwarp ; $6a
MACRO randomwarp
	db script_randomwarp
ENDM

	const script_warppowerplant ; $6b
MACRO warppowerplant
	db script_warppowerplant
ENDM

	const script_warp6c ; $6c
MACRO warp6c
	db script_warp6c
ENDM

	const script_countflags10 ; $6d
MACRO countflags10
	db script_countflags10
	db \1, \2, \3
ENDM

	const script_6e ; $6e
MACRO scr_6e
	assert BANK(\1) == BANK(@)
	assert BANK(\2) == BANK(@)
	assert BANK(\3) == BANK(@)
	assert BANK(\4) == BANK(@)
	assert BANK(\5) == BANK(@)
	assert BANK(\6) == BANK(@)
	assert BANK(\7) == BANK(@)
	assert BANK(\8) == BANK(@)
	assert BANK(\9) == BANK(@)
	db script_6e
	dw \1, \2, \3, \4, \5, \6, \7, \8, \9
ENDM

	const script_condtext ; $6f
MACRO condtext
	db script_condtext
ENDM

	const script_restorebank ; $70
MACRO restorebank
	db script_restorebank
ENDM

	const script_setmapgroup ; $71
MACRO setmapgroup
	db script_setmapgroup
	db \1
ENDM

	const script_facemove3 ; $72
MACRO facemove3
	assert BANK(\1) == BANK(@)
	assert BANK(\2) == BANK(@)
	assert BANK(\3) == BANK(@)
	assert BANK(\4) == BANK(@)
	db script_facemove3
	dw \1, \2, \3, \4
ENDM

	const script_facemove4 ; $73
MACRO facemove4
	db script_facemove4
ENDM

	const script_worldmap ; $74
MACRO worldmap
	db script_worldmap
ENDM

	const script_endrestore ; $75
MACRO endrestore
	db script_endrestore
ENDM

	const script_playsound ; $76
MACRO playsound
	db script_playsound
	db \1
ENDM

	const script_ifplayerx ; $77
MACRO ifplayerx
	db script_ifplayerx
ENDM
