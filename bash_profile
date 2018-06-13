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
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

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

if [ -z "$COMPOSER_HOME" ]; then
    export COMPOSER_HOME="$HOME/.composer"
fi

# PATH
source "$HOME/.dotfiles/lib/functions.bash"

pathmunge "/usr/local/bin"
pathmunge "$COMPOSER_HOME/vendor/bin"
pathmunge "$HOME/.dotfiles/bin"
pathmunge "$HOME/bin"
pathmunge "./vendor/bin"
pathmunge "./node_modules/.bin"
pathmunge "./bin"

# Bash completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

for completion in $HOME/.dotfiles/lib/completion/*.bash; do
  source $completion
done

# Propmpt
source "$HOME/.dotfiles/lib/prompt.bash"

GIT_PROMPT_PREFIX="${white}["
GIT_PROMPT_SUFFIX="${white}]"
GIT_PROMPT_DIRTY=" ${bold_red}✗"
GIT_PROMPT_CLEAN=" ${bold_green}✓"

function prompt() {
  PS1="\[\033]0;\u@\h:\w\007\]" # Set title
  PS1+="$(battery-status)"
  PS1+="${red}\u@\h:" # user@host
  PS1+="${bold_green}\w" # pwd
  PS1+="${purple} |$(ruby_version_prompt)$(python_version_prompt)$(node_version_prompt)$(php_version_prompt)"
  PS1+="${white} $(git_prompt)"
  PS1+="\n"
  PS1+="${cyan}$(virtual_env_prompt)"
  PS1+="${reset_color}-> "
  PS2=" > "
}

PROMPT_COMMAND=prompt
