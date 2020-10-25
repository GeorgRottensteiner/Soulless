;compile to this filename
!ifdef BUILD_CARTRIDGE {
!to "introcartridge.prg",plain
} else {
!ifdef COMPILE_CRUNCHED {
!to "intro.prg",plain
} else {
!to "intro.prg",cbm
}
}

IRQ_RETURN_KERNAL = $ea81

;NO_LOGOS = 1


;optimize level data, element repeat und Y zusammenlegen?

;memory layout
;charset scene          $C000 to $C7FF
;screen                 $CC00 to $CFFF
;sprites                $D000 to $EFFF (128 sprites)
;not used               $F000 to $F7FF
;charset panel          $F800 to $FFFF

!if 0 {
scene 1 - 00.00   - pystronik logo                      - 400 frames
scene 1a- 00.08   - rgcd logo                           - 375 frames
scene 2 - 00.15.5 - horseman                            - 775 frames
scene 3 - 00.31   - wizard walking across room          - 750 frames
scene 4 - 00.46   - wizard casts spell                  - 800 frames
scene 5 - 01.02   - rizek transforms                    - 750 frames
scene 6 - 01.17   - rizek falls into prison             -1150 frames
scene 7 - 01.40   - eyes behind bars                    - 750 frames
scene 8 - 01.55   - soulless text                       -   x frames
intro end - play to end of music
}

;define constants here

;placeholder for various temp parameters
PARAM1                  = $03
PARAM2                  = $04
PARAM3                  = $05
PARAM4                  = $06
PARAM5                  = $07
PARAM6                  = $08
PARAM7                  = $09
PARAM8                  = $0A
PARAM9                  = $0B
PARAM10                 = $0C
 
;placeholder for zero page pointers
ZEROPAGE_POINTER_1      = $17
ZEROPAGE_POINTER_2      = $19
ZEROPAGE_POINTER_3      = $21
ZEROPAGE_POINTER_4      = $23

VIC_SPRITE_X_POS        = $d000
VIC_SPRITE_Y_POS        = $d001
VIC_SPRITE_X_EXTEND     = $d010
VIC_CONTROL_MODE        = $d011
VIC_RASTER_POS          = $d012
VIC_SPRITE_ENABLE       = $d015
VIC_CONTROL             = $d016
VIC_SPRITE_EXPAND_Y     = $d017
VIC_MEMORY_CONTROL      = $d018
VIC_SPRITE_MULTICOLOR   = $d01c
VIC_SPRITE_MULTICOLOR_1 = $d025
VIC_SPRITE_MULTICOLOR_2 = $d026
VIC_SPRITE_COLOR        = $d027

VIC_BORDER_COLOR        = $d020
VIC_BACKGROUND_COLOR    = $d021
VIC_CHARSET_MULTICOLOR_1= $d022
VIC_CHARSET_MULTICOLOR_2= $d023

JOYSTICK_PORT_II        = $dc00

CIA_PRA                 = $dd00

KERNAL_SETMSG           = $ff90
KERNAL_SETLFS           = $ffba
KERNAL_SETNAM           = $ffbd
KERNAL_LOAD             = $ffd5

MUSIC_PLAYER            = $1000

!ifdef BUILD_FOR_TAPE {
LOAD_CODE = DoLoad
} else {
LOAD_CODE = $FCE2
}

;address of the screen buffer
SCREEN_CHAR             = $CC00
 
;address of color ram
SCREEN_COLOR            = $D800

;address of sprite pointers
SPRITE_POINTER_BASE     = SCREEN_CHAR + 1016

RASTER_BOTTOM_POS       = 233

;number of sprites divided by four
NUMBER_OF_SPRITES_DIV_4 = 108 / 4

BOTTOM_BORDER_RASTER_POS  = 226

;offset from calculated char pos to true sprite pos
SPRITE_CENTER_OFFSET_X  = 8
SPRITE_CENTER_OFFSET_Y  = 11

;sprite number constant
SPRITE_BASE             = 64

SPRITE_PLAYER_UL_1      = SPRITE_BASE + 12
SPRITE_PLAYER_UR_1      = SPRITE_BASE + 13
SPRITE_PLAYER_ML_1      = SPRITE_BASE + 16
SPRITE_PLAYER_MR_1      = SPRITE_BASE + 17
SPRITE_PLAYER_LL_1      = SPRITE_BASE + 20
SPRITE_PLAYER_LR_1      = SPRITE_BASE + 21

SPRITE_PLAYER_UL_2      = SPRITE_BASE + 14
SPRITE_PLAYER_UR_2      = SPRITE_BASE + 15
SPRITE_PLAYER_ML_2      = SPRITE_BASE + 18
SPRITE_PLAYER_MR_2      = SPRITE_BASE + 19
SPRITE_PLAYER_LL_2      = SPRITE_BASE + 22
SPRITE_PLAYER_LR_2      = SPRITE_BASE + 23

SPRITE_PLAYER_UL_3      = SPRITE_BASE + 24
SPRITE_PLAYER_UR_3      = SPRITE_BASE + 25
SPRITE_PLAYER_ML_3      = SPRITE_BASE + 28
SPRITE_PLAYER_MR_3      = SPRITE_BASE + 29
SPRITE_PLAYER_LL_3      = SPRITE_BASE + 32
SPRITE_PLAYER_LR_3      = SPRITE_BASE + 33

SPRITE_FLASH_T_1        = SPRITE_BASE + 40
SPRITE_FLASH_B_1        = SPRITE_BASE + 48

SPRITE_PLAYER_UL_4      = SPRITE_INVISIBLE
SPRITE_PLAYER_UR_4      = SPRITE_INVISIBLE
SPRITE_PLAYER_ML_4      = SPRITE_BASE + 26
SPRITE_PLAYER_MR_4      = SPRITE_BASE + 27
SPRITE_PLAYER_LL_4      = SPRITE_BASE + 30
SPRITE_PLAYER_LR_4      = SPRITE_BASE + 31

SPRITE_PLAYER_UL_5      = SPRITE_BASE + 36
SPRITE_PLAYER_UR_5      = SPRITE_BASE + 37
SPRITE_PLAYER_ML_5      = SPRITE_BASE + 34
SPRITE_PLAYER_MR_5      = SPRITE_BASE + 35
SPRITE_PLAYER_LL_5      = SPRITE_BASE + 38
SPRITE_PLAYER_LR_5      = SPRITE_BASE + 39

SPRITE_INVISIBLE        = SPRITE_BASE + 91

SPRITE_FLAG_L_1         = SPRITE_BASE + 0
SPRITE_FLAG_R_1         = SPRITE_BASE + 1
SPRITE_FLAG_L_2         = SPRITE_BASE + 2
SPRITE_FLAG_R_2         = SPRITE_BASE + 3
SPRITE_FLAG_L_3         = SPRITE_BASE + 4
SPRITE_FLAG_R_3         = SPRITE_BASE + 5
SPRITE_FLAG_L_4         = SPRITE_BASE + 6
SPRITE_FLAG_R_4         = SPRITE_BASE + 7
SPRITE_FLAG_L_5         = SPRITE_BASE + 8
SPRITE_FLAG_R_5         = SPRITE_BASE + 9
SPRITE_FLAG_L_6         = SPRITE_BASE + 10
SPRITE_FLAG_R_6         = SPRITE_BASE + 11

SPRITE_TORCH_1          = SPRITE_BASE + 56
SPRITE_TORCH_2          = SPRITE_BASE + 57
SPRITE_TORCH_3          = SPRITE_BASE + 58
SPRITE_TORCH_4          = SPRITE_BASE + 59

SPRITE_KALEN_T_1        = SPRITE_BASE + 60
SPRITE_KALEN_T_2        = SPRITE_BASE + 61
SPRITE_KALEN_T_3        = SPRITE_BASE + 62
SPRITE_KALEN_T_4        = SPRITE_BASE + 63
SPRITE_KALEN_T_5        = SPRITE_BASE + 64
SPRITE_KALEN_T_6        = SPRITE_BASE + 65
SPRITE_KALEN_T_7        = SPRITE_BASE + 66
SPRITE_KALEN_T_8        = SPRITE_BASE + 67
SPRITE_KALEN_T_9        = SPRITE_BASE + 68
SPRITE_KALEN_T_10       = SPRITE_BASE + 69
SPRITE_KALEN_T_11       = SPRITE_BASE + 70
SPRITE_KALEN_T_12       = SPRITE_BASE + 71

SPRITE_KALEN_B_1        = SPRITE_BASE + 72
SPRITE_KALEN_B_2        = SPRITE_BASE + 73
SPRITE_KALEN_B_3        = SPRITE_BASE + 74
SPRITE_KALEN_B_4        = SPRITE_BASE + 75
SPRITE_KALEN_B_5        = SPRITE_BASE + 76
SPRITE_KALEN_B_6        = SPRITE_BASE + 77
SPRITE_KALEN_B_7        = SPRITE_BASE + 78
SPRITE_KALEN_B_8        = SPRITE_BASE + 79
SPRITE_KALEN_B_9        = SPRITE_BASE + 80
SPRITE_KALEN_B_10       = SPRITE_BASE + 81
SPRITE_KALEN_B_11       = SPRITE_BASE + 82
SPRITE_KALEN_B_12       = SPRITE_BASE + 83

SPRITE_KALEN_T_LOOK     = SPRITE_BASE + 84
SPRITE_KALEN_B_LOOK     = SPRITE_BASE + 88

SPRITE_EYE_L_1          = SPRITE_BASE + 92
SPRITE_EYE_L_2          = SPRITE_BASE + 93
SPRITE_EYE_L_3          = SPRITE_BASE + 94
SPRITE_EYE_L_4          = SPRITE_BASE + 95

SPRITE_EYE_R_1          = SPRITE_BASE + 96
SPRITE_EYE_R_2          = SPRITE_BASE + 97
SPRITE_EYE_R_3          = SPRITE_BASE + 98
SPRITE_EYE_R_4          = SPRITE_BASE + 99

SPRITE_FALLING_PLAYER_UR  = SPRITE_BASE + 85
SPRITE_FALLING_PLAYER_BL  = SPRITE_BASE + 86
SPRITE_FALLING_PLAYER_BR  = SPRITE_BASE + 87

SPRITE_RIZEK_FALLEN_L   = SPRITE_BASE + 89
SPRITE_RIZEK_FALLEN_R   = SPRITE_BASE + 90


TYPE_PLAYERUL           = 1
TYPE_PLAYERUR           = 2
TYPE_PLAYERML           = 3
TYPE_PLAYERMR           = 4
TYPE_PLAYERLL           = 5
TYPE_PLAYERLR           = 6
TYPE_INVISIBLE          = 7
TYPE_FLAG_L             = 8
TYPE_FLAG_R             = 9
TYPE_KALEN_T            = 10
TYPE_KALEN_B            = 11
TYPE_EYE_L              = 12
TYPE_EYE_R              = 13
TYPE_FALLING_PLAYER     = 14
TYPE_TORCH              = 15
TYPE_FLASH_T            = 16
TYPE_FLASH_B            = 17


!ifndef COMPILE_CRUNCHED {
;this creates a basic start
*=$0801
          ;SYS 2064
          !byte $0C,$08,$0A,$00,$9E,$20,$32,$30,$36,$34,$00,$00,$00,$00,$00
} else {
*=$080a
}


          ;init sprite registers
          ;no visible sprites
          lda #0
          sta VIC_SPRITE_ENABLE
          ;background black
          sta VIC_BACKGROUND_COLOR
          sta VIC_BORDER_COLOR
          ;set sprite flags
          sta VIC_SPRITE_X_EXTEND
          sta VIC_SPRITE_ENABLE
          sta VIC_SPRITE_MULTICOLOR

!ifndef BUILD_CARTRIDGE {          
          lda $ba
          sta LOAD_CODE_START
          bne .NoDefaultDriveNeeded
          
          lda #8
          sta LOAD_CODE_START
.NoDefaultDriveNeeded          
}

          ;VIC bank
          lda CIA_PRA
          and #$fc
          sta CIA_PRA

