;compile to this filename
!ifdef COMPILE_CRUNCHED {
!to "soulless.prg",plain
} else {
!to "soulless.prg",cbm
}

;USE_CONDENSED_DATA = 1
NO_CHEATS = 1
;DETECT_PAL_NTSC = 1

;optimize level data, element repeat und Y zusammenlegen?



;temp. data to extro
;$303             PLAY_TIME_SECONDS
;$304             PLAY_TIME_MINUTES
;$305 - $305 + 5  SCORE

GAME_RESULT_DATA = $300

!ifdef SPRITES_V1 {
PLAYER_SPRITE_COLOR = 4
} else {
PLAYER_SPRITE_COLOR = 5
}

;IRQ_RETURN_KERNAL = $ea31
IRQ_RETURN_KERNAL = $ea81

!ifdef BUILD_FOR_TAPE {
LOAD_CODE = DoLoad
} else {
LOAD_CODE = $FCE2
}


;memory layout
;backup color/screen    $0400 to $07FF
;charset panel          $C000 to $C7FF
;screen                 $CC00 to $CFFF
;sprites                $D000 to $EFFF (128 sprites)
;charset 1              $F000 to $F7FF
;charset 2              $F800 to $FFFF

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

;placeholder for zero page pointers
ZEROPAGE_POINTER_1      = $17
ZEROPAGE_POINTER_2      = $19
ZEROPAGE_POINTER_3      = $21
ZEROPAGE_POINTER_4      = $23

KERNAL_PAL              = $02a6
NMI_VECTOR              = $0318
KERNAL_SETMSG           = $ff90
KERNAL_SETLFS           = $ffba
KERNAL_SETNAM           = $ffbd
KERNAL_LOAD             = $ffd5


MUSIC_PLAYER            = $1000

VIC_SPRITE_X_POS        = $d000
VIC_SPRITE_Y_POS        = $d001
VIC_SPRITE_X_EXTEND     = $d010
VIC_CONTROL_MODE        = $d011
VIC_RASTER_POS          = $d012
VIC_SPRITE_ENABLE       = $d015
VIC_CONTROL             = $d016
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

;address of the screen buffer
SCREEN_CHAR             = $CC00

;address of color ram
SCREEN_COLOR            = $D800

;address of sprite pointers
SPRITE_POINTER_BASE     = SCREEN_CHAR + 1016

;number of sprites divided by four
NUMBER_OF_SPRITES_DIV_4 = 128 / 4

BOTTOM_BORDER_RASTER_POS  = 226

MAX_PLAYER_FALL_HEIGHT    = 100

;sprite number constant
SPRITE_BASE             = 64

SPRITE_PLAYER_STAND_R_TOP     = SPRITE_BASE + 0
SPRITE_PLAYER_STAND_L_TOP     = SPRITE_BASE + 1
SPRITE_PLAYER_STAND_R_BOTTOM  = SPRITE_BASE + 2
SPRITE_PLAYER_STAND_L_BOTTOM  = SPRITE_BASE + 3
SPRITE_PLAYER_CROUCH_R_TOP    = SPRITE_BASE + 4
SPRITE_PLAYER_CROUCH_L_TOP    = SPRITE_BASE + 5
SPRITE_PLAYER_CROUCH_R_BOTTOM = SPRITE_BASE + 6
SPRITE_PLAYER_CROUCH_L_BOTTOM = SPRITE_BASE + 7

SPRITE_PLAYER_WALK_R_1_TOP    = SPRITE_BASE + 8
SPRITE_PLAYER_WALK_L_1_TOP    = SPRITE_BASE + 9
SPRITE_PLAYER_WALK_R_2_TOP    = SPRITE_BASE + 10
SPRITE_PLAYER_WALK_L_2_TOP    = SPRITE_BASE + 11
SPRITE_PLAYER_WALK_R_3_TOP    = SPRITE_BASE + 12
SPRITE_PLAYER_WALK_L_3_TOP    = SPRITE_BASE + 13
SPRITE_PLAYER_WALK_R_4_TOP    = SPRITE_BASE + 14
SPRITE_PLAYER_WALK_L_4_TOP    = SPRITE_BASE + 15
SPRITE_PLAYER_WALK_R_5_TOP    = SPRITE_BASE + 16
SPRITE_PLAYER_WALK_L_5_TOP    = SPRITE_BASE + 17
SPRITE_PLAYER_WALK_R_6_TOP    = SPRITE_BASE + 18
SPRITE_PLAYER_WALK_L_6_TOP    = SPRITE_BASE + 19

SPRITE_PLAYER_WALK_R_1_BOTTOM = SPRITE_BASE + 20
SPRITE_PLAYER_WALK_L_1_BOTTOM = SPRITE_BASE + 21
SPRITE_PLAYER_WALK_R_2_BOTTOM = SPRITE_BASE + 22
SPRITE_PLAYER_WALK_L_2_BOTTOM = SPRITE_BASE + 23
SPRITE_PLAYER_WALK_R_3_BOTTOM = SPRITE_BASE + 24
SPRITE_PLAYER_WALK_L_3_BOTTOM = SPRITE_BASE + 25
SPRITE_PLAYER_WALK_R_4_BOTTOM = SPRITE_BASE + 26
SPRITE_PLAYER_WALK_L_4_BOTTOM = SPRITE_BASE + 27
SPRITE_PLAYER_WALK_R_5_BOTTOM = SPRITE_BASE + 28
SPRITE_PLAYER_WALK_L_5_BOTTOM = SPRITE_BASE + 29
SPRITE_PLAYER_WALK_R_6_BOTTOM = SPRITE_BASE + 30
SPRITE_PLAYER_WALK_L_6_BOTTOM = SPRITE_BASE + 31

SPRITE_PLAYER_SEARCH_1_TOP    = SPRITE_BASE + 32
SPRITE_PLAYER_SEARCH_2_TOP    = SPRITE_BASE + 33
SPRITE_PLAYER_SEARCH_3_TOP    = SPRITE_BASE + 34
SPRITE_PLAYER_HEAD_TURN_L     = SPRITE_BASE + 35
SPRITE_PLAYER_SEARCH_1_BOTTOM = SPRITE_BASE + 36
SPRITE_PLAYER_SEARCH_2_BOTTOM = SPRITE_BASE + 37
SPRITE_PLAYER_SEARCH_3_BOTTOM = SPRITE_BASE + 38
SPRITE_PLAYER_HEAD_TURN_R     = SPRITE_BASE + 39

SPRITE_PLAYER_FALL_R          = SPRITE_BASE + 12
SPRITE_PLAYER_FALL_L          = SPRITE_BASE + 13
SPRITE_PLAYER_JUMP_RECOIL_R   = SPRITE_BASE + 14
SPRITE_PLAYER_JUMP_RECOIL_L   = SPRITE_BASE + 15
SPRITE_PLAYER_FALL_RECOIL_R   = SPRITE_BASE + 20
SPRITE_PLAYER_FALL_RECOIL_L   = SPRITE_BASE + 21

SPRITE_PLAYER_RELOAD_R        = SPRITE_BASE + 30
SPRITE_PLAYER_RELOAD_L        = SPRITE_BASE + 31

SPRITE_SOUL_CONTAINER_T_1     = SPRITE_BASE + 40
SPRITE_SOUL_CONTAINER_T_2     = SPRITE_BASE + 41
SPRITE_SOUL_CONTAINER_T_3     = SPRITE_BASE + 42
SPRITE_SOUL_CONTAINER_T_4     = SPRITE_BASE + 43
SPRITE_SOUL_CONTAINER_B_1     = SPRITE_BASE + 44
SPRITE_SOUL_CONTAINER_B_2     = SPRITE_BASE + 45
SPRITE_SOUL_CONTAINER_B_3     = SPRITE_BASE + 46
SPRITE_SOUL_CONTAINER_B_4     = SPRITE_BASE + 47

SPRITE_WALKER_WALK_R_1        = SPRITE_BASE + 48
SPRITE_WALKER_WALK_L_1        = SPRITE_BASE + 49
SPRITE_WALKER_WALK_R_2        = SPRITE_BASE + 50
SPRITE_WALKER_WALK_L_2        = SPRITE_BASE + 51
SPRITE_WALKER_WALK_R_3        = SPRITE_BASE + 52
SPRITE_WALKER_WALK_L_3        = SPRITE_BASE + 53
SPRITE_WALKER_WALK_R_4        = SPRITE_BASE + 54
SPRITE_WALKER_WALK_L_4        = SPRITE_BASE + 55
SPRITE_WALKER_WALK_R_5        = SPRITE_BASE + 56
SPRITE_WALKER_WALK_L_5        = SPRITE_BASE + 57
SPRITE_WALKER_WALK_R_6        = SPRITE_BASE + 58
SPRITE_WALKER_WALK_L_6        = SPRITE_BASE + 59

SPRITE_BIRD_FLY_R_1           = SPRITE_BASE + 60
SPRITE_BIRD_FLY_R_2           = SPRITE_BASE + 61
SPRITE_BIRD_FLY_R_3           = SPRITE_BASE + 62
SPRITE_BIRD_FLY_L_1           = SPRITE_BASE + 63
SPRITE_BIRD_FLY_L_2           = SPRITE_BASE + 64
SPRITE_BIRD_FLY_L_3           = SPRITE_BASE + 65

SPRITE_PURPLE_BLOCK_L         = SPRITE_BASE + 66
SPRITE_PURPLE_BLOCK_R         = SPRITE_BASE + 67

SPRITE_SPIDER_R_1             = SPRITE_BASE + 68
SPRITE_SPIDER_R_2             = SPRITE_BASE + 69
SPRITE_SPIDER_R_3             = SPRITE_BASE + 70
SPRITE_SPIDER_R_4             = SPRITE_BASE + 71
SPRITE_SPIDER_R_5             = SPRITE_BASE + 72
SPRITE_SPIDER_R_6             = SPRITE_BASE + 73
SPRITE_SPIDER_L_1             = SPRITE_BASE + 74
SPRITE_SPIDER_L_2             = SPRITE_BASE + 75
SPRITE_SPIDER_L_3             = SPRITE_BASE + 76
SPRITE_SPIDER_L_4             = SPRITE_BASE + 77
SPRITE_SPIDER_L_5             = SPRITE_BASE + 78
SPRITE_SPIDER_L_6             = SPRITE_BASE + 79

SPRITE_EXPLOSION_1            = SPRITE_BASE + 80
SPRITE_EXPLOSION_2            = SPRITE_BASE + 81
SPRITE_EXPLOSION_3            = SPRITE_BASE + 82
SPRITE_EXPLOSION_4            = SPRITE_BASE + 83
SPRITE_EXPLOSION_5            = SPRITE_BASE + 84
SPRITE_EXPLOSION_6            = SPRITE_BASE + 85
SPRITE_EXPLOSION_7            = SPRITE_BASE + 86
SPRITE_EXPLOSION_8            = SPRITE_BASE + 87

SPRITE_SNAKE_R_1              = SPRITE_BASE + 88
SPRITE_SNAKE_R_2              = SPRITE_BASE + 89
SPRITE_SNAKE_R_3              = SPRITE_BASE + 90
SPRITE_SNAKE_L_1              = SPRITE_BASE + 91
SPRITE_SNAKE_L_2              = SPRITE_BASE + 92
SPRITE_SNAKE_L_3              = SPRITE_BASE + 93

SPRITE_GHOST_1                = SPRITE_BASE + 94
SPRITE_GHOST_2                = SPRITE_BASE + 95
SPRITE_GHOST_3                = SPRITE_BASE + 96
SPRITE_GHOST_B_1              = SPRITE_BASE + 97
SPRITE_GHOST_B_2              = SPRITE_BASE + 98
SPRITE_GHOST_B_3              = SPRITE_BASE + 99

SPRITE_WHITE_SKULL_1          = SPRITE_BASE + 100

SPRITE_KEY                    = SPRITE_BASE + 102

SPRITE_SAVE_SPOT_1            = SPRITE_BASE + 103
SPRITE_SAVE_SPOT_2            = SPRITE_BASE + 104
SPRITE_SAVE_SPOT_3            = SPRITE_BASE + 105
SPRITE_SAVE_SPOT_4            = SPRITE_BASE + 106
SPRITE_SAVE_SPOT_5            = SPRITE_BASE + 107

SPRITE_FIRE_HEAD_RIGHT_1      = SPRITE_BASE + 108
SPRITE_FIRE_HEAD_RIGHT_2      = SPRITE_BASE + 109
SPRITE_FIRE_HEAD_RIGHT_3      = SPRITE_BASE + 110
SPRITE_FIRE_HEAD_RIGHT_4      = SPRITE_BASE + 111

SPRITE_FIRE_HEAD_LEFT_1       = SPRITE_BASE + 112
SPRITE_FIRE_HEAD_LEFT_2       = SPRITE_BASE + 113
SPRITE_FIRE_HEAD_LEFT_3       = SPRITE_BASE + 114
SPRITE_FIRE_HEAD_LEFT_4       = SPRITE_BASE + 115

SPRITE_FIRE_LEFT              = SPRITE_BASE + 116
SPRITE_FIRE_RIGHT             = SPRITE_BASE + 117

SPRITE_SPIKE_TRAP_1           = SPRITE_BASE + 118
SPRITE_SPIKE_TRAP_2           = SPRITE_BASE + 119
SPRITE_SPIKE_TRAP_3           = SPRITE_BASE + 120

SPRITE_FIRE_DOWN              = SPRITE_BASE + 121

SPRITE_FIRE_HEAD_UL           = SPRITE_BASE + 122
SPRITE_FIRE_HEAD_UR           = SPRITE_BASE + 123
SPRITE_FIRE_HEAD_LL           = SPRITE_BASE + 126
SPRITE_FIRE_HEAD_LR           = SPRITE_BASE + 127

SPRITE_GNAT_1                 = SPRITE_BASE + 124
SPRITE_GNAT_2                 = SPRITE_BASE + 125

;offset from calculated char pos to true sprite pos
SPRITE_CENTER_OFFSET_X  = 8
SPRITE_CENTER_OFFSET_Y  = 11

ITEM_TYPE_HEALTH        = $10
ITEM_TYPE_GOLD          = $20
ITEM_TYPE_AURA          = $30
ITEM_TYPE_PUZZLE_PIECE  = $40
ITEM_TYPE_RED_MAGIC     = $50
ITEM_TYPE_BLUE_MAGIC    = $60
ITEM_TYPE_GREEN_MAGIC   = $70
ITEM_TYPE_LIFE          = $80
ITEM_TYPE_RUBY          = $90

ITEM_TYPE_LIFE_STORE          = ITEM_TYPE_LIFE + $0f
ITEM_TYPE_PUZZLE_PIECE_STORE  = ITEM_TYPE_PUZZLE_PIECE + $0f

;entries of jump table
JUMP_TABLE_SIZE         = 10

;entries of fall table
FALL_TABLE_SIZE         = 12


;level data constants
LD_END                  = $80
LD_LINE_H               = $81    ;data contains x,y,width,char,color
LD_LINE_V               = $82    ;data contains x,y,height,char,color
LD_OBJECT               = $83    ;data contains x,y,type
LD_ELEMENT              = $84    ;single element block
LD_ELEMENT_LINE_H       = $85    ;element block line H
LD_ELEMENT_LINE_V       = $86    ;element block line V
LD_SEARCH_OBJECT        = $87    ;search object
LD_CLUE                 = $88    ;a clue item
LD_SPECIAL              = $89    ;special use
LD_DOOR                 = $8A    ;doors

;object type constants
TYPE_PLAYER             = 1
TYPE_PLAYER_BOTTOM      = 2
TYPE_TINY_WALKER        = 3
TYPE_BIRD               = 4
TYPE_SPIDER             = 5
TYPE_SAVE_SPOT          = 6
TYPE_SNAKE              = 7
TYPE_FIREHEAD_RIGHT     = 8
TYPE_FIREHEAD_LEFT      = 9
TYPE_FIRE_LEFT          = 10
TYPE_FIRE_RIGHT         = 11
TYPE_GNAT               = 12
TYPE_KEY                = 13
TYPE_PURPLE_BLOCK       = 14
TYPE_SOUL_CONTAINER     = 15
TYPE_MOBILE_SPIKE       = 16
TYPE_WHITE_SKULL        = 17
TYPE_GHOST              = 18
TYPE_FIRE_HEAD          = 19
TYPE_PURPLE_BLOCK_R     = 20
TYPE_FIRE_HEAD_UR       = 21
TYPE_FIRE_HEAD_LL       = 22
TYPE_FIRE_HEAD_LR       = 23
TYPE_EXPLOSION          = 24
TYPE_SOUL_CONTAINER_BOTTOM  = 25
TYPE_GHOST_BOTTOM       = 26
TYPE_FIRE_DOWN          = 27

OBJECT_HEIGHT           = 8 * 2 + 4 

;number of possible items
ITEM_COUNT              = 13
SEARCH_ITEM_COUNT       = 366

;this creates a basic start
!ifndef COMPILE_CRUNCHED {
*=$0801

          ;SYS 2064
          !byte $0C,$08,$0A,$00,$9E,$20,$32,$30,$36,$34,$00,$00,$00,$00,$00
} else {
*=$080A
}
 
          lda #$37 
          sta $01

          ;init sprite registers
          ;no visible sprites
          lda #0
          sta VIC_SPRITE_ENABLE
 
!ifdef DETECT_PAL_NTSC { 
          jsr DetectPalNTSC
}          
          
!ifndef BUILD_CARTRIDGE {          
          lda $ba
          sta LOAD_CODE_START
          bne .NoDefaultDriveNeeded
          
          lda #8
          sta LOAD_CODE_START
.NoDefaultDriveNeeded          
}          
          ;set charset
          ;lda #$3c
          lda #$3e
          sta VIC_MEMORY_CONTROL

          ;VIC bank
          lda CIA_PRA
          and #$fc
          sta CIA_PRA

!ifndef COMPILE_CRUNCHED {
          ;----------------------------------
          ;copy charset and sprites to target          
          ;----------------------------------
          
          ;block interrupts 
          ;since we turn ROMs off this would result in crashes if we didn't
          sei
          
          ;save old configuration
          lda $01
          sta PARAM1
          
          ;only RAM
          ;to copy under the IO rom
          lda #%00110000
          sta $01
          
          ;take source address from CHARSET
          LDA #<CHARSET_PANEL
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET_PANEL
          STA ZEROPAGE_POINTER_1 + 1
          
          ;now copy
          jsr CopyCharSetPanel
          
          ;take source address from CHARSET
          LDA #<CHARSET
          STA ZEROPAGE_POINTER_1
          LDA #>CHARSET
          STA ZEROPAGE_POINTER_1 + 1
          
          ;now copy
          jsr CopyCharSet
          
          ;take source address from SPRITES
          lda #<SPRITES
          sta ZEROPAGE_POINTER_1
          lda #>SPRITES
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr CopySprites
          
          ;restore ROMs
          lda PARAM1
          sta $01
          
          cli
}
          sei
          lda #$36
          ;lda #$35
          sta $01
          cli


          ;background black
          lda #0
          sta VIC_BACKGROUND_COLOR
          sta VIC_BORDER_COLOR
          
          ;set charset multi colors
          ;lda #1
          lda #6
          sta VIC_CHARSET_MULTICOLOR_1
          ;lda #9
          lda #1
          sta VIC_CHARSET_MULTICOLOR_2
          ;enable multi color charset
          lda VIC_CONTROL
          ora #$10
          sta VIC_CONTROL

          ;set sprite flags
          lda #0
          sta VIC_SPRITE_X_EXTEND
          sta VIC_SPRITE_ENABLE
          sta VIC_SPRITE_MULTICOLOR
          
          ;sprite multi colors
          lda #7
          sta VIC_SPRITE_MULTICOLOR_1
          lda #11
          sta VIC_SPRITE_MULTICOLOR_2

          ;set charset 2
          lda #$3c
          sta VIC_MEMORY_CONTROL
          lda #1
          sta VIC_CHARSET_MULTICOLOR_1
          lda #9
          sta VIC_CHARSET_MULTICOLOR_2 

!ifndef NO_MUSIC {
          lda #0
          jsr MUSIC_PLAYER
}
          
!zone Title
Title
          lda #0
          sta BUTTON_RELEASED
          sta VIC_SPRITE_ENABLE
          sta PLAYER_DEAD_DELAY
          
           lda #$ff
          sta sfx_count
          
          lda #0
          ldx #0
          
.ClearObjectLoop          
          sta SPRITE_ACTIVE,x
          inx
          cpx #8
          bne .ClearObjectLoop 

          jsr ClearScreen
          
          ;insert player bottom
          lda #TYPE_PLAYER_BOTTOM
          sta PARAM3
          lda #5
          sta PARAM1
          lda #11
          sta PARAM2
          jsr AddObjectFromStart
          lda #PLAYER_SPRITE_COLOR
          sta VIC_SPRITE_COLOR
          sta VIC_SPRITE_COLOR + 1
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          
          ;insert player top
          lda #TYPE_PLAYER
          dec PARAM3
          dec PARAM2
          dec PARAM2
          jsr AddObjectFromStart
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp

          ;player sprite right
          ;insert player bottom
          lda #TYPE_PLAYER_BOTTOM
          sta PARAM3
          lda #34
          sta PARAM1
          lda #11
          sta PARAM2
          jsr AddObject
          lda #PLAYER_SPRITE_COLOR
          sta VIC_SPRITE_COLOR + 2
          sta VIC_SPRITE_COLOR + 3
          lda #SPRITE_PLAYER_STAND_L_BOTTOM
          sta SPRITE_POINTER_BASE,x
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          
          ;insert player top
          lda #TYPE_PLAYER
          sta PARAM3
          dec PARAM2
          dec PARAM2
          jsr AddObject
          lda #SPRITE_PLAYER_STAND_L_TOP
          sta SPRITE_POINTER_BASE,x
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp

          ;Title level
          lda #9 + 67
          sta LEVEL_NR
          jsr BuildScreen
          
          ;hide again to not show logo
          lda #$0b
          sta VIC_CONTROL_MODE
          
          lda #15
          sta VIC_SPRITE_ENABLE
          lda #12
          sta VIC_SPRITE_X_EXTEND
          
          lda #<TEXT_TITLE_LOGO
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_TITLE_LOGO
          sta ZEROPAGE_POINTER_1 + 1
          lda #6
          sta PARAM1
          lda #1
          sta PARAM2
          
          lda #11
          sta PARAM3
          jsr DisplayText
          
          
          lda #0
          sta HSCROLL_POINTER
          sta HSCROLL_POINTER + 1
          
          lda #<( SCREEN_COLOR + 24 * 40 )
          sta ZEROPAGE_POINTER_2
          lda #>( SCREEN_COLOR + 24 * 40 )
          sta ZEROPAGE_POINTER_2 + 1
          
          ;fill scroller color
          ldy #0
          lda #1
          
.CopyLoop 
          sta (ZEROPAGE_POINTER_2),y
          iny
          cpy #40
          bne .CopyLoop
          
!ifndef NO_MUSIC {          
          ;reuse a=1
          lda #1
          sta HSCROLL_POS
          jsr MUSIC_PLAYER
}

          
          
          lda #0
          sta PARAM1
          sta PARAM3
          sta PARAM4

          jsr TitleColor
          jsr InitTitleIRQ

.TitleLoop          
          jsr TitleColor

          jsr WaitFrame

!ifndef NO_MUSIC {
          jsr MUSIC_PLAYER + 3
           jsr copy_zp_to_sid ; copy temporary zp to actual sid registers
}          
 
          ;cheat code
          JSR $EA87 ;scan keyboard
          jsr $FFE4 ;GETIN
          beq +
          ldx CHEAT_POS
          sta CHEAT_CODE,x 
          inc CHEAT_POS
          lda CHEAT_POS
          and #$03
          sta CHEAT_POS
 
          ;cheat correct?
          ldx #0
-          
          lda CHEAT_CODE,x
          cmp CHEAT_CORRECT,x
          bne +
          inx
          cpx #4
          bne -
          
          jmp GameEnded
+

 
          ;idle anim left
          jsr GenerateRandomNumber
          and #$01
          adc PLAYER_STAND_STILL_COUNT
          sta PLAYER_STAND_STILL_COUNT
          cmp #220
          bcc .NoIdle

          lda #SPRITE_PLAYER_HEAD_TURN_R
          sta SPRITE_POINTER_BASE + 1
          jmp .IdleDoneLeft
          
.NoIdle          
          lda #SPRITE_PLAYER_STAND_R_TOP
          sta SPRITE_POINTER_BASE + 1

.IdleDoneLeft

;idle anim right
          jsr GenerateRandomNumber
          and #$01
          adc PLAYER_STAND_STILL_COUNT + 1
          sta PLAYER_STAND_STILL_COUNT + 1
          cmp #220
          bcc .NoIdleRight

          lda #SPRITE_PLAYER_HEAD_TURN_L
          sta SPRITE_POINTER_BASE + 3
          jmp .IdleDoneRight
          
.NoIdleRight
          lda #SPRITE_PLAYER_STAND_L_TOP
          sta SPRITE_POINTER_BASE + 3

.IdleDoneRight
          lda JOYSTICK_PORT_II
          and #$10
          bne .NotFirePressed
          
          lda BUTTON_RELEASED
          bne StartGame
          jmp .TitleLoop
          
.NotFirePressed
          lda #1
          sta BUTTON_RELEASED
          jmp .TitleLoop
          
TitleColor          
          lda #$00
          sta PARAM1

          ldy #50          ;this is the line where our rasterbar will start.
          ldx TITLE_COLOR_OFFSET
loop      lda colors,x     ;load value at label 'colors' plus x into a. if we don't add x, only the first 
                          ;value from our color-table will be read.

          cpy VIC_RASTER_POS        ;ComPare current value in Y with the current rasterposition.
          bne *-3          ;is the value of Y not equal to current rasterposition? then jump back 3 bytes (to cpy).

          sta VIC_CHARSET_MULTICOLOR_1
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
          iny              ;next rasterline.
          jmp loop
          
.End
          inc TITLE_COLOR_OFFSET
          lda TITLE_COLOR_OFFSET
          cmp #51
          bne .NoOverFlow
          
          lda #0
          sta TITLE_COLOR_OFFSET
.NoOverFlow          
          rts




          
StartGame
          lda #$0b
          sta VIC_CONTROL_MODE
          
          jsr ReleaseIRQ

           lda #$ff
          sta sfx_count

          ;enable multi color charset
          lda #$18
          sta VIC_CONTROL

!zone StartGame

          ;game start values
          lda #3
          sta PLAYER_LIVES
          lda #0
          sta GAME_WAS_STARTED
          sta PLAY_TIME_FRAME
          sta PLAY_TIME_SECONDS
          sta PLAY_TIME_MINUTES
          sta PLAYER_START_LEVEL
          lda #11
          sta PLAYER_START_X
          lda #19
          sta PLAYER_START_Y

          jsr GenerateRandomNumber
          sta GAME_RANDOM_SEED
          
          ;setup random tiles
          jsr SetupSearchItems
 
!ifndef NO_MUSIC { 
          lda #0
          jsr MUSIC_PLAYER
}

          ;setup level
          jsr StartLevel
          
