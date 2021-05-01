// Fábio Araújo de Sá, up202007658
// Abril, 2021

.text
.global CheckABS
.type CheckABS, "function"

// W0 --> Número a comparar, integer, 32 bits
// W1 --> Tamanho da sequência, integer, 32 bits
// X2 --> Endereço-base da sequência, pointer, 64 bits

CheckABS: 	MOV W7, 0				// Contador das modificações, começa a zero.
			MOV X5, 0				// Offset, começa a zero.
			MOV W6, 0				// Número 0, para determinar se o número na sequência é positivo ou negativo ...
									// ... e usá-lo para o Store (STR) na sequência, quando necessário.
LOOP: 		CBZ W1, FINISH			// Se chegou ao fim da sequência, termina.
			LDR W4, [X2, X5]		// W4 recebe o valor atual da sequência.
			CMP W4, W6
			B.GE JUMP1				// Se for GE (greater or equal to zero), continua
			NEG W4, W4				// Senão, passa a positivo (absolute value).
JUMP1: 		CMP W4, W0				// É maior que o valor a comparar?
			B.LS JUMP2				// Se não for, continua.
			ADD W7, W7, 1			// Se sim, aumenta no contador uma unidade ...
			STR W6, [X2, X5]		// ... e coloca, no local correspondente na sequência, o valor 0 (W6 == 0)
JUMP2: 		SUB W1, W1, 1			// Por fim faltam apenas W1 - 1 valores a comparar ...
			ADD W5, W5, 4			// ... e o offset passa a offset + 4 (bytes), pois a sequência tem números de 32 bits (4 bytes)
			b LOOP
FINISH: 	MOV W0, W7				// Devolve o valor do contador de alterações (W7), para um registo 0 (W0)
			RET

