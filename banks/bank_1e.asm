_ClearMapLayoutPatch::
	ld de, LayoutPatches_01e_402a
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wMapPatchIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	push hl
	call ClearLayoutFlag
	pop hl
	call ApplyMapLayoutPatch
	ret

LayoutPatches_01e_402a::
	dw .patch_0
	dw .patch_0
	dw .patch_2
	dw .patch_3
	dw .patch_4
	dw .patch_5

.patch_0:
	db 0
	layout_patch 0, 0, 0, 0, 0

.patch_2:
	db 2
	layout_patch wdaba, 6, 2, 5, $26
	layout_patch wdaba, 6, 2, 5, $26

.patch_3:
	db 3
	layout_patch wdaba, 7, 1, 3, $0e
	layout_patch wdaba, 7, 1, 3, $0e
	layout_patch wdaba, 7, 1, 3, $0e

.patch_4:
	db 5
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 1, 5, 0, $05
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 1, 5, 0, $05

.patch_5:
	db 1
	layout_patch wdaba, 5, 3, 1, $04

_SetMapLayoutPatch::
	ld de, LayoutPatches_01e_40ad
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wMapPatchIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	push hl
	call SetLayoutFlag
	pop hl
	call ApplyMapLayoutPatch
	ret

LayoutPatches_01e_40ad::
	dw .patch_0
	dw .patch_1
	dw .patch_2
	dw .patch_3
	dw .patch_4
	dw .patch_5

.patch_0:
	db 0
	layout_patch 0, 0, 0, 0, 0

.patch_1:
	db 1
	layout_patch wdaba, 5, 2, 2, $18

.patch_2:
	db 3
	layout_patch wdaba, 6, 2, 5, $40
	layout_patch wdaba, 6, 2, 5, $40
	layout_patch wdaba, 6, 8, 4, $41

.patch_3:
	db 4
	layout_patch wdaba, 7, 1, 3, $15
	layout_patch wdaba, 7, 1, 3, $15
	layout_patch wdaba, 7, 1, 3, $15
	layout_patch wdaba, 7, 2, 2, $16

.patch_4:
	db 7
	layout_patch wdabb, 0, 2, 7, $58
	layout_patch wdabb, 1, 5, 0, $59
	layout_patch wdabb, 0, 2, 7, $58
	layout_patch wdabb, 0, 2, 7, $58
	layout_patch wdabb, 1, 5, 0, $59
	layout_patch wdabb, 0, $0a, 3, $5a
	layout_patch wdabb, 1, 1, 1, $5b

.patch_5:
	db 1
	layout_patch wdaba, 5, 3, 1, $2e

_ApplyMapLayoutPatchIfClear::
	ld de, LayoutPatches_01e_414f
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wMapPatchIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestLayoutFlag
	and a
	ret nz
	call ApplyMapLayoutPatch
	ret

LayoutPatches_01e_414f::
	dw .patch_none
	dw .patch_none
	dw .patch_none
	dw .patch_3
	dw .patch_4
	dw .patch_none

.patch_none:
	db 0
	layout_patch 0, 0, 0, 0, 0

.patch_3:
	db 3
	layout_patch wdaba, 7, 2, 2, $0e
	layout_patch wdaba, 7, 2, 2, $0e
	layout_patch wdaba, 7, 2, 2, $0e

.patch_4:
	db 5
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 1, 5, 0, $05
	layout_patch wdabb, 0, 2, 7, $3e
	layout_patch wdabb, 0, $0a, 3, $2e
	layout_patch wdabb, 1, 1, 1, $07

; For the current wMapType, walk its patch record list and apply every
; patch whose flag bit is set, editing wMapLayout in place.
_ApplyMapLayoutFlagPatches::
	ld de, LayoutPatches_01e_40ad
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and a
	ret z
	ld c, a
.loop
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestLayoutFlag
	and a
	jr z, .skip
	call ApplyMapLayoutPatch
.skip
	pop hl
	ld de, 6
	add hl, de
	dec c
	jr nz, .loop
	ret

; Same as _ApplyMapLayoutFlagPatches but using the secondary record table
; (LayoutPatches_01e_4910); used when the map is first set up.
ApplyMapLayoutFlagPatchesInit::
	ld de, LayoutPatches_01e_4910
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld c, a
.loop
	push hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	call TestLayoutFlag
	and a
	jr z, .skip
	call ApplyMapLayoutPatch
