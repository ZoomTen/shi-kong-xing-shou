Func_004_4000::
	ld hl, wVirtualOAM
	ld bc, 40
	ld de, 4
.asm_4009
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4009

	xor a
	ld [wd1fb], a
	call Func_004_4088
	call Func_004_4170
	call Func_004_41e6
	call Func_004_40cb
	call Func_004_426d
	ret

Func_004_4024::
	dr $10024, $10045

Func_004_4045::
	dr $10045, $10088

Func_004_4088:
	dr $10088, $100cb

Func_004_40cb:
	dr $100cb, $10170

Func_004_4170:
	dr $10170, $101e6

Func_004_41e6:
	dr $101e6, $1026d

Func_004_426d:
	dr $1026d, $10337

unk_004_4337::
	dr $10337, $108e7

Sprites00to13GFXPointers::
	dw BallotGFX_Pointers
	dw SnowyGFX_Pointers
	dw BuckGFX_Pointers
	dw BeattroGFX_Pointers
	dw NinaGFX_Pointers
	dw ElectreepGFX_Pointers
	dw ClaudeGFX_Pointers
	dw ChromanixGFX_Pointers
	dw HelenGFX_Pointers
	dw MerlithGFX_Pointers
	dw LanteGFX_Pointers
	dw MuserodeGFX_Pointers
	dw RandtGFX_Pointers
	dw SignalitonGFX_Pointers
	dw MittGFX_Pointers
	dw DrawvileGFX_Pointers
	dw BladeberusGFX_Pointers
	dw SayaGFX_Pointers
	dw BoyGFX_Pointers
	dw GirlGFX_Pointers

BallotGFX_Pointers:
	dw BallotGFX_FacingDown_Pointers
	dw BallotGFX_FacingUp_Pointers
	dw BallotGFX_FacingSideways_Pointers
	dw BallotGFX_FacingSideways_Pointers
	dw BallotGFX_HoldingPDA_Pointers
	dw BallotGFX_HandsUp_Pointers

BallotGFX_FacingDown_Pointers:
	dw BallotWalk_Down1_GFX
	dw BallotWalk_Down2_GFX
	dw BallotWalk_Down1_GFX
	dw BallotWalk_Down3_GFX
	dw $eeee

BallotGFX_FacingUp_Pointers:
	dw BallotWalk_Up1_GFX
	dw BallotWalk_Up2_GFX
	dw BallotWalk_Up1_GFX
	dw BallotWalk_Up3_GFX
	dw $eeee

BallotGFX_FacingSideways_Pointers:
	dw BallotWalk_Sideways1_GFX
	dw BallotWalk_Sideways2_GFX
	dw BallotWalk_Sideways1_GFX
	dw BallotWalk_Sideways3_GFX
	dw $eeee

BallotGFX_HoldingPDA_Pointers:
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw BallotHoldPDA_GFX
	dw $ffff

BallotGFX_HandsUp_Pointers:
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw BallotHandsUp_GFX
	dw $ffff

BallotWalk_Down1_GFX:
	INCBIN "gfx/sprites/ballot/down1.2bpp"

BallotWalk_Down2_GFX:
	INCBIN "gfx/sprites/ballot/down2.2bpp"

BallotWalk_Down3_GFX:
	INCBIN "gfx/sprites/ballot/down3.2bpp"

BallotWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/ballot/side1.2bpp"

BallotWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/ballot/side2.2bpp"

BallotWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/ballot/side3.2bpp"

BallotWalk_Up1_GFX:
	INCBIN "gfx/sprites/ballot/up1.2bpp"

BallotWalk_Up2_GFX:
	INCBIN "gfx/sprites/ballot/up2.2bpp"

BallotWalk_Up3_GFX:
	INCBIN "gfx/sprites/ballot/up3.2bpp"

BallotHoldPDA_GFX:
	INCBIN "gfx/sprites/ballot/pda.2bpp"

BallotHandsUp_GFX:
	INCBIN "gfx/sprites/ballot/hands_up.2bpp"

SnowyGFX_Pointers:
	dw SnowyGFX_FacingDown_Pointers
	dw SnowyGFX_FacingUp_Pointers
	dw SnowyGFX_FacingSideways_Pointers
	dw SnowyGFX_FacingSideways_Pointers

SnowyGFX_FacingDown_Pointers:
	dw SnowyWalk_Down1_GFX
	dw SnowyWalk_Down2_GFX
	dw SnowyWalk_Down1_GFX
	dw SnowyWalk_Down3_GFX
	dw $eeee

SnowyGFX_FacingUp_Pointers:
	dw SnowyWalk_Up1_GFX
	dw SnowyWalk_Up2_GFX
	dw SnowyWalk_Up1_GFX
	dw SnowyWalk_Up3_GFX
	dw $eeee

