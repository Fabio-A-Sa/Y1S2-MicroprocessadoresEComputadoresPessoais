.text
.global UPPER
.type UPPER, "function"

// Determinar o número de letras maiúsculas de uma cadeia de carateres

UPPER: MOV X1, 0

LOOP: LDRB W2, [X0]
	ADD X0, X0, 1
	CBZ W2, FINISH
	CMP W2, 65
	B.LT LOOP
	CMP W2, 90
	B.GT LOOP
	ADD X1, X1, 1
	B LOOP

FINISH: MOV X0, X1
	RET
