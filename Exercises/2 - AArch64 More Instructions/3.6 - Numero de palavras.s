.text
.global SPACE
.type SPACE, "function"

// Contar quantas palavras tem uma cadeia de carateres

SPACE: MOV X1, 0

LOOP: LDRB W2, [X0]
	ADD X0, X0, 1
	CBZ W2, FINISH
	CMP W2, 32
	B.NE LOOP
	ADD X1, X1, 1
	B LOOP

FINISH: ADD X0, X1, 1
	RET
