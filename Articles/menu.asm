; Menu screen

Menu:
	encode_call Common
	vram_addr $2000, 6, 4
	encode_string INC1, COPY, "FDS 40th Anniversary"
	
	encode_terminator
