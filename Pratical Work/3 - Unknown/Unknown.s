.text
.global OpMat
.type OpMat, "function"

OpMat: 		STP X29, X30, [SP, -16]!
			MOV X29, SP

Loop: 		LDRB W4, [X2]
			CMP W4, 88
			B.EQ Finish
			CMP W4, 76
			B.EQ option_L
			CMP W4, 67
			B.EQ option_C

option_L:	ADD X2, X2, 1
			LDRB W4, [X2]
			ADD X2, X2, 1
			LDRB W5, [X2]
			MUL W6, W4, W0
			ADD W7, W6, W0
Loop_L:		CMP W6, W7
			B.EQ Line_comp
			STRB W5, [X3, X6]
			ADD X6, X6, 1
			B Loop_L
Line_comp: 	ADD X2, X2, 1
			B Loop



option_C:	ADD X2, X2, 1
			LDRB W4, [X2]
			ADD X2, X2, 1
			LDRB W5, [X2]
			MOV W6, W4
			MUL W7, W0, W1
Loop_C:		CMP W6, W7
			B.HI Col_comp
			STRB W5, [X3, X6]
			ADD X6, X6, X0
			B Loop_C
Col_comp: 	ADD X2, X2, 1
			B Loop


Finish: LDP X29, X30, [SP], 16
	RET
