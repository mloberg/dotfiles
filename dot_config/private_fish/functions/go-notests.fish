function go-notests --description "Show packages without any tests"
    go list -json ./... | jq -rc 'select(((.TestGoFiles + .XTestGoFiles) | length)==0) | .ImportPath'
end
