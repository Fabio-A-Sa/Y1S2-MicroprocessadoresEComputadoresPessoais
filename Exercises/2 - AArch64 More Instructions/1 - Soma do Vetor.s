.text
.global SOMA_V
.type SOMA_V, "function"

// Pretende-se calcular a soma dos N elementos de um vetor (array)

SOMA_V:	MOV W5, 0
loop: 	CBZ W1, finish
	LDR X3, [X0]
	ADD X5, X5, X3
	ADD X0, X0, 4
	SUB W1, W1, 1
	B loop
finish: MOV X0, X5
	RET