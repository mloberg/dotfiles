command -v go &>/dev/null || return

export GOROOT=${GOROOT:-$(go env | grep GOROOT | cut -d'"' -f2)}
export GOPATH=${GOPATH:-"$HOME/go"}
export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"
