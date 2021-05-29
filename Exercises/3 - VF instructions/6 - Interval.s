.text
.global conta
.type conta, "function"

conta: MOV X2, 0
loop: CBZ X1, Finish
    LDR S3, [X0], 4
    CMP S3, S0
    B.LT Jump
    CMP S3, S1
    B.GT Jump 
    ADD X2, X2, 1
Jump: SUB X1, X1, 1
    B loop
Finish: MOV X0, X2
    RET
