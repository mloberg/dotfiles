export GOPATH=${GOPATH:-"$HOME/go"}
export PATH="${GOPATH}/bin:$PATH"

alias go-mod-outdated="go list -m -u -json all | jq -rs '.[] | select(.Indirect | not) | select(.Main | not) | select(.Update) | .Path + \" \" + .Version + \" => \" + .Update.Version'"
alias go-histogram="go list -json ./... | jq -rc '[.ImportPath, (.GoFiles | length | tostring)] | join(\" \")' | perl -lane 'print (\" \" x (20 - \$F[1]), \"=\" x \$F[1], \" \", \$F[1], \"\t\", \$F[0])'"
alias go-notests="go list -json ./... | jq -rc 'select((.TestGoFiles | length)==0) | .ImportPath'"
