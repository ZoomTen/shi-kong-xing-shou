text: MACRO
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

	const TX_INIT
text_init: MACRO
	db TX_INIT, \1, \2
ENDM

	const_next $e2

	const TX_END ; $e2
done: MACRO
	db TX_END
ENDM

	const_next $ec

	const TX_PARA ; $ec
para: MACRO
if _NARG == 0
	db TX_PARA
else
	db TX_PARA, \1
endc
ENDM

	const TX_LINE ; $ed
line: MACRO
if _NARG == 0
	db TX_LINE
else
	db TX_LINE, \1
endc
ENDM
