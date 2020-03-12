alias po="p open"

p() {
    cmd="cd"
    project="$1"

    if [ "$*" =~ "-h" ]; then
        cat <<EOF
NAME
    $0 -- shortcuts for navigating between projects

SYNOPSIS
    $0 add [alias] [directory]
    $0 open [alias]
    $0 [alias]
EOF
        return
    fi

    if [ "$project" == "add" ]; then
        project_alias="$2"
        project_path="${3:-$PWD}"

        if [ -z "$project_alias" ]; then
            (>&2 echo "Missing alias")
            return 1
        fi

        echo "$project_alias:$project_path" >> "$HOME/.projects"
        return
    fi

    if [ "$project" == "open" ]; then
        cmd="code"
        project="$2"
    fi

    while read -r line; do
        if [ "$project" == "${line%:*}" ]; then
            project="${line##*:}"
            break
        fi
    done < "$HOME/.projects"

    [ -d "$project" ] || "$HOME/src/$project"

    $cmd "$project"
}

_p () {
    typeset -a projects
    while read -r line; do
        projects+=("${line%:*}")
    done < "$HOME/.projects"

    compadd ${projects:t}
}
compdef _p p
