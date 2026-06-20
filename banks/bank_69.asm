Group06_Maps::
	dw G6_00_Header
	dw G6_01_Header
	dw G6_02_Header
	dw G6_03_Header
	dw G6_04_Header
	dw G6_05_Header
	dw G6_06_Header
	dw G6_07_Header
	dw G6_08_Header
	dw G6_09_Header
	dw G6_0A_Header
	dw G6_0B_Header
	dw G6_0C_Header
	dw G6_0D_Header
	dw G6_0E_Header
	dw G6_0F_Header
	dw G6_10_Header
	dw G6_11_Header
	dw G6_12_Header
	dw G6_13_Header
	dw G6_14_Header
	dw G6_15_Header
	dw G6_16_Header
	dw G6_17_Header
	dw G6_18_Header
	dw G6_19_Header
	dw G6_1A_Header
	dw G6_1B_Header
	dw G6_1C_Header
	dw G6_1D_Header
	dw G6_1E_Header
	dw G6_1F_Header
	dw G6_20_Header
	dw G6_21_Header
	dw G6_22_Header
	dw G6_23_Header
	dw G6_24_Header
	dw G6_25_Header
	dw G6_26_Header
	dw G6_27_Header
	dw G6_28_Header
	dw G6_29_Header
	dw G6_2A_Header
	dw G6_2B_Header
	dw G6_2C_Header

