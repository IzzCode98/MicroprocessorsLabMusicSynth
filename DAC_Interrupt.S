#include <xc.inc>
    
    ; this file contains the interrupt service routine and the setup for PORT J and PORT H
	
global	DAC_Setup, DAC_Int_Hi, DAC_WritePin
extrn   Sawtooth_Wave, Reset_wave, Square_Wave, Waveform, LoadTMR0_LB, LoadTMR0_HB, Triangle_Wave, Sine_wave
    
psect	dac_code, class=CODE
	
; uses PORT J and PORT H
DAC_Int_Hi:	
	btfss	TMR0IF		; check that this is timer0 interrupt
	retfie	f		; if not then return
	call	Load_Timer0

	call	Waveform	;calls waveform based on wave counter

	call	DAC_WritePin	;load data change onto converter
	
	bcf	TMR0IF		; clear interrupt flag
	retfie	f		; fast return from interrupt
	
DAC_WritePin:
	movlw	0x00	; 
	movwf	PORTH, A	; set write pin low
	movlw	0xFF	; 
	movwf	PORTH, A	; set write pin high
	return	

Load_Timer0:
	movff	LoadTMR0_HB,TMR0H, A; Load high byte
	movff	LoadTMR0_LB,TMR0L, A; Load low byte
	return
    
DAC_Setup:
	clrf	TRISJ, A	; Set PORTJ as all outputs
	clrf	LATJ, A		; Clear PORTJ outputs
	clrf	TRISH, A	; Set PORTH as all outputs
	clrf	LATH, A		; Clear PORTH outputs
	call	Reset_wave
	movlw	10001000B	; Set timer0 to 16-bit
	movwf	T0CON, A	; = 16MHz clock rate 
	bsf	TMR0IE		; Enable timer0 interrupt
	bsf	GIE		; Enable all interrupts
	return
	
	end

