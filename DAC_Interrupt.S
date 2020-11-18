#include <xc.inc>
	
global	DAC_Setup, DAC_Int_Hi, DAC_WritePin
    
psect	dac_code, class=CODE
	
DAC_Int_Hi:	
	btfss	TMR0IF		; check that this is timer0 interrupt
	retfie	f		; if not then return
	movlw	0xFF
	movwf	LATJ, A
	;incf	LATJ, F, A	; increment PORTJ
	bcf	TMR0IF		; clear interrupt flag
	retfie	f		; fast return from interrupt
	
DAC_WritePin:
	movlw	0x00	; 
	movwf	PORTH, A	; set write pin low
	movlw	0xFF	; 
	movwf	PORTH, A	; set write pin high
	return	

DAC_delay:
	decfsz  0x10, F, A
	bra     DAC_delay
	return
	
DAC_Setup:
	clrf	TRISJ, A	; Set PORTJ as all outputs
	clrf	LATJ, A		; Clear PORTJ outputs
	clrf	TRISH, A	; Set PORTH as all outputs
	clrf	LATH, A		; Clear PORTH outputs
	movlw	10000111B	; Set timer0 to 16-bit, Fosc/4
	movwf	T0CON, A	; = 16MHz clock rate
	bsf	TMR0IE		; Enable timer0 interrupt
	bsf	GIE		; Enable all interrupts
	return
	
	end

