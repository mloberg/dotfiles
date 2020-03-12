dotenv() {
    action="${1:-load}"
    envfile="${2:-${ENV_FILE:-.env}}"
    [ "$*" =~ "-h" ] && action=help

    echo "$action $envfile"

    if [ "$action" == "load" ]; then
        set -a
        source "$envfile"
        set +a
    elif [ "$action" == "unload" ]; then
        while read -r line; do
            unset $line
        done < <(grep -Eow "^(export )?([A-Z0-9_]+)" .env | sed 's/export //g')
    else
        cat <<EOF
NAME
    $0 -- load .env files

SYNOPSIS
    $0
    $0 load
    $0 load .env.local
    $0 unload
    $0 unload .env.local
EOF
    fi
}

# TODO: safe autoload
# _dotenv_load_hook() {
#     envfile="${ENV_FILE:-.env}"
#     [ -f "$envfile" ] && dotenv load "$envfile"
# }

# typeset -ag chpwd_functions
# if [[ -z ${chpwd_functions[(r)_dotenv_load_hook]} ]]; then
#     chpwd_functions=( _dotenv_load_hook ${chpwd_functions[@]} )
# fi
