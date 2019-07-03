a () {
   if [[ -z $1 ]] then
     open -a atom
   else
     atom $*
   fi
}
