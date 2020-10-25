EL_BLUE_BRICK_4x3               = 0
EL_BLUE_BRICK_4x3_RIGHT_SIDE    = 1
EL_BLUE_BRICK_4x3_LEFT_SIDE     = 2
EL_BLUE_BRICK_4x1               = 3
EL_BLUE_BRICK_4x1_RIGHT_SIDE    = 4
EL_BLUE_BRICK_4x1_LEFT_SIDE     = 5
EL_DARK_BLUE_BRICK_4x1          = 6
EL_TOMB_PLATFORM_1_3            = 7
EL_TOMB_PLATFORM_1_7            = 8
EL_BLUE_BRICK_4x3_BOTTOM        = 9
EL_DARK_BLUE_BRICK_4x3          = 10
EL_DARK_BLUE_BRICK_4x3_BOTTOM   = 11
EL_DARK_BLUE_BRICK_4x3_BOTTOM_R = 12
EL_HORNED_DEMON                 = 13
EL_BLUE_BRICK_4x2               = 14
EL_BLUE_BRICK_7x2               = 15
EL_BLUE_BRICK_4x4               = 16
EL_BLUE_BRICK_6x5               = 17
EL_COLUMN_TOP_3x1               = 18
EL_COLUMN_SEGMENT_3x1           = 19
EL_COLUMN_BOTTOM_3x1            = 20
EL_TOMB_PLATFORM_2_3x1          = 21
EL_DARK_BLUE_BRICK_4x3_LEFT     = 22
EL_BLUE_BRICK_3x2               = 23
EL_BLUE_BRICK_2x3               = 24
EL_DARK_BLUE_BRICK_3x3          = 25
EL_SEWER_GRATE_4x4              = 26
EL_BLUE_BRICK_7x1               = 27
EL_BLUE_BRICK_LEFT_1x5          = 28
EL_BLUE_BRICK_LEFT_1x3          = 29
EL_BLUE_BRICK_2x2               = 30
EL_DARK_BLUE_BRICK_4x3_TOP      = 31
EL_BLUE_BRICK_2x1               = 32
EL_BLUE_BRICK_4x3_TOP           = 33
EL_DARK_BLUE_BRICK_4x3_RIGHT    = 34
EL_BLUE_BRICK_6x3               = 36
EL_YELLOW_BRICK_2x2             = 37
EL_YELLOW_BRICK_3x2             = 38
EL_DARK_BLUE_BRICK_3x2          = 39
EL_DARK_BLUE_BRICK_3x2_LEFT_1   = 40
EL_BLUE_BRICK_4x3_TOP_RIGHT     = 41
EL_BLUE_BRICK_3x1               = 42
EL_TOMB_PLATFORM_1_2            = 43
EL_BLUE_BRICK_4x3_RIGHT_SIDE_3  = 44
EL_BLUE_BRICK_16x2              = 45
EL_BLUE_BRICK_14x2              = 46
EL_BLUE_BRICK_5x2               = 47

OBJ_DOG                         = 35

EL_GAME_BLUE_BRICK_4x1          = 64
EL_GAME_GRASS_3x2               = 65
EL_GAME_RED_ROCK_3x2            = 66
EL_GAME_BROWN_BRICK_3x2         = 67
EL_GAME_BROWN_BRICK_4x3         = 68
EL_GAME_BLUE_BRICK_4x3          = 69
EL_GAME_BLUE_BRICK_4x2          = 70
EL_GAME_BROWN_BRICK_4x2         = 71
EL_GAME_BROWN_BRICK_4x2_RIGHT   = 73
EL_GAME_YELLOW_WALL_RIGHT       = 74
EL_GAME_YELLOW_WALL_LEFT        = 75
EL_GAME_YELLOW_BRICK_2x1        = 76
EL_GAME_YELLOW_COLUMN_4x1       = 77
EL_GAME_BLUE_COLUMN_4x1         = 78
EL_GAME_PLATFORM_2_2            = 79
EL_GAME_PLATFORM_2_4            = 80
EL_GAME_BLUE_BRICK_4x2_RIGHT    = 81
EL_GAME_PLATFORM_2_6            = 82
EL_GAME_PLATFORM_2_9            = 83
EL_GAME_BLUE_BRICK_3x1          = 84
EL_GAME_BLUE_BRICK_4x2_LEFT_3   = 85
EL_GAME_BROWN_BRICK_4x2_LEFT_3  = 86
EL_GAME_ARC_LEFT_7x4            = 87
EL_GAME_ARC_RIGHT_7x4           = 88

