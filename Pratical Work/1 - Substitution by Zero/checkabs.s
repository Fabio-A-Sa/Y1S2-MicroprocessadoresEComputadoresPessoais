.text
.global CheckABS
.type CheckABS, "function"

CheckABS: 	MOV W7, 0
			MOV X5, 0
			MOV W6, 0
loop: 		CBZ W1, finish
			LDR W4, [X2, X5]
			CMP W4, W6
			B.GE pula1
			NEG W4, W4
pula1: 		CMP W4, W0
			B.LS pula2
			ADD W7, W7, 1
			STR W6, [X2, X5]
pula2: 		SUB W1, W1, 1
			ADD W5, W5, 4
			b loop
finish: 	MOV W0, W7
			RET

