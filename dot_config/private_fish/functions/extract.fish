function extract --description "Extract archive" -a file
    test ! -f "$file" && echo "Usage: extract <file>" >&2 && return 1

    switch "$file"
        case "*.tar.gz" "*.tgz"
            tar zxvf "$file" $argv[2..]
        case "*.tar.bz2" "*.tbz" "*.tbz2"
            tar xvjf "$file" $argv[2..]
        case "*.tar"
            tar xvf "$file" $argv[2..]
        case "*.gz"
            gunzip "$file" $argv[2..]
        case "*.zip"
            unzip "$file" $argv[2..]
        case "*"
            echo "Unable to extract $file" >&2
            return 1
    end
end