.skip
	pop hl
	ld de, 6
	add hl, de
	dec c
	jr nz, .loop
	ret

_SetMapLayoutPatchForItem::
	ld de, LayoutPatches_01e_4910
	ld a, [wMapType]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wItemIndex]
	add a
	ld b, a
	add a
	add a
	sub b
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, a
	push hl
	call SetLayoutFlag
	pop hl
	call ApplyMapLayoutPatch
	ret

INCLUDE "data/text/script_item_get_4212.asm"

INCLUDE "engine/items/names.asm"
INCLUDE "engine/items/menu.asm"
INCLUDE "data/items/prices.asm"

INCLUDE "data/items/marts.asm"

INCLUDE "engine/items/item_pages.asm"
; Clear bit b of the flag byte at [de].
ClearLayoutFlag::
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .done
.loop
	rrc l
	dec a
	jr nz, .loop
.done
	res 0, l
	ld a, b
	and a
	jr z, .done2
.loop2
	rlc l
	dec a
	jr nz, .loop2
.done2
	ld a, l
	ld [de], a
	ret

; Set bit b of the flag byte at [de].
SetLayoutFlag::
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .done
.loop
	rrc l
	dec a
	jr nz, .loop
.done
	set 0, l
	ld a, b
	and a
	jr z, .done2
.loop2
	rlc l
	dec a
	jr nz, .loop2
.done2
	ld a, l
	ld [de], a
	ret

; Write the patch's block value into wMapLayout at row*hMapWidth + col.
; hl -> col (db), row (db), value (db)
ApplyMapLayoutPatch::
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld hl, wMapLayout
	and a
	jr z, .skip
	ld a, [hMapWidth]
	ld c, a
	ld b, 0
.loop
	add hl, bc
	dec d
	jr nz, .loop
.skip
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	pop bc
	ret

; Return a = bit b of the flag byte at [de] (0 or 1).
TestLayoutFlag::
	push bc
	push hl
	ld a, [de]
	ld l, a
	ld a, b
	and a
	jr z, .done
.loop
	rrc l
	dec a
	jr nz, .loop
.done
	bit 0, l
	jr z, .clear
	ld a, 1
	jr .store
.clear
	xor a
.store
	pop hl
	pop bc
	ret

LayoutPatches_01e_4910::
	dw MapLayoutPatches_None
	dw MapLayoutPatches_01e_4cf5
	dw MapLayoutPatches_01e_4cfc
	dw MapLayoutPatches_01e_4d09
	dw MapLayoutPatches_01e_4d10
	dw MapLayoutPatches_None
	dw .patch_4cc8
	dw .patch_4cc1
	dw .patch_4cba
	dw .patch_4cad
	dw .patch_4c94
	dw .patch_4c87
	dw .patch_4c6e
	dw .patch_4c67
	dw MapLayoutPatches_01e_4cd6
	dw .patch_4c48
	dw .patch_4c35
	dw .patch_4c22
	dw .patch_4bf0
	dw .patch_4bdd
	dw .patch_4b67
	dw .patch_4b7a
	dw .patch_4ba5
	dw .patch_4bb8
	dw .patch_4b4e
	dw .patch_4b3b
	dw .patch_4b2e
	dw .patch_4b21
	dw .patch_4aee
	dw .patch_4b01
	dw .patch_4b14
	dw .patch_4aa0
	dw .patch_4aad
	dw .patch_4aba
	dw .patch_4ac1
	dw .patch_4ad4
	dw .patch_4ae1
	dw .patch_4a6e
	dw .patch_4a87
	dw .patch_49ce
	dw .patch_49e1
	dw .patch_49ee
	dw .patch_49f5
	dw .patch_4a08
	dw .patch_4a1b
	dw .patch_4a3a
	dw .patch_4a41
	dw .patch_4a4e
	dw .patch_4a55
	dw .patch_4980
	dw .patch_4999
	dw .patch_49a6
	dw .patch_49ad
	dw .patch_49b4
	dw .patch_49c1
	dw .patch_4c09

.patch_4980:
	db 4
	layout_patch wdac9, 7, 6, 1, $a2
	layout_patch wdaca, 0, 8, 1, $a3
	layout_patch wdaca, 1, $0d, $0b, $a4
	layout_patch wdaca, 2, $0b, $0c, $a5

