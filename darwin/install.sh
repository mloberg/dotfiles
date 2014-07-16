#!/usr/bin/env bash

source "$(dirname "$0")/../script/functions"

if [ "$(uname -s)" == "Darwin" ]; then
    info 'installing OSX related dotfiles'

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find "$(dirname "$0")" -maxdepth 2 -name '*.symlink'); do
        dst = "$HOME/.$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done
fi
