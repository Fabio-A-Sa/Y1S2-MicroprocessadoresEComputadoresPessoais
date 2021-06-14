.text
.global Func
.type Func, "function"

Func: 		MOV W7, 2
			UCVTF D1, W7
			FCMP D0, D1
			B.GE SECOND
			FSQRT D7, D0
			FADD D0, D0, D0
			FSUB D0, D7, D0
			RET
SECOND:		FMUL D7, D0, D0
			FMUL D0, D0, D7
			RET
