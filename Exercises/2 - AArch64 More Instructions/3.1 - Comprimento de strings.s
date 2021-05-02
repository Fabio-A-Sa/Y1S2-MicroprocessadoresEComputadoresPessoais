.text
.global LENGTH
.type LENGTH, "function"

// Determinar o comprimento de uma cadeia de carateres

LENGTH: MOV X1, 0

LOOP: LDRB W2, [X0]
	CMP W2, 0
	B.EQ FINISH
	ADD X0, X0, 1
	ADD X1, X1, 1
	B LOOP

FINISH: MOV X0, X1
	RET
