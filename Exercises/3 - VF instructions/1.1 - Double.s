.text
.global op1
.type op1, "function"

op1: FSQRT D0, D0
	SCVTF D1, W0
	FADD D1, D0, D1
	RET
