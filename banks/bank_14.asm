Sprites2Eto52GFXPointers::
	dw spr_2e
	dw spr_2f
	dw spr_30
	dw spr_31
	dw spr_32
	dw spr_33
	dw spr_34
	dw spr_35
	dw spr_36
	dw spr_37
	dw spr_38
	dw spr_39
	dw spr_3a
	dw spr_3b
	dw spr_3c
	dw spr_3d
	dw spr_3e
	dw spr_3f
	dw spr_40
	dw spr_41
	dw spr_42
	dw spr_43
	dw spr_44
	dw spr_45
	dw spr_46
	dw spr_47
	dw spr_48
	dw spr_49
	dw spr_4a
	dw spr_4b
	dw spr_4c
	dw spr_4d
	dw spr_4e
	dw spr_4f
	dw spr_50
	dw spr_51
	dw spr_52
spr_2e::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_2e_4070
	dw spr_2e_40b0
	dw spr_2e_4070
	dw spr_2e_40f0
	dw $ffff
.facing1
	dw spr_2e_41f0
	dw spr_2e_4230
	dw spr_2e_41f0
	dw spr_2e_4270
	dw $ffff
.facing2
	dw spr_2e_4130
	dw spr_2e_4170
	dw spr_2e_4130
	dw spr_2e_41b0
	dw $ffff
spr_2e_4070:: INCBIN "gfx/sprites/spr_2e.2bpp", $0, $40
spr_2e_40b0:: INCBIN "gfx/sprites/spr_2e.2bpp", $40, $40
spr_2e_40f0:: INCBIN "gfx/sprites/spr_2e.2bpp", $80, $40
spr_2e_4130:: INCBIN "gfx/sprites/spr_2e.2bpp", $c0, $40
spr_2e_4170:: INCBIN "gfx/sprites/spr_2e.2bpp", $100, $40
spr_2e_41b0:: INCBIN "gfx/sprites/spr_2e.2bpp", $140, $40
spr_2e_41f0:: INCBIN "gfx/sprites/spr_2e.2bpp", $180, $40
spr_2e_4230:: INCBIN "gfx/sprites/spr_2e.2bpp", $1c0, $40
spr_2e_4270:: INCBIN "gfx/sprites/spr_2e.2bpp", $200, $40
spr_2f::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_2f_42d6
	dw spr_2f_4316
	dw spr_2f_42d6
	dw spr_2f_4356
	dw $ffff
.facing1
	dw spr_2f_4456
	dw spr_2f_4496
	dw spr_2f_4456
	dw spr_2f_44d6
	dw $ffff
.facing2
	dw spr_2f_4396
	dw spr_2f_43d6
	dw spr_2f_4396
	dw spr_2f_4416
	dw $ffff
spr_2f_42d6:: INCBIN "gfx/sprites/spr_2f.2bpp", $0, $40
spr_2f_4316:: INCBIN "gfx/sprites/spr_2f.2bpp", $40, $40
spr_2f_4356:: INCBIN "gfx/sprites/spr_2f.2bpp", $80, $40
spr_2f_4396:: INCBIN "gfx/sprites/spr_2f.2bpp", $c0, $40
spr_2f_43d6:: INCBIN "gfx/sprites/spr_2f.2bpp", $100, $40
spr_2f_4416:: INCBIN "gfx/sprites/spr_2f.2bpp", $140, $40
spr_2f_4456:: INCBIN "gfx/sprites/spr_2f.2bpp", $180, $40
spr_2f_4496:: INCBIN "gfx/sprites/spr_2f.2bpp", $1c0, $40
spr_2f_44d6:: INCBIN "gfx/sprites/spr_2f.2bpp", $200, $40
spr_30::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
	dw .facing3
.facing0
	dw spr_30_4548
	dw spr_30_4588
	dw spr_30_4548
	dw spr_30_45c8
	dw $ffff
.facing1
	dw spr_30_46c8
	dw spr_30_4708
	dw spr_30_46c8
	dw spr_30_4748
	dw $ffff
.facing2
	dw spr_30_4608
	dw spr_30_4648
	dw spr_30_4608
	dw spr_30_4688
	dw $ffff
.facing3
	dw spr_30_4788
	dw spr_30_4788
	dw spr_30_4788
	dw spr_30_4788
	dw $ffff
