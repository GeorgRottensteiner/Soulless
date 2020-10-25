EL_END1_COLUMN_TOP_LEFT = 0
EL_END1_COLUMN_BOTTOM_LEFT = 1
EL_END1_COLUMN_LEFT = 2
EL_END1_COLUMN_TOP_RIGHT = 3
EL_END1_COLUMN_RIGHT = 4
EL_END1_COLUMN_BOTTOM_RIGHT = 5
EL_END1_ARC = 6
EL_END1_DOORH = 7
EL_END1_TORCH_SMALL_L = 8
EL_END1_TORCH_TALL_L = 9
EL_END1_TORCH_TALL_R = 10
EL_END1_TORCH_SMALL_R = 11
EL_END1_FLOOR.SMALL = 12
EL_END1_FLOOR.FRONT = 13
EL_END2_CASTLE = 14
EL_END2_CLIFF = 15
EL_END2_TEMPLE = 16
EL_END2_SKY2 = 17
EL_END2_SKY1 = 18
EL_END2_BLUESKY = 19

END1ELEMENT_WIDTH_TABLE
!byte 3,3,3,3,3,3,8,8,2,2,2,2,10,16
;END2ELEMENT_WIDTH_TABLE
!byte 14,8,10,14,2,2

END1ELEMENT_HEIGHT_TABLE
!byte 3,3,1,3,1,3,4,1,2,3,3,2,1,3
;END2ELEMENT_HEIGHT_TABLE
!byte 12,9,11,5,12,2

END1ELEMENT_TABLE_LO
!byte <DATA_EL_END1_COLUMN_TOP_LEFT
!byte <DATA_EL_END1_COLUMN_BOTTOM_LEFT
!byte <DATA_EL_END1_COLUMN_LEFT
!byte <DATA_EL_END1_COLUMN_TOP_RIGHT
!byte <DATA_EL_END1_COLUMN_RIGHT
!byte <DATA_EL_END1_COLUMN_BOTTOM_RIGHT
!byte <DATA_EL_END1_ARC
!byte <DATA_EL_END1_DOORH
!byte <DATA_EL_END1_TORCH_TALL_L+0
!byte <DATA_EL_END1_TORCH_TALL_L
!byte <DATA_EL_END1_TORCH_TALL_R
!byte <DATA_EL_END1_TORCH_TALL_R+0
!byte <DATA_EL_END1_FLOOR.SMALL
!byte <DATA_EL_END1_FLOOR.FRONT
;END2ELEMENT_TABLE_LO
!byte <DATA_EL_END2_CASTLE
!byte <DATA_EL_END2_CLIFF
!byte <DATA_EL_END2_TEMPLE
!byte <DATA_EL_END2_SKY2
!byte <DATA_EL_END2_SKY1
!byte <DATA_EL_END2_CASTLE+0


END1ELEMENT_TABLE_HI
!byte >DATA_EL_END1_COLUMN_TOP_LEFT
!byte >DATA_EL_END1_COLUMN_BOTTOM_LEFT
!byte >DATA_EL_END1_COLUMN_LEFT
!byte >DATA_EL_END1_COLUMN_TOP_RIGHT
!byte >DATA_EL_END1_COLUMN_RIGHT
!byte >DATA_EL_END1_COLUMN_BOTTOM_RIGHT
!byte >DATA_EL_END1_ARC
!byte >DATA_EL_END1_DOORH
!byte >DATA_EL_END1_TORCH_TALL_L+0
!byte >DATA_EL_END1_TORCH_TALL_L
!byte >DATA_EL_END1_TORCH_TALL_R
!byte >DATA_EL_END1_TORCH_TALL_R+0
!byte >DATA_EL_END1_FLOOR.SMALL
!byte >DATA_EL_END1_FLOOR.FRONT
;END2ELEMENT_TABLE_HI
!byte >DATA_EL_END2_CASTLE
!byte >DATA_EL_END2_CLIFF
!byte >DATA_EL_END2_TEMPLE
!byte >DATA_EL_END2_SKY2
!byte >DATA_EL_END2_SKY1
!byte >DATA_EL_END2_CASTLE+0

END1ELEMENT_COLOR_TABLE_HI
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_ARC
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_TORCH_TALL_R+0
!byte >COLOR_EL_END1_TORCH_TALL_R+0
!byte >COLOR_EL_END1_TORCH_TALL_R
!byte >COLOR_EL_END1_TORCH_TALL_R+0
!byte >COLOR_EL_END1_ARC+16
!byte >COLOR_EL_END1_FLOOR.FRONT
;END2ELEMENT_COLOR_TABLE_HI
!byte >COLOR_EL_END2_CASTLE
!byte >COLOR_EL_END2_CLIFF
!byte >COLOR_EL_END2_TEMPLE
!byte >COLOR_EL_END2_TEMPLE+33
!byte >COLOR_EL_END2_CASTLE+0
!byte >COLOR_EL_END2_CASTLE+0

