export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

conceal() {
    [ -f "$1" ] || (echo "missing file: $1" >&2 && exit 1)
    gpg --encrypt --armor -r 0x94198293CE984D05 --output "$1.enc" "$1"
}

reveal() {
    [ -f "$1" ] || (echo "missing file: $1" >&2 && exit 1)
    gpg --decrypt --output "${1%.enc}" "$1"
}
