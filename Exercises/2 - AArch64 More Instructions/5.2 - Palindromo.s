.text
.global PAL1
.type PAL1, "function"

// Verificar se a representação binária de um número é capicua (número palíndromo). A resposta será 1 em caso armativo e 0 no caso contrário

PAL1: RBIT W1, W0
	CMP W1, W0
	CSET W0, EQ
	RET