OBJ_VASE                        = 72


ELEMENT_WIDTH_TABLE
          !byte 4,2,2,4,2,2,4,3,7,4,4,4,2,7,4,7,4,6,3,3,3,3,2,3,2,3,4,7,1,1,2,4,2,4,2
          ;dog
          !byte 2,6,2,3,3,1,2,3,2,3,16,14,5
          ;filler
          !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          ;game
          !byte 4,3,3,3,4,4,4,4,3,2,2,2,2,4,4,2,4,2,6,9,3,3,3,7,7
          
ELEMENT_HEIGHT_TABLE
          !byte 3,3,3,1,1,1,1,1,1,2,3,2,2,5,2,2,4,5,1,1,1,1,3,2,3,3,4,1,5,3,2,2,1,2,3
          ;dog
          !byte 3,3,2,2,2,2,2,1,1,3,2,2,2
          ;filler
          !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          ;game
          !byte 1,2,2,2,3,3,2,2,3,2,2,2,1,1,1,1,1,2,1,1,1,2,2,4,4
          

ELEMENT_TABLE_LO
          !byte <DATA_EL_BLUE_BRICK_4x3
          !byte <DATA_EL_BLUE_BRICK_4x3_RIGHT_SIDE
          !byte <DATA_EL_BLUE_BRICK_4x3_LEFT_SIDE
          !byte <DATA_EL_BLUE_BRICK_4x1
          !byte <DATA_EL_BLUE_BRICK_4x1 + 2
          !byte <DATA_EL_BLUE_BRICK_4x1
          !byte <DATA_EL_DARK_BLUE_BRICK_4x1
          !byte <DATA_EL_TOMB_PLATFORM_1_3x1
          !byte <DATA_EL_TOMB_PLATFORM_1_7x1
          !byte <( DATA_EL_BLUE_BRICK_4x3 + 4 )
          !byte <DATA_EL_DARK_BLUE_BRICK_4x3
          !byte <( DATA_EL_DARK_BLUE_BRICK_4x3 + 4 )
          !byte <DATA_EL_DARK_BLUE_BRICK_4x3_BOTTOM_R
          !byte <DATA_EL_HORNED_DEMON
          !byte <DATA_EL_BLUE_BRICK_4x2
          !byte <DATA_EL_BLUE_BRICK_7x2
          !byte <DATA_EL_BLUE_BRICK_4x4
          !byte <DATA_EL_BLUE_BRICK_6x5
          !byte <DATA_EL_COLUMN_TOP_3x1
          !byte <DATA_EL_COLUMN_SEGMENT_3x1
          !byte <DATA_EL_COLUMN_BOTTOM_3x1
          !byte <DATA_EL_TOMB_PLATFORM_2_3x1
          !byte <DATA_EL_DARK_BLUE_BRICK_4x3_LEFT
          !byte <DATA_EL_BLUE_BRICK_3x2
          !byte <DATA_EL_BLUE_BRICK_2x3
          !byte <DATA_EL_DARK_BLUE_BRICK_3x3
          !byte <DATA_EL_SEWER_GRATE_4x4
          !byte <DATA_EL_BLUE_BRICK_7x1
          !byte <DATA_EL_BLUE_BRICK_LEFT_1x5
          !byte <DATA_EL_BLUE_BRICK_LEFT_1x3
          !byte <DATA_EL_BLUE_BRICK_2x2
          !byte <DATA_EL_DARK_BLUE_BRICK_4x3
          !byte <DATA_EL_BLUE_BRICK_2x1
          !byte <DATA_EL_BLUE_BRICK_4x3
          !byte <DATA_EL_DARK_BLUE_BRICK_4x3_RIGHT
          !byte <DATA_OBJ_DOG_2x3
          !byte <DATA_EL_BLUE_BRICK_6x3
          !byte <DATA_EL_BLUE_BRICK_2x2
          !byte <DATA_EL_BLUE_BRICK_3x2
          !byte <DATA_EL_DARK_BLUE_BRICK_3x2
          !byte <DATA_EL_DARK_BLUE_BRICK_3x2_LEFT_1
          !byte <DATA_EL_BLUE_BRICK_4x3_TOP_RIGHT
          !byte <DATA_EL_BLUE_BRICK_3x1
          !byte <DATA_EL_TOMB_PLATFORM_1_2x1 
          !byte <DATA_EL_BLUE_BRICK_4x3_RIGHT_SIDE_3    
          !byte <DATA_EL_BLUE_BRICK_16x2
          !byte <DATA_EL_BLUE_BRICK_14x2
          !byte <DATA_EL_BLUE_BRICK_5x2
          !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          !byte <DATA_EL_GAME_BLUE_BRICK_4x1
          !byte <DATA_EL_GAME_GRASS_3x2
          !byte <DATA_EL_GAME_RED_ROCK_3x2
          !byte <DATA_EL_GAME_BROWN_BRICK_3x2
          !byte <DATA_EL_GAME_BROWN_BRICK_4x3
          !byte <DATA_EL_GAME_BLUE_BRICK_4x3
          !byte <DATA_EL_GAME_BLUE_BRICK_4x2
          !byte <DATA_EL_GAME_BROWN_BRICK_4x2
          !byte <DATA_OBJ_VASE
          !byte <DATA_EL_GAME_BROWN_BRICK_4x2_RIGHT
          !byte <DATA_EL_GAME_YELLOW_WALL_RIGHT
          !byte <DATA_EL_GAME_YELLOW_WALL_LEFT
          !byte <DATA_EL_GAME_YELLOW_BRICK_2x1
          !byte <DATA_EL_GAME_YELLOW_COLUMN_4x1
          !byte <DATA_EL_GAME_BLUE_COLUMN_4x1
          !byte <DATA_EL_GAME_PLATFORM_2_2
          !byte <DATA_EL_GAME_PLATFORM_2_4
          !byte <DATA_EL_GAME_BLUE_BRICK_4x2_RIGHT
          !byte <DATA_EL_GAME_PLATFORM_2_6
          !byte <DATA_EL_GAME_PLATFORM_2_9
          !byte <DATA_EL_GAME_BLUE_BRICK_3x1
          !byte <DATA_EL_GAME_BLUE_BRICK_4x2_LEFT_3
          !byte <DATA_EL_GAME_BROWN_BRICK_4x2_LEFT_3
          !byte <DATA_EL_GAME_ARC_LEFT_7x4
          !byte <DATA_EL_GAME_ARC_RIGHT_7x4
          
