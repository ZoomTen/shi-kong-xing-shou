INCLUDE "constants.asm"


SECTION "WRAM", WRAM0

wc000::
wVirtualOAM::
wVirtualOAMSprite00:: sprite_oam_struct wVirtualOAMSprite00
wVirtualOAMSprite01:: sprite_oam_struct wVirtualOAMSprite01
wVirtualOAMSprite02:: sprite_oam_struct wVirtualOAMSprite02
wVirtualOAMSprite03:: sprite_oam_struct wVirtualOAMSprite03
wVirtualOAMSprite04:: sprite_oam_struct wVirtualOAMSprite04
wVirtualOAMSprite05:: sprite_oam_struct wVirtualOAMSprite05
wVirtualOAMSprite06:: sprite_oam_struct wVirtualOAMSprite06
wVirtualOAMSprite07:: sprite_oam_struct wVirtualOAMSprite07
wVirtualOAMSprite08:: sprite_oam_struct wVirtualOAMSprite08
wVirtualOAMSprite09:: sprite_oam_struct wVirtualOAMSprite09
wVirtualOAMSprite10:: sprite_oam_struct wVirtualOAMSprite10
wVirtualOAMSprite11:: sprite_oam_struct wVirtualOAMSprite11
wVirtualOAMSprite12:: sprite_oam_struct wVirtualOAMSprite12
wVirtualOAMSprite13:: sprite_oam_struct wVirtualOAMSprite13
wVirtualOAMSprite14:: sprite_oam_struct wVirtualOAMSprite14
wVirtualOAMSprite15:: sprite_oam_struct wVirtualOAMSprite15
wVirtualOAMSprite16:: sprite_oam_struct wVirtualOAMSprite16
wVirtualOAMSprite17:: sprite_oam_struct wVirtualOAMSprite17
wVirtualOAMSprite18:: sprite_oam_struct wVirtualOAMSprite18
wVirtualOAMSprite19:: sprite_oam_struct wVirtualOAMSprite19
wVirtualOAMSprite20:: sprite_oam_struct wVirtualOAMSprite20
wVirtualOAMSprite21:: sprite_oam_struct wVirtualOAMSprite21
wVirtualOAMSprite22:: sprite_oam_struct wVirtualOAMSprite22
wVirtualOAMSprite23:: sprite_oam_struct wVirtualOAMSprite23
wVirtualOAMSprite24:: sprite_oam_struct wVirtualOAMSprite24
wVirtualOAMSprite25:: sprite_oam_struct wVirtualOAMSprite25
wVirtualOAMSprite26:: sprite_oam_struct wVirtualOAMSprite26
wVirtualOAMSprite27:: sprite_oam_struct wVirtualOAMSprite27
wVirtualOAMSprite28:: sprite_oam_struct wVirtualOAMSprite28
wVirtualOAMSprite29:: sprite_oam_struct wVirtualOAMSprite29
wVirtualOAMSprite30:: sprite_oam_struct wVirtualOAMSprite30
wVirtualOAMSprite31:: sprite_oam_struct wVirtualOAMSprite31
wVirtualOAMSprite32:: sprite_oam_struct wVirtualOAMSprite32
wVirtualOAMSprite33:: sprite_oam_struct wVirtualOAMSprite33
wVirtualOAMSprite34:: sprite_oam_struct wVirtualOAMSprite34
wVirtualOAMSprite35:: sprite_oam_struct wVirtualOAMSprite35
wVirtualOAMSprite36:: sprite_oam_struct wVirtualOAMSprite36
wVirtualOAMSprite37:: sprite_oam_struct wVirtualOAMSprite37
wVirtualOAMSprite38:: sprite_oam_struct wVirtualOAMSprite38
wVirtualOAMSprite39:: sprite_oam_struct wVirtualOAMSprite39
wVirtualOAMEnd::

wc0a0:: ds $10

wBGMapBufferPointers:: ds $38

wc0e8:: ds $18

wMapLayout:: ds $640

wc740:: ds $1e0

; c920
wTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::

wca88:: ds $28

wPaletteBuffer:: ds $40

wcaf0:: ds 8 * 8

wScreenRowBuffer:: ds 8 * SCREEN_WIDTH

