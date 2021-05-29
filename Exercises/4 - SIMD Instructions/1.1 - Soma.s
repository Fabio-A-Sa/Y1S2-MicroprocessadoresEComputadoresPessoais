.text
.global somaV
.type somaV, "function"

somaV: UDIV W3, W3, 4
Loop: CBZ W3, Finish
    LDR Q0, [X0], 16
    LDR Q1, [X1], 16
    FADD V2.4S, V1.4S, V0.4S
    STR Q2, [X2], 16
    SUB W3, W3, 1
    B Loop
Finish: RET