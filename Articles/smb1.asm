; SMB1 256W setup screen

SMB1:
;	encode_call Common
	vram_addr $2000, 8, 4
	encode_string INC1, COPY, "SMB1 256W on FDS"
	
	vram_addr $2000, 4, 6
	encode_string INC1, COPY, "Did you know that the"
	vram_addr $2000, 3, 7
	encode_string INC1, COPY, "256W trick for SMB1 works"
	vram_addr $2000, 3, 8
	encode_string INC1, COPY, "on the FDS version, too?"
	vram_addr $2000, 3, 9
	encode_string INC1, COPY, "(Including Tonkachi Mario)"
	
	vram_addr $2000, 4, 12
	encode_length INC1, COPY, 23
	.byte "Select a world with ", $1C, "/", $1D
	
	vram_addr $2000, 3, 13
	encode_string INC1, COPY, "and press START to begin"
	
	vram_addr $2000, 10, 18
	encode_string INC1, COPY, "World ="
	
	vram_addr $2000, 8, 25
	encode_string INC1, COPY, "Press B to exit"
	
	encode_terminator
	
define_string WorldNumber, "00"
	
define_string SwapAndReset,  "Swap disk, press RESET, then do the usual A+START combo!"

