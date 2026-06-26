G4_01_MapEvents::
	warp_event  3, 20, $0f, $01, $00
	warp_event  1, 12, $02, $02, $00
	warp_event  9,  5, $02, $00, $00
	warp_event  9, 11, $02, $01, $00
	warp_event 16, 11, $02, $05, $00
	warp_event 19, 16, $02, $06, $00
	events_end

G4_02_MapEvents::
	warp_event  9,  5, $01, $02, $00
	warp_event  9, 11, $01, $03, $00
	warp_event  2, 12, $01, $01, $00
	warp_event  2, 22, $03, $01, $00
	warp_event 22, 10, $03, $02, $00
	warp_event 16, 11, $01, $04, $00
	warp_event 19, 16, $01, $05, $00
	warp_event 21, 21, $03, $03, $00
	events_end

G4_03_MapEvents::
	warp_event 11,  1, $04, $01, $00
	warp_event  2, 18, $02, $03, $00
	warp_event 17, 10, $02, $04, $00
	warp_event 17, 16, $02, $07, $00
	events_end

G4_04_MapEvents::
	script_event ABSOLUTE,  0,  0, Script_055_5721 ; XXX: Resolve script bank
	warp_event 11,  1, $03, $00, $00
	events_end

G4_05_MapEvents::
	warp_event ABSOLUTE,  9, $04, $00, $00
	events_end

G4_06_MapEvents::
	script_event ABSOLUTE, 19,  0, $4004 ; XXX: Resolve script bank
	warp_event 14, 10, $07, $00, $00
	events_end

G4_07_MapEvents::
	warp_event 14, 10, $06, $01, $00
	warp_event 18,  2, $08, $00, $00
	events_end

G4_08_MapEvents::
	warp_event 18,  2, $07, $01, $00
	warp_event 14, 10, $09, $00, $00
	events_end

G4_09_MapEvents::
	warp_event 14, 10, $08, $01, $00
	script_event  8, 10,  0, $434b ; XXX: Resolve script bank
	events_end

EastFishmarketMermaidCutscene_MapEvents::
	warp_event  6,  8, $09, $01, $00
	events_end

EastFishmarket_0b_MapEvents::
	warp_event ABSOLUTE,  0, $42, $00, $00
	warp_event 12,  4, $2d, $00, $00
	warp_event  8,  4, $31, $00, $00
	warp_event  2,  4, $2c, $00, $00
	warp_event  2, 12, $2f, $00, $00
	warp_event  3, 19, $30, $00, $00
	warp_event 20,  4, $2e, $00, $00
	warp_event 20, 10, $32, $00, $00
	warp_event 18, 19, $33, $00, $00
	script_event ABSOLUTE, 23,  0, $545a ; XXX: Resolve script bank
	events_end

EastFishmarket_0c_MapEvents::
	warp_event ABSOLUTE,  0, $0b, $09, $00
	script_event 18,  4,  0, $5468 ; XXX: Resolve script bank
	events_end

EastFishmarketUndersea_0d_MapEvents::
	script_event ABSOLUTE,  0,  0, $5658 ; XXX: Resolve script bank
	warp_event  6,  7, $11, $00, $00
	warp_event  3, 16, $12, $00, $00
	warp_event 13, 14, $13, $00, $00
	signpost_event 12,  3, $07
	events_end

EastFishmarketUndersea_0e_MapEvents::
	warp_event ABSOLUTE,  0, $0f, $00, $00
	warp_event ABSOLUTE, 19, $0d, $00, $00
	signpost_event  4,  4, $08
	events_end

G4_0F_MapEvents::
	warp_event ABSOLUTE,  9, $0e, $00, $00
	warp_event  9,  2, $01, $00, $00
	events_end

G4_10_MapEvents::
	warp_event ABSOLUTE,  0, $44, $01, $00
	script_event  0, 13,  0, $405c ; XXX: Resolve script bank
	script_event  0, 14,  0, $405c ; XXX: Resolve script bank
	events_end

