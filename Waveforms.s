#include <pic18_chip_select.inc>
#include <xc.inc>
	
global	Sawtooth_Wave, Reset_wave, Square_Wave, Waveform
extrn   Keypad_Setup, wave, no_wave
psect	wave_code, class=CODE
;will need to have same number of data points per cycle in order not to change frequency when changing waveform
    ;use counter variable such that it resets wave once it's reached zero to ensure same data points each time
    

      
Reset_wave:
	counter EQU FSR0	; Address of counter variable
	square EQU  0x20	; Address of square variable
	movlw	0x80		; 
	movwf 	counter, A	; set counter to 0x80
	movlw	0x80
	movwf	square, A	; set square to 0x80
	return
	
Waveform:
    TSTFSZ  no_wave, A	;check if wave is on (=0) or off, skip if on
    goto    No_Wave
    movlw   0x01	
    CPFSEQ  wave, A	;compare wave with W, skip if equal
    goto    Waveform2
    call    Sawtooth_Wave
    return
Waveform2:
    movlw   0x02	
    CPFSEQ  wave, A	;compare wave with W, skip if equal
    goto    Waveform3
    call    Square_Wave
    return
Waveform3:
    movlw   0xFF
    movwf   LATJ, A
    return
No_Wave:   
    movlw   0x00
    movwf   LATJ, A
    return
    
Sawtooth_Wave: 
	movf	counter, W, A	;move value in counter to W
	movwf LATJ, A		; move W into LATJ
	decfsz	counter, A	; decrement counter until zero
	return
	call	Reset_wave  ;once counter is at zero, reset variables
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
	movlw	0x40	;halfway point in counter
	CPFSLT	counter, A  ;if counter value is smaller than 0x40 then skip next line
	return
	movlw	0x00
	movwf	square, A   ;move 0 into square value
	return
	