SnowyGFX_FacingSideways_Pointers:
	dw SnowyWalk_Sideways1_GFX
	dw SnowyWalk_Sideways2_GFX
	dw SnowyWalk_Sideways1_GFX
	dw SnowyWalk_Sideways3_GFX
	dw $eeee

SnowyWalk_Down1_GFX:
	INCBIN "gfx/sprites/snowy/down1.2bpp"

SnowyWalk_Down2_GFX:
	INCBIN "gfx/sprites/snowy/down2.2bpp"

SnowyWalk_Down3_GFX:
	INCBIN "gfx/sprites/snowy/down3.2bpp"

SnowyWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/snowy/side1.2bpp"

SnowyWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/snowy/side2.2bpp"

SnowyWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/snowy/side3.2bpp"

SnowyWalk_Up1_GFX:
	INCBIN "gfx/sprites/snowy/up1.2bpp"

SnowyWalk_Up2_GFX:
	INCBIN "gfx/sprites/snowy/up2.2bpp"

SnowyWalk_Up3_GFX:
	INCBIN "gfx/sprites/snowy/up3.2bpp"

BuckGFX_Pointers:
	dw BuckGFX_FacingDown_Pointers
	dw BuckGFX_FacingUp_Pointers
	dw BuckGFX_FacingSideways_Pointers
	dw BuckGFX_FacingSideways_Pointers

BuckGFX_FacingDown_Pointers:
	dw BuckWalk_Down1_GFX
	dw BuckWalk_Down2_GFX
	dw BuckWalk_Down1_GFX
	dw BuckWalk_Down3_GFX
	dw $eeee

BuckGFX_FacingUp_Pointers:
	dw BuckWalk_Up1_GFX
	dw BuckWalk_Up2_GFX
	dw BuckWalk_Up1_GFX
	dw BuckWalk_Up3_GFX
	dw $eeee

BuckGFX_FacingSideways_Pointers:
	dw BuckWalk_Sideways1_GFX
	dw BuckWalk_Sideways2_GFX
	dw BuckWalk_Sideways1_GFX
	dw BuckWalk_Sideways3_GFX
	dw $eeee

BuckWalk_Down1_GFX:
	dr $10e99, $10ed9

BuckWalk_Down2_GFX:
	dr $10ed9, $10f19

BuckWalk_Down3_GFX:
	dr $10f19, $10f59

BuckWalk_Sideways1_GFX:
	dr $10f59, $10f99

BuckWalk_Sideways2_GFX:
	dr $10f99, $10fd9

BuckWalk_Sideways3_GFX:
	dr $10fd9, $11019

BuckWalk_Up1_GFX:
	dr $11019, $11059

BuckWalk_Up2_GFX:
	dr $11059, $11099

BuckWalk_Up3_GFX:
	dr $11099, $110d9

BeattroGFX_Pointers:
	dw BeattroGFX_FacingDown_Pointers
	dw BeattroGFX_FacingUp_Pointers
	dw BeattroGFX_FacingSideways_Pointers
	dw BeattroGFX_FacingSideways_Pointers

BeattroGFX_FacingDown_Pointers:
	dw BeattroWalk_Down1_GFX
	dw BeattroWalk_Down2_GFX
	dw BeattroWalk_Down1_GFX
	dw BeattroWalk_Down3_GFX
	dw $eeee

BeattroGFX_FacingUp_Pointers:
	dw BeattroWalk_Up1_GFX
	dw BeattroWalk_Up2_GFX
	dw BeattroWalk_Up1_GFX
	dw BeattroWalk_Up3_GFX
	dw $eeee

BeattroGFX_FacingSideways_Pointers:
	dw BeattroWalk_Sideways1_GFX
	dw BeattroWalk_Sideways2_GFX
	dw BeattroWalk_Sideways1_GFX
	dw BeattroWalk_Sideways3_GFX
	dw $eeee

BeattroWalk_Down1_GFX:
	dr $110ff, $1113f

BeattroWalk_Down2_GFX:
	dr $1113f, $1117f

BeattroWalk_Down3_GFX:
	dr $1117f, $111bf

BeattroWalk_Sideways1_GFX:
	dr $111bf, $111ff

BeattroWalk_Sideways2_GFX:
	dr $111ff, $1123f

BeattroWalk_Sideways3_GFX:
	dr $1123f, $1127f

BeattroWalk_Up1_GFX:
	dr $1127f, $112bf

BeattroWalk_Up2_GFX:
	dr $112bf, $112ff

BeattroWalk_Up3_GFX:
	dr $112ff, $1133f

NinaGFX_Pointers:
	dw NinaGFX_FacingDown_Pointers
	dw NinaGFX_FacingUp_Pointers
	dw NinaGFX_FacingSideway_Pointers
	dw NinaGFX_FacingSideway_Pointers

NinaGFX_FacingDown_Pointers:
	dw NinaWalk_Down1_GFX
	dw NinaWalk_Down2_GFX
	dw NinaWalk_Down1_GFX
	dw NinaWalk_Down3_GFX
	dw $eeee

