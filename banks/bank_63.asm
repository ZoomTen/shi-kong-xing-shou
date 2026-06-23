Group05_Maps::
	dw G5_00_Header
	dw G5_01_Header
	dw G5_02_Header
	dw G5_03_Header
	dw G5_04_Header
	dw G5_05_Header
	dw G5_06_Header
	dw G5_07_Header
	dw G5_08_Header
	dw G5_09_Header
	dw G5_0A_Header
	dw G5_0B_Header
	dw G5_0C_Header
	dw G5_0D_Header
	dw G5_0E_Header
	dw G5_0F_Header
	dw G5_10_Header
	dw G5_11_Header
	dw G5_12_Header
	dw G5_13_Header
	dw G5_14_Header
	dw G5_15_Header
	dw G5_16_Header
	dw G5_17_Header
	dw G5_18_Header
	dw G5_19_Header
	dw G5_1A_Header
	dw G5_1B_Header
	dw G5_1C_Header
	dw G5_1D_Header
	dw G5_1E_Header
	dw G5_1F_Header
	dw G5_20_Header
	dw G5_21_Header
	dw G5_22_Header
	dw G5_23_Header
	dw G5_24_Header
	dw G5_25_Header
	dw G5_26_Header
	dw G5_27_Header

G5_00_Header::
	map  G5_01
	warp 13, 10, $9058
	warp 0, 0, $3038
	end_map

	map  G5_02
	warp 5, 5, $6058
	warp 6, 8, $b0b0, G5_02_ObjectEvents2
	warp 5, 5, $6058, G5_02_ObjectEvents3
	end_map

	map  G5_03
	warp 0, 5, $6018
	warp 0, 0, $1038
	warp 5, 3, $4068
	warp 5, 0, $2078
	end_map

	map  G5_04
	warp 0, 0, $1028
	warp 2, 5, $6058
	warp 0, 5, $6018
	warp 2, 5, $7028
	warp 5, 3, $6078
	warp 5, 5, $6038
	end_map

	map  G5_05
	warp 3, 5, $7058
	warp 5, 5, $7088
	warp 2, 3, $6058
	warp 0, 3, $6018
	warp 0, 0, $1058
	warp 0, 0, $1028
	end_map

	map  G5_06
	warp 0, 0, $1018
	warp 1, 0, $1068
	warp 0, 0, $6018
	warp 0, 3, $5028
	warp 0, 5, $8038
	warp 4, 1, $7058
	warp 3, 1, $4048
	warp 3, 2, $7048
	warp 5, 3, $6088
	warp 5, 3, $6048
	warp 3, 5, $7058
	end_map

	map  G5_07
	warp 2, 0, $2058
	warp 5, 0, $6048
	warp 8, 1, $5058
	warp 12, 0, $6048
	warp 13, 0, $3088
	warp 13, 2, $4088
	warp 13, 4, $7048
	warp 13, 7, $7068
	warp 9, 7, $7058
	warp 6, 7, $7058
	warp 3, 7, $9048
	warp 3, 4, $7068
	warp 0, 7, $7038
	warp 0, 3, $6018
	warp 0, 0, $5038
	end_map

	map  G5_08
	warp 0, 5, $9038
	warp 7, 5, $4078
	end_map

	map  G5_09
	warp 1, 7, $9058
	warp 1, 0, $3088
	warp 0, 0, $3038
	end_map

	map  G5_0A
	warp 0, 7, $9028
	warp 3, 3, $5048
	end_map

	map  G5_0B
	warp 5, 7, $8028
	warp 5, 0, $5048
	end_map

	map  G5_0C
	warp 7, 5, $9088
	warp 0, 0, $2028
	end_map

	map  G5_0D
	warp 0, 7, $9048
	warp 0, 0, $20b0
	warp 0, 7, $9048, G5_0D_ObjectEvents2
	warp 0, 0, $3058
	end_map

	map  G5_0E
	warp 0, 0, $9058
	warp 0, 0, $4058
	warp 0, 0, $5068, G5_0E_ObjectEvents2
	end_map

	map  G5_0F
	warp 0, 0, $8058
	end_map

	map  G5_10
	warp 0, 0, $8058
	end_map

	map  G5_11
	warp 0, 0, $8058
	warp 0, 0, $3018
	end_map

	map  G5_12
	warp 5, 0, $8088
	warp 5, 0, $5048
	warp 2, 0, $5058
	warp 0, 0, $5048
	end_map

	map  G5_13
	warp 0, 0, $8038
	end_map

	map  G5_14
	warp 0, 0, $8058
	end_map

	map  G5_15
	warp 0, 0, $8078
	warp 0, 0, $5068, G5_15_ObjectEvents2
	warp 0, 0, $8078, G5_15_ObjectEvents3
	end_map

	map  G5_16
	warp 0, 0, $6038
	warp 11, 0, $6068
	end_map

	map  G5_17
	warp 13, 0, $4078
	warp 0, 0, $5028
	end_map

	map  G5_18
	warp 0, 0, $7068
	end_map

	map  G5_19
	warp 0, 1, $9048
	warp 0, 0, $7058
	end_map

	map  G5_1A
	warp 0, 0, $9058
	warp 0, 0, $8058, G5_1A_ObjectEvents2
	warp 0, 0, $b0b0, G5_1A_ObjectEvents2
	end_map

	map  G5_1B
	warp 0, 0, $5018
	warp 0, 0, $2058
	warp 7, 0, $4088
	end_map

	map  G5_1C
	warp 1, 0, $3088
	warp 1, 7, $7078
	end_map

	map  G5_1D
	warp 0, 0, $8038
	warp 0, 0, $6068
	warp 0, 0, $7058, G5_1D_ObjectEvents2
	warp 0, 0, $5058, G5_1D_ObjectEvents3
	end_map

	map  G5_1E
	warp 0, 0, $8078
	end_map

	map  G5_1F
	warp 0, 0, $8038
	warp 0, 0, $8038, G5_1F_ObjectEvents2
	end_map

	map  G5_20
	warp 0, 0, $8078
	end_map

	map  G5_21
	warp 0, 0, $8058
	end_map

	map  G5_22
	warp 0, 0, $8058
	end_map

	map  G5_23
	warp 0, 5, $9048
	warp 0, 0, $6058
	end_map

	map  G5_24
	warp 0, 5, $8058
	warp 0, 0, $6028
	warp 0, 5, $5028
	end_map

	map  G5_25
	warp 1, 0, $4078
	end_map

	map  G5_26
	warp 1, 0, $4078
	end_map

	map  G5_27
	warp 0, 0, $2068
	warp 0, 0, $2068, G5_27_ObjectEvents2
	warp 1, 0, $6048, G5_27_ObjectEvents3
	warp 1, 0, $6048, G5_27_ObjectEvents4
	end_map

