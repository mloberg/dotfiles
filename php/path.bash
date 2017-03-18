if [ -z "$COMPOSER_HOME" ]; then
    export COMPOSER_HOME="$HOME/.composer"
fi

export PATH="$COMPOSER_HOME/vendor/bin:$PATH"
