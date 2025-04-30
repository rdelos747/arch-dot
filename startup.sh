# display manager start
function start() {
  startx ~/.xinitrc $1
}

PS1="\w \$(get_git_branch_ps1)"