NinaGFX_FacingUp_Pointers:
	dw NinaWalk_Up1_GFX
	dw NinaWalk_Up2_GFX
	dw NinaWalk_Up1_GFX
	dw NinaWalk_Up3_GFX
	dw $eeee

NinaGFX_FacingSideway_Pointers:
	dw NinaWalk_Sideways1_GFX
	dw NinaWalk_Sideways2_GFX
	dw NinaWalk_Sideways1_GFX
	dw NinaWalk_Sideways3_GFX
	dw $eeee

NinaWalk_Down1_GFX:
	dr $11365, $113a5

NinaWalk_Down2_GFX:
	dr $113a5, $113e5

NinaWalk_Down3_GFX:
	dr $113e5, $11425

NinaWalk_Sideways1_GFX:
	dr $11425, $11465

NinaWalk_Sideways2_GFX:
	dr $11465, $114a5

NinaWalk_Sideways3_GFX:
	dr $114a5, $114e5

NinaWalk_Up1_GFX:
	dr $114e5, $11525

NinaWalk_Up2_GFX:
	dr $11525, $11565

NinaWalk_Up3_GFX:
	dr $11565, $115a5

ElectreepGFX_Pointers:
	dw ElectreepGFX_FacingDown_Pointers
	dw ElectreepGFX_FacingUp_Pointers
	dw ElectreepGFX_FacingSideways_Pointers
	dw ElectreepGFX_FacingSideways_Pointers

ElectreepGFX_FacingDown_Pointers:
	dw ElectreepWalk_Down1_GFX
	dw ElectreepWalk_Down2_GFX
	dw ElectreepWalk_Down1_GFX
	dw ElectreepWalk_Down3_GFX
	dw $eeee

ElectreepGFX_FacingUp_Pointers:
	dw ElectreepWalk_Up1_GFX
	dw ElectreepWalk_Up2_GFX
	dw ElectreepWalk_Up1_GFX
	dw ElectreepWalk_Up3_GFX
	dw $eeee

ElectreepGFX_FacingSideways_Pointers:
	dw ElectreepWalk_Sideways1_GFX
	dw ElectreepWalk_Sideways2_GFX
	dw ElectreepWalk_Sideways1_GFX
	dw ElectreepWalk_Sideways3_GFX
	dw $eeee

ElectreepWalk_Down1_GFX:
	dr $115cb, $1160b

ElectreepWalk_Down2_GFX:
	dr $1160b, $1164b

ElectreepWalk_Down3_GFX:
	dr $1164b, $1168b

ElectreepWalk_Sideways1_GFX:
	dr $1168b, $116cb

ElectreepWalk_Sideways2_GFX:
	dr $116cb, $1170b

ElectreepWalk_Sideways3_GFX:
	dr $1170b, $1174b

ElectreepWalk_Up1_GFX:
	dr $1174b, $1178b

ElectreepWalk_Up2_GFX:
	dr $1178b, $117cb

ElectreepWalk_Up3_GFX:
	dr $117cb, $1180b

ClaudeGFX_Pointers:
	dw ClaudeGFX_FacingDown_Pointers
	dw ClaudeGFX_FacingUp_Pointers
	dw ClaudeGFX_FacingSideways_Pointers
	dw ClaudeGFX_FacingSideways_Pointers

ClaudeGFX_FacingDown_Pointers:
	dw ClaudeWalking_Down1_GFX
	dw ClaudeWalking_Down2_GFX
	dw ClaudeWalking_Down1_GFX
	dw ClaudeWalking_Down3_GFX
	dw $eeee

ClaudeGFX_FacingUp_Pointers:
	dw ClaudeWalking_Up1_GFX
	dw ClaudeWalking_Up2_GFX
	dw ClaudeWalking_Up1_GFX
	dw ClaudeWalking_Up3_GFX
	dw $eeee

ClaudeGFX_FacingSideways_Pointers:
	dw ClaudeWalking_Sideways1_GFX
	dw ClaudeWalking_Sideways2_GFX
	dw ClaudeWalking_Sideways1_GFX
	dw ClaudeWalking_Sideways3_GFX
	dw $eeee

ClaudeWalking_Down1_GFX:
	dr $11831, $11871

ClaudeWalking_Down2_GFX:
	dr $11871, $118b1

ClaudeWalking_Down3_GFX:
	dr $118b1, $118f1

ClaudeWalking_Sideways1_GFX:
	dr $118f1, $11931

ClaudeWalking_Sideways2_GFX:
	dr $11931, $11971

ClaudeWalking_Sideways3_GFX:
	dr $11971, $119b1

ClaudeWalking_Up1_GFX:
	dr $119b1, $119f1

ClaudeWalking_Up2_GFX:
	dr $119f1, $11a31

