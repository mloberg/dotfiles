function bak --description "Create or restore a backup file" -a file
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
