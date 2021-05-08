.text
.global VECTOR_PROD
.type VECTOR_PROD, "function"

// Produto interno – assumir que não ocorre overow durante o cálculo

VECTOR_PROD: MOV W7	, 0
LOOP: CBZ W2, FINISH
	LDR W4, [X0]
	LDR W5, [X1]
	MUL W6, W4, W5
	ADD W7, W7, W6
	ADD X0, X0, 4
	ADD X1, X1, 4
	SUB W2, W2, 1
	B LOOP

FINISH: MOV W0, W7
	RET