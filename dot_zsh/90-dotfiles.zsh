# warn if dotfiles haven't been updated in last 7 days
if [[ -n ${HOME}/.update(#qN.m+7) ]]; then
    echo "⚠️ dotfiles are out of date run \`chezmoi update\` to update⚠️"
fi
