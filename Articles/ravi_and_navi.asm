; Ravi and Navi review

RaviAndNavi:

	vram_addr $2000, 5, 4
	encode_string INC1, COPY, "Review: Ravi and Navi"

	vram_addr $2000, 4, 6
	encode_string INC1, COPY, "2025-02-17 saw a release"
	vram_addr $2000, 3, 7
	encode_string INC1, COPY, "of the brand new FDS game,"
	vram_addr $2000, 3, 8
	encode_length INC1, COPY, 26
	.byte '"', "Ravi and Navi", '"', " created by"
	vram_addr $2000, 3, 9
	encode_string INC1, COPY, "HSA Entertainment."
	
	vram_addr $2000, 4, 11
	encode_string INC1, COPY, "The game expands on the"
	vram_addr $2000, 3, 12
	encode_string INC1, COPY, "NES/FC version by adding"
	vram_addr $2000, 3, 13
	encode_string INC1, COPY, "wavetable audio & hi-score"
	vram_addr $2000, 3, 14
	encode_string INC1, COPY, "saving."
	
	vram_addr $2000, 4, 16
	encode_string INC1, COPY, "The gameplay consists of"
	vram_addr $2000, 3, 17
	encode_string INC1, COPY, "6 carrot munching stages"
	vram_addr $2000, 3, 18
	encode_string INC1, COPY, "followed by a boss fight,"
	vram_addr $2000, 3, 19
	encode_string INC1, COPY, "which repeats endlessly."
	
	vram_addr $2000, 4, 21
	encode_string INC1, COPY, "The packaging is special"
	vram_addr $2000, 3, 22
	encode_string INC1, COPY, "in this release, with its"
	vram_addr $2000, 3, 23
	encode_string INC1, COPY, "3D-printed disk casing and"
	vram_addr $2000, 3, 24
	encode_string INC1, COPY, "custom sleeves/inlays."
	
	vram_addr $2000, 3, 26
	encode_string INC1, COPY, "(continued below)"
	
	vram_addr $2800, 4, 4
	encode_string INC1, COPY, "TakuikaNinja's Thoughts:"
	
	vram_addr $2800, 4, 6
	encode_string INC1, COPY, "Now, the game itself may"
	vram_addr $2800, 3, 7
	encode_string INC1, COPY, "be too simple for those"
	vram_addr $2800, 3, 8
	encode_string INC1, COPY, "looking for a challenge."
	vram_addr $2800, 3, 9
	encode_string INC1, COPY, "One could also argue that"
	vram_addr $2800, 3, 10
	encode_string INC1, COPY, "the game is relying on the"
	vram_addr $2800, 3, 11
	encode_string INC1, COPY, "novelty of a physical disk"
	vram_addr $2800, 3, 12
	encode_string INC1, COPY, "release in the modern age."
	
	vram_addr $2800, 4, 14
	encode_string INC1, COPY, "I think the release of"
	vram_addr $2800, 3, 15
	encode_string INC1, COPY, "this game poses a crucial"
	vram_addr $2800, 3, 16
	encode_string INC1, COPY, "question in this age:"
	vram_addr $2800, 3, 17
	encode_string INC1, COPY, "How to keep the FDS alive"
	vram_addr $2800, 3, 18
	encode_string INC1, COPY, "when working disks and"
	vram_addr $2800, 3, 19
	encode_string INC1, COPY, "drives become too scarce?"
	
	vram_addr $2800, 4, 21
	encode_string INC1, COPY, "A new means of releasing"
	vram_addr $2800, 3, 22
	encode_string INC1, COPY, "physical FDS games in the"
	vram_addr $2800, 3, 23
	encode_string INC1, COPY, "absence of disk drives may"
	vram_addr $2800, 3, 24
	encode_string INC1, COPY, "be worth considering..."
	
	encode_call Common
	encode_call Arrows
	encode_terminator