RespawnPlayer          
          lda #6
          sta PLAYER_HEALTH
          lda #0
          sta PLAYER_INVINCIBLE
          sta PLAYER_JUMPAUTOMOVE
          sta PLAYER_JUMP_POS
          sta PLAYER_DEAD_DELAY

          ;health display
          lda #<TEXT_HEALTH
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_HEALTH
          sta ZEROPAGE_POINTER_1 + 1
          lda #3
          sta PARAM1
          lda #23
          sta PARAM2
          lda #13
          sta PARAM3
          jsr DisplayText

          lda PLAYER_LIVES
          clc
          adc #80
          sta SCREEN_CHAR + 4 + 23 * 40
          lda #1
          sta SCREEN_COLOR + 4 + 23 * 40

          ;clear player object data
          lda #0
          sta SPRITE_ACTIVE
          sta SPRITE_ACTIVE + 1
          sta SPRITE_FALLING
          sta SPRITE_FALLING + 1
          sta SPRITE_ANIM_POS
          sta SPRITE_ANIM_POS + 1
          sta SPRITE_ANIM_DELAY
          sta SPRITE_ANIM_DELAY + 1
          lda #1
          sta DOWN_RELEASED
          
          ;insert player bottom
          lda #TYPE_PLAYER_BOTTOM
          sta PARAM3
          lda PLAYER_START_X
          sta PARAM1
          lda PLAYER_START_Y
          sta PARAM2
          jsr AddObjectFromStart
          lda #PLAYER_SPRITE_COLOR
          sta VIC_SPRITE_COLOR
          sta VIC_SPRITE_COLOR + 1
          ;ldx #0
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          
          ;insert player top
          lda #TYPE_PLAYER
          sta PARAM3
          dec PARAM2
          dec PARAM2
          jsr AddObjectFromStart
          ;ldx #1
          jsr MoveSpriteUp
          jsr MoveSpriteUp 
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp

          lda PLAYER_START_LEVEL
          sta LEVEL_NR
          jsr BuildScreen
          
          lda #$0b
          sta VIC_CONTROL_MODE
          
          lda GAME_WAS_STARTED
          bne .WasAlreadyStarted

          jsr InitGameIRQ
          
          inc GAME_WAS_STARTED
          
          
.WasAlreadyStarted          
          lda #$1b
          sta VIC_CONTROL_MODE
!ifndef NO_CHEATS {
          jmp GameLoop
  
;------------------------------------------------------------
;the main game loop
;------------------------------------------------------------


.JumpToNextLevel
          inc LEVEL_NR
          jsr BuildScreen
          jmp GameLoop

.JumpToPrevLevel
          dec LEVEL_NR
          jsr BuildScreen
          jmp GameLoop
}
 
GameLoop  
          jsr WaitFrame

!ifndef NO_CHEATS {          
          JSR $FFE4 ;GETIN
          BEQ .NOCHEAT

          CMP #49
          BEQ .JumpToNextLevel
          CMP #50
          BEQ .JumpToPrevLevel
          cmp #51
          beq .AddPiece
          cmp #52
          beq .FillLives
          cmp #53
          bne .NOCHEAT
          
          ;start ending
          jsr StartEnding
          
.FillLives          
          lda #3
          sta PLAYER_LIVES
          lda PLAYER_LIVES
          clc
          adc #80
          sta SCREEN_CHAR + 4 + 23 * 40
          
          jmp .NOCHEAT
          
!if 0 {          
DivideBy10
          sec
          ldy #$FF
.divloop
          iny
          sbc #10
          bcs .divloop
          adc #10
          rts
}

.AddPiece          
          lda #0
          sta PARAM7
.AddPieceLoop       
          ldx PARAM7
          jsr AddPuzzlePiece
          inc PARAM7
          ldx PARAM7
          cpx #12
          bne .AddPieceLoop
          
.NOCHEAT

!if 0 {
          ;show clock
          ;lda PLAY_TIME_SECONDS
          lda DRIVE_NUMBER
          jsr DivideBy10
          pha
          ;10 digit
          tya
          clc
          adc #80
          sta SCREEN_CHAR + ( 23 * 40 + 35 )
          pla
          clc
          adc #80
          sta SCREEN_CHAR + ( 23 * 40 + 36 )
          
          lda PLAY_TIME_MINUTES
          jsr DivideBy10
          pha
          ;10 digit
          tya
          clc
          adc #80
          sta SCREEN_CHAR + ( 23 * 40 + 33 )
          pla
          clc
          adc #80
          sta SCREEN_CHAR + ( 23 * 40 + 34 )
}
}
          jsr ObjectControl
          jsr CheckCollisions

          ;auto return delay when dead
          lda PLAYER_DEAD_DELAY
          beq +
          
          lda PLAYER_DEAD_DELAY_DELAY
          eor #$1
          sta PLAYER_DEAD_DELAY_DELAY
          bne +
          
          dec PLAYER_DEAD_DELAY
          bne +
          
          ;death delay done, respawn or return to title
          jmp DeathDelayDone
+          
          
          lda GAME_COMPLETE
          beq .NotComplete
          cmp #3
          bne +
          
          jmp GameEnded
        
+        
          jsr HandleGameComplete
          
.NotComplete          
          ;freeze delay
          lda ENEMY_SPELL
          cmp #2
          bne .NotFrozen
          
          lda FREEZE_DELAY_COUNT
          eor #1
          sta FREEZE_DELAY_COUNT
          beq .NotFrozen
          inc ENEMY_SPELL_COUNT
          bne .NotFrozen
          
          lda #0
          sta ENEMY_SPELL

.NotFrozen
          ;flash puzzle bar
          lda PLAYER_COLLECTED_PUZZLE_PARTS
          cmp #12
          bne .NotAllPiecesCollected
          lda PLAYER_PUZZLE_MODE
          bne .NotAllPiecesCollected
          
          inc PLAYER_PUZZLE_PIECE_FLASH_POS
          lda PLAYER_PUZZLE_PIECE_FLASH_POS
          and #$07
          tax
          
          lda PUZZLE_FLASH_COLORS,x
          sta SCREEN_COLOR + 23 * 40 + 32
          sta SCREEN_COLOR + 23 * 40 + 33
          sta SCREEN_COLOR + 23 * 40 + 34
          sta SCREEN_COLOR + 23 * 40 + 35
          sta SCREEN_COLOR + 23 * 40 + 36
.NotAllPiecesCollected

          ;manual respawn
          lda SPRITE_ACTIVE
          bne .PlayerAlive

          lda #$10
          bit JOYSTICK_PORT_II
          bne .NotFirePressed

          lda BUTTON_RELEASED
          beq .FireNotReleased
          
DeathDelayDone          
          lda PLAYER_LIVES
          bne .RespawnPlayer
          
          jsr ReleaseIRQ
          jmp Title
 
.RespawnPlayer
          ;respawn player
          jmp RespawnPlayer
          
.NotFirePressed
          lda #1
          sta BUTTON_RELEASED
          
.FireNotReleased          
.PlayerAlive          
          jmp GameLoop          
          
          
!ifdef DETECT_PAL_NTSC {          
;returns 0 if NTSC, 1 if PAL
!zone DetectPalNTSC
DetectPalNTSC
              sei                         ; disable interrupts
              ldx NMI_VECTOR
              ldy NMI_VECTOR + 1          ; remember old NMI-vector
              lda #<return
              sta NMI_VECTOR
              lda #>return                   ; let NMI-vector point to
              sta NMI_VECTOR + 1          ; a RTI
wait
              lda VIC_RASTER_POS
              bne wait                    ; wait for rasterline 0 or 256
              lda #$37
              sta VIC_RASTER_POS
              lda #$9b                    ; write testline $137 to the
              sta $d011                   ; latch-register
              lda #$01
              sta $d019                   ; clear IMR-Bit 0
wait1 
              lda $d011                   ; Is rasterbeam in the area
              bpl wait1                   ; 0-255? if yes, wait
wait2
              lda $d011                   ; Is rasterbeam in the area
              bmi wait2                   ; 256 to end? if yes, wait
              lda $d019                   ; read IMR
              and #$01                    ; mask Bit 0
              sta $d019                   ; clear IMR-Bit 0
              stx NMI_VECTOR
              sty NMI_VECTOR + 1          ; restore old NMI-vector
              cli                         ; enable interrupts
              
              sta KERNAL_PAL              ; update KERNAL-variable
              rts

return        rti                         ; go immediately back after
                                          ; a NMI
          
}          
 
;------------------------------------------------------------
;out of main loop
;------------------------------------------------------------

!zone GameEnded     
!ifdef BUILD_CARTRIDGE {
GameEnded     
              ;evtl. TODO
              jsr ReleaseIRQ
              
              ;store play time in RAM for outro
              lda #$17
              sta GAME_RESULT_DATA
              sta GAME_RESULT_DATA + 1
              sta GAME_RESULT_DATA + 2
              lda PLAY_TIME_SECONDS
              sta GAME_RESULT_DATA + 3
              lda PLAY_TIME_MINUTES
              sta GAME_RESULT_DATA + 4
              
              ldy #8
              ;reseat horizontal offset
              sty VIC_CONTROL
              jmp $0400
} else {
TEXT_PRESS_FIRE
          !text 199,201,184,202,202,  0,185,188,201,184,  0,203,198,  0,182,198,197,203,188,197,204,184,$ff                    ;press fire to continue
TEXT_LOADING
          !text   0,  0,  0,  0,  0,  0,  0,191,198,180,183,188,197,186,214,  0,  0,  0,  0,  0,  0,  0,$ff                    ;loading...
FADE_OUT_TABLE
          !byte 15,12,11,0
 
GameEnded          

          lda #0
          sta VIC_SPRITE_ENABLE
          
          jsr ReleaseIRQ
          
          ldy #8
          ;reseat horizontal offset
          sty VIC_CONTROL
          
          lda #0
          sta VIC_BACKGROUND_COLOR
          
          ;store play time in RAM for outro
          lda #$17
          sta GAME_RESULT_DATA
          sta GAME_RESULT_DATA + 1
          sta GAME_RESULT_DATA + 2
          lda PLAY_TIME_SECONDS
          sta GAME_RESULT_DATA + 3
          lda PLAY_TIME_MINUTES
          sta GAME_RESULT_DATA + 4
          
          lda #$36
          sta $01
          
          jsr ClearScreen
          
          

          ;SID resetten
          ldy #0
          lda #0
          sta GAME_FRAME
          sta GAME_FRAME_2
          
.sidloop
          sta $d400,y
          iny
          cpy #$19
          bne .sidloop


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


FetchOutroLoop
          lda #9
          sta PARAM1
          lda #12
          sta PARAM2
          lda #1
          sta PARAM3

          lda #<TEXT_PRESS_FIRE
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_PRESS_FIRE
          sta ZEROPAGE_POINTER_1 + 1
          jsr DisplayText

          lda #$30
          sta VIC_MEMORY_CONTROL
 
.WaitLoop          
          jsr WaitFrame
          
          ldy GAME_FRAME
          cpy #4
          beq +
          
          inc GAME_FRAME_2
          lda GAME_FRAME_2
          and #$03
          bne +

          lda FADE_OUT_TABLE,y
          sta VIC_BORDER_COLOR
          sta VIC_BACKGROUND_COLOR
          inc GAME_FRAME
+

          lda JOYSTICK_PORT_II
          and #$10
          beq .FirePressed
          jmp .WaitLoop
          
.FirePressed
          jmp FetchOutro
          
          
          
          
!source "load.asm"          


!zone FetchOutro
FetchOutro
          lda #<TEXT_LOADING
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_LOADING
          sta ZEROPAGE_POINTER_1 + 1
          jsr DisplayText
          
          lda #1
          sta PARAM1
          jsr LOAD_CODE
          jmp FetchOutroLoop
          
}


;------------------------------------------------------------
;final animations
;------------------------------------------------------------
!zone HandleGameComplete          
HandleGameComplete                    
          ldy GAME_FRAME_2
          lda GAME_COMPLETE_SCENE_LO,y
          sta ZEROPAGE_POINTER_1
          lda GAME_COMPLETE_SCENE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          jmp (ZEROPAGE_POINTER_1)
          
          
GAME_COMPLETE_SCENE_LO
          !byte <Scene1
          !byte <Scene2
          !byte <Scene3
GAME_COMPLETE_SCENE_HI
          !byte >Scene1
          !byte >Scene2
          !byte >Scene3
          

!zone Scene1
Scene1          
          inc GAME_FRAME
          lda GAME_FRAME
          cmp #90
          beq NextScene
          and #$07
          beq +
          rts
          
+          
          ;explosions
          jsr GenerateRandomNumber
          and #$03
          clc
          adc #17
          sta PARAM1
          jsr GenerateRandomNumber
          and #$03
          clc
          adc #11
          sta PARAM2
          lda #TYPE_EXPLOSION
          sta PARAM3
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          
          rts


NextScene
          inc GAME_FRAME_2
          lda #0
          sta GAME_FRAME
          
          lda #0
          sta BACKGROUND_COLOR
          rts

!zone Scene2
Scene2
          inc GAME_FRAME
          lda GAME_FRAME
          cmp #30
          beq +
          cmp #64
          beq ++
          cmp #100
          beq NextScene
          rts
          
+          
          lda #19
          sta PARAM1
          lda #11
          sta PARAM2
          lda #TYPE_EXPLOSION
          sta PARAM3
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          
          lda #20
          sta PARAM1
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          
          lda #13
          sta PARAM2
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          
          lda #19
          sta PARAM1
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          rts

++  
          ;explode, free soul
          ldx #2
          jsr RemoveObject
          ldx #3
          jsr RemoveObject
          
          lda #20
          sta PARAM1
          lda #11
          sta PARAM2
          lda #TYPE_GHOST
          sta PARAM3 
          jsr AddObject
          lda #10
          sta SPRITE_BEHAVIOUR,x
          lda #12
          sta VIC_SPRITE_COLOR,x
          
          lda #14
          sta PARAM2
          lda #TYPE_GHOST_BOTTOM
          sta PARAM3
          jsr AddObject
          lda #12
          sta VIC_SPRITE_COLOR,x
          
          lda #18
          sta PARAM1
          lda #10
          sta PARAM2
          lda #TYPE_EXPLOSION
          sta PARAM3
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          
          lda #21
          sta PARAM1
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          
          lda #14
          sta PARAM2
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          
          lda #18
          sta PARAM1
          jsr AddObject
          jsr GenerateRandomNumber
          sta VIC_SPRITE_COLOR,x
          rts
          
          
!zone Scene3
Scene3
          lda GAME_COMPLETE
          cmp #2
          beq +
          rts
          
-
          ;fade out complete
          lda #3
          sta GAME_COMPLETE
          rts
          
+
          ;touched by soul
          lda #0
          sta SPRITE_BEHAVIOUR + 2
          
          inc GAME_FRAME
          lda GAME_FRAME
          cmp #8
          beq -
          
          ;fade out colors
          ldx #0
          
-          
          ldy TOP_CHARSET_MULTICOLOR_1,x
          lda COLOR_FADE_TABLE,y
          sta TOP_CHARSET_MULTICOLOR_1,x
          inx
          cpx #5
          bne -
          
          ;store last entry as well
          sta VIC_BACKGROUND_COLOR
          
          lda VIC_SPRITE_MULTICOLOR_1
          and #$0f
          tay
          lda COLOR_FADE_TABLE,y
          sta VIC_SPRITE_MULTICOLOR_1
          lda VIC_SPRITE_MULTICOLOR_2
          and #$0f
          tay
          lda COLOR_FADE_TABLE,y
          sta VIC_SPRITE_MULTICOLOR_2

          ldx #0
          
-          
          lda VIC_SPRITE_COLOR,x
          and #$0f
          tay
          lda COLOR_FADE_TABLE,y
          sta VIC_SPRITE_COLOR,x
          
          inx
          cpx #4
          bne -
          
          lda #<SCREEN_COLOR
          sta ZEROPAGE_POINTER_1
          lda #>SCREEN_COLOR
          sta ZEROPAGE_POINTER_1 + 1
          
          ldx #0
          stx PARAM2
          
-          
          ldy #0
          
--          
          lda (ZEROPAGE_POINTER_1),y
          and #$0f
          tax
          lda COLOR_FADE_TABLE,x
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          bne --
          
          inc PARAM2
          
          inc ZEROPAGE_POINTER_1 + 1
          lda PARAM2
          cmp #3
          bne -

          ;last round
          ldy #0
--          
          lda (ZEROPAGE_POINTER_1),y
          and #$0f
          tax
          lda COLOR_FADE_TABLE,x
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          cpy #232
          bne --

          rts
          
          
;------------------------------------------------------------
;setup ending part when all pieces are set correct
;------------------------------------------------------------
!zone StartEnding          
StartEnding  
          lda #255
          sta PLAYER_AUTO_CROUCH
          
          lda #1
          sta GAME_COMPLETE
          lda #6
          sta HOMING_UPDATE_DELAY
          
          ;store score in temp. storage
          
          ldy #0
          
-          
          lda SCREEN_CHAR + ( 23 * 40 + 17 ),y
          sta GAME_RESULT_DATA + 5,y
          
          iny
          cpy #6
          bne -
          rts

;------------------------------------------------------------
;finds a random item slot
;returns slot in PARAM1 (LO), PARAM2 (HI)
;------------------------------------------------------------
!zone FindRandomItemSlot
FindRandomItemSlot

          jsr GenerateRandomNumber
          sta PARAM1
          
          jsr GenerateRandomNumber
          and #$01
          sta PARAM2
          beq .ItemIDOk
          
          ;check if we are not outside the item count
          lda PARAM1
          cmp #( SEARCH_ITEM_COUNT - 256 )
          bcs FindRandomItemSlot
          
.ItemIDOk
          rts


;------------------------------------------------------------
;randomizes items
;------------------------------------------------------------
!zone SetupSearchItems
.RandomItem
          jsr GeneratePseudoRandomNumber
          and #$01
          beq .SkipItem
          
-
          jsr GeneratePseudoRandomNumber
          and #$07
          ;do not create random puzzle piece
          cmp #$04
          beq -
          
          cmp #$05
          beq .WasMagic
          cmp #$06
          beq .WasMagic
          cmp #$07
          beq .WasMagic
          
.AddMagic          
          asl
          asl
          asl
          asl
          
          rts


.WasMagic
          sta PARAM1
          jsr GenerateRandomNumber
          and #$01
          beq .NoMagic
          lda PARAM1
          jmp .AddMagic
          
.NoMagic
.SkipItem
          ;replace with gold
          jsr GenerateRandomNumber
          and #$01
          beq .Ruby
          lda #ITEM_TYPE_GOLD
          rts
          
.Ruby
          lda #ITEM_TYPE_RUBY
          rts



!ct raw
!ct 'A',180,'B',181,'C',182,'D',183,'E',184,'F',185,'G',186,'H',187,'I',188,'J',189,'K',190,'L',191
!ct 'M',196,'N',197,'O',198,'P',199,'Q',200,'R',201,'S',202,'T',203,'U',204,'V',205,'W',206,'X',207
!ct 'Y',212,'Z',213
!ct '0',80,'1',81,'2',82,'3',83,'4',84,'5',85,'6',86,'7',87,'8',88,'9',89
!ct '*',$ff,' ',0
          
          
          


BEFORE_1000
* = $1000

!bin "soulless24.bin"

HSCROLL_TEXT
          !text "WELCOME TO SOULLESS  "
          !text "GFX AND DESIGN BY TREVOR STOREY  "
          !text "MUSIC BY MIKKEL HASTRUP  "
          !text "CODE BY GEORG ROTTENSTEINER  "
          !text "GAME TESTING BY KENZ AND HEAVY STYLUS  "
          !text "RELEASED IN 2012 BY PSYTRONIK SOFTWARE AND RGCD  "
          !text "*"

;this five must be following each other in memory!          
TOP_CHARSET_MULTICOLOR_1
          !byte 6
TOP_CHARSET_MULTICOLOR_2
          !byte 6
BOTTOM_CHARSET_MULTICOLOR_1
          !byte 6
BOTTOM_CHARSET_MULTICOLOR_2
          !byte 8
TOP_CHARSET_VALUE 
          !byte $3e
BACKGROUND_COLOR
          !byte 0


!ct raw

TEXT_ITEM_BUBBLE
          !text  4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,$fe
          !text  7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9,$fe
          !text 10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,$ff

FRAMES_PER_SECOND
          !byte 60                ;NTSC
          !byte 50                ;PAL

          
BIT_TABLE
          !byte 1,2,4,8,16,32,64,128

HSCROLL_POS
          !byte 1

EXPLOSION_COLOR_TABLE
          !byte 1,1,10,10,10,10,10,10

PLAYER_DEAD_DELAY
          !byte 0
PLAYER_DEAD_DELAY_DELAY
          !byte 0

GAME_RANDOM_SEED
          !byte 0



SetupSearchItems

          ; health
          ; puzzle piece
          ; gold (score)
          ; temp. invincibility
          ldx #0
          
          ;lo items
.NextItem      
          jsr .RandomItem
          
          ora #$0f

          sta SEARCH_ITEM_STATE,x
          inx
          bne .NextItem
          
          ;hi items
.NextHiItem          
          jsr .RandomItem
          ora #$0f

          sta SEARCH_ITEM_STATE + 256,x
          inx
          cpx #( SEARCH_ITEM_COUNT - 256 )
          bne .NextHiItem
          
          ;spread 2 lives
          lda #2
          sta PARAM6
          
          
.SpreadNextLife          
          jsr FindRandomItemSlot
          ldx PARAM1
          lda PARAM2
          beq .ItemLo
          
          lda #ITEM_TYPE_LIFE_STORE
          sta SEARCH_ITEM_STATE + 256,x
          jmp .FillNext
          
.ItemLo          
          lda #ITEM_TYPE_LIFE_STORE
          sta SEARCH_ITEM_STATE,x
          
.FillNext
          dec PARAM6
          bne .SpreadNextLife
          
          ;spread puzzle parts
          ldx #0
          stx PLAYER_COLLECTED_PUZZLE_PARTS
          
.SpreadPuzzlePart          
          lda #96
          sta PLAYER_PUZZLE_PARTS,x
          lda #114
          sta SCREEN_PUZZLE_PARTS,x
          
          jsr FindRandomItemSlot
          lda PARAM1
          sta GAME_PUZZLE_PART_ITEM_LO,x
          lda PARAM2
          sta GAME_PUZZLE_PART_ITEM_HI,x
          
          ;check if we didn't accidentally use the same item
          ldy #0
          
.CheckItem          
          sty PARAM3
          cpx PARAM3
          beq .CheckedAllItems
          
          lda GAME_PUZZLE_PART_ITEM_LO,x
          cmp GAME_PUZZLE_PART_ITEM_LO,y
          bne .CheckNextItem
          
          ;lo is equal
          lda GAME_PUZZLE_PART_ITEM_HI,x
          cmp GAME_PUZZLE_PART_ITEM_HI,y
          bne .CheckNextItem
          
          ;was set at the same spot!
          jmp .SpreadPuzzlePart
          
          
.CheckNextItem
          iny
          jmp .CheckItem
          
.CheckedAllItems
          ;puzzle part was set ok
          
          ;insert puzzle item in search item
          lda GAME_PUZZLE_PART_ITEM_HI,x
          beq .PuzzleItemLo
          
          ldy GAME_PUZZLE_PART_ITEM_LO,x
          lda #ITEM_TYPE_PUZZLE_PIECE_STORE
          sta SEARCH_ITEM_STATE + 256,y
          jmp .PuzzleItemSet
          
.PuzzleItemLo          
          ldy GAME_PUZZLE_PART_ITEM_LO,x
          lda #ITEM_TYPE_PUZZLE_PIECE_STORE
          sta SEARCH_ITEM_STATE,y
          
.PuzzleItemSet          
          inx
          cpx #12
          bne .SpreadPuzzlePart
          

          ;randomize puzzle parts
          lda #0
          ldx #0
          
.ClearNextPuzzlePart          
          sta GAME_PUZZLE_PARTS,x
          sta SOLUTION_PUZZLE_PARTS,x
          inx
          cpx #12
          bne .ClearNextPuzzlePart
          
          ;insert puzzle parts
          ldy #115
          
          ;for every part
          ldx #0
.NextPart          
          jsr GeneratePseudoRandomNumber
          sta PARAM1
          
.CheckSlot          
          lda GAME_PUZZLE_PARTS,x
          beq .EmptySlotFound
          
.CheckNextSlot
          inx
          cpx #12
          bne .CheckSlot
          
          ldx #0
          jmp .CheckSlot

.EmptySlotFound
          lda PARAM1
          beq .FillSlot
          
          dec PARAM1
          jmp .CheckNextSlot
          
.FillSlot
          tya
          sta GAME_PUZZLE_PARTS,x

          iny
          cpy #127
          bne .NextPart
          
          ;fall through

!zone RandomizeSolution
          ;insert solution parts
          ldy #115
          
          ;for every part
          ldx #0
.NextPart          
          jsr GeneratePseudoRandomNumber
          sta PARAM1
          
.CheckSlot          
          lda SOLUTION_PUZZLE_PARTS,x
          beq .EmptySlotFound
          
.CheckNextSlot
          inx
          cpx #12
          bne .CheckSlot
          
          ldx #0
          jmp .CheckSlot

.EmptySlotFound
          lda PARAM1
          beq .FillSlot
          
          dec PARAM1
          jmp .CheckNextSlot
          
.FillSlot
          tya
          sta SOLUTION_PUZZLE_PARTS,x

          iny
          cpy #127
          bne .NextPart
          
          ;clear keys
          lda #0
          sta PLAYER_KEY
          sta PLAYER_KEY + 1
          sta PLAYER_KEY + 2
          rts

;------------------------------------------------------------
;sets up variables for new level
;------------------------------------------------------------
!zone StartLevel
StartLevel
          lda #0
          sta VIC_SPRITE_ENABLE

          lda #<TEXT_PANEL
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_PANEL
          sta ZEROPAGE_POINTER_1 + 1
          lda #0
          sta PARAM1
          lda #22
          sta PARAM2
          lda #15
          sta PARAM3
          jsr DisplayText

          lda #<TEXT_SCORE
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_SCORE
          sta ZEROPAGE_POINTER_1 + 1
          lda #17
          sta PARAM1
          lda #23
          sta PARAM2
          lda #1
          sta PARAM3
          jsr DisplayText
          
          lda #<TEXT_PUZZLE
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_PUZZLE
          sta ZEROPAGE_POINTER_1 + 1
          lda #32
          sta PARAM1
          lda #23
          sta PARAM2
          lda #2
          sta PARAM3
          jsr DisplayText

          ;reset variables
          lda SPRITE_POS_X_EXTEND
          and #$fc
          sta SPRITE_POS_X_EXTEND
          
          jmp DisplayPuzzleBar
          


;------------------------------------------------------------
;check object collisions (enemy vs. player etc.)
;x 
;------------------------------------------------------------
!zone CheckCollisions
CheckCollisions
          lda SPRITE_ACTIVE
          bne .PlayerIsAlive
          rts
          
.PlayerIsAlive          
          ldx #2
          
.CollisionLoop          
          lda SPRITE_ACTIVE,x
          bne .CheckObject
          
.NextObject          
          inx
          cpx #8
          bne .CollisionLoop          
          rts
          
.CheckObject
          tay
          lda IS_TYPE_ENEMY,y
          beq .NextObject
          
          stx PARAM2
          jsr IsEnemyCollidingWithPlayer
          bne .PlayerCollidedWithEnemy
