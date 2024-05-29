command -v starship &>/dev/null || return

export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"
