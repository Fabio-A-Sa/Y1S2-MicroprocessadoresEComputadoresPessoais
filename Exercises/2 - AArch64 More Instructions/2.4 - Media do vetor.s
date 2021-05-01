.text
.global MED_DW
.type MED_DW, "function"

// O valor médio de um vetor com dados de 64 bits

MED_DW:	MOV X6, 0
	MOV X7, X1
	MOV x4, 0

LOOP:	CBZ X1, FINISH
	LDR X2, [X0, X4]
	ADD X4, X4, 8
	ADD X6, X6, x2
	SUB X1, X1, 1
	B LOOP

FINISH: SDIV X0, X6, X7
	RET
