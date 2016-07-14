alias t="tdeploy"

alias tb="tdeploy build"
alias tbf="tdeploy build --freeze"

alias ts="tdeploy service"
alias tsr="tdeploy service release"
alias tsrf="tdeploy service release --freeze"
alias tsa="tdeploy service start"
alias tso="tdeploy service stop"
alias tsp="tdeploy service publish"
alias tsl="tdeploy service list"

alias tst="tdeploy store"
alias tstf="tdeploy store fork --thawed"
alias tstd="tdeploy store destroy"

alias tssh="tact-ssh-to-main -d "
alias tup="tact-spinup-cluster"
alias tdown="tact-teardown-cluster"

tsre () {
   tso $*
   tsa $*
   tsp $*
}

tsap () {
   tsa $*
   tsp $*
}

tsup () {
   original=$1
   shift

   target=$1
   shift

   tsap -ve $target $*
   tso -ve $original $*
}
