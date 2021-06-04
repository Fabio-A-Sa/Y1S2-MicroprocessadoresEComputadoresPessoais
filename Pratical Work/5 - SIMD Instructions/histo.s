// Fábio Araújo de Sá
// Junho, 2021

.text
.global histo
.type histo, "function"

// W0 --> Tamanho de C, unsigned int, 32 bits
// X1 --> Apontador para o início de C, pointer, 64 bits
// X2 --> Apontador para o início de H, pointer, 64 bits

histo: 		MOV X7, X0
loop: 		CBZ W0, Average					// Se chegou ao final do vector das notas, vai fazer a média com o histograma construído
			LDR Q0, [X1], #16				// Fazer load das primeiras 16 notas
			SUB W0, W0, #16					// Já só faltam W0-16 notas a verificar
			MOV W9, #20						// W9 é ao mesmo tempo a nota a comparar e o offset do vector H

Search: 	CMP W9, #0						// Se chegar a -1, volta ao main loop
			B.LT loop
			DUP V4.16B, W9					// Replicar o valor de W9 por todo o vector V4
			CMEQ V6.16B, V0.16B, V4.16B		// Comparar cada byte dos vectores (V0 e V4), para ver se são iguais à nota pretendida. Se sim, fica o respectivo byte "a uns (1)".
			ADDV B6, V6.16B					// B6 fica
			MOV W4, V6.S[0]					// W4 fica com o número de ocorrências dentro daquela sequência de notas
			NEG W4, W4
			LDRB W3, [X2, X9]				// Buscar o valor antigo do Histograma, W3
			ADD W4, W4, W3					// Adicionar W3 à frequência absoluta obtida neste conjunto de 16 notas, W4
			STRB W4, [X2, X9]				// Fazer store desse novo valor no histograma
			SUB W9, W9, #1					// Agora é altura de verificar quantos W9-1 existem no conjunto de 16 notas, voltando ao Search
			B Search

Average: 	MOV W5, #20
			MOV X0, #0
Grades:  	CBZ X5, Finish
			LSL X3, X5, #2
			LDR W4, [X2, X3]
			MUL X4, X4, X5
			ADD X0, X0, X4
			SUB W5, W5, #1
			B Grades

Finish: 	UCVTF S0, W0
			UCVTF S1, W7
			FDIV S0, S0, S1
			RET
