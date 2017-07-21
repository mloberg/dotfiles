#!/usr/bin/env bash
#
# Install some PHP versions

# phenv="$(dirname $0)/../bin/phenv"
#
# $phenv install 70
# $phenv install 71
#
# $phenv switch 71

# Because we run composer via Docker, we want to make sure our Composer home
# exists, so we can do things like cache and authenticate
mkdir -p $HOME/.composer
