#include <pic18_chip_select.inc>
#include <xc.inc>

global	Test
extrn   Keypad_Setup, wave
psect freq_code, class=CODE

;uses PORT D
 
Test:
    movlw   11101110B	;keypad key 1 = note A
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test2
    movlw  0xF7		; Load high byte
    movwf  FSR1, A
    movlw  0x1E 	; Load low byte
    movwf  FSR2, A
    return
    
Test2:
    movlw   11101101B	;keypad key 2 = note A#
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test3
    movlw  0xF7		; Load high byte
    movwf  FSR1, A
    movlw  0x9E 	; Load low byte
    movwf  FSR2, A
    return
    
Test3:
    movlw   11101011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test4
    movlw  0xF8		; Load high byte
    movwf  FSR1, A
    movlw  0x16 	; Load low byte
    movwf  FSR2, A
    return

Test4:
    movlw   11100111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test5
    movlw  0xF8		; Load high byte
    movwf  FSR1, A
    movlw  0x88 	; Load low byte
    movwf  FSR2, A
    return
    
Test5:
    movlw   11011110B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test6
    movlw  0xF8		; Load high byte
    movwf  FSR1, A
    movlw  0xF3 	; Load low byte
    movwf  FSR2, A
    return
    
Test6:
    movlw   11011101B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test7
    movlw  0xF9		; Load high byte
    movwf  FSR1, A
    movlw  0x58 	; Load low byte
    movwf  FSR2, A
    return
    
Test7:
    movlw   11011011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test8
    movlw  0xF9		; Load high byte
    movwf  FSR1, A
    movlw  0xB8 	; Load low byte
    movwf  FSR2, A
    return
    
Test8:
    movlw   11010111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test9
    movlw  0xFA		; Load high byte
    movwf  FSR1, A
    movlw  0x12 	; Load low byte
    movwf  FSR2, A
    return
    
Test9:
    movlw   10111110B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test10
    movlw  0xFA		; Load high byte
    movwf  FSR1, A
    movlw  0x67 	; Load low byte
    movwf  FSR2, A
    return
    
Test10:
    movlw   10111101B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test11
    movlw  0xFA		; Load high byte
    movwf  FSR1, A
    movlw  0xB8 	; Load low byte
    movwf  FSR2, A
    return
    
Test11:
    movlw   10111011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test12
    movlw  0xFB		; Load high byte
    movwf  FSR1, A
    movlw  0x03 	; Load low byte
    movwf  FSR2, A
    return
    
Test12:
    movlw   10110111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test13
    movlw  0xFB		; Load high byte
    movwf  FSR1, A
    movlw  0x4B 	; Load low byte
    movwf  FSR2, A
    return 
    
Test13:
    movlw   01111110B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test14
    movlw  0xFB		; Load high byte
    movwf  FSR1, A
    movlw  0x8F 	; Load low byte
    movwf  FSR2, A
    return    
    
Test14:
    movlw   01111101B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test15
    movlw  0x00		; Load high byte
    movwf  FSR1, A
    movlw  0x00 	; Load low byte
    movwf  FSR2, A
    movlw   0x00
    movwf   wave, A	; set waveform counter to 0
    return    
    
Test15:
    movlw   01111011B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test16
    movlw  0x00		; Load high byte
    movwf  FSR1, A
    movlw  0x00 	; Load low byte
    movwf  FSR2, A
    movlw   0x01
    movwf   wave, A	; set waveform counter to 1   
    return   
    
Test16:
    movlw   01110111B	;keypad key 1
    CPFSEQ  LATD, A	;compare f with W, skip if equal
    goto    Test17
    movlw  0x00		; Load high byte
    movwf  FSR1, A
    movlw  0x00 	; Load low byte
    movwf  FSR2, A
    movlw   0x02
    movwf   wave, A	; set waveform counter to 2
    return    
 
Test17:
    movlw  0x00		; Load high byte
    movwf  FSR1, A
    movlw  0x00 	; Load low byte
    movwf  FSR2, A
    return    
  