EastFishmarketUndersea_11_MapEvents::
	warp_event ABSOLUTE,  8, $0d, $01, $00
	event_07  7,  2, $11
	events_end

EastFishmarketUndersea_12_MapEvents::
	warp_event ABSOLUTE,  8, $0d, $02, $00
	event_07  2,  2, $12
	events_end

EastFishmarketUndersea_13_MapEvents::
	warp_event ABSOLUTE,  8, $0d, $03, $00
	event_04  4,  4,  0, $5862 ; XXX: Resolve script bank
	event_04  7,  4,  0, $5890 ; XXX: Resolve script bank
	events_end

GeothermalCity_14_MapEvents::
	warp_event 14,  5, $35, $00, $00
	warp_event  3,  5, $34, $00, $00
	script_event  2, 12,  0, $4701 ; XXX: Resolve script bank
	warp_event  0, ABSOLUTE, $1e, $02, $00
	warp_event  7, 19, $38, $00, $00
	warp_event ABSOLUTE, 23, $1f, $00, $00
	warp_event 15, 19, $37, $00, $00
	warp_event 11, 12, $39, $00, $00
	script_event 19, ABSOLUTE,  0, $40df ; XXX: Resolve script bank
	events_end

LifeValley_MapEvents::
	script_event 14, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event 15, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event 16, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event  0,  6,  0, $470f ; XXX: Resolve script bank
	warp_event  7, 17, $4f, $00, $00
	signpost_event 13, 28, $09
	events_end

DeathValley_MapEvents::
	warp_event 29,  3, $15, $01, $00
	events_end

G4_17_MapEvents::
	script_event ABSOLUTE,  9,  0, $40eb ; XXX: Resolve script bank
	warp_event  3,  4, $18, $00, $00
	event_07 14,  4, $13
	event_07  3,  5, $14
	events_end

TravelingShip_18_MapEvents::
	warp_event  3,  5, $17, $01, $00
	warp_event 16,  5, $19, $00, $00
	event_07 15,  4, $15
	event_07  3,  4, $16
	events_end

TravelingShip_19_MapEvents::
	warp_event 16,  5, $18, $01, $00
	event_07  4,  4, $17
	event_07 12,  4, $18
	events_end

G4_1A_MapEvents::
	warp_event  3, 19, $29, $01, $00
	warp_event  4, 19, $29, $01, $00
	warp_event  5, 19, $29, $01, $00
	warp_event 15, 19, $1b, $00, $00
	warp_event 16, 19, $1b, $00, $00
	events_end

G4_1B_MapEvents::
	warp_event ABSOLUTE,  0, $1a, $01, $00
	warp_event 19, ABSOLUTE, $1c, $00, $00
	events_end

G4_1C_MapEvents::
	warp_event  0, ABSOLUTE, $1b, $01, $00
	warp_event ABSOLUTE, 19, $1d, $00, $00
	events_end

SacredtreeTimeTravel_MapEvents::
	warp_event ABSOLUTE,  0, $1c, $01, $00
	events_end

G4_1E_MapEvents::
	warp_event ABSOLUTE,  0, $15, $00, $00
	script_event ABSOLUTE, 11,  0, $40e4 ; XXX: Resolve script bank
	warp_event 23, ABSOLUTE, $14, $03, $00
	signpost_event  1,  3, $0a
	signpost_event  4, 10, $0b
	events_end

G4_1F_MapEvents::
	warp_event ABSOLUTE,  0, $14, $05, $00
	script_event ABSOLUTE,  9,  0, $40ed ; XXX: Resolve script bank
	events_end

G4_20_MapEvents::
	warp_event ABSOLUTE,  0, $1f, $01, $00
	events_end

SacredtreeVillage_21_MapEvents::
	warp_event ABSOLUTE, 23, $2b, $01, $00
	warp_event  2,  7, $21, $03, $00
	warp_event 21,  3, $22, $00, $00
	warp_event  3, 11, $21, $01, $00
	events_end

