# Git aliases:
alias got='git'
alias gut='git'

alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gd='git diff'
alias gdl='git diff HEAD HEAD~1'
alias goto='git checkout'
alias gk='gitk--all&'
alias gx='gitx --all'
alias gh='git hist'
alias gha='git hist --all'
alias gpu='git pull'
alias gpur='git pull --rebase'
alias gpurum='git pull --rebase upstream master'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpum='git push upstream master'
alias gre='git reset'

# Hub aliases
alias gpr="git pull-request"

clone () {
    if [ $# -lt 1 ]; then
        echo "Usage: clone <REMOTE> <PLACE_HERE?>"
        return 1
    fi

    local get_this=$1
    local temp=${2-$1}
    local put_it_here=$(basename $temp)
    git clone $get_this $put_it_here
    scd $put_it_here
    echo "\n"
    ls
}

fork () {
    if [ $# -gt 0 ]; then
        echo "Usage (when in a git repo): fork"
        return 1
    fi

    # Fail if we are not in a git repo
    git fork || return 1

    # Rename to origin/upstream instead of reem/origin
    git remote rename origin upstream
    git remote rename reem origin
}

create () {
    if [ $# -gt 0 ]; then
        echo "Usage (when in a git repo): create"
        return 1
    fi

    git status &> /dev/null
    if [ $? -eq 0 ]; then
        git create
        travis enable
        git push origin master
    else
        echo "fatal: Not a git repository"
        return 1
    fi
}

gprq () {
    if [ $# -lt 2 ]; then
        echo "Usage: gprq <TO> <FROM> <MESSAGE?>"
        return 1
    fi

    local to=$1
    local from=$2
    local current_branch=`git rev-parse --abbrev-ref HEAD`
    if [ $# -gt 2 ]; then
        local message=$3
        gpr -b "$to:master" -h "$from:$current_branch" -m "$message"
    else
        gpr -b "$to:master" -h "$from:$current_branch"
    fi
}

