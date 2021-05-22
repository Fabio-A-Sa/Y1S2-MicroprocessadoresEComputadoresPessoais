.text
.global VECTOR_SUM
.type VECTOR_SUM, "function"

// Adição de vetores – assumir que pode ocorrer overflow

VECTOR_SUM: EOR X11, X11, X11
Loop:   CBZ X3, FINISH
	LDR W9, [X0]
	LDR W10, [X1]
    SMADDL X11, W9, W10, X11
    SUB X3, X3, 1
    ADD X0, X0, 4
    ADD X1, X1, 4
    B Loop

FINISH: MOV W0, W1
    RET