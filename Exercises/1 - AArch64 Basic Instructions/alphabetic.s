.text
.global alphabetic
.type alphabetic, "function"

alphabetic: MOV X0, 0   // contador
	MOV X1, #0x0AF008H  // minimo
	MOV X2, #0x0BB00FH  // maximo
	MOV X3, #0x41H		// primeira letra
	MOV X4, #0x5AH		// última letra
	MOV X5, #0			// offset
	mov X6, X1			// caso base
	mov X7, X3

loop: CMP X6, X2
	B.HI finish
	LDR X6, [X1, X5]	// X6 contém a possível letra

search: CMP X6, X3
	B.NE jump
	ADD X0, X0, #1
jump: CMP X3, X4
	B.
	MOV X3, X7
	ADD X5, X5, #1
	B loop

finish: RET