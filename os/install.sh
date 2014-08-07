#!/usr/bin/env bash

source "$(dirname "$0")/../script/functions"

OS="$(uname -s | awk '{print tolower($0)}')"
OS_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/${OS}"


install () {
    if [ -d "$OS_DOTFILES" ]; then
        info "installing ${OS} dotfiles"

        local overwrite_all=false backup_all=false skip_all=false

        for src in $(find "$OS_DOTFILES" -maxdepth 2 -name '*.symlink')
        do
            dst="$HOME/.$(basename "${src%.*}")"
            link_file "$src" "$dst"
        done
    fi
}

install