ELEMENT_TABLE_HI
          !byte >DATA_EL_BLUE_BRICK_4x3
          !byte >DATA_EL_BLUE_BRICK_4x3_RIGHT_SIDE
          !byte >DATA_EL_BLUE_BRICK_4x3_LEFT_SIDE
          !byte >DATA_EL_BLUE_BRICK_4x1
          !byte >DATA_EL_BLUE_BRICK_4x1 + 2
          !byte >DATA_EL_BLUE_BRICK_4x1
          !byte >DATA_EL_DARK_BLUE_BRICK_4x1
          !byte >DATA_EL_TOMB_PLATFORM_1_3x1
          !byte >DATA_EL_TOMB_PLATFORM_1_7x1
          !byte >( DATA_EL_BLUE_BRICK_4x3 + 4 )
          !byte >DATA_EL_DARK_BLUE_BRICK_4x3
          !byte >( DATA_EL_DARK_BLUE_BRICK_4x3 + 4 )
          !byte >DATA_EL_DARK_BLUE_BRICK_4x3_BOTTOM_R
          !byte >DATA_EL_HORNED_DEMON
          !byte >DATA_EL_BLUE_BRICK_4x2
          !byte >DATA_EL_BLUE_BRICK_7x2
          !byte >DATA_EL_BLUE_BRICK_4x4
          !byte >DATA_EL_BLUE_BRICK_6x5
          !byte >DATA_EL_COLUMN_TOP_3x1
          !byte >DATA_EL_COLUMN_SEGMENT_3x1
          !byte >DATA_EL_COLUMN_BOTTOM_3x1
          !byte >DATA_EL_TOMB_PLATFORM_2_3x1
          !byte >DATA_EL_DARK_BLUE_BRICK_4x3_LEFT
          !byte >DATA_EL_BLUE_BRICK_3x2
          !byte >DATA_EL_BLUE_BRICK_2x3
          !byte >DATA_EL_DARK_BLUE_BRICK_3x3
          !byte >DATA_EL_SEWER_GRATE_4x4
          !byte >DATA_EL_BLUE_BRICK_7x1
          !byte >DATA_EL_BLUE_BRICK_LEFT_1x5
          !byte >DATA_EL_BLUE_BRICK_LEFT_1x3
          !byte >DATA_EL_BLUE_BRICK_2x2
          !byte >DATA_EL_DARK_BLUE_BRICK_4x3
          !byte >DATA_EL_BLUE_BRICK_2x1
          !byte >DATA_EL_BLUE_BRICK_4x3
          !byte >DATA_EL_DARK_BLUE_BRICK_4x3_RIGHT
          !byte >DATA_OBJ_DOG_2x3
          !byte >DATA_EL_BLUE_BRICK_6x3
          !byte >DATA_EL_BLUE_BRICK_2x2
          !byte >DATA_EL_BLUE_BRICK_3x2
          !byte >DATA_EL_DARK_BLUE_BRICK_3x2
          !byte >DATA_EL_DARK_BLUE_BRICK_3x2_LEFT_1
          !byte >DATA_EL_BLUE_BRICK_4x3_TOP_RIGHT
          !byte >DATA_EL_BLUE_BRICK_3x1
          !byte >DATA_EL_TOMB_PLATFORM_1_2x1
          !byte >DATA_EL_BLUE_BRICK_4x3_RIGHT_SIDE_3
          !byte >DATA_EL_BLUE_BRICK_16x2
          !byte >DATA_EL_BLUE_BRICK_14x2
          !byte >DATA_EL_BLUE_BRICK_5x2
          !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          !byte >DATA_EL_GAME_BLUE_BRICK_4x1
          !byte >DATA_EL_GAME_GRASS_3x2
          !byte >DATA_EL_GAME_RED_ROCK_3x2
          !byte >DATA_EL_GAME_BROWN_BRICK_3x2
          !byte >DATA_EL_GAME_BROWN_BRICK_4x3
          !byte >DATA_EL_GAME_BLUE_BRICK_4x3
          !byte >DATA_EL_GAME_BLUE_BRICK_4x2
          !byte >DATA_EL_GAME_BROWN_BRICK_4x2
          !byte >DATA_OBJ_VASE
          !byte >DATA_EL_GAME_BROWN_BRICK_4x2_RIGHT
          !byte >DATA_EL_GAME_YELLOW_WALL_RIGHT
          !byte >DATA_EL_GAME_YELLOW_WALL_LEFT
          !byte >DATA_EL_GAME_YELLOW_BRICK_2x1
          !byte >DATA_EL_GAME_YELLOW_COLUMN_4x1
          !byte >DATA_EL_GAME_BLUE_COLUMN_4x1
          !byte >DATA_EL_GAME_PLATFORM_2_2
          !byte >DATA_EL_GAME_PLATFORM_2_4
          !byte >DATA_EL_GAME_BLUE_BRICK_4x2_RIGHT
          !byte >DATA_EL_GAME_PLATFORM_2_6
          !byte >DATA_EL_GAME_PLATFORM_2_9
          !byte >DATA_EL_GAME_BLUE_BRICK_3x1
          !byte >DATA_EL_GAME_BLUE_BRICK_4x2_LEFT_3
          !byte >DATA_EL_GAME_BROWN_BRICK_4x2_LEFT_3
          !byte >DATA_EL_GAME_ARC_LEFT_7x4
          !byte >DATA_EL_GAME_ARC_RIGHT_7x4
          
