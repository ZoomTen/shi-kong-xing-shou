Script_00e_4000:
	scr_end

Script_00e_4001:
	scr_setmap $2d, $01 ; TEMP
	scr_end

Script_00e_4005::
	scr_face FACE_DOWN
	scr_text text_0e_4abe
	scr_end

Script_00e_400b:
	dr $3800b, $38abe

INCLUDE "data/text/bank0e_misc.asm"

text_0e_5b91:
	dr $39b91, $39bdd

text_0e_5bdd:
	text_init $14, $25 ; TEMP
	db $f3, $0c
	db $f1, $58
	db $f4, $29
	db $f1, $c8
	db $f5, $0e
	db $f0, $2a
	db $f1, $5c
	line
	text "?", 1
	line
	getchoice $1cc5 ; TEMP

text_0e_5bf5:
	text_init $1a, $25 ; TEMP
	dr $39bf8, $39c24

INCLUDE "data/text/bank0e_misc2.asm"

unk_0e_7e69:
	dr $3be69, $3bf30


SECTION "banknume", ROMX[$7fff], BANK[$e]
	db $e
