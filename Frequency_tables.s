#include <pic18_chip_select.inc>
#include <xc.inc>

global	Oct0_Timer0_HB, Oct0_Timer0_LB
psect table_code, class=code
    
Oct0_Timer0_HB:
    addwf PCL, A
    retlw 0xF7
    retlw 0xF7
    retlw 0xF8
    retlw 0xF8
    retlw 0xF9
    retlw 0xF9
    retlw 0xF9
    retlw 0xFA
    retlw 0xFA
    retlw 0xFA
    retlw 0xFB
    retlw 0xFB
Oct0_Timer0_LB:
    addwf PCL, A
    retlw 0x1E
    retlw 0x9D
    retlw 0x16
    retlw 0x87
    retlw 0xF3
    retlw 0x58
    retlw 0xB7
    retlw 0x12
    retlw 0x67
    retlw 0xB7
    retlw 0x03
    retlw 0x4B

;Example:
   ; Test:
    ;call    Test1
        ;look at variable 'octave'
    ;call    Oct0_Timer0_HB  ; Load high byte
    ;movwf  FSR1, A
    ;call    Test1
    ;call    Oct0_Timer0_HB 	; Load low byte
    ;movwf  FSR2, A
    ;return
    
;Test1:
 ;   movlw   11101110B	;keypad key 1 = note A
;    movlw   0x00
 ;   movwf   no_wave, A	; turn on wave
  ;  movlw   1
   ; return