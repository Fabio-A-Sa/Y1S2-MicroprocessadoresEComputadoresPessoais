.text
.global absolute
.type absolute, "function"

absolute: 	cmp X0, 0
			b.ge finish
			neg X0, X0
finish: 	ret