.NoCollisionEffect          
.CannotHurt
          ldx PARAM2
          jmp .NextObject
          
          
          

PlayerKilled          
.PlayerKilled
          lda #TYPE_EXPLOSION
          sta PARAM3
          ldx #0
          jsr CreateObjectInSlot
          ldx #1
          jsr CreateObjectInSlot
          
          lda #170
          sta PLAYER_DEAD_DELAY
          
          dec SCREEN_CHAR + 4 + 23 * 40
          dec PLAYER_LIVES
          
          bne .NotGameOver
          
!ifndef NO_MUSIC {          
          ;play game over music
          lda #2
          jsr MUSIC_PLAYER
}
          
.NotGameOver          
          
          lda #0
          sta SCREEN_CHAR + 6 + 23 * 40 + 0
          sta SCREEN_CHAR + 6 + 23 * 40 + 1
          sta BUTTON_RELEASED
          rts

.CollideWithSaveSpot
          lda PLAYER_CROUCHING
          beq .NoCollisionEffect
          
          lda SPRITE_FALLING
          bne .NoCollisionEffect
          
          ;save player pos
          lda LEVEL_NR
          sta PLAYER_START_LEVEL
          lda SPRITE_CHAR_POS_X
          sta PLAYER_START_X
          lda SPRITE_CHAR_POS_Y
          sta PLAYER_START_Y
          
          ;skip sound if already activated
          ldx PARAM2
          lda SPRITE_STATE,x
          beq ++
          
          ;skip if health already filled
          lda PLAYER_HEALTH
          cmp #6
          beq +
          
++          
          ;play sound
!ifndef NO_MUSIC {          
          ldx #SFX_ACTIVATE_SAVE_POINT
          jsr init_sfx
          ldx PARAM2
}
          
+          
          ;heal player
          lda #6
          sta PLAYER_HEALTH
          
          lda #PLAYER_SPRITE_COLOR
          sta VIC_SPRITE_COLOR
          sta VIC_SPRITE_COLOR + 1
          
          lda #77
          sta SCREEN_CHAR + 6 + 23 * 40
          sta SCREEN_CHAR + 7 + 23 * 40
          
          lda #1
          sta SPRITE_STATE,x
          
          jmp .NoCollisionEffect

.PlayerCollidedWithEnemy
          lda GAME_COMPLETE
          beq +
          cmp #3
          beq +
 
          lda #2
          sta GAME_COMPLETE
          rts
+          
          lda IS_TYPE_ENEMY,y
          cmp #3
          beq .CollideWithSaveSpot
          cmp #2
          beq .CollectObject
          
          lda PLAYER_INVINCIBLE
          beq +
          jmp .CannotHurt
          
+          
          cpy #TYPE_WHITE_SKULL
          bne .NoSkull

!ifndef NO_MUSIC {
          ldx #SFX_SKULL_SCREAM
          jsr init_sfx
}
          
          ;skull flashes
          ldx PARAM2
          lda #1
          sta SPRITE_STATE,x
          dec PLAYER_HEALTH
          jmp +
 
.NoSkull
          dec PLAYER_HEALTH
          
!ifndef NO_MUSIC {          
          ldx #SFX_HIT
          jsr init_sfx
}
          
+          
          ;adjust health display
          ldx #1
          
.AdjustPrevChar          
          lda SCREEN_CHAR + 6 + 23 * 40,x
          beq .PrevChar
          cmp #79
          beq .CharIsLast
          inc SCREEN_CHAR + 6 + 23 * 40,x
          jmp .AdjustDone
          
.CharIsLast
          lda #0
          sta SCREEN_CHAR + 6 + 23 * 40,x
          jmp .AdjustDone
          
.PrevChar
          cpx #0
          beq .AdjustDone
          dex
          jmp .AdjustPrevChar

.AdjustDone
          lda PLAYER_HEALTH
          bne +
          jmp .PlayerKilled
+
          
          ;lda #100
          ;sta PLAYER_HITBACK
          lda #40
          sta PLAYER_INVINCIBLE
          
          
          ;prepare hitback
          lda SPRITE_DIRECTION
          eor #1
          ;sta PLAYER_JUMPAUTOMOVE
          ;inc PLAYER_JUMPAUTOMOVE
          
          ;lda #1
          ;sta PLAYER_JUMP_POS
          
          lda PLAYER_SEARCHING
          beq .WasNotSearching
          
          ;player was searching
          lda #0
          sta PLAYER_SEARCHING
          
          jsr RemoveSearchBar
          
.WasNotSearching          
          rts
          
.CollectObject
          ;due to the key colors 1, 3, 5 we use the color shifted to the right as index
          ;001 > 000
          ;011 > 001
          ;101 > 010
          ldx PARAM2
          lda VIC_SPRITE_COLOR,x
          and #$0f
          lsr
          tay
          lda #1
          sta PLAYER_KEY,y
          jsr RemoveObject
          
          lda #5
          jsr IncreaseScore10
          
!ifndef NO_MUSIC {
          ldx #SFX_KEY
          jsr init_sfx
}
          
          rts


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


;------------------------------------------------------------
;check joystick (player control)
;------------------------------------------------------------
PlayerControl
          lda GAME_COMPLETE
          beq .NotComplete
          
          jmp AutoCrouch
          
.NotComplete          
          lda PLAYER_PUZZLE_MODE
          bne PuzzleMode
          jmp PlayerNotInPuzzleMode
          
          ;puzzle mode
!zone PuzzleMode
PuzzleMode
          
          ;flash current piece
          ldy #23
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) >> 8 )
          sta ZEROPAGE_POINTER_1 + 1
          
          lda #32
          clc
          adc PUZZLE_CURSOR
          sec 
          sbc PUZZLE_OFFSET
          tay
          
          inc SPRITE_ANIM_POS
          lda SPRITE_ANIM_POS
          and #$07
          tax
          
          lda PUZZLE_FLASH_COLORS,x
          sta (ZEROPAGE_POINTER_1),y
          
          
          ;puzzle mode control
          lda #$04
          bit JOYSTICK_PORT_II
          bne .NotLeftPressed

          lda LEFT_RELEASED
          beq .LeftNotReleased
          
          lda #0
          sta LEFT_RELEASED
          
          lda #2
          sta (ZEROPAGE_POINTER_1),y
          
          lda PUZZLE_CURSOR
          bne .CursorNotWrapL
          lda #12
          sta PUZZLE_CURSOR
          sta PUZZLE_OFFSET
          ;wrap offset and 
.CursorNotWrapL          
          dec PUZZLE_CURSOR
          
          ;adjust offset to cursor
          jmp .AdjustOffsetToCursor

.NotLeftPressed          
          lda #1
          sta LEFT_RELEASED

.LeftNotReleased          
          ;puzzle mode control
          lda #$08
          bit JOYSTICK_PORT_II
          bne .NotRightPressed
          
          lda RIGHT_RELEASED
          beq .RightNotReleased
          
          lda #0
          sta RIGHT_RELEASED

          lda #2
          sta (ZEROPAGE_POINTER_1),y
          
          lda PUZZLE_CURSOR
          cmp #11
          bne .CursorNotWrapR
          lda #0
          sta PUZZLE_CURSOR
          sta PUZZLE_OFFSET
          jmp .AdjustOffsetToCursor
          ;wrap offset and 
.CursorNotWrapR          
          inc PUZZLE_CURSOR
          
          ;adjust offset to cursor
.AdjustOffsetToCursor
          lda PUZZLE_CURSOR
          cmp #2
          bcc .OffsetTooSmall
          cmp #10
          bcs .OffsetTooBig
          sec
          sbc #2
          jmp .SetOffset
          
.OffsetTooBig
          lda #( 12 - 5 )
          jmp .SetOffset
          
.OffsetTooSmall
          lda #0
          
.SetOffset
          sta PUZZLE_OFFSET
          jsr DisplayPuzzleBar
          ldx #0
          rts
          
          
.NotRightPressed          
          lda #1
          sta RIGHT_RELEASED

.RightNotReleased
          lda #$02
          bit JOYSTICK_PORT_II
          bne .NotDownPressed

.LeavePuzzleMode
          ;leave puzzle mode
          lda #32
          clc
          adc PUZZLE_CURSOR
          sec 
          sbc PUZZLE_OFFSET
          tay
          
          lda #2
          sta (ZEROPAGE_POINTER_1),y

          lda #0
          sta PLAYER_PUZZLE_MODE
          sta SPRITE_ANIM_POS
          sta DOWN_RELEASED
          
          ldx #0
          rts

.NotDownPressed
          lda #$10
          bit JOYSTICK_PORT_II
          bne .NotFirePressed

          lda BUTTON_RELEASED
          beq .FireNotReleased
          
          ;exchange puzzle pieces
          ldy PLAYER_PUZZLE_MODE
          dey
          lda SCREEN_PUZZLE_PARTS,y
          sta PARAM7
          
          ;tile from 
          ldx PUZZLE_CURSOR
          lda PLAYER_PUZZLE_PARTS,x
          clc
          adc #( 114 - 96 )
          sta SCREEN_PUZZLE_PARTS,y
          sta PARAM6
          cmp #114
          beq .NotPutDownPiece
          dec PLAYER_COLLECTED_PUZZLE_PARTS
.NotPutDownPiece          
          
          lda PARAM7
          sec
          sbc #( 114 - 96 )
          sta PLAYER_PUZZLE_PARTS,x
          cmp #96
          beq .NotPickedUpPiece
          inc PLAYER_COLLECTED_PUZZLE_PARTS
.NotPickedUpPiece          
          
          ;update display
          lda SCREEN_LINE_OFFSET_TABLE_LO + 16
          sta ZEROPAGE_POINTER_2
          lda SCREEN_LINE_OFFSET_TABLE_HI + 16
          sta ZEROPAGE_POINTER_2 + 1
          
          lda PLAYER_PUZZLE_MODE
          ;9, 16
          clc
          asl
          adc #7
          tay
          
          lda PARAM6
          sta (ZEROPAGE_POINTER_2),y
          
          jsr DisplayPuzzleBar
          
          ;check if puzzle is set correctly
          ldy #0
          
.CheckNextPuzzlePiece          
          lda SCREEN_PUZZLE_PARTS,y
          cmp SOLUTION_PUZZLE_PARTS,y
          bne .PuzzleNotComplete
          
          iny
          cpy #12
          bne .CheckNextPuzzlePiece
          
          ;puzzle is complete!!!!
          lda #0
          sta BUTTON_RELEASED
          jsr StartEnding
          ldx #0
          jmp .LeavePuzzleMode

.PuzzleNotComplete          
          lda #0
          sta BUTTON_RELEASED
          ldx #0
          
          jmp .LeavePuzzleMode

.NotFirePressed
          lda #1
          sta BUTTON_RELEASED
.FireNotReleased          
          ldx #0
          rts

;------------------------------------------------------------
;check object collision with player (object 0)
;x = enemy index
;return a = 1 when colliding, a = 0 when not
;------------------------------------------------------------

!zone IsEnemyCollidingWithPlayer


.CalculateSimpleXPos
          ;Returns a with simple x pos (x halved + 128 if > 256)
          ;modifies y
          lda BIT_TABLE,x
          and SPRITE_POS_X_EXTEND
          beq .NoXBit
          
          lda SPRITE_POS_X,x
          lsr
          clc
          adc #128
          rts
          
.NoXBit          
          lda SPRITE_POS_X,x
          lsr
          rts

IsEnemyCollidingWithPlayer
          ;modifies X
          ;check y pos
          lda #OBJECT_HEIGHT
          sta PARAM8
          
          lda PLAYER_CROUCHING
          bne .NotCrouching
          
          lda #( OBJECT_HEIGHT - 8 )
          sta PARAM8
          
.NotCrouching          
          lda SPRITE_POS_Y,x
          sec
          sbc PARAM8         ;offset to bottom
          cmp SPRITE_POS_Y
          bcs .NotTouching
          clc
          adc #( OBJECT_HEIGHT + OBJECT_HEIGHT - 1 )
          cmp SPRITE_POS_Y
          bcc .NotTouching
          
          ;X = Index in enemy-table
          jsr .CalculateSimpleXPos
          sta PARAM1
          ldx #0
          jsr .CalculateSimpleXPos
          
          sec
          sbc #8    ;was 4
          ;position X-Anfang Player - 12 Pixel
          cmp PARAM1
          bcs .NotTouching
          adc #16   ;was 8
          cmp PARAM1
          bcc .NotTouching
          
          lda #1
          rts
          
.NotTouching
          lda #0
          rts



!zone PlayerNotInPuzzleMode
PlayerNotInPuzzleMode
          lda PLAYER_JUMP_DELAY
          beq +
          dec PLAYER_JUMP_DELAY
+          
          lda PLAYER_AUTO_CROUCH
          beq +
 
          dec PLAYER_AUTO_CROUCH
          bne +
          
          lda #0
          sta PLAYER_CROUCHING
          
+          
          lda #0
          sta PLAYER_CHANGED_ROOM
          
          ;delay anim
          lda PLAYER_JUMP_POS
          ora PLAYER_FALL_POS
          ora PLAYER_JUMPAUTOMOVE
          ora PLAYER_CROUCHING
          ora PLAYER_SEARCHING
          bne .NotIdling
          
          inc PLAYER_STAND_STILL_COUNT
          jmp .IdleDone

.NotIdling
          lda #0
          sta PLAYER_STAND_STILL_COUNT
          
.IdleDone          
          
          lda PLAYER_INVINCIBLE
          beq .NotInvincible
          
          dec PLAYER_INVINCIBLE
          
          lda PLAYER_INVINCIBLE
          and #$03
          tay
          lda PLAYER_INVINCIBLE_COLORS,y
          sta VIC_SPRITE_COLOR
          sta VIC_SPRITE_COLOR + 1
          jmp .NotLowOnHealth
          
.NotInvincible          
          ;flash if low on health
          lda PLAYER_HEALTH
          cmp #1
          bne .NotLowOnHealth
          
          inc PLAYER_FLASH_POS
          lda PLAYER_FLASH_POS
          and #$07
          sta PLAYER_FLASH_POS
          tay
          lda PLAYER_FLASH_COLORS,y
          sta VIC_SPRITE_COLOR
          sta VIC_SPRITE_COLOR + 1

.NotLowOnHealth
          lda PLAYER_JUMP_POS
          beq .NotJumping
          jmp .PlayerIsJumping

.NotJumping
          lda PLAYER_SEARCHING
          beq .PlayerWasNotSearching
          jmp .PlayerIsSearching
          
.PlayerChangedRoom
          ;early bail out
          ldx #0
          rts
          
.PlayerWasNotSearching          
          jsr PlayerMoveDown
          beq .NotFalling
          
          ;player fell one pixel
          lda PLAYER_CHANGED_ROOM
          bne .PlayerChangedRoom
          jmp .PlayerFell

.NotFalling
          lda PLAYER_SEARCHING
          beq .PlayerIsNotSearching
          jmp .PlayerIsSearching
          
.PlayerIsNotSearching
          lda PLAYER_FALL_POS
          beq +
          
          ;player landed
          lda PLAYER_JUMPAUTOMOVE
          bne ++
 
          ;only add jump delay if jumped straight
          lda #3
          sta PLAYER_JUMP_DELAY
          
++
          lda PLAYER_FALL_HEIGHT
          cmp #MAX_PLAYER_FALL_HEIGHT
          bne .DidNotFallTooFar
          
          ;player fell too far, auto-crouch
          lda #20
          sta PLAYER_AUTO_CROUCH
          jmp +
          
.DidNotFallTooFar
          lda #0
          sta PLAYER_FALL_POS
          sta PLAYER_FALL_HEIGHT
          sta SPRITE_FALLING
          sta PLAYER_JUMPAUTOMOVE
          jmp .SetPlayerStandAnim

+          
          lda #0
          sta PLAYER_FALL_POS
          sta PLAYER_FALL_HEIGHT
          sta SPRITE_FALLING
          sta PLAYER_JUMPAUTOMOVE
          
          lda PLAYER_AUTO_CROUCH
          bne .AutoCrouch
          
          ;down pressed?
          lda #$02
          bit JOYSTICK_PORT_II
          bne .NotDownPressed
          
          lda DOWN_RELEASED
          beq .DownNotReleased
          
AutoCrouch          
.AutoCrouch          
          lda #1
          sta PLAYER_CROUCHING
          
          lda #SPRITE_PLAYER_CROUCH_R_BOTTOM
          clc
          adc SPRITE_DIRECTION
          sta SPRITE_POINTER_BASE
          sta SPRITE_POINTER_BASE + 1
          dec SPRITE_POINTER_BASE + 1
          dec SPRITE_POINTER_BASE + 1
          
          rts
          
.NotDownPressed   
          lda #0
          sta PLAYER_CROUCHING
          lda #1
          sta DOWN_RELEASED

.DownNotReleased
          ;already jumping?
          lda PLAYER_JUMP_POS
          ora SPRITE_FALLING
          bne .NotFirePressed
          
          ;fire pressed (for jump)?
          lda #$10
          bit JOYSTICK_PORT_II
          bne .NotFirePressed
          
          lda BUTTON_RELEASED
          beq .JumpButtonNotReleased
          
          lda PLAYER_JUMP_DELAY
          bne .JumpButtonNotReleased
          
          ;start jump
          lda #0
          sta PLAYER_JUMPAUTOMOVE
          
          lda #$04
          bit JOYSTICK_PORT_II
          bne .NotLeft
          
          inc PLAYER_JUMPAUTOMOVE
          inc PLAYER_JUMPAUTOMOVE
          jmp .PlayerIsJumping
          
.NotLeft          
          lda #$08
          bit JOYSTICK_PORT_II
          bne .NotRight

          inc PLAYER_JUMPAUTOMOVE
.NotRight
          jmp .PlayerIsJumping

.PlayerFell
          lda #1
          sta SPRITE_FALLING
          
          ldy PLAYER_FALL_POS
          lda FALL_SPEED_TABLE,y
          beq .FallComplete
          sta PARAM5

.FallLoop          
          dec PARAM5
          beq .FallComplete
          
          jsr PlayerMoveDown
          
          lda PLAYER_FALL_HEIGHT
          cmp #MAX_PLAYER_FALL_HEIGHT
          beq +
          
          inc PLAYER_FALL_HEIGHT
+          

          ;did player die?
          lda SPRITE_ACTIVE
          cmp #TYPE_EXPLOSION
          beq .PlayerDied
          lda PLAYER_CHANGED_ROOM
          beq .FallLoop
          jmp .PlayerChangedRoom
          
.NotFirePressed          
          lda #1
          sta BUTTON_RELEASED
          jmp .JumpComplete

.PlayerDied
          rts

.FallComplete
          lda PLAYER_FALL_POS
          cmp #( FALL_TABLE_SIZE - 1 )
          beq .FallSpeedAtMax
          
          inc PLAYER_FALL_POS

.FallSpeedAtMax
.JumpStopped
.JumpComplete

.JumpButtonNotReleased
          lda PLAYER_JUMPAUTOMOVE
          and #$02
          bne .JumpingLeft
          
          lda SPRITE_FALLING
          ora PLAYER_JUMP_POS
          bne .NotLeftPressed

          lda #$04
          bit JOYSTICK_PORT_II
          bne .NotLeftPressed
          
.JumpingLeft          
          ;move left
          jsr PlayerMoveLeft
          jsr PlayerMoveLeft
          
          lda PLAYER_CHANGED_ROOM
          beq .NotChangedRoomL
          jmp .PlayerChangedRoom
          
.NotChangedRoomL          
          ;animate player
          lda SPRITE_FALLING
          bne .NoAnimLNeeded
          lda PLAYER_JUMP_POS
          bne .NoAnimLNeeded
          
          inc SPRITE_ANIM_DELAY
          lda SPRITE_ANIM_DELAY
          cmp #4
          bne .NoAnimLNeeded
          
          lda #0
          sta SPRITE_ANIM_DELAY
          
          inc SPRITE_ANIM_POS
          lda SPRITE_ANIM_POS
          cmp #6
          bne .NoWrapL
          lda #0
          sta SPRITE_ANIM_POS
.NoAnimLNeeded          
.NoWrapL
          jmp .PlayerMoving
          
.NotLeftPressed
          lda PLAYER_JUMPAUTOMOVE
          and #$01
          bne .JumpingRight

          lda SPRITE_FALLING
          ora PLAYER_JUMP_POS
          bne .NotRightPressed

          lda #$08
          bit JOYSTICK_PORT_II
          bne .NotRightPressed
          
.JumpingRight          
          ;move right
          jsr PlayerMoveRight
          jsr PlayerMoveRight

          lda PLAYER_CHANGED_ROOM
          beq .NotChangedRoomR
          jmp .PlayerChangedRoom

.NotChangedRoomR
          ;animate player
          lda SPRITE_FALLING
          bne .NoAnimRNeeded
          lda PLAYER_JUMP_POS
          bne .NoAnimRNeeded
          
          inc SPRITE_ANIM_DELAY
          lda SPRITE_ANIM_DELAY
          cmp #4
          bne .NoAnimRNeeded
          
          lda #0
          sta SPRITE_ANIM_DELAY
          
          inc SPRITE_ANIM_POS
          lda SPRITE_ANIM_POS
          cmp #6
          bne .NoWrap
          lda #0
          sta SPRITE_ANIM_POS
.NoAnimRNeeded            
.NoWrap          
          jmp .PlayerMoving
          
.NotRightPressed
.PlayerIsSearching
          ;handle searching
          lda #$01
          bit JOYSTICK_PORT_II
          beq .UpPushed
          jmp .NotUpPushed
          
.UpPushed          
          lda PLAYER_JUMPAUTOMOVE
          ora PLAYER_JUMP_POS
          ora SPRITE_FALLING
          beq .CanSearch
          jmp .CannotSearch
          
.CanSearch
          lda LEVEL_NR
          cmp #50
          bne .CommonSearch
          
          ;inside soul chamber
          lda SPRITE_CHAR_POS_Y
          sec
          sbc #3
          tay
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X
          lda (ZEROPAGE_POINTER_1),y
          cmp #114
          bcc .NoPuzzleSlot
          cmp #127
          bcs .NoPuzzleSlot
          
          ;enter puzzle mode
          ;keep in level puzzle piece index in PLAYER_PUZZLE_MODE
          tya
          sec
          sbc #7
          lsr
          sta PLAYER_PUZZLE_MODE
          
          lda #0
          sta SPRITE_ANIM_POS
          lda #0
          sta BUTTON_RELEASED

          lda #SPRITE_PLAYER_SEARCH_1_TOP
          sta SPRITE_POINTER_BASE + 1
          lda #SPRITE_PLAYER_SEARCH_1_BOTTOM
          sta SPRITE_POINTER_BASE
          
          jsr DisplayPuzzleBar
          ldx #0

.NoPuzzleSlot
          rts 
          
.CommonSearch          
          ;search objects
          lda PLAYER_SEARCHING
          bne .HadObjectAlready
          
          ;determine search object
          ldy #0
          
.NextItem          
          lda ITEM_ACTIVE,y
          bne .ItemIsActive
.ToNextItem          
          iny
          cpy #ITEM_COUNT
          bne .NextItem
          jmp .NoItemFound
          
.ItemIsActive
          ;item type
          tax
          
          ;to the left
          lda ITEM_POS_X,y
          sec
          sbc #1
          cmp SPRITE_CHAR_POS_X
          bcs .ToNextItem
          
          ;to the right
          clc
          adc GAMEELEMENT_WIDTH_TABLE,x
          cmp SPRITE_CHAR_POS_X
          bcc .ToNextItem

          ;to the top
          lda ITEM_POS_Y,y
          sec
          sbc #1
          cmp SPRITE_CHAR_POS_Y
          bcs .ToNextItem
          ;to the bottom
          clc
          adc GAMEELEMENT_HEIGHT_TABLE,x
          adc #1  ;allow search of hanging objects
          cmp SPRITE_CHAR_POS_Y
          bcc .ToNextItem
          
          ;in front of item
          iny
          sty PLAYER_SEARCHING
          
          ;display search bar
          jsr DisplaySearchBar
          
          lda #0
          sta PLAYER_SEARCH_POS

.HadObjectAlready
          ;slow search progress
          inc PLAYER_SEARCH_POS
          lda PLAYER_SEARCH_POS
          cmp #4
          beq .NextSearchStep
          
          ;no search update
          ldx #0
          rts          
          
.NextSearchStep
          lda #0
          sta PLAYER_SEARCH_POS
          
          ldy PLAYER_SEARCHING
          dey
          
          ;Y = item index
          ;X = item type (element)
          
          lda ITEM_ID_HI,y
          beq .LoID
          
          ;high id
          ldx ITEM_ID_LO,y
          lda SEARCH_ITEM_STATE + 256,x
          and #$0F
          sec
          sbc #1
          sta PARAM1
          
          lda SEARCH_ITEM_STATE + 256,x
          and #$f0
          ora PARAM1
          sta SEARCH_ITEM_STATE + 256,x
          sta PARAM3
          and #$0f
          beq .SearchObjectDone
          jmp .SearchStepDone
          
.LoID          
          ldx ITEM_ID_LO,y
          
          lda SEARCH_ITEM_STATE,x
          and #$0F
          sec
          sbc #1
          sta PARAM1
          
          lda SEARCH_ITEM_STATE,x
          and #$f0
          ora PARAM1
          sta SEARCH_ITEM_STATE,x
          sta PARAM3
          and #$0f
          beq .SearchObjectDone
          jmp .SearchStepDone
          
.SearchObjectDone   
          ;search of object complete
          ;PARAM3 = object type
          ;y = item index
          sty PARAM7
          lda ITEM_POS_X,y
          sta PARAM1
          lda ITEM_POS_Y,y
          sta PARAM2
          jsr RemoveItemImage
          
          lda #0
          sta PLAYER_SEARCHING
          
          jsr RemoveSearchBar
          
          ;display found box
          lda VIC_SPRITE_ENABLE
          sta PARAM6
          
          ;only disable overlapping sprites
          ldx #0
          
.CheckNextSprite          
          lda SPRITE_ACTIVE,x
          bne .CheckIfOverlapping
          
.GoNextSprite          
          inx
          cpx #8
          bne .CheckNextSprite
          jmp .AllSpritesChecked
          
.CheckIfOverlapping          
          lda SPRITE_CHAR_POS_Y,x
          cmp #6
          bcc .Disable
          jmp .GoNextSprite

.Disable
          lda BIT_TABLE,x
          eor #$ff
          and VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE
          
          cpx #1
          beq .DisableLowerHalfOfPlayerToo
          jmp .GoNextSprite
          
.DisableLowerHalfOfPlayerToo
          lda BIT_TABLE
          eor #$ff
          and VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE
          jmp .GoNextSprite
          
.AllSpritesChecked          
          ;get reward
          lda PARAM3
          sta PARAM4
          
          ;store old colors (2 * 40 + 27 bytes) * 2
          lda #( ( SCREEN_COLOR + 7 + 1 * 40 ) & 0xff )
          sta ZEROPAGE_POINTER_1
          lda #( ( SCREEN_COLOR + 7 + 1 * 40 ) >> 8 )
          sta ZEROPAGE_POINTER_1 + 1
          ;store to $0700
          lda #0
          sta ZEROPAGE_POINTER_2
          lda #$07
          sta ZEROPAGE_POINTER_2 + 1
          
          ldy #0
