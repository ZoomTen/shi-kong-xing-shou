INCLUDE "constants.asm"


SECTION "WRAM", WRAM0

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

wc0e8:: ds $838

; c920
wTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::

wca88:: ds $68

wcaf0:: ds 8 * 8

wcb30:: ds $a0

wcbd0:: ds $20

wCharacterTilemapPos:: ds 1
wTextLine:: ds 1
wCharacterTileCount:: ds 1
wcbf3:: ds 1
wCharacterBGMapTransferStatus:: ds 1
wCharacterTileTransferStatus:: ds 1
wcbf6:: ds 1
wcbf7:: ds 1

wcbf8:: ds 2
wFarByte:: ds 1
wcbfb:: ds 3

wcbfe:: ds 2
wcc00:: ds $40
wcc40:: ds $40
wcc80:: ds $80

wcd00:: ds 1 ; Distance to warp border y
wcd01:: ds 1 ; Distance to warp border x

wcd02:: ds 1
wcd03:: ds 1 ; Facing direction
wcd04:: ds 1 ; OW sprite ID?
wcd05:: ds $1f

wcd24:: ds 1
wcd25:: ds $bb

; Start menu
wcde0:: ds 1
wcde1:: ds 1
wcde2:: ds 1

wcde3:: ds $1d

wce00:: ds $200


SECTION "WRAM1", WRAMX

wd000:: ds $82

wd082:: ds 1
wd083:: ds 1
wd084:: ds 1
wTextDelayFrames:: ds 1
wd086:: ds 1
wd087:: ds 1

wd088:: ds 2
wd08a:: ds 1
wd08b:: ds 2

wd08d:: ds 1 ; selected page
wd08e:: ds 1 ; selected option
wd08f:: ds 1
wd090:: ds 1
wd091:: ds 1
wd092:: ds $22

wd0b4:: ds 1
wd0b5:: ds $1a

wTextboxPointer:: ds 2
wd0d1:: ds 2
wd0d3:: ds 8

wGameTimeHours:: ds 1
wGameTimeMinutes:: ds 1

	ds 2

wd0df:: ds 1
wd0e0:: ds $f
wd0ef:: ds 1
wd0f0:: ds 6

wCharacterTileDest:: ds 2
wd0f8:: ds 1
wd0f9:: ds 1
wd0fa:: ds 1
wd0fb:: ds 4
wd0ff:: ds 1

wd100:: ds $28 ; wTextboxAttrmap?

wd128:: ds $78

wd1a0:: ds 8
wd1a8:: ds 8
wd1b0:: ds $4b

wd1fb:: ds 1
	ds 4

wd200:: ds $1f5

; collision related
wd3f5:: ds 1
wd3f6:: ds 1
wd3f7:: ds 1
wd3f8:: ds 1

wd3f9:: ds $596

wd98f:: ds 2
wd991:: ds $2f

wCharacterTileSrc:: ds 2
wd9c2:: ds $e

wd9d0:: ds 2
wd9d2:: ds 6

wd9d8:: ds 1
wd9d9:: ds 5

wWX:: ds 1
wWY:: ds 1

wd9e0:: ds 2
wd9e2:: ds 1
wd9e3:: ds 1
wEnemyMonSpecies:: ds 1
wd9e5:: ds $b

wTempBank:: ds 1
wd9f1:: ds $e
wd9ff:: ds 1
wda00:: ds $a3

wdaa3:: ds 1
wdaa4:: ds $2a

wTextBGMapPointer:: ds 2
wdad0:: ds $4b

wGameTimeSeconds:: ds 1
wdb1c:: ds 1
wdb1d:: ds 1
wCurrentCharacterByte:: ds 1
wdb1f:: ds $196

wdcb5:: ds 1
wdcb6:: ds 5

wdcbb:: ds $15

wdcd0:: ds 1
wdcd1:: ds 2
wdcd3:: ds 5

wdcd8:: ds 1
wdcd9:: ds 7

wCharacterTilePos:: ds 1
wdce1:: ds 1
wdce2:: ds 1

; 0 = bottom half, 1 = top half
wTextboxPos:: ds 1

wdce4:: ds 3
wdce7:: ds 1
wdce8:: ds 2

wdcea:: ds 1 ; follower?

wdceb:: ds 1
wdcec:: ds $14

wdd00:: ds $100

wde00:: ds $16
wde16:: ds $16
wde2c:: ds $16
wde42:: ds $16
wde58:: ds $16
wde6e:: ds $16
wde84:: ds $16
wde9a:: ds $16

INCLUDE "hram.asm"
