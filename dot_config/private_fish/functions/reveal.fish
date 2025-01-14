function reveal
    set -l file $argv[1]
    test -z "$file" && echo "Usage: reveal <file>" >&2 && return 1
    gpg --decrypt --output $(string replace ".enc" "" $file) $file
end
