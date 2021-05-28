// Fábio Araújo de Sá, up202007658
// Maio, 2021

.data
	max: .double 1000000.0
.text
.global closestCircle
.type closestCircle, "function"

// W0 --> NP (número de pontos), unsigned int, 32 bits
// X1 --> VP (vector de pontos), pointer, 64 bits. Precisão simples (S).
// W2 --> NC (número de círculos), unsigned int, 32 bits
// X3 --> VC (vector de círculos), pointer, 64 bits. Precisão dupla (D).
// X4 --> ID (vector de IDs de círculos), pointer, 64 bits

closestCircle:  CBZ W0, Finish		// Se o número de pontos for nulo, fim
				CBZ W2, Finish		// Se o número de círculos for nulo, fim
				MOV X5, X3  		// É importante guardar o início do vector dos círculos, para ser usado sempre que há o "Search"
				SUB X4, X4, #4		// Necessário para acerto de apontadores no Loop
				LDR D11, max		// D11 fica com o valor máximo de distância, que vai ser alterando mediante a existência de valores mais baixos

Loop:			CBZ W0, Finish		// Se chegou ao fim do vector de pontos, fim
				SUB W0, W0, #1		// Senão, retira uma unidade ao contador
				MOV X3, X5			// Ajustar X3 para ficar com o endereço do trio da primeira circunferência a verificar
				ADD X4, X4, #4		// Ajustar o apontador dos IDs
				LDR	S0, [X1], #4	// S0 --> X do ponto
				LDR S1, [X1], #4	// S1 --> Y do ponto
				FCVT D0, S0			// Tem de haver passagem de float para double, para compatibilidade das operações mais à frente
				FCVT D1, S1			// Tem de haver passagem de float para double, para compatibilidade das operações mais à frente
				MOV W6, W2			// W6 fica com o número de círculos a testar
				MOV W7, 0			// W7 fica com o index do círculo que neste momento se vai pesquisar.
				LDR D11, max		// D11 fica com um valor muito grande para ser facilmente substituido na primeira iteração.

Search:			CBZ W6, Loop		// Se não houver mais círculos a procurar, volta ao loop para buscar o próximo ponto.
				LDR D2, [X3], #8	// D2 --> X do centro do círculo
				LDR D3, [X3], #8	// D3 --> Y do centro do círculo
				LDR D4, [X3], #8	// D4 --> R do centro do círculo
				FSUB D5, D0, D2		// D5 fica com D0-D2
				FSUB D6, D1, D3		// D6 fica com D1-D3
				FMUL D5, D5, D5		// D5 fica com (D0-D2)^2
				FMUL D6, D6, D6		// D6 fica com (D1-D3)^2
				FADD D5, D5, D6		// D5 fica com (D0-D2)^2 + (D1-D3)^2
				FSQRT D5, D5		// D5 fica com SQRT((D0-D2)^2 + (D1-D3)^2)
				FSUB D5, D5, D4		// D5 fica com SQRT((D0-D2)^2 + (D1-D3)^2) - D4
				FCMP D5, 0
				B.LE Jump			// Se D5 for menor ou igual que 0, então pertence ao círculo e não é válido para a solução. Pula.
				FCMP D5, D11
				B.GT Jump			// Se D5 for maior que a anterior distância, não é válido para a solução. Pula.
				FMOV D11, D5		// D11 fica atualmente com o menor valor de distância, que é o D5
				STR W7, [X4]		// Posso já fazer o Store, no vector ID, do inteiro W7 que é o index do círculo mais próximo até agora.
Jump:			SUB W6, W6, #1		// Faltam W6 iterações nos círculos para acabar o Search loop
				ADD W7, W7, #1		// Próximo círculo, próximo index
				B Search

Finish: 		RET					// Retorna "void function", pois X0 não interessa para o resultado final.
