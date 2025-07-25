# Arch configuration setup

Setup configuration for arch linux

# Outside of dotfiles

## Alacritty

Add the following to the Alacritty config `~/.config/alacritty/alacritty.toml`
```
[font]
size = 8.0

[window]
opacity = 0.8
```

## AwesomeWM

Tell Awesome's rc.lua to look for our updated configs in the dotfiles.

1. cd /etc/xdg/awesome to access the config directory.
2. create directory `/config`.
3. symlink that to `~/dotfiles/awesome`.
4. Create a backup of the default rc.lua.
5. Update rc.lua to contain the following:
```
require("config.awesome.rc")
```

Create Xresources symlink so awesome can read wal's config.
```
cd ~
ln -s ~/.cache/wal//colors.Xresources .Xresources 
```

## .bashrc

Add the following to source the configurations:
```
source ~/dotfiles/.source.sh
```

## .xinitrc

The `start` command will start x11 with the window manager specified in the first argument. For that to work, create a case statement in .xinitrc with the supported options. For example:
```
session=$1
case $session in 
    plasma  )   exec startplasma-x11;;
    dwm     )   exec dwm;;
    awesome )   exec awesome;;
    *       )   echo "unknown";;
esac
```

# Useful commands
Not specifically related to system set up. Documenting useful commands/ snippets as I learn arch linux. These are most often used when running AwesomeWm.

```
acpi
```
- Battery life

```
journalctl -r
```
- Show recent system journal in reverse order.

```
journalctl -b-1
```
- Show journal from previous session. Useful when debugging system crash.

```
nm-applet
```
- Connect to wifi.

```
pactl set-sink-volume @DEFAULT_SINK@ 75%
```
- Set volume.

```
ps -C <command name>
```
- List the pid of all programs under that command.
- Eg `ps -C alacritty` to find pid when alacritty crashes :(

```
systemctl --user start mpd
systemctl --user stop mpd

rmpc
```
- Start music player daemon and run `rmpc` frontend.

```
wal -i ~/Pictures/desktop-images
```
- Randomly sets a wallpaper and updates Xresources color scheme.
- Note: Alacritty will reflect this immediately, but Awesome needs to be restarted to see in the WM.

```
Xephyr -br -ac -noreset -screen 1000x1000 :1

DISPLAY=:1 awesome
```
- Create a nested x server within another wm. Useful for debugging issues with a wm.
- First command creates the x server window at the desired size with the given index.
- Second command runs the desired program in the specififed display index (use the index from command above).

# Required packages
- awesome
- feh
- lua-language-server
- network-manager-applet (nm-applet)
- nvidia drivers (system dependent)
- picom
- plasma
- wal
- xorg-server-xephyr
