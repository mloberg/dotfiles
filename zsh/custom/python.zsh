export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

command -v pyenv &>/dev/null && eval "$(pyenv init -)"
