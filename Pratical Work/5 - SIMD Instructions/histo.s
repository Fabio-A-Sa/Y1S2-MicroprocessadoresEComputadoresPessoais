// Fábio Araújo de Sá
// Junho, 2021

.text
.global histo
.type histo, "function"

// W0 --> Tamanho de C, unsigned int, 32 bits
// X1 --> Apontador para o início de C, pointer, 64 bits
// X2 --> Apontador para o início de H, pointer, 64 bits

histo: 		MOV W7, W0						// W7 fica a guardar o número total de notas, para usar na média mais tarde

loop: 		CBZ W0, Average					// Se chegou ao final do vector das notas, vai fazer a média com o histograma construído
			LDR Q0, [X1], #16				// Fazer load das primeiras 16 notas
			SUB W0, W0, #16					// Já só faltam W0-16 notas a verificar
			MOV W9, #20						// W9 é ao mesmo tempo a nota a comparar e o offset do vector H

Search: 	CMP W9, #0						// Se chegar a -1, volta ao main loop
			B.LT loop
			DUP V1.16B, W9					// Replicar o valor de W9 por todo o vector V4
			CMEQ V1.16B, V0.16B, V1.16B		// Comparar cada byte dos vectores (V0 e V1), para ver se são iguais à nota pretendida. Se sim, fica o respectivo byte "a uns (1)".
			ADDV B2, V1.16B					// B2 fica com o número complementar da frequência dessa nota no vector
			MOV W4, V2.S[0]					// W4 fica com o número de ocorrências dentro daquela sequência de notas (mas ainda é um número negativo!)
			NEG W4, W4						// -(-W4) = W4 (valor positivo)
			LDRB W3, [X2, X9]				// Buscar o valor antigo do Histograma, W3
			ADD W4, W4, W3					// Adicionar W3 à frequência absoluta obtida neste conjunto de 16 notas, W4
			STRB W4, [X2, X9]				// Fazer store desse novo valor no mesmo local do Histograma
			SUB W9, W9, #1					// Agora é altura de verificar quantos W9-1 existem no conjunto de 16 notas, voltando ao Search
			B Search

Average: 	MOV W5, #20						// X5 fica responsável pelo offset dentro do Histograma (que também coincide, em cada byte, com o valor da nota associada)
			MOV X0, #0						// X0 será a soma total de todos os valores que o histograma representa

GetGrades:  CBZ W5, Finish					// Se chegar ao fim, faz a média em "Finish"
			LDRB W4, [X2, X5]				// Load de um byte com offset X2-X5 no vector H
			MUL X4, X4, X5					// Número de valores vezes o número de alunos que obtiveram essa classificação
			ADD X0, X0, X4					// Juntar ao acumulador
			SUB W5, W5, #1					// Agora só faltam X5-1 notas a somar
			B GetGrades

Finish: 	SCVTF S7, W7					// Int --> Float (precisão simples, S)
			SCVTF S0, W0					// Int --> Float (precisão simples, S)
			FDIV S0, S0, S7					// S0 <-- Número total de notas / Número total de alunos
			RET								// Valor a retornar em S0 (no código C o "histo" retorna valor em formato float)
