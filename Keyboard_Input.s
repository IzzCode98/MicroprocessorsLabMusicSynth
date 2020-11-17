;Jacob please paste your keyboard code here


#include <pic18_chip_select.inc>

#include <xc.inc>


 


 


 

psect code, abs


 

main:

    org 0x0

    

    goto    start


 


 

    org     0x100     ; Main code starts here at address 0x100

    

start:

    

   

    clrf    LATH     ; sets PORTH as output

    

    banksel PADCFG1     ; selects bank to the location of PADCFG1

    bsf     REPU     ; PORT e PULLUPS on

    movlb   0x00     ; set bsr back to Bank 0

    

    

    clrf    LATE     ; sets PORTE as output

   

    

    ;movff   0x03, PORTH     ; what was this for?

    

    

    movlw   0x0f     ; 00001111 binary for first four bits as input

;    movwf   0x30, A

    

    movwf   TRISE, A     ; set tristate D value to be 1's for 1st four pins therefore input pins


    movlw   0xFF     ; delay length

    movwf   0x10, A

    call    delay

    

;    

    movff   PORTE, 0x30     ; move the value input at port E to address 0x30

    

    


 

    movlw   0xf0     ; 11110000 binary for last four bits as input

    

    

    movwf   TRISE, A     ; set tristate D value to be 1's for last four pins therefore input pins

    

    movlw   0xFF     ; delay length

    movwf   0x10, A    

    call    delay    


 

    movff   PORTE, 0x40    

    

    movlw   0x0

    movwf   TRISH, A     ; PORT D all output

    clrf    LATH, A     ; clears the output

    bra     loaddata

    

loaddata:

    

    movf    0x30, W, A

    iorwf   0x40, W, A

    movwf   0x50, A

    movff   0x50, PORTH, A

    

    goto    $     ; Re-run program from start


 

delay:

    

    decfsz  0x10, F, A

    bra     delay

    return

    


 

   


 


 


 

end main