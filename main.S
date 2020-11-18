#include <xc.inc>

extrn	DAC_Setup, DAC_Int_Hi, DAC_WritePin

psect	code, abs
rst:	org	0x0000	; reset vector
	goto	start

int_hi:	org	0x0008	; high vector, no low vector
	goto	DAC_Int_Hi
	
start:	call	DAC_Setup

	goto	run	
	
run:
    call    DAC_WritePin
    goto    run

	end	rst	; checking this pushes
 