# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.aliases, instead of adding them here directly.
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
shopt -s autocd 2> /dev/null
shopt -s globstar 2> /dev/null

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# colored grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Don't check mail when opening terminal.
unset MAILCHECK

# PATHs
source "$HOME/.dotfiles/lib/functions.bash"
pathmunge "/usr/local/bin"

# Bash completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

for completion in $HOME/.dotfiles/lib/completion/*.bash; do
  source $completion
done

for extra in $HOME/.bash.d/*.bash; do
  [ -r "$extra" ] && [ -f "$extra" ] && source $extra
done

[ -f $HOME/.dockerfunc ] && source $HOME/.dockerfunc

# More PATHs
pathmunge "$HOME/.dotfiles/bin"
pathmunge "$HOME/bin"
pathmunge ./bin

# Propmpt
source "$HOME/.bash_prompt"
