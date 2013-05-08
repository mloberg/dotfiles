#!/usr/bin/env bash

BASHFU_VERSION="1.0.0"

# Reload Library
alias reload='source ~/.bash_profile'

# Load composure first, so we support function metadata
source "${BASHFU}/lib/composure.sh"

# Load colors first so they can be use in base theme
source "${BASHFU}/themes/colors.bash"
source "${BASHFU}/themes/base.bash"

# Load the theme
if [[ $BASHFU_THEME ]]; then
	source "$BASHFU/themes/$BASHFU_THEME.theme.bash"
fi

# library
LIB="${BASHFU}/lib/*.bash"
for config_file in $LIB; do
	source $config_file
done

# Load enabled aliases, completions, plugins
for file_type in "aliases" "completion" "plugins"; do
	_load_bashfu_files $file_type
done

# Adding Support for other OSes
PREVIEW="less"
[ -s /usr/bin/gloobus-preview ] && PREVIEW="gloobus-preview"
[ -s /Applications/Preview.app ] && PREVIEW="/Applications/Preview.app"

# Load all the Jekyll stuff
if [ -e $HOME/.jekyllconfig ]; then
	. $HOME/.jekyllconfig
fi

#
# Custom Help

function bashfu() {
	echo "Welcome to Bashfu!"
	echo "version $BASHFU_VERSION"
	echo
	echo "Need help?"
	echo
	echo "  rails-help                list out all aliases you can use with rails."
	echo "  git-help                  list out all aliases you can use with git."
	echo "  brew-help                 list out all aliases you can use with Homebrew"
	echo "  aliases-help              generic list of aliases."
	echo "  plugins-help              list out all bashfu functions"
	echo "  bashfu-plugins            summarize plugins, and their installation status"
	echo "  bashfu-aliases            summarize aliases, and their installation status"
	echo "  bashfu-completion         summarize completion, and their installation status"
	echo "  reference <function name> detailed help for a specific function"
	echo
}