.patch_4999:
	db 2
	layout_patch wdaca, 3, 8, $0a, $aa
	layout_patch wdaca, 4, $0b, $0d, $ab

.patch_49a6:
	db 1
	layout_patch wdaca, 5, 4, 1, $45

.patch_49ad:
	db 1
	layout_patch wdaca, 6, 3, 1, $51

.patch_49b4:
	db 2
	layout_patch wdaca, 7, 3, 3, $51
	layout_patch wdacb, 0, 4, 4, $52

.patch_49c1:
	db 2
	layout_patch wdacb, 1, 0, 8, $4c
	layout_patch wdacb, 2, 3, 9, $4d

.patch_49ce:
	db 3
	layout_patch wdac6, 6, 2, 1, $47
	layout_patch wdac6, 7, 4, 1, $48
	layout_patch wdac7, 0, 5, 1, $49

.patch_49e1:
	db 2
	layout_patch wdac7, 1, 3, 5, $55
	layout_patch wdac7, 2, 0, 6, $56

.patch_49ee:
	db 1
	layout_patch wdac7, 3, 2, 3, $32

.patch_49f5:
	db 3
	layout_patch wdac7, 4, $0a, 1, $39
	layout_patch wdac7, 5, $0c, 1, $3a
	layout_patch wdac7, 6, 6, 4, $3b

.patch_4a08:
	db 3
	layout_patch wdac7, 7, 1, 4, $ab
	layout_patch wdac8, 0, 1, 9, $ac
	layout_patch wdac8, 1, 2, 9, $ad

.patch_4a1b:
	db 5
	layout_patch wdac8, 2, $0c, 1, $a4
	layout_patch wdac8, 3, $0d, 2, $a5
	layout_patch wdac8, 4, $0c, 9, $a6
	layout_patch wdac8, 5, 2, $0b, $a7
	layout_patch wdac8, 6, 0, $0e, $a8

.patch_4a3a:
	db 1
	layout_patch wdac8, 7, 1, 1, $4d

.patch_4a41:
	db 2
	layout_patch wdac9, 0, 5, 9, $51
	layout_patch wdac9, 1, 7, 9, $52

.patch_4a4e:
	db 1
	layout_patch wdac9, 2, 9, 9, $49

.patch_4a55:
	db 4
	layout_patch wdac9, 3, 8, 0, $52
	layout_patch wdac9, 4, 4, 4, $53
	layout_patch wdac9, 5, 3, 8, $54
	layout_patch wdac9, 6, 4, 8, $55

.patch_4a6e:
	db 4
	layout_patch wdac5, 6, 3, 7, $9e
	layout_patch wdac5, 7, $0d, 9, $9f
	layout_patch wdac6, 0, 0, $0d, $a0
	layout_patch wdac6, 1, 2, $0d, $a1

.patch_4a87:
	db 4
	layout_patch wdac6, 2, 3, 7, $9f
	layout_patch wdac6, 3, $0d, 9, $a0
	layout_patch wdac6, 4, 0, $0d, $a1
	layout_patch wdac6, 5, 2, $0d, $a2

.patch_4aa0:
	db 2
	layout_patch wdac4, 2, 8, 0, $4a
	layout_patch wdac4, 3, 9, 1, $4b

.patch_4aad:
	db 2
	layout_patch wdac4, 4, 1, 7, $47
	layout_patch wdac4, 5, 3, 7, $48

.patch_4aba:
	db 1
	layout_patch wdac4, 6, 1, 6, $47

.patch_4ac1:
	db 3
	layout_patch wdac4, 7, 0, 1, $4b
	layout_patch wdac5, 0, 2, 1, $4c
	layout_patch wdac5, 1, 3, 4, $4d

.patch_4ad4:
	db 2
	layout_patch wdac5, 2, 5, 9, $4f
	layout_patch wdac5, 3, 5, $0a, $50

.patch_4ae1:
	db 2
	layout_patch wdac5, 4, 5, 5, $55
	layout_patch wdac5, 5, 6, 5, $56

.patch_4aee:
	db 3
	layout_patch wdac3, 2, 5, 3, $22
	layout_patch wdac3, 3, 5, 5, $23
	layout_patch wdac3, 4, 2, 7, $24

.patch_4b01:
	db 3
	layout_patch wdac3, 5, 5, 6, $2e
	layout_patch wdac3, 6, 7, 8, $2f
	layout_patch wdac3, 7, 5, 9, $30

