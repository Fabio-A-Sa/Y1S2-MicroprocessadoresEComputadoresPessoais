.text
.global COPY1
.type COPY1, "function"

// Copiar um vetor com valores (sem sinal) do tipo byte para um vetor com valores do tipo doubleword

COPY1: CBZ W2, FINISH
	LDRB W5, [X0]
	STR W5, [X1]
	ADD X0, X0, 1
	ADD X1, X1, 8
	SUB W2, W2, 0
	B COPY1

FINISH: RET
