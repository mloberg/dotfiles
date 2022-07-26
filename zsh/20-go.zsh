export GOPATH=${GOPATH:-"$HOME/go"}
export PATH="${GOPATH}/bin:$PATH"

alias go-mod-outdated="go list -m -u -json all | jq -rs '.[] | select(.Indirect | not) | select(.Main | not) | select(.Update) | .Path + \" \" + .Version + \" => \" + .Update.Version'"