G5_01_MapEvents:
	warp_event ABSOLUTE, 29, $1c, $01
	script_event 3, 2, $00, Script_066_40bb
	signpost_event 31, 28, $07
	events_end
G5_02_MapEvents:
	warp_event 15, 15, $01, $01
	events_end
G5_03_MapEvents:
	script_event 1, 15, $00, Script_067_6e01
	warp_event 3, 0, $03, $02
	warp_event 16, 9, $03, $01
	warp_event 17, 1, $04, $00
	events_end
G5_04_MapEvents:
	warp_event 2, 0, $03, $03
	warp_event 9, 15, $04, $04
	warp_event 1, 15, $04, $05
	warp_event 6, 16, $05, $00
	warp_event 17, 11, $04, $01
	warp_event 13, 15, $04, $02
	events_end
G5_05_MapEvents:
	warp_event 11, 16, $04, $03
	warp_event 18, 16, $05, $04
	warp_event 9, 11, $06, $0a
	warp_event 1, 11, $05, $05
	warp_event 5, 0, $05, $01
	warp_event 2, 0, $05, $03
	events_end
G5_06_MapEvents:
	warp_event 1, 0, $06, $05
	warp_event 8, 0, $06, $08
	warp_event 1, 5, $06, $04
	warp_event 2, 10, $06, $09
	warp_event 3, 17, $06, $02
	warp_event 13, 8, $06, $00
	warp_event 10, 5, $06, $07
	warp_event 10, 10, $06, $06
	warp_event 18, 11, $06, $01
	warp_event 14, 11, $06, $03
	warp_event 11, 16, $05, $02
	events_end
G5_07_MapEvents:
	warp_event ABSOLUTE, 0, $23, $00
	script_event 14, 4, $00, Script_066_4292
	warp_event 21, 5, $21, $00
	warp_event 28, 4, $0f, $00
	event_04 34, 2, $00, Script_066_4c8f
	event_04 33, 3, $00, Script_066_4c8f
	warp_event 35, ABSOLUTE, $1b, $00
	warp_event 30, 13, $10, $00
	warp_event 32, 19, $1e, $00
	warp_event 23, 19, $20, $00
	warp_event 17, 19, $22, $00
	script_event ABSOLUTE, 23, $00, Script_066_448e
	warp_event 12, 13, $11, $00
	warp_event 3, 19, $1d, $00
	warp_event 0, ABSOLUTE, $1c, $00
	script_event 3, 3, $00, Script_066_4aef
	signpost_event 34, 6, $01
	signpost_event 7, 3, $02
	signpost_event 10, 21, $03
	signpost_event 1, 11, $04
	signpost_event 11, 15, $05
	events_end
G5_08_MapEvents:
	warp_event ABSOLUTE, 19, $0e, $01
	warp_event 21, 13, $09, $00
	events_end
G5_09_MapEvents:
	warp_event 7, 22, $08, $01
	warp_event 10, 2, $0a, $00
	warp_event 3, 2, $0c, $00
	events_end