.StoreColorLoop
          lda (ZEROPAGE_POINTER_1),y
          sta (ZEROPAGE_POINTER_2),y
          
          iny
          cpy #( 2 * 40 + 27 )
          bne .StoreColorLoop

          ;store char
          lda #( ( SCREEN_CHAR + 7 + 1 * 40 ) & 0xff )
          sta ZEROPAGE_POINTER_1
          lda #( ( SCREEN_CHAR + 7 + 1 * 40 ) >> 8 )
          sta ZEROPAGE_POINTER_1 + 1
          ;store to $0700 + 107
          lda #<( $0700 + 107 )
          sta ZEROPAGE_POINTER_2
          lda #>( $0700 + 107 )
          sta ZEROPAGE_POINTER_2 + 1
          
          ldy #0
.StoreCharLoop
          lda (ZEROPAGE_POINTER_1),y
          sta (ZEROPAGE_POINTER_2),y
          
          iny
          cpy #( 2 * 40 + 27 )
          bne .StoreCharLoop

          
          lda #<TEXT_ITEM_BUBBLE
          sta ZEROPAGE_POINTER_1
          lda #>TEXT_ITEM_BUBBLE
          sta ZEROPAGE_POINTER_1 + 1
          lda #7
          sta PARAM1
          lda #1
          sta PARAM2
          lda #1
          sta PARAM3
          jsr DisplayText

          lda PARAM4
          lsr
          lsr
          lsr
          lsr
          tay
          lda TEXT_ITEM_LO,y
          sta ZEROPAGE_POINTER_1
          lda TEXT_ITEM_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          lda #8
          sta PARAM1
          lda #2
          sta PARAM2
          jsr DisplayText
          
ITEM_TYPE_HEALTH        = $10
ITEM_TYPE_GOLD          = $20
ITEM_TYPE_AURA          = $30
ITEM_TYPE_PUZZLE_PIECE  = $40
ITEM_TYPE_RED_MAGIC     = $50
ITEM_TYPE_BLUE_MAGIC    = $60
ITEM_TYPE_GREEN_MAGIC   = $70
ITEM_TYPE_LIFE          = $80

          lda PARAM4
          lsr
          lsr
          lsr
          lsr
          tay
          
          cpy #0
          beq +

          ;only sound for found item
!ifndef NO_MUSIC {
          ;play sfx
          cpy #4
          bne ++
          
          ldx #SFX_COLLECT_PUZZLE
          jmp +++
          
++          
          ldx #SFX_COLLECT_ITEM
+++          
          jsr init_sfx
}

+          
          lda ITEM_EFFECT_TABLE_LO,y
          sta .ItemEffectJump + 1
          lda ITEM_EFFECT_TABLE_HI,y
          sta .ItemEffectJump + 2
          
.ItemEffectJump
          jmp $a000
          

ITEM_EFFECT_TABLE_LO
          !byte <.SearchCommonEnd
          !byte <ItemEffectHealth
          !byte <ItemEffectGold
          !byte <ItemEffectAura
          !byte <ItemEffectPuzzlePiece
          !byte <ItemEffectRedMagic
          !byte <ItemEffectBlueMagic
          !byte <ItemEffectGreenMagic
          !byte <ItemEffectLife
          !byte <ItemEffectRuby
ITEM_EFFECT_TABLE_HI
          !byte >.SearchCommonEnd
          !byte >ItemEffectHealth
          !byte >ItemEffectGold
          !byte >ItemEffectAura
          !byte >ItemEffectPuzzlePiece
          !byte >ItemEffectRedMagic
          !byte >ItemEffectBlueMagic
          !byte >ItemEffectGreenMagic
          !byte >ItemEffectLife
          !byte >ItemEffectRuby
          
ItemEffectGold          
          lda #50
          jsr IncreaseScore
          jmp .SearchEnd
          
ItemEffectRuby          
          lda #150
          jsr IncreaseScore
          jmp .SearchEnd
          
ItemEffectRedMagic
          lda #13
          sta MAGIC_POS
          
          ldx #2
          
.KillNextEnemy          
          lda SPRITE_ACTIVE,x
          beq .DoNotExplodeEnemy

          cmp #TYPE_KEY
          beq .DoNotExplodeEnemy
          cmp #TYPE_SAVE_SPOT
          beq .DoNotExplodeEnemy

          lda #TYPE_EXPLOSION
          sta PARAM3
          jsr CreateObjectInSlot
          
          lda #1
          sta VIC_SPRITE_COLOR,x
          
.DoNotExplodeEnemy          
          inx
          cpx #8
          bne .KillNextEnemy
          
          jmp .SearchCommonEnd
          
ItemEffectBlueMagic
          lda #1
          sta MAGIC_POS

          lda #2
          sta ENEMY_SPELL
          lda #0
          sta ENEMY_SPELL_COUNT
          sta FREEZE_DELAY_COUNT

          ;kill projectiles
          ldx #2
          
.KillNextProjectile          
          lda SPRITE_ACTIVE,x
          beq .IsNotProjectile
          
          cmp #TYPE_FIRE_DOWN
          beq .KillProjectile
          cmp #TYPE_FIRE_LEFT
          beq .KillProjectile
          cmp #TYPE_FIRE_RIGHT
          beq .KillProjectile
          jmp .IsNotProjectile

.KillProjectile
          lda #TYPE_EXPLOSION
          sta PARAM3
          jsr CreateObjectInSlot
          
.IsNotProjectile          
          inx
          cpx #8
          bne .KillNextProjectile
          
          jmp .SearchCommonEnd
          
ItemEffectGreenMagic
          lda #7
          sta MAGIC_POS

          lda #1
          sta ENEMY_SPELL
          jmp .SearchCommonEnd

ItemEffectLife
          inc PLAYER_LIVES
          inc SCREEN_CHAR + 4 + 23 * 40
          jmp .SearchCommonEnd

ItemEffectHealth
          lda #6
          sta PLAYER_HEALTH
          
          lda #PLAYER_SPRITE_COLOR
          sta VIC_SPRITE_COLOR
          sta VIC_SPRITE_COLOR + 1
          
          lda #77
          sta SCREEN_CHAR + 6 + 23 * 40
          sta SCREEN_CHAR + 7 + 23 * 40
          
          jmp .SearchCommonEnd
          
ItemEffectAura
          lda #254
          sta PLAYER_INVINCIBLE
          jmp .SearchCommonEnd
          
ItemEffectPuzzlePiece
          ;PARAM7 = item index
          
          ;find the proper game puzzle piece
          ldy PARAM7
          ldx #0
          
.CheckItemForPuzzlePiece          
          lda GAME_PUZZLE_PART_ITEM_LO,x
          cmp ITEM_ID_LO,y
          bne .NotThePuzzlePiece
          
          lda GAME_PUZZLE_PART_ITEM_HI,x
          cmp ITEM_ID_HI,y
          bne .NotThePuzzlePiece
          
          ;this puzzle piece has been gotten
          ;x = game puzzle piece index
          jsr AddPuzzlePiece
          jmp .SearchCommonEnd
          
.NotThePuzzlePiece   
          inx
          cpx #12
          bne .CheckItemForPuzzlePiece
          
          ;this should never happen
          
.SearchCommonEnd          
          lda #1
          jsr IncreaseScore
          
.SearchEnd

          ;wait until up is released
.WaitForUpReleased          
          jsr WaitFrame
          
          lda #$01
          bit JOYSTICK_PORT_II
          bne .WaitNotUpPushed

          jmp .WaitForUpReleased

.WaitNotUpPushed

          ;TODO - das bügelt über den Load-Code!! bei 0x0400 (exomizer soll bei 0500, wieviel Platz, etc.)
          ;restore old colors
          lda #( ( SCREEN_COLOR + 7 + 1 * 40 ) & 0xff )
          sta ZEROPAGE_POINTER_1
          lda #( ( SCREEN_COLOR + 7 + 1 * 40 ) >> 8 )
          sta ZEROPAGE_POINTER_1 + 1
          ;restore from $0700
          lda #0
          sta ZEROPAGE_POINTER_2
          lda #$07
          sta ZEROPAGE_POINTER_2 + 1
          
          ldy #0
.RestoreColorLoop
          lda (ZEROPAGE_POINTER_2),y
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          cpy #( 2 * 40 + 27 )
          bne .RestoreColorLoop

          ;restore old chars
          lda #( ( SCREEN_CHAR + 7 + 1 * 40 ) & 0xff )
          sta ZEROPAGE_POINTER_1
          lda #( ( SCREEN_CHAR + 7 + 1 * 40 ) >> 8 )
          sta ZEROPAGE_POINTER_1 + 1
          
          ;restore from $0700 + 107
          lda #<( $0700 + 107 )
          sta ZEROPAGE_POINTER_2
          lda #>( $0700 + 107 )
          sta ZEROPAGE_POINTER_2 + 1          
          
          ldy #0
.RestoreCharLoop
          lda (ZEROPAGE_POINTER_2),y
          sta (ZEROPAGE_POINTER_1),y
          
          iny
          cpy #( 2 * 40 + 27 )
          bne .RestoreCharLoop

          lda PARAM6
          sta VIC_SPRITE_ENABLE

          ldx #0
          rts
          
.SearchStepDone          
          ;A holds search progress
          ;search animation
          asl
          sta PARAM3
          lsr
          lsr
          and #$03
          tay
          lda SEARCH_ANIM_TABLE,y
          clc
          adc #SPRITE_PLAYER_SEARCH_1_TOP
          sta SPRITE_POINTER_BASE + 1
          clc
          adc #4
          sta SPRITE_POINTER_BASE
          
          ;a holds the search step pos
          lda PARAM3
          lsr
          lsr
          lsr
          sta PARAM3
          
          lda #3
          sec
          sbc PARAM3
          tay

          lda SEARCH_BAR_LOCATION
          sta ZEROPAGE_POINTER_1
          lda SEARCH_BAR_LOCATION + 1
          clc
          adc #>( SCREEN_COLOR - SCREEN_CHAR )
          sta ZEROPAGE_POINTER_1 + 1
          
          lda #5
          sta (ZEROPAGE_POINTER_1),y
          
          ldx #0
          rts
          
.NoItemFound    
          ldx #0
.NotUpPushed          

          lda PLAYER_SEARCHING
          beq .WasNotSearching
          
          jsr RemoveSearchBar
          
.WasNotSearching          
          lda #0
          sta PLAYER_SEARCHING
          
.CannotSearch
          lda PLAYER_JUMP_POS
          bne .PlayerMoving
          lda SPRITE_FALLING
          bne .PlayerMoving
          
          ;idle anim
          lda PLAYER_STAND_STILL_COUNT
          cmp #220
          bcc .NotWaitedLongEnough

.SetPlayerStandAnim
          lda #SPRITE_PLAYER_STAND_R_BOTTOM
          clc
          adc SPRITE_DIRECTION
          sta SPRITE_POINTER_BASE

          lda SPRITE_DIRECTION
          beq .LookingRight

          lda #SPRITE_PLAYER_HEAD_TURN_L
          sta SPRITE_POINTER_BASE + 1
          rts

.LookingRight
          lda #SPRITE_PLAYER_HEAD_TURN_R
          sta SPRITE_POINTER_BASE + 1
          rts
          
.NotWaitedLongEnough
          
          ;set stand anim
          lda #SPRITE_PLAYER_STAND_R_BOTTOM
          clc
          adc SPRITE_DIRECTION
          sta SPRITE_POINTER_BASE
          sec
          sbc #2
          sta SPRITE_POINTER_BASE + 1
          rts
          
.PlayerMoving
          lda SPRITE_FALLING
          bne .AnimFalling

          lda PLAYER_JUMP_POS
          bne .AnimJumping
          
          ;run anim
          lda SPRITE_ANIM_POS
          clc
          asl
          adc SPRITE_DIRECTION
          adc #SPRITE_PLAYER_WALK_R_1_BOTTOM
          sta SPRITE_POINTER_BASE
          sec
          sbc #12
          sta SPRITE_POINTER_BASE + 1
          rts
          
.AnimFalling
          lda #SPRITE_PLAYER_WALK_R_3_BOTTOM
          clc
          adc SPRITE_DIRECTION
          sta SPRITE_POINTER_BASE
          sec
          sbc #12
          sta SPRITE_POINTER_BASE + 1
          rts
          
.AnimJumping          
          lda #SPRITE_PLAYER_WALK_R_3_BOTTOM
          clc
          adc SPRITE_DIRECTION
          sta SPRITE_POINTER_BASE
          sec
          sbc #12
          sta SPRITE_POINTER_BASE + 1
          rts
          
.PlayerIsJumping
          inc PLAYER_JUMP_POS
          lda PLAYER_JUMP_POS
          cmp #JUMP_TABLE_SIZE
          bne .JumpOn
          
          lda #0
          sta PLAYER_JUMP_POS
          lda #1
          sta SPRITE_FALLING
          jmp .JumpComplete
          
.JumpOn                    
          ldy PLAYER_JUMP_POS
          lda PLAYER_JUMP_TABLE,y
          bne .KeepJumping
          jmp .JumpComplete
          
.KeepJumping          
          sta PARAM5
          
.JumpContinue          
          jsr PlayerMoveUp
          beq .JumpBlocked
          
          lda PLAYER_CHANGED_ROOM
          beq .NotChangedRoomU
          jmp .PlayerChangedRoom
          
.NotChangedRoomU          
          dec PARAM5
          bne .JumpContinue
          jmp .JumpComplete
          
          
.JumpBlocked
          lda #0
          sta PLAYER_JUMP_POS
          jmp .JumpStopped


NoBehaviour
          rts


;------------------------------------------------------------
;adds puzzle piece to player inventory
;X = game puzzle piece index
;------------------------------------------------------------

!zone AddPuzzlePiece
AddPuzzlePiece
          ldy #0
          
.CheckNextSlot          
          lda PLAYER_PUZZLE_PARTS,y
          cmp #96
          beq .EmptySlot
          
          iny
          cpy #12
          bne .CheckNextSlot
          
          ;this should never happen
          rts
          
.EmptySlot          
          lda GAME_PUZZLE_PARTS,x          
          sec
          sbc #( 114 - 96 )
          sta PLAYER_PUZZLE_PARTS,y
          cmp #96
          beq .NoPiece
          inc PLAYER_COLLECTED_PUZZLE_PARTS
.NoPiece          
          
          lda #0
          sta GAME_PUZZLE_PARTS,x
          
          ;update display
          jmp DisplayPuzzleBar
          
;------------------------------------------------------------
;display puzzle bar
;------------------------------------------------------------

!zone DisplayPuzzleBar          
DisplayPuzzleBar          
          ldy #23
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_4 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) >> 8 )
          sta ZEROPAGE_POINTER_3 + 1
          
          ldx PUZZLE_OFFSET
          ldy #32
          
.DisplayPuzzlePiece          
          lda PLAYER_PUZZLE_PARTS,x
          sta (ZEROPAGE_POINTER_4),y
          lda #2
          sta (ZEROPAGE_POINTER_3),y
          
          inx
          cpx #12
          bne .NoXOverflow
          ldx #0
.NoXOverflow          
          iny
          cpy #32 + 5
          bne .DisplayPuzzlePiece
          rts
          
          
;------------------------------------------------------------
;run left/right
;------------------------------------------------------------
!zone BehaviourWalker
BehaviourWalker
          lda ENEMY_SPELL
          cmp #2
          beq .NoAnimUpdate

          jsr HandleBehaviour
          
          lda ENEMY_SPELL
          cmp #2
          beq .NoAnimUpdate
          
          lda BEHAVIOUR_QUICKER
          beq .SingleAnimStep
          jsr .AnimWalker
.SingleAnimStep          
          jmp .AnimWalker

.AnimWalker
          lda SPRITE_STATE,x
          bne .Pausing
          ;animate walker
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #6
          bne .NoAnimWrap
          lda #0
          sta SPRITE_ANIM_POS,x
.NoAnimWrap          
          clc
          asl
          adc #SPRITE_WALKER_WALK_R_1
          adc SPRITE_DIRECTION,x
          sta SPRITE_POINTER_BASE,x
.Pausing
.NoAnimUpdate
          rts

;------------------------------------------------------------
;fly left/right
;------------------------------------------------------------
!zone BehaviourBird
BehaviourBird
          lda ENEMY_SPELL
          cmp #2
          beq .NoAnimUpdate

          jsr HandleBehaviour
          
          lda BEHAVIOUR_QUICKER
          beq .SingleAnimStep
          jsr .AnimStep
.SingleAnimStep          
          jmp .AnimStep

.AnimStep
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
          tay
          lda SPRITE_DIRECTION,x
          beq .FacingLeft
          lda #3
.FacingLeft          
          clc
          adc #SPRITE_BIRD_FLY_R_1
          adc PING_PONG_ANIM_TABLE,y
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          rts
          


;------------------------------------------------------------
;ghost
;------------------------------------------------------------
!zone BehaviourGhost
BehaviourGhost
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          

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
          sta SPRITE_ANIM_POS,x
          
          tay
          lda #SPRITE_GHOST_1
          clc
          adc PING_PONG_ANIM_TABLE,y
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          jmp HandleBehaviour


;------------------------------------------------------------
;ghost bottom
;------------------------------------------------------------
!zone BehaviourGhostBottom
BehaviourGhostBottom
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          

          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #8
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          sta SPRITE_ANIM_POS,x
          
          tay
          lda #SPRITE_GHOST_B_1
          clc
          adc PING_PONG_ANIM_TABLE,y
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          jmp BehaviourFollowD2


;------------------------------------------------------------
;skull
;------------------------------------------------------------
!zone BehaviourSkull
BehaviourSkull
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          lda SPRITE_STATE,x
          beq .MoveRandom
          
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #2
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$01
          sta SPRITE_ANIM_POS,x
          clc
          adc #SPRITE_WHITE_SKULL_1
          sta SPRITE_POINTER_BASE,x
          
.NoAnimUpdate
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          cmp #40
          bne .StillFlashing
          
          lda #0
          sta SPRITE_STATE,x
          
          lda #SPRITE_WHITE_SKULL_1
          sta SPRITE_POINTER_BASE,x
          
.StillFlashing          
          rts
          
.MoveRandom          


          jmp HandleBehaviour


;------------------------------------------------------------
;big head
;------------------------------------------------------------
!zone BehaviourBigHead
BehaviourBigHead
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          jmp HandleBehaviour


;------------------------------------------------------------
;follow X Pos
;Y = original sprite index
;x = current sprite index
;PARAM1 = offset in X
;------------------------------------------------------------
!zone ObjectFollowXPos
ObjectFollowXPos
          sty PARAM6
          lda SPRITE_CHAR_POS_X,y
          clc
          adc PARAM1
          sta PARAM1
          jsr CalcSpriteXPosFromCharPos
          
          ldy PARAM6
          lda SPRITE_CHAR_POS_X_DELTA,y
          sta PARAM1
          
.XAdjustment          
          beq .XAdjustmentDone
          jsr MoveSpriteRight
          dec PARAM1
          jmp .XAdjustment
          
.XAdjustmentDone         
          rts


;------------------------------------------------------------
;follow Y Pos
;Y = original sprite index
;x = current sprite index
;PARAM2 = char offset in y
;------------------------------------------------------------
!zone ObjectFollowYPos
ObjectFollowYPos
          sty PARAM6
          lda SPRITE_CHAR_POS_Y,y
          clc
          adc PARAM2
          sta PARAM2
          jsr CalcSpriteYPosFromCharPos
          
          ldy PARAM6
          lda SPRITE_CHAR_POS_Y_DELTA,y
          sta PARAM1
          
.YAdjustment          
          beq .YAdjustmentDone
          jsr MoveSpriteDown
          dec PARAM1
          jmp .YAdjustment
          
.YAdjustmentDone         
          rts

;------------------------------------------------------------
;follow at the right
;------------------------------------------------------------
!zone BehaviourFollowR
BehaviourFollowR
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          txa
          tay
          dey
          sty PARAM6
          
          lda #3
          sta PARAM1
          jsr ObjectFollowXPos

          lda #0
          sta PARAM2
          ldy PARAM6
          jmp ObjectFollowYPos

;------------------------------------------------------------
;follow below (index - 2)
;------------------------------------------------------------
!zone BehaviourFollowD
BehaviourFollowD
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          txa
          tay
          dey
FollowD                    
          dey

          sty PARAM6
          
          lda #0
          sta PARAM1
          jsr ObjectFollowXPos

          lda #3
          sta PARAM2
          ldy PARAM6
          jsr ObjectFollowYPos
          
          jsr ObjectMoveUp
          jsr ObjectMoveUp
          jmp ObjectMoveUp

;------------------------------------------------------------
;follow below (index -1)
;------------------------------------------------------------
!zone BehaviourFollowD2
BehaviourFollowD2
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          txa
          tay
          jmp FollowD

;------------------------------------------------------------
;follow below right
;------------------------------------------------------------
!zone BehaviourFollowDR
BehaviourFollowDR
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          txa
          tay
          dey
          dey
          dey
          sty PARAM6
          
          lda #3
          sta PARAM1
          jsr ObjectFollowXPos

          lda #3
          sta PARAM2
          ldy PARAM6
          jsr ObjectFollowYPos
          
          jsr ObjectMoveUp
          jsr ObjectMoveUp
          jmp ObjectMoveUp

;------------------------------------------------------------
;fly left/right
;------------------------------------------------------------
!zone BehaviourSnake
BehaviourSnake
          lda ENEMY_SPELL
          cmp #2
          beq .NoAnimUpdate
          
          jsr HandleBehaviour
          
          lda BEHAVIOUR_QUICKER
          beq .SingleAnimStep
          jsr .AnimStep
.SingleAnimStep          
          jmp .AnimStep

.AnimStep
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
          sta SPRITE_ANIM_POS,x
          
          tay
          lda SPRITE_DIRECTION,x
          beq .FacingLeft
          lda #3
.FacingLeft          
          clc
          adc #SPRITE_SNAKE_R_1
          adc PING_PONG_ANIM_TABLE,y
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          rts
          


;------------------------------------------------------------
;fly left/right
;------------------------------------------------------------
!zone BehaviourMobileTrap
BehaviourMobileTrap
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          jsr HandleBehaviour
          
          lda BEHAVIOUR_QUICKER
          beq .SingleAnimStep
          jsr .AnimStep
.SingleAnimStep          
          jmp .AnimStep

.AnimStep
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #3
          bne .NoOverflow
          
          lda #0
          sta SPRITE_ANIM_POS,x
.NoOverflow          
          clc
          adc #SPRITE_SPIKE_TRAP_1
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          rts
          


;------------------------------------------------------------
;animate
;------------------------------------------------------------
!zone BehaviourSoulContainerTop
BehaviourSoulContainerTop
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #8
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03
          clc
          adc #SPRITE_SOUL_CONTAINER_T_1
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          rts



;------------------------------------------------------------
;animate
;------------------------------------------------------------
!zone BehaviourSoulContainerBottom
BehaviourSoulContainerBottom
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #8
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$03 
          clc
          adc #SPRITE_SOUL_CONTAINER_B_1
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          rts


;------------------------------------------------------------
;up/down
;------------------------------------------------------------
!zone BehaviourPurple
BehaviourPurple
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          jmp HandleBehaviour


;------------------------------------------------------------
;fly left/right
;------------------------------------------------------------
!zone BehaviourFire
BehaviourFire
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          jmp HandleBehaviour

;------------------------------------------------------------
;fire head
;------------------------------------------------------------
!zone BehaviourFireHead
BehaviourFireHead
          lda ENEMY_SPELL
          cmp #2
          bne .CanAct
          rts

.CanAct
          lda SPRITE_STATE,x
          beq .Pause

          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x

          lda SPRITE_STATE,x
          cmp #1
          beq .OpenHead
          cmp #2
          beq .FirePause
          
          ;close head
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #3
          bne .HeadNotFullyClosed
          
          lda #0
          sta SPRITE_STATE,x
          sta SPRITE_MOVE_POS,x
          sta SPRITE_ANIM_POS,x
          
.HeadNotFullyClosed          
          dec SPRITE_POINTER_BASE,x
          rts
          
.PauseNotDoneYet          
.NoAnimUpdate
          rts
          
.OpenHead
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #3
          bne .HeadNotFullyOpen
          
          inc SPRITE_STATE,x
          
          lda #0
          sta SPRITE_MOVE_POS,x
          
.HeadNotFullyOpen          
          inc SPRITE_POINTER_BASE,x
          rts

.FirePause
          inc SPRITE_FIRE_DELAY,x
          lda SPRITE_FIRE_DELAY,x
          cmp #5
          beq .DoFire
          cmp #20
          bne .PauseNotDoneYet
          
          lda #0
          sta SPRITE_FIRE_DELAY,x
          sta SPRITE_ANIM_POS,x
          inc SPRITE_STATE,x
          rts
          
.Pause
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          cmp #200
          bne .PauseNotDoneYet
          
          inc SPRITE_STATE,x
          rts
          
.DoFire
          txa
          pha
          
!ifndef NO_MUSIC {          
          stx PARAM8
          ldx #SFX_FIRE_BALL
          jsr init_sfx
          ldx PARAM8
}
          
          lda SPRITE_CHAR_POS_X,x
          sta PARAM1
          dec PARAM1
          lda SPRITE_CHAR_POS_Y,x
          sta PARAM2
          
          lda SPRITE_ACTIVE,x
          clc
          adc #2
          sta PARAM3
          jsr AddObject
          lda #1
          sta VIC_SPRITE_COLOR,x

          lda PARAM3
          cmp #TYPE_FIRE_RIGHT
          beq .FireToRight
          
          ;fire to left
          lda #1
          sta SPRITE_DIRECTION,x
          lda #11
          sta SPRITE_BEHAVIOUR,x
          jmp .FireDone
          
.FireToRight          
          lda #12
          sta SPRITE_BEHAVIOUR,x
          
.FireDone          
          pla
          tax
          rts
          

;------------------------------------------------------------
;fly left/right
;------------------------------------------------------------
!zone BehaviourGnat
BehaviourGnat
          lda ENEMY_SPELL
          cmp #2
          beq .NoAnimUpdate

          inc SPRITE_FIRE_DELAY,x
          lda SPRITE_FIRE_DELAY,x
          cmp #127
          bne .NoFire
          
          ;fire
          lda #0
          sta SPRITE_FIRE_DELAY,x
          txa
          pha
          
          lda SPRITE_CHAR_POS_X,x
          sta PARAM1
          lda SPRITE_CHAR_POS_Y,x
          sta PARAM2
          
          lda #TYPE_FIRE_DOWN
          sta PARAM3
          jsr AddObject
          lda #13
          sta SPRITE_BEHAVIOUR,x
          
          pla
          tax

.NoFire
          jsr HandleBehaviour
          
          lda BEHAVIOUR_QUICKER
          beq .SingleAnimStep
          jsr .AnimStep
.SingleAnimStep          
          jmp .AnimStep

.AnimStep
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          and #$01
          sta SPRITE_ANIM_POS,x
          
          clc
          adc #SPRITE_GNAT_1
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          rts
          


