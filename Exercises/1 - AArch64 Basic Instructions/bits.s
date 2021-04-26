.text
.global bits
.type bits, "function"

// Contar o número de bits a 1 na representação binária do valor em X0

bits:	MOV X1, #0
	MOV X3, #1
loop:	CBZ X0, finish
	AND X2, X0, #1
	ADD X1, X1, X2
	LSR X0, X0, X3
	B loop
finish:	MOV X0, X1
	RET
