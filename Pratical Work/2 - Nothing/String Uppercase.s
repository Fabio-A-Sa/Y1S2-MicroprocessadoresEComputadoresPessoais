.text
.global SelectedUpperCase
.type SelectedUpperCase, "function"

SelectedUpperCase: MOV W7, 0 // Contador
	MOV X6, X0
LOOP: LDRB W2, [X1]
	CBZ W2, FINISH
	ADD X1, X1, 1
	MOV X0, X6
	CMP W2, 122
	B.GT LOOP
	CMP W2, 97
	B.LT LOOP
	// A partir daqui já sei que a letra é minúscula, já posso alterar
SEARCH: LDRB W3, [X0]
	CBZ W3, LOOP
	ADD X0, X0, 1
	CMP W2, W3
	B.NE SEARCH
	SUB W4, W2, 42
	SUB X1, X1, 1
	STRB W4, [X1]
	ADD X1, X1, 1
	ADD W7, W7, 1
	B LOOP

FINISH: MOV W0, W7
	RET

