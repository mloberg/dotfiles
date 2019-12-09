#!/usr/bin/env bash
set -e

sfp=$(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || greadlink -f "${BASH_SOURCE[0]}" 2>/dev/null)
if [ -z "$sfp" ]; then sfp=${BASH_SOURCE[0]}; fi
readonly SCRIPT_DIR=$(dirname "${sfp}")

# Get profile path
readonly FIREFOX_HOME="$HOME/Library/Application Support/Firefox"
readonly DEFAULT_PROFILE=$(grep "Default=[[:alpha:]]" "$FIREFOX_HOME/profiles.ini" | cut -d'=' -f2)
readonly PROFILE="$FIREFOX_HOME/$DEFAULT_PROFILE"

# Check if ghacks-user.js is up to date
readonly LOCAL_VERSION=$(sed -n '4p' "$SCRIPT_DIR/ghacks.js")
readonly CURRENT_VERSION=$(curl -s https://raw.githubusercontent.com/ghacksuserjs/ghacks-user.js/master/user.js | sed -n '4p')

if [ "$LOCAL_VERSION" != "$CURRENT_VERSION" ]; then
  printf "⚠️ \033[00;33mNew ghacks-user.js available (https://github.com/ghacksuserjs/ghacks-user.js/blob/master/user.js)\033[0m\n"
fi

# Backup existing user.js and install the new one
[ -L "$PROFILE/user.js" ] && rm "$PROFILE/user.js"
[ -f "$PROFILE/user.js" ] && cp "$PROFILE/user.js" "$SCRIPT_DIR/backup.js"
cp "$SCRIPT_DIR/ghacks.js" "$PROFILE/user.js"
cat "$SCRIPT_DIR/user.js" >> "$PROFILE/user.js"
