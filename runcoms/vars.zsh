# Env Vars
export GOPATH=/Users/reem/code/go
export PATH=/usr/local/opt/ccache/libexec:/usr/local/bin:/usr/local/sbin:$HOME/.cargo/bin:$HOME/Library/Haskell/bin:$HOME/.cabal/bin:/usr/local/opt/curl/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$GOPATH/bin:/usr/local/m-cli:/usr/local/anaconda3/bin
export LD_LIBRARY_PATH=/usr/local/lib
export GIT_EDITOR=/usr/local/bin/vim

editorCmd () {
    TERM=xterm emacsclient -q -nw -a /usr/local/bin/vim $*
}

export EDITOR=editorCmd
export VISUAL=editorCmd

export NODE_PATH=/usr/local/lib/node_modules
export NODE_ENV="development"
export RUST_BACKTRACE=1
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