ClaudeWalking_Up3_GFX:
	dr $11a31, $11a71

ChromanixGFX_Pointers:
	dw ChromanixGFX_FacingDown_Pointers
	dw ChromanixGFX_FacingUp_Pointers
	dw ChromanixGFX_FacingSideways_Pointers
	dw ChromanixGFX_FacingSideways_Pointers

ChromanixGFX_FacingDown_Pointers:
	dw ChromanixWalking_Down1_GFX
	dw ChromanixWalking_Down2_GFX
	dw ChromanixWalking_Down1_GFX
	dw ChromanixWalking_Down3_GFX
	dw $eeee

ChromanixGFX_FacingUp_Pointers:
	dw ChromanixWalking_Up1_GFX
	dw ChromanixWalking_Up2_GFX
	dw ChromanixWalking_Up1_GFX
	dw ChromanixWalking_Up3_GFX
	dw $eeee

ChromanixGFX_FacingSideways_Pointers:
	dw ChromanixWalking_Sideways1_GFX
	dw ChromanixWalking_Sideways2_GFX
	dw ChromanixWalking_Sideways1_GFX
	dw ChromanixWalking_Sideways3_GFX
	dw $eeee

ChromanixWalking_Down1_GFX:
	dr $11a97, $11ad7

ChromanixWalking_Down2_GFX:
	dr $11ad7, $11b17

ChromanixWalking_Down3_GFX:
	dr $11b17, $11b57

ChromanixWalking_Sideways1_GFX:
	dr $11b57, $11b97

ChromanixWalking_Sideways2_GFX:
	dr $11b97, $11bd7

ChromanixWalking_Sideways3_GFX:
	dr $11bd7, $11c17

ChromanixWalking_Up1_GFX:
	dr $11c17, $11c57

ChromanixWalking_Up2_GFX:
	dr $11c57, $11c97

ChromanixWalking_Up3_GFX:
	dr $11c97, $11cd7

HelenGFX_Pointers:
	dw HelenGFX_FacingDown_Pointers
	dw HelenGFX_FacingUp_Pointers
	dw HelenGFX_FacingSideways_Pointers
	dw HelenGFX_FacingSideways_Pointers
	dw HelenGFX_EyesClosed_Pointers

HelenGFX_FacingDown_Pointers:
	dw HelenWalking_Down1_GFX
	dw HelenWalking_Down2_GFX
	dw HelenWalking_Down1_GFX
	dw HelenWalking_Down3_GFX
	dw $eeee

HelenGFX_FacingUp_Pointers:
	dw HelenWalking_Up1_GFX
	dw HelenWalking_Up2_GFX
	dw HelenWalking_Up1_GFX
	dw HelenWalking_Up3_GFX
	dw $eeee

HelenGFX_FacingSideways_Pointers:
	dw HelenWalking_Sideways1_GFX
	dw HelenWalking_Sideways2_GFX
	dw HelenWalking_Sideways1_GFX
	dw HelenWalking_Sideways3_GFX
	dw $eeee

HelenGFX_EyesClosed_Pointers:
	dw HelenEyesClosedFacingDown_GFX
	dw HelenEyesClosedFacingDown_GFX
	dw $ffff

HelenWalking_Down1_GFX:
	dr $11d05, $11d45

HelenWalking_Down2_GFX:
	dr $11d45, $11d85

HelenWalking_Down3_GFX:
	dr $11d85, $11dc5

HelenWalking_Sideways1_GFX:
	dr $11dc5, $11e05

HelenWalking_Sideways2_GFX:
	dr $11e05, $11e45

HelenWalking_Sideways3_GFX:
	dr $11e45, $11e85

HelenWalking_Up1_GFX:
	dr $11e85, $11ec5

HelenWalking_Up2_GFX:
	dr $11ec5, $11f05

HelenWalking_Up3_GFX:
	dr $11f05, $11f45

HelenEyesClosedFacingDown_GFX:
	dr $11f45, $11f85

MerlithGFX_Pointers:
	dw MerlithGFX_FacingDown_Pointers
	dw MerlithGFX_FacingUp_Pointers
	dw MerlithGFX_FacingSideways_Pointers
	dw MerlithGFX_FacingSideways_Pointers

MerlithGFX_FacingDown_Pointers:
	dw MerlithWalk_Down1_GFX
	dw MerlithWalk_Down2_GFX
	dw MerlithWalk_Down1_GFX
	dw MerlithWalk_Down3_GFX
	dw $eeee

MerlithGFX_FacingUp_Pointers:
	dw MerlithWalk_Up1_GFX
	dw MerlithWalk_Up2_GFX
	dw MerlithWalk_Up1_GFX
	dw MerlithWalk_Up3_GFX
	dw $eeee

MerlithGFX_FacingSideways_Pointers:
	dw MerlithWalk_Sideways1_GFX
	dw MerlithWalk_Sideways2_GFX
	dw MerlithWalk_Sideways1_GFX
	dw MerlithWalk_Sideways3_GFX
	dw $eeee