G5_0A_MapEvents:
	warp_event 2, 22, $09, $01
	warp_event 10, 10, $0b, $00
	events_end
G5_0B_MapEvents:
	warp_event 12, 21, $0a, $01
	events_end
G5_0C_MapEvents:
	warp_event 22, 18, $09, $02
	script_event 2, 1, $00, Script_066_4bb1
	events_end
G5_0D_MapEvents:
	warp_event 4, 22, $0c, $01
	events_end
G5_0E_MapEvents:
	warp_event ABSOLUTE, 9, $07, $0e
	warp_event 5, 2, $08, $00
	event_07 8, 4, $01
	events_end
G5_0F_MapEvents:
	warp_event ABSOLUTE, 8, $07, $03
	event_04 4, 6, $00, Script_066_458e
	event_04 2, 4, $00, Script_066_4586
	event_07 10, 2, $02
	events_end
G5_10_MapEvents:
	warp_event ABSOLUTE, 8, $07, $06
	event_04 8, 4, $00, Script_066_454d
	event_04 6, 2, $00, Script_066_4545
	event_07 1, 2, $03
	events_end
G5_11_MapEvents:
	warp_event ABSOLUTE, 8, $07, $0b
	warp_event 1, 2, $12, $00
	event_04 4, 6, $00, Script_066_45c6
	event_07 6, 2, $04
	events_end
G5_12_MapEvents:
	warp_event 18, 7, $11, $01
	warp_event 14, 3, $13, $00
	warp_event 9, 3, $14, $00
	script_event 4, 3, $00, Script_066_4aca
	events_end
G5_13_MapEvents:
	warp_event ABSOLUTE, 8, $12, $01
	event_07 4, 3, $05
	events_end
G5_14_MapEvents:
	warp_event ABSOLUTE, 8, $12, $02
	event_07 2, 3, $06
	events_end
G5_15_MapEvents:
	warp_event ABSOLUTE, 8, $12, $03
	event_07 3, 3, $07
	events_end
G5_16_MapEvents:
	warp_event 28, 5, $17, $00
	event_04 16, 5, $00, Script_066_41d1
	event_04 20, 5, $00, Script_066_41df
	events_end
G5_17_MapEvents:
	warp_event 33, 3, $16, $01
	warp_event 2, 4, $18, $00
	events_end
G5_18_MapEvents:
	warp_event 7, 6, $17, $01
	events_end
G5_19_MapEvents:
	warp_event ABSOLUTE, 11, $1b, $01
	script_event 5, 5, $00, Script_066_47cd
	event_04 3, 8, $00, Script_066_4204
	events_end
G5_1A_MapEvents:
	warp_event ABSOLUTE, 8, $19, $01
	event_07 10, 2, $0f
	events_end
G5_1B_MapEvents:
	warp_event 0, ABSOLUTE, $07, $05
	warp_event ABSOLUTE, 0, $19, $00
	events_end
G5_1C_MapEvents:
	warp_event 11, ABSOLUTE, $07, $0d
	warp_event 9, 19, $01, $00
	signpost_event 7, 21, $06
	events_end
G5_1D_MapEvents:
	warp_event ABSOLUTE, 8, $07, $0c
	event_04 5, 3, $00, Script_066_42cf
	event_07 7, 3, $08
	events_end
G5_1E_MapEvents:
	warp_event ABSOLUTE, 8, $07, $07
	event_07 8, 3, $09
	events_end
G5_1F_MapEvents:
	warp_event ABSOLUTE, 8, $07, $01
	event_07 9, 3, $0a
	events_end
G5_20_MapEvents:
	warp_event ABSOLUTE, 8, $07, $08
	event_07 3, 3, $0b
	events_end
G5_21_MapEvents:
	warp_event ABSOLUTE, 8, $07, $02
	event_04 4, 4, $00, Script_066_4041
	event_04 8, 4, $00, Script_066_404f
	events_end
G5_22_MapEvents:
	warp_event ABSOLUTE, 8, $07, $09
	event_04 4, 3, $00, Script_066_4010
	events_end
G5_23_MapEvents:
	warp_event ABSOLUTE, 19, $07, $00
	warp_event 5, 4, $24, $00
	events_end
G5_24_MapEvents:
	warp_event ABSOLUTE, 18, $23, $01
	warp_event 1, 5, $25, $00
	warp_event 1, 6, $25, $00
	warp_event 1, 14, $26, $00
	warp_event 1, 15, $26, $00
	event_07 7, 2, $0c
	events_end
G5_25_MapEvents:
	warp_event 10, ABSOLUTE, $24, $01
	event_07 2, 3, $0e
	events_end
G5_26_MapEvents:
	warp_event 10, ABSOLUTE, $24, $02
	event_07 9, 3, $0d
	events_end
G5_27_MapEvents:
	warp_event ABSOLUTE, 0, $07, $0a
	events_end
