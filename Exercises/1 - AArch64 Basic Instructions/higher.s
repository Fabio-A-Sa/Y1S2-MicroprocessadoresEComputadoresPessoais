.text
.global higher
.type higher, "function"

higher: 	cmp X1, X0;
			b.lt final
			mov X0, X1;
final:		ret
