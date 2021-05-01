.text
.global N_RANGE
.type N_RANGE, "function"

// O número de valores de um vetor que pertencem ao intervalo [a; b]

N_RANGE: MOV X4, 0
	MOV X5, 0

LOOP: CBZ X1, FINISH
	LDRSW X6, [X0, X5]
	SUB X1, X1, 1
	ADD X5, X5, 4
	CMP X6, X2
	B.LT LOOP
	CMP X6, X3
	B.GT LOOP
	ADD X4, X4, 1
	B LOOP

FINISH: MOV X0, X4
	RET
