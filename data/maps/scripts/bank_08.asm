BallotsHouse_StartScript::
	face FACE_UP
	stext House_CutsceneText1
	face FACE_LEFT
	move MovementData_OneLeft
	face FACE_UP
	face FACE_RIGHT
	move MovementData_OneRight
	face FACE_UP
	stext House_CutsceneText2
	emote 0, EMOTE_HEART
	delay 3, 32
	face FACE_DOWN
	stext text_08_456d
	stext text_08_458a
	stext text_08_45a5
	face FACE_LEFT
	move MovementData_OneLeft
	move MovementData_OneLeft
	face FACE_DOWN
	move MovementData_OneDown
	stext text_08_45cc
	delay 3, 7
	emote 0, EMOTE_EXCLAMATION
	delay 3, 32
	face FACE_LEFT
	move MovementData_OneLeft
	move MovementData_OneLeft
	move MovementData_OneLeft
	face FACE_DOWN
	move MovementData_OneDown
	stext text_08_45db
	delay 3, 7
	emote 0, EMOTE_QUESTION
	delay 3, 32
	stext text_08_45f0
	move MovementData_OneDown
	move MovementData_OneDown
	move MovementData_OneDown
	move MovementData_OneDown
	setfollower $01 ; follower
	face FACE_LEFT
	setmap MAP_BELL_VILLAGE_1, $08 ; map switch
; outside
	face FACE_RIGHT
	stext text_08_4651
	stext text_08_465e
	stext text_08_46a4
	face FACE_LEFT
	setmappredef MAPPREDEF_01
	end
