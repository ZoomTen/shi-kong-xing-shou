	dw .g0
	dw .g0
	dw .g2
	dw .g3
	dw .g4
	dw .g5
	dw .g6
	dw .g0
.g0:
	found_item_event FACE_DOWN, wFoundItemFlags, 0, ITEMNAMECAT_ITEM, ITEM_00
	found_item_event FACE_UP, wFoundItemFlags, 0, ITEMNAMECAT_ITEM, ITEM_15
	found_item_event FACE_UP, wFoundItemFlags, 1, ITEMNAMECAT_ITEM, TM21
	found_item_event FACE_UP, wFoundItemFlags, 2, ITEMNAMECAT_ITEM, ITEM_1d
	found_item_event FACE_UP, wFoundItemFlags, 3, ITEMNAMECAT_ITEM, ITEM_12
	found_item_event FACE_UP, wFoundItemFlags, 4, ITEMNAMECAT_ITEM, ITEM_01
	found_item_event FACE_UP, wFoundItemFlags, 5, ITEMNAMECAT_ITEM, ITEM_27
	found_item_event FACE_UP, wFoundItemFlags, 6, ITEMNAMECAT_PRICE, $01
	found_item_event FACE_UP, wFoundItemFlags, 7, ITEMNAMECAT_ITEM, ITEM_17
	found_item_event FACE_UP, wFoundItemFlags + 1, 0, ITEMNAMECAT_ITEM, ITEM_19
	found_item_event FACE_UP, wFoundItemFlags + 1, 1, ITEMNAMECAT_ITEM, ITEM_1a
	found_item_event FACE_UP, wFoundItemFlags + 1, 2, ITEMNAMECAT_ITEM, ITEM_0c
	found_item_event FACE_UP, wFoundItemFlags + 1, 3, ITEMNAMECAT_ITEM, TM47
	found_item_event FACE_UP, wFoundItemFlags + 1, 4, ITEMNAMECAT_ITEM, ITEM_1c
	found_item_event FACE_UP, wFoundItemFlags + 1, 5, ITEMNAMECAT_ITEM, ITEM_1d
	found_item_event FACE_UP, wFoundItemFlags + 1, 6, ITEMNAMECAT_ITEM, ITEM_02
	found_item_event FACE_UP, wFoundItemFlags + 1, 7, ITEMNAMECAT_EQUIP, EQUIP_15
	found_item_event FACE_UP, wFoundItemFlags + 2, 0, ITEMNAMECAT_ITEM, ITEM_23
.g2:
	found_item_event FACE_DOWN, wFoundItemFlags + 2, 1, ITEMNAMECAT_ITEM, ITEM_00
	found_item_event FACE_UP, wFoundItemFlags + 2, 1, ITEMNAMECAT_ITEM, ITEM_08
	found_item_event FACE_UP, wFoundItemFlags + 2, 2, ITEMNAMECAT_ITEM, ITEM_16
	found_item_event FACE_UP, wFoundItemFlags + 2, 3, ITEMNAMECAT_ITEM, ITEM_1f
	found_item_event FACE_UP, wFoundItemFlags + 2, 4, ITEMNAMECAT_ITEM, ITEM_22
	found_item_event FACE_UP, wFoundItemFlags + 2, 5, ITEMNAMECAT_ITEM, ITEM_0b
	found_item_event FACE_UP, wFoundItemFlags + 2, 6, ITEMNAMECAT_ITEM, ITEM_12
	found_item_event FACE_UP, wFoundItemFlags + 2, 7, ITEMNAMECAT_ITEM, ITEM_25
	found_item_event FACE_UP, wFoundItemFlags + 3, 0, ITEMNAMECAT_ITEM, ITEM_20
	found_item_event FACE_UP, wFoundItemFlags + 3, 1, ITEMNAMECAT_ITEM, ITEM_0e
	found_item_event FACE_UP, wFoundItemFlags + 3, 2, ITEMNAMECAT_EQUIP, EQUIP_01
	found_item_event FACE_UP, wFoundItemFlags + 3, 3, ITEMNAMECAT_ITEM, ITEM_0b
	found_item_event FACE_UP, wFoundItemFlags + 3, 4, ITEMNAMECAT_ITEM, ITEM_26
	found_item_event FACE_UP, wFoundItemFlags + 3, 5, ITEMNAMECAT_PRICE, $02
	found_item_event FACE_UP, wFoundItemFlags + 3, 6, ITEMNAMECAT_ITEM, ITEM_17