;!ifndef COMPILE_CRUNCHED {

          lda #$0b
          sta VIC_CONTROL_MODE
          sta VIC_WRITE_BYTE
          

          ;----------------------------------
          ;copy charset and sprites to target          
          ;----------------------------------
          
          ;block interrupts 
          ;since we turn ROMs off this would result in crashes if we didn't
          sei
          
          ;only RAM
          ;to copy under the IO rom
          lda #%00110000
          sta $01
          
          ;take source address from CHARSET
          LDA #<CHARSET_PANEL
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_PANEL
          STA ZEROPAGE_POINTER_1 + 1
          lda #00
          sta ZEROPAGE_POINTER_2
          lda #$F0
          sta ZEROPAGE_POINTER_2 + 1
          jsr CopyCharSetFree
          
          ;now copy
          ;jsr CopyCharSetPanel
          
          ;take source address from SPRITES
          lda #<SPRITES
          sta ZEROPAGE_POINTER_1
          lda #>SPRITES
          sta ZEROPAGE_POINTER_1 + 1
          lda #00
          sta ZEROPAGE_POINTER_2
          lda #$d0
          sta ZEROPAGE_POINTER_2 + 1
          
          lda #27
          sta PARAM2
          jsr CopyCharSetFreeSubset
          
          ;restore ROMs
          lda #$36
          sta $01
          cli


          
          ;enable multi color charset
          lda VIC_CONTROL
          ora #$10
          sta VIC_CONTROL

!ifndef NO_MUSIC {          
          ;start music
          lda #0
          jsr MUSIC_PLAYER
}
          
          
!zone MainLoop
;MainLoop
          lda #0
          ldy #1
          jsr ClearScreen

          ;Title level
          lda #0
          sta SCENE_FRAME_POS
          
!ifndef NO_LOGOS {          
          ;setup scene
          lda #0
          sta SCENE_NR

          jsr InitGameIRQ
          
          jsr SetupSceneLogo
} else {
          lda #1
          sta SCENE_NR

          jsr InitGameIRQ
          
          jsr SetupScene1
}
          lda #$1b
          sta VIC_WRITE_BYTE
          sta VIC_CONTROL_MODE
          
.TitleLoop
          lda SCENE_NR
          cmp #6
          bne +
          
          jmp Scene6
          
+          
          jsr WaitFrame
          
          lda #$10
          bit JOYSTICK_PORT_II
          bne .NotFirePressed
          
          jmp EndOfIntro
          
.NotFirePressed          
          jsr ObjectControl
          
          jsr SceneControl
          
          jmp .TitleLoop
          
          
          
!zone SetupScreen
SetupScreen
          ldx #0
          stx VIC_SPRITE_ENABLE
          lda #0
-          
          sta SPRITE_ACTIVE,x
          inx
          cpx #SPRITE_COUNT
          bne -
          
          ldx SCENE_NR
          lda #0
          ldy SCENE_CLEAR_COLOR,x
          jsr ClearScreen
          
          ldx SCENE_NR
          lda SCENE_CHAR_LO,x
          sta ZEROPAGE_POINTER_1
          lda SCENE_CHAR_HI,x
          sta ZEROPAGE_POINTER_1 + 1
          
          lda SCENE_LINE_COUNT,x
          sta PARAM2
          sta PARAM4
          ldy SCENE_LINE_START,x
          
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_3 + 1
          
.NextLine
          ldy #0
-          
          lda (ZEROPAGE_POINTER_1),y
          sta (ZEROPAGE_POINTER_3),y
          
          iny
          cpy #40
          bne -
          
          dec PARAM2
          beq +
          
          ;next line
          lda ZEROPAGE_POINTER_1
          clc
          adc #40
          sta ZEROPAGE_POINTER_1
          lda ZEROPAGE_POINTER_1 + 1
          adc #0
          sta ZEROPAGE_POINTER_1 + 1
          
          lda ZEROPAGE_POINTER_3
          clc
          adc #40
          sta ZEROPAGE_POINTER_3
          lda ZEROPAGE_POINTER_3 + 1
          adc #0
          sta ZEROPAGE_POINTER_3 + 1
          
          jmp .NextLine
          
+
          ;copy colors
          ldy SCENE_NR
          lda SCENE_COLOR_LO,y
          sta ZEROPAGE_POINTER_2
          lda SCENE_COLOR_HI,y
          sta ZEROPAGE_POINTER_2 + 1
          
          lda SCENE_LINE_COUNT,y
          sta PARAM2
          ldx SCENE_LINE_START,y
          
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) >> 8 )
          sta ZEROPAGE_POINTER_4 + 1
          
.NextLineColor
          ldy #0
          sty PARAM1
          sty PARAM4
-
          ;only half y to read
          ldy PARAM1
          lda (ZEROPAGE_POINTER_2),y
          pha
          lsr
          lsr
          lsr
          lsr
          ldy PARAM4
          sta (ZEROPAGE_POINTER_4),y
          
          pla
          and #$0f
          iny
          sta (ZEROPAGE_POINTER_4),y
          
          inc PARAM1
          inc PARAM4
          inc PARAM4
          iny
          cpy #40
          bne -
          
          dec PARAM2
          beq +
          
          ;next line
          lda ZEROPAGE_POINTER_2
          clc
          adc #20
          sta ZEROPAGE_POINTER_2
          lda ZEROPAGE_POINTER_2 + 1
          adc #0
          sta ZEROPAGE_POINTER_2 + 1
          lda ZEROPAGE_POINTER_4
          clc
          adc #40
          sta ZEROPAGE_POINTER_4
          lda ZEROPAGE_POINTER_4 + 1
          adc #0
          sta ZEROPAGE_POINTER_4 + 1
          
          jmp .NextLineColor
          
+
          ;scene char colors
          ldy SCENE_NR
          lda SCENE_CHARSET_MC_1,y
          sta VIC_CHARSET_MULTICOLOR_1
          lda SCENE_CHARSET_MC_2,y
          sta VIC_CHARSET_MULTICOLOR_2
          lda SCENE_BACK_COLOR,y
          sta VIC_BACKGROUND_COLOR
          lda SCENE_SPRITE_MC_1,y
          sta VIC_SPRITE_MULTICOLOR_1
          lda SCENE_SPRITE_MC_2,y
          sta VIC_SPRITE_MULTICOLOR_2
          rts

!ifndef NO_LOGOS {
!zone SetupSceneLogo
SetupSceneLogo
          
          ldy #0
          lda SCENE_CHARSET_MC_1,y
          sta VIC_CHARSET_MULTICOLOR_1
          lda SCENE_CHARSET_MC_2,y
          sta VIC_CHARSET_MULTICOLOR_2
          lda SCENE_BACK_COLOR,y
          sta VIC_BACKGROUND_COLOR
          lda SCENE_SPRITE_MC_1,y
          sta VIC_SPRITE_MULTICOLOR_1
          lda SCENE_SPRITE_MC_2,y
          sta VIC_SPRITE_MULTICOLOR_2

          lda #0
          ldy #0
          jsr ClearScreen
          
          ;copy psytronik logo
          LDA #<( CHARSET_5 + 192 * 8 )
          STA ZEROPAGE_POINTER_1
          LDA #>( CHARSET_5 + 192 * 8 )
          STA ZEROPAGE_POINTER_1 + 1

          LDA #<( $C000 + 192 * 8 )
          STA ZEROPAGE_POINTER_2
          LDA #>( $C000 + 192 * 8 )
          STA ZEROPAGE_POINTER_2 + 1
          
          lda #2
          sta PARAM2
          jsr CopyCharSetFreeSubset

          ;copy rgcd logo
          LDA #<( CHARSET_3 + 192 * 8 )
          STA ZEROPAGE_POINTER_1
          LDA #>( CHARSET_3 + 192 * 8 )
          STA ZEROPAGE_POINTER_1 + 1

          LDA #<( $C000 + 128 * 8 )
          STA ZEROPAGE_POINTER_2
          LDA #>( $C000 + 128 * 8 )
          STA ZEROPAGE_POINTER_2 + 1
          
          lda #2
          sta PARAM2
          jsr CopyCharSetFreeSubset
          
          ;copy logo char/color
          lda #0
          sta PARAM2
          
          lda #<( SCREEN_LOGO_DATA - 12 )
          sta ZEROPAGE_POINTER_1
          lda #>( SCREEN_LOGO_DATA - 12 )
          sta ZEROPAGE_POINTER_1 + 1
          lda #<( SCREEN_LOGO_COLOR - 12 )
          sta ZEROPAGE_POINTER_2
          lda #>( SCREEN_LOGO_COLOR - 12 )
          sta ZEROPAGE_POINTER_2 + 1

          lda SCREEN_LINE_OFFSET_TABLE_LO + 9
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI + 9
          sta ZEROPAGE_POINTER_3 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) >> 8 )
          sta ZEROPAGE_POINTER_4 + 1

--          
          
          ldy #12
          
-          
          lda (ZEROPAGE_POINTER_1),y
          sta (ZEROPAGE_POINTER_3),y
          lda (ZEROPAGE_POINTER_2),y
          sta (ZEROPAGE_POINTER_4),y
          
          iny
          cpy #( 12 + 15 )
          bne -
          
          inc PARAM2
          lda PARAM2
          cmp #4
          beq .Done
          
          lda ZEROPAGE_POINTER_1
          clc
          adc #15
          sta ZEROPAGE_POINTER_1
          lda ZEROPAGE_POINTER_1 + 1
          adc #0
          sta ZEROPAGE_POINTER_1 + 1
          lda ZEROPAGE_POINTER_2
          clc
          adc #15
          sta ZEROPAGE_POINTER_2
          lda ZEROPAGE_POINTER_2 + 1
          adc #0
          sta ZEROPAGE_POINTER_2 + 1
          
          lda ZEROPAGE_POINTER_3
          clc
          adc #40
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda ZEROPAGE_POINTER_3 + 1
          adc #0
          sta ZEROPAGE_POINTER_3 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) >> 8 )
          sta ZEROPAGE_POINTER_4 + 1
          
          jmp --
          
.Done     
          
          lda #$30
          sta VIC_MEMORY_CONTROL
          rts
}

!zone SetupScene1
SetupScene1
          lda #$0b
          sta VIC_WRITE_BYTE
          jsr WaitFrame

          ;set charset  for scene 2
          lda #$30
          sta VIC_MEMORY_CONTROL
          
          ;take source address from CHARSET
          LDA #<CHARSET_1
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_1
          STA ZEROPAGE_POINTER_1 + 1
          LDA #$00
          STA ZEROPAGE_POINTER_2
          LDA #$C0
          STA ZEROPAGE_POINTER_2 + 1
          jsr CopyCharSetFree
          
          jsr SetupScreen
          
          lda #23
          sta PARAM1
          lda #3
          sta PARAM2
          lda #TYPE_FLAG_L
          sta PARAM3
          lda #0
          sta PARAM6
          jsr AddObject
          
          lda #26
          sta PARAM1
          lda #TYPE_FLAG_R
          sta PARAM3
          jsr AddObject
          
          lda #0
          jsr SceneText
          
          jsr WaitFrame
          lda #$1b
          sta VIC_WRITE_BYTE
          rts


!zone SetupScene2
SetupScene2
          lda #$0b
          sta VIC_WRITE_BYTE

          ;take source address from CHARSET
          LDA #<CHARSET_2
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_2
          STA ZEROPAGE_POINTER_1 + 1
          LDA #$00
          STA ZEROPAGE_POINTER_2
          LDA #$C0
          STA ZEROPAGE_POINTER_2 + 1
          jsr CopyCharSetFree
          
          jsr SetupScreen
          
          ;torch
          lda #19
          sta PARAM1
          lda #11
          sta PARAM2
          lda #TYPE_TORCH
          sta PARAM3
          lda #7
          sta PARAM6
          jsr AddObject
          
          lda #2
          jsr SceneText
          
          lda #$1b
          sta VIC_WRITE_BYTE
          rts

          
!zone SetupScene3
SetupScene3
          lda #$0b
          sta VIC_WRITE_BYTE

          ;take source address from CHARSET
          LDA #<CHARSET_3
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_3
          STA ZEROPAGE_POINTER_1 + 1
          LDA #$00
          STA ZEROPAGE_POINTER_2
          LDA #$C0
          STA ZEROPAGE_POINTER_2 + 1
          jsr CopyCharSetFree
          
          jsr SetupScreen

          ;PARAM1 = X
          ;PARAM2 = Y
          ;PARAM3 = TYPE
          ;PARAM6 = color
          lda #19
          sta PARAM1
          lda #9
          sta PARAM2
          lda #TYPE_PLAYERUL
          sta PARAM3
          lda #0
          sta PARAM6
          jsr AddObject
          
          lda #22
          sta PARAM1
          lda #TYPE_PLAYERUR
          sta PARAM3
          jsr AddObject

          lda #19
          sta PARAM1
          lda #12
          sta PARAM2
          lda #TYPE_PLAYERML
          sta PARAM3
          jsr AddObject

          lda #22
          sta PARAM1
          lda #TYPE_PLAYERMR
          sta PARAM3
          jsr AddObject

          lda #19
          sta PARAM1
          lda #14
          sta PARAM2
          lda #TYPE_PLAYERLL
          sta PARAM3
          jsr AddObject

          lda #22
          sta PARAM1
          lda #TYPE_PLAYERLR
          sta PARAM3
          jsr AddObject
          
          lda #0
          sta SCENE_FRAME_POS
          sta SCENE_FRAME_DELAY
          
          lda #4
          jsr SceneText
          
          lda #$1b
          sta VIC_WRITE_BYTE
          rts
          


!zone SetupScene4
SetupScene4
          lda #$0b
          sta VIC_WRITE_BYTE

          ;take source address from CHARSET
          LDA #<CHARSET_4
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_4
          STA ZEROPAGE_POINTER_1 + 1
          LDA #$00
          STA ZEROPAGE_POINTER_2
          LDA #$C0
          STA ZEROPAGE_POINTER_2 + 1
          jsr CopyCharSetFree
          
          jsr SetupScreen
          
          lda #0
          sta SCENE_FRAME_POS
          sta SCENE_FRAME_DELAY
          
          
          lda #29
          sta PARAM1
          lda #12
          sta PARAM2
          lda #TYPE_TORCH
          sta PARAM3
          lda #7
          sta PARAM6
          jsr AddObject
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          lda #125
          sta VIC_SPRITE_Y_POS
          
          lda #6
          sta VIC_SPRITE_MULTICOLOR_1
          lda #5
          sta VIC_SPRITE_MULTICOLOR_2
          
          
          lda #$1b
          sta VIC_WRITE_BYTE
          rts
          