.patch_4b14:
	db 2
	layout_patch wdac4, 0, 0, 5, $35
	layout_patch wdac4, 1, 2, 5, $36

.patch_4b21:
	db 2
	layout_patch wdac3, 0, 1, 4, $3c
	layout_patch wdac3, 1, 5, 4, $3d

.patch_4b2e:
	db 2
	layout_patch wdac2, 6, 0, 3, $49
	layout_patch wdac2, 7, 2, 5, $4a

.patch_4b3b:
	db 3
	layout_patch wdac2, 3, 4, 1, $64
	layout_patch wdac2, 4, 8, 8, $65
	layout_patch wdac2, 5, 6, $0a, $66

.patch_4b4e:
	db 4
	layout_patch wdac1, 7, 8, 1, $61
	layout_patch wdac2, 0, 9, 1, $62
	layout_patch wdac2, 1, 0, 2, $63
	layout_patch wdac2, 2, 0, 4, $64

.patch_4b67:
	db 3
	layout_patch wdabf, 4, $0a, 1, $3c
	layout_patch wdabf, 5, 1, 9, $3d
	layout_patch wdabf, 6, 3, 9, $3e

.patch_4b7a:
	db 7
	layout_patch wdabf, 7, 3, 1, $50
	layout_patch wdac0, 0, 7, 1, $51
	layout_patch wdac0, 1, 1, 2, $52
	layout_patch wdac0, 2, 2, 2, $53
	layout_patch wdac0, 3, 4, 3, $54
	layout_patch wdac0, 4, 9, 4, $55
	layout_patch wdac0, 5, $0a, 5, $56

.patch_4ba5:
	db 3
	layout_patch wdac0, 6, 8, 3, $49
	layout_patch wdac0, 7, 1, 5, $4a
	layout_patch wdac1, 0, 7, 8, $4b

.patch_4bb8:
	db 6
	layout_patch wdac1, 1, 4, 4, $42
	layout_patch wdac1, 2, 8, 4, $43
	layout_patch wdac1, 3, 1, 7, $44
	layout_patch wdac1, 4, 2, 7, $45
	layout_patch wdac1, 5, 3, 8, $46
	layout_patch wdac1, 6, 3, $0a, $47

.patch_4bdd:
	db 3
	layout_patch wdabf, 1, $0a, 1, $a4
	layout_patch wdabf, 2, $0b, 2, $a5
	layout_patch wdabf, 3, 0, 6, $a6

.patch_4bf0:
	db 4
	layout_patch wdabe, 5, 9, 0, $a3
	layout_patch wdabe, 6, $0d, 5, $a4
	layout_patch wdabe, 7, 1, 6, $a5
	layout_patch wdabf, 0, $0e, 7, $a6

.patch_4c09:
	db 4
	layout_patch wdabe, 5, 9, 0, $a1
	layout_patch wdabe, 6, $0d, 5, $a2
	layout_patch wdabe, 7, 1, 6, $a3
	layout_patch wdabf, 0, $0e, 7, $a4

.patch_4c22:
	db 3
	layout_patch wdabe, 2, 4, 3, $ab
	layout_patch wdabe, 3, $0e, 6, $ac
	layout_patch wdabe, 4, 1, $0d, $ad

.patch_4c35:
	db 3
	layout_patch wdabd, 7, $0a, 1, $6c
	layout_patch wdabe, 0, $0b, 2, $6d
	layout_patch wdabe, 1, 0, 6, $6e

.patch_4c48:
	db 5
	layout_patch wdabd, 2, 9, 0, $75
	layout_patch wdabd, 3, $0a, 0, $76
	layout_patch wdabd, 4, $0d, 5, $77
	layout_patch wdabd, 5, 1, 6, $78
	layout_patch wdabd, 6, $0e, 7, $79

.patch_4c67:
	db 1
	layout_patch wdabd, 1, 4, 4, $2d

.patch_4c6e:
	db 4
	layout_patch wdabc, 5, 6, 1, $3d
	layout_patch wdabc, 6, 3, 7, $3e
	layout_patch wdabc, 7, 1, 8, $3f
	layout_patch wdabd, 0, 3, 8, $40

.patch_4c87:
	db 2
	layout_patch wdabc, 3, 4, 4, $4a
	layout_patch wdabc, 4, $0a, 6, $4b

