; FDS R&D? In 2026?

Research:

	vram_addr $2000, 7, 4
	encode_string INC1, COPY, "FDS R&D? In 2026?"

	vram_addr $2000, 4, 6
	encode_string INC1, COPY, "We're still finding new"
	vram_addr $2000, 3, 7
	encode_string INC1, COPY, "things about the FDS!"
	vram_addr $2000, 3, 8
	encode_string INC1, COPY, "...Somehow."
	
	vram_addr $2000, 4, 10
	encode_string INC1, COPY, "Here's what 2025 alone"
	vram_addr $2000, 3, 11
	encode_string INC1, COPY, "yielded for FDS R&D:"
	vram_addr $2000, 3, 12
	encode_length INC32, FILL, 4
	.byte $16
	vram_addr $2000, 5, 12
	encode_string INC1, COPY, "$4030.D3R = $4025.D3W"
	vram_addr $2000, 5, 13
	encode_string INC1, COPY, "$4023W behaviour"
	vram_addr $2000, 5, 14
	encode_string INC1, COPY, "DRAM refresh watchdog"
	vram_addr $2000, 5, 15
	encode_string INC1, COPY, "byte Xfer flag quirks"
	
	vram_addr $2000, 4, 17
	encode_string INC1, COPY, "Don't know what any of"
	vram_addr $2000, 3, 18
	encode_string INC1, COPY, "those mean? That's fine,"
	vram_addr $2000, 3, 19
	encode_string INC1, COPY, "no one else figured them"
	vram_addr $2000, 3, 20
	encode_string INC1, COPY, "out prior to this point."
	vram_addr $2000, 3, 21
	encode_string INC1, COPY, "It took die scan analysis"
	vram_addr $2000, 3, 22
	encode_string INC1, COPY, "from SCSR, and unlicensed"
	vram_addr $2000, 3, 23
	encode_string INC1, COPY, "RAM cart expertise from"
	vram_addr $2000, 3, 24
	encode_string INC1, COPY, "NewRisingSun to get here."
	
	vram_addr $2000, 3, 26
	encode_string INC1, COPY, "(Continued below)"
	
	vram_addr $2800, 4, 4
	encode_string INC1, COPY, "I've gotten quite lonely"
	vram_addr $2800, 3, 5
	encode_string INC1, COPY, "writing tests for the FDS."
	vram_addr $2800, 3, 6
	encode_string INC1, COPY, "Many NESdev folk have had"
	vram_addr $2800, 3, 7
	encode_string INC1, COPY, "to endure my rambles on"
	vram_addr $2800, 3, 8
	encode_string INC1, COPY, "Discord for over a year"
	vram_addr $2800, 3, 9
	encode_string INC1, COPY, "at this point. (Sorry)"
	
	vram_addr $2800, 4, 11
	encode_string INC1, COPY, "I've said it before and"
	vram_addr $2800, 3, 12
	encode_string INC1, COPY, "I'll probably repeat it"
	vram_addr $2800, 3, 13
	encode_string INC1, COPY, "again and again:"
	
	vram_addr $2800, 4, 15
	encode_string INC1, COPY, "FDS emulation still isn't"
	vram_addr $2800, 3, 16
	encode_string INC1, COPY, "good enough beyond all the"
	vram_addr $2800, 3, 17
	encode_string INC1, COPY, "popular licensed disks..."
	vram_addr $2800, 3, 18
	encode_string INC1, COPY, "(Drive emulators included)"
	
	vram_addr $2800, 6, 22
	encode_string INC1, COPY, "Good luck, emu devs!"
	
	encode_call Common
	encode_call Arrows
	encode_terminator

