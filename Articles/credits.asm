; Credits & Greets

Credits:
;	encode_call Common
	vram_addr $2000, 12, 4
	encode_string INC1, COPY, "Credits:"
	
	vram_addr $2000, 4, 7
	encode_string INC1, COPY, "Diskmag by TakuikaNinja"
	vram_addr $2000, 4, 9
	encode_string INC1, COPY, "Sabre sound driver by"
	vram_addr $2000, 10, 10
	encode_string INC1, COPY, "CutterCross"
	
	vram_addr $2000, 4, 12
	encode_string INC1, COPY, "Placeholder GFX by"
	vram_addr $2000, 10, 13
	encode_string INC1, COPY, "Drag, shiru, & Sik"
	
	
	vram_addr $2000, 11, 15
	encode_string INC1, COPY, "Greets to:"
	vram_addr $2000, 8, 16
	encode_length INC32, FILL, 8
	.byte $16
	
	vram_addr $2000, 10, 16
	encode_string INC1, COPY, "Chiptune Cafe"
	vram_addr $2000, 10, 17
	encode_string INC1, COPY, "FamiWiki"
	vram_addr $2000, 10, 18
	encode_string INC1, COPY, "NESdev community"
	vram_addr $2000, 10, 19
	encode_string INC1, COPY, "forple, Fiskbit"
	vram_addr $2000, 10, 20
	encode_string INC1, COPY, "lidnariq, Sour"
	vram_addr $2000, 10, 21
	encode_string INC1, COPY, "SCSR, InfiniteEnd"
	vram_addr $2000, 10, 22
	encode_string INC1, COPY, "NewRisingSun"
	vram_addr $2000, 10, 23
	encode_string INC1, COPY, "Zorchenhimer"
	
	vram_addr $2000, 8, 26
	encode_string INC1, COPY, "Press B to exit"
	
	encode_terminator