.patch_4c94:
	db 4
	layout_patch wdabb, 7, 1, 1, $43
	layout_patch wdabc, 0, $0a, 1, $44
	layout_patch wdabc, 1, $0a, 3, $45
	layout_patch wdabc, 2, 9, 8, $46

.patch_4cad:
	db 2
	layout_patch wdabb, 5, 0, 1, $19
	layout_patch wdabb, 6, 1, 1, $1a

.patch_4cba:
	db 1
	layout_patch wdabb, 4, 2, 4, $14

.patch_4cc1:
	db 1
	layout_patch wdabb, 3, 5, 4, $15

.patch_4cc8:
	db 1
	layout_patch wdabb, 2, 3, 2, $18

MapLayoutPatches_None::
	db 0
	layout_patch 0, 0, 0, 0, 0

MapLayoutPatches_01e_4cd6::
	db 5
	layout_patch wdab9, 0, $0b, 3, $57
	layout_patch wdab9, 1, 0, $0a, $58
	layout_patch wdab9, 2, 2, $0a, $59
	layout_patch wdab9, 3, 0, $0b, $5a
	layout_patch wdab9, 4, 2, $0b, $5b

MapLayoutPatches_01e_4cf5::
	db 1
	layout_patch wdab9, 5, 2, 0, $16

MapLayoutPatches_01e_4cfc::
	db 2
	layout_patch wdab9, 6, 3, 6, $3e
	layout_patch wdab9, 7, 8, 7, $3f

MapLayoutPatches_01e_4d09::
	db 1
	layout_patch wdaba, 0, 2, 0, $14

MapLayoutPatches_01e_4d10::
	db 4
	layout_patch wdaba, 1, 1, 0, $54
	layout_patch wdaba, 2, $0b, 0, $55
	layout_patch wdaba, 3, 0, 8, $56
	layout_patch wdaba, 4, 5, 8, $57

INCLUDE "data/items/name_pointers.asm"

INCLUDE "data/monsters/menu_icons.asm"

; type-name index per wBattleAnimID (low nibble -> TypeNames)
TypeNameIndex_01e_551f::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $04, $04
	db $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
	db $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02
	db $03, $03, $03, $03, $03, $03, $03, $06, $06, $06, $05, $06, $06, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $05, $05, $05, $05, $05, $05, $05, $05, $05
	db $05, $08, $08, $08, $08, $08, $08, $06, $06, $06, $08, $08, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $06, $00, $00

TypeNames::
	dw text_1e_55c0
	dw text_1e_55c3
	dw text_1e_55c6
	dw text_1e_55c9
	dw text_1e_55cc
	dw text_1e_55cf
	dw text_1e_55d2
	dw text_1e_55d5
	dw text_1e_55d8

INCLUDE "data/text/mon_types.asm"

INCLUDE "data/icon_pointers.asm"

PointerTable_01e_57ed::
	dw text_1e_5829
	dw text_1e_582a
	dw text_1e_5836
	dw text_1e_5841
	dw text_1e_584f
	dw text_1e_585f
	dw text_1e_586c
	dw text_1e_5875
	dw text_1e_587d
	dw text_1e_5888
	dw text_1e_5890
	dw text_1e_5898
	dw text_1e_58a5
	dw text_1e_58b1
	dw text_1e_58c1
	dw text_1e_58d4
	dw text_1e_58f0
	dw text_1e_58fb
	dw text_1e_5907
	dw text_1e_591f
	dw text_1e_592c
	dw text_1e_5947
	dw text_1e_595f
	dw text_1e_5971
	dw text_1e_597a
	dw text_1e_598b
	dw text_1e_599b
	dw text_1e_59a9
	dw text_1e_59b7
	dw text_1e_59c4

INCLUDE "data/text/script_menu_system.asm"

PointerTable_01e_59cc::
	dw Pointers_01e_59d2
	dw Pointers_01e_614f
	dw Pointers_01e_63e5