G6_00_Header::
	map  G6_01
	warp 0, 0, $8018
	warp 5, 10, $9058
	end_map

	map  G6_02
	warp 10, 0, $4088
	warp 10, 0, $4088, G6_02_ObjectEvents2
	end_map

	map  G6_03
	warp 0, 0, $3028
	warp 5, 5, $9058
	end_map

	map  G6_04
	warp 0, 5, $9018
	warp 2, 0, $5068
	end_map

	map  G6_05
	warp 0, 5, $7038
	warp 5, 0, $2038
	end_map

	map  G6_06
	warp 1, 0, $2068
	warp 3, 5, $5058
	end_map

	map  G6_07
	warp 1, 1, $9048
	warp 1, 1, $6048, G6_07_ObjectEvents2
	warp 1, 1, $9048, G6_07_ObjectEvents3
	warp 1, 1, $20b0, G6_07_ObjectEvents4
	end_map

	map  G6_08
	warp 0, 10, $8038
	warp 5, 0, $5098
	end_map

	map  G6_09
	warp 2, 0, $3068
	warp 5, 10, $6098
	end_map

	map  G6_0A
	warp 5, 10, $9078
	warp 0, 0, $1048
	end_map

	map  G6_0B
	warp 0, 0, $3028
	end_map

	map  G6_0C
	warp 5, 5, $7068
	warp 13, 0, $5058
	warp 13, 5, $8048
	warp 13, 7, $7088
	warp 13, 10, $7048
	warp 8, 10, $6068
	warp 3, 10, $6078
	warp 0, 10, $7058
	warp 0, 6, $8048
	warp 0, 3, $6018
	warp 0, 0, $8048
	warp 7, 0, $6038, G6_0C_ObjectEvents2
	warp 7, 0, $6038
	end_map

	map  G6_0D
	warp 1, 0, $7098
	warp 1, 0, $5048, G6_0D_ObjectEvents2
	warp 1, 0, $7098
	warp 1, 0, $b0b0, G6_0D_ObjectEvents3
	end_map

	map  G6_0E
	warp 0, 0, $6018
	warp 7, 0, $2068
	end_map

	map  G6_0F
	warp 0, 0, $6018
	warp 0, 0, $4048
	warp 3, 0, $4048
	warp 5, 0, $4068
	warp 5, 0, $6088
	warp 0, 0, $8048
	warp 3, 0, $8048
	warp 5, 0, $8068
	end_map

	map  G6_10
	warp 1, 0, $6088
	warp 0, 0, $6048, G6_10_ObjectEvents2
	end_map

	map  G6_11
	warp 0, 0, $7068
	warp 0, 0, $7068, G6_11_ObjectEvents2
	end_map

	map  G6_12
	warp 0, 0, $7068
	warp 0, 0, $7068, G6_12_ObjectEvents2
	end_map

	map  G6_13
	warp 0, 0, $7068
	end_map

	map  G6_14
	warp 0, 0, $4068
	warp 0, 0, $4068, G6_14_ObjectEvents2
	end_map

	map  G6_15
	warp 0, 0, $4068
	warp 0, 0, $4068, G6_15_ObjectEvents2
	end_map

	map  G6_16
	warp 0, 0, $4068
	warp 0, 0, $4068, G6_16_ObjectEvents2
	end_map

	map  G6_17
	warp 0, 0, $5038
	warp 0, 0, $5038, G6_17_ObjectEvents2
	end_map

	map  G6_18
	warp 0, 0, $7048
	warp 0, 5, $8038
	warp 5, 5, $9058
	warp 3, 3, $7058
	warp 5, 0, $6058
	warp 5, 3, $5088
	end_map

	map  G6_19
	warp 0, 0, $8058
	end_map

	map  G6_1A
	warp 0, 0, $8058
	end_map

	map  G6_1B
	warp 0, 0, $8058
	warp 0, 0, $8058, G6_1B_ObjectEvents2
	end_map

	map  G6_1C
	warp 0, 0, $8058
	end_map

	map  G6_1D
	warp 0, 0, $8058
	end_map

	map  G6_1E
	warp 0, 0, $8018
	warp 13, 0, $4088
	end_map

	map  G6_1F
	warp 0, 0, $6018
	end_map

	map  G6_20
	warp 1, 0, $6048
	end_map

	map  G6_21
	warp 1, 0, $8058
	end_map

	map  G6_22
	warp 0, 0, $8038
	end_map

	map  G6_23
	warp 0, 0, $8038
	end_map

	map  G6_24
	warp 0, 0, $8038
	end_map

	map  G6_25
	warp 0, 0, $8038
	end_map

	map  G6_26
	warp 0, 0, $8038
	warp 0, 0, $b0b0, G6_26_ObjectEvents2
	end_map

	map  G6_27
	warp 0, 0, $8038
	end_map

	map  G6_28
	warp 0, 0, $8058
	end_map

	map  G6_29
	warp 0, 0, $8058
	end_map

	map  G6_2A
	warp 0, 0, $20b0
	end_map

	map  G6_2B
	warp 0, 0, $8058
	warp 0, 0, $4058, G6_2B_ObjectEvents2
	warp 0, 0, $8058, G6_2B_ObjectEvents3
	warp 0, 0, $8058, G6_2B_ObjectEvents2
	warp 0, 0, $5058, G6_2B_ObjectEvents4
	end_map

	map  G6_2C
	warp 0, 0, $b0b0
	end_map

G6_01_MapEvents:
	script_event 0, 7, $00, Script_06c_4708
	warp_event ABSOLUTE, 29, $0e, $01
	signpost_event 18, 27, $04
	events_end
G6_02_MapEvents:
	warp_event 29, 3, $01, $00
	events_end
G6_03_MapEvents:
	warp_event 2, 2, $04, $00
	script_event ABSOLUTE, 19, $00, Script_06c_4cb9
	events_end
G6_04_MapEvents:
	warp_event 1, 18, $03, $00
	warp_event 10, 4, $05, $00
	events_end
G6_05_MapEvents:
	warp_event 3, 16, $04, $01
	warp_event 13, 1, $06, $00
	events_end
G6_06_MapEvents:
	warp_event 8, 1, $05, $01
	script_event 11, 14, $00, Script_06c_5007
	events_end
G6_07_MapEvents:
	warp_event ABSOLUTE, 11, $06, $01
	events_end
G6_08_MapEvents:
	script_event 19, ABSOLUTE, $00, Script_06c_460e
	events_end
