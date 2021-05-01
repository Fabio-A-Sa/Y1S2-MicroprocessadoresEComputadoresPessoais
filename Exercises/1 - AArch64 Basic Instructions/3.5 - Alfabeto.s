.text
.global alphabetic
.type alphabetic, "function"

alphabetic: 	MOV X4, 0
		MOV X6, X2
loop: 		CMP X0, X1
		B.HI finish
		LDR X5, [X0]
		ADD X0, X0, 1
		MOV X2, X6
search: 	CMP X2, X3
		B.HI loop
		CMP X5, X2
		B.NE jump
		ADD X4, X4, 1
jump: 		ADD X2, X2, 1
		B search

finish: 	MOV X0, X4
		RET