!zone SetupScene5
SetupScene5
          lda #$0b
          sta VIC_WRITE_BYTE

          LDA #<CHARSET_5
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_5
          STA ZEROPAGE_POINTER_1 + 1
          LDA #$00
          STA ZEROPAGE_POINTER_2
          LDA #$C0
          STA ZEROPAGE_POINTER_2 + 1
          jsr CopyCharSetFree
          
          jsr SetupScreen
          lda #0
          sta SCENE_FRAME_POS
          sta SCENE_FRAME_DELAY
          
          lda #17
          sta PARAM1
          lda #7
          sta PARAM2
          lda #TYPE_EYE_L
          sta PARAM3
          lda #1
          sta PARAM6
          jsr AddObject
          
          lda #22
          sta PARAM1
          lda #TYPE_EYE_R
          sta PARAM3
          lda #1
          sta PARAM6
          jsr AddObject
          
          lda #6
          jsr SceneText
          
          lda #$1b
          sta VIC_WRITE_BYTE
          rts
          
!ifndef BUILD_CARTRIDGE {
!zone SetupScene6
SetupScene6
          lda #$0b
          sta VIC_WRITE_BYTE

          ;take source address from CHARSET
          LDA #<CHARSET_LOGO
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_LOGO
          STA ZEROPAGE_POINTER_1 + 1
          LDA #$00
          STA ZEROPAGE_POINTER_2
          LDA #$C0
          STA ZEROPAGE_POINTER_2 + 1
          jsr CopyCharSetFree
          
          lda #0
          ldy #9
          jsr ClearScreen
          
          ;soulless logo
          lda SCREEN_LINE_OFFSET_TABLE_LO + 9
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI + 9
          sta ZEROPAGE_POINTER_3 + 1
          clc
          adc #>( SCREEN_COLOR - SCREEN_CHAR )
          sta ZEROPAGE_POINTER_4 + 1
          
          lda #5
          sta PARAM2
          ldx #0
          
--          
          ldy #6
          
-          
          lda SOULLESS_LOGO_CHAR,x
          sta (ZEROPAGE_POINTER_3),y
          lda #14
          sta (ZEROPAGE_POINTER_4),y
          
          
          inx
          iny
          cpy #(6 + 28)
          bne -
          
          lda ZEROPAGE_POINTER_3
          clc
          adc #40
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda ZEROPAGE_POINTER_3 + 1
          adc #0
          sta ZEROPAGE_POINTER_3 + 1
          clc
          adc #>( SCREEN_COLOR - SCREEN_CHAR )
          sta ZEROPAGE_POINTER_4 + 1

          dec PARAM2
          bne --
          
          lda #9
          sta VIC_CHARSET_MULTICOLOR_1
          lda #12
          sta VIC_CHARSET_MULTICOLOR_2
          
          lda #<TEXT_LOADING
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_LOADING
          sta ZEROPAGE_POINTER_1 + 1
          lda #11
          sta PARAM1
          lda #24
          sta PARAM2
          lda #1
          sta PARAM3

          jsr DisplayText
          lda #$1b
          sta VIC_WRITE_BYTE
          rts
}

;-----------------------------------
;init IRQ
;-----------------------------------
!zone InitGameIRQ
InitGameIRQ
         
          ;wait for exact frame so we don't end up on the wrong
          ;side of the raster
          jsr WaitFrame
          sei

          lda #$36 ; make sure that IO regs at $dxxx
          sta $01 ;are visible

          lda #$7f ;disable cia #1 generating timer irqs
          sta $dc0d ;which are used by the system to flash cursor, etc

          lda #$01 ;tell VIC we want him generate raster irqs
          sta $d01a

          ;setup with first zone
          lda #RASTER_BOTTOM_POS
          sta VIC_RASTER_POS

          ;MSB of d011 is the MSB of the requested rasterline
          ;as rastercounter goes from 0-312
          lda VIC_WRITE_BYTE
          sta VIC_CONTROL_MODE

          ;set irq vector to point to our routine
          lda #<IrqGame
          sta $0314
          lda #>IrqGame
          sta $0315

          ;acknowledge any pending cia timer interrupts
          ;this is just so we're 100% safe
          lda $dc0d 
          lda $dd0d 
          lda $d019
          sta $d019

          cli
          rts


;-----------------------------------
;release IRQ
;-----------------------------------
!zone ReleaseGameIRQ
ReleaseGameIRQ
            
          sei

          lda #$36 ; make sure that IO regs at $dxxx
          sta $01 ;are visible

          lda #$ff ;enable cia #1 generating timer irqs
          sta $dc0d ;which are used by the system to flash cursor, etc

          ;no more raster irqs
          lda #$00 
          sta $d01a

          lda #$31
          sta $0314
          lda #$EA
          sta $0315

          ;acknowledge any pending cia timer interrupts
          ;this is just so we're 100% safe
          lda $dc0d 
          lda $dd0d 

          cli
          rts



;------------------------------------------------------------
;Scene Management
;------------------------------------------------------------
!zone SceneControl
SceneControl
          jsr UpdateSceneText
          
          ldy SCENE_NR
          
          lda SCENE_CODE_TABLE_LO,y
          sta .JumpPos + 1
          lda SCENE_CODE_TABLE_HI,y
          sta .JumpPos + 2
          
          
.JumpPos          
          jmp $a000
          
SCENE_CODE_TABLE_LO
          !byte <SceneLogo
          !byte <Scene1
          !byte <Scene2
          !byte <Scene3
          !byte <Scene4
          !byte <Scene5
          !byte <Scene6
SCENE_CODE_TABLE_HI
          !byte >SceneLogo
          !byte >Scene1
          !byte >Scene2
          !byte >Scene3
          !byte >Scene4
          !byte >Scene5
          !byte >Scene6
          
          
!zone SceneLogo
SceneLogo

!ifndef NO_LOGOS {
          inc SCENE_FRAME_DELAY
          lda SCENE_FRAME_DELAY
          and #$07
          beq .SceneStep
          rts
          
.SceneStep    
          inc SCENE_FRAME_POS
          lda SCENE_FRAME_POS
          cmp #45
          beq .RGCDLogo
          cmp #90
          bne +
          
          lda #0
          sta SCENE_FRAME_POS
          inc SCENE_NR
          jsr SetupScene1
+          
          rts

          
.RGCDLogo
          ;rgcd logo
          lda SCREEN_LINE_OFFSET_TABLE_LO + 9
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI + 9
          sta ZEROPAGE_POINTER_3 + 1
          clc
          adc #>( SCREEN_COLOR - SCREEN_CHAR )
          sta ZEROPAGE_POINTER_4 + 1
          
          ;lda #148
          lda #0
          sta PARAM1
          lda #4
          sta PARAM2
          ldx #0
          
--          
          ldy #12
          
-          
          lda RGCD_LOGO_DATA,x
          sta (ZEROPAGE_POINTER_3),y
          lda #14
          sta (ZEROPAGE_POINTER_4),y
          
          
          inx
          iny
          cpy #(12 + 15)
          bne -
          
          lda ZEROPAGE_POINTER_3
          clc
          adc #40
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda ZEROPAGE_POINTER_3 + 1
          adc #0
          sta ZEROPAGE_POINTER_3 + 1
          clc
          adc #>( SCREEN_COLOR - SCREEN_CHAR )
          sta ZEROPAGE_POINTER_4 + 1

          dec PARAM2
          bne --
          
          lda #12
          sta VIC_CHARSET_MULTICOLOR_1
          lda #3
          sta VIC_CHARSET_MULTICOLOR_2
          rts
}
          
!zone Scene1
Scene1
          lda SCENE_FRAME_DELAY
          beq .ShowStep
          
          dec SCENE_FRAME_DELAY
          rts
          
.ShowStep          
          ldy SCENE_FRAME_POS
          inc SCENE_FRAME_POS
          lda SCENE_1_STEPS_PAUSE,y
          sta SCENE_FRAME_DELAY
          
          cpy #2
          beq NextText
          cpy #5
          beq .SceneDone
          rts

.SceneDone
          inc SCENE_NR
          jmp SetupScene2
          
NextText
          lda #1
          jmp SceneText
          
SCENE_1_STEPS_PAUSE
          !byte 250
          !byte 110
          !byte 1
          !byte 250
          !byte 50
          !byte 0


!zone Scene2
Scene2
          lda SCENE_FRAME_POS
          cmp #100
          bcc +
 
          ;flash color
          lda VIC_CHARSET_MULTICOLOR_1
          eor #$08
          sta VIC_CHARSET_MULTICOLOR_1
+          

          inc SCENE_FRAME_DELAY
          lda SCENE_FRAME_DELAY
          and #$07
          beq .SceneStep
          rts
          
.SceneStep    
          inc SCENE_FRAME_POS
          
          lda SCENE_FRAME_POS
          cmp #190
          beq .NextScene
          cmp #50
          beq .AddKalen
          cmp #90
          beq .KalenLookAtPlayer
          cmp #100
          beq .AddFlash
          cmp #57
          bne ++
          lda #6
          sta VIC_SPRITE_MULTICOLOR_1
          jmp +
          
++          
          cmp #59
          bne +
          
          lda #3
          sta VIC_SPRITE_MULTICOLOR_1
          lda #11
          sta VIC_SPRITE_MULTICOLOR_2
          lda #6
          sta VIC_SPRITE_COLOR + 1
          sta VIC_SPRITE_COLOR + 2
+          
          rts

.KalenLookAtPlayer
          lda #3
          jmp SceneText


.NextScene
          inc SCENE_NR
          jmp SetupScene3
          
.AddKalen
          ;kalen
          lda #0
          sta PARAM1
          lda #14
          sta PARAM2
          lda #TYPE_KALEN_T
          sta PARAM3
          lda #0
          sta PARAM6
          jsr AddObject
          
          lda #16
          sta PARAM2
          lda #TYPE_KALEN_B
          sta PARAM3
          jmp AddObject


.AddFlash
          ;kalen
          lda #31
          sta PARAM1
          lda #14
          sta PARAM2
          lda #TYPE_FLASH_T
          sta PARAM3
          lda #1
          sta PARAM6
          jsr AddObject
          
          lda #16
          sta PARAM2
          lda #TYPE_FLASH_B
          sta PARAM3
          jmp AddObject

!zone Scene3
Scene3
          lda SCENE_FRAME_DELAY
          and #$04
          beq .FlashColors
          jmp .UpdateScene
          
.FlashColors
          lda SCENE_FRAME_DELAY
          lsr
          lsr
          lsr
          and #$03
          tay
          
          lda SCENE_3_COLOR_FLASH_1,y
          sta VIC_CHARSET_MULTICOLOR_1
          lda SCENE_3_COLOR_FLASH_2,y
          sta VIC_CHARSET_MULTICOLOR_2
          lda SCENE_3_COLOR_FLASH_3,y
          sta PARAM4
          
          ;color cycle the screen part
          ldx #6
          
-          
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) >> 8 )
          sta ZEROPAGE_POINTER_3 + 1
          
          lda PARAM4
          ldy #15
          
--
          sta (ZEROPAGE_POINTER_3),y
          iny
          cpy #25
          bne --
          
          inx
          cpx #18
          bne -
          
.UpdateScene          
          ldy SCENE_FRAME_POS
          lda SCENE_3_STEPS_PAUSE,y
          cmp SCENE_FRAME_DELAY
          beq .NextSceneStep
          
          inc SCENE_FRAME_DELAY
          rts
          
.NextSceneStep
          inc SCENE_FRAME_POS          
          lda #0
          sta SCENE_FRAME_DELAY
          
          ldy SCENE_FRAME_POS
          lda SCENE_3_STEPS,y
          cmp #255
          beq .NextScene
          tay
          lda SCENE_3_STEPS_SPRITE_1,y
          sta SPRITE_POINTER_BASE
          lda SCENE_3_STEPS_SPRITE_2,y
          sta SPRITE_POINTER_BASE + 1
          lda SCENE_3_STEPS_SPRITE_3,y
          sta SPRITE_POINTER_BASE + 2
          lda SCENE_3_STEPS_SPRITE_4,y
          sta SPRITE_POINTER_BASE + 3
          lda SCENE_3_STEPS_SPRITE_5,y
          sta SPRITE_POINTER_BASE + 4
          lda SCENE_3_STEPS_SPRITE_6,y
          sta SPRITE_POINTER_BASE + 5
          
          ;move player left for frame 4
          ldy SCENE_FRAME_POS
          cpy #9
          bne +
 
          ;move player to the left
          ldx #6
          
-          
          dex
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          jsr MoveSpriteLeft
          
          cpx #0
          bne -
          
+          
          rts
          
.NextScene
          inc SCENE_NR
          jmp SetupScene4
          
