.text
.global CheckABS
.type CheckABS, "function"

CheckABS: 	MOV X7, 0
			MOV X5, 0
			MOV X6, 0
loop: 		CBZ X1, finish
			LDRSW X4, [X2, X5]
			CMP X4, X6
			B.GE pula1
			NEG X4, X4
pula1: 		CMP X4, X0
			B.LS pula2
			ADD X7, X7, 1
			STR X6, [X2, X5]
pula2: 		SUB X1, X1, 1
			ADD X5, X5, 4
			b loop
finish: 	MOV X0, X7
			RET