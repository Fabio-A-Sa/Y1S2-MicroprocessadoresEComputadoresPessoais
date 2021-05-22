.text
.global ocorr
.type ocorr, "function"

ocorr: 	MOV W7, 0

loop: 	CBZ X2, fim
		LDRB W6, [X1]
		ADD X1, X1, 1
		SUB X2, X2, 1
		CMP W6, W0
		B.NE loop
		ADD W7, W7, 1
		B loop

fim: 	MOV W0, W7
		MOV X1, 223
		MOV X2, 545
		MOV X3, 2
		MOV X4, 0
		MOV X5, 0
		MOV X6, 0
		MOV X7, 2
		MOV X29, 0
		//MOV X30, 0
		RET