;------------------------------------------------------------
;explosion
;------------------------------------------------------------
!zone BehaviourExplosion
BehaviourExplosion
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #8
          beq .ExplosionDone
          
          tay
          clc
          adc #SPRITE_EXPLOSION_1
          sta SPRITE_POINTER_BASE,x
          
          lda EXPLOSION_COLOR_TABLE,y
          sta VIC_SPRITE_COLOR,x
          
          lda SPRITE_ANIM_POS,x
          cmp #1
          bne .NoAnimUpdate

          ;play explosion sfx
          lda PLAYER_LIVES
          beq +
!ifndef NO_MUSIC {
          ldx #SFX_EXPLOSION
          jsr init_sfx
}
+
.NoAnimUpdate
          rts
          
.ExplosionDone
          jmp RemoveObject


;------------------------------------------------------------
;fly left/right
;------------------------------------------------------------
!zone BehaviourSpider
BehaviourSpider
          lda ENEMY_SPELL
          cmp #2
          bne .Update
          rts
.Update          
          jsr HandleBehaviour
          
          lda BEHAVIOUR_QUICKER
          beq .SingleAnimStep
          jsr .AnimStep
.SingleAnimStep          
          jmp .AnimStep

.AnimStep
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #6
          bne .NoOverflow
          
          lda #0
          sta SPRITE_ANIM_POS,x
          
.NoOverflow          
          lda SPRITE_DIRECTION,x
          beq .LookingRight
          
          lda #6
.LookingRight          
          clc
          adc #SPRITE_SPIDER_R_1
          adc SPRITE_ANIM_POS,x
          sta SPRITE_POINTER_BASE,x

.NoAnimUpdate
          rts
          


;------------------------------------------------------------
;save spot
;------------------------------------------------------------
!zone BehaviourSaveSpot
BehaviourSaveSpot
          ;animate
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #4
          bne .NoAnimUpdate
          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          lda SPRITE_ANIM_POS,x
          cmp #5
          bne .NoOverflow
          
          lda #0
          sta SPRITE_ANIM_POS,x
          
.NoOverflow          
          clc
          adc #SPRITE_SAVE_SPOT_1
          sta SPRITE_POINTER_BASE,x
          
          ;color update
          lda SPRITE_STATE,x
          beq .NotActive
          
          ldy SPRITE_ANIM_POS,x
          lda SAVE_SPOT_COLOR_FADE,y
          sta VIC_SPRITE_COLOR,x

.NotActive
.NoAnimUpdate
          rts
          


;------------------------------------------------------------
;generic object behaviour
;------------------------------------------------------------
!zone HandleBehaviour

          ;0  = none
          ;1  = h normal
          ;2  = h quicker
          ;3  = h pause
          ;4  = h quicker + pause
          ;5  = v normal
          ;6  = v quicker
          ;7  = v pause
          ;8  = v quicker + pause
          ;9  = random
          ;10 = homing
          ;11 = left and explode
          ;12 = right and explode
          ;13 = down and explode

BEHAVIOUR_TABLE_LO
          !byte <BehaviourNormalH
          !byte <BehaviourQuickerH
          !byte <BehaviourPauseH
          !byte <BehaviourQuickerPauseH
          !byte <BehaviourNormalV
          !byte <BehaviourQuickerV
          !byte <BehaviourPauseV
          !byte <BehaviourQuickerPauseV
          !byte <BehaviourRandom
          !byte <BehaviourHoming
          !byte <BehaviourLeftExplode
          !byte <BehaviourRightExplode
          !byte <BehaviourDownExplode
BEHAVIOUR_TABLE_HI
          !byte >BehaviourNormalH
          !byte >BehaviourQuickerH
          !byte >BehaviourPauseH
          !byte >BehaviourQuickerPauseH
          !byte >BehaviourNormalV
          !byte >BehaviourQuickerV
          !byte >BehaviourPauseV
          !byte >BehaviourQuickerPauseV
          !byte >BehaviourRandom
          !byte >BehaviourHoming
          !byte >BehaviourLeftExplode
          !byte >BehaviourRightExplode
          !byte >BehaviourDownExplode

;------------------------------------------------------------
;generic object behaviour
;sets BEHAVIOUR_QUICKER to 0 on normal movement
;sets BEHAVIOUR_QUICKER to 1 on quicker movement (seeing player)
;------------------------------------------------------------

HandleBehaviour
          lda #0
          sta BEHAVIOUR_QUICKER
          
          lda ENEMY_SPELL
          beq .NormalBehaviour
          cmp #2
          beq .EnemiesFrozen
          
          ;enemies slowed
          lda ENEMY_SPELL_COUNT
          beq .EnemiesFrozen
          
.NormalBehaviour          
          ldy SPRITE_BEHAVIOUR,x
          bne .DoSomething
          
.EnemiesFrozen          
          rts
          
.DoSomething          
          dey
          lda BEHAVIOUR_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda BEHAVIOUR_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          jmp (ZEROPAGE_POINTER_1)
          
          
!zone BehaviourLeftExplode
BehaviourLeftExplode
          lda #5
          sta PARAM5
          
.NextMove
          jsr ObjectMoveLeftBlocking
          beq ObjectExplode
          
          dec PARAM5
          bne .NextMove
          rts
          
          
ObjectExplode
          jsr RemoveObject
          
          lda SPRITE_CHAR_POS_X,x
          sta PARAM1
          lda SPRITE_CHAR_POS_Y,x
          sta PARAM2
          lda #TYPE_EXPLOSION
          sta PARAM3
          
          txa
          pha
          
          jsr AddObject
          lda #1
          sta VIC_SPRITE_COLOR,x
          
          pla
          tax
          rts
          
          
!zone BehaviourRightExplode
BehaviourRightExplode
          lda #5
          sta PARAM5
          
.NextMove
          jsr ObjectMoveRightBlocking
          beq ObjectExplode
          
          dec PARAM5
          bne .NextMove
          rts
          
!zone BehaviourDownExplode
BehaviourDownExplode
          lda #5
          sta PARAM5
          
.NextMove
          jsr ObjectMoveDownBlocking
          beq ObjectExplode
          
          lda SPRITE_CHAR_POS_Y,x
          cmp #20
          beq ObjectExplode
          
          dec PARAM5
          bne .NextMove
          rts
          
          
!zone HandlePause
HandlePause
          lda SPRITE_STATE,x
          beq .NoPause
          
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          cmp #15
          bne .PauseNotComplete
          dec SPRITE_STATE,x
          lda #0
.NoPause
          rts
          
.PauseNotComplete          
          lda #1
          rts
          

          


!zone BehaviourQuickerPauseH
BehaviourQuickerPauseH
          jsr HandlePause
          beq .NoPause
          rts
.NoPause

!zone BehaviourQuickerH
BehaviourQuickerH
          jsr IsLookingTowardsPlayer
          beq BehaviourNormalH
         
          ;go faster if seeing player
          inc BEHAVIOUR_QUICKER
          
          lda SPRITE_SPEED,x
          clc 
          adc #2
          sta PARAM5
          jmp StartHMove

!zone BehaviourPauseH
BehaviourPauseH
          jsr HandlePause
          beq .NoPause
          rts
.NoPause
          jmp HMove

!zone BehaviourQuickerPauseV
BehaviourQuickerPauseV
          jsr HandlePause
          beq .NoPause
          rts
.NoPause

!zone BehaviourPauseV
BehaviourPauseV
          jsr HandlePause
          beq .NoPause
          rts
.NoPause
          jmp VMove

!zone BehaviourQuickerV
BehaviourQuickerV
          ;jsr IsLookingTowardsPlayer
          lda #0
          beq BehaviourNormalV
         
          ;go faster if seeing player
          inc BEHAVIOUR_QUICKER
          
          lda SPRITE_SPEED,x
          clc 
          adc #2
          sta PARAM5
          jmp StartVMove


BehaviourNormalH      
          
!zone HMove          
HMove          
          ;2 steps
          lda SPRITE_SPEED,x
          sta PARAM5
          jmp StartHMove
          
.MoveStep
          dec PARAM5

StartHMove
          beq .MoveDone
          
          lda SPRITE_DIRECTION,x
          beq .MoveRight
          
          jsr ObjectMoveLeft
          jmp .CheckBorders
          
.MoveRight
          jsr ObjectMoveRight
          
.CheckBorders
          lda SPRITE_CHAR_POS_X_DELTA,x
          bne .MoveStep
          
          lda SPRITE_DIRECTION,x
          beq .FacingRight
          
          lda SPRITE_CHAR_POS_X,x
          cmp SPRITE_BORDER_1,x
          beq .ToggleDirection
          
          jmp .MoveStep
          
.FacingRight
          lda SPRITE_CHAR_POS_X,x
          cmp SPRITE_BORDER_2,x
          beq .ToggleDirection
          
          jmp .MoveStep

.ToggleDirection
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
          
          lda SPRITE_BEHAVIOUR,x
          cmp #3
          beq .StartPause
          cmp #4
          beq .StartPause
          cmp #7
          beq .StartPause
          cmp #8
          beq .StartPause
          
          jmp .MoveStep
          
.MoveDone
          rts
          
.StartPause          
          lda #1
          sta SPRITE_STATE,x
          lda #0
          sta SPRITE_MOVE_POS,x
          rts


BehaviourNormalV
!zone VMove          
VMove          
          ;2 steps
          lda SPRITE_SPEED,x
          sta PARAM5
          jmp StartVMove
          
.MoveStep
          dec PARAM5

StartVMove
          beq .MoveDone
          
          lda SPRITE_DIRECTION,x
          beq .MoveDown
          
          jsr ObjectMoveUp
          jmp .CheckBorders
          
.MoveDown
          jsr ObjectMoveDown
          
.CheckBorders
          lda SPRITE_CHAR_POS_Y_DELTA,x
          bne .MoveStep
          
          lda SPRITE_DIRECTION,x
          beq .FacingDown
          
          lda SPRITE_CHAR_POS_Y,x
          cmp SPRITE_BORDER_1,x
          beq .ToggleDirection
          
          jmp .MoveStep
          
.FacingDown
          lda SPRITE_CHAR_POS_Y,x
          cmp SPRITE_BORDER_2,x
          beq .ToggleDirection
          
          jmp .MoveStep

.ToggleDirection
          ;stone slab
          lda SPRITE_ACTIVE,x
          cmp #TYPE_PURPLE_BLOCK
          bne +

          stx PARAM8
          ldx #SFX_STONE_SLAB_THUMP
          jsr init_sfx
          ldx PARAM8

+
          lda SPRITE_DIRECTION,x
          eor #1
          sta SPRITE_DIRECTION,x
          
          lda SPRITE_BEHAVIOUR,x
          cmp #7
          beq .StartPause
          cmp #8
          beq .StartPause
          
          jmp .MoveStep
          
.MoveDone
          rts
          
.StartPause          
          lda #1
          sta SPRITE_STATE,x
          lda #0
          sta SPRITE_MOVE_POS,x
          rts


!zone BehaviourHoming
HOMING_MOVE_SPEED = 1  
HOMING_UPDATE_DELAY
          !byte 20
          
BehaviourHoming

          lda SPRITE_ACTIVE + 1
          cmp #TYPE_PLAYER
          beq .FoundPlayer
          ;no player to hunt
          rts

.FoundPlayer
          inc SPRITE_HOMING_DELAY,x
          lda SPRITE_HOMING_DELAY,x
          cmp HOMING_UPDATE_DELAY
          beq .DoCheckMove
          
          cmp #8
          bne .DoNothing
          jmp .DoGhostMove
          
.DoNothing
          rts

.DoCheckMove
          lda #0
          sta SPRITE_HOMING_DELAY,x
          
          ;player index in y
          ldy #1
          lda SPRITE_CHAR_POS_X,y
          cmp SPRITE_CHAR_POS_X,x
          bcs .MoveRight
          
          ;move left
          lda SPRITE_DIRECTION,x
          bne .AlreadyLookingLeft
          lda SPRITE_MOVE_POS,x
          beq .TurnLNow
          dec SPRITE_MOVE_POS,x
          bne .CheckYNow
          
.TurnLNow          
          ;turning now
          lda #1
          sta SPRITE_DIRECTION,x
          jmp .CheckYNow
          
.AlreadyLookingLeft
          lda SPRITE_MOVE_POS,x
          cmp #HOMING_MOVE_SPEED
          beq .CheckYNow
          inc SPRITE_MOVE_POS,x
          jmp .CheckYNow
          
.MoveRight   
          lda SPRITE_DIRECTION,x
          beq .AlreadyLookingRight
          
          lda SPRITE_MOVE_POS,x
          beq .TurnRNow
          dec SPRITE_MOVE_POS,x
          bne .CheckYNow
          
          ;turning now
.TurnRNow          
          lda #0
          sta SPRITE_DIRECTION,x
          jmp .CheckYNow
          
.AlreadyLookingRight          
          lda SPRITE_MOVE_POS,x
          cmp #HOMING_MOVE_SPEED
          beq .CheckYNow
          inc SPRITE_MOVE_POS,x
          jmp .CheckYNow
          
.CheckYNow
          ;player index in y
          ldy #1
          lda SPRITE_CHAR_POS_Y,y
          cmp SPRITE_CHAR_POS_Y,x
          bcs .MoveDown
          
          ;move left
          lda SPRITE_DIRECTION_Y,x
          bne .AlreadyLookingUp
          lda SPRITE_MOVE_POS_Y,x
          beq .TurnUNow
          dec SPRITE_MOVE_POS_Y,x
          bne .DoGhostMove
          
.TurnUNow          
          ;turning now
          lda #1
          sta SPRITE_DIRECTION_Y,x
          jmp .DoGhostMove
          
.AlreadyLookingUp
          lda SPRITE_MOVE_POS_Y,x
          cmp #HOMING_MOVE_SPEED
          beq .DoGhostMove
          inc SPRITE_MOVE_POS_Y,x
          jmp .DoGhostMove
          
.MoveDown
          lda SPRITE_DIRECTION_Y,x
          beq .AlreadyLookingDown
          
          lda SPRITE_MOVE_POS_Y,x
          beq .TurnDNow
          dec SPRITE_MOVE_POS_Y,x
          bne .DoGhostMove
          
          ;turning now
.TurnDNow          
          lda #0
          sta SPRITE_DIRECTION_Y,x
          jmp .DoGhostMove
          
.AlreadyLookingDown
          lda SPRITE_MOVE_POS_Y,x
          cmp #HOMING_MOVE_SPEED
          beq .DoGhostMove
          inc SPRITE_MOVE_POS_Y,x
          jmp .DoGhostMove

.DoGhostMove
          ;move X times
          ldy SPRITE_MOVE_POS,x
          sty PARAM4
          beq .DoY
          
          lda SPRITE_DIRECTION,x
          beq .DoRight
.MoveLoopL
          jsr ObjectMoveLeft
          dec PARAM4
          bne .MoveLoopL
          jmp .DoY
          
.DoRight
.MoveLoopR
          jsr ObjectMoveRight
          dec PARAM4
          bne .MoveLoopR
          
.DoY          
          ;move X times
          ldy SPRITE_MOVE_POS_Y,x
          sty PARAM4
          beq .MoveDone
          
          lda SPRITE_DIRECTION_Y,x
          beq .DoDown
.MoveLoopU
          jsr ObjectMoveUp
          dec PARAM4
          bne .MoveLoopU
          jmp .MoveDone
          
.DoDown
.MoveLoopD
          ;jsr ObjectMoveDownBlockingWithoutPlatform
          jsr ObjectMoveDown
          dec PARAM4
          bne .MoveLoopD
         
.MoveDone         
          rts


!zone BehaviourRandom
BehaviourRandom
          lda SPRITE_DIRECTION,x
          beq .NeedNewRandomDir
          
          dec SPRITE_MOVE_POS,x
          beq .NeedNewRandomDir
          
          lda SPRITE_DIRECTION,x
          cmp #1
          beq .MoveR
          cmp #2
          beq .MoveDR
          cmp #3
          beq .MoveD
          cmp #4
          beq .MoveDL
          cmp #5
          beq .MoveL
          cmp #6
          beq .MoveUL
          cmp #8
          beq .MoveUR

          jsr ObjectMoveUpBlocking
          
.MoveUR
          jmp ObjectMoveRightBlocking
          
          
.MoveDR
          jsr ObjectMoveDownBlockingWithoutPlatform
.MoveR
          jmp ObjectMoveRightBlocking
          
.MoveDL
          jsr ObjectMoveLeftBlocking
.MoveD
          jmp ObjectMoveDownBlockingWithoutPlatform

.MoveUL
          jsr ObjectMoveUpBlocking
.MoveL
          jmp ObjectMoveLeftBlocking

.NeedNewRandomDir
          jsr GenerateRandomNumber
          and #$07
          sta SPRITE_DIRECTION,x
          inc SPRITE_DIRECTION,x
          
          jsr GenerateRandomNumber
          and #$0f
          clc
          adc #2
          sta SPRITE_MOVE_POS,x
          rts

;------------------------------------------------------------
;display search bar below player
;Y = item index
;X = display element index
;needs to keep X,Y intact!
;------------------------------------------------------------
!zone DisplaySearchBar
DisplaySearchBar
          tya
          pha
          txa
          pha

          ;determine search value
          dey
          lda ITEM_ID_HI,y
          beq .LoID
          
          ;high id
          ldx ITEM_ID_LO,y
          lda SEARCH_ITEM_STATE + 256,x
          and #$0f
          jmp .FoundItemState
          
.LoID          
          ldx ITEM_ID_LO,y
          lda SEARCH_ITEM_STATE,x
          and #$0f
.FoundItemState     
          sta PARAM2
          
          ldy #0
          lda #7
-
          sta SEARCH_BAR_COLOR,y
          iny
          cpy #4
          bne -
          
          ldx #5
          
          lda PARAM2
          cmp #12
          bcs .FirstChar
          cmp #8
          bcs .SecondChar
          cmp #4
          bcs .ThirdChar
          stx SEARCH_BAR_COLOR + 3
.ThirdChar          
          stx SEARCH_BAR_COLOR + 2
.SecondChar          
          stx SEARCH_BAR_COLOR + 1
.FirstChar          
          stx SEARCH_BAR_COLOR + 0
          
          lda SPRITE_CHAR_POS_X
          sec
          sbc #1
          sta PARAM1

          lda SPRITE_CHAR_POS_Y
          clc
          adc #1
          tay
          
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          clc
          adc PARAM1
          sta ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_2
          sta SEARCH_BAR_LOCATION
          
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          adc #0
          sta ZEROPAGE_POINTER_1 + 1
          sta SEARCH_BAR_LOCATION + 1
          clc
          adc #>( SCREEN_COLOR - SCREEN_CHAR )
          sta ZEROPAGE_POINTER_2 + 1
          
          ldy #0
          
.NextChar          
          lda (ZEROPAGE_POINTER_1),y
          sta SEARCH_BACK_CHAR,y
          lda SEARCH_BAR_CHAR,y
          sta (ZEROPAGE_POINTER_1),y
          
          lda (ZEROPAGE_POINTER_2),y
          sta SEARCH_BACK_COLOR,y
          lda SEARCH_BAR_COLOR,y
          sta (ZEROPAGE_POINTER_2),y
          
          iny
          cpy #4
          bne .NextChar
          
          pla
          tax
          pla
          tay
          rts


;------------------------------------------------------------
;checks if sprite is looking towards player
;X = sprite index
;return 1 if looking towards player
;------------------------------------------------------------
!zone IsLookingTowardsPlayer
IsLookingTowardsPlayer
          ;TODO - only if height is close?
          
          lda SPRITE_DIRECTION,x
          beq .LookingRight
          
          lda SPRITE_CHAR_POS_X,x
          cmp SPRITE_CHAR_POS_X
          bcs .LookingAtPlayer
          jmp .NotLookingAtPlayer
          
.LookingRight
          lda SPRITE_CHAR_POS_X,x
          cmp SPRITE_CHAR_POS_X
          bcc .LookingAtPlayer
          
.NotLookingAtPlayer
          lda #0
          rts
          
.LookingAtPlayer
          lda #1
          rts


;------------------------------------------------------------
;removes search bar
;------------------------------------------------------------
!zone RemoveSearchBar
RemoveSearchBar

          lda SEARCH_BAR_LOCATION
          sta ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_2
          
          lda SEARCH_BAR_LOCATION + 1
          sta ZEROPAGE_POINTER_1 + 1
          clc
          adc #>( SCREEN_COLOR - SCREEN_CHAR )
          sta ZEROPAGE_POINTER_2 + 1

          ldy #0
          
.RemoveNextChar          
          lda SEARCH_BACK_CHAR,y
          sta (ZEROPAGE_POINTER_1),y
          lda SEARCH_BACK_COLOR,y
          sta (ZEROPAGE_POINTER_2),y
          
          iny
          cpy #4
          bne .RemoveNextChar
          rts

;------------------------------------------------------------
;removes item image
;Y = item index
;------------------------------------------------------------
!zone RemoveItemImage
RemoveItemImage
          ldx ITEM_ACTIVE,y
          lda #0
          sta ITEM_ACTIVE,y
          
          lda GAMEELEMENT_WIDTH_TABLE,x
          sta PARAM4
          lda GAMEELEMENT_HEIGHT_TABLE,x
          sta PARAM5
          sta PARAM6
          
          ldy PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          clc
          adc PARAM1
          sta .StoreCode + 1
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          adc #0
          sta .StoreCode + 2
          
.NextRow          
          ldx #0
          lda #0
          
          ;display a row
.Row
          
.StoreCode
          sta $8000,x
          
          inx
          cpx PARAM4
          bne .Row
          
          ;eine zeile nach unten
          dec PARAM6
          beq .ElementDone

          ;should be faster?
          lda .StoreCode + 1
          clc
          adc #40
          sta .StoreCode + 1
          lda .StoreCode + 2
          adc #0
          sta .StoreCode + 2

          jmp .NextRow
          
.ElementDone       
          rts
          

;------------------------------------------------------------
;PlayerMoveLeft
;------------------------------------------------------------
!zone PlayerMoveLeft
PlayerMoveLeft  
          lda #1
          sta SPRITE_DIRECTION
          
          lda SPRITE_CHAR_POS_X
          bne .NoScreenChange
          
          lda SPRITE_CHAR_POS_X_DELTA
          bne .NoScreenChange
          
          ;screen to the left
          lda #1
          sta PLAYER_CHANGED_ROOM

          lda #39
          sta SPRITE_CHAR_POS_X
          sta SPRITE_CHAR_POS_X + 1
          
          ;X = charX * 8 + ( 24 - SPRITE_CENTER_OFFSET_X=8 )
          lda #( ( 39 * 8 + ( 24 - 8 ) ) & $ff )
          sta VIC_SPRITE_X_POS
          sta SPRITE_POS_X
          sta VIC_SPRITE_X_POS + 2
          sta SPRITE_POS_X + 1
          
          lda VIC_SPRITE_X_EXTEND
          ora #$03
          sta VIC_SPRITE_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          
          ldy LEVEL_NR
          lda LEVEL_EXIT_W,y
          sta LEVEL_NR
          jsr BuildScreen
          
.NoScreenChange          
          ldx #0
          jsr ObjectMoveLeftBlocking
          beq .NotMoved
          
          ldx #1
          jsr ObjectMoveLeft
          
.NotMoved
          rts

          
;------------------------------------------------------------
;move object left if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveLeftBlocking
ObjectMoveLeftBlocking
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveLeft
          
.CanMoveLeft
          dec SPRITE_CHAR_POS_X_DELTA,x
          
          jsr MoveSpriteLeft
          lda #1
          rts
          
.CheckCanMoveLeft
          lda SPRITE_CHAR_POS_X,x
          beq .BlockedLeft
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .NoThirdCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          lda SPRITE_CHAR_POS_X,x
          clc
          adc #39
          tay
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedLeft
          
.NoThirdCharCheckNeeded          
          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          dey
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedLeft
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedLeft
          
          
          lda #8
          sta SPRITE_CHAR_POS_X_DELTA,x
          dec SPRITE_CHAR_POS_X,x
          jmp .CanMoveLeft
          
.BlockedLeft
          lda #0
          rts

          
;------------------------------------------------------------
;move object left
;x = object index
;------------------------------------------------------------
!zone ObjectMoveLeft
ObjectMoveLeft
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          bne .NoCharStep
          
          lda #8
          sta SPRITE_CHAR_POS_X_DELTA,x
          dec SPRITE_CHAR_POS_X,x
          
.NoCharStep
          dec SPRITE_CHAR_POS_X_DELTA,x
          
          jmp MoveSpriteLeft
          
          
;------------------------------------------------------------
;PlayerMoveRight
;------------------------------------------------------------
!zone PlayerMoveRight
PlayerMoveRight
          lda #0
          sta SPRITE_DIRECTION

          lda SPRITE_CHAR_POS_X
          cmp #39
          bne .NoScreenChange
          
          lda SPRITE_CHAR_POS_X_DELTA
          bne .NoScreenChange
          
          ;change screen to the right
          lda #1
          sta PLAYER_CHANGED_ROOM
          
          lda #0
          sta SPRITE_CHAR_POS_X
          sta SPRITE_CHAR_POS_X + 1
          
          ;X = charX * 8 + ( 24 - SPRITE_CENTER_OFFSET_X=8 )
          lda #( 0 * 8 + ( 24 - 8 ) )
          sta VIC_SPRITE_X_POS
          sta SPRITE_POS_X
          sta VIC_SPRITE_X_POS + 2
          sta SPRITE_POS_X + 1
          
          lda VIC_SPRITE_X_EXTEND
          and #$fc
          sta VIC_SPRITE_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          
          ldy LEVEL_NR
          lda LEVEL_EXIT_E,y
          sta LEVEL_NR
          jsr BuildScreen
          
.NoScreenChange          
          ldx #0
          jsr ObjectMoveRightBlocking
          beq .NotMoved
          
          ldx #1
          jsr ObjectMoveRight
          
.NotMoved
          rts
          
                    
;------------------------------------------------------------
;move object right if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveRightBlocking
ObjectMoveRightBlocking
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .CheckCanMoveRight
          
.CanMoveRight
          inc SPRITE_CHAR_POS_X_DELTA,x
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          inc SPRITE_CHAR_POS_X,x
          
.NoCharStep          
          jsr MoveSpriteRight
          lda #1
          rts
          
.CheckCanMoveRight
          lda SPRITE_CHAR_POS_X,x
          cmp #39
          beq .BlockedRight
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .NoThirdCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedRight
          
.NoThirdCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y,x
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedRight
          
          tya
          clc
          adc #40
          tay
          lda (ZEROPAGE_POINTER_1),y
          jsr IsCharBlocking
          bne .BlockedRight
          
          jmp .CanMoveRight
          
.BlockedRight 
          lda #0
          rts
          

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
;PlayerMoveUp
;------------------------------------------------------------
!zone PlayerMoveUp
PlayerMoveUp
          lda SPRITE_CHAR_POS_Y
          cmp #2
          bcs .NoScreenChange
          
          lda SPRITE_CHAR_POS_Y_DELTA
          bne .NoScreenChange
          
          ;change screen up
          lda #1
          sta PLAYER_CHANGED_ROOM
          
          lda #19
          sta SPRITE_CHAR_POS_Y
          lda #17
          sta SPRITE_CHAR_POS_Y + 1
          
          ;Y = charY * 8 + ( 50 - 11 )
          lda #( 19 * 8 + ( 50 - 11 ) - 2 )
          sta VIC_SPRITE_Y_POS
          sta SPRITE_POS_Y
          sec
          sbc #21
          sta VIC_SPRITE_Y_POS + 2
          sta SPRITE_POS_Y + 1
          
          ldy LEVEL_NR
          lda LEVEL_EXIT_N,y
          sta LEVEL_NR
          jsr BuildScreen
          
