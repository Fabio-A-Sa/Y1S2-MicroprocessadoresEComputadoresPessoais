.text
.global half
.type half, "function"

// Verificar se os 32 bits mais significativos de X0 são iguais aos seus 32 bits menos significativos.

half: 	MOV X7, #1
		MOV X2, #32
		MOV W1, W0
		LSR X0, X0, X2
		CMP W1, W0
		B.EQ finish
		MOV X7, #0
finish: MOV X0, X7
		RET
