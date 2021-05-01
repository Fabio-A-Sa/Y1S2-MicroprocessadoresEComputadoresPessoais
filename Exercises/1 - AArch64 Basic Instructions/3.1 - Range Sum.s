.text
.global sum
.type sum, "function"

// Somar os valores 11, 21, 31,  ... 101 usando um ciclo

sum: 	MOV X3, #0
loop: 	CMP X0, X1
	B.GT finish
	ADD X3, X3, X0
	ADD X0, X0, X2
	B loop
finish: MOV X0, X3
	RET

