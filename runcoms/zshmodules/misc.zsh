# Servering aliases
alias serve="python -m SimpleHTTPServer"

update () {
    npm update -g
    brew update && brew upgrade
    rustup
}

