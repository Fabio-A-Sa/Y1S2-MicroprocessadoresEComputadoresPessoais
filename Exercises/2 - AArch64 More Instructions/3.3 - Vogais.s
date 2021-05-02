.text
.global VOWELS
.type VOWELS, "function"

// Determinar o número de vogais de uma cadeia de carateres

VOWELS: MOV X1, 0
LOOP: LDRB W2, [X0]
	ADD X0, X0, 1
	CBZ W2, FINISH
	CMP W2, 97
	B.EQ YES
	CMP W2, 101
	B.EQ YES
	CMP W2, 105
	B.EQ YES
	CMP W2, 111
	B.EQ YES
	CMP W2, 117
	B.EQ YES
	CMP W2, 65
	B.EQ YES
	CMP W2, 69
	B.EQ YES
	CMP W2, 73
	B.EQ YES
	CMP W2, 79
	B.EQ YES
	CMP W2, 85
	B.EQ YES
	B LOOP

YES: ADD X1, X1, 1
	B LOOP

FINISH: MOV X0, X1
	RET