.NoScreenChange          
          ldx #0
          jsr ObjectMoveUpBlocking
          beq .WasBlocked
          ldx #1
          jsr ObjectMoveUp
          lda #1
.WasBlocked
          rts
          
;------------------------------------------------------------
;move object up if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveUpBlocking
ObjectMoveUpBlocking
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .CheckCanMoveUp
          
.CanMoveUp
          dec SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #$ff
          bne .NoCharStep
          
          dec SPRITE_CHAR_POS_Y,x
          lda #7
          sta SPRITE_CHAR_POS_Y_DELTA,x
          
.NoCharStep          
          jsr MoveSpriteUp
          lda #1
          rts
          
.CheckCanMoveUp
          lda SPRITE_CHAR_POS_Y,x
          beq .BlockedUp

          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .NoSecondCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          dey
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedUp
          
.NoSecondCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y,x
          dey
          dey
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedUp
          
          jmp .CanMoveUp
          
.BlockedUp
          lda #0
          rts
          
          
;------------------------------------------------------------
;move object up
;x = object index
;------------------------------------------------------------
!zone ObjectMoveUp
ObjectMoveUp
          
          dec SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #$ff
          bne .NoCharStep
          
          dec SPRITE_CHAR_POS_Y,x
          lda #7
          sta SPRITE_CHAR_POS_Y_DELTA,x
          
.NoCharStep          
          jmp MoveSpriteUp
          
          
;------------------------------------------------------------
;PlayerMoveDown
;------------------------------------------------------------
!zone PlayerMoveDown
PlayerMoveDown
          lda SPRITE_CHAR_POS_Y
          cmp #21
          bcc .NoScreenChange
          
          lda SPRITE_CHAR_POS_Y_DELTA
          bne .NoScreenChange
          
          ;change screen down
          lda #1
          sta PLAYER_CHANGED_ROOM
          
          lda #3
          sta SPRITE_CHAR_POS_Y
          lda #1
          sta SPRITE_CHAR_POS_Y + 1
          
          ;Y = charY * 8 + ( 50 - 11 )
          lda #( 3 * 8 + ( 50 - 11 ) - 2 )
          sta VIC_SPRITE_Y_POS
          sta SPRITE_POS_Y
          sec
          sbc #21
          sta VIC_SPRITE_Y_POS + 2
          sta SPRITE_POS_Y + 1
          
          ldy LEVEL_NR
          lda LEVEL_EXIT_S,y
          sta LEVEL_NR
          jsr BuildScreen
          
          
          
.NoScreenChange          

          ldx #0
          jsr ObjectMoveDownBlocking
          
          beq .WasBlocked
          ldx #1
          jsr ObjectMoveDown
          lda #1
.WasBlocked     
          rts


;------------------------------------------------------------
;move object down if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveDownBlockingWithoutPlatform
ObjectMoveDownBlockingWithoutPlatform
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .CheckCanMoveDown
          
.CanMoveDown
          inc SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_Y_DELTA,x
          inc SPRITE_CHAR_POS_Y,x
          
.NoCharStep          
          jsr MoveSpriteDown
          lda #1
          rts
          
.CheckCanMoveDown
          lda SPRITE_CHAR_POS_Y,x
          cmp #20
          beq .BlockedDown
          
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .NoSecondCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedDown
          
.NoSecondCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlocking
          bne .BlockedDown
          
          jmp .CanMoveDown
          
.BlockedDown
          lda #0
          rts
          



;------------------------------------------------------------
;move object down if not blocked
;x = object index
;------------------------------------------------------------
!zone ObjectMoveDownBlocking
ObjectMoveDownBlocking
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          beq .CheckCanMoveDown
          
.CanMoveDown
          inc SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_Y_DELTA,x
          inc SPRITE_CHAR_POS_Y,x
          
.NoCharStep          
          jsr MoveSpriteDown
          lda #1
          rts
          
.CheckCanMoveDown
          lda SPRITE_CHAR_POS_X_DELTA,x
          beq .NoSecondCharCheckNeeded
          
          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1

          ldy SPRITE_CHAR_POS_X,x
          iny
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlockingFall
          bne .BlockedDown
          
.NoSecondCharCheckNeeded          

          ldy SPRITE_CHAR_POS_Y,x
          iny
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy SPRITE_CHAR_POS_X,x
          
          lda (ZEROPAGE_POINTER_1),y
          
          jsr IsCharBlockingFall
          bne .BlockedDown
          
          jmp .CanMoveDown
          
.BlockedDown
          cmp #2
          beq .Deadly
          
.NormalBlocked          
          lda #0
          rts
          
          
.Deadly     
          cpx #0
          bne .NormalBlocked
          
          jmp PlayerKilled          

;------------------------------------------------------------
;move object down
;x = object index
;------------------------------------------------------------
!zone ObjectMoveDown
ObjectMoveDown
          
          inc SPRITE_CHAR_POS_Y_DELTA,x
          
          lda SPRITE_CHAR_POS_Y_DELTA,x
          cmp #8
          bne .NoCharStep
          
          lda #0
          sta SPRITE_CHAR_POS_Y_DELTA,x
          inc SPRITE_CHAR_POS_Y,x
          
.NoCharStep          
          jmp MoveSpriteDown


;------------------------------------------------------------
;Enemy Behaviour
;------------------------------------------------------------
!zone ObjectControl
ObjectControl
          lda ENEMY_SPELL
          cmp #1
          bne .NotSlowingEnemies
          ;enemies slowed
          lda ENEMY_SPELL_COUNT
          eor #1
          sta ENEMY_SPELL_COUNT
          
.NotSlowingEnemies          
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
          cpx #8
          bne .ObjectLoop
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
          and SPRITE_POS_X_EXTEND
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
;IsCharBlocking
;checks if a char is blocking
;A = character
;returns 1 for blocking, 0 for not blocking
;------------------------------------------------------------
!zone IsCharBlocking
IsCharBlocking
          sty PARAM6
          
          ldy CURRENT_CHARSET
          bne .OutsideTomb
          
          cmp #230
          bcs .Blocking
          
          ldy PARAM6
          lda #0
          rts
          
.Blocking
          ldy PARAM6
          lda #1
          rts
          
.OutsideTomb
          cmp #210
          beq .Deadly
          cmp #137
          bcs .Blocking
          
          ldy PARAM6
          lda #0
          rts
          
          
.Deadly
          ldy PARAM6
          lda #2
          rts


;------------------------------------------------------------
;IsCharBlockingFall
;checks if a char is blocking a fall (downwards)
;A = character
;returns 1 for blocking, 0 for not blocking
;------------------------------------------------------------
!zone IsCharBlockingFall
IsCharBlockingFall
          sty PARAM6
          
          ldy CURRENT_CHARSET
          bne .OutsideTomb

          cmp #224
          bcs .Blocking
          
          ldy PARAM6
          lda #0
          rts

.Blocking          
          ldy PARAM6
          lda #1
          rts


.OutsideTomb
          cmp #210
          beq .Deadly
          cmp #130
          bcs .Blocking
          
          ldy PARAM6
          lda #0
          rts
          
          
.Deadly
          ldy PARAM6
          lda #2
          rts


;------------------------------------------------------------
;CalcSpriteXPosFromCharPos
;calculates the real sprite x coordinates from screen char x pos
;and sets them directly
;PARAM1 = char_pos_x
;X      = sprite index
;------------------------------------------------------------
!zone CalcSpriteXPosFromCharPos
CalcSpriteXPosFromCharPos
          ;offset screen to border 24,50
          lda BIT_TABLE,x
          eor #$ff
          and SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
          ;need extended x bit?
          lda PARAM1
          sta SPRITE_CHAR_POS_X,x
          cmp #30
          bcc .NoXBit
          
          lda BIT_TABLE,x
          ora SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
.NoXBit   
          ;calculate sprite positions (offset from border)
          txa
          asl
          tay
          
          ;X = charX * 8 + ( 24 - SPRITE_CENTER_OFFSET_X=8 )
          lda PARAM1
          asl
          asl
          asl
          clc
          adc #( 24 - SPRITE_CENTER_OFFSET_X )
          sta SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          rts

;------------------------------------------------------------
;CalcSpriteYPosFromCharPos
;calculates the real sprite y coordinates from screen char y pos
;and sets them directly
;PARAM2 = char_pos_y
;X      = sprite index
;------------------------------------------------------------
!zone CalcSpriteYPosFromCharPos
CalcSpriteYPosFromCharPos
          txa
          asl
          tay
          ;Y = charY * 8 + ( 50 - SPRITE_CENTER_OFFSET_Y=11 )
          lda PARAM2
          sta SPRITE_CHAR_POS_Y,x
          asl
          asl
          asl
          clc
          adc #( 50 - SPRITE_CENTER_OFFSET_Y )
          sta SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS,y
          
          lda #0
          sta SPRITE_CHAR_POS_Y_DELTA,x
          rts

;------------------------------------------------------------
;CalcSpritePosFromCharPos
;calculates the real sprite coordinates from screen char pos
;and sets them directly
;PARAM1 = char_pos_x
;PARAM2 = char_pos_y
;X      = sprite index
;------------------------------------------------------------
!zone CalcSpritePosFromCharPos    
CalcSpritePosFromCharPos

          ;offset screen to border 24,50
          lda BIT_TABLE,x
          eor #$ff
          and SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
          ;need extended x bit?
          lda PARAM1
          sta SPRITE_CHAR_POS_X,x
          cmp #30
          bcc .NoXBit
          
          lda BIT_TABLE,x
          ora SPRITE_POS_X_EXTEND
          sta SPRITE_POS_X_EXTEND
          sta VIC_SPRITE_X_EXTEND
          
.NoXBit   
          ;calculate sprite positions (offset from border)
          txa
          asl
          tay
          
          ;X = charX * 8 + ( 24 - SPRITE_CENTER_OFFSET_X=8 )
          lda PARAM1
          asl
          asl
          asl
          clc
          adc #( 24 - SPRITE_CENTER_OFFSET_X )
          sta SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
          
          ;Y = charY * 8 + ( 50 - SPRITE_CENTER_OFFSET_Y=11 )
          lda PARAM2
          sta SPRITE_CHAR_POS_Y,x
          asl
          asl
          asl
          clc
          adc #( 50 - SPRITE_CENTER_OFFSET_Y )
          sta SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS,y
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          sta SPRITE_CHAR_POS_Y_DELTA,x
          rts


;------------------------------------------------------------
;BuildScreen
;creates a screen from level data
;------------------------------------------------------------
!zone BuildScreen

CHARSET_VALUE
          !byte $3e, $3c
CHARSET_MC_1
          !byte 6,1
CHARSET_MC_2
          !byte 1,9

BuildScreen
          lda #$0b
          sta VIC_CONTROL_MODE
          ;reset all objects (from index 2)
          ldx #2
          lda #0
          sta ENEMY_SPELL
          sta ENEMY_SPELL_COUNT
.ClearObjectLoop
          sta SPRITE_ACTIVE,x
          sta SPRITE_ANIM_POS,x
          sta SPRITE_ANIM_DELAY,x
          inx
          cpx #8
          bne .ClearObjectLoop
          
          ldx #0
          stx PLAYER_STAND_STILL_COUNT
          
.ClearNextItem          
          sta ITEM_ACTIVE,x
          inx
          cpx #ITEM_COUNT
          bne .ClearNextItem
          
          
          lda VIC_SPRITE_ENABLE
          and #$03
          sta VIC_SPRITE_ENABLE
          
          ;clear screen
          jsr ClearPlayScreen
          
          ;get pointer to real level data from table
          lda #0
          sta PARAM1
          lda LEVEL_NR
          cmp #9
          bcc .NotCharSet2
          inc PARAM1
.NotCharSet2          
          lda PARAM1
          cmp CURRENT_CHARSET
          beq +
          
          sta CURRENT_CHARSET
          tax
          lda CHARSET_VALUE,x
          sta TOP_CHARSET_VALUE
          lda CHARSET_MC_1,x
          sta TOP_CHARSET_MULTICOLOR_1
          lda CHARSET_MC_2,x
          sta TOP_CHARSET_MULTICOLOR_2
          
+          
          lda LEVEL_NR
          asl
          tax
          lda SCREEN_DATA_TABLE,x
          sta ZEROPAGE_POINTER_1
          lda SCREEN_DATA_TABLE + 1,x
          sta ZEROPAGE_POINTER_1 + 1
          jsr .BuildLevel
          
          lda #$1b
          sta VIC_CONTROL_MODE
          
.LevelComplete          
          rts
          
PREVIOUS_ELEMENT          
          !byte 255
.BuildLevel
          ;work through data
          
          ldy #255
          ;sty PREVIOUS_ELEMENT
          
.LevelDataLoop
          iny
          
          lda (ZEROPAGE_POINTER_1),y
          and #$80
          beq .UsePreviousDataType
          
          lda (ZEROPAGE_POINTER_1),y
          and #$7f
          tax
          stx PARAM8
          
.UseData          
          lda LEVEL_ELEMENT_TABLE_LO,x
          sta ZEROPAGE_POINTER_4
          lda LEVEL_ELEMENT_TABLE_HI,x
          sta ZEROPAGE_POINTER_4 + 1
          jmp (ZEROPAGE_POINTER_4 )
          
.UsePreviousDataType
          dey
          ldx PARAM8
          jmp .UseData
          
LEVEL_ELEMENT_TABLE_LO
          !byte <.LevelComplete
          !byte <LevelLine
          !byte <LevelLine
          !byte <LevelObject
          !byte <LevelElement
          !byte <LevelElementH
          !byte <LevelElementV
          !byte <LevelSearchObject
          !byte <LevelClue
          !byte <LevelSpecial
          !byte <LevelDoor
          
LEVEL_ELEMENT_TABLE_HI
          !byte >.LevelComplete
          !byte >LevelLine
          !byte >LevelLine
          !byte >LevelObject
          !byte >LevelElement
          !byte >LevelElementH
          !byte >LevelElementV
          !byte >LevelSearchObject
          !byte >LevelClue
          !byte >LevelSpecial
          !byte >LevelDoor

NextLevelData
          pla
          
          ;adjust pointers so we're able to access more 
          ;than 256 bytes of level data
          clc
          adc #1
          adc ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_1
          lda ZEROPAGE_POINTER_1 + 1
          adc #0
          sta ZEROPAGE_POINTER_1 + 1
          ldy #255
          
          jmp .LevelDataLoop

!zone LevelLineH
LevelLine
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;width
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          
          ;char
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM4
          
          ;color
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM5

          cpx #2
          beq LevelLineV

          ;store target pointers to screen and color ram
          ldx PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          
          
          tya
          pha
          
          ldy PARAM1
.NextChar          
          lda PARAM4
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5
          sta (ZEROPAGE_POINTER_3),y
          iny
          dec PARAM3
          bne .NextChar
          
          jmp NextLevelData
          
!zone LevelLineV
LevelLineV
          ;store target pointers to screen and color ram
          ldx PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          
          tya
          pha
          
          ldy PARAM1
.NextCharV         
          lda PARAM4
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5
          sta (ZEROPAGE_POINTER_3),y
          
          ;adjust pointer
          lda ZEROPAGE_POINTER_2
          clc
          adc #40
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda ZEROPAGE_POINTER_2 + 1
          adc #0
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1
          
          dec PARAM3
          bne .NextCharV
          
          jmp NextLevelData
          
!zone LevelObject
LevelObject
          ;!byte LD_OBJECT,10,6,TYPE_BIRD,1,14,22
          
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3

          ;store y for later
          tya
          pha
          
          ;add object to sprite array
          jsr AddObject
          
          pla
          tay
          
          ;color
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta VIC_SPRITE_COLOR,x
          
          ;mark save spot as active
          lda PARAM3
          cmp #TYPE_SAVE_SPOT
          bne .NotASaveSpot
          
          lda LEVEL_NR
          cmp PLAYER_START_LEVEL
          bne .NotASaveSpot
          
          lda #1
          sta SPRITE_STATE,x
          
          lda PARAM3
.NotASaveSpot
          cmp #TYPE_KEY
          bne .NoKey
          
          tya
          pha
          
          lda VIC_SPRITE_COLOR,x
          and #$0f
          lsr
          tay
          
          lda PLAYER_KEY,y
          beq .KeyNotCollected
          
          jsr RemoveObject
          pla
          tay
          
          iny
          iny
          iny
          iny
          tya
          pha
          jmp NextLevelData
          
.KeyNotCollected          
          pla
          tay
.NoKey          

          ;behaviour
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_BEHAVIOUR,x
          
          ;speed
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_SPEED,x
          
          ;border 1
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_BORDER_1,x
          
          ;border 2
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_BORDER_2,x
          
          cmp SPRITE_CHAR_POS_X,x
          bne .StartToRight
          
          lda #1
          sta SPRITE_DIRECTION,x
          
.StartToRight          
          tya
          pha

          ;duplicate enemy creation
          lda SPRITE_ACTIVE,x
          cmp #TYPE_PURPLE_BLOCK
          bne .NoPurpleBlock
          
          ;add second block to the right
          inc PARAM1
          inc PARAM1
          inc PARAM1
          lda VIC_SPRITE_COLOR,x
          sta VIC_SPRITE_COLOR + 1,x
          lda #TYPE_PURPLE_BLOCK_R
          sta PARAM3
          txa
          pha
          
          jsr AddObject
          
          pla
          tay
          lda SPRITE_SPEED,y
          sta SPRITE_SPEED,x
          lda SPRITE_BEHAVIOUR,y
          sta SPRITE_BEHAVIOUR,x
          lda SPRITE_BORDER_1,y
          sta SPRITE_BORDER_1,x
          lda SPRITE_BORDER_2,y
          sta SPRITE_BORDER_2,x
          lda SPRITE_DIRECTION,y
          sta SPRITE_DIRECTION,x
          
          jmp NextLevelData

.NoPurpleBlock
          cmp #TYPE_FIRE_HEAD
          bne .NoFireHead
          
          ;add second block to the right
          inc PARAM1
          inc PARAM1
          inc PARAM1
          lda VIC_SPRITE_COLOR,x
          sta VIC_SPRITE_COLOR + 1,x
          sta VIC_SPRITE_COLOR + 2,x
          sta VIC_SPRITE_COLOR + 3,x
          lda #TYPE_FIRE_HEAD_UR
          sta PARAM3
          jsr AddObject
          
          dec PARAM1
          dec PARAM1
          dec PARAM1
          inc PARAM2
          inc PARAM2
          inc PARAM2
          lda #TYPE_FIRE_HEAD_LL
          sta PARAM3
          jsr AddObject

          inc PARAM1
          inc PARAM1
          inc PARAM1
          lda #TYPE_FIRE_HEAD_LR
          sta PARAM3
          jsr AddObject

.NoFireHead
          cmp #TYPE_SOUL_CONTAINER
          bne .NoSoulContainer
          
          ;add second part below
          inc PARAM2
          inc PARAM2
          inc PARAM2
          lda VIC_SPRITE_COLOR,x
          sta VIC_SPRITE_COLOR + 1,x
          lda #TYPE_SOUL_CONTAINER_BOTTOM
          sta PARAM3
          jsr AddObject
          jmp NextLevelData

.NoSoulContainer
          cmp #TYPE_GHOST
          bne .NoGhost
          
          ;add second part below
          inc PARAM2
          inc PARAM2
          inc PARAM2
          lda VIC_SPRITE_COLOR,x
          sta VIC_SPRITE_COLOR + 1,x
          lda #TYPE_GHOST_BOTTOM
          sta PARAM3
          jsr AddObject
          ;fall through

.NoGhost
          jmp NextLevelData
          
          
!zone LevelElement
LevelElement

          ; !byte LD_ELEMENT,0,0,EL_BLUE_BRICK_4x3
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2
          
          and #$80
          beq +
          
          ;reuse previous element type
          lda PARAM2
          and #$7f
          sta PARAM2
          
          lda PREVIOUS_ELEMENT
          sta PARAM3
          
          jmp ++
          
+          
          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          sta PREVIOUS_ELEMENT

++
DrawSingleElement
          ;store y for later
          tya
          pha
          
          jsr DrawLevelElement
          
          jmp NextLevelData



!zone LevelDoor
LevelDoor


          ; !byte LD_DOOR,19,9,EL_GAME_BLUE_DOOR,1
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          sta PREVIOUS_ELEMENT

          ;door index
          iny
          lda (ZEROPAGE_POINTER_1),y
          tax
          
          lda PLAYER_KEY,x
          beq .DoorClosed
          ;lift door
          dec PARAM2
          dec PARAM2
          dec PARAM2
          dec PARAM2
          dec PARAM2

.DoorClosed
          jmp DrawSingleElement


!zone LevelElementH
LevelElementH

          ; !byte LD_ELEMENT_LINE_H,x,y,width,element
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2
          and #$e0
          beq .SeparateCount
          
          ;count is in the upper 3 bits of Y
          lsr
          lsr
          lsr
          lsr
          lsr
          sta PARAM7
          lda PARAM2
          and #$1f
          sta PARAM2
          jmp .GetType


.SeparateCount
          ;x count
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM7

.GetType
          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          sta PREVIOUS_ELEMENT

          ;store y for later
          tya
          pha
          
.NextElement          
          jsr DrawLevelElement
          
          dec PARAM7
          beq .Done
          
          lda PARAM1
          clc
          adc PARAM4
          sta PARAM1
          jmp .NextElement
          
.Done          
          jmp NextLevelData

          
!zone LevelElementV
LevelElementV

          ; !byte LD_ELEMENT_LINE_V,x,y,num,element
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2
          and #$e0
          beq .SeparateCount
          
          ;count is in the upper 3 bits of Y
          lsr
          lsr
          lsr
          lsr
          lsr
          sta PARAM7
          lda PARAM2
          and #$1f
          sta PARAM2
          jmp .GetType


.SeparateCount
          ;y count
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM7

.GetType
          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          sta PREVIOUS_ELEMENT

          ;store y for later
          tya
          pha
          
.NextElement          
          jsr DrawLevelElement
          
          dec PARAM7
          beq .Done
          
          lda PARAM2
          clc
          adc PARAM5
          sta PARAM2
          jmp .NextElement
          
.Done          
          jmp NextLevelData

          
!zone LevelSearchObject
LevelSearchObject

          ; !byte LD_SEARCH_OBJECT,0,0,EL_BLUE_BRICK_4x3
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2

          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3
          sta PREVIOUS_ELEMENT

          ;item ID HI
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM4

          ;item ID LO
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM5

          ;store y for later
          tya
          pha
          
          ldx PARAM5
          lda PARAM4
          beq .LoID
          lda SEARCH_ITEM_STATE + 256,x
          and #$0f
          beq .ItemIsGone
          jmp .ItemExists
.LoID
          lda SEARCH_ITEM_STATE,x
          and #$0f
          beq .ItemIsGone

.ItemExists
          jsr AddItem
          
.ItemIsGone          
          jmp NextLevelData


!zone LevelClue
LevelClue
          ; LD_CLUE,19,16,1,EL_GAME_CLUE_12X1
          
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2
          
          ;clue ID
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM7

          ;element ID
          lda #EL_GAME_CLUE_12X1
          sta PARAM3
          sta PREVIOUS_ELEMENT

          ;store y for later
          tya
          pha
          jsr DrawLevelElement
          
          ;add clue on top
          ldy PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_2
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_2 + 1
          
          lda PARAM1
          clc
          adc PARAM7
          tay
          
          ldx PARAM7
          lda SOLUTION_PUZZLE_PARTS,x
          sta (ZEROPAGE_POINTER_2),y
          
          jmp NextLevelData


!zone LevelSpecial
LevelSpecial
          ; LD_SPECIAL,X,Y,Index
          ; used for spirit stone slabs
          
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2
          
          ;clue ID
          iny
          lda (ZEROPAGE_POINTER_1),y
          tax
          
          tya
          pha
          
          ;add clue on top
          ldy PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) >> 8 )
          sta ZEROPAGE_POINTER_3 + 1
          
          lda SCREEN_PUZZLE_PARTS,x
          ldy PARAM1
          sta (ZEROPAGE_POINTER_2),y
          
          lda #2
          sta (ZEROPAGE_POINTER_3),y
          
          jmp NextLevelData


;------------------------------------------------------------
;draws a level element
;PARAM1 = X
;PARAM2 = Y
;PARAM3 = TYPE
;returns element width in PARAM4
;returns element height in PARAM5
;------------------------------------------------------------

!zone DrawLevelElement          
DrawLevelElement          

          ldy PARAM3

          lda LEVEL_NR
          cmp #9
          bcc .TombElement
          
          lda GAMEELEMENT_TABLE_LO,y
          sta .LoadCode + 1
          lda GAMEELEMENT_TABLE_HI,y
          sta .LoadCode + 2

          lda GAMEELEMENT_COLOR_TABLE_LO,y
          sta .LoadCodeColor + 1
          lda GAMEELEMENT_COLOR_TABLE_HI,y
          sta .LoadCodeColor + 2

          lda GAMEELEMENT_WIDTH_TABLE,y
          sta PARAM4
          lda GAMEELEMENT_HEIGHT_TABLE,y
          sta PARAM5
          sta PARAM6
          jmp .DisplayElementNow
          
.TombElement

          lda TOMBELEMENT_TABLE_LO,y
          sta .LoadCode + 1
          lda TOMBELEMENT_TABLE_HI,y
          sta .LoadCode + 2

          lda TOMBELEMENT_COLOR_TABLE_LO,y
          sta .LoadCodeColor + 1
          lda TOMBELEMENT_COLOR_TABLE_HI,y
          sta .LoadCodeColor + 2

          lda TOMBELEMENT_WIDTH_TABLE,y
          sta PARAM4
          lda TOMBELEMENT_HEIGHT_TABLE,y
          sta PARAM5
          sta PARAM6
          
.DisplayElementNow          
          ldy PARAM2
          lda SCREEN_LINE_OFFSET_TABLE_LO,y
          clc
          adc PARAM1
          sta .StoreCode + 1
          sta .StoreCodeColor + 1
          sta ZEROPAGE_POINTER_4
          lda SCREEN_LINE_OFFSET_TABLE_HI,y
          adc #0
          sta .StoreCode + 2
          adc #( ( >SCREEN_COLOR ) - ( >SCREEN_CHAR ) )
          sta .StoreCodeColor + 2
          
.NextRow          
          ldx #0
          
          ;display a row
.Row
          
.LoadCode
          lda $8000,x
.StoreCode
          sta $8000,x
          
.LoadCodeColor
          lda $8000,x