spr_30_4548:: INCBIN "gfx/sprites/spr_30.2bpp", $0, $40
spr_30_4588:: INCBIN "gfx/sprites/spr_30.2bpp", $40, $40
spr_30_45c8:: INCBIN "gfx/sprites/spr_30.2bpp", $80, $40
spr_30_4608:: INCBIN "gfx/sprites/spr_30.2bpp", $c0, $40
spr_30_4648:: INCBIN "gfx/sprites/spr_30.2bpp", $100, $40
spr_30_4688:: INCBIN "gfx/sprites/spr_30.2bpp", $140, $40
spr_30_46c8:: INCBIN "gfx/sprites/spr_30.2bpp", $180, $40
spr_30_4708:: INCBIN "gfx/sprites/spr_30.2bpp", $1c0, $40
spr_30_4748:: INCBIN "gfx/sprites/spr_30.2bpp", $200, $40
spr_30_4788:: INCBIN "gfx/sprites/spr_30.2bpp", $240, $40
spr_31::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_31_47ee
	dw spr_31_482e
	dw spr_31_47ee
	dw spr_31_486e
	dw $ffff
.facing1
	dw spr_31_496e
	dw spr_31_49ae
	dw spr_31_496e
	dw spr_31_49ee
	dw $ffff
.facing2
	dw spr_31_48ae
	dw spr_31_48ee
	dw spr_31_48ae
	dw spr_31_492e
	dw $ffff
spr_31_47ee:: INCBIN "gfx/sprites/spr_31.2bpp", $0, $40
spr_31_482e:: INCBIN "gfx/sprites/spr_31.2bpp", $40, $40
spr_31_486e:: INCBIN "gfx/sprites/spr_31.2bpp", $80, $40
spr_31_48ae:: INCBIN "gfx/sprites/spr_31.2bpp", $c0, $40
spr_31_48ee:: INCBIN "gfx/sprites/spr_31.2bpp", $100, $40
spr_31_492e:: INCBIN "gfx/sprites/spr_31.2bpp", $140, $40
spr_31_496e:: INCBIN "gfx/sprites/spr_31.2bpp", $180, $40
spr_31_49ae:: INCBIN "gfx/sprites/spr_31.2bpp", $1c0, $40
spr_31_49ee:: INCBIN "gfx/sprites/spr_31.2bpp", $200, $40
spr_32::
	dw .facing0
	dw .facing1
	dw .facing1
	dw .facing1
.facing0
	dw spr_32_4a8a
	dw spr_32_4aca
	dw spr_32_4a8a
	dw spr_32_4aca
	dw $ffff
.facing1
	dw spr_32_4a8a
	dw spr_32_4a4a
	dw spr_32_4a8a
	dw spr_32_4a4a
	dw $eeee
spr_32_4a4a:: INCBIN "gfx/sprites/spr_32.2bpp", $0, $40
spr_32_4a8a:: INCBIN "gfx/sprites/spr_32.2bpp", $40, $40
spr_32_4aca:: INCBIN "gfx/sprites/spr_32.2bpp", $80, $40
spr_33::
	dw .facing0
	dw .facing1
	dw .facing1
	dw .facing1
.facing0
	dw spr_33_4b26
	dw spr_33_4b66
	dw spr_33_4b26
	dw spr_33_4b66
	dw $ffff
.facing1
	dw spr_33_4b26
	dw spr_32_4a4a
	dw spr_33_4b26
	dw spr_32_4a4a
	dw $eeee
spr_33_4b26:: INCBIN "gfx/sprites/spr_33.2bpp", $0, $40
spr_33_4b66:: INCBIN "gfx/sprites/spr_33.2bpp", $40, $40
spr_34::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_34_4bf8
	dw spr_34_4c38
	dw spr_34_4bb8
	dw spr_34_4bb8
	dw $eeee
spr_34_4bb8:: INCBIN "gfx/sprites/spr_34.2bpp", $0, $40
spr_34_4bf8:: INCBIN "gfx/sprites/spr_34.2bpp", $40, $40
spr_34_4c38:: INCBIN "gfx/sprites/spr_34.2bpp", $80, $40
spr_35::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_35_4c9e
	dw spr_35_4cde
	dw spr_35_4c9e
	dw spr_35_4d1e
	dw $ffff
.facing1
	dw spr_35_4e1e
	dw spr_35_4e5e
	dw spr_35_4e1e
	dw spr_35_4e9e
	dw $ffff
.facing2
	dw spr_35_4d5e
	dw spr_35_4d9e
	dw spr_35_4d5e
	dw spr_35_4dde
	dw $ffff
spr_35_4c9e:: INCBIN "gfx/sprites/spr_35.2bpp", $0, $40
spr_35_4cde:: INCBIN "gfx/sprites/spr_35.2bpp", $40, $40
spr_35_4d1e:: INCBIN "gfx/sprites/spr_35.2bpp", $80, $40
spr_35_4d5e:: INCBIN "gfx/sprites/spr_35.2bpp", $c0, $40
spr_35_4d9e:: INCBIN "gfx/sprites/spr_35.2bpp", $100, $40
spr_35_4dde:: INCBIN "gfx/sprites/spr_35.2bpp", $140, $40
spr_35_4e1e:: INCBIN "gfx/sprites/spr_35.2bpp", $180, $40
spr_35_4e5e:: INCBIN "gfx/sprites/spr_35.2bpp", $1c0, $40
spr_35_4e9e:: INCBIN "gfx/sprites/spr_35.2bpp", $200, $40
spr_36::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_36_4f04
	dw spr_36_4f44
	dw spr_36_4f04
	dw spr_36_4f84
	dw $ffff