Pointers_01e_59d2::
	dw text_1e_5aa0
	dw text_1e_5aa1
	dw text_1e_5ab2
	dw text_1e_5ac6
	dw text_1e_5ad7
	dw text_1e_5aec
	dw text_1e_5b04
	dw text_1e_5b1b
	dw text_1e_5b34
	dw text_1e_5b4d
	dw text_1e_5b66
	dw text_1e_5b7e
	dw text_1e_5b97
	dw text_1e_5ba2
	dw text_1e_5bad
	dw text_1e_5bb8
	dw text_1e_5bc3
	dw text_1e_5bce
	dw text_1e_5bd7
	dw text_1e_5bee
	dw text_1e_5c05
	dw text_1e_5c1a
	dw text_1e_5c2c
	dw text_1e_5c3f
	dw text_1e_5c4d
	dw text_1e_5c65
	dw text_1e_5c7d
	dw text_1e_5c95
	dw text_1e_5cad
	dw text_1e_5cc2
	dw text_1e_5cdc
	dw text_1e_5cf6
	dw text_1e_5d10
	dw text_1e_5d2a
	dw text_1e_5d41
	dw text_1e_5d5c
	dw text_1e_5d7a
	dw text_1e_5d95
	dw text_1e_5db1
	dw text_1e_5dcc
	dw text_1e_5de6
	dw text_1e_5df6
	dw text_1e_5e08
	dw text_1e_5e1a
	dw text_1e_5e2c
	dw text_1e_5e3c
	dw text_1e_5e4c
	dw text_1e_5e5e
	dw text_1e_5e70
	dw text_1e_5e83
	dw text_1e_5e93
	dw text_1e_5ea4
	dw text_1e_5eb6
	dw text_1e_5ec7
	dw text_1e_5eda
	dw text_1e_5eea
	dw text_1e_5efb
	dw text_1e_5f0c
	dw text_1e_5f1d
	dw text_1e_5f2f
	dw text_1e_5f41
	dw text_1e_5f53
	dw text_1e_5f65
	dw text_1e_5f78
	dw text_1e_5f8a
	dw text_1e_5f9a
	dw text_1e_5fac
	dw text_1e_5fbd
	dw text_1e_5fcd
	dw text_1e_5fdd
	dw text_1e_5fee
	dw text_1e_5ffd
	dw text_1e_600d
	dw text_1e_601e
	dw text_1e_6032
	dw text_1e_6043
	dw text_1e_6055
	dw text_1e_6067
	dw text_1e_6078
	dw text_1e_6089
	dw text_1e_609b
	dw text_1e_60ae
	dw text_1e_60c2
	dw text_1e_60d3
	dw text_1e_60e7
	dw text_1e_60f8
	dw text_1e_610a
	dw text_1e_611c
	dw text_1e_612e
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f
	dw text_1e_613f

INCLUDE "data/text/script_item_descriptions_0.asm"

INCLUDE "data/text/script_item_descriptions_5c3f.asm"

Pointers_01e_614f::
	dw text_1e_6197 
	dw text_1e_6198 
	dw text_1e_61b7 
	dw text_1e_61d1 
	dw text_1e_61e8 
	dw text_1e_61ff 
	dw text_1e_6216 
	dw text_1e_622d 
	dw text_1e_6244 
	dw text_1e_625b 
	dw text_1e_6271 
	dw text_1e_6291 
	dw text_1e_62b1 
	dw text_1e_62d1 
	dw text_1e_62f1 
	dw text_1e_6311 
	dw text_1e_6331 
	dw text_1e_6350 
	dw text_1e_636e 
	dw text_1e_638b 
	dw text_1e_63a8 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5 
	dw text_1e_63c5
	INCLUDE "data/text/script_equipment_descriptions.asm"
Pointers_01e_63e5::
	dw text_1e_6437 
	dw text_1e_6438 
	dw text_1e_6442 
	dw text_1e_644b 
	dw text_1e_6458 
	dw text_1e_645d 
	dw text_1e_6466 
	dw text_1e_646c 
	dw text_1e_6471 
	dw text_1e_6479 
	dw text_1e_6480 
	dw text_1e_6486 
	dw text_1e_648e 
	dw text_1e_6497 
	dw text_1e_649e 
	dw text_1e_64a6 
	dw text_1e_64ac 
	dw text_1e_64b3 
	dw text_1e_64bb 
	dw text_1e_64c2 
	dw text_1e_64cf 
	dw text_1e_64d4 
	dw text_1e_64dc 
	dw text_1e_64e4 
	dw text_1e_64ec 
	dw text_1e_64f3 
	dw text_1e_64fa 
	dw text_1e_6502 
	dw text_1e_6509 
	dw text_1e_650f 
	dw text_1e_6514 
	dw text_1e_651a 
	dw text_1e_651f 
	dw text_1e_6528 
	dw text_1e_6531 
	dw text_1e_6539 
	dw text_1e_6540 
	dw text_1e_6549 
	dw text_1e_6550 
	dw text_1e_6557 
	dw text_1e_6560
	INCLUDE "data/text/script_item_names.asm"

