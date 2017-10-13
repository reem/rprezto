dc () {
    docker-compose $*
}

dcd () {
    docker-compose down $*
}

dcb() {
    docker-compose build $*
}

dcu () {
    docker-compose up $*
}

dcud () {
    docker-compose up -d $*
}

dcrs () {
    dcb && dcd && dcud
}
