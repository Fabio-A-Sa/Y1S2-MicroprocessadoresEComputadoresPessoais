.text
.global PAL1
.type PAL1, "function"

// Vericar se uma cadeia de 8 carateres (tamanho de uma doubleword) é palíndromo. A resposta será 1 em caso armativo e 0 no caso contrário

PAL1: RBIT W1, W0
	CMP W1, W0
	CSET W0, EQ
	RET