.StoreCodeColor
          sta $8000,x
          
          inx
          cpx PARAM4
          bne .Row
          
          ;eine zeile nach unten
          dec PARAM6
          beq .ElementDone

          ;should be faster?
          lda .LoadCode + 1
          clc
          adc PARAM4
          sta .LoadCode + 1
          lda .LoadCode + 2
          adc #0
          sta .LoadCode + 2
          
          lda .LoadCodeColor + 1
          clc
          adc PARAM4
          sta .LoadCodeColor + 1
          lda .LoadCodeColor + 2
          adc #0
          sta .LoadCodeColor + 2

          lda .StoreCode + 1
          clc
          adc #40
          sta .StoreCode + 1
          lda .StoreCode + 2
          adc #0
          sta .StoreCode + 2

          lda .StoreCodeColor + 1
          clc
          adc #40
          sta .StoreCodeColor + 1
          lda .StoreCodeColor + 2
          adc #0
          sta .StoreCodeColor + 2

          jmp .NextRow
          
.ElementDone          
          rts
          
;------------------------------------------------------------
;adds object
;PARAM1 = X
;PARAM2 = Y
;PARAM3 = TYPE
;------------------------------------------------------------

!zone AddObjectFromStart
AddObjectFromStart
          ldx #0
          jmp AddObjectNow

;------------------------------------------------------------
;adds object
;PARAM1 = X
;PARAM2 = Y
;PARAM3 = TYPE
;------------------------------------------------------------

!zone AddObject
AddObject
          ldx #2
AddObjectNow          
          jsr FindEmptySpriteSlot
          beq .NoFreeSlot
          
          ;PARAM1 and PARAM2 hold x,y already
          jsr CalcSpritePosFromCharPos

CreateObjectInSlot          
          lda PARAM3
          sta SPRITE_ACTIVE,x

          ;enable sprite
          lda BIT_TABLE,x
          ora VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE

          ;sprite color
          lda BIT_TABLE,x
          ora VIC_SPRITE_MULTICOLOR
          sta VIC_SPRITE_MULTICOLOR
          
          ldy PARAM3
          
          ;initialise enemy values
          lda TYPE_START_SPRITE,y
          sta SPRITE_POINTER_BASE,x
          
          lda #0
          sta SPRITE_BEHAVIOUR,x
          ;look right per default
          sta SPRITE_DIRECTION,x
          sta SPRITE_DIRECTION_Y,x
          sta SPRITE_ANIM_POS,x
          sta SPRITE_ANIM_DELAY,x
          sta SPRITE_MOVE_POS,x
          sta SPRITE_MOVE_POS_Y,x
          sta SPRITE_FIRE_DELAY,x
          sta SPRITE_STATE,x
          sta SPRITE_HOMING_DELAY,x
          
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
          
          
          
tmp_byte  = $e1 ; sfx counter (in zp)

; sfx lookup table

SFX_EXPLOSION           = 0
SFX_COLLECT_ITEM        = 1
SFX_COLLECT_PUZZLE      = 2
SFX_ACTIVATE_SAVE_POINT = 3
SFX_HIT                 = 4
SFX_FIRE_BALL           = 5
SFX_SKULL_SCREAM        = 6
SFX_KEY                 = 7
SFX_STONE_SLAB_THUMP    = 8


; first two bytes are Attack Decay and Sustain Release, the following values works like this:
; $00 - $ef selects hi frequency-value. $f0-$fe selects wave/pwhi selection (see below). $ff ends sfx.

; sfx lookup table

what_sfx_lo
          !byte <sfx1, <sfx2, <sfx3, <sfx4, <sfx5, <sfx6, <sfx7, <sfx8, <sfx9
what_sfx_hi  
          !byte >sfx1, >sfx2, >sfx3, >sfx4, >sfx5, >sfx6, >sfx7, >sfx8, >sfx9

; first two bytes are Attack Decay and Sustain Release, the following values works like this:
; $00 - $ef selects hi frequency-value. $f0-$fe selects wave/pwhi selection (see below). $ff ends sfx.

; 1) explosion sound - also used on fireball and electrical skull attack.
sfx1   !byte $08, $99, $f7, $ef, $f6, $ef, $f1, $10, $f2, $02, $f3, $02, $f4, $02, $f6, $10, $08, $04, $03, $02, $04, $02, $01, $00, $01, $02, $00, $01, $00, $01, $fe, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $ff

; 2) collecting an item - collecting magic, gold and health.
sfx2   !byte $00, $89, $f2, $0a, $0a, $0a, $fa, $0c, $0c, $0c, $fb, $10, $10, $10, $fc, $15, $15, $15, $fd, $1c, $1c, $1c, $ff

; 3) collecting a puzzle piece  20, 2b 36 41 52
sfx3   !byte $05, $29, $f4, $20, $20, $20, $2b, $2b, $2b, $36, $36, $36, $41, $41, $41, $52, $52, $52, $fa, $20, $20, $20, $2b, $2b, $2b, $36, $36, $36, $41, $41, $41, $52, $52, $52, $ff 

; 4) activating save point
;sfx4 .byte $44, $f8, $f0, $82, $83, $84, $85, $84, $83, $82, $80, $7c, $76, $70, $68, $62, $60, $5c, $60, $68, $70, $80, $f8, $90, $98, $9e, $a0, $a1, $a0, $a1, $a1, $ff ; whistle
sfx4   !byte $09, $a9, $f1, $08, $16, $24, $32, $40, $50, $60, $70, $0c, $f9, $18, $26, $34, $42, $52, $62, $72, $0b, $1a, $28, $36, $44, $54, $64, $74, $0d, $1c, $2a, $38, $46, $56, $66, $76, $ff

; 5) getting hit by an enemy
sfx5   !byte $08, $09, $f2, $10, $0f, $0e, $0d, $0c, $0b, $10, $f9, $10, $08, $07, $06, $05, $04, $03, $02, $01, $ff

; 6) head fires a fireball
sfx6   !byte $88, $09, $f6, $10, $0f, $0e, $0d, $0c, $0b, $fe, $08, $07, $06, $05, $04, $03, $02, $01, $ff

; 7) scream for when the white skulls touch you
sfx7   !byte $58, $8a, $f3, $20, $1f, $1e, $1d, $f2, $1c, $1b, $fb, $18, $17, $16, $16, $15, $15, $16, $15, $15, $14, $14, $12, $11, $ff

; 8) kerching when you collect a key
sfx8   !byte $08, $89, $f3, $18, $18, $18, $30, $30, $30, $fa, $60, $61, $62, $61, $60, $61, $62, $61, $60, $61, $62, $61, $60, $61, $62, $61, $60, $61, $62, $61, $60, $61, $62, $61, $60, $ff

; 9) loud thumb (think this will be better for the stones or something)
sfx9   !byte $08, $98, $f6, $02, $03, $15, $05, $04, $02, $03, $02, $02, $03, $03, $fe, $01, $02, $01, $02, $00, $00, $00, $01, $00, $00, $ff



;       $f0, $f1, $f2, $f3, $f4, $f5, $f6, $f7, $f8, $f9, $fa, $fb, $fc, $fd, $fe
sfx_wave  !byte $11, $21, $41, $41, $41, $41, $81, $89, $10, $20, $40, $40, $40, $40, $80
sfx_pwhi  !byte $00, $00, $08, $06, $04, $02, $00, $00, $00, $00, $08, $06, $04, $02, $00

;------

sfx_count 
          !byte $ff
