.text
.global VECTOR_MULT
.type VECTOR_MULT, "function"

// Multiplicação de um vetor por um inteiro – assumir que o vetor original é substituído pelo vetor resultante (assumir a não ocorrência de overow).

VECTOR_MULT: CBZ W2, FINISH
	LDR W4, [X0]
	MUL W4, W4, W1
	STR W4, [X0]
	ADD X0, X0, 4
	SUB W2, W2, 1
	B VECTOR_MULT

FINISH: RET