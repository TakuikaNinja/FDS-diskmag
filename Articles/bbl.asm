; I2 Souseiki Fammy

BBL:

	vram_addr $2000, 7, 4
	encode_string INC1, COPY, "Battle Battle League"
	
	vram_addr $2000, 3, 6
	encode_string INC1, COPY, "2025-09-29:"
	vram_addr $2000, 4, 7
	encode_string INC1, COPY, "Battle Battle League QDs"
	vram_addr $2000, 3, 8
	encode_string INC1, COPY, "released on Hidden Palace"
	vram_addr $2000, 3, 9
	encode_string INC1, COPY, "by armadylo."
	
	vram_addr $2000, 4, 11
	encode_string INC1, COPY, "Prototype of the FC game"
	vram_addr $2000, 3, 12
	encode_length INC1, COPY, 26
	.byte '"', "Joy Mech Fight", '"', ", made for"
	vram_addr $2000, 3, 13
	encode_string INC1, COPY, "the 1992 Nintendo-Dentsu"
	vram_addr $2000, 3, 14
	encode_string INC1, COPY, "Game Seminar."
	
	vram_addr $2000, 4, 16
	encode_string INC1, COPY, "Features:"
	vram_addr $2000, 3, 17
	encode_length INC32, FILL, 4
	.byte $16
	vram_addr $2000, 5, 17
	encode_string INC1, COPY, "1P/2P/COM Versus"
	vram_addr $2000, 5, 18
	encode_string INC1, COPY, "Robot Manuals"
	vram_addr $2000, 5, 19
	encode_string INC1, COPY, "1P League"
	vram_addr $2000, 5, 20
	encode_string INC1, COPY, "Robot Editor (Disk 2)"
	
	vram_addr $2000, 4, 22
	encode_string INC1, COPY, "English translation patch"
	vram_addr $2000, 3, 23
	encode_string INC1, COPY, "available on your nearest"
	vram_addr $2000, 3, 24
	encode_string INC1, COPY, "romhacking website!"
	
	encode_call Common
	encode_call BottomEdge
	encode_terminator

