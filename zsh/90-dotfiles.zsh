DOTFILES="$HOME/.dotfiles"

function dotfiles() {
    rcup "$@" && touch "$DOTFILES/.update"
}

# warn if dotfiles haven't been updated in last 7 days
if [ "$(expr $(date +%s) - $(stat -f "%Sm" -t "%s" "$DOTFILES/.update"))" -gt 604800 ]; then
    echo "⚠️ dotfiles are out of date run \`dotfiles\` to update⚠️"
fi
