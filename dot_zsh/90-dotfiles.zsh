# warn if dotfiles haven't been updated in last 7 days
if [[ -n ${DOTFILES:=$HOME/.dotfiles}/.update(#qN.m+7) ]]; then
    echo "⚠️ dotfiles are out of date run \`dotfiles\` to update⚠️"
fi
