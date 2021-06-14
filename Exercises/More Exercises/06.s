.text
.global menorX
.type menorX, "function"

menorX: 		MOV X5, 0
				CBZ W1, Finish
				LDR X7, [X0], #16
				MOV X5, X7
				SUB W1, W1, 2
Loop:			CBZ W1, Finish
				LDR X7, [X0], #16
				CMP X5, X7
				B.GE Jump
				MOV X5, X7
Jump: 			SUB W1, W1, 2
				B Loop

Finish: 		MOV X0, X5
				RET