;1,1,1,1,1,2,3,4,3,4,3,4,4,4,4,4,5           
SCENE_3_STEPS
          !byte 0
          !byte 0
          !byte 1
          !byte 2
          !byte 3
          !byte 2
          !byte 3
          !byte 2
          !byte 3
          !byte 4
          !byte 4
          !byte 255
          
SCENE_3_STEPS_PAUSE
          !byte 240
          !byte 240
          !byte 76
          !byte 40
          !byte 25
          !byte 50
          !byte 25
          !byte 50
          !byte 25
          !byte 250
          !byte 140
          !byte 0    
          
SCENE_3_STEPS_SPRITE_1
          !byte SPRITE_PLAYER_UL_1
          !byte SPRITE_PLAYER_UL_2
          !byte SPRITE_PLAYER_UL_3
          !byte SPRITE_PLAYER_UL_4
          !byte SPRITE_PLAYER_UL_5
SCENE_3_STEPS_SPRITE_2
          !byte SPRITE_PLAYER_UR_1
          !byte SPRITE_PLAYER_UR_2
          !byte SPRITE_PLAYER_UR_3
          !byte SPRITE_PLAYER_UR_4
          !byte SPRITE_PLAYER_UR_5
SCENE_3_STEPS_SPRITE_3
          !byte SPRITE_PLAYER_ML_1
          !byte SPRITE_PLAYER_ML_2
          !byte SPRITE_PLAYER_ML_3
          !byte SPRITE_PLAYER_ML_4
          !byte SPRITE_PLAYER_ML_5
SCENE_3_STEPS_SPRITE_4
          !byte SPRITE_PLAYER_MR_1
          !byte SPRITE_PLAYER_MR_2
          !byte SPRITE_PLAYER_MR_3
          !byte SPRITE_PLAYER_MR_4
          !byte SPRITE_PLAYER_MR_5
SCENE_3_STEPS_SPRITE_5
          !byte SPRITE_PLAYER_LL_1
          !byte SPRITE_PLAYER_LL_2
          !byte SPRITE_PLAYER_LL_3
          !byte SPRITE_PLAYER_LL_4
          !byte SPRITE_PLAYER_LL_5
SCENE_3_STEPS_SPRITE_6
          !byte SPRITE_PLAYER_LR_1
          !byte SPRITE_PLAYER_LR_2
          !byte SPRITE_PLAYER_LR_3
          !byte SPRITE_PLAYER_LR_4
          !byte SPRITE_PLAYER_LR_5
          
      
          
!zone Scene4
Scene4
          inc SCENE_FRAME_DELAY
          lda SCENE_FRAME_DELAY
          and #$07
          beq +
          rts
          
+
          inc SCENE_FRAME_POS
          lda SCENE_FRAME_POS
          cmp #130
          beq .NextScene
          cmp #10
          bne +
          jmp .Scene4AddText
+
          cmp #40
          bne +
          jmp .Scene4AddPlayer         
+          
          rts
          
          
.NextScene
          inc SCENE_NR
          jmp SetupScene5


* = $1000

!bin "soulless_intro_18.bin"


.Scene4AddText
          lda #5
          jmp SceneText


.Scene4AddPlayer
          ;player
          lda #18
          sta PARAM1
          lda #2
          sta PARAM2
          lda #TYPE_FALLING_PLAYER
          sta PARAM3
          lda #0
          sta PARAM6
          jsr AddObject
          
          lda #15
          sta PARAM1
          lda #5
          sta PARAM2
          jsr AddObject
          lda #SPRITE_FALLING_PLAYER_BL
          sta SPRITE_POINTER_BASE,x
          dec SPRITE_POS_Y,x
          dec SPRITE_POS_Y,x
          dec SPRITE_POS_Y,x
          
          lda #18
          sta PARAM1
          jsr AddObject
          lda #SPRITE_FALLING_PLAYER_BR
          sta SPRITE_POINTER_BASE,x
          dec SPRITE_POS_Y,x
          dec SPRITE_POS_Y,x
          dec SPRITE_POS_Y,x
          rts

!zone Scene5
Scene5
          inc SCENE_FRAME_DELAY
          lda SCENE_FRAME_DELAY
          and #$07
          beq +
          rts
          
+
          lda #0
          sta SCENE_FRAME_DELAY
          inc SCENE_FRAME_POS
          lda SCENE_FRAME_POS
          beq +++
          cmp #80
          beq +
          cmp #160
          beq ++
          rts

+
          lda #7
          jmp SceneText
++
          lda #8
          jmp SceneText
+++
          inc SCENE_NR
          
!ifndef BUILD_CARTRIDGE {          
          jsr SetupScene6
}
          rts
          
          
!ifdef BUILD_CARTRIDGE {
!zone Scene6
EndOfIntro
Scene6
          jsr ReleaseGameIRQ
          
          ldy #2
          jmp $0400
}
          
!ifndef BUILD_CARTRIDGE {
!zone Scene6
Scene6
          lda #0
          sta PARAM1

          lda VIC_CONTROL
          ora #$10
          sta VIC_CONTROL

          ldy #122          ;rasterbar start.
          ldx TITLE_COLOR_OFFSET
loop      lda colors,x     ;load value at label 'colors' plus x into a. if we don't add x, only the first 
                          ;value from our color-table will be read.
-
          cpy VIC_RASTER_POS        ;ComPare current value in Y with the current rasterposition.
          bne -          ;is the value of Y not equal to current rasterposition? then jump back 3 bytes (to cpy).

          sta VIC_CHARSET_MULTICOLOR_2
          ;sta VIC_BORDER_COLOR
                            ;if it IS equal, store the current value of A (a color of our rasterbar)
                            ;into the bordercolour
          inc PARAM1
          lda PARAM1
          cmp #51
          beq .End

          inx              ;increase X. so now we're gonna read the next color out of the table.
          cpx #51
          bne .NoXOverFlow
          
          ldx #0
          
.NoXOverFlow          
          iny              ;increase Y. go to the next rasterline.

          jmp loop         ;jump to loop.
          
.End
          inc TITLE_COLOR_OFFSET
          lda TITLE_COLOR_OFFSET
          cmp #51
          bne .NoOverFlow
          
          lda #0
          sta TITLE_COLOR_OFFSET
.NoOverFlow          

          ;jsr WaitFrame
          
          lda JOYSTICK_PORT_II
          and #$10
          beq .FirePressed
          jmp Scene6
          
          
.FirePressed
          jmp .LoadGame


colors
          !byte $06,$06,$06,$0e,$06,$0e
          !byte $0e,$06,$0e,$0e,$0e,$03
          !byte $0e,$03,$03,$0e,$03,$03
          !byte $03,$01,$03,$01,$01,$03
          !byte $01,$01,$01,$03,$01,$01
          !byte $03,$01,$03,$03,$03,$0e
          !byte $03,$03,$0e,$03,$0e,$0e
          !byte $0e,$06,$0e,$0e,$06,$0e
          !byte $06,$06,$06,$00,$00,$00

          !byte $ff

TITLE_COLOR_OFFSET  
          !byte 0
          
          
EndOfIntro          
          ;prepare loading/unpacking of main game
.LoadGame
          lda #$0b
          sta VIC_WRITE_BYTE
          sta VIC_CONTROL_MODE
          
          jsr ReleaseGameIRQ
          
          ;SID resetten
          ldy #0
          lda #0
.sidloop
          sta $d400,y
          iny
          cpy #$19
          bne .sidloop
          
          lda #$3c
          sta VIC_MEMORY_CONTROL
          
          lda #0
          sta VIC_SPRITE_ENABLE
          ldy #1
          jsr ClearScreen
          
          ;copy load code
          lda #<LOAD_CODE_START
          sta ZEROPAGE_POINTER_1
          lda #>LOAD_CODE_START
          sta ZEROPAGE_POINTER_1 + 1
          
          lda #<$2a7
          sta ZEROPAGE_POINTER_2
          lda #>$2a7
          sta ZEROPAGE_POINTER_2 + 1
          
          ldy #0
          
-          
          lda (ZEROPAGE_POINTER_1),y
          sta (ZEROPAGE_POINTER_2),y
          
          iny
          cpy #( LOAD_CODE_END - LOAD_CODE_START )
          bne -
          
          ;jsr WaitFrame
          
          lda #$1b
          sta VIC_CONTROL_MODE
          
          lda #$37
          sta $01
          
          lda #0
          sta PARAM1
          ;jmp LOAD_CODE
          jmp DoLoad

!source "load.asm"
}

;------------------------------------------------------------
;move object right
;x = object index
;------------------------------------------------------------
!zone ObjectMoveRight
ObjectMoveRight
                    
          inc SPRITE_CHAR_POS_X_DELTA,x
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          inc SPRITE_CHAR_POS_X,x
          
.NoCharStep          
          jmp MoveSpriteRight
          
          
          
;------------------------------------------------------------
;CalcSpritePosFromCharPos
;calculates the real sprite coordinates from screen char pos
;and sets them directly
;SPRITE_CHAR_POS_X = char_pos_x
;PARAM2
;X      = sprite index
;------------------------------------------------------------
!zone CalcSpritePosFromCharPos    
CalcSpritePosFromCharPos

          ;offset screen to border 24,50
          lda #0
          sta SPRITE_POS_X_EXTEND,x
          
          ;need extended x bit?
          lda SPRITE_CHAR_POS_X,x
          cmp #30
          bcc .NoXBit
          
          lda #1
          sta SPRITE_POS_X_EXTEND,x
          
          ;update extended x bit
          lda BIT_TABLE,x
          ora VIC_SPRITE_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
          jmp .XBitSet
          
.NoXBit   
          lda BIT_TABLE,x
          eor #$ff
          and VIC_SPRITE_X_EXTEND
          sta VIC_SPRITE_X_EXTEND

.XBitSet
          ;calculate sprite positions (offset from border)
          txa
          asl
          tay
          
          ;X = charX * 8 + ( 24 - SPRITE_CENTER_OFFSET_X=8 )
          lda SPRITE_CHAR_POS_X,x
          asl
          asl
          asl
          clc
          adc #( 24 - SPRITE_CENTER_OFFSET_X )
          sta SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
          
          ;Y = charY * 8 + ( 50 - SPRITE_CENTER_OFFSET_Y=11 )
          lda PARAM2
          asl
          asl
          asl
          clc
          adc #( 50 - SPRITE_CENTER_OFFSET_Y )
          sta SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS,y
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          rts




;------------------------------------------------------------
;Move Sprite Left
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteLeft
MoveSpriteLeft
          dec SPRITE_POS_X,x
          bpl .NoChangeInExtendedFlag
          
          lda BIT_TABLE,x
          eor #$ff
          and VIC_SPRITE_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
          lda #0
          sta SPRITE_POS_X_EXTEND,x
          
.NoChangeInExtendedFlag     
          txa
          asl
          tay
          
          lda SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
          rts  

;------------------------------------------------------------
;Move Sprite Right
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteRight
MoveSpriteRight
          inc SPRITE_POS_X,x
          lda SPRITE_POS_X,x
          bne .NoChangeInExtendedFlag
          
          lda BIT_TABLE,x
          ora SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
.NoChangeInExtendedFlag     
          txa
          asl
          tay
          
          lda SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
          rts  

;------------------------------------------------------------
;Move Sprite Up
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteUp
MoveSpriteUp
          dec SPRITE_POS_Y,x
          txa
          asl
          tay
          lda SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS,y
          rts  

;------------------------------------------------------------
;Move Sprite Down
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteDown
MoveSpriteDown
          inc SPRITE_POS_Y,x
          txa
          asl
          tay
          lda SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS,y
          rts  
;------------------------------------------------------------
;adds object
;PARAM1 = X
;PARAM2 = Y
;PARAM3 = TYPE
;PARAM6 = color
;------------------------------------------------------------

!zone AddObject
AddObject
          jsr FindEmptySpriteSlot
          bne .FoundSlot
          jmp .NoFreeSlot
          
.FoundSlot          
          lda PARAM1
          sta SPRITE_CHAR_POS_X,x
          lda PARAM3
          sta SPRITE_ACTIVE,x
          
          ;PARAM1 and PARAM2 hold x,y already
          jsr CalcSpritePosFromCharPos

          ;enable sprite
          lda BIT_TABLE,x
          ora VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE

          ;sprite color
          lda PARAM6
          sta VIC_SPRITE_COLOR,x
          ldy SPRITE_ACTIVE,x
          lda TYPE_START_MULTICOLOR,y
          beq .NoMulticolor
          
          lda BIT_TABLE,x
          ora VIC_SPRITE_MULTICOLOR
          sta VIC_SPRITE_MULTICOLOR
          jmp .MultiColorDone
          
.NoMulticolor          
          lda BIT_TABLE,x
          eor #$ff
          and VIC_SPRITE_MULTICOLOR
          sta VIC_SPRITE_MULTICOLOR

.MultiColorDone      
          
          ;initialise enemy values
          ldy SPRITE_ACTIVE,x
          lda TYPE_START_SPRITE,y
          sta SPRITE_POINTER_BASE,x
          
          ;look right per default
          lda #0
          sta SPRITE_ANIM_POS,x
          sta SPRITE_ANIM_DELAY,x
          sta SPRITE_STATE,x
          
          lda TYPE_START_SPRITE_OFFSET_X,y
          sta PARAM4
          