G4_22_MapEvents::
	warp_event  2,  2, $21, $02, $00
	warp_event 16, 21, $23, $02, $00
	events_end

G4_23_MapEvents::
	warp_event  6,  9, $24, $00, $00
	warp_event  7, 22, $23, $03, $00
	warp_event 14, 22, $22, $01, $00
	warp_event 12, 12, $23, $01, $00
	events_end

SacredtreeStardreamDeparture_MapEvents::
	warp_event  6, 22, $23, $00, $00
	events_end

SacredtreeVillage_25_MapEvents::
	script_event ABSOLUTE,  0,  0, $40c0 ; XXX: Resolve script bank
	script_event  0, ABSOLUTE,  0, $4811 ; XXX: Resolve script bank
	warp_event ABSOLUTE, 23, $2a, $00, $00
	warp_event 13,  4, $40, $00, $00
	warp_event  8,  4, $3b, $00, $00
	warp_event  3,  4, $3a, $00, $00
	script_event  2, 14,  0, $41e6 ; XXX: Resolve script bank
	warp_event  3, 20, $41, $00, $00
	warp_event 12, 18, $3d, $00, $00
	warp_event 20, 19, $3e, $00, $00
	warp_event 20,  8, $3c, $00, $00
	signpost_event 17,  3, $01
	signpost_event  2,  8, $02
	signpost_event 13, 22, $03
	events_end

G4_26_MapEvents::
	warp_event  0, ABSOLUTE, $28, $00, $00
	warp_event ABSOLUTE, 23, $5e, $00, $00
	warp_event 13,  4, $5c, $00, $00
	warp_event  8,  4, $57, $00, $00
	warp_event  3,  4, $56, $00, $00
	warp_event  2, 14, $5b, $00, $00
	warp_event  3, 20, $5d, $00, $00
	warp_event 12, 18, $59, $00, $00
	warp_event 20, 19, $5a, $00, $00
	warp_event 20,  8, $58, $00, $00
	signpost_event 17,  3, $01
	signpost_event  2,  8, $02
	signpost_event 13, 22, $03
	events_end

SacredtreeVillage_27_MapEvents::
	warp_event  0, ABSOLUTE, $28, $00, $00
	warp_event ABSOLUTE, 23, $5e, $00, $00
	warp_event 13,  4, $5c, $00, $00
	warp_event  8,  4, $57, $00, $00
	warp_event  3,  4, $56, $00, $00
	warp_event  2, 14, $5b, $00, $00
	warp_event  3, 20, $5d, $00, $00
	warp_event 12, 18, $59, $00, $00
	warp_event 20, 19, $5a, $00, $00
	warp_event 20,  8, $58, $00, $00
	signpost_event 17,  3, $01
	signpost_event  2,  8, $02
	signpost_event 13, 22, $03
	events_end

SacredtreeVillage_28_MapEvents::
	script_event 15, ABSOLUTE,  0, $44bf ; XXX: Resolve script bank
	event_04  4,  5,  0, $448c ; XXX: Resolve script bank
	event_04  4,  6,  0, $448c ; XXX: Resolve script bank
	event_04  2,  7,  0, $4492 ; XXX: Resolve script bank
	event_04  3,  7,  0, $448c ; XXX: Resolve script bank
	event_04  2,  8,  0, $448c ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

G4_29_MapEvents::
	warp_event 15, ABSOLUTE, $25, $01, $00
	event_04  5,  4,  0, $44e4 ; XXX: Resolve script bank
	event_04  4,  5,  0, $481f ; XXX: Resolve script bank
	event_04  4,  6,  0, $481f ; XXX: Resolve script bank
	event_04  2,  7,  0, $482c ; XXX: Resolve script bank
	event_04  3,  7,  0, $481f ; XXX: Resolve script bank
	event_04  2,  8,  0, $481f ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

