function project
    set -l cmd "$argv[1]"
    set -l query "$argv[2]"

    set -l dir "$(fd --type d --base-directory ~/src --max-depth 2 --unrestricted --glob .git --strip-cwd-prefix -x dirname | fzf --select-1 --query "$query")"
    [ -n "$dir" ] || return
    $cmd ~/src/$dir
end

abbr -a c project code
abbr -a p project cd
abbr -a o project open
