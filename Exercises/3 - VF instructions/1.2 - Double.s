.text
.global op2
.type op2, "function"

op2: FSQRT D3, D1
	FADD D0, D3, D0
	RET
