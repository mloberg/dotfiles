function conceal --description "Encrypt file with GPG" -a file
    test ! -f "$file" && echo "Usage: conceal <file>" >&2 && return 1
    gpg --encrypt --armor -r 0x94198293CE984D05 --output $file.enc $file
end
