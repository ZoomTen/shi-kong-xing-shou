; these are raw values written to NRx2 each frame
; terminates on -1
	dw .instrument1
	dw .instrument2
	dw .instrument3
	dw .instrument4
	dw .instrument5
	dw .instrument6
	dw .instrument7
	dw .instrument8
	dw .instrument9
	dw .instrument10
	dw .instrument11
	dw .instrument12
	dw .instrument13
	dw .instrument14
	dw .instrument15
	dw .instrument16
	dw .instrument17
	dw .instrument18
	dw .instrument19
	dw .instrument20

.instrument1:
	db $8f
	db -1

.instrument2:
	db $1f
	db -1

.instrument3:
	db $2f
	db -1

.instrument4:
	db $3f
	db -1

.instrument5:
	db $4f
	db -1

.instrument6:
	db $5f
	db -1

.instrument7:
	db $6f
	db -1

.instrument8:
	db $7f
	db -1

.instrument9:
	db $8f
	db -1

.instrument10:
	db $9f
	db -1

.instrument11:
	db $af
	db -1

.instrument12:
	db $bf
	db -1

.instrument13:
	db $cf
	db -1

.instrument14:
	db $df
	db -1

.instrument15:
	db $ef
	db -1

.instrument16:
	db $fe
	db -1

.instrument17:
	db $b2, $52, $92, $42, $72, $32, $52, $22
	db -1

.instrument18:
	db $92, $42, $72, $32, $52, $22, $32, $12
	db -1

.instrument19:
	db $b3, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43, $63, $43
	db -1

.instrument20:
	db $83, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23, $43, $23
	db -1
