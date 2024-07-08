;===================================
;IO定义
key1			=	5
key2			=	3

#define	P_out	PB,4
#define	P_led1	PB,0
#define	P_led2	PB,1
#define	P_led3	PB,2
;===================================
;常数定义




;===================================
;寄存器定义
acc_temp		equ	0x10
status_temp		equ	0x11

flag1			equ	0x12
flag2			equ	0x13

key_cur			equ	0x14
key_per			equ	0x15
key_down		equ	0x16
key_keep		equ	0x17

Delay_1			equ	0x18
Delay_2			equ	0x19
Delay_3			equ	0x1a
int_time1		equ	0x1b
int_time2		equ	0x1c
sleep_time		equ	0x1d

long_mode		equ	0x20
long_time		equ	0x21
mode			equ	0x22
out_time		equ	0x23
out_on_buf		equ	0x24
out_buf			equ	0x25
R_PCON1			equ	0x26

temp1			equ	0x28
temp2			equ	0x29

cnt				equ	0x30
dat1			equ	0x31
dat2			equ	0x32
dat3			equ	0x33
xdat1			equ	0x34
xdat2			equ	0x35
xdat3			equ	0x36

;===================================
;标志位定义
;flag1
#define		T_flag	flag1,0
#define		ON_flag	flag1,1

;flag2
#define		T2_flag	flag2,0