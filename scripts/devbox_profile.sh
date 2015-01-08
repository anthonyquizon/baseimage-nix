
export DEVBOX=$(pwd)

# setup convience commands
function devUp () {
    cd $DEVBOX/dev

    # TODO if not up do
        # vagrant up
        # set environment variable

    vagrant up
    vagrant ssh
}

function devBuild () {
    echo "TODO"
}
