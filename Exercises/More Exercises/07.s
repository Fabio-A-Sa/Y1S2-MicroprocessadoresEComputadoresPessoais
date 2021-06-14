.text
.global PONTO
.type PONTO, "function"

// X0 --> Endereço-base da sequência de valores
// W1 --> Número de valores da sequência

PONTO: 		STP X29, X30, [SP, #-40]!
			MOV X29, SP
			STP X0, X1, [SP, #16]
			B menorX
			MOV X7, X0
			LDP X29, X30, [SP]
			MOV X29, SP
			LDP X0, X1, [SP, #16]
			STR X7, [SP, #32]
			//B maiorY
			MOV X6, X0
			LDP X29, X30, [SP]
			LDP X0, X1, [SP, #16]
			LDR X7, [SP, #32]
			MOV W5, #0
Loop: 		CBZ W1, Finish
			SUB W1, W1, 1
			LDR X4, [X0], #16
			CMP X4, X7
			B.NE Loop
			LDR X3, [X0, #-8]
			CMP X3, X6
			B.NE Loop
			MOV W5, 1
Finish: 	LDP X29, X30, [SP], #40
			MOV W0, W5
			RET
