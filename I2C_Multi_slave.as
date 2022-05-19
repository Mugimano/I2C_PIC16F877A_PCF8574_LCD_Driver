opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_I2C_init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_send_string
	FNCALL	_lcd_send_string,_lcd_send_data
	FNCALL	_lcd_init,_lcd_send_cmd
	FNCALL	_lcd_send_data,_I2C_Master_start
	FNCALL	_lcd_send_data,_I2C_Master_write
	FNCALL	_lcd_send_data,_I2C_Master_stop
	FNCALL	_lcd_send_cmd,_I2C_Master_start
	FNCALL	_lcd_send_cmd,_I2C_Master_write
	FNCALL	_lcd_send_cmd,_I2C_Master_stop
	FNROOT	_main
	global	_a
	global	_sum
	global	_PORTB
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_SSPIF
_SSPIF	set	99
	global	_SSPADD
_SSPADD	set	147
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_RSEN
_RSEN	set	1161
	global	_SEN
_SEN	set	1160
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	77	;'M'
	retlw	85	;'U'
	retlw	71	;'G'
	retlw	69	;'E'
	retlw	83	;'S'
	retlw	72	;'H'
	retlw	0
psect	strings
	file	"I2C_Multi_slave.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_a:
       ds      2

_sum:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_init
?_I2C_init:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_send_string
?_lcd_send_string:	; 0 bytes @ 0x0
	global	?_I2C_Master_start
?_I2C_Master_start:	; 0 bytes @ 0x0
	global	??_I2C_Master_start
??_I2C_Master_start:	; 0 bytes @ 0x0
	global	?_I2C_Master_write
?_I2C_Master_write:	; 0 bytes @ 0x0
	global	?_I2C_Master_stop
?_I2C_Master_stop:	; 0 bytes @ 0x0
	global	??_I2C_Master_stop
??_I2C_Master_stop:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_send_cmd
?_lcd_send_cmd:	; 0 bytes @ 0x0
	global	?_lcd_send_data
?_lcd_send_data:	; 0 bytes @ 0x0
	global	I2C_Master_write@data
I2C_Master_write@data:	; 2 bytes @ 0x0
	ds	2
	global	??_I2C_Master_write
??_I2C_Master_write:	; 0 bytes @ 0x2
	global	??_lcd_send_cmd
??_lcd_send_cmd:	; 0 bytes @ 0x2
	global	??_lcd_send_data
??_lcd_send_data:	; 0 bytes @ 0x2
	ds	2
	global	??_I2C_init
??_I2C_init:	; 0 bytes @ 0x4
	global	lcd_send_cmd@data
lcd_send_cmd@data:	; 1 bytes @ 0x4
	global	lcd_send_data@data
lcd_send_data@data:	; 1 bytes @ 0x4
	ds	1
	global	lcd_send_cmd@data_l
lcd_send_cmd@data_l:	; 1 bytes @ 0x5
	global	lcd_send_data@data_l
lcd_send_data@data_l:	; 1 bytes @ 0x5
	ds	1
	global	lcd_send_cmd@data_u
lcd_send_cmd@data_u:	; 1 bytes @ 0x6
	global	lcd_send_data@data_u
lcd_send_data@data_u:	; 1 bytes @ 0x6
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x7
	global	??_lcd_send_string
??_lcd_send_string:	; 0 bytes @ 0x7
	ds	1
	global	lcd_send_string@str
