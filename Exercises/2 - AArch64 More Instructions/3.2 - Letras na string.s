.text
.global FIND
.type FIND, "function"

// Determinar o número de ocorrências de um caráter numa cadeia de carateres

FIND: MOV X2, 0

LOOP: LDRB W3, [X0]
	CMP X3, 0
	B.EQ FINISH
	ADD X0, X0, 1
	CMP W3, W1
	B.NE LOOP
	ADD X2, X2, 1
	B LOOP

FINISH: MOV X0, X2
	RET