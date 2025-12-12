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
		sta $0300,x
		sta $0400,x
		sta $0500,x
		sta $0600,x
		sta $0700,x
		inx
		bne @clrmem
		
		jsr MoveSpritesOffscreen
		
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
		
		lda NMIReady									; check if ready to do NMI logic (i.e. not a lag frame)
		beq NotReady
		
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
		jsr sabre_soundUpdate
		
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
		lda #$00
		sta FDS_IRQ_TIMER_CTRL ; disable Timer IRQs

		; <scroll split and/or further Timer IRQ handling goes here>

		jmp @Exit
  
@Watchdog:
	.ifdef DEBUG
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
		ldx #>oam
		ldy #>oam
		jmp MemFill

InitNametables:
		lda #$20										; top-left
		jsr InitNametable
		lda #$28										; bottom-left

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

; ArticleID = article to load
LoadArticle:
		lda ArticleID
		asl a
		tax
		lda Articles,x
		sta ArticleAddr
		lda Articles+1,x
		sta ArticleAddr+1
		jsr DisableRendering
		jsr WaitForNMI
		jsr InitNametables
		jsr VRAMStructWrite
ArticleAddr:
	.addr Menu
		
		jmp EnableRendering

Articles:
	.addr Menu
	.addr SMB1

; Jump table for main logic
ProcessBGMode:
		lda Mode
		jsr JumpEngine
	.addr Intro
	.addr BGInit
	.addr Reading

Intro:
		inc Mode
		rts

; Initialise background to display the program name
BGInit:
		lda #_default_Reading
		sta currentTrack
		jsr sabre_playTrack
		jsr DisableRendering
		; palette data goes into vblank buffer to avoid visible stripes
		vram_string $3f00, PaletteData, PaletteDataSize
		inc NeedDraw
		jsr LoadMenu
		inc Mode
		rts

ScrollLocks:
	.byte 1, 1

Reading:
		jsr HandleExit
		jsr SFXTest
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
	.addr SMB1_256W

DoNothing:
		rts

MenuUI:
		lda P1_PRESSED
		and #(BUTTON_START | BUTTON_A)
		beq :+
		lda #$01
		sta ArticleID
		jsr LoadArticle
:
		rts

; SMB1 256W setup
SMB1_256W:
		rts

; Press B to return to menu
HandleExit:
		lda ArticleID									; already in menu? then don't exit
		beq :+
		lda P1_PRESSED
		and #BUTTON_B
		beq :+

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
	.repeat 8
	.byte $0f, $00, $10, $20
	.endrepeat
.endproc
PaletteDataSize = .sizeof(PaletteData)

; Articles
.include "Articles/common.asm"
.include "Articles/menu.asm"
.include "Articles/smb1.asm"

; Sound engine + data
.include "SabreFiles/sabre.asm"
.include "Music/fds_diskmag_static.asm"
.include "Music/fds_diskmag_default.asm"

