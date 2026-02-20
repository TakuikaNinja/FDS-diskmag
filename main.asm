; Main program code
;
; Formatting:
; - Width: 132 Columns
; - Tab Size: 4, using tab
; - Comments: Column 57

; Reset handler
; Much of the init tasks are already done by the BIOS reset handler, including the PPU warmup loops.
Reset:
		lda #$00										; clear RAM
		tax
@clrmem:
		sta $00,x
		cpx #4											; preserve BIOS stack variables at $0100~$0103
		bcc :+
		sta $0100,x
:
		sta $0200,x
		dec $0200,x
		sta $0300,x
		sta $0400,x
		sta $0500,x
		sta $0600,x
		sta $0700,x
		inx
		bne @clrmem
		
;		jsr MoveSpritesOffscreen
		
		; set up custom IRQ handler
		lda #<IRQHandler
		sta $dffe
		lda #>IRQHandler
		sta $dfff
		lda #%11000000
		sta IRQ_FLAG
		
		lda #BUFFER_SIZE								; set VRAM buffer size
		sta VRAM_BUFFER_SIZE
		
		lda #REGION_NTSC
		sta soundRegion
		jsr sabre_initAPU

		lda #%10000000									; enable NMIs & change background pattern map access
		sta PPU_CTRL_MIRROR
		sta PPU_CTRL
		
Main:
		jsr ReadOrDownPads								; read controllers + expansion port
		jsr ProcessBGMode
		jsr WaitForNMI
		beq Main										; back to main loop
	
; NMI handler
NonMaskableInterrupt:
		pha												; back up A/X/Y
		txa
		pha
		tya
		pha
		
		bit NMISoftDisable								; if NMIs are soft-disabled,
		bmi SkipScroll									; skip scroll setting to avoid clobbering PPU registers
		
		lda NMIReady									; check if ready to do NMI logic (i.e. not a lag frame)
		beq NotReady
		
		lda NeedIRQ
		beq :+
		
		lda #<IRQ_TIMER
		sta FDS_IRQ_TIMER_LOW
		lda #>IRQ_TIMER
		sta FDS_IRQ_TIMER_HI
		lda #%00000010
		sta FDS_IRQ_TIMER_CTRL
		dec NeedIRQ										; clear flag
:
		jsr SpriteDMA
		
		lda NeedDraw									; transfer Data to PPU if required
		beq :+
		
		jsr WriteVRAMBuffer								; transfer data from VRAM buffer at $0302
		jsr SetScroll									; reset scroll after PPUADDR writes
		dec NeedDraw
		
:
		lda NeedPPUMask									; write PPUMASK if required
		beq :+
		
		lda PPU_MASK_MIRROR
		sta PPU_MASK
		dec NeedPPUMask

:
		dec NMIReady

NotReady:
		jsr SetScroll									; remember to set scroll on lag frames
		
SkipScroll:
		jsr sabre_soundUpdate
		
		inc Frames
		
		pla												; restore X/Y/A
		tay
		pla
		tax
		pla
		rti
		
IRQHandler:
		pha												; back up A/X/Y
		txa
		pha
		tya
		pha

		lda FDS_STATUS ; ack all FDS IRQs
		and #%00000011 ; keep bits for DRAM Refresh Watchdog (D1) and Timer IRQ (D0)
		lsr a ; shift D0 into carry
		bne @Watchdog
		bcc @Exit
  
@TimerIRQ:
		; <scroll split and/or further Timer IRQ handling goes here>
		lda PPU_CTRL_MIRROR
		and #%11111110
		ora X_Scroll+1
		ldx X_Scroll
		ldy #0
		bit PPU_STATUS
		sta PPU_CTRL
		stx PPU_SCROLL
		sty PPU_SCROLL
		sty FDS_IRQ_TIMER_CTRL							; disable Timer IRQs
		jmp @Exit
  
