# display manager start
function start() {
  startx ~/.xinitrc $1
}

# Force alacritty to recover color scheme
if command -v wal > /dev/null 2>&1 && [ "$TERM" = "xterm-kitty" ]; then
    # Run 'wal' command with options to recover color scheme, ignore output, and ignore updating other apps
    wal -Rqe
fi

PS1="\[\033[37;42m\]\w\[\033[0m\] \$(get_git_branch_ps1)"