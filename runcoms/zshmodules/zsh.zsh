# General zsh Aliases

replace () {
    local find_this=$1
    shift
    local replace_with=$1
    shift

    ag -l $find_this $* | xargs sed -i '' "s/$find_this/$replace_with/g"
}

cl () { clear; ls }

alias rimraf="rm -rf"

chpwd () { ls }

scd () { quiet cd $* }

srm () { rm -f $* }

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
    $* 2>&1 >/dev/null
}

