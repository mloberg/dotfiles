function reveal --description "Decrypt file with GPG" -a file
    test ! -f "$file" && echo "Usage: reveal <file>" >&2 && return 1
    gpg --decrypt --output $(string replace ".enc" "" $file) $file
end
