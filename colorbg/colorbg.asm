	processor 6502
	include "vcs.h"
	include "macro.h"
	seg code
	org $F000	; defines origin of ROM
START:	
	CLEAN_START	; clears stack, tia, ram
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set backgrouind color luminosity to color yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lda #$1E	; Load color into A ($1E is NTSC yellow)
	sta COLUBK	; store A to BackgroundColor address $09
	jmp START	; Repeat from START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	org $FFFC	; Defines origin to $FFFC
	.word START	; Reset vector at $FFFC (2 bytes)
	.word START	; Interrupt vector (2 bytes)
