# Path to the bashfu
export BASHFU=$HOME/.bashfu

# Add bashfu's bin to the path
export PATH="$BASHFU/bin:$PATH"

# Set a custom theme file
# location /.bashfu/themes/
export BASHFU_THEME='i_hate_everyone'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@10.28.6.12'

# Set my editor and git editor
export EDITOR='/usr/bin/vim'
export GIT_EDITOR='/usr/bin/vim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irc'

# Set vcprompt executable path for scm advance info in prompt
# https://github.com/xvzf/vcprompt
export VCPROMPT_EXECUTABLE="${BASHFU}/bin/vcprompt"

# Load Bashfu
source $BASHFU/bashfu.sh