G4_2A_MapEvents::
	warp_event ABSOLUTE,  0, $25, $02, $00
	warp_event  0, ABSOLUTE, $2b, $00, $00
	event_04  8, 14,  0, $4466 ; XXX: Resolve script bank
	event_04  8, 15,  0, $4466 ; XXX: Resolve script bank
	event_04  6, 14,  0, $448d ; XXX: Resolve script bank
	event_04  6, 15,  0, $448d ; XXX: Resolve script bank
	event_04  7, 27,  0, $4466 ; XXX: Resolve script bank
	event_04  7, 28,  0, $4466 ; XXX: Resolve script bank
	event_04  5, 27,  0, $448d ; XXX: Resolve script bank
	event_04  5, 28,  0, $448d ; XXX: Resolve script bank
	signpost_event  5,  4, $05
	events_end

G4_2B_MapEvents::
	warp_event 15, ABSOLUTE, $2a, $01, $00
	warp_event  4,  4, $21, $00, $00
	signpost_event  6,  6, $06
	events_end

EastFishmarket_2c_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $03, $00
	event_07  9,  3, $02
	events_end

EastFishmarket_2d_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $01, $00
	event_07  4,  3, $09
	events_end

EastFishmarket_2e_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $06, $00
	event_07  9,  6, $0a
	events_end

EastFishmarket_2f_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $04, $00
	event_07  4,  3, $08
	events_end

G4_30_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $05, $00
	event_07  8,  3, $01
	events_end

EastFishmarket_31_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $02, $00
	event_04  4,  4,  0, $534b ; XXX: Resolve script bank
	event_04  8,  4,  0, $5359 ; XXX: Resolve script bank
	events_end

EastFishmarket_32_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $07, $00
	event_04  4,  3,  0, $531a ; XXX: Resolve script bank
	events_end

EastFishmarket_33_MapEvents::
	warp_event ABSOLUTE,  8, $0b, $08, $00
	event_07  2,  3, $0b
	events_end

GeothermalCity_34_MapEvents::
	warp_event ABSOLUTE,  8, $14, $01, $00
	event_07  6,  3, $0e
	events_end

GeothermalCity_35_MapEvents::
	warp_event ABSOLUTE,  8, $14, $00, $00
	event_07  3,  3, $0d
	events_end

GeothermalCity_36_MapEvents::
	warp_event ABSOLUTE,  8, $14, $02, $00
	event_07  4,  3, $10
	events_end

GeothermalCity_37_MapEvents::
	warp_event ABSOLUTE,  8, $14, $06, $00
	event_07  9,  6, $0f
	events_end

GeothermalShop_MapEvents::
	warp_event ABSOLUTE,  8, $14, $04, $00
	event_04  4,  3,  0, $4011 ; XXX: Resolve script bank
	events_end

GeothermalHealingCenter_MapEvents::
	warp_event ABSOLUTE,  8, $14, $07, $00
	event_04  4,  4,  0, $4042 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4050 ; XXX: Resolve script bank
	events_end

SacredtreeVillage_3a_MapEvents::
	warp_event ABSOLUTE,  8, $25, $05, $00
	event_07  9,  3, $03
	events_end

SacredtreeVillage_3b_MapEvents::
	warp_event ABSOLUTE,  8, $25, $04, $00
	event_07  8,  3, $04
	events_end

SacredtreeVillage_3c_MapEvents::
	warp_event ABSOLUTE,  8, $25, $0a, $00
	event_07  1,  3, $05
	events_end

SacredtreeVillage_3d_MapEvents::
	warp_event ABSOLUTE,  8, $25, $08, $00
	event_07  2,  3, $06
	events_end

SacredtreeVillage_3e_MapEvents::
	warp_event ABSOLUTE,  8, $25, $09, $00
	event_07  4,  3, $07
	events_end

SacredtreeVillage_3f_MapEvents::
	warp_event ABSOLUTE,  8, $25, $06, $00
	event_07  2,  3, $0c
	events_end

SacredtreeHealingCenter_40_MapEvents::
	warp_event ABSOLUTE,  8, $25, $03, $00
	event_04  4,  4,  0, $4046 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4054 ; XXX: Resolve script bank
	events_end

