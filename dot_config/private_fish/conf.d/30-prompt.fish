# Use Starship (https://starship.rs/) for prompt
starship init fish | source

# Customize fish greeting, defaulting to empty
set fish_greeting ""
if test (path mtime --relative ~/.update) -gt 604800
    set fish_greeting "$(set_color yellow)dotfiles are out of date run 'chezmoi update' to update$(set_color normal)"
end

# enable colored output from ls, etc. on FreeBSD-based systems
set -gx CLICOLOR 1
