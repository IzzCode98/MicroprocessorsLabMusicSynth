#include <xc.inc>
	
global	DAC_Setup, DAC_Int_Hi, DAC_WritePin
    
psect	dac_code, class=CODE
	
DAC_Int_Hi:	
	btfss	TMR0IF		; check that this is timer0 interrupt
	retfie	f		; if not then return
	movlw	0x32
	;movwf	LATJ, A		;producing a straight line v out
	incf	LATJ, F, A	; increment PORTJ
	bcf	TMR0IF		; clear interrupt flag
	retfie	f		; fast return from interrupt
	
DAC_WritePin:
	movlw	0x00	; 
	movwf	PORTH, A	; set write pin low
	movlw   0xFF     ; delay length
	movwf   0x10, A    
	call	delay
	movlw	0xFF	; 
	movwf	PORTH, A	; set write pin high
	return	
delay:
    decfsz  0x10, F, A
    bra     delay
    return
DAC_Setup:
	clrf	TRISJ, A	; Set PORTJ as all outputs
	clrf	LATJ, A		; Clear PORTJ outputs
	clrf	TRISH, A	; Set PORTH as all outputs
	clrf	LATH, A		; Clear PORTH outputs
	movlw	10001000B	; Set timer0 to 16-bit, Fosc/4/256 ;CHANGED
	movwf	T0CON, A	; = 62.5KHz clock rate, approx 1sec rollover
	bsf	TMR0IE		; Enable timer0 interrupt
	bsf	GIE		; Enable all interrupts
	return
	
	end

