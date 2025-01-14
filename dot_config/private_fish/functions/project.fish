function project -a cmd -a query
    test -n "$SRC" || set -l SRC ~/src

    set -l dir "$(fd --type d --base-directory "$SRC" --max-depth 2 --unrestricted --glob .git --strip-cwd-prefix -x dirname | fzf --select-1 --query "$query")"
    [ -n "$dir" ] || return
    $cmd "$SRC/$dir"
end
