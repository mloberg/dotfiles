export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

alias gpg=gpg2
alias gpg-not-responding="gpgconf --kill gpg-agent"

conceal() {
    [ -f "$1" ] || (echo "missing file: $1" >&2 && exit 1)
    gpg --encrypt --armor -r 0x2355A228A9F1D6CF --output "$1.enc" "$1"
}

reveal() {
    [ -f "$1" ] || (echo "missing file: $1" >&2 && exit 1)
    gpg --decrypt --output "${1%.enc}" "$1"
}
