Group04_Maps::
	dw G4_00_Header
	dw G4_01_Header
	dw G4_02_Header
	dw G4_03_Header
	dw G4_04_Header
	dw G4_05_Header
	dw G4_06_Header
	dw G4_07_Header
	dw G4_08_Header
	dw G4_09_Header
	dw G4_0A_Header
	dw G4_0B_Header
	dw G4_0C_Header
	dw G4_0D_Header
	dw G4_0E_Header
	dw G4_0F_Header
	dw G4_10_Header
	dw G4_11_Header
	dw G4_12_Header
	dw G4_13_Header
	dw G4_14_Header
	dw G4_15_Header
	dw G4_16_Header
	dw G4_17_Header
	dw G4_18_Header
	dw G4_19_Header
	dw G4_1A_Header
	dw G4_1B_Header
	dw G4_1C_Header
	dw G4_1D_Header
	dw G4_1E_Header
	dw G4_1F_Header
	dw G4_20_Header
	dw G4_21_Header
	dw G4_22_Header
	dw G4_23_Header
	dw G4_24_Header
	dw G4_25_Header
	dw G4_26_Header
	dw G4_27_Header
	dw G4_28_Header
	dw G4_29_Header
	dw G4_2A_Header
	dw G4_2B_Header
	dw G4_2C_Header
	dw G4_2D_Header
	dw G4_2E_Header
	dw G4_2F_Header
	dw G4_30_Header
	dw G4_31_Header
	dw G4_32_Header
	dw G4_33_Header
	dw G4_34_Header
	dw G4_35_Header
	dw G4_36_Header
	dw G4_37_Header
	dw G4_38_Header
	dw G4_39_Header
	dw G4_3A_Header
	dw G4_3B_Header
	dw G4_3C_Header
	dw G4_3D_Header
	dw G4_3E_Header
	dw G4_3F_Header
	dw G4_40_Header
	dw G4_41_Header
	dw G4_42_Header
	dw G4_43_Header
	dw G4_44_Header
	dw G4_45_Header
	dw G4_46_Header
	dw G4_47_Header
	dw G4_48_Header
	dw G4_49_Header
	dw G4_4A_Header
	dw G4_4B_Header
	dw G4_4C_Header
	dw G4_4D_Header
	dw G4_4E_Header
	dw G4_4F_Header
	dw G4_50_Header
	dw G4_51_Header
	dw G4_52_Header
	dw G4_53_Header
	dw G4_54_Header
	dw G4_55_Header
	dw G4_56_Header
	dw G4_57_Header
	dw G4_58_Header
	dw G4_59_Header
	dw G4_5A_Header
	dw G4_5B_Header
	dw G4_5C_Header
	dw G4_5D_Header
	dw G4_5E_Header
	dw G4_5F_Header
	dw G4_60_Header
	dw G4_61_Header
	dw G4_62_Header
	dw G4_63_Header
	dw G4_64_Header
	dw G4_65_Header

; G4_01
G4_00_Header::
	map  G4_01
	warp 0, 7, $7038
	warp 0, 4, $5018
	warp 1, 0, $6078
	warp 2, 3, $6038
	warp 6, 3, $6048
	warp 7, 7, $3058
	end_map

; G4_02
	map  G4_02
	warp 2, 0, $6058
	warp 2, 3, $6058
	warp 0, 3, $7028
	warp 0, 7, $9028
	warp 7, 3, $5088
	warp 6, 3, $6048
	warp 7, 6, $5058
	warp 7, 7, $8078
	end_map

; G4_03
	map  G4_03
	warp 3, 0, $2058
	warp 0, 5, $9028
	warp 5, 3, $5078
	warp 5, 5, $7078
	end_map

; G4_04
	map  G4_04
	warp 0, 0, $2058
	warp 3, 0, $2058
	end_map

; G4_05
	map  G4_05
	warp 0, 0, $9058
	warp 0, 0, $9068, G4_05_ObjectEvents2
	end_map

; G4_06
	map  G4_06
	warp 2, 5, $9048
	warp 4, 2, $7068
	end_map

; G4_07
	map  G4_07
	warp 5, 3, $5048
	warp 5, 0, $3088
	end_map

; G4_08
	map  G4_08
	warp 5, 0, $3088
	warp 5, 3, $5048
	end_map

