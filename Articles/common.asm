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
	encode_length INC1, FILL, 64
	.byte $00
	.dbyt $2bc0
	encode_length INC1, FILL, 64
	.byte $00
	encode_return

; for single-screen articles
BottomEdge:
	vram_addr $2000, 1, 28
	encode_length INC1, FILL, 30
	.byte $0f
	vram_addr $2000, 1, 29
	encode_length INC1, FILL, 30
	.byte $0d
	encode_return