Pointers_01e_6567::
	dw text_1e_6635
	dw text_1e_6636
	dw text_1e_6646
	dw text_1e_6659
	dw text_1e_6669
	dw text_1e_667e
	dw text_1e_6689
	dw text_1e_6694
	dw text_1e_66a0
	dw text_1e_66ac
	dw text_1e_66b8
	dw text_1e_66c4
	dw text_1e_66d1
	dw text_1e_66db
	dw text_1e_66e5
	dw text_1e_66ef
	dw text_1e_66f9
	dw text_1e_6703
	dw text_1e_670f
	dw text_1e_6721
	dw text_1e_6733
	dw text_1e_6741
	dw text_1e_674e
	dw text_1e_675c
	dw text_1e_676c
	dw text_1e_6775
	dw text_1e_677e
	dw text_1e_6788
	dw text_1e_6792
	dw text_1e_679a
	dw text_1e_67a4
	dw text_1e_67ae
	dw text_1e_67b9
	dw text_1e_67c4
	dw text_1e_67ce
	dw text_1e_67e4
	dw text_1e_67ff
	dw text_1e_681a
	dw text_1e_682f
	dw text_1e_6837
	dw text_1e_683d
	dw text_1e_6847
	dw text_1e_6855
	dw text_1e_6863
	dw text_1e_6871
	dw text_1e_687d
	dw text_1e_6889
	dw text_1e_6897
	dw text_1e_68a5
	dw text_1e_68b3
	dw text_1e_68bf
	dw text_1e_68cc
	dw text_1e_68da
	dw text_1e_68e7
	dw text_1e_68f5
	dw text_1e_6901
	dw text_1e_690e
	dw text_1e_691a
	dw text_1e_6925
	dw text_1e_6933
	dw text_1e_6941
	dw text_1e_694f
	dw text_1e_695d
	dw text_1e_696b
	dw text_1e_6979
	dw text_1e_6985
	dw text_1e_6993
	dw text_1e_69a0
	dw text_1e_69ac
	dw text_1e_69b8
	dw text_1e_69c4
	dw text_1e_69cd
	dw text_1e_69d9
	dw text_1e_69e6
	dw text_1e_69f6
	dw text_1e_6a03
	dw text_1e_6a11
	dw text_1e_6a1f
	dw text_1e_6a2c
	dw text_1e_6a39
	dw text_1e_6a47
	dw text_1e_6a55
	dw text_1e_6a63
	dw text_1e_6a70
	dw text_1e_6a80
	dw text_1e_6a8d
	dw text_1e_6a9b
	dw text_1e_6aa9
	dw text_1e_6ab7
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	dw text_1e_6ac3
	INCLUDE "data/text/script_item_effects.asm"
Func_01e_6acd::
	ld a, [$DCE6]
	and a
	jr nz, .asm_6ad9
	ldh a, [hFFD6]
	and a
	jp nz, .asm_6c6b
.asm_6ad9
	ld de, MonSpeciesInfo
	ld a, [wEnemyMonSpecies]
	ld l, a
	ld h, $00
	add hl, de
	ld b, [hl]
	and a
	jp z, .asm_6c6b
	ld a, [wd9f3]
	cp $01
	jr z, .asm_6afc
	cp $02
	jp z, .asm_6bec
	cp $03
	jp z, .asm_6c1f
	ld d, $01
	ret
.asm_6afc
	ld a, b
	cp $01
	jp z, .asm_6b0a
	cp $02
	jp z, .asm_6bab
	jp .asm_6c6b
.asm_6b0a
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $16
	jp nc, .asm_6b2a
	cp $0A
	jp nc, .asm_6b6a
	jr .asm_6b4a
.asm_6b2a
	ld de, unk_01e_6c6e
	ld a, [$D0EA]
	inc a
	ld [$D0EA], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6b43
	xor a
	ld [$D0EA], a
	jr .asm_6b2a
.asm_6b43
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6b4a
	ld de, unk_01e_6c97
	ld a, [$D0E6]
	inc a
	ld [$D0E6], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6b63
	xor a
	ld [$D0E6], a
	jr .asm_6b4a
