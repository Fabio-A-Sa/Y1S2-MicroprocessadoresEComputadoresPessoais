.text
.global circle
.type circle, "function"

circle: 	FCMP S0, #0.0
			B.LE NOT
			FCMP S1, #0.0
			B.LE NOT
			FMUL S0, S0, S0
			FMUL S1, S1, S1
			FADD S0, S1, S1
			MOV W7, 1
			UCVTF S7, W7
			FCMP S0, S7
			B.GE NOT
			MOV W0, 1
			RET
NOT:		MOV W0, 0
			RET
