.text
.global OpMat
.type OpMat, "function"

OpMat:		STP X29, X30, [SP, -16]!
			MOV X29, SP

Loop: 		LDRB W4, [X2]
			CMP W4, 88
			B.EQ Finish
			CMP W4, 76
			B.EQ option_L
			CMP W4, 67
			B.EQ option_C
			CMP W4, 80
			B.EQ option_P
			CMP W4, 66
			B.EQ option_B
			CMP W4, 79
			B.EQ option_O
			B Finish

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

option_P:	ADD X2, X2, 1
			LDRB W4, [X2]
			ADD X2, X2, 1
			LDRB W5, [X2]
			ADD X2, X2, 1
			LDRB W6, [X2]
			MADD W7, W5, W0, W4
			STRB W6, [X3, X7]
			ADD X2, X2, 1
			B Loop

option_B:	ADD X2, X2, 1
			MUL W4, W0, W1
			MOV W5, 0
Loop_B: 	CMP W5, W4
			B.EQ Loop
			LDRB W6, [X3, X5]
			CMP W6, 0
			B.LT troca
			CMP W6, 127
			B.GT troca
			MOV W6, 0
			STRB W6, [X3, X5]
			ADD W5, W5, 1
			B Loop_B
troca: 		MOV W6, 255
			STRB W6, [X3, X5]
			ADD W5, W5, 1
			B Loop_B

option_O:	ADD X2, X2, 1
			MOV X7, X3
			MOV X6, X2
			MOV W5, W1
			MOV W4, W0

			MUL X2, X0, X1			// X2 --> Tamanho da matriz
			MOV X1, X3				// X1 --> Apontador da matriz
			LDRB W0, [X2]			// W0 --> Valor a procurar
			BL ocorr

			MOV X3, X7
			MOV X2, X6
			MOV W1, W5
			MOV W0, W4
			ADD X2, X2, 1
			B Loop

Finish: 	LDP X29, X30, [SP], 16
			MOV X0, 4
			RET

ocorr: MOV W0, 0
	RET
