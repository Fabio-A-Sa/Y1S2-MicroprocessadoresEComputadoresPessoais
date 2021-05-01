.text
.global higher
.type higher, "function"

// Colocar no registo X0 o maior dos valores dos registos X0 e X1

higher: 	CMP X0, X1;
		B.GE finish
		MOV X0, X1;
finish:		RET
