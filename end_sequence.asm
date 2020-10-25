;compile to this filename

!ifdef BUILD_CARTRIDGE {
!to "endgamecartridge.prg",plain
} else {

!ifdef COMPILE_CRUNCHED {
!to "endgame.prg",plain
} else { 
!to "endgame.prg",cbm
}
}

IRQ_RETURN_KERNAL = $ea81

;optimize level data, element repeat und Y zusammenlegen?

;memory layout
;backup color/screen    $0400 to $07FF
;charset panel          $C000 to $C7FF
;screen                 $CC00 to $CFFF
;sprites                $D000 to $EFFF (128 sprites)
;charset 1              $F000 to $F7FF
;charset 2              $F800 to $FFFF

;define constants here
GAME_RESULT_DATA = $300

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

FIREWORK_EXPLOSION_SPEED = 6
MUSIC_PLAYER            = $1000

!ifdef BUILD_FOR_TAPE {
LOAD_CODE = $02a8
} else {
LOAD_CODE = $FCE2
}

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

;address of the screen buffer
SCREEN_CHAR             = $CC00

;address of color ram
SCREEN_COLOR            = $D800

;address of sprite pointers
SPRITE_POINTER_BASE     = SCREEN_CHAR + 1016

;number of sprites divided by four
NUMBER_OF_SPRITES_DIV_4 = 128 / 4

BOTTOM_BORDER_RASTER_POS  = 226 

;offset from calculated char pos to true sprite pos
SPRITE_CENTER_OFFSET_X  = 8
SPRITE_CENTER_OFFSET_Y  = 11

;sprite number constant
SPRITE_BASE             = 64

SPRITE_TORCH_1          = SPRITE_BASE + 61
SPRITE_TORCH_2          = SPRITE_BASE + 62
SPRITE_TORCH_3          = SPRITE_BASE + 63
SPRITE_TORCH_4          = SPRITE_BASE + 64

SPRITE_PLAYER_UL_1      = SPRITE_BASE + 0
SPRITE_PLAYER_UR_1      = SPRITE_BASE + 1
SPRITE_PLAYER_LL_1      = SPRITE_BASE + 4
SPRITE_PLAYER_LR_1      = SPRITE_BASE + 5

SPRITE_PLAYER_UL_2      = SPRITE_BASE + 2
SPRITE_PLAYER_UR_2      = SPRITE_BASE + 3
SPRITE_PLAYER_LL_2      = SPRITE_BASE + 6
SPRITE_PLAYER_LR_2      = SPRITE_BASE + 7

SPRITE_PLAYER_UL_3      = SPRITE_BASE + 8
SPRITE_PLAYER_UR_3      = SPRITE_BASE + 9
SPRITE_PLAYER_ML_3      = SPRITE_BASE + 12
SPRITE_PLAYER_MR_3      = SPRITE_BASE + 13
SPRITE_PLAYER_LL_3      = SPRITE_BASE + 16
SPRITE_PLAYER_LR_3      = SPRITE_BASE + 17

SPRITE_PLAYER_UL_4      = SPRITE_BASE + 10
SPRITE_PLAYER_UR_4      = SPRITE_BASE + 11
SPRITE_PLAYER_ML_4      = SPRITE_BASE + 14
SPRITE_PLAYER_MR_4      = SPRITE_BASE + 15
SPRITE_PLAYER_LL_4      = SPRITE_BASE + 18
SPRITE_PLAYER_LR_4      = SPRITE_BASE + 19

SPRITE_PLAYER_UL_5      = SPRITE_BASE + 20
SPRITE_PLAYER_UR_5      = SPRITE_BASE + 21
SPRITE_PLAYER_ML_5      = SPRITE_BASE + 24
SPRITE_PLAYER_MR_5      = SPRITE_BASE + 25
SPRITE_PLAYER_LL_5      = SPRITE_BASE + 28
SPRITE_PLAYER_LR_5      = SPRITE_BASE + 29

SPRITE_INVISIBLE        = SPRITE_BASE + 26

SPRITE_PLAYER_FLASH_UL_1  = SPRITE_BASE + 32
SPRITE_PLAYER_FLASH_UR_1  = SPRITE_BASE + 33
SPRITE_PLAYER_FLASH_LL_1  = SPRITE_BASE + 36
SPRITE_PLAYER_FLASH_LR_1  = SPRITE_BASE + 37

SPRITE_PLAYER_FLASH_UL_2  = SPRITE_BASE + 34
SPRITE_PLAYER_FLASH_UR_2  = SPRITE_BASE + 35
SPRITE_PLAYER_FLASH_LL_2  = SPRITE_BASE + 38
SPRITE_PLAYER_FLASH_LR_2  = SPRITE_BASE + 39

SPRITE_PLAYER_FLASH_UL_3  = SPRITE_BASE + 40
SPRITE_PLAYER_FLASH_UR_3  = SPRITE_BASE + 41
SPRITE_PLAYER_FLASH_LL_3  = SPRITE_BASE + 44
SPRITE_PLAYER_FLASH_LR_3  = SPRITE_BASE + 45

SPRITE_PLAYER_FLASH_UL_4  = SPRITE_BASE + 42
SPRITE_PLAYER_FLASH_UR_4  = SPRITE_BASE + 43
SPRITE_PLAYER_FLASH_LL_4  = SPRITE_BASE + 46
SPRITE_PLAYER_FLASH_LR_4  = SPRITE_BASE + 47

SPRITE_FLAG_1             = SPRITE_BASE + 48
SPRITE_FLAG_2             = SPRITE_BASE + 49
SPRITE_FLAG_3             = SPRITE_BASE + 50
SPRITE_FLAG_4             = SPRITE_BASE + 51

SPRITE_PLAYER_RUN_1       = SPRITE_BASE + 52
SPRITE_PLAYER_RUN_2       = SPRITE_BASE + 53
SPRITE_PLAYER_RUN_3       = SPRITE_BASE + 54

SPRITE_PLAYER_STAND       = SPRITE_BASE + 55
SPRITE_PLAYER_DRAW_SWORD_1  = SPRITE_BASE + 56
SPRITE_PLAYER_DRAW_SWORD_2  = SPRITE_BASE + 57
SPRITE_PLAYER_DRAW_SWORD_3  = SPRITE_BASE + 58
SPRITE_PLAYER_DRAW_SWORD_4  = SPRITE_BASE + 59
SPRITE_PLAYER_DRAW_SWORD_5  = SPRITE_BASE + 60

SPRITE_BIRD_1             = SPRITE_BASE + 65
SPRITE_BIRD_2             = SPRITE_BASE + 66
SPRITE_BIRD_3             = SPRITE_BASE + 67

SPRITE_ROCKET_SMALL       = SPRITE_BASE + 22
SPRITE_ROCKET             = SPRITE_BASE + 23

SPRITE_EXPLOSION_UL_0     = SPRITE_BASE + 68
SPRITE_EXPLOSION_UR_0     = SPRITE_BASE + 69
SPRITE_EXPLOSION_LL_0     = SPRITE_BASE + 72
SPRITE_EXPLOSION_LR_0     = SPRITE_BASE + 73

SPRITE_EXPLOSION_UL_1     = SPRITE_BASE + 70
SPRITE_EXPLOSION_UR_1     = SPRITE_BASE + 71
SPRITE_EXPLOSION_LL_1     = SPRITE_BASE + 74
SPRITE_EXPLOSION_LR_1     = SPRITE_BASE + 75

SPRITE_EXPLOSION_UL_2     = SPRITE_BASE + 76
SPRITE_EXPLOSION_UR_2     = SPRITE_BASE + 77
SPRITE_EXPLOSION_LL_2     = SPRITE_BASE + 80
SPRITE_EXPLOSION_LR_2     = SPRITE_BASE + 81

SPRITE_EXPLOSION_UL_3     = SPRITE_BASE + 78
SPRITE_EXPLOSION_UR_3     = SPRITE_BASE + 79
SPRITE_EXPLOSION_LL_3     = SPRITE_BASE + 82
SPRITE_EXPLOSION_LR_3     = SPRITE_BASE + 83

SPRITE_EXPLOSION_UL_4     = SPRITE_BASE + 84
SPRITE_EXPLOSION_UR_4     = SPRITE_BASE + 85
SPRITE_EXPLOSION_LL_4     = SPRITE_BASE + 88
SPRITE_EXPLOSION_LR_4     = SPRITE_BASE + 89

SPRITE_EXPLOSION_UL_5     = SPRITE_BASE + 92
SPRITE_EXPLOSION_UR_5     = SPRITE_BASE + 93
SPRITE_EXPLOSION_LL_5     = SPRITE_BASE + 96
SPRITE_EXPLOSION_LR_5     = SPRITE_BASE + 97

SPRITE_EXPLOSION_UL_6     = SPRITE_BASE + 94
SPRITE_EXPLOSION_UR_6     = SPRITE_BASE + 95
SPRITE_EXPLOSION_LL_6     = SPRITE_BASE + 98
SPRITE_EXPLOSION_LR_6     = SPRITE_BASE + 99



