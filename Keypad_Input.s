#include <xc.inc>
    
    ;this sets up PORT D and PORT E and sends the keypad input to PORT D

global	Keypad_Setup, Keypad_Loading, wave, no_wave, octave, LoadTMR0_HB, LoadTMR0_LB, check_press
extrn	Test

psect	udata_acs   ; reserve data space in access ram
wave:    ds 1    ; reserve one byte for wave variable
no_wave:    ds 1    ; reserve one byte for no wave variable
octave:    ds 1    ; reserve one byte for octave variable
key_column:    ds 1    ; reserve one byte for key_column variable
key_row:    ds 1    ; reserve one byte for key_row variable
key__input:    ds 1    ; reserve one byte for key__input variable
LoadTMR0_HB:    ds 1    ; reserve one byte for LoadTMR0_HB variable
LoadTMR0_LB:    ds 1    ; reserve one byte for no LoadTMR0_LB variable
check_press:	ds 1	; reserve one byte for check_press variable 
    
psect keypad_code, class=CODE

;uses PORT D and PORT E
 
Keypad_Setup:   
    clrf    LoadTMR0_LB, A
    clrf    LoadTMR0_HB, A
    movlw   0x04
    movwf   wave, A	; set waveform counter to 1
    movlw   0x01
    movwf   no_wave, A	; begin with no wave
    movlw   0x00
    movwf   octave, A	; set octave counter to 0
    movwf   check_press, A	; set check_press counter to 0 (no button pressed)
    clrf    TRISD, A     ; sets PORTD as output
    banksel PADCFG1     ; selects bank to the location of PADCFG1
    bsf     REPU     ; PORT e PULLUPS on
    movlb   0x00     ; set bsr back to Bank 0
    clrf    LATE, A     ; sets PORTE as output
    return

Keypad_Loading:
    movlw   0x0f     ; 00001111 binary for first four bits as input
    movwf   TRISE, A     ; set tristate D value to be 1's for 1st four pins therefore input pins

    movlw   0x18    ; delay length
    movwf   0x10, A
    call    delay

    movff   PORTE, key_column     ; move the value input at port E to address 0x30

    movlw   0xf0     ; 11110000 binary for last four bits as input
    movwf   TRISE, A     ; set tristate D value to be 1's for last four pins therefore input pins

    movlw   0x18     ; delay length
    movwf   0x10, A    
    call    delay   

    movff   PORTE, key_row    ; move the value input at port E to address 0x40

    movlw   0x0
    call     loaddata
    return

loaddata:
    movf    key_column, W, A
    iorwf   key_row, W, A	;combine the 4 bits at address key_column with the 4 bits at address key_row
    movwf   key__input, A	;output combination to key_input
    movff   key__input, PORTD, A  ;output to Port D
    call    Test
    return     ; Loops in main file

delay:

    decfsz  0x10, F, A
    bra     delay
    return


end


