# Setup and configure fzf (https://github.com/junegunn/fzf)

# Auto-completion
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Autocomplete code with directories
_fzf_complete_code() {
    _fzf_complete --multi --reverse -- "$@" < <(fd --type d)
}

_project() {
    cmd="${1:-cd}"
    query="$2"
    dir="${3:-$HOME/src}"

    res=$(fd --type d --base-directory "$dir" --hidden --glob .git -x dirname | fzf --select-1 --query "$query")
    [ -n "$res" ] || return
    "$cmd" "$dir/$res"
}

alias p="_project cd"
alias c="_project code"
alias o="_project open"