;level data constants
LD_END                  = $80
LD_LINE_H               = $81    ;data contains x,y,width,char,color
LD_OBJECT               = $82    ;data contains x,y,type
LD_ELEMENT              = $83    ;single element block
LD_ELEMENT_LINE_V       = $84    ;element block line V
LD_SPECIAL              = $85    ;special use
LD_AREA                 = $86    ;area


TYPE_TORCH              = 1
TYPE_PLAYERUL           = 2
TYPE_PLAYERUR           = 3
TYPE_PLAYERLL           = 4
TYPE_PLAYERLR           = 5
TYPE_PLAYERFEETL        = 6
TYPE_PLAYERFEETR        = 7
TYPE_INVISIBLE          = 8
TYPE_FLAG               = 9
TYPE_RUNNING_PLAYER     = 10
TYPE_BIRD               = 11
TYPE_ROCKET             = 12
TYPE_EXPLOSION_1        = 13
TYPE_EXPLOSION_2        = 14
TYPE_EXPLOSION_3        = 15 
TYPE_EXPLOSION_4        = 16


!ifndef COMPILE_CRUNCHED {
*=$0801

          ;SYS 2064
          !byte $0C,$08,$0A,$00,$9E,$20,$32,$30,$36,$34,$00,$00,$00,$00,$00
} else {
*=$080A
}
          ;init sprite registers
          ;no visible sprites
          ;background black
          lda #0
          sta VIC_SPRITE_ENABLE
          sta VIC_BACKGROUND_COLOR
          sta VIC_BORDER_COLOR
          sta VIC_SPRITE_X_EXTEND
          sta VIC_SPRITE_MULTICOLOR
          
          ;VIC bank
          lda CIA_PRA
          and #$fc
          sta CIA_PRA
          
          ;----------------------------------
          ;copy charset and sprites to target          
          ;----------------------------------

!ifndef COMPILE_CRUNCHED {          
          ;block interrupts 
          ;since we turn ROMs off this would result in crashes if we didn't
          sei
          
          ;only RAM 
          ;to copy under the IO rom
          lda #%00110000
          sta $01
          

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
          lda #$36
          sta $01
          cli
}

          ;set charset multi colors
          lda #9
          sta VIC_CHARSET_MULTICOLOR_1
          lda #7
          sta VIC_CHARSET_MULTICOLOR_2 
          sta VIC_SPRITE_MULTICOLOR_2
          ;enable multi color charset
          lda VIC_CONTROL
          ora #$10
          sta VIC_CONTROL

          ;sprite multi colors
          lda #2
          sta VIC_SPRITE_MULTICOLOR_1

          ;set charset 2
          lda #$3e
          sta VIC_MEMORY_CONTROL

!ifndef BUILD_CARTRIDGE {
          ;check if $17 is in the game data to avoid cheating
          lda GAME_RESULT_DATA
          cmp #$17
          bne .Cheater
          lda GAME_RESULT_DATA + 1
          cmp #$17
          bne .Cheater
          lda GAME_RESULT_DATA + 2
          cmp #$17
          bne .Cheater
          jmp +
          
.Cheater          
          ;set charset 2
          lda #$3e
          sta VIC_MEMORY_CONTROL
          
          ;clear screen
          lda #0
          ldy #6
          jsr ClearScreen
          
          ;display cheat message
          lda #4
          sta SCENE_TEXT
          lda #0
          sta SCENE_TEXT_POS
          sta SCENE_TEXT_DELAY
          sta SCENE_TEXT_SCREEN_POS
          
-          
          jsr WaitFrame
          jsr UpdateSceneText
          
          lda #10
          sta SCENE_TEXT_DONE_DELAY
          jmp -
+          
}


!ifndef NO_MUSIC {          
          ;start music
          lda #0
          jsr MUSIC_PLAYER
}
          
!zone MainLoop
          ;Title level 
          ;lda #0
          ;sta SCENE_FRAME_POS
          ;sta LEVEL_NR
          ;sta SCENE_NR
          jsr BuildScreen
          
          jsr InitGameIRQ
          
.TitleLoop          
          jsr WaitFrame
          
          jsr ObjectControl
          jsr SceneControl 

          lda #$10
          bit JOYSTICK_PORT_II
          bne .TitleLoop
          
          jsr ReleaseGameIRQ
          
          lda #$37
          sta $01
          
          ;SID resetten
          ldy #0
          tya
          ;lda #0
.sidloop
          sta $d400,y
          iny
          cpy #$19
          bne .sidloop
          
          lda #0
          sta VIC_SPRITE_ENABLE
          sta PARAM1
          