@Watchdog:
	.if DEBUG = 1
		ldx PPU_MASK_MIRROR
		txa
		inx ; set grayscale for visual feedback on hardware
		stx PPU_MASK
		jsr Delay131 ; call $E149 to safely refresh DRAM rows
		sta PPU_MASK
	.else
		jsr Delay131 ; call $E149 to safely refresh DRAM rows
	.endif

@Exit:
		pla ; restore Y/X/A and exit
		tay
		pla
		tax
		pla
		rti


EnableRendering:
		lda #%00011110									; enable rendering and queue it for next NMI
	.byte $2c											; [skip 2 bytes]

DisableSprites:
		lda #%00001010
	.byte $2c											; [skip 2 bytes]

DisableRendering:
		lda #%00000000									; disable background and queue it for next NMI

UpdatePPUMask:
		sta PPU_MASK_MIRROR
		lda #$01
		sta NeedPPUMask
		rts

MoveSpritesOffscreen:
		lda #$ff										; fill OAM buffer with $ff to move offscreen
		ldy #$00
@loop:
		sta oam,y
		iny
		iny
		iny
		iny
		bne @loop
		rts

InitNametables:
		lda #$20										; top-left
		jsr InitNametable
		lda #$2C										; bottom-right (works for both arrangements)

InitNametable:
		ldx #$00										; clear nametable & attributes for high address held in A
		ldy #$00
		jmp VRAMFill

EnableNMI:
		lda PPU_CTRL_MIRROR								; enable NMI
		ora #%10000000
		bit PPU_STATUS									; in case this was called with the vblank flag set
		sta PPU_CTRL_MIRROR								; write to mirror first for thread safety
		sta PPU_CTRL
		rts

WaitForNMI:
		inc NMIReady
:
		lda NMIReady
		bne :-
		rts

NumToChars:												; converts A into hex chars and puts them in X/Y
		pha
		and #$0f
		tay
		lda NybbleToChar,y
		tay
		pla
		lsr
		lsr
		lsr
		lsr
		tax
		lda NybbleToChar,x
		tax
		rts

NybbleToChar:
	.byte "0123456789ABCDEF"

; ArticleID = article to load
LoadArticle:
		lda ArticleID
		asl a
		tax
		lda Articles,x
		sta ArticleAddr
		lda Articles+1,x
		sta ArticleAddr+1
		
LoadScreen:
		jsr MoveSpritesOffscreen
		jsr DisableRendering
		jsr WaitForNMI
		lda FDS_CTRL_MIRROR
		sta FDS_CTRL
		lda #$80										; upcoming bulk writes can take longer than 1 frame,
		sta NMISoftDisable								; so soft-disable NMIs to avoid race conditions
		jsr InitNametables
		jsr VRAMStructWrite
ArticleAddr:
	.addr Menu
		asl NMISoftDisable								; soft-enable NMIs once done
		jmp EnableRendering

Articles:
	.addr Menu
	.addr Research
	.addr DiskBASIC
	.addr NamcoIPL
	.addr Fammy
	.addr BBL
	.addr RaviAndNavi
	.addr SMB1
	.addr Credits

NoArticle:
	encode_call Common
	encode_terminator

; Jump table for main logic
ProcessBGMode:
		lda Mode
		jsr JumpEngine
	.addr Intro
	.addr BGInit
	.addr Reading

Intro:
		lda #0
		sta Frames
		sta X_Scroll
		sta X_Scroll+1
		jsr InitDTE

; Fill ~128 bytes in advance
@InitialFill:
		jsr DecodeDTE
		lda DTE_Buffer_Idx
		bpl @InitialFill
		
		lda FDS_CTRL_MIRROR
		and #%11110111
		sta FDS_CTRL_MIRROR
		lda #_default_Intro
		sta currentTrack
		jsr sabre_playTrack
		; palette data goes into vblank buffer to avoid visible stripes
		vram_string $3f00, PaletteData, PaletteDataSize
		inc NeedDraw
		lda #<IntroScreen
		sta ArticleAddr
		lda #>IntroScreen
		sta ArticleAddr+1
		jsr LoadScreen

