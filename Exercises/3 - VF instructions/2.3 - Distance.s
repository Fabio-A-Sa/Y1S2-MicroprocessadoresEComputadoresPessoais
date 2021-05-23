.text
.global dist
.type dist, "function"

dist: UCVTF D0, W0
	UCVTF D1, W1
	UCVTF D2, W2
	UCVTF D3, W3
	FSUB D0, D0, D2
	FMUL D0, D0, D0
	FSUB D1, D1, D3
	FMUL D1, D1, D1
	FADD D7, D0, D1
	FSQRT D0, D7
	RET