export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

command -v rbenv &>/dev/null && eval "$(rbenv init -)"