@IntroLoop:
		jsr ReadOrDownPads
		lda P1_PRESSED
		and #BUTTON_START
		bne @Exit
		
		jsr IntroSprites
		jsr TextScroller
		jsr WaitForNMI
		inc X_Scroll
		bne @IntroLoop
		inc DTE_Row
		lda DTE_Row
		and #1
		sta X_Scroll+1
		jmp @IntroLoop

@Exit:
		inc Mode
		jmp DisableRendering

IntroSprites:
		lda #$00
		sta SpriteIdx
;		jsr HatSprites

; Flashing "Push ST" prompt
PromptSprites:
		ldx SpriteIdx
		ldy #0
		lda #176
		sta SpriteXPos
		
@loop:
		lda Frames
		and #%00100000									; toggle every 64 frames
		beq :+
		lda #$FF
	.byte $2c											; [skip 2 bytes]
:
		lda #95
		sta OAM_YPOS,x
		lda PushST,y
		sta OAM_TILE,x
		lda #0
		sta OAM_ATTR,x
		lda SpriteXPos
		sta OAM_XPOS,x
		clc
		adc #8
		sta SpriteXPos
		txa
		adc #4
		tax
		iny
		cpy #PromptLength
		bcc @loop
		stx SpriteIdx
;		rts

; Extra sprites to complete the party hat pattern
HatSprites:
		ldx SpriteIdx
		ldy #0
		jsr HatSprite
		iny
		
HatSprite:
		lda YPos,y
		sta OAM_YPOS,x
		lda #$0e
		sta OAM_TILE,x
		lda #$03
		sta OAM_ATTR,x
		lda XPos,y
		sta OAM_XPOS,x
		txa
		clc
		adc #4
		sta SpriteIdx
		tax
		rts

YPos:
	.byte 79,87

XPos:
	.byte 124,116

; The space is drawn as a sprite here (but we have plenty to spare)
.proc PushST
	.byte "Push ", $1a
.endproc
PromptLength = .sizeof(PushST)

PPUAddrs_Hi:
	.byte $27, $23

TextScroller:
; DTE_Row * 32 = DTE_Row << 5
; but rotating right is faster
		lda DTE_Row
		and #7
		lsr a
		ror a
		ror a
		ror a
		sta temp

; Ensure DTE decoding doesn't outpace the rendering
		lda DTE_Buffer_Idx
		and #$f0
		cmp temp
		beq :+

		jsr DecodeDTE
:
; Update 32 columns for the nametable which just went offscreen
		lda X_Scroll
		bne NoUpdate

UpdateText:
		lda temp
		sta TextPtr
		ldy X_Scroll+1
		lda PPUAddrs_Hi,y
		ldx #$00
		ldy #32
		jsr PrepareVRAMString
TextPtr:
	.addr DTE_Buffer
		inc NeedDraw

; Queue IRQ raster split
NoUpdate:
		inc NeedIRQ
		rts

; Init DTE buffers & variables
InitDTE:
		lda #0
		tax
@InitDTEBuffer:
		sta DTE_Buffer,x
		inx
		bne @InitDTEBuffer
		
		sta DTE_Buffer_Idx
		sta DTE_Row

InitDTE_Ptr:
		lda #<DTE_Data
		sta DTE_Ptr
		lda #>DTE_Data
		sta DTE_Ptr+1
		rts

; Decode a single recursive DTE code, somewhat based on the implementation from:
; https://github.com/pinobatch/rfk-nes
; Clobbers AXY
DecodeDTE:
		ldy #0
		lda (DTE_Ptr),y
@DecodeCode:
		bmi @doDTE										; D7 set = DTE code
		beq @NullChar

; non-DTE codes
@OutputChar:
; mask control codes if they ever appear
		cmp #' '
		bcs :+
		lda #' '
:
; output character in A
		ldx DTE_Buffer_Idx
		sta DTE_Buffer,x
		inc DTE_Buffer_Idx

@incPtr:
		inc DTE_Ptr
		bne @Exit
		inc DTE_Ptr+1
@Exit:
		rts

