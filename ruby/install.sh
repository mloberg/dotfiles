#!/usr/bin/env bash
#
# Install some Ruby versions

[ -x `which rbenv` ] && eval "$(rbenv init -)"

default_gems_file=$(rbenv root)/default-gems

(cat "${default_gems_file}" | grep bundler) &>/dev/null | (echo 'bundler' >> "${default_gems_file}")

(rbenv versions | grep 2.3.1) &>/dev/null || rbenv install 2.3.1

rbenv global 2.3.1
