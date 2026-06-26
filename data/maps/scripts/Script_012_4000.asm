Script_012_4000::
	face FACE_RIGHT
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_400a::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_696a
	delay $01, $03
	setlayouttile $0016, $4a
	swapfollower
	end

Script_012_401b::
	face FACE_UP
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_4025::
	face FACE_DOWN
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_402f::
	face FACE_LEFT
	ifcharindex $02, Script_012_400a
	stext text_12_6443
	end

Script_012_4039::
	face FACE_RIGHT
	ifcharindex $02, Script_012_4043
	stext text_12_6443
	end

Script_012_4043::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0092, $7a
	swapfollower
	end

Script_012_4054::
	face FACE_UP
	ifcharindex $02, Script_012_4043
	stext text_12_6443
	end

Script_012_405e::
	face FACE_LEFT
	ifcharindex $02, Script_012_4043
	stext text_12_6443
	end

Script_012_4068::
	face FACE_DOWN
	ifcharindex $02, Script_012_4072
	stext text_12_6443
	end

Script_012_4072::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0025, $7b
	swapfollower
	end

Script_012_4083::
	face FACE_UP
	ifcharindex $02, Script_012_4072
	stext text_12_6443
	end

Script_012_408d::
	face FACE_RIGHT
	ifcharindex $02, Script_012_4097
	stext text_12_6443
	end

Script_012_4097::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $001b, $7c
	swapfollower
	end

Script_012_40a8::
	face FACE_DOWN
	ifcharindex $02, Script_012_4097
	stext text_12_6443
	end

Script_012_40b2::
	face FACE_LEFT
	ifcharindex $02, Script_012_4097
	stext text_12_6443
	end

Script_012_40bc::
	face FACE_UP
	ifcharindex $02, Script_012_40c6
	stext text_12_6443
	end

Script_012_40c6::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $008e, $6f
	swapfollower
	end

Script_012_40d7::
	face FACE_DOWN
	ifcharindex $02, Script_012_40c6
	stext text_12_6443
	end

Script_012_40e1::
	face FACE_UP
	ifcharindex $02, Script_012_40eb
	stext text_12_6443
	end

Script_012_40eb::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0055, $70
	swapfollower
	end

Script_012_40fc::
	face FACE_DOWN
	ifcharindex $02, Script_012_40eb
	stext text_12_6443
	end

Script_012_4106::
	face FACE_UP
	ifcharindex $02, Script_012_4110
	stext text_12_6443
	end

Script_012_4110::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $002e, $71
	swapfollower
	end

Script_012_4121::
	face FACE_DOWN
	ifcharindex $02, Script_012_4110
	stext text_12_6443
	end

Script_012_412b::
	face FACE_UP
	ifcharindex $02, Script_012_4135
	stext text_12_6443
	end

Script_012_4135::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $0027, $72
	swapfollower
	end

Script_012_4146::
	face FACE_DOWN
	ifcharindex $02, Script_012_4135
	stext text_12_6443
	end

Script_012_4150::
	face FACE_RIGHT
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_415a::
	swapfollower
	delay $03, $10
	scr_49
	setbgcopyplayer BGCopyTable_00b_6974
	delay $01, $03
	setlayouttile $001b, $2f
	swapfollower
	end

Script_012_416b::
	face FACE_LEFT
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_4175::
	face FACE_UP
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_417f::
	face FACE_DOWN
	ifcharindex $02, Script_012_415a
	stext text_12_6443
	end

Script_012_4189::
	warp3 $01, $00, $02
	end

Script_012_418e::
	ifcharindex $01, Script_012_4193
	end

Script_012_4193::
	face FACE_LEFT
	spriteface  1, FACE_LEFT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_012_4d76
	clearattach $01
	spriteface  1, FACE_RIGHT
	spritewalk  1, MOVE_RIGHT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_LEFT
	end

Script_012_41b5::
	ifcharindex $01, Script_012_41ba
	end

Script_012_41ba::
	face FACE_RIGHT
	spriteface  1, FACE_RIGHT
	setattach $01, $00, $f0, $00
	playsound SFX_41
	objmove $00, MovementData_012_4db7
	clearattach $01
	spriteface  1, FACE_LEFT
	spritewalk  1, MOVE_LEFT
	spriteface  1, FACE_DOWN
	spritewalk  1, MOVE_DOWN
	spriteface  1, FACE_RIGHT
	end