SacredtreeShop_41_MapEvents::
	warp_event ABSOLUTE,  8, $25, $07, $00
	event_04  4,  3,  0, $4015 ; XXX: Resolve script bank
	events_end

G4_42_MapEvents::
	warp_event ABSOLUTE,  9, $0b, $00, $00
	warp_event  5,  3, $43, $00, $00
	warp_event  6,  3, $43, $00, $00
	events_end

G4_43_MapEvents::
	warp_event ABSOLUTE,  9, $42, $01, $00
	events_end

G4_44_MapEvents::
	warp_event ABSOLUTE,  0, $45, $09, $00
	warp_event ABSOLUTE,  9, $10, $00, $00
	warp_event 18,  4, $06, $00, $00
	events_end

EastFishmarket_45_MapEvents::
	warp_event ABSOLUTE,  0, $64, $00, $00
	warp_event 12,  4, $47, $00, $00
	warp_event  8,  4, $4b, $00, $00
	warp_event  2,  4, $46, $00, $00
	warp_event  2, 12, $49, $00, $00
	warp_event  3, 19, $4a, $00, $00
	warp_event 20,  4, $48, $00, $00
	warp_event 20, 10, $4c, $00, $00
	warp_event 18, 19, $4d, $00, $00
	warp_event ABSOLUTE, 23, $44, $00, $00
	events_end

EastFishmarket_46_MapEvents::
	warp_event ABSOLUTE,  8, $45, $03, $00
	event_07  9,  3, $02
	events_end

EastFishmarket_47_MapEvents::
	warp_event ABSOLUTE,  8, $45, $01, $00
	event_07  4,  3, $09
	events_end

EastFishmarket_48_MapEvents::
	warp_event ABSOLUTE,  8, $45, $06, $00
	event_07  9,  6, $0a
	events_end

EastFishmarket_49_MapEvents::
	warp_event ABSOLUTE,  8, $45, $04, $00
	event_07  4,  3, $08
	events_end

G4_4A_MapEvents::
	warp_event ABSOLUTE,  8, $45, $05, $00
	event_07  8,  3, $01
	events_end

EastFishmarketHealingCenter_MapEvents::
	warp_event ABSOLUTE,  8, $45, $02, $00
	event_04  4,  4,  0, $40a2 ; XXX: Resolve script bank
	event_04  8,  4,  0, $40b0 ; XXX: Resolve script bank
	events_end

EastFishmarketShop_MapEvents::
	warp_event ABSOLUTE,  8, $45, $07, $00
	event_04  4,  3,  0, $4071 ; XXX: Resolve script bank
	events_end

EastFishmarketAntonCutscene_MapEvents::
	warp_event ABSOLUTE,  8, $45, $08, $00
	event_07  2,  3, $0b
	events_end

EastFishmarket_4e_MapEvents::
	warp_event ABSOLUTE,  9, $45, $0a, $00
	events_end

LifeValleyRescue_MapEvents::
	warp_event ABSOLUTE, 23, $15, $02, $00
	events_end

G4_50_MapEvents::
	script_event ABSOLUTE,  9,  0, $40eb ; XXX: Resolve script bank
	warp_event  3,  4, $51, $00, $00
	event_07 14,  4, $13
	event_07  3,  5, $14
	events_end

TravelingShip_51_MapEvents::
	warp_event  3,  5, $50, $01, $00
	warp_event 16,  5, $52, $00, $00
	event_07 15,  4, $15
	event_07  3,  4, $16
	events_end

G4_52_MapEvents::
	warp_event 16,  5, $51, $01, $00
	event_07  4,  4, $17
	event_07 12,  4, $18
	events_end

G4_53_MapEvents::
G4_54_MapEvents::
	events_end

SacredtreeVillage_55_MapEvents::
	warp_event 15, ABSOLUTE, $25, $01, $00
	script_event 14,  5, 25, $48aa ; XXX: Resolve script bank
	script_event 14,  6, 25, $48b1 ; XXX: Resolve script bank
	event_04  4,  5,  0, $486f ; XXX: Resolve script bank
	event_04  4,  6,  0, $486f ; XXX: Resolve script bank
	event_04  2,  7,  0, $487b ; XXX: Resolve script bank
	event_04  3,  7,  0, $486f ; XXX: Resolve script bank
	event_04  2,  8,  0, $486f ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

