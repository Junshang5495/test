;Sleep_Work
;Delay_nus	


;==============================================
Sleep_Work:	
		btrsc	on_flag
		lgoto	Sleep_ret
		btrss	pb,key1
		lgoto	Sleep_ret
		btrss	pb,key2
		lgoto	Sleep_ret
		
		incr	sleep_time,r
		movr	sleep_time,a
		xoria	10
		btrss	status	,z
		ret
		clrr	sleep_time	;20ms*10=200ms
		
		disi

		MOVIA		0x00
		MOVAR		PCON
		MOVIA		0x02
		MOVAR		INTE
	 	MOVIA		0x00
	 	MOVAR		INTF
	 	
	 	NOP
		NOP
		SLEEP
		NOP
		NOP
		MOVIA		0x00
		MOVAR		INTF
		MOVIA		0x88
		MOVAR		PCON
		;MOVIA		0x01
		;MOVAR		INTE
		bcr		INTE,C_INT_PBKey_Bit	;禁止IO中断
		;bsr		INTE,C_INT_TMR0_Bit
		bsr		INTE,C_INT_TMR1_Bit
		
		;MOVIA		0xA8	;开启LVD
		;MOVAR		PCON
		;lcall	initialize_io
		ENI
		
Sleep_ret:
		clrr	sleep_time
		ret
		
;==================================
Delay_nus:
		movar	Delay_1        
                
        decrsz	Delay_1,r
        lgoto	$-1
        ret