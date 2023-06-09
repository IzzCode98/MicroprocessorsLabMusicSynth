#include <xc.inc>
    
    ;this is the main file which calls the setup routines and addresses the interrupt routine when the code is run
    ;while the code is running, this file loops through the Keypad_Loading subroutine in Keypad_Input.s

extrn	DAC_Setup, DAC_Int_Hi, DAC_WritePin, Keypad_Setup, Keypad_Loading, Sine_setup

psect	code, abs
rst:	org	0x0000	; reset vector
	goto	start

int_hi:	org	0x0008	; high vector, no low vector
	goto	DAC_Int_Hi
	
start:	call	DAC_Setup   ;set up Port J, Port H, start Timer0 for interrupt, reset variables
	call	Keypad_Setup	;set up Port E, Port D
	call	Sine_setup
	goto	run	
	
run:
    call    Keypad_Loading
    bra    run		    ;loop through keypad input for real-time response

	end	rst	; checking this pushes
 