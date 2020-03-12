setopt hist_ignore_all_dups inc_append_history
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

HISTSIZE=4096
SAVEHIST=4096

export ERL_AFLAGS="-kernel shell_history enabled"