ELEMENT_TABLE_COLOR_LO
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_DARK_BLUE_BRICK_4x1
          !byte <COLOR_EL_TOMB_PLATFORM_1_7x1
          !byte <COLOR_EL_TOMB_PLATFORM_1_7x1
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_DARK_BLUE_BRICK_4x3
          !byte <( COLOR_EL_DARK_BLUE_BRICK_4x3 + 4 )
          !byte <COLOR_EL_DARK_BLUE_BRICK_4x3_BOTTOM_R
          !byte <COLOR_EL_HORNED_DEMON
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_DARK_BLUE_BRICK_4x3_LEFT
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_DARK_BLUE_BRICK_3x3
          !byte <COLOR_EL_SEWER_GRATE_4x4
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_DARK_BLUE_BRICK_4x3
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_DARK_BLUE_BRICK_4x3_RIGHT
          !byte <COLOR_OBJ_DOG_2x3
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_YELLOW_BRICK_3x2
          !byte <COLOR_EL_YELLOW_BRICK_3x2
          !byte <COLOR_EL_DARK_BLUE_BRICK_3x2
          !byte <COLOR_EL_DARK_BLUE_BRICK_4x3
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_TOMB_PLATFORM_1_7x1
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_GAME_GRASS_3x2
          !byte <COLOR_EL_GAME_RED_ROCK_3x2
          !byte <COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte <COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte <COLOR_OBJ_VASE
          !byte <COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte <COLOR_EL_YELLOW_BRICK_3x2
          !byte <COLOR_EL_YELLOW_BRICK_3x2
          !byte <COLOR_EL_YELLOW_BRICK_3x2
          !byte <COLOR_EL_YELLOW_BRICK_3x2
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_BLUE_BRICK_6x5
          !byte <COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte <COLOR_EL_GAME_ARC_LEFT_7x4
          !byte <COLOR_EL_GAME_ARC_RIGHT_7x4

