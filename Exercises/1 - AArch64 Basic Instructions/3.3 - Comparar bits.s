.text
.global compair
.type compair, "function"

compair: MOV X2, #0
		MOV X3, #1
loop: 	AND X4, X0, X3
	AND X5, X1, X3
	EOR X6, X5, X4
	CMP X6, 0
	B.NE jump
	ADD	X2, X2, X3
jump: 	LSR X0, X0, X3
	LSR X1, X1, X3
	CMP X0, #0
	B.NE loop
	CMP X1, #0
	B.NE loop
	MOV X0, X2
	RET