#!/usr/bin/env bash
#
# Set users Bash to be Homebrew's

if [ -f "/usr/local/bin/bash" ]; then
    (cat /etc/shells | grep /usr/local/bin/bash) &>/dev/null || (echo "/usr/local/bin/bash" | sudo tee -a /etc/shells)

    if [ "${SHELL}" != "/usr/local/bin/bash" ]; then
        chsh -s /usr/local/bin/bash
    fi
fi

if [ -z "$BASH_IT" ]; then
    export BASH_IT="$HOME/.bash_it"
fi

if [ ! -d "$BASH_IT" ]; then
    git clone --depth=1 https://github.com/Bash-it/bash-it.git "$BASH_IT"
    "$BASH_IT/install.sh" --silent --no-modify-config
    source $BASH_IT/bash_it.sh
fi

bash-it enable alias bundler osx vagrant
bash-it enable completion brew bundler capistrano composer docker-compose docker gem git gulp makefile npm ssh tmux vagrant
bash-it enable plugin extract tmux
