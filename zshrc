# zsh config
for config ($HOME/.zsh/*.zsh(N)); do
  source $config
done
unset config

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
