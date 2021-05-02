.text
.global BITS
.type BITS, "function"

// Implementar uma sub-rotina que determine o número mínimo de bits com que pode ser representado

BITS: MOV X1, 0
	MOV X2, 1
LOOP: CBZ X0, FINISH
	ADD X1, X1, 1
	LSR X0, X0, X2
	B LOOP

FINISH: MOV X0, X1
	RET