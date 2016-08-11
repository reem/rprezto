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
alias tsi="tdeploy service interactive"

alias tst="tdeploy store"
alias tstf="tdeploy store fork --thawed"
alias tstd="tdeploy store destroy"
alias tstls="tdeploy store list"

alias tup="tact-spinup-cluster"
alias tdown="tact-teardown-cluster"

tssh () {
   local cluster=$1
   shift

   if [[ -z $1 ]] then
     ssh $cluster.test-cluster.com
   else
     local service=$1
     shift

     ssh -t $cluster.test-cluster.com vzentr $service
   fi
}

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

tsync () {
  local domain=$1
  shift
  local service=$1
  shift
  local src=$1
  shift
  local dst=$1
  shift

  local ctid=$(tctid $domain $service)

  KEY=~/.ssh/terminal-dev-default

  rsync -e "ssh -i $KEY" --itemize-changes -az $@ $src root@$domain.test-cluster.com:/vz/root/$ctid/$dst
}

tctid () {
  local domain=$1
  local service=$2

  KEY=~/.ssh/terminal-dev-default

  CTIDS=$(ssh -i $KEY root@$domain.test-cluster.com  vzlist -Hao ctid -N 'cloudlabsreserved-'$service'-*' )
  NWORDS=$(echo $CTIDS | wc -w | tr -d ' ')
  if [ "$NWORDS" != "1" ]; then
    echo "Expect exactly one container!"
    exit 1
  fi

  CTID=$(echo $CTIDS | awk '{print $1;}')
  echo $CTID
}