.facing1
	dw spr_36_5084
	dw spr_36_50c4
	dw spr_36_5084
	dw spr_36_5104
	dw $ffff
.facing2
	dw spr_36_4fc4
	dw spr_36_5004
	dw spr_36_4fc4
	dw spr_36_5044
	dw $ffff
spr_36_4f04:: INCBIN "gfx/sprites/spr_36.2bpp", $0, $40
spr_36_4f44:: INCBIN "gfx/sprites/spr_36.2bpp", $40, $40
spr_36_4f84:: INCBIN "gfx/sprites/spr_36.2bpp", $80, $40
spr_36_4fc4:: INCBIN "gfx/sprites/spr_36.2bpp", $c0, $40
spr_36_5004:: INCBIN "gfx/sprites/spr_36.2bpp", $100, $40
spr_36_5044:: INCBIN "gfx/sprites/spr_36.2bpp", $140, $40
spr_36_5084:: INCBIN "gfx/sprites/spr_36.2bpp", $180, $40
spr_36_50c4:: INCBIN "gfx/sprites/spr_36.2bpp", $1c0, $40
spr_36_5104:: INCBIN "gfx/sprites/spr_36.2bpp", $200, $40
spr_37::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
	dw spr_38.facing0
	dw spr_38.facing1
	dw spr_38.facing2
	dw spr_38.facing2
.facing0
	dw spr_37_5172
	dw spr_37_51b2
	dw spr_37_5172
	dw spr_37_51f2
	dw $ffff
.facing1
	dw spr_37_52f2
	dw spr_37_5332
	dw spr_37_52f2
	dw spr_37_5372
	dw $ffff
.facing2
	dw spr_37_5232
	dw spr_37_5272
	dw spr_37_5232
	dw spr_37_52b2
	dw $ffff
spr_37_5172:: INCBIN "gfx/sprites/spr_37.2bpp", $0, $40
spr_37_51b2:: INCBIN "gfx/sprites/spr_37.2bpp", $40, $40
spr_37_51f2:: INCBIN "gfx/sprites/spr_37.2bpp", $80, $40
spr_37_5232:: INCBIN "gfx/sprites/spr_37.2bpp", $c0, $40
spr_37_5272:: INCBIN "gfx/sprites/spr_37.2bpp", $100, $40
spr_37_52b2:: INCBIN "gfx/sprites/spr_37.2bpp", $140, $40
spr_37_52f2:: INCBIN "gfx/sprites/spr_37.2bpp", $180, $40
spr_37_5332:: INCBIN "gfx/sprites/spr_37.2bpp", $1c0, $40
spr_37_5372:: INCBIN "gfx/sprites/spr_37.2bpp", $200, $40
spr_38::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_38_53d8
	dw spr_38_5418
	dw spr_38_53d8
	dw spr_38_5458
	dw $ffff
.facing1
	dw spr_38_5558
	dw spr_38_5598
	dw spr_38_5558
	dw spr_38_55d8
	dw $ffff
.facing2
	dw spr_38_5498
	dw spr_38_54d8
	dw spr_38_5498
	dw spr_38_5518
	dw $ffff
spr_38_53d8:: INCBIN "gfx/sprites/spr_38.2bpp", $0, $40
spr_38_5418:: INCBIN "gfx/sprites/spr_38.2bpp", $40, $40
spr_38_5458:: INCBIN "gfx/sprites/spr_38.2bpp", $80, $40
spr_38_5498:: INCBIN "gfx/sprites/spr_38.2bpp", $c0, $40
spr_38_54d8:: INCBIN "gfx/sprites/spr_38.2bpp", $100, $40
spr_38_5518:: INCBIN "gfx/sprites/spr_38.2bpp", $140, $40
spr_38_5558:: INCBIN "gfx/sprites/spr_38.2bpp", $180, $40
spr_38_5598:: INCBIN "gfx/sprites/spr_38.2bpp", $1c0, $40
spr_38_55d8:: INCBIN "gfx/sprites/spr_38.2bpp", $200, $40
spr_39::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_39_563e
	dw spr_39_567e
	dw spr_39_563e
	dw spr_39_56be
	dw $ffff
.facing1
	dw spr_39_57be
	dw spr_39_57fe
	dw spr_39_57be
	dw spr_39_583e
	dw $ffff
.facing2
	dw spr_39_56fe
	dw spr_39_573e
	dw spr_39_56fe
	dw spr_39_577e
	dw $ffff
