# General zsh Aliases
#

fignore+=(.lock)

slp () {
    m sleep
}

replace () {
    local find_this=$1
    shift
    local replace_with=$1
    shift

    ag -l $find_this $* | xargs sed -i '' "s/$find_this/$replace_with/g"
}

cl () { clear; ls }

rimraf () { rm -rf $* }

chpwd () { ls }

scd () { quiet cd $* }

srm () { rm -f $* }

interval () {
    local time=$1
    shift

    while true; do $*; sleep $time; done
}

sync () {
    interval 1 rsync -az --itemize-changes $*
}

rpeat () {
    local times=$1;
    shift;

    for i in {1..$times}; do $*; done
}

# Safer curl | sh
curlish () {
    if [ $# != 2 ]; then
        echo "Usage: curlish <FROM> <CMD>"
        return 1
    fi

    cmd=$2

    file=$(mktemp -t curlish) || { echo "Failed creating temp file"; return; }
    curl -s "$1" >> $file || { "Failed to curl file"; srm $file; return; }

    $cmd $file

    # Always
    srm $file
}

quiet () {
    # $* 2>&1 >/dev/null
    $* > /dev/null 2>&1
}

w () {
    local target=$1
    shift

    local cmd=$1
    shift

    local rest=$*

    j $target
    cl
    watch $cmd $~=rest
}

rw () {
    w $1 'cargo test' Cargo.toml 'src/**/**.rs'
}