wcbd0:: ds $20

wCharacterTilemapPos:: ds 1
wTextLine:: ds 1
wCharacterTileCount:: ds 1
wcbf3:: ds 1
wCharacterBGMapTransferStatus:: ds 1
wCharacterTileTransferStatus:: ds 1
wcbf6:: ds 1
wTextNameID:: ds 1

wScriptPos:: ds 2
wScriptByte:: ds 1
wSelectedObjectOffset:: ds 1 ; relative to wVisibleObjects
wcbfc:: ds 1
wcbfd:: ds 1

wTextStart:: ds 2

; eight 4-color palettes each
wBGPals1:: ds 8 palettes
wOBPals1:: ds 8 palettes
wBGPals2:: ds 8 palettes
wOBPals2:: ds 8 palettes

UNION
; This isn't actually the position of the player relative to the map,
; but rather the player's sprite position on the screen.
wPlayerScreenY:: ds 1
wPlayerScreenX:: ds 1

wcd02:: ds 1
wPlayerFacing:: ds 1
wPlayerSpriteID:: ds 1
wPlayerAnimFrame:: ds 1
wcd06:: ds 1
wcd07:: ds 1
wcd08:: ds 1
wcd09:: ds 1
wcd0a:: ds 1
wcd0b:: ds 1
wcd0c:: ds 6
wPlayerMapY:: ds 1
wPlayerMapX:: ds 1
wcd14:: ds $c

wcd20:: ds 1
wcd21:: ds 1
wcd22:: ds 1
wcd23:: ds 1
wcd24:: ds 1
wcd25:: ds 1
wcd26:: ds 1
wcd27:: ds 3
wcd2a:: ds 8
wcd32:: ds 2
	ds $a
wcd3e:: ds 2

wcd40:: ds 1
wcd41:: ds 1
wcd42:: ds 1
wcd43:: ds 1
wcd44:: ds 1

wcd45:: ds 1
wcd46:: ds 6
wcd4c:: ds 4

wcd50:: ds 1
wcd51:: ds 1
wcd52:: ds 1
wcd53:: ds 1
wcd54:: ds 1
wcd55:: ds 1
wcd56:: ds 1
wcd57:: ds 1
wcd58:: ds 1
wcd59:: ds 1
wcd5a:: ds 1
wcd5b:: ds 1
wcd5c:: ds 1
wcd5d:: ds 1
wcd5e:: ds 1
wcd5f:: ds 1

wcd60:: ds 1
wcd61:: ds 1
wcd62:: ds 1
wcd63:: ds 1
wcd64:: ds 1
wcd65:: ds 1
wcd66:: ds 1
wcd67:: ds 1
wcd68:: ds 1
wcd69:: ds 1
wcd6a:: ds 1
wcd6b:: ds 1
wcd6c:: ds 1
wcd6d:: ds 1
	ds 2
wcd70:: ds 1
wcd71:: ds 1
wcd72:: ds 1
wcd73:: ds 1
	ds 1
wcd75:: ds 1
wcd76:: ds 1
wcd77:: ds 1
wcd78:: ds 1
wcd79:: ds 1
wcd7a:: ds 1
wcd7b:: ds 1
wcd7c:: ds 1
wcd7d:: ds 1
wcd7e:: ds 1
wcd7f:: ds 1
wcd80:: ds 1
wcd81:: ds 1
wcd82:: ds 1
wcd83:: ds 1
wcd84:: ds 1
wcd85:: ds 1
wcd86:: ds 1
wcd87:: ds 1
wcd88:: ds 1
wcd89:: ds 1
wcd8a:: ds 1
wcd8b:: ds 1
wcd8c:: ds 1
wcd8d:: ds 1
wcd8e:: ds 1
wcd8f:: ds 1
wcd90:: ds 1
wcd91:: ds 1
wcd92:: ds 1
wcd93:: ds 1
	ds 1
wcd95:: ds 1
wcd96:: ds 1
wcd97:: ds 1
wcd98:: ds 1
wcd99:: ds 1
wcd9a:: ds 1
wcd9b:: ds 1
wcd9c:: ds 1
wcd9d:: ds 1
wcd9e:: ds 1
wcd9f:: ds 1
wcda0:: ds 1
wcda1:: ds 1
	ds 62
