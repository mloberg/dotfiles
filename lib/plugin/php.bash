#!/usr/bin/env bash

if [ -z "$COMPOSER_HOME" ]; then
    export COMPOSER_HOME="$HOME/.composer"
fi

pathmunge "$COMPOSER_HOME/vendor/bin"
pathmunge ./vendor/bin
