bindkey -e # behave like bash

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search       # [Up]
bindkey "^[[B" down-line-or-beginning-search     # [Down]
bindkey "^[[1;2A" history-substring-search-up    # [Shift+Up]
bindkey "^[[1;2B" history-substring-search-down  # [Shift+Down]
bindkey ' ' magic-space                          # [Space] - do history expansion

bindkey "${terminfo[kLFT]}" backward-word  # [Shift+Left]
bindkey "${terminfo[kRIT]}" forward-word   # [Shift+Right]

bindkey -s '^l' 'ls\n' # [Ctrl-l] run command: ls

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
