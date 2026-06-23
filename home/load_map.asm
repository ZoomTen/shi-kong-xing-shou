LoadMap::
	ld a, [_BANKNUM]
	push af
	call LoadMapData
	call LoadMapAttrs
	call LoadMapGFX
	call _LoadMap
	call LoadMapObjects
	call RunMapLoadHook
	pop af
	rst Bankswitch
	ret

BuildBlockmap::
	ld a, [_BANKNUM]
	push af
	call _BuildBlockmap
	pop af
	rst Bankswitch
	ret

GetBlockCollision::
	ld a, [_BANKNUM]
	push af
	call _GetBlockCollision
	pop af
	rst Bankswitch
	ret

UpdateVisibleObjects::
	homecall _UpdateVisibleObjects
	ret

UpdateSelectedObject::
	homecall _UpdateSelectedObject
	ret
