;Jacob please paste your keyboard code here
;#include <pic18_chip_select.inc>
;#include <xc.inc>
;
;psect code, abs
;
;main:
;    org	    0x0
;    goto    start
;    org     0x100	; Main code starts here at address 0x100
;    
;start:
;    clrf    TRISH	; sets PORTH as output
;    
;    banksel PADCFG1     ; selects bank to the location of PADCFG1
;    bsf     REPU     ; PORT e PULLUPS on
;    movlb   0x00     ; set bsr back to Bank 0
;
;    clrf    TRISE     ; set tristate D value to be 1's for 1st four pins therefore input pins
;
;    movlw   0x18     ; delay length
;    movwf   0x10, A
;    call    delay
;
;    movff   PORTE, 0x30     ; move the value input at port E to address 0x30
;
;        
; 
;;    movlw   0xf0     ; 11110000 binary for last four bits as input
;;      
;;    movwf   TRISE, A     ; set tristate D value to be 1's for last four pins therefore input pins
;;
;;    movlw   0x18     ; delay length
;;    movwf   0x10, A    
;;    call    delay   
;; 
;;    movff   PORTE, 0x40    
;
;    movlw   0x0
;    movwf   TRISH, A     ; PORT H all output
;    clrf    LATH, A     ; clears the output
;    bra     loaddata
;    
;
;loaddata:
;;    movf    0x30, W, A
;;    iorwf   0x40, W, A
;;    movwf   0x50, A
;    movff   0x30, PORTH, A
;    goto    $     ; Re-run program from start
; 
;
;delay:
;    decfsz  0x10, F, A
;    bra     delay
;    return
;
;
;end main