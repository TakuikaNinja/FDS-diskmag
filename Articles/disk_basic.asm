; Disk BASIC

DiskBASIC:

	vram_addr $2000, 11, 4
	encode_string INC1, COPY, "Disk BASIC"

	vram_addr $2000, 4, 6
	encode_string INC1, COPY, "Sick of using cassettes"
	vram_addr $2000, 3, 7
	encode_string INC1, COPY, "and losing save data in"
	vram_addr $2000, 3, 8
	encode_string INC1, COPY, "Family BASIC V2?"
	
	vram_addr $2000, 4, 10
	encode_string INC1, COPY, "Then try Disk BASIC, the"
	vram_addr $2000, 3, 11
	encode_string INC1, COPY, "unofficial FDS port!"
	vram_addr $2000, 3, 12
	encode_string INC1, COPY, "It provides 8126 bytes of"
	vram_addr $2000, 3, 13
	encode_string INC1, COPY, "program memory along with"
	vram_addr $2000, 3, 14
	encode_string INC1, COPY, "disk saving/loading."
	
	vram_addr $2000, 4, 16
	encode_string INC1, COPY, "It also adds the BGTOOL"
	vram_addr $2000, 3, 17
	encode_string INC1, COPY, "command from V3 and skips"
	vram_addr $2000, 3, 18
	encode_string INC1, COPY, "the entire login sequence."
	vram_addr $2000, 3, 19
	encode_string INC1, COPY, "No more holding the T key"
	vram_addr $2000, 3, 20
	encode_string INC1, COPY, "or navigating menus!"

	vram_addr $2000, 4, 22
	encode_string INC1, COPY, "This 80's hacking relic"
	vram_addr $2000, 3, 23
	encode_string INC1, COPY, "has been archived, and a"
	vram_addr $2000, 3, 24
	encode_string INC1, COPY, "modern CA65 recreation can"
	vram_addr $2000, 3, 25
	encode_string INC1, COPY, "be used to patch legally"
	vram_addr $2000, 3, 26
	encode_string INC1, COPY, "obtained ROM dumps."

	vram_addr $2800, 11, 3
	encode_string INC1, COPY, "Timeline:"
	
	vram_addr $2800, 3, 5
	encode_string INC1, COPY, "2024-03:"
	vram_addr $2800, 4, 6
	encode_string INC1, COPY, "Disk BASIC thread opened"
	vram_addr $2800, 3, 7
	encode_string INC1, COPY, "on NESdev forums."
	vram_addr $2800, 3, 8
	encode_string INC1, COPY, "YT videos from Ootakeke"
	vram_addr $2800, 3, 9
	encode_string INC1, COPY, "referenced for featureset."
	
	vram_addr $2800, 3, 11
	encode_string INC1, COPY, "2025-01:"
	vram_addr $2800, 4, 12
	encode_string INC1, COPY, "Patches found on Enri's"
	vram_addr $2800, 3, 13
	encode_string INC1, COPY, "site. Disk I/O is missing."
	
	vram_addr $2800, 3, 15
	encode_string INC1, COPY, "2025-03 to 2025-05:"
	vram_addr $2800, 4, 16
	encode_string INC1, COPY, "Disk I/O patches + tools"
	vram_addr $2800, 3, 17
	encode_string INC1, COPY, "transcribed from scans"
	vram_addr $2800, 3, 18
	encode_string INC1, COPY, "provided by InfiniteEnd."
	
	vram_addr $2800, 3, 20
	encode_string INC1, COPY, "2025-06:"
	vram_addr $2800, 4, 21
	encode_string INC1, COPY, "Patches + creation tools"
	vram_addr $2800, 3, 22
	encode_string INC1, COPY, "uploaded to archive.org"
	vram_addr $2800, 3, 23
	encode_string INC1, COPY, "by TakuikaNinja."
	
	encode_call Common
	encode_call Arrows
	encode_terminator

