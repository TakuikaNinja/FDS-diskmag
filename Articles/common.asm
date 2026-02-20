; VRAM substructures for common elements

Common:
EdgePatterns:
; left/right
	vram_addr $2000, 0, 0
	encode_length INC32, FILL, 30
	.byte $0d
	vram_addr $2000, 1, 0
	encode_length INC32, FILL, 30
	.byte $0f
	vram_addr $2000, 30, 0
	
	encode_length INC32, FILL, 30
	.byte $0f
	vram_addr $2000, 31, 0
	encode_length INC32, FILL, 30
	.byte $0d
	
	vram_addr $2800, 0, 0
	encode_length INC32, FILL, 30
	.byte $0d
	vram_addr $2800, 1, 0
	encode_length INC32, FILL, 30
	.byte $0f
	vram_addr $2800, 30, 0
	encode_length INC32, FILL, 30
	.byte $0f
	vram_addr $2800, 31, 0
	encode_length INC32, FILL, 30
	.byte $0d

	vram_addr $2800, 8, 26
	encode_string INC1, COPY, "Press B to exit"

; top/bottom
	vram_addr $2000, 1, 0
	encode_length INC1, FILL, 30
	.byte $0d
	vram_addr $2000, 1, 1
	encode_length INC1, FILL, 30
	.byte $0f

	vram_addr $2800, 1, 28
	encode_length INC1, FILL, 30
	.byte $0f
	vram_addr $2800, 1, 29
	encode_length INC1, FILL, 30
	.byte $0d

;	encode_return

Attributes:
	.dbyt $23c0
	encode_length INC1, COPY, 64
	.byte ((0 << 6) | (2 << 4) | (2 << 2) | (2 << 0))
	
	.repeat 6
	.byte ((0 << 6) | (0 << 4) | (2 << 2) | (2 << 0))
	.endrepeat
	
	.byte ((2 << 6) | (0 << 4) | (2 << 2) | (2 << 0))
	
	.repeat 7
	.byte ((0 << 6) | (2 << 4) | (0 << 2) | (2 << 0))
	.byte 0,0,0,0,0,0
	.byte ((2 << 6) | (0 << 4) | (2 << 2) | (0 << 0))
	.endrepeat
	
	.dbyt $2bc0
	encode_length INC1, COPY, 56
	.repeat 7
	.byte ((0 << 6) | (2 << 4) | (0 << 2) | (2 << 0))
	.byte 0,0,0,0,0,0
	.byte ((2 << 6) | (0 << 4) | (2 << 2) | (0 << 0))
	.endrepeat
	
	.dbyt $2bf8
	encode_length INC1, FILL, 8
	.byte ((0 << 6) | (0 << 4) | (2 << 2) | (2 << 0))
	encode_return

; for dual-screen articles
Arrows:
	vram_addr $2000, 29, 27
	encode_length INC1, COPY, 1
	.byte $1d
	vram_addr $2800, 2, 2
	encode_length INC1, COPY, 1
	.byte $1c
	encode_return

; for single-screen articles
BottomEdge:

	vram_addr $2000, 8, 26
	encode_string INC1, COPY, "Press B to exit"

	vram_addr $2000, 1, 28
	encode_length INC1, FILL, 30
	.byte $0f
	vram_addr $2000, 1, 29
	encode_length INC1, FILL, 30
	.byte $0d
	
	.dbyt $23f8
	encode_length INC1, FILL, 8
	.byte ((0 << 6) | (0 << 4) | (2 << 2) | (2 << 0))
	encode_return

