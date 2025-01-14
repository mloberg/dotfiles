if [ -f /opt/homebrew/bin/brew ]
    /opt/homebrew/bin/brew shellenv | source
else
    /usr/local/bin/brew shellenv | source
end

# Don't send analytics to Homebrew
# See: https://docs.brew.sh/Analytics
set -gx HOMEBREW_NO_ANALYTICS 1