; G4_09
	map  G4_09
	warp 5, 3, $5048
	warp 1, 2, $7068
	end_map

; G4_0A
	map  G4_0A
	warp 0, 0, $9068
	warp 0, 0, $9068, G4_0A_ObjectEvents2
	end_map

; G4_0B
	map  G4_0B
	warp 5, 0, $2068
	warp 4, 1, $4048
	warp 2, 1, $4048
	warp 0, 0, $6028
	warp 0, 4, $6028
	warp 0, 7, $7038
	warp 7, 0, $6068
	warp 7, 3, $6068
	warp 7, 7, $7048
	warp 4, 7, $9058
	end_map

; G4_0C
	map  G4_0C
	warp 1, 0, $2048
	warp 1, 0, $9048
	warp 7, 0, $6048
	warp 1, 0, $2048, G4_0C_ObjectEvents2
	end_map

; G4_0D
	map  G4_0D
	warp 4, 0, $2058
	warp 1, 2, $5048
	warp 0, 5, $8038
	warp 5, 5, $6038
	end_map

; G4_0E
	map  G4_0E
	warp 0, 0, $2038
	warp 4, 5, $9058
	warp 0, 0, $2038, G4_0E_ObjectEvents2
	warp 4, 5, $9058, G4_0E_ObjectEvents2
	end_map

; G4_0F
	map  G4_0F
	warp 0, 0, $9058
	warp 0, 0, $4098
	warp 1, 0, $5038, G4_0F_ObjectEvents2
	end_map

; G4_10
	map  G4_10
	warp 0, 0, $2058
	warp 0, 5, $5018
	end_map

; G4_11
	map  G4_11
	warp 0, 0, $9058
	end_map

; G4_12
	map  G4_12
	warp 0, 0, $9058
	warp 1, 0, $4068, G4_12_ObjectEvents2
	end_map

; G4_13
	map  G4_13
	warp 0, 0, $9058
	end_map

; G4_14
	map  G4_14
	warp 5, 1, $5048
	warp 0, 0, $7038
	warp 0, 4, $6028
	warp 0, 5, $7018
	warp 1, 7, $7058
	warp 4, 7, $7048
	warp 5, 7, $7058
	warp 3, 4, $6058
	warp 5, 1, $5088
	end_map

; G4_15
	map  G4_15
	warp 5, 10, $9058
	warp 0, 0, $7018
	warp 1, 6, $7058
	end_map

; G4_16
	map  G4_16
	warp 10, 0, $4088
	warp 8, 2, $6058
	end_map

; G4_17
	map  G4_17
	warp 2, 0, $9068
	warp 0, 0, $5038
	end_map

; G4_18
	map  G4_18
	warp 0, 0, $6038
	warp 5, 0, $6068
	end_map

; G4_19
	map  G4_19
	warp 5, 0, $6068
	warp 1, 0, $8068, G4_19_ObjectEvents2
	end_map

; G4_1A
	map  G4_1A
	warp 0, 5, $9048
	warp 5, 5, $9068
	end_map

; G4_1B
	map  G4_1B
	warp 0, 0, $2028
	warp 5, 5, $7088
	end_map

; G4_1C
	map  G4_1C
	warp 0, 0, $7018
	warp 0, 5, $9038
	end_map

; G4_1D
	map  G4_1D
	warp 0, 0, $2068
	warp 0, 5, $7038, G4_1D_ObjectEvents2
	end_map

; G4_1E
	map  G4_1E
	warp 0, 0, $2028
	warp 0, 1, $9058
	warp 7, 1, $6088
	warp 0, 0, $2028, G4_1E_ObjectEvents2
	end_map

; G4_1F
	map  G4_1F
	warp 0, 0, $2068
	warp 0, 0, $9058
	end_map

; G4_20
	map  G4_20
	warp 3, 0, $2068
	warp 1, 1, $7048
	warp 0, 7, $3048
	warp 3, 4, $6058
	warp 7, 3, $6028
	warp 7, 7, $7098
	end_map

; G4_21
	map  G4_21
	warp 0, 7, $9058
	warp 0, 0, $8028
	warp 7, 0, $4078
	warp 0, 3, $6038
	end_map

; G4_22
	map  G4_22
	warp 0, 0, $3028
	warp 6, 7, $8048
	end_map

