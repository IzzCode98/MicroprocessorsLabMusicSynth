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
    
Test1_OctUp:
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x8E 	; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test1_OctUp2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xC6 	; Load low byte
    movwf  LoadTMR0_LB, A
    return     
    
Test2:
    movlw   11101101B	;keypad key 2 = note A#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test3
    movlw  0xF7		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x9D 	; Load low byte
    movwf  LoadTMR0_LB, A
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    return
    
Test2_OctUp:
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xCE 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test2_OctUp2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xE6		; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test3_OctUp:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x0A 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test3_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x04 	; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test4_OctUp:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x43 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 

Test4_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x21 	; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test5_OctUp:
    movlw  0xFC 	; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x79 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test5_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x3C 	; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test6_OctUp:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xAB		; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test6_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x55		; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test7_OctUp:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xDB 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test7_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x6D 	; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test8_OctUp:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x08 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test8_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x83		; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test9_OctUp:
    movlw  0xFd		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x33 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test9_OctUp2:
    movlw  0xFE	; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x99	; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test10_OctUp:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x5B 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test10_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xAD		; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test11_OctUp:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x81 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 

Test11_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xC0 	; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test12_OctUp:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xA5 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test12_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xD2 	; Load low byte
    movwf  LoadTMR0_LB, A
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
    
Test13_OctUp:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xC6		; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test13_OctUp2:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xE2 	; Load low byte
    movwf  LoadTMR0_LB, A
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
    movlw   0x03
    CPFSLT  wave, A	;skip next instruction if wave counter is not yet at 3
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
  