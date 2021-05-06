if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Don't send analytics to Homebrew
# See: https://docs.brew.sh/Analytics
export HOMEBREW_NO_ANALYTICS=1