.asm_6b63
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6b6a
	ld de, unk_01e_6cc0
	ld a, [$D0E7]
	inc a
	ld [$D0E7], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6b83
	xor a
	ld [$D0E7], a
	jr .asm_6b6a
.asm_6b83
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6b8a
	ld de, unk_01e_6d12
	ld a, [$D0E9]
	inc a
	ld [$D0E9], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6ba4
	xor a
	ld [$D0E9], a
	jp .asm_6b8a
.asm_6ba4
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6bab
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $16
	jp nc, .asm_6c6b
	cp $0A
	jp nc, .asm_6b8a
	jp .asm_6b6a
.asm_6bcc
	ld de, unk_01e_6ce9
	ld a, [$D0E8]
	inc a
	ld [$D0E8], a
	ld l, a
	ld h, $00
	add hl, de
	ld a, [hl]
	cp $FF
	jr nz, .asm_6be5
	xor a
	ld [$D0E8], a
	jr .asm_6bcc
.asm_6be5
	and a
	jp nz, .asm_6c6b
	ld d, $01
	ret
.asm_6bec
	ld a, b
	cp $01
	jr z, .asm_6bfe
	cp $02
	jp z, .asm_6b0a
	cp $03
	jp z, .asm_6bab
	jp .asm_6c6b
.asm_6bfe
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $20
	jp nc, .asm_6b6a
	cp $10
	jp nc, .asm_6b4a
	ld d, $01
	ret
.asm_6c1f
	ld a, b
	cp $01
	jr z, .asm_6c36
	cp $02
	jp z, .asm_6bfe
	cp $03
	jp z, .asm_6b0a
	cp $04
	jp z, .asm_6bab
	jp .asm_6c6b
.asm_6c36
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $18
	jp nc, .asm_6b4a
	ld d, $01
	ret
.asm_6c52
	ld a, [wd984]
	ld [wd3f0], a
	ld a, [wd985]
	ld [wd3f1], a
	farcall Func_025_4000
	ldh a, [hMathValue]
	cp $0F
	jp c, .asm_6b8a
.asm_6c6b
	ld d, $00
	ret
; TODO: unk_ - data, referenced via `ld de, unk_01e_6c6e`
unk_01e_6c6e::
	db $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $01, $01, $01, $01, $00, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $01, $01, $01, $01, $01
	db $01, $01, $00, $01, $01, $01, $01, $01, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6c97`
unk_01e_6c97::
	db $00, $00, $01, $00, $00, $01, $00, $00, $00, $01, $00, $00, $01, $00, $01, $00
	db $00, $01, $00, $00, $00, $00, $00, $00, $01, $00, $00, $01, $00, $00, $00, $00
	db $01, $00, $00, $00, $00, $00, $00, $00, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6cc0`
unk_01e_6cc0::
	db $00, $01, $01, $00, $01, $00, $00, $00, $01, $00, $01, $00, $00, $01, $00, $01
	db $00, $01, $00, $00, $00, $01, $01, $00, $01, $00, $01, $01, $00, $01, $00, $01
	db $00, $00, $00, $01, $00, $00, $01, $00, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6ce9`
unk_01e_6ce9::
	db $00, $01, $01, $00, $00, $01, $01, $00, $01, $00, $01, $00, $01, $01, $01, $00
	db $01, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $00
	db $00, $01, $00, $01, $00, $01, $00, $00, $ff
; TODO: unk_ - data, referenced via `ld de, unk_01e_6d12`
unk_01e_6d12::
	db $01, $01, $01, $00, $01, $01, $01, $00, $01, $01, $01, $01, $00, $01, $01, $00
	db $01, $01, $00, $01, $01, $00, $01, $01, $01, $01, $00, $01, $01, $01, $00, $01
	db $00, $01, $00, $01, $01, $00, $01, $00, $ff
INCLUDE "data/monsters/species_info.asm"
INCLUDE "data/text/script_item_get_6ddb.asm"

INCLUDE "engine/items/load_item_name.asm"

INCLUDE "data/items/map_item_names.asm"

INCLUDE "data/text/script_item_found.asm"

INCLUDE "engine/items/load_shop_name.asm"

INCLUDE "data/items/price_options.asm"
	
INCLUDE "data/text/store_price_options.asm"

