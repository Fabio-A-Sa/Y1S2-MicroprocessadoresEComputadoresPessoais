.text
.global MIN_DW
.type MIN_DW, "function"

// o valor mínimo de um vetor com dados do tipo doubleword

MIN_DW:	MOV X2, 46183
	MOV X4, 0

LOOP:	CBZ X1, FINISH
	LDRSW X3, [X0, X4]
	ADD X4, X4, 8
	SUB X1, X1, 1
	CMP X3, X2
	B.GT LOOP
	MOV X2, X3
	B LOOP

FINISH: MOV X0, X2
	RET
