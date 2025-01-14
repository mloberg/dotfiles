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
abbr -a - 'cd -'

# Replace ls with eza
if type -q eza
    alias ls 'eza --icons'
    alias ll 'eza --icons --long --header --git'
    alias la 'eza --icons --all'
    alias l 'eza --icons --long --header --git --all'
    abbr -a tree 'eza --icons --tree --git-ignore'
end

# Replace cat with bat
if type -q bat
    alias cat bat
end

alias grep 'grep --color'
alias c 'project code'
alias p 'project cd'
alias o 'project open'

abbr -a dotfile chezmoi
