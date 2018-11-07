#!/usr/bin/env bash

command -v pyenv &>/dev/null && eval "$(pyenv init -)"

export PATH="~/.local/bin:$PATH"
