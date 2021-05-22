// Fábio Araújo de Sá, up202007658
// Maio, 2021

.text
.global OpMat
.type OpMat, "function"

// W0 --> Número de colunas, unsigned char, word, 32 bits (W)
// W1 --> Número de linhas, unsigned char, word, 32 bits (W)
// X2 --> Apontador do início das operações, pointer, 64 bits (X)
// X3 --> Apontador do início da matriz, pointer, 64 bits (X)

OpMat:		STP X29, X30, [SP, -64]!	// Alocação de memória da pilha (64 bytes --> Valor mínimo e múltiplo de 16 ...
			STP X0, X1, [SP, 16]		// ... suficiente para aguentar com o número de registos a preservar)
			STP X2, X3, [SP, 32]		// Vai guardar X29, X30, X0, X1, X2, X3, X4
			MOV X4, -1					// Inicialmente X4 é -1, valor a retornar quando acaba as operações ...
			MOV X5, 0					// ... caso não encontre nenhum 'O' no processo
			STP X4, X5, [SP, 48]
			MOV X29, SP					// X29 irá guardar, a partir de agora, o valor de SP atualizado
			CBZ W0, Finish				// Se o número de linhas ou de colunas for nulo ...
			CBZ W1, Finish				// ... não faz sentido fazer nada.

Loop: 		LDRB W4, [X2]				// Load Byte da primeira letra do array de operações
			CMP W4, 88					// Se for igual a 'X', então não faz mais nada --> Acaba imediatamente as operações
			B.EQ Finish
			CMP W4, 76					// Se for 'L', salta para a parte de operações da linha
			B.EQ option_L
			CMP W4, 67
			B.EQ option_C				// Se for 'C', salta para a parte de operações da coluna
			CMP W4, 80
			B.EQ option_P				// Se for 'P', salta para a parte de operações da linha e coluna
			CMP W4, 66
			B.EQ option_B				// Se for 'B', salta para a parte de operações de "binarização"
			CMP W4, 79
			B.EQ option_O				// Se for 'O', salta para a parte onde se chama a subrotina dos professores
			B Finish					// Se não for nenhuma letra das anteriores, estamos perante um caracter desconhecido -->
										// --> Acaba imediatamente as operações

option_L:	ADD X2, X2, 1				// Atualiza o apontador das operações
			LDRB W4, [X2]				// Load do número da linha a alterar
			ADD X2, X2, 1				// Atualiza o apontador das operações
			LDRB W5, [X2]				// Load do número a colocar nessa linha toda (W5)
			MUL W6, W4, W0				// W6 guarda o offset inicial da linha
			ADD W7, W6, W0				// W7 guarda o offset final da linha
Loop_L:		CMP W6, W7					// Enquanto W6 != W7, então muda o valor
			B.EQ Line_comp
			STRB W5, [X3, X6]			// O valor W5 é colocado na posição *(X3 + X6)
			ADD X6, X6, 1				// Atualização de W6 para coincidir com o próximo valor, nessa linha
			B Loop_L
Line_comp: 	ADD X2, X2, 1				// Atualização do apontador das operações
			B Loop


option_C:	ADD X2, X2, 1				// Atualiza o apontador das operações
			LDRB W4, [X2]				// Load do número da coluna a alterar
			ADD X2, X2, 1				// Atualiza o apontador das operações
			LDRB W5, [X2]				//
			MOV W6, W4
			MUL W7, W0, W1
Loop_C:		CMP W6, W7
			B.HI Col_comp
			STRB W5, [X3, X6]
			ADD X6, X6, X0
			B Loop_C
Col_comp: 	ADD X2, X2, 1
			B Loop

option_P:	ADD X2, X2, 1
			LDRB W4, [X2]
			ADD X2, X2, 1
			LDRB W5, [X2]
			ADD X2, X2, 1
			LDRB W6, [X2]
			MADD W7, W5, W0, W4
			STRB W6, [X3, X7]
			ADD X2, X2, 1
			B Loop

option_B:	ADD X2, X2, 1
			MUL W4, W0, W1
			MOV W5, 0
Loop_B: 	CMP W5, W4
			B.EQ Loop
			LDRB W6, [X3, X5]
			CMP W6, 0
			B.LT troca
			CMP W6, 127
			B.GT troca
			MOV W6, 0
			STRB W6, [X3, X5]
			ADD W5, W5, 1
			B Loop_B
troca: 		MOV W6, 255
			STRB W6, [X3, X5]
			ADD W5, W5, 1
			B Loop_B


option_O:	ADD X2, X2, 1
			STP X2, X3, [SP, 32]	// Guarda os apontadores X2 e X3 na pilha
			MOV X6, X2
			MUL X2, X0, X1			// X2 --> Tamanho da matriz
			MOV X1, X3				// X1 --> Apontador da matriz
			LDRB W0, [X6]			// W0 --> Valor a procurar
			BL ocorr
			MOV X4, X0
			STP X4, X5, [SP, 48]	// Mete na pilha o valor
			LDP X0, X1, [SP, 16]
			LDP X2, X3, [SP, 32]
			LDP X29, X30, [SP]
			ADD X2, X2, 1
			B Loop

Finish:		LDP X4, X5, [SP, 48]	// X4 guarda o último valor da subrotina ocorr
			MOV X0, X4				// Retorna assim o valor de X4
			LDP X29, X30, [SP], 64 	// Recolocar o SP para o topo da pilha original
			RET
