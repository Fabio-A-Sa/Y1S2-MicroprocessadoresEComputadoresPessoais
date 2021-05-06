// Fábio Araújo de Sá, up202007658
// Maio, 2021

.text
.global SelectedUpperCase
.type SelectedUpperCase, "function"

// X0 --> Letras a trocar para maiúscula, pointer, 64 bits
// X1 --> Cadeia a ser trocada, pointer, 64 bits

SelectedUpperCase: 	MOV W7, 0 			// Contador
			MOV X6, X0 			// Pointer inicial da string de comparação
LOOP: 			LDRB W2, [X1]			// W2 recebe cada carácter da string a modificar
			CBZ W2, FINISH			// Se chegar ao fim da string, acaba
			ADD X1, X1, 1			// Pointer += 1 byte
			MOV X0, X6
			CMP W2, 122
			B.GT LOOP
			CMP W2, 97
			B.LT LOOP			// Se a letra for minúscula (ASCII entre 97 e 122), vai alterar no "SEARCH"
SEARCH: 			LDRB W3, [X0]			// Retira cada um dos caracteres da string de comparação
			CBZ W3, LOOP			// Se chegar ao fim, acaba a procura e regressa ao LOOP principal
			ADD X0, X0, 1			// Pointer += 1 byte
			CMP W2, W3			// Letra da sentence == string comparação ?
			B.NE SEARCH			// Se não, avança para a próxima ...
			SUB W4, W2, 32			// ... se sim, o código ASCII de w2 -= 42 (fica maiúscula)
			SUB X1, X1, 1
			STRB W4, [X1]			// Faz store na string principal
			ADD X1, X1, 1
			ADD W7, W7, 1			// Adiciona ao contador
			B LOOP

FINISH: 			MOV W0, W7			// Move o contador para um registo WZR e retorna
			RET