.AdjustX          
          beq .NoXMovementNeeded
          jsr MoveSpriteLeft
          dec PARAM4
          jmp .AdjustX
          
.NoXMovementNeeded
          ldy SPRITE_ACTIVE,x
          lda TYPE_START_SPRITE_OFFSET_Y,y
          sta PARAM4
.AdjustY
          beq .NoYMovementNeeded
          jsr MoveSpriteUp
          dec PARAM4
          jmp .AdjustY

.NoYMovementNeeded
.NoFreeSlot          
          rts
          
          
          



!zone WaitFrame
          ;wait for the raster to reach line $f8
          ;this is keeping our timing stable
          
          ;are we on line $F8 already? if so, wait for the next full screen
          ;prevents mistimings if called too fast
WaitFrame 
          lda VIC_RASTER_POS
          cmp #$Fe
          beq WaitFrame

          ;wait for the raster to reach line $f8 (should be closer to the start of this line this way)
.WaitStep2
          lda VIC_RASTER_POS
          cmp #$Fe
          bne .WaitStep2
          
          rts
;------------------------------------------------------------
;Looks for an empty sprite slot, returns in X
;#1 in A when empty slot found, #0 when full
;------------------------------------------------------------

!zone FindEmptySpriteSlot
FindEmptySpriteSlot
          ldx #0
.CheckSlot          
          lda SPRITE_ACTIVE,x
          beq .FoundSlot
          
          inx
          cpx #SPRITE_COUNT
          bne .CheckSlot
          
          lda #0
          rts
          
.FoundSlot
          lda #1
          rts


;------------------------------------------------------------
;clears the full screen
;A = char
;Y = color
;------------------------------------------------------------

!zone ClearScreen
ClearScreen
          ldx #$00
.ClearLoop          
          sta SCREEN_CHAR,x
          sta SCREEN_CHAR + 250,x
          sta SCREEN_CHAR + 500,x
          sta SCREEN_CHAR + 750,x
          inx
          cpx #250
          bne .ClearLoop

          tya
          ldx #$00
.ColorLoop          
          sta $d800,x
          sta $d800 + 250,x
          sta $d800 + 500,x
          sta $d800 + 750,x
          inx        
          cpx #250
          bne .ColorLoop
          rts


!ifndef BUILD_CARTRIDGE {
;------------------------------------------------------------
;displays a line of text
;ZEROPAGE_POINTER_1 = pointer to text
;PARAM1 = X
;PARAM2 = Y
;PARAM3 = color
;modifies ZEROPAGE_POINTER_2 and ZEROPAGE_POINTER_3

!zone DisplayText
DisplayText
          ldy #0
          
.DisplayLine          
          ldx PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1

          lda ZEROPAGE_POINTER_2
          clc
          adc PARAM1
          sta ZEROPAGE_POINTER_2
          lda ZEROPAGE_POINTER_2 + 1
          adc #0
          sta ZEROPAGE_POINTER_2 + 1
          lda ZEROPAGE_POINTER_3
          clc
          adc PARAM1
          sta ZEROPAGE_POINTER_3
          lda ZEROPAGE_POINTER_3 + 1
          adc #0
          sta ZEROPAGE_POINTER_3 + 1

.InLineLoop
          lda (ZEROPAGE_POINTER_1),y
          cmp #$ff
          beq .EndMarkerReached
          cmp #$fe
          beq .LineBreak
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM3
          sta (ZEROPAGE_POINTER_3),y
          iny
          jmp .InLineLoop
        
.LineBreak
          iny
          tya
          clc
          adc ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_1
          lda #0
          adc ZEROPAGE_POINTER_1 + 1
          sta ZEROPAGE_POINTER_1 + 1

          inc PARAM2
          ldy #0
          jmp .DisplayLine
            
.EndMarkerReached
          rts
}

;------------------------------------------------------------
;Enemy Behaviour
;------------------------------------------------------------
!zone ObjectControl
ObjectControl
          ldx #0
          
.ObjectLoop          
          ldy SPRITE_ACTIVE,x
          beq .NextObject
          
          ;enemy is active
          dey
          lda ENEMY_BEHAVIOUR_TABLE_LO,y
          sta .JumpPointer + 1
          lda ENEMY_BEHAVIOUR_TABLE_HI,y
          sta .JumpPointer + 2
          
.JumpPointer          
          jsr $8000
          
.NextObject          
          inx
          cpx #SPRITE_COUNT
          bne .ObjectLoop
          rts
          
          


;------------------------------------------------------------
;copies charset from ZEROPAGE_POINTER_1 to ZEROPAGE_POINTER_2
;PARAM2 = num of 256 byte blocks (usually 8)
;------------------------------------------------------------

!zone CopyCharSetFree
CopyCharSetFree
          lda #8
          sta PARAM2

CopyCharSetFreeSubset
          ;set target address
          ldx #$00
          ldy #$00

.NextLine
          lda (ZEROPAGE_POINTER_1),Y
          sta (ZEROPAGE_POINTER_2),Y
          inx
          iny
          cpx #$08
          bne .NextLine
          cpy #$00
          bne .PageBoundaryNotReached
          
          ;we've reached the next 256 bytes, inc high byte
          inc ZEROPAGE_POINTER_1 + 1
          inc ZEROPAGE_POINTER_2 + 1
          dec PARAM2
          beq .CopyCharsetDone
          
.PageBoundaryNotReached          
          ldx #$00
          jmp .NextLine

.CopyCharsetDone
          rts


;------------------------------------------------------------
;flag l
;------------------------------------------------------------

!zone BehaviourFlagL
BehaviourFlagL
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          and #$03
          bne +
 
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #6
          bne ++
  
          lda #0
          sta SPRITE_ANIM_POS,x
++          
          asl
          clc
          adc #SPRITE_FLAG_L_1
          sta SPRITE_POINTER_BASE,x
+

NoBehaviour          
          rts


;------------------------------------------------------------
;flag r
;------------------------------------------------------------

!zone BehaviourFlagR
BehaviourFlagR
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          and #$03
          bne +++
 
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #6
          bne ++
  
          lda #0
          sta SPRITE_ANIM_POS,x
++        
          asl
          clc
          adc #SPRITE_FLAG_R_1
          sta SPRITE_POINTER_BASE,x
+++
          rts



;------------------------------------------------------------
;Kalen Top
;------------------------------------------------------------

!zone BehaviourKalenTop
BehaviourKalenTop
          lda SPRITE_CHAR_POS_X,x
          cmp #30
          beq +
          
          jsr ObjectMoveRight
          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          and #$03
          bne +++
 
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #12
          bne ++
  
          lda #0
          sta SPRITE_ANIM_POS,x
++          
          clc
          adc #SPRITE_KALEN_T_1
          sta SPRITE_POINTER_BASE,x
+++          
          rts
+
          lda #SPRITE_KALEN_T_LOOK
          sta SPRITE_POINTER_BASE + 1
          lda #SPRITE_KALEN_B_LOOK
          sta SPRITE_POINTER_BASE + 2
          rts


;------------------------------------------------------------
;left eye
;------------------------------------------------------------

!zone BehaviourEyeL
BehaviourEyeL
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          and #$03
          bne +
 
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #16
          bne ++
  
          lda #0
          sta SPRITE_ANIM_POS,x
++          
          tay
          lda EYE_ANIM_TABLE,y
          clc
          adc #SPRITE_EYE_L_1
          sta SPRITE_POINTER_BASE,x
+
          rts


;------------------------------------------------------------
;right eye
;------------------------------------------------------------

!zone BehaviourEyeR
BehaviourEyeR
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          and #$03
          bne +
 
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #16
          bne ++
  
          lda #0
          sta SPRITE_ANIM_POS,x
++          
          tay
          lda EYE_ANIM_TABLE,y
          clc
          adc #SPRITE_EYE_R_1
          sta SPRITE_POINTER_BASE,x
+
          rts


;------------------------------------------------------------
;Kalen Bottom
;------------------------------------------------------------

!zone BehaviourKalenBottom
BehaviourKalenBottom
          lda SPRITE_CHAR_POS_X,x
          cmp #30
          beq +

          jsr ObjectMoveRight
          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          and #$03
          bne +++
 
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #12
          bne ++
  
          lda #0
          sta SPRITE_ANIM_POS,x
++          
          clc
          adc #SPRITE_KALEN_B_1
          sta SPRITE_POINTER_BASE,x
+++          
          rts
+
          lda #SPRITE_KALEN_T_LOOK
          sta SPRITE_POINTER_BASE + 1
          lda #SPRITE_KALEN_B_LOOK
          sta SPRITE_POINTER_BASE + 2
          rts


;------------------------------------------------------------
;Rizek falling
;------------------------------------------------------------

!zone RizekFalling
RizekFalling
          lda SPRITE_ANIM_POS,x
          cmp #60
          beq +
          
          jsr MoveSpriteDown
          jsr MoveSpriteDown
          inc SPRITE_ANIM_POS,x
          
          lda SPRITE_ANIM_POS,x
          cmp #60
          bne +
          
          ;land
          lda RIZEK_FALLING_END_SPRITE - 1,x
          sta SPRITE_POINTER_BASE,x
+
          rts


;------------------------------------------------------------
;Torch
;------------------------------------------------------------
!zone BehaviourTorch
BehaviourTorch          
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          clc
          adc #SPRITE_TORCH_1
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate
          rts

;------------------------------------------------------------
;Torch
;------------------------------------------------------------
!zone BehaviourFlashT
BehaviourFlashT          
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$07
          clc
          adc #SPRITE_FLASH_T_1
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate
          rts

;------------------------------------------------------------
;Torch
;------------------------------------------------------------
!zone BehaviourFlashB
BehaviourFlashB          
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$07
          clc
          adc #SPRITE_FLASH_B_1
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate
          rts

;------------------------------------------------------------
;irq routine
;------------------------------------------------------------
!zone IrqGame
IrqGame
          ;acknowledge VIC irq
          lda $d019
          sta $d019
          
          ;setup with first zone
          lda #0
          sta VIC_RASTER_POS

          ;MSB of d011 is the MSB of the requested rasterline
          ;as rastercounter goes from 0-312
          lda VIC_WRITE_BYTE
          sta VIC_CONTROL_MODE
          
          ;set irq vector to point to our routine
          lda #<IrqSetTopDisplay
          sta $0314
          lda #>IrqSetTopDisplay
          sta $0315          
        
          ;set charset (panel)
          lda #$3c
          sta VIC_MEMORY_CONTROL
 
 !ifndef NO_MUSIC {                    
          jsr MUSIC_PLAYER + 3
}  
          JMP IRQ_RETURN_KERNAL


;------------------------------------------------------------
;irq routine
;------------------------------------------------------------
!zone IrqSetTopDisplay
IrqSetTopDisplay
          ;acknowledge VIC irq
          lda $d019
          sta $d019
          
          ;setup with first zone
          lda #RASTER_BOTTOM_POS
          sta VIC_RASTER_POS
          
          ;MSB of d011 is the MSB of the requested rasterline
          ;as rastercounter goes from 0-312
          lda VIC_WRITE_BYTE
          sta VIC_CONTROL_MODE

          ;set irq vector to point to our routine
          lda #<IrqGame
          sta $0314
          lda #>IrqGame
          sta $0315          
          
          ;set charset
          lda #$30
          sta VIC_MEMORY_CONTROL
          
          JMP IRQ_RETURN_KERNAL


;------------------------------------------------------------
;game variables
;------------------------------------------------------------

SPRITE_COUNT = 6

SPRITE_POS_X
          !fill SPRITE_COUNT,0
SPRITE_POS_X_EXTEND
          !fill SPRITE_COUNT,0
SPRITE_CHAR_POS_X
          !fill SPRITE_COUNT,0
SPRITE_CHAR_POS_X_DELTA
          !fill SPRITE_COUNT,0
SPRITE_POS_Y
          !fill SPRITE_COUNT,0
SPRITE_ACTIVE
          !fill SPRITE_COUNT,0
SPRITE_ANIM_POS
          !fill SPRITE_COUNT,0
SPRITE_ANIM_DELAY
          !fill SPRITE_COUNT,0
SPRITE_STATE
          !fill SPRITE_COUNT,0
          
ENEMY_BEHAVIOUR_TABLE_LO          
          !byte <NoBehaviour        ;player ul
          !byte <NoBehaviour        ;player ur
          !byte <NoBehaviour        ;player ll
          !byte <NoBehaviour        ;player lr
          !byte <NoBehaviour        ;player feet l
          !byte <NoBehaviour        ;player feet r
          !byte <NoBehaviour        ;invisible
          !byte <BehaviourFlagL     ;flag l
          !byte <BehaviourFlagR     ;flag r
          !byte <BehaviourKalenTop  ;kalen t
          !byte <BehaviourKalenBottom ;kalen b
          !byte <BehaviourEyeL      ;left eye
          !byte <BehaviourEyeR      ;right eye
          !byte <RizekFalling       ;player falling
          !byte <BehaviourTorch     ;torch
          !byte <BehaviourFlashT
          !byte <BehaviourFlashB
          
