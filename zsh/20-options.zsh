export LANG=en_US.UTF-8

# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# enable command auto-correction.
ENABLE_CORRECTION="true"

# Kill all child processes when we exit, don't leave them running
unsetopt no_hup

# navigation improvements
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Allow [ or ] whereever you want
unsetopt nomatch

# disallow overwriting files with >
setopt no_clobber

# make less more friendly for non-text input files, see lesspipe(1)
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
# Prevent the less hist file from being made
export LESSHISTFILE="/dev/null"

# autonotify config (https://github.com/MichaelAquilina/zsh-auto-notify)
AUTO_NOTIFY_THRESHOLD=30
AUTO_NOTIFY_IGNORE+=("docker" "vagrant")