G6_09_MapEvents:
	script_event 19, ABSOLUTE, $00, Script_06c_4627
	events_end
G6_0A_MapEvents:
	script_event ABSOLUTE, 0, $00, Script_06c_4640
	events_end
G6_0B_MapEvents:
	events_end
G6_0C_MapEvents:
	warp_event 16, 15, $29, $00
	script_event 31, 3, $00, Script_06c_4c97
	warp_event 30, 16, $24, $00
	warp_event 35, ABSOLUTE, $0e, $00
	warp_event 30, 25, $27, $00
	warp_event 22, 24, $25, $00
	warp_event 13, 24, $23, $00
	warp_event 5, 25, $26, $00
	warp_event 4, 18, $22, $00
	warp_event 0, ABSOLUTE, $0d, $00
	warp_event 4, 6, $28, $00
	event_04 15, 4, $00, Script_06c_5068
	event_04 16, 4, $00, Script_06c_5068
	event_04 17, 4, $00, Script_06c_5068
	event_04 18, 4, $00, Script_06c_5068
	signpost_event 34, 19, $01
	signpost_event 30, 5, $02
	signpost_event 1, 10, $03
	signpost_event 27, 26, $05
	events_end
G6_0D_MapEvents:
	warp_event 11, ABSOLUTE, $0c, $09
	script_event 6, 3, $00, Script_06c_4f23
	events_end
G6_0E_MapEvents:
	warp_event 0, ABSOLUTE, $0c, $03
	warp_event ABSOLUTE, 0, $01, $01
	events_end
G6_0F_MapEvents:
	warp_event 0, ABSOLUTE, $10, $00
	warp_event 4, 2, $11, $00
	warp_event 10, 2, $12, $00
	script_event 16, 2, $00, Script_06c_4a4b
	warp_event 19, ABSOLUTE, $17, $00
	warp_event 4, 7, $14, $00
	warp_event 10, 7, $15, $00
	warp_event 16, 7, $16, $00
	events_end
G6_10_MapEvents:
	warp_event 11, ABSOLUTE, $0f, $00
	events_end
G6_11_MapEvents:
	warp_event 6, 7, $0f, $01
	events_end
G6_12_MapEvents:
	warp_event 6, 7, $0f, $02
	events_end
G6_13_MapEvents:
	warp_event 6, 7, $0f, $03
	events_end
G6_14_MapEvents:
	warp_event 6, 2, $0f, $05
	events_end
G6_15_MapEvents:
	warp_event 6, 2, $0f, $06
	events_end
G6_16_MapEvents:
	warp_event 6, 2, $0f, $07
	events_end
G6_17_MapEvents:
	warp_event 2, ABSOLUTE, $0f, $04
	events_end
G6_18_MapEvents:
	warp_event 4, 5, $19, $00
	warp_event 3, 16, $1a, $00
	script_event 15, 17, $00, Script_06c_4198
	warp_event 11, 11, $1c, $00
	warp_event 15, 4, $1d, $00
	script_event 19, ABSOLUTE, $00, Script_06c_4310
	events_end
G6_19_MapEvents:
	warp_event ABSOLUTE, 8, $18, $00
	event_07 7, 2, $06
	events_end
G6_1A_MapEvents:
	warp_event ABSOLUTE, 8, $18, $01
	event_07 2, 2, $07
	events_end
G6_1B_MapEvents:
	warp_event ABSOLUTE, 8, $18, $02
	event_07 9, 2, $08
	events_end
G6_1C_MapEvents:
	warp_event ABSOLUTE, 8, $18, $03
	event_04 3, 6, $00, Script_06c_46e0
	event_04 5, 4, $00, Script_06c_46d6
	event_04 8, 6, $00, Script_06c_46f8
	event_04 6, 4, $00, Script_06c_46ee
	events_end