!ifdef BUILD_CARTRIDGE {
          ldy #2
          jmp $0400
} else {
          ldy #1
          ;use A/Y to clear
          jsr ClearScreen

          jmp LOAD_CODE
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
          lda ZONE_SPRITE_RASTER_POS
          sta VIC_RASTER_POS

          ;MSB of d011 is the MSB of the requested rasterline
          ;as rastercounter goes from 0-312
          lda #$1b
          ;lda VIC_CONTROL_MODE
          ;and #$7f
          sta VIC_CONTROL_MODE

          ;set irq vector to point to our routine
          lda #<IrqZone
          sta $0314
          lda #>IrqZone
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
;Setup next zone
;------------------------------------------------------------
!zone IrqZone
IrqZone
          ;acknowledge VIC irq
          lda $d019
          sta $d019
          
          lda CURRENT_IRQ_ZONE
          cmp ZONE_COUNT
          bcc +
          
          lda #0
          sta CURRENT_IRQ_ZONE
+          
          
          lda CURRENT_IRQ_ZONE
          bne +

!ifndef NO_MUSIC {          
          jsr MUSIC_PLAYER + 3
}          
          
+          
          lda ZONE_COUNT
          beq +
          jsr SetupSpriteZone

          inc CURRENT_IRQ_ZONE
          lda CURRENT_IRQ_ZONE
          cmp ZONE_COUNT
          bne .SetupZone
          lda #0
          sta CURRENT_IRQ_ZONE

.SetupZone         
          ldy CURRENT_IRQ_ZONE
          lda ZONE_SPRITE_RASTER_POS,y
          sta VIC_RASTER_POS
 +
          JMP IRQ_RETURN_KERNAL



;------------------------------------------------------------
;Scene Management
;------------------------------------------------------------
!zone SceneControl
SceneControl
          ldy SCENE_NR
          
          lda SCENE_CODE_TABLE_LO,y
          sta .JumpPos + 1
          lda SCENE_CODE_TABLE_HI,y
          sta .JumpPos + 2
          
          
.JumpPos          
          jmp $a000
          
SCENE_CODE_TABLE_LO
          !byte <Scene1
          !byte <Scene2
          !byte <Scene3
          !byte <Scene4
SCENE_CODE_TABLE_HI
          !byte >Scene1
          !byte >Scene2
          !byte >Scene3
          !byte >Scene4
          
          
!zone Scene1
Scene1  
          jsr UpdateSceneText
          
          lda SCENE_FRAME_DELAY
          beq .ShowStep
          
          dec SCENE_FRAME_DELAY
          rts
          
.ShowStep          
          ldy SCENE_FRAME_POS
          ldx SCENE_1_STEPS,y
          dex
          lda SCENE_1_STEP_POINTER_LO,x
          sta .JumpPos + 1
          lda SCENE_1_STEP_POINTER_HI,x
          sta .JumpPos + 2
          lda SCENE_1_STEPS_PAUSE,y
          sta SCENE_FRAME_DELAY
          beq .SceneDone
          inc SCENE_FRAME_POS
          
          lda SCENE_FRAME_POS
          cmp #40
          bne .JumpPos
          
          ;show next text
          lda #1
          sta SCENE_TEXT
          lda #0
          sta SCENE_TEXT_POS
          sta SCENE_TEXT_DELAY
          sta SCENE_TEXT_SCREEN_POS

          
.JumpPos          
          jmp $a000

.SceneDone
          jsr ReleaseGameIRQ
          inc SCENE_NR
          
          lda #1
          sta LEVEL_NR
          jsr BuildScreen

          ;set charset 1
          lda #$3c
          sta VIC_MEMORY_CONTROL
          lda #4
          sta VIC_CHARSET_MULTICOLOR_1
          lda #7
          sta VIC_CHARSET_MULTICOLOR_2
 
          ;set zones for scene 2
          lda #1
          sta ZONE_COUNT
          
          lda #2
          sta SCENE_TEXT
          lda #0
          sta SCENE_TEXT_POS
          sta SCENE_TEXT_DELAY
          sta SCENE_TEXT_SCREEN_POS
          sta SCENE_FRAME_POS
          sta SCENE_FRAME_DELAY
          sta ZONE_SPRITE_RASTER_POS
          lda #40
          sta ZONE_SPRITE_RASTER_POS + 1
          
          jmp InitGameIRQ
          
SCENE_1_STEP_POINTER_LO
          !byte <Scene1PlayerDuck1
          !byte <Scene1PlayerDuck2
          !byte <Scene1PlayerFlash
          !byte <Scene1PlayerFlash2
          !byte <Scene1PlayerFlash3
          !byte <Scene1PlayerRise1
          !byte <Scene1PlayerRise2
          !byte <Scene1PlayerRise3
SCENE_1_STEP_POINTER_HI
          !byte >Scene1PlayerDuck1
          !byte >Scene1PlayerDuck2
          !byte >Scene1PlayerFlash
          !byte >Scene1PlayerFlash2
          !byte >Scene1PlayerFlash3
          !byte >Scene1PlayerRise1
          !byte >Scene1PlayerRise2
          !byte >Scene1PlayerRise3
          
SCENE_1_STEPS
          !byte 1
          !byte 3
          !byte 1
          !byte 3
          !byte 1
          !byte 3
          !byte 2
          !byte 1
          !byte 2
          !byte 1
          !byte 2
          !byte 4
          !byte 1
          !byte 2
          !byte 4
          !byte 1
          !byte 2
          !byte 4
          !byte 1
          !byte 2
          !byte 4
          !byte 1
          !byte 2
          !byte 5
          !byte 1
          !byte 2
          !byte 5
          !byte 1
          !byte 2
          !byte 3
          !byte 1
          !byte 2
          !byte 3
          !byte 1
          !byte 2
          !byte 3
          !byte 1
          !byte 2
          !byte 6
          !byte 7
          !byte 8
          !byte 8
          !byte 8
          !byte 0
          
* = $1000
!bin "soulless_end_12.bin"
          
          
SCENE_1_STEPS_PAUSE
          !byte 128
          !byte 10
          !byte 2       ;flash
          !byte 10
          !byte 2       ;flash
          !byte 10
          !byte 2       ;flash
          !byte 8
          !byte 8
          !byte 8
          !byte 8
          !byte 4       ;flash 2
          !byte 8
          !byte 8
          !byte 4       ;flash 2
          !byte 8
          !byte 8
          !byte 4       ;flash 2
          !byte 8
          !byte 8
          !byte 4       ;flash 3
          !byte 8
          !byte 8
          !byte 4       ;flash 3
          !byte 8
          !byte 8
          !byte 4       ;flash 3
          !byte 8
          !byte 8
          !byte 4       ;flash
          !byte 8
          !byte 8
          !byte 4       ;flash
          !byte 8
          !byte 8
          !byte 4       ;flash
          
          !byte 8
          !byte 8
          
          !byte 12
          !byte 12
          !byte 160
          !byte 250
          !byte 200
          !byte 0
          
Scene1PlayerFlash          
          lda #SPRITE_PLAYER_FLASH_UL_1
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_FLASH_UR_1
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_FLASH_LL_1
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_FLASH_LR_1
          sta SPRITE_INDEX + 9
          
          lda #1
          sta SPRITE_COLOR + 6
          sta SPRITE_COLOR + 7
          sta SPRITE_COLOR + 8
          sta SPRITE_COLOR + 9
          sta SPRITE_COLOR + 10
          sta SPRITE_COLOR + 11
          rts
          
Scene1PlayerFlash2
          lda #SPRITE_PLAYER_FLASH_UL_2
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_FLASH_UR_2
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_FLASH_LL_2
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_FLASH_LR_2
          sta SPRITE_INDEX + 9
          
          lda #1
          sta SPRITE_COLOR + 6
          sta SPRITE_COLOR + 7
          sta SPRITE_COLOR + 8
          sta SPRITE_COLOR + 9
          sta SPRITE_COLOR + 10
          sta SPRITE_COLOR + 11
          rts
          
Scene1PlayerFlash3
          lda #SPRITE_PLAYER_FLASH_UL_3
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_FLASH_UR_3
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_FLASH_LL_3
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_FLASH_LR_3
          sta SPRITE_INDEX + 9
          
          lda #1
          sta SPRITE_COLOR + 6
          sta SPRITE_COLOR + 7
          sta SPRITE_COLOR + 8
          sta SPRITE_COLOR + 9
          sta SPRITE_COLOR + 10
          sta SPRITE_COLOR + 11
          rts
          
Scene1PlayerDuck2
          ;shake up
          lda #SPRITE_PLAYER_UL_2
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_UR_2
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_LL_2
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_LR_2
          sta SPRITE_INDEX + 9
          
          lda #0
          sta SPRITE_COLOR + 6
          sta SPRITE_COLOR + 7
          sta SPRITE_COLOR + 8
          sta SPRITE_COLOR + 9
          sta SPRITE_COLOR + 10
          sta SPRITE_COLOR + 11
          rts
          
Scene1PlayerDuck1
          ;shake down
          lda #SPRITE_PLAYER_UL_1
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_UR_1
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_LL_1
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_LR_1
          sta SPRITE_INDEX + 9
          
          lda #0
          sta SPRITE_COLOR + 6
          sta SPRITE_COLOR + 7
          sta SPRITE_COLOR + 8
          sta SPRITE_COLOR + 9
          sta SPRITE_COLOR + 10
          sta SPRITE_COLOR + 11
          rts
          
Scene1PlayerRise1
          lda #SPRITE_PLAYER_UL_3
          sta SPRITE_INDEX + 4
          lda #SPRITE_PLAYER_UR_3
          sta SPRITE_INDEX + 5
          lda #SPRITE_PLAYER_ML_3
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_MR_3
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_LL_3
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_LR_3
          sta SPRITE_INDEX + 9
          
          lda #0
          sta SPRITE_COLOR + 6
          sta SPRITE_COLOR + 7
          sta SPRITE_COLOR + 8
          sta SPRITE_COLOR + 9
          sta SPRITE_COLOR + 10
          sta SPRITE_COLOR + 11
          rts
          
Scene1PlayerRise2
          lda #SPRITE_PLAYER_UL_4
          sta SPRITE_INDEX + 4
          lda #SPRITE_PLAYER_UR_4
          sta SPRITE_INDEX + 5
          lda #SPRITE_PLAYER_ML_4
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_MR_4
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_LL_4
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_LR_4
          sta SPRITE_INDEX + 9
          rts

Scene1PlayerRise3
          lda #SPRITE_PLAYER_UL_5
          sta SPRITE_INDEX + 4
          lda #SPRITE_PLAYER_UR_5
          sta SPRITE_INDEX + 5
          lda #SPRITE_PLAYER_ML_5
          sta SPRITE_INDEX + 6
          sta SPRITE_INDEX + 10
          lda #SPRITE_PLAYER_MR_5
          sta SPRITE_INDEX + 7
          sta SPRITE_INDEX + 11
          lda #SPRITE_PLAYER_LL_5
          sta SPRITE_INDEX + 8
          lda #SPRITE_PLAYER_LR_5
          sta SPRITE_INDEX + 9
          rts


!zone Scene2
Scene2
          jsr UpdateSceneText
          
          inc SCENE_FRAME_DELAY
          lda SCENE_FRAME_DELAY
          and #$03
          bne .NoFlagUpdate
          
          lda SCENE_FRAME_DELAY
          lsr
          lsr
          and #$03
          tay
          lda FLAG_CHARS_L,y
          sta SCREEN_CHAR + 9 + 5 * 40
          lda FLAG_CHARS_R,y
          sta SCREEN_CHAR + 10 + 5 * 40
          
          
.NoFlagUpdate          
          lda SCENE_FRAME_DELAY
          and #$07
          beq .SceneStep
          rts
          
.SceneStep    
          inc SCENE_FRAME_POS
          
          lda SCENE_FRAME_POS
          cmp #60
          bne .NotNextScene

          ;on to scene 3
          inc SCENE_NR
          lda #0
          sta SCENE_FRAME_POS

          lda #125
          sta ZONE_SPRITE_RASTER_POS + 1
          
          lda #3
          sta SCENE_TEXT
          lda #0
          sta SCENE_TEXT_POS
          sta SCENE_TEXT_DELAY
          sta SCENE_TEXT_SCREEN_POS

.NotNextScene          
          rts


!zone Scene3
Scene3
          jsr UpdateSceneText
          
          inc SCENE_FRAME_DELAY
          lda SCENE_FRAME_DELAY
          and #$03
          bne .NoFlagUpdate
          
          lda SCENE_FRAME_DELAY
          lsr
          lsr
          and #$03
          tay
          lda FLAG_CHARS_L,y
          sta SCREEN_CHAR + 9 + 5 * 40
          lda FLAG_CHARS_R,y
          sta SCREEN_CHAR + 10 + 5 * 40
          
.NoFlagUpdate          

          ;todo fireworks
          inc SCENE_FRAME_POS
          lda SCENE_FRAME_POS
          cmp #56
          bne .NoRocket
          
          lda #0
          sta SCENE_FRAME_POS
          
          inc SCENE_ROCKET_COUNT
          lda SCENE_ROCKET_COUNT
          cmp #20
          bne +
 
          inc SCENE_NR
          jmp SetupScene4
+          
          ;random x
          jsr GenerateRandomNumber
          sta PARAM1
          
-          
          cmp #20
          bcc +
          
          sec
          sbc #20
          sta PARAM1
          jmp -
+          
          inc PARAM1
          inc PARAM1
          
          ;random y
          jsr GenerateRandomNumber
          sta PARAM2
-          
          cmp #6
          bcc +
          
          sec
          sbc #6
          sta PARAM2
          jmp -
+          

          lda PARAM2
          clc
          adc #9
          sta PARAM2
          
          lda #TYPE_ROCKET
          sta PARAM3
          
          ;zone
          lda #0
          sta PARAM4    
          ;color
          lda #0
          sta PARAM6
          
;PARAM6 = color
          
          jsr AddObject
          
.NoRocket          
          

          rts
          
          
          
!zone Scene4

;y = divisions
;a = rest
DivideBy10
          sec
          ldy #$FF
.divloop
          iny
          sbc #10
          bcs .divloop
          adc #10
          rts

SCROLL_V_POS
          !byte 0
          
SetupScene4
          jsr BuildScreen
          lda #0
          sta VIC_SPRITE_ENABLE
          ldy #1
          ;use A/Y to clear
          jsr ClearScreen
          
          lda #$3e
          sta VIC_MEMORY_CONTROL
          
          ;24 line mode
          lda VIC_CONTROL_MODE
          and #$f0
          sta VIC_CONTROL_MODE
          
          lda #<SCROLL_TEXT
          sta ZEROPAGE_POINTER_3
          lda #>SCROLL_TEXT
          sta ZEROPAGE_POINTER_3 + 1
          
          ;seconds
          lda GAME_RESULT_DATA + 3
          jsr DivideBy10
          pha
          
          tya
          clc
          adc #5
          sta PLAY_TIME_TEXT + 4
          pla
          clc
          adc #5
          sta PLAY_TIME_TEXT + 5
          
          ;minutes
          ldx #2
          
          lda GAME_RESULT_DATA + 4
          sta PARAM1
-          
          jsr DivideBy10
          clc
          adc #5
          sta PLAY_TIME_TEXT,x
          dex
          
          tya
          bne -
          
          ;copy score         
          ldx #0
-          
          lda GAME_RESULT_DATA + 5,x
          ;80 > 5
          sec
          sbc #75
          sta PLAY_SCORE_TEXT,x
          
          inx
          cpx #6
          bne -
          
          lda #1
          sta SCROLL_V_POS
          rts
          
          
SCROLL_TEXT
          !ct 'A',17,'B',18,'C',19,'D',20,'E',21,'F',22,'G',23,'H',24,'I',25,'J',26,'K',27,'L',28,'M',29,'N',30,'O',31,'P',32,'Q',33,'R',34,'S',35,'T',36
          !ct 'U',37,'V',38,'W',39,'X',40,'Y',41,'Z',42,'0',5,'1',6,'2',7,'3',8,'4',9,'5',10,'6',11,'7',12,'8',13,'9',14,'*',0,' ',16,'.',113,',',103,'!',4,':',105
                    

          !text $87,"CONGRATULATIONS KING RIZEK*"
          !text "*"
          !text $81,"YOU HAVE REMOVED THE CURSE PLACED UPON*"
          !text $88,"YOU BY KALEN THE WIZARD.*"
          !text "*"
          !text $84,"AFTER A THOUSAND YEARS YOU HAVE*"
          !text $84,"REGAINED YOUR SOUL AND PEACE CAN*"
          !text $85,"FINALLY RETURN TO YOUR LANDS.*"
          !text "*"
          !text $83,"NOW LET A THOUSAND YEARS OF PEACE*"
          !text $91,"BEGIN.*"
          !text "*"
          !text $83,"WELL, WE SAY A THOUSAND YEARS. YOU*"
          !text $81,"KNOW SOMEONE WILL DO SOMETHING REALLY*"
          !text $83,"STUPID AND THE WAR WILL START ALL*"
          !text $8e,"OVER AGAIN.*"
          !text "*"
          !text $81,"IT ALWAYS HAPPENS, DOESN",104,"T IT, AYE...*"
          !text "*"
          !text $83,"SO DON",104,"T THINK ABOUT RESTING YOUR*"
          !text $84,"POOR FEET FOR TOO LONG, BECAUSE*"
          !text $84,"I AM SURE YOU",104,"LL BE NEEDED AGAIN*"
          !text $90,"ONE DAY.*"
          !text "*"
          !text $83,"BUT FOR NOW.... WELL DONE TO YOU!*"
          !text "*"
          !text $84,"THANK YOU FOR PLAYING SOULLESS!*"
          !text "*"
          !text $86,"CODE BY GEORG ROTTENSTEINER*"
          !text $84,"ART AND DESIGN BY TREVOR STOREY*"
          !text $84,"MUSIC AND SFX BY MIKKEL HASTRUP*"
          !text $81,"GAME TESTING BY KENZ AND HEAVY STYLUS*"
          !text $81,"RELEASED IN 2012 BY PSYTRONIK SOFTWARE*"
          !text $90,"AND RGCD*"
          !text "*"
          !text $8a,"R.I.P. JACK TRAMIEL*"
          !text "*"
          !text "*"
          !text $89,"YOUR PLAY TIME: "
PLAY_TIME_TEXT          
          !text " 00:00*"
          !text $89,"YOUR SCORE    : "
PLAY_SCORE_TEXT          
          !text "000000*"
          !text "-"
          
          !ct raw 

Scene4
          
;Congratulations King Rizek.
;You have removed the curse placed upon you by kalen the wizard.
;After a thousand years you have regained your soul and peace can finally return to your lands.
;Now let a thousand years of peace begin.
;Well we say a thousand years, you know someone will do something really stupid and the war will start 
;all over again.
;It always happens doesnt it aye...
;So don't think about resting your poor feet for too long because iam sure you'll be neaded again one day.

;But for now.... well done to you.

;Thankyou for playing soulless.

;Code by Georg Rottenstienner.
;Art and Design by Trevor Storey.
;Music and Sfx by Mikkel Hastrup.
;Game testing by - kenz and Heavey Stylus.
;Released in 2012 by Psytronik Sofware and RGCD.

;R.I.P Jack Tramiel
          inc SCENE_FRAME_DELAY
          lda SCENE_FRAME_DELAY
          and #$03
          beq +
-          
          rts
          
+          
          lda SCROLL_TEXT_DELAY
          cmp #80
          beq -
          
          lda SCROLL_V_POS
          beq +
          dec SCROLL_V_POS
          lda SCROLL_V_POS
          and #$07
          ora #$10
          sta VIC_CONTROL_MODE
          rts
          
+
          lda #7
          sta SCROLL_V_POS
          lda #$17
          sta VIC_CONTROL_MODE

          ;do hard scroll
          lda SCREEN_LINE_OFFSET_TABLE_LO + 1
          sta .FromPos + 1
          lda SCREEN_LINE_OFFSET_TABLE_HI + 1
          sta .FromPos + 2
          lda SCREEN_LINE_OFFSET_TABLE_LO
          sta .ToPos + 1
          lda SCREEN_LINE_OFFSET_TABLE_HI
          sta .ToPos + 2
          
          ldx #3
          
--          
          ldy #0
-          
.FromPos
          lda $8000,y
.ToPos          
          sta $8000,y
          iny
          bne -

          inc .FromPos + 2
          inc .ToPos + 2
          
          dex
          bne --
          
-          

          lda SCREEN_CHAR + 3 * 256 + 40,y
          sta SCREEN_CHAR + 3 * 256,y
          iny
          cpy #192
          bne -
          
          ;add new line
          lda SCREEN_LINE_OFFSET_TABLE_LO + 24
          sta ZEROPAGE_POINTER_1
          lda SCREEN_LINE_OFFSET_TABLE_HI + 24
          sta ZEROPAGE_POINTER_1 + 1
          
          ;clean text
          lda #0
          ldy #0
-          
          sta (ZEROPAGE_POINTER_1),y
          iny
          cpy #40
          bne -
          
          ;display text
          inc SCROLL_TEXT_DELAY
          lda SCROLL_TEXT_DELAY
          and #$01
          bne +
          rts
          
+          
          ldy #0
          
-          
          lda (ZEROPAGE_POINTER_3),y
          beq ++
          cmp #'-'
          beq +++
          and #$80
          beq +
          
          ;move to right
          lda (ZEROPAGE_POINTER_3),y
          and #$7f
          clc
          adc ZEROPAGE_POINTER_1
          sta ZEROPAGE_POINTER_1
          lda ZEROPAGE_POINTER_1 + 1
          adc #0
          sta ZEROPAGE_POINTER_1 + 1
          iny
          jmp -
          
+          
          lda (ZEROPAGE_POINTER_3),y
          sta (ZEROPAGE_POINTER_1),y
          iny
          jmp -

++      
          iny
          tya
          clc
          adc ZEROPAGE_POINTER_3
          sta ZEROPAGE_POINTER_3
          lda ZEROPAGE_POINTER_3 + 1
          adc #0
          sta ZEROPAGE_POINTER_3 + 1
          
+++          
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
          cmp #255
          beq .TextComplete
          and #$80
          bne .ShiftPos
          
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
          beq .TextDone
          
          ldy SCENE_TEXT_DELAY
          lda SCENE_TEXT_COLOR_FADE + 2,y
          ldy SCENE_TEXT_SCREEN_POS
          sta SCREEN_COLOR + 23 * 40 - 1,y
          rts

.TextComplete
          lda #255
          sta SCENE_TEXT_POS
          lda #0
          sta SCENE_TEXT_DONE_DELAY
          rts
          
          
          
;------------------------------------------------------------
;BuildScreen
;creates a screen from level data
;------------------------------------------------------------
!zone BuildScreen
BuildScreen
          lda #$0b
          sta VIC_CONTROL_MODE
          
          ;reset zones
          ldx #0
          lda #0
          sta ZONE_COUNT
.ClearZone
          sta ZONE_SPRITE_ACTIVE,x
          sta ZONE_SPRITE_MULTICOLOR,x
          sta ZONE_SPRITE_RASTER_POS,x
          sta ZONE_SPRITE_XBIT,x
          
          inx
          cpx #ZONE_MAX_COUNT
          bne .ClearZone
          
          ;reset all objects
          ldx #0
          lda #0
.ClearObjectLoop
          sta SPRITE_ACTIVE,x
          sta SPRITE_FALLING,x
          sta SPRITE_ANIM_POS,x
          sta SPRITE_ANIM_DELAY,x
          sta SPRITE_POS_X_EXTEND,x
          lda #255
          sta SPRITE_ZONE,x
          lda #0
          
          inx
          cpx #SPRITE_COUNT
          bne .ClearObjectLoop
          
          ;clear screen
          lda #0
          sta VIC_SPRITE_ENABLE
          ldy #6
          jsr ClearScreen
          
          ;get pointer to real level data from table
          lda SCENE_NR
          cmp #3
          beq .NoMoreLevels
          
          lda LEVEL_NR
          asl
          tax
          lda SCREEN_DATA_TABLE,x
          sta ZEROPAGE_POINTER_1
          lda SCREEN_DATA_TABLE + 1,x
          sta ZEROPAGE_POINTER_1 + 1
          
          jsr .BuildLevel
          
.NoMoreLevels          
          lda #$1b
          sta VIC_CONTROL_MODE
.LevelComplete                    
          rts
          
.BuildLevel
          ;work through data
          ldy #255
          
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
          !byte <LevelLineH
          !byte <LevelObject
          !byte <LevelElement
          !byte <LevelElementV
          !byte <LevelSpecial
          !byte <LevelArea
          
LEVEL_ELEMENT_TABLE_HI
          !byte >.LevelComplete
          !byte >LevelLineH
          !byte >LevelObject
          !byte >LevelElement
          !byte >LevelElementV
          !byte >LevelSpecial
          !byte >LevelArea

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


!zone LevelArea
LevelArea
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM1 
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          tax
          lda SCREEN_LINE_OFFSET_TABLE_LO,x
          sta ZEROPAGE_POINTER_2
          sta ZEROPAGE_POINTER_3
          lda SCREEN_LINE_OFFSET_TABLE_HI,x
          sta ZEROPAGE_POINTER_2 + 1
          clc
          adc #( ( SCREEN_COLOR - SCREEN_CHAR ) & 0xff00 ) >> 8
          sta ZEROPAGE_POINTER_3 + 1

          ;width
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM2
          sta PARAM6
          
          ;height
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
          
          ;store target pointers to screen and color ram
          tya
          pha
          
.NextLineArea          
          ldy PARAM1
.NextCharArea
          lda PARAM4
          sta (ZEROPAGE_POINTER_2),y
          lda PARAM5
          sta (ZEROPAGE_POINTER_3),y
          iny
          dec PARAM2
          bne .NextCharArea
          
          dec PARAM3
          beq .AreaDone
          
          ;move pointers down a line
          tya
          sec
          sbc #40
          tay
          
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
          
          lda PARAM6
          sta PARAM2
          jmp .NextLineArea
          
.AreaDone          
          jmp NextLevelData
          
!zone LevelLineH
LevelLineH
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
          
          
!zone LevelObject
LevelObject
          ldx #0
          
.CheckNextSlot          
          lda SPRITE_ACTIVE,x
          beq .EmptySlotFound
          
          inx
          cpx #SPRITE_COUNT
          bne .CheckNextSlot
          
          iny
          iny
          iny
          iny
          iny
          iny
          
          tya
          pha

          jmp NextLevelData
          
          
          
.EmptySlotFound 
          ;!byte LD_OBJECT,x,y,type,zone,true index
          lda #0
          sta SPRITE_MULTICOLOR,x
          
          ;X pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_CHAR_POS_X,x
          
          ;Y pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_CHAR_POS_Y,x
          
          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_ACTIVE,x
          
          ;zone
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_ZONE,x

          ;true index
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta SPRITE_TRUE_INDEX,x
          
          ;store y for later
          tya
          pha

          jsr CalcSpritePosFromCharPos

          ;color
          ldy SPRITE_ACTIVE,x
          lda TYPE_START_MULTICOLOR,y
          sta SPRITE_MULTICOLOR,x
          lda TYPE_START_COLOR,y
          sta SPRITE_COLOR,x
          lda TYPE_START_SPRITE,y
          sta SPRITE_INDEX,x
          
          ;add up flags
          ldy SPRITE_TRUE_INDEX,x
          lda BIT_TABLE,y
          sta PARAM1
          
          ldy SPRITE_ZONE,x
          ora ZONE_SPRITE_ACTIVE,y
          sta ZONE_SPRITE_ACTIVE,y
          
          lda SPRITE_MULTICOLOR,x
          beq .NoMC
          lda PARAM1
          ora ZONE_SPRITE_MULTICOLOR,y
          sta ZONE_SPRITE_MULTICOLOR,y
          
.NoMC     
          ;adjust sprite offset
          ldy SPRITE_ACTIVE,x
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

          ldy SPRITE_ACTIVE,x
          lda TYPE_START_BEHAVIOUR,y
          beq +
          
          cmp #1
          bne +
          
          ;random delta (birds)
          jsr GenerateRandomNumber
          and #$01
          sta SPRITE_MOVE_POS,x
          
          jsr GenerateRandomNumber
          and #$03
          sta PARAM4
.AdjustY2
          beq .NoYMovementNeeded2
          jsr MoveSpriteUp
          dec PARAM4
          jmp .AdjustY2

.NoYMovementNeeded2
+
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

          ;type
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta PARAM3

          ;store y for later
          tya
          pha
          
          jsr DrawLevelElement
          
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

          
!zone LevelSpecial
LevelSpecial
          ; LD_SPECIAL,zone,raster
          ;zone
          iny
          lda (ZEROPAGE_POINTER_1),y
          tax

          ;raster pos
          iny
          lda (ZEROPAGE_POINTER_1),y
          sta ZONE_SPRITE_RASTER_POS,x
          
          ;store y for later
          tya
          pha
          
          inc ZONE_COUNT
          
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
          lda END1ELEMENT_TABLE_LO,y
          sta .LoadCode + 1
          lda END1ELEMENT_TABLE_HI,y
          sta .LoadCode + 2

          lda END1ELEMENT_COLOR_TABLE_LO,y
          sta .LoadCodeColor + 1
          lda END1ELEMENT_COLOR_TABLE_HI,y
          sta .LoadCodeColor + 2

          lda END1ELEMENT_WIDTH_TABLE,y
          sta PARAM4
          lda END1ELEMENT_HEIGHT_TABLE,y
          sta PARAM5
          sta PARAM6
          
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
          jsr MoveSpriteUp
          rts
          
;------------------------------------------------------------
;CalcSpritePosFromCharPos
;calculates the real sprite coordinates from screen char pos
;and sets them directly
;SPRITE_CHAR_POS_X = char_pos_x
;SPRITE_CHAR_POS_Y = char_pos_y
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
          
          ;update zone extended x bit
          ldy SPRITE_ZONE,x
          lda ZONE_SPRITE_XBIT,y
          sta PARAM3

          ldy SPRITE_TRUE_INDEX,x
          lda BIT_TABLE,y
          ora PARAM3
          ldy SPRITE_ZONE,x
          sta ZONE_SPRITE_XBIT,y
          
          jmp .XBitSet
          
.NoXBit   
          ldy SPRITE_ZONE,x
          lda ZONE_SPRITE_XBIT,y
          sta PARAM3

          ldy SPRITE_TRUE_INDEX,x
          lda BIT_TABLE,y
          eor #$ff
          and PARAM3
          ldy SPRITE_ZONE,x
          sta ZONE_SPRITE_XBIT,y

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
          
          ;Y = charY * 8 + ( 50 - SPRITE_CENTER_OFFSET_Y=11 )
          lda SPRITE_CHAR_POS_Y,x
          asl
          asl
          asl
          clc
          adc #( 50 - SPRITE_CENTER_OFFSET_Y )
          sta SPRITE_POS_Y,x
          
          lda #0
          sta SPRITE_CHAR_POS_X_DELTA,x
          sta SPRITE_CHAR_POS_Y_DELTA,x
          rts


;------------------------------------------------------------
;Move Sprite Left
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteLeft
MoveSpriteLeft
          lda SPRITE_POS_X,x
          bne .NoChangeInExtendedFlag
          dec SPRITE_POS_X,x
          
          ldy SPRITE_ZONE,x
          
          lda BIT_TABLE,x
          eor #$ff
          and ZONE_SPRITE_XBIT,y
          sta ZONE_SPRITE_XBIT,y
          
          lda #0
          sta SPRITE_POS_X_EXTEND,x
          rts
          
.NoChangeInExtendedFlag     
          dec SPRITE_POS_X,x
          rts  

;------------------------------------------------------------
;Move Sprite Up
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteUp
MoveSpriteUp
          dec SPRITE_POS_Y,x
          rts  

;------------------------------------------------------------
;Move Sprite Down
;expect x as sprite index (0 to 7)
;------------------------------------------------------------
!zone MoveSpriteDown
MoveSpriteDown
          inc SPRITE_POS_Y,x
          rts  


;------------------------------------------------------------
;adds object
;PARAM1 = X
;PARAM2 = Y
;PARAM3 = TYPE
;PARAM4 = ZONE
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
          lda PARAM2
          sta SPRITE_CHAR_POS_Y,x
          lda PARAM4
          sta SPRITE_ZONE,x
          lda PARAM3
          sta SPRITE_ACTIVE,x
          
          ;PARAM1 and PARAM2 hold x,y already
          jsr CalcSpritePosFromCharPos

          txa
          sta SPRITE_TRUE_INDEX,x

          ;enable sprite
          lda BIT_TABLE,x
          ldy PARAM4
          ora ZONE_SPRITE_ACTIVE,y
          sta ZONE_SPRITE_ACTIVE,y

          ;sprite color
          lda PARAM6
          sta SPRITE_COLOR,x
          ldy SPRITE_ACTIVE,x
          lda TYPE_START_MULTICOLOR,y
          beq .NoMulticolor
          
          lda BIT_TABLE,x
          ldy PARAM4
          ora ZONE_SPRITE_MULTICOLOR,y
          sta ZONE_SPRITE_MULTICOLOR,y
          jmp .MultiColorDone
          
.NoMulticolor          
          lda BIT_TABLE,x
          eor #$ff
          ldy PARAM4
          and ZONE_SPRITE_MULTICOLOR,y
          sta ZONE_SPRITE_MULTICOLOR,y

.MultiColorDone      
          
          ;initialise enemy values
          ldy SPRITE_ACTIVE,x
          lda TYPE_START_SPRITE,y
          ;sta SPRITE_POINTER_BASE,x
          sta SPRITE_INDEX,x
          
          lda #0
          sta SPRITE_BEHAVIOUR,x
          
          ;look right per default
          lda #0
          sta SPRITE_DIRECTION,x
          sta SPRITE_DIRECTION_Y,x
          sta SPRITE_ANIM_POS,x
          sta SPRITE_ANIM_DELAY,x
          sta SPRITE_MOVE_POS,x
          sta SPRITE_MOVE_POS_Y,x
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
          cmp #$f8
          beq WaitFrame

          ;wait for the raster to reach line $f8 (should be closer to the start of this line this way)
.WaitStep2
          lda VIC_RASTER_POS
          cmp #$f8
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
          ;cpx #SPRITE_COUNT
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
          sta SPRITE_INDEX,x
          
          ;disable sprite          
          ldy SPRITE_ZONE,x
          lda BIT_TABLE,x
          eor #$ff
          and ZONE_SPRITE_ACTIVE,y
          sta ZONE_SPRITE_ACTIVE,y
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
          cpx #8
          bne .ObjectLoop
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
          sta SPRITE_INDEX,x
          
.NoAnimUpdate
          rts



;------------------------------------------------------------
;Flag
;------------------------------------------------------------
!zone BehaviourFlag
BehaviourFlag          
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
          adc #SPRITE_FLAG_1
          sta SPRITE_INDEX,x
          
.NoAnimUpdate
          rts


;------------------------------------------------------------
;running player
;------------------------------------------------------------
!zone BehaviourPlayerRun
BehaviourPlayerRun          
          lda SPRITE_STATE,x
          beq .RunLeft
          cmp #1
          bne +
          
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          
          cmp #64
          bcc +
          cmp #100
          bcs ++
          
          lda SPRITE_MOVE_POS,x
          and #$07
          bne +
          
          inc SPRITE_INDEX,x
+
          rts

++
          inc SPRITE_STATE,x
          rts

.RunLeft  
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
          bne +
          lda #0
          sta SPRITE_ANIM_POS,x
+          
          clc
          adc #SPRITE_PLAYER_RUN_1
          sta SPRITE_INDEX,x
          
.NoAnimUpdate
          lda SPRITE_POS_X,x
          cmp #176
          beq .RunLeftDone
          
          inc SPRITE_MOVE_POS,x
          lda SPRITE_MOVE_POS,x
          and #$07
          beq +
          and #$03
          bne +
          
          ;do not move further down
          lda SPRITE_MOVE_POS,x
          cmp #241
          bcs +
          
          jsr MoveSpriteDown
+          
          lda SPRITE_MOVE_POS,x
          and #$01
          beq +

          jsr MoveSpriteLeft

+
          rts
          
.RunLeftDone
          inc SPRITE_STATE,x
          
          lda #SPRITE_PLAYER_STAND
          sta SPRITE_INDEX,x
          
          lda #0
          sta SPRITE_MOVE_POS,x
          rts


;------------------------------------------------------------
;Bird
;------------------------------------------------------------
!zone BehaviourBird
BehaviourBird          
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
          cmp #3
          bne +
 
          lda #2
+          
          clc
          adc #SPRITE_BIRD_1
          sta SPRITE_INDEX,x
          
.NoAnimUpdate
          lda SPRITE_STATE,x
          bne .FlyUp
          
          inc SPRITE_STATE_POS,x
          lda SPRITE_STATE_POS,x
          cmp #200
          bne +
          
          inc SPRITE_STATE,x
.FlyUp
          jsr MoveSpriteUp
          
          jsr GenerateRandomNumber
          and #$01
          clc
          adc SPRITE_MOVE_POS,x
          sta PARAM6
          
          
-          
          beq ++
          
          jsr MoveSpriteLeft
          dec PARAM6
          jmp -
          
++          
          lda SPRITE_POS_Y,x
          bne +
 
          jsr RemoveObject
          
+          
          rts



;------------------------------------------------------------
;Rocket
;------------------------------------------------------------
!zone BehaviourRocket
BehaviourRocket          
          lda SPRITE_MOVE_POS,x
          bne .Update
          
          ldy SPRITE_STATE,x
          
          lda ROCKET_DELTA_Y_COUNT_TABLE,y
          sta SPRITE_MOVE_POS,x
          inc SPRITE_STATE,x
          
.Update
          ldy SPRITE_STATE,x
          lda ROCKET_DELTA_Y_TABLE,y
          beq .EndOfLife
          sta PARAM6
          
-          
          beq .MovementDone
          
          jsr ObjectMoveUp
          dec PARAM6
          jmp -


.MovementDone
          dec SPRITE_MOVE_POS,x
          rts
 
.EndOfLife 
          jsr RemoveObject
          
          txa
          pha
          
          ;random color (*8 for table)
          jsr GenerateRandomNumber
          and #$03
          clc
          asl
          asl
          asl
          sta PARAM9
          
          ;zone
          lda #0
          sta PARAM4
          ;color
          lda #1
          sta PARAM6
          
          lda SPRITE_CHAR_POS_X,x
          sec
          sbc #1
          sta PARAM1
          sta PARAM7
          lda SPRITE_CHAR_POS_Y,x
          sec
          sbc #1
          sta PARAM2
          sta PARAM8
          lda #TYPE_EXPLOSION_1
          sta PARAM3
          jsr AddObject
          lda PARAM9
          sta SPRITE_MOVE_POS,x
          
          lda PARAM7
          clc
          adc #3
          sta PARAM1
          lda #TYPE_EXPLOSION_2
          sta PARAM3
          jsr AddObject
          lda PARAM9
          sta SPRITE_MOVE_POS,x
          
          lda PARAM7
          sta PARAM1
          lda PARAM8
          clc
          adc #3
          sta PARAM2
          lda #TYPE_EXPLOSION_3
          sta PARAM3
          jsr AddObject
          lda PARAM9
          sta SPRITE_MOVE_POS,x
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          
          lda PARAM7
          clc
          adc #3
          sta PARAM1
          lda #TYPE_EXPLOSION_4
          sta PARAM3
          jsr AddObject
          lda PARAM9
          sta SPRITE_MOVE_POS,x
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          jsr MoveSpriteUp
          
          pla
          tax
          rts




;------------------------------------------------------------
;Explosion 1
;------------------------------------------------------------
!zone BehaviourExplosion1
BehaviourExplosion1          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #FIREWORK_EXPLOSION_SPEED
          beq .UpdateAnim
          
          rts
          
.UpdateAnim          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          ldy SPRITE_ANIM_POS,x
          cpy #7
          beq .EndOfLife
          
          lda EXPLOSION_ANIM_TABLE_1,y
          sta SPRITE_INDEX,x

          inc SPRITE_MOVE_POS,x
          ldy SPRITE_MOVE_POS,x
          lda FIREWORKS_COLOR_TABLE,y
          sta SPRITE_COLOR,x

          jsr MoveSpriteDown
          rts
 
.EndOfLife 
          jmp RemoveObject




;------------------------------------------------------------
;Explosion 2
;------------------------------------------------------------
!zone BehaviourExplosion2
BehaviourExplosion2          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #FIREWORK_EXPLOSION_SPEED
          beq .UpdateAnim
          
          rts
          
.UpdateAnim          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          ldy SPRITE_ANIM_POS,x
          cpy #7
          beq .EndOfLife
          
          lda EXPLOSION_ANIM_TABLE_2,y
          sta SPRITE_INDEX,x
          
          inc SPRITE_MOVE_POS,x
          ldy SPRITE_MOVE_POS,x
          lda FIREWORKS_COLOR_TABLE,y
          sta SPRITE_COLOR,x
          
          jsr MoveSpriteDown
          rts
 
.EndOfLife 
          jmp RemoveObject



;------------------------------------------------------------
;Explosion 3
;------------------------------------------------------------
!zone BehaviourExplosion3
BehaviourExplosion3          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #FIREWORK_EXPLOSION_SPEED
          beq .UpdateAnim
          
          rts
          
.UpdateAnim          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          ldy SPRITE_ANIM_POS,x
          cpy #7
          beq .EndOfLife
          
          lda EXPLOSION_ANIM_TABLE_3,y
          sta SPRITE_INDEX,x
          
          inc SPRITE_MOVE_POS,x
          ldy SPRITE_MOVE_POS,x
          lda FIREWORKS_COLOR_TABLE,y
          sta SPRITE_COLOR,x
          
          jsr MoveSpriteDown
          rts
 
.EndOfLife 
          jmp RemoveObject




;------------------------------------------------------------
;Explosion 4
;------------------------------------------------------------
!zone BehaviourExplosion4
BehaviourExplosion4          
          inc SPRITE_ANIM_DELAY,x
          lda SPRITE_ANIM_DELAY,x
          cmp #FIREWORK_EXPLOSION_SPEED
          beq .UpdateAnim
          
          rts
          
.UpdateAnim          
          lda #0
          sta SPRITE_ANIM_DELAY,x
          
          inc SPRITE_ANIM_POS,x
          ldy SPRITE_ANIM_POS,x
          cpy #7
          beq .EndOfLife
          
          lda EXPLOSION_ANIM_TABLE_4,y
          sta SPRITE_INDEX,x
          
          inc SPRITE_MOVE_POS,x
          ldy SPRITE_MOVE_POS,x
          lda FIREWORKS_COLOR_TABLE,y
          sta SPRITE_COLOR,x

          jsr MoveSpriteDown
          rts
 
.EndOfLife 
          jmp RemoveObject





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


NoBehaviour
          rts


;------------------------------------------------------------
;sets up sprites for a horizontal section
;------------------------------------------------------------
!zone SetupSpriteZone
SetupSpriteZone
          ldy CURRENT_IRQ_ZONE
          ;sty VIC_BORDER_COLOR
          
          lda ZONE_SPRITE_ACTIVE,y
          sta VIC_SPRITE_ENABLE
          
          lda ZONE_SPRITE_XBIT,y
          sta VIC_SPRITE_X_EXTEND
          
          lda ZONE_SPRITE_MULTICOLOR,y
          sta VIC_SPRITE_MULTICOLOR
          
          ldx #0
.ActiveLoop
          lda SPRITE_ZONE,x
          cmp CURRENT_IRQ_ZONE
          bne .NotInThisZone

          ;direct 1:1 indices
          ldy SPRITE_TRUE_INDEX,x
          lda SPRITE_COLOR,x
          sta VIC_SPRITE_COLOR,y
          lda SPRITE_INDEX,x
          sta SPRITE_POINTER_BASE,y
          
          ;indirect 1:2 indices
          lda SPRITE_TRUE_INDEX,x
          asl
          tay
          lda SPRITE_POS_X,x
          sta VIC_SPRITE_X_POS,y
          lda SPRITE_POS_Y,x
          sta VIC_SPRITE_Y_POS,y
          
.NotInThisZone          
          inx
          cpx #SPRITE_COUNT
          bne .ActiveLoop
          rts


;------------------------------------------------------------
;screen data
;------------------------------------------------------------

!source "level_elements_end1.asm"

SCREEN_DATA_TABLE
          !word END1_LEVEL_1
          !word END2_LEVEL_1
          
          

;------------------------------------------------------------
;game variables
;------------------------------------------------------------

ROCKET_DELTA_Y_TABLE
          !byte 4,3,2,1,0,0

CURRENT_IRQ_ZONE
          !byte 0
          
ZONE_COUNT     
          !byte 0

SCROLL_TEXT_DELAY
          !byte 0

ZONE_MAX_COUNT = 2          

ZONE_SPRITE_ACTIVE
          !fill ZONE_MAX_COUNT,0
ZONE_SPRITE_XBIT
          !fill ZONE_MAX_COUNT,0
ZONE_SPRITE_MULTICOLOR      
          !fill ZONE_MAX_COUNT,0
ZONE_SPRITE_RASTER_POS
          !fill ZONE_MAX_COUNT,0
          
SPRITE_COUNT = 16

SPRITE_POS_X
          !fill SPRITE_COUNT,0
SPRITE_POS_X_EXTEND
          !fill SPRITE_COUNT,0
SPRITE_CHAR_POS_X
          !fill SPRITE_COUNT,0
SPRITE_CHAR_POS_X_DELTA
          !fill SPRITE_COUNT,0
SPRITE_CHAR_POS_Y
          !fill SPRITE_COUNT,0
SPRITE_CHAR_POS_Y_DELTA
          !fill SPRITE_COUNT,0
SPRITE_POS_Y
          !fill SPRITE_COUNT,0
SPRITE_ACTIVE
          !fill SPRITE_COUNT,0
SPRITE_DIRECTION
          !fill SPRITE_COUNT,0
SPRITE_DIRECTION_Y          
          !fill SPRITE_COUNT,0
SPRITE_FALLING
          !fill SPRITE_COUNT,0
SPRITE_ANIM_POS
          !fill SPRITE_COUNT,0
SPRITE_ANIM_DELAY
          !fill SPRITE_COUNT,0
SPRITE_MOVE_POS
          !fill SPRITE_COUNT,0
SPRITE_MOVE_POS_Y          
          !fill SPRITE_COUNT,0
SPRITE_BEHAVIOUR
          !fill SPRITE_COUNT,0
SPRITE_STATE
          !fill SPRITE_COUNT,0
SPRITE_STATE_POS
          !fill SPRITE_COUNT,0
          
SPRITE_ZONE          
          !fill SPRITE_COUNT,0
SPRITE_TRUE_INDEX          
          !fill SPRITE_COUNT,0
SPRITE_INDEX          
          !fill SPRITE_COUNT,0
SPRITE_COLOR          
          !fill SPRITE_COUNT,0
SPRITE_MULTICOLOR          
          !fill SPRITE_COUNT,0

LEVEL_NR
          !byte 0
  
SCENE_NR
          !byte 0
SCENE_FRAME_POS
          !byte 0
SCENE_FRAME_DELAY
          !byte 0
SCENE_ROCKET_COUNT
          !byte 0

SCENE_TEXT_POS
          !byte 0
SCENE_TEXT_SCREEN_POS
          !byte 0
SCENE_TEXT_DELAY
          !byte 0
SCENE_TEXT_DONE_DELAY
          !byte 0
SCENE_TEXT
          !byte 0

ROCKET_DELTA_Y_COUNT_TABLE
          !byte 10,8,6,4,2,0
          
ENEMY_BEHAVIOUR_TABLE_LO          
          !byte <BehaviourTorch     ;torch
          !byte <NoBehaviour        ;player ul
          !byte <NoBehaviour        ;player ur
          !byte <NoBehaviour        ;player ll
          !byte <NoBehaviour        ;player lr
          !byte <NoBehaviour        ;player feet l
          !byte <NoBehaviour        ;player feet r
          !byte <NoBehaviour        ;invisible
          !byte <BehaviourFlag      ;flag
          !byte <BehaviourPlayerRun
          !byte <BehaviourBird
          !byte <BehaviourRocket      ;rocket
          !byte <BehaviourExplosion1
          !byte <BehaviourExplosion2
          !byte <BehaviourExplosion3
          !byte <BehaviourExplosion4
          
ENEMY_BEHAVIOUR_TABLE_HI
          !byte >BehaviourTorch     ;player top
          !byte >NoBehaviour        ;player ul
          !byte >NoBehaviour        ;player ur
          !byte >NoBehaviour        ;player ll
          !byte >NoBehaviour        ;player lr
          !byte >NoBehaviour        ;player feet l
          !byte >NoBehaviour        ;player feet r
          !byte >NoBehaviour        ;invisible
          !byte >BehaviourFlag      ;flag
          !byte >BehaviourPlayerRun
          !byte >BehaviourBird
          !byte >BehaviourRocket    ;rocket
          !byte >BehaviourExplosion1
          !byte >BehaviourExplosion2
          !byte >BehaviourExplosion3
          !byte >BehaviourExplosion4
          
TYPE_START_SPRITE_OFFSET_X
          !byte 0                   ;dummy entry for inactive object
          !byte 2                   ;torch
          !byte 3                   ;player ul
          !byte 3                   ;player ur
          !byte 3                   ;player ll
          !byte 3                   ;player lr
          !byte 3                   ;player feet l
          !byte 3                   ;player feet r
          !byte 3                   ;invisible
          !byte 0                   ;flag
          !byte 0                   ;running player
          !byte 0                   ;bird
          !byte 0                   ;rocket
          !byte 4                   ;explosion 1
          !byte 4                   ;explosion 2
          !byte 4                   ;explosion 3
          !byte 4                   ;explosion 4
          
TYPE_START_SPRITE_OFFSET_Y
          !byte 0                   ;dummy entry for inactive object
          !byte 0                   ;torch
          !byte 7                   ;player ul
          !byte 7                   ;player ur
          !byte 2                   ;player ll
          !byte 2                   ;player lr
          !byte 2                   ;player feet l
          !byte 2                   ;player feet r
          !byte 4                   ;invisible
          !byte 0                   ;flag
          !byte 0                   ;running player
          !byte 0                   ;bird
          !byte 0                   ;rocket
          !byte 1                   ;explosion 1
          !byte 1                   ;explosion 2
          !byte 1                   ;explosion 3
          !byte 1                   ;explosion 4
          
          

TYPE_START_MULTICOLOR
          !byte 0
          !byte 1                   ;torch
          !byte 0                   ;player ul
          !byte 0                   ;player ur
          !byte 0                   ;player ll
          !byte 0                   ;player lr
          !byte 0                   ;player feet l
          !byte 0                   ;player feet r
          !byte 0                   ;invisible
          !byte 0                   ;flag
          !byte 0                   ;running player
          !byte 0                   ;bird
          !byte 0                   ;rocket
          !byte 0                   ;explosion 1
          !byte 0                   ;explosion 2
          !byte 0                   ;explosion 3
          !byte 0                   ;explosion 4

TYPE_START_COLOR
          !byte 0
          !byte 7                   ;torch
          !byte 0                   ;player ul
          !byte 0                   ;player ur
          !byte 0                   ;player ll
          !byte 0                   ;player lr
          !byte 1                   ;player feet l
          !byte 1                   ;player feet r
          !byte 0                   ;invisible
          !byte 0                   ;flag
          !byte 0                   ;running player
          !byte 0                   ;bird
          !byte 0                   ;rocket
          !byte 1                   ;explosion 1
          !byte 1                   ;explosion 2
          !byte 1                   ;explosion 3
          !byte 1                   ;explosion 4
          
TYPE_START_BEHAVIOUR
          !byte 0                   ;dummy
          !byte 0                   ;torch
          !byte 0                   ;player ul
          !byte 0                   ;player ur
          !byte 0                   ;player ll
          !byte 0                   ;player lr
          !byte 0                   ;player feet l
          !byte 0                   ;player feet r
          !byte 0                   ;invisible
          !byte 0                   ;flag
          !byte 0                   ;running player
          !byte 1                   ;bird
          !byte 0                   ;rocket
          !byte 0                   ;explosion 1
          !byte 0                   ;explosion 2
          !byte 0                   ;explosion 3
          !byte 0                   ;explosion 4
          
FIREWORKS_COLOR_TABLE
          !byte 1,10,10,10,2,2,        2,0
          !byte 1,13,13,13,5,5,        5,0
          !byte 1,14,14,14,6,6,        6,0
          !byte 1, 7, 7, 7,8,8,        8,0
  
SCENE_TEXT_COLOR_FADE
          !byte 0,6,3,1
          

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

SCENE_TEXT_TABLE_LO
          !byte <SCENE_1_TEXT
          !byte <SCENE_1_TEXT_2
          !byte <SCENE_2_TEXT
          !byte <SCENE_3_TEXT
          
!ifndef BUILD_CARTRIDGE {
          !byte <CHEAT_TEXT
}

SCENE_TEXT_TABLE_HI
          !byte >SCENE_1_TEXT
          !byte >SCENE_1_TEXT_2
          !byte >SCENE_2_TEXT
          !byte >SCENE_3_TEXT
!ifndef BUILD_CARTRIDGE {
          !byte >CHEAT_TEXT
}

          
EXPLOSION_ANIM_TABLE_1
          !byte SPRITE_BASE + 68,SPRITE_BASE + 70,SPRITE_BASE + 76,SPRITE_BASE + 78,SPRITE_BASE + 84,SPRITE_BASE + 92,SPRITE_BASE + 94
EXPLOSION_ANIM_TABLE_2
          !byte SPRITE_BASE + 69,SPRITE_BASE + 71,SPRITE_BASE + 77,SPRITE_BASE + 79,SPRITE_BASE + 85,SPRITE_BASE + 93,SPRITE_BASE + 95
EXPLOSION_ANIM_TABLE_3
          !byte SPRITE_BASE + 72,SPRITE_BASE + 74,SPRITE_BASE + 80,SPRITE_BASE + 82,SPRITE_BASE + 88,SPRITE_BASE + 96,SPRITE_BASE + 98
EXPLOSION_ANIM_TABLE_4
          !byte SPRITE_BASE + 73,SPRITE_BASE + 75,SPRITE_BASE + 81,SPRITE_BASE + 83,SPRITE_BASE + 89,SPRITE_BASE + 97,SPRITE_BASE + 99
          
TYPE_START_SPRITE
          !byte 0                   ;dummy entry for inactive object
          !byte SPRITE_TORCH_1      
          !byte SPRITE_PLAYER_UL_1
          !byte SPRITE_PLAYER_UR_1
          !byte SPRITE_PLAYER_LL_1
          !byte SPRITE_PLAYER_LR_1
          !byte SPRITE_PLAYER_LL_3
          !byte SPRITE_PLAYER_LR_3
          !byte SPRITE_INVISIBLE
          !byte SPRITE_FLAG_1
          !byte SPRITE_PLAYER_RUN_1
          !byte SPRITE_BIRD_1
          !byte SPRITE_ROCKET_SMALL
          !byte SPRITE_EXPLOSION_UL_0
          !byte SPRITE_EXPLOSION_UR_0
          !byte SPRITE_EXPLOSION_LL_0
          !byte SPRITE_EXPLOSION_LR_0

  
          
!ct 'A',17,'B',18,'C',19,'D',20,'E',21,'F',22,'G',23,'H',24,'I',25,'J',26,'K',27,'L',28,'M',29
!ct 'N',30,'O',31,'P',32,'Q',33,'R',34,'S',35,'T',36,'U',37,'V',38,'W',39,'X',40,'Y',41,'Z',42
!ct ' ',0,'0',5,'1',6,'2',7,'3',8,'4',9,'5',10,'6',11,'7',12,'8',13,'9',14,'*',255,'.',43
          
SCENE_1_TEXT
          ;Energy pulses through the twisted body of rizek.
          !text " ENERGY PULSES THROUGH THE TWISTED BODY ",128+15,"OF RIZEK.*"
          
SCENE_1_TEXT_2          
          ;His soul and form merging into one.
          !text 128 + 3,"HIS SOUL AND FORM MERGING INTO ONE.*"

SCENE_2_TEXT
          ;At last Rizek is free from his thousand year hell.
          !text "AT LAST RIZEK IS FREE FROM HIS THOUSAND ",128+15,"YEAR HELL.*"

SCENE_3_TEXT
          ;Freedom and peace await him and his people.
          !text 128 + 3,"FREEDOM AND PEACE AWAIT HIM AND HIS",128+18,"PEOPLE.*"

!ifndef BUILD_CARTRIDGE {
CHEAT_TEXT
          !text "THE OUTRO IS ONLY VISIBLE AFTER BEATING"
          !text 128+12,"THE GAME PROPERLY*"
}

FLAG_CHARS_L
          !byte 142,158,180,182
FLAG_CHARS_R
          !byte 143,159,181,183
          
!ifndef COMPILE_CRUNCHED {          
CHARSET
          !binary "soulless_end2.chr"
          !binary "soulless_end1.chr",1136
          
SPRITES
          !binary "soulless_end.spr"
          
          
}