;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Assembler command: dasm cleanmem.asm -f3 -v0 -ocleanmem.bin      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	processor 6502
	seg code
	org $F000	; Define code origin at $F000
Start:	
	sei		; Disable interrupts
	cld		; Disable the BCD decimal math mode
	ldx #$FF	; Load X reg with #$FF
	txs		; Transfer the X reg to SP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clear the Page Zero regionn ($00  to $FF)			    ;;
;; Meaning, the entire RAM and also the entire TIA registers        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lda #0		; A = 0
	ldx #$FF	; X = #$FF
MemLoop:
	sta $0,X	; Store the value of A inside mem addr $0 + X
	dex		; X--
	bne MemLoop	; Loop until X is zero (z-flag set)
	sta $0,X	; For last register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill the ROM size to exactly 4KB				    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	org $FFFC
	.word Start	; Reset vector at $FFFC (where prg starts)
	.word Start	; Interrupt vector at $FFFE (unused in VCS)