; decode a byte pair:
; 1. push the second byte to the stack
; 2. decode the first byte
; 3. pull & decode the second byte
; 4. decrement the pointer to account for the extra increment during recursion
@doDTE:
		asl a
		tax
		lda DTE_Table+1,x
		pha
		lda DTE_Table,x
		jsr @DecodeCode
		pla
		jsr @DecodeCode

@decPtr:
		lda DTE_Ptr
		bne :+
		dec DTE_Ptr+1
:
		dec DTE_Ptr
		rts
		
; null terminator handling
; fill buffer until 32 byte boundary, then reset pointer
@NullChar:
		lda DTE_Buffer_Idx
		and #31
		beq InitDTE_Ptr
		
		lda #' '
		ldx DTE_Buffer_Idx
		sta DTE_Buffer,x
		inc DTE_Buffer_Idx
		rts

; Initialise background
BGInit:
		lda FDS_CTRL_MIRROR
		ora #%00001000
		sta FDS_CTRL_MIRROR
		lda #$01										; default SMB1256W world number
		sta World
		lda #_default_Reading
		sta currentTrack
		jsr sabre_playTrack
;		jsr DisableRendering
		; palette data goes into vblank buffer to avoid visible stripes
;		vram_string $3f00, PaletteData, PaletteDataSize
;		inc NeedDraw
	.if DEBUG = 1 && DEBUG_ARTICLE > 0
		jsr sabre_stopTrack
		lda #DEBUG_ARTICLE
		sta ArticleID
		jsr LoadArticle
	.else
		jsr LoadMenu
	.endif
		inc Mode
		rts

ScrollLocks:
	.byte 1,0,0,0,1,1,0,1,1

Reading:
		jsr HandleExit
;		jsr SFXTest
		ldx ArticleID
		lda ScrollLocks,x								; does the current article have a scroll lock?
		bne :+
		jsr HandleScroll
:

; execute article-specific code, if any
ArticleHandler:
		lda ArticleID
		jsr JumpEngine
	.addr MenuUI										; (the menu is technically an article)
	.addr DoNothing
	.addr DoNothing
	.addr DoNothing
	.addr DoNothing
	.addr DoNothing
	.addr DoNothing
	.addr SMB1_256W
	.addr DoNothing

DoNothing:
		rts

; Move a cursor sprite and check if an article was selected
MenuUI:
		ldx MenuIdx
		lda P1_PRESSED
		and #BUTTON_A
		beq :+
		inx
		stx ArticleID									; +1 to skip menu
		jmp LoadArticle
:
		lda P1_PRESSED
		and #BUTTON_DOWN
		beq :+
		cpx #8-1
		bcs :+
		inx
:
		lda P1_PRESSED
		and #BUTTON_UP
		beq :+
		cpx #0
		beq :+
		dex
:
		stx MenuIdx
;		jmp CursorSprite

CursorSprite:
		lda MenuIdx
		asl a
		asl a
		asl a
		asl a
		adc #63
		sta oam+0										; ArticleID * 16 + 63
		lda #$1f
		sta oam+1
		lda #$00
		sta oam+2
		lda #52
		sta oam+3
		rts

; SMB1 256W setup
SMB1_256W:
		lda P1_PRESSED
		and #BUTTON_START
		bne @Setup
		
		lda P1_PRESSED
		and #BUTTON_UP+BUTTON_DOWN
		beq :+
		
		lda #$00
		sta AutoRepeat
		lda P1_HELD
		and #BUTTON_UP+BUTTON_DOWN
		cmp #BUTTON_UP+BUTTON_DOWN
        bne @checkButtons
:
		lda P1_HELD
		and #BUTTON_UP+BUTTON_DOWN
		beq @ret
		cmp #BUTTON_UP+BUTTON_DOWN
        beq @ret
		
		inc AutoRepeat
		lda AutoRepeat
		cmp #DAS_RESET
		bcc @ret
		
		lda #DAS_DELAY
		sta AutoRepeat
		
@checkButtons:
		lda P1_HELD
		and #BUTTON_UP
		beq :+
		dec World