spr_39_563e:: INCBIN "gfx/sprites/spr_39.2bpp", $0, $40
spr_39_567e:: INCBIN "gfx/sprites/spr_39.2bpp", $40, $40
spr_39_56be:: INCBIN "gfx/sprites/spr_39.2bpp", $80, $40
spr_39_56fe:: INCBIN "gfx/sprites/spr_39.2bpp", $c0, $40
spr_39_573e:: INCBIN "gfx/sprites/spr_39.2bpp", $100, $40
spr_39_577e:: INCBIN "gfx/sprites/spr_39.2bpp", $140, $40
spr_39_57be:: INCBIN "gfx/sprites/spr_39.2bpp", $180, $40
spr_39_57fe:: INCBIN "gfx/sprites/spr_39.2bpp", $1c0, $40
spr_39_583e:: INCBIN "gfx/sprites/spr_39.2bpp", $200, $40
spr_3a::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_3a_58a4
	dw spr_3a_58e4
	dw spr_3a_58a4
	dw spr_3a_5924
	dw $ffff
.facing1
	dw spr_3a_5a24
	dw spr_3a_5a64
	dw spr_3a_5a24
	dw spr_3a_5aa4
	dw $ffff
.facing2
	dw spr_3a_5964
	dw spr_3a_59a4
	dw spr_3a_5964
	dw spr_3a_59e4
	dw $ffff
spr_3a_58a4:: INCBIN "gfx/sprites/spr_3a.2bpp", $0, $40
spr_3a_58e4:: INCBIN "gfx/sprites/spr_3a.2bpp", $40, $40
spr_3a_5924:: INCBIN "gfx/sprites/spr_3a.2bpp", $80, $40
spr_3a_5964:: INCBIN "gfx/sprites/spr_3a.2bpp", $c0, $40
spr_3a_59a4:: INCBIN "gfx/sprites/spr_3a.2bpp", $100, $40
spr_3a_59e4:: INCBIN "gfx/sprites/spr_3a.2bpp", $140, $40
spr_3a_5a24:: INCBIN "gfx/sprites/spr_3a.2bpp", $180, $40
spr_3a_5a64:: INCBIN "gfx/sprites/spr_3a.2bpp", $1c0, $40
spr_3a_5aa4:: INCBIN "gfx/sprites/spr_3a.2bpp", $200, $40
spr_3b::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_3b_5af6
	dw spr_3b_5af6
	dw spr_3b_5af6
	dw spr_3b_5af6
	dw $ffff
spr_3b_5af6:: INCBIN "gfx/sprites/spr_3b.2bpp", $0, $40
spr_3c::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_3c_5b5c
	dw spr_3c_5b9c
	dw spr_3c_5b5c
	dw spr_3c_5bdc
	dw $ffff
.facing1
	dw spr_3c_5cdc
	dw spr_3c_5d1c
	dw spr_3c_5cdc
	dw spr_3c_5d5c
	dw $ffff
.facing2
	dw spr_3c_5c1c
	dw spr_3c_5c5c
	dw spr_3c_5c1c
	dw spr_3c_5c9c
	dw $ffff
spr_3c_5b5c:: INCBIN "gfx/sprites/spr_3c.2bpp", $0, $40
spr_3c_5b9c:: INCBIN "gfx/sprites/spr_3c.2bpp", $40, $40
spr_3c_5bdc:: INCBIN "gfx/sprites/spr_3c.2bpp", $80, $40
spr_3c_5c1c:: INCBIN "gfx/sprites/spr_3c.2bpp", $c0, $40
spr_3c_5c5c:: INCBIN "gfx/sprites/spr_3c.2bpp", $100, $40
spr_3c_5c9c:: INCBIN "gfx/sprites/spr_3c.2bpp", $140, $40
spr_3c_5cdc:: INCBIN "gfx/sprites/spr_3c.2bpp", $180, $40
spr_3c_5d1c:: INCBIN "gfx/sprites/spr_3c.2bpp", $1c0, $40
spr_3c_5d5c:: INCBIN "gfx/sprites/spr_3c.2bpp", $200, $40
spr_3d::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_3d_5dae
	dw spr_3d_5dae
	dw spr_3d_5dae
	dw spr_3d_5dae
	dw $ffff
spr_3d_5dae:: INCBIN "gfx/sprites/spr_3d.2bpp", $0, $40
spr_3e::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_3e_5e14
	dw spr_3e_5e54
	dw spr_3e_5e14
	dw spr_3e_5e94
	dw $ffff
.facing1
	dw spr_3e_5f94
	dw spr_3e_5fd4
	dw spr_3e_5f94
	dw spr_3e_6014
	dw $ffff
.facing2
	dw spr_3e_5ed4
	dw spr_3e_5f14
	dw spr_3e_5ed4
	dw spr_3e_5f54
	dw $ffff
