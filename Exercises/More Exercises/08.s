.text
.global words
.type words, "function"

// X0 --> Endereço base da sequência
// W1 --> Número de elementos (múltiplo de 16)

words:		MOV W7, 0
			MOV W6, #' '
			DUP V1.16B, W6
Loop:		CBZ W1, Finish
			LDR Q0, [X0], #16
			CMEQ V2.16B, V1.16B, V0.16B
			ADDV B2, V2.16B
			SMOV W4, V2.B[0]
			CMP W4, #0
			B.GT Jump
			NEG W4, W4
Jump:		ADD W7, W7, W4
			SUB W1, W1, #16
			B Loop
Finish: 	ADD W0, W7, #1
			RET