END1ELEMENT_COLOR_TABLE_LO
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_ARC
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_TORCH_TALL_R+0
!byte <COLOR_EL_END1_TORCH_TALL_R+0
!byte <COLOR_EL_END1_TORCH_TALL_R
!byte <COLOR_EL_END1_TORCH_TALL_R+0
!byte <COLOR_EL_END1_ARC+16
!byte <COLOR_EL_END1_FLOOR.FRONT
;END2ELEMENT_COLOR_TABLE_LO
!byte <COLOR_EL_END2_CASTLE
!byte <COLOR_EL_END2_CLIFF
!byte <COLOR_EL_END2_TEMPLE
!byte <COLOR_EL_END2_TEMPLE+33
!byte <COLOR_EL_END2_CASTLE+0
!byte <COLOR_EL_END2_CASTLE+0




DATA_EL_END1_COLUMN_TOP_LEFT
!byte 48,49,50,64,65,66,51,52,53
DATA_EL_END1_COLUMN_BOTTOM_LEFT
!byte 51,52,53,67,68,69,83,84,85
DATA_EL_END1_COLUMN_TOP_RIGHT
!byte 54,55,56,70,71,72,57,58,59
DATA_EL_END1_COLUMN_RIGHT
!byte 44,45,46
DATA_EL_END1_COLUMN_BOTTOM_RIGHT
!byte 86,87,88,73,74,75,83,84,85
DATA_EL_END1_ARC
!byte 16,16,60,61,62,63,16,16,16,76,77,47,47,78,79,16,123,47,47,47,47,47,47,124,139,47,47,47,47,47,47,140
DATA_EL_END1_DOORH
!byte 47,47,47,47,47,47,47,47
DATA_EL_END1_TORCH_TALL_L
!byte 92,93,94,95,125,0
DATA_EL_END1_TORCH_TALL_R
!byte 121,122,137,138,0,126
DATA_EL_END1_FLOOR.SMALL
!byte 114,115,116,117,118,130,131,132,133,134
DATA_EL_END1_FLOOR.FRONT
!byte 96,97,98,99,100,101,102,128,129,141,106,107,108,109,110,111,112,0,0,0,0,0,0,119,120,0,0,0,0,0,0,127,0,0,0,0,0,0,0,135,136,0,0,0,0,0,0,0


DATA_EL_END1_COLUMN_LEFT
!byte 1,2,3
DATA_EL_END2_CASTLE
!byte 1,1,1,1,1,92,93,94,95,76,76,76,76,76,1,1,1,1,1,64,2,3,65,1,109,110,111,249,1,1,1,1,1,80,0,0,81,1,1,1,1,1,66,194,194,78,79,66,48,49,82,78,79,66,66,66,124,124,124,125,0,0,0,0,0,0,126,127,127,127,132,133,133,133,44,45,0,0,46,47,237,238,239,239,151,152,153,154,0,0,0,0,0,0,154,135,136,137,144,0,0,0,0,0,0,0,0,0,0,0,0,168,130,0,0,0,0,0,0,0,0,0,0,0,0,184,146,0,0,0,0,0,0,0,0,0,0,0,0,200,16,0,0,0,0,0,0,0,0,0,0,0,0,16,145,0,0,0,0,0,0,0,0,0,0,0,0,232
DATA_EL_END2_CLIFF
!byte 224,224,225,226,227,228,229,230,138,138,139,140,141,0,0,0,154,154,155,156,157,0,0,0,171,171,171,172,173,174,0,0,185,185,186,188,189,190,191,0,200,201,202,204,205,206,207,0,16,16,220,221,222,223,0,0,233,234,235,236,0,0,0,0,219,0,0,0,0,0,0,0
DATA_EL_END2_TEMPLE
!byte 1,1,52,53,54,1,1,1,1,1,1,67,68,69,70,0,0,0,0,0,1,83,84,85,86,0,0,0,0,0,1,1,1,1,100,101,102,0,0,0,1,1,1,1,55,56,57,58,59,60,1,1,1,1,71,72,73,74,75,1,1,1,1,1,1,88,89,90,91,1,66,66,66,66,66,104,105,106,107,108,116,117,118,118,119,120,121,0,0,0,177,178,179,219,93,0,0,0,0,0,219,0,0,0,0,0,0,0,0,0
DATA_EL_END2_SKY2
!byte 77,77,211,212,212,212,211,212,211,211,211,210,210,208,97,97,98,98,251,99,112,112,112,254,113,114,255,255,1,1,1,1,192,192,193,194,195,196,197,198,199,215,82,82,208,208,209,210,211,212,213,214,215,216,217,218,224,225,226,227,228,229,230,231,240,241,242,141,0,0
DATA_EL_END2_SKY1
!byte 66,66,122,123,131,131,147,213,163,163,128,129,146,146,16,16,16,16,16,16,148,149,0,165

COLOR_EL_END1_TORCH_TALL_R
!byte 12,12,12,12,12,12

