updatefile="${DOTFILES:=$HOME/.dotfiles}/.update"

# warn if dotfiles haven't been updated in last 7 days
if [[ ! -f "$updatefile" || "$(expr $(date +%s) - $(stat -f "%Sm" -t "%s" "$updatefile"))" -gt 604800 ]]; then
    echo "⚠️ dotfiles are out of date run \`dotfiles\` to update⚠️"
fi
