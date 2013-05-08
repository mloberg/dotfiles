#!/usr/bin/env bash

# Desktop Programs
alias preview="open -a '$PREVIEW'"
alias safari="open -a Safari"
alias firefox="open -a Firefox"
alias chrome="open -a Google\ Chrome"
alias f='open -a Finder'
alias textedit='open -a TextEdit'

if [ -s /usr/bin/firefox ]; then
	unalias firefox
fi