G6_1D_MapEvents:
	warp_event ABSOLUTE, 8, $18, $04
	event_04 6, 4, $00, Script_06c_43b8
	event_04 8, 6, $00, Script_06c_43ae
	event_07 3, 2, $09
	events_end
G6_1E_MapEvents:
	warp_event 0, ABSOLUTE, $18, $05
	warp_event 35, ABSOLUTE, $1f, $00
	events_end
G6_1F_MapEvents:
	warp_event 0, ABSOLUTE, $1e, $01
	script_event ABSOLUTE, 11, $00, Script_06c_441a
	events_end
G6_20_MapEvents:
	script_event 5, 1, $00, Script_06c_4671
	events_end
G6_21_MapEvents:
	warp_event 11, ABSOLUTE, $08, $00
	event_07 10, 4, $0a
	events_end
G6_22_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $08
	event_07 9, 3, $01
	events_end
G6_23_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $06
	events_end
G6_24_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $02
	event_07 4, 3, $02
	events_end
G6_25_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $05
	event_07 8, 3, $03
	events_end
G6_26_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $07
	event_07 2, 3, $04
	events_end
G6_27_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $04
	event_07 1, 3, $05
	events_end
G6_28_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $0a
	event_04 4, 3, $00, Script_06c_4010
	events_end
G6_29_MapEvents:
	warp_event ABSOLUTE, 8, $0c, $00
	event_04 4, 4, $00, Script_06c_4041
	event_04 8, 4, $00, Script_06c_404f
	events_end
G6_2A_MapEvents:
G6_2C_MapEvents:
	events_end
G6_2B_MapEvents:
	script_event 5, 2, $00, Script_06c_4eba
	script_event ABSOLUTE, 9, $00, Script_06c_4ed4
	events_end


Group07_Maps::
	dw G7_00_Header
	dw G7_01_Header
	dw G7_02_Header
	dw G7_03_Header
	dw G7_04_Header
	dw G7_05_Header
	dw G7_06_Header
	dw G7_07_Header
	dw G7_08_Header
	dw G7_09_Header
	dw G7_0A_Header

G7_00_Header::
	map  G7_01
	warp 1, 0, $8058
	end_map

	map  G7_02
	warp 4, 5, $20b0
	end_map

	map  G7_03
	warp 0, 0, $20b0
	warp 5, 0, $20b0, G7_03_ObjectEvents2
	end_map

	map  G7_04
	warp 3, 0, $20b0
	end_map

	map  G7_05
	warp 2, 0, $20b0
	end_map

	map  G7_06
	warp 0, 1, $20b0
	end_map

	map  G7_07
	warp 0, 0, $20b0
	end_map

	map  G7_08
	warp 0, 0, $20b0
	end_map

	map  G7_09
	warp 0, 0, $20b0
	end_map

	map  G7_0A
	warp 0, 5, $20c0
	end_map

G7_01_MapEvents:
G7_02_MapEvents:
G7_03_MapEvents:
G7_04_MapEvents:
G7_05_MapEvents:
G7_06_MapEvents:
G7_07_MapEvents:
G7_08_MapEvents:
G7_09_MapEvents:
G7_0A_MapEvents:
	events_end
G7_0A_MapAttributes:
	map_attr_data \
		6, 10, \
		Layout_069_496e, Blocks_069_4aa3, Metatiles_069_49ab, AttrMap_069_4b6b, \
		Palettes_069_4bc3, \
		0, Tileset_006_410f, \
		Collision_069_4c0b
Layout_069_496e::
	dr $1a496e, $1a49ab
Metatiles_069_49ab::
	dr $1a49ab, $1a4aa3
Blocks_069_4aa3::
	dr $1a4aa3, $1a4b6b
AttrMap_069_4b6b::
INCBIN "gfx/attrmaps/attrmap_069_4b6b.bin"
Palettes_069_4bc3::
	RGB 31, 31, 31
	RGB 31, 28, 4
	RGB 9, 4, 20
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
Collision_069_4c0b::
	dr $1a4c0b, $1a4c50



