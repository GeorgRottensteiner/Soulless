LOAD_CODE_START
!pseudopc $2a7
!zone DoLoad
DRIVE_NUMBER
          !byte 8
          
 DoLoad 
          ;expect file name index in PARAM1
          lda #$37
          sta $01
          
          ;disable kernal messages
          lda #$00
          jsr KERNAL_SETMSG
          
          ;set logical file parameters
          lda #7
          ldx DRIVE_NUMBER
          ldy #1                ;load 
          jsr KERNAL_SETLFS
          
          ;set filename
          ldy PARAM1
          ldx LOAD_FILENAMES_LO,y
          lda LOAD_FILENAMES_HI,y
          sta PARAM2
          lda LOAD_FILENAMES_LENGTH,y
          ldy PARAM2
          jsr KERNAL_SETNAM
          
          ;load to address
          lda #$00                             ; 0 = load
          jsr KERNAL_LOAD
          bcs .LoadError                        ; Flag ob ok oder nicht steht im Carry
          
          ;load was ok
          
          ;reset stack
          ;ldx #$fa
          ldx #$f6
          txs
          
          ;go!
          ;jsr $a659       
          
          lda #0
          ldx #0
          ldy #0
          ;$080d - decrunch start
          jmp $080d

.LoadError
;BAD SUBSCRIPT $12 18 $B245 NEXT WITHOUT FOR $0A 10 $AD30  
;BREAK $1E 30 $E107 NOT INPUT FILE $06 6    
;CAN'T CONTINUE $1A 26   NOT OUTPUT FILE $07 7    
;DEVICE NOT PRESENT $05 5   OUT OF DATA $0D 13    
;DIVISION BY ZERO $14 20 $BB8A OUT OF MEMORY $10 16 $A435  
;FILE DATA $18 24 $AB66 OVERFLOW $0F 15 $B97E  
;FILE NOT FOUND $04 4   REDIM'D ARRAY $13 19    
;FILE NOT OPEN $03 3   RETURN WITHOUT GOSUB $0C 12 $A8E0  
;FILE OPEN $02 2   STRING TOO LONG $17 23 $A571  
;FORMULA TOO COMPLEX $19 25 $B4D0 SYNTAX $0B 11 $AF08  
;ILLEGAL DEVICE NUMBER $09 9   TOO MANY FILES $01 1    
;ILLEGAL DIRECT $15 21 $B3AB TYPE MISMATCH $16 22 $AD99  
;ILLEGAL QUANTITY $0E 14 $B248 UNDEF'D FUNCTION $1B 27 $B3AE  
;LOAD $1D 29 $E19D UNDEF'D STATEMENT $11 17 $A8E3  
;MISSING FILENAME $08 8   VERIFY $1C 28    

          sta VIC_BORDER_COLOR
          
          lda #0
          rts
          
LOAD_FILENAMES_LO
          !byte <FN_GAME
          !byte <FN_EXTRO
LOAD_FILENAMES_HI
          !byte >FN_GAME
          !byte >FN_EXTRO
LOAD_FILENAMES_LENGTH
          !byte 13
          !byte 7

FN_GAME
          !text "SOULLESS GAME"
FN_EXTRO
          !text "ENDGAME"
          
          
!realpc 
LOAD_CODE_END
