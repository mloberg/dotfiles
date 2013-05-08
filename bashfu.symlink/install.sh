#!/usr/bin/env bash

BASHFU="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

load_some() {
    file_type=$1
    for path in `ls $BASHFU/${file_type}/available/*`; do
        file_name=$(basename "$path")
        while true; do
            read -p "Would you like to enable the ${file_name%%.*} $file_type? [Y/N] " RESP
            case $RESP in
                [yY])
                    ln -s "$path" "$BASHFU/$file_type/enabled/$file_name"
                    break
                    ;;
                [nN])
                    break
                    ;;
                *)
                    echo "Please choose y or n."
                    ;;
            esac
        done
    done
}

load_all() {
    file_type="$1"
    for f in $BASHFU/${file_type}/available/*.bash; do
        file_name=$(basename $f)
        if [ ! -h $BASHFU/${file_type}/enabled/$file_name ]; then
            ln -s $BASHFU/${file_type}/available/$file_name $BASHFU/${file_type}/enabled/$file_name
        fi
    done
}

read -p "Install Bashfu? [y/n] " INSTALL_BASHFU
if [[ "$INSTALL_BASHFU" != "y" ]]; then
    exit
fi

echo "Copying ~/.bash_profile to ~/.bash_profile.bak"
cp $HOME/.bash_profile $HOME/.bash_profile.bak
echo "Installing new ~/.bash_profile"
cp $BASHFU/templates/bash_profile.template.bash $HOME/.bash_profile

for type in "aliases" "plugins" "completion"; do
    mkdir -p $BASHFU/$type/enabled
    while true; do
        read -p "Would you like to enable all, some, or no $type? (all/some/none) " RESP
        case $RESP in
            some)
                load_some $type
                break
                ;;
            all)
                load_all $type
                break
                ;;
            none)
                break
                ;;
            *)
                echo "Unknown choice. Please enter some, all, or none"
                continue
                ;;
        esac
    done
done

while true; do
    read -p "Would you like to reload the bash environment? [Y/N] " RESP
    case $RESP in
        [yY])
            source ~/.bash_profile
            break
            ;;
        [nN])
            echo "You can do this manually by running 'source ~/.bash_profile'"
            break
            ;;
        *)
            echo "Please choose y or n."
            ;;
    esac
done
