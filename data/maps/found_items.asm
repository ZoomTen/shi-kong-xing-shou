	dw .g0
	dw .g0
	dw .g2
	dw .g3
	dw .g4
	dw .g5
	dw .g6
	dw .g0
.g0:
	found_item_event FACE_DOWN, wFoundItemFlags, 0, 0, $00
	found_item_event FACE_UP, wFoundItemFlags, 0, 0, $15
	found_item_event FACE_UP, wFoundItemFlags, 1, 0, $3c
	found_item_event FACE_UP, wFoundItemFlags, 2, 0, $1d
	found_item_event FACE_UP, wFoundItemFlags, 3, 0, $12
	found_item_event FACE_UP, wFoundItemFlags, 4, 0, $01
	found_item_event FACE_UP, wFoundItemFlags, 5, 0, $27
	found_item_event FACE_UP, wFoundItemFlags, 6, 7, $01
	found_item_event FACE_UP, wFoundItemFlags, 7, 0, $17
	found_item_event FACE_UP, wFoundItemFlags + 1, 0, 0, $19
	found_item_event FACE_UP, wFoundItemFlags + 1, 1, 0, $1a
	found_item_event FACE_UP, wFoundItemFlags + 1, 2, 0, $0c
	found_item_event FACE_UP, wFoundItemFlags + 1, 3, 0, $56
	found_item_event FACE_UP, wFoundItemFlags + 1, 4, 0, $1c
	found_item_event FACE_UP, wFoundItemFlags + 1, 5, 0, $1d
	found_item_event FACE_UP, wFoundItemFlags + 1, 6, 0, $02
	found_item_event FACE_UP, wFoundItemFlags + 1, 7, 1, $15
	found_item_event FACE_UP, wFoundItemFlags + 2, 0, 0, $23
.g2:
	found_item_event FACE_DOWN, wFoundItemFlags + 2, 1, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 2, 1, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 2, 2, 0, $16
	found_item_event FACE_UP, wFoundItemFlags + 2, 3, 0, $1f
	found_item_event FACE_UP, wFoundItemFlags + 2, 4, 0, $22
	found_item_event FACE_UP, wFoundItemFlags + 2, 5, 0, $0b
	found_item_event FACE_UP, wFoundItemFlags + 2, 6, 0, $12
	found_item_event FACE_UP, wFoundItemFlags + 2, 7, 0, $25
	found_item_event FACE_UP, wFoundItemFlags + 3, 0, 0, $20
	found_item_event FACE_UP, wFoundItemFlags + 3, 1, 0, $0e
	found_item_event FACE_UP, wFoundItemFlags + 3, 2, 1, $01
	found_item_event FACE_UP, wFoundItemFlags + 3, 3, 0, $0b
	found_item_event FACE_UP, wFoundItemFlags + 3, 4, 0, $26
	found_item_event FACE_UP, wFoundItemFlags + 3, 5, 7, $02
	found_item_event FACE_UP, wFoundItemFlags + 3, 6, 0, $17
.g3:
	found_item_event FACE_DOWN, wFoundItemFlags + 3, 7, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 3, 7, 0, $14
	found_item_event FACE_UP, wFoundItemFlags + 4, 0, 1, $12
	found_item_event FACE_UP, wFoundItemFlags + 4, 1, 0, $4e
	found_item_event FACE_UP, wFoundItemFlags + 4, 2, 0, $22
	found_item_event FACE_UP, wFoundItemFlags + 4, 3, 0, $0b
	found_item_event FACE_UP, wFoundItemFlags + 4, 4, 0, $13
	found_item_event FACE_UP, wFoundItemFlags + 4, 5, 1, $05
	found_item_event FACE_UP, wFoundItemFlags + 4, 6, 7, $01
	found_item_event FACE_UP, wFoundItemFlags + 4, 7, 1, $12
