#!/usr/bin/env bash
#
# Install some Ruby versions

if ! $(type rbenv | grep 'rbenv is a function'); then
    eval "$(rbenv init -)"
fi

default_gems_file=$(rbenv root)/default-gems

(cat "${default_gems_file}" | grep bundler) &>/dev/null | (echo 'bundler' >> "${default_gems_file}")

# rbenv install 1.9.3-p545
# rbenv install 2.0.0-p648
# rbenv install 2.1.10
# rbenv install 2.2.5
rbenv install 2.3.1

rbenv global 2.3.1
