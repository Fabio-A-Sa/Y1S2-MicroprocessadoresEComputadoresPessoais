.text
.global apply_func
.type apply_func, "function"

// X0 --> Endereço-base da sequência
// W1 --> Número de elementos da sequência

apply_func: 	STP X29, X30, [SP, -48]!	// Formação da Moldura
				MOV X29, SP					// X29 fica com o valor de SP
				MOV W7, 0					// Index da sequência
Loop: 			CBZ W1, Finish				// Se já chegou ao final do vector, retorna
				SUB W1, W1, 1				// Só faltam W1-1 valores a calcular
				LDR D0, [X0]				// D0 fica com o valor double
				MOV W6, 3					// W6 fica com o valor de 3
				UCVTF D6, W6				// D6 fica com 3 em double
				FDIV D7, D0, D6				// Segunda parte da fração
				STP X0, X1, [SP, 16]		// Guardar os valores que interessam
				STR D7, [SP, 32]			// É importante guardar também o valor de D7 na pilha
				STR X7, [SP, 40]			//	É importante guardar também o valor de w7 na pilha
				MOV W1, W7					// Colocar o índice em W1
				//B func						// D0 fica com o valor retornado pela função
				LDP X0, X1, [SP, 16]		// Recolocar tudo como estava
				LDP X29, X30, [SP]			// Recolocar tudo como estava
				LDR D7, [SP, 32]			// Reaver o valor de D7
				LDR W7, [SP, 40]			// Reaver o valor de X7
				FSUB D0, D0, D7				// D0 fica com o falor final
				STR D0, [X0], 8				// Fazer store do valor na mesma posição do índice
				ADD W7, W7, 1				// Atualizar o índice
				B Loop						// Regressar ao loop

Finish: 		LDP X29, X30, [SP], 48		// No final, recuperar os valores e ajustar a pilha para o valor original
				RET							// Retornar (void)