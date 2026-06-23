	dw .vibrato1
	dw .vibrato2
	dw .vibrato3
	dw .vibrato4
	dw .vibrato5
	dw .vibrato6
	dw .vibrato7
	dw .vibrato8
	dw .vibrato9
	dw .vibrato10
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11

.vibrato1
	db $0f
	db -1

.vibrato2
	db $14, $03, $f4, $03
	db -1

.vibrato3
	db $11, $22, $11, $02, $f1, $e2, $f1, $02
	db -1

.vibrato4
	db $21, $32, $21, $02, $e1, $d2, $e1, $02
	db -1

.vibrato5
	db $21, $42, $21, $02, $e1, $c2, $e1, $02
	db -1

.vibrato6
	db $31, $52, $31, $02, $d1, $b2, $d1, $02
	db -1

.vibrato7
	db $31, $62, $31, $02, $d1, $a2, $d1, $02
	db -1

.vibrato8
	db $32, $72, $32, $02, $d2, $92, $d2, $02
	db -1

.vibrato9
	db $81, $91, $a1, $b1, $c1, $d1, $e1, $f1
	db $0f, $0f, $0f, $0f, $0f, $0f
	db -1

.vibrato10
	db $31, $21, $11, $0f, $0f, $0f, $0f, $0f, $0f
	db -1

.vibrato11
	db $03, $13, $23, $13
	db -1
