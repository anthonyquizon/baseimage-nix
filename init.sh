
function add_line {
    exists=`more $1 | grep "$2"`
    
    if [ -z "$exists" ];
    then
        echo $2 >> $1
    fi
}

function source_devbox {
    add_line $1 "export DEVBOX=$(pwd)"
    add_line $1 "source '$(pwd)/scripts/devbox_profile.sh'"
}

source_devbox ~/.bash_profile
source_devbox ~/.zshrc

mkdir -p .devbox-shared/nix
#mkdir -p ../Workspace