MerlithWalk_Down1_GFX:
	dr $11fab, $11feb

MerlithWalk_Down2_GFX:
	dr $11feb, $1202b

MerlithWalk_Down3_GFX:
	dr $1202b, $1206b

MerlithWalk_Sideways1_GFX:
	dr $1206b, $120ab

MerlithWalk_Sideways2_GFX:
	dr $120ab, $120eb

MerlithWalk_Sideways3_GFX:
	dr $120eb, $1212b

MerlithWalk_Up1_GFX:
	dr $1212b, $1216b

MerlithWalk_Up2_GFX:
	dr $1216b, $121ab

MerlithWalk_Up3_GFX:
	dr $121ab, $121eb

LanteGFX_Pointers:
	dw LanteGFX_FacingDown_Pointers
	dw LanteGFX_FacingUp_Pointers
	dw LanteGFX_FacingSideways_Pointers
	dw LanteGFX_FacingSideways_Pointers

LanteGFX_FacingDown_Pointers:
	dw LanteWalk_Down1_GFX
	dw LanteWalk_Down2_GFX
	dw LanteWalk_Down1_GFX
	dw LanteWalk_Down3_GFX
	dw $eeee

LanteGFX_FacingUp_Pointers:
	dw LanteWalk_Up1_GFX
	dw LanteWalk_Up2_GFX
	dw LanteWalk_Up1_GFX
	dw LanteWalk_Up3_GFX
	dw $eeee

LanteGFX_FacingSideways_Pointers:
	dw LanteWalk_Sideways1_GFX
	dw LanteWalk_Sideways2_GFX
	dw LanteWalk_Sideways1_GFX
	dw LanteWalk_Sideways3_GFX
	dw $eeee

LanteWalk_Down1_GFX:
	dr $12211, $12251

LanteWalk_Down2_GFX:
	dr $12251, $12291

LanteWalk_Down3_GFX:
	dr $12291, $122d1

LanteWalk_Sideways1_GFX:
	dr $122d1, $12311

LanteWalk_Sideways2_GFX:
	dr $12311, $12351

LanteWalk_Sideways3_GFX:
	dr $12351, $12391

LanteWalk_Up1_GFX:
	dr $12391, $123d1

LanteWalk_Up2_GFX:
	dr $123d1, $12411

LanteWalk_Up3_GFX:
	dr $12411, $12451

MuserodeGFX_Pointers:
	dw MuserodeGFX_FacingDown_Pointers
	dw MuserodeGFX_FacingUp_Pointers
	dw MuserodeGFX_FacingSideways_Pointers
	dw MuserodeGFX_FacingSideways_Pointers

MuserodeGFX_FacingDown_Pointers:
	dw MuserodeWalk_Down1_GFX
	dw MuserodeWalk_Down2_GFX
	dw MuserodeWalk_Down1_GFX
	dw MuserodeWalk_Down3_GFX
	dw $eeee

MuserodeGFX_FacingUp_Pointers:
	dw MuserodeWalk_Up1_GFX
	dw MuserodeWalk_Up2_GFX
	dw MuserodeWalk_Up1_GFX
	dw MuserodeWalk_Up3_GFX
	dw $eeee

MuserodeGFX_FacingSideways_Pointers:
	dw MuserodeWalk_Sideways1_GFX
	dw MuserodeWalk_Sideways2_GFX
	dw MuserodeWalk_Sideways1_GFX
	dw MuserodeWalk_Sideways3_GFX
	dw $eeee

MuserodeWalk_Down1_GFX:
	dr $12477, $124b7

MuserodeWalk_Down2_GFX:
	dr $124b7, $124f7

MuserodeWalk_Down3_GFX:
	dr $124f7, $12537

MuserodeWalk_Sideways1_GFX:
	dr $12537, $12577

MuserodeWalk_Sideways2_GFX:
	dr $12577, $125b7

MuserodeWalk_Sideways3_GFX:
	dr $125b7, $125f7

MuserodeWalk_Up1_GFX:
	dr $125f7, $12637

MuserodeWalk_Up2_GFX:
	dr $12637, $12677

MuserodeWalk_Up3_GFX:
	dr $12677, $126b7

RandtGFX_Pointers:
	dw RandtGFX_FacingDown_Pointers
	dw RandtGFX_FacingUp_Pointers
	dw RandtGFX_FacingSideways_Pointers
	dw RandtGFX_FacingSideways_Pointers

RandtGFX_FacingDown_Pointers:
	dw RandtWalk_Down1_GFX
	dw RandtWalk_Down2_GFX
	dw RandtWalk_Down1_GFX
	dw RandtWalk_Down3_GFX
	dw $eeee