ENEMY_BEHAVIOUR_TABLE_HI
          !byte >NoBehaviour        ;player ul
          !byte >NoBehaviour        ;player ur
          !byte >NoBehaviour        ;player ll
          !byte >NoBehaviour        ;player lr
          !byte >NoBehaviour        ;player feet l
          !byte >NoBehaviour        ;player feet r
          !byte >NoBehaviour        ;invisible
          !byte >BehaviourFlagL     ;flag l
          !byte >BehaviourFlagR     ;flag r
          !byte >BehaviourKalenTop  ;kalen t
          !byte >BehaviourKalenBottom ;kalen b
          !byte >BehaviourEyeL      ;left eye
          !byte >BehaviourEyeR      ;right eye
          !byte >RizekFalling       ;player falling
          !byte >BehaviourTorch     ;torch
          !byte >BehaviourFlashT
          !byte >BehaviourFlashB
          
TYPE_START_SPRITE_OFFSET_X
          !byte 0                   ;dummy entry for inactive object
          !byte 4                   ;player ul
          !byte 4                   ;player ur
          !byte 4                   ;player ml
          !byte 4                   ;player mr
          !byte 4                   ;player feet l
          !byte 4                   ;player feet r
          !byte 0                   ;invisible
          !byte 0                   ;flag l
          !byte 0                   ;flag r
          !byte 16                  ;kalen t
          !byte 16                  ;kalen b
          !byte 0                   ;left eye
          !byte 0                   ;right eye
          !byte 0                   ;player falling
          !byte 2                   ;torch
          !byte 0                   ;flash top
          !byte 0                   ;flash bottom
          
TYPE_START_SPRITE_OFFSET_Y
          !byte 0                   ;dummy entry for inactive object
          !byte 2                   ;player ul
          !byte 2                   ;player ur
          !byte 5                   ;player ml
          !byte 5                   ;player mr
          !byte 0                   ;player feet l
          !byte 0                   ;player feet r
          !byte 4                   ;invisible
          !byte 5                   ;flag l
          !byte 5                   ;flag r
          !byte 7                   ;kalen t
          !byte 2                   ;kalen b
          !byte 0                   ;left eye
          !byte 0                   ;right eye
          !byte 0                   ;player falling
          !byte 4                   ;torch
          !byte 7                   ;flash top
          !byte 2                   ;flash bottom
          
          
TYPE_START_SPRITE
          !byte 0                   ;dummy entry for inactive object
          !byte SPRITE_PLAYER_UL_1
          !byte SPRITE_PLAYER_UR_1
          !byte SPRITE_PLAYER_ML_1
          !byte SPRITE_PLAYER_MR_1
          !byte SPRITE_PLAYER_LL_1
          !byte SPRITE_PLAYER_LR_1
          !byte SPRITE_INVISIBLE
          !byte SPRITE_FLAG_L_1
          !byte SPRITE_FLAG_R_1
          !byte SPRITE_KALEN_T_1
          !byte SPRITE_KALEN_B_1
          !byte SPRITE_EYE_L_1
          !byte SPRITE_EYE_R_1
          !byte SPRITE_FALLING_PLAYER_UR
          !byte SPRITE_TORCH_1
          !byte SPRITE_FLASH_T_1
          !byte SPRITE_FLASH_B_1

TYPE_START_MULTICOLOR
          !byte 0
          !byte 0                   ;player ul
          !byte 0                   ;player ur
          !byte 0                   ;player ll
          !byte 0                   ;player lr
          !byte 0                   ;player feet l
          !byte 0                   ;player feet r
          !byte 0                   ;invisible
          !byte 1                   ;flag l
          !byte 1                   ;flag r
          !byte 1                   ;kalen t
          !byte 1                   ;kalen b
          !byte 1                   ;eye l
          !byte 1                   ;eye r
          !byte 1                   ;player falling
          !byte 1                   ;torch
          !byte 1                   ;flash top
          !byte 1                   ;flash bottom


BIT_TABLE
          !byte 1,2,4,8,16,32,64,128
          
SCREEN_LINE_OFFSET_TABLE_LO
          !byte ( SCREEN_CHAR +   0 ) & 0x00ff
          !byte ( SCREEN_CHAR +  40 ) & 0x00ff
          !byte ( SCREEN_CHAR +  80 ) & 0x00ff
          !byte ( SCREEN_CHAR + 120 ) & 0x00ff
          !byte ( SCREEN_CHAR + 160 ) & 0x00ff
          !byte ( SCREEN_CHAR + 200 ) & 0x00ff
          !byte ( SCREEN_CHAR + 240 ) & 0x00ff
          !byte ( SCREEN_CHAR + 280 ) & 0x00ff
          !byte ( SCREEN_CHAR + 320 ) & 0x00ff
          !byte ( SCREEN_CHAR + 360 ) & 0x00ff
          !byte ( SCREEN_CHAR + 400 ) & 0x00ff
          !byte ( SCREEN_CHAR + 440 ) & 0x00ff
          !byte ( SCREEN_CHAR + 480 ) & 0x00ff
          !byte ( SCREEN_CHAR + 520 ) & 0x00ff
          !byte ( SCREEN_CHAR + 560 ) & 0x00ff
          !byte ( SCREEN_CHAR + 600 ) & 0x00ff
          !byte ( SCREEN_CHAR + 640 ) & 0x00ff
          !byte ( SCREEN_CHAR + 680 ) & 0x00ff
          !byte ( SCREEN_CHAR + 720 ) & 0x00ff
          !byte ( SCREEN_CHAR + 760 ) & 0x00ff
          !byte ( SCREEN_CHAR + 800 ) & 0x00ff
          !byte ( SCREEN_CHAR + 840 ) & 0x00ff
          !byte ( SCREEN_CHAR + 880 ) & 0x00ff
          !byte ( SCREEN_CHAR + 920 ) & 0x00ff
          !byte ( SCREEN_CHAR + 960 ) & 0x00ff
          
SCREEN_LINE_OFFSET_TABLE_HI
          !byte ( ( SCREEN_CHAR +   0 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR +  40 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR +  80 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 120 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 160 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 200 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 240 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 280 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 320 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 360 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 400 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 440 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 480 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 520 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 560 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 600 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 640 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 680 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 720 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 760 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 800 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 840 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 880 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 920 ) & 0xff00 ) >> 8
          !byte ( ( SCREEN_CHAR + 960 ) & 0xff00 ) >> 8
          
          
          
;expects # in A          
!zone SceneText
SceneText
          sta SCENE_TEXT
          lda #0
          sta SCENE_TEXT_POS
          sta SCENE_TEXT_DELAY
          sta SCENE_TEXT_SCREEN_POS
          rts
          
          
          
!zone UpdateSceneText
UpdateSceneText 
          lda SCENE_TEXT_POS
          cmp #255
          beq .TextDone
          
          inc SCENE_TEXT_DELAY
          lda SCENE_TEXT_DELAY
          cmp #2
          bne .ColorFade
          
          lda #0
          sta SCENE_TEXT_DELAY
          
          ldy SCENE_TEXT
          lda SCENE_TEXT_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCENE_TEXT_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SCENE_TEXT_POS
          lda (ZEROPAGE_POINTER_1),y
          beq .TextComplete
          and #$80
          beq .ShiftPos
          
          lda (ZEROPAGE_POINTER_1),y
          ldy SCENE_TEXT_SCREEN_POS
          sta SCREEN_CHAR + 23 * 40,y
          lda #0
          sta SCREEN_COLOR + 23 * 40,y
          
          inc SCENE_TEXT_SCREEN_POS
-          
          inc SCENE_TEXT_POS

.Done
          rts
          
.ShiftPos
          ;add to target pos
          lda (ZEROPAGE_POINTER_1),y
          and #$7f
          clc
          adc SCENE_TEXT_SCREEN_POS
          sta SCENE_TEXT_SCREEN_POS
          jmp -
          
          
.TextDone          
          lda SCENE_TEXT_DONE_DELAY
          cmp #204
          beq .Done
          
          inc SCENE_TEXT_DONE_DELAY
          lda SCENE_TEXT_DONE_DELAY
          cmp #200
          bcc .Done
          
          ;color fade out the result
          lda #203
          sec
          sbc SCENE_TEXT_DONE_DELAY
          tay
          
          lda SCENE_TEXT_COLOR_FADE,y
          ldx #0
-          
          sta SCREEN_COLOR + 23 * 40,x
          inx
          cpx #80
          bne -

          ;clear text?
          lda SCENE_TEXT_DONE_DELAY
          cmp #203
          bne +

          lda #0
          ldx #0
-          
          sta SCREEN_CHAR + 23 * 40,x
          inx
          cpx #80
          bne -
          
+          
          rts
          
.ColorFade
          lda SCENE_TEXT_POS
          beq +
          
          ldy SCENE_TEXT_DELAY
          lda SCENE_TEXT_COLOR_FADE + 2,y
          ldy SCENE_TEXT_SCREEN_POS
          sta SCREEN_COLOR + 23 * 40 - 1,y
+          
          rts

.TextComplete
          lda #255
          sta SCENE_TEXT_POS
          lda #0
          sta SCENE_TEXT_DONE_DELAY
          
          rts
          
          
;!ifndef COMPILE_CRUNCHED {          
CHARSET_1
          !binary "intro/intro1.chr",1816
CHARSET_2
          !binary "intro/intro2.chr",1712
CHARSET_3
          !binary "intro/intro3.chr"
CHARSET_4         
          !binary "intro/intro4.chr",1960
CHARSET_PANEL          
CHARSET_5
          !binary "intro/intro5.chr",1944
          ;!binary "soulless_end2.chr"
          
!ifndef BUILD_CARTRIDGE {          
CHARSET_LOGO
          !binary "intro/logo.chr",552
}
          
SPRITES
          !binary "intro/intro_sprites.spr"
          
;}


SCREEN_1_DATA
          ;screen char data
          !byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$01,$02,$03,$04,$00,$00,$00,$00,$00
          !byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$06,$05,$05,$05,$05,$05,$05,$05,$07,$08,$04,$00,$00,$00,$00,$00,$00,$00
          !byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$06,$05,$05,$05,$05,$05,$05,$09,$0a,$0b,$0c,$00,$00,$00,$00,$00,$00,$00
          !byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$0d,$0e,$05,$0f,$10,$11,$12,$13,$14,$15,$16,$17,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$0d,$19,$05,$05,$05,$0d,$1a,$1b,$1c,$1d,$1e,$1f,$20,$20,$20,$21,$21,$21,$22,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $05,$05,$05,$23,$24,$25,$26,$27,$1a,$1b,$1c,$28,$29,$2a,$2b,$02,$03,$04,$00,$2c,$2d,$2e,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $1a,$1b,$1c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$2f,$30,$31,$00,$00,$00,$32,$33,$34,$35,$36,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f,$40,$41,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$42,$43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c,$4d,$4e,$4f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$50,$51,$52,$21,$53,$54,$55,$00,$56,$57,$58,$59,$5a,$5b,$28,$5c,$5d,$5e,$5f,$60,$61,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$42,$62,$63,$64,$65,$66,$67,$00,$68,$69,$6a,$6b,$6c,$6d,$6e,$6f,$70,$71,$72,$72,$72,$72,$72,$72,$72,$73,$74,$74,$74,$74
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$50,$51,$52,$75,$21,$21,$00,$76,$77,$00,$78,$79,$7a,$7b,$7c,$00,$00,$7d,$7e,$7f,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
          !byte $72,$72,$72,$72,$72,$72,$72,$72,$72,$73,$74,$74,$74,$74,$81,$82,$83,$00,$84,$85,$86,$87,$00,$00,$00,$00,$88,$89,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
          !byte $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$8a,$8b,$8c,$8d,$8e,$8f,$00,$00,$00,$90,$00,$91,$92,$93,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
          !byte $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$94,$95,$96,$97,$98,$99,$9a,$9b,$00,$9c,$83,$00,$9d,$9e,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
          !byte $E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$9f,$a0,$a1,$a2,$E2,$E2,$a3,$a4,$00,$a5,$a6,$a7,$a8,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
          !byte $E2,$E2,$a9,$aa,$ab,$ac,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$ad,$ae,$af,$b0,$E2,$E2,$E2,$b1,$b2,$b3,$b4,$b5,$b6,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
          !byte $b7,$b8,$b9,$ba,$bb,$bc,$bd,$be,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$bf,$c0,$c1,$c2,$E2,$E2,$E2,$c3,$c4,$c5,$E2,$c6,$c7,$E2,$E2,$E2,$E2,$a9,$aa,$ab,$ac,$E2,$E2,$E2,$E2
          !byte $00,$00,$00,$00,$00,$00,$00,$c8,$c9,$ca,$cb,$E2,$E2,$E2,$E2,$c3,$cc,$cd,$ce,$E2,$E2,$E2,$cf,$d0,$d1,$E2,$d2,$d3,$E2,$E2,$b7,$b8,$b9,$ba,$bb,$bc,$bd,$be,$E2,$E2
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d4,$d5,$d6,$d7,$d8,$d9,$da,$E2,$E2,$db,$dc,$dd,$d6,$d6,$de,$df,$e0,$e1,$00,$00,$00,$00,$00,$00,$00,$c8,$c9,$ca
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SCREEN_2_DATA
          ;screen char data
          !byte $00,$00,$00,$00,$00,$00,$00,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$04,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$05,$06,$07,$00,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$04,$08,$09,$0a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$0b,$0c,$00,$05,$06,$07,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$09,$0a,$00,$0d,$0e,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$0f,$00,$0b,$0c,$10,$11,$12,$13,$14,$15,$16,$00,$17,$18,$19,$1a,$1b,$1c,$00,$1d,$13,$14,$15,$1e,$1f,$20,$0d,$0e,$00,$21,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$22,$23,$0f,$00,$24,$00,$25,$26,$27,$28,$00,$00,$29,$2a,$2b,$2c,$2d,$2e,$2f,$30,$31,$32,$33,$34,$00,$35,$00,$21,$00,$36,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$37,$38,$39,$3a,$00,$3b,$00,$3c,$25,$3d,$3e,$3f,$00,$40,$41,$42,$43,$44,$45,$40,$46,$47,$48,$49,$4a,$4b,$4c,$00,$36,$4d,$4e,$4f,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$50,$51,$52,$53,$54,$55,$56,$00,$40,$57,$58,$59,$5a,$5b,$5c,$5d,$5e,$5f,$60,$61,$62,$63,$64,$65,$66,$67,$68,$56,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$69,$6a,$6b,$6c,$6d,$6e,$6f,$00,$70,$71,$72,$73,$74,$75,$40,$08,$76,$77,$78,$79,$7a,$7b,$7b,$7c,$7d,$7e,$6e,$6f,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$69,$7f,$80,$81,$82,$83,$84,$00,$85,$86,$87,$88,$89,$8a,$5c,$05,$8b,$8c,$8d,$8e,$8f,$4c,$90,$91,$92,$93,$83,$84,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$94,$00,$95,$96,$97,$98,$99,$00,$9a,$9b,$9c,$9d,$9e,$9f,$40,$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$aa,$98,$99,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$ab,$00,$ac,$ad,$ae,$af,$00,$00,$b0,$b1,$b2,$b3,$b4,$b5,$5c,$b6,$b7,$b8,$b9,$ba,$bb,$bc,$bd,$be,$bf,$c0,$af,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$c1,$00,$00,$00,$c2,$a0,$00,$00,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$ca,$cb,$cc,$cd,$ce,$cf,$d0,$d1,$d2,$d3,$d4,$a0,$00,$00,$00,$00,$00
          !byte $00,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$00

