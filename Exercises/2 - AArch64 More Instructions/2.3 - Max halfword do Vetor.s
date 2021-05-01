.text
.global MAX_HW
.type MAX_HW, "function"

// o valor máximo de um vetor com dados do tipo halfword

MAX_HW:	MOV W2, -10
	MOV X4, 0

LOOP:	CBZ X1, FINISH
	LDR W3, [X0, X4]
	ADD X4, X4, 4
	SUB X1, X1, 1
	CMP W3, W2
	B.LT LOOP
	MOV W2, W3
	B LOOP

FINISH: MOV W0, W2
	RET
