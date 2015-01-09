BASE_IMAGE=phusion/baseimage
IMAGE_TAG=anthoq88/baseimage-dev
SHARED_DIR=~/.devbox-shared

function dev() {
    usage="$(basename "$0") [build | up | clean | bash image]

        --help: show this help
        up:     
        clean:  kill and remove any containers and remove any hanging images
        build: 
        bash:   docker run /bin/bash
    "

    case $1 in
    up)
        __devup
        ;;
    build)
        __devbuild
        ;;
    clean)
        __devclean
        ;;
    bash)
        __devbash $2
        ;;
    *)
        echo $usage
        ;;
    esac
}

function __devup() {
    echo "Starting dev environment"

    docker run \
        -i -t \
        $IMAGE_TAG \
        /bin/bash

    #docker run \
        #-i -t \
        #-v $SHARED_DIR/nix:/nix \
        #-v $SHARED_DIR/home/dev:/home/dev \
        #$IMAGE_TAG \
        #/bin/bash
}

function __devbuild() {
    mkdir -p $SHARED_DIR/nix
    mkdir -p $SHARED_DIR/home/dev
    
    #docker build ../build/ --rm=true
    docker build ../build/ #TODO use DEVPATH

    imgId=$(docker images -q | head -n 1)
    docker tag -f $imgId $IMAGE_TAG

    #docker run $imgId /build/nix.sh
    
    conId=$(docker ps -aq | head -n 1)

    #docker cp $conId:/nix $SHARED_DIR/nix
    #docker cp $conId:/home/dev $SHARED_DIR/home/dev

    #docker run \
        #-v ~/Development/Environment/devbox/.devbox-shared/nix:/nix \
        #-v ~/Development/Environment/devbox/.devbox-shared/home/dev:/home/dev \
        #-v ~/Development/:/home/dev/Development \
        #$id \
        #/build/nix.sh
}

function __devclean() {
    #remove containers
    docker kill $(docker ps -q)
    docker rm $(docker ps -a -q)

    #remove unnamed images
    docker rmi $(docker images -q -f dangling=true)
}

function __devbash {
    docker run -i -t $1 /bin/bash
}

