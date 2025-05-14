
# default screen info for g-16 laptop (xrandr output):
# Screen 0 eDP-1: current 2560 x 1600 (16:10 aspect ration) 240hz
# --> xrandr --output eDP-1 --mode 2560x1600 --rate 240.00
#
# default screen info for desktop:
# DP-2:
# --> xrandr --output DP-2 --mode 3840x2160 --rate 60.00
# DP-4:
# --> xrandr --output DP-4 --mode 3840x2160 --rate 60.00
#
# Based on the current system, go to .bashrc and create aliases to
# the corresponding screen functions. Eg,
# alias screen=screen_g16
# alias screen_default=screen_g16_default


# G16 laptop screen functions
# TODO: g16 external screen functions for known monitors
function screen_g16() {
    xrandr --output eDP-1 --mode 1920x1200 --rate 240.00
}

function screen_g16_default() {
    xrandr --output eDP-1 --mode 2560x1600 --rate 240.00
}

#Desktop screen functions
function screen_desktop() {
    xrandr --output DP-2 --primary --mode 2560x1440 --rate 143.86 --pos 1440x700 --output DP-4 --mode 2560x1440 --rate 59.95 --rotate left --pos 0x0
}