.g3:
	found_item_event FACE_DOWN, wFoundItemFlags + 3, 7, ITEMNAMECAT_ITEM, ITEM_00
	found_item_event FACE_UP, wFoundItemFlags + 3, 7, ITEMNAMECAT_ITEM, ITEM_14
	found_item_event FACE_UP, wFoundItemFlags + 4, 0, ITEMNAMECAT_EQUIP, EQUIP_12
	found_item_event FACE_UP, wFoundItemFlags + 4, 1, ITEMNAMECAT_ITEM, TM39
	found_item_event FACE_UP, wFoundItemFlags + 4, 2, ITEMNAMECAT_ITEM, ITEM_22
	found_item_event FACE_UP, wFoundItemFlags + 4, 3, ITEMNAMECAT_ITEM, ITEM_0b
	found_item_event FACE_UP, wFoundItemFlags + 4, 4, ITEMNAMECAT_ITEM, ITEM_13
	found_item_event FACE_UP, wFoundItemFlags + 4, 5, ITEMNAMECAT_EQUIP, EQUIP_05
	found_item_event FACE_UP, wFoundItemFlags + 4, 6, ITEMNAMECAT_PRICE, $01
	found_item_event FACE_UP, wFoundItemFlags + 4, 7, ITEMNAMECAT_EQUIP, EQUIP_12
.g4:
	found_item_event FACE_DOWN, wFoundItemFlags + 5, 0, ITEMNAMECAT_ITEM, ITEM_00
	found_item_event FACE_UP, wFoundItemFlags + 5, 0, ITEMNAMECAT_ITEM, ITEM_18
	found_item_event FACE_UP, wFoundItemFlags + 5, 1, ITEMNAMECAT_ITEM, ITEM_19
	found_item_event FACE_UP, wFoundItemFlags + 5, 2, ITEMNAMECAT_ITEM, ITEM_15
	found_item_event FACE_UP, wFoundItemFlags + 5, 3, ITEMNAMECAT_ITEM, ITEM_17
	found_item_event FACE_UP, wFoundItemFlags + 5, 4, ITEMNAMECAT_ITEM, ITEM_07
	found_item_event FACE_UP, wFoundItemFlags + 5, 5, ITEMNAMECAT_PRICE, $05
	found_item_event FACE_UP, wFoundItemFlags + 5, 6, ITEMNAMECAT_EQUIP, EQUIP_0b
	found_item_event FACE_UP, wFoundItemFlags + 5, 7, ITEMNAMECAT_ITEM, TM06
	found_item_event FACE_UP, wFoundItemFlags + 6, 0, ITEMNAMECAT_ITEM, TM33
	found_item_event FACE_UP, wFoundItemFlags + 6, 1, ITEMNAMECAT_ITEM, ITEM_04
	found_item_event FACE_UP, wFoundItemFlags + 6, 2, ITEMNAMECAT_PRICE, $02
	found_item_event FACE_UP, wFoundItemFlags + 6, 3, ITEMNAMECAT_ITEM, ITEM_21
	found_item_event FACE_UP, wFoundItemFlags + 6, 4, ITEMNAMECAT_ITEM, ITEM_16
	found_item_event FACE_UP, wFoundItemFlags + 6, 5, ITEMNAMECAT_ITEM, ITEM_23
	found_item_event FACE_UP, wFoundItemFlags + 6, 6, ITEMNAMECAT_ITEM, ITEM_1c
	found_item_event FACE_UP, wFoundItemFlags + 6, 7, ITEMNAMECAT_ITEM, ITEM_19
	found_item_event FACE_UP, wFoundItemFlags + 7, 0, ITEMNAMECAT_ITEM, ITEM_08
	found_item_event FACE_UP, wFoundItemFlags + 7, 1, ITEMNAMECAT_ITEM, ITEM_13
	found_item_event FACE_UP, wFoundItemFlags + 7, 2, ITEMNAMECAT_PRICE, $01
	found_item_event FACE_DOWN, wFoundItemFlags + 7, 3, ITEMNAMECAT_ITEM, TM41
	found_item_event FACE_RIGHT, wFoundItemFlags + 7, 4, ITEMNAMECAT_ITEM, ITEM_23
	found_item_event FACE_RIGHT, wFoundItemFlags + 7, 5, ITEMNAMECAT_ITEM, ITEM_1e
	found_item_event FACE_LEFT, wFoundItemFlags + 7, 6, ITEMNAMECAT_PRICE, $02
	found_item_event FACE_LEFT, wFoundItemFlags + 7, 7, ITEMNAMECAT_ITEM, TM31
