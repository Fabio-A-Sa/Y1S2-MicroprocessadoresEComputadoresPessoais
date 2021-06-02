// Fábio Araújo de Sá
// Junho, 2021

.text
.global histo
.type histo, "function"

// W0 --> Tamanho de C, unsigned int, 32 bits
// X1 --> Apontador para o início de C, pointer, 64 bits
// X2 --> Apontador para o início de H, pointer, 64 bits

histo: 	MOV W7, W0 						// Número de notas guardado em W7 para fazer a média no final
		MOV W6, 0 						// W6 fica como acumulador de todas as notas

loop:	CBZ W0, Finish					// Se chegou ao final do vector das notas, acabar
		LDR Q0, [X1], 16				// Fazer load das primeiras 16 notas
		ADDV B5, V0.16B					// B5 fica com a soma de todos os valores de notas
		MOV W5, V5.S[0]					// Colocar em W5 o valor acumulado no primeiro slot S do vector V5
		ADD W6, W6, W5					// Acumular o valor obtido
		SUB W0, W0, 16					// Já só faltam W0-16 notas a verificar
		MOV W9, 20						// W9 é ao mesmo tempo a nota a comparar e o offset do vector H

search: CMP W9, 0						// Se chegar a -1, volta ao main loop
		B.LT loop
		DUP V4.16B, W9					// Replicar o valor de W9 por todo o vector V4
		CMEQ V6.16B, V0.16B, V4.16B		// Comparar cada byte dos vectores (V0 e V4), para ver se são iguais à nota pretendida. Se sim, fica o respectivo byte "a uns (1)".
		ADDV B6, V6.16B					// B6 fica
		MOV W4, V6.S[0]
		CBZ W4, jump					// Se a nota não estiver presente no conjunto de 16 notas, então pula estes passos todos
		MOV W11, 255					// Se existir algum valor igual à nota, a soma da linha 28 resulta em overflow. W11 fica com o maior valor possível para um byte.
		SUB W4, W11, W4					// Número de ocorrências = 255 - W4 + 1
		ADD W4, W4, 1
jump: 	LDRB W3, [X2, X9]				// Buscar o valor antigo do Histograma, W3
		ADD W4, W4, W3					// Adicionar W3 à frequência absoluta obtida neste conjunto de 16 notas, W4
		STRB W4, [X2, X9]				// Fazer store desse novo valor no histograma
		SUB W9, W9, 1					// Agora é altura de verificar quantos W9-1 existem no conjunto de 16 notas, voltando ao Search
		B search

Finish: SCVTF S7, W7					// Converter o número de notas para vírgula flutuante, precisão simples (float)
		SCVTF S6, W6					// Converter o número acumulado de notas para vírgula flutuante, precisão simples (float)
		FDIV S0, S6, S7					// Uma média simples (S6/S7), colocada em S0 para poder retornar para o código C++
		RET
