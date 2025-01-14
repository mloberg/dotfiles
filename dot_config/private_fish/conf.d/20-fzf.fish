# Setup and configure fzf (https://github.com/junegunn/fzf)
fzf --fish | source

# https://github.com/junegunn/fzf#tips
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix"
set -gx FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
