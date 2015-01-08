
# setup convience commands
function devup () {
    (cd /$DEVBOX/dev
        echo "Setting up dev environment..."
        # TODO if not up do
            # vagrant up
            # set environment variable

        vagrant up dev --provider=docker
        vagrant ssh dev
    )
}

function devbuild () {
    echo "TODO"
}