spr_3e_5e14:: INCBIN "gfx/sprites/spr_3e.2bpp", $0, $40
spr_3e_5e54:: INCBIN "gfx/sprites/spr_3e.2bpp", $40, $40
spr_3e_5e94:: INCBIN "gfx/sprites/spr_3e.2bpp", $80, $40
spr_3e_5ed4:: INCBIN "gfx/sprites/spr_3e.2bpp", $c0, $40
spr_3e_5f14:: INCBIN "gfx/sprites/spr_3e.2bpp", $100, $40
spr_3e_5f54:: INCBIN "gfx/sprites/spr_3e.2bpp", $140, $40
spr_3e_5f94:: INCBIN "gfx/sprites/spr_3e.2bpp", $180, $40
spr_3e_5fd4:: INCBIN "gfx/sprites/spr_3e.2bpp", $1c0, $40
spr_3e_6014:: INCBIN "gfx/sprites/spr_3e.2bpp", $200, $40
spr_3f::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_3f_607a
	dw spr_3f_60ba
	dw spr_3f_607a
	dw spr_3f_60fa
	dw $ffff
.facing1
	dw spr_3f_61fa
	dw spr_3f_623a
	dw spr_3f_61fa
	dw spr_3f_627a
	dw $ffff
.facing2
	dw spr_3f_613a
	dw spr_3f_617a
	dw spr_3f_613a
	dw spr_3f_61ba
	dw $ffff
spr_3f_607a:: INCBIN "gfx/sprites/spr_3f.2bpp", $0, $40
spr_3f_60ba:: INCBIN "gfx/sprites/spr_3f.2bpp", $40, $40
spr_3f_60fa:: INCBIN "gfx/sprites/spr_3f.2bpp", $80, $40
spr_3f_613a:: INCBIN "gfx/sprites/spr_3f.2bpp", $c0, $40
spr_3f_617a:: INCBIN "gfx/sprites/spr_3f.2bpp", $100, $40
spr_3f_61ba:: INCBIN "gfx/sprites/spr_3f.2bpp", $140, $40
spr_3f_61fa:: INCBIN "gfx/sprites/spr_3f.2bpp", $180, $40
spr_3f_623a:: INCBIN "gfx/sprites/spr_3f.2bpp", $1c0, $40
spr_3f_627a:: INCBIN "gfx/sprites/spr_3f.2bpp", $200, $40
spr_40::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_40_62e0
	dw spr_40_6320
	dw spr_40_62e0
	dw spr_40_6360
	dw $ffff
.facing1
	dw spr_40_6460
	dw spr_40_64a0
	dw spr_40_6460
	dw spr_40_64e0
	dw $ffff
.facing2
	dw spr_40_63a0
	dw spr_40_63e0
	dw spr_40_63a0
	dw spr_40_6420
	dw $ffff
spr_40_62e0:: INCBIN "gfx/sprites/spr_40.2bpp", $0, $40
spr_40_6320:: INCBIN "gfx/sprites/spr_40.2bpp", $40, $40
spr_40_6360:: INCBIN "gfx/sprites/spr_40.2bpp", $80, $40
spr_40_63a0:: INCBIN "gfx/sprites/spr_40.2bpp", $c0, $40
spr_40_63e0:: INCBIN "gfx/sprites/spr_40.2bpp", $100, $40
spr_40_6420:: INCBIN "gfx/sprites/spr_40.2bpp", $140, $40
spr_40_6460:: INCBIN "gfx/sprites/spr_40.2bpp", $180, $40
spr_40_64a0:: INCBIN "gfx/sprites/spr_40.2bpp", $1c0, $40
spr_40_64e0:: INCBIN "gfx/sprites/spr_40.2bpp", $200, $40
spr_41::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_41_6532
	dw spr_41_6532
	dw spr_41_6532
	dw spr_41_6532
	dw $ffff
spr_41_6532:: INCBIN "gfx/sprites/spr_41.2bpp", $0, $40
spr_42::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_42_6598
	dw spr_42_65d8
	dw spr_42_6598
	dw spr_42_6618
	dw $ffff
.facing1
	dw spr_42_6718
	dw spr_42_6758
	dw spr_42_6718
	dw spr_42_6798
	dw $ffff
.facing2
	dw spr_42_6658
	dw spr_42_6698
	dw spr_42_6658
	dw spr_42_66d8
	dw $ffff
