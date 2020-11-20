#include <xc.inc>

extrn	DAC_Setup, DAC_Int_Hi, DAC_WritePin, Keypad_Setup, Keypad_Loading

psect	code, abs
rst:	org	0x0000	; reset vector
	goto	start

int_hi:	org	0x0008	; high vector, no low vector
	goto	DAC_Int_Hi
	
start:	call	DAC_Setup
	call	Keypad_Setup

	goto	run	
	
run:
    call    Keypad_Loading
    bra    run		    ;loop through keypad input for real-time response

	end	rst	; checking this pushes
 