; G4_23
	map  G4_23
	warp 0, 2, $6068
	warp 0, 7, $9078
	warp 5, 7, $9048
	warp 4, 4, $5048
	end_map

; G4_24
	map  G4_24
	warp 0, 7, $9068
	warp 1, 0, $20b0, G4_24_ObjectEvents2
	warp 1, 0, $20b0, G4_24_ObjectEvents3
	warp 1, 0, $20b0, G4_24_ObjectEvents4
	warp 1, 0, $7068, G4_24_ObjectEvents5
	end_map

; G4_25
	map  G4_25
	warp 7, 0, $2048
	warp 0, 2, $5018
	warp 5, 7, $9048
	warp 4, 0, $6058
	warp 2, 0, $6048
	warp 0, 0, $6038
	warp 0, 5, $6028
	warp 0, 7, $8038
	warp 4, 7, $6048
	warp 7, 7, $7068
	warp 7, 1, $8068
	end_map

; G4_26
	map  G4_26
	warp 7, 0, $2048
	warp 0, 2, $5018
	warp 5, 7, $9048
	warp 4, 0, $6058
	warp 2, 0, $6048
	warp 0, 0, $6038
	warp 0, 5, $6028
	warp 0, 7, $8038
	warp 4, 7, $6048
	warp 7, 7, $7068
	warp 7, 1, $8068
	end_map

; G4_27
	map  G4_27
	warp 7, 0, $2048
	warp 0, 2, $5018
	warp 5, 7, $9048
	warp 4, 0, $6058
	warp 2, 0, $6048
	warp 0, 0, $6038
	warp 0, 5, $6028
	warp 0, 7, $8038
	warp 4, 7, $6048
	warp 7, 7, $7068
	warp 7, 1, $8068
	end_map

; G4_28
	map  G4_28
	warp 3, 0, $6088
	end_map

; G4_29
	map  G4_29
	warp 3, 0, $6088
	warp 0, 0, $5058
	end_map

; G4_2A
	map  G4_2A
	warp 0, 0, $2068
	warp 0, 19, $8018
	end_map

; G4_2B
	map  G4_2B
	warp 3, 1, $6088
	warp 0, 0, $6048
	end_map

; G4_2C
	map  G4_2C
	warp 0, 0, $8038
	end_map

; G4_2D
	map  G4_2D
	warp 0, 0, $8038
	end_map

; G4_2E
	map  G4_2E
	warp 0, 0, $8038
	end_map

; G4_2F
	map  G4_2F
	warp 0, 0, $8038
	end_map

; G4_30
	map  G4_30
	warp 0, 0, $8078
	end_map

; G4_31
	map  G4_31
	warp 0, 0, $8058
	end_map

; G4_32
	map  G4_32
	warp 0, 0, $8058
	end_map

; G4_33
	map  G4_33
	warp 0, 0, $8058
	end_map

; G4_34
	map  G4_34
	warp 0, 0, $8058
	end_map

; G4_35
	map  G4_35
	warp 0, 0, $8038
	end_map

; G4_36
	map  G4_36
	warp 0, 0, $8038
	warp 0, 0, $8038, G4_36_ObjectEvents2
	end_map

; G4_37
	map  G4_37
	warp 0, 0, $8038
	end_map

; G4_38
	map  G4_38
	warp 0, 0, $8058
	end_map

; G4_39
	map  G4_39
	warp 0, 0, $8058
	end_map

; G4_3A
	map  G4_3A
	warp 0, 0, $8078
	end_map

; G4_3B
	map  G4_3B
	warp 0, 0, $8038
	end_map

; G4_3C
	map  G4_3C
	warp 0, 0, $8038
	end_map

; G4_3D
	map  G4_3D
	warp 0, 0, $8078
	end_map

; G4_3E
	map  G4_3E
	warp 0, 0, $8038
	end_map

; G4_3F
	map  G4_3F
	warp 0, 0, $8038
	warp 1, 0, $5038, G4_3F_ObjectEvents2
	warp 0, 0, $5058
	end_map

; G4_40
	map  G4_40
	warp 0, 0, $8058
	end_map

; G4_41
	map  G4_41
	warp 0, 0, $8058
	end_map

; G4_42
	map  G4_42
	warp 0, 0, $9058
	warp 0, 0, $5058
	end_map

; G4_43
	map  G4_43
	warp 0, 0, $9048
	warp 1, 0, $6098
	end_map