ELEMENT_TABLE_COLOR_HI
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_DARK_BLUE_BRICK_4x1
          !byte >COLOR_EL_TOMB_PLATFORM_1_7x1
          !byte >COLOR_EL_TOMB_PLATFORM_1_7x1
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_DARK_BLUE_BRICK_4x3
          !byte >( COLOR_EL_DARK_BLUE_BRICK_4x3 + 4 )
          !byte >COLOR_EL_DARK_BLUE_BRICK_4x3_BOTTOM_R
          !byte >COLOR_EL_HORNED_DEMON
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_DARK_BLUE_BRICK_4x3_LEFT
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_DARK_BLUE_BRICK_3x3
          !byte >COLOR_EL_SEWER_GRATE_4x4
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_DARK_BLUE_BRICK_4x3
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_DARK_BLUE_BRICK_4x3_RIGHT
          !byte >COLOR_OBJ_DOG_2x3
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_YELLOW_BRICK_3x2
          !byte >COLOR_EL_YELLOW_BRICK_3x2
          !byte >COLOR_EL_DARK_BLUE_BRICK_3x2
          !byte >COLOR_EL_DARK_BLUE_BRICK_4x3
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_TOMB_PLATFORM_1_7x1
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_GAME_GRASS_3x2
          !byte >COLOR_EL_GAME_RED_ROCK_3x2
          !byte >COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte >COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte >COLOR_OBJ_VASE
          !byte >COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte >COLOR_EL_YELLOW_BRICK_3x2
          !byte >COLOR_EL_YELLOW_BRICK_3x2
          !byte >COLOR_EL_YELLOW_BRICK_3x2
          !byte >COLOR_EL_YELLOW_BRICK_3x2
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_BLUE_BRICK_6x5
          !byte >COLOR_EL_GAME_BROWN_BRICK_4x3
          !byte >COLOR_EL_GAME_ARC_LEFT_7x4
          !byte >COLOR_EL_GAME_ARC_RIGHT_7x4