spr_42_6598:: INCBIN "gfx/sprites/spr_42.2bpp", $0, $40
spr_42_65d8:: INCBIN "gfx/sprites/spr_42.2bpp", $40, $40
spr_42_6618:: INCBIN "gfx/sprites/spr_42.2bpp", $80, $40
spr_42_6658:: INCBIN "gfx/sprites/spr_42.2bpp", $c0, $40
spr_42_6698:: INCBIN "gfx/sprites/spr_42.2bpp", $100, $40
spr_42_66d8:: INCBIN "gfx/sprites/spr_42.2bpp", $140, $40
spr_42_6718:: INCBIN "gfx/sprites/spr_42.2bpp", $180, $40
spr_42_6758:: INCBIN "gfx/sprites/spr_42.2bpp", $1c0, $40
spr_42_6798:: INCBIN "gfx/sprites/spr_42.2bpp", $200, $40
spr_43::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_43_67ea
	dw spr_43_67ea
	dw spr_43_67ea
	dw spr_43_67ea
	dw $ffff
spr_43_67ea:: INCBIN "gfx/sprites/spr_43.2bpp", $0, $40
spr_44::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_44_6850
	dw spr_44_6890
	dw spr_44_6850
	dw spr_44_68d0
	dw $ffff
.facing1
	dw spr_44_69d0
	dw spr_44_6a10
	dw spr_44_69d0
	dw spr_44_6a50
	dw $ffff
.facing2
	dw spr_44_6910
	dw spr_44_6950
	dw spr_44_6910
	dw spr_44_6990
	dw $ffff
spr_44_6850:: INCBIN "gfx/misc/spr_44.2bpp", $0, $40
spr_44_6890:: INCBIN "gfx/misc/spr_44.2bpp", $40, $40
spr_44_68d0:: INCBIN "gfx/misc/spr_44.2bpp", $80, $40
spr_44_6910:: INCBIN "gfx/misc/spr_44.2bpp", $c0, $40
spr_44_6950:: INCBIN "gfx/misc/spr_44.2bpp", $100, $40
spr_44_6990:: INCBIN "gfx/misc/spr_44.2bpp", $140, $40
spr_44_69d0:: INCBIN "gfx/misc/spr_44.2bpp", $180, $40
spr_44_6a10:: INCBIN "gfx/misc/spr_44.2bpp", $1c0, $40
spr_44_6a50:: INCBIN "gfx/misc/spr_44.2bpp", $200, $40
spr_45::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_45_6ab6
	dw spr_45_6af6
	dw spr_45_6ab6
	dw spr_45_6b36
	dw $ffff
.facing1
	dw spr_45_6c36
	dw spr_45_6c76
	dw spr_45_6c36
	dw spr_45_6cb6
	dw $ffff
.facing2
	dw spr_45_6b76
	dw spr_45_6bb6
	dw spr_45_6b76
	dw spr_45_6bf6
	dw $ffff
spr_45_6ab6:: INCBIN "gfx/sprites/spr_45.2bpp", $0, $40
spr_45_6af6:: INCBIN "gfx/sprites/spr_45.2bpp", $40, $40
spr_45_6b36:: INCBIN "gfx/sprites/spr_45.2bpp", $80, $40
spr_45_6b76:: INCBIN "gfx/sprites/spr_45.2bpp", $c0, $40
spr_45_6bb6:: INCBIN "gfx/sprites/spr_45.2bpp", $100, $40
spr_45_6bf6:: INCBIN "gfx/sprites/spr_45.2bpp", $140, $40
spr_45_6c36:: INCBIN "gfx/sprites/spr_45.2bpp", $180, $40
spr_45_6c76:: INCBIN "gfx/sprites/spr_45.2bpp", $1c0, $40
spr_45_6cb6:: INCBIN "gfx/sprites/spr_45.2bpp", $200, $40
spr_46::
	dw .facing0
	dw .facing1
	dw .facing1
	dw .facing1
.facing0
	dw spr_46_6d52
	dw spr_46_6d92
	dw spr_46_6d52
	dw spr_46_6d92
	dw $ffff
.facing1
	dw spr_46_6d52
	dw spr_46_6d12
	dw spr_46_6d52
	dw spr_46_6d12
	dw $ffff
spr_46_6d12:: INCBIN "gfx/sprites/spr_46.2bpp", $0, $40
spr_46_6d52:: INCBIN "gfx/sprites/spr_46.2bpp", $40, $40
spr_46_6d92:: INCBIN "gfx/sprites/spr_46.2bpp", $80, $40
spr_47::
	dw .facing0
	dw .facing1
	dw .facing0
	dw .facing0
.facing0
	dw spr_47_6dee
	dw spr_47_6dee
	dw spr_47_6dee
	dw spr_47_6dee
	dw $ffff
.facing1
	dw spr_47_6e2e
	dw spr_47_6dee
	dw spr_47_6e2e
	dw spr_47_6dee
	dw $ffff
spr_47_6dee:: INCBIN "gfx/sprites/spr_47.2bpp", $0, $40
spr_47_6e2e:: INCBIN "gfx/sprites/spr_47.2bpp", $40, $40
spr_48::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_48_6e80
	dw spr_48_6ec0
	dw spr_48_6e80
	dw spr_48_6ec0
	dw $eeee
