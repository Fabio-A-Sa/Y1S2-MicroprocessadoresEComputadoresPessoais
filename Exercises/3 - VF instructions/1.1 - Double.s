.text
.global op1
.type op1, "function"

op1: FADD D0, D0, D2
	FMUL D0, D0, D1
	FNEG D0, D0
	RET
