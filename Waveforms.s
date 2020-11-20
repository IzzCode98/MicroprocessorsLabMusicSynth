#include <pic18_chip_select.inc>
#include <xc.inc>
	
global	Sawtooth_Wave, Reset_wave, Square_Wave
psect	wave_code, class=CODE
;will need to have same number of data points per cycle in order not to change frequency when changing waveform
    

      
Reset_wave:
	counter EQU FSR0	; Address of counter variable
	square EQU  FSR1
	movlw	0xFF		; 
	movwf 	counter, A	; our counter register
	movlw	0xFF
	movwf	square, A
	return
	
Sawtooth_Wave: 
	movf	counter, W, A
	movwf LATJ, A
	decfsz	counter, A	; count down to zero
	return
	call	Reset_wave
	return
	
Square_Wave:
	movf	square, W, A	;move value in square to W
	movwf	LATJ, A		; move W into LATJ
	decf	counter, A	;decrement counter
	call Sq1			
	movlw	0x00
	CPFSEQ	counter, A  ;if counter is 0 then skip next line
	return
	call	Reset_wave	;reset counter and square
	return
	
Sq1:
	movlw	0x80	;halfway point in counter
	CPFSLT	counter, A  ;if counter value is smaller than 0x80 then skip next line
	return
	movlw	0x00
	movwf	square, A   ;move 0 into square value
	return
	


