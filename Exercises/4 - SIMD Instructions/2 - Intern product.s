.text
.global intern
.type intern, "function"

intern: LSR W2, W2, 2
    MOV X3, 0
Loop: CBZ X3, Finish
    