	.MBC1_ROM_PAGE	= 0x2000 ;

call_hl:
	jp	(hl)
; e: bank
; hl: function address
___sdcc_bcall_ehl::
	ldh	a,(__current_bank)
	push	af		; Push the current bank onto the stack
	ld a, e
	ldh	(__current_bank),a
	ld	(.MBC1_ROM_PAGE),a	; Perform the switch
	call call_hl
___sdcc_breturn_ehl::
	pop	af		; Pop the old bank
	ld	(.MBC1_ROM_PAGE),a
	ldh	(__current_bank),a
	ret

.area	_HRAM (ABS)
	.org	0xFF90
__current_bank::	; Current bank
	.ds	0x01