; G4_44
	map  G4_44
	warp 1, 0, $2048
	warp 1, 0, $9048
	warp 7, 0, $6048
	warp 4, 0, $7048, G4_44_ObjectEvents2
	end_map

; G4_45
	map  G4_45
	warp 5, 0, $2068
	warp 4, 1, $4048
	warp 2, 1, $4048
	warp 0, 0, $6028
	warp 0, 4, $6028
	warp 0, 7, $7038
	warp 7, 0, $6068
	warp 7, 3, $6068
	warp 7, 7, $7048
	warp 4, 7, $9058
	warp 4, 4, $8048
	end_map

; G4_46
	map  G4_46
	warp 0, 0, $8038
	end_map

; G4_47
	map  G4_47
	warp 0, 0, $8038
	end_map

; G4_48
	map  G4_48
	warp 0, 0, $8038
	end_map

; G4_49
	map  G4_49
	warp 0, 0, $8038
	end_map

; G4_4A
	map  G4_4A
	warp 0, 0, $8078
	end_map

; G4_4B
	map  G4_4B
	warp 0, 0, $8058
	end_map

; G4_4C
	map  G4_4C
	warp 0, 0, $8058
	end_map

; G4_4D
	map  G4_4D
	warp 0, 0, $8058
	warp 1, 0, $7068, G4_4D_ObjectEvents2
	end_map

; G4_4E
	map  G4_4E
	warp 0, 0, $9058
	warp 0, 0, $20b0, G4_4E_ObjectEvents2
	warp 0, 0, $b0b0, G4_4E_ObjectEvents3
	end_map

; G4_4F
	map  G4_4F
	warp 0, 7, $9048
	warp 1, 0, $7038, G4_4F_ObjectEvents2
	warp 1, 0, $7038, G4_4F_ObjectEvents3
	end_map

; G4_50
	map  G4_50
	warp 2, 0, $9068
	warp 0, 0, $5038
	end_map

; G4_51
	map  G4_51
	warp 0, 0, $6038
	warp 5, 0, $6068
	end_map

; G4_52
	map  G4_52
	warp 5, 0, $6068
	warp 1, 0, $8068, G4_52_ObjectEvents2
	end_map

; G4_53
	map  G4_53
	warp 0, 0, $20b0
	warp 0, 0, $20b0, G4_53_ObjectEvents2
	end_map

; G4_54
	map  G4_54
	warp 0, 0, $6068
	end_map

; G4_55
	map  G4_55
	warp 3, 0, $6088
	warp 0, 0, $5058
	warp 0, 0, $7048
	end_map

; G4_56
	map  G4_56
	warp 0, 0, $8078
	end_map

; G4_57
	map  G4_57
	warp 0, 0, $8038
	end_map

; G4_58
	map  G4_58
	warp 0, 0, $8038
	end_map

; G4_59
	map  G4_59
	warp 0, 0, $8078
	end_map

; G4_5A
	map  G4_5A
	warp 0, 0, $8038
	end_map

; G4_5B
	map  G4_5B
	warp 0, 0, $8038
	warp 1, 0, $4068
	end_map

; G4_5C
	map  G4_5C
	warp 0, 0, $8058
	end_map

; G4_5D
	map  G4_5D
	warp 0, 0, $8058
	end_map

; G4_5E
	map  G4_5E
	warp 0, 0, $2068
	warp 0, 19, $8018
	end_map

; G4_5F
	map  G4_5F
	warp 3, 1, $6088
	warp 0, 0, $6048
	end_map

; G4_60
	map  G4_60
	warp 0, 7, $9058
	warp 0, 0, $8028
	warp 7, 0, $4078
	warp 0, 3, $6038
	end_map

; G4_61
	map  G4_61
	warp 0, 0, $3028
	warp 6, 7, $8048
	end_map

; G4_62
	map  G4_62
	warp 0, 2, $6068
	warp 0, 7, $9078
	warp 5, 7, $9048
	warp 4, 4, $5048
	end_map

; G4_63
	map  G4_63
	warp 0, 7, $9068
	end_map

; G4_64
	map  G4_64
	warp 0, 0, $9058
	warp 0, 0, $5058
	end_map

; G4_65
	map  G4_65
	warp 0, 0, $9048
	warp 1, 0, $6098
	end_map

