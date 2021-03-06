# Run composer in Docker

if [ -z "$COMPOSER_HOME" ]; then
    export COMPOSER_HOME="$HOME/.composer"
fi

export PATH="$COMPOSER_HOME/vendor/bin:$PATH"

function composer() {
    if [ "self-update" == "$1" ]; then
        docker pull composer
        return
    fi

    tty=
    tty -s && tty=--tty
    docker run $tty \
        --interactive \
        --rm \
        --user "$(id -u):$(id -g)" \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume "$COMPOSER_HOME/.composer:/tmp" \
        --volume "$(pwd):/app" \
        composer "$@"
}
