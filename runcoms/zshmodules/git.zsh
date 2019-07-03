# Git aliases:
alias got='git'
alias gut='git'

alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gd='git diff'
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
alias gfrom='git fetch && git rebase origin/master'

alias gunc='git reset --soft HEAD~1'
alias guncf='git reset --hard HEAD~1'

# Hub aliases
alias gpr="git pull-request"

# opening files

gautostage () {
    local branch=$(git rev-parse --abbrev-ref HEAD)

    git branch -D reem--autostage
    git checkout -b reem--autostage
    git push origin reem--autostage --force

    git checkout $branch
}

# open edited
goe () {
    editorCmd $(git ls-files --modified)
}

# open merge
gom () { g mop; }

# open grep
gog () { g gop $*; }

# open name
gn () { g op $*; }

fzo () {
    local files=$($* | fzf -m);
    if [[ -z $files ]]; then return 1; fi
    $(git editor) $=files
}

fzgc () {
    local commit=$($* | fzf)
    if [[ -z $commit ]]; then return 1; fi
    git checkout $commit
}

fzgsh () {
    local commits=$($* | fzf -m)
    if [[ -z $commits ]]; then return 1; fi
    git show $=commits
}

# open fuzzy name
gfn () {
    fzo git ls-files $(git rev-parse --show-toplevel)
}

# open fuzzy search
gfs () {
    local raw_selection="$(git grep -n '.*' | fzf)";
    if [[ -z $raw_selection ]]; then return 1; fi
    local selection=${raw_selection%:*};
    local file=${selection%:*};
    local line=${selection##*:};
    $(git editor) +"$line" "$file"
}

# change branch with branch fuzzy search
gfb () {
    fzgc git branch
}

# change branch from tag fuzzy search
gft () {
    fzgc git tag --list
}

frequent () {
    fasd -s | awk '{print $2}'
}

# fuzzy search frequent files
jf () {
   fzo frequent
}

pbgst () {
    pbpaste | gist -c $*
}

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

gprqu () {
    gprq udacity udacity $*
}

gdl () {
    git diff HEAD~1
}