RandtGFX_FacingUp_Pointers:
	dw RandtWalk_Up1_GFX
	dw RandtWalk_Up2_GFX
	dw RandtWalk_Up1_GFX
	dw RandtWalk_Up3_GFX
	dw $eeee

RandtGFX_FacingSideways_Pointers:
	dw RandtWalk_Sideways1_GFX
	dw RandtWalk_Sideways2_GFX
	dw RandtWalk_Sideways1_GFX
	dw RandtWalk_Sideways3_GFX
	dw $eeee

RandtWalk_Down1_GFX:
	dr $126dd, $1271d

RandtWalk_Down2_GFX:
	dr $1271d, $1275d

RandtWalk_Down3_GFX:
	dr $1275d, $1279d

RandtWalk_Sideways1_GFX:
	dr $1279d, $127dd

RandtWalk_Sideways2_GFX:
	dr $127dd, $1281d

RandtWalk_Sideways3_GFX:
	dr $1281d, $1285d

RandtWalk_Up1_GFX:
	dr $1285d, $1289d

RandtWalk_Up2_GFX:
	dr $1289d, $128dd

RandtWalk_Up3_GFX:
	dr $128dd, $1291d

SignalitonGFX_Pointers:
	dw SignalitonGFX_FacingDown_Pointers
	dw SignalitonGFX_FacingUp_Pointers
	dw SignalitonGFX_FacingSideways_Pointers
	dw SignalitonGFX_FacingSideways_Pointers
	dw SignalitonGFX_Flashing_Pointers

SignalitonGFX_Flashing_Pointers:
	dw SignalitonFlash_GFX
	dw SignalitonWalk_Down1_GFX
	dw SignalitonFlash_GFX
	dw SignalitonWalk_Down1_GFX
	dw $eeee

SignalitonGFX_FacingDown_Pointers:
	dw SignalitonWalk_Down1_GFX
	dw SignalitonWalk_Down2_GFX
	dw SignalitonWalk_Down1_GFX
	dw SignalitonWalk_Down3_GFX
	dw $eeee

SignalitonGFX_FacingUp_Pointers:
	dw SignalitonWalk_Up1_GFX
	dw SignalitonWalk_Up2_GFX
	dw SignalitonWalk_Up1_GFX
	dw SignalitonWalk_Up3_GFX
	dw $eeee

SignalitonGFX_FacingSideways_Pointers:
	dw SignalitonWalk_Sideways1_GFX
	dw SignalitonWalk_Sideways2_GFX
	dw SignalitonWalk_Sideways1_GFX
	dw SignalitonWalk_Sideways3_GFX
	dw $eeee

SignalitonWalk_Down1_GFX:
	dr $1294f, $1298f

SignalitonWalk_Down2_GFX:
	dr $1298f, $129cf

SignalitonWalk_Down3_GFX:
	dr $129cf, $12a0f

SignalitonWalk_Sideways1_GFX:
	dr $12a0f, $12a4f

SignalitonWalk_Sideways2_GFX:
	dr $12a4f, $12a8f

SignalitonWalk_Sideways3_GFX:
	dr $12a8f, $12acf

SignalitonWalk_Up1_GFX:
	dr $12acf, $12b0f

SignalitonWalk_Up2_GFX:
	dr $12b0f, $12b4f

SignalitonWalk_Up3_GFX:
	dr $12b4f, $12b8f

SignalitonFlash_GFX:
	dr $12b8f, $12bcf

MittGFX_Pointers:
	dw MittGFX_FacingDown_Pointers
	dw MittGFX_FacingUp_Pointers
	dw MittGFX_FacingSideways_Pointers
	dw MittGFX_FacingSideways_Pointers

MittGFX_FacingDown_Pointers:
	dw MittWalk_Down1_GFX
	dw MittWalk_Down2_GFX
	dw MittWalk_Down1_GFX
	dw MittWalk_Down3_GFX
	dw $eeee

MittGFX_FacingUp_Pointers:
	dw MittWalk_Up1_GFX
	dw MittWalk_Up2_GFX
	dw MittWalk_Up1_GFX
	dw MittWalk_Up3_GFX
	dw $eeee

MittGFX_FacingSideways_Pointers:
	dw MittWalk_Sideways1_GFX
	dw MittWalk_Sideways2_GFX
	dw MittWalk_Sideways1_GFX
	dw MittWalk_Sideways3_GFX
	dw $eeee

MittWalk_Down1_GFX:
	dr $12bf5, $12c35

MittWalk_Down2_GFX:
	dr $12c35, $12c75

MittWalk_Down3_GFX:
	dr $12c75, $12cb5

MittWalk_Sideways1_GFX:
	dr $12cb5, $12cf5

MittWalk_Sideways2_GFX:
	dr $12cf5, $12d35

MittWalk_Sideways3_GFX:
	dr $12d35, $12d75

MittWalk_Up1_GFX:
	dr $12d75, $12db5

MittWalk_Up2_GFX:
	dr $12db5, $12df5

