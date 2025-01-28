test -n "$XDG_CONFIG_HOME" || set -gx XDG_CONFIG_HOME ~/.config
test -n "$XDG_DATA_HOME" || set -gx XDG_DATA_HOME ~/.local/share
test -n "$XDG_STATE_HOME" || set -gx XDG_STATE_HOME ~/.local/state
test -n "$XDG_CACHE_HOME" || set -gx XDG_CACHE_HOME ~/.cache
test -n "$XDG_BIN_HOME" || set -gx XDG_BIN_HOME ~/.local/bin
test -n "$XDG_RUNTIME_DIR" || set -gx XDG_RUNTIME_DIR ~/.local

fish_add_path -m "$XDG_BIN_HOME"
