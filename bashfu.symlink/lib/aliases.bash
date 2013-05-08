bashfu-aliases () {
	about 'summarizes available bashfu aliases'
	group 'lib'

	typeset f
	typeset enabled
	printf "%-20s%-10s%s\n" 'Alias' 'Enabled?' 'Description'
	for f in $BASHFU/aliases/available/*.aliases.bash; do
		if [ -e $BASHFU/aliases/enabled/$(basename $f) ]; then
			enabled='x'
		else
			enabled=' '
		fi
        printf "%-20s%-10s%s\n" "$(basename $f | cut -d'.' -f1)" "  [$enabled]" "$(cat $f | metafor about-aliase)"
	done
	printf '\n%s\n' 'to enable a alias, do:'
	printf '%s\n' '$ enable-alias  <alias name> -or- $ enable-alias all'
	printf '\n%s\n' 'to disable a alias, do:'
	printf '%s\n' '$ disable-alias <alias name> -or- $ disable-alias all'
}

disable-alias () {
	about 'disables bashfu alias'
	param '1: alias name'
	example '$ disable-alias rvm'
	group 'lib'

	if [ -z "$1" ]; then
		reference disable-alias
		return
	fi

	if [ "$1" = "all" ]; then
		typeset f aliases
		for f in $BASHFU/aliases/available/*.bash; do
			aliases=$(basename $f)
			if [ -e $BASHFU/aliases/enabled/$aliases ]; then
				rm $BASHFU/aliases/enabled/$(basename $aliases)
			fi
		done
	else
		typeset aliases=$(command ls $BASHFU/aliases/enabled/$1.*bash 2>/dev/null | head -1)
		if [ ! -h $aliases ]; then
			printf '%s\n' 'sorry, that does not appear to be an enabled aliases.'
			return
		fi
		rm $BASHFU/aliases/enabled/$(basename $aliases)
	fi

	reload_aliases

	printf '%s\n' "$1 disabled."
}

enable-alias () {
	about 'enables bashfu aliases'
	param '1: aliases name'
	example '$ enable-aliases rvm'
	group 'lib'

	if [ -z "$1" ]; then
		reference enable-aliases
		return
	fi

	if [ "$1" = "all" ]; then
		typeset f aliases
		for f in $BASHFU/aliases/available/*.bash; do
			aliases=$(basename $f)
			if [ ! -h $BASHFU/aliases/enabled/$aliases ]; then
				ln -s $BASHFU/aliases/available/$aliases $BASHFU/aliases/enabled/$aliases
			fi
		done
	else
		typeset aliases=$(command ls $BASHFU/aliases/available/$1.*bash 2>/dev/null | head -1)
		if [ -z "$aliases" ]; then
			printf '%s\n' 'sorry, that does not appear to be an available aliases.'
			return
		fi

		aliases=$(basename $aliases)
		if [ -e $BASHFU/aliases/enabled/$aliases ]; then
			printf '%s\n' "$1 is already enabled."
			return
		fi

		ln -s $BASHFU/aliases/available/$aliases $BASHFU/aliases/enabled/$aliases
	fi

	reload_aliases

	printf '%s\n' "$1 enabled."
}