;game / 2nd part
DATA_EL_GAME_BLUE_BRICK_4x1
          !byte 137,138,139,140
DATA_EL_GAME_BLUE_BRICK_3x1
          !byte 137,138,140

DATA_EL_GAME_BLUE_BRICK_4x2
          !byte 152,153,154,155
          !byte 168,169,170,171
DATA_EL_GAME_BLUE_BRICK_4x2_LEFT_3
          !byte 152,153,154
          !byte 168,169,170
DATA_EL_GAME_BLUE_BRICK_4x2_RIGHT
          !byte 154,155
          !byte 170,171

DATA_EL_GAME_BLUE_BRICK_4x3
          !byte 152,153,154,155
          !byte 172,173,174,175
          !byte 168,169,170,171

DATA_EL_GAME_PLATFORM_2_2
          !byte 134,136
DATA_EL_GAME_PLATFORM_2_4
          !byte 134,135,135,136
DATA_EL_GAME_PLATFORM_2_6
          !byte 134,135,135,135,135,136
DATA_EL_GAME_PLATFORM_2_9
          !byte 134,135,135,135,135,135,135,135,136

DATA_EL_GAME_GRASS_3x2          
          !byte 160,161,162
          !byte 176,177,178
COLOR_EL_GAME_GRASS_3x2          
          !byte 13,13,13
          !byte 10,10,10

DATA_EL_GAME_RED_ROCK_3x2          
          !byte 176,177,178
          !byte 192,193,194
COLOR_EL_GAME_RED_ROCK_3x2          
          !byte 10,10,10
          !byte 10,10,10

DATA_EL_GAME_BROWN_BRICK_3x2
          !byte 148,149,151
          !byte 144,145,147
DATA_EL_GAME_BROWN_BRICK_4x2
          !byte 148,149,150,151
          !byte 144,145,146,147
DATA_EL_GAME_BROWN_BRICK_4x2_RIGHT
          !byte 150,151
          !byte 146,147
DATA_EL_GAME_BROWN_BRICK_4x2_LEFT_3
          !byte 148,149,150
          !byte 144,145,146
DATA_EL_GAME_BROWN_BRICK_4x3
          !byte 148,149,150,151
          !byte 164,165,166,167
          !byte 144,145,146,147
COLOR_EL_GAME_BROWN_BRICK_4x3          
          !byte 15,15,15,15
          !byte 15,15,15,15
          !byte 15,15,15,15
          
DATA_EL_GAME_YELLOW_WALL_RIGHT
          !byte 245,246
          !byte 251,252
DATA_EL_GAME_YELLOW_WALL_LEFT
          !byte 163,179
          !byte 195,196

DATA_EL_GAME_YELLOW_BRICK_2x1
          !byte 141,209
          
DATA_EL_GAME_YELLOW_COLUMN_4x1
          !byte 180,181,182,183
DATA_EL_GAME_BLUE_COLUMN_4x1
          !byte 231,232,233,234

DATA_EL_GAME_ARC_LEFT_7x4          
          !byte 207,206,205,197,198,199,200
          !byte 223,211,212,213,214,215,216
          !byte 226,227,228,229,230,  0,  0
          !byte 242,243,244,  0,  0,  0,  0
COLOR_EL_GAME_ARC_LEFT_7x4          
          !byte  11, 11, 11, 11, 11, 11, 11
          !byte  11, 11, 11, 11, 11, 11, 11
          !byte  11, 11, 11, 11, 11,  0,  0
          !byte  11, 11, 11,  0,  0,  0,  0

DATA_EL_GAME_ARC_RIGHT_7x4          
          !byte 201,202,203,204,205,206,207
          !byte 217,218,219,220,221,222,223
          !byte   0,  0,235,236,237,238,239
          !byte   0,  0,  0,  0,253,254,255
