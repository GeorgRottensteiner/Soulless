!to "soulcartridge.crt",magicdeskcrt

*=$8000

BANK_SWITCH   = $DE00
COPY_SIZE_LO  = $3F
COPY_SIZE_HI  = $40
COPY_FROM     = $41
COPY_TO       = $43

VIC_CONTROL_MODE        = $d011
VIC_BORDER_COLOR        = $d020
VIC_BACKGROUND_COLOR    = $d021

!byte $09,$80
!byte $19,$80
!byte $C3,$C2,$CD,$38,$30

          ;KERNAL RESET ROUTINE
          STX $D016				; Turn on VIC for PAL / NTSC check
	         JSR $FDA3				; IOINIT - Init CIA chips
	         JSR $FD50				; RANTAM - Clear/test system RAM
	         JSR $FD15				; RESTOR - Init KERNAL RAM vectors
	         JSR $FF5B				; CINT   - Init VIC and screen editor
           
;copy copy code to $0400
          ldx #$00
-
          lda movecode1,x
          sta $0400,x
          inx
          bne -
          
          ;build code from bank
          ;0 = intro
          ;2 = game
          ;8 = end
          ldy #0
          jmp $0400
        ;------------------------------
movecode1

;self modifying copy code, needs to be copied itself
!PSEUDOPC $0400
;basic_move


;Y = bank to copy
;CopyBank  
          lda #$37
          sta $01
          
          ldx #0
          txa
          sta VIC_BORDER_COLOR
.sidloop
          sta $d400,x
          inx
          cpx #$19
          bne .sidloop
          
          lda #$0b
          sta VIC_CONTROL_MODE
          
---          
          lda INTRO_BANK,y
          sty COPY_BANK
          and #$7f
          sta BANK_SWITCH

          lda INTRO_SOURCE_ADDRESS_LO,y
          sta COPY_FROM
          lda INTRO_SOURCE_ADDRESS_HI,y
          sta COPY_FROM + 1

          lda INTRO_COPY_SIZE_LO,y
          sta COPY_SIZE_LO
          lda INTRO_COPY_SIZE_HI,y
          sta COPY_SIZE_HI
          lda INTRO_TARGET_ADDRESS_LO,y
          sta COPY_TO
          lda INTRO_TARGET_ADDRESS_HI,y
          sta COPY_TO + 1

          ldy #0
          ldx COPY_SIZE_HI
--          
          beq .HiDone
          
-          
          lda (COPY_FROM),y
          sta (COPY_TO),y
          iny
          bne -
          
          dec COPY_SIZE_HI
          inc COPY_TO + 1
          inc COPY_FROM + 1
          dex
          bne --
          
.HiDone          
          ldx COPY_SIZE_LO
          beq .LoDone
          
-          
          lda (COPY_FROM),y
          sta (COPY_TO),y
          iny
          dex
          bne -
          
.LoDone
          ldy COPY_BANK
          lda INTRO_BANK,y
          and #$80
          bne +
          
          inc COPY_BANK
          ldy COPY_BANK
          jmp ---
          
+
          ;jump at start
          ;lda #$80     ;for emu
          lda #$08      ;for hardware
          sta BANK_SWITCH
          ;restore stack
          ldx #$ff
          txs
          lda #0
          tax 
          tay
          jmp $080D

CART_BOOTSTRAP_SIZE = 243
INTRO_SIZE = 15542 
GAME_SIZE = 39700
END_SIZE = 9923

;intro
PART_1_SIZE = 8192 - CART_BOOTSTRAP_SIZE
PART_2_SIZE = INTRO_SIZE - PART_1_SIZE
;game
PART_3_SIZE = 8192 - PART_2_SIZE
PART_4_SIZE = 8192
PART_5_SIZE = 8192
PART_6_SIZE = 8192
PART_7_SIZE = 8192
PART_8_SIZE = GAME_SIZE - PART_3_SIZE - PART_4_SIZE - PART_5_SIZE - PART_6_SIZE - PART_7_SIZE
;end
PART_9_SIZE = 8192 - PART_8_SIZE
PART_10_SIZE = END_SIZE - PART_9_SIZE

;$1F0D = 7949 - 243 (243 = INTRO_START - $8000)      

;Caution - 2 bytes (load address) is cut off from file!!!
;intro size = 15544
;
;bank 0 =  243 (bootstrap)
;         7949 (intro1)           = 8192 - 243
;bank 1 - 7595 (intro2)           = intro size - intro1