SCREEN_3_DATA
;screen char data
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$03,$04,$05,$05,$06,$05,$05,$07,$08,$09,$0a,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0b,$0c,$03,$05,$0d,$0e,$0f,$10,$11,$0f,$0f,$0d,$06,$12,$13,$02,$0a,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$03,$04,$14,$0f,$11,$15,$16,$16,$17,$16,$16,$11,$18,$0d,$19,$08,$02,$0a,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$0c,$04,$1a,$10,$1b,$1c,$1d,$1e,$1f,$1f,$1f,$1f,$20,$16,$11,$21,$19,$08,$0a,$0a,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0c,$03,$1a,$11,$15,$1d,$1f,$22,$23,$23,$24,$23,$25,$26,$1f,$27,$11,$21,$19,$08,$0a,$01,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$03,$14,$10,$15,$1d,$28,$29,$2a,$2b,$2c,$2d,$2c,$2e,$2f,$25,$1f,$27,$18,$30,$12,$02,$0a,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$31,$32,$33,$34,$35,$36,$37,$2b,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f,$25,$1f,$40,$18,$19,$41,$0a,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$42,$43,$44,$1e,$45,$46,$47,$48,$49,$4a,$4b,$4c,$4d,$4e,$4f,$50,$26,$51,$18,$52,$41,$0a,$01,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$0b,$03,$1a,$34,$35,$53,$54,$55,$56,$57,$58,$59,$59,$5a,$5b,$5c,$5d,$5e,$5f,$1f,$60,$21,$19,$31,$0a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$31,$03,$1a,$34,$61,$62,$63,$64,$65,$66,$59,$59,$59,$59,$59,$67,$68,$69,$6a,$26,$40,$18,$19,$13,$0a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$31,$03,$1a,$34,$61,$45,$6b,$6c,$57,$59,$59,$6d,$6e,$59,$59,$6f,$70,$71,$6a,$26,$72,$18,$19,$73,$0a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$31,$03,$1a,$34,$61,$45,$6b,$6c,$74,$59,$59,$75,$76,$59,$59,$77,$70,$78,$6a,$26,$40,$18,$19,$79,$0a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$31,$03,$1a,$34,$61,$7a,$7b,$7c,$7d,$7e,$59,$59,$59,$59,$59,$7f,$80,$81,$6a,$26,$40,$82,$19,$31,$0a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$1a,$34,$83,$84,$85,$86,$87,$88,$7e,$59,$59,$59,$89,$8a,$8b,$8c,$8d,$1e,$8e,$8f,$19,$31,$0a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$90,$91,$92,$93,$61,$94,$95,$96,$97,$98,$88,$99,$9a,$9b,$9c,$9d,$6a,$26,$9e,$18,$19,$41,$9f,$a0,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a6,$a6,$a8,$a9,$aa,$ab,$ac,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$ad,$ae,$af,$b0,$b1,$b2,$b3,$b4,$b2,$b2,$b5,$b6,$b7,$b8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$b9,$ba,$bb,$bc,$bd,$be,$bf,$c0,$c1,$c2,$c3,$c4,$c5,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$c6,$c7,$c8,$c9,$ca,$cb,$cb,$cc,$cd,$ce,$cf,$d0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d1,$d1,$b8,$d2,$b8,$d1,$d0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SCREEN_4_DATA
          ;screen char data
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$05,$05,$05,$06,$07,$08,$09,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0a,$0b,$00,$0c,$0d,$05,$05,$05,$0e,$0f,$01,$10,$11,$12,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$14,$15,$16,$17,$18,$19,$19,$1a,$1b,$1c,$1d,$1e,$1f,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$00,$3f,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$30,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c,$4d,$00,$4e,$4f,$50,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$51,$00,$00,$00,$52,$53,$54,$55,$56,$57,$58,$59,$5a,$5b,$5c,$5d,$5e,$00,$5f,$60,$61,$62,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$63,$00,$00,$00,$00,$64,$65,$66,$67,$68,$69,$6a,$6b,$00,$00,$6c,$6d,$6e,$6f,$70,$71,$72,$73,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$74,$75,$00,$00,$00,$00,$00,$00,$00,$00,$76,$77,$5b,$00,$00,$78,$79,$7a,$7b,$7c,$7d,$7e,$7f,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$81,$82,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$30,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$8c,$8d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$64,$8e,$8f,$90,$91,$92,$93,$94,$95,$96,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$97,$98,$99,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9a,$9b,$9c,$9d,$9e,$9f,$a0,$a1,$a2,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$a3,$a4,$a5,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$a6,$a7,$a8,$a9,$aa,$ab,$ac,$ad,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$ae,$af,$b0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$a6,$a7,$b1,$b2,$b3,$b4,$b5,$b6,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$b7,$b8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$b9,$ba,$bb,$bc,$bd,$be,$bf,$c0,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$c1,$c2,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$c3,$c4,$c5,$c6,$30,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$c7,$c8,$c9,$ca,$64,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$c7,$c8,$cb,$cc,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$cd,$ce,$cf,$d0,$d1,$d2,$d3,$d4,$d3,$d1,$d2,$d4,$d5,$d6,$d7,$d8,$d9,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$da,$db,$dc,$dd,$de,$df,$e0,$e1,$e2,$e3,$e4,$e5,$e6,$e7,$e8,$e9,$ea,$eb,$ec,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$ed,$ee,$ef,$f0,$f0,$f0,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f0,$f0,$f0,$f2,$f3,$f4,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SCREEN_5_DATA
          ;screen char data
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$05,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$05,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$09,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$09,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$0a,$0b,$0c,$0d,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0b,$0e,$0f,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$10,$11,$12,$13,$14,$15,$16,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$17,$18,$19,$1a,$1b,$1c,$1d,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$1e,$1f,$20,$21,$22,$23,$24,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$25,$26,$27,$21,$28,$29,$2a,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$2b,$2c,$2d,$2e,$2f,$30,$31,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$32,$33,$34,$35,$36,$37,$38,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$39,$3a,$3b,$3c,$3d,$3e,$3f,$00,$00,$00,$00,$40,$41,$42,$43,$44,$45,$00,$00,$00,$46,$47,$48,$49,$4a,$4b,$4c,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$4d,$4e,$4f,$50,$51,$52,$53,$00,$00,$00,$00,$54,$55,$56,$57,$58,$59,$00,$00,$00,$5a,$5b,$5c,$5d,$5e,$5f,$60,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$61,$62,$63,$64,$65,$66,$67,$00,$00,$00,$00,$68,$69,$6a,$6b,$6c,$6d,$00,$00,$00,$00,$6e,$6f,$70,$71,$72,$73,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$74,$75,$76,$77,$78,$79,$00,$00,$00,$00,$00,$7a,$7b,$7c,$7d,$7e,$7f,$00,$00,$00,$00,$80,$81,$82,$83,$84,$85,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$86,$87,$88,$89,$8a,$8b,$00,$00,$00,$00,$00,$00,$8c,$8d,$8e,$8f,$00,$00,$00,$00,$00,$90,$91,$92,$93,$94,$95,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$96,$97,$98,$99,$9a,$9b,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9c,$9d,$9e,$9f,$a0,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$09,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$09,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$08,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00



SCREEN_1_COLOR
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$8c,$c8,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$8c,$cc,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$cc,$c8,$88,$cc,$cc,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$cc,$cc,$cc,$cc,$cc,$c8,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$8c,$c8,$c8,$cc,$8c,$cc,$c8,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$8c,$c8,$8c,$c8,$cc,$c8,$c8,$8c,$cc,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8c,$88,$cc,$cc,$c8,$cc,$8c,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8c,$88,$cc,$cc,$c8,$8c,$c8,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8c,$88,$8c,$cc,$88,$88,$8c,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$cc,$c8,$cc,$88,$88,$88,$8c,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$6c,$8c,$c6,$66,$8c,$88,$86,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$68,$86,$68,$c8,$c6,$88,$88,$88,$88,$88,$88
          !byte $88,$8d,$d6,$88,$88,$88,$88,$88,$cc,$68,$88,$66,$66,$86,$88,$88,$88,$88,$88,$88
          !byte $86,$8d,$dd,$d6,$88,$88,$88,$86,$8c,$68,$88,$68,$68,$86,$88,$88,$8d,$d6,$88,$88
          !byte $88,$88,$88,$88,$8d,$d8,$88,$86,$8c,$88,$88,$c8,$68,$c6,$88,$86,$8d,$dd,$d6,$88
          !byte $88,$88,$88,$88,$88,$88,$66,$68,$cc,$88,$88,$c8,$66,$c8,$66,$88,$88,$88,$88,$8d
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88



SCREEN_2_COLOR
          ;screen color data
          !byte $88,$88,$88,$8c,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$88,$88,$88,$88
          !byte $88,$88,$84,$cc,$8c,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$6c,$c8,$88,$88,$88
          !byte $88,$88,$4c,$84,$cc,$88,$88,$88,$88,$88,$88,$88,$88,$88,$6c,$c8,$cc,$88,$88,$88
          !byte $88,$88,$c8,$4c,$cc,$cc,$c6,$68,$cc,$6c,$6c,$86,$cc,$6c,$cc,$cc,$8c,$88,$88,$88
          !byte $88,$88,$cc,$c8,$c8,$6c,$cc,$88,$66,$6c,$66,$66,$6c,$6c,$8c,$8c,$8c,$88,$88,$88
          !byte $88,$8c,$cc,$c8,$68,$66,$cc,$c8,$6c,$cc,$cc,$66,$cc,$8c,$66,$8c,$cc,$c8,$88,$88
          !byte $88,$88,$88,$88,$c6,$cc,$cc,$68,$6c,$cc,$cc,$66,$6c,$cc,$cc,$4c,$cc,$c6,$88,$88
          !byte $88,$88,$88,$88,$c6,$6c,$cc,$c8,$cc,$cc,$cc,$66,$cc,$c6,$cc,$cc,$6c,$cc,$88,$88
          !byte $88,$88,$88,$88,$c6,$cc,$cc,$c8,$cc,$cc,$cc,$66,$cc,$cc,$64,$66,$cc,$cc,$88,$88
          !byte $88,$88,$88,$88,$c8,$cc,$c6,$68,$c6,$c6,$6c,$66,$cc,$cc,$cc,$cc,$c6,$66,$88,$88
          !byte $88,$88,$88,$88,$68,$6c,$6c,$88,$cc,$cc,$cc,$66,$cc,$cc,$cc,$cc,$c6,$c8,$88,$88
          !byte $88,$88,$88,$88,$68,$88,$c6,$88,$cc,$cc,$cc,$c6,$66,$6c,$66,$88,$66,$68,$88,$88
          !byte $8c,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$cc,$c8


