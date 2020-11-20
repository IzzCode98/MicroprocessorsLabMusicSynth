#include <pic18_chip_select.inc>
#include <xc.inc>

global	Keypad_Setup, Keypad_Loading
extrn	Test
psect keypad_code, class=CODE

;uses PORT D and PORT E
 
Keypad_Setup:   
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

    movff   PORTE, 0x30     ; move the value input at port E to address 0x30

    movlw   0xf0     ; 11110000 binary for last four bits as input
    movwf   TRISE, A     ; set tristate D value to be 1's for last four pins therefore input pins

    movlw   0x18     ; delay length
    movwf   0x10, A    
    call    delay   

    movff   PORTE, 0x40    

    movlw   0x0
    call     loaddata
    return

loaddata:
    movf    0x30, W, A
    iorwf   0x40, W, A
    movwf   0x50, A
    movff   0x50, PORTD, A
    call    Test
    return     ; Loops in main file

delay:

    decfsz  0x10, F, A
    bra     delay
    return


end