.g4:
	found_item_event FACE_DOWN, wFoundItemFlags + 5, 0, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 5, 0, 0, $18
	found_item_event FACE_UP, wFoundItemFlags + 5, 1, 0, $19
	found_item_event FACE_UP, wFoundItemFlags + 5, 2, 0, $15
	found_item_event FACE_UP, wFoundItemFlags + 5, 3, 0, $17
	found_item_event FACE_UP, wFoundItemFlags + 5, 4, 0, $07
	found_item_event FACE_UP, wFoundItemFlags + 5, 5, 7, $05
	found_item_event FACE_UP, wFoundItemFlags + 5, 6, 1, $0b
	found_item_event FACE_UP, wFoundItemFlags + 5, 7, 0, $2d
	found_item_event FACE_UP, wFoundItemFlags + 6, 0, 0, $48
	found_item_event FACE_UP, wFoundItemFlags + 6, 1, 0, $04
	found_item_event FACE_UP, wFoundItemFlags + 6, 2, 7, $02
	found_item_event FACE_UP, wFoundItemFlags + 6, 3, 0, $21
	found_item_event FACE_UP, wFoundItemFlags + 6, 4, 0, $16
	found_item_event FACE_UP, wFoundItemFlags + 6, 5, 0, $23
	found_item_event FACE_UP, wFoundItemFlags + 6, 6, 0, $1c
	found_item_event FACE_UP, wFoundItemFlags + 6, 7, 0, $19
	found_item_event FACE_UP, wFoundItemFlags + 7, 0, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 7, 1, 0, $13
	found_item_event FACE_UP, wFoundItemFlags + 7, 2, 7, $01
	found_item_event FACE_DOWN, wFoundItemFlags + 7, 3, 0, $50
	found_item_event FACE_RIGHT, wFoundItemFlags + 7, 4, 0, $23
	found_item_event FACE_RIGHT, wFoundItemFlags + 7, 5, 0, $1e
	found_item_event FACE_LEFT, wFoundItemFlags + 7, 6, 7, $02
	found_item_event FACE_LEFT, wFoundItemFlags + 7, 7, 0, $46
.g5:
	found_item_event FACE_DOWN, wFoundItemFlags + 8, 0, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 8, 0, 0, $2b
	found_item_event FACE_UP, wFoundItemFlags + 8, 1, 0, $57
	found_item_event FACE_UP, wFoundItemFlags + 8, 2, 0, $03
	found_item_event FACE_UP, wFoundItemFlags + 8, 3, 0, $0d
	found_item_event FACE_UP, wFoundItemFlags + 8, 4, 0, $13
	found_item_event FACE_UP, wFoundItemFlags + 8, 5, 0, $11
	found_item_event FACE_UP, wFoundItemFlags + 8, 6, 0, $0a
	found_item_event FACE_UP, wFoundItemFlags + 8, 7, 0, $26
	found_item_event FACE_UP, wFoundItemFlags + 9, 0, 0, $15
	found_item_event FACE_UP, wFoundItemFlags + 9, 1, 7, $02
	found_item_event FACE_UP, wFoundItemFlags + 9, 2, 0, $1e
	found_item_event FACE_UP, wFoundItemFlags + 9, 3, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 9, 4, 0, $52
	found_item_event FACE_UP, wFoundItemFlags + 9, 5, 0, $07
	found_item_event FACE_UP, wFoundItemFlags + 9, 6, 0, $09
.g6:
	found_item_event FACE_DOWN, wFoundItemFlags + 9, 7, 0, $00
	found_item_event FACE_UP, wFoundItemFlags + 9, 7, 0, $0d
	found_item_event FACE_UP, wFoundItemFlags + 10, 0, 0, $16
	found_item_event FACE_UP, wFoundItemFlags + 10, 1, 0, $20
	found_item_event FACE_UP, wFoundItemFlags + 10, 2, 0, $1d
	found_item_event FACE_UP, wFoundItemFlags + 10, 3, 0, $40
	found_item_event FACE_UP, wFoundItemFlags + 10, 4, 0, $11
	found_item_event FACE_UP, wFoundItemFlags + 10, 5, 0, $08
	found_item_event FACE_UP, wFoundItemFlags + 10, 6, 7, $04
	found_item_event FACE_UP, wFoundItemFlags + 10, 7, 7, $05
	found_item_event FACE_UP, wFoundItemFlags + 11, 0, 0, $37