MittWalk_Up3_GFX:
	dr $12df5, $12e35

DrawvileGFX_Pointers:
	dw DrawvileGFX_FacingDown_Pointers
	dw DrawvileGFX_FacingUp_Pointers
	dw DrawvileGFX_FacingSideways_Pointers
	dw DrawvileGFX_FacingSideways_Pointers
	dw DrawvileGFX_Spinning_Pointers

DrawvileGFX_Spinning_Pointers:
	dw DrawvileWalk_Down1_GFX
	dw DrawvileFacing_Left_GFX
	dw DrawvileWalk_Up1_GFX
	dw DrawvileFacing_Right_GFX
	dw $eeee

DrawvileGFX_FacingDown_Pointers:
	dw DrawvileWalk_Down1_GFX
	dw DrawvileWalk_Down2_GFX
	dw DrawvileWalk_Down1_GFX
	dw DrawvileWalk_Down3_GFX
	dw $eeee

DrawvileGFX_FacingUp_Pointers:
	dw DrawvileWalk_Up1_GFX
	dw DrawvileWalk_Up2_GFX
	dw DrawvileWalk_Up1_GFX
	dw DrawvileWalk_Up3_GFX
	dw $eeee

DrawvileGFX_FacingSideways_Pointers:
	dw DrawvileWalk_Sideways1_GFX
	dw DrawvileWalk_Sideways2_GFX
	dw DrawvileWalk_Sideways1_GFX
	dw DrawvileWalk_Sideways3_GFX
	dw $eeee

DrawvileWalk_Down1_GFX:
	dr $12e67, $12ea7

DrawvileWalk_Down2_GFX:
	dr $12ea7, $12ee7

DrawvileWalk_Down3_GFX:
	dr $12ee7, $12f27

DrawvileWalk_Sideways1_GFX:
	dr $12f27, $12f67

DrawvileWalk_Sideways2_GFX:
	dr $12f67, $12fa7

DrawvileWalk_Sideways3_GFX:
	dr $12fa7, $12fe7

DrawvileWalk_Up1_GFX:
	dr $12fe7, $13027

DrawvileWalk_Up2_GFX:
	dr $13027, $13067

DrawvileWalk_Up3_GFX:
	dr $13067, $130a7

DrawvileFacing_Left_GFX:
	dr $130a7, $130e7

DrawvileFacing_Right_GFX:
	dr $130e7, $13127

BladeberusGFX_Pointers:
	dw BladeberusGFX_FacingDown_Pointers
	dw BladeberusGFX_FacingUp_Pointers
	dw BladeberusGFX_FacingSideways_Pointers
	dw BladeberusGFX_FacingSideways_Pointers

BladeberusGFX_FacingDown_Pointers:
	dw BladeberusWalk_Down1_GFX
	dw BladeberusWalk_Down2_GFX
	dw BladeberusWalk_Down1_GFX
	dw BladeberusWalk_Down3_GFX
	dw $eeee

BladeberusGFX_FacingUp_Pointers:
	dw BladeberusWalk_Up1_GFX
	dw BladeberusWalk_Up2_GFX
	dw BladeberusWalk_Up1_GFX
	dw BladeberusWalk_Up3_GFX
	dw $eeee

BladeberusGFX_FacingSideways_Pointers:
	dw BladeberusWalk_Sideways1_GFX
	dw BladeberusWalk_Sideways2_GFX
	dw BladeberusWalk_Sideways1_GFX
	dw BladeberusWalk_Sideways3_GFX
	dw $eeee

BladeberusWalk_Down1_GFX:
	INCBIN "gfx/sprites/bladeberus/down1.2bpp"

BladeberusWalk_Down2_GFX:
	INCBIN "gfx/sprites/bladeberus/down2.2bpp"

BladeberusWalk_Down3_GFX:
	INCBIN "gfx/sprites/bladeberus/down3.2bpp"

BladeberusWalk_Sideways1_GFX:
	INCBIN "gfx/sprites/bladeberus/side1.2bpp"

BladeberusWalk_Sideways2_GFX:
	INCBIN "gfx/sprites/bladeberus/side2.2bpp"

BladeberusWalk_Sideways3_GFX:
	INCBIN "gfx/sprites/bladeberus/side3.2bpp"

BladeberusWalk_Up1_GFX:
	INCBIN "gfx/sprites/bladeberus/up1.2bpp"

BladeberusWalk_Up2_GFX:
	INCBIN "gfx/sprites/bladeberus/up2.2bpp"

BladeberusWalk_Up3_GFX:
	INCBIN "gfx/sprites/bladeberus/up3.2bpp"

SayaGFX_Pointers:
	dw SayaGFX_FacingDown_Pointers
	dw SayaGFX_FacingUp_Pointers
	dw SayaGFX_FacingSideways_Pointers
	dw SayaGFX_FacingSideways_Pointers