NEXTU
wVisibleObjects::
wPlayerObject::
	ds $20
wFollowerObject::
	ds $20
wNPCObjects::
	ds $20 ; id 2
	ds $20 ; id 3
	ds $20 ; id 4
	ds $20 ; id 5
	ds $20 ; id 6
ENDU
; Start menu
wcde0:: ds 1
wcde1:: ds 1
wcde2:: ds 1

wcde3:: ds $d
wcdf0:: ds 8
wcdf8:: ds 8

wMapTileAttrs:: ds $100

wMapCollision:: ds $100


SECTION "WRAM1", WRAMX

wd000:: ds $80

wd080:: ds 1
wd081:: ds 1
wd082:: ds 1
wd083:: ds 2
wTextDelayFrames:: ds 1
wd086:: ds 1
wBattleScriptState:: ds 1

wBattleScriptPos:: ds 2 ; also used for screen/effect scripts
wBattleScriptByte:: ds 1
wMenuTextX:: ds 1
wMenuTextEndX:: ds 1

wSelectedPage:: ds 1
wSelectedOption:: ds 1
wLoadedROMBank:: ds 1
wd090:: ds 1
wCurrentSoundBank:: ds 1
wd092:: ds $e

wMapAttributes::
wMapLayoutPointer:: ds 2
wMapBlocksPointer:: ds 2
wMapMetatilesPointer:: ds 2
wMapGBCAttrPointer:: ds 2
wMapPalettesPointer:: ds 2
wMapTileset1Pointer:: ds 2
wMapTileset2Pointer:: ds 2
wd0ae:: ds 2
wMapCollisionsPointer:: ds 2
wd0b2:: ds 2
wPaletteFadeDirection:: ds 1
wPaletteFadeChanged:: ds 1
wBGMapAddr:: ds 2
wd0b8:: ds 1
wd0b9:: ds 1
wd0ba:: ds 1
wd0bb:: ds 1
wd0bc:: ds 1
wd0bd:: ds 1
wd0be:: ds 1
wd0bf:: ds 1

wFacingTileY::
wd0c0:: ds 1
wFacingTileX::
wd0c1:: ds 1

; seems to be used for scanning?
wPlayerMap2Y:: ds 1
wPlayerMap2X::
wd0c3:: ds 1

wd0c4:: ds 2
wd0c6:: ds 2

wd0c8:: ds 1
wPlayerSpriteX:: ds 1
wPlayerSpriteY:: ds 1
wMapAttrPointer:: ds 2

wObjectEventPointer:: ds 2
wTextboxPointer:: ds 2
wd0d1:: ds 2
wd0d3:: ds 1
wd0d4:: ds 1 ; step counter
wd0d5:: ds 1
wd0d6:: ds 1

wMoney:: ds 3

wd0da:: ds 1

wGameTimeHours:: ds 1
wGameTimeMinutes:: ds 1

	ds 2

wd0df:: ds 1
wd0e0:: ds 3
wd0e3:: ds 1
wd0e4:: ds 8
wd0ec:: ds 2
wd0ee:: ds 1
wd0ef:: ds 1
wd0f0:: ds 1
wd0f1:: ds 1
wPartyScanType:: ds 2 ; TODO unused?
wMapType:: ds 1
wItemIndex:: ds 1

wCharacterTileDest:: ds 2
wd0f8:: ds 1
wd0f9:: ds 1
wTargetMode:: ds 1
wd0fb:: ds 2
wd0fd:: ds 2
wd0ff:: ds 1

wd100:: ds $28 ; wTextboxAttrmap?

wd128:: ds $78

wd1a0:: ds 8
wd1a8:: ds 8
wd1b0:: ds 8
wd1b8:: ds 1
	ds 7
wd1c0:: ds 1
	ds 33

wd1e2:: ds 1
wd1e3:: ds 1
wd1e4:: ds 1

wTileAnimFrameCounters:: ds 1
	ds 11

wd1f1:: ds 1
wd1f2:: ds 1
wd1f3:: ds 1
wd1f4:: ds 1

wd1f5:: ds 1
wd1f6:: ds 1
wd1f7:: ds 1
	ds 1

