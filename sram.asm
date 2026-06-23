INCLUDE "constants.asm"


SECTION "Save Data", SRAM, BANK[0]

	ds $20
sMapOffsetX:: ds $26 ; saved hMapOffsetX block

	ds $a
sMapLayoutPointer:: ds $29
sPlayerScreenX:: ds 2
	ds $21

	ds $4
sTilemap:: ds $190
sPartyMons:: ds $200
sa430:: ds $50 ; -> wddb0

	ds $26
sa4a6:: ds $10 ; -> wdb20 + $17C

	ds $a
sEventFlags:: ds $40
sa500:: ds $b0 ; -> wde00

	ds $50
sa600:: ds $40 ; -> wdd00

	ds $10
sa650:: ds 1
sa651:: ds 1
sa652:: ds 1

	ds $88
sa6db:: ds $17c ; -> wdb20

	ds 1
sa858:: ds 5

	ds 3
sa860:: ds $98 ; -> wd7cb


SECTION "SRAM Bank 1", SRAM[$b600], BANK[1]
sMonBox2:: ds NUM_BOX_MONS * BOX_STRUCT_LENGTH ; second monster box (SRAM bank 1); count in wMonBox2Count
