#!/usr/bin/env bash

# Constants
TH=20   #Snap threshold
WB=4    #Window border size

# Get params
IX=${1:-0}
IY=${2:-0}
DRX=$(( IX < 0 ? -1 : IX > 0 ? 1 : 0 ))
DRY=$(( IY < 0 ? -1 : IY > 0 ? 1 : 0 ))
DTX=$(( IX < 0 ? -IX : IX ))
DTY=$(( IY < 0 ? -IY : IY ))

# Get screen dimensions
read SW SH SX SY < <(xrandr --query | awk '/ connected/ { match($0, /([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+)/, m); print m[1], m[2], m[3], m[4]; exit }')
echo "SCR: X:${SX} Y:${SY} W:${SW} H:${SH}"

# Get window dimensions
win=$(xdotool getactivewindow)
dim=$(xdotool getwindowgeometry --shell "$win")
eval "$dim" #exposes X Y WIDTH HEIGHT
WL=$((X - SX))
WR=$((WL + WIDTH))

# Determine snaps
SNL=$((WL <= TH ))
SNR=$((WR >= SW - SX - TH ))

echo "WIN: ${win} X:${X} Y:${Y} W:${WIDTH} H:${HEIGHT}"
echo "      Left:${WL} Right:${WR}"
echo "      SnapL:${SNL} SnapR:${SNR}"

# Determine new dimensions and position
NX=$((X))
NY=$((Y))
NW=$((WIDTH))
NH=$((HEIGHT))

if (( DRX != 0 )); then
    # Grow or shrink width
    if ((   (SNL == 0 && SNR == 0) ||
            (SNL && !SNR && DRX == 1) ||
            (SNR && !SNL && DRX == -1)
    )); then
        NW=$((WIDTH + DTX))
    else
        NW=$((WIDTH - DTX))
    fi

    # Move window left or right
    if (( SNL == 0 && DRX == -1 )); then
        NX=$((X - DTX))
    elif (( SNR == 1 && DRX == 1 )); then
        NX=$((X + DTX))
    fi
    
    # Constrain to left window border
    if (( NX <= TH )); then
        NX=$((WB))
    fi
    
    # Constrain to right window border
    if (( NX + NW >= (SW - SX) - TH )); then
        NW=$(( (SW - SX) - (NX + WB) ))
        #NX=$(( (SW - SX) - NW ))
        echo "here ${NW}"
    fi
fi

# TODO: add up/ down movement

# Temp; need to figure out how to actually fix this
# for windows that mess with the title bar
# This is a hack
if xprop -id "$win" WM_CLASS | grep -qi -e 'firefox' -e 'librewolf'; then
  NY=$((NY - 26))
fi

xdotool windowsize "$win" "$NW" "$NH"
xdotool windowmove "$win" "$NX" "$NY"