SacredtreeVillage_56_MapEvents::
	script_event ABSOLUTE,  8,  0, $40fa ; XXX: Resolve script bank
	event_07  9,  3, $03
	events_end

SacredtreeVillage_57_MapEvents::
	script_event ABSOLUTE,  8,  0, $4108 ; XXX: Resolve script bank
	event_07  8,  3, $04
	events_end

SacredtreeVillage_58_MapEvents::
	script_event ABSOLUTE,  8,  0, $4116 ; XXX: Resolve script bank
	event_07  1,  3, $05
	events_end

SacredtreeVillage_59_MapEvents::
	script_event ABSOLUTE,  8,  0, $4124 ; XXX: Resolve script bank
	event_07  2,  3, $06
	events_end

G4_5A_MapEvents::
	script_event ABSOLUTE,  8,  0, $4132 ; XXX: Resolve script bank
	event_07  4,  3, $07
	events_end

SacredtreeVillagePast_MapEvents::
	script_event ABSOLUTE,  8,  0, $40d0 ; XXX: Resolve script bank
	event_07  2,  3, $0c
	events_end

SacredtreeHealingCenter_5c_MapEvents::
	script_event ABSOLUTE,  8,  0, $4140 ; XXX: Resolve script bank
	event_04  4,  4,  0, $4042 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4050 ; XXX: Resolve script bank
	events_end

SacredtreeShop_5d_MapEvents::
	script_event ABSOLUTE,  8,  0, $414e ; XXX: Resolve script bank
	event_04  4,  3,  0, $4011 ; XXX: Resolve script bank
	events_end

G4_5E_MapEvents::
	script_event ABSOLUTE,  0,  0, $40be ; XXX: Resolve script bank
	warp_event  0, ABSOLUTE, $5f, $00, $00
	event_04  8, 14,  0, $415c ; XXX: Resolve script bank
	event_04  8, 15,  0, $415c ; XXX: Resolve script bank
	event_04  6, 14,  0, $4183 ; XXX: Resolve script bank
	event_04  6, 15,  0, $4183 ; XXX: Resolve script bank
	event_04  7, 27,  0, $415c ; XXX: Resolve script bank
	event_04  7, 28,  0, $415c ; XXX: Resolve script bank
	event_04  5, 27,  0, $4183 ; XXX: Resolve script bank
	event_04  5, 28,  0, $4183 ; XXX: Resolve script bank
	signpost_event  5,  4, $05
	events_end

G4_5F_MapEvents::
	warp_event 15, ABSOLUTE, $5e, $01, $00
	warp_event  4,  4, $60, $00, $00
	signpost_event  6,  6, $06
	events_end

G4_60_MapEvents::
	warp_event ABSOLUTE, 23, $5f, $01, $00
	warp_event  2,  7, $60, $03, $00
	warp_event 21,  3, $61, $00, $00
	warp_event  3, 11, $60, $01, $00
	events_end

G4_61_MapEvents::
	warp_event  2,  2, $60, $02, $00
	warp_event 16, 21, $62, $02, $00
	events_end

G4_62_MapEvents::
	warp_event  6,  9, $63, $00, $00
	warp_event  7, 22, $62, $03, $00
	warp_event 14, 22, $61, $01, $00
	warp_event 12, 12, $62, $01, $00
	events_end

RadarStation_MapEvents::
	warp_event  6, 22, $62, $00, $00
	events_end

G4_64_MapEvents::
	warp_event ABSOLUTE,  9, $45, $00, $00
	warp_event  5,  3, $65, $00, $00
	warp_event  6,  3, $65, $00, $00
	events_end

Airport_g465_MapEvents::
	warp_event ABSOLUTE,  9, $64, $01, $00
	events_end
