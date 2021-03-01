# Setup and configure fzf (https://github.com/junegunn/fzf)

# Auto-completion
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

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

# quickly open projects in vscode
p() {
    root="${PROJECTS_HOME:-$HOME/src}"
    project=$(fd --type d --base-directory "$root" | fzf --select-1 --query "$1")
    [ -n "$project" ] && code "$root/$project"
}
