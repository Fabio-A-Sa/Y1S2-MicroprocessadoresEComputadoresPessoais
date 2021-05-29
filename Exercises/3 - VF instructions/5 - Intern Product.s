.data
	zero: .double 0.0
.text
.global intern
.type intern, "function"

intern: LDR D0, zero
loop: CBZ W2, Finish
	LDR S1, [X1], 4
	LDR S2, [X2], 4
	FCVT D1, S1
	FCVT D2, S2
	FMUL D1, D1, D2
	FADD D0, D1, D0
	SUB W2, W2, 1
	B loop
Finish: RET