spr_48_6e80:: INCBIN "gfx/sprites/spr_48.2bpp", $0, $40
spr_48_6ec0:: INCBIN "gfx/sprites/spr_48.2bpp", $40, $40
spr_49::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing0
.facing0
	dw spr_49_6f26
	dw spr_49_6f66
	dw spr_49_6f26
	dw spr_49_6f66
	dw $eeee
.facing1
	dw spr_49_6fa6
	dw spr_49_6fe6
	dw spr_49_6fa6
	dw spr_49_6fe6
	dw $eeee
.facing2
	dw spr_49_7026
	dw spr_49_7026
	dw spr_49_7026
	dw spr_49_7026
	dw $eeee
spr_49_6f26:: INCBIN "gfx/sprites/spr_49.2bpp", $0, $40
spr_49_6f66:: INCBIN "gfx/sprites/spr_49.2bpp", $40, $40
spr_49_6fa6:: INCBIN "gfx/sprites/spr_49.2bpp", $80, $40
spr_49_6fe6:: INCBIN "gfx/sprites/spr_49.2bpp", $c0, $40
spr_49_7026:: INCBIN "gfx/sprites/spr_49.2bpp", $100, $40
spr_4a::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_4a_708c
	dw spr_4a_70cc
	dw spr_4a_708c
	dw spr_4a_710c
	dw $ffff
.facing1
	dw spr_4a_720c
	dw spr_4a_724c
	dw spr_4a_720c
	dw spr_4a_728c
	dw $ffff
.facing2
	dw spr_4a_714c
	dw spr_4a_718c
	dw spr_4a_714c
	dw spr_4a_71cc
	dw $ffff
spr_4a_708c:: INCBIN "gfx/sprites/spr_4a.2bpp", $0, $40
spr_4a_70cc:: INCBIN "gfx/sprites/spr_4a.2bpp", $40, $40
spr_4a_710c:: INCBIN "gfx/sprites/spr_4a.2bpp", $80, $40
spr_4a_714c:: INCBIN "gfx/sprites/spr_4a.2bpp", $c0, $40
spr_4a_718c:: INCBIN "gfx/sprites/spr_4a.2bpp", $100, $40
spr_4a_71cc:: INCBIN "gfx/sprites/spr_4a.2bpp", $140, $40
spr_4a_720c:: INCBIN "gfx/sprites/spr_4a.2bpp", $180, $40
spr_4a_724c:: INCBIN "gfx/sprites/spr_4a.2bpp", $1c0, $40
spr_4a_728c:: INCBIN "gfx/sprites/spr_4a.2bpp", $200, $40
spr_4b::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
	dw .facing3
.facing0
	dw spr_4b_72fe
	dw spr_4b_733e
	dw spr_4b_72fe
	dw spr_4b_737e
	dw $ffff
.facing1
	dw spr_4b_747e
	dw spr_4b_74be
	dw spr_4b_747e
	dw spr_4b_74fe
	dw $ffff
.facing2
	dw spr_4b_73be
	dw spr_4b_73fe
	dw spr_4b_73be
	dw spr_4b_743e
	dw $ffff
.facing3
	dw spr_4b_753e
	dw spr_4b_753e
	dw spr_4b_753e
	dw spr_4b_753e
	dw $ffff
spr_4b_72fe:: INCBIN "gfx/sprites/spr_4b.2bpp", $0, $40
spr_4b_733e:: INCBIN "gfx/sprites/spr_4b.2bpp", $40, $40
spr_4b_737e:: INCBIN "gfx/sprites/spr_4b.2bpp", $80, $40
spr_4b_73be:: INCBIN "gfx/sprites/spr_4b.2bpp", $c0, $40
spr_4b_73fe:: INCBIN "gfx/sprites/spr_4b.2bpp", $100, $40
spr_4b_743e:: INCBIN "gfx/sprites/spr_4b.2bpp", $140, $40
spr_4b_747e:: INCBIN "gfx/sprites/spr_4b.2bpp", $180, $40
spr_4b_74be:: INCBIN "gfx/sprites/spr_4b.2bpp", $1c0, $40
spr_4b_74fe:: INCBIN "gfx/sprites/spr_4b.2bpp", $200, $40
spr_4b_753e:: INCBIN "gfx/sprites/spr_4b.2bpp", $240, $40
spr_4c::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_4c_7590
	dw spr_4c_75d0
	dw spr_4c_7590
	dw spr_4c_75d0
	dw $ffff
spr_4c_7590:: INCBIN "gfx/sprites/spr_4c.2bpp", $0, $40
spr_4c_75d0:: INCBIN "gfx/sprites/spr_4c.2bpp", $40, $40
spr_4d::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_4d_7622
	dw spr_4d_7662
	dw spr_4d_7622
	dw spr_4d_7662
	dw $ffff