wd1f9:: ds 1
wd1fa:: ds 1
wd1fb:: ds 1
wd1fc:: ds 1
wd1fd:: ds 1
wd1fe:: ds 1
wd1ff:: ds 1

wPartyMons::
wPartyMon1:: party_struct wPartyMon1
wPartyMon2:: party_struct wPartyMon2
wPartyMon3:: party_struct wPartyMon3
wPartyMon4:: party_struct wPartyMon4
wPartyMon5:: party_struct wPartyMon5
wPartyMon6:: party_struct wPartyMon6

wd284:: ds $7c

; Items (ID, Quantity)
wd300:: ds $f0
wd3f0:: ds 1
wd3f1:: ds 1
wd3f2:: ds 1
wd3f3:: ds 1

wd3f4:: ds 1

; collision related
wd3f5:: ds 1
wd3f6:: ds 1
wd3f7:: ds 1
wd3f8:: ds 1

wd3f9:: ds 5
wBattleIntroJumptableIndex:: ds 1
wd3ff:: ds 1

; sound engine
wd400:: ds 1
	ds 1

; shared across sound engines
wSoundChannelIndex:: ds 1
wSoundCurChannel:: ds 1
wCurrentSongID:: ds 1
wSoundNumChannels:: ds 1
wSoundPriority:: ds 1

; engine_1 only
wSound1ChannelMask:: ds 1
wSound1Ch3TargetWaveform:: ds 1
wSound1Ch7TargetWaveform:: ds 1
wSound1LastWaveform:: ds 1
wSound1FadeEnabled:: ds 1
wSound1FadeTimer:: ds 1
wSound1ChannelsActive:: ds 1
wSound1Channels::
wSound1Channel1:: channel_struct wSound1Channel1
wSound1Channel2:: channel_struct wSound1Channel2
wSound1Channel3:: channel_struct wSound1Channel3
wSound1Channel4:: channel_struct wSound1Channel4
wSound1SFXChannels::
wSound1Channel5:: channel_struct wSound1Channel5
wSound1Channel6:: channel_struct wSound1Channel6
wSound1Channel7:: channel_struct wSound1Channel7
wSound1Channel8:: channel_struct wSound1Channel8

; shared across sound engines
wCh1DataCurrentSweep:: ds 1
wCh1DataCurrentDutyLength:: ds 1
wCh1DataCurrentEnvelope:: ds 1
wCh1DataCurrentFrequency:: ds 2
wCh2DataCurrentDutyLength:: ds 1
wCh2DataCurrentEnvelope:: ds 1
wCh2DataCurrentFrequency:: ds 2
wCh3DataEnable:: ds 2
wCh3DataCurrentVolume:: ds 1
wCh3DataCurrentFrequency:: ds 2
wCh4DataCurrentLength:: ds 1
wCh4DataCurrentEnvelope:: ds 1
wCh4DataCurrentFrequency:: ds 2

wSoundGlobalStereo:: ds 1
wSoundStereoChannels:: ds 2

wCh1DataLastSweep:: ds 1
wCh1DataLastDutyLength:: ds 1
wCh1DataLastEnvelope:: ds 1
wCh1DataLastFrequency:: ds 2
wCh2DataLastDutyLength:: ds 1
wCh2DataLastEnvelope:: ds 1
wCh2DataLastFrequency:: ds 2
wCh3DataLastEnable:: ds 2
wCh3DataLastVolume:: ds 1
wCh3DataLastFrequency:: ds 2
wd591:: ds 1
wd592:: ds 1
wd593:: ds 2
wd595:: ds 1
wd596:: ds 1
wd597:: ds 1
wCh1NoteCounter:: ds 1 ; 98
wCh2NoteCounter:: ds 1
	ds 1
wCh4DataLastEnvelope:: ds 1
	ds $6b

; engine_2 and engine_3
wSound2ChannelMask:: ds 1
wSound2Ch3TargetWaveform:: ds 1
wSound2Ch7TargetWaveform:: ds 1
wSound2LastWaveform:: ds 1
wSound2FadeEnabled:: ds 1
wSound2FadeTimer:: ds 1
wSound2ChannelsActive:: ds 1

