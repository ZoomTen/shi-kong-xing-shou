MACRO text
if _NARG > 1
	db ($f0 | \2)
	setcharmap charmap\2
	db \1
else
	db \1
endc
ENDM


; Text commands

	const_def $e0

	const TX_INIT ; $e0
MACRO text_init
; name, face
	db TX_INIT, \1, \2
ENDM

	const TX_SIGN
MACRO text_sign
	db TX_SIGN
ENDM

	const TX_END ; $e2
MACRO done
	db TX_END
ENDM

	const TX_ITEMNAME ; $e3
MACRO itemname
	db TX_ITEMNAME
ENDM

	const TX_RETURN ; $e3
MACRO text_return
	db TX_RETURN
ENDM

	const_next $e5

	const TX_GETCHOICE ; $e5
MACRO getchoice
; address to choice text
	db TX_GETCHOICE
	dw \1
ENDM

	const TX_CHOICE ; $e6
MACRO choice
	db TX_CHOICE
ENDM

	const_next $ea
	const TX_ITEMNAME2 ; $ea
MACRO itemname2
	db TX_ITEMNAME2
ENDM

	const_next $ec

	const TX_PARA ; $ec
MACRO para
if _NARG == 0
	db TX_PARA
else
	db TX_PARA, \1
endc
ENDM

	const TX_LINE ; $ed
MACRO line
if _NARG == 0
	db TX_LINE
else
	db TX_LINE, \1
endc
ENDM

	const TX_CONT ; $ee
MACRO cont
if _NARG == 0
	db TX_CONT
else
	db TX_CONT, \1
endc
ENDM


; Menu text commands

	const_def $e4

	const MENUTX_END ; $e4
MACRO menu_done
	db MENUTX_END
ENDM

	const_next $ed

	const MENUTX_END2 ; $ed
MACRO menu_done2
	db MENUTX_END2
ENDM
