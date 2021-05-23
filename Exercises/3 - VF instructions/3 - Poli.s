.data
	a1: .float 1.5
	a2: .float 12.5
	a3: .float 7
	increment: .float 0.1
	initial: .float 0
.text
.global pol
.type pol, "function"

pol: LDR S0, a1
	LDR S1, a2
	LDR S2, a3
	LDR S3, increment
	LDR S4, initial
	MOV X1, 101

loop: CBZ X1, Finish

	FMUL S6, S7, S7
	FMUL S7, S6, S7
	FMUL S7, S7, S0

	FMUL S5, S4, S1
	FSUB S7, S7, S5
	FADD S7, S7, S2

	STR S7, [X0]
	ADD X0, X0, 4
	FADD S4, S4, S3
	SUB X1, X1, 1
	B loop

Finish: RET