;game size = 39825
;bank 1 = 7595 (intro2)
;          597 (game1)           - 39235 offen      = 8192 - intro2
;bank 2 = 8192 (game2)           - 31043 offen
;bank 3 - 8192 (game3)           - 22851 offen
;bank 4 - 8192 (game4)           - 14659 offen
;bank 5 - 8192 (game5)           - 6467 offen
;bank 6 - 6467 (game6)           = game size - 4 * 8192 - game1

;end size = 9917
;bank 6 - 6467 (game6)
;         1725 (end1)            = end size - game6
;bank 7 - 8192 (end2)            = end size - end1
          
COPY_BANK
          !byte 0
INTRO_BANK
          !byte $00
          !byte $81
          !byte $01
          !byte $02
          !byte $03
          !byte $04
          !byte $05
          !byte $86
          !byte $06
          !byte $87
INTRO_SOURCE_ADDRESS_LO
          ;!byte $b1,$00
          !byte <INTRO_START
          !byte $00
          !byte <( $8000 + ( GAME_START % 8192 ) )
          !byte $00
          !byte $00
          !byte $00
          !byte $00
          !byte $00
          !byte <( $8000 + ( END_START % 8192 ) )
          !byte $00
INTRO_SOURCE_ADDRESS_HI
          ;!byte $80,$80
          !byte >INTRO_START
          !byte $80
          !byte >( $8000 + ( GAME_START % 8192 ) )
          !byte $80
          !byte $80
          !byte $80
          !byte $80
          !byte $80
          !byte >( $8000 + ( END_START % 8192 ) )
          !byte $80
INTRO_TARGET_ADDRESS_LO
          !byte $01
          !byte $01 + ( PART_1_SIZE & 0xff )
          !byte $01
          !byte $01 + ( PART_3_SIZE & 0xff )
          !byte $01 + ( PART_3_SIZE & 0xff ) + $00
          !byte $01 + ( PART_3_SIZE & 0xff ) + $00 + $00
          !byte $01 + ( PART_3_SIZE & 0xff ) + $00 + $00 + $00
          !byte $01 + ( PART_3_SIZE & 0xff ) + $00 + $00 + $00 + $00
          !byte $01
          !byte $01 + ( PART_9_SIZE & 0xff )
INTRO_TARGET_ADDRESS_HI
          !byte $08
          !byte $08 + ( PART_1_SIZE >> 8 )
          !byte $08
          !byte $08 + ( PART_3_SIZE >> 8 )
          !byte $08 + ( PART_3_SIZE >> 8 ) + $20
          !byte $08 + ( PART_3_SIZE >> 8 ) + $20 + $20
          !byte $08 + ( PART_3_SIZE >> 8 ) + $20 + $20 + $20
          !byte $08 + ( PART_3_SIZE >> 8 ) + $20 + $20 + $20 + $20
          !byte $08
          !byte $08 + ( PART_9_SIZE >> 8 )
          

INTRO_COPY_SIZE_HI
          !byte ( PART_1_SIZE >> 8 )
          !byte ( PART_2_SIZE >> 8 )
          !byte ( PART_3_SIZE >> 8 )
          !byte ( PART_4_SIZE >> 8 )
          !byte ( PART_5_SIZE >> 8 )
          !byte ( PART_6_SIZE >> 8 )
          !byte ( PART_7_SIZE >> 8 )
          !byte ( PART_8_SIZE >> 8 )
          !byte ( PART_9_SIZE >> 8 )
          !byte ( PART_10_SIZE >> 8 )
INTRO_COPY_SIZE_LO
          !byte PART_1_SIZE & 0xff
          !byte PART_2_SIZE & 0xff
          !byte PART_3_SIZE & 0xff
          !byte PART_4_SIZE & 0xff
          !byte PART_5_SIZE & 0xff
          !byte PART_6_SIZE & 0xff
          !byte PART_7_SIZE & 0xff
          !byte PART_8_SIZE & 0xff
          !byte PART_9_SIZE & 0xff
          !byte PART_10_SIZE & 0xff
          
!REALPC 
BOOTSTRAP_END
* = $80f3
INTRO_START
	         !binary "introcartridge.prg",,2
GAME_START           
          !binary "soullesscrunched.prg",,2
END_START
          !binary "endgamecartridge.prg",,2