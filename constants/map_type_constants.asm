; wMapType (wd0f4) - map "type" id. First byte of every map layout; LoadMapLayout
; (home/maps.asm) reads it into wMapType. Indexes (x2) LayoutPatches_01e_4910 (load-time
; conditional layout patches applied per event flag) and Pointers_01e_4d29 (per-type
; dug-item name table, LoadItemNameByMapType). $00 = ordinary map (no dig mechanic).
	const_def
	const MAPTYPE_NONE             ; $00 ordinary map (most maps)
	const MAPTYPE_CRYSTAL_MINES_P2 ; $01 CrystalMinesP2
	const MAPTYPE_CRYSTAL_MINES_P3 ; $02 CrystalMinesP3
	const MAPTYPE_CRYSTAL_MINES_P4 ; $03 CrystalMinesP4
	const MAPTYPE_CRYSTAL_MINES_P5 ; $04 CrystalMinesP5
	const MAPTYPE_CRYSTAL_MINES_P1 ; $05 CrystalMinesP1
	const MAPTYPE_POWER_PLANT_1F   ; $06 PowerPlant1F_Layout
	const MAPTYPE_POWER_PLANT_2F   ; $07 PowerPlant2F_Layout
	const MAPTYPE_POWER_PLANT_3F   ; $08 PowerPlant3F_Layout
	const MAPTYPE_POWER_PLANT_4F   ; $09 PowerPlant4F_Layout
	const MAPTYPE_CLOCK_TOWER_1F   ; $0a
	const MAPTYPE_CLOCK_TOWER_2F   ; $0b
	const MAPTYPE_CLOCK_TOWER_3F   ; $0c
	const MAPTYPE_CLOCK_TOWER_4F   ; $0d
	const MAPTYPE_HIDEOUT          ; $0e Hideout_Layout
	const MAPTYPE_COFFEE_FOREST_P1 ; $0f
	const MAPTYPE_COFFEE_FOREST_P2 ; $10
	const MAPTYPE_SKY_ROCK_P1      ; $11
	const MAPTYPE_GREEN_FOREST_P12 ; $12
	const MAPTYPE_GREEN_FOREST_P2  ; $13 GreenForestP21, GreenForestP22
	const MAPTYPE_BANGLIN_CO_2F    ; $14
	const MAPTYPE_BANGLIN_CO_3F    ; $15
	const MAPTYPE_BANGLIN_CO_4F    ; $16
	const MAPTYPE_BANGLIN_CO_5F    ; $17
	const MAPTYPE_G4_01            ; $18
	const MAPTYPE_G4_02            ; $19
	const MAPTYPE_G4_03            ; $1a
	const MAPTYPE_G4_04            ; $1b
	const MAPTYPE_G4_07            ; $1c
	const MAPTYPE_G4_08            ; $1d
	const MAPTYPE_G4_09            ; $1e
	const MAPTYPE_G4_1A            ; $1f
	const MAPTYPE_G4_1B            ; $20
	const MAPTYPE_G4_1C            ; $21
	const MAPTYPE_G4_60            ; $22
	const MAPTYPE_G4_61            ; $23
	const MAPTYPE_G4_62            ; $24
	const MAPTYPE_G4_15            ; $25
	const MAPTYPE_G4_16            ; $26
	const MAPTYPE_G5_0B            ; $27
	const MAPTYPE_G5_0C            ; $28
	const MAPTYPE_G5_0D            ; $29
	const MAPTYPE_G5_17            ; $2a
	const MAPTYPE_G5_01            ; $2b
	const MAPTYPE_G5_02            ; $2c
	const MAPTYPE_G5_03            ; $2d
	const MAPTYPE_G5_04            ; $2e
	const MAPTYPE_G5_05            ; $2f
	const MAPTYPE_G5_06            ; $30
	const MAPTYPE_G6_01            ; $31
	const MAPTYPE_G6_02            ; $32
	const MAPTYPE_G6_03            ; $33
	const MAPTYPE_G6_04            ; $34
	const MAPTYPE_G6_05            ; $35
	const MAPTYPE_G6_06            ; $36
	const MAPTYPE_GREEN_FOREST_P13 ; $37