COLOR_EL_GAME_ARC_RIGHT_7x4          
          !byte  11, 11, 11, 11, 11, 11, 11
          !byte  11, 11, 11, 11, 11, 11, 11
          !byte   0,  0, 11, 11, 11, 11, 11
          !byte   0,  0,  0,  0, 11, 11, 11

DATA_OBJ_VASE
          !byte 54,55,56
          !byte 70,71,72
          !byte 86,87,88
COLOR_OBJ_VASE
          !byte 13,13,13
          !byte 13,13,13
          !byte 13,13,13

DATA_EL_BLUE_BRICK_4x4
          !byte 241,242,243,244
          !byte 245,246,247,248
          !byte 245,246,247,248
          !byte 249,250,251,252
DATA_EL_BLUE_BRICK_4x3
          !byte 241,242,243,244
          !byte 245,246,247,248
          !byte 249,250,251,252
DATA_EL_BLUE_BRICK_4x2
          !byte 241,242,243,244
          !byte 249,250,251,252
DATA_EL_BLUE_BRICK_4x3_RIGHT_SIDE_3
          !byte 242,243,244
          !byte 246,247,248
          !byte 250,251,252
DATA_EL_BLUE_BRICK_3x2
          !byte 241,243,244
          !byte 249,251,252
DATA_EL_BLUE_BRICK_2x2
          !byte 241,244
          !byte 249,252
DATA_EL_BLUE_BRICK_5x2
          !byte 241,242,243,242,244
          !byte 249,250,251,250,252
DATA_EL_BLUE_BRICK_7x2
          !byte 241,242,243,242,243,242,244
          !byte 249,250,251,250,251,250,252
DATA_EL_BLUE_BRICK_16x2
          !byte 241,242,243,242,243,242,243,242,243,242,243,242,243,242,243,244
          !byte 249,250,251,250,251,250,251,250,251,250,251,250,251,250,251,252
DATA_EL_BLUE_BRICK_14x2
          !byte 241,242,243,242,243,242,243,242,243,242,243,242,243,244
          !byte 249,250,251,250,251,250,251,250,251,250,251,250,251,252
DATA_EL_BLUE_BRICK_6x5
          !byte 241,242,243,242,243,244
          !byte 245,246,246,246,247,248
          !byte 245,246,246,246,247,248
          !byte 245,246,246,246,247,248
          !byte 249,250,251,250,251,252
DATA_EL_BLUE_BRICK_6x3
          !byte 241,242,243,242,243,244
          !byte 245,246,246,246,247,248
          !byte 249,250,251,250,251,252
DATA_EL_BLUE_BRICK_2x3
          !byte 241,244
          !byte 245,248
          !byte 249,252
DATA_EL_BLUE_BRICK_LEFT_1x5
          !byte 241
          !byte 245
          !byte 245
          !byte 245
          !byte 249
DATA_EL_BLUE_BRICK_LEFT_1x3
          !byte 241
          !byte 245
          !byte 249
DATA_EL_BLUE_BRICK_4x1
          !byte 230,231,232,233
DATA_EL_BLUE_BRICK_3x1
          !byte 230,231,233
DATA_EL_BLUE_BRICK_7x1
          !byte 230,231,232,231,232,231,233

DATA_EL_BLUE_BRICK_2x1
          !byte 230,233
DATA_EL_BLUE_BRICK_4x3_TOP_RIGHT
          !byte 243,244
          !byte 247,248


COLOR_EL_BLUE_BRICK_6x5
          !byte 11,11,11,11,11,11
          !byte 11,11,11,11,11,11
          !byte 11,11,11,11,11,11
          !byte 11,11,11,11,11,11
          !byte 11,11,11,11,11,11
          !byte 11,11


DATA_EL_BLUE_BRICK_4x3_RIGHT_SIDE
          !byte 243,244
          !byte 247,248
          !byte 251,252
DATA_EL_BLUE_BRICK_4x3_LEFT_SIDE
          !byte 241,242
          !byte 245,246
          !byte 249,250

COLOR_EL_YELLOW_BRICK_3x2
          !byte 15,15,15
          !byte 15,15,15


DATA_EL_DARK_BLUE_BRICK_4x1
          !byte 60,61,62,63

