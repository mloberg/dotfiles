function bak
    set -l file $argv[1]
    test -z "$file" && echo "Usage: bak <file>" >&2 && return 1

    # if the file already ends with .bak, remove it
    if string match '*.bak' $file >/dev/null
        mv $file (string replace ".bak" "" $file)
    else if test -f $file.bak
        mv $file.bak $file
    else
        mv $file $file.bak
    end
end
