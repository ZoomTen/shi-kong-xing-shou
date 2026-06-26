MartGroups::
	dw ItemMarts
	dw TMMarts

ItemMarts::
	dw ItemMart_0
	dw ItemMart_1
	dw ItemMart_2
	dw ItemMart_3
	dw ItemMart_4
	dw ItemMart_5
	dw ItemMart_6
	dw ItemMart_7
	dw ItemMart_8
	dw ItemMart_9
	dw ItemMart_10
	dw ItemMart_11
	dw ItemMart_12
	dw ItemMart_13

ItemMart_0::
	db $01, $05, $0c, $0d, $0e, $12, $18, $27, -1
ItemMart_1::
	db $02, $05, $06, $0d, $0e, $12, $15, $27, -1
ItemMart_2::
	db $06, $09, $0c, $0d, $11, $19, $20, $23, -1
ItemMart_3::
	db $02, $05, $06, $0c, $12, $15, $23, $22, -1
ItemMart_4::
	db $02, $05, $09, $0a, $0b, $0c, $1c, $1e, -1
ItemMart_5::
	db $02, $03, $05, $06, $0c, $0d, $12, $15, -1
ItemMart_6::
	db $02, $03, $0a, $11, $12, $15, $24, $22, -1
ItemMart_7::
	db $03, $06, $07, $0c, $0d, $0f, $12, $15, -1
ItemMart_8::
	db $03, $07, $0c, $11, $13, $16, $24, $27, -1
ItemMart_9::
	db $03, $06, $0c, $0d, $15, $1d, $1a, $1e, -1
ItemMart_10::
	db $07, $08, $0c, $0d, $11, $16, $24, $27, -1
ItemMart_11::
	db $03, $08, $0c, $11, $14, $16, $17, $25, -1
ItemMart_12::
	db $03, $07, $0a, $0c, $11, $13, $15, $17, -1
ItemMart_13::
	db $03, $04, $08, $11, $13, $16, $22, $25, -1

TMMarts::
	dw TMMart_0
	dw TMMart_1
	dw TMMart_2
	dw TMMart_3
	dw TMMart_4
	dw TMMart_5
	dw TMMart_6
	dw TMMart_7
	dw TMMart_8
	dw TMMart_9
	dw TMMart_10
	dw TMMart_11
	dw TMMart_12
	dw TMMart_13

TMMart_0::
	db $08, $09, $0c, $0f, $12, $10, $11, $13, -1
TMMart_1::
	db $08, $05, $0f, $11, $12, $15, $01, $02, -1
TMMart_2::
	db $06, $0d, $10, $13, $15, $09, $02, $01, -1
TMMart_3::
	db $03, $0f, $12, $13, $15, $01, $0e, $0a, -1
TMMart_4::
	db $12, $15, $0e, $07, $04, $0a, $0f, $03, -1
TMMart_5::
	db $04, $0b, $0d, $11, $01, $13, $03, $0c, -1
TMMart_6::
	db $0b, $08, $04, $05, $11, $12, $13, $01, -1
TMMart_7::
	db $03, $0a, $09, $15, $10, $05, $0c, $01, -1
TMMart_8::
	db $13, $14, $08, $0a, $0f, $01, $0b, $15, -1
TMMart_9::
	db $13, $11, $01, $15, $06, $07, $0c, $0e, -1
TMMart_10::
	db $01, $02, $11, $15, $06, $07, $0c, $0e, -1
TMMart_11::
	db $01, $02, $11, $13, $14, $15, $10, $09, -1
TMMart_12::
	db $0a, $0b, $0c, $0d, $0e, $0f, $14, $10, -1
TMMart_13::
	db $01, $02, $10, $11, $12, $13, $14, $15, -1
