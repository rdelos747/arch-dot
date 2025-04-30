# Arch configuration setup

Setup configuration for arch linux

# Outside of dotfiles

## .bashrc

Add the following to source the configurations:
```
source ~/dotfiles/.source.sh
```

## .xinitrc

The `start` command will start x11 with the window manager specified in the first argument. For that to work, create a case statement in .xinitrc with the supported options. For example:
```
case $session in 
    plasma  )   exec startplasma-x11;;
    dwm     )   exec dwm;;
    awesome )   exec awesome;;
    *       )   echo "unknown";;
esac
```