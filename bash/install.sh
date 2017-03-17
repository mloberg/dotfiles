#!/usr/bin/env bash
#
# Set users Bash to be Homebrew's

if [ -f "/usr/local/bin/bash" ]; then
    (cat /etc/shells | grep /usr/local/bin/bash) &>/dev/null || (echo "/usr/local/bin/bash" | sudo tee -a /etc/shells)

    if [ "${SHELL}" != "/usr/local/bin/bash" ]; then
        chsh -s /usr/local/bin/bash
    fi
fi
