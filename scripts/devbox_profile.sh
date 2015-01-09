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
}

function __devbuild() {
    docker build ../build/ #TODO use DEVPATH

    imgId=$(docker images -q | head -n 1)
    docker tag -f $imgId $IMAGE_TAG
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

