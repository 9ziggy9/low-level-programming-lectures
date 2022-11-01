	processor 6502
	include "vcs.h"
	include "macro.h"
	seg code
	org $F000	; defines origin of ROM
	CLEAN_START	; clears stack, tia, ram
START:	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set backgrouind color luminosity to color yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lda #$8C	; Load color into A ($1E is NTSC yellow)
	sta COLUBK	; store A to BackgroundColor address $09
	jmp START	; Repeat from START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	org $FFFC	; Defines origin to $FFFC
	.word START	; Reset vector at $FFFC (2 bytes)
	.word START	; Interrupt vector (2 bytes)
