// Fábio Araújo de Sá, up202007658
// Maio, 2021

.data
	max: .double 1000000
	zero: .double 0
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
				LDR D11, max		// D11 fica com o valor máximo de distância, que vai ser alterando mediante a existência de valores mais baixos
				MOV W10, W0			// W10 fica com o número de pontos, para ser usado com o vector ID

Loop:			CBZ W0, Finish		// Se chegou ao fim do vector de pontos, fim
				SUB W0, W0, #1		// Senão, retira uma unidade ao contador
				MOV X3, X5			// Ajustar X3 para ficar com o endereço do trio da primeira circunferência a verificar
				LDR	S0, [X1], #4	// S0 --> X do ponto
				LDR S1, [X1], #4	// S1 --> Y do ponto
				FCVT D0, S0			// Tem de haver passagem de float para double, para compatibilidade das operações mais à frente
				FCVT D1, S1			// Tem de haver passagem de float para double, para compatibilidade das operações mais à frente
				MOV W6, W2			// W6 fica com o número de círculos a testar
				MOV W7, 0			// W7 fica com o index do círculo que neste momento se vai pesquisar.

Search:			CBZ W6, Loop		// Se não houver mais círculos a procurar, volta ao loop para buscar o próximo ponto
				LDR D2, [X3], #8	// D2 --> X do centro do círculo
				LDR D3, [X3], #8	// D3 --> Y do centro do círculo
				LDR D4, [X3], #8	// D4 --> R do centro do círculo
				FSUB D0, D0, D2
				FSUB D1, D1, D3
				FMUL D0, D0, D0
				FMUL D1, D1, D1
				FADD D0, D0, D1
				FSQRT D0, D0
				FSUB D0, D0, D4
				FCMP D0, 0
				B.LS Jump
				FCMP D0, D11
				B.GT Jump
				LDR D1, zero
				FADD D11, D0, D1 // D11 fica atualmente com o menor valor
				STRB [X4]
				B Search

Jump:


				SUB W6, W6, #1
				SUB W10, W10, #1
				B Search

Finish: RET
