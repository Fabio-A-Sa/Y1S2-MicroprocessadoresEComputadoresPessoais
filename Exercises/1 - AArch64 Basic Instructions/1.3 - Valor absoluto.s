.text
.global absolute
.type absolute, "function"

// Retornar o valor absoluto de X0

absolute: 	CMP X0, #0
		B.GE finish
		NEG X0, X0
finish: 	RET