SCREEN_3_COLOR
          ;screen color data
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$8f,$ff,$ff,$ff,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$ff,$ff,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8f,$ff,$ff,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8f,$ff,$ff,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8f,$ff,$ff,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8f,$ff,$ff,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$ff,$ff,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$ff,$ff,$ff,$ff,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$8f,$ff,$ff,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$8f,$ff,$ff,$f8,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88




SCREEN_4_COLOR
          ;screen color data
          !byte $88,$88,$88,$88,$88,$86,$6d,$d8,$88,$dd,$dd,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$dd,$8d,$d8,$88,$dd,$6d,$d6,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8d,$dd,$dd,$65,$5d,$66,$dd,$d6,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8d,$dd,$dd,$dd,$dd,$dd,$dd,$dd,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$86,$dd,$dd,$dd,$dd,$dd,$dd,$dd,$8d,$d8,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$66,$dd,$dd,$dd,$dd,$dd,$dd,$8d,$d6,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$86,$88,$86,$6d,$dd,$dd,$d6,$6d,$dd,$8d,$dd,$68,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$86,$88,$88,$6d,$dd,$dd,$d6,$88,$6d,$dd,$dd,$d6,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$86,$68,$88,$88,$88,$86,$66,$88,$6d,$dd,$dd,$dd,$d8,$88,$88,$88,$88
          !byte $88,$88,$88,$86,$68,$88,$88,$88,$88,$88,$88,$66,$dd,$dd,$dd,$d6,$88,$88,$88,$88
          !byte $88,$88,$88,$86,$68,$88,$88,$88,$88,$88,$88,$66,$dd,$dd,$d6,$d6,$88,$88,$88,$88
          !byte $88,$88,$88,$6d,$68,$88,$88,$88,$88,$88,$88,$86,$dd,$6d,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$6d,$68,$88,$88,$88,$88,$88,$88,$88,$dd,$dd,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$dd,$68,$88,$88,$88,$88,$88,$88,$88,$dd,$d5,$dd,$d6,$88,$88,$88,$88
          !byte $88,$88,$88,$66,$88,$88,$88,$88,$88,$88,$88,$88,$d6,$5d,$d6,$66,$88,$88,$88,$88
          !byte $88,$88,$88,$66,$88,$88,$88,$88,$88,$88,$88,$88,$6d,$dd,$68,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$66,$d6,$68,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$66,$66,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$86,$6d,$dd,$dd,$dd,$dd,$dd,$dd,$d6,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$66,$dd,$dd,$dd,$dd,$dd,$dd,$dd,$dd,$68,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$6d,$dd,$dd,$dd,$dd,$dd,$dd,$dd,$dd,$68,$88,$88,$88,$88,$88,$88





SCREEN_5_COLOR
          ;screen color data
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8b,$b8,$88,$88,$88,$88,$88,$88,$88,$88,$bb,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8b,$b8,$88,$88,$88,$88,$88,$88,$88,$88,$bb,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8b,$b8,$88,$88,$88,$88,$88,$88,$88,$88,$bb,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8b,$b8,$88,$88,$88,$88,$88,$88,$88,$88,$bb,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$8d,$dd,$dd,$d8,$88,$88,$88,$88,$88,$88,$dd,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$8d,$dd,$dd,$d8,$88,$88,$88,$88,$88,$88,$dd,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$8d,$dd,$dd,$d8,$88,$88,$88,$88,$88,$88,$dd,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$8d,$dd,$dd,$d8,$88,$88,$88,$88,$88,$88,$dd,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$8d,$dd,$dd,$d8,$88,$88,$88,$88,$88,$88,$8d,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$8d,$dd,$dd,$88,$88,$88,$88,$88,$88,$88,$8d,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$8d,$dd,$dd,$88,$88,$88,$88,$88,$88,$88,$8d,$dd,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$dd,$dd,$dd,$88,$88,$88,$88,$88,$88,$88,$8d,$dd,$dd,$d8,$88,$88,$88
          !byte $88,$88,$88,$88,$dd,$d8,$88,$88,$88,$88,$88,$88,$88,$88,$8d,$dd,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8b,$b8,$88,$88,$88,$88,$88,$88,$88,$88,$bb,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8b,$b8,$88,$88,$88,$88,$88,$88,$88,$88,$bb,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$8b,$b8,$88,$88,$88,$88,$88,$88,$88,$88,$bb,$88,$88,$88,$88,$88
          !byte $88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88

!ifndef BUILD_CARTRIDGE {
SOULLESS_LOGO_CHAR
          ;screen char data
          !byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$02,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
          !byte $00,$05,$06,$07,$00,$08,$09,$00,$0a,$0b,$0c,$0d,$0e,$0f,$10,$0f,$11,$00,$12,$13,$00,$05,$06,$07,$00,$05,$06,$07
          !byte $14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f,$20,$1d,$20,$1d,$00,$21,$22,$23,$14,$15,$16,$17,$14,$15,$16,$17
          !byte $24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f,$30,$1d,$30,$1d,$00,$31,$32,$33,$24,$25,$26,$27,$24,$25,$26,$27
          !byte $34,$35,$36,$00,$37,$38,$39,$3a,$3b,$3c,$3d,$00,$3e,$3f,$40,$3f,$41,$42,$43,$44,$34,$35,$36,$00,$34,$35,$36,$00
}

!ifndef NO_LOGOS {
SCREEN_LOGO_DATA
          !byte 192,193,194,194,194,194,194,194,194,194,194,195,196,197,  0
          !byte 198,199,200,201,202,203,204,205,206,207,208,209,210,211,212
          !byte 213,214,215,216,217,218,219,220,221,222,223,224,225,226,227
          !byte 228,229,230,231,232,233,234,235,236,237,238,239,240,241,242
          
RGCD_LOGO_DATA
          !byte 147,147,147,147,147,147,147,147,147,147,147,147,147,147,147
          !byte 147,148,149,150,151,152,153,154,155,156,157,158,159,147,147
          !byte 147,164,165,166,167,168,169,170,171,172,173,174,175,147,147
          !byte 147,180,181,182,183,184,185,186,187,188,189,190,191,147,147
SCREEN_LOGO_COLOR
          !byte   6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  0
          !byte   9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  8
          !byte  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  8
          !byte   6,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11,  8,  8,  8,  6
}

RIZEK_FALLING_END_SPRITE
          !byte SPRITE_INVISIBLE, SPRITE_RIZEK_FALLEN_L, SPRITE_RIZEK_FALLEN_R

SCENE_3_COLOR_FLASH_1
          !byte 9,7,14,1
SCENE_3_COLOR_FLASH_2
          !byte 14,1,9,7
SCENE_3_COLOR_FLASH_3
          !byte 15,9,15,14
          
EYE_ANIM_TABLE
          !byte 0,1,2,3,3,3,3,3,3,3,3,3,3,2,1,0

SCENE_TEXT_POS
          !byte 255
SCENE_TEXT_SCREEN_POS
          !byte 0
SCENE_TEXT_DELAY
          !byte 0
SCENE_TEXT_DONE_DELAY
          !byte 0
SCENE_TEXT
          !byte $ff

SCENE_NR
          !byte 0
SCENE_FRAME_POS
          !byte 0
SCENE_FRAME_DELAY
          !byte 0

SCENE_BACK_COLOR
          !byte  0, 0, 0, 0, 0, 0
SCENE_TEXT_COLOR_FADE
          !byte 0,6,3,1

SCENE_LINE_START
          !byte 0
          !byte 0
          !byte 5
          !byte 0
          !byte 0
          !byte 2
SCENE_LINE_COUNT
          !byte 0
          !byte 22
          !byte 13
          !byte 20
          !byte 21
          !byte 18
SCENE_CLEAR_COLOR
          !byte $00,$08,$08,$00,$08,$00
SCENE_CHARSET_MC_1
          !byte  6, 9, 6, 9, 6, 9
SCENE_CHARSET_MC_2
          !byte 14, 6,10,14, 7, 7
SCENE_SPRITE_MC_1
          !byte  0, 3, 0, 0, 0,11
SCENE_SPRITE_MC_2
          !byte  0,11, 0, 0, 0,15

VIC_WRITE_BYTE
          !byte $1b

  


;1) - king sat on his horse with a bit of text saying "After decades of fighting Rizek a powerfull warrior king grew tired of war 
;so declared a time of peace for all !!"

!ct raw
!ct 'A',161,'B',162,'C',163,'D',164,'E',165,'F',166,'G',167,'H',168,'I',169,'J',170,'K',171,'L',172,'M',173
!ct 'N',174,'O',175,'P',176,'Q',177,'R',178,'S',179,'T',180,'U',181,'V',182,'W',183,'X',184,'Y',185,'Z',186
!ct '.',187,',',188,':',189,' ',190,'*',0


SCENE_1_TEXT
          ;after decades
          !text 3, "AFTER DECADES OF FIGHTING RIZEK,A",4,"POWERFUL WARRIOR KING GREW TIRED OF WAR.*"
          
SCENE_1_TEXT_2
          !text 3,"HE DECLARED A TIME OF PEACE FOR ALL.*"

;2) - As the king sleeps the wizard walks in and casts a spell on him with some text saying
;"But those close to him,kalen the wizard and his generals craved war. So Kalen casts an unholy curse on the king"

SCENE_2_TEXT
          !text "BUT THOSE CLOSE TO HIM,KALEN THE WIZARD",7,"AND HIS GENERALS CRAVED WAR.*"
          
SCENE_2_TEXT_2          
          !text 2, "SO KALEN CAST AN UNHOLY CURSE ON THE",20,"KING.*"

;3) - King Rizek transforms into the beast with some text saying "King Rizeks body distorted into the beast, his soul stolen"
SCENE_3_TEXT
          !text 2, "KING RIZEKS BODY DISTORTED INTO THE",12,"BEAST,HIS SOUL STOLEN.*"

;4) - The king is thrown down a pit into a prison, some text saying " The kings twisted body is thrown into a prison, 
;     his cries for help unheard"
SCENE_4_TEXT
          !text "THE KINGS TWISTED BODY IS THROWN INTO A",4,"PRISON,HIS CRIES FOR HELP UNHEARD.*"

;5) - Shot of eyes and hands around bars - "Now after one thousand years a great quake has broken the walls of his prison, 
;Rizek can now escape but his soul must be found before he can be truly free and bring peace to his lands once again"
SCENE_5_TEXT
          !text 2, "AFTER A THOUSAND YEARS A GREAT QUAKE",5,"HAS BROKEN THE WALLS OF HIS PRISON.*"
          
SCENE_5_TEXT_2          
          !text 1, "RIZEK CAN ESCAPE,BUT HIS SOUL MUST BE",5,"FOUND BEFORE HE CAN BE TRUELY FREE:*"

SCENE_5_TEXT_3
          !text ":AND BRING PEACE TO HIS LAND ONCE AGAIN.*"

SCENE_TEXT_TABLE_LO
          !byte <SCENE_1_TEXT
          !byte <SCENE_1_TEXT_2
          !byte <SCENE_2_TEXT
          !byte <SCENE_2_TEXT_2
          !byte <SCENE_3_TEXT
          !byte <SCENE_4_TEXT
          !byte <SCENE_5_TEXT
          !byte <SCENE_5_TEXT_2
          !byte <SCENE_5_TEXT_3
SCENE_TEXT_TABLE_HI
          !byte >SCENE_1_TEXT
          !byte >SCENE_1_TEXT_2
          !byte >SCENE_2_TEXT
          !byte >SCENE_2_TEXT_2
          !byte >SCENE_3_TEXT
          !byte >SCENE_4_TEXT
          !byte >SCENE_5_TEXT
          !byte >SCENE_5_TEXT_2
          !byte >SCENE_5_TEXT_3

SCENE_CHAR_LO
          !byte 0
          !byte <SCREEN_1_DATA
          !byte <SCREEN_2_DATA
          !byte <SCREEN_3_DATA
          !byte <SCREEN_4_DATA
          !byte <SCREEN_5_DATA
SCENE_COLOR_LO
          !byte 0
          !byte <SCREEN_1_COLOR
          !byte <SCREEN_2_COLOR
          !byte <SCREEN_3_COLOR
          !byte <SCREEN_4_COLOR
          !byte <SCREEN_5_COLOR
SCENE_CHAR_HI
          !byte 0
          !byte >SCREEN_1_DATA
          !byte >SCREEN_2_DATA
          !byte >SCREEN_3_DATA
          !byte >SCREEN_4_DATA
          !byte >SCREEN_5_DATA
          

SCENE_COLOR_HI
          !byte 0
          !byte >SCREEN_1_COLOR
          !byte >SCREEN_2_COLOR
          !byte >SCREEN_3_COLOR
          !byte >SCREEN_4_COLOR
          !byte >SCREEN_5_COLOR
          
          
!ifndef BUILD_CARTRIDGE {          
TEXT_LOADING 
          !text "PRESS FIRE TO LOAD*"
}
          