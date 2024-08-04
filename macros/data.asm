; Borrowed from pret/pokegold

MACRO dr
	INCBIN "baserom.gbc", \1, \2 +- \1
ENDM

MACRO lb ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 | ((\3) & $ff)
ENDM

MACRO ln ; r, hi, lo
	ld \1, ((\2) & $f) << 4 | ((\3) & $f)
ENDM


; Constant data (db, dw, dl) macros

MACRO dwb
	dw \1
	db \2
ENDM

MACRO dbw
	db \1
	dw \2
ENDM

MACRO dbbw
	db \1, \2
	dw \3
ENDM

MACRO dbww
	db \1
	dw \2, \3
ENDM

MACRO dbwww
	db \1
	dw \2, \3, \4
ENDM

MACRO dn ; nybbles
rept _NARG / 2
	db ((\1) << 4) | (\2)
	shift 2
endr
ENDM

MACRO dc ; "crumbs"
rept _NARG / 4
	db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | (\4)
	shift 4
endr
ENDM

MACRO dx
DEF x = 8 * ((\1) - 1)
rept \1
	db ((\2) >> x) & $ff
DEF x = x - 8
endr
ENDM

MACRO dt ; three-byte (big-endian)
	dx 3, \1
ENDM

MACRO dd ; four-byte (big-endian)
	dx 4, \1
ENDM

MACRO bigdw ; big-endian word
	dx 2, \1 ; db HIGH(\1), LOW(\1)
ENDM

MACRO dba ; dbw bank, address
rept _NARG
	dbw BANK(\1), \1
	shift
endr
ENDM

MACRO dab ; dwb address, bank
rept _NARG
	dwb \1, BANK(\1)
	shift
endr
ENDM

MACRO bcd
rept _NARG
	dn ((\1) % 100) / 10, (\1) % 10
	shift
endr
ENDM

MACRO sine_table
; \1 samples of sin(x) from x=0 to x<32768 (pi radians)
DEF x = 0
rept \1
	dw (sin(x) + (sin(x) & $ff)) >> 8 ; round up
DEF x = x + DIV(32768, \1) ; a circle has 65536 "degrees"
endr
ENDM

MACRO dsprite
; \1 y tile
; \2 y pxl
; \3 x tile
; \4 x pxl
; \5 tile number
; \6 flags + attributes
	db LOW(\1 * 8) + \2
	db LOW(\3 * 8) + \4
	db \5, \6
ENDM

MACRO dbaw
; odd way of defining a pointer where the second byte
; is skipped
	dw BANK(\1), \1
ENDM

MACRO dbaw2
	dw BANK(\1), 0, \1
ENDM
