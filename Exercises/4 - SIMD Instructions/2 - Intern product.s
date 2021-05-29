.text
.global intern
.type intern, "function"

intern: LSR W2, W2, 2
    MOV X3, 0
Loop: CBZ X3, Finish
    LDR Q0, [X0], 16
    LDR Q1, [X1], 16
    MUL V2.4S, V1.4S, V0.4S
    ADDV S3, V2.4S
    SMOV X5, V3.S[0]
    ADD X3, X3, X5
    SUB W2, W2, 1
    B Loop
FInish: MOV X0, X3
    RET