G4_01_MapEvents:
	warp_event  3, 20, $0f, $01, $00
	warp_event  1, 12, $02, $02, $00
	warp_event  9,  5, $02, $00, $00
	warp_event  9, 11, $02, $01, $00
	warp_event 16, 11, $02, $05, $00
	warp_event 19, 16, $02, $06, $00
	events_end

G4_02_MapEvents:
	warp_event  9,  5, $01, $02, $00
	warp_event  9, 11, $01, $03, $00
	warp_event  2, 12, $01, $01, $00
	warp_event  2, 22, $03, $01, $00
	warp_event 22, 10, $03, $02, $00
	warp_event 16, 11, $01, $04, $00
	warp_event 19, 16, $01, $05, $00
	warp_event 21, 21, $03, $03, $00
	events_end

G4_03_MapEvents:
	warp_event 11,  1, $04, $01, $00
	warp_event  2, 18, $02, $03, $00
	warp_event 17, 10, $02, $04, $00
	warp_event 17, 16, $02, $07, $00
	events_end

G4_04_MapEvents:
	script_event ABSOLUTE,  0,  0, Script_055_5721 ; XXX: Resolve script bank
	warp_event 11,  1, $03, $00, $00
	events_end

G4_05_MapEvents:
	warp_event ABSOLUTE,  9, $04, $00, $00
	events_end

G4_06_MapEvents:
	script_event ABSOLUTE, 19,  0, $4004 ; XXX: Resolve script bank
	warp_event 14, 10, $07, $00, $00
	events_end

G4_07_MapEvents:
	warp_event 14, 10, $06, $01, $00
	warp_event 18,  2, $08, $00, $00
	events_end

G4_08_MapEvents:
	warp_event 18,  2, $07, $01, $00
	warp_event 14, 10, $09, $00, $00
	events_end

G4_09_MapEvents:
	warp_event 14, 10, $08, $01, $00
	script_event  8, 10,  0, $434b ; XXX: Resolve script bank
	events_end

G4_0A_MapEvents:
	warp_event  6,  8, $09, $01, $00
	events_end

G4_0B_MapEvents:
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

G4_0C_MapEvents:
	warp_event ABSOLUTE,  0, $0b, $09, $00
	script_event 18,  4,  0, $5468 ; XXX: Resolve script bank
	events_end

G4_0D_MapEvents:
	script_event ABSOLUTE,  0,  0, $5658 ; XXX: Resolve script bank
	warp_event  6,  7, $11, $00, $00
	warp_event  3, 16, $12, $00, $00
	warp_event 13, 14, $13, $00, $00
	signpost_event 12,  3, $07
	events_end

G4_0E_MapEvents:
	warp_event ABSOLUTE,  0, $0f, $00, $00
	warp_event ABSOLUTE, 19, $0d, $00, $00
	signpost_event  4,  4, $08
	events_end

G4_0F_MapEvents:
	warp_event ABSOLUTE,  9, $0e, $00, $00
	warp_event  9,  2, $01, $00, $00
	events_end

G4_10_MapEvents:
	warp_event ABSOLUTE,  0, $44, $01, $00
	script_event  0, 13,  0, $405c ; XXX: Resolve script bank
	script_event  0, 14,  0, $405c ; XXX: Resolve script bank
	events_end

G4_11_MapEvents:
	warp_event ABSOLUTE,  8, $0d, $01, $00
	event_07  7,  2, $11
	events_end

G4_12_MapEvents:
	warp_event ABSOLUTE,  8, $0d, $02, $00
	event_07  2,  2, $12
	events_end

G4_13_MapEvents:
	warp_event ABSOLUTE,  8, $0d, $03, $00
	event_04  4,  4,  0, $5862 ; XXX: Resolve script bank
	event_04  7,  4,  0, $5890 ; XXX: Resolve script bank
	events_end

G4_14_MapEvents:
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

G4_15_MapEvents:
	script_event 14, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event 15, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event 16, 29,  0, $4a09 ; XXX: Resolve script bank
	script_event  0,  6,  0, $470f ; XXX: Resolve script bank
	warp_event  7, 17, $4f, $00, $00
	signpost_event 13, 28, $09
	events_end

G4_16_MapEvents:
	warp_event 29,  3, $15, $01, $00
	events_end

