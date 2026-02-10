; Namco IPL

NamcoIPL:

	vram_addr $2000, 11, 4
	encode_string INC1, COPY, "Namco IPL"

	vram_addr $2000, 4, 6
	encode_string INC1, COPY, "Did you know? FDS games"
	vram_addr $2000, 3, 7
	encode_string INC1, COPY, "from Namco display a fake"
	vram_addr $2000, 3, 8
	encode_string INC1, COPY, "license screen on startup!"
	
	vram_addr $2000, 4, 10
	encode_string INC1, COPY, "This is to hide an IPL"
	vram_addr $2000, 3, 11
	encode_string INC1, COPY, "(Initial Program Loader)"
	vram_addr $2000, 3, 12
	encode_string INC1, COPY, "which can upload programs"
	vram_addr $2000, 3, 13
	encode_string INC1, COPY, "to the FDS and/or save to"
	vram_addr $2000, 3, 14
	encode_string INC1, COPY, "disk for quick testing."
	
	vram_addr $2000, 4, 16
	encode_string INC1, COPY, "The IPL functionality is"
	vram_addr $2000, 3, 17
	encode_string INC1, COPY, "still intact though, so"
	vram_addr $2000, 3, 18
	encode_string INC1, COPY, "it's possible to upload"
	vram_addr $2000, 3, 19
	encode_string INC1, COPY, "new programs via a special"
	vram_addr $2000, 3, 20
	encode_string INC1, COPY, "expansion port interface."

	vram_addr $2000, 4, 22
	encode_string INC1, COPY, "If you have one of the 6"
	vram_addr $2000, 3, 23
	encode_string INC1, COPY, "Namco FDS games, you can"
	vram_addr $2000, 3, 24
	encode_string INC1, COPY, "use an Arduino sketch to"
	vram_addr $2000, 3, 25
	encode_string INC1, COPY, "upload Intel HEX payloads"
	vram_addr $2000, 3, 26
	encode_string INC1, COPY, "via 5VTTL RS232 serial!"

	vram_addr $2800, 11, 3
	encode_string INC1, COPY, "Timeline:"
	
	vram_addr $2800, 3, 5
	encode_string INC1, COPY, "2023-12:"
	vram_addr $2800, 4, 6
	encode_string INC1, COPY, "Initial Loader Program"
	vram_addr $2800, 3, 7
	encode_string INC1, COPY, "discovered in Namco disks."
	vram_addr $2800, 3, 8
	encode_string INC1, COPY, "Uses RS232 to upload Intel"
	vram_addr $2800, 3, 9
	encode_string INC1, COPY, "HEX data to the FDS."
	
	vram_addr $2800, 3, 11
	encode_string INC1, COPY, "2024-07 to 2024-10:"
	vram_addr $2800, 4, 12
	encode_string INC1, COPY, "Lua script + demo payload"
	vram_addr $2800, 3, 13
	encode_string INC1, COPY, "demonstrated in Mesen2."
	
	vram_addr $2800, 3, 15
	encode_string INC1, COPY, "2024-07 to 2024-10:"
	vram_addr $2800, 4, 16
	encode_string INC1, COPY, "IPL port of BattleCity"
	vram_addr $2800, 3, 17
	encode_string INC1, COPY, "demonstrated in Mesen2."
	
	vram_addr $2800, 3, 19
	encode_string INC1, COPY, "2025-07:"
	vram_addr $2800, 4, 20
	encode_string INC1, COPY, "Demo payload uploaded"
	vram_addr $2800, 3, 21
	encode_string INC1, COPY, "to real FDS via Arduino."
	vram_addr $2800, 3, 22
	encode_string INC1, COPY, "BattleCity port uploaded"
	vram_addr $2800, 3, 23
	encode_string INC1, COPY, "via the same interface."
	
	encode_call Common
	encode_call Arrows
	encode_terminator

