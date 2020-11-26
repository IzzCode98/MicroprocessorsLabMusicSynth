#include <xc.inc>

; this file compares the keypad input with all possible binary combinations to identify which key is being pressed
    ; upon identifying the key, certain variables are set depending on the function of the key and the value of other variables
    ; if no key is pressed, the no wave variable is set 

global	Test, LoadTMR0_LB, LoadTMR0_HB
extrn   Keypad_Setup, wave, no_wave, octave, LoadTMR0_LB, LoadTMR0_HB, check_press
  
psect freq_code, class=CODE

;uses PORT D
 
Test:
    movlw   11101110B	;keypad key 1 = note A
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test2
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test1_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test1_Oct2
    goto    Test1_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test1_Oct1:
    movlw  0xF7		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x4D 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test1_Oct2:
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xC5 	; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test1_Oct3:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xFD 	; Load low byte
    movwf  LoadTMR0_LB, A
    return     
    
Test2:
    movlw   11101101B	;keypad key 2 = note A#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test3
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test2_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test2_Oct2
    goto    Test2_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test2_Oct1:
    movlw  0xF7		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xCD 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test2_Oct2:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x05 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test2_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x1D		; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test3:
    movlw   11101011B	;keypad key 3 = note B
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test4
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test3_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test3_Oct2
    goto    Test3_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test3_Oct1:
    movlw  0xF8		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x47 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
    
Test3_Oct2:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x41 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test3_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x3B 	; Load low byte
    movwf  LoadTMR0_LB, A
    return  

Test4:
    movlw   11100111B	;keypad key F = note C
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test5
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test4_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test4_Oct2
    goto    Test4_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    return
    
Test4_Oct1:
    movlw  0xF8		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xB9 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test4_Oct2:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x7A 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 

Test4_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x57 	; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test5:
    movlw   11011110B	;keypad key 4 = note C#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test6
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test5_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test5_Oct2
    goto    Test5_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test5_Oct1:
    movlw  0xF9		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x26 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test5_Oct2:
    movlw  0xFC 	; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xB0 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test5_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x71 	; Load low byte
    movwf  LoadTMR0_LB, A
    return  

Test6:
    movlw   11011101B	;keypad key 5 = note D
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test7
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test6_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test6_Oct2
    goto    Test6_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test6_Oct1:
    movlw  0xF9		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x8C	        ; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test6_Oct2:
    movlw  0xFC		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xE3		; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test6_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x8A		; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test7:
    movlw   11011011B	;keypad key 6 = note D#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test8
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test7_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test7_Oct2
    goto    Test7_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test7_Oct1:
    movlw  0xF9		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xEC 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test7_Oct2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x12 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test7_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xA2 	; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test8:
    movlw   11010111B	;keypad key E = note E
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test9
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test8_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test8_Oct2
    goto    Test8_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test8_Oct1:
    movlw  0xFA		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x47 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test8_Oct2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x3F 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test8_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xB8		; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test9:
    movlw   10111110B	;keypad key 7 = note F
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test10
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test9_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test9_Oct2
    goto    Test9_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test9_Oct1:
    movlw  0xFA		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x9C 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test9_Oct2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x6A 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test9_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xCD		; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test10:
    movlw   10111101B	;keypad key 8 = note F#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test11
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test10_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test10_Oct2
    goto    Test10_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test10_Oct1:
    movlw  0xFA		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xED 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test10_Oct2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x92 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test10_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xE1		; Load low byte
    movwf  LoadTMR0_LB, A
    return  
    
Test11:
    movlw   10111011B	;keypad key 9 = note G
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test12
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test11_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test11_Oct2
    goto    Test11_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test11_Oct1:
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x39 	; Load low byte
    movwf  LoadTMR0_LB, A
    return

Test11_Oct2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xB8 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 

Test11_Oct3:
    movlw  0xFE		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xF3 	; Load low byte
    movwf  LoadTMR0_LB, A
    return      
    
Test12:
    movlw   10110111B	;keypad key D = note G#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test13
    movlw   0x00
    movwf   no_wave, A	; turn on wave
    movlw   0x01
    CPFSGT  octave, A ;check if this is octave 1, skip if not
    goto    Test12_Oct1
    movlw   0x02
    CPFSGT  octave, A ; check if this is octave 2, skip if not
    goto    Test12_Oct2
    goto    Test12_Oct3 ;if not oct1 or oct2, then it is oct3 so go to oct3
    
Test12_Oct1:
    movlw  0xFB		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x81 	; Load low byte
    movwf  LoadTMR0_LB, A
    return
    
Test12_Oct2:
    movlw  0xFD		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0xDB 	; Load low byte
    movwf  LoadTMR0_LB, A
    return 
    
Test12_Oct3:
    movlw  0xFF		; Load high byte
    movwf  LoadTMR0_HB, A
    movlw  0x05 	; Load low byte
    movwf  LoadTMR0_LB, A
    return  

Test13:
    movlw   01111110B	;keypad key A = octave 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test14
    movlw   0x01
    movwf   octave, A
    movlw   0x01
    movwf   no_wave, A	; show no wave when button pressed
    return 
    
Test14:
    movlw   01111101B	;keypad key 0 = octave 2
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test15
    movlw   0x02
    movwf   octave, A
    movlw   0x01
    movwf   no_wave, A	; show no wave when button pressed
    return    
    
Test15:
    movlw   01111011B	;keypad key B = octave 3
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test16
    movlw   0x03
    movwf   octave, A
    movlw   0x01
    movwf   no_wave, A	; show no wave when button pressed
    return   
    
Test16:
    movlw   01110111B	;keypad key C = change waveform
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test17
    TSTFSZ  check_press, A	;test check_press, skip if 0
    return 
    movlw   0x04
    CPFSLT  wave, A	;skip next instruction if wave counter is not yet at 4
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
  
