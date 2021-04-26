.text
.global alphabetic
.type alphabetic, "function"

alphabetic: MOV X0, 0   // contador
	LDR X1, [0x000000000AF008H]  // minimo
	LDR X2, [0x000000000BB00FH]  // maximo
	LDR X3, [0x41H]		// primeira letra
	LDR X4, [0x5AH]	// última letra
	MOV X5, #0			// offset
	mov X6, X1			// caso base, que vai ter o current value a ser testado
	mov X7, X3

loop: CMP X6, X2
	B.HI finish
	LDR X6, [X1, X5]	// X6 contém a possível letra

search: CMP X3, X4
	B.HI loop
	CMP X6, X3
	B.NE jump
	ADD X0, X0, #1
jump: ADD X3, X3, #1
	MOV X3, X7
	ADD X5, X5, #1
	B search

finish: RET