G4_17_MapEvents:
	script_event ABSOLUTE,  9,  0, $40eb ; XXX: Resolve script bank
	warp_event  3,  4, $18, $00, $00
	event_07 14,  4, $13
	event_07  3,  5, $14
	events_end

G4_18_MapEvents:
	warp_event  3,  5, $17, $01, $00
	warp_event 16,  5, $19, $00, $00
	event_07 15,  4, $15
	event_07  3,  4, $16
	events_end

G4_19_MapEvents:
	warp_event 16,  5, $18, $01, $00
	event_07  4,  4, $17
	event_07 12,  4, $18
	events_end

G4_1A_MapEvents:
	warp_event  3, 19, $29, $01, $00
	warp_event  4, 19, $29, $01, $00
	warp_event  5, 19, $29, $01, $00
	warp_event 15, 19, $1b, $00, $00
	warp_event 16, 19, $1b, $00, $00
	events_end

G4_1B_MapEvents:
	warp_event ABSOLUTE,  0, $1a, $01, $00
	warp_event 19, ABSOLUTE, $1c, $00, $00
	events_end

G4_1C_MapEvents:
	warp_event  0, ABSOLUTE, $1b, $01, $00
	warp_event ABSOLUTE, 19, $1d, $00, $00
	events_end

G4_1D_MapEvents:
	warp_event ABSOLUTE,  0, $1c, $01, $00
	events_end

G4_1E_MapEvents:
	warp_event ABSOLUTE,  0, $15, $00, $00
	script_event ABSOLUTE, 11,  0, $40e4 ; XXX: Resolve script bank
	warp_event 23, ABSOLUTE, $14, $03, $00
	signpost_event  1,  3, $0a
	signpost_event  4, 10, $0b
	events_end

G4_1F_MapEvents:
	warp_event ABSOLUTE,  0, $14, $05, $00
	script_event ABSOLUTE,  9,  0, $40ed ; XXX: Resolve script bank
	events_end

G4_20_MapEvents:
	warp_event ABSOLUTE,  0, $1f, $01, $00
	events_end

G4_21_MapEvents:
	warp_event ABSOLUTE, 23, $2b, $01, $00
	warp_event  2,  7, $21, $03, $00
	warp_event 21,  3, $22, $00, $00
	warp_event  3, 11, $21, $01, $00
	events_end

G4_22_MapEvents:
	warp_event  2,  2, $21, $02, $00
	warp_event 16, 21, $23, $02, $00
	events_end

G4_23_MapEvents:
	warp_event  6,  9, $24, $00, $00
	warp_event  7, 22, $23, $03, $00
	warp_event 14, 22, $22, $01, $00
	warp_event 12, 12, $23, $01, $00
	events_end

G4_24_MapEvents:
	warp_event  6, 22, $23, $00, $00
	events_end

G4_25_MapEvents:
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

G4_26_MapEvents:
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

G4_27_MapEvents:
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

G4_28_MapEvents:
	script_event 15, ABSOLUTE,  0, $44bf ; XXX: Resolve script bank
	event_04  4,  5,  0, $448c ; XXX: Resolve script bank
	event_04  4,  6,  0, $448c ; XXX: Resolve script bank
	event_04  2,  7,  0, $4492 ; XXX: Resolve script bank
	event_04  3,  7,  0, $448c ; XXX: Resolve script bank
	event_04  2,  8,  0, $448c ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

G4_29_MapEvents:
	warp_event 15, ABSOLUTE, $25, $01, $00
	event_04  5,  4,  0, $44e4 ; XXX: Resolve script bank
	event_04  4,  5,  0, $481f ; XXX: Resolve script bank
	event_04  4,  6,  0, $481f ; XXX: Resolve script bank
	event_04  2,  7,  0, $482c ; XXX: Resolve script bank
	event_04  3,  7,  0, $481f ; XXX: Resolve script bank
	event_04  2,  8,  0, $481f ; XXX: Resolve script bank
	signpost_event 14,  5, $04
	events_end

G4_2A_MapEvents:
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

G4_2B_MapEvents:
	warp_event 15, ABSOLUTE, $2a, $01, $00
	warp_event  4,  4, $21, $00, $00
	signpost_event  6,  6, $06
	events_end

G4_2C_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $03, $00
	event_07  9,  3, $02
	events_end

G4_2D_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $01, $00
	event_07  4,  3, $09
	events_end

G4_2E_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $06, $00
	event_07  9,  6, $0a
	events_end

