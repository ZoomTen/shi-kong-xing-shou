; Item IDs
	const_def
	const ITEM_00 ; $00
	const ITEM_01 ; $01
	const ITEM_02 ; $02
	const ITEM_03 ; $03
	const ITEM_04 ; $04
	const ITEM_05 ; $05
	const ITEM_06 ; $06
	const ITEM_07 ; $07
	const ITEM_08 ; $08
	const ITEM_09 ; $09
	const ITEM_0a ; $0a
	const ITEM_0b ; $0b
	const ITEM_0c ; $0c
	const ITEM_0d ; $0d
	const ITEM_0e ; $0e
	const ITEM_0f ; $0f
	const ITEM_10 ; $10
	const ITEM_11 ; $11
	const ITEM_12 ; $12
	const ITEM_13 ; $13
	const ITEM_14 ; $14
	const ITEM_15 ; $15
	const ITEM_16 ; $16
	const ITEM_17 ; $17
	const ITEM_18 ; $18
	const ITEM_19 ; $19
	const ITEM_1a ; $1a
	const ITEM_1b ; $1b
	const ITEM_1c ; $1c
	const ITEM_1d ; $1d
	const ITEM_1e ; $1e
	const ITEM_1f ; $1f
	const ITEM_20 ; $20
	const ITEM_21 ; $21
	const ITEM_22 ; $22
	const ITEM_23 ; $23
	const ITEM_24 ; $24
	const ITEM_25 ; $25
	const ITEM_26 ; $26
	const ITEM_27 ; $27

	const TM01 ; $28
	const TM02 ; $29
	const TM03 ; $2a
	const TM04 ; $2b
	const TM05 ; $2c
	const TM06 ; $2d
	const TM07 ; $2e
	const TM08 ; $2f
	const TM09 ; $30
	const TM10 ; $31
	const TM11 ; $32
	const TM12 ; $33
	const TM13 ; $34
	const TM14 ; $35
	const TM15 ; $36
	const TM16 ; $37
	const TM17 ; $38
	const TM18 ; $39
	const TM19 ; $3a
	const TM20 ; $3b
	const TM21 ; $3c
	const TM22 ; $3d
	const TM23 ; $3e
	const TM24 ; $3f
	const TM25 ; $40
	const TM26 ; $41
	const TM27 ; $42
	const TM28 ; $43
	const TM29 ; $44
	const TM30 ; $45
	const TM31 ; $46
	const TM32 ; $47
	const TM33 ; $48
	const TM34 ; $49
	const TM35 ; $4a
	const TM36 ; $4b
	const TM37 ; $4c
	const TM38 ; $4d
	const TM39 ; $4e
	const TM40 ; $4f
	const TM41 ; $50
	const TM42 ; $51
	const TM43 ; $52
	const TM44 ; $53
	const TM45 ; $54
	const TM46 ; $55
	const TM47 ; $56
	const TM48 ; $57
	const TM49 ; $58
	const TM50 ; $59
DEF NUM_ITEMS EQU const_value - 1 ; last real id ($00-$59 = items + TMs)
; ItemNames has 103 physical entries. $5a-$66 are unused placeholder slots
; (all point to the same string, text_1e_5218). Named for index-completeness
; only; nothing references them.
	const ITEM_5a ; $5a
	const ITEM_5b ; $5b
	const ITEM_5c ; $5c
	const ITEM_5d ; $5d
	const ITEM_5e ; $5e
	const ITEM_5f ; $5f
	const ITEM_60 ; $60
	const ITEM_61 ; $61
	const ITEM_62 ; $62
	const ITEM_63 ; $63
	const ITEM_64 ; $64
	const ITEM_65 ; $65
	const ITEM_66 ; $66