testbit_c 
          !byte $00 ; testbit counter (for how long it's on)
          
sid_lut 
          !byte $00, $07, $0e

;-------------------------------------------------------------------------------

init_sfx  ; loads values to play sfx (set sfx-value in x-register before calling this routine)
  
          lda what_sfx_lo,x
          sta usfx_smc1+1
          sta usfx_smc2+1
          sta usfx_smc3+1

          lda what_sfx_hi,x
          sta usfx_smc1+2
          sta usfx_smc2+2
          sta usfx_smc3+2

          lda #$00
          sta sfx_count   
          rts   

;-------------------------------------------------------------------------------

update_sfx

  lda sfx_count ; check counter
  bpl + ; if not negative (#$ff) - branch!
  rts ; else break
+ bne usfx_010  ; if not #$00 - skip init voice code

  ; init voice to play sfx 
  
  sta $d400+7+6 ; sustain release (acc = #$00) 
  sta $d400+7+2 ; pulsewidth low byte (acc = #$00)  
  
  lda #$28  ; reset waveform
  sta $d400+7+4

  ldy #$01  
usfx_smc1 lda $ffff,y
  sta $d400+7+6 ; sustain release

usfx_smc2 lda $ffff
  sta $d400+7+5 ; attack decay

  inc sfx_count
  inc sfx_count     
  
usfx_010  ; do sfx stuff!
  
  ldy sfx_count
usfx_smc3 lda $ffff,y
  cmp #$ff
  beq usfx_020  ; branch if #ff
  
  cmp #$f0
  bcc usfx_015  ; if less, update registers
  
  tay
  
  lda sfx_wave-$f0,y
  sta $d400+7+4 ; waveform
  
  lda sfx_pwhi-$f0,y
  sta $d400+7+3 ; pulsewidth hi nybble
    
  inc sfx_count ; update counter
  jmp usfx_010
  

usfx_015  ; update sfx-registers
  
  sta $d400+7+1 ; set pitch
  
  lda #$80
  sta $d400+7+0

  inc sfx_count
  rts

usfx_020  ; prepare for music on sid voice again.

  sta sfx_count ; store #$ff (acc)
  
  lda #$08  ; number of frames to wait before letting on voice 2 again.
  sta testbit_c

  lda #$00
  sta $d400+7+6 ; sustain release
  
  lda #$20  ; waveform
  sta $d400+7+4

  rts

;-------------------------------------------------------------------------------

copy_zp_to_sid

  lda testbit_c
  beq czts_001
  dec testbit_c

; following lines checks for chord-sound and nullifies envelope to eliminate those 'blirps'.    
  lda $e5+6+7 ; sustain release
  cmp #$48
  bne czts_001
  lda $e5+5+7 ; attack decay
  cmp #$14
  bne czts_001
  
  lda #$00  ; ok, we're certain we are dealing with the chord-instrument - reset the envelope
  sta $e5+6+7
  sta $e5+5+7

czts_001
  
  ldx #$03  ; volume, filters
czts_002  lda $e5+21,x
  sta $d400+21,x
  dex
  bpl czts_002

  ; wave, frequency, pulsewidth and ADSR last.
  
  ldy #$02

czts_010  sty tmp_byte  ; store y in tmp_byte   
  ldx sid_lut, y

  ; checks for our gate trick
  cpy #$01  ; are we at voice 2 
  bne czts_011  ; no, branch
  lda testbit_c ; yes. check testbit_c
  beq czts_011  ; if equal, skip.
  ldy #$80
czts_011
  lda $e5+6,x ; sustain release
  sta $d400+6,x

  lda $e5+5,x ; attack decay
  iny ; check y-reg.  
  bpl czts_012  ; yes, branch
  lda #$44  
czts_012  sta $d400+5,x

  lda $e5+0,x ; frequency 
  sta $d400+0,x 
  lda $e5+1,x
  sta $d400+1,x
  
  lda $e5+2,x ; pulsewidth 
  sta $d400+2,x 
  lda $e5+3,x
  sta $d400+3,x

  lda $e5+4,x ; wave
  iny ; check y-reg.
  bpl czts_013
  ora #%00001000  ; set testbit :)
  and #%11111001  ; turn off sync and ring  
czts_013  sta $d400+4,x

  ldy tmp_byte
czts_014  dey ; decrease y
  bmi czts_020  ; are we done, then branch
  cpy #$01  ; are we on voice 2?
  bne czts_010  ; no - loop again
  lda sfx_count ; yes, then check - are we playing sfx?
  bmi czts_010  ; no - loop again
  bpl czts_014  ; yes, skip updateing registers.  
  
czts_020  rts
          
          
;------------------------------------------------------------
;adds search object
;PARAM1 = X
;PARAM2 = Y
;PARAM3 = TYPE
;PARAM4 = ID HI
;PARAM5 = ID LO
;------------------------------------------------------------

!zone AddItem
AddItem
          ldx #0
          
.NextItemSlot
          lda ITEM_ACTIVE,x
          beq .EmptySlotFound
          
          inx
          cpx #ITEM_COUNT
          bne .NextItemSlot
          rts
          
ELEMENT_HEIGHT_SEARCH_DURATION
          !byte $F3, $F7, $ff, $ff, $ff, $ff
          
.EmptySlotFound          
          lda PARAM3
          sta ITEM_ACTIVE,x
          
          lda PARAM1
          sta ITEM_POS_X,x
          lda PARAM2
          sta ITEM_POS_Y,x
          
          lda PARAM4
          sta ITEM_ID_HI,x
          lda PARAM5
          sta ITEM_ID_LO,x
          
          ;adjust search length
          ldx PARAM3
          ldy GAMEELEMENT_HEIGHT_TABLE,x
          dey
          lda ELEMENT_HEIGHT_SEARCH_DURATION,y
          sta PARAM6

          ldx PARAM5
          lda PARAM4
          beq .LoId
          
          lda SEARCH_ITEM_STATE + 256,x
          and PARAM6
          sta SEARCH_ITEM_STATE + 256,x
          jmp .LengthAdjusted

.LoId
          lda SEARCH_ITEM_STATE,x
          and PARAM6
          sta SEARCH_ITEM_STATE,x

.LengthAdjusted
          jmp DrawLevelElement
          
          
!zone WaitFrame
          ;wait for the raster to reach line $f8
          ;this is keeping our timing stable
          
          ;are we on line $F8 already? if so, wait for the next full screen
          ;prevents mistimings if called too fast
WaitFrame 
          lda VIC_RASTER_POS
          cmp #$Ff
          beq WaitFrame

          ;wait for the raster to reach line $f8 (should be closer to the start of this line this way)
.WaitStep2
          lda VIC_RASTER_POS
          cmp #$Ff
          bne .WaitStep2
          
          rts


;------------------------------------------------------------
;Looks for an empty sprite slot, returns in X
;#1 in A when empty slot found, #0 when full
;------------------------------------------------------------

!zone FindEmptySpriteSlot
FindEmptySpriteSlot
.CheckSlot          
          lda SPRITE_ACTIVE,x
          beq .FoundSlot
          
          inx
          cpx #8
          bne .CheckSlot
          
          lda #0
          rts
          
.FoundSlot
          lda #1
          rts


;------------------------------------------------------------
;Removed object from array
;X = index of object
;------------------------------------------------------------

!zone RemoveObject
RemoveObject
          ;remove from array
          lda #0
          sta SPRITE_ACTIVE,x

          ;disable sprite          
          lda BIT_TABLE,x
          eor #$ff
          and VIC_SPRITE_ENABLE
          sta VIC_SPRITE_ENABLE
          rts


;------------------------------------------------------------
;clears the play area of the screen
;A = char
;Y = color
;------------------------------------------------------------

!zone ClearPlayScreen
ClearPlayScreen
          ldx #$00
          lda #0
.ClearLoop          
          sta SCREEN_CHAR,x
          sta SCREEN_CHAR + 220,x
          sta SCREEN_CHAR + 440,x
          sta SCREEN_CHAR + 660,x
          inx
          cpx #220
          bne .ClearLoop

          lda #6
          ldx #$00
.ColorLoop          
          sta $d800,x
          sta $d800 + 220,x
          sta $d800 + 440,x
          sta $d800 + 660,x
          inx
          cpx #220
          bne .ColorLoop
          rts


;------------------------------------------------------------
;clears the full screen
;A = char
;Y = color
;------------------------------------------------------------

!zone ClearScreen
ClearScreen
          lda #0
          ldx #$00
.ClearLoop          
          sta SCREEN_CHAR,x
          sta SCREEN_CHAR + 250,x
          sta SCREEN_CHAR + 500,x
          sta SCREEN_CHAR + 750,x
          inx
          cpx #250
          bne .ClearLoop

          lda #1
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

          ;lda #BOTTOM_BORDER_RASTER_POS ;nr of rasterline we want our irq occur at
          ;sta VIC_RASTER_POS

          ;MSB of d011 is the MSB of the requested rasterline
          ;as rastercounter goes from 0-312
          lda VIC_CONTROL_MODE
          and #$7f
          sta VIC_CONTROL_MODE

          ;set irq vector to point to our routine
          ;lda #<IrqSetScoreDisplay
          ;sta $0314
          ;lda #>IrqSetScoreDisplay
          ;sta $0315
          
          lda #<IrqSetGame
          sta $0314
          lda #>IrqSetGame
          sta $0315

          ;nr of rasterline we want our irq occur at
          lda #$01 
          sta VIC_RASTER_POS          
 
          ;acknowledge any pending cia timer interrupts
          ;this is just so we're 100% safe
          lda $dc0d 
          lda $dd0d 

          cli
          rts


;-----------------------------------
;release IRQ
;-----------------------------------
!zone ReleaseIRQ
ReleaseIRQ
            
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


;-----------------------------------
;prepare for score display area
;-----------------------------------
!zone IrqSetScoreDisplay
IrqSetScoreDisplay
          ;acknowledge VIC irq
          lda $d019
          sta $d019

          ;install top part
          lda #<IrqSetGame
          sta $0314
          lda #>IrqSetGame
          sta $0315

          ;nr of rasterline we want our irq occur at
          lda #$01 
          sta VIC_RASTER_POS
          
          ;set panel charset
          lda #$30
          sta VIC_MEMORY_CONTROL
          lda BOTTOM_CHARSET_MULTICOLOR_1
          sta VIC_CHARSET_MULTICOLOR_1
          lda BOTTOM_CHARSET_MULTICOLOR_2
          sta VIC_CHARSET_MULTICOLOR_2
          
!ifndef NO_MUSIC {          
          ;play music
          jsr MUSIC_PLAYER + 3
          
           jsr update_sfx   ; update sfx-stuff  
           jsr copy_zp_to_sid ; copy temporary zp to actual sid registers
}

          ;count time (always PAL)
          inc PLAY_TIME_FRAME
          ;ldy KERNAL_PAL
          ldy #1
          lda PLAY_TIME_FRAME
          cmp FRAMES_PER_SECOND,y
          bne +
          
          lda #0
          sta PLAY_TIME_FRAME
          inc PLAY_TIME_SECONDS
          lda PLAY_TIME_SECONDS
          cmp #60
          bne +
          
          lda #0
          sta PLAY_TIME_SECONDS
          inc PLAY_TIME_MINUTES
          lda PLAY_TIME_MINUTES
          cmp #255
          bne +
          
          lda #254
          sta PLAY_TIME_MINUTES
          
+
          
          
          lda MAGIC_POS
          beq .NoBorder
          
          inc MAGIC_DELAY
          lda MAGIC_DELAY
          cmp #8
          bne .NoBorder
          
          lda #0
          sta MAGIC_DELAY
         
          inc MAGIC_POS
          ldy MAGIC_POS
          lda MAGIC_BORDER_TABLE,y
          sta VIC_BORDER_COLOR
          bne .MagicStillActive
          
          sta MAGIC_POS
          
.MagicStillActive          
.NoBorder          
          JMP IRQ_RETURN_KERNAL


;-----------------------------------
;IRQ Title - set text mode
;-----------------------------------
!zone IrqSetGame
IrqSetGame

          ;acknowledge VIC irq
          lda $d019
          sta $d019

          ;install next state
          lda #<IrqSetScoreDisplay
          sta $0314
          lda #>IrqSetScoreDisplay
          sta $0315

          ;nr of rasterline we want our irq occur at
          lda #BOTTOM_BORDER_RASTER_POS
          sta VIC_RASTER_POS

          ;set charset
          lda TOP_CHARSET_VALUE
          sta VIC_MEMORY_CONTROL
          lda TOP_CHARSET_MULTICOLOR_1
          sta VIC_CHARSET_MULTICOLOR_1
          lda TOP_CHARSET_MULTICOLOR_2
          sta VIC_CHARSET_MULTICOLOR_2
          
          jmp IRQ_RETURN_KERNAL
          
          
;-----------------------------------
;init IRQ
;-----------------------------------
!zone InitTitleIRQ
InitTitleIRQ
         
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

          ;lda #140 ;nr of rasterline we want our irq occur at
          lda #1
          sta VIC_RASTER_POS

          lda #$1b ;MSB of d011 is the MSB of the requested rasterline
          sta $d011 ;as rastercounter goes from 0-312

          ;set irq vector to point to our routine
          ;lda #<IrqSetTitleBottomDisplay
          lda #<IrqSetTitleScroller
          sta $0314
          ;lda #>IrqSetTitleBottomDisplay
          lda #>IrqSetTitleScroller
          sta $0315

          ;acknowledge any pending cia timer interrupts
          ;this is just so we're 100% safe
          lda $dc0d 
          lda $dd0d 

          cli
          rts


;-----------------------------------
;prepare for score display area
;-----------------------------------
!zone IrqSetTitleBottomDisplay
IrqSetTitleBottomDisplay
          ;acknowledge VIC irq
          lda $d019
          sta $d019

          ;install top part
          lda #<IrqSetTitleScroller
          sta $0314
          lda #>IrqSetTitleScroller
          sta $0315

          ;set panel charset
          lda #$3c
          sta VIC_MEMORY_CONTROL
          lda #12
          sta VIC_CHARSET_MULTICOLOR_1
          lda #9
          sta VIC_CHARSET_MULTICOLOR_2

          ;nr of rasterline we want our irq occur at
          lda #239
          sta VIC_RASTER_POS
          
          lda HSCROLL_POS
          cmp #8
          bne .NoHardScroll
          
          lda #<( SCREEN_CHAR + 24 * 40 )
          sta ZEROPAGE_POINTER_1
          lda #>( SCREEN_CHAR + 24 * 40 )
          sta ZEROPAGE_POINTER_1 + 1
          
          ;copy loop
          ldy #1
.CopyLoop          
          lda (ZEROPAGE_POINTER_1),y
          dey
          sta (ZEROPAGE_POINTER_1),y
          iny
          
          iny
          cpy #39
          bne .CopyLoop
         
          lda #<HSCROLL_TEXT
          sta ZEROPAGE_POINTER_1
          lda #>HSCROLL_TEXT
          clc
          adc HSCROLL_POINTER + 1
          sta ZEROPAGE_POINTER_1 + 1
          
          ldy HSCROLL_POINTER
          lda (ZEROPAGE_POINTER_1),y
          
          cmp #$ff
          bne .SetChar
          
          lda #0
          sta HSCROLL_POINTER
          sta HSCROLL_POINTER + 1
          
          lda HSCROLL_TEXT
.SetChar  
          sta SCREEN_CHAR + 24 * 40 + 38
          
          inc HSCROLL_POINTER
          bne +
          
          inc HSCROLL_POINTER + 1
          
+          
.NoHardScroll          
          jmp IRQ_RETURN_KERNAL


;-----------------------------------
;prepare for scroller display
;-----------------------------------
!zone IrqSetTitleScroller
IrqSetTitleScroller
          ;acknowledge VIC irq
          lda $d019
          sta $d019

          ;install top part
          lda #<IrqSetTopDisplay
          sta $0314
          lda #>IrqSetTopDisplay
          sta $0315

          ;nr of rasterline we want our irq occur at
          lda #$01 
          sta VIC_RASTER_POS
          
          ;set panel charset
          lda #$30
          sta VIC_MEMORY_CONTROL
          lda #6
          sta VIC_CHARSET_MULTICOLOR_1
          lda #8
          sta VIC_CHARSET_MULTICOLOR_2

          
          ;scroll
          dec HSCROLL_POS
          lda HSCROLL_POS
          cmp #0
          bne .NoHardScroll
          
          lda #8
          sta HSCROLL_POS
          
.NoHardScroll
          lda HSCROLL_POS
          and #$17
          sta VIC_CONTROL
          
          jmp IRQ_RETURN_KERNAL

;-----------------------------------
;IRQ Title - set text mode
;-----------------------------------
!zone IrqSetTopDisplay
IrqSetTopDisplay

          ;acknowledge VIC irq
          lda $d019
          sta $d019

          ;install next state
          lda #<IrqSetTitleBottomDisplay
          sta $0314
          lda #>IrqSetTitleBottomDisplay
          sta $0315

          ;nr of rasterline we want our irq occur at
          lda #140
          sta VIC_RASTER_POS

          ;reset scroll offset
          lda #$18
          sta VIC_CONTROL
          
          jmp IRQ_RETURN_KERNAL
          
;------------------------------------------------------------
;increases score by A
;note that the score is only shown; not held in a variable
;------------------------------------------------------------
!zone IncreaseScore10
IncreaseScore10
          sta PARAM1
          stx PARAM2
          sty PARAM3
          
.IncreaseBy10
          ldx #3
          
.IncreaseDigit          
          inc SCREEN_CHAR + ( 23 * 40 + 18 ),x
          lda SCREEN_CHAR + ( 23 * 40 + 18 ),x
          cmp #90
          bne .IncreaseBy1Done
          
          ;looped digit, increase next
          lda #80
          sta SCREEN_CHAR + ( 23 * 40 + 18 ),x
          dex
          ;TODO - this might overflow
          jmp .IncreaseDigit
          
.IncreaseBy1Done          
          dec PARAM1
          bne .IncreaseBy10
          
          ;increase complete, restore x,y
          ldx PARAM2
          ldy PARAM3
          rts
          
!zone IncreaseScore
IncreaseScore
          sta PARAM1
          stx PARAM2
          sty PARAM3
          
.IncreaseBy1          
          ldx #4
          
.IncreaseDigit          
          inc SCREEN_CHAR + ( 23 * 40 + 18 ),x
          lda SCREEN_CHAR + ( 23 * 40 + 18 ),x
          cmp #90
          bne .IncreaseBy1Done
          
          ;looped digit, increase next
          lda #80
          sta SCREEN_CHAR + ( 23 * 40 + 18 ),x
          dex
          ;TODO - this might overflow
          jmp .IncreaseDigit
          
.IncreaseBy1Done          
          dec PARAM1
          bne .IncreaseBy1
          
          ;increase complete, restore x,y
          ldx PARAM2
          ldy PARAM3
          rts


;------------------------------------------------------------
;generates a sometimes random number
;------------------------------------------------------------
!zone GenerateRandomNumber
GenerateRandomNumber
          lda $dc04
          eor $dc05
          eor $dd04
          adc $dd05
          eor $dd06
          eor $dd07
          rts

;------------------------------------------------------------
;generates a pseudo random number
;------------------------------------------------------------
!zone GeneratePseudoRandomNumber
GeneratePseudoRandomNumber
          lda GAME_RANDOM_SEED
          eor $dc05
          eor $dd04
          adc $dd05
          eor $dd06
          eor $dd07
          sta GAME_RANDOM_SEED
          rts

!ifndef COMPILE_CRUNCHED {
;------------------------------------------------------------
;copies charset from ZEROPAGE_POINTER_1 to ZEROPAGE_POINTER_2
;------------------------------------------------------------

!zone CopyCharSet
CopyCharSet
          ;set target address ($F000)
          lda #$00
          sta ZEROPAGE_POINTER_2
          lda #$F0
          sta ZEROPAGE_POINTER_2 + 1

          ldx #$00
          ldy #$00
          lda #0
          sta PARAM2
          sta PARAM3

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

.PageBoundaryNotReached

          beq .CopyCharsetDone
          ldx #$00
          jmp .NextLine

.CopyCharsetDone
          
          rts


;------------------------------------------------------------
;copies charset from ZEROPAGE_POINTER_1 to ZEROPAGE_POINTER_2
;------------------------------------------------------------

!zone CopyCharSetPanel
CopyCharSetPanel
          ;set target address ($F000)
          lda #$00
          sta ZEROPAGE_POINTER_2
          lda #$C0
          sta ZEROPAGE_POINTER_2 + 1

          ldx #$00
          ldy #$00
          lda #0
          sta PARAM2
          sta PARAM3

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

.PageBoundaryNotReached

          beq .CopyCharsetDone
          ldx #$00
          jmp .NextLine

.CopyCharsetDone
          
          rts


;------------------------------------------------------------
;copies sprites from ZEROPAGE_POINTER_1 to ZEROPAGE_POINTER_2
;       sprites are copied in numbers of four
;------------------------------------------------------------

!zone CopySprites
CopySprites
          ldy #$00
          ldx #$00
          
          lda #00
          sta ZEROPAGE_POINTER_2
          lda #$d0
          sta ZEROPAGE_POINTER_2 + 1
          
          ;4 sprites per loop
.SpriteLoop
          lda (ZEROPAGE_POINTER_1),y
          sta (ZEROPAGE_POINTER_2),y
          iny
          bne .SpriteLoop
          inx
          inc ZEROPAGE_POINTER_1+1
          inc ZEROPAGE_POINTER_2+1
          cpx #NUMBER_OF_SPRITES_DIV_4
          bne .SpriteLoop

          rts
}          

;------------------------------------------------------------
;screen data
;------------------------------------------------------------

LEVEL_DATA_START
!ifndef USE_CONDENSED_DATA {
!source "level_elements_tomb.asm"
!source "level_elements_game.asm"
} else {
!source "level_elements_manually_combined.asm"
}

LEVEL_DATA_END

          
SCREEN_DATA_TABLE
          !word TOMB_LEVEL_1
          !word TOMB_LEVEL_2
          !word TOMB_LEVEL_3
          !word TOMB_LEVEL_4
          !word TOMB_LEVEL_5
          !word TOMB_LEVEL_6
          !word TOMB_LEVEL_7
          !word TOMB_LEVEL_8
          !word TOMB_LEVEL_9
          !word GAME_LEVEL_1
          !word GAME_LEVEL_2
          !word GAME_LEVEL_3
          !word GAME_LEVEL_4
          !word GAME_LEVEL_5
          !word GAME_LEVEL_6
          !word GAME_LEVEL_7
          !word GAME_LEVEL_8
          !word GAME_LEVEL_9
          !word GAME_LEVEL_10
          !word GAME_LEVEL_11
          !word GAME_LEVEL_12
          !word GAME_LEVEL_13
          !word GAME_LEVEL_14
          !word GAME_LEVEL_15
          !word GAME_LEVEL_16
          !word GAME_LEVEL_17
          !word GAME_LEVEL_18
          !word GAME_LEVEL_19
          !word GAME_LEVEL_20
          !word GAME_LEVEL_21
          !word GAME_LEVEL_22
          !word GAME_LEVEL_23
          !word GAME_LEVEL_24
          !word GAME_LEVEL_25
          !word GAME_LEVEL_26
          !word GAME_LEVEL_27
          !word GAME_LEVEL_28
          !word GAME_LEVEL_29
          !word GAME_LEVEL_30
          !word GAME_LEVEL_31
          !word GAME_LEVEL_32
          !word GAME_LEVEL_33
          !word GAME_LEVEL_34
          !word GAME_LEVEL_35
          !word GAME_LEVEL_36
          !word GAME_LEVEL_37
          !word GAME_LEVEL_38
          !word GAME_LEVEL_39
          !word GAME_LEVEL_40
          !word GAME_LEVEL_41
          !word GAME_LEVEL_42
          !word GAME_LEVEL_43
          !word GAME_LEVEL_44
          !word GAME_LEVEL_45
          !word GAME_LEVEL_46
          !word GAME_LEVEL_47
          !word GAME_LEVEL_48
          !word GAME_LEVEL_49
          !word GAME_LEVEL_50
          !word GAME_LEVEL_51
          !word GAME_LEVEL_52
          !word GAME_LEVEL_53
          !word GAME_LEVEL_54
          !word GAME_LEVEL_55
          !word GAME_LEVEL_56
          !word GAME_LEVEL_57
          !word GAME_LEVEL_58
          !word GAME_LEVEL_59
          !word GAME_LEVEL_60
          !word GAME_LEVEL_61
          !word GAME_LEVEL_62
          !word GAME_LEVEL_63
          !word GAME_LEVEL_64
          !word GAME_LEVEL_65
          !word GAME_LEVEL_66
          !word GAME_LEVEL_67
          !word GAME_LEVEL_68
          

;------------------------------------------------------------
;game variables
;------------------------------------------------------------

LEVEL_EXIT_N
          !byte  1, 0, 0, 2, 5, 6, 0, 8, 0,11
          !byte 12,13,14, 0, 0,16, 0,18, 0,20     ;room 11
          !byte 21,22, 0,24, 0, 0, 0, 0, 0, 0
          !byte  0, 0,33,34, 0, 0,37, 0,39, 0
          !byte  0, 0,43, 0,45,46, 0, 0,49, 0
          !byte  0, 0,53,54, 0, 0, 0, 0,59, 0
          !byte 61, 0, 0, 0, 0, 0, 0,68, 0,70
          !byte 71, 0, 0,74,75, 0
LEVEL_EXIT_S
          !byte  0, 0, 3, 0, 0, 4, 5, 0, 7, 0
          !byte  0, 9,10,11,12, 0,15, 0,17, 0
          !byte 19,20,21, 0,23, 0, 0, 0, 0, 0
          !byte  0, 0, 0,32,33, 0, 0,36, 0,38
          !byte  0, 0, 0,42, 0,44,45, 0, 0,48
          !byte  0, 0, 0,52,53, 0, 0, 0, 0,58
          !byte  0,60, 0, 0, 0, 0, 0, 0,67, 0
          !byte 69,70, 0, 0,73,74
LEVEL_EXIT_W
          !byte  0, 0, 1, 0, 3, 0, 7, 0, 0, 8
          !byte  9, 0, 0, 0,13,10, 0, 0, 0,16
          !byte  0,18, 0, 0,19,20, 0, 0, 0,23
          !byte  0,25,26,27,28, 0, 0,30,31,32
          !byte 33,34,35, 0,37, 0,39,40,41,42
          !byte 43, 0, 0, 0,47,48,49,50,51, 0
          !byte 53, 0,55,56,58,59,60,61,62,64
          !byte 65,66,67,69, 0, 0
LEVEL_EXIT_E
          !byte  0, 2, 0, 4, 0, 0, 0, 6, 9,10
          !byte 15, 0, 0,14, 0, 0,19, 0,21,24
          !byte 25, 0, 0,29, 0,31,32,33,34, 0
          !byte 37,38,39,40,41,42, 0,44, 0,46
          !byte 47,48,49,50, 0, 0, 0,54,55,56
          !byte 57,58, 0,60, 0,62,63, 0,64,65
          !byte 66,67,68, 0,69,70,71,72, 0,73
          !byte  0, 0, 0, 0, 0, 0

PLAYER_START_X
          !byte 19
PLAYER_JUMP_TABLE
          !byte 8,8,7,6,6,5,3,2,1,1,0
FALL_SPEED_TABLE
          !byte 1,1,1,1,2,2,2,3,4,4,5,6
PLAYER_START_Y
          !byte 6

PLAYER_HEALTH
          !byte 6
PLAYER_PUZZLE_PARTS
          !byte 96,96,96,96,96,96,96,96,96,96,96,96

PLAYER_START_LEVEL
          !byte 0

MAGIC_POS
          !byte 0
MAGIC_DELAY
          !byte 0
HSCROLL_POINTER
          !word 0

LEVEL_NR  
          !byte 0
BUTTON_RELEASED
          !byte 0
DOWN_RELEASED
          !byte 0
LEFT_RELEASED
          !byte 0
RIGHT_RELEASED
          !byte 0
PLAY_TIME_FRAME
          !byte 0
PLAY_TIME_SECONDS
          !byte 0
PLAY_TIME_MINUTES
          !byte 0

TITLE_COLOR_OFFSET  
          !byte 0

PLAYER_JUMP_POS
          !byte 0
PLAYER_FALL_POS
          !byte 0
PLAYER_FALL_HEIGHT
          !byte 0
PLAYER_LIVES
          !byte 0
PLAYER_CROUCHING
          !byte 0
PLAYER_AUTO_CROUCH
          !byte 0
PLAYER_SEARCHING
          !byte 0
PLAYER_SEARCH_POS
          !byte 0
PLAYER_PUZZLE_MODE
          !byte 0
PUZZLE_OFFSET
          !byte 0
PUZZLE_CURSOR
          !byte 0
GAME_WAS_STARTED
          !byte 0
GAME_COMPLETE
          !byte 0
GAME_FRAME
          !byte 0
GAME_FRAME_2
          !byte 0
          
PLAYER_JUMPAUTOMOVE     ;0 = none, 1 = right, 2 = left
          !byte 0
PLAYER_JUMP_DELAY
          !byte 0
          
PLAYER_CHANGED_ROOM
          !byte 0
PLAYER_KEY
          !byte 0,0,0
;2 bytes for title screen, left/right          
PLAYER_STAND_STILL_COUNT
          !byte 0,0
PLAYER_FLASH_POS
          !byte 0
          
PLAYER_COLLECTED_PUZZLE_PARTS
          !byte 0
PLAYER_PUZZLE_PIECE_FLASH_POS
          !byte 0
GAME_PUZZLE_PARTS
          !byte 0,0,0,0,0,0,0,0,0,0,0,0
GAME_PUZZLE_PART_ITEM_LO
          !byte 0,0,0,0,0,0,0,0,0,0,0,0
GAME_PUZZLE_PART_ITEM_HI
          !byte 0,0,0,0,0,0,0,0,0,0,0,0
SCREEN_PUZZLE_PARTS
          !byte 0,0,0,0,0,0,0,0,0,0,0,0
SOLUTION_PUZZLE_PARTS          
          !byte 0,0,0,0,0,0,0,0,0,0,0,0
          
CURRENT_CHARSET
          !byte 0
PLAYER_INVINCIBLE
          !byte 0
          
SPRITE_POS_X
          !byte 0,0,0,0,0,0,0,0
SPRITE_POS_X_EXTEND
          !byte 0
SPRITE_CHAR_POS_X
          !byte 0,0,0,0,0,0,0,0
SPRITE_CHAR_POS_X_DELTA
          !byte 0,0,0,0,0,0,0,0
SPRITE_CHAR_POS_Y
          !byte 0,0,0,0,0,0,0,0
SPRITE_CHAR_POS_Y_DELTA
          !byte 0,0,0,0,0,0,0,0
SPRITE_POS_Y
          !byte 0,0,0,0,0,0,0,0
SPRITE_ACTIVE
          !byte 0,0,0,0,0,0,0,0
SPRITE_DIRECTION
          !byte 0,0,0,0,0,0,0,0
SPRITE_DIRECTION_Y          
          !byte 0,0,0,0,0,0,0,0
SPRITE_FALLING
          !byte 0,0
SPRITE_ANIM_POS
          !byte 0,0,0,0,0,0,0,0
SPRITE_ANIM_DELAY
          !byte 0,0,0,0,0,0,0,0
SPRITE_MOVE_POS
          !byte 0,0,0,0,0,0,0,0
SPRITE_MOVE_POS_Y          
          !byte 0,0,0,0,0,0,0,0
SPRITE_SPEED
          !byte 0,0,0,0,0,0,0,0
SPRITE_BEHAVIOUR
          !byte 0,0,0,0,0,0,0,0
SPRITE_BORDER_1
          !byte 0,0,0,0,0,0,0,0
SPRITE_BORDER_2
          !byte 0,0,0,0,0,0,0,0
SPRITE_STATE
          !byte 0,0,0,0,0,0,0,0
SPRITE_HOMING_DELAY
          !byte 0,0,0,0,0,0,0,0
SPRITE_FIRE_DELAY          
          !byte 0,0,0,0,0,0,0,0
          
ITEM_ACTIVE
          !fill ITEM_COUNT,0
ITEM_POS_X
          !fill ITEM_COUNT,0
ITEM_POS_Y
          !fill ITEM_COUNT,0
ITEM_ID_LO
          !fill ITEM_COUNT,0
ITEM_ID_HI
          !fill ITEM_COUNT,0
          
SEARCH_BAR_LOCATION
          !word 0
SEARCH_BACK_CHAR
          !byte 0,0,0,0
SEARCH_BACK_COLOR
          !byte 0,0,0,0
SEARCH_BAR_CHAR          
          !byte 1,2,2,3
SEARCH_BAR_COLOR
          !byte 7,7,7,7
SEARCH_ANIM_TABLE
          !byte 0,1,2,1
          
COLOR_FADE_TABLE
          !byte 11,1,10,1,10,13,14,1,7,8,1,12,15,1,1,1
           
MAGIC_BORDER_TABLE 
          !byte 0
          !byte 6,14,3,14,6,0     ;blue
          !byte 5,13,1,13,5,0     ;green
          !byte 2,10,1,10,2,0     ;red

          
          
PLAYER_INVINCIBLE_COLORS
          !byte PLAYER_SPRITE_COLOR
          !byte 13
          !byte 1
          !byte 13
PUZZLE_FLASH_COLORS
          !byte 0
          !byte 6
          !byte 4
          !byte 2
          !byte 2
          !byte 4
          !byte 6
          !byte 0
          
PLAYER_FLASH_COLORS
          !byte 5
          !byte 8
          !byte 9
          !byte 0
          !byte 0
          !byte 9
          !byte 8
          !byte 5
          
ENEMY_SPELL
          !byte 0
ENEMY_SPELL_COUNT
          !byte 0
FREEZE_DELAY_COUNT
          !byte 0

BEHAVIOUR_QUICKER
          !byte 0
          
SAVE_SPOT_COLOR_FADE
          ;!byte 1,13,5,13,1
          !byte 1,3,6,3,1
          
          
;TYPE_SPIDER             = 5
;TYPE_SAVE_SPOT          = 6
;TYPE_SNAKE              = 7
;TYPE_FIREHEAD_RIGHT     = 8
;TYPE_FIREHEAD_LEFT      = 9
;TYPE_FIRE_RIGHT         = 10
;TYPE_FIRE_LEFT          = 11
;TYPE_GNAT               = 12
;TYPE_KEY                = 13
;TYPE_PURPLE_BLOCK       = 14
;TYPE_SOUL_CONTAINER     = 15
          
ENEMY_BEHAVIOUR_TABLE_LO          
          !byte <NoBehaviour        ;player top
          !byte <PlayerControl      ;player bottom
          !byte <BehaviourWalker
          !byte <BehaviourBird
          !byte <BehaviourSpider    ;spider
          !byte <BehaviourSaveSpot  ;save spot
          !byte <BehaviourSnake     ;snake
          !byte <BehaviourFireHead  ;fire head right
          !byte <BehaviourFireHead  ;fire head left
          !byte <BehaviourFire      ;fire left
          !byte <BehaviourFire      ;fire right
          !byte <BehaviourGnat      ;gnat
          !byte <NoBehaviour        ;key
          !byte <BehaviourPurple    ;purple block
          !byte <BehaviourSoulContainerTop       ;soul container
          !byte <BehaviourMobileTrap;mobile spike
          !byte <BehaviourSkull     ;white skull
          !byte <BehaviourGhost     ;ghost
          !byte <BehaviourBigHead   ;fire head
          !byte <BehaviourPurple    ;purple block right
          !byte <BehaviourFollowR   ;fire head ur
          !byte <BehaviourFollowD   ;fire head ll
          !byte <BehaviourFollowDR  ;fire head lr
          !byte <BehaviourExplosion ;explosion
          !byte <BehaviourSoulContainerBottom        ;soul container bottom
          !byte <BehaviourGhostBottom  ;ghost bottom
          !byte <BehaviourFire      ;fire down
          
ENEMY_BEHAVIOUR_TABLE_HI
          !byte >NoBehaviour        ;player top
          !byte >PlayerControl      ;player bottom
          !byte >BehaviourWalker
          !byte >BehaviourBird
          !byte >BehaviourSpider    ;spider
          !byte >BehaviourSaveSpot  ;save spot
          !byte >BehaviourSnake     ;snake
          !byte >BehaviourFireHead  ;fire head right
          !byte >BehaviourFireHead  ;fire head left
          !byte >BehaviourFire      ;fire left
          !byte >BehaviourFire      ;fire right
          !byte >BehaviourGnat      ;gnat
          !byte >NoBehaviour        ;key
          !byte >BehaviourPurple    ;purple block
          !byte >BehaviourSoulContainerTop        ;soul container
          !byte >BehaviourMobileTrap;mobile spike
          !byte >BehaviourSkull     ;white skull
          !byte >BehaviourGhost     ;ghost
          !byte >BehaviourBigHead   ;fire head
          !byte >BehaviourPurple    ;purple block right
          !byte >BehaviourFollowR   ;fire head ur
          !byte >BehaviourFollowD   ;fire head ll
          !byte >BehaviourFollowDR  ;fire head lr
          !byte >BehaviourExplosion ;explosion
          !byte >BehaviourSoulContainerBottom        ;soul container bottom
          !byte >BehaviourGhostBottom  ;ghost bottom
          !byte >BehaviourFire      ;fire down
          
IS_TYPE_ENEMY
          !byte 0     ;dummy entry for inactive object
          !byte 0     ;player top
          !byte 0     ;player bottom
          !byte 1     ;walker
          !byte 1     ;bird
          !byte 1     ;spider
          !byte 3     ;save spot
          !byte 1     ;snake
          !byte 0     ;fire head right
          !byte 0     ;fire head left
          !byte 1     ;fire left
          !byte 1     ;fire right
          !byte 1     ;gnat
          !byte 2     ;key
          !byte 1     ;purple block
          !byte 0     ;soul container
          !byte 1     ;mobile spike
          !byte 1     ;white skull
          !byte 1     ;ghost
          !byte 1     ;fire head
          !byte 1     ;purple block right
          !byte 1     ;fire head ur
          !byte 1     ;fire head ll
          !byte 1     ;fire head lr
          !byte 0     ;explosion
          !byte 0     ;soul container bottom
          !byte 1     ;ghost bottom
          !byte 1     ;fire down
          
TYPE_START_SPRITE_OFFSET_X
          !byte 0     ;dummy entry for inactive object
          !byte 0     ;player top
          !byte 0     ;player bottom
          !byte 0     ;walker
          !byte 0     ;bird
          !byte 0     ;spider
          !byte 4     ;save spot
          !byte 0     ;snake
          !byte 0     ;fire head right
          !byte 0     ;fire head left
          !byte 0     ;fire left
          !byte 0     ;fire right
          !byte 0     ;gnat
          !byte 4     ;key
          !byte 0     ;purple block
          !byte 4     ;soul container
          !byte 0     ;mobile spike
          !byte 0     ;white skull
          !byte 0     ;ghost
          !byte 0     ;fire head
          !byte 0     ;purple block right
          !byte 0     ;fire head ur
          !byte 0     ;fire head ll
          !byte 0     ;fire head lr
          !byte 0     ;explosion
          !byte 4     ;soul container bottom
          !byte 0     ;ghost bottom
          !byte 0     ;fire down
          
TYPE_START_SPRITE_OFFSET_Y
          !byte 0     ;dummy entry for inactive object
          !byte 0     ;player top
          !byte 0     ;player bottom
          !byte 2     ;walker
          !byte 0     ;bird
          !byte 1     ;spider
          !byte 2     ;save spot
          !byte 2     ;snake
          !byte 0     ;fire head right
          !byte 0     ;fire head left
          !byte 0     ;fire left
          !byte 0     ;fire right
          !byte 0     ;gnat
          !byte 0     ;key
          !byte 2     ;purple block
          !byte 0     ;soul container
          !byte 2     ;mobile spike
          !byte 0     ;white skull
          !byte 0     ;ghost
          !byte 0     ;fire head
          !byte 2     ;purple block right
          !byte 0     ;fire head ur
          !byte 3     ;fire head ll
          !byte 3     ;fire head lr
          !byte 0     ;explosion
          !byte 3     ;soul container bottom
          !byte 3     ;ghost bottom
          !byte 0     ;fire left
          
colors
          !byte $06,$06,$06,$0e,$06,$0e
          !byte $0e,$06,$0e,$0e,$0e,$03
          !byte $0e,$03,$03,$0e,$03,$03
          !byte $03,$01,$03,$01,$01,$03
          !byte $01,$01,$01,$03,$01,$01
          !byte $03,$01,$03,$03,$03,$0e
          !byte $03,$03,$0e,$03,$0e,$0e
          !byte $0e,$06,$0e,$0e,$06,$0e
          !byte $06,$06,$06,$00,$00,$09
 
          
TYPE_START_SPRITE
          !byte 0     ;dummy entry for inactive object
          !byte SPRITE_PLAYER_STAND_R_TOP
          !byte SPRITE_PLAYER_STAND_R_BOTTOM
          !byte SPRITE_WALKER_WALK_R_1
          !byte SPRITE_BIRD_FLY_R_1
          !byte SPRITE_SPIDER_R_1
          !byte SPRITE_SAVE_SPOT_1
          !byte SPRITE_SNAKE_R_1
          !byte SPRITE_FIRE_HEAD_RIGHT_1
          !byte SPRITE_FIRE_HEAD_LEFT_1
          !byte SPRITE_FIRE_LEFT
          !byte SPRITE_FIRE_RIGHT
          !byte SPRITE_GNAT_1
          !byte SPRITE_KEY
          !byte SPRITE_PURPLE_BLOCK_L
          !byte SPRITE_SOUL_CONTAINER_T_1
          !byte SPRITE_SPIKE_TRAP_1
          !byte SPRITE_WHITE_SKULL_1
          !byte SPRITE_GHOST_1
          !byte SPRITE_FIRE_HEAD_UL
          !byte SPRITE_PURPLE_BLOCK_R
          !byte SPRITE_FIRE_HEAD_UR
          !byte SPRITE_FIRE_HEAD_LL
          !byte SPRITE_FIRE_HEAD_LR
          !byte SPRITE_EXPLOSION_1
          !byte SPRITE_SOUL_CONTAINER_B_1
          !byte SPRITE_GHOST_B_1
          !byte SPRITE_FIRE_DOWN

PING_PONG_ANIM_TABLE
          !byte 0,1,2,1
          
          ; health
          ; puzzle piece
          ; gold (score)
          ; temp. invincibility
          
          ; IIIICCCC
          ; IIII     = item
          ;     CCCC = search count
SEARCH_ITEM_STATE
          !fill SEARCH_ITEM_COUNT,255
          
          
TEXT_PANEL
          !text 0,16,1,2,3,4,5,6,7,8,9,10,8,11,12,13,14,15,33,17,18,19,20,21,22,23,24,25,26,27,25,28,2,3,4,5,6,29,30,0
          !text 0,31,32,90,83,0,0,0,34,35,36,37,38,39,40,41,42,0,0,0,0,0,0,43,44,45,46,47,48,49,50,51,0,0,0,0,0,52,53,0
          !text 0,54,55,56,57,58,59,60,61,62,63,0,0,0,0,64,65,66,67,17,18,68,69,70,71,0,0,0,0,72,73,74,56,57,58,59,60,75,76,0,255
 
TEXT_TITLE_LOGO
          !text   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,176,177,178,177,179,$fe
          !text 112,113,114,115,116,117,118,119,120,121,122,123,192,193,192,193,194,124,125,126,112,113,114,115,112,113,114,115,$fe
          !text 128,129,130,131,132,133,134,135,136,137,138,139,208,209,208,209,  0,140,141,142,128,129,130,131,128,129,130,131,$fe
          !text 144,145,146,147,148,149,150,151,152,153,154,155,224,225,224,225,  0,156,157,158,144,145,146,147,144,145,146,147,$fe
          !text 160,161,162,  0,  0,165,166,  0,168,169,170,  0, 91, 92, 93, 94, 95,  0,173,174,160,161,162,  0,160,161,162,$ff
          
TEXT_HEALTH
          !byte 90,83,0,77,77,255
          
TEXT_SCORE
          !byte 80,80,80,80,80,80,255

TEXT_PUZZLE
          !byte 96,96,96,96,96,255

TEXT_ITEM_LO
          !byte <TEXT_ITEM_EMPTY
          !byte <TEXT_ITEM_HEALTH
          !byte <TEXT_ITEM_GOLD
          !byte <TEXT_ITEM_AURA
          !byte <TEXT_ITEM_PUZZLE_PIECE
          !byte <TEXT_ITEM_RED_MAGIC
          !byte <TEXT_ITEM_BLUE_MAGIC
          !byte <TEXT_ITEM_GREEN_MAGIC
          !byte <TEXT_ITEM_LIVE
          !byte <TEXT_ITEM_RUBY
TEXT_ITEM_HI
          !byte >TEXT_ITEM_EMPTY
          !byte >TEXT_ITEM_HEALTH
          !byte >TEXT_ITEM_GOLD
          !byte >TEXT_ITEM_AURA
          !byte >TEXT_ITEM_PUZZLE_PIECE
          !byte >TEXT_ITEM_RED_MAGIC
          !byte >TEXT_ITEM_BLUE_MAGIC
          !byte >TEXT_ITEM_GREEN_MAGIC
          !byte >TEXT_ITEM_LIVE
          !byte >TEXT_ITEM_RUBY

!ct raw
!ct 'A',17,'B',18,'C',19,'D',20,'E',21,'F',22,'G',23,'H',24,'I',25,'J',26,'K',27,'L',28
!ct 'M',29,'N',30,'O',31,'P',32,'Q',33,'R',34,'S',35,'T',36,'U',37,'V',38,'W',39,'X',40
!ct 'Y',41,'Z',42
!ct '*',$ff,' ',8


          
TEXT_ITEM_EMPTY    ;            Y  O  U     F  O  U  N  D     N  O  T  H  I  N  G
          !text "    YOU FOUND NOTHING*"
          
TEXT_ITEM_HEALTH
          !text "   YOU FOUND A POTION*"
          
TEXT_ITEM_GOLD          
          !text "     YOU FOUND GOLD*"
          
TEXT_ITEM_AURA
          !text "YOU FOUND A STONE AMULET*"
          
TEXT_ITEM_PUZZLE_PIECE
          !text "YOU FOUND A SPIRIT STONE*"
          
TEXT_ITEM_RED_MAGIC
          !text "   YOU FOUND RED MAGIC*"
          
TEXT_ITEM_GREEN_MAGIC
          !text "  YOU FOUND GREEN MAGIC*"
          
TEXT_ITEM_BLUE_MAGIC
          !text "   YOU FOUND BLUE MAGIC*"
          
TEXT_ITEM_LIVE
          !text " YOU FOUND AN EXTRA LIFE*"

TEXT_ITEM_RUBY      ;YOU FOUND A BIG RUBY
          !text "  YOU FOUND A BIG RUBY*"
CHEAT_CODE
          !byte 0,0,0,0
CHEAT_CORRECT
          !byte $47,$52,$54,$53 ;GRTS
CHEAT_POS
          !byte 0

!ifndef COMPILE_CRUNCHED {          
CHARSET
          !binary "soulless1.chr"
          !binary "soulless2.chr"
          
CHARSET_PANEL
          !binary "panel.chr",1808
          
          
SPRITES
!ifdef SPRITES_V1 {
          !binary "soulless_v1.spr"
} else {
          !binary "soulless.spr" 
}

}