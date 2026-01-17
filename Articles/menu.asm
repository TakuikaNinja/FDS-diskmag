; Menu screen

Menu:
;	encode_call Common
	vram_addr $2000, 6, 4
	encode_string INC1, COPY, "FDS 40th Anniversary"
	
	vram_addr $2000, 8, 8
	encode_string INC1, COPY, "FDS R&D? In 2026?"
	
	vram_addr $2000, 8, 10
	encode_string INC1, COPY, "Disk BASIC"
	
	vram_addr $2000, 8, 12
	encode_string INC1, COPY, "Namco IPL"
	
	vram_addr $2000, 8, 14
	encode_string INC1, COPY, "I2 Souseiki Fammy"
	
	vram_addr $2000, 8, 16
	encode_string INC1, COPY, "?"
	
	vram_addr $2000, 8, 18
	encode_string INC1, COPY, "SMB1 256W on FDS"
	
	vram_addr $2000, 8, 20
	encode_string INC1, COPY, "Credits & Greets"
	
	vram_addr $2000, 11, 25
	encode_string INC1, COPY, "2026-02-21"
	
	encode_terminator
