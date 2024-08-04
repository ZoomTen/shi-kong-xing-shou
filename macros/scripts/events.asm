MACRO event
; Generic event
; \1 = X
; \2 = Y
; \3 = event type
; \4 = parameter 1
; \5 = parameter 2
; \6 = parameter 3
	db \1, \2
	db \3, \4, \5, \6
ENDM

	const_def

	const EV_WARP
MACRO warp_event
; $00 - Warp event (to a map in the same group)
; \1 = X
; \2 = Y
; \3 = map ID
; \4 = warp number
; \5 = scroll to show upon loading map
if _NARG > 4
	event \1, \2, EV_WARP, \3, \4, \5
else
	event \1, \2, EV_WARP, \3, \4, 0
endc
ENDM

	const EV_SCRIPT1
MACRO script_event
; $01 - Script event
; \1 = X
; \2 = Y
; \3 = script executed if $FFBA == \3
;      always executed if \3 is 0.
; \4 = script location
	db \1, \2, EV_SCRIPT1
	db \3
	dw \4
ENDM

	const EV_SIGNPOST
MACRO signpost_event
; $02 - Signpost event, accessible by pressing A while facing up
; \1 = X
; \2 = Y
; \3 = Signpost number (determined per map group)
	event \1, \2, EV_SIGNPOST, \3, $00, $00
ENDM

	const EV_FARWARP
MACRO farwarp_event
; $03 - Warp event (to a map in another map group)
; \1 = X
; \2 = Y
; \3 = map ID
; \4 = warp number
; \5 = map group
	event \1, \2, EV_FARWARP, \3, \4, \5
ENDM

	const EV_SCRIPT2
MACRO event_04
; $04 - Script event 2
; \1 = X
; \2 = Y
; \3 = script executed if $FFBA == \3
;      always executed if \3 is 0.
; \4 = script location
	db \1, \2, EV_SCRIPT2
	db \3
	dw \4
ENDM

	const EV_SCRIPT3
MACRO event_05
; $05 - Script event 3
; \1 = X
; \2 = Y
; \3 = ?
; \4 = script location
	db \1, \2, EV_SCRIPT3
	db \3
	dw \4
ENDM

	const EV_SCRIPT4
MACRO event_06
; $06 - Script event 4
; \1 = X
; \2 = Y
; \3 = script executed if $FFBA < \3
;      always executed if \3 is 0.
; \4 = script location
	db \1, \2, EV_SCRIPT4
	db \3
	dw \4
ENDM

	const EV_07
MACRO event_07
; $07
; \1 = X
; \2 = Y
; \3 = ?
	db \1, \2, EV_07
	db \3
	db 0, 0 ; TODO
ENDM

MACRO events_end
	db -1
ENDM

MACRO object_event
; Object event, interactible sprites
; \1 = Sprite ID
; \2 = X
; \3 = Y
; \4 = RAM location?
; \5 = ??
; \6 = ??
; \7 = ??
; \8 = ??
; \9 = Script
	db \1
	db \2, \3
	dw \4
	db \5, \6, \7, \8
	dw \9
ENDM

MACRO objects_end
	db $88
ENDM

