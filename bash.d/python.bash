#!/usr/bin/env bash

command -v pyenv &>/dev/null && eval "$(pyenv init -)"

export PATH="$HOME/.local/bin:$PATH"