lcd_send_string@str:	; 1 bytes @ 0x8
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x9
;;Data sizes: Strings 7, constant 0, data 0, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      13
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_send_string@str	PTR unsigned char  size(1) Largest target is 7
;;		 -> STR_1(CODE[7]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_send_string
;;   _lcd_send_string->_lcd_send_data
;;   _lcd_init->_lcd_send_cmd
;;   _lcd_send_data->_I2C_Master_write
;;   _lcd_send_cmd->_I2C_Master_write
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     240
;;                           _I2C_init
;;                           _lcd_init
;;                    _lcd_send_string
;; ---------------------------------------------------------------------------------
;; (1) _lcd_send_string                                      2     2      0     135
;;                                              7 COMMON     2     2      0
;;                      _lcd_send_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0     105
;;                       _lcd_send_cmd
;; ---------------------------------------------------------------------------------
;; (2) _lcd_send_data                                        5     5      0     105
;;                                              2 COMMON     5     5      0
;;                   _I2C_Master_start
;;                   _I2C_Master_write
;;                    _I2C_Master_stop
;; ---------------------------------------------------------------------------------
;; (2) _lcd_send_cmd                                         5     5      0     105
;;                                              2 COMMON     5     5      0
;;                   _I2C_Master_start
;;                   _I2C_Master_write
;;                    _I2C_Master_stop
;; ---------------------------------------------------------------------------------
;; (3) _I2C_Master_stop                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _I2C_Master_write                                     2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (3) _I2C_Master_start                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_init                                             4     0      4       0
;;                                              0 COMMON     4     0      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_init
;;   _lcd_init
;;     _lcd_send_cmd
;;       _I2C_Master_start
;;       _I2C_Master_write
;;       _I2C_Master_stop
;;   _lcd_send_string
;;     _lcd_send_data
;;       _I2C_Master_start
;;       _I2C_Master_write
;;       _I2C_Master_stop
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0       D       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      10      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 24 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_I2C_init
;;		_lcd_init
;;		_lcd_send_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	24
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	25
	
l1858:	
;main.c: 25: TRISC = 0Xff;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	26
	
l1860:	
;main.c: 26: PORTC = 0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	28
	
l1862:	
;main.c: 28: TRISB = 0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	29
	
l1864:	
;main.c: 29: PORTB = 0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	31
	
l1866:	
;main.c: 31: TRISD = 0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	32
	
l1868:	
;main.c: 32: PORTD = 0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	35
	
l1870:	
;main.c: 35: I2C_init (100000);
	movlw	0
	movwf	(?_I2C_init+3)
	movlw	01h
	movwf	(?_I2C_init+2)
	movlw	086h
	movwf	(?_I2C_init+1)
	movlw	0A0h
	movwf	(?_I2C_init)

	fcall	_I2C_init
	line	36
	
l1872:	
;main.c: 36: lcd_init ();
	fcall	_lcd_init
	line	38
	
l1874:	
;main.c: 38: lcd_send_string ("MUGESH");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_send_string
	goto	l576
	line	40
;main.c: 40: while(1){
	
l575:	
	line	41
	
l576:	
	line	40
	goto	l576
	
l577:	
	line	42
	
l578:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_send_string
psect	text125,local,class=CODE,delta=2
global __ptext125
__ptext125:

;; *************** function _lcd_send_string *****************
;; Defined at:
;;		line 86 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_1(7), 
;; Auto vars:     Size  Location     Type
;;  str             1    8[COMMON] PTR unsigned char 
;;		 -> STR_1(7), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_send_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text125
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	86
	global	__size_of_lcd_send_string
	__size_of_lcd_send_string	equ	__end_of_lcd_send_string-_lcd_send_string
	
_lcd_send_string:	
	opt	stack 5
; Regs used in _lcd_send_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_send_string@str stored from wreg
	movwf	(lcd_send_string@str)
	line	87
	
l1850:	
;main.c: 87: while (*str) lcd_send_data (*str++);
	goto	l1856
	
l591:	
	
l1852:	
	movf	(lcd_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_send_data
	
l1854:	
	movlw	(01h)
	movwf	(??_lcd_send_string+0)+0
	movf	(??_lcd_send_string+0)+0,w
	addwf	(lcd_send_string@str),f
	goto	l1856
	
l590:	
	
l1856:	
	movf	(lcd_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l1852
u2230:
	goto	l593
	
l592:	
	line	88
	
l593:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send_string
	__end_of_lcd_send_string:
;; =============== function _lcd_send_string ends ============

	signat	_lcd_send_string,4216
	global	_lcd_init
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 91 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_send_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text126
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	91
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	92
	
l1848:	
;main.c: 92: lcd_send_cmd (0x02);
	movlw	(02h)
	fcall	_lcd_send_cmd
	line	93
;main.c: 93: lcd_send_cmd (0x28);
	movlw	(028h)
	fcall	_lcd_send_cmd
	line	94
;main.c: 94: lcd_send_cmd (0x0c);
	movlw	(0Ch)
	fcall	_lcd_send_cmd
	line	95
;main.c: 95: lcd_send_cmd (0x80);
	movlw	(080h)
	fcall	_lcd_send_cmd
	line	96
	
l596:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_send_data
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:

;; *************** function _lcd_send_data *****************
;; Defined at:
;;		line 69 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    4[COMMON] unsigned char 
;;  data_u          1    6[COMMON] unsigned char 
;;  data_l          1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Master_start
;;		_I2C_Master_write
;;		_I2C_Master_stop
;; This function is called by:
;;		_lcd_send_string
;; This function uses a non-reentrant model
;;
psect	text127
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	69
	global	__size_of_lcd_send_data
	__size_of_lcd_send_data	equ	__end_of_lcd_send_data-_lcd_send_data
	
_lcd_send_data:	
	opt	stack 5
; Regs used in _lcd_send_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_send_data@data stored from wreg
	line	71
	movwf	(lcd_send_data@data)
	
l1830:	
;main.c: 70: unsigned char data_l, data_u;
;main.c: 71: data_l = (data<<4)&0xf0;
	movf	(lcd_send_data@data),w
	movwf	(??_lcd_send_data+0)+0
	movlw	(04h)-1
u2225:
	clrc
	rlf	(??_lcd_send_data+0)+0,f
	addlw	-1
	skipz
	goto	u2225
	clrc
	rlf	(??_lcd_send_data+0)+0,w
	andlw	0F0h
	movwf	(??_lcd_send_data+1)+0
	movf	(??_lcd_send_data+1)+0,w
	movwf	(lcd_send_data@data_l)
	line	72
	
l1832:	
;main.c: 72: data_u = data&0xf0;
	movf	(lcd_send_data@data),w
	andlw	0F0h
	movwf	(??_lcd_send_data+0)+0
	movf	(??_lcd_send_data+0)+0,w
	movwf	(lcd_send_data@data_u)
	line	74
	
l1834:	
;main.c: 74: I2C_Master_start();
	fcall	_I2C_Master_start
	line	75
	
l1836:	
;main.c: 75: I2C_Master_write (0x42);
	movlw	low(042h)
	movwf	(?_I2C_Master_write)
	movlw	high(042h)
	movwf	((?_I2C_Master_write))+1
	fcall	_I2C_Master_write
	line	76
	
l1838:	
;main.c: 76: I2C_Master_write (data_u|0x0D);
	movf	(lcd_send_data@data_u),w
	movwf	(??_lcd_send_data+0)+0
	clrf	(??_lcd_send_data+0)+0+1
	movlw	0Dh
	iorwf	0+(??_lcd_send_data+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_data+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	77
	
l1840:	
;main.c: 77: I2C_Master_write (data_u|0x09);
	movf	(lcd_send_data@data_u),w
	movwf	(??_lcd_send_data+0)+0
	clrf	(??_lcd_send_data+0)+0+1
	movlw	09h
	iorwf	0+(??_lcd_send_data+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_data+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	79
	
l1842:	
;main.c: 79: I2C_Master_write (data_l|0x0D);
	movf	(lcd_send_data@data_l),w
	movwf	(??_lcd_send_data+0)+0
	clrf	(??_lcd_send_data+0)+0+1
	movlw	0Dh
	iorwf	0+(??_lcd_send_data+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_data+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	80
	
l1844:	
;main.c: 80: I2C_Master_write (data_l|0x09);
	movf	(lcd_send_data@data_l),w
	movwf	(??_lcd_send_data+0)+0
	clrf	(??_lcd_send_data+0)+0+1
	movlw	09h
	iorwf	0+(??_lcd_send_data+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_data+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	82
	
l1846:	
;main.c: 82: I2C_Master_stop();
	fcall	_I2C_Master_stop
	line	83
	
l587:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send_data
	__end_of_lcd_send_data:
;; =============== function _lcd_send_data ends ============

	signat	_lcd_send_data,4216
	global	_lcd_send_cmd
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:

;; *************** function _lcd_send_cmd *****************
;; Defined at:
;;		line 52 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    4[COMMON] unsigned char 
;;  data_u          1    6[COMMON] unsigned char 
;;  data_l          1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Master_start
;;		_I2C_Master_write
;;		_I2C_Master_stop
;; This function is called by:
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text128
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	52
	global	__size_of_lcd_send_cmd
	__size_of_lcd_send_cmd	equ	__end_of_lcd_send_cmd-_lcd_send_cmd
	
_lcd_send_cmd:	
	opt	stack 5
; Regs used in _lcd_send_cmd: [wreg+status,2+status,0+pclath+cstack]
;lcd_send_cmd@data stored from wreg
	line	54
	movwf	(lcd_send_cmd@data)
	
l1812:	
;main.c: 53: unsigned char data_l, data_u;
;main.c: 54: data_l = (data<<4)&0xf0;
	movf	(lcd_send_cmd@data),w
	movwf	(??_lcd_send_cmd+0)+0
	movlw	(04h)-1
u2215:
	clrc
	rlf	(??_lcd_send_cmd+0)+0,f
	addlw	-1
	skipz
	goto	u2215
	clrc
	rlf	(??_lcd_send_cmd+0)+0,w
	andlw	0F0h
	movwf	(??_lcd_send_cmd+1)+0
	movf	(??_lcd_send_cmd+1)+0,w
	movwf	(lcd_send_cmd@data_l)
	line	55
	
l1814:	
;main.c: 55: data_u = data&0xf0;
	movf	(lcd_send_cmd@data),w
	andlw	0F0h
	movwf	(??_lcd_send_cmd+0)+0
	movf	(??_lcd_send_cmd+0)+0,w
	movwf	(lcd_send_cmd@data_u)
	line	57
	
l1816:	
;main.c: 57: I2C_Master_start();
	fcall	_I2C_Master_start
	line	58
	
l1818:	
;main.c: 58: I2C_Master_write (0x42);
	movlw	low(042h)
	movwf	(?_I2C_Master_write)
	movlw	high(042h)
	movwf	((?_I2C_Master_write))+1
	fcall	_I2C_Master_write
	line	59
	
l1820:	
;main.c: 59: I2C_Master_write (data_u|0x0C);
	movf	(lcd_send_cmd@data_u),w
	movwf	(??_lcd_send_cmd+0)+0
	clrf	(??_lcd_send_cmd+0)+0+1
	movlw	0Ch
	iorwf	0+(??_lcd_send_cmd+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_cmd+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	60
	
l1822:	
;main.c: 60: I2C_Master_write(data_u|0x08);
	movf	(lcd_send_cmd@data_u),w
	movwf	(??_lcd_send_cmd+0)+0
	clrf	(??_lcd_send_cmd+0)+0+1
	movlw	08h
	iorwf	0+(??_lcd_send_cmd+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_cmd+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	62
	
l1824:	
;main.c: 62: I2C_Master_write(data_l|0x0C);
	movf	(lcd_send_cmd@data_l),w
	movwf	(??_lcd_send_cmd+0)+0
	clrf	(??_lcd_send_cmd+0)+0+1
	movlw	0Ch
	iorwf	0+(??_lcd_send_cmd+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_cmd+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	63
	
l1826:	
;main.c: 63: I2C_Master_write(data_l|0x08);
	movf	(lcd_send_cmd@data_l),w
	movwf	(??_lcd_send_cmd+0)+0
	clrf	(??_lcd_send_cmd+0)+0+1
	movlw	08h
	iorwf	0+(??_lcd_send_cmd+0)+0,w
	movwf	(?_I2C_Master_write)
	movf	1+(??_lcd_send_cmd+0)+0,w
	movwf	1+(?_I2C_Master_write)
	fcall	_I2C_Master_write
	line	65
	
l1828:	
;main.c: 65: I2C_Master_stop();
	fcall	_I2C_Master_stop
	line	66
	
l584:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send_cmd
	__end_of_lcd_send_cmd:
;; =============== function _lcd_send_cmd ends ============

	signat	_lcd_send_cmd,4216
	global	_I2C_Master_stop
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _I2C_Master_stop *****************
;; Defined at:
;;		line 106 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_send_cmd
;;		_lcd_send_data
;; This function uses a non-reentrant model
;;
psect	text129
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	106
	global	__size_of_I2C_Master_stop
	__size_of_I2C_Master_stop	equ	__end_of_I2C_Master_stop-_I2C_Master_stop
	
_I2C_Master_stop:	
	opt	stack 5
; Regs used in _I2C_Master_stop: []
	line	107
	
l1014:	
;main.c: 107: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	108
;main.c: 108: while(SSPIF == 0);
	goto	l605
	
l606:	
	
l605:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u31
	goto	u30
u31:
	goto	l605
u30:
	
l607:	
	line	109
;main.c: 109: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	110
	
l608:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_stop
	__end_of_I2C_Master_stop:
;; =============== function _I2C_Master_stop ends ============

	signat	_I2C_Master_stop,88
	global	_I2C_Master_write
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _I2C_Master_write *****************
;; Defined at:
;;		line 120 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;  data            2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_send_cmd
;;		_lcd_send_data
;; This function uses a non-reentrant model
;;
psect	text130
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	120
	global	__size_of_I2C_Master_write
	__size_of_I2C_Master_write	equ	__end_of_I2C_Master_write-_I2C_Master_write
	
_I2C_Master_write:	
	opt	stack 5
; Regs used in _I2C_Master_write: [wreg]
	line	121
	
l1012:	
;main.c: 121: SSPBUF = data;
	movf	(I2C_Master_write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	122
;main.c: 122: while(SSPIF == 0);
	goto	l617
	
l618:	
	
l617:	
	btfss	(99/8),(99)&7
	goto	u21
	goto	u20
u21:
	goto	l617
u20:
	
l619:	
	line	123
;main.c: 123: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	124
	
l620:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_write
	__end_of_I2C_Master_write:
;; =============== function _I2C_Master_write ends ============

	signat	_I2C_Master_write,4216
	global	_I2C_Master_start
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _I2C_Master_start *****************
;; Defined at:
;;		line 99 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_send_cmd
;;		_lcd_send_data
;; This function uses a non-reentrant model
;;
psect	text131
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	99
	global	__size_of_I2C_Master_start
	__size_of_I2C_Master_start	equ	__end_of_I2C_Master_start-_I2C_Master_start
	
_I2C_Master_start:	
	opt	stack 5
; Regs used in _I2C_Master_start: []
	line	100
	
l1010:	
;main.c: 100: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	101
;main.c: 101: while(SSPIF == 0);
	goto	l599
	
l600:	
	
l599:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u11
	goto	u10
u11:
	goto	l599
u10:
	
l601:	
	line	102
;main.c: 102: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	103
	
l602:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_start
	__end_of_I2C_Master_start:
;; =============== function _I2C_Master_start ends ============

	signat	_I2C_Master_start,88
	global	_I2C_init
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _I2C_init *****************
;; Defined at:
;;		line 45 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text132
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\I2C_Multi_slave\main.c"
	line	45
	global	__size_of_I2C_init
	__size_of_I2C_init	equ	__end_of_I2C_init-_I2C_init
	
_I2C_init:	
	opt	stack 7
; Regs used in _I2C_init: [wreg+status,2]
	line	46
	
l1004:	
;main.c: 46: SSPSTAT = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(148)^080h	;volatile
	line	47
	
l1006:	
;main.c: 47: SSPCON = 0b00101000;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	48
	
l1008:	
;main.c: 48: SSPADD = 0x3F;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	49
	
l581:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_init
	__end_of_I2C_init:
;; =============== function _I2C_init ends ============

	signat	_I2C_init,88
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