SayaGFX_FacingDown_Pointers:
	dw SayaWalk_Down1_GFX
	dw SayaWalk_Down2_GFX
	dw SayaWalk_Down1_GFX
	dw SayaWalk_Down3_GFX
	dw $ffff

SayaGFX_FacingUp_Pointers:
	dw SayaWalk_Up1_GFX
	dw SayaWalk_Up2_GFX
	dw SayaWalk_Up1_GFX
	dw SayaWalk_Up3_GFX
	dw $ffff

SayaGFX_FacingSideways_Pointers:
	dw SayaWalk_Sideways1_GFX
	dw SayaWalk_Sideways2_GFX
	dw SayaWalk_Sideways1_GFX
	dw SayaWalk_Sideways3_GFX
	dw $ffff

SayaWalk_Down1_GFX:
	dr $133b3, $133f3

SayaWalk_Down2_GFX:
	dr $133f3, $13433

SayaWalk_Down3_GFX:
	dr $13433, $13473

SayaWalk_Sideways1_GFX:
	dr $13473, $134b3

SayaWalk_Sideways2_GFX:
	dr $134b3, $134f3

SayaWalk_Sideways3_GFX:
	dr $134f3, $13533

SayaWalk_Up1_GFX:
	dr $13533, $13573

SayaWalk_Up2_GFX:
	dr $13573, $135b3

SayaWalk_Up3_GFX:
	dr $135b3, $135f3

BoyGFX_Pointers:
	dw BoyGFX_FacingDown_Pointers
	dw BoyGFX_FacingUp_Pointers
	dw BoyGFX_FacingSideways_Pointers
	dw BoyGFX_FacingSideways_Pointers

BoyGFX_FacingDown_Pointers:
	dw BoyWalk_Down1_GFX
	dw BoyWalk_Down2_GFX
	dw BoyWalk_Down1_GFX
	dw BoyWalk_Down3_GFX
	dw $ffff

BoyGFX_FacingUp_Pointers:
	dw BoyWalk_Up1_GFX
	dw BoyWalk_Up2_GFX
	dw BoyWalk_Up1_GFX
	dw BoyWalk_Up3_GFX
	dw $ffff

BoyGFX_FacingSideways_Pointers:
	dw BoyWalk_Sideways1_GFX
	dw BoyWalk_Sideways2_GFX
	dw BoyWalk_Sideways1_GFX
	dw BoyWalk_Sideways3_GFX
	dw $ffff

BoyWalk_Down1_GFX:
	dr $13619, $13659

BoyWalk_Down2_GFX:
	dr $13659, $13699

BoyWalk_Down3_GFX:
	dr $13699, $136d9

BoyWalk_Sideways1_GFX:
	dr $136d9, $13719

BoyWalk_Sideways2_GFX:
	dr $13719, $13759

BoyWalk_Sideways3_GFX:
	dr $13759, $13799

BoyWalk_Up1_GFX:
	dr $13799, $137d9

BoyWalk_Up2_GFX:
	dr $137d9, $13819

BoyWalk_Up3_GFX:
	dr $13819, $13859

GirlGFX_Pointers:
	dw GirlGFX_FacingDown_Pointers
	dw GirlGFX_FacingUp_Pointers
	dw GirlGFX_FacingSideways_Pointers
	dw GirlGFX_FacingSideways_Pointers

GirlGFX_FacingDown_Pointers:
	dw GirlWalk_Down1_GFX
	dw GirlWalk_Down2_GFX
	dw GirlWalk_Down1_GFX
	dw GirlWalk_Down3_GFX
	dw $ffff

GirlGFX_FacingUp_Pointers:
	dw GirlWalk_Up1_GFX
	dw GirlWalk_Up2_GFX
	dw GirlWalk_Up1_GFX
	dw GirlWalk_Up3_GFX
	dw $ffff

GirlGFX_FacingSideways_Pointers:
	dw GirlWalk_Sideways1_GFX
	dw GirlWalk_Sideways2_GFX
	dw GirlWalk_Sideways1_GFX
	dw GirlWalk_Sideways3_GFX
	dw $ffff

GirlWalk_Down1_GFX:
	dr $1387f, $138bf

GirlWalk_Down2_GFX:
	dr $138bf, $138ff

GirlWalk_Down3_GFX:
	dr $138ff, $1393f

GirlWalk_Sideways1_GFX:
	dr $1393f, $1397f

GirlWalk_Sideways2_GFX:
	dr $1397f, $139bf

GirlWalk_Sideways3_GFX:
	dr $139bf, $139ff

GirlWalk_Up1_GFX:
	dr $139ff, $13a3f

GirlWalk_Up2_GFX:
	dr $13a3f, $13a7f

GirlWalk_Up3_GFX:
	dr $13a7f, $13abf


SECTION "banknum4", ROMX[$7fff], BANK[$4]
	db $4
