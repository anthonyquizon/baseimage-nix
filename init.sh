
function source_devbox {
    exists=`more $1 | grep "source.*devbox_profile.sh"`

    if [ -z "$exists" ];
    then
        echo "source '$(pwd)/scripts/devbox_profile.sh'" >> $1
    fi
}

source_devbox ~/.bash_profile
source_devbox ~/.zshrc
