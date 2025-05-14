
# default screen info for g-16 laptop (xrandr output):
# Screen 0 eDP-1: current 2560 x 1600 (16:10 aspect ration) 240hz
# --> xrandr --output eDP-1 --mode 2560x1600 --rate 240.00
#
# xrandr example:
# xrandr --output DVI-D-0 --mode 1920x1080 --rate 60.00
function screen() {
    xrandr --output eDP-1 --mode 1920x1200 --rate 240.00
}

function screend() {
    xrandr --output eDP-1 --mode 2560x1600  --rate 240.00
}