:
		lda P1_HELD
		and #BUTTON_DOWN
		beq :+
		inc World
:
@ret:
		lda World
		jsr NumToChars
		stx WorldNumber
		sty WorldNumber+1
		vram_string ($2000 + (19 << 5) + 18), WorldNumber, WorldNumberLength
		inc NeedDraw
		rts

@Setup:
		lda #$00
		ldx #$d7
@loop:
		sta $0700,x
		inx
		bne @loop
		ldx World
		dex
		stx $07fd
		ldy #$a5
		sty $07ff
		sta RST_FLAG
		sta RST_TYPE
		vram_string ($2000 + (26 << 5) + 3), SwapAndReset, SwapAndResetLength
		inc NeedDraw
@idle:
		jsr WaitForNMI
		beq @idle

; Press B to return to menu
HandleExit:
		lda P1_PRESSED
		and #BUTTON_B
		beq :+
		
		lda ArticleID									; already in menu? then go to intro instead
		bne LoadMenu
		
		sta Mode										; A is already 0
		rts
		
LoadMenu:
		lda #$00
		sta ArticleID
		sta Y_Scroll
		sta Y_Scroll+1
		jsr SetYScroll
		jsr LoadArticle
:
		rts

SFXTest:
		lda P1_PRESSED
		and #BUTTON_A
		beq :+
		lda #_sfx_Error
		sta currentSFX
		jsr sabre_playSFX
:
		rts

HandleScroll:
		lda P1_HELD
		and #BUTTON_UP
		beq :+
		jsr SubYScroll
:
		lda P1_HELD
		and #BUTTON_DOWN
		beq :+
		jsr AddYScroll
:
SetYScroll:
		lda Y_Scroll
		sta PPU_Y_SCROLL_MIRROR
		lda Y_Scroll+1
		asl a
		sta temp
		lda PPU_CTRL_MIRROR
		and #%11111101
		ora temp
		sta PPU_CTRL_MIRROR
		rts

AddYScroll:
		lda Y_Scroll
		clc
		adc #Y_SCROLL_SPEED
		cmp #240
		bcc :+
		sbc #240 ; Guaranteed to set carry
:
		sta Y_Scroll
		lda Y_Scroll+1
		adc #0
		cmp #1
		bcc :+
		lda #0
		sta Y_Scroll
		lda #1
:
		sta Y_Scroll+1
		rts

SubYScroll:
		lda Y_Scroll
		sec
		sbc #Y_SCROLL_SPEED
		bcs :+
		sbc #15
		clc
:
		sta temp
		lda Y_Scroll+1
		sbc #0
		bcs :+
		lda #$00
		sta temp
:
		sta Y_Scroll+1
		lda temp
		sta Y_Scroll
		rts

; Palette data
; Just write to all 16 entries so PPUADDR safely leaves the palette RAM region
; PPUADDR ends at $3F20 before the next write (avoids rare palette corruption)
; (palette entries will never be changed anyway, so we might as well set them all)
.proc PaletteData
	.incbin "Screens/palettes.pal"
	.incbin "Screens/palettes.pal"
.endproc
PaletteDataSize = .sizeof(PaletteData)

IntroScreen:
.incbin "Screens/intro.nam.out"

DTE_Data:
.incbin "Screens/scroller.dte"
.byte 0 ; null terminator, just in case the compressor doesn't include it

DTE_Table:
.incbin "Screens/scroller.dtdict"

; Articles
.include "Articles/common.asm"
.include "Articles/menu.asm"
.include "Articles/research.asm"
.include "Articles/disk_basic.asm"
.include "Articles/namco_ipl.asm"
.include "Articles/fammy.asm"
.include "Articles/bbl.asm"
.include "Articles/ravi_and_navi.asm"
.include "Articles/smb1.asm"
.include "Articles/credits.asm"

; Sound engine + data
.include "SabreFiles/sabre.asm"
.include "Music/fds_diskmag_static.asm"
.include "Music/fds_diskmag_default.asm"

