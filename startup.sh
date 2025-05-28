# display manager start
function start() {
  startx ~/.xinitrc $1
}

PS1="\033[37;42m\w\033[0m \$(get_git_branch_ps1)"