G4_2F_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $04, $00
	event_07  4,  3, $08
	events_end

G4_30_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $05, $00
	event_07  8,  3, $01
	events_end

G4_31_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $02, $00
	event_04  4,  4,  0, $534b ; XXX: Resolve script bank
	event_04  8,  4,  0, $5359 ; XXX: Resolve script bank
	events_end

G4_32_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $07, $00
	event_04  4,  3,  0, $531a ; XXX: Resolve script bank
	events_end

G4_33_MapEvents:
	warp_event ABSOLUTE,  8, $0b, $08, $00
	event_07  2,  3, $0b
	events_end

G4_34_MapEvents:
	warp_event ABSOLUTE,  8, $14, $01, $00
	event_07  6,  3, $0e
	events_end

G4_35_MapEvents:
	warp_event ABSOLUTE,  8, $14, $00, $00
	event_07  3,  3, $0d
	events_end

G4_36_MapEvents:
	warp_event ABSOLUTE,  8, $14, $02, $00
	event_07  4,  3, $10
	events_end

G4_37_MapEvents:
	warp_event ABSOLUTE,  8, $14, $06, $00
	event_07  9,  6, $0f
	events_end

G4_38_MapEvents:
	warp_event ABSOLUTE,  8, $14, $04, $00
	event_04  4,  3,  0, $4011 ; XXX: Resolve script bank
	events_end

G4_39_MapEvents:
	warp_event ABSOLUTE,  8, $14, $07, $00
	event_04  4,  4,  0, $4042 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4050 ; XXX: Resolve script bank
	events_end

G4_3A_MapEvents:
	warp_event ABSOLUTE,  8, $25, $05, $00
	event_07  9,  3, $03
	events_end

G4_3B_MapEvents:
	warp_event ABSOLUTE,  8, $25, $04, $00
	event_07  8,  3, $04
	events_end

G4_3C_MapEvents:
	warp_event ABSOLUTE,  8, $25, $0a, $00
	event_07  1,  3, $05
	events_end

G4_3D_MapEvents:
	warp_event ABSOLUTE,  8, $25, $08, $00
	event_07  2,  3, $06
	events_end

G4_3E_MapEvents:
	warp_event ABSOLUTE,  8, $25, $09, $00
	event_07  4,  3, $07
	events_end

G4_3F_MapEvents:
	warp_event ABSOLUTE,  8, $25, $06, $00
	event_07  2,  3, $0c
	events_end

G4_40_MapEvents:
	warp_event ABSOLUTE,  8, $25, $03, $00
	event_04  4,  4,  0, $4046 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4054 ; XXX: Resolve script bank
	events_end

G4_41_MapEvents:
	warp_event ABSOLUTE,  8, $25, $07, $00
	event_04  4,  3,  0, $4015 ; XXX: Resolve script bank
	events_end

G4_42_MapEvents:
	warp_event ABSOLUTE,  9, $0b, $00, $00
	warp_event  5,  3, $43, $00, $00
	warp_event  6,  3, $43, $00, $00
	events_end

G4_43_MapEvents:
	warp_event ABSOLUTE,  9, $42, $01, $00
	events_end

G4_44_MapEvents:
	warp_event ABSOLUTE,  0, $45, $09, $00
	warp_event ABSOLUTE,  9, $10, $00, $00
	warp_event 18,  4, $06, $00, $00
	events_end

G4_45_MapEvents:
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

G4_46_MapEvents:
	warp_event ABSOLUTE,  8, $45, $03, $00
	event_07  9,  3, $02
	events_end

G4_47_MapEvents:
	warp_event ABSOLUTE,  8, $45, $01, $00
	event_07  4,  3, $09
	events_end

G4_48_MapEvents:
	warp_event ABSOLUTE,  8, $45, $06, $00
	event_07  9,  6, $0a
	events_end

G4_49_MapEvents:
	warp_event ABSOLUTE,  8, $45, $04, $00
	event_07  4,  3, $08
	events_end

G4_4A_MapEvents:
	warp_event ABSOLUTE,  8, $45, $05, $00
	event_07  8,  3, $01
	events_end

G4_4B_MapEvents:
	warp_event ABSOLUTE,  8, $45, $02, $00
	event_04  4,  4,  0, $40a2 ; XXX: Resolve script bank
	event_04  8,  4,  0, $40b0 ; XXX: Resolve script bank
	events_end

