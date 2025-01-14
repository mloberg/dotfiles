# Replace !! with last command ran
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# Transform ..[...] into cd ../[...]
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr -a dotdot --regex '^\.\.+$' --function multicd

# Replace ls with eza
if type -q eza
    abbr -a ls 'eza --icons'
    abbr -a ll 'eza --icons --long --header --git'
    abbr -a la 'eza --icons --all'
    abbr -a l 'eza --icons --long --header --git --all'
    abbr -a tree 'eza --icons --tree --git-ignore'
end

# Replace cat with bat
if type -q bat
    abbr -a cat bat
end

abbr -a grep 'grep --color'
abbr -a dotfile chezmoi
