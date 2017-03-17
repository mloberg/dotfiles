#!/usr/bin/env bash
#
# Install some PHP versions

cd "$(dirname $0)"

bin/phenv-install 70
bin/phenv-install 71

bin/phenv-global 70

brew install composer
