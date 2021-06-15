.text
.global bits
.type bits, "function"

bits: 	FRINTI D0, D0
		FCVTNS W0, D0
		RET
