# Path to bash it configuration
if [ -z "$BASH_IT" ]; then
    export BASH_IT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/bash_it.symlink"
fi

alias reload='source ~/.bash_profile'

# Load composure first, so we support function metadata
source "${BASH_IT}/lib/composure.sh"

# support 'plumbing' metadata
cite _about _param _example _group _author _version

# Library
LIB="${BASH_IT}/lib/*.bash"
for config_file in $LIB; do
    source $config_file
done

# Load enabled aliases, completion, and plugins
for file_type in "aliases" "completion" "plugins"; do
    _load_bash_it_files $file_type
done

unset config_file

# Adding Support for other OSes
PREVIEW="less"
[ -s /usr/bin/gloobus-preview ] && PREVIEW="gloobus-preview"
[ -s /Applications/Preview.app ] && PREVIEW="/Applications/Preview.app"
