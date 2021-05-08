.text
.global SIGN
.type SIGN, "function"

// Determinar a posição do bit 1 mais significativo da representação binária de um número

SIGN: CLZ X1, X0
	MOV X2, 64
	SUB X2, X2, X1
	MOV X0, X1
	RET

