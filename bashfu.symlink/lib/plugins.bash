bashfu-plugins () {
	about 'summarizes available bashfu plugins'
	group 'lib'

	typeset f
	typeset enabled
	printf "%-20s%-10s%s\n" 'Plugin' 'Enabled?' 'Description'
	for f in $BASHFU/plugins/available/*.plugin.bash; do
		if [ -e $BASHFU/plugins/enabled/$(basename $f) ]; then
			enabled='x'
		else
			enabled=' '
		fi
        printf "%-20s%-10s%s\n" "$(basename $f | cut -d'.' -f1)" "  [$enabled]" "$(cat $f | metafor about-plugin)"
	done
	printf '\n%s\n' 'to enable a plugin, do:'
	printf '%s\n' '$ enable-plugin  <plugin name> -or- $ enable-plugin all'
	printf '\n%s\n' 'to disable a plugin, do:'
	printf '%s\n' '$ disable-plugin <plugin name> -or- $ disable-plugin all'
}

disable-plugin () {
	about 'disables bashfu plugin'
	param '1: plugin name'
	example '$ disable-plugin rvm'
	group 'lib'

	if [ -z "$1" ]; then
		reference disable-plugin
		return
	fi

	if [ "$1" = "all" ]; then
		typeset f plugin
		for f in $BASHFU/plugins/available/*.bash; do
			plugin=$(basename $f)
			if [ -e $BASHFU/plugins/enabled/$plugin ]; then
				rm $BASHFU/plugins/enabled/$(basename $plugin)
			fi
		done
	else
		typeset plugin=$(command ls $BASHFU/plugins/enabled/$1.*bash 2>/dev/null | head -1)
		if [ ! -h $plugin ]; then
			printf '%s\n' 'sorry, that does not appear to be an enabled plugin.'
			return
		fi
		rm $BASHFU/plugins/enabled/$(basename $plugin)
	fi

	reload_plugins

	printf '%s\n' "$1 disabled."
}

enable-plugin () {
	about 'enables bashfu plugin'
	param '1: plugin name'
	example '$ enable-plugin rvm'
	group 'lib'

	if [ -z "$1" ]; then
		reference enable-plugin
		return
	fi

	if [ "$1" = "all" ]; then
		typeset f plugin
		for f in $BASHFU/plugins/available/*.bash; do
			plugin=$(basename $f)
			if [ ! -h $BASHFU/plugins/enabled/$plugin ]; then
				ln -s $BASHFU/plugins/available/$plugin $BASHFU/plugins/enabled/$plugin
			fi
		done
	else
		typeset plugin=$(command ls $BASHFU/plugins/available/$1.*bash 2>/dev/null | head -1)
		if [ -z "$plugin" ]; then
			printf '%s\n' 'sorry, that does not appear to be an available plugin.'
			return
		fi

		plugin=$(basename $plugin)
		if [ -e $BASHFU/plugins/enabled/$plugin ]; then
			printf '%s\n' "$1 is already enabled."
			return
		fi

		ln -s $BASHFU/plugins/available/$plugin $BASHFU/plugins/enabled/$plugin
	fi

	reload_plugins

	printf '%s\n' "$1 enabled."
}

plugins-help () {
	about 'summarize all functions defined by enabled bashfu plugins'
	group 'lib'

	# display a brief progress message...
	printf '%s' 'please wait, building help...'
	typeset grouplist=$(mktemp /tmp/grouplist.XXXX)
	typeset func
	for func in $(typeset_functions); do
		typeset group="$(typeset -f $func | metafor group)"
		if [ -z "$group" ]; then
			group='misc'
		fi
		typeset about="$(typeset -f $func | metafor about)"
		letterpress "$about" $func >> $grouplist.$group
		echo $grouplist.$group >> $grouplist
	done
	# clear progress message
	printf '\r%s\n' '                              '
	typeset group
	typeset gfile
	for gfile in $(cat $grouplist | sort | uniq); do
		printf '%s\n' "${gfile##*.}:"
		cat $gfile
		printf '\n'
		rm $gfile 2> /dev/null
	done | less
	rm $grouplist 2> /dev/null
}
