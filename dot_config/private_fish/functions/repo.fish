function repo
    set -l repo $argv[1]
    test -n "$SRC" || set -l SRC ~/src

    if test -z "$repo"
        echo "usage: repo <repo>" >&2
        return 1
    end

    string match "*/*" $repo || set -l repo "articulate/$repo"

    set -l dir "$SRC/$(basename $repo)"

    test -d $dir || gh repo clone $repo $dir -- $argv[2..]
    cd $dir
end
