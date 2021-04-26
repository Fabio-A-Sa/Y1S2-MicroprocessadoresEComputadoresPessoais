.text
.global pairs
.type pairs, "function"

pairs:	MOV X3, #0
	MOV X4, #0
   	MOV X6, x1
loop:	CBZ X1, finish
	LDR X2, [X0, X4]
    AND X5, X2, #1
    ADD X3, X3, X5
    ADD X4, X4, #8
    SUB X1, X1, #1
    B loop
finish: SUB X0, X6, X3
    RET