; Equipment IDs (EquipmentNames)
	const_def
	const EQUIP_00 ; $00
	const EQUIP_01 ; $01
	const EQUIP_02 ; $02
	const EQUIP_03 ; $03
	const EQUIP_04 ; $04
	const EQUIP_05 ; $05
	const EQUIP_06 ; $06
	const EQUIP_07 ; $07
	const EQUIP_08 ; $08
	const EQUIP_09 ; $09
	const EQUIP_0a ; $0a
	const EQUIP_0b ; $0b
	const EQUIP_0c ; $0c
	const EQUIP_0d ; $0d
	const EQUIP_0e ; $0e
	const EQUIP_0f ; $0f
	const EQUIP_10 ; $10
	const EQUIP_11 ; $11
	const EQUIP_12 ; $12
	const EQUIP_13 ; $13
	const EQUIP_14 ; $14
	const EQUIP_15 ; $15
DEF NUM_EQUIPMENT EQU const_value - 1 ; last real id ($00-$15 = 22 equipment)
; EquipmentNames has 36 physical entries. $16-$23 are unused placeholder slots
; (all point to the same string, text_1e_5302). Named for index-completeness
; only; nothing references them. Note the display filter (Func_01e_4719) further
; restricts the equipment list to ids < $16, so $16+ can never appear in the bag.
	const EQUIP_16 ; $16
	const EQUIP_17 ; $17
	const EQUIP_18 ; $18
	const EQUIP_19 ; $19
	const EQUIP_1a ; $1a
	const EQUIP_1b ; $1b
	const EQUIP_1c ; $1c
	const EQUIP_1d ; $1d
	const EQUIP_1e ; $1e
	const EQUIP_1f ; $1f
	const EQUIP_20 ; $20
	const EQUIP_21 ; $21
	const EQUIP_22 ; $22
	const EQUIP_23 ; $23

; Key item IDs (KeyItemNames) - all 41 entries are real (no placeholder padding)
	const_def
	const KEYITEM_00 ; $00
	const KEYITEM_01 ; $01
	const KEYITEM_02 ; $02
	const KEYITEM_03 ; $03
	const KEYITEM_04 ; $04
	const KEYITEM_05 ; $05
	const KEYITEM_06 ; $06
	const KEYITEM_07 ; $07
	const KEYITEM_08 ; $08
	const KEYITEM_09 ; $09
	const KEYITEM_0a ; $0a
	const KEYITEM_0b ; $0b
	const KEYITEM_0c ; $0c
	const KEYITEM_0d ; $0d
	const KEYITEM_0e ; $0e
	const KEYITEM_0f ; $0f
	const KEYITEM_10 ; $10
	const KEYITEM_11 ; $11
	const KEYITEM_12 ; $12
	const KEYITEM_13 ; $13
	const KEYITEM_14 ; $14
	const KEYITEM_15 ; $15
	const KEYITEM_16 ; $16
	const KEYITEM_17 ; $17
	const KEYITEM_18 ; $18
	const KEYITEM_19 ; $19
	const KEYITEM_1a ; $1a
	const KEYITEM_1b ; $1b
	const KEYITEM_1c ; $1c
	const KEYITEM_1d ; $1d
	const KEYITEM_1e ; $1e
	const KEYITEM_1f ; $1f
	const KEYITEM_20 ; $20
	const KEYITEM_21 ; $21
	const KEYITEM_22 ; $22
	const KEYITEM_23 ; $23
	const KEYITEM_24 ; $24
	const KEYITEM_25 ; $25
	const KEYITEM_26 ; $26
	const KEYITEM_27 ; $27
	const KEYITEM_28 ; $28
DEF NUM_KEY_ITEMS EQU const_value - 1

; Item-name category (wItemNameCategory; indexes ItemNameCategories)
	const_def
	const ITEMNAMECAT_ITEM  ; $00 ItemNames
	const ITEMNAMECAT_EQUIP ; $01 EquipmentNames
	const ITEMNAMECAT_KEY   ; $02 KeyItemNames
DEF ITEMNAMECAT_PRICE EQU 7 ; shop price-option special case
