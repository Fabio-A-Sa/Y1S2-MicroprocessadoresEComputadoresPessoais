.data
	pi: .double 3.1415
.text
.global area
.type area, "function"

area: LDR D1, pi
	UCVTF D0, W0
	FMUL D0, D0, D0
	FMUL D0, D0, D1
	RET
