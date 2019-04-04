# My bash configuration

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
shopt -s autocd 2> /dev/null
shopt -s globstar 2> /dev/null

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# large history so we can better search old commands (see inputrc)
HISTSIZE=500000
HISTFILESIZE=100000

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH=".:~:~/src"

# make less more friendly for non-text input files, see lesspipe(1)
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

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

# Security settings
export HOMEBREW_NO_ANALYTICS=1

# PATHs
source "$HOME/.dotfiles/lib/functions.bash"
pathmunge "/usr/local/bin"
pathmunge "/usr/local/opt/openssl/bin"

# aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

# Bash completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

for completion in "$HOME"/.dotfiles/lib/completion/*.bash; do
  source "$completion"
done

for extra in "$HOME"/.bash.d/*.bash; do
  [ -r "$extra" ] && [ -f "$extra" ] && source "$extra"
done

[ -f "$HOME/.dockerfunc" ] && source "$HOME/.dockerfunc"

# More PATHs
pathmunge "$HOME/.dotfiles/bin"
pathmunge "$HOME/bin"
pathmunge ./bin

# Propmpt
source "$HOME/.bash_prompt"
