function go-histogram
    go list -json ./... | jq -rc '[(.GoFiles | length | tostring), .ImportPath] | join("\t")'
end
