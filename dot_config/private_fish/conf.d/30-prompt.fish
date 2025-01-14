# enable colored output from ls, etc. on FreeBSD-based systems
set -gx CLICOLOR 1

# Skip all other prompt config if not interactive shell
status is-interactive || return

# Use Starship (https://starship.rs/) for prompt
starship init fish | source

# Customize fish greeting, defaulting to empty
set fish_greeting ""
if test ! -f ~/.local/state/dotfile-last-update || test (math (date +%s) - (cat ~/.local/state/dotfile-last-update)) -gt 604800
    set fish_greeting "$(set_color yellow)dotfiles are out of date run 'dotfile update' to update$(set_color normal)"
end