.g5:
	found_item_event FACE_DOWN, wFoundItemFlags + 8, 0, ITEMNAMECAT_ITEM, ITEM_00
	found_item_event FACE_UP, wFoundItemFlags + 8, 0, ITEMNAMECAT_ITEM, TM04
	found_item_event FACE_UP, wFoundItemFlags + 8, 1, ITEMNAMECAT_ITEM, TM48
	found_item_event FACE_UP, wFoundItemFlags + 8, 2, ITEMNAMECAT_ITEM, ITEM_03
	found_item_event FACE_UP, wFoundItemFlags + 8, 3, ITEMNAMECAT_ITEM, ITEM_0d
	found_item_event FACE_UP, wFoundItemFlags + 8, 4, ITEMNAMECAT_ITEM, ITEM_13
	found_item_event FACE_UP, wFoundItemFlags + 8, 5, ITEMNAMECAT_ITEM, ITEM_11
	found_item_event FACE_UP, wFoundItemFlags + 8, 6, ITEMNAMECAT_ITEM, ITEM_0a
	found_item_event FACE_UP, wFoundItemFlags + 8, 7, ITEMNAMECAT_ITEM, ITEM_26
	found_item_event FACE_UP, wFoundItemFlags + 9, 0, ITEMNAMECAT_ITEM, ITEM_15
	found_item_event FACE_UP, wFoundItemFlags + 9, 1, ITEMNAMECAT_PRICE, $02
	found_item_event FACE_UP, wFoundItemFlags + 9, 2, ITEMNAMECAT_ITEM, ITEM_1e
	found_item_event FACE_UP, wFoundItemFlags + 9, 3, ITEMNAMECAT_ITEM, ITEM_08
	found_item_event FACE_UP, wFoundItemFlags + 9, 4, ITEMNAMECAT_ITEM, TM43
	found_item_event FACE_UP, wFoundItemFlags + 9, 5, ITEMNAMECAT_ITEM, ITEM_07
	found_item_event FACE_UP, wFoundItemFlags + 9, 6, ITEMNAMECAT_ITEM, ITEM_09
.g6:
	found_item_event FACE_DOWN, wFoundItemFlags + 9, 7, ITEMNAMECAT_ITEM, ITEM_00
	found_item_event FACE_UP, wFoundItemFlags + 9, 7, ITEMNAMECAT_ITEM, ITEM_0d
	found_item_event FACE_UP, wFoundItemFlags + 10, 0, ITEMNAMECAT_ITEM, ITEM_16
	found_item_event FACE_UP, wFoundItemFlags + 10, 1, ITEMNAMECAT_ITEM, ITEM_20
	found_item_event FACE_UP, wFoundItemFlags + 10, 2, ITEMNAMECAT_ITEM, ITEM_1d
	found_item_event FACE_UP, wFoundItemFlags + 10, 3, ITEMNAMECAT_ITEM, TM25
	found_item_event FACE_UP, wFoundItemFlags + 10, 4, ITEMNAMECAT_ITEM, ITEM_11
	found_item_event FACE_UP, wFoundItemFlags + 10, 5, ITEMNAMECAT_ITEM, ITEM_08
	found_item_event FACE_UP, wFoundItemFlags + 10, 6, ITEMNAMECAT_PRICE, $04
	found_item_event FACE_UP, wFoundItemFlags + 10, 7, ITEMNAMECAT_PRICE, $05
	found_item_event FACE_UP, wFoundItemFlags + 11, 0, ITEMNAMECAT_ITEM, TM16
