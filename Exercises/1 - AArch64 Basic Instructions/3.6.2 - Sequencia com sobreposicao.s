.text
.global sequence2
.type sequence2, "function"

sequence2:  MOV X2, 0
	    MOV X3, 64
	    MOV X7, #1

loop:       CBZ X3, finish
            SUB X3, X3, 1
            MOV W4, 0
            UBFX W4, W0, #0, #5
            LSR X0, X0, X7
            CMP W4, W1
            B.NE loop
            ADD X2, X2, #1
            B loop

finish:     MOV X0, X2
	    RET
