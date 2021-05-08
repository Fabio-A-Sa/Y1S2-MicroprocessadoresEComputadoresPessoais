.text
.global PALIND
.type PALIND, "function"

// Implementar um programa que determine se uma cadeia de carateres é palíndromo

PALIND: MOV W6, 0
	MOV X2, 0
	MOV X7, 0

CONT: LDRB W6, [X0]
	CBZ W6, COPY
	ADD W6, W6, 1
	B CONT

COPY: CBZ W6, COMPAIR
	LDRB W3, [X0]
	SUB X0, X0, 1
	SUB W6, W6, 1
	STRB w3, [X2]
	ADD X2, X2, 1

COMPAIR: LDRB W4, [X0]
	LDRB W5, [X1]
	CMP W4, W5
	B.NE FINISH
	ADD X7, X7, 1

FINISH: MOV X0, X7
	RET