; BUG: some of these are never actually used, as engine_2 & _3 use
; the wSound1* equivalents instead. (see docs/bugs.md#Broken sound engine) 
wSound2Channels::
wSound2Channel1:: channel_struct wSound2Channel1
wSound2Channel2:: channel_struct wSound2Channel2
wSound2Channel3:: channel_struct wSound2Channel3
wSound2Channel4:: channel_struct wSound2Channel4
wSound2SFXChannels::
wSound2Channel5:: channel_struct wSound2Channel5
wSound2Channel6:: channel_struct wSound2Channel6
wSound2Channel7:: channel_struct wSound2Channel7
wSound2Channel8:: channel_struct wSound2Channel8

wd76e:: ds $5d

wd7cb:: ds $9f ; mon dex

wd86a:: ds 7
wd871:: ds 1
wd872:: ds 1
wd873:: ds 1
wd874:: ds 1
wd875:: ds 1

wd876:: ds $16

wd88c:: ds $6e

wd8fa:: ds 4
wd8fe:: ds 1
wd8ff:: ds 1

wd900:: ds $3c

wd93c:: ds $3c

wd978:: ds 4
wd97c:: ds 5

wActiveMonPtr::
wd981:: ds 1
wd982:: ds 1
wd983:: ds 1
wd984:: ds 1
wd985:: ds 1
wd986:: ds 1
wd987:: ds 1
wBattleAnimID:: ds 1
wBattleState:: ds 1
wd98a:: ds 1
wd98b:: ds 1
wd98c:: ds 1
wd98d:: ds 1
wd98e:: ds 1
wd98f:: ds 1
wd990:: ds 1
wd991:: ds 2
wd993:: ds 1
wd994:: ds 1
wd995:: ds 1
wd996:: ds 1
wd997:: ds 1
wd998:: ds 1
wd999:: ds 1
wd99a:: ds 1
wd99b:: ds 1
wd99c:: ds 1
wd99d:: ds 1
wd99e:: ds 1
wd99f:: ds 1
wd9a0:: ds 1
	ds 9
wd9aa:: ds 1

wd9ab:: ds 1
wd9ac:: ds 1
wd9ad:: ds 1
wd9ae:: ds 1

wd9af:: ds 1
wd9b0:: ds 1
wd9b1:: ds 1

wd9b2:: ds 1
wd9b3:: ds 1
wd9b4:: ds 1
wd9b5:: ds 1
wd9b6:: ds 2
wd9b8:: ds 1
wd9b9:: ds 1
wd9ba:: ds 1
wd9bb:: ds 1
wd9bc:: ds 1
wd9bd:: ds 1
wBattleMusic:: ds 1
wd9bf:: ds 1

wCharacterTileSrc:: ds 2
wd9c2:: ds 1
wd9c3:: ds 1
wd9c4:: ds 1
wd9c5:: ds 1
	ds 1
wd9c7:: ds 1
wd9c8:: ds 1
wd9c9:: ds 1
wExpGained::
wd9ca:: ds 1
wd9cb:: ds 1
wd9cc:: ds 1
wd9cd:: ds 1
wd9ce:: ds 1
wd9cf:: ds 1

wd9d0:: ds 1
wd9d1:: ds 1
wd9d2:: ds 1
wd9d3:: ds 1
wd9d4:: ds 1
wd9d5:: ds 1

wd9d6:: ds 1
wd9d7:: ds 1
wd9d8:: ds 1
wd9d9:: ds 1
wd9da:: ds 2
wd9dc:: ds 1
wd9dd:: ds 1

wWX:: ds 1
wWY:: ds 1

wd9e0:: ds 1
wd9e1:: ds 1
wd9e2:: ds 1
wd9e3:: ds 1
wEnemyMonSpecies:: ds 1
wd9e5:: ds 3
wd9e8:: ds 1
wd9e9:: ds 1
wd9ea:: ds 1
wd9eb:: ds 1
wd9ec:: ds 1
wd9ed:: ds 1
wd9ee:: ds 1
wd9ef:: ds 1

wTempBank:: ds 1
wBattleScriptBank:: ds 1
wd9f2:: ds 1
wd9f3:: ds 1
wd9f4:: ds 1
wd9f5:: ds 1
wd9f6:: ds 1
wd9f7:: ds 1
wd9f8:: ds 1
wTilesetBank:: ds 1
wd9fa:: ds 1
wd9fb:: ds 1
wd9fc:: ds 1
wd9fd:: ds 1
wd9fe:: ds 1
wd9ff:: ds 1
wda00:: ds $a0

; shop menu is at $daa4
wEventFlags:: ds $19 ; event flags ($daa0-$dab8); scr_checkbit uses 0-8, init/object conds use 0-24
wdab9:: ds 1
wdaba:: ds 1
wdabb:: ds 1
wdabc:: ds 1
wdabd:: ds 1
wdabe:: ds 1
wdabf:: ds 1
wdac0:: ds 1
wdac1:: ds 1
wdac2:: ds 1
wdac3:: ds 1
wdac4:: ds 1
wdac5:: ds 1
wdac6:: ds 1
wdac7:: ds 1
wdac8:: ds 1
wdac9:: ds 1
wdaca:: ds 1
wdacb:: ds 1
	ds 2

wTextBGMapPointer:: ds 2
wdad0:: ds $10
wdae0:: ds 2
wdae2:: ds 1
wdae3:: ds 4
wdae7:: ds 4
wdaeb:: ds $15
wdb00:: ds $18

wdb18:: ds 3
wGameTimeSeconds:: ds 1
wdb1c:: ds 1
wdb1d:: ds 1
wCurrentCharacterByte:: ds 1
wdb1f:: ds 1
wMonBox:: ds NUM_BOX_MONS * BOX_STRUCT_LENGTH ; box_struct records; count in wMonBoxCount, mirrored to SRAM (sa6db)
wMonBoxCount:: ds 1
wdc9d:: ds 1

wMonBoxIndex:: ds 1
wdc9f:: ds 1

wdca0:: ds $b
wMonBox2Count:: ds 1
wdcac:: ds 1

wdcad:: ds 1

wdcae:: ds 1
wdcaf:: ds 1

wdcb0:: ds 1
wdcb1:: ds 1
wdcb2:: ds 1
wdcb3:: ds 1
wdcb4:: ds 1
wdcb5:: ds 1
wdcb6:: ds 1
wdcb7:: ds 1

wdcb8:: ds 1
wdcb9:: ds 1

wdcba:: ds 1
wdcbb:: ds 1
wdcbc:: ds $c ; 12-byte struct/buffer (per bank_30)

wMovementPointer:: ds 2
wdcca:: ds 1
wdccb:: ds 1
wdccc:: ds 1
wdccd:: ds 1
wdcce:: ds 1
wdccf:: ds 1

wdcd0:: ds 1
wdcd1:: ds 2
wdcd3:: ds 2
wdcd5:: ds 1
wdcd6:: ds 2

wTextFaceID:: ds 1
wdcd9:: ds 1
wdcda:: ds 3
wdcdd:: ds 1
wdcde:: ds 2
wCharacterTilePos:: ds 1
wdce1:: ds 1
wdce2:: ds 1

; 0 = bottom half, 1 = top half
wTextboxPos:: ds 1

wdce4:: ds 1
wdce5:: ds 2
wdce7:: ds 1
wdce8:: ds 2

wdcea:: ds 1 ; follower?

wdceb:: ds 1
wdcec:: ds 2
wdcee:: ds 3
wdcf1:: ds 1
	ds 1

wIntroStepTimer::
wdcf3:: ds 1

wIntroScrollMode::
wdcf4:: ds 1

wIntroSeqStep::
wdcf5:: ds 1

wdcf6:: ds 1
wdcf7:: ds 1
wdcf8:: ds 1
wMapPatchIndex:: ds 1
wdcfa:: ds 1
wdcfb:: ds 1
wdcfc:: ds 1
wdcfd:: ds 1
wdcfe:: ds 1
wdcff:: ds 1

wdd00:: ds $18
wdd18:: ds $38

wdd50:: ds 1
	ds $5f

wddb0:: ds $50

wde00:: ds $16
wde16:: ds $16
wde2c:: ds $16
wde42:: ds $16
wde58:: ds $16
wde6e:: ds $16
wde84:: ds $16
wde9a:: ds $66

wMapEvents:: ds $ff

wdfff:: ds 1
