#include <pic18_chip_select.inc>
#include <xc.inc>

global	Test, LoadTMR0_LB, LoadTMR0_HB
extrn   Keypad_Setup, wave, no_wave, octave, LoadTMR0_LB, LoadTMR0_HB, check_press
  
psect freq_code, class=CODE

;uses PORT D
 
Test:
    movlw   11101110B	;keypad key 1 = note A
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test2
    movlw  0xF7		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x1E 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test2:
    movlw   11101101B	;keypad key 2 = note A#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test3
    movlw  0xF7		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x9E 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test3:
    movlw   11101011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test4
    movlw  0xF8		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x16 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return

Test4:
    movlw   11100111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test5
    movlw  0xF8		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x88 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test5:
    movlw   11011110B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test6
    movlw  0xF8		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xF3 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test6:
    movlw   11011101B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test7
    movlw  0xF9		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x58 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test7:
    movlw   11011011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test8
    movlw  0xF9		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xB8 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test8:
    movlw   11010111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test9
    movlw  0xFA		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x12 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test9:
    movlw   10111110B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test10
    movlw  0xFA		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x67 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test10:
    movlw   10111101B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test11
    movlw  0xFA		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xB8 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test11:
    movlw   10111011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test12
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x03 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test12:
    movlw   10110111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test13
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x4B 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return 
    
Test13:
    movlw   01111110B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test14
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x8F 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return    
    
Test14:
    movlw   01111101B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test15
    movlw   0x01
    movwf   octave, A
    movwf   no_wave, A	; show no wave when button pressed
    return    
    
Test15:
    movlw   01111011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test16
    movwf   no_wave, A	; show no wave when button pressed
    return   
    
Test16:
    movlw   01110111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test17
    TSTFSZ  check_press, A	;test check_press, skip if 0
    return 
    movlw   0x02
    CPFSLT  wave, A	;skip next instruction if wave counter is not yet at 2
    clrf    wave, A
    incf    wave, A
    movlw   0x01
    movwf   no_wave, A	; show no wave when button pressed
    movwf   check_press, A  ;set check_press to 1 while the button is pressed
    return    
 
Test17:
    movlw   0x01
    movwf   no_wave, A	; show no wave when no button pressed
    movlw   0x00
    movwf   check_press, A ; set check_press to 0 when no button is pressed
    return    
  