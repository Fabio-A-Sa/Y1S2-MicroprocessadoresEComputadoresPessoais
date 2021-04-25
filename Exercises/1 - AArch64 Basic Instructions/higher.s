.text
.global higher
.type higher, "function"

higher: 	cmp X0, X1;
			b.ge finish
			mov X0, X1;
finish:		ret