COLOR_EL_END2_CASTLE
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,12,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
COLOR_EL_END2_CLIFF
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,12,12,12,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14
COLOR_EL_END2_TEMPLE
!byte 14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,0,0,0,0,0,0,0,0,0

COLOR_EL_END1_ARC
!byte 0,0,6,6,6,6,0,0,0,6,6,6,6,6,6,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
COLOR_EL_END1_FLOOR.FRONT
!byte 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,0,0,0,0,0,0


END1_LEVEL_1
          !byte LD_ELEMENT,2,0,EL_END1_COLUMN_TOP_LEFT
          !byte 2,21,EL_END1_COLUMN_BOTTOM_LEFT
          !byte LD_ELEMENT_LINE_V,2,3,18,EL_END1_COLUMN_LEFT
          !byte 7,7,11,EL_END1_COLUMN_LEFT
          !byte LD_ELEMENT,7,4,EL_END1_COLUMN_TOP_LEFT
          !byte 7,18,EL_END1_COLUMN_BOTTOM_LEFT
          !byte 12,7,EL_END1_COLUMN_TOP_LEFT
          !byte 12,15,EL_END1_COLUMN_BOTTOM_LEFT
          !byte LD_ELEMENT_LINE_V,12,170,EL_END1_COLUMN_LEFT
          !byte LD_ELEMENT,35,0,EL_END1_COLUMN_TOP_RIGHT
          !byte 35,21,EL_END1_COLUMN_BOTTOM_RIGHT
          !byte LD_ELEMENT_LINE_V,35,3,18,EL_END1_COLUMN_RIGHT
          !byte LD_ELEMENT,30,4,EL_END1_COLUMN_TOP_RIGHT
          !byte 30,18,EL_END1_COLUMN_BOTTOM_RIGHT
          !byte LD_ELEMENT_LINE_V,30,6,12,EL_END1_COLUMN_RIGHT
          !byte LD_ELEMENT,25,7,EL_END1_COLUMN_TOP_RIGHT
          !byte 25,15,EL_END1_COLUMN_BOTTOM_RIGHT
          !byte LD_ELEMENT_LINE_V,25,170,EL_END1_COLUMN_RIGHT
          !byte LD_ELEMENT,16,7,EL_END1_ARC
          !byte LD_ELEMENT_LINE_V,16,203,EL_END1_DOORH
          !byte LD_ELEMENT,10,12,EL_END1_TORCH_SMALL_L
          !byte 5,12,EL_END1_TORCH_TALL_L
          !byte 33,12,EL_END1_TORCH_TALL_R
          !byte 28,12,EL_END1_TORCH_SMALL_R
          !byte 15,18,EL_END1_FLOOR.SMALL
          !byte 12,19,EL_END1_FLOOR.FRONT

          ;LD_OBJECT,x,y,type,zone,true index
          
          !byte LD_SPECIAL,0,20
          !byte LD_SPECIAL,1,150
          !byte LD_OBJECT,6,11,TYPE_TORCH,0,0
          !byte 11,11,TYPE_TORCH,0,1
          !byte 29,11,TYPE_TORCH,0,2
          !byte 34,11,TYPE_TORCH,0,3
          !byte 19,11,TYPE_INVISIBLE,0,4
          !byte 22,11,TYPE_INVISIBLE,0,5
          ;!byte 19,12,TYPE_PLAYERFEETL,0,4
          ;!byte 22,12,TYPE_PLAYERFEETR,0,5
          !byte 19,14,TYPE_PLAYERUL,0,6
          !byte 22,14,TYPE_PLAYERUR,0,7
          !byte 19,16,TYPE_PLAYERLL,1,0
          !byte 22,16,TYPE_PLAYERLR,1,1
          !byte 19,14,TYPE_PLAYERUL,1,6
          !byte 22,14,TYPE_PLAYERUR,1,7
          !byte LD_END

END2_LEVEL_1
          !byte LD_AREA,0,0,32,10,1,14
          !byte LD_ELEMENT,2,7,EL_END2_CASTLE
          !byte 16,11,EL_END2_CLIFF
          !byte 30,0,EL_END2_TEMPLE
          !byte 16,7,EL_END2_SKY2
          !byte 0,10,EL_END2_SKY1
          !byte LD_LINE_H,9,5,1,142,6
          !byte 10,5,1,143,6
          !byte 9,6,1,150,6
          !byte LD_OBJECT,4,12,TYPE_FLAG,0,0
          !byte 15,12,TYPE_FLAG,0,1
          ;!byte 10,6,TYPE_FLAG,1,2
          !byte 43,6,TYPE_RUNNING_PLAYER,0,2
          !byte 33,9,TYPE_BIRD,0,3
          !byte 32,11,TYPE_BIRD,0,4
          !byte 31,10,TYPE_BIRD,0,5
          !byte 32,10,TYPE_BIRD,0,6
          !byte LD_END