G4_4C_MapEvents:
	warp_event ABSOLUTE,  8, $45, $07, $00
	event_04  4,  3,  0, $4071 ; XXX: Resolve script bank
	events_end

G4_4D_MapEvents:
	warp_event ABSOLUTE,  8, $45, $08, $00
	event_07  2,  3, $0b
	events_end

G4_4E_MapEvents:
	warp_event ABSOLUTE,  9, $45, $0a, $00
	events_end

G4_4F_MapEvents:
	warp_event ABSOLUTE, 23, $15, $02, $00
	events_end

G4_50_MapEvents:
	script_event ABSOLUTE,  9,  0, $40eb ; XXX: Resolve script bank
	warp_event  3,  4, $51, $00, $00
	event_07 14,  4, $13
	event_07  3,  5, $14
	events_end

G4_51_MapEvents:
	warp_event  3,  5, $50, $01, $00
	warp_event 16,  5, $52, $00, $00
	event_07 15,  4, $15
	event_07  3,  4, $16
	events_end

G4_52_MapEvents:
	warp_event 16,  5, $51, $01, $00
	event_07  4,  4, $17
	event_07 12,  4, $18
	events_end

G4_53_MapEvents:
G4_54_MapEvents:
	events_end

G4_55_MapEvents:
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

G4_56_MapEvents:
	script_event ABSOLUTE,  8,  0, $40fa ; XXX: Resolve script bank
	event_07  9,  3, $03
	events_end

G4_57_MapEvents:
	script_event ABSOLUTE,  8,  0, $4108 ; XXX: Resolve script bank
	event_07  8,  3, $04
	events_end

G4_58_MapEvents:
	script_event ABSOLUTE,  8,  0, $4116 ; XXX: Resolve script bank
	event_07  1,  3, $05
	events_end

G4_59_MapEvents:
	script_event ABSOLUTE,  8,  0, $4124 ; XXX: Resolve script bank
	event_07  2,  3, $06
	events_end

G4_5A_MapEvents:
	script_event ABSOLUTE,  8,  0, $4132 ; XXX: Resolve script bank
	event_07  4,  3, $07
	events_end

G4_5B_MapEvents:
	script_event ABSOLUTE,  8,  0, $40d0 ; XXX: Resolve script bank
	event_07  2,  3, $0c
	events_end

G4_5C_MapEvents:
	script_event ABSOLUTE,  8,  0, $4140 ; XXX: Resolve script bank
	event_04  4,  4,  0, $4042 ; XXX: Resolve script bank
	event_04  8,  4,  0, $4050 ; XXX: Resolve script bank
	events_end

G4_5D_MapEvents:
	script_event ABSOLUTE,  8,  0, $414e ; XXX: Resolve script bank
	event_04  4,  3,  0, $4011 ; XXX: Resolve script bank
	events_end

G4_5E_MapEvents:
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

G4_5F_MapEvents:
	warp_event 15, ABSOLUTE, $5e, $01, $00
	warp_event  4,  4, $60, $00, $00
	signpost_event  6,  6, $06
	events_end

G4_60_MapEvents:
	warp_event ABSOLUTE, 23, $5f, $01, $00
	warp_event  2,  7, $60, $03, $00
	warp_event 21,  3, $61, $00, $00
	warp_event  3, 11, $60, $01, $00
	events_end

G4_61_MapEvents:
	warp_event  2,  2, $60, $02, $00
	warp_event 16, 21, $62, $02, $00
	events_end

G4_62_MapEvents:
	warp_event  6,  9, $63, $00, $00
	warp_event  7, 22, $62, $03, $00
	warp_event 14, 22, $61, $01, $00
	warp_event 12, 12, $62, $01, $00
	events_end

G4_63_MapEvents:
	warp_event  6, 22, $62, $00, $00
	events_end

G4_64_MapEvents:
	warp_event ABSOLUTE,  9, $45, $00, $00
	warp_event  5,  3, $65, $00, $00
	warp_event  6,  3, $65, $00, $00
	events_end

G4_65_MapEvents:
	warp_event ABSOLUTE,  9, $64, $01, $00
	events_end

; TODO: 6 zero bytes after the MapEvents tables, no references — likely padding/unused
unk_052_577a:
	db $00, $00, $00, $00, $00, $00

