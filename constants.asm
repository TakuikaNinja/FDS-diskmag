; constants

; debug mode
.ifndef DEBUG
	DEBUG = 0
.endif

; buttons
	P1_PRESSED    = Buttons
	P1_HELD       = Buttons+2
	
.enum
	BUTTON_A      = 1 << 7
	BUTTON_B      = 1 << 6
	BUTTON_SELECT = 1 << 5
	BUTTON_START  = 1 << 4
	BUTTON_UP     = 1 << 3
	BUTTON_DOWN   = 1 << 2
	BUTTON_LEFT   = 1 << 1
	BUTTON_RIGHT  = 1 << 0
.endenum

; VRAM struct/buffer
.enum
	COPY = 0
	FILL = 1
	INC1 = 0
	INC32 = 1
	
	; max VRAM buffer size ($0302~$03ff)
	BUFFER_SIZE = $fd
.endenum

.include "SabreFiles/sabre_includes.asm"

; general constants
	Y_SCROLL_SPEED = 2

; modes
.enum MODE
	INTRO
	BG_INIT
	READING
.endenum

