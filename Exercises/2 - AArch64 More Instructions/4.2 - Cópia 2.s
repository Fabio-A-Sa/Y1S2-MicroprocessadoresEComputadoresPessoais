.text
.global COPY2
.type COPY2, "function"

// Copiar um vetor com valores (com sinal) do tipo word para um vetor com valores do tipo doubleword

COPY2: CBZ W2, FINISH
	LDRSW X5, [X0]
	STR X5, [X1]
	ADD X0, X0, 4
	ADD X1, X1, 8
	SUB W2, W2, 0
	B COPY2

FINISH: RET
