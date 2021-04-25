.text
.global ContPar
.type ContPar, "function"

ContPar:	mov X3, 0 // Counter
           	mov X4, 0 // Offset
           	mov x6, x1

loop:       cbz X1, final
            ldr X2, [X0, X4]
            and X5, X2, 1
            add X3, X3, X5
            add X4, X4, 8
            sub X1, X1, 1
            b loop

final: 		sub x0, x6, x3
            ret
