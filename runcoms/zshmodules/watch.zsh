watch () {
    local cmd=$1
    shift

    fswatch $* | xargs -n1 -I{} zsh -c "$cmd"
}
