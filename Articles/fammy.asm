; I2 Souseiki Fammy

Fammy:

	vram_addr $2000, 7, 4
	encode_string INC1, COPY, "I2 Souseiki Fammy"
	
	vram_addr $2000, 3, 6
	encode_string INC1, COPY, "2025-11:"
	vram_addr $2000, 4, 7
	encode_string INC1, COPY, "I2 Souseiki Fammy + 4 QDs"
	vram_addr $2000, 3, 8
	encode_string INC1, COPY, "procured by Zorchenhimer."
	
	vram_addr $2000, 4, 10
	encode_string INC1, COPY, "Unlicensed addon for:"
	vram_addr $2000, 3, 11
	encode_length INC32, FILL, 4
	.byte $16
	vram_addr $2000, 5, 11
	encode_string INC1, COPY, "Dumping NROM carts to QD"
	vram_addr $2000, 5, 12
	encode_string INC1, COPY, "Dumping cart SRAM to QD"
	vram_addr $2000, 5, 13
	encode_string INC1, COPY, "Slowing down games"
	vram_addr $2000, 5, 14
	encode_string INC1, COPY, "Generating Disk BASIC"
	
	vram_addr $2000, 4, 16
	encode_string INC1, COPY, "Streamed on Twitch/YT:"
	vram_addr $2000, 3, 17
	encode_length INC32, FILL, 2
	.byte $16
	vram_addr $2000, 5, 17
	encode_string INC1, COPY, "Software disassembly"
	vram_addr $2000, 5, 18
	encode_string INC1, COPY, "Hardware analysis"
	
	vram_addr $2000, 4, 20
	encode_string INC1, COPY, "Read more on NESdev Wiki!"
	
	vram_addr $2000, 4, 22
	encode_string INC1, COPY, "Missing software:"
	vram_addr $2000, 4, 23
	encode_string INC1, COPY, "Disk BASIC Generator Kit"
	vram_addr $2000, 4, 24
	encode_string INC1, COPY, "(May add extra 4KiB RAM)"
	
	vram_addr $2000, 8, 26
	encode_string INC1, COPY, "Press B to exit"
	
	encode_call Common
	encode_call BottomEdge
	encode_terminator
