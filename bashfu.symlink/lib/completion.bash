bashfu-completion () {
	about 'summarizes available bashfu completion'
	group 'lib'

	typeset f
	typeset enabled
	printf "%-20s%-10s%s\n" 'Completion' 'Enabled?' 'Description'
	for f in $BASHFU/completion/available/*.completion.bash; do
		if [ -e $BASHFU/completion/enabled/$(basename $f) ]; then
			enabled='x'
		else
			enabled=' '
		fi
        printf "%-20s%-10s%s\n" "$(basename $f | cut -d'.' -f1)" "  [$enabled]" "$(cat $f | metafor about-completion)"
	done
	printf '\n%s\n' 'to enable a completion, do:'
	printf '%s\n' '$ enable-completion  <completion name> -or- $ enable-completion all'
	printf '\n%s\n' 'to disable a completion, do:'
	printf '%s\n' '$ disable-completion <completion name> -or- $ disable-completion all'
}

disable-completion () {
	about 'disables bashfu completion'
	param '1: completion name'
	example '$ disable-completion rvm'
	group 'lib'

	if [ -z "$1" ]; then
		reference disable-completion
		return
	fi

	if [ "$1" = "all" ]; then
		typeset f completion
		for f in $BASHFU/completion/available/*.bash; do
			completion=$(basename $f)
			if [ -e $BASHFU/completion/enabled/$completion ]; then
				rm $BASHFU/completion/enabled/$(basename $completion)
			fi
		done
	else
		typeset completion=$(command ls $BASHFU/completion/enabled/$1.*bash 2>/dev/null | head -1)
		if [ ! -h $completion ]; then
			printf '%s\n' 'sorry, that does not appear to be an enabled completion.'
			return
		fi
		rm $BASHFU/completion/enabled/$(basename $completion)
	fi

	reload_completion

	printf '%s\n' "$1 disabled."
}

enable-completion () {
	about 'enables bashfu completion'
	param '1: completion name'
	example '$ enable-completion rvm'
	group 'lib'

	if [ -z "$1" ]; then
		reference enable-completion
		return
	fi

	if [ "$1" = "all" ]; then
		typeset f completion
		for f in $BASHFU/completion/available/*.bash; do
			completion=$(basename $f)
			if [ ! -h $BASHFU/completion/enabled/$completion ]; then
				ln -s $BASHFU/completion/available/$completion $BASHFU/completion/enabled/$completion
			fi
		done
	else
		typeset completion=$(command ls $BASHFU/completion/available/$1.*bash 2>/dev/null | head -1)
		if [ -z "$completion" ]; then
			printf '%s\n' 'sorry, that does not appear to be an available completion.'
			return
		fi

		completion=$(basename $completion)
		if [ -e $BASHFU/completion/enabled/$completion ]; then
			printf '%s\n' "$1 is already enabled."
			return
		fi

		ln -s $BASHFU/completion/available/$completion $BASHFU/completion/enabled/$completion
	fi

	reload_completion

	printf '%s\n' "$1 enabled."
}
