function repo --description "Checkout to a repository, cloning it if it doesn't exist" -a repo
    test -z "$repo" && echo "usage: repo <repo>" >&2 && return 1
    test -n "$SRC" || set -l SRC ~/src
    test -n "$GITHUB_ORG" || set -l GITHUB_ORG "ivorisoutdoors"

    string match "*/*" $repo || set -l repo "$GITHUB_ORG/$repo"
    set -l dir "$SRC/$(basename $repo)"

    test -d $dir || gh repo clone $repo $dir -- $argv[2..]
    cd $dir
end
