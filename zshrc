# zsh config

PATH="$HOME/bin:/usr/local/bin:/usr/local/opt/openssl/bin:/usr/local/sbin:$PATH"

source ~/.rcrc
DOTFILES="${DOTFILES_DIR:-$HOME/.dotfiles}"

# auto update dotfiles
function _current_epoch() {
  expr $(date +%s) / 60 / 60 / 24
}

function _update_dotfile_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! "$DOTFILES/.update"
}

function _auto_update() {
  [ "$(ps aux | grep rcup | grep -v grep)" != "" ] && return
  [ ! -f "$DOTFILES/.update" ] && _update_dotfile_update && return
  . "$DOTFILES/.update"
  [ -z "$LAST_EPOCH" ] && _update_dotfile_update && return
  diff=$(expr $(_current_epoch) - $LAST_EPOCH)
  [ "$diff" -lt 14 ] && return
  rcup && _update_dotfile_update
}

_auto_update

# load completion commands
autoload -Uz compinit && compinit

# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# enable command auto-correction.
ENABLE_CORRECTION="true"

# load zsh plugins and config
for config_file ($HOME/.zsh/*.zsh(N)); do
  source $config_file
done
unset config_file

# reload completions
autoload -Uz compinit && compinit

# autonotify config (https://github.com/MichaelAquilina/zsh-auto-notify)
AUTO_NOTIFY_THRESHOLD=30
AUTO_NOTIFY_IGNORE+=("docker" "vagrant")

# remove duplicate entries from path
declare -U path

# User configuration
export LANG=en_US.UTF-8
export EDITOR=vim

# Kill all child processes when we exit, don't leave them running
unsetopt no_hup

# navigation improvements
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Allow [ or ] whereever you want
unsetopt nomatch

# history search improvements
setopt hist_ignore_all_dups
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# disallow overwriting files with >
setopt no_clobber

# make less more friendly for non-text input files, see lesspipe(1)
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
# Prevent the less hist file from being made
export LESSHISTFILE="/dev/null"

# Prompt
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init zsh)"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
