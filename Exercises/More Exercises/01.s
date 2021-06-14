.text
.global Maxsumsubseq
.type Maxsumsubseq, "function"

// X0 --> Endereço-base do vector de inteiros (offset = 4bytes)
// W1 --> Número de valores contidos no vector

Maxsumsubseq: 	MOV W7, #0 			// W7 ficará com o maior valor acumulado numa sequência
				MOV W6, #0 			// Acumulador local
Loop:			CBZ W1, Finish 		// Se acabar, retorna o valor de W7
				SUB W1, W1, #1		// Só faltam W1-1 números a verificar!
				LDR W2, [X0], #4	// Valor da sequência
				ADD W6, W6, W2		// Adiciona ao contador principal
				LDR W3, [X0]		// W3 fica com o valor seguinte da sequência
				CMP W2, W3
				B.LO Loop			// Se o valor seguinte ainda for maior, então continua no loop
				CMP W6, W7			// Senão, verifica se a soma é maior do que a acumulada em W7
				B.LS Jump
				MOV W7, W6			// Se for, troca. W7 fica agora com um novo máximo
Jump:			MOV W6, 0			// Reseta o acumulador parcial
				B Loop				// E volta ao loop
Finish: 		MOV W0, W7			// No final, retorna em W0 o valor máximo encontrado
				RET