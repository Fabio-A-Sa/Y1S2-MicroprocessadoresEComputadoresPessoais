.text
.global exp
.type exp, "function"

exp: UCVTF D0, W0
	UCVTF D1, W1
	UCVTF D2, W2
	UCVTF D3, W3
	FSUB D4, D0, D1
	FMUL D4, D4, D2
	MOV W7, 3
	UCVTF D7, W7
	FADD D3, D3, D0
	FSUB D3, D3, D7
	FDIV D0, D4, D3
	RET
