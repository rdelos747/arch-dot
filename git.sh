alias gcb='git rev-parse --symbolic-full-name --abbrev-ref HEAD'

function get_git_branch() {
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then
        echo `gcb`  
    else
        echo "no-branch"
    fi
}

function get_git_branch_ps1() {
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then
        echo "${smso}`gcb`${rmso} "  
    else
        echo ""
    fi
}
