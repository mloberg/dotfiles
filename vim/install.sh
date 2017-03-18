#!/usr/bin/env bash
#
# Install Vundle and some bundles

vundle_path="$HOME/.vim/bundle/Vundle.vim"

if [ ! -d "$vundle_path" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git "$vundle_path"
fi

vim < /dev/tty -u "$(dirname $0)/vimrc.vundle" +PluginInstall +qall
