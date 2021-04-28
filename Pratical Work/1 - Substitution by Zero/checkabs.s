.text
.global CheckABS
.type CheckABS, "function"

CheckABS: MOV X3, #0
	MOV X5, #0
	MOV X6, #0
loop: CBZ X1, finish
	LDR X4, [X2, X5]
	CMP X4, #0
	B.GE jump1
	NEG X4, X4
jump1: CMP X4, X0
	B.HI jump2
	ADD X3, X3, #1
	STR X6, [X2, X5]
jump2: SUB X1, X1, #1
	ADD X5, X5, #8   // Atention
	B loop

finish: MOV X0, X3
	RET
