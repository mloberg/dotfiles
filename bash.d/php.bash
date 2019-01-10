#!/usr/bin/env bash

if [ -z "$COMPOSER_HOME" ]; then
    export COMPOSER_HOME="$HOME/.composer"
fi

pathmunge "$COMPOSER_HOME/vendor/bin"
pathmunge ./vendor/bin

function composer() {
    tty=
    tty -s && tty=--tty
    docker run $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $COMPOSER_HOME/.composer:/tmp \
        --volume $(pwd):/app \
        composer "$@"
}

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}
