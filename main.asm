
;--------------- Vector Definition ----------------------------------------
;--------------------------------------------------------------------------
		ORG		0x000		
		lgoto	V_Main
		
		ORG		0x008
		lgoto   V_INT  


        ORG		0x010  
; =========================================================================
;--------------- File Include ---------------------------------------------
;--------------------------------------------------------------------------
#include		NY8A051F.H				; The Header File for NY8A051F
#include		Register.asm
#include		Initialize.asm
#include		function.asm

;--------------- Code Start -----------------------------------------------
;--------------------------------------------------------------------------
V_Main:
 		Lcall	Initialize_GPIO
 		Lcall	Initialize_FSR
 		;Lcall	Initialize_Timer0
 		Lcall	Initialize_Timer1
		eni
		
		movia	0
		movar	xdat1
		movia	0
		movar	xdat2
		movia	0
		movar	xdat3
;--------------------------------------------------------------		
L_MainLoop:		
		clrwdt                  ; Clear WatchDog 
		clrwdt
		clrwdt
		
		btrss	T_flag
		lgoto	L_MainLoop
		bcr		T_flag			;100us
			
		btrss	ON_flag
		Lcall	Send_data2
		bsr		ON_flag
		
		incr	int_time1,r
		movr	int_time1,a
		xoria	200
		btrss	status,z
		lgoto	L_MainLoop
		clrr	int_time1		;20ms
			
		bcr		ON_flag
		incr	xdat2,r
		movr	xdat2,a
		xoria	255
		btrss	status,z
		lgoto	L_MainLoop
		
		lgoto	L_MainLoop
	
Send_data2:
		movr	xdat1,a
		movar	dat1
		movr	xdat2,a
		movar	dat2
		movr	xdat3,a
		movar	dat3
		movia	24
		movar	cnt
		
Send_data21:
		bcr		portb,0
		btrsc	dat1,7
		lgoto	Send_data22
		
		bsr		portb,0
		rlr		dat3,r
		rlr		dat2,r
		bcr		portb,0
		rlr		dat1,r

		decrsz	cnt,r
		lgoto	Send_data21
		bcr		portb,0
		ret
		
Send_data22:
		bsr		portb,0
		rlr		dat3,r
		rlr		dat2,r
		rlr		dat1,r
		nop
		nop
		decrsz	cnt,r
		lgoto	Send_data21
		bcr		portb,0
		ret
		
		
Send_data211:
		bcr		portb,0
		btrss	dat1,7
		lgoto	Send_data22
		
		bsr		portb,0
		rlr		dat3,r
		rlr		dat2,r
		rlr		dat1,r
		nop
		nop
		decrsz	cnt,r
		lgoto	Send_data21
		bcr		portb,0
		ret
		
Send_data221:
		bsr		portb,0
		rlr		dat3,r
		rlr		dat2,r
		bcr		portb,0
		rlr		dat1,r
		decrsz	cnt,r
		lgoto	Send_data21
		bcr		portb,0
		ret
		
Send_data:
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		bcr		portb,0
		lgoto	$+1
	;	
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
	;
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		
		bsr		portb,0
		lgoto	$+1	
		bcr		portb,0
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		lgoto	$+1
		ret
		;decr	
;========================================
;按键扫描	
Scan_key:
		movr	key_cur,a
		movar	key_per
		comr	pb,a
		andia	0x28
		movar	key_cur
;-------------按下有效----------------
		comr	key_per,a
		andar	key_cur,a
		movar	key_down

;-------------长按有效----------------		
		movr	key_cur,a
		andar	key_per,a
		movar	key_keep
		
		Lcall	long_key
		ret
	
;==============================
long_key:
	movr	long_mode,a
	addar	pcl,r
	lgoto	long_key_0
	lgoto	long_key_1
	lgoto	long_key_2
	
;----------------
long_key_0:	
	btrss	key_down,key1
	ret
	
	clrr	long_time
	incr	long_mode,r
	ret
	
;
long_key_1:	
	btrss	key_keep,key1
	lgoto	long_key_12
	
	incr	long_time,r
	movr	long_time,a
	xoria	150
	btrss	status,z
	ret
	incr	long_mode,r
	
	
	ret
	
long_key_12:
	clrr	long_mode
	ret
	
;
long_key_2:	
	btrss	key_keep,key1
	clrr	long_mode
	ret


	
;--------------- Interrupt Service Routine --------------------------------
;--------------------------------------------------------------------------
V_INT:		
		movar	acc_temp
		swapr	status,a
		movar	status_temp
		
		;btrss	INTF,C_INT_LVD_Bit	
		;lgoto	TIME1_INT
		
		;movia   ~C_INT_LVD              
		;movar	INTF  
		
		;bcr		on_flag
		;;movia	0x1f
		;movar	portb
		;movia	0x0f
		;xorar	portb,r
		
TIME1_INT:
		btrss	INTF,C_INT_TMR1_Bit	
		lgoto	V_retie
		
		movia   ~C_INT_TMR1              
		movar	INTF 
		
		;movia	0x0f
		;xorar	portb,r
		bsr		T_flag
		
V_retie:
		swapr	status_temp,a
		movar	status	
		swapr	acc_temp,r
		swapr	acc_temp,a		
	    retie                           ; Return from interrupt and enable interrupt globally
	
end                                     ; End of Code
		