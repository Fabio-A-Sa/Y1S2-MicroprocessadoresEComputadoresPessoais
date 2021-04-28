.text
.global CheckABS
.type CheckABS, "function"

CheckABS:

		MOV X3, 0          // Contador
		MOV X5, 0          // Offset
		MOV X6, 0          // Valor 0
loop:	CMP X1, 0
		B.EQ finish		   // Se chegou ao fim do array, retorna
		LDR X4, [X2, X5]   // X4 fica com cada valor do array, em sequência
		CMP X4, X6         // Compara X4 com 0
		B.GE pula
		NEG X4, X4		   // Se o número for negativo, nega, senão continua positivo
pula:	CMP X4, X0
		B.LT pula2
		ADD X3, X3, 1		// Se o valor absoluto no array for maior que o X0, aumenta o contador
		STR X6, [X2, X5]	// E substitui no vetor por zero
pula2:	SUB X1, X1, 1
		ADD X5, X5, 4
		b loop

finish: MOV X0, X3			// Retorna sempre o valor em X0
		RET

