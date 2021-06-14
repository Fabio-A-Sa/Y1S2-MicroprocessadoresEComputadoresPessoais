.text
.global subrotina
.type subrotina, "function"

subrotina: 	FSUB S0, S0, S0

Loop: 		CBZ W0, Finish
			LDR Q6, [X1], 16
			LDR Q7, [X2], 16
			FADD V7.4S, V7.4S, V7.4S
			FSUB V5.4S, V6.4S, V7.4S
			FABS V5.4S, V5.4S
			FMAXV S1, V5.4S
			FCMP S1, S0
			B.LS Jump
			FMOV S0, S1
Jump:		SUB W0, W0, 4
			B Loop
Finish: 	RET
