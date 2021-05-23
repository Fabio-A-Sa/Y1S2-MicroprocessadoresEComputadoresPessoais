.data
	a1: .float 1.5
	a2: .float -12.5
	a3: .float 7
.text
.global pol
.type pol, "function"

pol: LDR S0, a1
	LDR S1, a2
	LDR S2, a3
	MOV X1, 10
loop: CBZ X1, Finish
	LDR S5, [X0]
	FMOV S7, S5
	FMUL S6, S7, S7
	FMUL S7, S7, S6
	FMUL S7, S7, S0
	FMUL S5, S5, S1
	FADD S4, S5, S2
	FADD S4, S5, S7
	STR S4, [X0]
	ADD X0, X0, 1
	SUB X1, X1, 1
	B loop

Finish: RET
