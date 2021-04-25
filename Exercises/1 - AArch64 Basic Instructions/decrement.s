.text
.global decrement
.type decrement, "function"

// Decrementar de uma unidade o valor de X0

decrement: 	SUB X0, X0, #1
		RET
