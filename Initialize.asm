;Initialize_GPIO
;Initialize_Timer0
;Initialize_Timer1
;Initialize_FSR
;Delay_nus

;=================================
;初始化IO
Initialize_GPIO:
		;movia   C_PB5_OD | C_PB4_OD
		;iost    BODCON					; Enable Open-Drain
		
       	;movia   ~( C_PB3_PLB |  C_PB2_PLB |  C_PB1_PLB |  C_PB0_PLB)		
        ;movar   BPLCON					; Enable Pull-Low Resistor
			
        movia   ~( C_PB5_PHB | C_PB3_PHB)
	    movar    BPHCON					; Enable Pull-High Resistor
								 
		movia	0x28
		movar	BWUCON
		
   ; PORTB I/O state                      
        movia   C_PB5_Input | C_PB3_Input
		iost    IOSTB					; 1=input	0=output
		
		movia   0x00
		movar   Pr_PB_Data	
		
		
		;movia	0xA0
		;movar	PCON
		;bsr		PCON,5
		;movia	C_LVD_3P0V
		;iost	PCON1
		
		;bsr		INTE,C_INT_LVD_Bit	;LVD中断
		ret
		
;=================================
;初始化定时器0
;Timer0=Tcpu*分频*（256-TMR0） 
TMR0_Temp	=	132
;Timer0=1us*8*（256-132）=1006US
Initialize_Timer0:
		movia	TMR0_Temp
		movar	TMR0
		
		;movia	C_TMR0_LowClk | C_TMR0_Clk | C_PS0_Div8 ;外部晶振
		movia	C_PS0_TMR0 | C_PS0_Div8 
		t0md
		
		bsr		INTE,C_INT_TMR0_Bit
		ret

;=================================
;初始化定时器1
;Timer1=Tcpu*分频*TMR1
Initialize_Timer1:			
        movia   199
        sfun    TMR1                   ; Load 0xFF to TMR1 (Initial Timer1 register)
        
        movia   C_TMR1_Reload | C_TMR1_En
        sfun    T1CR1                   ; Enable Timer1, Initial value reloaded from TMR1, Non-stop mode 
        
        movia   C_TMR1_ClkSrc_Inst | C_PS1_Div8
        sfun    T1CR2                   ; Enable Prescaler1, Prescaler1 dividing rate = 1:4, Timer1 clock source is instruction clock
            
        bsr		INTE,C_INT_TMR1_Bit
        ret
      
;=================================
;清SRAM
Initialize_FSR:	
		movia	0x10
		movar	fsr
Initialize_FSR1:
		clrr	indf
		incr	fsr,r
		movr	fsr,a
		xoria	0x3F
		btrss	status,z
		lgoto	Initialize_FSR1
		ret

