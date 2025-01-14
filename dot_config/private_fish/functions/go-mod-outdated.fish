function go-mod-outdated --description "List outdated modules in go.mod"
    go list -m -u -json all | jq -rs '.[] | select(.Indirect | not) | select(.Main | not) | select(.Update) | .Path + " " + .Version + " => " + .Update.Version'
end
