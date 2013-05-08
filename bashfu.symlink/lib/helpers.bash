# Helper function loading various enable-able files
function _load_bashfu_files() {
	file_type="$1"
	FILES="${BASHFU}/${file_type}/enabled/*.bash"
	for config_file in $FILES; do
		if [ -e "${config_file}" ]; then
			source $config_file
		fi
	done
}

# Function for reloading aliases
function reload_aliases() {
	_load_bashfu_files "aliases"
}

# Function for reloading auto-completion
function reload_completion() {
	_load_bashfu_files "completion"
}

# Function for reloading plugins
function reload_plugins() {
	_load_bashfu_files "plugins"
}

all_groups () {
	about 'displays all unique metadata groups'
	group 'lib'

	typeset func
	typeset file=$(mktemp /tmp/composure.XXXX)
	for func in $(typeset_functions); do
		typeset -f $func | metafor group >> $file
	done
	cat $file | sort | uniq
	rm $file
}