COLOR_EL_DARK_BLUE_BRICK_4x1
          !byte 13,13,13,6
          
          
DATA_EL_TOMB_PLATFORM_1_3x1
          !byte 224,225,226
DATA_EL_TOMB_PLATFORM_1_2x1
          !byte 224,226
          
DATA_EL_TOMB_PLATFORM_2_3x1
          !byte 227,228,229
          
DATA_EL_TOMB_PLATFORM_1_7x1
          !byte 224,225,225,225,225,225,226
          
COLOR_EL_TOMB_PLATFORM_1_7x1          
          !byte 10,10,10,10,10,10,10

DATA_EL_DARK_BLUE_BRICK_4x3
          !byte 181,182,183,184
          !byte 197,198,199,200
          !byte 213,214,215,216
COLOR_EL_DARK_BLUE_BRICK_4x3
          !byte 13,13,13,13
          !byte 13, 8, 6, 6
          !byte 13, 6, 6, 6

COLOR_EL_DARK_BLUE_BRICK_3x2
          !byte 13,13,13
          !byte 13, 6, 6
          
DATA_EL_DARK_BLUE_BRICK_3x2_LEFT_1                    
          !byte 181
          !byte 213
          
DATA_EL_DARK_BLUE_BRICK_4x3_LEFT
          !byte 181,182
          !byte 197,198
          !byte 213,214
COLOR_EL_DARK_BLUE_BRICK_4x3_LEFT
          !byte 13,13
          !byte 13,13
          !byte 13, 6

DATA_EL_DARK_BLUE_BRICK_3x3
          !byte 181,182,184
          !byte 197,198,200
          !byte 213,214,216
COLOR_EL_DARK_BLUE_BRICK_3x3
          !byte 13,13,13
          !byte 13, 8, 6
          !byte 13, 6, 6

DATA_EL_DARK_BLUE_BRICK_3x2
          !byte 181,182,184
          !byte 213,214,216

DATA_EL_DARK_BLUE_BRICK_4x3_RIGHT
          !byte 182,184
          !byte 198,200
          !byte 214,216
COLOR_EL_DARK_BLUE_BRICK_4x3_RIGHT
          !byte 13,13
          !byte  8, 6
          !byte  6, 6

DATA_EL_DARK_BLUE_BRICK_4x3_BOTTOM_R
          !byte 199,200
          !byte 215,216
COLOR_EL_DARK_BLUE_BRICK_4x3_BOTTOM_R
          !byte 6, 6
          !byte 6, 6

DATA_EL_HORNED_DEMON
          !byte 153,154,155,156,157,158,159
          !byte 169,170,171,172,173,174,175
          !byte 185,186,187,188,189,190,191
          !byte   0,202,203,204,205,206,  0
          !byte   0,218,219,220,221,222,  0
          
COLOR_EL_HORNED_DEMON
          !byte 13,13,13, 6,13,13,13
          !byte 13,13,13,13,13,13,13
          !byte 13,13,13,13,13,13,13
          !byte  8,13,13,13,13,13, 8
          !byte  8, 6, 6,13, 6, 6, 8
          
DATA_EL_COLUMN_TOP_3x1 
          !byte 234,235,236
          
DATA_EL_COLUMN_SEGMENT_3x1 
          !byte 237,238,239
          
DATA_EL_COLUMN_BOTTOM_3x1 
          !byte 253,254,255
          
DATA_EL_SEWER_GRATE_4x4
          !byte  64, 65, 66, 67
          !byte  80, 81, 82, 83
          !byte  96, 97, 98, 99
          !byte 112,113,114,115

COLOR_EL_SEWER_GRATE_4x4
          !byte 13,13,13,13
          !byte 13, 2, 2,13
          !byte 13, 2, 2, 6
          !byte 13,13,13,13
          
          
          
          
DATA_OBJ_DOG_2x3
          !byte  16, 17
          !byte  32, 33
          !byte  48, 49

COLOR_OBJ_DOG_2x3
          !byte 13, 6
          !byte 13,13
          !byte 13,13
 