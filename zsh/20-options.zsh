export LANG=en_US.UTF-8

setopt extended_glob

# autocorrect commands
alias cp='nocorrect cp'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias sudo='nocorrect sudo'
setopt correct_all

# Kill all child processes when we exit, don't leave them running
unsetopt no_hup

# navigation improvements
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Allow [ or ] whereever you want
unsetopt nomatch

# disallow overwriting files with >
setopt no_clobber

# recognize comments
setopt interactivecomments

# don't print a warning message if a mail file has been accessed
unsetopt mail_warning

# make less more friendly for non-text input files, see lesspipe(1)
export LESSOPEN="|$(brew --prefix)/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
# Prevent the less hist file from being made
export LESSHISTFILE="/dev/null"

# autonotify config (https://github.com/MichaelAquilina/zsh-auto-notify)
AUTO_NOTIFY_THRESHOLD=30
AUTO_NOTIFY_IGNORE+=("docker" "vagrant")
