#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

if [ "$(uname)" != "Darwin" ]; then
  return
fi

cd "$(dirname $0)/.."

# Check for Homebrew
if test ! $(which brew); then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Homebrew Bundle
brew tap Homebrew/bundle

# Run Homebrew through the Brewfile
echo "› brew bundle"
brew bundle

brewfile="Brewfile.$(hostname)"

echo "$brewfile"

if [ -f "$brewfile" ]; then
  brew bundle --file="$brewfile"
fi
