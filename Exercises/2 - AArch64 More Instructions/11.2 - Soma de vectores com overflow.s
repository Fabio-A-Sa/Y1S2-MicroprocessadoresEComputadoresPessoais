.text
.global VECTOR_SUM
.type VECTOR_SUM, "function"

// Adição de vetores – assumir que pode ocorrer overflow

VECTOR_SUM: CBZ W2, FINISH
	LDR W4, [X0]
	LDR W5, [X1]
	ADD W4, W4, W5
	STR W4, [X0]
	ADD X0, X0, 4
	ADD X1, X1, 4
	SUB W2, W2, 1
	B VECTOR_SUM

FINISH: RET