spr_4d_7622:: INCBIN "gfx/sprites/spr_4d.2bpp", $0, $40
spr_4d_7662:: INCBIN "gfx/sprites/spr_4d.2bpp", $40, $40
spr_4e::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_4e_76b4
	dw spr_4e_76f4
	dw spr_4e_76b4
	dw spr_4e_76f4
	dw $ffff
spr_4e_76b4:: INCBIN "gfx/sprites/spr_4e.2bpp", $0, $40
spr_4e_76f4:: INCBIN "gfx/sprites/spr_4e.2bpp", $40, $40
spr_4f::
	dw .facing0
	dw .facing0
	dw .facing0
	dw .facing0
.facing0
	dw spr_4f_7746
	dw spr_4f_7786
	dw spr_4f_7746
	dw spr_4f_7786
	dw $ffff
spr_4f_7746:: INCBIN "gfx/sprites/spr_4f.2bpp", $0, $40
spr_4f_7786:: INCBIN "gfx/sprites/spr_4f.2bpp", $40, $40
spr_50::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing0
.facing0
	dw spr_50_77ec
	dw spr_50_782c
	dw spr_50_77ec
	dw spr_50_782c
	dw $ffff
.facing1
	dw spr_50_78ac
	dw spr_50_786c
	dw spr_50_78ac
	dw spr_50_786c
	dw $eeee
.facing2
	dw spr_50_77ec
	dw spr_50_78ac
	dw spr_50_77ec
	dw spr_50_78ac
	dw $eeee
spr_50_77ec:: INCBIN "gfx/sprites/spr_50.2bpp", $0, $40
spr_50_782c:: INCBIN "gfx/sprites/spr_50.2bpp", $40, $40
spr_50_786c:: INCBIN "gfx/sprites/spr_50.2bpp", $80, $40
spr_50_78ac:: INCBIN "gfx/sprites/spr_50.2bpp", $c0, $40
spr_51::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_51_7912
	dw spr_51_7952
	dw spr_51_7912
	dw spr_51_7992
	dw $ffff
.facing1
	dw spr_51_7a92
	dw spr_51_7ad2
	dw spr_51_7a92
	dw spr_51_7b12
	dw $ffff
.facing2
	dw spr_51_79d2
	dw spr_51_7a12
	dw spr_51_79d2
	dw spr_51_7a52
	dw $ffff
spr_51_7912:: INCBIN "gfx/sprites/spr_51.2bpp", $0, $40
spr_51_7952:: INCBIN "gfx/sprites/spr_51.2bpp", $40, $40
spr_51_7992:: INCBIN "gfx/sprites/spr_51.2bpp", $80, $40
spr_51_79d2:: INCBIN "gfx/sprites/spr_51.2bpp", $c0, $40
spr_51_7a12:: INCBIN "gfx/sprites/spr_51.2bpp", $100, $40
spr_51_7a52:: INCBIN "gfx/sprites/spr_51.2bpp", $140, $40
spr_51_7a92:: INCBIN "gfx/sprites/spr_51.2bpp", $180, $40
spr_51_7ad2:: INCBIN "gfx/sprites/spr_51.2bpp", $1c0, $40
spr_51_7b12:: INCBIN "gfx/sprites/spr_51.2bpp", $200, $40
spr_52::
	dw .facing0
	dw .facing1
	dw .facing2
	dw .facing2
.facing0
	dw spr_52_7b78
	dw spr_52_7bb8
	dw spr_52_7b78
	dw spr_52_7bf8
	dw $ffff
.facing1
	dw spr_52_7cf8
	dw spr_52_7d38
	dw spr_52_7cf8
	dw spr_52_7d78
	dw $ffff
.facing2
	dw spr_52_7c38
	dw spr_52_7c78
	dw spr_52_7c38
	dw spr_52_7cb8
	dw $ffff
spr_52_7b78:: INCBIN "gfx/sprites/spr_52.2bpp", $0, $40
spr_52_7bb8:: INCBIN "gfx/sprites/spr_52.2bpp", $40, $40
spr_52_7bf8:: INCBIN "gfx/sprites/spr_52.2bpp", $80, $40
spr_52_7c38:: INCBIN "gfx/sprites/spr_52.2bpp", $c0, $40
spr_52_7c78:: INCBIN "gfx/sprites/spr_52.2bpp", $100, $40
spr_52_7cb8:: INCBIN "gfx/sprites/spr_52.2bpp", $140, $40
spr_52_7cf8:: INCBIN "gfx/sprites/spr_52.2bpp", $180, $40
spr_52_7d38:: INCBIN "gfx/sprites/spr_52.2bpp", $1c0, $40
spr_52_7d78:: INCBIN "gfx/sprites/spr_52.2bpp", $200, $40
