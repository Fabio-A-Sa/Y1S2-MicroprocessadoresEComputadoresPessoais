.text
.global MAX_W
.type MAX_W, "function"

// o valor máximo de um vetor com dados do tipo word

MAX_W:	MOV W2, -2147483647
	MOV X4, 0

LOOP:	CBZ X1, FINISH
	LDR W3, [X0, X4]
	ADD X4, X4, 4
	SUB X1, X1, 1
	CMP W3, W2
	B.LE LOOP
	MOV W2, W3
	B LOOP

FINISH: MOV W0, W2
	RET