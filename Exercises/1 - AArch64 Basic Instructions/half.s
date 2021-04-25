.text
.global half
.type half, "function"

half: 	mov X7, 1
		mov X2, 32
		mov W1, W0
		lsr X0, X0, X2
		CMP W1, W0
		B.EQ finish
		mov x7, 0
finish: mov x0, x7
		ret