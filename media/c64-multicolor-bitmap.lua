local sLine = "          !byte ";
local BackColor = GetPixelRGB( 0, 0 );

_ALERT( "Backcolor " .. BackColor );

--for j = 0,16 do
--  local Color = GetPixelRGB( 0, j * 2 );
--  _ALERT( "Color " .. j .. " = " .. Color );
--end

local ColorRam = {};
local BitmapRam = {};
local ScreenCharRam = {};

for i = 0,7999 do
  BitmapRam[i] = 0;
end

for i = 0,999 do
  ColorRam[i] = 0;
  ScreenCharRam[i] = 0;
end

local Colors =
{
};

Colors[00] = -16777216;
Colors[01] = -1
Colors[02] = -8192000
Colors[03] = -7651023
Colors[04] = -7650900
Colors[05] = -9786303
Colors[06] = -13028956
Colors[07] = -2761101
Colors[08] = -7054816
Colors[09] = -10862336
Colors[10] = -4361366
Colors[11] = -11382190
Colors[12] = -8158333
Colors[13] = -5443957
Colors[14] = -8686626
Colors[15] = -5460820

function TableSize( Table )
  local k,v = nil;
  local size = 0;
  
  for k,v in pairs( Table ) do
    size = size + 1;
  end
  return size;
end

--_ALERT( "now " .. TableSize( Colors ) .. " colors" );

function FindColorIndex( Pixel )
  if ( Pixel == BackColor ) then
    return -1;
  end;
  for i = 0,15 do
    --_ALERT( "Colors[" .. i .. "] = " .. Colors[i] );
    if ( Pixel == Colors[i] ) then
      return i;
    end
  end
  return -2;
end

ClearSelection();

local toomanycolors = false;

for y = 0,24 do
  for x = 0,39 do
    --ein zeichen-block
    local CharColors = {};
    for char_y = 0,7 do
      for char_x = 0,3 do
        local pixel = GetPixelRGB( x * 8 + char_x * 2, y * 8 + char_y );
        local colorIndex = FindColorIndex( pixel );
        if ( colorIndex == -2 ) then
          _ALERT( "Unknown pixel color " .. pixel .. " at " .. ( x * 8 + char_x * 2 ) .. "," .. ( y * 8 + char_y ) );
          return;
        end
        if ( colorIndex == -1 ) then
          --Hintergrundfarbe
        else
          --andere Farbe
          --TODO alle Farben in einem Block merken und dann auf CharSetRam und ColorRam aufteilen
          CharColors[colorIndex] = 1;
        end
      end
    end
    --sind mehr als 3 Farben in CharColors?
    local ColorsInBlock = TableSize( CharColors );
    if ( ColorsInBlock > 3 ) then
      _ALERT( "Too many colors in block " .. ( x * 8 ) .. "," .. ( y * 8 ) );
      AddSelectionRect( x * 8, y * 8, 8, 8 );
      toomanycolors = true;
    else
      if ( ColorsInBlock > 0 ) then
        local k,v = nil;
        local i = 0;
        local found = false;
        for k,v in pairs( CharColors ) do
          --je nach i v zuweisen
          if ( i == 0 ) then
            --oberes nibble im screen char ram
            if ( ScreenCharRam[x + y * 40] == nil ) then
              ScreenCharRam[x + y * 40] = 0;
            end;
            local value = ScreenCharRam[x + y * 40];
            --_ALERT( "vorher " .. value .. " -> insert " .. k );
            value = bit.band( value, 15 );
            value = bit.bor( value, 16 * k );
            ScreenCharRam[x + y * 40] = value;
            --_ALERT( "danach " .. value );
            CharColors[k] = 01;
          elseif ( i == 1 ) then
            --unteres nibble im screen char ram
            if ( ScreenCharRam[x + y * 40] == nil ) then
              ScreenCharRam[x + y * 40] = 0;
            end;
            local value = ScreenCharRam[x + y * 40];
            --_ALERT( "vorher " .. value .. " -> insert " .. k );
            value = bit.band( value, 240 );
            value = bit.bor( value, k );
            ScreenCharRam[x + y * 40] = value;
            --_ALERT( "danach " .. value );
            CharColors[k] = 2;
          elseif ( i == 2 ) then
            --ins color ram
            ColorRam[x + y * 40] = k;
            CharColors[k] = 3;
          end
          i = i + 1;
        end
      end    
      --jetzt die bits schreiben
      if ( ( x == 4 ) and ( y == 13 ) ) then
        found = true;
      end;
      for char_y = 0,7 do
        for char_x = 0,3 do
          local pixel = GetPixelRGB( x * 8 + char_x * 2, y * 8 + char_y );
          local colorIndex = FindColorIndex( pixel );
          if ( colorIndex == -1 ) then
            --Hintergrundfarbe
          else
            --andere Farbe
            --TODO alle Farben in einem Block merken und dann auf CharSetRam und ColorRam aufteilen
            local colorvalue = CharColors[colorIndex];
            local bitmapindex = x * 8 + y * 320 + char_y;
            if ( char_x == 0 ) then
              local value = BitmapRam[bitmapindex];
              value = bit.band( value, 63 );
              value = bit.bor( value, colorvalue * 64 );
              BitmapRam[bitmapindex] = value;
            elseif ( char_x == 1 ) then
              local value = BitmapRam[bitmapindex];
              value = bit.band( value, 207 );
              value = bit.bor( value, colorvalue * 16 );
              BitmapRam[bitmapindex] = value;
            elseif ( char_x == 2 ) then
              local value = BitmapRam[bitmapindex];
              value = bit.band( value, 243 );
              value = bit.bor( value, colorvalue * 4 );
              BitmapRam[bitmapindex] = value;
            elseif ( char_x == 3 ) then
              local value = BitmapRam[bitmapindex];
              value = bit.band( value, 252 );
              value = bit.bor( value, colorvalue );
              BitmapRam[bitmapindex] = value;
            end
          end
        end
      end
    end
  end
end

if ( toomanycolors ) then
  _ALERT( "Image errornous, too many colors in block detected" );
  return;
end
_ALERT( "colorram" );
local bitmapline = "        !byte ";
for i = 0,999 do
  bitmapline = bitmapline .. ColorRam[i];
  if ( math.mod( i, 32 ) == 31 ) then
    _ALERT( bitmapline );
    bitmapline = "        !byte ";
  elseif ( i < 999 ) then
    bitmapline = bitmapline .. ",";
  end
end

_ALERT( "*=$4000" );
bitmapline = "        !byte ";
for i = 0,7999 do
  bitmapline = bitmapline .. BitmapRam[i];
  if ( math.mod( i, 32 ) == 31 ) then
    _ALERT( bitmapline );
    bitmapline = "        !byte ";
  elseif ( i < 7999 ) then
    bitmapline = bitmapline .. ",";
  end
end

_ALERT( "* = $6000" );
bitmapline = "        !byte ";
for i = 0,999 do
  bitmapline = bitmapline .. ScreenCharRam[i];
  if ( math.mod( i, 32 ) == 31 ) then
    _ALERT( bitmapline );
    bitmapline = "        !byte ";
  elseif ( i < 999 ) then
    bitmapline = bitmapline .. ",";
  end
end
_ALERT( bitmapline );